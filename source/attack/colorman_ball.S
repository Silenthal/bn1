#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_ColorManBall
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_A_ColorManBall_0_Init_08074fd0
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_A_ColorManBall_0_Init_08074fc4:
    .word A_ColorManBall_0_Init
    .word A_ColorManBall_1_Main
    .word A_ColorManBall_2_Free

PTR_PTR_A_ColorManBall_0_Init_08074fd0:
    .word PTR_A_ColorManBall_0_Init_08074fc4


_ts A_ColorManBall_0_Init
    push       {lr}
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x3
    orr        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0xa4
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_EnableShadow
    mov        r0,#0x0
    strh       r0,[r5,#0x14]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    mov        r0,#0x60
    lsl        r0,r0,#0x10
    str        r0,[r5,#0x30]
    mov        r0,#0x0
    str        r0,[r5,#0x4c]
    mov        r0,#0x64
    strh       r0,[r5,#0x20]
    strh       r0,[r5,#0x22]
    mov        r0,#0x0
    strb       r0,[r5,#0x1a]
    mov        r0,#0x1a
    mov        r1,#0x60
    add        r1,r1,r5
    bl         Field_CreateEntity
    ldr        r0,[r5,#0x60]
    bl         FieldObject_Disable
    mov        r0,#0x4
    str        r0,[r5,#0x8]
    bl         A_ColorManBall_1_Main
    ldr        r0,[r5,#0x60]
    bl         FieldObject_MarkAsChecked
    pop        {pc}


_nt A_ColorManBall_1_Main
    push       {lr}
    bl         SpritePtr_DisableFlash
    ldr        r0,[r5,#0x60]
    bl         FieldObject_DisableIfDeleted
    bl         A_ColorManBall_CheckDamage
    tst        r0,r0
    bne        LAB_08075068
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_A_ColorManBall_1_0_Drop_08075074
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    ldrh       r0,[r5,#0x32]
    cmp        r0,#0x10
    bgt        LAB_08075062
    ldr        r0,[r5,#0x60]
    bl         FieldObject_Enable
    b          LAB_08075068
LAB_08075062:
    ldr        r0,[r5,#0x60]
    bl         FieldObject_SetDeletedFlag
LAB_08075068:
    ldr        r0,[r5,#0x60]
    bl         FieldObject_UpdateCellPosition
    bl         UpdateSpriteFrameIndex
    pop        {pc}

PTR_PTR_A_ColorManBall_1_0_Drop_08075074:
    .word PTR_A_ColorManBall_1_0_Drop_08075078

PTR_A_ColorManBall_1_0_Drop_08075078:
    .word A_ColorManBall_1_0_Drop
    .word A_ColorManBall_1_1_Move


_ts A_ColorManBall_1_0_Drop
    push       {lr}
    mov        r0,#0x10
    lsl        r0,r0,#0x8
    ldr        r1,[r5,#0x4c]
    sub        r1,r1,r0
    str        r1,[r5,#0x4c]
    ldr        r0,[r5,#0x30]
    add        r0,r0,r1
    str        r0,[r5,#0x30]
    bgt        LAB_080750b2
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    mov        r2,#0x0
    mov        r7,#0x28
    add        r7,r7,r5
    stmia      r7!,{r0,r1,r2}
    mov        r0,#0xac
    bl         Sound_PlaySE
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_080750b2:
    pop        {pc}


_ts A_ColorManBall_1_1_Move
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_A_ColorManBall_1_1_0_CalculateArc_080750c4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_A_ColorManBall_1_1_0_CalculateArc_080750c4:
    .word PTR_A_ColorManBall_1_1_0_CalculateArc_080750c8

PTR_A_ColorManBall_1_1_0_CalculateArc_080750c8:
    .word A_ColorManBall_1_1_0_CalculateArc
    .word A_ColorManBall_1_1_1_Move


_ts A_ColorManBall_1_1_0_CalculateArc
    push       {lr}
    bl         A_ColorManBall_GetNextPos
    bl         Battle_CellCoordsToSprite
    mov        r3,#0x28
    lsl        r3,r3,#0xc
    str        r3,[r5,#0x4c]
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    mov        r0,#0x28
    add        r0,r0,r5
    mov        r4,#0x10
    lsl        r4,r4,#0x8
    neg        r4,r4
    bl         Field_CalculateTrajectoryXY
    strh       r0,[r5,#0x1c]
    str        r1,[r5,#0x44]
    str        r2,[r5,#0x48]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    pop        {pc}


_nt A_ColorManBall_1_1_1_Move
    push       {lr}
    mov        r7,#0x44
    add        r7,r7,r5
    ldmia      r7!,{r3,r4,r6}
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r0,r1,r2}
    add        r0,r0,r3
    add        r1,r1,r4
    add        r2,r2,r6
    sub        r7,#0xc
    stmia      r7!,{r0,r1,r2}
    mov        r7,#0x10
    lsl        r7,r7,#0x8
    sub        r6,r6,r7
    str        r6,[r5,#0x4c]
    bl         Battle_SpriteCoordsToCell
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08075148
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    mov        r2,#0x0
    mov        r7,#0x28
    add        r7,r7,r5
    stmia      r7!,{r0,r1,r2}
    mov        r0,#0xac
    bl         Sound_PlaySE
    mov        r0,#0x0
    strb       r0,[r5,#0xa]
LAB_08075148:
    pop        {pc}


_nt A_ColorManBall_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x5]
    tst        r0,r0
    bne        LAB_08075156
    ldr        r7,[r5,#0x64]
    str        r0,[r7,#0x0]
LAB_08075156:
    ldr        r0,[r5,#0x60]
    bl         FieldObject_Free
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r1,r2,r3}
    mov        r0,#0x10
    lsl        r0,r0,#0x10
    add        r3,r3,r0
    mov        r4,#0xf
    push       {r5}
    bl         Effect_QuickEffect_Create
    pop        {r5}
    bl         Attack_Free
    pop        {pc}


_ts A_ColorManBall_CheckDamage
    push       {lr}
    ldrb       r0,[r5,#0x5]
    tst        r0,r0
    bne        LAB_080751d8
    ldr        r7,[r5,#0x60]
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x2
    tst        r0,r1
    beq        LAB_080751e6
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         FieldObject_GetPanelFlags
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_080751b0
    mov        r0,#0xa
    ldr        r1,[r5,#0x60]
    bl         Field_GetDamageOnEntity
    tst        r0,r0
    beq        LAB_080751e6
    mov        r1,#0x10
    tst        r0,r1
    beq        LAB_080751c0
LAB_080751b0:
    mov        r0,#0x0
    strh       r0,[r5,#0x20]
    mov        r0,#0x19
    mov        r3,#0x10
    lsl        r3,r3,#0x10
    bl         Field_CreateBusterEffect
    b          LAB_080751ce
LAB_080751c0:
    ldrb       r0,[r5,#0x1a]
    bl         FieldObject_GetDamageToEntity
    tst        r0,r0
    beq        LAB_080751e6
    bl         Field_SubtractHP
LAB_080751ce:
    bl         SpritePtr_EnableFlash
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    bne        LAB_080751e6
LAB_080751d8:
    ldr        r0,[r5,#0x60]
    bl         FieldObject_SetDeletedFlag
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    mov        r0,#0x1
    pop        {pc}
LAB_080751e6:
    mov        r0,#0x0
    pop        {pc}


_nt A_ColorManBall_GetNextPos
    push       {lr}
    LoadMain battle, r7, r7
    ldr        r7,[r7,#0x40]
    ldrb       r2,[r7,#0x18]
    ldrb       r3,[r7,#0x19]
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    sub        r2,r2,r0
    add        r4,r2,#0x0
    mul        r4,r2
    sub        r3,r3,r1
    add        r6,r3,#0x0
    mul        r6,r3
    cmp        r4,r6
    bmi        LAB_0807521a
    orr        r4,r6
    beq        LAB_08075224
    tst        r2,r2
    bmi        LAB_08075216
    add        r0,#0x1
    pop        {pc}
LAB_08075216:
    sub        r0,#0x1
    pop        {pc}
LAB_0807521a:
    tst        r3,r3
    bmi        LAB_08075222
    add        r1,#0x1
    pop        {pc}
LAB_08075222:
    sub        r1,#0x1
LAB_08075224:
    pop        {pc}


_nt Attack_ColorManBall_Create
    push       {lr}
    push       {r0,r1,r2,r5,r6}
    mov        r0,#0x31
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r2,r5,r6}
    tst        r7,r7
    beq        LAB_08075246
    str        r7,[r0,#0x0]
    str        r0,[r7,#0x64]
    strb       r1,[r7,#0x18]
    strb       r2,[r7,#0x19]
    strh       r6,[r7,#0x24]
    ldrb       r0,[r5,#0x16]
    strb       r0,[r7,#0x16]
LAB_08075246:
    pop        {pc}
