#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set PlayerLocation_Create, 0x8056020
    .set FUN_080560f8, 0x80560f8
    .set Scene_JackOut, 0x80836c8+1
    .set Scene_JackIn, 0x8083eec+1
    .set Script_ShowDialogue, 0x80848fc+1

flagSetup_Offline:
    .word 0x802433c @ flagSetup_ACDC_Elementary
    .word 0x802a5f4 @ flagSetup_ACDC_Town
    .word 0x80313c8 @ flagSetup_Govt_Complex
    .word 0x8035fa4 @ flagSetup_DenTown
    .word 0x803be28 @ flagSetup_Scilab
    .word 0x803d908 @ flagSetup_WWW_Base
mapSetup_Offline:
    .word 0x8024354 @ mapSetup_ACDCElementary
    .word 0x802a60c @ mapSetup_ACDCTown
    .word 0x80313e0 @ mapSetup_GovtComplex
    .word 0x8035fbc @ mapSetup_DenTown
    .word 0x803be40 @ mapSetup_SciLabBasement
    .word 0x803d920 @ mapSetup_WWW_Base
eventHandler_Offline:
    .word 0x80244a8 @ eventHandler_ACDC_Elementary
    .word 0x802a774 @ eventHandler_ACDC_Town
    .word 0x80314b8 @ eventHandler_Govt_Complex
    .word 0x8036034 @ eventHandler_DenTown
    .word 0x803be88 @ eventHandler_SciLab
    .word 0x803d968 @ eventHandler_WWW_Base
flagSetup_Online:
    .word 0x80405ac @ flagSetup_School_Comp
    .word 0x80431d0 @ flagSetup_Oven_Comp
    .word 0x80457b0 @ flagSetup_Waterworks_Comp
    .word 0x8047ef8 @ flagSetup_Traffic_Light_Comp
    .word 0x804a1bc @ flagSetup_Power_Plant_Comp
    .word 0x804d22c @ flagSetup_WWW_Comp
    .word 0x8018448 @ flagSetup_None
    .word 0x8018448 @ flagSetup_None
    .word 0x804efa0 @ flagSetup_ACDC_HP
    .word 0x804f8b4 @ flagSetup_Govt_Complex_HP
    .word 0x804fe64 @ flagSetup_DenTown_HP
    .word 0x8050120 @ flagSetup_SciLab_HP
    .word 0x805048c @ flagSetup_Other_Comp
    .word 0x8018448 @ flagSetup_None
    .word 0x8018448 @ flagSetup_None
    .word 0x8018448 @ flagSetup_None
    .word 0x8051e18 @ flagSetup_Internet
mapSetup_Online:
    .word 0x80405c4 @ mapSetup_School_Comp
    .word 0x80431e8 @ mapSetup_Oven_Comp
    .word 0x80457c8 @ mapSetup_Waterworks_Comp
    .word 0x8047f10 @ mapSetup_Traffic_Light_Comp
    .word 0x804a1d4 @ mapSetup_Power_Plant_Comp
    .word 0x804d244 @ mapSetup_WWW_Comp
    .word 0x8018488 @ mapSetup_None
    .word 0x8018488 @ mapSetup_None
    .word 0x804efb8 @ mapSetup_ACDC_HP
    .word 0x804f8cc @ mapSetup_Govt_Complex_HP
    .word 0x804fe7c @ mapSetup_DenTown_HP
    .word 0x8050138 @ mapSetup_SciLab_HP
    .word 0x80504a4 @ mapSetup_Other_Comp
    .word 0x8018488 @ mapSetup_None
    .word 0x8018488 @ mapSetup_None
    .word 0x8018488 @ mapSetup_None
    .word 0x8051e30 @ mapSetup_Internet
eventHandler_Online:
    .word 0x8040618 @ eventHandler_School_Comp
    .word 0x8043218 @ eventHandler_Oven_Comp
    .word 0x8045840 @ eventHandler_Waterworks_Comp
    .word 0x8047f8c @ eventHandler_Traffic_Light_Comp
    .word 0x804a24c @ eventHandler_Power_Plant_Comp
    .word 0x804d274 @ eventHandler_WWW_Comp
    .word 0x80184c8 @ eventHandler_None
    .word 0x80184c8 @ eventHandler_None
    .word 0x804efe0 @ eventHandler_ACDC_HP
    .word 0x804f8fc @ eventHandler_Govt_Complex_HP
    .word 0x804fe98 @ eventHandler_DenTown_HP
    .word 0x8050154 @ eventHandler_SciLab_HP
    .word 0x80504f0 @ eventHandler_Other_Comp
    .word 0x80184c8 @ eventHandler_None
    .word 0x80184c8 @ eventHandler_None
    .word 0x80184c8 @ eventHandler_None
    .word 0x8051e88 @ eventHandler_Internet

