#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set SWI_Div, 0x809DF54+1


Cam_Set_08089c28:
    cam_set -394, 254, 0
    cam_end

    .align 2, 0



_ts Scene_Story_2B
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_2B_0_08089f90
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_2B_0_08089c40:
    .word S_Story_2B_0
    .word S_Story_2B_1
    .word S_Story_2B_2
    .word S_Story_2B_3
    .word S_Story_2B_4
    .word S_Story_2B_5
    .word S_Story_2B_6
    .word S_Story_2B_7
    .word S_Story_2B_8
    .word S_Story_2B_9
    .word S_Story_2B_10
    .word S_Story_2B_11
    .word S_Story_2B_12
    .word S_Story_2B_13


_ts S_Story_2B_0
    push       {r5}
    mov        r0,#0x4
    bl         Sound_ChangeSong
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


_nt S_Story_2B_1
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_08089ce6
    push       {r5}
    mov        r0,#0x31
    bl         PlayerAnimation_SetState
    pop        {r5}
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08089ce6
    push       {r5}
    ldr        r0,INT_08089f94
    neg        r0,r0
    lsl        r0,r0,#0x10
    ldr        r1,INT_08089f98
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    mov        r0,#0x31
    bl         PlayerAnimation_SetState
    pop        {r5}
    ldr        r0,PTR_Cam_Set_08089f9c
    bl         SceneCamera_Init
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08089ce6:
    pop        {pc}


_ts S_Story_2B_2
    bl         SceneCamera_Main
    cmp        r0,#0x1
    beq        LAB_08089d02
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08089d02:
    pop        {pc}


_ts S_Story_2B_3
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08089d2c
    push       {r5}
    ldr        r0,PTR_ScenarioData_2B_08089fa0
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    bl         Scene_IsStartPressed
    beq        LAB_08089d2c
    bl         S_Story_2B_SkipIfStart
LAB_08089d2c:
    pop        {pc}


_nt S_Story_2B_4
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08089d4a
    mov        r0,#0xb5
    bl         Flag_SetBase
    mov        r0,#0x6
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08089d4a:
    bl         Scene_IsStartPressed
    beq        LAB_08089d54
    bl         S_Story_2B_SkipIfStart
LAB_08089d54:
    pop        {pc}


