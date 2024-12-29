#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts FUN_03007738
    push       {lr}
    lsl        r3,r1,#0x3
    add        r3,r3,r0
    lsl        r2,r3,#0x4
    ldr        r7,DAT_03007784
    add        r7,r7,r2
    ldrb       r2,[r7,#0x0]
    lsl        r4,r2,#0x2
    ldr        r6,DAT_03007780
    ldr        r4,[r6,r4]
    orr        r2,r4
    ldrb       r4,[r7,#0x1]
    lsl        r4,r4,#0x5
    orr        r2,r4
    LoadMain battleUi, r6, r6
    lsl        r4,r1,#0x3
    add        r4,r4,r0
    lsl        r4,r4,#0x2
    ldr        r4,[r6,r4]
    tst        r4,r4
    beq        LAB_03007768
    mov        r4,#0x80
    orr        r2,r4
LAB_03007768:
    push       {r0,r1,r2}
    bl         FUN_030077b4
    add        r7,r0,#0x0
    pop        {r0,r1,r2}
    orr        r2,r7
    push       {r0,r1}
    bl         FUN_030078c8
    pop        {r0,r1}
    pop        {pc}

    .align 2, 0


DAT_03007780:
    .word 0x3007688

DAT_03007784:
    .word 0x200E3D0
    .word 0x8000
    .word 0x4000
    .word 0x10
    .word 0x50
    .word 0x110
    .word 0x210
    .word 0x410
    .word 0x810
    .word 0x1010
    .word 0x2010
    .word 0x8007601


_ts FUN_030077b4
    push       {lr}
    lsl        r1,r1,#0xa
    lsl        r0,r0,#0x7
    ldr        r6,PTR_gSpriteDecompLocation1_030077e0
    add        r6,r6,r0
    add        r6,r6,r1
    sub        r6,#0x4
    mov        r1,#0x20
    ldr        r4,DAT_030077dc
    mov        r0,#0x0
LAB_030077c8:
    add        r6,#0x4
    ldr        r7,[r6,#0x0]
    tst        r7,r7
    beq        LAB_030077d8
    ldr        r3,[r7,#0x2c]
    orr        r0,r3
    sub        r1,#0x1
    bne        LAB_030077c8
LAB_030077d8:
    and        r0,r4
    pop        {pc}

DAT_030077dc:
    .word 0xFFC00000

PTR_gSpriteDecompLocation1_030077e0:
    .word gSpriteDecompLocation1


_ts FUN_030077e4
    push       {lr}
    push       {r0,r1,r2}
    bl         FUN_03007858
    pop        {r0,r1,r2}
    push       {r0,r1,r2}
    ldr        r2,[r2,#0x2c]
    ldr        r3,DAT_03007814
    and        r2,r3
    bl         FUN_030078e8
    pop        {r0,r1,r2}
    lsl        r1,r1,#0xa
    lsl        r0,r0,#0x7
    add        r0,r0,r1
    ldr        r6,DAT_03007854
    sub        r0,#0x4
LAB_03007806:
    add        r0,#0x4
    ldr        r7,[r6,r0]
    tst        r7,r7
    bne        LAB_03007806
    str        r2,[r6,r0]
    pop        {pc}

    .align 2, 0


DAT_03007814:
    .word 0xFFC00000


_ts FUN_03007818
    push       {lr}
    lsl        r1,r1,#0xa
    lsl        r0,r0,#0x7
    add        r0,r0,r1
    ldr        r6,DAT_03007854
    sub        r0,#0x4
    add        r6,r6,r0
    mov        r1,#0x21
LAB_03007828:
    sub        r1,#0x1
    beq        LAB_0300784e
    add        r6,#0x4
    ldr        r7,[r6,#0x0]
    tst        r7,r7
    beq        LAB_0300784e
    cmp        r7,r2
    bne        LAB_03007828
LAB_03007838:
    sub        r1,#0x1
    beq        LAB_03007846
    ldr        r0,[r6,#0x4]
    str        r0,[r6,#0x0]
    add        r6,#0x4
    tst        r0,r0
    bne        LAB_03007838
LAB_03007846:
    mov        r0,#0x0
    str        r0,[r6,#0x0]
    mov        r0,#0x1
    pop        {pc}
LAB_0300784e:
    mov        r0,#0x0
    pop        {pc}

    .align 2, 0


DAT_03007854:
    .word 0x2016000


_ts FUN_03007858
    push       {lr}
    ldr        r3,[r2,#0x2c]
    ldr        r4,DAT_030078c0
    tst        r3,r4
    beq        LAB_030078ba
    ldrb       r3,[r2,#0x2]
    cmp        r3,#0x2
    bne        LAB_03007896
    push       {r0,r1,r2}
    bl         FUN_030078d8
    add        r3,r0,#0x0
    pop        {r0,r1,r2}
    mov        r4,#0x4
    lsl        r4,r4,#0x8
    tst        r3,r4
    beq        LAB_030078ba
    push       {r0,r1,r2}
    mov        r2,#0x2
    ldr        r7,DAT_030078c4
    mov        lr,pc
    bx         r7
    pop        {r0,r1,r2}
    ldr        r7,DAT_030078bc
    mov        r6,#0x11
    lsl        r4,r1,#0x3
    add        r4,r4,r0
    ldrb       r3,[r7,r4]
    orr        r3,r6
    strb       r3,[r7,r4]
    b          LAB_030078ba
LAB_03007896:
    cmp        r3,#0x1
    bne        LAB_030078ba
    push       {r0,r1,r2}
    bl         FUN_030078d8
    add        r3,r0,#0x0
    pop        {r0,r1,r2}
    mov        r4,#0x8
    lsl        r4,r4,#0x8
    tst        r3,r4
    beq        LAB_030078ba
    ldr        r7,DAT_030078bc
    mov        r6,#0x22
    lsl        r4,r1,#0x3
    add        r4,r4,r0
    ldrb       r3,[r7,r4]
    orr        r3,r6
    strb       r3,[r7,r4]
LAB_030078ba:
    pop        {pc}

DAT_030078bc:
    .word 0x2005AA0

DAT_030078c0:
    .word 0xC0000000

DAT_030078c4:
    .word 0x80077A9


_ts FUN_030078c8
    push       {lr}
    lsl        r1,r1,#0x3
    add        r1,r1,r0
    lsl        r0,r1,#0x4
    ldr        r1,PTR_DAT_030078fc
    add        r0,r0,r1
    str        r2,[r0,#0x4]
    pop        {pc}


_ts FUN_030078d8
    push       {r2,r3,lr}
    lsl        r1,r1,#0x3
    add        r1,r1,r0
    lsl        r0,r1,#0x4
    ldr        r1,PTR_DAT_030078fc
    add        r0,r0,r1
    ldr        r0,[r0,#0x4]
    pop        {r2,r3,pc}


_ts FUN_030078e8
    push       {lr}
    lsl        r1,r1,#0x3
    add        r1,r1,r0
    lsl        r0,r1,#0x4
    ldr        r1,PTR_DAT_030078fc
    add        r0,r0,r1
    ldr        r1,[r0,#0x4]
    orr        r1,r2
    str        r1,[r0,#0x4]
    pop        {pc}

PTR_DAT_030078fc:
    .word 0x200E3D0


_ts FUN_03007900
    push       {lr}
    ldr        r0,[r7,#0x30]
    ldr        r1,[r6,#0x2c]
    ldrb       r2,[r6,#0x5]
    ldrb       r3,[r7,#0x5]
    bl         FUN_0300796c
    bl         FUN_03007994
    LoadMain battle, r2, r2
    ldrb       r2,[r2,#0x16]
    tst        r2,r2
    beq        LAB_03007928
    mov        r2,#0x80
    lsl        r2,r2,#0x8
    tst        r0,r2
    bne        LAB_03007928
    tst        r1,r2
    beq        LAB_03007966
LAB_03007928:
    bic        r0,r2
    bic        r1,r2
    ldr        r2,DAT_03007968
    add        r3,r2,#0x0
    and        r2,r0
    and        r3,r1
    tst        r2,r3
    beq        LAB_03007966
    and        r0,r1
    ldrh       r2,[r6,#0x10]
    ldrb       r3,[r6,#0x2]
    ldr        r1,[r7,#0x24]
    orr        r1,r0
    str        r1,[r7,#0x24]
    ldrb       r1,[r7,#0x5]
    mov        r4,#0x4
    tst        r1,r4
    beq        LAB_03007952
    mov        r1,#0x40
    tst        r0,r1
    beq        LAB_03007966
LAB_03007952:
    lsl        r0,r3,#0x1
    add        r0,#0x14
    ldrh       r4,[r7,r0]
    add        r4,r4,r2
    strh       r4,[r7,r0]
    ldrb       r0,[r7,#0xb]
    ldrb       r1,[r6,#0xa]
    cmp        r0,r1
    bcs        LAB_03007966
    strb       r1,[r7,#0xb]
LAB_03007966:
    pop        {pc}

DAT_03007968:
    .word 0xFE000000


_ts FUN_0300796c
    mov        r4,#0x3
    tst        r2,r4
    beq        LAB_0300797c
    ldr        r4,DAT_03007990
    tst        r0,r4
    bne        LAB_0300797c
    mov        r1,#0x0
    mov        pc,lr
LAB_0300797c:
    mov        r4,#0x3
    tst        r3,r4
    beq        LAB_0300798c
    ldr        r4,DAT_03007990
    tst        r1,r4
    bne        LAB_0300798c
    mov        r0,#0x0
    mov        pc,lr
LAB_0300798c:
    mov        pc,lr

    .align 2, 0


DAT_03007990:
    .word 0x10000


_ts FUN_03007994
    mov        r4,#0x80
    tst        r2,r4
    beq        LAB_030079a4
    ldr        r4,DAT_030079b8
    tst        r0,r4
    bne        LAB_030079a4
    mov        r1,#0x0
    mov        pc,lr
LAB_030079a4:
    mov        r4,#0x80
    tst        r3,r4
    beq        LAB_030079b4
    ldr        r4,DAT_030079b8
    tst        r1,r4
    bne        LAB_030079b4
    mov        r0,#0x0
    mov        pc,lr
LAB_030079b4:
    mov        pc,lr

    .align 2, 0


DAT_030079b8:
    .word 0x1000


_ts FUN_030079bc
    push       {lr}
    mov        r1,#0x3
LAB_030079c0:
    mov        r0,#0x6
LAB_030079c2:
    push       {r0,r1,r7}
    bl         FUN_030078d8
    add        r4,r0,#0x0
    pop        {r0,r1,r7}
    beq        LAB_030079e2
    tst        r4,r3
    bne        LAB_030079e2
    and        r4,r2
    cmp        r4,r2
    bne        LAB_030079e2
    push       {r0,r1,r2,r3,r7}
    add        r2,r7,#0x0
    bl         FUN_030077e4
    pop        {r0,r1,r2,r3,r7}
LAB_030079e2:
    sub        r0,#0x1
    bne        LAB_030079c2
    sub        r1,#0x1
    bne        LAB_030079c0
    pop        {pc}


_ts FUN_030079ec
    push       {r4,r5,r6,r7,lr}
    mov        r7,r10
    mov        r6,r9
    mov        r5,r8
    push       {r5,r6,r7}
    sub        sp,#0x8
    ldr        r0,DAT_03007a24
    ldr        r1,[r0,#0x4]
    ldr        r0,[r0,#0x0]
    str        r0,[sp,#0x0]
    str        r1,[sp,#0x4]
    ldr        r1,DAT_03007a28
    ldr        r3,[r1,#0x14]
    mov        r0,#0x1
    neg        r0,r0
    mov        r12,r1
    cmp        r3,r0
    bne        LAB_03007a34
    ldr        r0,DAT_03007a2c
    ldr        r1,DAT_03007a30
    strh       r1,[r0,#0x2]
    mov        r0,r12
    ldr        r1,[r0,#0x2c]
    ldr        r0,[r0,#0x28]
    mov        r2,r12
    str        r0,[r2,#0x2c]
    str        r1,[r2,#0x28]
    b          LAB_03007a46

DAT_03007a24:
    .word 0x4000120

DAT_03007a28:
    .word 0x3004920

DAT_03007a2c:
    .word 0x4000128

DAT_03007a30:
    .word 0xFEFE
LAB_03007a34:
    cmp        r3,#0x0
    blt        LAB_03007a46
    ldr        r2,DAT_03007a84
    mov        r0,r12
    ldr        r1,[r0,#0x2c]
    lsl        r0,r3,#0x1
    add        r0,r0,r1
    ldrh       r0,[r0,#0x0]
    strh       r0,[r2,#0x2]
LAB_03007a46:
    mov        r1,r12
    ldr        r0,[r1,#0x14]
    cmp        r0,#0xa
    bgt        LAB_03007a52
    add        r0,#0x1
    str        r0,[r1,#0x14]
LAB_03007a52:
    mov        r2,#0x0
    mov        r8,r2
    mov        r10,r12
    mov        r9,r2
    mov        r6,r12
    add        r6,#0x18
    mov        r5,sp
LAB_03007a60:
    ldrh       r0,[r5,#0x0]
    mov        r1,r8
    lsl        r7,r1,#0x2
    ldr        r2,DAT_03007a88
    cmp        r0,r2
    bne        LAB_03007a8c
    ldr        r0,[r6,#0x0]
    cmp        r0,#0x9
    ble        LAB_03007a8c
    mov        r0,#0x1
    neg        r0,r0
    str        r0,[r6,#0x0]
    mov        r0,r12
    add        r0,#0x4
    add        r0,r8
    mov        r1,#0x1
    strb       r1,[r0,#0x0]
    b          LAB_03007ab0

DAT_03007a84:
    .word 0x4000128

DAT_03007a88:
    .word 0xFEFE
LAB_03007a8c:
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
    bne        LAB_03007ab0
    mov        r0,r12
    add        r0,#0x40
    add        r0,r7,r0
    ldr        r1,[r0,#0x0]
    str        r3,[r0,#0x0]
    str        r1,[r4,#0x0]
LAB_03007ab0:
    ldr        r0,[r6,#0x0]
    cmp        r0,#0xa
    bgt        LAB_03007aba
    add        r0,#0x1
    str        r0,[r6,#0x0]
LAB_03007aba:
    mov        r2,#0x4
    add        r9,r2
    add        r6,#0x4
    add        r5,#0x2
    mov        r0,#0x1
    add        r8,r0
    mov        r1,r8
    cmp        r1,#0x3
    ble        LAB_03007a60
    mov        r2,r12
    ldrb       r0,[r2,#0x0]
    cmp        r0,#0x8
    bne        LAB_03007ade
    ldr        r0,DAT_03007af0
    ldrh       r1,[r0,#0x0]
    mov        r2,#0x80
    orr        r1,r2
    strh       r1,[r0,#0x0]
LAB_03007ade:
    add        sp,#0x8
    pop        {r3,r4,r5}
    mov        r8,r3
    mov        r9,r4
    mov        r10,r5
    pop        {r4,r5,r6,r7}
    pop        {r0}
    bx         r0

    .align 2, 0


DAT_03007af0:
    .word 0x4000128


_ts FUN_03007af4
    push       {r5,lr}
    LoadMain gameStats, r7, r7
    ldrb       r7,[r7,#0x6]
    mov        r6,#0x1e
    mul        r7,r6
    mov        r12,r7
    ldr        r6,DAT_03007c14
    mov        r0,#0x0
    mov        r1,#0x0
LAB_03007b08:
    mov        r2,#0x0
    mov        r8,r2
LAB_03007b0c:
    ldrb       r3,[r6,#0x0]
    tst        r3,r3
    beq        LAB_03007b92
    ldr        r5,DAT_03007c18
    mov        r2,#0x0
LAB_03007b16:
    ldrh       r4,[r5,#0x0]
    cmp        r0,r4
    bne        LAB_03007b3a
    push       {r0}
    push       {r1,r2,r5}
    ldr        r7,DAT_03007c1c
    mov        lr,pc
    bx         r7
    pop        {r1,r2,r5}
    mov        r4,#0x0
    add        r4,r8
    ldrb       r4,[r0,r4]
    ldrb       r0,[r5,#0x2]
    cmp        r0,r4
    pop        {r0}
    bne        LAB_03007b3a
    sub        r3,#0x1
    ble        LAB_03007b92
LAB_03007b3a:
    add        r5,#0x4
    add        r2,#0x1
    cmp        r2,r12
    blt        LAB_03007b16
    push       {r3}
    mov        r2,r8
    sub        r3,r6,r2
    lsl        r2,r2,#0x1
    add        r2,#0x6
    ldrh       r3,[r3,r2]
    push       {r3}
    mov        r5,#0x0
    ldr        r7,DAT_03007c20
    mov        r9,r7
LAB_03007b56:
    cmp        r5,r1
    beq        LAB_03007b82
    ldrh       r2,[r7,#0x4]
    cmp        r2,r3
    bgt        LAB_03007b66
    add        r7,#0x8
    add        r5,#0x1
    b          LAB_03007b56
LAB_03007b66:
    mov        r2,r9
    mov        r9,r5
    add        r5,r1,#0x0
    sub        r5,#0x1
    lsl        r3,r5,#0x3
    add        r2,r2,r3
LAB_03007b72:
    ldr        r3,[r2,#0x0]
    str        r3,[r2,#0x8]
    ldr        r3,[r2,#0x4]
    str        r3,[r2,#0xc]
    sub        r2,#0x8
    sub        r5,#0x1
    cmp        r5,r9
    bge        LAB_03007b72
LAB_03007b82:
    pop        {r2}
    pop        {r3}
    strh       r0,[r7,#0x0]
    mov        r4,r8
    strh       r4,[r7,#0x2]
    strh       r3,[r7,#0x6]
    strh       r2,[r7,#0x4]
    add        r1,#0x1
LAB_03007b92:
    add        r6,#0x1
    mov        r2,r8
    add        r2,#0x1
    mov        r8,r2
    cmp        r2,#0x6
    blt        LAB_03007b0c
    push       {r5}
    ldr        r5,DAT_03007c28
    add        r6,#0xc
    add        r0,#0x1
    cmp        r0,r5
    pop        {r5}
    ble        LAB_03007b08
    ldr        r6,DAT_03007c20
    ldr        r7,DAT_03007c24
    push       {r1}
LAB_03007bb2:
    cmp        r1,#0x0
    ble        LAB_03007c10
    push       {r1}
    ldrh       r0,[r6,#0x0]
    push       {r0,r6,r7}
    ldr        r7,DAT_03007c1c
    mov        lr,pc
    bx         r7
    pop        {r4,r6,r7}
    str        r4,[r7,#0x1c]
    ldrh       r4,[r0,#0xe]
    lsl        r2,r4,#0x7
    ldrh       r3,[r6,#0x2]
    add        r3,#0x0
    ldrb       r3,[r0,r3]
    orr        r2,r3
    lsl        r3,r3,#0x10
    orr        r3,r2
    str        r3,[r7,#0x8]
    lsl        r3,r4,#0x10
    orr        r3,r2
    str        r3,[r7,#0x0]
    ldrh       r3,[r6,#0x6]
    lsl        r3,r3,#0x10
    orr        r3,r2
    str        r3,[r7,#0x14]
    ldrh       r3,[r0,#0xc]
    lsl        r3,r3,#0x10
    orr        r3,r2
    str        r3,[r7,#0xc]
    ldrb       r3,[r0,#0x6]
    lsl        r3,r3,#0x10
    orr        r3,r2
    str        r3,[r7,#0x10]
    ldrh       r3,[r0,#0x10]
    lsl        r3,r3,#0x10
    orr        r3,r2
    str        r3,[r7,#0x4]
    ldrb       r3,[r0,#0xa]
    lsl        r3,r3,#0x10
    orr        r3,r2
    str        r3,[r7,#0x18]
    pop        {r1}
    add        r6,#0x8
    add        r7,#0x20
    sub        r1,#0x1
    b          LAB_03007bb2
LAB_03007c10:
    pop        {r0}
    pop        {r5,pc}

DAT_03007c14:
    .word 0x20006C0

DAT_03007c18:
    .word 0x2000180

DAT_03007c1c:
    .word 0x800C1B9

DAT_03007c20:
    .word 0x2024000

DAT_03007c24:
    .word 0x2019000

DAT_03007c28:
    .word 0x108
