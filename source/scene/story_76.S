#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Scene_Story_76
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_76_0_08095b4c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_PTR_S_Story_76_0_08095b4c:
    .word PTR_S_Story_76_0_08095b50

PTR_S_Story_76_0_08095b50:
    .word S_Story_76_0
    .word S_Story_76_1
    .word S_Story_76_2
    .word S_Story_76_3
    .word S_Story_76_4
    .word S_Story_76_5
    .word S_Story_76_6
    .word S_Story_76_7
    .word S_Story_76_8
    .word S_Story_76_9
    .word S_Story_76_10
    .word S_Story_76_11
    .word S_Story_76_12
    .word S_Story_76_13
    .word S_Story_76_14
    .word S_Story_76_15
    .word S_Story_76_16
    .word S_Story_76_17
    .word S_Story_76_18
    .word S_Story_76_19
    .word S_Story_76_20
    .word S_Story_76_21
    .word S_Story_76_22


_ts S_Story_76_0
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


_ts S_Story_76_1
    bl         PlayerAnimation_GetState
    cmp        r0,#0x2
    bne        LAB_08095c12
    mov        r0,#0x7
    bl         PlayerAnimation_SetState
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08095c12
    push       {r5}
    mov        r0,#0x8b
    lsl        r0,r0,#0x12
    mov        r1,#0x5a
    neg        r1,r1
    lsl        r1,r1,#0x10
    mov        r2,#0x0
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
LAB_08095c12:
    pop        {pc}


_ts S_Story_76_2
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08095c42
    push       {r5}
    ldr        r0,PTR_ScenarioData_76_08095cb0
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    mov        r0,#0x31
    bl         PlayerAnimation_SetState
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    bl         Scene_IsStartPressed
    beq        LAB_08095c42
    bl         S_Story_76_SkipIfStart
LAB_08095c42:
    pop        {pc}


_ts S_Story_76_3
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08095ca2
    push       {r5}
    mov        r0,#0x10
    bl         Entity_FreeAllMultiple
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_804E444_08095c7c
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x32
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    bl         Scene_IsStartPressed
    beq        LAB_08095c78
    bl         S_Story_76_SkipIfStart
LAB_08095c78:
    pop        {pc}

    .align 2, 0


PTR_NPCList_804E444_08095c7c:
    .word NPCList_804E444


_ts S_Story_76_4
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_08095ca2
    push       {r5}
    ldr        r0,PTR_ScenarioData_76_08095cb0
    mov        r1,#0x4
    bl         Text_LoadDialogue
    pop        {r5}
    mov        r0,#0x3
    bl         PlayerAnimation_SetState
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08095ca2:
    bl         Scene_IsStartPressed
    beq        LAB_08095cac
    bl         S_Story_76_SkipIfStart
LAB_08095cac:
    pop        {pc}

    .align 2, 0


PTR_ScenarioData_76_08095cb0:
    .word ScenarioData_76


_ts S_Story_76_5
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08095cd6
    mov        r0,#0xe3
    bl         Flag_ClearBase
    mov        r0,#0xf
    strb       r0,[r5,#0x8]
    mov        r0,#0xd
    bl         PlayerAnimation_SetState
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08095cd6:
    bl         Scene_IsStartPressed
    beq        LAB_08095ce0
    bl         S_Story_76_SkipIfStart
LAB_08095ce0:
    pop        {pc}


_nt S_Story_76_6
    mov        r0,#0x8
    neg        r0,r0
    lsl        r0,r0,#0xc
    mov        r1,#0x0
    mov        r2,#0x0
    bl         PlayerAnimation_Move
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_08095d0a
    mov        r0,#0x1
    bl         PlayerAnimation_SetState
    mov        r0,#0x50
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08095d0a:
    bl         Scene_IsStartPressed
    beq        LAB_08095d14
    bl         S_Story_76_SkipIfStart
LAB_08095d14:
    pop        {pc}


_nt S_Story_76_7
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_08095d4c
    push       {r5}
    ldr        r0,PTR_ScenarioData_76_08096094
    mov        r1,#0x1a
    bl         Text_LoadDialogue
    pop        {r5}
    mov        r0,#0xe3
    bl         Flag_SetBase
    mov        r0,#0x7
    bl         PlayerAnimation_SetState
    push       {r5}
    bl         Effect_Sparks_Create
    pop        {r5}
    mov        r0,#0x1e
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}
LAB_08095d4c:
    bl         Scene_IsStartPressed
    beq        LAB_08095d56
    bl         S_Story_76_SkipIfStart
