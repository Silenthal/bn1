#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


Cam_Set_0808914c:
    cam_set 150, 90, 0
    cam_end

    .align 2, 0



_ts Scene_Story_26
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_26_0_080893fc
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_26_0_08089164:
    .word S_Story_26_0
    .word S_Story_26_1
    .word S_Story_26_2
    .word S_Story_26_3
    .word S_Story_26_4
    .word S_Story_26_5
    .word S_Story_26_6
    .word S_Story_26_7
    .word S_Story_26_8
    .word S_Story_26_9
    .word S_Story_26_10
    .word S_Story_26_11


_ts S_Story_26_0
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_Story_26_1
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_080891ec
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080891ec
    push       {r5}
    mov        r0,#0xa0
    lsl        r0,r0,#0x10
    mov        r1,#0x5a
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    mov        r0,#0x1
    bl         PlayerAnimation_SetState
    pop        {r5}
    ldr        r0,PTR_Cam_Set_08089400
    bl         SceneCamera_Init
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080891ec:
    pop        {pc}


_nt S_Story_26_2
    bl         SceneCamera_Main
    cmp        r0,#0x1
    beq        LAB_08089208
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08089208:
    pop        {pc}


_nt S_Story_26_3
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08089232
    push       {r5}
    ldr        r0,PTR_ScenarioData_26_08089404
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    bl         Scene_IsStartPressed
    beq        LAB_08089232
    bl         S_Story_26_SkipIfStart
LAB_08089232:
    pop        {pc}


_ts S_Story_26_4
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08089258
    Flag_SetBase 0xBA
    push       {r5}
    ldr        r0,PTR_ScenarioData_26_08089404
    mov        r1,#0x5
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08089258:
    bl         Scene_IsStartPressed
    beq        LAB_08089262
    bl         S_Story_26_SkipIfStart
LAB_08089262:
    pop        {pc}


_ts S_Story_26_5
    Flag_GetBase 0xBB
    beq        LAB_08089288
    mov        r0,#0x8
    neg        r0,r0
    lsl        r0,r0,#0xc
    str        r0,[r5,#0x18]
    mov        r0,#0x0
    str        r0,[r5,#0x1c]
    mov        r0,#0x27
    bl         PlayerAnimation_SetState
    mov        r0,#0x0
    str        r0,[r5,#0x14]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08089288:
    bl         Scene_IsStartPressed
    beq        LAB_08089292
    bl         S_Story_26_SkipIfStart
LAB_08089292:
    pop        {pc}


_ts S_Story_26_6
    bl         S_Story_26_LanMove
    tst        r0,r0
    bne        LAB_080892be
    mov        r0,#0x1
    bl         PlayerAnimation_SetState
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08089288
    Flag_SetBase 0xBC
    mov        r0,#0x50
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080892be:
    bl         Scene_IsStartPressed
    beq        LAB_080892c8
    bl         S_Story_26_SkipIfStart
LAB_080892c8:
    pop        {pc}


_nt S_Story_26_7
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    bne        LAB_080892e2
    mov        r0,#0x3
    bl         PlayerAnimation_SetState
    mov        r0,#0xc8
    strh       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080892e2:
    bl         Scene_IsStartPressed
    beq        LAB_080892ec
    bl         S_Story_26_SkipIfStart
LAB_080892ec:
    pop        {pc}


_nt S_Story_26_8
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    bne        LAB_08089308
    push       {r5}
    ldr        r0,PTR_ScenarioData_26_08089404
    mov        r1,#0x6
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08089308:
    bl         Scene_IsStartPressed
    beq        LAB_08089312
    bl         S_Story_26_SkipIfStart
LAB_08089312:
    pop        {pc}


_ts S_Story_26_9
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08089326
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08089326:
    bl         Scene_IsStartPressed
    beq        LAB_08089330
    bl         S_Story_26_SkipIfStart
LAB_08089330:
    pop        {pc}


_nt S_Story_26_10
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08089394
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    push       {r5}
    mov        r0,#0x96
    lsl        r0,r0,#0x10
    mov        r1,#0x5a
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    mov        r0,#0x3
    bl         PlayerAnimation_SetState
    mov        r0,#0x1
    LoadMain world, r1, r1
    ldr        r1,[r1,#0x28]
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    mov        r0,#0x10
    bl         Entity_FreeAllMultiple
    ldr        r7,PTR_NPCList_8035254_08089408
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
LAB_08089394:
    pop        {pc}


_nt S_Story_26_11
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080893b8
    push       {r5}
    bl         Text_DisableDialogue
    pop        {r5}
    Flag_SetBase 0xB9
    bl         PlayerAnimation_Unlock
    bl         Scene_UnloadAndResetStepCounter
LAB_080893b8:
    pop        {pc}


_nt S_Story_26_SkipIfStart
    push       {r5}
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x28
    strb       r0,[r5,#0x0]
    pop        {pc}

    .align 2, 0



_ts S_Story_26_LanMove
    push       {lr}
    ldr        r0,[r5,#0x14]
    add        r0,#0x1
    str        r0,[r5,#0x14]
    cmp        r0,#0x14
    bge        LAB_080893f6
    ldr        r0,[r5,#0x18]
    ldr        r1,[r5,#0x1c]
    mov        r2,#0x0
    push       {r5}
    bl         PlayerAnimation_Move
    pop        {r5}
    mov        r0,#0x1
    pop        {pc}
LAB_080893f6:
    mov        r0,#0x0
    pop        {pc}

    .align 2, 0


PTR_PTR_S_Story_26_0_080893fc:
    .word PTR_S_Story_26_0_08089164

PTR_Cam_Set_08089400:
    .word Cam_Set_0808914c

PTR_ScenarioData_26_08089404:
    .word ScenarioData_26

PTR_NPCList_8035254_08089408:
    .word NPCList_8035254
