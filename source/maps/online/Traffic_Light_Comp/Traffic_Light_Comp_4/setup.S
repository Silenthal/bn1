#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_Traffic_Light_Comp_4_S3
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,PTR_PTR_MapSetup_Default_08048a1c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         FUN_08049958
    push       {r5}
    ldr        r0,PTR_BgTask_8047574_08048a20
    bl         BgTask_AddNew
    pop        {r5}
    pop        {pc}

    .align 2, 0

PTR_MapSetup_Default_080488bc:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Traffic_Light_Comp_4_F35
    .word MapSetup_Traffic_Light_Comp_4_F36
    .word MapSetup_Default


_ts EventHandler_Traffic_Light_Comp_4_S3
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Default_08048a24
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         FUN_080499a8
    pop        {pc}

PTR_EventHandler_Default_080488ec:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Traffic_Light_Comp_4_F35
    .word EventHandler_Traffic_Light_Comp_4_F36
    .word EventHandler_Default


_ts MapSetup_Traffic_Light_Comp_4_F35
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_804924C_08048a28
    bl         Map_LoadNPCList
    pop        {r5}
    LoadMain world, r0, r0
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    bne        LAB_0804893e
    ldrb       r1,[r0,#World_currentArea]
    ldrb       r2,[r0,#World_lastArea]
    cmp        r1,r2
    beq        LAB_0804894a
LAB_0804893e:
    push       {r5}
    ldr        r0,DAT_08048a2c
    ldr        r1,PTR_DAT_08048a30
    bl         Scene_Prepare
    pop        {r5}
LAB_0804894a:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Traffic_Light_Comp_4_F35
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Traffic_Light_Comp_4_F35_0_08048a34
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Traffic_Light_Comp_4_F35_0_08048960:
    .word EventHandler_Traffic_Light_Comp_4_F35_0


_ts EventHandler_Traffic_Light_Comp_4_F35_0
    push       {lr}
    Flag_GetBase 0xAC
    beq        LAB_08048984
    LoadMain world, r0, r0
    mov        r1,#0x36
    strb       r1,[r0,#World_storyFlag]
    push       {r5}
    ldr        r0,DAT_08048a38
    mov        r1,#0x12
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_08048984:
    LoadMain world, r0, r7
    ldrb       r0,[r0,#World_curEventFlag]
    cmp        r0,#0x20
    bne        LAB_0804899a
    push       {r5}
    ldr        r0,DAT_08048a3c
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_0804899a:
    mov        r0,#0x9
    bl         CheckForJackOut
    pop        {pc}


_nt MapSetup_Traffic_Light_Comp_4_F36
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_804924C_08048a40
    bl         Map_LoadNPCList
    pop        {r5}
    LoadMain world, r0, r0
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    bne        LAB_080489d4
    ldrb       r1,[r0,#World_currentArea]
    ldrb       r2,[r0,#World_lastArea]
    cmp        r1,r2
    beq        LAB_080489e0
LAB_080489d4:
    push       {r5}
    ldr        r0,PTR_Scene_MegaManJackIn_08048a44
    ldr        r1,PTR_DAT_08048a30
    bl         Scene_Prepare
    pop        {r5}
LAB_080489e0:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_Traffic_Light_Comp_4_F36
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Traffic_Light_Comp_4_F36_0_08048a48
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_Traffic_Light_Comp_4_F36_0_080489f8:
    .word EventHandler_Traffic_Light_Comp_4_F36_0


_ts EventHandler_Traffic_Light_Comp_4_F36_0
    push       {lr}
    LoadMain world, r0, r7
    ldrb       r0,[r0,#World_curEventFlag]
    cmp        r0,#0x20
    bne        LAB_08048a14
    push       {r5}
    ldr        r0,DAT_08048a4c
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_08048a14:
    mov        r0,#0x9
    bl         CheckForJackOut
    pop        {pc}

PTR_PTR_MapSetup_Default_08048a1c:
    .word PTR_MapSetup_Default_080488bc

PTR_BgTask_8047574_08048a20:
    .word BgTask_8047574

PTR_PTR_EventHandler_Default_08048a24:
    .word PTR_EventHandler_Default_080488ec

PTR_NPCList_804924C_08048a28:
    .word NPCList_804924C

DAT_08048a2c:
    .word Scene_MegaManJackIn

PTR_DAT_08048a30:
    .word 0x2000

PTR_PTR_EventHandler_Traffic_Light_Comp_4_F35_0_08048a34:
    .word PTR_EventHandler_Traffic_Light_Comp_4_F35_0_08048960

DAT_08048a38:
    .word Scene_ChangeMap

DAT_08048a3c:
    .word Scene_Dialogue

PTR_NPCList_804924C_08048a40:
    .word NPCList_804924C

PTR_Scene_MegaManJackIn_08048a44:
    .word Scene_MegaManJackIn

PTR_PTR_EventHandler_Traffic_Light_Comp_4_F36_0_08048a48:
    .word PTR_EventHandler_Traffic_Light_Comp_4_F36_0_080489f8

DAT_08048a4c:
    .word Scene_Dialogue


_ts MapSetup_Traffic_Light_Comp_4_S4
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,PTR_PTR_MapSetup_Traffic_Light_Comp_4_F40_08048b3c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         FUN_08049958
    push       {r5}
    ldr        r0,PTR_BgTask_8047574_08048b40
    bl         BgTask_AddNew
    pop        {r5}
    pop        {pc}

    .align 2, 0

PTR_MapSetup_Traffic_Light_Comp_4_F40_08048a74:
    .word MapSetup_Traffic_Light_Comp_4_F40
    .word MapSetup_Traffic_Light_Comp_4_F40
    .word MapSetup_Traffic_Light_Comp_4_F40
    .word MapSetup_Traffic_Light_Comp_4_F40
    .word MapSetup_Traffic_Light_Comp_4_F40
    .word MapSetup_Traffic_Light_Comp_4_F40
    .word MapSetup_Traffic_Light_Comp_4_F40
    .word MapSetup_Traffic_Light_Comp_4_F40


_ts EventHandler_Traffic_Light_Comp_4_S4
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Traffic_Light_Comp_4_F40_08048b44
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         FUN_080499a8
    pop        {pc}

PTR_EventHandler_Traffic_Light_Comp_4_F40_08048aa4:
    .word EventHandler_Traffic_Light_Comp_4_F40
    .word EventHandler_Traffic_Light_Comp_4_F40
    .word EventHandler_Traffic_Light_Comp_4_F40
    .word EventHandler_Traffic_Light_Comp_4_F40
    .word EventHandler_Traffic_Light_Comp_4_F40
    .word EventHandler_Traffic_Light_Comp_4_F40
    .word EventHandler_Traffic_Light_Comp_4_F40
    .word EventHandler_Traffic_Light_Comp_4_F40


_ts MapSetup_Traffic_Light_Comp_4_F40
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_804924C_08048b48
    bl         Map_LoadNPCList
    pop        {r5}
    LoadMain world, r0, r0
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    bne        LAB_08048af6
    ldrb       r1,[r0,#World_currentArea]
    ldrb       r2,[r0,#World_lastArea]
    cmp        r1,r2
    beq        LAB_08048b02
LAB_08048af6:
    push       {r5}
    ldr        r0,DAT_08048b4c
    ldr        r1,PTR_DAT_08048b50
    bl         Scene_Prepare
    pop        {r5}
LAB_08048b02:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Traffic_Light_Comp_4_F40
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Traffic_Light_Comp_4_F40_0_08048b54
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Traffic_Light_Comp_4_F40_0_08048b18:
    .word EventHandler_Traffic_Light_Comp_4_F40_0


_ts EventHandler_Traffic_Light_Comp_4_F40_0
    push       {lr}
    LoadMain world, r0, r7
    ldrb       r0,[r0,#World_curEventFlag]
    cmp        r0,#0x20
    bne        LAB_08048b34
    push       {r5}
    ldr        r0,DAT_08048b58
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_08048b34:
    mov        r0,#0x9
    bl         CheckForJackOut
    pop        {pc}

PTR_PTR_MapSetup_Traffic_Light_Comp_4_F40_08048b3c:
    .word PTR_MapSetup_Traffic_Light_Comp_4_F40_08048a74

PTR_BgTask_8047574_08048b40:
    .word BgTask_8047574

PTR_PTR_EventHandler_Traffic_Light_Comp_4_F40_08048b44:
    .word PTR_EventHandler_Traffic_Light_Comp_4_F40_08048aa4

PTR_NPCList_804924C_08048b48:
    .word NPCList_804924C

DAT_08048b4c:
    .word Scene_MegaManJackIn

PTR_DAT_08048b50:
    .word 0x2000

PTR_PTR_EventHandler_Traffic_Light_Comp_4_F40_0_08048b54:
    .word PTR_EventHandler_Traffic_Light_Comp_4_F40_0_08048b18

DAT_08048b58:
    .word Scene_Dialogue
