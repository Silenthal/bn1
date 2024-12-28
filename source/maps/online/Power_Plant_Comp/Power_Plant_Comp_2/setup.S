#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_Power_Plant_Comp_2_S4
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,PTR_PTR_MapSetup_Default_0804a930
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    mov        r0,#0xc3
    bl         Flag_GetBase
    bne        LAB_0804a7ae
    ldr        r0,PTR_BgTask_8049BA8_0804a934
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8049C18_0804a938
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8049C88_0804a93c
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8049CF8_0804a940
    bl         BgTask_AddNew
    b          LAB_0804a7c6
LAB_0804a7ae:
    ldr        r0,PTR_BgTask_8049C00_0804a944
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8049C70_0804a948
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8049CE0_0804a94c
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8049D50_0804a950
    bl         BgTask_AddNew
LAB_0804a7c6:
    ldr        r0,PTR_BgTask_8049D68_0804a954
    bl         BgTask_AddNew
    pop        {r5}
    push       {r5}
    mov        r0,#0xd4
    bl         Flag_GetBase
    bne        LAB_0804a7e2
    mov        r0,#0xd4
    bl         Flag_SetBase
    bl         PowerPlant_ResetState
LAB_0804a7e2:
    ldr        r0,PTR_EntityAllocParams_804BBE8_0804a958
    bl         Entity_AllocList
    mov        r0,#0x60
    bl         PowerPlant_CheckPaths
    mov        r0,#0x70
    bl         PowerPlant_CheckPaths
    pop        {r5}
    pop        {pc}

PTR_MapSetup_Default_0804a7f8:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Power_Plant_Comp_2_F42
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default


_ts EventHandler_Power_Plant_2_S4
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Default_0804a95c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r0,#0xfe
    bl         CheckForJackOut
    bl         FUN_0804a480
    pop        {pc}

    .align 2, 0

PTR_EventHandler_Default_0804a830:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Power_Plant_Comp_2_F42
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default


