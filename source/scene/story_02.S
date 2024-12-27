#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


Cam_Set_08083054:
    cam_set 48, -16, 0
    cam_move -512, 512, 0, 6
    cam_move -256, 256, 0, 3
    cam_move -128, 128, 0, 2
    cam_wait 60
    cam_end

Cam_Set_08083080:
    cam_set 32, 0, 0
    cam_end

    .align 2, 0



_ts Scene_Story_02_DexChallengePreTutorial
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_02_0_080832f4
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_S_Story_02_0_0808309c:
    .word S_Story_02_0
    .word S_Story_02_1
    .word S_Story_02_2
    .word S_Story_02_3
    .word S_Story_02_4
    .word S_Story_02_5
    .word S_Story_02_6
    .word S_Story_02_7
    .word S_Story_02_8
    .word S_Story_02_9

DAT_080830c4:
    .byte 0x00

    .align 2, 0



_ts S_Story_02_0
    push       {lr}
    bl         Scene_IsStartPressed
    bne        LAB_080830dc
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_080830f8
LAB_080830dc:
    push       {r5}
    mov        r0,#0x40
    bl         Text_EnableOption
    bl         PlayerAnimation_Lock
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080830f8:
    pop        {pc}

    .align 2, 0



_ts S_Story_02_1
    push       {lr}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}

    .align 2, 0



_ts S_Story_02_2
    push       {lr}
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808314e
    push       {r5}
    bl         Text_DisableDialogue
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_0808314e
    push       {r5}
    mov        r0,#0x11
    bl         Entity_FreeAllMultiple
    ldr        r7,PTR_NPCList_8028A44
    bl         Map_LoadNPCList
    mov        r0,#0x3
    mov        r1,#0x10
    bl         Fade_Request
    bl         Sound_AreaSongChange
    pop        {r5}
    ldr        r0,PTR_Cam_Set_080832fc
    bl         SceneCamera_Init
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808314e:
    pop        {pc}


_ts S_Story_02_3
    push       {lr}
    bl         SceneCamera_Main
    cmp        r0,#0x1
    beq        LAB_08083164
    mov        r0,#0x0
    strb       r0,[r5,#0x4]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08083164:
    bl         Scene_IsStartPressed
    beq        LAB_0808316e
    bl         S_Story_02_SkipIfStart
LAB_0808316e:
    pop        {pc}


_ts S_Story_02_4
    push       {lr}
    ldrb       r0,[r5,#0x4]
    add        r1,r0,#0x1
    strb       r1,[r5,#0x4]
    ldr        r1,PTR_DAT_08083300
    ldrb       r1,[r1,r0]
    ldr        r0,PTR_ScenarioData_02_08083304
    push       {r5}
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    bl         Scene_IsStartPressed
    beq        LAB_08083196
    bl         S_Story_02_SkipIfStart
LAB_08083196:
    pop        {pc}


_ts S_Story_02_5
    push       {lr}
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_080831ac
    ldrb       r0,[r5,#0x0]
    add        r0,#0x8
    strb       r0,[r5,#0x0]
LAB_080831ac:
    bl         Scene_IsStartPressed
    beq        LAB_080831b6
    bl         S_Story_02_SkipIfStart
LAB_080831b6:
    pop        {pc}


_ts S_Story_02_6
    push       {lr}
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808314e
    ldr        r0,PTR_Cam_Set_08083308
    bl         SceneCamera_Init
    bl         SceneCamera_Main
    push       {r5}
    bl         Text_DisableDialogue
    mov        r0,#0x11
    bl         Entity_FreeAllMultiple
    ldr        r7,PTR_NPCList_8028A6C
    bl         Map_LoadNPCList
    mov        r0,#0x3
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x3c
    strh       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_Story_02_7
    push       {lr}
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808324a
    mov        r0,r10
    ldr        r0,[r0,#0x4]
    ldrh       r0,[r0,#0x2]
    ldr        r1,DAT_08083310
    and        r1,r0
    beq        LAB_08083226
    push       {r5}
    mov        r0,#0x2
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x8
    strb       r0,[r5,#0x0]
    pop        {pc}
LAB_08083226:
    ldrh       r2,[r5,#0x8]
    sub        r2,#0x1
    cmp        r2,#0x0
    blt        LAB_08083232
    strh       r2,[r5,#0x8]
    b          LAB_0808324a
LAB_08083232:
    ldr        r1,DAT_08083314
    and        r1,r0
    beq        LAB_0808324a
    push       {r5}
    ldr        r0,PTR_ScenarioData_02_08083304
    mov        r1,#0xd
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808324a:
    pop        {pc}


_ts S_Story_02_8
    push       {lr}
    mov        r0,r10
    ldr        r0,[r0,#0x4]
    ldrh       r0,[r0,#0x2]
    ldr        r1,DAT_08083310
    and        r1,r0
    beq        LAB_08083274
    push       {r5}
    mov        r0,#0x40
    bl         Text_EnableOption
    mov        r0,#0x2
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}
LAB_08083274:
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808328a
    mov        r0,#0x1e
    strh       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    sub        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808328a:
    pop        {pc}


_ts S_Story_02_9
    push       {lr}
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080832c4
    push       {r5}
    bl         Text_DisableDialogue
    bl         PlayerAnimation_Unlock
    mov        r0,#0x94
    bl         Flag_SetBase
    mov        r0,#0x0
    bl         Flag_ClearGate
    mov        r0,#0x1
    bl         Flag_ClearGate
    ldr        r0,PTR_MapEntrance_08083318
    mov        r1,#0x0
    bl         World_SetTransitionLocation
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
LAB_080832c4:
    pop        {pc}

    .align 2, 0


MapEntrance_080832c8:
    MapEntrance Map_School_Comp_1, d_s, f(-232, 88, 0)


_ts S_Story_02_SkipIfStart
    push       {lr}
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

    .align 2, 0


PTR_PTR_S_Story_02_0_080832f4:
    .word PTR_S_Story_02_0_0808309c

PTR_NPCList_8028A44:
    .word NPCList_8028A44

PTR_Cam_Set_080832fc:
    .word Cam_Set_08083054

PTR_DAT_08083300:
    .word DAT_080830c4

PTR_ScenarioData_02_08083304:
    .word ScenarioData_02

PTR_Cam_Set_08083308:
    .word Cam_Set_08083080

PTR_NPCList_8028A6C:
    .word NPCList_8028A6C

DAT_08083310:
    .word 0x100

DAT_08083314:
    .word 0x2FF

PTR_MapEntrance_08083318:
    .word MapEntrance_080832c8
