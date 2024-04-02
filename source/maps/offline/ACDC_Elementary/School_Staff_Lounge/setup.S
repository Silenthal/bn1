#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set PlayerLocation_Create, 0x8056020
    .set EntityAllocParams_ARRAY_08029cf4, 0x8029CF4
    .set FUN_080879f4, 0x80879F5
    .set FUN_08087e34, 0x8087E35


_ts MapSetup_School_Staff_Lounge_S1
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_School_Staff_Lounge_F10_08028418
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    mov        r0,#0x9a
    bl         Flag_GetBase
    pop        {r5}
    beq        LAB_080282fe
    mov        r0,#0x4
    bl         Sound_ChangeSong
    pop        {pc}
LAB_080282fe:
    bl         Sound_AreaSongChange
    pop        {pc}
PTR_MapSetup_School_Staff_Lounge_F10_08028304:
    .word MapSetup_School_Staff_Lounge_F10
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_School_Staff_Lounge_F15
    .word MapSetup_Default
    .word MapSetup_Default


_ts EventHandler_School_Staff_Lounge_S1
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Staff_Lounge_F10_0802841c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_Staff_Lounge_F10_08028330:
    .word EventHandler_School_Staff_Lounge_F10
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_School_Staff_Lounge_F15
    .word EventHandler_Default
    .word EventHandler_Default


_ts MapSetup_School_Staff_Lounge_F10
    push       {lr}
    push       {r5}
    ldr        r0,PTR_BgTask_08028420
    bl         BgTask_AddNew
    ldr        r0,PTR_EntityAllocParams_ARRAY_08028424
    bl         Entity_AllocList
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_School_Staff_Lounge_F10
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Staff_Lounge_F10_0_08028428
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_School_Staff_Lounge_F10_0_08028388:
    .word EventHandler_School_Staff_Lounge_F10_0


_ts EventHandler_School_Staff_Lounge_F10_0
    push       {lr}
    pop        {pc}


_ts MapSetup_School_Staff_Lounge_F15
    push       {lr}
    push       {r5}
    ldr        r0,PTR_BgTask_0802842c
    bl         BgTask_AddNew
    ldr        r0,PTR_EntityAllocParams_ARRAY_08028430
    bl         Entity_AllocList
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    mov        r0,#0xc7
    bl         Flag_GetBase
    beq        LAB_080283cc
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    mov        r1,#0x0
    strb       r1,[r0,#0x7]
    push       {r5}
    ldr        r0,PTR_FUN_080879f4_08028434
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_080283cc:
    mov        r0,#0x2
    bl         Flag_Set410
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_School_Staff_Lounge_F15
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Staff_Lounge_F15_0_08028438
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_Staff_Lounge_F15_0_080283e8:
    .word EventHandler_School_Staff_Lounge_F15_0


_ts EventHandler_School_Staff_Lounge_F15_0
    push       {lr}
    mov        r0,#0xc7
    bl         Flag_GetBase
    beq        LAB_08028414
    push       {r5}
    ldr        r0,PTR_FUN_08087e34_0802843c
    mov        r1,#0xc
    bl         Scene_Prepare
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    mov        r1,#0x20
    strb       r1,[r0,#0x6]
    mov        r0,#0x1
    bl         Flag_SetBase
    bl         FUN_080102e8
    pop        {r5}
LAB_08028414:
    pop        {pc}

    .align 2, 0

PTR_PTR_MapSetup_School_Staff_Lounge_F10_08028418:
    .word PTR_MapSetup_School_Staff_Lounge_F10_08028304
PTR_PTR_EventHandler_School_Staff_Lounge_F10_0802841c:
    .word PTR_EventHandler_School_Staff_Lounge_F10_08028330
PTR_BgTask_08028420:
    .word BgTask_08024208
PTR_EntityAllocParams_ARRAY_08028424:
    .word EntityAllocParams_ARRAY_08029cf4
PTR_PTR_EventHandler_School_Staff_Lounge_F10_0_08028428:
    .word PTR_EventHandler_School_Staff_Lounge_F10_0_08028388
PTR_BgTask_0802842c:
    .word BgTask_08024208
PTR_EntityAllocParams_ARRAY_08028430:
    .word EntityAllocParams_ARRAY_08029cf4
PTR_FUN_080879f4_08028434:
    .word FUN_080879f4
PTR_PTR_EventHandler_School_Staff_Lounge_F15_0_08028438:
    .word PTR_EventHandler_School_Staff_Lounge_F15_0_080283e8
PTR_FUN_08087e34_0802843c:
    .word FUN_08087e34


_ts MapSetup_School_Staff_Lounge_S5
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_School_Staff_Lounge_F50_080284e0
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Sound_AreaSongChange
    pop        {pc}
PTR_MapSetup_School_Staff_Lounge_F50_08028450:
    .word MapSetup_School_Staff_Lounge_F50
    .word MapSetup_School_Staff_Lounge_F50
    .word MapSetup_School_Staff_Lounge_F50
    .word MapSetup_School_Staff_Lounge_F50
    .word MapSetup_School_Staff_Lounge_F50
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default


_ts EventHandler_School_Staff_Lounge_S5
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Staff_Lounge_F50_080284e4
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_Staff_Lounge_F50_0802847c:
    .word EventHandler_School_Staff_Lounge_F50
    .word EventHandler_School_Staff_Lounge_F50
    .word EventHandler_School_Staff_Lounge_F50
    .word EventHandler_School_Staff_Lounge_F50
    .word EventHandler_School_Staff_Lounge_F50
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default


_ts MapSetup_School_Staff_Lounge_F50
    push       {lr}
    push       {r5}
    ldr        r0,PTR_BgTask_080284e8
    bl         BgTask_AddNew
    ldr        r0,PTR_EntityAllocParams_ARRAY_080284ec
    bl         Entity_AllocList
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_DAT_080284f0
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_School_Staff_Lounge_F50
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Staff_Lounge_F50_0_080284f4
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_Staff_Lounge_F50_0_080284d8:
    .word EventHandler_School_Staff_Lounge_F50_0


_ts EventHandler_School_Staff_Lounge_F50_0
    push       {lr}
    pop        {pc}
PTR_PTR_MapSetup_School_Staff_Lounge_F50_080284e0:
    .word PTR_MapSetup_School_Staff_Lounge_F50_08028450
PTR_PTR_EventHandler_School_Staff_Lounge_F50_080284e4:
    .word PTR_EventHandler_School_Staff_Lounge_F50_0802847c
PTR_BgTask_080284e8:
    .word BgTask_08024208
PTR_EntityAllocParams_ARRAY_080284ec:
    .word EntityAllocParams_ARRAY_08029cf4
PTR_DAT_080284f0:
    .word 0x8029A98
PTR_PTR_EventHandler_School_Staff_Lounge_F50_0_080284f4:
    .word PTR_EventHandler_School_Staff_Lounge_F50_0_080284d8
