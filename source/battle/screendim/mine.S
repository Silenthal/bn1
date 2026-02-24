#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_Mine
    push       {lr}
    ldrb       r0,[r5,#ScreenDim_state_s0]
    ldr        r7,PTR_PTR_SD_Mine_0_080998a4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_SD_Mine_0_08099898:
    .word SD_Mine_0
    .word SD_Mine_1
    .word SD_Mine_2

PTR_PTR_SD_Mine_0_080998a4:
    .word PTR_SD_Mine_0_08099898


_ts SD_Mine_0
    push       {lr}
    FadeOut_ScreenDim
    SD_SetTimer 0x1e
    ldrb       r0,[r5,#ScreenDim_subFamily]
    mov        r1,#0x3
    bl         Div
    add        r1,#CD_Mine1
    SD_LoadMessage
    SD_ClearChipAndNext_B
    pop        {pc}


_nt SD_Mine_1
    push       {lr}
    ldrb       r0,[r5,#ScreenDim_state_s1]
    ldr        r7,PTR_PTR_SD_Mine_1_0_080998fc
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_SD_Mine_1_0_080998ec:
    .word SD_Mine_1_0
    .word SD_Mine_1_1
    .word SD_Mine_1_2
    .word SD_Mine_1_3

PTR_PTR_SD_Mine_1_0_080998fc:
    .word PTR_SD_Mine_1_0_080998ec


_ts SD_Mine_1_0
    push       {lr}
    ldrb       r0,[r5,#ScreenDim_subFamily]
    mov        r1,#0x3
    bl         Div
    add        r1,#0x7c
    SD_ShowMessage
    tst        r0,r0
    bne        LAB_0809993c
    SD_HideMessage
    SD_DecreaseTimer
    bne        LAB_0809993c
    SD_SetTimer_B 0x3c
    mov        r0,#0x4
    strb       r0,[r5,#ScreenDim_state_s1]
    mov        r0,#0x0
    strb       r0,[r5,#ScreenDim_state_s3]
LAB_0809993c:
    pop        {pc}


_nt SD_Mine_1_1
    push       {lr}
    SD_DecreaseTimer
    bne        LAB_08099958
    push       {r5}
    ldrb       r3,[r5,#ScreenDim_owner]
    ldrb       r4,[r5,#ScreenDim_subFamily]
    bl         Attack_Mine_Create
    pop        {r5}
    mov        r0,#0x8
    strb       r0,[r5,#ScreenDim_state_s1]
LAB_08099958:
    pop        {pc}


_nt SD_Mine_1_2
    push       {lr}
    ldrb       r0,[r5,#ScreenDim_state_s3]
    tst        r0,r0
    beq        LAB_0809996a
    mov        r0,#0xc
    strb       r0,[r5,#ScreenDim_state_s1]
    SD_SetTimer 0x1e
LAB_0809996a:
    pop        {pc}


_ts SD_Mine_1_3
    push       {lr}
    SD_DecreaseTimer
    bne        LAB_0809997e
    mov        r0,#0x8
    strh       r0,[r5,#ScreenDim_state_s0]
    mov        r0,#0x0
    strh       r0,[r5,#ScreenDim_state_s2]
LAB_0809997e:
    pop        {pc}


_ts SD_Mine_2
    push       {lr}
    ldrb       r0,[r5,#ScreenDim_state_s1]
    tst        r0,r0
    bne        LAB_08099998
    FadeIn_ScreenDim
    mov        r0,#0x4
    strb       r0,[r5,#ScreenDim_state_s1]
LAB_08099998:
    LoadMain fade, r7, r7
    ldrb       r0,[r7,#FadeSettings_isFadeActive]
    cmp        r0,#0x1
    beq        LAB_080999ae
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_080999ae:
    pop        {pc}
