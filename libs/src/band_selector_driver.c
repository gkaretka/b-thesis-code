#include "../inc/band_selector_driver.h"

int rp_gpio_init()
{
    rp_pinState_t state;

    // Initialization of API
    if (rp_Init() != RP_OK) {
        fprintf(stderr, "Red Pitaya API init failed!\n");
        return -1;
    }

    rp_dpin_t output_pins[] = {SW1_1_CTR, SW1_2_CTR, SW2_1_CTR, SW2_2_CTR, SW3_1_CTR, SW3_2_CTR};

    for (uint8_t i = 0; i < OUTPUT_PIN_COUNT; i++) {
        rp_DpinSetDirection (output_pins[i], RP_OUT);
        rp_DpinSetState(output_pins[i], RP_LOW);
    }

    return 0;
}

int release_gpio_api()
{
    rp_Release();
}

int select_band(enum band_t band)
{
    printf("Selecting band ...\n\r");
    switch (band) {
        case BAND_NONE:
            printf("No band \n\r");
            rp_DpinSetState(SW1_1_CTR, RP_LOW);
            rp_DpinSetState(SW1_2_CTR, RP_LOW);
            break;

        case BAND_SW:
            printf("SW band \n\r");
            rp_DpinSetState(SW1_1_CTR, RP_HIGH);
            rp_DpinSetState(SW1_2_CTR, RP_LOW);
            break;

        case BAND_HF_HVF:
            printf("HF/VHF band \n\r");
            rp_DpinSetState(SW1_1_CTR, RP_LOW);
            rp_DpinSetState(SW1_2_CTR, RP_HIGH);
            break;

        default:
            printf("Band not implemented !\n\r");
            rp_DpinSetState(SW1_1_CTR, RP_LOW);
            rp_DpinSetState(SW1_2_CTR, RP_LOW);
            return -1;
    }

    return 0;
}

int select_filter(enum if_filter_t filter)
{
    printf("Selecting filter ...\n\r");
    switch (filter) {
        case IF_STAGE_OFF:
            printf("IF OFF\n\r");
            rp_DpinSetState(SW2_1_CTR, RP_LOW);
            rp_DpinSetState(SW2_2_CTR, RP_LOW);
            rp_DpinSetState(SW3_1_CTR, RP_LOW);
            rp_DpinSetState(SW3_2_CTR, RP_LOW);
            break;
            
        case IF_FILTER_5MHZ:
            printf("5MHz Filter \n\r");
            // On RF_2 -> RF_COM
            rp_DpinSetState(SW2_1_CTR, RP_LOW);
            rp_DpinSetState(SW2_2_CTR, RP_HIGH);
            // On RF_1 -> RF_COM
            rp_DpinSetState(SW3_1_CTR, RP_HIGH);
            rp_DpinSetState(SW3_2_CTR, RP_LOW);
            break;

        case BAND_HF_HVF:
            printf("70MHz Filter \n\r");
            // On RF_1 -> RF_COM
            rp_DpinSetState(SW2_1_CTR, RP_HIGH);
            rp_DpinSetState(SW2_2_CTR, RP_LOW);
            // On RF_2 -> RF_COM
            rp_DpinSetState(SW3_1_CTR, RP_LOW);
            rp_DpinSetState(SW3_2_CTR, RP_HIGH);
            break;

        default:
            rp_DpinSetState(SW2_1_CTR, RP_LOW);
            rp_DpinSetState(SW2_2_CTR, RP_LOW);
            rp_DpinSetState(SW3_1_CTR, RP_LOW);
            rp_DpinSetState(SW3_2_CTR, RP_LOW);
            printf("Band not implemented !");
            return -1;
    }

    return 0;
}