#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


    cam_end

    .align 2, 0


MapEntranceOptions_ARRAY_08091ad0:
    MapEntrance Map_SciLab_Power_Plant_Control_Room, d_ne, f(24, 4, 0)
    .byte 0x0, 0x0, 0x0, 0x0
    MapEntrance Map_SciLab_Power_Plant_Control_Room, d_ne, f(24, 4, 0)
    .byte 0x0, 0x0, 0x0, 0x0
    MapEntrance Map_SciLab_Power_Plant_Control_Room, d_ne, f(24, 4, 0)
    .byte 0x0, 0x0, 0x0, 0x0
    MapEntrance Map_SciLab_Power_Plant_Control_Room, d_ne, f(24, 4, 0)
    .byte 0x0, 0x0, 0x0, 0x0
    MapEntrance Map_Power_Plant_Comp_4, d_nw, f(-84, -60, 0)
    .byte 0x0, 0x0, 0x0, 0x0
    MapEntrance Map_SciLab_Generator_Room, d_s, f(8, -130, 0)
    .byte 0x0, 0x0, 0x0, 0x0
    MapEntrance Map_SciLab_Generator_Room, d_s, f(8, -130, 0)
    .byte 0x0, 0x0, 0x0, 0x0
    MapEntrance Map_SciLab_Generator_Room, d_s, f(8, -130, 0)
    .byte 0x0, 0x0, 0x0, 0x0


_ts Scene_RechargePrompt
    push       {lr}
    ldr        r0,PTR_PTR_S_RechargePrompt_0_08091d14
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_RechargePrompt_0_08091b7c:
    .word S_RechargePrompt_0
    .word S_RechargePrompt_1
    .word S_RechargePrompt_2
    .word S_RechargePrompt_3
    .word S_RechargePrompt_4
    .word S_RechargePrompt_5


_ts S_RechargePrompt_0
    ldrb       r1,[r5,#0x4]
    cmp        r1,#0x3
    bge        LAB_08091bb8
    LoadMain world, r7, r7
    ldr        r0,[r7,#0x58]
    lsr        r0,r0,#0x8
    cmp        r0,#0x5
    bne        LAB_08091bb8
    ldr        r0,PTR_MapEntranceOptions_ARRAY_08091d18
    ldrb       r1,[r5,#0x4]
    mov        r2,#0x5
    add        r1,r1,r2
    mov        r2,#0x14
    mul        r2,r1
    add        r0,r0,r2
    str        r0,[r5,#0x10]
    b          LAB_08091bc4
LAB_08091bb8:
    ldr        r0,PTR_MapEntranceOptions_ARRAY_08091d1c
    ldrb       r1,[r5,#0x4]
    mov        r2,#0x14
    mul        r2,r1
    add        r0,r0,r2
    str        r0,[r5,#0x10]
LAB_08091bc4:
    push       {r5}
    bl         Flag_SetPlayerInactive
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


_ts S_RechargePrompt_1
    bl         PlayerAnimation_GetState
    cmp        r0,#0x2
    bne        LAB_08091c64
    ldrb       r1,[r5,#0x4]
    cmp        r1,#0x3
    bge        LAB_08091bfa
    mov        r0,#0x4b
    bl         PlayerAnimation_SetState
    b          LAB_08091c12
LAB_08091bfa:
    push       {r5}
    LoadMain world, r7, r7
    ldr        r7,[r7,#0x28]
    ldrb       r0,[r7,#0x10]
    mov        r2,#0x7
    and        r0,r2
    mov        r2,#0x0
    add        r0,r0,r2
    bl         PlayerAnimation_SetState
    pop        {r5}
LAB_08091c12:
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08091c30
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08091c30:
    pop        {pc}


_nt S_RechargePrompt_2
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08091c64
    ldrb       r1,[r5,#0x4]
    cmp        r1,#0x3
    bge        LAB_08091c4a
    mov        r0,#0x4c
    bl         PlayerAnimation_SetState
LAB_08091c4a:
    push       {r5}
    ldr        r7,PTR_PTR_ScenarioData_56_08091d20
    ldr        r2,[r5,#0x4]
    lsl        r2,r2,#0x2
    ldr        r0,[r7,r2]
    ldr        r1,[r5,#0x10]
    ldrb       r1,[r1,#0x10]
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08091c64:
    pop        {pc}

    .align 2, 0


PTR_ScenarioData_56_08091c68:
    .word ScenarioData_56
    .word ScenarioData_57
    .word ScenarioData_58
    .word ScenarioData_59
    .word ScenarioData_5A


_ts S_RechargePrompt_3
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08091c8e
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08091c8e:
    bl         Scene_IsStartPressed
    beq        LAB_08091c98
    mov        r0,#0x10
    strb       r0,[r5,#0x0]
LAB_08091c98:
    pop        {pc}


_nt S_RechargePrompt_4
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    push       {r5}
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_RechargePrompt_5
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08091d10
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    ldrb       r1,[r5,#0x4]
    cmp        r1,#0x3
    bge        LAB_08091ce0
    LoadMain gameStats, r1, r7
    mov        r0,#0x0
    strb       r0,[r1,#0x5]
LAB_08091ce0:
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
    bl         PlayerAnimation_Unlock
    bl         Flag_SetPlayerActive
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
LAB_08091d10:
    pop        {pc}

    .align 2, 0


PTR_PTR_S_RechargePrompt_0_08091d14:
    .word PTR_S_RechargePrompt_0_08091b7c

PTR_MapEntranceOptions_ARRAY_08091d18:
    .word MapEntranceOptions_ARRAY_08091ad0

PTR_MapEntranceOptions_ARRAY_08091d1c:
    .word MapEntranceOptions_ARRAY_08091ad0

PTR_PTR_ScenarioData_56_08091d20:
    .word PTR_ScenarioData_56_08091c68
