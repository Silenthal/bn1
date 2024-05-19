#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_Govt_Yuichiro_PC_S2
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,DAT_0804fa50
    mov        lr,pc
    bx         r0 @ FUN_0804f998
    mov        r0,#0x1e
    bl         Flag_Get420
    beq        LAB_0804f982
    mov        r0,#0x1e
    bl         Flag_Clear420
    push       {r5}
    ldr        r0,DAT_0804fa54
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_0804f982:
    push       {r5}
    ldr        r0,PTR_BgTask_804F728_0804fa58
    bl         BgTask_AddNew
    pop        {r5}
    pop        {pc}


_nt EventHandler_Govt_Yuichiro_PC_S2
    push       {lr}
    ldr        r0,DAT_0804fa5c
    mov        lr,pc
    bx         r0 @ FUN_0804fa04
    pop        {pc}


_ts FUN_0804f998
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_NPCList_804FB8C_0804fa60
    bl         Map_LoadNPCList
    ldr        r0,PTR_EntityAllocParams_804FCF8_0804fa64
    bl         Entity_AllocList
    pop        {r5}
    mov        r0,#0x2
    bl         Flag_Set400
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    bne        LAB_0804f9d2
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_0804f9de
LAB_0804f9d2:
    push       {r5}
    ldr        r0,PTR_FUN_08084070_0804fa68
    ldr        r1,PTR_DAT_0804fa6c
    bl         Scene_Prepare
    pop        {r5}
LAB_0804f9de:
    mov        r0,#0x4a
    bl         Flag_GetBase
    beq        LAB_0804f9f4
    mov        r0,#0x4e
    bl         Flag_GetBase
    bne        LAB_0804f9fe
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}
LAB_0804f9f4:
    mov        r0,#0x0
    bl         Flag_Set410
    mov        r0,#0x4
    b          LAB_0804fa00
LAB_0804f9fe:
    mov        r0,#0x8
LAB_0804fa00:
    str        r0,[r5,#0x0]
    pop        {pc}


_ts FUN_0804fa04
    push       {lr}
    ldr        r0,PTR_PTR_FUN_0804fa20_0804fa70
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_FUN_0804fa20_0804fa14:
    .word FUN_0804fa20
    .word FUN_0804fa3a
    .word FUN_0804fa44


_ts FUN_0804fa20
    push       {lr}
    push       {r5}
    mov        r1,#0x1
    ldr        r0,DAT_0804fa74
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x4
    str        r0,[r5,#0x0]
    mov        r0,#0x4e
    bl         Flag_SetBase
    pop        {pc}


_nt FUN_0804fa3a
    push       {lr}
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}


_ts FUN_0804fa44
    push       {lr}
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}

    .align 2, 0

DAT_0804fa50:
    .word FUN_0804f998

DAT_0804fa54:
    .word 0x808B8F1

PTR_BgTask_804F728_0804fa58:
    .word BgTask_804F728

DAT_0804fa5c:
    .word FUN_0804fa04

PTR_NPCList_804FB8C_0804fa60:
    .word NPCList_804FB8C

PTR_EntityAllocParams_804FCF8_0804fa64:
    .word EntityAllocParams_804FCF8

PTR_FUN_08084070_0804fa68:
    .word 0x8084071

PTR_DAT_0804fa6c:
    .word 0x2000

PTR_PTR_FUN_0804fa20_0804fa70:
    .word PTR_FUN_0804fa20_0804fa14

DAT_0804fa74:
    .word 0x80848FD
