
#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

_nt Passcode_Init
    push       {lr}
    mov        r7,r10
    ldr        r5,[r7,#0x64]
    push       {r0,r1,r5}
    add        r0,r5,#0x0
    mov        r1,#0x1c
    bl         memset0_32
    pop        {r0,r1,r5}
    strb       r0,[r5,#0x4]
    tst        r0,r0
    bne        LAB_08018e06
    b          LAB_08018e0a
LAB_08018e06:
    bl         Passcode_GetRandomValue
LAB_08018e0a:
    strb       r1,[r5,#0x10]
    mov        r0,#0x0
    strb       r0,[r5,#0x5]
    mov        r0,#0x80
    strb       r0,[r5,#0x6]
    add        r0,r1,#0x0
    mov        r1,#0x14
    bl         Passcode_SetDigits
    ldrb       r0,[r5,#0x5]
    mov        r1,#0x8
    bl         Passcode_SetDigits
    ldrh       r0,[r5,#0x8]
    strh       r0,[r5,#0xa]
    push       {r5}
    ldr        r0,=tilesetPasscodeBox
    ldr        r1,=0x6016600
    ldr        r2,=0x200
    bl         Dma_TransferListAdd
    ldr        r0,=tilesetPasscodeCursor
    ldr        r1,=0x6016E00
    mov        r2,#0x80
    bl         Dma_TransferListAdd
    ldr        r0,=palettePasscode
    ldr        r1,=eObjPaletteC
    mov        r2,#0x8
    bl         Dma_TransferListAdd
    pop        {r5}
    pop        {pc}


_nt Passcode_HandleEntry
    push       {lr}
    mov        r7,r10
    ldr        r5,[r7,#0x64]
    ldrb       r1,[r5,#0x7]
    strb       r1,[r5,#0x17]
    strb       r0,[r5,#0x16]
    tst        r0,r0
    bne        LAB_08018e60
    bl         Passcode_CheckKeyInput
LAB_08018e60:
    mov        r0,#0x8
    mov        r1,#0x5
    bl         Passcode_SetValueFromDigits
    bl         Passcode_DrawGuess
    ldrb       r0,[r5,#0x11]
    ldrb       r1,[r5,#0x12]
    pop        {pc}


_ts Passcode_DrawGuess
    push       {lr}
    ldrb       r0,[r5,#0xc]
    cmp        r0,#0x1
    ble        LAB_08018e84
    mov        r7,#0x0
    sub        r0,#0x1
    strb       r0,[r5,#0xc]
    b          LAB_08018e9a
LAB_08018e84:
    mov        r7,#0xa
    ldrb       r0,[r5,#0x8]
    strb       r0,[r5,#0xa]
    ldrb       r0,[r5,#0xe]
    tst        r0,r0
    beq        LAB_08018e96
    sub        r0,#0x1
    strb       r0,[r5,#0xe]
    b          LAB_08018e9a
LAB_08018e96:
    mov        r0,#0x0
    strb       r0,[r5,#0xc]
LAB_08018e9a:
    lsl        r7,r7,#0x8
    ldrb       r1,[r5,#0xa]
    lsl        r1,r1,#0x8
    add        r1,r1,r7
    push       {r5}
    ldr        r0,=tilesetPasscodeNumbers
    add        r0,r0,r1
    ldr        r1,=0x6017000
    mov        r2,#0x40
    bl         Dma_TransferListAdd
    pop        {r5}
    ldrb       r0,[r5,#0xd]
    cmp        r0,#0x1
    ble        LAB_08018ec0
    mov        r7,#0x0
    sub        r0,#0x1
    strb       r0,[r5,#0xd]
    b          LAB_08018ed6
LAB_08018ec0:
    mov        r7,#0xa
    ldrb       r0,[r5,#0x9]
    strb       r0,[r5,#0xb]
    ldrb       r0,[r5,#0xf]
    tst        r0,r0
    beq        LAB_08018ed2
    sub        r0,#0x1
    strb       r0,[r5,#0xf]
    b          LAB_08018ed6
LAB_08018ed2:
    mov        r0,#0x0
    strb       r0,[r5,#0xd]
LAB_08018ed6:
    lsl        r7,r7,#0x8
    ldrb       r1,[r5,#0xb]
    lsl        r1,r1,#0x8
    add        r1,r1,r7
    push       {r5}
    ldr        r0,=tilesetPasscodeNumbers
    add        r0,r0,r1
    ldr        r1,=0x6017100
    mov        r2,#0x40
    bl         Dma_TransferListAdd
    pop        {r5}
    push       {r5}
    ldr        r0,=0x80688030
    ldr        r1,=0xC380
    mov        r2,#0x0
    mov        r3,#0x0
    bl         Oam_AddObject
    ldr        r0,=0x80788030
    ldr        r1,=0xC388
    mov        r2,#0x0
    mov        r3,#0x0
    bl         Oam_AddObject
    pop        {r5}
    push       {r5}
    ldr        r0,=0xC0600020
    ldr        r1,=0xC330
    mov        r2,#0x0
    mov        r3,#0x0
    bl         Oam_AddObject
    pop        {r5}
    ldrb       r0,[r5,#0x16]
    tst        r0,r0
    beq        LAB_08018f26
    mov        r0,#0x0
    strb       r0,[r5,#0x13]
    b          LAB_08018f58
LAB_08018f26:
    ldrb       r0,[r5,#0x17]
    ldrb       r1,[r5,#0x7]
    cmp        r0,r1
    bne        LAB_08018f3e
    ldrb       r0,[r5,#0x13]
    add        r0,#0x1
    strb       r0,[r5,#0x13]
    mov        r2,#0x1f
    and        r0,r2
    cmp        r0,#0x14
    bge        LAB_08018f58
    b          LAB_08018f42
LAB_08018f3e:
    mov        r0,#0x0
    strb       r0,[r5,#0x13]
LAB_08018f42:
    lsl        r1,r1,#0x14
    push       {r5}
    ldr        r0,=0x8064002C
    add        r0,r0,r1
    ldr        r1,=0xC370
    mov        r2,#0x0
    mov        r3,#0x0
    bl         Oam_AddObject
    pop        {r5}
    pop        {pc}
LAB_08018f58:
    pop        {pc}


_ts Passcode_CheckKeyInput
    push       {lr}
    mov        r7,r10
    ldr        r7,[r7,#0x4]
    ldrh       r0,[r7,#0x4]
    mov        r1,#0xc0
    tst        r1,r0
    beq        LAB_08018f70
    bl         Passcode_ChangeDigitValue
    b          LAB_08018fac
LAB_08018f70:
    mov        r1,#0x30
    tst        r1,r0
    beq        LAB_08018f82
    mov        r0,#0x66
    bl         Sound_PlaySongImmediate
    bl         Passcode_SelectDigit
    b          LAB_08018fac
LAB_08018f82:
    mov        r7,r10
    ldr        r7,[r7,#0x4]
    ldrh       r0,[r7,#0x2]
    mov        r1,#0x1
    tst        r1,r0
    beq        LAB_08018f9a
    mov        r0,#0x67
    bl         Sound_PlaySongImmediate
    bl         Passcode_VerifyGuess
    b          LAB_08018fac
LAB_08018f9a:
    mov        r1,#0x2
    tst        r1,r0
    beq        LAB_08018fac
    mov        r0,#0x68
    bl         Sound_PlaySongImmediate
    bl         Passcode_HandleCancel
    b          LAB_08018fac
LAB_08018fac:
    pop        {pc}


_ts Passcode_ChangeDigitValue
    ldrb       r2,[r5,#0x7]
    add        r4,r2,#0x0
    add        r6,r2,#0x0
    add        r2,#0x8
    add        r4,#0xc
    add        r6,#0xe
    ldrb       r3,[r5,r2]
    ldrh       r7,[r5,#0xc]
    tst        r7,r7
    bne        LAB_08018ffe
    mov        r1,#0x40
    tst        r1,r0
    beq        LAB_08018fe2
    push       {r0}
    mov        r0,#0x66
    bl         Sound_PlaySongImmediate
    pop        {r0}
    mov        r7,#0x4
    strb       r7,[r5,r4]
    strb       r7,[r5,r6]
    add        r3,#0x1
    cmp        r3,#0xa
    blt        LAB_08018fe2
    mov        r3,#0x0
LAB_08018fe2:
    mov        r1,#0x80
    tst        r1,r0
    beq        LAB_08018ffe
    push       {r0}
    mov        r0,#0x66
    bl         Sound_PlaySongImmediate
    pop        {r0}
    mov        r7,#0x4
    strb       r7,[r5,r4]
    strb       r7,[r5,r6]
    sub        r3,#0x1
    bpl        LAB_08018ffe
    mov        r3,#0x9
LAB_08018ffe:
    strb       r3,[r5,r2]
    mov        r1,#0x0
    strb       r1,[r5,#0x11]
    strb       r1,[r5,#0x12]
    pop        {pc}


_nt Passcode_SelectDigit
    ldrb       r2,[r5,#0x7]
    mov        r3,#0x1
    eor        r2,r3
    strb       r2,[r5,#0x7]
    mov        r1,#0x0
    strb       r1,[r5,#0x11]
    strb       r1,[r5,#0x12]
    pop        {pc}


_nt Passcode_VerifyGuess
    ldrb       r2,[r5,#0x5]
    ldrb       r3,[r5,#0x10]
    cmp        r2,r3
    beq        LAB_08019024
    blt        LAB_08019028
    bgt        LAB_08019042
LAB_08019024:
    mov        r1,#0x6
    b          LAB_0801905a
LAB_08019028:
    mov        r1,#0x0
    ldrb       r2,[r5,#0x8]
    ldrb       r3,[r5,#0x14]
    cmp        r2,r3
    bne        LAB_08019036
    mov        r1,#0x2
    b          LAB_0801905a
LAB_08019036:
    ldrb       r2,[r5,#0x9]
    ldrb       r3,[r5,#0x15]
    cmp        r2,r3
    bne        LAB_0801905a
    mov        r1,#0x3
    b          LAB_0801905a
LAB_08019042:
    mov        r1,#0x1
    ldrb       r2,[r5,#0x8]
    ldrb       r3,[r5,#0x14]
    cmp        r2,r3
    bne        LAB_08019050
    mov        r1,#0x4
    b          LAB_0801905a
LAB_08019050:
    ldrb       r2,[r5,#0x9]
    ldrb       r3,[r5,#0x15]
    cmp        r2,r3
    bne        LAB_0801905a
    mov        r1,#0x5
LAB_0801905a:
    strb       r1,[r5,#0x12]
    mov        r1,#0x1
    strb       r1,[r5,#0x11]
    pop        {pc}


_ts Passcode_HandleCancel
    mov        r1,#0x2
    strb       r1,[r5,#0x11]
    mov        r1,#0x0
    strb       r1,[r5,#0x12]
    pop        {pc}


_ts Passcode_SetDigits
    add        r1,r1,r5
    mov        r6,#0x0
    ldr        r2,=INT_ARRAY_08019094
    mov        r7,#0x0
LAB_08019078:
    ldr        r3,[r2,r6]
    mov        r4,#0x0
LAB_0801907c:
    cmp        r3,r0
    bgt        LAB_08019086
    sub        r0,r0,r3
    add        r4,#0x1
    b          LAB_0801907c
LAB_08019086:
    add        r7,#0x1
    strb       r4,[r1,#0x0]
    add        r1,#0x1
    add        r6,#0x4
    cmp        r6,#0x8
    blt        LAB_08019078
    mov        pc,lr
INT_ARRAY_08019094:
    .word 10
    .word 1

FUN_0801909c:
    pop        {pc}


_ts Passcode_SetValueFromDigits
    ldrb       r2,[r5,r0]
    mov        r3,#0xa
    mul        r3,r2
    add        r0,#0x1
    ldrb       r2,[r5,r0]
    add        r2,r2,r3
    strb       r2,[r5,r1]
    mov        pc,lr


_nt Passcode_GetRandomValue
    push       {r5,lr}
    mov        r7,r10
    ldr        r0,[r7,#0x50]
    ldrh       r0,[r0,#0x0]
    ldr        r1,=0xFFF
    and        r0,r1
    mov        r1,#0x64
    bl         Divide
    cmp        r1,#0x63
    ble        LAB_080190c8
    mov        r1,#0x63
LAB_080190c8:
    pop        {r5,pc}


_ts Passcode_InitPickResult
    mov        r7,r10
    ldr        r5,[r7,#0x64]
    mov        r1,#0x0
    strb       r1,[r5,#0x11]
    mov        r1,#0x0
    strb       r1,[r5,#0x12]
    mov        pc,lr


_ts Passcode_ShiftDigit
    push       {lr}
    mov        r7,r10
    ldr        r5,[r7,#0x64]
    ldrb       r2,[r5,#0x18]
    add        r2,#0x1
    strb       r2,[r5,#0x18]
    cmp        r2,#0x6
    blt        LAB_0801912a
    push       {r5}
    bl         Rng_RandomUint
    add        r1,r0,#0x0
    pop        {r5}
    mov        r2,#0x1
    and        r2,r1
    lsl        r3,r2,#0x1
    add        r2,#0x14
    ldrb       r4,[r5,r2]
    lsr        r1,r1,#0x1
    mov        r6,#0x7
    and        r6,r1
    add        r6,#0x1
    add        r7,r4,r6
    cmp        r7,#0x9
    ble        LAB_08019110
    sub        r7,#0xa
LAB_08019110:
    strb       r7,[r5,r2]
    cmp        r4,r7
    ble        LAB_08019118
    add        r3,#0x1
LAB_08019118:
    mov        r1,#0x0
    strb       r1,[r5,#0x18]
    push       {r3}
    mov        r0,#0x14
    mov        r1,#0x10
    bl         Passcode_SetValueFromDigits
    pop        {r0}
    pop        {pc}
LAB_0801912a:
    mov        r0,#0xff
    pop        {pc}

    .end
