#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_Other_Big_Vase_Comp_S0
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,DAT_08050c60
    mov        lr,pc
    bx         r0 @ FUN_08050c10
    push       {r5}
    ldr        r0,PTR_BgTask_805033C_08050c64
    bl         BgTask_AddNew
    pop        {r5}
    pop        {pc}


_ts EventHandler_Other_Big_Vase_Comp_S0
    push       {lr}
    ldr        r0,DAT_08050c68
    mov        lr,pc
    bx         r0 @ FUN_08050c48
    mov        r0,#0xb
    bl         CheckForJackOut
    pop        {pc}


_ts FUN_08050c10
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_NPCList_8051228_08050c6c
    bl         Map_LoadNPCList
    pop        {r5}
    LoadMain world, r0, r7
    ldrb       r1,[r0,#World_currentArea]
    ldrb       r2,[r0,#World_lastArea]
    cmp        r1,r2
    beq        LAB_08050c42
    push       {r5}
    ldr        r0,PTR_Scene_MegaManJackIn_08050c70
    ldr        r1,PTR_DAT_08050c74
    bl         Scene_Prepare
    pop        {r5}
LAB_08050c42:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts FUN_08050c48
    push       {lr}
    ldr        r0,PTR_PTR_FUN_08050c5c_08050c78
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_FUN_08050c5c_08050c58:
    .word FUN_08050c5c


_ts FUN_08050c5c
    push       {lr}
    pop        {pc}

DAT_08050c60:
    .word FUN_08050c10

PTR_BgTask_805033C_08050c64:
    .word BgTask_805033C

DAT_08050c68:
    .word FUN_08050c48

PTR_NPCList_8051228_08050c6c:
    .word NPCList_8051228

PTR_Scene_MegaManJackIn_08050c70:
    .word Scene_MegaManJackIn

PTR_DAT_08050c74:
    .word 0x2000

PTR_PTR_FUN_08050c5c_08050c78:
    .word PTR_FUN_08050c5c_08050c58
