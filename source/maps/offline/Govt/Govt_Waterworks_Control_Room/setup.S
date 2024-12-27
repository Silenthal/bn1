#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_Govt_Waterworks_Control_Room_S2
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_Default_08034664
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_8034668
    bl         BgTask_AddNew
    pop        {r5}
    mov        r0,#0xab
    bl         Flag_GetBase
    beq        LAB_08034548
    push       {r5}
    mov        r0,#0x4
    bl         Sound_ChangeSong
    pop        {r5}
    b          LAB_08034560
LAB_08034548:
    mov        r0,#0xdf
    bl         Flag_GetBase
    beq        LAB_0803455c
    push       {r5}
    mov        r0,#0x3
    bl         Sound_ChangeSong
    pop        {r5}
    b          LAB_08034560
LAB_0803455c:
    bl         Sound_AreaSongChange
LAB_08034560:
    pop        {pc}

    .align 2, 0

PTR_MapSetup_Default_08034564:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Govt_Waterworks_Control_Room_F24
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default


_ts EventHandler_Govt_Waterworks_Control_Room_S2
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Default_0803466c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r0,#0x40
    mov        r1,#0x24
    bl         CheckForJackIn
    pop        {pc}

PTR_EventHandler_Default_08034598:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Govt_Waterworks_Control_Room_F24
    .word EventHandler_Default
    .word EventHandler_Default


_ts MapSetup_Govt_Waterworks_Control_Room_F24
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_8035A90_08034670
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x1
    bl         Flag_SetGate
    mov        r0,#0x2
    bl         Flag_SetGate
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Govt_Waterworks_Control_Room_F24
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Waterworks_Control_Room_F24_0_08034674
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Govt_Waterworks_Control_Room_F24_0_080345f4:
    .word EventHandler_Govt_Waterworks_Control_Room_F24_0
    .word EventHandler_Govt_Waterworks_Control_Room_F24_1


_ts EventHandler_Govt_Waterworks_Control_Room_F24_0
    push       {lr}
    mov        r0,#0xbd
    bl         Flag_GetBase
    beq        LAB_08034614
    mov        r0,#0x1
    bl         Flag_ClearGate
    mov        r0,#0x2
    bl         Flag_ClearGate
    pop        {pc}
LAB_08034614:
    bl         Scene_IsSceneActive
    tst        r0,r0
    pop        {r1}
    bne        LAB_0803465c
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x2
    beq        LAB_0803464a
    cmp        r0,#0x3
    bne        LAB_0803465c
    push       {r5}
    mov        r1,#0x1
    lsl        r1,r1,#0x8
    mov        r0,#0x3
    orr        r1,r0
    ldr        r0,DAT_08034678
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0803464a:
    push       {r5}
    mov        r1,#0x0
    lsl        r1,r1,#0x8
    mov        r0,#0x5
    orr        r1,r0
    ldr        r0,DAT_0803467c
    bl         Scene_Prepare
    pop        {r5}
LAB_0803465c:
    pop        {pc}


_nt EventHandler_Govt_Waterworks_Control_Room_F24_1
    push       {lr}
    pop        {pc}

    .align 2, 0

PTR_PTR_MapSetup_Default_08034664:
    .word PTR_MapSetup_Default_08034564

PTR_BgTask_8034668:
    .word BgTask_80312B0

PTR_PTR_EventHandler_Default_0803466c:
    .word PTR_EventHandler_Default_08034598

PTR_NPCList_8035A90_08034670:
    .word NPCList_8035A90

PTR_PTR_EventHandler_Govt_Waterworks_Control_Room_F24_0_08034674:
    .word PTR_EventHandler_Govt_Waterworks_Control_Room_F24_0_080345f4

DAT_08034678:
    .word Scene_LockedPath

DAT_0803467c:
    .word Scene_LockedPath


_ts MapSetup_Govt_Waterworks_Control_Room_S3
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_Govt_Waterworks_Control_Room_F30_08034760
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_8034764
    bl         BgTask_AddNew
    pop        {r5}
    bl         Sound_AreaSongChange
    pop        {pc}

    .align 2, 0

PTR_MapSetup_Govt_Waterworks_Control_Room_F30_0803469c:
    .word MapSetup_Govt_Waterworks_Control_Room_F30
    .word MapSetup_Govt_Waterworks_Control_Room_F30
    .word MapSetup_Govt_Waterworks_Control_Room_F30
    .word MapSetup_Govt_Waterworks_Control_Room_F30
    .word MapSetup_Govt_Waterworks_Control_Room_F30
    .word MapSetup_Govt_Waterworks_Control_Room_F30
    .word MapSetup_Govt_Waterworks_Control_Room_F30
    .word MapSetup_Govt_Waterworks_Control_Room_F30


