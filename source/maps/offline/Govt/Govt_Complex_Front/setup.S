#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_Govt_Complex_Front_S2
    push       {lr}
    push       {r1,r5}
    Flag_SetIgnore F_IGNORE_MAP_DIALOGUE_01
    pop        {r1,r5}
    ldr        r0,PTR_PTR_MapSetup_Default_08031914
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_8035C00_08031918
    bl         Entity_AllocList
    pop        {r5}
    Flag_GetBase 0xAB
    beq        LAB_0803168e
    push       {r5}
    mov        r0,#T_Incident_Occurrence
    bl         Sound_PlayBGM
    pop        {r5}
    b          LAB_080316a6
LAB_0803168e:
    Flag_GetBase 0xDF
    beq        LAB_080316a2
    push       {r5}
    mov        r0,#T_Suspicious_Mood
    bl         Sound_PlayBGM
    pop        {r5}
    b          LAB_080316a6
LAB_080316a2:
    bl         Sound_AreaSongChange
LAB_080316a6:
    push       {r5}
    Flag_SetIgnore F_IGNORE_WALL_00
    pop        {r5}
    pop        {pc}

    .align 2, 0

PTR_MapSetup_Default_080316b4:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Govt_Complex_Front_F22
    .word MapSetup_Govt_Complex_Front_F23
    .word MapSetup_Govt_Complex_Front_F24
    .word MapSetup_Govt_Complex_Front_F25
    .word MapSetup_Govt_Complex_Front_F25
    .word MapSetup_Govt_Complex_Front_F25


_ts EventHandler_Govt_Complex_Front_S2
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Default_0803191c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r1,#0xd
    bl         EventHandler_Offline_HandleJackIn
    pop        {pc}

    .align 2, 0

PTR_EventHandler_Default_080316e8:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Govt_Complex_Front_F22
    .word EventHandler_Govt_Complex_Front_F23
    .word EventHandler_Govt_Complex_Front_F24
    .word EventHandler_Govt_Complex_Front_F25
    .word EventHandler_Govt_Complex_Front_F25
    .word EventHandler_Govt_Complex_Front_F25


_ts MapSetup_Govt_Complex_Front_F22
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r0,PTR_EntityAllocParams_8035C00_08031920
    bl         Entity_AllocList
    ldr        r7,PTR_NPCList_8034E90_08031924
    bl         Map_LoadNPCList
    pop        {r5}
    Flag_GetBase 0x3E
    bne        LAB_08031748
    push       {r5}
    Flag_GetBase 0x2C
    pop        {r5}
    beq        LAB_08031748
    push       {r5}
    ldr        r0,DAT_08031928
    mov        r1,#0x5
    bl         Scene_Prepare
    pop        {r5}
LAB_08031748:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_Govt_Complex_Front_F22
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Complex_Front_F22_0_0803192c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_Govt_Complex_Front_F22_0_08031760:
    .word EventHandler_Govt_Complex_Front_F22_0


_ts EventHandler_Govt_Complex_Front_F22_0
    push       {lr}
    mov        r0,#0x21
    bl         KeyItem_IsPresent
    bne        LAB_0803178a
    Flag_GetEmailReceived 0x0F
    bne        LAB_0803178a
    Flag_SetItem F_ITEM_ACDC_MAYL_PC_KEYMAYL
    push       {r5}
    ldr        r0,DAT_08031930
    ldr        r1,DAT_08031934
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0803178a:
    Flag_GetBase 0x3E
    bne        LAB_080317a6
    Flag_GetBase 0x2C
    beq        LAB_080317a6
    push       {r5}
    ldr        r0,DAT_08031938
    mov        r1,#0x7
    bl         Scene_Prepare
    pop        {r5}
LAB_080317a6:
    pop        {pc}


_ts MapSetup_Govt_Complex_Front_F23
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r0,PTR_EntityAllocParams_8035C00_0803193c
    bl         Entity_AllocList
    pop        {r5}
    Flag_GetBase 0x3E
    bne        LAB_080317e2
    push       {r5}
    Flag_GetBase 0x2C
    pop        {r5}
    beq        LAB_080317e2
    push       {r5}
    ldr        r0,PTR_Scene_AfterFixedBattle_08031940
    mov        r1,#0x5
    bl         Scene_Prepare
    pop        {r5}