_nt S_Story_2B_5
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    bne        LAB_08089d9e
    mov        r7,r10
    ldr        r2,[r7,#0x8]
    ldr        r2,[r2,#0x28]
    push       {r2,r5}
    ldr        r0,[r2,#0x24]
    ldr        r1,INT_08089fa4
    sub        r0,r1,r0
    mov        r1,#0x20
    bl         SWI_Div
    pop        {r2,r5}
    mov        r0,#0x0
    str        r0,[r5,#0x18]
    push       {r5}
    ldr        r0,[r2,#0x28]
    ldr        r1,DAT_08089fa8
    sub        r0,r1,r0
    mov        r1,#0x4
    bl         SWI_Div
    pop        {r5}
    str        r0,[r5,#0x1c]
    mov        r0,#0x0
    str        r0,[r5,#0x14]
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    mov        r0,#0x38
    bl         PlayerAnimation_SetState
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08089d9e:
    bl         Scene_IsStartPressed
    beq        LAB_08089da8
    bl         S_Story_2B_SkipIfStart
LAB_08089da8:
    pop        {pc}


_nt S_Story_2B_6
    bl         FUN_08089f6c
    tst        r0,r0
    bne        LAB_08089dcc
    mov        r0,#0x75
    bl         Sound_PlaySongImmediate
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    mov        r0,#0x39
    bl         PlayerAnimation_SetState
    mov        r0,#0x6
    str        r0,[r5,#0x14]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08089dcc:
    bl         Scene_IsStartPressed
    beq        LAB_08089dd6
    bl         S_Story_2B_SkipIfStart
LAB_08089dd6:
    pop        {pc}


_ts S_Story_2B_7
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    mov        r0,#0x3a
    bl         PlayerAnimation_SetState
    mov        r0,#0x1e
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    bl         Scene_IsStartPressed
    beq        LAB_08089df6
    bl         S_Story_2B_SkipIfStart
LAB_08089df6:
    pop        {pc}


_ts S_Story_2B_8
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    bne        LAB_08089e12
    push       {r5}
    ldr        r0,PTR_ScenarioData_2B_08089fa0
    mov        r1,#0x3
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08089e12:
    bl         Scene_IsStartPressed
    beq        LAB_08089e1c
    bl         S_Story_2B_SkipIfStart
LAB_08089e1c:
    pop        {pc}


_nt S_Story_2B_9
    mov        r0,#0x80
    bl         Text_CheckOption
    bne        LAB_08089e46
    mov        r0,#0xb6
    bl         Flag_SetBase
    mov        r0,#0x7c
    bl         Sound_PlaySongImmediate
    push       {r5}
    mov        r0,#0x4
    bl         Sound_StopSong
    pop        {r5}
    mov        r0,#0x28
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08089e46:
    bl         Scene_IsStartPressed
    beq        LAB_08089e50
    bl         S_Story_2B_SkipIfStart
LAB_08089e50:
    pop        {pc}


_nt S_Story_2B_10
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    bne        LAB_08089e6c
    push       {r5}
    ldr        r0,PTR_ScenarioData_2B_08089fa0
    mov        r1,#0x10
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08089e6c:
    bl         Scene_IsStartPressed
    beq        LAB_08089e76
    bl         S_Story_2B_SkipIfStart
LAB_08089e76:
    pop        {pc}


_ts S_Story_2B_11
    mov        r0,#0xf8
    bl         Flag_GetBase
    beq        LAB_08089e90
    push       {r5}
    mov        r0,#0xa
    bl         Sound_ChangeSong
    pop        {r5}
    mov        r0,#0xf8
    bl         Flag_ClearBase
LAB_08089e90:
    mov        r0,#0x80
    bl         Text_CheckOption
    bne        LAB_08089eaa
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08089eaa:
    bl         Scene_IsStartPressed
    beq        LAB_08089eb4
    bl         S_Story_2B_SkipIfStart
LAB_08089eb4:
    pop        {pc}


_nt S_Story_2B_12
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08089f14
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    push       {r5}
    ldr        r0,INT_08089f94
    neg        r0,r0
    lsl        r0,r0,#0x10
    ldr        r1,INT_08089f98
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    mov        r0,#0x7
    bl         PlayerAnimation_SetState
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
    push       {r5}
    mov        r0,#0x10
    bl         Entity_FreeAllMultiple
    pop        {r5}
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
LAB_08089f14:
    pop        {pc}


_nt S_Story_2B_13
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08089f4e
    push       {r5}
    bl         Text_DisableDialogue
    mov        r0,#0x10
    bl         Entity_FreeAllMultiple
    ldr        r7,PTR_NPCList_8046CC8_08089fac
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0xb4
    bl         Flag_SetBase
    bl         PlayerAnimation_Unlock
    push       {r5}
    mov        r0,#0xa
    bl         Sound_ChangeSong
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
LAB_08089f4e:
    pop        {pc}


_ts S_Story_2B_SkipIfStart
    push       {r5}
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x30
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts FUN_08089f6c
    push       {lr}
    ldr        r0,[r5,#0x14]
    add        r0,#0x1
    str        r0,[r5,#0x14]
    cmp        r0,#0x5
    bge        LAB_08089f8a
    ldr        r0,[r5,#0x18]
    ldr        r1,[r5,#0x1c]
    mov        r2,#0x0
    push       {r5}
    bl         PlayerAnimation_Move
    pop        {r5}
    mov        r0,#0x1
    pop        {pc}
LAB_08089f8a:
    mov        r0,#0x0
    pop        {pc}

    .align 2, 0


PTR_PTR_S_Story_2B_0_08089f90:
    .word PTR_S_Story_2B_0_08089c40

INT_08089f94:
    .word 0x176

INT_08089f98:
    .word 0x104

PTR_Cam_Set_08089f9c:
    .word Cam_Set_08089c28

PTR_ScenarioData_2B_08089fa0:
    .word ScenarioData_2B

INT_08089fa4:
    .word 0xFECA0000

DAT_08089fa8:
    .word 0x1220000

PTR_NPCList_8046CC8_08089fac:
    .word NPCList_8046CC8
