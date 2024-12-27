#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_DenTown_Center_S3
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_DenTown_Center_F30_080361a4
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_8039828_080361c8
    bl         Entity_AllocList
    pop        {r5}
    mov        r0,#0xbd
    bl         Flag_GetBase
    bne        LAB_0803619c
    mov        r0,#0xa6
    bl         Flag_GetBase
    beq        LAB_0803617c
    mov        r0,#0x4
    bl         Sound_ChangeSong
    b          LAB_080361a0
LAB_0803617c:
    mov        r0,#0x9b
    bl         Flag_GetBase
    beq        LAB_0803618c
    mov        r0,#0x3
    bl         Sound_ChangeSong
    b          LAB_080361a0
LAB_0803618c:
    mov        r0,#0x98
    bl         Flag_GetBase
    beq        LAB_0803619c
    mov        r0,#0x4
    bl         Sound_ChangeSong
    b          LAB_080361a0
LAB_0803619c:
    bl         Sound_AreaSongChange
LAB_080361a0:
    pop        {pc}

    .align 2, 0

PTR_PTR_MapSetup_DenTown_Center_F30_080361a4:
    .word PTR_MapSetup_DenTown_Center_F30_080361a8

PTR_MapSetup_DenTown_Center_F30_080361a8:
    .word MapSetup_DenTown_Center_F30
    .word MapSetup_Default
    .word MapSetup_DenTown_Center_F32
    .word MapSetup_DenTown_Center_F33
    .word MapSetup_DenTown_Center_F34
    .word MapSetup_DenTown_Center_F35
    .word MapSetup_DenTown_Center_F36
    .word MapSetup_DenTown_Center_F37

PTR_EntityAllocParams_8039828_080361c8:
    .word EntityAllocParams_8039828


_ts EventHandler_DenTown_Center_S3
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_DenTown_Center_F30_080361d8
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_PTR_EventHandler_DenTown_Center_F30_080361d8:
    .word PTR_EventHandler_DenTown_Center_F30_080361dc

PTR_EventHandler_DenTown_Center_F30_080361dc:
    .word EventHandler_DenTown_Center_F30
    .word EventHandler_Default
    .word EventHandler_DenTown_Center_F32
    .word EventHandler_DenTown_Center_F33
    .word EventHandler_DenTown_Center_F34
    .word EventHandler_DenTown_Center_F35
    .word EventHandler_DenTown_Center_F36
    .word EventHandler_DenTown_Center_F37


_ts MapSetup_DenTown_Center_F30
    push       {lr}
    push       {r5}
    bl         Traffic_Init
    pop        {r5}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_8038DAC_08036228
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}

PTR_NPCList_8038DAC_08036228:
    .word NPCList_8038DAC


_ts EventHandler_DenTown_Center_F30
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_DenTown_Center_F30_0_08036240
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    bl         Traffic_Main
    pop        {pc}

PTR_PTR_EventHandler_DenTown_Center_F30_0_08036240:
    .word PTR_EventHandler_DenTown_Center_F30_0_08036244

PTR_EventHandler_DenTown_Center_F30_0_08036244:
    .word EventHandler_DenTown_Center_F30_0


_ts EventHandler_DenTown_Center_F30_0
    push       {lr}
    mov        r0,#0x95
    bl         Flag_GetBase
    beq        LAB_0803626e
    mov        r0,#0x15
    bl         Flag_GetEmailRecieved
    bne        LAB_0803626e
    push       {r5}
    ldr        r0,DAT_08036444
    mov        r1,#0x5
    mov        r2,#0x1
    lsl        r2,r2,#0x8
    orr        r1,r2
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0803626e:
    mov        r0,#0x0
    bl         FUN_08036926
    tst        r0,r0
    beq        LAB_08036284
    push       {r5}
    ldr        r0,DAT_0803643c
    mov        r1,#0x4
    bl         Scene_Prepare
    pop        {r5}
LAB_08036284:
    pop        {pc}


