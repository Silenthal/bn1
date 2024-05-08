#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set FUN_0808f208, 0x808F209
    .set PlayerLocation_Create, 0x8056020
    .set FUN_0808498c, 0x808498D
    .set FUN_0802d7e4, 0x802D7E4
    .set LAB_08088900, 0x8088901
    .set FUN_08083a84, 0x8083A85
    .set FUN_0808387c, 0x808387D
    .set FUN_08093610, 0x8093611
    .set LAB_08084ff0, 0x8084FF1
    .set FUN_08084714, 0x8084715


_ts MapSetup_ACDC_Lan_Living_Room_S0
    push       {lr}
    push       {r1,r5}
    mov        r0,#0x0
    bl         Flag_Set380
    mov        r0,#0x1
    bl         Flag_Set380
    mov        r0,#0x48
    bl         Flag_Set380
    mov        r0,#0x49
    bl         Flag_Set380
    pop        {r1,r5}
    ldr        r0,PTR_PTR_MapSetup_ACDC_Lan_Living_Room_F00_0802bfb4
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_PTR_MapSetup_ACDC_Lan_Living_Room_F00_0802bfb4:
    .word PTR_MapSetup_ACDC_Lan_Living_Room_F00_0802bfb8
PTR_MapSetup_ACDC_Lan_Living_Room_F00_0802bfb8:
    .word MapSetup_ACDC_Lan_Living_Room_F00
    .word MapSetup_Default
    .word MapSetup_ACDC_Lan_Living_Room_F02
    .word MapSetup_ACDC_Lan_Living_Room_F03
    .word MapSetup_ACDC_Lan_Living_Room_F04
    .word MapSetup_ACDC_Lan_Living_Room_F05
    .word MapSetup_ACDC_Lan_Living_Room_F06
    .word MapSetup_Default


_ts EventHandler_ACDC_Lan_Living_Room_S0
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Lan_Living_Room_F00_0802bfe4
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_PTR_EventHandler_ACDC_Lan_Living_Room_F00_0802bfe4:
    .word PTR_EventHandler_ACDC_Lan_Living_Room_F00_0802bfe8
PTR_EventHandler_ACDC_Lan_Living_Room_F00_0802bfe8:
    .word EventHandler_ACDC_Lan_Living_Room_F00
    .word EventHandler_Default
    .word EventHandler_ACDC_Lan_Living_Room_F02
    .word EventHandler_ACDC_Lan_Living_Room_F03
    .word EventHandler_ACDC_Lan_Living_Room_F04
    .word EventHandler_ACDC_Lan_Living_Room_F05
    .word EventHandler_ACDC_Lan_Living_Room_F06
    .word EventHandler_Default


_ts MapSetup_ACDC_Lan_Living_Room_F00
    push       {lr}
    push       {r5}
    mov        r0,#0x2
    bl         Sound_ChangeSong
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_PTR_DAT_0802c044
    bl         Map_LoadNPCList
    ldr        r0,PTR_DAT_0802c040
    bl         Entity_AllocList
    ldr        r0,PTR_BgTask_0802C03C
    bl         BgTask_AddNew
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}

    .align 2, 0

PTR_BgTask_0802C03C:
    .word BgTask_ACDC_Lan_Living_Room_TV_Regular
PTR_DAT_0802c040:
    .word EntityAllocParams_08030DD4
PTR_PTR_DAT_0802c044:
    .word NPCList_80305AC


_ts EventHandler_ACDC_Lan_Living_Room_F00
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Lan_Living_Room_F00_0_0802c058
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_PTR_EventHandler_ACDC_Lan_Living_Room_F00_0_0802c058:
    .word PTR_EventHandler_ACDC_Lan_Living_Room_F00_0_0802c05c
PTR_EventHandler_ACDC_Lan_Living_Room_F00_0_0802c05c:
    .word EventHandler_ACDC_Lan_Living_Room_F00_0


_ts EventHandler_ACDC_Lan_Living_Room_F00_0
    push       {lr}
    pop        {pc}


_ts MapSetup_ACDC_Lan_Living_Room_F02
    push       {lr}
    push       {r5}
    mov        r0,#0x2
    bl         Sound_ChangeSong
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_PTR_DAT_0802c464
    bl         Map_LoadNPCList
    ldr        r0,PTR_DAT_0802c468
    bl         Entity_AllocList
    ldr        r0,PTR_BgTask_0802C46C
    bl         BgTask_AddNew
    mov        r0,#0x98
    bl         Flag_GetBase
    pop        {r5}
    bne        LAB_0802c09c
    mov        r0,#0x0
    b          LAB_0802c09e
LAB_0802c09c:
    mov        r0,#0x4
