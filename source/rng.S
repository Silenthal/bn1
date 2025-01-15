    .include "constants.inc"
    .include "macros.inc"


@@ Initializes the RNG.
_ts Rng_Init
    ldr        r0,rngInitSeed
    ldr        r7,gRngState_0
    str        r0,[r7,#0x0]
    mov        pc,lr

@@ Returns a random unsigned int.
@@ Out:
@@ r0: num: an integer in the range of 0 to 0xFFFFFFFF.
_ts Rng_RandomUint
    ldr        r7,gRngState_1
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
@@ Out:
@@ r0: num: an integer in the range of 0 to 0x7FFFFFFF.
_ts Rng_RandomInt
    ldr        r7,gRngState_2
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
gRngState_0:    .word gRngState
gRngState_1:    .word gRngState
rngConstant:    .word 0x873CA9E5
gRngState_2:    .word gRngState
