#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


Cam_Set_08087704:
    cam_set 280, 92, 0
    cam_move -128, -128, 0, 252
    cam_wait 60
    cam_end


_ts Scene_Story_1A
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_1A_0_0808789c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_1A_0_08087728:
    .word S_Story_1A_0
    .word S_Story_1A_1
    .word S_Story_1A_2
    .word S_Story_1A_3
    .word S_Story_1A_4
    .word S_Story_1A_5


_ts S_Story_1A_0
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_Story_1A_1
    bl         PlayerAnimation_GetState
    cmp        r0,#0x2
    bne        LAB_08087770
    mov        r0,#0x7
    bl         PlayerAnimation_SetState
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08087770:
    pop        {pc}


_nt S_Story_1A_2
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080877ce
    push       {r5}
    mov        r0,#0x1c
    bl         Entity_FreeAllMultiple
    pop        {r5}
    bl         DisableBoundaryCheck
    mov        r0,#0x82
    lsl        r0,r0,#0x10
    mov        r1,#0x0
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    mov        r0,#0x31
    bl         PlayerAnimation_SetState
    LoadMain world, r0, r0
    mov        r1,#0x0
    str        r1,[r0,#0x34]
    push       {r5}
    ldr        r7,PTR_NPCList_8041F68_080878a0
    bl         Map_LoadNPCList
    ldr        r0,PTR_EntityAllocParams_804231C_080878a4
    bl         Entity_AllocList
    pop        {r5}
    ldr        r0,PTR_Cam_Set_080878a8
    bl         SceneCamera_Init
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080877ce:
    pop        {pc}


_ts S_Story_1A_3
    bl         SceneCamera_Main
    LoadMain fade, r2, r2
    ldrb       r2,[r2,#0x3]
    mov        r1,#0x1
    cmp        r2,r1
    beq        LAB_08087800
    cmp        r0,#0x1
    beq        LAB_080877f6
    push       {r5}
    ldr        r0,PTR_ScenarioData_1A_080878ac
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080877f6:
    bl         Scene_IsStartPressed
    beq        LAB_08087800
    bl         S_Story_1A_SkipIfStart
LAB_08087800:
    pop        {pc}


_nt S_Story_1A_4
    bl         SceneCamera_Main
    cmp        r0,#0x1
    beq        LAB_08087832
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08087832
    push       {r5}
    mov        r0,#0x2
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    bl         Sound_StopAllMusic
    mov        r0,#0xc7
    bl         Sound_PlaySE
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08087832:
    bl         Scene_IsStartPressed
    beq        LAB_08087800
    bl         S_Story_1A_SkipIfStart
    pop        {pc}


_nt S_Story_1A_5
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08087878
    bl         EnableBoundaryCheck
    push       {r5}
    bl         Text_DisableDialogue
    bl         PlayerAnimation_Unlock
    Flag_SetBase 0xC2
    ldr        r0,PTR_EnemySpawn_NumberManV1_080878b0
    bl         Battle_SetEncounter
    mov        r0,#0x0
    mov        r1,#0x5
    mov        r2,#0x0
    mov        r4,#0x81
    mov        r6,#0x1
    bl         World_SetBattleParams
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
LAB_08087878:
    pop        {pc}


_nt S_Story_1A_SkipIfStart
    push       {r5}
    mov        r0,#0x2
    mov        r1,#0x8
    bl         Fade_Request
    bl         Sound_StopAllMusic
    mov        r0,#0xc7
    bl         Sound_PlaySE
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x14
    strb       r0,[r5,#0x0]
    pop        {pc}

PTR_PTR_S_Story_1A_0_0808789c:
    .word PTR_S_Story_1A_0_08087728

PTR_NPCList_8041F68_080878a0:
    .word NPCList_8041F68

PTR_EntityAllocParams_804231C_080878a4:
    .word EntityAllocParams_804231C

PTR_Cam_Set_080878a8:
    .word Cam_Set_08087704

PTR_ScenarioData_1A_080878ac:
    .word ScenarioData_1A

PTR_EnemySpawn_NumberManV1_080878b0:
    .word EnemySpawn_NumberManV1