LAB_080317e2:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Govt_Complex_Front_F23
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Complex_Front_F23_0_08031944
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Govt_Complex_Front_F23_0_080317f8:
    .word EventHandler_Govt_Complex_Front_F23_0


_ts EventHandler_Govt_Complex_Front_F23_0
    push       {lr}
    Flag_GetBase 0x3E
    bne        LAB_0803181a
    Flag_GetBase 0x2C
    beq        LAB_0803181a
    push       {r5}
    ldr        r0,DAT_08031948
    mov        r1,#0x7
    bl         Scene_Prepare
    pop        {r5}
LAB_0803181a:
    pop        {pc}


_ts MapSetup_Govt_Complex_Front_F24
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r0,PTR_EntityAllocParams_8035C00_0803194c
    bl         Entity_AllocList
    ldr        r7,PTR_NPCList_8034E90_08031950
    bl         Map_LoadNPCList
    pop        {r5}
    Flag_GetBase 0x3E
    bne        LAB_0803185c
    push       {r5}
    Flag_GetBase 0x2C
    pop        {r5}
    beq        LAB_0803185c
    push       {r5}
    ldr        r0,PTR_Scene_AfterFixedBattle_08031954
    mov        r1,#0x5
    bl         Scene_Prepare
    pop        {r5}
LAB_0803185c:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_Govt_Complex_Front_F24
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Complex_Front_F24_0_08031958
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_Govt_Complex_Front_F24_0_08031874:
    .word EventHandler_Govt_Complex_Front_F24_0


_ts EventHandler_Govt_Complex_Front_F24_0
    push       {lr}
    Flag_GetBase 0x3E
    bne        LAB_08031896
    Flag_GetBase 0x2C
    beq        LAB_08031896
    push       {r5}
    ldr        r0,DAT_0803195c
    mov        r1,#0x7
    bl         Scene_Prepare
    pop        {r5}
LAB_08031896:
    pop        {pc}


_ts MapSetup_Govt_Complex_Front_F25
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r0,PTR_EntityAllocParams_8035C00_08031960
    bl         Entity_AllocList
    ldr        r7,PTR_NPCList_8034F44_08031964
    bl         Map_LoadNPCList
    pop        {r5}
    Flag_GetBase 0x3E
    bne        LAB_080318d8
    push       {r5}
    Flag_GetBase 0x2C
    pop        {r5}
    beq        LAB_080318d8
    push       {r5}
    ldr        r0,PTR_Scene_AfterFixedBattle_08031968
    mov        r1,#0x5
    bl         Scene_Prepare
    pop        {r5}
LAB_080318d8:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_Govt_Complex_Front_F25
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Complex_Front_F25_0_0803196c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_Govt_Complex_Front_F25_0_080318f0:
    .word EventHandler_Govt_Complex_Front_F25_0


_ts EventHandler_Govt_Complex_Front_F25_0
    push       {lr}
    Flag_GetBase 0x3E
    bne        LAB_08031912
    Flag_GetBase 0x2C
    beq        LAB_08031912
    push       {r5}
    ldr        r0,DAT_08031970
    mov        r1,#0x7
    bl         Scene_Prepare
    pop        {r5}
LAB_08031912:
    pop        {pc}

PTR_PTR_MapSetup_Default_08031914:
    .word PTR_MapSetup_Default_080316b4

PTR_EntityAllocParams_8035C00_08031918:
    .word EntityAllocParams_8035C00

PTR_PTR_EventHandler_Default_0803191c:
    .word PTR_EventHandler_Default_080316e8

PTR_EntityAllocParams_8035C00_08031920:
    .word EntityAllocParams_8035C00

PTR_NPCList_8034E90_08031924:
    .word NPCList_8034E90

DAT_08031928:
    .word Scene_AfterFixedBattle

PTR_PTR_EventHandler_Govt_Complex_Front_F22_0_0803192c:
    .word PTR_EventHandler_Govt_Complex_Front_F22_0_08031760

DAT_08031930:
    .word Scene_CheckMail

DAT_08031934:
    .word 0x115

DAT_08031938:
    .word Scene_StartFixedBattle

PTR_EntityAllocParams_8035C00_0803193c:
    .word EntityAllocParams_8035C00

PTR_Scene_AfterFixedBattle_08031940:
    .word Scene_AfterFixedBattle

