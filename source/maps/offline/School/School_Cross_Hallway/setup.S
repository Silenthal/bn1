#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_School_Cross_Hallway_S1
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_School_Cross_Hallway_F10_08027ea4
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    mov        r0,#0x9a
    bl         Flag_GetBase
    pop        {r5}
    beq        LAB_08027d3a
    mov        r0,#0x4
    bl         Sound_ChangeSong
    pop        {pc}
LAB_08027d3a:
    bl         Sound_AreaSongChange
    pop        {pc}
PTR_MapSetup_School_Cross_Hallway_F10_08027d40:
    .word MapSetup_School_Cross_Hallway_F10
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_School_Cross_Hallway_F15
    .word MapSetup_Default
    .word MapSetup_Default


_ts EventHandler_School_Cross_Hallway_S1
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Cross_Hallway_F10_08027ea8
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_Cross_Hallway_F10_08027d6c:
    .word EventHandler_School_Cross_Hallway_F10
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_School_Cross_Hallway_F15
    .word EventHandler_Default
    .word EventHandler_Default


_ts MapSetup_School_Cross_Hallway_F10
    push       {lr}
    mov        r3,#0x4
    push       {r5}
    mov        r0,#0x91
    bl         Flag_GetBase
    bne        LAB_08027d9c
    mov        r3,#0x0
LAB_08027d9c:
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    str        r3,[r5,#0x0]
    mov        r0,#0x0
    bl         Flag_SetGate
    mov        r0,#0x2
    bl         Flag_SetGate
    pop        {pc}


_ts EventHandler_School_Cross_Hallway_F10
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Cross_Hallway_F10_0_08027eac
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_Cross_Hallway_F10_0_08027dcc:
    .word EventHandler_School_Cross_Hallway_F10_0
    .word EventHandler_School_Cross_Hallway_F10_1


_ts EventHandler_School_Cross_Hallway_F10_0
    push       {lr}
    push       {r5}
    ldr        r0,PTR_Scene_Story_11_08027eb0
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_School_Cross_Hallway_F10_1
    push       {lr}
    mov        r0,#0x3
    bl         Flag_GetEmailReceived
    bne        LAB_08027e00
    push       {r5}
    ldr        r0,PTR_Scene_CheckMail_08027eb4
    ldr        r1,DAT_08027eb8
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_08027e00:
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x1
    beq        LAB_08027e1a
    cmp        r0,#0x3
    beq        LAB_08027e2e
    pop        {pc}
LAB_08027e1a:
    push       {r5}
    mov        r0,#0x93
    bl         Flag_GetBase
    pop        {r5}
    bne        LAB_08027e2a
    mov        r1,#0x7
    b          LAB_08027e3e
LAB_08027e2a:
    ldr        r1,DAT_08027ebc
    b          LAB_08027e3e
LAB_08027e2e:
    push       {r5}
    mov        r0,#0x94
    bl         Flag_GetBase
    pop        {r5}
    bne        LAB_08027e3c
    ldr        r1,DAT_08027ec0
LAB_08027e3c:
    ldr        r1,DAT_08027ec4
LAB_08027e3e:
    push       {r5}
    ldr        r0,PTR_Scene_LockedPath_08027ec8
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}


_nt MapSetup_School_Cross_Hallway_F15
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    mov        r0,#0x0
    bl         Flag_SetGate
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_School_Cross_Hallway_F15
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Cross_Hallway_F15_0_08027ecc
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_School_Cross_Hallway_F15_0_08027e7c:
    .word EventHandler_School_Cross_Hallway_F15_0


_ts EventHandler_School_Cross_Hallway_F15_0
    push       {lr}
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x1
    bne        LAB_08027ea2
    push       {r5}
    ldr        r1,DAT_08027ed0
    ldr        r0,DAT_08027ed4
    bl         Scene_Prepare
    pop        {r5}
LAB_08027ea2:
    pop        {pc}
PTR_PTR_MapSetup_School_Cross_Hallway_F10_08027ea4:
    .word PTR_MapSetup_School_Cross_Hallway_F10_08027d40
PTR_PTR_EventHandler_School_Cross_Hallway_F10_08027ea8:
    .word PTR_EventHandler_School_Cross_Hallway_F10_08027d6c
PTR_PTR_EventHandler_School_Cross_Hallway_F10_0_08027eac:
    .word PTR_EventHandler_School_Cross_Hallway_F10_0_08027dcc
PTR_Scene_Story_11_08027eb0:
    .word Scene_Story_11
PTR_Scene_CheckMail_08027eb4:
    .word Scene_CheckMail
DAT_08027eb8:
    .word 0x103
DAT_08027ebc:
    .word 0x207
DAT_08027ec0:
    .word 0x205
