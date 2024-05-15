#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"



_ts dummy_Waterworks_Comp
    push       {lr}
    pop        {pc}


_ts GraphicDataSetup_Waterworks_Comp
    push       {lr}
    mov        r7,r10
    ldr        r0,PTR_MapExitList_Waterworks_Comp_08045788
    ldr        r1,[r7,#0x2c]
    ldr        r2,[r7,#0x8]
    ldrb       r3,[r2,#0x5]
    lsl        r3,r3,#0x2
    add        r0,r0,r3
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    str        r0,[r1,#0x14]
    push       {r5}
    ldrb       r0,[r5,#0x4]
    ldrb       r1,[r5,#0x5]
    bl         BGDM_Init
    pop        {r5}
    push       {r5}
    ldrb       r0,[r5,#0x4]
    ldrb       r1,[r5,#0x5]
    bl         Map_LoadBackgroundData
    pop        {r5}
    ldr        r0,[r5,#0x38]
    ldr        r1,[r5,#0x3c]
    ldr        r2,[r5,#0x40]
    ldrb       r3,[r5,#0x4]
    ldrb       r4,[r5,#0x5]
    push       {r5}
    bl         Camera_Init
    bl         BGDM_Load
    ldr        r0,PTR_dummy_1cb8_0804578c
    ldr        r1,PTR_BgUpdate_MoveUp_08045790
    ldr        r2,PTR_dummy_6928_08045794
    bl         BgUpdate_Set
    pop        {r5}
    ldrb       r0,[r5,#0x5]
    cmp        r0,#0x4
    bne        LAB_08045738
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrb       r7,[r7,#0x6]
    lsr        r7,r7,#0x4
    cmp        r7,#0x2
    bne        LAB_08045728
    mov        r0,#0xf2
    bl         Flag_GetBase
    beq        LAB_08045714
    push       {r5}
    ldr        r0,PTR_BgTask_8044880_08045798
    bl         BgTask_AddNew
    pop        {r5}
LAB_08045714:
    mov        r0,#0xf3
    bl         Flag_GetBase
    beq        LAB_08045738
    push       {r5}
    ldr        r0,PTR_BgTask_80443F0_0804579c
    bl         BgTask_AddNew
    pop        {r5}
    b          LAB_08045738
LAB_08045728:
    push       {r5}
    ldr        r0,PTR_BgTask_8044880_080457a0
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_80443F0_080457a4
    bl         BgTask_AddNew
    pop        {r5}
LAB_08045738:
    push       {r5}
    ldr        r0,PTR_gDstCompressedSpriteData_080457a8
    bl         SpriteLz_Init
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrb       r1,[r7,#0x5]
    lsl        r1,r1,#0x2
    ldr        r0,PTR_SpriteList_Waterworks_Comp_080457ac
    ldr        r0,[r0,r1]
    bl         SpriteLz_DecompressSpriteList
    pop        {r5}
    pop        {pc}

SpriteList_Waterworks_Comp:
    .word SpriteList_Waterworks_Comp_1
    .word SpriteList_Waterworks_Comp_2
    .word SpriteList_Waterworks_Comp_3
    .word SpriteList_Waterworks_Comp_4
    .word SpriteList_Waterworks_Comp_5
    .word SpriteList_Waterworks_Comp_6

SpriteList_Waterworks_Comp_1:
    .short 0x102
    .short -1

SpriteList_Waterworks_Comp_2:
    .short 0x102
    .short -1

SpriteList_Waterworks_Comp_3:
    .short 0x102
    .short -1

SpriteList_Waterworks_Comp_4:
    .short 0x102
    .short -1

SpriteList_Waterworks_Comp_5:
    .short 0x102
    .short -1

SpriteList_Waterworks_Comp_6:
    .short 0x102
    .short -1
    .short -1


_nt FUN_08045786
    pop        {pc}

PTR_MapExitList_Waterworks_Comp_08045788:
    .word MapExitList_Waterworks_Comp

PTR_dummy_1cb8_0804578c:
    .word dummy_1cb8

PTR_BgUpdate_MoveUp_08045790:
    .word BgUpdate_MoveUp

PTR_dummy_6928_08045794:
    .word dummy_6928_far

PTR_BgTask_8044880_08045798:
    .word BgTask_8044880

PTR_BgTask_80443F0_0804579c:
    .word BgTask_80443F0

PTR_BgTask_8044880_080457a0:
    .word BgTask_8044880

PTR_BgTask_80443F0_080457a4:
    .word BgTask_80443F0

PTR_gDstCompressedSpriteData_080457a8:
    .word gDstCompressedSpriteData

PTR_SpriteList_Waterworks_Comp_080457ac:
    .word SpriteList_Waterworks_Comp
