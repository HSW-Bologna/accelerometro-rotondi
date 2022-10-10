#include "peripherals/system.h"
#include "peripherals/hardwareprofile.h"
#include "peripherals/timer.h"
#include "peripherals/heartbit.h"
#include "gel/timer/timecheck.h"


int main(void) {
    system_init();
    timer_init();
    heartbit_init();
    
    for (;;) {
        heartbit_manage();
        
        Idle(); // Also clears WDT
    }
    
    return 0;
}