#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


Cam_Set_08094598:
    cam_set -346, 454, 0
    cam_end

Cam_Set_080945a2:
    cam_set -346, 454, 0
    cam_move 0, -128, 0, 200
    cam_end

Cam_Move_080945b6:
    cam_move 0, 128, 0, 200
    cam_end

    .align 2, 0



_ts Scene_Story_71
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_71_0_080945d0
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_PTR_S_Story_71_0_080945d0:
    .word PTR_S_Story_71_0_080945d4

PTR_S_Story_71_0_080945d4:
    .word S_Story_71_0
    .word S_Story_71_1
    .word S_Story_71_2
    .word S_Story_71_3
    .word S_Story_71_4
    .word S_Story_71_5
    .word S_Story_71_6
    .word S_Story_71_7
    .word S_Story_71_8
    .word S_Story_71_9
    .word S_Story_71_10
    .word S_Story_71_11
    .word S_Story_71_12
    .word S_Story_71_13
    .word S_Story_71_14
    .word S_Story_71_15
    .word S_Story_71_16
    .word S_Story_71_17
    .word S_Story_71_18
    .word S_Story_71_19
    .word S_Story_71_20
    .word S_Story_71_21
    .word S_Story_71_22


_ts S_Story_71_0
    bl         Flag_SetPlayerInactive
    bl         PlayerAnimation_Lock
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_Story_71_1
    bl         PlayerAnimation_GetState
    cmp        r0,#0x2
    bne        LAB_080946a8
    mov        r0,#0x7
    bl         PlayerAnimation_SetState
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080946a8
    ldr        r0,PTR_PTR_Cam_Set_080946ac
    ldr        r0,[r0,#0x0]
    bl         SceneCamera_Init
    bl         SceneCamera_Main
    push       {r5}
    mov        r0,#0xad
    lsl        r0,r0,#0x1
    neg        r0,r0
    lsl        r0,r0,#0x10
    mov        r1,#0xe3
    lsl        r1,r1,#0x11
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    bl         DisableBoundaryCheck
    mov        r0,#0x7
    bl         PlayerAnimation_SetState
    pop        {r5}
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x5
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080946a8:
    pop        {pc}

    .align 2, 0


PTR_PTR_Cam_Set_080946ac:
    .word PTR_Cam_Set_080946b0

PTR_Cam_Set_080946b0:
    .word Cam_Set_08094598
    .word Cam_Set_080945a2
    .word Cam_Move_080945b6


_ts S_Story_71_2
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08094708
    mov        r0,#0xf
    bl         PlayerAnimation_SetState
    mov        r0,#0x0
    mov        r1,#0x8
    neg        r1,r1
    lsl        r1,r1,#0xc
    mov        r2,#0x0
    bl         PlayerAnimation_Move
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_080946fe
    mov        r0,#0x31
    bl         PlayerAnimation_SetState
    push       {r5}
    ldr        r0,PTR_ScenarioData_71_0809470c
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080946fe:
    bl         Scene_IsStartPressed
    beq        LAB_08094708
    bl         S_Story_71_SkipIfStart
LAB_08094708:
    pop        {pc}

    .align 2, 0


PTR_ScenarioData_71_0809470c:
    .word ScenarioData_71


_ts S_Story_71_3
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0809472c
    ldr        r0,PTR_Cam_Set_0809477c
    bl         SceneCamera_Init
    bl         SceneCamera_Main
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0809472c:
    bl         Scene_IsStartPressed
    beq        LAB_08094736
    bl         S_Story_71_SkipIfStart
LAB_08094736:
    pop        {pc}


_ts S_Story_71_4
    bl         SceneCamera_Main
    cmp        r0,#0x1
    beq        LAB_0809474a
    mov        r0,#0x3c
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0809474a:
    bl         Scene_IsStartPressed
    beq        LAB_08094754
    bl         S_Story_71_SkipIfStart
LAB_08094754:
    pop        {pc}


_nt S_Story_71_5
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_08094770
    ldr        r0,PTR_Cam_Move_08094780
    bl         SceneCamera_Init
    bl         SceneCamera_Main
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08094770:
    bl         Scene_IsStartPressed
    beq        LAB_0809477a
    bl         S_Story_71_SkipIfStart
LAB_0809477a:
    pop        {pc}

PTR_Cam_Set_0809477c:
    .word Cam_Set_080945a2

PTR_Cam_Move_08094780:
    .word Cam_Move_080945b6


_ts S_Story_71_6
    bl         SceneCamera_Main
    cmp        r0,#0x1
    beq        LAB_0809479e
    push       {r5}
    ldr        r0,PTR_ScenarioData_71_08094b7c
    mov        r1,#0x2
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0809479e:
    bl         Scene_IsStartPressed
    beq        LAB_080947a8
    bl         S_Story_71_SkipIfStart
LAB_080947a8:
    pop        {pc}


_nt S_Story_71_7
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_080947e0
    mov        r0,#0x7
    bl         PlayerAnimation_SetState
    push       {r5}
    mov        r0,#0x10
    bl         Entity_FreeAllMultiple
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_804DFC8_08094b80
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0xde
    bl         Sound_PlaySongImmediate
    mov        r0,#0x54
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080947e0:
    bl         Scene_IsStartPressed
    beq        LAB_080947ea
    bl         S_Story_71_SkipIfStart
LAB_080947ea:
    pop        {pc}


_ts S_Story_71_8
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_08094814
    mov        r0,#0xdf
    bl         Sound_PlaySongImmediate
    push       {r5}
    mov        r0,#0x2
    mov        r1,#0x20
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x3c
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}
LAB_08094814:
    bl         Scene_IsStartPressed
    beq        LAB_0809481e
    bl         S_Story_71_SkipIfStart
