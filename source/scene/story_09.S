#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Scene_Story_09
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_09_0_080848f0
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_S_Story_09_0_08084724:
    .word S_Story_09_0
    .word S_Story_09_1
    .word S_Story_09_2
    .word S_Story_09_3
    .word S_Story_09_4
    .word S_Story_09_5
    .word S_Story_09_6
    .word 0


_ts S_Story_09_0
    push       {lr}
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    Scene_Next
    pop        {pc}

    .align 2, 0



_ts S_Story_09_1
    push       {lr}
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_0808477a
    push       {r5}
    mov        r0,#0x6
    bl         PlayerAnimation_SetState
    pop        {r5}
    mov        r0,#0x3c
    strh       r0,[r5,#Scene_counter]
    Scene_Next
LAB_0808477a:
    pop        {pc}


_ts S_Story_09_2
    push       {lr}
    ldrh       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strh       r0,[r5,#Scene_sceneTimer]
    cmp        r0,#0x0
    bgt        LAB_0808479a
    bl         S_Story_09_Explosion
    push       {r5}
    bl         Rng_RandomUint
    pop        {r5}
    mov        r1,#0x7
    and        r0,r1
    strh       r0,[r5,#Scene_sceneTimer]
LAB_0808479a:
    ldrh       r0,[r5,#Scene_counter]
    sub        r0,#0x1
    strh       r0,[r5,#Scene_counter]
    cmp        r0,#0x0
    bgt        LAB_080847ba
    mov        r0,#0x0
    strh       r0,[r5,#Scene_counter]
    push       {r5}
    ldr        r0,PTR_ScenarioData_09_080848f4
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
LAB_080847ba:
    pop        {pc}


_ts S_Story_09_3
    push       {lr}
    push       {r5}
    Flag_GetBase 0xD5
    pop        {r5}
    beq        LAB_080847da
    push       {r5}
    mov        r0,#0x1a
    bl         PlayerAnimation_SetState
    Flag_ClearBase 0xD5
    pop        {r5}
LAB_080847da:
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_080847fa
    mov        r0,#0x78
    strh       r0,[r5,#Scene_sceneTimer]
    push       {r5}
    mov        r0,#0x8
    bl         PetStatusControl_SetState
    pop        {r5}
    Scene_Next
LAB_080847fa:
    bl         Scene_IsStartPressed
    beq        LAB_08084804
    bl         S_Story_09_SkipIfStart
LAB_08084804:
    pop        {pc}

    .align 2, 0



_ts S_Story_09_4
    push       {lr}
    ldrh       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strh       r0,[r5,#Scene_sceneTimer]
    tst        r0,r0
    bne        LAB_0808482c
    push       {r5}
    mov        r0,#0x0
    bl         PetStatusControl_SetState
    ldr        r0,PTR_ScenarioData_09_080848f4
    mov        r1,#0x8
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
LAB_0808482c:
    bl         Scene_IsStartPressed
    beq        LAB_08084836
    bl         S_Story_09_SkipIfStart
LAB_08084836:
    pop        {pc}


_ts S_Story_09_5
    push       {lr}
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808484c
    Scene_Next
LAB_0808484c:
    bl         Scene_IsStartPressed
    beq        LAB_08084856
    bl         S_Story_09_SkipIfStart
LAB_08084856:
    pop        {pc}


_ts S_Story_09_6
    push       {lr}
    push       {r5}
    bl         Text_DisableDialogue
    mov        r0,#0x0
    bl         PetStatusControl_SetState
    LoadMain world, r7, r7
    ldr        r7,[r7,#World_playerLocation]
    mov        r0,#0x4
    strb       r0,[r7,#0x10]
    bl         PlayerAnimation_SetState
    Flag_ClearBase 0xD5
    bl         PlayerAnimation_Unlock
    Flag_SetBase 0xC4
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}


_ts S_Story_09_Explosion
    push       {lr}
    mov        r0,#0x76
    bl         Sound_PlaySE
    push       {r5}
    mov        r0,#0x0
    mov        r1,#0xa
    bl         Camera_EnableScreenShake
    bl         Rng_RandomUint
    pop        {r5}
    mov        r1,#0x3
    and        r0,r1
    ldr        r1,PTR_USHORT_ARRAY_ARRAY_080848f8
    lsl        r0,r0,#0x3
    add        r0,r0,r1
    ldrh       r1,[r0,#0x0]
    ldrh       r2,[r0,#0x2]
    ldrh       r3,[r0,#0x4]
    lsl        r1,r1,#0x10
    lsl        r2,r2,#0x10
    lsl        r3,r3,#0x10
    push       {r5}
    mov        r0,#0xa
    mov        r4,#0x0
    bl         Effect_Alloc
    pop        {r5}
    pop        {pc}

USHORT_ARRAY_ARRAY_080848c8:
    .short 0xFF9A
    .short 0xFFD0
    .short 0x4
    .short 0xFF
    .short 0xFFA0
    .short 0xFFD0
    .short 0x8
    .short 0xFF
    .short 0xFFAC
    .short 0xFFD0
    .short 0x10
    .short 0xFF
    .short 0xFFAA
    .short 0xFFD4
    .short 0x4
    .short 0xFF


_ts S_Story_09_SkipIfStart
    push       {lr}
    mov        r0,#0x18
    strb       r0,[r5,#Scene_state_s0]
    pop        {pc}

PTR_PTR_S_Story_09_0_080848f0:
    .word PTR_S_Story_09_0_08084724

PTR_ScenarioData_09_080848f4:
    .word ScenarioData_09

PTR_USHORT_ARRAY_ARRAY_080848f8:
    .word USHORT_ARRAY_ARRAY_080848c8
