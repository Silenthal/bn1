#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_DenTown_Block_1_S3
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_DenTown_Block_1_F30_080372b8
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_803A76C_080372bc
    bl         Entity_AllocList
    pop        {r5}
    Flag_GetBase 0xBD
    bne        LAB_08036f70
    Flag_GetBase 0xA6
    beq        LAB_08036f50
    mov        r0,#T_Incident_Occurrence
    bl         Sound_PlayBGM
    b          LAB_08036f74
LAB_08036f50:
    Flag_GetBase 0x9B
    beq        LAB_08036f60
    mov        r0,#T_Suspicious_Mood
    bl         Sound_PlayBGM
    b          LAB_08036f74
LAB_08036f60:
    Flag_GetBase 0x98
    beq        LAB_08036f70
    mov        r0,#T_Incident_Occurrence
    bl         Sound_PlayBGM
    b          LAB_08036f74
LAB_08036f70:
    bl         Sound_AreaSongChange
LAB_08036f74:
    pop        {pc}

    .align 2, 0

PTR_MapSetup_DenTown_Block_1_F30_08036f78:
    .word MapSetup_DenTown_Block_1_F30
    .word MapSetup_DenTown_Block_1_F31
    .word MapSetup_DenTown_Block_1_F32
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default


_ts EventHandler_DenTown_Block_1_S3
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_DenTown_Block_1_F30_080372c0
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         FUN_0803721c
    pop        {pc}

PTR_EventHandler_DenTown_Block_1_F30_08036fa8:
    .word EventHandler_DenTown_Block_1_F30
    .word EventHandler_DenTown_Block_1_F31
    .word EventHandler_DenTown_Block_1_F32
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default


