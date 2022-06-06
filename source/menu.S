#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set FUN_080194c8, 0x80194c8
    .set InitMainState0x58, 0x8001d0c
    
    .text

    .thumb

thumb_func_start InitMenu_0
InitMenu_0:
    mov        r0,#0x0
    b          InitMenu

non_word_aligned_thumb_func_start InitMenu_1
InitMenu_1:
    mov        r0,#0x1

non_word_aligned_thumb_func_start InitMenu
InitMenu:
    push       { lr }
    mov        r7,r10
    ldr        r5,[r7,#0x74]
    push       { r0, r5 }
    add        r0,r5,#0x0
    mov        r1,#0x54
    bl         memset0_32
    pop        { r0, r5 }
    strb       r0,[r5,#0x3]
    mov        r7,r10
    ldr        r7,[r7,#0x6c]
    ldrb       r0,[r7,#0x6]
    lsl        r0,r0,#0x2
    strb       r0,[r5,#0x0]
    mov        r0,#0x40
    bl         FUN_080194c8
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrh       r0,[r7,#0x4]
    strh       r0,[r7,#0xc]
    push       { r5 }
    bl         BgUpdate_Init
    bl         InitMainState0x58
    pop        { r5 }
    pop        { pc }
thumb_func_end InitMenu
thumb_func_end InitMenu_1
thumb_func_end InitMenu_0

thumb_func_start Menu_Main
Menu_Main:
    push       { lr }
    mov        r7,r10
    ldr        r5,[r7,#0x74]
    ldr        r0,PTR_JT_R5_74_19820_0801981c
    ldrb       r1,[r5,#0x0]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        { pc }
thumb_func_end Menu_Main

    .align 2, 0
PTR_JT_R5_74_19820_0801981c:
    .word JT_R5_74_19820
JT_R5_74_19820:
    .word 0x8019ea4+1 @ Menu_Folder_Main
    .word 0x801b404+1 @ Menu_Library_Main
    .word 0x801b954+1 @ Menu_MegaMan_Main
    .word 0x801c168+1 @ Menu_Email_Main
    .word 0x801c6f0+1 @ Menu_Item_Main
    .word 0x801cc88+1 @ Menu_Network_Main
    .word 0x801e4f4+1 @ Menu_Save_Main

    .end
