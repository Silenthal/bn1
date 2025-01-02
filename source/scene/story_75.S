#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


Cam_Set_080956e0:
    cam_set -346, 454, 0
    cam_end

Cam_Set_080956ea:
    cam_set -346, 454, 0
    cam_move 0, -128, 0, 200
    cam_end

Cam_Move_080956fe:
    cam_move 0, 128, 0, 200
    cam_end

    .align 2, 0



_ts Scene_Story_75
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_75_0_08095718
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_PTR_S_Story_75_0_08095718:
    .word PTR_S_Story_75_0_0809571c

PTR_S_Story_75_0_0809571c:
    .word S_Story_75_0
    .word S_Story_75_1
    .word S_Story_75_2
    .word S_Story_75_3
    .word S_Story_75_4
    .word S_Story_75_5
    .word S_Story_75_6
    .word S_Story_75_7
    .word S_Story_75_8
    .word S_Story_75_9
    .word S_Story_75_10
    .word S_Story_75_11
    .word S_Story_75_12
    .word S_Story_75_13
    .word S_Story_75_14
    .word S_Story_75_15


_ts S_Story_75_0
    bl         Flag_SetPlayerInactive
    bl         PlayerAnimation_Lock
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_Story_75_1
    bl         PlayerAnimation_GetState
    cmp        r0,#0x2
    bne        LAB_080957c8
    mov        r0,#0x7
    bl         PlayerAnimation_SetState
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080957c8
    push       {r5}
    mov        r0,#0xfe
    lsl        r0,r0,#0x1
    neg        r0,r0
    lsl        r0,r0,#0x10
    mov        r1,#0x52
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    bl         DisableBoundaryCheck
    mov        r0,#0x31
    bl         PlayerAnimation_SetState
    pop        {r5}
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x3c
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080957c8:
    pop        {pc}
    .byte 0x00
    .byte 0x00
    .word PTR_Cam_Set_080957d0

PTR_Cam_Set_080957d0:
    .word Cam_Set_080956e0
    .word Cam_Set_080956ea
    .word Cam_Move_080956fe


_ts S_Story_75_2
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0809580e
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_08095804
    push       {r5}
    ldr        r0,PTR_ScenarioData_75_080958f8
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08095804:
    bl         Scene_IsStartPressed
    beq        LAB_0809580e
    bl         S_Story_75_SkipIfStart
LAB_0809580e:
    pop        {pc}


_ts S_Story_75_3
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0809582e
    push       {r5}
    bl         Effect_GutsMan_Create
    pop        {r5}
    mov        r0,#0x4c
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0809582e:
    bl         Scene_IsStartPressed
    beq        LAB_08095838
    bl         S_Story_75_SkipIfStart
LAB_08095838:
    pop        {pc}


_nt S_Story_75_4
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    cmp        r0,#0x2d
    bne        LAB_0809584a
    mov        r0,#0x45
    bl         PlayerAnimation_SetState
LAB_0809584a:
    tst        r0,r0
    bne        LAB_08095864
    push       {r5}
    mov        r0,#0x2
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x28
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08095864:
    bl         Scene_IsStartPressed
    beq        LAB_0809586e
    bl         S_Story_75_SkipIfStart
LAB_0809586e:
    pop        {pc}


_ts S_Story_75_5
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080958ca
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_080958ca
    push       {r5}
    mov        r0,#0x18
    bl         Entity_FreeAllMultiple
    ldr        r0,PTR_EntityAllocParams_804EAC4_08095b2c
    bl         Entity_AllocList
    ldr        r7,PTR_NPCList_804E3B0_08095b30
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    LoadMain scene, r5, r0
    bl         FUN_0804ebc8
    pop        {r5}
    mov        r0,#0x7
    bl         PlayerAnimation_SetState
    push       {r5}
    mov        r0,#0x1
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    bl         Scene_IsStartPressed
    beq        LAB_080958ca
    bl         S_Story_75_SkipIfStart
LAB_080958ca:
    pop        {pc}


_ts S_Story_75_6
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080958f4
    push       {r5}
    ldr        r0,PTR_ScenarioData_75_080958f8
    mov        r1,#0x5
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    bl         Scene_IsStartPressed
    beq        LAB_080958f4
    bl         S_Story_75_SkipIfStart
LAB_080958f4:
    pop        {pc}

    .align 2, 0


PTR_ScenarioData_75_080958f8:
    .word ScenarioData_75


