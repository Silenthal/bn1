#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_School_Class_1B_S1
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_School_Class_1B_F10_08026c1c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    Flag_GetBase 0x9A
    pop        {r5}
    beq        LAB_08026aaa
    mov        r0,#T_Incident_Occurrence
    bl         Sound_ChangeSong
    pop        {pc}
LAB_08026aaa:
    bl         Sound_AreaSongChange
    pop        {pc}
PTR_MapSetup_School_Class_1B_F10_08026ab0:
    .word MapSetup_School_Class_1B_F10
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_School_Class_1B_F14
    .word MapSetup_School_Class_1B_F15
    .word MapSetup_Default
    .word MapSetup_Default


_ts EventHandler_School_Class_1B_S1
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Class_1B_F10_08026c20
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_Class_1B_F10_08026adc:
    .word EventHandler_School_Class_1B_F10
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_School_Class_1B_F14
    .word EventHandler_School_Class_1B_F15
    .word EventHandler_Default
    .word EventHandler_Default


_ts MapSetup_School_Class_1B_F10
    push       {lr}
    push       {r5}
    ldr        r0,PTR_BgTask_8026C24
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8026C28
    bl         BgTask_AddNew
    ldr        r0,PTR_EntityAllocParams_ARRAY_08026c2c
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


_ts EventHandler_School_Class_1B_F10
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Class_1B_F10_0_08026c30
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_Class_1B_F10_0_08026b38:
    .word EventHandler_School_Class_1B_F10_0


_ts EventHandler_School_Class_1B_F10_0
    push       {lr}
    pop        {pc}


_ts MapSetup_School_Class_1B_F14
    push       {lr}
    push       {r5}
    ldr        r0,PTR_BgTask_8026C34
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8026C38
    bl         BgTask_AddNew
    ldr        r0,PTR_EntityAllocParams_ARRAY_08026c3c
    bl         Entity_AllocList
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_PTR_DAT_08026c40
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    Flag_GetBase 0xAD
    pop        {r5}
    bne        LAB_08026b80
    mov        r0,#0x0
    b          LAB_08026b82
LAB_08026b80:
    mov        r0,#0x4
LAB_08026b82:
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_School_Class_1B_F14
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Class_1B_F14_0_08026c44
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    mov        r1,#0x4
    bl         FUN_08024f0c
    pop        {pc}
PTR_EventHandler_School_Class_1B_F14_0_08026b9c:
    .word EventHandler_School_Class_1B_F14_0
    .word EventHandler_School_Class_1B_F14_1


_ts EventHandler_School_Class_1B_F14_0
    push       {lr}
    push       {r5}
    Flag_GetBase 0xAD
    pop        {r5}
    beq        LAB_08026bc2
    push       {r5}
    mov        r1,#0x7
    ldr        r0,DAT_08026c48
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08026bc2:
    pop        {pc}


_ts EventHandler_School_Class_1B_F14_1
    push       {lr}
    pop        {pc}


_ts MapSetup_School_Class_1B_F15
    push       {lr}
    push       {r5}
    ldr        r0,PTR_BgTask_8026C4C
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8026C50
    bl         BgTask_AddNew
    ldr        r0,PTR_EntityAllocParams_ARRAY_08026c54
    bl         Entity_AllocList
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_PTR_DAT_08026c58
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_School_Class_1B_F15
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Class_1B_F15_0_08026c5c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    mov        r1,#0x4
    bl         FUN_08024f0c
    pop        {pc}
PTR_EventHandler_School_Class_1B_F15_0_08026c14:
    .word EventHandler_School_Class_1B_F15_0


_ts EventHandler_School_Class_1B_F15_0
    push       {lr}
    pop        {pc}
PTR_PTR_MapSetup_School_Class_1B_F10_08026c1c:
    .word PTR_MapSetup_School_Class_1B_F10_08026ab0
PTR_PTR_EventHandler_School_Class_1B_F10_08026c20:
    .word PTR_EventHandler_School_Class_1B_F10_08026adc
PTR_BgTask_8026C24:
    .word BgTask_School_TilesetBlackboardRooster
PTR_BgTask_8026C28:
    .word BgTask_School_PaletteBlackboardOn_2
PTR_EntityAllocParams_ARRAY_08026c2c:
    .word EntityAllocParams_8029B18
PTR_PTR_EventHandler_School_Class_1B_F10_0_08026c30:
    .word PTR_EventHandler_School_Class_1B_F10_0_08026b38
PTR_BgTask_8026C34:
    .word BgTask_School_TilesetBlackboardEvent
