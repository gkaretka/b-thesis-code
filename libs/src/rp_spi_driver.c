#include "../inc/rp_spi_driver.h"

int init_spi(int *spi_fd)
{
    /* Init CS GPIO */
    rp_dpin_t output_pins[] = {SPI_CS1, SPI_CS2};

    for (uint8_t i = 0; i < CS_PIN_COUNT; i++) {
        rp_DpinSetDirection (output_pins[i], RP_OUT);
        rp_DpinSetState(output_pins[i], RP_HIGH);
    }

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

/* Write 32bits to the SPI bus with order */
int write_u32_order_spi(uint8_t spi_fd, rp_dpin_t cs_pin, uint32_t data)
{
    uint32_t _data = 0;
    uint8_t *ptr = ((uint8_t*)&data)+3;
    for (int i = 0 ; i < 4; i++) {
        uint8_t val = *ptr;
        _data |= ((uint32_t)val) << (8 * i);
        ptr--;
    }

    rp_DpinSetState(cs_pin, RP_LOW);            // SET CS LOW
    usleep(10000);                                 // wait 10 us
    int write_spi = write(spi_fd, &_data, 4);   // send 32bit data (register)
    if (write_spi < 0) {
        printf("Failed to write to SPI. Error: %s\n", strerror(errno));
        return -1;
    }

    rp_DpinSetState(cs_pin, RP_HIGH);           // SET CS HIGH
    usleep(10000);
    return 0;
}
