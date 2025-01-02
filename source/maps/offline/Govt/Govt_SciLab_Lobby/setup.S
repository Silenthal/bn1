#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_Govt_SciLab_Lobby_S2
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_Default_080330d0
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_80330D4
    bl         BgTask_AddNew
    ldr        r0,PTR_EntityAllocParams_8035C70_080330d8
    bl         Entity_AllocList
    pop        {r5}
    Flag_GetBase 0xAB
    beq        LAB_08032efa
    push       {r5}
    mov        r0,#0x4
    bl         Sound_ChangeSong
    pop        {r5}
    b          LAB_08032f12
LAB_08032efa:
    Flag_GetBase 0xDF
    beq        LAB_08032f0e
    push       {r5}
    mov        r0,#0x3
    bl         Sound_ChangeSong
    pop        {r5}
    b          LAB_08032f12
LAB_08032f0e:
    bl         Sound_AreaSongChange
LAB_08032f12:
    pop        {pc}

PTR_MapSetup_Default_08032f14:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Govt_SciLab_Lobby_F22
    .word MapSetup_Govt_SciLab_Lobby_F22
    .word MapSetup_Govt_SciLab_Lobby_F24
    .word MapSetup_Govt_SciLab_Lobby_F25
    .word MapSetup_Govt_SciLab_Lobby_F25
    .word MapSetup_Govt_SciLab_Lobby_F25


_ts EventHandler_Govt_SciLab_Lobby_S2
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Default_080330dc
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r0,#0x40
    mov        r1,#0x25
    bl         CheckForJackIn
    pop        {pc}

PTR_EventHandler_Default_08032f48:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Govt_SciLab_Lobby_F22
    .word EventHandler_Govt_SciLab_Lobby_F22
    .word EventHandler_Govt_SciLab_Lobby_F24
    .word EventHandler_Govt_SciLab_Lobby_F25
    .word EventHandler_Govt_SciLab_Lobby_F25
    .word EventHandler_Govt_SciLab_Lobby_F25


_ts MapSetup_Govt_SciLab_Lobby_F22
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_8035C70_080330e0
    bl         Entity_AllocList
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_803549C_080330e4
    bl         Map_LoadNPCList
    pop        {r5}
    Flag_SetGate F_GATE_01
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Govt_SciLab_Lobby_F22
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_SciLab_Lobby_F22_0_080330e8
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    bl         EventHandler_Govt_SciLab_Lobby_F22_HandleExits
    pop        {pc}

PTR_EventHandler_Govt_SciLab_Lobby_F22_0_08032fb0:
    .word EventHandler_Govt_SciLab_Lobby_F22_0


_ts EventHandler_Govt_SciLab_Lobby_F22_0
    push       {lr}
    pop        {pc}


_ts MapSetup_Govt_SciLab_Lobby_F24
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_8035C70_080330ec
    bl         Entity_AllocList
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_803549C_080330f0
    bl         Map_LoadNPCList
    pop        {r5}
    Flag_SetGate F_GATE_01
    Flag_SetBase 0xE0
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_Govt_SciLab_Lobby_F24
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_SciLab_Lobby_F24_0_080330f4
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    bl         EventHandler_Govt_SciLab_Lobby_F22_HandleExits
    pop        {pc}

    .align 2, 0

PTR_EventHandler_Govt_SciLab_Lobby_F24_0_08033008:
    .word EventHandler_Govt_SciLab_Lobby_F24_0


_ts EventHandler_Govt_SciLab_Lobby_F24_0
    push       {lr}
    pop        {pc}


_ts MapSetup_Govt_SciLab_Lobby_F25
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_8035C70_080330f8
    bl         Entity_AllocList
    pop        {r5}
    Flag_SetGate F_GATE_01
    push       {r5}
    ldr        r7,PTR_NPCList_8035594_080330fc
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Govt_SciLab_Lobby_F25
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_SciLab_Lobby_F25_0_08033100
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    bl         EventHandler_Govt_SciLab_Lobby_F22_HandleExits
    pop        {pc}

