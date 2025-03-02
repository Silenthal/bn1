#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Routine_ShadowMan_Chip
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s0]
    ldr        r7,PTR_PTR_R_ShadowManC_0_Init_0806dab8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_ShadowManC_0_Init_0806dab8:
    .word PTR_R_ShadowManC_0_Init_0806dabc

PTR_R_ShadowManC_0_Init_0806dabc:
    .word R_ShadowManC_0_Init
    .word R_ShadowManC_1_Main
    .word R_ShadowManC_2_Free


_ts R_ShadowManC_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0x62
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    mov        r0,#0x2
    strb       r0,[r5,#Actor_frameIndexCurr]
    strb       r0,[r5,#Actor_frameIndexLast]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_EnableShadow
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s0]
    mov        r0,#0x1
    ldrb       r1,[r5,#Actor_owner]
    tst        r1,r1
    beq        LAB_0806daf6
    mov        r0,#0x0
LAB_0806daf6:
    bl         SpritePtr_SetFlipType
    mov        r0,#0xde
    bl         Sound_PlaySE
    pop        {pc}


_nt R_ShadowManC_1_Main
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s1]
    ldr        r7,PTR_PTR_R_ShadowMan_1_0_Main_0806db10
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_ShadowMan_1_0_Main_0806db10:
    .word PTR_R_ShadowMan_1_0_Main_0806db14

PTR_R_ShadowMan_1_0_Main_0806db14:
    .word R_ShadowMan_1_0_Main


_ts R_ShadowMan_1_0_Main
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_PTR_R_ShadowManC_1_0_0_0806db38
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_ShadowManC_1_0_0_0806db28:
    .word R_ShadowManC_1_0_0
    .word R_ShadowManC_1_0_1
    .word R_ShadowManC_1_0_2
    .word R_ShadowManC_1_0_3

PTR_PTR_R_ShadowManC_1_0_0_0806db38:
    .word PTR_R_ShadowManC_1_0_0_0806db28


_ts R_ShadowManC_1_0_0
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806db50
    mov        r0,#0x0
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s2]
LAB_0806db50:
    pop        {pc}


_nt R_ShadowManC_1_0_1
    push       {lr}
    ldrh       r0,[r5,#Actor_counterB]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterB]
    bne        LAB_0806db86
    ldrb       r0,[r5,#Actor_bd]
    ldrb       r1,[r5,#Actor_be]
    push       {r0,r1}
    ldrb       r6,[r5,#Actor_family_family]
    mov        r0,#0x97
    add        r0,r0,r6
    bl         BattleChip_GetChipData
    ldrh       r6,[r0,#0xc]
    pop        {r0,r1}
    bl         Attack_Shuriken_Chip_Create
    mov        r0,#0xb7
    bl         Sound_PlaySE
    mov        r0,#0x3
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s2]
    mov        r0,#0x14
    strh       r0,[r5,#Actor_counterA]
LAB_0806db86:
    pop        {pc}


_ts R_ShadowManC_1_0_2
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0806db9a
    mov        r0,#0x1
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0xc
    strb       r0,[r5,#Actor_state_s2]
LAB_0806db9a:
    pop        {pc}


_ts R_ShadowManC_1_0_3
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806dbb0
    mov        r0,#0x5
    strb       r0,[r5,#Actor_header_entityFlags]
    mov        r0,#0x8
    str        r0,[r5,#Actor_state_s0]
LAB_0806dbb0:
    pop        {pc}


_nt R_ShadowManC_2_Free
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s1]
    tst        r0,r0
    bne        LAB_0806dbc2
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x3c
    strh       r0,[r5,#Actor_counterA]
LAB_0806dbc2:
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0806dbd4
    bl         Actor_Free
    ldr        r7,PTR_gScreenDim_0806dbd8
    mov        r0,#0x1
    strb       r0,[r7,#0x3]
LAB_0806dbd4:
    pop        {pc}

    .align 2, 0


PTR_gScreenDim_0806dbd8:
    .word gScreenDim


_ts Routine_ShadowMan_Chip_Create
    push       {lr}
    push       {r0,r1,r2,r3,r5,r6}
    mov        r0,#0x49
    bl         Actor_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r2,r3,r5,r6}
    beq        LAB_0806dc24
    strb       r0,[r7,#0xd]
    strb       r1,[r7,#0xe]
    strb       r2,[r7,#0x16]
    strh       r3,[r7,#0x1e]
    mov        r0,#0xf
    strb       r0,[r7,#0x0]
    LoadMain battle, r4, r4
    ldrb       r0,[r4,#Battle_sioOwnerId]
    ldrb       r1,[r7,#0x16]
    eor        r0,r1
    mov        r1,#0x6
    mul        r0,r1
    add        r6,r6,r6
    ldr        r4,PTR_listShadowManPosition_0806dc34
    add        r4,r4,r0
    add        r4,r4,r6
    ldrb       r0,[r4,#0x0]
    strb       r0,[r7,#0x18]
    ldrb       r1,[r4,#0x1]
    strb       r1,[r7,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r7,#0x28]
    str        r1,[r7,#0x2c]
    mov        r2,#0x18
    lsl        r2,r2,#0x10
    str        r2,[r7,#0x30]
LAB_0806dc24:
    pop        {pc}

listShadowManPosition:
    cell_pos 1, 1
    cell_pos 1, 2
    cell_pos 1, 3
    cell_pos 6, 1
    cell_pos 6, 2
    cell_pos 6, 3

    .align 2, 0


PTR_listShadowManPosition_0806dc34:
    .word listShadowManPosition
