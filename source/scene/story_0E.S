#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


Cam_Set_08084fc4:
    cam_set -99, -20, 0
    cam_move -512, 512, 0, 6
    cam_move -256, 256, 0, 3
    cam_move -128, 128, 0, 2
    cam_wait 30
    cam_end


_ts Scene_Story_0E
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_0E_0_080850f4
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_S_Story_0E_0_08085000:
    .word S_Story_0E_0
    .word S_Story_0E_1
    .word S_Story_0E_2
    .word S_Story_0E_3
    .word S_Story_0E_4


_ts S_Story_0E_0
    push       {lr}
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    ldr        r0,PTR_Cam_Set_080850f8
    bl         SceneCamera_Init
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_Story_0E_1
    push       {lr}
    bl         SceneCamera_Main
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_08085058
    push       {r5}
    mov        r0,#0x1
    bl         PlayerAnimation_SetState
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    bl         Scene_IsStartPressed
    beq        LAB_08085058
    bl         S_Story_0E_SkipIfStart
LAB_08085058:
    pop        {pc}

    .align 2, 0



_ts S_Story_0E_2
    push       {lr}
    bl         SceneCamera_Main
    cmp        r0,#0x1
    beq        LAB_08085084
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08085084
    push       {r5}
    ldr        r0,PTR_ScenarioData_0E_080850fc
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08085084:
    bl         Scene_IsStartPressed
    beq        LAB_0808508e
    bl         S_Story_0E_SkipIfStart
LAB_0808508e:
    pop        {pc}


_ts S_Story_0E_3
    push       {lr}
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_080850a4
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080850a4:
    bl         Scene_IsStartPressed
    beq        LAB_080850ae
    bl         S_Story_0E_SkipIfStart
LAB_080850ae:
    pop        {pc}


_ts S_Story_0E_4
    push       {lr}
    push       {r5}
    bl         Text_DisableDialogue
    Flag_ClearBase 0xD2
    Flag_SetBase 0xDF
    bl         PlayerAnimation_Unlock
    mov        r0,#0x1
    LoadMain world, r1, r7
    ldr        r1,[r1,#0x28]
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}

    .align 2, 0



_ts S_Story_0E_SkipIfStart
    push       {lr}
    push       {r5}
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x10
    strb       r0,[r5,#0x0]
    pop        {pc}

    .align 2, 0


PTR_PTR_S_Story_0E_0_080850f4:
    .word PTR_S_Story_0E_0_08085000

PTR_Cam_Set_080850f8:
    .word Cam_Set_08084fc4

PTR_ScenarioData_0E_080850fc:
    .word ScenarioData_0E
