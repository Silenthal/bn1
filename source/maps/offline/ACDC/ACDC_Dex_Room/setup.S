#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set FUN_08088240, 0x8088241


_ts MapSetup_ACDC_Dex_Room_S0
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_Default_0802de38
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Sound_AreaSongChange
    push       {r5}
    ldr        r0,PTR_BgTask_802DE3C
    bl         BgTask_AddNew
    pop        {r5}
    pop        {pc}

    .align 2, 0

PTR_MapSetup_Default_0802dd24:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_ACDC_Dex_Room_F06


_ts EventHandler_ACDC_Dex_Room_S0
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Default_0802de40
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r0,#0x41
    mov        r1,#0x1e
    bl         CheckForJackIn
    pop        {pc}
PTR_EventHandler_Default_0802dd54:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_ACDC_Dex_Room_F06


_ts MapSetup_ACDC_Dex_Room_F06
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r0,PTR_DAT_0802de44
    bl         Entity_AllocList
    ldr        r7,PTR_PTR_DAT_0802de48
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x44
    bl         Flag_GetBase
    bne        LAB_0802ddb0
    push       {r5}
    mov        r0,#0x2b
    bl         Flag_GetBase
    pop        {r5}
    beq        LAB_0802ddb0
    push       {r5}
    ldr        r0,DAT_0802de4c
    mov        r1,#0x15
    bl         Scene_Prepare
    pop        {r5}
LAB_0802ddb0:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}

    .align 2, 0


_ts EventHandler_ACDC_Dex_Room_F06
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Dex_Room_F06_0_0802de50
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_Dex_Room_F06_0_0802ddc8:
    .word EventHandler_ACDC_Dex_Room_F06_0


_ts EventHandler_ACDC_Dex_Room_F06_0
    push       {lr}
    bl         FUN_0802ddf4
    beq        LAB_0802ddf0
    mov        r0,#0x44
    bl         Flag_GetBase
    bne        LAB_0802ddf0
    mov        r0,#0x2b
    bl         Flag_GetBase
    beq        LAB_0802ddf0
    push       {r5}
    ldr        r0,DAT_0802de54
    mov        r1,#0x2
    bl         Scene_Prepare
    pop        {r5}
LAB_0802ddf0:
    pop        {pc}

    .align 2, 0


