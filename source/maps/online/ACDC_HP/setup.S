#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts dummy_ACDC_HP
    push       {lr}
    pop        {pc}


_ts GraphicDataSetup_ACDC_HP
    push       {lr}
    mov        r7,r10
    ldr        r0,PTR_MapExitList_ACDC_HP_0804ef88
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
    ldr        r0,PTR_BgUpdate_NoMove_0804ef8c
    ldr        r1,PTR_BgUpdate_MoveUpLeft_0804ef90
    ldr        r2,PTR_IRQ_Dummy_0804ef94
    bl         BgUpdate_Set
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_gDstCompressedSpriteData_0804ef98
    bl         SpriteLz_Init
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrb       r1,[r7,#0x5]
    lsl        r1,r1,#0x2
    ldr        r0,PTR_PTR_SpriteList_ACDC_Lan_PC_0804ef9c
    ldr        r0,[r0,r1]
    bl         SpriteLz_DecompressSpriteList
    pop        {r5}
    pop        {pc}

PTR_SpriteList_ACDC_Lan_PC_0804ef64:
    .word SpriteList_ACDC_Lan_PC
    .word SpriteList_ACDC_Mayl_PC
    .word SpriteList_ACDC_Yai_PC
    .word SpriteList_ACDC_Dex_PC

SpriteList_ACDC_Lan_PC:
    .short 0xF7
    .short -1

SpriteList_ACDC_Mayl_PC:
    .short 0xF7
    .short -1

SpriteList_ACDC_Yai_PC:
    .short 0xF7
    .short -1

SpriteList_ACDC_Dex_PC:
    .short 0xF7
    .short -1
    .short -1

    .align 2, 0

PTR_MapExitList_ACDC_HP_0804ef88:
    .word MapExitList_ACDC_HP

PTR_BgUpdate_NoMove_0804ef8c:
    .word BgUpdate_NoMove

PTR_BgUpdate_MoveUpLeft_0804ef90:
    .word BgUpdate_MoveUpLeft

PTR_IRQ_Dummy_0804ef94:
    .word IRQ_Dummy_far

PTR_gDstCompressedSpriteData_0804ef98:
    .word gDstCompressedSpriteData

PTR_PTR_SpriteList_ACDC_Lan_PC_0804ef9c:
    .word PTR_SpriteList_ACDC_Lan_PC_0804ef64
