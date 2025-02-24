#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_Remobit
    push       {lr}
    ldr        r7,PTR_PTR_SD_Remobit_0_08099eac
    ldrb       r0,[r5,#ScreenDim_state_s0]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_SD_Remobit_0_08099eac:
    .word PTR_SD_Remobit_0_08099eb0

PTR_SD_Remobit_0_08099eb0:
    .word SD_Remobit_0
    .word SD_Remobit_1
    .word SD_Remobit_2
    .word SD_Remobit_3
    .word SD_Remobit_4


_ts SD_Remobit_0
    push       {lr}
    FadeOut_ScreenDim
    SD_SetTimer 0x1e
    ldrb       r1,[r5,#ScreenDim_subFamily]
    add        r1,#CD_Remobit1
    SD_LoadMessage
    SD_ClearChipAndNext_A
    pop        {pc}


_ts SD_Remobit_1
    push       {lr}
    SD_ShowMessage
    tst        r0,r0
    bne        LAB_08099f4c
    SD_HideMessage
    SD_DecreaseTimer
    bne        LAB_08099f4c
    ldrb       r0,[r5,#ScreenDim_owner]
    push       {r0}
    bl         Field_GetAttackDirectionOffset
    add        r2,r0,#0x0
    pop        {r0}
    LoadMain battle, r7, r7
    add        r7,#0x40
    lsl        r0,r0,#0x2
    ldr        r7,[r7,r0]
    ldrb       r0,[r7,#0x18]
    ldrb       r1,[r7,#0x19]
    add        r0,r0,r2
    mov        r3,#0x14
    strb       r0,[r5,r3]
    mov        r3,#0x15
    strb       r1,[r5,r3]
    ldrb       r0,[r5,#ScreenDim_owner]
    bl         R_Player_ClearOwnedEntity
    SD_SetTimer 0x15
    mov        r0,#0x8
    str        r0,[r5,#ScreenDim_state_s0]
LAB_08099f4c:
    pop        {pc}


_nt SD_Remobit_2
    push       {lr}
    SD_DecreaseTimer
    bne        LAB_08099f8a
    LoadMain matchBattleState, r0, r0
    ldrb       r7,[r5,#ScreenDim_owner]
    tst        r7,r7
    beq        LAB_08099f64
    add        r0,#0x70
LAB_08099f64:
    add        r0,#0x50
    mov        r3,#0x14
    ldrb       r1,[r5,r3]
    mov        r3,#0x15
    ldrb       r2,[r5,r3]
    ldrb       r4,[r5,#ScreenDim_subFamily]
    ldrh       r6,[r5,#ScreenDim_damage]
    bl         Attack_Remobit_Chip_Create
    tst        r4,r4
    beq        LAB_08099f82
    ldrb       r0,[r4,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r4,#0x0]
LAB_08099f82:
    SD_SetTimer 0x60
    mov        r0,#0xc
    str        r0,[r5,#ScreenDim_state_s0]
LAB_08099f8a:
    pop        {pc}


_ts SD_Remobit_3
    push       {lr}
    SD_DecreaseTimer
    bne        LAB_08099fa6
    FadeIn_ScreenDim
    mov        r0,#0x10
    str        r0,[r5,#ScreenDim_state_s0]
LAB_08099fa6:
    pop        {pc}


_ts SD_Remobit_4
    push       {lr}
    LoadMain fade, r0, r7
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08099fc2
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_08099fc2:
    pop        {pc}
