#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Scene_Story_7D
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_7D_0_08097540
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_PTR_S_Story_7D_0_08097540:
    .word PTR_S_Story_7D_0_08097544

PTR_S_Story_7D_0_08097544:
    .word S_Story_7D_0
    .word S_Story_7D_1
    .word S_Story_7D_2
    .word S_Story_7D_3
    .word S_Story_7D_4
    .word S_Story_7D_5


_ts S_Story_7D_0
    bl         Flag_SetPlayerInactive
    bl         PlayerAnimation_Lock
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_Story_7D_1
    bl         PlayerAnimation_GetState
    cmp        r0,#0x2
    bne        LAB_080975b8
    push       {r5}
    mov        r0,#0xc2
    neg        r0,r0
    lsl        r0,r0,#0x10
    mov        r1,#0x54
    lsl        r1,r1,#0x10
    mov        r2,#0x40
    neg        r2,r2
    lsl        r2,r2,#0x10
    bl         PlayerAnimation_SetPosition
    bl         DisableBoundaryCheck
    mov        r0,#0xf
    bl         PlayerAnimation_SetState
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_803E614_0809772c
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x1
    strb       r0,[r5,#0xa]
    strb       r0,[r5,#0x7]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080975b8:
    pop        {pc}


_nt S_Story_7D_2
    bl         FUN_080976cc
    mov        r0,#0x0
    mov        r1,#0x10
    neg        r1,r1
    lsl        r1,r1,#0xc
    mov        r2,#0x0
    bl         PlayerAnimation_Move
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080975f4
    push       {r5}
    ldr        r0,PTR_ScenarioData_7D_08097730
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    bl         Scene_IsStartPressed
    beq        LAB_080975f4
    bl         S_Story_7D_SkipIfStart
LAB_080975f4:
    pop        {pc}


_nt S_Story_7D_3
    bl         FUN_080976cc
    mov        r0,#0x0
    mov        r1,#0x10
    neg        r1,r1
    lsl        r1,r1,#0xc
    mov        r2,#0x0
    bl         PlayerAnimation_Move
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08097626
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08097626:
    bl         Scene_IsStartPressed
    beq        LAB_08097630
    bl         S_Story_7D_SkipIfStart
LAB_08097630:
    pop        {pc}


_nt S_Story_7D_4
    bl         FUN_080976cc
    mov        r0,#0x0
    mov        r1,#0x10
    neg        r1,r1
    lsl        r1,r1,#0xc
    mov        r2,#0x0
    bl         PlayerAnimation_Move
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08097664
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08097664:
    pop        {pc}


_nt S_Story_7D_5
    push       {r5}
    bl         EnableBoundaryCheck
    bl         PlayerAnimation_Unlock
    bl         Flag_SetPlayerActive
    mov        r0,#0xea
    bl         Flag_SetBase
    mov        r7,r10
    ldr        r0,[r7,#0x2c]
    mov        r1,#0x1
    strb       r1,[r0,#0x10]
    mov        r1,#0x1
    strb       r1,[r0,#0x12]
    ldr        r1,PTR_MapEntrance_08097734
    str        r1,[r0,#0x14]
    mov        r0,#0x0
    bl         World_ChangeMap
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}

MapEntrance_08097698:
    MapEntrance Map_WWW_Rocket_Hanger, d_sw, f(36, 70, 0)


_ts S_Story_7D_SkipIfStart
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
    mov        r0,#0x10
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts FUN_080976cc
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
    bne        LAB_080976ee
    mov        r0,#0xd8
    bl         Sound_PlaySongImmediate
    mov        r0,#0x1e
    strb       r0,[r5,#0x7]
LAB_080976ee:
    ldrb       r0,[r5,#0xa]
    sub        r0,#0x1
    strb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_0809772a
    bl         Rng_RandomUint
    mov        r7,#0x7f
    and        r7,r0
    sub        r7,#0x3f
    mov        r1,#0x7c
    neg        r1,r1
    add        r1,r1,r7
    lsl        r1,r1,#0x10
    mov        r2,#0x54
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
LAB_0809772a:
    pop        {pc}

PTR_NPCList_803E614_0809772c:
    .word NPCList_803E614

PTR_ScenarioData_7D_08097730:
    .word ScenarioData_7D

PTR_MapEntrance_08097734:
    .word MapEntrance_08097698
