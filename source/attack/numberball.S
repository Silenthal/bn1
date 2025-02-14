#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

USHORT_080721bc:
    .short 0x28
    .short 0x1E
    .short 0x14

DAT_080721c2:
    .byte 0x04
    .byte 0x03
    .byte 0x08
    .byte 0x07
    .byte 0x10
    .byte 0x0F


_ts Attack_NumberBall
    push       {lr}
    bl         SpritePtr_DisableFlash
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_A_NumberBall_0_Init_080721dc
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_A_NumberBall_0_Init_080721dc:
    .word PTR_A_NumberBall_0_Init_080721e0

PTR_A_NumberBall_0_Init_080721e0:
    .word A_NumberBall_0_Init
    .word A_NumberBall_1_Main
    .word A_NumberBall_2_Free


_ts A_NumberBall_0_Init
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0x83
    bl         Sprite_InitSpritePtr
    mov        r0,#0x0
    strh       r0,[r5,#0x14]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_EnableShadow
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    bl         Rng_RandomUint
    ldr        r7,PTR_DAT_08072264
    ldrb       r3,[r5,#0x5]
    lsl        r3,r3,#0x1
    add        r7,r7,r3
    ldrb       r1,[r7,#0x0]
    ldrb       r2,[r7,#0x1]
    and        r0,r2
    add        r0,r0,r1
    strh       r0,[r5,#0x22]
    strh       r0,[r5,#0x20]
    mov        r0,#0x0
    strb       r0,[r5,#0x1a]
    ldr        r7,PTR_USHORT_08072260
    ldrb       r0,[r5,#0x4]
    lsl        r0,r0,#0x1
    add        r7,r7,r0
    str        r7,[r5,#0x60]
    ldrh       r0,[r7,#0x0]
    strh       r0,[r5,#0x1c]
    mov        r0,#0x1a
    mov        r1,#0x64
    add        r1,r1,r5
    bl         Field_CreateEntity
    mov        r0,#0x1
    ldr        r7,[r5,#0x68]
    strb       r0,[r7,#0x0]
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    bl         A_NumberBall_1_Main
    ldr        r0,[r5,#0x64]
    bl         FieldObject_MarkAsChecked
    pop        {pc}

PTR_USHORT_08072260:
    .word USHORT_080721bc

PTR_DAT_08072264:
    .word DAT_080721c2


_ts A_NumberBall_1_Main
    push       {lr}
    bl         A_NumberBall_CheckDamage
    tst        r0,r0
    bne        LAB_0807227c
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_A_NumberBall_1_0_08072288
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
LAB_0807227c:
    ldr        r0,[r5,#0x64]
    bl         FieldObject_UpdateCellPosition
    bl         UpdateSpriteFrameIndex
    pop        {pc}

PTR_PTR_A_NumberBall_1_0_08072288:
    .word PTR_A_NumberBall_1_0_0807228c

PTR_A_NumberBall_1_0_0807228c:
    .word A_NumberBall_1_0
    .word A_NumberBall_1_1


_ts A_NumberBall_1_0
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_080722ac
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    bl         A_NumberBall_SetDisplayHP
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
LAB_080722ac:
    pop        {pc}


_nt A_NumberBall_1_1
    push       {lr}
    bl         A_NumberBall_SetDisplayHP
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_080722f6
    ldr        r7,[r5,#0x60]
    ldrb       r0,[r7,#0x0]
    strh       r0,[r5,#0x1c]
    mov        r3,#0x28
    add        r7,r5,r3
    ldmia      r7!,{r1,r2,r3}
    mov        r4,#0xf
    push       {r5}
    bl         Effect_QuickEffect_Create
    pop        {r5}
    ldrb       r0,[r5,#0x18]
    sub        r0,#0x1
    strb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    bl         Field_IsEntityCellPositionValid
    tst        r0,r0
    beq        LAB_080722ec
    pop        {pc}
LAB_080722ec:
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    ldr        r0,[r5,#0x64]
    bl         FieldObject_SetDeletedFlag
LAB_080722f6:
    pop        {pc}


_ts A_NumberBall_2_Free
    push       {lr}
    mov        r0,#0x0
    ldr        r7,[r5,#0x68]
    strb       r0,[r7,#0x0]
    ldr        r0,[r5,#0x64]
    bl         FieldObject_Free
    bl         Attack_Free
    pop        {pc}


_ts A_NumberBall_CheckDamage
    push       {lr}
    mov        r0,#0xa
    ldr        r1,[r5,#0x64]
    bl         Field_GetDamageOnEntity
    tst        r0,r0
    beq        LAB_08072374
    mov        r1,#0x10
    tst        r0,r1
    bne        LAB_08072332
    ldrb       r0,[r5,#0x1a]
    bl         Field_CalcDamageDealt
    tst        r0,r0
    beq        LAB_08072374
    bl         Field_SubtractHP
    tst        r1,r1
    bne        LAB_0807236a
LAB_08072332:
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    ldr        r3,[r5,#0x30]
    mov        r0,#0xf
    bl         Field_GetRandomXZPosOnTarget
    ldr        r7,[r5,#0x60]
    mov        r4,#0x0
    push       {r5}
    bl         Effect_QuickEffect_Create
    pop        {r5}
    ldr        r0,[r5,#0x64]
    bl         FieldObject_SetDeletedFlag
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    bl         SpritePtr_EnableFlash
    mov        r0,#0x70
    bl         Sound_PlaySE
    mov        r0,#0x1
    pop        {pc}
LAB_0807236a:
    bl         SpritePtr_EnableFlash
    mov        r0,#0x6f
    bl         Sound_PlaySE
LAB_08072374:
    mov        r0,#0x0
    pop        {pc}


_ts A_NumberBall_SetDisplayHP
    push       {lr}
    ldrh       r0,[r5,#0x20]
    mov        r1,#0xa
    bl         SWI_Div
    ldr        r7,PTR_USHORT_ARRAY_08072398
    lsl        r1,r1,#0x1
    ldrh       r1,[r7,r1]
    lsl        r1,r1,#0x8
    lsl        r0,r0,#0x1
    ldrh       r0,[r7,r0]
    lsl        r0,r0,#0x12
    orr        r0,r1
    bl         SpritePtr_SetObjectExcludeFlags
    pop        {pc}

PTR_USHORT_ARRAY_08072398:
    .word USHORT_ARRAY_0807239c

USHORT_ARRAY_0807239c:
    .short 0x1FF
    .short 0x2FF
    .short 0x37F
    .short 0x3BF
    .short 0x3DF
    .short 0x3EF
    .short 0x3F7
    .short 0x3FB
    .short 0x3FD
    .short 0x3FE


_ts Attack_NumberBall_Create
    push       {lr}
    push       {r0,r1,r2,r5,r6}
    mov        r0,#0x1d
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r2,r5,r6}
    tst        r7,r7
    beq        LAB_080723ce
    strb       r1,[r7,#0x18]
    strb       r2,[r7,#0x19]
    strh       r6,[r7,#0x24]
    str        r0,[r7,#0x68]
    ldrb       r0,[r5,#0x16]
    strb       r0,[r7,#0x16]
LAB_080723ce:
    pop        {pc}
