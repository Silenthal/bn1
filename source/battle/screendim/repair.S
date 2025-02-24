#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_Repair
    push       {lr}
    ldr        r7,PTR_PTR_SD_Repair_0_Init_08098d68
    ldrb       r0,[r5,#ScreenDim_state_s0]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_SD_Repair_0_Init_08098d68:
    .word PTR_SD_Repair_0_Init_08098d6c

PTR_SD_Repair_0_Init_08098d6c:
    .word SD_Repair_0_Init
    .word SD_Repair_1_Main
    .word SD_Repair_2_FadeIn
    .word SD_Repair_3_Free


_ts SD_Repair_0_Init
    push       {lr}
    FadeOut_ScreenDim
    SD_SetTimer 0x1e
    ldrb       r1,[r5,#ScreenDim_subFamily]
    add        r1,#CD_Repair
    SD_LoadMessage
    SD_ClearChipAndNext_A
    pop        {pc}


_ts SD_Repair_1_Main
    push       {lr}
    SD_ShowMessage
    tst        r0,r0
    bne        LAB_08098e0c
    SD_HideMessage
    SD_DecreaseTimer
    bne        LAB_08098e0c
    sub        sp,#0x14
    mov        r0,sp
    ldr        r7,PTR_BYTE_ARRAY_08098e10
    ldrb       r3,[r5,#ScreenDim_owner]
    add        r7,r7,r3
    ldrb       r1,[r7,#0x0]
    ldrb       r2,[r7,#0x2]
    push       {r0}
    bl         Field_Search
    pop        {r7}
LAB_08098de8:
    sub        r1,#0x1
    bmi        LAB_08098dfc
    push       {r1,r7}
    ldrb       r0,[r7,r1]
    bl         Field_IndexToCellXY
    bl         Field_RepairPanel
    pop        {r1,r7}
    b          LAB_08098de8
LAB_08098dfc:
    add        sp,#0x14
    SD_SetTimer 0x3c
    mov        r0,#0x79
    bl         Sound_PlaySE
    mov        r0,#0x8
    str        r0,[r5,#ScreenDim_state_s0]
LAB_08098e0c:
    pop        {pc}

    .align 2, 0


PTR_BYTE_ARRAY_08098e10:
    .word BYTE_ARRAY_08098e14

BYTE_ARRAY_08098e14:
    .byte 0x00
    .byte 0x02

BYTE_ARRAY_08098e16:
    .byte 0x02
    .byte 0x00


_ts SD_Repair_2_FadeIn
    push       {lr}
    SD_DecreaseTimer
    bne        LAB_08098e32
    FadeIn_ScreenDim
    mov        r0,#0xc
    str        r0,[r5,#ScreenDim_state_s0]
LAB_08098e32:
    pop        {pc}


_ts SD_Repair_3_Free
    push       {lr}
    LoadMain fade, r0, r7
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08098e4e
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_08098e4e:
    pop        {pc}
