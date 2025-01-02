#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


Cam_Set_0808abf4:
    cam_set 114, 258, -96
    cam_move -128, 128, 0, 212
    cam_wait 60
    cam_end


_ts Scene_Story_31
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_31_0_0808ae7c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_31_0_0808ac18:
    .word S_Story_31_0
    .word S_Story_31_1
    .word S_Story_31_2
    .word S_Story_31_3
    .word S_Story_31_4
    .word S_Story_31_5
    .word S_Story_31_6
    .word S_Story_31_7
    .word S_Story_31_8


_ts S_Story_31_0
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_Story_31_1
    bl         PlayerAnimation_GetState
    cmp        r0,#0x2
    bne        LAB_0808ac76
    push       {r5}
    mov        r0,#0x2e
    bl         PlayerAnimation_SetState
    pop        {r5}
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    ldr        r0,PTR_Cam_Set_0808ae80
    bl         SceneCamera_Init
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808ac76:
    pop        {pc}


_ts S_Story_31_2
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808acd4
    push       {r5}
    mov        r0,#0xe
    lsl        r0,r0,#0x10
    ldr        r1,DAT_0808ae84
    lsl        r1,r1,#0x10
    mov        r2,#0x60
    neg        r2,r2
    lsl        r2,r2,#0x10
    bl         PlayerAnimation_SetPosition
    mov        r0,#0x2e
    bl         PlayerAnimation_SetState
    pop        {r5}
    push       {r5}
    mov        r0,#0x1c
    bl         Entity_FreeAllMultiple
    pop        {r5}
    LoadMain world, r0, r0
    mov        r1,#0x0
    str        r1,[r0,#0x34]
    push       {r5}
    ldr        r7,PTR_NPCList_8046EA4_0808ae88
    bl         Map_LoadNPCList
    pop        {r5}
    ldr        r0,PTR_Cam_Set_0808ae8c
    bl         SceneCamera_Init
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808acd4:
    pop        {pc}


_nt S_Story_31_3
    bl         SceneCamera_Main
    LoadMain fade, r2, r2
    ldrb       r2,[r2,#0x3]
    mov        r1,#0x1
    cmp        r2,r1
    beq        LAB_0808ad0a
    cmp        r0,#0x1
    beq        LAB_0808ad00
    push       {r5}
    ldr        r0,PTR_ScenarioData_31_0808ae90
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    mov        r0,#0x0
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808ad00:
    bl         Scene_IsStartPressed
    beq        LAB_0808ad0a
    bl         S_Story_31_SkipIfStart
LAB_0808ad0a:
    pop        {pc}


_ts S_Story_31_4
    bl         SceneCamera_Main
    cmp        r0,#0x1
    beq        LAB_0808ad60
    Flag_GetBase 0xCA
    beq        LAB_0808ad32
    mov        r0,#0x9d
    bl         Sound_PlaySongImmediate
    mov        r4,#0x1
    bl         Effect_AirBlowing_Create
    mov        r0,#0x3c
    strb       r0,[r5,#0x8]
    Flag_ClearBase 0xCA
LAB_0808ad32:
    ldrb       r0,[r5,#0x8]
    tst        r0,r0
    beq        LAB_0808ad3c
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
LAB_0808ad3c:
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808ad60
    ldrb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_0808ad60
    push       {r5}
    ldr        r0,PTR_ScenarioData_31_0808ae90
    mov        r1,#0x5
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808ad60:
    bl         Scene_IsStartPressed
    beq        LAB_0808ad6a
    bl         S_Story_31_SkipIfStart
LAB_0808ad6a:
    pop        {pc}


_ts S_Story_31_5
    Flag_GetBase 0xC8
    beq        LAB_0808ad90
    mov        r0,#0x9d
    bl         Sound_PlaySongImmediate
    mov        r4,#0x0
    bl         Effect_AirBlowing_Create
    mov        r0,#0x3c
    strb       r0,[r5,#0x8]
    Flag_ClearBase 0xC8
    mov        r0,#0x43
    bl         PlayerAnimation_SetState
LAB_0808ad90:
    ldrb       r0,[r5,#0x8]
    tst        r0,r0
    beq        LAB_0808ad9a
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
LAB_0808ad9a:
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808adbe
    ldrb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_0808adbe
    push       {r5}
    ldr        r0,PTR_ScenarioData_31_0808ae90
    mov        r1,#0x12
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808adbe:
    bl         Scene_IsStartPressed
    beq        LAB_0808adc8
    bl         S_Story_31_SkipIfStart
LAB_0808adc8:
    pop        {pc}


_nt S_Story_31_6
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808adf2
    push       {r5}
    mov        r0,#0x2
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    bl         Sound_StopAllMusic
    mov        r0,#0xc7
    bl         Sound_PlaySongImmediate
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808adf2:
    bl         Scene_IsStartPressed
    beq        LAB_0808adfc
    bl         S_Story_31_SkipIfStart
LAB_0808adfc:
    pop        {pc}


_nt S_Story_31_7
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808ae1e
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808ae1e:
    pop        {pc}


_ts S_Story_31_8
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808ae56
    push       {r5}
    bl         Text_DisableDialogue
    bl         PlayerAnimation_Unlock
    Flag_SetBase 0xC2
    ldr        r0,PTR_EnemySpawn_IceManV1_0808ae94
    bl         Battle_GetRandomEncounter
    mov        r0,#0x2
    mov        r1,#0x5
    mov        r2,#0x0
    mov        r4,#0x81
    mov        r6,#0x1
    bl         World_SetBattleParams
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
LAB_0808ae56:
    pop        {pc}


_ts S_Story_31_SkipIfStart
    push       {r5}
    mov        r0,#0x2
    mov        r1,#0x10
    bl         Fade_Request
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    bl         Sound_StopAllMusic
    mov        r0,#0xc7
    bl         Sound_PlaySongImmediate
    mov        r0,#0x1c
    strb       r0,[r5,#0x0]
    pop        {pc}

    .align 2, 0


PTR_PTR_S_Story_31_0_0808ae7c:
    .word PTR_S_Story_31_0_0808ac18

PTR_Cam_Set_0808ae80:
    .word Cam_Set_0808abf4

DAT_0808ae84:
    .word 0x168

PTR_NPCList_8046EA4_0808ae88:
    .word NPCList_8046EA4

PTR_Cam_Set_0808ae8c:
    .word Cam_Set_0808abf4

PTR_ScenarioData_31_0808ae90:
    .word ScenarioData_31

PTR_EnemySpawn_IceManV1_0808ae94:
    .word EnemySpawn_IceManV1
