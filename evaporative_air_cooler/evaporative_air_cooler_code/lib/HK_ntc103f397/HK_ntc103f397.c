/**
 * filename : HK_ntc103f397.c
 *
 * created  : 2018/09/15
 *
 * Hyeon-ki, Hong
 * hhk7734@gmail.com
 *
 * purpose : NTC chip thermistor
 */

#include "HK_ntc103f397.h"
#include "inttypes.h"
#include <math.h>

#define con( old, new, interval )          \
    ( ( new ) < ( ( old ) - ( interval ) ) \
          ? ( ( old ) - ( interval ) )     \
          : ( ( new ) > ( ( old ) + ( interval ) ) ? ( ( old ) + ( interval ) ) : ( new ) ) )

static uint8_t HK_ntc_step      = 0;
static int32_t HK_ntc_T_lpf     = 0;
static int32_t HK_ntc_T_display = 0;

float HK_ntc_temperature( float kohm )
{
    float temp = log( kohm );
    float T    = HK_NTC_STEINHART_HART_EQU_A + HK_NTC_STEINHART_HART_EQU_B * temp
              + HK_NTC_STEINHART_HART_EQU_C * temp * temp * temp;

    T = 1 / T - 273.15;

    // init
    if ( HK_ntc_step < 5 )
    {
        HK_ntc_T_lpf     = ( T * 1000 );
        HK_ntc_T_display = HK_ntc_T_lpf;
        HK_ntc_T_lpf     = HK_ntc_T_lpf << HK_NTC_LPF_FACTOR;
        ++HK_ntc_step;
    }

    HK_ntc_T_lpf -= HK_ntc_T_lpf >> HK_NTC_LPF_FACTOR;
    HK_ntc_T_lpf += T * 1000;

    HK_ntc_T_display = con( HK_ntc_T_display, HK_ntc_T_lpf >> HK_NTC_LPF_FACTOR, 100 );

    return ( float )( HK_ntc_T_display ) / 1000.0;
}
