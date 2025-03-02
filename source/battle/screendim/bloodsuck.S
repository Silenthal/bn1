#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_BloodSuck
    push       {lr}
    ldrb       r0,[r5,#ScreenDim_state_s0]
    ldr        r7,PTR_PTR_SD_BloodSuck_0_Init_0809bb44
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_SD_BloodSuck_0_Init_0809bb38:
    .word SD_BloodSuck_0_Init
    .word SD_BloodSuck_1_Main
    .word SD_BloodSuck_2_Free

PTR_PTR_SD_BloodSuck_0_Init_0809bb44:
    .word PTR_SD_BloodSuck_0_Init_0809bb38


_ts SD_BloodSuck_0_Init
    push       {lr}
    FadeOut_ScreenDim
    SD_SetTimer 0x1e
    ldrb       r1,[r5,#ScreenDim_subFamily]
    add        r1,#CD_PA_BloodSuck
    SD_LoadMessage
    SD_ClearChipAndNext_B
    pop        {pc}


_ts SD_BloodSuck_1_Main
    push       {lr}
    ldrb       r0,[r5,#ScreenDim_state_s1]
    ldr        r7,PTR_PTR_SD_BloodSuck_1_0_0809bb94
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_SD_BloodSuck_1_0_0809bb88:
    .word SD_BloodSuck_1_0
    .word SD_BloodSuck_1_1
    .word SD_BloodSuck_1_2

PTR_PTR_SD_BloodSuck_1_0_0809bb94:
    .word PTR_SD_BloodSuck_1_0_0809bb88


_ts SD_BloodSuck_1_0
    push       {lr}
    SD_ShowMessage
    tst        r0,r0
    bne        LAB_0809bbca
    SD_HideMessage
    SD_DecreaseTimer
    bne        LAB_0809bbca
    SD_SetTimer_B 0x1
    mov        r0,#0x4
    strb       r0,[r5,#ScreenDim_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#ScreenDim_state_s2]
LAB_0809bbca:
    pop        {pc}


_ts SD_BloodSuck_1_1
    push       {lr}
    SD_DecreaseTimer
    bne        LAB_0809bbf2
    LoadMain battle, r7, r7
    ldrb       r0,[r5,#ScreenDim_owner]
    lsl        r1,r0,#0x2
    add        r1,#0x40
    ldr        r7,[r7,r1]
    ldrb       r1,[r7,#0x18]
    ldrb       r2,[r7,#0x19]
    ldrh       r6,[r5,#ScreenDim_damage]
    mov        r4,#0x0
    bl         Routine_BloodSuck_Create
    mov        r0,#0x8
    strb       r0,[r5,#ScreenDim_state_s1]
LAB_0809bbf2:
    pop        {pc}


_ts SD_BloodSuck_1_2
    push       {lr}
    ldrb       r0,[r5,#ScreenDim_state_s3]
    tst        r0,r0
    beq        LAB_0809bc18
    ldrb       r0,[r5,#ScreenDim_state_s2]
    tst        r0,r0
    beq        LAB_0809bc14
    ldrb       r0,[r5,#ScreenDim_owner]
    bl         Field_GetActorById
    push       {r5}
    add        r5,r7,#0x0
    mov        r0,#0xc8
    bl         FieldObject_AddHp
    pop        {r5}
LAB_0809bc14:
    mov        r0,#0x8
    str        r0,[r5,#ScreenDim_state_s0]
LAB_0809bc18:
    pop        {pc}


_nt SD_BloodSuck_2_Free
    push       {lr}
    ldrb       r0,[r5,#ScreenDim_state_s1]
    tst        r0,r0
    bne        LAB_0809bc32
    FadeIn_ScreenDim
    mov        r0,#0x4
    strb       r0,[r5,#ScreenDim_state_s1]
LAB_0809bc32:
    LoadMain fade, r7, r7
    ldrb       r0,[r7,#FadeSettings_isFadeActive]
    cmp        r0,#0x1
    beq        LAB_0809bc48
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_0809bc48:
    pop        {pc}

    .align 2, 0

