#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_ACDC_Yai_PC_S0
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,DAT_0804f33c
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_804EE18_0804f340
    bl         BgTask_AddNew
    pop        {r5}
    pop        {pc}


_ts EventHandler_ACDC_Yai_PC_S0
    push       {lr}
    ldr        r0,DAT_0804f344
    mov        lr,pc
    bx         r0
    pop        {pc}


_nt FUN_0804f26a
    push       {lr}
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_0804f282
    push       {r5}
    mov        r0,#0xe
    bl         Flag_Clear280
    pop        {r5}
LAB_0804f282:
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_804F6A8_0804f348
    bl         Entity_AllocList
    pop        {r5}
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    bne        LAB_0804f2b2
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_0804f2be
LAB_0804f2b2:
    push       {r5}
    ldr        r0,PTR_Scene_MegaManJackIn_0804f34c
    ldr        r1,PTR_DAT_0804f350
    bl         Scene_Prepare
    pop        {r5}
LAB_0804f2be:
    push       {r5}
    ldr        r7,PTR_NPCList_804F578_0804f354
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x7
    bl         Flag_GetBase
    beq        LAB_0804f2de
    mov        r0,#0xd
    bl         Flag_GetBase
    bne        LAB_0804f2e8
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}
LAB_0804f2de:
    mov        r0,#0x0
    bl         Flag_Set410
    mov        r0,#0x4
    b          LAB_0804f2ea
LAB_0804f2e8:
    mov        r4,#0x8
LAB_0804f2ea:
    str        r0,[r5,#0x0]
    pop        {pc}


_nt FUN_0804f2ee
    push       {lr}
    ldr        r0,PTR_PTR_FUN_0804f30c_0804f358
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_FUN_0804f30c_0804f300:
    .word FUN_0804f30c
    .word FUN_0804f326
    .word FUN_0804f330


_ts FUN_0804f30c
    push       {lr}
    push       {r5}
    mov        r1,#0x1
    ldr        r0,DAT_0804f35c
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x4
    str        r0,[r5,#0x0]
    mov        r0,#0xd
    bl         Flag_SetBase
    pop        {pc}


_nt FUN_0804f326
    push       {lr}
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}


_ts FUN_0804f330
    push       {lr}
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}

    .align 2, 0

DAT_0804f33c:
    .word FUN_0804f26a

PTR_BgTask_804EE18_0804f340:
    .word BgTask_804EE18

DAT_0804f344:
    .word FUN_0804f2ee

PTR_EntityAllocParams_804F6A8_0804f348:
    .word EntityAllocParams_804F6A8

PTR_Scene_MegaManJackIn_0804f34c:
    .word Scene_MegaManJackIn

PTR_DAT_0804f350:
    .word 0x2000

PTR_NPCList_804F578_0804f354:
    .word NPCList_804F578

PTR_PTR_FUN_0804f30c_0804f358:
    .word PTR_FUN_0804f30c_0804f300

DAT_0804f35c:
    .word Scene_Dialogue
