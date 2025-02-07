#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Sio_Init
    push       {r4,r5,r6,r7,lr}
    mov        r7,r9
    mov        r6,r8
    push       {r6,r7}
    sub        sp,#0x4
    ldr        r3,PTR_REG_IME_0809bd0c
    mov        r4,#0x0
    strh       r4,[r3,#0x0]
    ldr        r2,PTR_REG_IE_0809bd10
    ldrh       r1,[r2,#0x0]
    ldr        r0,DAT_0809bd14
    and        r0,r1
    strh       r0,[r2,#0x0]
    mov        r0,#0x1
    strh       r0,[r3,#0x0]
    ldr        r0,PTR_REG_RCNT_0809bd18
    strh       r4,[r0,#0x0]
    sub        r2,#0xd8
    mov        r1,#0x80
    lsl        r1,r1,#0x6
    add        r0,r1,#0x0
    strh       r0,[r2,#0x0]
    ldrh       r0,[r2,#0x0]
    ldr        r3,DAT_0809bd1c
    add        r1,r3,#0x0
    orr        r0,r1
    strh       r0,[r2,#0x0]
    mov        r0,#0x0
    str        r0,[sp,#0x0]
    ldr        r4,PTR_Struct_UnkSio_0809bd20
    ldr        r2,CpuSetControl_0809bd24
    mov        r0,sp
    add        r1,r4,#0x0
    bl         SWI_CpuSet
    mov        r0,#0xff
    strb       r0,[r4,#0xa]
    mov        r0,#0x1
    neg        r0,r0
    str        r0,[r4,#0x14]
    add        r0,r4,#0x0
    add        r0,#0x60
    str        r0,[r4,#0x28]
    add        r0,#0x18
    str        r0,[r4,#0x2c]
    mov        r3,#0x0
    add        r5,r4,#0x0
    add        r5,#0xc0
    mov        r2,#0x0
    mov        r7,#0x30
    add        r7,r7,r4
    mov        r8,r7
    mov        r0,#0x90
    add        r0,r0,r4
    mov        r12,r0
    add        r6,r4,#0x0
    add        r6,#0xa8
    mov        r1,#0x40
    add        r1,r1,r4
    mov        r9,r1
LAB_0809bcc4:
    lsl        r1,r3,#0x2
    mov        r7,r12
    add        r0,r2,r7
    mov        r7,r8
    add        r7,#0x4
    mov        r8,r7
    sub        r7,#0x4
    stmia      r7!,{r0}
    add        r0,r2,r6
    mov        r7,r9
    add        r7,#0x4
    mov        r9,r7
    sub        r7,#0x4
    stmia      r7!,{r0}
    add        r0,r4,#0x0
    add        r0,#0x50
    add        r1,r1,r0
    str        r5,[r1,#0x0]
    add        r5,#0x48
    add        r2,#0x48
    add        r3,#0x1
    cmp        r3,#0x3
    ble        LAB_0809bcc4
    ldr        r0,PTR_REG_IE_0809bd10
    ldrh       r1,[r0,#0x0]
    mov        r2,#0x80
    orr        r1,r2
    strh       r1,[r0,#0x0]
    add        sp,#0x4
    pop        {r3,r4}
    mov        r8,r3
    mov        r9,r4
    pop        {r4,r5,r6,r7}
    pop        {r0}
    bx         r0

    .align 2, 0


PTR_REG_IME_0809bd0c:
    .word REG_IME

PTR_REG_IE_0809bd10:
    .word REG_IE

DAT_0809bd14:
    .word 0xFF7F

PTR_REG_RCNT_0809bd18:
    .word REG_RCNT

DAT_0809bd1c:
    .word 0x4003

PTR_Struct_UnkSio_0809bd20:
    .word 0x3004920

CpuSetControl_0809bd24:
    .byte 0x6C, 0x00, 0x00, 0x05


_ts Sio_TransmitData
    push       {r4,r5,r6,r7,lr}
    mov        r7,r8
    push       {r7}
    add        r7,r0,#0x0
    mov        r8,r1
    ldr        r6,PTR_Struct_UnkSio_0809bd40
    ldrb       r0,[r6,#0x1]
    cmp        r0,#0x0
    beq        LAB_0809bd44
    cmp        r0,#0x1
    beq        LAB_0809bda2
    b          LAB_0809bdb4

PTR_Struct_UnkSio_0809bd40:
    .word 0x3004920
LAB_0809bd44:
    ldr        r5,PTR_REG_SIOCNT_0809bdd4
    ldrb       r4,[r5,#0x0]
    mov        r0,#0x8
    mov        r12,r0
    and        r0,r4
    cmp        r0,#0x0
    beq        LAB_0809bdb4
    mov        r0,#0x4
    and        r0,r4
    lsl        r0,r0,#0x18
    lsr        r2,r0,#0x18
    cmp        r2,#0x0
    bne        LAB_0809bda2
    ldr        r1,[r6,#0x14]
    mov        r0,#0x1
    neg        r0,r0
    cmp        r1,r0
    bne        LAB_0809bda2
    ldr        r3,PTR_REG_IME_0809bdd8
    strh       r2,[r3,#0x0]
    ldr        r2,PTR_REG_IE_0809bddc
    ldrh       r1,[r2,#0x0]
    ldr        r0,DAT_0809bde0
    and        r0,r1
    strh       r0,[r2,#0x0]
    ldrh       r0,[r2,#0x0]
    mov        r1,#0x40
    orr        r0,r1
    strh       r0,[r2,#0x0]
    mov        r0,#0x1
    strh       r0,[r3,#0x0]
    ldrb       r1,[r5,#0x1]
    mov        r0,#0x41
    neg        r0,r0
    and        r0,r1
    strb       r0,[r5,#0x1]
    ldr        r1,PTR_REG_IF_0809bde4
    mov        r0,#0xc0
    strh       r0,[r1,#0x0]
    sub        r1,#0xf6
    ldr        r0,DAT_0809bde8
    str        r0,[r1,#0x0]
    mov        r0,r12
    strb       r0,[r6,#0x0]
    mov        r0,#0x80
    orr        r0,r4
    strb       r0,[r5,#0x0]
LAB_0809bda2:
    add        r0,r7,#0x0
    bl         Sio_SendData
    mov        r0,r8
    bl         Sio_RecvData
    ldr        r1,PTR_Struct_UnkSio_0809bdec
    mov        r0,#0x1
    strb       r0,[r1,#0x1]
LAB_0809bdb4:
    ldr        r0,PTR_Struct_UnkSio_0809bdec
    ldrb       r1,[r0,#0xb]
    add        r1,#0x1
    strb       r1,[r0,#0xb]
    ldrb       r1,[r0,#0x3]
    ldrb       r0,[r0,#0x9]
    cmp        r0,#0x0
    beq        LAB_0809bdc8
    mov        r0,#0x80
    orr        r1,r0
LAB_0809bdc8:
    add        r0,r1,#0x0
    pop        {r3}
    mov        r8,r3
    pop        {r4,r5,r6,r7}
    pop        {r1}
    bx         r1

PTR_REG_SIOCNT_0809bdd4:
    .word REG_SIOCNT

PTR_REG_IME_0809bdd8:
    .word REG_IME

PTR_REG_IE_0809bddc:
    .word REG_IE

DAT_0809bde0:
    .word 0xFF7F

PTR_REG_IF_0809bde4:
    .word REG_IF

DAT_0809bde8:
    .word 0xC0C0FA

PTR_Struct_UnkSio_0809bdec:
    .word 0x3004920


_ts Sio_SetReady
    ldr        r2,PTR_REG_SIOCNT_0809be08
    ldrb       r1,[r2,#0x0]
    mov        r0,#0x7f
    and        r0,r1
    strb       r0,[r2,#0x0]
    sub        r2,#0x1c
    ldr        r0,[r2,#0x0]
    ldr        r1,DAT_0809be0c
    and        r0,r1
    str        r0,[r2,#0x0]
    bx         lr

    .align 2, 0


PTR_REG_SIOCNT_0809be08:
    .word REG_SIOCNT

DAT_0809be0c:
    .word 0xFF7FFFFF


_ts Sio_SendData
    push       {r4,r5,lr}
    mov        r5,#0x0
    ldr        r4,PTR_Struct_UnkSio_0809be58
    ldr        r2,[r4,#0x28]
    ldrb       r1,[r4,#0xb]
    strb       r1,[r2,#0x0]
    ldr        r3,[r4,#0x28]
    ldrb       r1,[r4,#0x2]
    ldrb       r2,[r4,#0x3]
    eor        r1,r2
    strb       r1,[r3,#0x1]
    ldr        r1,[r4,#0x28]
    strh       r5,[r1,#0x2]
    ldr        r1,[r4,#0x28]
    add        r1,#0x4
    ldr        r2,CpuSetControl_0809be5c
    bl         SWI_CpuSet
    mov        r2,#0x0
    ldr        r1,[r4,#0x28]
LAB_0809be38:
    ldrh       r0,[r1,#0x0]
    add        r5,r5,r0
    add        r1,#0x2
    add        r2,#0x1
    cmp        r2,#0x9
    bls        LAB_0809be38
    ldr        r0,[r4,#0x28]
    mvn        r1,r5
    strh       r1,[r0,#0x2]
    mov        r0,#0xa
    ldrsb      r0,[r4,r0]
    str        r0,[r4,#0x14]
    pop        {r4,r5}
    pop        {r0}
    bx         r0

    .align 2, 0


PTR_Struct_UnkSio_0809be58:
    .word 0x3004920

CpuSetControl_0809be5c:
    .byte 0x04, 0x00, 0x00, 0x04


_ts Sio_RecvData
    push       {r4,r5,r6,r7,lr}
    mov        r7,r10
    mov        r6,r9
    mov        r5,r8
    push       {r5,r6,r7}
    sub        sp,#0x8
    mov        r10,r0
    mov        r1,#0x0
    str        r1,[sp,#0x0]
    ldr        r0,PTR_REG_IME_0809bf7c
    strh       r1,[r0,#0x0]
    ldr        r2,PTR_Struct_UnkSio_0809bf80
    add        r3,r2,#0x4
    add        r2,#0x40
    mov        r5,#0x3
LAB_0809be7e:
    ldr        r1,[r2,#0x10]
    ldr        r0,[r2,#0x0]
    str        r0,[r2,#0x10]
    stmia      r2!,{r1}
    sub        r5,#0x1
    cmp        r5,#0x0
    bge        LAB_0809be7e
    ldr        r0,[r3,#0x0]
    str        r0,[sp,#0x4]
    mov        r2,#0x0
    str        r2,[r3,#0x0]
    ldr        r1,PTR_REG_IME_0809bf7c
    mov        r0,#0x1
    strh       r0,[r1,#0x0]
    sub        r0,r3,#0x4
    strb       r2,[r0,#0x3]
    mov        r5,#0x0
    add        r6,r0,#0x0
    mov        r0,#0x50
    add        r0,r0,r6
    mov        r9,r0
LAB_0809bea8:
    lsl        r1,r5,#0x1
    add        r2,r6,#0x0
    add        r2,#0xd
    add        r2,r1,r2
    add        r0,r6,#0x0
    add        r0,#0xc
    add        r1,r1,r0
    ldrb       r0,[r1,#0x0]
    strb       r0,[r2,#0x0]
    lsl        r3,r5,#0x2
    mov        r0,r9
    add        r4,r3,r0
    ldr        r0,[r4,#0x0]
    ldrb       r0,[r0,#0x0]
    strb       r0,[r1,#0x0]
    ldrb       r1,[r2,#0x0]
    sub        r0,r0,r1
    lsl        r0,r0,#0x18
    lsr        r7,r0,#0x18
    mov        r2,#0x0
    mov        r1,#0x0
    add        r0,r5,#0x1
    mov        r8,r0
    ldr        r4,[r4,#0x0]
LAB_0809bed8:
    ldrh       r0,[r4,#0x0]
    add        r2,r2,r0
    add        r4,#0x2
    add        r1,#0x1
    cmp        r1,#0x9
    bls        LAB_0809bed8
    cmp        r7,#0x1
    bne        LAB_0809bf1a
    add        r0,sp,#0x4
    add        r0,r0,r5
    ldrb       r0,[r0,#0x0]
    cmp        r0,#0x0
    beq        LAB_0809bf1a
    lsl        r0,r2,#0x10
    asr        r0,r0,#0x10
    mov        r1,#0x1
    neg        r1,r1
    cmp        r0,r1
    bne        LAB_0809bf1a
    mov        r1,r9
    add        r0,r3,r1
    ldr        r0,[r0,#0x0]
    add        r0,#0x4
    lsl        r1,r5,#0x4
    add        r1,r10
    ldr        r2,CpuSetControl_0809bf84
    bl         SWI_CpuSet
    add        r0,r7,#0x0
    lsl        r0,r5
    ldrb       r1,[r6,#0x3]
    orr        r0,r1
    strb       r0,[r6,#0x3]
LAB_0809bf1a:
    mov        r5,r8
    cmp        r5,#0x3
    ble        LAB_0809bea8
    ldr        r2,PTR_Struct_UnkSio_0809bf80
    ldrb       r0,[r2,#0x2]
    ldrb       r1,[r2,#0x3]
    orr        r0,r1
    strb       r0,[r2,#0x2]
    ldrb       r1,[r2,#0xb]
    mov        r0,#0x1
    and        r0,r1
    cmp        r0,#0x0
    beq        LAB_0809bf90
    mov        r5,#0x0
    ldrb       r0,[r2,#0x2]
    cmp        r0,#0x0
    beq        LAB_0809bf56
    add        r3,r0,#0x0
    add        r4,r2,#0x0
    add        r4,#0x50
LAB_0809bf42:
    ldmia      r4!,{r0}
    ldrb       r1,[r0,#0x1]
    ldr        r0,[sp,#0x0]
    orr        r0,r1
    str        r0,[sp,#0x0]
    add        r5,#0x1
    add        r0,r3,#0x0
    asr        r0,r5
    cmp        r0,#0x0
    bne        LAB_0809bf42
LAB_0809bf56:
    ldr        r0,PTR_REG_SIOCNT_0809bf88
    ldr        r0,[r0,#0x0]
    lsl        r0,r0,#0x1a
    lsr        r0,r0,#0x1e
    mov        r1,#0x1
    lsl        r1,r0
    ldr        r0,[sp,#0x0]
    and        r0,r1
    cmp        r0,#0x0
    beq        LAB_0809bf90
    ldrb       r3,[r2,#0xa]
    mov        r1,#0xa
    ldrsb      r1,[r2,r1]
    mov        r0,#0x6
    neg        r0,r0
    cmp        r1,r0
    bne        LAB_0809bf8c
    mov        r0,#0xff
    b          LAB_0809bf8e

PTR_REG_IME_0809bf7c:
    .word REG_IME

PTR_Struct_UnkSio_0809bf80:
    .word 0x3004920

CpuSetControl_0809bf84:
    .byte 0x04, 0x00, 0x00, 0x04

PTR_REG_SIOCNT_0809bf88:
    .word REG_SIOCNT
LAB_0809bf8c:
    sub        r0,r3,#0x1
LAB_0809bf8e:
    strb       r0,[r2,#0xa]
LAB_0809bf90:
    ldrb       r0,[r2,#0x3]
    add        sp,#0x8
    pop        {r3,r4,r5}
    mov        r8,r3
    mov        r9,r4
    mov        r10,r5
    pop        {r4,r5,r6,r7}
    pop        {r1}
    bx         r1

    .align 2, 0

