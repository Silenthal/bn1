#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_DenTown_Block_4_S3
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_DenTown_Block_4_F30_08038430
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_803B2A8_08038434
    bl         Entity_AllocList
    pop        {r5}
    Flag_GetBase 0xBD
    bne        LAB_08038214
    Flag_GetBase 0xA6
    beq        LAB_080381f4
    mov        r0,#T_Incident_Occurrence
    bl         Sound_ChangeSong
    b          LAB_08038218
LAB_080381f4:
    Flag_GetBase 0x9B
    beq        LAB_08038204
    mov        r0,#T_Suspicious_Mood
    bl         Sound_ChangeSong
    b          LAB_08038218
LAB_08038204:
    Flag_GetBase 0x98
    beq        LAB_08038214
    mov        r0,#T_Incident_Occurrence
    bl         Sound_ChangeSong
    b          LAB_08038218
LAB_08038214:
    bl         Sound_AreaSongChange
LAB_08038218:
    pop        {pc}

    .align 2, 0

PTR_MapSetup_DenTown_Block_4_F30_0803821c:
    .word MapSetup_DenTown_Block_4_F30
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_DenTown_Block_4_F33
    .word MapSetup_DenTown_Block_4_F34
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default


_ts EventHandler_DenTown_Block_4_S3
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_DenTown_Block_4_F30_08038438
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         FUN_080383a8
    pop        {pc}

PTR_EventHandler_DenTown_Block_4_F30_0803824c:
    .word EventHandler_DenTown_Block_4_F30
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_DenTown_Block_4_F33
    .word EventHandler_DenTown_Block_4_F34
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default


_ts MapSetup_DenTown_Block_4_F30
    push       {lr}
    push       {r5}
    bl         Traffic_Init
    pop        {r5}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_80394E4_0803843c
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_DenTown_Block_4_F30
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_DenTown_Block_4_F30_0_08038440
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    push       {r5}
    bl         Traffic_Main
    pop        {r5}
    pop        {pc}

PTR_EventHandler_DenTown_Block_4_F30_0_080382b0:
    .word EventHandler_DenTown_Block_4_F30_0


_ts EventHandler_DenTown_Block_4_F30_0
    push       {lr}
    pop        {pc}


