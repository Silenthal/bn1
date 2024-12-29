#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_Waterworks_Comp_4_S2
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,PTR_PTR_MapSetup_Default_0804642c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    mov        r0,#0xcc
    bl         Flag_GetBase
    bne        LAB_080462e0
    ldr        r0,PTR_BgTask_8044168_08046430
    bl         BgTask_AddNew
    b          LAB_080462ec
LAB_080462e0:
    ldr        r0,PTR_BgTask_80442E8_08046434
    bl         BgTask_AddNew
    ldr        r0,DAT_08046438
    bl         BgTask_AddNew
LAB_080462ec:
    pop        {r5}
    pop        {pc}

PTR_MapSetup_Default_080462f0:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Waterworks_Comp_4_F25
    .word MapSetup_Waterworks_Comp_4_F25
    .word MapSetup_Waterworks_Comp_4_F25


_ts EventHandler_Waterworks_Comp_4_S2
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Default_0804643c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Default_0804631c:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Waterworks_Comp_4_F25
    .word EventHandler_Waterworks_Comp_4_F25
    .word EventHandler_Waterworks_Comp_4_F25


_ts MapSetup_Waterworks_Comp_4_F25
    push       {lr}
    push       {r5}
    mov        r0,#0xb8
    bl         Flag_GetBase
    beq        LAB_08046356
    ldr        r0,PTR_BgTask_8044048_08046440
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8044060_08046444
    bl         BgTask_AddNew
    b          LAB_0804635c
LAB_08046356:
    ldr        r0,PTR_BgTask_8044030_08046448
    bl         BgTask_AddNew
LAB_0804635c:
    pop        {r5}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_8046DE4_0804644c
    bl         Map_LoadNPCList
    pop        {r5}
    LoadMain world, r0, r0
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    bne        LAB_0804638e
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_0804639a
LAB_0804638e:
    push       {r5}
    ldr        r0,DAT_08046450
    ldr        r1,PTR_DAT_08046454
    bl         Scene_Prepare
    pop        {r5}
LAB_0804639a:
    mov        r0,#0xb7
    bl         Flag_GetBase
    beq        LAB_080463c2
    mov        r0,#0xb8
    bl         Flag_GetBase
    bne        LAB_080463be
    LoadMain world, r0, r0
    mov        r1,#0x0
    strb       r1,[r0,#0x7]
    push       {r5}
    ldr        r0,PTR_Scene_Story_2C_08046458
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_080463be:
    mov        r0,#0x4
    b          LAB_080463c4
LAB_080463c2:
    mov        r0,#0x0
LAB_080463c4:
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Waterworks_Comp_4_F25
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Waterworks_Comp_4_F25_0_0804645c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}

    .align 2, 0

PTR_EventHandler_Waterworks_Comp_4_F25_0_080463e0:
    .word EventHandler_Waterworks_Comp_4_F25_0
    .word EventHandler_Waterworks_Comp_4_F25_1


_ts EventHandler_Waterworks_Comp_4_F25_0
    push       {lr}
    bl         FUN_08045a8c
    beq        LAB_0804641e
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x18
    bne        LAB_0804641e
    mov        r0,#0xb7
    bl         Flag_GetBase
    bne        LAB_0804641e
    mov        r0,#0xb7
    bl         Flag_SetBase
    push       {r5}
    ldr        r0,DAT_08046460
    mov        r1,#0x6
    bl         Scene_Prepare
    pop        {r5}
LAB_0804641e:
    pop        {pc}


_ts EventHandler_Waterworks_Comp_4_F25_1
    push       {lr}
    bl         FUN_08045a8c
    beq        LAB_08046428
LAB_08046428:
    pop        {pc}

    .align 2, 0

PTR_PTR_MapSetup_Default_0804642c:
    .word PTR_MapSetup_Default_080462f0

PTR_BgTask_8044168_08046430:
    .word BgTask_8044168

PTR_BgTask_80442E8_08046434:
    .word BgTask_80442E8

DAT_08046438:
    .word BgTask_8044318

PTR_PTR_EventHandler_Default_0804643c:
    .word PTR_EventHandler_Default_0804631c

PTR_BgTask_8044048_08046440:
    .word BgTask_8044048

PTR_BgTask_8044060_08046444:
    .word BgTask_8044060

