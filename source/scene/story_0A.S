#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    cam_end

    .align 2, 0


_ts Scene_Story_0A
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_0A_0_08084bd4
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_S_Story_0A_0_0808499c:
    .word S_Story_0A_0
    .word S_Story_0A_1
    .word S_Story_0A_2
    .word S_Story_0A_3
    .word S_Story_0A_4
    .word S_Story_0A_5
    .word S_Story_0A_6
    .word S_Story_0A_7


_ts S_Story_0A_0
    push       {lr}
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    Scene_Next
    pop        {pc}

    .align 2, 0



_ts S_Story_0A_1
    push       {lr}
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_08084a00
    push       {r5}
    LoadMain world, r0, r0
    ldr        r0,[r0,#0x28]
    ldrb       r0,[r0,#0x14]
    mov        r1,#0x7
    and        r0,r1
    bl         PlayerAnimation_SetState
    mov        r0,#0x4
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    Scene_Next
LAB_08084a00:
    pop        {pc}

    .align 2, 0



_ts S_Story_0A_2
    push       {lr}
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08084a5a
    push       {r5}
    mov        r0,#0x5a
    neg        r0,r0
    lsl        r0,r0,#0x10
    mov        r1,#0xb
    neg        r1,r1
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    mov        r0,#0x1c
    bl         PlayerAnimation_SetState
    mov        r0,#0x18
    bl         Entity_FreeAllMultiple
    ldr        r7,PTR_NPCList_80306BC_08084bd8
    bl         Map_LoadNPCList
    ldr        r0,PTR_EntityAllocParams_8030F0C_08084bdc
    bl         Entity_AllocList
    bl         FUN_08084b94
    mov        r0,#0x3
    mov        r1,#0x8
    bl         Fade_Request
    bl         Text_DisableDialogue
    pop        {r5}
    mov        r0,#0x3c
    strh       r0,[r5,#Scene_sceneTimer]
    Scene_Next
LAB_08084a5a:
    pop        {pc}


_ts S_Story_0A_3
    push       {lr}
    ldrh       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strh       r0,[r5,#Scene_sceneTimer]
    bgt        LAB_08084a76
    push       {r5}
    Flag_SetBase 0xD6
    pop        {r5}
    Scene_Next
LAB_08084a76:
    bl         Scene_IsStartPressed
    beq        LAB_08084a80
    bl         S_Story_0A_SkipIfStart
LAB_08084a80:
    pop        {pc}

    .align 2, 0



_ts S_Story_0A_4
    push       {lr}
    push       {r5}
    Flag_GetBase 0xD7
    pop        {r5}
    beq        LAB_08084aae
    push       {r5}
    mov        r0,#0x1d
    bl         PlayerAnimation_SetState
    ldr        r0,PTR_ScenarioData_0A_08084be0
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    mov        r0,#0x1e
    strh       r0,[r5,#Scene_sceneTimer]
    Scene_Next
LAB_08084aae:
    bl         Scene_IsStartPressed
    beq        LAB_08084ab8
    bl         S_Story_0A_SkipIfStart
LAB_08084ab8:
    pop        {pc}

    .align 2, 0



_ts S_Story_0A_5
    push       {lr}
    push       {r5}
    LoadMain world, r0, r0
    ldr        r5,[r0,#0x28]
    bl         SpritePtr_GetFrameStatus
    pop        {r5}
    mov        r1,#0x80
    and        r0,r1
    beq        LAB_08084afa
    ldrh       r0,[r5,#Scene_sceneTimer]
    cmp        r0,#0x0
    ble        LAB_08084ade
    sub        r0,#0x1
    strh       r0,[r5,#Scene_sceneTimer]
    b          LAB_08084afa
LAB_08084ade:
    push       {r5}
    Flag_GetBase 0xD8
    pop        {r5}
    beq        LAB_08084afa
    push       {r5}
    mov        r0,#0x1a
    bl         PlayerAnimation_SetState
    pop        {r5}
    Scene_Next
LAB_08084afa:
    bl         Scene_IsStartPressed
    beq        LAB_08084b04
    bl         S_Story_0A_SkipIfStart
LAB_08084b04:
    pop        {pc}

    .align 2, 0



_ts S_Story_0A_6
    push       {lr}
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08084b28
    push       {r5}
    mov        r0,#0x2
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    Scene_Next
LAB_08084b28:
    bl         Scene_IsStartPressed
    beq        LAB_08084b32
    bl         S_Story_0A_SkipIfStart
LAB_08084b32:
    pop        {pc}


_ts S_Story_0A_7
    push       {lr}
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08084b80
    push       {r5}
    bl         Text_DisableDialogue
    bl         PlayerAnimation_Unlock
    Flag_SetBase 0xC6
    Flag_SetBase 0xC8
    LoadMain world, r0, r7
    mov        r1,#0x0
    strb       r1,[r0,#0x7]
    ldr        r0,[r7,#0x2c]
    mov        r1,#0x1
    strb       r1,[r0,#0x10]
    mov        r1,#0x1
    strb       r1,[r0,#0x12]
    ldr        r1,PTR_MapEntrance_08084be4
    str        r1,[r0,#0x14]
    ldr        r0,[r7,#0x8]
    mov        r1,#0x5
    strb       r1,[r0,#0x6]
    mov        r0,#0x0
    bl         World_ChangeMap
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
LAB_08084b80:
    pop        {pc}

    .align 2, 0


MapEntrance_08084b84:
    MapEntrance Map_Oven_Comp_1, d_ne, f(-299, -69, 0)


_ts FUN_08084b94
    push       {lr}
    mov        r0,#0x88
    bl         Sound_PlaySE
    push       {r5}
    mov        r0,#0xb
    mov        r1,#0x5a
    neg        r1,r1
    lsl        r1,r1,#0x10
    mov        r2,#0xb
    neg        r2,r2
    lsl        r2,r2,#0x10
    mov        r3,#0x0
    mov        r4,#0x0
    bl         Effect_Alloc
    pop        {r5}
    pop        {pc}


_ts S_Story_0A_SkipIfStart
    push       {lr}
    push       {r5}
    mov        r0,#0x40
    bl         Text_EnableOption
    mov        r0,#0x2
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x1c
    strb       r0,[r5,#Scene_state_s0]
    pop        {pc}

    .align 2, 0


PTR_PTR_S_Story_0A_0_08084bd4:
    .word PTR_S_Story_0A_0_0808499c

PTR_NPCList_80306BC_08084bd8:
    .word NPCList_80306BC

PTR_EntityAllocParams_8030F0C_08084bdc:
    .word EntityAllocParams_8030F0C

PTR_ScenarioData_0A_08084be0:
    .word ScenarioData_0A

PTR_MapEntrance_08084be4:
    .word MapEntrance_08084b84
