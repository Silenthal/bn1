#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set FUN_0808598c, 0x808598D
    .set Scene_ChipTrader, 0x8085DD9
    .set FUN_080857b8, 0x80857B9
    .set Script_ShowDialogue, 0x80848FD
    .set FUN_08085f54, 0x8085F55


_ts MapSetup_ACDC_Higsbys_S2
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_Default_0802ec9c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r0,#0xab
    bl         Flag_GetBase
    beq        LAB_0802ea5a
    push       {r5}
    mov        r0,#0x4
    bl         Sound_ChangeSong
    pop        {r5}
    b          LAB_0802ea72
LAB_0802ea5a:
    mov        r0,#0xdf
    bl         Flag_GetBase
    beq        LAB_0802ea6e
    push       {r5}
    mov        r0,#0x3
    bl         Sound_ChangeSong
    pop        {r5}
    b          LAB_0802ea72
LAB_0802ea6e:
    bl         Sound_AreaSongChange
LAB_0802ea72:
    bl         StartChipTraderSceneIfPending
    pop        {pc}
PTR_MapSetup_Default_0802ea78:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_ACDC_Higsbys_F24
    .word MapSetup_ACDC_Higsbys_F24
    .word MapSetup_ACDC_Higsbys_F26
    .word MapSetup_ACDC_Higsbys_F26


_ts EventHandler_ACDC_Higsbys_S2
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Default_0802eca0
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         FUN_0802ec40
    pop        {pc}
PTR_EventHandler_Default_0802eaa8:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_ACDC_Higsbys_F24
    .word EventHandler_ACDC_Higsbys_F24
    .word EventHandler_ACDC_Higsbys_F26
    .word EventHandler_ACDC_Higsbys_F26


_ts MapSetup_ACDC_Higsbys_F24
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r0,PTR_EntityAllocParams_ARRAY_0802eca4
    bl         Entity_AllocList
    ldr        r7,PTR_PTR_DAT_0802eca8
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x36
    bl         Flag_GetBase
    bne        LAB_0802eb04
    mov        r0,#0x29
    bl         Flag_GetBase
    beq        LAB_0802eb04
    push       {r5}
    ldr        r0,DAT_0802ecac
    mov        r1,#0x8
    bl         Scene_Prepare
    pop        {r5}
LAB_0802eb04:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}

    .align 2, 0


_ts EventHandler_ACDC_Higsbys_F24
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Higsbys_F24_0_0802ecb0
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_Higsbys_F24_0_0802eb1c:
    .word EventHandler_ACDC_Higsbys_F24_0


_ts EventHandler_ACDC_Higsbys_F24_0
    push       {lr}
    bl         Scene_IsSceneActive
    tst        r0,r0
    bne        LAB_0802eb60
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x20
    bne        LAB_0802eb42
    push       {r5}
    ldr        r0,DAT_0802ecb4
    mov        r1,#0xa
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0802eb42:
    mov        r0,#0x36
    bl         Flag_GetBase
    bne        LAB_0802eb60
    mov        r0,#0x29
    bl         Flag_GetBase
    beq        LAB_0802eb60
    push       {r5}
    ldr        r0,DAT_0802ecb8
    mov        r1,#0x8
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0802eb60:
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x10
    bne        LAB_0802eb7c
    mov        r0,#0x27
    bl         Flag_SetBase
    pop        {pc}
LAB_0802eb7c:
    mov        r0,#0x27
    bl         Flag_ClearBase
    pop        {pc}


_ts MapSetup_ACDC_Higsbys_F26
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r0,PTR_EntityAllocParams_ARRAY_0802ecbc
    bl         Entity_AllocList
    ldr        r7,PTR_PTR_DAT_0802ecc0
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x36
    bl         Flag_GetBase
    bne        LAB_0802ebc0
    mov        r0,#0x29
    bl         Flag_GetBase
    beq        LAB_0802ebc0
    push       {r5}
    ldr        r0,PTR_FUN_0808598c_0802ecc4
    mov        r1,#0x8
    bl         Scene_Prepare
    pop        {r5}
LAB_0802ebc0:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}

    .align 2, 0


_ts EventHandler_ACDC_Higsbys_F26
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Higsbys_F26_0_0802ecc8
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_Higsbys_F26_0_0802ebd8:
    .word EventHandler_ACDC_Higsbys_F26_0


