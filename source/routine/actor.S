#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts R_Actor_1_0_Spawn
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Actor_1_0_0_ResetAnim_0805611c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0

PTR_PTR_R_Actor_1_0_0_ResetAnim_0805611c:
    .word PTR_R_Actor_1_0_0_ResetAnim_08056120

PTR_R_Actor_1_0_0_ResetAnim_08056120:
    .word R_Actor_1_0_0_ResetAnim
    .word R_Actor_1_0_1_StartAnimSpawn
    .word R_Actor_1_0_2_WaitForBattleStart


_ts R_Actor_1_0_0_ResetAnim
    push       {lr}
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r5,#0x0]
    bl         Battle_PriorityQueueIsEntityNext
    tst        r0,r0
    beq        LAB_0805614c
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    bl         ResetBattleSpawnAnimationState
    mov        r0,#0x92
    bl         Sound_PlaySE
LAB_0805614c:
    pop        {pc}


_nt R_Actor_1_0_1_StartAnimSpawn
    push       {lr}
    bl         BattleSpawnAnimation_Main
    tst        r0,r0
    bne        LAB_08056160
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
    bl         Battle_PriorityQueueRemove
LAB_08056160:
    pop        {pc}


_nt R_Actor_1_0_2_WaitForBattleStart
    push       {lr}
    bl         Battle_GetEntryState
    mov        r1,#0x8
    tst        r0,r1
    bne        LAB_08056176
    ldrb       r0,[r5,#0xb]
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08056176:
    pop        {pc}


_ts R_Drone_1_0_Spawn
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Drone_1_0_0_ResetAnim_08056188
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0

PTR_PTR_R_Drone_1_0_0_ResetAnim_08056188:
    .word PTR_R_Drone_1_0_0_ResetAnim_0805618c

PTR_R_Drone_1_0_0_ResetAnim_0805618c:
    .word R_Drone_1_0_0_ResetAnim
    .word R_Drone_1_0_1_StartAnim
    .word R_Actor_1_0_2_WaitForBattleStart


_ts R_Drone_1_0_0_ResetAnim
    push       {lr}
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r5,#0x0]
    ldrb       r0,[r5,#0x4]
    lsr        r0,r0,#0x8
    bcs        LAB_080561b0
    bl         Battle_PriorityQueueIsEntityNext
    tst        r0,r0
    beq        LAB_080561be
LAB_080561b0:
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    bl         ResetBattleSpawnAnimationState
    mov        r0,#0x92
    bl         Sound_PlaySE
LAB_080561be:
    pop        {pc}


_ts R_Drone_1_0_1_StartAnim
    push       {lr}
    bl         BattleSpawnAnimation_Main
    tst        r0,r0
    bne        LAB_080561d8
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
    ldrb       r0,[r5,#0x4]
    lsr        r0,r0,#0x8
    bcs        LAB_080561da
    bl         Battle_PriorityQueueRemove
LAB_080561d8:
    pop        {pc}
LAB_080561da:
    LoadMain battle, r7, r7
    ldrb       r0,[r7,#0x7]
    sub        r0,#0x1
    strb       r0,[r7,#0x7]
    pop        {pc}


_nt R_BigSnakeBody_1_0
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_BigSnakeBody_1_0_0_080561f4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_BigSnakeBody_1_0_0_080561f4:
    .word PTR_R_BigSnakeBody_1_0_0_080561f8

PTR_R_BigSnakeBody_1_0_0_080561f8:
    .word R_BigSnakeBody_1_0_0
    .word R_BigSnakeBody_1_0_1
    .word R_Actor_1_0_2_WaitForBattleStart


_ts R_BigSnakeBody_1_0_0
    push       {lr}
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    bl         ResetBattleSpawnAnimationState
    pop        {pc}


_ts R_BigSnakeBody_1_0_1
    push       {lr}
    bl         BattleSpawnAnimation_Main
    tst        r0,r0
    bne        LAB_08056230
    LoadMain battle, r7, r7
    ldrb       r0,[r7,#0x7]
    sub        r0,#0x1
    strb       r0,[r7,#0x7]
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
LAB_08056230:
    pop        {pc}

    .align 2, 0
