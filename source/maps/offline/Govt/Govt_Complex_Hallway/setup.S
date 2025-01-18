#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_Govt_Complex_Hallway_S2
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_Default_08033668
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    Flag_GetBase 0xAB
    beq        LAB_08033602
    push       {r5}
    mov        r0,#T_Incident_Occurrence
    bl         Sound_PlayBGM
    pop        {r5}
    b          LAB_0803361a
LAB_08033602:
    Flag_GetBase 0xDF
    beq        LAB_08033616
    push       {r5}
    mov        r0,#T_Suspicious_Mood
    bl         Sound_PlayBGM
    pop        {r5}
    b          LAB_0803361a
LAB_08033616:
    bl         Sound_AreaSongChange
LAB_0803361a:
    pop        {pc}

PTR_MapSetup_Default_0803361c:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default


_ts EventHandler_Govt_Complex_Hallway_S2
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Default_0803366c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Default_08033648:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default

PTR_PTR_MapSetup_Default_08033668:
    .word PTR_MapSetup_Default_0803361c

PTR_PTR_EventHandler_Default_0803366c:
    .word PTR_EventHandler_Default_08033648


_ts MapSetup_Govt_Complex_Hallway_S3
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_Default_080336cc
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Sound_AreaSongChange
    pop        {pc}

PTR_MapSetup_Default_08033680:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default


_ts EventHandler_Govt_Complex_Hallway_S3
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Default_080336d0
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Default_080336ac:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default

PTR_PTR_MapSetup_Default_080336cc:
    .word PTR_MapSetup_Default_08033680

PTR_PTR_EventHandler_Default_080336d0:
    .word PTR_EventHandler_Default_080336ac
