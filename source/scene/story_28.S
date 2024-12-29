#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


Cam_Set_080894e4:
    cam_set 90, 88, 0
    cam_end

    .align 2, 0

PlayerAnimateArgs_894F0:
    player_anim 11, 0, 8, -128
    player_anim 13, -8, 0, 64
    player_anim 15, 0, -8, -128
    player_anim 9, 8, 0, 64
    player_anim 11, 0, 8, 32
    player_anim -1, 0, 0, 0


_ts Scene_Story_28
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_28_0_08089774
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_28_0_08089514:
    .word S_Story_28_0
    .word S_Story_28_1
    .word S_Story_28_2
    .word S_Story_28_3
    .word S_Story_28_4
    .word S_Story_28_5
    .word S_Story_28_6
    .word S_Story_28_7
    .word S_Story_28_8


_ts S_Story_28_0
    push       {r5}
    bl         Sound_StopAllMusic
    pop        {r5}
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_Story_28_1
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_08089590
    push       {r5}
    mov        r0,#0x5a
    lsl        r0,r0,#0x10
    mov        r1,#0x58
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    mov        r0,#0x4
    bl         PlayerAnimation_SetState
    pop        {r5}
    ldr        r0,PTR_Cam_Set_08089778
    bl         SceneCamera_Init
    bl         SceneCamera_Main
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08089590:
    pop        {pc}


_nt S_Story_28_2
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080895ba
    push       {r5}
    ldr        r0,PTR_ScenarioData_28_0808977c
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    bl         Scene_IsStartPressed
    beq        LAB_080895ba
    bl         S_Story_28_SkipIfStart
LAB_080895ba:
    pop        {pc}


_ts S_Story_28_3
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_080895dc
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    b          LAB_080895e6
LAB_080895dc:
    bl         Scene_IsStartPressed
    beq        LAB_080895e6
    bl         S_Story_28_SkipIfStart
LAB_080895e6:
    pop        {pc}


_ts S_Story_28_4
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08089616
    ldr        r7,PTR_PlayerAnimateArgs_08089780
    str        r7,[r5,#0x18]
    mov        r0,#0x0
    str        r0,[r5,#0x10]
    mov        r0,#0xff
    str        r0,[r5,#0x14]
    mov        r0,#0x1
    str        r0,[r5,#0x1c]
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08089616:
    pop        {pc}


_ts S_Story_28_5
    bl         S_Story_28_PlayerMove
    tst        r0,r0
    bne        LAB_08089638
    mov        r0,#0x4
    bl         PlayerAnimation_SetState
    push       {r5}
    ldr        r0,PTR_ScenarioData_28_0808977c
    mov        r1,#0x4
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08089638:
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808964e
    bl         Scene_IsStartPressed
    beq        LAB_0808964e
    bl         S_Story_28_SkipIfStart
LAB_0808964e:
    pop        {pc}


_ts S_Story_28_6
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808966e
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
LAB_0808966e:
    bl         Scene_IsStartPressed
    beq        LAB_08089678
    bl         S_Story_28_SkipIfStart
LAB_08089678:
    pop        {pc}


_nt S_Story_28_7
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080896ce
    push       {r5}
    mov        r0,#0x5a
    lsl        r0,r0,#0x10
    mov        r1,#0x68
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    mov        r0,#0x4
    bl         PlayerAnimation_SetState
    LoadMain world, r7, r7
    ldr        r5,[r7,#0x28]
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080896ce:
    pop        {pc}


_ts S_Story_28_8
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080896fe
    push       {r5}
    bl         PlayerAnimation_Unlock
    pop        {r5}
    mov        r0,#0xbf
    bl         Flag_SetBase
    push       {r5}
    mov        r0,#0x3
    bl         Sound_ChangeSong
    pop        {r5}
    mov        r0,#0xdf
    bl         Flag_SetBase
    bl         Scene_UnloadAndResetStepCounter
LAB_080896fe:
    pop        {pc}


_ts S_Story_28_SkipIfStart
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    push       {r5}
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x1c
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_Story_28_PlayerMove
    push       {lr}
    ldr        r0,[r5,#0x1c]
    tst        r0,r0
    beq        LAB_08089770
    ldr        r7,[r5,#0x18]
    ldr        r0,[r5,#0x10]
    cmp        r0,#0x0
    bgt        LAB_0808974c
    ldrb       r0,[r7,#0x4]
    cmp        r0,#0xff
    bne        LAB_08089738
    mov        r1,#0x2
    str        r1,[r5,#0x1c]
    sub        r7,#0x4
LAB_08089738:
    add        r7,#0x4
    str        r7,[r5,#0x18]
    ldr        r1,[r5,#0x14]
    cmp        r0,r1
    beq        LAB_0808974a
    push       {r5,r7}
    bl         PlayerAnimation_SetState
    pop        {r5,r7}
LAB_0808974a:
    ldrb       r0,[r7,#0x3]
LAB_0808974c:
    sub        r0,#0x1
    str        r0,[r5,#0x10]
    mov        r3,#0x1
    ldrsb      r0,[r7,r3]
    lsl        r0,r0,#0xc
    mov        r3,#0x2
    ldrsb      r1,[r7,r3]
    lsl        r1,r1,#0xc
    mov        r2,#0x0
    push       {r5}
    bl         PlayerAnimation_Move
    pop        {r5}
    ldr        r0,[r5,#0x1c]
    cmp        r0,#0x2
    beq        LAB_08089770
    mov        r0,#0x1
    pop        {pc}
LAB_08089770:
    mov        r0,#0x0
    pop        {pc}

PTR_PTR_S_Story_28_0_08089774:
    .word PTR_S_Story_28_0_08089514

PTR_Cam_Set_08089778:
    .word Cam_Set_080894e4

PTR_ScenarioData_28_0808977c:
    .word ScenarioData_28

PTR_PlayerAnimateArgs_08089780:
    .word PlayerAnimateArgs_894F0 - 4
