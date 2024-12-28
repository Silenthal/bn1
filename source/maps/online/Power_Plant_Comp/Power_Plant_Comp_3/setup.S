#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_Power_Plant_Comp_3_S4
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,PTR_PTR_MapSetup_Default_0804adec
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    mov        r0,#0xc3
    bl         Flag_GetBase
    bne        LAB_0804ab76
    ldr        r0,PTR_BgTask_8049BA8_0804adf0
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8049C18_0804adf4
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8049C88_0804adf8
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8049CF8_0804adfc
    bl         BgTask_AddNew
    b          LAB_0804ab8e
LAB_0804ab76:
    ldr        r0,PTR_BgTask_8049C00_0804ae00
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8049C70_0804ae04
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8049CE0_0804ae08
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8049D50_0804ae0c
    bl         BgTask_AddNew
LAB_0804ab8e:
    ldr        r0,PTR_BgTask_8049D68_0804ae10
    bl         BgTask_AddNew
    pop        {r5}
    push       {r5}
    mov        r0,#0xd5
    bl         Flag_GetBase
    bne        LAB_0804abaa
    mov        r0,#0xd5
    bl         Flag_SetBase
    bl         PowerPlant_ResetState
LAB_0804abaa:
    ldr        r0,PTR_EntityAllocParams_804BE34_0804ae14
    bl         Entity_AllocList
    mov        r0,#0x80
    bl         PowerPlant_CheckPaths
    mov        r0,#0x90
    bl         PowerPlant_CheckPaths
    mov        r0,#0xa0
    bl         PowerPlant_CheckPaths
    mov        r0,#0xb0
    bl         PowerPlant_CheckPaths
    pop        {r5}
    pop        {pc}

PTR_MapSetup_Default_0804abcc:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Power_Plant_Comp_3_F42
    .word MapSetup_Power_Plant_Comp_3_F43
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default


_ts EventHandler_Power_Plant_3_S4
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Default_0804ae18
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r0,#0xfe
    bl         CheckForJackOut
    bl         FUN_0804a480
    pop        {pc}

    .align 2, 0

PTR_EventHandler_Default_0804ac04:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Power_Plant_Comp_3_F42
    .word EventHandler_Power_Plant_Comp_3_F43
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default


