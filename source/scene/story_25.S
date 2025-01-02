#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


Cam_Set_08088f90:
    cam_set 66, 10, 0
    cam_move 0, 0, 0, 180
    cam_wait 30
    cam_end


_ts Scene_Story_25
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_25_0_0808912c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_25_0_08088fb4:
    .word S_Story_25_0
    .word S_Story_25_1
    .word S_Story_25_2
    .word S_Story_25_3
    .word S_Story_25_4
    .word S_Story_25_5


_ts S_Story_25_0
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08088fee
    push       {r5}
    bl         Flag_SetPlayerInactive
    mov        r0,#0x4
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08088fee:
    pop        {pc}


_ts S_Story_25_1
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08089024
    push       {r5}
    mov        r0,#0x11
    bl         Entity_FreeAllMultiple
    ldr        r7,PTR_PTR_DAT_08089130
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    ldr        r0,PTR_Cam_Set_08089134
    bl         SceneCamera_Init
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08089024:
    pop        {pc}


_nt S_Story_25_2
    bl         SceneCamera_Main
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08089048
    push       {r5}
    ldr        r0,PTR_ScenarioData_25_08089138
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08089048:
    pop        {pc}


_nt S_Story_25_3
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08089068
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08089068:
    bl         Scene_IsStartPressed
    beq        LAB_08089072
    bl         S_Story_25_SkipIfStart
LAB_08089072:
    pop        {pc}


_ts S_Story_25_4
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080890e2
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    LoadMain world, r6, r6
    ldr        r1,DAT_0808913c
    str        r1,[r6,#0x38]
    ldr        r1,DAT_08089140
    str        r1,[r6,#0x3c]
    mov        r1,#0x0
    str        r1,[r6,#0x40]
    mov        r1,#0x4
    str        r1,[r6,#0x44]
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    LoadMain world, r0, r0
    mov        r1,#0x24
    strb       r1,[r0,#0x6]
    push       {r5}
    mov        r0,#0x10
    bl         Entity_FreeAllMultiple
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_PTR_DAT_08089144
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080890e2:
    pop        {pc}


_ts S_Story_25_5
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08089112
    push       {r5}
    bl         Text_DisableDialogue
    bl         Flag_SetPlayerActive
    Flag_SetBase 0xA8
    mov        r0,#0x10
    bl         Entity_FreeAllMultiple
    ldr        r7,PTR_PTR_DAT_08089148
    bl         Map_LoadNPCList
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
LAB_08089112:
    pop        {pc}


_ts S_Story_25_SkipIfStart
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x10
    strb       r0,[r5,#0x0]
    pop        {pc}

PTR_PTR_S_Story_25_0_0808912c:
    .word PTR_S_Story_25_0_08088fb4

PTR_PTR_DAT_08089130:
    .word NPCList_80291C4

PTR_Cam_Set_08089134:
    .word Cam_Set_08088f90

PTR_ScenarioData_25_08089138:
    .word ScenarioData_25

DAT_0808913c:
    .word 0x20000

DAT_08089140:
    .word 0x60000

PTR_PTR_DAT_08089144:
    .word NPCList_80290E0

PTR_PTR_DAT_08089148:
    .word NPCList_80292BC
