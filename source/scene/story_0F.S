#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


Cam_Set_08085fec:
    cam_set 240, 20, 0
    cam_move 64, -64, 0, 320
    cam_wait 30
    cam_end


_ts Scene_Story_0F
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_0F_0_080861a0
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_0F_0_08086010:
    .word S_Story_0F_0
    .word S_Story_0F_1
    .word S_Story_0F_2
    .word S_Story_0F_3
    .word S_Story_0F_4
    .word S_Story_0F_3
    .word S_Story_0F_6
    .word S_Story_0F_7
    .word S_Story_0F_8
    .byte 0x00
    .byte 0x07


_nt S_Story_0F_0
    push       {r5}
    bl         Flag_SetPlayerInactive
    push       {r5}
    mov        r0,#0x10
    bl         PetStatusControl_SetState
    pop        {r5}
    ldr        r0,PTR_ScenarioData_0F_080861a4
    mov        r1,#0x0
    bl         Text_LoadDialogue
    ldr        r0,PTR_Cam_Set_080861a8
    bl         SceneCamera_Init
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    bl         Sound_StopAllMusic
    mov        r0,#0x28
    bl         Flag_ClearEvent
    pop        {pc}


_ts S_Story_0F_1
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        S_Story_0F_SkipIfStart
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]


_nt S_Story_0F_SkipIfStart
    bl         Scene_IsStartPressed
    beq        LAB_08086090
    mov        r0,#0x1c
    strb       r0,[r5,#0x0]
LAB_08086090:
    pop        {pc}


_nt S_Story_0F_2
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08086090
    mov        r0,#0xa4
    bl         Sound_PlaySongImmediate
    push       {r5}
    ldr        r0,PTR_ScenarioData_0F_080861a4
    mov        r1,#0x1
    bl         Text_LoadDialogue
    pop        {r5}
    mov        r0,#0x10
    strb       r0,[r5,#0x0]
    b          S_Story_0F_SkipIfStart


_nt S_Story_0F_3
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_080860d4
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
LAB_080860d4:
    b          S_Story_0F_SkipIfStart


_nt S_Story_0F_4
    bl         SceneCamera_Main
    tst        r0,r0
    bne        LAB_080860fc
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_080860fc
    push       {r5}
    ldr        r0,PTR_ScenarioData_0F_080861a4
    mov        r1,#0x2
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080860fc:
    b          S_Story_0F_SkipIfStart


_nt S_Story_0F_6
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08086156
    bl         Flag_SetPlayerActive
    push       {r5}
    mov        r0,#0x4
    bl         PetStatusControl_SetState
    pop        {r5}
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    mov        r0,#0x10
    bl         Entity_FreeAllMultiple
    mov        r0,#0xd7
    bl         Flag_SetBase
    pop        {r5}
    mov        r0,#0x1
    bl         Sound_ChangeSong
    push       {r5}
    LoadMain mapChange, r0, r7
    mov        r1,#0x1
    strb       r1,[r0,#0x10]
    mov        r1,#0x1
    strb       r1,[r0,#0x12]
    ldr        r1,PTR_MapEntrance_080861ac
    str        r1,[r0,#0x14]
    mov        r0,#0x0
    bl         World_ChangeMap
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
LAB_08086156:
    pop        {pc}

MapEntrance_08086158:
    MapEntrance Map_ACDC_Town, d_s, f(-110, -132, 0)


_ts S_Story_0F_7
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_Story_0F_8
    push       {r5}
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808619e
    push       {r5}
    bl         Text_DisableDialogue
    pop        {r5}
    mov        r0,#0x14
    str        r0,[r5,#0x0]
LAB_0808619e:
    pop        {pc}

PTR_PTR_S_Story_0F_0_080861a0:
    .word PTR_S_Story_0F_0_08086010

PTR_ScenarioData_0F_080861a4:
    .word ScenarioData_0F

PTR_Cam_Set_080861a8:
    .word Cam_Set_08085fec

PTR_MapEntrance_080861ac:
    .word MapEntrance_08086158
