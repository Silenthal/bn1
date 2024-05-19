#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts dummy_WWW
    push       {lr}
    pop        {pc}


_ts GraphicDataSetup_WWW
    push       {lr}
    mov        r7,r10
    ldr        r0,PTR_MapExitList_WWW_0803d8fc
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
    ldr        r0,PTR_gDstCompressedSpriteData_0803d900
    bl         SpriteLz_Init
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrb       r1,[r7,#0x5]
    lsl        r1,r1,#0x2
    ldr        r0,PTR_SpriteList_WWW_0803d904
    ldr        r0,[r0,r1]
    bl         SpriteLz_DecompressSpriteList
    pop        {r5}
    pop        {pc}

    .align 2, 0

global_label SpriteList_WWW
    .word SpriteList_WWW_Base
    .word SpriteList_WWW_Base
    .word SpriteList_WWW_Base
    .word SpriteList_WWW_Base
    .word SpriteList_WWW_Base
    .word SpriteList_WWW_Base

SpriteList_WWW_Base:
    .short 0x120
    .short -1

PTR_MapExitList_WWW_0803d8fc:
    .word MapExitList_WWW

PTR_gDstCompressedSpriteData_0803d900:
    .word gDstCompressedSpriteData

PTR_SpriteList_WWW_0803d904:
    .word SpriteList_WWW
