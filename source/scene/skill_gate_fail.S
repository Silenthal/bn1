#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    cam_end

    .align 2, 0


MapEntranceOptions_ARRAY_08085b40:
    MapEntrance Map_Undernet_6, d_ne, f(-554, 140, 64)
    .byte 0xB, 0x0, 0x0, 0x0
    MapEntrance Map_Undernet_6, d_ne, f(-554, 140, 64)
    .byte 0xD, 0x0, 0x0, 0x0
    MapEntrance Map_Undernet_7, d_ne, f(-498, -124, 0)
    .byte 0xB, 0x0, 0x0, 0x0
    MapEntrance Map_Undernet_9, d_ne, f(-364, -224, 0)
    .byte 0xB, 0x0, 0x0, 0x0
    MapEntrance Map_Undernet_10, d_ne, f(-386, -204, 0)
    .byte 0xB, 0x0, 0x0, 0x0
    MapEntrance Map_Undernet_11, d_ne, f(-450, -220, 64)
    .byte 0xB, 0x0, 0x0, 0x0


_ts Scene_SkillGateFail
    push       {lr}
    ldr        r0,PTR_PTR_S_SkillGateFail_0_08085dc4
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_S_SkillGateFail_0_08085bc8:
    .word S_SkillGateFail_0
    .word S_SkillGateFail_1
    .word S_SkillGateFail_2
    .word S_SkillGateFail_3
    .word S_SkillGateFail_4


