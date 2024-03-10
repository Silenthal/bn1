#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

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
    ldr        r0,=jumpTableSplashMain
    ldrb       r1,[r5,#0x0]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        { pc }

    .align 2, 0

jumpTableSplashMain:
    .word Splash_0_LoadCapcomLogo
    .word Splash_1_FadeIn
    .word Splash_2_Wait
    .word Splash_3_FadeOut
    .word Splash_4_End

_ts Splash_0_LoadCapcomLogo
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
    ldr        r0,=tilesetCapcomLogo
    ldr        r1,=0x6000020
    ldr        r2,=0x4D0
    bl         Dma_TransferListAdd
    ldr        r0,=paletteCapcomLogo
    ldr        r1,=eBgPalette0
    mov        r2,#0x78
    bl         Dma_TransferListAdd
    bl         Video_ClearScreenBuffersToValue
    ldr        r0,=tilemapCapcomLogo
    mov        r1,r10
    ldr        r1,[r1,#0x5c]
    ldr        r2,=0x800
    add        r1,r1,r2
    ldr        r2,=0x140
    bl         Dma_TransferListAdd
    mov        r0,#0x4
    mov        r1,#0xff
    bl         Fade_Request
    pop        { r5 }
    mov        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        { pc }

_ts Splash_1_FadeIn
    push       { lr }
    mov        r7,r10
    ldr        r0,[r7,#0x10]
    ldr        r1,=0x1f40
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

_ts Splash_2_Wait
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
    ldr        r1,=0x3FF
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

_ts Splash_3_FadeOut
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

_ts Splash_4_End
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
