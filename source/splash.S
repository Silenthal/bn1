#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts InitSplash
    push       { lr }
    LoadMain mainMenu, r0, r7
    mov        r1,#0x10
    bl         memset0_32
    pop        { pc }
    .align 2, 0

_ts Splash_Main
    push       { lr }
    LoadMain mainMenu, r5, r7
    ldr        r0,=jumpTableSplashMain
    ldrb       r1,[r5,#MainMenu_state_s0]
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
    LoadMain display, r0, r7
    mov        r1,#0x40
    strh       r1,[r0,#DisplaySettings_dispcnt]
    mov        r1,#0x0
    strh       r1,[r0,#DisplaySettings_bg0Hofs]
    strh       r1,[r0,#DisplaySettings_bg0Vofs]
    strh       r1,[r0,#DisplaySettings_bg1Hofs]
    strh       r1,[r0,#DisplaySettings_bg1Vofs]
    strh       r1,[r0,#DisplaySettings_bg2Hofs]
    strh       r1,[r0,#DisplaySettings_bg2Vofs]
    strh       r1,[r0,#DisplaySettings_bg3Hofs]
    strh       r1,[r0,#DisplaySettings_bg3Vofs]
    bl         Video_InitClearTile
    ldr        r0,=tilesetCapcomLogo
    ldr        r1,=0x6000020
    ldr        r2,=0x4D0
    bl         Dma_TransferListAdd
    ldr        r0,=paletteCapcomLogo
    ldr        r1,=gBgPalette0
    mov        r2,#0x78
    bl         Dma_TransferListAdd
    bl         Video_ClearScreen
    ldr        r0,=tilemapCapcomLogo
    LoadMain 92, r1, r1
    ldr        r2,=0x800
    add        r1,r1,r2
    ldr        r2,=0x140
    bl         Dma_TransferListAdd
    Fade_Request FT_FadeOutToBlack, 0xff
    pop        { r5 }
    mov        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        { pc }

_ts Splash_1_FadeIn
    push       { lr }
    LoadMain display, r0, r7
    ldr        r1,=0x1f40
    strh       r1,[r0,#DisplaySettings_dispcnt]
    push       { r5 }
    FadeIn_Black
    pop        { r5 }
    mov        r0,#0x78
    strb       r0,[r5,#0x4]
    mov        r0,#0x8
    strb       r0,[r5,#0x0]
    pop        { pc }

_ts Splash_2_Wait
    push       { lr }
    LoadMain fade, r0, r7
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08018d80
    LoadMain input, r0, r7
    ldrh       r0,[r0,#Input_curKeyState]
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
    FadeOut_Black
    pop        { r5 }
    mov        r0,#0xc
    strb       r0,[r5,#0x0]
LAB_08018d80:
    pop        { pc }

_ts Splash_3_FadeOut
    push       { lr }
    LoadMain fade, r0, r7
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
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
    LoadMain manager, r0, r7
    mov        r1,#0x0
    strb       r1,[r0,#Manager_gameState]
    push       { r5 }
    bl         InitMainMenu
    pop        { r5 }
    LoadMain display, r0, r7
    mov        r1,#0x40
    strh       r1,[r0,#Manager_gameState]
    pop        { pc }
