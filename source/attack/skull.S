#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_Skull
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_A_Skull_0_Init_08074d60
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_A_Skull_0_Init_08074d54:
    .word A_Skull_0_Init
    .word A_Skull_1_Main
    .word A_Skull_2_Free

PTR_PTR_A_Skull_0_Init_08074d60:
    .word PTR_A_Skull_0_Init_08074d54


_ts A_Skull_0_Init
    push       {lr}
    mov        r0,#0x81
    bl         Sound_PlaySE
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x3
    orr        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0xa2
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_SetZClip
    mov        r0,#0x0
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    ldrb       r0,[r5,#0x16]
    neg        r0,r0
    add        r0,#0x1
    bl         SpritePtr_SetFlipType
    bl         Field_GetAttackDirectionOffset_MP
    push       {r0}
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    pop        {r2}
    mov        r3,#0x8
    lsl        r3,r3,#0x10
    mul        r3,r2
    add        r0,r0,r3
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    mov        r0,#0x32
    lsl        r0,r0,#0x10
    str        r0,[r5,#0x30]
    mov        r0,#0xa
    lsl        r0,r0,#0x10
    str        r0,[r5,#0x4c]
    mov        r0,#0x0
    strb       r0,[r5,#0x5]
    mov        r0,#0x0
    strb       r0,[r5,#0x1a]
    ldrb       r0,[r5,#0x4]
    lsr        r0,r0,#0x8
    bcs        LAB_08074dda
    mov        r0,#0x1d
    mov        r1,#0x60
    add        r1,r1,r5
    bl         Field_CreateEntity
    ldr        r0,[r5,#0x60]
    bl         FieldObject_Disable
LAB_08074dda:
    mov        r0,#0x4
    str        r0,[r5,#0x8]
    bl         A_Skull_1_Main
    ldrb       r0,[r5,#0x4]
    lsr        r0,r0,#0x8
    bcs        LAB_08074dee
    ldr        r0,[r5,#0x60]
    bl         FieldObject_MarkAsChecked
LAB_08074dee:
    pop        {pc}


_ts A_Skull_1_Main
    push       {lr}
    bl         SpritePtr_DisableFlash
    ldrb       r0,[r5,#0x4]
    lsr        r0,r0,#0x8
    bcs        LAB_08074e04
    bl         A_Skull_IsDestroyed
    tst        r0,r0
    bne        LAB_08074e0e
LAB_08074e04:
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_A_Skull_1_0_08074e20
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
LAB_08074e0e:
    ldrb       r0,[r5,#0x4]
    lsr        r0,r0,#0x8
    bcs        LAB_08074e1a
    ldr        r0,[r5,#0x60]
    bl         FieldObject_UpdateCellPosition
LAB_08074e1a:
    bl         UpdateSpriteFrameIndex
    pop        {pc}

PTR_PTR_A_Skull_1_0_08074e20:
    .word PTR_A_Skull_1_0_08074e24

PTR_A_Skull_1_0_08074e24:
    .word A_Skull_1_0
    .word A_Skull_1_1
    .word A_Skull_1_2
    .word A_Skull_1_3


_ts A_Skull_1_0
    push       {lr}
    ldr        r0,[r5,#0x30]
    ldr        r1,[r5,#0x4c]
    add        r0,r0,r1
    str        r0,[r5,#0x30]
    mov        r1,#0x1
    lsl        r1,r1,#0x18
    cmp        r0,r1
    blt        LAB_08074e6c
    str        r1,[r5,#0x30]
    ldrb       r0,[r5,#0x6]
    ldrb       r1,[r5,#0x7]
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    mov        r0,#0x60
    ldrb       r1,[r5,#0x4]
    lsr        r1,r1,#0x8
    bcc        LAB_08074e62
    mov        r0,#0x30
LAB_08074e62:
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08074e6c:
    pop        {pc}


_nt A_Skull_1_1
    push       {lr}
    ldrb       r0,[r5,#0x4]
    lsr        r0,r0,#0x8
    bcs        LAB_08074ea6
    ldrh       r0,[r5,#0x1c]
    mov        r1,#0x1f
    tst        r0,r1
    bne        LAB_08074ea6
    ldrb       r0,[r5,#0x6]
    ldrb       r1,[r5,#0x7]
    bl         Battle_CellCoordsToSprite
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    mov        r3,#0x0
    ldr        r4,DAT_08074ebc
    mov        r6,#0x0
    mov        r7,#0x2
    mov        r0,#0x0
    bl         Attack_SharpStrike_Create
    add        r1,r7,#0x0
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x4
    and        r0,r1
    ldrb       r1,[r7,#0x0]
    orr        r1,r0
    strb       r1,[r7,#0x0]
LAB_08074ea6:
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08074eba
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08074eba:
    pop        {pc}

DAT_08074ebc:
    .word 0x270000


_ts A_Skull_1_2
    push       {lr}
    ldr        r0,[r5,#0x30]
    ldr        r1,[r5,#0x4c]
    sub        r0,r0,r1
    str        r0,[r5,#0x30]
    bgt        LAB_08074efe
    mov        r0,#0x0
    str        r0,[r5,#0x30]
    ldrb       r0,[r5,#0x4]
    lsr        r0,r0,#0x8
    bcs        LAB_08074edc
    ldr        r0,[r5,#0x60]
    bl         FieldObject_Enable
LAB_08074edc:
    mov        r0,#0x2
    mov        r1,#0x1e
    push       {r5}
    bl         Camera_EnableScreenShake
    pop        {r5}
    mov        r0,#0x3c
    strh       r0,[r5,#0x1c]
    mov        r0,#0x2
    strb       r0,[r5,#0x14]
    mov        r0,#0x7e
    bl         Sound_PlaySE
    mov        r0,#0xc
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08074efe:
    pop        {pc}


_ts A_Skull_1_3
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08074f0e
    mov        r0,#0x8
    str        r0,[r5,#0x8]
LAB_08074f0e:
    pop        {pc}


_ts A_Skull_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x5]
    tst        r0,r0
    bne        LAB_08074f1c
    ldr        r7,[r5,#0x64]
    str        r0,[r7,#0x0]
LAB_08074f1c:
    ldrb       r0,[r5,#0x4]
    lsr        r0,r0,#0x8
    bcs        LAB_08074f2a
    ldr        r0,[r5,#0x60]
    bl         FieldObject_Free
    b          LAB_08074f44
LAB_08074f2a:
    ldrb       r0,[r5,#0x6]
    ldrb       r1,[r5,#0x7]
    bl         Battle_CellCoordsToSprite
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    mov        r3,#0x0
    ldr        r4,DAT_08074f74
    ldrh       r6,[r5,#0x24]
    mov        r7,#0x1
    mov        r0,#0x0
    bl         Field_CreateSharpStrikeAttack
LAB_08074f44:
    ldr        r1,[r5,#0x28]
    ldr        r2,[r5,#0x2c]
    ldr        r3,[r5,#0x30]
    mov        r0,#0x10
    lsl        r0,r0,#0x10
    add        r3,r3,r0
    mov        r4,#0xf
    push       {r5}
    bl         Effect_QuickEffect_Create
    add        r7,r5,#0x0
    pop        {r5}
    tst        r7,r7
    beq        LAB_08074f6c
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x4
    and        r0,r1
    ldrb       r1,[r7,#0x0]
    orr        r1,r0
    strb       r1,[r7,#0x0]
LAB_08074f6c:
    bl         Attack_Free
    pop        {pc}

    .align 2, 0


DAT_08074f74:
    .word 0x10000


_ts A_Skull_IsDestroyed
    push       {lr}
    ldrb       r0,[r5,#0x5]
    tst        r0,r0
    beq        LAB_08074f8e
    ldr        r0,[r5,#0x60]
    bl         FieldObject_SetDeletedFlag
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    mov        r0,#0x1
    pop        {pc}
LAB_08074f8e:
    mov        r0,#0x0
    pop        {pc}


_nt Attack_Skull_Create
    push       {lr}
    push       {r0,r1,r2,r5,r6}
    mov        r0,#0x30
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r2,r5,r6}
    str        r7,[r0,#0x0]
    tst        r7,r7
    beq        LAB_08074fb2
    str        r0,[r7,#0x64]
    strb       r1,[r7,#0x18]
    strb       r2,[r7,#0x19]
    strh       r6,[r7,#0x24]
    ldrb       r0,[r5,#0x16]
    strb       r0,[r7,#0x16]
LAB_08074fb2:
    pop        {pc}