_ts EventHandler_Govt_Waterworks_Control_Room_S3
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Waterworks_Control_Room_F30_08034768
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r0,#0x40
    mov        r1,#0x24
    bl         CheckForJackIn
    pop        {pc}

PTR_EventHandler_Govt_Waterworks_Control_Room_F30_080346d0:
    .word EventHandler_Govt_Waterworks_Control_Room_F30
    .word EventHandler_Govt_Waterworks_Control_Room_F30
    .word EventHandler_Govt_Waterworks_Control_Room_F30
    .word EventHandler_Govt_Waterworks_Control_Room_F30
    .word EventHandler_Govt_Waterworks_Control_Room_F30
    .word EventHandler_Govt_Waterworks_Control_Room_F30
    .word EventHandler_Govt_Waterworks_Control_Room_F30


_ts MapSetup_Govt_Waterworks_Control_Room_F30
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_8035A90_0803476c
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x39
    bl         Flag_GetBase
    bne        LAB_08034726
    mov        r0,#0x38
    bl         Flag_GetBase
    beq        LAB_08034726
    push       {r5}
    ldr        r0,DAT_08034770
    mov        r1,#0xa
    bl         Scene_Prepare
    pop        {r5}
LAB_08034726:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Govt_Waterworks_Control_Room_F30
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Waterworks_Control_Room_F30_0_08034774
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Govt_Waterworks_Control_Room_F30_0_0803473c:
    .word EventHandler_Govt_Waterworks_Control_Room_F30_0


_ts EventHandler_Govt_Waterworks_Control_Room_F30_0
    push       {lr}
    mov        r0,#0x39
    bl         Flag_GetBase
    bne        LAB_0803475e
    mov        r0,#0x38
    bl         Flag_GetBase
    beq        LAB_0803475e
    push       {r5}
    ldr        r0,DAT_08034778
    mov        r1,#0xc
    bl         Scene_Prepare
    pop        {r5}
LAB_0803475e:
    pop        {pc}

PTR_PTR_MapSetup_Govt_Waterworks_Control_Room_F30_08034760:
    .word PTR_MapSetup_Govt_Waterworks_Control_Room_F30_0803469c

PTR_BgTask_8034764:
    .word BgTask_80312B0

PTR_PTR_EventHandler_Govt_Waterworks_Control_Room_F30_08034768:
    .word PTR_EventHandler_Govt_Waterworks_Control_Room_F30_080346d0

PTR_NPCList_8035A90_0803476c:
    .word NPCList_8035A90

DAT_08034770:
    .word Scene_AfterFixedBattle

PTR_PTR_EventHandler_Govt_Waterworks_Control_Room_F30_0_08034774:
    .word PTR_EventHandler_Govt_Waterworks_Control_Room_F30_0_0803473c

DAT_08034778:
    .word Scene_StartFixedBattle


_ts MapSetup_Govt_Waterworks_Control_Room_S5
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_Govt_Waterworks_Control_Room_F50_08034904
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_8034908
    bl         BgTask_AddNew
    pop        {r5}
    bl         Sound_AreaSongChange
    pop        {pc}

    .align 2, 0

PTR_MapSetup_Govt_Waterworks_Control_Room_F50_08034798:
    .word MapSetup_Govt_Waterworks_Control_Room_F50
    .word MapSetup_Govt_Waterworks_Control_Room_F50
    .word MapSetup_Govt_Waterworks_Control_Room_F50
    .word MapSetup_Govt_Waterworks_Control_Room_F50
    .word MapSetup_Govt_Waterworks_Control_Room_F54
    .word MapSetup_Govt_Waterworks_Control_Room_F54
    .word MapSetup_Govt_Waterworks_Control_Room_F54
    .word MapSetup_Govt_Waterworks_Control_Room_F54


_ts EventHandler_Govt_Waterworks_Control_Room_S5
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Waterworks_Control_Room_F50_0803490c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r0,#0x40
    mov        r1,#0x24
    bl         CheckForJackIn
    pop        {pc}

PTR_EventHandler_Govt_Waterworks_Control_Room_F50_080347cc:
    .word EventHandler_Govt_Waterworks_Control_Room_F50
    .word EventHandler_Govt_Waterworks_Control_Room_F50
    .word EventHandler_Govt_Waterworks_Control_Room_F50
    .word EventHandler_Govt_Waterworks_Control_Room_F50
    .word EventHandler_Govt_Waterworks_Control_Room_F54
    .word EventHandler_Govt_Waterworks_Control_Room_F54
    .word EventHandler_Govt_Waterworks_Control_Room_F54