PTR_EventHandler_Govt_SciLab_Lobby_F25_0_08033058:
    .word EventHandler_Govt_SciLab_Lobby_F25_0


_ts EventHandler_Govt_SciLab_Lobby_F25_0
    push       {lr}
    pop        {pc}


_ts EventHandler_Govt_SciLab_Lobby_F22_HandleExits
    push       {lr}
    bl         Scene_IsSceneActive
    tst        r0,r0
    bne        LAB_080330cc
    LoadMain world, r0, r7
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x20
    bne        LAB_080330a6
    Flag_GetBase 0xE0
    bne        LAB_08033092
    mov        r0,#0x4
    bl         KeyItem_IsPresent
    bne        LAB_08033092
    push       {r5}
    ldr        r0,PTR_Scene_Dialogue_08033104
    mov        r1,#0x4
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_080330cc
LAB_08033092:
    Flag_SetBase 0xD7
    push       {r5}
    ldr        r0,PTR_Scene_ChangeMap_08033108
    mov        r1,#0xe
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_080330a6:
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_080330cc
    push       {r5}
    mov        r1,#0xc
    lsl        r1,r1,#0x8
    mov        r0,#0x3
    orr        r1,r0
    ldr        r0,PTR_Scene_LockedPath_0803310c
    bl         Scene_Prepare
    pop        {r5}
LAB_080330cc:
    pop        {pc}

    .align 2, 0

PTR_PTR_MapSetup_Default_080330d0:
    .word PTR_MapSetup_Default_08032f14

PTR_BgTask_80330D4:
    .word BgTask_80311F0

PTR_EntityAllocParams_8035C70_080330d8:
    .word EntityAllocParams_8035C70

PTR_PTR_EventHandler_Default_080330dc:
    .word PTR_EventHandler_Default_08032f48

PTR_EntityAllocParams_8035C70_080330e0:
    .word EntityAllocParams_8035C70

PTR_NPCList_803549C_080330e4:
    .word NPCList_803549C

PTR_PTR_EventHandler_Govt_SciLab_Lobby_F22_0_080330e8:
    .word PTR_EventHandler_Govt_SciLab_Lobby_F22_0_08032fb0

PTR_EntityAllocParams_8035C70_080330ec:
    .word EntityAllocParams_8035C70

PTR_NPCList_803549C_080330f0:
    .word NPCList_803549C

PTR_PTR_EventHandler_Govt_SciLab_Lobby_F24_0_080330f4:
    .word PTR_EventHandler_Govt_SciLab_Lobby_F24_0_08033008

PTR_EntityAllocParams_8035C70_080330f8:
    .word EntityAllocParams_8035C70

PTR_NPCList_8035594_080330fc:
    .word NPCList_8035594

PTR_PTR_EventHandler_Govt_SciLab_Lobby_F25_0_08033100:
    .word PTR_EventHandler_Govt_SciLab_Lobby_F25_0_08033058

PTR_Scene_Dialogue_08033104:
    .word Scene_Dialogue

PTR_Scene_ChangeMap_08033108:
    .word Scene_ChangeMap

PTR_Scene_LockedPath_0803310c:
    .word Scene_LockedPath


_ts MapSetup_Govt_SciLab_Lobby_S3
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_Govt_SciLab_Lobby_F30_08033234
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_8033238
    bl         BgTask_AddNew
    ldr        r0,PTR_EntityAllocParams_8035C70_0803323c
    bl         Entity_AllocList
    pop        {r5}
    bl         Sound_AreaSongChange
    pop        {pc}

PTR_MapSetup_Govt_SciLab_Lobby_F30_08033130:
    .word MapSetup_Govt_SciLab_Lobby_F30
    .word MapSetup_Govt_SciLab_Lobby_F30
    .word MapSetup_Govt_SciLab_Lobby_F30
    .word MapSetup_Govt_SciLab_Lobby_F30
    .word MapSetup_Govt_SciLab_Lobby_F30
    .word MapSetup_Govt_SciLab_Lobby_F30
    .word MapSetup_Govt_SciLab_Lobby_F30
    .word MapSetup_Govt_SciLab_Lobby_F30


