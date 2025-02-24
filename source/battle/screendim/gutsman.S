#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_GutsMan
    push       {lr}
    ldrb       r0,[r5,#ScreenDim_state_s0]
    ldr        r7,PTR_PTR_SD_GutsMan_0_08098adc
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_SD_GutsMan_0_08098ad0:
    .word SD_GutsMan_0
    .word SD_GutsMan_1
    .word SD_GutsMan_2

PTR_PTR_SD_GutsMan_0_08098adc:
    .word PTR_SD_GutsMan_0_08098ad0


_ts SD_GutsMan_0
    push       {lr}
    FadeOut_ScreenDim
    SD_SetTimer 0x1e
    ldrb       r1,[r5,#ScreenDim_subFamily]
    add        r1,#CD_GutsMan
    SD_LoadMessage
    SD_ClearChipAndNext_B
    pop        {pc}


_ts SD_GutsMan_1
    push       {lr}
    ldrb       r0,[r5,#ScreenDim_state_s1]
    ldr        r7,PTR_PTR_SD_GutsMan_1_0_08098b2c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_SD_GutsMan_1_0_08098b20:
    .word SD_GutsMan_1_0
    .word SD_GutsMan_1_1
    .word SD_GutsMan_1_2

PTR_PTR_SD_GutsMan_1_0_08098b2c:
    .word PTR_SD_GutsMan_1_0_08098b20


_ts SD_GutsMan_1_0
    push       {lr}
    SD_ShowMessage
    tst        r0,r0
    bne        LAB_08098b66
    SD_HideMessage
    SD_DecreaseTimer
    bne        LAB_08098b66
    bl         ScreenDim_WarpPlayerOut
    SD_SetTimer_B 0x1e
    mov        r0,#0x4
    strb       r0,[r5,#ScreenDim_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#ScreenDim_state_s2]
LAB_08098b66:
    pop        {pc}


_ts SD_GutsMan_1_1
    push       {lr}
    SD_DecreaseTimer
    bne        LAB_08098bae
    ldrb       r0,[r5,#ScreenDim_owner]
    ldr        r7,PTR_DAT_08098bb0
    add        r7,r7,r0
    ldrb       r1,[r7,#0x0]
    ldrb       r2,[r7,#0x2]
    LoadMain battle, r7, r7
    lsl        r3,r0,#0x2
    add        r3,#0x40
    ldr        r7,[r7,r3]
    ldrb       r4,[r7,#0x19]
    push       {r7}
    bl         Field_GetColumnInRowLeftToRight
    pop        {r7}
    add        r1,r0,#0x0
    ldrb       r2,[r7,#0x19]
    ldrb       r0,[r5,#ScreenDim_owner]
    ldrh       r6,[r5,#ScreenDim_damage]
    bl         Routine_GutsMan_Chip_Create
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r7,#0x0]
    mov        r0,#0xde
    bl         Sound_PlaySE
    mov        r0,#0x8
    strb       r0,[r5,#ScreenDim_state_s1]
LAB_08098bae:
    pop        {pc}

PTR_DAT_08098bb0:
    .word DAT_08098bb4

DAT_08098bb4:
    .byte 0x01
    .byte 0x03

DAT_08098bb6:
    .byte 0x02

    .align 2, 0



_ts SD_GutsMan_1_2
    push       {lr}
    ldrb       r0,[r5,#ScreenDim_state_s3]
    tst        r0,r0
    beq        LAB_08098bce
    bl         ScreenDim_WarpPlayerIn
    mov        r0,#0x92
    bl         Sound_PlaySE
    mov        r0,#0x8
    str        r0,[r5,#ScreenDim_state_s0]
LAB_08098bce:
    pop        {pc}


_ts SD_GutsMan_2
    push       {lr}
    ldrb       r0,[r5,#ScreenDim_state_s1]
    tst        r0,r0
    bne        LAB_08098be8
    FadeIn_ScreenDim
    mov        r0,#0x4
    strb       r0,[r5,#ScreenDim_state_s1]
LAB_08098be8:
    LoadMain fade, r7, r7
    ldrb       r0,[r7,#0x3]
    cmp        r0,#0x1
    beq        LAB_08098bfe
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_08098bfe:
    pop        {pc}
