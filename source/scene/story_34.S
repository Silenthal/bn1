#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


Cam_Set_0808b408:
    cam_set 200, -56, 0
    cam_move 128, -128, 0, 208
    cam_wait 60
    cam_end


_ts Scene_Story_34
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_34_0_0808b5e4
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_34_0_0808b42c:
    .word S_Story_34_0
    .word S_Story_34_1
    .word S_Story_34_2
    .word S_Story_34_3
    .word S_Story_34_4
    .word S_Story_34_5
    .word S_Story_34_6
    .word S_Story_34_7


_ts S_Story_34_0
    push       {r5}
    bl         Flag_SetPlayerInactive
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_802FF6C_0808b5e8
    bl         Map_LoadNPCList
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_nt S_Story_34_1
    ldr        r0,PTR_Cam_Set_0808b5ec
    bl         SceneCamera_Init
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_Story_34_2
    bl         SceneCamera_Main
    cmp        r0,#0x1
    beq        LAB_0808b48e
    push       {r5}
    ldr        r0,PTR_ScenarioData_34_0808b5f0
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808b48e:
    bl         Scene_IsStartPressed
    beq        LAB_0808b498
    bl         S_Story_34_SkipIfStart
LAB_0808b498:
    pop        {pc}


_nt S_Story_34_3
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808b4ba
    push       {r5}
    mov        r0,#0x8
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}
LAB_0808b4ba:
    bl         Scene_IsStartPressed
    beq        LAB_0808b4c4
    bl         S_Story_34_SkipIfStart
LAB_0808b4c4:
    pop        {pc}


_nt S_Story_34_4
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808b4ec
    push       {r5}
    bl         Sound_StopAllMusic
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_ScenarioData_34_0808b5f0
    mov        r1,#0xa
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808b4ec:
    bl         Scene_IsStartPressed
    beq        LAB_0808b4f6
    bl         S_Story_34_SkipIfStart
LAB_0808b4f6:
    pop        {pc}


_ts S_Story_34_5
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808b516
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
LAB_0808b516:
    bl         Scene_IsStartPressed
    beq        LAB_0808b520
    bl         S_Story_34_SkipIfStart
LAB_0808b520:
    pop        {pc}


_nt S_Story_34_6
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808b542
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808b542:
    pop        {pc}


_ts S_Story_34_7
    push       {r5}
    bl         PlayerAnimation_Unlock
    Flag_SetBase 0xD4
    pop        {r5}
    LoadMain world, r0, r0
    mov        r1,#0x30
    strb       r1,[r0,#0x6]
    Flag_ClearBase 0x29
    Flag_ClearBase 0x2C
    push       {r5}
    Flag_SetBase 0x02
    bl         FUN_080102e8
    bl         Shop_RestockHigsby1
    mov        r0,#0x3c
    mov        r1,#0x1
    bl         KeyItem_SubtractAmount
    mov        r0,#0x3d
    mov        r1,#0x1
    bl         KeyItem_SubtractAmount
    mov        r0,#0x3e
    mov        r1,#0x1
    bl         KeyItem_SubtractAmount
    Flag_ClearBase 0x2A
    pop        {r5}
    push       {r5}
    LoadMain mapChange, r0, r7
    mov        r1,#0x1
    strb       r1,[r0,#0x10]
    mov        r1,#0x1
    strb       r1,[r0,#0x12]
    ldr        r1,PTR_MapEntrance_0808b5f4
    str        r1,[r0,#0x14]
    mov        r0,#0x0
    bl         World_ChangeMap
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}

    .align 2, 0


MapEntrance_0808b5b8:
    MapEntrance Map_WWW_Wily_Lab, d_nw, f(42, -42, 0)


_ts S_Story_34_SkipIfStart
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
    pop        {pc}

PTR_PTR_S_Story_34_0_0808b5e4:
    .word PTR_S_Story_34_0_0808b42c

PTR_NPCList_802FF6C_0808b5e8:
    .word NPCList_802FF6C

PTR_Cam_Set_0808b5ec:
    .word Cam_Set_0808b408

PTR_ScenarioData_34_0808b5f0:
    .word ScenarioData_34

PTR_MapEntrance_0808b5f4:
    .word MapEntrance_0808b5b8
