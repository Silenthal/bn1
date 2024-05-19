#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_Waterworks_Comp_2_S2
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,PTR_PTR_MapSetup_Default_08045e80
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    mov        r0,#0xcc
    bl         Flag_GetBase
    bne        LAB_08045cf4
    ldr        r0,PTR_BgTask_80440D8_08045e84
    bl         BgTask_AddNew
    b          LAB_08045d00
LAB_08045cf4:
    ldr        r0,PTR_BgTask_80442E8_08045e88
    bl         BgTask_AddNew
    ldr        r0,DAT_08045e8c
    bl         BgTask_AddNew
LAB_08045d00:
    ldr        r0,PTR_EntityAllocParams_8046FBC_08045e90
    bl         Entity_AllocList
    pop        {r5}
    mov        r0,#0xe5
    bl         Flag_GetBase
    beq        LAB_08045d1a
    push       {r5}
    mov        r0,#0x1
    bl         Flag_Set380
    pop        {r5}
LAB_08045d1a:
    mov        r0,#0xe6
    bl         Flag_GetBase
    bne        LAB_08045d2c
    push       {r5}
    mov        r0,#0x2
    bl         Flag_Set380
    pop        {r5}
LAB_08045d2c:
    mov        r0,#0xf0
    bl         Flag_GetBase
    bne        LAB_08045d40
    push       {r5}
    ldr        r0,PTR_BgTask_8044348_08045e94
    bl         BgTask_AddNew
    pop        {r5}
    b          LAB_08045d4a
LAB_08045d40:
    push       {r5}
    ldr        r0,PTR_BgTask_8044360_08045e98
    bl         BgTask_AddNew
    pop        {r5}
LAB_08045d4a:
    mov        r0,#0xe7
    bl         Flag_GetBase
    beq        LAB_08045d5c
    push       {r5}
    mov        r0,#0x3
    bl         Flag_Set380
    pop        {r5}
LAB_08045d5c:
    pop        {pc}

    .align 2, 0

PTR_MapSetup_Default_08045d60:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Waterworks_Comp_2_F25
    .word MapSetup_Waterworks_Comp_2_F25
    .word MapSetup_Waterworks_Comp_2_F25


_ts EventHandler_Waterworks_Comp_2_S2
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Default_08045e9c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Default_08045d8c:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Waterworks_Comp_2_F25
    .word EventHandler_Waterworks_Comp_2_F25
    .word EventHandler_Waterworks_Comp_2_F25


_ts MapSetup_Waterworks_Comp_2_F25
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    bne        LAB_08045dd4
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_08045de0
LAB_08045dd4:
    push       {r5}
    ldr        r0,DAT_08045ea0
    ldr        r1,PTR_DAT_08045ea4
    bl         Scene_Prepare
    pop        {r5}
LAB_08045de0:
    mov        r0,#0xb4
    bl         Flag_GetBase
    bne        LAB_08045df8
    push       {r5}
    ldr        r7,PTR_NPCList_8046C84_08045ea8
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}
LAB_08045df8:
    mov        r0,#0x4
    str        r0,[r5,#0x0]
    mov        r0,#0xb1
    bl         Flag_GetBase
    bne        LAB_08045e10
    push       {r5}
    ldr        r7,PTR_NPCList_8046CC8_08045eac
    bl         Map_LoadNPCList
    pop        {r5}
    pop        {pc}
LAB_08045e10:
    push       {r5}
    ldr        r7,PTR_NPCList_8046D50_08045eb0
    bl         Map_LoadNPCList
    pop        {r5}
    pop        {pc}


_ts EventHandler_Waterworks_Comp_2_F25
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Waterworks_Comp_2_F25_0_08045eb4
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}

    .align 2, 0

PTR_EventHandler_Waterworks_Comp_2_F25_0_08045e34:
    .word EventHandler_Waterworks_Comp_2_F25_0
    .word EventHandler_Waterworks_Comp_2_F25_1


