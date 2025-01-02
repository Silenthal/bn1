#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_WWW_Passage_1_S5
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_Default_0803e3b0
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Sound_AreaSongChange
    pop        {pc}

PTR_MapSetup_Default_0803e270:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_WWW_Passage_1_F54
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default


_ts EventHandler_WWW_Passage_1_S5
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Default_0803e3b4
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Default_0803e29c:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_WWW_Passage_1_F54
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default


_ts MapSetup_WWW_Passage_1_F54
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    Flag_GetBase 0xB0
    bne        LAB_0803e2f0
    LoadMain world, r0, r0
    mov        r1,#0x0
    strb       r1,[r0,#0x7]
    push       {r5}
    ldr        r0,PTR_Scene_Story_6F_0803e3b8
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_0803e2f0:
    Flag_GetBase 0xB2
    bne        LAB_0803e30a
    Flag_SetGate F_GATE_01
    push       {r5}
    ldr        r7,PTR_NPCList_803EA28_0803e3bc
    bl         Map_LoadNPCList
    pop        {r5}
    b          LAB_0803e328
LAB_0803e30a:
    Flag_GetBase 0xB6
    bne        LAB_0803e31e
    push       {r5}
    ldr        r7,PTR_NPCList_803EA38_0803e3c0
    bl         Map_LoadNPCList
    pop        {r5}
    b          LAB_0803e328
LAB_0803e31e:
    push       {r5}
    ldr        r7,PTR_NPCList_803EA4C_0803e3c4
    bl         Map_LoadNPCList
    pop        {r5}
LAB_0803e328:
    Flag_GetBase 0x29
    beq        LAB_0803e34e
    mov        r6,#0x18
    Flag_GetBase 0x36
    beq        LAB_0803e33c
    mov        r6,#0x19
LAB_0803e33c:
    Flag_ClearBase 0x29
    add        r1,r6,#0x0
    push       {r5}
    ldr        r0,DAT_0803e3c8
    bl         Scene_Prepare
    pop        {r5}
LAB_0803e34e:
    pop        {pc}


_ts EventHandler_WWW_Passage_1_F54
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_WWW_Passage_1_F54_0_0803e3cc
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_WWW_Passage_1_F54_0_0803e360:
    .word EventHandler_WWW_Passage_1_F54_0


_ts EventHandler_WWW_Passage_1_F54_0
    push       {lr}
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_0803e386
    push       {r5}
    ldr        r0,DAT_0803e3d0
    ldr        r1,DAT_0803e3d4
    bl         Scene_Prepare
    pop        {r5}
LAB_0803e386:
    mov        r6,#0x1b
    Flag_GetBase 0x36
    beq        LAB_0803e392
    mov        r6,#0x1c
LAB_0803e392:
    Flag_GetBase 0x29
    beq        LAB_0803e3a6
    add        r1,r6,#0x0


_ts FUN_0803e39c
    push       {r5}
    ldr        r0,DAT_0803e3d8
    bl         Scene_Prepare
    pop        {r5}
LAB_0803e3a6:
    mov        r1,#0x16
    bl         EventHandler_Offline_HandleJackIn
    pop        {pc}

    .align 2, 0

PTR_PTR_MapSetup_Default_0803e3b0:
    .word PTR_MapSetup_Default_0803e270

PTR_PTR_EventHandler_Default_0803e3b4:
    .word PTR_EventHandler_Default_0803e29c

PTR_Scene_Story_6F_0803e3b8:
    .word Scene_Story_6F

PTR_NPCList_803EA28_0803e3bc:
    .word NPCList_803EA28

PTR_NPCList_803EA38_0803e3c0:
    .word NPCList_803EA38

PTR_NPCList_803EA4C_0803e3c4:
    .word NPCList_803EA4C

DAT_0803e3c8:
    .word Scene_AfterFixedBattle

PTR_PTR_EventHandler_WWW_Passage_1_F54_0_0803e3cc:
    .word PTR_EventHandler_WWW_Passage_1_F54_0_0803e360

DAT_0803e3d0:
    .word Scene_LockedPath

DAT_0803e3d4:
    .word 0x581

DAT_0803e3d8:
    .word Scene_StartFixedBattle
