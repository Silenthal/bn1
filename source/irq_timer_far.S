#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_fts IRQ_TimerSerial
    push       {r4,r5,r6,r7,lr}
    mov        r7,r10
    mov        r6,r9
    mov        r5,r8
    push       {r5,r6,r7}
    sub        sp,#0x8
    ldr        r0,PTR_REG_SIODATA32_0300744c
    ldr        r1,[r0,#0x4]
    ldr        r0,[r0,#0x0]
    str        r0,[sp,#0x0]
    str        r1,[sp,#0x4]
    ldr        r2,PTR_Struct_UnkSio_03007450
    ldr        r3,PTR_REG_SIOCNT_03007454
    ldr        r0,[r3,#0x0]
    lsl        r0,r0,#0x19
    lsr        r0,r0,#0x1f
    strb       r0,[r2,#0x9]
    ldr        r1,[r2,#0x14]
    mov        r0,#0x1
    neg        r0,r0
    mov        r12,r2
    cmp        r1,r0
    bne        LAB_0300745c
    ldr        r0,INT_03007458
    strh       r0,[r3,#0x2]
    ldr        r1,[r2,#0x2c]
    ldr        r0,[r2,#0x28]
    str        r0,[r2,#0x2c]
    str        r1,[r2,#0x28]
    b          LAB_0300746c

PTR_REG_SIODATA32_0300744c:
    .word REG_SIODATA32

PTR_Struct_UnkSio_03007450:
    .word 0x3004920

PTR_REG_SIOCNT_03007454:
    .word REG_SIOCNT

INT_03007458:
    .word 0xFEFE
LAB_0300745c:
    cmp        r1,#0x0
    blt        LAB_0300746c
    mov        r2,r12
    ldr        r0,[r2,#0x2c]
    lsl        r1,r1,#0x1
    add        r1,r1,r0
    ldrh       r0,[r1,#0x0]
    strh       r0,[r3,#0x2]
LAB_0300746c:
    mov        r1,r12
    ldr        r0,[r1,#0x14]
    cmp        r0,#0xa
    bgt        LAB_03007478
    add        r0,#0x1
    str        r0,[r1,#0x14]
LAB_03007478:
    mov        r2,#0x0
    mov        r8,r2
    mov        r10,r12
    mov        r9,r2
    mov        r6,r12
    add        r6,#0x18
    mov        r5,sp
LAB_03007486:
    ldrh       r0,[r5,#0x0]
    mov        r1,r8
    lsl        r7,r1,#0x2
    ldr        r2,FEFE_Default
    cmp        r0,r2
    bne        LAB_030074b0
    ldr        r0,[r6,#0x0]
    cmp        r0,#0x9
    ble        LAB_030074b0
    mov        r0,#0x1
    neg        r0,r0
    str        r0,[r6,#0x0]
    mov        r0,r12
    add        r0,#0x4
    add        r0,r8
    mov        r1,#0x1
    strb       r1,[r0,#0x0]
    b          LAB_030074d4

    .align 2, 0


FEFE_Default:
    .word 0xFEFE
LAB_030074b0:
    mov        r0,r10
    add        r0,#0x30
    mov        r1,r9
    add        r4,r1,r0
    ldr        r2,[r6,#0x0]
    ldr        r3,[r4,#0x0]
    lsl        r0,r2,#0x1
    add        r0,r0,r3
    ldrh       r1,[r5,#0x0]
    strh       r1,[r0,#0x0]
    cmp        r2,#0x9
    bne        LAB_030074d4
    mov        r0,r12
    add        r0,#0x40
    add        r0,r7,r0
    ldr        r1,[r0,#0x0]
    str        r3,[r0,#0x0]
    str        r1,[r4,#0x0]
LAB_030074d4:
    ldr        r0,[r6,#0x0]
    cmp        r0,#0xa
    bgt        LAB_030074de
    add        r0,#0x1
    str        r0,[r6,#0x0]
LAB_030074de:
    mov        r2,#0x4
    add        r9,r2
    add        r6,#0x4
    add        r5,#0x2
    mov        r0,#0x1
    add        r8,r0
    mov        r1,r8
    cmp        r1,#0x3
    ble        LAB_03007486
    mov        r2,r12
    ldrb       r0,[r2,#0x0]
    cmp        r0,#0x8
    bne        LAB_03007502
    ldr        r0,PTR_REG_SIOCNT_03007514
    ldrh       r1,[r0,#0x0]
    mov        r2,#0x80
    orr        r1,r2
    strh       r1,[r0,#0x0]
LAB_03007502:
    add        sp,#0x8
    pop        {r3,r4,r5}
    mov        r8,r3
    mov        r9,r4
    mov        r10,r5
    pop        {r4,r5,r6,r7}
    pop        {r0}
    bx         r0

    .align 2, 0


PTR_REG_SIOCNT_03007514:
    .word REG_SIOCNT
