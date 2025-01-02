#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_School_Class_5B_S1
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_Default_08025744
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    Flag_GetBase 0x9A
    pop        {r5}
    beq        LAB_08025592
    mov        r0,#T_Incident_Occurrence
    bl         Sound_ChangeSong
    pop        {pc}
LAB_08025592:
    bl         Sound_AreaSongChange
    pop        {pc}
PTR_MapSetup_Default_08025598:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_School_Class_5B_F13
    .word MapSetup_School_Class_5B_F14
    .word MapSetup_School_Class_5B_F15
    .word MapSetup_Default
    .word MapSetup_Default


_ts EventHandler_School_Class_5B_S1
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Default_08025748
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_Default_080255c4:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_School_Class_5B_F13
    .word EventHandler_School_Class_5B_F14
    .word EventHandler_School_Class_5B_F15
    .word EventHandler_Default
    .word EventHandler_Default


_ts MapSetup_School_Class_5B_F13
    push       {lr}
    push       {r5}
    ldr        r0,PTR_BgTask_802574C
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8025750
    bl         BgTask_AddNew
    ldr        r0,PTR_EntityAllocParams_ARRAY_08025754
    bl         Entity_AllocList
    ldr        r7,PTR_PTR_DAT_08025758
    bl         Map_LoadNPCList
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    Flag_GetBase 0xA7
    pop        {r5}
    bne        LAB_08025620
    mov        r0,#0x0
    b          LAB_08025622
LAB_08025620:
    mov        r0,#0x4
LAB_08025622:
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_School_Class_5B_F13
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Class_5B_F13_0_0802575c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    mov        r1,#0x2
    bl         FUN_08024f0c
    pop        {pc}
PTR_EventHandler_School_Class_5B_F13_0_0802563c:
    .word EventHandler_School_Class_5B_F13_0
    .word EventHandler_School_Class_5B_F13_1


_ts EventHandler_School_Class_5B_F13_0
    push       {lr}
    push       {r5}
    Flag_GetBase 0xA7
    pop        {r5}
    beq        LAB_08025664
    push       {r5}
    mov        r1,#0x3
    ldr        r0,DAT_08025760
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}
LAB_08025664:
    pop        {pc}


_nt EventHandler_School_Class_5B_F13_1
    push       {lr}
    pop        {pc}


_nt MapSetup_School_Class_5B_F14
    push       {lr}
    push       {r5}
    ldr        r0,PTR_BgTask_8025764
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8025768
    bl         BgTask_AddNew
    ldr        r0,PTR_EntityAllocParams_ARRAY_0802576c
    bl         Entity_AllocList
    ldr        r7,PTR_PTR_DAT_08025770
    bl         Map_LoadNPCList
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    Flag_GetBase 0xB4
    pop        {r5}
    bne        LAB_080256a6
    mov        r0,#0x0
    b          LAB_080256a8
LAB_080256a6:
    mov        r0,#0x4
LAB_080256a8:
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_School_Class_5B_F14
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Class_5B_F14_0_08025774
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    mov        r1,#0x2
    bl         FUN_08024f0c
    pop        {pc}

    .align 2, 0

PTR_EventHandler_School_Class_5B_F14_0_080256c4:
    .word EventHandler_School_Class_5B_F14_0
    .word EventHandler_School_Class_5B_F14_1


_ts EventHandler_School_Class_5B_F14_0
    push       {lr}
    push       {r5}
    Flag_GetBase 0xAD
    pop        {r5}
    beq        LAB_080256ea
    push       {r5}
    mov        r1,#0x7
    ldr        r0,DAT_08025778
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080256ea:
    pop        {pc}


_ts EventHandler_School_Class_5B_F14_1
    push       {lr}
    pop        {pc}


