#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


Cam_Set_0808d968:
    cam_set 30, -10, 0
    cam_end

    .align 2, 0



_ts Scene_Story_42
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_42_0_0808db50
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_42_0_0808d980:
    .word S_Story_42_0
    .word S_Story_42_1
    .word S_Story_42_2
    .word S_Story_42_3
    .word S_Story_42_4
    .word S_Story_42_5
    .word S_Story_42_6
    .word S_Story_42_7


_ts S_Story_42_0
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_Story_42_1
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_0808da0a
    ldr        r0,PTR_Cam_Set_0808db54
    bl         SceneCamera_Init
    bl         SceneCamera_Main
    mov        r7,r10
    ldr        r7,[r7,#0x24]
    mov        r0,#0x0
    strb       r0,[r7,#0x8]
    strb       r0,[r7,#0x9]
    mov        r0,#0x2
    strb       r0,[r7,#0xa]
    strb       r0,[r7,#0xb]
    push       {r5}
    mov        r0,#0x46
    lsl        r0,r0,#0x10
    mov        r1,#0x28
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    lsl        r2,r2,#0x10
    bl         PlayerAnimation_SetPosition
    mov        r0,#0x7
    bl         PlayerAnimation_SetState
    mov        r0,#0x18
    bl         Entity_FreeAllMultiple
    ldr        r0,PTR_EntityAllocParams_803AF1C_0808db58
    bl         Entity_AllocList
    mov        r0,#0x1
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808da0a:
    pop        {pc}


_ts S_Story_42_2
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808da2c
    push       {r5}
    mov        r7,#0x2
    bl         Effect_Nonstop_Bus_Create
    pop        {r5}
    mov        r0,#0x50
    strh       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808da2c:
    bl         Scene_IsStartPressed
    beq        LAB_0808da36
    bl         S_Story_42_SkipIfStart
LAB_0808da36:
    pop        {pc}


_ts S_Story_42_3
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_0808da62
    mov        r7,r10
    ldr        r7,[r7,#0x24]
    mov        r0,#0x2
    strb       r0,[r7,#0x8]
    strb       r0,[r7,#0xa]
    mov        r0,#0x0
    strb       r0,[r7,#0x9]
    strb       r0,[r7,#0xb]
    mov        r0,#0xb2
    bl         Flag_SetBase
    mov        r0,#0x82
    strh       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808da62:
    bl         Scene_IsStartPressed
    beq        LAB_0808da6c
    bl         S_Story_42_SkipIfStart
LAB_0808da6c:
    pop        {pc}


_nt S_Story_42_4
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_0808da8a
    push       {r5}
    ldr        r0,PTR_ScenarioData_42_0808db5c
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808da8a:
    bl         Scene_IsStartPressed
    beq        LAB_0808da94
    bl         S_Story_42_SkipIfStart
LAB_0808da94:
    pop        {pc}


_nt S_Story_42_5
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808dab4
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808dab4:
    bl         Scene_IsStartPressed
    beq        LAB_0808dabe
    bl         S_Story_42_SkipIfStart
LAB_0808dabe:
    pop        {pc}


_ts S_Story_42_6
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808daf2
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    push       {r5}
    mov        r0,#0x1
    mov        r1,r10
    ldr        r1,[r1,#0x8]
    ldr        r1,[r1,#0x28]
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808daf2:
    pop        {pc}


_ts S_Story_42_7
    push       {r5}
    bl         PlayerAnimation_Unlock
    pop        {r5}
    push       {r5}
    mov        r0,#0xb0
    bl         Flag_SetBase
    pop        {r5}
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x2c]
    mov        r1,#0x1
    strb       r1,[r0,#0x10]
    mov        r1,#0x1
    strb       r1,[r0,#0x12]
    ldr        r1,PTR_MapEntrance_0808db60
    str        r1,[r0,#0x14]
    mov        r0,#0x0
    bl         World_ChangeMap
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}

    .align 2, 0


MapEntrance_0808db28:
    MapEntrance Map_DenTown_Block_3, d_nw, f(70, 40, 0)


_ts S_Story_42_SkipIfStart
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x18
    strb       r0,[r5,#0x0]
    pop        {pc}

PTR_PTR_S_Story_42_0_0808db50:
    .word PTR_S_Story_42_0_0808d980

PTR_Cam_Set_0808db54:
    .word Cam_Set_0808d968

PTR_EntityAllocParams_803AF1C_0808db58:
    .word EntityAllocParams_803AF1C

PTR_ScenarioData_42_0808db5c:
    .word ScenarioData_42

PTR_MapEntrance_0808db60:
    .word MapEntrance_0808db28
