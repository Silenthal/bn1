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
    Flag_GetEvent F_EVENT_GOVT_YUICHIRO_PC_VIRUS_MACHINE
    beq        LAB_0804f982
    Flag_ClearEvent F_EVENT_GOVT_YUICHIRO_PC_VIRUS_MACHINE
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
    Flag_SetSystem F_SYSTEM_NO_RANDOM_BATTLES
    LoadMain world, r0, r0
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
    ldr        r0,PTR_Scene_MegaManJackIn_0804fa68
    ldr        r1,PTR_DAT_0804fa6c
    bl         Scene_Prepare
    pop        {r5}
LAB_0804f9de:
    Flag_GetBase 0x4A
    beq        LAB_0804f9f4
    Flag_GetBase 0x4E
    bne        LAB_0804f9fe
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}
LAB_0804f9f4:
    Flag_SetGate F_GATE_00
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
    Flag_SetBase 0x4E
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
    .word Scene_Yuichiro_PC_Wait

PTR_BgTask_804F728_0804fa58:
    .word BgTask_804F728

DAT_0804fa5c:
    .word FUN_0804fa04

PTR_NPCList_804FB8C_0804fa60:
    .word NPCList_804FB8C

PTR_EntityAllocParams_804FCF8_0804fa64:
    .word EntityAllocParams_804FCF8

PTR_Scene_MegaManJackIn_0804fa68:
    .word Scene_MegaManJackIn

PTR_DAT_0804fa6c:
    .word 0x2000

PTR_PTR_FUN_0804fa20_0804fa70:
    .word PTR_FUN_0804fa20_0804fa14

DAT_0804fa74:
    .word Scene_Dialogue
