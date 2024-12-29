#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_SciLab_Power_Plant_Hallway_S4
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_Default_0803c6fc
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r0,#0xc5
    bl         Flag_GetBase
    bne        LAB_0803c554
    push       {r5}
    ldr        r0,PTR_BgTask_803BA8C_0803c700
    bl         BgTask_AddNew
    pop        {r5}
LAB_0803c554:
    mov        r0,#0xc5
    bl         Flag_GetBase
    bne        LAB_0803c564
    mov        r0,#0x3
    bl         Sound_ChangeSong
    b          LAB_0803c568
LAB_0803c564:
    bl         Sound_AreaSongChange
LAB_0803c568:
    pop        {pc}

    .align 2, 0

PTR_MapSetup_Default_0803c56c:
    .word MapSetup_Default
    .word MapSetup_SciLab_Power_Plant_Hallway_F41
    .word MapSetup_SciLab_Power_Plant_Hallway_F42
    .word MapSetup_SciLab_Power_Plant_Hallway_F42
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default


_ts EventHandler_SciLab_Power_Plant_Hallway_S4
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Default_0803c704
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         EventHandler_SciLab_Power_Plant_Hallway_S4_HandleExits
    pop        {pc}

PTR_EventHandler_Default_0803c59c:
    .word EventHandler_Default
    .word EventHandler_SciLab_Power_Plant_Hallway_F41
    .word EventHandler_SciLab_Power_Plant_Hallway_F42
    .word EventHandler_SciLab_Power_Plant_Hallway_F43
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default


_ts MapSetup_SciLab_Power_Plant_Hallway_F41
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_803D44C_0803c708
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    bl         Flag_SetGate
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_SciLab_Power_Plant_Hallway_F41
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_SciLab_Power_Plant_Hallway_F41_0_0803c70c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_SciLab_Power_Plant_Hallway_F41_0_0803c5f8:
    .word EventHandler_SciLab_Power_Plant_Hallway_F41_0


_ts EventHandler_SciLab_Power_Plant_Hallway_F41_0
    push       {lr}
    pop        {pc}


_ts MapSetup_SciLab_Power_Plant_Hallway_F42
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_803D46C_0803c710
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    bl         Flag_SetGate
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_SciLab_Power_Plant_Hallway_F42
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_SciLab_Power_Plant_Hallway_F42_0_0803c714
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_SciLab_Power_Plant_Hallway_F42_0_0803c63c:
    .word EventHandler_SciLab_Power_Plant_Hallway_F42_0


_ts EventHandler_SciLab_Power_Plant_Hallway_F42_0
    push       {lr}
    pop        {pc}


_ts FUN_0803c644
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_803D46C_0803c718
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_SciLab_Power_Plant_Hallway_F43
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_SciLab_Power_Plant_Hallway_F43_0_0803c71c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_SciLab_Power_Plant_Hallway_F43_0_0803c678:
    .word EventHandler_SciLab_Power_Plant_Hallway_F43_0


_ts EventHandler_SciLab_Power_Plant_Hallway_F43_0
    push       {lr}
    pop        {pc}


