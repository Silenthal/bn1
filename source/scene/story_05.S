#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    cam_end

    .align 2, 0


_ts Scene_Story_05
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_05_0_080839a0
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_S_Story_05_0_0808388c:
    .word S_Story_05_0
    .word S_Story_05_1
    .word S_Story_05_2
    .word S_Story_05_3
    .word S_Story_05_4
    .word S_Story_05_5


_ts S_Story_05_0
    push       {lr}
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    Scene_Next
    pop        {pc}

    .align 2, 0



_ts S_Story_05_1
    push       {lr}
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_080838e8
    push       {r5}
    LoadMain world, r0, r0
    ldr        r0,[r0,#World_playerLocation]
    ldrb       r0,[r0,#PlayerLocation_currDirMoveIndex]
    mov        r1,#0x7
    and        r0,r1
    bl         PlayerAnimation_SetState
    FadeOutFast_Black
    pop        {r5}
    Scene_Next
LAB_080838e8:
    pop        {pc}

    .align 2, 0



_ts S_Story_05_2
    push       {lr}
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08083926
    push       {r5}
    Flag_SetBase 0xD4
    mov        r0,#0x1a
    lsl        r0,r0,#0x10
    mov        r1,#0x1f
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    mov        r0,#0x0
    bl         PlayerAnimation_SetState
    FadeIn_Black
    pop        {r5}
    Scene_Next
LAB_08083926:
    pop        {pc}


_ts S_Story_05_3
    push       {lr}
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08083948
    push       {r5}
    ldr        r0,PTR_ScenarioData_05_080839a4
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
LAB_08083948:
    pop        {pc}

    .align 2, 0



_ts S_Story_05_4
    push       {lr}
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08083960
    Scene_Next
LAB_08083960:
    bl         Scene_IsStartPressed
    beq        LAB_0808396a
    bl         S_Story_05_SkipIfStart
LAB_0808396a:
    pop        {pc}


_ts S_Story_05_5
    push       {lr}
    push       {r5}
    bl         Text_DisableDialogue
    bl         PlayerAnimation_Unlock
    Flag_ClearBase 0xD4
    Flag_SetBase 0x98
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}


_ts S_Story_05_SkipIfStart
    push       {lr}
    push       {r5}
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x14
    strb       r0,[r5,#Scene_state_s0]
    pop        {pc}

    .align 2, 0


PTR_PTR_S_Story_05_0_080839a0:
    .word PTR_S_Story_05_0_0808388c

PTR_ScenarioData_05_080839a4:
    .word ScenarioData_05
