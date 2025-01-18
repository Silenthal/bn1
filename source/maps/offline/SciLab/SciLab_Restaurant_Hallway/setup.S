#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_SciLab_Restaurant_Hallway_S4
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_SciLab_Restaurant_Hallway_F40_0803c0f0
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    Flag_GetBase 0xC5
    bne        LAB_0803bf70
    Flag_GetBase 0xAB
    beq        LAB_0803bf70
    push       {r5}
    ldr        r0,PTR_BgTask_803B9DC_0803c0f4
    bl         BgTask_AddNew
    pop        {r5}
LAB_0803bf70:
    push       {r5}
    ldr        r0,PTR_BgTask_803B9F4_0803c0f8
    bl         BgTask_AddNew
    pop        {r5}
    Flag_GetBase 0xC5
    bne        LAB_0803bf92
    Flag_GetBase 0xAB
    beq        LAB_0803bf92
    mov        r0,#T_Incident_Occurrence
    bl         Sound_PlayBGM
    b          LAB_0803bf96
LAB_0803bf92:
    bl         Sound_AreaSongChange
LAB_0803bf96:
    pop        {pc}

PTR_MapSetup_SciLab_Restaurant_Hallway_F40_0803bf98:
    .word MapSetup_SciLab_Restaurant_Hallway_F40
    .word MapSetup_SciLab_Restaurant_Hallway_F41
    .word MapSetup_SciLab_Restaurant_Hallway_F41
    .word MapSetup_SciLab_Restaurant_Hallway_F41
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default


_ts EventHandler_SciLab_Restaurant_Hallway_S4
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_SciLab_Restaurant_Hallway_F40_0803c0fc
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         EventHandler_SciLab_Restaurant_Hallway_S4_HandleExits
    pop        {pc}

PTR_EventHandler_SciLab_Restaurant_Hallway_F40_0803bfc8:
    .word EventHandler_SciLab_Restaurant_Hallway_F40
    .word EventHandler_SciLab_Restaurant_Hallway_F41
    .word EventHandler_SciLab_Restaurant_Hallway_F41
    .word EventHandler_SciLab_Restaurant_Hallway_F41
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default


_ts MapSetup_SciLab_Restaurant_Hallway_F40
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_803D1EC_0803c100
    bl         Map_LoadNPCList
    pop        {r5}
    Flag_SetGate F_GATE_00
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_SciLab_Restaurant_Hallway_F40
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_SciLab_Restaurant_Hallway_F40_0_0803c104
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_SciLab_Restaurant_Hallway_F40_0_0803c024:
    .word EventHandler_SciLab_Restaurant_Hallway_F40_0


_ts EventHandler_SciLab_Restaurant_Hallway_F40_0
    push       {lr}
    pop        {pc}


_ts MapSetup_SciLab_Restaurant_Hallway_F41
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_803D20C_0803c108
    bl         Map_LoadNPCList
    pop        {r5}
    Flag_SetGate F_GATE_00
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_SciLab_Restaurant_Hallway_F41
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_SciLab_Restaurant_Hallway_F41_0_0803c10c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_SciLab_Restaurant_Hallway_F41_0_0803c068:
    .word EventHandler_SciLab_Restaurant_Hallway_F41_0


_ts EventHandler_SciLab_Restaurant_Hallway_F41_0
    push       {lr}
    pop        {pc}