LAB_08095d56:
    pop        {pc}


_ts S_Story_76_8
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08095d96
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_08095d96
    mov        r0,#0x79
    bl         Sound_PlaySongImmediate
    push       {r5}
    ldr        r0,PTR_BgTask_804CC98_08096098
    bl         BgTask_AddNew
    pop        {r5}
    mov        r0,#0xe3
    bl         Flag_ClearBase
    push       {r5}
    ldr        r0,PTR_ScenarioData_76_08096094
    mov        r1,#0xb
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08095d96:
    bl         Scene_IsStartPressed
    beq        LAB_08095da0
    bl         S_Story_76_SkipIfStart
LAB_08095da0:
    pop        {pc}


_nt S_Story_76_9
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08095dbe
    mov        r0,#0x28
    strb       r0,[r5,#0x8]
    mov        r0,#0xf
    bl         PlayerAnimation_SetState
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08095dbe:
    bl         Scene_IsStartPressed
    beq        LAB_08095dc8
    bl         S_Story_76_SkipIfStart
LAB_08095dc8:
    pop        {pc}


_nt S_Story_76_10
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
    bne        LAB_08095df2
    mov        r0,#0x8
    bl         PlayerAnimation_SetState
    mov        r0,#0xa
    strh       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08095df2:
    bl         Scene_IsStartPressed
    beq        LAB_08095dfc
    bl         S_Story_76_SkipIfStart
LAB_08095dfc:
    pop        {pc}


_nt S_Story_76_11
    mov        r0,#0x10
    lsl        r0,r0,#0xc
    mov        r1,#0x10
    neg        r1,r1
    lsl        r1,r1,#0xc
    mov        r2,#0x0
    bl         PlayerAnimation_Move
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_08095e28
    mov        r0,#0xf
    bl         PlayerAnimation_SetState
    mov        r0,#0x28
    strh       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08095e28:
    bl         Scene_IsStartPressed
    beq        LAB_08095e32
    bl         S_Story_76_SkipIfStart
LAB_08095e32:
    pop        {pc}


_ts S_Story_76_12
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
    bne        LAB_08095e5c
    mov        r0,#0x31
    bl         PlayerAnimation_SetState
    mov        r0,#0xa
    strh       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08095e5c:
    bl         Scene_IsStartPressed
    beq        LAB_08095e66
    bl         S_Story_76_SkipIfStart
LAB_08095e66:
    pop        {pc}


_ts S_Story_76_13
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_08095e7c
    mov        r0,#0xa1
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08095e7c:
    bl         Scene_IsStartPressed
    beq        LAB_08095e86
    bl         S_Story_76_SkipIfStart
LAB_08095e86:
    pop        {pc}


_ts S_Story_76_14
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    cmp        r0,#0x0
    beq        LAB_08095eb6
    mov        r1,#0x7
    and        r0,r1
    bne        LAB_08095ee4
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
    b          LAB_08095ee4
LAB_08095eb6:
    mov        r0,#0xe2
    bl         Flag_SetBase
    mov        r0,#0xa9
    bl         Sound_PlaySongImmediate
    push       {r5}
    mov        r0,#0xd
    bl         Sound_StopSong
    pop        {r5}
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
LAB_08095ee4:
    bl         Scene_IsStartPressed
    beq        LAB_08095eee
    bl         S_Story_76_SkipIfStart
LAB_08095eee:
    pop        {pc}


_ts S_Story_76_15
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08095f12
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
LAB_08095f12:
    pop        {pc}


_ts S_Story_76_16
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08095f4c
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_08095f42
    mov        r0,#0x32
    bl         PlayerAnimation_SetState
    push       {r5}
    ldr        r0,PTR_ScenarioData_76_08096094
    mov        r1,#0xc
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08095f42:
    bl         Scene_IsStartPressed
    beq        LAB_08095f4c
    bl         S_Story_76_SkipIfStart
LAB_08095f4c:
    pop        {pc}


_nt S_Story_76_17
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08095f72
    mov        r0,#0x3
    bl         PlayerAnimation_SetState
    push       {r5}
    ldr        r0,PTR_ScenarioData_76_08096094
    mov        r1,#0xe
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08095f72:
    bl         Scene_IsStartPressed
    beq        LAB_08095f7c
    bl         S_Story_76_SkipIfStart
LAB_08095f7c:
    pop        {pc}


_nt S_Story_76_18
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08095fb0
    push       {r5}
    mov        r0,#0x10
    bl         Entity_FreeAllMultiple
    mov        r0,#0xde
    bl         Sound_PlaySongImmediate
    ldr        r7,PTR_NPCList_804E458_0809609c
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x31
    bl         PlayerAnimation_SetState
    mov        r0,#0x3c
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08095fb0:
    bl         Scene_IsStartPressed
    beq        LAB_08095fba
    bl         S_Story_76_SkipIfStart
LAB_08095fba:
    pop        {pc}


_ts S_Story_76_19
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_08095fd8
    push       {r5}
    ldr        r0,PTR_ScenarioData_76_08096094
    mov        r1,#0x16
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08095fd8:
    bl         Scene_IsStartPressed
    beq        LAB_08095fe2
    bl         S_Story_76_SkipIfStart
LAB_08095fe2:
    pop        {pc}


_ts S_Story_76_20
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0809600c
    push       {r5}
    mov        r0,#0x2
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    bl         Sound_StopAllMusic
    mov        r0,#0xc7
    bl         Sound_PlaySongImmediate
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0809600c:
    bl         Scene_IsStartPressed
    beq        LAB_08096016
    bl         S_Story_76_SkipIfStart
LAB_08096016:
    pop        {pc}


_ts S_Story_76_21
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08096038
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08096038:
    pop        {pc}


_nt S_Story_76_22
    push       {r5}
    bl         EnableBoundaryCheck
    bl         PlayerAnimation_Unlock
    bl         Flag_SetPlayerActive
    mov        r0,#0xe1
    bl         Flag_SetBase
    mov        r0,#0xf9
    bl         Flag_ClearBase
    ldr        r0,PTR_EnemySpawn_MagicManV1_080960a0
    bl         Battle_GetRandomEncounter
    mov        r0,#0x4
    mov        r1,#0x5
    mov        r2,#0x0
    mov        r4,#0x81
    mov        r6,#0x1
    bl         World_SetBattleParams
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}


_ts S_Story_76_SkipIfStart
    push       {r5}
    mov        r0,#0x2
    mov        r1,#0x10
    bl         Fade_Request
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    bl         Sound_StopAllMusic
    mov        r0,#0xc7
    bl         Sound_PlaySongImmediate
    mov        r0,#0x54
    strb       r0,[r5,#0x0]
    pop        {pc}

    .align 2, 0


PTR_ScenarioData_76_08096094:
    .word ScenarioData_76

PTR_BgTask_804CC98_08096098:
    .word BgTask_804CC98

PTR_NPCList_804E458_0809609c:
    .word NPCList_804E458

PTR_EnemySpawn_MagicManV1_080960a0:
    .word EnemySpawn_MagicManV1
