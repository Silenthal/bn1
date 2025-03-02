#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_ActivateProgAdv
    push       {lr}
    ldr        r7,PTR_PTR_SD_ActivateProgAdv_0_Init_08098780
    ldrb       r0,[r5,#ScreenDim_state_s0]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_SD_ActivateProgAdv_0_Init_08098780:
    .word PTR_SD_ActivateProgAdv_0_Init_08098784

PTR_SD_ActivateProgAdv_0_Init_08098784:
    .word SD_ActivateProgAdv_0_Init
    .word SD_ActivateProgAdv_1_ShowMessage
    .word SD_ActivateProgAdv_2_ShowEffect
    .word SD_ActivateProgAdv_3_FadeIn
    .word SD_ActivateProgAdv_4_Free


_ts SD_ActivateProgAdv_0_Init
    push       {lr}
    FadeOut_ScreenDim
    SD_SetTimer 0xc
    ldrb       r1,[r5,#ScreenDim_subFamily]
    SD_LoadMessage
    SD_ClearChipAndNext_A
    pop        {pc}


_nt SD_ActivateProgAdv_1_ShowMessage
    push       {lr}
    SD_ShowMessage
    tst        r0,r0
    bne        LAB_080987f4
    SD_HideMessage
    SD_DecreaseTimer
    bne        LAB_080987f4
    SD_SetTimer 0x8
    mov        r0,#0x8
    str        r0,[r5,#ScreenDim_state_s0]
LAB_080987f4:
    pop        {pc}


_nt SD_ActivateProgAdv_2_ShowEffect
    push       {lr}
    SD_DecreaseTimer
    bne        LAB_08098832
    SD_SetTimer 0x28
    LoadMain battle, r7, r7
    ldrb       r0,[r5,#ScreenDim_owner]
    lsl        r0,r0,#0x2
    add        r0,#0x40
    ldr        r7,[r7,r0]
    add        r7,#0x28
    ldmia      r7!,{r1,r2,r3}
    ldrb       r4,[r5,#ScreenDim_owner]
    lsl        r4,r4,#0x7
    add        r4,#0x2c
    push       {r5}
    bl         Effect_QuickEffect_Create
    tst        r5,r5
    beq        LAB_0809882c
    ldrb       r0,[r5,#ScreenDim_state_s0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r5,#ScreenDim_state_s0]
LAB_0809882c:
    pop        {r5}
    mov        r0,#0xc
    str        r0,[r5,#ScreenDim_state_s0]
LAB_08098832:
    pop        {pc}


_ts SD_ActivateProgAdv_3_FadeIn
    push       {lr}
    SD_DecreaseTimer
    bne        LAB_0809884e
    FadeIn_ScreenDim
    mov        r0,#0x10
    str        r0,[r5,#ScreenDim_state_s0]
LAB_0809884e:
    pop        {pc}


_ts SD_ActivateProgAdv_4_Free
    push       {lr}
    LoadMain fade, r0, r7
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0809886a
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_0809886a:
    pop        {pc}