_ts S_Story_75_7
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08095918
    mov        r0,#0x64
    strb       r0,[r5,#0x8]
    mov        r0,#0xf
    bl         PlayerAnimation_SetState
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08095918:
    bl         Scene_IsStartPressed
    beq        LAB_08095922
    bl         S_Story_75_SkipIfStart
LAB_08095922:
    pop        {pc}


_ts S_Story_75_8
    mov        r0,#0x0
    mov        r1,#0x10
    neg        r1,r1
    lsl        r1,r1,#0xc
    mov        r2,#0x0
    bl         PlayerAnimation_Move
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_0809594c
    mov        r0,#0x31
    bl         PlayerAnimation_SetState
    mov        r0,#0x1e
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0809594c:
    bl         Scene_IsStartPressed
    beq        LAB_08095956
    bl         S_Story_75_SkipIfStart
LAB_08095956:
    pop        {pc}


_ts S_Story_75_9
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_0809596c
    mov        r0,#0xa1
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0809596c:
    bl         Scene_IsStartPressed
    beq        LAB_08095976
    bl         S_Story_75_SkipIfStart
LAB_08095976:
    pop        {pc}


_ts S_Story_75_10
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    cmp        r0,#0x0
    beq        LAB_080959a6
    mov        r1,#0x7
    and        r0,r1
    bne        LAB_080959ca
    LoadMain world, r7, r7
    ldr        r7,[r7,#0x28]
    mov        r0,#0xff
    strb       r0,[r7,#0x15]
    mov        r0,#0x6e
    bl         Sound_PlaySongImmediate
    Flag_SetBase 0xB4
    mov        r0,#0x36
    bl         PlayerAnimation_SetState
    b          LAB_080959ca
LAB_080959a6:
    Flag_SetBase 0xFD
    mov        r0,#0xa9
    bl         Sound_PlaySongImmediate
    mov        r0,#0x31
    bl         PlayerAnimation_SetState
    push       {r5}
    mov        r0,#0x2
    mov        r1,#0x80
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080959ca:
    bl         Scene_IsStartPressed
    beq        LAB_080959d4
    bl         S_Story_75_SkipIfStart
LAB_080959d4:
    pop        {pc}


_nt S_Story_75_11
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080959f8
    push       {r5}
    mov        r0,#0x1
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x1e
    strh       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080959f8:
    pop        {pc}


_nt S_Story_75_12
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08095a32
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_08095a28
    mov        r0,#0x32
    bl         PlayerAnimation_SetState
    push       {r5}
    ldr        r0,PTR_ScenarioData_75_08095b34
    mov        r1,#0x7
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08095a28:
    bl         Scene_IsStartPressed
    beq        LAB_08095a32
    bl         S_Story_75_SkipIfStart
LAB_08095a32:
    pop        {pc}


_ts S_Story_75_13
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08095a52
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08095a52:
    bl         Scene_IsStartPressed
    beq        LAB_08095a5c
    bl         S_Story_75_SkipIfStart
LAB_08095a5c:
    pop        {pc}


_nt S_Story_75_14
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08095aea
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    push       {r5}
    ldr        r0,DAT_08095b38
    neg        r0,r0
    lsl        r0,r0,#0x10
    mov        r1,#0x12
    neg        r1,r1
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    bl         DisableBoundaryCheck
    mov        r0,#0x4
    bl         PlayerAnimation_SetState
    pop        {r5}
    push       {r5}
    mov        r0,#0x18
    bl         Entity_FreeAllMultiple
    pop        {r5}
    LoadMain world, r0, r0
    mov        r1,#0x0
    str        r1,[r0,#0x34]
    push       {r5}
    ldr        r7,PTR_NPCList_804E3B0_08095b3c
    bl         Map_LoadNPCList
    bl         Camera_DisableScreenShake
    pop        {r5}
    push       {r5}
    LoadMain scene, r5, r0
    bl         FUN_0804ebc8
    pop        {r5}
    mov        r0,#0xdf
    add        r2,r0,#0x0
    add        r2,#0x11
LAB_08095aca:
    push       {r0}
    bl         Flag_ClearBase
    pop        {r0}
    add        r0,#0x1
    cmp        r0,r2
    bne        LAB_08095aca
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08095aea:
    pop        {pc}


_ts S_Story_75_15
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08095b12
    push       {r5}
    bl         EnableBoundaryCheck
    bl         PlayerAnimation_Unlock
    bl         Flag_SetPlayerActive
    Flag_SetBase 0xFC
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
LAB_08095b12:
    pop        {pc}


_ts S_Story_75_SkipIfStart
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x38
    strb       r0,[r5,#0x0]
    pop        {pc}

PTR_EntityAllocParams_804EAC4_08095b2c:
    .word EntityAllocParams_804EAC4

PTR_NPCList_804E3B0_08095b30:
    .word NPCList_804E3B0

PTR_ScenarioData_75_08095b34:
    .word ScenarioData_75

DAT_08095b38:
    .word 0x1FC

PTR_NPCList_804E3B0_08095b3c:
    .word NPCList_804E3B0
