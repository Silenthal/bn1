#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Scene_Story_77
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_77_0_080960b0
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_PTR_S_Story_77_0_080960b0:
    .word PTR_S_Story_77_0_080960b4

PTR_S_Story_77_0_080960b4:
    .word S_Story_77_0
    .word S_Story_77_1
    .word S_Story_77_2
    .word S_Story_77_3
    .word S_Story_77_4
    .word S_Story_77_5
    .word S_Story_77_6
    .word S_Story_77_7
    .word S_Story_77_8
    .word S_Story_77_9
    .word S_Story_77_10
    .word S_Story_77_11
    .word S_Story_77_12
    .word S_Story_77_13
    .word S_Story_77_14
    .word S_Story_77_15


_ts S_Story_77_0
    bl         Sound_StopAllMusic
    bl         Flag_SetPlayerInactive
    bl         PlayerAnimation_Lock
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_Story_77_1
    bl         PlayerAnimation_GetState
    cmp        r0,#0x2
    bne        LAB_08096150
    push       {r5}
    mov        r0,#0x8c
    lsl        r0,r0,#0x12
    mov        r1,#0xc8
    neg        r1,r1
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    bl         DisableBoundaryCheck
    mov        r0,#0x31
    bl         PlayerAnimation_SetState
    pop        {r5}
    mov        r0,#0xe3
    bl         Flag_ClearBase
    push       {r5}
    ldr        r7,PTR_NPCList_804E470_08096154
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08096150:
    pop        {pc}

    .align 2, 0


PTR_NPCList_804E470_08096154:
    .word NPCList_804E470


_ts S_Story_77_2
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08096186
    push       {r5}
    ldr        r0,PTR_ScenarioData_77_08096550
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    mov        r0,#0x3
    bl         PlayerAnimation_SetState
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    bl         Scene_IsStartPressed
    beq        LAB_08096186
    bl         S_Story_77_SkipIfStart
LAB_08096186:
    pop        {pc}


_ts S_Story_77_3
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_080961d8
    mov        r0,#0xf9
    bl         Flag_SetBase
    mov        r0,#0xde
    bl         Sound_PlaySongImmediate
    mov        r0,#0x3c
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    bl         Scene_IsStartPressed
    beq        LAB_080961b4
    bl         S_Story_77_SkipIfStart
LAB_080961b4:
    pop        {pc}


_nt S_Story_77_4
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_080961d8
    push       {r5}
    ldr        r0,PTR_ScenarioData_77_08096550
    mov        r1,#0x4
    bl         Text_LoadDialogue
    pop        {r5}
    mov        r0,#0x8f
    bl         Sound_PlaySongImmediate
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080961d8:
    bl         Scene_IsStartPressed
    beq        LAB_080961e2
    bl         S_Story_77_SkipIfStart
LAB_080961e2:
    pop        {pc}


