#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts dummy_Govt
    push       {lr}
    pop        {pc}


_ts GraphicDataSetup_Govt_Complex
    push       {lr}
    mov        r7,r10
    ldr        r0,PTR_MapExitList_Govt_080313bc
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
    ldr        r0,PTR_gDstCompressedSpriteData_080313c0
    bl         SpriteLz_Init
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrb       r1,[r7,#0x5]
    lsl        r1,r1,#0x2
    ldr        r0,PTR_PTR_SpriteList_Govt_Complex_Front_080313c4
    ldr        r0,[r0,r1]
    bl         SpriteLz_DecompressSpriteList
    pop        {r5}
    pop        {pc}

    .align 2, 0

PTR_SpriteList_Govt_Complex_Front_0803137c:
    .word SpriteList_Govt_Complex_Front
    .word SpriteList_Govt_Complex_Station
    .word SpriteList_Govt_Waterworks_Lobby
    .word SpriteList_Govt_SciLab_Lobby
    .word SpriteList_Govt_Complex_Station
    .word SpriteList_Govt_Complex_Station
    .word SpriteList_Govt_Complex_Station
    .word SpriteList_Govt_Complex_Station
    .word SpriteList_Govt_Complex_Station
    .word SpriteList_Govt_Complex_Station
    .word SpriteList_Govt_Complex_Station
    .word SpriteList_Govt_Complex_Station

SpriteList_Govt_Complex_Front:
    .short 0x101
    .short 0x11F
    .short -1

SpriteList_Govt_Waterworks_Lobby:
    .short 0xFF
    .short -1

SpriteList_Govt_SciLab_Lobby:
    .short 0xFF
    .short -1

SpriteList_Govt_Complex_Station:
    .short -1

PTR_MapExitList_Govt_080313bc:
    .word MapExitList_Govt

PTR_gDstCompressedSpriteData_080313c0:
    .word gDstCompressedSpriteData

PTR_PTR_SpriteList_Govt_Complex_Front_080313c4:
    .word PTR_SpriteList_Govt_Complex_Front_0803137c
