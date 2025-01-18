#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


    cam_end

    .align 2, 0


_ts Scene_Story_18
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_18_0_080873d0
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_18_0_080871b4:
    .word S_Story_18_0
    .word S_Story_18_1
    .word S_Story_18_2
    .word S_Story_18_3
    .word S_Story_18_4
    .word S_Story_18_5
    .word S_Story_18_6
    .word S_Story_18_7
    .word S_Story_18_8
    .word S_Story_18_9
    .word S_Story_18_10


_ts S_Story_18_0
    bl         PlayerAnimation_Lock
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    push       {r5}
    bl         Sound_StopAllMusic
    pop        {r5}
    pop        {pc}


_ts S_Story_18_1
    bl         PlayerAnimation_GetState
    cmp        r0,#0x2
    bne        LAB_08087218
    LoadMain world, r0, r7
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
LAB_08087218:
    pop        {pc}


_nt S_Story_18_2
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08087254
    push       {r5}
    mov        r0,#0x10
    bl         Entity_FreeAllMultiple
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_8029888_080873d4
    ldr        r0,[r5,#0x4]
    tst        r0,r0
    beq        LAB_0808723c
    ldr        r7,PTR_NPCList_8029890_080873d8
LAB_0808723c:
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08087254:
    pop        {pc}


_nt S_Story_18_3
    LoadMain world, r0, r7
    ldr        r0,[r0,#0x28]
    push       {r0,r5}
    ldr        r0,[r0,#0x28]
    ldr        r1,DAT_080873dc
    sub        r0,r1,r0
    mov        r1,#0x20
    bl         SWI_Div
    pop        {r1,r5}
    str        r0,[r5,#0x1c]
    mov        r0,#0x0
    str        r0,[r5,#0x18]
    mov        r0,#0x0
    str        r0,[r5,#0x14]
    mov        r0,#0x8e
    bl         Sound_PlaySE
    LoadMain world, r0, r7
    mov        r0,#0x25
    bl         PlayerAnimation_SetState
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]


_ts S_Story_18_SkipIfStart
    bl         Scene_IsStartPressed
    beq        LAB_08087296
    mov        r0,#0x20
    strb       r0,[r5,#0x0]
LAB_08087296:
    pop        {pc}


_ts S_Story_18_4
    bl         FUN_080873ac
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080872ba
    push       {r5}
    ldr        r0,PTR_ScenarioData_18_080873e0
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080872ba:
    b          S_Story_18_SkipIfStart


_ts S_Story_18_5
    bl         FUN_080873ac
    cmp        r0,#0x0
    bne        LAB_080872d2
    mov        r0,#0x80
    bl         Text_CheckOption
    bne        S_Story_18_SkipIfStart
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080872d2:
    pop        {pc}


_ts S_Story_18_6
    LoadMain world, r0, r7
    mov        r0,#0x26
    bl         PlayerAnimation_SetState
    mov        r0,#0x6
    str        r0,[r5,#0x14]
    push       {r5}
    ldr        r0,PTR_ScenarioData_18_080873e0
    mov        r1,#0x1
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_nt S_Story_18_7
    ldr        r0,[r5,#0x14]
    tst        r0,r0
    beq        LAB_0808730e
    sub        r0,#0x1
    str        r0,[r5,#0x14]
    tst        r0,r0
    bne        LAB_0808730e
    LoadMain world, r0, r7
    mov        r0,#0x1
    bl         PlayerAnimation_SetState
LAB_0808730e:
    mov        r0,#0x80
    bl         Text_CheckOption
    bne        S_Story_18_SkipIfStart
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_nt S_Story_18_8
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x40
    bl         Text_EnableOption
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_Story_18_9
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08087382
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    push       {r5}
    mov        r0,#0x10
    bl         Entity_FreeAllMultiple
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_80298D8_080873e4
    bl         Map_LoadNPCList
    pop        {r5}
    LoadMain world, r0, r7
    mov        r0,#0x26
    bl         PlayerAnimation_SetState
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08087382:
    pop        {pc}


_ts S_Story_18_10
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080873a8
    Flag_SetBase 0xB5
    bl         PlayerAnimation_Unlock
    push       {r5}
    mov        r0,#T_Incident_Occurrence
    bl         Sound_PlayBGM
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
LAB_080873a8:
    pop        {pc}

    .align 2, 0



_ts FUN_080873ac
    push       {lr}
    ldr        r0,[r5,#0x14]
    add        r0,#0x1
    str        r0,[r5,#0x14]
    cmp        r0,#0x18
    bge        LAB_080873ca
    ldr        r0,[r5,#0x18]
    ldr        r1,[r5,#0x1c]
    mov        r2,#0x0
    push       {r5}
    bl         PlayerAnimation_Move
    pop        {r5}
    mov        r0,#0x1
    pop        {pc}
LAB_080873ca:
    mov        r0,#0x0
    pop        {pc}

    .align 2, 0


PTR_PTR_S_Story_18_0_080873d0:
    .word PTR_S_Story_18_0_080871b4

PTR_NPCList_8029888_080873d4:
    .word NPCList_8029888

PTR_NPCList_8029890_080873d8:
    .word NPCList_8029890

DAT_080873dc:
    .word 0x400000

PTR_ScenarioData_18_080873e0:
    .word ScenarioData_18

PTR_NPCList_80298D8_080873e4:
    .word NPCList_80298D8
