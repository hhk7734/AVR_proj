EESchema Schematic File Version 4
EELAYER 26 0
EELAYER END
$Descr User 8268 9843
encoding utf-8
Sheet 1 1
Title "evaporative_air_cooler"
Date ""
Rev ""
Comp "H-brothers"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_Module:Arduino_Nano_v3.x A1
U 1 1 5BB72DA9
P 4600 2350
F 0 "A1" H 4250 3300 50  0000 C CNN
F 1 "Arduino_Nano_v3.x" H 5200 1350 50  0000 C CNN
F 2 "Module:Arduino_Nano" H 4750 1400 50  0001 L CNN
F 3 "http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf" H 4600 1350 50  0001 C CNN
	1    4600 2350
	1    0    0    -1  
$EndComp
$Comp
L MY_RF_Bluetooth:HC-06 U1
U 1 1 5BB733E6
P 3050 5600
F 0 "U1" H 3075 5750 50  0000 L CNN
F 1 "HC-06" H 3125 5150 50  0000 L CNN
F 2 "" H 3050 5600 50  0001 C CNN
F 3 "" H 3050 5600 50  0001 C CNN
	1    3050 5600
	1    0    0    -1  
$EndComp
Text Label 3350 1850 0    50   ~ 0
HC-06_RXD
Text Label 3350 1750 0    50   ~ 0
HC-06_TXD
Text Label 1700 5075 0    50   ~ 0
HC-06_RXD
Text Label 2200 5700 0    50   ~ 0
HC-06_TXD
$Comp
L Device:R R2
U 1 1 5BB73A38
P 1700 5350
F 0 "R2" H 1770 5396 50  0000 L CNN
F 1 "1K" H 1770 5305 50  0000 L CNN
F 2 "" V 1630 5350 50  0001 C CNN
F 3 "~" H 1700 5350 50  0001 C CNN
	1    1700 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 5075 1700 5200
$Comp
L Device:R R3
U 1 1 5BB73B2F
P 1700 5850
F 0 "R3" H 1770 5896 50  0000 L CNN
F 1 "2K" H 1770 5805 50  0000 L CNN
F 2 "" V 1630 5850 50  0001 C CNN
F 3 "~" H 1700 5850 50  0001 C CNN
	1    1700 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 5500 1700 5600
$Comp
L power:GND #PWR03
U 1 1 5BB73C54
P 1700 7750
F 0 "#PWR03" H 1700 7500 50  0001 C CNN
F 1 "GND" H 1705 7577 50  0000 C CNN
F 2 "" H 1700 7750 50  0001 C CNN
F 3 "" H 1700 7750 50  0001 C CNN
	1    1700 7750
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 6000 1700 6100
Wire Wire Line
	1700 5600 2950 5600
Connection ~ 1700 5600
Wire Wire Line
	1700 5600 1700 5700
Wire Wire Line
	2950 5700 2200 5700
Wire Wire Line
	1700 6100 2200 6100
Wire Wire Line
	2200 6100 2200 5800
Wire Wire Line
	2200 5800 2950 5800
Connection ~ 1700 6100
Wire Wire Line
	1700 6100 1700 7350
$Comp
L power:+5V #PWR04
U 1 1 5BB730B7
P 2350 6600
F 0 "#PWR04" H 2350 6450 50  0001 C CNN
F 1 "+5V" H 2365 6773 50  0000 C CNN
F 2 "" H 2350 6600 50  0001 C CNN
F 3 "" H 2350 6600 50  0001 C CNN
	1    2350 6600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2950 5900 2650 5900
$Comp
L Device:Thermistor_NTC TH1
U 1 1 5BB73A0B
P 6250 2600
F 0 "TH1" H 6348 2646 50  0000 L CNN
F 1 "NTC103F397" H 6348 2555 50  0000 L CNN
F 2 "" H 6250 2650 50  0001 C CNN
F 3 "~" H 6250 2650 50  0001 C CNN
	1    6250 2600
	1    0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 5BB73A99
P 6250 2100
F 0 "R6" H 6320 2146 50  0000 L CNN
F 1 "10K" H 6320 2055 50  0000 L CNN
F 2 "" V 6180 2100 50  0001 C CNN
F 3 "~" H 6250 2100 50  0001 C CNN
	1    6250 2100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR013
