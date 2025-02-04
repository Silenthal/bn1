#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


Cam_Set_08085100:
    cam_end


_ts Scene_TutorialBattle
    push       {lr}
    ldr        r0,PTR_PTR_S_TutorialBattle_0_0808529c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_S_TutorialBattle_0_08085114:
    .word S_TutorialBattle_0
    .word S_TutorialBattle_1
    .word S_TutorialBattle_2
    .word S_TutorialBattle_3


_ts S_TutorialBattle_0
    push       {lr}
    push       {r5}
    bl         Flag_SetPlayerInactive
    pop        {r5}
    mov        r0,#0xcb
    mov        r1,#0x0
    mov        r2,#0x0
LAB_08085134:
    push       {r0,r1,r2,r5}
    bl         Flag_GetBase
    pop        {r0,r1,r2,r5}
    beq        LAB_08085140
    add        r1,#0x1
LAB_08085140:
    add        r0,#0x1
    add        r2,#0x1
    cmp        r2,#0x3
    blt        LAB_08085134
    LoadMain world, r7, r7
    ldrb       r7,[r7,#0x10]
    tst        r7,r7
    bne        LAB_08085164
    push       {r1,r5,r7}
    mov        r0,#0xcb
    add        r0,r0,r1
    bl         Flag_SetBase
    pop        {r1,r5,r7}
    add        r2,r1,#0x1
    strb       r2,[r5,#0x10]
    b          LAB_08085166
LAB_08085164:
    strb       r1,[r5,#0x10]
LAB_08085166:
    push       {r5}
    ldr        r0,PTR_ScenarioData_03_080852a0
    lsl        r1,r1,#0x1
    ldr        r2,PTR_DAT_080852a4
    add        r1,r1,r7
    ldrb       r1,[r2,r1]
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}

DAT_08085180:
    .byte 0x0A
    .byte 0x05
    .byte 0x14
    .byte 0x0F
    .byte 0x1E
    .byte 0x19

    .align 2, 0



_ts S_TutorialBattle_1
    push       {lr}
    bl         Scene_IsStartPressed
    beq        LAB_0808519c
    push       {r5}
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    b          LAB_080851a8
LAB_0808519c:
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_080851d4
LAB_080851a8:
    push       {r5}
    mov        r0,#0x2
    mov        r1,#0x8
    bl         Fade_Request
    Flag_GetBase 0xCD
    pop        {r5}
    bne        LAB_080851ce
    bl         Sound_StopAllMusic
    mov        r0,#0xc7
    bl         Sound_PlaySE
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    b          LAB_080851d4
LAB_080851ce:
    ldrb       r0,[r5,#0x0]
    add        r0,#0x8
    strb       r0,[r5,#0x0]
LAB_080851d4:
    pop        {pc}

    .align 2, 0



_ts S_TutorialBattle_2
    push       {lr}
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808521c
    push       {r5}
    bl         Flag_SetPlayerActive
    bl         Text_DisableDialogue
    pop        {r5}
    ldr        r7,PTR_TutorialBattleOptions_ARRAY_080852a8
    ldrb       r1,[r5,#0x10]
    lsl        r1,r1,#0x4
    add        r7,r7,r1
    push       {r5,r7}
    ldr        r0,[r7,#0x0]
    bl         Battle_SetEncounter
    pop        {r5,r7}
    push       {r5}
    mov        r0,#0x0
    ldr        r1,[r7,#0x4]
    ldr        r2,[r7,#0x8]
    ldr        r3,[r7,#0xc]
    mov        r4,#0x0
    mov        r6,#0x1
    bl         World_SetBattleParams
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
LAB_0808521c:
    pop        {pc}

    .align 2, 0


TutorialBattleOptions_ARRAY_08085220:
    tutorial_battle EnemySpawn_Tutorial_1, folderTutorial1, 1, False
    tutorial_battle EnemySpawn_Tutorial_2, folderTutorial2, 2, False
    tutorial_battle EnemySpawn_Tutorial_3, 0, 4, True


_ts S_TutorialBattle_3
    push       {lr}
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808528a
    push       {r5}
    bl         Flag_SetPlayerActive
    Flag_ClearSystem F_SYSTEM_NO_START_MENU
    Flag_ClearSystem F_SYSTEM_NO_RANDOM_BATTLES
    bl         Text_DisableDialogue
    ldr        r0,PTR_MapEntrance_080852ac
    mov        r1,#0x0
    bl         World_SetTransitionLocation
    pop        {r5}
    LoadMain world, r7, r7
    mov        r0,#0x2
    strb       r0,[r7,#0x6]
    bl         Scene_UnloadAndResetStepCounter
LAB_0808528a:
    pop        {pc}

MapEntrance_0808528c:
    MapEntrance Map_School_Class_5A, d_s, f(34, -3, 0)

PTR_PTR_S_TutorialBattle_0_0808529c:
    .word PTR_S_TutorialBattle_0_08085114

PTR_ScenarioData_03_080852a0:
    .word ScenarioData_03

PTR_DAT_080852a4:
    .word DAT_08085180

PTR_TutorialBattleOptions_ARRAY_080852a8:
    .word TutorialBattleOptions_ARRAY_08085220

PTR_MapEntrance_080852ac:
    .word MapEntrance_0808528c