_ts MapSetup_School_Class_5B_F15
    push       {lr}
    push       {r5}
    ldr        r0,PTR_BgTask_802577C
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8025780
    bl         BgTask_AddNew
    ldr        r0,PTR_EntityAllocParams_ARRAY_08025784
    bl         Entity_AllocList
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_PTR_DAT_08025788
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_School_Class_5B_F15
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Class_5B_F15_0_0802578c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    mov        r1,#0x2
    bl         FUN_08024f0c
    pop        {pc}
PTR_EventHandler_School_Class_5B_F15_0_0802573c:
    .word EventHandler_School_Class_5B_F15_0


_ts EventHandler_School_Class_5B_F15_0
    push       {lr}
    pop        {pc}
PTR_PTR_MapSetup_Default_08025744:
    .word PTR_MapSetup_Default_08025598
PTR_PTR_EventHandler_Default_08025748:
    .word PTR_EventHandler_Default_080255c4
PTR_BgTask_802574C:
    .word BgTask_School_TilesetBlackboardEvent
PTR_BgTask_8025750:
    .word BgTask_School_PaletteBlackboardOn
PTR_EntityAllocParams_ARRAY_08025754:
    .word EntityAllocParams_8029B18
PTR_PTR_DAT_08025758:
    .word NPCList_80292FC
PTR_PTR_EventHandler_School_Class_5B_F13_0_0802575c:
    .word PTR_EventHandler_School_Class_5B_F13_0_0802563c
DAT_08025760:
    .word Scene_ChangeMap
PTR_BgTask_8025764:
    .word BgTask_School_TilesetBlackboardEvent
PTR_BgTask_8025768:
    .word BgTask_School_PaletteBlackboardOn
PTR_EntityAllocParams_ARRAY_0802576c:
    .word EntityAllocParams_8029B18
PTR_PTR_DAT_08025770:
    .word NPCList_80292FC
PTR_PTR_EventHandler_School_Class_5B_F14_0_08025774:
    .word PTR_EventHandler_School_Class_5B_F14_0_080256c4
DAT_08025778:
    .word Scene_ChangeMap
PTR_BgTask_802577C:
    .word BgTask_School_TilesetBlackboardEvent
PTR_BgTask_8025780:
    .word BgTask_School_PaletteBlackboardOn
PTR_EntityAllocParams_ARRAY_08025784:
    .word EntityAllocParams_8029B18
PTR_PTR_DAT_08025788:
    .word NPCList_80292FC
PTR_PTR_EventHandler_School_Class_5B_F15_0_0802578c:
    .word PTR_EventHandler_School_Class_5B_F15_0_0802573c


_ts MapSetup_School_Class_5B_S2
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_School_Class_5B_F20_08025a38
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    Flag_GetBase 0xAB
    beq        LAB_080257ae
    push       {r5}
    mov        r0,#T_Incident_Occurrence
    bl         Sound_ChangeSong
    pop        {r5}
    b          LAB_080257c6
LAB_080257ae:
    Flag_GetBase 0xDF
    beq        LAB_080257c2
    push       {r5}
    mov        r0,#T_Suspicious_Mood
    bl         Sound_ChangeSong
    pop        {r5}
    b          LAB_080257c6
LAB_080257c2:
    bl         Sound_AreaSongChange
LAB_080257c6:
    pop        {pc}
PTR_MapSetup_School_Class_5B_F20_080257c8:
    .word MapSetup_School_Class_5B_F20
    .word MapSetup_School_Class_5B_F21
    .word MapSetup_School_Class_5B_F22
    .word MapSetup_Default
    .word MapSetup_School_Class_5B_F24
    .word MapSetup_School_Class_5B_F25
    .word MapSetup_School_Class_5B_F26
    .word MapSetup_School_Class_5B_F27


_ts EventHandler_School_Class_5B_S2
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Class_5B_F20_08025a3c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_Class_5B_F20_080257f4:
    .word EventHandler_School_Class_5B_F20
    .word EventHandler_School_Class_5B_F21
    .word EventHandler_School_Class_5B_F22
    .word EventHandler_Default
    .word EventHandler_School_Class_5B_F24
    .word EventHandler_School_Class_5B_F25
    .word EventHandler_School_Class_5B_F26
    .word EventHandler_School_Class_5B_F27


