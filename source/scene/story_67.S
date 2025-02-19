#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Scene_Story_67
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_67_0_08093358
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_67_0_08093084:
    .word S_Story_67_0
    .word S_Story_67_1
    .word S_Story_67_2
    .word S_Story_67_3
    .word S_Story_67_4
    .word S_Story_67_5
    .word S_Story_67_6
    .word S_Story_67_7
    .word S_Story_67_8
    .word S_Story_67_9
    .word S_Story_67_10
    .word S_Story_67_11


_ts S_Story_67_0
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    mov        r0,#0x1
    strb       r0,[r5,#Scene_counter]
    Scene_Next
    pop        {pc}


_ts S_Story_67_1
    bl         PlayerAnimation_GetState
    cmp        r0,#0x2
    bne        LAB_0809310a
    Flag_ClearBase 0xBE
    push       {r5}
    bl         Effect_BombMan_Create
    pop        {r5}
    push       {r5}
    ldr        r0,DAT_0809335c
    lsl        r0,r0,#0x10
    mov        r1,#0xac
    neg        r1,r1
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    mov        r0,#0x2e
    bl         PlayerAnimation_SetState
    pop        {r5}
    push       {r5}
    FadeIn_Black
    pop        {r5}
    Scene_Next
LAB_0809310a:
    pop        {pc}


_ts S_Story_67_2
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0809312a
    push       {r5}
    ldr        r0,PTR_ScenarioData_67_08093360
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
LAB_0809312a:
    pop        {pc}


_ts S_Story_67_3
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0809315a
    Flag_SetBase 0x9D
    Flag_SetItem F_ITEM_30E
    mov        r0,#0x85
    bl         Sound_PlaySE
    mov        r0,#0x32
    bl         PlayerAnimation_SetState
    mov        r0,#0x3c
    strb       r0,[r5,#Scene_sceneTimer]
    Scene_Next
LAB_0809315a:
    bl         Scene_IsStartPressed
    beq        LAB_08093164
    bl         S_Story_67_SkipIfStart
LAB_08093164:
    pop        {pc}


_nt S_Story_67_4
    ldrb       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    tst        r0,r0
    bne        LAB_08093188
    mov        r0,#0x2e
    bl         PlayerAnimation_SetState
    push       {r5}
    ldr        r0,PTR_ScenarioData_67_08093360
    mov        r1,#0x1
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
LAB_08093188:
    bl         Scene_IsStartPressed
    beq        LAB_08093192
    bl         S_Story_67_SkipIfStart
LAB_08093192:
    pop        {pc}


_ts S_Story_67_5
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_080931b8
    Flag_SetBase 0x9C
    push       {r5}
    ldr        r0,PTR_ScenarioData_67_08093360
    mov        r1,#0x4
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
LAB_080931b8:
    bl         Scene_IsStartPressed
    beq        LAB_080931c2
    bl         S_Story_67_SkipIfStart
LAB_080931c2:
    pop        {pc}


_ts S_Story_67_6
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_080931e6
    Flag_SetBase 0x9C
    mov        r0,#0x43
    bl         PlayerAnimation_SetState
    Scene_Next
    mov        r0,#0x1e
    strb       r0,[r5,#Scene_sceneTimer]
LAB_080931e6:
    bl         Scene_IsStartPressed
    beq        LAB_080931f0
    bl         S_Story_67_SkipIfStart
LAB_080931f0:
    pop        {pc}


_nt S_Story_67_7
    Flag_GetBase 0x9C
    beq        LAB_08093236
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08093236
    ldrb       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    tst        r0,r0
    bne        LAB_08093236
    push       {r5}
    ldr        r0,PTR_BgTask_80518A8_08093364
    bl         BgTask_AddNew
    pop        {r5}
    mov        r0,#0xed
    bl         Sound_PlaySE
    push       {r5}
    FadeIn_White
    pop        {r5}
    mov        r0,#0x3c
    strb       r0,[r5,#Scene_sceneTimer]
    Scene_Next
LAB_08093236:
    pop        {pc}


_ts S_Story_67_8
    ldrb       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    tst        r0,r0
    bne        LAB_08093266
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08093266
    mov        r0,#0x2e
    bl         PlayerAnimation_SetState
    push       {r5}
    ldr        r0,PTR_ScenarioData_67_08093360
    mov        r1,#0x6
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
LAB_08093266:
    pop        {pc}


_ts S_Story_67_9
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08093286
    push       {r5}
    FadeOut_Black
    pop        {r5}
    Scene_Next
LAB_08093286:
    bl         Scene_IsStartPressed
    beq        LAB_08093290
    bl         S_Story_67_SkipIfStart
LAB_08093290:
    pop        {pc}


_nt S_Story_67_10
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08093304
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    push       {r5}
    mov        r0,#0x18
    bl         Entity_FreeAllMultiple
    pop        {r5}
    LoadMain world, r0, r0
    mov        r1,#0x0
    str        r1,[r0,#0x34]
    push       {r5}
    ldr        r7,PTR_NPCList_80548BC_08093368
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    bl         Camera_DisableScreenShake
    pop        {r5}
    mov        r0,#0x1
    bl         PlayerAnimation_SetState
    push       {r5}
    mov        r0,#0x2d
    mov        r1,#0x1
    bl         KeyItem_AddAmount
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_BgTask_80518A8_0809336c
    bl         BgTask_AddNew
    pop        {r5}
    Flag_SetItem F_ITEM_30E
    push       {r5}
    FadeIn_Black
    pop        {r5}
    Scene_Next
LAB_08093304:
    pop        {pc}


_nt S_Story_67_11
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0809333e
    push       {r5}
    bl         PlayerAnimation_Unlock
    pop        {r5}
    Flag_SetBase 0x9B
    Flag_SetEvent 0x2D
    Flag_ClearBase 0x63
    Flag_ClearBase 0x2F
    LoadMain world, r0, r0
    mov        r1,#0x52
    strb       r1,[r0,#0x6]
    bl         Scene_UnloadAndResetStepCounter
LAB_0809333e:
    pop        {pc}


_ts S_Story_67_SkipIfStart
    push       {r5}
    FadeOutFast_Black
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x28
    strb       r0,[r5,#Scene_state_s0]
    pop        {pc}

PTR_PTR_S_Story_67_0_08093358:
    .word PTR_S_Story_67_0_08093084

DAT_0809335c:
    .word 0x156

PTR_ScenarioData_67_08093360:
    .word ScenarioData_67

PTR_BgTask_80518A8_08093364:
    .word BgTask_80518A8

PTR_NPCList_80548BC_08093368:
    .word NPCList_80548BC

PTR_BgTask_80518A8_0809336c:
    .word BgTask_80518A8