_ts EventHandler_SciLab_Power_Plant_Hallway_S4_HandleExits
    push       {lr}
    bl         Scene_IsSceneActive
    tst        r0,r0
    bne        LAB_0803c6f8
    LoadMain world, r0, r7
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x20
    bne        LAB_0803c6ba
    LoadMain world, r0, r0
    ldrb       r1,[r0,#0x6]
    cmp        r1,#0x43
    bhi        LAB_0803c6ac
    push       {r5}
    ldr        r0,PTR_Scene_Dialogue_0803c720
    mov        r1,#0xe0
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_0803c6f8
LAB_0803c6ac:
    push       {r5}
    ldr        r0,PTR_Scene_GovtElevator_0803c724
    mov        r1,#0xe1
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0803c6ba:
    cmp        r0,#0xf0
    bne        LAB_0803c6d6
    LoadMain world, r0, r0
    ldrb       r1,[r0,#0x6]
    cmp        r1,#0x41
    bne        LAB_0803c6d6
    push       {r5}
    ldr        r0,PTR_Scene_Dialogue_0803c728
    mov        r1,#0xdc
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0803c6d6:
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x1
    bne        LAB_0803c6f8
    push       {r5}
    ldr        r0,PTR_Scene_LockedPath_0803c72c
    ldr        r1,DAT_0803c730
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0803c6f8:
    pop        {pc}

    .align 2, 0

PTR_PTR_MapSetup_Default_0803c6fc:
    .word PTR_MapSetup_Default_0803c56c

PTR_BgTask_803BA8C_0803c700:
    .word BgTask_803BA8C

PTR_PTR_EventHandler_Default_0803c704:
    .word PTR_EventHandler_Default_0803c59c

PTR_NPCList_803D44C_0803c708:
    .word NPCList_803D44C

PTR_PTR_EventHandler_SciLab_Power_Plant_Hallway_F41_0_0803c70c:
    .word PTR_EventHandler_SciLab_Power_Plant_Hallway_F41_0_0803c5f8

PTR_NPCList_803D46C_0803c710:
    .word NPCList_803D46C

PTR_PTR_EventHandler_SciLab_Power_Plant_Hallway_F42_0_0803c714:
    .word PTR_EventHandler_SciLab_Power_Plant_Hallway_F42_0_0803c63c

PTR_NPCList_803D46C_0803c718:
    .word NPCList_803D46C

PTR_PTR_EventHandler_SciLab_Power_Plant_Hallway_F43_0_0803c71c:
    .word PTR_EventHandler_SciLab_Power_Plant_Hallway_F43_0_0803c678

PTR_Scene_Dialogue_0803c720:
    .word Scene_Dialogue

PTR_Scene_GovtElevator_0803c724:
    .word Scene_GovtElevator

PTR_Scene_Dialogue_0803c728:
    .word Scene_Dialogue

PTR_Scene_LockedPath_0803c72c:
    .word Scene_LockedPath

DAT_0803c730:
    .word 0xDF03


_ts MapSetup_SciLab_Power_Plant_Hallway_S5
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_SciLab_Power_Plant_Hallway_F50_0803c810
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Sound_AreaSongChange
    pop        {pc}

PTR_MapSetup_SciLab_Power_Plant_Hallway_F50_0803c744:
    .word MapSetup_SciLab_Power_Plant_Hallway_F50
    .word MapSetup_SciLab_Power_Plant_Hallway_F50
    .word MapSetup_SciLab_Power_Plant_Hallway_F50
    .word MapSetup_SciLab_Power_Plant_Hallway_F50
    .word MapSetup_SciLab_Power_Plant_Hallway_F50
    .word MapSetup_SciLab_Power_Plant_Hallway_F50
    .word MapSetup_SciLab_Power_Plant_Hallway_F50
    .word MapSetup_SciLab_Power_Plant_Hallway_F50


_ts EventHandler_SciLab_Power_Plant_Hallway_S5
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_SciLab_Power_Plant_Hallway_F50_0803c814
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         EventHandler_SciLab_Power_Plant_Hallway_S5_HandleExits
    pop        {pc}

PTR_EventHandler_SciLab_Power_Plant_Hallway_F50_0803c774:
    .word EventHandler_SciLab_Power_Plant_Hallway_F50
    .word EventHandler_SciLab_Power_Plant_Hallway_F50
    .word EventHandler_SciLab_Power_Plant_Hallway_F50
    .word EventHandler_SciLab_Power_Plant_Hallway_F50
    .word EventHandler_SciLab_Power_Plant_Hallway_F50
    .word EventHandler_SciLab_Power_Plant_Hallway_F50
    .word EventHandler_SciLab_Power_Plant_Hallway_F50
    .word EventHandler_SciLab_Power_Plant_Hallway_F50


_ts MapSetup_SciLab_Power_Plant_Hallway_F50
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


_ts EventHandler_SciLab_Power_Plant_Hallway_F50
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_SciLab_Power_Plant_Hallway_F50_0_0803c818
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_SciLab_Power_Plant_Hallway_F50_0_0803c7c4:
    .word EventHandler_SciLab_Power_Plant_Hallway_F50_0


_ts EventHandler_SciLab_Power_Plant_Hallway_F50_0
    push       {lr}
    pop        {pc}


_ts EventHandler_SciLab_Power_Plant_Hallway_S5_HandleExits
    push       {lr}
    bl         Scene_IsSceneActive
    tst        r0,r0
    bne        LAB_0803c80e
    LoadMain world, r0, r7
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x20
    bne        LAB_0803c7ee
    push       {r5}
    ldr        r0,PTR_Scene_GovtElevator_0803c81c
    mov        r1,#0xe1
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0803c7ee:
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x1
    bne        LAB_0803c80e
    push       {r5}
    ldr        r0,PTR_Scene_LockedPath_0803c820
    ldr        r1,DAT_0803c824
    bl         Scene_Prepare
    pop        {r5}
LAB_0803c80e:
    pop        {pc}

PTR_PTR_MapSetup_SciLab_Power_Plant_Hallway_F50_0803c810:
    .word PTR_MapSetup_SciLab_Power_Plant_Hallway_F50_0803c744

PTR_PTR_EventHandler_SciLab_Power_Plant_Hallway_F50_0803c814:
    .word PTR_EventHandler_SciLab_Power_Plant_Hallway_F50_0803c774

PTR_PTR_EventHandler_SciLab_Power_Plant_Hallway_F50_0_0803c818:
    .word PTR_EventHandler_SciLab_Power_Plant_Hallway_F50_0_0803c7c4

PTR_Scene_GovtElevator_0803c81c:
    .word Scene_GovtElevator

PTR_Scene_LockedPath_0803c820:
    .word Scene_LockedPath

DAT_0803c824:
    .word 0xDF03
