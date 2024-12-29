#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Scene_Story_63
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_63_0_08092438
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_63_0_08092178:
    .word S_Story_63_0
    .word S_Story_63_1
    .word S_Story_63_2
    .word S_Story_63_3
    .word S_Story_63_4
    .word S_Story_63_5
    .word S_Story_63_6
    .word S_Story_63_7
    .word S_Story_63_8
    .word S_Story_63_9
    .word S_Story_63_10
    .word S_Story_63_11


_ts S_Story_63_0
    push       {r5}
    mov        r0,#0x0
    bl         PetStatusControl_SetState
    pop        {r5}
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    mov        r0,#0x0
    strb       r0,[r5,#0x1]
    pop        {pc}


_nt S_Story_63_1
    bl         PlayerAnimation_GetState
    cmp        r0,#0x2
    bne        LAB_080921f2
    mov        r0,#0x4
    bl         PlayerAnimation_SetState
    mov        r0,#0xe0
    bl         Flag_ClearBase
    push       {r5}
    ldr        r7,PTR_NPCList_803D640_0809243c
    bl         Map_LoadNPCList
    mov        r0,#0x3
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080921f2:
    pop        {pc}


_ts S_Story_63_2
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08092212
    push       {r5}
    ldr        r0,PTR_ScenarioData_63_08092440
    mov        r1,#0x1
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08092212:
    pop        {pc}


_ts S_Story_63_3
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08092230
    mov        r0,#0xe0
    bl         Flag_SetBase
    mov        r0,#0x3c
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08092230:
    bl         Scene_IsStartPressed
    beq        LAB_0809223a
    bl         S_Story_63_SkipIfStart
LAB_0809223a:
    pop        {pc}


_ts S_Story_63_4
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_08092252
    mov        r0,#0x3
    bl         PlayerAnimation_SetState
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08092252:
    bl         Scene_IsStartPressed
    beq        LAB_0809225c
    bl         S_Story_63_SkipIfStart
LAB_0809225c:
    pop        {pc}


_nt S_Story_63_5
    push       {r5}
    ldr        r0,PTR_ScenarioData_63_08092440
    mov        r1,#0x2
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    bl         Scene_IsStartPressed
    beq        LAB_0809227a
    bl         S_Story_63_SkipIfStart
LAB_0809227a:
    pop        {pc}


_ts S_Story_63_6
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0809228e
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0809228e:
    bl         Scene_IsStartPressed
    beq        LAB_08092298
    bl         S_Story_63_SkipIfStart
LAB_08092298:
    pop        {pc}


_nt S_Story_63_7
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080922e2
    mov        r0,#0x4
    bl         PlayerAnimation_SetState
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x1]
    tst        r0,r0
    beq        LAB_080922dc
    push       {r5}
    mov        r0,#0x10
    bl         Entity_FreeAllMultiple
    ldr        r7,PTR_NPCList_803D648_08092444
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
LAB_080922dc:
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080922e2:
    pop        {pc}


_ts S_Story_63_8
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080922fa
    mov        r0,#0x3c
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080922fa:
    pop        {pc}


_ts S_Story_63_9
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_0809233e
    push       {r5}
    mov        r0,#0x10
    bl         PetStatusControl_SetState
    mov        r0,#0x4
    bl         PETBattery_Init
    mov        r0,#0x1
    bl         PETBattery_SetRechargeParams
    pop        {r5}
    mov        r0,#0x30
    bl         PlayerAnimation_SetState
    push       {r5}
    ldr        r0,PTR_ScenarioData_63_08092440
    mov        r1,#0x7
    bl         Text_LoadDialogue
    pop        {r5}
    push       {r5}
    mov        r0,#0x1
    bl         PETBattery_Main
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0809233e:
    pop        {pc}


_ts S_Story_63_10
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08092398
    push       {r5}
    mov        r0,#0x0
    bl         PETBattery_Main
    pop        {r5}
    tst        r0,r0
    beq        LAB_080923a4
    LoadMain gameStats, r1, r7
    ldrb       r0,[r1,#0x5]
    tst        r0,r0
    bne        LAB_08092378
    mov        r0,#0xd1
    bl         Flag_SetBase
    mov        r0,#0x24
    strb       r0,[r5,#0x0]
    mov        r0,#0x0
    strb       r0,[r5,#0x1]
    mov        r0,#0x1
    strb       r0,[r5,#0x8]
    pop        {pc}
LAB_08092378:
    mov        r0,#0x4
    bl         PlayerAnimation_SetState
    mov        r0,#0xd1
    bl         Flag_ClearBase
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    b          LAB_080923a2
LAB_08092398:
    push       {r5}
    mov        r0,#0x1
    bl         PETBattery_Main
    pop        {r5}
LAB_080923a2:
    pop        {pc}
LAB_080923a4:
    push       {r5}
    bl         PETBattery_CheckActive
    pop        {r5}
    bne        LAB_080923c2
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    beq        LAB_080923ba
    sub        r0,#0x1
    strb       r0,[r5,#0xa]
    b          LAB_080923c0
LAB_080923ba:
    mov        r0,#0x31
    bl         PlayerAnimation_SetState
LAB_080923c0:
    pop        {pc}
LAB_080923c2:
    mov        r0,#0x32
    bl         PlayerAnimation_SetState
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    pop        {pc}


_nt S_Story_63_11
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08092406
    mov        r0,#0xb8
    bl         Flag_SetBase
    bl         PlayerAnimation_Unlock
    LoadMain world, r0, r7
    mov        r1,#0x3
    strb       r1,[r0,#0x7]
    ldr        r0,[r7,#0x2c]
    mov        r1,#0x1
    strb       r1,[r0,#0x10]
    strb       r1,[r0,#0x12]
    ldr        r1,PTR_MapEntrance_08092448
    str        r1,[r0,#0x14]
    push       {r5}
    mov        r0,#0x2
    bl         World_ChangeMap
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
LAB_08092406:
    pop        {pc}

MapEntrance_08092408:
    MapEntrance Map_Power_Plant_Comp_1, d_sw, f(36, 94, 0)


_ts S_Story_63_SkipIfStart
    push       {r5}
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x1c
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    strb       r0,[r5,#0x1]
    pop        {pc}

PTR_PTR_S_Story_63_0_08092438:
    .word PTR_S_Story_63_0_08092178

PTR_NPCList_803D640_0809243c:
    .word NPCList_803D640

PTR_ScenarioData_63_08092440:
    .word ScenarioData_63

PTR_NPCList_803D648_08092444:
    .word NPCList_803D648

PTR_MapEntrance_08092448:
    .word MapEntrance_08092408
