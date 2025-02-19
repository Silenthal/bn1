#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Scene_Rocket_Comp_LifeVirus
    push       {lr}
    ldr        r0,PTR_PTR_S_Rocket_Comp_LifeVirus_0_080981e4
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_S_Rocket_Comp_LifeVirus_0_080980a8:
    .word S_Rocket_Comp_LifeVirus_0
    .word S_Rocket_Comp_LifeVirus_1
    .word S_Rocket_Comp_LifeVirus_2
    .word S_Rocket_Comp_LifeVirus_3
    .word S_Rocket_Comp_LifeVirus_4


_ts S_Rocket_Comp_LifeVirus_0
    push       {lr}
    bl         Sound_StopAllMusic
    push       {r5}
    bl         PlayerAnimation_Lock
    bl         Flag_SetPlayerInactive
    pop        {r5}
    push       {r5}
    FadeOut_Black
    pop        {r5}
    Scene_Next
    pop        {pc}


_nt S_Rocket_Comp_LifeVirus_1
    push       {lr}
    bl         PlayerAnimation_GetState
    cmp        r0,#0x2
    bne        LAB_08098118
    push       {r5}
    mov        r0,#0x2e
    bl         PlayerAnimation_SetState
    pop        {r5}
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08098118
    push       {r5}
    FadeIn_Black
    pop        {r5}
    mov        r0,#0x2d
    strb       r0,[r5,#Scene_sceneTimer]
    Scene_Next
LAB_08098118:
    pop        {pc}


_nt S_Rocket_Comp_LifeVirus_2
    push       {lr}
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0809814c
    ldrb       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    tst        r0,r0
    bne        LAB_08098142
    push       {r5}
    mov        r0,#0x0
    bl         Text_LoadAreaDialogue
    pop        {r5}
    Scene_Next
LAB_08098142:
    bl         Scene_IsStartPressed
    beq        LAB_08098180
    bl         S_Rocket_Comp_LifeVirus_SkipIfStart
LAB_0809814c:
    pop        {pc}


_nt S_Rocket_Comp_LifeVirus_3
    push       {lr}
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08098176
    push       {r5}
    FadeOut_White
    pop        {r5}
    mov        r0,#0xc7
    bl         Sound_PlaySE
    Scene_Next
    pop        {pc}
LAB_08098176:
    bl         Scene_IsStartPressed
    beq        LAB_08098180
    bl         S_Rocket_Comp_LifeVirus_SkipIfStart
LAB_08098180:
    pop        {pc}


_nt S_Rocket_Comp_LifeVirus_4
    push       {lr}
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080981c2
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    push       {r5}
    bl         PlayerAnimation_Unlock
    bl         Flag_SetPlayerActive
    pop        {r5}
    ldr        r0,PTR_EnemySpawn_LifeVirus_080981e8
    bl         Battle_SetEncounter
    mov        r0,#0x10
    mov        r1,#0x6
    mov        r2,#0x0
    mov        r4,#0x1
    mov        r6,#0x1
    bl         World_SetBattleParams
    bl         Scene_UnloadAndResetStepCounter
LAB_080981c2:
    pop        {pc}


_ts S_Rocket_Comp_LifeVirus_SkipIfStart
    push       {r5}
    FadeOut_White
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0xc7
    bl         Sound_PlaySE
    mov        r0,#0x10
    strb       r0,[r5,#Scene_state_s0]
    pop        {pc}

    .align 2, 0


PTR_PTR_S_Rocket_Comp_LifeVirus_0_080981e4:
    .word PTR_S_Rocket_Comp_LifeVirus_0_080980a8

PTR_EnemySpawn_LifeVirus_080981e8:
    .word EnemySpawn_LifeVirus
