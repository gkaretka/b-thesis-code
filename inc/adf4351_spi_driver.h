#ifndef ADF4351_SPI_DRIVER_H
#define ADF4351_SPI_DRIVER_H

#include <stdint.h>
#include <stdio.h>
#include <math.h>


#define REG0_INT_OFFSET             15
#define REG0_FRAC_OFFSET            3
#define REG0_CONTROL_BITS           0

#define REG1_PHASE_ADJUST_OFFSET    28
#define REG1_PRESCALER_OFFSET       27
#define REG1_PHASE_VALUE_OFFSET     15
#define REG1_MOD_OFFSET             3
#define REG1_CONTROL_BITS           1

#define REG2_LN_LS_MODE_OFFSET      29
#define REG2_MUX_OUT_OFFSET         26
#define REG2_REF_DOUBLER_OFFSET     25
#define REG2_REF_DIVIDER_OFFSET     24
#define REG2_R_COUNTER_OFFSET       14
#define REG2_DOUBLE_BUFF_OFFSET     13
#define REG2_CP_SETTINGS_OFFSET     9
#define REG2_LDF_OFFSET             8
#define REG2_LDP_OFFSET             7
#define REG2_PD_POLARITY_OFFSET     6
#define REG2_POWER_DOWN_OFFSET      5
#define REG2_CP_3_STATE_OFFSET      4
#define REG2_COUNTER_RESET_OFFSET   3
#define REG2_CONTROL_BITS           2

#define REG3_BAND_CLK_MODE_OFFSET   23
#define REG3_ABP_MODE_OFFSET        22
#define REG3_CHARGE_CANCEL_OFFSET   21
#define REG3_CSR_OFFSET             18
#define REG3_CLK_DIV_MODE_OFFSET    15
#define REG3_CLK_DIVIDER_OFFSET     3
#define REG3_CONTROL_BITS           3

#define REG4_FB_SELECT_OFFSET       23
#define REG4_RF_DIV_SEL_OFFSET      20
#define REG4_BAND_SELCLK_DIV_OFFSET 12
#define REG4_VCO_POWER_DOWN_OFFSET  11
#define REG4_MTLD_OFFSET            10
#define REG4_AUX_OUT_SEL_OFFSET     9
#define REG4_AUX_OUT_EN_OFFSET      8
#define REG4_AUX_OUT_POWER_OFFSET   6
#define REG4_RF_OUT_EN_OFFSET       5
#define REG4_OUT_POWER_OFFSET       3
#define REG4_CONTROL_BITS           4

#define REG5_LD_PIN_MODE_OFFSET     22
#define REG5_CONTROL_BITS           5

typedef struct {
    uint32_t    INT;
    uint32_t    FRAC;
    uint32_t    MOD;
    uint32_t    PFD;
    uint32_t    r_DIV;
    uint32_t    o_DIV;
} ADF4351_t;

typedef struct {
    uint32_t    reg0;
    uint32_t    reg1;
    uint32_t    reg2;
    uint32_t    reg3;
    uint32_t    reg4;
    uint32_t    reg5;
} ADF4351_register_t;

typedef struct {
    // reg 1 -----------------------------------
    uint8_t     phase_adjust;
    uint8_t     prescaler;
    uint16_t    phase_adjust_val;

    // reg 2 -----------------------------------
    uint8_t     low_noise_low_spurs_mode;
    uint8_t     mux_out;
    uint8_t     ref_doubler;
    uint8_t     ref_divider;
    // R counter 
    uint8_t     double_buffer;
    uint8_t     charge_pump_settings;
    uint8_t     ldf;
    uint8_t     ldp;
    uint8_t     pd_polarity;
    uint8_t     power_down;
    uint8_t     cp_three_state;
    uint8_t     counter_reset;

    // reg 3 -----------------------------------
    uint8_t     band_select_clk_mode;
    uint8_t     abp;
    uint8_t     charge_cancel;
    uint8_t     csr;
    uint8_t     clk_div_mode;
    // 12-bit divider counter

    // reg 4 -----------------------------------
    uint8_t     feedback_select;
    uint8_t     rf_divider_select;
    uint8_t     band_sel_clk_div;
    uint8_t     vco_power_down;
    uint8_t     mtld;
    uint8_t     aux_out_select;
    uint8_t     aux_out_enable;
    uint8_t     aux_out_power;
    uint8_t     rf_out_enable;
    uint8_t     out_power;

    // reg 5 -----------------------------------

    uint8_t     ld_pin_mode;

} ADF4351_settings_t;


void Pll_ADF4351_show_RF_settings(ADF4351_t *data_struct);
void Pll_ADF4351_set_frequency(uint64_t freq_out, ADF4351_t *data_struct);
uint64_t Pll_ADF4351_resulting_frequency(ADF4351_t *data_struct);
uint64_t Pll_ADF4351_evaluate_frequency(uint64_t freq_set, ADF4351_t *data_struct);

void Pll_ADF4351_fill_registers(ADF4351_t *adf_vals, ADF4351_register_t *adf_regs, ADF4351_settings_t* adf_sett);

#endif