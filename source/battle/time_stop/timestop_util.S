#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set TimeStop_HidePlayer, 0x80572d2
    .set Effect_QuickEffect_Create, 0x807b5e8
    .set FUN_08057300, 0x8057300
    
    .text

_nt TimeStop_WarpPlayerOut
    push       {r5,lr}
    ldrb       r0,[r5,#0x6]
    bl         TimeStop_HidePlayer
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldrb       r0,[r5,#0x6]
    lsl        r0,r0,#0x2
    add        r0,#0x40
    ldr        r7,[r7,r0]
    add        r7,#0x28
    ldmia      r7!,{r1,r2,r3}
    mov        r4,#0x16
    ldrb       r0,[r5,#0x6]
    tst        r0,r0
    beq        LAB_080982e0
    mov        r6,#0x4
    lsl        r6,r6,#0x8
    add        r6,#0x80
    orr        r4,r6
LAB_080982e0:
    bl         Effect_QuickEffect_Create
    tst        r5,r5
    beq        LAB_080982f0
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r5,#0x0]
LAB_080982f0:
    pop        {r5,pc}


_nt TimeStop_WarpPlayerIn
    push       {r5,lr}
    ldrb       r0,[r5,#0x6]
    bl         FUN_08057300
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldrb       r0,[r5,#0x6]
    lsl        r0,r0,#0x2
    add        r7,r7,r0
    ldr        r7,[r7,#0x40]
    add        r7,#0x28
    ldmia      r7!,{r1,r2,r3}
    mov        r4,#0x17
    ldrb       r0,[r5,#0x6]
    tst        r0,r0
    beq        LAB_0809831a
    mov        r6,#0x4
    lsl        r6,r6,#0x8
    add        r6,#0x80
    orr        r4,r6
LAB_0809831a:
    bl         Effect_QuickEffect_Create
    tst        r5,r5
    beq        LAB_0809832a
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r5,#0x0]
LAB_0809832a:
    pop        {r5,pc}
