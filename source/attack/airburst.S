#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_AirBurst
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_A_AirBurst_0_Init_08079a84
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_A_AirBurst_0_Init_08079a84:
    .word PTR_A_AirBurst_0_Init_08079a88

PTR_A_AirBurst_0_Init_08079a88:
    .word A_AirBurst_0_Init
    .word A_AirBurst_1_Main
    .word A_AirBurst_2_Free


_ts A_AirBurst_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0xcb
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    ldrb       r0,[r5,#0x5]
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_NoShadow
    ldrb       r0,[r5,#0x6]
    bl         SpritePtr_SetPaletteIndex
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    mov        r0,#0x0
    strh       r0,[r5,#0x1c]
    strb       r0,[r5,#0xc]
    mov        r0,#0x0
    strb       r0,[r5,#0x1a]
    mov        r0,#0x3
    mov        r1,#0x64
    add        r1,r1,r5
    bl         Field_CreateEntity
    mov        r0,#0xe0
    bl         Sound_PlaySE
    bl         A_AirBurst_1_Main
    pop        {pc}


_nt A_AirBurst_1_Main
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         FieldObject_GetPanelFlags
    ldr        r7,PTR_listAirBurstTargetFlags_08079b48
    ldrb       r1,[r5,#0x16]
    lsl        r1,r1,#0x2
    ldr        r1,[r7,r1]
    tst        r1,r0
    beq        LAB_08079b0e
    ldr        r0,[r5,#0x64]
    bl         FieldObject_SetDeletedFlag
    mov        r0,#0x8
    strh       r0,[r5,#0x8]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    b          LAB_08079b44
LAB_08079b0e:
    ldrh       r0,[r5,#0x1c]
    add        r0,#0x1
    strh       r0,[r5,#0x1c]
    ldrb       r1,[r5,#0xd]
    cmp        r0,r1
    bne        LAB_08079b32
    ldrb       r0,[r5,#0x4]
    sub        r0,#0x1
    bl         A_AirBurst_GetNextMovePanel
    cmp        r0,#0xff
    beq        LAB_08079b32
    ldrh       r2,[r5,#0x24]
    ldrb       r3,[r5,#0x16]
    ldrb       r4,[r5,#0x4]
    ldrb       r6,[r5,#0xd]
    bl         Attack_AirBurst_Create
LAB_08079b32:
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08079b44
    mov        r0,#0x8
    strh       r0,[r5,#0x8]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08079b44:
    pop        {pc}

    .align 2, 0


PTR_listAirBurstTargetFlags_08079b48:
    .word listAirBurstTargetFlags

listAirBurstTargetFlags:
    .word PF_EnemyOccupied | PF_Solid
    .word PF_PlayerOccupied | PF_Solid


_ts A_AirBurst_2_Free
    push       {lr}
    ldr        r0,[r5,#0x64]
    bl         FieldObject_Free
    bl         Attack_Free
    pop        {pc}


_nt A_AirBurst_GetNextMovePanel
    push       {lr}
    sub        sp,#0x8
    ldr        r7,PTR_CellPosition_ARRAY_08079b9c
    add        r0,r0,r0
    add        r7,r7,r0
    mov        r2,#0x0
    ldrsb      r2,[r7,r2]
    mov        r3,#0x1
    ldrsb      r3,[r7,r3]
    ldrb       r0,[r5,#0x18]
    add        r0,r0,r2
    str        r0,[sp,#0x0]
    ldrb       r1,[r5,#0x19]
    add        r1,r1,r3
    str        r1,[sp,#0x4]
    bl         Battle_IsOutOfBounds
    tst        r0,r0
    beq        LAB_08079b8c
    mov        r0,#0xff
    str        r0,[sp,#0x0]
LAB_08079b8c:
    ldr        r0,[sp,#0x0]
    ldr        r1,[sp,#0x4]
    add        sp,#0x8
    pop        {pc}

CellPosition_ARRAY_08079b94:
    cell_pos 0, -1
    cell_pos 0, 1
    cell_pos -1, 0
    cell_pos 1, 0

PTR_CellPosition_ARRAY_08079b9c:
    .word CellPosition_ARRAY_08079b94


_ts Attack_AirBurst_Create
    push       {lr}
    push       {r0,r1,r2,r3,r5,r6}
    mov        r0,#0x4f
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r2,r3,r5,r6}
    beq        LAB_08079bc6
    strh       r2,[r7,#0x24]
    strb       r3,[r7,#0x16]
    strb       r6,[r7,#0xd]
    strb       r0,[r7,#0x18]
    strb       r1,[r7,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r7,#0x28]
    str        r1,[r7,#0x2c]
    mov        r2,#0x0
    str        r2,[r7,#0x30]
LAB_08079bc6:
    pop        {pc}