_ts MapSetup_Govt_Waterworks_Control_Room_F50
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_8035A90_08034910
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x38
    bl         Flag_GetBase
    beq        LAB_0803482c
    mov        r6,#0xa
    mov        r0,#0x39
    bl         Flag_GetBase
    beq        LAB_0803481a
    mov        r6,#0xb
LAB_0803481a:
    mov        r0,#0x38
    bl         Flag_ClearBase
    add        r1,r6,#0x0
    push       {r5}
    ldr        r0,DAT_08034914
    bl         Scene_Prepare
    pop        {r5}
LAB_0803482c:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_Govt_Waterworks_Control_Room_F50
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Waterworks_Control_Room_F50_0_08034918
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_Govt_Waterworks_Control_Room_F50_0_08034844:
    .word EventHandler_Govt_Waterworks_Control_Room_F50_0


_ts EventHandler_Govt_Waterworks_Control_Room_F50_0
    push       {lr}
    mov        r6,#0xc
    mov        r0,#0x39
    bl         Flag_GetBase
    beq        LAB_08034856
    mov        r6,#0xd
LAB_08034856:
    mov        r0,#0x38
    bl         Flag_GetBase
    beq        LAB_0803486a
    add        r1,r6,#0x0
    push       {r5}
    ldr        r0,DAT_0803491c
    bl         Scene_Prepare
    pop        {r5}
LAB_0803486a:
    pop        {pc}


_ts MapSetup_Govt_Waterworks_Control_Room_F54
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    mov        r0,#0xfa
    bl         Flag_GetBase
    beq        LAB_08034894
    push       {r5}
    ldr        r7,PTR_NPCList_8035AA4_08034920
    bl         Map_LoadNPCList
    pop        {r5}
    b          LAB_0803489e
LAB_08034894:
    push       {r5}
    ldr        r7,PTR_NPCList_8035A90_08034924
    bl         Map_LoadNPCList
    pop        {r5}
LAB_0803489e:
    mov        r0,#0x38
    bl         Flag_GetBase
    beq        LAB_080348c4
    mov        r6,#0xa
    mov        r0,#0x39
    bl         Flag_GetBase
    beq        LAB_080348b2
    mov        r6,#0xb
LAB_080348b2:
    mov        r0,#0x38
    bl         Flag_ClearBase
    add        r1,r6,#0x0
    push       {r5}
    ldr        r0,PTR_Scene_AfterFixedBattle_08034928
    bl         Scene_Prepare
    pop        {r5}
LAB_080348c4:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_Govt_Waterworks_Control_Room_F54
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Waterworks_Control_Room_F54_0_0803492c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_Govt_Waterworks_Control_Room_F54_0_080348dc:
    .word EventHandler_Govt_Waterworks_Control_Room_F54_0


_ts EventHandler_Govt_Waterworks_Control_Room_F54_0
    push       {lr}
    mov        r6,#0xc
    mov        r0,#0x39
    bl         Flag_GetBase
    beq        LAB_080348ee
    mov        r6,#0xd
LAB_080348ee:
    mov        r0,#0x38
    bl         Flag_GetBase
    beq        LAB_08034902
    add        r1,r6,#0x0
    push       {r5}
    ldr        r0,DAT_08034930
    bl         Scene_Prepare
    pop        {r5}
LAB_08034902:
    pop        {pc}

PTR_PTR_MapSetup_Govt_Waterworks_Control_Room_F50_08034904:
    .word PTR_MapSetup_Govt_Waterworks_Control_Room_F50_08034798

PTR_BgTask_8034908:
    .word BgTask_80312B0

PTR_PTR_EventHandler_Govt_Waterworks_Control_Room_F50_0803490c:
    .word PTR_EventHandler_Govt_Waterworks_Control_Room_F50_080347cc

PTR_NPCList_8035A90_08034910:
    .word NPCList_8035A90

DAT_08034914:
    .word Scene_AfterFixedBattle

PTR_PTR_EventHandler_Govt_Waterworks_Control_Room_F50_0_08034918:
    .word PTR_EventHandler_Govt_Waterworks_Control_Room_F50_0_08034844

DAT_0803491c:
    .word Scene_StartFixedBattle

PTR_NPCList_8035AA4_08034920:
    .word NPCList_8035AA4

