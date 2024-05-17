#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set PlayerLocation_Create, 0x8056020+1


_ts MapSetup_Other_Lobby_TV_Comp_S0
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,DAT_08050968
    mov        lr,pc
    bx         r0 @ FUN_08050918
    push       {r5}
    ldr        r0,PTR_BgTask_805033C_0805096c
    bl         BgTask_AddNew
    pop        {r5}
    pop        {pc}


_ts EventHandler_Other_Lobby_TV_Comp_S0
    push       {lr}
    ldr        r0,DAT_08050970
    mov        lr,pc
    bx         r0 @ FUN_08050950
    mov        r0,#0xb
    bl         CheckForJackOut
    pop        {pc}


_ts FUN_08050918
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_NPCList_8050FF8_08050974
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_0805094a
    push       {r5}
    ldr        r0,PTR_FUN_08084070_08050978
    ldr        r1,PTR_DAT_0805097c
    bl         Scene_Prepare
    pop        {r5}
LAB_0805094a:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts FUN_08050950
    push       {lr}
    ldr        r0,PTR_PTR_FUN_08050964_08050980
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_FUN_08050964_08050960:
    .word FUN_08050964


_ts FUN_08050964
    push       {lr}
    pop        {pc}

DAT_08050968:
    .word FUN_08050918

PTR_BgTask_805033C_0805096c:
    .word BgTask_805033C

DAT_08050970:
    .word FUN_08050950

PTR_NPCList_8050FF8_08050974:
    .word NPCList_8050FF8

PTR_FUN_08084070_08050978:
    .word 0x8084071

PTR_DAT_0805097c:
    .word 0x2000

PTR_PTR_FUN_08050964_08050980:
    .word PTR_FUN_08050964_08050960
