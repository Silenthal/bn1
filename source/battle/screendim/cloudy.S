#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_Cloudy
    push       {lr}
    ldr        r7,PTR_PTR_SD_Cloudy_0_Init_080996c0
    ldrb       r0,[r5,#ScreenDim_state_s0]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_SD_Cloudy_0_Init_080996c0:
    .word PTR_SD_Cloudy_0_Init_080996c4

PTR_SD_Cloudy_0_Init_080996c4:
    .word SD_Cloudy_0_Init
    .word SD_Cloudy_1_ShowMessage
    .word SD_Cloudy_2_Attack
    .word SD_Cloudy_3_FadeIn
    .word SD_Cloudy_4_Free


_ts SD_Cloudy_0_Init
    push       {lr}
    FadeOut_ScreenDim
    SD_SetTimer 0x1e
    ldrb       r1,[r5,#ScreenDim_subFamily]
    add        r1,#CD_Cloud
    SD_LoadMessage
    SD_ClearChipAndNext_A
    pop        {pc}


_ts SD_Cloudy_1_ShowMessage
    push       {lr}
    SD_ShowMessage
    tst        r0,r0
    bne        LAB_0809973c
    SD_HideMessage
    SD_DecreaseTimer
    bne        LAB_0809973c
    ldrb       r0,[r5,#ScreenDim_owner]
    bl         R_Player_ClearOwnedEntity
    SD_SetTimer 0x15
    mov        r0,#0x8
    str        r0,[r5,#ScreenDim_state_s0]
LAB_0809973c:
    pop        {pc}


_nt SD_Cloudy_2_Attack
    push       {lr}
    SD_DecreaseTimer
    bne        LAB_0809978c
    bl         FUN_080997e8
    mov        r4,#0x1
    lsl        r0,r2,#0x18
    orr        r4,r0
    lsl        r1,r1,#0x10
    orr        r4,r1
    LoadMain battle, r7, r7
    ldrb       r3,[r5,#ScreenDim_owner]
    lsl        r3,r3,#0x2
    add        r3,#0x40
    ldr        r7,[r7,r3]
    ldrb       r1,[r7,#0x18]
    ldrh       r6,[r5,#ScreenDim_damage]
    ldr        r0,PTR_DAT_08099790
    ldrb       r3,[r5,#ScreenDim_subFamily]
    lsl        r3,r3,#0x2
    ldr        r3,[r0,r3]
    ldr        r7,[r7,#0x74]
    add        r7,#0x50
    ldrb       r0,[r5,#ScreenDim_owner]
    bl         Attack_Cloudy_Create
    tst        r7,r7
    beq        LAB_08099784
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r7,#0x0]
LAB_08099784:
    SD_SetTimer 0x30
    mov        r0,#0xc
    str        r0,[r5,#ScreenDim_state_s0]
LAB_0809978c:
    pop        {pc}

    .align 2, 0


PTR_DAT_08099790:
    .word DAT_08099794

DAT_08099794:
    .byte 0xCC
    .byte 0x4C
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x80
    .byte 0x00
    .byte 0x00
    .byte 0x33
    .byte 0xB3

    .align 2, 0



_ts SD_Cloudy_3_FadeIn
    push       {lr}
    LoadMain battle, r6, r6
    ldrb       r3,[r5,#ScreenDim_owner]
    lsl        r3,r3,#0x2
    add        r3,#0x40
    ldr        r6,[r6,r3]
    ldr        r6,[r6,#0x74]
    ldr        r7,[r6,#0x4c]
    ldr        r0,[r7,#0x0]
    mov        r1,#0x4
    tst        r0,r1
    bne        LAB_080997ca
    FadeIn_ScreenDim
    mov        r0,#0x10
    str        r0,[r5,#ScreenDim_state_s0]
LAB_080997ca:
    pop        {pc}


_ts SD_Cloudy_4_Free
    push       {lr}
    LoadMain fade, r0, r7
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080997e6
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_080997e6:
    pop        {pc}


_ts FUN_080997e8
    push       {lr}
    ldrb       r0,[r5,#ScreenDim_owner]
    lsl        r3,r0,#0x2
    ldr        r7,PTR_PanelFlag_ARRAY_0809981c
    ldr        r1,[r7,r3]
    ldr        r7,PTR_PanelFlag_ARRAY_08099820
    ldr        r2,[r7,r3]
    bl         Field_GetFirstPanelForward
    tst        r0,r0
    bne        LAB_0809980a
    ldrb       r0,[r5,#ScreenDim_owner]
    bl         Field_GetFirstWalkableOpponentColumnFront
    tst        r0,r0
    bne        LAB_0809980a
    mov        r0,#0x6
LAB_0809980a:
    add        r1,r0,#0x0
    LoadMain battle, r7, r7
    ldrb       r2,[r5,#ScreenDim_owner]
    lsl        r2,r2,#0x2
    add        r2,#0x40
    ldr        r7,[r7,r2]
    ldrb       r2,[r7,#0x19]
    pop        {pc}

PTR_PanelFlag_ARRAY_0809981c:
    .word PanelFlag_ARRAY_08099824

PTR_PanelFlag_ARRAY_08099820:
    .word PanelFlag_ARRAY_0809982c

PanelFlag_ARRAY_08099824:
    .word PF_EnemyTerritory | PF_EnemyOccupied
    .word PF_PlayerOccupied

PanelFlag_ARRAY_0809982c:
    .word 0
    .word PF_EnemyTerritory
