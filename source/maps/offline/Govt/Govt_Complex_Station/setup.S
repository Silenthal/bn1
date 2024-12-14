#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_Govt_Complex_Station_S2
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_Default_0803233c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r0,#0xab
    bl         Flag_GetBase
    beq        LAB_0803213e
    push       {r5}
    mov        r0,#0x4
    bl         Sound_ChangeSong
    pop        {r5}
    b          LAB_08032156
LAB_0803213e:
    mov        r0,#0xdf
    bl         Flag_GetBase
    beq        LAB_08032152
    push       {r5}
    mov        r0,#0x3
    bl         Sound_ChangeSong
    pop        {r5}
    b          LAB_08032156
LAB_08032152:
    bl         Sound_AreaSongChange
LAB_08032156:
    pop        {pc}

PTR_MapSetup_Default_08032158:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Govt_Complex_Station_F22
    .word MapSetup_Govt_Complex_Station_F23
    .word MapSetup_Govt_Complex_Station_F22
    .word MapSetup_Govt_Complex_Station_F22
    .word MapSetup_Govt_Complex_Station_F26
    .word MapSetup_Govt_Complex_Station_F26


_ts EventHandler_Govt_Complex_Station_S2
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Default_08032340
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Default_08032184:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Govt_Complex_Station_F22
    .word EventHandler_Govt_Complex_Station_F23
    .word EventHandler_Govt_Complex_Station_F22
    .word EventHandler_Govt_Complex_Station_F22
    .word EventHandler_Govt_Complex_Station_F26
    .word EventHandler_Govt_Complex_Station_F26


_ts MapSetup_Govt_Complex_Station_F22
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_80350EC_08032344
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_BgTask_ACDC_Station_Tileset_Gate_Closed_08032348
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_803234C
    bl         BgTask_AddNew
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Govt_Complex_Station_F22
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Complex_Station_F22_0_08032350
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Govt_Complex_Station_F22_0_080321e8:
    .word EventHandler_Govt_Complex_Station_F22_0


_ts EventHandler_Govt_Complex_Station_F22_0
    push       {lr}
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x10
    bne        LAB_08032216
    mov        r0,#0x2a
    bl         Flag_GetBase
    beq        LAB_08032216
    push       {r5}
    mov        r1,#0x1
    ldr        r0,PTR_Scene_TrainRide_08032354
    bl         Scene_Prepare
    pop        {r5}
LAB_08032216:
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x20
    bne        LAB_0803222c
    push       {r5}
    mov        r1,#0x5
    ldr        r0,DAT_08032358
    bl         Scene_Prepare
    pop        {r5}
LAB_0803222c:
    pop        {pc}


_nt MapSetup_Govt_Complex_Station_F23
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_BgTask_ACDC_Station_Tileset_Gate_Closed_0803235c
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8032360
    bl         BgTask_AddNew
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Govt_Complex_Station_F23
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Complex_Station_F23_0_08032364
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Govt_Complex_Station_F23_0_08032268:
    .word EventHandler_Govt_Complex_Station_F23_0


_ts EventHandler_Govt_Complex_Station_F23_0
    push       {lr}
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x10
    bne        LAB_08032296
    mov        r0,#0x2a
    bl         Flag_GetBase
    beq        LAB_08032296
    push       {r5}
    mov        r1,#0x1
    ldr        r0,PTR_Scene_TrainRide_08032368
    bl         Scene_Prepare
    pop        {r5}
LAB_08032296:
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x20
    bne        LAB_080322ac
    push       {r5}
    mov        r1,#0x5
    ldr        r0,DAT_0803236c
    bl         Scene_Prepare
    pop        {r5}
LAB_080322ac:
    pop        {pc}


_nt MapSetup_Govt_Complex_Station_F26
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_BgTask_ACDC_Station_Tileset_Gate_Closed_08032370
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8032374
    bl         BgTask_AddNew
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_8035134_08032378
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_Govt_Complex_Station_F26
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Complex_Station_F26_0_0803237c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_Govt_Complex_Station_F26_0_080322f4:
    .word EventHandler_Govt_Complex_Station_F26_0


