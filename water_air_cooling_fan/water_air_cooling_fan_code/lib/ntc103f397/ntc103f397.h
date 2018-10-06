/**
 * filename : ntc103f397.h
 *
 * created  : 2018/09/15
 *
 * Hyeon-ki, Hong
 * hhk7734@gmail.com
 *
 * purpose : NTC chip thermistor
 */

#ifndef _NTC103F397_H_
#define _NTC103F397_H_
#ifdef __cplusplus
extern "C"
{
#endif

#define NTC_STEINHART_HART_EQU_A 0.00277402f  // 1/T0 - (1/B)*ln(R0)
#define NTC_STEINHART_HART_EQU_B 0.000251889f // 1/B
#define NTC_STEINHART_HART_EQU_C 0.000000254f

#define NTC_LPF_FACTOR 5

float ntc_temperature(float kohm);

#ifdef __cplusplus
}
#endif
#endif // _NTC103F397_H_
