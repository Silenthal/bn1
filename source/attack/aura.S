#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

listAuraSpec:
    .byte 0x70, 0x00, 0xCE, 0xFF, 0x00, 0x00, 0x00, 0x00
    .byte 0xB9, 0x00, 0xAB, 0xAD, 0x00, 0x00, 0x00, 0x00
    .byte 0xB9, 0x00, 0xAB, 0xAD, 0x00, 0x00, 0x00, 0x00
    .byte 0xB9, 0x00, 0xAB, 0xAD, 0x00, 0x00, 0x00, 0x00
    .byte 0xB6, 0x00, 0xCE, 0xFF, 0x00, 0x01, 0xC0, 0x01
    .byte 0xB6, 0x00, 0xCE, 0xFF, 0x03, 0x01, 0xE0, 0x00
    .byte 0xB6, 0x00, 0xCE, 0xFF, 0x01, 0x01, 0x60, 0x01
    .byte 0xB6, 0x00, 0xCE, 0xFF, 0x02, 0x01, 0xA0, 0x01
    .byte 0xBA, 0x00, 0xCE, 0xFF, 0x00, 0x00, 0x00, 0x00


_ts Attack_Aura
    push       {lr}
    LoadMain battle, r7, r6
    ldrb       r0,[r7,#0x18]
    tst        r0,r0
    bne        LAB_0806ff98
    ldr        r7,[r6,#0x8]
    ldrb       r0,[r7,#0x9]
    tst        r0,r0
    bne        LAB_0806ffa2
LAB_0806ff98:
    ldrb       r0,[r5,#Attack_state_s0]
    ldr        r7,PTR_PTR_A_Aura_0_Init_0806ffa4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
LAB_0806ffa2:
    pop        {pc}

PTR_PTR_A_Aura_0_Init_0806ffa4:
    .word PTR_A_Aura_0_Init_0806ffa8

PTR_A_Aura_0_Init_0806ffa8:
    .word A_Aura_0_Init
    .word A_Aura_1_Main
    .word A_Aura_2_Free


_ts A_Aura_0_Init
    push       {lr}
    ldrb       r0,[r5,#Attack_header_entityFlags]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#Attack_header_entityFlags]
    ldrb       r0,[r5,#Attack_family_family]
    lsl        r0,r0,#0x3
    ldr        r7,PTR_listAuraSpec_08070018
    add        r7,r7,r0
    str        r7,[r5,#Attack_param_60]
    push       {r7}
    mov        r0,#0x1
    ldrh       r1,[r7,#0x0]
    bl         Sprite_InitSpritePtr
    mov        r0,#0x0
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_ProcessFrameDelay
    pop        {r7}
    ldrb       r0,[r7,#0x4]
    push       {r7}
    bl         SpritePtr_SetPaletteIndex
    pop        {r7}
    push       {r7}
    ldrh       r0,[r7,#0x6]
    lsl        r0,r0,#0x10
    bl         SpritePtr_SetObjectExcludeFlags
    pop        {r7}
    ldrb       r0,[r7,#0x2]
    cmp        r0,#0xff
    beq        LAB_08070002
    bl         Sound_PlaySE
LAB_08070002:
    mov        r0,#0x0
    str        r0,[r5,#Attack_i40]
    mov        r0,#0x1
    strh       r0,[r5,#Attack_hpCurrent]
    bl         A_Aura_MoveToParent
    bl         SpritePtr_NoShadow
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s0]
    pop        {pc}

PTR_listAuraSpec_08070018:
    .word listAuraSpec


_ts A_Aura_1_Main
    push       {lr}
    bl         A_Aura_MoveToParent
    bl         SpritePtr_ProcessFrameDelay
    ldrb       r0,[r5,#Attack_family_b1]
    tst        r0,r0
    beq        LAB_08070030
    bl         A_Aura_2_Free
LAB_08070030:
    pop        {pc}


_nt A_Aura_2_Free
    push       {lr}
    ldr        r7,[r5,#Attack_param_60]
    ldrb       r0,[r7,#0x3]
    cmp        r0,#0xff
    beq        LAB_08070040
    bl         Sound_PlaySE
LAB_08070040:
    bl         Attack_Free
    pop        {pc}


_nt A_Aura_MoveToParent
    ldr        r7,[r5,#Attack_param_60]
    ldrb       r1,[r7,#0x5]
    lsl        r1,r1,#0x10
    ldr        r7,[r5,#Attack_param_64]
    ldr        r0,[r7,#0x28]
    str        r0,[r5,#Attack_pos_curr_x]
    ldr        r0,[r7,#0x2c]
    sub        r0,r0,r1
    str        r0,[r5,#Attack_pos_curr_y]
    ldr        r0,[r7,#0x30]
    sub        r0,r0,r1
    str        r0,[r5,#Attack_pos_curr_z]
    ldrb       r0,[r7,#0x0]
    mov        r2,#0x2
    and        r0,r2
    ldrb       r1,[r5,#Attack_header_entityFlags]
    bic        r1,r2
    orr        r0,r1
    strb       r0,[r5,#Attack_header_entityFlags]
    mov        pc,lr


_nt Attack_Aura_Create
    push       {lr}
    push       {r5}
    mov        r0,#0x8
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r5}
    beq        LAB_08070080
    str        r5,[r7,#0x64]
LAB_08070080:
    pop        {pc}

    .align 2, 0

