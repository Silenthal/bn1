#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts dummy_Internet
    push       {lr}
    pop        {pc}


_ts GraphicDataSetup_Internet
    push       {lr}
    mov        r7,r10
    ldr        r0,PTR_MapExitList_Internet_08051e00
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
    ldr        r0,PTR_BgUpdate_NoMove_08051e04
    ldr        r1,PTR_BgUpdate_MoveUpLeft_08051e08
    ldr        r2,PTR_dummy_6928_08051e0c
    bl         BgUpdate_Set
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_gDstCompressedSpriteData_08051e10
    bl         SpriteLz_Init
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrb       r1,[r7,#0x5]
    lsl        r1,r1,#0x2
    ldr        r0,PTR_SpriteList_Internet_08051e14
    ldr        r0,[r0,r1]
    bl         SpriteLz_DecompressSpriteList
    pop        {r5}
    pop        {pc}

global_label SpriteList_Internet
    .word SpriteList_Internet_1
    .word SpriteList_Internet_2
    .word SpriteList_Internet_3
    .word SpriteList_Internet_4
    .word SpriteList_Undernet_1
    .word SpriteList_Undernet_2
    .word SpriteList_Undernet_3
    .word SpriteList_Undernet_4
    .word SpriteList_Undernet_5
    .word SpriteList_Undernet_6
    .word SpriteList_Undernet_7
    .word SpriteList_Undernet_8
    .word SpriteList_Undernet_9
    .word SpriteList_Undernet_10
    .word SpriteList_Undernet_11
    .word SpriteList_Undernet_12

SpriteList_Internet_1:
    .short 0xEC
    .short 0xF7
    .short -1

SpriteList_Internet_2:
    .short 0xEC
    .short 0xF7
    .short -1

SpriteList_Internet_3:
    .short 0xEC
    .short 0xF7
    .short -1

SpriteList_Internet_4:
    .short 0xEC
    .short 0xF7
    .short -1

SpriteList_Undernet_1:
    .short 0xEC
    .short 0xF7
    .short -1

SpriteList_Undernet_2:
    .short 0xEC
    .short 0xF7
    .short -1

SpriteList_Undernet_3:
    .short 0xEC
    .short 0xF7
    .short -1

SpriteList_Undernet_4:
    .short 0xEC
    .short 0xF7
    .short -1

SpriteList_Undernet_5:
    .short 0xEC
    .short 0xF7
    .short -1

SpriteList_Undernet_6:
    .short 0xEC
    .short 0xF7
    .short -1

SpriteList_Undernet_7:
    .short 0xEC
    .short 0xF7
    .short -1

SpriteList_Undernet_8:
    .short 0xEC
    .short 0xF7
    .short -1

SpriteList_Undernet_9:
    .short 0xEC
    .short 0xF7
    .short -1

SpriteList_Undernet_10:
    .short 0xEC
    .short 0xF7
    .short -1

SpriteList_Undernet_11:
    .short 0xEC
    .short 0xF7
    .short -1

SpriteList_Undernet_12:
    .short 0xEC
    .short 0xF7
    .short -1

SpriteList_Internet_None:
    .short -1

    .align 2, 0

PTR_MapExitList_Internet_08051e00:
    .word MapExitList_Internet

PTR_BgUpdate_NoMove_08051e04:
    .word BgUpdate_NoMove

PTR_BgUpdate_MoveUpLeft_08051e08:
    .word BgUpdate_MoveUpLeft

PTR_dummy_6928_08051e0c:
    .word dummy_6928_far

PTR_gDstCompressedSpriteData_08051e10:
    .word gDstCompressedSpriteData

PTR_SpriteList_Internet_08051e14:
    .word SpriteList_Internet
