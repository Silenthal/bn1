#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


Cam_Set_08097738:
    cam_set -30, 80, 0
    cam_end

    .align 2, 0



_ts Scene_Story_7E
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_7E_0_08097750
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_PTR_S_Story_7E_0_08097750:
    .word PTR_S_Story_7E_0_08097754

PTR_S_Story_7E_0_08097754:
    .word S_Story_7E_0
    .word S_Story_7E_1
    .word S_Story_7E_2
    .word S_Story_7E_3
    .word S_Story_7E_4
    .word S_Story_7E_5
    .word S_Story_7E_6
    .word S_Story_7E_7


_ts S_Story_7E_0
    push       {r5}
    mov        r0,#0x10
    bl         PetStatusControl_SetState
    pop        {r5}
    bl         Flag_SetPlayerInactive
    bl         PlayerAnimation_Lock
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_nt S_Story_7E_1
    bl         PlayerAnimation_GetState
    cmp        r0,#0x2
    bne        LAB_080977ec
    push       {r5}
    mov        r0,#0xaa
    neg        r0,r0
    lsl        r0,r0,#0x10
    mov        r1,#0x1e
    neg        r1,r1
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    bl         DisableBoundaryCheck
    mov        r0,#0xf
    bl         PlayerAnimation_SetState
    pop        {r5}
    mov        r0,#0x93
    bl         Flag_ClearBase
    push       {r5}
    ldr        r7,PTR_NPCList_803E8D8_080979b8
    bl         Map_LoadNPCList
    pop        {r5}
    ldr        r0,PTR_Cam_Set_080979bc
    bl         SceneCamera_Init
    bl         SceneCamera_Main
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x1
    strb       r0,[r5,#0xa]
    strb       r0,[r5,#0x7]
    mov        r0,#0x3c
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080977ec:
    pop        {pc}


_nt S_Story_7E_2
    bl         FUN_08097950
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08097818
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_0809780e
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0809780e:
    bl         Scene_IsStartPressed
    beq        LAB_08097818
    bl         S_Story_7E_SkipIfStart
LAB_08097818:
    pop        {pc}


_nt S_Story_7E_3
    mov        r0,#0x5
    bl         FUN_08097950
    mov        r0,#0x93
    bl         Flag_SetBase
    push       {r5}
    ldr        r0,PTR_ScenarioData_7E_080979c0
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    bl         Scene_IsStartPressed
    beq        LAB_08097842
    bl         S_Story_7E_SkipIfStart
LAB_08097842:
    pop        {pc}


_ts S_Story_7E_4
    mov        r0,#0x5
    bl         FUN_08097950
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08097872
    push       {r5}
    mov        r0,#0x2
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0xe6
    bl         Sound_PlaySongImmediate
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    mov        r0,#0x50
    strb       r0,[r5,#0x8]
LAB_08097872:
    bl         Scene_IsStartPressed
    beq        LAB_0809787c
    bl         S_Story_7E_SkipIfStart
LAB_0809787c:
    pop        {pc}


_nt S_Story_7E_5
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080978c6
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_080978c6
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x10]
    ldr        r1,DAT_080979c4
    strh       r1,[r0,#0x0]
    bl         Video_InitPaletteColor0
    bl         Video_ClearAllTile0Maps
    bl         Video_ClearScreen
    bl         BgUpdate_Init
    bl         InitBgTask
    pop        {r5}
    push       {r5}
    mov        r0,#0x1
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080978c6:
    pop        {pc}


_ts S_Story_7E_6
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080978e8
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080978e8:
    pop        {pc}


_nt S_Story_7E_7
    push       {r5}
    bl         EnableBoundaryCheck
    bl         PlayerAnimation_Unlock
    bl         Flag_SetPlayerActive
    mov        r0,#0xeb
    bl         Flag_SetBase
    mov        r7,r10
    ldr        r0,[r7,#0x2c]
    mov        r1,#0x1
    strb       r1,[r0,#0x10]
    mov        r1,#0x1
    strb       r1,[r0,#0x12]
    ldr        r1,PTR_MapEntrance_080979c8
    str        r1,[r0,#0x14]
    mov        r0,#0x0
    bl         World_ChangeMap
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}

MapEntrance_0809791c:
    MapEntrance Map_ACDC_Town, d_sw, f(36, 70, 0)


_ts S_Story_7E_SkipIfStart
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
    mov        r0,#0x18
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts FUN_08097950
    push       {lr}
    push       {r0}
    push       {r5}
    mov        r0,#0x1
    mov        r1,#0x1
    bl         Camera_EnableScreenShake
    pop        {r5}
    ldrb       r0,[r5,#0x7]
    sub        r0,#0x1
    strb       r0,[r5,#0x7]
    tst        r0,r0
    bne        LAB_08097974
    mov        r0,#0xd8
    bl         Sound_PlaySongImmediate
    mov        r0,#0x1e
    strb       r0,[r5,#0x7]
LAB_08097974:
    ldrb       r0,[r5,#0xa]
    sub        r0,#0x1
    strb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_080979b2
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
    pop        {r0}
    strb       r0,[r5,#0xa]
    pop        {pc}
LAB_080979b2:
    pop        {r0}
    pop        {pc}

    .align 2, 0


PTR_NPCList_803E8D8_080979b8:
    .word NPCList_803E8D8

PTR_Cam_Set_080979bc:
    .word Cam_Set_08097738

PTR_ScenarioData_7E_080979c0:
    .word ScenarioData_7E

DAT_080979c4:
    .word 0xF40

PTR_MapEntrance_080979c8:
    .word MapEntrance_0809791c
