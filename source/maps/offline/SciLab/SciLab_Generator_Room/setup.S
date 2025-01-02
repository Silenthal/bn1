#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_SciLab_Generator_Room_S4
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_Default_0803d0f4
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    Flag_GetBase 0xC5
    beq        LAB_0803cf36
    push       {r5}
    ldr        r0,PTR_BgTask_803BD78_0803d0f8
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_803BB84_0803d0fc
    bl         BgTask_AddNew
    b          LAB_0803cf54
LAB_0803cf36:
    push       {r5}
    Flag_GetBase 0xC4
    beq        LAB_0803cf4e
    ldr        r0,PTR_BgTask_803BB6C_0803d100
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_803BCD8_0803d104
    bl         BgTask_AddNew
    b          LAB_0803cf54
LAB_0803cf4e:
    ldr        r0,PTR_BgTask_803BB84_0803d108
    bl         BgTask_AddNew
LAB_0803cf54:
    pop        {r5}
    Flag_GetBase 0xC5
    bne        LAB_0803cf66
    mov        r0,#T_Suspicious_Mood
    bl         Sound_ChangeSong
    b          LAB_0803cf6a
LAB_0803cf66:
    bl         Sound_AreaSongChange
LAB_0803cf6a:
    pop        {pc}

PTR_MapSetup_Default_0803cf6c:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_SciLab_Generator_Room_F43
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default


_ts EventHandler_SciLab_Generator_Room_S4
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Default_0803d10c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Default_0803cf98:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_SciLab_Generator_Room_F43
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default


