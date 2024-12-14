#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


global_label listDefaultSort
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x04
    .byte 0x00
    .byte 0x04

    .align 2, 0



_ts SortSack
    mov        r7,r10
    push       {r7,lr}
    sub        sp,#0x24
    mov        r10,r0
    mov        r8,r1
    mov        r9,r2
    mov        r5,#0x1
    cmp        r5,r8
    bgt        LAB_03007348
LAB_030072ca:
    lsl        r0,r5,#0x1
    add        r0,r0,r5
    add        r5,r0,#0x1
    cmp        r5,r8
    ble        LAB_030072ca
    b          LAB_03007348
LAB_030072d6:
    add        r2,r0,#0x0
    cmp        r2,r8
    bge        LAB_03007348
LAB_030072dc:
    lsl        r1,r2,#0x5
    mov        r0,sp
    add        r1,r10
    ldmia      r1!,{r3,r4,r6}
    stmia      r0!,{r3,r4,r6}
    ldmia      r1!,{r3,r4,r7}
    stmia      r0!,{r3,r4,r7}
    ldmia      r1!,{r6,r7}
    stmia      r0!,{r6,r7}
    sub        r3,r2,r5
    add        r2,#0x1
    mov        r12,r2
    cmp        r3,#0x0
    blt        LAB_0300732e
    mov        r0,r9
    lsl        r4,r0,#0x2
    mov        r1,sp
    add        r0,r4,r1
    ldr        r0,[r0,#0x0]
    str        r0,[sp,#0x20]
LAB_03007304:
    lsl        r0,r3,#0x5
    mov        r6,r10
    add        r2,r0,r6
    add        r0,r4,r2
    ldr        r0,[r0,#0x0]
    ldr        r7,[sp,#0x20]
    cmp        r0,r7
    ble        LAB_0300732e
    add        r1,r3,r5
    lsl        r1,r1,#0x5
    add        r1,r10
    add        r0,r2,#0x0
    ldmia      r0!,{r2,r6,r7}
    stmia      r1!,{r2,r6,r7}
    ldmia      r0!,{r2,r6,r7}
    stmia      r1!,{r2,r6,r7}
    ldmia      r0!,{r2,r6}
    stmia      r1!,{r2,r6}
    sub        r3,r3,r5
    cmp        r3,#0x0
    bge        LAB_03007304
LAB_0300732e:
    add        r1,r3,r5
    lsl        r1,r1,#0x5
    add        r1,r10
    mov        r0,sp
    ldmia      r0!,{r2,r3,r7}
    stmia      r1!,{r2,r3,r7}
    ldmia      r0!,{r4,r6,r7}
    stmia      r1!,{r4,r6,r7}
    ldmia      r0!,{r2,r3}
    stmia      r1!,{r2,r3}
    mov        r2,r12
    cmp        r2,r8
    blt        LAB_030072dc
LAB_03007348:
    add        r0,r5,#0x0
    mov        r1,#0x3
    ldr        r5,PTR_div_03007408
    mov        lr,pc
    bx         r5
    add        r5,r0,#0x0
    cmp        r0,#0x0
    bgt        LAB_030072d6
    add        sp,#0x24
    pop        {r0,r7}
    mov        r10,r0
    mov        pc,r7


_ts SortSackReverse
    mov        r7,r10
    push       {r7,lr}
    sub        sp,#0x24
    mov        r10,r0
    mov        r8,r1
    mov        r9,r2
    mov        r5,#0x1
    cmp        r5,r8
    bgt        LAB_030073f0
LAB_03007372:
    lsl        r0,r5,#0x1
    add        r0,r0,r5
    add        r5,r0,#0x1
    cmp        r5,r8
    ble        LAB_03007372
    b          LAB_030073f0
LAB_0300737e:
    add        r2,r0,#0x0
    cmp        r2,r8
    bge        LAB_030073f0
LAB_03007384:
    lsl        r1,r2,#0x5
    mov        r0,sp
    add        r1,r10
    ldmia      r1!,{r3,r4,r6}
    stmia      r0!,{r3,r4,r6}
    ldmia      r1!,{r3,r4,r7}
    stmia      r0!,{r3,r4,r7}
    ldmia      r1!,{r6,r7}
    stmia      r0!,{r6,r7}
    sub        r3,r2,r5
    add        r2,#0x1
    mov        r12,r2
    cmp        r3,#0x0
    blt        LAB_030073d6
    mov        r0,r9
    lsl        r4,r0,#0x2
    mov        r1,sp
    add        r0,r4,r1
    ldr        r0,[r0,#0x0]
    str        r0,[sp,#0x20]
LAB_030073ac:
    lsl        r0,r3,#0x5
    mov        r6,r10
    add        r2,r0,r6
    add        r0,r4,r2
    ldr        r0,[r0,#0x0]
    ldr        r7,[sp,#0x20]
    cmp        r0,r7
    bge        LAB_030073d6
    add        r1,r3,r5
    lsl        r1,r1,#0x5
    add        r1,r10
    add        r0,r2,#0x0
    ldmia      r0!,{r2,r6,r7}
    stmia      r1!,{r2,r6,r7}
    ldmia      r0!,{r2,r6,r7}
    stmia      r1!,{r2,r6,r7}
    ldmia      r0!,{r2,r6}
    stmia      r1!,{r2,r6}
    sub        r3,r3,r5
    cmp        r3,#0x0
    bge        LAB_030073ac
LAB_030073d6:
    add        r1,r3,r5
    lsl        r1,r1,#0x5
    add        r1,r10
    mov        r0,sp
    ldmia      r0!,{r2,r3,r7}
    stmia      r1!,{r2,r3,r7}
    ldmia      r0!,{r4,r6,r7}
    stmia      r1!,{r4,r6,r7}
    ldmia      r0!,{r2,r3}
    stmia      r1!,{r2,r3}
    mov        r2,r12
    cmp        r2,r8
    blt        LAB_03007384
LAB_030073f0:
    add        r0,r5,#0x0
    mov        r1,#0x3
    ldr        r5,PTR_div_0300740c
    mov        lr,pc
    bx         r5
    add        r5,r0,#0x0
    cmp        r0,#0x0
    bgt        LAB_0300737e
    add        sp,#0x24
    pop        {r0,r7}
    mov        r10,r0
    mov        pc,r7

PTR_div_03007408:
    .word div

PTR_div_0300740c:
    .word div
