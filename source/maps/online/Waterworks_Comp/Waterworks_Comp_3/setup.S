#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_Waterworks_Comp_3_S2
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,PTR_PTR_MapSetup_Default_0804614c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    mov        r0,#0xcc
    bl         Flag_GetBase
    bne        LAB_08046008
    ldr        r0,PTR_BgTask_8044108_08046150
    bl         BgTask_AddNew
    b          LAB_08046014
LAB_08046008:
    ldr        r0,PTR_BgTask_80442E8_08046154
    bl         BgTask_AddNew
    ldr        r0,DAT_08046158
    bl         BgTask_AddNew
LAB_08046014:
    ldr        r0,PTR_EntityAllocParams_8047100_0804615c
    bl         Entity_AllocList
    pop        {r5}
    mov        r0,#0xe8
    bl         Flag_GetBase
    beq        LAB_0804602e
    push       {r5}
    mov        r0,#0x4
    bl         Flag_SetIgnore
    pop        {r5}
LAB_0804602e:
    mov        r0,#0xe9
    bl         Flag_GetBase
    beq        LAB_08046040
    push       {r5}
    mov        r0,#0x5
    bl         Flag_SetIgnore
    pop        {r5}
LAB_08046040:
    mov        r0,#0xea
    bl         Flag_GetBase
    beq        LAB_08046052
    push       {r5}
    mov        r0,#0x6
    bl         Flag_SetIgnore
    pop        {r5}
LAB_08046052:
    mov        r0,#0xeb
    bl         Flag_GetBase
    bne        LAB_08046064
    push       {r5}
    mov        r0,#0x7
    bl         Flag_SetIgnore
    pop        {r5}
LAB_08046064:
    mov        r0,#0xf1
    bl         Flag_GetBase
    bne        LAB_0804607e
    push       {r5}
    ldr        r0,PTR_BgTask_8044348_08046160
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8044378_08046164
    bl         BgTask_AddNew
    pop        {r5}
    b          LAB_0804608e
LAB_0804607e:
    push       {r5}
    ldr        r0,PTR_BgTask_8044360_08046168
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8044390_0804616c
    bl         BgTask_AddNew
    pop        {r5}
LAB_0804608e:
    pop        {pc}

PTR_MapSetup_Default_08046090:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Waterworks_Comp_3_F25
    .word MapSetup_Waterworks_Comp_3_F25
    .word MapSetup_Waterworks_Comp_3_F25


_ts EventHandler_Waterworks_Comp_3_S2
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Default_08046170
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Default_080460bc:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Waterworks_Comp_3_F25
    .word EventHandler_Waterworks_Comp_3_F25
    .word EventHandler_Waterworks_Comp_3_F25


_ts MapSetup_Waterworks_Comp_3_F25
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_8046D60_08046174
    bl         Map_LoadNPCList
    pop        {r5}
    LoadMain world, r0, r0
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    bne        LAB_0804610e
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_0804611a
LAB_0804610e:
    push       {r5}
    ldr        r0,DAT_08046178
    ldr        r1,PTR_DAT_0804617c
    bl         Scene_Prepare
    pop        {r5}
LAB_0804611a:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Waterworks_Comp_3_F25
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Waterworks_Comp_3_F25_0_08046180
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}

    .align 2, 0

PTR_EventHandler_Waterworks_Comp_3_F25_0_08046138:
    .word EventHandler_Waterworks_Comp_3_F25_0


_ts EventHandler_Waterworks_Comp_3_F25_0
    push       {lr}
    bl         FUN_08045a8c
    beq        LAB_0804614a
    bl         FUN_08045ae0
    beq        LAB_0804614a
LAB_0804614a:
    pop        {pc}

PTR_PTR_MapSetup_Default_0804614c:
    .word PTR_MapSetup_Default_08046090

PTR_BgTask_8044108_08046150:
    .word BgTask_8044108

PTR_BgTask_80442E8_08046154:
    .word BgTask_80442E8

DAT_08046158:
    .word BgTask_8044318

PTR_EntityAllocParams_8047100_0804615c:
    .word EntityAllocParams_8047100

PTR_BgTask_8044348_08046160:
    .word BgTask_8044348

PTR_BgTask_8044378_08046164:
    .word BgTask_8044378

PTR_BgTask_8044360_08046168:
    .word BgTask_8044360

PTR_BgTask_8044390_0804616c:
    .word BgTask_8044390

PTR_PTR_EventHandler_Default_08046170:
    .word PTR_EventHandler_Default_080460bc

