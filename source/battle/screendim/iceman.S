#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_IceMan
    push       {lr}
    ldrb       r0,[r5,#ScreenDim_state_s0]
    ldr        r7,PTR_PTR_SD_IceMan_0_08099274
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_SD_IceMan_0_08099268:
    .word SD_IceMan_0
    .word SD_IceMan_1
    .word SD_IceMan_2

PTR_PTR_SD_IceMan_0_08099274:
    .word PTR_SD_IceMan_0_08099268


_ts SD_IceMan_0
    push       {lr}
    FadeOut_ScreenDim
    SD_SetTimer 0x1e
    ldrb       r1,[r5,#ScreenDim_subFamily]
    add        r1,#CD_IceMan
    SD_LoadMessage
    SD_ClearChipAndNext_B
    pop        {pc}


_ts SD_IceMan_1
    push       {lr}
    ldrb       r0,[r5,#ScreenDim_state_s1]
    ldr        r7,PTR_PTR_SD_IceMan_1_0_080992c4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_SD_IceMan_1_0_080992b8:
    .word SD_IceMan_1_0
    .word SD_IceMan_1_1
    .word SD_IceMan_1_2

PTR_PTR_SD_IceMan_1_0_080992c4:
    .word PTR_SD_IceMan_1_0_080992b8


_ts SD_IceMan_1_0
    push       {lr}
    SD_ShowMessage
    tst        r0,r0
    bne        LAB_080992fe
    SD_HideMessage
    SD_DecreaseTimer
    bne        LAB_080992fe
    bl         ScreenDim_WarpPlayerOut
    SD_SetTimer_B 0x1e
    mov        r0,#0x4
    strb       r0,[r5,#ScreenDim_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#ScreenDim_state_s2]
LAB_080992fe:
    pop        {pc}


_ts SD_IceMan_1_1
    push       {lr}
    SD_DecreaseTimer
    bne        LAB_08099334
    LoadMain battle, r7, r7
    ldrb       r0,[r5,#ScreenDim_owner]
    lsl        r0,r0,#0x2
    add        r0,#0x40
    ldr        r7,[r7,r0]
    ldrb       r1,[r7,#0x18]
    ldrb       r2,[r7,#0x19]
    ldrb       r0,[r5,#ScreenDim_owner]
    ldrh       r6,[r5,#ScreenDim_damage]
    bl         Routine_IceMan_Chip_Create
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r7,#0x0]
    mov        r0,#0xde
    bl         Sound_PlaySE
    mov        r0,#0x8
    strb       r0,[r5,#ScreenDim_state_s1]
LAB_08099334:
    pop        {pc}

    .align 2, 0

    .word DAT_0809933c

DAT_0809933c:
    .byte 0x01
    .byte 0x03
    .byte 0x02

    .align 2, 0



_ts SD_IceMan_1_2
    push       {lr}
    ldrb       r0,[r5,#ScreenDim_state_s3]
    tst        r0,r0
    beq        LAB_08099356
    bl         ScreenDim_WarpPlayerIn
    mov        r0,#0x92
    bl         Sound_PlaySE
    mov        r0,#0x8
    str        r0,[r5,#ScreenDim_state_s0]
LAB_08099356:
    pop        {pc}


_ts SD_IceMan_2
    push       {lr}
    ldrb       r0,[r5,#ScreenDim_state_s1]
    tst        r0,r0
    bne        LAB_08099370
    FadeIn_ScreenDim
    mov        r0,#0x4
    strb       r0,[r5,#ScreenDim_state_s1]
LAB_08099370:
    LoadMain fade, r7, r7
    ldrb       r0,[r7,#FadeSettings_isFadeActive]
    cmp        r0,#0x1
    beq        LAB_08099386
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_08099386:
    pop        {pc}
