#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


@@ Fills a specified block of memory with the value 0 by writing 2 bytes at a
@@ time.
@@ In:
@@ r0: void* ptr - Pointer to the block of memory to fill.
@@ r1: int num - Number of bytes to be set to 0.
_ts memset0_16
    mov        r2,#0x0
1:  sub        r1,#0x2
    strh       r2,[r0,r1]
    bne        1b
    mov        pc,lr


@@ Fills a specified block of memory with the value 0 by writing 4 bytes at a
@@ time.
@@ In:
@@ r0: void* ptr - Pointer to the block of memory to fill.
@@ r1: int num - Number of bytes to be set to 0.
_ts memset0_32
    mov        r2,#0x0
1:  sub        r1,#0x4
    str        r2,[r0,r1]
    bne        1b
    mov        pc,lr


@@ Copies a number of bytes from one block of memory to another 2 bytes at a
@@ time.
@@ In:
@@ r0: void* src - Pointer to the source memory block.
@@ r1: void* dst - Pointer to the destination memory block.
@@ r2: int num - Number of bytes to copy.
_ts memcpy_16
1:  sub        r2,#0x2
    ldrh       r3,[r0,r2]
    strh       r3,[r1,r2]
    bne        1b
    mov        pc,lr


@@ Sets a number of bytes in a block of memory to the given value 2 bytes at
@@ a time.
@@ In:
@@ r0: void* ptr - Pointer to the memory block.
@@ r1: int num - The number of bytes to set.
@@ r2: short val - The value to set.
_ts memset_16
1:  sub        r1,#0x2
    strh       r2,[r0,r1]
    bne        1b
    mov        pc,lr


@@ Sets a number of bytes in a block of memory to the given value 4 bytes at
@@ a time.
@@ In:
@@ r0: void* ptr - Pointer to the memory block.
@@ r1: int num - The number of bytes to set.
@@ r2: int val - The value to set.
_ts memset_32
1:  sub        r1,#0x4
    str        r2,[r0,r1]
    bne        1b
    mov        pc,lr


@@ Copies a number of bytes from one block of memory to another 1 byte at a
@@ time.
@@ In:
@@ r0: void* src - Pointer to the source memory block.
@@ r1: void* dst - Pointer to the destination memory block.
@@ r2: int num - Number of bytes to copy.
_ts memcpy_8
1:  sub        r2,#0x1
    ldrb       r3,[r0,r2]
    strb       r3,[r1,r2]
    bne        1b
    mov        pc,lr


@@ Sets a number of bytes in a block of memory to the given value 1 byte at
@@ a time.
@@ In:
@@ r0: void* ptr - Pointer to the memory block.
@@ r1: int num - The number of bytes to set.
@@ r2: byte val - The value to set.
_nt memset_8
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


@@ Copies a number of bytes from one block of memory to another 4 bytes at a
@@ time.
@@ In:
@@ r0: void* src - Pointer to the source memory block.
@@ r1: void* dst - Pointer to the destination memory block.
@@ r2: int num - Number of bytes to copy.
_ts memcpy_32
1:  sub        r2,#0x4
    ldr        r3,[r0,r2]
    str        r3,[r1,r2]
    bne        1b
    mov        pc,lr


@@ Divides the dividend by the divisor.
@@ In:
@@ r0: int dividend - The number to be divided.
@@ r1: int divisor - The number to divide by.
@@ Out:
@@ r0: int quotient - The integer result of the dividend divided by the divisor.
@@ r1: int mod - The dividend modulo the divisor.
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


@@ Converts a number to its binary-coded decimal representation.
@@ In:
@@ r0: int num - The number to convert.
@@ r1: int bcd - The number in BCD format.
@@ Examples:
@@ - 10 -> 0x10
@@ - 19 -> 0x19
@@ - 64 -> 0x64
_ts ConvertNumToBCD
    ldr        r1,=99999999
    cmp        r0,r1
    bmi        LAB_08000ac6
    ldr        r0,=0x99999999
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

PTR_powersOf10_08000b08:
    .word powersOf10

    .pool


