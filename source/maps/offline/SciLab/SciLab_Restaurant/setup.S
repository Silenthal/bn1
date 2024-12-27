#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_SciLab_Restaurant_S4
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_SciLab_Restaurant_F40_0803c454
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    pop        {r5}
    mov        r0,#0xc5
    bl         Flag_GetBase
    bne        LAB_0803c262
    mov        r0,#0xab
    bl         Flag_GetBase
    beq        LAB_0803c25a
    mov        r0,#0x4
    bl         Sound_ChangeSong
    b          LAB_0803c266
LAB_0803c25a:
    mov        r0,#0x14
    bl         Sound_ChangeSong
    b          LAB_0803c266
LAB_0803c262:
    bl         Sound_AreaSongChange
LAB_0803c266:
    pop        {pc}

PTR_MapSetup_SciLab_Restaurant_F40_0803c268:
    .word MapSetup_SciLab_Restaurant_F40
    .word MapSetup_SciLab_Restaurant_F41
    .word MapSetup_SciLab_Restaurant_F41
    .word MapSetup_SciLab_Restaurant_F43
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default


_ts EventHandler_SciLab_Restaurant_S4
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_SciLab_Restaurant_F40_0803c458
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r0,#0x40
    mov        r1,#0x26
    bl         CheckForJackIn
    pop        {pc}

PTR_EventHandler_SciLab_Restaurant_F40_0803c29c:
    .word EventHandler_SciLab_Restaurant_F40
    .word EventHandler_SciLab_Restaurant_F41
    .word EventHandler_SciLab_Restaurant_F41
    .word EventHandler_SciLab_Restaurant_F43
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default


_ts MapSetup_SciLab_Restaurant_F40
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_803D22C_0803c45c
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x9f
    bl         Flag_GetBase
    bne        LAB_0803c2e6
    mov        r0,#0x0
    b          LAB_0803c2e8
LAB_0803c2e6:
    mov        r0,#0x4
LAB_0803c2e8:
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_SciLab_Restaurant_F40
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_SciLab_Restaurant_F40_0_0803c460
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_SciLab_Restaurant_F40_0_0803c2fc:
    .word EventHandler_SciLab_Restaurant_F40_0
    .word EventHandler_SciLab_Restaurant_F40_1


