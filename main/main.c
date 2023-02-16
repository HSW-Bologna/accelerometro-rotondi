#include "../components/I2C/i2c_common/i2c_common.h"
#include "../components/I2C/i2c_devices/accelerometer/WSEN_ITDS/wsen_itds.h"
#include "../components/I2C/i2c_ports/PIC/i2c_bitbang.h"

#include "gel/timer/timecheck.h"
#include "peripherals/hardwareprofile.h"
#include "peripherals/heartbit.h"
#include "peripherals/i2c.h"
#include "peripherals/spi.h"
#include "peripherals/system.h"
#include "peripherals/timer.h"

#define delay_ms(x) __delay32(((x * FCY) / 1000L)) // delays x ms

/*
 PORTx for input
 LATx for ouput
 TRISx for input/output --> full duplex

 scrivere tre valori fissi
 scrivere i valori presi dall'accellerometro
 master mi dice bene inizia la connessione
 io come slave me ne accorgo
 leggo il codice comando
 rispondo correttamente
 */

/* 
 NOTE
 le lettura di piu' registri sembra creare problemi, legge valori non corretti
 mentre la lettura registro per registro funziona correttamente
 l'accelerometro restituisce valori in complemento a due 14 bit, noi abbiamo
 bisogno solo dei valori positivi quindi utilizziamo solo 13 bit (in caso di 
 negativo si fa la conversione)
 l'offset rischia di portare i valori negativi quindi viene impostato 0 come
 minimo possibile
 il calcolo della media dei massimi e' piuttosto lento, ridurre il numero di 
 letture o ridurre il tempo tra una lettura e la successiva
 attualmente la media si aggiorna in maniera progressiva, chiedere se invece
 deve aggiornarsi in batch
 */

int16_t min16(int16_t n1, int16_t n2) {
    if (n1 < n2)
        return n1;
    return n2;
}

int abs(int x) {
    if (x < 0)
        return -x;
    else
        return x;
}

#define COORDS_MAX_LOCAL 20
#define COORDS_MAX_OFFSET 100
#define COORDS_ROWS 10
#define COORDS_COLS 3
#define MEMS_VALUE_FACTOR 4
const i2c_driver_t wsen_itds_driver = {.device_address = 0x32,
    .i2c_transfer = i2c_port_transfer};
int16_t coords_mean[COORDS_COLS] = {0, 0, 0};
int16_t coords[COORDS_COLS] = {0, 0, 0};
int16_t coords_offset[COORDS_COLS] = {0, 0, 0};
int16_t coords_mem_offset[COORDS_MAX_OFFSET][COORDS_COLS] = {
    {0, 0, 0}};
int16_t coords_max[COORDS_COLS] = {0, 0, 0};
int16_t curr_row = 0;
int16_t coords_mem[COORDS_ROWS][COORDS_COLS] = {
    {0, 0, 0}};
int64_t coords_sum[3];
int8_t f_reset_coords_max = 0, f_update_scale = 0, f_offset = 0;
int16_t coords_count = 0, coords_local_count = 0, coords_offset_count = 0;
int8_t scale_to_change = 0;

void reset_coords_max() {
    f_reset_coords_max = 0;
    int i;
    for (i = 0; i < COORDS_COLS; i++) {
        coords_max[i] = 0;
    }
}

int update_full_scale(i2c_driver_t driver, int8_t value) {
    int err, i;
    f_update_scale = 0;
    reset_coords_max();

    // if it was reading the offset , restart reading
    if (f_offset) {
        coords_offset_count = 0;
    } else // reset offset
    {
        for (i = 0; i < COORDS_COLS; i++) {
            coords_offset[i] = 0;
        }
    }

    switch (value) {
        case 2:
            err = wsen_itds_set_full_scale_2(driver);
            break;
        case 4:
            err = wsen_itds_set_full_scale_4(driver);
            break;
        case 8:
            err = wsen_itds_set_full_scale_8(driver);
            break;
        default:
            err = 1;
            break;
    }

    return err;
}

