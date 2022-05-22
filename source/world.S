#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .text

    .thumb

thumb_func_start World_Main
World_Main:
    push       { lr }
    ldr        r0,=jumpTableWorldMain
    mov        r7,r10
    ldr        r5,[r7,#0x8]
    ldrb       r1,[r5,#0x0]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Rng_RandomUint
    pop        { pc }
thumb_func_end World_Main

    .pool

jumpTableWorldMain:
    .word 0x8004174+1
    .word 0x8004194+1
    .word 0x8004210+1
    .word 0x800427c+1
    .word 0x80042ec+1
    .word 0x8004340+1
    .word 0x80043a8+1
    .word 0x80043f8+1
    .word 0x8004466+1
    .word 0x80044bc+1

    .end
