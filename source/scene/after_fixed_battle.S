#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


AfterBattleFlagSettings_ARRAY_08085870:
    @ Dialogue if win/lose
    .byte 0x16, 0x17
    @ Set/clear
    .byte 0, 0
    @ If win, set/clear
    .byte F_BATTLE_WIN_GUTSMAN_V1, 0
    @ If lose, set/clear
    .byte 0, F_BATTLE_GUTSMAN

    @ Dialogue if win/lose
    .byte 0x1F, 0x20
    @ Set/clear
    .byte 0, 0
    @ If win, set/clear
    .byte F_BATTLE_WIN_GUTSMAN_V1, 0
    @ If lose, set/clear
    .byte 0, F_BATTLE_GUTSMAN

    @ Dialogue if win/lose
    .byte 0x5C, 0x5D
    @ Set/clear
    .byte 0, 0
    @ If win, set/clear
    .byte F_BATTLE_WIN_GUTSMAN_V1, 0
    @ If lose, set/clear
    .byte 0, F_BATTLE_GUTSMAN

    @ Dialogue if win/lose
    .byte 0x2, 0x3
    @ Set/clear
    .byte 0, 0
    @ If win, set/clear
    .byte F_BATTLE_WIN_GUTSMAN_V1, F_BATTLE_GUTSMAN
    @ If lose, set/clear
    .byte 0, F_BATTLE_GUTSMAN

    @ Dialogue if win/lose
    .byte -1, -1
    @ Set/clear
    .byte 0, 0
    @ If win, set/clear
    .byte 0, 0
    @ If lose, set/clear
    .byte 0, 0

    @ Dialogue if win/lose
    .byte 0xD, 0x11
    @ Set/clear
    .byte 0, 0
    @ If win, set/clear
    .byte F_BATTLE_WIN_WOODMAN_V1, 0
    @ If lose, set/clear
    .byte 0, F_BATTLE_WOODMAN

    @ Dialogue if win/lose
    .byte 0x4, 0x5
    @ Set/clear
    .byte 0, 0
    @ If win, set/clear
    .byte F_BATTLE_WIN_SKULLMAN_V1, 0
    @ If lose, set/clear
    .byte 0, F_BATTLE_SKULLMAN

    @ Dialogue if win/lose
    .byte 0x55, 0x56
    @ Set/clear
    .byte 0, 0
    @ If win, set/clear
    .byte F_BATTLE_WIN_SHARKMAN_V1, 0
    @ If lose, set/clear
    .byte 0, F_BATTLE_SHARKMAN

    @ Dialogue if win/lose
    .byte 0xE, 0xF
    @ Set/clear
    .byte 0, 0
    @ If win, set/clear
    .byte F_BATTLE_WIN_NUMBERMAN_V2, 0
    @ If lose, set/clear
    .byte 0, F_BATTLE_NUMBERMAN

    @ Dialogue if win/lose
    .byte 0xE, 0xF
    @ Set/clear
    .byte 0, F_BATTLE_NUMBERMAN
    @ If win, set/clear
    .byte F_BATTLE_WIN_NUMBERMAN_V3, 0
    @ If lose, set/clear
    .byte 0, 0

    @ Dialogue if win/lose
    .byte 0x4B, 0x4C
    @ Set/clear
    .byte 0, 0
    @ If win, set/clear
    .byte F_BATTLE_WIN_ICEMAN_V2, 0
    @ If lose, set/clear
    .byte 0, F_BATTLE_ICEMAN

    @ Dialogue if win/lose
    .byte 0x4B, 0x4C
    @ Set/clear
    .byte 0, F_BATTLE_ICEMAN
    @ If win, set/clear
    .byte F_BATTLE_WIN_ICEMAN_V3, 0
    @ If lose, set/clear
    .byte 0, 0

    @ Dialogue if win/lose
    .byte 0x4, 0x5
    @ Set/clear
    .byte 0, 0
    @ If win, set/clear
    .byte F_BATTLE_WIN_SKULLMAN_V2, 0
    @ If lose, set/clear
    .byte 0, F_BATTLE_SKULLMAN

    @ Dialogue if win/lose
    .byte 0x4, 0x5
    @ Set/clear
    .byte 0, F_BATTLE_SKULLMAN
    @ If win, set/clear
    .byte F_BATTLE_WIN_SKULLMAN_V3, 0
    @ If lose, set/clear
    .byte 0, 0

    @ Dialogue if win/lose
    .byte 0xD, 0x11
    @ Set/clear
    .byte 0, 0
    @ If win, set/clear
    .byte F_BATTLE_WIN_WOODMAN_V2, 0
    @ If lose, set/clear
    .byte 0, F_BATTLE_WOODMAN

    @ Dialogue if win/lose
    .byte 0xD, 0x11
    @ Set/clear
    .byte 0, F_BATTLE_WOODMAN
    @ If win, set/clear
    .byte F_BATTLE_WIN_WOODMAN_V3, 0
    @ If lose, set/clear
    .byte 0, 0

    @ Dialogue if win/lose
    .byte 0x55, 0x56
    @ Set/clear
    .byte 0, 0
    @ If win, set/clear
    .byte F_BATTLE_WIN_SHARKMAN_V2, 0
    @ If lose, set/clear
    .byte 0, F_BATTLE_SHARKMAN

    @ Dialogue if win/lose
    .byte 0x55, 0x56
    @ Set/clear
    .byte F_BATTLE_WIN_SHARKMAN_V3, F_BATTLE_SHARKMAN
    @ If win, set/clear
    .byte F_BATTLE_WIN_SHARKMAN_V3, 0
    @ If lose, set/clear
    .byte 0, 0

    @ Dialogue if win/lose
    .byte 0xA4, 0xA5
    @ Set/clear
    .byte 0, F_BATTLE_GUTSMAN
    @ If win, set/clear
    .byte F_BATTLE_WIN_GUTSMAN_V2, 0
    @ If lose, set/clear
    .byte 0, 0

    @ Dialogue if win/lose
    .byte 0x56, 0x55
    @ Set/clear
    .byte 0, F_BATTLE_GUTSMAN
    @ If win, set/clear
    .byte F_BATTLE_WIN_GUTSMAN_V2, 0
    @ If lose, set/clear
    .byte 0, 0

    @ Dialogue if win/lose
    .byte -1, -1
    @ Set/clear
    .byte 0, F_BATTLE_STONEMAN
    @ If win, set/clear
    .byte F_DEFEATED_STONEMAN_V2, 0
    @ If lose, set/clear
    .byte 0, 0

    @ Dialogue if win/lose
    .byte 0x2, 0x3
    @ Set/clear
    .byte 0, 0
    @ If win, set/clear
    .byte F_BATTLE_WIN_GUTSMAN_V1, 0
    @ If lose, set/clear
    .byte 0, F_BATTLE_GUTSMAN

    @ Dialogue if win/lose
    .byte 0x27, 0x28
    @ Set/clear
    .byte 0, 0
    @ If win, set/clear
    .byte F_BATTLE_WIN_PROTOMAN_V2, 0
    @ If lose, set/clear
    .byte 0, F_BATTLE_PROTOMAN

    @ Dialogue if win/lose
    .byte -1, -1
    @ Set/clear
    .byte 0, 0
    @ If win, set/clear
    .byte 0, 0
    @ If lose, set/clear
    .byte 0, 0

    @ Dialogue if win/lose
    .byte 0x18, 0x19
    @ Set/clear
    .byte 0, 0
    @ If win, set/clear
    .byte F_BATTLE_WIN_NUMBERMAN_V2, 0
    @ If lose, set/clear
    .byte 0, F_BATTLE_NUMBERMAN

    @ Dialogue if win/lose
    .byte 0x18, 0x19
    @ Set/clear
    .byte 0, F_BATTLE_NUMBERMAN
    @ If win, set/clear
    .byte F_BATTLE_WIN_NUMBERMAN_V3, 0
    @ If lose, set/clear
    .byte 0, 0

    @ Dialogue if win/lose
    .byte 0x27, 0x28
    @ Set/clear
    .byte 0, F_BATTLE_PROTOMAN
    @ If win, set/clear
    .byte F_BATTLE_WIN_PROTOMAN_V3, 0
    @ If lose, set/clear
    .byte 0, 0

    @ Dialogue if win/lose
    .byte 0xE, 0xF
    @ Set/clear
    .byte 0, 0
    @ If win, set/clear
    .byte F_BATTLE_WIN_ICEMAN_V2, 0
    @ If lose, set/clear
    .byte 0, F_BATTLE_ICEMAN

    @ Dialogue if win/lose
    .byte 0xE, 0xF
    @ Set/clear
    .byte 0, F_BATTLE_ICEMAN
    @ If win, set/clear
    .byte F_BATTLE_WIN_ICEMAN_V3, 0
    @ If lose, set/clear
    .byte 0, 0

    @ Dialogue if win/lose
    .byte 0x19, 0x1A
    @ Set/clear
    .byte 0, 0
    @ If win, set/clear
    .byte F_BATTLE_WIN_PROTOMAN_V2, 0
    @ If lose, set/clear
    .byte 0, F_BATTLE_PROTOMAN

    @ Dialogue if win/lose
    .byte 0x19, 0x1A
    @ Set/clear
    .byte 0, F_BATTLE_PROTOMAN
    @ If win, set/clear
    .byte F_BATTLE_WIN_PROTOMAN_V3, 0
    @ If lose, set/clear
    .byte 0, 0

    @ Dialogue if win/lose
    .byte 0xB3, 0xB4
    @ Set/clear
    .byte 0, 0
    @ If win, set/clear
    .byte F_BATTLE_WIN_PROTOMAN_V2, 0
    @ If lose, set/clear
    .byte 0, F_BATTLE_PROTOMAN

    @ Dialogue if win/lose
    .byte 0xB3, 0xB4
    @ Set/clear
    .byte 0, F_BATTLE_PROTOMAN
    @ If win, set/clear
    .byte F_BATTLE_WIN_PROTOMAN_V3, 0
    @ If lose, set/clear
    .byte 0, 0

    @ Dialogue if win/lose
    .byte 0x22, 0x23
    @ Set/clear
    .byte 0, F_BATTLE_GUTSMAN
    @ If win, set/clear
    .byte F_BATTLE_WIN_GUTSMAN_V2, 0
    @ If lose, set/clear
    .byte 0, 0

    @ Dialogue if win/lose
    .byte 0x3A, 0x3B
    @ Set/clear
    .byte 0, F_BATTLE_GUTSMAN
    @ If win, set/clear
    .byte F_BATTLE_WIN_GUTSMAN_V2, 0
    @ If lose, set/clear
    .byte 0, 0

    .byte 0x08

    .align 2, 0



