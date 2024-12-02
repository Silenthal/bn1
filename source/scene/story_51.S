#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Scene_Story_51
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_51_0_0808f7f8
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_51_0_0808f5f0:
    .word S_Story_51_0
    .word S_Story_51_1
    .word S_Story_51_2
    .word S_Story_51_3
    .word S_Story_51_4
    .word S_Story_51_5
    .word S_Story_51_6
    .word S_Story_51_7
    .word S_Story_51_8
    .word S_Story_51_9


_ts S_Story_51_0
    push       {r5}
    bl         Flag_SetPlayerInactive
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_ScenarioData_51_0808f7fc
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_Story_51_1
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808f656
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    mov        r0,#0x0
    strb       r0,[r5,#0x1]
LAB_0808f656:
    bl         Scene_IsStartPressed
    beq        LAB_0808f660
    bl         S_Story_51_SkipIfStart
LAB_0808f660:
    pop        {pc}


_nt S_Story_51_2
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808f68c
    push       {r5}
    mov        r0,#0x10
    bl         Entity_FreeAllMultiple
    ldr        r7,PTR_NPCList_80356D8_0808f800
    bl         Map_LoadNPCList
    pop        {r5}
    bl         Flag_SetPlayerActive
    bl         PlayerAnimation_Lock
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808f68c:
    pop        {pc}


_nt S_Story_51_3
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_0808f6c0
    mov        r0,#0x64
    lsl        r0,r0,#0x10
    mov        r1,#0x50
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    mov        r0,#0x7
    bl         PlayerAnimation_SetState
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808f6c0:
    pop        {pc}


_nt S_Story_51_4
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808f6ea
    push       {r5}
    ldr        r0,PTR_ScenarioData_51_0808f7fc
    mov        r1,#0x1
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    bl         Scene_IsStartPressed
    beq        LAB_0808f6ea
    bl         S_Story_51_SkipIfStart
LAB_0808f6ea:
    pop        {pc}


_ts S_Story_51_5
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808f702
    mov        r0,#0x78
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808f702:
    bl         Scene_IsStartPressed
    beq        LAB_0808f70c
    bl         S_Story_51_SkipIfStart
LAB_0808f70c:
    pop        {pc}


_nt S_Story_51_6
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_0808f736
    mov        r0,#0x9e
    bl         Flag_SetBase
    mov        r0,#0x6
    bl         PlayerAnimation_SetState
    push       {r5}
    ldr        r0,PTR_ScenarioData_51_0808f7fc
    mov        r1,#0x4
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808f736:
    bl         Scene_IsStartPressed
    beq        LAB_0808f740
    bl         S_Story_51_SkipIfStart
LAB_0808f740:
    pop        {pc}


_nt S_Story_51_7
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808f760
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808f760:
    bl         Scene_IsStartPressed
    beq        LAB_0808f76a
    bl         S_Story_51_SkipIfStart
LAB_0808f76a:
    pop        {pc}


_ts S_Story_51_8
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808f78c
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808f78c:
    pop        {pc}


_nt S_Story_51_9
    bl         PlayerAnimation_Unlock
    bl         Flag_SetPlayerActive
    push       {r5}
    mov        r0,#0x9c
    bl         Flag_SetBase
    pop        {r5}
    mov        r0,#0x9e
    bl         Flag_ClearBase
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x2c]
    mov        r1,#0x1
    strb       r1,[r0,#0x10]
    mov        r1,#0x1
    strb       r1,[r0,#0x12]
    ldr        r1,PTR_MapEntrance_0808f804
    str        r1,[r0,#0x14]
    mov        r0,#0x0
    bl         World_ChangeMap
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}

    .align 2, 0


MapEntrance_0808f7c8:
    MapEntrance Map_SciLab_Restaurant_Hallway, d_se, f(-272, -120, 0)


_ts S_Story_51_SkipIfStart
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    push       {r5}
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x20
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    strb       r0,[r5,#0x1]
    pop        {pc}

PTR_PTR_S_Story_51_0_0808f7f8:
    .word PTR_S_Story_51_0_0808f5f0

PTR_ScenarioData_51_0808f7fc:
    .word ScenarioData_51

PTR_NPCList_80356D8_0808f800:
    .word NPCList_80356D8

PTR_MapEntrance_0808f804:
    .word MapEntrance_0808f7c8
