#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set PlayerLocation_Create, 0x8056020+1
    .set FUN_0807db72, 0x807DB72+1


_ts MapSetup_School_Comp_4_S1
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,PTR_PTR_MapSetup_Default_080416e8
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_803EC68_080416ec
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_803ECF8_080416f0
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_803ED68_080416f4
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_803F138_080416f8
    bl         BgTask_AddNew
    ldr        r0,PTR_EntityAllocParams_80422B4_080416fc
    bl         Entity_AllocList
    pop        {r5}
    mov        r0,#0x0
    strb       r0,[r5,#0x1]
    pop        {pc}

    .align 2, 0

PTR_MapSetup_Default_08041500:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_School_Comp_4_F14
    .word MapSetup_School_Comp_4_F15
    .word MapSetup_Default
    .word MapSetup_Default


_ts EventHandler_School_Comp_4_S1
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Default_08041700
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Default_0804152c:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_School_Comp_4_F14
    .word EventHandler_School_Comp_4_F15
    .word EventHandler_Default
    .word EventHandler_Default


_ts MapSetup_School_Comp_4_F14
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_8041E8C_08041704
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0xd6
    bl         Flag_GetBase
    beq        LAB_08041584
    mov        r0,#0xd6
    bl         Flag_ClearBase
    push       {r5}
    ldr        r0,DAT_08041708
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_08041584:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_School_Comp_4_F14
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Comp_4_F14_0_0804170c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    bl         FUN_08040a50
    pop        {pc}

    .align 2, 0

PTR_EventHandler_School_Comp_4_F14_0_080415a0:
    .word EventHandler_School_Comp_4_F14_0
    .word EventHandler_School_Comp_4_F14_1


_ts EventHandler_School_Comp_4_F14_0
    push       {lr}
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x10
    bne        LAB_080415ce
    push       {r5}
    ldr        r0,PTR_FUN_08087054_08041710
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x4
    str        r0,[r5,#0x0]
LAB_080415ce:
    pop        {pc}


_ts EventHandler_School_Comp_4_F14_1
    push       {lr}
    pop        {pc}


_ts MapSetup_School_Comp_4_F15
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_8041E8C_08041714
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0xd6
    bl         Flag_GetBase
    beq        LAB_0804160c
    mov        r0,#0xd6
    bl         Flag_ClearBase
    push       {r5}
    ldr        r0,PTR_FUN_08084070_08041718
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_0804160c:
    mov        r0,#0xb8
    bl         Flag_GetBase
    beq        LAB_08041620
    push       {r5}
    mov        r0,#0x0
    bl         Flag_Set380
    pop        {r5}
    b          LAB_0804162a
LAB_08041620:
    push       {r5}
    mov        r1,#0x5
    bl         FUN_0807db72
    pop        {r5}
LAB_0804162a:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_School_Comp_4_F15
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Comp_4_F15_0_0804171c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    bl         FUN_08040a50
    pop        {pc}

PTR_EventHandler_School_Comp_4_F15_0_08041644:
    .word EventHandler_School_Comp_4_F15_0
    .word EventHandler_School_Comp_4_F15_1
    .word EventHandler_School_Comp_4_F15_2
    .word EventHandler_School_Comp_4_F15_3


_ts EventHandler_School_Comp_4_F15_0
    push       {lr}
    push       {r5}
    mov        r0,#0xb7
    bl         Flag_GetBase
    pop        {r5}
    bne        LAB_0804166e
    push       {r5}
    mov        r1,#0x1
    ldr        r0,PTR_FUN_08087400_08041720
    bl         Scene_Prepare
    pop        {r5}
LAB_0804166e:
    push       {r5}
    mov        r0,#0xb8
    bl         Flag_GetBase
    pop        {r5}
    bne        LAB_08041690
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x20
    bne        LAB_08041694
    push       {r5}
    mov        r1,#0x8
    ldr        r0,DAT_08041724
    bl         Scene_Prepare
    pop        {r5}
LAB_08041690:
    mov        r0,#0x4
    str        r0,[r5,#0x0]
LAB_08041694:
    pop        {pc}


_nt EventHandler_School_Comp_4_F15_1
    push       {lr}
    push       {r5}
    mov        r0,#0xb8
    bl         Flag_GetBase
    pop        {r5}
    beq        LAB_080416b6
    push       {r5}
    ldr        r0,PTR_FUN_08086e18_08041728
    mov        r1,#0x4
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x8
    str        r0,[r5,#0x0]
    pop        {pc}
LAB_080416b6:
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x20
    bne        LAB_08041694
    push       {r5}
    mov        r1,#0x8
    ldr        r0,PTR_FUN_08087e34_0804172c
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}


_nt EventHandler_School_Comp_4_F15_2
    push       {lr}
    push       {r5}
    mov        r0,#0xba
    bl         Flag_GetBase
    pop        {r5}
    beq        LAB_080416e0
    mov        r0,#0xc
    str        r0,[r5,#0x0]
LAB_080416e0:
    pop        {pc}


_nt EventHandler_School_Comp_4_F15_3
    push       {lr}
    pop        {pc}

    .align 2, 0

PTR_PTR_MapSetup_Default_080416e8:
    .word PTR_MapSetup_Default_08041500

PTR_BgTask_803EC68_080416ec:
    .word BgTask_803EC68

PTR_BgTask_803ECF8_080416f0:
    .word BgTask_803ECF8

PTR_BgTask_803ED68_080416f4:
    .word BgTask_803ED68

PTR_BgTask_803F138_080416f8:
    .word BgTask_803F138

PTR_EntityAllocParams_80422B4_080416fc:
    .word EntityAllocParams_80422B4

PTR_PTR_EventHandler_Default_08041700:
    .word PTR_EventHandler_Default_0804152c

PTR_NPCList_8041E8C_08041704:
    .word NPCList_8041E8C

DAT_08041708:
    .word 0x8084071

PTR_PTR_EventHandler_School_Comp_4_F14_0_0804170c:
    .word PTR_EventHandler_School_Comp_4_F14_0_080415a0

PTR_FUN_08087054_08041710:
    .word 0x8087055

PTR_NPCList_8041E8C_08041714:
    .word NPCList_8041E8C

PTR_FUN_08084070_08041718:
    .word 0x8084071

PTR_PTR_EventHandler_School_Comp_4_F15_0_0804171c:
    .word PTR_EventHandler_School_Comp_4_F15_0_08041644

PTR_FUN_08087400_08041720:
    .word 0x8087401

DAT_08041724:
    .word 0x8087E35

PTR_FUN_08086e18_08041728:
    .word 0x8086E19

PTR_FUN_08087e34_0804172c:
    .word 0x8087E35


_ts MapSetup_School_Comp_4_S2
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,PTR_PTR_MapSetup_School_Comp_4_F20_08041818
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_803ECB0_0804181c
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_803ECF8_08041820
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_803ED68_08041824
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_803F138_08041828
    bl         BgTask_AddNew
    ldr        r0,PTR_EntityAllocParams_80422B4_0804182c
    bl         Entity_AllocList
    pop        {r5}
    pop        {pc}

    .align 2, 0

PTR_MapSetup_School_Comp_4_F20_08041768:
    .word MapSetup_School_Comp_4_F20
    .word MapSetup_School_Comp_4_F20
    .word MapSetup_School_Comp_4_F20
    .word MapSetup_School_Comp_4_F20
    .word MapSetup_School_Comp_4_F20
    .word MapSetup_School_Comp_4_F20
    .word MapSetup_School_Comp_4_F20
    .word MapSetup_School_Comp_4_F20


_ts EventHandler_School_Comp_4_S2
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Comp_4_F20_08041830
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_School_Comp_4_F20_08041794:
    .word EventHandler_School_Comp_4_F20
    .word EventHandler_School_Comp_4_F20
    .word EventHandler_School_Comp_4_F20
    .word EventHandler_School_Comp_4_F20
    .word EventHandler_School_Comp_4_F20
    .word EventHandler_School_Comp_4_F20
    .word EventHandler_School_Comp_4_F20
    .word EventHandler_School_Comp_4_F20


_ts MapSetup_School_Comp_4_F20
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    mov        r0,#0x0
    bl         Flag_Set380
    push       {r5}
    ldr        r7,PTR_NPCList_8041F14_08041834
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    bne        LAB_080417e8
    cmp        r1,#0x80
    beq        LAB_080417f4
LAB_080417e8:
    push       {r5}
    ldr        r0,DAT_08041838
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_080417f4:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_School_Comp_4_F20
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Comp_4_F20_0_0804183c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}

PTR_EventHandler_School_Comp_4_F20_0_08041810:
    .word EventHandler_School_Comp_4_F20_0


_ts EventHandler_School_Comp_4_F20_0
    push       {lr}
    pop        {pc}

PTR_PTR_MapSetup_School_Comp_4_F20_08041818:
    .word PTR_MapSetup_School_Comp_4_F20_08041768

PTR_BgTask_803ECB0_0804181c:
    .word BgTask_803ECB0

PTR_BgTask_803ECF8_08041820:
    .word BgTask_803ECF8

PTR_BgTask_803ED68_08041824:
    .word BgTask_803ED68

PTR_BgTask_803F138_08041828:
    .word BgTask_803F138

PTR_EntityAllocParams_80422B4_0804182c:
    .word EntityAllocParams_80422B4

PTR_PTR_EventHandler_School_Comp_4_F20_08041830:
    .word PTR_EventHandler_School_Comp_4_F20_08041794

PTR_NPCList_8041F14_08041834:
    .word NPCList_8041F14

DAT_08041838:
    .word 0x8084071

PTR_PTR_EventHandler_School_Comp_4_F20_0_0804183c:
    .word PTR_EventHandler_School_Comp_4_F20_0_08041810
