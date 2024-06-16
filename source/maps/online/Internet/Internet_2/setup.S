#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_Internet_2_S0
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,PTR_MapSetup_Internet_2_080525ac
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_80515C8_080525b0
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051618_080525b4
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051668_080525b8
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_80516B8_080525bc
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_80516F8_080525c0
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051780_080525c4
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051820_080525c8
    bl         BgTask_AddNew
    mov        r0,#0x17
    bl         Flag_GetBase
    beq        LAB_080522da
    ldr        r0,PTR_BgTask_8051738_080525cc
    bl         BgTask_AddNew
LAB_080522da:
    pop        {r5}
    pop        {pc}


_nt EventHandler_Internet_2_S0
    push       {lr}
    ldr        r0,DAT_080525d0
    mov        lr,pc
    bx         r0
    pop        {pc}


_ts MapSetup_Internet_2
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#0x1]
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    mov        r0,#0x17
    bl         Flag_GetBase
    beq        LAB_08052314
    push       {r5}
    mov        r0,#0x0
    bl         Flag_Set380
    pop        {r5}
    b          LAB_0805231e
LAB_08052314:
    push       {r5}
    mov        r1,#0x89
    bl         Effect_WWWGate_Create
    pop        {r5}
LAB_0805231e:
    mov        r0,#0x19
    bl         Flag_GetBase
    bne        LAB_0805235c
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_8055428_080525d4
    bl         Entity_AllocList
    pop        {r5}
    push       {r5}
    mov        r0,#0x6f
    bl         Flag_GetBase
    pop        {r5}
    beq        LAB_0805235c
    push       {r5}
    ldr        r0,PTR_FUN_080884e0_080525d8
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    ldr        r7,PTR_DAT_080525dc
    mov        r0,#0x6
    lsl        r0,r0,#0x2
    mov        r1,#0xff
    str        r1,[r7,r0]
    push       {r5}
    bl         Map_LoadNPCList
    pop        {r5}
    b          LAB_080523be
