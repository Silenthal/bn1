#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_Unk05
    push       {lr}
    ldr        r7,PTR_PTR_A_Unk05_0_Init_0806fd64
    ldrb       r0,[r5,#Attack_state_s0]
    ldr        r0,[r7,r0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0


PTR_A_Unk05_0_Init_0806fcc4:
    .word A_Unk05_0_Init
    .word A_Unk05_1_Main
    .word A_Unk05_2_Free


_ts A_Unk05_0_Init
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#Attack_header_entityFlags]
    mov        r0,#0x1
    bl         Sprite_InitSpritePtr
    mov        r0,#0x0
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    mov        r0,#0x0
    str        r0,[r5,#Attack_counterA]
    bl         SpritePtr_NoShadow
    bl         Field_GetAttackDirectionOffset_MP
    push       {r0}
    bl         Battle_EntitySpriteCoordsToCell
    pop        {r2}
    add        r0,r0,r2
    strb       r0,[r5,#Attack_cPos_x]
    strb       r1,[r5,#Attack_cPos_y]
    mov        r0,#0x0
    strb       r0,[r5,#Attack_element]
    FieldObject_Create 0x8, Attack_param_60
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s0]
    bl         A_Unk05_1_Main
    pop        {pc}


_ts A_Unk05_1_Main
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    and        r0,r1
    bne        LAB_0806fd44
    bl         SpritePtr_ProcessFrameDelay
    ldrh       r0,[r5,#Attack_counterA]
    add        r0,#0x1
    strh       r0,[r5,#Attack_counterA]
    sub        r0,#0x9
    mov        r1,#0x4
    cmp        r0,r1
    bcs        LAB_0806fd3e
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_Enable
    b          LAB_0806fd42
LAB_0806fd3e:
    bl         FieldObject_Disable
LAB_0806fd42:
    pop        {pc}
LAB_0806fd44:
    mov        r0,#0x8
    strb       r0,[r5,#Attack_state_s0]
    pop        {pc}


_ts A_Unk05_2_Free
    push       {lr}
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_Free
    bl         Attack_Free
    pop        {pc}


_nt Attack_Unk05_Create
    push       {lr}
    mov        r0,#0x5
    bl         Attack_Alloc
    pop        {pc}

PTR_PTR_A_Unk05_0_Init_0806fd64:
    .word PTR_A_Unk05_0_Init_0806fcc4
