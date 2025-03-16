#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_SciLab_Power_Plant_S4
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_Default_0803ca20
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    Flag_GetBase 0xC5
    bne        LAB_0803c844
    push       {r5}
    ldr        r0,PTR_BgTask_803BAD4_0803ca24
    bl         BgTask_AddNew
    pop        {r5}
LAB_0803c844:
    Flag_GetBase 0xC5
    bne        LAB_0803c854
    mov        r0,#T_Suspicious_Mood
    bl         Sound_PlayBGM
    b          LAB_0803c858
LAB_0803c854:
    bl         Sound_AreaSongChange
LAB_0803c858:
    pop        {pc}

    .align 2, 0

PTR_MapSetup_Default_0803c85c:
    .word MapSetup_Default
    .word MapSetup_SciLab_Power_Plant_F41
    .word MapSetup_SciLab_Power_Plant_F42
    .word MapSetup_SciLab_Power_Plant_F43
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default


_ts EventHandler_SciLab_Power_Plant_S4
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Default_0803ca28
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         FUN_0803c9ac
    pop        {pc}

PTR_EventHandler_Default_0803c88c:
    .word EventHandler_Default
    .word EventHandler_SciLab_Power_Plant_F41
    .word EventHandler_SciLab_Power_Plant_F42
    .word EventHandler_SciLab_Power_Plant_F43
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default


_ts MapSetup_SciLab_Power_Plant_F41
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_803D48C_0803ca2c
    bl         Map_LoadNPCList
    pop        {r5}
    Flag_SetGate F_GATE_01
    Flag_SetGate F_GATE_02
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_SciLab_Power_Plant_F41
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_SciLab_Power_Plant_F41_0_0803ca30
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_SciLab_Power_Plant_F41_0_0803c8ec:
    .word EventHandler_SciLab_Power_Plant_F41_0
    .word EventHandler_SciLab_Power_Plant_F41_1


