#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_Power_Plant_Comp_1_S4
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,PTR_PTR_MapSetup_Default_0804a500
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    Flag_GetBase 0xC3
    bne        LAB_0804a2fe
    ldr        r0,PTR_BgTask_8049BA8_0804a504
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8049C18_0804a508
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8049C88_0804a50c
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8049CF8_0804a510
    bl         BgTask_AddNew
    b          LAB_0804a316
LAB_0804a2fe:
    ldr        r0,PTR_BgTask_8049C00_0804a514
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8049C70_0804a518
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8049CE0_0804a51c
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8049D50_0804a520
    bl         BgTask_AddNew
LAB_0804a316:
    ldr        r0,PTR_BgTask_8049D68_0804a524
    bl         BgTask_AddNew
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_804BB54_0804a528
    bl         Entity_AllocList
    mov        r0,#0x50
    bl         PowerPlant_CheckPaths
    pop        {r5}
    pop        {pc}

PTR_MapSetup_Default_0804a330:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Power_Plant_Comp_1_F42
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default


_ts EventHandler_Power_Plant_1_S4
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Default_0804a52c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r0,#0xfe
    bl         CheckForJackOut
    bl         FUN_0804a480
    pop        {pc}

    .align 2, 0

PTR_EventHandler_Default_0804a368:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Power_Plant_Comp_1_F42
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default


