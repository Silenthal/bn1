#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_CanodumbTarget
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_A_CanodumbTarget_0_Init_080719e4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_A_CanodumbTarget_0_Init_080719e4:
    .word PTR_A_CanodumbTarget_0_Init_080719e8

PTR_A_CanodumbTarget_0_Init_080719e8:
    .word A_CanodumbTarget_0_Init
    .word A_CanodumbTarget_1_Main
    .word A_CanodumbTarget_2_Free


_ts A_CanodumbTarget_0_Init
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0xdc
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    bl         SpritePtr_NoZClip
    mov        r0,#0x2
    bl         SpritePtr_SetPriority
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r0,#0xff
    strb       r0,[r5,#0x15]
    mov        r0,#0xc
    strh       r0,[r5,#0x1c]
    mov        r2,#0x0
    str        r2,[r5,#0x30]
    ldrb       r0,[r5,#0x4]
    add        r0,r0,r0
    ldr        r7,PTR_Struct_1A40_ARRAY_08071a3c
    add        r7,r7,r0
    ldrb       r0,[r7,#0x0]
    strh       r0,[r5,#0x24]
    ldrb       r0,[r7,#0x1]
    strh       r0,[r5,#0x1e]
    bl         A_CanodumbTarget_1_Main
    pop        {pc}

    .align 2, 0


PTR_Struct_1A40_ARRAY_08071a3c:
    .word Struct_1A40_ARRAY_08071a40

Struct_1A40_ARRAY_08071a40:
    .byte 0x0A, 0x0C
    .byte 0x64, 0x08
    .byte 0x28, 0x04

    .align 2, 0



_ts A_CanodumbTarget_1_Main
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldr        r7,[r5,#0x60]
    ldr        r0,[r7,#0x5c]
    tst        r0,r0
    beq        LAB_08071a78
    ldr        r7,PTR_PTR_A_CanodumbTarget_1_0_Move_08071a80
    ldrb       r0,[r5,#0x9]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         CanodumbTarget_IsOutOfBounds
    tst        r0,r0
    bne        LAB_08071a78
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    b          LAB_08071a7c
LAB_08071a78:
    mov        r0,#0x8
    strb       r0,[r5,#0x8]
LAB_08071a7c:
    pop        {pc}

    .align 2, 0


PTR_PTR_A_CanodumbTarget_1_0_Move_08071a80:
    .word PTR_A_CanodumbTarget_1_0_Move_08071a84

PTR_A_CanodumbTarget_1_0_Move_08071a84:
    .word A_CanodumbTarget_1_0_Move
    .word A_CanodumbTarget_1_1_Activate


_ts A_CanodumbTarget_1_0_Move
    push       {lr}
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_08071a9c
    ldrh       r0,[r5,#0x1e]
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
LAB_08071a9c:
    bl         A_CanodumbTarget_CheckPanelForTarget
    tst        r0,r0
    beq        LAB_08071aae
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    b          LAB_08071aca
LAB_08071aae:
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08071aca
    mov        r0,#0xc
    strh       r0,[r5,#0x1c]
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x16]
    tst        r1,r1
    bne        LAB_08071ac6
    add        r0,#0x1
    b          LAB_08071ac8
LAB_08071ac6:
    sub        r0,#0x1
LAB_08071ac8:
    strb       r0,[r5,#0x18]
LAB_08071aca:
    pop        {pc}


_ts A_CanodumbTarget_1_1_Activate
    push       {lr}
    ldr        r7,PTR_PTR_A_CanodumbTarget_1_1_0_Delay_08071adc
    ldrb       r0,[r5,#0xa]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_A_CanodumbTarget_1_1_0_Delay_08071adc:
    .word PTR_A_CanodumbTarget_1_1_0_Delay_08071ae0

PTR_A_CanodumbTarget_1_1_0_Delay_08071ae0:
    .word A_CanodumbTarget_1_1_0_Delay
    .word A_CanodumbTarget_1_1_1_Delay2
    .word A_CanodumbTarget_1_1_2_Flash


_ts A_CanodumbTarget_1_1_0_Delay
    push       {lr}
    mov        r0,#0x5
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    pop        {pc}


_ts A_CanodumbTarget_1_1_1_Delay2
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08071b0e
    mov        r0,#0xa
    strh       r0,[r5,#0x1c]
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
    mov        r0,#0x1
    strb       r0,[r5,#0x5]
LAB_08071b0e:
    pop        {pc}


_ts A_CanodumbTarget_1_1_2_Flash
    push       {lr}
    bl         SpritePtr_DisableFlash
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08071b3e
    push       {r5}
    ldr        r6,PTR_INT_ARRAY_08071b4c
    ldrb       r2,[r5,#0x16]
    lsl        r0,r2,#0x2
    ldr        r4,[r6,r0]
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    ldrh       r3,[r5,#0x24]
    mov        r6,#0x0
    mov        r7,#0x1
    bl         Attack_QuickAttack_Create
    pop        {r5}
    mov        r0,#0x8
    strb       r0,[r5,#0x8]
    b          LAB_08071b48
LAB_08071b3e:
    mov        r1,#0x2
    tst        r0,r1
    beq        LAB_08071b48
    bl         SpritePtr_EnableFlash
LAB_08071b48:
    pop        {pc}

    .align 2, 0


PTR_INT_ARRAY_08071b4c:
    .word INT_ARRAY_08071b50

INT_ARRAY_08071b50:
    .word 0x40
    .word 0x80


_ts A_CanodumbTarget_2_Free
    push       {lr}
    bl         Attack_Free
    pop        {pc}


_ts Attack_CanodumbTarget_Create
    push       {lr}
    push       {r0,r1,r5}
    mov        r0,#0x1a
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r5}
    tst        r7,r7
    beq        LAB_08071b7c
    strb       r0,[r7,#0x18]
    strb       r1,[r7,#0x19]
    ldrb       r2,[r5,#0x16]
    strb       r2,[r7,#0x16]
    str        r5,[r7,#0x60]
LAB_08071b7c:
    add        r0,r7,#0x0
    pop        {pc}


_ts CanodumbTarget_IsOutOfBounds
    push       {lr}
    mov        r0,#0x1
    ldrb       r1,[r5,#0x18]
    cmp        r1,#0x7
    bhi        LAB_08071b92
    ldrb       r1,[r5,#0x19]
    cmp        r1,#0x4
    bhi        LAB_08071b92
    mov        r0,#0x0
LAB_08071b92:
    pop        {pc}


_ts A_CanodumbTarget_CheckPanelForTarget
    push       {lr}
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Field_GetPanelFlags
    add        r2,r0,#0x0
    ldrb       r1,[r5,#0x16]
    lsl        r1,r1,#0x2
    ldr        r7,PTR_PanelFlag_ARRAY_08071bb4
    ldr        r1,[r7,r1]
    mov        r0,#0x0
    tst        r1,r2
    beq        LAB_08071bb0
    mov        r0,#0x1
LAB_08071bb0:
    pop        {pc}

    .align 2, 0


PTR_PanelFlag_ARRAY_08071bb4:
    .word PanelFlag_ARRAY_08071bb8

PanelFlag_ARRAY_08071bb8:
    .word PF_EnemyOccupied | PF_Solid
    .word PF_PlayerOccupied | PF_Solid
