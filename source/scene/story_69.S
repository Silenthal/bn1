#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


Cam_Set_08093604:
    cam_set 52, 76, 0
    cam_end

    .align 2, 0



_ts Scene_Story_69
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_69_0_080938b8
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_69_0_0809361c:
    .word S_Story_69_0
    .word S_Story_69_1
    .word S_Story_69_2
    .word S_Story_69_3
    .word S_Story_69_4
    .word S_Story_69_5
    .word S_Story_69_6
    .word S_Story_69_7
    .word S_Story_69_8
    .word S_Story_69_9
    .word S_Story_69_10


_ts S_Story_69_0
    push       {r5}
    bl         PlayerAnimation_Lock
    mov        r0,#0x10
    bl         PetStatusControl_SetState
    mov        r0,#0x10
    bl         Entity_FreeAllMultiple
    ldr        r7,PTR_NPCList_8030834_080938bc
    bl         Map_LoadNPCList
    ldr        r0,PTR_BgTask_ACDC_Lan_Living_Room_TV_Wily_080938c0
    bl         BgTask_AddNew
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    ldr        r0,PTR_Cam_Set_080938c4
    bl         SceneCamera_Init
    bl         SceneCamera_Main
    mov        r0,#0x3
    bl         Sound_ChangeSong
    pop        {pc}


_ts S_Story_69_1
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_080936ba
    push       {r5}
    mov        r0,#0x46
    lsl        r0,r0,#0x10
    mov        r1,#0x10
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    bl         DisableBoundaryCheck
    mov        r0,#0x3
    bl         PlayerAnimation_SetState
    pop        {r5}
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080936ba:
    pop        {pc}


_ts S_Story_69_2
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080936e4
    push       {r5}
    ldr        r0,PTR_ScenarioData_69_080938c8
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    bl         Scene_IsStartPressed
    beq        LAB_080936e4
    bl         S_Story_69_SkipIfStart
LAB_080936e4:
    pop        {pc}


_nt S_Story_69_3
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08093704
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08093704:
    bl         Scene_IsStartPressed
    beq        LAB_0809370e
    bl         S_Story_69_SkipIfStart
LAB_0809370e:
    pop        {pc}


_ts S_Story_69_4
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0809374a
    push       {r5}
    mov        r0,#0x3c
    lsl        r0,r0,#0x10
    mov        r1,#0x2e
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    bl         DisableBoundaryCheck
    mov        r0,#0x1
    bl         PlayerAnimation_SetState
    pop        {r5}
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0809374a:
    pop        {pc}


_ts S_Story_69_5
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0809376a
    push       {r5}
    ldr        r0,PTR_ScenarioData_69_080938c8
    mov        r1,#0x1
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0809376a:
    pop        {pc}


_ts S_Story_69_6
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08093788
    mov        r0,#0x5a
    strb       r0,[r5,#0x8]
    mov        r0,#0x15
    bl         PlayerAnimation_SetState
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08093788:
    bl         Scene_IsStartPressed
    beq        LAB_08093792
    bl         S_Story_69_SkipIfStart
LAB_08093792:
    pop        {pc}


_ts S_Story_69_7
    push       {r5}
    mov        r0,#0x10
    neg        r0,r0
    lsl        r0,r0,#0xc
    mov        r1,#0x0
    mov        r2,#0x0
    bl         PlayerAnimation_Move
    pop        {r5}
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_080937cc
    Flag_SetBase 0xA4
    push       {r5}
    ldr        r0,PTR_ScenarioData_69_080938c8
    mov        r1,#0x4
    bl         Text_LoadDialogue
    pop        {r5}
    mov        r0,#0x14
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080937cc:
    bl         Scene_IsStartPressed
    beq        LAB_080937d6
    bl         S_Story_69_SkipIfStart
LAB_080937d6:
    pop        {pc}


_ts S_Story_69_8
    ldrb       r0,[r5,#0x8]
    tst        r0,r0
    beq        LAB_080937f4
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    push       {r5}
    mov        r0,#0x10
    neg        r0,r0
    lsl        r0,r0,#0xc
    mov        r1,#0x0
    mov        r2,#0x0
    bl         PlayerAnimation_Move
    pop        {r5}
LAB_080937f4:
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08093812
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08093812:
    bl         Scene_IsStartPressed
    beq        LAB_0809381c
    bl         S_Story_69_SkipIfStart
LAB_0809381c:
    pop        {pc}


_nt S_Story_69_9
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0809387a
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    push       {r5}
    mov        r0,#0x1
    LoadMain world, r1, r1
    ldr        r1,[r1,#0x28]
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    mov        r0,#0x32
    neg        r0,r0
    lsl        r0,r0,#0x10
    mov        r1,#0x2e
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    bl         DisableBoundaryCheck
    mov        r0,#0x4
    bl         PlayerAnimation_SetState
    pop        {r5}
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0809387a:
    pop        {pc}


_ts S_Story_69_10
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0809389e
    push       {r5}
    bl         EnableBoundaryCheck
    bl         PlayerAnimation_Unlock
    Flag_SetBase 0xA3
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
LAB_0809389e:
    pop        {pc}


_ts S_Story_69_SkipIfStart
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x24
    strb       r0,[r5,#0x0]
    pop        {pc}

PTR_PTR_S_Story_69_0_080938b8:
    .word PTR_S_Story_69_0_0809361c

PTR_NPCList_8030834_080938bc:
    .word NPCList_8030834

PTR_BgTask_ACDC_Lan_Living_Room_TV_Wily_080938c0:
    .word BgTask_ACDC_Lan_Living_Room_TV_Wily

PTR_Cam_Set_080938c4:
    .word Cam_Set_08093604

PTR_ScenarioData_69_080938c8:
    .word ScenarioData_69
