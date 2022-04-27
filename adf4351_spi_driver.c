#include "inc/adf4351_spi_driver.h"

// simple log2 implementation
uint8_t _log2(uint8_t val)
{
    uint8_t cnt = 0;
    for (;val > 0; val/=2) cnt++;
    return --cnt;
}

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

    data_struct->r_DIV = r_divider;             // default div: 1
    data_struct->o_DIV = out_divider;   // out divider
    data_struct->FRAC = tN / gcd;       // FRAC reduced by gcd
    data_struct->INT = (uint64_t)INT;   //
    data_struct->PFD = _f_pfd;          // MHz
}

void Pll_ADF4351_fill_registers(ADF4351_t *adf_vals, ADF4351_settings_t* adf_sett, ADF4351_register_t *adf_regs)
{
    uint32_t reg0 = ((adf_vals->INT & 0xFFFF)                   << REG0_INT_OFFSET) 
                  | ((adf_vals->FRAC & 0xFFF)                   << REG0_FRAC_OFFSET)
                  | REG0_CONTROL_BITS;

    uint32_t reg1 = ((adf_sett->phase_adjust & 1)               << REG1_PHASE_ADJUST_OFFSET)
                  | ((adf_sett->prescaler & 1)                  << REG1_PRESCALER_OFFSET)
                  | ((adf_sett->phase_adjust_val & 0xFFF)       << REG1_PHASE_VALUE_OFFSET)
                  | ((adf_vals->MOD & 0x3FF)                    << REG1_MOD_OFFSET)
                  | REG1_CONTROL_BITS;
    
    uint32_t reg2 = ((adf_sett->low_noise_low_spurs_mode & 1)   << REG2_LN_LS_MODE_OFFSET)
                  | ((adf_sett->mux_out & 0b111)                << REG2_MUX_OUT_OFFSET)
                  | ((adf_sett->ref_doubler & 1)                << REG2_REF_DOUBLER_OFFSET)
                  | ((adf_sett->ref_divider & 1)                << REG2_REF_DIVIDER_OFFSET)
                  | ((adf_vals->r_DIV & 0x3FF)                  << REG2_R_COUNTER_OFFSET)
                  | ((adf_sett->double_buffer & 1)              << REG2_DOUBLE_BUFF_OFFSET)
                  | ((adf_sett->cp_three_state & 1)             << REG2_CP_3_STATE_OFFSET)
                  | ((adf_sett->ldf & 1)                        << REG2_LDF_OFFSET)
                  | ((adf_sett->ldp & 1)                        << REG2_LDP_OFFSET)
                  | ((adf_sett->pd_polarity & 1)                << REG2_PD_POLARITY_OFFSET)
                  | ((adf_sett->power_down & 1)                 << REG2_POWER_DOWN_OFFSET)
                  | ((adf_sett->charge_pump_settings & 0xF)     << REG2_CP_SETTINGS_OFFSET)
                  | ((adf_sett->counter_reset & 1)              << REG2_COUNTER_RESET_OFFSET)
                  | REG2_CONTROL_BITS;
    
    uint32_t reg3 = ((adf_sett->band_select_clk_mode & 1)       << REG3_BAND_CLK_MODE_OFFSET)
                  | ((adf_sett->abp & 1)                        << REG3_ABP_MODE_OFFSET)
                  | ((adf_sett->charge_cancel & 1)              << REG3_CHARGE_CANCEL_OFFSET)
                  | ((adf_sett->csr & 1)                        << REG3_CSR_OFFSET)
                  | ((adf_sett->clk_div_mode & 0b11)            << REG3_CLK_DIV_MODE_OFFSET)
                  | ((adf_sett->clk_div_val & 0x3FF)            << REG3_CLK_DIVIDER_OFFSET)
                  | REG3_CONTROL_BITS;
    
    uint32_t reg4 = ((adf_sett->feedback_select & 1)            << REG4_FB_SELECT_OFFSET)
                  | ((_log2(adf_vals->o_DIV) & 0b111)           << REG4_RF_DIV_SEL_OFFSET)
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
                  | (0b11                                       << REG5_RESERVED_0_OFFSET)
                  | REG5_CONTROL_BITS;

    adf_regs->reg0 = reg0;
    adf_regs->reg1 = reg1;
    adf_regs->reg2 = reg2;
    adf_regs->reg3 = reg3;
    adf_regs->reg4 = reg4;
    adf_regs->reg5 = reg5;
}

