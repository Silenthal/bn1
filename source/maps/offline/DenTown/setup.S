#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts dummy_DenTown
    push       {lr}
    pop        {pc}


_ts GraphicDataSetup_DenTown
    push       {lr}
    mov        r7,r10
    ldr        r0,PTR_MapExitList_DenTown_08035f98
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
    ldr        r0,PTR_gDstCompressedSpriteData_08035f9c
    bl         SpriteLz_Init
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrb       r1,[r7,#0x5]
    lsl        r1,r1,#0x2
    ldr        r0,PTR_SpriteList_DenTown_08035fa0
    ldr        r0,[r0,r1]
    bl         SpriteLz_DecompressSpriteList
    pop        {r5}
    pop        {pc}

    .align 2, 0

global_label SpriteList_DenTown
    .word SpriteList_DenTown_Center
    .word SpriteList_DenTown_None
    .word SpriteList_DenTown_Block_1
    .word SpriteList_DenTown_Block_2
    .word SpriteList_DenTown_Block_3
    .word SpriteList_DenTown_Block_4
    .word SpriteList_DenTown_None
    .word SpriteList_DenTown_Summer_School

SpriteList_DenTown_Center:
    .short 0x103
    .short 0x104
    .short 0x10E
    .short 0x10D
    .short -1

SpriteList_DenTown_Block_1:
    .short 0x103
    .short 0x104
    .short 0x10E
    .short 0x10D
    .short -1

SpriteList_DenTown_Block_2:
    .short 0x103
    .short 0x104
    .short 0x10E
    .short 0x10D
    .short -1

SpriteList_DenTown_Block_3:
    .short 0x103
    .short 0x104
    .short 0x10E
    .short 0x10D
    .short -1

SpriteList_DenTown_Block_4:
    .short 0x103
    .short 0x104
    .short 0x10E
    .short 0x10D
    .short -1

SpriteList_DenTown_Summer_School:
    .short 0xD0
    .short -1

SpriteList_DenTown_None:
    .short -1

PTR_MapExitList_DenTown_08035f98:
    .word MapExitList_DenTown

PTR_gDstCompressedSpriteData_08035f9c:
    .word gDstCompressedSpriteData

PTR_SpriteList_DenTown_08035fa0:
    .word SpriteList_DenTown
