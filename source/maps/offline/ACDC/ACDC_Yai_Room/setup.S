#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_ACDC_Yai_Room_S0
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_Default_0802e57c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Sound_AreaSongChange
    pop        {pc}
PTR_MapSetup_Default_0802e424:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_ACDC_Yai_Room_F02
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_ACDC_Yai_Room_F06


_ts EventHandler_ACDC_Yai_Room_S0
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Default_0802e580
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r0,#0x41
    mov        r1,#0x1f
    bl         CheckForJackIn
    pop        {pc}
PTR_EventHandler_Default_0802e454:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_ACDC_Yai_Room_F02
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_ACDC_Yai_Room_F06


_ts MapSetup_ACDC_Yai_Room_F02
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r0,PTR_BgTask_802E584
    bl         BgTask_AddNew
    ldr        r7,PTR_PTR_DAT_0802e588
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}

    .align 2, 0


_ts EventHandler_ACDC_Yai_Room_F02
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Yai_Room_F02_0_0802e58c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_Yai_Room_F02_0_0802e4a8:
    .word EventHandler_ACDC_Yai_Room_F02_0


_ts EventHandler_ACDC_Yai_Room_F02_0
    push       {lr}
    push       {r5}
    Flag_GetBase 0xE1
    pop        {r5}
    beq        LAB_0802e4e6
    push       {r5}
    Flag_SetGate F_GATE_00
    pop        {r5}
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x1
    bne        LAB_0802e4e6
    push       {r5}
    ldr        r0,DAT_0802e590
    ldr        r1,DAT_0802e594
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_0802e4ec
LAB_0802e4e6:
    bl         FUN_0802e538
    beq        LAB_0802e4ec
LAB_0802e4ec:
    pop        {pc}

    .align 2, 0


_ts MapSetup_ACDC_Yai_Room_F06
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r0,PTR_BgTask_802E598
    bl         BgTask_AddNew
    ldr        r7,PTR_PTR_DAT_0802e59c
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}

    .align 2, 0


_ts EventHandler_ACDC_Yai_Room_F06
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Yai_Room_F06_0_0802e5a0
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_Yai_Room_F06_0_0802e528:
    .word EventHandler_ACDC_Yai_Room_F06_0


_ts EventHandler_ACDC_Yai_Room_F06_0
    push       {lr}
    bl         FUN_0802e538
    beq        LAB_0802e534
LAB_0802e534:
    pop        {pc}

    .align 2, 0