_ts EventHandler_Govt_SciLab_Lobby_S3
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_SciLab_Lobby_F30_08033240
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r0,#0x40
    mov        r1,#0x25
    bl         CheckForJackIn
    pop        {pc}

PTR_EventHandler_Govt_SciLab_Lobby_F30_08033164:
    .word EventHandler_Govt_SciLab_Lobby_F30
    .word EventHandler_Govt_SciLab_Lobby_F30
    .word EventHandler_Govt_SciLab_Lobby_F30
    .word EventHandler_Govt_SciLab_Lobby_F30
    .word EventHandler_Govt_SciLab_Lobby_F30
    .word EventHandler_Govt_SciLab_Lobby_F30
    .word EventHandler_Govt_SciLab_Lobby_F30
    .word EventHandler_Govt_SciLab_Lobby_F30


_ts MapSetup_Govt_SciLab_Lobby_F30
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_8035C70_08033244
    bl         Entity_AllocList
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_803549C_08033248
    bl         Map_LoadNPCList
    pop        {r5}
    Flag_SetGate F_GATE_01
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Govt_SciLab_Lobby_F30
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_SciLab_Lobby_F30_0_0803324c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    bl         EventHandler_Govt_SciLab_Lobby_F30_HandleExits
    pop        {pc}

PTR_EventHandler_Govt_SciLab_Lobby_F30_0_080331cc:
    .word EventHandler_Govt_SciLab_Lobby_F30_0


_ts EventHandler_Govt_SciLab_Lobby_F30_0
    push       {lr}
    pop        {pc}


_ts EventHandler_Govt_SciLab_Lobby_F30_HandleExits
    push       {lr}
    bl         Scene_IsSceneActive
    tst        r0,r0
    bne        LAB_08033232
    LoadMain world, r0, r7
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x20
    bne        LAB_0803320c
    mov        r0,#0x4
    bl         KeyItem_IsPresent
    bne        LAB_080331fe
    push       {r5}
    ldr        r0,PTR_Scene_Dialogue_08033250
    mov        r1,#0x4
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_08033232
LAB_080331fe:
    push       {r5}
    ldr        r0,PTR_Scene_ChangeMap_08033254
    mov        r1,#0xe
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0803320c:
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_08033232
    push       {r5}
    mov        r1,#0xc
    lsl        r1,r1,#0x8
    mov        r0,#0x3
    orr        r1,r0
    ldr        r0,PTR_Scene_LockedPath_08033258
    bl         Scene_Prepare
    pop        {r5}
LAB_08033232:
    pop        {pc}

PTR_PTR_MapSetup_Govt_SciLab_Lobby_F30_08033234:
    .word PTR_MapSetup_Govt_SciLab_Lobby_F30_08033130

PTR_BgTask_8033238:
    .word BgTask_80311F0

PTR_EntityAllocParams_8035C70_0803323c:
    .word EntityAllocParams_8035C70

PTR_PTR_EventHandler_Govt_SciLab_Lobby_F30_08033240:
    .word PTR_EventHandler_Govt_SciLab_Lobby_F30_08033164

PTR_EntityAllocParams_8035C70_08033244:
    .word EntityAllocParams_8035C70

PTR_NPCList_803549C_08033248:
    .word NPCList_803549C

PTR_PTR_EventHandler_Govt_SciLab_Lobby_F30_0_0803324c:
    .word PTR_EventHandler_Govt_SciLab_Lobby_F30_0_080331cc

PTR_Scene_Dialogue_08033250:
    .word Scene_Dialogue

PTR_Scene_ChangeMap_08033254:
    .word Scene_ChangeMap

PTR_Scene_LockedPath_08033258:
    .word Scene_LockedPath


_ts MapSetup_Govt_SciLab_Lobby_S4
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_Govt_SciLab_Lobby_F40_08033414
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_8033418
    bl         BgTask_AddNew
    ldr        r0,PTR_EntityAllocParams_8035C70_0803341c
    bl         Entity_AllocList
    pop        {r5}
    bl         Sound_AreaSongChange
    pop        {pc}

