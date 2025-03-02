#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_WWW_Passage_2_S5
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_Default_0803e4f4
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Sound_AreaSongChange
    pop        {pc}

PTR_MapSetup_Default_0803e3ec:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_WWW_Passage_2_F54
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default


_ts EventHandler_WWW_Passage_2_S5
    push       {lr}


_nt FUN_0803e40e
    ldr        r0,PTR_PTR_EventHandler_Default_0803e4f8
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Default_0803e418:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_WWW_Passage_2_F54
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default


_ts MapSetup_WWW_Passage_2_F54
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
    Flag_GetBase 0xFA
    bne        LAB_0803e460
    Flag_SetGate F_GATE_01
    b          LAB_0803e490
LAB_0803e460:
    push       {r5}
    ldr        r7,PTR_NPCList_803EB00_0803e4fc
    bl         Map_LoadNPCList
    pop        {r5}
    Flag_GetBase 0x38
    beq        LAB_0803e490
    mov        r6,#0x1b
    Flag_GetBase 0x39
    beq        LAB_0803e47e
    mov        r6,#0x1c
LAB_0803e47e:
    Flag_ClearBase 0x38
    add        r1,r6,#0x0
    push       {r5}
    ldr        r0,DAT_0803e500
    bl         Scene_Prepare
    pop        {r5}
LAB_0803e490:
    pop        {pc}


_nt EventHandler_WWW_Passage_2_F54
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_WWW_Passage_2_F54_0_0803e504
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_WWW_Passage_2_F54_0_0803e4a4:
    .word EventHandler_WWW_Passage_2_F54_0


_ts EventHandler_WWW_Passage_2_F54_0
    push       {lr}
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#World_playerLocation]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_0803e4ca
    push       {r5}
    ldr        r0,DAT_0803e508
    mov        r1,#0x81
    bl         Scene_Prepare
    pop        {r5}
LAB_0803e4ca:
    mov        r6,#0x20
    Flag_GetBase 0x39
    beq        LAB_0803e4d6
    mov        r6,#0x21
LAB_0803e4d6:
    Flag_GetBase 0x38
    beq        LAB_0803e4ea
    add        r1,r6,#0x0
    push       {r5}
    ldr        r0,DAT_0803e50c
    bl         Scene_Prepare
    pop        {r5}
LAB_0803e4ea:
    mov        r1,#0x18
    bl         EventHandler_Offline_HandleJackIn
    pop        {pc}

    .align 2, 0

PTR_PTR_MapSetup_Default_0803e4f4:
    .word PTR_MapSetup_Default_0803e3ec

PTR_PTR_EventHandler_Default_0803e4f8:
    .word PTR_EventHandler_Default_0803e418

PTR_NPCList_803EB00_0803e4fc:
    .word NPCList_803EB00

DAT_0803e500:
    .word Scene_AfterFixedBattle

PTR_PTR_EventHandler_WWW_Passage_2_F54_0_0803e504:
    .word PTR_EventHandler_WWW_Passage_2_F54_0_0803e4a4

DAT_0803e508:
    .word Scene_LockedPath

DAT_0803e50c:
    .word Scene_StartFixedBattle
