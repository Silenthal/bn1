#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set Scene_Dialogue, 0x80848FC+1


_ts MapSetup_Undernet_3_S0
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,PTR_MapSetup_Undernet_3_08052f74
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_80515C8_08052f78
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051618_08052f7c
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051668_08052f80
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_80516B8_08052f84
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_80516F8_08052f88
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051780_08052f8c
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051820_08052f90
    bl         BgTask_AddNew
    pop        {r5}
    pop        {pc}


_ts EventHandler_Undernet_3_S0
    push       {lr}
    ldr        r0,PTR_EventHandler_Undernet_3_08052f94
    mov        lr,pc
    bx         r0
    pop        {pc}


_nt MapSetup_Undernet_3
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_NPCList_80547C4_08052f98
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_08052f00
    push       {r5}
    ldr        r0,PTR_FUN_08084070_08052f9c
    ldr        r1,INT_08052fa0
    bl         Scene_Prepare
    pop        {r5}
LAB_08052f00:
    mov        r0,#0x6d
    bl         Flag_GetBase
    bne        LAB_08052f0e
    mov        r0,#0x1
    bl         Flag_Set410
LAB_08052f0e:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Undernet_3
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Undernet_3_0_08052fa4
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Undernet_3_0_08052f24:
    .word EventHandler_Undernet_3_0


_ts EventHandler_Undernet_3_0
    push       {lr}
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_08052f6a
    mov        r0,#0x1
    bl         Flag_Get410
    beq        LAB_08052f6a
    mov        r0,#0x37
    bl         KeyItem_IsPresent
    bne        LAB_08052f52
    ldr        r1,DAT_08052fa8
    b          LAB_08052f60
LAB_08052f52:
    mov        r1,#0xa
    push       {r5}
    ldr        r0,PTR_Scene_Dialogue_08052fac
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_08052f6a
LAB_08052f60:
    push       {r5}
    ldr        r0,PTR_FUN_08082de4_08052fb0
    bl         Scene_Prepare
    pop        {r5}
LAB_08052f6a:
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}

    .align 2, 0

PTR_MapSetup_Undernet_3_08052f74:
    .word MapSetup_Undernet_3

PTR_BgTask_80515C8_08052f78:
    .word BgTask_80515C8

PTR_BgTask_8051618_08052f7c:
    .word BgTask_8051618

PTR_BgTask_8051668_08052f80:
    .word BgTask_8051668

PTR_BgTask_80516B8_08052f84:
    .word BgTask_80516B8

PTR_BgTask_80516F8_08052f88:
    .word BgTask_80516F8

PTR_BgTask_8051780_08052f8c:
    .word BgTask_8051780

PTR_BgTask_8051820_08052f90:
    .word BgTask_8051820

PTR_EventHandler_Undernet_3_08052f94:
    .word EventHandler_Undernet_3

PTR_NPCList_80547C4_08052f98:
    .word NPCList_80547C4

PTR_FUN_08084070_08052f9c:
    .word 0x8084071

INT_08052fa0:
    .word 0x2000

PTR_PTR_EventHandler_Undernet_3_0_08052fa4:
    .word PTR_EventHandler_Undernet_3_0_08052f24

DAT_08052fa8:
    .word 0xA05

PTR_Scene_Dialogue_08052fac:
    .word Scene_Dialogue

PTR_FUN_08082de4_08052fb0:
    .word 0x8082DE5
