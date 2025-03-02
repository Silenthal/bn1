#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_Other_New_Game_Machine_Comp_S0
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,DAT_080506ec
    mov        lr,pc
    bx         r0 @ FUN_0805069c
    push       {r5}
    ldr        r0,PTR_BgTask_805033C_080506f0
    bl         BgTask_AddNew
    pop        {r5}
    pop        {pc}


_ts EventHandler_Other_New_Game_Machine_Comp_S0
    push       {lr}
    ldr        r0,DAT_080506f4
    mov        lr,pc
    bx         r0 @ FUN_080506d4
    mov        r0,#0xb
    bl         CheckForJackOut
    pop        {pc}


_ts FUN_0805069c
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_NPCList_8050E00_080506f8
    bl         Map_LoadNPCList
    pop        {r5}
    LoadMain world, r0, r7
    ldrb       r1,[r0,#World_currentArea]
    ldrb       r2,[r0,#World_lastArea]
    cmp        r1,r2
    beq        LAB_080506ce
    push       {r5}
    ldr        r0,PTR_Scene_MegaManJackIn_080506fc
    ldr        r1,PTR_DAT_08050700
    bl         Scene_Prepare
    pop        {r5}
LAB_080506ce:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts FUN_080506d4
    push       {lr}
    ldr        r0,PTR_PTR_FUN_080506e8_08050704
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_FUN_080506e8_080506e4:
    .word FUN_080506e8


_ts FUN_080506e8
    push       {lr}
    pop        {pc}

DAT_080506ec:
    .word FUN_0805069c

PTR_BgTask_805033C_080506f0:
    .word BgTask_805033C

DAT_080506f4:
    .word FUN_080506d4

PTR_NPCList_8050E00_080506f8:
    .word NPCList_8050E00

PTR_Scene_MegaManJackIn_080506fc:
    .word Scene_MegaManJackIn

PTR_DAT_08050700:
    .word 0x2000

PTR_PTR_FUN_080506e8_08050704:
    .word PTR_FUN_080506e8_080506e4
