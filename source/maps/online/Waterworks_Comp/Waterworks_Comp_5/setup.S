#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_Waterworks_Comp_5_S2
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,PTR_PTR_MapSetup_Default_080466d8
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    mov        r0,#0xcc
    bl         Flag_GetBase
    bne        LAB_080465a0
    ldr        r0,PTR_BgTask_8044198_080466dc
    bl         BgTask_AddNew
    b          LAB_080465ac
LAB_080465a0:
    ldr        r0,PTR_BgTask_80442E8_080466e0
    bl         BgTask_AddNew
    ldr        r0,DAT_080466e4
    bl         BgTask_AddNew
LAB_080465ac:
    ldr        r0,PTR_BgTask_80443D8_080466e8
    bl         BgTask_AddNew
    ldr        r0,PTR_EntityAllocParams_80471B8_080466ec
    bl         Entity_AllocList
    pop        {r5}
    mov        r0,#0xec
    bl         Flag_GetBase
    bne        LAB_080465e0
    push       {r5}
    mov        r0,#0x8
    bl         Flag_SetIgnore
    pop        {r5}
    mov        r0,#0xf2
    bl         Flag_GetBase
    bne        LAB_080465ea
    push       {r5}
    mov        r0,#0x0
    bl         Flag_SetIgnore
    pop        {r5}
    b          LAB_080465ea
LAB_080465e0:
    push       {r5}
    mov        r0,#0x0
    bl         Flag_SetIgnore
    pop        {r5}
LAB_080465ea:
    mov        r0,#0xed
    bl         Flag_GetBase
    bne        LAB_08046610
    push       {r5}
    mov        r0,#0x9
    bl         Flag_SetIgnore
    pop        {r5}
    mov        r0,#0xf3
    bl         Flag_GetBase
    bne        LAB_0804661a
    push       {r5}
    mov        r0,#0x1
    bl         Flag_SetIgnore
    pop        {r5}
    b          LAB_0804661a
LAB_08046610:
    push       {r5}
    mov        r0,#0x1
    bl         Flag_SetIgnore
    pop        {r5}
LAB_0804661a:
    pop        {pc}

PTR_MapSetup_Default_0804661c:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Waterworks_Comp_5_F25
    .word MapSetup_Waterworks_Comp_5_F25
    .word MapSetup_Waterworks_Comp_5_F25


_ts EventHandler_Waterworks_Comp_5_S2
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Default_080466f0
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Default_08046648:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Waterworks_Comp_5_F25
    .word EventHandler_Waterworks_Comp_5_F25
    .word EventHandler_Waterworks_Comp_5_F25


_ts MapSetup_Waterworks_Comp_5_F25
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_8046E18_080466f4
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    bne        LAB_0804669a
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_080466a6
LAB_0804669a:
    push       {r5}
    ldr        r0,DAT_080466f8
    ldr        r1,PTR_DAT_080466fc
    bl         Scene_Prepare
    pop        {r5}
LAB_080466a6:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Waterworks_Comp_5_F25
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Waterworks_Comp_5_F25_0_08046700
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}

    .align 2, 0

PTR_EventHandler_Waterworks_Comp_5_F25_0_080466c4:
    .word EventHandler_Waterworks_Comp_5_F25_0


_ts EventHandler_Waterworks_Comp_5_F25_0
    push       {lr}
    bl         FUN_08045a8c
    beq        LAB_080466d6
    bl         FUN_08045ae0
    beq        LAB_080466d6
LAB_080466d6:
    pop        {pc}

PTR_PTR_MapSetup_Default_080466d8:
    .word PTR_MapSetup_Default_0804661c

PTR_BgTask_8044198_080466dc:
    .word BgTask_8044198

PTR_BgTask_80442E8_080466e0:
    .word BgTask_80442E8

DAT_080466e4:
    .word BgTask_8044318

PTR_BgTask_80443D8_080466e8:
    .word BgTask_80443D8

PTR_EntityAllocParams_80471B8_080466ec:
    .word EntityAllocParams_80471B8

PTR_PTR_EventHandler_Default_080466f0:
    .word PTR_EventHandler_Default_08046648