_ts MapSetup_Power_Plant_Comp_3_F42
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_804B888_0804ae1c
    bl         Map_LoadNPCList
    mov        r0,#0x0
    bl         PETBattery_Init
    bl         PETBattery_ResetStepCounter
    pop        {r5}
    mov        r0,#0xb6
    bl         Flag_GetBase
    beq        LAB_0804ac88
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    mov        r1,#0x0
    strb       r1,[r0,#0x7]
    mov        r0,#0xb6
    bl         Flag_ClearBase
    mov        r0,#0xb9
    bl         Flag_GetBase
    beq        LAB_0804ac6e
    mov        r1,#0x2
    b          LAB_0804ac7c
LAB_0804ac6e:
    mov        r0,#0xb8
    bl         Flag_GetBase
    beq        LAB_0804ac7a
    mov        r1,#0x1
    b          LAB_0804ac7c
LAB_0804ac7a:
    mov        r1,#0x0
LAB_0804ac7c:
    push       {r5}
    ldr        r0,DAT_0804ae20
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_0804aca8
LAB_0804ac88:
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    bne        LAB_0804ac9c
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_0804aca8
LAB_0804ac9c:
    push       {r5}
    ldr        r0,DAT_0804ae24
    ldr        r1,PTR_DAT_0804ae28
    bl         Scene_Prepare
    pop        {r5}
LAB_0804aca8:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_Power_Plant_Comp_3_F42
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Power_Plant_Comp_3_F42_0_0804ae2c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_Power_Plant_Comp_3_F42_0_0804acc0:
    .word EventHandler_Power_Plant_Comp_3_F42_0


_ts EventHandler_Power_Plant_Comp_3_F42_0
    push       {lr}
    bl         Scene_IsSceneActive
    tst        r0,r0
    bne        LAB_0804ad06
    push       {r5}
    mov        r0,#0x0
    bl         PETBattery_Main
    pop        {r5}
    tst        r0,r0
    bne        LAB_0804ad06
    mov        r0,#0xb6
    bl         Flag_SetBase
    mov        r0,#0xb8
    bl         Flag_GetBase
    beq        LAB_0804acee
    mov        r1,#0x2
    b          LAB_0804acfc
LAB_0804acee:
    mov        r0,#0xb7
    bl         Flag_GetBase
    beq        LAB_0804acfa
    mov        r1,#0x1
    b          LAB_0804acfc
LAB_0804acfa:
    mov        r1,#0x0
LAB_0804acfc:
    push       {r5}
    ldr        r0,PTR_Scene_RechargePrompt_0804ae30
    bl         Scene_Prepare
    pop        {r5}
LAB_0804ad06:
    pop        {pc}


_ts MapSetup_Power_Plant_Comp_3_F43
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_804B888_0804ae34
    bl         Map_LoadNPCList
    mov        r0,#0x0
    bl         PETBattery_Init
    bl         PETBattery_ResetStepCounter
    pop        {r5}
    mov        r0,#0xb6
    bl         Flag_GetBase
    beq        LAB_0804ad6c
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    mov        r1,#0x0
    strb       r1,[r0,#0x7]
    mov        r0,#0xb6
    bl         Flag_ClearBase
    mov        r0,#0xb9
    bl         Flag_GetBase
    beq        LAB_0804ad52
    mov        r1,#0x2
    b          LAB_0804ad60
LAB_0804ad52:
    mov        r0,#0xb8
    bl         Flag_GetBase
    beq        LAB_0804ad5e
    mov        r1,#0x1
    b          LAB_0804ad60
LAB_0804ad5e:
    mov        r1,#0x0
LAB_0804ad60:
    push       {r5}
    ldr        r0,PTR_Scene_RechargeSuccess_0804ae38
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_0804ad8c
LAB_0804ad6c:
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    bne        LAB_0804ad80
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_0804ad8c
LAB_0804ad80:
    push       {r5}
    ldr        r0,PTR_Scene_MegaManJackIn_0804ae3c
    ldr        r1,PTR_DAT_0804ae28
    bl         Scene_Prepare
    pop        {r5}
LAB_0804ad8c:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_Power_Plant_Comp_3_F43
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Power_Plant_Comp_3_F43_0_0804ae40
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_Power_Plant_Comp_3_F43_0_0804ada4:
    .word EventHandler_Power_Plant_Comp_3_F43_0


_ts EventHandler_Power_Plant_Comp_3_F43_0
    push       {lr}
    bl         Scene_IsSceneActive
    tst        r0,r0
    bne        LAB_0804adea
    push       {r5}
    mov        r0,#0x0
    bl         PETBattery_Main
    pop        {r5}
    tst        r0,r0
    bne        LAB_0804adea
    mov        r0,#0xb6
    bl         Flag_SetBase
    mov        r0,#0xb8
    bl         Flag_GetBase
    beq        LAB_0804add2
    mov        r1,#0x2
    b          LAB_0804ade0
LAB_0804add2:
    mov        r0,#0xb7
    bl         Flag_GetBase
    beq        LAB_0804adde
    mov        r1,#0x1
    b          LAB_0804ade0
LAB_0804adde:
    mov        r1,#0x0
LAB_0804ade0:
    push       {r5}
    ldr        r0,PTR_Scene_RechargePrompt_0804ae44
    bl         Scene_Prepare
    pop        {r5}
LAB_0804adea:
    pop        {pc}

PTR_PTR_MapSetup_Default_0804adec:
    .word PTR_MapSetup_Default_0804abcc

PTR_BgTask_8049BA8_0804adf0:
    .word BgTask_8049BA8

PTR_BgTask_8049C18_0804adf4:
    .word BgTask_8049C18

PTR_BgTask_8049C88_0804adf8:
    .word BgTask_8049C88

PTR_BgTask_8049CF8_0804adfc:
    .word BgTask_8049CF8

PTR_BgTask_8049C00_0804ae00:
    .word BgTask_8049C00

PTR_BgTask_8049C70_0804ae04:
    .word BgTask_8049C70

PTR_BgTask_8049CE0_0804ae08:
    .word BgTask_8049CE0

PTR_BgTask_8049D50_0804ae0c:
    .word BgTask_8049D50

PTR_BgTask_8049D68_0804ae10:
    .word BgTask_8049D68

PTR_EntityAllocParams_804BE34_0804ae14:
    .word EntityAllocParams_804BE34

PTR_PTR_EventHandler_Default_0804ae18:
    .word PTR_EventHandler_Default_0804ac04

PTR_NPCList_804B888_0804ae1c:
    .word NPCList_804B888

DAT_0804ae20:
    .word Scene_RechargeSuccess

DAT_0804ae24:
    .word Scene_MegaManJackIn

PTR_DAT_0804ae28:
    .word 0x2000

PTR_PTR_EventHandler_Power_Plant_Comp_3_F42_0_0804ae2c:
    .word PTR_EventHandler_Power_Plant_Comp_3_F42_0_0804acc0

PTR_Scene_RechargePrompt_0804ae30:
    .word Scene_RechargePrompt

PTR_NPCList_804B888_0804ae34:
    .word NPCList_804B888

PTR_Scene_RechargeSuccess_0804ae38:
    .word Scene_RechargeSuccess

PTR_Scene_MegaManJackIn_0804ae3c:
    .word Scene_MegaManJackIn

PTR_PTR_EventHandler_Power_Plant_Comp_3_F43_0_0804ae40:
    .word PTR_EventHandler_Power_Plant_Comp_3_F43_0_0804ada4

PTR_Scene_RechargePrompt_0804ae44:
    .word Scene_RechargePrompt


_ts MapSetup_Power_Plant_Comp_3_S5
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,PTR_PTR_MapSetup_Power_Plant_Comp_3_F50_0804afd0
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_8049C00_0804afd4
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8049C70_0804afd8
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8049CE0_0804afdc
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8049D50_0804afe0
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8049D68_0804afe4
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8049E30_0804afe8
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8049EF0_0804afec
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8049FB0_0804aff0
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8049FE0_0804aff4
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
    ldr        r0,PTR_EntityAllocParams_804C1BC_0804aff8
    bl         Entity_AllocList
    pop        {r5}
    pop        {pc}

PTR_MapSetup_Power_Plant_Comp_3_F50_0804aedc:
    .word MapSetup_Power_Plant_Comp_3_F50
    .word MapSetup_Power_Plant_Comp_3_F50
    .word MapSetup_Power_Plant_Comp_3_F50
    .word MapSetup_Power_Plant_Comp_3_F50
    .word MapSetup_Power_Plant_Comp_3_F50
    .word MapSetup_Power_Plant_Comp_3_F50
    .word MapSetup_Power_Plant_Comp_3_F50
    .word MapSetup_Power_Plant_Comp_3_F50
    .word MapSetup_Power_Plant_Comp_3_F50
    .word MapSetup_Power_Plant_Comp_3_F50
    .word MapSetup_Power_Plant_Comp_3_F50
    .word MapSetup_Power_Plant_Comp_3_F50
    .word MapSetup_Power_Plant_Comp_3_F50
    .word MapSetup_Power_Plant_Comp_3_F50
    .word MapSetup_Power_Plant_Comp_3_F50
    .word MapSetup_Power_Plant_Comp_3_F50


_ts EventHandler_Power_Plant_3_S5
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Power_Plant_Comp_3_F50_0804affc
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         FUN_0804a6e0
    pop        {pc}

PTR_EventHandler_Power_Plant_Comp_3_F50_0804af2c:
    .word EventHandler_Power_Plant_Comp_3_F50
    .word EventHandler_Power_Plant_Comp_3_F50
    .word EventHandler_Power_Plant_Comp_3_F50
    .word EventHandler_Power_Plant_Comp_3_F50
    .word EventHandler_Power_Plant_Comp_3_F50
    .word EventHandler_Power_Plant_Comp_3_F50
    .word EventHandler_Power_Plant_Comp_3_F50
    .word EventHandler_Power_Plant_Comp_3_F50
    .word EventHandler_Power_Plant_Comp_3_F50
    .word EventHandler_Power_Plant_Comp_3_F50
    .word EventHandler_Power_Plant_Comp_3_F50
    .word EventHandler_Power_Plant_Comp_3_F50
    .word EventHandler_Power_Plant_Comp_3_F50
    .word EventHandler_Power_Plant_Comp_3_F50
    .word EventHandler_Power_Plant_Comp_3_F50
    .word EventHandler_Power_Plant_Comp_3_F50


_ts MapSetup_Power_Plant_Comp_3_F50
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_804B8B8_0804b000
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    bne        LAB_0804af9e
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_0804afaa
LAB_0804af9e:
    push       {r5}
    ldr        r0,DAT_0804b004
    ldr        r1,PTR_DAT_0804b008
    bl         Scene_Prepare
    pop        {r5}
LAB_0804afaa:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Power_Plant_Comp_3_F50
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Power_Plant_Comp_3_F50_0_0804b00c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Power_Plant_Comp_3_F50_0_0804afc0:
    .word EventHandler_Power_Plant_Comp_3_F50_0


_ts EventHandler_Power_Plant_Comp_3_F50_0
    push       {lr}
    mov        r0,#0xa
    bl         CheckForJackOut
    pop        {pc}

    .align 2, 0

PTR_PTR_MapSetup_Power_Plant_Comp_3_F50_0804afd0:
    .word PTR_MapSetup_Power_Plant_Comp_3_F50_0804aedc

PTR_BgTask_8049C00_0804afd4:
    .word BgTask_8049C00

PTR_BgTask_8049C70_0804afd8:
    .word BgTask_8049C70

PTR_BgTask_8049CE0_0804afdc:
    .word BgTask_8049CE0

PTR_BgTask_8049D50_0804afe0:
    .word BgTask_8049D50

PTR_BgTask_8049D68_0804afe4:
    .word BgTask_8049D68

PTR_BgTask_8049E30_0804afe8:
    .word BgTask_8049E30

PTR_BgTask_8049EF0_0804afec:
    .word BgTask_8049EF0

PTR_BgTask_8049FB0_0804aff0:
    .word BgTask_8049FB0

PTR_BgTask_8049FE0_0804aff4:
    .word BgTask_8049FE0

PTR_EntityAllocParams_804C1BC_0804aff8:
    .word EntityAllocParams_804C1BC

PTR_PTR_EventHandler_Power_Plant_Comp_3_F50_0804affc:
    .word PTR_EventHandler_Power_Plant_Comp_3_F50_0804af2c

PTR_NPCList_804B8B8_0804b000:
    .word NPCList_804B8B8

DAT_0804b004:
    .word Scene_MegaManJackIn

PTR_DAT_0804b008:
    .word 0x2000

PTR_PTR_EventHandler_Power_Plant_Comp_3_F50_0_0804b00c:
    .word PTR_EventHandler_Power_Plant_Comp_3_F50_0_0804afc0
