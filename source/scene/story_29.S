#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


MapEntranceOptions_08089784:
    MapEntrance Map_Waterworks_Comp_1, d_nw, f(36, 476, 0)
    .byte 0x8, 0x0, 0x0, 0x0

Cam_Set_08089798:
    cam_set 20, 116, 0
    cam_end

    .align 2, 0

_ts Scene_Story_29
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_29_0_08089b74
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_S_Story_29_0_080897b4:
    .word S_Story_29_0
    .word S_Story_29_1
    .word S_Story_29_2
    .word S_Story_29_3
    .word S_Story_29_4
    .word S_Story_29_5
    .word S_Story_29_6
    .word S_Story_29_7
    .word S_Story_29_8
    .word S_Story_29_9
    .word S_Story_29_10
    .word S_Story_29_11
    .word S_Story_29_12
    .word S_Story_29_13
    .word S_Story_29_4
    .word S_Story_29_15
    .word S_Story_29_16


_ts S_Story_29_0
    push       {lr}
    ldr        r0,PTR_MapEntranceOptions_08089b78
    ldrb       r1,[r5,#0x4]
    mov        r2,#0x14
    mul        r2,r1
    add        r0,r0,r2
    str        r0,[r5,#0x10]
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


_nt S_Story_29_1
    push       {lr}
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08089870
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_08089870
    push       {r5}
    mov        r0,#0x26
    lsl        r0,r0,#0x10
    mov        r1,#0x5c
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    mov        r0,#0x4
    bl         PlayerAnimation_SetState
    pop        {r5}
    ldr        r0,PTR_Cam_Set_08089b7c
    bl         SceneCamera_Init
    bl         SceneCamera_Main
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08089870:
    pop        {pc}


_nt S_Story_29_2
    push       {lr}
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08089890
    push       {r5}
    mov        r0,#0x8
    bl         Text_LoadAreaDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08089890:
    pop        {pc}


_nt S_Story_29_3
    push       {lr}
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_080898b8
    push       {r5}
    mov        r0,#0x18
    bl         PlayerAnimation_SetState
    mov        r0,#0x6
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080898b8:
    pop        {pc}


_nt S_Story_29_4
    push       {lr}
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080898fc
    push       {r5}
    LoadMain world, r0, r0
    ldr        r5,[r0,#0x28]
    bl         SpritePtr_GetFrameStatus
    pop        {r5}
    mov        r1,#0x1
    and        r1,r0
    beq        LAB_080898e4
    push       {r0}
    bl         FUN_08089b10
    pop        {r0}
LAB_080898e4:
    mov        r1,#0x80
    and        r1,r0
    beq        LAB_080898fc
    push       {r5}
    mov        r0,#0xa
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080898fc:
    pop        {pc}


_nt S_Story_29_5
    push       {lr}
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08089936
    push       {r0}
    bl         FUN_08089b48
    pop        {r0}
    mov        r0,#0x4
    bl         PlayerAnimation_SetState
    push       {r5}
    ldr        r7,PTR_NPCList_803598C_08089b80
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_ScenarioData_29_08089b84
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08089936:
    pop        {pc}


_ts S_Story_29_6
    push       {lr}
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08089958
    push       {r5}
    mov        r0,#0x1
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08089958:
    pop        {pc}


_nt S_Story_29_7
    push       {lr}
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08089984
    push       {r5}
    ldr        r0,PTR_ScenarioData_29_08089b84
    mov        r1,#0x1
    bl         Text_LoadDialogue
    pop        {r5}
    push       {r5}
    mov        r0,#0x4
    bl         Sound_ChangeSong
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08089984:
    pop        {pc}


_nt S_Story_29_8
    push       {lr}
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_080899aa
    mov        r0,#0xc0
    bl         Flag_SetBase
    mov        r0,#0x96
    strh       r0,[r5,#0x8]
    mov        r0,#0x3
    bl         PlayerAnimation_SetState
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080899aa:
    bl         Scene_IsStartPressed
    beq        LAB_080899b4
    bl         FUN_08089b56
LAB_080899b4:
    pop        {pc}


_nt S_Story_29_9
    push       {lr}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_080899d2
    push       {r5}
    ldr        r0,PTR_ScenarioData_29_08089b84
    mov        r1,#0x3
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080899d2:
    bl         Scene_IsStartPressed
    beq        LAB_080899dc
    bl         FUN_08089b56
LAB_080899dc:
    pop        {pc}


_nt S_Story_29_10
    push       {lr}
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08089a02
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x3c
    strh       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08089a02:
    bl         Scene_IsStartPressed
    beq        LAB_08089a0c
    bl         FUN_08089b56
LAB_08089a0c:
    pop        {pc}


_nt S_Story_29_11
    push       {lr}
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08089a3c
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    bne        LAB_08089a3c
    mov        r0,#0xc1
    bl         Flag_SetBase
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08089a3c:
    pop        {pc}


_nt S_Story_29_12
    push       {lr}
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08089a6e
    mov        r0,#0x4
    bl         PlayerAnimation_SetState
    push       {r5}
    ldr        r0,PTR_ScenarioData_29_08089b84
    mov        r1,#0x9
    bl         Text_LoadDialogue
    pop        {r5}
    push       {r5}
    mov        r0,#0x3
    bl         Sound_ChangeSong
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08089a6e:
    pop        {pc}


_ts S_Story_29_13
    push       {lr}
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08089a96
    push       {r5}
    mov        r0,#0x18
    bl         PlayerAnimation_SetState
    mov        r0,#0x6
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08089a96:
    pop        {pc}


_ts S_Story_29_14
    push       {lr}
    pop        {pc}


_ts S_Story_29_15
    push       {lr}
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08089ac8
    mov        r0,#0xc7
    bl         Flag_SetBase
    push       {r5}
    bl         PlayerAnimation_Unlock
    pop        {r5}
    push       {r5}
    ldr        r0,[r5,#0x10]
    mov        r1,#0x0
    bl         World_SetTransitionLocation
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
LAB_08089ac8:
    pop        {pc}


_nt S_Story_29_16
    push       {lr}
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08089b0e
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    push       {r5}
    mov        r0,#0x4
    bl         PlayerAnimation_SetState
    pop        {r5}
    push       {r5}
    mov        r0,#0x10
    bl         Entity_FreeAllMultiple
    pop        {r5}
    mov        r0,#0x1
    strb       r0,[r5,#0x8]
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x30
    strb       r0,[r5,#0x0]
LAB_08089b0e:
    pop        {pc}


_ts FUN_08089b10
    push       {lr}
    mov        r0,#0x84
    bl         Sound_PlaySongImmediate
    LoadMain world, r0, r7
    ldr        r0,[r0,#0x28]
    ldr        r1,[r0,#0x24]
    ldr        r2,[r0,#0x28]
    ldr        r3,[r0,#0x2c]
    mov        r4,#0x3
    neg        r4,r4
    lsl        r4,r4,#0x10
    add        r1,r1,r4
    add        r2,r2,r4
    mov        r4,#0x38
    lsl        r4,r4,#0x10
    add        r3,r3,r4
    push       {r5}
    mov        r0,#0x1
    mov        r4,#0xf
    bl         Effect_Alloc
    add        r0,r5,#0x0
    pop        {r5}
    str        r0,[r5,#0x14]
    pop        {pc}

    .align 2, 0



_ts FUN_08089b48
    push       {lr}
    push       {r5}
    ldr        r5,[r5,#0x14]
    bl         Effect_Free
    pop        {r5}
    pop        {pc}


_nt FUN_08089b56
    push       {r5}
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x40
    strb       r0,[r5,#0x0]
    pop        {pc}

@ TODO manual align used because ".align 2,0" doesn't work
.byte 0, 0


PTR_PTR_S_Story_29_0_08089b74:
    .word PTR_S_Story_29_0_080897b4

PTR_MapEntranceOptions_08089b78:
    .word MapEntranceOptions_08089784

PTR_Cam_Set_08089b7c:
    .word Cam_Set_08089798

PTR_NPCList_803598C_08089b80:
    .word NPCList_803598C

PTR_ScenarioData_29_08089b84:
    .word ScenarioData_29
