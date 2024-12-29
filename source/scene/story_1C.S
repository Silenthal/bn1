#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


Cam_Set_080879d0:
    cam_set -26, 40, 0
    cam_move -128, -128, 0, 208
Cam_Set_080879e2:
    cam_wait 60
    cam_end
    .byte 0x0F
    .byte 0x00
    .byte 0xF8
    .byte 0x20
    .byte 0x07
    .byte 0x00
    .byte 0x00
    .byte 0x04
    .byte -1

    .align 2, 0



_ts Scene_Story_1C
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_1C_0_08087c00
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_1C_0_08087a00:
    .word S_Story_1C_0
    .word S_Story_1C_1
    .word S_Story_1C_2
    .word S_Story_1C_3
    .word S_Story_1C_4
    .word S_Story_1C_5
    .word S_Story_1C_6
    .word S_Story_1C_7


_ts S_Story_1C_0
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_8029A38_08087c04
    bl         Map_LoadNPCList
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_nt S_Story_1C_1
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_08087a82
    push       {r5}
    mov        r0,#0x9c
    neg        r0,r0
    lsl        r0,r0,#0x10
    mov        r1,#0x26
    neg        r1,r1
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    bl         DisableBoundaryCheck
    mov        r0,#0x7
    bl         PlayerAnimation_SetState
    pop        {r5}
    ldr        r0,PTR_Cam_Set_08087c08
    bl         SceneCamera_Init
    bl         SceneCamera_Main
    push       {r5}
    mov        r0,#0x1
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08087a82:
    pop        {pc}


_ts S_Story_1C_2
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08087aae
    bl         SceneCamera_Main
    cmp        r0,#0x1
    beq        LAB_08087aae
    ldr        r7,PTR_Cam_Set_080879e2_08087c0c
    str        r7,[r5,#0x18]
    mov        r0,#0x0
    str        r0,[r5,#0x10]
    mov        r0,#0xff
    str        r0,[r5,#0x14]
    mov        r0,#0x1
    str        r0,[r5,#0x1c]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08087aae:
    bl         Scene_IsStartPressed
    beq        LAB_08087ab8
    bl         S_Story_1C_SkipIfStart
LAB_08087ab8:
    pop        {pc}


_nt S_Story_1C_3
    bl         FUN_08087ba8
    tst        r0,r0
    bne        LAB_08087ada
    push       {r5}
    ldr        r0,PTR_ScenarioData_1C_08087c10
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    mov        r0,#0x14
    bl         Sound_ChangeSong
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08087ada:
    bl         Scene_IsStartPressed
    beq        LAB_08087ae4
    bl         S_Story_1C_SkipIfStart
LAB_08087ae4:
    pop        {pc}


_nt S_Story_1C_4
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08087b06
    push       {r5}
    mov        r0,#0x1a
    bl         PlayerAnimation_SetState
    pop        {r5}
    mov        r0,#0x24
    str        r0,[r5,#0x10]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08087b06:
    bl         Scene_IsStartPressed
    beq        LAB_08087b10
    bl         S_Story_1C_SkipIfStart
LAB_08087b10:
    pop        {pc}


_nt S_Story_1C_5
    ldr        r0,[r5,#0x10]
    sub        r0,#0x1
    str        r0,[r5,#0x10]
    bne        LAB_08087b2c
    push       {r5}
    ldr        r0,PTR_ScenarioData_1C_08087c10
    mov        r1,#0x3
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08087b2c:
    bl         Scene_IsStartPressed
    beq        LAB_08087b36
    bl         S_Story_1C_SkipIfStart
LAB_08087b36:
    pop        {pc}


_ts S_Story_1C_6
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08087b56
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08087b56:
    bl         Scene_IsStartPressed
    beq        LAB_08087b60
    bl         S_Story_1C_SkipIfStart
LAB_08087b60:
    pop        {pc}


_nt S_Story_1C_7
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08087b8e
    push       {r5}
    bl         Text_DisableDialogue
    bl         EnableBoundaryCheck
    bl         PlayerAnimation_Unlock
    mov        r0,#0xc7
    bl         Flag_SetBase
    mov        r0,#0x35
    bl         Flag_ClearBase
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
LAB_08087b8e:
    pop        {pc}


_ts S_Story_1C_SkipIfStart
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x1c
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts FUN_08087ba8
    push       {lr}
    ldr        r0,[r5,#0x1c]
    tst        r0,r0
    beq        LAB_08087bfc
    ldr        r7,[r5,#0x18]
    ldr        r0,[r5,#0x10]
    cmp        r0,#0x0
    bgt        LAB_08087bd8
    ldrb       r0,[r7,#0x4]
    cmp        r0,#0xff
    bne        LAB_08087bc4
    mov        r1,#0x2
    str        r1,[r5,#0x1c]
    sub        r7,#0x4
LAB_08087bc4:
    add        r7,#0x4
    str        r7,[r5,#0x18]
    ldr        r1,[r5,#0x14]
    cmp        r0,r1
    beq        LAB_08087bd6
    push       {r5,r7}
    bl         PlayerAnimation_SetState
    pop        {r5,r7}
LAB_08087bd6:
    ldrb       r0,[r7,#0x3]
LAB_08087bd8:
    sub        r0,#0x1
    str        r0,[r5,#0x10]
    mov        r3,#0x1
    ldrsb      r0,[r7,r3]
    lsl        r0,r0,#0xc
    mov        r3,#0x2
    ldrsb      r1,[r7,r3]
    lsl        r1,r1,#0xc
    mov        r2,#0x0
    push       {r5}
    bl         PlayerAnimation_Move
    pop        {r5}
    ldr        r0,[r5,#0x1c]
    cmp        r0,#0x2
    beq        LAB_08087bfc
    mov        r0,#0x1
    pop        {pc}
LAB_08087bfc:
    mov        r0,#0x0
    pop        {pc}

PTR_PTR_S_Story_1C_0_08087c00:
    .word PTR_S_Story_1C_0_08087a00

PTR_NPCList_8029A38_08087c04:
    .word NPCList_8029A38

PTR_Cam_Set_08087c08:
    .word Cam_Set_080879d0

PTR_Cam_Set_080879e2_08087c0c:
    .word Cam_Set_080879e2 + 2

PTR_ScenarioData_1C_08087c10:
    .word ScenarioData_1C