_ts MapSetup_School_Class_5B_F20
    push       {lr}
    push       {r5}
    ldr        r0,PTR_BgTask_8025A40
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8025A44
    bl         BgTask_AddNew
    ldr        r0,PTR_EntityAllocParams_ARRAY_08025a48
    bl         Entity_AllocList
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_PTR_DAT_08025a4c
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_School_Class_5B_F20
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Class_5B_F20_0_08025a50
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    mov        r1,#0x2
    bl         CheckJackIn_2
    pop        {pc}
PTR_EventHandler_School_Class_5B_F20_0_0802585c:
    .word EventHandler_School_Class_5B_F20_0


_ts EventHandler_School_Class_5B_F20_0
    push       {lr}
    pop        {pc}


_ts MapSetup_School_Class_5B_F21
    push       {lr}
    push       {r5}
    ldr        r0,PTR_BgTask_8025A54
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8025A58
    bl         BgTask_AddNew
    ldr        r0,PTR_EntityAllocParams_ARRAY_08025a5c
    bl         Entity_AllocList
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_PTR_DAT_08025a60
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_School_Class_5B_F21
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Class_5B_F21_0_08025a64
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    mov        r1,#0x2
    bl         CheckJackIn_2
    pop        {pc}
PTR_EventHandler_School_Class_5B_F21_0_080258ac:
    .word EventHandler_School_Class_5B_F21_0


_ts EventHandler_School_Class_5B_F21_0
    push       {lr}
    pop        {pc}


_ts MapSetup_School_Class_5B_F22
    push       {lr}
    push       {r5}
    ldr        r0,PTR_BgTask_8025A68
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8025A6C
    bl         BgTask_AddNew
    ldr        r0,PTR_EntityAllocParams_ARRAY_08025a70
    bl         Entity_AllocList
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_PTR_DAT_08025a74
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_School_Class_5B_F22
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Class_5B_F22_0_08025a78
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    mov        r1,#0x2
    bl         CheckJackIn_2
    pop        {pc}
PTR_EventHandler_School_Class_5B_F22_0_080258fc:
    .word EventHandler_School_Class_5B_F22_0


_ts EventHandler_School_Class_5B_F22_0
    push       {lr}
    pop        {pc}


_ts MapSetup_School_Class_5B_F24
    push       {lr}
    push       {r5}
    ldr        r0,PTR_BgTask_8025A7C
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8025A80
    bl         BgTask_AddNew
    ldr        r0,PTR_EntityAllocParams_ARRAY_08025a84
    bl         Entity_AllocList
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_PTR_DAT_08025a88
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_School_Class_5B_F24
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Class_5B_F24_0_08025a8c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    mov        r1,#0x2
    bl         CheckJackIn_2
    pop        {pc}
PTR_EventHandler_School_Class_5B_F24_0_0802594c:
    .word EventHandler_School_Class_5B_F24_0


_ts EventHandler_School_Class_5B_F24_0
    push       {lr}
    pop        {pc}


_ts MapSetup_School_Class_5B_F25
    push       {lr}
    push       {r5}
    ldr        r0,PTR_BgTask_8025A90
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8025A94
    bl         BgTask_AddNew
    ldr        r0,PTR_EntityAllocParams_ARRAY_08025a98
    bl         Entity_AllocList
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_School_Class_5B_F25
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Class_5B_F25_0_08025a9c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    mov        r1,#0x2
    bl         CheckJackIn_2
    pop        {pc}

    .align 2, 0

PTR_EventHandler_School_Class_5B_F25_0_08025998:
    .word EventHandler_School_Class_5B_F25_0


_ts EventHandler_School_Class_5B_F25_0
    push       {lr}
    pop        {pc}


