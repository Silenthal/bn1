#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_ACDC_Station_S2
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_ACDC_Station_F20_0802f48c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r0,#0xab
    bl         Flag_GetBase
    beq        LAB_0802f192
    push       {r5}
    mov        r0,#0x4
    bl         Sound_ChangeSong
    pop        {r5}
    b          LAB_0802f1aa
LAB_0802f192:
    mov        r0,#0xdf
    bl         Flag_GetBase
    beq        LAB_0802f1a6
    push       {r5}
    mov        r0,#0x3
    bl         Sound_ChangeSong
    pop        {r5}
    b          LAB_0802f1aa
LAB_0802f1a6:
    bl         Sound_AreaSongChange
LAB_0802f1aa:
    pop        {pc}
PTR_MapSetup_ACDC_Station_F20_0802f1ac:
    .word MapSetup_ACDC_Station_F20
    .word MapSetup_ACDC_Station_F21
    .word MapSetup_ACDC_Station_F22
    .word MapSetup_Default
    .word MapSetup_ACDC_Station_F24
    .word MapSetup_ACDC_Station_F22
    .word MapSetup_ACDC_Station_F26
    .word MapSetup_ACDC_Station_F26


_ts EventHandler_ACDC_Station_S2
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Station_F20_0802f490
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_Station_F20_0802f1d8:
    .word EventHandler_ACDC_Station_F20
    .word EventHandler_ACDC_Station_F21
    .word EventHandler_ACDC_Station_F22
    .word EventHandler_Default
    .word EventHandler_ACDC_Station_F24
    .word EventHandler_ACDC_Station_F22
    .word EventHandler_ACDC_Station_F26
    .word EventHandler_ACDC_Station_F26


_ts MapSetup_ACDC_Station_F20
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_PTR_DAT_0802f494
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_BgTask_802F498
    bl         BgTask_AddNew
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_ACDC_Station_F20
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Station_F20_0_0802f49c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_ACDC_Station_F20_0_0802f238:
    .word EventHandler_ACDC_Station_F20_0


