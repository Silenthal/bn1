#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_Charging
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_A_Charging_0_Init_08070328
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_A_Charging_0_Init_08070328:
    .word PTR_A_Charging_0_Init_0807032c

PTR_A_Charging_0_Init_0807032c:
    .word A_Charging_0_Init
    .word A_Charging_1_Main
    .word A_Charging_2_Free


_ts A_Charging_0_Init
    push       {lr}
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x3
    orr        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0x72
    bl         Sprite_InitSpritePtr
    mov        r0,#0x0
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_ProcessFrameDelay
    ldr        r7,[r5,#0x60]
    ldr        r0,[r7,#0x28]
    str        r0,[r5,#0x28]
    ldr        r0,[r7,#0x2c]
    str        r0,[r5,#0x2c]
    ldr        r0,[r7,#0x30]
    str        r0,[r5,#0x30]
    bl         SpritePtr_NoZClip
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    bl         A_Charging_1_Main
    pop        {pc}


_ts A_Charging_1_Main
    push       {lr}
    ldr        r7,[r5,#0x60]
    ldr        r0,[r7,#0x28]
    str        r0,[r5,#0x28]
    ldr        r0,[r7,#0x2c]
    str        r0,[r5,#0x2c]
    ldr        r0,[r7,#0x30]
    str        r0,[r5,#0x30]
    bl         UpdateSpriteFrameIndex
    pop        {pc}


_nt A_Charging_2_Free
    push       {lr}
    bl         Attack_Free
    pop        {pc}


_nt Attack_Charging_Create
    push       {lr}
    push       {r5}
    mov        r0,#0xb
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r5}
    tst        r7,r7
    beq        LAB_080703a6
    str        r5,[r7,#0x60]
LAB_080703a6:
    pop        {pc}
