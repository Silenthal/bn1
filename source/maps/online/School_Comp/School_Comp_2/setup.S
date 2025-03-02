#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_School_Comp_2_S1
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,PTR_PTR_MapSetup_Default_08040f04
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_803ECF8_08040f08
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_803ED68_08040f0c
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_803F138_08040f10
    bl         BgTask_AddNew
    pop        {r5}
    mov        r0,#0x0
    strb       r0,[r5,#0x1]
    pop        {pc}

    .align 2, 0

PTR_MapSetup_Default_08040c28:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_School_Comp_2_F12
    .word MapSetup_School_Comp_2_F13
    .word MapSetup_School_Comp_2_F14
    .word MapSetup_School_Comp_2_F15
    .word MapSetup_Default
    .word MapSetup_Default


_ts EventHandler_School_Comp_2_S1
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Default_08040f14
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Default_08040c54:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_School_Comp_2_F12
    .word EventHandler_School_Comp_2_F13
    .word EventHandler_School_Comp_2_F14
    .word EventHandler_School_Comp_2_F15
    .word EventHandler_Default
    .word EventHandler_Default


_ts MapSetup_School_Comp_2_F12
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_8041CF8_08040f18
    bl         Map_LoadNPCList
    pop        {r5}
    Flag_GetBase 0xD6
    beq        LAB_08040cac
    Flag_ClearBase 0xD6
    push       {r5}
    ldr        r0,DAT_08040f1c
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_08040cac:
    push       {r5}
    mov        r1,#0x2
    bl         Effect_WWWGate_Create
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_School_Comp_2_F12
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Comp_2_F12_0_08040f20
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    bl         EventHandler_School_Comp_HandleJackOut
    pop        {pc}

    .word FUN_08040cd4


_ts FUN_08040cd4
    push       {lr}
    pop        {pc}


_ts MapSetup_School_Comp_2_F13
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_8041D04_08040f24
    bl         Map_LoadNPCList
    pop        {r5}
    Flag_GetBase 0xD6
    beq        LAB_08040d10
    Flag_ClearBase 0xD6
    push       {r5}
    ldr        r0,PTR_Scene_MegaManJackIn_08040f28
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_08040d10:
    push       {r5}
    Flag_GetBase 0xAC
    pop        {r5}
    beq        LAB_08040d28
    push       {r5}
    Flag_SetIgnore F_IGNORE_WALL_01
    pop        {r5}
    b          LAB_08040d32
LAB_08040d28:
    push       {r5}
    mov        r1,#0x2
    bl         Effect_WWWGate_Create
    pop        {r5}
LAB_08040d32:
    push       {r5}
    Flag_GetBase 0xA8
    pop        {r5}
    beq        LAB_08040d4a
    push       {r5}
    Flag_SetIgnore F_IGNORE_WALL_00
    pop        {r5}
    b          LAB_08040d6c
LAB_08040d4a:
    push       {r5}
    mov        r1,#0x1
    bl         Effect_WWWGate_Create
    pop        {r5}
    push       {r5}
    Flag_GetBase 0xA7
    pop        {r5}
    beq        LAB_08040d72
    push       {r5}
    ldr        r0,PTR_Scene_School_Comp_2_GateClear_08040f2c
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_08040d6c:
    mov        r0,#0x4
    str        r0,[r5,#0x0]
    pop        {pc}
LAB_08040d72:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_School_Comp_2_F13
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Comp_2_F12_0_08040f30
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    bl         EventHandler_School_Comp_HandleJackOut
    pop        {pc}

PTR_EventHandler_School_Comp_2_F12_0_08040d8c:
    .word EventHandler_School_Comp_2_F12_0
    .word EventHandler_School_Comp_2_F12_1
    .word EventHandler_School_Comp_2_F12_2
    .word EventHandler_School_Comp_2_F12_3


_ts EventHandler_School_Comp_2_F12_0
    push       {lr}
    LoadMain world, r0, r7
    ldrb       r0,[r0,#World_curEventFlag]
    cmp        r0,#0x20
    bne        LAB_08040db8
    push       {r5}
    mov        r1,#0x2
    ldr        r0,DAT_08040f34
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x4
    str        r0,[r5,#0x0]
LAB_08040db8:
    pop        {pc}


_nt EventHandler_School_Comp_2_F12_1
    push       {lr}
    push       {r5}
    Flag_GetBase 0xAA
    pop        {r5}
    bne        LAB_08040dde
    LoadMain world, r0, r7
    ldrb       r0,[r0,#World_curEventFlag]
    cmp        r0,#0x21
    bne        LAB_08040de4
    push       {r5}
    mov        r1,#0x4
    ldr        r0,PTR_Scene_ChangeMap_08040f38
    bl         Scene_Prepare
    pop        {r5}
LAB_08040dde:
    ldr        r0,[r5,#0x0]
    add        r0,#0x4
    str        r0,[r5,#0x0]
LAB_08040de4:
    pop        {pc}


_nt EventHandler_School_Comp_2_F12_2
    push       {lr}
    push       {r5}
    Flag_GetBase 0xAA
    pop        {r5}
    beq        LAB_08040e1a
    push       {r5}
    FadeInFast_Black
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_Scene_UnlockWWWGate_08040f3c
    mov        r1,#0x1
    bl         Scene_Prepare
    pop        {r5}
    LoadMain world, r0, r0
    mov        r1,#0x14
    strb       r1,[r0,#World_storyFlag]
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    b          LAB_08040e30
LAB_08040e1a:
    LoadMain world, r0, r7
    ldrb       r0,[r0,#World_curEventFlag]
    cmp        r0,#0x21
    bne        LAB_08040de4
    push       {r5}
    mov        r1,#0x4
    ldr        r0,PTR_Scene_ChangeMap_08040f40
    bl         Scene_Prepare
    pop        {r5}
LAB_08040e30:
    pop        {pc}


_nt EventHandler_School_Comp_2_F12_3
    push       {lr}
    pop        {pc}


_nt MapSetup_School_Comp_2_F14
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_8041D04_08040f44
    bl         Map_LoadNPCList
    pop        {r5}
    Flag_GetBase 0xD6
    beq        LAB_08040e6e
    Flag_ClearBase 0xD6
    push       {r5}
    ldr        r0,PTR_Scene_MegaManJackIn_08040f48
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_08040e6e:
    Flag_SetIgnore F_IGNORE_WALL_00
    Flag_SetIgnore F_IGNORE_WALL_01
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_School_Comp_2_F14
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Comp_2_F14_0_08040f4c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    bl         EventHandler_School_Comp_HandleJackOut
    pop        {pc}

PTR_EventHandler_School_Comp_2_F14_0_08040e94:
    .word EventHandler_School_Comp_2_F14_0


_ts EventHandler_School_Comp_2_F14_0
    push       {lr}
    pop        {pc}


_ts MapSetup_School_Comp_2_F15
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_8041D04_08040f50
    bl         Map_LoadNPCList
    pop        {r5}
    Flag_GetBase 0xD6
    beq        LAB_08040ed4
    Flag_ClearBase 0xD6
    push       {r5}
    ldr        r0,PTR_Scene_MegaManJackIn_08040f54
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_08040ed4:
    Flag_SetIgnore F_IGNORE_WALL_00
    Flag_SetIgnore F_IGNORE_WALL_01
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_School_Comp_2_F15
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Comp_2_F15_0_08040f58
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    bl         EventHandler_School_Comp_HandleJackOut
    pop        {pc}

    .align 2, 0

PTR_EventHandler_School_Comp_2_F15_0_08040efc:
    .word EventHandler_School_Comp_2_F15_0


_ts EventHandler_School_Comp_2_F15_0
    push       {lr}
    pop        {pc}

PTR_PTR_MapSetup_Default_08040f04:
    .word PTR_MapSetup_Default_08040c28

PTR_BgTask_803ECF8_08040f08:
    .word BgTask_803ECF8

PTR_BgTask_803ED68_08040f0c:
    .word BgTask_803ED68

PTR_BgTask_803F138_08040f10:
    .word BgTask_803F138

PTR_PTR_EventHandler_Default_08040f14:
    .word PTR_EventHandler_Default_08040c54

PTR_NPCList_8041CF8_08040f18:
    .word NPCList_8041CF8

DAT_08040f1c:
    .word Scene_MegaManJackIn

PTR_PTR_EventHandler_School_Comp_2_F12_0_08040f20:
    .word PTR_EventHandler_School_Comp_2_F12_0_08040d8c

PTR_NPCList_8041D04_08040f24:
    .word NPCList_8041D04

PTR_Scene_MegaManJackIn_08040f28:
    .word Scene_MegaManJackIn

PTR_Scene_School_Comp_2_GateClear_08040f2c:
    .word Scene_School_Comp_2_GateClear

PTR_PTR_EventHandler_School_Comp_2_F12_0_08040f30:
    .word PTR_EventHandler_School_Comp_2_F12_0_08040d8c

DAT_08040f34:
    .word Scene_ChangeMap

PTR_Scene_ChangeMap_08040f38:
    .word Scene_ChangeMap

PTR_Scene_UnlockWWWGate_08040f3c:
    .word Scene_UnlockWWWGate

PTR_Scene_ChangeMap_08040f40:
    .word Scene_ChangeMap

PTR_NPCList_8041D04_08040f44:
    .word NPCList_8041D04

PTR_Scene_MegaManJackIn_08040f48:
    .word Scene_MegaManJackIn

PTR_PTR_EventHandler_School_Comp_2_F14_0_08040f4c:
    .word PTR_EventHandler_School_Comp_2_F14_0_08040e94

PTR_NPCList_8041D04_08040f50:
    .word NPCList_8041D04

PTR_Scene_MegaManJackIn_08040f54:
    .word Scene_MegaManJackIn

PTR_PTR_EventHandler_School_Comp_2_F15_0_08040f58:
    .word PTR_EventHandler_School_Comp_2_F15_0_08040efc


_ts MapSetup_School_Comp_2_S2
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,PTR_PTR_MapSetup_School_Comp_2_F20_08041040
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_803ECF8_08041044
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_803ED68_08041048
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_803F138_0804104c
    bl         BgTask_AddNew
    pop        {r5}
    pop        {pc}

    .align 2, 0

PTR_MapSetup_School_Comp_2_F20_08040f88:
    .word MapSetup_School_Comp_2_F20
    .word MapSetup_School_Comp_2_F20
    .word MapSetup_School_Comp_2_F20
    .word MapSetup_School_Comp_2_F20
    .word MapSetup_School_Comp_2_F20
    .word MapSetup_School_Comp_2_F20
    .word MapSetup_School_Comp_2_F20
    .word MapSetup_School_Comp_2_F20


_ts EventHandler_School_Comp_2_S2
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Comp_2_F20_08041050
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_School_Comp_2_F20_08040fb4:
    .word EventHandler_School_Comp_2_F20
    .word EventHandler_School_Comp_2_F20
    .word EventHandler_School_Comp_2_F20
    .word EventHandler_School_Comp_2_F20
    .word EventHandler_School_Comp_2_F20
    .word EventHandler_School_Comp_2_F20
    .word EventHandler_School_Comp_2_F20
    .word EventHandler_School_Comp_2_F20


_ts MapSetup_School_Comp_2_F20
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    Flag_SetIgnore F_IGNORE_WALL_00
    Flag_SetIgnore F_IGNORE_WALL_01
    push       {r5}
    ldr        r7,PTR_NPCList_8041D74_08041054
    bl         Map_LoadNPCList
    pop        {r5}
    LoadMain world, r0, r0
    ldrb       r1,[r0,#World_currentArea]
    ldrb       r2,[r0,#World_lastArea]
    cmp        r1,r2
    bne        LAB_0804100e
    cmp        r1,#0x80
    beq        LAB_0804101a
LAB_0804100e:
    push       {r5}
    ldr        r0,DAT_08041058
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_0804101a:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_School_Comp_2_F20
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Comp_2_F20_0_0804105c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}

    .align 2, 0

PTR_EventHandler_School_Comp_2_F20_0_08041038:
    .word EventHandler_School_Comp_2_F20_0


_ts EventHandler_School_Comp_2_F20_0
    push       {lr}
    pop        {pc}

PTR_PTR_MapSetup_School_Comp_2_F20_08041040:
    .word PTR_MapSetup_School_Comp_2_F20_08040f88

PTR_BgTask_803ECF8_08041044:
    .word BgTask_803ECF8

PTR_BgTask_803ED68_08041048:
    .word BgTask_803ED68

PTR_BgTask_803F138_0804104c:
    .word BgTask_803F138

PTR_PTR_EventHandler_School_Comp_2_F20_08041050:
    .word PTR_EventHandler_School_Comp_2_F20_08040fb4

PTR_NPCList_8041D74_08041054:
    .word NPCList_8041D74

DAT_08041058:
    .word Scene_MegaManJackIn

PTR_PTR_EventHandler_School_Comp_2_F20_0_0804105c:
    .word PTR_EventHandler_School_Comp_2_F20_0_08041038
