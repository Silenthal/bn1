#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .text

    .thumb

thumb_func_start memset0_16
memset0_16:
    mov        r2,#0x0
1:  sub        r1,#0x2
    strh       r2,[r0,r1]
    bne        1b
    mov        pc,lr
thumb_func_end memset0_16

thumb_func_start memset0_32
memset0_32:
    mov        r2,#0x0
1:  sub        r1,#0x4
    str        r2,[r0,r1]
    bne        1b
    mov        pc,lr
thumb_func_end memset0_32

thumb_func_start memcpy_16
memcpy_16:
1:  sub        r2,#0x2
    ldrh       r3,[r0,r2]
    strh       r3,[r1,r2]
    bne        1b
    mov        pc,lr
thumb_func_end memcpy_16

thumb_func_start memset_16
memset_16:
1:  sub        r1,#0x2
    strh       r2,[r0,r1]
    bne        1b
    mov        pc,lr
thumb_func_end memset_16

thumb_func_start memset_32
memset_32:
1:  sub        r1,#0x4
    str        r2,[r0,r1]
    bne        1b
    mov        pc,lr
thumb_func_end memset_32

thumb_func_start memcpy_8
memcpy_8:
1:  sub        r2,#0x1
    ldrb       r3,[r0,r2]
    strb       r3,[r1,r2]
    bne        1b
    mov        pc,lr
thumb_func_end memcpy_8

non_word_aligned_thumb_func_start memset
memset:
1:  sub        r1,#0x1
    strb       r2,[r0,r1]
    bne        1b
    mov        pc,lr
thumb_func_end memset

thumb_func_start GetVcountPlusVal
GetVcountPlusVal:
    ldr        r0,PTR_REG_VCOUNT_08000c90
    ldrh       r0,[r0,#0x0]
    ldr        r1,PTR_DAT_08000c94
    ldr        r1,[r1,#0x0]
    add        r0,r0,r1
    mov        pc,lr
thumb_func_end GetVcountPlusVal

thumb_func_start memcpy_32
memcpy_32:
1:  sub        r2,#0x4
    ldr        r3,[r0,r2]
    str        r3,[r1,r2]
    bne        1b
    mov        pc,lr
thumb_func_end memcpy_32

non_word_aligned_thumb_func_start Divide
Divide:
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
thumb_func_end Divide

thumb_func_start ConvertNumToBCD
ConvertNumToBCD:
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
thumb_func_end ConvertNumToBCD

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

thumb_func_start GetWidthOfBcdNumber
GetWidthOfBcdNumber:
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
thumb_func_end GetWidthOfBcdNumber

@@ Shuffles a given array by randomly exchanging elements.
@@ In:
@@ r0: array
@@ r1: arraySz
@@ r2: shuffleCount
thumb_func_start ArrayShuffle
ArrayShuffle:
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
thumb_func_end ArrayShuffle

thumb_func_start GetRandomElementOfArray
GetRandomElementOfArray:
    push       { lr }
    add        r7,r0,#0x0
    push       { r1, r7 }
    bl         Rng_RandomInt
    pop        { r1, r7 }
    bl         SWI_Div
    ldrb       r0,[r7,r1]
    pop        { pc }
thumb_func_end GetRandomElementOfArray

thumb_func_start ArraySort
ArraySort:
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
thumb_func_end ArraySort

@@ Converts an input value which represents 1/60ths of a second to the same
@@ value in the format hh:MM:ss.ff
non_word_aligned_thumb_func_start FrameTimeToBcdRealTime
FrameTimeToBcdRealTime:
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
thumb_func_end FrameTimeToBcdRealTime

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
thumb_func_start IncrementGameTimer
IncrementGameTimer:
    LoadStateTo r7, Main_unk_78
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
thumb_func_end IncrementGameTimer

    .align 2, 0
    .pool

thumb_func_start FUN_08000c24
FUN_08000c24:
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
thumb_func_end FUN_08000c24

    .align 2, 0
    .pool

thumb_func_start FUN_08000c48
FUN_08000c48:
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
thumb_func_end FUN_08000c48

    .align 2, 0
    .pool

thumb_func_start FUN_08000c80
FUN_08000c80:
    push       { lr }
    mov        r7,r10
    ldr        r7,[r7,#0x78]
    mov        r0,#0x4
    strb       r0,[r7,#0x1]
    strb       r0,[r7,#0x3]
    pop        { pc }
thumb_func_end FUN_08000c80

    .align 2, 0
PTR_REG_VCOUNT_08000c90:    .word REG_VCOUNT
PTR_DAT_08000c94:           .word 0x02006334
DAT_08000c98:               .word 0x80000000

    .end
