#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts FieldObstacleManager_Init
    push       {lr}
    mov        r0,r10
    ldr        r0,[r0,#0x7c]
    mov        r1,#0x28
    mov        r2,#0x0
    bl         memset_32
    pop        {pc}
    .word gFieldObstacleManager


_ts FieldObstacleManager_Add
    push       {lr}
    mov        r7,r10
    ldr        r7,[r7,#0x7c]
    mov        r0,#0x4
LAB_08056250:
    sub        r0,#0x1
    bmi        LAB_08056292
    ldrb       r1,[r7,r0]
    tst        r1,r1
    beq        LAB_08056274
    cmp        r1,#0x4
    bne        LAB_08056250
    lsl        r1,r0,#0x2
    add        r1,#0x8
    ldr        r6,[r7,r1]
    mov        r1,#0x1
    strb       r1,[r6,#0x5]
    mov        r1,#0x4
    ldrb       r2,[r6,#0x0]
    orr        r2,r1
    strb       r2,[r6,#0x0]
    mov        r1,#0x0
    strb       r1,[r7,r0]
LAB_08056274:
    strb       r0,[r5,#0x6]
    lsl        r1,r0,#0x2
    add        r1,#0x8
    str        r5,[r7,r1]
    mov        r3,#0x4
LAB_0805627e:
    sub        r3,#0x1
    bmi        LAB_08056292
    ldrb       r2,[r7,r3]
    cmp        r0,r3
    beq        LAB_0805628c
    tst        r2,r2
    beq        LAB_0805627e
LAB_0805628c:
    add        r2,#0x1
    strb       r2,[r7,r3]
    b          LAB_0805627e
LAB_08056292:
    pop        {pc}


_ts FieldObstacleManager_Remove
    push       {lr}
    mov        r7,r10
    ldr        r7,[r7,#0x7c]
    ldrb       r0,[r5,#0x6]
    ldrb       r1,[r7,r0]
    mov        r2,#0x0
    strb       r2,[r7,r0]
    lsl        r3,r0,#0x2
    add        r3,#0x8
    str        r2,[r7,r3]
    mov        r0,#0x4
LAB_080562aa:
    sub        r0,#0x1
    bmi        LAB_080562ba
    ldrb       r2,[r7,r0]
    cmp        r2,r1
    bmi        LAB_080562aa
    sub        r2,#0x1
    strb       r2,[r7,r0]
    b          LAB_080562aa
LAB_080562ba:
    pop        {pc}
