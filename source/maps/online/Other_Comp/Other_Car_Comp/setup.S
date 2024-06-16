#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_Other_Car_Comp_S0
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,DAT_0805081c
    mov        lr,pc
    bx         r0 @ FUN_080507cc
    push       {r5}
    ldr        r0,PTR_BgTask_805033C_08050820
    bl         BgTask_AddNew
    pop        {r5}
    pop        {pc}


_ts EventHandler_Other_Car_Comp_S0
    push       {lr}
    ldr        r0,DAT_08050824
    mov        lr,pc
    bx         r0 @ FUN_08050804
    mov        r0,#0xb
    bl         CheckForJackOut
    pop        {pc}


_ts FUN_080507cc
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_NPCList_8050EF8_08050828
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_080507fe
    push       {r5}
    ldr        r0,PTR_Scene_MegaManJackIn_0805082c
    ldr        r1,PTR_DAT_08050830
    bl         Scene_Prepare
    pop        {r5}
LAB_080507fe:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts FUN_08050804
    push       {lr}
    ldr        r0,PTR_PTR_FUN_08050818_08050834
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_FUN_08050818_08050814:
    .word FUN_08050818


_ts FUN_08050818
    push       {lr}
    pop        {pc}

DAT_0805081c:
    .word FUN_080507cc

PTR_BgTask_805033C_08050820:
    .word BgTask_805033C

DAT_08050824:
    .word FUN_08050804

PTR_NPCList_8050EF8_08050828:
    .word NPCList_8050EF8

PTR_Scene_MegaManJackIn_0805082c:
    .word Scene_MegaManJackIn

PTR_DAT_08050830:
    .word 0x2000

PTR_PTR_FUN_08050818_08050834:
    .word PTR_FUN_08050818_08050814
