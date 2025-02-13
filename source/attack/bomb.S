#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_Bomb
    push       {lr}
    mov        r3,#0x28
    add        r7,r5,r3
    ldmia      r7!,{r0,r1,r2}
    stmia      r7!,{r0,r1,r2}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_A_Bomb_0_Init_08070148
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_A_Bomb_0_Init_08070148:
    .word PTR_A_Bomb_0_Init_0807014c

PTR_A_Bomb_0_Init_0807014c:
    .word A_Bomb_0_Init
    .word A_Bomb_1_Main
    .word A_Bomb_2_Free


_ts A_Bomb_0_Init
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0x6e
    bl         Sprite_InitSpritePtr
    mov        r0,#0x0
    strh       r0,[r5,#0x14]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_ProcessFrameDelay
    ldrb       r0,[r5,#0x16]
    bl         SpritePtr_SetFlipType
    bl         Field_GetAttackDirectionOffset_MP
    ldr        r7,PTR_DAT_080701a4
    ldmia      r7!,{r1,r2,r3}
    mul        r1,r0
    mov        r7,#0x44
    add        r7,r7,r5
    stmia      r7!,{r1,r2,r3}
    bl         SpritePtr_NoZClip
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    pop        {pc}

    .align 2, 0


DAT_08070198:
    .word f(2.9, -0.15625, 2.025)

PTR_DAT_080701a4:
    .word DAT_08070198


_ts A_Bomb_1_Main
    push       {lr}
    bl         Battle_IsInputLocked
    bne        LAB_080701b8
    bl         Battle_GetEntryState
    cmp        r0,#0x0
    beq        LAB_080701be
LAB_080701b8:
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    pop        {pc}
LAB_080701be:
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_A_Bomb_1_0_Move_080701d4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    mov        r0,#0x0
    str        r0,[r5,#0x40]
    pop        {pc}

    .align 2, 0


PTR_PTR_A_Bomb_1_0_Move_080701d4:
    .word PTR_A_Bomb_1_0_Move_080701d8

PTR_A_Bomb_1_0_Move_080701d8:
    .word A_Bomb_1_0_Move
    .word A_Bomb_1_1_Move


_ts A_Bomb_1_0_Move
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    and        r0,r1
    beq        LAB_08070212
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    mov        r0,#0x28
    strh       r0,[r5,#0x1c]
    bl         Field_GetAttackDirectionOffset_MP
    mov        r1,#0x4
    mul        r1,r0
    ldr        r0,[r5,#0x28]
    lsl        r1,r1,#0x10
    add        r0,r0,r1
    str        r0,[r5,#0x28]
    ldr        r0,[r5,#0x30]
    mov        r1,#0x30
    lsl        r1,r1,#0x10
    add        r0,r0,r1
    str        r0,[r5,#0x30]
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
LAB_08070212:
    pop        {pc}


_ts A_Bomb_1_1_Move
    push       {lr}
    mov        r3,#0x28
    add        r7,r5,r3
    mov        r9,r7
    ldmia      r7!,{r0,r1,r2}
    mov        r3,#0x44
    add        r7,r5,r3
    ldmia      r7!,{r3,r4,r6}
    add        r0,r0,r3
    add        r6,r6,r4
    add        r2,r2,r6
    mov        r7,r9
    stmia      r7!,{r0,r1,r2}
    str        r6,[r5,#0x4c]
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0807023c
    mov        r0,#0x8
    str        r0,[r5,#0x8]
LAB_0807023c:
    pop        {pc}


_nt A_Bomb_2_Free
    push       {lr}
    bl         Battle_GetEntryState
    cmp        r0,#0x0
    bne        LAB_080702ba
    bl         Battle_EntitySpriteCoordsToCell
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    bl         Field_IsCellPositionValid
    tst        r0,r0
    beq        LAB_080702ba
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    push       {r0,r1}
    bl         Field_GetPanelFlags
    add        r2,r0,#0x0
    pop        {r0,r1}
    mov        r3,#0x1
    tst        r2,r3
    beq        LAB_080702ba
    mov        r6,#0x0
LAB_0807026e:
    push       {r0,r1,r5,r6}
    ldrb       r2,[r5,#0x4]
    lsl        r2,r2,#0x2
    ldr        r7,PTR_listBombPattern_080702c0
    ldr        r7,[r7,r2]
    lsl        r2,r6,#0x1
    ldrsb      r3,[r7,r2]
    cmp        r3,#0x7f
    beq        LAB_080702b2
    add        r0,r0,r3
    add        r2,#0x1
    ldrsb      r4,[r7,r2]
    add        r1,r1,r4
    push       {r0,r1}
    bl         Field_GetPanelFlags
    add        r2,r0,#0x0
    pop        {r0,r1}
    mov        r3,#0x1
    tst        r2,r3
    beq        LAB_080702ac
    bl         Battle_CellCoordsToSprite
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    mov        r3,#0x0
    mov        r4,#0x0
    ldrh       r6,[r5,#0x24]
    ldrb       r0,[r5,#0x1a]
    bl         Effect_BombExplosion_Create
LAB_080702ac:
    pop        {r0,r1,r5,r6}
    add        r6,#0x1
    b          LAB_0807026e
LAB_080702b2:
    pop        {r0,r1,r5,r6}
    mov        r0,#0x76
    bl         Sound_PlaySE
LAB_080702ba:
    bl         Attack_Free
    pop        {pc}

PTR_listBombPattern_080702c0:
    .word listBombPattern

listBombPattern:
    .word patternLilBomb
    .word patternCrossBomb
    .word patternBigBomb
    .word patternMiniBomb

patternLilBomb:
    cell_pos 0, 0
    cell_pos 0, -1
    cell_pos 0, 1
    .byte 0x7F

patternCrossBomb:
    cell_pos 0, 0
    cell_pos 0, -1
    cell_pos 0, 1
    cell_pos -1, 0
    cell_pos 1, 0
    .byte 0x7F

patternBigBomb:
    cell_pos 0, 0
    cell_pos 0, -1
    cell_pos 0, 1
    cell_pos -1, 0
    cell_pos 1, 0
    cell_pos -1, -1
    cell_pos -1, 1
    cell_pos 1, -1
    cell_pos 1, 1
    .byte 0x7F

patternMiniBomb:
    cell_pos 0, 0
    .byte 0x7F


_ts Attack_Bomb_Create
    push       {lr}
    push       {r0,r5,r6}
    mov        r0,#0xa
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r0,r5,r6}
    tst        r7,r7
    beq        LAB_08070316
    strh       r6,[r7,#0x24]
    strb       r0,[r7,#0x1a]
    ldrb       r0,[r5,#0x16]
    strb       r0,[r7,#0x16]
LAB_08070316:
    pop        {pc}