_ts MapSetup_DenTown_Block_4_F33
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_8039554_08038444
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    strb       r0,[r5,#0x8]
    strb       r0,[r5,#0x9]
    mov        r0,#0x2
    strb       r0,[r5,#0xa]
    strb       r0,[r5,#0xb]
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_803B310_08038448
    bl         Entity_AllocList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_DenTown_Block_4_F33
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_DenTown_Block_4_F33_0_0803844c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_DenTown_Block_4_F33_0_08038304:
    .word EventHandler_DenTown_Block_4_F33_0


_ts EventHandler_DenTown_Block_4_F33_0
    push       {lr}
    pop        {pc}


_ts MapSetup_DenTown_Block_4_F34
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_8039554_08038450
    bl         Map_LoadNPCList
    pop        {r5}
    Flag_GetBase 0xAE
    bne        LAB_08038354
    LoadMain world, r0, r0
    mov        r1,#0x0
    strb       r1,[r0,#0x7]
    mov        r0,#0x0
    strb       r0,[r5,#0x8]
    strb       r0,[r5,#0x9]
    mov        r0,#0x2
    strb       r0,[r5,#0xa]
    strb       r0,[r5,#0xb]
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_803B310_08038454
    bl         Entity_AllocList
    pop        {r5}
    mov        r0,#0x0
    b          LAB_08038372
LAB_08038354:
    Flag_SetIgnore F_IGNORE_DOOR_00
    mov        r0,#0x2
    strb       r0,[r5,#0x8]
    strb       r0,[r5,#0xa]
    mov        r0,#0x0
    strb       r0,[r5,#0x9]
    strb       r0,[r5,#0xb]
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_803B310_08038458
    bl         Entity_AllocList
    pop        {r5}
    mov        r0,#0x4
LAB_08038372:
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_DenTown_Block_4_F34
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_DenTown_Block_4_F34_0_0803845c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_DenTown_Block_4_F34_0_08038388:
    .word EventHandler_DenTown_Block_4_F34_0
    .word EventHandler_DenTown_Block_4_F34_1


_ts EventHandler_DenTown_Block_4_F34_0
    push       {lr}
    push       {r5}
    ldr        r0,PTR_Scene_Story_3E_08038460
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x4
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_DenTown_Block_4_F34_1
    push       {lr}
    pop        {pc}


_ts FUN_080383a8
    push       {lr}
    bl         Scene_IsSceneActive
    tst        r0,r0
    beq        LAB_080383b4
    pop        {pc}
LAB_080383b4:
    LoadMain world, r0, r7
    ldrb       r1,[r0,#0xe]
    cmp        r1,#0x20
    bne        LAB_080383ca
    push       {r5}
    ldr        r0,PTR_Scene_Dialogue_08038464
    mov        r1,#0x3
    bl         Scene_Prepare
    pop        {r5}
LAB_080383ca:
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#0x28]
    mov        r1,#0x8
    strh       r1,[r0,#0x2e]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    LoadMain world, r7, r7
    ldr        r7,[r7,#0x28]
    mov        r1,#0x0
    strh       r1,[r7,#0x2e]
    pop        {r5}
    cmp        r0,#0x40
    bne        LAB_0803842e
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0803842e
    LoadMain input, r0, r0
    ldrh       r0,[r0,#0x2]
    ldr        r1,DAT_08038468
    and        r1,r0
    beq        LAB_0803842e
    bl         dummy_187a0
    bne        LAB_0803842e
    LoadMain world, r0, r0
    ldrb       r1,[r0,#0x6]
    cmp        r1,#0x30
    bne        LAB_08038422
    push       {r5}
    ldr        r0,PTR_Scene_Dialogue_0803846c
    mov        r1,#0x4
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_08038422:
    push       {r5}
    ldr        r0,PTR_Scene_JackIn_08038470
    mov        r1,#0xf
    bl         Scene_Prepare
    pop        {r5}
LAB_0803842e:
    pop        {pc}

PTR_PTR_MapSetup_DenTown_Block_4_F30_08038430:
    .word PTR_MapSetup_DenTown_Block_4_F30_0803821c

PTR_EntityAllocParams_803B2A8_08038434:
    .word EntityAllocParams_803B2A8

PTR_PTR_EventHandler_DenTown_Block_4_F30_08038438:
    .word PTR_EventHandler_DenTown_Block_4_F30_0803824c

PTR_NPCList_80394E4_0803843c:
    .word NPCList_80394E4

PTR_PTR_EventHandler_DenTown_Block_4_F30_0_08038440:
    .word PTR_EventHandler_DenTown_Block_4_F30_0_080382b0

PTR_NPCList_8039554_08038444:
    .word NPCList_8039554

PTR_EntityAllocParams_803B310_08038448:
    .word EntityAllocParams_803B310

PTR_PTR_EventHandler_DenTown_Block_4_F33_0_0803844c:
    .word PTR_EventHandler_DenTown_Block_4_F33_0_08038304

PTR_NPCList_8039554_08038450:
    .word NPCList_8039554

PTR_EntityAllocParams_803B310_08038454:
    .word EntityAllocParams_803B310

PTR_EntityAllocParams_803B310_08038458:
    .word EntityAllocParams_803B310

PTR_PTR_EventHandler_DenTown_Block_4_F34_0_0803845c:
    .word PTR_EventHandler_DenTown_Block_4_F34_0_08038388

PTR_Scene_Story_3E_08038460:
    .word Scene_Story_3E

PTR_Scene_Dialogue_08038464:
    .word Scene_Dialogue

DAT_08038468:
    .word 0x100

PTR_Scene_Dialogue_0803846c:
    .word Scene_Dialogue

PTR_Scene_JackIn_08038470:
    .word Scene_JackIn


_ts MapSetup_DenTown_Block_4_S4
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_DenTown_Block_4_F40_08038594
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_803B2A8_08038598
    bl         Entity_AllocList
    pop        {r5}
    bl         Traffic_Init
    bl         Sound_AreaSongChange
    pop        {pc}

    .align 2, 0

PTR_MapSetup_DenTown_Block_4_F40_08038494:
    .word MapSetup_DenTown_Block_4_F40
    .word MapSetup_DenTown_Block_4_F40
    .word MapSetup_DenTown_Block_4_F40
    .word MapSetup_DenTown_Block_4_F40
    .word MapSetup_DenTown_Block_4_F40
    .word MapSetup_DenTown_Block_4_F40
    .word MapSetup_DenTown_Block_4_F40
    .word MapSetup_DenTown_Block_4_F40


_ts EventHandler_DenTown_Block_4_S4
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_DenTown_Block_4_F40_0803859c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         FUN_08038524
    bl         Traffic_Main
    pop        {pc}

PTR_EventHandler_DenTown_Block_4_F40_080384c8:
    .word EventHandler_DenTown_Block_4_F40
    .word EventHandler_DenTown_Block_4_F40
    .word EventHandler_DenTown_Block_4_F40
    .word EventHandler_DenTown_Block_4_F40
    .word EventHandler_DenTown_Block_4_F40
    .word EventHandler_DenTown_Block_4_F40
    .word EventHandler_DenTown_Block_4_F40
    .word EventHandler_DenTown_Block_4_F40


_ts MapSetup_DenTown_Block_4_F40
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_80394E4_080385a0
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_DenTown_Block_4_F40
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_DenTown_Block_4_F40_0_080385a4
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_DenTown_Block_4_F40_0_0803851c:
    .word EventHandler_DenTown_Block_4_F40_0


_ts EventHandler_DenTown_Block_4_F40_0
    push       {lr}
    pop        {pc}


_ts FUN_08038524
    push       {lr}
    bl         Scene_IsSceneActive
    tst        r0,r0
    beq        LAB_08038530
    pop        {pc}
LAB_08038530:
    LoadMain world, r0, r7
    ldrb       r1,[r0,#0xe]
    cmp        r1,#0x20
    bne        LAB_08038546
    push       {r5}
    ldr        r0,PTR_Scene_Dialogue_080385a8
    mov        r1,#0x3
    bl         Scene_Prepare
    pop        {r5}
LAB_08038546:
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#0x28]
    mov        r1,#0x8
    strh       r1,[r0,#0x2e]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    LoadMain world, r7, r7
    ldr        r7,[r7,#0x28]
    mov        r1,#0x0
    strh       r1,[r7,#0x2e]
    pop        {r5}
    cmp        r0,#0x40
    bne        LAB_08038592
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08038592
    LoadMain input, r0, r0
    ldrh       r0,[r0,#0x2]
    ldr        r1,DAT_080385ac
    and        r1,r0
    beq        LAB_08038592
    bl         dummy_187a0
    bne        LAB_08038592
    push       {r5}
    ldr        r0,PTR_Scene_JackIn_080385b0
    mov        r1,#0xf
    bl         Scene_Prepare
    pop        {r5}
LAB_08038592:
    pop        {pc}

PTR_PTR_MapSetup_DenTown_Block_4_F40_08038594:
    .word PTR_MapSetup_DenTown_Block_4_F40_08038494

PTR_EntityAllocParams_803B2A8_08038598:
    .word EntityAllocParams_803B2A8

PTR_PTR_EventHandler_DenTown_Block_4_F40_0803859c:
    .word PTR_EventHandler_DenTown_Block_4_F40_080384c8

PTR_NPCList_80394E4_080385a0:
    .word NPCList_80394E4

PTR_PTR_EventHandler_DenTown_Block_4_F40_0_080385a4:
    .word PTR_EventHandler_DenTown_Block_4_F40_0_0803851c

PTR_Scene_Dialogue_080385a8:
    .word Scene_Dialogue

DAT_080385ac:
    .word 0x100

PTR_Scene_JackIn_080385b0:
    .word Scene_JackIn


_ts MapSetup_DenTown_Block_4_S5
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_DenTown_Block_4_F50_080386ec
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_803B2A8_080386f0
    bl         Entity_AllocList
    pop        {r5}
    bl         Traffic_Init
    bl         Sound_AreaSongChange
    pop        {pc}

    .align 2, 0

PTR_MapSetup_DenTown_Block_4_F50_080385d4:
    .word MapSetup_DenTown_Block_4_F50
    .word MapSetup_DenTown_Block_4_F50
    .word MapSetup_DenTown_Block_4_F50
    .word MapSetup_DenTown_Block_4_F50
    .word MapSetup_DenTown_Block_4_F50
    .word MapSetup_DenTown_Block_4_F50
    .word MapSetup_DenTown_Block_4_F50
    .word MapSetup_DenTown_Block_4_F50


_ts EventHandler_DenTown_Block_4_S5
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_DenTown_Block_4_F50_080386f4
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         FUN_0803867c
    bl         Traffic_Main
    pop        {pc}

PTR_EventHandler_DenTown_Block_4_F50_08038608:
    .word EventHandler_DenTown_Block_4_F50
    .word EventHandler_DenTown_Block_4_F50
    .word EventHandler_DenTown_Block_4_F50
    .word EventHandler_DenTown_Block_4_F50
    .word EventHandler_DenTown_Block_4_F50
    .word EventHandler_DenTown_Block_4_F50
    .word EventHandler_DenTown_Block_4_F50
    .word EventHandler_DenTown_Block_4_F50


_ts MapSetup_DenTown_Block_4_F50
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    LoadMain world, r7, r7
    ldrb       r0,[r7,#0x6]
    cmp        r0,#0x53
    bge        LAB_08038652
    push       {r5}
    ldr        r7,PTR_NPCList_803955C_080386f8
    bl         Map_LoadNPCList
    pop        {r5}
    b          LAB_0803865c
LAB_08038652:
    push       {r5}
    ldr        r7,PTR_NPCList_80395CC_080386fc
    bl         Map_LoadNPCList
    pop        {r5}
LAB_0803865c:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_DenTown_Block_4_F50
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_DenTown_Block_4_F50_0_08038700
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_DenTown_Block_4_F50_0_08038674:
    .word EventHandler_DenTown_Block_4_F50_0


_ts EventHandler_DenTown_Block_4_F50_0
    push       {lr}
    pop        {pc}


_ts FUN_0803867c
    push       {lr}
    bl         Scene_IsSceneActive
    tst        r0,r0
    beq        LAB_08038688
    pop        {pc}
LAB_08038688:
    LoadMain world, r0, r7
    ldrb       r1,[r0,#0xe]
    cmp        r1,#0x20
    bne        LAB_0803869e
    push       {r5}
    ldr        r0,PTR_Scene_Dialogue_08038704
    mov        r1,#0x3
    bl         Scene_Prepare
    pop        {r5}
LAB_0803869e:
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#0x28]
    mov        r1,#0x8
    strh       r1,[r0,#0x2e]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    LoadMain world, r7, r7
    ldr        r7,[r7,#0x28]
    mov        r1,#0x0
    strh       r1,[r7,#0x2e]
    pop        {r5}
    cmp        r0,#0x40
    bne        LAB_080386ea
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_080386ea
    LoadMain input, r0, r0
    ldrh       r0,[r0,#0x2]
    ldr        r1,DAT_08038708
    and        r1,r0
    beq        LAB_080386ea
    bl         dummy_187a0
    bne        LAB_080386ea
    push       {r5}
    ldr        r0,PTR_Scene_JackIn_0803870c
    mov        r1,#0xf
    bl         Scene_Prepare
    pop        {r5}
LAB_080386ea:
    pop        {pc}

PTR_PTR_MapSetup_DenTown_Block_4_F50_080386ec:
    .word PTR_MapSetup_DenTown_Block_4_F50_080385d4

PTR_EntityAllocParams_803B2A8_080386f0:
    .word EntityAllocParams_803B2A8

PTR_PTR_EventHandler_DenTown_Block_4_F50_080386f4:
    .word PTR_EventHandler_DenTown_Block_4_F50_08038608

PTR_NPCList_803955C_080386f8:
    .word NPCList_803955C

PTR_NPCList_80395CC_080386fc:
    .word NPCList_80395CC

PTR_PTR_EventHandler_DenTown_Block_4_F50_0_08038700:
    .word PTR_EventHandler_DenTown_Block_4_F50_0_08038674

PTR_Scene_Dialogue_08038704:
    .word Scene_Dialogue

DAT_08038708:
    .word 0x100

PTR_Scene_JackIn_0803870c:
    .word Scene_JackIn
