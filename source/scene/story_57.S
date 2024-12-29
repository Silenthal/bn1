#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Scene_Story_57
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_57_0_0809072c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_57_0_080904a8:
    .word S_Story_57_0
    .word S_Story_57_1
    .word S_Story_57_2
    .word S_Story_57_3
    .word S_Story_57_4
    .word S_Story_57_5
    .word S_Story_57_6
    .word S_Story_57_7
    .word S_Story_57_8
    .word S_Story_57_9
    .word S_Story_57_10


_ts S_Story_57_0
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


_nt S_Story_57_1
    bl         PlayerAnimation_GetState
    cmp        r0,#0x2
    bne        LAB_08090522
    mov        r0,#0x1
    bl         PlayerAnimation_SetState
    push       {r5}
    mov        r0,#0x10
    bl         Entity_FreeAllMultiple
    ldr        r7,PTR_NPCList_803D5D8_08090730
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
LAB_08090522:
    pop        {pc}


_ts S_Story_57_2
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08090542
    push       {r5}
    ldr        r0,PTR_ScenarioData_57_08090734
    mov        r1,#0x1
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08090542:
    pop        {pc}


_ts S_Story_57_3
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08090556
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08090556:
    bl         Scene_IsStartPressed
    beq        LAB_08090560
    bl         S_Story_57_SkipIfStart
LAB_08090560:
    pop        {pc}


_nt S_Story_57_4
    push       {r5}
    ldr        r0,PTR_ScenarioData_57_08090734
    mov        r1,#0x2
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    bl         Scene_IsStartPressed
    beq        LAB_0809057e
    bl         S_Story_57_SkipIfStart
LAB_0809057e:
    pop        {pc}


_ts S_Story_57_5
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08090592
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08090592:
    bl         Scene_IsStartPressed
    beq        LAB_0809059c
    bl         S_Story_57_SkipIfStart
LAB_0809059c:
    pop        {pc}


_nt S_Story_57_6
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080905d6
    mov        r0,#0x4
    bl         PlayerAnimation_SetState
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x1]
    tst        r0,r0
    beq        LAB_080905d0
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
LAB_080905d0:
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080905d6:
    pop        {pc}


_ts S_Story_57_7
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080905ee
    mov        r0,#0x3c
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080905ee:
    pop        {pc}


_ts S_Story_57_8
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_08090632
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
    ldr        r0,PTR_ScenarioData_57_08090734
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
LAB_08090632:
    pop        {pc}


_ts S_Story_57_9
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0809068c
    push       {r5}
    mov        r0,#0x0
    bl         PETBattery_Main
    pop        {r5}
    tst        r0,r0
    beq        LAB_08090698
    LoadMain gameStats, r1, r7
    ldrb       r0,[r1,#0x5]
    tst        r0,r0
    bne        LAB_0809066c
    mov        r0,#0xd1
    bl         Flag_SetBase
    mov        r0,#0x20
    strb       r0,[r5,#0x0]
    mov        r0,#0x0
    strb       r0,[r5,#0x1]
    mov        r0,#0x1
    strb       r0,[r5,#0x8]
    pop        {pc}
LAB_0809066c:
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
    b          LAB_08090696
LAB_0809068c:
    push       {r5}
    mov        r0,#0x1
    bl         PETBattery_Main
    pop        {r5}
LAB_08090696:
    pop        {pc}
LAB_08090698:
    push       {r5}
    bl         PETBattery_CheckActive
    pop        {r5}
    bne        LAB_080906b6
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    beq        LAB_080906ae
    sub        r0,#0x1
    strb       r0,[r5,#0xa]
    b          LAB_080906b4
LAB_080906ae:
    mov        r0,#0x31
    bl         PlayerAnimation_SetState
LAB_080906b4:
    pop        {pc}
LAB_080906b6:
    mov        r0,#0x32
    bl         PlayerAnimation_SetState
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    pop        {pc}


_nt S_Story_57_10
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080906fa
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
    ldr        r1,PTR_MapEntrance_08090738
    str        r1,[r0,#0x14]
    push       {r5}
    mov        r0,#0x2
    bl         World_ChangeMap
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
LAB_080906fa:
    pop        {pc}

MapEntrance_080906fc:
    MapEntrance Map_Power_Plant_Comp_1, d_sw, f(36, 94, 0)


_ts S_Story_57_SkipIfStart
    push       {r5}
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x18
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    strb       r0,[r5,#0x1]
    pop        {pc}

PTR_PTR_S_Story_57_0_0809072c:
    .word PTR_S_Story_57_0_080904a8

PTR_NPCList_803D5D8_08090730:
    .word NPCList_803D5D8

PTR_ScenarioData_57_08090734:
    .word ScenarioData_57

PTR_MapEntrance_08090738:
    .word MapEntrance_080906fc
