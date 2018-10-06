#include <Arduino.h>

#define BLYNK_PRINT Serial
#include <BlynkSimpleSerialBLE.h>

#define FAN_PUMP_RELAY_ON_OFF 6

char auth[] = "3993b1f88d9e4607b04007cd3ebe8876";

#define HC_O6_BAUDRATE 9600

#include <SoftwareSerial.h>
SoftwareSerial SerialBLE(2, 3); // RX, TX

void setup()
{
    Serial.begin(9600);
    SerialBLE.begin(HC_O6_BAUDRATE);
    Blynk.begin(SerialBLE, auth);

    pinMode(LED_BUILTIN, OUTPUT);
    pinMode(FAN_PUMP_RELAY_ON_OFF, OUTPUT);
}

void loop()
{
    Blynk.run();
}