_ts EventHandler_SciLab_Restaurant_F40_0
    push       {lr}
    mov        r0,#0x9f
    bl         Flag_GetBase
    bne        LAB_0803c326
    mov        r0,#0xa0
    bl         Flag_GetBase
    beq        LAB_0803c326
    push       {r5}
    ldr        r0,PTR_Scene_Story_52_0803c464
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x4
    str        r0,[r5,#0x0]
LAB_0803c326:
    pop        {pc}


_ts EventHandler_SciLab_Restaurant_F40_1
    push       {lr}
    mov        r0,#0xab
    bl         Flag_GetBase
    bne        LAB_0803c38e
    mov        r0,#0xa1
    bl         Flag_GetBase
    beq        LAB_0803c38e
    mov        r0,#0xa2
    bl         Flag_GetBase
    beq        LAB_0803c38e
    mov        r0,#0xa3
    bl         Flag_GetBase
    beq        LAB_0803c38e
    mov        r0,#0xa4
    bl         Flag_GetBase
    beq        LAB_0803c38e
    mov        r0,#0xa5
    bl         Flag_GetBase
    beq        LAB_0803c38e
    mov        r0,#0xa6
    bl         Flag_GetBase
    beq        LAB_0803c38e
    mov        r0,#0xa7
    bl         Flag_GetBase
    beq        LAB_0803c38e
    mov        r0,#0xa8
    bl         Flag_GetBase
    beq        LAB_0803c38e
    mov        r0,#0xa9
    bl         Flag_GetBase
    beq        LAB_0803c38e
    mov        r0,#0xaa
    bl         Flag_GetBase
    beq        LAB_0803c38e
    push       {r5}
    ldr        r0,PTR_Scene_Story_53_0803c468
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_0803c38e:
    pop        {pc}


_ts MapSetup_SciLab_Restaurant_F41
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_803D398_0803c46c
    bl         Map_LoadNPCList
    ldr        r0,PTR_BgTask_803BA44_0803c470
    bl         BgTask_AddNew
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_SciLab_Restaurant_F41
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_SciLab_Restaurant_F41_0_0803c474
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_SciLab_Restaurant_F41_0_0803c3cc:
    .word EventHandler_SciLab_Restaurant_F41_0


_ts EventHandler_SciLab_Restaurant_F41_0
    push       {lr}
    pop        {pc}


_ts MapSetup_SciLab_Restaurant_F43
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_803D3C0_0803c478
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    bl         Flag_SetGate
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_SciLab_Restaurant_F43
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_SciLab_Restaurant_F43_0_0803c47c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_SciLab_Restaurant_F43_0_0803c410:
    .word EventHandler_SciLab_Restaurant_F43_0


_ts EventHandler_SciLab_Restaurant_F43_0
    push       {lr}
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x1
    bne        LAB_0803c436
    push       {r5}
    ldr        r0,DAT_0803c480
    ldr        r1,DAT_0803c484
    bl         Scene_Prepare
    pop        {r5}
LAB_0803c436:
    mov        r0,#0xc7
    bl         Flag_GetBase
    bne        LAB_0803c452
    mov        r0,#0xc6
    bl         Flag_GetBase
    beq        LAB_0803c452
    push       {r5}
    ldr        r0,PTR_Scene_Story_61_0803c488
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_0803c452:
    pop        {pc}

PTR_PTR_MapSetup_SciLab_Restaurant_F40_0803c454:
    .word PTR_MapSetup_SciLab_Restaurant_F40_0803c268

PTR_PTR_EventHandler_SciLab_Restaurant_F40_0803c458:
    .word PTR_EventHandler_SciLab_Restaurant_F40_0803c29c

PTR_NPCList_803D22C_0803c45c:
    .word NPCList_803D22C

PTR_PTR_EventHandler_SciLab_Restaurant_F40_0_0803c460:
    .word PTR_EventHandler_SciLab_Restaurant_F40_0_0803c2fc

PTR_Scene_Story_52_0803c464:
    .word Scene_Story_52

PTR_Scene_Story_53_0803c468:
    .word Scene_Story_53

PTR_NPCList_803D398_0803c46c:
    .word NPCList_803D398

PTR_BgTask_803BA44_0803c470:
    .word BgTask_803BA44

PTR_PTR_EventHandler_SciLab_Restaurant_F41_0_0803c474:
    .word PTR_EventHandler_SciLab_Restaurant_F41_0_0803c3cc

PTR_NPCList_803D3C0_0803c478:
    .word NPCList_803D3C0

PTR_PTR_EventHandler_SciLab_Restaurant_F43_0_0803c47c:
    .word PTR_EventHandler_SciLab_Restaurant_F43_0_0803c410

DAT_0803c480:
    .word Scene_LockedPath

DAT_0803c484:
    .word 0x1505

PTR_Scene_Story_61_0803c488:
    .word Scene_Story_61


_ts MapSetup_SciLab_Restaurant_S5
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_SciLab_Restaurant_F50_0803c528
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Sound_AreaSongChange
    pop        {pc}

PTR_MapSetup_SciLab_Restaurant_F50_0803c49c:
    .word MapSetup_SciLab_Restaurant_F50
    .word MapSetup_SciLab_Restaurant_F50
    .word MapSetup_SciLab_Restaurant_F50
    .word MapSetup_SciLab_Restaurant_F50
    .word MapSetup_SciLab_Restaurant_F50
    .word MapSetup_SciLab_Restaurant_F50
    .word MapSetup_SciLab_Restaurant_F50
    .word MapSetup_SciLab_Restaurant_F50


_ts EventHandler_SciLab_Restaurant_S5
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_SciLab_Restaurant_F50_0803c52c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r0,#0x40
    mov        r1,#0x26
    bl         CheckForJackIn
    pop        {pc}

PTR_EventHandler_SciLab_Restaurant_F50_0803c4d0:
    .word EventHandler_SciLab_Restaurant_F50
    .word EventHandler_SciLab_Restaurant_F50
    .word EventHandler_SciLab_Restaurant_F50
    .word EventHandler_SciLab_Restaurant_F50
    .word EventHandler_SciLab_Restaurant_F50
    .word EventHandler_SciLab_Restaurant_F50
    .word EventHandler_SciLab_Restaurant_F50
    .word EventHandler_SciLab_Restaurant_F50


_ts MapSetup_SciLab_Restaurant_F50
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_NPCList_803D400_0803c530
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_SciLab_Restaurant_F50
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_SciLab_Restaurant_F50_0_0803c534
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_SciLab_Restaurant_F50_0_0803c520:
    .word EventHandler_SciLab_Restaurant_F50_0


_ts EventHandler_SciLab_Restaurant_F50_0
    push       {lr}
    pop        {pc}

PTR_PTR_MapSetup_SciLab_Restaurant_F50_0803c528:
    .word PTR_MapSetup_SciLab_Restaurant_F50_0803c49c

PTR_PTR_EventHandler_SciLab_Restaurant_F50_0803c52c:
    .word PTR_EventHandler_SciLab_Restaurant_F50_0803c4d0

PTR_NPCList_803D400_0803c530:
    .word NPCList_803D400

PTR_PTR_EventHandler_SciLab_Restaurant_F50_0_0803c534:
    .word PTR_EventHandler_SciLab_Restaurant_F50_0_0803c520
