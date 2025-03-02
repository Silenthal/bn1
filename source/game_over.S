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
    LoadMain display, r7, r7
    ldrh       r0,[r7,#DisplaySettings_bg1Hofs]
    sub        r0,#0x1
    strh       r0,[r7,#DisplaySettings_bg1Hofs]
    strh       r0,[r7,#DisplaySettings_bg1Vofs]
    pop        { pc }
jumpTableGameOver:
    .word GameOver_0_Init
    .word GameOver_1_Main
    .word GameOver_2_Free

_ts GameOver_0_Init
    push       { lr }
    push       { r5 }
    bl         Text_DisableDialogue
    mov        r0,#0x6
    bl         Video_SetBgControl
    bl         GameOver_LoadGraphics
    LoadMain display, r0, r7
    ldr        r1,PTR_DAT_08020090
    strh       r1,[r0,#DisplaySettings_dispcnt]
    mov        r1,#0x0
    strh       r1,[r0,#DisplaySettings_bg1Hofs]
    strh       r1,[r0,#DisplaySettings_bg1Vofs]
    strh       r1,[r0,#DisplaySettings_bg2Vofs]
    strh       r1,[r0,#DisplaySettings_bg2Hofs]
    strh       r1,[r0,#DisplaySettings_bg3Hofs]
    strh       r1,[r0,#DisplaySettings_bg3Vofs]
    FadeIn_Black
    mov        r0,#T_Game_Over
    bl         Sound_PlayBGM
    pop        { r5 }
    mov        r0,#0x4
    strb       r0,[r5,#0x0]
    mov        r0,#0xb4
    strh       r0,[r5,#0x4]
    pop        { pc }

_ts GameOver_1_Main
    push       { lr }
    ldrh       r0,[r5,#0x4]
    sub        r0,#0x1
    strh       r0,[r5,#0x4]
    cmp        r0,#0x0
    bgt        LAB_08020000
    push       { r5 }
    FadeOutFast_Black
    pop        { r5 }
    mov        r0,#0x8
    strb       r0,[r5,#0x0]
LAB_08020000:
    pop        { pc }

_ts GameOver_2_Free
    push       { lr }
    LoadMain fade, r0, r7
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0802002a
    push       { r5 }
    bl         Main_Init
    pop        { r5 }
    LoadMain manager, r0, r7
    mov        r1,#0x0
    strb       r1,[r0,#Manager_gameState]
    LoadMain display, r0, r7
    mov        r1,#0x40
    strh       r1,[r0,#Manager_gameState]
LAB_0802002a:
    pop        { pc }

_ts GameOver_LoadGraphics
    push       { r5, lr }
    bl         Video_InitClearColor
    bl         Video_InitClearTile
    ldr        r0,PTR_tileset8GameOverText_08020094
    ldr        r1,PTR_DAT_08020098
    ldr        r2,DAT_0802009c
    bl         Dma_TransferListAdd
    ldr        r0,PTR_tilesetGameOverBG_080200a0
    ldr        r1,PTR_DAT_080200a4
    ldr        r2,DAT_080200a8
    bl         Dma_TransferListAdd
    ldr        r0,PTR_palette8GameOver_080200ac
    ldr        r1,PTR_gBgPalette0_080200b0
    ldr        r2,DAT_080200b4
    bl         memcpy_32
    ldr        r0,PTR_paletteGameOverBG_080200b8
    ldr        r1,PTR_gBgPaletteC_080200bc
    mov        r2,#0x20
    bl         memcpy_32
    bl         Video_ClearScreen
    ldr        r0,PTR_layoutGameOverText_080200c0
    LoadMain 92, r1, r1
    ldr        r2,INT_080200c4
    add        r1,r1,r2
    mov        r2,#0x40
    bl         Dma_TransferListAdd
    ldr        r0,PTR_layoutGameOverBG_080200c8
    LoadMain 92, r1, r1
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
PTR_gBgPalette0_080200b0:
    .word gBgPalette0
DAT_080200b4:
    .word 0x120
PTR_paletteGameOverBG_080200b8:
    .word paletteGameOverBG
PTR_gBgPaletteC_080200bc:
    .word gBgPaletteC
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
