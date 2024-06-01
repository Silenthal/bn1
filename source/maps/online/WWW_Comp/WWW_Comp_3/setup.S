#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_WWW_Comp_3_S5
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,PTR_PTR_MapSetup_Default_0804dae8
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_8044108_0804daec
    bl         BgTask_AddNew
    ldr        r0,DAT_0804daf0
    ldr        r1,DAT_0804daf4
    ldr        r2,PTR_dummy_6928_0804daf8
    bl         BgUpdate_Set
    pop        {r5}
    pop        {pc}

PTR_MapSetup_Default_0804d9f4:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_WWW_Comp_3_F54


_ts EventHandler_WWW_Comp_3_S5
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Default_0804dafc
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Default_0804da14:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_WWW_Comp_3_F54


_ts MapSetup_WWW_Comp_3_F54
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
    bne        LAB_0804da50
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_0804da5c
LAB_0804da50:
    push       {r5}
    ldr        r0,DAT_0804db00
    ldr        r1,PTR_DAT_0804db04
    bl         Scene_Prepare
    pop        {r5}
LAB_0804da5c:
    mov        r0,#0xfa
    bl         Flag_GetBase
    bne        LAB_0804da8c
    push       {r5}
    mov        r0,#0xb4
    bl         Flag_ClearBase
    mov        r0,#0xf9
    bl         Flag_ClearBase
    mov        r0,#0xdf
    bl         Flag_ClearBase
    ldr        r0,PTR_EntityAllocParams_804E938_0804db08
    bl         Entity_AllocList
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_804E2FC_0804db0c
    bl         Map_LoadNPCList
    pop        {r5}
    b          LAB_0804da96
LAB_0804da8c:
    push       {r5}
    ldr        r7,PTR_NPCList_804E308_0804db10
    bl         Map_LoadNPCList
    pop        {r5}
LAB_0804da96:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_WWW_Comp_3_F54
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_WWW_Comp_3_F54_0_0804db14
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_WWW_Comp_3_F54_0_0804daac:
    .word EventHandler_WWW_Comp_3_F54_0


_ts EventHandler_WWW_Comp_3_F54_0
    push       {lr}
    bl         FUN_08045a8c
    beq        LAB_0804dab8
LAB_0804dab8:
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x18
    bne        LAB_0804dae0
    mov        r0,#0xfa
    bl         Flag_GetBase
    bne        LAB_0804dae0
    push       {r5}
    ldr        r0,DAT_0804db18
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_0804dae0:
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}

PTR_PTR_MapSetup_Default_0804dae8:
    .word PTR_MapSetup_Default_0804d9f4

PTR_BgTask_8044108_0804daec:
    .word BgTask_8044108

DAT_0804daf0:
    .word BgUpdate_NoMove

DAT_0804daf4:
    .word BgUpdate_MoveUp

PTR_dummy_6928_0804daf8:
    .word dummy_6928_far

PTR_PTR_EventHandler_Default_0804dafc:
    .word PTR_EventHandler_Default_0804da14

DAT_0804db00:
    .word 0x8084071

PTR_DAT_0804db04:
    .word 0x2000

PTR_EntityAllocParams_804E938_0804db08:
    .word EntityAllocParams_804E938

PTR_NPCList_804E2FC_0804db0c:
    .word NPCList_804E2FC

PTR_NPCList_804E308_0804db10:
    .word NPCList_804E308

PTR_PTR_EventHandler_WWW_Comp_3_F54_0_0804db14:
    .word PTR_EventHandler_WWW_Comp_3_F54_0_0804daac

DAT_0804db18:
    .word 0x8095249