void Pll_ADF4351_load_default_settings(ADF4351_settings_t* adf_sett)
{
    // reg 1 ----------------------------------------------------------------------
    adf_sett->phase_adjust                  = 0;                    // On/Off 1/0
    adf_sett->prescaler                     = 1;                    // 4/5 -> 0
                                                                    // 8/9 -> 1

    adf_sett->phase_adjust_val              = 1;                    // 12-bit phase values (recommended 1)

    // reg 2 ----------------------------------------------------------------------
    adf_sett->low_noise_low_spurs_mode      = LOW_NOISE_MODE;       // LOW NOISE MODE / LOW SPUR MODE
    adf_sett->mux_out                       = THREE_STATE;          // Mux output
    adf_sett->ref_doubler                   = 0;                    // On/Off 1/0
    adf_sett->ref_divider                   = 0;                    // On/Off 1/0 
    adf_sett->double_buffer                 = 0;                    // On/Off 1/0
    adf_sett->charge_pump_settings          = CP_CURRENT_2500_UA;   // See datasheet (default 2.5 mA)
    adf_sett->ldf                           = 0;                    // Integer mode/Fraction mode 1/0
    adf_sett->ldp                           = 0;                    // 10 ns / 6 ns [0/1]
    adf_sett->pd_polarity                   = 1;                    // Positive/Negative 1/0
    adf_sett->power_down                    = 0;                    // On/Off 1/0
    adf_sett->cp_three_state                = 0;                    // On/Off 1/0
    adf_sett->counter_reset                 = 0;                    // On/Off 1/0

    // reg 3 ----------------------------------------------------------------------
    adf_sett->band_select_clk_mode          = 0;                    // Low/High 0/1
    adf_sett->abp                           = 0;                    // ANTIBACKLASH/PULSE WIDTH 6ns 
                                                                    // 6ns (FRAC-N)
                                                                    // 3ns (INT-N)
    adf_sett->charge_cancel                 = 0;                    // On/Off 1/0
    adf_sett->csr                           = 0;                    // CYCLE SLIP REDUCTION On/Off 1/0
    adf_sett->clk_div_mode                  = 0b00;                 /* 0 0 CLOCK DIVIDER OFF
                                                                     * 0 1 FAST LOCK ENABLE
                                                                     * 1 0 RESYNC ENABLE
                                                                     * 1 1 RESERVED */
    adf_sett->clk_div_val                   = 150;                  // Default value from AD software

    // reg 4 ----------------------------------------------------------------------
    adf_sett->feedback_select               = 1;                    // DIVIDED/FUNDAMETAL 0/1 
    adf_sett->band_sel_clk_div              = 200;                  // value from AD software
    adf_sett->vco_power_down                = 0;                    // On/Off 1/0
    adf_sett->mtld                          = 0;                    // MUTE TILL LOCK DETECT On/Off 1/0
    adf_sett->aux_out_select                = 0;                    // DIVIDED/FUNDAMETAL 0/1
    adf_sett->aux_out_enable                = 0;                    // On/Off 1/0
    adf_sett->aux_out_power                 = OUT_POWER_MINUS_4;    // Power in dBm
    adf_sett->rf_out_enable                 = 1;                    // On/Off 1/0
    adf_sett->out_power                     = OUT_POWER_PLUS_5;     // Power in dBm

    // reg 5 ----------------------------------------------------------------------
    adf_sett->ld_pin_mode                   = DIGITAL_LOCK_DETECT;  // LD PIN MODE
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

void Pll_ADF4351_display_registers_hex(ADF4351_register_t *data)
{
    uint32_t *reg_ptr = &data->reg0;
    for (uint8_t i = 0; i < REG_COUNT; i++) {
        printf("Reg%d: |0x%.6x|\t", i, *reg_ptr);
        reg_ptr+=1;
    }
    printf("\n\r");
}