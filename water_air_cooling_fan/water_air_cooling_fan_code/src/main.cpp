#include <Arduino.h>

#include <BlynkSimpleSerialBLE.h>

char auth[] = "3993b1f88d9e4607b04007cd3ebe8876";

// AT+BAUD6
// AT+NAMEwater_cooling
// AT+PIN0000
#define HC_O6_BAUDRATE 38400

BlynkTimer timer;

#include "adc.h"
#include "ntc103f397.h"
#define RESIS 9.85f
#define NTC103F397_ANALOG_PIN 0
#define NTC103F397_VIRTUAL_PIN V0
float temperature;
void temperature_timer(void);

#define SYSTEM_STATE_VIRTUAL_PIN V1
volatile uint32_t pushtime = 0;
volatile uint8_t system_state = 0;
WidgetLED led1(SYSTEM_STATE_VIRTUAL_PIN);
void system_state_timer(void);

#define MAX_MOTION_UNDETECTED_TIME_MS 30000
#define MOTION_STATE_VIRTUAL_PIN V2
volatile uint32_t motion_capture_time = 0;
volatile uint8_t motion_state = 0;
void motion_state_timer(void);

void setup()
{
    Serial.begin(HC_O6_BAUDRATE);
    Blynk.begin(Serial, auth);
    DDRB |= _BV(DDB5);

    adc_setup();
    timer.setInterval(1000, temperature_timer);

    MCUCR &= ~_BV(PUD); // PULL-UP activate
    DDRD &= ~_BV(DDD2); // INPUT
    PORTD |= _BV(PD2); // PULL-UP
    EIMSK |= _BV(INT0); // interrupt enable
    EICRA |= _BV(ISC00); // any logical change
    timer.setInterval(300, system_state_timer);

    DDRD &= ~_BV(DDD3); // INPUT
    PORTD |= _BV(PD3); // PULL-UP
    EIMSK |= _BV(INT1); // interrupt enable
    EICRA |= _BV(ISC10); // any logical change
    timer.setInterval(1000, motion_state_timer);
}

void loop()
{
    Blynk.run();
    timer.run();
    
    float thermistor_R = adc_read(NTC103F397_ANALOG_PIN);
    thermistor_R = (RESIS * thermistor_R) / (1024.0 - thermistor_R);
    temperature = ntc_temperature(thermistor_R);

    uint32_t current = millis();
    if (current - motion_capture_time > MAX_MOTION_UNDETECTED_TIME_MS)
    {
        motion_state = 0;
    }
}

void temperature_timer(void)
{
    Blynk.virtualWrite(NTC103F397_VIRTUAL_PIN,temperature);
}

void system_state_timer(void)
{
    // Blynk.virtualWrite(SYSTEM_STATE_VIRTUAL_PIN, system_state);
    if(system_state)
    {
        led1.on();
    }
    else
    {
        led1.off();
    }
}

void motion_state_timer(void)
{
    Blynk.virtualWrite(MOTION_STATE_VIRTUAL_PIN, motion_state);
}

ISR(INT0_vect)
{
    if(PIND & _BV(PIND2))
    {
        pushtime = millis();
    }
    else
    {
        if(millis() - pushtime > 50)
        {
            system_state ^= 1;
        }
    }
}

ISR(INT1_vect)
{
    if(PIND & _BV(PIND3))
    {
        motion_state = 1;
    }
    else
    {
        motion_capture_time = millis();
    }
}