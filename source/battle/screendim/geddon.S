#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_Geddon
    push       {lr}
    ldr        r7,PTR_PTR_SD_Geddon_0_080994c8
    ldrb       r0,[r5,#ScreenDim_state_s0]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_SD_Geddon_0_080994c8:
    .word PTR_SD_Geddon_0_080994cc

PTR_SD_Geddon_0_080994cc:
    .word SD_Geddon_0
    .word SD_Geddon_1
    .word SD_Geddon_2
    .word SD_Geddon_3
    .word SD_Geddon_4


_ts SD_Geddon_0
    push       {lr}
    FadeOut_ScreenDim
    SD_SetTimer 0x1e
    ldr        r7,PTR_PTR_SD_Geddon_0_0_0809951c
    ldrb       r0,[r5,#ScreenDim_subFamily]
    lsl        r0,r0,#0x2
    ldr        r7,[r7,r0]
    str        r7,[r5,#ScreenDim_param_14]
    ldrb       r1,[r5,#ScreenDim_subFamily]
    add        r1,#CD_Geddon1
    SD_LoadMessage
    SD_ClearChipAndNext_A
    pop        {pc}

    .align 2, 0


PTR_PTR_SD_Geddon_0_0_0809951c:
    .word PTR_SD_Geddon_0_0_08099520

PTR_SD_Geddon_0_0_08099520:
    .word SD_Geddon_0_0
    .word SD_Geddon_0_1


_ts SD_Geddon_1
    push       {lr}
    SD_ShowMessage
    tst        r0,r0
    bne        LAB_08099556
    SD_HideMessage
    SD_DecreaseTimer
    bne        LAB_08099556
    SD_SetTimer 0x30
    mov        r0,#0x8
    str        r0,[r5,#ScreenDim_state_s0]
LAB_08099556:
    pop        {pc}


_ts SD_Geddon_2
    push       {lr}
    SD_DecreaseTimer
    bne        LAB_0809956a
    SD_SetTimer 0x6
    mov        r0,#0xc
    str        r0,[r5,#ScreenDim_state_s0]
LAB_0809956a:
    pop        {pc}


_ts SD_Geddon_3
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldr        r7,[r5,#ScreenDim_param_14]
    mov        lr,pc
    bx         r7
    tst        r0,r0
    bne        LAB_0809958e
    FadeIn_ScreenDim
    mov        r0,#0x10
    str        r0,[r5,#ScreenDim_state_s0]
LAB_0809958e:
    pop        {pc}


_ts SD_Geddon_4
    push       {lr}
    LoadMain fade, r0, r7
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080995aa
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_080995aa:
    pop        {pc}


_ts SD_Geddon_0_0
    push       {lr}
    SD_DecreaseTimer
    bne        LAB_08099614
    SD_SetTimer 0x6
    sub        sp,#0x14
    mov        r0,sp
    ldr        r1,PanelFlag_08099620
    ldr        r2,PanelFlag_08099624
    push       {r0}
    bl         Field_Search
    pop        {r0}
    tst        r1,r1
    beq        LAB_08099618
    push       {r0}
    push       {r1}
    bl         Rng_RandomInt
    pop        {r1}
    bl         Div
    pop        {r0}
    ldrb       r0,[r0,r1]
    bl         Field_IndexToCellXY
    push       {r0,r1}
    bl         Field_CrackPanel
    pop        {r0,r1}
    push       {r5}
    bl         Battle_CellCoordsToSprite
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    mov        r3,#0x0
    mov        r4,#0x2b
    bl         Effect_QuickEffect_Create
    tst        r5,r5
    beq        LAB_0809960a
    ldrb       r0,[r5,#ScreenDim_state_s0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r5,#ScreenDim_state_s0]
LAB_0809960a:
    pop        {r5}
    mov        r0,#0x7b
    bl         Sound_PlaySE
    add        sp,#0x14
LAB_08099614:
    mov        r0,#0x1
    pop        {pc}
LAB_08099618:
    mov        r0,#0x0
    add        sp,#0x14
    pop        {pc}

    .align 2, 0


PanelFlag_08099620:
    .word PF_Walkable

PanelFlag_08099624:
    .word PF_Cracked


_ts SD_Geddon_0_1
    push       {lr}
    SD_DecreaseTimer
    bne        LAB_0809969e
    SD_SetTimer 0x8
    sub        sp,#0x14
    mov        r0,sp
    ldr        r1,PanelFlag_080996a8
    ldr        r2,PanelFlag_080996ac
    push       {r0}
    bl         Field_Search
    pop        {r0}
    tst        r1,r1
    beq        LAB_080996a2
    push       {r0}
    push       {r1}
    bl         Rng_RandomInt
    pop        {r1}
    bl         Div
    pop        {r0}
    ldrb       r0,[r0,r1]
    bl         Field_IndexToCellXY
    push       {r0,r1}
    bl         Field_CrackPanel
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    pop        {r0,r1}
    push       {r0,r1}
    bl         Field_CrackPanel
    pop        {r0,r1}
    push       {r5}
    bl         Battle_CellCoordsToSprite
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    mov        r3,#0x0
    mov        r4,#0x2b
    bl         Effect_QuickEffect_Create
    tst        r5,r5
    beq        LAB_08099694
    ldrb       r0,[r5,#ScreenDim_state_s0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r5,#ScreenDim_state_s0]
LAB_08099694:
    pop        {r5}
    mov        r0,#0x7b
    bl         Sound_PlaySE
    add        sp,#0x14
LAB_0809969e:
    mov        r0,#0x1
    pop        {pc}
LAB_080996a2:
    mov        r0,#0x0
    add        sp,#0x14
    pop        {pc}

PanelFlag_080996a8:
    .word PF_Walkable

PanelFlag_080996ac:
    .word PF_PlayerOccupied | PF_EnemyOccupied | PF_Teleporting | PF_Solid | PF_Sealed
