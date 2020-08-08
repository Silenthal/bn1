    .include "constants.inc"
    .include "macros.inc"

    .syntax unified

    .text

    .arm

    .global srcInterruptHandlerStart
srcInterruptHandlerStart:
    @ Save SPSR, current IE, and return address
    mov        r3,#REG_BASE
    add        r3,r3,#OFFSET_REG_IE
    ldr        r2,[r3]
    mov        r1,r2, lsl #0x10
    mov        r1,r1, lsr #0x10
    mrs        r0,spsr
    stmdb      sp!,{ r0, r1, r3, lr }
    @ Only check for interrupts that have been enabled
    and        r1,r2,r2, lsr #0x10
    mov        r2,#0x0
    ands       r0,r1,#0x1
    bne        handleInterrupt
    add        r2,r2,#0x4
    ands       r0,r1,#0x2
    bne        handleInterrupt
    add        r2,r2,#0x4
    ands       r0,r1,#0x4
    bne        handleInterrupt
    add        r2,r2,#0x4
    ands       r0,r1,#0x8
    bne        handleInterrupt
    add        r2,r2,#0x4
    ands       r0,r1,#0x10
    bne        handleInterrupt
    add        r2,r2,#0x4
    ands       r0,r1,#0x20
    bne        handleInterrupt
    add        r2,r2,#0x4
    ands       r0,r1,#0x40
    bne        handleInterrupt
    add        r2,r2,#0x4
    ands       r0,r1,#0x80
    bne        handleInterrupt
    add        r2,r2,#0x4
    ands       r0,r1,#0x100
    bne        handleInterrupt
    add        r2,r2,#0x4
    ands       r0,r1,#0x200
    bne        handleInterrupt
    add        r2,r2,#0x4
    ands       r0,r1,#0x400
    bne        handleInterrupt
    add        r2,r2,#0x4
    ands       r0,r1,#0x800
    bne        handleInterrupt
    add        r2,r2,#0x4
    ands       r0,r1,#0x1000
    bne        handleInterrupt
    add        r2,r2,#0x4
    ands       r0,r1,#0x2000

    bne        .

    @ Saved on stack:
    @ r0 = spsr
    @ r1 = [IE] & 0xFFFF
    @ r3 = IE
    @ lr
    @ Current:
    @ r1 = enabled and flagged interrupts
    @ r2 = 4 * (index of interrupt that is being handled)
    @ Handle interrupt that was enabled
handleInterrupt:
    strh       r0,[r3,#0x2]
    ldr        r1,=0x20C2
    @ Enable only gamepak, serial, timer3, hblank, and vblank inter
    strh       r1,[r3]
    @ Change CPU mode to System
    mrs        r3,cpsr
    bic        r3,r3,#0xdf
    orr        r3,r3,#0x1f
    msr        cpsr_cf,r3
    ldr        r1,=interruptVector
    add        r1,r1,r2
    ldr        r0,[r1]
    stmdb      sp!,{ lr }
    adr        lr,afterBranch
    bx         r0
    @ ...
afterBranch:
    ldmia      sp!,{ lr }
    @ Change CPU mode to IRQ and disable IRQ interrupts
    mrs        r3,cpsr
    bic        r3,r3,#0xdf
    orr        r3,r3,#0x92
    msr        cpsr_cf,r3
    @ Load SPSR, current IE, and return address
    ldmia      sp!,{r0, r1, r3, lr }
    strh       r1,[r3]
    msr        spsr_cf,r0
    bx         lr

    .pool

thumb_func_start handlerOther
handlerOther:
    bx         lr
    .p2align 2,0
thumb_func_end handlerOther

thumb_func_start handlerVBlank
handlerVBlank:
    ldr        r0,=eFrameCounter
    ldr        r1,[r0]
    adds       r1,#0x1
    str        r1,[r0]
    push       { lr }
    ldr        r0,=0x8000661
    mov        lr,pc
    bx         r0
    pop        { r0 }
    bx         r0
thumb_func_end handlerVBlank

handlerVcount_1:
    push       { lr }
    ldr        r0,mysteryAddr
    mov        lr,pc
    bx         r0
    pop        { r0 }
    bx         r0
mysteryAddr:    .word 0x8000649

FUN_08180150:
    str        r4,[r6,#0x30]
    lsls       r0,r0,#0x8
    ldr        r0,=REG_VCOUNT
    ldrh       r0,[r0]
    lsrs       r0,r0,#0x3
    ldr        r1,=0x20046e0
    ldrb       r1,[r1,r0]
    ldr        r0,=REG_BG1HOFS
    strh       r1,[r0]
    bx         lr

    .pool

    .end
