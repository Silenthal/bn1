#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set Battle_IsTimerPaused, 0x8006A04

_ts Camera_Init
    push       {lr}
    push       {r3,r4}
    push       {r0,r1,r2}
    mov        r5,r10
    ldr        r5,[r5,#0x14]
    ldrb       r0,[r5,#0x3]
    ldr        r1,[r5,#0x10]
    push       {r0,r1,r5}
    mov        r0,r10
    ldr        r0,[r0,#0x14]
    mov        r1,#0x44
    bl         memset0_32
    pop        {r0,r1,r5}
    strb       r0,[r5,#0x3]
    str        r1,[r5,#0x10]
    mov        r0,r10
    ldr        r0,[r0,#0x44]
    ldrb       r3,[r0,#0x0]
    sub        r3,#0x1e
    lsl        r3,r3,#0x12
    str        r3,[r5,#0x18]
    neg        r3,r3
    str        r3,[r5,#0x14]
    ldrb       r3,[r0,#0x1]
    sub        r3,#0x14
    lsl        r3,r3,#0x12
    str        r3,[r5,#0x1c]
    neg        r3,r3
    str        r3,[r5,#0x20]
    pop        {r1,r2,r3}
    str        r1,[r5,#0x2c]
    str        r2,[r5,#0x30]
    str        r3,[r5,#0x34]
    mov        r1,#0x0
    strh       r1,[r5,#0x4]
    strh       r1,[r5,#0x6]
    pop        {r3,r4}
    cmp        r3,#0xf0
    bge        LAB_08010c80
    cmp        r3,#0x80
    bge        LAB_08010c7c
    mov        r0,#0x0
    b          LAB_08010c82
LAB_08010c7c:
    mov        r0,#0x1
    b          LAB_08010c82
LAB_08010c80:
    mov        r0,#0x2
LAB_08010c82:
    strb       r0,[r5,#0x2]
    bl         Camera_CheckScreenShake
    bl         Camera_UpdatePosition
    bl         Camera_UpdateDisplay
    bl         Camera_UpdateLastPos
    pop        {pc}



_ts Camera_UpdatePos
    push       {lr}
    mov        r5,r10
    ldr        r5,[r5,#0x14]
    ldr        r0,PTR_PTR_dummy_10d6c
    ldrb       r1,[r5,#0x3]
    lsl        r1,r1,#0x2
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Camera_CheckScreenShake
    bl         Camera_UpdatePosition
    ldrh       r1,[r5,#0x4]
    ldrh       r2,[r5,#0x8]
    sub        r1,r1,r2
    ldrh       r4,[r5,#0x6]
    ldrh       r2,[r5,#0xa]
    sub        r4,r4,r2
    mov        r0,r10
    ldr        r0,[r0,#0x10]
    ldrh       r6,[r0,#0x14]
    add        r6,r6,r1
    strh       r6,[r0,#0x14]
    ldrh       r7,[r0,#0x16]
    add        r7,r7,r4
    strh       r7,[r0,#0x16]
    ldrb       r2,[r5,#0x2]
    cmp        r2,#0x1
    beq        LAB_08010ce2
    cmp        r2,#0x2
    beq        LAB_08010ce6
    strh       r6,[r0,#0x10]
    strh       r7,[r0,#0x12]
    strh       r6,[r0,#0x18]
    strh       r7,[r0,#0x1a]
    b          LAB_08010ce6
LAB_08010ce2:
    strh       r6,[r0,#0x18]
    strh       r7,[r0,#0x1a]
LAB_08010ce6:
    push       {r1,r4}
    bl         Camera_UpdateLastPos
    pop        {r1,r4}
    pop        {pc}
PTR_dummy_10d6c:
    .word dummy_10d6c
    .word Camera_UpdateMapPosFromPlayerLoc


_ts Camera_UpdatePosition
    push       {lr}
    ldrb       r2,[r5,#0x2]
    cmp        r2,#0x2
    beq        LAB_08010d06
    bl         Camera_UpdateOverworldPos
    pop        {pc}
LAB_08010d06:
    ldr        r1,[r5,#0x38]
    ldr        r2,[r5,#0x14]
    cmp        r1,r2
    bge        LAB_08010d10
    add        r1,r2,#0x0
LAB_08010d10:
    ldr        r2,[r5,#0x18]
    cmp        r1,r2
    ble        LAB_08010d18
    add        r1,r2,#0x0
LAB_08010d18:
    str        r1,[r5,#0x38]
    asr        r1,r1,#0x10
    strh       r1,[r5,#0x4]
    ldr        r6,[r5,#0x40]
    ldr        r4,[r5,#0x3c]
    ldr        r2,[r5,#0x20]
    add        r2,r2,r6
    cmp        r4,r2
    bge        LAB_08010d2c
    add        r4,r2,#0x0
LAB_08010d2c:
    ldr        r2,[r5,#0x1c]
    add        r2,r2,r6
    cmp        r4,r2
    ble        LAB_08010d36
    add        r4,r2,#0x0
LAB_08010d36:
    str        r4,[r5,#0x3c]
    add        r6,r4,#0x0
    ldr        r4,[r5,#0x40]
    ldr        r2,[r5,#0x20]
    add        r2,r2,r6
    str        r2,[r5,#0x28]
    cmp        r4,r2
    bge        LAB_08010d48
    add        r4,r2,#0x0
LAB_08010d48:
    ldr        r2,[r5,#0x1c]
    add        r2,r2,r6
    str        r2,[r5,#0x24]
    cmp        r4,r2
    ble        LAB_08010d54
    add        r4,r2,#0x0
LAB_08010d54:
    str        r4,[r5,#0x40]
    sub        r6,r6,r4
    asr        r6,r6,#0x10
    strh       r6,[r5,#0x6]
    pop        {pc}


_ts Camera_UpdateLastPos
    push       {lr}
    ldrh       r1,[r5,#0x4]
    strh       r1,[r5,#0x8]
    ldrh       r1,[r5,#0x6]
    strh       r1,[r5,#0xa]
    pop        {pc}


_ts dummy_10d6c
    push       {lr}
    pop        {pc}


_ts Camera_UpdateMapPosFromPlayerLoc
    push       {lr}
    ldr        r7,[r5,#0x10]
    ldr        r2,[r7,#0x0]
    str        r2,[r5,#0x2c]
    ldr        r2,[r7,#0x4]
    str        r2,[r5,#0x30]
    ldr        r2,[r7,#0x8]
    str        r2,[r5,#0x34]
    pop        {pc}


_ts Camera_SetEnabled
    push       {lr}
    mov        r5,r10
    ldr        r5,[r5,#0x14]
    strb       r0,[r5,#0x3]
    str        r1,[r5,#0x10]
    pop        {pc}


_ts Camera_CheckScreenShake
    push       {lr}
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldrb       r7,[r7,#0x18]
    tst        r7,r7
    bne        LAB_08010da8
    push       {r5}
    bl         Battle_IsTimerPaused
    pop        {r5}
    tst        r0,r0
    bne        LAB_08010dec
LAB_08010da8:
    ldrh       r0,[r5,#0xc]
    cmp        r0,#0x0
    beq        LAB_08010dec
    ldrh       r6,[r5,#0xe]
    lsl        r6,r6,#0x3
    ldr        r7,PTR_listShakeStrength_08010ea8
    add        r7,r7,r6
    sub        r1,r0,#0x1
    strh       r1,[r5,#0xc]
    push       {r5,r7}
    bl         Rng_RandomUint
    pop        {r5,r7}
    ldr        r2,[r7,#0x0]
    and        r0,r2
    lsl        r0,r0,#0x10
    ldr        r2,[r7,#0x4]
    sub        r0,r0,r2
    ldr        r2,[r5,#0x2c]
    add        r2,r2,r0
    str        r2,[r5,#0x38]
    push       {r5,r7}
    bl         Rng_RandomUint
    pop        {r5,r7}
    ldr        r2,[r7,#0x0]
    and        r0,r2
    lsl        r0,r0,#0x10
    ldr        r2,[r7,#0x4]
    sub        r0,r0,r2
    ldr        r2,[r5,#0x30]
    add        r2,r2,r0
    str        r2,[r5,#0x3c]
    pop        {pc}
LAB_08010dec:
    ldr        r2,[r5,#0x2c]
    str        r2,[r5,#0x38]
    ldr        r2,[r5,#0x30]
    str        r2,[r5,#0x3c]
    ldr        r2,[r5,#0x34]
    str        r2,[r5,#0x40]
    pop        {pc}

    .align 2, 0

listShakeStrength:
    .word 0x1
    .word 0x10000
    .word 0x3
    .word 0x20000
    .word 0x7
    .word 0x40000
    .word 0xF
    .word 0x80000


_ts Camera_EnableScreenShake
    mov        r5,r10
    ldr        r5,[r5,#0x14]
    strh       r0,[r5,#0xe]
    strh       r1,[r5,#0xc]
    mov        pc,lr


_ts Camera_DisableScreenShake
    mov        r5,r10
    ldr        r5,[r5,#0x14]
    mov        r0,#0x0
    strh       r0,[r5,#0xe]
    strh       r0,[r5,#0xc]
    mov        pc,lr


_ts Camera_UpdateOverworldPos
    push       {lr}
    mov        r1,#0x0
    ldr        r4,[r5,#0x38]
    sub        r1,r1,r4
    mov        r6,#0x0
    ldr        r4,[r5,#0x3c]
    sub        r6,r6,r4
    add        r7,r6,#0x0
    mov        r8,r1
    add        r1,r1,r6
    asr        r1,r1,#0x10
    neg        r1,r1
    strh       r1,[r5,#0x4]
    add        r6,r7,#0x0
    mov        r2,r8
    sub        r6,r6,r2
    asr        r6,r6,#0x1
    mov        r4,#0x0
    sub        r6,r6,r4
    ldr        r2,[r5,#0x40]
    add        r6,r6,r2
    asr        r6,r6,#0x10
    neg        r6,r6
    strh       r6,[r5,#0x6]
    pop        {pc}


@@ Update background offset registers to match the camera's position.
@@ If online, update only BG2 and BG3.
@@ If in battle, update only BG2.
_ts Camera_UpdateDisplay
    mov        r7,r10
    ldr        r5,[r7,#0x14]
    ldrh       r1,[r5,#0x4]
    ldrh       r2,[r5,#0x6]
    ldr        r3,[r7,#0x10]
    mov        r4,#0xff
    and        r1,r4
    strh       r1,[r3,#0x10]
    strh       r1,[r3,#0x14]
    strh       r1,[r3,#0x18]
    and        r2,r4
    strh       r2,[r3,#0x12]
    strh       r2,[r3,#0x16]
    strh       r2,[r3,#0x1a]
    ldrb       r0,[r5,#0x2]
    cmp        r0,#0x1
    beq        LAB_08010e90
    cmp        r0,#0x2
    beq        LAB_08010e98
    b          LAB_08010ea2
LAB_08010e90:
    mov        r1,#0x0
    strh       r1,[r3,#0x10]
    strh       r1,[r3,#0x12]
    b          LAB_08010ea2
LAB_08010e98:
    mov        r1,#0x0
    strh       r1,[r3,#0x10]
    strh       r1,[r3,#0x12]
    strh       r1,[r3,#0x18]
    strh       r1,[r3,#0x1a]
LAB_08010ea2:
    mov        pc,lr
PTR_PTR_dummy_10d6c:
    .word PTR_dummy_10d6c
PTR_listShakeStrength_08010ea8:
    .word listShakeStrength
