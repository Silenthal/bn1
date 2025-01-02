#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_DenTown_Miyu_Antiques_S3
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_DenTown_Miyu_Antiques_F30_080388a4
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    Flag_GetBase 0xBD
    bne        LAB_08038752
    Flag_GetBase 0xA6
    beq        LAB_08038732
    mov        r0,#T_Incident_Occurrence
    bl         Sound_ChangeSong
    b          LAB_08038756
LAB_08038732:
    Flag_GetBase 0x9B
    beq        LAB_08038742
    mov        r0,#T_Suspicious_Mood
    bl         Sound_ChangeSong
    b          LAB_08038756
LAB_08038742:
    Flag_GetBase 0x98
    beq        LAB_08038752
    mov        r0,#T_Incident_Occurrence
    bl         Sound_ChangeSong
    b          LAB_08038756
LAB_08038752:
    bl         Sound_AreaSongChange
LAB_08038756:
    pop        {pc}

PTR_MapSetup_DenTown_Miyu_Antiques_F30_08038758:
    .word MapSetup_DenTown_Miyu_Antiques_F30
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_DenTown_Miyu_Antiques_F34
    .word MapSetup_DenTown_Miyu_Antiques_F34
    .word MapSetup_Default
    .word MapSetup_Default


_ts EventHandler_DenTown_Miyu_Antiques_S3
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_DenTown_Miyu_Antiques_F30_080388a8
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r0,#0x41
    mov        r1,#0x27
    bl         CheckForJackIn
    pop        {pc}

PTR_EventHandler_DenTown_Miyu_Antiques_F30_0803878c:
    .word EventHandler_DenTown_Miyu_Antiques_F30
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_DenTown_Miyu_Antiques_F34
    .word EventHandler_DenTown_Miyu_Antiques_F34
    .word EventHandler_Default
    .word EventHandler_Default


_ts MapSetup_DenTown_Miyu_Antiques_F30
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_80395D4_080388ac
    bl         Map_LoadNPCList
    pop        {r5}
    Flag_GetBase 0x3B
    bne        LAB_080387e6
    Flag_GetBase 0x2D
    beq        LAB_080387e6
    push       {r5}
    ldr        r0,DAT_080388b0
    mov        r1,#0x6
    bl         Scene_Prepare
    pop        {r5}
LAB_080387e6:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_DenTown_Miyu_Antiques_F30
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_DenTown_Miyu_Antiques_F30_0_080388b4
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_DenTown_Miyu_Antiques_F30_0_080387fc:
    .word EventHandler_DenTown_Miyu_Antiques_F30_0


_ts EventHandler_DenTown_Miyu_Antiques_F30_0
    push       {lr}
    Flag_GetBase 0x3B
    bne        LAB_0803881e
    Flag_GetBase 0x2D
    beq        LAB_0803881e
    push       {r5}
    ldr        r0,DAT_080388b8
    mov        r1,#0x9
    bl         Scene_Prepare
    pop        {r5}
LAB_0803881e:
    mov        r1,#0x1b
    bl         EventHandler_Offline_HandleJackIn
    pop        {pc}


_nt MapSetup_DenTown_Miyu_Antiques_F34
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_80395D4_080388bc
    bl         Map_LoadNPCList
    pop        {r5}
    Flag_GetBase 0x3B
    bne        LAB_08038860
    Flag_GetBase 0x2D
    beq        LAB_08038860
    push       {r5}
    ldr        r0,PTR_Scene_AfterFixedBattle_080388c0
    mov        r1,#0x6
    bl         Scene_Prepare
    pop        {r5}
LAB_08038860:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_DenTown_Miyu_Antiques_F34
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_DenTown_Miyu_Antiques_F34_0_080388c4
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_DenTown_Miyu_Antiques_F34_0_08038878:
    .word EventHandler_DenTown_Miyu_Antiques_F34_0


_ts EventHandler_DenTown_Miyu_Antiques_F34_0
    push       {lr}
    Flag_GetBase 0x3B
    bne        LAB_0803889a
    Flag_GetBase 0x2D
    beq        LAB_0803889a
    push       {r5}
    ldr        r0,DAT_080388c8
    mov        r1,#0x9
    bl         Scene_Prepare
    pop        {r5}
LAB_0803889a:
    mov        r1,#0x1b
    bl         EventHandler_Offline_HandleJackIn
    pop        {pc}

    .align 2, 0

PTR_PTR_MapSetup_DenTown_Miyu_Antiques_F30_080388a4:
    .word PTR_MapSetup_DenTown_Miyu_Antiques_F30_08038758

