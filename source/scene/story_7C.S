#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Scene_Story_7C
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_7C_0_08097228
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_PTR_S_Story_7C_0_08097228:
    .word PTR_S_Story_7C_0_0809722c

PTR_S_Story_7C_0_0809722c:
    .word S_Story_7C_0
    .word S_Story_7C_1
    .word S_Story_7C_2
    .word S_Story_7C_3
    .word S_Story_7C_4
    .word S_Story_7C_5
    .word S_Story_7C_6
    .word S_Story_7C_7
    .word S_Story_7C_8


_ts S_Story_7C_0
    bl         Flag_SetPlayerInactive
    bl         PlayerAnimation_Lock
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_Story_7C_1
    bl         PlayerAnimation_GetState
    cmp        r0,#0x2
    bne        LAB_080972b8
    push       {r5}
    mov        r0,#0x34
    lsl        r0,r0,#0x10
    mov        r1,#0x20
    neg        r1,r1
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    bl         DisableBoundaryCheck
    mov        r0,#0xd
    bl         PlayerAnimation_SetState
    pop        {r5}
    mov        r0,#0x96
    bl         Flag_ClearBase
    mov        r0,#0xf9
    bl         Flag_ClearBase
    push       {r5}
    ldr        r7,PTR_NPCList_803E728_08097528
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x23
    strb       r0,[r5,#0x8]
    mov        r0,#0x1
    strb       r0,[r5,#0xa]
    strb       r0,[r5,#0x7]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080972b8:
    pop        {pc}


_nt S_Story_7C_2
    bl         FUN_08097488
    ldrb       r0,[r5,#0x8]
    tst        r0,r0
    beq        LAB_080972d6
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    mov        r0,#0x10
    neg        r0,r0
    lsl        r0,r0,#0xc
    mov        r1,#0x0
    mov        r2,#0x0
    bl         PlayerAnimation_Move
LAB_080972d6:
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0809730e
    ldrb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_08097304
    mov        r0,#0x5
    bl         PlayerAnimation_SetState
    push       {r5}
    ldr        r0,PTR_ScenarioData_7C_0809752c
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    strb       r0,[r5,#0x4]
LAB_08097304:
    bl         Scene_IsStartPressed
    beq        LAB_0809730e
    bl         S_Story_7C_SkipIfStart
LAB_0809730e:
    pop        {pc}


_ts S_Story_7C_3
    bl         FUN_08097488
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08097334
    bl         FUN_080974e8
    mov        r0,#0xed
    bl         Sound_PlaySongImmediate
    mov        r0,#0xa
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08097334:
    bl         Scene_IsStartPressed
    beq        LAB_0809733e
    bl         S_Story_7C_SkipIfStart
LAB_0809733e:
    pop        {pc}


_ts S_Story_7C_4
    bl         FUN_08097488
    bl         FUN_080974e8
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_08097364
    push       {r5}
    ldr        r0,PTR_ScenarioData_7C_0809752c
    mov        r1,#0x5
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08097364:
    bl         Scene_IsStartPressed
    beq        LAB_0809736e
    bl         S_Story_7C_SkipIfStart
LAB_0809736e:
    pop        {pc}


_ts S_Story_7C_5
    bl         FUN_08097488
    bl         FUN_080974e8
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_080973a0
    mov        r0,#0x96
    bl         Flag_SetBase
    mov        r0,#0xf9
    bl         Flag_SetBase
    mov        r0,#0xd
    bl         PlayerAnimation_SetState
    mov        r0,#0x3c
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080973a0:
    bl         Scene_IsStartPressed
    beq        LAB_080973aa
    bl         S_Story_7C_SkipIfStart
LAB_080973aa:
    pop        {pc}


_ts S_Story_7C_6
    bl         FUN_08097488
    bl         FUN_080974e8
    mov        r0,#0x10
    neg        r0,r0
    lsl        r0,r0,#0xc
    mov        r1,#0x0
    mov        r2,#0x0
    bl         PlayerAnimation_Move
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_080973de
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080973de:
    bl         Scene_IsStartPressed
    beq        LAB_080973e8
    bl         S_Story_7C_SkipIfStart
LAB_080973e8:
    pop        {pc}


_nt S_Story_7C_7
    bl         FUN_08097488
    bl         FUN_080974e8
    mov        r0,#0x10
    neg        r0,r0
    lsl        r0,r0,#0xc
    mov        r1,#0x0
    mov        r2,#0x0
    bl         PlayerAnimation_Move
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08097420
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08097420:
    pop        {pc}


_nt S_Story_7C_8
    push       {r5}
    bl         EnableBoundaryCheck
    bl         PlayerAnimation_Unlock
    bl         Flag_SetPlayerActive
    mov        r0,#0xe9
    bl         Flag_SetBase
    LoadMain mapChange, r0, r7
    mov        r1,#0x1
    strb       r1,[r0,#0x10]
    mov        r1,#0x1
    strb       r1,[r0,#0x12]
    ldr        r1,PTR_MapEntrance_08097530
    str        r1,[r0,#0x14]
    mov        r0,#0x0
    bl         World_ChangeMap
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}

MapEntrance_08097454:
    MapEntrance Map_WWW_Base, d_sw, f(198, -144, -64)


_ts S_Story_7C_SkipIfStart
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x8
    bl         Fade_Request
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x96
    bl         Flag_SetBase
    mov        r0,#0xf9
    bl         Flag_SetBase
    mov        r0,#0x1c
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts FUN_08097488
    push       {lr}
    push       {r5}
    mov        r0,#0x1
    mov        r1,#0x1
    bl         Camera_EnableScreenShake
    pop        {r5}
    ldrb       r0,[r5,#0x7]
    sub        r0,#0x1
    strb       r0,[r5,#0x7]
    tst        r0,r0
    bne        LAB_080974aa
    mov        r0,#0xd8
    bl         Sound_PlaySongImmediate
    mov        r0,#0x1e
    strb       r0,[r5,#0x7]
LAB_080974aa:
    ldrb       r0,[r5,#0xa]
    sub        r0,#0x1
    strb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_080974e6
    bl         Rng_RandomUint
    mov        r7,#0x7f
    and        r7,r0
    sub        r7,#0x3f
    mov        r1,#0x56
    add        r1,r1,r7
    lsl        r1,r1,#0x10
    mov        r2,#0x10
    neg        r2,r2
    lsl        r2,r2,#0x10
    mov        r7,#0x7f
    lsl        r7,r7,#0x8
    and        r7,r0
    lsr        r7,r7,#0x8
    sub        r7,#0x3f
    mov        r3,#0x0
    add        r3,r3,r7
    lsl        r3,r3,#0x10
    push       {r5}
    bl         Effect_TrafficExplosion_2_Create
    pop        {r5}
    mov        r1,#0xa
    strb       r1,[r5,#0xa]
LAB_080974e6:
    pop        {pc}


_ts FUN_080974e8
    push       {lr}
    ldrb       r0,[r5,#0x4]
    sub        r0,#0x1
    strb       r0,[r5,#0x4]
    tst        r0,r0
    bne        LAB_08097526
    bl         Rng_RandomUint
    mov        r7,#0x7f
    and        r7,r0
    sub        r7,#0x3f
    mov        r1,#0x2a
    add        r1,r1,r7
    lsl        r1,r1,#0x10
    mov        r2,#0x8e
    neg        r2,r2
    lsl        r2,r2,#0x10
    mov        r7,#0x7f
    lsl        r7,r7,#0x8
    and        r7,r0
    lsr        r7,r7,#0x8
    sub        r7,#0x3f
    mov        r3,#0x0
    add        r3,r3,r7
    lsl        r3,r3,#0x10
    push       {r5}
    bl         Effect_TrafficExplosion_2_Create
    pop        {r5}
    mov        r1,#0xa
    strb       r1,[r5,#0x4]
LAB_08097526:
    pop        {pc}

PTR_NPCList_803E728_08097528:
    .word NPCList_803E728

PTR_ScenarioData_7C_0809752c:
    .word ScenarioData_7C

PTR_MapEntrance_08097530:
    .word MapEntrance_08097454
