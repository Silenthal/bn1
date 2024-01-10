#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set Entity_FreeAllMultiple, 0x80029ec
    .set tileSetCapcomLogo, 0x87afde8
    .set paletteCapcomLogo, 0x87b1128
    .set layoutCapcomLogo, 0x87b1148

    .text

    .thumb

@ Not used - main menu is intialized elsewhere
_ts InitMainMenu_2
    push       { lr }
    mov        r7,r10
    ldr        r0,[r7,#0x34]
    mov        r1,#0x10
    bl         memset0_32
    pop        { pc }
    .align 2, 0

_ts Splash_Main
    push       { lr }
    mov        r7,r10
    ldr        r5,[r7,#0x34]
    ldr        r0,PTR_jumpTableSplashMain_08018dc0
    ldrb       r1,[r5,#0x0]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        { pc }
        .align 2, 0
jumpTableSplashMain:
    .word LoadCapcomLogo
    .word FUN_08018d2c
    .word FUN_08018d4c
    .word FUN_08018d84
    .word FUN_08018d98

_ts LoadCapcomLogo
    push       { lr }
    push       { r5 }
    mov        r0,#0x3
    bl         Video_SetBgControl
    mov        r7,r10
    ldr        r0,[r7,#0x10]
    mov        r1,#0x40
    strh       r1,[r0,#0x0]
    mov        r1,#0x0
    strh       r1,[r0,#0xc]
    strh       r1,[r0,#0xe]
    strh       r1,[r0,#0x10]
    strh       r1,[r0,#0x12]
    strh       r1,[r0,#0x14]
    strh       r1,[r0,#0x16]
    strh       r1,[r0,#0x18]
    strh       r1,[r0,#0x1a]
    bl         Video_ClearAllTile0Maps
    ldr        r0,PTR_tileSetCapcomLogo_08018dc4
    ldr        r1,PTR_DAT_08018dc8

    ldr        r2,DAT_08018dcc
    bl         Dma_TransferListAdd
    ldr        r0,PTR_paletteCapcomLogo_08018dd0
    ldr        r1,PTR_eBgPalette0_08018dd4

    mov        r2,#0x78
    bl         Dma_TransferListAdd
    bl         Video_ClearScreenBuffersToValue
    ldr        r0,PTR_layoutCapcomLogo_08018dd8
    mov        r1,r10
    ldr        r1,[r1,#0x5c]
    ldr        r2,DAT_08018ddc
    add        r1,r1,r2
    ldr        r2,DAT_08018de0
    bl         Dma_TransferListAdd
    mov        r0,#0x4
    mov        r1,#0xff
    bl         Fade_Request
    pop        { r5 }
    mov        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        { pc }

_ts FUN_08018d2c
    push       { lr }
    mov        r7,r10
    ldr        r0,[r7,#0x10]
    ldr        r1,PTR_DAT_08018de4
    strh       r1,[r0,#0x0]
    push       { r5 }
    mov        r0,#0x3
    mov        r1,#0x10
    bl         Fade_Request
    pop        { r5 }
    mov        r0,#0x78
    strb       r0,[r5,#0x4]
    mov        r0,#0x8
    strb       r0,[r5,#0x0]
    pop        { pc }

_ts FUN_08018d4c
    push       { lr }
    mov        r7,r10
    ldr        r0,[r7,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08018d80
    mov        r7,r10
    ldr        r0,[r7,#0x4]
    ldrh       r0,[r0,#0x0]
    ldr        r1,DAT_08018de8
    and        r1,r0
    bne        LAB_08018d70
    ldrb       r0,[r5,#0x4]
    sub        r0,#0x1
    strb       r0,[r5,#0x4]
    cmp        r0,#0x0
    bgt        LAB_08018d80
LAB_08018d70:
    push       { r5 }
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        { r5 }
    mov        r0,#0xc
    strb       r0,[r5,#0x0]
LAB_08018d80:
    pop        { pc }

_ts FUN_08018d84
    push       { lr }
    mov        r7,r10
    ldr        r0,[r7,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08018d96
    mov        r0,#0x10
    strb       r0,[r5,#0x0]
LAB_08018d96:
    pop        { pc }

_ts FUN_08018d98
    push       { lr }
    push       { r5 }
    mov        r0,#0x1f
    bl         Entity_FreeAllMultiple
    pop        { r5 }
    mov        r7,r10
    ldr        r0,[r7,#0x0]
    mov        r1,#0x0
    strb       r1,[r0,#0x0]
    push       { r5 }
    bl         InitMainMenu
    pop        { r5 }
    mov        r7,r10
    ldr        r0,[r7,#0x10]
    mov        r1,#0x40
    strh       r1,[r0,#0x0]
    pop        { pc }
        
    .align 2, 0
PTR_jumpTableSplashMain_08018dc0:
    .word       jumpTableSplashMain
PTR_tileSetCapcomLogo_08018dc4:
    .word       tileSetCapcomLogo
PTR_DAT_08018dc8:
    .word       0x6000020
DAT_08018dcc:
    .word 0x4D0
PTR_paletteCapcomLogo_08018dd0:
    .word       paletteCapcomLogo
PTR_eBgPalette0_08018dd4:
    .word       eBgPalette0
PTR_layoutCapcomLogo_08018dd8:
    .word       layoutCapcomLogo
DAT_08018ddc:
    .word 0x800
DAT_08018de0:
    .word 0x140
PTR_DAT_08018de4:
    .word       0x1f40
DAT_08018de8:
    .word 0x3FF

    .end
