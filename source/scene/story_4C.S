#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


Cam_Set_0808ec1c:
    cam_set -126, 44, 0
    cam_end

    .align 2, 0



_ts Scene_Story_4C
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_4C_0_0808ee74
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_4C_0_0808ec34:
    .word S_Story_4C_0
    .word S_Story_4C_1
    .word S_Story_4C_2
    .word S_Story_4C_3
    .word S_Story_4C_4
    .word S_Story_4C_5
    .word S_Story_4C_6
    .word S_Story_4C_7
    .word S_Story_4C_8
    .word S_Story_4C_9
    .word S_Story_4C_10


_ts S_Story_4C_0
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    push       {r5}
    ldr        r7,PTR_NPCList_8038F48_0808ee78
    bl         Map_LoadNPCList
    pop        {r5}
    pop        {pc}


_nt S_Story_4C_1
    Flag_SetBase 0xB2
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_0808ecae
    push       {r5}
    mov        r0,#0x7
    bl         PlayerAnimation_SetState
    pop        {r5}
    ldr        r0,PTR_Cam_Set_0808ee7c
    bl         SceneCamera_Init
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808ecae:
    pop        {pc}


_ts S_Story_4C_2
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808ecd8
    push       {r5}
    ldr        r0,PTR_ScenarioData_4C_0808ee80
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    bl         Scene_IsStartPressed
    beq        LAB_0808ecd8
    bl         S_Story_4C_SkipIfStart
LAB_0808ecd8:
    pop        {pc}


_nt S_Story_4C_3
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808ecf6
    Flag_SetBase 0xBE
    mov        r0,#0x3c
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808ecf6:
    bl         Scene_IsStartPressed
    beq        LAB_0808ed00
    bl         S_Story_4C_SkipIfStart
LAB_0808ed00:
    pop        {pc}


_nt S_Story_4C_4
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_0808ed1e
    push       {r5}
    ldr        r0,PTR_ScenarioData_4C_0808ee80
    mov        r1,#0x3
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808ed1e:
    bl         Scene_IsStartPressed
    beq        LAB_0808ed28
    bl         S_Story_4C_SkipIfStart
LAB_0808ed28:
    pop        {pc}


_nt S_Story_4C_5
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808ed46
    Flag_SetBase 0xBF
    mov        r0,#0x78
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808ed46:
    bl         Scene_IsStartPressed
    beq        LAB_0808ed50
    bl         S_Story_4C_SkipIfStart
LAB_0808ed50:
    pop        {pc}


_nt S_Story_4C_6
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_0808ed6e
    push       {r5}
    ldr        r0,PTR_ScenarioData_4C_0808ee80
    mov        r1,#0xb
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808ed6e:
    bl         Scene_IsStartPressed
    beq        LAB_0808ed78
    bl         S_Story_4C_SkipIfStart
LAB_0808ed78:
    pop        {pc}


_nt S_Story_4C_7
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808eda0
    push       {r5}
    mov        r0,#0x17
    bl         PlayerAnimation_SetState
    pop        {r5}
    Flag_SetBase 0xC1
    mov        r0,#0x1e
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808eda0:
    bl         Scene_IsStartPressed
    beq        LAB_0808edaa
    bl         S_Story_4C_SkipIfStart
LAB_0808edaa:
    pop        {pc}


_ts S_Story_4C_8
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    beq        LAB_0808edc6
    mov        r0,#0x0
    mov        r1,#0x10
    neg        r1,r1
    lsl        r1,r1,#0xc
    mov        r2,#0x0
    bl         PlayerAnimation_Move
    b          LAB_0808edd8
LAB_0808edc6:
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x6
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808edd8:
    bl         Scene_IsStartPressed
    beq        LAB_0808ede2
    bl         S_Story_4C_SkipIfStart
LAB_0808ede2:
    pop        {pc}


_ts S_Story_4C_9
    Flag_GetBase 0xC1
    beq        LAB_0808edfa
    mov        r0,#0x0
    mov        r1,#0x10
    neg        r1,r1
    lsl        r1,r1,#0xc
    mov        r2,#0x0
    bl         PlayerAnimation_Move
LAB_0808edfa:
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808ee1a
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808ee1a:
    pop        {pc}


_ts S_Story_4C_10
    push       {r5}
    bl         PlayerAnimation_Unlock
    Flag_SetBase 0xC0
    pop        {r5}
    push       {r5}
    LoadMain mapChange, r0, r7
    mov        r1,#0x1
    strb       r1,[r0,#0x10]
    mov        r1,#0x1
    strb       r1,[r0,#0x12]
    ldr        r1,PTR_MapEntrance_0808ee84
    str        r1,[r0,#0x14]
    mov        r0,#0x0
    bl         World_ChangeMap
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}

    .align 2, 0


MapEntrance_0808ee4c:
    MapEntrance Map_WWW_Wily_Lab, d_nw, f(42, -42, 0)


_ts S_Story_4C_SkipIfStart
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x24
    strb       r0,[r5,#0x0]
    pop        {pc}

PTR_PTR_S_Story_4C_0_0808ee74:
    .word PTR_S_Story_4C_0_0808ec34

PTR_NPCList_8038F48_0808ee78:
    .word NPCList_8038F48

PTR_Cam_Set_0808ee7c:
    .word Cam_Set_0808ec1c

PTR_ScenarioData_4C_0808ee80:
    .word ScenarioData_4C

PTR_MapEntrance_0808ee84:
    .word MapEntrance_0808ee4c
