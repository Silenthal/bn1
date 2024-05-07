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

SpriteList_DenTown:
    .word SpriteList_DenTown_Center
    .word SpriteList_DenTown_Station
    .word SpriteList_DenTown_Block_1
    .word SpriteList_DenTown_Block_2
    .word SpriteList_DenTown_Block_3
    .word SpriteList_DenTown_Block_4
    .word SpriteList_DenTown_Station
    .word SpriteList_DenTown_Summer_School

SpriteList_DenTown_Center:
    .byte 0x03
    .byte 0x01
    .byte 0x04
    .byte 0x01
    .byte 0x0E
    .byte 0x01
    .byte 0x0D
    .byte 0x01
    .byte -1
    .byte -1

SpriteList_DenTown_Block_1:
    .byte 0x03
    .byte 0x01
    .byte 0x04
    .byte 0x01
    .byte 0x0E
    .byte 0x01
    .byte 0x0D
    .byte 0x01
    .byte -1
    .byte -1

SpriteList_DenTown_Block_2:
    .byte 0x03
    .byte 0x01
    .byte 0x04
    .byte 0x01
    .byte 0x0E
    .byte 0x01
    .byte 0x0D
    .byte 0x01
    .byte -1
    .byte -1

SpriteList_DenTown_Block_3:
    .byte 0x03
    .byte 0x01
    .byte 0x04
    .byte 0x01
    .byte 0x0E
    .byte 0x01
    .byte 0x0D
    .byte 0x01
    .byte -1
    .byte -1

SpriteList_DenTown_Block_4:
    .byte 0x03
    .byte 0x01
    .byte 0x04
    .byte 0x01
    .byte 0x0E
    .byte 0x01
    .byte 0x0D
    .byte 0x01
    .byte -1
    .byte -1

SpriteList_DenTown_Summer_School:
    .byte 0xD0
    .byte 0x00
    .byte -1
    .byte -1

SpriteList_DenTown_Station:
    .byte -1
    .byte -1

PTR_MapExitList_DenTown_08035f98:
    .word MapExitList_DenTown

PTR_gDstCompressedSpriteData_08035f9c:
    .word gDstCompressedSpriteData

PTR_SpriteList_DenTown_08035fa0:
    .word SpriteList_DenTown
