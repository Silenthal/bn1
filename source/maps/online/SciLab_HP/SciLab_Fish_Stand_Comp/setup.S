#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_SciLab_Fish_Stand_Comp_S0
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,DAT_08050264
    mov        lr,pc
    bx         r0 @ FUN_0805019a
    push       {r5}
    ldr        r0,PTR_BgTask_8050060_08050268
    bl         BgTask_AddNew
    pop        {r5}
    pop        {pc}


_ts EventHandler_SciLab_Fish_Stand_Comp_S0
    push       {lr}
    ldr        r0,DAT_0805026c
    mov        lr,pc
    bx         r0 @ FUN_08050216
    pop        {pc}


_nt FUN_0805019a
    push       {lr}
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_080501b2
    push       {r5}
    mov        r0,#0x70
    bl         Flag_ClearItem
    pop        {r5}
LAB_080501b2:
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r0,PTR_EntityAllocParams_80502DC_08050270
    bl         Entity_AllocList
    ldr        r7,PTR_NPCList_8050288_08050274
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    bne        LAB_080501e4
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_080501f0
LAB_080501e4:
    push       {r5}
    ldr        r0,PTR_Scene_MegaManJackIn_08050278
    ldr        r1,PTR_DAT_0805027c
    bl         Scene_Prepare
    pop        {r5}
LAB_080501f0:
    mov        r0,#0x49
    bl         Flag_GetBase
    beq        LAB_08050206
    mov        r0,#0x4d
    bl         Flag_GetBase
    bne        LAB_08050210
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}
LAB_08050206:
    mov        r0,#0x0
    bl         Flag_Set410
    mov        r0,#0x4
    b          LAB_08050212
LAB_08050210:
    mov        r0,#0x8
LAB_08050212:
    str        r0,[r5,#0x0]
    pop        {pc}


_nt FUN_08050216
    push       {lr}
    ldr        r0,PTR_PTR_FUN_08050234_08050280
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_FUN_08050234_08050228:
    .word FUN_08050234
    .word FUN_0805024e
    .word FUN_08050258


_ts FUN_08050234
    push       {lr}
    push       {r5}
    mov        r1,#0x1
    ldr        r0,DAT_08050284
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x4
    str        r0,[r5,#0x0]
    mov        r0,#0x4d
    bl         Flag_SetBase
    pop        {pc}


_nt FUN_0805024e
    push       {lr}
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}


_ts FUN_08050258
    push       {lr}
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}

    .align 2, 0

DAT_08050264:
    .word FUN_0805019a

PTR_BgTask_8050060_08050268:
    .word BgTask_8050060

DAT_0805026c:
    .word FUN_08050216

PTR_EntityAllocParams_80502DC_08050270:
    .word EntityAllocParams_80502DC

PTR_NPCList_8050288_08050274:
    .word NPCList_8050288

PTR_Scene_MegaManJackIn_08050278:
    .word Scene_MegaManJackIn

PTR_DAT_0805027c:
    .word 0x2000

PTR_PTR_FUN_08050234_08050280:
    .word PTR_FUN_08050234_08050228

DAT_08050284:
    .word Scene_Dialogue
