#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_Waterworks_Comp_6_S2
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,PTR_PTR_MapSetup_Default_08046a3c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    Flag_GetBase 0xCC
    bne        LAB_0804684e
    ldr        r0,PTR_BgTask_80441F8_08046a40
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8044030_08046a44
    bl         BgTask_AddNew
    b          LAB_08046866
LAB_0804684e:
    ldr        r0,PTR_BgTask_80442E8_08046a48
    bl         BgTask_AddNew
    ldr        r0,DAT_08046a4c
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8044048_08046a50
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8044060_08046a54
    bl         BgTask_AddNew
LAB_08046866:
    ldr        r0,PTR_EntityAllocParams_8047338_08046a58
    bl         Entity_AllocList
    pop        {r5}
    Flag_GetBase 0xEE
    bne        LAB_08046880
    push       {r5}
    Flag_SetIgnore F_IGNORE_WALL_0A
    pop        {r5}
LAB_08046880:
    Flag_GetBase 0xF4
    bne        LAB_0804689a
    push       {r5}
    ldr        r0,PTR_BgTask_80443A8_08046a5c
    bl         BgTask_AddNew
    Flag_SetIgnore F_IGNORE_WALL_00
    pop        {r5}
    b          LAB_080468aa
LAB_0804689a:
    push       {r5}
    ldr        r0,PTR_BgTask_80443C0_08046a60
    bl         BgTask_AddNew
    Flag_ClearIgnore F_IGNORE_WALL_00
    pop        {r5}
LAB_080468aa:
    pop        {pc}

PTR_MapSetup_Default_080468ac:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Waterworks_Comp_6_F25
    .word MapSetup_Waterworks_Comp_6_F25
    .word MapSetup_Waterworks_Comp_6_F27


_ts EventHandler_Waterworks_Comp_6_S2
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Default_08046a64
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Default_080468d8:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Waterworks_Comp_6_F25
    .word EventHandler_Waterworks_Comp_6_F25
    .word EventHandler_Waterworks_Comp_6_F27


