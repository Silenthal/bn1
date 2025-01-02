#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_ACDC_Lan_Room_S0
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_ACDC_Lan_Room_F00_0802ca68
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_802CA88
    bl         BgTask_AddNew
    pop        {r5}
    pop        {pc}

    .align 2, 0

PTR_PTR_MapSetup_ACDC_Lan_Room_F00_0802ca68:
    .word PTR_MapSetup_ACDC_Lan_Room_F00_0802ca6c
PTR_MapSetup_ACDC_Lan_Room_F00_0802ca6c:
    .word MapSetup_ACDC_Lan_Room_F00
    .word MapSetup_Default
    .word MapSetup_ACDC_Lan_Room_F02
    .word MapSetup_ACDC_Lan_Room_F03
    .word MapSetup_ACDC_Lan_Room_F04
    .word MapSetup_ACDC_Lan_Room_F05
    .word MapSetup_ACDC_Lan_Room_F06
PTR_BgTask_802CA88:
    .word BgTask_ACDC_Lan_Room_Tileset_Computer


_ts EventHandler_ACDC_Lan_Room_S0
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Lan_Room_F00_0802ca98
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_PTR_EventHandler_ACDC_Lan_Room_F00_0802ca98:
    .word PTR_EventHandler_ACDC_Lan_Room_F00_0802ca9c
PTR_EventHandler_ACDC_Lan_Room_F00_0802ca9c:
    .word EventHandler_ACDC_Lan_Room_F00
    .word EventHandler_Default
    .word EventHandler_ACDC_Lan_Room_F02
    .word EventHandler_ACDC_Lan_Room_F03
    .word EventHandler_ACDC_Lan_Room_F04
    .word EventHandler_ACDC_Lan_Room_F05
    .word EventHandler_ACDC_Lan_Room_F06


