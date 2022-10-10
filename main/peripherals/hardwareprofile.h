#ifndef HARDWAREPROFILE_H_INCLUDED
#define HARDWAREPROFILE_H_INCLUDED


#include "system.h"


#define HAP_OUTPUT_PORT 0
#define HAP_INPUT_PORT  1


#define HAP_SDA_TRIS TRISBbits.TRISB7
#define HAP_SDA_LAT  LATBbits.LATB7
#define HAP_SDA_PORT PORTBbits.RB7
#define HAP_CLK_TRIS TRISBbits.TRISB8
#define HAP_CLK_LAT  LATBbits.LATB8

#define HAP_RUN_TRIS TRISBbits.TRISB11
#define HAP_RUN_LAT  LATBbits.LATB11

#define HAP_CS2_TRIS  TRISBbits.TRISB15
#define HAP_CS2_LAT   LATBbits.LATB15
#define HAP_MOSI_TRIS TRISBbits.TRISB14
#define HAP_MOSI_PORT PORTBbits.RB14
#define HAP_CLCK_TRIS TRISBbits.TRISB13
#define HAP_CLCK_PORT PORTBbits.RB13
#define HAP_MISO_TRIS TRISBbits.TRISB9
#define HAP_MISO_LAT  LATBbits.LATB9
#define HAP_ABIL_TRIS TRISBbits.TRISB12
#define HAP_ABIL_LAT  LATBbits.LATB12


#endif