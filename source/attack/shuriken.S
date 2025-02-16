#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_Shuriken
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s0]
    ldr        r7,PTR_PTR_A_Shuriken_0_Init_08079204
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_A_Shuriken_0_Init_08079204:
    .word PTR_A_Shuriken_0_Init_08079208

PTR_A_Shuriken_0_Init_08079208:
    .word A_Shuriken_0_Init
    .word A_Shuriken_1_Main
    .word A_Shuriken_2_Free


_ts A_Shuriken_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0xb3
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    mov        r0,#0x0
    strb       r0,[r5,#Attack_frameIndexCurr]
    strb       r0,[r5,#Attack_frameIndexLast]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_EnableShadow
    mov        r0,#0x3
    strb       r0,[r5,#Attack_header_entityFlags]
    FieldObject_Create 0x3, Attack_param_60
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_Disable
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s0]
    bl         A_Shuriken_1_Main
    pop        {pc}


_nt A_Shuriken_1_Main
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s1]
    ldr        r7,PTR_PTR_A_Shuriken_1_0_08079260
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_A_Shuriken_1_0_08079260:
    .word PTR_A_Shuriken_1_0_08079264

PTR_A_Shuriken_1_0_08079264:
    .word A_Shuriken_1_0
    .word A_Shuriken_1_1
    .word A_Shuriken_1_2
    .word A_Shuriken_1_3


_ts A_Shuriken_1_0
    push       {lr}
    mov        r0,#0xf
    strh       r0,[r5,#Attack_counterA]
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s1]
    mov        r0,#0x0
    strb       r0,[r5,#Attack_frameIndexCurr]
    pop        {pc}


_ts A_Shuriken_1_1
    push       {lr}
    ldrh       r0,[r5,#Attack_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterA]
    bne        LAB_080792a2
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_Enable
    mov        r0,#0x8
    strb       r0,[r5,#Attack_state_s1]
    mov        r0,#0x1e
    strh       r0,[r5,#Attack_counterA]
    mov        r0,#0x7b
    bl         Sound_PlaySE
LAB_080792a2:
    pop        {pc}


_ts A_Shuriken_1_2
    push       {lr}
    ldrh       r0,[r5,#Attack_counterA]
    cmp        r0,#0x1c
    bne        LAB_080792b2
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_Disable
LAB_080792b2:
    ldrh       r0,[r5,#Attack_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterA]
    bne        LAB_080792c2
    mov        r0,#0x3c
    str        r0,[r5,#Attack_counterA]
    mov        r0,#0xc
    strb       r0,[r5,#Attack_state_s1]
LAB_080792c2:
    pop        {pc}


_ts A_Shuriken_1_3
    push       {lr}
    ldrh       r0,[r5,#Attack_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterA]
    bne        LAB_080792d4
    mov        r0,#0x8
    str        r0,[r5,#Attack_state_s0]
    b          LAB_080792e0
LAB_080792d4:
    mov        r2,#0x1
    mov        r1,#0x2
    tst        r0,r1
    beq        LAB_080792de
    mov        r2,#0x3
LAB_080792de:
    strb       r2,[r5,#Attack_header_entityFlags]
LAB_080792e0:
    pop        {pc}


_nt A_Shuriken_2_Free
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s1]
    ldr        r7,PTR_PTR_A_Shuriken_2_0_080792f4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_A_Shuriken_2_0_080792f0:
    .word A_Shuriken_2_0

PTR_PTR_A_Shuriken_2_0_080792f4:
    .word PTR_A_Shuriken_2_0_080792f0


_ts A_Shuriken_2_0
    push       {lr}
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_Free
    bl         Attack_Free
    pop        {pc}


_nt Attack_Shuriken_Create
    push       {lr}
    push       {r0,r1,r5,r6}
    mov        r0,#0x4c
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r5,r6}
    tst        r7,r7
    beq        LAB_08079330
    ldrb       r3,[r5,#Attack_owner]
    strb       r3,[r7,#0x16]
    strh       r6,[r7,#0x24]
    strb       r0,[r7,#0x18]
    strb       r1,[r7,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r7,#0x28]
    str        r1,[r7,#0x2c]
    ldrh       r1,[r7,#0x2e]
    mov        r2,#0x0
    str        r2,[r7,#0x30]
LAB_08079330:
    add        r0,r7,#0x0
    pop        {pc}
