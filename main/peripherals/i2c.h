#ifndef I2C_H_INCLUDED
#define I2C_H_INCLUDED

#include <stddef.h>
#include <stdint.h>

int i2c_port_transfer(uint8_t devaddr, uint8_t *writebuf, size_t writelen, uint8_t *readbuf, size_t readlen, void *arg);

#endif