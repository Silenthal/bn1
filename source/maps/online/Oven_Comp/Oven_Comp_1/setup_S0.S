#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_Oven_Comp_1_S0
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,PTR_PTR_MapSetup_Default_080435f0
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_80423F8_080435f4
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8042418_080435f8
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8042448_080435fc
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8042498_08043600
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_80424D8_08043604
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8042528_08043608
    bl         BgTask_AddNew
    pop        {r5}
    pop        {pc}

PTR_MapSetup_Default_08043288:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Oven_Comp_1_F03
    .word MapSetup_Default
    .word MapSetup_Oven_Comp_1_F05
    .word MapSetup_Oven_Comp_1_F06
    .word MapSetup_Default


_ts EventHandler_Oven_Comp_1_S0
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Default_0804360c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Default_080432b4:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Oven_Comp_1_F03
    .word EventHandler_Default
    .word EventHandler_Oven_Comp_1_F05
    .word EventHandler_Oven_Comp_1_F06
    .word EventHandler_Default


_ts MapSetup_Oven_Comp_1_F03
    push       {lr}
    push       {r5}
    ldr        r7,PTR_NPCList_8043A38_08043610
    bl         Map_LoadNPCList
    mov        r0,#0xde
    bl         Flag_SetBase
    ldr        r0,PTR_EntityAllocParams_8043CF8_08043614
    bl         Entity_AllocList
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    bne        LAB_08043310
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    bne        LAB_08043310
    b          LAB_08043334
LAB_08043310:
    push       {r5}
    mov        r0,#0x9e
    bl         Flag_GetBase
    beq        LAB_08043320
    mov        r0,#0x4
    mov        r1,#0x0
    b          LAB_08043324
LAB_08043320:
    mov        r0,#0x0
    mov        r1,#0x1
LAB_08043324:
    push       {r0}
    ldr        r0,DAT_08043618
    ldr        r2,PTR_DAT_0804361c
    orr        r1,r2
    bl         Scene_Prepare
    pop        {r0}
    pop        {r5}
LAB_08043334:
    mov        r0,#0x8
    push       {r0,r5}
    mov        r0,#0x9f
    bl         Flag_GetBase
    pop        {r0,r5}
    beq        LAB_08043344
    b          LAB_08043360
LAB_08043344:
    push       {r0}
    mov        r0,#0x9e
    bl         Flag_GetBase
    pop        {r0}
    bne        LAB_08043354
    mov        r0,#0x0
    b          LAB_08043356
LAB_08043354:
    mov        r0,#0x4
LAB_08043356:
    push       {r0,r5}
    mov        r0,#0x2
    bl         Flag_Set400
    pop        {r0,r5}
LAB_08043360:
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Oven_Comp_1_F03
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Oven_Comp_1_F03_0_08043620
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Oven_Comp_1_F03_0_08043374:
    .word EventHandler_Oven_Comp_1_F03_0
    .word EventHandler_Oven_Comp_1_F03_1
    .word EventHandler_Oven_Comp_1_F03_2
    .word EventHandler_Oven_Comp_1_F03_3


