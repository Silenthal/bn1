#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_School_Staff_Lounge_Hallway_S1
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_Default_08028618
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    Flag_GetBase 0x9A
    pop        {r5}
    beq        LAB_08028516
    mov        r0,#T_Incident_Occurrence
    bl         Sound_PlayBGM
    pop        {pc}
LAB_08028516:
    bl         Sound_AreaSongChange
    pop        {pc}
PTR_MapSetup_Default_0802851c:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_School_Staff_Lounge_Hallway_F15
    .word MapSetup_Default
    .word MapSetup_Default


_ts EventHandler_School_Staff_Lounge_Hallway_S1
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Default_0802861c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_Default_08028548:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_School_Staff_Lounge_Hallway_F15
    .word EventHandler_Default
    .word EventHandler_Default


_ts MapSetup_School_Staff_Lounge_Hallway_F15
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    Flag_GetBase 0xBB
    bne        LAB_0802858a
    Flag_SetGate F_GATE_02
LAB_0802858a:
    Flag_GetBase 0xCA
    beq        LAB_08028596
    mov        r0,#0x4
    b          LAB_08028598
LAB_08028596:
    mov        r0,#0x0
LAB_08028598:
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_School_Staff_Lounge_Hallway_F15
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Staff_Lounge_Hallway_F15_0_08028620
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_Staff_Lounge_Hallway_F15_0_080285ac:
    .word EventHandler_School_Staff_Lounge_Hallway_F15_0
    .word EventHandler_School_Staff_Lounge_Hallway_F15_1


