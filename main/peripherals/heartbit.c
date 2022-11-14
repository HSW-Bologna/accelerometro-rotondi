#include "hardwareprofile.h"
#include "heartbit.h"
#include "timer.h"
#include "gel/timer/timecheck.h"


static unsigned long heartbeat_ts = 0;
static unsigned long heartbeat_period = 500;


void heartbit_init(void) {
    HAP_RUN_TRIS = HAP_OUTPUT_PORT;
}


void heartbit_manage(void) {
    if (is_expired(heartbeat_ts, get_millis(), heartbeat_period)) {
        if (HAP_RUN_LAT) {
            heartbeat_period = 500;
            HAP_RUN_LAT = 0;
        } else {
            heartbeat_period = 50;
            HAP_RUN_LAT = 1;
        }
        heartbeat_ts = get_millis();
    }
}