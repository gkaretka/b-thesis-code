#ifndef BAND_SELECTOR_DRIVER_H
#define BAND_SELECTOR_DRIVER_H

#include "rp.h"
#include <stdio.h>

#define OUTPUT_PIN_COUNT    6

// Band selection - SW or HF/HVF
#define SW1_1_CTR   RP_DIO3_P       // pin 9
#define SW1_2_CTR   RP_DIO2_N       // pin 8

// Filter selection
#define SW2_1_CTR   RP_DIO5_P       // pin 13
#define SW2_2_CTR   RP_DIO4_N       // pin 12

#define SW3_1_CTR   RP_DIO4_P       // pin 11
#define SW3_2_CTR   RP_DIO3_N       // pin 10

enum band_t {
    BAND_SW         = 0,
    BAND_HF_VHF     = 1,
    BAND_NONE       = 2
};

enum if_filter_t {
    IF_FILTER_5MHZ  = 0,
    IF_FILTER_70MHz = 1,
    IF_STAGE_OFF    = 2
};

int rp_gpio_init();
int select_band(enum band_t band);
int select_filter(enum if_filter_t filter);
int release_gpio_api();

#endif