PTR_BgTask_8044030_08046448:
    .word BgTask_8044030

PTR_NPCList_8046DE4_0804644c:
    .word NPCList_8046DE4

DAT_08046450:
    .word Scene_MegaManJackIn

PTR_DAT_08046454:
    .word 0x2000

PTR_Scene_Story_2C_08046458:
    .word Scene_Story_2C

PTR_PTR_EventHandler_Waterworks_Comp_4_F25_0_0804645c:
    .word PTR_EventHandler_Waterworks_Comp_4_F25_0_080463e0

DAT_08046460:
    .word Scene_StartFixedBattle


_ts MapSetup_Waterworks_Comp_4_S3
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,PTR_PTR_MapSetup_Waterworks_Comp_4_F30_08046554
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_80442E8_08046558
    bl         BgTask_AddNew
    ldr        r0,DAT_0804655c
    bl         BgTask_AddNew
    pop        {r5}
    pop        {pc}

PTR_MapSetup_Waterworks_Comp_4_F30_08046488:
    .word MapSetup_Waterworks_Comp_4_F30
    .word MapSetup_Waterworks_Comp_4_F30
    .word MapSetup_Waterworks_Comp_4_F30
    .word MapSetup_Waterworks_Comp_4_F30
    .word MapSetup_Waterworks_Comp_4_F30
    .word MapSetup_Waterworks_Comp_4_F30
    .word MapSetup_Waterworks_Comp_4_F30
    .word MapSetup_Waterworks_Comp_4_F30


_ts EventHandler_Waterworks_Comp_4_S3
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Waterworks_Comp_4_F30_08046560
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Waterworks_Comp_4_F30_080464b4:
    .word EventHandler_Waterworks_Comp_4_F30
    .word EventHandler_Waterworks_Comp_4_F30
    .word EventHandler_Waterworks_Comp_4_F30
    .word EventHandler_Waterworks_Comp_4_F30
    .word EventHandler_Waterworks_Comp_4_F30
    .word EventHandler_Waterworks_Comp_4_F30
    .word EventHandler_Waterworks_Comp_4_F30
    .word EventHandler_Waterworks_Comp_4_F30


_ts MapSetup_Waterworks_Comp_4_F30
    push       {lr}
    push       {r5}
    ldr        r0,PTR_BgTask_8044048_08046564
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8044060_08046568
    bl         BgTask_AddNew
    pop        {r5}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_8046DE4_0804656c
    bl         Map_LoadNPCList
    pop        {r5}
    LoadMain world, r0, r0
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    bne        LAB_08046516
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_08046522
LAB_08046516:
    push       {r5}
    ldr        r0,DAT_08046570
    ldr        r1,PTR_DAT_08046574
    bl         Scene_Prepare
    pop        {r5}
LAB_08046522:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Waterworks_Comp_4_F30
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Waterworks_Comp_4_F30_0_08046578
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}

    .align 2, 0

PTR_EventHandler_Waterworks_Comp_4_F30_0_08046540:
    .word EventHandler_Waterworks_Comp_4_F30_0


_ts EventHandler_Waterworks_Comp_4_F30_0
    push       {lr}
    bl         FUN_08045a8c
    beq        LAB_08046552
    bl         FUN_08045b3c
    beq        LAB_08046552
LAB_08046552:
    pop        {pc}

PTR_PTR_MapSetup_Waterworks_Comp_4_F30_08046554:
    .word PTR_MapSetup_Waterworks_Comp_4_F30_08046488

PTR_BgTask_80442E8_08046558:
    .word BgTask_80442E8

DAT_0804655c:
    .word BgTask_8044318

PTR_PTR_EventHandler_Waterworks_Comp_4_F30_08046560:
    .word PTR_EventHandler_Waterworks_Comp_4_F30_080464b4

PTR_BgTask_8044048_08046564:
    .word BgTask_8044048

PTR_BgTask_8044060_08046568:
    .word BgTask_8044060

PTR_NPCList_8046DE4_0804656c:
    .word NPCList_8046DE4

DAT_08046570:
    .word Scene_MegaManJackIn

PTR_DAT_08046574:
    .word 0x2000

PTR_PTR_EventHandler_Waterworks_Comp_4_F30_0_08046578:
    .word PTR_EventHandler_Waterworks_Comp_4_F30_0_08046540
