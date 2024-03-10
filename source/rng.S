    .include "constants.inc"
    .include "macros.inc"

    .text

    .thumb

@@ Initializes the RNG.
@ void Rng_Init(void)
_ts Rng_Init
    ldr        r0,rngInitSeed
    ldr        r7,eRngState_0
    str        r0,[r7,#0x0]
    mov        pc,lr

@@ Returns a random unsigned int.
@ uint Rng_RandomUint(void)
_ts Rng_RandomUint
    ldr        r7,eRngState_1
    ldr        r0,[r7,#0x0]
    ldr        r1,rngConstant
    lsl        r2,r0,#0x1
    lsr        r3,r0,#0x1f
    add        r0,r2,r3
    add        r0,#0x1
    eor        r0,r1
    str        r0,[r7,#0x0]
    mov        pc,lr

@@ Returns a random int.
@ int Rng_RandomInt(void)
_ts Rng_RandomInt
    ldr        r7,eRngState_2
    ldr        r0,[r7,#0x0]
    ldr        r1,rngConstant
    lsl        r2,r0,#0x1
    lsr        r3,r0,#0x1f
    add        r0,r2,r3
    add        r0,#0x1
    eor        r0,r1
    str        r0,[r7,#0x0]
    lsr        r0,r0,#0x1
    mov        pc,lr

    .align 2, 0

rngInitSeed:    .word 0xA338244F
eRngState_0:    .word eRngState
eRngState_1:    .word eRngState
rngConstant:    .word 0x873CA9E5
eRngState_2:    .word eRngState
