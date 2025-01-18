#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Scene_Story_78
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_78_0_08096578
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_PTR_S_Story_78_0_08096578:
    .word PTR_S_Story_78_0_0809657c

PTR_S_Story_78_0_0809657c:
    .word S_Story_78_0
    .word S_Story_78_1
    .word S_Story_78_2
    .word S_Story_78_3
    .word S_Story_78_4
    .word S_Story_78_5
    .word S_Story_78_6
    .word S_Story_78_7
    .word S_Story_78_8


_ts S_Story_78_0
    push       {r5}
    mov        r0,#0x0
    bl         PetStatusControl_SetState
    pop        {r5}
    bl         Flag_SetPlayerInactive
    bl         PlayerAnimation_Lock
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_nt S_Story_78_1
    bl         PlayerAnimation_GetState
    cmp        r0,#0x2
    bne        LAB_08096606
    push       {r5}
    mov        r0,#0x70
    lsl        r0,r0,#0x10
    mov        r1,#0x5c
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    bl         DisableBoundaryCheck
    mov        r0,#0x2d
    bl         PlayerAnimation_SetState
    pop        {r5}
    Flag_ClearBase 0x96
    push       {r5}
    mov        r0,#0x10
    bl         Entity_FreeAllMultiple
    ldr        r7,PTR_NPCList_803E71C_080967b8
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08096606:
    pop        {pc}


_ts S_Story_78_2
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08096630
    push       {r5}
    ldr        r0,PTR_ScenarioData_78_080967bc
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    bl         Scene_IsStartPressed
    beq        LAB_08096630
    bl         S_Story_78_SkipIfStart
LAB_08096630:
    pop        {pc}


_nt S_Story_78_3
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08096684
    Flag_SetBase 0x96
    mov        r0,#0x3c
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    bl         Scene_IsStartPressed
    beq        LAB_08096658
    bl         S_Story_78_SkipIfStart
LAB_08096658:
    pop        {pc}


_nt S_Story_78_4
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_08096684
    mov        r0,#0x7
    bl         PlayerAnimation_SetState
    push       {r5}
    ldr        r0,PTR_ScenarioData_78_080967bc
    mov        r1,#0x3
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    mov        r0,#0x0
    strb       r0,[r5,#0x1]
    mov        r0,#0x78
    strb       r0,[r5,#0x8]
LAB_08096684:
    bl         Scene_IsStartPressed
    beq        LAB_0809668e
    bl         S_Story_78_SkipIfStart
LAB_0809668e:
    pop        {pc}


_ts S_Story_78_5
    ldrb       r0,[r5,#0x1]
    tst        r0,r0
    beq        LAB_080966b0
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_080966cc
    mov        r0,#0x0
    strb       r0,[r5,#0x1]
    push       {r5}
    mov        r0,#0x4
    bl         PetStatusControl_SetState
    pop        {r5}
    b          LAB_080966cc
LAB_080966b0:
    Flag_GetBase 0xEE
    beq        LAB_080966cc
    Flag_ClearBase 0xEE
    push       {r5}
    mov        r0,#0x18
    bl         PetStatusControl_SetState
    pop        {r5}
    mov        r0,#0x1
    strb       r0,[r5,#0x1]
LAB_080966cc:
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_080966f8
    mov        r0,#0x2d
    bl         PlayerAnimation_SetState
    mov        r0,#0x1f
    mov        r1,#0xa
    bl         Sound_FadeOut
    push       {r5}
    ldr        r0,PTR_ScenarioData_78_080967bc
    mov        r1,#0x16
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080966f8:
    bl         Scene_IsStartPressed
    beq        LAB_08096702
    bl         S_Story_78_SkipIfStart
LAB_08096702:
    pop        {pc}


_ts S_Story_78_6
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08096722
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08096722:
    bl         Scene_IsStartPressed
    beq        LAB_0809672c
    bl         S_Story_78_SkipIfStart
LAB_0809672c:
    pop        {pc}


_nt S_Story_78_7
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0809674e
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0809674e:
    pop        {pc}


_ts S_Story_78_8
    push       {r5}
    bl         EnableBoundaryCheck
    bl         PlayerAnimation_Unlock
    bl         Flag_SetPlayerActive
    Flag_SetBase 0xE5
    LoadMain mapChange, r0, r7
    mov        r1,#0x1
    strb       r1,[r0,#0x10]
    mov        r1,#0x1
    strb       r1,[r0,#0x12]
    ldr        r1,PTR_MapEntrance_080967c0
    str        r1,[r0,#0x14]
    mov        r0,#0x0
    bl         World_ChangeMap
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}

    .align 2, 0


MapEntrance_08096784:
    MapEntrance Map_WWW_Comp_5, d_ne, f(560, -158, 0)


_ts S_Story_78_SkipIfStart
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x8
    bl         Fade_Request
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    push       {r5}
    mov        r0,#0x4
    bl         PetStatusControl_SetState
    pop        {r5}
    mov        r0,#0x1c
    strb       r0,[r5,#0x0]
    pop        {pc}

    .align 2, 0


PTR_NPCList_803E71C_080967b8:
    .word NPCList_803E71C

PTR_ScenarioData_78_080967bc:
    .word ScenarioData_78

PTR_MapEntrance_080967c0:
    .word MapEntrance_08096784
