#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_ACDC_Lan_PC_S0
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,PTR_FUN_0804f032_0804f0e0
    mov        lr,pc
    bx         r0 @ FUN_0804f032
    push       {r5}
    ldr        r0,PTR_BgTask_804EDA8_0804f0e4
    bl         BgTask_AddNew
    pop        {r5}
    pop        {pc}


_ts EventHandler_ACDC_Lan_PC_S0
    push       {lr}
    ldr        r0,PTR_FUN_0804f0a0_0804f0e8
    mov        lr,pc
    bx         r0 @ FUN_0804f0a0
    pop        {pc}


_nt FUN_0804f032
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_804F650_0804f0ec
    bl         Entity_AllocList
    pop        {r5}
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r1,[r0,#0x6]
    cmp        r1,#0x30
    bne        LAB_0804f070
    mov        r0,#0x91
    bl         Flag_GetBase
    bne        LAB_0804f070
    push       {r5}
    ldr        r0,PTR_Scene_Story_36_0804f0f0
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_0804f09a
LAB_0804f070:
    push       {r5}
    ldr        r7,PTR_NPCList_804F47C_0804f0f4
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    bne        LAB_0804f08e
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_0804f09a
LAB_0804f08e:
    push       {r5}
    ldr        r0,PTR_Scene_MegaManJackIn_0804f0f8
    ldr        r1,PTR_DAT_0804f0fc
    bl         Scene_Prepare
    pop        {r5}
LAB_0804f09a:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts FUN_0804f0a0
    push       {lr}
    ldr        r0,PTR_PTR_FUN_0804f0b4_0804f100
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_FUN_0804f0b4_0804f0b0:
    .word FUN_0804f0b4


_ts FUN_0804f0b4
    push       {lr}
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r1,[r0,#0x6]
    cmp        r1,#0x30
    bne        LAB_0804f0d6
    mov        r0,#0x9
    bl         Flag_GetEmailRecieved
    bne        LAB_0804f0d6
    push       {r5}
    ldr        r0,DAT_0804f104
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0804f0d6:
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}

    .align 2, 0

PTR_FUN_0804f032_0804f0e0:
    .word FUN_0804f032

PTR_BgTask_804EDA8_0804f0e4:
    .word BgTask_804EDA8

PTR_FUN_0804f0a0_0804f0e8:
    .word FUN_0804f0a0

PTR_EntityAllocParams_804F650_0804f0ec:
    .word EntityAllocParams_804F650

PTR_Scene_Story_36_0804f0f0:
    .word Scene_Story_36

PTR_NPCList_804F47C_0804f0f4:
    .word NPCList_804F47C

PTR_Scene_MegaManJackIn_0804f0f8:
    .word Scene_MegaManJackIn

PTR_DAT_0804f0fc:
    .word 0x2000

PTR_PTR_FUN_0804f0b4_0804f100:
    .word PTR_FUN_0804f0b4_0804f0b0

DAT_0804f104:
    .word Scene_CheckMail
