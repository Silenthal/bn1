#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts FlagSetup_School_S0
    push       {lr}
    pop        {pc}


_ts MapSetup_School_Class_5A_S0
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_School_Class_5A_F00_080248b8
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_ARRAY_080248bc
    bl         Entity_AllocList
    pop        {r5}
    bl         Sound_AreaSongChange
    pop        {pc}

    .align 2, 0

PTR_MapSetup_School_Class_5A_F00_0802472c:
    .word MapSetup_School_Class_5A_F00
    .word MapSetup_Default
    .word MapSetup_School_Class_5A_F02
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default


_ts EventHandler_School_Class_5A_S0
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Class_5A_F00_080248c0
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_Class_5A_F00_08024758:
    .word EventHandler_School_Class_5A_F00
    .word EventHandler_Default
    .word EventHandler_School_Class_5A_F02
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default


_ts MapSetup_School_Class_5A_F00
    push       {lr}
    push       {r5}
    ldr        r0,PTR_BgTask_80248C4
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_80248C8
    bl         BgTask_AddNew
    ldr        r7,PTR_PTR_DAT_080248cc
    bl         Map_LoadNPCList
    Flag_SetGate F_GATE_00
    Flag_SetGate F_GATE_01
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_School_Class_5A_F00
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Class_5A_F00_0_080248d0
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_Class_5A_F00_0_080247c0:
    .word EventHandler_School_Class_5A_F00_0


_ts EventHandler_School_Class_5A_F00_0
    push       {lr}
    push       {r5}
    Flag_GetBase 0xCF
    pop        {r5}
    bne        LAB_080247fa
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#World_playerLocation]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x1
    beq        LAB_080247ec
    cmp        r0,#0x2
    beq        LAB_080247ec
    b          LAB_080247f8
LAB_080247ec:
    push       {r5}
    ldr        r0,PTR_Scene_LockedPath_School_Class_5A_080248d4
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_080247f8:
    pop        {pc}
LAB_080247fa:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    push       {r5}
    ldr        r0,PTR_Scene_Story_02_DexChallengePreTutorial_080248d8
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    LoadMain world, r0, r0
    mov        r1,#0x1
    strb       r1,[r0,#World_storyFlag]
    pop        {pc}


_ts MapSetup_School_Class_5A_F02
    push       {lr}
    push       {r5}
    ldr        r0,PTR_BgTask_80248DC
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_80248E0
    bl         BgTask_AddNew
    ldr        r7,PTR_PTR_DAT_080248e4
    bl         Map_LoadNPCList
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    Flag_GetBase 0x44
    pop        {r5}
    bne        LAB_0802485c
    push       {r5}
    Flag_GetBase 0x2B
    pop        {r5}
    beq        LAB_0802485c
    push       {r5}
    ldr        r0,PTR_Scene_AfterFixedBattle_080248e8
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_08024870
LAB_0802485c:
    Flag_GetBase 0x97
    bne        LAB_08024870
    push       {r5}
    ldr        r0,PTR_Scene_Story_04_080248ec
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_08024870:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}

    .align 2, 0


_ts EventHandler_School_Class_5A_F02
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Class_5A_F02_0_080248f0
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_Class_5A_F02_0_08024888:
    .word EventHandler_School_Class_5A_F02_0


