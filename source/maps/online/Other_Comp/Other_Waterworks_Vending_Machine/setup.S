#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_Other_Waterworks_Vending_Machine_S0
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,DAT_080508cc
    mov        lr,pc
    bx         r0 @ FUN_08050864
    push       {r5}
    ldr        r0,PTR_BgTask_805033C_080508d0
    bl         BgTask_AddNew
    pop        {r5}
    pop        {pc}


_ts EventHandler_Other_Waterworks_Vending_Machine_S0
    push       {lr}
    ldr        r0,DAT_080508d4
    mov        lr,pc
    bx         r0 @ FUN_080508b4
    mov        r0,#0xb
    bl         CheckForJackOut
    pop        {pc}


_ts FUN_08050864
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    mov        r0,#0x17
    bl         Flag_Get420
    beq        LAB_0805088e
    mov        r0,#0x18
    bl         Flag_Get420
    bne        LAB_0805088e
    ldr        r7,PTR_NPCList_8050F74_080508d8
    bl         Map_LoadNPCList
    b          LAB_08050894
LAB_0805088e:
    ldr        r7,PTR_NPCList_8050F60_080508dc
    bl         Map_LoadNPCList
LAB_08050894:
    pop        {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_080508ae
    push       {r5}
    ldr        r0,PTR_Scene_MegaManJackIn_080508e0
    ldr        r1,PTR_DAT_080508e4
    bl         Scene_Prepare
    pop        {r5}
LAB_080508ae:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts FUN_080508b4
    push       {lr}
    ldr        r0,PTR_PTR_FUN_080508c8_080508e8
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_FUN_080508c8_080508c4:
    .word FUN_080508c8


_ts FUN_080508c8
    push       {lr}
    pop        {pc}

DAT_080508cc:
    .word FUN_08050864

PTR_BgTask_805033C_080508d0:
    .word BgTask_805033C

DAT_080508d4:
    .word FUN_080508b4

PTR_NPCList_8050F74_080508d8:
    .word NPCList_8050F74

PTR_NPCList_8050F60_080508dc:
    .word NPCList_8050F60

PTR_Scene_MegaManJackIn_080508e0:
    .word Scene_MegaManJackIn

PTR_DAT_080508e4:
    .word 0x2000

PTR_PTR_FUN_080508c8_080508e8:
    .word PTR_FUN_080508c8_080508c4
