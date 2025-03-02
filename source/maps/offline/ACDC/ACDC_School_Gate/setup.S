#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_ACDC_School_Gate_S2
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_ACDC_School_Gate_F20_0802bb6c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    Flag_GetBase 0xAB
    beq        LAB_0802b906
    push       {r5}
    mov        r0,#T_Incident_Occurrence
    bl         Sound_PlayBGM
    pop        {r5}
    b          LAB_0802b91e
LAB_0802b906:
    Flag_GetBase 0xDF
    beq        LAB_0802b91a
    push       {r5}
    mov        r0,#T_Suspicious_Mood
    bl         Sound_PlayBGM
    pop        {r5}
    b          LAB_0802b91e
LAB_0802b91a:
    bl         Sound_AreaSongChange
LAB_0802b91e:
    push       {r5}
    Flag_SetGate F_GATE_02
    pop        {r5}
    pop        {pc}

    .align 2, 0

PTR_MapSetup_ACDC_School_Gate_F20_0802b92c:
    .word MapSetup_ACDC_School_Gate_F20
    .word MapSetup_ACDC_School_Gate_F20
    .word MapSetup_ACDC_School_Gate_F20
    .word MapSetup_ACDC_School_Gate_F23
    .word MapSetup_ACDC_School_Gate_F24
    .word MapSetup_ACDC_School_Gate_F24
    .word MapSetup_ACDC_School_Gate_F25
    .word MapSetup_ACDC_School_Gate_F25


_ts EventHandler_ACDC_School_Gate_S2
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_School_Gate_F20_0802bb70
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r0,#0x40
    mov        r1,#0x20
    bl         CheckForJackIn
    pop        {pc}
PTR_EventHandler_ACDC_School_Gate_F20_0802b960:
    .word EventHandler_ACDC_School_Gate_F20
    .word EventHandler_ACDC_School_Gate_F20
    .word EventHandler_ACDC_School_Gate_F20
    .word EventHandler_ACDC_School_Gate_F23
    .word EventHandler_ACDC_School_Gate_F24
    .word EventHandler_ACDC_School_Gate_F24
    .word EventHandler_ACDC_School_Gate_F26
    .word EventHandler_ACDC_School_Gate_F26


_ts MapSetup_ACDC_School_Gate_F20
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_PTR_DAT_0802bb74
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_BgTask_802BB78
    bl         BgTask_AddNew
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_DAT_0802bb7c
    bl         Entity_AllocList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_ACDC_School_Gate_F20
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_School_Gate_F20_0_0802bb80
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_School_Gate_F20_0_0802b9c8:
    .word EventHandler_ACDC_School_Gate_F20_0


_ts EventHandler_ACDC_School_Gate_F20_0
    push       {lr}
    pop        {pc}


_ts MapSetup_ACDC_School_Gate_F23
    push       {lr}
    push       {r5}
    ldr        r0,PTR_BgTask_802BB84
    bl         BgTask_AddNew
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_DAT_0802bb88
    bl         Entity_AllocList
    pop        {r5}
    Flag_SetGate F_GATE_00
    Flag_GetBase 0xA3
    bne        LAB_0802ba14
    push       {r5}
    ldr        r7,PTR_PTR_DAT_0802bb8c
    bl         Map_LoadNPCList
    pop        {r5}
    LoadMain world, r0, r0
    mov        r1,#0x0
    strb       r1,[r0,#World_fadeType]
    push       {r5}
    bl         PlayerLocation_Create
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}
LAB_0802ba14:
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    mov        r0,#0x4
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_ACDC_School_Gate_F23
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_School_Gate_F23_0_0802bb90
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_School_Gate_F23_0_0802ba3c:
    .word EventHandler_ACDC_School_Gate_F23_0
    .word EventHandler_ACDC_School_Gate_F23_1