_nt MapSetup_DenTown_Center_F32
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    mov        r0,#0x0
    bl         Flag_Clear380
    mov        r0,#0x1
    bl         Flag_Clear380
    mov        r0,#0x0
    strb       r0,[r5,#0x8]
    strb       r0,[r5,#0x9]
    mov        r0,#0x2
    strb       r0,[r5,#0xa]
    strb       r0,[r5,#0xb]
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_803987C_080362f8
    bl         Entity_AllocList
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_8038E34_080362fc
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    bl         Flag_SetGate
    mov        r0,#0x1
    bl         Flag_SetGate
    mov        r0,#0x2
    bl         Flag_SetGate
    mov        r0,#0x3
    bl         Flag_SetGate
    mov        r0,#0x4
    bl         Flag_SetGate
    mov        r0,#0x5
    bl         Flag_SetGate
    mov        r0,#0x6
    bl         Flag_SetGate
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}

    .align 2, 0

PTR_EntityAllocParams_803987C_080362f8:
    .word EntityAllocParams_803987C

PTR_NPCList_8038E34_080362fc:
    .word NPCList_8038E34


_ts EventHandler_DenTown_Center_F32
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_DenTown_Center_F32_0_08036314
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    bl         FUN_080368b8
    pop        {pc}

PTR_PTR_EventHandler_DenTown_Center_F32_0_08036314:
    .word PTR_EventHandler_DenTown_Center_F32_0_08036318

PTR_EventHandler_DenTown_Center_F32_0_08036318:
    .word EventHandler_DenTown_Center_F32_0
    .word EventHandler_DenTown_Center_F32_1


_ts EventHandler_DenTown_Center_F32_0
    push       {lr}
    mov        r0,#0x9f
    bl         Flag_GetBase
    beq        LAB_0803633c
    push       {r5}
    ldr        r0,PTR_Scene_Story_3B_08036438
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x4
    str        r0,[r5,#0x0]
    pop        {pc}
LAB_0803633c:
    mov        r0,#0x0
    bl         FUN_08036926
    tst        r0,r0
    beq        LAB_08036354
    push       {r5}
    ldr        r0,DAT_0803643c
    mov        r1,#0xb
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_08036354:
    pop        {pc}


_nt EventHandler_DenTown_Center_F32_1
    push       {lr}
    pop        {pc}


_nt MapSetup_DenTown_Center_F33
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    mov        r0,#0x0
    bl         Flag_Clear380
    mov        r0,#0x1
    bl         Flag_Clear380
    mov        r0,#0x0
    strb       r0,[r5,#0x8]
    strb       r0,[r5,#0x9]
    mov        r0,#0x2
    strb       r0,[r5,#0xa]
    strb       r0,[r5,#0xb]
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_803987C_080363d0
    bl         Entity_AllocList
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_8038F40_080363d4
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    bl         Flag_SetGate
    mov        r0,#0x1
    bl         Flag_SetGate
    mov        r0,#0x2
    bl         Flag_SetGate
    mov        r0,#0x3
    bl         Flag_SetGate
    mov        r0,#0x4
    bl         Flag_SetGate
    mov        r0,#0x5
    bl         Flag_SetGate
    mov        r0,#0xa6
    bl         Flag_GetBase
    bne        LAB_080363ca
    mov        r0,#0x0
    b          LAB_080363cc
LAB_080363ca:
    mov        r0,#0x4
LAB_080363cc:
    str        r0,[r5,#0x0]
    pop        {pc}

PTR_EntityAllocParams_803987C_080363d0:
    .word EntityAllocParams_803987C

PTR_NPCList_8038F40_080363d4:
    .word NPCList_8038F40


_ts EventHandler_DenTown_Center_F33
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_DenTown_Center_F33_0_080363ec
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    bl         FUN_080368b8
    pop        {pc}

PTR_PTR_EventHandler_DenTown_Center_F33_0_080363ec:
    .word PTR_EventHandler_DenTown_Center_F33_0_080363f0

PTR_EventHandler_DenTown_Center_F33_0_080363f0:
    .word EventHandler_DenTown_Center_F33_0
    .word EventHandler_DenTown_Center_F33_1


_ts EventHandler_DenTown_Center_F33_0
    push       {lr}
    mov        r0,#0x0
    bl         FUN_08036926
    tst        r0,r0
    beq        LAB_08036412
    push       {r5}
    ldr        r0,DAT_0803643c
    mov        r1,#0xb
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_08036412:
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x18
    bne        LAB_08036436
    push       {r5}
    ldr        r0,PTR_Scene_Story_3C_08036440
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x4
    str        r0,[r5,#0x0]
LAB_08036436:
    pop        {pc}

PTR_Scene_Story_3B_08036438:
    .word Scene_Story_3B

DAT_0803643c:
    .word Scene_Dialogue

PTR_Scene_Story_3C_08036440:
    .word Scene_Story_3C

DAT_08036444:
    .word Scene_CheckMail


_ts EventHandler_DenTown_Center_F33_1
    push       {lr}
    mov        r0,#0x0
    bl         FUN_08036926
    tst        r0,r0
    beq        LAB_08036462
    push       {r5}
    ldr        r0,DAT_080365e4
    mov        r1,#0x1f
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_08036462:
    pop        {pc}


_ts MapSetup_DenTown_Center_F34
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
    mov        r0,#0x1
    bl         Flag_SetGate
    mov        r0,#0x4
    bl         Flag_SetGate
    mov        r0,#0x5
    bl         Flag_SetGate
    mov        r0,#0x6
    bl         Flag_SetGate
    mov        r0,#0x0
    bl         Flag_Clear380
    mov        r0,#0x1
    bl         Flag_Clear380
    mov        r0,#0x0
    strb       r0,[r5,#0x8]
    strb       r0,[r5,#0x9]
    mov        r0,#0x2
    strb       r0,[r5,#0xa]
    strb       r0,[r5,#0xb]
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_803987C_080364dc
    bl         Entity_AllocList
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_8038F40_080364e0
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0xb1
    bl         Flag_GetBase
    bne        LAB_080364d6
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    mov        r1,#0x0
    strb       r1,[r0,#0x7]
    mov        r0,#0x0
    b          LAB_080364d8
LAB_080364d6:
    mov        r0,#0x4
LAB_080364d8:
    str        r0,[r5,#0x0]
    pop        {pc}

PTR_EntityAllocParams_803987C_080364dc:
    .word EntityAllocParams_803987C

PTR_NPCList_8038F40_080364e0:
    .word NPCList_8038F40


_ts EventHandler_DenTown_Center_F34
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_DenTown_Center_F34_0_080364f8
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    bl         FUN_080368b8
    pop        {pc}

PTR_PTR_EventHandler_DenTown_Center_F34_0_080364f8:
    .word PTR_EventHandler_DenTown_Center_F34_0_080364fc

PTR_EventHandler_DenTown_Center_F34_0_080364fc:
    .word EventHandler_DenTown_Center_F34_0
    .word EventHandler_DenTown_Center_F34_1


_ts EventHandler_DenTown_Center_F34_0
    push       {lr}
    push       {r5}
    ldr        r0,PTR_Scene_Story_3F_08036518
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x4
    str        r0,[r5,#0x0]
    pop        {pc}

PTR_Scene_Story_3F_08036518:
    .word Scene_Story_3F


_ts EventHandler_DenTown_Center_F34_1
    push       {lr}
    mov        r0,#0x0
    bl         FUN_08036926
    tst        r0,r0
    beq        LAB_08036534
    push       {r5}
    ldr        r0,DAT_080365e4
    mov        r1,#0x2a
    bl         Scene_Prepare
    pop        {r5}
LAB_08036534:
    pop        {pc}


_nt MapSetup_DenTown_Center_F35
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
    mov        r0,#0x1
    bl         Flag_SetGate
    mov        r0,#0x2
    bl         Flag_SetGate
    mov        r0,#0x3
    bl         Flag_SetGate
    mov        r0,#0x6
    bl         Flag_SetGate
    mov        r0,#0x0
    bl         Flag_Clear380
    mov        r0,#0x1
    bl         Flag_Clear380
    mov        r0,#0x0
    strb       r0,[r5,#0x8]
    strb       r0,[r5,#0x9]
    mov        r0,#0x2
    strb       r0,[r5,#0xa]
    strb       r0,[r5,#0xb]
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_803987C_08036980
    bl         Entity_AllocList
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_8038F40_08036984
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_DenTown_Center_F35
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_DenTown_Center_F35_0_08036988
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    bl         FUN_080368b8
    pop        {pc}

    .align 2, 0

PTR_EventHandler_DenTown_Center_F35_0_080365b0:
    .word EventHandler_DenTown_Center_F35_0


_ts EventHandler_DenTown_Center_F35_0
    push       {lr}
    mov        r0,#0xd
    bl         Flag_GetEmailRecieved
    bne        LAB_080365cc
    push       {r5}
    ldr        r0,DAT_0803698c
    ldr        r1,DAT_08036990
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_080365cc:
    mov        r0,#0x0
    bl         FUN_08036926
    tst        r0,r0
    beq        LAB_080365e2
    push       {r5}
    ldr        r0,DAT_080365e4
    mov        r1,#0x2a
    bl         Scene_Prepare
    pop        {r5}
LAB_080365e2:
    pop        {pc}

DAT_080365e4:
    .word Scene_Dialogue


_ts MapSetup_DenTown_Center_F36
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
    mov        r0,#0x1
    bl         Flag_SetGate
    mov        r0,#0x2
    bl         Flag_SetGate
    mov        r0,#0x3
    bl         Flag_SetGate
    mov        r0,#0x4
    bl         Flag_SetGate
    mov        r0,#0x5
    bl         Flag_SetGate
    mov        r0,#0x6
    bl         Flag_SetGate
    mov        r0,#0x0
    bl         Flag_Set380
    mov        r0,#0x1
    bl         Flag_Set380
    mov        r0,#0x0
    strb       r0,[r5,#0x8]
    strb       r0,[r5,#0x9]
    mov        r0,#0x2
    strb       r0,[r5,#0xa]
    strb       r0,[r5,#0xb]
    mov        r0,#0xb3
    bl         Flag_GetBase
    bne        LAB_0803665c
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    mov        r1,#0x0
    strb       r1,[r0,#0x7]
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_803987C_08036994
    bl         Entity_AllocList
    pop        {r5}
    mov        r0,#0x0
    b          FUN_080366f4
LAB_0803665c:
    mov        r0,#0xb5
    bl         Flag_GetBase
    bne        LAB_0803667a
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    mov        r1,#0x0
    strb       r1,[r0,#0x7]
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_8039A10_08036998
    bl         Entity_AllocList
    pop        {r5}
    mov        r0,#0x4
    b          FUN_080366f4
LAB_0803667a:
    mov        r0,#0xb6
    bl         Flag_GetBase
    bne        LAB_08036698
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    mov        r1,#0x0
    strb       r1,[r0,#0x7]
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_8039BA4_0803699c
    bl         Entity_AllocList
    pop        {r5}
    mov        r0,#0x8
    b          FUN_080366f4
LAB_08036698:
    mov        r0,#0xb7
    bl         Flag_GetBase
    bne        LAB_080366b6
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    mov        r1,#0x0
    strb       r1,[r0,#0x7]
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_8039D38_080369a0
    bl         Entity_AllocList
    pop        {r5}
    mov        r0,#0xc
    b          FUN_080366f4
LAB_080366b6:
    mov        r0,#0xb9
    bl         Flag_GetBase
    bne        LAB_080366d4
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    mov        r1,#0x0
    strb       r1,[r0,#0x7]
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_8039ECC_080369a4
    bl         Entity_AllocList
    pop        {r5}
    mov        r0,#0x10
    b          FUN_080366f4
LAB_080366d4:
    mov        r0,#0xba
    bl         Flag_GetBase
    bne        LAB_080366f2
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    mov        r1,#0x0
    strb       r1,[r0,#0x7]
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_8039ECC_080369a8
    bl         Entity_AllocList
    pop        {r5}
    mov        r0,#0x14
    b          FUN_080366f4
LAB_080366f2:
    mov        r0,#0x18


_ts FUN_080366f4
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_DenTown_Center_F36
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_DenTown_Center_F36_0_080369ac
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    bl         FUN_080368b8
    pop        {pc}

PTR_EventHandler_DenTown_Center_F36_0_0803670c:
    .word EventHandler_DenTown_Center_F36_0
    .word EventHandler_DenTown_Center_F36_1
    .word EventHandler_DenTown_Center_F36_2
    .word EventHandler_DenTown_Center_F36_3
    .word EventHandler_DenTown_Center_F36_4
    .word EventHandler_DenTown_Center_F36_5
    .word EventHandler_DenTown_Center_F36_6


_ts EventHandler_DenTown_Center_F36_0
    push       {lr}
    push       {r5}
    ldr        r0,PTR_Scene_Story_43_080369b0
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x4
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_DenTown_Center_F36_1
    push       {lr}
    push       {r5}
    ldr        r0,PTR_Scene_Story_45_080369b4
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x18
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_DenTown_Center_F36_2
    push       {lr}
    mov        r0,#0xc7
    bl         Flag_GetBase
    beq        LAB_0803676a
    push       {r5}
    ldr        r0,PTR_Scene_Story_46_080369b8
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x18
    str        r0,[r5,#0x0]
LAB_0803676a:
    pop        {pc}


_ts EventHandler_DenTown_Center_F36_3
    push       {lr}
    mov        r0,#0xc8
    bl         Flag_GetBase
    beq        LAB_08036786
    push       {r5}
    ldr        r0,PTR_Scene_Story_47_080369bc
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x18
    str        r0,[r5,#0x0]
LAB_08036786:
    pop        {pc}


_ts EventHandler_DenTown_Center_F36_4
    push       {lr}
    push       {r5}
    ldr        r0,PTR_Scene_Story_48_080369c0
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x18
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_DenTown_Center_F36_5
    push       {lr}
    push       {r5}
    ldr        r0,PTR_Scene_Story_49_080369c4
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x18
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_DenTown_Center_F36_6
    push       {lr}
    pop        {pc}


_ts MapSetup_DenTown_Center_F37
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
    mov        r0,#0x1
    bl         Flag_SetGate
    mov        r0,#0x2
    bl         Flag_SetGate
    mov        r0,#0x3
    bl         Flag_SetGate
    mov        r0,#0x4
    bl         Flag_SetGate
    mov        r0,#0x5
    bl         Flag_SetGate
    mov        r0,#0x6
    bl         Flag_SetGate
    mov        r0,#0x0
    bl         Flag_Set380
    mov        r0,#0x1
    bl         Flag_Set380
    mov        r0,#0xbd
    bl         Flag_GetBase
    beq        LAB_0803682a
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_803A1F4_080369c8
    bl         Entity_AllocList
    pop        {r5}
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    mov        r1,#0x0
    strb       r1,[r0,#0x7]
    push       {r5}
    ldr        r0,PTR_Scene_Story_4C_080369cc
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x8
    strb       r0,[r5,#0x0]
    pop        {pc}
LAB_0803682a:
    push       {r5}
    mov        r7,#0x6
    bl         Effect_Nonstop_Bus_Create
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_803A060_080369d0
    bl         Entity_AllocList
    pop        {r5}
    mov        r0,#0x2
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_DenTown_Center_F37
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_DenTown_Center_F37_0_080369d4
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    bl         FUN_080368b8
    pop        {pc}

PTR_EventHandler_DenTown_Center_F37_0_0803685c:
    .word EventHandler_DenTown_Center_F37_0
    .word EventHandler_DenTown_Center_F37_1
    .word EventHandler_DenTown_Center_F37_2


_ts EventHandler_DenTown_Center_F37_0
    push       {lr}
    ldrb       r0,[r5,#0x1]
    tst        r0,r0
    beq        LAB_08036876
    sub        r0,#0x1
    strb       r0,[r5,#0x1]
    pop        {pc}
LAB_08036876:
    mov        r0,#0xb2
    bl         Flag_SetBase
    mov        r0,#0x4
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_DenTown_Center_F37_1
    push       {lr}
    mov        r0,#0x0
    bl         FUN_08036926
    tst        r0,r0
    beq        LAB_0803689c
    push       {r5}
    ldr        r0,PTR_Scene_Dialogue_080369d8
    mov        r1,#0x3c
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0803689c:
    mov        r0,#0x1
    bl         FUN_08036926
    tst        r0,r0
    beq        LAB_080368b2
    push       {r5}
    ldr        r0,PTR_Scene_JackIn_080369dc
    mov        r1,#0x12
    bl         Scene_Prepare
    pop        {r5}
LAB_080368b2:
    pop        {pc}


_ts EventHandler_DenTown_Center_F37_2
    push       {lr}
    pop        {pc}


_ts FUN_080368b8
    push       {lr}
    bl         Scene_IsSceneActive
    tst        r0,r0
    beq        LAB_080368c4
    pop        {pc}
LAB_080368c4:
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x1
    beq        LAB_080368f4
    cmp        r0,#0x2
    beq        LAB_080368f4
    cmp        r0,#0x3
    beq        LAB_08036906
    cmp        r0,#0x4
    beq        LAB_08036906
    cmp        r0,#0x5
    beq        LAB_0803690a
    cmp        r0,#0x6
    beq        LAB_0803690a
    cmp        r0,#0x7
    bne        LAB_08036924
    ldr        r1,DAT_080369e0
    b          LAB_0803691a
LAB_080368f4:
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r1,[r0,#0x6]
    cmp        r1,#0x34
    beq        LAB_08036902
    ldr        r1,DAT_080369e4
    b          LAB_0803691a
LAB_08036902:
    ldr        r1,DAT_080369e8
    b          LAB_0803691a
LAB_08036906:
    ldr        r1,DAT_080369ec
    b          LAB_0803691a
LAB_0803690a:
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r1,[r0,#0x6]
    cmp        r1,#0x36
    beq        LAB_08036918
    ldr        r1,DAT_080369f0
    b          LAB_0803691a
LAB_08036918:
    ldr        r1,DAT_080369f4
LAB_0803691a:
    push       {r5}
    ldr        r0,PTR_Scene_LockedPath_080369f8
    bl         Scene_Prepare
    pop        {r5}
LAB_08036924:
    pop        {pc}


_nt FUN_08036926
    push       {lr}
    push       {r0}
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    mov        r1,#0xc
    strh       r1,[r0,#0x2e]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldr        r7,[r7,#0x28]
    mov        r1,#0x0
    strh       r1,[r7,#0x2e]
    pop        {r5}
    pop        {r1}
    tst        r1,r1
    beq        LAB_08036954
    cmp        r0,#0x41
    bne        LAB_0803697a
    b          LAB_08036958
LAB_08036954:
    cmp        r0,#0x40
    bne        LAB_0803697a
LAB_08036958:
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0803697a
    mov        r0,r10
    ldr        r0,[r0,#0x4]
    ldrh       r0,[r0,#0x2]
    ldr        r1,DAT_080369fc
    and        r1,r0
    beq        LAB_0803697a
    bl         dummy_187a0
    bne        LAB_0803697a
    mov        r0,#0x1
    pop        {pc}
LAB_0803697a:
    mov        r0,#0x0
    pop        {pc}

    .align 2, 0

PTR_EntityAllocParams_803987C_08036980:
    .word EntityAllocParams_803987C

PTR_NPCList_8038F40_08036984:
    .word NPCList_8038F40

PTR_PTR_EventHandler_DenTown_Center_F35_0_08036988:
    .word PTR_EventHandler_DenTown_Center_F35_0_080365b0

DAT_0803698c:
    .word Scene_CheckMail

DAT_08036990:
    .word 0x132

PTR_EntityAllocParams_803987C_08036994:
    .word EntityAllocParams_803987C

PTR_EntityAllocParams_8039A10_08036998:
    .word EntityAllocParams_8039A10

PTR_EntityAllocParams_8039BA4_0803699c:
    .word EntityAllocParams_8039BA4

PTR_EntityAllocParams_8039D38_080369a0:
    .word EntityAllocParams_8039D38

PTR_EntityAllocParams_8039ECC_080369a4:
    .word EntityAllocParams_8039ECC

PTR_EntityAllocParams_8039ECC_080369a8:
    .word EntityAllocParams_8039ECC

PTR_PTR_EventHandler_DenTown_Center_F36_0_080369ac:
    .word PTR_EventHandler_DenTown_Center_F36_0_0803670c

PTR_Scene_Story_43_080369b0:
    .word Scene_Story_43

PTR_Scene_Story_45_080369b4:
    .word Scene_Story_45

PTR_Scene_Story_46_080369b8:
    .word Scene_Story_46

PTR_Scene_Story_47_080369bc:
    .word Scene_Story_47

PTR_Scene_Story_48_080369c0:
    .word Scene_Story_48

PTR_Scene_Story_49_080369c4:
    .word Scene_Story_49

PTR_EntityAllocParams_803A1F4_080369c8:
    .word EntityAllocParams_803A1F4

PTR_Scene_Story_4C_080369cc:
    .word Scene_Story_4C

PTR_EntityAllocParams_803A060_080369d0:
    .word EntityAllocParams_803A060

PTR_PTR_EventHandler_DenTown_Center_F37_0_080369d4:
    .word PTR_EventHandler_DenTown_Center_F37_0_0803685c

PTR_Scene_Dialogue_080369d8:
    .word Scene_Dialogue

PTR_Scene_JackIn_080369dc:
    .word Scene_JackIn

DAT_080369e0:
    .word 0xA01

DAT_080369e4:
    .word 0xA03

DAT_080369e8:
    .word 0x2803

DAT_080369ec:
    .word 0xA05

DAT_080369f0:
    .word 0xA07

DAT_080369f4:
    .word 0x3D07

PTR_Scene_LockedPath_080369f8:
    .word Scene_LockedPath

DAT_080369fc:
    .word 0x100


_ts MapSetup_DenTown_Center_S4
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_DenTown_Center_F40_08036b0c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_8039828_08036b10
    bl         Entity_AllocList
    pop        {r5}
    bl         Traffic_Init
    bl         Sound_AreaSongChange
    pop        {pc}

    .align 2, 0

PTR_MapSetup_DenTown_Center_F40_08036a20:
    .word MapSetup_DenTown_Center_F40
    .word MapSetup_DenTown_Center_F40
    .word MapSetup_DenTown_Center_F40
    .word MapSetup_DenTown_Center_F40
    .word MapSetup_DenTown_Center_F40
    .word MapSetup_DenTown_Center_F40
    .word MapSetup_DenTown_Center_F40
    .word MapSetup_DenTown_Center_F40


_ts EventHandler_DenTown_Center_S4
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_DenTown_Center_F40_08036b14
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Traffic_Main
    pop        {pc}

PTR_EventHandler_DenTown_Center_F40_08036a50:
    .word EventHandler_DenTown_Center_F40
    .word EventHandler_DenTown_Center_F40
    .word EventHandler_DenTown_Center_F40
    .word EventHandler_DenTown_Center_F40
    .word EventHandler_DenTown_Center_F40
    .word EventHandler_DenTown_Center_F40
    .word EventHandler_DenTown_Center_F40
    .word EventHandler_DenTown_Center_F40


_ts MapSetup_DenTown_Center_F40
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_8038DAC_08036b18
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_DenTown_Center_F40
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_DenTown_Center_F40_0_08036b1c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_DenTown_Center_F40_0_08036aa4:
    .word EventHandler_DenTown_Center_F40_0


_ts EventHandler_DenTown_Center_F40_0
    push       {lr}
    bl         FUN_08036ab0
    pop        {pc}


_ts FUN_08036ab0
    push       {lr}
    bl         Scene_IsSceneActive
    tst        r0,r0
    beq        LAB_08036abc
    pop        {pc}
LAB_08036abc:
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    mov        r1,#0x8
    strh       r1,[r0,#0x2e]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldr        r7,[r7,#0x28]
    mov        r1,#0x0
    strh       r1,[r7,#0x2e]
    pop        {r5}
    cmp        r0,#0x40
    bne        LAB_08036b08
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08036b08
    mov        r0,r10
    ldr        r0,[r0,#0x4]
    ldrh       r0,[r0,#0x2]
    ldr        r1,DAT_08036b20
    and        r1,r0
    beq        LAB_08036b08
    bl         dummy_187a0
    bne        LAB_08036b08
    push       {r5}
    ldr        r0,PTR_Scene_JackIn_08036b24
    mov        r1,#0x29
    bl         Scene_Prepare
    pop        {r5}
LAB_08036b08:
    pop        {pc}

    .align 2, 0

PTR_PTR_MapSetup_DenTown_Center_F40_08036b0c:
    .word PTR_MapSetup_DenTown_Center_F40_08036a20

PTR_EntityAllocParams_8039828_08036b10:
    .word EntityAllocParams_8039828

PTR_PTR_EventHandler_DenTown_Center_F40_08036b14:
    .word PTR_EventHandler_DenTown_Center_F40_08036a50

PTR_NPCList_8038DAC_08036b18:
    .word NPCList_8038DAC

PTR_PTR_EventHandler_DenTown_Center_F40_0_08036b1c:
    .word PTR_EventHandler_DenTown_Center_F40_0_08036aa4

DAT_08036b20:
    .word 0x100

PTR_Scene_JackIn_08036b24:
    .word Scene_JackIn


_ts MapSetup_DenTown_Center_S5
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_DenTown_Center_F50_08036c68
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_8039828_08036c6c
    bl         Entity_AllocList
    pop        {r5}
    bl         Traffic_Init
    bl         Sound_AreaSongChange
    pop        {pc}

    .align 2, 0

PTR_MapSetup_DenTown_Center_F50_08036b48:
    .word MapSetup_DenTown_Center_F50
    .word MapSetup_DenTown_Center_F50
    .word MapSetup_DenTown_Center_F50
    .word MapSetup_DenTown_Center_F50
    .word MapSetup_DenTown_Center_F50
    .word MapSetup_DenTown_Center_F50
    .word MapSetup_DenTown_Center_F50
    .word MapSetup_DenTown_Center_F50


_ts EventHandler_DenTown_Center_S5
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_DenTown_Center_F50_08036c70
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Traffic_Main
    pop        {pc}

PTR_EventHandler_DenTown_Center_F50_08036b78:
    .word EventHandler_DenTown_Center_F50
    .word EventHandler_DenTown_Center_F50
    .word EventHandler_DenTown_Center_F50
    .word EventHandler_DenTown_Center_F50
    .word EventHandler_DenTown_Center_F50
    .word EventHandler_DenTown_Center_F50
    .word EventHandler_DenTown_Center_F50
    .word EventHandler_DenTown_Center_F50


_ts MapSetup_DenTown_Center_F50
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrb       r0,[r7,#0x6]
    cmp        r0,#0x53
    bge        LAB_08036bc2
    push       {r5}
    ldr        r7,PTR_NPCList_8038F90_08036c74
    bl         Map_LoadNPCList
    pop        {r5}
    b          LAB_08036bcc
LAB_08036bc2:
    push       {r5}
    ldr        r7,PTR_NPCList_8039044_08036c78
    bl         Map_LoadNPCList
    pop        {r5}
LAB_08036bcc:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_DenTown_Center_F50
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_DenTown_Center_F50_0_08036c7c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_DenTown_Center_F50_0_08036be4:
    .word EventHandler_DenTown_Center_F50_0


_ts EventHandler_DenTown_Center_F50_0
    push       {lr}
    mov        r0,#0x97
    bl         Flag_GetBase
    bne        LAB_08036c06
    mov        r0,#0x95
    bl         Flag_GetBase
    beq        LAB_08036c06
    push       {r5}
    ldr        r0,PTR_Scene_Dentown_Center_Chaud_Undernet_08036c80
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_08036c06:
    bl         FUN_08036c0c
    pop        {pc}


_ts FUN_08036c0c
    push       {lr}
    bl         Scene_IsSceneActive
    tst        r0,r0
    beq        LAB_08036c18
    pop        {pc}
LAB_08036c18:
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    mov        r1,#0x8
    strh       r1,[r0,#0x2e]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldr        r7,[r7,#0x28]
    mov        r1,#0x0
    strh       r1,[r7,#0x2e]
    pop        {r5}
    cmp        r0,#0x40
    bne        LAB_08036c64
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08036c64
    mov        r0,r10
    ldr        r0,[r0,#0x4]
    ldrh       r0,[r0,#0x2]
    ldr        r1,DAT_08036c84
    and        r1,r0
    beq        LAB_08036c64
    bl         dummy_187a0
    bne        LAB_08036c64
    push       {r5}
    ldr        r0,PTR_Scene_JackIn_08036c88
    mov        r1,#0x29
    bl         Scene_Prepare
    pop        {r5}
LAB_08036c64:
    pop        {pc}

    .align 2, 0

PTR_PTR_MapSetup_DenTown_Center_F50_08036c68:
    .word PTR_MapSetup_DenTown_Center_F50_08036b48

PTR_EntityAllocParams_8039828_08036c6c:
    .word EntityAllocParams_8039828

PTR_PTR_EventHandler_DenTown_Center_F50_08036c70:
    .word PTR_EventHandler_DenTown_Center_F50_08036b78

PTR_NPCList_8038F90_08036c74:
    .word NPCList_8038F90

PTR_NPCList_8039044_08036c78:
    .word NPCList_8039044

PTR_PTR_EventHandler_DenTown_Center_F50_0_08036c7c:
    .word PTR_EventHandler_DenTown_Center_F50_0_08036be4

PTR_Scene_Dentown_Center_Chaud_Undernet_08036c80:
    .word Scene_Dentown_Center_Chaud_Undernet

DAT_08036c84:
    .word 0x100

PTR_Scene_JackIn_08036c88:
    .word Scene_JackIn