_ts MapSetup_DenTown_Block_1_F30
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
    ldr        r7,PTR_NPCList_803909C_080372c4
    bl         Map_LoadNPCList
    pop        {r5}
    Flag_GetBase 0x98
    beq        LAB_08037008
    Flag_SetGate F_GATE_00
    Flag_SetGate F_GATE_01
    mov        r0,#0x4
    str        r0,[r5,#0x0]
    pop        {pc}
LAB_08037008:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_DenTown_Block_1_F30
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_DenTown_Block_1_F30_0_080372c8
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_DenTown_Block_1_F30_0_08037020:
    .word EventHandler_DenTown_Block_1_F30_0
    .word EventHandler_DenTown_Block_1_F30_1


_ts EventHandler_DenTown_Block_1_F30_0
    push       {lr}
    push       {r5}
    bl         Traffic_Main
    pop        {r5}
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x18
    bne        LAB_08037092
    Flag_GetBase 0x95
    beq        LAB_08037092
    Flag_GetBase 0xCA
    beq        LAB_08037092
    Flag_GetBase 0x97
    beq        LAB_08037092
    Flag_GetBase 0x98
    bne        LAB_08037092
    push       {r5}
    mov        r0,#0x20
    bl         StartMenu_GetState
    pop        {r5}
    bne        LAB_08037092
    push       {r5}
    ldr        r0,PTR_Scene_Story_38_080372cc
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    LoadMain world, r0, r0
    mov        r1,#0x31
    strb       r1,[r0,#0x6]
    Flag_ClearIgnore F_IGNORE_WALL_00
    Flag_ClearIgnore F_IGNORE_WALL_01
LAB_08037092:
    pop        {pc}


_ts EventHandler_DenTown_Block_1_F30_1
    push       {lr}
    pop        {pc}


_ts MapSetup_DenTown_Block_1_F31
    push       {lr}
    Flag_ClearIgnore F_IGNORE_WALL_00
    Flag_ClearIgnore F_IGNORE_WALL_01
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_803909C_080372d0
    bl         Map_LoadNPCList
    pop        {r5}
    Flag_SetGate F_GATE_00
    Flag_SetGate F_GATE_01
    mov        r0,#0x0
    strb       r0,[r5,#0x8]
    strb       r0,[r5,#0x9]
    mov        r0,#0x2
    strb       r0,[r5,#0xa]
    strb       r0,[r5,#0xb]
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_803A3A0_080372d4
    bl         Entity_AllocList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_DenTown_Block_1_F31
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_DenTown_Block_1_F31_0_080372d8
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_DenTown_Block_1_F31_0_080370fc:
    .word EventHandler_DenTown_Block_1_F31_0
    .word EventHandler_DenTown_Block_1_F31_1


_ts EventHandler_DenTown_Block_1_F31_0
    push       {lr}
    Flag_GetEmailReceived 0x0C
    bne        LAB_0803711c
    push       {r5}
    ldr        r0,DAT_080372dc
    ldr        r1,DAT_080372e0
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0803711c:
    Flag_GetEmailUnread 0x0C
    bne        LAB_08037142
    mov        r0,#0x20
    bl         StartMenu_GetState
    bne        LAB_08037142
    Flag_GetBase 0x9A
    bne        LAB_08037142
    push       {r5}
    ldr        r0,PTR_Scene_Story_39_080372e4
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_08037142:
    Flag_GetBase 0xA7
    beq        LAB_08037156
    Flag_ClearGate F_GATE_00
    Flag_ClearGate F_GATE_01
LAB_08037156:
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x1
    beq        LAB_0803716e
    cmp        r0,#0x2
    bne        LAB_0803717a
LAB_0803716e:
    push       {r5}
    ldr        r1,DAT_080372e8
    ldr        r0,DAT_080372ec
    bl         Scene_Prepare
    pop        {r5}
LAB_0803717a:
    pop        {pc}


_ts EventHandler_DenTown_Block_1_F31_1
    push       {lr}
    pop        {pc}


_ts MapSetup_DenTown_Block_1_F32
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_803909C_080372f0
    bl         Map_LoadNPCList
    pop        {r5}
    Flag_GetBase 0x9B
    beq        LAB_080371ba
    bl         Traffic_Init
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_803A76C_080372f4
    bl         Entity_AllocList
    pop        {r5}
    mov        r0,#0x4
    str        r0,[r5,#0x0]
    pop        {pc}
LAB_080371ba:
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
    ldr        r0,PTR_EntityAllocParams_803A3A0_080372f8
    bl         Entity_AllocList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_DenTown_Block_1_F32
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_DenTown_Block_1_F32_0_080372fc
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_DenTown_Block_1_F32_0_080371f0:
    .word EventHandler_DenTown_Block_1_F32_0
    .word EventHandler_DenTown_Block_1_F32_1


_ts EventHandler_DenTown_Block_1_F32_0
    push       {lr}
    Flag_GetBase 0x9B
    bne        LAB_08037212
    push       {r5}
    ldr        r0,PTR_Scene_Story_3A_08037300
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x4
    str        r0,[r5,#0x0]
LAB_08037212:
    pop        {pc}


_ts EventHandler_DenTown_Block_1_F32_1
    push       {lr}
    bl         Traffic_Main
    pop        {pc}


_ts FUN_0803721c
    push       {lr}
    bl         Scene_IsSceneActive
    tst        r0,r0
    beq        LAB_08037228
    pop        {pc}
LAB_08037228:
    LoadMain world, r0, r7
    ldrb       r1,[r0,#0xe]
    cmp        r1,#0x20
    bne        LAB_0803723e
    push       {r5}
    ldr        r0,PTR_Scene_Dialogue_08037304
    mov        r1,#0x3
    bl         Scene_Prepare
    pop        {r5}
LAB_0803723e:
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
    bne        LAB_080372b6
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_080372b6
    LoadMain input, r0, r0
    ldrh       r0,[r0,#0x2]
    ldr        r1,DAT_08037308
    and        r1,r0
    beq        LAB_080372b6
    bl         dummy_187a0
    bne        LAB_080372b6
    Flag_GetBase 0x9A
    bne        LAB_080372aa
    Flag_GetBase 0x98
    bne        LAB_0803729c
    push       {r5}
    ldr        r0,PTR_Scene_Dialogue_0803730c
    mov        r1,#0x4
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0803729c:
    push       {r5}
    ldr        r0,PTR_Scene_Dialogue_08037310
    mov        r1,#0xb
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_080372aa:
    push       {r5}
    ldr        r0,PTR_Scene_JackIn_08037314
    mov        r1,#0xe
    bl         Scene_Prepare
    pop        {r5}
LAB_080372b6:
    pop        {pc}

PTR_PTR_MapSetup_DenTown_Block_1_F30_080372b8:
    .word PTR_MapSetup_DenTown_Block_1_F30_08036f78

PTR_EntityAllocParams_803A76C_080372bc:
    .word EntityAllocParams_803A76C

PTR_PTR_EventHandler_DenTown_Block_1_F30_080372c0:
    .word PTR_EventHandler_DenTown_Block_1_F30_08036fa8

PTR_NPCList_803909C_080372c4:
    .word NPCList_803909C

PTR_PTR_EventHandler_DenTown_Block_1_F30_0_080372c8:
    .word PTR_EventHandler_DenTown_Block_1_F30_0_08037020

PTR_Scene_Story_38_080372cc:
    .word Scene_Story_38

PTR_NPCList_803909C_080372d0:
    .word NPCList_803909C

PTR_EntityAllocParams_803A3A0_080372d4:
    .word EntityAllocParams_803A3A0

PTR_PTR_EventHandler_DenTown_Block_1_F31_0_080372d8:
    .word PTR_EventHandler_DenTown_Block_1_F31_0_080370fc

DAT_080372dc:
    .word Scene_CheckMail

DAT_080372e0:
    .word 0x10A

PTR_Scene_Story_39_080372e4:
    .word Scene_Story_39

DAT_080372e8:
    .word 0xB07

DAT_080372ec:
    .word Scene_LockedPath

PTR_NPCList_803909C_080372f0:
    .word NPCList_803909C

PTR_EntityAllocParams_803A76C_080372f4:
    .word EntityAllocParams_803A76C

PTR_EntityAllocParams_803A3A0_080372f8:
    .word EntityAllocParams_803A3A0

PTR_PTR_EventHandler_DenTown_Block_1_F32_0_080372fc:
    .word PTR_EventHandler_DenTown_Block_1_F32_0_080371f0

PTR_Scene_Story_3A_08037300:
    .word Scene_Story_3A

PTR_Scene_Dialogue_08037304:
    .word Scene_Dialogue

DAT_08037308:
    .word 0x100

PTR_Scene_Dialogue_0803730c:
    .word Scene_Dialogue

PTR_Scene_Dialogue_08037310:
    .word Scene_Dialogue

PTR_Scene_JackIn_08037314:
    .word Scene_JackIn


_ts MapSetup_DenTown_Block_1_S4
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_DenTown_Block_1_F40_08037438
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_803A76C_0803743c
    bl         Entity_AllocList
    pop        {r5}
    bl         Traffic_Init
    bl         Sound_AreaSongChange
    pop        {pc}

    .align 2, 0

PTR_MapSetup_DenTown_Block_1_F40_08037338:
    .word MapSetup_DenTown_Block_1_F40
    .word MapSetup_DenTown_Block_1_F40
    .word MapSetup_DenTown_Block_1_F40
    .word MapSetup_DenTown_Block_1_F40
    .word MapSetup_DenTown_Block_1_F40
    .word MapSetup_DenTown_Block_1_F40
    .word MapSetup_DenTown_Block_1_F40
    .word MapSetup_DenTown_Block_1_F40


_ts EventHandler_DenTown_Block_1_S4
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_DenTown_Block_1_F40_08037440
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         FUN_080373c8
    bl         Traffic_Main
    pop        {pc}

PTR_EventHandler_DenTown_Block_1_F40_0803736c:
    .word EventHandler_DenTown_Block_1_F40
    .word EventHandler_DenTown_Block_1_F40
    .word EventHandler_DenTown_Block_1_F40
    .word EventHandler_DenTown_Block_1_F40
    .word EventHandler_DenTown_Block_1_F40
    .word EventHandler_DenTown_Block_1_F40
    .word EventHandler_DenTown_Block_1_F40
    .word EventHandler_DenTown_Block_1_F40


_ts MapSetup_DenTown_Block_1_F40
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_803909C_08037444
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_DenTown_Block_1_F40
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_DenTown_Block_1_F40_0_08037448
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_DenTown_Block_1_F40_0_080373c0:
    .word EventHandler_DenTown_Block_1_F40_0


_ts EventHandler_DenTown_Block_1_F40_0
    push       {lr}
    pop        {pc}


_ts FUN_080373c8
    push       {lr}
    bl         Scene_IsSceneActive
    tst        r0,r0
    beq        LAB_080373d4
    pop        {pc}
LAB_080373d4:
    LoadMain world, r0, r7
    ldrb       r1,[r0,#0xe]
    cmp        r1,#0x20
    bne        LAB_080373ea
    push       {r5}
    ldr        r0,PTR_Scene_Dialogue_0803744c
    mov        r1,#0x3
    bl         Scene_Prepare
    pop        {r5}
LAB_080373ea:
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
    bne        LAB_08037436
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08037436
    LoadMain input, r0, r0
    ldrh       r0,[r0,#0x2]
    ldr        r1,DAT_08037450
    and        r1,r0
    beq        LAB_08037436
    bl         dummy_187a0
    bne        LAB_08037436
    push       {r5}
    ldr        r0,PTR_Scene_JackIn_08037454
    mov        r1,#0xe
    bl         Scene_Prepare
    pop        {r5}
LAB_08037436:
    pop        {pc}

PTR_PTR_MapSetup_DenTown_Block_1_F40_08037438:
    .word PTR_MapSetup_DenTown_Block_1_F40_08037338

PTR_EntityAllocParams_803A76C_0803743c:
    .word EntityAllocParams_803A76C

PTR_PTR_EventHandler_DenTown_Block_1_F40_08037440:
    .word PTR_EventHandler_DenTown_Block_1_F40_0803736c

PTR_NPCList_803909C_08037444:
    .word NPCList_803909C

PTR_PTR_EventHandler_DenTown_Block_1_F40_0_08037448:
    .word PTR_EventHandler_DenTown_Block_1_F40_0_080373c0

PTR_Scene_Dialogue_0803744c:
    .word Scene_Dialogue

DAT_08037450:
    .word 0x100

PTR_Scene_JackIn_08037454:
    .word Scene_JackIn


_ts MapSetup_DenTown_Block_1_S5
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_DenTown_Block_1_F50_08037590
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_803A76C_08037594
    bl         Entity_AllocList
    pop        {r5}
    bl         Traffic_Init
    bl         Sound_AreaSongChange
    pop        {pc}

    .align 2, 0

PTR_MapSetup_DenTown_Block_1_F50_08037478:
    .word MapSetup_DenTown_Block_1_F50
    .word MapSetup_DenTown_Block_1_F50
    .word MapSetup_DenTown_Block_1_F50
    .word MapSetup_DenTown_Block_1_F50
    .word MapSetup_DenTown_Block_1_F50
    .word MapSetup_DenTown_Block_1_F50
    .word MapSetup_DenTown_Block_1_F50
    .word MapSetup_DenTown_Block_1_F50


_ts EventHandler_DenTown_Block_1_S5
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_DenTown_Block_1_F50_08037598
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         FUN_08037520
    bl         Traffic_Main
    pop        {pc}

PTR_EventHandler_DenTown_Block_1_F50_080374ac:
    .word EventHandler_DenTown_Block_1_F50
    .word EventHandler_DenTown_Block_1_F50
    .word EventHandler_DenTown_Block_1_F50
    .word EventHandler_DenTown_Block_1_F50
    .word EventHandler_DenTown_Block_1_F50
    .word EventHandler_DenTown_Block_1_F50
    .word EventHandler_DenTown_Block_1_F50
    .word EventHandler_DenTown_Block_1_F50


_ts MapSetup_DenTown_Block_1_F50
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
    bge        LAB_080374f6
    push       {r5}
    ldr        r7,PTR_NPCList_80391BC_0803759c
    bl         Map_LoadNPCList
    pop        {r5}
    b          LAB_08037500
LAB_080374f6:
    push       {r5}
    ldr        r7,PTR_NPCList_80391CC_080375a0
    bl         Map_LoadNPCList
    pop        {r5}
LAB_08037500:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_DenTown_Block_1_F50
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_DenTown_Block_1_F50_0_080375a4
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_DenTown_Block_1_F50_0_08037518:
    .word EventHandler_DenTown_Block_1_F50_0


_ts EventHandler_DenTown_Block_1_F50_0
    push       {lr}
    pop        {pc}


_ts FUN_08037520
    push       {lr}
    bl         Scene_IsSceneActive
    tst        r0,r0
    beq        LAB_0803752c
    pop        {pc}
LAB_0803752c:
    LoadMain world, r0, r7
    ldrb       r1,[r0,#0xe]
    cmp        r1,#0x20
    bne        LAB_08037542
    push       {r5}
    ldr        r0,PTR_Scene_Dialogue_080375a8
    mov        r1,#0x3
    bl         Scene_Prepare
    pop        {r5}
LAB_08037542:
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
    bne        LAB_0803758e
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0803758e
    LoadMain input, r0, r0
    ldrh       r0,[r0,#0x2]
    ldr        r1,DAT_080375ac
    and        r1,r0
    beq        LAB_0803758e
    bl         dummy_187a0
    bne        LAB_0803758e
    push       {r5}
    ldr        r0,PTR_Scene_JackIn_080375b0
    mov        r1,#0xe
    bl         Scene_Prepare
    pop        {r5}
LAB_0803758e:
    pop        {pc}

PTR_PTR_MapSetup_DenTown_Block_1_F50_08037590:
    .word PTR_MapSetup_DenTown_Block_1_F50_08037478

PTR_EntityAllocParams_803A76C_08037594:
    .word EntityAllocParams_803A76C

PTR_PTR_EventHandler_DenTown_Block_1_F50_08037598:
    .word PTR_EventHandler_DenTown_Block_1_F50_080374ac

PTR_NPCList_80391BC_0803759c:
    .word NPCList_80391BC

PTR_NPCList_80391CC_080375a0:
    .word NPCList_80391CC

PTR_PTR_EventHandler_DenTown_Block_1_F50_0_080375a4:
    .word PTR_EventHandler_DenTown_Block_1_F50_0_08037518

PTR_Scene_Dialogue_080375a8:
    .word Scene_Dialogue

DAT_080375ac:
    .word 0x100

PTR_Scene_JackIn_080375b0:
    .word Scene_JackIn