_ts MapSetup_Power_Plant_Comp_2_F42
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_NPCList_804B754_0804a960
    bl         Map_LoadNPCList
    mov        r0,#0x0
    bl         PETBattery_Init
    bl         PETBattery_ResetStepCounter
    pop        {r5}
    mov        r0,#0xb6
    bl         Flag_GetBase
    beq        LAB_0804a8b0
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    mov        r1,#0x0
    strb       r1,[r0,#0x7]
    mov        r0,#0xb6
    bl         Flag_ClearBase
    mov        r0,#0xb9
    bl         Flag_GetBase
    beq        LAB_0804a896
    mov        r1,#0x2
    b          LAB_0804a8a4
LAB_0804a896:
    mov        r0,#0xb8
    bl         Flag_GetBase
    beq        LAB_0804a8a2
    mov        r1,#0x1
    b          LAB_0804a8a4
LAB_0804a8a2:
    mov        r1,#0x0
LAB_0804a8a4:
    push       {r5}
    ldr        r0,DAT_0804a964
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_0804a8d0
LAB_0804a8b0:
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    bne        LAB_0804a8c4
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_0804a8d0
LAB_0804a8c4:
    push       {r5}
    ldr        r0,DAT_0804a968
    ldr        r1,PTR_DAT_0804a96c
    bl         Scene_Prepare
    pop        {r5}
LAB_0804a8d0:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_Power_Plant_Comp_2_F42
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Power_Plant_Comp_2_F42_0_0804a970
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_Power_Plant_Comp_2_F42_0_0804a8e8:
    .word EventHandler_Power_Plant_Comp_2_F42_0


_ts EventHandler_Power_Plant_Comp_2_F42_0
    push       {lr}
    bl         Scene_IsSceneActive
    tst        r0,r0
    bne        LAB_0804a92e
    push       {r5}
    mov        r0,#0x0
    bl         PETBattery_Main
    pop        {r5}
    tst        r0,r0
    bne        LAB_0804a92e
    mov        r0,#0xb6
    bl         Flag_SetBase
    mov        r0,#0xb8
    bl         Flag_GetBase
    beq        LAB_0804a916
    mov        r1,#0x2
    b          LAB_0804a924
LAB_0804a916:
    mov        r0,#0xb7
    bl         Flag_GetBase
    beq        LAB_0804a922
    mov        r1,#0x1
    b          LAB_0804a924
LAB_0804a922:
    mov        r1,#0x0
LAB_0804a924:
    push       {r5}
    ldr        r0,PTR_Scene_RechargePrompt_0804a974
    bl         Scene_Prepare
    pop        {r5}
LAB_0804a92e:
    pop        {pc}

PTR_PTR_MapSetup_Default_0804a930:
    .word PTR_MapSetup_Default_0804a7f8

PTR_BgTask_8049BA8_0804a934:
    .word BgTask_8049BA8

PTR_BgTask_8049C18_0804a938:
    .word BgTask_8049C18

PTR_BgTask_8049C88_0804a93c:
    .word BgTask_8049C88

PTR_BgTask_8049CF8_0804a940:
    .word BgTask_8049CF8

PTR_BgTask_8049C00_0804a944:
    .word BgTask_8049C00

PTR_BgTask_8049C70_0804a948:
    .word BgTask_8049C70

PTR_BgTask_8049CE0_0804a94c:
    .word BgTask_8049CE0

PTR_BgTask_8049D50_0804a950:
    .word BgTask_8049D50

PTR_BgTask_8049D68_0804a954:
    .word BgTask_8049D68

PTR_EntityAllocParams_804BBE8_0804a958:
    .word EntityAllocParams_804BBE8

PTR_PTR_EventHandler_Default_0804a95c:
    .word PTR_EventHandler_Default_0804a830

PTR_NPCList_804B754_0804a960:
    .word NPCList_804B754

DAT_0804a964:
    .word Scene_RechargeSuccess

DAT_0804a968:
    .word Scene_MegaManJackIn

PTR_DAT_0804a96c:
    .word 0x2000

PTR_PTR_EventHandler_Power_Plant_Comp_2_F42_0_0804a970:
    .word PTR_EventHandler_Power_Plant_Comp_2_F42_0_0804a8e8

PTR_Scene_RechargePrompt_0804a974:
    .word Scene_RechargePrompt


_ts MapSetup_Power_Plant_Comp_2_S5
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,PTR_PTR_MapSetup_Power_Plant_Comp_2_F50_0804ab00
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_8049C00_0804ab04
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8049C70_0804ab08
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8049CE0_0804ab0c
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8049D50_0804ab10
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8049D68_0804ab14
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8049E30_0804ab18
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8049EF0_0804ab1c
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8049FB0_0804ab20
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8049FE0_0804ab24
    bl         BgTask_AddNew
    mov        r0,#0x0
    bl         Flag_SetIgnore
    mov        r0,#0x1
    bl         Flag_SetIgnore
    mov        r0,#0x2
    bl         Flag_SetIgnore
    mov        r0,#0x3
    bl         Flag_SetIgnore
    mov        r0,#0x4
    bl         Flag_SetIgnore
    mov        r0,#0x5
    bl         Flag_SetIgnore
    mov        r0,#0x6
    bl         Flag_SetIgnore
    mov        r0,#0x7
    bl         Flag_SetIgnore
    mov        r0,#0x8
    bl         Flag_SetIgnore
    mov        r0,#0x9
    bl         Flag_SetIgnore
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_804BDA4_0804ab28
    bl         Entity_AllocList
    pop        {r5}
    pop        {pc}

PTR_MapSetup_Power_Plant_Comp_2_F50_0804aa0c:
    .word MapSetup_Power_Plant_Comp_2_F50
    .word MapSetup_Power_Plant_Comp_2_F50
    .word MapSetup_Power_Plant_Comp_2_F50
    .word MapSetup_Power_Plant_Comp_2_F50
    .word MapSetup_Power_Plant_Comp_2_F50
    .word MapSetup_Power_Plant_Comp_2_F50
    .word MapSetup_Power_Plant_Comp_2_F50
    .word MapSetup_Power_Plant_Comp_2_F50
    .word MapSetup_Power_Plant_Comp_2_F50
    .word MapSetup_Power_Plant_Comp_2_F50
    .word MapSetup_Power_Plant_Comp_2_F50
    .word MapSetup_Power_Plant_Comp_2_F50
    .word MapSetup_Power_Plant_Comp_2_F50
    .word MapSetup_Power_Plant_Comp_2_F50
    .word MapSetup_Power_Plant_Comp_2_F50
    .word MapSetup_Power_Plant_Comp_2_F50


_ts EventHandler_Power_Plant_2_S5
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Power_Plant_Comp_2_F50_0804ab2c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         FUN_0804a6e0
    pop        {pc}

PTR_EventHandler_Power_Plant_Comp_2_F50_0804aa5c:
    .word EventHandler_Power_Plant_Comp_2_F50
    .word EventHandler_Power_Plant_Comp_2_F50
    .word EventHandler_Power_Plant_Comp_2_F50
    .word EventHandler_Power_Plant_Comp_2_F50
    .word EventHandler_Power_Plant_Comp_2_F50
    .word EventHandler_Power_Plant_Comp_2_F50
    .word EventHandler_Power_Plant_Comp_2_F50
    .word EventHandler_Power_Plant_Comp_2_F50
    .word EventHandler_Power_Plant_Comp_2_F50
    .word EventHandler_Power_Plant_Comp_2_F50
    .word EventHandler_Power_Plant_Comp_2_F50
    .word EventHandler_Power_Plant_Comp_2_F50
    .word EventHandler_Power_Plant_Comp_2_F50
    .word EventHandler_Power_Plant_Comp_2_F50
    .word EventHandler_Power_Plant_Comp_2_F50
    .word EventHandler_Power_Plant_Comp_2_F50


_ts MapSetup_Power_Plant_Comp_2_F50
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_804B77C_0804ab30
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    bne        LAB_0804aace
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_0804aada
LAB_0804aace:
    push       {r5}
    ldr        r0,DAT_0804ab34
    ldr        r1,PTR_DAT_0804ab38
    bl         Scene_Prepare
    pop        {r5}
LAB_0804aada:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Power_Plant_Comp_2_F50
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Power_Plant_Comp_2_F50_0_0804ab3c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Power_Plant_Comp_2_F50_0_0804aaf0:
    .word EventHandler_Power_Plant_Comp_2_F50_0


_ts EventHandler_Power_Plant_Comp_2_F50_0
    push       {lr}
    mov        r0,#0xa
    bl         CheckForJackOut
    pop        {pc}

    .align 2, 0

PTR_PTR_MapSetup_Power_Plant_Comp_2_F50_0804ab00:
    .word PTR_MapSetup_Power_Plant_Comp_2_F50_0804aa0c

PTR_BgTask_8049C00_0804ab04:
    .word BgTask_8049C00

PTR_BgTask_8049C70_0804ab08:
    .word BgTask_8049C70

PTR_BgTask_8049CE0_0804ab0c:
    .word BgTask_8049CE0

PTR_BgTask_8049D50_0804ab10:
    .word BgTask_8049D50

PTR_BgTask_8049D68_0804ab14:
    .word BgTask_8049D68

PTR_BgTask_8049E30_0804ab18:
    .word BgTask_8049E30

PTR_BgTask_8049EF0_0804ab1c:
    .word BgTask_8049EF0

PTR_BgTask_8049FB0_0804ab20:
    .word BgTask_8049FB0

PTR_BgTask_8049FE0_0804ab24:
    .word BgTask_8049FE0

PTR_EntityAllocParams_804BDA4_0804ab28:
    .word EntityAllocParams_804BDA4

PTR_PTR_EventHandler_Power_Plant_Comp_2_F50_0804ab2c:
    .word PTR_EventHandler_Power_Plant_Comp_2_F50_0804aa5c

PTR_NPCList_804B77C_0804ab30:
    .word NPCList_804B77C

DAT_0804ab34:
    .word Scene_MegaManJackIn

PTR_DAT_0804ab38:
    .word 0x2000

PTR_PTR_EventHandler_Power_Plant_Comp_2_F50_0_0804ab3c:
    .word PTR_EventHandler_Power_Plant_Comp_2_F50_0_0804aaf0
