#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_Undernet_10_S0
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,PTR_MapSetup_Undernet_10_08053af8
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_80515C8_08053afc
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051618_08053b00
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051668_08053b04
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_80516B8_08053b08
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_80516F8_08053b0c
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051780_08053b10
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051820_08053b14
    bl         BgTask_AddNew
    Flag_GetBase 0x8D
    beq        LAB_0805394e
    ldr        r0,PTR_BgTask_8051738_08053b18
    bl         BgTask_AddNew
LAB_0805394e:
    pop        {r5}
    pop        {pc}


_nt EventHandler_Undernet_10_S0
    push       {lr}
    ldr        r0,PTR_EventHandler_Undernet_10_08053b1c
    mov        lr,pc
    bx         r0
    pop        {pc}


_ts MapSetup_Undernet_10
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#0x1]
    LoadMain world, r0, r0
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    bne        LAB_08053976
    ldrb       r1,[r0,#World_currentArea]
    ldrb       r2,[r0,#World_lastArea]
    cmp        r1,r2
    beq        LAB_08053984
LAB_08053976:
    mov        r0,#0x0
    strb       r0,[r5,#0x2]
    LoadMain gameStats, r7, r7
    mov        r0,#0x0
    strb       r0,[r7,#0xf]
    b          LAB_08053996
LAB_08053984:
    mov        r0,#0x0
    strb       r0,[r5,#0x2]
    LoadMain gameStats, r7, r7
    ldrb       r0,[r7,#0xf]
    cmp        r0,#0x7
    blt        LAB_08053996
    mov        r0,#0x1
    strb       r0,[r5,#0x2]
LAB_08053996:
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_NPCList_8054F48_08053b20
    bl         Map_LoadNPCList
    pop        {r5}
    Flag_GetBase 0x85
    beq        LAB_080539be
    Flag_SetIgnore F_IGNORE_WALL_01
    b          LAB_080539c8
LAB_080539be:
    push       {r5}
    mov        r1,#0x5b
    bl         Effect_WWWGate_Create
    pop        {r5}
LAB_080539c8:
    Flag_GetBase 0x8D
    beq        LAB_080539dc
    push       {r5}
    Flag_SetIgnore F_IGNORE_WALL_00
    pop        {r5}
    b          LAB_080539e6
LAB_080539dc:
    push       {r5}
    mov        r1,#0x9e
    bl         Effect_WWWGate_Create
    pop        {r5}
LAB_080539e6:
    mov        r0,#0x0
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Undernet_10
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Undernet_10_0_08053b24
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Undernet_10_0_080539fc:
    .word EventHandler_Undernet_10_0


_ts EventHandler_Undernet_10_0
    push       {lr}
    Flag_GetBase 0x85
    bne        LAB_08053a38
    LoadMain gameStats, r7, r7
    ldrb       r0,[r7,#GameStats_totalBattles8]
    cmp        r0,#0x7
    blt        LAB_08053a18
    mov        r0,#0x1
    strb       r0,[r5,#0x2]
LAB_08053a18:
    Flag_GetEvent F_EVENT_UNDERNET_10_SKILL_CHECK_FAIL
    bne        LAB_08053a38
    ldrb       r0,[r5,#0x2]
    tst        r0,r0
    beq        LAB_08053a38
    Flag_SetEvent F_EVENT_UNDERNET_10_SKILL_CHECK_FAIL
    push       {r5}
    ldr        r0,PTR_Scene_SkillGate_08053b28
    mov        r1,#0x4
    bl         Scene_Prepare
    pop        {r5}
LAB_08053a38:
    ldrb       r0,[r5,#0x1]
    tst        r0,r0
    beq        LAB_08053a4c
    mov        r0,#0x0
    strb       r0,[r5,#0x1]
    push       {r5}
    ldr        r0,PTR_BgTask_8051738_08053b2c
    bl         BgTask_AddNew
    pop        {r5}
LAB_08053a4c:
    Flag_GetBase 0x8D
    bne        LAB_08053a84
    Flag_GetBase 0x8E
    beq        LAB_08053a6e
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
    push       {r5}
    ldr        r0,PTR_Scene_UnlockWWWGate_08053b30
    mov        r1,#0x1d
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_08053a6e:
    LoadMain world, r0, r7
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x20
    bne        LAB_08053a84
    push       {r5}
    ldr        r0,PTR_Scene_Dialogue_08053b34
    mov        r1,#0x1f
    bl         Scene_Prepare
    pop        {r5}
LAB_08053a84:
    Flag_GetBase 0x85
    bne        LAB_08053aba
    Flag_GetBase 0x84
    beq        LAB_08053aa2
    push       {r5}
    ldr        r0,PTR_Scene_UnlockWWWGate_08053b38
    mov        r1,#0x1a
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_08053aa2:
    ldrb       r0,[r5,#0x2]
    tst        r0,r0
    beq        LAB_08053ab2
    mov        r0,#0x21
    mov        r1,#0x4
    bl         EventHandler_Undernet_SkillGateFail
    b          LAB_08053aba
LAB_08053ab2:
    mov        r0,#0x21
    mov        r1,#0xa
    bl         EventHandler_Undernet_SkillGatePass
LAB_08053aba:
    Flag_GetBase 0x05
    beq        LAB_08053af0
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x10
    bne        LAB_08053af0
    Flag_GetBase 0x60
    bne        LAB_08053af0
    Flag_SetBase 0x60
    push       {r5}
    ldr        r0,PTR_Scene_StartFixedBattle_08053b3c
    mov        r1,#0x2c
    bl         Scene_Prepare
    pop        {r5}
LAB_08053af0:
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}

PTR_MapSetup_Undernet_10_08053af8:
    .word MapSetup_Undernet_10

PTR_BgTask_80515C8_08053afc:
    .word BgTask_80515C8

PTR_BgTask_8051618_08053b00:
    .word BgTask_8051618

PTR_BgTask_8051668_08053b04:
    .word BgTask_8051668

PTR_BgTask_80516B8_08053b08:
    .word BgTask_80516B8

PTR_BgTask_80516F8_08053b0c:
    .word BgTask_80516F8

PTR_BgTask_8051780_08053b10:
    .word BgTask_8051780

PTR_BgTask_8051820_08053b14:
    .word BgTask_8051820

PTR_BgTask_8051738_08053b18:
    .word BgTask_8051738

PTR_EventHandler_Undernet_10_08053b1c:
    .word EventHandler_Undernet_10

PTR_NPCList_8054F48_08053b20:
    .word NPCList_8054F48

PTR_PTR_EventHandler_Undernet_10_0_08053b24:
    .word PTR_EventHandler_Undernet_10_0_080539fc

PTR_Scene_SkillGate_08053b28:
    .word Scene_SkillGateFail

PTR_BgTask_8051738_08053b2c:
    .word BgTask_8051738

PTR_Scene_UnlockWWWGate_08053b30:
    .word Scene_UnlockWWWGate

PTR_Scene_Dialogue_08053b34:
    .word Scene_Dialogue

PTR_Scene_UnlockWWWGate_08053b38:
    .word Scene_UnlockWWWGate

PTR_Scene_StartFixedBattle_08053b3c:
    .word Scene_StartFixedBattle
