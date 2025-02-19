#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


listCubeParam:
    .byte 0x03, 0x02, 0x64, 0xC8
    .byte 0x00, 0x01, 0x64, 0xC8


_ts ScreenDim_Cube
    push       {lr}
    ldr        r7,PTR_PTR_SD_Cube_0_Init_08098e68
    ldrb       r0,[r5,#0x0]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_SD_Cube_0_Init_08098e68:
    .word PTR_SD_Cube_0_Init_08098e6c

PTR_SD_Cube_0_Init_08098e6c:
    .word SD_Cube_0_Init
    .word SD_Cube_1_Main
    .word SD_Cube_2_FadeIn
    .word SD_Cube_3_Free


_ts SD_Cube_0_Init
    push       {lr}
    FadeOut_ScreenDim
    mov        r0,#0x1e
    strh       r0,[r5,#0x8]
    ldrb       r1,[r5,#0x5]
    add        r1,#0x5e
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Load
    pop        {r5}
    push       {r5}
    bl         BattleUi_ClearActiveChip
    pop        {r5}
    mov        r0,#0x4
    str        r0,[r5,#0x0]
    pop        {pc}


_ts SD_Cube_1_Main
    push       {lr}
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Main
    pop        {r5}
    tst        r0,r0
    bne        LAB_08098ee6
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Disable
    pop        {r5}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_08098ee6
    ldr        r7,PTR_PTR_SD_Cube_1_0_IceCube_08098ee8
    ldrb       r0,[r5,#0x5]
    lsl        r0,r0,#0x2
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    mov        r0,#0x3c
    strh       r0,[r5,#0x8]
    mov        r0,#0x8
    str        r0,[r5,#0x0]
LAB_08098ee6:
    pop        {pc}

PTR_PTR_SD_Cube_1_0_IceCube_08098ee8:
    .word PTR_SD_Cube_1_0_IceCube_08098eec

PTR_SD_Cube_1_0_IceCube_08098eec:
    .word SD_Cube_1_0_IceCube
    .word SD_Cube_1_1_RockCube


_ts SD_Cube_2_FadeIn
    push       {lr}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_08098f0e
    FadeIn_ScreenDim
    mov        r0,#0xc
    str        r0,[r5,#0x0]
LAB_08098f0e:
    pop        {pc}


_ts SD_Cube_3_Free
    push       {lr}
    LoadMain fade, r0, r7
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08098f2a
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_08098f2a:
    pop        {pc}


_ts SD_Cube_1_1_RockCube
    push       {lr}
    sub        sp,#0x14
    mov        r0,sp
    ldr        r7,PTR_DAT_08098f98
    ldr        r1,[r7,#0x0]
    ldr        r2,[r7,#0x4]
    ldrb       r3,[r5,#0x6]
    push       {r0}
    bl         Field_SearchExcludeFirstCol
    pop        {r0}
    tst        r1,r1
    beq        LAB_08098f8e
    add        r2,r1,#0x0
    push       {r0,r1}
    bl         ArrayShuffle
    pop        {r0,r1}
    add        r7,r0,#0x0
    cmp        r1,#0x3
    bls        LAB_08098f58
    mov        r1,#0x3
LAB_08098f58:
    sub        r1,#0x1
    bmi        LAB_08098f8e
    push       {r1,r7}
    ldrb       r0,[r7,r1]
    bl         Field_IndexToCellXY
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    ldr        r7,PTR_listCubeParam_08098f94
    ldrb       r0,[r5,#0x5]
    lsl        r0,r0,#0x2
    add        r7,r7,r0
    ldrb       r0,[r7,#0x0]
    ldrb       r3,[r7,#0x2]
    ldrb       r4,[r7,#0x1]
    ldrb       r6,[r7,#0x3]
    mov        r7,#0x0
    bl         Attack_Cube_Chip_Create
    tst        r7,r7
    beq        LAB_08098f8a
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r7,#0x0]
LAB_08098f8a:
    pop        {r1,r7}
    b          LAB_08098f58
LAB_08098f8e:
    add        sp,#0x14
    pop        {pc}

    .align 2, 0


PTR_listCubeParam_08098f94:
    .word listCubeParam

PTR_DAT_08098f98:
    .word DAT_08098f9c

DAT_08098f9c:
    .word 0x1

DAT_08098fa0:
    .word 0x830


_ts SD_Cube_1_0_IceCube
    push       {lr}
    LoadMain battle, r7, r7
    ldrb       r0,[r5,#0x6]
    lsl        r0,r0,#0x2
    add        r0,#0x40
    ldr        r7,[r7,r0]
    ldrb       r0,[r5,#0x6]
    push       {r7}
    bl         Field_GetAttackDirectionOffset
    pop        {r7}
    ldrb       r1,[r7,#0x18]
    add        r1,r1,r0
    ldrb       r2,[r7,#0x19]
    ldr        r7,PTR_listCubeParam_08098fe8
    ldrb       r0,[r5,#0x5]
    lsl        r0,r0,#0x2
    add        r7,r7,r0
    ldrb       r0,[r7,#0x0]
    ldrb       r3,[r7,#0x2]
    ldrb       r4,[r7,#0x1]
    ldrb       r6,[r7,#0x3]
    mov        r7,#0x0
    bl         Attack_Cube_Chip_Create
    tst        r7,r7
    beq        LAB_08098fe4
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r7,#0x0]
LAB_08098fe4:
    pop        {pc}

    .align 2, 0


PTR_listCubeParam_08098fe8:
    .word listCubeParam
