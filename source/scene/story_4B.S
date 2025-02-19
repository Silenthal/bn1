#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


Cam_Set_0808ea9c:
    cam_set 88, 0, 0
    cam_end

    .align 2, 0



_ts Scene_Story_4B
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_4B_0_0808ec08
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_4B_0_0808eab4:
    .word S_Story_4B_0
    .word S_Story_4B_1
    .word S_Story_4B_2
    .word S_Story_4B_3
    .word S_Story_4B_4
    .word S_Story_4B_5


_ts S_Story_4B_0
    push       {r5}
    bl         Sound_StopAllMusic
    pop        {r5}
    Flag_ClearEvent 0x2A
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_80492CC_0808ec0c
    bl         Map_LoadNPCList
    pop        {r5}
    ldr        r0,PTR_Cam_Set_0808ec10
    bl         SceneCamera_Init
    bl         SceneCamera_Main
    Scene_Next
    pop        {pc}


_nt S_Story_4B_1
    bl         PlayerAnimation_GetState
    cmp        r0,#0x2
    bne        LAB_0808eb30
    push       {r5}
    mov        r0,#0x72
    lsl        r0,r0,#0x10
    mov        r1,#0x2
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    mov        r0,#0x7
    bl         PlayerAnimation_SetState
    pop        {r5}
    push       {r5}
    FadeInFast_Black
    pop        {r5}
    Scene_Next
LAB_0808eb30:
    pop        {pc}


_nt S_Story_4B_2
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808eb5a
    push       {r5}
    ldr        r0,PTR_ScenarioData_4B_0808ec14
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
    bl         Scene_IsStartPressed
    beq        LAB_0808eb5a
    bl         S_Story_4B_SkipIfStart
LAB_0808eb5a:
    pop        {pc}


_ts S_Story_4B_3
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808eb7a
    push       {r5}
    FadeOut_Black
    pop        {r5}
    Scene_Next
LAB_0808eb7a:
    bl         Scene_IsStartPressed
    beq        LAB_0808eb84
    bl         S_Story_4B_SkipIfStart
LAB_0808eb84:
    pop        {pc}


_nt S_Story_4B_4
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808eba6
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    Scene_Next
LAB_0808eba6:
    pop        {pc}


_ts S_Story_4B_5
    push       {r5}
    bl         PlayerAnimation_Unlock
    pop        {r5}
    push       {r5}
    Flag_SetBase 0xBD
    Flag_SetEvent 0x2E
    pop        {r5}
    push       {r5}
    LoadMain mapChange, r0, r7
    mov        r1,#0x1
    strb       r1,[r0,#0x10]
    mov        r1,#0x1
    strb       r1,[r0,#0x12]
    ldr        r1,PTR_MapEntrance_0808ec18
    str        r1,[r0,#0x14]
    mov        r0,#0x0
    bl         World_ChangeMap
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}

MapEntrance_0808ebe0:
    MapEntrance Map_DenTown_Center, d_nw, f(-100, 28, 0)


_ts S_Story_4B_SkipIfStart
    push       {r5}
    FadeOut_Black
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x10
    strb       r0,[r5,#Scene_state_s0]
    pop        {pc}

PTR_PTR_S_Story_4B_0_0808ec08:
    .word PTR_S_Story_4B_0_0808eab4

PTR_NPCList_80492CC_0808ec0c:
    .word NPCList_80492CC

PTR_Cam_Set_0808ec10:
    .word Cam_Set_0808ea9c

PTR_ScenarioData_4B_0808ec14:
    .word ScenarioData_4B

PTR_MapEntrance_0808ec18:
    .word MapEntrance_0808ebe0