_ts EventHandler_Govt_Complex_Station_F26_0
    push       {lr}
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x10
    bne        LAB_08032322
    mov        r0,#0x2a
    bl         Flag_GetBase
    beq        LAB_08032322
    push       {r5}
    mov        r1,#0x1
    ldr        r0,PTR_Scene_TrainRide_08032380
    bl         Scene_Prepare
    pop        {r5}
LAB_08032322:
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x20
    bne        LAB_08032338
    push       {r5}
    mov        r1,#0x5
    ldr        r0,DAT_08032384
    bl         Scene_Prepare
    pop        {r5}
LAB_08032338:
    pop        {pc}

    .align 2, 0

PTR_PTR_MapSetup_Default_0803233c:
    .word PTR_MapSetup_Default_08032158

PTR_PTR_EventHandler_Default_08032340:
    .word PTR_EventHandler_Default_08032184

PTR_NPCList_80350EC_08032344:
    .word NPCList_80350EC

PTR_BgTask_ACDC_Station_Tileset_Gate_Closed_08032348:
    .word BgTask_ACDC_Station_Tileset_Gate_Closed

PTR_BgTask_803234C:
    .word BgTask_802A374

PTR_PTR_EventHandler_Govt_Complex_Station_F22_0_08032350:
    .word PTR_EventHandler_Govt_Complex_Station_F22_0_080321e8

PTR_Scene_TrainRide_08032354:
    .word Scene_TrainRide

DAT_08032358:
    .word Scene_Dialogue

PTR_BgTask_ACDC_Station_Tileset_Gate_Closed_0803235c:
    .word BgTask_ACDC_Station_Tileset_Gate_Closed

PTR_BgTask_8032360:
    .word BgTask_802A374

PTR_PTR_EventHandler_Govt_Complex_Station_F23_0_08032364:
    .word PTR_EventHandler_Govt_Complex_Station_F23_0_08032268

PTR_Scene_TrainRide_08032368:
    .word Scene_TrainRide

DAT_0803236c:
    .word Scene_Dialogue

PTR_BgTask_ACDC_Station_Tileset_Gate_Closed_08032370:
    .word BgTask_ACDC_Station_Tileset_Gate_Closed

PTR_BgTask_8032374:
    .word BgTask_802A374

PTR_NPCList_8035134_08032378:
    .word NPCList_8035134

PTR_PTR_EventHandler_Govt_Complex_Station_F26_0_0803237c:
    .word PTR_EventHandler_Govt_Complex_Station_F26_0_080322f4

PTR_Scene_TrainRide_08032380:
    .word Scene_TrainRide

DAT_08032384:
    .word Scene_Dialogue


_ts MapSetup_Govt_Complex_Station_S3
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_Govt_Complex_Station_F30_08032478
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Sound_AreaSongChange
    pop        {pc}

PTR_MapSetup_Govt_Complex_Station_F30_08032398:
    .word MapSetup_Govt_Complex_Station_F30
    .word MapSetup_Govt_Complex_Station_F30
    .word MapSetup_Govt_Complex_Station_F30
    .word MapSetup_Govt_Complex_Station_F30
    .word MapSetup_Govt_Complex_Station_F30
    .word MapSetup_Govt_Complex_Station_F30
    .word MapSetup_Govt_Complex_Station_F30
    .word MapSetup_Govt_Complex_Station_F30


_ts EventHandler_Govt_Complex_Station_S3
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Complex_Station_F30_0803247c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Govt_Complex_Station_F30_080323c4:
    .word EventHandler_Govt_Complex_Station_F30
    .word EventHandler_Govt_Complex_Station_F30
    .word EventHandler_Govt_Complex_Station_F30
    .word EventHandler_Govt_Complex_Station_F30
    .word EventHandler_Govt_Complex_Station_F30
    .word EventHandler_Govt_Complex_Station_F30
    .word EventHandler_Govt_Complex_Station_F30
    .word EventHandler_Govt_Complex_Station_F30


