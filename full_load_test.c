#include <stdio.h>
#include <stdint.h>

#include "inc/adf4351_spi_driver.h"

int main()
{
    ADF4351_t vals;
    ADF4351_settings_t settings;
    ADF4351_register_t regs;

    // set 100.154 MHz
    // Warning - this sets output to full +5 dBm power.
    Pll_ADF4351_set_frequency(40000000, &vals);             // calculate values
    Pll_ADF4351_show_RF_settings(&vals);                    // show calculated values
    Pll_ADF4351_load_default_settings(&settings);           // load default settings
    Pll_ADF4351_fill_registers(&vals, &settings, &regs);    // fill registers with data

    Pll_ADF4351_display_registers_hex(&regs);               // Display registers
}