_ts EventHandler_ACDC_Higsbys_F26_0
    push       {lr}
    bl         Scene_IsSceneActive
    tst        r0,r0
    bne        FUN_0802ec1c
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x20
    bne        LAB_0802ebfe
    push       {r5}
    ldr        r0,DAT_0802eccc
    mov        r1,#0xa
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0802ebfe:
    mov        r0,#0x36
    bl         Flag_GetBase
    bne        FUN_0802ec1c
    mov        r0,#0x29
    bl         Flag_GetBase
    beq        FUN_0802ec1c
    push       {r5}
    ldr        r0,DAT_0802ecd0
    mov        r1,#0x8
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}


_ts FUN_0802ec1c
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x10
    bne        LAB_0802ec38
    mov        r0,#0x27
    bl         Flag_SetBase
    pop        {pc}
LAB_0802ec38:
    mov        r0,#0x27
    bl         Flag_ClearBase
    pop        {pc}


_ts FUN_0802ec40
    push       {r5,lr}
    mov        r7,r10
    ldr        r6,[r7,#0x18]
    ldrb       r6,[r6,#0x3]
    mov        r1,#0x1
    cmp        r6,r1
    beq        LAB_0802ec80
    push       {r0}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r0}
    bne        LAB_0802ec80
    push       {r0}
    bl         Scene_IsSceneActive
    pop        {r0}
    bne        LAB_0802ec80
    mov        r7,r10
    ldr        r1,[r7,#0x8]
    ldrb       r1,[r1,#0xe]
    cmp        r1,#0x21
    blt        LAB_0802ec80
    cmp        r1,#0x22
    bgt        LAB_0802ec80
    push       {r5}
    ldr        r0,PTR_FUN_08085f54_0802ecd4
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x0
    pop        {r5,pc}
LAB_0802ec80:
    mov        r0,#0x1
    pop        {r5,pc}


_ts StartChipTraderSceneIfPending
    push       {r5,lr}
    ldr        r7,PTR_gChipTrader_0802ecd8
    ldrh       r2,[r7,#0x4]
    cmp        r2,#0x0
    beq        LAB_0802ec98
    push       {r5}
    ldr        r0,PTR_Scene_ChipTrader_0802ecdc
    bl         Scene_Prepare
    pop        {r5}
LAB_0802ec98:
    pop        {r5,pc}

    .align 2, 0

PTR_PTR_MapSetup_Default_0802ec9c:
    .word PTR_MapSetup_Default_0802ea78
PTR_PTR_EventHandler_Default_0802eca0:
    .word PTR_EventHandler_Default_0802eaa8
PTR_EntityAllocParams_ARRAY_0802eca4:
    .word EntityAllocParams_8031024
PTR_PTR_DAT_0802eca8:
    .word NPCList_8030A64
DAT_0802ecac:
    .word 0x808598D
PTR_PTR_EventHandler_ACDC_Higsbys_F24_0_0802ecb0:
    .word PTR_EventHandler_ACDC_Higsbys_F24_0_0802eb1c
DAT_0802ecb4:
    .word 0x80848FD
DAT_0802ecb8:
    .word 0x80857B9
PTR_EntityAllocParams_ARRAY_0802ecbc:
    .word EntityAllocParams_8031024
PTR_PTR_DAT_0802ecc0:
    .word NPCList_8030AD8
PTR_FUN_0808598c_0802ecc4:
    .word FUN_0808598c
PTR_PTR_EventHandler_ACDC_Higsbys_F26_0_0802ecc8:
    .word PTR_EventHandler_ACDC_Higsbys_F26_0_0802ebd8
DAT_0802eccc:
    .word 0x80848FD
DAT_0802ecd0:
    .word 0x80857B9
PTR_FUN_08085f54_0802ecd4:
    .word FUN_08085f54
PTR_gChipTrader_0802ecd8:
    .word gChipTrader
PTR_Scene_ChipTrader_0802ecdc:
    .word Scene_ChipTrader


_ts MapSetup_ACDC_Higsbys_S3
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_ACDC_Higsbys_F30_0802ee14
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Sound_AreaSongChange
    bl         StartChipTraderSceneIfPending
    pop        {pc}
PTR_MapSetup_ACDC_Higsbys_F30_0802ecf4:
    .word MapSetup_ACDC_Higsbys_F30
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default


_ts EventHandler_ACDC_Higsbys_S3
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Higsbys_F30_0802ee18
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         FUN_0802ec40
    pop        {pc}
PTR_EventHandler_ACDC_Higsbys_F30_0802ed24:
    .word EventHandler_ACDC_Higsbys_F30
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default


_ts MapSetup_ACDC_Higsbys_F30
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r0,PTR_EntityAllocParams_ARRAY_0802ee1c
    bl         Entity_AllocList
    ldr        r7,PTR_PTR_DAT_0802ee20
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x29
    bl         Flag_GetBase
    beq        LAB_0802ed8a
    mov        r6,#0x8
    mov        r0,#0x36
    bl         Flag_GetBase
    beq        LAB_0802ed78
    mov        r6,#0x9
LAB_0802ed78:
    mov        r0,#0x29
    bl         Flag_ClearBase
    add        r1,r6,#0x0
    push       {r5}
    ldr        r0,DAT_0802ee24
    bl         Scene_Prepare
    pop        {r5}
LAB_0802ed8a:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_ACDC_Higsbys_F30
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Higsbys_F30_0_0802ee28
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    bl         FUN_0802edac
    pop        {pc}
PTR_EventHandler_ACDC_Higsbys_F30_0_0802eda4:
    .word EventHandler_ACDC_Higsbys_F30_0


_ts EventHandler_ACDC_Higsbys_F30_0
    push       {lr}
    pop        {pc}


_ts FUN_0802edac
    push       {lr}
    bl         Scene_IsSceneActive
    tst        r0,r0
    bne        LAB_0802edf0
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x20
    bne        LAB_0802edce
    push       {r5}
    ldr        r0,PTR_Script_ShowDialogue_0802ee2c
    mov        r1,#0xa
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0802edce:
    mov        r6,#0x8
    mov        r0,#0x36
    bl         Flag_GetBase
    beq        LAB_0802edda
    mov        r6,#0xb
LAB_0802edda:
    mov        r0,#0x29
    bl         Flag_GetBase
    beq        LAB_0802edf0
    add        r1,r6,#0x0
    push       {r5}
    ldr        r0,PTR_FUN_080857b8_0802ee30
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0802edf0:
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x10
    bne        LAB_0802ee0c
    mov        r0,#0x27
    bl         Flag_SetBase
    pop        {pc}
LAB_0802ee0c:
    mov        r0,#0x27
    bl         Flag_ClearBase
    pop        {pc}
PTR_PTR_MapSetup_ACDC_Higsbys_F30_0802ee14:
    .word PTR_MapSetup_ACDC_Higsbys_F30_0802ecf4
PTR_PTR_EventHandler_ACDC_Higsbys_F30_0802ee18:
    .word PTR_EventHandler_ACDC_Higsbys_F30_0802ed24
PTR_EntityAllocParams_ARRAY_0802ee1c:
    .word EntityAllocParams_8031024
PTR_PTR_DAT_0802ee20:
    .word NPCList_8030AE8
DAT_0802ee24:
    .word 0x808598D
PTR_PTR_EventHandler_ACDC_Higsbys_F30_0_0802ee28:
    .word PTR_EventHandler_ACDC_Higsbys_F30_0_0802eda4
PTR_Script_ShowDialogue_0802ee2c:
    .word Script_ShowDialogue
PTR_FUN_080857b8_0802ee30:
    .word FUN_080857b8


_ts MapSetup_ACDC_Higsbys_S4
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_ACDC_Higsbys_F40_0802ef60
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Sound_AreaSongChange
    bl         StartChipTraderSceneIfPending
    pop        {pc}
PTR_MapSetup_ACDC_Higsbys_F40_0802ee48:
    .word MapSetup_ACDC_Higsbys_F40
    .word MapSetup_ACDC_Higsbys_F40
    .word MapSetup_ACDC_Higsbys_F40
    .word MapSetup_ACDC_Higsbys_F40
    .word MapSetup_ACDC_Higsbys_F40
    .word MapSetup_ACDC_Higsbys_F40
    .word MapSetup_ACDC_Higsbys_F40
    .word MapSetup_ACDC_Higsbys_F40


_ts EventHandler_ACDC_Higsbys_S4
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Higsbys_F40_0802ef64
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         FUN_0802ec40
    pop        {pc}
PTR_EventHandler_ACDC_Higsbys_F40_0802ee78:
    .word EventHandler_ACDC_Higsbys_F40
    .word EventHandler_ACDC_Higsbys_F40
    .word EventHandler_ACDC_Higsbys_F40
    .word EventHandler_ACDC_Higsbys_F40
    .word EventHandler_ACDC_Higsbys_F40
    .word EventHandler_ACDC_Higsbys_F40
    .word EventHandler_ACDC_Higsbys_F40
    .word EventHandler_ACDC_Higsbys_F40


_ts MapSetup_ACDC_Higsbys_F40
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r0,PTR_EntityAllocParams_ARRAY_0802ef68
    bl         Entity_AllocList
    ldr        r7,PTR_PTR_DAT_0802ef6c
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x29
    bl         Flag_GetBase
    beq        LAB_0802eede
    mov        r6,#0x8
    mov        r0,#0x36
    bl         Flag_GetBase
    beq        LAB_0802eecc
    mov        r6,#0x9
LAB_0802eecc:
    mov        r0,#0x29
    bl         Flag_ClearBase
    add        r1,r6,#0x0
    push       {r5}
    ldr        r0,DAT_0802ef70
    bl         Scene_Prepare
    pop        {r5}
LAB_0802eede:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_ACDC_Higsbys_F40
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Higsbys_F40_0_0802ef74
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_Higsbys_F40_0_0802eef4:
    .word EventHandler_ACDC_Higsbys_F40_0


_ts EventHandler_ACDC_Higsbys_F40_0
    push       {lr}
    bl         Scene_IsSceneActive
    tst        r0,r0
    bne        LAB_0802ef5e
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x20
    bne        LAB_0802ef1a
    push       {r5}
    ldr        r0,DAT_0802ef78
    mov        r1,#0xa
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0802ef1a:
    mov        r6,#0x8
    mov        r0,#0x36
    bl         Flag_GetBase
    beq        LAB_0802ef26
    mov        r6,#0xb
LAB_0802ef26:
    mov        r0,#0x29
    bl         Flag_GetBase
    beq        LAB_0802ef3c
    add        r1,r6,#0x0
    push       {r5}
    ldr        r0,DAT_0802ef7c
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0802ef3c:
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x10
    bne        LAB_0802ef58
    mov        r0,#0x27
    bl         Flag_SetBase
    pop        {pc}
LAB_0802ef58:
    mov        r0,#0x27
    bl         Flag_ClearBase
LAB_0802ef5e:
    pop        {pc}
PTR_PTR_MapSetup_ACDC_Higsbys_F40_0802ef60:
    .word PTR_MapSetup_ACDC_Higsbys_F40_0802ee48
PTR_PTR_EventHandler_ACDC_Higsbys_F40_0802ef64:
    .word PTR_EventHandler_ACDC_Higsbys_F40_0802ee78
PTR_EntityAllocParams_ARRAY_0802ef68:
    .word EntityAllocParams_8031024
PTR_PTR_DAT_0802ef6c:
    .word NPCList_8030AE8
DAT_0802ef70:
    .word 0x808598D
PTR_PTR_EventHandler_ACDC_Higsbys_F40_0_0802ef74:
    .word PTR_EventHandler_ACDC_Higsbys_F40_0_0802eef4
DAT_0802ef78:
    .word 0x80848FD
DAT_0802ef7c:
    .word 0x80857B9


_ts MapSetup_ACDC_Higsbys_S5
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_ACDC_Higsbys_F50_0802f13c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Sound_AreaSongChange
    bl         StartChipTraderSceneIfPending
    pop        {pc}
PTR_MapSetup_ACDC_Higsbys_F50_0802ef94:
    .word MapSetup_ACDC_Higsbys_F50
    .word MapSetup_ACDC_Higsbys_F50
    .word MapSetup_ACDC_Higsbys_F50
    .word MapSetup_ACDC_Higsbys_F53
    .word MapSetup_ACDC_Higsbys_F53
    .word MapSetup_ACDC_Higsbys_F53
    .word MapSetup_ACDC_Higsbys_F53
    .word MapSetup_ACDC_Higsbys_F53


_ts EventHandler_ACDC_Higsbys_S5
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Higsbys_F50_0802f140
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         FUN_0802ec40
    pop        {pc}
PTR_EventHandler_ACDC_Higsbys_F50_0802efc4:
    .word EventHandler_ACDC_Higsbys_F50
    .word EventHandler_ACDC_Higsbys_F50
    .word EventHandler_ACDC_Higsbys_F50
    .word EventHandler_ACDC_Higsbys_F53
    .word EventHandler_ACDC_Higsbys_F53
    .word EventHandler_ACDC_Higsbys_F53
    .word EventHandler_ACDC_Higsbys_F53
    .word EventHandler_ACDC_Higsbys_F53


_ts MapSetup_ACDC_Higsbys_F50
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r0,PTR_EntityAllocParams_ARRAY_0802f144
    bl         Entity_AllocList
    ldr        r7,PTR_PTR_DAT_0802f148
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    mov        r0,#0x29
    bl         Flag_GetBase
    beq        LAB_0802f02e
    mov        r6,#0x8
    mov        r0,#0x36
    bl         Flag_GetBase
    beq        LAB_0802f01c
    mov        r6,#0x9
LAB_0802f01c:
    mov        r0,#0x29
    bl         Flag_ClearBase
    add        r1,r6,#0x0
    push       {r5}
    ldr        r0,DAT_0802f14c
    bl         Scene_Prepare
    pop        {r5}
LAB_0802f02e:
    pop        {pc}


_ts EventHandler_ACDC_Higsbys_F50
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Higsbys_F50_0_0802f150
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_Higsbys_F50_0_0802f040:
    .word EventHandler_ACDC_Higsbys_F50_0


_ts EventHandler_ACDC_Higsbys_F50_0
    push       {lr}
    bl         Scene_IsSceneActive
    tst        r0,r0
    bne        LAB_0802f088
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x20
    bne        LAB_0802f066
    push       {r5}
    ldr        r0,DAT_0802f154
    mov        r1,#0xa
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0802f066:
    mov        r6,#0x8
    mov        r0,#0x36
    bl         Flag_GetBase
    beq        LAB_0802f072
    mov        r6,#0xb
LAB_0802f072:
    mov        r0,#0x29
    bl         Flag_GetBase
    beq        LAB_0802f088
    add        r1,r6,#0x0
    push       {r5}
    ldr        r0,DAT_0802f158
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0802f088:
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x10
    bne        LAB_0802f0a4
    mov        r0,#0x27
    bl         Flag_SetBase
    pop        {pc}
LAB_0802f0a4:
    mov        r0,#0x27
    bl         Flag_ClearBase
    pop        {pc}


_ts MapSetup_ACDC_Higsbys_F53
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r0,PTR_EntityAllocParams_ARRAY_0802f15c
    bl         Entity_AllocList
    ldr        r7,PTR_PTR_LAB_0802f160
    bl         Map_LoadNPCList
    mov        r0,#0xf
    bl         KeyItem_IsPresent
    bne        LAB_0802f0d6
    bl         Effect_WWWPass_Create
LAB_0802f0d6:
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}

    .align 2, 0


_ts EventHandler_ACDC_Higsbys_F53
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Higsbys_F53_0_0802f164
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_Higsbys_F53_0_0802f0f0:
    .word EventHandler_ACDC_Higsbys_F53_0


_ts EventHandler_ACDC_Higsbys_F53_0
    push       {lr}
    bl         Scene_IsSceneActive
    tst        r0,r0
    bne        LAB_0802f13a
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x20
    bne        LAB_0802f114
    push       {r5}
    ldr        r0,DAT_0802f168
    mov        r1,#0xa
    bl         Scene_Prepare
    pop        {r5}
LAB_0802f114:
    cmp        r0,#0xf1
    bne        LAB_0802f13a
    mov        r0,#0xf
    bl         KeyItem_IsPresent
    beq        LAB_0802f12e
    push       {r5}
    ldr        r0,DAT_0802f16c
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_0802f13a
LAB_0802f12e:
    mov        r1,#0x51
    push       {r5}
    ldr        r0,DAT_0802f170
    bl         Scene_Prepare
    pop        {r5}
LAB_0802f13a:
    pop        {pc}
PTR_PTR_MapSetup_ACDC_Higsbys_F50_0802f13c:
    .word PTR_MapSetup_ACDC_Higsbys_F50_0802ef94
PTR_PTR_EventHandler_ACDC_Higsbys_F50_0802f140:
    .word PTR_EventHandler_ACDC_Higsbys_F50_0802efc4
PTR_EntityAllocParams_ARRAY_0802f144:
    .word EntityAllocParams_8031024
PTR_PTR_DAT_0802f148:
    .word NPCList_8030B5C
DAT_0802f14c:
    .word 0x808598D
PTR_PTR_EventHandler_ACDC_Higsbys_F50_0_0802f150:
    .word PTR_EventHandler_ACDC_Higsbys_F50_0_0802f040
DAT_0802f154:
    .word 0x80848FD
DAT_0802f158:
    .word 0x80857B9
PTR_EntityAllocParams_ARRAY_0802f15c:
    .word EntityAllocParams_8031024
PTR_PTR_LAB_0802f160:
    .word NPCList_8030B70
PTR_PTR_EventHandler_ACDC_Higsbys_F53_0_0802f164:
    .word PTR_EventHandler_ACDC_Higsbys_F53_0_0802f0f0
DAT_0802f168:
    .word 0x80848FD
DAT_0802f16c:
    .word 0x8097E95
DAT_0802f170:
    .word 0x80848FD