_ts MapSetup_ACDC_Lan_Room_F00
    push       {lr}
    push       {r5}
    Flag_GetItem F_ITEM_ACDC_LAN_ROOM_PET
    pop        {r5}
    bne        LAB_0802cade
    push       {r5}
    Flag_SetGate F_GATE_00
    ldr        r7,PTR_DAT_0802cb38
    bl         Map_LoadNPCList
    pop        {r5}
    LoadMain world, r0, r0
    mov        r1,#0xff
    strb       r1,[r0,#0x12]
LAB_0802cade:
    push       {r5}
    Flag_GetBase 0x90
    pop        {r5}
    bne        LAB_0802cb06
    push       {r5}
    Flag_SetSystem F_SYSTEM_NO_START_MENU
    ldr        r0,PTR_BgTask_802CB3C
    bl         BgTask_AddNew
    mov        r0,#0x10
    bl         PetStatusControl_SetState
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}
LAB_0802cb06:
    push       {r5}
    mov        r0,#0x2
    bl         Sound_ChangeSong
    ldr        r0,PTR_BgTask_802CB30
    bl         BgTask_AddNew
    ldr        r0,PTR_DAT_0802cb34
    bl         Entity_AllocList
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    mov        r0,#0xc
    str        r0,[r5,#0x0]
    pop        {pc}
PTR_BgTask_802CB30:
    .word BgTask_ACDC_Lan_Room_Window_Empty
PTR_DAT_0802cb34:
    .word EntityAllocParams_8030F60
PTR_DAT_0802cb38:
    .word NPCList_8030864
PTR_BgTask_802CB3C:
    .word BgTask_ACDC_Lan_Room_Window_Bird


_ts EventHandler_ACDC_Lan_Room_F00
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Lan_Room_F00_0_0802cb50
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_PTR_EventHandler_ACDC_Lan_Room_F00_0_0802cb50:
    .word PTR_EventHandler_ACDC_Lan_Room_F00_0_0802cb54
PTR_EventHandler_ACDC_Lan_Room_F00_0_0802cb54:
    .word EventHandler_ACDC_Lan_Room_F00_0
    .word EventHandler_ACDC_Lan_Room_F00_1
    .word EventHandler_ACDC_Lan_Room_F00_2
    .word EventHandler_ACDC_Lan_Room_F00_3


_ts EventHandler_ACDC_Lan_Room_F00_0
    push       {lr}
    push       {r5}
    ldr        r0,PTR_Scene_Story_00_LanWakesUp_0802cf18
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_ACDC_Lan_Room_F00_1
    push       {lr}
    push       {r5}
    Flag_GetItem F_ITEM_ACDC_LAN_ROOM_PET
    pop        {r5}
    beq        LAB_0802cba4
    push       {r5}
    Flag_ClearSystem F_SYSTEM_NO_START_MENU
    mov        r0,#0x4
    bl         PetStatusControl_SetState
    pop        {r5}
    LoadMain world, r0, r0
    mov        r1,#0x0
    strb       r1,[r0,#0x12]
    mov        r0,#0x8
    strb       r0,[r5,#0x0]
    b          LAB_0802cbc4
LAB_0802cba4:
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x1
    bne        LAB_0802cbc4
    push       {r5}
    ldr        r0,PTR_Scene_LockedPath_0802cf1c
    ldr        r1,DAT_0802cf20
    bl         Scene_Prepare
    pop        {r5}
LAB_0802cbc4:
    pop        {pc}

    .align 2, 0


_ts EventHandler_ACDC_Lan_Room_F00_2
    push       {lr}
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0802cbe6
    push       {r5}
    ldr        r0,DAT_0802cf24
    ldr        r1,DAT_0802cf28
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0xc
    strb       r0,[r5,#0x0]
LAB_0802cbe6:
    pop        {pc}


_ts EventHandler_ACDC_Lan_Room_F00_3
    push       {lr}
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x40
    bne        LAB_0802cc24
    LoadMain input, r0, r0
    ldrh       r0,[r0,#0x2]
    ldr        r1,DAT_0802cf2c
    and        r1,r0
    beq        LAB_0802cc24
    bl         dummy_187a0
    bne        LAB_0802cc24
    mov        r0,#0x80
    bl         Text_CheckOption
    bne        LAB_0802cc24
    push       {r5}
    ldr        r0,PTR_Scene_Dialogue_0802cf30
    mov        r1,#0x7
    bl         Scene_Prepare
    pop        {r5}
LAB_0802cc24:
    pop        {pc}

    .align 2, 0


_ts MapSetup_ACDC_Lan_Room_F02
    push       {lr}
    push       {r5}
    mov        r0,#0x2
    bl         Sound_ChangeSong
    ldr        r0,PTR_DAT_0802cf34
    bl         Entity_AllocList
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    Flag_GetBase 0xE3
    beq        LAB_0802cc6e
    Flag_GetBase 0x99
    bne        LAB_0802cc6e
    push       {r5}
    Flag_SetGate F_GATE_00
    ldr        r0,PTR_BgTask_802CF38
    bl         BgTask_AddNew
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}
LAB_0802cc6e:
    push       {r5}
    ldr        r0,PTR_BgTask_802CF3C
    bl         BgTask_AddNew
    pop        {r5}
    mov        r0,#0x4
    str        r0,[r5,#0x0]
    pop        {pc}

    .align 2, 0


_ts EventHandler_ACDC_Lan_Room_F02
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Lan_Room_F02_0_0802cf40
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_Lan_Room_F02_0_0802cc90:
    .word EventHandler_ACDC_Lan_Room_F02_0
    .word EventHandler_ACDC_Lan_Room_F02_1


_ts EventHandler_ACDC_Lan_Room_F02_0
    push       {lr}
    bl         FUN_0802ce90
    beq        LAB_0802ccca
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x1
    beq        LAB_0802ccba
    cmp        r0,#0x10
    beq        LAB_0802ccba
    b          LAB_0802ccca
LAB_0802ccba:
    push       {r5}
    ldr        r0,PTR_Scene_Story_06_0802cf44
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x4
    str        r0,[r5,#0x0]
LAB_0802ccca:
    pop        {pc}


_ts EventHandler_ACDC_Lan_Room_F02_1
    push       {lr}
    bl         FUN_0802ce90
    beq        LAB_0802ccd4
LAB_0802ccd4:
    pop        {pc}

    .align 2, 0


_ts MapSetup_ACDC_Lan_Room_F03
    push       {lr}
    push       {r5}
    mov        r0,#0x4
    bl         Sound_ChangeSong
    ldr        r0,PTR_DAT_0802cf48
    bl         Entity_AllocList
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r0,PTR_BgTask_802CF4C
    bl         BgTask_AddNew
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_ACDC_Lan_Room_F03
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Lan_Room_F03_0_0802cf50
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_Lan_Room_F03_0_0802cd14:
    .word EventHandler_ACDC_Lan_Room_F03_0
    .word EventHandler_ACDC_Lan_Room_F03_0


_ts EventHandler_ACDC_Lan_Room_F03_0
    push       {lr}
    Flag_GetBase 0xDE
    bne        LAB_0802cd36
    Flag_GetBase 0x99
    beq        LAB_0802cd2e
LAB_0802cd2e:
    mov        r7,#0xc
    bl         FUN_0802ced4
    b          LAB_0802cd3a
LAB_0802cd36:
    bl         FUN_0802ce90
LAB_0802cd3a:
    pop        {pc}


_ts MapSetup_ACDC_Lan_Room_F04
    push       {lr}
    push       {r5}
    mov        r0,#0x4
    bl         Sound_ChangeSong
    ldr        r0,PTR_DAT_0802cf54
    bl         Entity_AllocList
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    mov        r0,#0x0
    bl         PetStatusControl_SetState
    ldr        r0,PTR_BgTask_802CF58
    bl         BgTask_AddNew
    Flag_GetItem F_ITEM_ACDC_LAN_ROOM_WATERGUN
    pop        {r5}
    beq        LAB_0802cd76
    mov        r0,#0x4
    str        r0,[r5,#0x0]
    pop        {pc}
LAB_0802cd76:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_ACDC_Lan_Room_F04
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Lan_Room_F04_0_0802cf5c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_Lan_Room_F04_0_0802cd8c:
    .word EventHandler_ACDC_Lan_Room_F04_0
    .word EventHandler_ACDC_Lan_Room_F04_1


_ts EventHandler_ACDC_Lan_Room_F04_0
    push       {lr}
    mov        r7,#0x12
    bl         FUN_0802ced4
    beq        LAB_0802cd9e
LAB_0802cd9e:
    pop        {pc}


_ts EventHandler_ACDC_Lan_Room_F04_1
    push       {lr}
    mov        r7,#0x12
    bl         FUN_0802ced4
    beq        LAB_0802cdaa
LAB_0802cdaa:
    pop        {pc}


_ts MapSetup_ACDC_Lan_Room_F05
    push       {lr}
    push       {r5}
    mov        r0,#0x4
    bl         Sound_ChangeSong
    ldr        r0,PTR_DAT_0802cf60
    bl         Entity_AllocList
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r0,PTR_BgTask_802CF64
    bl         BgTask_AddNew
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_ACDC_Lan_Room_F05
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Lan_Room_F05_0_0802cf68
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_Lan_Room_F05_0_0802cde8:
    .word EventHandler_ACDC_Lan_Room_F05_0


_ts EventHandler_ACDC_Lan_Room_F05_0
    push       {lr}
    bl         FUN_0802ce90
    beq        LAB_0802cdf4
LAB_0802cdf4:
    pop        {pc}

    .align 2, 0


_ts MapSetup_ACDC_Lan_Room_F06
    push       {lr}
    push       {r5}
    mov        r0,#0x2
    bl         Sound_ChangeSong
    ldr        r0,PTR_DAT_0802cf6c
    bl         Entity_AllocList
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r0,PTR_BgTask_802CF70
    bl         BgTask_AddNew
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_ACDC_Lan_Room_F06
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Lan_Room_F06_0_0802cf74
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_Lan_Room_F06_0_0802ce34:
    .word EventHandler_ACDC_Lan_Room_F06_0
    .word EventHandler_ACDC_Lan_Room_F06_1


_ts EventHandler_ACDC_Lan_Room_F06_0
    push       {lr}
    push       {r5}
    Flag_GetBase 0x00
    pop        {r5}
    beq        LAB_0802ce6e
    push       {r5}
    ldr        r0,DAT_0802cf78
    mov        r1,#0xb
    bl         Scene_Prepare
    LoadMain world, r0, r0
    mov        r1,#0x10
    strb       r1,[r0,#0x6]
    Flag_SetEvent 0x28
    bl         FUN_080102e8
    pop        {r5}
    mov        r0,#0x4
    str        r0,[r5,#0x0]
    b          LAB_0802ce8a
LAB_0802ce6e:
    bl         FUN_0802ce90
    beq        LAB_0802ce8a
    LoadMain world, r0, r7
    ldrb       r1,[r0,#0xe]
    cmp        r1,#0xf3
    bne        LAB_0802ce8a
    push       {r5}
    ldr        r0,DAT_0802cf7c
    mov        r1,#0x19
    bl         Scene_Prepare
    pop        {r5}
LAB_0802ce8a:
    pop        {pc}


_ts EventHandler_ACDC_Lan_Room_F06_1
    push       {lr}
    pop        {pc}


_ts FUN_0802ce90
    push       {lr}
    LoadMain input, r0, r0
    ldrh       r0,[r0,#0x2]
    ldr        r1,DAT_0802cf2c
    mvn        r0,r0
    and        r1,r0
    bne        LAB_0802ced0
    bl         dummy_187a0
    bne        LAB_0802ced0
    mov        r0,#0x80
    bl         Text_CheckOption
    bne        LAB_0802ced0
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x40
    bne        LAB_0802ced0
    push       {r5}
    ldr        r0,PTR_Scene_JackIn_0802cf80
    mov        r1,#0x6
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x0
LAB_0802ced0:
    pop        {pc}

    .align 2, 0


_ts FUN_0802ced4
    push       {lr}
    LoadMain input, r0, r0
    ldrh       r0,[r0,#0x2]
    ldr        r1,DAT_0802cf2c
    mvn        r0,r0
    and        r1,r0
    bne        LAB_0802cf14
    bl         dummy_187a0
    bne        LAB_0802cf14
    mov        r0,#0x80
    bl         Text_CheckOption
    bne        LAB_0802cf14
    push       {r5,r7}
    LoadMain world, r0, r7
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5,r7}
    cmp        r0,#0x40
    bne        LAB_0802cf14
    push       {r5}
    ldr        r0,PTR_Scene_Dialogue_0802cf84
    add        r1,r7,#0x0
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x0
LAB_0802cf14:
    pop        {pc}

    .align 2, 0

PTR_Scene_Story_00_LanWakesUp_0802cf18:
    .word Scene_Story_00_LanWakesUp
PTR_Scene_LockedPath_0802cf1c:
    .word Scene_LockedPath
DAT_0802cf20:
    .word 0x101
DAT_0802cf24:
    .word Scene_CheckMail
DAT_0802cf28:
    .word 0x108
DAT_0802cf2c:
    .word 0x100
PTR_Scene_Dialogue_0802cf30:
    .word Scene_Dialogue
PTR_DAT_0802cf34:
    .word EntityAllocParams_8030F60
PTR_BgTask_802CF38:
    .word BgTask_ACDC_Lan_Room_Window_Bird
PTR_BgTask_802CF3C:
    .word BgTask_ACDC_Lan_Room_Window_Empty
PTR_PTR_EventHandler_ACDC_Lan_Room_F02_0_0802cf40:
    .word PTR_EventHandler_ACDC_Lan_Room_F02_0_0802cc90
PTR_Scene_Story_06_0802cf44:
    .word Scene_Story_06
PTR_DAT_0802cf48:
    .word EntityAllocParams_8030F60
PTR_BgTask_802CF4C:
    .word BgTask_ACDC_Lan_Room_Window_Empty
PTR_PTR_EventHandler_ACDC_Lan_Room_F03_0_0802cf50:
    .word PTR_EventHandler_ACDC_Lan_Room_F03_0_0802cd14
PTR_DAT_0802cf54:
    .word EntityAllocParams_8030F60
PTR_BgTask_802CF58:
    .word BgTask_ACDC_Lan_Room_Window_Empty
PTR_PTR_EventHandler_ACDC_Lan_Room_F04_0_0802cf5c:
    .word PTR_EventHandler_ACDC_Lan_Room_F04_0_0802cd8c
PTR_DAT_0802cf60:
    .word EntityAllocParams_8030F60
PTR_BgTask_802CF64:
    .word BgTask_ACDC_Lan_Room_Window_Empty
PTR_PTR_EventHandler_ACDC_Lan_Room_F05_0_0802cf68:
    .word PTR_EventHandler_ACDC_Lan_Room_F05_0_0802cde8
PTR_DAT_0802cf6c:
    .word EntityAllocParams_8030F60
PTR_BgTask_802CF70:
    .word BgTask_ACDC_Lan_Room_Window_Empty
PTR_PTR_EventHandler_ACDC_Lan_Room_F06_0_0802cf74:
    .word PTR_EventHandler_ACDC_Lan_Room_F06_0_0802ce34
DAT_0802cf78:
    .word Scene_ChangeMap
DAT_0802cf7c:
    .word Scene_Dialogue
PTR_Scene_JackIn_0802cf80:
    .word Scene_JackIn
PTR_Scene_Dialogue_0802cf84:
    .word Scene_Dialogue


_ts MapSetup_ACDC_Lan_Room_S2
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_ACDC_Lan_Room_F20_0802cfcc
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_802D1E4
    bl         BgTask_AddNew
    pop        {r5}
    Flag_GetBase 0xAB
    beq        LAB_0802cfb0
    push       {r5}
    mov        r0,#0x4
    bl         Sound_ChangeSong
    pop        {r5}
    b          LAB_0802cfc8
LAB_0802cfb0:
    Flag_GetBase 0xDF
    beq        LAB_0802cfc4
    push       {r5}
    mov        r0,#0x3
    bl         Sound_ChangeSong
    pop        {r5}
    b          LAB_0802cfc8
LAB_0802cfc4:
    bl         Sound_AreaSongChange
LAB_0802cfc8:
    pop        {pc}

    .align 2, 0

PTR_PTR_MapSetup_ACDC_Lan_Room_F20_0802cfcc:
    .word PTR_MapSetup_ACDC_Lan_Room_F20_0802cfd0
PTR_MapSetup_ACDC_Lan_Room_F20_0802cfd0:
    .word MapSetup_ACDC_Lan_Room_F20
    .word MapSetup_ACDC_Lan_Room_F21
    .word MapSetup_ACDC_Lan_Room_F22
    .word MapSetup_ACDC_Lan_Room_F23
    .word MapSetup_ACDC_Lan_Room_F20
    .word MapSetup_ACDC_Lan_Room_F20
    .word MapSetup_ACDC_Lan_Room_F20
    .word MapSetup_ACDC_Lan_Room_F20


_ts EventHandler_ACDC_Lan_Room_S2
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Lan_Room_F20_0802d004
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r1,#0x6
    bl         EventHandler_Offline_HandleJackIn
    pop        {pc}

    .align 2, 0

PTR_PTR_EventHandler_ACDC_Lan_Room_F20_0802d004:
    .word PTR_EventHandler_ACDC_Lan_Room_F20_0802d008
PTR_EventHandler_ACDC_Lan_Room_F20_0802d008:
    .word EventHandler_ACDC_Lan_Room_F20
    .word EventHandler_ACDC_Lan_Room_F21
    .word EventHandler_ACDC_Lan_Room_F22
    .word EventHandler_ACDC_Lan_Room_F23
    .word EventHandler_ACDC_Lan_Room_F20
    .word EventHandler_ACDC_Lan_Room_F20
    .word EventHandler_ACDC_Lan_Room_F20
    .word EventHandler_ACDC_Lan_Room_F20


_ts MapSetup_ACDC_Lan_Room_F20
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r0,PTR_BgTask_802D1E8
    bl         BgTask_AddNew
    ldr        r0,PTR_DAT_0802d1ec
    bl         Entity_AllocList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_ACDC_Lan_Room_F20
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Lan_Room_F20_0_0802d1f0
    ldrb       r1,[r5,#0x0]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_Lan_Room_F20_0_0802d05c:
    .word EventHandler_ACDC_Lan_Room_F20_0


_ts EventHandler_ACDC_Lan_Room_F20_0
    push       {lr}
    pop        {pc}


_ts MapSetup_ACDC_Lan_Room_F21
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r0,PTR_BgTask_802D1F4
    bl         BgTask_AddNew
    ldr        r0,PTR_DAT_0802d1f8
    bl         Entity_AllocList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_ACDC_Lan_Room_F21
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Lan_Room_F21_0_0802d1fc
    ldrb       r1,[r5,#0x0]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_Lan_Room_F21_0_0802d098:
    .word EventHandler_ACDC_Lan_Room_F21_0


_ts EventHandler_ACDC_Lan_Room_F21_0
    push       {lr}
    Flag_GetBase 0x6F
    beq        LAB_0802d0ae
    LoadMain world, r0, r0
    mov        r1,#0x22
    strb       r1,[r0,#0x6]
LAB_0802d0ae:
    pop        {pc}


_ts MapSetup_ACDC_Lan_Room_F22
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r0,PTR_BgTask_802D200
    bl         BgTask_AddNew
    ldr        r0,PTR_DAT_0802d204
    bl         Entity_AllocList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_ACDC_Lan_Room_F22
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Lan_Room_F22_0_0802d208
    ldrb       r1,[r5,#0x0]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_Lan_Room_F22_0_0802d0e4:
    .word EventHandler_ACDC_Lan_Room_F22_0
    .word EventHandler_ACDC_Lan_Room_F22_1


_ts EventHandler_ACDC_Lan_Room_F22_0
    push       {lr}
    Flag_GetEmailReceived 0x07
    beq        LAB_0802d114
    Flag_GetEmailUnread 0x07
    bne        LAB_0802d114
    LoadMain world, r0, r7
    ldrb       r1,[r0,#0xe]
    cmp        r1,#0xf3
    bne        LAB_0802d114
    push       {r5}
    ldr        r0,DAT_0802d20c
    mov        r1,#0x19
    bl         Scene_Prepare
    pop        {r5}
LAB_0802d114:
    Flag_GetBase 0xDD
    beq        LAB_0802d12c
    mov        r0,#0x4
    str        r0,[r5,#0x0]
    push       {r5}
    mov        r0,#0x8
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
LAB_0802d12c:
    pop        {pc}


_nt EventHandler_ACDC_Lan_Room_F22_1
    push       {lr}
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0802d15c
    LoadMain world, r0, r0
    mov        r1,#0x23
    strb       r1,[r0,#0x6]
    push       {r5}
    LoadMain mapChange, r0, r7
    mov        r1,#0x1
    strb       r1,[r0,#0x10]
    mov        r1,#0x1
    strb       r1,[r0,#0x12]
    ldr        r1,PTR_MapEntrance_0802d210
    str        r1,[r0,#0x14]
    bl         World_ChangeMap
    pop        {r5}
LAB_0802d15c:
    pop        {pc}

    .align 2, 0

MapEntrance_0802d160:
    MapEntrance Map_ACDC_Lan_Room, 5, f(-32, 2, 0)


_ts MapSetup_ACDC_Lan_Room_F23
    push       {lr}
    push       {r5}
    ldr        r0,PTR_BgTask_802D214
    bl         BgTask_AddNew
    ldr        r0,PTR_DAT_0802d218
    bl         Entity_AllocList
    pop        {r5}
    Flag_GetBase 0x9D
    bne        LAB_0802d198
    LoadMain world, r7, r7
    mov        r1,#0x8
    strb       r1,[r7,#0x7]
    mov        r1,#0xff
    strb       r1,[r7,#0x13]
    b          LAB_0802d1b0
LAB_0802d198:
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
LAB_0802d1b0:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_ACDC_Lan_Room_F23
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Lan_Room_F23_0_0802d21c
    ldrb       r1,[r5,#0x0]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_Lan_Room_F23_0_0802d1c4:
    .word EventHandler_ACDC_Lan_Room_F23_0
    .word EventHandler_ACDC_Lan_Room_F23_1


_ts EventHandler_ACDC_Lan_Room_F23_0
    push       {lr}
    push       {r5}
    ldr        r0,PTR_Scene_Story_21_0802d220
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_ACDC_Lan_Room_F23_1
    push       {lr}
    pop        {pc}
PTR_BgTask_802D1E4:
    .word BgTask_ACDC_Lan_Room_Tileset_Computer
PTR_BgTask_802D1E8:
    .word BgTask_ACDC_Lan_Room_Window_Bird
PTR_DAT_0802d1ec:
    .word EntityAllocParams_8030F60
PTR_PTR_EventHandler_ACDC_Lan_Room_F20_0_0802d1f0:
    .word PTR_EventHandler_ACDC_Lan_Room_F20_0_0802d05c
PTR_BgTask_802D1F4:
    .word BgTask_ACDC_Lan_Room_Window_Bird
PTR_DAT_0802d1f8:
    .word EntityAllocParams_8030F60
PTR_PTR_EventHandler_ACDC_Lan_Room_F21_0_0802d1fc:
    .word PTR_EventHandler_ACDC_Lan_Room_F21_0_0802d098
PTR_BgTask_802D200:
    .word BgTask_ACDC_Lan_Room_Window_Bird
PTR_DAT_0802d204:
    .word EntityAllocParams_8030F60
PTR_PTR_EventHandler_ACDC_Lan_Room_F22_0_0802d208:
    .word PTR_EventHandler_ACDC_Lan_Room_F22_0_0802d0e4
DAT_0802d20c:
    .word Scene_Dialogue
PTR_MapEntrance_0802d210:
    .word MapEntrance_0802d160
PTR_BgTask_802D214:
    .word BgTask_ACDC_Lan_Room_Window_Bird
PTR_DAT_0802d218:
    .word EntityAllocParams_8030F60
PTR_PTR_EventHandler_ACDC_Lan_Room_F23_0_0802d21c:
    .word PTR_EventHandler_ACDC_Lan_Room_F23_0_0802d1c4
PTR_Scene_Story_21_0802d220:
    .word Scene_Story_21


_ts MapSetup_ACDC_Lan_Room_S3
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_ACDC_Lan_Room_F30_0802d298
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_802D29C
    bl         BgTask_AddNew
    pop        {r5}
    bl         Sound_AreaSongChange
    pop        {pc}

    .align 2, 0

PTR_MapSetup_ACDC_Lan_Room_F30_0802d240:
    .word MapSetup_ACDC_Lan_Room_F30


_ts EventHandler_ACDC_Lan_Room_S3
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Lan_Room_F30_0802d2a0
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r1,#0x6
    bl         EventHandler_Offline_HandleJackIn
    pop        {pc}

    .align 2, 0

PTR_EventHandler_ACDC_Lan_Room_F30_0802d258:
    .word EventHandler_ACDC_Lan_Room_F30


_ts MapSetup_ACDC_Lan_Room_F30
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r0,PTR_BgTask_802D2A4
    bl         BgTask_AddNew
    ldr        r0,PTR_DAT_0802d2a8
    bl         Entity_AllocList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_ACDC_Lan_Room_F30
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Lan_Room_F30_0_0802d2ac
    ldrb       r1,[r5,#0x0]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_Lan_Room_F30_0_0802d290:
    .word EventHandler_ACDC_Lan_Room_F30_0


_ts EventHandler_ACDC_Lan_Room_F30_0
    push       {lr}
    pop        {pc}
PTR_PTR_MapSetup_ACDC_Lan_Room_F30_0802d298:
    .word PTR_MapSetup_ACDC_Lan_Room_F30_0802d240
PTR_BgTask_802D29C:
    .word BgTask_ACDC_Lan_Room_Tileset_Computer
PTR_PTR_EventHandler_ACDC_Lan_Room_F30_0802d2a0:
    .word PTR_EventHandler_ACDC_Lan_Room_F30_0802d258
PTR_BgTask_802D2A4:
    .word BgTask_ACDC_Lan_Room_Window_Bird
PTR_DAT_0802d2a8:
    .word EntityAllocParams_8030F60
PTR_PTR_EventHandler_ACDC_Lan_Room_F30_0_0802d2ac:
    .word PTR_EventHandler_ACDC_Lan_Room_F30_0_0802d290


_ts MapSetup_ACDC_Lan_Room_S5
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_ACDC_Lan_Room_F50_0802d438
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_802D43C
    bl         BgTask_AddNew
    pop        {r5}
    bl         Sound_AreaSongChange
    pop        {pc}

    .align 2, 0

PTR_MapSetup_ACDC_Lan_Room_F50_0802d2cc:
    .word MapSetup_ACDC_Lan_Room_F50
    .word MapSetup_ACDC_Lan_Room_F50
    .word MapSetup_ACDC_Lan_Room_F52
    .word MapSetup_ACDC_Lan_Room_F53
    .word MapSetup_ACDC_Lan_Room_F53
    .word MapSetup_ACDC_Lan_Room_F53
    .word MapSetup_ACDC_Lan_Room_F53
    .word MapSetup_ACDC_Lan_Room_F53


_ts EventHandler_ACDC_Lan_Room_S5
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Lan_Room_F50_0802d440
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r1,#0x6
    bl         EventHandler_Offline_HandleJackIn
    pop        {pc}

    .align 2, 0

PTR_EventHandler_ACDC_Lan_Room_F50_0802d300:
    .word EventHandler_ACDC_Lan_Room_F50
    .word EventHandler_ACDC_Lan_Room_F50
    .word EventHandler_ACDC_Lan_Room_F52
    .word EventHandler_ACDC_Lan_Room_F53
    .word EventHandler_ACDC_Lan_Room_F53
    .word EventHandler_ACDC_Lan_Room_F53
    .word EventHandler_ACDC_Lan_Room_F53
    .word EventHandler_ACDC_Lan_Room_F53


_ts MapSetup_ACDC_Lan_Room_F50
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r0,PTR_BgTask_802D444
    bl         BgTask_AddNew
    ldr        r0,PTR_DAT_0802d448
    bl         Entity_AllocList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_ACDC_Lan_Room_F50
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Lan_Room_F50_0_0802d44c
    ldrb       r1,[r5,#0x0]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_Lan_Room_F50_0_0802d354:
    .word EventHandler_ACDC_Lan_Room_F50_0


_ts EventHandler_ACDC_Lan_Room_F50_0
    push       {lr}
    Flag_GetEmailReceived 0x0E
    bne        LAB_0802d36e
    push       {r5}
    ldr        r0,DAT_0802d450
    ldr        r1,DAT_0802d454
    bl         Scene_Prepare
    pop        {r5}
LAB_0802d36e:
    pop        {pc}


_ts MapSetup_ACDC_Lan_Room_F52
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r0,PTR_BgTask_802D458
    bl         BgTask_AddNew
    ldr        r0,PTR_DAT_0802d45c
    bl         Entity_AllocList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_ACDC_Lan_Room_F52
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Lan_Room_F52_0_0802d460
    ldrb       r1,[r5,#0x0]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_Lan_Room_F52_0_0802d3a4:
    .word EventHandler_ACDC_Lan_Room_F52_0


_ts EventHandler_ACDC_Lan_Room_F52_0
    push       {lr}
    Flag_GetBase 0xA0
    beq        LAB_0802d3c6
    LoadMain world, r0, r0
    mov        r1,#0x53
    strb       r1,[r0,#0x6]
    push       {r5}
    ldr        r0,DAT_0802d464
    mov        r1,#0x16
    bl         Scene_Prepare
    pop        {r5}
LAB_0802d3c6:
    Flag_GetBase 0x9E
    beq        LAB_0802d3e4
    LoadMain world, r0, r7
    ldrb       r1,[r0,#0xe]
    cmp        r1,#0xf3
    bne        LAB_0802d3e4
    push       {r5}
    ldr        r0,DAT_0802d468
    mov        r1,#0x19
    bl         Scene_Prepare
    pop        {r5}
LAB_0802d3e4:
    pop        {pc}


_nt MapSetup_ACDC_Lan_Room_F53
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r0,PTR_BgTask_802D46C
    bl         BgTask_AddNew
    ldr        r0,PTR_DAT_0802d470
    bl         Entity_AllocList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_ACDC_Lan_Room_F53
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Lan_Room_F53_0_0802d474
    ldrb       r1,[r5,#0x0]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_ACDC_Lan_Room_F53_0_0802d41c:
    .word EventHandler_ACDC_Lan_Room_F53_0


_ts EventHandler_ACDC_Lan_Room_F53_0
    push       {lr}
    Flag_GetEmailReceived 0x11
    bne        LAB_0802d436
    push       {r5}
    ldr        r0,DAT_0802d478
    ldr        r1,DAT_0802d47c
    bl         Scene_Prepare
    pop        {r5}
LAB_0802d436:
    pop        {pc}
PTR_PTR_MapSetup_ACDC_Lan_Room_F50_0802d438:
    .word PTR_MapSetup_ACDC_Lan_Room_F50_0802d2cc
PTR_BgTask_802D43C:
    .word BgTask_ACDC_Lan_Room_Tileset_Computer
PTR_PTR_EventHandler_ACDC_Lan_Room_F50_0802d440:
    .word PTR_EventHandler_ACDC_Lan_Room_F50_0802d300
PTR_BgTask_802D444:
    .word BgTask_ACDC_Lan_Room_Window_Bird
PTR_DAT_0802d448:
    .word EntityAllocParams_8030F60
PTR_PTR_EventHandler_ACDC_Lan_Room_F50_0_0802d44c:
    .word PTR_EventHandler_ACDC_Lan_Room_F50_0_0802d354
DAT_0802d450:
    .word Scene_CheckMail
DAT_0802d454:
    .word 0x14B
PTR_BgTask_802D458:
    .word BgTask_ACDC_Lan_Room_Window_Bird
PTR_DAT_0802d45c:
    .word EntityAllocParams_8030F60
PTR_PTR_EventHandler_ACDC_Lan_Room_F52_0_0802d460:
    .word PTR_EventHandler_ACDC_Lan_Room_F52_0_0802d3a4
DAT_0802d464:
    .word Scene_ChangeMap
DAT_0802d468:
    .word Scene_Dialogue
PTR_BgTask_802D46C:
    .word BgTask_ACDC_Lan_Room_Window_Bird
PTR_DAT_0802d470:
    .word EntityAllocParams_8030F60
PTR_PTR_EventHandler_ACDC_Lan_Room_F53_0_0802d474:
    .word PTR_EventHandler_ACDC_Lan_Room_F53_0_0802d41c
DAT_0802d478:
    .word Scene_CheckMail
DAT_0802d47c:
    .word 0x15A


_ts MapSetup_ACDC_Lan_Room_S4
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_ACDC_Lan_Room_F40_0802d52c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_802D530
    bl         BgTask_AddNew
    pop        {r5}
    bl         Sound_AreaSongChange
    pop        {pc}

    .align 2, 0

PTR_MapSetup_ACDC_Lan_Room_F40_0802d49c:
    .word MapSetup_ACDC_Lan_Room_F40
    .word MapSetup_ACDC_Lan_Room_F40
    .word MapSetup_ACDC_Lan_Room_F40
    .word MapSetup_ACDC_Lan_Room_F40
    .word MapSetup_ACDC_Lan_Room_F40
    .word MapSetup_ACDC_Lan_Room_F40
    .word MapSetup_ACDC_Lan_Room_F40
    .word MapSetup_ACDC_Lan_Room_F40


_ts EventHandler_ACDC_Lan_Room_S4
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Lan_Room_F40_0802d534
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r1,#0x6
    bl         EventHandler_Offline_HandleJackIn
    pop        {pc}

    .align 2, 0

PTR_EventHandler_ACDC_Lan_Room_F40_0802d4d0:
    .word EventHandler_ACDC_Lan_Room_F40
    .word EventHandler_ACDC_Lan_Room_F40
    .word EventHandler_ACDC_Lan_Room_F40
    .word EventHandler_ACDC_Lan_Room_F40
    .word EventHandler_ACDC_Lan_Room_F40
    .word EventHandler_ACDC_Lan_Room_F40
    .word EventHandler_ACDC_Lan_Room_F40
    .word EventHandler_ACDC_Lan_Room_F40


_ts MapSetup_ACDC_Lan_Room_F40
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r0,PTR_BgTask_802D538
    bl         BgTask_AddNew
    ldr        r0,PTR_DAT_0802d53c
    bl         Entity_AllocList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_ACDC_Lan_Room_F40
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Lan_Room_F40_0_0802d540
    ldrb       r1,[r5,#0x0]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_Lan_Room_F40_0_0802d524:
    .word EventHandler_ACDC_Lan_Room_F40_0


_ts EventHandler_ACDC_Lan_Room_F40_0
    push       {lr}
    pop        {pc}
PTR_PTR_MapSetup_ACDC_Lan_Room_F40_0802d52c:
    .word PTR_MapSetup_ACDC_Lan_Room_F40_0802d49c
PTR_BgTask_802D530:
    .word BgTask_ACDC_Lan_Room_Tileset_Computer
PTR_PTR_EventHandler_ACDC_Lan_Room_F40_0802d534:
    .word PTR_EventHandler_ACDC_Lan_Room_F40_0802d4d0
PTR_BgTask_802D538:
    .word BgTask_ACDC_Lan_Room_Window_Bird
PTR_DAT_0802d53c:
    .word EntityAllocParams_8030F60
PTR_PTR_EventHandler_ACDC_Lan_Room_F40_0_0802d540:
    .word PTR_EventHandler_ACDC_Lan_Room_F40_0_0802d524
