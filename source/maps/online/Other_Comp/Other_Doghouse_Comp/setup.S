#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set PlayerLocation_Create, 0x8056020+1


_ts MapSetup_Other_Doghouse_Comp_S0
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,DAT_080505bc
    mov        lr,pc
    bx         r0 @ FUN_0805056c
    push       {r5}
    ldr        r0,PTR_BgTask_805033C_080505c0
    bl         BgTask_AddNew
    pop        {r5}
    pop        {pc}


_ts EventHandler_Other_Doghouse_Comp_S0
    push       {lr}
    ldr        r0,DAT_080505c4
    mov        lr,pc
    bx         r0 @ FUN_080505a4
    mov        r0,#0xb
    bl         CheckForJackOut
    pop        {pc}


_ts FUN_0805056c
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_NPCList_8050D14_080505c8
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_0805059e
    push       {r5}
    ldr        r0,PTR_FUN_08084070_080505cc
    ldr        r1,PTR_DAT_080505d0
    bl         Scene_Prepare
    pop        {r5}
LAB_0805059e:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts FUN_080505a4
    push       {lr}
    ldr        r0,PTR_PTR_FUN_080505b8_080505d4
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_FUN_080505b8_080505b4:
    .word FUN_080505b8


_ts FUN_080505b8
    push       {lr}
    pop        {pc}

DAT_080505bc:
    .word FUN_0805056c

PTR_BgTask_805033C_080505c0:
    .word BgTask_805033C

DAT_080505c4:
    .word FUN_080505a4

PTR_NPCList_8050D14_080505c8:
    .word NPCList_8050D14

PTR_FUN_08084070_080505cc:
    .word 0x8084071

PTR_DAT_080505d0:
    .word 0x2000

PTR_PTR_FUN_080505b8_080505d4:
    .word PTR_FUN_080505b8_080505b4