PTR_PTR_EventHandler_Govt_Complex_Front_F23_0_08031944:
    .word PTR_EventHandler_Govt_Complex_Front_F23_0_080317f8

DAT_08031948:
    .word Scene_StartFixedBattle

PTR_EntityAllocParams_8035C00_0803194c:
    .word EntityAllocParams_8035C00

PTR_NPCList_8034E90_08031950:
    .word NPCList_8034E90

PTR_Scene_AfterFixedBattle_08031954:
    .word Scene_AfterFixedBattle

PTR_PTR_EventHandler_Govt_Complex_Front_F24_0_08031958:
    .word PTR_EventHandler_Govt_Complex_Front_F24_0_08031874

DAT_0803195c:
    .word Scene_StartFixedBattle

PTR_EntityAllocParams_8035C00_08031960:
    .word EntityAllocParams_8035C00

PTR_NPCList_8034F44_08031964:
    .word NPCList_8034F44

PTR_Scene_AfterFixedBattle_08031968:
    .word Scene_AfterFixedBattle

PTR_PTR_EventHandler_Govt_Complex_Front_F25_0_0803196c:
    .word PTR_EventHandler_Govt_Complex_Front_F25_0_080318f0

DAT_08031970:
    .word Scene_StartFixedBattle


_ts MapSetup_Govt_Complex_Front_S3
    push       {lr}
    push       {r1,r5}
    Flag_SetIgnore F_IGNORE_MAP_DIALOGUE_01
    pop        {r1,r5}
    ldr        r0,PTR_PTR_MapSetup_Govt_Complex_Front_F30_08031a9c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_8035C00_08031aa0
    bl         Entity_AllocList
    pop        {r5}
    bl         Sound_AreaSongChange
    push       {r5}
    Flag_SetIgnore F_IGNORE_WALL_00
    pop        {r5}
    pop        {pc}

    .align 2, 0

PTR_MapSetup_Govt_Complex_Front_F30_080319a4:
    .word MapSetup_Govt_Complex_Front_F30
    .word MapSetup_Govt_Complex_Front_F30
    .word MapSetup_Govt_Complex_Front_F30
    .word MapSetup_Govt_Complex_Front_F30
    .word MapSetup_Govt_Complex_Front_F30
    .word MapSetup_Govt_Complex_Front_F30
    .word MapSetup_Govt_Complex_Front_F30
    .word MapSetup_Govt_Complex_Front_F30


_ts EventHandler_Govt_Complex_Front_S3
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Complex_Front_F30_08031aa4
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r1,#0xd
    bl         EventHandler_Offline_HandleJackIn
    pop        {pc}

    .align 2, 0

PTR_EventHandler_Govt_Complex_Front_F30_080319d8:
    .word EventHandler_Govt_Complex_Front_F30
    .word EventHandler_Govt_Complex_Front_F30
    .word EventHandler_Govt_Complex_Front_F30
    .word EventHandler_Govt_Complex_Front_F30
    .word EventHandler_Govt_Complex_Front_F30
    .word EventHandler_Govt_Complex_Front_F30
    .word EventHandler_Govt_Complex_Front_F30
    .word EventHandler_Govt_Complex_Front_F30


_ts MapSetup_Govt_Complex_Front_F30
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r0,PTR_EntityAllocParams_8035C00_08031aa8
    bl         Entity_AllocList
    ldr        r7,PTR_NPCList_8034E90_08031aac
    bl         Map_LoadNPCList
    pop        {r5}
    Flag_GetBase 0x2C
    beq        LAB_08031a48
    mov        r6,#0x5
    Flag_GetBase 0x3E
    beq        FUN_08031a36
    mov        r6,#0xe
    Flag_GetBase 0x3F
    bne        LAB_08031a48
    b          FUN_08031a3c


_nt FUN_08031a36
    Flag_ClearBase 0x2C


_ts FUN_08031a3c
    add        r1,r6,#0x0
    push       {r5}
    ldr        r0,DAT_08031ab0
    bl         Scene_Prepare
    pop        {r5}
LAB_08031a48:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_Govt_Complex_Front_F30
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Complex_Front_F30_0_08031ab4
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_Govt_Complex_Front_F30_0_08031a60:
    .word EventHandler_Govt_Complex_Front_F30_0


