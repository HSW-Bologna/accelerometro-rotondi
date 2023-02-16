#include "hardwareprofile.h"
#include "heartbit.h"
#include "timer.h"
#include "gel/timer/timecheck.h"


static unsigned long heartbeat_ts = 0;
static unsigned long heartbeat_period = 100;
static unsigned long activity_ts = 0;
static heartbit_state_t state = HEARTBIT_STATE_INITIAL;


void heartbit_init(void) {
    HAP_RUN_TRIS = HAP_OUTPUT_PORT;
}


void heartbit_communication_received(void) {
    state = HEARTBIT_STATE_OK;
    activity_ts = get_millis();
}


void heartbit_manage(void) {
    uint8_t update = 0;
    
    if (state == HEARTBIT_STATE_OK && is_expired(activity_ts, get_millis(), 4000UL)) {
        update = 1;
        state = HEARTBIT_STATE_KO;
    }
    
    if (update || is_expired(heartbeat_ts, get_millis(), heartbeat_period)) {
        switch(state) {
            case HEARTBIT_STATE_INITIAL:
                heartbeat_period = 100;
                break;
                
            case HEARTBIT_STATE_OK:
                heartbeat_period = 1000;
                break;
                
            case HEARTBIT_STATE_KO:
                if (HAP_RUN_LAT) {
                    heartbeat_period = 1500;
                } else {
                    heartbeat_period = 500;
                }
                break;
        }
        
        if (HAP_RUN_LAT) {
            HAP_RUN_LAT = 0;
        } else {
            HAP_RUN_LAT = 1;
        }
        
        heartbeat_ts = get_millis();
    }
}