#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_Other_Recycled_PET_Comp_S0
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,DAT_08050bc8
    mov        lr,pc
    bx         r0 @ FUN_08050b78
    push       {r5}
    ldr        r0,PTR_BgTask_805033C_08050bcc
    bl         BgTask_AddNew
    pop        {r5}
    pop        {pc}


_ts EventHandler_Other_Recycled_PET_Comp_S0
    push       {lr}
    ldr        r0,DAT_08050bd0
    mov        lr,pc
    bx         r0 @ FUN_08050bb0
    mov        r0,#0xb
    bl         CheckForJackOut
    pop        {pc}


_ts FUN_08050b78
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_NPCList_80511C0_08050bd4
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_08050baa
    push       {r5}
    ldr        r0,PTR_Scene_MegaManJackIn_08050bd8
    ldr        r1,PTR_DAT_08050bdc
    bl         Scene_Prepare
    pop        {r5}
LAB_08050baa:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts FUN_08050bb0
    push       {lr}
    ldr        r0,PTR_PTR_FUN_08050bc4_08050be0
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_FUN_08050bc4_08050bc0:
    .word FUN_08050bc4


_ts FUN_08050bc4
    push       {lr}
    pop        {pc}

DAT_08050bc8:
    .word FUN_08050b78

PTR_BgTask_805033C_08050bcc:
    .word BgTask_805033C

DAT_08050bd0:
    .word FUN_08050bb0

PTR_NPCList_80511C0_08050bd4:
    .word NPCList_80511C0

PTR_Scene_MegaManJackIn_08050bd8:
    .word Scene_MegaManJackIn

PTR_DAT_08050bdc:
    .word 0x2000

PTR_PTR_FUN_08050bc4_08050be0:
    .word PTR_FUN_08050bc4_08050bc0
