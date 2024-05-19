#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_ACDC_Dex_PC_S0
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,DAT_0804f458
    mov        lr,pc
    bx         r0 @ FUN_0804f386
    push       {r5}
    ldr        r0,PTR_BgTask_804EE48_0804f45c
    bl         BgTask_AddNew
    pop        {r5}
    pop        {pc}


_ts EventHandler_ACDC_Dex_PC_S0
    push       {lr}
    ldr        r0,DAT_0804f460
    mov        lr,pc
    bx         r0 @ FUN_0804f40a
    pop        {pc}


_nt FUN_0804f386
    push       {lr}
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_0804f39e
    push       {r5}
    mov        r0,#0x10
    bl         Flag_Clear280
    pop        {r5}
LAB_0804f39e:
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_804F6D4_0804f464
    bl         Entity_AllocList
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_804F5FC_0804f468
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    bne        LAB_0804f3d8
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_0804f3e4
LAB_0804f3d8:
    push       {r5}
    ldr        r0,PTR_FUN_08084070_0804f46c
    ldr        r1,PTR_DAT_0804f470
    bl         Scene_Prepare
    pop        {r5}
LAB_0804f3e4:
    mov        r0,#0x8
    bl         Flag_GetBase
    beq        LAB_0804f3fa
    mov        r0,#0xe
    bl         Flag_GetBase
    bne        LAB_0804f404
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}
LAB_0804f3fa:
    mov        r0,#0x0
    bl         Flag_Set410
    mov        r0,#0x4
    b          LAB_0804f406
LAB_0804f404:
    mov        r0,#0x8
LAB_0804f406:
    str        r0,[r5,#0x0]
    pop        {pc}


_nt FUN_0804f40a
    push       {lr}
    ldr        r0,PTR_PTR_FUN_0804f428_0804f474
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_FUN_0804f428_0804f41c:
    .word FUN_0804f428
    .word FUN_0804f442
    .word FUN_0804f44c


_ts FUN_0804f428
    push       {lr}
    push       {r5}
    mov        r1,#0x1
    ldr        r0,DAT_0804f478
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x4
    str        r0,[r5,#0x0]
    mov        r0,#0xe
    bl         Flag_SetBase
    pop        {pc}


_nt FUN_0804f442
    push       {lr}
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}


_ts FUN_0804f44c
    push       {lr}
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}

    .align 2, 0

DAT_0804f458:
    .word FUN_0804f386

PTR_BgTask_804EE48_0804f45c:
    .word BgTask_804EE48

DAT_0804f460:
    .word FUN_0804f40a

PTR_EntityAllocParams_804F6D4_0804f464:
    .word EntityAllocParams_804F6D4

PTR_NPCList_804F5FC_0804f468:
    .word NPCList_804F5FC

PTR_FUN_08084070_0804f46c:
    .word 0x8084071

PTR_DAT_0804f470:
    .word 0x2000

PTR_PTR_FUN_0804f428_0804f474:
    .word PTR_FUN_0804f428_0804f41c

DAT_0804f478:
    .word 0x80848FD
