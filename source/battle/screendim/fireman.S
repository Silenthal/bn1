#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_FireMan
    push       {lr}
    ldrb       r0,[r5,#ScreenDim_state_s0]
    ldr        r7,PTR_PTR_SD_Fireman_0_Init_08098888
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_SD_Fireman_0_Init_0809887c:
    .word SD_Fireman_0_Init
    .word SD_FireMan_1_Main
    .word SD_FireMan_2_Free

PTR_PTR_SD_Fireman_0_Init_08098888:
    .word PTR_SD_Fireman_0_Init_0809887c


_ts SD_Fireman_0_Init
    push       {lr}
    FadeOut_ScreenDim
    SD_SetTimer 0x1e
    ldrb       r1,[r5,#ScreenDim_subFamily]
    add        r1,#CD_FireMan
    SD_LoadMessage
    SD_ClearChipAndNext_B
    pop        {pc}


_ts SD_FireMan_1_Main
    push       {lr}
    ldrb       r0,[r5,#ScreenDim_state_s1]
    ldr        r7,PTR_PTR_SD_FireMan_1_0_ShowMessage_080988d8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_SD_FireMan_1_0_ShowMessage_080988cc:
    .word SD_FireMan_1_0_ShowMessage
    .word SD_FireMan_1_1_FireArm
    .word SD_FireMan_1_2_WarpOut

PTR_PTR_SD_FireMan_1_0_ShowMessage_080988d8:
    .word PTR_SD_FireMan_1_0_ShowMessage_080988cc


_ts SD_FireMan_1_0_ShowMessage
    push       {lr}
    SD_ShowMessage
    tst        r0,r0
    bne        LAB_08098912
    SD_HideMessage
    SD_DecreaseTimer
    bne        LAB_08098912
    bl         ScreenDim_WarpPlayerOut
    SD_SetTimer_B 0x1e
    mov        r0,#0x4
    strb       r0,[r5,#ScreenDim_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#ScreenDim_state_s2]
LAB_08098912:
    pop        {pc}


_ts SD_FireMan_1_1_FireArm
    push       {lr}
    SD_DecreaseTimer
    bne        LAB_08098946
    LoadMain battle, r7, r7
    ldrb       r0,[r5,#ScreenDim_owner]
    lsl        r1,r0,#0x2
    add        r1,#0x40
    ldr        r7,[r7,r1]
    ldrb       r1,[r7,#0x18]
    ldrb       r2,[r7,#0x19]
    ldrh       r6,[r5,#ScreenDim_damage]
    bl         Routine_FireMan_Chip_Create
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r7,#0x0]
    mov        r0,#0xde
    bl         Sound_PlaySE
    mov        r0,#0x8
    strb       r0,[r5,#ScreenDim_state_s1]
LAB_08098946:
    pop        {pc}


_ts SD_FireMan_1_2_WarpOut
    push       {lr}
    ldrb       r0,[r5,#ScreenDim_state_s3]
    tst        r0,r0
    beq        LAB_0809895e
    bl         ScreenDim_WarpPlayerIn
    mov        r0,#0x92
    bl         Sound_PlaySE
    mov        r0,#0x8
    str        r0,[r5,#ScreenDim_state_s0]
LAB_0809895e:
    pop        {pc}


_ts SD_FireMan_2_Free
    push       {lr}
    ldrb       r0,[r5,#ScreenDim_state_s1]
    tst        r0,r0
    bne        LAB_08098978
    FadeIn_ScreenDim
    mov        r0,#0x4
    strb       r0,[r5,#ScreenDim_state_s1]
LAB_08098978:
    LoadMain fade, r7, r7
    ldrb       r0,[r7,#0x3]
    cmp        r0,#0x1
    beq        LAB_0809898e
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_0809898e:
    pop        {pc}
