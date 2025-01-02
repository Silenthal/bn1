#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


Cam_Set_080834a8:
    cam_set 50, -19, 0
    cam_move -512, 512, 0, 6
    cam_move -256, 256, 0, 3
    cam_move -128, 128, 0, 2
    cam_wait 30
    cam_end


_ts Scene_Story_04
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_04_0_080835c8
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_S_Story_04_0_080834e4:
    .word S_Story_04_0
    .word S_Story_04_1
    .word S_Story_04_2
    .word S_Story_04_3
    .word S_Story_04_4
    .word S_Story_04_5

DAT_080834fc:
    .byte 0x00

    .align 2, 0



_ts S_Story_04_0
    push       {lr}
    push       {r5}
    bl         Flag_SetPlayerInactive
    pop        {r5}
    ldr        r0,PTR_Cam_Set_080835cc
    bl         SceneCamera_Init
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_Story_04_1
    push       {lr}
    bl         SceneCamera_Main
    cmp        r0,#0x1
    beq        LAB_08083542
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08083542
    mov        r0,#0x0
    strb       r0,[r5,#0x4]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    bl         Scene_IsStartPressed
    beq        LAB_08083542
    mov        r0,#0x10
    strb       r0,[r5,#0x0]
LAB_08083542:
    pop        {pc}


_ts S_Story_04_2
    push       {lr}
    ldrb       r0,[r5,#0x4]
    add        r1,r0,#0x1
    strb       r1,[r5,#0x4]
    push       {r5}
    ldr        r1,PTR_DAT_080835d0
    ldrb       r1,[r1,r0]
    ldr        r0,PTR_ScenarioData_04_080835d4
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    bl         Scene_IsStartPressed
    beq        LAB_0808356a
    mov        r0,#0x10
    strb       r0,[r5,#0x0]
LAB_0808356a:
    pop        {pc}


_ts S_Story_04_3
    push       {lr}
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08083580
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08083580:
    bl         Scene_IsStartPressed
    beq        LAB_0808358a
    mov        r0,#0x10
    strb       r0,[r5,#0x0]
LAB_0808358a:
    pop        {pc}


_ts S_Story_04_4
    push       {lr}
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_Story_04_5
    push       {lr}
    push       {r5}
    bl         Flag_SetPlayerActive
    Flag_SetBase 0x97
    mov        r0,#0x1
    LoadMain world, r1, r7
    ldr        r1,[r1,#0x28]
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}

PTR_PTR_S_Story_04_0_080835c8:
    .word PTR_S_Story_04_0_080834e4

PTR_Cam_Set_080835cc:
    .word Cam_Set_080834a8

PTR_DAT_080835d0:
    .word DAT_080834fc

PTR_ScenarioData_04_080835d4:
    .word ScenarioData_04
