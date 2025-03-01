#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


Cam_Set_0808dee0:
    cam_set -34, 36, 0
    cam_end

Cam_Set_0808deea:
    cam_set 12, -16, 0
    cam_end


_ts Scene_Story_45
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_45_0_0808e074
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_45_0_0808df00:
    .word S_Story_45_0
    .word S_Story_45_1
    .word S_Story_45_2
    .word S_Story_45_3
    .word S_Story_45_4
    .word S_Story_45_5
    .word S_Story_45_6
    .word S_Story_45_7


_ts S_Story_45_0
    push       {r5}
    bl         Flag_SetPlayerInactive
    ldr        r0,PTR_Cam_Set_0808e078
    bl         SceneCamera_Init
    bl         SceneCamera_Main
    FadeIn_Black
    pop        {r5}
    Scene_Next
    pop        {pc}


_nt S_Story_45_1
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808df58
    mov        r0,#0x3c
    strb       r0,[r5,#Scene_sceneTimer]
    Scene_Next
LAB_0808df58:
    bl         Scene_IsStartPressed
    beq        LAB_0808df62
    bl         S_Story_45_SkipIfStart
LAB_0808df62:
    pop        {pc}


_ts S_Story_45_2
    ldrb       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    tst        r0,r0
    bne        LAB_0808df82
    ldr        r0,PTR_Cam_Set_0808e07c
    bl         SceneCamera_Init
    bl         SceneCamera_Main
    mov        r0,#0x3c
    strb       r0,[r5,#Scene_sceneTimer]
    Scene_Next
LAB_0808df82:
    bl         Scene_IsStartPressed
    beq        LAB_0808df8c
    bl         S_Story_45_SkipIfStart
LAB_0808df8c:
    pop        {pc}


_nt S_Story_45_3
    ldrb       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    tst        r0,r0
    bne        LAB_0808dfae
    LoadMain mapEventState, r7, r7
    mov        r0,#0x0
    strb       r0,[r7,#MapEventState_b8]
    strb       r0,[r7,#MapEventState_ba]
    mov        r0,#0x2
    strb       r0,[r7,#MapEventState_b9]
    strb       r0,[r7,#MapEventState_bb]
    Scene_Next
LAB_0808dfae:
    bl         Scene_IsStartPressed
    beq        LAB_0808dfb8
    bl         S_Story_45_SkipIfStart
LAB_0808dfb8:
    pop        {pc}


_nt S_Story_45_4
    push       {r5}
    ldr        r0,PTR_ScenarioData_45_0808e080
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
    pop        {pc}


_nt S_Story_45_5
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808dfec
    push       {r5}
    FadeOut_Black
    pop        {r5}
    Scene_Next
LAB_0808dfec:
    bl         Scene_IsStartPressed
    beq        LAB_0808dff6
    bl         S_Story_45_SkipIfStart
LAB_0808dff6:
    pop        {pc}


_ts S_Story_45_6
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808e018
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    Scene_Next
LAB_0808e018:
    pop        {pc}


_nt S_Story_45_7
    bl         Flag_SetPlayerActive
    push       {r5}
    Flag_SetBase 0xB5
    pop        {r5}
    push       {r5}
    LoadMain mapChange, r0, r7
    mov        r1,#0x1
    strb       r1,[r0,#MapChange_type]
    mov        r1,#0x1
    strb       r1,[r0,#MapChange_destinationIndex]
    ldr        r1,PTR_MapEntrance_0808e084
    str        r1,[r0,#MapChange_destinationList]
    mov        r0,#0x2
    bl         World_ChangeMap
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}

MapEntrance_0808e048:
    MapEntrance Map_Traffic_Light_Comp_5, d_nw, f(-6, -4, 0)


_ts S_Story_45_SkipIfStart
    push       {r5}
    FadeOut_Black
    pop        {r5}
    push       {r5}
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x18
    strb       r0,[r5,#Scene_state_s0]
    pop        {pc}

PTR_PTR_S_Story_45_0_0808e074:
    .word PTR_S_Story_45_0_0808df00

PTR_Cam_Set_0808e078:
    .word Cam_Set_0808dee0

PTR_Cam_Set_0808e07c:
    .word Cam_Set_0808deea

PTR_ScenarioData_45_0808e080:
    .word ScenarioData_45

PTR_MapEntrance_0808e084:
    .word MapEntrance_0808e048
