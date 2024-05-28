#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set Attack_PharaohManCoffin_Create, 0x807A596+1


_ts Routine_PharaohMan_Chip
    push       {lr}
    ldrb       r0,[r5,#0x8]
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
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_SetZClip
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    add        r7,#0x40
    ldrb       r0,[r5,#0x16]
    lsl        r0,r0,#0x2
    ldr        r7,[r7,r0]
    ldrb       r0,[r7,#0x18]
    strb       r0,[r5,#0x18]
    ldrb       r1,[r7,#0x19]
    strb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    mov        r0,#0x0
    str        r0,[r5,#0x30]
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    mov        r0,#0x1
    ldrb       r1,[r5,#0x16]
    tst        r1,r1
    beq        LAB_0806d8ca
    mov        r0,#0x0
LAB_0806d8ca:
    bl         SpritePtr_SetFlipType
    mov        r0,#0xde
    bl         Sound_PlaySongImmediate
    mov        r0,#0x4
    strh       r0,[r5,#0x1e]
    pop        {pc}


_nt R_PharaohManC_1_Main
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldrb       r0,[r5,#0x9]
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
    ldrb       r0,[r5,#0xa]
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
    ldrb       r0,[r5,#0xb]
    tst        r0,r0
    bne        LAB_0806d92e
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r0,#0x1e
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0xb]
    b          LAB_0806d948
LAB_0806d92e:
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806d948
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    bl         Field_GetAttackDirectionOffset_MP
    mov        r1,#0x1
    lsl        r1,r1,#0x10
    mul        r1,r0
    neg        r1,r1
    str        r1,[r5,#0x44]
LAB_0806d948:
    pop        {pc}


_nt R_PharaohManC_1_0_1_MoveBackwards
    push       {lr}
    mov        r0,#0xf
    bl         Battle_IsOnscreenX
    tst        r0,r0
    beq        LAB_0806d960
    ldr        r1,[r5,#0x44]
    ldr        r0,[r5,#0x28]
    add        r0,r0,r1
    str        r0,[r5,#0x28]
    b          LAB_0806d968
LAB_0806d960:
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0806d968:
    pop        {pc}


_nt R_PharaohManC_1_1
    push       {lr}
    ldrb       r0,[r5,#0xa]
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
    strb       r0,[r5,#0x1b]
    str        r0,[r5,#0x64]
    str        r0,[r5,#0x68]
    str        r0,[r5,#0x6c]
    str        r0,[r5,#0x70]
    mov        r1,#0x1
    ldrb       r0,[r5,#0x18]
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
    strb       r0,[r5,#0xa]
    mov        r0,#0x1
    strh       r0,[r5,#0x1c]
    pop        {pc}


_ts R_PharaohManC_1_1_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806da12
    ldrb       r1,[r5,#0x1b]
    add        r1,#0x70
    ldrb       r1,[r5,r1]
    tst        r1,r1
    beq        LAB_0806da0e
    ldrb       r0,[r5,#0x18]
    ldrb       r2,[r5,#0x1b]
    lsl        r2,r2,#0x2
    add        r2,#0x64
    add        r2,r2,r5
    push       {r0,r1}
    ldrb       r6,[r5,#0x4]
    mov        r0,#0x94
    add        r0,r0,r6
    bl         BattleChip_GetChipData
    ldrh       r6,[r0,#0xc]
    pop        {r0,r1}
    bl         Attack_PharaohManCoffin_Create
    mov        r0,#0x3c
    strh       r0,[r5,#0x1c]
    ldrb       r1,[r5,#0x1b]
    add        r1,#0x1
    strb       r1,[r5,#0x1b]
    b          LAB_0806da12
LAB_0806da0e:
    mov        r0,#0x8
    strh       r0,[r5,#0xa]
LAB_0806da12:
    pop        {pc}


_ts R_PharaohManC_1_1_2
    push       {lr}
    mov        r1,#0x0
    ldr        r0,[r5,#0x64]
    orr        r1,r0
    ldr        r0,[r5,#0x68]
    orr        r1,r0
    ldr        r0,[r5,#0x6c]
    orr        r1,r0
    bne        LAB_0806da2a
    mov        r0,#0x8
    str        r0,[r5,#0x8]
LAB_0806da2a:
    pop        {pc}


_ts R_PharaohManC_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x9]
    tst        r0,r0
    bne        LAB_0806da3c
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x1e
    strh       r0,[r5,#0x1c]
LAB_0806da3c:
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
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
    strb       r0,[r5,#0x0]
    strb       r1,[r5,#0x16]
LAB_0806da6a:
    pop        {pc}


_ts R_PharaohManC_IsCellClear
    push       {lr}
    bl         Field_GetPanelFlags
    ldr        r7,PTR_PanelFlag_ARRAY_ARRAY_0806da90
    ldrb       r2,[r5,#0x16]
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
