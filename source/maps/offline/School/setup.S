#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts dummy_School
    push       {lr}
    pop        {pc}


_ts GraphicDataSetup_School
    push       {lr}
    mov        r7,r10
    ldr        r0,PTR_MapExitList_School_08024330
    ldr        r1,[r7,#Main_mapChange]
    ldr        r2,[r7,#0x8]
    ldrb       r3,[r2,#0x5]
    lsl        r4,r3,#0x2
    add        r0,r0,r4
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
    ldr        r0,PTR_gDstCompressedSpriteData_08024334
    bl         SpriteLz_Init
    LoadMain world, r7, r7
    ldrb       r1,[r7,#0x5]
    lsl        r1,r1,#0x2
    ldr        r0,PTR_SpriteList_School_08024338
    ldr        r0,[r0,r1]
    bl         SpriteLz_DecompressSpriteList
    pop        {r5}
    pop        {pc}

    .align 2, 0

global_label SpriteList_School
    .word SpriteList_School_Class_5A
    .word SpriteList_School_Class_5B
    .word SpriteList_School_Library
    .word SpriteList_School_None
    .word SpriteList_School_None
    .word SpriteList_School_Class_1A
    .word SpriteList_School_Class_1B
    .word SpriteList_School_AV_Room
    .word SpriteList_School_Infirmary
    .word SpriteList_School_None
    .word SpriteList_School_None
    .word SpriteList_School_None
    .word SpriteList_School_None
    .word SpriteList_School_Staff_Lounge
    .word SpriteList_School_None

SpriteList_School_Class_5A:
    .short 0xD0
    .short -1

SpriteList_School_Class_5B:
    .short 0xD0
    .short -1

SpriteList_School_Library:
    .short 0xE9
    .short 0xEA
    .short -1

SpriteList_School_Class_1A:
    .short 0xD0
    .short -1

SpriteList_School_Class_1B:
    .short 0xD0
    .short -1

SpriteList_School_AV_Room:
    .short 0xD0
    .short -1

SpriteList_School_Infirmary:
    .short 0xD5
    .short 0xD6
    .short -1

SpriteList_School_Staff_Lounge:
    .short 0xD1
    .short 0xD2
    .short -1

SpriteList_School_None:
    .short -1

PTR_MapExitList_School_08024330:
    .word MapExitList_School

PTR_gDstCompressedSpriteData_08024334:
    .word gDstCompressedSpriteData

PTR_SpriteList_School_08024338:
    .word SpriteList_School
