#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_Undernet_1_S0
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,PTR_MapSetup_Undernet_1_08052cac
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_80515C8_08052cb0
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051618_08052cb4
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051668_08052cb8
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_80516B8_08052cbc
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_80516F8_08052cc0
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051780_08052cc4
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051820_08052cc8
    bl         BgTask_AddNew
    mov        r0,#0x68
    bl         Flag_GetBase
    beq        LAB_08052b76
    ldr        r0,PTR_BgTask_8051738_08052ccc
    bl         BgTask_AddNew
LAB_08052b76:
    pop        {r5}
    pop        {pc}


_nt EventHandler_Undernet_1_S0
    push       {lr}
    ldr        r0,PTR_EventHandler_Undernet_1_08052cd0
    mov        lr,pc
    bx         r0
    pop        {pc}


_ts MapSetup_Undernet_1
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#0x1]
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_NPCList_8054580_08052cd4
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_08052bba
    push       {r5}
    ldr        r0,PTR_Scene_MegaManJackIn_08052cd8
    ldr        r1,PTR_DAT_08052cdc
    bl         Scene_Prepare
    pop        {r5}
LAB_08052bba:
    mov        r0,#0x65
    bl         Flag_GetBase
    bne        LAB_08052bc8
    mov        r0,#0x1
    bl         Flag_SetGate
LAB_08052bc8:
    mov        r0,#0x68
    bl         Flag_GetBase
    beq        LAB_08052bdc
    push       {r5}
    mov        r0,#0x0
    bl         Flag_Set380
    pop        {r5}
    b          LAB_08052be6
LAB_08052bdc:
    push       {r5}
    mov        r1,#0x8c
    bl         Effect_WWWGate_Create
    pop        {r5}
LAB_08052be6:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Undernet_1
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Undernet_1_0_08052ce0
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Undernet_1_0_08052bfc:
    .word EventHandler_Undernet_1_0


_ts EventHandler_Undernet_1_0
    push       {lr}
    mov        r0,#0x10
    bl         Flag_GetEmailRecieved
    bne        LAB_08052c16
    push       {r5}
    ldr        r0,PTR_Scene_CheckMail_08052ce4
    ldr        r1,DAT_08052ce8
    bl         Scene_Prepare
    pop        {r5}
LAB_08052c16:
    ldrb       r0,[r5,#0x1]
    tst        r0,r0
    beq        LAB_08052c2a
    mov        r0,#0x0
    strb       r0,[r5,#0x1]
    push       {r5}
    ldr        r0,PTR_BgTask_8051738_08052cec
    bl         BgTask_AddNew
    pop        {r5}
LAB_08052c2a:
    mov        r0,#0x68
    bl         Flag_GetBase
    bne        LAB_08052c62
    mov        r0,#0x69
    bl         Flag_GetBase
    beq        LAB_08052c4c
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
    push       {r5}
    ldr        r0,PTR_Scene_UnlockWWWGate_08052cf0
    mov        r1,#0xb
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_08052c4c:
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x20
    bne        LAB_08052c62
    push       {r5}
    ldr        r0,PTR_Scene_Dialogue_08052cf4
    mov        r1,#0x1f
    bl         Scene_Prepare
    pop        {r5}
LAB_08052c62:
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_08052ca2
    mov        r0,#0x1
    bl         Flag_GetGate
    beq        LAB_08052ca2
    mov        r0,#0x35
    bl         KeyItem_IsPresent
    bne        LAB_08052c8a
    ldr        r1,DAT_08052cf8
    b          LAB_08052c98
LAB_08052c8a:
    mov        r1,#0xa
    push       {r5}
    ldr        r0,PTR_Scene_Dialogue_08052cfc
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_08052ca2
LAB_08052c98:
    push       {r5}
    ldr        r0,PTR_Scene_LockedPath_08052d00
    bl         Scene_Prepare
    pop        {r5}
LAB_08052ca2:
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}

    .align 2, 0

PTR_MapSetup_Undernet_1_08052cac:
    .word MapSetup_Undernet_1

PTR_BgTask_80515C8_08052cb0:
    .word BgTask_80515C8

PTR_BgTask_8051618_08052cb4:
    .word BgTask_8051618

PTR_BgTask_8051668_08052cb8:
    .word BgTask_8051668

PTR_BgTask_80516B8_08052cbc:
    .word BgTask_80516B8

PTR_BgTask_80516F8_08052cc0:
    .word BgTask_80516F8

PTR_BgTask_8051780_08052cc4:
    .word BgTask_8051780

PTR_BgTask_8051820_08052cc8:
    .word BgTask_8051820

PTR_BgTask_8051738_08052ccc:
    .word BgTask_8051738

PTR_EventHandler_Undernet_1_08052cd0:
    .word EventHandler_Undernet_1

PTR_NPCList_8054580_08052cd4:
    .word NPCList_8054580

PTR_Scene_MegaManJackIn_08052cd8:
    .word Scene_MegaManJackIn

PTR_DAT_08052cdc:
    .word 0x2000

PTR_PTR_EventHandler_Undernet_1_0_08052ce0:
    .word PTR_EventHandler_Undernet_1_0_08052bfc

PTR_Scene_CheckMail_08052ce4:
    .word Scene_CheckMail

DAT_08052ce8:
    .word 0x113

PTR_BgTask_8051738_08052cec:
    .word BgTask_8051738

PTR_Scene_UnlockWWWGate_08052cf0:
    .word Scene_UnlockWWWGate

PTR_Scene_Dialogue_08052cf4:
    .word Scene_Dialogue

DAT_08052cf8:
    .word 0xA05

PTR_Scene_Dialogue_08052cfc:
    .word Scene_Dialogue

PTR_Scene_LockedPath_08052d00:
    .word Scene_LockedPath
