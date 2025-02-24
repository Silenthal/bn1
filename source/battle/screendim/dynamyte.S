#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_Dynamyte
    push       {lr}
    ldr        r7,PTR_PTR_SD_Dynamyte_0_0809af80
    ldrb       r0,[r5,#ScreenDim_state_s0]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_SD_Dynamyte_0_0809af80:
    .word PTR_SD_Dynamyte_0_0809af84

PTR_SD_Dynamyte_0_0809af84:
    .word SD_Dynamyte_0
    .word SD_Dynamyte_1
    .word SD_Dynamyte_2
    .word SD_Dynamyte_3
    .word SD_Dynamyte_4


_ts SD_Dynamyte_0
    push       {lr}
    FadeOut_ScreenDim
    ldrb       r1,[r5,#ScreenDim_subFamily]
    lsl        r1,r1,#0x19
    lsr        r1,r1,#0x19
    add        r1,#CD_Dynamyt1
    SD_LoadMessage
    SD_ClearChipAndNext_A
    pop        {pc}


_ts SD_Dynamyte_1
    push       {lr}
    SD_ShowMessage
    tst        r0,r0
    bne        LAB_0809affa
    SD_HideMessage
    ldrb       r0,[r5,#ScreenDim_subFamily]
    lsl        r0,r0,#0x19
    bcs        LAB_0809aff2
    ldrb       r0,[r5,#ScreenDim_owner]
    bl         R_Player_ClearOwnedEntity
LAB_0809aff2:
    SD_SetTimer 0x30
    mov        r0,#0x8
    str        r0,[r5,#ScreenDim_state_s0]
LAB_0809affa:
    pop        {pc}


_ts SD_Dynamyte_2
    push       {lr}
    SD_DecreaseTimer
    bne        LAB_0809b042
    ldrb       r0,[r5,#ScreenDim_owner]
    push       {r0}
    bl         Field_GetAttackDirectionOffset
    pop        {r1}
    LoadMain battle, r7, r7
    lsl        r1,r1,#0x2
    add        r1,#0x40
    ldr        r7,[r7,r1]
    ldrb       r1,[r7,#0x18]
    add        r1,r1,r0
    ldrb       r2,[r7,#0x19]
    ldrh       r6,[r5,#ScreenDim_damage]
    ldr        r0,[r7,#0x74]
    add        r0,#0x50
    ldrb       r7,[r5,#ScreenDim_owner]
    ldrb       r4,[r5,#ScreenDim_subFamily]
    bl         Attack_Dynamyte_Create
    tst        r4,r4
    beq        LAB_0809b03a
    ldrb       r0,[r4,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r4,#0x0]
LAB_0809b03a:
    SD_SetTimer 0x3c
    mov        r0,#0xc
    str        r0,[r5,#ScreenDim_state_s0]
LAB_0809b042:
    pop        {pc}
    .word DAT_0809b048

DAT_0809b048:
    .byte 0x01
    .byte 0x03
    .byte 0x12
    .byte 0x20


_ts SD_Dynamyte_3
    push       {lr}
    SD_DecreaseTimer
    bne        LAB_0809b066
    FadeIn_ScreenDim
    mov        r0,#0x10
    str        r0,[r5,#ScreenDim_state_s0]
LAB_0809b066:
    pop        {pc}


_ts SD_Dynamyte_4
    push       {lr}
    LoadMain fade, r0, r7
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0809b082
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_0809b082:
    pop        {pc}