PTR_NPCList_8046E18_080466f4:
    .word NPCList_8046E18

DAT_080466f8:
    .word Scene_MegaManJackIn

PTR_DAT_080466fc:
    .word 0x2000

PTR_PTR_EventHandler_Waterworks_Comp_5_F25_0_08046700:
    .word PTR_EventHandler_Waterworks_Comp_5_F25_0_080466c4


_ts MapSetup_Waterworks_Comp_5_S3
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,PTR_PTR_MapSetup_Waterworks_Comp_5_F30_080467fc
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_80442E8_08046800
    bl         BgTask_AddNew
    ldr        r0,DAT_08046804
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_80443D8_08046808
    bl         BgTask_AddNew
    ldr        r0,PTR_EntityAllocParams_80471B8_0804680c
    bl         Entity_AllocList
    mov        r0,#0x8
    bl         Flag_SetIgnore
    mov        r0,#0x9
    bl         Flag_SetIgnore
    pop        {r5}
    pop        {pc}

PTR_MapSetup_Waterworks_Comp_5_F30_08046740:
    .word MapSetup_Waterworks_Comp_5_F30
    .word MapSetup_Waterworks_Comp_5_F30
    .word MapSetup_Waterworks_Comp_5_F30
    .word MapSetup_Waterworks_Comp_5_F30
    .word MapSetup_Waterworks_Comp_5_F30
    .word MapSetup_Waterworks_Comp_5_F30
    .word MapSetup_Waterworks_Comp_5_F30
    .word MapSetup_Waterworks_Comp_5_F30


_ts EventHandler_Waterworks_Comp_5_S3
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Waterworks_Comp_5_F30_08046810
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Waterworks_Comp_5_F30_0804676c:
    .word EventHandler_Waterworks_Comp_5_F30
    .word EventHandler_Waterworks_Comp_5_F30
    .word EventHandler_Waterworks_Comp_5_F30
    .word EventHandler_Waterworks_Comp_5_F30
    .word EventHandler_Waterworks_Comp_5_F30
    .word EventHandler_Waterworks_Comp_5_F30
    .word EventHandler_Waterworks_Comp_5_F30
    .word EventHandler_Waterworks_Comp_5_F30


_ts MapSetup_Waterworks_Comp_5_F30
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_8046E10_08046814
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    bne        LAB_080467be
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_080467ca
LAB_080467be:
    push       {r5}
    ldr        r0,DAT_08046818
    ldr        r1,PTR_DAT_0804681c
    bl         Scene_Prepare
    pop        {r5}
LAB_080467ca:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Waterworks_Comp_5_F30
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Waterworks_Comp_5_F30_0_08046820
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}

    .align 2, 0

PTR_EventHandler_Waterworks_Comp_5_F30_0_080467e8:
    .word EventHandler_Waterworks_Comp_5_F30_0


_ts EventHandler_Waterworks_Comp_5_F30_0
    push       {lr}
    bl         FUN_08045a8c
    beq        LAB_080467fa
    bl         FUN_08045b3c
    beq        LAB_080467fa
LAB_080467fa:
    pop        {pc}

PTR_PTR_MapSetup_Waterworks_Comp_5_F30_080467fc:
    .word PTR_MapSetup_Waterworks_Comp_5_F30_08046740

PTR_BgTask_80442E8_08046800:
    .word BgTask_80442E8

DAT_08046804:
    .word BgTask_8044318

PTR_BgTask_80443D8_08046808:
    .word BgTask_80443D8

PTR_EntityAllocParams_80471B8_0804680c:
    .word EntityAllocParams_80471B8

PTR_PTR_EventHandler_Waterworks_Comp_5_F30_08046810:
    .word PTR_EventHandler_Waterworks_Comp_5_F30_0804676c

PTR_NPCList_8046E10_08046814:
    .word NPCList_8046E10

DAT_08046818:
    .word Scene_MegaManJackIn

PTR_DAT_0804681c:
    .word 0x2000

PTR_PTR_EventHandler_Waterworks_Comp_5_F30_0_08046820:
    .word PTR_EventHandler_Waterworks_Comp_5_F30_0_080467e8
