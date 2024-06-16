#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_Power_Plant_Comp_4_S4
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,PTR_PTR_MapSetup_Default_0804b384
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    mov        r0,#0xc3
    bl         Flag_GetBase
    bne        LAB_0804b046
    ldr        r0,PTR_BgTask_8049BA8_0804b388
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8049C18_0804b38c
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8049C88_0804b390
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8049CF8_0804b394
    bl         BgTask_AddNew
    b          LAB_0804b05e
LAB_0804b046:
    ldr        r0,PTR_BgTask_8049C00_0804b398
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8049C70_0804b39c
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8049CE0_0804b3a0
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8049D50_0804b3a4
    bl         BgTask_AddNew
LAB_0804b05e:
    ldr        r0,PTR_BgTask_8049D68_0804b3a8
    bl         BgTask_AddNew
    pop        {r5}
    push       {r5}
    mov        r0,#0xd6
    bl         Flag_GetBase
    bne        LAB_0804b07a
    mov        r0,#0xd6
    bl         Flag_SetBase
    bl         PowerPlant_Init
LAB_0804b07a:
    ldr        r0,PTR_EntityAllocParams_804C2D8_0804b3ac
    bl         Entity_AllocList
    mov        r0,#0xc0
    bl         FUN_0804c8a4
    pop        {r5}
    pop        {pc}

    .align 2, 0

PTR_MapSetup_Default_0804b08c:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Power_Plant_Comp_4_F42
    .word MapSetup_Power_Plant_Comp_4_F43
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default


_ts EventHandler_Power_Plant_4_S4
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Default_0804b3b0
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r0,#0xfe
    bl         CheckForJackOut
    bl         FUN_0804a480
    pop        {pc}

    .align 2, 0

PTR_EventHandler_Default_0804b0c4:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Power_Plant_Comp_4_F42
    .word EventHandler_Power_Plant_Comp_4_F43
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default


