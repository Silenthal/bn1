#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set FUN_0809bd28, 0x809bd28
    .set Sio_SetReady, 0x809bdf0
    .set Routine_ClearBetaSigmaTimer, 0x805738e
    @ .set gListMPStateAll, 0x
    @
    @ .set Routine_ClearBetaSigmaTimer, 0x
    @ .set gListMPStateAll, 0x
    @ .set Sio_SetReady, 0x
    @ .set gListMPStateAll, 0x
    @ .set gLatestMpInput, 0x
    @ .set gMPState0, 0x
    @ .set gMPState1, 0x
    @ .set gLatestMpInput, 0x
    @ .set gMPState0, 0x
    @ .set gMPState1, 0x
    @ .set gListMPStateAll, 0x
    @ .set gListMPStateAll, 0x


_ts FUN_08007828
    push       {lr}
    sub        sp,#0x8
    ldr        r0,PTR_PlayerMpState_080078c4
    ldr        r1,PTR_PlayerMpState_080078c0
    mov        r2,#0x10
    bl         memcpy_32
    mov        r0,#0xff
    strb       r0,[r5,#0x1e]
    ldr        r0,PTR_PlayerMpState_080078c0
    ldr        r1,PTR_gListMPStateAll_080078c8
    mov        r2,r10
    push       {r2,r5}
    bl         FUN_0809bd28
    pop        {r2,r5}
    mov        r10,r2
    add        r3,r0,#0x0
    mov        r1,#0xf
    and        r3,r1
    strb       r3,[r5,#0x1d]
    mov        r1,#0x80
    and        r0,r1
    cmp        r0,#0x80
    beq        LAB_080078a2
    push       {r1,r3}
    bl         SIO_GetMultiplayerId
    pop        {r1,r3}
    cmp        r0,#0x2
    bge        LAB_080078a2
    ldrb       r0,[r5,#0x1d]
    mov        r1,#0x3
    and        r0,r1
    cmp        r0,#0x3
    bne        LAB_080078a2
    bl         GetCompleteMPState
    add        r6,r0,#0x0
    add        r7,r1,#0x0
    ldrb       r2,[r7,#0x1]
    cmp        r2,#0xfd
    bne        LAB_080078a2
    ldrb       r1,[r6,#0x0]
    ldrb       r2,[r7,#0x0]
    cmp        r1,r2
    bne        LAB_0800789a
    mov        r0,#0xff
    strb       r0,[r6,#0x0]
    strb       r0,[r7,#0x0]
    lsl        r1,r1,#0x2
    ldr        r4,PTR_PTR_FUN_080078e4_080078cc
    ldr        r4,[r4,r1]
    mov        lr,pc
    bx         r4
    mov        r0,#0x0
    strh       r0,[r5,#0x30]
LAB_0800789a:
    mov        r0,#0xff
    strb       r0,[r6,#0x0]
    strb       r0,[r7,#0x0]
    b          LAB_080078bc
LAB_080078a2:
    ldrh       r0,[r5,#0x30]
    add        r0,#0x1
    strh       r0,[r5,#0x30]
    cmp        r0,#0x78
    bmi        LAB_080078bc
    mov        r0,#0xc
    strh       r0,[r5,#0x0]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
    mov        r0,#0xff
    strb       r0,[r5,#0x1d]
    bl         Sio_SetReady
LAB_080078bc:
    add        sp,#0x8
    pop        {pc}

    .align 2, 0

PTR_PlayerMpState_080078c0:
    .word 0x20037d0
PTR_PlayerMpState_080078c4:
    .word 0x200c1c0
PTR_gListMPStateAll_080078c8:
    .word gListMPStateAll
PTR_PTR_FUN_080078e4_080078cc:
    .word PTR_FUN_080078e4_080078d0
PTR_FUN_080078e4_080078d0:
    .word FUN_080078e4
    .word FUN_080078ec
    .word FUN_0800793c
    .word dummy_798a
    .word FUN_0800798e


_ts FUN_080078e4
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#0x1e]
    pop        {pc}


_ts FUN_080078ec
    push       {lr}
    mov        r4,r10
    ldr        r4,[r4,#0x20]
    ldrb       r0,[r6,#0x2]
    strb       r0,[r4,#0x9]
    ldrb       r0,[r6,#0x3]
    strb       r0,[r4,#0xa]
    ldrb       r0,[r6,#0x4]
    strb       r0,[r4,#0xb]
    ldrb       r0,[r6,#0xb]
    strb       r0,[r4,#0xf]
    ldrh       r0,[r6,#0x6]
    strh       r0,[r4,#0x26]
    ldrh       r0,[r6,#0x8]
    strh       r0,[r4,#0x28]
    add        r4,#0x70
    ldrb       r0,[r7,#0x2]
    strb       r0,[r4,#0x9]
    ldrb       r0,[r7,#0x3]
    strb       r0,[r4,#0xa]
    ldrb       r0,[r7,#0x4]
    strb       r0,[r4,#0xb]
    ldrb       r0,[r7,#0xb]
    strb       r0,[r4,#0xf]
    ldrh       r0,[r7,#0x6]
    strh       r0,[r4,#0x26]
    ldrh       r0,[r7,#0x8]
    strh       r0,[r4,#0x28]
    bl         SIO_GetMultiplayerId
    tst        r0,r0
    beq        LAB_08007930
    ldrb       r0,[r7,#0xa]
    strb       r0,[r5,#0xd]
LAB_08007930:
    mov        r0,#0x1
    strb       r0,[r5,#0x1e]
    pop        {pc}

    .align 2, 0

    .word 0x3004920


_ts FUN_0800793c
    push       {lr}
    mov        r4,r10
    ldr        r4,[r4,#0x20]
    ldrb       r0,[r6,#0x2]
    strb       r0,[r4,#0x1]
    add        r0,r6,#0x3
    mov        r1,#0x6a
    add        r1,r1,r4
    mov        r2,#0x6
    bl         memcpy_8
    ldrb       r0,[r6,#0x9]
    tst        r0,r0
    beq        LAB_08007962
    push       {r4,r5,r6,r7}
    mov        r0,#0x0
    bl         Routine_ClearBetaSigmaTimer
    pop        {r4,r5,r6,r7}
LAB_08007962:
    add        r4,#0x70
    ldrb       r0,[r7,#0x2]
    strb       r0,[r4,#0x1]
    add        r0,r7,#0x3
    mov        r1,#0x6a
    add        r1,r1,r4
    mov        r2,#0x6
    bl         memcpy_8
    ldrb       r0,[r7,#0x9]
    tst        r0,r0
    beq        LAB_08007984
    push       {r4,r5,r6,r7}
    mov        r0,#0x1
    bl         Routine_ClearBetaSigmaTimer
    pop        {r4,r5,r6,r7}
LAB_08007984:
    mov        r0,#0x2
    strb       r0,[r5,#0x1e]
    pop        {pc}


_nt dummy_798a
    push       {lr}
    pop        {pc}


_nt FUN_0800798e
    mov        r0,#0x4
    strb       r0,[r5,#0x1e]
    mov        pc,lr


_ts FUN_08007994
    push       {lr}
    ldr        r7,PTR_PlayerMpState_080079c4
    mov        r6,r10
    ldr        r6,[r6,#0x8]
    mov        r0,#0x1
    strb       r0,[r7,#0x0]
    mov        r0,#0xfd
    strb       r0,[r7,#0x1]
    ldrb       r0,[r6,#0x14]
    strb       r0,[r7,#0x2]
    ldrb       r0,[r6,#0x15]
    strb       r0,[r7,#0x3]
    ldrb       r0,[r6,#0x16]
    strb       r0,[r7,#0x4]
    ldrh       r0,[r6,#0x1e]
    strh       r0,[r7,#0x6]
    ldrh       r0,[r6,#0x1e]
    strh       r0,[r7,#0x8]
    ldrb       r0,[r6,#0x17]
    strb       r0,[r7,#0xb]
    ldrb       r0,[r5,#0xd]
    strb       r0,[r7,#0xa]
    pop        {pc}

    .align 2, 0

PTR_PlayerMpState_080079c4:
    .word 0x0200c1c0


_ts FUN_080079c8
    push       {lr}
    ldr        r7,PTR_PlayerMpState_08007a00
    mov        r6,r10
    ldr        r6,[r6,#0xc]
    mov        r0,#0x2
    strb       r0,[r7,#0x0]
    mov        r0,#0xfd
    strb       r0,[r7,#0x1]
    ldrb       r0,[r6,#0x19]
    strb       r0,[r7,#0x2]
    mov        r0,#0x78
    add        r0,r0,r6
    add        r1,r7,#0x3
    mov        r2,#0x6
    bl         memcpy_8
    mov        r0,#0x1
    ldr        r4,PTR_gCustomScreen_08007a04
    ldrb       r1,[r4,#0xf]
    tst        r1,r1
    bne        LAB_080079fa
    ldrb       r1,[r6,#0x11]
    tst        r1,r1
    bne        LAB_080079fa
    mov        r0,#0x0
LAB_080079fa:
    strb       r1,[r7,#0x9]
    pop        {pc}

    .align 2, 0

PTR_PlayerMpState_08007a00:
    .word 0x200c1c0
PTR_gCustomScreen_08007a04:
    .word gCustomScreen


_ts Multiplayer_UpdateKeyState
    push       {lr}
    mov        r7,r10
    ldr        r7,[r7,#0x20]
    ldr        r6,PTR_gListMpState_08007a34
    ldrb       r0,[r5,#0x1b]
    lsl        r1,r0,#0x4
    add        r6,r6,r1
    mov        r0,#0x0
    bl         Multiplayer_UpdatePlayerKeyState
    add        r7,#0x70
    ldr        r6,PTR_gListMpState_08007a34
    ldrb       r0,[r5,#0x1b]
    mov        r1,#0x1
    eor        r1,r0
    lsl        r1,r1,#0x4
    add        r6,r6,r1
    mov        r0,#0x1
    bl         Multiplayer_UpdatePlayerKeyState
    pop        {pc}

    .align 2, 0

PTR_gListMpState_08007a34:
    .word gListMpState
    .word 0x200C220


@@ Takes an input state and switches the key input for
@@ d-pad left and d-pad right. Done so that the
@@ other player sprite in multiplayer battles
@@ moves correctly
_ts KeyInput_FlipLeftRight
    mov        r1,#0x10
    and        r1,r0
    mov        r2,#0x20
    and        r2,r0
    mov        r3,#0x30
    bic        r0,r3
    lsl        r1,r1,#0x1
    lsr        r2,r2,#0x1
    orr        r1,r2
    orr        r0,r1
    mov        pc,lr


_nt Multiplayer_UpdatePlayerKeyState
    push       {lr}
    ldrb       r1,[r5,#0x1b]
    eor        r0,r1
    bne        LAB_08007a6a
    ldrh       r0,[r6,#0x2]
    ldrh       r1,[r7,#0x1e]
    bl         GetToggledKeys
    strh       r0,[r7,#0x1e]
    strh       r1,[r7,#0x24]
    strh       r2,[r7,#0x20]
    b          LAB_08007a96
LAB_08007a6a:
    ldrh       r0,[r7,#0x1e]
    bl         KeyInput_FlipLeftRight
    add        r1,r0,#0x0
    ldrh       r0,[r6,#0x2]
    bl         GetToggledKeys
    push       {r1,r2}
    bl         KeyInput_FlipLeftRight
    pop        {r1,r2}
    strh       r0,[r7,#0x1e]
    add        r0,r1,#0x0
    push       {r2}
    bl         KeyInput_FlipLeftRight
    pop        {r2}
    strh       r0,[r7,#0x24]
    add        r0,r2,#0x0
    bl         KeyInput_FlipLeftRight
    strh       r0,[r7,#0x20]
LAB_08007a96:
    pop        {pc}


_ts FUN_08007a98
    ldr        r7,PTR_PlayerMpState_08007aac
    mov        r4,#0x4
    strb       r4,[r7,#0x0]
    mov        r4,#0xfd
    strb       r4,[r7,#0x1]
    strb       r0,[r7,#0x2]
    strb       r1,[r7,#0x3]
    strb       r2,[r7,#0x4]
    strb       r3,[r7,#0x5]
    mov        pc,lr

    .align 2, 0

PTR_PlayerMpState_08007aac:
    .word 0x200c1c0


_ts GetCompleteMPState
    push       {lr}
    bl         SIO_GetMultiplayerId
    ldr        r7,PTR_gListMPStateAll_08007ac8
    add        r2,r0,#0x0
    lsl        r0,r2,#0x4
    add        r0,r0,r7
    mov        r1,#0x1
    eor        r2,r1
    lsl        r1,r2,#0x4
    add        r1,r1,r7
    pop        {pc}

    .align 2, 0

PTR_gListMPStateAll_08007ac8:
    .word gListMPStateAll


_ts FUN_08007acc
    push       {lr}
    ldr        r0,PTR_gLatestMpInput_08007b90
    ldr        r1,PTR_PlayerMpState_08007b80
    mov        r2,#0x10
    bl         memcpy_32
    ldr        r0,PTR_gLatestMpInput_08007b90
    ldr        r1,PTR_gMPState1_08007b98
    mov        r2,#0x10
    bl         memcpy_32
    ldr        r0,PTR_PlayerMpState_08007b80
    ldr        r1,PTR_gListMPStateAll_08007b84
    mov        r2,r10
    push       {r2,r4}
    bl         FUN_0809bd28
    pop        {r2,r4}
    mov        r10,r2
    mov        r1,#0xf
    and        r0,r1
    strb       r0,[r5,#0x1d]
    mov        r10,r2
    bl         GetCompleteMPState
    add        r7,r1,#0x0
    ldrb       r0,[r7,#0x0]
    cmp        r0,#0x80
    bne        LAB_08007b62
    ldr        r6,PTR_gMPState0_08007b94
    ldr        r0,[r6,#0xc]
    ldr        r1,[r7,#0xc]
    cmp        r0,r1
    bgt        LAB_08007b62
    add        r0,r7,#0x0
    ldr        r1,PTR_gListMpState_08007b8c
    ldrb       r2,[r5,#0x1b]
    mov        r3,#0x1
    eor        r2,r3
    lsl        r2,r2,#0x4
    add        r1,r1,r2
    mov        r2,#0x10
    bl         memcpy_32
    ldr        r0,PTR_gMPState0_08007b94
    ldr        r1,PTR_gListMpState_08007b8c
    ldrb       r2,[r5,#0x1b]
    lsl        r2,r2,#0x4
    add        r1,r1,r2
    mov        r2,#0x10
    bl         memcpy_32
    ldr        r0,PTR_gMPState1_08007b98
    ldr        r1,PTR_gMPState0_08007b94
    mov        r2,#0x10
    bl         memcpy_32
    mov        r6,r10
    ldr        r6,[r6,#0x4]
    ldr        r7,PTR_gLatestMpInput_08007b90
    ldrh       r0,[r6,#0x0]
    strh       r0,[r7,#0x2]
    ldrh       r0,[r6,#0x2]
    strh       r0,[r7,#0x4]
    ldrh       r0,[r6,#0x4]
    strh       r0,[r7,#0x6]
    ldrh       r0,[r6,#0x6]
    strh       r0,[r7,#0x8]
    ldr        r0,[r7,#0xc]
    add        r0,#0x1
    str        r0,[r7,#0xc]
    mov        r0,#0x0
    strh       r0,[r5,#0x30]
    mov        r0,#0x1
    b          LAB_08007b7e
LAB_08007b62:
    ldrh       r0,[r5,#0x30]
    add        r0,#0x1
    strh       r0,[r5,#0x30]
    cmp        r0,#0x3c
    bmi        LAB_08007b7c
    mov        r0,#0xc
    strh       r0,[r5,#0x0]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
    mov        r0,#0xff
    strb       r0,[r5,#0x1d]
    bl         Sio_SetReady
LAB_08007b7c:
    mov        r0,#0x0
LAB_08007b7e:
    pop        {pc}

    .align 2, 0

PTR_PlayerMpState_08007b80:
    .word 0x20037d0
PTR_gListMPStateAll_08007b84:
    .word gListMPStateAll
    .word 0x200c1c0
PTR_gListMpState_08007b8c:
    .word gListMpState
PTR_gLatestMpInput_08007b90:
    .word gLatestMpInput
PTR_gMPState0_08007b94:
    .word gMPState0
PTR_gMPState1_08007b98:
    .word gMPState1


_ts PlayerMPState_Init
    push       {lr}
    mov        r0,#0x0
    str        r0,[r5,#0x70]
    strh       r0,[r5,#0x30]
    strb       r0,[r5,#0x1d]
    ldr        r7,PTR_gLatestMpInput_08007bec
    mov        r0,#0x0
    str        r0,[r7,#0x0]
    str        r0,[r7,#0x4]
    str        r0,[r7,#0x8]
    str        r0,[r7,#0xc]
    mov        r0,#0x80
    strb       r0,[r7,#0x0]
    ldr        r7,PTR_gMPState0_08007bf0
    mov        r0,#0x0
    str        r0,[r7,#0x0]
    str        r0,[r7,#0x4]
    str        r0,[r7,#0x8]
    str        r0,[r7,#0xc]
    mov        r0,#0x80
    strb       r0,[r7,#0x0]
    ldr        r7,PTR_gMPState1_08007bf4
    mov        r0,#0x0
    str        r0,[r7,#0x0]
    str        r0,[r7,#0x4]
    str        r0,[r7,#0x8]
    str        r0,[r7,#0xc]
    mov        r0,#0x80
    strb       r0,[r7,#0x0]
    mov        r0,#0x1
    strb       r0,[r5,#0x1c]
    ldr        r0,PTR_gListMpState_08007bf8
    mov        r1,#0x20
    bl         memset0_32
    ldr        r0,PTR_gListMPStateAll_08007bfc
    mov        r1,#0x40
    bl         memset0_32
    pop        {pc}

    .align 2, 0

PTR_gLatestMpInput_08007bec:
    .word gLatestMpInput
PTR_gMPState0_08007bf0:
    .word gMPState0
PTR_gMPState1_08007bf4:
    .word gMPState1
PTR_gListMpState_08007bf8:
    .word gListMpState
PTR_gListMPStateAll_08007bfc:
    .word gListMPStateAll


_ts PlayerMPState_Free
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#0x1c]
    strh       r0,[r5,#0x30]
    ldr        r0,PTR_gListMPStateAll_08007c24
    mov        r1,#0x40
    bl         memset0_32
    ldr        r0,PTR_PlayerMpState_08007c28
    mov        r1,#0x10
    bl         memset0_32
    ldr        r7,PTR_PlayerMpState_08007c28
    mov        r0,#0x0
    strb       r0,[r7,#0x0]
    mov        r0,#0xfd
    strb       r0,[r7,#0x1]
    pop        {pc}

    .align 2, 0

PTR_gListMPStateAll_08007c24:
    .word gListMPStateAll
PTR_PlayerMpState_08007c28:
    .word 0x200c1c0
