#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_DenTown_Antique_Comp_S0
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,DAT_0804ffa8
    mov        lr,pc
    bx         r0 @ FUN_0804fede
    push       {r5}
    ldr        r0,PTR_BgTask_804FD64_0804ffac
    bl         BgTask_AddNew
    pop        {r5}
    pop        {pc}


_ts EventHandler_DenTown_Antique_Comp_S0
    push       {lr}
    ldr        r0,DAT_0804ffb0
    mov        lr,pc
    bx         r0 @ FUN_0804ff5a
    pop        {pc}


_nt FUN_0804fede
    push       {lr}
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_0804fef6
    push       {r5}
    mov        r0,#0x6e
    bl         Flag_Clear280
    pop        {r5}
LAB_0804fef6:
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r0,PTR_EntityAllocParams_8050020_0804ffb4
    bl         Entity_AllocList
    ldr        r7,PTR_NPCList_804FFCC_0804ffb8
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    bne        LAB_0804ff28
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_0804ff34
LAB_0804ff28:
    push       {r5}
    ldr        r0,PTR_Scene_MegaManJackIn_0804ffbc
    ldr        r1,PTR_DAT_0804ffc0
    bl         Scene_Prepare
    pop        {r5}
LAB_0804ff34:
    mov        r0,#0x4b
    bl         Flag_GetBase
    beq        LAB_0804ff4a
    mov        r0,#0x4f
    bl         Flag_GetBase
    bne        LAB_0804ff54
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}
LAB_0804ff4a:
    mov        r0,#0x0
    bl         Flag_Set410
    mov        r0,#0x4
    b          LAB_0804ff56
LAB_0804ff54:
    mov        r0,#0x8
LAB_0804ff56:
    str        r0,[r5,#0x0]
    pop        {pc}


_nt FUN_0804ff5a
    push       {lr}
    ldr        r0,PTR_PTR_FUN_0804ff78_0804ffc4
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_FUN_0804ff78_0804ff6c:
    .word FUN_0804ff78
    .word FUN_0804ff92
    .word FUN_0804ff9c


_ts FUN_0804ff78
    push       {lr}
    push       {r5}
    mov        r1,#0x1
    ldr        r0,DAT_0804ffc8
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x4
    str        r0,[r5,#0x0]
    mov        r0,#0x4f
    bl         Flag_SetBase
    pop        {pc}


_nt FUN_0804ff92
    push       {lr}
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}


_ts FUN_0804ff9c
    push       {lr}
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}

    .align 2, 0

DAT_0804ffa8:
    .word FUN_0804fede

PTR_BgTask_804FD64_0804ffac:
    .word BgTask_804FD64

DAT_0804ffb0:
    .word FUN_0804ff5a

PTR_EntityAllocParams_8050020_0804ffb4:
    .word EntityAllocParams_8050020

PTR_NPCList_804FFCC_0804ffb8:
    .word NPCList_804FFCC

PTR_Scene_MegaManJackIn_0804ffbc:
    .word Scene_MegaManJackIn

PTR_DAT_0804ffc0:
    .word 0x2000

PTR_PTR_FUN_0804ff78_0804ffc4:
    .word PTR_FUN_0804ff78_0804ff6c

DAT_0804ffc8:
    .word Scene_Dialogue