_ts S_SkillGateFail_0
    push       {lr}
    ldr        r0,PTR_MapEntranceOptions_ARRAY_08085dc8
    ldrb       r1,[r5,#0x4]
    mov        r2,#0x14
    mul        r2,r1
    add        r0,r0,r2
    str        r0,[r5,#0x10]
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}

    .align 2, 0



_ts S_SkillGateFail_1
    push       {lr}
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_08085c30
    push       {r5}
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldr        r0,[r0,#0x28]
    ldrb       r0,[r0,#0x14]
    mov        r1,#0x7
    and        r0,r1
    bl         PlayerAnimation_SetState
    pop        {r5}
    push       {r5}
    ldr        r0,[r5,#0x10]
    ldrb       r0,[r0,#0x10]
    bl         Text_LoadAreaDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08085c30:
    pop        {pc}

    .align 2, 0



_ts S_SkillGateFail_2
    push       {lr}
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08085c48
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08085c48:
    pop        {pc}

    .align 2, 0



_ts S_SkillGateFail_3
    push       {lr}
    mov        r0,#0x20
    bl         Flag_GetEvent
    beq        LAB_08085c62
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
LAB_08085c62:
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}

    .align 2, 0



_ts S_SkillGateFail_4
    push       {lr}
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08085cbe
    push       {r5}
    bl         PlayerAnimation_Unlock
    pop        {r5}
    ldrb       r1,[r5,#0x4]
    lsl        r1,r1,#0x2
    ldr        r7,PTR_INT_08085dcc
    ldr        r0,[r7,r1]
    bl         Flag_GetEvent
    beq        LAB_08085cba
    ldrb       r1,[r5,#0x4]
    lsl        r1,r1,#0x2
    ldr        r7,PTR_INT_08085dd0
    ldr        r0,[r7,r1]
    bl         Flag_ClearEvent
    bl         S_SkillGateFail_ResetSkillCheck
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x2c]
    mov        r1,#0x1
    strb       r1,[r0,#0x10]
    mov        r1,#0x1
    strb       r1,[r0,#0x12]
    ldr        r1,[r5,#0x10]
    str        r1,[r0,#0x14]
    mov        r0,#0x0
    bl         World_ChangeMap
    pop        {r5}
LAB_08085cba:
    bl         Scene_UnloadAndResetStepCounter
LAB_08085cbe:
    pop        {pc}

INT_08085cc0:
    .word 0x20
    .word 0x20
    .word 0x20
    .word 0x20
    .word 0x20
    .word 0x20


_ts S_SkillGateFail_ResetSkillCheck
    push       {lr}
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrb       r1,[r7,#0x5]
    lsl        r1,r1,#0x2
    ldr        r0,PTR_PTR_ResetSkillCheck_None_08085dd4
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0


PTR_ResetSkillCheck_None_08085cf0:
    .word ResetSkillCheck_None
    .word ResetSkillCheck_None
    .word ResetSkillCheck_None
    .word ResetSkillCheck_None
    .word ResetSkillCheck_None
    .word ResetSkillCheck_None
    .word ResetSkillCheck_None
    .word ResetSkillCheck_None
    .word ResetSkillCheck_None
    .word ResetSkillCheck_Undernet_6
    .word ResetSkillCheck_Undernet_7
    .word ResetSkillCheck_None
    .word ResetSkillCheck_Undernet_9
    .word ResetSkillCheck_Undernet_10
    .word ResetSkillCheck_Undernet_11
    .word ResetSkillCheck_None


_ts ResetSkillCheck_None
    push       {lr}
    pop        {pc}


_ts ResetSkillCheck_Undernet_6
    push       {lr}
    mov        r7,r10
    ldr        r7,[r7,#0x24]
    mov        r0,#0x0
    strb       r0,[r7,#0x2]
    mov        r7,r10
    ldr        r7,[r7,#0x78]
    mov        r0,#0x0
    strb       r0,[r7,#0xd]
    mov        r0,#0x21
    bl         Flag_ClearEvent
    pop        {pc}

    .align 2, 0



_ts ResetSkillCheck_Undernet_7
    push       {lr}
    mov        r7,r10
    ldr        r4,[r7,#0x24]
    mov        r0,#0x0
    strb       r0,[r4,#0x2]
    ldr        r4,[r7,#0x8]
    mov        r0,#0x4
    strb       r0,[r4,#0x19]
    ldr        r4,[r7,#0x78]
    mov        r0,#0x0
    strb       r0,[r4,#0xd]
    mov        r0,#0x22
    bl         Flag_ClearEvent
    pop        {pc}

    .align 2, 0



_ts ResetSkillCheck_Undernet_9
    push       {lr}
    mov        r7,r10
    ldr        r4,[r7,#0x24]
    mov        r0,#0x0
    strb       r0,[r4,#0x2]
    ldr        r4,[r7,#0x78]
    mov        r0,#0x0
    strb       r0,[r4,#0xe]
    mov        r0,#0x23
    bl         Flag_ClearEvent
    pop        {pc}


_ts ResetSkillCheck_Undernet_10
    push       {lr}
    mov        r7,r10
    ldr        r7,[r7,#0x24]
    mov        r0,#0x0
    strb       r0,[r7,#0x2]
    mov        r7,r10
    ldr        r7,[r7,#0x78]
    mov        r0,#0x0
    strb       r0,[r7,#0xf]
    mov        r0,#0x24
    bl         Flag_ClearEvent
    pop        {pc}

    .align 2, 0



_ts ResetSkillCheck_Undernet_11
    push       {lr}
    mov        r7,r10
    ldr        r4,[r7,#0x24]
    mov        r0,#0x0
    strb       r0,[r4,#0x2]
    ldr        r4,[r7,#0x8]
    mov        r0,#0x5
    strb       r0,[r4,#0x19]
    ldr        r4,[r7,#0x78]
    mov        r0,#0x0
    strb       r0,[r4,#0xd]
    mov        r0,#0x25
    bl         Flag_ClearEvent
    pop        {pc}

    .align 2, 0


PTR_PTR_S_SkillGateFail_0_08085dc4:
    .word PTR_S_SkillGateFail_0_08085bc8

PTR_MapEntranceOptions_ARRAY_08085dc8:
    .word MapEntranceOptions_ARRAY_08085b40

PTR_INT_08085dcc:
    .word INT_08085cc0

PTR_INT_08085dd0:
    .word INT_08085cc0

PTR_PTR_ResetSkillCheck_None_08085dd4:
    .word PTR_ResetSkillCheck_None_08085cf0