_ts EventHandler_Waterworks_Comp_2_F25_0
    push       {lr}
    bl         FUN_08045a8c
    beq        LAB_08045e6e
    bl         FUN_08045ae0
    beq        LAB_08045e6e
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x18
    bne        LAB_08045e6e
    push       {r5}
    ldr        r0,PTR_LAB_08089c34_08045eb8
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x4
    str        r0,[r5,#0x0]
LAB_08045e6e:
    pop        {pc}


_ts EventHandler_Waterworks_Comp_2_F25_1
    push       {lr}
    bl         FUN_08045a8c
    beq        LAB_08045e7e
    bl         FUN_08045ae0
    beq        LAB_08045e7e
LAB_08045e7e:
    pop        {pc}

PTR_PTR_MapSetup_Default_08045e80:
    .word PTR_MapSetup_Default_08045d60

PTR_BgTask_80440D8_08045e84:
    .word BgTask_80440D8

PTR_BgTask_80442E8_08045e88:
    .word BgTask_80442E8

DAT_08045e8c:
    .word BgTask_8044318

PTR_EntityAllocParams_8046FBC_08045e90:
    .word EntityAllocParams_8046FBC

PTR_BgTask_8044348_08045e94:
    .word BgTask_8044348

PTR_BgTask_8044360_08045e98:
    .word BgTask_8044360

PTR_PTR_EventHandler_Default_08045e9c:
    .word PTR_EventHandler_Default_08045d8c

DAT_08045ea0:
    .word 0x8084071

PTR_DAT_08045ea4:
    .word 0x2000

PTR_NPCList_8046C84_08045ea8:
    .word NPCList_8046C84

PTR_NPCList_8046CC8_08045eac:
    .word NPCList_8046CC8

PTR_NPCList_8046D50_08045eb0:
    .word NPCList_8046D50

PTR_PTR_EventHandler_Waterworks_Comp_2_F25_0_08045eb4:
    .word PTR_EventHandler_Waterworks_Comp_2_F25_0_08045e34

PTR_LAB_08089c34_08045eb8:
    .word 0x8089C35


_ts MapSetup_Waterworks_Comp_2_S3
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,PTR_PTR_MapSetup_Waterworks_Comp_2_F30_08045fbc
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_80442E8_08045fc0
    bl         BgTask_AddNew
    ldr        r0,DAT_08045fc4
    bl         BgTask_AddNew
    ldr        r0,PTR_EntityAllocParams_8046FBC_08045fc8
    bl         Entity_AllocList
    mov        r0,#0x1
    bl         Flag_Set380
    mov        r0,#0x2
    bl         Flag_Set380
    mov        r0,#0x3
    bl         Flag_Set380
    ldr        r0,PTR_BgTask_8044360_08045fcc
    bl         BgTask_AddNew
    pop        {r5}
    pop        {pc}

    .align 2, 0

PTR_MapSetup_Waterworks_Comp_2_F30_08045f00:
    .word MapSetup_Waterworks_Comp_2_F30
    .word MapSetup_Waterworks_Comp_2_F30
    .word MapSetup_Waterworks_Comp_2_F30
    .word MapSetup_Waterworks_Comp_2_F30
    .word MapSetup_Waterworks_Comp_2_F30
    .word MapSetup_Waterworks_Comp_2_F30
    .word MapSetup_Waterworks_Comp_2_F30
    .word MapSetup_Waterworks_Comp_2_F30


_ts EventHandler_Waterworks_Comp_2_S3
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Waterworks_Comp_2_F30_08045fd0
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Waterworks_Comp_2_F30_08045f2c:
    .word EventHandler_Waterworks_Comp_2_F30
    .word EventHandler_Waterworks_Comp_2_F30
    .word EventHandler_Waterworks_Comp_2_F30
    .word EventHandler_Waterworks_Comp_2_F30
    .word EventHandler_Waterworks_Comp_2_F30
    .word EventHandler_Waterworks_Comp_2_F30
    .word EventHandler_Waterworks_Comp_2_F30
    .word EventHandler_Waterworks_Comp_2_F30


_ts MapSetup_Waterworks_Comp_2_F30
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    bne        LAB_08045f74
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_08045f80
LAB_08045f74:
    push       {r5}
    ldr        r0,DAT_08045fd4
    ldr        r1,PTR_DAT_08045fd8
    bl         Scene_Prepare
    pop        {r5}
LAB_08045f80:
    push       {r5}
    ldr        r7,PTR_NPCList_8046D50_08045fdc
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Waterworks_Comp_2_F30
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Waterworks_Comp_2_F30_0_08045fe0
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}

    .align 2, 0

PTR_EventHandler_Waterworks_Comp_2_F30_0_08045fa8:
    .word EventHandler_Waterworks_Comp_2_F30_0


_ts EventHandler_Waterworks_Comp_2_F30_0
    push       {lr}
    bl         FUN_08045a8c
    beq        LAB_08045fba
    bl         FUN_08045b3c
    beq        LAB_08045fba
LAB_08045fba:
    pop        {pc}

PTR_PTR_MapSetup_Waterworks_Comp_2_F30_08045fbc:
    .word PTR_MapSetup_Waterworks_Comp_2_F30_08045f00

PTR_BgTask_80442E8_08045fc0:
    .word BgTask_80442E8

DAT_08045fc4:
    .word BgTask_8044318

PTR_EntityAllocParams_8046FBC_08045fc8:
    .word EntityAllocParams_8046FBC

PTR_BgTask_8044360_08045fcc:
    .word BgTask_8044360

PTR_PTR_EventHandler_Waterworks_Comp_2_F30_08045fd0:
    .word PTR_EventHandler_Waterworks_Comp_2_F30_08045f2c

DAT_08045fd4:
    .word 0x8084071

PTR_DAT_08045fd8:
    .word 0x2000

PTR_NPCList_8046D50_08045fdc:
    .word NPCList_8046D50

PTR_PTR_EventHandler_Waterworks_Comp_2_F30_0_08045fe0:
    .word PTR_EventHandler_Waterworks_Comp_2_F30_0_08045fa8
