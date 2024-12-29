#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


PTR_PTR_USHORT_ARRAY_0807e77c:
    .word PTR_USHORT_ARRAY_0807e794
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .word PTR_USHORT_ARRAY_0807e794
    .word PTR_USHORT_ARRAY_0807e794
    .word PTR_USHORT_ARRAY_0807e794
    .word PTR_USHORT_ARRAY_0807e794

PTR_USHORT_ARRAY_0807e794:
    .word USHORT_ARRAY_0807e7a4
    .word USHORT_ARRAY_0807e7e4
    .word USHORT_ARRAY_0807e824
    .word USHORT_ARRAY_0807e864

USHORT_ARRAY_0807e7a4:
    .short 0xD
    .short 0x700
    .short 0xD000
    .short 0xFD00
    .short 0xD
    .short 0x701
    .short 0xD000
    .short 0xFD00
    .short 0xD
    .short 0x702
    .short 0xD000
    .short 0xFD00
    .short 0xD
    .short 0x700
    .short 0xD000
    .short 0xFD00
    .short 0xD
    .short 0x701
    .short 0xD000
    .short 0xFD00
    .short 0xD
    .short 0x702
    .short 0xD000
    .short 0xFD00
    .short 0xD
    .short 0x700
    .short 0xD000
    .short 0xFD00
    .short 0xD
    .short 0x700
    .short 0xD000
    .short 0xFD00

USHORT_ARRAY_0807e7e4:
    .short 0xD
    .short 0x100
    .short 0x30
    .short 0x3
    .short 0xD
    .short 0x101
    .short 0x30
    .short 0x3
    .short 0xD
    .short 0x102
    .short 0x30
    .short 0x3
    .short 0xD
    .short 0x100
    .short 0x30
    .short 0x3
    .short 0xD
    .short 0x101
    .short 0x30
    .short 0x3
    .short 0xD
    .short 0x102
    .short 0x30
    .short 0x3
    .short 0xD
    .short 0x100
    .short 0x30
    .short 0x3
    .short 0xD
    .short 0x100
    .short 0x30
    .short 0x3

USHORT_ARRAY_0807e824:
    .short 0xD
    .short 0x300
    .short 0x3000
    .short 0x300
    .short 0xD
    .short 0x301
    .short 0x3000
    .short 0x300
    .short 0xD
    .short 0x302
    .short 0x3000
    .short 0x300
    .short 0xD
    .short 0x300
    .short 0x3000
    .short 0x300
    .short 0xD
    .short 0x301
    .short 0x3000
    .short 0x300
    .short 0xD
    .short 0x302
    .short 0x3000
    .short 0x300
    .short 0xD
    .short 0x300
    .short 0x3000
    .short 0x300
    .short 0xD
    .short 0x300
    .short 0x3000
    .short 0x300

USHORT_ARRAY_0807e864:
    .short 0xD
    .short 0x500
    .short 0xD0
    .short 0xFD
    .short 0xD
    .short 0x501
    .short 0xD0
    .short 0xFD
    .short 0xD
    .short 0x502
    .short 0xD0
    .short 0xFD
    .short 0xD
    .short 0x500
    .short 0xD0
    .short 0xFD
    .short 0xD
    .short 0x501
    .short 0xD0
    .short 0xFD
    .short 0xD
    .short 0x502
    .short 0xD0
    .short 0xFD
    .short 0xD
    .short 0x500
    .short 0xD0
    .short 0xFD
    .short 0xD
    .short 0x500
    .short 0xD0
    .short 0xFD


