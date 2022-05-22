#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .text

    .thumb

thumb_func_start Shop_Main
Shop_Main:
    push       { lr }
    ldr        r5,=gShop
    ldr        r7,=jumpTableShopMain
    ldrb       r0,[r5,#0x0]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        { pc }
thumb_func_end Shop_Main

    .pool

jumpTableShopMain:
    .word 0x801e8d0+1
    .word 0x801e988+1
    .word 0x801ee20+1

    .end
