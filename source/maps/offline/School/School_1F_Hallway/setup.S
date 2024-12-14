#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_School_1F_Hallway_S1
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_School_1F_Hallway_F10_08027988
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    mov        r0,#0x9a
    bl         Flag_GetBase
    pop        {r5}
    beq        LAB_080276a2
    mov        r0,#0x4
    bl         Sound_ChangeSong
    pop        {pc}
LAB_080276a2:
    bl         Sound_AreaSongChange
    pop        {pc}
PTR_MapSetup_School_1F_Hallway_F10_080276a8:
    .word MapSetup_School_1F_Hallway_F10
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_School_1F_Hallway_F14
    .word MapSetup_School_1F_Hallway_F15
    .word MapSetup_Default
    .word MapSetup_Default


_ts EventHandler_School_1F_Hallway_S1
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_1F_Hallway_F10_0802798c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_1F_Hallway_F10_080276d4:
    .word EventHandler_School_1F_Hallway_F10
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_School_1F_Hallway_F14
    .word EventHandler_School_1F_Hallway_F15
    .word EventHandler_Default
    .word EventHandler_Default


_ts MapSetup_School_1F_Hallway_F10
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_PTR_DAT_08027990
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    bl         Flag_Set410
    mov        r0,#0x1
    bl         Flag_Set410
    mov        r0,#0x2
    bl         Flag_Set410
    mov        r0,#0x3
    bl         Flag_Set410
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_School_1F_Hallway_F10
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_1F_Hallway_F10_0_08027994
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_1F_Hallway_F10_0_0802773c:
    .word EventHandler_School_1F_Hallway_F10_0


_ts EventHandler_School_1F_Hallway_F10_0
    push       {lr}
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x1
    beq        LAB_08027762
    cmp        r0,#0x2
    beq        LAB_08027762
    cmp        r0,#0x3
    beq        LAB_08027762
    cmp        r0,#0x4
    bne        LAB_0802776e
LAB_08027762:
    push       {r5}
    ldr        r0,DAT_08027998
    ldr        r1,DAT_0802799c
    bl         Scene_Prepare
    pop        {r5}
LAB_0802776e:
    pop        {pc}


_ts MapSetup_School_1F_Hallway_F14
    push       {lr}
    mov        r0,#0x5
    bl         Flag_Set410
    mov        r0,#0x6
    bl         Flag_Set410
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_PTR_DAT_080279a0
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    mov        r0,#0xaf
    bl         Flag_GetBase
    pop        {r5}
    bne        LAB_080277b2
    mov        r0,#0x2
    bl         Flag_Set410
    mov        r0,#0x3
    bl         Flag_Set410
LAB_080277b2:
    push       {r5}
    mov        r0,#0xb2
    bl         Flag_GetBase
    pop        {r5}
    bne        LAB_080277ca
    mov        r0,#0x0
    bl         Flag_Set410
    mov        r0,#0x1
    bl         Flag_Set410
LAB_080277ca:
    mov        r0,#0x8
    bl         Flag_Set410
    push       {r5}
    mov        r0,#0xb4
    bl         Flag_GetBase
    pop        {r5}
    bne        LAB_080277e0
    mov        r0,#0x0
    b          LAB_080277e2
LAB_080277e0:
    mov        r0,#0x4
LAB_080277e2:
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_School_1F_Hallway_F14
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_1F_Hallway_F14_0_080279a4
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    bl         EventHandler_School_1F_Hallway_F14_HandleExits
    pop        {pc}

    .align 2, 0

PTR_EventHandler_School_1F_Hallway_F14_0_080277fc:
    .word EventHandler_School_1F_Hallway_F14_0
    .word EventHandler_School_1F_Hallway_F14_1


_ts EventHandler_School_1F_Hallway_F14_0
    push       {lr}
    push       {r5}
    mov        r0,#0xad
    bl         Flag_GetBase
    pop        {r5}
    beq        LAB_0802781e
    push       {r5}
    mov        r1,#0x7
    ldr        r0,DAT_080279a8
    bl         Scene_Prepare
    pop        {r5}
