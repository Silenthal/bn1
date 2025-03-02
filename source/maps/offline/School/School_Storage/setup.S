#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_School_Storage_S1
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_Default_08028120
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    Flag_GetBase 0x9A
    pop        {r5}
    beq        LAB_0802805e
    mov        r0,#T_Incident_Occurrence
    bl         Sound_PlayBGM
    pop        {pc}
LAB_0802805e:
    bl         Sound_AreaSongChange
    pop        {pc}
PTR_MapSetup_Default_08028064:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_School_Storage_F15
    .word MapSetup_Default
    .word MapSetup_Default


_ts EventHandler_School_Storage_S1
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Default_08028124
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_Default_08028090:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_School_Storage_F15
    .word EventHandler_Default
    .word EventHandler_Default


_ts MapSetup_School_Storage_F15
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_PTR_DAT_08028128
    bl         Map_LoadNPCList
    pop        {r5}
    Flag_GetBase 0xBE
    beq        LAB_080280d8
    mov        r0,#0x8
    strb       r0,[r5,#0x0]
    pop        {pc}
LAB_080280d8:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_School_Storage_F15
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Storage_F15_0_0802812c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_School_Storage_F15_0_080280f0:
    .word EventHandler_School_Storage_F15_0
    .word EventHandler_School_Storage_F15_1
    .word EventHandler_School_Storage_F15_2


_ts EventHandler_School_Storage_F15_0
    push       {lr}
    Flag_GetBase 0xBE
    beq        LAB_08028116
    push       {r5}
    mov        r1,#0x0
    ldr        r0,PTR_Scene_Get_SchoolID_08028130
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x8
    strb       r0,[r5,#0x0]
LAB_08028116:
    pop        {pc}


_ts EventHandler_School_Storage_F15_1
    push       {lr}
    pop        {pc}


_ts EventHandler_School_Storage_F15_2
    push       {lr}
    pop        {pc}
PTR_PTR_MapSetup_Default_08028120:
    .word PTR_MapSetup_Default_08028064
PTR_PTR_EventHandler_Default_08028124:
    .word PTR_EventHandler_Default_08028090
PTR_PTR_DAT_08028128:
    .word NPCList_80299DC
PTR_PTR_EventHandler_School_Storage_F15_0_0802812c:
    .word PTR_EventHandler_School_Storage_F15_0_080280f0
PTR_Scene_Get_SchoolID_08028130:
    .word Scene_Get_SchoolID


_ts MapSetup_School_Storage_S2
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_School_Storage_F20_08028220
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    Flag_GetBase 0xAB
    beq        LAB_08028152
    push       {r5}
    mov        r0,#T_Incident_Occurrence
    bl         Sound_PlayBGM
    pop        {r5}
    b          LAB_0802816a
LAB_08028152:
    Flag_GetBase 0xDF
    beq        LAB_08028166
    push       {r5}
    mov        r0,#T_Suspicious_Mood
    bl         Sound_PlayBGM
    pop        {r5}
    b          LAB_0802816a
LAB_08028166:
    bl         Sound_AreaSongChange
LAB_0802816a:
    pop        {pc}
PTR_MapSetup_School_Storage_F20_0802816c:
    .word MapSetup_School_Storage_F20
    .word MapSetup_School_Storage_F20
    .word MapSetup_School_Storage_F20
    .word MapSetup_School_Storage_F23
    .word MapSetup_School_Storage_F23
    .word MapSetup_School_Storage_F23
    .word MapSetup_School_Storage_F23
    .word MapSetup_School_Storage_F23


_ts EventHandler_School_Storage_S2
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Storage_F20_08028224
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_Storage_F20_08028198:
    .word EventHandler_School_Storage_F20
    .word EventHandler_School_Storage_F20
    .word EventHandler_School_Storage_F20
    .word EventHandler_School_Storage_F23
    .word EventHandler_School_Storage_F23
    .word EventHandler_School_Storage_F23
    .word EventHandler_School_Storage_F23
    .word EventHandler_School_Storage_F23


_ts MapSetup_School_Storage_F20
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_School_Storage_F20
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Storage_F20_0_08028228
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_School_Storage_F20_0_080281e4:
    .word EventHandler_School_Storage_F20_0


_ts EventHandler_School_Storage_F20_0
    push       {lr}
    pop        {pc}


_ts MapSetup_School_Storage_F23
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_School_Storage_F23
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Storage_F23_0_0802822c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_School_Storage_F23_0_08028218:
    .word EventHandler_School_Storage_F23_0


_ts EventHandler_School_Storage_F23_0
    push       {lr}
    pop        {pc}
PTR_PTR_MapSetup_School_Storage_F20_08028220:
    .word PTR_MapSetup_School_Storage_F20_0802816c
PTR_PTR_EventHandler_School_Storage_F20_08028224:
    .word PTR_EventHandler_School_Storage_F20_08028198
PTR_PTR_EventHandler_School_Storage_F20_0_08028228:
    .word PTR_EventHandler_School_Storage_F20_0_080281e4
PTR_PTR_EventHandler_School_Storage_F23_0_0802822c:
    .word PTR_EventHandler_School_Storage_F23_0_08028218


_ts MapSetup_School_Storage_S3
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_School_Storage_F30_080282d0
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Sound_AreaSongChange
    pop        {pc}
PTR_MapSetup_School_Storage_F30_08028240:
    .word MapSetup_School_Storage_F30
    .word MapSetup_School_Storage_F30
    .word MapSetup_School_Storage_F30
    .word MapSetup_School_Storage_F30
    .word MapSetup_School_Storage_F30
    .word MapSetup_School_Storage_F30
    .word MapSetup_School_Storage_F30
    .word MapSetup_School_Storage_F30


_ts EventHandler_School_Storage_S3
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Storage_F30_080282d4
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_Storage_F30_0802826c:
    .word EventHandler_School_Storage_F30
    .word EventHandler_School_Storage_F30
    .word EventHandler_School_Storage_F30
    .word EventHandler_School_Storage_F30
    .word EventHandler_School_Storage_F30
    .word EventHandler_School_Storage_F30
    .word EventHandler_School_Storage_F30
    .word EventHandler_School_Storage_F30


_ts MapSetup_School_Storage_F30
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    LoadMain world, r7, r7
    ldrb       r7,[r7,#World_storyFlag]
    cmp        r7,#0x53
    blt        LAB_080282ae
    ldr        r7,PTR_PTR_DAT_080282d8
    bl         Map_LoadNPCList
LAB_080282ae:
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_School_Storage_F30
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Storage_F30_0_080282dc
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_School_Storage_F30_0_080282c8:
    .word EventHandler_School_Storage_F30_0


_ts EventHandler_School_Storage_F30_0
    push       {lr}
    pop        {pc}
PTR_PTR_MapSetup_School_Storage_F30_080282d0:
    .word PTR_MapSetup_School_Storage_F30_08028240
PTR_PTR_EventHandler_School_Storage_F30_080282d4:
    .word PTR_EventHandler_School_Storage_F30_0802826c
PTR_PTR_DAT_080282d8:
    .word NPCList_80299E4
PTR_PTR_EventHandler_School_Storage_F30_0_080282dc:
    .word PTR_EventHandler_School_Storage_F30_0_080282c8
