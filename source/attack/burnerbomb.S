#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_BurnerBomb
    push       {lr}
    add        r7,r5,#0x0
    add        r7,#0x28
    ldmia      r7!,{r0,r1,r2}
    stmia      r7!,{r0,r1,r2}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_A_BurnerBomb_0_Init_08070578
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_A_BurnerBomb_0_Init_0807056c:
    .word A_BurnerBomb_0_Init
    .word A_BurnerBomb_1_Main
    .word A_BurnerBomb_2_Free

PTR_PTR_A_BurnerBomb_0_Init_08070578:
    .word PTR_A_BurnerBomb_0_Init_0807056c


_ts A_BurnerBomb_0_Init
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0x75
    bl         Sprite_InitSpritePtr
    mov        r0,#0x0
    strh       r0,[r5,#0x14]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_SetZClip
    mov        r0,#0x0
    strb       r0,[r5,#0x5]
    mov        r0,#0x8
    strh       r0,[r5,#0x20]
    strh       r0,[r5,#0x22]
    mov        r0,#0x0
    strb       r0,[r5,#0x1a]
    mov        r0,#0x19
    mov        r1,#0x60
    add        r1,r1,r5
    bl         Field_CreateEntity
    ldr        r0,[r5,#0x60]
    mov        r1,#0x0
    strh       r1,[r0,#0x8]
    bl         FieldObject_Disable
    ldrb       r0,[r5,#0x6]
    ldrb       r1,[r5,#0x7]
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
    ldr        r1,DAT_0807062c
    push       {r1}
    bl         AngleToOffset
    str        r0,[r5,#0x44]
    str        r1,[r5,#0x48]
    pop        {r4}
    pop        {r0}
    pop        {r1,r2}
    mov        r3,#0x0
    ldr        r6,DAT_08070630
    bl         Field_CalculateGravityZ
    str        r0,[r5,#0x4c]
    strh       r1,[r5,#0x1c]
    tst        r1,r1
    beq        LAB_08070610
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    bl         A_BurnerBomb_1_Main
    ldr        r0,[r5,#0x60]
    bl         FieldObject_MarkAsChecked
    pop        {pc}
LAB_08070610:
    ldrb       r0,[r5,#0x6]
    ldrb       r1,[r5,#0x7]
    bl         Battle_CellCoordsToSprite
    mov        r2,#0x0
    add        r7,r5,#0x0
    add        r7,#0x28
    stmia      r7!,{r0,r1,r2}
    mov        r0,#0x8
    strb       r0,[r5,#0x8]
    bl         A_BurnerBomb_2_Free
    pop        {pc}

    .align 2, 0


DAT_0807062c:
    .word 0x1C000

DAT_08070630:
    .word 0xFFFFD800


_ts A_BurnerBomb_1_Main
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    bl         SpritePtr_ResetPalette
    ldrb       r0,[r5,#0x5]
    lsr        r0,r0,#0x1
    bcc        LAB_08070654
    ldr        r0,[r5,#0x60]
    bl         FieldObject_Enable
    bl         A_BurnerBomb_CheckDamage
    tst        r0,r0
    bne        LAB_0807065e
LAB_08070654:
    ldr        r7,PTR_PTR_A_BurnerBomb_1_0_Travel_0807066c
    ldrb       r0,[r5,#0x9]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
LAB_0807065e:
    bl         UpdateSpriteFrameIndex
    ldr        r0,[r5,#0x60]
    bl         FieldObject_UpdateCellPosition
    pop        {pc}

    .align 2, 0


PTR_PTR_A_BurnerBomb_1_0_Travel_0807066c:
    .word PTR_A_BurnerBomb_1_0_Travel_08070670

PTR_A_BurnerBomb_1_0_Travel_08070670:
    .word A_BurnerBomb_1_0_Travel
    .word A_BurnerBomb_1_1_AnimPrimed1
    .word A_BurnerBumb_1_2_AnimPrimed2
    .word A_BurnerBomb_1_3_AnimPrimed3
    .word A_BurnerBomb_1_4_Explode
    .word A_BurnerBomb_1_5_Explode2


_ts A_BurnerBomb_1_0_Travel
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    beq        LAB_080706b6
    add        r7,r5,#0x0
    add        r7,#0x44
    ldmia      r7!,{r3,r4,r6}
    ldr        r0,DAT_080706f8
    add        r6,r6,r0
    str        r6,[r5,#0x4c]
    add        r7,r5,#0x0
    add        r7,#0x28
    ldmia      r7!,{r0,r1,r2}
    add        r0,r0,r3
    add        r1,r1,r4
    add        r2,r2,r6
    add        r7,r5,#0x0
    add        r7,#0x28
    stmia      r7!,{r0,r1,r2}
    tst        r2,r2
    bmi        LAB_080706b6
    pop        {pc}
LAB_080706b6:
    ldrb       r0,[r5,#0x6]
    ldrb       r1,[r5,#0x7]
    bl         Battle_CellCoordsToSprite
    mov        r2,#0x0
    add        r7,r5,#0x0
    add        r7,#0x28
    stmia      r7!,{r0,r1,r2}
    ldrb       r0,[r5,#0x6]
    strb       r0,[r5,#0x18]
    ldrb       r0,[r5,#0x7]
    strb       r0,[r5,#0x19]
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Field_GetPanelFlags
    mov        r1,#0x1
    tst        r0,r1
    bne        LAB_080706e2
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    pop        {pc}
LAB_080706e2:
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    mov        r0,#0x42
    strh       r0,[r5,#0x1c]
    mov        r0,#0x1
    strb       r0,[r5,#0x5]
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}

DAT_080706f8:
    .word 0xFFFFD800


_ts A_BurnerBomb_1_1_AnimPrimed1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08070716
    mov        r0,#0x2
    strb       r0,[r5,#0x14]
    mov        r0,#0x2c
    strh       r0,[r5,#0x1c]
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08070716:
    pop        {pc}


_ts A_BurnerBumb_1_2_AnimPrimed2
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08070732
    mov        r0,#0x3
    strb       r0,[r5,#0x14]
    mov        r0,#0xc
    strh       r0,[r5,#0x1c]
    mov        r0,#0xc
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08070732:
    pop        {pc}


_ts A_BurnerBomb_1_3_AnimPrimed3
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08070746
    mov        r0,#0x10
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08070746:
    pop        {pc}


_ts A_BurnerBomb_1_4_Explode
    push       {lr}
    mov        r0,#0x76
    bl         Sound_PlaySongImmediate
    mov        r3,#0x28
    add        r7,r5,r3
    ldmia      r7!,{r1,r2,r3}
    mov        r4,#0x0
    ldrh       r6,[r5,#0x24]
    mov        r0,#0x2
    push       {r1,r2,r3,r5}
    bl         Effect_Tower_Create
    pop        {r1,r2,r3,r5}
    mov        r4,#0xb
    push       {r5}
    bl         Effect_QuickEffect_Create
    pop        {r5}
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    pop        {pc}


_ts A_BurnerBomb_1_5_Explode2
    push       {lr}
    mov        r3,#0x28
    add        r7,r5,r3
    ldmia      r7!,{r1,r2,r3}
    mov        r4,#0x0
    push       {r5}
    bl         Effect_QuickEffect_Create
    pop        {r5}
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    pop        {pc}


_ts A_BurnerBomb_2_Free
    push       {lr}
    ldr        r0,[r5,#0x60]
    bl         FieldObject_Free
    bl         Attack_Free
    pop        {pc}


_nt A_BurnerBomb_CheckDamage
    push       {lr}
    mov        r0,#0xa
    ldr        r1,[r5,#0x60]
    bl         Field_GetDamageOnEntity
    tst        r0,r0
    beq        LAB_080707e0
    ldrb       r0,[r5,#0x1a]
    bl         Field_CalcDamageDealt
    tst        r0,r0
    beq        LAB_080707e0
    push       {r0}
    bl         SpritePtr_SetFlashPalette
    pop        {r0}
    bl         Field_SubtractHP
    tst        r1,r1
    bne        LAB_080707da
    mov        r0,#0x70
    bl         Sound_PlaySongImmediate
    ldr        r0,[r5,#0x60]
    bl         FieldObject_SetDeletedFlag
    mov        r0,#0x14
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    mov        r0,#0x1
    pop        {pc}
LAB_080707da:
    mov        r0,#0x6f
    bl         Sound_PlaySongImmediate
LAB_080707e0:
    mov        r0,#0x0
    pop        {pc}


_ts Attack_BurnerBomb_Create
    push       {lr}
    push       {r0,r5,r6}
    mov        r0,#0xd
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r0,r5,r6}
    tst        r7,r7
    beq        LAB_080707fc
    strh       r6,[r7,#0x24]
    ldrb       r0,[r5,#0x16]
    strb       r0,[r7,#0x16]
LAB_080707fc:
    pop        {pc}

    .align 2, 0

