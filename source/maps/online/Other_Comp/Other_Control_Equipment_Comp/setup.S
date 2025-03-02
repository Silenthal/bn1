#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_Other_Control_Equipment_Comp_S0
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,DAT_08050a98
    mov        lr,pc
    bx         r0 @ FUN_08050a48
    push       {r5}
    ldr        r0,PTR_BgTask_805033C_08050a9c
    bl         BgTask_AddNew
    pop        {r5}
    pop        {pc}


_ts EventHandler_Other_Control_Equipment_Comp_S0
    push       {lr}
    ldr        r0,DAT_08050aa0
    mov        lr,pc
    bx         r0 @ FUN_08050a80
    mov        r0,#0xb
    bl         CheckForJackOut
    pop        {pc}


_ts FUN_08050a48
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_NPCList_80510C8_08050aa4
    bl         Map_LoadNPCList
    pop        {r5}
    LoadMain world, r0, r7
    ldrb       r1,[r0,#World_currentArea]
    ldrb       r2,[r0,#World_lastArea]
    cmp        r1,r2
    beq        LAB_08050a7a
    push       {r5}
    ldr        r0,PTR_Scene_MegaManJackIn_08050aa8
    ldr        r1,PTR_DAT_08050aac
    bl         Scene_Prepare
    pop        {r5}
LAB_08050a7a:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts FUN_08050a80
    push       {lr}
    ldr        r0,PTR_PTR_FUN_08050a94_08050ab0
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_FUN_08050a94_08050a90:
    .word FUN_08050a94


_ts FUN_08050a94
    push       {lr}
    pop        {pc}

DAT_08050a98:
    .word FUN_08050a48

PTR_BgTask_805033C_08050a9c:
    .word BgTask_805033C

DAT_08050aa0:
    .word FUN_08050a80

PTR_NPCList_80510C8_08050aa4:
    .word NPCList_80510C8

PTR_Scene_MegaManJackIn_08050aa8:
    .word Scene_MegaManJackIn

PTR_DAT_08050aac:
    .word 0x2000

PTR_PTR_FUN_08050a94_08050ab0:
    .word PTR_FUN_08050a94_08050a90
