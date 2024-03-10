#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .text

    .set listScreenDimHandler, 0x80063e0

_ts ScreenDim_Alloc
    ldr        r7,=gScreenDim
    strb       r0,[r7,#0x4]
    strb       r1,[r7,#0x5]
    strb       r2,[r7,#0x6]
    strh       r3,[r7,#0xc]
    mov        r1,#0x0
    str        r1,[r7,#0x0]
    str        r5,[r7,#0x10]
    mov        r0,#0x1
    strb       r0,[r7,#0x7]
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    mov        r0,#0x1
    strb       r0,[r7,#0x18]
    mov        pc,lr

    .align 2, 0

    .pool


_ts ScreenDim_Free
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    mov        r0,#0x0
    strb       r0,[r7,#0x18]
    mov        pc,lr


_nt ScreenDim_UpdateAll
    push       {r5,lr}
    ldr        r5,PTR_gScreenDim_08006a68
    ldrb       r0,[r5,#0x4]
    lsl        r0,r0,#0x2
    ldr        r7,PTR_listScreenDimHandler_08006a64
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {r5,pc}
PTR_listScreenDimHandler_08006a64:
    .word listScreenDimHandler
PTR_gScreenDim_08006a68:
    .word gScreenDim
