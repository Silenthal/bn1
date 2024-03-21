#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .text

    .thumb

_ts Save_SaveGame
    push       { lr }
    bl         Save_CopyBuildId
    bl         Save_CalculateChecksum
    ldr        r0,PTR_DAT_0801fb24
    ldr        r1,PTR_SRAM_0801fb28
    ldr        r2,saveLen
    bl         MemCpySram
    ldr        r0,PTR_DAT_0801fb24
    ldr        r1,PTR_SRAM_0801fb28
    ldr        r2,saveLen
    bl         MemCmp_8_Sram
    push       { r0 }
    mov        r0,#0x9
    bl         Flag_Set400
    pop        { r0 }
    tst        r0,r0
    beq        LAB_0801fb10
    mov        r0,#0x9
    bl         Flag_Clear400
    mov        r0,#0x1
LAB_0801fb10:
    pop        { pc }

_ts Save_LoadGame
    push       { lr }
    ldr        r0,PTR_SRAM_0801fb28
    ldr        r1,PTR_DAT_0801fb24
    ldr        r2,saveLen
    bl         MemCpy_8_Sram
    pop        { pc }

    .align 2, 0

PTR_DAT_0801fb24:
    .word EWRAM_START
PTR_SRAM_0801fb28:
    .word SRAM_START
saveLen:
    .word 0x2308

_ts Save_CalculateChecksum
    mov        r7,r10
    ldr        r7,[r7,#0x78]
    mov        r0,#0x0
    str        r0,[r7,#0x20]
    mov        r0,#0x0
    ldr        r1,flagStart
    ldr        r2,INT_0801fb8c
LAB_0801fb3e:
    ldrb       r3,[r1,r2]
    add        r0,r0,r3
    sub        r2,#0x1
    bge        LAB_0801fb3e
    add        r0,#0x16
    str        r0,[r7,#0x20]
    mov        pc,lr

_ts Save_CopyBuildId
    push       { lr }
    ldr        r0,ptrRomBuildId
    mov        r1,r10
    ldr        r1,[r1,#0x78]
    add        r1,#0x2c
    mov        r2,#0x14
    bl         memcpy_8
    pop        { pc }

_ts Save_ChecksumCheck
    push       { lr }
    mov        r7,r10
    ldr        r7,[r7,#0x78]
    ldr        r6,[r7,#0x20]
    mov        r0,#0x0
    str        r0,[r7,#0x20]
    mov        r0,#0x0
    ldr        r1,flagStart
    ldr        r2,INT_0801fb8c
LAB_0801fb72:
    ldrb       r3,[r1,r2]
    add        r0,r0,r3
    sub        r2,#0x1
    bge        LAB_0801fb72
    add        r0,#0x16
    cmp        r0,r6
    bne        LAB_0801fb84
    mov        r0,#0x0
    pop        { pc }
LAB_0801fb84:
    mov        r0,#0x1
    pop        { pc }

flagStart:
    .word EWRAM_START
INT_0801fb8c:
    .word 0x2307

_ts Save_CheckBuildId
    push       { lr }
    ldr        r0,ptrRomBuildId
    mov        r1,r10
    ldr        r1,[r1,#0x78]
    add        r1,#0x2c
    mov        r2,#0x13
LAB_0801fb9c:
    ldrb       r3,[r1,r2]
    ldrb       r4,[r0,r2]
    cmp        r3,r4
    bne        LAB_0801fbac
    sub        r2,#0x1
    bge        LAB_0801fb9c
    mov        r0,#0x0
    pop        { pc }
LAB_0801fbac:
    mov        r0,#0x1
    pop        { pc }

ptrRomBuildId:
    .word romBuildId

romBuildId:
    .ascii "ROCKMAN EXE 20010727"
