#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_Undernet_7_S0
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,PTR_MapSetup_Undernet_7_08053680
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_80515C8_08053684
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051618_08053688
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051668_0805368c
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_80516B8_08053690
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_80516F8_08053694
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051780_08053698
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051820_0805369c
    bl         BgTask_AddNew
    pop        {r5}
    pop        {pc}


_ts EventHandler_Undernet_7_S0
    push       {lr}
    ldr        r0,PTR_EventHandler_Undernet_7_080536a0
    mov        lr,pc
    bx         r0
    pop        {pc}


_nt MapSetup_Undernet_7
    push       {lr}
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    bne        LAB_0805353c
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_08053550
LAB_0805353c:
    mov        r0,#0x0
    strb       r0,[r5,#0x2]
    mov        r7,r10
    ldr        r4,[r7,#0x8]
    mov        r0,#0x4
    strb       r0,[r4,#0x19]
    ldr        r4,[r7,#0x78]
    mov        r0,#0x0
    strb       r0,[r4,#0xd]
    b          LAB_08053578
LAB_08053550:
    mov        r0,#0x22
    bl         Flag_Get420
    bne        LAB_08053566
    mov        r0,#0x0
    strb       r0,[r5,#0x2]
    mov        r7,r10
    ldr        r4,[r7,#0x8]
    ldrb       r0,[r4,#0x19]
    cmp        r0,#0x4
    bge        LAB_0805356c
LAB_08053566:
    mov        r0,#0x1
    strb       r0,[r5,#0x2]
    b          LAB_08053578
LAB_0805356c:
    ldr        r4,[r7,#0x78]
    ldrb       r0,[r4,#0xd]
    tst        r0,r0
    beq        LAB_08053578
    mov        r0,#0x1
    strb       r0,[r5,#0x2]
LAB_08053578:
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_NPCList_8054C14_080536a4
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x7f
    bl         Flag_GetBase
    beq        LAB_080535a0
    mov        r0,#0x0
    bl         Flag_Set380
    b          LAB_080535aa
LAB_080535a0:
    push       {r5}
    mov        r1,#0x59
    bl         Effect_WWWGate_Create
    pop        {r5}
LAB_080535aa:
    mov        r0,#0x0
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Undernet_7
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Undernet_7_0_080536a8
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Undernet_7_0_080535c0:
    .word EventHandler_Undernet_7_0


_ts EventHandler_Undernet_7_0
    push       {lr}
    mov        r0,#0x7f
    bl         Flag_GetBase
    bne        LAB_0805360a
    mov        r7,r10
    ldr        r4,[r7,#0x8]
    ldrb       r0,[r4,#0x19]
    cmp        r0,#0x4
    bge        LAB_080535de
    mov        r0,#0x1
    strb       r0,[r5,#0x2]
    b          LAB_080535ea
LAB_080535de:
    ldr        r4,[r7,#0x78]
    ldrb       r0,[r4,#0xd]
    tst        r0,r0
    beq        LAB_080535ea
    mov        r0,#0x1
    strb       r0,[r5,#0x2]
LAB_080535ea:
    mov        r0,#0x22
    bl         Flag_Get420
    bne        LAB_0805360a
    ldrb       r0,[r5,#0x2]
    tst        r0,r0
    beq        LAB_0805360a
    mov        r0,#0x22
    bl         Flag_Set420
    push       {r5}
    ldr        r0,PTR_Scene_SkillGate_080536ac
    mov        r1,#0x2
    bl         Scene_Prepare
    pop        {r5}
LAB_0805360a:
    mov        r0,#0x2d
    bl         Flag_Get420
    beq        LAB_08053640
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x10
    bne        LAB_08053640
    mov        r0,#0x5f
    bl         Flag_GetBase
    bne        LAB_08053640
    mov        r0,#0x5f
    bl         Flag_SetBase
    push       {r5}
    ldr        r0,PTR_FUN_080857b8_080536b0
    mov        r1,#0x2a
    bl         Scene_Prepare
    pop        {r5}
LAB_08053640:
    mov        r0,#0x7f
    bl         Flag_GetBase
    bne        LAB_08053676
    mov        r0,#0x7e
    bl         Flag_GetBase
    beq        LAB_0805365e
    push       {r5}
    ldr        r0,PTR_Scene_UnlockWWWGate_080536b4
    mov        r1,#0x18
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0805365e:
    ldrb       r0,[r5,#0x2]
    tst        r0,r0
    beq        LAB_0805366e
    mov        r0,#0x20
    mov        r1,#0x2
    bl         EventHandler_Undernet_SkillGateFail
    b          LAB_08053676
LAB_0805366e:
    mov        r0,#0x20
    mov        r1,#0xa
    bl         EventHandler_Undernet_SkillGatePass
LAB_08053676:
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}

    .align 2, 0

PTR_MapSetup_Undernet_7_08053680:
    .word MapSetup_Undernet_7

PTR_BgTask_80515C8_08053684:
    .word BgTask_80515C8

PTR_BgTask_8051618_08053688:
    .word BgTask_8051618

PTR_BgTask_8051668_0805368c:
    .word BgTask_8051668

PTR_BgTask_80516B8_08053690:
    .word BgTask_80516B8

PTR_BgTask_80516F8_08053694:
    .word BgTask_80516F8

PTR_BgTask_8051780_08053698:
    .word BgTask_8051780

PTR_BgTask_8051820_0805369c:
    .word BgTask_8051820

PTR_EventHandler_Undernet_7_080536a0:
    .word EventHandler_Undernet_7

PTR_NPCList_8054C14_080536a4:
    .word NPCList_8054C14

PTR_PTR_EventHandler_Undernet_7_0_080536a8:
    .word PTR_EventHandler_Undernet_7_0_080535c0

PTR_Scene_SkillGate_080536ac:
    .word 0x8085BB9

PTR_FUN_080857b8_080536b0:
    .word 0x80857B9

PTR_Scene_UnlockWWWGate_080536b4:
    .word 0x8086E19
