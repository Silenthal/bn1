#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set PlayerLocation_Create, 0x8056020+1


_ts MapSetup_ACDC_Mayl_PC_S0
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,DAT_0804f21c
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_804EDD8_0804f220
    bl         BgTask_AddNew
    pop        {r5}
    pop        {pc}


_ts EventHandler_ACDC_Mayl_PC_S0
    push       {lr}
    ldr        r0,DAT_0804f224
    mov        lr,pc
    bx         r0
    pop        {pc}


_nt FUN_0804f12e
    push       {lr}
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_0804f146
    push       {r5}
    mov        r0,#0xc
    bl         Flag_Clear280
    pop        {r5}
LAB_0804f146:
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_804F67C_0804f228
    bl         Entity_AllocList
    pop        {r5}
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    bne        LAB_0804f176
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_0804f182
LAB_0804f176:
    push       {r5}
    ldr        r0,PTR_FUN_08084070_0804f22c
    ldr        r1,PTR_DAT_0804f230
    bl         Scene_Prepare
    pop        {r5}
LAB_0804f182:
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r1,[r0,#0x6]
    cmp        r1,#0x30
    bne        LAB_0804f1a0
    mov        r0,#0x95
    bl         Flag_GetBase
    bne        LAB_0804f1a0
    push       {r5}
    ldr        r7,PTR_NPCList_804F530_0804f234
    bl         Map_LoadNPCList
    pop        {r5}
    b          LAB_0804f1aa
LAB_0804f1a0:
    push       {r5}
    ldr        r7,PTR_NPCList_804F4DC_0804f238
    bl         Map_LoadNPCList
    pop        {r5}
LAB_0804f1aa:
    mov        r0,#0x6
    bl         Flag_GetBase
    beq        LAB_0804f1c0
    mov        r0,#0xc
    bl         Flag_GetBase
    bne        LAB_0804f1ca
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}
LAB_0804f1c0:
    mov        r0,#0x0
    bl         Flag_Set410
    mov        r0,#0x4
    b          LAB_0804f1cc
LAB_0804f1ca:
    mov        r0,#0x8
LAB_0804f1cc:
    str        r0,[r5,#0x0]
    pop        {pc}


_ts FUN_0804f1d0
    push       {lr}
    ldr        r0,PTR_PTR_FUN_0804f1ec_0804f23c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_FUN_0804f1ec_0804f1e0:
    .word FUN_0804f1ec
    .word FUN_0804f206
    .word FUN_0804f210


_ts FUN_0804f1ec
    push       {lr}
    push       {r5}
    mov        r1,#0x1
    ldr        r0,DAT_0804f240
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x4
    str        r0,[r5,#0x0]
    mov        r0,#0xc
    bl         Flag_SetBase
    pop        {pc}


_nt FUN_0804f206
    push       {lr}
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}


_ts FUN_0804f210
    push       {lr}
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}

    .align 2, 0

DAT_0804f21c:
    .word FUN_0804f12e

PTR_BgTask_804EDD8_0804f220:
    .word BgTask_804EDD8

DAT_0804f224:
    .word FUN_0804f1d0

PTR_EntityAllocParams_804F67C_0804f228:
    .word EntityAllocParams_804F67C

PTR_FUN_08084070_0804f22c:
    .word 0x8084071

PTR_DAT_0804f230:
    .word 0x2000

PTR_NPCList_804F530_0804f234:
    .word NPCList_804F530

PTR_NPCList_804F4DC_0804f238:
    .word NPCList_804F4DC

PTR_PTR_FUN_0804f1ec_0804f23c:
    .word PTR_FUN_0804f1ec_0804f1e0

DAT_0804f240:
    .word 0x80848FD
