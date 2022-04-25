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



void Pll_ADF4351_fill_registers(ADF4351_t *adf_vals, ADF4351_register_t *adf_regs, ADF4351_settings_t* adf_sett)
{
    uint32_t reg0 = ((adf_vals->INT & 0xFFFF)                   << REG0_INT_OFFSET) 
                  | ((adf_vals->FRAC & 0xFFF)                   << REG0_FRAC_OFFSET)
                  | REG0_CONTROL_BITS;

    uint32_t reg1 = ((adf_sett->phase_adjust & 1)               << REG1_PHASE_ADJUST_OFFSET)
                  | ((adf_sett->prescaler & 1)                  << REG1_PRESCALER_OFFSET)
                  | ((adf_sett->phase_adjust_val & 0xFFF)       << REG1_PHASE_VALUE_OFFSET)
                  | REG1_CONTROL_BITS;
    
    uint32_t reg2 = ((adf_sett->low_noise_low_spurs_mode & 1)   << REG2_LN_LS_MODE_OFFSET)
                  | ((adf_sett->mux_out & 0b111)                << REG2_MUX_OUT_OFFSET)
                  | ((adf_sett->ref_doubler & 1)                << REG2_REF_DOUBLER_OFFSET)
                  | ((adf_sett->ref_divider & 1)                << REG2_REF_DIVIDER_OFFSET)
                  | ((adf_vals->r_DIV & 0x3FF)                  << REG2_R_COUNTER_OFFSET)
                  | ((adf_sett->double_buffer & 1)              << REG2_DOUBLE_BUFF_OFFSET)
                  | ((adf_sett->cp_three_state & 1)             << REG2_CP_SETTINGS_OFFSET)
                  | ((adf_sett->ldf & 1)                        << REG2_LDF_OFFSET)
                  | ((adf_sett->ldp & 1)                        << REG2_LDP_OFFSET)
                  | ((adf_sett->pd_polarity & 1)                << REG2_PD_POLARITY_OFFSET)
                  | ((adf_sett->power_down & 1)                 << REG2_POWER_DOWN_OFFSET)
                  | ((adf_sett->charge_pump_settings & 1)       << REG2_CP_3_STATE_OFFSET)
                  | ((adf_sett->counter_reset & 1)              << REG2_COUNTER_RESET_OFFSET)
                  | REG2_CONTROL_BITS;
    
    uint32_t reg3 = ((adf_sett->band_select_clk_mode & 1)       << REG3_BAND_CLK_MODE_OFFSET)
                  | ((adf_sett->abp & 1)                        << REG3_ABP_MODE_OFFSET)
                  | ((adf_sett->charge_cancel & 1)              << REG3_CHARGE_CANCEL_OFFSET)
                  | ((adf_sett->csr & 1)                        << REG3_CSR_OFFSET)
                  | ((adf_sett->clk_div_mode & 0b11)            << REG3_CLK_DIV_MODE_OFFSET)
                  | ((adf_vals->o_DIV & 0x3FF)                  << REG3_CLK_DIVIDER_OFFSET)
                  | REG3_CONTROL_BITS;
    
    uint32_t reg4 = ((adf_sett->feedback_select & 1)            << REG4_FB_SELECT_OFFSET)
                  | ((adf_sett->rf_divider_select & 0b111)      << REG4_RF_DIV_SEL_OFFSET)
                  | ((adf_sett->band_sel_clk_div & 0xFF)        << REG4_BAND_SELCLK_DIV_OFFSET)
                  | ((adf_sett->vco_power_down & 1)             << REG4_VCO_POWER_DOWN_OFFSET)
                  | ((adf_sett->mtld & 1)                       << REG4_MTLD_OFFSET)
                  | ((adf_sett->aux_out_select & 1)             << REG4_AUX_OUT_SEL_OFFSET)
                  | ((adf_sett->aux_out_enable & 1)             << REG4_AUX_OUT_EN_OFFSET)
                  | ((adf_sett->aux_out_power & 1)              << REG4_AUX_OUT_POWER_OFFSET)
                  | ((adf_sett->rf_out_enable & 1)              << REG4_RF_OUT_EN_OFFSET)
                  | ((adf_sett->out_power & 0b11)               << REG4_OUT_POWER_OFFSET)
                  | REG4_CONTROL_BITS;

    uint32_t reg5 = ((adf_sett->ld_pin_mode & 0b11)             << REG5_LD_PIN_MODE_OFFSET)
                  | REG5_CONTROL_BITS;

    adf_regs->reg0 = reg0;
    adf_regs->reg1 = reg1;
    adf_regs->reg2 = reg2;
    adf_regs->reg3 = reg3;
    adf_regs->reg4 = reg4;
    adf_regs->reg5 = reg5;
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