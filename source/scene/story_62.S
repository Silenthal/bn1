#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Scene_Story_62
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_62_0_08092158
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_62_0_08091e98:
    .word S_Story_62_0
    .word S_Story_62_1
    .word S_Story_62_2
    .word S_Story_62_3
    .word S_Story_62_4
    .word S_Story_62_5
    .word S_Story_62_6
    .word S_Story_62_7
    .word S_Story_62_8
    .word S_Story_62_9
    .word S_Story_62_10
    .word S_Story_62_11


_ts S_Story_62_0
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


_nt S_Story_62_1
    bl         PlayerAnimation_GetState
    cmp        r0,#0x2
    bne        LAB_08091f0c
    mov        r0,#0x4
    bl         PlayerAnimation_SetState
    push       {r5}
    ldr        r7,PTR_NPCList_803D640_0809215c
    bl         Map_LoadNPCList
    FadeIn_Black
    pop        {r5}
    Scene_Next
LAB_08091f0c:
    pop        {pc}


_nt S_Story_62_2
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08091f2c
    push       {r5}
    ldr        r0,PTR_ScenarioData_62_08092160
    mov        r1,#0x1
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
LAB_08091f2c:
    pop        {pc}


_nt S_Story_62_3
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08091f4a
    Flag_SetBase 0xE0
    mov        r0,#0x3c
    strb       r0,[r5,#Scene_sceneTimer]
    Scene_Next
LAB_08091f4a:
    bl         Scene_IsStartPressed
    beq        LAB_08091f54
    bl         S_Story_62_SkipIfStart
LAB_08091f54:
    pop        {pc}


_nt S_Story_62_4
    ldrb       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    tst        r0,r0
    bne        LAB_08091f6c
    mov        r0,#0x3
    bl         PlayerAnimation_SetState
    Scene_Next
LAB_08091f6c:
    bl         Scene_IsStartPressed
    beq        LAB_08091f76
    bl         S_Story_62_SkipIfStart
LAB_08091f76:
    pop        {pc}


_ts S_Story_62_5
    push       {r5}
    ldr        r0,PTR_ScenarioData_62_08092160
    mov        r1,#0x2
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
    bl         Scene_IsStartPressed
    beq        LAB_08091f94
    bl         S_Story_62_SkipIfStart
LAB_08091f94:
    pop        {pc}


_nt S_Story_62_6
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08091fa8
    Scene_Next
LAB_08091fa8:
    bl         Scene_IsStartPressed
    beq        LAB_08091fb2
    bl         S_Story_62_SkipIfStart
LAB_08091fb2:
    pop        {pc}


_ts S_Story_62_7
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08091ffc
    mov        r0,#0x4
    bl         PlayerAnimation_SetState
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    ldrb       r0,[r5,#Scene_state_s1]
    tst        r0,r0
    beq        LAB_08091ff6
    push       {r5}
    mov        r0,#0x10
    bl         Entity_FreeAllMultiple
    ldr        r7,PTR_NPCList_803D648_08092164
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    FadeIn_Black
    pop        {r5}
LAB_08091ff6:
    Scene_Next
LAB_08091ffc:
    pop        {pc}


_nt S_Story_62_8
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08092014
    mov        r0,#0x3c
    strb       r0,[r5,#Scene_sceneTimer]
    Scene_Next
LAB_08092014:
    pop        {pc}


_nt S_Story_62_9
    ldrb       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    tst        r0,r0
    bne        LAB_0809205c
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
    ldr        r0,PTR_ScenarioData_62_08092160
    mov        r1,#0x4
    bl         Text_LoadDialogue
    pop        {r5}
    push       {r5}
    mov        r0,#0x1
    bl         PETBattery_Main
    pop        {r5}
    Scene_Next
    mov        r0,#0x0
    strb       r0,[r5,#Scene_counter]
LAB_0809205c:
    pop        {pc}


_nt S_Story_62_10
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_080920b6
    push       {r5}
    mov        r0,#0x0
    bl         PETBattery_Main
    pop        {r5}
    tst        r0,r0
    beq        LAB_080920c2
    LoadMain gameStats, r1, r7
    ldrb       r0,[r1,#0x5]
    tst        r0,r0
    bne        LAB_08092096
    Flag_SetBase 0xD1
    mov        r0,#0x24
    strb       r0,[r5,#Scene_state_s0]
    mov        r0,#0x0
    strb       r0,[r5,#Scene_state_s1]
    mov        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    pop        {pc}
LAB_08092096:
    mov        r0,#0x4
    bl         PlayerAnimation_SetState
    Flag_ClearBase 0xD1
    Scene_Next
    push       {r5}
    FadeOut_Black
    pop        {r5}
    b          LAB_080920c0
LAB_080920b6:
    push       {r5}
    mov        r0,#0x1
    bl         PETBattery_Main
    pop        {r5}
LAB_080920c0:
    pop        {pc}
LAB_080920c2:
    push       {r5}
    bl         PETBattery_CheckActive
    pop        {r5}
    bne        LAB_080920e0
    ldrb       r0,[r5,#Scene_counter]
    tst        r0,r0
    beq        LAB_080920d8
    sub        r0,#0x1
    strb       r0,[r5,#Scene_counter]
    b          LAB_080920de
LAB_080920d8:
    mov        r0,#0x31
    bl         PlayerAnimation_SetState
LAB_080920de:
    pop        {pc}
LAB_080920e0:
    mov        r0,#0x32
    bl         PlayerAnimation_SetState
    mov        r0,#0x4
    strb       r0,[r5,#Scene_counter]
    pop        {pc}


_ts S_Story_62_11
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08092124
    Flag_SetBase 0xB7
    bl         PlayerAnimation_Unlock
    LoadMain world, r0, r7
    mov        r1,#0x3
    strb       r1,[r0,#0x7]
    ldr        r0,[r7,#0x2c]
    mov        r1,#0x1
    strb       r1,[r0,#0x10]
    strb       r1,[r0,#0x12]
    ldr        r1,PTR_MapEntrance_08092168
    str        r1,[r0,#0x14]
    push       {r5}
    mov        r0,#0x2
    bl         World_ChangeMap
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
LAB_08092124:
    pop        {pc}

    .align 2, 0


MapEntrance_08092128:
    MapEntrance Map_Power_Plant_Comp_1, d_sw, f(36, 94, 0)


_ts S_Story_62_SkipIfStart
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

PTR_PTR_S_Story_62_0_08092158:
    .word PTR_S_Story_62_0_08091e98

PTR_NPCList_803D640_0809215c:
    .word NPCList_803D640

PTR_ScenarioData_62_08092160:
    .word ScenarioData_62

PTR_NPCList_803D648_08092164:
    .word NPCList_803D648

PTR_MapEntrance_08092168:
    .word MapEntrance_08092128
