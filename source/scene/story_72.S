#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Scene_Story_72
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_72_0_08094ba4
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_PTR_S_Story_72_0_08094ba4:
    .word PTR_S_Story_72_0_08094ba8

PTR_S_Story_72_0_08094ba8:
    .word S_Story_72_0
    .word S_Story_72_1
    .word S_Story_72_2
    .word S_Story_72_3
    .word S_Story_72_4
    .word S_Story_72_5
    .word S_Story_72_6
    .word S_Story_72_7
    .word S_Story_72_8
    .word S_Story_72_9
    .word S_Story_72_10
    .word S_Story_72_11
    .word S_Story_72_12
    .word S_Story_72_13
    .word S_Story_72_14
    .word S_Story_72_15


_ts S_Story_72_0
    bl         Flag_SetPlayerInactive
    bl         PlayerAnimation_Lock
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_Story_72_1
    bl         PlayerAnimation_GetState
    cmp        r0,#0x2
    bne        LAB_08094c50
    mov        r0,#0x7
    bl         PlayerAnimation_SetState
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08094c50
    push       {r5}
    ldr        r0,DAT_08094f5c
    neg        r0,r0
    lsl        r0,r0,#0x10
    mov        r1,#0xa
    lsl        r1,r1,#0x10
    mov        r2,#0x40
    lsl        r2,r2,#0x10
    bl         PlayerAnimation_SetPosition
    bl         DisableBoundaryCheck
    mov        r0,#0x31
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
LAB_08094c50:
    pop        {pc}


_nt S_Story_72_2
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08094c7a
    push       {r5}
    ldr        r0,PTR_ScenarioData_72_08094f60
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    bl         Scene_IsStartPressed
    beq        LAB_08094c7a
    bl         S_Story_72_SkipIfStart
LAB_08094c7a:
    pop        {pc}


_ts S_Story_72_3
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08094cac
    push       {r5}
    mov        r0,#0x10
    bl         Entity_FreeAllMultiple
    pop        {r5}
    mov        r0,#0xde
    bl         Sound_PlaySongImmediate
    push       {r5}
    ldr        r7,PTR_NPCList_804E230_08094f64
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x64
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08094cac:
    bl         Scene_IsStartPressed
    beq        LAB_08094cb6
    bl         S_Story_72_SkipIfStart
LAB_08094cb6:
    pop        {pc}


_ts S_Story_72_4
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_08094cd6
    push       {r5}
    ldr        r0,PTR_ScenarioData_72_08094f60
    mov        r1,#0x5
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}
LAB_08094cd6:
    bl         Scene_IsStartPressed
    beq        LAB_08094ce0
    bl         S_Story_72_SkipIfStart
LAB_08094ce0:
    pop        {pc}


_nt S_Story_72_5
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08094d0a
    mov        r0,#0xd2
    bl         Flag_SetBase
    mov        r0,#0xc0
    bl         Flag_ClearBase
    mov        r0,#0x8
    bl         Flag_SetIgnore
    mov        r0,#0x3c
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08094d0a:
    bl         Scene_IsStartPressed
    beq        LAB_08094d14
    bl         S_Story_72_SkipIfStart
LAB_08094d14:
    pop        {pc}


_nt S_Story_72_6
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_08094d38
    push       {r5}
    ldr        r0,PTR_ScenarioData_72_08094f60
    mov        r1,#0x6
    bl         Text_LoadDialogue
    pop        {r5}
    mov        r0,#0x3
    bl         PlayerAnimation_SetState
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08094d38:
    bl         Scene_IsStartPressed
    beq        LAB_08094d42
    bl         S_Story_72_SkipIfStart
LAB_08094d42:
    pop        {pc}


