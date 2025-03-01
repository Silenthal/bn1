#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


MapEntranceOptions_0808fdd4:
    MapEntrance Map_Power_Plant_Comp_1, d_sw, f(440, 116, 32)
    .byte 0x8, 0x0, 0x0, 0x0
    cam_set 20, 116, 0
    cam_end

    .align 2, 0



_ts Scene_Story_54
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_54_0_0809011c
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_S_Story_54_0_0808fe04:
    .word S_Story_54_0
    .word S_Story_54_1
    .word S_Story_54_2
    .word S_Story_54_3
    .word S_Story_54_4
    .word S_Story_54_5
    .word S_Story_54_6
    .word S_Story_54_7
    .word S_Story_54_8
    .word S_Story_54_9
    .word S_Story_54_10
    .word S_Story_54_11
    .word S_Story_54_12
    .word S_Story_54_13


_ts S_Story_54_0
    push       {lr}
    ldr        r0,PTR_MapEntranceOptions_08090120
    ldrb       r1,[r5,#Scene_dialogueIndex]
    mov        r2,#0x14
    mul        r2,r1
    add        r0,r0,r2
    str        r0,[r5,#Scene_sceneArg]
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    push       {r5}
    FadeOut_Black
    pop        {r5}
    Scene_Next
    pop        {pc}


_nt S_Story_54_1
    push       {lr}
    bl         PlayerAnimation_GetState
    cmp        r0,#0x2
    bne        LAB_0808feac
    mov        r0,#0x1
    bl         PlayerAnimation_SetState
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808feac
    push       {r5}
    mov        r0,#0x18
    lsl        r0,r0,#0x10
    mov        r1,#0x4
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    mov        r0,#0x1
    bl         PlayerAnimation_SetState
    pop        {r5}
    push       {r5}
    FadeIn_Black
    pop        {r5}
    Scene_Next
LAB_0808feac:
    pop        {pc}


_nt S_Story_54_2
    push       {lr}
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808fece
    push       {r5}
    ldr        r0,PTR_ScenarioData_54_08090124
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
LAB_0808fece:
    pop        {pc}


_ts S_Story_54_3
    push       {lr}
    Flag_GetBase 0xB1
    beq        LAB_0808fee4
    mov        r0,#0x1e
    strb       r0,[r5,#Scene_sceneTimer]
    Scene_Next
LAB_0808fee4:
    bl         Scene_IsStartPressed
    beq        LAB_0808feee
    bl         S_Story_54_SkipIfStart
LAB_0808feee:
    pop        {pc}


_ts S_Story_54_4
    push       {lr}
    ldrb       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    tst        r0,r0
    bne        LAB_0808ff08
    mov        r0,#0x3
    bl         PlayerAnimation_SetState
    Scene_Next
LAB_0808ff08:
    bl         Scene_IsStartPressed
    beq        LAB_0808ff12
    bl         S_Story_54_SkipIfStart
LAB_0808ff12:
    pop        {pc}


_ts S_Story_54_5
    push       {lr}
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808ff3a
    push       {r5}
    mov        r0,#0x18
    bl         PlayerAnimation_SetState
    Fade_Request FT_DarkenExceptSpritesBG0, 0x8
    pop        {r5}
    Scene_Next
LAB_0808ff3a:
    bl         Scene_IsStartPressed
    beq        LAB_0808ff12
    bl         S_Story_54_SkipIfStart
    pop        {pc}


_nt S_Story_54_6
    push       {lr}
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808ff88
    push       {r5}
    LoadMain world, r0, r0
    ldr        r5,[r0,#World_playerLocation]
    bl         SpritePtr_GetFrameStatus
    pop        {r5}
    mov        r1,#0x1
    and        r1,r0
    beq        LAB_0808ff70
    push       {r0}
    bl         FUN_080900b8
    pop        {r0}
LAB_0808ff70:
    mov        r1,#0x80
    and        r1,r0
    beq        LAB_0808ff88
    push       {r5}
    Fade_Request FT_FadeOutToWhiteExceptBG0, 0x10
    pop        {r5}
    Scene_Next
LAB_0808ff88:
    pop        {pc}


_nt S_Story_54_7
    push       {lr}
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808ffb6
    push       {r0}
    bl         FUN_080900f0
    pop        {r0}
    mov        r0,#0x4
    bl         PlayerAnimation_SetState
    mov        r0,#0xdd
    bl         Sound_PlaySE
    mov        r0,#0x3c
    strb       r0,[r5,#Scene_sceneTimer]
    Scene_Next
LAB_0808ffb6:
    pop        {pc}


_ts S_Story_54_8
    push       {lr}
    ldrb       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    tst        r0,r0
    bne        LAB_0808ffd6
    push       {r5}
    ldr        r0,PTR_ScenarioData_54_08090124
    mov        r1,#0xa
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
LAB_0808ffd6:
    pop        {pc}


_ts S_Story_54_9
    push       {lr}
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808fff8
    push       {r5}
    FadeIn_White
    pop        {r5}
    Scene_Next
LAB_0808fff8:
    pop        {pc}


_nt S_Story_54_10
    push       {lr}
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0809001a
    push       {r5}
    ldr        r0,PTR_ScenarioData_54_08090124
    mov        r1,#0xb
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
LAB_0809001a:
    pop        {pc}


_ts S_Story_54_11
    push       {lr}
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0809003c
    push       {r5}
    FadeOutFast_White
    pop        {r5}
    Scene_Next
LAB_0809003c:
    bl         Scene_IsStartPressed
    beq        LAB_08090046
    bl         S_Story_54_SkipIfStart
LAB_08090046:
    pop        {pc}


_ts S_Story_54_12
    push       {lr}
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08090080
    Flag_SetBase 0xB2
    push       {r5}
    bl         PlayerAnimation_Unlock
    pop        {r5}
    push       {r5}
    ldr        r0,[r5,#Scene_sceneArg]
    mov        r1,#0x0
    bl         World_SetTransitionLocation
    bl         PowerPlant_Init
    bl         PowerPlant_ResetState
    bl         PowerPlant_RandomizeAllSolutions
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
LAB_08090080:
    pop        {pc}


_nt S_Story_54_13
    push       {lr}
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080900b6
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    push       {r5}
    mov        r0,#0x4
    bl         PlayerAnimation_SetState
    pop        {r5}
    push       {r5}
    mov        r0,#0x10
    bl         Entity_FreeAllMultiple
    pop        {r5}
    mov        r0,#0x30
    strb       r0,[r5,#Scene_state_s0]
LAB_080900b6:
    pop        {pc}


_ts FUN_080900b8
    push       {lr}
    mov        r0,#0x84
    bl         Sound_PlaySE
    LoadMain world, r0, r7
    ldr        r0,[r0,#World_playerLocation]
    ldr        r1,[r0,#PlayerLocation_pos_curr_x]
    ldr        r2,[r0,#PlayerLocation_pos_curr_y]
    ldr        r3,[r0,#PlayerLocation_pos_curr_z]
    mov        r4,#0x3
    neg        r4,r4
    lsl        r4,r4,#0x10
    add        r1,r1,r4
    add        r2,r2,r4
    mov        r4,#0x38
    lsl        r4,r4,#0x10
    add        r3,r3,r4
    push       {r5}
    mov        r0,#0x1
    mov        r4,#0xf
    bl         Effect_Alloc
    add        r0,r5,#0x0
    pop        {r5}
    str        r0,[r5,#0x14]
    pop        {pc}

    .align 2, 0



_ts FUN_080900f0
    push       {lr}
    push       {r5}
    ldr        r5,[r5,#0x14]
    bl         Effect_Free
    pop        {r5}
    pop        {pc}


_nt S_Story_54_SkipIfStart
    push       {r5}
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    push       {r5}
    FadeOutFast_White
    pop        {r5}
    mov        r0,#0x34
    strb       r0,[r5,#Scene_state_s0]
    pop        {pc}

    .align 2, 0


PTR_PTR_S_Story_54_0_0809011c:
    .word PTR_S_Story_54_0_0808fe04

PTR_MapEntranceOptions_08090120:
    .word MapEntranceOptions_0808fdd4

PTR_ScenarioData_54_08090124:
    .word ScenarioData_54