_ts MapSetup_School_Class_5B_F26
    push       {lr}
    push       {r5}
    ldr        r0,PTR_BgTask_8025AA0
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8025AA4
    bl         BgTask_AddNew
    ldr        r0,PTR_EntityAllocParams_ARRAY_08025aa8
    bl         Entity_AllocList
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_School_Class_5B_F26
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Class_5B_F26_0_08025aac
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    mov        r1,#0x2
    bl         CheckJackIn_2
    pop        {pc}

    .align 2, 0

PTR_EventHandler_School_Class_5B_F26_0_080259e4:
    .word EventHandler_School_Class_5B_F26_0


_ts EventHandler_School_Class_5B_F26_0
    push       {lr}
    pop        {pc}


_ts MapSetup_School_Class_5B_F27
    push       {lr}
    push       {r5}
    ldr        r0,PTR_BgTask_8025AB0
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8025AB4
    bl         BgTask_AddNew
    ldr        r0,PTR_EntityAllocParams_ARRAY_08025ab8
    bl         Entity_AllocList
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_School_Class_5B_F27
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Class_5B_F27_0_08025abc
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    mov        r1,#0x2
    bl         CheckJackIn_2
    pop        {pc}

    .align 2, 0

PTR_EventHandler_School_Class_5B_F27_0_08025a30:
    .word EventHandler_School_Class_5B_F27_0


_ts EventHandler_School_Class_5B_F27_0
    push       {lr}
    pop        {pc}
PTR_PTR_MapSetup_School_Class_5B_F20_08025a38:
    .word PTR_MapSetup_School_Class_5B_F20_080257c8
PTR_PTR_EventHandler_School_Class_5B_F20_08025a3c:
    .word PTR_EventHandler_School_Class_5B_F20_080257f4
PTR_BgTask_8025A40:
    .word BgTask_School_TilesetBlackboardGraph
PTR_BgTask_8025A44:
    .word BgTask_School_PaletteBlackboardOn_2
PTR_EntityAllocParams_ARRAY_08025a48:
    .word EntityAllocParams_8029B18
PTR_PTR_DAT_08025a4c:
    .word NPCList_802937C
PTR_PTR_EventHandler_School_Class_5B_F20_0_08025a50:
    .word PTR_EventHandler_School_Class_5B_F20_0_0802585c
PTR_BgTask_8025A54:
    .word BgTask_School_TilesetBlackboardGraph
PTR_BgTask_8025A58:
    .word BgTask_School_PaletteBlackboardOn_2
PTR_EntityAllocParams_ARRAY_08025a5c:
    .word EntityAllocParams_8029B18
PTR_PTR_DAT_08025a60:
    .word NPCList_802937C
PTR_PTR_EventHandler_School_Class_5B_F21_0_08025a64:
    .word PTR_EventHandler_School_Class_5B_F21_0_080258ac
PTR_BgTask_8025A68:
    .word BgTask_School_TilesetBlackboardGraph
PTR_BgTask_8025A6C:
    .word BgTask_School_PaletteBlackboardOn_2
PTR_EntityAllocParams_ARRAY_08025a70:
    .word EntityAllocParams_8029B18
PTR_PTR_DAT_08025a74:
    .word NPCList_802937C
PTR_PTR_EventHandler_School_Class_5B_F22_0_08025a78:
    .word PTR_EventHandler_School_Class_5B_F22_0_080258fc
PTR_BgTask_8025A7C:
    .word BgTask_School_TilesetBlackboardGraph
PTR_BgTask_8025A80:
    .word BgTask_School_PaletteBlackboardOn_2
PTR_EntityAllocParams_ARRAY_08025a84:
    .word EntityAllocParams_8029B18
PTR_PTR_DAT_08025a88:
    .word NPCList_80293AC
PTR_PTR_EventHandler_School_Class_5B_F24_0_08025a8c:
    .word PTR_EventHandler_School_Class_5B_F24_0_0802594c
PTR_BgTask_8025A90:
    .word BgTask_School_TilesetBlackboardGraph