_ts MapSetup_Govt_Complex_Station_F30
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_BgTask_ACDC_Station_Tileset_Gate_Closed_08032480
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8032484
    bl         BgTask_AddNew
    ldr        r7,PTR_NPCList_8035134_08032488
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Govt_Complex_Station_F30
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Complex_Station_F30_0_0803248c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Govt_Complex_Station_F30_0_08032424:
    .word EventHandler_Govt_Complex_Station_F30_0


_ts EventHandler_Govt_Complex_Station_F30_0
    push       {lr}
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x10
    bne        LAB_0803245e
    mov        r0,#0x2a
    bl         Flag_GetBase
    beq        LAB_0803245e
    push       {r5}
    mov        r0,#0x3e
    bl         KeyItem_IsPresent
    beq        LAB_08032454
    mov        r1,#0x3
    b          LAB_08032456
LAB_08032454:
    mov        r1,#0x1
LAB_08032456:
    ldr        r0,PTR_Scene_TrainRide_08032490
    bl         Scene_Prepare
    pop        {r5}
LAB_0803245e:
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x20
    bne        LAB_08032474
    push       {r5}
    mov        r1,#0x5
    ldr        r0,DAT_08032494
    bl         Scene_Prepare
    pop        {r5}
LAB_08032474:
    pop        {pc}

    .align 2, 0

PTR_PTR_MapSetup_Govt_Complex_Station_F30_08032478:
    .word PTR_MapSetup_Govt_Complex_Station_F30_08032398

PTR_PTR_EventHandler_Govt_Complex_Station_F30_0803247c:
    .word PTR_EventHandler_Govt_Complex_Station_F30_080323c4

PTR_BgTask_ACDC_Station_Tileset_Gate_Closed_08032480:
    .word BgTask_ACDC_Station_Tileset_Gate_Closed

PTR_BgTask_8032484:
    .word BgTask_802A374

PTR_NPCList_8035134_08032488:
    .word NPCList_8035134

PTR_PTR_EventHandler_Govt_Complex_Station_F30_0_0803248c:
    .word PTR_EventHandler_Govt_Complex_Station_F30_0_08032424

PTR_Scene_TrainRide_08032490:
    .word Scene_TrainRide

DAT_08032494:
    .word Scene_Dialogue


_ts MapSetup_Govt_Complex_Station_S4
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_Govt_Complex_Station_F40_08032588
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Sound_AreaSongChange
    pop        {pc}

PTR_MapSetup_Govt_Complex_Station_F40_080324a8:
    .word MapSetup_Govt_Complex_Station_F40
    .word MapSetup_Govt_Complex_Station_F40
    .word MapSetup_Govt_Complex_Station_F40
    .word MapSetup_Govt_Complex_Station_F40
    .word MapSetup_Govt_Complex_Station_F40
    .word MapSetup_Govt_Complex_Station_F40
    .word MapSetup_Govt_Complex_Station_F40
    .word MapSetup_Govt_Complex_Station_F40


_ts EventHandler_Govt_Complex_Station_S4
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Complex_Station_F40_0803258c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Govt_Complex_Station_F40_080324d4:
    .word EventHandler_Govt_Complex_Station_F40
    .word EventHandler_Govt_Complex_Station_F40
    .word EventHandler_Govt_Complex_Station_F40
    .word EventHandler_Govt_Complex_Station_F40
    .word EventHandler_Govt_Complex_Station_F40
    .word EventHandler_Govt_Complex_Station_F40
    .word EventHandler_Govt_Complex_Station_F40
    .word EventHandler_Govt_Complex_Station_F40


