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

int init_spi(int *spi_fd);
int release_spi(uint8_t spi_fd);
int write_char_spi(uint8_t spi_fd, char *write_buffer, int size);
int write_u32_spi(uint8_t spi_fd, uint32_t data);
int write_u32_order_spi(uint8_t spi_fd, uint32_t data);

#endif