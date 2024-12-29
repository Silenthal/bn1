#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Scene_Story_5F
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_5F_0_08091454
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_5F_0_080912c0:
    .word S_Story_5F_0
    .word S_Story_5F_1
    .word S_Story_5F_2
    .word S_Story_5F_3
    .word S_Story_5F_4
    .word S_Story_5F_5
    .word S_Story_5F_6
    .word S_Story_5F_7


_ts S_Story_5F_0
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_Story_5F_1
    bl         PlayerAnimation_GetState
    cmp        r0,#0x2
    bne        LAB_08091334
    mov        r0,#0xbe
    bl         Flag_ClearBase
    push       {r5}
    ldr        r7,PTR_NPCList_804BA34_08091458
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    mov        r0,#0x10
    lsl        r0,r0,#0x10
    ldr        r1,DAT_0809145c
    neg        r1,r1
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    mov        r0,#0x2e
    bl         PlayerAnimation_SetState
    pop        {r5}
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08091334:
    pop        {pc}


_nt S_Story_5F_2
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08091354
    push       {r5}
    ldr        r0,PTR_ScenarioData_5F_08091460
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08091354:
    pop        {pc}


_nt S_Story_5F_3
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08091378
    mov        r0,#0xbe
    bl         Flag_SetBase
    mov        r0,#0x7c
    bl         Sound_PlaySongImmediate
    mov        r0,#0x3c
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08091378:
    bl         Scene_IsStartPressed
    beq        LAB_08091382
    bl         S_Story_5F_SkipIfStart
LAB_08091382:
    pop        {pc}


_ts S_Story_5F_4
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_080913aa
    push       {r5}
    ldr        r0,PTR_ScenarioData_5F_08091460
    mov        r1,#0xa
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    bl         Scene_IsStartPressed
    beq        LAB_080913aa
    bl         S_Story_5F_SkipIfStart
LAB_080913aa:
    pop        {pc}


_ts S_Story_5F_5
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_080913ca
    push       {r5}
    mov        r0,#0x2
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080913ca:
    bl         Scene_IsStartPressed
    beq        LAB_080913d4
    bl         S_Story_5F_SkipIfStart
LAB_080913d4:
    pop        {pc}


_nt S_Story_5F_6
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080913f6
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080913f6:
    pop        {pc}


_ts S_Story_5F_7
    push       {r5}
    bl         PlayerAnimation_Unlock
    pop        {r5}
    mov        r0,#0xc4
    bl         Flag_SetBase
    LoadMain world, r0, r7
    mov        r1,#0x1
    strb       r1,[r0,#0x7]
    ldr        r0,[r7,#0x2c]
    mov        r1,#0x1
    strb       r1,[r0,#0x10]
    strb       r1,[r0,#0x12]
    ldr        r1,PTR_MapEntrance_08091464
    str        r1,[r0,#0x14]
    push       {r5}
    mov        r0,#0x0
    bl         World_ChangeMap
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}

    .align 2, 0


MapEntrance_0809142c:
    MapEntrance Map_SciLab_Generator_Room, d_se, f(6, -126, 0)


_ts S_Story_5F_SkipIfStart
    push       {r5}
    mov        r0,#0x2
    mov        r1,#0x10
    bl         Fade_Request
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x18
    strb       r0,[r5,#0x0]
    pop        {pc}

PTR_PTR_S_Story_5F_0_08091454:
    .word PTR_S_Story_5F_0_080912c0

PTR_NPCList_804BA34_08091458:
    .word NPCList_804BA34

DAT_0809145c:
    .word 0x18E

PTR_ScenarioData_5F_08091460:
    .word ScenarioData_5F

PTR_MapEntrance_08091464:
    .word MapEntrance_0809142c
