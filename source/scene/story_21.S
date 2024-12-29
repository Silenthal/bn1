#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


Cam_Set_08088698:
    cam_set 8, -4, 0
    cam_move -512, 512, 0, 6
    cam_move -256, 256, 0, 3
    cam_move -128, 128, 0, 2
    cam_wait 30
    cam_end


_ts Scene_Story_21
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_21_0_080888dc
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_21_0_080886d0:
    .word S_Story_21_0
    .word S_Story_21_1
    .word S_Story_21_2
    .word S_Story_21_3
    .word S_Story_21_4
    .word S_Story_21_5
    .word S_Story_21_6
    .word S_Story_21_7
    .word S_Story_21_8


_ts S_Story_21_0
    push       {r5}
    bl         Sound_StopAllMusic
    pop        {r5}
    push       {r5}
    bl         Flag_SetPlayerInactive
    pop        {r5}
    bl         S_Story_21_LoadLanBed
    ldr        r0,PTR_Cam_Set_080888e0
    bl         SceneCamera_Init
    push       {r5}
    ldr        r0,PTR_ScenarioData_21_080888e4
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_nt S_Story_21_1
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08088746
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x2
    bl         Sound_ChangeSong
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08088746:
    bl         Scene_IsStartPressed
    beq        LAB_08088750
    bl         S_Story_21_SkipIfStart
LAB_08088750:
    pop        {pc}


_nt S_Story_21_2
    bl         SceneCamera_Main
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08088768
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08088768:
    bl         Scene_IsStartPressed
    beq        LAB_08088772
    bl         S_Story_21_SkipIfStart
LAB_08088772:
    pop        {pc}


_ts S_Story_21_3
    bl         SceneCamera_Main
    cmp        r0,#0x1
    beq        LAB_0808878e
    push       {r5}
    ldr        r0,PTR_ScenarioData_21_080888e4
    mov        r1,#0x1
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808878e:
    bl         Scene_IsStartPressed
    beq        LAB_08088798
    bl         S_Story_21_SkipIfStart
LAB_08088798:
    pop        {pc}


_nt S_Story_21_4
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_080887ba
    push       {r5}
    mov        r0,#0x9c
    bl         Flag_SetBase
    pop        {r5}
    mov        r0,#0x3c
    strh       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080887ba:
    bl         Scene_IsStartPressed
    beq        LAB_080887c4
    bl         S_Story_21_SkipIfStart
LAB_080887c4:
    pop        {pc}


_nt S_Story_21_5
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    cmp        r0,#0x0
    bne        LAB_080887e2
    push       {r5}
    ldr        r0,PTR_ScenarioData_21_080888e4
    mov        r1,#0x3
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080887e2:
    bl         Scene_IsStartPressed
    beq        LAB_080887ec
    bl         S_Story_21_SkipIfStart
LAB_080887ec:
    pop        {pc}


_nt S_Story_21_6
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808880c
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808880c:
    bl         Scene_IsStartPressed
    beq        LAB_08088816
    bl         S_Story_21_SkipIfStart
LAB_08088816:
    pop        {pc}


_ts S_Story_21_7
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08088870
    bl         S_Story_21_FreeLanBed
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    ldr        r0,PTR_EntityAllocParams_8030F60_080888e8
    bl         Entity_AllocList
    LoadMain world, r6, r6
    ldr        r1,DAT_080888ec
    str        r1,[r6,#0x38]
    ldr        r1,DAT_080888f0
    str        r1,[r6,#0x3c]
    mov        r1,#0x0
    str        r1,[r6,#0x40]
    mov        r1,#0x4
    str        r1,[r6,#0x44]
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08088870:
    pop        {pc}


_nt S_Story_21_8
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808889a
    mov        r0,#0x9d
    bl         Flag_SetBase
    mov        r0,#0x2
    bl         Sound_ChangeSong
    push       {r5}
    bl         Text_DisableDialogue
    bl         Flag_SetPlayerActive
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
LAB_0808889a:
    pop        {pc}


_ts S_Story_21_SkipIfStart
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x1c
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_Story_21_LoadLanBed
    push       {lr}
    push       {r5}
    mov        r0,#0x7
    ldr        r1,DAT_080888f4
    ldr        r2,DAT_080888f8
    mov        r3,#0x0
    mov        r4,#0x0
    bl         Actor_Alloc
    add        r0,r5,#0x0
    pop        {r5}
    str        r0,[r5,#0x10]
    pop        {pc}


_nt S_Story_21_FreeLanBed
    push       {lr}
    push       {r5}
    ldr        r5,[r5,#0x10]
    bl         Actor_Free
    pop        {r5}
    pop        {pc}

PTR_PTR_S_Story_21_0_080888dc:
    .word PTR_S_Story_21_0_080886d0

PTR_Cam_Set_080888e0:
    .word Cam_Set_08088698

PTR_ScenarioData_21_080888e4:
    .word ScenarioData_21

PTR_EntityAllocParams_8030F60_080888e8:
    .word EntityAllocParams_8030F60

DAT_080888ec:
    .word 0x20000

DAT_080888f0:
    .word 0x60000

DAT_080888f4:
    .word 0xFFC80000

DAT_080888f8:
    .word 0xFFF30000
