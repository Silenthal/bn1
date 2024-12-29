#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


Cam_Set_08094f6c:
    cam_set 186, -130, 0
    cam_move -128, 128, 0, 488
    cam_end

Cam_Move_08094f80:
    cam_move -128, -128, 0, 60
    cam_end


_ts Scene_Story_73
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_73_0_08095230
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_73_0_08094f98:
    .word S_Story_73_0
    .word S_Story_73_1
    .word S_Story_73_2
    .word S_Story_73_3
    .word S_Story_73_4
    .word S_Story_73_5
    .word S_Story_73_6
    .word S_Story_73_7
    .word S_Story_73_8
    .word S_Story_73_9
    .word S_Story_73_10
    .word S_Story_73_11
    .word S_Story_73_12


_ts S_Story_73_0
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    push       {r5}
    mov        r0,#0x10
    bl         PetStatusControl_SetState
    mov        r0,#0x93
    bl         Flag_ClearBase
    ldr        r7,PTR_NPCList_803E8CC_08095234
    bl         Map_LoadNPCList
    mov        r1,#0x5
    bl         Effect_LifeVirusSeed_Create
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    ldr        r0,PTR_Cam_Set_08095238
    bl         SceneCamera_Init
    bl         SceneCamera_Main
    pop        {pc}


_nt S_Story_73_1
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_0809503c
    push       {r5}
    mov        r0,#0xdc
    neg        r0,r0
    lsl        r0,r0,#0x10
    mov        r1,#0x14
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    bl         DisableBoundaryCheck
    pop        {r5}
    push       {r5}
    mov        r0,#0x1
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x3c
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0809503c:
    pop        {pc}


_nt S_Story_73_2
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0809506c
    bl         SceneCamera_Main
    cmp        r0,#0x1
    beq        LAB_08095062
    ldr        r0,PTR_Cam_Move_0809523c
    bl         SceneCamera_Init
    bl         SceneCamera_Main
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08095062:
    bl         Scene_IsStartPressed
    beq        LAB_0809506c
    bl         S_Story_73_SkipIfStart
LAB_0809506c:
    pop        {pc}


_nt S_Story_73_3
    bl         SceneCamera_Main
    cmp        r0,#0x1
    beq        LAB_0809508e
    mov        r0,#0x93
    bl         Flag_SetBase
    push       {r5}
    ldr        r0,PTR_ScenarioData_73_08095240
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0809508e:
    bl         Scene_IsStartPressed
    beq        LAB_08095098
    bl         S_Story_73_SkipIfStart
LAB_08095098:
    pop        {pc}


_nt S_Story_73_4
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_080950b6
    mov        r0,#0x93
    bl         Flag_ClearBase
    mov        r0,#0xa
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080950b6:
    bl         Scene_IsStartPressed
    beq        LAB_080950c0
    bl         S_Story_73_SkipIfStart
LAB_080950c0:
    pop        {pc}


_nt S_Story_73_5
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_080950de
    push       {r5}
    ldr        r0,PTR_ScenarioData_73_08095240
    mov        r1,#0x2
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080950de:
    bl         Scene_IsStartPressed
    beq        LAB_080950e8
    bl         S_Story_73_SkipIfStart
LAB_080950e8:
    pop        {pc}


_nt S_Story_73_6
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08095106
    mov        r0,#0xf9
    bl         Flag_SetBase
    mov        r0,#0x78
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08095106:
    bl         Scene_IsStartPressed
    beq        LAB_08095110
    bl         S_Story_73_SkipIfStart
LAB_08095110:
    pop        {pc}


_nt S_Story_73_7
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_0809512e
    push       {r5}
    ldr        r0,PTR_ScenarioData_73_08095240
    mov        r1,#0x4
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0809512e:
    bl         Scene_IsStartPressed
    beq        LAB_08095138
    bl         S_Story_73_SkipIfStart
LAB_08095138:
    pop        {pc}


_nt S_Story_73_8
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08095156
    mov        r0,#0x93
    bl         Flag_SetBase
    mov        r0,#0x1e
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08095156:
    bl         Scene_IsStartPressed
    beq        LAB_08095160
    bl         S_Story_73_SkipIfStart
LAB_08095160:
    pop        {pc}


_nt S_Story_73_9
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_0809517e
    push       {r5}
    ldr        r0,PTR_ScenarioData_73_08095240
    mov        r1,#0x5
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0809517e:
    bl         Scene_IsStartPressed
    beq        LAB_08095188
    bl         S_Story_73_SkipIfStart
LAB_08095188:
    pop        {pc}


_nt S_Story_73_10
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_080951a8
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080951a8:
    bl         Scene_IsStartPressed
    beq        LAB_080951b2
    bl         S_Story_73_SkipIfStart
LAB_080951b2:
    pop        {pc}


_ts S_Story_73_11
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080951d4
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080951d4:
    pop        {pc}


_nt S_Story_73_12
    bl         EnableBoundaryCheck
    bl         PlayerAnimation_Unlock
    push       {r5}
    mov        r0,#0xf8
    bl         Flag_SetBase
    pop        {r5}
    push       {r5}
    LoadMain mapChange, r0, r7
    mov        r1,#0x1
    strb       r1,[r0,#0x10]
    mov        r1,#0x1
    strb       r1,[r0,#0x12]
    ldr        r1,PTR_MapEntrance_08095244
    str        r1,[r0,#0x14]
    mov        r0,#0x0
    bl         World_ChangeMap
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}

MapEntrance_08095208:
    MapEntrance Map_WWW_Base, d_ne, f(-46, 154, 0)


_ts S_Story_73_SkipIfStart
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x2c
    strb       r0,[r5,#0x0]
    pop        {pc}

PTR_PTR_S_Story_73_0_08095230:
    .word PTR_S_Story_73_0_08094f98

PTR_NPCList_803E8CC_08095234:
    .word NPCList_803E8CC

PTR_Cam_Set_08095238:
    .word Cam_Set_08094f6c

PTR_Cam_Move_0809523c:
    .word Cam_Move_08094f80

PTR_ScenarioData_73_08095240:
    .word ScenarioData_73

PTR_MapEntrance_08095244:
    .word MapEntrance_08095208
