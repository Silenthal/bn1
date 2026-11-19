    .include "constants.inc"
    .include "macros.inc"

    .text

    .thumb


_ts __divsi3
    cmp        r1,#0x0
    beq        LAB_0809e1c0
    push       {r4}
    add        r4,r0,#0x0
    eor        r4,r1
    mov        r12,r4
    mov        r3,#0x1
    mov        r2,#0x0
    cmp        r1,#0x0
    bpl        LAB_0809e14e
    neg        r1,r1
LAB_0809e14e:
    cmp        r0,#0x0
    bpl        LAB_0809e154
    neg        r0,r0
LAB_0809e154:
    cmp        r0,r1
    bcc        LAB_0809e1b2
    mov        r4,#0x1
    lsl        r4,r4,#0x1c
LAB_0809e15c:
    cmp        r1,r4
    bcs        LAB_0809e16a
    cmp        r1,r0
    bcs        LAB_0809e16a
    lsl        r1,r1,#0x4
    lsl        r3,r3,#0x4
    b          LAB_0809e15c
LAB_0809e16a:
    lsl        r4,r4,#0x3
LAB_0809e16c:
    cmp        r1,r4
    bcs        LAB_0809e17a
    cmp        r1,r0
    bcs        LAB_0809e17a
    lsl        r1,r1,#0x1
    lsl        r3,r3,#0x1
    b          LAB_0809e16c
LAB_0809e17a:
    cmp        r0,r1
    bcc        LAB_0809e182
    sub        r0,r0,r1
    orr        r2,r3
LAB_0809e182:
    lsr        r4,r1,#0x1
    cmp        r0,r4
    bcc        LAB_0809e18e
    sub        r0,r0,r4
    lsr        r4,r3,#0x1
    orr        r2,r4
LAB_0809e18e:
    lsr        r4,r1,#0x2
    cmp        r0,r4
    bcc        LAB_0809e19a
    sub        r0,r0,r4
    lsr        r4,r3,#0x2
    orr        r2,r4
LAB_0809e19a:
    lsr        r4,r1,#0x3
    cmp        r0,r4
    bcc        LAB_0809e1a6
    sub        r0,r0,r4
    lsr        r4,r3,#0x3
    orr        r2,r4
LAB_0809e1a6:
    cmp        r0,#0x0
    beq        LAB_0809e1b2
    lsr        r3,r3,#0x4
    beq        LAB_0809e1b2
    lsr        r1,r1,#0x4
    b          LAB_0809e17a
LAB_0809e1b2:
    add        r0,r2,#0x0
    mov        r4,r12
    cmp        r4,#0x0
    bpl        LAB_0809e1bc
    neg        r0,r0
LAB_0809e1bc:
    pop        {r4}
    mov        pc,lr
LAB_0809e1c0:
    push       {lr}
    bl         __div0
    mov        r0,#0x0
    pop        {pc}

_ts __div0
    mov        pc,lr

    .align 2,0
    .end
