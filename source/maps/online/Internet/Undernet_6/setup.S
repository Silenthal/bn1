#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set Script_ShowDialogue, 0x80848FC+1


_ts MapSetup_Undernet_6_S0
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,PTR_FUN_080532b0_08053490
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_80515C8_08053494
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051618_08053498
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051668_0805349c
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_80516B8_080534a0
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_80516F8_080534a4
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051780_080534a8
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051820_080534ac
    bl         BgTask_AddNew
    mov        r0,#0x8a
    bl         Flag_GetBase
    beq        LAB_080532a2
    ldr        r0,PTR_BgTask_8051738_080534b0
    bl         BgTask_AddNew
LAB_080532a2:
    pop        {r5}
    pop        {pc}


_nt EventHandler_Undernet_6_S0
    push       {lr}
    ldr        r0,PTR_FUN_08053356_080534b4
    mov        lr,pc
    bx         r0
    pop        {pc}


_ts FUN_080532b0
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#0x1]
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    bne        LAB_080532ca
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_080532d8
LAB_080532ca:
    mov        r0,#0x0
    strb       r0,[r5,#0x2]
    mov        r7,r10
    ldr        r7,[r7,#0x78]
    mov        r0,#0x0
    strb       r0,[r7,#0xd]
    b          LAB_080532ea
LAB_080532d8:
    mov        r7,r10
    ldr        r7,[r7,#0x78]
    ldrb       r0,[r7,#0xd]
    tst        r0,r0
    bne        LAB_080532e6
    mov        r0,#0x0
    b          LAB_080532e8
LAB_080532e6:
    mov        r0,#0x1
LAB_080532e8:
    strb       r0,[r5,#0x2]
LAB_080532ea:
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_NPCList_8054AC4_080534b8
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x79
    bl         Flag_GetBase
    beq        LAB_08053312
    mov        r0,#0x1
    bl         Flag_Set380
    b          LAB_0805331c
LAB_08053312:
    push       {r5}
    mov        r1,#0x57
    bl         Effect_WWWDoor_Create
    pop        {r5}
LAB_0805331c:
    mov        r0,#0x7c
    bl         Flag_GetBase
    beq        LAB_0805332c
    mov        r0,#0x2
    bl         Flag_Set380
    b          LAB_08053336
LAB_0805332c:
    push       {r5}
    mov        r1,#0x58
    bl         Effect_WWWDoor_Create
    pop        {r5}
LAB_08053336:
    mov        r0,#0x8a
    bl         Flag_GetBase
    beq        LAB_08053346
    mov        r0,#0x0
    bl         Flag_Set380
    b          LAB_08053350
LAB_08053346:
    push       {r5}
    mov        r1,#0x9d
    bl         Effect_WWWDoor_Create
    pop        {r5}
LAB_08053350:
    mov        r0,#0x0
    strb       r0,[r5,#0x0]
    pop        {pc}


_nt FUN_08053356
    push       {lr}
    ldr        r0,PTR_PTR_FUN_0805336c_080534bc
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_FUN_0805336c_08053368:
    .word FUN_0805336c


_ts FUN_0805336c
    push       {lr}
    mov        r0,#0x79
    bl         Flag_GetBase
    beq        LAB_0805337e
    mov        r0,#0x7c
    bl         Flag_GetBase
    bne        LAB_080533ac
LAB_0805337e:
    mov        r7,r10
    ldr        r7,[r7,#0x78]
    ldrb       r0,[r7,#0xd]
    tst        r0,r0
    beq        LAB_0805338c
    mov        r0,#0x1
    strb       r0,[r5,#0x2]
LAB_0805338c:
    mov        r0,#0x21
    bl         Flag_Get420
    bne        LAB_080533ac
    ldrb       r0,[r5,#0x2]
    tst        r0,r0
    beq        LAB_080533ac
    mov        r0,#0x21
    bl         Flag_Set420
    push       {r5}
    ldr        r0,PTR_FUN_08085bb8_080534c0
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_080533ac:
    ldrb       r0,[r5,#0x1]
    tst        r0,r0
    beq        LAB_080533c0
    mov        r0,#0x0
    strb       r0,[r5,#0x1]
    push       {r5}
    ldr        r0,PTR_BgTask_8051738_080534c4
    bl         BgTask_AddNew
    pop        {r5}
LAB_080533c0:
    mov        r0,#0x8a
    bl         Flag_GetBase
    bne        LAB_080533ea
    mov        r0,#0x8b
    bl         Flag_GetBase
    beq        LAB_080533e2
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
    push       {r5}
    ldr        r0,PTR_FUN_08086e18_080534c8
    mov        r1,#0x1c
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_080533e2:
    mov        r0,#0x20
    mov        r1,#0x1f
    bl         FUN_0805345e
LAB_080533ea:
    mov        r0,#0x79
    bl         Flag_GetBase
    bne        LAB_08053420
    mov        r0,#0x78
    bl         Flag_GetBase
    beq        LAB_08053408
    push       {r5}
    ldr        r0,PTR_FUN_08086e18_080534cc
    mov        r1,#0x16
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_08053408:
    ldrb       r0,[r5,#0x2]
    tst        r0,r0
    beq        LAB_08053418
    mov        r0,#0x21
    mov        r1,#0x0
    bl         FUN_08053476
    b          LAB_08053420
LAB_08053418:
    mov        r0,#0x21
    mov        r1,#0xa
    bl         FUN_0805345e
LAB_08053420:
    mov        r0,#0x7c
    bl         Flag_GetBase
    bne        LAB_08053456
    mov        r0,#0x7b
    bl         Flag_GetBase
    beq        LAB_0805343e
    push       {r5}
    ldr        r0,PTR_FUN_08086e18_080534d0
    mov        r1,#0x17
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0805343e:
    ldrb       r0,[r5,#0x2]
    tst        r0,r0
    beq        LAB_0805344e
    mov        r0,#0x22
    mov        r1,#0x1
    bl         FUN_08053476
    b          LAB_08053456
LAB_0805344e:
    mov        r0,#0x22
    mov        r1,#0xc
    bl         FUN_0805345e
LAB_08053456:
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}


_nt FUN_0805345e
    push       {lr}
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrb       r2,[r7,#0xe]
    cmp        r2,r0
    bne        LAB_08053474
    push       {r5}
    ldr        r0,PTR_Script_ShowDialogue_080534d4
    bl         Scene_Prepare
    pop        {r5}
LAB_08053474:
    pop        {pc}


_nt FUN_08053476
    push       {lr}
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrb       r2,[r7,#0xe]
    cmp        r2,r0
    bne        LAB_0805348c
    push       {r5}
    ldr        r0,PTR_FUN_08085bb8_080534d8
    bl         Scene_Prepare
    pop        {r5}
LAB_0805348c:
    pop        {pc}

    .align 2, 0

PTR_FUN_080532b0_08053490:
    .word FUN_080532b0

PTR_BgTask_80515C8_08053494:
    .word BgTask_80515C8

PTR_BgTask_8051618_08053498:
    .word BgTask_8051618

PTR_BgTask_8051668_0805349c:
    .word BgTask_8051668

PTR_BgTask_80516B8_080534a0:
    .word BgTask_80516B8

PTR_BgTask_80516F8_080534a4:
    .word BgTask_80516F8

PTR_BgTask_8051780_080534a8:
    .word BgTask_8051780

PTR_BgTask_8051820_080534ac:
    .word BgTask_8051820

PTR_BgTask_8051738_080534b0:
    .word BgTask_8051738

PTR_FUN_08053356_080534b4:
    .word FUN_08053356

PTR_NPCList_8054AC4_080534b8:
    .word NPCList_8054AC4

PTR_PTR_FUN_0805336c_080534bc:
    .word PTR_FUN_0805336c_08053368

PTR_FUN_08085bb8_080534c0:
    .word 0x8085BB9

PTR_BgTask_8051738_080534c4:
    .word BgTask_8051738

PTR_FUN_08086e18_080534c8:
    .word 0x8086E19

PTR_FUN_08086e18_080534cc:
    .word 0x8086E19

PTR_FUN_08086e18_080534d0:
    .word 0x8086E19

PTR_Script_ShowDialogue_080534d4:
    .word Script_ShowDialogue

PTR_FUN_08085bb8_080534d8:
    .word 0x8085BB9
