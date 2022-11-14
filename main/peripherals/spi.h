#ifndef SPI_H_INCLUDED
#define SPI_H_INCLUDED

#include <stddef.h>
#include <stdint.h>

void spi_init_slave_bitbang();
int8_t spi_slave_exchange_bitbang(int8_t send);
uint8_t crc8_ccitt(const void *data, size_t size);

#endif