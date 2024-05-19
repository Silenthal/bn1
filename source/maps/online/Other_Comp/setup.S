#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts dummy_Other_Comp
    push       {lr}
    pop        {pc}


_ts GraphicDataSetup_Other_Comp
    push       {lr}
    mov        r7,r10
    ldr        r0,PTR_MapExitList_Other_Comp_08050474
    ldr        r1,[r7,#0x2c]
    ldr        r2,[r7,#0x8]
    ldrb       r3,[r2,#0x5]
    lsl        r3,r3,#0x2
    add        r0,r0,r3
    ldr        r0,[r0,#0x0]
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
    ldr        r0,PTR_dummy_1cb8_08050478
    ldr        r1,PTR_BgUpdate_MoveUpLeft_0805047c
    ldr        r2,PTR_dummy_6928_08050480
    bl         BgUpdate_Set
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_gDstCompressedSpriteData_08050484
    bl         SpriteLz_Init
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrb       r1,[r7,#0x5]
    lsl        r1,r1,#0x2
    ldr        r0,PTR_SpriteList_Other_Comp_08050488
    ldr        r0,[r0,r1]
    bl         SpriteLz_DecompressSpriteList
    pop        {r5}
    pop        {pc}

SpriteList_Other_Comp:
    .word SpriteList_Other_Doghouse_Comp
    .word SpriteList_Other_Doghouse_Comp
    .word SpriteList_Other_Doghouse_Comp
    .word SpriteList_Other_Doghouse_Comp
    .word SpriteList_Other_Doghouse_Comp
    .word SpriteList_Other_Doghouse_Comp
    .word SpriteList_Other_Doghouse_Comp
    .word SpriteList_Other_Doghouse_Comp
    .word SpriteList_Other_Doghouse_Comp
    .word SpriteList_Other_Doghouse_Comp
    .word SpriteList_Other_Doghouse_Comp
    .word SpriteList_Other_Doghouse_Comp
    .word SpriteList_Other_Doghouse_Comp

SpriteList_Other_Doghouse_Comp:
    .short 0xF7
    .short -1
    .short -1

    .align 2, 0

PTR_MapExitList_Other_Comp_08050474:
    .word MapExitList_Other_Comp

PTR_dummy_1cb8_08050478:
    .word dummy_1cb8

PTR_BgUpdate_MoveUpLeft_0805047c:
    .word BgUpdate_MoveUpLeft

PTR_dummy_6928_08050480:
    .word dummy_6928_far

PTR_gDstCompressedSpriteData_08050484:
    .word gDstCompressedSpriteData

PTR_SpriteList_Other_Comp_08050488:
    .word SpriteList_Other_Comp
