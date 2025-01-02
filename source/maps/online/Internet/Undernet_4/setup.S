#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_Undernet_4_S0
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,DAT_080530d0
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_80515C8_080530d4
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051618_080530d8
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051668_080530dc
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_80516B8_080530e0
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_80516F8_080530e4
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051780_080530e8
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051820_080530ec
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051750_080530f0
    bl         BgTask_AddNew
    Flag_GetBase 0x9B
    bne        LAB_08053006
    ldr        r0,PTR_BgTask_8051890_080530f4
    bl         BgTask_AddNew
    b          LAB_0805300c
LAB_08053006:
    ldr        r0,PTR_BgTask_80518A8_080530f8
    bl         BgTask_AddNew
LAB_0805300c:
    pop        {r5}
    pop        {pc}


_ts EventHandler_Undernet_4_S0
    push       {lr}
    ldr        r0,PTR_EventHandler_Undernet_4_080530fc
    mov        lr,pc
    bx         r0
    pop        {pc}


_nt MapSetup_Undernet_4
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    Flag_GetBase 0x9A
    beq        LAB_08053054
    Flag_GetBase 0x9B
    bne        LAB_08053060
    LoadMain world, r0, r0
    mov        r1,#0x0
    strb       r1,[r0,#0x7]
    push       {r5}
    ldr        r0,PTR_Scene_Story_67_08053100
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_08053060
LAB_08053054:
    push       {r5}
    ldr        r7,PTR_NPCList_805489C_08053104
    bl         Map_LoadNPCList
    pop        {r5}
    b          LAB_0805306a
LAB_08053060:
    push       {r5}
    ldr        r7,PTR_NPCList_80548BC_08053108
    bl         Map_LoadNPCList
    pop        {r5}
LAB_0805306a:
    LoadMain world, r0, r0
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_08053082
    push       {r5}
    ldr        r0,PTR_Scene_MegaManJackIn_0805310c
    ldr        r1,INT_08053110
    bl         Scene_Prepare
    pop        {r5}
LAB_08053082:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Undernet_4
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Undernet_4_0_08053114
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Undernet_4_0_08053098:
    .word EventHandler_Undernet_4_0


_ts EventHandler_Undernet_4_0
    push       {lr}
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x10
    bne        LAB_080530c6
    Flag_GetBase 0x9A
    bne        LAB_080530c6
    push       {r5}
    ldr        r0,PTR_Scene_Story_66_08053118
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_080530c6:
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}

    .align 2, 0

DAT_080530d0:
    .word MapSetup_Undernet_4

PTR_BgTask_80515C8_080530d4:
    .word BgTask_80515C8

PTR_BgTask_8051618_080530d8:
    .word BgTask_8051618

PTR_BgTask_8051668_080530dc:
    .word BgTask_8051668

PTR_BgTask_80516B8_080530e0:
    .word BgTask_80516B8

PTR_BgTask_80516F8_080530e4:
    .word BgTask_80516F8

PTR_BgTask_8051780_080530e8:
    .word BgTask_8051780

PTR_BgTask_8051820_080530ec:
    .word BgTask_8051820

PTR_BgTask_8051750_080530f0:
    .word BgTask_8051750

PTR_BgTask_8051890_080530f4:
    .word BgTask_8051890

PTR_BgTask_80518A8_080530f8:
    .word BgTask_80518A8

PTR_EventHandler_Undernet_4_080530fc:
    .word EventHandler_Undernet_4

PTR_Scene_Story_67_08053100:
    .word Scene_Story_67

PTR_NPCList_805489C_08053104:
    .word NPCList_805489C

PTR_NPCList_80548BC_08053108:
    .word NPCList_80548BC

PTR_Scene_MegaManJackIn_0805310c:
    .word Scene_MegaManJackIn

INT_08053110:
    .word 0x2000

PTR_PTR_EventHandler_Undernet_4_0_08053114:
    .word PTR_EventHandler_Undernet_4_0_08053098

PTR_Scene_Story_66_08053118:
    .word Scene_Story_66
