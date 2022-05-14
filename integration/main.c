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

#include "../libs/inc/rp_spi_driver.h"
#include "../libs/inc/adf4351_spi_driver.h"
#include "../libs/inc/band_selector_driver.h"

int main(void)
{
    /* Init GPIO peripheral - used for band/filter selection + SPI CS*/
    rp_gpio_init();
    
    /* Init the SPI resources */
    int spi_fd = -1;
    if (init_spi(&spi_fd) < 0)
    {
        printf("Initialization of SPI failed. Error: %s\n", strerror(errno));
        return -1;
    }

    ADF4351_t vals;
    ADF4351_settings_t settings;
    ADF4351_register_t regs;

    // set 40 MHz
    // Warning - this sets output to full +5 dBm power.
    Pll_ADF4351_set_frequency(40000000, &vals);             // calculate values
    Pll_ADF4351_show_RF_settings(&vals);                    // show calculated values
    Pll_ADF4351_load_default_settings(&settings);           // load default settings
    
    // in order to change values access them in this way (example, no need to uncomment)
    // settings.band_sel_clk_div = 80;                      

    // fill in registers
    Pll_ADF4351_fill_registers(&vals, &settings, &regs);    // fill registers with data

    Pll_ADF4351_display_registers_hex(&regs);               // Display registers

    // The right sequence according to datasheet is 5 to 0
    uint32_t *data = &regs.reg5;
    for (int i = REG_COUNT-1; i >= 0; i--) {
        printf("Reg%d: |0x%.6x|\n\r", i, *data);
        if (write_u32_order_spi(spi_fd, SPI_CS1, *data) < 0)                // SPI_CS1 or SPI_CS2
        {
            printf("Write to SPI failed. Error: %s\n", strerror(errno));
            return -1;
        }
        sleep(1);
        data--; // go to next uint32
    }

    /* Release resources */
    if (release_spi(spi_fd) < 0)
    {
        printf("Relase of SPI resources failed, Error: %s\n", strerror(errno));
        return -1;
    }

    select_band(BAND_SW);
    select_filter(IF_FILTER_5MHZ);
    release_gpio_api();

    return 0;
}