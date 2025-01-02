#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_SciLab_Power_Plant_Control_Room_S4
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_Default_0803cda4
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    Flag_GetBase 0xC5
    bne        LAB_0803cb8a
    mov        r0,#T_Suspicious_Mood
    bl         Sound_ChangeSong
    b          LAB_0803cb8e
LAB_0803cb8a:
    bl         Sound_AreaSongChange
LAB_0803cb8e:
    Flag_GetBase 0xC5
    bne        LAB_0803cba2
    push       {r5}
    ldr        r0,PTR_BgTask_803BB04_0803cda8
    bl         BgTask_AddNew
    pop        {r5}
    pop        {pc}
LAB_0803cba2:
    push       {r5}
    ldr        r0,PTR_BgTask_803BB1C_0803cdac
    bl         BgTask_AddNew
    pop        {r5}
    pop        {pc}

    .align 2, 0

PTR_MapSetup_Default_0803cbb0:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_SciLab_Power_Plant_Control_Room_F42
    .word MapSetup_SciLab_Power_Plant_Control_Room_F43
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default


_ts EventHandler_SciLab_Power_Plant_Control_Room_S4
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Default_0803cdb0
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         FUN_0803cd10
    pop        {pc}

PTR_EventHandler_Default_0803cbe0:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_SciLab_Power_Plant_Control_Room_F42
    .word EventHandler_SciLab_Power_Plant_Control_Room_F43
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default


