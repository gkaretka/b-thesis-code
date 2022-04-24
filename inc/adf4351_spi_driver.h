#ifndef ADF4351_SPI_DRIVER_H
#define ADF4351_SPI_DRIVER_H

#include <stdint.h>
#include <stdio.h>
#include <math.h>

typedef struct {
    uint32_t INT;
    uint32_t FRAC;
    uint32_t MOD;
    uint32_t PFD;
    uint32_t r_DIV;
    uint32_t o_DIV;
} ADF4351_t;

void Pll_ADF4351_show_RF_settings(ADF4351_t *data_struct);
void Pll_ADF4351_set_frequency(uint64_t freq_out, ADF4351_t *data_struct);

#endif