@@ Gets the horizontal width of a given BCD number in digits.
@@ In:
@@ r0: int bcd - The BCD number.
@@ Out:
@@ r0: int width - The width of the BCD number.
@@ Examples:
@@ 0x64 -> 2
@@ 0x100 -> 3
@@ 0x4092 -> 4
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
@@ r0: [in, out] void* array - The array to shuffle.
@@ r1: arraySz - The length of the array.
@@ r2: shuffleCount - The amount of times to shuffle the array.
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


@@ Picks a random element from a given array.
@@ In:
@@ r0: byte* array - The array to choose from.
@@ r1: int arraySz - The length of the array.
@@ Out:
@@ r0: byte val - A randomly chosen value from the array.
_ts GetRandomElementOfArray
    push       { lr }
    add        r7,r0,#0x0
    push       { r1, r7 }
    bl         Rng_RandomInt
    pop        { r1, r7 }
    bl         SWI_Div
    ldrb       r0,[r7,r1]
    pop        { pc }


@@ Sorts a given array in descending order.
@@ In:
@@ r0: [in, out] byte* array - The array to sort.
@@ r1: arraySz - The length of the array.
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
@@ In:
@@ r0: int frameTime - The frame time.
@@ Out:
@@ r0: int realTime - The frame time in hh:MM:ss.ff representing hours, 
@@ minutes, seconds, and frames (1/60 of a second).
_nt FrameTimeToBcdRealTime
    push       { lr }
    @ return early if a time greater than 100 hours is passed
    ldr        r1,=(100 * 60 * 60 * 60)
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


@@ Increments the game timer, capping it at 99 hours and 59 minutes.
_ts IncrementGameTimer
    LoadMain gameStats, r7, r7
    ldr        r0,[r7,#GameStats_gameTimer]
    add        r0,#0x1
    @ 99 hours and 50 minutes = 5999 minutes
    @ Multiply by 60 to get seconds, then by 60 again to get frames
    ldr        r1,=(5999 * 60 * 60)
    cmp        r0,r1
    ble        .setTime
    add        r0,r1,#0x0
.setTime:
    str        r0,[r7,#GameStats_gameTimer]
    mov        pc,lr

    .align 2, 0
    .pool


@@ Updates the game stats tracking multiplayer wins and total battles.
_ts IncrementMPCounters
    LoadMain gameStats, r7, r7
    ldr        r2,=999
    ldrh       r1,[r7,#GameStats_multiBattleWins]
    add        r1,r1,r0
    cmp        r1,r2
    ble        LAB_08000c34
    add        r1,r2,#0x0
LAB_08000c34:
    strh       r1,[r7,#GameStats_multiBattleWins]
    ldrh       r1,[r7,#GameStats_multiBattleTotal]
    add        r1,#0x1
    cmp        r1,r2
    ble        LAB_08000c40
    add        r1,r2,#0x0
LAB_08000c40:
    strh       r1,[r7,#GameStats_multiBattleTotal]
    mov        pc,lr

    .align 2, 0
    .pool


@@ Converts an input value which represents 1/60ths of a second to the same
@@ value in hours, minutes, seconds, and frames.
@@ In:
@@ r0: int frameTime - The frame time.
@@ Out:
@@ r1: int hours - the hours portion of the time.
@@ r2: int minutes - the minutes portion of the time.
@@ r3: int seconds - the seconds portion of the time.
@@ r4: int frames - the frames portion of the time.
_ts FrameTimeToRealTime_Reg
    push       { lr }
    sub        sp,#0x8
    @ hours
    ldr        r1,=(60 * 60 * 60)
    bl         SWI_Div
    str        r0,[sp,#0x0]
    add        r0,r1,#0x0
    @ minutes
    ldr        r1,=(60 * 60)
    bl         SWI_Div
    str        r0,[sp,#0x4]
    add        r0,r1,#0x0
    @ seconds
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


@@ Sets the default sort type for folders and sacks.
_ts SetSortDefault
    push       { lr }
    LoadMain gameStats, r7, r7
    mov        r0,#0x4
    strb       r0,[r7,#GameStats_sortDirectionFolder]
    strb       r0,[r7,#GameStats_sortDirectionSack]
    pop        { pc }

    .align 2, 0

PTR_REG_VCOUNT_08000c90:    .word REG_VCOUNT
PTR_DAT_08000c94:           .word 0x02006334
DAT_08000c98:               .word 0x80000000
