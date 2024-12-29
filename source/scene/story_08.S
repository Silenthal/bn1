#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    cam_end

    .align 2, 0


_ts Scene_Story_08
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_08_0_08084358
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_S_Story_08_0_08084264:
    .word S_Story_08_0
    .word S_Story_08_1
    .word S_Story_08_2
    .word S_Story_08_3


_ts S_Story_08_0
    push       {lr}
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}

    .align 2, 0



_ts S_Story_08_1
    push       {lr}
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_080842b8
    push       {r5}
    LoadMain world, r0, r0
    ldr        r0,[r0,#0x28]
    ldrb       r0,[r0,#0x14]
    mov        r1,#0x7
    and        r0,r1
    bl         PlayerAnimation_SetState
    ldr        r0,PTR_ScenarioData_08_0808435c
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080842b8:
    pop        {pc}

    .align 2, 0



_ts S_Story_08_2
    push       {lr}
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_080842e6
    push       {r5}
    mov        r0,#0x2
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    bl         Sound_StopAllMusic
    mov        r0,#0xc7
    bl         Sound_PlaySongImmediate
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080842e6:
    bl         Scene_IsStartPressed
    beq        LAB_080842f0
    bl         S_Story_08_SkipIfStart
LAB_080842f0:
    pop        {pc}

    .align 2, 0



_ts S_Story_08_3
    push       {lr}
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08084332
    push       {r5}
    bl         Text_DisableDialogue
    mov        r0,#0x2
    bl         Flag_ClearSystem
    mov        r0,#0x9f
    bl         Flag_SetBase
    bl         PlayerAnimation_Unlock
    ldr        r0,PTR_EnemySpawn_08084360
    bl         Battle_GetRandomEncounter
    mov        r0,#0x1
    mov        r1,#0x0
    mov        r2,#0x0
    mov        r4,#0x1
    mov        r6,#0x0
    bl         World_SetBattleParams
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
LAB_08084332:
    pop        {pc}


_ts S_Story_08_SkipIfStart
    push       {lr}
    push       {r5}
    mov        r0,#0x2
    mov        r1,#0x8
    bl         Fade_Request
    bl         Sound_StopAllMusic
    mov        r0,#0xc7
    bl         Sound_PlaySongImmediate
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0xc
    strb       r0,[r5,#0x0]
    pop        {pc}

PTR_PTR_S_Story_08_0_08084358:
    .word PTR_S_Story_08_0_08084264

PTR_ScenarioData_08_0808435c:
    .word ScenarioData_08

PTR_EnemySpawn_08084360:
    .word EnemySpawn_0800b238