PTR_BgTask_8026C38:
    .word BgTask_School_PaletteBlackboardOn
PTR_EntityAllocParams_ARRAY_08026c3c:
    .word EntityAllocParams_8029B18
PTR_PTR_DAT_08026c40:
    .word NPCList_80296B0
PTR_PTR_EventHandler_School_Class_1B_F14_0_08026c44:
    .word PTR_EventHandler_School_Class_1B_F14_0_08026b9c
DAT_08026c48:
    .word Scene_ChangeMap
PTR_BgTask_8026C4C:
    .word BgTask_School_TilesetBlackboardEvent
PTR_BgTask_8026C50:
    .word BgTask_School_PaletteBlackboardOn
PTR_EntityAllocParams_ARRAY_08026c54:
    .word EntityAllocParams_8029B18
PTR_PTR_DAT_08026c58:
    .word NPCList_80296B0
PTR_PTR_EventHandler_School_Class_1B_F15_0_08026c5c:
    .word PTR_EventHandler_School_Class_1B_F15_0_08026c14


_ts MapSetup_School_Class_1B_S2
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_School_Class_1B_F20_08026dd4
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    Flag_GetBase 0xAB
    beq        LAB_08026c7e
    push       {r5}
    mov        r0,#T_Incident_Occurrence
    bl         Sound_ChangeSong
    pop        {r5}
    b          LAB_08026c96
LAB_08026c7e:
    Flag_GetBase 0xDF
    beq        LAB_08026c92
    push       {r5}
    mov        r0,#T_Suspicious_Mood
    bl         Sound_ChangeSong
    pop        {r5}
    b          LAB_08026c96
LAB_08026c92:
    bl         Sound_AreaSongChange
LAB_08026c96:
    pop        {pc}
PTR_MapSetup_School_Class_1B_F20_08026c98:
    .word MapSetup_School_Class_1B_F20
    .word MapSetup_School_Class_1B_F21
    .word MapSetup_School_Class_1B_F22
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default


_ts EventHandler_School_Class_1B_S2
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Class_1B_F20_08026dd8
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_Class_1B_F20_08026cc4:
    .word EventHandler_School_Class_1B_F20
    .word EventHandler_School_Class_1B_F21
    .word EventHandler_School_Class_1B_F22
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default


_ts MapSetup_School_Class_1B_F20
    push       {lr}
    push       {r5}
    ldr        r0,PTR_BgTask_8026DDC
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8026DE0
    bl         BgTask_AddNew
    ldr        r0,PTR_EntityAllocParams_ARRAY_08026de4
    bl         Entity_AllocList
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_PTR_DAT_08026de8
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_School_Class_1B_F20
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Class_1B_F20_0_08026dec
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    mov        r1,#0x4
    bl         CheckJackIn_2
    pop        {pc}
PTR_EventHandler_School_Class_1B_F20_0_08026d2c:
    .word EventHandler_School_Class_1B_F20_0


_ts EventHandler_School_Class_1B_F20_0
    push       {lr}
    pop        {pc}


_ts MapSetup_School_Class_1B_F21
    push       {lr}
    push       {r5}
    ldr        r0,PTR_BgTask_8026DF0
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8026DF4
    bl         BgTask_AddNew
    ldr        r0,PTR_EntityAllocParams_ARRAY_08026df8
    bl         Entity_AllocList
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_PTR_DAT_08026dfc
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_School_Class_1B_F21
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Class_1B_F21_0_08026e00
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    mov        r1,#0x4
    bl         CheckJackIn_2
    pop        {pc}
PTR_EventHandler_School_Class_1B_F21_0_08026d7c:
    .word EventHandler_School_Class_1B_F21_0


_ts EventHandler_School_Class_1B_F21_0
    push       {lr}
    pop        {pc}


_ts MapSetup_School_Class_1B_F22
    push       {lr}
    push       {r5}
    ldr        r0,PTR_BgTask_8026E04
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8026E08
    bl         BgTask_AddNew
    ldr        r0,PTR_EntityAllocParams_ARRAY_08026e0c
    bl         Entity_AllocList
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_PTR_DAT_08026e10
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_School_Class_1B_F22
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Class_1B_F22_0_08026e14
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    mov        r1,#0x4
    bl         CheckJackIn_2
    pop        {pc}
PTR_EventHandler_School_Class_1B_F22_0_08026dcc:
    .word EventHandler_School_Class_1B_F22_0


_ts EventHandler_School_Class_1B_F22_0
    push       {lr}
    pop        {pc}
PTR_PTR_MapSetup_School_Class_1B_F20_08026dd4:
    .word PTR_MapSetup_School_Class_1B_F20_08026c98
