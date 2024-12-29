#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Scene_Story_5D
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_5D_0_0809103c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_5D_0_08090dc8:
    .word S_Story_5D_0
    .word S_Story_5D_1
    .word S_Story_5D_2
    .word S_Story_5D_3
    .word S_Story_5D_4
    .word S_Story_5D_5
    .word S_Story_5D_6
    .word S_Story_5D_7
    .word S_Story_5D_8
    .word S_Story_5D_9
    .word S_Story_5D_10


_ts S_Story_5D_0
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


_ts S_Story_5D_1
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08090e54
    bl         PlayerAnimation_GetState
    cmp        r0,#0x2
    bne        LAB_08090e54
    push       {r5}
    mov        r0,#0x6
    lsl        r0,r0,#0x10
    mov        r1,#0x7e
    neg        r1,r1
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    bl         DisableBoundaryCheck
    mov        r0,#0x7
    bl         PlayerAnimation_SetState
    pop        {r5}
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08090e54:
    pop        {pc}


_nt S_Story_5D_2
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08090e74
    push       {r5}
    ldr        r0,PTR_ScenarioData_5D_08091040
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08090e74:
    pop        {pc}


_nt S_Story_5D_3
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08090e96
    mov        r0,#0x28
    bl         PlayerAnimation_SetState
    mov        r0,#0x2
    strb       r0,[r5,#0x8]
    mov        r0,#0x1
    strb       r0,[r5,#0xa]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08090e96:
    bl         Scene_IsStartPressed
    beq        LAB_08090ea0
    bl         S_Story_5D_SkipIfStart
LAB_08090ea0:
    pop        {pc}


_nt S_Story_5D_4
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_08090ec8
    mov        r0,#0x2a
    bl         PlayerAnimation_SetState
    push       {r5}
    ldr        r0,PTR_ScenarioData_5D_08091040
    mov        r1,#0x1
    bl         Text_LoadDialogue
    pop        {r5}
    mov        r0,#0x78
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08090ec8:
    bl         Scene_IsStartPressed
    beq        LAB_08090ed2
    bl         S_Story_5D_SkipIfStart
LAB_08090ed2:
    pop        {pc}


_ts S_Story_5D_5
    ldrb       r0,[r5,#0xa]
    sub        r0,#0x1
    strb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_08090eec
    mov        r0,#0x1e
    strb       r0,[r5,#0xa]
    push       {r5}
    mov        r0,#0x8d
    bl         Sound_PlaySongImmediate
    pop        {r5}
LAB_08090eec:
    ldrb       r0,[r5,#0x8]
    tst        r0,r0
    beq        LAB_08090ef8
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    b          LAB_08090f26
LAB_08090ef8:
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08090f26
    mov        r0,#0x29
    bl         PlayerAnimation_SetState
    mov        r0,#0xc2
    bl         Sound_PlaySongImmediate
    mov        r0,#0xc1
    bl         Flag_SetBase
    mov        r0,#0xde
    bl         Flag_SetBase
    mov        r0,#0x8
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08090f26:
    bl         Scene_IsStartPressed
    beq        LAB_08090f30
    bl         S_Story_5D_SkipIfStart
LAB_08090f30:
    pop        {pc}


_nt S_Story_5D_6
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_08090f56
    mov        r0,#0xa6
    bl         Sound_PlaySongImmediate
    push       {r5}
    ldr        r0,PTR_BgTask_803BCF0_08091044
    bl         BgTask_AddNew
    pop        {r5}
    mov        r0,#0x50
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08090f56:
    bl         Scene_IsStartPressed
    beq        LAB_08090f60
    bl         S_Story_5D_SkipIfStart
LAB_08090f60:
    pop        {pc}


_nt S_Story_5D_7
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_08090f86
    push       {r5}
    ldr        r0,PTR_BgTask_803BCD8_08091048
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_803BB6C_0809104c
    bl         BgTask_AddNew
    pop        {r5}
    mov        r0,#0x3c
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08090f86:
    bl         Scene_IsStartPressed
    beq        LAB_08090f90
    bl         S_Story_5D_SkipIfStart
LAB_08090f90:
    pop        {pc}


_nt S_Story_5D_8
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_08090fae
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08090fae:
    bl         Scene_IsStartPressed
    beq        LAB_08090fb8
    bl         S_Story_5D_SkipIfStart
LAB_08090fb8:
    pop        {pc}


_nt S_Story_5D_9
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08090fda
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08090fda:
    pop        {pc}


_ts S_Story_5D_10
    push       {r5}
    bl         EnableBoundaryCheck
    bl         PlayerAnimation_Unlock
    pop        {r5}
    mov        r0,#0xc0
    bl         Flag_SetBase
    LoadMain world, r0, r7
    mov        r1,#0x3
    strb       r1,[r0,#0x7]
    ldr        r0,[r7,#0x2c]
    mov        r1,#0x1
    strb       r1,[r0,#0x10]
    strb       r1,[r0,#0x12]
    ldr        r1,PTR_MapEntrance_08091050
    str        r1,[r0,#0x14]
    push       {r5}
    mov        r0,#0x0
    bl         World_ChangeMap
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}

    .align 2, 0


MapEntrance_08091014:
    MapEntrance Map_Power_Plant_Comp_4, d_nw, f(16, -398, 0)


_ts S_Story_5D_SkipIfStart
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

PTR_PTR_S_Story_5D_0_0809103c:
    .word PTR_S_Story_5D_0_08090dc8

PTR_ScenarioData_5D_08091040:
    .word ScenarioData_5D

PTR_BgTask_803BCF0_08091044:
    .word BgTask_803BCF0

PTR_BgTask_803BCD8_08091048:
    .word BgTask_803BCD8

PTR_BgTask_803BB6C_0809104c:
    .word BgTask_803BB6C

PTR_MapEntrance_08091050:
    .word MapEntrance_08091014