_ts FUN_0802e538
    push       {lr}
    mov        r0,#0x80
    bl         Text_CheckOption
    bne        LAB_0802e578
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x40
    bne        LAB_0802e578
    LoadMain input, r0, r0
    ldrh       r0,[r0,#0x2]
    ldr        r1,DAT_0802e5a4
    mvn        r0,r0
    and        r1,r0
    bne        LAB_0802e578
    bl         dummy_187a0
    bne        LAB_0802e578
    push       {r5}
    ldr        r0,DAT_0802e5a8
    mov        r1,#0x8
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x0
LAB_0802e578:
    pop        {pc}

    .align 2, 0

PTR_PTR_MapSetup_Default_0802e57c:
    .word PTR_MapSetup_Default_0802e424
PTR_PTR_EventHandler_Default_0802e580:
    .word PTR_EventHandler_Default_0802e454
PTR_BgTask_802E584:
    .word BgTask_ACDC_Yai_Room_Tileset_Panel
PTR_PTR_DAT_0802e588:
    .word NPCList_80309A0
PTR_PTR_EventHandler_ACDC_Yai_Room_F02_0_0802e58c:
    .word PTR_EventHandler_ACDC_Yai_Room_F02_0_0802e4a8
DAT_0802e590:
    .word Scene_LockedPath
DAT_0802e594:
    .word 0x307
PTR_BgTask_802E598:
    .word BgTask_ACDC_Yai_Room_Tileset_Panel
PTR_PTR_DAT_0802e59c:
    .word NPCList_80309A0
PTR_PTR_EventHandler_ACDC_Yai_Room_F06_0_0802e5a0:
    .word PTR_EventHandler_ACDC_Yai_Room_F06_0_0802e528
DAT_0802e5a4:
    .word 0x100
DAT_0802e5a8:
    .word Scene_JackIn


_ts MapSetup_ACDC_Yai_Room_S2
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_ACDC_Yai_Room_F20_0802e780
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    Flag_GetBase 0xAB
    beq        LAB_0802e5ca
    push       {r5}
    mov        r0,#0x4
    bl         Sound_ChangeSong
    pop        {r5}
    b          LAB_0802e5e2
LAB_0802e5ca:
    Flag_GetBase 0xDF
    beq        LAB_0802e5de
    push       {r5}
    mov        r0,#0x3
    bl         Sound_ChangeSong
    pop        {r5}
    b          LAB_0802e5e2
LAB_0802e5de:
    bl         Sound_AreaSongChange
LAB_0802e5e2:
    pop        {pc}
PTR_MapSetup_ACDC_Yai_Room_F20_0802e5e4:
    .word MapSetup_ACDC_Yai_Room_F20
    .word MapSetup_ACDC_Yai_Room_F21
    .word MapSetup_ACDC_Yai_Room_F22
    .word MapSetup_Default
    .word MapSetup_ACDC_Yai_Room_F24
    .word MapSetup_ACDC_Yai_Room_F25
    .word MapSetup_ACDC_Yai_Room_F25
    .word MapSetup_ACDC_Yai_Room_F25


_ts EventHandler_ACDC_Yai_Room_S2
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Yai_Room_F20_0802e784
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r1,#0x8
    bl         EventHandler_Offline_HandleJackIn
    mov        r0,#0x41
    mov        r1,#0x1f
    bl         CheckForJackIn
    pop        {pc}

    .align 2, 0

PTR_EventHandler_ACDC_Yai_Room_F20_0802e620:
    .word EventHandler_ACDC_Yai_Room_F20
    .word EventHandler_ACDC_Yai_Room_F21
    .word EventHandler_ACDC_Yai_Room_F22
    .word EventHandler_Default
    .word EventHandler_ACDC_Yai_Room_F24
    .word EventHandler_ACDC_Yai_Room_F25
    .word EventHandler_ACDC_Yai_Room_F25
    .word EventHandler_ACDC_Yai_Room_F25


_ts MapSetup_ACDC_Yai_Room_F20
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r0,PTR_BgTask_802E788
    bl         BgTask_AddNew
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_ACDC_Yai_Room_F20
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Yai_Room_F20_0_0802e78c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_Yai_Room_F20_0_0802e670:
    .word EventHandler_ACDC_Yai_Room_F20_0


_ts EventHandler_ACDC_Yai_Room_F20_0
    push       {lr}
    pop        {pc}


_ts MapSetup_ACDC_Yai_Room_F21
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r0,PTR_BgTask_802E790
    bl         BgTask_AddNew
    ldr        r7,PTR_PTR_DAT_0802e794
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_ACDC_Yai_Room_F21
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Yai_Room_F21_0_0802e798
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_ACDC_Yai_Room_F21_0_0802e6b0:
    .word EventHandler_ACDC_Yai_Room_F21_0


_ts EventHandler_ACDC_Yai_Room_F21_0
    push       {lr}
    Flag_GetBase 0x6F
    beq        LAB_0802e6c6
    LoadMain world, r0, r0
    mov        r1,#0x22
    strb       r1,[r0,#0x6]
LAB_0802e6c6:
    pop        {pc}


_ts MapSetup_ACDC_Yai_Room_F22
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r0,PTR_BgTask_802E79C
    bl         BgTask_AddNew
    ldr        r7,PTR_PTR_DAT_0802e7a0
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_ACDC_Yai_Room_F22
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Yai_Room_F22_0_0802e7a4
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_ACDC_Yai_Room_F22_0_0802e700:
    .word EventHandler_ACDC_Yai_Room_F22_0


_ts EventHandler_ACDC_Yai_Room_F22_0
    push       {lr}
    pop        {pc}


_ts MapSetup_ACDC_Yai_Room_F24
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r0,PTR_BgTask_802E7A8
    bl         BgTask_AddNew
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_ACDC_Yai_Room_F24
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Yai_Room_F24_0_0802e7ac
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_Yai_Room_F24_0_0802e738:
    .word EventHandler_ACDC_Yai_Room_F24_0


_ts EventHandler_ACDC_Yai_Room_F24_0
    push       {lr}
    pop        {pc}


_ts MapSetup_ACDC_Yai_Room_F25
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r0,PTR_BgTask_802E7B0
    bl         BgTask_AddNew
    ldr        r7,PTR_PTR_DAT_0802e7b4
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_ACDC_Yai_Room_F25
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Yai_Room_F25_0_0802e7b8
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_ACDC_Yai_Room_F25_0_0802e778:
    .word EventHandler_ACDC_Yai_Room_F25_0


_ts EventHandler_ACDC_Yai_Room_F25_0
    push       {lr}
    pop        {pc}
PTR_PTR_MapSetup_ACDC_Yai_Room_F20_0802e780:
    .word PTR_MapSetup_ACDC_Yai_Room_F20_0802e5e4
PTR_PTR_EventHandler_ACDC_Yai_Room_F20_0802e784:
    .word PTR_EventHandler_ACDC_Yai_Room_F20_0802e620
PTR_BgTask_802E788:
    .word BgTask_ACDC_Yai_Room_Tileset_Panel
PTR_PTR_EventHandler_ACDC_Yai_Room_F20_0_0802e78c:
    .word PTR_EventHandler_ACDC_Yai_Room_F20_0_0802e670
PTR_BgTask_802E790:
    .word BgTask_ACDC_Yai_Room_Tileset_Panel
PTR_PTR_DAT_0802e794:
    .word NPCList_80309C0
PTR_PTR_EventHandler_ACDC_Yai_Room_F21_0_0802e798:
    .word PTR_EventHandler_ACDC_Yai_Room_F21_0_0802e6b0
PTR_BgTask_802E79C:
    .word BgTask_ACDC_Yai_Room_Tileset_Panel
PTR_PTR_DAT_0802e7a0:
    .word NPCList_80309C0
PTR_PTR_EventHandler_ACDC_Yai_Room_F22_0_0802e7a4:
    .word PTR_EventHandler_ACDC_Yai_Room_F22_0_0802e700
PTR_BgTask_802E7A8:
    .word BgTask_ACDC_Yai_Room_Tileset_Panel
PTR_PTR_EventHandler_ACDC_Yai_Room_F24_0_0802e7ac:
    .word PTR_EventHandler_ACDC_Yai_Room_F24_0_0802e738
PTR_BgTask_802E7B0:
    .word BgTask_ACDC_Yai_Room_Tileset_Panel
PTR_PTR_DAT_0802e7b4:
    .word NPCList_80309E0
PTR_PTR_EventHandler_ACDC_Yai_Room_F25_0_0802e7b8:
    .word PTR_EventHandler_ACDC_Yai_Room_F25_0_0802e778


_ts MapSetup_ACDC_Yai_Room_S3
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_ACDC_Yai_Room_F30_0802e868
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Sound_AreaSongChange
    pop        {pc}
PTR_MapSetup_ACDC_Yai_Room_F30_0802e7cc:
    .word MapSetup_ACDC_Yai_Room_F30
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default


_ts EventHandler_ACDC_Yai_Room_S3
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Yai_Room_F30_0802e86c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r1,#0x8
    bl         EventHandler_Offline_HandleJackIn
    mov        r0,#0x41
    mov        r1,#0x1f
    bl         CheckForJackIn
    pop        {pc}

    .align 2, 0

PTR_EventHandler_ACDC_Yai_Room_F30_0802e808:
    .word EventHandler_ACDC_Yai_Room_F30
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default


_ts MapSetup_ACDC_Yai_Room_F30
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r0,PTR_BgTask_802E870
    bl         BgTask_AddNew
    ldr        r7,PTR_PTR_DAT_0802e874
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_ACDC_Yai_Room_F30
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Yai_Room_F30_0_0802e878
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_ACDC_Yai_Room_F30_0_0802e860:
    .word EventHandler_ACDC_Yai_Room_F30_0


_ts EventHandler_ACDC_Yai_Room_F30_0
    push       {lr}
    pop        {pc}
PTR_PTR_MapSetup_ACDC_Yai_Room_F30_0802e868:
    .word PTR_MapSetup_ACDC_Yai_Room_F30_0802e7cc
PTR_PTR_EventHandler_ACDC_Yai_Room_F30_0802e86c:
    .word PTR_EventHandler_ACDC_Yai_Room_F30_0802e808
PTR_BgTask_802E870:
    .word BgTask_ACDC_Yai_Room_Tileset_Panel
PTR_PTR_DAT_0802e874:
    .word NPCList_8030A14
PTR_PTR_EventHandler_ACDC_Yai_Room_F30_0_0802e878:
    .word PTR_EventHandler_ACDC_Yai_Room_F30_0_0802e860


_ts MapSetup_ACDC_Yai_Room_S4
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_ACDC_Yai_Room_F40_0802e928
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Sound_AreaSongChange
    pop        {pc}
PTR_MapSetup_ACDC_Yai_Room_F40_0802e88c:
    .word MapSetup_ACDC_Yai_Room_F40
    .word MapSetup_ACDC_Yai_Room_F40
    .word MapSetup_ACDC_Yai_Room_F40
    .word MapSetup_ACDC_Yai_Room_F40
    .word MapSetup_ACDC_Yai_Room_F40
    .word MapSetup_ACDC_Yai_Room_F40
    .word MapSetup_ACDC_Yai_Room_F40
    .word MapSetup_ACDC_Yai_Room_F40


_ts EventHandler_ACDC_Yai_Room_S4
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Yai_Room_F40_0802e92c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r1,#0x8
    bl         EventHandler_Offline_HandleJackIn
    mov        r0,#0x41
    mov        r1,#0x1f
    bl         CheckForJackIn
    pop        {pc}

    .align 2, 0

PTR_EventHandler_ACDC_Yai_Room_F40_0802e8c8:
    .word EventHandler_ACDC_Yai_Room_F40
    .word EventHandler_ACDC_Yai_Room_F40
    .word EventHandler_ACDC_Yai_Room_F40
    .word EventHandler_ACDC_Yai_Room_F40
    .word EventHandler_ACDC_Yai_Room_F40
    .word EventHandler_ACDC_Yai_Room_F40
    .word EventHandler_ACDC_Yai_Room_F40
    .word EventHandler_ACDC_Yai_Room_F40


_ts MapSetup_ACDC_Yai_Room_F40
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_PTR_DAT_0802e930
    bl         Map_LoadNPCList
    ldr        r0,PTR_BgTask_802E934
    bl         BgTask_AddNew
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_ACDC_Yai_Room_F40
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Yai_Room_F40_0_0802e938
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_ACDC_Yai_Room_F40_0_0802e920:
    .word EventHandler_ACDC_Yai_Room_F40_0


_ts EventHandler_ACDC_Yai_Room_F40_0
    push       {lr}
    pop        {pc}
PTR_PTR_MapSetup_ACDC_Yai_Room_F40_0802e928:
    .word PTR_MapSetup_ACDC_Yai_Room_F40_0802e88c
PTR_PTR_EventHandler_ACDC_Yai_Room_F40_0802e92c:
    .word PTR_EventHandler_ACDC_Yai_Room_F40_0802e8c8
PTR_PTR_DAT_0802e930:
    .word NPCList_8030A44
PTR_BgTask_802E934:
    .word BgTask_ACDC_Yai_Room_Tileset_Panel
PTR_PTR_EventHandler_ACDC_Yai_Room_F40_0_0802e938:
    .word PTR_EventHandler_ACDC_Yai_Room_F40_0_0802e920


_ts MapSetup_ACDC_Yai_Room_S5
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_ACDC_Yai_Room_F50_0802ea20
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Sound_AreaSongChange
    pop        {pc}
PTR_MapSetup_ACDC_Yai_Room_F50_0802e94c:
    .word MapSetup_ACDC_Yai_Room_F50
    .word MapSetup_ACDC_Yai_Room_F50
    .word MapSetup_ACDC_Yai_Room_F50
    .word MapSetup_ACDC_Yai_Room_F50
    .word MapSetup_ACDC_Yai_Room_F54
    .word MapSetup_ACDC_Yai_Room_F50
    .word MapSetup_ACDC_Yai_Room_F50
    .word MapSetup_ACDC_Yai_Room_F50


_ts EventHandler_ACDC_Yai_Room_S5
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Yai_Room_F50_0802ea24
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r1,#0x8
    bl         EventHandler_Offline_HandleJackIn
    mov        r0,#0x41
    mov        r1,#0x1f
    bl         CheckForJackIn
    pop        {pc}

    .align 2, 0

PTR_EventHandler_ACDC_Yai_Room_F50_0802e988:
    .word EventHandler_ACDC_Yai_Room_F50
    .word EventHandler_ACDC_Yai_Room_F50
    .word EventHandler_ACDC_Yai_Room_F50
    .word EventHandler_ACDC_Yai_Room_F50
    .word EventHandler_ACDC_Yai_Room_F54
    .word EventHandler_ACDC_Yai_Room_F50
    .word EventHandler_ACDC_Yai_Room_F50
    .word EventHandler_ACDC_Yai_Room_F50


_ts MapSetup_ACDC_Yai_Room_F50
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r0,PTR_BgTask_802EA28
    bl         BgTask_AddNew
    ldr        r7,PTR_PTR_DAT_0802ea2c
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_ACDC_Yai_Room_F50
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Yai_Room_F50_0_0802ea30
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_ACDC_Yai_Room_F50_0_0802e9e0:
    .word EventHandler_ACDC_Yai_Room_F50_0


_ts EventHandler_ACDC_Yai_Room_F50_0
    push       {lr}
    pop        {pc}


_ts MapSetup_ACDC_Yai_Room_F54
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r0,PTR_BgTask_802EA34
    bl         BgTask_AddNew
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_ACDC_Yai_Room_F54
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Yai_Room_F54_0_0802ea38
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_Yai_Room_F54_0_0802ea18:
    .word EventHandler_ACDC_Yai_Room_F54_0


_ts EventHandler_ACDC_Yai_Room_F54_0
    push       {lr}
    pop        {pc}
PTR_PTR_MapSetup_ACDC_Yai_Room_F50_0802ea20:
    .word PTR_MapSetup_ACDC_Yai_Room_F50_0802e94c
PTR_PTR_EventHandler_ACDC_Yai_Room_F50_0802ea24:
    .word PTR_EventHandler_ACDC_Yai_Room_F50_0802e988
PTR_BgTask_802EA28:
    .word BgTask_ACDC_Yai_Room_Tileset_Panel
PTR_PTR_DAT_0802ea2c:
    .word NPCList_8030A14
PTR_PTR_EventHandler_ACDC_Yai_Room_F50_0_0802ea30:
    .word PTR_EventHandler_ACDC_Yai_Room_F50_0_0802e9e0
PTR_BgTask_802EA34:
    .word BgTask_ACDC_Yai_Room_Tileset_Panel
PTR_PTR_EventHandler_ACDC_Yai_Room_F54_0_0802ea38:
    .word PTR_EventHandler_ACDC_Yai_Room_F54_0_0802ea18