PTR_PTR_EventHandler_DenTown_Miyu_Antiques_F30_080388a8:
    .word PTR_EventHandler_DenTown_Miyu_Antiques_F30_0803878c

PTR_NPCList_80395D4_080388ac:
    .word NPCList_80395D4

DAT_080388b0:
    .word Scene_AfterFixedBattle

PTR_PTR_EventHandler_DenTown_Miyu_Antiques_F30_0_080388b4:
    .word PTR_EventHandler_DenTown_Miyu_Antiques_F30_0_080387fc

DAT_080388b8:
    .word Scene_StartFixedBattle

PTR_NPCList_80395D4_080388bc:
    .word NPCList_80395D4

PTR_Scene_AfterFixedBattle_080388c0:
    .word Scene_AfterFixedBattle

PTR_PTR_EventHandler_DenTown_Miyu_Antiques_F34_0_080388c4:
    .word PTR_EventHandler_DenTown_Miyu_Antiques_F34_0_08038878

DAT_080388c8:
    .word Scene_StartFixedBattle


_ts MapSetup_DenTown_Miyu_Antiques_S4
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_DenTown_Miyu_Antiques_F40_080389cc
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Sound_AreaSongChange
    pop        {pc}

PTR_MapSetup_DenTown_Miyu_Antiques_F40_080388dc:
    .word MapSetup_DenTown_Miyu_Antiques_F40
    .word MapSetup_DenTown_Miyu_Antiques_F40
    .word MapSetup_DenTown_Miyu_Antiques_F40
    .word MapSetup_DenTown_Miyu_Antiques_F40
    .word MapSetup_DenTown_Miyu_Antiques_F40
    .word MapSetup_DenTown_Miyu_Antiques_F40
    .word MapSetup_DenTown_Miyu_Antiques_F40
    .word MapSetup_DenTown_Miyu_Antiques_F40


_ts EventHandler_DenTown_Miyu_Antiques_S4
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_DenTown_Miyu_Antiques_F40_080389d0
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r0,#0x41
    mov        r1,#0x27
    bl         CheckForJackIn
    pop        {pc}

PTR_EventHandler_DenTown_Miyu_Antiques_F40_08038910:
    .word EventHandler_DenTown_Miyu_Antiques_F40
    .word EventHandler_DenTown_Miyu_Antiques_F40
    .word EventHandler_DenTown_Miyu_Antiques_F40
    .word EventHandler_DenTown_Miyu_Antiques_F40
    .word EventHandler_DenTown_Miyu_Antiques_F40
    .word EventHandler_DenTown_Miyu_Antiques_F40
    .word EventHandler_DenTown_Miyu_Antiques_F40
    .word EventHandler_DenTown_Miyu_Antiques_F40


_ts MapSetup_DenTown_Miyu_Antiques_F40
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_80395D4_080389d4
    bl         Map_LoadNPCList
    pop        {r5}
    Flag_GetBase 0x2D
    beq        LAB_0803897e
    mov        r6,#0x6
    Flag_GetBase 0x3B
    beq        LAB_0803896c
    mov        r6,#0xc
    Flag_GetBase 0x3C
    bne        LAB_0803897e
    b          LAB_08038972
LAB_0803896c:
    Flag_ClearBase 0x2D
LAB_08038972:
    add        r1,r6,#0x0
    push       {r5}
    ldr        r0,DAT_080389d8
    bl         Scene_Prepare
    pop        {r5}
LAB_0803897e:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_DenTown_Miyu_Antiques_F40
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_DenTown_Miyu_Antiques_F40_0_080389dc
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_DenTown_Miyu_Antiques_F40_0_08038994:
    .word EventHandler_DenTown_Miyu_Antiques_F40_0


_ts EventHandler_DenTown_Miyu_Antiques_F40_0
    push       {lr}
    mov        r6,#0x9
    Flag_GetBase 0x3B
    beq        LAB_080389ae
    mov        r6,#0xe
    Flag_GetBase 0x3C
    bne        LAB_080389c2
LAB_080389ae:
    Flag_GetBase 0x2D
    beq        LAB_080389c2
    add        r1,r6,#0x0
    push       {r5}
    ldr        r0,DAT_080389e0
    bl         Scene_Prepare
    pop        {r5}
LAB_080389c2:
    mov        r1,#0x1b
    bl         EventHandler_Offline_HandleJackIn
    pop        {pc}

    .align 2, 0

PTR_PTR_MapSetup_DenTown_Miyu_Antiques_F40_080389cc:
    .word PTR_MapSetup_DenTown_Miyu_Antiques_F40_080388dc

PTR_PTR_EventHandler_DenTown_Miyu_Antiques_F40_080389d0:
    .word PTR_EventHandler_DenTown_Miyu_Antiques_F40_08038910

