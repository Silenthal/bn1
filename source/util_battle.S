#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .text

    mov pc,lr
_nt Battle_IncreaseBattleTime
    ldrh       r0,[r5,#0x20]
    add        r0,#0x1
    ldr        r1,=36000
    cmp        r0,r1
    bmi        LAB_08006ab2
    add        r0,r1,#0x0
LAB_08006ab2:
    strh       r0,[r5,#0x20]
    mov        pc,lr
.align 2, 0
.pool

@@ Update the multiple delete count based on the delete buffer.
_ts Battle_ProcessMultipleDelete
    @ Set the current count to the temp count if the temp count is greater
    ldrb       r0,[r5,#0x16]
    ldrb       r1,[r5,#0x17]
    cmp        r0,r1
    bmi        .checkTimer
    strb       r0,[r5,#0x17]
.checkTimer:
    @ Check the buffer timer - if it has run out,
    @ set the temp count to 0. Otherwise, decrease
    @ the timer
    ldrb       r0,[r5,#0x15]
    tst        r0,r0
    beq        .resetCounter
    sub        r0,#0x1
    strb       r0,[r5,#0x15]
    b          0f
.resetCounter:
    mov        r0,#0x0
    strb       r0,[r5,#0x16]
0:
    mov        pc,lr
thumb_func_end Battle_ProcessMultipleDelete