_ts EventHandler_ACDC_School_Gate_F23_0
    push       {lr}
    push       {r5}
    ldr        r0,PTR_Scene_Story_24_0802bb94
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_ACDC_School_Gate_F23_1
    push       {lr}
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#World_playerLocation]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x1
    bne        LAB_0802ba7a
    push       {r5}
    ldr        r0,PTR_Scene_LockedPath_0802bb98
    ldr        r1,INT_0802bb9c
    bl         Scene_Prepare
    pop        {r5}
LAB_0802ba7a:
    pop        {pc}


_ts MapSetup_ACDC_School_Gate_F24
    push       {lr}
    push       {r5}
    ldr        r0,PTR_BgTask_802BBA0
    bl         BgTask_AddNew
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_DAT_0802bba4
    bl         Entity_AllocList
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_PTR_DAT_0802bba8
    bl         Map_LoadNPCList
    pop        {r5}
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


_ts EventHandler_ACDC_School_Gate_F24
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_School_Gate_F24_0_0802bbac
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_School_Gate_F24_0_0802bac4:
    .word EventHandler_ACDC_School_Gate_F24_0


_ts EventHandler_ACDC_School_Gate_F24_0
    push       {lr}
    pop        {pc}


_ts MapSetup_ACDC_School_Gate_F25
    push       {lr}
    push       {r5}
    ldr        r0,PTR_DAT_0802bbb0
    bl         Entity_AllocList
    pop        {r5}
    push       {r5}
    Flag_GetBase 0xAB
    pop        {r5}
    bne        LAB_0802bb0a
    LoadMain world, r0, r0
    mov        r1,#0x0
    strb       r1,[r0,#World_fadeType]
    push       {r5}
    bl         PlayerLocation_Create
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_BgTask_802BBB4
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_802BBB8
    bl         BgTask_AddNew
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}
LAB_0802bb0a:
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_BgTask_802BBBC
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_802BBC0
    bl         BgTask_AddNew
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_PTR_0802bbc4
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x4
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_ACDC_School_Gate_F26
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_School_Gate_F26_0_0802bbc8
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_School_Gate_F26_0_0802bb4c:
    .word EventHandler_ACDC_School_Gate_F26_0
    .word EventHandler_ACDC_School_Gate_F26_1


_ts EventHandler_ACDC_School_Gate_F26_0
    push       {lr}
    push       {r5}
    ldr        r0,PTR_Scene_Story_2E_0802bbcc
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_ACDC_School_Gate_F26_1
    push       {lr}
    pop        {pc}
PTR_PTR_MapSetup_ACDC_School_Gate_F20_0802bb6c:
    .word PTR_MapSetup_ACDC_School_Gate_F20_0802b92c
PTR_PTR_EventHandler_ACDC_School_Gate_F20_0802bb70:
    .word PTR_EventHandler_ACDC_School_Gate_F20_0802b960
PTR_PTR_DAT_0802bb74:
    .word NPCList_8030398
PTR_BgTask_802BB78:
    .word BgTask_8029FEC
PTR_DAT_0802bb7c:
    .word EntityAllocParams_8030D80
PTR_PTR_EventHandler_ACDC_School_Gate_F20_0_0802bb80:
    .word PTR_EventHandler_ACDC_School_Gate_F20_0_0802b9c8
PTR_BgTask_802BB84:
    .word BgTask_802A004
PTR_DAT_0802bb88:
    .word EntityAllocParams_8030D80
PTR_PTR_DAT_0802bb8c:
    .word NPCList_80303D0
PTR_PTR_EventHandler_ACDC_School_Gate_F23_0_0802bb90:
    .word PTR_EventHandler_ACDC_School_Gate_F23_0_0802ba3c
PTR_Scene_Story_24_0802bb94:
    .word Scene_Story_24
PTR_Scene_LockedPath_0802bb98:
    .word Scene_LockedPath
INT_0802bb9c:
    .word 0x1501
PTR_BgTask_802BBA0:
    .word BgTask_802A004
PTR_DAT_0802bba4:
    .word EntityAllocParams_8030D80
PTR_PTR_DAT_0802bba8:
    .word NPCList_80304A4
PTR_PTR_EventHandler_ACDC_School_Gate_F24_0_0802bbac:
    .word PTR_EventHandler_ACDC_School_Gate_F24_0_0802bac4
