#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_Undernet_6_S0
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,PTR_MapSetup_Undernet_6_08053490
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_80515C8_08053494
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051618_08053498
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051668_0805349c
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_80516B8_080534a0
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_80516F8_080534a4
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051780_080534a8
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051820_080534ac
    bl         BgTask_AddNew
    Flag_GetBase 0x8A
    beq        LAB_080532a2
    ldr        r0,PTR_BgTask_8051738_080534b0
    bl         BgTask_AddNew
LAB_080532a2:
    pop        {r5}
    pop        {pc}


_nt EventHandler_Undernet_6_S0
    push       {lr}
    ldr        r0,PTR_EventHandler_Undernet_6_080534b4
    mov        lr,pc
    bx         r0
    pop        {pc}


_ts MapSetup_Undernet_6
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#0x1]
    LoadMain world, r0, r0
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    bne        LAB_080532ca
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_080532d8
LAB_080532ca:
    mov        r0,#0x0
    strb       r0,[r5,#0x2]
    LoadMain gameStats, r7, r7
    mov        r0,#0x0
    strb       r0,[r7,#0xd]
    b          LAB_080532ea
LAB_080532d8:
    LoadMain gameStats, r7, r7
    ldrb       r0,[r7,#0xd]
    tst        r0,r0
    bne        LAB_080532e6
    mov        r0,#0x0
    b          LAB_080532e8
LAB_080532e6:
    mov        r0,#0x1
LAB_080532e8:
    strb       r0,[r5,#0x2]
LAB_080532ea:
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_NPCList_8054AC4_080534b8
    bl         Map_LoadNPCList
    pop        {r5}
    Flag_GetBase 0x79
    beq        LAB_08053312
    Flag_SetIgnore F_IGNORE_WALL_01
    b          LAB_0805331c
LAB_08053312:
    push       {r5}
    mov        r1,#0x57
    bl         Effect_WWWGate_Create
    pop        {r5}
LAB_0805331c:
    Flag_GetBase 0x7C
    beq        LAB_0805332c
    Flag_SetIgnore F_IGNORE_WALL_02
    b          LAB_08053336
LAB_0805332c:
    push       {r5}
    mov        r1,#0x58
    bl         Effect_WWWGate_Create
    pop        {r5}
LAB_08053336:
    Flag_GetBase 0x8A
    beq        LAB_08053346
    Flag_SetIgnore F_IGNORE_WALL_00
    b          LAB_08053350
LAB_08053346:
    push       {r5}
    mov        r1,#0x9d
    bl         Effect_WWWGate_Create
    pop        {r5}
LAB_08053350:
    mov        r0,#0x0
    strb       r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_Undernet_6
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Undernet_6_0_080534bc
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_Undernet_6_0_08053368:
    .word EventHandler_Undernet_6_0


_ts EventHandler_Undernet_6_0
    push       {lr}
    Flag_GetBase 0x79
    beq        LAB_0805337e
    Flag_GetBase 0x7C
    bne        LAB_080533ac
LAB_0805337e:
    LoadMain gameStats, r7, r7
    ldrb       r0,[r7,#0xd]
    tst        r0,r0
    beq        LAB_0805338c
    mov        r0,#0x1
    strb       r0,[r5,#0x2]
LAB_0805338c:
    Flag_GetEvent F_EVENT_UNDERNET_6_SKILL_CHECK_FAIL
    bne        LAB_080533ac
    ldrb       r0,[r5,#0x2]
    tst        r0,r0
    beq        LAB_080533ac
    Flag_SetEvent F_EVENT_UNDERNET_6_SKILL_CHECK_FAIL
    push       {r5}
    ldr        r0,PTR_Scene_SkillGate_080534c0
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_080533ac:
    ldrb       r0,[r5,#0x1]
    tst        r0,r0
    beq        LAB_080533c0
    mov        r0,#0x0
    strb       r0,[r5,#0x1]
    push       {r5}
    ldr        r0,PTR_BgTask_8051738_080534c4
    bl         BgTask_AddNew
    pop        {r5}
LAB_080533c0:
    Flag_GetBase 0x8A
    bne        LAB_080533ea
    Flag_GetBase 0x8B
    beq        LAB_080533e2
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
    push       {r5}
    ldr        r0,PTR_Scene_UnlockWWWGate_080534c8
    mov        r1,#0x1c
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_080533e2:
    mov        r0,#0x20
    mov        r1,#0x1f
    bl         EventHandler_Undernet_SkillGatePass
LAB_080533ea:
    Flag_GetBase 0x79
    bne        LAB_08053420
    Flag_GetBase 0x78
    beq        LAB_08053408
    push       {r5}
    ldr        r0,PTR_Scene_UnlockWWWGate_080534cc
    mov        r1,#0x16
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_08053408:
    ldrb       r0,[r5,#0x2]
    tst        r0,r0
    beq        LAB_08053418
    mov        r0,#0x21
    mov        r1,#0x0
    bl         EventHandler_Undernet_SkillGateFail
    b          LAB_08053420
LAB_08053418:
    mov        r0,#0x21
    mov        r1,#0xa
    bl         EventHandler_Undernet_SkillGatePass
LAB_08053420:
    Flag_GetBase 0x7C
    bne        LAB_08053456
    Flag_GetBase 0x7B
    beq        LAB_0805343e
    push       {r5}
    ldr        r0,PTR_Scene_UnlockWWWGate_080534d0
    mov        r1,#0x17
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0805343e:
    ldrb       r0,[r5,#0x2]
    tst        r0,r0
    beq        LAB_0805344e
    mov        r0,#0x22
    mov        r1,#0x1
    bl         EventHandler_Undernet_SkillGateFail
    b          LAB_08053456
LAB_0805344e:
    mov        r0,#0x22
    mov        r1,#0xc
    bl         EventHandler_Undernet_SkillGatePass
LAB_08053456:
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}


_nt EventHandler_Undernet_SkillGatePass
    push       {lr}
    LoadMain world, r7, r7
    ldrb       r2,[r7,#0xe]
    cmp        r2,r0
    bne        LAB_08053474
    push       {r5}
    ldr        r0,PTR_Scene_Dialogue_080534d4
    bl         Scene_Prepare
    pop        {r5}
LAB_08053474:
    pop        {pc}


_nt EventHandler_Undernet_SkillGateFail
    push       {lr}
    LoadMain world, r7, r7
    ldrb       r2,[r7,#0xe]
    cmp        r2,r0
    bne        LAB_0805348c
    push       {r5}
    ldr        r0,PTR_Scene_SkillGate_080534d8
    bl         Scene_Prepare
    pop        {r5}
LAB_0805348c:
    pop        {pc}

    .align 2, 0

PTR_MapSetup_Undernet_6_08053490:
    .word MapSetup_Undernet_6

PTR_BgTask_80515C8_08053494:
    .word BgTask_80515C8

PTR_BgTask_8051618_08053498:
    .word BgTask_8051618

PTR_BgTask_8051668_0805349c:
    .word BgTask_8051668

PTR_BgTask_80516B8_080534a0:
    .word BgTask_80516B8

PTR_BgTask_80516F8_080534a4:
    .word BgTask_80516F8

PTR_BgTask_8051780_080534a8:
    .word BgTask_8051780

PTR_BgTask_8051820_080534ac:
    .word BgTask_8051820

PTR_BgTask_8051738_080534b0:
    .word BgTask_8051738

PTR_EventHandler_Undernet_6_080534b4:
    .word EventHandler_Undernet_6

PTR_NPCList_8054AC4_080534b8:
    .word NPCList_8054AC4

PTR_PTR_EventHandler_Undernet_6_0_080534bc:
    .word PTR_EventHandler_Undernet_6_0_08053368

PTR_Scene_SkillGate_080534c0:
    .word Scene_SkillGateFail

PTR_BgTask_8051738_080534c4:
    .word BgTask_8051738

PTR_Scene_UnlockWWWGate_080534c8:
    .word Scene_UnlockWWWGate

PTR_Scene_UnlockWWWGate_080534cc:
    .word Scene_UnlockWWWGate

PTR_Scene_UnlockWWWGate_080534d0:
    .word Scene_UnlockWWWGate

PTR_Scene_Dialogue_080534d4:
    .word Scene_Dialogue

PTR_Scene_SkillGate_080534d8:
    .word Scene_SkillGateFail
