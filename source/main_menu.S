#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set MainMenu_LoadTitleScreen, 0x0801093C

    .text

    .thumb

_ts InitMainMenu
    push       { lr }
    mov        r7,r10
    ldr        r0,[r7,#0x34]
    mov        r1,#0x10
    bl         memset0_32
    pop        { pc }

_ts MainMenu_Main
    push       { lr }
    mov        r7,r10
    ldr        r5,[r7,#0x34]
    ldr        r0,=jumpTableMainMenu
    ldrb       r1,[r5,#0x0]
    lsl        r1,r1,#0x2
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        { pc }

    .pool

jumpTableMainMenu:
    .word 0x08010460+1
    .word 0x080104D4+1
    .word 0x08010504+1

    .ascii "\x00\x01RNO/%1d,%1d,%1d,%1d"
    .align 2,0

_ts MainMenu_Init
    push       { lr }
    push       { r5 }
    mov        r0,#0x5
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
    bl         MainMenu_LoadTitleScreen
    mov        r0,#FT_FadeOutToBlack
    mov        r1,#0xff
    bl         Fade_Request
    pop        { r5 }
    mov        r0,#0x1
    strb       r0,[r5,#0x0]
    mov        r0,#T_Theme_Of_Mega_Man_Battle_Network
    bl         Sound_PlaySong
    mov        r0,#F400_SaveOk
    bl         Flag_Clear400
    mov        r0,#0x0
    push       { r0, r5 }
    bl         Save_LoadGame
    bl         Save_ChecksumCheck
    pop        { r0, r5 }
    bne        LAB_080104c8
    push       { r0, r5 }
    bl         Save_CheckBuildId
    pop        { r0, r5 }
    bne        LAB_080104c8
    mov        r0,#0x1
    push       { r0, r5 }
    mov        r0,#F400_SaveOk
    bl         Flag_Set400
    pop        { r0, r5 }
LAB_080104c8:
    strb       r0,[r5,#0xb]
    strb       r0,[r5,#0x8]
    mov        r0,#0x0
    strb       r0,[r5,#0x6]
    strb       r0,[r5,#0x7]
    pop        { pc }

    .end
