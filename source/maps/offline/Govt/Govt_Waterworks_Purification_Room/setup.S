#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_Govt_Waterworks_Purification_Room_S2
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_Default_08034d14
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_8034D18
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8034D1C
    bl         BgTask_AddNew
    pop        {r5}
    bl         Sound_AreaSongChange
    pop        {pc}

PTR_MapSetup_Default_08034c78:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Govt_Waterworks_Purification_Room_F24
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default


_ts EventHandler_Govt_Waterworks_Purification_Room_S2
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Default_08034d20
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Default_08034ca4:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Govt_Waterworks_Purification_Room_F24
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default


_ts MapSetup_Govt_Waterworks_Purification_Room_F24
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_NPCList_8035B7C_08034d24
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Govt_Waterworks_Purification_Room_F24
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Waterworks_Purification_Room_F24_0_08034d28
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Govt_Waterworks_Purification_Room_F24_0_08034cf4:
    .word EventHandler_Govt_Waterworks_Purification_Room_F24_0


_ts EventHandler_Govt_Waterworks_Purification_Room_F24_0
    push       {lr}
    mov        r0,#0xd8
    bl         Flag_GetBase
    beq        LAB_08034d12
    push       {r5}
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_FUN_0808b844_08034d2c
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_08034d12:
    pop        {pc}

PTR_PTR_MapSetup_Default_08034d14:
    .word PTR_MapSetup_Default_08034c78

PTR_BgTask_8034D18:
    .word BgTask_80312E8

PTR_BgTask_8034D1C:
    .word BgTask_8031300

PTR_PTR_EventHandler_Default_08034d20:
    .word PTR_EventHandler_Default_08034ca4

PTR_NPCList_8035B7C_08034d24:
    .word NPCList_8035B7C

PTR_PTR_EventHandler_Govt_Waterworks_Purification_Room_F24_0_08034d28:
    .word PTR_EventHandler_Govt_Waterworks_Purification_Room_F24_0_08034cf4

PTR_FUN_0808b844_08034d2c:
    .word 0x808B845


_ts MapSetup_Govt_Waterworks_Purification_Room_S3
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_Govt_Waterworks_Purification_Room_F40_08034dc4
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Sound_AreaSongChange
    pop        {pc}

PTR_MapSetup_Govt_Waterworks_Purification_Room_F40_08034d40:
    .word MapSetup_Govt_Waterworks_Purification_Room_F40
    .word MapSetup_Govt_Waterworks_Purification_Room_F40
    .word MapSetup_Govt_Waterworks_Purification_Room_F40
    .word MapSetup_Govt_Waterworks_Purification_Room_F40
    .word MapSetup_Govt_Waterworks_Purification_Room_F40
    .word MapSetup_Govt_Waterworks_Purification_Room_F40
    .word MapSetup_Govt_Waterworks_Purification_Room_F40
    .word MapSetup_Govt_Waterworks_Purification_Room_F40


_ts EventHandler_Govt_Waterworks_Purification_Room_S3
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Waterworks_Purification_Room_F40_08034dc8
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Govt_Waterworks_Purification_Room_F40_08034d6c:
    .word EventHandler_Govt_Waterworks_Purification_Room_F40
    .word EventHandler_Govt_Waterworks_Purification_Room_F40
    .word EventHandler_Govt_Waterworks_Purification_Room_F40
    .word EventHandler_Govt_Waterworks_Purification_Room_F40
    .word EventHandler_Govt_Waterworks_Purification_Room_F40
    .word EventHandler_Govt_Waterworks_Purification_Room_F40
    .word EventHandler_Govt_Waterworks_Purification_Room_F40
    .word EventHandler_Govt_Waterworks_Purification_Room_F40


_ts MapSetup_Govt_Waterworks_Purification_Room_F40
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_NPCList_8035BCC_08034dcc
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Govt_Waterworks_Purification_Room_F40
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Waterworks_Purification_Room_F30_0_08034dd0
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Govt_Waterworks_Purification_Room_F30_0_08034dbc:
    .word EventHandler_Govt_Waterworks_Purification_Room_F30_0


