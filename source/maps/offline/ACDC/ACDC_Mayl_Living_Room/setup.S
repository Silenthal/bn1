#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_ACDC_Mayl_Living_Room_S0
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_Default_0802d624
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Sound_AreaSongChange
    pop        {pc}
PTR_MapSetup_Default_0802d554:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_ACDC_Mayl_Living_Room_F06


_ts EventHandler_ACDC_Mayl_Living_Room_S0
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Default_0802d628
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_Default_0802d57c:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_ACDC_Mayl_Living_Room_F06


_ts MapSetup_ACDC_Mayl_Living_Room_F06
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r0,PTR_LAB_0802d62c
    bl         Entity_AllocList
    ldr        r7,PTR_DAT_0802d630
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}

    .align 2, 0


_ts EventHandler_ACDC_Mayl_Living_Room_F06
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Mayl_Living_Room_F06_0_0802d634
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_Mayl_Living_Room_F06_0_0802d5d0:
    .word EventHandler_ACDC_Mayl_Living_Room_F06_0


_ts EventHandler_ACDC_Mayl_Living_Room_F06_0
    push       {lr}
    bl         FUN_0802d5e0
    beq        LAB_0802d5dc
LAB_0802d5dc:
    pop        {pc}

    .align 2, 0


_ts FUN_0802d5e0
    push       {lr}
    mov        r0,#0x80
    bl         Text_CheckOption
    bne        LAB_0802d620
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x40
    bne        LAB_0802d620
    LoadMain input, r0, r0
    ldrh       r0,[r0,#0x2]
    ldr        r1,DAT_0802d638
    mvn        r0,r0
    and        r1,r0
    bne        LAB_0802d620
    bl         dummy_187a0
    bne        LAB_0802d620
    push       {r5}
    ldr        r0,DAT_0802d63c
    mov        r1,#0x7
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x0
LAB_0802d620:
    pop        {pc}

    .align 2, 0

PTR_PTR_MapSetup_Default_0802d624:
    .word PTR_MapSetup_Default_0802d554
PTR_PTR_EventHandler_Default_0802d628:
    .word PTR_EventHandler_Default_0802d57c
PTR_LAB_0802d62c:
    .word EntityAllocParams_8030F78
PTR_DAT_0802d630:
    .word NPCList_8030890
PTR_PTR_EventHandler_ACDC_Mayl_Living_Room_F06_0_0802d634:
    .word PTR_EventHandler_ACDC_Mayl_Living_Room_F06_0_0802d5d0
DAT_0802d638:
    .word 0x100
DAT_0802d63c:
    .word Scene_JackIn


_ts MapSetup_ACDC_Mayl_Living_Room_S2
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_ACDC_Mayl_Living_Room_F20_0802d844
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    Flag_GetBase 0xAB
    beq        LAB_0802d65e
    push       {r5}
    mov        r0,#T_Incident_Occurrence
    bl         Sound_PlayBGM
    pop        {r5}
    b          LAB_0802d676
LAB_0802d65e:
    Flag_GetBase 0xDF
    beq        LAB_0802d672
    push       {r5}
    mov        r0,#T_Suspicious_Mood
    bl         Sound_PlayBGM
    pop        {r5}
    b          LAB_0802d676
LAB_0802d672:
    bl         Sound_AreaSongChange
LAB_0802d676:
    pop        {pc}
PTR_MapSetup_ACDC_Mayl_Living_Room_F20_0802d678:
    .word MapSetup_ACDC_Mayl_Living_Room_F20
    .word MapSetup_ACDC_Mayl_Living_Room_F21
    .word MapSetup_ACDC_Mayl_Living_Room_F20
    .word MapSetup_ACDC_Mayl_Living_Room_F20
    .word MapSetup_ACDC_Mayl_Living_Room_F20
    .word MapSetup_ACDC_Mayl_Living_Room_F25
    .word MapSetup_ACDC_Mayl_Living_Room_F25
    .word MapSetup_ACDC_Mayl_Living_Room_F25


_ts EventHandler_ACDC_Mayl_Living_Room_S2
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Mayl_Living_Room_F20_0802d848
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r1,#0x7
    bl         EventHandler_Offline_HandleJackIn
    pop        {pc}

    .align 2, 0

PTR_EventHandler_ACDC_Mayl_Living_Room_F20_0802d6ac:
    .word EventHandler_ACDC_Mayl_Living_Room_F20
    .word EventHandler_ACDC_Mayl_Living_Room_F21
    .word EventHandler_ACDC_Mayl_Living_Room_F20
    .word EventHandler_ACDC_Mayl_Living_Room_F20
    .word EventHandler_ACDC_Mayl_Living_Room_F20
    .word EventHandler_ACDC_Mayl_Living_Room_F25
    .word EventHandler_ACDC_Mayl_Living_Room_F25
    .word EventHandler_ACDC_Mayl_Living_Room_F25


_ts MapSetup_ACDC_Mayl_Living_Room_F20
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r0,PTR_LAB_0802d84c
    bl         Entity_AllocList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_ACDC_Mayl_Living_Room_F20
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Mayl_Living_Room_F20_0_0802d850
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_Mayl_Living_Room_F20_0_0802d6fc:
    .word EventHandler_ACDC_Mayl_Living_Room_F20_0


_ts EventHandler_ACDC_Mayl_Living_Room_F20_0
    push       {lr}
    pop        {pc}


_ts MapSetup_ACDC_Mayl_Living_Room_F21
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r0,PTR_LAB_0802d854
    bl         Entity_AllocList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_ACDC_Mayl_Living_Room_F21
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Mayl_Living_Room_F21_0_0802d858
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_Mayl_Living_Room_F21_0_0802d734:
    .word EventHandler_ACDC_Mayl_Living_Room_F21_0


_ts EventHandler_ACDC_Mayl_Living_Room_F21_0
    push       {lr}
    Flag_GetBase 0x6F
    beq        LAB_0802d74a
    LoadMain world, r0, r0
    mov        r1,#0x22
    strb       r1,[r0,#0x6]
LAB_0802d74a:
    pop        {pc}


_ts MapSetup_ACDC_Mayl_Living_Room_F25
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r0,PTR_LAB_0802d85c
    bl         Entity_AllocList
    ldr        r7,PTR_PTR_DAT_0802d860
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_ACDC_Mayl_Living_Room_F25
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Mayl_Living_Room_F25_0_0802d864
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_ACDC_Mayl_Living_Room_F25_0_0802d784:
    .word EventHandler_ACDC_Mayl_Living_Room_F25_0


_ts EventHandler_ACDC_Mayl_Living_Room_F25_0
    push       {lr}
    pop        {pc}


_ts EventHandler_Offline_HandleJackIn
    push       {lr}
    push       {r1}
    bl         Scene_IsSceneActive
    tst        r0,r0
    beq        LAB_0802d79c
    pop        {r1}
    pop        {pc}
LAB_0802d79c:
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x40
    beq        LAB_0802d7b4
    pop        {r1}
    pop        {pc}
LAB_0802d7b4:
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0802d7e0
    LoadMain input, r0, r0
    ldrh       r0,[r0,#0x2]
    ldr        r1,DAT_0802d868
    and        r1,r0
    beq        LAB_0802d7e0
    bl         dummy_187a0
    bne        LAB_0802d7e0
    pop        {r1}
    push       {r5}
    ldr        r0,PTR_Scene_JackIn_0802d86c
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0802d7e0:
    pop        {r1}
    pop        {pc}


_ts FUN_0802d7e4
    push       {lr}
    push       {r1}
    bl         Scene_IsSceneActive
    tst        r0,r0
    beq        LAB_0802d7f4
    pop        {r1}
    pop        {pc}
LAB_0802d7f4:
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x40
    beq        LAB_0802d814
    cmp        r0,#0xf8
    beq        LAB_0802d814
    cmp        r0,#0xf9
    beq        LAB_0802d814
    pop        {r1}
    pop        {pc}
LAB_0802d814:
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0802d840
    LoadMain input, r0, r0
    ldrh       r0,[r0,#0x2]
    ldr        r1,DAT_0802d868
    and        r1,r0
    beq        LAB_0802d840
    bl         dummy_187a0
    bne        LAB_0802d840
    pop        {r1}
    push       {r5}
    ldr        r0,PTR_Scene_JackIn_0802d870
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0802d840:
    pop        {r1}
    pop        {pc}
PTR_PTR_MapSetup_ACDC_Mayl_Living_Room_F20_0802d844:
    .word PTR_MapSetup_ACDC_Mayl_Living_Room_F20_0802d678
PTR_PTR_EventHandler_ACDC_Mayl_Living_Room_F20_0802d848:
    .word PTR_EventHandler_ACDC_Mayl_Living_Room_F20_0802d6ac
PTR_LAB_0802d84c:
    .word EntityAllocParams_8030F78
PTR_PTR_EventHandler_ACDC_Mayl_Living_Room_F20_0_0802d850:
    .word PTR_EventHandler_ACDC_Mayl_Living_Room_F20_0_0802d6fc
PTR_LAB_0802d854:
    .word EntityAllocParams_8030F78
PTR_PTR_EventHandler_ACDC_Mayl_Living_Room_F21_0_0802d858:
    .word PTR_EventHandler_ACDC_Mayl_Living_Room_F21_0_0802d734
PTR_LAB_0802d85c:
    .word EntityAllocParams_8030F78
PTR_PTR_DAT_0802d860:
    .word NPCList_80308B0
PTR_PTR_EventHandler_ACDC_Mayl_Living_Room_F25_0_0802d864:
    .word PTR_EventHandler_ACDC_Mayl_Living_Room_F25_0_0802d784
DAT_0802d868:
    .word 0x100
PTR_Scene_JackIn_0802d86c:
    .word Scene_JackIn
PTR_Scene_JackIn_0802d870:
    .word Scene_JackIn


_ts MapSetup_ACDC_Mayl_Living_Room_S3
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_ACDC_Mayl_Living_Room_F30_0802d8d8
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Sound_AreaSongChange
    pop        {pc}
PTR_MapSetup_ACDC_Mayl_Living_Room_F30_0802d884:
    .word MapSetup_ACDC_Mayl_Living_Room_F30


_ts EventHandler_ACDC_Mayl_Living_Room_S3
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Mayl_Living_Room_F30_0802d8dc
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r1,#0x7
    bl         EventHandler_Offline_HandleJackIn
    pop        {pc}

    .align 2, 0

PTR_EventHandler_ACDC_Mayl_Living_Room_F30_0802d89c:
    .word EventHandler_ACDC_Mayl_Living_Room_F30


_ts MapSetup_ACDC_Mayl_Living_Room_F30
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r0,PTR_LAB_0802d8e0
    bl         Entity_AllocList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_ACDC_Mayl_Living_Room_F30
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Mayl_Living_Room_F30_0_0802d8e4
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_Mayl_Living_Room_F30_0_0802d8d0:
    .word EventHandler_ACDC_Mayl_Living_Room_F30_0


_ts EventHandler_ACDC_Mayl_Living_Room_F30_0
    push       {lr}
    pop        {pc}
PTR_PTR_MapSetup_ACDC_Mayl_Living_Room_F30_0802d8d8:
    .word PTR_MapSetup_ACDC_Mayl_Living_Room_F30_0802d884
PTR_PTR_EventHandler_ACDC_Mayl_Living_Room_F30_0802d8dc:
    .word PTR_EventHandler_ACDC_Mayl_Living_Room_F30_0802d89c
PTR_LAB_0802d8e0:
    .word EntityAllocParams_8030F78
PTR_PTR_EventHandler_ACDC_Mayl_Living_Room_F30_0_0802d8e4:
    .word PTR_EventHandler_ACDC_Mayl_Living_Room_F30_0_0802d8d0


_ts MapSetup_ACDC_Mayl_Living_Room_S4
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_ACDC_Mayl_Living_Room_F40_0802d984
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Sound_AreaSongChange
    pop        {pc}
PTR_MapSetup_ACDC_Mayl_Living_Room_F40_0802d8f8:
    .word MapSetup_ACDC_Mayl_Living_Room_F40
    .word MapSetup_ACDC_Mayl_Living_Room_F40
    .word MapSetup_ACDC_Mayl_Living_Room_F40
    .word MapSetup_ACDC_Mayl_Living_Room_F40
    .word MapSetup_ACDC_Mayl_Living_Room_F40
    .word MapSetup_ACDC_Mayl_Living_Room_F40
    .word MapSetup_ACDC_Mayl_Living_Room_F40
    .word MapSetup_ACDC_Mayl_Living_Room_F40


_ts EventHandler_ACDC_Mayl_Living_Room_S4
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Mayl_Living_Room_F40_0802d988
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r1,#0x7
    bl         EventHandler_Offline_HandleJackIn
    pop        {pc}

    .align 2, 0

PTR_EventHandler_ACDC_Mayl_Living_Room_F40_0802d92c:
    .word EventHandler_ACDC_Mayl_Living_Room_F40
    .word EventHandler_ACDC_Mayl_Living_Room_F40
    .word EventHandler_ACDC_Mayl_Living_Room_F40
    .word EventHandler_ACDC_Mayl_Living_Room_F40
    .word EventHandler_ACDC_Mayl_Living_Room_F40
    .word EventHandler_ACDC_Mayl_Living_Room_F40
    .word EventHandler_ACDC_Mayl_Living_Room_F40
    .word EventHandler_ACDC_Mayl_Living_Room_F40


_ts MapSetup_ACDC_Mayl_Living_Room_F40
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r0,PTR_LAB_0802d98c
    bl         Entity_AllocList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_ACDC_Mayl_Living_Room_F40
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Mayl_Living_Room_F40_0_0802d990
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_Mayl_Living_Room_F40_0_0802d97c:
    .word EventHandler_ACDC_Mayl_Living_Room_F40_0


_ts EventHandler_ACDC_Mayl_Living_Room_F40_0
    push       {lr}
    pop        {pc}
PTR_PTR_MapSetup_ACDC_Mayl_Living_Room_F40_0802d984:
    .word PTR_MapSetup_ACDC_Mayl_Living_Room_F40_0802d8f8
PTR_PTR_EventHandler_ACDC_Mayl_Living_Room_F40_0802d988:
    .word PTR_EventHandler_ACDC_Mayl_Living_Room_F40_0802d92c
PTR_LAB_0802d98c:
    .word EntityAllocParams_8030F78
PTR_PTR_EventHandler_ACDC_Mayl_Living_Room_F40_0_0802d990:
    .word PTR_EventHandler_ACDC_Mayl_Living_Room_F40_0_0802d97c