_ts EventHandler_ACDC_Station_F20_0
    push       {lr}
    mov        r0,#0x97
    bl         Flag_GetBase
    beq        LAB_0802f24e
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    mov        r1,#0x21
    strb       r1,[r0,#0x6]
LAB_0802f24e:
    pop        {pc}


_ts MapSetup_ACDC_Station_F21
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_PTR_DAT_0802f4a0
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_BgTask_802F4A4
    bl         BgTask_AddNew
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_ACDC_Station_F21
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Station_F21_0_0802f4a8
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_ACDC_Station_F21_0_0802f290:
    .word EventHandler_ACDC_Station_F21_0


_ts EventHandler_ACDC_Station_F21_0
    push       {lr}
    pop        {pc}


_ts MapSetup_ACDC_Station_F22
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_PTR_DAT_0802f4ac
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_BgTask_802F4B0
    bl         BgTask_AddNew
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_ACDC_Station_F22
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Station_F22_0_0802f4b4
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_ACDC_Station_F22_0_0802f2d8:
    .word EventHandler_ACDC_Station_F22_0


_ts EventHandler_ACDC_Station_F22_0
    push       {lr}
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x10
    bne        LAB_0802f306
    mov        r0,#0x2a
    bl         Flag_GetBase
    beq        LAB_0802f306
    push       {r5}
    mov        r1,#0x0
    ldr        r0,PTR_Scene_TrainRide_0802f4b8
    bl         Scene_Prepare
    pop        {r5}
LAB_0802f306:
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0xf2
    bne        LAB_0802f31c
    push       {r5}
    mov        r1,#0x11
    ldr        r0,DAT_0802f4bc
    bl         Scene_Prepare
    pop        {r5}
LAB_0802f31c:
    pop        {pc}


_nt MapSetup_ACDC_Station_F24
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_PTR_DAT_0802f4c0
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_BgTask_802F4C4
    bl         BgTask_AddNew
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_ACDC_Station_F24
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Station_F24_0_0802f4c8
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_Station_F24_0_0802f35c:
    .word EventHandler_ACDC_Station_F24_0


_ts EventHandler_ACDC_Station_F24_0
    push       {lr}
    mov        r0,#0x8
    bl         Flag_GetEmailRecieved
    bne        LAB_0802f378
    push       {r5}
    ldr        r0,DAT_0802f4cc
    ldr        r1,DAT_0802f4d0
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0802f378:
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x10
    bne        LAB_0802f3a0
    mov        r0,#0x2a
    bl         Flag_GetBase
    beq        LAB_0802f3a0
    push       {r5}
    mov        r1,#0x0
    ldr        r0,PTR_Scene_TrainRide_0802f4d4
    bl         Scene_Prepare
    pop        {r5}
LAB_0802f3a0:
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0xf2
    bne        LAB_0802f3b6
    push       {r5}
    mov        r1,#0x11
    ldr        r0,DAT_0802f4d8
    bl         Scene_Prepare
    pop        {r5}
LAB_0802f3b6:
    pop        {pc}


_ts MapSetup_ACDC_Station_F26
    push       {lr}
    push       {r5}
    ldr        r0,PTR_BgTask_802F4DC
    bl         BgTask_AddNew
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_PTR_DAT_0802f4e0
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0xb0
    bl         Flag_GetBase
    beq        LAB_0802f3ee
LAB_0802f3d6:
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
LAB_0802f3ee:
    mov        r0,#0xab
    bl         Flag_GetBase
    beq        LAB_0802f3d6
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    mov        r1,#0x0
    strb       r1,[r0,#0x7]
    push       {r5}
    bl         PlayerLocation_Create
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_Scene_Story_2F_0802f4e4
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_ACDC_Station_F26
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Station_F26_0_0802f4e8
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_Station_F26_0_0802f428:
    .word EventHandler_ACDC_Station_F26_0


_ts EventHandler_ACDC_Station_F26_0
    push       {lr}
    mov        r0,#0xb0
    bl         Flag_GetBase
    beq        LAB_0802f44c
    mov        r0,#0x1c
    bl         Flag_GetEmailRecieved
    bne        LAB_0802f44c
    push       {r5}
    ldr        r0,DAT_0802f4ec
    ldr        r1,DAT_0802f4f0
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0802f44c:
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x10
    bne        LAB_0802f474
    mov        r0,#0x2a
    bl         Flag_GetBase
    beq        LAB_0802f474
    push       {r5}
    mov        r1,#0x0
    ldr        r0,PTR_Scene_TrainRide_0802f4f4
    bl         Scene_Prepare
    pop        {r5}
LAB_0802f474:
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0xf2
    bne        LAB_0802f48a
    push       {r5}
    mov        r1,#0x11
    ldr        r0,DAT_0802f4f8
    bl         Scene_Prepare
    pop        {r5}
LAB_0802f48a:
    pop        {pc}
PTR_PTR_MapSetup_ACDC_Station_F20_0802f48c:
    .word PTR_MapSetup_ACDC_Station_F20_0802f1ac
PTR_PTR_EventHandler_ACDC_Station_F20_0802f490:
    .word PTR_EventHandler_ACDC_Station_F20_0802f1d8
PTR_PTR_DAT_0802f494:
    .word NPCList_8030BDC
PTR_BgTask_802F498:
    .word BgTask_ACDC_Station_Tileset_Gate_Closed
PTR_PTR_EventHandler_ACDC_Station_F20_0_0802f49c:
    .word PTR_EventHandler_ACDC_Station_F20_0_0802f238
PTR_PTR_DAT_0802f4a0:
    .word NPCList_8030BDC
PTR_BgTask_802F4A4:
    .word BgTask_ACDC_Station_Tileset_Gate_Closed
PTR_PTR_EventHandler_ACDC_Station_F21_0_0802f4a8:
    .word PTR_EventHandler_ACDC_Station_F21_0_0802f290
PTR_PTR_DAT_0802f4ac:
    .word NPCList_8030C48
PTR_BgTask_802F4B0:
    .word BgTask_ACDC_Station_Tileset_Gate_Closed
PTR_PTR_EventHandler_ACDC_Station_F22_0_0802f4b4:
    .word PTR_EventHandler_ACDC_Station_F22_0_0802f2d8
PTR_Scene_TrainRide_0802f4b8:
    .word Scene_TrainRide
DAT_0802f4bc:
    .word Scene_Dialogue
PTR_PTR_DAT_0802f4c0:
    .word NPCList_8030C48
PTR_BgTask_802F4C4:
    .word BgTask_ACDC_Station_Tileset_Gate_Closed
PTR_PTR_EventHandler_ACDC_Station_F24_0_0802f4c8:
    .word PTR_EventHandler_ACDC_Station_F24_0_0802f35c
DAT_0802f4cc:
    .word Scene_CheckMail
DAT_0802f4d0:
    .word 0x120
PTR_Scene_TrainRide_0802f4d4:
    .word Scene_TrainRide
DAT_0802f4d8:
    .word Scene_Dialogue
PTR_BgTask_802F4DC:
    .word BgTask_ACDC_Station_Tileset_Gate_Closed
PTR_PTR_DAT_0802f4e0:
    .word NPCList_8030C48
PTR_Scene_Story_2F_0802f4e4:
    .word Scene_Story_2F
PTR_PTR_EventHandler_ACDC_Station_F26_0_0802f4e8:
    .word PTR_EventHandler_ACDC_Station_F26_0_0802f428
DAT_0802f4ec:
    .word Scene_CheckMail
DAT_0802f4f0:
    .word 0x125
PTR_Scene_TrainRide_0802f4f4:
    .word Scene_TrainRide
DAT_0802f4f8:
    .word Scene_Dialogue


_ts MapSetup_ACDC_Station_S3
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_ACDC_Station_F30_0802f61c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Sound_AreaSongChange
    pop        {pc}
PTR_MapSetup_ACDC_Station_F30_0802f50c:
    .word MapSetup_ACDC_Station_F30
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default


_ts EventHandler_ACDC_Station_S3
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Station_F30_0802f620
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_Station_F30_0802f538:
    .word EventHandler_ACDC_Station_F30
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default


_ts MapSetup_ACDC_Station_F30
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_PTR_DAT_0802f624
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_BgTask_802F628
    bl         BgTask_AddNew
    pop        {r5}
    mov        r0,#0x93
    bl         Flag_GetBase
    beq        LAB_0802f58e
    mov        r0,#0x94
    bl         Flag_SetBase
LAB_0802f58e:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_ACDC_Station_F30
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Station_F30_0_0802f62c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    bl         FUN_0802f602
    pop        {pc}
PTR_EventHandler_ACDC_Station_F30_0_0802f5a8:
    .word EventHandler_ACDC_Station_F30_0


_ts EventHandler_ACDC_Station_F30_0
    push       {lr}
    mov        r0,#0x95
    bl         Flag_GetBase
    beq        LAB_0802f5cc
    mov        r0,#0x14
    bl         Flag_GetEmailRecieved
    bne        LAB_0802f5cc
    push       {r5}
    ldr        r0,DAT_0802f630
    ldr        r1,DAT_0802f634
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0802f5cc:
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x10
    bne        LAB_0802f600
    mov        r0,#0x2a
    bl         Flag_GetBase
    beq        LAB_0802f600
    push       {r5}
    mov        r0,#0x3d
    bl         KeyItem_IsPresent
    beq        LAB_0802f5f6
    mov        r1,#0x0
    b          LAB_0802f5f8
LAB_0802f5f6:
    mov        r1,#0x2
LAB_0802f5f8:
    ldr        r0,PTR_Scene_TrainRide_0802f638
    bl         Scene_Prepare
    pop        {r5}
LAB_0802f600:
    pop        {pc}


_nt FUN_0802f602
    push       {lr}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0xf2
    bne        LAB_0802f61a
    push       {r5}
    mov        r1,#0x11
    ldr        r0,PTR_Scene_Dialogue_0802f63c
    bl         Scene_Prepare
    pop        {r5}
LAB_0802f61a:
    pop        {pc}
PTR_PTR_MapSetup_ACDC_Station_F30_0802f61c:
    .word PTR_MapSetup_ACDC_Station_F30_0802f50c
PTR_PTR_EventHandler_ACDC_Station_F30_0802f620:
    .word PTR_EventHandler_ACDC_Station_F30_0802f538
PTR_PTR_DAT_0802f624:
    .word NPCList_8030C90
PTR_BgTask_802F628:
    .word BgTask_ACDC_Station_Tileset_Gate_Closed
PTR_PTR_EventHandler_ACDC_Station_F30_0_0802f62c:
    .word PTR_EventHandler_ACDC_Station_F30_0_0802f5a8
DAT_0802f630:
    .word Scene_CheckMail
DAT_0802f634:
    .word 0x12C
PTR_Scene_TrainRide_0802f638:
    .word Scene_TrainRide
PTR_Scene_Dialogue_0802f63c:
    .word Scene_Dialogue


_ts MapSetup_ACDC_Station_S4
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_ACDC_Station_F40_0802f730
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Sound_AreaSongChange
    pop        {pc}
PTR_MapSetup_ACDC_Station_F40_0802f650:
    .word MapSetup_ACDC_Station_F40
    .word MapSetup_ACDC_Station_F40
    .word MapSetup_ACDC_Station_F40
    .word MapSetup_ACDC_Station_F40
    .word MapSetup_ACDC_Station_F40
    .word MapSetup_ACDC_Station_F40
    .word MapSetup_ACDC_Station_F40
    .word MapSetup_ACDC_Station_F40


_ts EventHandler_ACDC_Station_S4
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Station_F40_0802f734
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_Station_F40_0802f67c:
    .word EventHandler_ACDC_Station_F40
    .word EventHandler_ACDC_Station_F40
    .word EventHandler_ACDC_Station_F40
    .word EventHandler_ACDC_Station_F40
    .word EventHandler_ACDC_Station_F40
    .word EventHandler_ACDC_Station_F40
    .word EventHandler_ACDC_Station_F40
    .word EventHandler_ACDC_Station_F40


_ts MapSetup_ACDC_Station_F40
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_BgTask_802F738
    bl         BgTask_AddNew
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_PTR_DAT_0802f73c
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_ACDC_Station_F40
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Station_F40_0_0802f740
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_ACDC_Station_F40_0_0802f6dc:
    .word EventHandler_ACDC_Station_F40_0


_ts EventHandler_ACDC_Station_F40_0
    push       {lr}
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x10
    bne        LAB_0802f716
    mov        r0,#0x2a
    bl         Flag_GetBase
    beq        LAB_0802f716
    push       {r5}
    mov        r0,#0x3e
    bl         KeyItem_IsPresent
    beq        LAB_0802f70c
    mov        r1,#0x2
    b          LAB_0802f70e
LAB_0802f70c:
    mov        r1,#0x0
LAB_0802f70e:
    ldr        r0,PTR_Scene_TrainRide_0802f744
    bl         Scene_Prepare
    pop        {r5}
LAB_0802f716:
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0xf2
    bne        LAB_0802f72c
    push       {r5}
    mov        r1,#0x11
    ldr        r0,DAT_0802f748
    bl         Scene_Prepare
    pop        {r5}
LAB_0802f72c:
    pop        {pc}

    .align 2, 0

PTR_PTR_MapSetup_ACDC_Station_F40_0802f730:
    .word PTR_MapSetup_ACDC_Station_F40_0802f650
PTR_PTR_EventHandler_ACDC_Station_F40_0802f734:
    .word PTR_EventHandler_ACDC_Station_F40_0802f67c
PTR_BgTask_802F738:
    .word BgTask_ACDC_Station_Tileset_Gate_Closed
PTR_PTR_DAT_0802f73c:
    .word NPCList_8030C54
PTR_PTR_EventHandler_ACDC_Station_F40_0_0802f740:
    .word PTR_EventHandler_ACDC_Station_F40_0_0802f6dc
PTR_Scene_TrainRide_0802f744:
    .word Scene_TrainRide
DAT_0802f748:
    .word Scene_Dialogue


_ts MapSetup_ACDC_Station_S5
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_ACDC_Station_F50_0802f838
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Sound_AreaSongChange
    pop        {pc}
PTR_MapSetup_ACDC_Station_F50_0802f75c:
    .word MapSetup_ACDC_Station_F50
    .word MapSetup_ACDC_Station_F50
    .word MapSetup_ACDC_Station_F50
    .word MapSetup_ACDC_Station_F50
    .word MapSetup_ACDC_Station_F50
    .word MapSetup_ACDC_Station_F50
    .word MapSetup_ACDC_Station_F50
    .word MapSetup_ACDC_Station_F50


_ts EventHandler_ACDC_Station_S5
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Station_F50_0802f83c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_Station_F50_0802f788:
    .word EventHandler_ACDC_Station_F50
    .word EventHandler_ACDC_Station_F50
    .word EventHandler_ACDC_Station_F50
    .word EventHandler_ACDC_Station_F50
    .word EventHandler_ACDC_Station_F50
    .word EventHandler_ACDC_Station_F50
    .word EventHandler_ACDC_Station_F50
    .word EventHandler_ACDC_Station_F50


_ts MapSetup_ACDC_Station_F50
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_PTR_DAT_0802f840
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_BgTask_802F844
    bl         BgTask_AddNew
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_ACDC_Station_F50
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Station_F50_0_0802f848
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_ACDC_Station_F50_0_0802f7e4:
    .word EventHandler_ACDC_Station_F50_0


_ts EventHandler_ACDC_Station_F50_0
    push       {lr}
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x10
    bne        LAB_0802f81e
    mov        r0,#0x2a
    bl         Flag_GetBase
    beq        LAB_0802f81e
    push       {r5}
    mov        r0,#0x3d
    bl         KeyItem_IsPresent
    beq        LAB_0802f814
    mov        r1,#0x0
    b          LAB_0802f816
LAB_0802f814:
    mov        r1,#0x2
LAB_0802f816:
    ldr        r0,PTR_Scene_TrainRide_0802f84c
    bl         Scene_Prepare
    pop        {r5}
LAB_0802f81e:
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0xf2
    bne        LAB_0802f834
    push       {r5}
    mov        r1,#0x11
    ldr        r0,DAT_0802f850
    bl         Scene_Prepare
    pop        {r5}
LAB_0802f834:
    pop        {pc}

    .align 2, 0

PTR_PTR_MapSetup_ACDC_Station_F50_0802f838:
    .word PTR_MapSetup_ACDC_Station_F50_0802f75c
PTR_PTR_EventHandler_ACDC_Station_F50_0802f83c:
    .word PTR_EventHandler_ACDC_Station_F50_0802f788
PTR_PTR_DAT_0802f840:
    .word NPCList_8030CE4
PTR_BgTask_802F844:
    .word BgTask_ACDC_Station_Tileset_Gate_Closed
PTR_PTR_EventHandler_ACDC_Station_F50_0_0802f848:
    .word PTR_EventHandler_ACDC_Station_F50_0_0802f7e4
PTR_Scene_TrainRide_0802f84c:
    .word Scene_TrainRide
DAT_0802f850:
    .word Scene_Dialogue
