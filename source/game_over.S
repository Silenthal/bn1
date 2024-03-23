#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .text

_ts InitGameOver
    push       { lr }
    ldr        r5,PTR_gGameOverState_08020084
    push       { r0, r5 }
    add        r0,r5,#0x0
    mov        r1,#0x8
    bl         memset0_32
    pop        { r0, r5 }
    strb       r0,[r5,#0x6]
    pop        { pc }

_ts GameOver_Main
    push       { lr }
    ldr        r5,PTR_gGameOverState_08020088
    ldr        r0,PTR_jumpTableGameOver_0802008c
    ldrb       r1,[r5,#0x0]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r7,r10
    ldr        r7,[r7,#0x10]
    ldrh       r0,[r7,#0x10]
    sub        r0,#0x1
    strh       r0,[r7,#0x10]
    strh       r0,[r7,#0x12]
    pop        { pc }
jumpTableGameOver:
    .word GameOver_Init
    .word GameOver_DelayTillFadeOut
    .word GameOver_Finish

_ts GameOver_Init
    push       { lr }
    push       { r5 }
    bl         Text_DisableDialogue
    mov        r0,#0x6
    bl         Video_SetBgControl
    bl         Screen_LoadGameOver
    mov        r7,r10
    ldr        r0,[r7,#0x10]
    ldr        r1,PTR_DAT_08020090
    strh       r1,[r0,#0x0]
    mov        r1,#0x0
    strh       r1,[r0,#0x10]
    strh       r1,[r0,#0x12]
    strh       r1,[r0,#0x16]
    strh       r1,[r0,#0x14]
    strh       r1,[r0,#0x18]
    strh       r1,[r0,#0x1a]
    mov        r0,#0x3
    mov        r1,#0x10
    bl         Fade_Request
    mov        r0,#0x12
    bl         Sound_ChangeSong
    pop        { r5 }
    mov        r0,#0x4
    strb       r0,[r5,#0x0]
    mov        r0,#0xb4
    strh       r0,[r5,#0x4]
    pop        { pc }

_ts GameOver_DelayTillFadeOut
    push       { lr }
    ldrh       r0,[r5,#0x4]
    sub        r0,#0x1
    strh       r0,[r5,#0x4]
    cmp        r0,#0x0
    bgt        LAB_08020000
    push       { r5 }
    mov        r0,#0x4
    mov        r1,#0x8
    bl         Fade_Request
    pop        { r5 }
    mov        r0,#0x8
    strb       r0,[r5,#0x0]
LAB_08020000:
    pop        { pc }

_ts GameOver_Finish
    push       { lr }
    mov        r7,r10
    ldr        r0,[r7,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0802002a
    push       { r5 }
    bl         Main_Init
    pop        { r5 }
    mov        r7,r10
    ldr        r0,[r7,#0x0]
    mov        r1,#0x0
    strb       r1,[r0,#0x0]
    mov        r7,r10
    ldr        r0,[r7,#0x10]
    mov        r1,#0x40
    strh       r1,[r0,#0x0]
LAB_0802002a:
    pop        { pc }

_ts Screen_LoadGameOver
    push       { r5, lr }
    bl         Video_InitPaletteColor0
    bl         Video_ClearAllTile0Maps
    ldr        r0,PTR_tileset8GameOverText_08020094
    ldr        r1,PTR_DAT_08020098
    ldr        r2,DAT_0802009c
    bl         Dma_TransferListAdd
    ldr        r0,PTR_tilesetGameOverBG_080200a0
    ldr        r1,PTR_DAT_080200a4
    ldr        r2,DAT_080200a8
    bl         Dma_TransferListAdd
    ldr        r0,PTR_palette8GameOver_080200ac
    ldr        r1,PTR_eBgPalette0_080200b0
    ldr        r2,DAT_080200b4
    bl         memcpy_32
    ldr        r0,PTR_paletteGameOverBG_080200b8
    ldr        r1,PTR_eBgPaletteC_080200bc
    mov        r2,#0x20
    bl         memcpy_32
    bl         Video_ClearScreen
    ldr        r0,PTR_layoutGameOverText_080200c0
    mov        r1,r10
    ldr        r1,[r1,#0x5c]
    ldr        r2,INT_080200c4
    add        r1,r1,r2
    mov        r2,#0x40
    bl         Dma_TransferListAdd
    ldr        r0,PTR_layoutGameOverBG_080200c8
    mov        r1,r10
    ldr        r1,[r1,#0x5c]
    ldr        r2,DAT_080200cc
    add        r1,r1,r2
    ldr        r2,DAT_080200d0
    bl         Dma_TransferListAdd
    pop        { r5, pc }

PTR_gGameOverState_08020084:
    .word gGameOverState
PTR_gGameOverState_08020088:
    .word gGameOverState
PTR_jumpTableGameOver_0802008c:
    .word jumpTableGameOver
PTR_DAT_08020090:
    .word 0x1f40
PTR_tileset8GameOverText_08020094:
    .word tileset8GameOverText
PTR_DAT_08020098:
    .word 0x6004040
DAT_0802009c:
    .word 0x6C0
PTR_tilesetGameOverBG_080200a0:
    .word tilesetGameOverBG
PTR_DAT_080200a4:
    .word 0x6000020
DAT_080200a8:
    .word 0x100
PTR_palette8GameOver_080200ac:
    .word palette8GameOver
PTR_eBgPalette0_080200b0:
    .word eBgPalette0
DAT_080200b4:
    .word 0x120
PTR_paletteGameOverBG_080200b8:
    .word paletteGameOverBG
PTR_eBgPaletteC_080200bc:
    .word eBgPaletteC
PTR_layoutGameOverText_080200c0:
    .word layoutGameOverText
INT_080200c4:
    .word 0x1A00
PTR_layoutGameOverBG_080200c8:
    .word layoutGameOverBG
DAT_080200cc:
    .word 0x800
DAT_080200d0:
    .word 0x200