PTR_NPCList_80395D4_080389d4:
    .word NPCList_80395D4

DAT_080389d8:
    .word Scene_AfterFixedBattle

PTR_PTR_EventHandler_DenTown_Miyu_Antiques_F40_0_080389dc:
    .word PTR_EventHandler_DenTown_Miyu_Antiques_F40_0_08038994

DAT_080389e0:
    .word Scene_StartFixedBattle


_ts MapSetup_DenTown_Miyu_Antiques_S5
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_DenTown_Miyu_Antiques_F50_08038ae0
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Sound_AreaSongChange
    pop        {pc}

PTR_MapSetup_DenTown_Miyu_Antiques_F50_080389f4:
    .word MapSetup_DenTown_Miyu_Antiques_F50
    .word MapSetup_DenTown_Miyu_Antiques_F50
    .word MapSetup_DenTown_Miyu_Antiques_F50
    .word MapSetup_DenTown_Miyu_Antiques_F50
    .word MapSetup_DenTown_Miyu_Antiques_F50
    .word MapSetup_DenTown_Miyu_Antiques_F50
    .word MapSetup_DenTown_Miyu_Antiques_F50
    .word MapSetup_DenTown_Miyu_Antiques_F50


_ts EventHandler_DenTown_Miyu_Antiques_S5
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_DenTown_Miyu_Antiques_F50_08038ae4
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r0,#0x41
    mov        r1,#0x27
    bl         CheckForJackIn
    pop        {pc}

PTR_EventHandler_DenTown_Miyu_Antiques_F50_08038a28:
    .word EventHandler_DenTown_Miyu_Antiques_F50
    .word EventHandler_DenTown_Miyu_Antiques_F50
    .word EventHandler_DenTown_Miyu_Antiques_F50
    .word EventHandler_DenTown_Miyu_Antiques_F50
    .word EventHandler_DenTown_Miyu_Antiques_F50
    .word EventHandler_DenTown_Miyu_Antiques_F50
    .word EventHandler_DenTown_Miyu_Antiques_F50
    .word EventHandler_DenTown_Miyu_Antiques_F50


_ts MapSetup_DenTown_Miyu_Antiques_F50
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_NPCList_80395D4_08038ae8
    bl         Map_LoadNPCList
    pop        {r5}
    Flag_GetBase 0x2D
    beq        LAB_08038a92
    mov        r6,#0x6
    Flag_GetBase 0x3B
    beq        LAB_08038a80
    mov        r6,#0xc
    Flag_GetBase 0x3C
    beq        LAB_08038a80
    mov        r6,#0xd
LAB_08038a80:
    Flag_ClearBase 0x2D
    add        r1,r6,#0x0
    push       {r5}
    ldr        r0,DAT_08038aec
    bl         Scene_Prepare
    pop        {r5}
LAB_08038a92:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_DenTown_Miyu_Antiques_F50
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_DenTown_Miyu_Antiques_F50_0_08038af0
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_DenTown_Miyu_Antiques_F50_0_08038aa8:
    .word EventHandler_DenTown_Miyu_Antiques_F50_0


_ts EventHandler_DenTown_Miyu_Antiques_F50_0
    push       {lr}
    mov        r6,#0x9
    Flag_GetBase 0x3B
    beq        LAB_08038ac4
    mov        r6,#0xe
    Flag_GetBase 0x3C
    beq        LAB_08038ac4
    mov        r6,#0xf
LAB_08038ac4:
    Flag_GetBase 0x2D
    beq        LAB_08038ad8
    add        r1,r6,#0x0
    push       {r5}
    ldr        r0,DAT_08038af4
    bl         Scene_Prepare
    pop        {r5}
LAB_08038ad8:
    mov        r1,#0x1b
    bl         EventHandler_Offline_HandleJackIn
    pop        {pc}

PTR_PTR_MapSetup_DenTown_Miyu_Antiques_F50_08038ae0:
    .word PTR_MapSetup_DenTown_Miyu_Antiques_F50_080389f4

PTR_PTR_EventHandler_DenTown_Miyu_Antiques_F50_08038ae4:
    .word PTR_EventHandler_DenTown_Miyu_Antiques_F50_08038a28

PTR_NPCList_80395D4_08038ae8:
    .word NPCList_80395D4

DAT_08038aec:
    .word Scene_AfterFixedBattle

PTR_PTR_EventHandler_DenTown_Miyu_Antiques_F50_0_08038af0:
    .word PTR_EventHandler_DenTown_Miyu_Antiques_F50_0_08038aa8

DAT_08038af4:
    .word Scene_StartFixedBattle
