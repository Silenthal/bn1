#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_WWW_Wily_Lab_S3
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_WWW_Wily_Lab_F30_0803dddc
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_803D7E4_0803dde0
    bl         BgTask_AddNew
    pop        {r5}
    bl         Sound_AreaSongChange
    pop        {pc}

    .align 2, 0

PTR_MapSetup_WWW_Wily_Lab_F30_0803dcf0:
    .word MapSetup_WWW_Wily_Lab_F30
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_WWW_Wily_Lab_F37


_ts EventHandler_WWW_Wily_Lab_S3
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_WWW_Wily_Lab_F30_0803dde4
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_WWW_Wily_Lab_F30_0803dd1c:
    .word EventHandler_WWW_Wily_Lab_F30
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_WWW_Wily_Lab_F37


_ts MapSetup_WWW_Wily_Lab_F30
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_803E650_0803dde8
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x90
    bl         Flag_GetBase
    bne        LAB_0803dd6c
    LoadMain world, r0, r0
    mov        r1,#0x0
    strb       r1,[r0,#0x7]
    push       {r5}
    ldr        r0,PTR_Scene_Story_35_0803ddec
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_0803dd6c:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_WWW_Wily_Lab_F30
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_WWW_Wily_Lab_F30_0_0803ddf0
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_WWW_Wily_Lab_F30_0_0803dd84:
    .word EventHandler_WWW_Wily_Lab_F30_0


_ts EventHandler_WWW_Wily_Lab_F30_0
    push       {lr}
    pop        {pc}


_ts MapSetup_WWW_Wily_Lab_F37
    push       {lr}
    LoadMain world, r0, r0
    mov        r1,#0x0
    strb       r1,[r0,#0x7]
    push       {r5}
    bl         PlayerLocation_Create
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_803E6F4_0803ddf4
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0xc2
    bl         Flag_GetBase
    bne        LAB_0803ddbc
    push       {r5}
    ldr        r0,PTR_Scene_Story_4D_0803ddf8
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_0803ddbc:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_WWW_Wily_Lab_F37
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_WWW_Wily_Lab_F37_0_0803ddfc
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_WWW_Wily_Lab_F37_0_0803ddd4:
    .word EventHandler_WWW_Wily_Lab_F37_0


_ts EventHandler_WWW_Wily_Lab_F37_0
    push       {lr}
    pop        {pc}

PTR_PTR_MapSetup_WWW_Wily_Lab_F30_0803dddc:
    .word PTR_MapSetup_WWW_Wily_Lab_F30_0803dcf0

PTR_BgTask_803D7E4_0803dde0:
    .word BgTask_803D7E4

PTR_PTR_EventHandler_WWW_Wily_Lab_F30_0803dde4:
    .word PTR_EventHandler_WWW_Wily_Lab_F30_0803dd1c

PTR_NPCList_803E650_0803dde8:
    .word NPCList_803E650

PTR_Scene_Story_35_0803ddec:
    .word Scene_Story_35

PTR_PTR_EventHandler_WWW_Wily_Lab_F30_0_0803ddf0:
    .word PTR_EventHandler_WWW_Wily_Lab_F30_0_0803dd84

PTR_NPCList_803E6F4_0803ddf4:
    .word NPCList_803E6F4

PTR_Scene_Story_4D_0803ddf8:
    .word Scene_Story_4D

PTR_PTR_EventHandler_WWW_Wily_Lab_F37_0_0803ddfc:
    .word PTR_EventHandler_WWW_Wily_Lab_F37_0_0803ddd4


_ts MapSetup_WWW_Wily_Lab_S5
    push       {lr}
    push       {r0,r1}
    bl         Sound_AreaSongChange
    pop        {r0,r1}
    ldr        r0,PTR_PTR_MapSetup_WWW_Wily_Lab_F50_0803e0d0
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    mov        r0,#0xe4
    bl         Flag_GetBase
    bne        LAB_0803de24
    ldr        r0,PTR_BgTask_803D7E4_0803e0d4
    bl         BgTask_AddNew
    b          LAB_0803de2a
LAB_0803de24:
    ldr        r0,PTR_BgTask_803D7FC_0803e0d8
    bl         BgTask_AddNew
LAB_0803de2a:
    pop        {r5}
    pop        {pc}

    .align 2, 0

PTR_MapSetup_WWW_Wily_Lab_F50_0803de30:
    .word MapSetup_WWW_Wily_Lab_F50
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_WWW_Wily_Lab_F53
    .word MapSetup_WWW_Wily_Lab_F54
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default


_ts EventHandler_WWW_Wily_Lab_S5
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_WWW_Wily_Lab_F50_0803e0dc
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_WWW_Wily_Lab_F50_0803de5c:
    .word EventHandler_WWW_Wily_Lab_F50
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_WWW_Wily_Lab_F53
    .word EventHandler_WWW_Wily_Lab_F54
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default


_ts MapSetup_WWW_Wily_Lab_F50
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    mov        r0,#0x92
    bl         Flag_GetBase
    bne        LAB_0803deac
    LoadMain world, r0, r0
    mov        r1,#0x0
    strb       r1,[r0,#0x7]
    push       {r5}
    ldr        r0,PTR_Scene_Story_65_0803e0e0
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_0803deac:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_WWW_Wily_Lab_F50
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_WWW_Wily_Lab_F50_0_0803e0e4
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_WWW_Wily_Lab_F50_0_0803dec4:
    .word EventHandler_WWW_Wily_Lab_F50_0


_ts EventHandler_WWW_Wily_Lab_F50_0
    push       {lr}
    pop        {pc}


_ts MapSetup_WWW_Wily_Lab_F53
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    mov        r0,#0xa1
    bl         Flag_GetBase
    bne        LAB_0803defc
    LoadMain world, r0, r0
    mov        r1,#0x0
    strb       r1,[r0,#0x7]
    push       {r5}
    ldr        r0,PTR_Scene_Story_68_0803e0e8
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_0803defc:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_WWW_Wily_Lab_F53
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_WWW_Wily_Lab_F53_0_0803e0ec
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_WWW_Wily_Lab_F53_0_0803df14:
    .word EventHandler_WWW_Wily_Lab_F53_0


_ts EventHandler_WWW_Wily_Lab_F53_0
    push       {lr}
    pop        {pc}


_ts MapSetup_WWW_Wily_Lab_F54
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    mov        r0,#0xe1
    bl         Flag_GetBase
    bne        LAB_0803df3e
    mov        r0,#0x1
    bl         Flag_SetGate
LAB_0803df3e:
    mov        r0,#0xe4
    bl         Flag_GetBase
    beq        LAB_0803dfcc
    mov        r0,#0xe5
    bl         Flag_GetBase
    bne        LAB_0803df68
    LoadMain world, r0, r0
    mov        r1,#0x0
    strb       r1,[r0,#0x7]
    bl         Sound_StopAllMusic
    push       {r5}
    ldr        r0,PTR_Scene_Story_78_0803e0f0
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_0803df8e
LAB_0803df68:
    mov        r0,#0xe8
    bl         Flag_GetBase
    beq        LAB_0803df8e
    mov        r0,#0xe9
    bl         Flag_GetBase
    bne        LAB_0803df8e
    bl         Sound_StopAllMusic
    push       {r5}
    ldr        r0,PTR_Scene_Story_7C_0803e0f4
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x4
    str        r0,[r5,#0x0]
    pop        {pc}
LAB_0803df8e:
    mov        r0,#0x0
    bl         Flag_SetGate
    push       {r5}
    ldr        r7,PTR_NPCList_803E734_0803e0f8
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x63
    bl         Flag_GetBase
    beq        LAB_0803dfc6
    mov        r6,#0x1d
    mov        r0,#0x64
    bl         Flag_GetBase
    beq        LAB_0803dfb2
    mov        r6,#0x1e
LAB_0803dfb2:
    mov        r0,#0x63
    bl         Flag_ClearBase
    add        r1,r6,#0x0
    push       {r5}
    ldr        r0,PTR_Scene_AfterFixedBattle_0803e0fc
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0803dfc6:
    mov        r0,#0x4
    str        r0,[r5,#0x0]
    pop        {pc}
LAB_0803dfcc:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_WWW_Wily_Lab_F54
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_WWW_Wily_Lab_F54_0_0803e100
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_WWW_Wily_Lab_F54_0_0803dfe4:
    .word EventHandler_WWW_Wily_Lab_F54_0
    .word EventHandler_WWW_Wily_Lab_F54_1


_ts EventHandler_WWW_Wily_Lab_F54_0
    push       {lr}
    mov        r0,#0xe1
    bl         Flag_GetBase
    bne        LAB_0803e00c
    LoadMain world, r0, r7
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x2
    bne        LAB_0803e00c
    push       {r5}
    ldr        r0,DAT_0803e104
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_0803e00c:
    mov        r0,#0x73
    bl         Flag_GetBase
    beq        LAB_0803e01a
    mov        r1,#0x1a
    bl         FUN_0803e06a
LAB_0803e01a:
    pop        {pc}


_ts EventHandler_WWW_Wily_Lab_F54_1
    push       {lr}
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x1
    bne        LAB_0803e040
    push       {r5}
    ldr        r0,PTR_Scene_LockedPath_0803e108
    ldr        r1,DAT_0803e10c
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0803e040:
    mov        r6,#0x23
    mov        r0,#0x64
    bl         Flag_GetBase
    beq        LAB_0803e04c
    mov        r6,#0x24
LAB_0803e04c:
    mov        r0,#0x63
    bl         Flag_GetBase
    beq        LAB_0803e062
    add        r1,r6,#0x0
    push       {r5}
    ldr        r0,PTR_Scene_StartFixedBattle_0803e110
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0803e062:
    mov        r1,#0x1a
    bl         FUN_0803e06a
    pop        {pc}


_nt FUN_0803e06a
    push       {lr}
    push       {r1}
    bl         Scene_IsSceneActive
    tst        r0,r0
    beq        LAB_0803e07a
    pop        {r1}
    pop        {pc}
LAB_0803e07a:
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#0x28]
    mov        r1,#0xc
    strh       r1,[r0,#0x2e]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    LoadMain world, r7, r7
    ldr        r7,[r7,#0x28]
    mov        r1,#0x0
    strh       r1,[r7,#0x2e]
    pop        {r5}
    cmp        r0,#0x40
    beq        LAB_0803e0a0
    pop        {r1}
    pop        {pc}
LAB_0803e0a0:
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0803e0cc
    LoadMain input, r0, r0
    ldrh       r0,[r0,#0x2]
    ldr        r1,DAT_0803e114
    and        r1,r0
    beq        LAB_0803e0cc
    bl         dummy_187a0
    bne        LAB_0803e0cc
    pop        {r1}
    push       {r5}
    ldr        r0,PTR_Scene_JackIn_0803e118
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0803e0cc:
    pop        {r1}
    pop        {pc}

PTR_PTR_MapSetup_WWW_Wily_Lab_F50_0803e0d0:
    .word PTR_MapSetup_WWW_Wily_Lab_F50_0803de30

PTR_BgTask_803D7E4_0803e0d4:
    .word BgTask_803D7E4

PTR_BgTask_803D7FC_0803e0d8:
    .word BgTask_803D7FC

PTR_PTR_EventHandler_WWW_Wily_Lab_F50_0803e0dc:
    .word PTR_EventHandler_WWW_Wily_Lab_F50_0803de5c

PTR_Scene_Story_65_0803e0e0:
    .word Scene_Story_65

PTR_PTR_EventHandler_WWW_Wily_Lab_F50_0_0803e0e4:
    .word PTR_EventHandler_WWW_Wily_Lab_F50_0_0803dec4

PTR_Scene_Story_68_0803e0e8:
    .word Scene_Story_68

PTR_PTR_EventHandler_WWW_Wily_Lab_F53_0_0803e0ec:
    .word PTR_EventHandler_WWW_Wily_Lab_F53_0_0803df14

PTR_Scene_Story_78_0803e0f0:
    .word Scene_Story_78

PTR_Scene_Story_7C_0803e0f4:
    .word Scene_Story_7C

PTR_NPCList_803E734_0803e0f8:
    .word NPCList_803E734

PTR_Scene_AfterFixedBattle_0803e0fc:
    .word Scene_AfterFixedBattle

PTR_PTR_EventHandler_WWW_Wily_Lab_F54_0_0803e100:
    .word PTR_EventHandler_WWW_Wily_Lab_F54_0_0803dfe4

DAT_0803e104:
    .word Scene_Dialogue

PTR_Scene_LockedPath_0803e108:
    .word Scene_LockedPath

DAT_0803e10c:
    .word 0xB01

PTR_Scene_StartFixedBattle_0803e110:
    .word Scene_StartFixedBattle

DAT_0803e114:
    .word 0x100

PTR_Scene_JackIn_0803e118:
    .word Scene_JackIn
