#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_SkullMan
    push       {lr}
    ldrb       r0,[r5,#ScreenDim_state_s0]
    ldr        r7,PTR_PTR_SD_SkullMan_0_0809a178
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_SD_SkullMan_0_0809a16c:
    .word SD_SkullMan_0
    .word SD_SkullMan_1
    .word SD_SkullMan_2

PTR_PTR_SD_SkullMan_0_0809a178:
    .word PTR_SD_SkullMan_0_0809a16c


_ts SD_SkullMan_0
    push       {lr}
    FadeOut_ScreenDim
    SD_SetTimer 0x1e
    ldrb       r1,[r5,#ScreenDim_subFamily]
    add        r1,#CD_SkullMan
    SD_LoadMessage
    SD_ClearChipAndNext_B
    pop        {pc}


_ts SD_SkullMan_1
    push       {lr}
    ldrb       r0,[r5,#ScreenDim_state_s1]
    ldr        r7,PTR_PTR_SD_SkullMan_1_0_0809a1c8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_SD_SkullMan_1_0_0809a1bc:
    .word SD_SkullMan_1_0
    .word SD_SkullMan_1_1
    .word SD_SkullMan_1_2

PTR_PTR_SD_SkullMan_1_0_0809a1c8:
    .word PTR_SD_SkullMan_1_0_0809a1bc


_ts SD_SkullMan_1_0
    push       {lr}
    SD_ShowMessage
    tst        r0,r0
    bne        LAB_0809a202
    SD_HideMessage
    SD_DecreaseTimer
    bne        LAB_0809a202
    bl         ScreenDim_WarpPlayerOut
    SD_SetTimer_B 0x1e
    mov        r0,#0x4
    strb       r0,[r5,#ScreenDim_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#ScreenDim_state_s2]
LAB_0809a202:
    pop        {pc}


_ts SD_SkullMan_1_1
    push       {lr}
    SD_DecreaseTimer
    bne        LAB_0809a238
    LoadMain battle, r7, r7
    ldrb       r0,[r5,#ScreenDim_owner]
    lsl        r0,r0,#0x2
    add        r0,#0x40
    ldr        r7,[r7,r0]
    ldrb       r1,[r7,#0x18]
    ldrb       r2,[r7,#0x19]
    ldrb       r0,[r5,#ScreenDim_owner]
    ldrh       r6,[r5,#ScreenDim_damage]
    bl         Routine_SkullMan_Chip_Create
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r7,#0x0]
    mov        r0,#0xde
    bl         Sound_PlaySE
    mov        r0,#0x8
    strb       r0,[r5,#ScreenDim_state_s1]
LAB_0809a238:
    pop        {pc}
    .byte 0x00
    .byte 0x00
    .word DAT_0809a240

DAT_0809a240:
    .byte 0x01
    .byte 0x03
    .byte 0x02

    .align 2, 0



_ts SD_SkullMan_1_2
    push       {lr}
    ldrb       r0,[r5,#ScreenDim_state_s3]
    tst        r0,r0
    beq        LAB_0809a25a
    bl         ScreenDim_WarpPlayerIn
    mov        r0,#0x92
    bl         Sound_PlaySE
    mov        r0,#0x8
    str        r0,[r5,#ScreenDim_state_s0]
LAB_0809a25a:
    pop        {pc}


_ts SD_SkullMan_2
    push       {lr}
    ldrb       r0,[r5,#ScreenDim_state_s1]
    tst        r0,r0
    bne        LAB_0809a274
    FadeIn_ScreenDim
    mov        r0,#0x4
    strb       r0,[r5,#ScreenDim_state_s1]
LAB_0809a274:
    LoadMain fade, r7, r7
    ldrb       r0,[r7,#FadeSettings_isFadeActive]
    cmp        r0,#0x1
    beq        LAB_0809a28a
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_0809a28a:
    pop        {pc}