PTR_NPCList_8046D60_08046174:
    .word NPCList_8046D60

DAT_08046178:
    .word Scene_MegaManJackIn

PTR_DAT_0804617c:
    .word 0x2000

PTR_PTR_EventHandler_Waterworks_Comp_3_F25_0_08046180:
    .word PTR_EventHandler_Waterworks_Comp_3_F25_0_08046138


_ts MapSetup_Waterworks_Comp_3_S3
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,PTR_PTR_MapSetup_Waterworks_Comp_3_F30_08046290
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_80442E8_08046294
    bl         BgTask_AddNew
    ldr        r0,DAT_08046298
    bl         BgTask_AddNew
    ldr        r0,PTR_EntityAllocParams_8047100_0804629c
    bl         Entity_AllocList
    mov        r0,#0x4
    bl         Flag_SetIgnore
    mov        r0,#0x5
    bl         Flag_SetIgnore
    mov        r0,#0x6
    bl         Flag_SetIgnore
    mov        r0,#0x7
    bl         Flag_SetIgnore
    ldr        r0,PTR_BgTask_8044360_080462a0
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8044390_080462a4
    bl         BgTask_AddNew
    pop        {r5}
    pop        {pc}

    .align 2, 0

PTR_MapSetup_Waterworks_Comp_3_F30_080461d4:
    .word MapSetup_Waterworks_Comp_3_F30
    .word MapSetup_Waterworks_Comp_3_F30
    .word MapSetup_Waterworks_Comp_3_F30
    .word MapSetup_Waterworks_Comp_3_F30
    .word MapSetup_Waterworks_Comp_3_F30
    .word MapSetup_Waterworks_Comp_3_F30
    .word MapSetup_Waterworks_Comp_3_F30
    .word MapSetup_Waterworks_Comp_3_F30


_ts EventHandler_Waterworks_Comp_3_S3
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Waterworks_Comp_3_F30_080462a8
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Waterworks_Comp_3_F30_08046200:
    .word EventHandler_Waterworks_Comp_3_F30
    .word EventHandler_Waterworks_Comp_3_F30
    .word EventHandler_Waterworks_Comp_3_F30
    .word EventHandler_Waterworks_Comp_3_F30
    .word EventHandler_Waterworks_Comp_3_F30
    .word EventHandler_Waterworks_Comp_3_F30
    .word EventHandler_Waterworks_Comp_3_F30
    .word EventHandler_Waterworks_Comp_3_F30


_ts MapSetup_Waterworks_Comp_3_F30
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_8046D60_080462ac
    bl         Map_LoadNPCList
    pop        {r5}
    LoadMain world, r0, r0
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    bne        LAB_08046252
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_0804625e
LAB_08046252:
    push       {r5}
    ldr        r0,DAT_080462b0
    ldr        r1,PTR_DAT_080462b4
    bl         Scene_Prepare
    pop        {r5}
LAB_0804625e:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Waterworks_Comp_3_F30
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Waterworks_Comp_3_F30_0_080462b8
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}

    .align 2, 0

PTR_EventHandler_Waterworks_Comp_3_F30_0_0804627c:
    .word EventHandler_Waterworks_Comp_3_F30_0


_ts EventHandler_Waterworks_Comp_3_F30_0
    push       {lr}
    bl         FUN_08045a8c
    beq        LAB_0804628e
    bl         FUN_08045b3c
    beq        LAB_0804628e
LAB_0804628e:
    pop        {pc}

PTR_PTR_MapSetup_Waterworks_Comp_3_F30_08046290:
    .word PTR_MapSetup_Waterworks_Comp_3_F30_080461d4

PTR_BgTask_80442E8_08046294:
    .word BgTask_80442E8

DAT_08046298:
    .word BgTask_8044318

PTR_EntityAllocParams_8047100_0804629c:
    .word EntityAllocParams_8047100

PTR_BgTask_8044360_080462a0:
    .word BgTask_8044360

PTR_BgTask_8044390_080462a4:
    .word BgTask_8044390

PTR_PTR_EventHandler_Waterworks_Comp_3_F30_080462a8:
    .word PTR_EventHandler_Waterworks_Comp_3_F30_08046200

PTR_NPCList_8046D60_080462ac:
    .word NPCList_8046D60

DAT_080462b0:
    .word Scene_MegaManJackIn

PTR_DAT_080462b4:
    .word 0x2000

PTR_PTR_EventHandler_Waterworks_Comp_3_F30_0_080462b8:
    .word PTR_EventHandler_Waterworks_Comp_3_F30_0_0804627c
