#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_Govt_Waterworks_Lobby_S2
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_Default_08032a30
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_8032A34
    bl         BgTask_AddNew
    ldr        r0,PTR_EntityAllocParams_8035C44_08032a38
    bl         Entity_AllocList
    pop        {r5}
    mov        r0,#0xab
    bl         Flag_GetBase
    beq        LAB_080327ae
    push       {r5}
    mov        r0,#0x4
    bl         Sound_ChangeSong
    pop        {r5}
    b          LAB_080327c6
LAB_080327ae:
    mov        r0,#0xdf
    bl         Flag_GetBase
    beq        LAB_080327c2
    push       {r5}
    mov        r0,#0x3
    bl         Sound_ChangeSong
    pop        {r5}
    b          LAB_080327c6
LAB_080327c2:
    bl         Sound_AreaSongChange
LAB_080327c6:
    pop        {pc}

PTR_MapSetup_Default_080327c8:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Govt_Waterworks_Lobby_F22
    .word MapSetup_Default
    .word MapSetup_Govt_Waterworks_Lobby_F24
    .word MapSetup_Govt_Waterworks_Lobby_F25
    .word MapSetup_Govt_Waterworks_Lobby_F26
    .word MapSetup_Govt_Waterworks_Lobby_F26


_ts EventHandler_Govt_Waterworks_Lobby_S2
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Default_08032a3c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r0,#0x40
    mov        r1,#0x21
    bl         CheckForJackIn
    mov        r0,#0x41
    mov        r1,#0x22
    bl         CheckForJackIn
    pop        {pc}

PTR_EventHandler_Default_08032804:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Govt_Waterworks_Lobby_F22
    .word EventHandler_Default
    .word EventHandler_Govt_Waterworks_Lobby_F24
    .word EventHandler_Govt_Waterworks_Lobby_F25
    .word EventHandler_Govt_Waterworks_Lobby_F26
    .word EventHandler_Govt_Waterworks_Lobby_F26


_ts MapSetup_Govt_Waterworks_Lobby_F22
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_8035C44_08032a40
    bl         Entity_AllocList
    pop        {r5}
    mov        r0,#0x2
    bl         Flag_SetGate
    push       {r5}
    ldr        r7,PTR_NPCList_803513C_08032a44
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Govt_Waterworks_Lobby_F22
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Waterworks_Lobby_F22_0_08032a48
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    bl         FUN_080329d0
    pop        {pc}

PTR_EventHandler_Govt_Waterworks_Lobby_F22_0_0803286c:
    .word EventHandler_Govt_Waterworks_Lobby_F22_0


_ts EventHandler_Govt_Waterworks_Lobby_F22_0
    push       {lr}
    pop        {pc}