PTR_MapSetup_Govt_SciLab_Lobby_F40_0803327c:
    .word MapSetup_Govt_SciLab_Lobby_F40
    .word MapSetup_Govt_SciLab_Lobby_F40
    .word MapSetup_Govt_SciLab_Lobby_F40
    .word MapSetup_Govt_SciLab_Lobby_F40
    .word MapSetup_Govt_SciLab_Lobby_F40
    .word MapSetup_Govt_SciLab_Lobby_F40
    .word MapSetup_Govt_SciLab_Lobby_F40
    .word MapSetup_Govt_SciLab_Lobby_F40


_ts EventHandler_Govt_SciLab_Lobby_S4
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_SciLab_Lobby_F40_08033420
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r0,#0x40
    mov        r1,#0x25
    bl         CheckForJackIn
    pop        {pc}

PTR_EventHandler_Govt_SciLab_Lobby_F40_080332b0:
    .word EventHandler_Govt_SciLab_Lobby_F40
    .word EventHandler_Govt_SciLab_Lobby_F40
    .word EventHandler_Govt_SciLab_Lobby_F40
    .word EventHandler_Govt_SciLab_Lobby_F40
    .word EventHandler_Govt_SciLab_Lobby_F40
    .word EventHandler_Govt_SciLab_Lobby_F40
    .word EventHandler_Govt_SciLab_Lobby_F40
    .word EventHandler_Govt_SciLab_Lobby_F40