_ts MapSetup_Power_Plant_Comp_4_F42
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_804BA60_0804b3b4
    bl         Map_LoadNPCList
    mov        r0,#0x0
    bl         PETBattery_Init
    bl         PETBattery_ResetStepCounter
    pop        {r5}
    mov        r0,#0xb6
    bl         Flag_GetBase
    beq        LAB_0804b148
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    mov        r1,#0x0
    strb       r1,[r0,#0x7]
    mov        r0,#0xb6
    bl         Flag_ClearBase
    mov        r0,#0xb9
    bl         Flag_GetBase
    beq        LAB_0804b12e
    mov        r1,#0x2
    b          LAB_0804b13c
LAB_0804b12e:
    mov        r0,#0xb8
    bl         Flag_GetBase
    beq        LAB_0804b13a
    mov        r1,#0x1
    b          LAB_0804b13c
LAB_0804b13a:
    mov        r1,#0x0
LAB_0804b13c:
    push       {r5}
    ldr        r0,DAT_0804b3b8
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_0804b168
LAB_0804b148:
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    bne        LAB_0804b15c
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_0804b168
LAB_0804b15c:
    push       {r5}
    ldr        r0,DAT_0804b3bc
    ldr        r1,PTR_DAT_0804b3c0
    bl         Scene_Prepare
    pop        {r5}
LAB_0804b168:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_Power_Plant_Comp_4_F42
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Power_Plant_Comp_4_F42_0_0804b3c4
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_Power_Plant_Comp_4_F42_0_0804b180:
    .word EventHandler_Power_Plant_Comp_4_F42_0


_ts EventHandler_Power_Plant_Comp_4_F42_0
    push       {lr}
    mov        r0,#0xd7
    bl         Flag_GetBase
    beq        LAB_0804b1a8
    mov        r0,#0xba
    bl         Flag_SetBase
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    mov        r1,#0x43
    strb       r1,[r0,#0x6]
    push       {r5}
    ldr        r0,PTR_FUN_08091b70_0804b3c8
    mov        r1,#0x3
    bl         Scene_Prepare
    pop        {r5}
LAB_0804b1a8:
    bl         Scene_IsSceneActive
    tst        r0,r0
    bne        LAB_0804b1e8
    push       {r5}
    mov        r0,#0x0
    bl         PETBattery_Main
    pop        {r5}
    tst        r0,r0
    bne        LAB_0804b1e8
    mov        r0,#0xb6
    bl         Flag_SetBase
    mov        r0,#0xb8
    bl         Flag_GetBase
    beq        LAB_0804b1d0
    mov        r1,#0x2
    b          LAB_0804b1de
LAB_0804b1d0:
    mov        r0,#0xb7
    bl         Flag_GetBase
    beq        LAB_0804b1dc
    mov        r1,#0x1
    b          LAB_0804b1de
LAB_0804b1dc:
    mov        r1,#0x0
LAB_0804b1de:
    push       {r5}
    ldr        r0,PTR_FUN_08091b70_0804b3cc
    bl         Scene_Prepare
    pop        {r5}
LAB_0804b1e8:
    pop        {pc}


_nt MapSetup_Power_Plant_Comp_4_F43
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_804BA60_0804b3d0
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0xbd
    bl         Flag_GetBase
    beq        LAB_0804b288
    mov        r0,#0xbf
    bl         Flag_GetBase
    bne        LAB_0804b22e
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    mov        r1,#0x0
    strb       r1,[r0,#0x7]
    push       {r5}
    ldr        r0,PTR_FUN_08090bc8_0804b3d4
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_0804b2f8
LAB_0804b22e:
    mov        r0,#0xc2
    bl         Flag_GetBase
    bne        LAB_0804b24c
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    mov        r1,#0x0
    strb       r1,[r0,#0x7]
    push       {r5}
    ldr        r0,PTR_FUN_08091d24_0804b3d8
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_0804b2f8
LAB_0804b24c:
    mov        r0,#0xc3
    bl         Flag_GetBase
    bne        LAB_0804b26a
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    mov        r1,#0x0
    strb       r1,[r0,#0x7]
    push       {r5}
    ldr        r0,PTR_FUN_08091054_0804b3dc
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_0804b2f8
LAB_0804b26a:
    mov        r0,#0xc4
    bl         Flag_GetBase
    bne        LAB_0804b288
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    mov        r1,#0x0
    strb       r1,[r0,#0x7]
    push       {r5}
    ldr        r0,PTR_FUN_080912b4_0804b3e0
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_0804b2f8
LAB_0804b288:
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    bne        LAB_0804b29c
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_0804b2b0
LAB_0804b29c:
    ldrb       r2,[r0,#0xc]
    mov        r1,#0x80
    and        r2,r1
    beq        LAB_0804b2b0
    push       {r5}
    ldr        r0,PTR_Scene_MegaManJackIn_0804b3e4
    ldr        r1,PTR_DAT_0804b3c0
    bl         Scene_Prepare
    pop        {r5}
LAB_0804b2b0:
    push       {r5}
    mov        r0,#0x0
    bl         PETBattery_Init
    bl         PETBattery_ResetStepCounter
    pop        {r5}
    mov        r0,#0xb6
    bl         Flag_GetBase
    beq        LAB_0804b2f8
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    mov        r1,#0x0
    strb       r1,[r0,#0x7]
    mov        r0,#0xb6
    bl         Flag_ClearBase
    mov        r0,#0xb9
    bl         Flag_GetBase
    beq        LAB_0804b2e0
    mov        r1,#0x2
    b          LAB_0804b2ee
LAB_0804b2e0:
    mov        r0,#0xb8
    bl         Flag_GetBase
    beq        LAB_0804b2ec
    mov        r1,#0x1
    b          LAB_0804b2ee
LAB_0804b2ec:
    mov        r1,#0x0
LAB_0804b2ee:
    push       {r5}
    ldr        r0,PTR_Scene_RechargeSuccess_0804b3e8
    bl         Scene_Prepare
    pop        {r5}
LAB_0804b2f8:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_Power_Plant_Comp_4_F43
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Power_Plant_Comp_4_F43_0_0804b3ec
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_Power_Plant_Comp_4_F43_0_0804b310:
    .word EventHandler_Power_Plant_Comp_4_F43_0


_ts EventHandler_Power_Plant_Comp_4_F43_0
    push       {lr}
    mov        r0,#0xbd
    bl         Flag_GetBase
    bne        LAB_0804b340
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x10
    bne        LAB_0804b340
    push       {r5}
    ldr        r0,PTR_FUN_080909dc_0804b3f0
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0804b340:
    bl         Scene_IsSceneActive
    tst        r0,r0
    bne        LAB_0804b380
    push       {r5}
    mov        r0,#0x0
    bl         PETBattery_Main
    pop        {r5}
    tst        r0,r0
    bne        LAB_0804b380
    mov        r0,#0xb6
    bl         Flag_SetBase
    mov        r0,#0xb8
    bl         Flag_GetBase
    beq        LAB_0804b368
    mov        r1,#0x2
    b          LAB_0804b376
LAB_0804b368:
    mov        r0,#0xb7
    bl         Flag_GetBase
    beq        LAB_0804b374
    mov        r1,#0x1
    b          LAB_0804b376
LAB_0804b374:
    mov        r1,#0x0
LAB_0804b376:
    push       {r5}
    ldr        r0,PTR_FUN_08091b70_0804b3f4
    bl         Scene_Prepare
    pop        {r5}
LAB_0804b380:
    pop        {pc}

    .align 2, 0

PTR_PTR_MapSetup_Default_0804b384:
    .word PTR_MapSetup_Default_0804b08c

PTR_BgTask_8049BA8_0804b388:
    .word BgTask_8049BA8

PTR_BgTask_8049C18_0804b38c:
    .word BgTask_8049C18

PTR_BgTask_8049C88_0804b390:
    .word BgTask_8049C88

PTR_BgTask_8049CF8_0804b394:
    .word BgTask_8049CF8

PTR_BgTask_8049C00_0804b398:
    .word BgTask_8049C00

PTR_BgTask_8049C70_0804b39c:
    .word BgTask_8049C70

PTR_BgTask_8049CE0_0804b3a0:
    .word BgTask_8049CE0

PTR_BgTask_8049D50_0804b3a4:
    .word BgTask_8049D50

PTR_BgTask_8049D68_0804b3a8:
    .word BgTask_8049D68

PTR_EntityAllocParams_804C2D8_0804b3ac:
    .word EntityAllocParams_804C2D8

PTR_PTR_EventHandler_Default_0804b3b0:
    .word PTR_EventHandler_Default_0804b0c4

PTR_NPCList_804BA60_0804b3b4:
    .word NPCList_804BA60

DAT_0804b3b8:
    .word 0x80919D9

DAT_0804b3bc:
    .word Scene_MegaManJackIn

PTR_DAT_0804b3c0:
    .word 0x2000

PTR_PTR_EventHandler_Power_Plant_Comp_4_F42_0_0804b3c4:
    .word PTR_EventHandler_Power_Plant_Comp_4_F42_0_0804b180

PTR_FUN_08091b70_0804b3c8:
    .word 0x8091B71

PTR_FUN_08091b70_0804b3cc:
    .word 0x8091B71

PTR_NPCList_804BA60_0804b3d0:
    .word NPCList_804BA60

PTR_FUN_08090bc8_0804b3d4:
    .word 0x8090BC9

PTR_FUN_08091d24_0804b3d8:
    .word 0x8091D25

PTR_FUN_08091054_0804b3dc:
    .word 0x8091055

PTR_FUN_080912b4_0804b3e0:
    .word 0x80912B5

PTR_Scene_MegaManJackIn_0804b3e4:
    .word Scene_MegaManJackIn

PTR_Scene_RechargeSuccess_0804b3e8:
    .word 0x80919D9

PTR_PTR_EventHandler_Power_Plant_Comp_4_F43_0_0804b3ec:
    .word PTR_EventHandler_Power_Plant_Comp_4_F43_0_0804b310

PTR_FUN_080909dc_0804b3f0:
    .word 0x80909DD

PTR_FUN_08091b70_0804b3f4:
    .word 0x8091B71


_ts MapSetup_Power_Plant_Comp_4_S5
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,PTR_PTR_MapSetup_Power_Plant_Comp_4_F50_0804b580
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_8049C00_0804b584
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8049C70_0804b588
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8049CE0_0804b58c
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8049D50_0804b590
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8049D68_0804b594
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8049E30_0804b598
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8049EF0_0804b59c
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8049FB0_0804b5a0
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8049FE0_0804b5a4
    bl         BgTask_AddNew
    mov        r0,#0x0
    bl         Flag_Set380
    mov        r0,#0x1
    bl         Flag_Set380
    mov        r0,#0x2
    bl         Flag_Set380
    mov        r0,#0x3
    bl         Flag_Set380
    mov        r0,#0x4
    bl         Flag_Set380
    mov        r0,#0x5
    bl         Flag_Set380
    mov        r0,#0x6
    bl         Flag_Set380
    mov        r0,#0x7
    bl         Flag_Set380
    mov        r0,#0x8
    bl         Flag_Set380
    mov        r0,#0x9
    bl         Flag_Set380
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_804b5a8
    bl         Entity_AllocList
    pop        {r5}
    pop        {pc}

PTR_MapSetup_Power_Plant_Comp_4_F50_0804b48c:
    .word MapSetup_Power_Plant_Comp_4_F50
    .word MapSetup_Power_Plant_Comp_4_F50
    .word MapSetup_Power_Plant_Comp_4_F50
    .word MapSetup_Power_Plant_Comp_4_F50
    .word MapSetup_Power_Plant_Comp_4_F50
    .word MapSetup_Power_Plant_Comp_4_F50
    .word MapSetup_Power_Plant_Comp_4_F50
    .word MapSetup_Power_Plant_Comp_4_F50
    .word MapSetup_Power_Plant_Comp_4_F50
    .word MapSetup_Power_Plant_Comp_4_F50
    .word MapSetup_Power_Plant_Comp_4_F50
    .word MapSetup_Power_Plant_Comp_4_F50
    .word MapSetup_Power_Plant_Comp_4_F50
    .word MapSetup_Power_Plant_Comp_4_F50
    .word MapSetup_Power_Plant_Comp_4_F50
    .word MapSetup_Power_Plant_Comp_4_F50


_ts EventHandler_Power_Plant_4_S5
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Power_Plant_Comp_4_F50_0804b5ac
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         FUN_0804a6e0
    pop        {pc}

PTR_EventHandler_Power_Plant_Comp_4_F50_0804b4dc:
    .word EventHandler_Power_Plant_Comp_4_F50
    .word EventHandler_Power_Plant_Comp_4_F50
    .word EventHandler_Power_Plant_Comp_4_F50
    .word EventHandler_Power_Plant_Comp_4_F50
    .word EventHandler_Power_Plant_Comp_4_F50
    .word EventHandler_Power_Plant_Comp_4_F50
    .word EventHandler_Power_Plant_Comp_4_F50
    .word EventHandler_Power_Plant_Comp_4_F50
    .word EventHandler_Power_Plant_Comp_4_F50
    .word EventHandler_Power_Plant_Comp_4_F50
    .word EventHandler_Power_Plant_Comp_4_F50
    .word EventHandler_Power_Plant_Comp_4_F50
    .word EventHandler_Power_Plant_Comp_4_F50
    .word EventHandler_Power_Plant_Comp_4_F50
    .word EventHandler_Power_Plant_Comp_4_F50
    .word EventHandler_Power_Plant_Comp_4_F50


_ts MapSetup_Power_Plant_Comp_4_F50
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_804BA7C_0804b5b0
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    bne        LAB_0804b54e
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_0804b55a
LAB_0804b54e:
    push       {r5}
    ldr        r0,DAT_0804b5b4
    ldr        r1,PTR_DAT_0804b5b8
    bl         Scene_Prepare
    pop        {r5}
LAB_0804b55a:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Power_Plant_Comp_4_F50
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Power_Plant_Comp_4_F50_0_0804b5bc
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Power_Plant_Comp_4_F50_0_0804b570:
    .word EventHandler_Power_Plant_Comp_4_F50_0


_ts EventHandler_Power_Plant_Comp_4_F50_0
    push       {lr}
    mov        r0,#0xa
    bl         CheckForJackOut
    pop        {pc}

    .align 2, 0

PTR_PTR_MapSetup_Power_Plant_Comp_4_F50_0804b580:
    .word PTR_MapSetup_Power_Plant_Comp_4_F50_0804b48c

PTR_BgTask_8049C00_0804b584:
    .word BgTask_8049C00

PTR_BgTask_8049C70_0804b588:
    .word BgTask_8049C70

PTR_BgTask_8049CE0_0804b58c:
    .word BgTask_8049CE0

PTR_BgTask_8049D50_0804b590:
    .word BgTask_8049D50

PTR_BgTask_8049D68_0804b594:
    .word BgTask_8049D68

PTR_BgTask_8049E30_0804b598:
    .word BgTask_8049E30

PTR_BgTask_8049EF0_0804b59c:
    .word BgTask_8049EF0

PTR_BgTask_8049FB0_0804b5a0:
    .word BgTask_8049FB0

PTR_BgTask_8049FE0_0804b5a4:
    .word BgTask_8049FE0

PTR_EntityAllocParams_804b5a8:
    .word EntityAllocParams_804C418

PTR_PTR_EventHandler_Power_Plant_Comp_4_F50_0804b5ac:
    .word PTR_EventHandler_Power_Plant_Comp_4_F50_0804b4dc

PTR_NPCList_804BA7C_0804b5b0:
    .word NPCList_804BA7C

DAT_0804b5b4:
    .word Scene_MegaManJackIn

PTR_DAT_0804b5b8:
    .word 0x2000

PTR_PTR_EventHandler_Power_Plant_Comp_4_F50_0_0804b5bc:
    .word PTR_EventHandler_Power_Plant_Comp_4_F50_0_0804b570
