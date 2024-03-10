#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .text

    .thumb

_ts SIO_GetMultiplayerId
    push       { lr }
    ldr        r0,=REG_SIOCNT
    ldr        r0,[r0,#0x0]
    mov        r1,#0x30
    and        r0,r1
    lsr        r0,r0,#0x4
    pop        { pc }