_ts EventHandler_Govt_Complex_Front_F30_0
    push       {lr}
    mov        r1,#0x7
    push       {r1}
    Flag_GetBase 0x3E
    pop        {r1}
    beq        LAB_08031a82
    mov        r1,#0x10
    push       {r1}
    Flag_GetBase 0x3F
    pop        {r1}
    bne        LAB_08031a98
LAB_08031a82:
    push       {r1}
    Flag_GetBase 0x2C
    pop        {r1}
    beq        LAB_08031a98
    push       {r5}
    ldr        r0,DAT_08031ab8
    bl         Scene_Prepare
    pop        {r5}
LAB_08031a98:
    pop        {pc}

    .align 2, 0

PTR_PTR_MapSetup_Govt_Complex_Front_F30_08031a9c:
    .word PTR_MapSetup_Govt_Complex_Front_F30_080319a4

PTR_EntityAllocParams_8035C00_08031aa0:
    .word EntityAllocParams_8035C00

PTR_PTR_EventHandler_Govt_Complex_Front_F30_08031aa4:
    .word PTR_EventHandler_Govt_Complex_Front_F30_080319d8

PTR_EntityAllocParams_8035C00_08031aa8:
    .word EntityAllocParams_8035C00

PTR_NPCList_8034E90_08031aac:
    .word NPCList_8034E90

DAT_08031ab0:
    .word Scene_AfterFixedBattle

PTR_PTR_EventHandler_Govt_Complex_Front_F30_0_08031ab4:
    .word PTR_EventHandler_Govt_Complex_Front_F30_0_08031a60

DAT_08031ab8:
    .word Scene_StartFixedBattle


_ts MapSetup_Govt_Complex_Front_S4
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_Govt_Complex_Front_F40_08031c94
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_8035C18_08031c98
    bl         Entity_AllocList
    pop        {r5}
    bl         Sound_AreaSongChange
    pop        {pc}

    .align 2, 0

PTR_MapSetup_Govt_Complex_Front_F40_08031ad8:
    .word MapSetup_Govt_Complex_Front_F40
    .word MapSetup_Govt_Complex_Front_F40
    .word MapSetup_Govt_Complex_Front_F40
    .word MapSetup_Govt_Complex_Front_F40
    .word MapSetup_Govt_Complex_Front_F40
    .word MapSetup_Govt_Complex_Front_F40
    .word MapSetup_Govt_Complex_Front_F40
    .word MapSetup_Govt_Complex_Front_F40


_ts EventHandler_Govt_Complex_Front_S4
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Complex_Front_F40_08031c9c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r1,#0xd
    bl         EventHandler_Offline_HandleJackIn
    mov        r1,#0x13
    bl         FUN_08031c36
    pop        {pc}

PTR_EventHandler_Govt_Complex_Front_F40_08031b10:
    .word EventHandler_Govt_Complex_Front_F40
    .word EventHandler_Govt_Complex_Front_F40
    .word EventHandler_Govt_Complex_Front_F40
    .word EventHandler_Govt_Complex_Front_F40
    .word EventHandler_Govt_Complex_Front_F40
    .word EventHandler_Govt_Complex_Front_F40
    .word EventHandler_Govt_Complex_Front_F40
    .word EventHandler_Govt_Complex_Front_F40


_ts MapSetup_Govt_Complex_Front_F40
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1


_nt FUN_08031b3a
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    Flag_GetBase 0x9C
    bne        LAB_08031b52
    ldr        r7,PTR_NPCList_8034F4C_08031ca0
    bl         Map_LoadNPCList
    b          LAB_08031b58
LAB_08031b52:
    ldr        r7,PTR_NPCList_8034F70_08031ca4
    bl         Map_LoadNPCList
LAB_08031b58:
    pop        {r5}
    Flag_ClearEvent 0x31
    Flag_GetBase 0x2C
    beq        LAB_08031b92
    mov        r6,#0x5
    Flag_GetBase 0x3E
    beq        LAB_08031b7e
    mov        r6,#0xe
    Flag_GetBase 0x3F
    beq        LAB_08031b7e
    mov        r6,#0xf
