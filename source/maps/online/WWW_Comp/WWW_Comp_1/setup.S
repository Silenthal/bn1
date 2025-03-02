#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_WWW_Comp_1_S5
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_Default_0804d4ec
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_80423F8_0804d4f0
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8042418_0804d4f4
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8042448_0804d4f8
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8042498_0804d4fc
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_80424D8_0804d500
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8042528_0804d504
    bl         BgTask_AddNew
    Flag_GetBase 0xB2
    bne        LAB_0804d2e6
    ldr        r0,PTR_EntityAllocParams_804E73C_0804d508
    bl         Entity_AllocList
LAB_0804d2e6:
    pop        {r5}
    bl         Sound_AreaSongChange
    pop        {pc}

    .align 2, 0

PTR_MapSetup_Default_0804d2f0:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_WWW_Comp_1_F54


_ts EventHandler_WWW_Comp_1_S5
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Default_0804d50c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Default_0804d310:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_WWW_Comp_1_F54


_ts MapSetup_WWW_Comp_1_F54
    push       {lr}
    bl         FUN_0804d46c
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    LoadMain world, r0, r0
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    bne        LAB_0804d350
    ldrb       r1,[r0,#World_currentArea]
    ldrb       r2,[r0,#World_lastArea]
    cmp        r1,r2
    beq        LAB_0804d35c
LAB_0804d350:
    push       {r5}
    ldr        r0,DAT_0804d510
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_0804d35c:
    push       {r5}
    ldr        r7,PTR_NPCList_804DF70_0804d514
    Flag_GetBase 0xB2
    bne        LAB_0804d36c
    ldr        r7,PTR_NPCList_804DF70_0804d518
    b          LAB_0804d36e
LAB_0804d36c:
    ldr        r7,PTR_NPCList_804DFAC_0804d51c
LAB_0804d36e:
    bl         Map_LoadNPCList
    pop        {r5}
    Flag_GetBase 0xB2
    bne        LAB_0804d38c
    push       {r5}
    Flag_ClearBase 0xB4
    ldr        r0,PTR_EntityAllocParams_804E710_0804d520
    bl         Entity_AllocList
    pop        {r5}
LAB_0804d38c:
    mov        r0,#0xff
    str        r0,[r5,#0x8]
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_WWW_Comp_1_F54
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_WWW_Comp_1_F54_0_0804d524
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_WWW_Comp_1_F54_0_0804d3a8:
    .word EventHandler_WWW_Comp_1_F54_0


_ts EventHandler_WWW_Comp_1_F54_0
    push       {lr}
    bl         FUN_0804d418
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#World_playerLocation]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x10
    bne        LAB_0804d3dc
    Flag_GetBase 0xB2
    bne        LAB_0804d3dc
    push       {r5}
    ldr        r0,PTR_Scene_Story_71_0804d528
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_0804d3f0
LAB_0804d3dc:
    Flag_GetBase 0xB1
    bne        LAB_0804d3f0
    push       {r5}
    ldr        r0,PTR_Scene_Story_70_0804d52c
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_0804d3f0:
    bl         FUN_0804d4a4
    beq        LAB_0804d3fc
    mov        r0,#0x1
    bl         CheckForJackOut
LAB_0804d3fc:
    pop        {pc}


_nt FUN_0804d3fe
    push       {lr}
    push       {r5}
    add        r2,r2,r0
    add        r2,#0x1
LAB_0804d406:
    push       {r0}
    bl         Flag_SetIgnore
    pop        {r0}
    add        r0,#0x1
    cmp        r0,r2
    bne        LAB_0804d406
    pop        {r5}
    pop        {pc}


_ts FUN_0804d418
    push       {lr}
    Flag_GetBase 0xB2
    bne        LAB_0804d468
    push       {r5}
    Flag_GetBase 0xF7
    pop        {r5}
    beq        LAB_0804d468
    push       {r5}
    Flag_ClearBase 0xF7
    pop        {r5}
    mov        r7,#0x0
LAB_0804d43a:
    push       {r5,r7}
    mov        r0,#0x0
    add        r0,r0,r7
    bl         Flag_ClearIgnore
    pop        {r5,r7}
    push       {r5,r7}
    mov        r0,#0xdf
    add        r0,r0,r7
    bl         Flag_ClearBase
    pop        {r5,r7}
    add        r7,#0x1
    cmp        r7,#0x16
    ble        LAB_0804d43a
    push       {r5}
    mov        r0,#0x4
    bl         Entity_FreeAllMultiple
    ldr        r0,PTR_EntityAllocParams_804E73C_0804d530
    bl         Entity_AllocList
    pop        {r5}
LAB_0804d468:
    pop        {pc}

    .align 2, 0


_ts FUN_0804d46c
    push       {lr}
    Flag_GetBase 0xB2
    bne        LAB_0804d49a
    mov        r7,#0x0
LAB_0804d478:
    push       {r5,r7}
    mov        r0,#0xdf
    add        r0,r0,r7
    bl         Flag_GetBase
    pop        {r5,r7}
    beq        LAB_0804d492
    push       {r5,r7}
    mov        r0,#0x0
    add        r0,r0,r7
    bl         Flag_SetIgnore
    pop        {r5,r7}
LAB_0804d492:
    add        r7,#0x1
    cmp        r7,#0x16
    ble        LAB_0804d478
    pop        {pc}
LAB_0804d49a:
    mov        r0,#0x0
    mov        r2,#0x16
    bl         FUN_0804d3fe
    pop        {pc}


_ts FUN_0804d4a4
    push       {lr}
    Flag_GetBase 0xB2
    bne        LAB_0804d4e8
    mov        r0,#0x80
    bl         Text_CheckOption
    bne        LAB_0804d4e8
    bl         Scene_IsSceneActive
    bne        LAB_0804d4e8
    LoadMain world, r0, r7
    ldrb       r1,[r0,#World_curEventFlag]
    cmp        r1,#0x20
    blt        LAB_0804d4e8
    cmp        r1,#0x3f
    bgt        LAB_0804d4e8
    push       {r1,r5}
    mov        r0,#0xdf
    add        r0,r0,r1
    sub        r0,#0x20
    bl         Flag_GetBase
    pop        {r1,r5}
    bne        LAB_0804d4e8
    push       {r5}
    ldr        r0,PTR_Scene_WWW_Comp_1_IceBlock_0804d534
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x0
    pop        {pc}
LAB_0804d4e8:
    mov        r0,#0x1
    pop        {pc}

PTR_PTR_MapSetup_Default_0804d4ec:
    .word PTR_MapSetup_Default_0804d2f0

PTR_BgTask_80423F8_0804d4f0:
    .word BgTask_80423F8

PTR_BgTask_8042418_0804d4f4:
    .word BgTask_8042418

PTR_BgTask_8042448_0804d4f8:
    .word BgTask_8042448

PTR_BgTask_8042498_0804d4fc:
    .word BgTask_8042498

PTR_BgTask_80424D8_0804d500:
    .word BgTask_80424D8

PTR_BgTask_8042528_0804d504:
    .word BgTask_8042528

PTR_EntityAllocParams_804E73C_0804d508:
    .word EntityAllocParams_804E73C

PTR_PTR_EventHandler_Default_0804d50c:
    .word PTR_EventHandler_Default_0804d310

DAT_0804d510:
    .word Scene_MegaManJackIn

PTR_NPCList_804DF70_0804d514:
    .word NPCList_804DF70

PTR_NPCList_804DF70_0804d518:
    .word NPCList_804DF70

PTR_NPCList_804DFAC_0804d51c:
    .word NPCList_804DFAC

PTR_EntityAllocParams_804E710_0804d520:
    .word EntityAllocParams_804E710

PTR_PTR_EventHandler_WWW_Comp_1_F54_0_0804d524:
    .word PTR_EventHandler_WWW_Comp_1_F54_0_0804d3a8

PTR_Scene_Story_71_0804d528:
    .word Scene_Story_71

PTR_Scene_Story_70_0804d52c:
    .word Scene_Story_70

PTR_EntityAllocParams_804E73C_0804d530:
    .word EntityAllocParams_804E73C

PTR_Scene_WWW_Comp_1_IceBlock_0804d534:
    .word Scene_WWW_Comp_1_IceBlock
