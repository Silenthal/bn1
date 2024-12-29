#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts dummy_Govt_HP
    push       {lr}
    pop        {pc}


_ts GraphicDataSetup_Govt_HP
    push       {lr}
    mov        r7,r10
    ldr        r0,PTR_MapExitList_Govt_HP_0804f890
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
    LoadMain world, r7, r7
    ldrb       r7,[r7,#0x5]
    cmp        r7,#0x0
    bne        LAB_0804f852
    ldr        r0,PTR_BgUpdate_NoMove_0804f894
    ldr        r1,PTR_BgUpdate_MoveUpLeft_0804f898
    ldr        r2,PTR_IRQ_Dummy_0804f89c
    bl         BgUpdate_Set
    b          LAB_0804f85c
LAB_0804f852:
    ldr        r0,PTR_BgUpdate_NoMove_0804f8a0
    ldr        r1,PTR_BgUpdate_MoveLeft_0804f8a4
    ldr        r2,PTR_IRQ_Dummy_0804f8a8
    bl         BgUpdate_Set
LAB_0804f85c:
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_gDstCompressedSpriteData_0804f8ac
    bl         SpriteLz_Init
    LoadMain world, r7, r7
    ldrb       r1,[r7,#0x5]
    lsl        r1,r1,#0x2
    ldr        r0,PTR_PTR_SpriteList_Govt_Yuichiro_PC_0804f8b0
    ldr        r0,[r0,r1]
    bl         SpriteLz_DecompressSpriteList
    pop        {r5}
    pop        {pc}

    .align 2, 0

PTR_SpriteList_Govt_Yuichiro_PC_0804f87c:
    .word SpriteList_Govt_Yuichiro_PC
    .word SpriteList_Govt_Lunch_Cart_Comp

SpriteList_Govt_Yuichiro_PC:
    .short 0xF7
    .short -1

SpriteList_Govt_Lunch_Cart_Comp:
    .short 0xF7
    .short -1
    .short -1

    .align 2, 0

PTR_MapExitList_Govt_HP_0804f890:
    .word MapExitList_Govt_HP

PTR_BgUpdate_NoMove_0804f894:
    .word BgUpdate_NoMove

PTR_BgUpdate_MoveUpLeft_0804f898:
    .word BgUpdate_MoveUpLeft

PTR_IRQ_Dummy_0804f89c:
    .word IRQ_Dummy_far

PTR_BgUpdate_NoMove_0804f8a0:
    .word BgUpdate_NoMove

PTR_BgUpdate_MoveLeft_0804f8a4:
    .word BgUpdate_MoveLeft

PTR_IRQ_Dummy_0804f8a8:
    .word IRQ_Dummy_far

PTR_gDstCompressedSpriteData_0804f8ac:
    .word gDstCompressedSpriteData

PTR_PTR_SpriteList_Govt_Yuichiro_PC_0804f8b0:
    .word PTR_SpriteList_Govt_Yuichiro_PC_0804f87c
