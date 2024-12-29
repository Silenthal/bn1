#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts dummy_DenTown_HP
    push       {lr}
    pop        {pc}


_ts GraphicDataSetup_DenTown_HP
    push       {lr}
    mov        r7,r10
    ldr        r0,PTR_MapExitList_DenTown_HP_0804fe4c
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
    ldr        r0,PTR_BgUpdate_NoMove_0804fe50
    ldr        r1,PTR_BgUpdate_MoveUpLeft_0804fe54
    ldr        r2,PTR_IRQ_Dummy_0804fe58
    bl         BgUpdate_Set
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_gDstCompressedSpriteData_0804fe5c
    bl         SpriteLz_Init
    LoadMain world, r7, r7
    ldrb       r1,[r7,#0x5]
    lsl        r1,r1,#0x2
    ldr        r0,PTR_SpriteList_DenTown_HP_0804fe60
    ldr        r0,[r0,r1]
    bl         SpriteLz_DecompressSpriteList
    pop        {r5}
    pop        {pc}

SpriteList_DenTown_HP:
    .word SpriteList_DenTown_Antique_Comp

SpriteList_DenTown_Antique_Comp:
    .short 0xF7
    .short -1
    .short -1

    .align 2, 0

PTR_MapExitList_DenTown_HP_0804fe4c:
    .word MapExitList_DenTown_HP

PTR_BgUpdate_NoMove_0804fe50:
    .word BgUpdate_NoMove

PTR_BgUpdate_MoveUpLeft_0804fe54:
    .word BgUpdate_MoveUpLeft

PTR_IRQ_Dummy_0804fe58:
    .word IRQ_Dummy_far

PTR_gDstCompressedSpriteData_0804fe5c:
    .word gDstCompressedSpriteData

PTR_SpriteList_DenTown_HP_0804fe60:
    .word SpriteList_DenTown_HP
