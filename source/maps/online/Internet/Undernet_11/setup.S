#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_Undernet_11_S0
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,PTR_MapSetup_Undernet_11_08053cf4
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_80515C8_08053cf8
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051618_08053cfc
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051668_08053d00
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_80516B8_08053d04
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_80516F8_08053d08
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051780_08053d0c
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051820_08053d10
    bl         BgTask_AddNew
    pop        {r5}
    pop        {pc}


_ts EventHandler_Undernet_11_S0
    push       {lr}
    ldr        r0,PTR_EventHandler_Undernet_11_08053d14
    mov        lr,pc
    bx         r0
    pop        {pc}


_nt MapSetup_Undernet_11
    push       {lr}
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    bne        LAB_08053ba0
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_08053bb4
LAB_08053ba0:
    mov        r0,#0x0
    strb       r0,[r5,#0x2]
    mov        r7,r10
    ldr        r4,[r7,#0x8]
    mov        r0,#0x5
    strb       r0,[r4,#0x19]
    ldr        r4,[r7,#0x78]
    mov        r0,#0x0
    strb       r0,[r4,#0xd]
    b          LAB_08053bde
LAB_08053bb4:
    mov        r0,#0x25
    bl         Flag_Get420
    bne        LAB_08053bca
    mov        r0,#0x0
    strb       r0,[r5,#0x2]
    mov        r7,r10
    ldr        r4,[r7,#0x8]
    ldrb       r0,[r4,#0x19]
    cmp        r0,#0x5
    bge        LAB_08053bd0
LAB_08053bca:
    mov        r0,#0x1
    strb       r0,[r5,#0x2]
    b          LAB_08053bde
LAB_08053bd0:
    mov        r7,r10
    ldr        r7,[r7,#0x78]
    ldrb       r0,[r7,#0xd]
    tst        r0,r0
    beq        LAB_08053bde
    mov        r0,#0x1
    strb       r0,[r5,#0x2]
LAB_08053bde:
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_NPCList_8055080_08053d18
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x88
    bl         Flag_GetBase
    beq        LAB_08053c06
    mov        r0,#0x0
    bl         Flag_Set380
    b          LAB_08053c10
LAB_08053c06:
    push       {r5}
    mov        r1,#0x5c
    bl         Effect_WWWGate_Create
    pop        {r5}
LAB_08053c10:
    mov        r0,#0x0
    strb       r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_Undernet_11
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Undernet_11_0_08053d1c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_Undernet_11_0_08053c28:
    .word EventHandler_Undernet_11_0


_ts EventHandler_Undernet_11_0
    push       {lr}
    mov        r0,#0x88
    bl         Flag_GetBase
    bne        LAB_08053c74
    mov        r7,r10
    ldr        r4,[r7,#0x8]
    ldrb       r0,[r4,#0x19]
    cmp        r0,#0x5
    bge        LAB_08053c46
    mov        r0,#0x1
    strb       r0,[r5,#0x2]
    b          LAB_08053c54
LAB_08053c46:
    mov        r7,r10
    ldr        r7,[r7,#0x78]
    ldrb       r0,[r7,#0xd]
    tst        r0,r0
    beq        LAB_08053c54
    mov        r0,#0x1
    strb       r0,[r5,#0x2]
LAB_08053c54:
    mov        r0,#0x25
    bl         Flag_Get420
    bne        LAB_08053c74
    ldrb       r0,[r5,#0x2]
    tst        r0,r0
    beq        LAB_08053c74
    mov        r0,#0x25
    bl         Flag_Set420
    push       {r5}
    ldr        r0,PTR_Scene_SkillGate_08053d20
    mov        r1,#0x5
    bl         Scene_Prepare
    pop        {r5}
LAB_08053c74:
    mov        r0,#0x88
    bl         Flag_GetBase
    bne        LAB_08053caa
    mov        r0,#0x87
    bl         Flag_GetBase
    beq        LAB_08053c92
    push       {r5}
    ldr        r0,PTR_Scene_UnlockWWWGate_08053d24
    mov        r1,#0x1b
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_08053c92:
    ldrb       r0,[r5,#0x2]
    tst        r0,r0
    beq        LAB_08053ca2
    mov        r0,#0x20
    mov        r1,#0x5
    bl         EventHandler_Undernet_SkillGateFail
    b          LAB_08053caa
LAB_08053ca2:
    mov        r0,#0x20
    mov        r1,#0xa
    bl         EventHandler_Undernet_SkillGatePass
LAB_08053caa:
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x10
    bne        LAB_08053cec
    mov        r0,#0x5
    bl         Flag_GetBase
    beq        LAB_08053cec
    push       {r5}
    bl         Library_GetStandardChipCount
    pop        {r5}
    cmp        r1,#0x8c
    blt        LAB_08053cec
    mov        r0,#0x8f
    bl         Flag_GetBase
    bne        LAB_08053cec
    mov        r0,#0x8f
    bl         Flag_SetBase
    push       {r5}
    ldr        r0,PTR_Scene_StartFixedBattle_08053d28
    mov        r1,#0x2d
    bl         Scene_Prepare
    pop        {r5}
LAB_08053cec:
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}

PTR_MapSetup_Undernet_11_08053cf4:
    .word MapSetup_Undernet_11

PTR_BgTask_80515C8_08053cf8:
    .word BgTask_80515C8

PTR_BgTask_8051618_08053cfc:
    .word BgTask_8051618

PTR_BgTask_8051668_08053d00:
    .word BgTask_8051668

PTR_BgTask_80516B8_08053d04:
    .word BgTask_80516B8

PTR_BgTask_80516F8_08053d08:
    .word BgTask_80516F8

PTR_BgTask_8051780_08053d0c:
    .word BgTask_8051780

PTR_BgTask_8051820_08053d10:
    .word BgTask_8051820

PTR_EventHandler_Undernet_11_08053d14:
    .word EventHandler_Undernet_11

PTR_NPCList_8055080_08053d18:
    .word NPCList_8055080

PTR_PTR_EventHandler_Undernet_11_0_08053d1c:
    .word PTR_EventHandler_Undernet_11_0_08053c28

PTR_Scene_SkillGate_08053d20:
    .word Scene_SkillGateFail

PTR_Scene_UnlockWWWGate_08053d24:
    .word 0x8086E19

PTR_Scene_StartFixedBattle_08053d28:
    .word Scene_StartFixedBattle