PTR_DAT_0802bbb0:
    .word EntityAllocParams_8030D80
PTR_BgTask_802BBB4:
    .word BgTask_8029FEC
PTR_BgTask_802BBB8:
    .word BgTask_802A01C
PTR_BgTask_802BBBC:
    .word BgTask_8029FEC
PTR_BgTask_802BBC0:
    .word BgTask_802A01C
PTR_PTR_0802bbc4:
    .word NPCList_8030534
PTR_PTR_EventHandler_ACDC_School_Gate_F26_0_0802bbc8:
    .word PTR_EventHandler_ACDC_School_Gate_F26_0_0802bb4c
PTR_Scene_Story_2E_0802bbcc:
    .word Scene_Story_2E


_ts MapSetup_ACDC_School_Gate_S3
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_ACDC_School_Gate_F30_0802bc90
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Sound_AreaSongChange
    push       {r5}
    Flag_SetGate F_GATE_02
    pop        {r5}
    pop        {pc}

    .align 2, 0

PTR_MapSetup_ACDC_School_Gate_F30_0802bbec:
    .word MapSetup_ACDC_School_Gate_F30
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default


_ts EventHandler_ACDC_School_Gate_S3
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_School_Gate_F30_0802bc94
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r0,#0x40
    mov        r1,#0x20
    bl         CheckForJackIn
    pop        {pc}
PTR_EventHandler_ACDC_School_Gate_F30_0802bc20:
    .word EventHandler_ACDC_School_Gate_F30
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default


_ts MapSetup_ACDC_School_Gate_F30
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_PTR_DAT_0802bc98
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_BgTask_802BC9C
    bl         BgTask_AddNew
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_DAT_0802bca0
    bl         Entity_AllocList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_ACDC_School_Gate_F30
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_School_Gate_F30_0_0802bca4
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_School_Gate_F30_0_0802bc88:
    .word EventHandler_ACDC_School_Gate_F30_0


_ts EventHandler_ACDC_School_Gate_F30_0
    push       {lr}
    pop        {pc}
PTR_PTR_MapSetup_ACDC_School_Gate_F30_0802bc90:
    .word PTR_MapSetup_ACDC_School_Gate_F30_0802bbec
PTR_PTR_EventHandler_ACDC_School_Gate_F30_0802bc94:
    .word PTR_EventHandler_ACDC_School_Gate_F30_0802bc20
PTR_PTR_DAT_0802bc98:
    .word NPCList_8030558
PTR_BgTask_802BC9C:
    .word BgTask_8029FEC
PTR_DAT_0802bca0:
    .word EntityAllocParams_8030D80
PTR_PTR_EventHandler_ACDC_School_Gate_F30_0_0802bca4:
    .word PTR_EventHandler_ACDC_School_Gate_F30_0_0802bc88


_ts MapSetup_ACDC_School_Gate_S4
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_ACDC_School_Gate_F40_0802bd68
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Sound_AreaSongChange
    push       {r5}
    Flag_SetGate F_GATE_02
    pop        {r5}
    pop        {pc}

    .align 2, 0

PTR_MapSetup_ACDC_School_Gate_F40_0802bcc4:
    .word MapSetup_ACDC_School_Gate_F40
    .word MapSetup_ACDC_School_Gate_F40
    .word MapSetup_ACDC_School_Gate_F40
    .word MapSetup_ACDC_School_Gate_F40
    .word MapSetup_ACDC_School_Gate_F40
    .word MapSetup_ACDC_School_Gate_F40
    .word MapSetup_ACDC_School_Gate_F40
    .word MapSetup_ACDC_School_Gate_F40


_ts EventHandler_ACDC_School_Gate_S4
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_School_Gate_F40_0802bd6c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r0,#0x40
    mov        r1,#0x20
    bl         CheckForJackIn
    pop        {pc}
