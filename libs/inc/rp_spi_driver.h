#ifndef RP_SPI_DRIVER_H
#define RP_SPI_DRIVER_H

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include <errno.h>
#include <string.h>
#include <linux/spi/spidev.h>
#include <linux/types.h>
#include "rp.h"

// Chip select pins
#define SPI_CS1         RP_DIO7_P       // pin 17
#define SPI_CS2         RP_DIO6_N       // pin 16

#define CS_PIN_COUNT    2

int init_spi(int *spi_fd);
int release_spi(uint8_t spi_fd);
int write_char_spi(uint8_t spi_fd, char *write_buffer, int size);
int write_u32_spi(uint8_t spi_fd, uint32_t data);
int write_u32_order_spi(uint8_t spi_fd, rp_dpin_t cs_pin, uint32_t data);
#endif
