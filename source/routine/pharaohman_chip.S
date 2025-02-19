#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Routine_PharaohMan_Chip
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s0]
    ldr        r7,PTR_PTR_R_PharaohManC_0_Init_0806d86c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_PharaohManC_0_Init_0806d86c:
    .word PTR_R_PharaohManC_0_Init_0806d870

PTR_R_PharaohManC_0_Init_0806d870:
    .word R_PharaohManC_0_Init
    .word R_PharaohManC_1_Main
    .word R_PharaohManC_2_Free


_ts R_PharaohManC_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0x61
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    mov        r0,#0x0
    strb       r0,[r5,#Actor_frameIndexCurr]
    strb       r0,[r5,#Actor_frameIndexLast]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_EnableShadow
    LoadMain battle, r7, r7
    add        r7,#0x40
    ldrb       r0,[r5,#Actor_owner]
    lsl        r0,r0,#0x2
    ldr        r7,[r7,r0]
    ldrb       r0,[r7,#0x18]
    strb       r0,[r5,#Actor_cPos_x]
    ldrb       r1,[r7,#0x19]
    strb       r1,[r5,#Actor_cPos_y]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#Actor_pos_curr_x]
    str        r1,[r5,#Actor_pos_curr_y]
    mov        r0,#0x0
    str        r0,[r5,#Actor_pos_curr_z]
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s0]
    mov        r0,#0x1
    ldrb       r1,[r5,#Actor_owner]
    tst        r1,r1
    beq        LAB_0806d8ca
    mov        r0,#0x0
LAB_0806d8ca:
    bl         SpritePtr_SetFlipType
    mov        r0,#0xde
    bl         Sound_PlaySE
    mov        r0,#0x4
    strh       r0,[r5,#Actor_counterB]
    pop        {pc}


_nt R_PharaohManC_1_Main
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldrb       r0,[r5,#Actor_state_s1]
    ldr        r7,PTR_PTR_R_PharaohManC_1_0_MoveBackwards_0806d8f0
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_PharaohManC_1_0_MoveBackwards_0806d8f0:
    .word PTR_R_PharaohManC_1_0_MoveBackwards_0806d8f4

PTR_R_PharaohManC_1_0_MoveBackwards_0806d8f4:
    .word R_PharaohManC_1_0_MoveBackwards
    .word R_PharaohManC_1_1


_ts R_PharaohManC_1_0_MoveBackwards
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_PTR_R_PharaohManC_1_0_0_Wait_0806d914
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_PharaohManC_1_0_0_Wait_0806d90c:
    .word R_PharaohManC_1_0_0_Wait
    .word R_PharaohManC_1_0_1_MoveBackwards

PTR_PTR_R_PharaohManC_1_0_0_Wait_0806d914:
    .word PTR_R_PharaohManC_1_0_0_Wait_0806d90c


_ts R_PharaohManC_1_0_0_Wait
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s3]
    tst        r0,r0
    bne        LAB_0806d92e
    mov        r0,#0x0
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x1e
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s3]
    b          LAB_0806d948
LAB_0806d92e:
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0806d948
    mov        r0,#0x4
    strh       r0,[r5,#Actor_state_s2]
    bl         Field_GetAttackDirectionOffset_MP
    mov        r1,#0x1
    lsl        r1,r1,#0x10
    mul        r1,r0
    neg        r1,r1
    str        r1,[r5,#Actor_diff_x]
LAB_0806d948:
    pop        {pc}


_nt R_PharaohManC_1_0_1_MoveBackwards
    push       {lr}
    mov        r0,#0xf
    bl         Field_IsOnscreenX
    tst        r0,r0
    beq        LAB_0806d960
    ldr        r1,[r5,#Actor_diff_x]
    ldr        r0,[r5,#Actor_pos_curr_x]
    add        r0,r0,r1
    str        r0,[r5,#Actor_pos_curr_x]
    b          LAB_0806d968
LAB_0806d960:
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_0806d968:
    pop        {pc}


_nt R_PharaohManC_1_1
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_PTR_R_PharaohManC_1_1_0_0806d984
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_R_PharaohManC_1_1_0_0806d978:
    .word R_PharaohManC_1_1_0
    .word R_PharaohManC_1_1_1
    .word R_PharaohManC_1_1_2

PTR_PTR_R_PharaohManC_1_1_0_0806d984:
    .word PTR_R_PharaohManC_1_1_0_0806d978


_ts R_PharaohManC_1_1_0
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#Actor_b1b]
    str        r0,[r5,#Actor_param_64]
    str        r0,[r5,#Actor_param_68]
    str        r0,[r5,#Actor_param_6C]
    str        r0,[r5,#Actor_param_70]
    mov        r1,#0x1
    ldrb       r0,[r5,#Actor_cPos_x]
    mov        r7,#0x70
    add        r7,r7,r5
    mov        r2,#0x0
LAB_0806d9a0:
    push       {r0,r1,r2,r7}
    bl         R_PharaohManC_IsCellClear
    tst        r0,r0
    pop        {r0,r1,r2,r7}
    beq        LAB_0806d9b0
    strb       r1,[r7,r2]
    add        r2,#0x1
LAB_0806d9b0:
    add        r1,#0x1
    cmp        r1,#0x3
    ble        LAB_0806d9a0
    tst        r2,r2
    beq        LAB_0806d9c6
    mov        r0,#0x70
    add        r0,r0,r5
    add        r1,r2,#0x0
    mov        r2,#0xa
    bl         ArrayShuffle
LAB_0806d9c6:
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s2]
    mov        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    pop        {pc}


_ts R_PharaohManC_1_1_1
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0806da12
    ldrb       r1,[r5,#Actor_b1b]
    add        r1,#0x70
    ldrb       r1,[r5,r1]
    tst        r1,r1
    beq        LAB_0806da0e
    ldrb       r0,[r5,#Actor_cPos_x]
    ldrb       r2,[r5,#Actor_b1b]
    lsl        r2,r2,#0x2
    add        r2,#0x64
    add        r2,r2,r5
    push       {r0,r1}
    ldrb       r6,[r5,#Actor_family_family]
    mov        r0,#0x94
    add        r0,r0,r6
    bl         BattleChip_GetChipData
    ldrh       r6,[r0,#0xc]
    pop        {r0,r1}
    bl         Attack_PharaohManCoffin_Create
    mov        r0,#0x3c
    strh       r0,[r5,#Actor_counterA]
    ldrb       r1,[r5,#Actor_b1b]
    add        r1,#0x1
    strb       r1,[r5,#Actor_b1b]
    b          LAB_0806da12
LAB_0806da0e:
    mov        r0,#0x8
    strh       r0,[r5,#Actor_state_s2]
LAB_0806da12:
    pop        {pc}


_ts R_PharaohManC_1_1_2
    push       {lr}
    mov        r1,#0x0
    ldr        r0,[r5,#Actor_param_64]
    orr        r1,r0
    ldr        r0,[r5,#Actor_param_68]
    orr        r1,r0
    ldr        r0,[r5,#Actor_param_6C]
    orr        r1,r0
    bne        LAB_0806da2a
    mov        r0,#0x8
    str        r0,[r5,#Actor_state_s0]
LAB_0806da2a:
    pop        {pc}


_ts R_PharaohManC_2_Free
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s1]
    tst        r0,r0
    bne        LAB_0806da3c
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x1e
    strh       r0,[r5,#Actor_counterA]
LAB_0806da3c:
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0806da4e
    bl         Actor_Free
    ldr        r7,PTR_gScreenDim_0806da50
    mov        r0,#0x1
    strb       r0,[r7,#0x3]
LAB_0806da4e:
    pop        {pc}

PTR_gScreenDim_0806da50:
    .word gScreenDim


_ts Routine_PharaohMan_Chip_Create
    push       {lr}
    push       {r1,r5}
    mov        r0,#0x48
    bl         Actor_Alloc
    pop        {r1,r6}
    tst        r5,r5
    beq        LAB_0806da6a
    mov        r0,#0xf
    strb       r0,[r5,#Actor_header_entityFlags]
    strb       r1,[r5,#Actor_owner]
LAB_0806da6a:
    pop        {pc}


_ts R_PharaohManC_IsCellClear
    push       {lr}
    bl         FieldObject_GetPanelFlags
    ldr        r7,PTR_PanelFlag_ARRAY_ARRAY_0806da90
    ldrb       r2,[r5,#Actor_owner]
    lsl        r2,r2,#0x3
    add        r7,r7,r2
    ldr        r2,[r7,#0x0]
    tst        r0,r2
    beq        LAB_0806da8a
    ldr        r2,[r7,#0x4]
    tst        r0,r2
    bne        LAB_0806da8a
    mov        r0,#0x1
    b          LAB_0806da8c
LAB_0806da8a:
    mov        r0,#0x0
LAB_0806da8c:
    pop        {pc}

    .align 2, 0


PTR_PanelFlag_ARRAY_ARRAY_0806da90:
    .word PanelFlag_ARRAY_ARRAY_0806da94

PanelFlag_ARRAY_ARRAY_0806da94:
    .word PF_Walkable
    .word PF_EnemyOccupied | PF_Solid
    .word PF_Walkable
    .word PF_PlayerOccupied | PF_Solid