PTR_NPCList_8035A90_08034924:
    .word NPCList_8035A90

PTR_Scene_AfterFixedBattle_08034928:
    .word Scene_AfterFixedBattle

PTR_PTR_EventHandler_Govt_Waterworks_Control_Room_F54_0_0803492c:
    .word PTR_EventHandler_Govt_Waterworks_Control_Room_F54_0_080348dc

DAT_08034930:
    .word Scene_StartFixedBattle


_ts MapSetup_Govt_Waterworks_Control_Room_S4
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_Govt_Waterworks_Control_Room_F40_08034a24
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_8034A28
    bl         BgTask_AddNew
    pop        {r5}
    bl         Sound_AreaSongChange
    pop        {pc}

    .align 2, 0

PTR_MapSetup_Govt_Waterworks_Control_Room_F40_08034950:
    .word MapSetup_Govt_Waterworks_Control_Room_F40
    .word MapSetup_Govt_Waterworks_Control_Room_F40
    .word MapSetup_Govt_Waterworks_Control_Room_F40
    .word MapSetup_Govt_Waterworks_Control_Room_F40
    .word MapSetup_Govt_Waterworks_Control_Room_F40
    .word MapSetup_Govt_Waterworks_Control_Room_F40
    .word MapSetup_Govt_Waterworks_Control_Room_F40
    .word MapSetup_Govt_Waterworks_Control_Room_F40


_ts EventHandler_Govt_Waterworks_Control_Room_S4
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Waterworks_Control_Room_F40_08034a2c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r0,#0x40
    mov        r1,#0x24
    bl         CheckForJackIn
    pop        {pc}

PTR_EventHandler_Govt_Waterworks_Control_Room_F40_08034984:
    .word EventHandler_Govt_Waterworks_Control_Room_F40
    .word EventHandler_Govt_Waterworks_Control_Room_F40
    .word EventHandler_Govt_Waterworks_Control_Room_F40
    .word EventHandler_Govt_Waterworks_Control_Room_F40
    .word EventHandler_Govt_Waterworks_Control_Room_F40
    .word EventHandler_Govt_Waterworks_Control_Room_F40
    .word EventHandler_Govt_Waterworks_Control_Room_F40


_ts MapSetup_Govt_Waterworks_Control_Room_F40
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_8035A90_08034a30
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x38
    bl         Flag_GetBase
    beq        LAB_080349e4
    mov        r6,#0xa
    mov        r0,#0x39
    bl         Flag_GetBase
    beq        LAB_080349d2
    mov        r6,#0xb
LAB_080349d2:
    mov        r0,#0x38
    bl         Flag_ClearBase
    add        r1,r6,#0x0
    push       {r5}
    ldr        r0,DAT_08034a34
    bl         Scene_Prepare
    pop        {r5}
LAB_080349e4:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_Govt_Waterworks_Control_Room_F40
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Waterworks_Control_Room_F40_0_08034a38
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_Govt_Waterworks_Control_Room_F40_0_080349fc:
    .word EventHandler_Govt_Waterworks_Control_Room_F40_0


_ts EventHandler_Govt_Waterworks_Control_Room_F40_0
    push       {lr}
    mov        r6,#0xc
    mov        r0,#0x39
    bl         Flag_GetBase
    beq        LAB_08034a0e
    mov        r6,#0xd
LAB_08034a0e:
    mov        r0,#0x38
    bl         Flag_GetBase
    beq        LAB_08034a22
    add        r1,r6,#0x0
    push       {r5}
    ldr        r0,DAT_08034a3c
    bl         Scene_Prepare
    pop        {r5}
LAB_08034a22:
    pop        {pc}

PTR_PTR_MapSetup_Govt_Waterworks_Control_Room_F40_08034a24:
    .word PTR_MapSetup_Govt_Waterworks_Control_Room_F40_08034950

PTR_BgTask_8034A28:
    .word BgTask_80312B0

PTR_PTR_EventHandler_Govt_Waterworks_Control_Room_F40_08034a2c:
    .word PTR_EventHandler_Govt_Waterworks_Control_Room_F40_08034984

PTR_NPCList_8035A90_08034a30:
    .word NPCList_8035A90

DAT_08034a34:
    .word Scene_AfterFixedBattle

PTR_PTR_EventHandler_Govt_Waterworks_Control_Room_F40_0_08034a38:
    .word PTR_EventHandler_Govt_Waterworks_Control_Room_F40_0_080349fc

DAT_08034a3c:
    .word Scene_StartFixedBattle
