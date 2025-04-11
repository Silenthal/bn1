#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


    cam_end

    .align 2, 0


MapEntranceOptions_080875d0:
    MapEntranceOpt Map_School_Class_5A, d_s, f(47, 18, 0), dialog=0x5, changeType=1, fadeType=0

MapEntranceOptions_080875e4:
    MapEntranceOpt Map_School_Class_5A, d_s, f(47, 18, 0), dialog=0x5, changeType=4, fadeType=0


_ts Scene_School_Comp_5_Passcode
    push       {lr}
    ldr        r0,PTR_PTR_S_School_Comp_5_Passcode_0_080876fc
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_School_Comp_5_Passcode_0_08087604:
    .word S_School_Comp_5_Passcode_0
    .word S_School_Comp_5_Passcode_1
    .word S_School_Comp_5_Passcode_2
    .word S_School_Comp_5_Passcode_3
    .word S_School_Comp_5_Passcode_4


_ts S_School_Comp_5_Passcode_0
    mov        r3,#0x0
    mov        r0,#0x3
    bl         KeyItem_IsPresent
    cmp        r0,#0x0
    beq        LAB_08087626
    mov        r3,#0x1
LAB_08087626:
    ldr        r0,PTR_MapEntranceOptions_08087700
    mov        r2,#0x14
    mul        r2,r3
    add        r0,r0,r2
    str        r0,[r5,#Scene_sceneArg]
    push       {r5}
    bl         Flag_SetPlayerInactive
    pop        {r5}
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808764a
    Scene_Next
LAB_0808764a:
    pop        {pc}


_ts S_School_Comp_5_Passcode_1
    push       {r5}
    mov        r0,#0x5
    bl         Text_LoadAreaDialogue
    pop        {r5}
    Scene_Next
    pop        {pc}


_nt S_School_Comp_5_Passcode_2
    push       {r5}
    mov        r0,#TF_DialogueActive
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08087670
    Scene_Next
LAB_08087670:
    pop        {pc}


_nt S_School_Comp_5_Passcode_3
    push       {r5}
    ldr        r0,[r5,#Scene_sceneArg]
    ldrb       r0,[r0,#0x12]
    cmp        r0,#0x4
    pop        {r5}
    beq        LAB_0808768a
    push       {r5}
    FadeOutFast_Black
    pop        {r5}
LAB_0808768a:
    push       {r5}
    mov        r0,#TF_DisableInput
    bl         Text_EnableOption
    pop        {r5}
    Scene_Next
    pop        {pc}


_ts S_School_Comp_5_Passcode_4
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080876f8
    push       {r5}
    mov        r0,#TF_DisableInput
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    push       {r5}
    ldr        r0,[r5,#Scene_sceneArg]
    ldrb       r0,[r0,#0x12]
    cmp        r0,#0x4
    pop        {r5}
    beq        LAB_080876ec
    LoadMain world, r0, r7
    mov        r1,#0x3
    strb       r1,[r0,#World_fadeType]
    ldr        r0,[r7,#0x2c]
    mov        r1,#0x1
    strb       r1,[r0,#0x10]
    ldr        r2,[r5,#Scene_sceneArg]
    strb       r1,[r0,#0x12]
    str        r2,[r0,#0x14]
    push       {r5}
    ldr        r0,[r5,#Scene_sceneArg]
    ldrb       r0,[r0,#0x12]
    bl         World_ChangeMap
    pop        {r5}
    push       {r5}
    mov        r0,#0x1f
    bl         Entity_FreeAllMultiple
    pop        {r5}
LAB_080876ec:
    push       {r5}
    bl         Flag_SetPlayerActive
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
LAB_080876f8:
    pop        {pc}

    .align 2, 0


PTR_PTR_S_School_Comp_5_Passcode_0_080876fc:
    .word PTR_S_School_Comp_5_Passcode_0_08087604

PTR_MapEntranceOptions_08087700:
    .word MapEntranceOptions_080875d0
