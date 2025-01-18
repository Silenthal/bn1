#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Scene_Story_60
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_60_0_0809163c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_60_0_08091474:
    .word S_Story_60_0
    .word S_Story_60_1
    .word S_Story_60_2
    .word S_Story_60_3
    .word S_Story_60_4
    .word S_Story_60_5
    .word S_Story_60_6
    .word S_Story_60_7


_ts S_Story_60_0
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_Story_60_1
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080914f8
    bl         PlayerAnimation_GetState
    cmp        r0,#0x2
    bne        LAB_080914f8
    push       {r5}
    mov        r0,#0x6
    lsl        r0,r0,#0x10
    mov        r1,#0x7e
    neg        r1,r1
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    bl         DisableBoundaryCheck
    mov        r0,#0x2b
    bl         PlayerAnimation_SetState
    pop        {r5}
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x3c
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080914f8:
    pop        {pc}


_nt S_Story_60_2
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0809152c
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_0809152c
    mov        r0,#0x2c
    bl         PlayerAnimation_SetState
    mov        r0,#0xc2
    bl         Sound_PlaySE
    Flag_SetBase 0xC1
    mov        r0,#0x10
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0809152c:
    pop        {pc}


_nt S_Story_60_3
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_0809155e
    mov        r0,#0xa7
    bl         Sound_PlaySE
    push       {r5}
    ldr        r0,PTR_BgTask_803BB84_08091640
    bl         BgTask_AddNew
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_ScenarioData_60_08091644
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    mov        r0,#0x50
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0809155e:
    bl         Scene_IsStartPressed
    beq        LAB_08091568
    bl         S_Story_60_SkipIfStart
LAB_08091568:
    pop        {pc}


_nt S_Story_60_4
    ldrb       r0,[r5,#0x8]
    tst        r0,r0
    beq        LAB_08091576
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    b          LAB_08091586
LAB_08091576:
    push       {r5}
    ldr        r0,PTR_BgTask_803BD78_08091648
    bl         BgTask_AddNew
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08091586:
    bl         Scene_IsStartPressed
    beq        LAB_08091590
    bl         S_Story_60_SkipIfStart
LAB_08091590:
    pop        {pc}


_nt S_Story_60_5
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_080915b0
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080915b0:
    bl         Scene_IsStartPressed
    beq        LAB_080915ba
    bl         S_Story_60_SkipIfStart
LAB_080915ba:
    pop        {pc}


_ts S_Story_60_6
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080915dc
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080915dc:
    pop        {pc}


_nt S_Story_60_7
    push       {r5}
    bl         EnableBoundaryCheck
    bl         PlayerAnimation_Unlock
    pop        {r5}
    Flag_SetBase 0xC5
    LoadMain world, r0, r7
    mov        r1,#0x3
    strb       r1,[r0,#0x7]
    ldr        r0,[r7,#0x2c]
    mov        r1,#0x1
    strb       r1,[r0,#0x10]
    strb       r1,[r0,#0x12]
    ldr        r1,PTR_MapEntrance_0809164c
    str        r1,[r0,#0x14]
    push       {r5}
    mov        r0,#0x0
    bl         World_ChangeMap
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}

MapEntrance_08091614:
    MapEntrance Map_SciLab_Restaurant, d_s, f(-168, 162, 0)


_ts S_Story_60_SkipIfStart
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x18
    strb       r0,[r5,#0x0]
    pop        {pc}

PTR_PTR_S_Story_60_0_0809163c:
    .word PTR_S_Story_60_0_08091474

PTR_BgTask_803BB84_08091640:
    .word BgTask_803BB84

PTR_ScenarioData_60_08091644:
    .word ScenarioData_60

PTR_BgTask_803BD78_08091648:
    .word BgTask_803BD78

PTR_MapEntrance_0809164c:
    .word MapEntrance_08091614
