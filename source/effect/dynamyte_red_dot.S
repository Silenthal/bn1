#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Effect_DynamyteRedDot
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_E_DynamyteRedDot_0_Init_0808109c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_E_DynamyteRedDot_0_Init_0808109c:
    .word PTR_E_DynamyteRedDot_0_Init_080810a0

PTR_E_DynamyteRedDot_0_Init_080810a0:
    .word E_DynamyteRedDot_0_Init
    .word E_DynamyteRedDot_1_Main
    .word E_DynamyteRedDot_2_Free


_ts E_DynamyteRedDot_0_Init
    push       {lr}
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0xc2
    bl         Sprite_InitSpritePtr
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_NoZClip
    bl         Field_GetAttackDirectionOffset_MP
    ldr        r7,PTR_Position4_ARRAY_080810f4
    ldrb       r1,[r5,#0x4]
    lsl        r1,r1,#0x3
    add        r7,r7,r1
    ldr        r1,[r7,#0x0]
    mul        r0,r1
    str        r0,[r5,#0x44]
    ldr        r0,[r7,#0x4]
    str        r0,[r5,#0x48]
    mov        r0,#0x4
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    bl         E_DynamyteRedDot_1_Main
    pop        {pc}

PTR_Position4_ARRAY_080810f4:
    .word Position4_ARRAY_080810f8

Position4_ARRAY_080810f8:
    .word f(40, 0)
    .word f(40, 0)
    .word f(40, 24)
    .word f(40, -24)
    .word f(0, 24)
    .word f(0, -24)


_ts E_DynamyteRedDot_1_Main
    push       {lr}
    bl         SpritePtr_ProcessFrameDelay
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08081166
    mov        r0,#0x4
    strh       r0,[r5,#0x1c]
    ldr        r0,[r5,#0x28]
    ldr        r1,[r5,#0x44]
    add        r0,r0,r1
    str        r0,[r5,#0x28]
    ldr        r1,[r5,#0x2c]
    ldr        r2,[r5,#0x48]
    add        r1,r1,r2
    str        r1,[r5,#0x2c]
    bl         Battle_SpriteCoordsToCell
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    bl         Field_IsCellPositionValid
    tst        r0,r0
    bne        LAB_08081166
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0x8
    str        r0,[r5,#0x8]
LAB_08081166:
    pop        {pc}


_ts E_DynamyteRedDot_2_Free
    push       {lr}
    bl         Effect_Free
    pop        {pc}


_ts Effect_DynamyteRedDot_Create
    push       {lr}
    add        r7,r4,#0x0
    beq        LAB_08081194
    push       {r5}
    mov        r0,#0x40
    bl         Effect_Alloc
    add        r7,r5,#0x0
    pop        {r5}
    beq        LAB_08081194
    ldrb       r0,[r5,#0x16]
    strb       r0,[r7,#0x16]
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x4
    and        r0,r1
    ldrb       r1,[r7,#0x0]
    orr        r0,r1
    strb       r0,[r7,#0x0]
LAB_08081194:
    pop        {pc}

    .align 2, 0

