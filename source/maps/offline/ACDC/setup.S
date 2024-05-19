#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts dummy_ACDC
    push       {lr}
    pop        {pc}


_ts GraphicDataSetup_ACDC
    push       {lr}
    mov        r7,r10
    ldr        r0,PTR_MapExitList_ACDC_0802a5e8
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
    ldr        r0,PTR_gDstCompressedSpriteData_0802a5ec
    bl         SpriteLz_Init
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrb       r1,[r7,#0x5]
    lsl        r1,r1,#0x2
    ldr        r0,PTR_SpriteList_ACDC_0802a5f0
    ldr        r0,[r0,r1]
    bl         SpriteLz_DecompressSpriteList
    pop        {r5}
    pop        {pc}

    .align 2, 0

global_label SpriteList_ACDC
    .word SpriteList_ACDC_Town
    .word SpriteList_ACDC_School_Gate
    .word SpriteList_ACDC_Lan_Living_Room
    .word SpriteList_ACDC_Lan_Room
    .word SpriteList_ACDC_None
    .word SpriteList_ACDC_Mayl_Living_Room
    .word SpriteList_ACDC_Mayl_Room
    .word SpriteList_ACDC_Dex_Room
    .word SpriteList_ACDC_None
    .word SpriteList_ACDC_None
    .word SpriteList_ACDC_None
    .word SpriteList_ACDC_Higsbys
    .word SpriteList_ACDC_None

SpriteList_ACDC_Town:
    .short 0x117
    .short -1

SpriteList_ACDC_School_Gate:
    .short 0xF6
    .short 0x122
    .short -1

SpriteList_ACDC_Lan_Living_Room:
    .short 0xDD
    .short 0xDE
    .short 0xDF
    .short 0xE1
    .short 0xE8
    .short -1

SpriteList_ACDC_Lan_Room:
    .short 0xE0
    .short 0x12
    .short -1

SpriteList_ACDC_Mayl_Living_Room:
    .short 0xEB
    .short 0xEF
    .short 0xF0
    .short 0xF1
    .short -1

SpriteList_ACDC_Mayl_Room:
    .short 0xF2
    .short -1

SpriteList_ACDC_Dex_Room:
    .short 0xF3
    .short 0xF4
    .short -1

SpriteList_ACDC_Higsbys:
    .short 0xED
    .short 0xEE
    .short 0x123
    .short -1

SpriteList_ACDC_None:
    .short -1

    .align 2, 0

PTR_MapExitList_ACDC_0802a5e8:
    .word MapExitList_ACDC

PTR_gDstCompressedSpriteData_0802a5ec:
    .word gDstCompressedSpriteData

PTR_SpriteList_ACDC_0802a5f0:
    .word SpriteList_ACDC
