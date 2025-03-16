#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

Cam_Set_080864b0:
    cam_set 66, 10, 0
    cam_wait 30
    cam_move -256, 0, 0, 180
    cam_wait 30
    cam_end

Cam_Set_080864cc:
    cam_set -114, 10, 0
    cam_move 256, 0, 0, 180
    cam_wait 30
    cam_end


_ts Scene_Story_12
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_12_0_080866a8
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_12_0_080864f0:
    .word S_Story_12_0
    .word S_Story_12_1
    .word S_Story_12_2
    .word S_Story_12_3
    .word S_Story_12_4
    .word S_Story_12_5
    .word S_Story_12_6
    .word S_Story_12_7
    .word S_Story_12_8
    .word S_Story_12_9
    .word S_Story_12_10


_ts S_Story_12_0
    ldr        r0,PTR_Cam_Set_080866ac
    bl         SceneCamera_Init
    Scene_Next
    pop        {pc}


_nt S_Story_12_1
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808653c
    Scene_Next
LAB_0808653c:
    pop        {pc}


_nt S_Story_12_2
    bl         SceneCamera_Main
    tst        r0,r0
    bne        S_Story_12_SkipIfStart
    push       {r5}
    ldr        r0,PTR_ScenarioData_12_080866b0
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next


_ts S_Story_12_SkipIfStart
    bl         Scene_IsStartPressed
    beq        LAB_08086562
    mov        r0,#0x24
    strb       r0,[r5,#Scene_state_s0]
LAB_08086562:
    pop        {pc}


_ts S_Story_12_3
    push       {r5}
    mov        r0,#TF_DialogueActive
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08086590
    ldr        r0,PTR_Cam_Set_080866b4
    bl         SceneCamera_Init
    push       {r5}
    ldr        r0,PTR_ScenarioData_12_080866b0
    mov        r1,#0x2
    bl         Text_LoadDialogue
    Fade_Request FT_FadeOutToBlackExceptBG0, 0x4
    pop        {r5}
    Scene_Next
LAB_08086590:
    b          S_Story_12_SkipIfStart


_nt S_Story_12_4
    bl         SceneCamera_Main
    tst        r0,r0
    bne        LAB_080865c2
    push       {r5}
    mov        r0,#TF_DialogueActive
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_080865c2
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080865c2
    push       {r5}
    ldr        r7,PTR_PTR_DAT_080866b8
    bl         Map_LoadNPCList
    pop        {r5}
    Scene_Next
LAB_080865c2:
    b          S_Story_12_SkipIfStart


_ts S_Story_12_5
    push       {r5}
    Fade_Request FT_FadeInFromBlackExceptBG0, 0x4
    pop        {r5}
    Scene_Next
    b          S_Story_12_SkipIfStart


_ts S_Story_12_6
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080865f6
    push       {r5}
    ldr        r0,PTR_ScenarioData_12_080866b0
    mov        r1,#0x3
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
LAB_080865f6:
    b          S_Story_12_SkipIfStart


_ts S_Story_12_7
    push       {r5}
    mov        r0,#TF_DialogueActive
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08086616
    push       {r5}
    FadeOutFast_Black
    pop        {r5}
    Scene_Next
LAB_08086616:
    b          S_Story_12_SkipIfStart


_ts S_Story_12_8
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808665c
    push       {r5}
    mov        r0,#TF_DisableInput
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    mov        r0,#0x10
    bl         Entity_FreeAllMultiple
    Flag_SetBase 0x92
    pop        {r5}
    push       {r5}
    LoadMain mapChange, r0, r7
    mov        r1,#0x1
    strb       r1,[r0,#MapChange_type]
    mov        r1,#0x1
    strb       r1,[r0,#MapChange_destinationIndex]
    ldr        r1,PTR_MapEntrance_080866bc
    str        r1,[r0,#MapChange_destinationList]
    mov        r0,#0x0
    bl         World_ChangeMap
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
LAB_0808665c:
    pop        {pc}

    .align 2, 0


MapEntrance_08086660:
    MapEntrance Map_School_Class_5A, d_s, f(0, -28, 0)


_ts S_Story_12_9
    push       {r5}
    FadeOutFast_Black
    pop        {r5}
    Scene_Next
    pop        {pc}


_ts S_Story_12_10
    push       {r5}
    mov        r0,#TF_DisableInput
    bl         Text_EnableOption
    pop        {r5}
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080866a6
    push       {r5}
    bl         Text_DisableDialogue
    pop        {r5}
    mov        r0,#0x20
    strb       r0,[r5,#Scene_state_s0]
LAB_080866a6:
    pop        {pc}

PTR_PTR_S_Story_12_0_080866a8:
    .word PTR_S_Story_12_0_080864f0

PTR_Cam_Set_080866ac:
    .word Cam_Set_080864b0

PTR_ScenarioData_12_080866b0:
    .word ScenarioData_12

PTR_Cam_Set_080866b4:
    .word Cam_Set_080864cc

PTR_PTR_DAT_080866b8:
    .word NPCList_8028C5C

PTR_MapEntrance_080866bc:
    .word MapEntrance_08086660
