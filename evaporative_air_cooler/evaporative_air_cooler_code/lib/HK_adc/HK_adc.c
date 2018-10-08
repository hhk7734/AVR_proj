/**
 * filename : HK_adc.c
 *
 * created  : 2018/09/24
 *
 * Hyeon-ki, Hong
 * hhk7734@gmail.com
 *
 * purpose : Analog to Digital Converter
 */

#include "HK_adc.h"

#include <avr/io.h>

void HK_adc_setup( void )
{
    PRR &= ~_BV( PRADC );
    ADMUX  = _BV( REFS0 ); // Voltage Reference : AVCC
    ADCSRA = _BV( ADEN );
// more than 100 Hz to get maximum resolution
#if F_CPU >= 12800000UL
    ADCSRA |= _BV( ADPS2 ) | _BV( ADPS1 ) | _BV( ADPS0 );
#elif F_CPU >= 6400000UL
    ADCSRA |= _BV( ADPS2 ) | _BV( ADPS1 );
#else
    ADCSRA |= _BV( ADPS2 ) | _BV( ADPS0 );
#endif
}

int16_t HK_adc_read( uint8_t adc_pin )
{
    if ( adc_pin < 8 )
    {
        ADMUX |= adc_pin;
        ADCSRA |= _BV( ADSC ); // ADC start
        while ( ADCSRA & _BV( ADSC ) )
            ; // wait
        return ADCW;
    }
    return -1;
}