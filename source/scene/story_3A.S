#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


Cam_Set_0808cd18:
    cam_set -42, 18, 0
    cam_end

Cam_Set_0808cd22:
    cam_set -60, -40, 0
    cam_end
    cam_set -56, 72, 0
    cam_end

    .align 2, 0



_ts Scene_Story_3A
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_3A_0_0808cf70
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_3A_0_0808cd44:
    .word S_Story_3A_0
    .word S_Story_3A_1
    .word S_Story_3A_2
    .word S_Story_3A_3
    .word S_Story_3A_4
    .word S_Story_3A_5
    .word S_Story_3A_6
    .word S_Story_3A_7
    .word S_Story_3A_8


_ts S_Story_3A_0
    push       {r5}
    mov        r0,#T_Suspicious_Mood
    bl         Sound_PlayBGM
    pop        {r5}
    push       {r5}
    bl         Flag_SetPlayerInactive
    pop        {r5}
    Scene_Next
    mov        r0,#0x0
    strb       r0,[r5,#Scene_state_s1]
    pop        {pc}


_nt S_Story_3A_1
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808cdb2
    ldr        r0,PTR_Cam_Set_0808cf74
    bl         SceneCamera_Init
    bl         SceneCamera_Main
    push       {r5}
    mov        r0,#0x1
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x3c
    strb       r0,[r5,#Scene_sceneTimer]
    Scene_Next
LAB_0808cdb2:
    pop        {pc}


_ts S_Story_3A_2
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808cdca
    mov        r0,#0x3c
    strb       r0,[r5,#Scene_sceneTimer]
    Scene_Next
LAB_0808cdca:
    bl         Scene_IsStartPressed
    beq        LAB_0808cdd4
    bl         S_Story_3A_SkipIfStart
LAB_0808cdd4:
    pop        {pc}


_nt S_Story_3A_3
    ldrb       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    bne        LAB_0808cdf2
    ldr        r0,PTR_Cam_Set_0808cf78
    bl         SceneCamera_Init
    bl         SceneCamera_Main
    mov        r0,#0x3c
    strb       r0,[r5,#Scene_sceneTimer]
    Scene_Next
LAB_0808cdf2:
    bl         Scene_IsStartPressed
    beq        LAB_0808cdfc
    bl         S_Story_3A_SkipIfStart
LAB_0808cdfc:
    pop        {pc}


_nt S_Story_3A_4
    ldrb       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    bne        LAB_0808ce34
    push       {r5}
    mov        r0,#0x8
    bl         Entity_FreeAllMultiple
    pop        {r5}
    mov        r0,#0x1
    strb       r0,[r5,#Scene_state_s1]
    push       {r5}
    LoadMain mapEventState, r5, r0
    bl         Traffic_ResetToRedLight
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_803A76C_0808cf7c
    bl         Entity_AllocList
    pop        {r5}
    mov        r0,#0x78
    strb       r0,[r5,#Scene_sceneTimer]
    Scene_Next
LAB_0808ce34:
    bl         Scene_IsStartPressed
    beq        LAB_0808ce3e
    bl         S_Story_3A_SkipIfStart
LAB_0808ce3e:
    pop        {pc}


_ts S_Story_3A_5
    push       {r5}
    LoadMain mapEventState, r5, r0
    bl         Traffic_Main
    pop        {r5}
    ldrb       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    bne        LAB_0808ce66
    push       {r5}
    ldr        r0,PTR_ScenarioData_3A_0808cf80
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
LAB_0808ce66:
    bl         Scene_IsStartPressed
    beq        LAB_0808ce70
    bl         S_Story_3A_SkipIfStart
LAB_0808ce70:
    pop        {pc}


_nt S_Story_3A_6
    push       {r5}
    LoadMain mapEventState, r5, r0
    bl         Traffic_Main
    pop        {r5}
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808ce9c
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    Scene_Next
LAB_0808ce9c:
    bl         Scene_IsStartPressed
    beq        LAB_0808cea6
    bl         S_Story_3A_SkipIfStart
LAB_0808cea6:
    pop        {pc}


_ts S_Story_3A_7
    ldrb       r0,[r5,#Scene_state_s1]
    tst        r0,r0
    bne        LAB_0808ced4
    mov        r0,#0x1
    strb       r0,[r5,#Scene_state_s1]
    push       {r5}
    mov        r0,#0x8
    bl         Entity_FreeAllMultiple
    pop        {r5}
    push       {r5}
    LoadMain mapEventState, r5, r0
    bl         Traffic_ResetToRedLight
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_803A76C_0808cf84
    bl         Entity_AllocList
    pop        {r5}
    b          LAB_0808cee0
LAB_0808ced4:
    push       {r5}
    LoadMain mapEventState, r5, r0
    bl         Traffic_Main
    pop        {r5}
LAB_0808cee0:
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808cf1e
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
    mov        r0,#0x3
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    Scene_Next
LAB_0808cf1e:
    pop        {pc}


_ts S_Story_3A_8
    push       {r5}
    LoadMain mapEventState, r5, r0
    bl         Traffic_Main
    pop        {r5}
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808cf54
    bl         Flag_SetPlayerActive
    push       {r5}
    Flag_SetBase 0x9B
    pop        {r5}
    push       {r5}
    mov        r0,#T_Suspicious_Mood
    bl         Sound_PlayBGM
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
LAB_0808cf54:
    pop        {pc}


_nt S_Story_3A_SkipIfStart
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x1c
    strb       r0,[r5,#Scene_state_s0]
    pop        {pc}

    .align 2, 0


PTR_PTR_S_Story_3A_0_0808cf70:
    .word PTR_S_Story_3A_0_0808cd44

PTR_Cam_Set_0808cf74:
    .word Cam_Set_0808cd18

PTR_Cam_Set_0808cf78:
    .word Cam_Set_0808cd22

PTR_EntityAllocParams_803A76C_0808cf7c:
    .word EntityAllocParams_803A76C

PTR_ScenarioData_3A_0808cf80:
    .word ScenarioData_3A

PTR_EntityAllocParams_803A76C_0808cf84:
    .word EntityAllocParams_803A76C