_ts MapSetup_SciLab_Power_Plant_Control_Room_F42
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    Flag_ClearBase 0xB1
    push       {r5}
    ldr        r7,PTR_NPCList_803D564_0803cdb4
    bl         Map_LoadNPCList
    pop        {r5}
    Flag_GetBase 0xB6
    beq        LAB_0803cc6c
    LoadMain world, r0, r0
    mov        r1,#0x0
    strb       r1,[r0,#0x7]
    Flag_GetBase 0xB7
    bne        LAB_0803cc4a
    push       {r5}
    ldr        r0,DAT_0803cdb8
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_0803cc6c
LAB_0803cc4a:
    Flag_GetBase 0xB8
    bne        LAB_0803cc60
    push       {r5}
    ldr        r0,DAT_0803cdbc
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_0803cc6c
LAB_0803cc60:
    push       {r5}
    ldr        r0,DAT_0803cdc0
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_0803cc6c:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_SciLab_Power_Plant_Control_Room_F42
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_SciLab_Power_Plant_Control_Room_F42_0_0803cdc4
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_SciLab_Power_Plant_Control_Room_F42_0_0803cc84:
    .word EventHandler_SciLab_Power_Plant_Control_Room_F42_0


_ts EventHandler_SciLab_Power_Plant_Control_Room_F42_0
    push       {lr}
    pop        {pc}


_ts MapSetup_SciLab_Power_Plant_Control_Room_F43
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_803D564_0803cdc8
    bl         Map_LoadNPCList
    pop        {r5}
    Flag_GetBase 0xB6
    beq        LAB_0803ccf2
    LoadMain world, r0, r0
    mov        r1,#0x0
    strb       r1,[r0,#0x7]
    Flag_GetBase 0xB7
    bne        LAB_0803ccd0
    push       {r5}
    ldr        r0,PTR_Scene_Story_56_0803cdcc
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_0803ccf2
LAB_0803ccd0:
    Flag_GetBase 0xB8
    bne        LAB_0803cce6
    push       {r5}
    ldr        r0,PTR_Scene_Story_57_0803cdd0
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_0803ccf2
LAB_0803cce6:
    push       {r5}
    ldr        r0,PTR_Scene_Story_58_0803cdd4
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_0803ccf2:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_SciLab_Power_Plant_Control_Room_F43
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_SciLab_Power_Plant_Control_Room_F43_0_0803cdd8
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_SciLab_Power_Plant_Control_Room_F43_0_0803cd08:
    .word EventHandler_SciLab_Power_Plant_Control_Room_F43_0


_ts EventHandler_SciLab_Power_Plant_Control_Room_F43_0
    push       {lr}
    pop        {pc}


_ts FUN_0803cd10
    push       {lr}
    bl         Scene_IsSceneActive
    tst        r0,r0
    bne        LAB_0803cda2
    LoadMain world, r0, r7
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x20
    bne        LAB_0803cd32
    push       {r5}
    ldr        r0,PTR_Scene_Dialogue_0803cddc
    mov        r1,#0xde
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0803cd32:
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x40
    bne        LAB_0803cda2
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0803cda2
    LoadMain input, r0, r0
    ldrh       r0,[r0,#0x2]
    ldr        r1,DAT_0803cde0
    and        r1,r0
    beq        LAB_0803cda2
    bl         dummy_187a0
    bne        LAB_0803cda2
    LoadMain world, r0, r0
    ldrb       r1,[r0,#0x6]
    cmp        r1,#0x43
    beq        LAB_0803cda2
    LoadMain world, r0, r0
    ldrb       r1,[r0,#0x6]
    cmp        r1,#0x42
    bne        LAB_0803cd94
    Flag_GetBase 0x35
    bne        LAB_0803cda2
    Flag_SetBase 0x35
    push       {r5}
    ldr        r0,PTR_Scene_Story_54_0803cde4
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0803cd94:
    push       {r5}
    ldr        r0,PTR_Scene_JackIn_0803cde8
    mov        r1,#0x14
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0803cda2:
    pop        {pc}

PTR_PTR_MapSetup_Default_0803cda4:
    .word PTR_MapSetup_Default_0803cbb0

PTR_BgTask_803BB04_0803cda8:
    .word BgTask_803BB04

PTR_BgTask_803BB1C_0803cdac:
    .word BgTask_803BB1C

PTR_PTR_EventHandler_Default_0803cdb0:
    .word PTR_EventHandler_Default_0803cbe0

PTR_NPCList_803D564_0803cdb4:
    .word NPCList_803D564

DAT_0803cdb8:
    .word Scene_Story_56

DAT_0803cdbc:
    .word Scene_Story_57

DAT_0803cdc0:
    .word Scene_Story_58

PTR_PTR_EventHandler_SciLab_Power_Plant_Control_Room_F42_0_0803cdc4:
    .word PTR_EventHandler_SciLab_Power_Plant_Control_Room_F42_0_0803cc84

PTR_NPCList_803D564_0803cdc8:
    .word NPCList_803D564

PTR_Scene_Story_56_0803cdcc:
    .word Scene_Story_56

PTR_Scene_Story_57_0803cdd0:
    .word Scene_Story_57

PTR_Scene_Story_58_0803cdd4:
    .word Scene_Story_58

PTR_PTR_EventHandler_SciLab_Power_Plant_Control_Room_F43_0_0803cdd8:
    .word PTR_EventHandler_SciLab_Power_Plant_Control_Room_F43_0_0803cd08

PTR_Scene_Dialogue_0803cddc:
    .word Scene_Dialogue

DAT_0803cde0:
    .word 0x100

PTR_Scene_Story_54_0803cde4:
    .word Scene_Story_54

PTR_Scene_JackIn_0803cde8:
    .word Scene_JackIn


_ts MapSetup_SciLab_Power_Plant_Control_Room_S5
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_SciLab_Power_Plant_Control_Room_F50_0803cef4
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Sound_AreaSongChange
    push       {r5}
    ldr        r0,PTR_BgTask_803BB1C_0803cef8
    bl         BgTask_AddNew
    pop        {r5}
    pop        {pc}

    .align 2, 0

PTR_MapSetup_SciLab_Power_Plant_Control_Room_F50_0803ce08:
    .word MapSetup_SciLab_Power_Plant_Control_Room_F50
    .word MapSetup_SciLab_Power_Plant_Control_Room_F50
    .word MapSetup_SciLab_Power_Plant_Control_Room_F50
    .word MapSetup_SciLab_Power_Plant_Control_Room_F50
    .word MapSetup_SciLab_Power_Plant_Control_Room_F50
    .word MapSetup_SciLab_Power_Plant_Control_Room_F50
    .word MapSetup_SciLab_Power_Plant_Control_Room_F50
    .word MapSetup_SciLab_Power_Plant_Control_Room_F50


_ts EventHandler_SciLab_Power_Plant_Control_Room_S5
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_SciLab_Power_Plant_Control_Room_F50_0803cefc
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         FUN_0803ce90
    pop        {pc}

PTR_EventHandler_SciLab_Power_Plant_Control_Room_F50_0803ce38:
    .word EventHandler_SciLab_Power_Plant_Control_Room_F50
    .word EventHandler_SciLab_Power_Plant_Control_Room_F50
    .word EventHandler_SciLab_Power_Plant_Control_Room_F50
    .word EventHandler_SciLab_Power_Plant_Control_Room_F50
    .word EventHandler_SciLab_Power_Plant_Control_Room_F50
    .word EventHandler_SciLab_Power_Plant_Control_Room_F50
    .word EventHandler_SciLab_Power_Plant_Control_Room_F50
    .word EventHandler_SciLab_Power_Plant_Control_Room_F50


_ts MapSetup_SciLab_Power_Plant_Control_Room_F50
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_NPCList_803D5F8_0803cf00
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_SciLab_Power_Plant_Control_Room_F50
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_SciLab_Power_Plant_Control_Room_F50_0_0803cf04
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_SciLab_Power_Plant_Control_Room_F50_0_0803ce88:
    .word EventHandler_SciLab_Power_Plant_Control_Room_F50_0


_ts EventHandler_SciLab_Power_Plant_Control_Room_F50_0
    push       {lr}
    pop        {pc}


_ts FUN_0803ce90
    push       {lr}
    bl         Scene_IsSceneActive
    tst        r0,r0
    bne        LAB_0803cef2
    LoadMain world, r0, r7
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x20
    bne        LAB_0803ceb2
    push       {r5}
    ldr        r0,PTR_Scene_Dialogue_0803cf08
    mov        r1,#0xde
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0803ceb2:
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x40
    bne        LAB_0803cef2
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0803cef2
    LoadMain input, r0, r0
    ldrh       r0,[r0,#0x2]
    ldr        r1,DAT_0803cf0c
    and        r1,r0
    beq        LAB_0803cef2
    bl         dummy_187a0
    bne        LAB_0803cef2
    push       {r5}
    ldr        r0,PTR_Scene_JackIn_0803cf10
    mov        r1,#0x14
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0803cef2:
    pop        {pc}

PTR_PTR_MapSetup_SciLab_Power_Plant_Control_Room_F50_0803cef4:
    .word PTR_MapSetup_SciLab_Power_Plant_Control_Room_F50_0803ce08

PTR_BgTask_803BB1C_0803cef8:
    .word BgTask_803BB1C

PTR_PTR_EventHandler_SciLab_Power_Plant_Control_Room_F50_0803cefc:
    .word PTR_EventHandler_SciLab_Power_Plant_Control_Room_F50_0803ce38

PTR_NPCList_803D5F8_0803cf00:
    .word NPCList_803D5F8

PTR_PTR_EventHandler_SciLab_Power_Plant_Control_Room_F50_0_0803cf04:
    .word PTR_EventHandler_SciLab_Power_Plant_Control_Room_F50_0_0803ce88

PTR_Scene_Dialogue_0803cf08:
    .word Scene_Dialogue

DAT_0803cf0c:
    .word 0x100

PTR_Scene_JackIn_0803cf10:
    .word Scene_JackIn
