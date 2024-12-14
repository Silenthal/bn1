#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_School_2F_Hallway_S1
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_School_2F_Hallway_F10_080262ac
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    mov        r0,#0x9a
    bl         Flag_GetBase
    pop        {r5}
    beq        LAB_08026062
    mov        r0,#0x4
    bl         Sound_ChangeSong
    pop        {pc}
LAB_08026062:
    bl         Sound_AreaSongChange
    pop        {pc}
PTR_MapSetup_School_2F_Hallway_F10_08026068:
    .word MapSetup_School_2F_Hallway_F10
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_School_2F_Hallway_F13
    .word MapSetup_School_2F_Hallway_F14
    .word MapSetup_School_2F_Hallway_F15
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default


_ts EventHandler_School_2F_Hallway_S1
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_2F_Hallway_F10_080262b0
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_2F_Hallway_F10_0802609c:
    .word EventHandler_School_2F_Hallway_F10
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_School_2F_Hallway_F13
    .word EventHandler_School_2F_Hallway_F14
    .word EventHandler_School_2F_Hallway_F15
    .word EventHandler_Default


_ts MapSetup_School_2F_Hallway_F10
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    mov        r0,#0x92
    bl         Flag_GetBase
    pop        {r5}
    bne        LAB_080260ea
    mov        r0,#0x1
    bl         Flag_Set410
    mov        r0,#0x2
    bl         Flag_Set410
    mov        r0,#0x3
    bl         Flag_Set410
LAB_080260ea:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_School_2F_Hallway_F10
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_2F_Hallway_F10_0_080262b4
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_2F_Hallway_F10_0_08026100:
    .word EventHandler_School_2F_Hallway_F10_0


_ts EventHandler_School_2F_Hallway_F10_0
    push       {lr}
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x2
    beq        LAB_08026130
    cmp        r0,#0x3
    beq        LAB_08026122
    cmp        r0,#0x4
    bne        LAB_0802613c
LAB_08026122:
    push       {r5}
    mov        r1,#0x3
    ldr        r0,DAT_080262b8
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_0802613c
LAB_08026130:
    push       {r5}
    ldr        r1,DAT_080262bc
    ldr        r0,DAT_080262c0
    bl         Scene_Prepare
    pop        {r5}
LAB_0802613c:
    pop        {pc}


