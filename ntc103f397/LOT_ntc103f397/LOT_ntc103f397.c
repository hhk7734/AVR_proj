/**
 * @file LOT_ntc103f397.c
 * @date 2018/09
 * @author Hyeon-ki, Hong (hhk7734@gmail.com)
 * @brief NTC 103 F 397
 */

#include "LOT_ntc103f397.h"
#include "inttypes.h"
#include <math.h>

#define con( old, new, interval )          \
    ( ( new ) < ( ( old ) - ( interval ) ) \
          ? ( ( old ) - ( interval ) )     \
          : ( ( new ) > ( ( old ) + ( interval ) ) ? ( ( old ) + ( interval ) ) : ( new ) ) )

static uint8_t LOT_ntc_step      = 0;
static int32_t LOT_ntc_T_lpf     = 0;
static int32_t LOT_ntc_T_display = 0;

float LOT_ntc_temperature( float kohm )
{
    float temp = log( kohm );
    float T    = LOT_NTC_STEINHART_HART_EQU_A + LOT_NTC_STEINHART_HART_EQU_B * temp
              + LOT_NTC_STEINHART_HART_EQU_C * temp * temp * temp;

    T = 1 / T - 273.15;

    // init
    if ( LOT_ntc_step < 5 )
    {
        LOT_ntc_T_lpf     = ( T * 1000 );
        LOT_ntc_T_display = LOT_ntc_T_lpf;
        LOT_ntc_T_lpf     = LOT_ntc_T_lpf << LOT_NTC_LPF_FACTOR;
        ++LOT_ntc_step;
    }

    LOT_ntc_T_lpf -= LOT_ntc_T_lpf >> LOT_NTC_LPF_FACTOR;
    LOT_ntc_T_lpf += T * 1000;

    LOT_ntc_T_display = con( LOT_ntc_T_display, LOT_ntc_T_lpf >> LOT_NTC_LPF_FACTOR, 100 );

    return ( float )( LOT_ntc_T_display ) / 1000.0;
}
