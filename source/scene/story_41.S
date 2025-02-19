#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


Cam_Set_0808d734:
    cam_set -78, 30, 0
    cam_end

    .align 2, 0



_ts Scene_Story_41
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_41_0_0808d954
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_41_0_0808d74c:
    .word S_Story_41_0
    .word S_Story_41_1
    .word S_Story_41_2
    .word S_Story_41_3
    .word S_Story_41_4
    .word S_Story_41_5
    .word S_Story_41_6
    .word S_Story_41_7
    .word S_Story_41_8
    .word S_Story_41_9


_ts S_Story_41_0
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    Scene_Next
    pop        {pc}


_ts S_Story_41_1
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_0808d7e2
    ldr        r0,PTR_Cam_Set_0808d958
    bl         SceneCamera_Init
    bl         SceneCamera_Main
    LoadMain mapEventState, r7, r7
    mov        r0,#0x0
    strb       r0,[r7,#0x8]
    strb       r0,[r7,#0x9]
    mov        r0,#0x2
    strb       r0,[r7,#0xa]
    strb       r0,[r7,#0xb]
    push       {r5}
    mov        r0,#0x6
    neg        r0,r0
    lsl        r0,r0,#0x10
    mov        r1,#0x4
    neg        r1,r1
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    lsl        r2,r2,#0x10
    bl         PlayerAnimation_SetPosition
    mov        r0,#0x5
    bl         PlayerAnimation_SetState
    mov        r0,#0x18
    bl         Entity_FreeAllMultiple
    ldr        r0,PTR_EntityAllocParams_803AB3C_0808d95c
    bl         Entity_AllocList
    mov        r0,#0x1
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    Scene_Next
LAB_0808d7e2:
    pop        {pc}


_ts S_Story_41_2
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808d800
    push       {r5}
    mov        r7,#0x1
    bl         Effect_Nonstop_Bus_Create
    pop        {r5}
    Scene_Next
LAB_0808d800:
    bl         Scene_IsStartPressed
    beq        LAB_0808d80a
    bl         S_Story_41_SkipIfStart
LAB_0808d80a:
    pop        {pc}


_ts S_Story_41_3
    push       {r5}
    ldr        r0,PTR_ScenarioData_41_0808d960
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
    bl         Scene_IsStartPressed
    beq        LAB_0808d828
    bl         S_Story_41_SkipIfStart
LAB_0808d828:
    pop        {pc}


_nt S_Story_41_4
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808d840
    mov        r0,#0x37
    strh       r0,[r5,#Scene_sceneTimer]
    Scene_Next
LAB_0808d840:
    bl         Scene_IsStartPressed
    beq        LAB_0808d84a
    bl         S_Story_41_SkipIfStart
LAB_0808d84a:
    pop        {pc}


_ts S_Story_41_5
    ldrh       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strh       r0,[r5,#Scene_sceneTimer]
    tst        r0,r0
    bne        LAB_0808d872
    LoadMain mapEventState, r7, r7
    mov        r0,#0x2
    strb       r0,[r7,#0x8]
    strb       r0,[r7,#0xa]
    mov        r0,#0x0
    strb       r0,[r7,#0x9]
    strb       r0,[r7,#0xb]
    Flag_SetBase 0xB2
    Scene_Next
LAB_0808d872:
    bl         Scene_IsStartPressed
    beq        LAB_0808d87c
    bl         S_Story_41_SkipIfStart
LAB_0808d87c:
    pop        {pc}


_nt S_Story_41_6
    push       {r5}
    ldr        r0,PTR_ScenarioData_41_0808d960
    mov        r1,#0x1
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
    bl         Scene_IsStartPressed
    beq        LAB_0808d89a
    bl         S_Story_41_SkipIfStart
LAB_0808d89a:
    pop        {pc}


_ts S_Story_41_7
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808d8ba
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    Scene_Next
LAB_0808d8ba:
    bl         Scene_IsStartPressed
    beq        LAB_0808d8c4
    bl         S_Story_41_SkipIfStart
LAB_0808d8c4:
    pop        {pc}


_nt S_Story_41_8
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808d8f8
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
    Scene_Next
LAB_0808d8f8:
    pop        {pc}


_nt S_Story_41_9
    push       {r5}
    bl         PlayerAnimation_Unlock
    pop        {r5}
    push       {r5}
    Flag_SetBase 0xAF
    pop        {r5}
    push       {r5}
    LoadMain mapChange, r0, r7
    mov        r1,#0x1
    strb       r1,[r0,#0x10]
    mov        r1,#0x1
    strb       r1,[r0,#0x12]
    ldr        r1,PTR_MapEntrance_0808d964
    str        r1,[r0,#0x14]
    mov        r0,#0x0
    bl         World_ChangeMap
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}

MapEntrance_0808d92c:
    MapEntrance Map_DenTown_Block_2, d_sw, f(-6, -4, 0)


_ts S_Story_41_SkipIfStart
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x20
    strb       r0,[r5,#Scene_state_s0]
    pop        {pc}

PTR_PTR_S_Story_41_0_0808d954:
    .word PTR_S_Story_41_0_0808d74c

PTR_Cam_Set_0808d958:
    .word Cam_Set_0808d734

PTR_EntityAllocParams_803AB3C_0808d95c:
    .word EntityAllocParams_803AB3C

PTR_ScenarioData_41_0808d960:
    .word ScenarioData_41

PTR_MapEntrance_0808d964:
    .word MapEntrance_0808d92c
