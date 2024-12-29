#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_Other_Servbot_Comp_S0
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,DAT_08050654
    mov        lr,pc
    bx         r0 @ FUN_08050604
    push       {r5}
    ldr        r0,PTR_BgTask_805033C_08050658
    bl         BgTask_AddNew
    pop        {r5}
    pop        {pc}


_ts EventHandler_Other_Servbot_Comp_S0
    push       {lr}
    ldr        r0,DAT_0805065c
    mov        lr,pc
    bx         r0 @ FUN_0805063c
    mov        r0,#0xb
    bl         CheckForJackOut
    pop        {pc}


_ts FUN_08050604
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_NPCList_8050D98_08050660
    bl         Map_LoadNPCList
    pop        {r5}
    LoadMain world, r0, r7
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_08050636
    push       {r5}
    ldr        r0,PTR_Scene_MegaManJackIn_08050664
    ldr        r1,PTR_DAT_08050668
    bl         Scene_Prepare
    pop        {r5}
LAB_08050636:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts FUN_0805063c
    push       {lr}
    ldr        r0,PTR_PTR_FUN_08050650_0805066c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_FUN_08050650_0805064c:
    .word FUN_08050650


_ts FUN_08050650
    push       {lr}
    pop        {pc}

DAT_08050654:
    .word FUN_08050604

PTR_BgTask_805033C_08050658:
    .word BgTask_805033C

DAT_0805065c:
    .word FUN_0805063c

PTR_NPCList_8050D98_08050660:
    .word NPCList_8050D98

PTR_Scene_MegaManJackIn_08050664:
    .word Scene_MegaManJackIn

PTR_DAT_08050668:
    .word 0x2000

PTR_PTR_FUN_08050650_0805066c:
    .word PTR_FUN_08050650_0805064c
