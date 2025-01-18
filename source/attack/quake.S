#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_Quake
    push       {lr}
    mov        r3,#0x28
    add        r7,r5,r3
    ldmia      r7!,{r0,r1,r2}
    stmia      r7!,{r0,r1,r2}
    bl         SpritePtr_ResetPalette
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_A_Quake_0_Init_08073004
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_A_Quake_0_Init_08073004:
    .word PTR_A_Quake_0_Init_08073008

PTR_A_Quake_0_Init_08073008:
    .word A_Quake_0_Init
    .word A_Quake_1_Main
    .word A_Quake_2_Free


_ts A_Quake_0_Init
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0x6b
    bl         Sprite_InitSpritePtr
    mov        r0,#0x2
    strh       r0,[r5,#0x14]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_NoZClip
    ldrb       r0,[r5,#0x16]
    bl         SpritePtr_SetFlipType
    bl         Field_GetAttackDirectionOffset_MP
    str        r0,[r5,#0x44]
    push       {r0}
    bl         Battle_EntitySpriteCoordsToCell
    pop        {r3}
    mov        r2,#0x3
    mul        r2,r3
    add        r0,r0,r2
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    bl         A_Quake_1_Main
    pop        {pc}


_nt A_Quake_1_Main
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_A_Quake_1_0_0807306c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

PTR_PTR_A_Quake_1_0_0807306c:
    .word PTR_A_Quake_1_0_08073070

PTR_A_Quake_1_0_08073070:
    .word A_Quake_1_0
    .word A_Quake_1_1
    .word A_Quake_1_2
    .word A_Quake_1_3
    .word A_Quake_1_4
    .word A_Quake_1_5


_ts A_Quake_1_0
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    and        r0,r1
    beq        LAB_080730f8
    ldr        r0,[r5,#0x44]
    mov        r1,#0x4
    lsl        r1,r1,#0x10
    mul        r1,r0
    ldr        r0,[r5,#0x28]
    add        r0,r0,r1
    str        r0,[r5,#0x28]
    ldr        r0,[r5,#0x30]
    mov        r1,#0x30
    lsl        r1,r1,#0x10
    add        r0,r0,r1
    str        r0,[r5,#0x30]
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    push       {r0,r1}
    add        r7,r5,#0x0
    add        r7,#0x28
    push       {r7}
    ldmia      r7!,{r2,r3}
    sub        r2,r0,r2
    sub        r0,r1,r3
    add        r1,r2,#0x0
    push       {r5}
    bl         VectorToAngle
    pop        {r5}
    strb       r0,[r5,#0x10]
    ldr        r1,DAT_080730fc
    push       {r1}
    bl         AngleToOffset
    str        r0,[r5,#0x44]
    str        r1,[r5,#0x48]
    pop        {r4}
    pop        {r0}
    pop        {r1,r2}
    mov        r3,#0x30
    lsl        r3,r3,#0x10
    str        r3,[r5,#0x30]
    ldr        r6,DAT_08073100
    bl         Field_CalculateGravityZ
    str        r0,[r5,#0x4c]
    strh       r1,[r5,#0x1c]
    mov        r0,#0x3
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
LAB_080730f8:
    pop        {pc}

    .align 2, 0


DAT_080730fc:
    .word 0x40000

DAT_08073100:
    .word 0xFFFFC400


_ts A_Quake_1_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bls        LAB_0807312e
    mov        r7,#0x44
    add        r7,r5,r7
    ldmia      r7!,{r3,r4,r6}
    ldr        r0,DAT_08073158
    add        r6,r6,r0
    str        r6,[r5,#0x4c]
    mov        r7,#0x28
    add        r7,r5,r7
    mov        r9,r7
    ldmia      r7!,{r0,r1,r2}
    add        r0,r0,r3
    add        r1,r1,r4
    add        r2,r2,r6
    mov        r7,r9
    stmia      r7!,{r0,r1,r2}
    pop        {pc}
LAB_0807312e:
    bl         Field_IsEntityCellPositionValid
    tst        r0,r0
    beq        LAB_08073152
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    mov        r2,#0x30
    lsl        r2,r2,#0x10
    mov        r7,#0x28
    add        r7,r5,r7
    stmia      r7!,{r0,r1,r2}
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    pop        {pc}
LAB_08073152:
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    pop        {pc}

DAT_08073158:
    .word 0xFFFFC400


_ts A_Quake_1_2
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    and        r0,r1
    beq        LAB_0807318c
    mov        r0,#0x1
    mov        r1,#0x21
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_SetZClip
    mov        r0,#0x4
    strh       r0,[r5,#0x14]
    ldrb       r0,[r5,#0x16]
    mov        r1,#0x1
    eor        r0,r1
    bl         SpritePtr_SetFlipType
    ldrb       r0,[r5,#0x4]
    bl         SpritePtr_SetPaletteIndex
    mov        r0,#0xc
    strb       r0,[r5,#0x9]
LAB_0807318c:
    pop        {pc}


_nt A_Quake_1_3
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    and        r0,r1
    beq        LAB_080731a2
    ldr        r0,DAT_080731a4
    str        r0,[r5,#0x4c]
    mov        r0,#0x10
    strb       r0,[r5,#0x9]
LAB_080731a2:
    pop        {pc}

DAT_080731a4:
    .word 0xFFF80000


_ts A_Quake_1_4
    push       {lr}
    ldr        r0,[r5,#0x4c]
    ldr        r1,[r5,#0x30]
    add        r0,r0,r1
    str        r0,[r5,#0x30]
    bhi        LAB_08073256
    mov        r0,#0x7e
    bl         Sound_PlaySE
    mov        r0,#0x0
    str        r0,[r5,#0x30]
    mov        r0,#0x0
    mov        r7,#0x28
    add        r7,r5,r7
    ldmia      r7!,{r1,r2,r3}
    mov        r4,#0x19
    mov        r6,#0x2
    lsl        r6,r6,#0x18
    orr        r4,r6
    mov        r6,#0x3
    lsl        r6,r6,#0x10
    orr        r4,r6
    ldrh       r6,[r5,#0x24]
    mov        r7,#0x1
    bl         Attack_SharpStrike_Create
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Field_GetPanelFlags
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_0807324e
    mov        r0,#0x2
    mov        r1,#0x23
    push       {r5}
    bl         Camera_EnableScreenShake
    pop        {r5}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Field_CrackPanel
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldr        r7,PTR_BYTE_ARRAY_08073264
    ldrb       r3,[r5,#0x4]
    ldrsb      r3,[r7,r3]
LAB_08073210:
    sub        r3,#0x1
    bmi        LAB_0807324e
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    ldr        r7,PTR_CellPosition_ARRAY_08073258
    ldrsb      r2,[r7,r3]
    add        r1,r1,r2
    sub        r3,#0x1
    ldrsb      r2,[r7,r3]
    add        r0,r0,r2
    push       {r0,r1,r3}
    bl         Field_GetPanelFlags
    add        r7,r0,#0x0
    pop        {r0,r1,r3}
    mov        r2,#0x1
    tst        r7,r2
    beq        LAB_08073210
    push       {r3}
    bl         Battle_CellCoordsToSprite
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    mov        r3,#0x0
    mov        r0,#0x0
    mov        r4,#0x0
    ldrh       r6,[r5,#0x24]
    bl         Effect_BombExplosion_Create
    pop        {r3}
    b          LAB_08073210
LAB_0807324e:
    mov        r0,#0x5a
    strh       r0,[r5,#0x1c]
    mov        r0,#0x14
    strb       r0,[r5,#0x9]
LAB_08073256:
    pop        {pc}

PTR_CellPosition_ARRAY_08073258:
    .word CellPosition_ARRAY_0807325c

CellPosition_ARRAY_0807325c:
    cell_pos 0, -1
    cell_pos 0, 1
    cell_pos -1, 0
    cell_pos 1, 0

PTR_BYTE_ARRAY_08073264:
    .word BYTE_ARRAY_08073268

BYTE_ARRAY_08073268:
    .byte 0x00
    .byte 0x04
    .byte 0x08

    .align 2, 0



_ts A_Quake_1_5
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bls        A_Quake_2_Free
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r1,r2,r3}
    mov        r4,#0xf
    push       {r5}
    bl         Effect_QuickEffect_Create
    pop        {r5}
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    pop        {pc}


_ts A_Quake_2_Free
    push       {lr}
    bl         Attack_Free
    pop        {pc}


_ts Attack_Quake_Create
    push       {lr}
    push       {r0,r5,r6}
    mov        r0,#0x23
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r0,r5,r6}
    tst        r7,r7
    beq        LAB_080732ae
    strh       r6,[r7,#0x24]
    strb       r0,[r7,#0x1a]
    ldrb       r0,[r5,#0x16]
    strb       r0,[r7,#0x16]
LAB_080732ae:
    pop        {pc}