_ts EventHandler_School_Class_5A_F02_0
    push       {lr}
    LoadMain mapChange, r1, r7
    ldr        r0,PTR_MapEntrance_ARRAY_080248f4
    str        r0,[r1,#MapChange_destinationList]
    Flag_GetBase 0x44
    bne        LAB_080248b6
    push       {r5}
    Flag_GetBase 0x2B
    pop        {r5}
    beq        LAB_080248b6
    push       {r5}
    ldr        r0,DAT_080248f8
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_080248b6:
    pop        {pc}
PTR_PTR_MapSetup_School_Class_5A_F00_080248b8:
    .word PTR_MapSetup_School_Class_5A_F00_0802472c
PTR_EntityAllocParams_ARRAY_080248bc:
    .word EntityAllocParams_8029B18
PTR_PTR_EventHandler_School_Class_5A_F00_080248c0:
    .word PTR_EventHandler_School_Class_5A_F00_08024758
PTR_BgTask_80248C4:
    .word BgTask_School_TilesetBlackboardTriangle
PTR_BgTask_80248C8:
    .word BgTask_School_PaletteBlackboardOff
PTR_PTR_DAT_080248cc:
    .word NPCList_8028964
PTR_PTR_EventHandler_School_Class_5A_F00_0_080248d0:
    .word PTR_EventHandler_School_Class_5A_F00_0_080247c0
PTR_Scene_LockedPath_School_Class_5A_080248d4:
    .word Scene_LockedPath_School_Class_5A
PTR_Scene_Story_02_DexChallengePreTutorial_080248d8:
    .word Scene_Story_02_DexChallengePreTutorial
PTR_BgTask_80248DC:
    .word BgTask_School_TilesetBlackboardTriangle
PTR_BgTask_80248E0:
    .word BgTask_School_PaletteBlackboardOff
PTR_PTR_DAT_080248e4:
    .word NPCList_8028B64
PTR_Scene_AfterFixedBattle_080248e8:
    .word Scene_AfterFixedBattle
PTR_Scene_Story_04_080248ec:
    .word Scene_Story_04
PTR_PTR_EventHandler_School_Class_5A_F02_0_080248f0:
    .word PTR_EventHandler_School_Class_5A_F02_0_08024888
PTR_MapEntrance_ARRAY_080248f4:
    .word MapEntrance_ARRAY_08023de8
DAT_080248f8:
    .word Scene_StartFixedBattle


_ts MapSetup_School_Class_5A_S1
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_School_Class_5A_F10_0802492c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_ARRAY_08024930
    bl         Entity_AllocList
    pop        {r5}
    push       {r5}
    Flag_GetBase 0x9A
    pop        {r5}
    beq        LAB_08024924
    mov        r0,#T_Incident_Occurrence
    bl         Sound_PlayBGM
    pop        {pc}
LAB_08024924:
    bl         Sound_AreaSongChange
    pop        {pc}

    .align 2, 0

PTR_PTR_MapSetup_School_Class_5A_F10_0802492c:
    .word PTR_MapSetup_School_Class_5A_F10_08024934
PTR_EntityAllocParams_ARRAY_08024930:
    .word EntityAllocParams_8029B18
PTR_MapSetup_School_Class_5A_F10_08024934:
    .word MapSetup_School_Class_5A_F10
    .word MapSetup_School_Class_5A_F11
    .word MapSetup_School_Class_5A_F12
    .word MapSetup_School_Class_5A_F13
    .word MapSetup_School_Class_5A_F14
    .word MapSetup_School_Class_5A_F15
    .word MapSetup_Default
    .word MapSetup_Default


_ts EventHandler_School_Class_5A_S1
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Class_5A_F10_08024960
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_PTR_EventHandler_School_Class_5A_F10_08024960:
    .word PTR_EventHandler_School_Class_5A_F10_08024964
PTR_EventHandler_School_Class_5A_F10_08024964:
    .word EventHandler_School_Class_5A_F10
    .word EventHandler_School_Class_5A_F11
    .word EventHandler_School_Class_5A_F12
    .word EventHandler_School_Class_5A_F13
    .word EventHandler_School_Class_5A_F14
    .word EventHandler_School_Class_5A_F15
    .word EventHandler_Default
    .word EventHandler_Default


_ts MapSetup_School_Class_5A_F10
    push       {lr}
    push       {r5}
    ldr        r0,PTR_BgTask_8024A10
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8024A14
    bl         BgTask_AddNew
    Flag_SetGate F_GATE_00
    Flag_SetGate F_GATE_01
    Flag_GetBase 0x92
    beq        LAB_080249e8
    ldr        r7,PTR_PTR_DAT_08024a18
    bl         Map_LoadNPCList
    pop        {r5}
    Flag_GetBase 0x44
    bne        LAB_080249d0
    push       {r5}
    Flag_GetBase 0x2B
    pop        {r5}
    beq        LAB_080249d0
    push       {r5}
    ldr        r0,DAT_08024a20
    mov        r1,#0x1
    bl         Scene_Prepare
    pop        {r5}
LAB_080249d0:
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    mov        r0,#0x4
    str        r0,[r5,#0x0]
    pop        {pc}
LAB_080249e8:
    LoadMain world, r7, r7
    mov        r0,#0x42
    mov        r1,#0x10
    lsl        r0,r1
    str        r0,[r7,#World_savedPos_x]
    mov        r0,#0xa
    mov        r1,#0x10
    lsl        r0,r1
    str        r0,[r7,#World_savedPos_y]
    mov        r0,#0x0
    str        r0,[r7,#World_savedPos_z]
    ldr        r7,PTR_PTR_DAT_08024a1c
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}

    .align 2, 0

PTR_BgTask_8024A10:
    .word BgTask_School_TilesetBlackboardTriangle
PTR_BgTask_8024A14:
    .word BgTask_School_PaletteBlackboardOff
PTR_PTR_DAT_08024a18:
    .word NPCList_8028C8C
PTR_PTR_DAT_08024a1c:
    .word NPCList_8028C30
DAT_08024a20:
    .word Scene_AfterFixedBattle


_ts EventHandler_School_Class_5A_F10
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Class_5A_F10_0_08024a34
    ldrb       r1,[r5,#0x0]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_PTR_EventHandler_School_Class_5A_F10_0_08024a34:
    .word PTR_EventHandler_School_Class_5A_F10_0_08024a38
PTR_EventHandler_School_Class_5A_F10_0_08024a38:
    .word EventHandler_School_Class_5A_F10_0
    .word EventHandler_School_Class_5A_F10_1


_ts EventHandler_School_Class_5A_F10_0
    push       {lr}
    push       {r5}
    ldr        r0,PTR_Scene_Story_12_08024a50
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
PTR_Scene_Story_12_08024a50:
    .word Scene_Story_12


_ts EventHandler_School_Class_5A_F10_1
    push       {lr}
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#World_playerLocation]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x1
    beq        LAB_08024a6e
    cmp        r0,#0x2
    bne        LAB_08024a80
LAB_08024a6e:
    push       {r5}
    mov        r1,#0x2a
    lsl        r1,r1,#0x8
    mov        r0,#0x7
    orr        r1,r0
    ldr        r0,DAT_08024bbc
    bl         Scene_Prepare
    pop        {r5}
LAB_08024a80:
    Flag_GetBase 0x44
    bne        LAB_08024aa0
    push       {r5}
    Flag_GetBase 0x2B
    pop        {r5}
    beq        LAB_08024aa0
    push       {r5}
    ldr        r0,DAT_08024bc0
    mov        r1,#0x1
    bl         Scene_Prepare
    pop        {r5}
LAB_08024aa0:
    bl         EventHandler_School_Class_5A_F10_1_CheckEveryoneTalk
    push       {r5}
    Flag_GetBase 0x95
    pop        {r5}
    beq        LAB_08024ad4
    bl         Scene_IsSceneActive
    tst        r0,r0
    bne        LAB_08024ad4
    push       {r5}
    mov        r1,#0x1c
    ldr        r0,DAT_08024bc4
    bl         Scene_Prepare
    pop        {r5}
    bl         Sound_StopAllMusic
    LoadMain world, r0, r0
    mov        r1,#0x11
    strb       r1,[r0,#World_storyFlag]
    mov        r0,#0x0
    strb       r0,[r5,#0x0]
LAB_08024ad4:
    pop        {pc}


_nt MapSetup_School_Class_5A_F11
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_BgTask_8024B30
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8024B34
    bl         BgTask_AddNew
    pop        {r5}
    Flag_SetGate F_GATE_00
    Flag_SetGate F_GATE_01
    push       {r5}
    Flag_GetBase 0x9A
    pop        {r5}
    beq        LAB_08024b28
    mov        r0,#T_Incident_Occurrence
    bl         Sound_PlayBGM
    push       {r5}
    ldr        r7,PTR_PTR_DAT_08024b38
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x4
    str        r0,[r5,#0x0]
    pop        {pc}
LAB_08024b28:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}

    .align 2, 0

PTR_BgTask_8024B30:
    .word BgTask_School_TilesetBlackboardEvent
PTR_BgTask_8024B34:
    .word BgTask_School_PaletteBlackboardOn
PTR_PTR_DAT_08024b38:
    .word NPCList_8028CDC


_ts EventHandler_School_Class_5A_F11
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Class_5A_F11_0_08024b54
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_Class_5A_F11_0_08024b4c:
    .word EventHandler_School_Class_5A_F11_0
    .word EventHandler_School_Class_5A_F11_1
PTR_PTR_EventHandler_School_Class_5A_F11_0_08024b54:
    .word PTR_EventHandler_School_Class_5A_F11_0_08024b4c


_ts EventHandler_School_Class_5A_F11_0
    push       {lr}
    mov        r0,#T_School
    bl         Sound_PlayBGM
    push       {r5}
    ldr        r0,PTR_Scene_Story_13_08024b70
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}

    .align 2, 0

PTR_Scene_Story_13_08024b70:
    .word Scene_Story_13


_ts EventHandler_School_Class_5A_F11_1
    push       {lr}
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#World_playerLocation]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x1
    beq        LAB_08024b8e
    cmp        r0,#0x2
    bne        LAB_08024ba0
LAB_08024b8e:
    push       {r5}
    mov        r1,#0x35
    lsl        r1,r1,#0x8
    mov        r0,#0x7
    orr        r1,r0
    ldr        r0,DAT_08024bbc
    bl         Scene_Prepare
    pop        {r5}
LAB_08024ba0:
    push       {r5}
    Flag_GetBase 0x9B
    pop        {r5}
    beq        LAB_08024bb8
    LoadMain world, r0, r0
    mov        r1,#0x12
    strb       r1,[r0,#World_storyFlag]
    mov        r0,#0x0
    strb       r0,[r5,#0x0]
LAB_08024bb8:
    pop        {pc}

    .align 2, 0

DAT_08024bbc:
    .word Scene_LockedPath
DAT_08024bc0:
    .word Scene_StartFixedBattle
DAT_08024bc4:
    .word Scene_Dialogue


_ts MapSetup_School_Class_5A_F12
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    LoadMain world, r7, r7
    ldrb       r0,[r7,#World_currentSongId]
    cmp        r0,#0x4
    beq        LAB_08024bec
    mov        r0,#T_Incident_Occurrence
    bl         Sound_PlayBGM
LAB_08024bec:
    push       {r5}
    Flag_GetBase 0xA6
    pop        {r5}
    bne        LAB_08024c08
    push       {r5}
    Flag_SetGate F_GATE_00
    Flag_SetGate F_GATE_01
    pop        {r5}
LAB_08024c08:
    push       {r5}
    ldr        r0,PTR_BgTask_8024FD0
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8024FD4
    bl         BgTask_AddNew
    Flag_GetBase 0xA1
    pop        {r5}
    bne        LAB_08024c2c
    push       {r5}
    Flag_GetBase 0x9B
    pop        {r5}
    beq        LAB_08024c5a
LAB_08024c2c:
    push       {r5}
    ldr        r7,PTR_DAT_08024fd8
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    Flag_GetBase 0xA4
    pop        {r5}
    beq        LAB_08024c46
    mov        r0,#0xc
    b          LAB_08024c5c
LAB_08024c46:
    push       {r5}
    Flag_GetBase 0xA1
    pop        {r5}
    beq        LAB_08024c56
    mov        r0,#0x8
    b          LAB_08024c5c
LAB_08024c56:
    mov        r0,#0x4
    b          LAB_08024c5c
LAB_08024c5a:
    mov        r0,#0x0
LAB_08024c5c:
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_School_Class_5A_F12
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Class_5A_F12_0_08024fdc
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    mov        r1,#0x1
    bl         FUN_08024f0c
    pop        {pc}

    .align 2, 0

PTR_EventHandler_School_Class_5A_F12_0_08024c78:
    .word EventHandler_School_Class_5A_F12_0
    .word EventHandler_School_Class_5A_F12_1
    .word EventHandler_School_Class_5A_F12_2


_ts EventHandler_School_Class_5A_F12_0
    push       {lr}
    push       {r5}
    ldr        r0,PTR_Scene_Story_14_08024fe0
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_School_Class_5A_F12_1
    push       {lr}
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#World_playerLocation]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x40
    bne        LAB_08024d06
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08024d06
    LoadMain input, r0, r0
    ldrh       r0,[r0,#Input_toggleKeyState]
    ldr        r1,DAT_08024fe4
    and        r1,r0
    beq        LAB_08024d06
    bl         dummy_187a0
    bne        LAB_08024d06
    Flag_GetBase 0xD8
    bne        LAB_08024ce2
    push       {r5}
    mov        r1,#0x3f
    ldr        r0,PTR_Scene_Dialogue_08024fe8
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_08024ce2:
    Flag_SetBase 0x35
    Flag_SetBase 0xD6
    Flag_SetBase 0xCB
    push       {r5}
    ldr        r0,PTR_Scene_JackIn_08024fec
    mov        r1,#0x1
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x8
    strb       r0,[r5,#0x0]
    pop        {pc}
LAB_08024d06:
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#World_playerLocation]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x1
    beq        LAB_08024d1e
    cmp        r0,#0x2
    bne        LAB_08024d2a
LAB_08024d1e:
    push       {r5}
    ldr        r1,PTR_DAT_08024ff0
    ldr        r0,PTR_Scene_LockedPath_08024ff4
    bl         Scene_Prepare
    pop        {r5}
LAB_08024d2a:
    pop        {pc}


_ts EventHandler_School_Class_5A_F12_2
    push       {lr}
    mov        r1,#0x1
    bl         FUN_08024f0c
    push       {r5}
    Flag_GetBase 0xA4
    pop        {r5}
    beq        LAB_08024d5a
    push       {r5}
    mov        r1,#0x1
    ldr        r0,PTR_Scene_ChangeMap_08024ff8
    bl         Scene_Prepare
    pop        {r5}
    LoadMain world, r0, r0
    mov        r1,#0x13
    strb       r1,[r0,#World_storyFlag]
    mov        r0,#0x0
    strb       r0,[r5,#0x0]
    pop        {pc}
LAB_08024d5a:
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#World_playerLocation]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x1
    beq        LAB_08024d72
    cmp        r0,#0x2
    bne        LAB_08024d7e
LAB_08024d72:
    push       {r5}
    ldr        r1,PTR_DAT_08024ff0
    ldr        r0,PTR_Scene_LockedPath_08024ffc
    bl         Scene_Prepare
    pop        {r5}
LAB_08024d7e:
    pop        {pc}


_ts MapSetup_School_Class_5A_F13
    push       {lr}
    LoadMain world, r7, r7
    ldrb       r0,[r7,#World_currentSongId]
    cmp        r0,#0x4
    beq        LAB_08024d92
    mov        r0,#T_Incident_Occurrence
    bl         Sound_PlayBGM
LAB_08024d92:
    push       {r5}
    ldr        r0,PTR_BgTask_8025000
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8025004
    bl         BgTask_AddNew
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_PTR_DAT_08025008
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    Flag_GetBase 0xA7
    pop        {r5}
    beq        LAB_08024dcc
    mov        r0,#0x4
    str        r0,[r5,#0x0]
    pop        {pc}
LAB_08024dcc:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_School_Class_5A_F13
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Class_5A_F13_0_0802500c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    mov        r1,#0x1
    bl         FUN_08024f0c
    pop        {pc}
PTR_EventHandler_School_Class_5A_F13_0_08024de8:
    .word EventHandler_School_Class_5A_F13_0
    .word EventHandler_School_Class_5A_F13_1


_ts EventHandler_School_Class_5A_F13_0
    push       {lr}
    push       {r5}
    Flag_GetBase 0xA7
    pop        {r5}
    beq        LAB_08024e10
    push       {r5}
    mov        r1,#0x3
    ldr        r0,DAT_08025010
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}
LAB_08024e10:
    pop        {pc}


_nt EventHandler_School_Class_5A_F13_1
    push       {lr}
    pop        {pc}


_nt MapSetup_School_Class_5A_F14
    push       {lr}
    LoadMain world, r7, r7
    ldrb       r0,[r7,#World_currentSongId]
    cmp        r0,#0x4
    beq        LAB_08024e28
    mov        r0,#T_Incident_Occurrence
    bl         Sound_PlayBGM
LAB_08024e28:
    push       {r5}
    ldr        r0,PTR_BgTask_8025014
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8025018
    bl         BgTask_AddNew
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_PTR_DAT_0802501c
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    Flag_GetBase 0xB4
    pop        {r5}
    bne        LAB_08024e60
    mov        r0,#0x0
    b          LAB_08024e62
LAB_08024e60:
    mov        r0,#0x4
LAB_08024e62:
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_School_Class_5A_F14
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Class_5A_F14_0_08025020
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    mov        r1,#0x1
    bl         FUN_08024f0c
    pop        {pc}
PTR_EventHandler_School_Class_5A_F14_0_08024e7c:
    .word EventHandler_School_Class_5A_F14_0
    .word EventHandler_School_Class_5A_F14_1


_ts EventHandler_School_Class_5A_F14_0
    push       {lr}
    push       {r5}
    Flag_GetBase 0xAD
    pop        {r5}
    beq        LAB_08024ea2
    push       {r5}
    mov        r1,#0x7
    ldr        r0,DAT_08025024
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08024ea2:
    pop        {pc}


_ts EventHandler_School_Class_5A_F14_1
    push       {lr}
    pop        {pc}


_ts MapSetup_School_Class_5A_F15
    push       {lr}
    LoadMain world, r7, r7
    ldrb       r0,[r7,#World_currentSongId]
    cmp        r0,#0x4
    beq        LAB_08024eba
    mov        r0,#T_Incident_Occurrence
    bl         Sound_PlayBGM
LAB_08024eba:
    push       {r5}
    ldr        r0,PTR_BgTask_8025028
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_802502C
    bl         BgTask_AddNew
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_PTR_DAT_08024ee8
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}
PTR_PTR_DAT_08024ee8:
    .word NPCList_8028D78


_ts EventHandler_School_Class_5A_F15
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Class_5A_F15_0_08025030
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    mov        r1,#0x1
    bl         FUN_08024f0c
    pop        {pc}

    .align 2, 0

PTR_EventHandler_School_Class_5A_F15_0_08024f04:
    .word EventHandler_School_Class_5A_F15_0


_ts EventHandler_School_Class_5A_F15_0
    push       {lr}
    pop        {pc}


_ts FUN_08024f0c
    push       {lr}
    push       {r1}
    bl         Scene_IsSceneActive
    tst        r0,r0
    beq        LAB_08024f1c
    pop        {r1}
    pop        {pc}
LAB_08024f1c:
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#World_playerLocation]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x40
    beq        LAB_08024f38
    cmp        r0,#0x41
    beq        LAB_08024f38
    pop        {r1}
    pop        {pc}
LAB_08024f38:
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08024f78
    LoadMain input, r0, r0
    ldrh       r0,[r0,#Input_toggleKeyState]
    ldr        r1,DAT_08024fe4
    and        r1,r0
    beq        LAB_08024f78
    bl         dummy_187a0
    bne        LAB_08024f78
    Flag_GetBase 0x35
    bne        LAB_08024f78
    Flag_SetBase 0x35
    Flag_SetBase 0xD6
    pop        {r1}
    push       {r5}
    ldr        r0,PTR_Scene_JackIn_08025034
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_08024f78:
    pop        {r1}
    pop        {pc}


_ts EventHandler_School_Class_5A_F10_1_CheckEveryoneTalk
    push       {lr}
    Flag_GetBase 0x95
    bne        LAB_08024fcc
    Flag_GetBase 0xCC
    beq        LAB_08024fcc
    Flag_GetBase 0xCD
    beq        LAB_08024fcc
    Flag_GetBase 0xCE
    beq        LAB_08024fcc
    Flag_GetBase 0xCF
    beq        LAB_08024fcc
    Flag_GetBase 0xD0
    beq        LAB_08024fcc
    Flag_GetBase 0xD1
    beq        LAB_08024fcc
    Flag_GetBase 0xD2
    beq        LAB_08024fcc
    Flag_GetBase 0xD3
    beq        LAB_08024fcc
    Flag_SetBase 0x95
LAB_08024fcc:
    pop        {pc}

    .align 2, 0

PTR_BgTask_8024FD0:
    .word BgTask_School_TilesetBlackboardEvent
PTR_BgTask_8024FD4:
    .word BgTask_School_PaletteBlackboardOn
PTR_DAT_08024fd8:
    .word NPCList_8028D24
PTR_PTR_EventHandler_School_Class_5A_F12_0_08024fdc:
    .word PTR_EventHandler_School_Class_5A_F12_0_08024c78
PTR_Scene_Story_14_08024fe0:
    .word Scene_Story_14
DAT_08024fe4:
    .word 0x100
PTR_Scene_Dialogue_08024fe8:
    .word Scene_Dialogue
PTR_Scene_JackIn_08024fec:
    .word Scene_JackIn
PTR_DAT_08024ff0:
    .word 0x3507
PTR_Scene_LockedPath_08024ff4:
    .word Scene_LockedPath
PTR_Scene_ChangeMap_08024ff8:
    .word Scene_ChangeMap
PTR_Scene_LockedPath_08024ffc:
    .word Scene_LockedPath
PTR_BgTask_8025000:
    .word BgTask_School_TilesetBlackboardEvent
PTR_BgTask_8025004:
    .word BgTask_School_PaletteBlackboardOn
PTR_PTR_DAT_08025008:
    .word NPCList_8028D48
PTR_PTR_EventHandler_School_Class_5A_F13_0_0802500c:
    .word PTR_EventHandler_School_Class_5A_F13_0_08024de8
DAT_08025010:
    .word Scene_ChangeMap
PTR_BgTask_8025014:
    .word BgTask_School_TilesetBlackboardEvent
PTR_BgTask_8025018:
    .word BgTask_School_PaletteBlackboardOn
PTR_PTR_DAT_0802501c:
    .word NPCList_8028D64
PTR_PTR_EventHandler_School_Class_5A_F14_0_08025020:
    .word PTR_EventHandler_School_Class_5A_F14_0_08024e7c
DAT_08025024:
    .word Scene_ChangeMap
PTR_BgTask_8025028:
    .word BgTask_School_TilesetBlackboardEvent
PTR_BgTask_802502C:
    .word BgTask_School_PaletteBlackboardOn
PTR_PTR_EventHandler_School_Class_5A_F15_0_08025030:
    .word PTR_EventHandler_School_Class_5A_F15_0_08024f04
PTR_Scene_JackIn_08025034:
    .word Scene_JackIn


_ts MapSetup_School_Class_5A_S2
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_School_Class_5A_F20_08025418
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_ARRAY_0802541c
    bl         Entity_AllocList
    pop        {r5}
    Flag_GetBase 0xAB
    beq        LAB_08025060
    push       {r5}
    mov        r0,#T_Incident_Occurrence
    bl         Sound_PlayBGM
    pop        {r5}
    b          LAB_08025078
LAB_08025060:
    Flag_GetBase 0xDF
    beq        LAB_08025074
    push       {r5}
    mov        r0,#T_Suspicious_Mood
    bl         Sound_PlayBGM
    pop        {r5}
    b          LAB_08025078
LAB_08025074:
    bl         Sound_AreaSongChange
LAB_08025078:
    pop        {pc}

    .align 2, 0

PTR_MapSetup_School_Class_5A_F20_0802507c:
    .word MapSetup_School_Class_5A_F20
    .word MapSetup_School_Class_5A_F21
    .word MapSetup_School_Class_5A_F22
    .word MapSetup_School_Class_5A_F23
    .word MapSetup_School_Class_5A_F24
    .word MapSetup_School_Class_5A_F25
    .word MapSetup_School_Class_5A_F25
    .word MapSetup_School_Class_5A_F25


_ts EventHandler_School_Class_5A_S2
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Class_5A_F20_08025420
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_Class_5A_F20_080250a8:
    .word EventHandler_School_Class_5A_F20
    .word EventHandler_School_Class_5A_F21
    .word EventHandler_School_Class_5A_F22
    .word EventHandler_School_Class_5A_F23
    .word EventHandler_School_Class_5A_F24
    .word EventHandler_School_Class_5A_F25
    .word EventHandler_School_Class_5A_F25
    .word EventHandler_School_Class_5A_F25


_ts MapSetup_School_Class_5A_F20
    push       {lr}
    push       {r5}
    ldr        r0,PTR_BgTask_8025424
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8025428
    bl         BgTask_AddNew
    ldr        r7,DAT_0802542c
    bl         Map_LoadNPCList
    pop        {r5}
    Flag_GetBase 0x90
    bne        LAB_08025118
    push       {r5}
    LoadMain world, r7, r7
    ldr        r0,DAT_08025430
    str        r0,[r7,#World_savedPos_x]
    ldr        r0,DAT_08025434
    str        r0,[r7,#World_savedPos_y]
    mov        r0,#0x0
    str        r0,[r7,#World_savedPos_z]
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_Scene_Story_1D_08025438
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_0802514a
LAB_08025118:
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    Flag_GetBase 0x44
    bne        LAB_0802514a
    push       {r5}
    Flag_GetBase 0x2B
    pop        {r5}
    beq        LAB_0802514a
    push       {r5}
    ldr        r0,DAT_0802543c
    mov        r1,#0x2
    bl         Scene_Prepare
    pop        {r5}
LAB_0802514a:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_School_Class_5A_F20
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Class_5A_F20_0_08025440
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    mov        r1,#0x1
    bl         CheckJackIn_2
    pop        {pc}

    .align 2, 0

PTR_EventHandler_School_Class_5A_F20_0_08025168:
    .word EventHandler_School_Class_5A_F20_0


_ts EventHandler_School_Class_5A_F20_0
    push       {lr}
    Flag_GetBase 0x44
    bne        LAB_0802518a
    Flag_GetBase 0x2B
    beq        LAB_0802518a
    push       {r5}
    ldr        r0,DAT_08025444
    mov        r1,#0x3
    bl         Scene_Prepare
    pop        {r5}
LAB_0802518a:
    pop        {pc}


_ts MapSetup_School_Class_5A_F21
    push       {lr}
    push       {r5}
    ldr        r0,PTR_BgTask_8025448
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_802544C
    bl         BgTask_AddNew
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_DAT_08025450
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_School_Class_5A_F21
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Class_5A_F21_0_08025454
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    mov        r1,#0x1
    bl         CheckJackIn_2
    pop        {pc}

    .align 2, 0

PTR_EventHandler_School_Class_5A_F21_0_080251d8:
    .word EventHandler_School_Class_5A_F21_0


_ts EventHandler_School_Class_5A_F21_0
    push       {lr}
    pop        {pc}


_ts MapSetup_School_Class_5A_F22
    push       {lr}
    push       {r5}
    ldr        r0,PTR_BgTask_8025458
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_802545C
    bl         BgTask_AddNew
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_DAT_08025460
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_School_Class_5A_F22
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Class_5A_F22_0_08025464
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    mov        r1,#0x1
    bl         CheckJackIn_2
    pop        {pc}

    .align 2, 0

PTR_EventHandler_School_Class_5A_F22_0_0802522c:
    .word EventHandler_School_Class_5A_F22_0


_ts EventHandler_School_Class_5A_F22_0
    push       {lr}
    pop        {pc}


_ts MapSetup_School_Class_5A_F23
    push       {lr}
    push       {r5}
    ldr        r0,PTR_BgTask_8025468
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_802546C
    bl         BgTask_AddNew
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_PTR_DAT_08025470
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    Flag_GetBase 0x2B
    pop        {r5}
    beq        LAB_0802527a
    push       {r5}
    ldr        r0,PTR_Scene_AfterFixedBattle_08025474
    mov        r1,#0x12
    bl         Scene_Prepare
    pop        {r5}
LAB_0802527a:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_School_Class_5A_F23
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Class_5A_F23_0_08025478
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    mov        r1,#0x1
    bl         CheckJackIn_2
    pop        {pc}

    .align 2, 0

PTR_EventHandler_School_Class_5A_F23_0_08025298:
    .word EventHandler_School_Class_5A_F23_0


_ts EventHandler_School_Class_5A_F23_0
    push       {lr}
    Flag_GetBase 0x2B
    beq        LAB_080252b4
    push       {r5}
    ldr        r0,DAT_0802547c
    mov        r1,#0x14
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_080252b4:
    Flag_GetBase 0xC8
    beq        LAB_080252cc
    push       {r5}
    Flag_ClearBase 0xC8
    mov        r0,#0x14
    bl         Sound_StopBGM
    pop        {r5}
LAB_080252cc:
    Flag_GetBase 0xA7
    beq        LAB_080252ee
    Flag_GetBase 0xA8
    bne        LAB_080252ee
    push       {r5}
    mov        r0,#0x14
    bl         Sound_ForcePlayBGM
    ldr        r0,PTR_Scene_Story_25_08025480
    mov        r1,#0x3
    bl         Scene_Prepare
    pop        {r5}
LAB_080252ee:
    pop        {pc}


_ts MapSetup_School_Class_5A_F24
    push       {lr}
    push       {r5}
    ldr        r0,PTR_BgTask_8025484
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8025488
    bl         BgTask_AddNew
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_PTR_DAT_0802548c
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    Flag_GetBase 0x2B
    pop        {r5}
    beq        LAB_08025336
    push       {r5}
    ldr        r0,PTR_Scene_AfterFixedBattle_08025490
    mov        r1,#0x12
    bl         Scene_Prepare
    pop        {r5}
LAB_08025336:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_School_Class_5A_F24
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Class_5A_F24_0_08025494
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    mov        r1,#0x1
    bl         CheckJackIn_2
    pop        {pc}

    .align 2, 0

PTR_EventHandler_School_Class_5A_F24_0_08025354:
    .word EventHandler_School_Class_5A_F24_0


_ts EventHandler_School_Class_5A_F24_0
    push       {lr}
    Flag_GetBase 0x2B
    beq        LAB_08025370
    push       {r5}
    ldr        r0,DAT_08025498
    mov        r1,#0x14
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_08025370:
    pop        {pc}


_nt MapSetup_School_Class_5A_F25
    push       {lr}
    push       {r5}
    ldr        r0,PTR_BgTask_802549C
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_80254A0
    bl         BgTask_AddNew
    pop        {r5}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_School_Class_5A_F25
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Class_5A_F25_0_080254a4
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    mov        r1,#0x1
    bl         CheckJackIn_2
    pop        {pc}

    .align 2, 0

PTR_EventHandler_School_Class_5A_F25_0_080253b4:
    .word EventHandler_School_Class_5A_F25_0


_ts EventHandler_School_Class_5A_F25_0
    push       {lr}
    pop        {pc}


_ts CheckJackIn_2
    push       {lr}
    push       {r1}
    bl         Scene_IsSceneActive
    tst        r0,r0
    beq        LAB_080253cc
    pop        {r1}
    pop        {pc}
LAB_080253cc:
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#World_playerLocation]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x40
    beq        LAB_080253e8
    cmp        r0,#0x41
    beq        LAB_080253e8
    pop        {r1}
    pop        {pc}
LAB_080253e8:
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08025414
    LoadMain input, r0, r0
    ldrh       r0,[r0,#Input_toggleKeyState]
    ldr        r1,DAT_080254a8
    and        r1,r0
    beq        LAB_08025414
    bl         dummy_187a0
    bne        LAB_08025414
    pop        {r1}
    push       {r5}
    ldr        r0,PTR_Scene_JackIn_080254ac
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_08025414:
    pop        {r1}
    pop        {pc}
PTR_PTR_MapSetup_School_Class_5A_F20_08025418:
    .word PTR_MapSetup_School_Class_5A_F20_0802507c
PTR_EntityAllocParams_ARRAY_0802541c:
    .word EntityAllocParams_8029B18
PTR_PTR_EventHandler_School_Class_5A_F20_08025420:
    .word PTR_EventHandler_School_Class_5A_F20_080250a8
PTR_BgTask_8025424:
    .word BgTask_School_TilesetBlackboardTriangle
PTR_BgTask_8025428:
    .word BgTask_School_PaletteBlackboardOn_2
DAT_0802542c:
    .word NPCList_8029034
DAT_08025430:
    .word 0xA0000
DAT_08025434:
    .word 0xFFDE0000
PTR_Scene_Story_1D_08025438:
    .word Scene_Story_1D
DAT_0802543c:
    .word Scene_AfterFixedBattle
PTR_PTR_EventHandler_School_Class_5A_F20_0_08025440:
    .word PTR_EventHandler_School_Class_5A_F20_0_08025168
DAT_08025444:
    .word Scene_StartFixedBattle
PTR_BgTask_8025448:
    .word BgTask_School_TilesetBlackboardTriangle
PTR_BgTask_802544C:
    .word BgTask_School_PaletteBlackboardOn_2
PTR_DAT_08025450:
    .word NPCList_80290BC
PTR_PTR_EventHandler_School_Class_5A_F21_0_08025454:
    .word PTR_EventHandler_School_Class_5A_F21_0_080251d8
PTR_BgTask_8025458:
    .word BgTask_School_TilesetBlackboardTriangle
PTR_BgTask_802545C:
    .word BgTask_School_PaletteBlackboardOn_2
PTR_DAT_08025460:
    .word NPCList_80290BC
PTR_PTR_EventHandler_School_Class_5A_F22_0_08025464:
    .word PTR_EventHandler_School_Class_5A_F22_0_0802522c
PTR_BgTask_8025468:
    .word BgTask_School_TilesetBlackboardTriangle
PTR_BgTask_802546C:
    .word BgTask_School_PaletteBlackboardOn_2
PTR_PTR_DAT_08025470:
    .word NPCList_80290E0
PTR_Scene_AfterFixedBattle_08025474:
    .word Scene_AfterFixedBattle
PTR_PTR_EventHandler_School_Class_5A_F23_0_08025478:
    .word PTR_EventHandler_School_Class_5A_F23_0_08025298
DAT_0802547c:
    .word Scene_StartFixedBattle
PTR_Scene_Story_25_08025480:
    .word Scene_Story_25
PTR_BgTask_8025484:
    .word BgTask_School_TilesetBlackboardTriangle
PTR_BgTask_8025488:
    .word BgTask_School_PaletteBlackboardOn_2
PTR_PTR_DAT_0802548c:
    .word NPCList_80292BC
PTR_Scene_AfterFixedBattle_08025490:
    .word Scene_AfterFixedBattle
PTR_PTR_EventHandler_School_Class_5A_F24_0_08025494:
    .word PTR_EventHandler_School_Class_5A_F24_0_08025354
DAT_08025498:
    .word Scene_StartFixedBattle
PTR_BgTask_802549C:
    .word BgTask_School_TilesetBlackboardTriangle
PTR_BgTask_80254A0:
    .word BgTask_School_PaletteBlackboardOn_2
PTR_PTR_EventHandler_School_Class_5A_F25_0_080254a4:
    .word PTR_EventHandler_School_Class_5A_F25_0_080253b4
DAT_080254a8:
    .word 0x100
PTR_Scene_JackIn_080254ac:
    .word Scene_JackIn


_ts MapSetup_School_Class_5A_S3
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_School_Class_5A_F30_0802555c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_ARRAY_08025560
    bl         Entity_AllocList
    pop        {r5}
    bl         Sound_AreaSongChange
    pop        {pc}

    .align 2, 0

PTR_MapSetup_School_Class_5A_F30_080254cc:
    .word MapSetup_School_Class_5A_F30
    .word MapSetup_School_Class_5A_F30
    .word MapSetup_School_Class_5A_F30
    .word MapSetup_School_Class_5A_F30
    .word MapSetup_School_Class_5A_F30
    .word MapSetup_School_Class_5A_F30
    .word MapSetup_School_Class_5A_F30
    .word MapSetup_School_Class_5A_F30


_ts EventHandler_School_Class_5A_S3
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Class_5A_F30_08025564
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_Class_5A_F30_080254f8:
    .word EventHandler_School_Class_5A_F30
    .word EventHandler_School_Class_5A_F30
    .word EventHandler_School_Class_5A_F30
    .word EventHandler_School_Class_5A_F30
    .word EventHandler_School_Class_5A_F30
    .word EventHandler_School_Class_5A_F30
    .word EventHandler_School_Class_5A_F30
    .word EventHandler_School_Class_5A_F30


_ts MapSetup_School_Class_5A_F30
    push       {lr}
    push       {r5}
    ldr        r0,PTR_BgTask_8025568
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_802556C
    bl         BgTask_AddNew
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_School_Class_5A_F30
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Class_5A_F30_0_08025570
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    mov        r1,#0x1
    bl         CheckJackIn_2
    pop        {pc}
PTR_EventHandler_School_Class_5A_F30_0_08025554:
    .word EventHandler_School_Class_5A_F30_0


_ts EventHandler_School_Class_5A_F30_0
    push       {lr}
    pop        {pc}
PTR_PTR_MapSetup_School_Class_5A_F30_0802555c:
    .word PTR_MapSetup_School_Class_5A_F30_080254cc
PTR_EntityAllocParams_ARRAY_08025560:
    .word EntityAllocParams_8029B18
PTR_PTR_EventHandler_School_Class_5A_F30_08025564:
    .word PTR_EventHandler_School_Class_5A_F30_080254f8
PTR_BgTask_8025568:
    .word BgTask_School_TilesetBlackboardTriangle
PTR_BgTask_802556C:
    .word BgTask_School_PaletteBlackboardOn_2
PTR_PTR_EventHandler_School_Class_5A_F30_0_08025570:
    .word PTR_EventHandler_School_Class_5A_F30_0_08025554
