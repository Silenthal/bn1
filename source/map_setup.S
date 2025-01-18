#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


FlagSetup_Offline:
    .word FlagSetup_School
    .word FlagSetup_ACDC
    .word FlagSetup_Govt
    .word FlagSetup_DenTown
    .word FlagSetup_Scilab
    .word FlagSetup_WWW

MapSetup_Offline:
    .word MapSetup_School
    .word MapSetup_ACDC
    .word MapSetup_Govt
    .word MapSetup_DenTown
    .word MapSetup_SciLab
    .word MapSetup_WWW

EventHandler_Offline:
    .word EventHandler_School
    .word EventHandler_ACDC
    .word EventHandler_Govt
    .word EventHandler_DenTown
    .word EventHandler_SciLab
    .word EventHandler_WWW

FlagSetup_Online:
    .word FlagSetup_School_Comp
    .word FlagSetup_Oven_Comp
    .word FlagSetup_Waterworks_Comp
    .word FlagSetup_Traffic_Light_Comp
    .word FlagSetup_Power_Plant_Comp
    .word FlagSetup_WWW_Comp
    .word FlagSetup_None
    .word FlagSetup_None
    .word FlagSetup_ACDC_HP
    .word FlagSetup_Govt_HP
    .word FlagSetup_DenTown_HP
    .word FlagSetup_SciLab_HP
    .word FlagSetup_Other_Comp
    .word FlagSetup_None
    .word FlagSetup_None
    .word FlagSetup_None
    .word FlagSetup_Internet

MapSetup_Online:
    .word MapSetup_School_Comp
    .word MapSetup_Oven_Comp
    .word MapSetup_Waterworks_Comp
    .word MapSetup_Traffic_Light_Comp
    .word MapSetup_Power_Plant_Comp
    .word MapSetup_WWW_Comp
    .word MapSetup_None
    .word MapSetup_None
    .word MapSetup_ACDC_HP
    .word MapSetup_Govt_HP
    .word MapSetup_DenTown_HP
    .word MapSetup_SciLab_HP
    .word MapSetup_Other_Comp
    .word MapSetup_None
    .word MapSetup_None
    .word MapSetup_None
    .word MapSetup_Internet

EventHandler_Online:
    .word EventHandler_School_Comp
    .word EventHandler_Oven_Comp
    .word EventHandler_Waterworks_Comp
    .word EventHandler_Traffic_Light_Comp
    .word EventHandler_Power_Plant_Comp
    .word EventHandler_WWW_Comp
    .word EventHandler_None
    .word EventHandler_None
    .word EventHandler_ACDC_HP
    .word EventHandler_Govt_HP
    .word EventHandler_DenTown_HP
    .word EventHandler_SciLab_HP
    .word EventHandler_Other_Comp
    .word EventHandler_None
    .word EventHandler_None
    .word EventHandler_None
    .word EventHandler_Internet

FlagSetup_None:
    .word FlagSetup_Default
    .word FlagSetup_Default
    .word FlagSetup_Default
    .word FlagSetup_Default
    .word FlagSetup_Default
    .word FlagSetup_Default
    .word FlagSetup_Default
    .word FlagSetup_Default
    .word FlagSetup_Default
    .word FlagSetup_Default
    .word FlagSetup_Default
    .word FlagSetup_Default
    .word FlagSetup_Default
    .word FlagSetup_Default
    .word FlagSetup_Default
    .word FlagSetup_Default

global_label MapSetup_None
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default

global_label EventHandler_None
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default

MapDialogue_Offline:
    .word MapDialogue_School
    .word MapDialogue_ACDC
    .word MapDialogue_Govt
    .word MapDialogue_DenTown
    .word MapDialogue_SciLab
    .word MapDialogue_WWW
MapDialogue_Online:
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word MapDialogue_Govt_HP
    .word 0
    .word 0
    .word 0