_ts Effect_Car
    push       {lr}
    ldr        r0,PTR_PTR_E_Car_0_Init_0807ea70
    ldrb       r1,[r5,#0x8]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0


PTR_E_Car_0_Init_0807e8b4:
    .word E_Car_0_Init
    .word E_Car_1_Main
    .word E_Car_2_Free
    .word E_Car_3
    .word E_Car_4


_ts E_Car_0_Init
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    LoadMain world, r0, r0
    ldrb       r0,[r0,#0x5]
    lsl        r0,r0,#0x2
    ldr        r7,PTR_PTR_0807ea74
    ldr        r7,[r7,r0]
    ldrb       r0,[r5,#0x4]
    strb       r0,[r5,#0x7]
    lsl        r0,r0,#0x2
    ldr        r7,[r7,r0]
    push       {r5,r7}
    bl         Rng_RandomUint
    pop        {r5,r7}
    mov        r1,#0x7
    and        r0,r1
    lsl        r0,r0,#0x3
    add        r7,r7,r0
    mov        r0,#0x1
    ldrh       r1,[r7,#0x0]
    push       {r7}
    bl         Sprite_InitSpritePtr
    pop        {r7}
    ldrb       r0,[r7,#0x3]
    push       {r7}
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_NoZClip
    add        r0,r5,#0x0
    add        r0,#0x28
    push       {r5}
    bl         Map_HandleCollisionCover
    pop        {r5}
    bl         SpritePtr_SetPriority
    pop        {r7}
    ldrb       r0,[r7,#0x2]
    push       {r7}
    bl         SpritePtr_SetPaletteIndex
    pop        {r7}
    mov        r0,#0x4
    ldrsb      r0,[r7,r0]
    strb       r0,[r5,#0x4]
    lsl        r0,r0,#0xc
    str        r0,[r5,#0x60]
    mov        r0,#0x5
    ldrsb      r0,[r7,r0]
    strb       r0,[r5,#0x5]
    lsl        r0,r0,#0xc
    str        r0,[r5,#0x64]
    mov        r0,#0x6
    ldrsb      r0,[r7,r0]
    lsl        r0,r0,#0xc
    str        r0,[r5,#0x68]
    mov        r0,#0x7
    ldrsb      r0,[r7,r0]
    lsl        r0,r0,#0xc
    str        r0,[r5,#0x6c]
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    pop        {pc}


_ts E_Car_1_Main
    push       {lr}
    ldr        r0,[r5,#0x28]
    ldr        r1,[r5,#0x60]
    add        r0,r0,r1
    str        r0,[r5,#0x28]
    ldr        r0,[r5,#0x2c]
    ldr        r1,[r5,#0x64]
    add        r0,r0,r1
    str        r0,[r5,#0x2c]
    add        r0,r5,#0x0
    add        r0,#0x28
    push       {r5}
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x14
    beq        LAB_0807e97c
    cmp        r0,#0x15
    beq        LAB_0807e98c
    b          LAB_0807e99e
LAB_0807e97c:
    mov        r0,#0x8
    strb       r0,[r5,#0x8]
    ldr        r7,PTR_DAT_0807ea78
    ldrb       r0,[r5,#0x7]
    add        r0,#0x8
    mov        r1,#0x0
    strb       r1,[r7,r0]
    b          LAB_0807e99e
LAB_0807e98c:
    ldr        r7,PTR_DAT_0807ea7c
    ldrb       r0,[r7,#0x5]
    ldrb       r1,[r5,#0x7]
    eor        r0,r1
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_0807e99e
    mov        r0,#0xc
    strb       r0,[r5,#0x8]
LAB_0807e99e:
    add        r0,r5,#0x0
    add        r0,#0x28
    push       {r5}
    bl         Map_HandleCollisionCover
    pop        {r5}
    bl         SpritePtr_SetPriority
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}


_ts E_Car_2_Free
    push       {lr}
    bl         Effect_Free
    pop        {pc}


_ts E_Car_3
    push       {lr}
    mov        r2,#0x0
    mvn        r2,r2
    lsl        r2,r2,#0x10
    ldr        r1,[r5,#0x60]
    tst        r1,r1
    beq        LAB_0807e9d8
    ldr        r0,[r5,#0x28]
    add        r0,r0,r1
    and        r0,r2
    str        r0,[r5,#0x28]
    ldr        r0,[r5,#0x68]
    sub        r1,r1,r0
    str        r1,[r5,#0x60]
LAB_0807e9d8:
    ldr        r1,[r5,#0x64]
    tst        r1,r1
    beq        LAB_0807e9ec
    ldr        r0,[r5,#0x2c]
    add        r0,r0,r1
    and        r0,r2
    str        r0,[r5,#0x2c]
    ldr        r0,[r5,#0x6c]
    sub        r1,r1,r0
    str        r1,[r5,#0x64]
LAB_0807e9ec:
    ldr        r7,PTR_DAT_0807ea80
    ldrb       r0,[r7,#0x5]
    ldrb       r1,[r5,#0x7]
    eor        r0,r1
    mov        r1,#0x1
    tst        r0,r1
    bne        LAB_0807e9fe
    mov        r0,#0x10
    strb       r0,[r5,#0x8]
LAB_0807e9fe:
    add        r0,r5,#0x0
    add        r0,#0x28
    push       {r5}
    bl         Map_HandleCollisionCover
    pop        {r5}
    bl         SpritePtr_SetPriority
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}


_ts E_Car_4
    push       {lr}
    mov        r7,#0x0
    mov        r2,#0x4
    ldrsb      r2,[r5,r2]
    lsl        r2,r2,#0xc
    ldr        r1,[r5,#0x60]
    ldr        r0,[r5,#0x28]
    add        r0,r0,r1
    str        r0,[r5,#0x28]
    cmp        r1,r2
    beq        LAB_0807ea34
    ldr        r0,[r5,#0x68]
    asr        r0,r0,#0x1
    add        r1,r1,r0
    str        r1,[r5,#0x60]
    mov        r7,#0x1
LAB_0807ea34:
    mov        r2,#0x5
    ldrsb      r2,[r5,r2]
    lsl        r2,r2,#0xc
    ldr        r1,[r5,#0x64]
    ldr        r0,[r5,#0x2c]
    add        r0,r0,r1
    str        r0,[r5,#0x2c]
    cmp        r1,r2
    beq        LAB_0807ea50
    ldr        r0,[r5,#0x6c]
    asr        r0,r0,#0x1
    add        r1,r1,r0
    str        r1,[r5,#0x64]
    mov        r7,#0x1
LAB_0807ea50:
    tst        r7,r7
    bne        LAB_0807ea58
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
LAB_0807ea58:
    add        r0,r5,#0x0
    add        r0,#0x28
    push       {r5}
    bl         Map_HandleCollisionCover
    pop        {r5}
    bl         SpritePtr_SetPriority
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}

    .align 2, 0


PTR_PTR_E_Car_0_Init_0807ea70:
    .word PTR_E_Car_0_Init_0807e8b4

PTR_PTR_0807ea74:
    .word PTR_PTR_USHORT_ARRAY_0807e77c

PTR_DAT_0807ea78:
    .word gTraffic

PTR_DAT_0807ea7c:
    .word gTraffic

PTR_DAT_0807ea80:
    .word gTraffic
