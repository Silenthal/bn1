#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .text

    .thumb

_ts BgUpdate_Set
    push       { lr }
    ldr        r5,PTR_gFuncPtrBgUpdatePostLoop_08001cbc
    str        r0,[r5,#0x0]
    str        r1,[r5,#0x8]
    str        r2,[r5,#0x4]
    ldr        r0,PTR_interruptVector_hblank_08001cc0
    str        r2,[r0,#0x0]
    pop        { pc }

_ts BgUpdate_Init
    push       { lr }
    ldr        r5,PTR_gFuncPtrBgUpdatePostLoop_08001cc4
    ldr        r0,PTR_dummy_1cb8_1_08001cc8
    str        r0,[r5,#0x0]
    str        r0,[r5,#0x8]
    ldr        r1,PTR_dummy_6928_1_08001ccc
    ldr        r0,PTR_interruptVector_hblank_08001cd0
    str        r1,[r0,#0x0]
    str        r1,[r5,#0x4]
    pop        { pc }

_ts BgUpdate_CallPostLoopFunction
    push       { lr }
    ldr        r5,PTR_gFuncPtrBgUpdatePostLoop_08001cd4
    ldr        r0,[r5,#0x0]
    mov        lr,pc
    bx         r0
    pop        { pc }

_ts BgUpdate_CallPreLoopFunction
    push       { lr }
    ldr        r5,PTR_gFuncPtrBgUpdatePostLoop_08001cd8
    ldr        r0,[r5,#0x8]
    mov        lr,pc
    bx         r0
    pop        { pc }

_ts FUN_08001bf4
    push       { lr }
    mov        r1,#0x0
LAB_08001bf8:
    push       { r1 }
    bl         Rng_RandomUint
    mov        r2,#0x7
    and        r0,r2
    add        r2,r0,#0x1
    pop        { r1 }
    ldr        r0,PTR_tempBg1Hofs_08001cdc
    strb       r2,[r0,r1]
    push       { r1 }
    bl         Rng_RandomUint
    mov        r2,#0x3
    and        r0,r2
    add        r2,r0,#0x1
    pop        { r1 }
    ldr        r0,PTR_tempBg1Vofs_08001ce0
    strb       r2,[r0,r1]
    add        r1,#0x1
    cmp        r1,#0x20
    blt        LAB_08001bf8
    ldr        r0,PTR_DAT_08001ce4
    ldr        r1,PTR_DAT_08001ce8
    mov        r2,#0x0
    strh       r2,[r0,#0x0]
    strh       r2,[r1,#0x0]
    pop        { pc }

_ts FUN_08001c30
    mov        r0,#0x0
    ldr        r1,PTR_tempBg1Hofs_08001cec
    ldr        r2,PTR_tempBg1Vofs_08001cf0
LAB_08001c36:
    ldrb       r3,[r1,r0]
    ldrb       r4,[r2,r0]
    add        r3,r3,r4
    strb       r3,[r1,r0]
    add        r0,#0x1
    cmp        r0,#0x20
    blt        LAB_08001c36
    mov        pc,lr

_ts dummy_1c48
    mov        pc,lr

_ts BgUpdate_MoveUpLeft
    ldr        r1,PTR_tempBg1Hofs_08001cf4
    ldr        r2,[r1,#0x0]
    sub        r2,#0x8
    str        r2,[r1,#0x0]
    lsr        r2,r2,#0x4
    ldr        r1,PTR_tempBg1Vofs_08001cf8
    ldr        r3,[r1,#0x0]
    sub        r3,#0x4
    str        r3,[r1,#0x0]
    lsr        r3,r3,#0x4
    mov        r7,r10
    ldr        r7,[r7,#0x10]
    strh       r2,[r7,#0x10]
    strh       r3,[r7,#0x12]
    mov        pc,lr

_ts BgUpdate_MoveUp
    ldr        r1,PTR_tempBg1Vofs_08001cfc
    ldr        r3,[r1,#0x0]
    sub        r3,#0x4
    str        r3,[r1,#0x0]
    lsr        r3,r3,#0x4
    mov        r7,r10
    ldr        r7,[r7,#0x10]
    strh       r3,[r7,#0x12]
    mov        pc,lr

_ts BgUpdate_MoveLeft
    ldr        r1,PTR_tempBg1Hofs_08001d00
    ldr        r2,[r1,#0x0]
    sub        r2,#0x8
    str        r2,[r1,#0x0]
    lsr        r2,r2,#0x4
    mov        r7,r10
    ldr        r7,[r7,#0x10]
    strh       r2,[r7,#0x10]
    mov        pc,lr

_ts BgUpdate_MoveRight
    ldr        r1,PTR_tempBg1Hofs_08001d04
    ldr        r2,[r1,#0x0]
    add        r2,#0x8
    str        r2,[r1,#0x0]
    lsr        r2,r2,#0x4
    mov        r7,r10
    ldr        r7,[r7,#0x10]
    strh       r2,[r7,#0x10]
    mov        pc,lr

_ts BgUpdate_MoveLeftSlow
    ldr        r1,PTR_tempBg1Hofs_08001d08
    ldr        r2,[r1,#0x0]
    sub        r2,#0x2
    str        r2,[r1,#0x0]
    mov        r7,r10
    ldr        r7,[r7,#0x10]
    strh       r2,[r7,#0x10]
    mov        pc,lr

_ts dummy_1cb8
    mov        pc,lr

        .align 2, 0

PTR_gFuncPtrBgUpdatePostLoop_08001cbc:  .word gFuncPtrBgUpdatePostLoop
PTR_interruptVector_hblank_08001cc0:    .word interruptVectorHblank
PTR_gFuncPtrBgUpdatePostLoop_08001cc4:  .word gFuncPtrBgUpdatePostLoop
PTR_dummy_1cb8_1_08001cc8:              .word dummy_1cb8
PTR_dummy_6928_1_08001ccc:              .word dummy_6928_far
PTR_interruptVector_hblank_08001cd0:    .word interruptVectorHblank
PTR_gFuncPtrBgUpdatePostLoop_08001cd4:  .word gFuncPtrBgUpdatePostLoop
PTR_gFuncPtrBgUpdatePostLoop_08001cd8:  .word gFuncPtrBgUpdatePostLoop
PTR_tempBg1Hofs_08001cdc:               .word tempBg1Hofs
PTR_tempBg1Vofs_08001ce0:               .word tempBg1Vofs
PTR_DAT_08001ce4:                       .word 0x200C518
PTR_DAT_08001ce8:                       .word 0x200C260
PTR_tempBg1Hofs_08001cec:               .word tempBg1Hofs
PTR_tempBg1Vofs_08001cf0:               .word tempBg1Vofs
PTR_tempBg1Hofs_08001cf4:               .word tempBg1Hofs
PTR_tempBg1Vofs_08001cf8:               .word tempBg1Vofs
PTR_tempBg1Vofs_08001cfc:               .word tempBg1Vofs
PTR_tempBg1Hofs_08001d00:               .word tempBg1Hofs
PTR_tempBg1Hofs_08001d04:               .word tempBg1Hofs
PTR_tempBg1Hofs_08001d08:               .word tempBg1Hofs

    .end
