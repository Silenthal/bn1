#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Scene_Story_36
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_36_0_0808c594
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_36_0_0808c3f4:
    .word S_Story_36_0
    .word S_Story_36_1
    .word S_Story_36_2
    .word S_Story_36_3
    .word S_Story_36_4
    .word S_Story_36_5
    .word S_Story_36_6
    .word S_Story_36_7


_ts S_Story_36_0
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    push       {r5}
    mov        r0,#0x10
    bl         Entity_FreeAllMultiple
    ldr        r7,PTR_NPCList_804F484_0808c598
    bl         Map_LoadNPCList
    pop        {r5}
    Scene_Next
    pop        {pc}


_ts S_Story_36_1
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_0808c446
    Scene_Next
LAB_0808c446:
    pop        {pc}


_ts S_Story_36_2
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808c470
    push       {r5}
    ldr        r0,PTR_ScenarioData_36_0808c59c
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
    bl         Scene_IsStartPressed
    beq        LAB_0808c470
    bl         S_Story_36_SkipIfStart
LAB_0808c470:
    pop        {pc}


_nt S_Story_36_3
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808c48e
    Flag_SetBase 0x92
    mov        r0,#0xe6
    strh       r0,[r5,#Scene_sceneTimer]
    Scene_Next
LAB_0808c48e:
    bl         Scene_IsStartPressed
    beq        LAB_0808c498
    bl         S_Story_36_SkipIfStart
LAB_0808c498:
    pop        {pc}


_nt S_Story_36_4
    ldrh       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strh       r0,[r5,#Scene_sceneTimer]
    tst        r0,r0
    bne        LAB_0808c4c0
    push       {r5}
    ldr        r0,PTR_ScenarioData_36_0808c59c
    mov        r1,#0x3
    bl         Text_LoadDialogue
    pop        {r5}
    push       {r5}
    mov        r0,#0x1
    bl         PlayerAnimation_SetState
    pop        {r5}
    Scene_Next
LAB_0808c4c0:
    bl         Scene_IsStartPressed
    beq        LAB_0808c4ca
    bl         S_Story_36_SkipIfStart
LAB_0808c4ca:
    pop        {pc}


_ts S_Story_36_5
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808c4ea
    push       {r5}
    FadeOutFast_Black
    pop        {r5}
    Scene_Next
LAB_0808c4ea:
    bl         Scene_IsStartPressed
    beq        LAB_0808c4f4
    bl         S_Story_36_SkipIfStart
LAB_0808c4f4:
    pop        {pc}


_nt S_Story_36_6
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808c53c
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    push       {r5}
    mov        r0,#0x10
    bl         Entity_FreeAllMultiple
    ldr        r7,PTR_NPCList_804F47C_0808c5a0
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    mov        r0,#0x4
    bl         PlayerAnimation_SetState
    pop        {r5}
    push       {r5}
    FadeInFast_Black
    pop        {r5}
    Scene_Next
LAB_0808c53c:
    pop        {pc}


_nt S_Story_36_7
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808c578
    bl         PlayerAnimation_Unlock
    push       {r5}
    Flag_SetBase 0x91
    pop        {r5}
    LoadMain world, r0, r0
    mov        r1,#0x7
    lsl        r1,r1,#0x10
    str        r1,[r0,#0x48]
    mov        r1,#0x2c
    lsl        r1,r1,#0x10
    str        r1,[r0,#0x4c]
    mov        r1,#0x0
    str        r1,[r0,#0x50]
    mov        r1,#0x4
    str        r1,[r0,#0x54]
    ldr        r1,DAT_0808c5a4
    str        r1,[r0,#0x58]
    bl         Scene_UnloadAndResetStepCounter
LAB_0808c578:
    pop        {pc}


_nt S_Story_36_SkipIfStart
    push       {r5}
    FadeOut_Black
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x18
    strb       r0,[r5,#Scene_state_s0]
    pop        {pc}

    .align 2, 0


PTR_PTR_S_Story_36_0_0808c594:
    .word PTR_S_Story_36_0_0808c3f4

PTR_NPCList_804F484_0808c598:
    .word NPCList_804F484

PTR_ScenarioData_36_0808c59c:
    .word ScenarioData_36

PTR_NPCList_804F47C_0808c5a0:
    .word NPCList_804F47C

DAT_0808c5a4:
    .word 0x301
