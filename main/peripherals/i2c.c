
#include "i2c.h"
#include "hardwareprofile.h"
#include <string.h>

#define HIGH 1
#define LOW 0
#define TRUE 1
#define FALSE 0
#define OUTPUT_PIN 0
#define INPUT_PIN 1
#define WRITE_CB(a) (a & (~1))
#define READ_CB(a) (a | 1)

#define I2C_BITBANG_FIXED_CLOCK_DELAY 5

#ifdef I2C_BITBANG_FIXED_CLOCK_DELAY
#define CLOCK_DELAY I2C_BITBANG_FIXED_CLOCK_DELAY
#else
#define CLOCK_DELAY clock_delay
#endif

static volatile unsigned long clock_delay = 5;

void i2c_init(unsigned int delay) {
  clock_delay = (unsigned long)delay;

  HAP_CLK_TRIS = HAP_OUTPUT_PORT;
  HAP_CLK_LAT = HIGH;

  HAP_SDA_TRIS = HAP_OUTPUT_PORT;
  HAP_SDA_LAT = HIGH;
}

static inline void __attribute__((always_inline))
i2c_clock_tick(unsigned char ck) {
  HAP_CLK_LAT = ck;
  __delay_us(CLOCK_DELAY);
}

static void i2c_start_condition() {
  HAP_SDA_TRIS = OUTPUT_PIN;
  HAP_SDA_LAT = HIGH;
  __delay_us(CLOCK_DELAY);
  HAP_CLK_LAT = HIGH;
  __delay_us(CLOCK_DELAY);
  HAP_SDA_LAT = LOW;
  __delay_us(CLOCK_DELAY);
}

static void i2c_restart_condition() {
  HAP_SDA_TRIS = OUTPUT_PIN;
  HAP_SDA_LAT = HIGH;
  HAP_CLK_LAT = HIGH;
  HAP_SDA_LAT = LOW;
}

static void i2c_stop_condition() {
  HAP_SDA_TRIS = OUTPUT_PIN; // 1;      /* dati in uscita dal micro */
  HAP_SDA_LAT = 0;           /* stop condition                       */
  i2c_clock_tick(HIGH);
  HAP_SDA_LAT = 1; /* stop condition                       */
  i2c_clock_tick(LOW);
  i2c_clock_tick(HIGH);
}

static void i2c_write_byte(uint8_t byte) {
  int x = 0;
  HAP_SDA_TRIS = OUTPUT_PIN;
  for (x = 0; x < 8; x++) {
    i2c_clock_tick(LOW);
    HAP_SDA_LAT = (byte >> (7 - x)) & 0x01;
    __delay_us(1);
    i2c_clock_tick(HIGH);
  }
}

static char masterRead() {
  HAP_SDA_TRIS = INPUT_PIN; // 0;  /* dati in ingesso                      */
  int i = 0;
  unsigned char byte = 0;
  for (i = 0; i < 8; i++) {
    i2c_clock_tick(1);
    byte = (byte << 1) | HAP_SDA_PORT; // HAP_SDA_LAT; /* dato in input */
    i2c_clock_tick(0);
  }

  return byte;
}

static void writeAck(char ack) {
  HAP_SDA_TRIS = OUTPUT_PIN; // 1;  /* dati in uscita dal micro             */
  HAP_SDA_LAT = ack;         /* invia ack                            */
  i2c_clock_tick(1);
  i2c_clock_tick(0);
}

static char readAck() {
  unsigned char x;
  i2c_clock_tick(0);
  HAP_SDA_LAT = 1; // Set Nack
  HAP_SDA_TRIS = INPUT_PIN;
  i2c_clock_tick(1);
  x = HAP_SDA_PORT; // HAP_SDA_LAT;
  i2c_clock_tick(0);
  __delay_us(1);
  return x;
}

int i2c_findaddress() {
  int found_counter = 0;
  unsigned int i = 0;
  unsigned char i2caddr = 0;
  //    disableInt();
  Nop();
  Nop();
  Nop();

  for (i = 0; i <= 0xFC; i += 2) {
    i2c_start_condition();

    i2caddr = (unsigned char)i;

    i2c_write_byte(i);

    if (readAck() == 0) {
      found_counter++;
      Nop();
      Nop();
      Nop();
    } else {
      Nop();
      Nop();
      Nop();
    }
    i2c_stop_condition();
  }

  //    enableInt();
  return found_counter;
}

int i2c_port_transfer(uint8_t devaddr, uint8_t *writebuf, size_t writelen,
                      uint8_t *readbuf, size_t readlen, void *arg) {
  unsigned int counter;
  (void)arg;

  if (writebuf != NULL && writelen > 0) {
    unsigned int y;
    counter = 0;

    do {
      counter++;
      i2c_start_condition();
      i2c_write_byte(WRITE_CB(devaddr));
      if (readAck() != 0) {
        continue;
      }

      else
        break;
    } while (counter <= 10);

    if (counter > 10) {
      return -1;
    }

    for (y = 0; y < writelen; y++) {
      i2c_write_byte(writebuf[y]);

      if (readAck() != 0) {
        return -1;
      }
    }

    i2c_stop_condition();
    // pic_i2c_bitbang_port_ack_polling(devaddr);
  }

  if (readbuf != NULL && readlen > 0) {

    unsigned int y;
    counter = 0;

    do {
      counter++;
      i2c_start_condition();
      i2c_write_byte(READ_CB(devaddr));
      if (readAck() != 0) {
        continue;
      }

      else
        break;
    } while (counter <= 10);

    if (counter > 10)
      return -1;

    /*--------------------------------------------------------------*/
    /* Legge la ram del dispositivo                                 */
    /*--------------------------------------------------------------*/

    for (y = 0; y < readlen; y++) {
      if (y == readlen - 1) {
        readbuf[y] = masterRead();
        writeAck(1);
      } else {
        readbuf[y] = masterRead();
        writeAck(0);
      }
    }

    i2c_stop_condition();
  }
  return (0);
}