_ts MapSetup_Power_Plant_Comp_1_F42
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_804B5C0_0804a530
    bl         Map_LoadNPCList
    mov        r0,#0x0
    bl         PETBattery_Init
    bl         PETBattery_ResetStepCounter
    pop        {r5}
    Flag_GetBase 0xB6
    beq        LAB_0804a3ec
    LoadMain world, r0, r0
    mov        r1,#0x0
    strb       r1,[r0,#World_fadeType]
    Flag_ClearBase 0xB6
    Flag_GetBase 0xB9
    beq        LAB_0804a3d2
    mov        r1,#0x2
    b          LAB_0804a3e0
LAB_0804a3d2:
    Flag_GetBase 0xB8
    beq        LAB_0804a3de
    mov        r1,#0x1
    b          LAB_0804a3e0
LAB_0804a3de:
    mov        r1,#0x0
LAB_0804a3e0:
    push       {r5}
    ldr        r0,DAT_0804a534
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_0804a40c
LAB_0804a3ec:
    LoadMain world, r0, r0
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    bne        LAB_0804a400
    ldrb       r1,[r0,#World_currentArea]
    ldrb       r2,[r0,#World_lastArea]
    cmp        r1,r2
    beq        LAB_0804a40c
LAB_0804a400:
    push       {r5}
    ldr        r0,DAT_0804a538
    ldr        r1,PTR_DAT_0804a53c
    bl         Scene_Prepare
    pop        {r5}
LAB_0804a40c:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_Power_Plant_Comp_1_F42
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Power_Plant_Comp_1_F42_0_0804a540
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_Power_Plant_Comp_1_F42_0_0804a424:
    .word EventHandler_Power_Plant_Comp_1_F42_0


_ts EventHandler_Power_Plant_Comp_1_F42_0
    push       {lr}
    Flag_GetBase 0xB5
    bne        LAB_0804a43e
    push       {r5}
    ldr        r0,PTR_Scene_Story_55_0804a544
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_0804a43e:
    bl         Scene_IsSceneActive
    tst        r0,r0
    bne        LAB_0804a47e
    push       {r5}
    mov        r0,#0x0
    bl         PETBattery_Main
    pop        {r5}
    tst        r0,r0
    bne        LAB_0804a47e
    Flag_SetBase 0xB6
    Flag_GetBase 0xB8
    beq        LAB_0804a466
    mov        r1,#0x2
    b          LAB_0804a474
LAB_0804a466:
    Flag_GetBase 0xB7
    beq        LAB_0804a472
    mov        r1,#0x1
    b          LAB_0804a474
LAB_0804a472:
    mov        r1,#0x0
LAB_0804a474:
    push       {r5}
    ldr        r0,PTR_Scene_RechargePrompt_0804a548
    bl         Scene_Prepare
    pop        {r5}
LAB_0804a47e:
    pop        {pc}


_ts FUN_0804a480
    push       {r5,lr}
    LoadMain fade, r6, r7
    ldrb       r6,[r6,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r6,r1
    beq        LAB_0804a4fc
    bl         Scene_IsSceneActive
    tst        r0,r0
    bne        LAB_0804a4fc
    mov        r0,#0x80
    bl         Text_CheckOption
    bne        LAB_0804a4fc
    LoadMain world, r7, r7
    ldrb       r1,[r7,#World_curEventFlag]
    cmp        r1,#0x20
    blt        LAB_0804a4ca
    cmp        r1,#0x28
    bgt        LAB_0804a4ca
    push       {r1}
    LoadMain world, r1, r1
    ldrb       r1,[r1,#0x5]
    mov        r0,#0xd4
    add        r0,r0,r1
    bl         Flag_GetBase
    pop        {r1}
    bne        LAB_0804a4f0
    ldr        r0,PTR_Scene_BatterySwitch_0804a54c
    bl         Scene_Prepare
    mov        r0,#0x0
    pop        {r5,pc}
LAB_0804a4ca:
    cmp        r1,#0x50
    blt        LAB_0804a4fc
    cmp        r1,#0xcf
    bgt        LAB_0804a4fc
    push       {r1}
    LoadMain world, r1, r1
    ldrb       r1,[r1,#0x5]
    mov        r0,#0xd4
    add        r0,r0,r1
    bl         Flag_GetBase
    pop        {r1}
    bne        LAB_0804a4f0
    ldr        r0,PTR_Scene_Battery_0804a550
    bl         Scene_Prepare
    mov        r0,#0x0
    pop        {r5,pc}
LAB_0804a4f0:
    ldr        r0,PTR_Scene_Dialogue_0804a554
    mov        r1,#0xb3
    @ "MegaMan, we don't need to play with that anymore! Let's get going!"
    bl         Scene_Prepare
    mov        r0,#0x0
    pop        {r5,pc}
LAB_0804a4fc:
    mov        r0,#0x1
    pop        {r5,pc}

PTR_PTR_MapSetup_Default_0804a500:
    .word PTR_MapSetup_Default_0804a330

PTR_BgTask_8049BA8_0804a504:
    .word BgTask_8049BA8

PTR_BgTask_8049C18_0804a508:
    .word BgTask_8049C18

PTR_BgTask_8049C88_0804a50c:
    .word BgTask_8049C88

PTR_BgTask_8049CF8_0804a510:
    .word BgTask_8049CF8

PTR_BgTask_8049C00_0804a514:
    .word BgTask_8049C00

PTR_BgTask_8049C70_0804a518:
    .word BgTask_8049C70

PTR_BgTask_8049CE0_0804a51c:
    .word BgTask_8049CE0

PTR_BgTask_8049D50_0804a520:
    .word BgTask_8049D50

PTR_BgTask_8049D68_0804a524:
    .word BgTask_8049D68

PTR_EntityAllocParams_804BB54_0804a528:
    .word EntityAllocParams_804BB54

PTR_PTR_EventHandler_Default_0804a52c:
    .word PTR_EventHandler_Default_0804a368

PTR_NPCList_804B5C0_0804a530:
    .word NPCList_804B5C0

DAT_0804a534:
    .word Scene_RechargeSuccess

DAT_0804a538:
    .word Scene_MegaManJackIn

PTR_DAT_0804a53c:
    .word 0x2000

PTR_PTR_EventHandler_Power_Plant_Comp_1_F42_0_0804a540:
    .word PTR_EventHandler_Power_Plant_Comp_1_F42_0_0804a424

PTR_Scene_Story_55_0804a544:
    .word Scene_Story_55

PTR_Scene_RechargePrompt_0804a548:
    .word Scene_RechargePrompt

PTR_Scene_BatterySwitch_0804a54c:
    .word Scene_BatterySwitch

PTR_Scene_Battery_0804a550:
    .word Scene_Battery

PTR_Scene_Dialogue_0804a554:
    .word Scene_Dialogue


_ts MapSetup_Power_Plant_Comp_1_S5
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,PTR_PTR_MapSetup_Power_Plant_Comp_1_F50_0804a730
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_8049C00_0804a734
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8049C70_0804a738
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8049CE0_0804a73c
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8049D50_0804a740
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8049D68_0804a744
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8049E30_0804a748
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8049EF0_0804a74c
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8049FB0_0804a750
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8049FE0_0804a754
    bl         BgTask_AddNew
    Flag_SetIgnore F_IGNORE_WALL_00
    Flag_SetIgnore F_IGNORE_WALL_01
    Flag_SetIgnore F_IGNORE_WALL_02
    Flag_SetIgnore F_IGNORE_WALL_03
    Flag_SetIgnore F_IGNORE_WALL_04
    Flag_SetIgnore F_IGNORE_WALL_05
    Flag_SetIgnore F_IGNORE_WALL_06
    Flag_SetIgnore F_IGNORE_WALL_07
    Flag_SetIgnore F_IGNORE_WALL_08
    Flag_SetIgnore F_IGNORE_WALL_09
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_804BBBC_0804a758
    bl         Entity_AllocList
    pop        {r5}
    pop        {pc}

PTR_MapSetup_Power_Plant_Comp_1_F50_0804a5ec:
    .word MapSetup_Power_Plant_Comp_1_F50
    .word MapSetup_Power_Plant_Comp_1_F50
    .word MapSetup_Power_Plant_Comp_1_F50
    .word MapSetup_Power_Plant_Comp_1_F50
    .word MapSetup_Power_Plant_Comp_1_F50
    .word MapSetup_Power_Plant_Comp_1_F50
    .word MapSetup_Power_Plant_Comp_1_F50
    .word MapSetup_Power_Plant_Comp_1_F50
    .word MapSetup_Power_Plant_Comp_1_F50
    .word MapSetup_Power_Plant_Comp_1_F50
    .word MapSetup_Power_Plant_Comp_1_F50
    .word MapSetup_Power_Plant_Comp_1_F50
    .word MapSetup_Power_Plant_Comp_1_F50
    .word MapSetup_Power_Plant_Comp_1_F50
    .word MapSetup_Power_Plant_Comp_1_F50
    .word MapSetup_Power_Plant_Comp_1_F50


_ts EventHandler_Power_Plant_1_S5
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Power_Plant_Comp_1_F50_0804a75c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         FUN_0804a6e0
    pop        {pc}

PTR_EventHandler_Power_Plant_Comp_1_F50_0804a63c:
    .word EventHandler_Power_Plant_Comp_1_F50
    .word EventHandler_Power_Plant_Comp_1_F50
    .word EventHandler_Power_Plant_Comp_1_F50
    .word EventHandler_Power_Plant_Comp_1_F50
    .word EventHandler_Power_Plant_Comp_1_F50
    .word EventHandler_Power_Plant_Comp_1_F50
    .word EventHandler_Power_Plant_Comp_1_F50
    .word EventHandler_Power_Plant_Comp_1_F50
    .word EventHandler_Power_Plant_Comp_1_F50
    .word EventHandler_Power_Plant_Comp_1_F50
    .word EventHandler_Power_Plant_Comp_1_F50
    .word EventHandler_Power_Plant_Comp_1_F50
    .word EventHandler_Power_Plant_Comp_1_F50
    .word EventHandler_Power_Plant_Comp_1_F50
    .word EventHandler_Power_Plant_Comp_1_F50
    .word EventHandler_Power_Plant_Comp_1_F50


_ts MapSetup_Power_Plant_Comp_1_F50
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_804B740_0804a760
    bl         Map_LoadNPCList
    pop        {r5}
    LoadMain world, r0, r0
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    bne        LAB_0804a6ae
    ldrb       r1,[r0,#World_currentArea]
    ldrb       r2,[r0,#World_lastArea]
    cmp        r1,r2
    beq        LAB_0804a6ba
LAB_0804a6ae:
    push       {r5}
    ldr        r0,DAT_0804a764
    ldr        r1,PTR_DAT_0804a768
    bl         Scene_Prepare
    pop        {r5}
LAB_0804a6ba:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Power_Plant_Comp_1_F50
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Power_Plant_Comp_1_F50_0_0804a76c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Power_Plant_Comp_1_F50_0_0804a6d0:
    .word EventHandler_Power_Plant_Comp_1_F50_0


_ts EventHandler_Power_Plant_Comp_1_F50_0
    push       {lr}
    mov        r0,#0xa
    bl         CheckForJackOut
    pop        {pc}

    .align 2, 0


_ts FUN_0804a6e0
    push       {r5,lr}
    LoadMain fade, r6, r7
    ldrb       r6,[r6,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r6,r1
    beq        LAB_0804a72c
    bl         Scene_IsSceneActive
    tst        r0,r0
    bne        LAB_0804a72c
    mov        r0,#0x80
    bl         Text_CheckOption
    bne        LAB_0804a72c
    LoadMain world, r7, r7
    ldrb       r1,[r7,#World_curEventFlag]
    cmp        r1,#0x20
    blt        LAB_0804a718
    cmp        r1,#0x28
    bgt        LAB_0804a718
    ldr        r0,PTR_Scene_Dialogue_0804a770
    mov        r1,#0xf2
    bl         Scene_Prepare
    mov        r0,#0x0
    pop        {r5,pc}
LAB_0804a718:
    cmp        r1,#0x50
    blt        LAB_0804a72c
    cmp        r1,#0xcf
    bgt        LAB_0804a72c
    ldr        r0,PTR_Scene_Dialogue_0804a774
    mov        r1,#0xf6
    bl         Scene_Prepare
    mov        r0,#0x0
    pop        {r5,pc}
LAB_0804a72c:
    mov        r0,#0x1
    pop        {r5,pc}

PTR_PTR_MapSetup_Power_Plant_Comp_1_F50_0804a730:
    .word PTR_MapSetup_Power_Plant_Comp_1_F50_0804a5ec

PTR_BgTask_8049C00_0804a734:
    .word BgTask_8049C00

PTR_BgTask_8049C70_0804a738:
    .word BgTask_8049C70

PTR_BgTask_8049CE0_0804a73c:
    .word BgTask_8049CE0

PTR_BgTask_8049D50_0804a740:
    .word BgTask_8049D50

PTR_BgTask_8049D68_0804a744:
    .word BgTask_8049D68

PTR_BgTask_8049E30_0804a748:
    .word BgTask_8049E30

PTR_BgTask_8049EF0_0804a74c:
    .word BgTask_8049EF0

PTR_BgTask_8049FB0_0804a750:
    .word BgTask_8049FB0

PTR_BgTask_8049FE0_0804a754:
    .word BgTask_8049FE0

PTR_EntityAllocParams_804BBBC_0804a758:
    .word EntityAllocParams_804BBBC

PTR_PTR_EventHandler_Power_Plant_Comp_1_F50_0804a75c:
    .word PTR_EventHandler_Power_Plant_Comp_1_F50_0804a63c

PTR_NPCList_804B740_0804a760:
    .word NPCList_804B740

DAT_0804a764:
    .word Scene_MegaManJackIn

PTR_DAT_0804a768:
    .word 0x2000

PTR_PTR_EventHandler_Power_Plant_Comp_1_F50_0_0804a76c:
    .word PTR_EventHandler_Power_Plant_Comp_1_F50_0_0804a6d0

PTR_Scene_Dialogue_0804a770:
    .word Scene_Dialogue

PTR_Scene_Dialogue_0804a774:
    .word Scene_Dialogue
