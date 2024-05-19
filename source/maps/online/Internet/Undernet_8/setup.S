#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_Undernet_8_S0
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,PTR_FUN_08053702_08053784
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_80515C8_08053788
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051618_0805378c
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051668_08053790
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_80516B8_08053794
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_80516F8_08053798
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051780_0805379c
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051820_080537a0
    bl         BgTask_AddNew
    pop        {r5}
    pop        {pc}


_ts EventHandler_Undernet_8_S0
    push       {lr}
    ldr        r0,PTR_FUN_08053722_080537a4
    mov        lr,pc
    bx         r0
    pop        {pc}


_nt FUN_08053702
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_NPCList_8054D20_080537a8
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    strb       r0,[r5,#0x0]
    pop        {pc}


_nt FUN_08053722
    push       {lr}
    ldr        r0,PTR_PTR_FUN_08053738_080537ac
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_FUN_08053738_08053734:
    .word FUN_08053738


_ts FUN_08053738
    push       {lr}
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x10
    bne        LAB_0805377c
    mov        r0,#0x5
    bl         Flag_GetBase
    beq        LAB_0805377c
    push       {r5}
    bl         Status_GetLevel
    cmp        r0,#0x45
    pop        {r5}
    bls        LAB_0805377c
    mov        r0,#0x12
    bl         Flag_GetBase
    bne        LAB_0805377c
    mov        r0,#0x12
    bl         Flag_SetBase
    push       {r5}
    ldr        r0,PTR_FUN_080857b8_080537b0
    mov        r1,#0x2b
    bl         Scene_Prepare
    pop        {r5}
LAB_0805377c:
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}

PTR_FUN_08053702_08053784:
    .word FUN_08053702

PTR_BgTask_80515C8_08053788:
    .word BgTask_80515C8

PTR_BgTask_8051618_0805378c:
    .word BgTask_8051618

PTR_BgTask_8051668_08053790:
    .word BgTask_8051668

PTR_BgTask_80516B8_08053794:
    .word BgTask_80516B8

PTR_BgTask_80516F8_08053798:
    .word BgTask_80516F8

PTR_BgTask_8051780_0805379c:
    .word BgTask_8051780

PTR_BgTask_8051820_080537a0:
    .word BgTask_8051820

PTR_FUN_08053722_080537a4:
    .word FUN_08053722

PTR_NPCList_8054D20_080537a8:
    .word NPCList_8054D20

PTR_PTR_FUN_08053738_080537ac:
    .word PTR_FUN_08053738_08053734

PTR_FUN_080857b8_080537b0:
    .word 0x80857B9