PTR_EventHandler_ACDC_School_Gate_F40_0802bcf8:
    .word EventHandler_ACDC_School_Gate_F40
    .word EventHandler_ACDC_School_Gate_F40
    .word EventHandler_ACDC_School_Gate_F40
    .word EventHandler_ACDC_School_Gate_F40
    .word EventHandler_ACDC_School_Gate_F40
    .word EventHandler_ACDC_School_Gate_F40
    .word EventHandler_ACDC_School_Gate_F40
    .word EventHandler_ACDC_School_Gate_F40


_ts MapSetup_ACDC_School_Gate_F40
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_BgTask_802BD70
    bl         BgTask_AddNew
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_DAT_0802bd74
    bl         Entity_AllocList
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_PTR_DAT_0802bd78
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_ACDC_School_Gate_F40
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_School_Gate_F40_0_0802bd7c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_School_Gate_F40_0_0802bd60:
    .word EventHandler_ACDC_School_Gate_F40_0


_ts EventHandler_ACDC_School_Gate_F40_0
    push       {lr}
    pop        {pc}
PTR_PTR_MapSetup_ACDC_School_Gate_F40_0802bd68:
    .word PTR_MapSetup_ACDC_School_Gate_F40_0802bcc4
PTR_PTR_EventHandler_ACDC_School_Gate_F40_0802bd6c:
    .word PTR_EventHandler_ACDC_School_Gate_F40_0802bcf8
PTR_BgTask_802BD70:
    .word BgTask_8029FEC
PTR_DAT_0802bd74:
    .word EntityAllocParams_8030D80
PTR_PTR_DAT_0802bd78:
    .word NPCList_8030558
PTR_PTR_EventHandler_ACDC_School_Gate_F40_0_0802bd7c:
    .word PTR_EventHandler_ACDC_School_Gate_F40_0_0802bd60


_ts MapSetup_ACDC_School_Gate_S5
    push       {lr}
    push       {r0,r1}
    bl         Sound_AreaSongChange
    pop        {r0,r1}
    ldr        r0,PTR_PTR_MapSetup_ACDC_School_Gate_F50_0802bf4c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_MapSetup_ACDC_School_Gate_F50_0802bd94:
    .word MapSetup_ACDC_School_Gate_F50
    .word MapSetup_ACDC_School_Gate_F50
    .word MapSetup_ACDC_School_Gate_F50
    .word MapSetup_ACDC_School_Gate_F53
    .word MapSetup_ACDC_School_Gate_F54
    .word MapSetup_ACDC_School_Gate_F54
    .word MapSetup_ACDC_School_Gate_F54
    .word MapSetup_ACDC_School_Gate_F54


_ts EventHandler_ACDC_School_Gate_S5
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_School_Gate_F50_0802bf50
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r0,#0x40
    mov        r1,#0x20
    bl         CheckForJackIn
    pop        {pc}
PTR_EventHandler_ACDC_School_Gate_F50_0802bdc8:
    .word EventHandler_ACDC_School_Gate_F50
    .word EventHandler_ACDC_School_Gate_F50
    .word EventHandler_ACDC_School_Gate_F50
    .word EventHandler_ACDC_School_Gate_F53
    .word EventHandler_ACDC_School_Gate_F54
    .word EventHandler_ACDC_School_Gate_F54
    .word EventHandler_ACDC_School_Gate_F54
    .word EventHandler_ACDC_School_Gate_F54


_ts MapSetup_ACDC_School_Gate_F50
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_BgTask_802BF54
    bl         BgTask_AddNew
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_DAT_0802bf58
    bl         Entity_AllocList
    ldr        r7,PTR_PTR_DAT_0802bf5c
    bl         Map_LoadNPCList
    pop        {r5}
    Flag_SetGate F_GATE_02
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_ACDC_School_Gate_F50
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_School_Gate_F50_0_0802bf60
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_ACDC_School_Gate_F50_0_0802be34:
    .word EventHandler_ACDC_School_Gate_F50_0


_ts EventHandler_ACDC_School_Gate_F50_0
    push       {lr}
    pop        {pc}