PTR_PTR_EventHandler_School_Class_1B_F20_08026dd8:
    .word PTR_EventHandler_School_Class_1B_F20_08026cc4
PTR_BgTask_8026DDC:
    .word BgTask_School_TilesetBlackboardRooster
PTR_BgTask_8026DE0:
    .word BgTask_School_PaletteBlackboardOn_2
PTR_EntityAllocParams_ARRAY_08026de4:
    .word EntityAllocParams_8029B18
PTR_PTR_DAT_08026de8:
    .word NPCList_80297A4
PTR_PTR_EventHandler_School_Class_1B_F20_0_08026dec:
    .word PTR_EventHandler_School_Class_1B_F20_0_08026d2c
PTR_BgTask_8026DF0:
    .word BgTask_School_TilesetBlackboardRooster
PTR_BgTask_8026DF4:
    .word BgTask_School_PaletteBlackboardOn_2
PTR_EntityAllocParams_ARRAY_08026df8:
    .word EntityAllocParams_8029B18
PTR_PTR_DAT_08026dfc:
    .word NPCList_80297A4
PTR_PTR_EventHandler_School_Class_1B_F21_0_08026e00:
    .word PTR_EventHandler_School_Class_1B_F21_0_08026d7c
PTR_BgTask_8026E04:
    .word BgTask_School_TilesetBlackboardRooster
PTR_BgTask_8026E08:
    .word BgTask_School_PaletteBlackboardOn_2
PTR_EntityAllocParams_ARRAY_08026e0c:
    .word EntityAllocParams_8029B18
PTR_PTR_DAT_08026e10:
    .word NPCList_80297A4
PTR_PTR_EventHandler_School_Class_1B_F22_0_08026e14:
    .word PTR_EventHandler_School_Class_1B_F22_0_08026dcc


_ts MapSetup_School_Class_1B_S3
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_School_Class_1B_F30_08026ec4
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Sound_AreaSongChange
    pop        {pc}
PTR_MapSetup_School_Class_1B_F30_08026e28:
    .word MapSetup_School_Class_1B_F30
    .word MapSetup_School_Class_1B_F30
    .word MapSetup_School_Class_1B_F30
    .word MapSetup_School_Class_1B_F30
    .word MapSetup_School_Class_1B_F30
    .word MapSetup_School_Class_1B_F30
    .word MapSetup_School_Class_1B_F30
    .word MapSetup_School_Class_1B_F30


_ts EventHandler_School_Class_1B_S3
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Class_1B_F30_08026ec8
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_Class_1B_F30_08026e54:
    .word EventHandler_School_Class_1B_F30
    .word EventHandler_School_Class_1B_F30
    .word EventHandler_School_Class_1B_F30
    .word EventHandler_School_Class_1B_F30
    .word EventHandler_School_Class_1B_F30
    .word EventHandler_School_Class_1B_F30
    .word EventHandler_School_Class_1B_F30
    .word EventHandler_School_Class_1B_F30


_ts MapSetup_School_Class_1B_F30
    push       {lr}
    push       {r5}
    ldr        r0,PTR_BgTask_8026ECC
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8026ED0
    bl         BgTask_AddNew
    ldr        r0,PTR_EntityAllocParams_ARRAY_08026ed4
    bl         Entity_AllocList
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_PTR_DAT_08026ed8
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_School_Class_1B_F30
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Class_1B_F30_0_08026edc
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    mov        r1,#0x4
    bl         CheckJackIn_2
    pop        {pc}
PTR_EventHandler_School_Class_1B_F30_0_08026ebc:
    .word EventHandler_School_Class_1B_F30_0


_ts EventHandler_School_Class_1B_F30_0
    push       {lr}
    pop        {pc}
PTR_PTR_MapSetup_School_Class_1B_F30_08026ec4:
    .word PTR_MapSetup_School_Class_1B_F30_08026e28
PTR_PTR_EventHandler_School_Class_1B_F30_08026ec8:
    .word PTR_EventHandler_School_Class_1B_F30_08026e54
PTR_BgTask_8026ECC:
    .word BgTask_School_TilesetBlackboardRooster
PTR_BgTask_8026ED0:
    .word BgTask_School_PaletteBlackboardOn_2
PTR_EntityAllocParams_ARRAY_08026ed4:
    .word EntityAllocParams_8029B18
PTR_PTR_DAT_08026ed8:
    .word NPCList_80297A4
PTR_PTR_EventHandler_School_Class_1B_F30_0_08026edc:
    .word PTR_EventHandler_School_Class_1B_F30_0_08026ebc
