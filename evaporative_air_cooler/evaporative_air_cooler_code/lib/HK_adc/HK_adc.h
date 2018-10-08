/**
 * filename : HK_adc.h
 *
 * created  : 2018/09/24
 *
 * Hyeon-ki, Hong
 * hhk7734@gmail.com
 *
 * purpose : Analog to Digital Converter
 */

#ifndef _HK_ADC_H_
#define _HK_ADC_H_
#ifdef __cplusplus
extern "C" {
#endif

#include <inttypes.h>

#if defined( __AVR_ATmega328P__ )
#else
#    error "maybe unsupported device"
#endif // __AVR_ATmega328P__

#ifndef F_CPU
#    error "F_CPU is not defined"
#endif // F_CPU

void    HK_adc_setup( void );
int16_t HK_adc_read( uint8_t adc_pin );

#ifdef __cplusplus
}
#endif
#endif /* _HK_ADC_H_ */
