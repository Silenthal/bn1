#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

_ts FUN_08003cb0
    push       {lr}
    ldr        r0,PTR_DAT_08003fcc
    ldr        r1,DAT_08003fd0
    bl         memset0_32
    ldr        r0,PTR_DAT_08003fd4
    ldr        r1,PTR_DAT_08003fd8
    str        r1,[r0,#0x0]
    pop        {pc}


_ts PrintDebugString
    push       {lr}
    pop        {pc}


_ts FUN_08003cc8
    push       {r1,r2,r3,r4,r5,r6,r7}
    ldr        r5,PTR_DAT_08003fdc
    mov        r6,#0x1c
    mov        r1,#0x0
    mov        r8,r1
    ldr        r1,PTR_DAT_08003fe0
    ldr        r1,[r1,#0x0]
    cmp        r1,r5
    bge        LAB_08003d5e
    ldrb       r2,[r0,#0x0]
    strb       r2,[r1,#0x0]
    add        r0,#0x1
    add        r1,#0x1
    ldrb       r2,[r0,#0x0]
    strb       r2,[r1,#0x0]
    add        r0,#0x1
    add        r1,#0x1
LAB_08003cea:
    ldrb       r2,[r0,#0x0]
    mov        r3,#0x0
    cmp        r2,r3
    beq        LAB_08003d54
    mov        r3,#0xa
    cmp        r2,r3
    bne        LAB_08003d00
    mov        r3,#0xfe
    strh       r3,[r1,#0x0]
    add        r1,#0x2
    b          LAB_08003d50
LAB_08003d00:
    mov        r3,#0x20
    cmp        r2,r3
    blt        LAB_08003d50
    mov        r3,#0x60
    cmp        r2,r3
    bge        LAB_08003d50
    cmp        r1,r5
    bge        LAB_08003d54
    mov        r3,#0x25
    cmp        r2,r3
    bne        LAB_08003d4a
    mov        r3,#0x0
    mov        r8,r3
LAB_08003d1a:
    add        r0,#0x1
    ldrb       r2,[r0,#0x0]
    ldr        r3,PTR_DAT_08003fe4
LAB_08003d20:
    ldrb       r4,[r3,#0x0]

    cmp        r4,#0x0
    beq        LAB_08003d50
    cmp        r2,r4
    beq        LAB_08003d2e
    add        r3,#0x1
    b          LAB_08003d20
LAB_08003d2e:
    ldr        r4,PTR_DAT_08003fe8
    sub        r3,r3,r4
    lsl        r3,r3,#0x2
    ldr        r4,PTR_PTR_FUN_08003dc8_1_08003fec
    add        r4,r4,r3
    ldr        r4,[r4,#0x0]
    lsr        r3,r3,#0x2
    pop        {r2}
    mov        lr,pc
    bx         r4
    sub        r6,#0x4
    cmp        r4,#0x0
    beq        LAB_08003d1a
    b          LAB_08003d50
LAB_08003d4a:
    sub        r2,#0x20
    strh       r2,[r1,#0x0]
    add        r1,#0x2
LAB_08003d50:
    add        r0,#0x1
    b          LAB_08003cea
LAB_08003d54:
    mov        r2,#0xff
    strh       r2,[r1,#0x0]
    add        r1,#0x2
    ldr        r0,PTR_DAT_08003ff0

    str        r1,[r0,#0x0]
LAB_08003d5e:
    mov        r1,sp
    add        r1,r1,r6
    mov        sp,r1
    pop        {pc}

    .align 2, 0
PTR_formatString:
.asciz "DdXxSs%0123456789Bb"

PTR_FUN_08003dc8_1_08003d7c:
    .word FUN_08003dc8
    .word FUN_08003dc8
    .word FUN_08003e18
    .word FUN_08003e18
    .word FUN_08003ec0
    .word FUN_08003ec0
    .word FUN_08003f0c
    .word FUN_08003ef0
    .word FUN_08003ef0
    .word FUN_08003ef0
    .word FUN_08003ef0
    .word FUN_08003ef0
    .word FUN_08003ef0
    .word FUN_08003ef0
    .word FUN_08003ef0
    .word FUN_08003ef0
    .word FUN_08003ef0
    .word FUN_08003f64
    .word FUN_08003f64


_ts FUN_08003dc8
    push       {r0,r5,r6,r7,lr}
    cmp        r2,#0x0
    bge        LAB_08003de2
    cmp        r1,r5
    bge        LAB_08003dea
    push       {r3}
    mov        r3,#0xd
    strh       r3,[r1,#0x0]
    add        r1,#0x2
    ldr        r3,DAT_08003ff4
    eor        r2,r3
    add        r2,#0x1
    pop        {r3}
LAB_08003de2:
    ldr        r0,PTR_DAT_08003ff8
    mov        r6,#0xa
    bl         FUN_08003e48
LAB_08003dea:
    mov        r4,#0x1
    pop        {r0,r5,r6,r7,pc}

    .align 2, 0
DAT_08003df0:
    .byte 0x00, 0xCA, 0x9A, 0x3B, 0x00, 0xE1, 0xF5, 0x05
    .byte 0x80, 0x96, 0x98, 0x00, 0x40, 0x42, 0x0F, 0x00
    .byte 0xA0, 0x86, 0x01, 0x00, 0x10, 0x27, 0x00, 0x00
    .byte 0xE8, 0x03, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00
    .byte 0x0A, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00


_ts FUN_08003e18
    push       {r0,r5,r6,r7,lr}
    sub        r3,#0x2
    ldr        r0,PTR_INT_08003ffc
    mov        r6,#0x8
    bl         FUN_08003e48
    mov        r4,#0x1
    pop        {r0,r5,r6,r7,pc}
INT_08003e28:
    .word 0x10000000
    .word 0x1000000
    .word 0x100000
    .word 0x10000
    .word 0x1000
    .word 0x100
    .word 0x10
    .word 0x1


_ts FUN_08003e48
    mov        r7,r8
    cmp        r7,#0x0
    beq        LAB_08003e52
    cmp        r7,r6
    blt        LAB_08003e54
LAB_08003e52:
    add        r7,r6,#0x0
LAB_08003e54:
    sub        r6,r6,r7
    mov        r8,r6
    add        r7,r3,#0x0
LAB_08003e5a:
    mov        r3,#0x0
    ldr        r4,[r0,#0x0]
LAB_08003e5e:
    cmp        r2,#0x0
    blt        LAB_08003e6c
    cmp        r2,r4
    blt        LAB_08003e76
    sub        r2,r2,r4
    add        r3,#0x1
    b          LAB_08003e5e
LAB_08003e6c:
    cmp        r2,r4
    bge        LAB_08003e76
    sub        r2,r2,r4
    add        r3,#0x1
    b          LAB_08003e5e
LAB_08003e76:
    mov        r6,r8
    cmp        r6,#0x0
    beq        LAB_08003e82
    sub        r6,#0x1
    mov        r8,r6
    b          LAB_08003ea6
LAB_08003e82:
    mov        r6,#0x1
    and        r6,r7
    bne        LAB_08003e90
    cmp        r4,#0x1
    beq        LAB_08003e90
    cmp        r3,#0x0
    beq        LAB_08003ea6
LAB_08003e90:
    mov        r6,#0x1
    orr        r7,r6
    cmp        r1,r5
    bge        LAB_08003eac
    ldr        r6,PTR_hexChars_08004000
    add        r6,r6,r3
    ldrb       r3,[r6,#0x0]
    sub        r3,#0x20
    strh       r3,[r1,#0x0]
    mov        r3,#0x0
    add        r1,#0x2
LAB_08003ea6:
    add        r0,#0x4
    cmp        r4,#0x1
    bne        LAB_08003e5a
LAB_08003eac:
    mov        pc,lr
hexChars:
    .asciz "0123456789ABCDEF"


_ts FUN_08003ec0
    push       {r0,r5,r6,r7,lr}
    mov        r7,r8
    cmp        r7,#0x0
    bne        LAB_08003ecc
    mov        r6,#0xff
    mov        r8,r6
LAB_08003ecc:
    mov        r6,r8
    cmp        r6,#0x0
    beq        LAB_08003eea
    sub        r6,#0x1
    mov        r8,r6
    ldrb       r3,[r2,#0x0]
    cmp        r3,#0x0
    beq        LAB_08003eea
    cmp        r1,r5
    bge        LAB_08003eea
    sub        r3,#0x20
    strh       r3,[r1,#0x0]
    add        r1,#0x2
    add        r2,#0x1
    b          LAB_08003ecc
LAB_08003eea:
    mov        r4,#0x1
    pop        {r0,r5,r6,r7,pc}


_ts FUN_08003ef0
    push       {r2}
    add        r6,#0x4
    mov        r3,#0x0
    mov        r4,#0x0
LAB_08003ef8:
    add        r3,r8
    add        r4,#0x1
    cmp        r4,#0xa
    blt        LAB_08003ef8
    ldrb       r4,[r0,#0x0]
    sub        r4,#0x30
    add        r3,r3,r4
    mov        r8,r3
    mov        r4,#0x0
    mov        pc,lr


_ts FUN_08003f0c
    push       {r2}
    add        r6,#0x4
    mov        r3,#0x5
    strh       r3,[r1,#0x0]
    add        r1,#0x2
    mov        r4,#0x0
    mov        pc,lr


_ts FUN_08003f1c
    push       {lr}
    ldr        r4,PTR_DAT_08004004
    ldr        r7,DAT_08004008
    ldr        r5,PTR_DAT_0800400c
    ldr        r5,[r5,#0x0]
    sub        r5,r5,r4
    mov        r2,#0x0
LAB_08003f2a:
    cmp        r5,#0x0
    beq        LAB_08003f5a
    ldrb       r6,[r4,#0x0]
    add        r0,r6,#0x0
    ldrb       r1,[r4,#0x1]
    add        r4,#0x2
    sub        r5,#0x2
LAB_08003f38:
    ldrb       r3,[r4,#0x0]
    add        r4,#0x2
    sub        r5,#0x2
    cmp        r3,#0xff
    beq        LAB_08003f2a
    cmp        r3,#0xfe
    bne        LAB_08003f4c
    add        r0,r6,#0x0
    add        r1,#0x1
    b          LAB_08003f38
LAB_08003f4c:
    push       {r0,r1,r2,r3,r4,r5,r6,r7}
    orr        r3,r7
    bl         Screen_CopyTileMapEntry
    pop        {r0,r1,r2,r3,r4,r5,r6,r7}
    add        r0,#0x1
    b          LAB_08003f38
LAB_08003f5a:
    ldr        r4,PTR_DAT_08004010
    ldr        r1,PTR_DAT_08004014
    str        r1,[r4,#0x0]
    pop        {pc}


_ts FUN_08003f64
    push       {r0,r5,r6,r7,lr}
    sub        r3,#0x11
    mov        r6,#0x20
    bl         FUN_08003f74
    mov        r4,#0x1
    pop        {r0,r5,r6,r7,pc}


_ts FUN_08003f74
    mov        r7,r8
    cmp        r7,#0x0
    beq        LAB_08003f7e
    cmp        r7,r6
    blt        LAB_08003f80
LAB_08003f7e:
    add        r7,r6,#0x0
LAB_08003f80:
    sub        r6,r6,r7
    mov        r8,r6
    add        r7,r3,#0x0
    ldr        r4,DAT_08004018
LAB_08003f88:
    mov        r3,#0x0
LAB_08003f8a:
    tst        r2,r4
    beq        LAB_08003f94
    bic        r2,r4
    add        r3,#0x1
    b          LAB_08003f8a
LAB_08003f94:
    mov        r6,r8
    cmp        r6,#0x0
    beq        LAB_08003fa0
    sub        r6,#0x1
    mov        r8,r6
    b          LAB_08003fc4
LAB_08003fa0:
    mov        r6,#0x1
    and        r6,r7
    bne        LAB_08003fae
    cmp        r4,#0x1
    beq        LAB_08003fae
    cmp        r3,#0x0
    beq        LAB_08003fc4
LAB_08003fae:
    mov        r6,#0x1
    orr        r7,r6
    cmp        r1,r5
    bge        LAB_08003fca
    ldr        r6,PTR_hexChars_0800401c
    add        r6,r6,r3
    ldrb       r3,[r6,#0x0]
    sub        r3,#0x20
    strh       r3,[r1,#0x0]
    mov        r3,#0x0
    add        r1,#0x2
LAB_08003fc4:
    lsr        r4,r4,#0x1
    cmp        r4,#0x0
    bne        LAB_08003f88
LAB_08003fca:
    mov        pc,lr

    .align 2, 0
PTR_DAT_08003fcc:
    .word 0x2002318
DAT_08003fd0:
    .word  0x400
PTR_DAT_08003fd4:
    .word 0x2002718
PTR_DAT_08003fd8:
    .word 0x2002318
PTR_DAT_08003fdc:
    .word 0x2002716
PTR_DAT_08003fe0:
    .word 0x2002718
PTR_DAT_08003fe4:
    .word PTR_formatString
PTR_DAT_08003fe8:
    .word PTR_formatString
PTR_PTR_FUN_08003dc8_1_08003fec:
    .word PTR_FUN_08003dc8_1_08003d7c
PTR_DAT_08003ff0:
    .word 0x2002718
DAT_08003ff4:
    .word  0xFFFFFFFF
PTR_DAT_08003ff8:
    .word DAT_08003df0
PTR_INT_08003ffc:
    .word INT_08003e28
PTR_hexChars_08004000:
    .word hexChars
PTR_DAT_08004004:
    .word 0x2002318
DAT_08004008:
    .word  0xF200
PTR_DAT_0800400c:
    .word 0x2002718
PTR_DAT_08004010:
    .word 0x2002718
PTR_DAT_08004014:
    .word 0x2002318
DAT_08004018:
    .word  0x80000000
PTR_hexChars_0800401c:
    .word hexChars

    .end
