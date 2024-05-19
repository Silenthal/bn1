#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts dummy_Oven_Comp
    push       {lr}
    pop        {pc}


_ts GraphicDataSetup_Oven_Comp
    push       {lr}
    mov        r7,r10
    ldr        r0,PTR_MapExitList_Oven_Comp_080431c4
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
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_gDstCompressedSpriteData_080431c8
    bl         SpriteLz_Init
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrb       r1,[r7,#0x5]
    lsl        r1,r1,#0x2
    ldr        r0,PTR_SpriteList_Oven_Comp_080431cc
    ldr        r0,[r0,r1]
    bl         SpriteLz_DecompressSpriteList
    pop        {r5}
    pop        {pc}

    .align 2, 0

global_label SpriteList_Oven_Comp
    .word SpriteList_Oven_Comp_1
    .word SpriteList_Oven_Comp_2

SpriteList_Oven_Comp_1:
    .short 0xE4
    .short 0xE5
    .short -1

SpriteList_Oven_Comp_2:
    .short 0xE4
    .short 0xE5
    .short -1

SpriteList_Oven_Comp_None:
    .short -1

    .align 2, 0

PTR_MapExitList_Oven_Comp_080431c4:
    .word MapExitList_Oven_Comp

PTR_gDstCompressedSpriteData_080431c8:
    .word gDstCompressedSpriteData

PTR_SpriteList_Oven_Comp_080431cc:
    .word SpriteList_Oven_Comp
