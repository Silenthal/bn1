    .include "constants.inc"
    .include "macros.inc"

    .text

    .thumb

@@ Copies data.
@@ Input:
@@ r0: src
@@ r1: dst
@@ r2:
@@ - [20:0] Block count
@@ - [24] 0 = Copy, 1 = Fill with r0
@@ - [26] 0 = 16bit, 1 = 32bit
thumb_func_start SWI_CpuSet
SWI_CpuSet:
    svc        0xb
    bx         lr
thumb_func_end SWI_CpuSet

@@ Divides r0 by r1.
@@ Output:
@@ r0: n/d
@@ r1: n%d
@@ r3: abs(n/d)
thumb_func_start SWI_Div
SWI_Div:
    svc        0x6
    bx         lr
thumb_func_end SWI_Div

@@ Divides r0 by r1.
@@ Output:
@@ r0: n/d + n%d
@@ r1: n%d
@@ r3: abs(n/d)
thumb_func_start SWI_DivMod
SWI_DivMod:
    svc        0x6
    add        r0,r1,#0x0
    bx         lr
thumb_func_end SWI_DivMod

@@ Decompresses data to WRAM using LZ77.
@@ Input:
@@ r0: src address
@@ r1: dst address
thumb_func_start SWI_LZ77UnCompWram
SWI_LZ77UnCompWram:
    svc        0x11
    bx         lr
thumb_func_end SWI_LZ77UnCompWram

@@ Returns the square root of r0.
@@ Output:
@@ r0: sqrt(r0)
thumb_func_start SWI_Sqrt
SWI_Sqrt:
    svc        0x8
    bx         lr
thumb_func_end SWI_Sqrt

thumb_func_start memcpy_8_sram_copy
memcpy_8_sram_copy:
    push       { r4, lr }
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
    pop        { r4 }
    pop        { r0 }
    bx         r0
thumb_func_end memcpy_8_sram_copy

thumb_func_start MemCpy_8_Sram
MemCpy_8_Sram:
    push       { r4, r5, r6, lr }
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
    ldr        r3,PTR_memcpy_8_sram_copy_1_0809dfc0
    mov        r0,#0x1
    eor        r3,r0
    mov        r2,sp
    ldr        r0,PTR_MemCpy_8_Sram_1_0809dfc4
    ldr        r1,PTR_memcpy_8_sram_copy_1_0809dfc0
    sub        r0,r0,r1
    lsl        r0,r0,#0xf
    b LAB_0809dfd4
    
    .align 2, 0
PTR_REG_WAITCNT_0809dfb8:
    .word REG_WAITCNT
DAT_0809dfbc:
    .word 0x0000FFFC
PTR_memcpy_8_sram_copy_1_0809dfc0:
    .word memcpy_8_sram_copy
PTR_MemCpy_8_Sram_1_0809dfc4:
    .word MemCpy_8_Sram
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
    bl         Call_R3_9e108
    add        sp,#0x80
    pop        { r4, r5, r6 }
    pop        { r0 }
    bx         r0
thumb_func_end MemCmp_8_Sram

thumb_func_start MemCpySram
MemCpySram:
    push       { r4, r5, lr }
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
    pop        { r4, r5 }
    pop        { r0 }
    bx         r0
thumb_func_end MemCpySram

    .align 2, 0
PTR_REG_WAITCNT_0809e028:
    .word REG_WAITCNT
USHORT_0809e02c:
    .word     0x0000FFFC

thumb_func_start memcmp_8
memcmp_8:
    push       { r4, r5, lr }
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
    pop        { r4, r5 }
    pop        { r1 }
    bx         r1
thumb_func_end memcmp_8

thumb_func_start MemCmp_8_Sram
MemCmp_8_Sram:
    push       { r4, r5, r6, lr }
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
    ldr        r3,PTR_memcmp_8_1_0809e094
    mov        r0,#0x1
    eor        r3,r0
    mov        r2,sp
    ldr        r0,PTR_MemCmp_8_Sram_1_0809e098
    ldr        r1,PTR_memcmp_8_1_0809e094
    sub        r0,r0,r1
    lsl        r0,r0,#0xf
    b          LAB_0809e0a8

    .align 2, 0
PTR_REG_WAITCNT_0809e08c:
    .word REG_WAITCNT
DAT_0809e090:
    .word 0x0000FFFC
PTR_memcmp_8_1_0809e094:
    .word memcmp_8
PTR_MemCmp_8_Sram_1_0809e098:
    .word MemCmp_8_Sram
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
    bl         Call_R3_9e108
    add        sp,#0xc0
    pop        { r4, r5, r6 }
    pop        { r1 }
    bx         r1
thumb_func_end MemCmp_8_Sram

FUN_0809e0c4:
    push       { r4, r5, r6, r7, lr }
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
    bl         MemCpySram
    add        r0,r6,#0x0
    add        r1,r5,#0x0
    add        r2,r4,#0x0
    bl         MemCmp_8_Sram
    add        r3,r0,#0x0
    cmp        r3,#0x0
    bne        LAB_0809e0d0
LAB_0809e0f4:
    add        r0,r3,#0x0
    pop        { r4, r5, r6, r7 }
    pop        { r1 }
    bx         r1

Call_R0_9e0fc:
    bx         r0
    nop

Call_R1_9E100:
    bx         r1
    nop

Call_R2_9e103:
    bx         r2
    nop

Call_R3_9e108:
    bx         r3
    nop
    bx         r4
    nop
    bx         r5
    nop
    bx         r6
    nop
    bx         r7
    nop
    bx         r8
    nop
    bx         r9
    nop
    bx         r10
    nop
    bx         r11
    nop
    bx         r12
    nop
    bx         sp
    nop
    bx         lr
    nop

thumb_func_start div
div:
    cmp        r1,#0x0
    beq        LAB_0809e1c0
    push       { r4 }
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
    pop        { r4 }
    mov        pc,lr
LAB_0809e1c0:
    push       { lr }
    bl         dummy_9e1cc
    mov        r0,#0x0
    pop        { pc }
thumb_func_end div

thumb_func_start dummy_9e1cc
dummy_9e1cc:
    mov        pc,lr
thumb_func_end dummy_9e1cc

    .align 2,0

    .end
