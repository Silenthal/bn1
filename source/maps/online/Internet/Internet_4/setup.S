#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_Internet_4_S0
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,DAT_08052ad0
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_80515C8_08052ad4
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051618_08052ad8
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051668_08052adc
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_80516B8_08052ae0
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_80516F8_08052ae4
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051780_08052ae8
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051820_08052aec
    bl         BgTask_AddNew
    Flag_GetBase 0x58
    beq        LAB_0805293e
    ldr        r0,PTR_BgTask_8051738_08052af0
    bl         BgTask_AddNew
LAB_0805293e:
    pop        {r5}
    pop        {pc}


_nt EventHandler_Internet_4_S0
    push       {lr}
    ldr        r0,DAT_08052af4
    mov        lr,pc
    bx         r0
    pop        {pc}


_ts MapSetup_Internet_4
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#0x1]
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_8054464_08052af8
    bl         Map_LoadNPCList
    pop        {r5}
    LoadMain world, r0, r0
    ldrb       r1,[r0,#World_currentArea]
    ldrb       r2,[r0,#World_lastArea]
    cmp        r1,r2
    beq        LAB_08052986
    push       {r5}
    ldr        r0,PTR_Scene_MegaManJackIn_08052afc
    ldr        r1,PTR_DAT_08052b00
    bl         Scene_Prepare
    pop        {r5}
LAB_08052986:
    Flag_GetBase 0x4B
    bne        LAB_08052994
    Flag_SetGate F_GATE_02
LAB_08052994:
    Flag_GetBase 0x5A
    bne        LAB_080529a2
    Flag_SetGate F_GATE_01
LAB_080529a2:
    Flag_GetEvent 0x2F
    beq        LAB_080529c4
    Flag_ClearEvent 0x2F
    LoadMain world, r0, r0
    mov        r1,#0x0
    strb       r1,[r0,#World_fadeType]
    push       {r5}
    ldr        r0,PTR_Scene_ChangeMap_08052b04
    mov        r1,#0x1a
    bl         Scene_Prepare
    pop        {r5}
LAB_080529c4:
    Flag_GetBase 0x58
    beq        LAB_080529d8
    push       {r5}
    Flag_SetIgnore F_IGNORE_WALL_00
    pop        {r5}
    b          LAB_080529e2
LAB_080529d8:
    push       {r5}
    mov        r1,#0x8b
    bl         Effect_WWWGate_Create
    pop        {r5}
LAB_080529e2:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Internet_4
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Internet_4_0_08052b08
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Internet_4_0_080529f8:
    .word EventHandler_Internet_4_0


_ts EventHandler_Internet_4_0
    push       {lr}
    ldrb       r0,[r5,#0x1]
    tst        r0,r0
    beq        LAB_08052a12
    mov        r0,#0x0
    strb       r0,[r5,#0x1]
    push       {r5}
    ldr        r0,PTR_BgTask_8051738_08052b0c
    bl         BgTask_AddNew
    pop        {r5}
LAB_08052a12:
    Flag_GetBase 0x58
    bne        LAB_08052a4a
    Flag_GetBase 0x59
    beq        LAB_08052a34
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
    push       {r5}
    ldr        r0,DAT_08052b10
    mov        r1,#0xa
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_08052a34:
    LoadMain world, r0, r7
    ldrb       r0,[r0,#World_curEventFlag]
    cmp        r0,#0x20
    bne        LAB_08052a4a
    push       {r5}
    ldr        r0,DAT_08052b14
    mov        r1,#0x1f
    bl         Scene_Prepare
    pop        {r5}
LAB_08052a4a:
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#World_playerLocation]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x3
    bne        LAB_08052a86
    Flag_GetGate F_GATE_02
    beq        LAB_08052ac8
    mov        r0,#0x28
    bl         KeyItem_IsPresent
    bne        LAB_08052a82
    LoadMain world, r7, r7
    ldr        r7,[r7,#World_playerLocation]
    ldr        r0,[r7,#0x10]
    add        r0,#0x4
    mov        r2,#0x7
    and        r0,r2
    ldr        r1,DAT_08052b18
    orr        r1,r0
    b          LAB_08052abe
LAB_08052a82:
    mov        r1,#0xa
    b          LAB_08052aac
LAB_08052a86:
    cmp        r0,#0x2
    bne        LAB_08052ac8
    Flag_GetGate F_GATE_01
    beq        LAB_08052ac8
    mov        r0,#0x34
    bl         KeyItem_IsPresent
    bne        LAB_08052a9e
    ldr        r1,DAT_08052b1c
    b          LAB_08052abe
LAB_08052a9e:
    mov        r1,#0xc
    push       {r5}
    ldr        r0,PTR_Scene_Internet_4_HigMemo_Gate_08052b20
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_08052aac:
    push       {r5}
    ldr        r0,DAT_08052b24
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}
LAB_08052abe:
    push       {r5}
    ldr        r0,DAT_08052b28
    bl         Scene_Prepare
    pop        {r5}
LAB_08052ac8:
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}

DAT_08052ad0:
    .word MapSetup_Internet_4

PTR_BgTask_80515C8_08052ad4:
    .word BgTask_80515C8

PTR_BgTask_8051618_08052ad8:
    .word BgTask_8051618

PTR_BgTask_8051668_08052adc:
    .word BgTask_8051668

PTR_BgTask_80516B8_08052ae0:
    .word BgTask_80516B8

PTR_BgTask_80516F8_08052ae4:
    .word BgTask_80516F8

PTR_BgTask_8051780_08052ae8:
    .word BgTask_8051780

PTR_BgTask_8051820_08052aec:
    .word BgTask_8051820

PTR_BgTask_8051738_08052af0:
    .word BgTask_8051738

DAT_08052af4:
    .word EventHandler_Internet_4

PTR_NPCList_8054464_08052af8:
    .word NPCList_8054464

PTR_Scene_MegaManJackIn_08052afc:
    .word Scene_MegaManJackIn

PTR_DAT_08052b00:
    .word 0x2000

PTR_Scene_ChangeMap_08052b04:
    .word Scene_ChangeMap

PTR_PTR_EventHandler_Internet_4_0_08052b08:
    .word PTR_EventHandler_Internet_4_0_080529f8

PTR_BgTask_8051738_08052b0c:
    .word BgTask_8051738

DAT_08052b10:
    .word Scene_UnlockWWWGate

DAT_08052b14:
    .word Scene_Dialogue

DAT_08052b18:
    .word 0xA00

DAT_08052b1c:
    .word 0xC03

PTR_Scene_Internet_4_HigMemo_Gate_08052b20:
    .word Scene_Internet_4_HigMemo_Gate

DAT_08052b24:
    .word Scene_Dialogue

DAT_08052b28:
    .word Scene_LockedPath
