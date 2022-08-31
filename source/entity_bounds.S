#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .text

    .thumb

thumb_func_start EntityBounds_InitList
EntityBounds_InitList:
    push       { lr }
    ldr        r0,=gEntityBoundsList
    mov        r1,#0x14
    bl         memset0_32
    ldr        r0,=gEntityBoundsListCount
    mov        r1,#0x0
    str        r1,[r0,#0x0]
    pop        { pc }
thumb_func_end EntityBounds_InitList

    .pool

thumb_func_start EntityBounds_AddToList
EntityBounds_AddToList:
    push       { lr }
    mov        r7,#0x80
    lsl        r7,r7,#0x8
    add        r0,r0,r7
    lsr        r0,r0,#0x10
    add        r1,r1,r7
    lsr        r1,r1,#0x10
    lsl        r1,r1,#0x10
    orr        r1,r0
    add        r2,r2,r7
    lsr        r2,r2,#0x10
    lsl        r3,r3,#0x10
    orr        r2,r3
    ldr        r7,=gEntityBoundsListCount
    ldr        r0,[r7,#0x0]
    cmp        r0,#0x20
    mov        r8,r8
    bmi        LAB_08002b62
    pop        { pc }
LAB_08002b62:
    mov        r7,#0x14
    mul        r7,r0
    ldr        r0,=gEntityBoundsList
    add        r7,r7,r0
    str        r1,[r7,#0x0]
    str        r2,[r7,#0x4]
    str        r4,[r7,#0x8]
    str        r5,[r7,#0xc]
    str        r6,[r7,#0x10]
    ldr        r7,=gEntityBoundsListCount
    ldr        r0,[r7,#0x0]
    add        r0,#0x1
    str        r0,[r7,#0x0]
    pop        { pc }
thumb_func_end EntityBounds_AddToList

    .pool

thumb_func_start EntityBounds_UpdateAll
EntityBounds_UpdateAll:
    push       { lr }
    mov        r0,#0x0
LAB_08002b8c:
    ldr        r2,=gEntityBoundsListCount
    ldr        r2,[r2,#0x0]
    sub        r2,#0x1
    cmp        r0,r2
    bmi        LAB_08002b9e
    mov        r0,#0x0
    ldr        r1,=gEntityBoundsListCount
    str        r0,[r1,#0x0]
    pop        { pc }
LAB_08002b9e:
    add        r1,r0,#0x1
    push       { r0 }
LAB_08002ba2:
    push       { r0, r1 }
    ldr        r5,=gEntityBoundsList
    mov        r6,#0x14
    mul        r0,r6
    add        r3,r5,r0
    mul        r1,r6
    add        r4,r5,r1
    add        r0,r3,#0x0
    add        r1,r4,#0x0
    push       { r3, r4 }
    bl         EntityBounds_IsCollision
    pop        { r3, r4 }
    tst        r0,r0
    beq        LAB_08002bdc
    ldr        r0,[r3,#0xc]
    ldr        r1,[r4,#0x8]
    and        r0,r1
    ldr        r7,[r3,#0x10]
    ldr        r1,[r7,#0x0]
    orr        r0,r1
    str        r0,[r7,#0x0]
    ldr        r0,[r3,#0x8]
    ldr        r1,[r4,#0xc]
    and        r0,r1
    ldr        r7,[r4,#0x10]
    ldr        r1,[r7,#0x0]
    orr        r0,r1
    str        r0,[r7,#0x0]
LAB_08002bdc:
    pop        { r0, r1 }
    add        r1,#0x1
    ldr        r2,=gEntityBoundsListCount
    ldr        r2,[r2,#0x0]
    cmp        r1,r2
    bmi        LAB_08002ba2
    pop        { r0 }
    add        r0,#0x1
    b          LAB_08002b8c
thumb_func_end EntityBounds_UpdateAll

    .pool

thumb_func_start EntityBounds_IsCollision
EntityBounds_IsCollision:
    push       { lr }
    mov        r6,#0x0
    ldrsh      r2,[r0,r6]
    ldrsh      r3,[r1,r6]
    sub        r2,r2,r3
    mov        r6,#0x2
    ldrsh      r3,[r0,r6]
    ldrsh      r4,[r1,r6]
    sub        r3,r3,r4
    add        r5,r2,#0x0
    mul        r2,r5
    add        r5,r3,#0x0
    mul        r3,r5
    add        r2,r2,r3
    ldrb       r3,[r0,#0x6]
    ldrb       r4,[r1,#0x6]
    add        r3,r3,r4
    add        r4,r3,#0x0
    mul        r3,r4
    cmp        r2,r3
    bmi        LAB_08002c26
    mov        r0,#0x0
    pop        { pc }
LAB_08002c26:
    mov        r6,#0x4
    ldrsh      r2,[r0,r6]
    ldrsh      r3,[r1,r6]
    cmp        r2,r3
    bmi        LAB_08002c3c
    ldrb       r4,[r1,#0x7]
    add        r3,r3,r4
    cmp        r2,r3
    ble        LAB_08002c48
    mov        r0,#0x0
    pop        { pc }
LAB_08002c3c:
    ldrb       r4,[r0,#0x7]
    add        r2,r2,r4
    cmp        r3,r2
    ble        LAB_08002c48
    mov        r0,#0x0
    pop        { pc }
LAB_08002c48:
    mov        r0,#0x1
    pop        { pc }
thumb_func_end EntityBounds_IsCollision

.end
