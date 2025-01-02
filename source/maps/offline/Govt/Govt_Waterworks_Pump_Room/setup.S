#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_Govt_Waterworks_Pump_Room_S2
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_Default_08034afc
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    Flag_GetBase 0xAB
    beq        LAB_08034a5e
    push       {r5}
    mov        r0,#0x4
    bl         Sound_ChangeSong
    pop        {r5}
    b          LAB_08034a76
LAB_08034a5e:
    Flag_GetBase 0xDF
    beq        LAB_08034a72
    push       {r5}
    mov        r0,#0x3
    bl         Sound_ChangeSong
    pop        {r5}
    b          LAB_08034a76
LAB_08034a72:
    bl         Sound_AreaSongChange
LAB_08034a76:
    pop        {pc}

PTR_MapSetup_Default_08034a78:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Govt_Waterworks_Pump_Room_F24
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default


_ts EventHandler_Govt_Waterworks_Pump_Room_S2
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Default_08034b00
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Default_08034aa4:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Govt_Waterworks_Pump_Room_F24
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default


_ts MapSetup_Govt_Waterworks_Pump_Room_F24
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_NPCList_8035B1C_08034b04
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Govt_Waterworks_Pump_Room_F24
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Waterworks_Pump_Room_F24_0_08034b08
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Govt_Waterworks_Pump_Room_F24_0_08034af4:
    .word EventHandler_Govt_Waterworks_Pump_Room_F24_0


_ts EventHandler_Govt_Waterworks_Pump_Room_F24_0
    push       {lr}
    pop        {pc}

PTR_PTR_MapSetup_Default_08034afc:
    .word PTR_MapSetup_Default_08034a78

PTR_PTR_EventHandler_Default_08034b00:
    .word PTR_EventHandler_Default_08034aa4

PTR_NPCList_8035B1C_08034b04:
    .word NPCList_8035B1C

PTR_PTR_EventHandler_Govt_Waterworks_Pump_Room_F24_0_08034b08:
    .word PTR_EventHandler_Govt_Waterworks_Pump_Room_F24_0_08034af4


_ts MapSetup_Govt_Waterworks_Pump_Room_S3
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_Govt_Waterworks_Pump_Room_F40_08034ba4
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Sound_AreaSongChange
    pop        {pc}

PTR_MapSetup_Govt_Waterworks_Pump_Room_F40_08034b1c:
    .word MapSetup_Govt_Waterworks_Pump_Room_F40
    .word MapSetup_Govt_Waterworks_Pump_Room_F40
    .word MapSetup_Govt_Waterworks_Pump_Room_F40
    .word MapSetup_Govt_Waterworks_Pump_Room_F40
    .word MapSetup_Govt_Waterworks_Pump_Room_F40
    .word MapSetup_Govt_Waterworks_Pump_Room_F40
    .word MapSetup_Govt_Waterworks_Pump_Room_F40
    .word MapSetup_Govt_Waterworks_Pump_Room_F40


_ts EventHandler_Govt_Waterworks_Pump_Room_S3
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Waterworks_Pump_Room_F40_08034ba8
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Govt_Waterworks_Pump_Room_F40_08034b48:
    .word EventHandler_Govt_Waterworks_Pump_Room_F40
    .word EventHandler_Govt_Waterworks_Pump_Room_F40
    .word EventHandler_Govt_Waterworks_Pump_Room_F40
    .word EventHandler_Govt_Waterworks_Pump_Room_F40
    .word EventHandler_Govt_Waterworks_Pump_Room_F40
    .word EventHandler_Govt_Waterworks_Pump_Room_F40
    .word EventHandler_Govt_Waterworks_Pump_Room_F40
    .word EventHandler_Govt_Waterworks_Pump_Room_F40


