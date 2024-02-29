#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set Battle_CopyChipHandIcons, 0x807c160

_ts Battle_Tutorial2
    push       {lr}
    ldr        r0,PTR_PTR_BattleR_0_SpawnPlayerWithHP_080072f8
    ldrb       r1,[r5,#0x1]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_BattleR_0_SpawnPlayerWithHP_080072e0:
    .word BattleR_0_SpawnPlayerWithHP
    .word BattleT2_1
    .word BattleT2_2
    .word BattleT2_3
    .word BattleT2_4
    .word BattleT2_5
PTR_PTR_BattleR_0_SpawnPlayerWithHP_080072f8:
    .word PTR_BattleR_0_SpawnPlayerWithHP_080072e0


_ts BattleT2_1
    push       {lr}
    ldrb       r0,[r5,#0x2]
    tst        r0,r0
    beq        LAB_0800730c
    push       {r5}
    bl         CustomScreenT2_Main
    pop        {r5}
LAB_0800730c:
    ldr        r7,PTR_PTR_BattleT2_1_0_0800734c
    ldrb       r0,[r5,#0x2]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0

PTR_BattleT2_1_0_08007318:
    .word BattleT2_1_0
    .word BattleT2_1_1
    .word BattleT2_1_2
    .word BattleT2_1_3
    .word BattleT2_1_4
    .word BattleT2_1_5
    .word BattleT2_1_6
    .word BattleT2_1_7
    .word BattleT2_1_8
    .word BattleT2_1_9
    .word BattleT2_1_10
    .word BattleT2_1_11
    .word BattleT2_1_12
PTR_PTR_BattleT2_1_0_0800734c:
    .word PTR_BattleT2_1_0_08007318


_ts BattleT2_1_0
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


_ts BattleT2_1_1
    push       {lr}
    bl         BattleT2_DecreaseGeneralCounter
    bne        LAB_0800738a
    mov        r0,#0x0
    bl         Text_SetTextPointer_Tutorial2
    mov        r0,#0x8
    strb       r0,[r5,#0x2]
LAB_0800738a:
    pop        {pc}


_ts BattleT2_1_2
    push       {lr}
    bl         Text_CheckIfDialogActive
    bne        LAB_0800739c
    mov        r0,#0x78
    strh       r0,[r5,#0x2e]
    mov        r0,#0xc
    strb       r0,[r5,#0x2]
LAB_0800739c:
    pop        {pc}


_nt BattleT2_1_3
    push       {lr}
    bl         CheckButtonAToggled_1
    bne        LAB_080073ac
    bl         BattleT2_DecreaseGeneralCounter
    bne        LAB_080073b6
LAB_080073ac:
    mov        r0,#0x6
    bl         Text_SetTextPointer_Tutorial2
    mov        r0,#0x10
    strb       r0,[r5,#0x2]
LAB_080073b6:
    mov        r0,#0x10
    mov        r1,#0x78
    bl         DrawTutorialArrow
    pop        {pc}


_ts BattleT2_1_4
    push       {lr}
    bl         Text_CheckIfDialogActive
    bne        LAB_080073d2
    mov        r0,#0x7
    bl         Text_SetTextPointer_Tutorial2
    mov        r0,#0x14
    strb       r0,[r5,#0x2]
LAB_080073d2:
    pop        {pc}


_ts BattleT2_1_5
    push       {lr}
    bl         Text_CheckIfDialogActive
    bne        LAB_080073e6
    mov        r0,#0x3
    bl         Text_SetTextPointer_Tutorial2
    mov        r0,#0x18
    strb       r0,[r5,#0x2]
LAB_080073e6:
    pop        {pc}


_ts BattleT2_1_6
    push       {lr}
    bl         Text_CheckIfDialogActive
    bne        LAB_080073f8
    mov        r0,#0x78
    strh       r0,[r5,#0x2e]
    mov        r0,#0x1c
    strb       r0,[r5,#0x2]
LAB_080073f8:
    pop        {pc}


_nt BattleT2_1_7
    push       {lr}
    bl         CheckButtonAToggled_1
    bne        LAB_08007408
    bl         BattleT2_DecreaseGeneralCounter
    bne        LAB_08007412
LAB_08007408:
    mov        r0,#0x4
    bl         Text_SetTextPointer_Tutorial2
    mov        r0,#0x20
    strb       r0,[r5,#0x2]
LAB_08007412:
    mov        r0,#0xc
    mov        r1,#0x5d
    bl         DrawTutorialArrow
    pop        {pc}


_ts BattleT2_1_8
    push       {lr}
    bl         Text_CheckIfDialogActive
    bne        LAB_0800742c
    mov        r0,#0x78
    strh       r0,[r5,#0x2e]
    mov        r0,#0x24
    strb       r0,[r5,#0x2]
LAB_0800742c:
    pop        {pc}


_nt BattleT2_1_9
    push       {lr}
    bl         CheckButtonAToggled_1
    bne        LAB_0800743c
    bl         BattleT2_DecreaseGeneralCounter
    bne        LAB_08007446
LAB_0800743c:
    mov        r0,#0x5
    bl         Text_SetTextPointer_Tutorial2
    mov        r0,#0x28
    strb       r0,[r5,#0x2]
LAB_08007446:
    mov        r0,#0x10
    mov        r1,#0x78
    bl         DrawTutorialArrow
    mov        r0,#0x20
    mov        r1,#0x78
    bl         DrawTutorialArrow
    pop        {pc}


_ts BattleT2_1_10
    push       {lr}
    bl         Text_CheckIfDialogActive
    bne        LAB_08007468
    mov        r0,#0x78
    strh       r0,[r5,#0x2e]
    mov        r0,#0x2c
    strb       r0,[r5,#0x2]
LAB_08007468:
    pop        {pc}


_nt BattleT2_1_11
    push       {lr}
    bl         CheckButtonAToggled_1
    bne        LAB_08007478
    bl         BattleT2_DecreaseGeneralCounter
    bne        LAB_0800747c
LAB_08007478:
    mov        r0,#0x30
    strb       r0,[r5,#0x2]
LAB_0800747c:
    mov        r0,#0x70
    mov        r1,#0x1e
    bl         DrawTutorialArrow
    pop        {pc}


_nt BattleT2_1_12
    push       {lr}
    bl         Text_CheckIfDialogActive
    bne        LAB_08007496
    mov        r0,#0x8
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
LAB_08007496:
    pop        {pc}


_ts BattleT2_2
    push       {lr}
    ldr        r7,PTR_PTR_BattleT2_2_0_080074c8
    ldrb       r0,[r5,#0x2]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    push       {r5}
    bl         CustomScreenT2_Main
    pop        {r5}
    tst        r0,r0
    bne        LAB_080074b8
    mov        r0,#0xc
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strb       r0,[r5,#0x2]
LAB_080074b8:
    pop        {pc}

    .align 2, 0

PTR_BattleT2_2_0_080074bc:
    .word BattleT2_2_0
    .word BattleT2_2_1
    .word BattleT2_2_2
PTR_PTR_BattleT2_2_0_080074c8:
    .word PTR_BattleT2_2_0_080074bc


_ts BattleT2_2_0
    push       {lr}
    mov        r0,#0xa
    bl         Text_SetTextPointer_Tutorial2
    mov        r0,#0x4
    strb       r0,[r5,#0x2]
    pop        {pc}


_nt BattleT2_2_1
    push       {lr}
    bl         Text_CheckIfDialogActive
    bne        LAB_080074ea
    mov        r0,#0x8
    strb       r0,[r5,#0x2]
    bl         CustomScreen_EnableInput
LAB_080074ea:
    pop        {pc}


_ts BattleT2_2_2
    push       {lr}
    pop        {pc}


_ts BattleT2_3
    push       {lr}
    ldr        r7,PTR_PTR_BattleT2_3_0_08007510
    ldrb       r0,[r5,#0x2]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0

PTR_BattleT2_3_0_08007500:
    .word BattleT2_3_0
    .word BattleT2_3_1
    .word BattleT2_3_2
    .word BattleT2_3_3
PTR_PTR_BattleT2_3_0_08007510:
    .word PTR_BattleT2_3_0_08007500


_ts BattleT2_3_0
    push       {lr}
    bl         Battle_CopyBattleHand
    bl         Battle_CopyChipHandIcons
    bl         Battle_SetState_InBattle
    mov        r0,#0x28
    bl         Text_SetTextPointer_Tutorial2
    mov        r0,#0x4
    strb       r0,[r5,#0x2]
    pop        {pc}


_nt BattleT2_3_1
    push       {lr}
    bl         Text_CheckIfDialogActive
    bne        LAB_0800753e
    mov        r0,#0x78
    strh       r0,[r5,#0x2e]
    mov        r0,#0x8
    strb       r0,[r5,#0x2]
LAB_0800753e:
    pop        {pc}


_ts BattleT2_3_2
    push       {lr}
    bl         CheckButtonAToggled_1
    bne        LAB_0800754e
    bl         BattleT2_DecreaseGeneralCounter
    bne        LAB_08007558
LAB_0800754e:
    mov        r0,#0x29
    bl         Text_SetTextPointer_Tutorial2
    mov        r0,#0xc
    strb       r0,[r5,#0x2]
LAB_08007558:
    mov        r0,#0x8c
    mov        r1,#0x54
    bl         DrawTutorialArrow
    mov        r0,#0x8c
    mov        r1,#0x6c
    bl         DrawTutorialArrow
    mov        r0,#0x8c
    mov        r1,#0x84
    bl         DrawTutorialArrow
    pop        {pc}


_nt BattleT2_3_3
    push       {lr}
    bl         Text_CheckIfDialogActive
    bne        LAB_08007582
    mov        r0,#0x10
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strb       r0,[r5,#0x2]
LAB_08007582:
    pop        {pc}


_ts BattleT2_4
    push       {lr}
    bl         BattleR_2_Main
    cmp        r0,#0x3
    bne        LAB_08007598
    mov        r0,#0x14
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
    pop        {pc}
LAB_08007598:
    cmp        r0,#0x1
    bne        LAB_080075a0
    mov        r1,#0x0
    b          LAB_080075a6
LAB_080075a0:
    cmp        r0,#0x2
    bne        LAB_080075b0
    mov        r1,#0x4
LAB_080075a6:
    mov        r0,#0x8
    strb       r0,[r5,#0x0]
    strb       r1,[r5,#0x1]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
LAB_080075b0:
    pop        {pc}


_nt BattleT2_5
    push       {lr}
    ldr        r7,PTR_PTR_BattleT2_5_0_080075d8
    ldrb       r0,[r5,#0x2]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0

PTR_BattleT2_5_0_080075c0:
    .word BattleT2_5_0
    .word BattleT2_5_1
    .word dummy_761a
    .word BattleT2_5_3
    .word BattleT2_5_4
    .word BattleT2_5_5
PTR_PTR_BattleT2_5_0_080075d8:
    .word PTR_BattleT2_5_0_080075c0


_ts BattleT2_5_0
    push       {lr}
    ldrb       r0,[r5,#0xc]
    cmp        r0,#0x3
    bpl        LAB_080075ea
    mov        r0,#0x2d
    bl         Text_SetTextPointer_Tutorial2
LAB_080075ea:
    mov        r0,#0x4
    strb       r0,[r5,#0x2]
    pop        {pc}


_ts BattleT2_5_1
    push       {lr}
    bl         Text_CheckIfDialogActive
    bne        LAB_08007618
    mov        r0,#0x0
    strh       r0,[r5,#0x3e]
    push       {r5}
    bl         BattleUi_LoadCustomGaugeTileMap
    bl         BattleUi_ClearActiveChip
    bl         CustomScreen_LoadUIUpper
    bl         CustomScreen_EnableInput
    pop        {r5}
    bl         Battle_ClearState_InBattle
    mov        r0,#0xc
    strb       r0,[r5,#0x2]
LAB_08007618:
    pop        {pc}


_nt dummy_761a
    pop        {pc}


_ts BattleT2_5_3
    push       {lr}
    push       {r5}
    bl         CustomScreen_Main
    pop        {r5}
    tst        r0,r0
    bne        LAB_08007632
    mov        r0,#0x1e
    strh       r0,[r5,#0x2e]
    mov        r0,#0x10
    strb       r0,[r5,#0x2]
LAB_08007632:
    pop        {pc}


_ts BattleT2_5_4
    push       {lr}
    bl         BattleT2_DecreaseGeneralCounter
    bne        LAB_08007644
    mov        r0,#0x1e
    strh       r0,[r5,#0x2e]
    mov        r0,#0x14
    strb       r0,[r5,#0x2]
LAB_08007644:
    pop        {pc}


_nt BattleT2_5_5
    push       {lr}
    bl         BattleT2_DecreaseGeneralCounter
    bne        LAB_08007656
    mov        r0,#0x10
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
LAB_08007656:
    pop        {pc}


_ts Text_SetTextPointer_Tutorial2
    push       {lr}
    add        r1,r0,#0x0
    ldr        r0,PTR_textDict_Battle_Tutorial2_08007668
    push       {r5}
    bl         Text_LoadDialogue
    pop        {r5}
    pop        {pc}

    .align 2, 0

PTR_textDict_Battle_Tutorial2_08007668:
    .word textDict_Battle_Tutorial2


_ts BattleT2_DecreaseGeneralCounter
    ldrh       r0,[r5,#0x2e]
    sub        r0,#0x1
    strh       r0,[r5,#0x2e]
    mov        pc,lr


_ts CheckButtonAToggled_1
    mov        r7,r10
    ldr        r7,[r7,#0x4]
    ldrh       r0,[r7,#0x2]
    mov        r1,#0x1
    tst        r0,r1
    mov        pc,lr
