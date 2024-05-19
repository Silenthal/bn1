#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_Traffic_Light_Comp_1_S3
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,PTR_PTR_MapSetup_Default_08048190
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         FUN_08049958
    push       {r5}
    ldr        r0,PTR_BgTask_80474A4_08048194
    bl         BgTask_AddNew
    pop        {r5}
    pop        {pc}

    .align 2, 0

PTR_MapSetup_Default_08048030:
    .word MapSetup_Default
    .word MapSetup_Traffic_Light_Comp_1_F31
    .word MapSetup_Traffic_Light_Comp_1_F32
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default


_ts EventHandler_Traffic_Light_Comp_1_S3
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Default_08048198
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         FUN_080499a8
    pop        {pc}

PTR_EventHandler_Default_08048060:
    .word EventHandler_Default
    .word EventHandler_Traffic_Light_Comp_1_F31
    .word EventHandler_Traffic_Light_Comp_1_F32
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default


_ts MapSetup_Traffic_Light_Comp_1_F31
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_80490DC_0804819c
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    bne        LAB_080480b2
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_080480be
LAB_080480b2:
    push       {r5}
    ldr        r0,DAT_080481a0
    ldr        r1,PTR_DAT_080481a4
    bl         Scene_Prepare
    pop        {r5}
LAB_080480be:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Traffic_Light_Comp_1_F31
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Traffic_Light_Comp_1_F31_0_080481a8
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Traffic_Light_Comp_1_F31_0_080480d4:
    .word EventHandler_Traffic_Light_Comp_1_F31_0


