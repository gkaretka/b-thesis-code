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
#define PRESCISION 100000
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
        printf("Trying out divider: %lf\n\r", out_divider);

        N = ((double)freq_out / _f_pfd) * out_divider;
        INT = floor(N);

        out_div_pointer--;
    }

    printf("N: %lf, INT: %lf \n\r", N, INT);

    double MOD = N - INT;
    printf("MOD %lf \n\r", MOD);

    uint64_t gcd;
    double precision = PRESCISION;
    uint64_t tN;
    do
    {
        tN = (uint64_t)round(MOD * precision);
        printf("tN %lld \n\r", tN);

        for (uint64_t i = 1; i <= tN && i <= MOD_MAX; ++i)
        {
            if (tN % i == 0 && MOD_MAX % i == 0)
                gcd = i;
        }
        printf("gcd %lld \n\r", gcd);
        printf("FRAC: %d, MOD: %d\n\r", (tN / gcd), (MOD_MAX / gcd));
        precision /= 10;
    } while ((tN / gcd) > FRAC_MAX || (MOD_MAX / gcd) > MOD_MAX);

    data_struct->r_DIV = 1;           // default div: 1
    data_struct->o_DIV = out_divider; // out divider
    data_struct->FRAC = tN / gcd;     // FRAC reduced by gcd
    data_struct->MOD = MOD_MAX / gcd; // MOD reduced by gcd
    data_struct->INT = (uint64_t)INT; //
    data_struct->PFD = _f_pfd;        // MHz
}

void Pll_ADF4351_show_RF_settings(ADF4351_t *data_struct)
{
    printf("RF_Settings: INT: %d, FRAC: %d, MOD: %d, PFD: %d, r_DIV: %d, o_DIV: %d\n\r",
           data_struct->INT, data_struct->FRAC, data_struct->MOD,
           data_struct->PFD, data_struct->r_DIV, data_struct->o_DIV);
    printf("Resulting frequency: %lf \n\r", (((double)data_struct->INT + ((double)data_struct->FRAC / (double)data_struct->MOD))
                                             * (double)data_struct->PFD) / data_struct->o_DIV);
}