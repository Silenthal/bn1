#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set PlayerLocation_Create, 0x8056020+1


_ts MapSetup_Other_SciLab_Vending_Machine_S0
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,DAT_08050b30
    mov        lr,pc
    bx         r0 @ FUN_08050ae0
    push       {r5}
    ldr        r0,PTR_BgTask_805033C_08050b34
    bl         BgTask_AddNew
    pop        {r5}
    pop        {pc}


_ts EventHandler_Other_SciLab_Vending_Machine_S0
    push       {lr}
    ldr        r0,DAT_08050b38
    mov        lr,pc
    bx         r0 @ FUN_08050b18
    mov        r0,#0xb
    bl         CheckForJackOut
    pop        {pc}


_ts FUN_08050ae0
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_NPCList_8051158_08050b3c


_ts FUN_08050af4
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_08050b12
    push       {r5}
    ldr        r0,PTR_FUN_08084070_08050b40
    ldr        r1,PTR_DAT_08050b44
    bl         Scene_Prepare
    pop        {r5}
LAB_08050b12:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts FUN_08050b18
    push       {lr}
    ldr        r0,PTR_PTR_FUN_08050b2c_08050b48
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_FUN_08050b2c_08050b28:
    .word FUN_08050b2c


_ts FUN_08050b2c
    push       {lr}
    pop        {pc}

DAT_08050b30:
    .word FUN_08050ae0

PTR_BgTask_805033C_08050b34:
    .word BgTask_805033C

DAT_08050b38:
    .word FUN_08050b18

PTR_NPCList_8051158_08050b3c:
    .word NPCList_8051158

PTR_FUN_08084070_08050b40:
    .word 0x8084071

PTR_DAT_08050b44:
    .word 0x2000

PTR_PTR_FUN_08050b2c_08050b48:
    .word PTR_FUN_08050b2c_08050b28