_ts Scene_AfterFixedBattle
    push       {lr}
    ldr        r0,PTR_PTR_S_AfterFixedBattle_0_08085a6c
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_S_AfterFixedBattle_0_0808599c:
    .word S_AfterFixedBattle_0
    .word S_AfterFixedBattle_1


_ts S_AfterFixedBattle_0
    push       {lr}
    push       {r5}
    bl         Flag_SetPlayerInactive
    pop        {r5}
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080859de
    push       {r5}
    LoadMain world, r7, r7
    ldrb       r7,[r7,#World_lastBattleResult]
    ldr        r6,PTR_AfterBattleFlagSettings_ARRAY_08085a70
    ldrb       r0,[r5,#Scene_dialogueIndex]
    lsl        r0,r0,#0x3
    add        r0,r0,r7
    add        r6,r6,r0
    ldrb       r0,[r6,#0x0]
    cmp        r0,#0xff
    beq        LAB_080859d6
    bl         Text_LoadAreaDialogue
LAB_080859d6:
    pop        {r5}
    Scene_Next
LAB_080859de:
    pop        {pc}


_ts S_AfterFixedBattle_1
    push       {lr}
    push       {r5}
    mov        r0,#TF_DialogueActive
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08085a68
    push       {r5}
    ldr        r6,PTR_AfterBattleFlagSettings_ARRAY_08085a74
    ldrb       r0,[r5,#Scene_dialogueIndex]
    lsl        r0,r0,#0x3
    add        r6,r6,r0
    ldrb       r0,[r6,#0x2]
    tst        r0,r0
    beq        LAB_08085a06
    push       {r6}
    bl         Flag_SetBase
    pop        {r6}
LAB_08085a06:
    ldrb       r0,[r6,#0x3]
    tst        r0,r0
    beq        LAB_08085a14
    push       {r6}
    bl         Flag_ClearBase
    pop        {r6}
LAB_08085a14:
    LoadMain world, r7, r7
    ldrb       r7,[r7,#World_lastBattleResult]
    tst        r7,r7
    bne        LAB_08085a3c
    ldrb       r0,[r6,#0x4]
    tst        r0,r0
    beq        LAB_08085a2c
    push       {r6}
    bl         Flag_SetBase
    pop        {r6}
LAB_08085a2c:
    ldrb       r0,[r6,#0x5]
    tst        r0,r0
    beq        LAB_08085a5a
    push       {r6}
    bl         Flag_ClearBase
    pop        {r6}
    b          LAB_08085a5a
LAB_08085a3c:
    ldrb       r0,[r6,#0x6]
    tst        r0,r0
    beq        LAB_08085a4a
    push       {r6}
    bl         Flag_SetBase
    pop        {r6}
LAB_08085a4a:
    ldrb       r0,[r6,#0x7]
    tst        r0,r0
    beq        LAB_08085a5a
    push       {r6}
    bl         Flag_ClearBase
    pop        {r6}
    b          LAB_08085a5a
LAB_08085a5a:
    bl         Text_DisableDialogue
    bl         Flag_SetPlayerActive
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
LAB_08085a68:
    pop        {pc}

    .align 2, 0


PTR_PTR_S_AfterFixedBattle_0_08085a6c:
    .word PTR_S_AfterFixedBattle_0_0808599c

PTR_AfterBattleFlagSettings_ARRAY_08085a70:
    .word AfterBattleFlagSettings_ARRAY_08085870

PTR_AfterBattleFlagSettings_ARRAY_08085a74:
    .word AfterBattleFlagSettings_ARRAY_08085870