_ts MapSetup_ACDC_School_Gate_F53
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_BgTask_802BF64
    bl         BgTask_AddNew
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_DAT_0802bf68
    bl         Entity_AllocList
    pop        {r5}
    Flag_GetBase 0xA5
    beq        LAB_0802be98
    Flag_GetBase 0xA7
    bne        LAB_0802be8c
    LoadMain world, r0, r0
    mov        r1,#0x0
    strb       r1,[r0,#World_fadeType]
    bl         Sound_StopAllMusic
    push       {r5}
    ldr        r0,DAT_0802bf6c
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_0802be8c:
    Flag_GetBase 0xA8
    bne        LAB_0802be98
    bl         Sound_StopAllMusic
LAB_0802be98:
    Flag_GetBase 0xA8
    bne        LAB_0802bea6
    Flag_SetGate F_GATE_02
LAB_0802bea6:
    push       {r5}
    ldr        r7,PTR_PTR_DAT_0802bf70
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_ACDC_School_Gate_F53
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_School_Gate_F53_0_0802bf74
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_ACDC_School_Gate_F53_0_0802bec8:
    .word EventHandler_ACDC_School_Gate_F53_0


_ts EventHandler_ACDC_School_Gate_F53_0
    push       {lr}
    Flag_GetBase 0xA5
    beq        LAB_0802bef4
    LoadMain world, r0, r7
    ldrb       r0,[r0,#World_curEventFlag]
    cmp        r0,#0xf1
    bne        LAB_0802bef4
    Flag_GetBase 0xA8
    bne        LAB_0802bef4
    push       {r5}
    ldr        r0,PTR_Scene_Story_6B_0802bf78
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_0802bef4:
    pop        {pc}

    .align 2, 0


_ts MapSetup_ACDC_School_Gate_F54
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    Flag_ClearBase 0x74
    push       {r5}
    ldr        r0,PTR_BgTask_802BF7C
    bl         BgTask_AddNew
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_DAT_0802bf80
    bl         Entity_AllocList
    ldr        r7,PTR_PTR_DAT_0802bf84
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_ACDC_School_Gate_F54
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_School_Gate_F54_0_0802bf88
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_ACDC_School_Gate_F54_0_0802bf44:
    .word EventHandler_ACDC_School_Gate_F54_0


_ts EventHandler_ACDC_School_Gate_F54_0
    push       {lr}
    pop        {pc}
PTR_PTR_MapSetup_ACDC_School_Gate_F50_0802bf4c:
    .word PTR_MapSetup_ACDC_School_Gate_F50_0802bd94
PTR_PTR_EventHandler_ACDC_School_Gate_F50_0802bf50:
    .word PTR_EventHandler_ACDC_School_Gate_F50_0802bdc8
PTR_BgTask_802BF54:
    .word BgTask_8029FEC
PTR_DAT_0802bf58:
    .word EntityAllocParams_8030D80
PTR_PTR_DAT_0802bf5c:
    .word NPCList_8030558
PTR_PTR_EventHandler_ACDC_School_Gate_F50_0_0802bf60:
    .word PTR_EventHandler_ACDC_School_Gate_F50_0_0802be34
PTR_BgTask_802BF64:
    .word BgTask_8029FEC
PTR_DAT_0802bf68:
    .word EntityAllocParams_8030D80
DAT_0802bf6c:
    .word Scene_Story_6A
PTR_PTR_DAT_0802bf70:
    .word NPCList_8030558
PTR_PTR_EventHandler_ACDC_School_Gate_F53_0_0802bf74:
    .word PTR_EventHandler_ACDC_School_Gate_F53_0_0802bec8
PTR_Scene_Story_6B_0802bf78:
    .word Scene_Story_6B
PTR_BgTask_802BF7C:
    .word BgTask_8029FEC
PTR_DAT_0802bf80:
    .word EntityAllocParams_8030D80
PTR_PTR_DAT_0802bf84:
    .word NPCList_8030558
PTR_PTR_EventHandler_ACDC_School_Gate_F54_0_0802bf88:
    .word PTR_EventHandler_ACDC_School_Gate_F54_0_0802bf44