_ts FlagSetup_Main
    push       {r5,lr}
    LoadMain mapEventState, r5, r7
    ldr        r3,[r7,#0x8]
    cmp        r0,#0x80
    bge        LAB_08018564
    ldr        r2,PTR_PTR_080187c4
    b          LAB_08018568
LAB_08018564:
    ldr        r2,PTR_PTR_080187c8
    sub        r0,#0x80
LAB_08018568:
    lsl        r0,r0,#0x2
    ldr        r0,[r2,r0]
    ldrb       r3,[r3,#0x6]
    lsr        r2,r3,#0x4
    lsl        r2,r2,#0x2
    ldr        r0,[r0,r2]
    lsl        r1,r3,#0x1c
    lsr        r1,r1,#0x1a
    mov        lr,pc
    @ r0 = list[areaId][storyFlag_Hi]
    @ r1 = storyFlag_Lo
    bx         r0
    pop        {r5,pc}


_ts MapSetup_Main
    push       {r5,lr}
    LoadMain mapEventState, r5, r7
    ldr        r3,[r7,#0x8]
    cmp        r0,#0x80
    bge        LAB_08018590
    ldr        r2,PTR_PTR_080187cc
    b          LAB_08018594
LAB_08018590:
    ldr        r2,PTR_PTR_080187d0
    sub        r0,#0x80
LAB_08018594:
    lsl        r0,r0,#0x2
    ldr        r0,[r2,r0]
    ldrb       r3,[r3,#0x6]
    lsr        r2,r3,#0x4
    lsl        r2,r2,#0x2
    ldr        r0,[r0,r2]
    lsl        r1,r1,#0x2
    ldr        r0,[r0,r1]
    lsl        r1,r3,#0x1c
    lsr        r1,r1,#0x1a
    mov        lr,pc
    @ r0 = list[areaId][storyFlag_Hi][subAreaId]
    @ r1 = storyFlag_Lo
    bx         r0
    pop        {r5,pc}


_ts EventHandler_Main
    push       {r5,lr}
    push       {r0,r1}
    bl         Scene_IsSceneActive
    pop        {r0,r1}
    bne        LAB_080185ee
    LoadMain mapEventState, r5, r7
    ldr        r3,[r7,#0x8]
    cmp        r0,#0x80
    bge        LAB_080185ca
    ldr        r2,PTR_PTR_080187d4
    b          LAB_080185ce
LAB_080185ca:
    ldr        r2,PTR_PTR_080187d8
    sub        r0,#0x80
LAB_080185ce:
    lsl        r0,r0,#0x2
    ldr        r0,[r2,r0]
    ldrb       r3,[r3,#0x6]
    lsr        r2,r3,#0x4
    lsl        r2,r2,#0x2
    ldr        r0,[r0,r2]
    lsl        r1,r1,#0x2
    ldr        r0,[r0,r1]
    lsl        r1,r3,#0x1c
    lsr        r1,r1,#0x1a
    mov        lr,pc
    @ r0 = list[areaId][storyFlag_Hi][subAreaId]
    @ r1 = storyFlag_Lo
    bx         r0
    bl         MapDialogue_Main
    bl         CheckJackInRejectNoise
LAB_080185ee:
    bl         Scene_IsSceneActive
    beq        LAB_080185fc
    LoadMain scene, r5, r5
    mov        lr,pc
    bx         r0
LAB_080185fc:
    pop        {r5,pc}


_ts FlagSetup_Default
    push       {lr}
    pop        {pc}


_ts MapSetup_Default
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
    pop        {pc}


_ts EventHandler_Default
    push       {lr}
    pop        {pc}


_ts CheckForJackOut
    push       {r5,lr}
    LoadMain input, r2, r7
    ldrh       r2,[r2,#0x2]
    ldr        r3,DAT_080187dc
    tst        r3,r2
    beq        LAB_08018668
    ldr        r2,[r7,#0x18]
    ldrb       r2,[r2,#0x3]
    mov        r3,#0x1
    cmp        r2,r3
    beq        LAB_08018668
    bl         dummy_187a0
    bne        LAB_08018668
    push       {r0}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r0}
    bne        LAB_08018668
    push       {r0}
    bl         Scene_IsSceneActive
    pop        {r0}
    bne        LAB_08018668
    push       {r5}
    add        r1,r0,#0x0
    ldr        r0,PTR_Scene_JackOut_080187e0
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x0
    pop        {r5,pc}
LAB_08018668:
    mov        r0,#0x1
    pop        {r5,pc}


_ts CheckForJackIn
    push       {r5,lr}
    LoadMain input, r2, r7
    ldrh       r2,[r2,#0x2]
    ldr        r3,DAT_080187dc
    tst        r3,r2
    beq        LAB_080186c4
    ldr        r2,[r7,#0x18]
    ldrb       r2,[r2,#0x3]
    mov        r3,#0x1
    cmp        r2,r3
    beq        LAB_080186c4
    bl         dummy_187a0
    bne        LAB_080186c4
    push       {r0,r1}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r0,r1}
    bne        LAB_080186c4
    push       {r0,r1}
    bl         Scene_IsSceneActive
    pop        {r0,r1}
    bne        LAB_080186c4
    push       {r0,r1,r5}
    LoadMain world, r7, r7
    ldr        r0,[r7,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    add        r7,r0,#0x0
    pop        {r0,r1,r5}
    cmp        r0,r7
    bne        LAB_080186c4
    push       {r5}
    ldr        r0,PTR_Scene_JackIn_080187e4
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x0
    pop        {r5,pc}
LAB_080186c4:
    mov        r0,#0x1
    pop        {r5,pc}


_ts CheckJackInRejectNoise
    push       {r5,lr}
    LoadMain world, r7, r7
    ldrb       r7,[r7,#0x4]
    cmp        r7,#0x80
    bge        LAB_08018718
    LoadMain input, r2, r7
    ldrh       r2,[r2,#0x2]
    ldr        r3,DAT_080187dc
    tst        r3,r2
    beq        LAB_08018718
    ldr        r2,[r7,#0x18]
    ldrb       r2,[r2,#0x3]
    mov        r3,#0x1
    cmp        r2,r3
    beq        LAB_08018718
    bl         dummy_187a0
    bne        LAB_08018718
    push       {r0,r1}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r0,r1}
    bne        LAB_08018718
    push       {r0,r1}
    mov        r0,#0x0
    bl         KeyItem_IsPresent
    pop        {r0,r1}
    beq        LAB_08018718
    push       {r0,r1}
    bl         Scene_IsSceneActive
    pop        {r0,r1}
    bne        LAB_08018718
    mov        r0,#0x6c
    bl         Sound_PlaySE
LAB_08018718:
    mov        r0,#0x1
    pop        {r5,pc}


_ts GetCollisionEventAttribute
    push       {r5,lr}
    LoadMain world, r0, r0
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    tst        r0,r0
    pop        {r5,pc}


_ts MapDialogue_Main
    push       {r5,lr}
    LoadMain fade, r6, r7
    ldrb       r6,[r6,#0x3]
    mov        r1,#0x1
    cmp        r6,r1
    beq        LAB_0801879a
    bl         dummy_187a0
    bne        LAB_0801879a
    mov        r0,#0x80
    bl         Text_CheckOption
    bne        LAB_0801879a
    bl         Scene_IsSceneActive
    bne        LAB_0801879a
    LoadMain world, r7, r7
    ldrb       r2,[r7,#0xe]
    tst        r2,r2
    beq        LAB_0801879a
    sub        r2,#0xf0
    blt        LAB_0801879a
    cmp        r2,#0x10
    bge        LAB_0801879a
    mov        r1,#0x40
    add        r0,r1,r2
    bl         Flag_GetIgnore
    bne        LAB_0801879a
    LoadMain world, r7, r7
    ldrb       r6,[r7,#0x4]
    ldrb       r7,[r7,#0x5]
    cmp        r6,#0x80
    bge        LAB_0801877e
    ldr        r1,PTR_PTR_080187e8
    b          LAB_08018782
LAB_0801877e:
    ldr        r1,PTR_MapDialogue_Online_080187ec
    sub        r6,#0x80
LAB_08018782:
    lsl        r6,r6,#0x2
    lsl        r7,r7,#0x2
    ldr        r1,[r1,r6]
    ldr        r1,[r1,r7]
    ldrb       r1,[r1,r2]
    cmp        r1,#0xff
    beq        LAB_0801879a
    ldr        r0,PTR_Scene_Dialogue_080187f0
    bl         Scene_Prepare
    mov        r0,#0x0
    pop        {r5,pc}
LAB_0801879a:
    mov        r0,#0x1
    pop        {r5,pc}


_ts dummy_187a0
    push       {r0,r1,r2,lr}
    LoadMain world, r0, r0
    ldrb       r1,[r0,#0x1a]
    ldrb       r2,[r0,#0x1b]
    add        r1,r1,r2
    ldr        r0,PTR_BYTE_080187c0
    ldrb       r2,[r0,#0x0]
    add        r1,r1,r2
    push       {r1}
    bl         PlayerLocation_IsCommentaryState
    pop        {r1}
    add        r1,r1,r0
    pop        {r0,r1,r2,pc}

    .align 2,0

PTR_BYTE_080187c0:
    .word gNpcTalkState
PTR_PTR_080187c4:
    .word FlagSetup_Offline
PTR_PTR_080187c8:
    .word FlagSetup_Online
PTR_PTR_080187cc:
    .word MapSetup_Offline
PTR_PTR_080187d0:
    .word MapSetup_Online
PTR_PTR_080187d4:
    .word EventHandler_Offline
PTR_PTR_080187d8:
    .word EventHandler_Online
DAT_080187dc:
    .word 0x100
PTR_Scene_JackOut_080187e0:
    .word Scene_JackOut
PTR_Scene_JackIn_080187e4:
    .word Scene_JackIn
PTR_PTR_080187e8:
    .word MapDialogue_Offline
PTR_MapDialogue_Online_080187ec:
    .word MapDialogue_Online
PTR_Scene_Dialogue_080187f0:
    .word Scene_Dialogue
