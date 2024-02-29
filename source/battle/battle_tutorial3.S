#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set Battle_CopyChipHandIcons, 0x807c160


_ts Battle_Tutorial3
    push       {lr}
    ldr        r0,PTR_PTR_BattleR_0_SpawnPlayerWithHP_080076a4
    ldrb       r1,[r5,#0x1]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_BattleR_0_SpawnPlayerWithHP_08007690:
    .word BattleR_0_SpawnPlayerWithHP
    .word BattleT3_1
    .word BattleT3_2
    .word BattleT3_3
    .word BattleT3_4
PTR_PTR_BattleR_0_SpawnPlayerWithHP_080076a4:
    .word PTR_BattleR_0_SpawnPlayerWithHP_08007690


_ts BattleT3_1
    push       {lr}
    ldrb       r0,[r5,#0x2]
    tst        r0,r0
    beq        LAB_080076b8
    push       {r5}
    bl         CustomScreen_Main
    pop        {r5}
LAB_080076b8:
    ldr        r7,PTR_PTR_BattleT3_1_0_080076d8
    ldrb       r0,[r5,#0x2]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0

PTR_BattleT3_1_0_080076c4:
    .word BattleT3_1_0
    .word BattleT3_1_1
    .word BattleT3_1_2
    .word BattleT3_1_3
    .word BattleT3_1_4
PTR_PTR_BattleT3_1_0_080076d8:
    .word PTR_BattleT3_1_0_080076c4


_ts BattleT3_1_0
    push       {lr}
    mov        r0,#0x0
    strh       r0,[r5,#0x3e]
    push       {r5}
    bl         BattleUi_LoadCustomGaugeTileMap
    bl         BattleUi_ClearActiveChip
    bl         CustomScreen_LoadUIUpper
    bl         CustomScreen_DisableInput
    pop        {r5}
    bl         Battle_ClearState_InBattle
    mov        r0,#0x1e
    strh       r0,[r5,#0x2e]
    mov        r0,#0x4
    strb       r0,[r5,#0x2]
    pop        {pc}


_ts BattleT3_1_1
    push       {lr}
    bl         BattleT3_DecreaseGeneralCounter
    bne        LAB_08007716
    mov        r0,#0x0
    bl         Text_SetTextPointer_Tutorial3
    mov        r0,#0x8
    strb       r0,[r5,#0x2]
LAB_08007716:
    pop        {pc}


_ts BattleT3_1_2
    push       {lr}
    bl         Text_CheckIfDialogActive
    bne        LAB_08007728
    mov        r0,#0x78
    strh       r0,[r5,#0x2e]
    mov        r0,#0xc
    strb       r0,[r5,#0x2]
LAB_08007728:
    pop        {pc}


_nt BattleT3_1_3
    push       {lr}
    bl         CheckButtonAToggled_2
    bne        LAB_08007738
    bl         BattleT3_DecreaseGeneralCounter
    bne        LAB_08007742
LAB_08007738:
    mov        r0,#0x3
    bl         Text_SetTextPointer_Tutorial3
    mov        r0,#0x10
    strb       r0,[r5,#0x2]
LAB_08007742:
    mov        r0,#0x64
    mov        r1,#0x90
    bl         DrawTutorialArrow
    pop        {pc}


_ts BattleT3_1_4
    push       {lr}
    bl         Text_CheckIfDialogActive
    bne        LAB_08007760
    mov        r0,#0x8
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
    bl         CustomScreen_EnableInput
LAB_08007760:
    pop        {pc}


_nt BattleT3_2
    push       {lr}
    push       {r5}
    bl         CustomScreen_Main
    pop        {r5}
    tst        r0,r0
    bne        LAB_08007778
    mov        r0,#0xc
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
LAB_08007778:
    pop        {pc}


_nt BattleT3_3
    push       {lr}
    bl         BattleR_2_Main
    cmp        r0,#0x3
    bne        LAB_0800778e
    mov        r0,#0x10
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
    pop        {pc}
LAB_0800778e:
    cmp        r0,#0x1
    bne        LAB_08007796
    mov        r1,#0x0
    b          LAB_0800779c
LAB_08007796:
    cmp        r0,#0x2
    bne        LAB_080077a6
    mov        r1,#0x4
LAB_0800779c:
    mov        r0,#0x8
    strb       r0,[r5,#0x0]
    strb       r1,[r5,#0x1]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
LAB_080077a6:
    pop        {pc}


_ts BattleT3_4
    push       {lr}
    ldr        r7,PTR_PTR_BattleT3_4_0_080077c0
    ldrb       r0,[r5,#0x2]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0

PTR_BattleT3_4_0_080077b8:
    .word BattleT3_4_0
    .word BattleT3_4_1
PTR_PTR_BattleT3_4_0_080077c0:
    .word PTR_BattleT3_4_0_080077b8


_ts BattleT3_4_0
    push       {lr}
    mov        r0,#0x0
    strh       r0,[r5,#0x3e]
    push       {r5}
    bl         BattleUi_LoadCustomGaugeTileMap
    bl         BattleUi_ClearActiveChip
    bl         CustomScreen_LoadUIUpper
    bl         CustomScreen_EnableInput
    pop        {r5}
    bl         Battle_ClearState_InBattle
    mov        r0,#0x4
    strb       r0,[r5,#0x2]
    pop        {pc}


_ts BattleT3_4_1
    push       {lr}
    push       {r5}
    bl         CustomScreen_Main
    pop        {r5}
    tst        r0,r0
    bne        LAB_080077fe
    mov        r0,#0xc
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
LAB_080077fe:
    pop        {pc}


_ts Text_SetTextPointer_Tutorial3
    push       {lr}
    add        r1,r0,#0x0
    ldr        r0,PTR_textDict_Battle_Tutorial3_08007810
    push       {r5}
    bl         Text_LoadDialogue
    pop        {r5}
    pop        {pc}
PTR_textDict_Battle_Tutorial3_08007810:
    .word textDict_Battle_Tutorial3


_ts BattleT3_DecreaseGeneralCounter
    ldrh       r0,[r5,#0x2e]
    sub        r0,#0x1
    strh       r0,[r5,#0x2e]
    mov        pc,lr


_ts CheckButtonAToggled_2
    mov        r7,r10
    ldr        r7,[r7,#0x4]
    ldrh       r0,[r7,#0x2]
    mov        r1,#0x1
    tst        r0,r1
    mov        pc,lr
