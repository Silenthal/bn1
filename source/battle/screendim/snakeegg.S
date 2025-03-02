#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_SnakeEgg
    push       {lr}
    ldr        r7,PTR_PTR_SD_SnakeEgg_0_0809ae28
    ldrb       r0,[r5,#ScreenDim_state_s0]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_SD_SnakeEgg_0_0809ae28:
    .word PTR_SD_SnakeEgg_0_0809ae2c

PTR_SD_SnakeEgg_0_0809ae2c:
    .word SD_SnakeEgg_0
    .word SD_SnakeEgg_1
    .word SD_SnakeEgg_2
    .word SD_SnakeEgg_3
    .word SD_SnakeEgg_4


_ts SD_SnakeEgg_0
    push       {lr}
    FadeOut_ScreenDim
    ldrb       r1,[r5,#ScreenDim_subFamily]
    lsl        r1,r1,#0x19
    lsr        r1,r1,#0x19
    add        r1,#CD_Snakegg1
    SD_LoadMessage
    SD_ClearChipAndNext_A
    pop        {pc}


_ts SD_SnakeEgg_1
    push       {lr}
    SD_ShowMessage
    tst        r0,r0
    bne        LAB_0809aea2
    SD_HideMessage
    ldrb       r0,[r5,#ScreenDim_subFamily]
    lsl        r0,r0,#0x19
    bcs        LAB_0809ae9a
    ldrb       r0,[r5,#ScreenDim_owner]
    bl         R_Player_ClearOwnedEntity
LAB_0809ae9a:
    SD_SetTimer 0x30
    mov        r0,#0x8
    str        r0,[r5,#ScreenDim_state_s0]
LAB_0809aea2:
    pop        {pc}


_ts SD_SnakeEgg_2
    push       {lr}
    SD_DecreaseTimer
    bne        LAB_0809af2e
    sub        sp,#0x14
    mov        r7,sp
    ldrb       r0,[r5,#ScreenDim_owner]
    neg        r0,r0
    add        r0,#0x1
    ldr        r2,PTR_DAT_0809af30
    add        r2,r2,r0
    ldrb       r1,[r2,#0x0]
    ldrb       r2,[r2,#0x2]
    add        r3,r7,#0x0
    push       {r1,r2,r3,r7}
    bl         Field_SearchEdgeLeftToRight
    pop        {r1,r2,r3,r7}
    tst        r0,r0
    bne        LAB_0809aee6
    ldrb       r0,[r5,#ScreenDim_owner]
    neg        r0,r0
    add        r0,#0x1
    mov        r4,#0x30
    mvn        r4,r4
    and        r2,r4
    push       {r7}
    bl         Field_SearchEdgeLeftToRight
    pop        {r7}
    tst        r0,r0
    beq        LAB_0809af24
LAB_0809aee6:
    add        r1,r0,#0x0
    add        r0,r7,#0x0
    bl         GetRandomElementOfArray
    bl         Field_IndexToCellXY
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    ldrb       r4,[r5,#ScreenDim_subFamily]
    ldrb       r7,[r5,#ScreenDim_owner]
    mov        r0,#0x0
    lsl        r4,r4,#0x19
    bcs        LAB_0809af0c
    LoadMain matchBattleState, r0, r0
    tst        r7,r7
    beq        LAB_0809af0a
    add        r0,#0x70
LAB_0809af0a:
    add        r0,#0x50
LAB_0809af0c:
    lsr        r4,r4,#0x19
    mov        r3,#0x0
    ldrh       r6,[r5,#ScreenDim_damage]
    ldrb       r7,[r5,#ScreenDim_owner]
    bl         Attack_SnakeEgg_Create
    tst        r4,r4
    beq        LAB_0809af24
    ldrb       r0,[r4,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r4,#0x0]
LAB_0809af24:
    add        sp,#0x14
    SD_SetTimer 0x3c
    mov        r0,#0xc
    str        r0,[r5,#ScreenDim_state_s0]
LAB_0809af2e:
    pop        {pc}

PTR_DAT_0809af30:
    .word DAT_0809af34

DAT_0809af34:
    .byte 0x01

DAT_0809af35:
    .byte 0x03
    .byte 0x12

DAT_0809af37:
    .byte 0x20


_ts SD_SnakeEgg_3
    push       {lr}
    SD_DecreaseTimer
    bne        LAB_0809af52
    FadeIn_ScreenDim
    mov        r0,#0x10
    str        r0,[r5,#ScreenDim_state_s0]
LAB_0809af52:
    pop        {pc}


_ts SD_SnakeEgg_4
    push       {lr}
    LoadMain fade, r0, r7
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0809af6e
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_0809af6e:
    pop        {pc}
