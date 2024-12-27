#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_Undernet_5_S0
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,DAT_0805321c
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_80515C8_08053220
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051618_08053224
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051668_08053228
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_80516B8_0805322c
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_80516F8_08053230
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051780_08053234
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051820_08053238
    bl         BgTask_AddNew
    pop        {r5}
    pop        {pc}


_ts EventHandler_Undernet_5_S0
    push       {lr}
    ldr        r0,PTR_EventHandler_Undernet_5_0805323c
    mov        lr,pc
    bx         r0
    pop        {pc}


_nt MapSetup_Undernet_5
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_NPCList_80549D0_08053240
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x76
    bl         Flag_GetBase
    bne        LAB_0805318e
    mov        r0,#0x1
    bl         Flag_SetGate
LAB_0805318e:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Undernet_5
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Undernet_5_0_08053244
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Undernet_5_0_080531a4:
    .word EventHandler_Undernet_5_0


_ts EventHandler_Undernet_5_0
    push       {lr}
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x10
    bne        LAB_080531e2
    mov        r0,#0x2e
    bl         Flag_GetEvent
    beq        LAB_080531e2
    mov        r0,#0x5d
    bl         Flag_GetBase
    bne        LAB_080531e2
    mov        r0,#0x5d
    bl         Flag_SetBase
    push       {r5}
    ldr        r0,PTR_Scene_StartFixedBattle_08053248
    mov        r1,#0x29
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_08053212
LAB_080531e2:
    cmp        r0,#0x2
    bne        LAB_08053212
    mov        r0,#0x1
    bl         Flag_GetGate
    beq        LAB_08053212
    mov        r0,#0x35
    bl         KeyItem_IsPresent
    bne        LAB_080531fa
    ldr        r1,DAT_0805324c
    b          LAB_08053208
LAB_080531fa:
    mov        r1,#0xa
    push       {r5}
    ldr        r0,PTR_Scene_Dialogue_08053250
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_08053212
LAB_08053208:
    push       {r5}
    ldr        r0,PTR_Scene_LockedPath_08053254
    bl         Scene_Prepare
    pop        {r5}
LAB_08053212:
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}

    .align 2, 0

DAT_0805321c:
    .word MapSetup_Undernet_5

PTR_BgTask_80515C8_08053220:
    .word BgTask_80515C8

PTR_BgTask_8051618_08053224:
    .word BgTask_8051618

PTR_BgTask_8051668_08053228:
    .word BgTask_8051668

PTR_BgTask_80516B8_0805322c:
    .word BgTask_80516B8

PTR_BgTask_80516F8_08053230:
    .word BgTask_80516F8

PTR_BgTask_8051780_08053234:
    .word BgTask_8051780

PTR_BgTask_8051820_08053238:
    .word BgTask_8051820

PTR_EventHandler_Undernet_5_0805323c:
    .word EventHandler_Undernet_5

PTR_NPCList_80549D0_08053240:
    .word NPCList_80549D0

PTR_PTR_EventHandler_Undernet_5_0_08053244:
    .word PTR_EventHandler_Undernet_5_0_080531a4

PTR_Scene_StartFixedBattle_08053248:
    .word Scene_StartFixedBattle

DAT_0805324c:
    .word 0xA03

PTR_Scene_Dialogue_08053250:
    .word Scene_Dialogue

PTR_Scene_LockedPath_08053254:
    .word Scene_LockedPath