_ts MapSetup_Govt_Complex_Station_F40
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_BgTask_ACDC_Station_Tileset_Gate_Closed_08032590
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8032594
    bl         BgTask_AddNew
    ldr        r7,PTR_NPCList_8035134_08032598
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Govt_Complex_Station_F40
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Complex_Station_F40_0_0803259c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Govt_Complex_Station_F40_0_08032534:
    .word EventHandler_Govt_Complex_Station_F40_0


_ts EventHandler_Govt_Complex_Station_F40_0
    push       {lr}
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x10
    bne        LAB_0803256e
    mov        r0,#0x2a
    bl         Flag_GetBase
    beq        LAB_0803256e
    push       {r5}
    mov        r0,#0x3e
    bl         KeyItem_IsPresent
    beq        LAB_08032564
    mov        r1,#0x3
    b          LAB_08032566
LAB_08032564:
    mov        r1,#0x1
LAB_08032566:
    ldr        r0,PTR_Scene_TrainRide_080325a0
    bl         Scene_Prepare
    pop        {r5}
LAB_0803256e:
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x20
    bne        LAB_08032584
    push       {r5}
    mov        r1,#0x5
    ldr        r0,DAT_080325a4
    bl         Scene_Prepare
    pop        {r5}
LAB_08032584:
    pop        {pc}

    .align 2, 0

PTR_PTR_MapSetup_Govt_Complex_Station_F40_08032588:
    .word PTR_MapSetup_Govt_Complex_Station_F40_080324a8

PTR_PTR_EventHandler_Govt_Complex_Station_F40_0803258c:
    .word PTR_EventHandler_Govt_Complex_Station_F40_080324d4

PTR_BgTask_ACDC_Station_Tileset_Gate_Closed_08032590:
    .word BgTask_ACDC_Station_Tileset_Gate_Closed

PTR_BgTask_8032594:
    .word BgTask_802A374

PTR_NPCList_8035134_08032598:
    .word NPCList_8035134

PTR_PTR_EventHandler_Govt_Complex_Station_F40_0_0803259c:
    .word PTR_EventHandler_Govt_Complex_Station_F40_0_08032534

PTR_Scene_TrainRide_080325a0:
    .word Scene_TrainRide

DAT_080325a4:
    .word Scene_Dialogue


_ts MapSetup_Govt_Complex_Station_S5
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_Govt_Complex_Station_F50_08032740
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Sound_AreaSongChange
    pop        {pc}

PTR_MapSetup_Govt_Complex_Station_F50_080325b8:
    .word MapSetup_Govt_Complex_Station_F50
    .word MapSetup_Govt_Complex_Station_F50
    .word MapSetup_Govt_Complex_Station_F50
    .word MapSetup_Govt_Complex_Station_F53
    .word MapSetup_Govt_Complex_Station_F53
    .word MapSetup_Govt_Complex_Station_F50
    .word MapSetup_Govt_Complex_Station_F50
    .word MapSetup_Govt_Complex_Station_F50


_ts EventHandler_Govt_Complex_Station_S5
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Complex_Station_F50_08032744
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Govt_Complex_Station_F50_080325e4:
    .word EventHandler_Govt_Complex_Station_F50
    .word EventHandler_Govt_Complex_Station_F50
    .word EventHandler_Govt_Complex_Station_F50
    .word EventHandler_Govt_Complex_Station_F53
    .word EventHandler_Govt_Complex_Station_F53
    .word EventHandler_Govt_Complex_Station_F50
    .word EventHandler_Govt_Complex_Station_F50
    .word EventHandler_Govt_Complex_Station_F50


_ts MapSetup_Govt_Complex_Station_F50
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_NPCList_8035134_08032748
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_BgTask_ACDC_Station_Tileset_Gate_Closed_0803274c
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8032750
    bl         BgTask_AddNew
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Govt_Complex_Station_F50
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Complex_Station_F50_0_08032754
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Govt_Complex_Station_F50_0_08032644:
    .word EventHandler_Govt_Complex_Station_F50_0


