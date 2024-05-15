#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set PlayerLocation_Create, 0x8056020+1


_ts MapSetup_Traffic_Light_Comp_2_S3
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,PTR_PTR_MapSetup_Default_08048470
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         FUN_08049958
    push       {r5}
    ldr        r0,PTR_BgTask_8047504_08048474
    bl         BgTask_AddNew
    pop        {r5}
    pop        {pc}

    .align 2, 0

PTR_MapSetup_Default_080482f4:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Traffic_Light_Comp_2_F33
    .word MapSetup_Traffic_Light_Comp_2_F34
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default


_ts EventHandler_Traffic_Light_Comp_2_S3
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Default_08048478
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         FUN_080499a8
    pop        {pc}

PTR_EventHandler_Default_08048324:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Traffic_Light_Comp_2_F33
    .word EventHandler_Traffic_Light_Comp_2_F34
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default


_ts MapSetup_Traffic_Light_Comp_2_F33
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_804917C_0804847c
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    bne        LAB_08048376
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_08048382
LAB_08048376:
    push       {r5}
    ldr        r0,DAT_08048480
    ldr        r1,PTR_DAT_08048484
    bl         Scene_Prepare
    pop        {r5}
LAB_08048382:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Traffic_Light_Comp_2_F33
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Traffic_Light_Comp_2_F33_0_08048488
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Traffic_Light_Comp_2_F33_0_08048398:
    .word EventHandler_Traffic_Light_Comp_2_F33_0


