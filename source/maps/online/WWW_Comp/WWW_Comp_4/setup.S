#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_WWW_Comp_4_S5
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_Default_0804dc30
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         FUN_0804ebc4
    push       {r5}
    ldr        r0,PTR_BgTask_80475A4_0804dc34
    bl         BgTask_AddNew
    pop        {r5}
    bl         Sound_AreaSongChange
    pop        {pc}

    .align 2, 0

PTR_MapSetup_Default_0804db3c:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_WWW_Comp_4_F54


_ts EventHandler_WWW_Comp_4_S5
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Default_0804dc38
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         FUN_0804ec14
    pop        {pc}

PTR_EventHandler_Default_0804db60:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_WWW_Comp_4_F54


_ts MapSetup_WWW_Comp_4_F54
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    bne        LAB_0804db9c
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_0804dba8
LAB_0804db9c:
    push       {r5}
    ldr        r0,DAT_0804dc3c
    ldr        r1,PTR_DAT_0804dc40
    bl         Scene_Prepare
    pop        {r5}
LAB_0804dba8:
    mov        r0,#0xfc
    bl         Flag_GetBase
    bne        LAB_0804dbd8
    push       {r5}
    ldr        r7,PTR_NPCList_804E3A4_0804dc44
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    mov        r0,#0xb4
    bl         Flag_ClearBase
    mov        r0,#0xf9
    bl         Flag_ClearBase
    mov        r0,#0xdf
    bl         Flag_ClearBase
    ldr        r0,PTR_EntityAllocParams_804EA84_0804dc48
    bl         Entity_AllocList
    pop        {r5}
    b          LAB_0804dbe2
LAB_0804dbd8:
    push       {r5}
    ldr        r7,PTR_NPCList_804E3B0_0804dc4c
    bl         Map_LoadNPCList
    pop        {r5}
LAB_0804dbe2:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_WWW_Comp_4_F54
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_WWW_Comp_4_F54_0_0804dc50
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_WWW_Comp_4_F54_0_0804dbf8:
    .word EventHandler_WWW_Comp_4_F54_0


_ts EventHandler_WWW_Comp_4_F54_0
    push       {lr}
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x10
    bne        LAB_0804dc26
    mov        r0,#0xfc
    bl         Flag_GetBase
    bne        LAB_0804dc26
    push       {r5}
    ldr        r0,PTR_FUN_0809570c_0804dc54
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_0804dc26:
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}

    .align 2, 0

PTR_PTR_MapSetup_Default_0804dc30:
    .word PTR_MapSetup_Default_0804db3c

PTR_BgTask_80475A4_0804dc34:
    .word BgTask_80475A4

PTR_PTR_EventHandler_Default_0804dc38:
    .word PTR_EventHandler_Default_0804db60

DAT_0804dc3c:
    .word Scene_MegaManJackIn

PTR_DAT_0804dc40:
    .word 0x2000

PTR_NPCList_804E3A4_0804dc44:
    .word NPCList_804E3A4

PTR_EntityAllocParams_804EA84_0804dc48:
    .word EntityAllocParams_804EA84

PTR_NPCList_804E3B0_0804dc4c:
    .word NPCList_804E3B0

PTR_PTR_EventHandler_WWW_Comp_4_F54_0_0804dc50:
    .word PTR_EventHandler_WWW_Comp_4_F54_0_0804dbf8

PTR_FUN_0809570c_0804dc54:
    .word 0x809570D
