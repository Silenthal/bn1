#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Scene_Story_56
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_56_0_0809048c
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_56_0_080901d4:
    .word S_Story_56_0
    .word S_Story_56_1
    .word S_Story_56_2
    .word S_Story_56_3
    .word S_Story_56_4
    .word S_Story_56_5
    .word S_Story_56_6
    .word S_Story_56_7
    .word S_Story_56_8
    .word S_Story_56_9
    .word S_Story_56_10
    .word S_Story_56_11


_ts S_Story_56_0
    push       {r5}
    mov        r0,#0x0
    bl         PetStatusControl_SetState
    pop        {r5}
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    Scene_Next
    mov        r0,#0x0
    strb       r0,[r5,#Scene_state_s1]
    pop        {pc}


_nt S_Story_56_1
    bl         PlayerAnimation_GetState
    cmp        r0,#0x2
    bne        LAB_08090242
    mov        r0,#0x1
    bl         PlayerAnimation_SetState
    push       {r5}
    FadeIn_Black
    pop        {r5}
    Scene_Next
LAB_08090242:
    pop        {pc}


_ts S_Story_56_2
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08090262
    push       {r5}
    ldr        r0,PTR_ScenarioData_56_08090490
    mov        r1,#0x1
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
LAB_08090262:
    pop        {pc}


_ts S_Story_56_3
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08090280
    Flag_SetBase 0xB1
    mov        r0,#0x1e
    strb       r0,[r5,#Scene_sceneTimer]
    Scene_Next
LAB_08090280:
    bl         Scene_IsStartPressed
    beq        LAB_0809028a
    bl         S_Story_56_SkipIfStart
LAB_0809028a:
    pop        {pc}


_ts S_Story_56_4
    ldrb       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    tst        r0,r0
    bne        LAB_080902a2
    mov        r0,#0x3
    bl         PlayerAnimation_SetState
    Scene_Next
LAB_080902a2:
    bl         Scene_IsStartPressed
    beq        LAB_080902ac
    bl         S_Story_56_SkipIfStart
LAB_080902ac:
    pop        {pc}


_nt S_Story_56_5
    push       {r5}
    ldr        r0,PTR_ScenarioData_56_08090490
    mov        r1,#0x2
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
    bl         Scene_IsStartPressed
    beq        LAB_080902ca
    bl         S_Story_56_SkipIfStart
LAB_080902ca:
    pop        {pc}


_ts S_Story_56_6
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_080902de
    Scene_Next
LAB_080902de:
    bl         Scene_IsStartPressed
    beq        LAB_080902e8
    bl         S_Story_56_SkipIfStart
LAB_080902e8:
    pop        {pc}


_nt S_Story_56_7
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08090332
    mov        r0,#0x4
    bl         PlayerAnimation_SetState
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    ldrb       r0,[r5,#Scene_state_s1]
    tst        r0,r0
    beq        LAB_0809032c
    push       {r5}
    mov        r0,#0x10
    bl         Entity_FreeAllMultiple
    ldr        r7,PTR_NPCList_803D5B8_08090494
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    FadeIn_Black
    pop        {r5}
LAB_0809032c:
    Scene_Next
LAB_08090332:
    pop        {pc}


_ts S_Story_56_8
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0809034a
    mov        r0,#0x3c
    strb       r0,[r5,#Scene_sceneTimer]
    Scene_Next
LAB_0809034a:
    pop        {pc}


_ts S_Story_56_9
    ldrb       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    tst        r0,r0
    bne        LAB_08090392
    push       {r5}
    mov        r0,#0x10
    bl         PetStatusControl_SetState
    mov        r0,#0x4
    bl         PETBattery_Init
    mov        r0,#0x0
    bl         PETBattery_SetRechargeParams
    pop        {r5}
    mov        r0,#0x30
    bl         PlayerAnimation_SetState
    push       {r5}
    ldr        r0,PTR_ScenarioData_56_08090490
    mov        r1,#0x4
    @@ Ready, and... Go!
    bl         Text_LoadDialogue
    pop        {r5}
    push       {r5}
    mov        r0,#0x1
    bl         PETBattery_Main
    pop        {r5}
    Scene_Next
    mov        r0,#0x0
    strb       r0,[r5,#Scene_counter]
LAB_08090392:
    pop        {pc}


_ts S_Story_56_10
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_080903ec
    push       {r5}
    mov        r0,#0x0
    bl         PETBattery_Main
    pop        {r5}
    tst        r0,r0
    beq        LAB_080903f8
    LoadMain gameStats, r1, r7
    ldrb       r0,[r1,#0x5]
    tst        r0,r0
    bne        LAB_080903cc
    Flag_SetBase 0xD1
    mov        r0,#0x24
    strb       r0,[r5,#Scene_state_s0]
    mov        r0,#0x0
    strb       r0,[r5,#Scene_state_s1]
    mov        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    pop        {pc}
LAB_080903cc:
    mov        r0,#0x4
    bl         PlayerAnimation_SetState
    Flag_ClearBase 0xD1
    Scene_Next
    push       {r5}
    FadeOut_Black
    pop        {r5}
    b          LAB_080903f6
LAB_080903ec:
    push       {r5}
    mov        r0,#0x1
    bl         PETBattery_Main
    pop        {r5}
LAB_080903f6:
    pop        {pc}
LAB_080903f8:
    push       {r5}
    bl         PETBattery_CheckActive
    pop        {r5}
    bne        LAB_08090416
    ldrb       r0,[r5,#Scene_counter]
    tst        r0,r0
    beq        LAB_0809040e
    sub        r0,#0x1
    strb       r0,[r5,#Scene_counter]
    b          LAB_08090414
LAB_0809040e:
    mov        r0,#0x31
    bl         PlayerAnimation_SetState
LAB_08090414:
    pop        {pc}
LAB_08090416:
    mov        r0,#0x32
    bl         PlayerAnimation_SetState
    mov        r0,#0x4
    strb       r0,[r5,#Scene_counter]
    pop        {pc}


_nt S_Story_56_11
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0809045a
    Flag_SetBase 0xB7
    bl         PlayerAnimation_Unlock
    LoadMain world, r0, r7
    mov        r1,#0x3
    strb       r1,[r0,#0x7]
    ldr        r0,[r7,#0x2c]
    mov        r1,#0x1
    strb       r1,[r0,#0x10]
    strb       r1,[r0,#0x12]
    ldr        r1,PTR_MapEntrance_08090498
    str        r1,[r0,#0x14]
    push       {r5}
    mov        r0,#0x2
    bl         World_ChangeMap
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
LAB_0809045a:
    pop        {pc}

MapEntrance_0809045c:
    MapEntrance Map_Power_Plant_Comp_1, d_sw, f(36, 94, 0)


_ts S_Story_56_SkipIfStart
    push       {r5}
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    push       {r5}
    FadeOut_Black
    pop        {r5}
    mov        r0,#0x1c
    strb       r0,[r5,#Scene_state_s0]
    mov        r0,#0x1
    strb       r0,[r5,#Scene_state_s1]
    pop        {pc}

PTR_PTR_S_Story_56_0_0809048c:
    .word PTR_S_Story_56_0_080901d4

PTR_ScenarioData_56_08090490:
    .word ScenarioData_56

PTR_NPCList_803D5B8_08090494:
    .word NPCList_803D5B8

PTR_MapEntrance_08090498:
    .word MapEntrance_0809045c
