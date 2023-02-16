#ifndef HEARTBIT_H_INCLUDED
#define HEARTBIT_H_INCLUDED


typedef enum {
    HEARTBIT_STATE_INITIAL = 0,
    HEARTBIT_STATE_OK,
    HEARTBIT_STATE_KO,
} heartbit_state_t;


void heartbit_init(void);
void heartbit_manage(void);
void heartbit_communication_received(void);


#endif