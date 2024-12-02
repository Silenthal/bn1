#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


Cam_Set_0808fa04:
    cam_set -142, 138, 0
    cam_end

Cam_Set_0808fa0e:
    cam_set -142, 138, 0
    cam_move 0, 0, 128, 380
    cam_end

    .align 2, 0



_ts Scene_Story_53
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_53_0_0808fdac
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_53_0_0808fa30:
    .word S_Story_53_0
    .word S_Story_53_1
    .word S_Story_53_2
    .word S_Story_53_3
    .word S_Story_53_4
    .word S_Story_53_5
    .word S_Story_53_6
    .word S_Story_53_7
    .word S_Story_53_8
    .word S_Story_53_9
    .word S_Story_53_10
    .word S_Story_53_11
    .word S_Story_53_12
    .word S_Story_53_13
    .word S_Story_53_14
    .word S_Story_53_15


_ts S_Story_53_0
    push       {r5}
    bl         Sound_StopAllMusic
    pop        {r5}
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_Story_53_1
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808fae4
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_0808fae4
    mov        r0,#0x8e
    neg        r0,r0
    lsl        r0,r0,#0x10
    mov        r1,#0x8a
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    bl         DisableBoundaryCheck
    mov        r0,#0x0
    bl         PlayerAnimation_SetState
    push       {r5}
    bl         Effect_CountZap_Create
    pop        {r5}
    ldr        r0,PTR_Cam_Set_0808fdb0
    bl         SceneCamera_Init
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    bl         Scene_IsStartPressed
    beq        LAB_0808fae4
    bl         S_Story_53_SkipIfStart
LAB_0808fae4:
    pop        {pc}


_nt S_Story_53_2
    bl         SceneCamera_Main
    cmp        r0,#0x1
    beq        LAB_0808fb00
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808fb00:
    pop        {pc}


_nt S_Story_53_3
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808fb00
    ldr        r0,PTR_Cam_Set_0808fdb4
    bl         SceneCamera_Init
    push       {r5}
    ldr        r0,PTR_ScenarioData_53_0808fdb8
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_Story_53_4
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808fb3a
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808fb3a:
    bl         Scene_IsStartPressed
    beq        LAB_0808fb44
    bl         S_Story_53_SkipIfStart
LAB_0808fb44:
    pop        {pc}


_nt S_Story_53_5
    bl         SceneCamera_Main
    cmp        r0,#0x1
    beq        LAB_0808fb60
    push       {r5}
    ldr        r0,PTR_ScenarioData_53_0808fdb8
    mov        r1,#0x1
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808fb60:
    bl         Scene_IsStartPressed
    beq        LAB_0808fb6a
    bl         S_Story_53_SkipIfStart
LAB_0808fb6a:
    pop        {pc}


_ts S_Story_53_6
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808fb84
    mov        r0,#0xae
    bl         Flag_SetBase
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808fb84:
    bl         Scene_IsStartPressed
    beq        LAB_0808fb8e
    bl         S_Story_53_SkipIfStart
LAB_0808fb8e:
    pop        {pc}