PTR_BgTask_8025A94:
    .word BgTask_School_PaletteBlackboardOn_2
PTR_EntityAllocParams_ARRAY_08025a98:
    .word EntityAllocParams_8029B18
PTR_PTR_EventHandler_School_Class_5B_F25_0_08025a9c:
    .word PTR_EventHandler_School_Class_5B_F25_0_08025998
PTR_BgTask_8025AA0:
    .word BgTask_School_TilesetBlackboardGraph
PTR_BgTask_8025AA4:
    .word BgTask_School_PaletteBlackboardOn_2
PTR_EntityAllocParams_ARRAY_08025aa8:
    .word EntityAllocParams_8029B18
PTR_PTR_EventHandler_School_Class_5B_F26_0_08025aac:
    .word PTR_EventHandler_School_Class_5B_F26_0_080259e4
PTR_BgTask_8025AB0:
    .word BgTask_School_TilesetBlackboardGraph
PTR_BgTask_8025AB4:
    .word BgTask_School_PaletteBlackboardOn_2
PTR_EntityAllocParams_ARRAY_08025ab8:
    .word EntityAllocParams_8029B18
PTR_PTR_EventHandler_School_Class_5B_F27_0_08025abc:
    .word PTR_EventHandler_School_Class_5B_F27_0_08025a30


_ts MapSetup_School_Class_5B_S3
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_School_Class_5B_F30_08025b68
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Sound_AreaSongChange
    pop        {pc}
PTR_MapSetup_School_Class_5B_F30_08025ad0:
    .word MapSetup_School_Class_5B_F30
    .word MapSetup_School_Class_5B_F30
    .word MapSetup_School_Class_5B_F30
    .word MapSetup_School_Class_5B_F30
    .word MapSetup_School_Class_5B_F30
    .word MapSetup_School_Class_5B_F30
    .word MapSetup_School_Class_5B_F30
    .word MapSetup_School_Class_5B_F30


_ts EventHandler_School_Class_5B_S3
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Class_5B_F30_08025b6c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_Class_5B_F30_08025afc:
    .word EventHandler_School_Class_5B_F30
    .word EventHandler_School_Class_5B_F30
    .word EventHandler_School_Class_5B_F30
    .word EventHandler_School_Class_5B_F30
    .word EventHandler_School_Class_5B_F30
    .word EventHandler_School_Class_5B_F30
    .word EventHandler_School_Class_5B_F30
    .word EventHandler_School_Class_5B_F30


_ts MapSetup_School_Class_5B_F30
    push       {lr}
    push       {r5}
    ldr        r0,PTR_BgTask_8025B70
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8025B74
    bl         BgTask_AddNew
    ldr        r0,PTR_EntityAllocParams_ARRAY_08025b78
    bl         Entity_AllocList
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_School_Class_5B_F30
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Class_5B_F30_0_08025b7c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    mov        r1,#0x2
    bl         CheckJackIn_2
    pop        {pc}

    .align 2, 0

PTR_EventHandler_School_Class_5B_F30_0_08025b60:
    .word EventHandler_School_Class_5B_F30_0


_ts EventHandler_School_Class_5B_F30_0
    push       {lr}
    pop        {pc}
PTR_PTR_MapSetup_School_Class_5B_F30_08025b68:
    .word PTR_MapSetup_School_Class_5B_F30_08025ad0
PTR_PTR_EventHandler_School_Class_5B_F30_08025b6c:
    .word PTR_EventHandler_School_Class_5B_F30_08025afc
PTR_BgTask_8025B70:
    .word BgTask_School_TilesetBlackboardGraph
PTR_BgTask_8025B74:
    .word BgTask_School_PaletteBlackboardOn_2
PTR_EntityAllocParams_ARRAY_08025b78:
    .word EntityAllocParams_8029B18
PTR_PTR_EventHandler_School_Class_5B_F30_0_08025b7c:
    .word PTR_EventHandler_School_Class_5B_F30_0_08025b60