_ts EventHandler_Traffic_Light_Comp_1_F31_0
    push       {lr}
    mov        r0,#0xa7
    bl         Flag_GetBase
    beq        LAB_080480f8
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    mov        r1,#0x32
    strb       r1,[r0,#0x6]
    push       {r5}
    ldr        r0,DAT_080481ac
    mov        r1,#0x12
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_080480f8:
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x20
    bne        LAB_0804810e
    push       {r5}
    ldr        r0,DAT_080481b0
    mov        r1,#0x3
    bl         Scene_Prepare
    pop        {r5}
LAB_0804810e:
    mov        r0,#0x8
    bl         CheckForJackOut
    pop        {pc}


_nt MapSetup_Traffic_Light_Comp_1_F32
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_8049160_080481b4
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    bne        LAB_08048148
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_08048154
LAB_08048148:
    push       {r5}
    ldr        r0,PTR_FUN_08084070_080481b8
    ldr        r1,PTR_DAT_080481a4
    bl         Scene_Prepare
    pop        {r5}
LAB_08048154:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_Traffic_Light_Comp_1_F32
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Traffic_Light_Comp_1_F32_0_080481bc
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_Traffic_Light_Comp_1_F32_0_0804816c:
    .word EventHandler_Traffic_Light_Comp_1_F32_0


_ts EventHandler_Traffic_Light_Comp_1_F32_0
    push       {lr}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x20
    bne        LAB_08048188
    push       {r5}
    ldr        r0,DAT_080481c0
    mov        r1,#0x3
    bl         Scene_Prepare
    pop        {r5}
LAB_08048188:
    mov        r0,#0x8
    bl         CheckForJackOut
    pop        {pc}

PTR_PTR_MapSetup_Default_08048190:
    .word PTR_MapSetup_Default_08048030

PTR_BgTask_80474A4_08048194:
    .word BgTask_80474A4

PTR_PTR_EventHandler_Default_08048198:
    .word PTR_EventHandler_Default_08048060

PTR_NPCList_80490DC_0804819c:
    .word NPCList_80490DC

DAT_080481a0:
    .word 0x8084071

PTR_DAT_080481a4:
    .word 0x2000

PTR_PTR_EventHandler_Traffic_Light_Comp_1_F31_0_080481a8:
    .word PTR_EventHandler_Traffic_Light_Comp_1_F31_0_080480d4

DAT_080481ac:
    .word 0x8087E35

DAT_080481b0:
    .word 0x80848FD

PTR_NPCList_8049160_080481b4:
    .word NPCList_8049160

PTR_FUN_08084070_080481b8:
    .word 0x8084071

PTR_PTR_EventHandler_Traffic_Light_Comp_1_F32_0_080481bc:
    .word PTR_EventHandler_Traffic_Light_Comp_1_F32_0_0804816c

DAT_080481c0:
    .word 0x80848FD


_ts MapSetup_Traffic_Light_Comp_1_S4
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,PTR_PTR_MapSetup_Traffic_Light_Comp_1_F40_080482b0
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         FUN_08049958
    push       {r5}
    ldr        r0,PTR_BgTask_80474A4_080482b4
    bl         BgTask_AddNew
    pop        {r5}
    pop        {pc}

    .align 2, 0

PTR_MapSetup_Traffic_Light_Comp_1_F40_080481e8:
    .word MapSetup_Traffic_Light_Comp_1_F40
    .word MapSetup_Traffic_Light_Comp_1_F40
    .word MapSetup_Traffic_Light_Comp_1_F40
    .word MapSetup_Traffic_Light_Comp_1_F40
    .word MapSetup_Traffic_Light_Comp_1_F40
    .word MapSetup_Traffic_Light_Comp_1_F40
    .word MapSetup_Traffic_Light_Comp_1_F40
    .word MapSetup_Traffic_Light_Comp_1_F40


_ts EventHandler_Traffic_Light_Comp_1_S4
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Traffic_Light_Comp_1_F40_080482b8
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         FUN_080499a8
    pop        {pc}

PTR_EventHandler_Traffic_Light_Comp_1_F40_08048218:
    .word EventHandler_Traffic_Light_Comp_1_F40
    .word EventHandler_Traffic_Light_Comp_1_F40
    .word EventHandler_Traffic_Light_Comp_1_F40
    .word EventHandler_Traffic_Light_Comp_1_F40
    .word EventHandler_Traffic_Light_Comp_1_F40
    .word EventHandler_Traffic_Light_Comp_1_F40
    .word EventHandler_Traffic_Light_Comp_1_F40
    .word EventHandler_Traffic_Light_Comp_1_F40


_ts MapSetup_Traffic_Light_Comp_1_F40
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_8049170_080482bc
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    bne        LAB_0804826a
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_08048276
LAB_0804826a:
    push       {r5}
    ldr        r0,DAT_080482c0
    ldr        r1,PTR_DAT_080482c4
    bl         Scene_Prepare
    pop        {r5}
LAB_08048276:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Traffic_Light_Comp_1_F40
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Traffic_Light_Comp_1_F40_0_080482c8
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Traffic_Light_Comp_1_F40_0_0804828c:
    .word EventHandler_Traffic_Light_Comp_1_F40_0


_ts EventHandler_Traffic_Light_Comp_1_F40_0
    push       {lr}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x20
    bne        LAB_080482a8
    push       {r5}
    ldr        r0,DAT_080482cc
    mov        r1,#0x3
    bl         Scene_Prepare
    pop        {r5}
LAB_080482a8:
    mov        r0,#0x8
    bl         CheckForJackOut
    pop        {pc}

PTR_PTR_MapSetup_Traffic_Light_Comp_1_F40_080482b0:
    .word PTR_MapSetup_Traffic_Light_Comp_1_F40_080481e8

PTR_BgTask_80474A4_080482b4:
    .word BgTask_80474A4

PTR_PTR_EventHandler_Traffic_Light_Comp_1_F40_080482b8:
    .word PTR_EventHandler_Traffic_Light_Comp_1_F40_08048218

PTR_NPCList_8049170_080482bc:
    .word NPCList_8049170

DAT_080482c0:
    .word 0x8084071

PTR_DAT_080482c4:
    .word 0x2000

PTR_PTR_EventHandler_Traffic_Light_Comp_1_F40_0_080482c8:
    .word PTR_EventHandler_Traffic_Light_Comp_1_F40_0_0804828c

DAT_080482cc:
    .word 0x80848FD