_ts S_Story_53_7
    push       {r5}
    ldr        r0,PTR_BgTask_803BA5C_0808fdbc
    bl         BgTask_AddNew
    push       {r5}
    mov        r0,#0xc0
    bl         Sound_PlaySongImmediate
    mov        r0,#0x4
    bl         Sound_ChangeSong
    pop        {r5}
    pop        {r5}
    push       {r5}
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldr        r7,[r7,#0x28]
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x2
    eor        r0,r1
    strb       r0,[r7,#0x0]
    mov        r0,#0x4
    bl         PlayerAnimation_SetState
    pop        {r5}
    push       {r5}
    mov        r0,#0x10
    bl         Entity_FreeAllMultiple
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    bl         Scene_IsStartPressed
    beq        LAB_0808fbdc
    bl         S_Story_53_SkipIfStart
LAB_0808fbdc:
    pop        {pc}


_nt S_Story_53_8
    push       {r5}
    ldr        r0,PTR_ScenarioData_53_0808fdb8
    mov        r1,#0x2
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_nt S_Story_53_9
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808fc0e
    mov        r0,#0xac
    bl         Flag_SetBase
    mov        r0,#0xc8
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808fc0e:
    bl         Scene_IsStartPressed
    beq        LAB_0808fc18
    bl         S_Story_53_SkipIfStart
LAB_0808fc18:
    pop        {pc}


_nt S_Story_53_10
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_0808fc36
    push       {r5}
    ldr        r0,PTR_ScenarioData_53_0808fdb8
    mov        r1,#0x4
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808fc36:
    bl         Scene_IsStartPressed
    beq        LAB_0808fc40
    bl         S_Story_53_SkipIfStart
LAB_0808fc40:
    pop        {pc}


_nt S_Story_53_11
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808fc5e
    ldr        r0,PTR_Cam_Set_0808fdc0
    bl         SceneCamera_Init
    mov        r0,#0x5a
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808fc5e:
    bl         Scene_IsStartPressed
    beq        LAB_0808fc68
    bl         S_Story_53_SkipIfStart
LAB_0808fc68:
    pop        {pc}


_nt S_Story_53_12
    bl         SceneCamera_Main
    cmp        r0,#0x1
    beq        LAB_0808fcb6
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_0808fcb6
    push       {r5}
    ldr        r0,PTR_BgTask_803BA44_0808fdc4
    bl         BgTask_AddNew
    mov        r0,#0x18
    bl         Entity_FreeAllMultiple
    ldr        r7,PTR_NPCList_803D398_0808fdc8
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldr        r7,[r7,#0x28]
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r7,#0x0]
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_ScenarioData_53_0808fdb8
    mov        r1,#0x7
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808fcb6:
    bl         Scene_IsStartPressed
    beq        LAB_0808fcc0
    bl         S_Story_53_SkipIfStart
LAB_0808fcc0:
    pop        {pc}


_nt S_Story_53_13
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808fce0
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808fce0:
    bl         Scene_IsStartPressed
    beq        LAB_0808fcea
    bl         S_Story_53_SkipIfStart
LAB_0808fcea:
    pop        {pc}


_ts S_Story_53_14
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808fd24
    push       {r5}
    mov        r0,#0x10
    bl         Entity_FreeAllMultiple
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    mov        r1,#0x0
    str        r1,[r0,#0x34]
    ldr        r7,PTR_NPCList_803D398_0808fdcc
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808fd24:
    pop        {pc}


_nt S_Story_53_15
    bl         EnableBoundaryCheck
    bl         PlayerAnimation_Unlock
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    mov        r1,#0x41
    strb       r1,[r0,#0x6]
    push       {r5}
    mov        r0,#0xab
    bl         Flag_SetBase
    pop        {r5}
    push       {r5}
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldr        r7,[r7,#0x28]
    mov        r0,#0x4
    strb       r0,[r7,#0x10]
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r7,#0x0]
    pop        {r5}
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x2c]
    mov        r1,#0x1
    strb       r1,[r0,#0x10]
    mov        r1,#0x1
    strb       r1,[r0,#0x12]
    ldr        r1,PTR_MapEntrance_0808fdd0
    str        r1,[r0,#0x14]
    mov        r0,#0x0
    bl         World_ChangeMap
    pop        {r5}
    push       {r5}
    mov        r0,#0x4
    bl         Sound_ChangeSong
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}

MapEntrance_0808fd80:
    MapEntrance Map_SciLab_Restaurant, d_s, f(-142, 138, 0)


_ts S_Story_53_SkipIfStart
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    push       {r5}
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x38
    strb       r0,[r5,#0x0]
    pop        {pc}

PTR_PTR_S_Story_53_0_0808fdac:
    .word PTR_S_Story_53_0_0808fa30

PTR_Cam_Set_0808fdb0:
    .word Cam_Set_0808fa04

PTR_Cam_Set_0808fdb4:
    .word Cam_Set_0808fa0e

PTR_ScenarioData_53_0808fdb8:
    .word ScenarioData_53

PTR_BgTask_803BA5C_0808fdbc:
    .word BgTask_803BA5C

PTR_Cam_Set_0808fdc0:
    .word Cam_Set_0808fa04

PTR_BgTask_803BA44_0808fdc4:
    .word BgTask_803BA44

PTR_NPCList_803D398_0808fdc8:
    .word NPCList_803D398

PTR_NPCList_803D398_0808fdcc:
    .word NPCList_803D398

PTR_MapEntrance_0808fdd0:
    .word MapEntrance_0808fd80