LAB_0809481e:
    pop        {pc}


_ts S_Story_71_9
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0809485c
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_0809485c
    push       {r5}
    mov        r0,#0x10
    bl         Entity_FreeAllMultiple
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_804E004_08094b84
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    mov        r0,#0x1
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0809485c:
    pop        {pc}


_nt S_Story_71_10
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0809487c
    push       {r5}
    ldr        r0,PTR_ScenarioData_71_08094b7c
    mov        r1,#0x6
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0809487c:
    pop        {pc}


_nt S_Story_71_11
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_080948ac
    mov        r0,#0x19
    strb       r0,[r5,#0x8]
    mov        r0,#0xf
    bl         PlayerAnimation_SetState
    push       {r5}
    mov        r0,#0x1
    LoadMain world, r1, r1
    ldr        r1,[r1,#0x28]
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080948ac:
    bl         Scene_IsStartPressed
    beq        LAB_080948b6
    bl         S_Story_71_SkipIfStart
LAB_080948b6:
    pop        {pc}


_ts S_Story_71_12
    mov        r0,#0x0
    mov        r1,#0x10
    neg        r1,r1
    lsl        r1,r1,#0xc
    mov        r2,#0x0
    bl         PlayerAnimation_Move
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_080948e0
    mov        r0,#0xe
    bl         PlayerAnimation_SetState
    mov        r0,#0x14
    strh       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080948e0:
    bl         Scene_IsStartPressed
    beq        LAB_080948ea
    bl         S_Story_71_SkipIfStart
LAB_080948ea:
    pop        {pc}


_ts S_Story_71_13
    mov        r0,#0x10
    neg        r0,r0
    lsl        r0,r0,#0xc
    mov        r1,#0x10
    neg        r1,r1
    lsl        r1,r1,#0xc
    mov        r2,#0x0
    bl         PlayerAnimation_Move
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_08094918
    mov        r0,#0x8
    bl         PlayerAnimation_SetState
    mov        r0,#0x14
    strh       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08094918:
    bl         Scene_IsStartPressed
    beq        LAB_08094922
    bl         S_Story_71_SkipIfStart
LAB_08094922:
    pop        {pc}


_ts S_Story_71_14
    mov        r0,#0x10
    lsl        r0,r0,#0xc
    mov        r1,#0x10
    neg        r1,r1
    lsl        r1,r1,#0xc
    mov        r2,#0x0
    bl         PlayerAnimation_Move
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_0809495e
    push       {r5}
    mov        r0,#0x10
    bl         Entity_FreeAllMultiple
    ldr        r7,PTR_NPCList_804E020_08094b88
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0xf
    bl         PlayerAnimation_SetState
    mov        r0,#0x3c
    strh       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0809495e:
    bl         Scene_IsStartPressed
    beq        LAB_08094968
    bl         S_Story_71_SkipIfStart
LAB_08094968:
    pop        {pc}


_nt S_Story_71_15
    mov        r0,#0x0
    mov        r1,#0x10
    neg        r1,r1
    lsl        r1,r1,#0xc
    mov        r2,#0x0
    bl         PlayerAnimation_Move
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_08094992
    mov        r0,#0x31
    bl         PlayerAnimation_SetState
    mov        r0,#0xa
    strh       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08094992:
    bl         Scene_IsStartPressed
    beq        LAB_0809499c
    bl         S_Story_71_SkipIfStart
LAB_0809499c:
    pop        {pc}


_nt S_Story_71_16
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_080949b2
    mov        r0,#0xa1
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080949b2:
    bl         Scene_IsStartPressed
    beq        LAB_080949bc
    bl         S_Story_71_SkipIfStart
LAB_080949bc:
    pop        {pc}


_nt S_Story_71_17
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    cmp        r0,#0x0
    beq        LAB_080949ec
    mov        r1,#0x7
    and        r0,r1
    bne        LAB_08094a10
    LoadMain world, r7, r7
    ldr        r7,[r7,#0x28]
    mov        r0,#0xff
    strb       r0,[r7,#0x15]
    mov        r0,#0x6e
    bl         Sound_PlaySongImmediate
    Flag_SetBase 0xB4
    mov        r0,#0x36
    bl         PlayerAnimation_SetState
    b          LAB_08094a10
LAB_080949ec:
    Flag_SetBase 0xB5
    mov        r0,#0xa9
    bl         Sound_PlaySongImmediate
    mov        r0,#0x31
    bl         PlayerAnimation_SetState
    push       {r5}
    mov        r0,#0x2
    mov        r1,#0x80
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08094a10:
    bl         Scene_IsStartPressed
    beq        LAB_08094a1a
    bl         S_Story_71_SkipIfStart
LAB_08094a1a:
    pop        {pc}


_ts S_Story_71_18
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08094a3e
    push       {r5}
    mov        r0,#0x1
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x1e
    strh       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08094a3e:
    pop        {pc}


_ts S_Story_71_19
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08094a78
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_08094a6e
    mov        r0,#0x32
    bl         PlayerAnimation_SetState
    push       {r5}
    ldr        r0,PTR_ScenarioData_71_08094b7c
    mov        r1,#0x8
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08094a6e:
    bl         Scene_IsStartPressed
    beq        LAB_08094a78
    bl         S_Story_71_SkipIfStart
LAB_08094a78:
    pop        {pc}


_nt S_Story_71_20
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08094a98
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08094a98:
    bl         Scene_IsStartPressed
    beq        LAB_08094aa2
    bl         S_Story_71_SkipIfStart
LAB_08094aa2:
    pop        {pc}


_ts S_Story_71_21
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08094b38
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    push       {r5}
    ldr        r0,DAT_08094b8c
    neg        r0,r0
    lsl        r0,r0,#0x10
    ldr        r1,DAT_08094b90
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    bl         DisableBoundaryCheck
    mov        r0,#0x4
    bl         PlayerAnimation_SetState
    pop        {r5}
    push       {r5}
    mov        r0,#0x1
    LoadMain world, r1, r1
    ldr        r1,[r1,#0x28]
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    mov        r0,#0x1c
    bl         Entity_FreeAllMultiple
    pop        {r5}
    LoadMain world, r0, r0
    mov        r1,#0x0
    str        r1,[r0,#0x34]
    push       {r5}
    ldr        r7,PTR_NPCList_804DFAC_08094b94
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0xdf
    add        r2,r0,#0x0
    add        r2,#0x11
LAB_08094b10:
    push       {r0}
    bl         Flag_ClearBase
    pop        {r0}
    add        r0,#0x1
    cmp        r0,r2
    bne        LAB_08094b10
    mov        r0,#0x0
    mov        r2,#0x16
    bl         FUN_0804d3fe
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08094b38:
    pop        {pc}


_nt S_Story_71_22
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08094b60
    push       {r5}
    bl         EnableBoundaryCheck
    bl         PlayerAnimation_Unlock
    bl         Flag_SetPlayerActive
    Flag_SetBase 0xB2
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
LAB_08094b60:
    pop        {pc}


_nt S_Story_71_SkipIfStart
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x54
    strb       r0,[r5,#0x0]
    pop        {pc}

    .align 2, 0


PTR_ScenarioData_71_08094b7c:
    .word ScenarioData_71

PTR_NPCList_804DFC8_08094b80:
    .word NPCList_804DFC8

PTR_NPCList_804E004_08094b84:
    .word NPCList_804E004

PTR_NPCList_804E020_08094b88:
    .word NPCList_804E020

DAT_08094b8c:
    .word 0x15A

DAT_08094b90:
    .word 0x13B

PTR_NPCList_804DFAC_08094b94:
    .word NPCList_804DFAC
