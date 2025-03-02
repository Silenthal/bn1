#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_DenTown_Station_S3
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_DenTown_Station_F40_08036dcc
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    LoadMain world, r7, r7
    ldrb       r1,[r7,#World_storyFlag]
    cmp        r1,#0x40
    bge        LAB_08036cd8
    Flag_GetBase 0xBD
    bne        LAB_08036cd8
    Flag_GetBase 0xA6
    beq        LAB_08036cb8
    mov        r0,#T_Incident_Occurrence
    bl         Sound_PlayBGM
    b          LAB_08036cdc
LAB_08036cb8:
    Flag_GetBase 0x9B
    beq        LAB_08036cc8
    mov        r0,#T_Suspicious_Mood
    bl         Sound_PlayBGM
    b          LAB_08036cdc
LAB_08036cc8:
    Flag_GetBase 0x98
    beq        LAB_08036cd8
    mov        r0,#T_Incident_Occurrence
    bl         Sound_PlayBGM
    b          LAB_08036cdc
LAB_08036cd8:
    bl         Sound_AreaSongChange
LAB_08036cdc:
    pop        {pc}

    .align 2, 0

PTR_MapSetup_DenTown_Station_F40_08036ce0:
    .word MapSetup_DenTown_Station_F40
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default


_ts EventHandler_DenTown_Station_S3
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_DenTown_Station_F40_08036dd0
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_DenTown_Station_F40_08036d0c:
    .word EventHandler_DenTown_Station_F40
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default


_ts MapSetup_DenTown_Station_F40
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_803904C_08036dd4
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_BgTask_ACDC_Station_Tileset_Gate_Closed_08036dd8
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8036DDC
    bl         BgTask_AddNew
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_DenTown_Station_F40
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_DenTown_Station_F30_0_08036de0
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    bl         FUN_08036db0
    pop        {pc}

PTR_EventHandler_DenTown_Station_F30_0_08036d74:
    .word EventHandler_DenTown_Station_F30_0


_ts EventHandler_DenTown_Station_F30_0
    push       {lr}
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#World_playerLocation]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x10
    bne        LAB_08036dae
    Flag_GetBase 0x2A
    beq        LAB_08036dae
    push       {r5}
    mov        r0,#0x3d
    bl         KeyItem_IsPresent
    beq        LAB_08036da4
    mov        r1,#0x5
    b          LAB_08036da6
LAB_08036da4:
    mov        r1,#0x4
LAB_08036da6:
    ldr        r0,PTR_Scene_TrainRide_08036de4
    bl         Scene_Prepare
    pop        {r5}
LAB_08036dae:
    pop        {pc}


_ts FUN_08036db0
    push       {lr}
    LoadMain world, r0, r7
    ldrb       r0,[r0,#World_curEventFlag]
    cmp        r0,#0x20
    bne        LAB_08036dc8
    push       {r5}
    mov        r1,#0x0
    ldr        r0,PTR_Scene_Dialogue_08036de8
    bl         Scene_Prepare
    pop        {r5}
LAB_08036dc8:
    pop        {pc}

    .align 2, 0

PTR_PTR_MapSetup_DenTown_Station_F40_08036dcc:
    .word PTR_MapSetup_DenTown_Station_F40_08036ce0

PTR_PTR_EventHandler_DenTown_Station_F40_08036dd0:
    .word PTR_EventHandler_DenTown_Station_F40_08036d0c

PTR_NPCList_803904C_08036dd4:
    .word NPCList_803904C

PTR_BgTask_ACDC_Station_Tileset_Gate_Closed_08036dd8:
    .word BgTask_ACDC_Station_Tileset_Gate_Closed

PTR_BgTask_8036DDC:
    .word BgTask_802A374

PTR_PTR_EventHandler_DenTown_Station_F30_0_08036de0:
    .word PTR_EventHandler_DenTown_Station_F30_0_08036d74

PTR_Scene_TrainRide_08036de4:
    .word Scene_TrainRide

PTR_Scene_Dialogue_08036de8:
    .word Scene_Dialogue


_ts MapSetup_DenTown_Station_S5
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_DenTown_Station_F50_08036f00
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Sound_AreaSongChange
    pop        {pc}

PTR_MapSetup_DenTown_Station_F50_08036dfc:
    .word MapSetup_DenTown_Station_F50
    .word MapSetup_DenTown_Station_F50
    .word MapSetup_DenTown_Station_F50
    .word MapSetup_DenTown_Station_F50
    .word MapSetup_DenTown_Station_F50
    .word MapSetup_DenTown_Station_F50
    .word MapSetup_DenTown_Station_F50
    .word MapSetup_DenTown_Station_F50


_ts EventHandler_DenTown_Station_S5
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_DenTown_Station_F50_08036f04
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_DenTown_Station_F50_08036e28:
    .word EventHandler_DenTown_Station_F50
    .word EventHandler_DenTown_Station_F50
    .word EventHandler_DenTown_Station_F50
    .word EventHandler_DenTown_Station_F50
    .word EventHandler_DenTown_Station_F50
    .word EventHandler_DenTown_Station_F50
    .word EventHandler_DenTown_Station_F50
    .word EventHandler_DenTown_Station_F50


_ts MapSetup_DenTown_Station_F50
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    LoadMain world, r7, r7
    ldrb       r0,[r7,#World_storyFlag]
    cmp        r0,#0x53
    bge        LAB_08036e72
    push       {r5}
    ldr        r7,PTR_NPCList_803904C_08036f08
    bl         Map_LoadNPCList
    pop        {r5}
    b          LAB_08036e7c
LAB_08036e72:
    push       {r5}
    ldr        r7,PTR_NPCList_8039094_08036f0c
    bl         Map_LoadNPCList
    pop        {r5}
LAB_08036e7c:
    push       {r5}
    ldr        r0,PTR_BgTask_ACDC_Station_Tileset_Gate_Closed_08036f10
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8036F14
    bl         BgTask_AddNew
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_DenTown_Station_F50
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_DenTown_Station_F50_0_08036f18
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    bl         FUN_08036ee4
    pop        {pc}

    .align 2, 0

PTR_EventHandler_DenTown_Station_F50_0_08036ea8:
    .word EventHandler_DenTown_Station_F50_0


_ts EventHandler_DenTown_Station_F50_0
    push       {lr}
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#World_playerLocation]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x10
    bne        LAB_08036ee2
    Flag_GetBase 0x2A
    beq        LAB_08036ee2
    push       {r5}
    mov        r0,#0x3d
    bl         KeyItem_IsPresent
    beq        LAB_08036ed8
    mov        r1,#0x5
    b          LAB_08036eda
LAB_08036ed8:
    mov        r1,#0x4
LAB_08036eda:
    ldr        r0,PTR_Scene_TrainRide_08036f1c
    bl         Scene_Prepare
    pop        {r5}
LAB_08036ee2:
    pop        {pc}


_ts FUN_08036ee4
    push       {lr}
    LoadMain world, r0, r7
    ldrb       r0,[r0,#World_curEventFlag]
    cmp        r0,#0x20
    bne        LAB_08036efc
    push       {r5}
    mov        r1,#0x0
    ldr        r0,PTR_Scene_Dialogue_08036f20
    bl         Scene_Prepare
    pop        {r5}
LAB_08036efc:
    pop        {pc}

    .align 2, 0

PTR_PTR_MapSetup_DenTown_Station_F50_08036f00:
    .word PTR_MapSetup_DenTown_Station_F50_08036dfc

PTR_PTR_EventHandler_DenTown_Station_F50_08036f04:
    .word PTR_EventHandler_DenTown_Station_F50_08036e28

PTR_NPCList_803904C_08036f08:
    .word NPCList_803904C

PTR_NPCList_8039094_08036f0c:
    .word NPCList_8039094

PTR_BgTask_ACDC_Station_Tileset_Gate_Closed_08036f10:
    .word BgTask_ACDC_Station_Tileset_Gate_Closed

PTR_BgTask_8036F14:
    .word BgTask_802A374

PTR_PTR_EventHandler_DenTown_Station_F50_0_08036f18:
    .word PTR_EventHandler_DenTown_Station_F50_0_08036ea8

PTR_Scene_TrainRide_08036f1c:
    .word Scene_TrainRide

PTR_Scene_Dialogue_08036f20:
    .word Scene_Dialogue
