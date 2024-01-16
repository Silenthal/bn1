#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


.set Battle_InitPlayer, 0x800504c
.set Battle_AreAllSpritesSpawned, 0x8006a0c
.set Battle_DrawEnemyHP, 0x807bbcc
.set Battle_DrawPlayerHand, 0x807c152
.set BattleR_PauseTimer, 0x80069f0
.set BattleMessage_Disable, 0x8017954

    .text


_nt Battle_Regular
    push       {lr}
    ldr        r0,=PTR_BattleR_0_SpawnPlayerWithHP
    ldrb       r1,[r5,#0x1]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0
PTR_BattleR_0_SpawnPlayerWithHP:
    .word BattleR_0_SpawnPlayerWithHP
    .word BattleR_1_HandleCustomScreen
    .word BattleR_2_BattleStart

    .pool


_nt BattleR_0_SpawnPlayerWithHP
    push       {lr}
    ldr        r7,=PTR_BattleR_1_0_0_SpawnPlayer
    ldrb       r0,[r5,#0x2]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0
PTR_BattleR_1_0_0_SpawnPlayer:
    .word BattleR_1_0_0_SpawnPlayer
    .word BattleR_1_0_1_DrawHP

    .pool


_nt BattleR_1_0_0_SpawnPlayer
    push       {lr}
    mov        r7,r10
    ldr        r7,[r7,#0x18]
    ldrb       r0,[r7,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08006c42
    push       {r5}
    bl         Battle_InitPlayer
    pop        {r5}
    mov        r0,#0x8
    strb       r0,[r5,#0x8]
    mov        r0,#0x4
    strb       r0,[r5,#0x2]
LAB_08006c42:
    pop        {pc}


_nt BattleR_1_0_1_DrawHP
    push       {lr}
    bl         Battle_AreAllSpritesSpawned
    tst        r0,r0
    beq        LAB_08006c78
    mov        r0,#0x0
    strb       r0,[r5,#0x6]
    strb       r0,[r5,#0x7]
    bl         Battle_SetState_EnemySpawned
    bl         Battle_DrawEnemyHP
    bl         Battle_DrawPlayerHand
    mov        r0,#0x1
    strb       r0,[r5,#0x8]
    bl         BattleR_PauseTimer
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
    push       {r5}
    bl         BattleUi_InitHpDisplay
    pop        {r5}
LAB_08006c78:
    pop        {pc}


_nt BattleR_1_HandleCustomScreen
    push       {lr}
    ldr        r7,=PTR_BattleR_1_0_LoadCustomScreenUI
    ldrb       r0,[r5,#0x2]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0
PTR_BattleR_1_0_LoadCustomScreenUI:
    .word BattleR_1_0_LoadCustomScreenUI
    .word BattleR_1_1_CustomScreen
    .word BattleR_1_2_Wait
    .word BattleR_1_3_Wait2

    .pool


_nt BattleR_1_0_LoadCustomScreenUI
    push       {lr}
    mov        r0,#0x0
    strh       r0,[r5,#0x3e]
    push       {r5}
    bl         BattleUi_LoadCustomGaugeTileMap
    bl         BattleUi_ClearActiveChip
    bl         CustomScreen_LoadUIUpper
    bl         CustomScreen_EnableInput
    pop        {r5}
    bl         Battle_ClearState_InBattle
    mov        r0,#0x4
    strb       r0,[r5,#0x2]
    pop        {pc}


_nt BattleR_1_1_CustomScreen
    push       {lr}
    push       {r5}
    bl         CustomScreen_Main
    pop        {r5}
    tst        r0,r0
    bne        LAB_08006cd6
    mov        r0,#0x1e
    strh       r0,[r5,#0x2e]
    mov        r0,#0x8
    strb       r0,[r5,#0x2]
LAB_08006cd6:
    pop        {pc}


_nt BattleR_1_2_Wait
    push       {lr}
    ldrh       r0,[r5,#0x2e]
    sub        r0,#0x1
    strh       r0,[r5,#0x2e]
    bne        LAB_08006cea
    mov        r0,#0xa
    strh       r0,[r5,#0x2e]
    mov        r0,#0xc
    strb       r0,[r5,#0x2]
LAB_08006cea:
    pop        {pc}


_nt BattleR_1_3_Wait2
    ldrh       r0,[r5,#0x2e]
    sub        r0,#0x1
    strh       r0,[r5,#0x2e]
    bne        LAB_08006cfe
    mov        r0,#0x8
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strb       r0,[r5,#0x2]
    strb       r0,[r5,#0x3]
LAB_08006cfe:
    pop        {pc}


_nt BattleR_2_BattleStart
    push       {lr}
    bl         BattleR_2_Main
    cmp        r0,#0x3
    bne        LAB_08006d14
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
    b          LAB_08006d40
LAB_08006d14:
    cmp        r0,#0x1
    bne        LAB_08006d1c
    mov        r1,#0x0
    b          LAB_08006d22
LAB_08006d1c:
    cmp        r0,#0x2
    bne        LAB_08006d40
    mov        r1,#0x4
LAB_08006d22:
    mov        r0,#0x8
    strb       r0,[r5,#0x0]
    strb       r1,[r5,#0x1]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
    push       {r5}
    bl         BattleMessage_Disable
    bl         BattleUi_ClearHpDisplay
    bl         BattleUi_LoadCustomGaugeTileMap
    bl         BattleUi_ClearActiveChip
    pop        {r5}
LAB_08006d40:
    pop        {pc}

    .align 2, 0

.end
