#include <stdio.h>
#include <stdint.h>

#include "inc/adf4351_spi_driver.h"

int main()
{
    ADF4351_t data_struct;
    
    // set 100.154 MHz
    Pll_ADF4351_set_frequency(100154000, &data_struct);
    Pll_ADF4351_show_RF_settings(&data_struct);

    // set 100.1545 MHz
    Pll_ADF4351_set_frequency(100154500, &data_struct);
    Pll_ADF4351_show_RF_settings(&data_struct);

    // set 40.001 MHz
    Pll_ADF4351_set_frequency(40001000, &data_struct);
    Pll_ADF4351_show_RF_settings(&data_struct);
    
    // set 40.021 MHz
    Pll_ADF4351_set_frequency(40021000, &data_struct);
    Pll_ADF4351_show_RF_settings(&data_struct);

    // set 2040.021 MHz
    Pll_ADF4351_set_frequency(2040021000, &data_struct);
    Pll_ADF4351_show_RF_settings(&data_struct);


    /* OUTPUT
    
    RF_Settings: INT: 256, FRAC: 1232, MOD: 3125, PFD: 25000000, r_DIV: 1, o_DIV: 64
    Resulting frequency: 100154000.000000
    
    RF_Settings: INT: 256, FRAC: 1236, MOD: 3125, PFD: 25000000, r_DIV: 1, o_DIV: 64
    Resulting frequency: 100154500.000000
    
    RF_Settings: INT: 102, FRAC: 1258, MOD: 3125, PFD: 25000000, r_DIV: 1, o_DIV: 64
    Resulting frequency: 40001000.000000
    
    RF_Settings: INT: 102, FRAC: 1418, MOD: 3125, PFD: 25000000, r_DIV: 1, o_DIV: 64
    Resulting frequency: 40021000.000000
    
    RF_Settings: INT: 5222, FRAC: 1418, MOD: 3125, PFD: 25000000, r_DIV: 1, o_DIV: 64
    Resulting frequency: 2040021000.000000

    */

    return 0;
}