_ts MapSetup_SciLab_Generator_Room_F43
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    Flag_GetBase 0xB6
    beq        LAB_0803d014
    LoadMain world, r0, r0
    mov        r1,#0x0
    strb       r1,[r0,#0x7]
    Flag_GetBase 0xB7
    bne        LAB_0803cff2
    push       {r5}
    ldr        r0,PTR_Scene_Story_62_0803d110
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_0803d014
LAB_0803cff2:
    Flag_GetBase 0xB8
    bne        LAB_0803d008
    push       {r5}
    ldr        r0,PTR_Scene_Story_63_0803d114
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_0803d014
LAB_0803d008:
    push       {r5}
    ldr        r0,PTR_Scene_Story_64_0803d118
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_0803d014:
    Flag_ClearBase 0xC1
    Flag_GetBase 0xC4
    beq        LAB_0803d032
    push       {r5}
    mov        r0,#0x2
    bl         Effect_BarSwitch_Create
    pop        {r5}
    mov        r0,#0x8
    str        r0,[r5,#0x0]
    pop        {pc}
LAB_0803d032:
    push       {r5}
    mov        r0,#0x0
    bl         Effect_GeneratorLightning_Create
    pop        {r5}
    push       {r5}
    mov        r0,#0x0
    bl         Effect_BarSwitch_Create
    pop        {r5}
    Flag_GetBase 0xBF
    beq        LAB_0803d054
    mov        r0,#0x4
    str        r0,[r5,#0x0]
    pop        {pc}
LAB_0803d054:
    Flag_GetBase 0xBB
    bne        LAB_0803d06e
    Flag_SetBase 0xBB
    push       {r5}
    ldr        r0,DAT_0803d11c
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_0803d06e:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_SciLab_Generator_Room_F43
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_SciLab_Generator_Room_F43_0_0803d120
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_SciLab_Generator_Room_F43_0_0803d084:
    .word EventHandler_SciLab_Generator_Room_F43_0
    .word EventHandler_SciLab_Generator_Room_F43_1
    .word EventHandler_SciLab_Generator_Room_F43_2


_ts EventHandler_SciLab_Generator_Room_F43_0
    push       {lr}
    LoadMain world, r0, r7
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x20
    bne        LAB_0803d0ae
    Flag_SetBase 0xBC
    push       {r5}
    ldr        r0,PTR_Scene_RechargePrompt_0803d124
    mov        r1,#0x4
    bl         Scene_Prepare
    pop        {r5}
LAB_0803d0ae:
    pop        {pc}


_ts EventHandler_SciLab_Generator_Room_F43_1
    push       {lr}
    LoadMain world, r0, r7
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x20
    bne        LAB_0803d0d0
    Flag_GetBase 0xC0
    bne        LAB_0803d0d0
    push       {r5}
    ldr        r0,PTR_Scene_Story_5D_0803d128
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_0803d0d0:
    pop        {pc}


_nt EventHandler_SciLab_Generator_Room_F43_2
    push       {lr}
    LoadMain world, r0, r7
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x20
    bne        LAB_0803d0f2
    Flag_GetBase 0xC5
    bne        LAB_0803d0f2
    push       {r5}
    ldr        r0,PTR_Scene_Story_60_0803d12c
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_0803d0f2:
    pop        {pc}

PTR_PTR_MapSetup_Default_0803d0f4:
    .word PTR_MapSetup_Default_0803cf6c

PTR_BgTask_803BD78_0803d0f8:
    .word BgTask_803BD78

PTR_BgTask_803BB84_0803d0fc:
    .word BgTask_803BB84

PTR_BgTask_803BB6C_0803d100:
    .word BgTask_803BB6C

PTR_BgTask_803BCD8_0803d104:
    .word BgTask_803BCD8

PTR_BgTask_803BB84_0803d108:
    .word BgTask_803BB84

PTR_PTR_EventHandler_Default_0803d10c:
    .word PTR_EventHandler_Default_0803cf98

PTR_Scene_Story_62_0803d110:
    .word Scene_Story_62

PTR_Scene_Story_63_0803d114:
    .word Scene_Story_63

PTR_Scene_Story_64_0803d118:
    .word Scene_Story_64

DAT_0803d11c:
    .word Scene_Dialogue

PTR_PTR_EventHandler_SciLab_Generator_Room_F43_0_0803d120:
    .word PTR_EventHandler_SciLab_Generator_Room_F43_0_0803d084

PTR_Scene_RechargePrompt_0803d124:
    .word Scene_RechargePrompt

PTR_Scene_Story_5D_0803d128:
    .word Scene_Story_5D

PTR_Scene_Story_60_0803d12c:
    .word Scene_Story_60


_ts MapSetup_SciLab_Generator_Room_S5
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_SciLab_Generator_Room_F50_0803d1d8
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_803BD78_0803d1dc
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_803BB84_0803d1e0
    bl         BgTask_AddNew
    pop        {r5}
    bl         Sound_AreaSongChange
    pop        {pc}

PTR_MapSetup_SciLab_Generator_Room_F50_0803d150:
    .word MapSetup_SciLab_Generator_Room_F50
    .word MapSetup_SciLab_Generator_Room_F50
    .word MapSetup_SciLab_Generator_Room_F50
    .word MapSetup_SciLab_Generator_Room_F50
    .word MapSetup_SciLab_Generator_Room_F50
    .word MapSetup_SciLab_Generator_Room_F50
    .word MapSetup_SciLab_Generator_Room_F50
    .word MapSetup_SciLab_Generator_Room_F50


_ts EventHandler_SciLab_Generator_Room_S5
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_SciLab_Generator_Room_F50_0803d1e4
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_SciLab_Generator_Room_F50_0803d17c:
    .word EventHandler_SciLab_Generator_Room_F50
    .word EventHandler_SciLab_Generator_Room_F50
    .word EventHandler_SciLab_Generator_Room_F50
    .word EventHandler_SciLab_Generator_Room_F50
    .word EventHandler_SciLab_Generator_Room_F50
    .word EventHandler_SciLab_Generator_Room_F50
    .word EventHandler_SciLab_Generator_Room_F50
    .word EventHandler_SciLab_Generator_Room_F50


_ts MapSetup_SciLab_Generator_Room_F50
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    mov        r0,#0x0
    bl         Effect_BarSwitch_Create
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_SciLab_Generator_Room_F50
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_SciLab_Generator_Room_F50_0_0803d1e8
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_SciLab_Generator_Room_F50_0_0803d1d0:
    .word EventHandler_SciLab_Generator_Room_F50_0


_ts EventHandler_SciLab_Generator_Room_F50_0
    push       {lr}
    pop        {pc}

PTR_PTR_MapSetup_SciLab_Generator_Room_F50_0803d1d8:
    .word PTR_MapSetup_SciLab_Generator_Room_F50_0803d150

PTR_BgTask_803BD78_0803d1dc:
    .word BgTask_803BD78

PTR_BgTask_803BB84_0803d1e0:
    .word BgTask_803BB84

PTR_PTR_EventHandler_SciLab_Generator_Room_F50_0803d1e4:
    .word PTR_EventHandler_SciLab_Generator_Room_F50_0803d17c

PTR_PTR_EventHandler_SciLab_Generator_Room_F50_0_0803d1e8:
    .word PTR_EventHandler_SciLab_Generator_Room_F50_0_0803d1d0