_ts EventHandler_Traffic_Light_Comp_2_F33_0
    push       {lr}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x20
    bne        LAB_080483b4
    push       {r5}
    ldr        r0,DAT_0804848c
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_080483b4:
    mov        r0,#0xc4
    bl         Flag_GetBase
    beq        LAB_080483d2
    mov        r0,#0xa8
    bl         Flag_GetBase
    bne        LAB_080483d2
    push       {r5}
    ldr        r0,PTR_FUN_0808d2a4_08048490
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_080483d2:
    mov        r0,#0xa9
    bl         Flag_GetBase
    beq        LAB_080483ee
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    mov        r1,#0x34
    strb       r1,[r0,#0x6]
    push       {r5}
    ldr        r0,DAT_08048494
    mov        r1,#0x12
    bl         Scene_Prepare
    pop        {r5}
LAB_080483ee:
    mov        r0,#0x9
    bl         CheckForJackOut
    pop        {pc}


_nt MapSetup_Traffic_Light_Comp_2_F34
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_804917C_08048498
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    bne        LAB_08048428
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_08048434
LAB_08048428:
    push       {r5}
    ldr        r0,PTR_FUN_08084070_0804849c
    ldr        r1,PTR_DAT_08048484
    bl         Scene_Prepare
    pop        {r5}
LAB_08048434:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_Traffic_Light_Comp_2_F34
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Traffic_Light_Comp_2_F34_0_080484a0
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_Traffic_Light_Comp_2_F34_0_0804844c:
    .word EventHandler_Traffic_Light_Comp_2_F34_0


_ts EventHandler_Traffic_Light_Comp_2_F34_0
    push       {lr}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x20
    bne        LAB_08048468
    push       {r5}
    ldr        r0,DAT_080484a4
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_08048468:
    mov        r0,#0x9
    bl         CheckForJackOut
    pop        {pc}

PTR_PTR_MapSetup_Default_08048470:
    .word PTR_MapSetup_Default_080482f4

PTR_BgTask_8047504_08048474:
    .word BgTask_8047504

PTR_PTR_EventHandler_Default_08048478:
    .word PTR_EventHandler_Default_08048324

PTR_NPCList_804917C_0804847c:
    .word NPCList_804917C

DAT_08048480:
    .word 0x8084071

PTR_DAT_08048484:
    .word 0x2000

PTR_PTR_EventHandler_Traffic_Light_Comp_2_F33_0_08048488:
    .word PTR_EventHandler_Traffic_Light_Comp_2_F33_0_08048398

DAT_0804848c:
    .word 0x80848FD

PTR_FUN_0808d2a4_08048490:
    .word 0x808D2A5

DAT_08048494:
    .word 0x8087E35

PTR_NPCList_804917C_08048498:
    .word NPCList_804917C

PTR_FUN_08084070_0804849c:
    .word 0x8084071

PTR_PTR_EventHandler_Traffic_Light_Comp_2_F34_0_080484a0:
    .word PTR_EventHandler_Traffic_Light_Comp_2_F34_0_0804844c

DAT_080484a4:
    .word 0x80848FD


_ts MapSetup_Traffic_Light_Comp_2_S4
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,PTR_PTR_MapSetup_Traffic_Light_Comp_2_F40_08048594
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         FUN_08049958
    push       {r5}
    ldr        r0,PTR_BgTask_8047504_08048598
    bl         BgTask_AddNew
    pop        {r5}
    pop        {pc}

    .align 2, 0

PTR_MapSetup_Traffic_Light_Comp_2_F40_080484cc:
    .word MapSetup_Traffic_Light_Comp_2_F40
    .word MapSetup_Traffic_Light_Comp_2_F40
    .word MapSetup_Traffic_Light_Comp_2_F40
    .word MapSetup_Traffic_Light_Comp_2_F40
    .word MapSetup_Traffic_Light_Comp_2_F40
    .word MapSetup_Traffic_Light_Comp_2_F40
    .word MapSetup_Traffic_Light_Comp_2_F40
    .word MapSetup_Traffic_Light_Comp_2_F40


_ts EventHandler_Traffic_Light_Comp_2_S4
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Traffic_Light_Comp_2_F40_0804859c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         FUN_080499a8
    pop        {pc}

PTR_EventHandler_Traffic_Light_Comp_2_F40_080484fc:
    .word EventHandler_Traffic_Light_Comp_2_F40
    .word EventHandler_Traffic_Light_Comp_2_F40
    .word EventHandler_Traffic_Light_Comp_2_F40
    .word EventHandler_Traffic_Light_Comp_2_F40
    .word EventHandler_Traffic_Light_Comp_2_F40
    .word EventHandler_Traffic_Light_Comp_2_F40
    .word EventHandler_Traffic_Light_Comp_2_F40
    .word EventHandler_Traffic_Light_Comp_2_F40


_ts MapSetup_Traffic_Light_Comp_2_F40
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_804917C_080485a0
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    bne        LAB_0804854e
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_0804855a
LAB_0804854e:
    push       {r5}
    ldr        r0,DAT_080485a4
    ldr        r1,PTR_DAT_080485a8
    bl         Scene_Prepare
    pop        {r5}
LAB_0804855a:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Traffic_Light_Comp_2_F40
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Traffic_Light_Comp_2_F40_0_080485ac
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Traffic_Light_Comp_2_F40_0_08048570:
    .word EventHandler_Traffic_Light_Comp_2_F40_0


_ts EventHandler_Traffic_Light_Comp_2_F40_0
    push       {lr}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x20
    bne        LAB_0804858c
    push       {r5}
    ldr        r0,DAT_080485b0
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_0804858c:
    mov        r0,#0x9
    bl         CheckForJackOut
    pop        {pc}

PTR_PTR_MapSetup_Traffic_Light_Comp_2_F40_08048594:
    .word PTR_MapSetup_Traffic_Light_Comp_2_F40_080484cc

PTR_BgTask_8047504_08048598:
    .word BgTask_8047504

PTR_PTR_EventHandler_Traffic_Light_Comp_2_F40_0804859c:
    .word PTR_EventHandler_Traffic_Light_Comp_2_F40_080484fc

PTR_NPCList_804917C_080485a0:
    .word NPCList_804917C

DAT_080485a4:
    .word 0x8084071

PTR_DAT_080485a8:
    .word 0x2000

PTR_PTR_EventHandler_Traffic_Light_Comp_2_F40_0_080485ac:
    .word PTR_EventHandler_Traffic_Light_Comp_2_F40_0_08048570

DAT_080485b0:
    .word 0x80848FD
