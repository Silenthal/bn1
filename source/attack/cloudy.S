#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_Cloudy
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_A_Cloudy_0_Init_080732c8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    bl         A_Cloudy_SetFlag
    pop        {pc}

    .align 2, 0


PTR_PTR_A_Cloudy_0_Init_080732c8:
    .word PTR_A_Cloudy_0_Init_080732cc

PTR_A_Cloudy_0_Init_080732cc:
    .word A_Cloudy_0_Init
    .word A_Cloudy_1_Main
    .word A_Cloudy_2_Free


_ts A_Cloudy_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0x90
    bl         Sprite_InitSpritePtr
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_EnableShadow
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x3
    orr        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    mov        r0,#0x0
    str        r0,[r5,#0x64]
    ldrb       r0,[r5,#0x16]
    neg        r0,r0
    add        r0,#0x1
    bl         SpritePtr_SetFlipType
    mov        r0,#0x3
    strb       r0,[r5,#0x1a]
    mov        r0,#0x3
    mov        r1,#0x60
    add        r1,r1,r5
    bl         Field_CreateEntity
    ldr        r0,[r5,#0x60]
    bl         FieldObject_Disable
    bl         A_Cloudy_1_Main
    pop        {pc}


_ts A_Cloudy_1_Main
    push       {lr}
    ldr        r0,[r5,#0x60]
    bl         FieldObject_DisableIfDeleted
    bl         Battle_IsInputLocked
    bne        LAB_08073342
    ldrb       r0,[r5,#0x4]
    tst        r0,r0
    beq        LAB_0807334e
    ldrb       r0,[r5,#0x5]
    tst        r0,r0
    beq        LAB_0807334e
LAB_08073342:
    ldr        r0,[r5,#0x60]
    bl         FieldObject_SetDeletedFlag
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    pop        {pc}
LAB_0807334e:
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldr        r1,[r5,#0x60]
    ldrb       r0,[r1,#0x0]
    mov        r2,#0x2
    tst        r0,r2
    beq        LAB_08073378
    mov        r0,#0x2
    bl         Field_GetDamageOnEntity
    tst        r0,r0
    beq        LAB_08073378
    ldr        r0,[r5,#0x60]
    bl         FieldObject_SetDeletedFlag
    mov        r0,#0x19
    mov        r3,#0x10
    lsl        r3,r3,#0x10
    bl         Field_CreateStrikeEffect
LAB_08073378:
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_A_Cloudy_1_0_08073390
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Battle_GetEntryState
    cmp        r0,#0x1
    bne        LAB_0807338e
    mov        r0,#0x8
    str        r0,[r5,#0x8]
LAB_0807338e:
    pop        {pc}

PTR_PTR_A_Cloudy_1_0_08073390:
    .word PTR_A_Cloudy_1_0_08073394

PTR_A_Cloudy_1_0_08073394:
    .word A_Cloudy_1_0
    .word A_Cloudy_1_1


_ts A_Cloudy_1_0
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_A_Cloudy_1_0_0_080733ac
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_A_Cloudy_1_0_0_080733ac:
    .word PTR_A_Cloudy_1_0_0_080733b0

PTR_A_Cloudy_1_0_0_080733b0:
    .word A_Cloudy_1_0_0
    .word A_Cloudy_1_0_1
    .word A_Cloudy_1_0_2
    .word A_Cloudy_1_0_3


_ts A_Cloudy_1_0_0
    push       {lr}
    bl         Field_GetAttackDirectionOffset_MP
    mov        r1,#0x4
    lsl        r1,r1,#0x10
    mul        r1,r0
    str        r1,[r5,#0x44]
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    mov        r0,#0x17
    strh       r0,[r5,#0x1c]
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x4
    bic        r0,r1
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts A_Cloudy_1_0_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_080733f8
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
    mov        r0,#0x9a
    bl         Sound_PlaySE
LAB_080733f8:
    pop        {pc}


_nt A_Cloudy_1_0_2
    push       {lr}
    ldrb       r0,[r5,#0x6]
    ldrb       r1,[r5,#0x7]
    bl         Battle_CellCoordsToSprite
    add        r2,r0,#0x0
    ldr        r1,[r5,#0x44]
    ldr        r0,[r5,#0x28]
    add        r0,r0,r1
    str        r0,[r5,#0x28]
    tst        r1,r1
    bmi        LAB_0807341a
    cmp        r0,r2
    blt        LAB_08073434
    str        r2,[r5,#0x28]
    b          LAB_08073428
LAB_0807341a:
    cmp        r0,r2
    bgt        LAB_08073434
    str        r2,[r5,#0x28]
    bl         Battle_EntitySpriteCoordsToCell
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
LAB_08073428:
    mov        r0,#0xc
    strb       r0,[r5,#0xa]
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    mov        r0,#0x14
    strh       r0,[r5,#0x1c]
LAB_08073434:
    pop        {pc}


_nt A_Cloudy_1_0_3
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0807344c
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    bl         A_Cloudy_1_1
LAB_0807344c:
    pop        {pc}


_nt A_Cloudy_1_1
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_A_Cloudy_1_1_0_0807348c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Battle_EntitySpriteCoordsToCell
    ldrb       r2,[r5,#0x19]
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    ldr        r0,[r5,#0x60]
    push       {r1,r2}
    bl         FieldObject_UpdateCellPosition
    pop        {r1,r2}
    cmp        r1,r2
    beq        LAB_0807347e
    ldr        r0,[r5,#0x60]
    ldrh       r1,[r5,#0x18]
    strh       r1,[r0,#0x2]
    strh       r1,[r0,#0x4]
    bl         FieldObject_Enable
LAB_0807347e:
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0807348a
    mov        r0,#0x8
    str        r0,[r5,#0x8]
LAB_0807348a:
    pop        {pc}

PTR_PTR_A_Cloudy_1_1_0_0807348c:
    .word PTR_A_Cloudy_1_1_0_08073490

PTR_A_Cloudy_1_1_0_08073490:
    .word A_Cloudy_1_1_0
    .word A_Cloudy_1_1_1
    .word A_Cloudy_1_1_2


_ts A_Cloudy_1_1_0
    push       {lr}
    ldrb       r0,[r5,#0x6]
    ldrb       r1,[r5,#0x7]
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    ldr        r7,[r5,#0x60]
    strb       r0,[r7,#0x4]
    strb       r1,[r7,#0x5]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    bl         Rng_RandomUint
    mov        r2,#0x4
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_080734c2
    mov        r2,#0x8
LAB_080734c2:
    strb       r2,[r5,#0xa]
    mov        r0,#0x2
    strb       r0,[r5,#0x14]
    mov        r0,#0xff
    strh       r0,[r5,#0x1c]
    ldr        r0,[r5,#0x60]
    bl         FieldObject_Enable
    bl         Effect_CloudyRain_Create
    str        r7,[r5,#0x64]
    pop        {pc}


_nt A_Cloudy_1_1_1
    push       {lr}
    ldr        r0,[r5,#0x2c]
    ldr        r1,[r5,#0x48]
    sub        r0,r0,r1
    ldr        r1,DAT_080734f4
    cmp        r0,r1
    bgt        LAB_080734ee
    add        r0,r1,#0x0
    mov        r1,#0x8
    strb       r1,[r5,#0xa]
LAB_080734ee:
    str        r0,[r5,#0x2c]
    pop        {pc}

    .align 2, 0


DAT_080734f4:
    .word 0xFFF40000
    .byte 0xCC
    .byte 0x4C

    .align 2, 0



_ts A_Cloudy_1_1_2
    push       {lr}
    ldr        r0,[r5,#0x2c]
    ldr        r1,[r5,#0x48]
    add        r0,r0,r1
    ldr        r1,DAT_08073514
    cmp        r0,r1
    blt        LAB_08073510
    add        r0,r1,#0x0
    mov        r1,#0x4
    strb       r1,[r5,#0xa]
LAB_08073510:
    str        r0,[r5,#0x2c]
    pop        {pc}

DAT_08073514:
    .word 0x240000
    .byte 0xCC
    .byte 0x4C

    .align 2, 0



_ts A_Cloudy_2_Free
    push       {lr}
    ldr        r0,[r5,#0x60]
    bl         FieldObject_Free
    ldr        r7,[r5,#0x64]
    tst        r7,r7
    beq        LAB_08073534
    push       {r5}
    add        r5,r7,#0x0
    bl         Effect_Free
    pop        {r5}
LAB_08073534:
    ldrb       r0,[r5,#0x4]
    tst        r0,r0
    beq        LAB_0807354a
    ldrb       r0,[r5,#0x5]
    tst        r0,r0
    bne        LAB_0807354a
    ldr        r7,[r5,#0x68]
    tst        r7,r7
    beq        LAB_0807354a
    mov        r0,#0x0
    str        r0,[r7,#0x0]
LAB_0807354a:
    bl         Attack_Free
    pop        {pc}


_ts Attack_Cloudy_Create
    push       {r5,lr}
    push       {r3}
    mov        r3,#0x42
    lsl        r3,r3,#0x10
    push       {r0,r1,r2,r5,r6,r7}
    mov        r0,#0x24
    bl         Attack_Alloc
    add        r4,r5,#0x0
    pop        {r0,r1,r2,r5,r6,r7}
    pop        {r3}
    beq        LAB_080735a4
    str        r7,[r4,#0x68]
    tst        r7,r7
    beq        LAB_08073570
    str        r4,[r7,#0x0]
LAB_08073570:
    str        r3,[r4,#0x48]
    strb       r0,[r4,#0x16]
    strh       r6,[r4,#0x24]
    strb       r1,[r4,#0x18]
    strb       r2,[r4,#0x19]
    add        r0,r1,#0x0
    add        r1,r2,#0x0
    push       {r4}
    bl         Battle_CellCoordsToSprite
    pop        {r4}
    str        r1,[r4,#0x2c]
    LoadMain battle, r6, r6
    ldrb       r2,[r6,#0x1a]
    ldrb       r3,[r4,#0x16]
    eor        r2,r3
    ldr        r6,PTR_DAT_080735a8
    ldrsb      r2,[r6,r2]
    lsl        r2,r2,#0x10
    add        r0,r0,r2
    str        r0,[r4,#0x28]
    add        r5,r4,#0x0
    bl         A_Cloudy_SetFlag
    add        r7,r5,#0x0
LAB_080735a4:
    pop        {r5,pc}

    .align 2, 0


PTR_DAT_080735a8:
    .word DAT_080735ac

DAT_080735ac:
    .byte 0x1C
    .byte 0xE4

    .align 2, 0



_ts A_Cloudy_SetFlag
    push       {lr}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x9
    bl         Battle_SetBattleFlag
    pop        {pc}
