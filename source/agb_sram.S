    .include "constants.inc"
    .include "macros.inc"

    .text

    .thumb

_ts ReadSram_Core
    push       {r4,lr}
    add        r4,r0,#0x0
    sub        r3,r2,#0x1
    cmp        r2,#0x0
    beq        2f
    mov        r2,#0x1
    neg        r2,r2
1:
    ldrb       r0,[r4,#0x0]
    strb       r0,[r1,#0x0]
    add        r4,#0x1
    add        r1,#0x1
    sub        r3,#0x1
    cmp        r3,r2
    bne        1b
2:
    pop        {r4}
    pop        {r0}
    bx         r0

_ts ReadSram
    push       {r4,r5,r6,lr}
    sub        sp,#0x80
    add        r4,r0,#0x0
    add        r5,r1,#0x0
    add        r6,r2,#0x0
    ldr        r2,PTR_REG_WAITCNT_0809dfb8
    ldrh       r0,[r2,#0x0]
    ldr        r1,DAT_0809dfbc
    and        r0,r1
    mov        r1,#0x3
    orr        r0,r1
    strh       r0,[r2,#0x0]
    ldr        r3,PTR_ReadSram_Core_1_0809dfc0
    mov        r0,#0x1
    eor        r3,r0
    mov        r2,sp
    ldr        r0,PTR_ReadSram_1_0809dfc4
    ldr        r1,PTR_ReadSram_Core_1_0809dfc0
    sub        r0,r0,r1
    lsl        r0,r0,#0xf
    b LAB_0809dfd4

    .align 2, 0

PTR_REG_WAITCNT_0809dfb8:
    .word REG_WAITCNT
DAT_0809dfbc:
    .word 0x0000FFFC
PTR_ReadSram_Core_1_0809dfc0:
    .word ReadSram_Core
PTR_ReadSram_1_0809dfc4:
    .word ReadSram
LAB_0809dfc8:
    ldrh       r0,[r3,#0x0]
    strh       r0,[r2,#0x0]
    add        r3,#0x2
    add        r2,#0x2
    sub        r0,r1,#0x1
    lsl        r0,r0,#0x10
LAB_0809dfd4:
    lsr        r1,r0,#0x10
    cmp        r1,#0x0
    bne        LAB_0809dfc8
    mov        r3,sp
    add        r3,#0x1
    add        r0,r4,#0x0
    add        r1,r5,#0x0
    add        r2,r6,#0x0
    bl         _call_via_r3
    add        sp,#0x80
    pop        {r4,r5,r6}
    pop        {r0}
    bx         r0

_ts WriteSram
    push       {r4,r5,lr}
    add        r5,r0,#0x0
    add        r4,r1,#0x0
    add        r3,r2,#0x0
    ldr        r2,PTR_REG_WAITCNT_0809e028
    ldrh       r0,[r2,#0x0]
    ldr        r1,USHORT_0809e02c
    and        r0,r1
    mov        r1,#0x3
    orr        r0,r1
    strh       r0,[r2,#0x0]
    sub        r3,#0x1
    mov        r0,#0x1
    neg        r0,r0
    cmp        r3,r0
    beq        LAB_0809e020
    add        r1,r0,#0x0
LAB_0809e012:
    ldrb       r0,[r5,#0x0]
    strb       r0,[r4,#0x0]
    add        r5,#0x1
    add        r4,#0x1
    sub        r3,#0x1
    cmp        r3,r1
    bne        LAB_0809e012
LAB_0809e020:
    pop        {r4,r5}
    pop        {r0}
    bx         r0

    .align 2, 0


PTR_REG_WAITCNT_0809e028:
    .word REG_WAITCNT
USHORT_0809e02c:
    .word     0x0000FFFC

_ts VerifySram_Core
    push       {r4,r5,lr}
    add        r5,r0,#0x0
    add        r3,r1,#0x0
    sub        r4,r2,#0x1
    cmp        r2,#0x0
    beq        LAB_0809e056
    mov        r2,#0x1
    neg        r2,r2
LAB_0809e040:
    ldrb       r1,[r3,#0x0]
    ldrb       r0,[r5,#0x0]
    add        r5,#0x1
    add        r3,#0x1
    cmp        r1,r0
    beq        LAB_0809e050
    sub        r0,r3,#0x1
    b          LAB_0809e058
LAB_0809e050:
    sub        r4,#0x1
    cmp        r4,r2
    bne        LAB_0809e040
LAB_0809e056:
    mov        r0,#0x0
LAB_0809e058:
    pop        {r4,r5}
    pop        {r1}
    bx         r1

_ts VerifySram
    push       {r4,r5,r6,lr}
    sub        sp,#0xc0
    add        r4,r0,#0x0
    add        r5,r1,#0x0
    add        r6,r2,#0x0
    ldr        r2,PTR_REG_WAITCNT_0809e08c
    ldrh       r0,[r2,#0x0]
    ldr        r1,DAT_0809e090
    and        r0,r1
    mov        r1,#0x3
    orr        r0,r1
    strh       r0,[r2,#0x0]
    ldr        r3,PTR_VerifySram_Core_1_0809e094
    mov        r0,#0x1
    eor        r3,r0
    mov        r2,sp
    ldr        r0,PTR_VerifySram_1_0809e098
    ldr        r1,PTR_VerifySram_Core_1_0809e094
    sub        r0,r0,r1
    lsl        r0,r0,#0xf
    b          LAB_0809e0a8

    .align 2, 0


PTR_REG_WAITCNT_0809e08c:
    .word REG_WAITCNT
DAT_0809e090:
    .word 0x0000FFFC
PTR_VerifySram_Core_1_0809e094:
    .word VerifySram_Core
PTR_VerifySram_1_0809e098:
    .word VerifySram
LAB_0809e09c:
    ldrh       r0,[r3,#0x0]
    strh       r0,[r2,#0x0]
    add        r3,#0x2
    add        r2,#0x2
    sub        r0,r1,#0x1
    lsl        r0,r0,#0x10
LAB_0809e0a8:
    lsr        r1,r0,#0x10
    cmp        r1,#0x0
    bne        LAB_0809e09c
    mov        r3,sp
    add        r3,#0x1
    add        r0,r4,#0x0
    add        r1,r5,#0x0
    add        r2,r6,#0x0
    bl         _call_via_r3
    add        sp,#0xc0
    pop        {r4,r5,r6}
    pop        {r1}
    bx         r1

WriteSramEx:
    push       {r4,r5,r6,r7,lr}
    add        r6,r0,#0x0
    add        r5,r1,#0x0
    add        r4,r2,#0x0
    mov        r7,#0x0
    b          LAB_0809e0d6
LAB_0809e0d0:
    add        r0,r7,#0x1
    lsl        r0,r0,#0x18
    lsr        r7,r0,#0x18
LAB_0809e0d6:
    cmp        r7,#0x2
    bhi        LAB_0809e0f4
    add        r0,r6,#0x0
    add        r1,r5,#0x0
    add        r2,r4,#0x0
    bl         WriteSram
    add        r0,r6,#0x0
    add        r1,r5,#0x0
    add        r2,r4,#0x0
    bl         VerifySram
    add        r3,r0,#0x0
    cmp        r3,#0x0
    bne        LAB_0809e0d0
LAB_0809e0f4:
    add        r0,r3,#0x0
    pop        {r4,r5,r6,r7}
    pop        {r1}
    bx         r1

    .end