U 1 1 5BB73D26
P 6250 2950
F 0 "#PWR013" H 6250 2700 50  0001 C CNN
F 1 "GND" H 6255 2777 50  0000 C CNN
F 2 "" H 6250 2950 50  0001 C CNN
F 3 "" H 6250 2950 50  0001 C CNN
	1    6250 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 2750 6250 2950
$Comp
L Switch:SW_Push SW1
U 1 1 5BB75567
P 2850 1950
F 0 "SW1" H 2850 2235 50  0000 C CNN
F 1 "SW_Push" H 2850 2144 50  0000 C CNN
F 2 "" H 2850 2150 50  0001 C CNN
F 3 "" H 2850 2150 50  0001 C CNN
	1    2850 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 1850 4100 1850
Wire Wire Line
	3350 1750 4100 1750
Wire Wire Line
	3050 1950 4100 1950
$Comp
L power:GND #PWR05
U 1 1 5BB76240
P 2400 1950
F 0 "#PWR05" H 2400 1700 50  0001 C CNN
F 1 "GND" V 2405 1822 50  0000 R CNN
F 2 "" H 2400 1950 50  0001 C CNN
F 3 "" H 2400 1950 50  0001 C CNN
	1    2400 1950
	0    1    1    0   
$EndComp
Wire Wire Line
	2400 1950 2650 1950
$Comp
L Device:LED D1
U 1 1 5BB76B71
P 1700 3200
F 0 "D1" V 1738 3083 50  0000 R CNN
F 1 "LED" V 1647 3083 50  0000 R CNN
F 2 "" H 1700 3200 50  0001 C CNN
F 3 "~" H 1700 3200 50  0001 C CNN
	1    1700 3200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6250 2250 6250 2350
Wire Wire Line
	5100 2350 6250 2350
Connection ~ 6250 2350
$Comp
L Device:R R1
U 1 1 5BB7837A
P 1700 2850
F 0 "R1" H 1770 2896 50  0000 L CNN
F 1 "R" H 1770 2805 50  0000 L CNN
F 2 "" V 1630 2850 50  0001 C CNN
F 3 "~" H 1700 2850 50  0001 C CNN
	1    1700 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 3000 1700 3050
$Comp
L power:GND #PWR02
U 1 1 5BB79319
P 1700 4050
F 0 "#PWR02" H 1700 3800 50  0001 C CNN
F 1 "GND" H 1705 3877 50  0000 C CNN
F 2 "" H 1700 4050 50  0001 C CNN
F 3 "" H 1700 4050 50  0001 C CNN
	1    1700 4050
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR01
U 1 1 5BB7989D
P 1700 2600
F 0 "#PWR01" H 1700 2450 50  0001 C CNN
F 1 "+5V" H 1715 2773 50  0000 C CNN
F 2 "" H 1700 2600 50  0001 C CNN
F 3 "" H 1700 2600 50  0001 C CNN
	1    1700 2600
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:2N3904 Q1
U 1 1 5BB7AD34
P 1800 3700
F 0 "Q1" H 1991 3746 50  0000 L CNN
F 1 "2N3904" H 1991 3655 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 2000 3625 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 1800 3700 50  0001 L CNN
	1    1800 3700
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1700 3900 1700 4050
Wire Wire Line
	1700 2600 1700 2700
Wire Wire Line
	1700 3350 1700 3500
$Comp
L Device:R R4
U 1 1 5BB7EE4F
P 2400 3700
F 0 "R4" V 2193 3700 50  0000 C CNN
F 1 "330" V 2284 3700 50  0000 C CNN
F 2 "" V 2330 3700 50  0001 C CNN
F 3 "~" H 2400 3700 50  0001 C CNN
	1    2400 3700
	0    1    1    0   
$EndComp
Wire Wire Line
	2000 3700 2250 3700
Wire Wire Line
	4100 2150 3150 2150
Wire Wire Line
	3150 2150 3150 3700
Wire Wire Line
	3150 3700 2550 3700
$Comp
L power:GND #PWR07
U 1 1 5BB82ECF
P 4700 3750
F 0 "#PWR07" H 4700 3500 50  0001 C CNN
F 1 "GND" H 4705 3577 50  0000 C CNN
F 2 "" H 4700 3750 50  0001 C CNN
F 3 "" H 4700 3750 50  0001 C CNN
	1    4700 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 3350 4700 3500
Wire Wire Line
	4600 3350 4600 3500
Wire Wire Line
	4600 3500 4700 3500