LAB_0802781e:
    pop        {pc}


_ts EventHandler_School_1F_Hallway_F14_1
    push       {lr}
    pop        {pc}


_ts MapSetup_School_1F_Hallway_F15
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    mov        r0,#0xb2
    bl         Flag_GetBase
    pop        {r5}
    bne        LAB_08027850
    mov        r0,#0x0
    bl         Flag_Set410
    mov        r0,#0x1
    bl         Flag_Set410
LAB_08027850:
    push       {r5}
    mov        r0,#0xaf
    bl         Flag_GetBase
    pop        {r5}
    bne        LAB_08027868
    mov        r0,#0x2
    bl         Flag_Set410
    mov        r0,#0x3
    bl         Flag_Set410
LAB_08027868:
    push       {r5}
    mov        r0,#0xb5
    bl         Flag_GetBase
    pop        {r5}
    bne        LAB_08027886
    mov        r0,#0x5
    bl         Flag_Set410
    mov        r0,#0x6
    bl         Flag_Set410
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    b          LAB_0802788a
LAB_08027886:
    mov        r0,#0x8
    str        r0,[r5,#0x0]
LAB_0802788a:
    push       {r5}
    mov        r0,#0xba
    bl         Flag_GetBase
    pop        {r5}
    bne        LAB_0802789c
    mov        r0,#0x8
    bl         Flag_Set410
LAB_0802789c:
    push       {r5}
    ldr        r7,PTR_PTR_DAT_080279ac
    bl         Map_LoadNPCList
    pop        {r5}
    pop        {pc}


_ts EventHandler_School_1F_Hallway_F15
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_1F_Hallway_F15_0_080279b0
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    bl         EventHandler_School_1F_Hallway_F14_HandleExits
    pop        {pc}
PTR_EventHandler_School_1F_Hallway_F15_0_080278bc:
    .word EventHandler_School_1F_Hallway_F15_0
    .word EventHandler_School_1F_Hallway_F15_1
    .word EventHandler_School_1F_Hallway_F15_2


_ts EventHandler_School_1F_Hallway_F15_0
    push       {lr}
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    mov        r1,#0x1
    cmp        r0,#0x6
    beq        LAB_080278e6
    cmp        r0,#0x7
    bne        LAB_080278f4
    mov        r1,#0x0
LAB_080278e6:
    push       {r5}
    ldr        r0,PTR_Scene_Story_18_080279b4
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080278f4:
    pop        {pc}


_nt EventHandler_School_1F_Hallway_F15_1
    push       {lr}
    mov        r0,#0xb5
    bl         Flag_GetBase
    beq        LAB_08027910
    mov        r0,#0x5
    bl         Flag_Clear410
    mov        r0,#0x6
    bl         Flag_Clear410
    mov        r0,#0x8
    strb       r0,[r5,#0x0]
LAB_08027910:
    pop        {pc}


_nt EventHandler_School_1F_Hallway_F15_2
    push       {lr}
    pop        {pc}


_nt EventHandler_School_1F_Hallway_F14_HandleExits
    bl         Scene_IsSceneActive
    tst        r0,r0
    pop        {r1}
    beq        LAB_08027922
    pop        {pc}
LAB_08027922:
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x1
    beq        LAB_08027978
    cmp        r0,#0x2
    beq        LAB_08027978
    cmp        r0,#0x3
    beq        LAB_0802796a
    cmp        r0,#0x4
    beq        LAB_0802796a
    cmp        r0,#0x6
    beq        LAB_0802795c
    cmp        r0,#0x7
    beq        LAB_0802795c
    cmp        r0,#0x9
    bne        LAB_08027984
    push       {r5}
    ldr        r1,DAT_080279b8
    ldr        r0,PTR_Scene_LockedPath_080279bc
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0802795c:
    push       {r5}
    ldr        r1,DAT_080279c0
    ldr        r0,PTR_Scene_LockedPath_080279c4
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0802796a:
    push       {r5}
    ldr        r1,DAT_080279c8
    ldr        r0,PTR_Scene_LockedPath_080279cc
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_08027978:
    push       {r5}
    ldr        r1,DAT_080279d0
    ldr        r0,PTR_Scene_LockedPath_080279d4
    bl         Scene_Prepare
    pop        {r5}
LAB_08027984:
    pop        {pc}

    .align 2, 0

PTR_PTR_MapSetup_School_1F_Hallway_F10_08027988:
    .word PTR_MapSetup_School_1F_Hallway_F10_080276a8
PTR_PTR_EventHandler_School_1F_Hallway_F10_0802798c:
    .word PTR_EventHandler_School_1F_Hallway_F10_080276d4
PTR_PTR_DAT_08027990:
    .word NPCList_8029848
PTR_PTR_EventHandler_School_1F_Hallway_F10_0_08027994:
    .word PTR_EventHandler_School_1F_Hallway_F10_0_0802773c
DAT_08027998:
    .word Scene_LockedPath
DAT_0802799c:
    .word 0x103
PTR_PTR_DAT_080279a0:
    .word NPCList_8029868
PTR_PTR_EventHandler_School_1F_Hallway_F14_0_080279a4:
    .word PTR_EventHandler_School_1F_Hallway_F14_0_080277fc
DAT_080279a8:
    .word Scene_ChangeMap
PTR_PTR_DAT_080279ac:
    .word NPCList_80298D8
PTR_PTR_EventHandler_School_1F_Hallway_F15_0_080279b0:
    .word PTR_EventHandler_School_1F_Hallway_F15_0_080278bc
PTR_Scene_Story_18_080279b4:
    .word Scene_Story_18
DAT_080279b8:
    .word 0x605
PTR_Scene_LockedPath_080279bc:
    .word Scene_LockedPath
DAT_080279c0:
    .word 0x903
PTR_Scene_LockedPath_080279c4:
    .word Scene_LockedPath
DAT_080279c8:
    .word 0x803
PTR_Scene_LockedPath_080279cc:
    .word Scene_LockedPath
DAT_080279d0:
    .word 0x703
PTR_Scene_LockedPath_080279d4:
    .word Scene_LockedPath


_ts MapSetup_School_1F_Hallway_S2
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_School_1F_Hallway_F20_08027c50
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r0,#0xab
    bl         Flag_GetBase
    beq        LAB_080279f6
    push       {r5}
    mov        r0,#0x4
    bl         Sound_ChangeSong
    pop        {r5}
    b          LAB_08027a0e
LAB_080279f6:
    mov        r0,#0xdf
    bl         Flag_GetBase
    beq        LAB_08027a0a
    push       {r5}
    mov        r0,#0x3
    bl         Sound_ChangeSong
    pop        {r5}
    b          LAB_08027a0e
LAB_08027a0a:
    bl         Sound_AreaSongChange
LAB_08027a0e:
    pop        {pc}
PTR_MapSetup_School_1F_Hallway_F20_08027a10:
    .word MapSetup_School_1F_Hallway_F20
    .word MapSetup_School_1F_Hallway_F20
    .word MapSetup_School_1F_Hallway_F20
    .word MapSetup_School_1F_Hallway_F23
    .word MapSetup_School_1F_Hallway_F24
    .word MapSetup_School_1F_Hallway_F25
    .word MapSetup_School_1F_Hallway_F25
    .word MapSetup_School_1F_Hallway_F25


_ts EventHandler_School_1F_Hallway_S2
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_1F_Hallway_F20_08027c54
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_1F_Hallway_F20_08027a3c:
    .word EventHandler_School_1F_Hallway_F20
    .word EventHandler_School_1F_Hallway_F20
    .word EventHandler_School_1F_Hallway_F20
    .word EventHandler_School_1F_Hallway_F23
    .word EventHandler_School_1F_Hallway_F24
    .word EventHandler_School_1F_Hallway_F25
    .word EventHandler_School_1F_Hallway_F25
    .word EventHandler_School_1F_Hallway_F25


_ts MapSetup_School_1F_Hallway_F20
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_PTR_DAT_08027c58
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_School_1F_Hallway_F20
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_1F_Hallway_F20_0_08027c5c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_1F_Hallway_F20_0_08027a8c:
    .word EventHandler_School_1F_Hallway_F20_0


_ts EventHandler_School_1F_Hallway_F20_0
    push       {lr}
    pop        {pc}


_ts MapSetup_School_1F_Hallway_F23
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_PTR_DAT_08027c60
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    bl         Flag_Set410
    mov        r0,#0x1
    bl         Flag_Set410
    mov        r0,#0x2
    bl         Flag_Set410
    mov        r0,#0x3
    bl         Flag_Set410
    mov        r0,#0x7
    bl         Flag_Set410
    mov        r0,#0x5
    bl         Flag_Set410
    mov        r0,#0x6
    bl         Flag_Set410
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_School_1F_Hallway_F23
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_1F_Hallway_F23_0_08027c64
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_School_1F_Hallway_F23_0_08027af0:
    .word EventHandler_School_1F_Hallway_F23_0


_ts EventHandler_School_1F_Hallway_F23_0
    push       {lr}
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x1
    beq        LAB_08027b2e
    cmp        r0,#0x2
    beq        LAB_08027b2e
    cmp        r0,#0x3
    beq        LAB_08027b2e
    cmp        r0,#0x4
    beq        LAB_08027b2e
    cmp        r0,#0x6
    beq        LAB_08027b3a
    cmp        r0,#0x7
    beq        LAB_08027b3a
    cmp        r0,#0x8
    bne        LAB_08027b4c
    push       {r5}
    mov        r1,#0x16
    lsl        r1,r1,#0x8
    mov        r0,#0x3
    orr        r1,r0
    b          LAB_08027b44
LAB_08027b2e:
    push       {r5}
    mov        r1,#0x15
    lsl        r1,r1,#0x8
    mov        r0,#0x3
    orr        r1,r0
    b          LAB_08027b44
LAB_08027b3a:
    push       {r5}
    mov        r1,#0x18
    lsl        r1,r1,#0x8
    mov        r0,#0x3
    orr        r1,r0
LAB_08027b44:
    ldr        r0,DAT_08027c68
    bl         Scene_Prepare
    pop        {r5}
LAB_08027b4c:
    pop        {pc}


_nt MapSetup_School_1F_Hallway_F24
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_PTR_DAT_08027c6c
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    bl         Flag_Set410
    mov        r0,#0x1
    bl         Flag_Set410
    mov        r0,#0x2
    bl         Flag_Set410
    mov        r0,#0x3
    bl         Flag_Set410
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_School_1F_Hallway_F24
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_1F_Hallway_F24_0_08027c70
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_School_1F_Hallway_F24_0_08027b98:
    .word EventHandler_School_1F_Hallway_F24_0


_ts EventHandler_School_1F_Hallway_F24_0
    push       {lr}
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x1
    beq        LAB_08027bbe
    cmp        r0,#0x2
    beq        LAB_08027bbe
    cmp        r0,#0x3
    beq        LAB_08027bbe
    cmp        r0,#0x4
    bne        LAB_08027bd0
LAB_08027bbe:
    push       {r5}
    mov        r1,#0x1f
    lsl        r1,r1,#0x8
    mov        r0,#0x3
    orr        r1,r0
    ldr        r0,DAT_08027c74
    bl         Scene_Prepare
    pop        {r5}
LAB_08027bd0:
    pop        {pc}


_nt MapSetup_School_1F_Hallway_F25
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    mov        r0,#0x0
    bl         Flag_Set410
    mov        r0,#0x1
    bl         Flag_Set410
    mov        r0,#0x2
    bl         Flag_Set410
    mov        r0,#0x3
    bl         Flag_Set410
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_School_1F_Hallway_F25
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_1F_Hallway_F25_0_08027c78
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_1F_Hallway_F25_0_08027c14:
    .word EventHandler_School_1F_Hallway_F25_0


_ts EventHandler_School_1F_Hallway_F25_0
    push       {lr}
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x1
    beq        LAB_08027c3a
    cmp        r0,#0x2
    beq        LAB_08027c3a
    cmp        r0,#0x3
    beq        LAB_08027c3a
    cmp        r0,#0x4
    bne        LAB_08027c4c
LAB_08027c3a:
    push       {r5}
    mov        r1,#0x1f
    lsl        r1,r1,#0x8
    mov        r0,#0x3
    orr        r1,r0
    ldr        r0,DAT_08027c7c
    bl         Scene_Prepare
    pop        {r5}
LAB_08027c4c:
    pop        {pc}

    .align 2, 0

PTR_PTR_MapSetup_School_1F_Hallway_F20_08027c50:
    .word PTR_MapSetup_School_1F_Hallway_F20_08027a10
PTR_PTR_EventHandler_School_1F_Hallway_F20_08027c54:
    .word PTR_EventHandler_School_1F_Hallway_F20_08027a3c
PTR_PTR_DAT_08027c58:
    .word NPCList_8029924
PTR_PTR_EventHandler_School_1F_Hallway_F20_0_08027c5c:
    .word PTR_EventHandler_School_1F_Hallway_F20_0_08027a8c
PTR_PTR_DAT_08027c60:
    .word NPCList_802996C
PTR_PTR_EventHandler_School_1F_Hallway_F23_0_08027c64:
    .word PTR_EventHandler_School_1F_Hallway_F23_0_08027af0
DAT_08027c68:
    .word Scene_LockedPath
PTR_PTR_DAT_08027c6c:
    .word NPCList_802998C
PTR_PTR_EventHandler_School_1F_Hallway_F24_0_08027c70:
    .word PTR_EventHandler_School_1F_Hallway_F24_0_08027b98
DAT_08027c74:
    .word Scene_LockedPath
PTR_PTR_EventHandler_School_1F_Hallway_F25_0_08027c78:
    .word PTR_EventHandler_School_1F_Hallway_F25_0_08027c14
DAT_08027c7c:
    .word Scene_LockedPath


_ts MapSetup_School_1F_Hallway_S3
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_School_1F_Hallway_F30_08027d10
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Sound_AreaSongChange
    pop        {pc}
PTR_MapSetup_School_1F_Hallway_F30_08027c90:
    .word MapSetup_School_1F_Hallway_F30
    .word MapSetup_School_1F_Hallway_F30
    .word MapSetup_School_1F_Hallway_F30
    .word MapSetup_School_1F_Hallway_F30
    .word MapSetup_School_1F_Hallway_F30
    .word MapSetup_School_1F_Hallway_F30
    .word MapSetup_School_1F_Hallway_F30
    .word MapSetup_School_1F_Hallway_F30


_ts EventHandler_School_1F_Hallway_S3
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_1F_Hallway_F30_08027d14
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_1F_Hallway_F30_08027cbc:
    .word EventHandler_School_1F_Hallway_F30
    .word EventHandler_School_1F_Hallway_F30
    .word EventHandler_School_1F_Hallway_F30
    .word EventHandler_School_1F_Hallway_F30
    .word EventHandler_School_1F_Hallway_F30
    .word EventHandler_School_1F_Hallway_F30
    .word EventHandler_School_1F_Hallway_F30
    .word EventHandler_School_1F_Hallway_F30


_ts MapSetup_School_1F_Hallway_F30
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


_nt EventHandler_School_1F_Hallway_F30
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_1F_Hallway_F30_0_08027d18
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_School_1F_Hallway_F30_0_08027d08:
    .word EventHandler_School_1F_Hallway_F30_0


_ts EventHandler_School_1F_Hallway_F30_0
    push       {lr}
    pop        {pc}
PTR_PTR_MapSetup_School_1F_Hallway_F30_08027d10:
    .word PTR_MapSetup_School_1F_Hallway_F30_08027c90
PTR_PTR_EventHandler_School_1F_Hallway_F30_08027d14:
    .word PTR_EventHandler_School_1F_Hallway_F30_08027cbc
PTR_PTR_EventHandler_School_1F_Hallway_F30_0_08027d18:
    .word PTR_EventHandler_School_1F_Hallway_F30_0_08027d08
