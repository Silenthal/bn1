#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set Text_DisableDialogue, 0x8013644
    .set SetTextPointer, 0x80135e8
    .set Screen_CopyLayoutRect, 0x8002230
    .set Screen_CopyEntry, 0x80021ac
    .set USHORT_ARRAY_0872b200, 0x872b200
    .set TextOption_IsFlagZero, 0x8013924

    .text

    .thumb

thumb_func_start InitDemo
InitDemo:
    push       { lr }
    mov        r7,r10
    ldr        r5,[r7,#0x40]
    push       { r0, r5 }
    add        r0,r5,#0x0
    mov        r1,#0x8
    bl         memset0_32
    pop        { r0, r5 }
    strb       r0,[r5,#0x6]
    pop        { pc }
thumb_func_end InitDemo
    .align 2, 0

thumb_func_start Demo_Main
Demo_Main:
    push       { lr }
    LoadStateTo r5, Main_demo
    ldr        r0,PTR_JT_R5_DemoState_1897C_08018bc0
    ldrb       r1,[r5,#Demo_m_state0]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        { pc }
thumb_func_end Demo_Main

    .align 2, 0
JT_R5_DemoState_1897C:
    .word Demo_Init
    .word Demo_State1
    .word Demo_Finish

thumb_func_start Demo_Init
Demo_Init:
    push       { lr }
    push       { r5 }
    bl         Text_DisableDialogue
    mov        r0,#BGC_Standard
    bl         Video_SetBgControl
    LoadStateTo r0, Main_displaySettings
    ldr        r1,PTR_DAT_08018bc4
    strh       r1,[r0,#DisplaySettings_dispcnt]
    bl         Video_ClearAllTile0Maps
    bl         Video_InitPaletteColor0
    mov        r0,#FT_FadeInFromBlack
    mov        r1,#0x10
    bl         Fade_Request
    pop        { r5 }
    mov        r0,#D_State_0_State1
    strb       r0,[r5,#Demo_m_state0]
    ldrb       r0,[r5,#Demo_m_b6]
    cmp        r0,#0x0
    beq        LAB_080189c0
    mov        r0,#D_State_1_State0
    strb       r0,[r5,#Demo_m_state1]
    b          LAB_080189c4
LAB_080189c0:
    mov        r0,#D_State_1_State1
    strb       r0,[r5,#Demo_m_state1]
LAB_080189c4:
    pop        { pc }
thumb_func_end Demo_Init

thumb_func_start Demo_State1
Demo_State1:
    push       { lr }
    ldr        r0,PTR_JT_R5_DemoState_189D8_08018bc8
    ldrb       r1,[r5,#Demo_m_state1]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        { pc }
thumb_func_end Demo_State1

    .align 2, 0
JT_R5_DemoState_189D8:
    .word Demo_SetToBeContinuedMessage
    .word Demo_FadeOutScreen
    .word Demo_ApplyVideoSettings
    .word Demo_ShowThankYouMessage
    .word Demo_WaitForTimer
    .word Demo_CleanUp

thumb_func_start Demo_Finish
Demo_Finish:
    push       { lr }
    push       { r5 }
    bl         Main_Init
    pop        { r5 }
    LoadStateTo r0, Main_manager
    mov        r1,#MS_Splash
    strb       r1,[r0,#Manager_m_gameState]
    LoadStateTo r0, Main_displaySettings
    mov        r1,#DISPCNT_OMAP1D
    strh       r1,[r0,#DisplaySettings_dispcnt]
    pop        { pc }
thumb_func_end Demo_Finish

thumb_func_start Demo_SetToBeContinuedMessage
Demo_SetToBeContinuedMessage:
    push       { lr }
    LoadStateTo r0, Main_fadeSettings, r0
    ldrb       r0,[r0,#FadeSettings_m_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08018a2a
    push       { r5 }
    ldr        r0,PTR_USHORT_ARRAY_08018bcc
    mov        r1,#0xb
    bl         SetTextPointer
    pop        { r5 }
    mov        r0,#D_State_1_State1
    strb       r0,[r5,#Demo_m_state1]
LAB_08018a2a:
    pop        { pc }
thumb_func_end Demo_SetToBeContinuedMessage

thumb_func_start Demo_FadeOutScreen
Demo_FadeOutScreen:
    push       { lr }
    push       { r5 }
    mov        r0,#0x80
    bl         TextOption_IsFlagZero
    pop        { r5 }
    bne        LAB_08018a4a
    push       { r5 }
    mov        r0,#FT_FadeOutToBlack
    mov        r1,#0xff
    bl         Fade_Request
    pop        { r5 }
    mov        r0,#D_State_1_State2
    strb       r0,[r5,#Demo_m_state1]
LAB_08018a4a:
    pop        { pc }
thumb_func_end Demo_FadeOutScreen

thumb_func_start Demo_ApplyVideoSettings
Demo_ApplyVideoSettings:
    push       { lr }
    LoadStateTo r0, Main_fadeSettings, r0
    ldrb       r0,[r0,#FadeSettings_m_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08018a92
    push       { r5 }
    mov        r0,#BGC_Standard
    bl         Video_SetBgControl
    pop        { r5 }
    LoadStateTo r0, Main_displaySettings
    mov        r1,#DISPCNT_OMAP1D
    strh       r1,[r0,#DisplaySettings_dispcnt]
    mov        r1,#0x0
    strh       r1,[r0,#DisplaySettings_bg0Hofs]
    strh       r1,[r0,#DisplaySettings_bg0Vofs]
    strh       r1,[r0,#DisplaySettings_bg1Hofs]
    strh       r1,[r0,#DisplaySettings_bg1Vofs]
    mov        r1,#0x0
    strh       r1,[r0,#DisplaySettings_bg2Hofs]
    ldr        r1,DAT_08018bd0
    ldr        r2,DAT_08018bd4
    and        r1,r2
    strh       r1,[r0,#DisplaySettings_bg2Vofs]
    mov        r1,#0x0
    strh       r1,[r0,#DisplaySettings_bg3Hofs]
    ldr        r1,DAT_08018bd8
    ldr        r2,DAT_08018bd4
    and        r1,r2
    strh       r1,[r0,#DisplaySettings_bg3Vofs]
    mov        r0,#D_State_1_State3
    strb       r0,[r5,#Demo_m_state1]
LAB_08018a92:
    pop        { pc }
thumb_func_end Demo_ApplyVideoSettings

thumb_func_start Demo_ShowThankYouMessage
Demo_ShowThankYouMessage:
    push       { lr }
    push       { r5 }
    bl         Video_LoadThankYouMessage
    bl         Layout_LoadThankYouMessageLayout
    pop        { r5 }
    push       { r5 }
    mov        r0,#0x3
    mov        r1,#0x8
    bl         Fade_Request
    pop        { r5 }
    mov        r7,r10
    ldr        r0,[r7,#0x10]
    ldr        r1,PTR_DAT_08018bdc
    strh       r1,[r0,#0x0]
    ldr        r0,DAT_08018be0
    strh       r0,[r5,#0x4]
    mov        r0,#0x10
    strb       r0,[r5,#0x1]
LAB_08018abe:
    pop        { pc }
thumb_func_end Demo_ShowThankYouMessage

thumb_func_start Demo_WaitForTimer
Demo_WaitForTimer:
    push       { lr }
    ldrh       r0,[r5,#0x4]
    sub        r0,#0x1
    strh       r0,[r5,#0x4]
    cmp        r0,#0x0
    bge        LAB_08018abe
    push       { r5 }
    mov        r0,#0x4
    mov        r1,#0x8
    bl         Fade_Request
    pop        { r5 }
    mov        r0,#0x14
    strb       r0,[r5,#0x1]
    pop        { pc }
thumb_func_end Demo_WaitForTimer

thumb_func_start Demo_CleanUp
Demo_CleanUp:
    push       { lr }
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08018af8
    mov        r0,#0x0
    strb       r0,[r5,#0x1]
    strb       r0,[r5,#0x2]
    mov        r0,#0x8
    strb       r0,[r5,#0x0]
LAB_08018af8:
    pop        { pc }
thumb_func_end Demo_CleanUp

thumb_func_start Video_LoadThankYouMessage
Video_LoadThankYouMessage:
    push       { lr }
    push       { r5 }
    ldr        r0,PTR_tileset8ThankYouMessage0_08018be4
    ldr        r1,PTR_DAT_08018be8
    ldr        r2,INT_08018bec
    bl         Dma_TransferListAdd
    ldr        r0,PTR_tileset8ThankYouMessage1_08018bf0
    ldr        r1,PTR_DAT_08018bf4
    ldr        r2,INT_08018bec
    bl         Dma_TransferListAdd
    ldr        r0,PTR_tileset8ThankYouMessage2_08018bf8
    ldr        r1,PTR_DAT_08018bfc
    ldr        r2,INT_08018c00
    bl         Dma_TransferListAdd
    ldr        r0,PTR_palette8ThankYouMessage_08018c04
    ldr        r1,PTR_eBgPalette0_08018c08
    mov        r2,#0x78
    bl         Dma_TransferListAdd
    pop        { r5 }
    pop        { pc }
thumb_func_end Video_LoadThankYouMessage

thumb_func_start Layout_LoadThankYouMessageLayout
Layout_LoadThankYouMessageLayout:
    push       { lr }
    mov        r0,#0x0
    mov        r1,#0x0
    mov        r2,#0x1
    mov        r3,#0x1e
    mov        r4,#0x14
    mov        r5,#0x0
    bl         Screen_CopyLayoutRect
    mov        r0,#0x0
    mov        r1,#0x0
    mov        r2,#0x2
    mov        r3,#0x1e
    mov        r4,#0x14
    mov        r5,#0x0
    bl         Screen_CopyLayoutRect
    mov        r0,#0x0
    mov        r1,#0x0
    mov        r2,#0x3
    mov        r3,#0x1e
    mov        r4,#0x14
    mov        r5,#0x0
    bl         Screen_CopyLayoutRect
    mov        r0,#0x0
    mov        r1,#0x0
    mov        r2,#0x1
    mov        r3,#0x1
LAB_08018b66:
    push       { r0, r1, r2, r3 }
    bl         Screen_CopyEntry
    pop        { r0, r1, r2, r3 }
    add        r3,#0x1
    add        r0,#0x1
    cmp        r0,#0x1e
    bne        LAB_08018b66
    add        r1,#0x1
    mov        r0,#0x0
    cmp        r1,#0x8
    bne        LAB_08018b66
    mov        r0,#0x0
    mov        r1,#0x0
    mov        r2,#0x2
    mov        r3,#0x1
LAB_08018b86:
    push       { r0, r1, r2, r3 }
    bl         Screen_CopyEntry
    pop        { r0, r1, r2, r3 }
    add        r3,#0x1
    add        r0,#0x1
    cmp        r0,#0x1e
    bne        LAB_08018b86
    add        r1,#0x1
    mov        r0,#0x0
    cmp        r1,#0x8
    bne        LAB_08018b86
    mov        r0,#0x0
    mov        r1,#0x0
    mov        r2,#0x3
    mov        r3,#0x1
LAB_08018ba6:
    push       { r0, r1, r2, r3 }
    bl         Screen_CopyEntry
    pop        { r0, r1, r2, r3 }
    add        r3,#0x1
    add        r0,#0x1
    cmp        r0,#0x1e
    bne        LAB_08018ba6
    add        r1,#0x1
    mov        r0,#0x0
    cmp        r1,#0x4
    bne        LAB_08018ba6
    pop        { pc }
thumb_func_end Layout_LoadThankYouMessageLayout

PTR_JT_R5_DemoState_1897C_08018bc0:     .word JT_R5_DemoState_1897C
PTR_DAT_08018bc4:                       .word 0x1140
PTR_JT_R5_DemoState_189D8_08018bc8:     .word JT_R5_DemoState_189D8
PTR_USHORT_ARRAY_08018bcc:              .word USHORT_ARRAY_0872b200
DAT_08018bd0:                           .word 0xFFFFFFC0
DAT_08018bd4:                           .word 0x000001FF
DAT_08018bd8:                           .word 0xFFFFFF80
PTR_DAT_08018bdc:                       .word 0x1f40
DAT_08018be0:                           .word 0x0000012C
PTR_tileset8ThankYouMessage0_08018be4:  .word tileset8ThankYouMessage0
PTR_DAT_08018be8:                       .word 0x6000040
INT_08018bec:                           .word 0xF00
PTR_tileset8ThankYouMessage1_08018bf0:  .word tileset8ThankYouMessage1
PTR_DAT_08018bf4:                       .word 0x6004040
PTR_tileset8ThankYouMessage2_08018bf8:  .word tileset8ThankYouMessage2
PTR_DAT_08018bfc:                       .word 0x6008040
INT_08018c00:                           .word 0x780
PTR_palette8ThankYouMessage_08018c04:   .word palette8ThankYouMessage
PTR_eBgPalette0_08018c08:               .word eBgPalette0