_ts EventHandler_Govt_Waterworks_Purification_Room_F30_0
    push       {lr}
    pop        {pc}

PTR_PTR_MapSetup_Govt_Waterworks_Purification_Room_F40_08034dc4:
    .word PTR_MapSetup_Govt_Waterworks_Purification_Room_F40_08034d40

PTR_PTR_EventHandler_Govt_Waterworks_Purification_Room_F40_08034dc8:
    .word PTR_EventHandler_Govt_Waterworks_Purification_Room_F40_08034d6c

PTR_NPCList_8035BCC_08034dcc:
    .word NPCList_8035BCC

PTR_PTR_EventHandler_Govt_Waterworks_Purification_Room_F30_0_08034dd0:
    .word PTR_EventHandler_Govt_Waterworks_Purification_Room_F30_0_08034dbc


_ts MapSetup_Govt_Waterworks_Purification_Room_S5
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_Govt_Waterworks_Purification_Room_F50_08034e7c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Sound_AreaSongChange
    pop        {pc}

PTR_MapSetup_Govt_Waterworks_Purification_Room_F50_08034de4:
    .word MapSetup_Govt_Waterworks_Purification_Room_F50
    .word MapSetup_Govt_Waterworks_Purification_Room_F50
    .word MapSetup_Govt_Waterworks_Purification_Room_F50
    .word MapSetup_Govt_Waterworks_Purification_Room_F50
    .word MapSetup_Govt_Waterworks_Purification_Room_F50
    .word MapSetup_Govt_Waterworks_Purification_Room_F50
    .word MapSetup_Govt_Waterworks_Purification_Room_F50
    .word MapSetup_Govt_Waterworks_Purification_Room_F50


_ts EventHandler_Govt_Waterworks_Purification_Room_S5
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Waterworks_Purification_Room_F50_08034e80
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Govt_Waterworks_Purification_Room_F50_08034e10:
    .word EventHandler_Govt_Waterworks_Purification_Room_F50
    .word EventHandler_Govt_Waterworks_Purification_Room_F50
    .word EventHandler_Govt_Waterworks_Purification_Room_F50
    .word EventHandler_Govt_Waterworks_Purification_Room_F50
    .word EventHandler_Govt_Waterworks_Purification_Room_F50
    .word EventHandler_Govt_Waterworks_Purification_Room_F50
    .word EventHandler_Govt_Waterworks_Purification_Room_F50
    .word EventHandler_Govt_Waterworks_Purification_Room_F50


_ts MapSetup_Govt_Waterworks_Purification_Room_F50
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrb       r7,[r7,#0x6]
    cmp        r7,#0x53
    blt        LAB_08034e54
    ldr        r7,PTR_NPCList_8035BD8_08034e84
    bl         Map_LoadNPCList
    b          LAB_08034e5a
LAB_08034e54:
    ldr        r7,PTR_NPCList_8035BCC_08034e88
    bl         Map_LoadNPCList
LAB_08034e5a:
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_Govt_Waterworks_Purification_Room_F50
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Waterworks_Purification_Room_F50_0_08034e8c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_Govt_Waterworks_Purification_Room_F50_0_08034e74:
    .word EventHandler_Govt_Waterworks_Purification_Room_F50_0


_ts EventHandler_Govt_Waterworks_Purification_Room_F50_0
    push       {lr}
    pop        {pc}

PTR_PTR_MapSetup_Govt_Waterworks_Purification_Room_F50_08034e7c:
    .word PTR_MapSetup_Govt_Waterworks_Purification_Room_F50_08034de4

PTR_PTR_EventHandler_Govt_Waterworks_Purification_Room_F50_08034e80:
    .word PTR_EventHandler_Govt_Waterworks_Purification_Room_F50_08034e10

PTR_NPCList_8035BD8_08034e84:
    .word NPCList_8035BD8

PTR_NPCList_8035BCC_08034e88:
    .word NPCList_8035BCC

PTR_PTR_EventHandler_Govt_Waterworks_Purification_Room_F50_0_08034e8c:
    .word PTR_EventHandler_Govt_Waterworks_Purification_Room_F50_0_08034e74
