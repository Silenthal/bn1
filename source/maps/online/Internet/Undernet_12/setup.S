#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set NPC_8053F26, 0x8053F26
    .set PlayerLocation_Create, 0x8056020+1
    .set NPC_8053F00, 0x8053F00
    .set NPC_8053E42, 0x8053E42
    .set NPC_8053F4C, 0x8053F4C
    .set NPC_8053E8E, 0x8053E8E
    .set NPC_8053E68, 0x8053E68
    .set NPC_8053FA8, 0x8053FA8
    .set NPC_8053EB4, 0x8053EB4
    .set NPC_8053F72, 0x8053F72
    .set NPC_8053E1C, 0x8053E1C
    .set NPC_8053EDA, 0x8053EDA


_ts MapSetup_Undernet_12_S0
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,DAT_08053db8
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_80515C8_08053dbc
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051618_08053dc0
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051668_08053dc4
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_80516B8_08053dc8
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_80516F8_08053dcc
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051780_08053dd0
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051820_08053dd4
    bl         BgTask_AddNew
    pop        {r5}
    pop        {pc}


_ts EventHandler_Undernet_12_S0
    push       {lr}
    ldr        r0,PTR_FUN_08053d96_08053dd8
    mov        lr,pc
    bx         r0
    pop        {pc}


_nt FUN_08053d76
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_NPCList_805518C_08053ddc
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    strb       r0,[r5,#0x0]
    pop        {pc}


_nt FUN_08053d96
    push       {lr}
    ldr        r0,PTR_PTR_FUN_08053dac_08053de0
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_FUN_08053dac_08053da8:
    .word FUN_08053dac


_ts FUN_08053dac
    push       {lr}
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}

    .align 2, 0

DAT_08053db8:
    .word 0x8053D77

PTR_BgTask_80515C8_08053dbc:
    .word BgTask_80515C8

PTR_BgTask_8051618_08053dc0:
    .word BgTask_8051618

PTR_BgTask_8051668_08053dc4:
    .word BgTask_8051668

PTR_BgTask_80516B8_08053dc8:
    .word BgTask_80516B8

PTR_BgTask_80516F8_08053dcc:
    .word BgTask_80516F8

PTR_BgTask_8051780_08053dd0:
    .word BgTask_8051780

PTR_BgTask_8051820_08053dd4:
    .word BgTask_8051820

PTR_FUN_08053d96_08053dd8:
    .word FUN_08053d96

PTR_NPCList_805518C_08053ddc:
    .word NPCList_805518C

PTR_PTR_FUN_08053dac_08053de0:
    .word PTR_FUN_08053dac_08053da8

global_label PTR_NPC_8053E1C_08053de4
    .word NPC_8053E1C

global_label PTR_NPC_8053E42_08053de8
    .word NPC_8053E42

global_label PTR_NPC_8053E68_08053dec
    .word NPC_8053E68

global_label PTR_NPC_8053E8E_08053df0
    .word NPC_8053E8E

global_label PTR_NPC_8053EB4_08053df4
    .word NPC_8053EB4

global_label PTR_NPC_8053EDA_08053df8
    .word NPC_8053EDA

global_label PTR_NPC_8053F00_08053dfc
    .word NPC_8053F00

global_label PTR_NPC_8053F26_08053e00
    .word NPC_8053F26

global_label PTR_NPC_8053F72_08053e04
    .word NPC_8053F72

global_label PTR_NPC_8053F4C_08053e08
    .word NPC_8053F4C

global_label PTR_NPC_8053F89_08053e0c
    .word 0x8053F89

global_label PTR_NPC_8053FA8_08053e10
    .word NPC_8053FA8
