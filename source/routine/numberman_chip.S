#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Routine_NumberMan_Chip
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s0]
    ldr        r7,PTR_PTR_R_NumberManC_0_Init_0805fba8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_NumberManC_0_Init_0805fba8:
    .word PTR_R_NumberManC_0_Init_0805fbac

PTR_R_NumberManC_0_Init_0805fbac:
    .word R_NumberManC_0_Init
    .word R_NumberManC_1_Main
    .word R_NumberManC_2_Free


_ts R_NumberManC_0_Init
    push       {lr}
    ldrb       r0,[r5,#Actor_header_entityFlags]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#Actor_header_entityFlags]
    mov        r0,#0x1
    mov        r1,#0x24
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_EnableShadow
    mov        r0,#0x2
    strb       r0,[r5,#Actor_frameIndexCurr]
    strb       r0,[r5,#Actor_frameIndexLast]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    ldrb       r0,[r5,#Actor_owner]
    neg        r0,r0
    add        r0,#0x1
    bl         SpritePtr_SetFlipType
    ldrb       r0,[r5,#Actor_cPos_x]
    ldrb       r1,[r5,#Actor_cPos_y]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#Actor_pos_curr_x]
    str        r1,[r5,#Actor_pos_curr_y]
    mov        r0,#0x0
    str        r0,[r5,#Actor_pos_curr_z]
    mov        r0,#0x0
    strb       r0,[r5,#Actor_element]
    mov        r0,#0x4
    str        r0,[r5,#Actor_state_s0]
    bl         R_NumberManC_1_Main
    pop        {pc}


_ts R_NumberManC_1_Main
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s1]
    ldr        r7,PTR_PTR_R_NumberManC_1_0_Ready_0805fc18
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_NumberManC_1_0_Ready_0805fc18:
    .word PTR_R_NumberManC_1_0_Ready_0805fc1c

PTR_R_NumberManC_1_0_Ready_0805fc1c:
    .word R_NumberManC_1_0_Ready
    .word R_NumberManC_1_1_DieBomb
    .word R_NumberManC_1_2_Next


_ts R_NumberManC_1_0_Ready
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_PTR_R_NumberManC_1_0_0_Ready_0805fc38
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_NumberManC_1_0_0_Ready_0805fc38:
    .word PTR_R_NumberManC_1_0_0_Ready_0805fc3c

PTR_R_NumberManC_1_0_0_Ready_0805fc3c:
    .word R_NumberManC_1_0_0_Ready
    .word R_NumberManC_1_0_1_Next


_ts R_NumberManC_1_0_0_Ready
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0805fc5c
    mov        r0,#0x0
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x2d
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x4
    strh       r0,[r5,#Actor_state_s2]
LAB_0805fc5c:
    pop        {pc}


_nt R_NumberManC_1_0_1_Next
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0805fc70
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_0805fc70:
    pop        {pc}


_nt R_NumberManC_1_1_DieBomb
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_PTR_R_NumberManC_1_1_0_Charge_0805fc80
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_NumberManC_1_1_0_Charge_0805fc80:
    .word PTR_R_NumberManC_1_1_0_Charge_0805fc84

PTR_R_NumberManC_1_1_0_Charge_0805fc84:
    .word R_NumberManC_1_1_0_Charge
    .word R_NumberManC_1_1_1_DieBomb
    .word R_NumberManC_1_1_2_Wait
    .word R_NumberManC_1_1_3_Next


_ts R_NumberManC_1_1_0_Charge
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r3,#0x28
    add        r7,r5,r3
    ldmia      r7!,{r1,r2,r3}
    mov        r0,#0x82
    lsl        r4,r0,#0x10
    ldrb       r0,[r5,#Actor_owner]
    neg        r0,r0
    add        r0,#0x1
    bl         Attack_AnimationOnly_Create
    tst        r7,r7
    beq        LAB_0805fcba
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r7,#0x0]
LAB_0805fcba:
    str        r7,[r5,#Actor_param_5C]
    mov        r0,#0x8f
    bl         Sound_PlaySE
    mov        r0,#0x4
    strh       r0,[r5,#Actor_state_s2]
    pop        {pc}


_ts R_NumberManC_1_1_1_DieBomb
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x81
    tst        r0,r1
    beq        LAB_0805fcfa
    ldrb       r0,[r5,#Actor_owner]
    bl         Field_FindEmptyEnemyPanelForward
    tst        r0,r0
    beq        LAB_0805fcf6
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    ldrb       r4,[r5,#Actor_family_family]
    ldrh       r6,[r5,#Actor_damage]
    bl         Attack_DieBombChip_Create
    tst        r7,r7
    beq        LAB_0805fcf6
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r7,#0x0]
LAB_0805fcf6:
    mov        r0,#0x8
    strh       r0,[r5,#Actor_state_s2]
LAB_0805fcfa:
    pop        {pc}
    .word DAT_0805fd00

DAT_0805fd00:
    .byte 0x03
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x01
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x02


_ts R_NumberManC_1_1_2_Wait
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0805fd28
    mov        r0,#0x0
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0xff
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0xc
    strh       r0,[r5,#Actor_state_s2]
LAB_0805fd28:
    pop        {pc}


_nt R_NumberManC_1_1_3_Next
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0805fd40
    mov        r0,#0x1
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_0805fd40:
    pop        {pc}


_nt R_NumberManC_1_2_Next
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0805fd5e
    ldrb       r0,[r5,#Actor_header_entityFlags]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r5,#Actor_header_entityFlags]
    mov        r0,#0x3c
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x8
    str        r0,[r5,#Actor_state_s0]
LAB_0805fd5e:
    pop        {pc}


_ts R_NumberManC_2_Free
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0805fd76
    LoadMain screenDim, r7, r7
    mov        r0,#0x1
    strb       r0,[r7,#0x3]
    bl         Actor_Free
LAB_0805fd76:
    pop        {pc}


_ts Routine_NumberMan_Chip_Create
    push       {lr}
    push       {r0,r1,r2,r5,r6}
    mov        r0,#0x17
    bl         Actor_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r2,r5,r6}
    beq        LAB_0805fd90
    strb       r0,[r7,#0x16]
    strb       r1,[r7,#0x18]
    strb       r2,[r7,#0x19]
    strh       r6,[r7,#0x24]
LAB_0805fd90:
    pop        {pc}

    .align 2, 0