_ts FUN_0802ddf4
    push       {lr}
    mov        r0,#0x80
    bl         Text_CheckOption
    bne        LAB_0802de34
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x40
    bne        LAB_0802de34
    mov        r0,r10
    ldr        r0,[r0,#0x4]
    ldrh       r0,[r0,#0x2]
    ldr        r1,DAT_0802de58
    mvn        r0,r0
    and        r1,r0
    bne        LAB_0802de34
    bl         dummy_187a0
    bne        LAB_0802de34
    push       {r5}
    ldr        r0,DAT_0802de5c
    mov        r1,#0x9
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x0
LAB_0802de34:
    pop        {pc}

    .align 2, 0

PTR_PTR_MapSetup_Default_0802de38:
    .word PTR_MapSetup_Default_0802dd24
PTR_BgTask_802DE3C:
    .word BgTask_802A284
PTR_PTR_EventHandler_Default_0802de40:
    .word PTR_EventHandler_Default_0802dd54
PTR_DAT_0802de44:
    .word EntityAllocParams_8030FF8
PTR_PTR_DAT_0802de48:
    .word NPCList_8030920
DAT_0802de4c:
    .word Scene_AfterFixedBattle
PTR_PTR_EventHandler_ACDC_Dex_Room_F06_0_0802de50:
    .word PTR_EventHandler_ACDC_Dex_Room_F06_0_0802ddc8
DAT_0802de54:
    .word Scene_StartFixedBattle
DAT_0802de58:
    .word 0x100
DAT_0802de5c:
    .word Scene_JackIn


_ts MapSetup_ACDC_Dex_Room_S2
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_ACDC_Dex_Room_F20_0802e08c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r0,#0xab
    bl         Flag_GetBase
    beq        LAB_0802de7e
    push       {r5}
    mov        r0,#0x4
    bl         Sound_ChangeSong
    pop        {r5}
    b          LAB_0802de96
LAB_0802de7e:
    mov        r0,#0xdf
    bl         Flag_GetBase
    beq        LAB_0802de92
    push       {r5}
    mov        r0,#0x3
    bl         Sound_ChangeSong
    pop        {r5}
    b          LAB_0802de96
LAB_0802de92:
    bl         Sound_AreaSongChange
LAB_0802de96:
    push       {r5}
    ldr        r0,PTR_BgTask_802E090
    bl         BgTask_AddNew
    pop        {r5}
    pop        {pc}

    .align 2, 0

PTR_MapSetup_ACDC_Dex_Room_F20_0802dea4:
    .word MapSetup_ACDC_Dex_Room_F20
    .word MapSetup_ACDC_Dex_Room_F21
    .word MapSetup_ACDC_Dex_Room_F21
    .word MapSetup_ACDC_Dex_Room_F20
    .word MapSetup_ACDC_Dex_Room_F20
    .word MapSetup_ACDC_Dex_Room_F25
    .word MapSetup_ACDC_Dex_Room_F25
    .word MapSetup_ACDC_Dex_Room_F25


_ts EventHandler_ACDC_Dex_Room_S2
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Dex_Room_F20_0802e094
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r1,#0x9
    bl         FUN_0802d78c
    mov        r0,#0x41
    mov        r1,#0x1e
    bl         CheckForJackIn
    pop        {pc}

    .align 2, 0

PTR_EventHandler_ACDC_Dex_Room_F20_0802dee0:
    .word EventHandler_ACDC_Dex_Room_F20
    .word EventHandler_ACDC_Dex_Room_F21
    .word EventHandler_ACDC_Dex_Room_F21
    .word EventHandler_ACDC_Dex_Room_F20
    .word EventHandler_ACDC_Dex_Room_F20
    .word EventHandler_ACDC_Dex_Room_F25
    .word EventHandler_ACDC_Dex_Room_F25
    .word EventHandler_ACDC_Dex_Room_F25


_ts MapSetup_ACDC_Dex_Room_F20
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r0,PTR_DAT_0802e098
    bl         Entity_AllocList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_ACDC_Dex_Room_F20
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Dex_Room_F20_0_0802e09c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_Dex_Room_F20_0_0802df30:
    .word EventHandler_ACDC_Dex_Room_F20_0


_ts EventHandler_ACDC_Dex_Room_F20_0
    push       {lr}
    pop        {pc}


_ts MapSetup_ACDC_Dex_Room_F21
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r0,PTR_DAT_0802e0a0
    bl         Entity_AllocList
    ldr        r7,PTR_PTR_DAT_0802e0a4
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x92
    bl         Flag_GetBase
    bne        LAB_0802df76
    mov        r0,#0x44
    bl         Flag_GetBase
    bne        LAB_0802dfac
    push       {r5}
    mov        r0,#0x2b
    bl         Flag_GetBase
    pop        {r5}
    beq        LAB_0802dfac
    b          LAB_0802dfa0
LAB_0802df76:
    mov        r0,#0x45
    bl         Flag_GetBase
    bne        LAB_0802dfac
    mov        r0,#0x45
    mov        r1,#0xb
    bl         Inventory_GetChipCount
    tst        r0,r0
    beq        LAB_0802dfac
    push       {r5}
    bl         Sound_StopAllMusic
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_FUN_08088240_0802e0a8
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_0802dfac
LAB_0802dfa0:
    push       {r5}
    ldr        r0,PTR_Scene_AfterFixedBattle_0802e0ac
    mov        r1,#0x3
    bl         Scene_Prepare
    pop        {r5}
LAB_0802dfac:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_ACDC_Dex_Room_F21
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Dex_Room_F21_0_0802e0b0
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_ACDC_Dex_Room_F21_0_0802dfc4:
    .word EventHandler_ACDC_Dex_Room_F21_0


_ts EventHandler_ACDC_Dex_Room_F21_0
    push       {lr}
    push       {r1}
    mov        r0,#0x45
    bl         Flag_GetBase
    pop        {r1}
    bne        LAB_0802e00a
    mov        r6,#0x4
    push       {r1}
    mov        r0,#0x92
    bl         Flag_GetBase
    pop        {r1}
    bne        LAB_0802dff2
    mov        r6,#0x2
    push       {r1}
    mov        r0,#0x44
    bl         Flag_GetBase
    pop        {r1}
    bne        LAB_0802e00a
LAB_0802dff2:
    push       {r1}
    mov        r0,#0x2b
    bl         Flag_GetBase
    pop        {r1}
    beq        LAB_0802e00a
    add        r1,r6,#0x0
    push       {r5}
    ldr        r0,DAT_0802e0b4
    bl         Scene_Prepare
    pop        {r5}
LAB_0802e00a:
    mov        r0,#0x6f
    bl         Flag_GetBase
    beq        LAB_0802e01a
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    mov        r1,#0x22
    strb       r1,[r0,#0x6]
LAB_0802e01a:
    pop        {pc}


_ts MapSetup_ACDC_Dex_Room_F25
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r0,PTR_DAT_0802e0b8
    bl         Entity_AllocList
    ldr        r7,PTR_PTR_DAT_0802e0bc
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    mov        r0,#0x2b
    bl         Flag_GetBase
    pop        {r5}
    beq        LAB_0802e054
    push       {r5}
    ldr        r0,PTR_Scene_AfterFixedBattle_0802e0c0
    mov        r1,#0x13
    bl         Scene_Prepare
    pop        {r5}
LAB_0802e054:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_ACDC_Dex_Room_F25
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Dex_Room_F25_0_0802e0c4
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_ACDC_Dex_Room_F25_0_0802e06c:
    .word EventHandler_ACDC_Dex_Room_F25_0


_ts EventHandler_ACDC_Dex_Room_F25_0
    push       {lr}
    push       {r1}
    mov        r0,#0x2b
    bl         Flag_GetBase
    pop        {r1}
    beq        LAB_0802e08a
    push       {r5}
    ldr        r0,DAT_0802e0c8
    mov        r1,#0x15
    bl         Scene_Prepare
    pop        {r5}
LAB_0802e08a:
    pop        {pc}
PTR_PTR_MapSetup_ACDC_Dex_Room_F20_0802e08c:
    .word PTR_MapSetup_ACDC_Dex_Room_F20_0802dea4
PTR_BgTask_802E090:
    .word BgTask_802A284
PTR_PTR_EventHandler_ACDC_Dex_Room_F20_0802e094:
    .word PTR_EventHandler_ACDC_Dex_Room_F20_0802dee0
PTR_DAT_0802e098:
    .word EntityAllocParams_8030FF8
PTR_PTR_EventHandler_ACDC_Dex_Room_F20_0_0802e09c:
    .word PTR_EventHandler_ACDC_Dex_Room_F20_0_0802df30
PTR_DAT_0802e0a0:
    .word EntityAllocParams_8030FF8
PTR_PTR_DAT_0802e0a4:
    .word NPCList_8030940
PTR_FUN_08088240_0802e0a8:
    .word FUN_08088240
PTR_Scene_AfterFixedBattle_0802e0ac:
    .word Scene_AfterFixedBattle
PTR_PTR_EventHandler_ACDC_Dex_Room_F21_0_0802e0b0:
    .word PTR_EventHandler_ACDC_Dex_Room_F21_0_0802dfc4
DAT_0802e0b4:
    .word Scene_StartFixedBattle
PTR_DAT_0802e0b8:
    .word EntityAllocParams_8030FF8
PTR_PTR_DAT_0802e0bc:
    .word NPCList_8030960
PTR_Scene_AfterFixedBattle_0802e0c0:
    .word Scene_AfterFixedBattle
PTR_PTR_EventHandler_ACDC_Dex_Room_F25_0_0802e0c4:
    .word PTR_EventHandler_ACDC_Dex_Room_F25_0_0802e06c
DAT_0802e0c8:
    .word Scene_StartFixedBattle


_ts MapSetup_ACDC_Dex_Room_S3
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_ACDC_Dex_Room_F30_0802e1b4
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Sound_AreaSongChange
    push       {r5}
    ldr        r0,PTR_BgTask_802E1B8
    bl         BgTask_AddNew
    pop        {r5}
    pop        {pc}

    .align 2, 0

PTR_MapSetup_ACDC_Dex_Room_F30_0802e0e8:
    .word MapSetup_ACDC_Dex_Room_F30
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default


_ts EventHandler_ACDC_Dex_Room_S3
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Dex_Room_F30_0802e1bc
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r1,#0x9
    bl         FUN_0802d78c
    mov        r0,#0x41
    mov        r1,#0x1e
    bl         CheckForJackIn
    pop        {pc}

    .align 2, 0

PTR_EventHandler_ACDC_Dex_Room_F30_0802e124:
    .word EventHandler_ACDC_Dex_Room_F30
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default


_ts MapSetup_ACDC_Dex_Room_F30
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r0,PTR_DAT_0802e1c0
    bl         Entity_AllocList
    ldr        r7,PTR_PTR_DAT_0802e1c4
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    mov        r0,#0x2b
    bl         Flag_GetBase
    pop        {r5}
    beq        LAB_0802e17c
    push       {r5}
    ldr        r0,DAT_0802e1c8
    mov        r1,#0x13
    bl         Scene_Prepare
    pop        {r5}
LAB_0802e17c:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_ACDC_Dex_Room_F30
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Dex_Room_F30_0_0802e1cc
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_ACDC_Dex_Room_F30_0_0802e194:
    .word EventHandler_ACDC_Dex_Room_F30_0


_ts EventHandler_ACDC_Dex_Room_F30_0
    push       {lr}
    push       {r1}
    mov        r0,#0x2b
    bl         Flag_GetBase
    pop        {r1}
    beq        LAB_0802e1b2
    push       {r5}
    ldr        r0,DAT_0802e1d0
    mov        r1,#0x15
    bl         Scene_Prepare
    pop        {r5}
LAB_0802e1b2:
    pop        {pc}
PTR_PTR_MapSetup_ACDC_Dex_Room_F30_0802e1b4:
    .word PTR_MapSetup_ACDC_Dex_Room_F30_0802e0e8
PTR_BgTask_802E1B8:
    .word BgTask_802A284
PTR_PTR_EventHandler_ACDC_Dex_Room_F30_0802e1bc:
    .word PTR_EventHandler_ACDC_Dex_Room_F30_0802e124
PTR_DAT_0802e1c0:
    .word EntityAllocParams_8030FF8
PTR_PTR_DAT_0802e1c4:
    .word NPCList_8030980
DAT_0802e1c8:
    .word Scene_AfterFixedBattle
PTR_PTR_EventHandler_ACDC_Dex_Room_F30_0_0802e1cc:
    .word PTR_EventHandler_ACDC_Dex_Room_F30_0_0802e194
DAT_0802e1d0:
    .word Scene_StartFixedBattle


_ts MapSetup_ACDC_Dex_Room_S4
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_ACDC_Dex_Room_F40_0802e2b4
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Sound_AreaSongChange
    push       {r5}
    ldr        r0,PTR_BgTask_802E2B8
    bl         BgTask_AddNew
    pop        {r5}
    pop        {pc}

    .align 2, 0

PTR_MapSetup_ACDC_Dex_Room_F40_0802e1f0:
    .word MapSetup_ACDC_Dex_Room_F40
    .word MapSetup_ACDC_Dex_Room_F40
    .word MapSetup_ACDC_Dex_Room_F40
    .word MapSetup_ACDC_Dex_Room_F40
    .word MapSetup_ACDC_Dex_Room_F40
    .word MapSetup_ACDC_Dex_Room_F40
    .word MapSetup_ACDC_Dex_Room_F40
    .word MapSetup_ACDC_Dex_Room_F40


_ts EventHandler_ACDC_Dex_Room_S4
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Dex_Room_F40_0802e2bc
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r1,#0x9
    bl         FUN_0802d78c
    mov        r0,#0x41
    mov        r1,#0x1e
    bl         CheckForJackIn
    pop        {pc}

    .align 2, 0

PTR_EventHandler_ACDC_Dex_Room_F40_0802e22c:
    .word EventHandler_ACDC_Dex_Room_F40
    .word EventHandler_ACDC_Dex_Room_F40
    .word EventHandler_ACDC_Dex_Room_F40
    .word EventHandler_ACDC_Dex_Room_F40
    .word EventHandler_ACDC_Dex_Room_F40
    .word EventHandler_ACDC_Dex_Room_F40
    .word EventHandler_ACDC_Dex_Room_F40
    .word EventHandler_ACDC_Dex_Room_F40


_ts MapSetup_ACDC_Dex_Room_F40
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r0,PTR_DAT_0802e2c0
    bl         Entity_AllocList
    ldr        r7,PTR_PTR_DAT_0802e2c4
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x2b
    bl         Flag_GetBase
    beq        LAB_0802e280
    push       {r5}
    ldr        r0,DAT_0802e2c8
    mov        r1,#0x22
    bl         Scene_Prepare
    pop        {r5}
LAB_0802e280:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_ACDC_Dex_Room_F40
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Dex_Room_F40_0_0802e2cc
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_ACDC_Dex_Room_F40_0_0802e298:
    .word EventHandler_ACDC_Dex_Room_F40_0


_ts EventHandler_ACDC_Dex_Room_F40_0
    push       {lr}
    mov        r0,#0x2b
    bl         Flag_GetBase
    beq        LAB_0802e2b2
    push       {r5}
    ldr        r0,DAT_0802e2d0
    mov        r1,#0x16
    bl         Scene_Prepare
    pop        {r5}
LAB_0802e2b2:
    pop        {pc}
PTR_PTR_MapSetup_ACDC_Dex_Room_F40_0802e2b4:
    .word PTR_MapSetup_ACDC_Dex_Room_F40_0802e1f0
PTR_BgTask_802E2B8:
    .word BgTask_802A284
PTR_PTR_EventHandler_ACDC_Dex_Room_F40_0802e2bc:
    .word PTR_EventHandler_ACDC_Dex_Room_F40_0802e22c
PTR_DAT_0802e2c0:
    .word EntityAllocParams_8030FF8
PTR_PTR_DAT_0802e2c4:
    .word NPCList_8030940
DAT_0802e2c8:
    .word Scene_AfterFixedBattle
PTR_PTR_EventHandler_ACDC_Dex_Room_F40_0_0802e2cc:
    .word PTR_EventHandler_ACDC_Dex_Room_F40_0_0802e298
DAT_0802e2d0:
    .word Scene_StartFixedBattle


_ts MapSetup_ACDC_Dex_Room_S5
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_ACDC_Dex_Room_F50_0802e3ec
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Sound_AreaSongChange
    push       {r5}
    ldr        r0,PTR_BgTask_802E3F0
    bl         BgTask_AddNew
    pop        {r5}
    pop        {pc}

    .align 2, 0

PTR_MapSetup_ACDC_Dex_Room_F50_0802e2f0:
    .word MapSetup_ACDC_Dex_Room_F50
    .word MapSetup_ACDC_Dex_Room_F50
    .word MapSetup_ACDC_Dex_Room_F50
    .word MapSetup_ACDC_Dex_Room_F50
    .word MapSetup_ACDC_Dex_Room_F54
    .word MapSetup_ACDC_Dex_Room_F50
    .word MapSetup_ACDC_Dex_Room_F50
    .word MapSetup_ACDC_Dex_Room_F50


_ts EventHandler_ACDC_Dex_Room_S5
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Dex_Room_F50_0802e3f4
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r1,#0x9
    bl         FUN_0802d78c
    mov        r0,#0x41
    mov        r1,#0x1e
    bl         CheckForJackIn
    pop        {pc}

    .align 2, 0

PTR_EventHandler_ACDC_Dex_Room_F50_0802e32c:
    .word EventHandler_ACDC_Dex_Room_F50
    .word EventHandler_ACDC_Dex_Room_F50
    .word EventHandler_ACDC_Dex_Room_F50
    .word EventHandler_ACDC_Dex_Room_F50
    .word EventHandler_ACDC_Dex_Room_F54
    .word EventHandler_ACDC_Dex_Room_F50
    .word EventHandler_ACDC_Dex_Room_F50
    .word EventHandler_ACDC_Dex_Room_F50


_ts MapSetup_ACDC_Dex_Room_F50
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r0,PTR_DAT_0802e3f8
    bl         Entity_AllocList
    ldr        r7,PTR_PTR_DAT_0802e3fc
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x2b
    bl         Flag_GetBase
    beq        LAB_0802e380
    push       {r5}
    ldr        r0,DAT_0802e400
    mov        r1,#0x13
    bl         Scene_Prepare
    pop        {r5}
LAB_0802e380:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_ACDC_Dex_Room_F50
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Dex_Room_F50_0_0802e404
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_ACDC_Dex_Room_F50_0_0802e398:
    .word EventHandler_ACDC_Dex_Room_F50_0


_ts EventHandler_ACDC_Dex_Room_F50_0
    push       {lr}
    mov        r0,#0x2b
    bl         Flag_GetBase
    beq        LAB_0802e3b2
    push       {r5}
    ldr        r0,DAT_0802e408
    mov        r1,#0x27
    bl         Scene_Prepare
    pop        {r5}
LAB_0802e3b2:
    pop        {pc}


_ts MapSetup_ACDC_Dex_Room_F54
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r0,PTR_DAT_0802e40c
    bl         Entity_AllocList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_ACDC_Dex_Room_F54
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Dex_Room_F54_0_0802e410
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_Dex_Room_F54_0_0802e3e4:
    .word EventHandler_ACDC_Dex_Room_F54_0


_ts EventHandler_ACDC_Dex_Room_F54_0
    push       {lr}
    pop        {pc}
PTR_PTR_MapSetup_ACDC_Dex_Room_F50_0802e3ec:
    .word PTR_MapSetup_ACDC_Dex_Room_F50_0802e2f0
PTR_BgTask_802E3F0:
    .word BgTask_802A284
PTR_PTR_EventHandler_ACDC_Dex_Room_F50_0802e3f4:
    .word PTR_EventHandler_ACDC_Dex_Room_F50_0802e32c
PTR_DAT_0802e3f8:
    .word EntityAllocParams_8030FF8
PTR_PTR_DAT_0802e3fc:
    .word NPCList_8030920
DAT_0802e400:
    .word Scene_AfterFixedBattle
PTR_PTR_EventHandler_ACDC_Dex_Room_F50_0_0802e404:
    .word PTR_EventHandler_ACDC_Dex_Room_F50_0_0802e398
DAT_0802e408:
    .word Scene_StartFixedBattle
PTR_DAT_0802e40c:
    .word EntityAllocParams_8030FF8
PTR_PTR_EventHandler_ACDC_Dex_Room_F54_0_0802e410:
    .word PTR_EventHandler_ACDC_Dex_Room_F54_0_0802e3e4