Connection ~ 4700 3500
Wire Wire Line
	4700 3500 4700 3750
$Comp
L Motor:Motor_DC M1
U 1 1 5BB862E5
P 5850 5000
F 0 "M1" H 6008 4996 50  0000 L CNN
F 1 "Motor_DC" H 6008 4905 50  0000 L CNN
F 2 "" H 5850 4910 50  0001 C CNN
F 3 "~" H 5850 4910 50  0001 C CNN
	1    5850 5000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR08
U 1 1 5BB759A9
P 4800 1100
F 0 "#PWR08" H 4800 950 50  0001 C CNN
F 1 "+5V" H 4800 1275 50  0000 C CNN
F 2 "" H 4800 1100 50  0001 C CNN
F 3 "" H 4800 1100 50  0001 C CNN
	1    4800 1100
	1    0    0    -1  
$EndComp
$Comp
L Motor:Fan M2
U 1 1 5BB7F5DE
P 6650 5100
F 0 "M2" H 6808 5196 50  0000 L CNN
F 1 "Fan" H 6808 5105 50  0000 L CNN
F 2 "" H 6650 5110 50  0001 C CNN
F 3 "~" H 6650 5110 50  0001 C CNN
	1    6650 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 4800 5850 4500
Wire Wire Line
	5850 4500 6250 4500
Wire Wire Line
	6250 4500 6650 4500
Wire Wire Line
	6650 4500 6650 4800
Connection ~ 6250 4500
Wire Wire Line
	6250 4250 6250 4500
$Comp
L Relay:DIPxx-1Cxx-51x K1
U 1 1 5BB830A6
P 5950 6300
F 0 "K1" H 6380 6346 50  0000 L CNN
F 1 "DIPxx-1Cxx-51x" H 6380 6255 50  0000 L CNN
F 2 "Relay_THT:Relay_StandexMeder_DIP_LowProfile" H 6400 6250 50  0001 L CNN
F 3 "https://standexelectronics.com/wp-content/uploads/datasheet_reed_relay_DIP.pdf" H 5950 6300 50  0001 C CNN
	1    5950 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 5300 5850 5650
Wire Wire Line
	5850 5650 6250 5650
Wire Wire Line
	6650 5650 6650 5300
Wire Wire Line
	6250 5650 6250 6000
Connection ~ 6250 5650
Wire Wire Line
	6250 5650 6650 5650
Wire Wire Line
	5750 6600 5750 6650
NoConn ~ 6050 6000
NoConn ~ 5100 1750
NoConn ~ 5100 1850
NoConn ~ 5100 2550
NoConn ~ 5100 2650
NoConn ~ 5100 2750
NoConn ~ 5100 2850
NoConn ~ 5100 2950
NoConn ~ 5100 3050
Text Label 3350 2250 0    50   ~ 0
relay_on_off
Text Label 4450 7150 2    50   ~ 0
relay_on_off
Wire Wire Line
	3350 2250 4100 2250
$Comp
L Diode:1N4002 D2
U 1 1 5BB933F9
P 5150 6300
F 0 "D2" V 5104 6379 50  0000 L CNN
F 1 "1N4002" V 5195 6379 50  0000 L CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 5150 6125 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 5150 6300 50  0001 C CNN
	1    5150 6300
	0    1    1    0   
$EndComp
Wire Wire Line
	5750 6000 5750 5950
Wire Wire Line
	5750 5950 5450 5950
Wire Wire Line
	5150 5950 5150 6150
Wire Wire Line
	5150 6450 5150 6650
Wire Wire Line
	5150 6650 5450 6650
Wire Wire Line
	5450 5700 5450 5950
Connection ~ 5450 5950
Wire Wire Line
	5450 5950 5150 5950
$Comp
L Transistor_BJT:2N3904 Q2
U 1 1 5BB9D4D6
P 5350 7150
F 0 "Q2" H 5541 7196 50  0000 L CNN
F 1 "2N3904" H 5541 7105 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 5550 7075 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 5350 7150 50  0001 L CNN
	1    5350 7150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 5BB9F118
P 4800 7150
F 0 "R5" V 4593 7150 50  0000 C CNN
F 1 "330" V 4684 7150 50  0000 C CNN
F 2 "" V 4730 7150 50  0001 C CNN
F 3 "~" H 4800 7150 50  0001 C CNN
	1    4800 7150
	0    1    1    0   
