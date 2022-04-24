#include <stdio.h>
#include <stdint.h>

#include "inc/adf4351_spi_driver.h"

int main()
{
    printf("Set 40 MHz, channel spacing 100 Hz\n\r");
    ADF4351_t data_struct;
    
    // set 40 MHz, channel spacing 1000 Hz
    Pll_ADF4351_set_frequency(100154000, &data_struct);
    Pll_ADF4351_show_RF_settings(&data_struct);

    Pll_ADF4351_set_frequency(40001000, &data_struct);
    Pll_ADF4351_show_RF_settings(&data_struct);
    
    return 0;
}