int main(void) {
    system_init();
    timer_init();
    heartbit_init();
    i2c_init(3);
    spi_init_slave_bitbang();

    wsen_itds_init(wsen_itds_driver);

    uint8_t devid;
    i2c_read_register(wsen_itds_driver, 0x20, &devid, 1);

    delay_ms(100);

    int res, off;
    int i, j;

    HAP_ABIL_LAT = 0;
    for (i = 0; i < COORDS_ROWS; i++)
        for (j = 0; j < COORDS_COLS; j++)
            coords_mem[i][j] = 0;

    for (;;) {
        heartbit_manage();

        if (f_reset_coords_max)
            reset_coords_max();
        if (f_update_scale) {
            update_full_scale(wsen_itds_driver, scale_to_change);
        }

        if (HAP_CS2_PORT == 1 && f_timer == 1) {
            f_timer = 0;
            res = wsen_itds_get_all_coords(wsen_itds_driver, coords);
            if (!res) {
                for (i = 0; i < COORDS_COLS; i++) {
                    if (f_offset)
                        coords_mem_offset[coords_offset_count][i] = coords[i];
                    else
                        coords[i] -= coords_offset[i];
                    
                    // can't be negative
                    if (coords[i] < 0)
                        coords[i] = 0;

                    if (coords[i] > coords_max[i])
                        coords_max[i] = coords[i];

                }

                if (f_offset) {
                    coords_offset_count++;
                    if (coords_offset_count >= COORDS_MAX_OFFSET) {
                        f_offset = 0;
                        long avg[3] = {0, 0, 0};
                        for (i = 0; i < COORDS_MAX_OFFSET; i++) {
                            for (j = 0; j < COORDS_COLS; j++)
                                avg[j] += coords_mem_offset[i][j];
                        }
                        for (i = 0; i < COORDS_COLS; i++)
                            coords_offset[i] = avg[i] / COORDS_MAX_OFFSET;
                        coords_offset_count = 0;

                        Nop();
                        Nop();
                        Nop();
                    }
                }

                coords_local_count++;
                if (coords_local_count == COORDS_MAX_LOCAL) {
                    coords_local_count = 0;

                    if (coords_count < COORDS_ROWS) {
                        coords_count++;
                    }

                    for (i = 0; i < COORDS_COLS; i++) {
                        off = curr_row * COORDS_COLS + i;
                        curr_row = (curr_row + 1) % COORDS_ROWS;
                        coords_sum[i] -= coords_mem[curr_row][i];
                        coords_mem[curr_row][i] = coords_max[i];
                        coords_sum[i] += (int64_t) coords_max[i];
                        coords_mean[i] = ((int64_t) coords_sum[i] /
                                (int64_t) min16(coords_count, COORDS_ROWS));
                        coords_mean[i] /= MEMS_VALUE_FACTOR;

                        coords_max[i] = 0;
                    }
                    
                    uint16_t inversion_buffer = coords_mean[0];
                    coords_mean[0] = coords_mean[1];
                    coords_mean[1] = inversion_buffer;

                    Nop();
                    Nop();
                    Nop();
                }
            }else {
                Nop();
                    Nop();
                    Nop();
            }
        }

        Idle(); // Also clears WDT
    }

    return 0;
}

void __attribute((interrupt, auto_psv)) _IOCInterrupt() {
    Nop();
    Nop();
    Nop();

    if (HAP_CS2_PORT == 0) {
        int8_t res = spi_slave_exchange_bitbang(0xAA); // xchg_spi(0xAA);
        Nop();
        Nop();
        Nop();
        if (res == 0x01) {
            // Rispondo con la media dei valori massimi
            HAP_ABIL_LAT = 1;
            int8_t crc = (int8_t) crc8_ccitt((int8_t *) coords_mean, 6);
            uint32_t i;
            //            coords[0] = 0x10C0;
            for (i = 0; i < 3; i++) {
                spi_slave_exchange_bitbang(coords_mean[i] & 0xFF);
                spi_slave_exchange_bitbang((coords_mean[i] >> 8) & 0xFF);
            }
            spi_slave_exchange_bitbang(crc);
        } else if (res == 0x02) {
            f_reset_coords_max = 1;
        } else if ((res & 0xF0) == 0xF0) {

            res &= ~0xF0;
            //       cambio di scala e offset
            f_offset = 0;
            f_update_scale = 1;

            if (res == 0) {
                scale_to_change = 2;
            } else if (res == 1) {
                scale_to_change = 4;
            } else if (res == 2) {
                scale_to_change = 8;
            } else if (res == 3) {
                f_offset = 1;
                scale_to_change = 2;
            } else if (res == 4) {
                f_offset = 1;
                scale_to_change = 4;
            } else if (res == 5) {
                f_offset = 1;
                scale_to_change = 8;
            }
        }

        HAP_ABIL_LAT = 0;
        heartbit_communication_received();
        IFS1bits.IOCIF = 0;
    }
}