$EndComp
Wire Wire Line
	4450 7150 4650 7150
Wire Wire Line
	4950 7150 5150 7150
Wire Wire Line
	5450 6650 5450 6950
Connection ~ 5450 6650
Wire Wire Line
	5450 6650 5750 6650
Wire Wire Line
	5450 7350 5450 7550
Wire Wire Line
	6150 6600 6150 7550
$Comp
L power:+5V #PWR09
U 1 1 5BBADFB9
P 5450 5700
F 0 "#PWR09" H 5450 5550 50  0001 C CNN
F 1 "+5V" H 5465 5873 50  0000 C CNN
F 2 "" H 5450 5700 50  0001 C CNN
F 3 "" H 5450 5700 50  0001 C CNN
	1    5450 5700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR010
U 1 1 5BBB3377
P 5450 7550
F 0 "#PWR010" H 5450 7300 50  0001 C CNN
F 1 "GND" H 5455 7377 50  0000 C CNN
F 2 "" H 5450 7550 50  0001 C CNN
F 3 "" H 5450 7550 50  0001 C CNN
	1    5450 7550
	1    0    0    -1  
$EndComp
$Comp
L MY_Sensor:HC-SR501 U2
U 1 1 5BBBF48A
P 3050 7150
F 0 "U2" H 3050 7300 50  0000 L CNN
F 1 "HC-SR501" H 3050 6800 50  0000 L CNN
F 2 "" H 3050 7150 50  0001 C CNN
F 3 "" H 3050 7150 50  0001 C CNN
	1    3050 7150
	1    0    0    -1  
$EndComp
Text Label 3350 2050 0    50   ~ 0
HC-SR501_OUT
Text Label 2200 7250 0    50   ~ 0
HC-SR501_OUT
Wire Wire Line
	3350 2050 4100 2050
Wire Wire Line
	2200 7250 2950 7250
Wire Wire Line
	2650 7150 2950 7150
Wire Wire Line
	2650 5900 2650 6600
Wire Wire Line
	2350 6600 2650 6600
Connection ~ 2650 6600
Wire Wire Line
	2650 6600 2650 7150
Wire Wire Line
	2950 7350 1700 7350
Connection ~ 1700 7350
Wire Wire Line
	1700 7350 1700 7750
$Comp
L power:+9V_0 #PWR06
U 1 1 5BBDFBD7
P 4500 1100
F 0 "#PWR06" H 4500 950 50  0001 C CNN
F 1 "+9V_0" H 4500 1275 50  0000 C CNN
F 2 "" H 4500 1100 50  0001 C CNN
F 3 "" H 4500 1100 50  0001 C CNN
	1    4500 1100
	1    0    0    -1  
$EndComp
$Comp
L power:+9V_1 #PWR014
U 1 1 5BBE3442
P 6250 4250
F 0 "#PWR014" H 6250 4100 50  0001 C CNN
F 1 "+9V_1" H 6250 4425 50  0000 C CNN
F 2 "" H 6250 4250 50  0001 C CNN
F 3 "" H 6250 4250 50  0001 C CNN
	1    6250 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 2350 6250 2450
$Comp
L power:+5V #PWR012
U 1 1 5BB9C26C
P 6250 1750
F 0 "#PWR012" H 6250 1600 50  0001 C CNN
F 1 "+5V" H 6265 1923 50  0000 C CNN
F 2 "" H 6250 1750 50  0001 C CNN
F 3 "" H 6250 1750 50  0001 C CNN
	1    6250 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 1750 6250 1950
$Comp
L power:GND_1 #PWR011
U 1 1 5BBB700D
P 6150 7550
F 0 "#PWR011" H 6150 7300 50  0001 C CNN
F 1 "GND_1" H 6155 7377 50  0000 C CNN
F 2 "" H 6150 7550 50  0001 C CNN
F 3 "" H 6150 7550 50  0001 C CNN
	1    6150 7550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 1100 4500 1350
Wire Wire Line
	4800 1100 4800 1350
NoConn ~ 5100 2450
NoConn ~ 4100 2350
NoConn ~ 4100 2450
NoConn ~ 4100 2550
NoConn ~ 4100 2650
NoConn ~ 4100 2750
NoConn ~ 4100 2850
NoConn ~ 4100 2950
NoConn ~ 4100 3050
NoConn ~ 4700 1350
NoConn ~ 5100 2150
$EndSCHEMATC
