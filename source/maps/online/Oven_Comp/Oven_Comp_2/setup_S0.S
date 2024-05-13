#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set PlayerLocation_Create, 0x8056020+1


_ts MapSetup_Oven_Comp_2_S0
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,PTR_PTR_MapSetup_Default_08043830
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_80423F8_08043834
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8042418_08043838
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8042448_0804383c
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8042498_08043840
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_80424D8_08043844
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8042528_08043848
    bl         BgTask_AddNew
    pop        {r5}
    pop        {pc}

PTR_MapSetup_Default_08043698:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Oven_Comp_2_F05
    .word MapSetup_Oven_Comp_2_F06
    .word MapSetup_Default


_ts EventHandler_Oven_Comp_2_S0
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Default_0804384c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Default_080436c4:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Oven_Comp_2_F05
    .word EventHandler_Oven_Comp_2_F06
    .word EventHandler_Default


_ts MapSetup_Oven_Comp_2_F05
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    mov        r7,#0x0
LAB_080436fa:
    push       {r5,r7}
    mov        r0,#0xa0
    add        r0,r0,r7
    bl         Flag_GetBase
    pop        {r5,r7}
    beq        LAB_08043714
    push       {r5,r7}
    mov        r0,#0x0
    add        r0,r0,r7
    bl         Flag_Set380
    pop        {r5,r7}
LAB_08043714:
    add        r7,#0x1
    cmp        r7,#0x20
    blt        LAB_080436fa
    push       {r5}
    mov        r0,#0xc9
    bl         Flag_GetBase
    pop        {r5}
    beq        LAB_0804373c
    push       {r5}
    ldr        r0,PTR_LAB_08084ecc_08043850
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x4
    str        r0,[r5,#0x0]
    mov        r0,#0xff
    str        r0,[r5,#0x8]
    pop        {pc}
LAB_0804373c:
    push       {r5}
    ldr        r7,PTR_NPCList_8043C2C_08043854
    bl         Map_LoadNPCList
    ldr        r0,PTR_EntityAllocParams_8043D4C_08043858
    bl         Entity_AllocList
    pop        {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    bne        LAB_08043762
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    bne        LAB_08043762
    b          LAB_0804376e
LAB_08043762:
    push       {r5}
    ldr        r0,DAT_0804385c
    ldr        r1,PTR_DAT_08043860
    bl         Scene_Prepare
    pop        {r5}
LAB_0804376e:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    mov        r0,#0xff
    str        r0,[r5,#0x8]
    pop        {pc}


_ts EventHandler_Oven_Comp_2_F05
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Oven_Comp_2_F05_0_08043864
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Oven_Comp_2_F05_0_08043788:
    .word EventHandler_Oven_Comp_2_F05_0
    .word EventHandler_Oven_Comp_2_F05_1


_ts EventHandler_Oven_Comp_2_F05_0
    push       {lr}
    bl         FUN_080435bc
    beq        LAB_080437b8
    bl         GetCollisionEventAttribute
    cmp        r0,#0x10
    bne        LAB_080437b0
    push       {r5}
    ldr        r0,DAT_08043868
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x4
    str        r0,[r5,#0x0]
LAB_080437b0:
    mov        r0,#0x0
    bl         CheckForJackOut
    beq        LAB_080437b8
LAB_080437b8:
    pop        {pc}

    .align 2, 0


_ts EventHandler_Oven_Comp_2_F05_1
    push       {lr}
    pop        {pc}


_ts MapSetup_Oven_Comp_2_F06
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    mov        r7,#0x0
LAB_080437d6:
    push       {r5,r7}
    mov        r0,#0x0
    add        r0,r0,r7
    bl         Flag_Set380
    pop        {r5,r7}
    add        r7,#0x1
    cmp        r7,#0x20
    blt        LAB_080437d6
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    bne        LAB_080437fe
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    bne        LAB_080437fe
    b          LAB_0804380a
LAB_080437fe:
    push       {r5}
    ldr        r0,PTR_FUN_08084070_0804386c
    ldr        r1,PTR_DAT_08043860
    bl         Scene_Prepare
    pop        {r5}
LAB_0804380a:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Oven_Comp_2_F06
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Oven_Comp_2_F06_0_08043870
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Oven_Comp_2_F06_0_08043820:
    .word EventHandler_Oven_Comp_2_F06_0


_ts EventHandler_Oven_Comp_2_F06_0
    push       {lr}
    mov        r0,#0x0
    bl         CheckForJackOut
    beq        LAB_0804382e
LAB_0804382e:
    pop        {pc}

PTR_PTR_MapSetup_Default_08043830:
    .word PTR_MapSetup_Default_08043698

PTR_BgTask_80423F8_08043834:
    .word BgTask_80423F8

PTR_BgTask_8042418_08043838:
    .word BgTask_8042418

PTR_BgTask_8042448_0804383c:
    .word BgTask_8042448

PTR_BgTask_8042498_08043840:
    .word BgTask_8042498

PTR_BgTask_80424D8_08043844:
    .word BgTask_80424D8

PTR_BgTask_8042528_08043848:
    .word BgTask_8042528

PTR_PTR_EventHandler_Default_0804384c:
    .word PTR_EventHandler_Default_080436c4

PTR_LAB_08084ecc_08043850:
    .word 0x8084ECD

PTR_NPCList_8043C2C_08043854:
    .word NPCList_8043C2C

PTR_EntityAllocParams_8043D4C_08043858:
    .word EntityAllocParams_8043D4C

DAT_0804385c:
    .word 0x8084071

PTR_DAT_08043860:
    .word 0x2000

PTR_PTR_EventHandler_Oven_Comp_2_F05_0_08043864:
    .word PTR_EventHandler_Oven_Comp_2_F05_0_08043788

DAT_08043868:
    .word 0x8084D21

PTR_FUN_08084070_0804386c:
    .word 0x8084071

PTR_PTR_EventHandler_Oven_Comp_2_F06_0_08043870:
    .word PTR_EventHandler_Oven_Comp_2_F06_0_08043820