_ts MapSetup_Govt_SciLab_Lobby_F40
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_8035C70_08033424
    bl         Entity_AllocList
    pop        {r5}
    Flag_GetBase 0x95
    bne        LAB_08033306
    push       {r5}
    ldr        r7,PTR_NPCList_80355BC_08033428
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    b          LAB_0803332c
LAB_08033306:
    Flag_GetBase 0x98
    bne        LAB_0803331e
    push       {r5}
    ldr        r7,PTR_NPCList_803559C_0803342c
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    b          LAB_0803332c
LAB_0803331e:
    push       {r5}
    ldr        r7,PTR_NPCList_80355BC_08033430
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x4
    str        r0,[r5,#0x0]
LAB_0803332c:
    Flag_SetGate F_GATE_01
    pop        {pc}


_ts EventHandler_Govt_SciLab_Lobby_F40
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_SciLab_Lobby_F40_0_08033434
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    bl         EventHandler_Govt_SciLab_Lobby_F40_HandleExits
    pop        {pc}

PTR_EventHandler_Govt_SciLab_Lobby_F40_0_08033348:
    .word EventHandler_Govt_SciLab_Lobby_F40_0
    .word EventHandler_Govt_SciLab_Lobby_F40_1
    .word EventHandler_Govt_SciLab_Lobby_F40_2


_ts EventHandler_Govt_SciLab_Lobby_F40_0
    push       {lr}
    Flag_GetBase 0x97
    beq        LAB_08033376
    Flag_GetBase 0x98
    bne        LAB_08033376
    push       {r5}
    ldr        r0,PTR_Scene_Story_50_08033438
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08033376:
    pop        {pc}


_ts EventHandler_Govt_SciLab_Lobby_F40_1
    push       {lr}
    Flag_GetBase 0x9B
    beq        LAB_080333ae
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x10
    bne        LAB_080333ae
    Flag_GetBase 0x9C
    bne        LAB_080333ae
    push       {r5}
    ldr        r0,PTR_Scene_Story_51_0803343c
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x8
    strb       r0,[r5,#0x0]
LAB_080333ae:
    pop        {pc}


_ts EventHandler_Govt_SciLab_Lobby_F40_2
    push       {lr}
    pop        {pc}


_ts EventHandler_Govt_SciLab_Lobby_F40_HandleExits
    push       {lr}
    bl         Scene_IsSceneActive
    tst        r0,r0
    bne        LAB_08033412
    LoadMain world, r0, r7
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x20
    bne        LAB_080333ec
    Flag_GetBase 0x9C
    beq        LAB_080333de
    push       {r5}
    ldr        r0,PTR_Scene_GovtElevator_08033440
    mov        r1,#0x3d
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_080333de:
    push       {r5}
    ldr        r0,PTR_Scene_ChangeMap_08033444
    mov        r1,#0xe
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_080333ec:
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_08033412
    push       {r5}
    mov        r1,#0xc
    lsl        r1,r1,#0x8
    mov        r0,#0x3
    orr        r1,r0
    ldr        r0,PTR_Scene_LockedPath_08033448
    bl         Scene_Prepare
    pop        {r5}
LAB_08033412:
    pop        {pc}

PTR_PTR_MapSetup_Govt_SciLab_Lobby_F40_08033414:
    .word PTR_MapSetup_Govt_SciLab_Lobby_F40_0803327c

PTR_BgTask_8033418:
    .word BgTask_80311F0

PTR_EntityAllocParams_8035C70_0803341c:
    .word EntityAllocParams_8035C70

PTR_PTR_EventHandler_Govt_SciLab_Lobby_F40_08033420:
    .word PTR_EventHandler_Govt_SciLab_Lobby_F40_080332b0

PTR_EntityAllocParams_8035C70_08033424:
    .word EntityAllocParams_8035C70

PTR_NPCList_80355BC_08033428:
    .word NPCList_80355BC

PTR_NPCList_803559C_0803342c:
    .word NPCList_803559C

PTR_NPCList_80355BC_08033430:
    .word NPCList_80355BC

PTR_PTR_EventHandler_Govt_SciLab_Lobby_F40_0_08033434:
    .word PTR_EventHandler_Govt_SciLab_Lobby_F40_0_08033348

PTR_Scene_Story_50_08033438:
    .word Scene_Story_50

PTR_Scene_Story_51_0803343c:
    .word Scene_Story_51

PTR_Scene_GovtElevator_08033440:
    .word Scene_GovtElevator

PTR_Scene_ChangeMap_08033444:
    .word Scene_ChangeMap

PTR_Scene_LockedPath_08033448:
    .word Scene_LockedPath


_ts MapSetup_Govt_SciLab_Lobby_S5
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_Govt_SciLab_Lobby_F50_080335b0
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_80335B4
    bl         BgTask_AddNew
    ldr        r0,PTR_EntityAllocParams_8035C70_080335b8
    bl         Entity_AllocList
    pop        {r5}
    bl         Sound_AreaSongChange
    pop        {pc}

PTR_MapSetup_Govt_SciLab_Lobby_F50_0803346c:
    .word MapSetup_Govt_SciLab_Lobby_F50
    .word MapSetup_Govt_SciLab_Lobby_F50
    .word MapSetup_Govt_SciLab_Lobby_F50
    .word MapSetup_Govt_SciLab_Lobby_F53
    .word MapSetup_Govt_SciLab_Lobby_F53
    .word MapSetup_Govt_SciLab_Lobby_F50
    .word MapSetup_Govt_SciLab_Lobby_F50
    .word MapSetup_Govt_SciLab_Lobby_F50


_ts EventHandler_Govt_SciLab_Lobby_S5
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_SciLab_Lobby_F50_080335bc
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r0,#0x40
    mov        r1,#0x25
    bl         CheckForJackIn
    pop        {pc}

PTR_EventHandler_Govt_SciLab_Lobby_F50_080334a0:
    .word EventHandler_Govt_SciLab_Lobby_F50
    .word EventHandler_Govt_SciLab_Lobby_F50
    .word EventHandler_Govt_SciLab_Lobby_F50
    .word EventHandler_Govt_SciLab_Lobby_F53
    .word EventHandler_Govt_SciLab_Lobby_F53
    .word EventHandler_Govt_SciLab_Lobby_F50
    .word EventHandler_Govt_SciLab_Lobby_F50
    .word EventHandler_Govt_SciLab_Lobby_F50


_ts MapSetup_Govt_SciLab_Lobby_F50
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_NPCList_8035730_080335c0
    bl         Map_LoadNPCList
    ldr        r0,PTR_EntityAllocParams_8035C70_080335c4
    bl         Entity_AllocList
    pop        {r5}
    Flag_SetGate F_GATE_01
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Govt_SciLab_Lobby_F50
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_SciLab_Lobby_F50_0_080335c8
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    bl         EventHandler_Govt_SciLab_Lobby_F50_HandleExits
    pop        {pc}

PTR_EventHandler_Govt_SciLab_Lobby_F50_0_08033500:
    .word EventHandler_Govt_SciLab_Lobby_F50_0


_ts EventHandler_Govt_SciLab_Lobby_F50_0
    push       {lr}
    pop        {pc}


_ts MapSetup_Govt_SciLab_Lobby_F53
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_NPCList_8035730_080335cc
    bl         Map_LoadNPCList
    ldr        r0,PTR_EntityAllocParams_8035C70_080335d0
    bl         Entity_AllocList
    pop        {r5}
    Flag_SetGate F_GATE_01
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Govt_SciLab_Lobby_F53
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_SciLab_Lobby_F53_0_080335d4
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    bl         EventHandler_Govt_SciLab_Lobby_F50_HandleExits
    pop        {pc}

PTR_EventHandler_Govt_SciLab_Lobby_F53_0_08033548:
    .word EventHandler_Govt_SciLab_Lobby_F53_0


_ts EventHandler_Govt_SciLab_Lobby_F53_0
    push       {lr}
    pop        {pc}


_ts EventHandler_Govt_SciLab_Lobby_F50_HandleExits
    push       {lr}
    bl         Scene_IsSceneActive
    tst        r0,r0
    bne        LAB_080335ae
    LoadMain world, r0, r7
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x20
    bne        LAB_08033588
    mov        r0,#0x4
    bl         KeyItem_IsPresent
    bne        LAB_0803357a
    push       {r5}
    ldr        r0,PTR_Scene_Dialogue_080335d8
    mov        r1,#0x4
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_080335ae
LAB_0803357a:
    push       {r5}
    ldr        r0,PTR_Scene_GovtElevator_080335dc
    mov        r1,#0x3d
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_08033588:
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_080335ae
    push       {r5}
    mov        r1,#0xc
    lsl        r1,r1,#0x8
    mov        r0,#0x3
    orr        r1,r0
    ldr        r0,PTR_Scene_LockedPath_080335e0
    bl         Scene_Prepare
    pop        {r5}
LAB_080335ae:
    pop        {pc}

PTR_PTR_MapSetup_Govt_SciLab_Lobby_F50_080335b0:
    .word PTR_MapSetup_Govt_SciLab_Lobby_F50_0803346c

PTR_BgTask_80335B4:
    .word BgTask_80311F0

PTR_EntityAllocParams_8035C70_080335b8:
    .word EntityAllocParams_8035C70

PTR_PTR_EventHandler_Govt_SciLab_Lobby_F50_080335bc:
    .word PTR_EventHandler_Govt_SciLab_Lobby_F50_080334a0

PTR_NPCList_8035730_080335c0:
    .word NPCList_8035730

PTR_EntityAllocParams_8035C70_080335c4:
    .word EntityAllocParams_8035C70

PTR_PTR_EventHandler_Govt_SciLab_Lobby_F50_0_080335c8:
    .word PTR_EventHandler_Govt_SciLab_Lobby_F50_0_08033500

PTR_NPCList_8035730_080335cc:
    .word NPCList_8035730

PTR_EntityAllocParams_8035C70_080335d0:
    .word EntityAllocParams_8035C70

PTR_PTR_EventHandler_Govt_SciLab_Lobby_F53_0_080335d4:
    .word PTR_EventHandler_Govt_SciLab_Lobby_F53_0_08033548

PTR_Scene_Dialogue_080335d8:
    .word Scene_Dialogue

PTR_Scene_GovtElevator_080335dc:
    .word Scene_GovtElevator

PTR_Scene_LockedPath_080335e0:
    .word Scene_LockedPath
