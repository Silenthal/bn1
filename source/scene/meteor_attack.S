#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    cam_end

    .align 2, 0


_ts Scene_MeteorAttack
    push       {lr}
    ldr        r0,PTR_PTR_S_MeteorAttack_0_0808462c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_S_MeteorAttack_0_08084378:
    .word S_MeteorAttack_0
    .word S_MeteorAttack_1
    .word S_MeteorAttack_2
    .word S_MeteorAttack_3
    .word S_MeteorAttack_4


_ts S_MeteorAttack_0
    push       {lr}
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}

    .align 2, 0



_ts S_MeteorAttack_1
    push       {lr}
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_080843f2
    LoadMain world, r0, r7
    push       {r5}
    mov        r0,#0x2e
    bl         PlayerAnimation_SetState
    mov        r0,#0x0
    bl         Camera_SetEnabled
    mov        r0,#0x18
    bl         Entity_FreeAllMultiple
    pop        {r5}
    mov        r0,#0x1
    strh       r0,[r5,#0x8]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    mov        r0,#0x1e
    str        r0,[r5,#0x10]
    mov        r0,#0x0
    str        r0,[r5,#0x1c]
    str        r0,[r5,#0x20]
    push       {r5}
    mov        r0,#0x0
    mov        r1,#0x1e
    bl         Camera_EnableScreenShake
    pop        {r5}
    mov        r0,#0x87
    bl         Sound_PlaySongImmediate
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080843f2:
    pop        {pc}


_ts S_MeteorAttack_2
    push       {lr}
    ldr        r0,[r5,#0x10]
    sub        r0,#0x1
    str        r0,[r5,#0x10]
    cmp        r0,#0x0
    bgt        LAB_0808445e
    mov        r0,#0x0
    str        r0,[r5,#0x10]
    bl         S_MeteorAttack_Meteors
    push       {r5}
    mov        r0,#0xda
    bl         Flag_GetBase
    pop        {r5}
    beq        LAB_0808445e
    push       {r5}
    mov        r0,#0x29
    bl         PlayerAnimation_SetState
    pop        {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#0x28]
    push       {r0,r5}
    ldr        r0,[r0,#0x24]
    ldr        r1,DAT_08084630
    sub        r0,r1,r0
    mov        r1,#0x20
    bl         SWI_Div
    pop        {r1,r5}
    str        r0,[r5,#0x14]
    push       {r5}
    ldr        r0,[r1,#0x28]
    ldr        r1,DAT_08084634
    sub        r0,r1,r0
    mov        r1,#0x20
    bl         SWI_Div
    pop        {r5}
    str        r0,[r5,#0x18]
    mov        r0,#0x0
    str        r0,[r5,#0x10]
    mov        r0,#0x1
    str        r0,[r5,#0x20]
    ldr        r0,PTR_eFrameWaitValue_08084638
    mov        r1,#0x4
    strh       r1,[r0,#0x0]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    b          LAB_08084468
LAB_0808445e:
    bl         Scene_IsStartPressed
    beq        LAB_08084468
    bl         S_MeteorAttack_SkipIfStart
LAB_08084468:
    pop        {pc}

    .align 2, 0



_ts S_MeteorAttack_3
    push       {lr}
    bl         S_MeteorAttack_Meteors
    bl         S_MeteorAttack_AnimatePlayer
    tst        r0,r0
    beq        LAB_0808448c
    push       {r5}
    mov        r0,#0x2
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808448c:
    bl         Scene_IsStartPressed
    beq        LAB_08084496
    bl         S_MeteorAttack_SkipIfStart
LAB_08084496:
    pop        {pc}


_ts S_MeteorAttack_4
    push       {lr}
    bl         S_MeteorAttack_Meteors
    bl         S_MeteorAttack_AnimatePlayer
    LoadMain fade, r0, r7
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080844d4
    ldr        r0,[r7,#0x8]
    mov        r1,#0x4
    strb       r1,[r0,#0x6]
    push       {r5}
    bl         PlayerAnimation_Unlock
    mov        r0,#0xc1
    bl         Flag_SetBase
    ldr        r0,PTR_MapEntrance_0808463c
    mov        r1,#0x0
    bl         World_SetTransitionLocation
    ldr        r0,PTR_eFrameWaitValue_08084640
    mov        r1,#0x1
    strh       r1,[r0,#0x0]
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
LAB_080844d4:
    pop        {pc}

    .align 2, 0


MapEntrance_080844d8:
    MapEntrance Map_ACDC_Lan_Living_Room, d_w, f(-73, -14, 0)


_ts S_MeteorAttack_Meteors
    push       {lr}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    cmp        r0,#0x0
    bgt        LAB_08084540
    ldrh       r0,[r5,#0xa]
    cmp        r0,#0x10
    bge        LAB_08084540
    add        r4,r0,#0x0
    cmp        r0,#0x9
    bne        LAB_08084510
    LoadMain world, r0, r7
    ldr        r0,[r0,#0x28]
    ldrh       r1,[r0,#0x26]
    add        r1,#0x10
    ldrh       r2,[r0,#0x2a]
    ldrh       r3,[r0,#0x2e]
    b          LAB_0808451c
LAB_08084510:
    ldr        r1,PTR_USHORT_ARRAY_ARRAY_08084644
    lsl        r0,r0,#0x3
    add        r0,r0,r1
    ldrh       r1,[r0,#0x0]
    ldrh       r2,[r0,#0x2]
    ldrh       r3,[r0,#0x4]
LAB_0808451c:
    add        r1,#0x80
    add        r3,#0x40
    lsl        r1,r1,#0x10
    lsl        r2,r2,#0x10
    lsl        r3,r3,#0x10
    push       {r4,r5}
    ldrh       r6,[r0,#0x6]
    mov        r0,#0x14
    lsl        r6,r6,#0x8
    orr        r4,r6
    bl         Attack_Alloc
    pop        {r4,r5}
    ldrh       r0,[r5,#0xa]
    add        r0,#0x1
    strh       r0,[r5,#0xa]
    mov        r0,#0xf
    strh       r0,[r5,#0x8]
LAB_08084540:
    pop        {pc}

    .align 2, 0


USHORT_ARRAY_ARRAY_08084544:
    .short 0xFF34
    .short 0xFFB0
    .short 0x0
    .short 0x0
    .short 0xFEDF
    .short 0xFFE0
    .short 0x0
    .short 0x1
    .short 0xFEE5
    .short 0xFF9C
    .short 0x0
    .short 0x0
    .short 0xFEDE
    .short 0xFFCF
    .short 0x0
    .short 0x1
    .short 0xFF1B
    .short 0xFFA5
    .short 0x0
    .short 0x0
    .short 0xFEBC
    .short 0xFFA4
    .short 0x0
    .short 0x1
    .short 0xFEA8
    .short 0xFFDC
    .short 0x0
    .short 0x0
    .short 0xFF18
    .short 0xFFC7
    .short 0x0
    .short 0x1
    .short 0xFF51
    .short 0xFFC0
    .short 0x0
    .short 0x0
    .short 0x0
    .short 0x0
    .short 0x0
    .short 0x1
    .short 0xFEF4
    .short 0xFFB4
    .short 0x0
    .short 0x0
    .short 0xFEED
    .short 0xFFDD
    .short 0x0
    .short 0x1
    .short 0xFEEA
    .short 0xFF8E
    .short 0x0
    .short 0x0
    .short 0xFEB9
    .short -1
    .short 0x0
    .short 0x1
    .short 0xFEB9
    .short 0xFF95
    .short 0x0
    .short 0x0
    .short 0xFE87
    .short 0xFFD7
    .short 0x0
    .short 0x1


_ts S_MeteorAttack_AnimatePlayer
    push       {lr}
    ldr        r0,[r5,#0x20]
    tst        r0,r0
    beq        LAB_0808460e
    ldr        r0,[r5,#0x1c]
    cmp        r0,#0x2
    bge        LAB_08084612
    ldr        r0,[r5,#0x10]
    add        r0,#0x1
    str        r0,[r5,#0x10]
    cmp        r0,#0x20
    bge        LAB_080845ea
    ldr        r0,[r5,#0x14]
    ldr        r1,[r5,#0x18]
    mov        r2,#0x0
    push       {r5}
    bl         PlayerAnimation_Move
    pop        {r5}
LAB_080845ea:
    push       {r5}
    LoadMain world, r0, r0
    ldr        r5,[r0,#0x28]
    bl         SpritePtr_GetFrameStatus
    pop        {r5}
    mov        r1,#0x80
    and        r0,r1
    beq        LAB_0808460e
    ldr        r0,[r5,#0x1c]
    add        r0,#0x1
    str        r0,[r5,#0x1c]
    push       {r5}
    mov        r0,#0x2b
    bl         PlayerAnimation_SetState
    pop        {r5}
LAB_0808460e:
    mov        r0,#0x0
    pop        {pc}
LAB_08084612:
    mov        r0,#0x1
    pop        {pc}

    .align 2, 0



_ts S_MeteorAttack_SkipIfStart
    push       {lr}
    push       {r5}
    mov        r0,#0x2
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x10
    strb       r0,[r5,#0x0]
    pop        {pc}

PTR_PTR_S_MeteorAttack_0_0808462c:
    .word PTR_S_MeteorAttack_0_08084378

DAT_08084630:
    .word 0xFECA0000

DAT_08084634:
    .word 0xFFB00000

PTR_eFrameWaitValue_08084638:
    .word eFrameWaitValue

PTR_MapEntrance_0808463c:
    .word MapEntrance_080844d8

PTR_eFrameWaitValue_08084640:
    .word eFrameWaitValue

PTR_USHORT_ARRAY_ARRAY_08084644:
    .word USHORT_ARRAY_ARRAY_08084544
