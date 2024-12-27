#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_Undernet_2_S0
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,DAT_08052e3c
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_80515C8_08052e40
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051618_08052e44
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051668_08052e48
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_80516B8_08052e4c
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_80516F8_08052e50
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051780_08052e54
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051820_08052e58
    bl         BgTask_AddNew
    pop        {r5}
    pop        {pc}


_ts EventHandler_Undernet_2_S0
    push       {lr}
    ldr        r0,PTR_EventHandler_Undernet_2_08052e5c
    mov        lr,pc
    bx         r0
    pop        {pc}


_nt MapSetup_Undernet_2
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_NPCList_80546EC_08052e60
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_08052d80
    push       {r5}
    ldr        r0,PTR_Scene_MegaManJackIn_08052e64
    ldr        r1,PTR_DAT_08052e68
    bl         Scene_Prepare
    pop        {r5}
LAB_08052d80:
    mov        r0,#0x6a
    bl         Flag_GetBase
    bne        LAB_08052d8e
    mov        r0,#0x1
    bl         Flag_SetGate
LAB_08052d8e:
    mov        r0,#0x6c
    bl         Flag_GetBase
    beq        LAB_08052da2
    push       {r5}
    ldr        r0,PTR_Scene_AfterFixedBattle_08052e6c
    mov        r1,#0x17
    bl         Scene_Prepare
    pop        {r5}
LAB_08052da2:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Undernet_2
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Undernet_2_0_08052e70
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Undernet_2_0_08052db8:
    .word EventHandler_Undernet_2_0


_ts EventHandler_Undernet_2_0
    push       {lr}
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_08052dfe
    mov        r0,#0x1
    bl         Flag_GetGate
    beq        LAB_08052dfe
    mov        r0,#0x36
    bl         KeyItem_IsPresent
    bne        LAB_08052de6
    ldr        r1,DAT_08052e74
    b          LAB_08052df4
LAB_08052de6:
    mov        r1,#0xa
    push       {r5}
    ldr        r0,PTR_Scene_Dialogue_08052e78
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_08052dfe
LAB_08052df4:
    push       {r5}
    ldr        r0,PTR_Scene_LockedPath_08052e7c
    bl         Scene_Prepare
    pop        {r5}
LAB_08052dfe:
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x10
    bne        LAB_08052e32
    mov        r0,#0x6c
    bl         Flag_GetBase
    bne        LAB_08052e32
    mov        r0,#0x6c
    bl         Flag_SetBase
    mov        r0,#0x5e
    bl         Flag_SetBase
    push       {r5}
    ldr        r0,PTR_Scene_StartFixedBattle_08052e80
    mov        r1,#0x1a
    bl         Scene_Prepare
    pop        {r5}
LAB_08052e32:
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}

    .align 2, 0

DAT_08052e3c:
    .word MapSetup_Undernet_2

PTR_BgTask_80515C8_08052e40:
    .word BgTask_80515C8

PTR_BgTask_8051618_08052e44:
    .word BgTask_8051618

PTR_BgTask_8051668_08052e48:
    .word BgTask_8051668

PTR_BgTask_80516B8_08052e4c:
    .word BgTask_80516B8

PTR_BgTask_80516F8_08052e50:
    .word BgTask_80516F8

PTR_BgTask_8051780_08052e54:
    .word BgTask_8051780

PTR_BgTask_8051820_08052e58:
    .word BgTask_8051820

PTR_EventHandler_Undernet_2_08052e5c:
    .word EventHandler_Undernet_2

PTR_NPCList_80546EC_08052e60:
    .word NPCList_80546EC

PTR_Scene_MegaManJackIn_08052e64:
    .word Scene_MegaManJackIn

PTR_DAT_08052e68:
    .word 0x2000

PTR_Scene_AfterFixedBattle_08052e6c:
    .word Scene_AfterFixedBattle

PTR_PTR_EventHandler_Undernet_2_0_08052e70:
    .word PTR_EventHandler_Undernet_2_0_08052db8

DAT_08052e74:
    .word 0xA05

PTR_Scene_Dialogue_08052e78:
    .word Scene_Dialogue

PTR_Scene_LockedPath_08052e7c:
    .word Scene_LockedPath

PTR_Scene_StartFixedBattle_08052e80:
    .word Scene_StartFixedBattle