_ts EventHandler_School_Staff_Lounge_Hallway_F15_0
    push       {lr}
    Flag_GetBase 0xC0
    beq        LAB_080285d0
    push       {r5}
    mov        r1,#0xa
    ldr        r0,PTR_Scene_ChangeMap_08028624
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x4
    str        r0,[r5,#0x0]
    pop        {pc}
LAB_080285d0:
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#World_playerLocation]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x3
    bne        LAB_080285f0
    push       {r5}
    mov        r1,#0x3
    ldr        r0,PTR_Scene_LockedPath_08028628
    bl         Scene_Prepare
    pop        {r5}
LAB_080285f0:
    pop        {pc}


_nt EventHandler_School_Staff_Lounge_Hallway_F15_1
    push       {lr}
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#World_playerLocation]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x3
    bne        LAB_08028614
    push       {r5}
    mov        r1,#0x3
    ldr        r0,PTR_Scene_LockedPath_0802862c
    bl         Scene_Prepare
    pop        {r5}
LAB_08028614:
    pop        {pc}

    .align 2, 0

PTR_PTR_MapSetup_Default_08028618:
    .word PTR_MapSetup_Default_0802851c
PTR_PTR_EventHandler_Default_0802861c:
    .word PTR_EventHandler_Default_08028548
PTR_PTR_EventHandler_School_Staff_Lounge_Hallway_F15_0_08028620:
    .word PTR_EventHandler_School_Staff_Lounge_Hallway_F15_0_080285ac
PTR_Scene_ChangeMap_08028624:
    .word Scene_ChangeMap
PTR_Scene_LockedPath_08028628:
    .word Scene_LockedPath
PTR_Scene_LockedPath_0802862c:
    .word Scene_LockedPath


_ts MapSetup_School_Staff_Lounge_Hallway_S2
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_School_Staff_Lounge_Hallway_F20_080287d4
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    Flag_GetBase 0xAB
    beq        LAB_0802864e
    push       {r5}
    mov        r0,#T_Incident_Occurrence
    bl         Sound_PlayBGM
    pop        {r5}
    b          LAB_08028666
LAB_0802864e:
    Flag_GetBase 0xDF
    beq        LAB_08028662
    push       {r5}
    mov        r0,#T_Suspicious_Mood
    bl         Sound_PlayBGM
    pop        {r5}
    b          LAB_08028666
LAB_08028662:
    bl         Sound_AreaSongChange
LAB_08028666:
    pop        {pc}
PTR_MapSetup_School_Staff_Lounge_Hallway_F20_08028668:
    .word MapSetup_School_Staff_Lounge_Hallway_F20
    .word MapSetup_School_Staff_Lounge_Hallway_F20
    .word MapSetup_School_Staff_Lounge_Hallway_F20
    .word MapSetup_School_Staff_Lounge_Hallway_F24
    .word MapSetup_School_Staff_Lounge_Hallway_F25
    .word MapSetup_School_Staff_Lounge_Hallway_F25
    .word MapSetup_School_Staff_Lounge_Hallway_F25
    .word MapSetup_School_Staff_Lounge_Hallway_F25


_ts EventHandler_School_Staff_Lounge_Hallway_S2
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Staff_Lounge_Hallway_F20_080287d8
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_Staff_Lounge_Hallway_F20_08028694:
    .word EventHandler_School_Staff_Lounge_Hallway_F20
    .word EventHandler_School_Staff_Lounge_Hallway_F20
    .word EventHandler_School_Staff_Lounge_Hallway_F20
    .word EventHandler_School_Staff_Lounge_Hallway_F23
    .word EventHandler_School_Staff_Lounge_Hallway_F24
    .word EventHandler_School_Staff_Lounge_Hallway_F24
    .word EventHandler_School_Staff_Lounge_Hallway_F24
    .word EventHandler_School_Staff_Lounge_Hallway_F24


_ts MapSetup_School_Staff_Lounge_Hallway_F20
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_DAT_080287dc
    bl         Map_LoadNPCList
    pop        {r5}
    Flag_SetGate F_GATE_02
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_School_Staff_Lounge_Hallway_F20
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Staff_Lounge_Hallway_F20_0_080287e0
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_School_Staff_Lounge_Hallway_F20_0_080286f0:
    .word EventHandler_School_Staff_Lounge_Hallway_F20_0


_ts EventHandler_School_Staff_Lounge_Hallway_F20_0
    push       {lr}
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#World_playerLocation]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x3
    bne        LAB_08028716
    push       {r5}
    ldr        r1,DAT_080287e4
    ldr        r0,PTR_Scene_LockedPath_080287e8
    bl         Scene_Prepare
    pop        {r5}
LAB_08028716:
    pop        {pc}


_ts MapSetup_School_Staff_Lounge_Hallway_F24
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_DAT_080287ec
    bl         Map_LoadNPCList
    pop        {r5}
    Flag_SetGate F_GATE_02
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_School_Staff_Lounge_Hallway_F23
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Staff_Lounge_Hallway_F23_0_080287f0
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_School_Staff_Lounge_Hallway_F23_0_08028754:
    .word EventHandler_School_Staff_Lounge_Hallway_F23_0


_ts EventHandler_School_Staff_Lounge_Hallway_F23_0
    push       {lr}
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#World_playerLocation]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x3
    bne        LAB_0802877a
    push       {r5}
    ldr        r1,DAT_080287e4
    ldr        r0,PTR_Scene_LockedPath_080287f4
    bl         Scene_Prepare
    pop        {r5}
LAB_0802877a:
    pop        {pc}


_ts MapSetup_School_Staff_Lounge_Hallway_F25
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    Flag_SetGate F_GATE_02
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_School_Staff_Lounge_Hallway_F24
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Staff_Lounge_Hallway_F24_0_080287f8
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_Staff_Lounge_Hallway_F24_0_080287ac:
    .word EventHandler_School_Staff_Lounge_Hallway_F24_0


_ts EventHandler_School_Staff_Lounge_Hallway_F24_0
    push       {lr}
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#World_playerLocation]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x3
    bne        LAB_080287d2
    push       {r5}
    ldr        r1,DAT_080287e4
    ldr        r0,PTR_Scene_LockedPath_080287fc
    bl         Scene_Prepare
    pop        {r5}
LAB_080287d2:
    pop        {pc}
PTR_PTR_MapSetup_School_Staff_Lounge_Hallway_F20_080287d4:
    .word PTR_MapSetup_School_Staff_Lounge_Hallway_F20_08028668
PTR_PTR_EventHandler_School_Staff_Lounge_Hallway_F20_080287d8:
    .word PTR_EventHandler_School_Staff_Lounge_Hallway_F20_08028694
PTR_DAT_080287dc:
    .word NPCList_8029AC8
PTR_PTR_EventHandler_School_Staff_Lounge_Hallway_F20_0_080287e0:
    .word PTR_EventHandler_School_Staff_Lounge_Hallway_F20_0_080286f0
DAT_080287e4:
    .word 0xE03
PTR_Scene_LockedPath_080287e8:
    .word Scene_LockedPath
PTR_DAT_080287ec:
    .word NPCList_8029AF8
PTR_PTR_EventHandler_School_Staff_Lounge_Hallway_F23_0_080287f0:
    .word PTR_EventHandler_School_Staff_Lounge_Hallway_F23_0_08028754
PTR_Scene_LockedPath_080287f4:
    .word Scene_LockedPath
PTR_PTR_EventHandler_School_Staff_Lounge_Hallway_F24_0_080287f8:
    .word PTR_EventHandler_School_Staff_Lounge_Hallway_F24_0_080287ac
PTR_Scene_LockedPath_080287fc:
    .word Scene_LockedPath


_ts MapSetup_School_Staff_Lounge_Hallway_S5
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_School_Staff_Lounge_Hallway_F50_08028890
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Sound_AreaSongChange
    pop        {pc}
PTR_MapSetup_School_Staff_Lounge_Hallway_F50_08028810:
    .word MapSetup_School_Staff_Lounge_Hallway_F50
    .word MapSetup_School_Staff_Lounge_Hallway_F50
    .word MapSetup_School_Staff_Lounge_Hallway_F50
    .word MapSetup_School_Staff_Lounge_Hallway_F50
    .word MapSetup_School_Staff_Lounge_Hallway_F50
    .word MapSetup_School_Staff_Lounge_Hallway_F50
    .word MapSetup_School_Staff_Lounge_Hallway_F50
    .word MapSetup_School_Staff_Lounge_Hallway_F50


_ts EventHandler_School_Staff_Lounge_Hallway_S5
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Staff_Lounge_Hallway_F50_08028894
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_Staff_Lounge_Hallway_F50_0802883c:
    .word EventHandler_School_Staff_Lounge_Hallway_F50
    .word EventHandler_School_Staff_Lounge_Hallway_F50
    .word EventHandler_School_Staff_Lounge_Hallway_F50
    .word EventHandler_School_Staff_Lounge_Hallway_F50
    .word EventHandler_School_Staff_Lounge_Hallway_F50
    .word EventHandler_School_Staff_Lounge_Hallway_F50
    .word EventHandler_School_Staff_Lounge_Hallway_F50
    .word EventHandler_School_Staff_Lounge_Hallway_F50


_ts MapSetup_School_Staff_Lounge_Hallway_F50
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


_nt EventHandler_School_Staff_Lounge_Hallway_F50
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Staff_Lounge_Hallway_F50_0_08028898
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_School_Staff_Lounge_Hallway_F50_0_08028888:
    .word EventHandler_School_Staff_Lounge_Hallway_F50_0


_ts EventHandler_School_Staff_Lounge_Hallway_F50_0
    push       {lr}
    pop        {pc}
PTR_PTR_MapSetup_School_Staff_Lounge_Hallway_F50_08028890:
    .word PTR_MapSetup_School_Staff_Lounge_Hallway_F50_08028810
PTR_PTR_EventHandler_School_Staff_Lounge_Hallway_F50_08028894:
    .word PTR_EventHandler_School_Staff_Lounge_Hallway_F50_0802883c
PTR_PTR_EventHandler_School_Staff_Lounge_Hallway_F50_0_08028898:
    .word PTR_EventHandler_School_Staff_Lounge_Hallway_F50_0_08028888


_ts MapSetup_School_Staff_Lounge_Hallway_S3
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_School_Staff_Lounge_Hallway_F30_08028950
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Sound_AreaSongChange
    pop        {pc}
PTR_MapSetup_School_Staff_Lounge_Hallway_F30_080288ac:
    .word MapSetup_School_Staff_Lounge_Hallway_F30
    .word MapSetup_School_Staff_Lounge_Hallway_F30
    .word MapSetup_School_Staff_Lounge_Hallway_F30
    .word MapSetup_School_Staff_Lounge_Hallway_F30
    .word MapSetup_School_Staff_Lounge_Hallway_F30
    .word MapSetup_School_Staff_Lounge_Hallway_F30
    .word MapSetup_School_Staff_Lounge_Hallway_F30
    .word MapSetup_School_Staff_Lounge_Hallway_F30


_ts EventHandler_School_Staff_Lounge_Hallway_S3
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Staff_Lounge_Hallway_F30_08028954
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_Staff_Lounge_Hallway_F30_080288d8:
    .word EventHandler_School_Staff_Lounge_Hallway_F30
    .word EventHandler_School_Staff_Lounge_Hallway_F30
    .word EventHandler_School_Staff_Lounge_Hallway_F30
    .word EventHandler_School_Staff_Lounge_Hallway_F30
    .word EventHandler_School_Staff_Lounge_Hallway_F30
    .word EventHandler_School_Staff_Lounge_Hallway_F30
    .word EventHandler_School_Staff_Lounge_Hallway_F30
    .word EventHandler_School_Staff_Lounge_Hallway_F30


_ts MapSetup_School_Staff_Lounge_Hallway_F30
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    Flag_SetGate F_GATE_02
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_School_Staff_Lounge_Hallway_F30
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Staff_Lounge_Hallway_F30_0_08028958
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_Staff_Lounge_Hallway_F30_0_08028928:
    .word EventHandler_School_Staff_Lounge_Hallway_F30_0


_ts EventHandler_School_Staff_Lounge_Hallway_F30_0
    push       {lr}
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#World_playerLocation]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x3
    bne        LAB_0802894e
    push       {r5}
    ldr        r1,DAT_0802895c
    ldr        r0,DAT_08028960
    bl         Scene_Prepare
    pop        {r5}
LAB_0802894e:
    pop        {pc}
PTR_PTR_MapSetup_School_Staff_Lounge_Hallway_F30_08028950:
    .word PTR_MapSetup_School_Staff_Lounge_Hallway_F30_080288ac
PTR_PTR_EventHandler_School_Staff_Lounge_Hallway_F30_08028954:
    .word PTR_EventHandler_School_Staff_Lounge_Hallway_F30_080288d8
PTR_PTR_EventHandler_School_Staff_Lounge_Hallway_F30_0_08028958:
    .word PTR_EventHandler_School_Staff_Lounge_Hallway_F30_0_08028928
DAT_0802895c:
    .word 0xE03
DAT_08028960:
    .word Scene_LockedPath