LAB_0805235c:
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    bne        LAB_08052370
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_080523be
LAB_08052370:
    ldr        r6,PTR_DAT_080525e0
    ldr        r3,PTR_PTR_080525e4
    mov        r4,#0x6
    lsl        r4,r4,#0x2
    push       {r3,r4,r6}
    mov        r0,#0x19
    bl         Flag_GetBase
    pop        {r3,r4,r6}
    bne        LAB_0805238e
    mov        r0,#0x40
    ldr        r0,[r3,r0]
    ldr        r0,[r0,#0x0]
    str        r0,[r6,r4]
    add        r4,#0x4
LAB_0805238e:
    push       {r3,r4,r6}
    mov        r0,#0x1a
    bl         Flag_Get420
    pop        {r3,r4,r6}
    beq        LAB_080523b0
    push       {r3,r4,r6}
    mov        r0,#0x1b
    bl         Flag_Get420
    pop        {r3,r4,r6}
    bne        LAB_080523b0
    mov        r0,#0x50
    ldr        r0,[r3,r0]
    ldr        r0,[r0,#0x0]
    str        r0,[r6,r4]
    add        r4,#0x4
LAB_080523b0:
    mov        r1,#0xff
    str        r1,[r6,r4]
    add        r7,r6,#0x0
    push       {r5}
    bl         Map_LoadNPCList
    pop        {r5}
LAB_080523be:
    mov        r0,#0x50
    bl         Flag_GetBase
    bne        LAB_080523cc
    mov        r0,#0x1
    bl         Flag_Set410
LAB_080523cc:
    mov        r0,#0x51
    bl         Flag_GetBase
    bne        LAB_080523da
    mov        r0,#0x2
    bl         Flag_Set410
LAB_080523da:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}

PTR_ARRAY_080523e0:
    .word PTR_NPC_8054050_08053ff8
    .word PTR_NPC_8054076_08053ffc
    .word PTR_NPC_805409C_08054000
    .word PTR_NPC_80540C2_08054004
    .word PTR_NPC_80540E8_08054008
    .word PTR_NPC_805410E_0805400c
    .word PTR_NPC_8054134_08054010
    .word PTR_NPC_805415A_08054014
    .word PTR_NPC_8054180_08054018
    .word PTR_NPC_80541A6_0805401c
    .word PTR_NPC_80541CC_08054020
    .word PTR_NPC_80541F2_08054024
    .word PTR_NPC_8054218_08054028
    .word PTR_NPC_805423E_0805402c
    .word PTR_NPC_8054264_08054030
    .word PTR_NPC_805428A_08054034

PTR_PTR_NPC_80542B0_08052420:
    .word PTR_NPC_80542B0_08054038
    .word PTR_NPC_80542C5_0805403c

PTR_PTR_NPC_80542E9_08052428:
    .word PTR_NPC_80542E9_08054040

PTR_PTR_NPC_805430D_0805242c:
    .word PTR_NPC_805430D_08054044

PTR_PTR_NPC_8054324_08052430:
    .word PTR_NPC_8054324_08054048

BYTE_ARRAY_08052434:
    .byte 0x00
    .byte 0x01
    .byte 0x09
    .byte 0x0A

BYTE_ARRAY_08052438:
    .byte 0x04
    .byte 0x06
    .byte 0x03
    .byte 0x05

BYTE_ARRAY_0805243c:
    .byte 0x07
    .byte 0x0C
    .byte 0x02
    .byte 0x0F

BYTE_ARRAY_08052440:
    .byte 0x08
    .byte 0x0B
    .byte 0x0D
    .byte 0x0E


_ts EventHandler_Internet_2
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Internet_2_0_080525e8
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Internet_2_0_08052454:
    .word EventHandler_Internet_2_0


_ts EventHandler_Internet_2_0
    push       {lr}
    mov        r0,#0x17
    bl         Flag_GetBase
    bne        LAB_0805247c
    mov        r0,#0x18
    bl         Flag_GetBase
    beq        LAB_0805247c
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
    push       {r5}
    ldr        r0,DAT_080525ec
    mov        r1,#0x8
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0805247c:
    ldrb       r0,[r5,#0x1]
    tst        r0,r0
    beq        LAB_08052490
    mov        r0,#0x0
    strb       r0,[r5,#0x1]
    push       {r5}
    ldr        r0,PTR_BgTask_8051738_080525f0
    bl         BgTask_AddNew
    pop        {r5}
LAB_08052490:
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x10
    bne        LAB_080524b8
    mov        r0,#0x6f
    bl         Flag_GetBase
    bne        LAB_080524b8
    push       {r5}
    ldr        r0,PTR_FUN_08088380_080525f4
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_080524b8:
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_080524dc
    mov        r0,#0x31
    bl         KeyItem_IsPresent
    bne        LAB_080524d8
    ldr        r1,DAT_080525f8
    b          LAB_08052516
LAB_080524d8:
    mov        r1,#0xa
    b          LAB_08052504
LAB_080524dc:
    cmp        r0,#0x3
    bne        LAB_080524f0
    mov        r0,#0x32
    bl         KeyItem_IsPresent
    bne        LAB_080524ec
    ldr        r1,DAT_080525fc
    b          LAB_08052516
LAB_080524ec:
    mov        r1,#0xc
    b          LAB_08052504
LAB_080524f0:
    mov        r0,#0x17
    bl         Flag_GetBase
    bne        LAB_0805250e
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x21
    bne        LAB_0805250e
    mov        r1,#0x17
LAB_08052504:
    push       {r5}
    ldr        r0,DAT_08052600
    bl         Scene_Prepare
    pop        {r5}
LAB_0805250e:
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}
LAB_08052516:
    push       {r5}
    ldr        r0,DAT_08052604
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}


_ts FUN_08052528
    push       {lr}
    ldr        r6,PTR_DAT_08052608
    ldr        r3,PTR_PTR_0805260c
    mov        r4,#0x0
    push       {r3}
    bl         Rng_RandomUint
    pop        {r3}
    lsr        r0,r0,#0x4
    add        r2,r0,#0x0
    mov        r1,#0x3
    and        r0,r1
    ldr        r1,PTR_BYTE_ARRAY_08052610
    ldrb       r1,[r1,r0]
    lsl        r0,r1,#0x2
    ldr        r0,[r3,r0]
    ldr        r0,[r0,#0x0]
    str        r0,[r6,r4]
    add        r4,#0x4
    add        r0,r2,#0x0
    lsr        r0,r0,#0x4
    add        r2,r0,#0x0
    mov        r1,#0x3
    and        r0,r1
    ldr        r1,PTR_BYTE_ARRAY_08052614
    ldrb       r1,[r1,r0]
    lsl        r0,r1,#0x2
    ldr        r0,[r3,r0]
    ldr        r0,[r0,#0x0]
    str        r0,[r6,r4]
    add        r4,#0x4
    add        r0,r2,#0x0
    lsr        r0,r0,#0x4
    add        r2,r0,#0x0
    mov        r1,#0x3
    and        r0,r1
    ldr        r1,PTR_BYTE_ARRAY_08052618
    ldrb       r1,[r1,r0]
    lsl        r0,r1,#0x2
    ldr        r0,[r3,r0]
    ldr        r0,[r0,#0x0]
    str        r0,[r6,r4]
    add        r4,#0x4
    add        r0,r2,#0x0
    lsr        r0,r0,#0x4
    add        r2,r0,#0x0
    mov        r1,#0x3
    and        r0,r1
    ldr        r1,PTR_BYTE_ARRAY_0805261c
    ldrb       r1,[r1,r0]
    lsl        r0,r1,#0x2
    ldr        r0,[r3,r0]
    ldr        r0,[r0,#0x0]
    str        r0,[r6,r4]
    add        r4,#0x4
    mov        r0,#0x48
    ldr        r0,[r3,r0]
    ldr        r0,[r0,#0x0]
    str        r0,[r6,r4]
    add        r4,#0x4
    mov        r0,#0x4c
    ldr        r0,[r3,r0]
    ldr        r0,[r0,#0x0]
    str        r0,[r6,r4]
    add        r4,#0x4
    pop        {pc}

PTR_MapSetup_Internet_2_080525ac:
    .word MapSetup_Internet_2

PTR_BgTask_80515C8_080525b0:
    .word BgTask_80515C8

PTR_BgTask_8051618_080525b4:
    .word BgTask_8051618

PTR_BgTask_8051668_080525b8:
    .word BgTask_8051668

PTR_BgTask_80516B8_080525bc:
    .word BgTask_80516B8

PTR_BgTask_80516F8_080525c0:
    .word BgTask_80516F8

PTR_BgTask_8051780_080525c4:
    .word BgTask_8051780

PTR_BgTask_8051820_080525c8:
    .word BgTask_8051820

PTR_BgTask_8051738_080525cc:
    .word BgTask_8051738

DAT_080525d0:
    .word EventHandler_Internet_2

PTR_EntityAllocParams_8055428_080525d4:
    .word EntityAllocParams_8055428

PTR_FUN_080884e0_080525d8:
    .word 0x80884E1

PTR_DAT_080525dc:
    .word 0x2002110

PTR_DAT_080525e0:
    .word 0x2002110

PTR_PTR_080525e4:
    .word PTR_ARRAY_080523e0

PTR_PTR_EventHandler_Internet_2_0_080525e8:
    .word PTR_EventHandler_Internet_2_0_08052454

DAT_080525ec:
    .word 0x8086E19

PTR_BgTask_8051738_080525f0:
    .word BgTask_8051738

PTR_FUN_08088380_080525f4:
    .word 0x8088381

DAT_080525f8:
    .word 0xA01

DAT_080525fc:
    .word 0xC03

DAT_08052600:
    .word Scene_Dialogue

DAT_08052604:
    .word Scene_LockedPath

PTR_DAT_08052608:
    .word 0x2002110

PTR_PTR_0805260c:
    .word PTR_ARRAY_080523e0

PTR_BYTE_ARRAY_08052610:
    .word BYTE_ARRAY_08052434

PTR_BYTE_ARRAY_08052614:
    .word BYTE_ARRAY_08052438

PTR_BYTE_ARRAY_08052618:
    .word BYTE_ARRAY_0805243c

PTR_BYTE_ARRAY_0805261c:
    .word BYTE_ARRAY_08052440
