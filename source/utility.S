#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .text

    .thumb

    .set Attack_SharpStrike_Create, 0x80719ac

_ts memset0_16
    mov        r2,#0x0
1:  sub        r1,#0x2
    strh       r2,[r0,r1]
    bne        1b
    mov        pc,lr

_ts memset0_32
    mov        r2,#0x0
1:  sub        r1,#0x4
    str        r2,[r0,r1]
    bne        1b
    mov        pc,lr

_ts memcpy_16
1:  sub        r2,#0x2
    ldrh       r3,[r0,r2]
    strh       r3,[r1,r2]
    bne        1b
    mov        pc,lr

_ts memset_16
1:  sub        r1,#0x2
    strh       r2,[r0,r1]
    bne        1b
    mov        pc,lr

_ts memset_32
1:  sub        r1,#0x4
    str        r2,[r0,r1]
    bne        1b
    mov        pc,lr

_ts memcpy_8
1:  sub        r2,#0x1
    ldrb       r3,[r0,r2]
    strb       r3,[r1,r2]
    bne        1b
    mov        pc,lr

_nt memset
1:  sub        r1,#0x1
    strb       r2,[r0,r1]
    bne        1b
    mov        pc,lr

_ts GetVcountPlusVal
    ldr        r0,PTR_REG_VCOUNT_08000c90
    ldrh       r0,[r0,#0x0]
    ldr        r1,PTR_DAT_08000c94
    ldr        r1,[r1,#0x0]
    add        r0,r0,r1
    mov        pc,lr

_ts memcpy_32
1:  sub        r2,#0x4
    ldr        r3,[r0,r2]
    str        r3,[r1,r2]
    bne        1b
    mov        pc,lr

_nt Divide
    mov        r2,#0x0
    ldr        r3,DAT_08000c98
    mov        r4,#0x20
    mov        r5,#0x0
    mov        r6,#0x0
LAB_08000aa0:
    lsl        r0,r0,#0x1
    adc        r2,r6
    cmp        r2,r1
    bmi        LAB_08000aac
    orr        r5,r3
    sub        r2,r2,r1
LAB_08000aac:
    lsl        r2,r2,#0x1
    lsr        r3,r3,#0x1
    sub        r4,#0x1
    bne        LAB_08000aa0
    add        r0,r5,#0x0
    lsr        r2,r2,#0x1
    add        r1,r2,#0x0
    mov        pc,lr

_ts ConvertNumToBCD
    ldr        r1,DAT_08000b0c
    cmp        r0,r1
    bmi        LAB_08000ac6
    ldr        r0,DAT_08000b10
    mov        pc,lr
LAB_08000ac6:
    ldr        r7,PTR_powersOf10_08000b08
    mov        r2,#0x0
    mov        r3,#0x8
LAB_08000acc:
    lsl        r2,r2,#0x4
    ldr        r1,[r7,#0x0]
    mov        r4,#0x0
LAB_08000ad2:
    cmp        r0,r1
    bmi        LAB_08000adc
    sub        r0,r0,r1
    add        r4,#0x1
    b          LAB_08000ad2
LAB_08000adc:
    orr        r2,r4
    add        r7,#0x4
    sub        r3,#0x1
    bne        LAB_08000acc
    add        r0,r2,#0x0
    mov        pc,lr

    .align 2, 0

powersOf10:
    .word 10000000
    .word 1000000
    .word 100000
    .word 10000
    .word 1000
    .word 100
    .word 10
    .word 1

PTR_powersOf10_08000b08:    .word powersOf10
DAT_08000b0c:               .word 0x05F5E0FF
DAT_08000b10:               .word 0x99999999

_ts GetWidthOfBcdNumber
    push       { lr }
    mov        r1,#0x1
    tst        r0,r0
    beq        LAB_08000b28
    mov        r1,#0x0
LAB_08000b1e:
    tst        r0,r0
    beq        LAB_08000b28
    add        r1,#0x1
    lsr        r0,r0,#0x4
    b          LAB_08000b1e
LAB_08000b28:
    add        r0,r1,#0x0
    pop        { pc }

@@ Shuffles a given array by randomly exchanging elements.
@@ In:
@@ r0: array
@@ r1: arraySz
@@ r2: shuffleCount
_ts ArrayShuffle
    push       { r5, lr }
.loop:
    push       { r0, r2 }
    push       { r1 }
    bl         Rng_RandomInt
    pop        { r1 }
    push       { r1 }
    bl         SWI_Div
    add        r3,r1,#0x0
    pop        { r1 }
    push       { r1, r3 }
    bl         Rng_RandomInt
    pop        { r1 }
    push       { r1 }
    bl         SWI_Div
    add        r4,r1,#0x0
    pop        { r1, r3 }
    pop        { r0, r2 }
    ldrb       r5,[r0,r3]
    ldrb       r6,[r0,r4]
    strb       r6,[r0,r3]
    strb       r5,[r0,r4]
    sub        r2,#0x1
    bne        .loop
    pop        { r5, pc }

_ts GetRandomElementOfArray
    push       { lr }
    add        r7,r0,#0x0
    push       { r1, r7 }
    bl         Rng_RandomInt
    pop        { r1, r7 }
    bl         SWI_Div
    ldrb       r0,[r7,r1]
    pop        { pc }

_ts ArraySort
    push       { lr }
    cmp        r1,#0x2
    bmi        LAB_08000b9c
    mov        r3,#0x1
LAB_08000b80:
    ldrb       r2,[r0,r3]
    mov        r4,#0x0
LAB_08000b84:
    ldrb       r6,[r0,r4]
    cmp        r2,r6
    bhi        LAB_08000b8e
    strb       r2,[r0,r4]
    add        r2,r6,#0x0
LAB_08000b8e:
    add        r4,#0x1
    cmp        r4,r3
    bmi        LAB_08000b84
    strb       r2,[r0,r3]
    add        r3,#0x1
    cmp        r3,r1
    bmi        LAB_08000b80
LAB_08000b9c:
    pop        { pc }

@@ Converts an input value which represents 1/60ths of a second to the same
@@ value in the format hh:MM:ss.ff
_nt FrameTimeToBcdRealTime
    push       { lr }
    @ return early if a time greater than 100 hours is passed
    ldr        r1,=21600000
    cmp        r0,r1
    bmi        1f
    ldr        r0,=0x99595999
    pop        { pc }
1:
    ldr        r7,ptrTimeConsts
    mov        r2,#0x0
    mov        r3,#0x6
2:
    lsl        r2,r2,#0x4
    ldr        r1,[r7,#0x0]
    mov        r4,#0x0
3:
    cmp        r0,r1
    bmi        4f
    sub        r0,r0,r1
    add        r4,#0x1
    b          3b
4:
    orr        r2,r4
    add        r7,#0x4
    sub        r3,#0x1
    bne        2b
    lsl        r2,r2,#0x8
    push       { r2 }
    @ Next, converting remaining frame time (60ths of a second) to real time
    @ (100ths of a second) by doing (f * 0x1AAAA) >> 16 and then converting
    @ the result into BCD
    ldr        r1,=0x1AAAA
    mul        r0,r1
    lsr        r0,r0,#0x10
    bl         ConvertNumToBCD
    pop        { r2 }
    orr        r0,r2
    pop        { pc }

    .align 2, 0

timeConsts:
    .word 2160000
    .word 216000
    .word 36000
    .word 3600
    .word 600
    .word 60
    .word 10
    .word 1
ptrTimeConsts:  .word timeConsts
    .pool

@@ Increments a timer, capping it at 99 hours and 59 minutes
_ts IncrementGameTimer
    LoadStateTo r7, Main_gameStats
    ldr        r0,[r7,#0x18]
    add        r0,#0x1
    @ 99 hours and 50 minutes = 5999 minutes
    @ Multiply by 60 to get seconds, then by 60 again to get frames
    ldr        r1,=(5999 * 60 * 60)
    cmp        r0,r1
    ble        .setTime
    add        r0,r1,#0x0
    .setTime:
    str        r0,[r7,#0x18]
    mov        pc,lr

    .align 2, 0
    .pool

_ts FUN_08000c24
    mov        r7,r10
    ldr        r7,[r7,#0x78]
    ldr        r2,=999
    ldrh       r1,[r7,#0x16]
    add        r1,r1,r0
    cmp        r1,r2
    ble        LAB_08000c34
    add        r1,r2,#0x0
LAB_08000c34:
    strh       r1,[r7,#0x16]
    ldrh       r1,[r7,#0x14]
    add        r1,#0x1
    cmp        r1,r2
    ble        LAB_08000c40
    add        r1,r2,#0x0
LAB_08000c40:
    strh       r1,[r7,#0x14]
    mov        pc,lr

    .align 2, 0
    .pool

_ts FUN_08000c48
    push       { lr }
    sub        sp,#0x8
    ldr        r1,=216000
    bl         SWI_Div
    str        r0,[sp,#0x0]
    add        r0,r1,#0x0
    ldr        r1,=3600
    bl         SWI_Div
    str        r0,[sp,#0x4]
    add        r0,r1,#0x0
    ldr        r1,=60
    bl         SWI_Div
    add        r3,r0,#0x0
    add        r4,r1,#0x0
    ldr        r1,[sp,#0x0]
    ldr        r2,[sp,#0x4]
    add        sp,#0x8
    pop        { pc }

    .align 2, 0
    .pool

_ts FUN_08000c80
    push       { lr }
    mov        r7,r10
    ldr        r7,[r7,#0x78]
    mov        r0,#0x4
    strb       r0,[r7,#0x1]
    strb       r0,[r7,#0x3]
    pop        { pc }

    .align 2, 0

PTR_REG_VCOUNT_08000c90:    .word REG_VCOUNT
PTR_DAT_08000c94:           .word 0x02006334
DAT_08000c98:               .word 0x80000000


@@ Converts a vector (dx, dy) to an angle.
@@ Angles atart at 0 pointing up, and increment clockwise.
@@ In:
@@ r0: dy: The Y coordinate of the vector.
@@ r1: dx: The X coordinate of the vector.
_ts VectorToAngle
    push       {lr}
    mov        r2,r10
    push       {r2}
    add        r2,r1,#0x0
    neg        r1,r0
    neg        r0,r2
    mov        r7,#0x0
    tst        r0,r0
    bpl        LAB_08000cb2
    add        r7,#0x2
    neg        r0,r0
LAB_08000cb2:
    tst        r1,r1
    bpl        LAB_08000cba
    add        r7,#0x1
    neg        r1,r1
LAB_08000cba:
    sub        r2,r7,#0x1
    cmp        r2,#0x1
    bhi        LAB_08000cc6
    add        r2,r0,#0x0
    add        r0,r1,#0x0
    add        r1,r2,#0x0
LAB_08000cc6:
    asr        r1,r1,#0x10
    beq        LAB_08000d0c
    bl         Divide
    lsr        r0,r0,#0x8
    mov        r10,r0
    mov        r0,#0x0
    mov        r8,r0
    mov        r0,#0x40
    mov        r9,r0
LAB_08000cda:
    mov        r2,r8
    add        r2,r9
    lsr        r2,r2,#0x1
    bcs        LAB_08000cf6
    lsl        r2,r2,#0x1
    ldr        r3,PTR_SHORT_ARRAY_08000d10
    ldrsh      r0,[r3,r2]
    lsr        r2,r2,#0x1
    cmp        r0,r10
    bcs        LAB_08000cf2
    mov        r8,r2
    b          LAB_08000cda
LAB_08000cf2:
    mov        r9,r2
    b          LAB_08000cda
LAB_08000cf6:
    mov        r0,r8
LAB_08000cf8:
    ldr        r1,PTR_DAT_08000d14
    ldrb       r2,[r1,r7]
    add        r0,r0,r2
    ldr        r1,DAT_08000d18
    sub        r0,r1,r0
    mov        r1,#0xff
    and        r0,r1
    pop        {r2}
    mov        r10,r2
    pop        {pc}
LAB_08000d0c:
    mov        r0,#0x40
    b          LAB_08000cf8

PTR_SHORT_ARRAY_08000d10:   .word tanTable
PTR_DAT_08000d14:           .word DAT_08000d1a
DAT_08000d18:               .short 0x100
DAT_08000d1a:               .byte 0x0, 0x40, 0xC0, 0x80


_ts ActorFacingPlayerAngle
    push       {r5,lr}
    push       {r0}
    ldr        r0,[r5,#0x2c]
    ldr        r1,[r5,#0x28]
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldr        r7,[r7,#0x28]
    ldr        r2,[r7,#0x28]
    ldr        r3,[r7,#0x24]
    sub        r0,r2,r0
    sub        r1,r3,r1
    bl         VectorToAngle
    pop        {r1}
    sub        r0,r0,r1
    lsl        r0,r0,#0x18
    asr        r0,r0,#0x18
    pop        {r5,pc}


_ts AngleToOffset
    lsl        r0,r0,#0x1
    ldr        r2,PTR_sinTable_08000d5c
    ldrsh      r3,[r2,r0]
    ldr        r2,PTR_cosTable_08000d60
    ldrsh      r2,[r2,r0]
    neg        r2,r2
    mul        r3,r1
    asr        r0,r3,#0x8
    mul        r2,r1
    asr        r1,r2,#0x8
    mov        pc,lr

    .align 2, 0

PTR_sinTable_08000d5c: .word sinTable
PTR_cosTable_08000d60: .word cosTable


_nt UpdateSpriteFrameIndex
    push       {lr}
    ldrb       r0,[r5,#0x14]
    ldrb       r1,[r5,#0x15]
    cmp        r0,r1
    beq        LAB_08000d78
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
LAB_08000d78:
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}


_nt FUN_08000d7e
    sub        r0,r0,r2
    add        r0,r0,r4
    lsl        r2,r4,#0x1
    cmp        r0,r2
    bcs        LAB_08000d94
    sub        r1,r1,r3
    add        r1,r1,r4
    cmp        r1,r2
    bcs        LAB_08000d94
    mov        r0,#0x1
    mov        pc,lr
LAB_08000d94:
    mov        r0,#0x0
    mov        pc,lr


_nt IsDistanceClose
    sub        r0,r0,r2
    sub        r1,r1,r3
    add        r2,r4,#0x0
    mul        r4,r2
    add        r2,r0,#0x0
    mul        r0,r2
    add        r2,r1,#0x0
    mul        r1,r2
    add        r0,r0,r1
    cmp        r4,r0
    bmi        LAB_08000db2
    mov        r0,#0x1
    mov        pc,lr
LAB_08000db2:
    mov        r0,#0x0
    mov        pc,lr


_nt IsCloseToPlayer
    push       {lr}
    ldr        r0,[r5,#0x28]
    asr        r0,r0,#0xc
    ldr        r1,[r5,#0x2c]
    asr        r1,r1,#0xc
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldr        r7,[r7,#0x28]
    ldr        r2,[r7,#0x24]
    asr        r2,r2,#0xc
    ldr        r3,[r7,#0x28]
    asr        r3,r3,#0xc
    bl         IsDistanceClose
    pop        {pc}