_ts S_Story_72_7
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08094d60
    mov        r0,#0x1e
    strb       r0,[r5,#0x8]
    mov        r0,#0xf
    bl         PlayerAnimation_SetState
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08094d60:
    bl         Scene_IsStartPressed
    beq        LAB_08094d6a
    bl         S_Story_72_SkipIfStart
LAB_08094d6a:
    pop        {pc}


_ts S_Story_72_8
    mov        r0,#0x0
    mov        r1,#0x10
    neg        r1,r1
    lsl        r1,r1,#0xc
    mov        r2,#0x0
    bl         PlayerAnimation_Move
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_08094d94
    mov        r0,#0x31
    bl         PlayerAnimation_SetState
    mov        r0,#0xa
    strh       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08094d94:
    bl         Scene_IsStartPressed
    beq        LAB_08094d9e
    bl         S_Story_72_SkipIfStart
LAB_08094d9e:
    pop        {pc}


_ts S_Story_72_9
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_08094db4
    mov        r0,#0xa1
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08094db4:
    bl         Scene_IsStartPressed
    beq        LAB_08094dbe
    bl         S_Story_72_SkipIfStart
LAB_08094dbe:
    pop        {pc}


_ts S_Story_72_10
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    cmp        r0,#0x0
    beq        LAB_08094dee
    mov        r1,#0x7
    and        r0,r1
    bne        LAB_08094e12
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldr        r7,[r7,#0x28]
    mov        r0,#0xff
    strb       r0,[r7,#0x15]
    mov        r0,#0x6e
    bl         Sound_PlaySongImmediate
    mov        r0,#0xb4
    bl         Flag_SetBase
    mov        r0,#0x36
    bl         PlayerAnimation_SetState
    b          LAB_08094e12
LAB_08094dee:
    mov        r0,#0xb7
    bl         Flag_SetBase
    mov        r0,#0xa9
    bl         Sound_PlaySongImmediate
    mov        r0,#0x31
    bl         PlayerAnimation_SetState
    push       {r5}
    mov        r0,#0x2
    mov        r1,#0x80
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08094e12:
    bl         Scene_IsStartPressed
    beq        LAB_08094e1c
    bl         S_Story_72_SkipIfStart
LAB_08094e1c:
    pop        {pc}


_nt S_Story_72_11
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08094e40
    push       {r5}
    mov        r0,#0x1
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x1e
    strh       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08094e40:
    pop        {pc}


_nt S_Story_72_12
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08094e7a
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_08094e70
    mov        r0,#0x32
    bl         PlayerAnimation_SetState
    push       {r5}
    ldr        r0,PTR_ScenarioData_72_08094f60
    mov        r1,#0x7
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08094e70:
    bl         Scene_IsStartPressed
    beq        LAB_08094e7a
    bl         S_Story_72_SkipIfStart
LAB_08094e7a:
    pop        {pc}


_ts S_Story_72_13
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08094e9a
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08094e9a:
    bl         Scene_IsStartPressed
    beq        LAB_08094ea4
    bl         S_Story_72_SkipIfStart
LAB_08094ea4:
    pop        {pc}


_nt S_Story_72_14
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08094f18
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    push       {r5}
    ldr        r0,DAT_08094f5c
    neg        r0,r0
    lsl        r0,r0,#0x10
    mov        r1,#0x14
    neg        r1,r1
    lsl        r1,r1,#0x10
    mov        r2,#0x40
    lsl        r2,r2,#0x10
    bl         PlayerAnimation_SetPosition
    bl         DisableBoundaryCheck
    mov        r0,#0x4
    bl         PlayerAnimation_SetState
    pop        {r5}
    push       {r5}
    mov        r0,#0x18
    bl         Entity_FreeAllMultiple
    pop        {r5}
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    mov        r1,#0x0
    str        r1,[r0,#0x34]
    push       {r5}
    ldr        r7,PTR_NPCList_804E21C_08094f68
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    mov        r2,#0x8
    bl         FUN_0804d3fe
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08094f18:
    pop        {pc}


_nt S_Story_72_15
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08094f40
    push       {r5}
    bl         EnableBoundaryCheck
    bl         PlayerAnimation_Unlock
    bl         Flag_SetPlayerActive
    mov        r0,#0xb6
    bl         Flag_SetBase
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
LAB_08094f40:
    pop        {pc}


_nt S_Story_72_SkipIfStart
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x38
    strb       r0,[r5,#0x0]
    pop        {pc}

    .align 2, 0


DAT_08094f5c:
    .word 0x1E6

PTR_ScenarioData_72_08094f60:
    .word ScenarioData_72

PTR_NPCList_804E230_08094f64:
    .word NPCList_804E230

PTR_NPCList_804E21C_08094f68:
    .word NPCList_804E21C
