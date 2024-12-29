#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts dummy_WWW_Comp
    push       {lr}
    pop        {pc}


_ts GraphicDataSetup_WWW_Comp
    push       {lr}
    mov        r7,r10
    ldr        r0,PTR_MapExitList_WWW_Comp_0804d220
    ldr        r1,[r7,#Main_mapChange]
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
    ldr        r0,PTR_gDstCompressedSpriteData_0804d224
    bl         SpriteLz_Init
    LoadMain world, r7, r7
    ldrb       r1,[r7,#0x5]
    lsl        r1,r1,#0x2
    ldr        r0,PTR_SpriteList_WWW_Comp_0804d228
    ldr        r0,[r0,r1]
    bl         SpriteLz_DecompressSpriteList
    pop        {r5}
    pop        {pc}

    .align 2, 0

SpriteList_WWW_Comp:
    .word SpriteList_WWW_Comp_1
    .word SpriteList_WWW_Comp_2
    .word SpriteList_WWW_Comp_3
    .word SpriteList_WWW_Comp_4
    .word SpriteList_WWW_Comp_5
    .word SpriteList_Rocket_Comp

SpriteList_WWW_Comp_1:
    .short 0x114
    .short 0x115
    .short 0xE4
    .short -1

SpriteList_WWW_Comp_2:
    .short 0x114
    .short 0x115
    .short 0xEC
    .short -1

SpriteList_WWW_Comp_3:
    .short 0x114
    .short 0x115
    .short 0x121
    .short -1

SpriteList_WWW_Comp_4:
    .short 0x114
    .short 0x115
    .short 0x10F
    .short -1

SpriteList_WWW_Comp_5:
    .short 0x114
    .short 0x115
    .short 0x11D

SpriteList_Rocket_Comp:
    .short 0x120
    .short -1

    .align 2, 0

PTR_MapExitList_WWW_Comp_0804d220:
    .word MapExitList_WWW_Comp

PTR_gDstCompressedSpriteData_0804d224:
    .word gDstCompressedSpriteData

PTR_SpriteList_WWW_Comp_0804d228:
    .word SpriteList_WWW_Comp