_ts EventHandler_SciLab_Power_Plant_F41_0
    push       {lr}
    Flag_GetBase 0xAF
    beq        LAB_0803c926
    push       {r5}
    mov        r0,#TF_DialogueActive
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0803c926
    Flag_ClearGate F_GATE_01
    push       {r5}
    ldr        r0,PTR_BgTask_803BABC_0803ca34
    bl         BgTask_AddNew
    pop        {r5}
    LoadMain world, r0, r0
    mov        r1,#0x42
    strb       r1,[r0,#World_storyFlag]
    mov        r0,#0x0
    strb       r0,[r5,#0x0]
LAB_0803c926:
    pop        {pc}


_ts EventHandler_SciLab_Power_Plant_F41_1
    push       {lr}
    pop        {pc}


_ts MapSetup_SciLab_Power_Plant_F42
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_803D4CC_0803ca38
    bl         Map_LoadNPCList
    pop        {r5}
    Flag_SetGate F_GATE_02
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_SciLab_Power_Plant_F42
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_SciLab_Power_Plant_F42_0_0803ca3c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_SciLab_Power_Plant_F42_0_0803c968:
    .word EventHandler_SciLab_Power_Plant_F42_0


_ts EventHandler_SciLab_Power_Plant_F42_0
    push       {lr}
    pop        {pc}


_ts MapSetup_SciLab_Power_Plant_F43
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_803D4D4_0803ca40
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_SciLab_Power_Plant_F43
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_SciLab_Power_Plant_F43_0_0803ca44
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_SciLab_Power_Plant_F43_0_0803c9a4:
    .word EventHandler_SciLab_Power_Plant_F43_0


_ts EventHandler_SciLab_Power_Plant_F43_0
    push       {lr}
    pop        {pc}


_ts FUN_0803c9ac
    push       {lr}
    bl         Scene_IsSceneActive
    tst        r0,r0
    bne        LAB_0803ca1c
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#World_playerLocation]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x21
    bne        LAB_0803c9d8
    push       {r5}
    ldr        r0,PTR_Scene_LockedPath_0803ca48
    ldr        r1,DAT_0803ca4c
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0803c9d8:
    cmp        r0,#0x2
    bne        LAB_0803c9fa
    LoadMain world, r0, r0
    ldrb       r1,[r0,#World_storyFlag]
    cmp        r1,#0x41
    bne        LAB_0803c9fa
    bl         dummy_187a0
    bne        LAB_0803c9fa
    push       {r5}
    ldr        r0,PTR_Scene_LockedPath_0803ca50
    ldr        r1,DAT_0803ca54
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0803c9fa:
    cmp        r0,#0x3
    bne        LAB_0803ca1c
    LoadMain world, r0, r0
    ldrb       r1,[r0,#World_storyFlag]
    cmp        r1,#0x42
    bhi        LAB_0803ca1c
    bl         dummy_187a0
    bne        LAB_0803c9fa
    push       {r5}
    ldr        r0,PTR_Scene_LockedPath_0803ca58
    ldr        r1,DAT_0803ca5c
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0803ca1c:
    pop        {pc}

    .align 2, 0

PTR_PTR_MapSetup_Default_0803ca20:
    .word PTR_MapSetup_Default_0803c85c

PTR_BgTask_803BAD4_0803ca24:
    .word BgTask_803BAD4

PTR_PTR_EventHandler_Default_0803ca28:
    .word PTR_EventHandler_Default_0803c88c

PTR_NPCList_803D48C_0803ca2c:
    .word NPCList_803D48C

PTR_PTR_EventHandler_SciLab_Power_Plant_F41_0_0803ca30:
    .word PTR_EventHandler_SciLab_Power_Plant_F41_0_0803c8ec

PTR_BgTask_803BABC_0803ca34:
    .word BgTask_803BABC

PTR_NPCList_803D4CC_0803ca38:
    .word NPCList_803D4CC

PTR_PTR_EventHandler_SciLab_Power_Plant_F42_0_0803ca3c:
    .word PTR_EventHandler_SciLab_Power_Plant_F42_0_0803c968

PTR_NPCList_803D4D4_0803ca40:
    .word NPCList_803D4D4

PTR_PTR_EventHandler_SciLab_Power_Plant_F43_0_0803ca44:
    .word PTR_EventHandler_SciLab_Power_Plant_F43_0_0803c9a4

PTR_Scene_LockedPath_0803ca48:
    .word Scene_LockedPath

DAT_0803ca4c:
    .word 0xDC03

PTR_Scene_LockedPath_0803ca50:
    .word Scene_LockedPath

DAT_0803ca54:
    .word 0xDE03

PTR_Scene_LockedPath_0803ca58:
    .word Scene_LockedPath

DAT_0803ca5c:
    .word 0xDD03


_ts MapSetup_SciLab_Power_Plant_S5
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_SciLab_Power_Plant_F50_0803cb50
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Sound_AreaSongChange
    pop        {pc}

PTR_MapSetup_SciLab_Power_Plant_F50_0803ca70:
    .word MapSetup_SciLab_Power_Plant_F50
    .word MapSetup_SciLab_Power_Plant_F50
    .word MapSetup_SciLab_Power_Plant_F50
    .word MapSetup_SciLab_Power_Plant_F50
    .word MapSetup_SciLab_Power_Plant_F50
    .word MapSetup_SciLab_Power_Plant_F50
    .word MapSetup_SciLab_Power_Plant_F50
    .word MapSetup_SciLab_Power_Plant_F50


_ts EventHandler_SciLab_Power_Plant_S5
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_SciLab_Power_Plant_F50_0803cb54
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         FUN_0803cb10
    pop        {pc}

PTR_EventHandler_SciLab_Power_Plant_F50_0803caa0:
    .word EventHandler_SciLab_Power_Plant_F50
    .word EventHandler_SciLab_Power_Plant_F50
    .word EventHandler_SciLab_Power_Plant_F50
    .word EventHandler_SciLab_Power_Plant_F50
    .word EventHandler_SciLab_Power_Plant_F50
    .word EventHandler_SciLab_Power_Plant_F50
    .word EventHandler_SciLab_Power_Plant_F50
    .word EventHandler_SciLab_Power_Plant_F50


_ts MapSetup_SciLab_Power_Plant_F50
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    LoadMain world, r7, r7
    ldrb       r7,[r7,#World_storyFlag]
    cmp        r7,#0x53
    blt        LAB_0803cae4
    ldr        r7,PTR_NPCList_803D500_0803cb58
    bl         Map_LoadNPCList
    b          LAB_0803caea
LAB_0803cae4:
    ldr        r7,PTR_NPCList_803D4F4_0803cb5c
    bl         Map_LoadNPCList
LAB_0803caea:
    pop        {r5}
    Flag_SetGate F_GATE_02
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_SciLab_Power_Plant_F50
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_SciLab_Power_Plant_F50_0_0803cb60
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_SciLab_Power_Plant_F50_0_0803cb08:
    .word EventHandler_SciLab_Power_Plant_F50_0


_ts EventHandler_SciLab_Power_Plant_F50_0
    push       {lr}
    pop        {pc}


_ts FUN_0803cb10
    push       {lr}
    bl         Scene_IsSceneActive
    tst        r0,r0
    bne        LAB_0803cb4c
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#World_playerLocation]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x21
    bne        LAB_0803cb3c
    push       {r5}
    ldr        r0,PTR_Scene_LockedPath_0803cb64
    ldr        r1,DAT_0803cb68
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_0803cb4c
LAB_0803cb3c:
    cmp        r0,#0x3
    bne        LAB_0803cb4c
    push       {r5}
    ldr        r0,PTR_Scene_LockedPath_0803cb6c
    ldr        r1,DAT_0803cb68
    bl         Scene_Prepare
    pop        {r5}
LAB_0803cb4c:
    pop        {pc}

    .align 2, 0

PTR_PTR_MapSetup_SciLab_Power_Plant_F50_0803cb50:
    .word PTR_MapSetup_SciLab_Power_Plant_F50_0803ca70

PTR_PTR_EventHandler_SciLab_Power_Plant_F50_0803cb54:
    .word PTR_EventHandler_SciLab_Power_Plant_F50_0803caa0

PTR_NPCList_803D500_0803cb58:
    .word NPCList_803D500

PTR_NPCList_803D4F4_0803cb5c:
    .word NPCList_803D4F4

PTR_PTR_EventHandler_SciLab_Power_Plant_F50_0_0803cb60:
    .word PTR_EventHandler_SciLab_Power_Plant_F50_0_0803cb08

PTR_Scene_LockedPath_0803cb64:
    .word Scene_LockedPath

DAT_0803cb68:
    .word 0xDC03

PTR_Scene_LockedPath_0803cb6c:
    .word Scene_LockedPath
