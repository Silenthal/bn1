#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


Cam_Set_08093370:
    cam_set 44, -114, 0
    cam_end


_ts Scene_Story_68
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_68_0_080935ec
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_68_0_08093388:
    .word S_Story_68_0
    .word S_Story_68_1
    .word S_Story_68_2
    .word S_Story_68_3
    .word S_Story_68_4
    .word S_Story_68_5
    .word S_Story_68_6
    .word S_Story_68_7
    .word S_Story_68_8
    .word S_Story_68_9
    .word S_Story_68_10


_ts S_Story_68_0
    push       {r5}
    bl         Flag_SetPlayerInactive
    bl         PlayerAnimation_Lock
    pop        {r5}
    Flag_ClearBase 0x93
    push       {r5}
    mov        r0,#0x10
    bl         PetStatusControl_SetState
    ldr        r7,PTR_NPCList_803E710_080935f0
    bl         Map_LoadNPCList
    mov        r1,#0x0
    bl         Effect_LifeVirusSeed_Create
    mov        r1,#0x1
    bl         Effect_LifeVirusSeed_Create
    mov        r1,#0x2
    bl         Effect_LifeVirusSeed_Create
    mov        r1,#0x3
    bl         Effect_LifeVirusSeed_Create
    pop        {r5}
    Scene_Next
    ldr        r0,PTR_Cam_Set_080935f4
    bl         SceneCamera_Init
    bl         SceneCamera_Main
    pop        {pc}


_ts S_Story_68_1
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_0809343a
    push       {r5}
    mov        r0,#0x68
    neg        r0,r0
    lsl        r0,r0,#0x10
    mov        r1,#0x0
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    bl         DisableBoundaryCheck
    pop        {r5}
    push       {r5}
    FadeInFast_Black
    pop        {r5}
    mov        r0,#0x3c
    strb       r0,[r5,#Scene_sceneTimer]
    Scene_Next
LAB_0809343a:
    pop        {pc}


_ts S_Story_68_2
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08093468
    push       {r5}
    ldr        r0,PTR_ScenarioData_68_080935f8
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
    ldr        r0,DAT_080935fc
    strh       r0,[r5,#Scene_sceneTimer]
    bl         Scene_IsStartPressed
    beq        LAB_08093468
    bl         S_Story_68_SkipIfStart
LAB_08093468:
    pop        {pc}


_nt S_Story_68_3
    push       {r5}
    mov        r0,#TF_DialogueActive
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08093498
    ldrh       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strh       r0,[r5,#Scene_sceneTimer]
    tst        r0,r0
    bne        LAB_08093498
    mov        r0,#0xdd
    bl         Sound_PlaySE
    push       {r5}
    Fade_Request FT_FadeOutToWhite, 0x80
    pop        {r5}
    Scene_Next
LAB_08093498:
    bl         Scene_IsStartPressed
    beq        LAB_080934a2
    bl         S_Story_68_SkipIfStart
LAB_080934a2:
    pop        {pc}


_ts S_Story_68_4
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080934ce
    push       {r5}
    mov        r0,#0x8
    bl         Entity_FreeAllMultiple
    mov        r1,#0x4
    bl         Effect_LifeVirusSeed_Create
    FadeIn_White
    pop        {r5}
    Scene_Next
LAB_080934ce:
    pop        {pc}


_ts S_Story_68_5
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080934ec
    Flag_SetBase 0x93
    mov        r0,#0x1e
    strb       r0,[r5,#Scene_sceneTimer]
    Scene_Next
LAB_080934ec:
    pop        {pc}


_nt S_Story_68_6
    ldrb       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    tst        r0,r0
    bne        LAB_0809350a
    push       {r5}
    ldr        r0,PTR_ScenarioData_68_080935f8
    mov        r1,#0x5
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
LAB_0809350a:
    bl         Scene_IsStartPressed
    beq        LAB_08093514
    bl         S_Story_68_SkipIfStart
LAB_08093514:
    pop        {pc}


_nt S_Story_68_7
    push       {r5}
    mov        r0,#TF_DialogueActive
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0809353a
    Flag_ClearBase 0x93
    push       {r5}
    ldr        r0,PTR_ScenarioData_68_080935f8
    mov        r1,#0x6
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
LAB_0809353a:
    bl         Scene_IsStartPressed
    beq        LAB_08093544
    bl         S_Story_68_SkipIfStart
LAB_08093544:
    pop        {pc}


_nt S_Story_68_8
    push       {r5}
    mov        r0,#TF_DialogueActive
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08093564
    push       {r5}
    FadeOutFast_Black
    pop        {r5}
    Scene_Next
LAB_08093564:
    bl         Scene_IsStartPressed
    beq        LAB_0809356e
    bl         S_Story_68_SkipIfStart
LAB_0809356e:
    pop        {pc}


_ts S_Story_68_9
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08093590
    push       {r5}
    mov        r0,#TF_DisableInput
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    Scene_Next
LAB_08093590:
    pop        {pc}


_nt S_Story_68_10
    push       {r5}
    bl         PlayerAnimation_Unlock
    bl         Flag_SetPlayerInactive
    Flag_SetBase 0xA1
    pop        {r5}
    push       {r5}
    LoadMain mapChange, r0, r7
    mov        r1,#0x1
    strb       r1,[r0,#MapChange_type]
    mov        r1,#0x1
    strb       r1,[r0,#MapChange_destinationIndex]
    ldr        r1,PTR_MapEntrance_08093600
    str        r1,[r0,#MapChange_destinationList]
    mov        r0,#0x0
    bl         World_ChangeMap
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}

MapEntrance_080935c4:
    MapEntrance Map_ACDC_Lan_Room, d_s, f(0, 0, 0)


_ts S_Story_68_SkipIfStart
    push       {r5}
    FadeOut_Black
    mov        r0,#TF_DisableInput
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x24
    strb       r0,[r5,#Scene_state_s0]
    pop        {pc}

PTR_PTR_S_Story_68_0_080935ec:
    .word PTR_S_Story_68_0_08093388

PTR_NPCList_803E710_080935f0:
    .word NPCList_803E710

PTR_Cam_Set_080935f4:
    .word Cam_Set_08093370

PTR_ScenarioData_68_080935f8:
    .word ScenarioData_68

DAT_080935fc:
    .word 0x1A4

PTR_MapEntrance_08093600:
    .word MapEntrance_080935c4
