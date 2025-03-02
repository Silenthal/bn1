#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_Gauge
    push       {lr}
    ldr        r7,PTR_PTR_SD_Gauge_0_Init_08099db4
    ldrb       r0,[r5,#ScreenDim_state_s0]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_SD_Gauge_0_Init_08099db4:
    .word PTR_SD_Gauge_0_Init_08099db8

PTR_SD_Gauge_0_Init_08099db8:
    .word SD_Gauge_0_Init
    .word SD_Gauge_1
    .word SD_Gauge_2
    .word SD_Gauge_3


_ts SD_Gauge_0_Init
    push       {lr}
    FadeOut_ScreenDim
    SD_SetTimer 0x1e
    ldrb       r1,[r5,#ScreenDim_subFamily]
    add        r1,#CD_SloGauge
    SD_LoadMessage
    SD_ClearChipAndNext_A
    pop        {pc}


_ts SD_Gauge_1
    push       {lr}
    SD_ShowMessage
    tst        r0,r0
    bne        LAB_08099e3e
    SD_HideMessage
    SD_DecreaseTimer
    bne        LAB_08099e3e
    SD_SetTimer 0x46
    ldr        r7,PTR_listGaugeFactor_08099e40
    ldrb       r0,[r5,#ScreenDim_subFamily]
    ldrb       r0,[r7,r0]
    LoadMain battle, r7, r7
    strb       r0,[r7,#Battle_customGaugeSpeed]
    ldr        r7,PTR_PTR_Color_ARRAY_08099e44
    ldmia      r7!,{r0,r1,r2}
    push       {r5}
    bl         Dma_TransferListAdd
    pop        {r5}
    mov        r0,#0x8
    str        r0,[r5,#ScreenDim_state_s0]
LAB_08099e3e:
    pop        {pc}

PTR_listGaugeFactor_08099e40:
    .word listGaugeFactor

PTR_PTR_Color_ARRAY_08099e44:
    .word PTR_Color_ARRAY_08099e48

PTR_Color_ARRAY_08099e48:
    .word Color_ARRAY_086414d4

PTR_gObjPaletteD_08099e4c:
    .word gObjPaletteD

DAT_08099e50:
    .word 0x8

listGaugeFactor:
    .byte 0x10
    .byte 0x40

    .align 2, 0



_ts SD_Gauge_2
    push       {lr}
    mov        r0,#0x78
    mov        r1,#0xc
    mov        r2,#0x0
    mov        r3,#0x0
    bl         DrawTutorialArrow
    SD_DecreaseTimer
    bne        LAB_08099e7e
    FadeIn_ScreenDim
    mov        r0,#0xc
    str        r0,[r5,#ScreenDim_state_s0]
LAB_08099e7e:
    pop        {pc}


_ts SD_Gauge_3
    push       {lr}
    LoadMain fade, r0, r7
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08099e9a
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_08099e9a:
    pop        {pc}
