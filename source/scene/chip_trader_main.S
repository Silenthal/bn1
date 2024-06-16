#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Scene_ChipTraderMain
    push       {lr}
    ldr        r0,PTR_PTR_Scene_ChipTraderMain_0_Start_08085f38
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_Scene_ChipTraderMain_0_Start_08085de8:
    .word Scene_ChipTraderMain_0_Start
    .word Scene_ChipTraderMain_1_StartDialogue
    .word Scene_ChipTraderMain_2_StartSlideInChip
    .word Scene_ChipTraderMain_3_FinishSlideInChip
    .word Scene_ChipTraderMain_4_End


_ts Scene_ChipTraderMain_0_Start
    push       {lr}
    push       {r5}
    bl         PlayerAnimation_Lock
    bl         Flag_SetPlayerInactive
    pop        {r5}
    mov        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts Scene_ChipTraderMain_1_StartDialogue
    push       {lr}
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_08085e92
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    push       {r5}
    ldr        r0,[r0,#0x28]
    ldrb       r0,[r0,#0x14]
    mov        r1,#0x7
    and        r0,r1
    bl         PlayerAnimation_SetState
    pop        {r5}
    ldr        r7,PTR_gChipTrader_08085f3c
    ldrh       r0,[r7,#0x4]
    cmp        r0,#0xff
    bne        LAB_08085e54
    mov        r2,#0x0
    strh       r2,[r7,#0x4]
    strh       r2,[r7,#0x3a]
    strh       r2,[r7,#0x3c]
    push       {r5}
    bl         PlayerAnimation_Unlock
    bl         Flag_SetPlayerActive
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
    b          LAB_08085e92
LAB_08085e54:
    mov        r6,r10
    ldr        r6,[r6,#0x48]
    ldrh       r2,[r7,#0x3a]
    str        r2,[r6,#0x30]
    ldrh       r2,[r7,#0x3c]
    str        r2,[r6,#0x34]
    mov        r1,#0x3
    cmp        r0,#0x3
    beq        LAB_08085e68
    mov        r1,#0x9
LAB_08085e68:
    push       {r5,r7}
    ldr        r0,PTR_textDict_ChipTrader_08085f40
    bl         Text_LoadDialogue
    pop        {r5,r7}
    push       {r5,r7}
    ldrh       r0,[r7,#0x3a]
    ldrh       r1,[r7,#0x3c]
    ldr        r2,PTR_DAT_08085f44
    ldr        r3,PTR_DAT_08085f48
    mov        r4,#0xb
    lsl        r4,r4,#0x5
    bl         Menu_LoadChipDataCustom
    pop        {r5,r7}
    mov        r2,#0x0
    strh       r2,[r7,#0x4]
    strh       r2,[r7,#0x3a]
    strh       r2,[r7,#0x3c]
    mov        r0,#0x8
    strb       r0,[r5,#0x0]
LAB_08085e92:
    pop        {pc}


_ts Scene_ChipTraderMain_2_StartSlideInChip
    push       {lr}
    mov        r0,#0x6
    bl         Flag_Get400
    beq        LAB_08085ea8
    mov        r0,#0xa
    neg        r0,r0
    strb       r0,[r5,#0x4]
    mov        r0,#0xc
    strb       r0,[r5,#0x0]
LAB_08085ea8:
    pop        {pc}

    .align 2, 0



_ts Scene_ChipTraderMain_3_FinishSlideInChip
    push       {lr}
    mov        r1,#0x4
    ldrsb      r0,[r5,r1]
    add        r0,#0x1
    cmp        r0,#0x0
    blt        LAB_08085eba
    mov        r0,#0x0
LAB_08085eba:
    strb       r0,[r5,r1]
    push       {r5}
    mov        r1,#0x0
    bl         Scene_ChipTraderMain_SlideChip
    pop        {r5}
    mov        r0,#0x6
    bl         Flag_Get400
    bne        LAB_08085ed2
    mov        r0,#0x10
    strb       r0,[r5,#0x0]
LAB_08085ed2:
    pop        {pc}


_ts Scene_ChipTraderMain_4_End
    push       {lr}
    mov        r2,#0xa
    neg        r2,r2
    mov        r1,#0x4
    ldrsb      r0,[r5,r1]
    sub        r0,#0x1
    cmp        r0,r2
    bgt        LAB_08085ee6
    add        r0,r2,#0x0
LAB_08085ee6:
    strb       r0,[r5,r1]
    push       {r5}
    mov        r1,#0x0
    bl         Scene_ChipTraderMain_SlideChip
    pop        {r5}
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08085f0e
    push       {r5}
    bl         PlayerAnimation_Unlock
    bl         Flag_SetPlayerActive
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
LAB_08085f0e:
    pop        {pc}


_ts Scene_ChipTraderMain_SlideChip
    push       {r5,lr}
    mov        r8,r0
    mov        r9,r1
    mov        r2,#0x0
    ldr        r3,PTR_tilemapChipTraderChipBG_08085f4c
    mov        r4,#0xa
    mov        r5,#0xd
    bl         LC_Screen_SafeCopyTileMapRect
    mov        r0,#0x1
    add        r0,r8
    mov        r1,#0x1
    add        r1,r9
    mov        r2,#0x0
    ldr        r3,PTR_tilemapChipTraderChipFG_08085f50
    mov        r4,#0x8
    mov        r5,#0xb
    bl         LC_Screen_SafeCopyTileMapRect
    pop        {r5,pc}

PTR_PTR_Scene_ChipTraderMain_0_Start_08085f38:
    .word PTR_Scene_ChipTraderMain_0_Start_08085de8

PTR_gChipTrader_08085f3c:
    .word gChipTrader

PTR_textDict_ChipTrader_08085f40:
    .word textDict_ChipTrader

PTR_DAT_08085f44:
    .word 0x600a000

PTR_DAT_08085f48:
    .word 0x2029000

PTR_tilemapChipTraderChipBG_08085f4c:
    .word tilemapChipTraderChipBG

PTR_tilemapChipTraderChipFG_08085f50:
    .word tilemapChipTraderChipFG