flagSetup_None:
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
mapSetup_None:
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
eventHandler_None:
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
mapDialogue_Offline:
    .word 0x80245fc @ mapDialogue_ACDC_Elementary
    .word 0x802a8dc @ mapDialogue_ACDC_Town
    .word 0x8031590 @ mapDialogue_Govt_Complex
    .word 0x80360ac @ mapDialogue_Dentown
    .word 0x803bed0 @ mapDialogue_SciLab
    .word 0x803d9b0 @ mapDialogue_WWW_Base
mapDialogue_Online:
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0x804f92c @ mapDialogue_Govt_Complex_HP
    .word 0
    .word 0
    .word 0


_ts FlagSetup_Main
    push       {r5,lr}
    mov        r7,r10
    ldr        r5,[r7,#0x24]
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
    mov        r7,r10
    ldr        r5,[r7,#0x24]
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
    mov        r7,r10
    ldr        r5,[r7,#0x24]
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
    mov        r5,r10
    ldr        r5,[r5,#0x28]
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
    mov        r7,r10
    ldr        r2,[r7,#0x4]
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
    mov        r7,r10
    ldr        r2,[r7,#0x4]
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
    mov        r7,r10
    ldr        r7,[r7,#0x8]
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
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrb       r7,[r7,#0x4]
    cmp        r7,#0x80
    bge        LAB_08018718
    mov        r7,r10
    ldr        r2,[r7,#0x4]
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
    bl         Sound_PlaySongImmediate
LAB_08018718:
    mov        r0,#0x1
    pop        {r5,pc}


_ts GetCollisionEventAttribute
    push       {r5,lr}
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    tst        r0,r0
    pop        {r5,pc}


_ts MapDialogue_Main
    push       {r5,lr}
    mov        r7,r10
    ldr        r6,[r7,#0x18]
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
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrb       r2,[r7,#0xe]
    tst        r2,r2
    beq        LAB_0801879a
    sub        r2,#0xf0
    blt        LAB_0801879a
    cmp        r2,#0x10
    bge        LAB_0801879a
    mov        r1,#0x40
    add        r0,r1,r2
    bl         Flag_Get380
    bne        LAB_0801879a
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrb       r6,[r7,#0x4]
    ldrb       r7,[r7,#0x5]
    cmp        r6,#0x80
    bge        LAB_0801877e
    ldr        r1,PTR_PTR_080187e8
    b          LAB_08018782
LAB_0801877e:
    ldr        r1,PTR_mapDialogue_Online_080187ec
    sub        r6,#0x80
LAB_08018782:
    lsl        r6,r6,#0x2
    lsl        r7,r7,#0x2
    ldr        r1,[r1,r6]
    ldr        r1,[r1,r7]
    ldrb       r1,[r1,r2]
    cmp        r1,#0xff
    beq        LAB_0801879a
    ldr        r0,PTR_Script_ShowDialogue_080187f0
    bl         Scene_Prepare
    mov        r0,#0x0
    pop        {r5,pc}
LAB_0801879a:
    mov        r0,#0x1
    pop        {r5,pc}


_ts dummy_187a0
    push       {r0,r1,r2,lr}
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r1,[r0,#0x1a]
    ldrb       r2,[r0,#0x1b]
    add        r1,r1,r2
    ldr        r0,PTR_BYTE_080187c0
    ldrb       r2,[r0,#0x0]
    add        r1,r1,r2
    push       {r1}
    bl         FUN_080560f8
    pop        {r1}
    add        r1,r1,r0
    pop        {r0,r1,r2,pc}

    .align 2,0

PTR_BYTE_080187c0:
    .word 0x200c51a
PTR_PTR_080187c4:
    .word flagSetup_Offline
PTR_PTR_080187c8:
    .word flagSetup_Online
PTR_PTR_080187cc:
    .word mapSetup_Offline
PTR_PTR_080187d0:
    .word mapSetup_Online
PTR_PTR_080187d4:
    .word eventHandler_Offline
PTR_PTR_080187d8:
    .word eventHandler_Online
DAT_080187dc:
    .word 0x100
PTR_Scene_JackOut_080187e0:
    .word Scene_JackOut
PTR_Scene_JackIn_080187e4:
    .word Scene_JackIn
PTR_PTR_080187e8:
    .word mapDialogue_Offline
PTR_mapDialogue_Online_080187ec:
    .word mapDialogue_Online
PTR_Script_ShowDialogue_080187f0:
    .word Script_ShowDialogue
