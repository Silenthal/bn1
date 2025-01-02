#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


Cam_Set_0808a924:
    cam_set 312, -134, 0
    cam_end

    .align 2, 0



_ts Scene_Story_30
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_30_0_0808abdc
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_30_0_0808a93c:
    .word S_Story_30_0
    .word S_Story_30_1
    .word S_Story_30_2
    .word S_Story_30_3
    .word S_Story_30_4
    .word S_Story_30_5
    .word S_Story_30_6
    .word S_Story_30_7
    .word S_Story_30_8
    .word S_Story_30_9
    .word S_Story_30_10
    .word S_Story_30_11


_ts S_Story_30_0
    push       {r5}
    bl         Sound_StopAllMusic
    pop        {r5}
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_Story_30_1
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_0808a9cc
    push       {r5}
    LoadMain world, r7, r7
    ldr        r7,[r7,#0x28]
    ldrb       r0,[r7,#0x10]
    mov        r2,#0x7
    and        r0,r2
    mov        r2,#0x0
    add        r0,r0,r2
    bl         PlayerAnimation_SetState
    pop        {r5}
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808a9cc
    ldr        r0,PTR_Cam_Set_0808abe0
    bl         SceneCamera_Init
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808a9cc:
    pop        {pc}


_nt S_Story_30_2
    bl         SceneCamera_Main
    cmp        r0,#0x1
    beq        LAB_0808a9fe
    push       {r5}
    ldr        r0,DAT_0808abe4
    lsl        r0,r0,#0x10
    mov        r1,#0x86
    neg        r1,r1
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    mov        r0,#0x5
    bl         PlayerAnimation_SetState
    mov        r0,#0x3
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808a9fe:
    pop        {pc}


_ts S_Story_30_3
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808aa28
    push       {r5}
    ldr        r0,PTR_ScenarioData_30_0808abe8
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    bl         Scene_IsStartPressed
    beq        LAB_0808aa28
    bl         S_Story_30_SkipIfStart
LAB_0808aa28:
    pop        {pc}


_nt S_Story_30_4
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808aa6e
    push       {r5}
    ldr        r7,PTR_NPCList_802FEF4_0808abec
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x1e
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    bl         Scene_IsStartPressed
    beq        LAB_0808aa54
    bl         S_Story_30_SkipIfStart
LAB_0808aa54:
    pop        {pc}


_nt S_Story_30_5
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    bne        LAB_0808aa6e
    mov        r0,#0x1
    bl         PlayerAnimation_SetState
    mov        r0,#0x3c
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808aa6e:
    bl         Scene_IsStartPressed
    beq        LAB_0808aa78
    bl         S_Story_30_SkipIfStart
LAB_0808aa78:
    pop        {pc}


_nt S_Story_30_6
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    bne        LAB_0808aa94
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808aa94:
    bl         Scene_IsStartPressed
    beq        LAB_0808aa9e
    bl         S_Story_30_SkipIfStart
LAB_0808aa9e:
    pop        {pc}


_ts S_Story_30_7
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808aac4
    Flag_SetBase 0xB2
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808aac4:
    pop        {pc}


_nt S_Story_30_8
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808aaee
    push       {r5}
    ldr        r0,PTR_ScenarioData_30_0808abe8
    mov        r1,#0x1
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    bl         Scene_IsStartPressed
    beq        LAB_0808aaee
    bl         S_Story_30_SkipIfStart
LAB_0808aaee:
    pop        {pc}


_ts S_Story_30_9
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808ab0e
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808ab0e:
    bl         Scene_IsStartPressed
    beq        LAB_0808ab18
    bl         S_Story_30_SkipIfStart
LAB_0808ab18:
    pop        {pc}


_nt S_Story_30_10
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808ab72
    push       {r5}
    mov        r0,#0x10
    bl         Entity_FreeAllMultiple
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_802FF2C_0808abf0
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x1
    bl         PlayerAnimation_SetState
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    push       {r5}
    mov        r0,#0x1
    LoadMain world, r1, r1
    ldr        r1,[r1,#0x28]
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808ab72:
    pop        {pc}


_ts S_Story_30_11
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808abbe
    push       {r5}
    bl         Text_DisableDialogue
    Flag_SetBase 0xB1
    pop        {r5}
    mov        r0,#0x5
    mov        r1,#0x1
    bl         KeyItem_AddAmount
    mov        r0,#0x6
    mov        r1,#0x1
    bl         KeyItem_AddAmount
    Flag_ClearIgnore F_IGNORE_WALL_00
    bl         PlayerAnimation_Unlock
    push       {r5}
    mov        r0,#0x4
    bl         Sound_ChangeSong
    pop        {r5}
    LoadMain world, r0, r0
    mov        r1,#0x27
    strb       r1,[r0,#0x6]
    bl         Scene_UnloadAndResetStepCounter
LAB_0808abbe:
    pop        {pc}


_ts S_Story_30_SkipIfStart
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    push       {r5}
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x28
    strb       r0,[r5,#0x0]
    pop        {pc}

PTR_PTR_S_Story_30_0_0808abdc:
    .word PTR_S_Story_30_0_0808a93c

PTR_Cam_Set_0808abe0:
    .word Cam_Set_0808a924

DAT_0808abe4:
    .word 0x138

PTR_ScenarioData_30_0808abe8:
    .word ScenarioData_30

PTR_NPCList_802FEF4_0808abec:
    .word NPCList_802FEF4

PTR_NPCList_802FF2C_0808abf0:
    .word NPCList_802FF2C
