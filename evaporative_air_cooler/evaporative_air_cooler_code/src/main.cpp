#include <Arduino.h>
#include <BlynkSimpleSerialBLE.h>

#include "LOT_adc.h"
#include "LOT_ntc103f397.h"

#define SYSTEM_STATE_VIRTUAL_PIN V0
#define FORCED_FAN_ON_OFF_VIRTUAL_PIN V1
#define NTC103F397_VIRTUAL_PIN V2
#define THRESHOLD_TEMPERATURE_VIRTUAL_PIN V3
#define MOTION_STATE_VIRTUAL_PIN V4

#define MAX_PUSH_TIME_MS 500
#define PARALLEL_RESISTOR 9.85f
#define THRESHOLD_TEMPERATURE_SAFETY_ZONE 0.3f

// AT+BAUD6
// AT+NAMEevaporative
// AT+PIN0000
#define HC_O6_BAUDRATE 38400

char              auth[] = "3993b1f88d9e4607b04007cd3ebe8876";
BlynkTimer        timer;
volatile uint32_t pushtime          = 0;
volatile uint8_t  system_state      = 0;
uint8_t           forced_fan_on_off = 0;
float             temperature;
float             threshold_temperature = 25.0f;
volatile uint8_t  motion_state          = 0;
volatile uint32_t motion_capture_time   = 0;

void fast_timer( void );
void slow_timer( void );

// app -> nano
BLYNK_WRITE( SYSTEM_STATE_VIRTUAL_PIN )
{
    system_state = param.asInt();
}

BLYNK_WRITE( FORCED_FAN_ON_OFF_VIRTUAL_PIN )
{
    forced_fan_on_off = param.asInt();
}

BLYNK_WRITE( THRESHOLD_TEMPERATURE_VIRTUAL_PIN )
{
    threshold_temperature = param.asFloat();
}

void setup()
{
    Serial.begin( HC_O6_BAUDRATE );
    Blynk.config( Serial, auth );
    // Blynk.begin(Serial, auth);

    DDRB |= _BV( DDB5 );

    MCUCR &= ~_BV( PUD );  // PULL-UP activate
    DDRD &= ~_BV( DDD2 );  // INPUT
    PORTD |= _BV( PD2 );   // PULL-UP
    EIMSK |= _BV( INT0 );  // interrupt enable
    EICRA |= _BV( ISC00 ); // any logical change

    LOT_adc_setup();

    DDRD &= ~_BV( DDD3 );  // INPUT
    PORTD |= _BV( PD3 );   // PULL-UP
    EIMSK |= _BV( INT1 );  // interrupt enable
    EICRA |= _BV( ISC10 ); // any logical change

    DDRD |= _BV( DDD5 ) | _BV( DDD4 ); // OUTPUT

    timer.setInterval( 450, fast_timer );
    timer.setInterval( 2050, slow_timer );
}

void loop()
{
    Blynk.run();
    timer.run();

    if ( system_state )
    {
        PORTD |= _BV( PD4 );
        if ( forced_fan_on_off )
        {
            PORTD |= _BV( PD5 );
        }
        else
        {
            if ( motion_state && ( temperature > threshold_temperature ) )
            {
                PORTD |= _BV( PD5 );
            }
            else if ( ( motion_state && ( temperature < threshold_temperature - THRESHOLD_TEMPERATURE_SAFETY_ZONE ) )
                      || ( !motion_state ) )
            {
                PORTD &= ~_BV( PD5 );
            }
        }
    }
    else
    {
        PORTD &= ~( _BV( PD5 ) | _BV( PD4 ) );
    }

    float thermistor_R = LOT_adc_read( 0 );
    thermistor_R       = ( PARALLEL_RESISTOR * thermistor_R ) / ( 1024.0 - thermistor_R );
    temperature        = LOT_ntc_temperature( thermistor_R );
}

void fast_timer( void )
{
    Blynk.virtualWrite( SYSTEM_STATE_VIRTUAL_PIN, system_state );
    Blynk.virtualWrite( FORCED_FAN_ON_OFF_VIRTUAL_PIN, forced_fan_on_off );
    Blynk.virtualWrite( NTC103F397_VIRTUAL_PIN, temperature );
    Blynk.virtualWrite( MOTION_STATE_VIRTUAL_PIN, motion_state );
}

void slow_timer( void )
{
    Blynk.virtualWrite( THRESHOLD_TEMPERATURE_VIRTUAL_PIN, threshold_temperature );
}

ISR( INT0_vect )
{
    if ( PIND & _BV( PIND2 ) )
    {
        pushtime = millis();
    }
    else
    {
        if ( millis() - pushtime > MAX_PUSH_TIME_MS )
        {
            system_state ^= 1;
        }
    }
}

ISR( INT1_vect )
{
    if ( PIND & _BV( PIND3 ) )
    {
        motion_state = 1;
    }
    else
    {
        motion_state = 0;
    }
}