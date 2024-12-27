#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_WWW_Base_S5
    push       {lr}
    push       {r0,r1}
    bl         Sound_AreaSongChange
    pop        {r0,r1}
    ldr        r0,PTR_PTR_MapSetup_Default_0803dc88
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_803D7AC_0803dc8c
    bl         BgTask_AddNew
    pop        {r5}
    pop        {pc}

    .align 2, 0

PTR_MapSetup_Default_0803da50:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_WWW_Base_F54
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default


_ts EventHandler_WWW_Base_S5
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Default_0803dc90
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Default_0803da7c:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_WWW_Base_F54
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default


_ts MapSetup_WWW_Base_F54
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    mov        r0,#0x0
    bl         Flag_SetGate
    mov        r0,#0xaf
    bl         Flag_GetBase
    bne        LAB_0803dad4
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    mov        r1,#0x0
    strb       r1,[r0,#0x7]
    push       {r5}
    ldr        r0,PTR_Scene_Story_6E_0803dc94
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_0803db8e
LAB_0803dad4:
    mov        r0,#0xb6
    bl         Flag_GetBase
    bne        LAB_0803dae4
    mov        r0,#0x2
    bl         Flag_SetGate
    b          LAB_0803db8e
LAB_0803dae4:
    mov        r0,#0xf8
    bl         Flag_GetBase
    bne        LAB_0803db02
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    mov        r1,#0x0
    strb       r1,[r0,#0x7]
    push       {r5}
    ldr        r0,DAT_0803dc98
    mov        r1,#0x18
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_0803db8e
LAB_0803db02:
    mov        r0,#0xfc
    bl         Flag_GetBase
    bne        LAB_0803db12
    mov        r0,#0x4
    bl         Flag_SetGate
    b          LAB_0803db48
LAB_0803db12:
    mov        r0,#0xe9
    bl         Flag_GetBase
    beq        LAB_0803db3c
    mov        r0,#0xea
    bl         Flag_GetBase
    bne        LAB_0803db3c
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    mov        r1,#0x0
    strb       r1,[r0,#0x7]
    bl         Sound_StopAllMusic
    push       {r5}
    ldr        r0,PTR_Scene_Story_7D_0803dc9c
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_0803db8e
LAB_0803db3c:
    push       {r5}
    ldr        r7,PTR_NPCList_803E5F0_0803dca0
    bl         Map_LoadNPCList
    pop        {r5}
    b          LAB_0803db52
LAB_0803db48:
    push       {r5}
    ldr        r7,PTR_NPCList_803E5D0_0803dca4
    bl         Map_LoadNPCList
    pop        {r5}
LAB_0803db52:
    mov        r0,#0x29
    bl         Flag_GetBase
    beq        LAB_0803db7a
    mov        r6,#0x18
    mov        r0,#0x36
    bl         Flag_GetBase
    beq        LAB_0803db66
    mov        r6,#0x19
LAB_0803db66:
    mov        r0,#0x29
    bl         Flag_ClearBase
    add        r1,r6,#0x0
    push       {r5}
    ldr        r0,DAT_0803dca8
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_0803db8e
LAB_0803db7a:
    mov        r0,#0x2b
    bl         Flag_GetBase
    beq        LAB_0803db8e
    push       {r5}
    ldr        r0,DAT_0803dcac
    mov        r1,#0x21
    bl         Scene_Prepare
    pop        {r5}
LAB_0803db8e:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_WWW_Base_F54
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_WWW_Base_F54_0_0803dcb0
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_WWW_Base_F54_0_0803dba4:
    .word EventHandler_WWW_Base_F54_0


_ts EventHandler_WWW_Base_F54_0
    push       {lr}
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x3
    bne        LAB_0803dbca
    push       {r5}
    ldr        r0,DAT_0803dcb4
    ldr        r1,DAT_0803dcb8
    bl         Scene_Prepare
    pop        {r5}
LAB_0803dbca:
    cmp        r0,#0x1
    bne        LAB_0803dbda
    push       {r5}
    ldr        r0,PTR_Scene_WWW_Base_Exit_0803dcbc
    mov        r1,#0x5
    bl         Scene_Prepare
    pop        {r5}
LAB_0803dbda:
    cmp        r0,#0x5
    bne        LAB_0803dbea
    push       {r5}
    ldr        r0,DAT_0803dcc0
    ldr        r1,DAT_0803dcb8
    bl         Scene_Prepare
    pop        {r5}
LAB_0803dbea:
    mov        r6,#0x1d
    mov        r0,#0x36
    bl         Flag_GetBase
    beq        LAB_0803dbf6
    mov        r6,#0x1e
LAB_0803dbf6:
    mov        r0,#0x29
    bl         Flag_GetBase
    beq        LAB_0803dc0c
    add        r1,r6,#0x0
    push       {r5}
    ldr        r0,DAT_0803dcc4
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_0803dc20
LAB_0803dc0c:
    mov        r0,#0x2b
    bl         Flag_GetBase
    beq        LAB_0803dc20
    push       {r5}
    ldr        r0,DAT_0803dcc8
    mov        r1,#0x28
    bl         Scene_Prepare
    pop        {r5}
LAB_0803dc20:
    mov        r1,#0x17
    bl         EventHandler_Offline_HandleJackIn
    mov        r1,#0x19
    bl         FUN_0803dc2e
    pop        {pc}


_nt FUN_0803dc2e
    push       {lr}
    push       {r1}
    bl         Scene_IsSceneActive
    tst        r0,r0
    beq        LAB_0803dc3e
    pop        {r1}
    pop        {pc}
LAB_0803dc3e:
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x41
    beq        LAB_0803dc56
    pop        {r1}
    pop        {pc}
LAB_0803dc56:
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0803dc82
    mov        r0,r10
    ldr        r0,[r0,#0x4]
    ldrh       r0,[r0,#0x2]
    ldr        r1,DAT_0803dccc
    and        r1,r0
    beq        LAB_0803dc82
    bl         dummy_187a0
    bne        LAB_0803dc82
    pop        {r1}
    push       {r5}
    ldr        r0,PTR_Scene_JackIn_0803dcd0
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0803dc82:
    pop        {r1}
    pop        {pc}

    .align 2, 0

PTR_PTR_MapSetup_Default_0803dc88:
    .word PTR_MapSetup_Default_0803da50

PTR_BgTask_803D7AC_0803dc8c:
    .word BgTask_803D7AC

PTR_PTR_EventHandler_Default_0803dc90:
    .word PTR_EventHandler_Default_0803da7c

PTR_Scene_Story_6E_0803dc94:
    .word Scene_Story_6E

DAT_0803dc98:
    .word Scene_ChangeMap

PTR_Scene_Story_7D_0803dc9c:
    .word Scene_Story_7D

PTR_NPCList_803E5F0_0803dca0:
    .word NPCList_803E5F0

PTR_NPCList_803E5D0_0803dca4:
    .word NPCList_803E5D0

DAT_0803dca8:
    .word Scene_AfterFixedBattle

DAT_0803dcac:
    .word Scene_AfterFixedBattle

PTR_PTR_EventHandler_WWW_Base_F54_0_0803dcb0:
    .word PTR_EventHandler_WWW_Base_F54_0_0803dba4

DAT_0803dcb4:
    .word Scene_LockedPath

DAT_0803dcb8:
    .word 0x285

PTR_Scene_WWW_Base_Exit_0803dcbc:
    .word Scene_WWW_Base_Exit

DAT_0803dcc0:
    .word Scene_LockedPath

DAT_0803dcc4:
    .word Scene_StartFixedBattle

DAT_0803dcc8:
    .word Scene_StartFixedBattle

DAT_0803dccc:
    .word 0x100

PTR_Scene_JackIn_0803dcd0:
    .word Scene_JackIn