_ts S_Story_77_5
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0809623c
    mov        r0,#0xf9
    bl         Flag_ClearBase
    mov        r0,#0x7
    bl         PlayerAnimation_SetState
    push       {r5}
    ldr        r0,PTR_ScenarioData_77_08096550
    mov        r1,#0x5
    bl         Text_LoadDialogue
    pop        {r5}
    mov        r0,#0x32
    strb       r0,[r5,#0x8]
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    push       {r0,r5}
    ldr        r0,[r0,#0x24]
    ldr        r1,DAT_08096554
    sub        r0,r1,r0
    mov        r1,#0x10
    bl         SWI_Div
    pop        {r1,r5}
    str        r0,[r5,#0x14]
    push       {r5}
    ldr        r0,[r1,#0x28]
    ldr        r1,DAT_08096558
    sub        r0,r1,r0
    mov        r1,#0x10
    bl         SWI_Div
    pop        {r5}
    str        r0,[r5,#0x18]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0809623c:
    bl         Scene_IsStartPressed
    beq        LAB_08096246
    bl         S_Story_77_SkipIfStart
LAB_08096246:
    pop        {pc}


_ts S_Story_77_6
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_080962ac
    mov        r0,#0x6e
    bl         Sound_PlaySongImmediate
    push       {r5}
    mov        r0,#0x4
    bl         Sound_StopSong
    pop        {r5}
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    mov        r0,#0xff
    strb       r0,[r7,#0x18]
    push       {r5}
    ldr        r0,PTR_ScenarioData_77_08096550
    mov        r1,#0xc
    bl         Text_LoadDialogue
    pop        {r5}
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    ldrh       r1,[r0,#0x26]
    lsl        r1,r1,#0x10
    ldrh       r2,[r0,#0x2a]
    lsl        r2,r2,#0x10
    ldrh       r3,[r0,#0x2e]
    lsl        r3,r3,#0x10
    bl         Effect_TrafficExplosion_2_Create
    pop        {r5}
    mov        r0,#0xa9
    bl         Sound_PlaySongImmediate
    mov        r0,#0x47
    bl         PlayerAnimation_SetState
    mov        r0,#0x0
    str        r0,[r5,#0x10]
    mov        r0,#0x1
    str        r0,[r5,#0x20]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080962ac:
    bl         Scene_IsStartPressed
    beq        LAB_080962b6
    bl         S_Story_77_SkipIfStart
LAB_080962b6:
    pop        {pc}


_ts S_Story_77_7
    bl         FUN_080964fc
    tst        r0,r0
    beq        LAB_080962e4
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_080962e4
    push       {r5}
    ldr        r0,PTR_ScenarioData_77_08096550
    mov        r1,#0x6
    bl         Text_LoadDialogue
    pop        {r5}
    mov        r0,#0xe3
    bl         Flag_SetBase
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080962e4:
    bl         Scene_IsStartPressed
    beq        LAB_080962ee
    bl         S_Story_77_SkipIfStart
LAB_080962ee:
    pop        {pc}


_ts S_Story_77_8
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0809633e
    mov        r0,#0x4
    bl         Sound_ChangeSong
    push       {r5}
    ldr        r0,PTR_ScenarioData_77_08096550
    mov        r1,#0x9
    bl         Text_LoadDialogue
    pop        {r5}
    mov        r0,#0xf9
    bl         Flag_ClearBase
    mov        r0,#0x93
    bl         Flag_ClearBase
    push       {r5}
    mov        r0,#0x10
    bl         Entity_FreeAllMultiple
    pop        {r5}
    mov        r0,#0xde
    bl         Sound_PlaySongImmediate
    push       {r5}
    ldr        r7,PTR_NPCList_804E488_0809655c
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x28
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0809633e:
    bl         Scene_IsStartPressed
    beq        LAB_08096348
    bl         S_Story_77_SkipIfStart
LAB_08096348:
    pop        {pc}


_nt S_Story_77_9
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_0809636a
    mov        r0,#0x75
    bl         Sound_PlaySongImmediate
    mov        r0,#0xf9
    bl         Flag_SetBase
    mov        r0,#0xa
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0809636a:
    bl         Scene_IsStartPressed
    beq        LAB_08096374
    bl         S_Story_77_SkipIfStart
LAB_08096374:
    pop        {pc}


_nt S_Story_77_10
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0809639a
    push       {r5}
    mov        r0,#0x2
    mov        r1,#0x80
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    mov        r0,#0x1e
    strb       r0,[r5,#0x8]
    b          LAB_080963de
LAB_0809639a:
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_080963d4
    bl         Rng_RandomUint
    mov        r7,#0x1f
    and        r7,r0
    sub        r7,#0xf
    ldr        r1,DAT_08096560
    add        r1,r1,r7
    lsl        r1,r1,#0x10
    ldr        r2,DAT_08096564
    lsl        r2,r2,#0x10
    mov        r7,#0x1f
    lsl        r7,r7,#0x8
    and        r7,r0
    lsr        r7,r7,#0x8
    sub        r7,#0xf
    mov        r3,#0x0
    add        r3,r3,r7
    lsl        r3,r3,#0x10
    push       {r5}
    bl         Effect_TrafficExplosion_1_Create
    pop        {r5}
    mov        r0,#0xa
    strb       r0,[r5,#0x8]
LAB_080963d4:
    bl         Scene_IsStartPressed
    beq        LAB_080963de
    bl         S_Story_77_SkipIfStart
LAB_080963de:
    pop        {pc}


_ts S_Story_77_11
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0809641e
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_0809641e
    mov        r0,#0xf9
    bl         Flag_ClearBase
    mov        r0,#0xed
    bl         Sound_PlaySongImmediate
    push       {r5}
    mov        r0,#0x1
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    bl         Scene_IsStartPressed
    beq        LAB_0809641e
    bl         S_Story_77_SkipIfStart
LAB_0809641e:
    pop        {pc}


_ts S_Story_77_12
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    bne        LAB_08096452
    bl         Sound_StopAllMusic
    push       {r5}
    ldr        r0,PTR_ScenarioData_77_08096550
    mov        r1,#0xa
    bl         Text_LoadDialogue
    pop        {r5}
    mov        r0,#0x93
    bl         Flag_SetBase
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    bl         Scene_IsStartPressed
    beq        LAB_0809641e
    bl         S_Story_77_SkipIfStart
LAB_08096452:
    pop        {pc}


_ts S_Story_77_13
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08096472
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x2
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08096472:
    bl         Scene_IsStartPressed
    beq        LAB_0809647c
    bl         S_Story_77_SkipIfStart
LAB_0809647c:
    pop        {pc}


_nt S_Story_77_14
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0809649e
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0809649e:
    pop        {pc}


_ts S_Story_77_15
    push       {r5}
    bl         EnableBoundaryCheck
    bl         PlayerAnimation_Unlock
    bl         Flag_SetPlayerActive
    mov        r0,#0xe4
    bl         Flag_SetBase
    mov        r7,r10
    ldr        r0,[r7,#0x2c]
    mov        r1,#0x1
    strb       r1,[r0,#0x10]
    mov        r1,#0x1
    strb       r1,[r0,#0x12]
    ldr        r1,PTR_MapEntrance_08096568
    str        r1,[r0,#0x14]
    mov        r0,#0x0
    bl         World_ChangeMap
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}

    .align 2, 0


MapEntrance_080964d4:
    MapEntrance Map_WWW_Wily_Lab, d_ne, f(126, 86, 0)


_ts S_Story_77_SkipIfStart
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x2
    bl         Fade_Request
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x38
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts FUN_080964fc
    push       {lr}
    ldr        r0,[r5,#0x20]
    tst        r0,r0
    beq        LAB_08096546
    ldr        r0,[r5,#0x1c]
    cmp        r0,#0x2
    bge        LAB_0809654a
    ldr        r0,[r5,#0x10]
    add        r0,#0x1
    str        r0,[r5,#0x10]
    cmp        r0,#0x10
    bge        LAB_08096522
    ldr        r0,[r5,#0x14]
    ldr        r1,[r5,#0x18]
    mov        r2,#0x0
    push       {r5}
    bl         PlayerAnimation_Move
    pop        {r5}
LAB_08096522:
    push       {r5}
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldr        r5,[r0,#0x28]
    bl         SpritePtr_GetFrameStatus
    pop        {r5}
    mov        r1,#0x80
    and        r0,r1
    beq        LAB_08096546
    ldr        r0,[r5,#0x1c]
    add        r0,#0x1
    str        r0,[r5,#0x1c]
    push       {r5}
    mov        r0,#0x48
    bl         PlayerAnimation_SetState
    pop        {r5}
LAB_08096546:
    mov        r0,#0x0
    pop        {pc}
LAB_0809654a:
    mov        r0,#0x1
    pop        {pc}

    .align 2, 0


PTR_ScenarioData_77_08096550:
    .word ScenarioData_77

DAT_08096554:
    .word 0x2300000

DAT_08096558:
    .word 0xFF620000

PTR_NPCList_804E488_0809655c:
    .word NPCList_804E488

DAT_08096560:
    .word 0x22C

DAT_08096564:
    .word 0xFFFFFF14

PTR_MapEntrance_08096568:
    .word MapEntrance_080964d4