_ts EventHandler_Govt_Complex_Station_F50_0
    push       {lr}
    mov        r0,#0x18
    bl         Flag_GetEmailRecieved
    bne        LAB_0803265e
    push       {r5}
    ldr        r0,DAT_08032758
    ldr        r1,DAT_0803275c
    bl         Scene_Prepare
    pop        {r5}
LAB_0803265e:
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x10
    bne        LAB_08032692
    mov        r0,#0x2a
    bl         Flag_GetBase
    beq        LAB_08032692
    push       {r5}
    mov        r0,#0x3e
    bl         KeyItem_IsPresent
    beq        LAB_08032688
    mov        r1,#0x3
    b          LAB_0803268a
LAB_08032688:
    mov        r1,#0x1
LAB_0803268a:
    ldr        r0,DAT_08032760
LAB_0803268c:
    bl         Scene_Prepare
    pop        {r5}
LAB_08032692:
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x20
    bne        LAB_080326a8
    push       {r5}
    mov        r1,#0x5
    ldr        r0,DAT_08032764
    bl         Scene_Prepare
    pop        {r5}
LAB_080326a8:
    pop        {pc}


_nt MapSetup_Govt_Complex_Station_F53
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_NPCList_8035134_08032768
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_BgTask_ACDC_Station_Tileset_Gate_Closed_0803276c
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8032770
    bl         BgTask_AddNew
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_Govt_Complex_Station_F53
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Complex_Station_F53_0_08032774
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_Govt_Complex_Station_F53_0_080326ec:
    .word EventHandler_Govt_Complex_Station_F53_0


_ts EventHandler_Govt_Complex_Station_F53_0
    push       {lr}
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x10
    bne        LAB_08032726
    mov        r0,#0x2a
    bl         Flag_GetBase
    beq        LAB_08032726
    push       {r5}
    mov        r0,#0x3e
    bl         KeyItem_IsPresent
    beq        LAB_0803271c
    mov        r1,#0x3
    b          LAB_0803271e
LAB_0803271c:
    mov        r1,#0x1
LAB_0803271e:
    ldr        r0,PTR_Scene_TrainRide_08032778
    bl         Scene_Prepare
    pop        {r5}
LAB_08032726:
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x20
    bne        LAB_0803273c
    push       {r5}
    mov        r1,#0x5
    ldr        r0,DAT_0803277c
    bl         Scene_Prepare
    pop        {r5}
LAB_0803273c:
    pop        {pc}

    .align 2, 0

PTR_PTR_MapSetup_Govt_Complex_Station_F50_08032740:
    .word PTR_MapSetup_Govt_Complex_Station_F50_080325b8

PTR_PTR_EventHandler_Govt_Complex_Station_F50_08032744:
    .word PTR_EventHandler_Govt_Complex_Station_F50_080325e4

PTR_NPCList_8035134_08032748:
    .word NPCList_8035134

PTR_BgTask_ACDC_Station_Tileset_Gate_Closed_0803274c:
    .word BgTask_ACDC_Station_Tileset_Gate_Closed

PTR_BgTask_8032750:
    .word BgTask_802A374

PTR_PTR_EventHandler_Govt_Complex_Station_F50_0_08032754:
    .word PTR_EventHandler_Govt_Complex_Station_F50_0_08032644

DAT_08032758:
    .word Scene_CheckMail

DAT_0803275c:
    .word 0x124

DAT_08032760:
    .word Scene_TrainRide

DAT_08032764:
    .word Scene_Dialogue

PTR_NPCList_8035134_08032768:
    .word NPCList_8035134

PTR_BgTask_ACDC_Station_Tileset_Gate_Closed_0803276c:
    .word BgTask_ACDC_Station_Tileset_Gate_Closed

PTR_BgTask_8032770:
    .word BgTask_802A374

PTR_PTR_EventHandler_Govt_Complex_Station_F53_0_08032774:
    .word PTR_EventHandler_Govt_Complex_Station_F53_0_080326ec

PTR_Scene_TrainRide_08032778:
    .word Scene_TrainRide

DAT_0803277c:
    .word Scene_Dialogue
