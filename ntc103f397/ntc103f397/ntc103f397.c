/**
 * filename : ntc103f397.c
 *
 * created  : 2018/09/15
 *
 * Hyeon-ki, Hong
 * hhk7734@gmail.com
 *
 * purpose : NTC chip thermistor
 */

#include "ntc103f397.h"
#include "inttypes.h"
#include <math.h>

#define con(old, new, interval) ((new) < ((old) - (interval)) \
                    ? ((old) - (interval)) \
                    : ((new) > ((old) + (interval)) \
                    ? ((old) + (interval)) : (new)))

uint8_t ntc_step = 0;
int32_t ntc_T_lpf = 0;
int32_t ntc_T_display = 0;

float ntc_temperature(float kohm)
{
    float temp = log(kohm);
    float T = NTC_STEINHART_HART_EQU_A 
            + NTC_STEINHART_HART_EQU_B * temp 
            + NTC_STEINHART_HART_EQU_C * temp * temp * temp;

    T = 1 / T - 273.15;

    // init
    if(ntc_step < 5)
    {
        ntc_T_lpf = (T * 1000);
        ntc_T_display = ntc_T_lpf;
        ntc_T_lpf = ntc_T_lpf << NTC_LPF_FACTOR;
        ++ntc_step;
    }

    ntc_T_lpf -= ntc_T_lpf >> NTC_LPF_FACTOR;
    ntc_T_lpf += T * 1000;

    ntc_T_display = con(ntc_T_display, ntc_T_lpf >> NTC_LPF_FACTOR, 100);

    return (float)(ntc_T_display)/1000.0;
}
