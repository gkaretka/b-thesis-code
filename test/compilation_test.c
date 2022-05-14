#include <stdio.h>
#include <stdint.h>

#include "../libs/inc/adf4351_spi_driver.h"

int main()
{
    ADF4351_t data_struct;

    // set 100 MHz
    Pll_ADF4351_set_frequency(100000000, &data_struct);
    Pll_ADF4351_show_RF_settings(&data_struct);
    Pll_ADF4351_evaluate_frequency_show(100000000, &data_struct);

    // set 100.154 MHz
    Pll_ADF4351_set_frequency(100154000, &data_struct);
    Pll_ADF4351_show_RF_settings(&data_struct);
    Pll_ADF4351_evaluate_frequency_show(100154000, &data_struct);

    // set 100.1545 MHz
    Pll_ADF4351_set_frequency(100154500, &data_struct);
    Pll_ADF4351_show_RF_settings(&data_struct);
    Pll_ADF4351_evaluate_frequency_show(100154500, &data_struct);

    // set 40.001 MHz
    Pll_ADF4351_set_frequency(40001000, &data_struct);
    Pll_ADF4351_show_RF_settings(&data_struct);
    Pll_ADF4351_evaluate_frequency_show(40001000, &data_struct);
    
    // set 40.021 MHz
    Pll_ADF4351_set_frequency(40021000, &data_struct);
    Pll_ADF4351_show_RF_settings(&data_struct);
    Pll_ADF4351_evaluate_frequency_show(40021000, &data_struct);

    // set 2040.021 MHz
    Pll_ADF4351_set_frequency(2040021000, &data_struct);
    Pll_ADF4351_show_RF_settings(&data_struct);
    Pll_ADF4351_evaluate_frequency_show(2040021000, &data_struct);

    // set 100.1546 MHz
    Pll_ADF4351_set_frequency(100154600, &data_struct);
    Pll_ADF4351_show_RF_settings(&data_struct);
    Pll_ADF4351_evaluate_frequency_show(100154600, &data_struct);

    /* OUTPUT

    RF_Settings: INT: 640, FRAC: 616, MOD: 625, PFD: 10000000, r_DIV: 1, o_DIV: 64
    Resulting frequency: 100154000.000000
    Frequency deviation [Hz]: 0
    
    RF_Settings: INT: 640, FRAC: 618, MOD: 625, PFD: 10000000, r_DIV: 1, o_DIV: 64
    Resulting frequency: 100154500.000000
    Frequency deviation [Hz]: 0
    
    RF_Settings: INT: 256, FRAC: 4, MOD: 625, PFD: 10000000, r_DIV: 1, o_DIV: 64
    Resulting frequency: 40001000.000000
    Frequency deviation [Hz]: 0
    
    RF_Settings: INT: 256, FRAC: 84, MOD: 625, PFD: 10000000, r_DIV: 1, o_DIV: 64
    Resulting frequency: 40021000.000000
    Frequency deviation [Hz]: 0
    
    RF_Settings: INT: 13056, FRAC: 84, MOD: 625, PFD: 10000000, r_DIV: 1, o_DIV: 64
    Resulting frequency: 2040021000.000000
    Frequency deviation [Hz]: 0
    
    RF_Settings: INT: 640, FRAC: 3092, MOD: 3125, PFD: 10000000, r_DIV: 1, o_DIV: 64
    Resulting frequency: 100154600.000000
    Frequency deviation [Hz]: 1
    
    */

    return 0;
}
