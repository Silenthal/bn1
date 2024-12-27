#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


Cam_Set_0808e7e8:
    cam_set 114, 96, 0
    cam_move 0, -128, 0, 230
    cam_end

Cam_Move_0808e7fc:
    cam_move 0, 128, 0, 230
    cam_end


_ts Scene_Story_4A
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_4A_0_0808ea88
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_4A_0_0808e814:
    .word S_Story_4A_0
    .word S_Story_4A_1
    .word S_Story_4A_2
    .word S_Story_4A_3
    .word S_Story_4A_4
    .word S_Story_4A_5
    .word S_Story_4A_6
    .word S_Story_4A_7
    .word S_Story_4A_8
    .word S_Story_4A_9
    .word S_Story_4A_10
    .word S_Story_4A_11
    .word S_Story_4A_12


_ts S_Story_4A_0
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_Story_4A_1
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_0808e880
    push       {r5}
    mov        r0,#0x7
    bl         PlayerAnimation_SetState
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_ScenarioData_4A_0808ea8c
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808e880:
    pop        {pc}


_nt S_Story_4A_2
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808e89a
    ldr        r0,PTR_Cam_Set_0808ea90
    bl         SceneCamera_Init
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808e89a:
    bl         Scene_IsStartPressed
    beq        LAB_0808e8a4
    bl         S_Story_4A_SkipIfStart
LAB_0808e8a4:
    pop        {pc}


_nt S_Story_4A_3
    bl         SceneCamera_Main
    cmp        r0,#0x1
    beq        LAB_0808e8ca
    push       {r5}
    ldr        r0,PTR_ScenarioData_4A_0808ea8c
    mov        r1,#0x1
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    bl         Scene_IsStartPressed
    beq        LAB_0808e8ca
    bl         S_Story_4A_SkipIfStart
LAB_0808e8ca:
    pop        {pc}


_ts S_Story_4A_4
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808e8e4
    ldr        r0,PTR_Cam_Move_0808ea94
    bl         SceneCamera_Init
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808e8e4:
    bl         Scene_IsStartPressed
    beq        LAB_0808e8ee
    bl         S_Story_4A_SkipIfStart
LAB_0808e8ee:
    pop        {pc}


_ts S_Story_4A_5
    bl         SceneCamera_Main
    cmp        r0,#0x1
    beq        LAB_0808e926
    push       {r5}
    ldr        r0,PTR_ScenarioData_4A_0808ea8c
    mov        r1,#0x3
    bl         Text_LoadDialogue
    pop        {r5}
    push       {r5}
    mov        r0,#0x1
    mov        r1,r10
    ldr        r1,[r1,#0x8]
    ldr        r1,[r1,#0x28]
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    bl         Scene_IsStartPressed
    beq        LAB_0808e926
    bl         S_Story_4A_SkipIfStart
LAB_0808e926:
    pop        {pc}


_ts S_Story_4A_6
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808e948
    mov        r0,#0x37
    strb       r0,[r5,#0x8]
    push       {r5}
    mov        r0,#0x17
    bl         PlayerAnimation_SetState
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808e948:
    bl         Scene_IsStartPressed
    beq        LAB_0808e952
    bl         S_Story_4A_SkipIfStart
LAB_0808e952:
    pop        {pc}


_ts S_Story_4A_7
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    beq        LAB_0808e96e
    mov        r0,#0x0
    mov        r1,#0x10
    neg        r1,r1
    lsl        r1,r1,#0xc
    mov        r2,#0x0
    bl         PlayerAnimation_Move
    b          LAB_0808e98a
LAB_0808e96e:
    push       {r5}
    mov        r0,#0x31
    bl         PlayerAnimation_SetState
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    push       {r5}
    ldr        r0,PTR_ScenarioData_4A_0808ea8c
    mov        r1,#0x4
    bl         Text_LoadDialogue
    pop        {r5}
LAB_0808e98a:
    bl         Scene_IsStartPressed
    beq        LAB_0808e994
    bl         S_Story_4A_SkipIfStart
LAB_0808e994:
    pop        {pc}


_nt S_Story_4A_8
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808e9ae
    mov        r0,#0xbc
    bl         Flag_SetBase
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808e9ae:
    bl         Scene_IsStartPressed
    beq        LAB_0808e9b8
    bl         S_Story_4A_SkipIfStart
LAB_0808e9b8:
    pop        {pc}


_nt S_Story_4A_9
    mov        r0,#0xbc
    bl         Flag_GetBase
    bne        LAB_0808e9d4
    push       {r5}
    ldr        r0,PTR_ScenarioData_4A_0808ea8c
    mov        r1,#0x6
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808e9d4:
    bl         Scene_IsStartPressed
    beq        LAB_0808e9de
    bl         S_Story_4A_SkipIfStart
LAB_0808e9de:
    pop        {pc}


_ts S_Story_4A_10
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808ea08
    push       {r5}
    mov        r0,#0x2
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    bl         Sound_StopAllMusic
    mov        r0,#0xc7
    bl         Sound_PlaySongImmediate
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808ea08:
    bl         Scene_IsStartPressed
    beq        LAB_0808ea12
    bl         S_Story_4A_SkipIfStart
LAB_0808ea12:
    pop        {pc}


_ts S_Story_4A_11
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808ea34
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808ea34:
    pop        {pc}


_nt S_Story_4A_12
    push       {r5}
    bl         PlayerAnimation_Unlock
    mov        r0,#0xbb
    bl         Flag_SetBase
    mov        r0,#0x2a
    bl         Flag_SetEvent
    ldr        r0,PTR_EnemySpawn_ColorManV1_0808ea98
    bl         Battle_GetRandomEncounter
    mov        r0,#0x3
    mov        r1,#0x5
    mov        r2,#0x0
    mov        r4,#0x81
    mov        r6,#0x1
    bl         World_SetBattleParams
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}


_ts S_Story_4A_SkipIfStart
    push       {r5}
    mov        r0,#0x2
    mov        r1,#0x8
    bl         Fade_Request
    bl         Sound_StopAllMusic
    mov        r0,#0xc7
    bl         Sound_PlaySongImmediate
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x2c
    strb       r0,[r5,#0x0]
    pop        {pc}

    .align 2, 0


PTR_PTR_S_Story_4A_0_0808ea88:
    .word PTR_S_Story_4A_0_0808e814

PTR_ScenarioData_4A_0808ea8c:
    .word ScenarioData_4A

PTR_Cam_Set_0808ea90:
    .word Cam_Set_0808e7e8

PTR_Cam_Move_0808ea94:
    .word Cam_Move_0808e7fc

PTR_EnemySpawn_ColorManV1_0808ea98:
    .word EnemySpawn_ColorManV1