_nt MapSetup_School_2F_Hallway_F13
    push       {lr}
    mov        r0,#0x4
    str        r0,[r5,#0x0]
    push       {r5}
    mov        r0,#0xa7
    bl         Flag_GetBase
    pop        {r5}
    bne        LAB_08026154
    mov        r0,#0x0
    str        r0,[r5,#0x0]
LAB_08026154:
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_PTR_DAT_080262c4
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    mov        r0,#0x4
    bl         Flag_Set410
    pop        {r5}
    pop        {pc}


_ts EventHandler_School_2F_Hallway_F13
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_2F_Hallway_F13_0_080262c8
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_2F_Hallway_F13_0_0802618c:
    .word EventHandler_School_2F_Hallway_F13_0
    .word EventHandler_School_2F_Hallway_F13_1


_ts EventHandler_School_2F_Hallway_F13_0
    push       {lr}
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x5
    bne        LAB_080261bc
    bl         dummy_187a0
    bne        LAB_080261bc
    push       {r5}
    ldr        r1,DAT_080262cc
    ldr        r0,DAT_080262d0
    bl         Scene_Prepare
    pop        {r5}
LAB_080261bc:
    push       {r5}
    mov        r0,#0xa7
    bl         Flag_GetBase
    pop        {r5}
    beq        LAB_080261da
    push       {r5}
    mov        r1,#0x3
    ldr        r0,DAT_080262d4
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}
LAB_080261da:
    pop        {pc}


_ts EventHandler_School_2F_Hallway_F13_1
    push       {lr}
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x5
    bne        LAB_080261fe
    push       {r5}
    ldr        r1,DAT_080262cc
    ldr        r0,PTR_Scene_LockedPath_080262d8
    bl         Scene_Prepare
    pop        {r5}
LAB_080261fe:
    pop        {pc}


_ts MapSetup_School_2F_Hallway_F14
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_PTR_DAT_080262dc
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    mov        r0,#0xad
    bl         Flag_GetBase
    pop        {r5}
    bne        LAB_0802622e
    mov        r0,#0x0
    b          LAB_08026230
LAB_0802622e:
    mov        r0,#0x4
LAB_08026230:
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_School_2F_Hallway_F14
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_2F_Hallway_F14_0_080262e0
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_2F_Hallway_F14_0_08026244:
    .word EventHandler_School_2F_Hallway_F14_0
    .word EventHandler_School_2F_Hallway_F14_1


_ts EventHandler_School_2F_Hallway_F14_0
    push       {lr}
    push       {r5}
    mov        r0,#0xad
    bl         Flag_GetBase
    pop        {r5}
    beq        LAB_0802626a
    push       {r5}
    mov        r1,#0x7
    ldr        r0,DAT_080262e4
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0802626a:
    pop        {pc}


_ts EventHandler_School_2F_Hallway_F14_1
    push       {lr}
    pop        {pc}


_ts MapSetup_School_2F_Hallway_F15
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_PTR_DAT_080262e8
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_School_2F_Hallway_F15
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_2F_Hallway_F15_0_080262ec
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_2F_Hallway_F15_0_080262a4:
    .word EventHandler_School_2F_Hallway_F15_0


_ts EventHandler_School_2F_Hallway_F15_0
    push       {lr}
    pop        {pc}
PTR_PTR_MapSetup_School_2F_Hallway_F10_080262ac:
    .word PTR_MapSetup_School_2F_Hallway_F10_08026068
PTR_PTR_EventHandler_School_2F_Hallway_F10_080262b0:
    .word PTR_EventHandler_School_2F_Hallway_F10_0802609c
PTR_PTR_EventHandler_School_2F_Hallway_F10_0_080262b4:
    .word PTR_EventHandler_School_2F_Hallway_F10_0_08026100
DAT_080262b8:
    .word Scene_LockedPath
DAT_080262bc:
    .word 0x103
DAT_080262c0:
    .word Scene_LockedPath
PTR_PTR_DAT_080262c4:
    .word NPCList_80294EC
PTR_PTR_EventHandler_School_2F_Hallway_F13_0_080262c8:
    .word PTR_EventHandler_School_2F_Hallway_F13_0_0802618c
DAT_080262cc:
    .word 0x703
DAT_080262d0:
    .word Scene_LockedPath
DAT_080262d4:
    .word Scene_ChangeMap
PTR_Scene_LockedPath_080262d8:
    .word Scene_LockedPath
PTR_PTR_DAT_080262dc:
    .word NPCList_80294F4
PTR_PTR_EventHandler_School_2F_Hallway_F14_0_080262e0:
    .word PTR_EventHandler_School_2F_Hallway_F14_0_08026244
DAT_080262e4:
    .word Scene_ChangeMap
PTR_PTR_DAT_080262e8:
    .word NPCList_8029500
PTR_PTR_EventHandler_School_2F_Hallway_F15_0_080262ec:
    .word PTR_EventHandler_School_2F_Hallway_F15_0_080262a4


_ts MapSetup_School_2F_Hallway_S2
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_School_2F_Hallway_F20_0802657c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r0,#0xab
    bl         Flag_GetBase
    beq        LAB_0802630e
    push       {r5}
    mov        r0,#0x4
    bl         Sound_ChangeSong
    pop        {r5}
    b          LAB_08026326
LAB_0802630e:
    mov        r0,#0xdf
    bl         Flag_GetBase
    beq        LAB_08026322
    push       {r5}
    mov        r0,#0x3
    bl         Sound_ChangeSong
    pop        {r5}
    b          LAB_08026326
LAB_08026322:
    bl         Sound_AreaSongChange
LAB_08026326:
    pop        {pc}
PTR_MapSetup_School_2F_Hallway_F20_08026328:
    .word MapSetup_School_2F_Hallway_F20
    .word MapSetup_School_2F_Hallway_F21
    .word MapSetup_School_2F_Hallway_F22
    .word MapSetup_School_2F_Hallway_F23
    .word MapSetup_School_2F_Hallway_F24
    .word MapSetup_School_2F_Hallway_F25
    .word MapSetup_School_2F_Hallway_F25
    .word MapSetup_School_2F_Hallway_F25
    .word MapSetup_Default
    .word MapSetup_Default


_ts EventHandler_School_2F_Hallway_S2
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_2F_Hallway_F20_08026580
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_2F_Hallway_F20_0802635c:
    .word EventHandler_School_2F_Hallway_F20
    .word EventHandler_School_2F_Hallway_F21
    .word EventHandler_School_2F_Hallway_F22
    .word EventHandler_School_2F_Hallway_F23
    .word EventHandler_School_2F_Hallway_F24
    .word EventHandler_School_2F_Hallway_F25
    .word EventHandler_School_2F_Hallway_F25
    .word EventHandler_School_2F_Hallway_F25


_ts MapSetup_School_2F_Hallway_F20
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_PTR_DAT_08026584
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_School_2F_Hallway_F20
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_2F_Hallway_F20_0_08026588
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_2F_Hallway_F20_0_080263b0:
    .word EventHandler_School_2F_Hallway_F20_0


_ts EventHandler_School_2F_Hallway_F20_0
    push       {lr}
    pop        {pc}


_ts MapSetup_School_2F_Hallway_F21
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_PTR_DAT_0802658c
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_School_2F_Hallway_F21
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_2F_Hallway_F21_0_08026590
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_2F_Hallway_F21_0_080263ec:
    .word EventHandler_School_2F_Hallway_F21_0


_ts EventHandler_School_2F_Hallway_F21_0
    push       {lr}
    pop        {pc}


_ts MapSetup_School_2F_Hallway_F22
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_PTR_DAT_08026594
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_School_2F_Hallway_F22
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_2F_Hallway_F22_0_08026598
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_2F_Hallway_F22_0_08026428:
    .word EventHandler_School_2F_Hallway_F22_0


_ts EventHandler_School_2F_Hallway_F22_0
    push       {lr}
    pop        {pc}


_ts MapSetup_School_2F_Hallway_F23
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_PTR_DAT_0802659c
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x2
    bl         Flag_Set410
    mov        r0,#0x3
    bl         Flag_Set410
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_School_2F_Hallway_F23
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_2F_Hallway_F23_0_080265a0
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_2F_Hallway_F23_0_08026470:
    .word EventHandler_School_2F_Hallway_F23_0


_ts EventHandler_School_2F_Hallway_F23_0
    push       {lr}
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x6
    beq        LAB_0802649e
    cmp        r0,#0x3
    beq        LAB_08026492
    cmp        r0,#0x4
    bne        LAB_080264b0
LAB_08026492:
    push       {r5}
    mov        r1,#0x20
    lsl        r1,r1,#0x8
    mov        r0,#0x3
    orr        r1,r0
    b          LAB_080264a8
LAB_0802649e:
    push       {r5}
    mov        r1,#0x2a
    lsl        r1,r1,#0x8
    mov        r0,#0x3
    orr        r1,r0
LAB_080264a8:
    ldr        r0,DAT_080265a4
    bl         Scene_Prepare
    pop        {r5}
LAB_080264b0:
    pop        {pc}


_nt MapSetup_School_2F_Hallway_F24
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_PTR_DAT_080265a8
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x5
    bl         Flag_Set410
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_School_2F_Hallway_F24
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_2F_Hallway_F24_0_080265ac
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_2F_Hallway_F24_0_080264ec:
    .word EventHandler_School_2F_Hallway_F24_0


_ts EventHandler_School_2F_Hallway_F24_0
    push       {lr}
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x6
    bne        LAB_08026518
    push       {r5}
    mov        r1,#0x2a
    lsl        r1,r1,#0x8
    mov        r0,#0x3
    orr        r1,r0
    ldr        r0,DAT_080265b0
    bl         Scene_Prepare
    pop        {r5}
LAB_08026518:
    pop        {pc}


_nt MapSetup_School_2F_Hallway_F25
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    mov        r0,#0x5
    bl         Flag_Set410
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_School_2F_Hallway_F25
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_2F_Hallway_F25_0_080265b4
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_School_2F_Hallway_F25_0_0802654c:
    .word EventHandler_School_2F_Hallway_F25_0


_ts EventHandler_School_2F_Hallway_F25_0
    push       {lr}
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x6
    bne        LAB_08026578
    push       {r5}
    mov        r1,#0x2a
    lsl        r1,r1,#0x8
    mov        r0,#0x3
    orr        r1,r0
    ldr        r0,DAT_080265b8
    bl         Scene_Prepare
    pop        {r5}
LAB_08026578:
    pop        {pc}

    .align 2, 0

PTR_PTR_MapSetup_School_2F_Hallway_F20_0802657c:
    .word PTR_MapSetup_School_2F_Hallway_F20_08026328
PTR_PTR_EventHandler_School_2F_Hallway_F20_08026580:
    .word PTR_EventHandler_School_2F_Hallway_F20_0802635c
PTR_PTR_DAT_08026584:
    .word NPCList_8029598
PTR_PTR_EventHandler_School_2F_Hallway_F20_0_08026588:
    .word PTR_EventHandler_School_2F_Hallway_F20_0_080263b0
PTR_PTR_DAT_0802658c:
    .word NPCList_8029598
PTR_PTR_EventHandler_School_2F_Hallway_F21_0_08026590:
    .word PTR_EventHandler_School_2F_Hallway_F21_0_080263ec
PTR_PTR_DAT_08026594:
    .word NPCList_8029598
PTR_PTR_EventHandler_School_2F_Hallway_F22_0_08026598:
    .word PTR_EventHandler_School_2F_Hallway_F22_0_08026428
PTR_PTR_DAT_0802659c:
    .word NPCList_80295E0
PTR_PTR_EventHandler_School_2F_Hallway_F23_0_080265a0:
    .word PTR_EventHandler_School_2F_Hallway_F23_0_08026470
DAT_080265a4:
    .word Scene_LockedPath
PTR_PTR_DAT_080265a8:
    .word NPCList_8029598
PTR_PTR_EventHandler_School_2F_Hallway_F24_0_080265ac:
    .word PTR_EventHandler_School_2F_Hallway_F24_0_080264ec
DAT_080265b0:
    .word Scene_LockedPath
PTR_PTR_EventHandler_School_2F_Hallway_F25_0_080265b4:
    .word PTR_EventHandler_School_2F_Hallway_F25_0_0802654c
DAT_080265b8:
    .word Scene_LockedPath


_ts MapSetup_School_2F_Hallway_S3
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_School_2F_Hallway_F30_0802664c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Sound_AreaSongChange
    pop        {pc}
PTR_MapSetup_School_2F_Hallway_F30_080265cc:
    .word MapSetup_School_2F_Hallway_F30
    .word MapSetup_School_2F_Hallway_F30
    .word MapSetup_School_2F_Hallway_F30
    .word MapSetup_School_2F_Hallway_F30
    .word MapSetup_School_2F_Hallway_F30
    .word MapSetup_School_2F_Hallway_F30
    .word MapSetup_School_2F_Hallway_F30
    .word MapSetup_School_2F_Hallway_F30


_ts EventHandler_School_2F_Hallway_S3
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_2F_Hallway_F30_08026650
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_2F_Hallway_F30_080265f8:
    .word EventHandler_School_2F_Hallway_F30
    .word EventHandler_School_2F_Hallway_F30
    .word EventHandler_School_2F_Hallway_F30
    .word EventHandler_School_2F_Hallway_F30
    .word EventHandler_School_2F_Hallway_F30
    .word EventHandler_School_2F_Hallway_F30
    .word EventHandler_School_2F_Hallway_F30
    .word EventHandler_School_2F_Hallway_F30


_ts MapSetup_School_2F_Hallway_F30
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


_nt EventHandler_School_2F_Hallway_F30
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_2F_Hallway_F30_0_08026654
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_School_2F_Hallway_F30_0_08026644:
    .word EventHandler_School_2F_Hallway_F30_0


_ts EventHandler_School_2F_Hallway_F30_0
    push       {lr}
    pop        {pc}
PTR_PTR_MapSetup_School_2F_Hallway_F30_0802664c:
    .word PTR_MapSetup_School_2F_Hallway_F30_080265cc
PTR_PTR_EventHandler_School_2F_Hallway_F30_08026650:
    .word PTR_EventHandler_School_2F_Hallway_F30_080265f8
PTR_PTR_EventHandler_School_2F_Hallway_F30_0_08026654:
    .word PTR_EventHandler_School_2F_Hallway_F30_0_08026644
