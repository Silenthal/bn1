#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Scene_Story_74
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_74_0_08095254
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_PTR_S_Story_74_0_08095254:
    .word PTR_S_Story_74_0_08095258

PTR_S_Story_74_0_08095258:
    .word S_Story_74_0
    .word S_Story_74_1
    .word S_Story_74_2
    .word S_Story_74_3
    .word S_Story_74_4
    .word S_Story_74_5
    .word S_Story_74_6
    .word S_Story_74_7
    .word S_Story_74_8
    .word S_Story_74_9
    .word S_Story_74_10
    .word S_Story_74_11
    .word S_Story_74_12
    .word S_Story_74_13
    .word S_Story_74_14
    .word S_Story_74_15
    .word S_Story_74_16
    .word S_Story_74_17


_ts S_Story_74_0
    bl         Flag_SetPlayerInactive
    bl         PlayerAnimation_Lock
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    Scene_Next
    pop        {pc}


_ts S_Story_74_1
    bl         PlayerAnimation_GetState
    cmp        r0,#0x2
    bne        LAB_0809530a
    mov        r0,#0x7
    bl         PlayerAnimation_SetState
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0809530a
    push       {r5}
    ldr        r0,DAT_080956c4
    lsl        r0,r0,#0x10
    mov        r1,#0x1e
    lsl        r1,r1,#0x10
    mov        r2,#0x20
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
    mov        r0,#0x3c
    strb       r0,[r5,#Scene_sceneTimer]
    Scene_Next
LAB_0809530a:
    pop        {pc}


_ts S_Story_74_2
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08095336
    ldrb       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    tst        r0,r0
    bne        LAB_0809532c
    Scene_Next
    mov        r0,#0xa1
    strb       r0,[r5,#Scene_sceneTimer]
LAB_0809532c:
    bl         Scene_IsStartPressed
    beq        LAB_08095336
    bl         S_Story_74_SkipIfStart
LAB_08095336:
    pop        {pc}


_ts S_Story_74_3
    ldrb       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    cmp        r0,#0x0
    beq        LAB_08095366
    mov        r1,#0x7
    and        r0,r1
    bne        LAB_0809537e
    LoadMain world, r7, r7
    ldr        r7,[r7,#0x28]
    mov        r0,#0xff
    strb       r0,[r7,#0x15]
    mov        r0,#0x6e
    bl         Sound_PlaySE
    Flag_SetBase 0xDF
    mov        r0,#0x36
    bl         PlayerAnimation_SetState
    b          LAB_0809537e
LAB_08095366:
    push       {r5}
    ldr        r0,PTR_ScenarioData_74_080956c8
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    mov        r0,#0x31
    bl         PlayerAnimation_SetState
    Scene_Next
LAB_0809537e:
    bl         Scene_IsStartPressed
    beq        LAB_08095388
    bl         S_Story_74_SkipIfStart
LAB_08095388:
    pop        {pc}


_nt S_Story_74_4
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_080953ba
    push       {r5}
    mov        r0,#0x10
    bl         Entity_FreeAllMultiple
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_804E318_080956cc
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0xf
    strb       r0,[r5,#Scene_sceneTimer]
    mov        r0,#0xd
    bl         PlayerAnimation_SetState
    Scene_Next
LAB_080953ba:
    bl         Scene_IsStartPressed
    beq        LAB_080953c4
    bl         S_Story_74_SkipIfStart
LAB_080953c4:
    pop        {pc}


_nt S_Story_74_5
    mov        r0,#0x8
    neg        r0,r0
    lsl        r0,r0,#0xc
    mov        r1,#0x0
    mov        r2,#0x0
    bl         PlayerAnimation_Move
    ldrb       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    tst        r0,r0
    bne        LAB_080953f0
    mov        r0,#0x1
    bl         PlayerAnimation_SetState
    mov        r0,#0x8d
    lsl        r0,r0,#0x1
    strh       r0,[r5,#Scene_sceneTimer]
    Scene_Next
LAB_080953f0:
    bl         Scene_IsStartPressed
    beq        LAB_080953fa
    bl         S_Story_74_SkipIfStart
LAB_080953fa:
    pop        {pc}


_ts S_Story_74_6
    ldrh       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strh       r0,[r5,#Scene_sceneTimer]
    cmp        r0,#0x47
    beq        LAB_08095414
    cmp        r0,#0x2f
    beq        LAB_08095414
    cmp        r0,#0x17
    beq        LAB_08095414
    tst        r0,r0
    bne        LAB_08095436
    b          LAB_08095422
LAB_08095414:
    mov        r0,#0x95
    bl         Sound_PlaySE
    Flag_SetBase 0xF9
    b          LAB_08095436
LAB_08095422:
    push       {r5}
    mov        r0,#0x2
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    Scene_Next
    pop        {pc}
LAB_08095436:
    bl         Scene_IsStartPressed
    beq        LAB_08095440
    bl         S_Story_74_SkipIfStart
LAB_08095440:
    pop        {pc}


_nt S_Story_74_7
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08095488
    push       {r5}
    mov        r0,#0x18
    bl         Entity_FreeAllMultiple
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_804E308_080956d0
    bl         Map_LoadNPCList
    ldr        r0,PTR_EntityAllocParams_804E978_080956d4
    bl         Entity_AllocList
    pop        {r5}
    push       {r5}
    mov        r0,#0x1
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x3c
    strb       r0,[r5,#Scene_sceneTimer]
    Scene_Next
    bl         Scene_IsStartPressed
    beq        LAB_08095488
    bl         S_Story_74_SkipIfStart
LAB_08095488:
    pop        {pc}


_nt S_Story_74_8
    ldrb       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    tst        r0,r0
    bne        LAB_080954ac
    push       {r5}
    ldr        r0,PTR_ScenarioData_74_080956c8
    mov        r1,#0x5
    bl         Text_LoadDialogue
    pop        {r5}
    mov        r0,#0x7
    bl         PlayerAnimation_SetState
    Scene_Next
LAB_080954ac:
    bl         Scene_IsStartPressed
    beq        LAB_080954b6
    bl         S_Story_74_SkipIfStart
LAB_080954b6:
    pop        {pc}


_ts S_Story_74_9
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_080954d4
    mov        r0,#0x6e
    strb       r0,[r5,#Scene_sceneTimer]
    mov        r0,#0xf
    bl         PlayerAnimation_SetState
    Scene_Next
LAB_080954d4:
    bl         Scene_IsStartPressed
    beq        LAB_080954de
    bl         S_Story_74_SkipIfStart
LAB_080954de:
    pop        {pc}


_ts S_Story_74_10
    mov        r0,#0x0
    mov        r1,#0x10
    neg        r1,r1
    lsl        r1,r1,#0xc
    mov        r2,#0x0
    bl         PlayerAnimation_Move
    ldrb       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    tst        r0,r0
    bne        LAB_08095508
    mov        r0,#0x31
    bl         PlayerAnimation_SetState
    mov        r0,#0xa
    strh       r0,[r5,#Scene_sceneTimer]
    Scene_Next
LAB_08095508:
    bl         Scene_IsStartPressed
    beq        LAB_08095512
    bl         S_Story_74_SkipIfStart
LAB_08095512:
    pop        {pc}


_ts S_Story_74_11
    ldrb       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    tst        r0,r0
    bne        LAB_08095528
    mov        r0,#0xa1
    strb       r0,[r5,#Scene_sceneTimer]
    Scene_Next
LAB_08095528:
    bl         Scene_IsStartPressed
    beq        LAB_08095532
    bl         S_Story_74_SkipIfStart
LAB_08095532:
    pop        {pc}


_ts S_Story_74_12
    ldrb       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    cmp        r0,#0x0
    beq        LAB_08095562
    mov        r1,#0x7
    and        r0,r1
    bne        LAB_08095586
    LoadMain world, r7, r7
    ldr        r7,[r7,#0x28]
    mov        r0,#0xff
    strb       r0,[r7,#0x15]
    mov        r0,#0x6e
    bl         Sound_PlaySE
    Flag_SetBase 0xB4
    mov        r0,#0x36
    bl         PlayerAnimation_SetState
    b          LAB_08095586
LAB_08095562:
    Flag_SetBase 0xFB
    mov        r0,#0xa9
    bl         Sound_PlaySE
    mov        r0,#0x31
    bl         PlayerAnimation_SetState
    push       {r5}
    mov        r0,#0x2
    mov        r1,#0x80
    bl         Fade_Request
    pop        {r5}
    Scene_Next
LAB_08095586:
    bl         Scene_IsStartPressed
    beq        LAB_08095590
    bl         S_Story_74_SkipIfStart
LAB_08095590:
    pop        {pc}


_nt S_Story_74_13
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080955b4
    push       {r5}
    mov        r0,#0x1
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x1e
    strh       r0,[r5,#Scene_sceneTimer]
    Scene_Next
LAB_080955b4:
    pop        {pc}


_nt S_Story_74_14
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080955ee
    ldrb       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    tst        r0,r0
    bne        LAB_080955e4
    mov        r0,#0x32
    bl         PlayerAnimation_SetState
    push       {r5}
    ldr        r0,PTR_ScenarioData_74_080956c8
    mov        r1,#0x6
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
LAB_080955e4:
    bl         Scene_IsStartPressed
    beq        LAB_080955ee
    bl         S_Story_74_SkipIfStart
LAB_080955ee:
    pop        {pc}


_ts S_Story_74_15
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0809560e
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    Scene_Next
LAB_0809560e:
    bl         Scene_IsStartPressed
    beq        LAB_08095618
    bl         S_Story_74_SkipIfStart
LAB_08095618:
    pop        {pc}


_nt S_Story_74_16
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08095682
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    push       {r5}
    ldr        r0,DAT_080956d8
    lsl        r0,r0,#0x10
    mov        r1,#0x50
    neg        r1,r1
    lsl        r1,r1,#0x10
    mov        r2,#0x20
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
    LoadMain world, r0, r0
    mov        r1,#0x0
    str        r1,[r0,#0x34]
    push       {r5}
    ldr        r7,PTR_NPCList_804E308_080956dc
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    Scene_Next
LAB_08095682:
    pop        {pc}


_ts S_Story_74_17
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080956aa
    push       {r5}
    bl         EnableBoundaryCheck
    bl         PlayerAnimation_Unlock
    bl         Flag_SetPlayerActive
    Flag_SetBase 0xFA
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
LAB_080956aa:
    pop        {pc}


_ts S_Story_74_SkipIfStart
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x40
    strb       r0,[r5,#Scene_state_s0]
    pop        {pc}

DAT_080956c4:
    .word 0x1FC

PTR_ScenarioData_74_080956c8:
    .word ScenarioData_74

PTR_NPCList_804E318_080956cc:
    .word NPCList_804E318

PTR_NPCList_804E308_080956d0:
    .word NPCList_804E308

PTR_EntityAllocParams_804E978_080956d4:
    .word EntityAllocParams_804E978

DAT_080956d8:
    .word 0x1F4

PTR_NPCList_804E308_080956dc:
    .word NPCList_804E308
