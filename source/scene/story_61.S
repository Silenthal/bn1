#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Scene_Story_61
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_61_0_08091860
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_61_0_0809165c:
    .word S_Story_61_0
    .word S_Story_61_1
    .word S_Story_61_2
    .word S_Story_61_3
    .word S_Story_61_4
    .word S_Story_61_5
    .word S_Story_61_6
    .word S_Story_61_7


_ts S_Story_61_0
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


_ts S_Story_61_1
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080916f6
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_080916f6
    push       {r5}
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldr        r7,[r7,#0x28]
    mov        r0,#0x7
    strb       r0,[r7,#0x10]
    pop        {r5}
    mov        r0,#0x88
    neg        r0,r0
    lsl        r0,r0,#0x10
    mov        r1,#0x8c
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    mov        r0,#0x7
    bl         PlayerAnimation_SetState
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    mov        r0,#0x0
    strb       r0,[r5,#0x1]
    pop        {pc}


_ts FUN_080916ec
    bl         Scene_IsStartPressed
    beq        LAB_080916f6
    bl         S_Story_61_SkipIfStart
LAB_080916f6:
    pop        {pc}


_ts S_Story_61_2
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08091716
    push       {r5}
    ldr        r0,PTR_ScenarioData_61_08091864
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08091716:
    pop        {pc}


_ts S_Story_61_3
    mov        r0,#0xc8
    bl         Flag_GetBase
    beq        LAB_08091734
    mov        r0,#0x3c
    strb       r0,[r5,#0x8]
    push       {r5}
    mov        r0,#0xc
    bl         PetStatusControl_SetState
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08091734:
    bl         Scene_IsStartPressed
    beq        LAB_0809173e
    bl         S_Story_61_SkipIfStart
LAB_0809173e:
    pop        {pc}


_ts S_Story_61_4
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_0809175a
    push       {r5}
    mov        r0,#0x4
    bl         PetStatusControl_SetState
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0809175a:
    bl         Scene_IsStartPressed
    beq        LAB_08091764
    bl         S_Story_61_SkipIfStart
LAB_08091764:
    pop        {pc}


_nt S_Story_61_5
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08091786
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}
LAB_08091786:
    bl         Scene_IsStartPressed
    beq        LAB_08091790
    bl         S_Story_61_SkipIfStart
LAB_08091790:
    pop        {pc}


_nt S_Story_61_6
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080917b2
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080917b2:
    pop        {pc}


_ts S_Story_61_7
    bl         PlayerAnimation_Unlock
    push       {r5}
    mov        r0,#0x4
    bl         PetStatusControl_SetState
    pop        {r5}
    push       {r5}
    mov        r0,#0xc7
    bl         Flag_SetBase
    pop        {r5}
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    mov        r1,#0x50
    strb       r1,[r0,#0x6]
    mov        r0,#0x2d
    bl         Flag_ClearBase
    mov        r0,#0x2f
    bl         Flag_ClearBase
    push       {r5}
    mov        r0,#0x4
    bl         Flag_SetBase
    bl         FUN_080102e8
    bl         Shop_RestockHigsby2
    mov        r0,#0x3c
    mov        r1,#0x1
    bl         KeyItem_SubtractAmount
    mov        r0,#0x3d
    mov        r1,#0x1
    bl         KeyItem_SubtractAmount
    mov        r0,#0x3e
    mov        r1,#0x1
    bl         KeyItem_SubtractAmount
    mov        r0,#0x2a
    bl         Flag_ClearBase
    pop        {r5}
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x2c]
    mov        r1,#0x1
    strb       r1,[r0,#0x10]
    mov        r1,#0x1
    strb       r1,[r0,#0x12]
    ldr        r1,PTR_MapEntrance_08091868
    str        r1,[r0,#0x14]
    mov        r0,#0x0
    bl         World_ChangeMap
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}

MapEntrance_08091830:
    MapEntrance Map_WWW_Wily_Lab, d_nw, f(42, -42, 0)


_ts S_Story_61_SkipIfStart
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    push       {r5}
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x18
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    strb       r0,[r5,#0x1]
    pop        {pc}

PTR_PTR_S_Story_61_0_08091860:
    .word PTR_S_Story_61_0_0809165c

PTR_ScenarioData_61_08091864:
    .word ScenarioData_61

PTR_MapEntrance_08091868:
    .word MapEntrance_08091830
