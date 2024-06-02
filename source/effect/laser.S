#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Effect_Laser
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_E_Laser_0_Init_0807e024
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_E_Laser_0_Init_0807e024:
    .word PTR_E_Laser_0_Init_0807e028

PTR_E_Laser_0_Init_0807e028:
    .word E_Laser_0_Init
    .word E_Laser_1_Main
    .word E_Laser_2_Free


_ts E_Laser_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0x8c
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    ldrb       r0,[r5,#0x4]
    lsl        r0,r0,#0x2
    add        r0,#0x6
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_NoZClip
    ldrb       r0,[r5,#0x5]
    bl         SpritePtr_SetPaletteIndex
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    mov        r0,#0x32
    strh       r0,[r5,#0x1c]
    mov        r0,#0x0
    strh       r0,[r5,#0x1e]
    strb       r0,[r5,#0x7]
    mov        r0,#0x64
    add        r0,r0,r5
    mov        r1,#0x14
    bl         memset0_32
    mov        r7,#0x64
    add        r7,r7,r5
    ldrb       r0,[r5,#0x18]
    sub        r0,#0x1
    ldrb       r1,[r5,#0x19]
LAB_0807e084:
    push       {r0,r1}
    bl         Battle_IsOutOfBounds
    tst        r0,r0
    pop        {r0,r1}
    bne        LAB_0807e0c4
    push       {r0,r1,r7}
    bl         FieldObject_Alloc
    add        r6,r0,#0x0
    pop        {r0,r1,r7}
    tst        r6,r6
    beq        LAB_0807e0c4
    push       {r0,r1}
    strb       r0,[r6,#0x2]
    strb       r0,[r6,#0x4]
    strb       r1,[r6,#0x3]
    strb       r1,[r6,#0x5]
    ldrh       r0,[r5,#0x24]
    strh       r0,[r6,#0x8]
    mov        r0,#0x0
    strb       r0,[r6,#0x6]
    ldr        r0,DAT_0807e0cc
    str        r0,[r6,#0xc]
    str        r6,[r7,#0x0]
    add        r0,r6,#0x0
    bl         FieldObject_Disable
    pop        {r0,r1}
    add        r7,#0x4
    sub        r0,#0x1
    b          LAB_0807e084
LAB_0807e0c4:
    bl         E_Laser_1_Main
    pop        {pc}

    .align 2, 0


DAT_0807e0cc:
    .word 0x4088


_ts E_Laser_1_Main
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_E_Laser_1_0_0807e0e0
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_E_Laser_1_0_0807e0e0:
    .word PTR_E_Laser_1_0_0807e0e4

PTR_E_Laser_1_0_0807e0e4:
    .word E_Laser_1_0
    .word E_Laser_1_1


_ts E_Laser_1_0
    push       {lr}
    ldrb       r0,[r5,#0x7]
    ldr        r7,PTR_DAT_0807e120
    ldrb       r1,[r7,r0]
    ldrh       r2,[r5,#0x1e]
    add        r2,#0x1
    strh       r2,[r5,#0x1e]
    cmp        r2,r1
    bmi        LAB_0807e106
    add        r1,r0,#0x1
    strb       r1,[r5,#0x7]
    bl         E_Laser_EnableHitbox
LAB_0807e106:
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0807e116
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0807e116:
    pop        {pc}

DAT_0807e118:
    .byte 0x11
    .byte 0x15
    .byte 0x18
    .byte 0x1B
    .byte 0x1E
    .byte -1

    .align 2, 0


PTR_DAT_0807e120:
    .word DAT_0807e118


_ts E_Laser_1_1
    push       {lr}
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_0807e13a
    ldrb       r0,[r5,#0x4]
    lsl        r0,r0,#0x2
    add        r0,#0x8
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    b          LAB_0807e148
LAB_0807e13a:
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0807e148
    bl         E_Laser_2_Free
LAB_0807e148:
    pop        {pc}


_nt E_Laser_2_Free
    push       {lr}
    mov        r2,#0x0
    mov        r7,#0x64
    add        r7,r7,r5
LAB_0807e152:
    ldr        r0,[r7,#0x0]
    tst        r0,r0
    beq        LAB_0807e160
    push       {r2,r7}
    bl         FieldObject_Free
    pop        {r2,r7}
LAB_0807e160:
    add        r7,#0x4
    add        r2,#0x1
    cmp        r2,#0x5
    bmi        LAB_0807e152
    bl         Effect_Free
    pop        {pc}


_nt Effect_Laser_Create
    push       {r5,lr}
    push       {r0,r1,r2}
    mov        r0,#0x14
    bl         Effect_Alloc
    add        r6,r5,#0x0
    pop        {r0,r1,r2}
    beq        LAB_0807e196
    strh       r2,[r6,#0x24]
    strb       r0,[r6,#0x18]
    strb       r1,[r6,#0x19]
    bl         Battle_CellCoordsToSprite
    mov        r2,#0x60
    lsl        r2,r2,#0x10
    sub        r0,r0,r2
    str        r0,[r6,#0x28]
    str        r1,[r6,#0x2c]
    mov        r2,#0x0
    str        r2,[r6,#0x30]
LAB_0807e196:
    add        r0,r6,#0x0
    pop        {r5,pc}


_nt E_Laser_EnableHitbox
    push       {lr}
    lsl        r0,r0,#0x2
    mov        r7,#0x64
    add        r7,r7,r5
    ldr        r0,[r7,r0]
    tst        r0,r0
    beq        LAB_0807e1ac
    bl         FieldObject_Enable
LAB_0807e1ac:
    pop        {pc}


_nt E_Laser_DisableHitbox
    push       {lr}
    lsl        r0,r0,#0x2
    mov        r7,#0x64
    add        r7,r7,r5
    ldr        r0,[r7,r0]
    tst        r0,r0
    beq        LAB_0807e1c0
    bl         FieldObject_Disable
LAB_0807e1c0:
    pop        {pc}

    .align 2, 0

