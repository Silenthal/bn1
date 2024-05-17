#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set PlayerLocation_Create, 0x8056020+1
    .set Script_ShowDialogue, 0x80848FC+1


_ts MapSetup_Govt_Lunch_Cart_Comp_S2
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,PTR_FUN_0804fa9e_0804fb68
    mov        lr,pc
    bx         r0 @ FUN_0804fa9e
    push       {r5}
    ldr        r0,PTR_BgTask_804F7B8_0804fb6c
    bl         BgTask_AddNew
    pop        {r5}
    pop        {pc}


_ts EventHandler_Govt_Lunch_Cart_Comp_S2
    push       {lr}
    ldr        r0,PTR_FUN_0804fb1a_0804fb70
    mov        lr,pc
    bx         r0 @ FUN_0804fb1a
    pop        {pc}


_nt FUN_0804fa9e
    push       {lr}
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_0804fab6
    push       {r5}
    mov        r0,#0x34
    bl         Flag_Clear280
    pop        {r5}
LAB_0804fab6:
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r0,PTR_EntityAllocParams_804FD24_0804fb74
    bl         Entity_AllocList
    ldr        r7,PTR_NPCList_804FCA4_0804fb78
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    bne        LAB_0804fae8
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_0804faf4
LAB_0804fae8:
    push       {r5}
    ldr        r0,PTR_FUN_08084070_0804fb7c
    ldr        r1,PTR_DAT_0804fb80
    bl         Scene_Prepare
    pop        {r5}
LAB_0804faf4:
    mov        r0,#0x48
    bl         Flag_GetBase
    beq        LAB_0804fb0a
    mov        r0,#0x4c
    bl         Flag_GetBase
    bne        LAB_0804fb14
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}
LAB_0804fb0a:
    mov        r0,#0x0
    bl         Flag_Set410
    mov        r0,#0x4
    b          LAB_0804fb16
LAB_0804fb14:
    mov        r0,#0x8
LAB_0804fb16:
    str        r0,[r5,#0x0]
    pop        {pc}


_nt FUN_0804fb1a
    push       {lr}
    ldr        r0,PTR_PTR_FUN_0804fb38_0804fb84
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_FUN_0804fb38_0804fb2c:
    .word FUN_0804fb38
    .word FUN_0804fb52
    .word FUN_0804fb5c


_ts FUN_0804fb38
    push       {lr}
    push       {r5}
    mov        r1,#0x1
    ldr        r0,PTR_Script_ShowDialogue_0804fb88
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x4
    str        r0,[r5,#0x0]
    mov        r0,#0x4c
    bl         Flag_SetBase
    pop        {pc}


_nt FUN_0804fb52
    push       {lr}
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}


_ts FUN_0804fb5c
    push       {lr}
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}

    .align 2, 0

PTR_FUN_0804fa9e_0804fb68:
    .word FUN_0804fa9e

PTR_BgTask_804F7B8_0804fb6c:
    .word BgTask_804F7B8

PTR_FUN_0804fb1a_0804fb70:
    .word FUN_0804fb1a

PTR_EntityAllocParams_804FD24_0804fb74:
    .word EntityAllocParams_804FD24

PTR_NPCList_804FCA4_0804fb78:
    .word NPCList_804FCA4

PTR_FUN_08084070_0804fb7c:
    .word 0x8084071

PTR_DAT_0804fb80:
    .word 0x2000

PTR_PTR_FUN_0804fb38_0804fb84:
    .word PTR_FUN_0804fb38_0804fb2c

PTR_Script_ShowDialogue_0804fb88:
    .word Script_ShowDialogue
