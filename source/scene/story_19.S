#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


    cam_end

    .align 2, 0


MapEntranceOptions_080873ec:
    MapEntrance Map_School_Comp_1, d_s, f(47, 18, 0)
    .byte 0x0, 0x0, 0x2, 0x0


_ts Scene_Story_19
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_19_0_080875c0
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_19_0_0808740c:
    .word S_Story_19_0
    .word S_Story_19_1
    .word S_Story_19_2
    .word S_Story_19_3
    .word S_Story_19_4
    .word S_Story_19_5
    .word S_Story_19_6
    .word S_Story_19_7
    .word S_Story_19_8
    .word S_Story_19_9


_ts S_Story_19_0
    push       {r5}
    bl         Flag_SetPlayerInactive
    pop        {r5}
    ldr        r0,[r5,#0x4]
    tst        r0,r0
    beq        LAB_08087454
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x8
    strb       r0,[r5,#0x0]
    pop        {pc}
LAB_08087454:
    ldr        r0,PTR_MapEntranceOptions_080875c4
    str        r0,[r5,#0x10]
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_Story_19_1
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080874b2
    LoadMain mapChange, r0, r7
    mov        r1,#0x1
    strb       r1,[r0,#0x10]
    ldr        r2,[r5,#0x10]
    strb       r1,[r0,#0x12]
    str        r2,[r0,#0x14]
    push       {r5}
    ldr        r0,[r5,#0x10]
    ldrb       r0,[r0,#0x12]
    bl         World_ChangeMap
    pop        {r5}
    push       {r5}
    mov        r0,#0x1f
    bl         Entity_FreeAllMultiple
    pop        {r5}
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    bl         Flag_SetPlayerActive
    bl         Scene_UnloadAndResetStepCounter
LAB_080874b2:
    pop        {pc}


_ts S_Story_19_2
    bl         PlayerAnimation_Lock
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_Story_19_3
    bl         PlayerAnimation_GetState
    cmp        r0,#0x2
    bne        LAB_080874dc
    LoadMain world, r0, r7
    mov        r0,#0x34
    bl         PlayerAnimation_SetState
    mov        r0,#0x1
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080874dc:
    pop        {pc}


_nt S_Story_19_4
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_080874f2
    mov        r0,#0x1e
    strb       r0,[r5,#0x8]
    mov        r0,#0x8d
    bl         Sound_PlaySongImmediate
LAB_080874f2:
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808750e
    LoadMain world, r0, r7
    mov        r0,#0x35
    bl         PlayerAnimation_SetState
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808750e:
    pop        {pc}


_ts S_Story_19_5
    push       {r5}
    ldr        r0,PTR_ScenarioData_19_080875c8
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_Story_19_6
    mov        r0,#0x80
    bl         Text_CheckOption
    bne        LAB_08087544
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x40
    bl         Text_EnableOption
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08087544:
    bl         Scene_IsStartPressed
    beq        LAB_0808754e
    bl         S_Story_19_SkipIfStart
LAB_0808754e:
    pop        {pc}


_ts S_Story_19_7
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08087570
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08087570:
    pop        {pc}


_nt S_Story_19_8
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_nt S_Story_19_9
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080875a4
    Flag_SetBase 0xB7
    bl         PlayerAnimation_Unlock
    bl         Flag_SetPlayerActive
    bl         Scene_UnloadAndResetStepCounter
LAB_080875a4:
    pop        {pc}


_nt S_Story_19_SkipIfStart
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

    .align 2, 0


PTR_PTR_S_Story_19_0_080875c0:
    .word PTR_S_Story_19_0_0808740c

PTR_MapEntranceOptions_080875c4:
    .word MapEntranceOptions_080873ec

PTR_ScenarioData_19_080875c8:
    .word ScenarioData_19
