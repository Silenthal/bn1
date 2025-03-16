#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


Cam_Set_080866c0:
    cam_set 48, -16, 0
    cam_move -512, 512, 0, 6
    cam_move -256, 256, 0, 3
    cam_move -128, 128, 0, 2
    cam_wait 60
    cam_end


_ts Scene_Story_13
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_13_0_08086a30
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_13_0_080866f8:
    .word S_Story_13_0
    .word S_Story_13_1
    .word S_Story_13_2
    .word S_Story_13_3
    .word S_Story_13_4
    .word S_Story_13_5
    .word S_Story_13_6
    .word S_Story_13_7
    .word S_Story_13_8
    .word S_Story_13_9
    .word S_Story_13_10
    .word S_Story_13_11
    .word S_Story_13_12


_ts S_Story_13_0
    push       {r5}
    mov        r0,#TF_DialogueActive
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08086752
    push       {r5}
    bl         Flag_SetPlayerInactive
    FadeOutFast_Black
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#Scene_isAnimating]
    Scene_Next
LAB_08086752:
    pop        {pc}


_ts S_Story_13_1
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808678c
    push       {r5}
    mov        r0,#0x11
    bl         Entity_FreeAllMultiple
    ldr        r7,PTR_PTR_DAT_08086a34
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    FadeInFast_Black
    pop        {r5}
    ldr        r0,PTR_Cam_Set_08086a38
    bl         SceneCamera_Init
    mov        r0,#0x28
    strb       r0,[r5,#0x14]
    Scene_Next
LAB_0808678c:
    pop        {pc}


_nt S_Story_13_2
    bl         SceneCamera_Main
    cmp        r0,#0x1
    beq        LAB_080867cc
    ldrb       r0,[r5,#0x14]
    sub        r0,#0x1
    strb       r0,[r5,#0x14]
    bne        S_Story_13_SkipIfStart
    push       {r5}
    ldr        r0,PTR_ScenarioData_13_08086a3c
    mov        r1,#0x0
    @@ "I'd like to begin the first class, huh."
    bl         Text_LoadDialogue
    pop        {r5}
    mov        r0,#0x9
    bl         NPC_FindByIndex
    str        r0,[r5,#0x18]
    mov        r0,#0x14
    str        r0,[r5,#0x1C]
    Scene_Next


_ts S_Story_13_SkipIfStart
    bl         Scene_IsStartPressed
    beq        LAB_080867cc
    mov        r0,#T_Incident_Occurrence
    bl         Sound_PlayBGM
    mov        r0,#0x28
    strb       r0,[r5,#Scene_state_s0]
LAB_080867cc:
    pop        {pc}


_nt S_Story_13_3
    push       {r5}
    mov        r0,#TF_DialogueActive
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_080867ea
    push       {r5}
    Flag_SetBase 0x96
    pop        {r5}
    Scene_Next
LAB_080867ea:
    b          S_Story_13_SkipIfStart


_ts S_Story_13_4
    ldrb       r0,[r5,#Scene_state_s1]
    cmp        r0,#0x1
    beq        LAB_0808680c
    cmp        r0,#0x2
    beq        LAB_0808682c
    ldr        r0,[r5,#0x18]
    ldrb       r1,[r0,#0x14]
    cmp        r1,#0xc
    bne        LAB_0808682c
    ldrh       r1,[r0,#0x20]
    cmp        r1,#0x1f
    bne        LAB_0808682c
    mov        r1,#0x1
    strb       r1,[r5,#Scene_state_s1]
    bl         FUN_080869f8
LAB_0808680c:
    ldr        r1,[r5,#0x1C]
    sub        r1,#0x1
    str        r1,[r5,#0x1C]
    cmp        r1,#0x10
    bne        LAB_08086820
    push       {r1}
    mov        r0,#0x84
    bl         Sound_PlaySE
    pop        {r1}
LAB_08086820:
    tst        r1,r1
    bne        LAB_0808682c
    mov        r1,#0x2
    strb       r1,[r5,#Scene_state_s1]
    bl         FUN_08086a22
LAB_0808682c:
    push       {r5}
    Flag_GetBase 0x97
    pop        {r5}
    beq        LAB_0808684a
    push       {r5}
    ldr        r0,PTR_ScenarioData_13_08086a3c
    mov        r1,#0x9
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
LAB_0808684a:
    b          S_Story_13_SkipIfStart


_ts S_Story_13_5
    push       {r5}
    Flag_GetBase 0x98
    pop        {r5}
    beq        LAB_0808685e
    Scene_Next
LAB_0808685e:
    b          S_Story_13_SkipIfStart


_ts S_Story_13_6
    push       {r5}
    Flag_GetBase 0x99
    pop        {r5}
    beq        LAB_08086882
    bl         Sound_StopAllMusic
    push       {r5}
    ldr        r0,PTR_ScenarioData_13_08086a3c
    mov        r1,#0xa
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
LAB_08086882:
    b          S_Story_13_SkipIfStart


_ts S_Story_13_7
    push       {r5}
    mov        r0,#TF_DialogueActive
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_080868b6
    mov        r0,#0x3c
    strb       r0,[r5,#0x14]
    push       {r5}
    ldr        r0,PTR_BgTask_School_TilesetBlackboardEvent_08086a40
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_School_PaletteBlackboardOn_08086a44
    bl         BgTask_AddNew
    pop        {r5}
    mov        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    mov        r0,#0x0
    strb       r0,[r5,#Scene_counter]
    mov        r0,#0x1
    str        r0,[r5,#Scene_isAnimating]
    Scene_Next
LAB_080868b6:
    b          S_Story_13_SkipIfStart


_ts S_Story_13_8
    ldrb       r0,[r5,#Scene_counter]
    cmp        r0,#0x3
    beq        LAB_080868d8
    ldrb       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    tst        r0,r0
    bne        LAB_080868d8
    mov        r0,#0x36
    strb       r0,[r5,#Scene_sceneTimer]
    ldrb       r0,[r5,#Scene_counter]
    add        r0,#0x1
    strb       r0,[r5,#Scene_counter]
    mov        r0,#0xd1
    bl         Sound_PlaySE
LAB_080868d8:
    ldrb       r0,[r5,#0x14]
    sub        r0,#0x1
    strb       r0,[r5,#0x14]
    bne        LAB_080868f8
    mov        r0,#T_Incident_Occurrence
    bl         Sound_PlayBGM
    push       {r5}
    ldr        r0,PTR_ScenarioData_13_08086a3c
    mov        r1,#0xb
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
LAB_080868f8:
    b          S_Story_13_SkipIfStart


_nt S_Story_13_9
    ldrb       r0,[r5,#Scene_counter]
    cmp        r0,#0x3
    beq        LAB_0808691a
    ldrb       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    tst        r0,r0
    bne        LAB_0808691a
    mov        r0,#0x36
    strb       r0,[r5,#Scene_sceneTimer]
    ldrb       r0,[r5,#Scene_counter]
    add        r0,#0x1
    strb       r0,[r5,#Scene_counter]
    mov        r0,#0xd1
    bl         Sound_PlaySE
LAB_0808691a:
    push       {r5}
    mov        r0,#TF_DialogueActive
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808692c
    Scene_Next
LAB_0808692c:
    b          S_Story_13_SkipIfStart


_nt S_Story_13_10
    ldrb       r0,[r5,#Scene_counter]
    cmp        r0,#0x3
    beq        LAB_0808694e
    ldrb       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    tst        r0,r0
    bne        LAB_0808694e
    mov        r0,#0x36
    strb       r0,[r5,#Scene_sceneTimer]
    ldrb       r0,[r5,#Scene_counter]
    add        r0,#0x1
    strb       r0,[r5,#Scene_counter]
    mov        r0,#0xd1
    bl         Sound_PlaySE
LAB_0808694e:
    push       {r5}
    FadeOutFast_Black
    pop        {r5}
    Scene_Next
    pop        {pc}


_nt S_Story_13_11
    push       {r5}
    mov        r0,#TF_DisableInput
    bl         Text_EnableOption
    pop        {r5}
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808699c
    ldr        r0,[r5,#Scene_isAnimating]
    tst        r0,r0
    bne        LAB_0808698e
    push       {r5}
    ldr        r0,PTR_BgTask_School_TilesetBlackboardEvent_08086a48
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_School_PaletteBlackboardOn_08086a4c
    bl         BgTask_AddNew
    pop        {r5}
LAB_0808698e:
    push       {r5}
    bl         Text_DisableDialogue
    pop        {r5}
    Scene_Next
LAB_0808699c:
    pop        {pc}


_nt S_Story_13_12
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080869e6
    push       {r5}
    mov        r0,#TF_DisableInput
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    mov        r0,#0x10
    bl         Entity_FreeAllMultiple
    Flag_SetBase 0x9A
    bl         Flag_SetPlayerActive
    pop        {r5}
    push       {r5}
    LoadMain mapChange, r0, r7
    mov        r1,#0x1
    strb       r1,[r0,#MapChange_type]
    mov        r1,#0x1
    strb       r1,[r0,#MapChange_destinationIndex]
    ldr        r1,PTR_MapEntrance_08086a50
    str        r1,[r0,#MapChange_destinationList]
    mov        r0,#0x0
    bl         World_ChangeMap
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
LAB_080869e6:
    pop        {pc}

MapEntrance_080869e8:
    MapEntrance Map_School_Class_5A, d_s, f(0, -28, 0)


_ts FUN_080869f8
    push       {lr}
    ldr        r1,[r0,#0x24]
    ldr        r2,[r0,#0x28]
    ldr        r3,[r0,#0x2c]
    mov        r4,#0x6
    neg        r4,r4
    lsl        r4,r4,#0x10
    add        r1,r1,r4
    add        r2,r2,r4
    mov        r4,#0x2d
    lsl        r4,r4,#0x10
    add        r3,r3,r4
    push       {r5}
    mov        r0,#0x1
    mov        r4,#0xf
    bl         Effect_Alloc
    add        r0,r5,#0x0
    pop        {r5}
    str        r0,[r5,#Scene_sceneArg]
    pop        {pc}


_nt FUN_08086a22
    push       {lr}
    push       {r5}
    ldr        r5,[r5,#Scene_sceneArg]
    bl         Effect_Free
    pop        {r5}
    pop        {pc}

PTR_PTR_S_Story_13_0_08086a30:
    .word PTR_S_Story_13_0_080866f8

PTR_PTR_DAT_08086a34:
    .word NPCList_8028CB0

PTR_Cam_Set_08086a38:
    .word Cam_Set_080866c0

PTR_ScenarioData_13_08086a3c:
    .word ScenarioData_13

PTR_BgTask_School_TilesetBlackboardEvent_08086a40:
    .word BgTask_School_TilesetBlackboardEvent

PTR_BgTask_School_PaletteBlackboardOn_08086a44:
    .word BgTask_School_PaletteBlackboardOn

PTR_BgTask_School_TilesetBlackboardEvent_08086a48:
    .word BgTask_School_TilesetBlackboardEvent

PTR_BgTask_School_PaletteBlackboardOn_08086a4c:
    .word BgTask_School_PaletteBlackboardOn

PTR_MapEntrance_08086a50:
    .word MapEntrance_080869e8
