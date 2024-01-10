    .include "constants.inc"
    .include "macros.inc"

    .syntax unified

    .global Start

    .text

    .arm
Start:
    b Init

    .include "header.inc"

Init:

    mov        r0,#0x12
    msr        cpsr_cf,r0
    ldr        sp,irqStackPtr
@ Set FIQ, (undefined),abort stack pointer to 0x3007FFC
    mov        r0,#0x11
    msr        cpsr_cf,r0
    ldr        sp,fiqStackPtr
    mov        r0,#0x1b
    msr        cpsr_cf,r0
    ldr        sp,fiqStackPtr
    mov        r0,#0x17
    msr        cpsr_cf,r0
    ldr        sp,fiqStackPtr
@ Set SWI stack pointer to 0x3007FE0
    mov        r0,#0x13
    msr        cpsr_cf,r0
    ldr        sp,swiStackPointer
@ Set system stack pointer to 0x3007E00
    mov        r0,#0x1f
    msr        cpsr_cf,r0
    ldr        sp,systemStackPointer
@ Configure wait state timing (0: 2/1, 1: 3/1, 2: 3/8)
    ldr        r0,regWaitCnt
    ldr        r1,waitCntConfig
    str        r1,[r0]
@ clear iwram
    mov        r0,IWRAM_START
    mov        r1,#0x7E00
    bl         memset0
@ clear ewram
    mov        r0,EWRAM_START
    mov        r1,#0x40000
    bl         memset0
@ Copy interrupt handler code to IWRAM
    ldr        r0,iwCodeSrc
    ldr        r1,iwCodeDest
    ldr        r2,iwCodeLen
    bl         memcpy
@ Copy interrupt jump table to IWRAM
    ldr        r0,=InitializeInterruptVectors
    mov        lr,pc
    bx         r0
@ Store address of interrupt handler
    ldr        r0,fiqStackPtr
    ldr        r1,=interruptHandlerStart
    str        r1,[r0]
@ Enable interrupts
    ldr        r0,=REG_IME
    mov        r1,#0x1
    strh       r1,[r0]
@ Enable Vblank, Hblank, Vcount, Gamepak interrupts
    ldr        r0,=REG_IE
    mov        r1,#0x1
    orr        r1,r1,#0x2
    orr        r1,r1,#0x4
    orr        r1,r1,#0x2000
    strh       r1,[r0]
@ Set up frame wait value of 1 for later
    ldr        r0,=eFrameWaitValue
    mov        r1,#0x1
    strh       r1,[r0]
@ Enable Hblank IRQ
    ldr        r0,=REG_DISPSTAT
    mov        r1,#0x8
    orr        r1,r1,#0x10
    strh       r1,[r0]
@ Disable keypad interrupts
    ldr        r0,=REG_KEYCNT
    ldr        r1,=(KEYCNT_IRQ_COND_ALL | KEYCNT_BUTTON_ALL)
    strh       r1,[r0]
@ Jump to actual main function
    ldr        r0,=AgbMain
    bx         r0
    b Start

memset0:
    mov        r2,#0x0
1:    str        r2,[r0]
    add        r0,r0,#0x4
    subs       r1,r1,#0x4
    bne        1b
    bx         lr

memcpy:
    ldr        r3,[r0]
    str        r3,[r1]
    add        r0,r0,#0x4
    add        r1,r1,#0x4
    subs       r2,r2,#0x4
    bne        memcpy
    bx         lr

irqStackPtr:        .word IWRAM_END - 0x60
fiqStackPtr:        .word IWRAM_END - 0x4
swiStackPointer:    .word IWRAM_END - 0x20
systemStackPointer: .word IWRAM_END - 0x200
regWaitCnt:         .word REG_WAITCNT
waitCntConfig:      .word 0x45B4
iwCodeSrc:          .word srcInterruptHandlerStart
iwCodeDest:         .word interruptHandlerStart
iwCodeLen:          .word 0xE40
    .pool

srcInterruptVector:
    .word Handler_VBlank_far
    .word dummy_6928_far
    .word dummy_6928_far
    .word dummy_6928_far
    .word dummy_6928_far
    .word dummy_6928_far
    .word 0x03007411
    .word 0x03007411
    .word dummy_6928_far
    .word dummy_6928_far
    .word dummy_6928_far
    .word dummy_6928_far
    .word dummy_6928_far
    .word dummy_6928_far
    .word dummy_6928_far


_ts InitializeInterruptVectors
    movs       r0,#0x0
    ldr        r1,=srcInterruptVector
    ldr        r2,=interruptVector
1:
    ldr        r3,[r1]
    str        r3,[r2]
    adds       r0,#0x1
    adds       r1,#0x4
    adds       r2,#0x4
    cmp        r0,#0xF
    blt        1b
    bx         lr
    .align 2, 0

    .pool
    
    .end