LAB_08031b7e:
    Flag_ClearBase 0x2C
    add        r1,r6,#0x0
    push       {r5}
    ldr        r0,DAT_08031ca8
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_08031b92:
    Flag_GetBase 0x41
    bne        LAB_08031bb2
    push       {r5}
    Flag_GetBase 0x2F
    pop        {r5}
    beq        LAB_08031bb2
    push       {r5}
    ldr        r0,DAT_08031cac
    mov        r1,#0x7
    bl         Scene_Prepare
    pop        {r5}
LAB_08031bb2:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Govt_Complex_Front_F40
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Complex_Front_F40_0_08031cb0
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Govt_Complex_Front_F40_0_08031bc8:
    .word EventHandler_Govt_Complex_Front_F40_0


_ts EventHandler_Govt_Complex_Front_F40_0
    push       {lr}
    Flag_GetBase 0x95
    beq        LAB_08031bec
    Flag_GetEmailReceived 0x17
    bne        LAB_08031bec
    push       {r5}
    ldr        r0,DAT_08031cb4
    ldr        r1,DAT_08031cb8
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_08031bec:
    mov        r6,#0x7
    Flag_GetBase 0x3E
    beq        LAB_08031c02
    mov        r6,#0x10
    Flag_GetBase 0x3F
    beq        LAB_08031c02
    mov        r6,#0x11
LAB_08031c02:
    Flag_GetBase 0x2C
    beq        LAB_08031c18
    add        r1,r6,#0x0
    push       {r5}
    ldr        r0,DAT_08031cbc
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_08031c18:
    Flag_GetBase 0x41
    bne        LAB_08031c34
    Flag_GetBase 0x2F
    beq        LAB_08031c34
    push       {r5}
    ldr        r0,DAT_08031cc0
    mov        r1,#0xa
    bl         Scene_Prepare
    pop        {r5}
LAB_08031c34:
    pop        {pc}


_nt FUN_08031c36
    push       {lr}
    push       {r1}
    bl         Scene_IsSceneActive
    tst        r0,r0
    beq        LAB_08031c46
    pop        {r1}
    pop        {pc}
LAB_08031c46:
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#World_playerLocation]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x41
    beq        LAB_08031c5e
    pop        {r1}
    pop        {pc}
