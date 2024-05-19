#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_Other_Large_Monitor_Comp_S0
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,DAT_08050a00
    mov        lr,pc
    bx         r0 @ FUN_080509b0
    push       {r5}
    ldr        r0,PTR_BgTask_805033C_08050a04
    bl         BgTask_AddNew
    pop        {r5}
    pop        {pc}


_ts EventHandler_Other_Large_Monitor_Comp_S0
    push       {lr}
    ldr        r0,DAT_08050a08
    mov        lr,pc
    bx         r0 @ FUN_080509e8
    mov        r0,#0xb
    bl         CheckForJackOut
    pop        {pc}


_ts FUN_080509b0
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_NPCList_8051060_08050a0c
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_080509e2
    push       {r5}
    ldr        r0,PTR_FUN_08084070_08050a10
    ldr        r1,PTR_DAT_08050a14
    bl         Scene_Prepare
    pop        {r5}
LAB_080509e2:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts FUN_080509e8
    push       {lr}
    ldr        r0,PTR_PTR_FUN_080509fc_08050a18
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_FUN_080509fc_080509f8:
    .word FUN_080509fc


_ts FUN_080509fc
    push       {lr}
    pop        {pc}

DAT_08050a00:
    .word FUN_080509b0

PTR_BgTask_805033C_08050a04:
    .word BgTask_805033C

DAT_08050a08:
    .word FUN_080509e8

PTR_NPCList_8051060_08050a0c:
    .word NPCList_8051060

PTR_FUN_08084070_08050a10:
    .word 0x8084071

PTR_DAT_08050a14:
    .word 0x2000

PTR_PTR_FUN_080509fc_08050a18:
    .word PTR_FUN_080509fc_080509f8