_ts MapSetup_Govt_Waterworks_Lobby_F24
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_8035C44_08032a4c
    bl         Entity_AllocList
    pop        {r5}
    mov        r0,#0x2
    bl         Flag_SetGate
    mov        r0,#0xb9
    bl         Flag_GetBase
    bne        LAB_080328ae
    push       {r5}
    ldr        r7,PTR_NPCList_8035228_08032a50
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    b          LAB_080328d6
LAB_080328ae:
    push       {r5}
    ldr        r7,PTR_NPCList_8035254_08032a54
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0xbd
    bl         Flag_GetBase
    beq        LAB_080328d0
    mov        r0,#0xbe
    bl         Flag_GetBase
    bne        LAB_080328d4
    LoadMain world, r0, r0
    mov        r1,#0x0
    strb       r1,[r0,#0x7]
LAB_080328d0:
    mov        r0,#0x4
    b          LAB_080328d6
LAB_080328d4:
    mov        r0,#0x8
LAB_080328d6:
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_Govt_Waterworks_Lobby_F24
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Waterworks_Lobby_F24_0_08032a58
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    bl         FUN_080329d0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_Govt_Waterworks_Lobby_F24_0_080328f0:
    .word EventHandler_Govt_Waterworks_Lobby_F24_0
    .word EventHandler_Govt_Waterworks_Lobby_F24_1
    .word EventHandler_Govt_Waterworks_Lobby_F24_2


_ts EventHandler_Govt_Waterworks_Lobby_F24_0
    push       {lr}
    mov        r0,#0xb9
    bl         Flag_GetBase
    beq        LAB_08032916
    push       {r5}
    ldr        r0,PTR_Scene_Story_26_08032a5c
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08032916:
    pop        {pc}


_ts EventHandler_Govt_Waterworks_Lobby_F24_1
    push       {lr}
    mov        r0,#0xbd
    bl         Flag_GetBase
    beq        LAB_08032932
    push       {r5}
    ldr        r0,PTR_Scene_Story_27_08032a60
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x8
    strb       r0,[r5,#0x0]
LAB_08032932:
    pop        {pc}


_ts EventHandler_Govt_Waterworks_Lobby_F24_2
    push       {lr}
    pop        {pc}


_ts MapSetup_Govt_Waterworks_Lobby_F25
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_8035C44_08032a64
    bl         Entity_AllocList
    pop        {r5}
    mov        r0,#0x2
    bl         Flag_SetGate
    push       {r5}
    ldr        r7,PTR_NPCList_8035394_08032a68
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Govt_Waterworks_Lobby_F25
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Waterworks_Lobby_F25_0_08032a6c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    bl         FUN_080329d0
    pop        {pc}

PTR_EventHandler_Govt_Waterworks_Lobby_F25_0_08032980:
    .word EventHandler_Govt_Waterworks_Lobby_F25_0


_ts EventHandler_Govt_Waterworks_Lobby_F25_0
    push       {lr}
    pop        {pc}


_ts MapSetup_Govt_Waterworks_Lobby_F26
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_8035C44_08032a70
    bl         Entity_AllocList
    pop        {r5}
    mov        r0,#0x2
    bl         Flag_SetGate
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_Govt_Waterworks_Lobby_F26
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Waterworks_Lobby_F26_0_08032a74
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    bl         FUN_080329d0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_Govt_Waterworks_Lobby_F26_0_080329c8:
    .word EventHandler_Govt_Waterworks_Lobby_F26_0


_ts EventHandler_Govt_Waterworks_Lobby_F26_0
    push       {lr}
    pop        {pc}


_ts FUN_080329d0
    push       {lr}
    bl         Scene_IsSceneActive
    tst        r0,r0
    bne        LAB_08032a2e
    LoadMain world, r0, r7
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x20
    bne        LAB_08032a08
    mov        r0,#0x4
    bl         KeyItem_IsPresent
    bne        LAB_080329fa
    push       {r5}
    ldr        r0,PTR_Scene_Dialogue_08032a78
    mov        r1,#0x7
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_08032a2e
LAB_080329fa:
    push       {r5}
    ldr        r0,PTR_Scene_ChangeMap_08032a7c
    mov        r1,#0xd
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_08032a08:
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x3
    bne        LAB_08032a2e
    push       {r5}
    mov        r1,#0x8
    lsl        r1,r1,#0x8
    mov        r0,#0x5
    orr        r1,r0
    ldr        r0,PTR_Scene_LockedPath_08032a80
    bl         Scene_Prepare
    pop        {r5}
LAB_08032a2e:
    pop        {pc}

PTR_PTR_MapSetup_Default_08032a30:
    .word PTR_MapSetup_Default_080327c8

PTR_BgTask_8032A34:
    .word BgTask_80311A0

PTR_EntityAllocParams_8035C44_08032a38:
    .word EntityAllocParams_8035C44

PTR_PTR_EventHandler_Default_08032a3c:
    .word PTR_EventHandler_Default_08032804

PTR_EntityAllocParams_8035C44_08032a40:
    .word EntityAllocParams_8035C44

PTR_NPCList_803513C_08032a44:
    .word NPCList_803513C

PTR_PTR_EventHandler_Govt_Waterworks_Lobby_F22_0_08032a48:
    .word PTR_EventHandler_Govt_Waterworks_Lobby_F22_0_0803286c

PTR_EntityAllocParams_8035C44_08032a4c:
    .word EntityAllocParams_8035C44

PTR_NPCList_8035228_08032a50:
    .word NPCList_8035228

PTR_NPCList_8035254_08032a54:
    .word NPCList_8035254

PTR_PTR_EventHandler_Govt_Waterworks_Lobby_F24_0_08032a58:
    .word PTR_EventHandler_Govt_Waterworks_Lobby_F24_0_080328f0

PTR_Scene_Story_26_08032a5c:
    .word Scene_Story_26

PTR_Scene_Story_27_08032a60:
    .word Scene_Story_27

PTR_EntityAllocParams_8035C44_08032a64:
    .word EntityAllocParams_8035C44

PTR_NPCList_8035394_08032a68:
    .word NPCList_8035394

PTR_PTR_EventHandler_Govt_Waterworks_Lobby_F25_0_08032a6c:
    .word PTR_EventHandler_Govt_Waterworks_Lobby_F25_0_08032980

PTR_EntityAllocParams_8035C44_08032a70:
    .word EntityAllocParams_8035C44

PTR_PTR_EventHandler_Govt_Waterworks_Lobby_F26_0_08032a74:
    .word PTR_EventHandler_Govt_Waterworks_Lobby_F26_0_080329c8

PTR_Scene_Dialogue_08032a78:
    .word Scene_Dialogue

PTR_Scene_ChangeMap_08032a7c:
    .word Scene_ChangeMap

PTR_Scene_LockedPath_08032a80:
    .word Scene_LockedPath


_ts MapSetup_Govt_Waterworks_Lobby_S3
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_Govt_Waterworks_Lobby_F30_08032bb0
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_8032BB4
    bl         BgTask_AddNew
    ldr        r0,PTR_EntityAllocParams_8035C44_08032bb8
    bl         Entity_AllocList
    pop        {r5}
    bl         Sound_AreaSongChange
    pop        {pc}

PTR_MapSetup_Govt_Waterworks_Lobby_F30_08032aa4:
    .word MapSetup_Govt_Waterworks_Lobby_F30
    .word MapSetup_Govt_Waterworks_Lobby_F30
    .word MapSetup_Govt_Waterworks_Lobby_F30
    .word MapSetup_Govt_Waterworks_Lobby_F30
    .word MapSetup_Govt_Waterworks_Lobby_F30
    .word MapSetup_Govt_Waterworks_Lobby_F30
    .word MapSetup_Govt_Waterworks_Lobby_F30
    .word MapSetup_Govt_Waterworks_Lobby_F30


_ts EventHandler_Govt_Waterworks_Lobby_S3
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Waterworks_Lobby_F30_08032bbc
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r0,#0x40
    mov        r1,#0x21
    bl         CheckForJackIn
    mov        r0,#0x41
    mov        r1,#0x22
    bl         CheckForJackIn
    pop        {pc}

PTR_EventHandler_Govt_Waterworks_Lobby_F30_08032ae0:
    .word EventHandler_Govt_Waterworks_Lobby_F30
    .word EventHandler_Govt_Waterworks_Lobby_F30
    .word EventHandler_Govt_Waterworks_Lobby_F30
    .word EventHandler_Govt_Waterworks_Lobby_F30
    .word EventHandler_Govt_Waterworks_Lobby_F30
    .word EventHandler_Govt_Waterworks_Lobby_F30
    .word EventHandler_Govt_Waterworks_Lobby_F30
    .word EventHandler_Govt_Waterworks_Lobby_F30


_ts MapSetup_Govt_Waterworks_Lobby_F30
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_8035C44_08032bc0
    bl         Entity_AllocList
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_8035158_08032bc4
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x2
    bl         Flag_SetGate
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Govt_Waterworks_Lobby_F30
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Waterworks_Lobby_F30_0_08032bc8
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    bl         FUN_08032b50
    pop        {pc}

PTR_EventHandler_Govt_Waterworks_Lobby_F30_0_08032b48:
    .word EventHandler_Govt_Waterworks_Lobby_F30_0


_ts EventHandler_Govt_Waterworks_Lobby_F30_0
    push       {lr}
    pop        {pc}


_ts FUN_08032b50
    push       {lr}
    bl         Scene_IsSceneActive
    tst        r0,r0
    bne        LAB_08032bae
    LoadMain world, r0, r7
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x20
    bne        LAB_08032b88
    mov        r0,#0x4
    bl         KeyItem_IsPresent
    bne        LAB_08032b7a
    push       {r5}
    ldr        r0,PTR_Scene_Dialogue_08032bcc
    mov        r1,#0x7
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_08032bae
LAB_08032b7a:
    push       {r5}
    ldr        r0,PTR_Scene_ChangeMap_08032bd0
    mov        r1,#0xd
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_08032b88:
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x3
    bne        LAB_08032bae
    push       {r5}
    mov        r1,#0x8
    lsl        r1,r1,#0x8
    mov        r0,#0x5
    orr        r1,r0
    ldr        r0,PTR_Scene_LockedPath_08032bd4
    bl         Scene_Prepare
    pop        {r5}
LAB_08032bae:
    pop        {pc}

PTR_PTR_MapSetup_Govt_Waterworks_Lobby_F30_08032bb0:
    .word PTR_MapSetup_Govt_Waterworks_Lobby_F30_08032aa4

PTR_BgTask_8032BB4:
    .word BgTask_80311A0

PTR_EntityAllocParams_8035C44_08032bb8:
    .word EntityAllocParams_8035C44

PTR_PTR_EventHandler_Govt_Waterworks_Lobby_F30_08032bbc:
    .word PTR_EventHandler_Govt_Waterworks_Lobby_F30_08032ae0

PTR_EntityAllocParams_8035C44_08032bc0:
    .word EntityAllocParams_8035C44

PTR_NPCList_8035158_08032bc4:
    .word NPCList_8035158

PTR_PTR_EventHandler_Govt_Waterworks_Lobby_F30_0_08032bc8:
    .word PTR_EventHandler_Govt_Waterworks_Lobby_F30_0_08032b48

PTR_Scene_Dialogue_08032bcc:
    .word Scene_Dialogue

PTR_Scene_ChangeMap_08032bd0:
    .word Scene_ChangeMap

PTR_Scene_LockedPath_08032bd4:
    .word Scene_LockedPath


_ts MapSetup_Govt_Waterworks_Lobby_S4
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_Govt_Waterworks_Lobby_F40_08032d04
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_8032D08
    bl         BgTask_AddNew
    ldr        r0,PTR_EntityAllocParams_8035C44_08032d0c
    bl         Entity_AllocList
    pop        {r5}
    bl         Sound_AreaSongChange
    pop        {pc}

PTR_MapSetup_Govt_Waterworks_Lobby_F40_08032bf8:
    .word MapSetup_Govt_Waterworks_Lobby_F40
    .word MapSetup_Govt_Waterworks_Lobby_F40
    .word MapSetup_Govt_Waterworks_Lobby_F40
    .word MapSetup_Govt_Waterworks_Lobby_F40
    .word MapSetup_Govt_Waterworks_Lobby_F40
    .word MapSetup_Govt_Waterworks_Lobby_F40
    .word MapSetup_Govt_Waterworks_Lobby_F40
    .word MapSetup_Govt_Waterworks_Lobby_F40


_ts EventHandler_Govt_Waterworks_Lobby_S4
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Waterworks_Lobby_F40_08032d10
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r0,#0x40
    mov        r1,#0x21
    bl         CheckForJackIn
    mov        r0,#0x41
    mov        r1,#0x22
    bl         CheckForJackIn
    pop        {pc}

PTR_EventHandler_Govt_Waterworks_Lobby_F40_08032c34:
    .word EventHandler_Govt_Waterworks_Lobby_F40
    .word EventHandler_Govt_Waterworks_Lobby_F40
    .word EventHandler_Govt_Waterworks_Lobby_F40
    .word EventHandler_Govt_Waterworks_Lobby_F40
    .word EventHandler_Govt_Waterworks_Lobby_F40
    .word EventHandler_Govt_Waterworks_Lobby_F40
    .word EventHandler_Govt_Waterworks_Lobby_F40
    .word EventHandler_Govt_Waterworks_Lobby_F40


_ts MapSetup_Govt_Waterworks_Lobby_F40
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_8035C44_08032d14
    bl         Entity_AllocList
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_8035158_08032d18
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x2
    bl         Flag_SetGate
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Govt_Waterworks_Lobby_F40
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Waterworks_Lobby_F40_0_08032d1c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    bl         FUN_08032ca4
    pop        {pc}

PTR_EventHandler_Govt_Waterworks_Lobby_F40_0_08032c9c:
    .word EventHandler_Govt_Waterworks_Lobby_F40_0


_ts EventHandler_Govt_Waterworks_Lobby_F40_0
    push       {lr}
    pop        {pc}


_ts FUN_08032ca4
    push       {lr}
    bl         Scene_IsSceneActive
    tst        r0,r0
    bne        LAB_08032d02
    LoadMain world, r0, r7
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x20
    bne        LAB_08032cdc
    mov        r0,#0x4
    bl         KeyItem_IsPresent
    bne        LAB_08032cce
    push       {r5}
    ldr        r0,PTR_Scene_Dialogue_08032d20
    mov        r1,#0x7
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_08032d02
LAB_08032cce:
    push       {r5}
    ldr        r0,PTR_Scene_ChangeMap_08032d24
    mov        r1,#0xd
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_08032cdc:
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x3
    bne        LAB_08032d02
    push       {r5}
    mov        r1,#0x8
    lsl        r1,r1,#0x8
    mov        r0,#0x5
    orr        r1,r0
    ldr        r0,PTR_Scene_LockedPath_08032d28
    bl         Scene_Prepare
    pop        {r5}
LAB_08032d02:
    pop        {pc}

PTR_PTR_MapSetup_Govt_Waterworks_Lobby_F40_08032d04:
    .word PTR_MapSetup_Govt_Waterworks_Lobby_F40_08032bf8

PTR_BgTask_8032D08:
    .word BgTask_80311A0

PTR_EntityAllocParams_8035C44_08032d0c:
    .word EntityAllocParams_8035C44

PTR_PTR_EventHandler_Govt_Waterworks_Lobby_F40_08032d10:
    .word PTR_EventHandler_Govt_Waterworks_Lobby_F40_08032c34

PTR_EntityAllocParams_8035C44_08032d14:
    .word EntityAllocParams_8035C44

PTR_NPCList_8035158_08032d18:
    .word NPCList_8035158

PTR_PTR_EventHandler_Govt_Waterworks_Lobby_F40_0_08032d1c:
    .word PTR_EventHandler_Govt_Waterworks_Lobby_F40_0_08032c9c

PTR_Scene_Dialogue_08032d20:
    .word Scene_Dialogue

PTR_Scene_ChangeMap_08032d24:
    .word Scene_ChangeMap

PTR_Scene_LockedPath_08032d28:
    .word Scene_LockedPath


_ts MapSetup_Govt_Waterworks_Lobby_S5
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_Govt_Waterworks_Lobby_F50_08032e98
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_8032E9C
    bl         BgTask_AddNew
    ldr        r0,PTR_EntityAllocParams_8035C44_08032ea0
    bl         Entity_AllocList
    pop        {r5}
    bl         Sound_AreaSongChange
    pop        {pc}

PTR_MapSetup_Govt_Waterworks_Lobby_F50_08032d4c:
    .word MapSetup_Govt_Waterworks_Lobby_F50
    .word MapSetup_Govt_Waterworks_Lobby_F50
    .word MapSetup_Govt_Waterworks_Lobby_F50
    .word MapSetup_Govt_Waterworks_Lobby_F53
    .word MapSetup_Govt_Waterworks_Lobby_F53
    .word MapSetup_Govt_Waterworks_Lobby_F50
    .word MapSetup_Govt_Waterworks_Lobby_F50
    .word MapSetup_Govt_Waterworks_Lobby_F50


_ts EventHandler_Govt_Waterworks_Lobby_S5
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Waterworks_Lobby_F50_08032ea4
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r0,#0x40
    mov        r1,#0x21
    bl         CheckForJackIn
    mov        r0,#0x41
    mov        r1,#0x22
    bl         CheckForJackIn
    pop        {pc}

PTR_EventHandler_Govt_Waterworks_Lobby_F50_08032d88:
    .word EventHandler_Govt_Waterworks_Lobby_F50
    .word EventHandler_Govt_Waterworks_Lobby_F50
    .word EventHandler_Govt_Waterworks_Lobby_F50
    .word EventHandler_Govt_Waterworks_Lobby_F53
    .word EventHandler_Govt_Waterworks_Lobby_F53
    .word EventHandler_Govt_Waterworks_Lobby_F50
    .word EventHandler_Govt_Waterworks_Lobby_F50
    .word EventHandler_Govt_Waterworks_Lobby_F50


_ts MapSetup_Govt_Waterworks_Lobby_F50
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_NPCList_80353CC_08032ea8
    bl         Map_LoadNPCList
    ldr        r0,PTR_EntityAllocParams_8035C44_08032eac
    bl         Entity_AllocList
    pop        {r5}
    mov        r0,#0x2
    bl         Flag_SetGate
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Govt_Waterworks_Lobby_F50
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Waterworks_Lobby_F50_0_08032eb0
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    bl         FUN_08032e38
    pop        {pc}

PTR_EventHandler_Govt_Waterworks_Lobby_F50_0_08032de8:
    .word EventHandler_Govt_Waterworks_Lobby_F50_0


_ts EventHandler_Govt_Waterworks_Lobby_F50_0
    push       {lr}
    pop        {pc}


_ts MapSetup_Govt_Waterworks_Lobby_F53
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_NPCList_80353CC_08032eb4
    bl         Map_LoadNPCList
    ldr        r0,PTR_EntityAllocParams_8035C44_08032eb8
    bl         Entity_AllocList
    pop        {r5}
    mov        r0,#0x2
    bl         Flag_SetGate
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Govt_Waterworks_Lobby_F53
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Waterworks_Lobby_F53_0_08032ebc
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    bl         FUN_08032e38
    pop        {pc}

PTR_EventHandler_Govt_Waterworks_Lobby_F53_0_08032e30:
    .word EventHandler_Govt_Waterworks_Lobby_F53_0


_ts EventHandler_Govt_Waterworks_Lobby_F53_0
    push       {lr}
    pop        {pc}


_ts FUN_08032e38
    push       {lr}
    bl         Scene_IsSceneActive
    tst        r0,r0
    bne        LAB_08032e96
    LoadMain world, r0, r7
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x20
    bne        LAB_08032e70
    mov        r0,#0x4
    bl         KeyItem_IsPresent
    bne        LAB_08032e62
    push       {r5}
    ldr        r0,PTR_Scene_Dialogue_08032ec0
    mov        r1,#0x7
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_08032e96
LAB_08032e62:
    push       {r5}
    ldr        r0,PTR_Scene_ChangeMap_08032ec4
    mov        r1,#0xd
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_08032e70:
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x3
    bne        LAB_08032e96
    push       {r5}
    mov        r1,#0x8
    lsl        r1,r1,#0x8
    mov        r0,#0x5
    orr        r1,r0
    ldr        r0,PTR_Scene_LockedPath_08032ec8
    bl         Scene_Prepare
    pop        {r5}
LAB_08032e96:
    pop        {pc}

PTR_PTR_MapSetup_Govt_Waterworks_Lobby_F50_08032e98:
    .word PTR_MapSetup_Govt_Waterworks_Lobby_F50_08032d4c

PTR_BgTask_8032E9C:
    .word BgTask_80311A0

PTR_EntityAllocParams_8035C44_08032ea0:
    .word EntityAllocParams_8035C44

PTR_PTR_EventHandler_Govt_Waterworks_Lobby_F50_08032ea4:
    .word PTR_EventHandler_Govt_Waterworks_Lobby_F50_08032d88

PTR_NPCList_80353CC_08032ea8:
    .word NPCList_80353CC

PTR_EntityAllocParams_8035C44_08032eac:
    .word EntityAllocParams_8035C44

PTR_PTR_EventHandler_Govt_Waterworks_Lobby_F50_0_08032eb0:
    .word PTR_EventHandler_Govt_Waterworks_Lobby_F50_0_08032de8

PTR_NPCList_80353CC_08032eb4:
    .word NPCList_80353CC

PTR_EntityAllocParams_8035C44_08032eb8:
    .word EntityAllocParams_8035C44

PTR_PTR_EventHandler_Govt_Waterworks_Lobby_F53_0_08032ebc:
    .word PTR_EventHandler_Govt_Waterworks_Lobby_F53_0_08032e30

PTR_Scene_Dialogue_08032ec0:
    .word Scene_Dialogue

PTR_Scene_ChangeMap_08032ec4:
    .word Scene_ChangeMap

PTR_Scene_LockedPath_08032ec8:
    .word Scene_LockedPath