_ts EventHandler_Oven_Comp_1_F03_0
    push       {lr}
    push       {r5}
    mov        r0,#0x2
    bl         Flag_Set400
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_FUN_0808419c_08043624
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x4
    str        r0,[r5,#0x0]
    pop        {pc}

    .align 2, 0


_ts EventHandler_Oven_Comp_1_F03_1
    push       {lr}
    push       {r5}
    mov        r0,#0x2
    bl         Flag_SetBase
    pop        {r5}
    bl         FUN_08043598
    beq        LAB_080433d8
    bl         GetCollisionEventAttribute
    cmp        r0,#0x10
    bne        LAB_080433d0
    push       {r5}
    ldr        r0,DAT_08043628
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x8
    str        r0,[r5,#0x0]
    b          LAB_080433d8
LAB_080433d0:
    mov        r0,#0x0
    bl         CheckForJackOut
    bne        LAB_080433d8
LAB_080433d8:
    pop        {pc}

    .align 2, 0


_ts EventHandler_Oven_Comp_1_F03_2
    push       {lr}
    bl         FUN_08043598
    beq        LAB_08043416
    push       {r5}
    mov        r0,#0xc0
    bl         Flag_GetBase
    pop        {r5}
    beq        LAB_0804340a
    bl         GetCollisionEventAttribute
    cmp        r0,#0x11
    bne        LAB_0804340e
    push       {r5}
    ldr        r0,DAT_0804362c
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0xc
    str        r0,[r5,#0x0]
    b          LAB_08043416
LAB_0804340a:
    mov        r0,#0x0
    b          LAB_08043410
LAB_0804340e:
    mov        r0,#0xff
LAB_08043410:
    bl         CheckForJackOut
    beq        LAB_08043416
LAB_08043416:
    pop        {pc}


_ts EventHandler_Oven_Comp_1_F03_3
    push       {lr}
    pop        {pc}


_ts MapSetup_Oven_Comp_1_F05
    push       {lr}
    mov        r7,#0x0
LAB_08043420:
    push       {r5,r7}
    mov        r0,#0xa0
    add        r0,r0,r7
    bl         Flag_GetBase
    pop        {r5,r7}
    beq        LAB_0804343a
    push       {r5,r7}
    mov        r0,#0x0
    add        r0,r0,r7
    bl         Flag_Set380
    pop        {r5,r7}
LAB_0804343a:
    add        r7,#0x1
    cmp        r7,#0x20
    blt        LAB_08043420
    push       {r5}
    ldr        r7,PTR_NPCList_8043A38_08043630
    bl         Map_LoadNPCList
    ldr        r0,PTR_EntityAllocParams_8043CF8_08043634
    bl         Entity_AllocList
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    mov        r0,#0xc8
    bl         Flag_GetBase
    pop        {r5}
    beq        LAB_0804347e
    push       {r5}
    mov        r0,#0xc8
    bl         Flag_ClearBase
    ldr        r0,PTR_LAB_08084bec_08043638
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_080434a0
LAB_0804347e:
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    bne        LAB_08043494
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    bne        LAB_08043494
    b          LAB_080434a0
LAB_08043494:
    push       {r5}
    ldr        r0,PTR_FUN_08084070_0804363c
    ldr        r1,PTR_DAT_0804361c
    bl         Scene_Prepare
    pop        {r5}
LAB_080434a0:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    mov        r0,#0xff
    str        r0,[r5,#0x8]
    pop        {pc}

    .align 2, 0


_ts EventHandler_Oven_Comp_1_F05
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Oven_Comp_1_F05_0_08043640
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Oven_Comp_1_F05_0_080434bc:
    .word EventHandler_Oven_Comp_1_F05_0
    .word EventHandler_Oven_Comp_1_F05_1


_ts EventHandler_Oven_Comp_1_F05_0
    push       {lr}
    push       {r5}
    mov        r0,#0xdd
    bl         Flag_GetBase
    pop        {r5}
    beq        LAB_0804350c
    push       {r5}
    mov        r0,#0xdd
    bl         Flag_ClearBase
    pop        {r5}
    mov        r7,#0x0
LAB_080434de:
    push       {r5,r7}
    mov        r0,#0x0
    add        r0,r0,r7
    bl         Flag_Clear380
    pop        {r5,r7}
    push       {r5,r7}
    mov        r0,#0xa0
    add        r0,r0,r7
    bl         Flag_ClearBase
    pop        {r5,r7}
    add        r7,#0x1
    cmp        r7,#0x20
    blt        LAB_080434de
    push       {r5}
    mov        r0,#0x8
    bl         Entity_FreeAllMultiple
    ldr        r0,DAT_08043644
    bl         Entity_AllocList
    pop        {r5}
LAB_0804350c:
    bl         FUN_080435bc
    beq        LAB_0804351a
    mov        r0,#0x0
    bl         CheckForJackOut
    beq        LAB_0804351a
LAB_0804351a:
    pop        {pc}


_ts EventHandler_Oven_Comp_1_F05_1
    push       {lr}
    pop        {pc}


_ts MapSetup_Oven_Comp_1_F06
    push       {lr}
    mov        r7,#0x0
LAB_08043524:
    push       {r5,r7}
    mov        r0,#0x0
    add        r0,r0,r7
    bl         Flag_Set380
    pop        {r5,r7}
    add        r7,#0x1
    cmp        r7,#0x20
    blt        LAB_08043524
    push       {r5}
    ldr        r7,PTR_NPCList_8043BEC_08043648
    bl         Map_LoadNPCList
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    bne        LAB_08043564
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    bne        LAB_08043564
    b          LAB_08043570
LAB_08043564:
    push       {r5}
    ldr        r0,PTR_FUN_08084070_0804364c
    ldr        r1,PTR_DAT_0804361c
    bl         Scene_Prepare
    pop        {r5}
LAB_08043570:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}

    .align 2, 0


_ts EventHandler_Oven_Comp_1_F06
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Oven_Comp_1_F06_0_08043650
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Oven_Comp_1_F06_0_08043588:
    .word EventHandler_Oven_Comp_1_F06_0


_ts EventHandler_Oven_Comp_1_F06_0
    push       {lr}
    mov        r0,#0x0
    bl         CheckForJackOut
    beq        LAB_08043596
LAB_08043596:
    pop        {pc}


_ts FUN_08043598
    push       {lr}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r1,[r0,#0xe]
    cmp        r1,#0x20
    blt        LAB_080435b6
    cmp        r1,#0x3f
    bgt        LAB_080435b6
    push       {r5}
    ldr        r0,PTR_LAB_0808464c_08043654
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x0
    pop        {pc}
LAB_080435b6:
    mov        r0,#0x1
    pop        {pc}

    .align 2, 0


_ts FUN_080435bc
    push       {lr}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r1,[r0,#0xe]
    cmp        r1,#0x20
    blt        LAB_080435ea
    cmp        r1,#0x3f
    bgt        LAB_080435ea
    push       {r1,r5}
    mov        r0,#0xa0
    add        r0,r0,r1
    sub        r0,#0x20
    bl         Flag_GetBase
    pop        {r1,r5}
    bne        LAB_080435ea
    push       {r5}
    ldr        r0,PTR_LAB_0808464c_08043658
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x0
    pop        {pc}
LAB_080435ea:
    mov        r0,#0x1
    pop        {pc}

    .align 2, 0

PTR_PTR_MapSetup_Default_080435f0:
    .word PTR_MapSetup_Default_08043288

PTR_BgTask_80423F8_080435f4:
    .word BgTask_80423F8

PTR_BgTask_8042418_080435f8:
    .word BgTask_8042418

PTR_BgTask_8042448_080435fc:
    .word BgTask_8042448

PTR_BgTask_8042498_08043600:
    .word BgTask_8042498

PTR_BgTask_80424D8_08043604:
    .word BgTask_80424D8

PTR_BgTask_8042528_08043608:
    .word BgTask_8042528

PTR_PTR_EventHandler_Default_0804360c:
    .word PTR_EventHandler_Default_080432b4

PTR_NPCList_8043A38_08043610:
    .word NPCList_8043A38

PTR_EntityAllocParams_8043CF8_08043614:
    .word EntityAllocParams_8043CF8

DAT_08043618:
    .word 0x8084071

PTR_DAT_0804361c:
    .word 0x2000

PTR_PTR_EventHandler_Oven_Comp_1_F03_0_08043620:
    .word PTR_EventHandler_Oven_Comp_1_F03_0_08043374

PTR_FUN_0808419c_08043624:
    .word 0x808419D

DAT_08043628:
    .word 0x8084255

DAT_0804362c:
    .word 0x8084369

PTR_NPCList_8043A38_08043630:
    .word NPCList_8043A38

PTR_EntityAllocParams_8043CF8_08043634:
    .word EntityAllocParams_8043CF8

PTR_LAB_08084bec_08043638:
    .word 0x8084BED

PTR_FUN_08084070_0804363c:
    .word 0x8084071

PTR_PTR_EventHandler_Oven_Comp_1_F05_0_08043640:
    .word PTR_EventHandler_Oven_Comp_1_F05_0_080434bc

DAT_08043644:
    .word EntityAllocParams_8043CF8

PTR_NPCList_8043BEC_08043648:
    .word NPCList_8043BEC

PTR_FUN_08084070_0804364c:
    .word 0x8084071

PTR_PTR_EventHandler_Oven_Comp_1_F06_0_08043650:
    .word PTR_EventHandler_Oven_Comp_1_F06_0_08043588

PTR_LAB_0808464c_08043654:
    .word 0x808464D

PTR_LAB_0808464c_08043658:
    .word 0x808464D