_ts MapSetup_Govt_Waterworks_Pump_Room_F40
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_8035B1C_08034bac
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Govt_Waterworks_Pump_Room_F40
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Waterworks_Pump_Room_F30_0_08034bb0
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Govt_Waterworks_Pump_Room_F30_0_08034b9c:
    .word EventHandler_Govt_Waterworks_Pump_Room_F30_0


_ts EventHandler_Govt_Waterworks_Pump_Room_F30_0
    push       {lr}
    pop        {pc}

PTR_PTR_MapSetup_Govt_Waterworks_Pump_Room_F40_08034ba4:
    .word PTR_MapSetup_Govt_Waterworks_Pump_Room_F40_08034b1c

PTR_PTR_EventHandler_Govt_Waterworks_Pump_Room_F40_08034ba8:
    .word PTR_EventHandler_Govt_Waterworks_Pump_Room_F40_08034b48

PTR_NPCList_8035B1C_08034bac:
    .word NPCList_8035B1C

PTR_PTR_EventHandler_Govt_Waterworks_Pump_Room_F30_0_08034bb0:
    .word PTR_EventHandler_Govt_Waterworks_Pump_Room_F30_0_08034b9c


_ts MapSetup_Govt_Waterworks_Pump_Room_S5
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_Govt_Waterworks_Pump_Room_F50_08034c48
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Sound_AreaSongChange
    pop        {pc}

PTR_MapSetup_Govt_Waterworks_Pump_Room_F50_08034bc4:
    .word MapSetup_Govt_Waterworks_Pump_Room_F50
    .word MapSetup_Govt_Waterworks_Pump_Room_F50
    .word MapSetup_Govt_Waterworks_Pump_Room_F50
    .word MapSetup_Govt_Waterworks_Pump_Room_F50
    .word MapSetup_Govt_Waterworks_Pump_Room_F50
    .word MapSetup_Govt_Waterworks_Pump_Room_F50
    .word MapSetup_Govt_Waterworks_Pump_Room_F50
    .word MapSetup_Govt_Waterworks_Pump_Room_F50


_ts EventHandler_Govt_Waterworks_Pump_Room_S5
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Waterworks_Pump_Room_F50_08034c4c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Govt_Waterworks_Pump_Room_F50_08034bf0:
    .word EventHandler_Govt_Waterworks_Pump_Room_F50
    .word EventHandler_Govt_Waterworks_Pump_Room_F50
    .word EventHandler_Govt_Waterworks_Pump_Room_F50
    .word EventHandler_Govt_Waterworks_Pump_Room_F50
    .word EventHandler_Govt_Waterworks_Pump_Room_F50
    .word EventHandler_Govt_Waterworks_Pump_Room_F50
    .word EventHandler_Govt_Waterworks_Pump_Room_F50
    .word EventHandler_Govt_Waterworks_Pump_Room_F50


_ts MapSetup_Govt_Waterworks_Pump_Room_F50
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_NPCList_8035B1C_08034c50
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Govt_Waterworks_Pump_Room_F50
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Waterworks_Pump_Room_F50_0_08034c54
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Govt_Waterworks_Pump_Room_F50_0_08034c40:
    .word EventHandler_Govt_Waterworks_Pump_Room_F50_0


_ts EventHandler_Govt_Waterworks_Pump_Room_F50_0
    push       {lr}
    pop        {pc}

PTR_PTR_MapSetup_Govt_Waterworks_Pump_Room_F50_08034c48:
    .word PTR_MapSetup_Govt_Waterworks_Pump_Room_F50_08034bc4

PTR_PTR_EventHandler_Govt_Waterworks_Pump_Room_F50_08034c4c:
    .word PTR_EventHandler_Govt_Waterworks_Pump_Room_F50_08034bf0

PTR_NPCList_8035B1C_08034c50:
    .word NPCList_8035B1C

PTR_PTR_EventHandler_Govt_Waterworks_Pump_Room_F50_0_08034c54:
    .word PTR_EventHandler_Govt_Waterworks_Pump_Room_F50_0_08034c40
