#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_Undernet_9_S0
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,PTR_MapSetup_Undernet_9_080538d4
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_80515C8_080538d8
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051618_080538dc
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051668_080538e0
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_80516B8_080538e4
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_80516F8_080538e8
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051780_080538ec
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051820_080538f0
    bl         BgTask_AddNew
    pop        {r5}
    pop        {pc}


_ts EventHandler_Undernet_9_S0
    push       {lr}
    ldr        r0,PTR_EventHandler_Undernet_9_080538f4
    mov        lr,pc
    bx         r0
    pop        {pc}


_nt MapSetup_Undernet_9
    push       {lr}
    LoadMain world, r0, r0
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    bne        LAB_08053814
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_08053822
LAB_08053814:
    mov        r0,#0x0
    strb       r0,[r5,#0x2]
    LoadMain gameStats, r7, r7
    mov        r0,#0x0
    strb       r0,[r7,#0xe]
    b          LAB_08053834
LAB_08053822:
    mov        r0,#0x0
    strb       r0,[r5,#0x2]
    LoadMain gameStats, r7, r7
    ldrb       r0,[r7,#0xe]
    cmp        r0,#0xa
    bge        LAB_08053834
    mov        r0,#0x1
    strb       r0,[r5,#0x2]
LAB_08053834:
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_NPCList_8054E2C_080538f8
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x82
    bl         Flag_GetBase
    beq        LAB_0805385c
    mov        r0,#0x0
    bl         Flag_SetIgnore
    b          LAB_08053866
LAB_0805385c:
    push       {r5}
    mov        r1,#0x5a
    bl         Effect_WWWGate_Create
    pop        {r5}
LAB_08053866:
    mov        r0,#0x0
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Undernet_9
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Undernet_9_0_080538fc
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Undernet_9_0_0805387c:
    .word EventHandler_Undernet_9_0


_ts EventHandler_Undernet_9_0
    push       {lr}
    LoadMain gameStats, r7, r7
    ldrb       r0,[r7,#0xe]
    cmp        r0,#0xa
    bge        LAB_08053892
    mov        r0,#0x1
    strb       r0,[r5,#0x2]
    b          LAB_08053896
LAB_08053892:
    mov        r0,#0x0
    strb       r0,[r5,#0x2]
LAB_08053896:
    mov        r0,#0x82
    bl         Flag_GetBase
    bne        LAB_080538cc
    mov        r0,#0x81
    bl         Flag_GetBase
    beq        LAB_080538b4
    push       {r5}
    ldr        r0,PTR_Scene_UnlockWWWGate_08053900
    mov        r1,#0x19
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_080538b4:
    ldrb       r0,[r5,#0x2]
    tst        r0,r0
    beq        LAB_080538c4
    mov        r0,#0x20
    mov        r1,#0x3
    bl         EventHandler_Undernet_SkillGateFail
    b          LAB_080538cc
LAB_080538c4:
    mov        r0,#0x20
    mov        r1,#0xa
    bl         EventHandler_Undernet_SkillGatePass
LAB_080538cc:
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}

PTR_MapSetup_Undernet_9_080538d4:
    .word MapSetup_Undernet_9

PTR_BgTask_80515C8_080538d8:
    .word BgTask_80515C8

PTR_BgTask_8051618_080538dc:
    .word BgTask_8051618

PTR_BgTask_8051668_080538e0:
    .word BgTask_8051668

PTR_BgTask_80516B8_080538e4:
    .word BgTask_80516B8

PTR_BgTask_80516F8_080538e8:
    .word BgTask_80516F8

PTR_BgTask_8051780_080538ec:
    .word BgTask_8051780

PTR_BgTask_8051820_080538f0:
    .word BgTask_8051820

PTR_EventHandler_Undernet_9_080538f4:
    .word EventHandler_Undernet_9

PTR_NPCList_8054E2C_080538f8:
    .word NPCList_8054E2C

PTR_PTR_EventHandler_Undernet_9_0_080538fc:
    .word PTR_EventHandler_Undernet_9_0_0805387c

PTR_Scene_UnlockWWWGate_08053900:
    .word Scene_UnlockWWWGate
