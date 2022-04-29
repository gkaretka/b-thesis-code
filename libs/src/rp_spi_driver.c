#include "../inc/rp_spi_driver.h"

int init_spi(int *spi_fd)
{
    /* MODES: mode |= SPI_LOOP;         --- NOT WORKING
     *        mode |= SPI_CPHA;
     *        mode |= SPI_CPOL;
     *        mode |= SPI_LSB_FIRST;    --- NOT WORKING
     *        mode |= SPI_CS_HIGH;      --- NOT WORKING
     *        mode |= SPI_3WIRE;        --- NOT WORKING
     *        mode |= SPI_NO_CS;        --- NOT WORKING
     *        mode |= SPI_READY;        --- NOT WORKING
     */
    uint8_t mode = 0;

    /* Opening file stream */
    *spi_fd = open("/dev/spidev1.0", O_WRONLY | O_NOCTTY);

    if (*spi_fd < 0) {
        printf("Error opening spidev0.1. Error: %s\n", strerror(errno));
        return -1;
    }

    /* Setting mode (CPHA, CPOL) */
    if (ioctl(*spi_fd, SPI_IOC_WR_MODE, &mode) < 0) {
        printf("Error setting SPI_IOC_WR_MODE. Error: %s\n", strerror(errno));
        return -1;
    }

    /* Setting SPI bus speed */
    // Only distinct values in MHz: 50.0, 25.0, 12.5, 6.25, 3.125, 1.56, 0.781
    // enter it in Hz 
    int spi_speed = 781000;

    if (ioctl(*spi_fd, SPI_IOC_WR_MAX_SPEED_HZ, &spi_speed) < 0) {
        printf("Error setting SPI_IOC_WR_MAX_SPEED_HZ. Error: %s\n", strerror(errno));
        return -1;
    }

    return 0;
}

int release_spi(uint8_t spi_fd)
{
    /* Release the spi resources */
    close(spi_fd);
    return 0;
}

/* Write data to the SPI bus */
int write_char_spi(uint8_t spi_fd, char *write_buffer, int size)
{
    int write_spi = write(spi_fd, write_buffer, size);

    if (write_spi < 0) {
        printf("Failed to write to SPI. Error: %s\n", strerror(errno));
        return -1;
    }

    return 0;
}

/* Write 32bits to the SPI bus */
int write_u32_spi(uint8_t spi_fd, uint32_t data)
{
    int write_spi = write(spi_fd, &data, 4);

    if (write_spi < 0) {
        printf("Failed to write to SPI. Error: %s\n", strerror(errno));
        return -1;
    }

    return 0;
}