LAB_0802c09e:
    str        r0,[r5,#0x0]
    pop        {pc}

    .align 2, 0



_ts EventHandler_ACDC_Lan_Living_Room_F02
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Lan_Living_Room_F02_0_0802c470
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_Lan_Living_Room_F02_0_0802c0b4:
    .word EventHandler_ACDC_Lan_Living_Room_F02_0
    .word EventHandler_ACDC_Lan_Living_Room_F02_1


_ts EventHandler_ACDC_Lan_Living_Room_F02_0
    push       {lr}
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x10
    beq        LAB_0802c0d4
    b          LAB_0802c0e4
LAB_0802c0d4:
    push       {r5}
    ldr        r0,PTR_FUN_0808387c_0802c474
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x4
    str        r0,[r5,#0x0]
LAB_0802c0e4:
    pop        {pc}

    .align 2, 0



_ts EventHandler_ACDC_Lan_Living_Room_F02_1
    push       {lr}
    push       {r5}
    mov        r0,#0xe1
    bl         Flag_GetBase
    pop        {r5}
    beq        LAB_0802c120
    push       {r5}
    mov        r0,#0x1
    bl         Flag_Set410
    pop        {r5}
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_0802c120
    push       {r5}
    ldr        r0,DAT_0802c478
    ldr        r1,DAT_0802c47c
    bl         Scene_Prepare
    pop        {r5}
LAB_0802c120:
    pop        {pc}

    .align 2, 0



_ts MapSetup_ACDC_Lan_Living_Room_F03
    push       {lr}
    push       {r5}
    mov        r0,#0x4
    bl         Sound_ChangeSong
    mov        r0,#0x0
    bl         Flag_Clear380
    mov        r0,#0x48
    bl         Flag_Clear380
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_PTR_DAT_0802c480
    bl         Map_LoadNPCList
    ldr        r0,PTR_DAT_0802c484
    bl         Entity_AllocList
    ldr        r0,PTR_LAB_0802c488
    bl         Entity_AllocList
    mov        r0,#0x1
    bl         Flag_Set410
    ldr        r0,PTR_BgTask_0802C48C
    bl         BgTask_AddNew
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}

    .align 2, 0



_ts EventHandler_ACDC_Lan_Living_Room_F03
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Lan_Living_Room_F03_0_0802c490
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_Lan_Living_Room_F03_0_0802c180:
    .word EventHandler_ACDC_Lan_Living_Room_F03_0
    .word EventHandler_ACDC_Lan_Living_Room_F03_1


_ts EventHandler_ACDC_Lan_Living_Room_F03_0
    push       {lr}
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_0802c1ac
    push       {r5}
    ldr        r0,DAT_0802c494
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_0802c1f0
LAB_0802c1ac:
    cmp        r0,#0x40
    beq        LAB_0802c1ba
    cmp        r0,#0xf8
    beq        LAB_0802c1ba
    cmp        r0,#0xf9
    beq        LAB_0802c1ba
    b          LAB_0802c1f0
LAB_0802c1ba:
    push       {r5}
    mov        r0,#0x9c
    bl         Flag_GetBase
    pop        {r5}
    beq        LAB_0802c1f0
    mov        r0,r10
    ldr        r0,[r0,#0x4]
    ldrh       r0,[r0,#0x2]
    ldr        r1,DAT_0802c498
    and        r1,r0
    beq        LAB_0802c1f0
    bl         dummy_187a0
    bne        LAB_0802c1f0
    mov        r0,#0x80
    bl         Text_CheckOption
    bne        LAB_0802c1f0
    push       {r5}
    ldr        r0,DAT_0802c49c
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x4
    str        r0,[r5,#0x0]
LAB_0802c1f0:
    pop        {pc}

    .align 2, 0



_ts EventHandler_ACDC_Lan_Living_Room_F03_1
    push       {lr}
    pop        {pc}


_ts MapSetup_ACDC_Lan_Living_Room_F04
    push       {lr}
    push       {r5}
    mov        r0,#0x4
    bl         Sound_ChangeSong
    mov        r0,#0x0
    bl         Flag_Clear380
    mov        r0,#0x1
    bl         Flag_Clear380
    mov        r0,#0x48
    bl         Flag_Clear380
    mov        r0,#0x49
    bl         Flag_Clear380
    mov        r0,#0x0
    bl         PetStatusControl_SetState
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_PTR_DAT_0802c4a0
    bl         Map_LoadNPCList
    ldr        r0,PTR_DAT_0802c4a4
    bl         Entity_AllocList
    ldr        r0,PTR_DAT_0802c4a8
    bl         Entity_AllocList
    mov        r0,#0x1
    bl         Flag_Set410
    ldr        r0,PTR_BgTask_0802C4AC
    bl         BgTask_AddNew
    mov        r0,#0xc4
    bl         Flag_GetBase
    pop        {r5}
    beq        LAB_0802c25c
    mov        r0,#0x4
    str        r0,[r5,#0x0]
    pop        {pc}
LAB_0802c25c:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}

    .align 2, 0



_ts EventHandler_ACDC_Lan_Living_Room_F04
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Lan_Living_Room_F04_0_0802c4b0
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_Lan_Living_Room_F04_0_0802c274:
    .word EventHandler_ACDC_Lan_Living_Room_F04_0
    .word EventHandler_ACDC_Lan_Living_Room_F04_1
    .word EventHandler_ACDC_Lan_Living_Room_F04_2


_ts EventHandler_ACDC_Lan_Living_Room_F04_0
    push       {lr}
    push       {r5}
    mov        r0,#0xc4
    bl         Flag_GetBase
    pop        {r5}
    bne        LAB_0802c29a
    push       {r5}
    ldr        r0,PTR_FUN_08084714_0802c4b4
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_0802c29a:
    mov        r0,#0x4
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_ACDC_Lan_Living_Room_F04_1
    push       {lr}
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x40
    beq        LAB_0802c2c0
    cmp        r0,#0xf8
    beq        LAB_0802c2c0
    cmp        r0,#0xf9
    beq        LAB_0802c2c0
    b          LAB_0802c2de
LAB_0802c2c0:
    push       {r0,r5}
    mov        r0,#0x1
    bl         Flag_Get280
    pop        {r0,r5}
    beq        LAB_0802c2de
    push       {r5}
    ldr        r0,PTR_FUN_0808498c_0802c4b8
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x8
    str        r0,[r5,#0x0]
    b          LAB_0802c2ee
LAB_0802c2de:
    cmp        r0,#0x2
    bne        LAB_0802c2ee
    push       {r5}
    ldr        r0,PTR_FUN_08083a84_0802c4bc
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_0802c2ee:
    pop        {pc}


_ts EventHandler_ACDC_Lan_Living_Room_F04_2
    push       {lr}
    pop        {pc}


_ts MapSetup_ACDC_Lan_Living_Room_F05
    push       {lr}
    push       {r5}
    mov        r0,#0x4
    bl         Sound_ChangeSong
    mov        r0,#0x0
    bl         Flag_Clear380
    mov        r0,#0x1
    bl         Flag_Clear380
    mov        r0,#0x48
    bl         Flag_Clear380
    mov        r0,#0x49
    bl         Flag_Clear380
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_PTR_DAT_0802c4c0
    bl         Map_LoadNPCList
    ldr        r0,PTR_DAT_0802c4c4
    bl         Entity_AllocList
    ldr        r0,PTR_DAT_0802c4c8
    bl         Entity_AllocList
    mov        r0,#0x1
    bl         Flag_Set410
    ldr        r0,PTR_BgTask_0802C4CC
    bl         BgTask_AddNew
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}

    .align 2, 0



_ts EventHandler_ACDC_Lan_Living_Room_F05
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Lan_Living_Room_F05_0_0802c4d0
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_Lan_Living_Room_F05_0_0802c35c:
    .word EventHandler_ACDC_Lan_Living_Room_F05_0


_ts EventHandler_ACDC_Lan_Living_Room_F05_0
    push       {lr}
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_0802c384
    push       {r5}
    ldr        r0,DAT_0802c4d4
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_0802c3b8
LAB_0802c384:
    cmp        r0,#0x40
    beq        LAB_0802c392
    cmp        r0,#0xf8
    beq        LAB_0802c392
    cmp        r0,#0xf9
    beq        LAB_0802c392
    b          LAB_0802c3b8
LAB_0802c392:
    mov        r0,r10
    ldr        r0,[r0,#0x4]
    ldrh       r0,[r0,#0x2]
    ldr        r1,DAT_0802c498
    and        r1,r0
    beq        LAB_0802c3b8
    bl         dummy_187a0
    bne        LAB_0802c3b8
    mov        r0,#0x80
    bl         Text_CheckOption
    bne        LAB_0802c3b8
    push       {r5}
    ldr        r0,DAT_0802c4d8
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_0802c3b8:
    pop        {pc}

    .align 2, 0



_ts MapSetup_ACDC_Lan_Living_Room_F06
    push       {lr}
    push       {r5}
    mov        r0,#0x2
    bl         Sound_ChangeSong
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_PTR_DAT_0802c4dc
    bl         Map_LoadNPCList
    ldr        r0,PTR_DAT_0802c4e0
    bl         Entity_AllocList
    ldr        r0,PTR_BgTask_0802C4E4
    bl         BgTask_AddNew
    pop        {r5}
    push       {r5}
    mov        r0,#0xdf
    bl         Flag_GetBase
    pop        {r5}
    bne        LAB_0802c400
    push       {r5}
    ldr        r0,PTR_LAB_08084ff0_0802c4e8
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_0802c400:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}

    .align 2, 0



_ts EventHandler_ACDC_Lan_Living_Room_F06
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Lan_Living_Room_F06_0_0802c4ec
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_Lan_Living_Room_F06_0_0802c418:
    .word EventHandler_ACDC_Lan_Living_Room_F06_0


_ts EventHandler_ACDC_Lan_Living_Room_F06_0
    push       {lr}
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x40
    beq        LAB_0802c43c
    cmp        r0,#0xf8
    beq        LAB_0802c43c
    cmp        r0,#0xf9
    beq        LAB_0802c43c
    b          LAB_0802c462
LAB_0802c43c:
    mov        r0,r10
    ldr        r0,[r0,#0x4]
    ldrh       r0,[r0,#0x2]
    ldr        r1,DAT_0802c498
    and        r1,r0
    beq        LAB_0802c462
    bl         dummy_187a0
    bne        LAB_0802c462
    mov        r0,#0x80
    bl         Text_CheckOption
    bne        LAB_0802c462
    push       {r5}
    ldr        r0,DAT_0802c4f0
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_0802c462:
    pop        {pc}
PTR_PTR_DAT_0802c464:
    .word NPCList_8030628
PTR_DAT_0802c468:
    .word EntityAllocParams_08030DD4
PTR_BgTask_0802C46C:
    .word BgTask_ACDC_Lan_Living_Room_TV_Regular
PTR_PTR_EventHandler_ACDC_Lan_Living_Room_F02_0_0802c470:
    .word PTR_EventHandler_ACDC_Lan_Living_Room_F02_0_0802c0b4
PTR_FUN_0808387c_0802c474:
    .word FUN_0808387c
DAT_0802c478:
    .word 0x8082DE5
DAT_0802c47c:
    .word 0x707
PTR_PTR_DAT_0802c480:
    .word NPCList_8030674
PTR_DAT_0802c484:
    .word EntityAllocParams_08030DD4
PTR_LAB_0802c488:
    .word EntityAllocParams_08030E00
PTR_BgTask_0802C48C:
    .word BgTask_ACDC_Lan_Living_Room_TV_Regular
PTR_PTR_EventHandler_ACDC_Lan_Living_Room_F03_0_0802c490:
    .word PTR_EventHandler_ACDC_Lan_Living_Room_F03_0_0802c180
DAT_0802c494:
    .word 0x8083A85
DAT_0802c498:
    .word 0x100
DAT_0802c49c:
    .word 0x8083EED
PTR_PTR_DAT_0802c4a0:
    .word NPCList_803069C
PTR_DAT_0802c4a4:
    .word EntityAllocParams_08030DD4
PTR_DAT_0802c4a8:
    .word EntityAllocParams_08030E54
PTR_BgTask_0802C4AC:
    .word BgTask_ACDC_Lan_Living_Room_TV_Regular
PTR_PTR_EventHandler_ACDC_Lan_Living_Room_F04_0_0802c4b0:
    .word PTR_EventHandler_ACDC_Lan_Living_Room_F04_0_0802c274
PTR_FUN_08084714_0802c4b4:
    .word FUN_08084714
PTR_FUN_0808498c_0802c4b8:
    .word FUN_0808498c
PTR_FUN_08083a84_0802c4bc:
    .word FUN_08083a84
PTR_PTR_DAT_0802c4c0:
    .word NPCList_80306D8
PTR_DAT_0802c4c4:
    .word EntityAllocParams_08030DD4
PTR_DAT_0802c4c8:
    .word EntityAllocParams_08030F0C
PTR_BgTask_0802C4CC:
    .word BgTask_ACDC_Lan_Living_Room_TV_Regular
PTR_PTR_EventHandler_ACDC_Lan_Living_Room_F05_0_0802c4d0:
    .word PTR_EventHandler_ACDC_Lan_Living_Room_F05_0_0802c35c
DAT_0802c4d4:
    .word 0x8083A85
DAT_0802c4d8:
    .word 0x8083EED
PTR_PTR_DAT_0802c4dc:
    .word NPCList_80306F8
PTR_DAT_0802c4e0:
    .word EntityAllocParams_08030DD4
PTR_BgTask_0802C4E4:
    .word BgTask_ACDC_Lan_Living_Room_TV_Regular
PTR_LAB_08084ff0_0802c4e8:
    .word LAB_08084ff0
PTR_PTR_EventHandler_ACDC_Lan_Living_Room_F06_0_0802c4ec:
    .word PTR_EventHandler_ACDC_Lan_Living_Room_F06_0_0802c418
DAT_0802c4f0:
    .word 0x8083EED


_ts MapSetup_ACDC_Lan_Living_Room_S2
    push       {lr}
    push       {r1,r5}
    mov        r0,#0x0
    bl         Flag_Set380
    mov        r0,#0x1
    bl         Flag_Set380
    mov        r0,#0x48
    bl         Flag_Set380
    mov        r0,#0x49
    bl         Flag_Set380
    pop        {r1,r5}
    ldr        r0,PTR_PTR_MapSetup_ACDC_Lan_Living_Room_F20_0802c6b0
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r0,#0xab
    bl         Flag_GetBase
    beq        LAB_0802c52e
    push       {r5}
    mov        r0,#0x4
    bl         Sound_ChangeSong
    pop        {r5}
    b          LAB_0802c546
LAB_0802c52e:
    mov        r0,#0xdf
    bl         Flag_GetBase
    beq        LAB_0802c542
    push       {r5}
    mov        r0,#0x3
    bl         Sound_ChangeSong
    pop        {r5}
    b          LAB_0802c546
LAB_0802c542:
    bl         Sound_AreaSongChange
LAB_0802c546:
    pop        {pc}
PTR_MapSetup_ACDC_Lan_Living_Room_F20_0802c548:
    .word MapSetup_ACDC_Lan_Living_Room_F20
    .word MapSetup_ACDC_Lan_Living_Room_F20
    .word MapSetup_ACDC_Lan_Living_Room_F20
    .word MapSetup_ACDC_Lan_Living_Room_F23
    .word MapSetup_ACDC_Lan_Living_Room_F24
    .word MapSetup_ACDC_Lan_Living_Room_F24
    .word MapSetup_ACDC_Lan_Living_Room_F24
    .word MapSetup_ACDC_Lan_Living_Room_F24


_ts EventHandler_ACDC_Lan_Living_Room_S2
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Lan_Living_Room_F20_0802c6b4
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r1,#0xa
    bl         FUN_0802d7e4
    pop        {pc}

    .align 2, 0

PTR_EventHandler_ACDC_Lan_Living_Room_F20_0802c57c:
    .word EventHandler_ACDC_Lan_Living_Room_F20
    .word EventHandler_ACDC_Lan_Living_Room_F20
    .word EventHandler_ACDC_Lan_Living_Room_F20
    .word EventHandler_ACDC_Lan_Living_Room_F23
    .word EventHandler_ACDC_Lan_Living_Room_F24
    .word EventHandler_ACDC_Lan_Living_Room_F24
    .word EventHandler_ACDC_Lan_Living_Room_F24
    .word EventHandler_ACDC_Lan_Living_Room_F24


_ts MapSetup_ACDC_Lan_Living_Room_F20
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_PTR_DAT_0802c6b8
    bl         Map_LoadNPCList
    ldr        r0,PTR_DAT_0802c6bc
    bl         Entity_AllocList
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_BgTask_0802C6C0
    bl         BgTask_AddNew
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_ACDC_Lan_Living_Room_F20
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Lan_Living_Room_F20_0_0802c6c4
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_Lan_Living_Room_F20_0_0802c5e0:
    .word EventHandler_ACDC_Lan_Living_Room_F20_0


_ts EventHandler_ACDC_Lan_Living_Room_F20_0
    push       {lr}
    pop        {pc}


_ts MapSetup_ACDC_Lan_Living_Room_F23
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    mov        r0,#0x9e
    bl         Flag_GetBase
    bne        LAB_0802c60e
    ldr        r7,PTR_PTR_DAT_0802c6c8
    bl         Map_LoadNPCList
    b          LAB_0802c614
LAB_0802c60e:
    ldr        r7,PTR_PTR_DAT_0802c6cc
    bl         Map_LoadNPCList
LAB_0802c614:
    ldr        r0,PTR_DAT_0802c6d0
    bl         Entity_AllocList
    ldr        r0,PTR_BgTask_0802C6D4
    bl         BgTask_AddNew
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_ACDC_Lan_Living_Room_F23
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Lan_Living_Room_F23_0_0802c6d8
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_Lan_Living_Room_F23_0_0802c638:
    .word EventHandler_ACDC_Lan_Living_Room_F23_0


_ts EventHandler_ACDC_Lan_Living_Room_F23_0
    push       {lr}
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x10
    bne        LAB_0802c666
    mov        r0,#0x9e
    bl         Flag_GetBase
    bne        LAB_0802c666
    push       {r5}
    ldr        r0,PTR_LAB_08088900_0802c6dc
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_0802c666:
    pop        {pc}


_ts MapSetup_ACDC_Lan_Living_Room_F24
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_PTR_DAT_0802c6e0
    bl         Map_LoadNPCList
    ldr        r0,PTR_DAT_0802c6e4
    bl         Entity_AllocList
    ldr        r0,PTR_BgTask_0802C6E8
    bl         BgTask_AddNew
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_ACDC_Lan_Living_Room_F24
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Lan_Living_Room_F24_0_0802c6ec
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_Lan_Living_Room_F24_0_0802c6a8:
    .word EventHandler_ACDC_Lan_Living_Room_F24_0


_ts EventHandler_ACDC_Lan_Living_Room_F24_0
    push       {lr}
    pop        {pc}
PTR_PTR_MapSetup_ACDC_Lan_Living_Room_F20_0802c6b0:
    .word PTR_MapSetup_ACDC_Lan_Living_Room_F20_0802c548
PTR_PTR_EventHandler_ACDC_Lan_Living_Room_F20_0802c6b4:
    .word PTR_EventHandler_ACDC_Lan_Living_Room_F20_0802c57c
PTR_PTR_DAT_0802c6b8:
    .word NPCList_8030718
PTR_DAT_0802c6bc:
    .word EntityAllocParams_08030DD4
PTR_BgTask_0802C6C0:
    .word BgTask_ACDC_Lan_Living_Room_TV_Regular
PTR_PTR_EventHandler_ACDC_Lan_Living_Room_F20_0_0802c6c4:
    .word PTR_EventHandler_ACDC_Lan_Living_Room_F20_0_0802c5e0
PTR_PTR_DAT_0802c6c8:
    .word NPCList_8030770
PTR_PTR_DAT_0802c6cc:
    .word NPCList_8030718
PTR_DAT_0802c6d0:
    .word EntityAllocParams_08030DD4
PTR_BgTask_0802C6D4:
    .word BgTask_ACDC_Lan_Living_Room_TV_Regular
PTR_PTR_EventHandler_ACDC_Lan_Living_Room_F23_0_0802c6d8:
    .word PTR_EventHandler_ACDC_Lan_Living_Room_F23_0_0802c638
PTR_LAB_08088900_0802c6dc:
    .word LAB_08088900
PTR_PTR_DAT_0802c6e0:
    .word NPCList_8030790
PTR_DAT_0802c6e4:
    .word EntityAllocParams_08030DD4
PTR_BgTask_0802C6E8:
    .word BgTask_ACDC_Lan_Living_Room_TV_Regular
PTR_PTR_EventHandler_ACDC_Lan_Living_Room_F24_0_0802c6ec:
    .word PTR_EventHandler_ACDC_Lan_Living_Room_F24_0_0802c6a8


_ts MapSetup_ACDC_Lan_Living_Room_S3
    push       {lr}
    push       {r1,r5}
    mov        r0,#0x0
    bl         Flag_Set380
    mov        r0,#0x1
    bl         Flag_Set380
    mov        r0,#0x48
    bl         Flag_Set380
    mov        r0,#0x49
    bl         Flag_Set380
    pop        {r1,r5}
    ldr        r0,PTR_PTR_MapSetup_ACDC_Lan_Living_Room_F30_0802c7b8
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Sound_AreaSongChange
    pop        {pc}
PTR_MapSetup_ACDC_Lan_Living_Room_F30_0802c71c:
    .word MapSetup_ACDC_Lan_Living_Room_F30
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default


_ts EventHandler_ACDC_Lan_Living_Room_S3
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Lan_Living_Room_F30_0802c7bc
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r1,#0xa
    bl         FUN_0802d7e4
    pop        {pc}

    .align 2, 0

PTR_EventHandler_ACDC_Lan_Living_Room_F30_0802c750:
    .word EventHandler_ACDC_Lan_Living_Room_F30
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default


_ts MapSetup_ACDC_Lan_Living_Room_F30
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_PTR_DAT_0802c7c0
    bl         Map_LoadNPCList
    ldr        r0,PTR_DAT_0802c7c4
    bl         Entity_AllocList
    ldr        r0,PTR_BgTask_0802C7C8
    bl         BgTask_AddNew
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_ACDC_Lan_Living_Room_F30
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Lan_Living_Room_F30_0_0802c7cc
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_Lan_Living_Room_F30_0_0802c7b0:
    .word EventHandler_ACDC_Lan_Living_Room_F30_0


_ts EventHandler_ACDC_Lan_Living_Room_F30_0
    push       {lr}
    pop        {pc}
PTR_PTR_MapSetup_ACDC_Lan_Living_Room_F30_0802c7b8:
    .word PTR_MapSetup_ACDC_Lan_Living_Room_F30_0802c71c
PTR_PTR_EventHandler_ACDC_Lan_Living_Room_F30_0802c7bc:
    .word PTR_EventHandler_ACDC_Lan_Living_Room_F30_0802c750
PTR_PTR_DAT_0802c7c0:
    .word NPCList_80307B0
PTR_DAT_0802c7c4:
    .word EntityAllocParams_08030DD4
PTR_BgTask_0802C7C8:
    .word BgTask_ACDC_Lan_Living_Room_TV_Regular
PTR_PTR_EventHandler_ACDC_Lan_Living_Room_F30_0_0802c7cc:
    .word PTR_EventHandler_ACDC_Lan_Living_Room_F30_0_0802c7b0


_ts MapSetup_ACDC_Lan_Living_Room_S4
    push       {lr}
    push       {r1,r5}
    mov        r0,#0x0
    bl         Flag_Set380
    mov        r0,#0x1
    bl         Flag_Set380
    mov        r0,#0x48
    bl         Flag_Set380
    mov        r0,#0x49
    bl         Flag_Set380
    pop        {r1,r5}
    ldr        r0,PTR_PTR_MapSetup_ACDC_Lan_Living_Room_F40_0802c8bc
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Sound_AreaSongChange
    pop        {pc}
PTR_MapSetup_ACDC_Lan_Living_Room_F40_0802c7fc:
    .word MapSetup_ACDC_Lan_Living_Room_F40
    .word MapSetup_ACDC_Lan_Living_Room_F40
    .word MapSetup_ACDC_Lan_Living_Room_F40
    .word MapSetup_ACDC_Lan_Living_Room_F40
    .word MapSetup_ACDC_Lan_Living_Room_F40
    .word MapSetup_ACDC_Lan_Living_Room_F40
    .word MapSetup_ACDC_Lan_Living_Room_F40
    .word MapSetup_ACDC_Lan_Living_Room_F40


_ts EventHandler_ACDC_Lan_Living_Room_S4
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Lan_Living_Room_F40_0802c8c0
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r1,#0xa
    bl         FUN_0802d7e4
    pop        {pc}

    .align 2, 0

PTR_EventHandler_ACDC_Lan_Living_Room_F40_0802c830:
    .word EventHandler_ACDC_Lan_Living_Room_F40
    .word EventHandler_ACDC_Lan_Living_Room_F40
    .word EventHandler_ACDC_Lan_Living_Room_F40
    .word EventHandler_ACDC_Lan_Living_Room_F40
    .word EventHandler_ACDC_Lan_Living_Room_F40
    .word EventHandler_ACDC_Lan_Living_Room_F40
    .word EventHandler_ACDC_Lan_Living_Room_F40
    .word EventHandler_ACDC_Lan_Living_Room_F40


_ts MapSetup_ACDC_Lan_Living_Room_F40
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    mov        r0,#0x95
    bl         Flag_GetBase
    bne        LAB_0802c874
    ldr        r7,PTR_PTR_DAT_0802c8c4
    bl         Map_LoadNPCList
LAB_0802c874:
    ldr        r0,PTR_DAT_0802c8c8
    bl         Entity_AllocList
    ldr        r0,PTR_BgTask_0802C8CC
    bl         BgTask_AddNew
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_ACDC_Lan_Living_Room_F40
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Lan_Living_Room_F40_0_0802c8d0
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_Lan_Living_Room_F40_0_0802c898:
    .word EventHandler_ACDC_Lan_Living_Room_F40_0


_ts EventHandler_ACDC_Lan_Living_Room_F40_0
    push       {lr}
    mov        r0,#0x94
    bl         Flag_GetBase
    beq        LAB_0802c8ba
    mov        r0,#0x95
    bl         Flag_GetBase
    bne        LAB_0802c8ba
    push       {r5}
    ldr        r0,PTR_FUN_0808f208_0802c8d4
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_0802c8ba:
    pop        {pc}
PTR_PTR_MapSetup_ACDC_Lan_Living_Room_F40_0802c8bc:
    .word PTR_MapSetup_ACDC_Lan_Living_Room_F40_0802c7fc
PTR_PTR_EventHandler_ACDC_Lan_Living_Room_F40_0802c8c0:
    .word PTR_EventHandler_ACDC_Lan_Living_Room_F40_0802c830
PTR_PTR_DAT_0802c8c4:
    .word NPCList_80307B0
PTR_DAT_0802c8c8:
    .word EntityAllocParams_08030DD4
PTR_BgTask_0802C8CC:
    .word BgTask_ACDC_Lan_Living_Room_TV_Regular
PTR_PTR_EventHandler_ACDC_Lan_Living_Room_F40_0_0802c8d0:
    .word PTR_EventHandler_ACDC_Lan_Living_Room_F40_0_0802c898
PTR_FUN_0808f208_0802c8d4:
    .word FUN_0808f208


_ts MapSetup_ACDC_Lan_Living_Room_S5
    push       {lr}
    push       {r1,r5}
    mov        r0,#0x0
    bl         Flag_Set380
    mov        r0,#0x1
    bl         Flag_Set380
    mov        r0,#0x48
    bl         Flag_Set380
    mov        r0,#0x49
    bl         Flag_Set380
    pop        {r1,r5}
    ldr        r0,PTR_PTR_MapSetup_ACDC_Lan_Living_Room_F50_0802ca1c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Sound_AreaSongChange
    pop        {pc}
PTR_MapSetup_ACDC_Lan_Living_Room_F50_0802c904:
    .word MapSetup_ACDC_Lan_Living_Room_F50
    .word MapSetup_ACDC_Lan_Living_Room_F50
    .word MapSetup_ACDC_Lan_Living_Room_F50
    .word MapSetup_ACDC_Lan_Living_Room_F53
    .word MapSetup_ACDC_Lan_Living_Room_F53
    .word MapSetup_ACDC_Lan_Living_Room_F53
    .word MapSetup_ACDC_Lan_Living_Room_F53
    .word MapSetup_ACDC_Lan_Living_Room_F53


_ts EventHandler_ACDC_Lan_Living_Room_S5
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Lan_Living_Room_F50_0802ca20
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r1,#0xa
    bl         FUN_0802d7e4
    pop        {pc}

    .align 2, 0

PTR_EventHandler_ACDC_Lan_Living_Room_F50_0802c938:
    .word EventHandler_ACDC_Lan_Living_Room_F50
    .word EventHandler_ACDC_Lan_Living_Room_F50
    .word EventHandler_ACDC_Lan_Living_Room_F50
    .word EventHandler_ACDC_Lan_Living_Room_F53
    .word EventHandler_ACDC_Lan_Living_Room_F53
    .word EventHandler_ACDC_Lan_Living_Room_F53
    .word EventHandler_ACDC_Lan_Living_Room_F53
    .word EventHandler_ACDC_Lan_Living_Room_F53


_ts MapSetup_ACDC_Lan_Living_Room_F50
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_PTR_DAT_0802ca24
    bl         Map_LoadNPCList
    ldr        r0,PTR_DAT_0802ca28
    bl         Entity_AllocList
    ldr        r0,PTR_BgTask_0802CA2C
    bl         BgTask_AddNew
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_ACDC_Lan_Living_Room_F50
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Lan_Living_Room_F50_0_0802ca30
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_Lan_Living_Room_F50_0_0802c994:
    .word EventHandler_ACDC_Lan_Living_Room_F50_0


_ts EventHandler_ACDC_Lan_Living_Room_F50_0
    push       {lr}
    pop        {pc}


_ts MapSetup_ACDC_Lan_Living_Room_F53
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r0,PTR_DAT_0802ca34
    bl         Entity_AllocList
    ldr        r6,PTR_BgTask_0802CA38
    mov        r0,#0xa3
    bl         Flag_GetBase
    beq        LAB_0802c9c0
    ldr        r6,PTR_BgTask_0802CA3C
LAB_0802c9c0:
    add        r0,r6,#0x0
    bl         BgTask_AddNew
    pop        {r5}
    mov        r0,#0xa3
    bl         Flag_GetBase
    bne        LAB_0802c9e6
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    mov        r1,#0x0
    strb       r1,[r0,#0x7]
    push       {r5}
    ldr        r0,PTR_FUN_08093610_0802ca40
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    b          FUN_0802c9fc
LAB_0802c9e6:
    push       {r5}
    ldr        r7,PTR_PTR_DAT_0802ca44
    bl         Map_LoadNPCList
    pop        {r5}
    b          FUN_0802c9fc
    push       {r5}
    ldr        r7,PTR_PTR_DAT_0802ca48
    bl         Map_LoadNPCList
    pop        {r5}


_ts FUN_0802c9fc
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_ACDC_Lan_Living_Room_F53
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Lan_Living_Room_F53_0_0802ca4c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_ACDC_Lan_Living_Room_F53_0_0802ca14:
    .word EventHandler_ACDC_Lan_Living_Room_F53_0


_ts EventHandler_ACDC_Lan_Living_Room_F53_0
    push       {lr}
    pop        {pc}
PTR_PTR_MapSetup_ACDC_Lan_Living_Room_F50_0802ca1c:
    .word PTR_MapSetup_ACDC_Lan_Living_Room_F50_0802c904
PTR_PTR_EventHandler_ACDC_Lan_Living_Room_F50_0802ca20:
    .word PTR_EventHandler_ACDC_Lan_Living_Room_F50_0802c938
PTR_PTR_DAT_0802ca24:
    .word NPCList_80307B0
PTR_DAT_0802ca28:
    .word EntityAllocParams_08030DD4
PTR_BgTask_0802CA2C:
    .word BgTask_ACDC_Lan_Living_Room_TV_Regular
PTR_PTR_EventHandler_ACDC_Lan_Living_Room_F50_0_0802ca30:
    .word PTR_EventHandler_ACDC_Lan_Living_Room_F50_0_0802c994
PTR_DAT_0802ca34:
    .word EntityAllocParams_08030DD4
PTR_BgTask_0802CA38:
    .word BgTask_ACDC_Lan_Living_Room_TV_Regular
PTR_BgTask_0802CA3C:
    .word BgTask_ACDC_Lan_Living_Room_TV_Wily
PTR_FUN_08093610_0802ca40:
    .word FUN_08093610
PTR_PTR_DAT_0802ca44:
    .word NPCList_8030834
PTR_PTR_DAT_0802ca48:
    .word NPCList_80307B0
PTR_PTR_EventHandler_ACDC_Lan_Living_Room_F53_0_0802ca4c:
    .word PTR_EventHandler_ACDC_Lan_Living_Room_F53_0_0802ca14
