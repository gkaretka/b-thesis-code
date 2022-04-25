#include "inc/adf4351_spi_driver.h"

uint32_t registers[6] = {
    // 40.00MHz @ 25 MHz
    0x330010,  // Register 0
    0x8008029, // 1
    0x4E42,    // 2
    0x4B3,     // 3
    0xEC803C,  // 4
    0x580005   // 5
};

// Reference freq. - 25 MHz
#define REF_IN 25000000.0
#define PRESCISION 1000000
#define MOD_MAX 4095
#define FRAC_MAX 4095

/*
 * uint64_t freq_out         - Desired output frequency [Hz]
 * ADF4351_t *data_struct    - Data structure holding RF data settings
 */
void Pll_ADF4351_set_frequency(uint64_t freq_out, ADF4351_t *data_struct)
{
    double out_divider = 1;
    uint32_t out_dividers[] = {1, 2, 4, 8, 16, 32, 64};

    int8_t out_div_pointer = 6;
    double INT = 0;
    double N = 0;
    double _f_pfd = 0;
    double r_divider = 1;
    while (out_div_pointer >= 0 && (INT < 23 || INT > 65535))
    {
        _f_pfd = REF_IN * 1 / (r_divider);

        out_divider = (double)out_dividers[out_div_pointer];
        N = ((double)freq_out / _f_pfd) * out_divider;
        INT = floor(N);

        out_div_pointer--;
    }

    double MOD = N - INT;

    uint64_t gcd = 0;
    double precision = PRESCISION * 10;
    uint64_t tN = 0;
    do
    {
        tN = (uint64_t)round(MOD * precision);

        for (uint64_t i = 1; i <= tN && i <= (uint64_t)precision; ++i)
        {
            if (tN % i == 0 && (uint64_t)precision % i == 0) gcd = i;
        }
        data_struct->MOD = precision / gcd; // MOD reduced by gcd
        precision -= PRESCISION / 1000;
    } while ((tN / gcd) > FRAC_MAX || (data_struct->MOD / gcd) > FRAC_MAX);

    data_struct->r_DIV = 1;             // default div: 1
    data_struct->o_DIV = out_divider;   // out divider
    data_struct->FRAC = tN / gcd;       // FRAC reduced by gcd
    data_struct->INT = (uint64_t)INT;   //
    data_struct->PFD = _f_pfd;          // MHz
}

uint64_t Pll_ADF4351_resulting_frequency(ADF4351_t *data_struct)
{
    return (uint64_t)(((double)data_struct->INT + ((double)data_struct->FRAC / (double)data_struct->MOD))
                                             * (double)(data_struct->PFD/(double)data_struct->r_DIV) / data_struct->o_DIV);
}

uint64_t Pll_ADF4351_evaluate_frequency(uint64_t freq_set, ADF4351_t *data_struct)
{
    uint64_t freq_res = Pll_ADF4351_resulting_frequency(data_struct);
    if (freq_set > freq_res)
        return freq_set - freq_res;
    else
        return freq_res - freq_set;
}

void Pll_ADF4351_evaluate_frequency_show(uint64_t freq_set, ADF4351_t *data_struct)
{
    printf("Frequency deviation [Hz]: %lld \n\r", Pll_ADF4351_evaluate_frequency(freq_set, data_struct));
}

void Pll_ADF4351_show_RF_settings(ADF4351_t *data_struct)
{
    printf("RF_Settings: INT: %d, FRAC: %d, MOD: %d, PFD: %d, r_DIV: %d, o_DIV: %d\n\r",
           data_struct->INT, data_struct->FRAC, data_struct->MOD,
           data_struct->PFD, data_struct->r_DIV, data_struct->o_DIV);
    printf("Resulting frequency: %lf \n\r", (((double)data_struct->INT + ((double)data_struct->FRAC / (double)data_struct->MOD)) * 
            (double)data_struct->PFD/(double)data_struct->r_DIV) / data_struct->o_DIV);
}