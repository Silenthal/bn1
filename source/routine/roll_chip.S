#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Routine_Roll_Chip
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_R_RollC_0_Init_08067bbc
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_RollC_0_Init_08067bbc:
    .word PTR_R_RollC_0_Init_08067bc0

PTR_R_RollC_0_Init_08067bc0:
    .word R_RollC_0_Init
    .word R_RollC_1_Main
    .word R_RollC_2_Free


_ts R_RollC_0_Init
    push       {lr}
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0x63
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_EnableShadow
    mov        r0,#0x2
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    ldrb       r0,[r5,#0x16]
    bl         SpritePtr_SetFlipType
    mov        r0,#0x0
    str        r0,[r5,#0x5c]
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    mov        r0,#0x0
    str        r0,[r5,#0x30]
    bl         Field_GetAttackDirectionOffset_MP
    str        r0,[r5,#0x44]
    mov        r0,#0x0
    strb       r0,[r5,#0x1a]
    mov        r0,#0x4
    str        r0,[r5,#0x8]
    bl         R_RollC_1_Main
    pop        {pc}


_nt R_RollC_1_Main
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_RollC_1_0_WarpIn_08067c30
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

PTR_PTR_R_RollC_1_0_WarpIn_08067c30:
    .word PTR_R_RollC_1_0_WarpIn_08067c34

PTR_R_RollC_1_0_WarpIn_08067c34:
    .word R_RollC_1_0_WarpIn
    .word R_RollC_1_1_Move
    .word R_RollC_1_2_Attack
    .word R_RollC_1_3_WarpOut


_ts R_RollC_1_0_WarpIn
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_RollC_1_0_0_08067c54
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_RollC_1_0_0_08067c54:
    .word PTR_R_RollC_1_0_0_08067c58

PTR_R_RollC_1_0_0_08067c58:
    .word R_RollC_1_0_0
    .word R_RollC_1_0_1


_ts R_RollC_1_0_0
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08067c78
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r0,#0x28
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
LAB_08067c78:
    pop        {pc}


_nt R_RollC_1_0_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08067c90
    bl         R_RollC_FindEnemyPanel
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08067c90:
    pop        {pc}


_nt R_RollC_1_1_Move
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_RollC_1_1_0_08067ca0
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_RollC_1_1_0_08067ca0:
    .word PTR_R_RollC_1_1_0_08067ca4

PTR_R_RollC_1_1_0_08067ca4:
    .word R_RollC_1_1_0
    .word R_RollC_1_1_1
    .word R_RollC_1_1_2


_ts R_RollC_1_1_0
    push       {lr}
    bl         Field_IsEntityCellPositionValid
    tst        r0,r0
    bne        LAB_08067cc4
    mov        r0,#0xc
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}
LAB_08067cc4:
    mov        r3,#0x62
    ldrh       r0,[r5,r3]
    ldrh       r1,[r5,#0x18]
    cmp        r0,r1
    beq        LAB_08067cfc
    mov        r3,#0x62
    ldrb       r0,[r5,r3]
    ldrb       r1,[r5,#0x18]
    sub        r0,r0,r1
    bpl        LAB_08067cda
    neg        r0,r0
LAB_08067cda:
    cmp        r0,#0x1
    bhi        LAB_08067ce8
    mov        r3,#0x62
    ldrb       r0,[r5,r3]
    mov        r3,#0x63
    ldrb       r1,[r5,r3]
    b          LAB_08067cee
LAB_08067ce8:
    ldr        r0,[r5,#0x44]
    add        r0,r0,r1
    ldrb       r1,[r5,#0x19]
LAB_08067cee:
    mov        r3,#0x60
    strb       r0,[r5,r3]
    mov        r3,#0x61
    strb       r1,[r5,r3]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}
LAB_08067cfc:
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}


_nt R_RollC_1_1_1
    push       {lr}
    bl         R_RollC_Move
    ldrb       r0,[r5,#0xb]
    tst        r0,r0
    bne        LAB_08067d1a
    mov        r0,#0x2
    strh       r0,[r5,#0x1c]
    mov        r0,#0x8
    strh       r0,[r5,#0xa]
LAB_08067d1a:
    pop        {pc}


_ts R_RollC_1_1_2
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08067d2a
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08067d2a:
    pop        {pc}


_ts R_RollC_1_2_Attack
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_RollC_1_2_0_08067d3c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_RollC_1_2_0_08067d3c:
    .word PTR_R_RollC_1_2_0_08067d40

PTR_R_RollC_1_2_0_08067d40:
    .word R_RollC_1_2_0
    .word R_RollC_1_2_1
    .word R_RollC_1_2_2
    .word R_RollC_1_2_3


_ts R_RollC_1_2_0
    push       {lr}
    mov        r0,#0x1e
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    pop        {pc}


_ts R_RollC_1_2_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08067d76
    mov        r0,#0x3
    strb       r0,[r5,#0x14]
    mov        r0,#0x64
    strh       r0,[r5,#0x1c]
    mov        r0,#0x0
    strh       r0,[r5,#0x1e]
    mov        r0,#0x8
    strh       r0,[r5,#0xa]
LAB_08067d76:
    pop        {pc}


_ts R_RollC_1_2_2
    push       {lr}
    ldrh       r0,[r5,#0x1e]
    add        r0,#0x1
    strh       r0,[r5,#0x1e]
    mov        r1,#0x7
    tst        r0,r1
    bne        LAB_08067dde
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    mov        r0,#PFI_Target_Solid
    bl         Field_GetPanelFlagGroup
    push       {r1}
    ldrb       r0,[r5,#0x18]
    ldr        r1,[r5,#0x44]
    add        r0,r0,r1
    ldrb       r1,[r5,#0x19]
    bl         FieldObject_GetPanelFlags
    pop        {r1}
    tst        r0,r1
    beq        LAB_08067dde
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r1,r2,r3}
    ldr        r4,[r5,#0x44]
    mov        r6,#0x28
    mul        r4,r6
    lsl        r4,r4,#0x10
    add        r1,r1,r4
    mov        r4,#0xf
    lsl        r4,r4,#0x10
    add        r3,r3,r4
    mov        r0,#0x1f
    bl         Field_GetRandomXZPosOnTarget
    mov        r4,#0x19
    push       {r5}
    bl         Effect_QuickEffect_Create
    tst        r5,r5
    beq        LAB_08067dd6
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r5,#0x0]
LAB_08067dd6:
    pop        {r5}
    mov        r0,#0x6f
    bl         Sound_PlaySE
LAB_08067dde:
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08067e10
    ldrb       r0,[r5,#0x18]
    ldr        r1,[r5,#0x44]
    add        r0,r0,r1
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    mov        r3,#0x0
    mov        r0,#0x0
    ldr        r4,DAT_08067e14
    ldrh       r6,[r5,#0x24]
    mov        r7,#0x1
    bl         Field_CreateSharpStrikeAttack
    mov        r0,#0x6
    strb       r0,[r5,#0x14]
    mov        r0,#0x28
    strh       r0,[r5,#0x1c]
    mov        r0,#0xc
    strh       r0,[r5,#0xa]
LAB_08067e10:
    pop        {pc}

    .align 2, 0


DAT_08067e14:
    .word 0x10000


_ts R_RollC_1_2_3
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08067e2e
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    mov        r0,#0xc
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08067e2e:
    pop        {pc}


_ts R_RollC_1_3_WarpOut
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08067e4c
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0x14
    strh       r0,[r5,#0x1c]
    mov        r0,#0x8
    str        r0,[r5,#0x8]
LAB_08067e4c:
    pop        {pc}


_nt R_RollC_Move
    push       {lr}
    ldrb       r0,[r5,#0xb]
    ldr        r7,PTR_PTR_R_RollC_Move_0_08067e5c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_RollC_Move_0_08067e5c:
    .word PTR_R_RollC_Move_0_08067e60

PTR_R_RollC_Move_0_08067e60:
    .word R_RollC_Move_0
    .word R_RollC_Move_1
    .word R_RollC_Move_2


_ts R_RollC_Move_0
    push       {lr}
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    push       {r5}
    ldr        r1,[r5,#0x28]
    ldr        r2,[r5,#0x2c]
    ldr        r3,[r5,#0x30]
    mov        r0,#0x20
    lsl        r0,r0,#0x10
    add        r3,r3,r0
    mov        r4,#0xf
    bl         Effect_QuickEffect_Create
    tst        r5,r5
    beq        LAB_08067e92
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r5,#0x0]
LAB_08067e92:
    pop        {r5}
    mov        r0,#0xa8
    bl         Sound_PlaySE
    mov        r0,#0x4
    strb       r0,[r5,#0xb]
    pop        {pc}


_ts R_RollC_Move_1
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08067eea
    mov        r3,#0x60
    ldrb       r0,[r5,r3]
    mov        r3,#0x61
    ldrb       r1,[r5,r3]
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    mov        r0,#0x2
    strb       r0,[r5,#0x14]
    push       {r5}
    ldr        r1,[r5,#0x28]
    ldr        r2,[r5,#0x2c]
    ldr        r3,[r5,#0x30]
    mov        r0,#0x20
    lsl        r0,r0,#0x10
    add        r3,r3,r0
    mov        r4,#0x10
    bl         Effect_QuickEffect_Create
    tst        r5,r5
    beq        LAB_08067ee4
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r5,#0x0]
LAB_08067ee4:
    pop        {r5}
    mov        r0,#0x8
    strb       r0,[r5,#0xb]
LAB_08067eea:
    pop        {pc}


_ts R_RollC_Move_2
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08067efc
    mov        r0,#0x0
    strb       r0,[r5,#0xb]
LAB_08067efc:
    pop        {pc}


_nt R_RollC_2_Free
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08067f14
    LoadMain screenDim, r7, r7
    mov        r0,#0x1
    strb       r0,[r7,#0x3]
    bl         Actor_Free
LAB_08067f14:
    pop        {pc}


_nt R_RollC_FindEnemyPanel
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    bl         Field_GetFirstOpponentPanel
    tst        r0,r0
    beq        LAB_08067f2c
    ldr        r2,[r5,#0x44]
    neg        r2,r2
    add        r0,r0,r2
LAB_08067f2c:
    mov        r3,#0x62
    strb       r0,[r5,r3]
    mov        r3,#0x63
    strb       r1,[r5,r3]
    pop        {pc}


_nt Routine_Roll_Chip_Create
    push       {lr}
    push       {r0,r1,r2,r5}
    mov        r0,#0x30
    bl         Actor_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r2,r5}
    tst        r7,r7
    beq        LAB_08067f50
    strb       r0,[r7,#0x16]
    strb       r1,[r7,#0x18]
    strb       r2,[r7,#0x19]
    strh       r6,[r7,#0x24]
LAB_08067f50:
    pop        {pc}

    .align 2, 0

