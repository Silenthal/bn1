#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    
    .set JackIn_Init, 0x801753c
    .set JackIn_Animate, 0x801756c
    .set JackIn_Finish, 0x8017584
    .set JackOut_Init, 0x801780c
    .set JackOut_Animate, 0x8017814
    .set JackOut_Finish, 0x801781c

    .text

    .thumb

_ts InitTransition
    push       { lr }
    mov        r7,r10
    ldr        r5,[r7,#0x30]
    ldrb       r1,[r5,#0x3]
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    strb       r1,[r5,#0x3]
    pop        { pc }

_ts Transition_Main
    push       { lr }
    mov        r7,r10
    ldr        r5,[r7,#0x30]
    ldr        r2,[r7,#0x8]
    ldrb       r0,[r2,#0x4]
    cmp        r0,#0x80
    bge        LAB_08017516
    .byte 0xCF, 0x48 @ ldr        r0,PTR_jumpTableJackIn_08017850
    b          LAB_08017518
LAB_08017516:
    .byte 0xCF, 0x48 @ ldr        r0,PTR_jumpTableJackOut_08017854
LAB_08017518:
    ldrb       r1,[r5,#0x0]
    lsl        r1,r1,#0x2
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        { pc }

jumpTableJackIn:
    .word JackIn_Init+1
    .word JackIn_Animate+1
    .word JackIn_Finish+1
jumpTableJackOut:
    .word JackOut_Init+1
    .word JackOut_Animate+1
    .word JackOut_Finish+1
