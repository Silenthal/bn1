#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set Battle_CopyChipHandIcons, 0x807c160

_nt Battle_Tutorial1
    push       {lr}
    ldr        r0,PTR_JT_R5_0C_6D54_08006d6c
    ldrb       r1,[r5,#0x1]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

JT_R5_0C_6D54:
    .word BattleR_0_SpawnPlayerWithHP
    .word BattleT1_1
    .word BattleT1_2
    .word BattleT1_3
    .word BattleT1_4
    .word BattleT1_5
PTR_JT_R5_0C_6D54_08006d6c:
    .word JT_R5_0C_6D54


_ts BattleT1_1
    push       {lr}
    ldrb       r0,[r5,#0x2]
    tst        r0,r0
    beq        LAB_08006d82
    push       {r5}
    bl         CustomScreenT1_Main
    pop        {r5}
    tst        r0,r0
LAB_08006d82:
    ldr        r7,PTR_JT_R5_0C_6D90_08006dc4
    ldrb       r0,[r5,#0x2]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0

JT_R5_0C_6D90:
    .word BattleT1_1_0
    .word BattleT1_1_1
    .word BattleT1_1_2
    .word BattleT1_1_3
    .word BattleT1_1_4
    .word BattleT1_1_5
    .word BattleT1_1_6
    .word BattleT1_1_7
    .word BattleT1_1_8
    .word BattleT1_1_9
    .word BattleT1_1_10
    .word BattleT1_1_11
    .word BattleT1_1_12
PTR_JT_R5_0C_6D90_08006dc4:
    .word JT_R5_0C_6D90


_ts BattleT1_1_0
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


_ts BattleT1_1_1
    push       {lr}
    bl         BattleT1_DecreaseGeneralCounter
    bne        LAB_08006e02
    mov        r0,#0x0
    bl         Text_SetTextPointer_Tutorial1
    mov        r0,#0x8
    strb       r0,[r5,#0x2]
LAB_08006e02:
    pop        {pc}


_ts BattleT1_1_2
    push       {lr}
    bl         Text_CheckIfDialogActive
    bne        LAB_08006e16
    mov        r0,#0x5
    bl         Text_SetTextPointer_Tutorial1
    mov        r0,#0x14
    strb       r0,[r5,#0x2]
LAB_08006e16:
    pop        {pc}


_ts BattleT1_1_3
    push       {lr}
    bl         Text_CheckIfDialogActive
    bne        LAB_08006e28
    mov        r0,#0x78
    strh       r0,[r5,#0x2e]
    mov        r0,#0x10
    strb       r0,[r5,#0x2]
LAB_08006e28:
    pop        {pc}


_nt BattleT1_1_4
    push       {lr}
    bl         BattleT1_CheckButtonAToggled
    bne        LAB_08006e38
    bl         BattleT1_DecreaseGeneralCounter
    bne        LAB_08006e42
LAB_08006e38:
    mov        r0,#0x7
    @ "Chip icons are shown at the bottom of the setup window."
    bl         Text_SetTextPointer_Tutorial1
    mov        r0,#0x14
    strb       r0,[r5,#0x2]
LAB_08006e42:
    mov        r0,#0x78
    mov        r1,#0x50
    bl         DrawTutorialArrow
    pop        {pc}


_ts BattleT1_1_5
    push       {lr}
    bl         Text_CheckIfDialogActive
    bne        LAB_08006e5c
    mov        r0,#0x78
    strh       r0,[r5,#0x2e]
    mov        r0,#0x18
    strb       r0,[r5,#0x2]
LAB_08006e5c:
    pop        {pc}


_nt BattleT1_1_6
    push       {lr}
    bl         BattleT1_CheckButtonAToggled
    bne        LAB_08006e6c
    bl         BattleT1_DecreaseGeneralCounter
    bne        LAB_08006e76
LAB_08006e6c:
    mov        r0,#0x8
    bl         Text_SetTextPointer_Tutorial1
    mov        r0,#0x1c
    strb       r0,[r5,#0x2]
LAB_08006e76:
    mov        r0,#0x10
    mov        r1,#0x78
    bl         DrawTutorialArrow
    mov        r0,#0x20
    mov        r1,#0x78
    bl         DrawTutorialArrow
    mov        r0,#0x30
    mov        r1,#0x78
    bl         DrawTutorialArrow
    mov        r0,#0x40
    mov        r1,#0x78
    bl         DrawTutorialArrow
    mov        r0,#0x50
    mov        r1,#0x78
    bl         DrawTutorialArrow
    pop        {pc}


_ts BattleT1_1_7
    push       {lr}
    bl         Text_CheckIfDialogActive
    bne        LAB_08006eb0
    mov        r0,#0x78
    strh       r0,[r5,#0x2e]
    mov        r0,#0x20
    strb       r0,[r5,#0x2]
LAB_08006eb0:
    pop        {pc}


_nt BattleT1_1_8
    push       {lr}
    bl         BattleT1_CheckButtonAToggled
    bne        LAB_08006ec0
    bl         BattleT1_DecreaseGeneralCounter
    bne        LAB_08006eca
LAB_08006ec0:
    mov        r0,#0x9
    bl         Text_SetTextPointer_Tutorial1
    mov        r0,#0x24
    strb       r0,[r5,#0x2]
LAB_08006eca:
    mov        r0,#0x3c
    mov        r1,#0x5d
    bl         DrawTutorialArrow
    pop        {pc}


_ts BattleT1_1_9
    push       {lr}
    bl         Text_CheckIfDialogActive
    bne        LAB_08006ee4
    mov        r0,#0x78
    strh       r0,[r5,#0x2e]
    mov        r0,#0x28
    strb       r0,[r5,#0x2]
LAB_08006ee4:
    pop        {pc}


_nt BattleT1_1_10
    push       {lr}
    bl         BattleT1_CheckButtonAToggled
    bne        LAB_08006ef4
    bl         BattleT1_DecreaseGeneralCounter
    bne        LAB_08006efe
LAB_08006ef4:
    mov        r0,#0xa
    bl         Text_SetTextPointer_Tutorial1
    mov        r0,#0x2c
    strb       r0,[r5,#0x2]
LAB_08006efe:
    mov        r0,#0xb4
    mov        r1,#0x50
    bl         DrawTutorialArrow
    mov        r0,#0xdc
    mov        r1,#0x80
    bl         DrawTutorialArrow
    pop        {pc}


_ts BattleT1_1_11
    push       {lr}
    bl         Text_CheckIfDialogActive
    bne        LAB_08006f20
    mov        r0,#0x78
    strh       r0,[r5,#0x2e]
    mov        r0,#0x30
    strb       r0,[r5,#0x2]
LAB_08006f20:
    pop        {pc}


_nt BattleT1_1_12
    push       {lr}
    bl         BattleT1_CheckButtonAToggled
    bne        LAB_08006f30
    bl         BattleT1_DecreaseGeneralCounter
    bne        LAB_08006f38
LAB_08006f30:
    mov        r0,#0x8
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strb       r0,[r5,#0x2]
LAB_08006f38:
    mov        r0,#0x10
    mov        r1,#0x70
    bl         DrawTutorialArrow
    mov        r0,#0x30
    mov        r1,#0x70
    bl         DrawTutorialArrow
    pop        {pc}


_nt BattleT1_2
    push       {lr}
    ldr        r7,PTR_PTR_BattleT1_2_0_SelectChipData_08006f78
    ldrb       r0,[r5,#0x2]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    push       {r5}
    bl         CustomScreenT1_Main
    pop        {r5}
    tst        r0,r0
    bne        LAB_08006f6a
    mov        r0,#0xc
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strb       r0,[r5,#0x2]
LAB_08006f6a:
    pop        {pc}

    .align 2, 0

PTR_BattleT1_2_0_SelectChipData_08006f6c:
    .word BattleT1_2_0_SelectChipData
    .word BattleT1_2_1
    .word dummy_6f9c
PTR_PTR_BattleT1_2_0_SelectChipData_08006f78:
    .word PTR_BattleT1_2_0_SelectChipData_08006f6c


_ts BattleT1_2_0_SelectChipData
    push       {lr}
    mov        r0,#0x14
    bl         Text_SetTextPointer_Tutorial1
    mov        r0,#0x4
    strb       r0,[r5,#0x2]
    pop        {pc}


_nt BattleT1_2_1
    push       {lr}
    bl         Text_CheckIfDialogActive
    bne        LAB_08006f9a
    mov        r0,#0x8
    strb       r0,[r5,#0x2]
    bl         CustomScreen_EnableInput
LAB_08006f9a:
    pop        {pc}


_nt dummy_6f9c
    push       {lr}
    pop        {pc}


_ts BattleT1_3
    push       {lr}
    ldr        r7,PTR_PTR_BattleT1_3_0_08006fe0
    ldrb       r0,[r5,#0x2]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0

PTR_BattleT1_3_0_08006fb0:
    .word BattleT1_3_0
    .word BattleT1_3_1
    .word BattleT1_3_2
    .word BattleT1_3_3
    .word BattleT1_3_4
    .word BattleT1_3_5
    .word BattleT1_3_6
    .word BattleT1_3_7
    .word BattleT1_3_8
    .word BattleT1_3_9
    .word BattleT1_3_10
    .word BattleT1_3_11
PTR_PTR_BattleT1_3_0_08006fe0:
    .word PTR_BattleT1_3_0_08006fb0


_ts BattleT1_3_0
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0x0
    push       {r5}
    bl         BattleUi_DrawFullCustomGauge
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         Battle_CopyBattleHand
    bl         Battle_CopyChipHandIcons
    bl         Battle_SetState_InBattle
    mov        r0,#0x28
    bl         Text_SetTextPointer_Tutorial1
    mov        r0,#0x4
    strb       r0,[r5,#0x2]
    pop        {pc}


_nt BattleT1_3_1
    push       {lr}
    bl         Text_CheckIfDialogActive
    bne        LAB_0800701e
    mov        r0,#0x78
    strh       r0,[r5,#0x2e]
    mov        r0,#0x10
    strb       r0,[r5,#0x2]
LAB_0800701e:
    pop        {pc}


_ts BattleT1_3_2
    push       {lr}
    bl         BattleT1_CheckButtonAToggled
    bne        LAB_0800702e
    bl         BattleT1_DecreaseGeneralCounter
    bne        LAB_08007038
LAB_0800702e:
    mov        r0,#0x29
    bl         Text_SetTextPointer_Tutorial1
    mov        r0,#0xc
    strb       r0,[r5,#0x2]
LAB_08007038:
    mov        r0,#0x64
    mov        r1,#0x54
    bl         DrawTutorialArrow
    mov        r0,#0x64
    mov        r1,#0x6c
    bl         DrawTutorialArrow
    mov        r0,#0x64
    mov        r1,#0x84
    bl         DrawTutorialArrow
    mov        r0,#0x3c
    mov        r1,#0x54
    bl         DrawTutorialArrow
    mov        r0,#0x3c
    mov        r1,#0x6c
    bl         DrawTutorialArrow
    mov        r0,#0x3c
    mov        r1,#0x84
    bl         DrawTutorialArrow
    mov        r0,#0x14
    mov        r1,#0x54
    bl         DrawTutorialArrow
    mov        r0,#0x14
    mov        r1,#0x6c
    bl         DrawTutorialArrow
    mov        r0,#0x14
    mov        r1,#0x84
    bl         DrawTutorialArrow
    pop        {pc}


_nt BattleT1_3_3
    push       {lr}
    bl         Text_CheckIfDialogActive
    bne        LAB_08007092
    mov        r0,#0x78
    strh       r0,[r5,#0x2e]
    mov        r0,#0x10
    strb       r0,[r5,#0x2]
LAB_08007092:
    pop        {pc}


_ts BattleT1_3_4
    push       {lr}
    bl         BattleT1_CheckButtonAToggled
    bne        LAB_080070a2
    bl         BattleT1_DecreaseGeneralCounter
    bne        LAB_080070ac
LAB_080070a2:
    mov        r0,#0x2a
    bl         Text_SetTextPointer_Tutorial1
    mov        r0,#0x14
    strb       r0,[r5,#0x2]
LAB_080070ac:
    mov        r0,#0x18
    mov        r1,#0x10
    bl         DrawTutorialArrow
    pop        {pc}


_nt BattleT1_3_5
    push       {lr}
    bl         Text_CheckIfDialogActive
    bne        LAB_08007092
    mov        r0,#0x78
    strh       r0,[r5,#0x2e]
    mov        r0,#0x18
    strb       r0,[r5,#0x2]
    pop        {pc}


_ts BattleT1_3_6
    push       {lr}
    bl         BattleT1_CheckButtonAToggled
    bne        LAB_080070d6
    bl         BattleT1_DecreaseGeneralCounter
    bne        LAB_080070e0
LAB_080070d6:
    mov        r0,#0x2d
    bl         Text_SetTextPointer_Tutorial1
    mov        r0,#0x1c
    strb       r0,[r5,#0x2]
LAB_080070e0:
    mov        r0,#0x46
    mov        r1,#0x45
    bl         DrawTutorialArrow
    pop        {pc}


_nt BattleT1_3_7
    push       {lr}
    bl         Text_CheckIfDialogActive
    bne        LAB_080070fc
    mov        r0,#0x2e
    bl         Text_SetTextPointer_Tutorial1
    mov        r0,#0x20
    strb       r0,[r5,#0x2]
LAB_080070fc:
    pop        {pc}


_nt BattleT1_3_8
    push       {lr}
    bl         Text_CheckIfDialogActive
    bne        LAB_08007110
    mov        r0,#0x2b
    bl         Text_SetTextPointer_Tutorial1
    mov        r0,#0x24
    strb       r0,[r5,#0x2]
LAB_08007110:
    pop        {pc}


_nt BattleT1_3_9
    push       {lr}
    bl         Text_CheckIfDialogActive
    bne        LAB_08007122
    mov        r0,#0x78
    strh       r0,[r5,#0x2e]
    mov        r0,#0x28
    strb       r0,[r5,#0x2]
LAB_08007122:
    pop        {pc}


_ts BattleT1_3_10
    push       {lr}
    bl         BattleT1_CheckButtonAToggled
    bne        LAB_08007132
    bl         BattleT1_DecreaseGeneralCounter
    bne        LAB_0800713c
LAB_08007132:
    mov        r0,#0x2c
    bl         Text_SetTextPointer_Tutorial1
    mov        r0,#0x2c
    strb       r0,[r5,#0x2]
LAB_0800713c:
    mov        r0,#0x78
    mov        r1,#0x10
    bl         DrawTutorialArrow
    pop        {pc}


_nt BattleT1_3_11
    push       {lr}
    bl         Text_CheckIfDialogActive
    bne        LAB_08007156
    mov        r0,#0x10
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strb       r0,[r5,#0x2]
LAB_08007156:
    pop        {pc}


_ts BattleT1_4
    push       {lr}
    bl         BattleR_2_Main
    cmp        r0,#0x3
    bne        LAB_0800716c
    mov        r0,#0x14
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
    pop        {pc}
LAB_0800716c:
    cmp        r0,#0x1
    bne        LAB_08007174
    mov        r1,#0x0
    b          LAB_0800717a
LAB_08007174:
    cmp        r0,#0x2
    bne        LAB_08007184
    mov        r1,#0x4
LAB_0800717a:
    mov        r0,#0x8
    strb       r0,[r5,#0x0]
    strb       r1,[r5,#0x1]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
LAB_08007184:
    pop        {pc}


_nt BattleT1_5
    push       {lr}
    ldr        r7,PTR_PTR_BattleT1_5_0_080071ac
    ldrb       r0,[r5,#0x2]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}
PTR_BattleT1_5_0_08007194:
    .word BattleT1_5_0
    .word BattleT1_5_1
    .word dummy_71ee
    .word BattleT1_5_3
    .word BattleT1_5_4
    .word BattleT1_5_5
PTR_PTR_BattleT1_5_0_080071ac:
    .word PTR_BattleT1_5_0_08007194


_ts BattleT1_5_0
    push       {lr}
    ldrb       r0,[r5,#0xc]
    cmp        r0,#0x3
    bpl        LAB_080071be
    mov        r0,#0x32
    bl         Text_SetTextPointer_Tutorial1
LAB_080071be:
    mov        r0,#0x4
    strb       r0,[r5,#0x2]
    pop        {pc}


_ts BattleT1_5_1
    push       {lr}
    bl         Text_CheckIfDialogActive
    bne        LAB_080071ec
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
LAB_080071ec:
    pop        {pc}


_nt dummy_71ee
    pop        {pc}


_ts BattleT1_5_3
    push       {lr}
    push       {r5}
    bl         CustomScreen_Main
    pop        {r5}
    tst        r0,r0
    bne        LAB_08007206
    mov        r0,#0x1e
    strh       r0,[r5,#0x2e]
    mov        r0,#0x10
    strb       r0,[r5,#0x2]
LAB_08007206:
    pop        {pc}


_ts BattleT1_5_4
    push       {lr}
    bl         BattleT1_DecreaseGeneralCounter
    bne        LAB_08007218
    mov        r0,#0x1e
    strh       r0,[r5,#0x2e]
    mov        r0,#0x14
    strb       r0,[r5,#0x2]
LAB_08007218:
    pop        {pc}


_nt BattleT1_5_5
    push       {lr}
    bl         BattleT1_DecreaseGeneralCounter
    bne        LAB_0800722a
    mov        r0,#0x10
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
LAB_0800722a:
    pop        {pc}


_ts Text_SetTextPointer_Tutorial1
    push       {lr}
    add        r1,r0,#0x0
    ldr        r0,PTR_textDict_Battle_Tutorial1_0800723c
    push       {r5}
    bl         Text_LoadDialogue
    pop        {r5}
    pop        {pc}
PTR_textDict_Battle_Tutorial1_0800723c:
    .word textDict_Battle_Tutorial1


_ts Text_CheckIfDialogActive
    ldr        r0,PTR_gTextOptionFlags_0800724c
    ldr        r0,[r0,#0x0]
    mov        r1,#0x80
    tst        r1,r0
    mov        pc,lr

    .align 2, 0

PTR_gTextOptionFlags_0800724c:
    .word gTextOptionFlags


_ts DrawTutorialArrow
    push       {r5,lr}
    ldr        r7,PTR_gFrameCounter_080072a0
    ldrh       r2,[r7,#0x0]
    mov        r3,#0x8
    and        r2,r3
    lsr        r2,r2,#0x1
    ldr        r6,PTR_ObjectTileAttributes_0800729c
    ldr        r6,[r6,r2]
    push       {r0,r1,r6}
    mov        r2,#0x40
    lsl        r2,r2,#0x8
    orr        r0,r2
    lsl        r0,r0,#0x10
    orr        r0,r1
    add        r1,r6,#0x0
    mov        r2,#0x0
    mov        r3,#0x0
    bl         Oam_AddObject
    pop        {r0,r1,r6}
    add        r1,#0x10
    lsl        r0,r0,#0x10
    mov        r2,#0x40
    lsl        r2,r2,#0x8
    orr        r1,r2
    orr        r0,r1
    add        r1,r6,#0x4
    mov        r2,#0x0
    mov        r3,#0x0
    bl         Oam_AddObject
    pop        {r5,pc}


_ts dummy_7290
    push       {lr}
    pop        {pc}

    .align 2, 0

ObjectTileAttributes_08007294:
    obj_attr_2 0x3B4, 0, 0xD
    .short 0
    obj_attr_2 0x3BA, 0, 0xD
    .short 0
PTR_ObjectTileAttributes_0800729c:
    .word ObjectTileAttributes_08007294
PTR_gFrameCounter_080072a0:
    .word gFrameCounter

    .word 0x80072a4
    .word 2
    .word 0
    .word 0x4000
    .word 4
    .short 0x4000


_nt BattleT1_DecreaseGeneralCounter
    ldrh       r0,[r5,#0x2e]
    sub        r0,#0x1
    strh       r0,[r5,#0x2e]
    mov        pc,lr


_nt BattleT1_CheckButtonAToggled
    mov        r7,r10
    ldr        r7,[r7,#0x4]
    ldrh       r0,[r7,#0x2]
    mov        r1,#0x1
    tst        r0,r1
    mov        pc,lr

    .align 2, 0
