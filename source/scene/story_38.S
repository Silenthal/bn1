#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


Cam_Set_0808c728:
    cam_set -42, 18, 0
    cam_end

Cam_Set_0808c732:
    cam_set -60, -40, 0
    cam_end

Cam_Set_0808c73c:
    cam_set -56, 72, 0
    cam_end

    .align 2, 0



_ts Scene_Story_38
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_38_0_0808caf0
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_38_0_0808c754:
    .word S_Story_38_0
    .word S_Story_38_1
    .word S_Story_38_2
    .word S_Story_38_3
    .word S_Story_38_4
    .word S_Story_38_5
    .word S_Story_38_6
    .word S_Story_38_7
    .word S_Story_38_8
    .word S_Story_38_9
    .word S_Story_38_10
    .word S_Story_38_11
    .word S_Story_38_12
    .word S_Story_38_13


_ts S_Story_38_0
    push       {r5}
    bl         PlayerAnimation_Lock
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_Story_38_1
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808c81e
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_0808c81e
    push       {r5}
    mov        r0,#0x4a
    neg        r0,r0
    lsl        r0,r0,#0x10
    mov        r1,#0x36
    neg        r1,r1
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    lsl        r2,r2,#0x10
    bl         PlayerAnimation_SetPosition
    mov        r0,#0x1
    bl         PlayerAnimation_SetState
    pop        {r5}
    ldr        r0,PTR_Cam_Set_0808caf4
    bl         SceneCamera_Init
    bl         SceneCamera_Main
    mov        r7,r10
    ldr        r7,[r7,#0x24]
    mov        r0,#0x0
    strb       r0,[r7,#0x8]
    strb       r0,[r7,#0xa]
    mov        r0,#0x2
    strb       r0,[r7,#0x9]
    strb       r0,[r7,#0xb]
    mov        r0,#0x34
    bl         Flag_Set420
    push       {r5}
    mov        r0,#0x18
    bl         Entity_FreeAllMultiple
    ldr        r7,PTR_NPCList_8039110_0808caf8
    bl         Map_LoadNPCList
    ldr        r0,PTR_EntityAllocParams_803A3A0_0808cafc
    bl         Entity_AllocList
    mov        r0,#0x3
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808c81e:
    pop        {pc}


_ts S_Story_38_2
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808c83e
    push       {r5}
    ldr        r0,PTR_ScenarioData_38_0808cb00
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808c83e:
    bl         Scene_IsStartPressed
    beq        LAB_0808c848
    bl         S_Story_38_SkipIfStart
LAB_0808c848:
    pop        {pc}


_nt S_Story_38_3
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808c874
    push       {r5}
    ldr        r0,PTR_ScenarioData_38_0808cb00
    mov        r1,#0x2
    bl         Text_LoadDialogue
    pop        {r5}
    push       {r5}
    bl         Sound_StopAllMusic
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    mov        r0,#0x0
    strh       r0,[r5,#0x8]
LAB_0808c874:
    bl         Scene_IsStartPressed
    beq        LAB_0808c87e
    bl         S_Story_38_SkipIfStart
LAB_0808c87e:
    pop        {pc}


_ts S_Story_38_4
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    push       {r0}
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    pop        {r0}
    bne        LAB_0808c8bc
    ldr        r0,PTR_Cam_Set_0808cb04
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
    mov        r0,#0x3c
    strh       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    b          LAB_0808c8e8
LAB_0808c8bc:
    mov        r1,#0x2
    mov        r2,#0x8
    and        r0,r2
    beq        LAB_0808c8e8
    mov        r7,r10
    ldr        r7,[r7,#0x24]
    ldrb       r0,[r7,#0x8]
    add        r0,#0x2
    and        r0,r1
    strb       r0,[r7,#0x8]
    ldrb       r0,[r7,#0x9]
    add        r0,#0x2
    and        r0,r1
    strb       r0,[r7,#0x9]
    ldrb       r0,[r7,#0xa]
    add        r0,#0x2
    and        r0,r1
    strb       r0,[r7,#0xa]
    ldrb       r0,[r7,#0xb]
    add        r0,#0x2
    and        r0,r1
    strb       r0,[r7,#0xb]
LAB_0808c8e8:
    bl         Scene_IsStartPressed
    beq        LAB_0808c8f2
    bl         S_Story_38_SkipIfStart
LAB_0808c8f2:
    pop        {pc}


_ts S_Story_38_5
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_0808c916
    mov        r0,#0x3
    bl         PlayerAnimation_SetState
    ldr        r0,PTR_Cam_Set_0808cb08
    bl         SceneCamera_Init
    bl         SceneCamera_Main
    mov        r0,#0x3c
    strh       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808c916:
    bl         Scene_IsStartPressed
    beq        LAB_0808c920
    bl         S_Story_38_SkipIfStart
LAB_0808c920:
    pop        {pc}


_nt S_Story_38_6
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_0808c946
    ldr        r0,PTR_Cam_Set_0808cb0c
    bl         SceneCamera_Init
    bl         SceneCamera_Main
    push       {r5}
    ldr        r0,PTR_ScenarioData_38_0808cb00
    mov        r1,#0x3
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808c946:
    bl         Scene_IsStartPressed
    beq        LAB_0808c950
    bl         S_Story_38_SkipIfStart
LAB_0808c950:
    pop        {pc}


_nt S_Story_38_7
    mov        r0,#0xc9
    bl         Flag_GetBase
    beq        LAB_0808c96a
    push       {r5}
    mov        r0,#0x4
    bl         Sound_ChangeSong
    pop        {r5}
    mov        r0,#0xc9
    bl         Flag_ClearBase
LAB_0808c96a:
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808c990
    push       {r5}
    mov        r7,#0x0
    bl         Effect_Traffic_1_Create
    mov        r7,#0x1
    bl         Effect_Traffic_1_Create
    pop        {r5}
    mov        r0,#0x30
    strh       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808c990:
    bl         Scene_IsStartPressed
    beq        LAB_0808c99a
    bl         S_Story_38_SkipIfStart
LAB_0808c99a:
    pop        {pc}


_ts S_Story_38_8
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_0808c9bc
    push       {r5}
    ldr        r0,PTR_ScenarioData_38_0808cb00
    mov        r1,#0x5
    bl         Text_LoadDialogue
    pop        {r5}
    mov        r0,#0x99
    bl         Flag_SetBase
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808c9bc:
    bl         Scene_IsStartPressed
    beq        LAB_0808c9c6
    bl         S_Story_38_SkipIfStart
LAB_0808c9c6:
    pop        {pc}


_ts S_Story_38_9
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808c9ee
    push       {r5}
    mov        r7,#0x0
    bl         Effect_Traffic_1_Create
    mov        r7,#0x1
    bl         Effect_Traffic_1_Create
    pop        {r5}
    mov        r0,#0x30
    strh       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808c9ee:
    bl         Scene_IsStartPressed
    beq        LAB_0808c9f8
    bl         S_Story_38_SkipIfStart
LAB_0808c9f8:
    pop        {pc}


_nt S_Story_38_10
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_0808ca14
    push       {r5}
    ldr        r0,PTR_ScenarioData_38_0808cb00
    mov        r1,#0x7
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808ca14:
    bl         Scene_IsStartPressed
    beq        LAB_0808ca1e
    bl         S_Story_38_SkipIfStart
LAB_0808ca1e:
    pop        {pc}


_ts S_Story_38_11
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808ca3e
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808ca3e:
    bl         Scene_IsStartPressed
    beq        LAB_0808ca48
    bl         S_Story_38_SkipIfStart
LAB_0808ca48:
    pop        {pc}


_nt S_Story_38_12
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808ca86
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    push       {r5}
    mov        r0,#0x18
    bl         Entity_FreeAllMultiple
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
LAB_0808ca86:
    pop        {pc}


_ts S_Story_38_13
    push       {r5}
    bl         PlayerAnimation_Unlock
    mov        r0,#0x98
    bl         Flag_SetBase
    pop        {r5}
    mov        r0,#0x34
    bl         Flag_Clear420
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x2c]
    mov        r1,#0x1
    strb       r1,[r0,#0x10]
    mov        r1,#0x1
    strb       r1,[r0,#0x12]
    ldr        r1,PTR_MapEntrance_0808cb10
    str        r1,[r0,#0x14]
    mov        r0,#0x0
    bl         World_ChangeMap
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}

MapEntrance_0808cabc:
    MapEntrance Map_DenTown_Block_1, d_se, f(-74, -54, 0)


_ts S_Story_38_SkipIfStart
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    push       {r5}
    mov        r0,#0x4
    bl         Sound_ChangeSong
    pop        {r5}
    mov        r0,#0x30
    strb       r0,[r5,#0x0]
    pop        {pc}

    .align 2, 0


PTR_PTR_S_Story_38_0_0808caf0:
    .word PTR_S_Story_38_0_0808c754

PTR_Cam_Set_0808caf4:
    .word Cam_Set_0808c728

PTR_NPCList_8039110_0808caf8:
    .word NPCList_8039110

PTR_EntityAllocParams_803A3A0_0808cafc:
    .word EntityAllocParams_803A3A0

PTR_ScenarioData_38_0808cb00:
    .word ScenarioData_38

PTR_Cam_Set_0808cb04:
    .word Cam_Set_0808c732

PTR_Cam_Set_0808cb08:
    .word Cam_Set_0808c73c

PTR_Cam_Set_0808cb0c:
    .word Cam_Set_0808c728

PTR_MapEntrance_0808cb10:
    .word MapEntrance_0808cabc