_ts MapSetup_Waterworks_Comp_6_F25
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_8046E78_08046a68
    bl         Map_LoadNPCList
    pop        {r5}
    LoadMain world, r0, r0
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    bne        LAB_0804692a
    ldrb       r1,[r0,#World_currentArea]
    ldrb       r2,[r0,#World_lastArea]
    cmp        r1,r2
    beq        LAB_08046936
LAB_0804692a:
    push       {r5}
    ldr        r0,DAT_08046a6c
    ldr        r1,PTR_DAT_08046a70
    bl         Scene_Prepare
    pop        {r5}
LAB_08046936:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Waterworks_Comp_6_F25
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Waterworks_Comp_6_F25_0_08046a74
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}

    .align 2, 0

PTR_EventHandler_Waterworks_Comp_6_F25_0_08046954:
    .word EventHandler_Waterworks_Comp_6_F25_0


_ts EventHandler_Waterworks_Comp_6_F25_0
    push       {lr}
    bl         FUN_08045a8c
    beq        LAB_08046966
    bl         FUN_08045ae0
    beq        LAB_08046966
LAB_08046966:
    pop        {pc}


_ts MapSetup_Waterworks_Comp_6_F27
    push       {lr}
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
    bne        LAB_08046990
    ldrb       r1,[r0,#World_currentArea]
    ldrb       r2,[r0,#World_lastArea]
    cmp        r1,r2
    beq        LAB_0804699c
LAB_08046990:
    push       {r5}
    ldr        r0,PTR_Scene_MegaManJackIn_08046a78
    ldr        r1,PTR_DAT_08046a70
    bl         Scene_Prepare
    pop        {r5}
LAB_0804699c:
    push       {r5}
    Flag_GetBase 0xC2
    pop        {r5}
    beq        LAB_080469c4
    push       {r5}
    ldr        r7,PTR_NPCList_8046F3C_08046a7c
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_Scene_Story_32_08046a80
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x4
    str        r0,[r5,#0x0]
    pop        {pc}
LAB_080469c4:
    push       {r5}
    ldr        r7,PTR_NPCList_8046EA4_08046a84
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Waterworks_Comp_6_F27
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Waterworks_Comp_6_F27_0_08046a88
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}

    .align 2, 0

PTR_EventHandler_Waterworks_Comp_6_F27_0_080469ec:
    .word EventHandler_Waterworks_Comp_6_F27_0
    .word EventHandler_Waterworks_Comp_6_F27_1


_ts EventHandler_Waterworks_Comp_6_F27_0
    push       {lr}
    bl         FUN_08045a8c
    beq        LAB_08046a28
    bl         FUN_08045ae0
    beq        LAB_08046a28
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#World_playerLocation]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x18
    bne        LAB_08046a28
    Flag_GetBase 0xC2
    bne        LAB_08046a28
    push       {r5}
    ldr        r0,PTR_Scene_Story_31_08046a8c
    bl         Scene_Prepare
    pop        {r5}
LAB_08046a28:
    pop        {pc}


_nt EventHandler_Waterworks_Comp_6_F27_1
    push       {lr}
    bl         FUN_08045a8c
    beq        LAB_08046a38
    bl         FUN_08045ae0
    beq        LAB_08046a38
LAB_08046a38:
    pop        {pc}

    .align 2, 0

PTR_PTR_MapSetup_Default_08046a3c:
    .word PTR_MapSetup_Default_080468ac

PTR_BgTask_80441F8_08046a40:
    .word BgTask_80441F8

PTR_BgTask_8044030_08046a44:
    .word BgTask_8044030

PTR_BgTask_80442E8_08046a48:
    .word BgTask_80442E8

DAT_08046a4c:
    .word BgTask_8044318

PTR_BgTask_8044048_08046a50:
    .word BgTask_8044048

PTR_BgTask_8044060_08046a54:
    .word BgTask_8044060

PTR_EntityAllocParams_8047338_08046a58:
    .word EntityAllocParams_8047338

PTR_BgTask_80443A8_08046a5c:
    .word BgTask_80443A8

PTR_BgTask_80443C0_08046a60:
    .word BgTask_80443C0

PTR_PTR_EventHandler_Default_08046a64:
    .word PTR_EventHandler_Default_080468d8

PTR_NPCList_8046E78_08046a68:
    .word NPCList_8046E78

DAT_08046a6c:
    .word Scene_MegaManJackIn

PTR_DAT_08046a70:
    .word 0x2000

PTR_PTR_EventHandler_Waterworks_Comp_6_F25_0_08046a74:
    .word PTR_EventHandler_Waterworks_Comp_6_F25_0_08046954

PTR_Scene_MegaManJackIn_08046a78:
    .word Scene_MegaManJackIn

PTR_NPCList_8046F3C_08046a7c:
    .word NPCList_8046F3C

PTR_Scene_Story_32_08046a80:
    .word Scene_Story_32

PTR_NPCList_8046EA4_08046a84:
    .word NPCList_8046EA4

PTR_PTR_EventHandler_Waterworks_Comp_6_F27_0_08046a88:
    .word PTR_EventHandler_Waterworks_Comp_6_F27_0_080469ec

PTR_Scene_Story_31_08046a8c:
    .word Scene_Story_31


_ts MapSetup_Waterworks_Comp_6_S3
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,PTR_PTR_MapSetup_Waterworks_Comp_6_F30_08046b94
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_80442E8_08046b98
    bl         BgTask_AddNew
    ldr        r0,DAT_08046b9c
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8044048_08046ba0
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8044060_08046ba4
    bl         BgTask_AddNew
    ldr        r0,PTR_EntityAllocParams_8047338_08046ba8
    bl         Entity_AllocList
    Flag_SetIgnore F_IGNORE_WALL_0A
    ldr        r0,PTR_BgTask_80443A8_08046bac
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_80443C0_08046bb0
    bl         BgTask_AddNew
    pop        {r5}
    pop        {pc}

PTR_MapSetup_Waterworks_Comp_6_F30_08046ad8:
    .word MapSetup_Waterworks_Comp_6_F30
    .word MapSetup_Waterworks_Comp_6_F30
    .word MapSetup_Waterworks_Comp_6_F30
    .word MapSetup_Waterworks_Comp_6_F30
    .word MapSetup_Waterworks_Comp_6_F30
    .word MapSetup_Waterworks_Comp_6_F30
    .word MapSetup_Waterworks_Comp_6_F30
    .word MapSetup_Waterworks_Comp_6_F30


_ts EventHandler_Waterworks_Comp_6_S3
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Waterworks_Comp_6_F30_08046bb4
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Waterworks_Comp_6_F30_08046b04:
    .word EventHandler_Waterworks_Comp_6_F30
    .word EventHandler_Waterworks_Comp_6_F30
    .word EventHandler_Waterworks_Comp_6_F30
    .word EventHandler_Waterworks_Comp_6_F30
    .word EventHandler_Waterworks_Comp_6_F30
    .word EventHandler_Waterworks_Comp_6_F30
    .word EventHandler_Waterworks_Comp_6_F30
    .word EventHandler_Waterworks_Comp_6_F30


_ts MapSetup_Waterworks_Comp_6_F30
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_8046E78_08046bb8
    bl         Map_LoadNPCList
    pop        {r5}
    LoadMain world, r0, r0
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    bne        LAB_08046b56
    ldrb       r1,[r0,#World_currentArea]
    ldrb       r2,[r0,#World_lastArea]
    cmp        r1,r2
    beq        LAB_08046b62
LAB_08046b56:
    push       {r5}
    ldr        r0,DAT_08046bbc
    ldr        r1,PTR_DAT_08046bc0
    bl         Scene_Prepare
    pop        {r5}
LAB_08046b62:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Waterworks_Comp_6_F30
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Waterworks_Comp_6_F30_0_08046bc4
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}

    .align 2, 0

PTR_EventHandler_Waterworks_Comp_6_F30_0_08046b80:
    .word EventHandler_Waterworks_Comp_6_F30_0


_ts EventHandler_Waterworks_Comp_6_F30_0
    push       {lr}
    bl         FUN_08045a8c
    beq        LAB_08046b92
    bl         FUN_08045b3c
    beq        LAB_08046b92
LAB_08046b92:
    pop        {pc}

PTR_PTR_MapSetup_Waterworks_Comp_6_F30_08046b94:
    .word PTR_MapSetup_Waterworks_Comp_6_F30_08046ad8

PTR_BgTask_80442E8_08046b98:
    .word BgTask_80442E8

DAT_08046b9c:
    .word BgTask_8044318

PTR_BgTask_8044048_08046ba0:
    .word BgTask_8044048

PTR_BgTask_8044060_08046ba4:
    .word BgTask_8044060

PTR_EntityAllocParams_8047338_08046ba8:
    .word EntityAllocParams_8047338

PTR_BgTask_80443A8_08046bac:
    .word BgTask_80443A8

PTR_BgTask_80443C0_08046bb0:
    .word BgTask_80443C0

PTR_PTR_EventHandler_Waterworks_Comp_6_F30_08046bb4:
    .word PTR_EventHandler_Waterworks_Comp_6_F30_08046b04

PTR_NPCList_8046E78_08046bb8:
    .word NPCList_8046E78

DAT_08046bbc:
    .word Scene_MegaManJackIn

PTR_DAT_08046bc0:
    .word 0x2000

PTR_PTR_EventHandler_Waterworks_Comp_6_F30_0_08046bc4:
    .word PTR_EventHandler_Waterworks_Comp_6_F30_0_08046b80