DAT_08027ec4:
    .word 0x105
PTR_Scene_LockedPath_08027ec8:
    .word Scene_LockedPath
PTR_PTR_EventHandler_School_Cross_Hallway_F15_0_08027ecc:
    .word PTR_EventHandler_School_Cross_Hallway_F15_0_08027e7c
DAT_08027ed0:
    .word 0x507
DAT_08027ed4:
    .word Scene_LockedPath


_ts MapSetup_School_Cross_Hallway_S2
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_Default_08027f94
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r0,#0xab
    bl         Flag_GetBase
    beq        LAB_08027ef6
    push       {r5}
    mov        r0,#0x4
    bl         Sound_ChangeSong
    pop        {r5}
    b          LAB_08027f0e
LAB_08027ef6:
    mov        r0,#0xdf
    bl         Flag_GetBase
    beq        LAB_08027f0a
    push       {r5}
    mov        r0,#0x3
    bl         Sound_ChangeSong
    pop        {r5}
    b          LAB_08027f0e
LAB_08027f0a:
    bl         Sound_AreaSongChange
LAB_08027f0e:
    pop        {pc}
PTR_MapSetup_Default_08027f10:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_School_Cross_Hallway_F25
    .word MapSetup_School_Cross_Hallway_F25
    .word MapSetup_School_Cross_Hallway_F25


_ts EventHandler_School_Cross_Hallway_S2
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Default_08027f98
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_Default_08027f3c:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_School_Cross_Hallway_F25
    .word EventHandler_School_Cross_Hallway_F25
    .word EventHandler_School_Cross_Hallway_F25


_ts MapSetup_School_Cross_Hallway_F25
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_PTR_DAT_08027f9c
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_School_Cross_Hallway_F25
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Cross_Hallway_F25_0_08027fa0
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_Cross_Hallway_F25_0_08027f8c:
    .word EventHandler_School_Cross_Hallway_F25_0


_ts EventHandler_School_Cross_Hallway_F25_0
    push       {lr}
    pop        {pc}
PTR_PTR_MapSetup_Default_08027f94:
    .word PTR_MapSetup_Default_08027f10
PTR_PTR_EventHandler_Default_08027f98:
    .word PTR_EventHandler_Default_08027f3c
PTR_PTR_DAT_08027f9c:
    .word NPCList_80299BC
PTR_PTR_EventHandler_School_Cross_Hallway_F25_0_08027fa0:
    .word PTR_EventHandler_School_Cross_Hallway_F25_0_08027f8c


_ts MapSetup_School_Cross_Hallway_S3
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_School_Cross_Hallway_F30_08028034
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Sound_AreaSongChange
    pop        {pc}
PTR_MapSetup_School_Cross_Hallway_F30_08027fb4:
    .word MapSetup_School_Cross_Hallway_F30
    .word MapSetup_School_Cross_Hallway_F30
    .word MapSetup_School_Cross_Hallway_F30
    .word MapSetup_School_Cross_Hallway_F30
    .word MapSetup_School_Cross_Hallway_F30
    .word MapSetup_School_Cross_Hallway_F30
    .word MapSetup_School_Cross_Hallway_F30
    .word MapSetup_School_Cross_Hallway_F30


_ts EventHandler_School_Cross_Hallway_S3
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Cross_Hallway_F30_08028038
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_Cross_Hallway_F30_08027fe0:
    .word EventHandler_School_Cross_Hallway_F30
    .word EventHandler_School_Cross_Hallway_F30
    .word EventHandler_School_Cross_Hallway_F30
    .word EventHandler_School_Cross_Hallway_F30
    .word EventHandler_School_Cross_Hallway_F30
    .word EventHandler_School_Cross_Hallway_F30
    .word EventHandler_School_Cross_Hallway_F30
    .word EventHandler_School_Cross_Hallway_F30


_ts MapSetup_School_Cross_Hallway_F30
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


_nt EventHandler_School_Cross_Hallway_F30
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Cross_Hallway_F30_0_0802803c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_School_Cross_Hallway_F30_0_0802802c:
    .word EventHandler_School_Cross_Hallway_F30_0


_ts EventHandler_School_Cross_Hallway_F30_0
    push       {lr}
    pop        {pc}
PTR_PTR_MapSetup_School_Cross_Hallway_F30_08028034:
    .word PTR_MapSetup_School_Cross_Hallway_F30_08027fb4
PTR_PTR_EventHandler_School_Cross_Hallway_F30_08028038:
    .word PTR_EventHandler_School_Cross_Hallway_F30_08027fe0
PTR_PTR_EventHandler_School_Cross_Hallway_F30_0_0802803c:
    .word PTR_EventHandler_School_Cross_Hallway_F30_0_0802802c