LAB_08031c5e:
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08031c90
    LoadMain input, r0, r0
    ldrh       r0,[r0,#Input_toggleKeyState]
    ldr        r1,DAT_08031cc4
    and        r1,r0
    beq        LAB_08031c90
    bl         dummy_187a0
    bne        LAB_08031c90
    pop        {r1}
    push       {r5}
    ldr        r0,PTR_Scene_JackIn_08031cc8
    bl         Scene_Prepare
    pop        {r5}
    Flag_SetEvent 0x31
    pop        {pc}
LAB_08031c90:
    pop        {r1}
    pop        {pc}

PTR_PTR_MapSetup_Govt_Complex_Front_F40_08031c94:
    .word PTR_MapSetup_Govt_Complex_Front_F40_08031ad8

PTR_EntityAllocParams_8035C18_08031c98:
    .word EntityAllocParams_8035C18

PTR_PTR_EventHandler_Govt_Complex_Front_F40_08031c9c:
    .word PTR_EventHandler_Govt_Complex_Front_F40_08031b10

PTR_NPCList_8034F4C_08031ca0:
    .word NPCList_8034F4C

PTR_NPCList_8034F70_08031ca4:
    .word NPCList_8034F70

DAT_08031ca8:
    .word Scene_AfterFixedBattle

DAT_08031cac:
    .word Scene_AfterFixedBattle

PTR_PTR_EventHandler_Govt_Complex_Front_F40_0_08031cb0:
    .word PTR_EventHandler_Govt_Complex_Front_F40_0_08031bc8

DAT_08031cb4:
    .word Scene_CheckMail

DAT_08031cb8:
    .word 0x14B

DAT_08031cbc:
    .word Scene_StartFixedBattle

DAT_08031cc0:
    .word Scene_StartFixedBattle

DAT_08031cc4:
    .word 0x100

PTR_Scene_JackIn_08031cc8:
    .word Scene_JackIn


_ts MapSetup_Govt_Complex_Front_S5
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_Govt_Complex_Front_F50_080320bc
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_8035C18_080320c0
    bl         Entity_AllocList
    pop        {r5}
    bl         Sound_AreaSongChange
    pop        {pc}

    .align 2, 0

PTR_MapSetup_Govt_Complex_Front_F50_08031ce8:
    .word MapSetup_Govt_Complex_Front_F50
    .word MapSetup_Govt_Complex_Front_F50
    .word MapSetup_Govt_Complex_Front_F52
    .word MapSetup_Govt_Complex_Front_F53
    .word MapSetup_Govt_Complex_Front_F53
    .word MapSetup_Govt_Complex_Front_F50
    .word MapSetup_Govt_Complex_Front_F50
    .word MapSetup_Govt_Complex_Front_F50


_ts EventHandler_Govt_Complex_Front_S5
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Complex_Front_F50_080320c4
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r1,#0xd
    bl         EventHandler_Offline_HandleJackIn
    mov        r1,#0x13
    bl         FUN_0803205c
    pop        {pc}

PTR_EventHandler_Govt_Complex_Front_F50_08031d20:
    .word EventHandler_Govt_Complex_Front_F50
    .word EventHandler_Govt_Complex_Front_F50
    .word EventHandler_Govt_Complex_Front_F52
    .word EventHandler_Govt_Complex_Front_F53
    .word EventHandler_Govt_Complex_Front_F53
    .word EventHandler_Govt_Complex_Front_F50
    .word EventHandler_Govt_Complex_Front_F50
    .word EventHandler_Govt_Complex_Front_F50


_ts MapSetup_Govt_Complex_Front_F50
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_NPCList_8035038_080320c8
    bl         Map_LoadNPCList
    pop        {r5}
    Flag_ClearEvent 0x31
    Flag_GetBase 0x2C
    beq        LAB_08031d92
    mov        r6,#0x5
    Flag_GetBase 0x3E
    beq        LAB_08031d7e
    mov        r6,#0xe
    Flag_GetBase 0x3F
    beq        LAB_08031d7e
    mov        r6,#0xf
LAB_08031d7e:
    Flag_ClearBase 0x2C
    add        r1,r6,#0x0
    push       {r5}
    ldr        r0,DAT_080320cc
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_08031d92:
    Flag_GetBase 0x2F
    beq        LAB_08031dc2
    mov        r6,#0x7
    Flag_GetBase 0x41
    beq        LAB_08031db0
    mov        r6,#0x10
    Flag_GetBase 0x42
    bne        LAB_08031dc2
    b          LAB_08031db6
LAB_08031db0:
    Flag_ClearBase 0x2F
LAB_08031db6:
    add        r1,r6,#0x0
    push       {r5}
    ldr        r0,DAT_080320d0
    bl         Scene_Prepare
    pop        {r5}
LAB_08031dc2:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Govt_Complex_Front_F50
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Complex_Front_F50_0_080320d4
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Govt_Complex_Front_F50_0_08031dd8:
    .word EventHandler_Govt_Complex_Front_F50_0


_ts EventHandler_Govt_Complex_Front_F50_0
    push       {lr}
    mov        r6,#0x7
    Flag_GetBase 0x3E
    beq        LAB_08031df4
    mov        r6,#0x10
    Flag_GetBase 0x3F
    beq        LAB_08031df4
    mov        r6,#0x11
LAB_08031df4:
    Flag_GetBase 0x2C
    beq        LAB_08031e0a
    add        r1,r6,#0x0
    push       {r5}
    ldr        r0,DAT_080320d8
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_08031e0a:
    mov        r1,#0xa
    push       {r1}
    Flag_GetBase 0x41
    pop        {r1}
    beq        LAB_08031e26
    mov        r1,#0x12
    push       {r1}
    Flag_GetBase 0x42
    pop        {r1}
    bne        LAB_08031e3c
LAB_08031e26:
    push       {r1}
    Flag_GetBase 0x2F
    pop        {r1}
    beq        LAB_08031e3c
    push       {r5}
    ldr        r0,DAT_080320dc
    bl         Scene_Prepare
    pop        {r5}
LAB_08031e3c:
    pop        {pc}


_nt MapSetup_Govt_Complex_Front_F52
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_NPCList_8035038_080320e0
    bl         Map_LoadNPCList
    pop        {r5}
    Flag_ClearEvent 0x31
    Flag_GetBase 0x2C
    beq        LAB_08031e90
    mov        r6,#0x5
    Flag_GetBase 0x3E
    beq        LAB_08031e7c
    mov        r6,#0xe
    Flag_GetBase 0x3F
    beq        LAB_08031e7c
    mov        r6,#0xf
LAB_08031e7c:
    Flag_ClearBase 0x2C
    add        r1,r6,#0x0
    push       {r5}
    ldr        r0,PTR_Scene_AfterFixedBattle_080320e4
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_08031e90:
    Flag_GetBase 0x2F
    beq        LAB_08031ec0
    mov        r6,#0x7
    Flag_GetBase 0x41
    beq        LAB_08031eae
    mov        r6,#0x10
    Flag_GetBase 0x42
    beq        LAB_08031eae
    mov        r6,#0x11
LAB_08031eae:
    Flag_ClearBase 0x2F
    add        r1,r6,#0x0
    push       {r5}
    ldr        r0,PTR_Scene_AfterFixedBattle_080320e8
    bl         Scene_Prepare
    pop        {r5}
LAB_08031ec0:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_Govt_Complex_Front_F52
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Complex_Front_F52_0_080320ec
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_Govt_Complex_Front_F52_0_08031ed8:
    .word EventHandler_Govt_Complex_Front_F52_0


_ts EventHandler_Govt_Complex_Front_F52_0
    push       {lr}
    mov        r6,#0x7
    Flag_GetBase 0x3E
    beq        LAB_08031ef4
    mov        r6,#0x10
    Flag_GetBase 0x3F
    beq        LAB_08031ef4
    mov        r6,#0x11
LAB_08031ef4:
    Flag_GetBase 0x2C
    beq        LAB_08031f0a
    add        r1,r6,#0x0
    push       {r5}
    ldr        r0,DAT_080320f0
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_08031f0a:
    mov        r1,#0xa
    push       {r1}
    Flag_GetBase 0x41
    pop        {r1}
    beq        LAB_08031f28
    mov        r1,#0x12
    push       {r1}
    Flag_GetBase 0x42
    pop        {r1}
    beq        LAB_08031f28
    mov        r1,#0x13
LAB_08031f28:
    push       {r1}
    Flag_GetBase 0x2F
    pop        {r1}
    beq        LAB_08031f3e
    push       {r5}
    ldr        r0,DAT_080320f4
    bl         Scene_Prepare
    pop        {r5}
LAB_08031f3e:
    pop        {pc}


_ts MapSetup_Govt_Complex_Front_F53
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_NPCList_8035038_080320f8
    bl         Map_LoadNPCList
    pop        {r5}
    Flag_ClearEvent 0x31
    Flag_GetBase 0x2C
    beq        LAB_08031f92
    mov        r6,#0x5
    Flag_GetBase 0x3E
    beq        LAB_08031f7e
    mov        r6,#0xe
    Flag_GetBase 0x3F
    beq        LAB_08031f7e
    mov        r6,#0xf
LAB_08031f7e:
    Flag_ClearBase 0x2C
    add        r1,r6,#0x0
    push       {r5}
    ldr        r0,PTR_Scene_AfterFixedBattle_080320fc
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_08031f92:
    Flag_GetBase 0x2F
    beq        LAB_08031fc2
    mov        r6,#0x7
    Flag_GetBase 0x41
    beq        LAB_08031fb0
    mov        r6,#0x10
    Flag_GetBase 0x42
    beq        LAB_08031fb0
    mov        r6,#0x11
LAB_08031fb0:
    Flag_ClearBase 0x2F
    add        r1,r6,#0x0
    push       {r5}
    ldr        r0,PTR_Scene_AfterFixedBattle_08032100
    bl         Scene_Prepare
    pop        {r5}
LAB_08031fc2:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Govt_Complex_Front_F53
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Complex_Front_F53_0_08032104
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Govt_Complex_Front_F53_0_08031fd8:
    .word EventHandler_Govt_Complex_Front_F53_0


_ts EventHandler_Govt_Complex_Front_F53_0
    push       {lr}
    Flag_GetBase 0xA9
    beq        LAB_08031ffa
    Flag_GetEmailReceived 0x1A
    bne        LAB_08031ffa
    push       {r5}
    ldr        r0,DAT_08032108
    ldr        r1,DAT_0803210c
    bl         Scene_Prepare
    pop        {r5}
LAB_08031ffa:
    mov        r6,#0x7
    Flag_GetBase 0x3E
    beq        LAB_08032010
    mov        r6,#0x10
    Flag_GetBase 0x3F
    beq        LAB_08032010
    mov        r6,#0x11
LAB_08032010:
    Flag_GetBase 0x2C
    beq        LAB_08032026
    add        r1,r6,#0x0
    push       {r5}
    ldr        r0,DAT_08032110
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_08032026:
    mov        r1,#0xa
    push       {r1}
    Flag_GetBase 0x41
    pop        {r1}
    beq        LAB_08032044
    mov        r1,#0x12
    push       {r1}
    Flag_GetBase 0x42
    pop        {r1}
    beq        LAB_08032044
    mov        r1,#0x13
LAB_08032044:
    push       {r1}
    Flag_GetBase 0x2F
    pop        {r1}
    beq        LAB_0803205a
    push       {r5}
    ldr        r0,DAT_08032114
    bl         Scene_Prepare
    pop        {r5}
LAB_0803205a:
    pop        {pc}


_ts FUN_0803205c
    push       {lr}
    push       {r1}
    bl         Scene_IsSceneActive
    tst        r0,r0
    beq        LAB_0803206c
    pop        {r1}
    pop        {pc}
LAB_0803206c:
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#World_playerLocation]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x41
    beq        LAB_08032084
    pop        {r1}
    pop        {pc}
LAB_08032084:
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_080320b6
    LoadMain input, r0, r0
    ldrh       r0,[r0,#Input_toggleKeyState]
    ldr        r1,DAT_08032118
    and        r1,r0
    beq        LAB_080320b6
    bl         dummy_187a0
    bne        LAB_080320b6
    pop        {r1}
    push       {r5}
    ldr        r0,PTR_Scene_JackIn_0803211c
    bl         Scene_Prepare
    pop        {r5}
    Flag_SetEvent 0x31
    pop        {pc}
LAB_080320b6:
    pop        {r1}
    pop        {pc}

    .align 2, 0

PTR_PTR_MapSetup_Govt_Complex_Front_F50_080320bc:
    .word PTR_MapSetup_Govt_Complex_Front_F50_08031ce8

PTR_EntityAllocParams_8035C18_080320c0:
    .word EntityAllocParams_8035C18

PTR_PTR_EventHandler_Govt_Complex_Front_F50_080320c4:
    .word PTR_EventHandler_Govt_Complex_Front_F50_08031d20

PTR_NPCList_8035038_080320c8:
    .word NPCList_8035038

DAT_080320cc:
    .word Scene_AfterFixedBattle

DAT_080320d0:
    .word Scene_AfterFixedBattle

PTR_PTR_EventHandler_Govt_Complex_Front_F50_0_080320d4:
    .word PTR_EventHandler_Govt_Complex_Front_F50_0_08031dd8

DAT_080320d8:
    .word Scene_StartFixedBattle

DAT_080320dc:
    .word Scene_StartFixedBattle

PTR_NPCList_8035038_080320e0:
    .word NPCList_8035038

PTR_Scene_AfterFixedBattle_080320e4:
    .word Scene_AfterFixedBattle

PTR_Scene_AfterFixedBattle_080320e8:
    .word Scene_AfterFixedBattle

PTR_PTR_EventHandler_Govt_Complex_Front_F52_0_080320ec:
    .word PTR_EventHandler_Govt_Complex_Front_F52_0_08031ed8

DAT_080320f0:
    .word Scene_StartFixedBattle

DAT_080320f4:
    .word Scene_StartFixedBattle

PTR_NPCList_8035038_080320f8:
    .word NPCList_8035038

PTR_Scene_AfterFixedBattle_080320fc:
    .word Scene_AfterFixedBattle

PTR_Scene_AfterFixedBattle_08032100:
    .word Scene_AfterFixedBattle

PTR_PTR_EventHandler_Govt_Complex_Front_F53_0_08032104:
    .word PTR_EventHandler_Govt_Complex_Front_F53_0_08031fd8

DAT_08032108:
    .word Scene_CheckMail

DAT_0803210c:
    .word 0x170

DAT_08032110:
    .word Scene_StartFixedBattle

DAT_08032114:
    .word Scene_StartFixedBattle

DAT_08032118:
    .word 0x100

PTR_Scene_JackIn_0803211c:
    .word Scene_JackIn
