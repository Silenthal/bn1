#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


Cam_Set_080967c4:
    cam_set 560, -158, 0
    cam_end

    .align 2, 0



_ts Scene_Story_79
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_79_0_080967dc
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_PTR_S_Story_79_0_080967dc:
    .word PTR_S_Story_79_0_080967e0

PTR_S_Story_79_0_080967e0:
    .word S_Story_79_0
    .word S_Story_79_1
    .word S_Story_79_2
    .word S_Story_79_3
    .word S_Story_79_4
    .word S_Story_79_5
    .word S_Story_79_6
    .word S_Story_79_7
    .word S_Story_79_8
    .word S_Story_79_9
    .word S_Story_79_10
    .word S_Story_79_11


_ts S_Story_79_0
    bl         Sound_StopAllMusic
    bl         Flag_SetPlayerInactive
    bl         PlayerAnimation_Lock
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_Story_79_1
    bl         PlayerAnimation_GetState
    cmp        r0,#0x2
    bne        LAB_08096882
    push       {r5}
    ldr        r0,DAT_08096a84
    lsl        r0,r0,#0x10
    mov        r1,#0x98
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    bl         DisableBoundaryCheck
    mov        r0,#0x3
    bl         PlayerAnimation_SetState
    pop        {r5}
    ldr        r0,PTR_Cam_Set_08096a88
    bl         SceneCamera_Init
    bl         SceneCamera_Main
    mov        r0,#0x93
    bl         Flag_ClearBase
    mov        r0,#0xe3
    bl         Flag_ClearBase
    push       {r5}
    ldr        r7,PTR_NPCList_804E4A4_08096a8c
    bl         Map_LoadNPCList
    bl         Effect_MegaMan_Create
    pop        {r5}
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x1e
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08096882:
    pop        {pc}


_ts S_Story_79_2
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080968b8
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_080968ae
    push       {r5}
    mov        r4,#0x0
    bl         Effect_JackIn_Create
    pop        {r5}
    mov        r0,#0x10
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080968ae:
    bl         Scene_IsStartPressed
    beq        LAB_080968b8
    bl         S_Story_79_SkipIfStart
LAB_080968b8:
    pop        {pc}


_nt S_Story_79_3
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_080968de
    mov        r0,#0x93
    bl         Flag_SetBase
    push       {r5}
    mov        r4,#0x1
    bl         Effect_JackIn_Create
    pop        {r5}
    mov        r0,#0x14
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080968de:
    bl         Scene_IsStartPressed
    beq        LAB_080968e8
    bl         S_Story_79_SkipIfStart
LAB_080968e8:
    pop        {pc}


_nt S_Story_79_4
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_08096906
    push       {r5}
    mov        r0,#0x2
    mov        r1,#0x80
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08096906:
    bl         Scene_IsStartPressed
    beq        LAB_08096910
    bl         S_Story_79_SkipIfStart
LAB_08096910:
    pop        {pc}


_nt S_Story_79_5
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08096930
    push       {r5}
    mov        r0,#0x1
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08096930:
    pop        {pc}


_nt S_Story_79_6
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08096950
    push       {r5}
    ldr        r0,PTR_ScenarioData_79_08096a90
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08096950:
    pop        {pc}


_nt S_Story_79_7
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0809696e
    mov        r0,#0x93
    bl         Flag_SetBase
    mov        r0,#0x96
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0809696e:
    bl         Scene_IsStartPressed
    beq        LAB_08096978
    bl         S_Story_79_SkipIfStart
LAB_08096978:
    pop        {pc}


_nt S_Story_79_8
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_08096996
    push       {r5}
    ldr        r0,PTR_ScenarioData_79_08096a90
    mov        r1,#0x3
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08096996:
    bl         Scene_IsStartPressed
    beq        LAB_080969a0
    bl         S_Story_79_SkipIfStart
LAB_080969a0:
    pop        {pc}


_nt S_Story_79_9
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_080969c0
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080969c0:
    bl         Scene_IsStartPressed
    beq        LAB_080969ca
    bl         S_Story_79_SkipIfStart
LAB_080969ca:
    pop        {pc}


_ts S_Story_79_10
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08096a36
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    push       {r5}
    mov        r0,#0x18
    bl         Entity_FreeAllMultiple
    ldr        r7,PTR_NPCList_804E4BC_08096a94
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    ldr        r0,DAT_08096a98
    lsl        r0,r0,#0x10
    ldr        r1,DAT_08096a9c
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    bl         DisableBoundaryCheck
    mov        r0,#0x4
    bl         PlayerAnimation_SetState
    pop        {r5}
    push       {r5}
    mov        r0,#0x1
    mov        r1,r10
    ldr        r1,[r1,#0x8]
    ldr        r1,[r1,#0x28]
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08096a36:
    pop        {pc}


_ts S_Story_79_11
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08096a6a
    push       {r5}
    bl         EnableBoundaryCheck
    bl         PlayerAnimation_Unlock
    bl         Flag_SetPlayerActive
    mov        r0,#0xe6
    bl         Flag_SetBase
    mov        r0,#0x26
    bl         Flag_Set420
    pop        {r5}
    mov        r0,#0xd
    bl         Sound_ChangeSong
    bl         Scene_UnloadAndResetStepCounter
LAB_08096a6a:
    pop        {pc}


_ts S_Story_79_SkipIfStart
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x8
    bl         Fade_Request
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x28
    strb       r0,[r5,#0x0]
    pop        {pc}

DAT_08096a84:
    .word 0x132

PTR_Cam_Set_08096a88:
    .word Cam_Set_080967c4

PTR_NPCList_804E4A4_08096a8c:
    .word NPCList_804E4A4

PTR_ScenarioData_79_08096a90:
    .word ScenarioData_79

PTR_NPCList_804E4BC_08096a94:
    .word NPCList_804E4BC

DAT_08096a98:
    .word 0x230

DAT_08096a9c:
    .word 0xFFFFFF62
