#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


Cam_Set_08093988:
    cam_set -6, -46, 0
    cam_end

Cam_Set_08093992:
    cam_set -6, -46, 0
    cam_move -256, 256, 0, 210
    cam_end

Cam_Move_080939a6:
    cam_move 256, -256, 0, 210
    cam_end

    .align 2, 0



_ts Scene_Story_6B
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_6B_0_08093c48
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_6B_0_080939c0:
    .word S_Story_6B_0
    .word S_Story_6B_1
    .word S_Story_6B_2
    .word S_Story_6B_3
    .word S_Story_6B_4
    .word S_Story_6B_5
    .word S_Story_6B_6
    .word S_Story_6B_7
    .word S_Story_6B_8
    .word S_Story_6B_9
    .word S_Story_6B_10
    .word S_Story_6B_11


_ts S_Story_6B_0
    mov        r0,#T_Suspicious_Mood
    bl         Sound_ChangeSong
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x8
    bl         Fade_Request
    bl         Flag_SetPlayerInactive
    bl         PlayerAnimation_Lock
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_nt S_Story_6B_1
    bl         PlayerAnimation_GetState
    cmp        r0,#0x2
    bne        LAB_08093a86
    LoadMain world, r0, r7
    push       {r5}
    ldr        r0,[r0,#0x28]
    ldrb       r0,[r0,#0x14]
    mov        r1,#0x7
    and        r0,r1
    bl         PlayerAnimation_SetState
    pop        {r5}
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08093a86
    push       {r5}
    mov        r0,#0x2
    neg        r0,r0
    lsl        r0,r0,#0x10
    mov        r1,#0x2a
    neg        r1,r1
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    mov        r0,#0x4
    bl         PlayerAnimation_SetState
    pop        {r5}
    push       {r5}
    mov        r0,#0x10
    bl         Entity_FreeAllMultiple
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_DAT_08093c4c
    bl         Map_LoadNPCList
    pop        {r5}
    ldr        r0,PTR_Cam_Set_08093c50
    bl         SceneCamera_Init
    bl         SceneCamera_Main
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08093a86:
    pop        {pc}


_ts S_Story_6B_2
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08093aa6
    push       {r5}
    ldr        r0,PTR_ScenarioData_6B_08093c54
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08093aa6:
    pop        {pc}


_ts S_Story_6B_3
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08093aca
    mov        r0,#0xd9
    bl         Sound_PlaySongImmediate
    ldr        r0,PTR_Cam_Set_08093c58
    bl         SceneCamera_Init
    bl         SceneCamera_Main
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08093aca:
    bl         Scene_IsStartPressed
    beq        LAB_08093ad4
    bl         S_Story_6B_SkipIfStart
LAB_08093ad4:
    pop        {pc}


_nt S_Story_6B_4
    bl         SceneCamera_Main
    cmp        r0,#0x1
    beq        LAB_08093af0
    push       {r5}
    ldr        r0,PTR_ScenarioData_6B_08093c54
    mov        r1,#0x6
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08093af0:
    bl         Scene_IsStartPressed
    beq        LAB_08093afa
    bl         S_Story_6B_SkipIfStart
LAB_08093afa:
    pop        {pc}


_ts S_Story_6B_5
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08093b18
    ldr        r0,PTR_Cam_Move_08093c5c
    bl         SceneCamera_Init
    bl         SceneCamera_Main
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08093b18:
    bl         Scene_IsStartPressed
    beq        LAB_08093b22
    bl         S_Story_6B_SkipIfStart
LAB_08093b22:
    pop        {pc}


_ts S_Story_6B_6
    bl         SceneCamera_Main
    cmp        r0,#0x1
    beq        LAB_08093b3e
    push       {r5}
    ldr        r0,PTR_ScenarioData_6B_08093c54
    mov        r1,#0x7
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08093b3e:
    bl         Scene_IsStartPressed
    beq        LAB_08093b48
    bl         S_Story_6B_SkipIfStart
LAB_08093b48:
    pop        {pc}


_nt S_Story_6B_7
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08093b66
    ldr        r0,PTR_Cam_Set_08093c60
    bl         SceneCamera_Init
    bl         SceneCamera_Main
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08093b66:
    bl         Scene_IsStartPressed
    beq        LAB_08093b70
    bl         S_Story_6B_SkipIfStart
LAB_08093b70:
    pop        {pc}


_nt S_Story_6B_8
    bl         SceneCamera_Main
    cmp        r0,#0x1
    beq        LAB_08093b8c
    push       {r5}
    ldr        r0,PTR_ScenarioData_6B_08093c54
    mov        r1,#0xa
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08093b8c:
    bl         Scene_IsStartPressed
    beq        LAB_08093b96
    bl         S_Story_6B_SkipIfStart
LAB_08093b96:
    pop        {pc}


_ts S_Story_6B_9
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08093bb6
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08093bb6:
    bl         Scene_IsStartPressed
    beq        LAB_08093bc0
    bl         S_Story_6B_SkipIfStart
LAB_08093bc0:
    pop        {pc}


_nt S_Story_6B_10
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08093be2
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08093be2:
    pop        {pc}


_ts S_Story_6B_11
    bl         PlayerAnimation_Unlock
    bl         Flag_SetPlayerActive
    push       {r5}
    Flag_SetBase 0xA8
    pop        {r5}
    LoadMain world, r0, r0
    mov        r1,#0x54
    strb       r1,[r0,#0x6]
    push       {r5}
    LoadMain mapChange, r0, r7
    mov        r1,#0x1
    strb       r1,[r0,#0x10]
    mov        r1,#0x1
    strb       r1,[r0,#0x12]
    ldr        r1,PTR_MapEntrance_08093c64
    str        r1,[r0,#0x14]
    mov        r0,#0x0
    bl         World_ChangeMap
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}

    .align 2, 0


MapEntrance_08093c20:
    MapEntrance Map_ACDC_Secret_Station, d_ne, f(-24, 36, 0)


_ts S_Story_6B_SkipIfStart
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x28
    strb       r0,[r5,#0x0]
    pop        {pc}

PTR_PTR_S_Story_6B_0_08093c48:
    .word PTR_S_Story_6B_0_080939c0

PTR_DAT_08093c4c:
    .word NPCList_8030590

PTR_Cam_Set_08093c50:
    .word Cam_Set_08093988

PTR_ScenarioData_6B_08093c54:
    .word ScenarioData_6B

PTR_Cam_Set_08093c58:
    .word Cam_Set_08093992

PTR_Cam_Move_08093c5c:
    .word Cam_Move_080939a6

PTR_Cam_Set_08093c60:
    .word Cam_Set_08093992

PTR_MapEntrance_08093c64:
    .word MapEntrance_08093c20