_ts EventHandler_SciLab_Restaurant_Hallway_S4_HandleExits
    push       {lr}
    bl         Scene_IsSceneActive
    tst        r0,r0
    bne        LAB_0803c0ec
    LoadMain world, r0, r7
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x20
    bne        LAB_0803c0aa
    LoadMain world, r0, r0
    ldrb       r1,[r0,#0x6]
    cmp        r1,#0x41
    bne        LAB_0803c09c
    push       {r5}
    ldr        r0,PTR_Scene_Dialogue_0803c110
    mov        r1,#0x6
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_0803c0aa
LAB_0803c09c:
    push       {r5}
    ldr        r0,PTR_Scene_GovtElevator_0803c114
    mov        r1,#0x1
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0803c0aa:
    cmp        r0,#0xf1
    bne        LAB_0803c0c6
    LoadMain world, r0, r0
    ldrb       r1,[r0,#0x6]
    cmp        r1,#0x41
    bne        LAB_0803c0c6
    push       {r5}
    ldr        r0,PTR_Scene_ChangeMap_0803c118
    mov        r1,#0x14
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0803c0c6:
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x1
    bne        LAB_0803c0ec
    push       {r5}
    mov        r1,#0x4
    lsl        r1,r1,#0x8
    mov        r0,#0x3
    orr        r1,r0
    ldr        r0,PTR_Scene_LockedPath_0803c11c
    bl         Scene_Prepare
    pop        {r5}
LAB_0803c0ec:
    pop        {pc}

    .align 2, 0

PTR_PTR_MapSetup_SciLab_Restaurant_Hallway_F40_0803c0f0:
    .word PTR_MapSetup_SciLab_Restaurant_Hallway_F40_0803bf98

PTR_BgTask_803B9DC_0803c0f4:
    .word BgTask_803B9DC

PTR_BgTask_803B9F4_0803c0f8:
    .word BgTask_803B9F4

PTR_PTR_EventHandler_SciLab_Restaurant_Hallway_F40_0803c0fc:
    .word PTR_EventHandler_SciLab_Restaurant_Hallway_F40_0803bfc8

PTR_NPCList_803D1EC_0803c100:
    .word NPCList_803D1EC

PTR_PTR_EventHandler_SciLab_Restaurant_Hallway_F40_0_0803c104:
    .word PTR_EventHandler_SciLab_Restaurant_Hallway_F40_0_0803c024

PTR_NPCList_803D20C_0803c108:
    .word NPCList_803D20C

PTR_PTR_EventHandler_SciLab_Restaurant_Hallway_F41_0_0803c10c:
    .word PTR_EventHandler_SciLab_Restaurant_Hallway_F41_0_0803c068

PTR_Scene_Dialogue_0803c110:
    .word Scene_Dialogue

PTR_Scene_GovtElevator_0803c114:
    .word Scene_GovtElevator

PTR_Scene_ChangeMap_0803c118:
    .word Scene_ChangeMap

PTR_Scene_LockedPath_0803c11c:
    .word Scene_LockedPath


_ts MapSetup_SciLab_Restaurant_Hallway_S5
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_SciLab_Restaurant_Hallway_F50_0803c218
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_803B9F4_0803c21c
    bl         BgTask_AddNew
    pop        {r5}
    bl         Sound_AreaSongChange
    pop        {pc}

    .align 2, 0

PTR_MapSetup_SciLab_Restaurant_Hallway_F50_0803c13c:
    .word MapSetup_SciLab_Restaurant_Hallway_F50
    .word MapSetup_SciLab_Restaurant_Hallway_F50
    .word MapSetup_SciLab_Restaurant_Hallway_F50
    .word MapSetup_SciLab_Restaurant_Hallway_F50
    .word MapSetup_SciLab_Restaurant_Hallway_F50
    .word MapSetup_SciLab_Restaurant_Hallway_F50
    .word MapSetup_SciLab_Restaurant_Hallway_F50
    .word MapSetup_SciLab_Restaurant_Hallway_F50


_ts EventHandler_SciLab_Restaurant_Hallway_S5
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_SciLab_Restaurant_Hallway_F50_0803c220
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         EventHandler_SciLab_Restaurant_Hallway_S5_HandleExits
    pop        {pc}

PTR_EventHandler_SciLab_Restaurant_Hallway_F50_0803c16c:
    .word EventHandler_SciLab_Restaurant_Hallway_F50
    .word EventHandler_SciLab_Restaurant_Hallway_F50
    .word EventHandler_SciLab_Restaurant_Hallway_F50
    .word EventHandler_SciLab_Restaurant_Hallway_F50
    .word EventHandler_SciLab_Restaurant_Hallway_F50
    .word EventHandler_SciLab_Restaurant_Hallway_F50
    .word EventHandler_SciLab_Restaurant_Hallway_F50
    .word EventHandler_SciLab_Restaurant_Hallway_F50


_ts MapSetup_SciLab_Restaurant_Hallway_F50
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_NPCList_803D1EC_0803c224
    bl         Map_LoadNPCList
    pop        {r5}
    Flag_SetGate F_GATE_00
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_SciLab_Restaurant_Hallway_F50
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_SciLab_Restaurant_Hallway_F50_0_0803c228
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_SciLab_Restaurant_Hallway_F50_0_0803c1c4:
    .word EventHandler_SciLab_Restaurant_Hallway_F50_0


_ts EventHandler_SciLab_Restaurant_Hallway_F50_0
    push       {lr}
    pop        {pc}


_ts EventHandler_SciLab_Restaurant_Hallway_S5_HandleExits
    push       {lr}
    bl         Scene_IsSceneActive
    tst        r0,r0
    bne        LAB_0803c214
    LoadMain world, r0, r7
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x20
    bne        LAB_0803c1ee
    push       {r5}
    ldr        r0,PTR_Scene_GovtElevator_0803c22c
    mov        r1,#0x1
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0803c1ee:
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x1
    bne        LAB_0803c214
    push       {r5}
    mov        r1,#0x4
    lsl        r1,r1,#0x8
    mov        r0,#0x3
    orr        r1,r0
    ldr        r0,PTR_Scene_LockedPath_0803c230
    bl         Scene_Prepare
    pop        {r5}
LAB_0803c214:
    pop        {pc}

    .align 2, 0

PTR_PTR_MapSetup_SciLab_Restaurant_Hallway_F50_0803c218:
    .word PTR_MapSetup_SciLab_Restaurant_Hallway_F50_0803c13c

PTR_BgTask_803B9F4_0803c21c:
    .word BgTask_803B9F4

PTR_PTR_EventHandler_SciLab_Restaurant_Hallway_F50_0803c220:
    .word PTR_EventHandler_SciLab_Restaurant_Hallway_F50_0803c16c

PTR_NPCList_803D1EC_0803c224:
    .word NPCList_803D1EC

PTR_PTR_EventHandler_SciLab_Restaurant_Hallway_F50_0_0803c228:
    .word PTR_EventHandler_SciLab_Restaurant_Hallway_F50_0_0803c1c4

PTR_Scene_GovtElevator_0803c22c:
    .word Scene_GovtElevator

PTR_Scene_LockedPath_0803c230:
    .word Scene_LockedPath
