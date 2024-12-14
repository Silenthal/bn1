#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_DenTown_Block_3_S3
    push       {lr}
    push       {r1,r5}
    mov        r0,#0x8
    bl         Flag_Set380
    pop        {r1,r5}
    ldr        r0,PTR_PTR_MapSetup_DenTown_Block_3_F30_08037de4
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_803AEB4_08037de8
    bl         Entity_AllocList
    pop        {r5}
    mov        r0,#0xbd
    bl         Flag_GetBase
    bne        LAB_08037b5a
    mov        r0,#0xa6
    bl         Flag_GetBase
    beq        LAB_08037b3a
    mov        r0,#0x4
    bl         Sound_ChangeSong
    b          LAB_08037b5e
LAB_08037b3a:
    mov        r0,#0x9b
    bl         Flag_GetBase
    beq        LAB_08037b4a
    mov        r0,#0x3
    bl         Sound_ChangeSong
    b          LAB_08037b5e
LAB_08037b4a:
    mov        r0,#0x98
    bl         Flag_GetBase
    beq        LAB_08037b5a
    mov        r0,#0x4
    bl         Sound_ChangeSong
    b          LAB_08037b5e
LAB_08037b5a:
    bl         Sound_AreaSongChange
LAB_08037b5e:
    pop        {pc}

PTR_MapSetup_DenTown_Block_3_F30_08037b60:
    .word MapSetup_DenTown_Block_3_F30
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_DenTown_Block_3_F35
    .word MapSetup_DenTown_Block_3_F36
    .word MapSetup_Default


_ts EventHandler_DenTown_Block_3_S3
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_DenTown_Block_3_F30_08037dec
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         FUN_08037d9e
    pop        {pc}

PTR_EventHandler_DenTown_Block_3_F30_08037b90:
    .word EventHandler_DenTown_Block_3_F30
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_DenTown_Block_3_F35
    .word EventHandler_DenTown_Block_3_F36
    .word EventHandler_Default


_ts MapSetup_DenTown_Block_3_F30
    push       {lr}
    push       {r5}
    bl         Traffic_Init
    pop        {r5}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_80393B4_08037df0
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_DenTown_Block_3_F30
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_DenTown_Block_3_F30_0_08037df4
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    bl         Traffic_Main
    pop        {pc}

PTR_EventHandler_DenTown_Block_3_F30_0_08037bf0:
    .word EventHandler_DenTown_Block_3_F30_0


_ts EventHandler_DenTown_Block_3_F30_0
    push       {lr}
    bl         FUN_08037d54
    tst        r0,r0
    beq        LAB_08037c0c
    push       {r5}
    ldr        r0,DAT_08037df8
    mov        r1,#0x5
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_08037c0c:
    mov        r0,#0x95
    bl         Flag_GetBase
    beq        LAB_08037c2a
    mov        r0,#0xb
    bl         Flag_GetEmailRecieved
    bne        LAB_08037c2a
    push       {r5}
    ldr        r0,DAT_08037dfc
    ldr        r1,DAT_08037e00
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_08037c2a:
    pop        {pc}


_ts MapSetup_DenTown_Block_3_F35
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_803942C_08037e04
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x2
    bl         Flag_Set410
    mov        r0,#0x0
    strb       r0,[r5,#0x8]
    strb       r0,[r5,#0x9]
    mov        r0,#0x2
    strb       r0,[r5,#0xa]
    strb       r0,[r5,#0xb]
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_803AF1C_08037e08
    bl         Entity_AllocList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_DenTown_Block_3_F35
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_DenTown_Block_3_F35_0_08037e0c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_DenTown_Block_3_F35_0_08037c7c:
    .word EventHandler_DenTown_Block_3_F35_0


_ts EventHandler_DenTown_Block_3_F35_0
    push       {lr}
    bl         FUN_08037d54
    tst        r0,r0
    beq        LAB_08037c96
    push       {r5}
    ldr        r0,DAT_08037e10
    mov        r1,#0x11
    bl         Scene_Prepare
    pop        {r5}
LAB_08037c96:
    pop        {pc}


_ts MapSetup_DenTown_Block_3_F36
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_803942C_08037e14
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x2
    bl         Flag_Set410
    mov        r0,#0xb0
    bl         Flag_GetBase
    bne        LAB_08037ce6
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    mov        r1,#0x0
    strb       r1,[r0,#0x7]
    mov        r0,#0x0
    strb       r0,[r5,#0x8]
    strb       r0,[r5,#0x9]
    mov        r0,#0x2
    strb       r0,[r5,#0xa]
    strb       r0,[r5,#0xb]
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_803AF1C_08037e18
    bl         Entity_AllocList
    pop        {r5}
    mov        r0,#0x0
    b          LAB_08037d0a
LAB_08037ce6:
    mov        r0,#0x1
    bl         Flag_Set380
    mov        r0,#0x8
    bl         Flag_Clear380
    mov        r0,#0x2
    strb       r0,[r5,#0x8]
    strb       r0,[r5,#0xa]
    mov        r0,#0x0
    strb       r0,[r5,#0x9]
    strb       r0,[r5,#0xb]
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_803AF1C_08037e1c
    bl         Entity_AllocList
    pop        {r5}
    mov        r0,#0x4
LAB_08037d0a:
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_DenTown_Block_3_F36
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_DenTown_Block_3_F36_0_08037e20
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_DenTown_Block_3_F36_0_08037d20:
    .word EventHandler_DenTown_Block_3_F36_0
    .word EventHandler_DenTown_Block_3_F36_1


_ts EventHandler_DenTown_Block_3_F36_0
    push       {lr}
    push       {r5}
    ldr        r0,PTR_Scene_Story_42_08037e24
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x4
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_DenTown_Block_3_F36_1
    push       {lr}
    bl         FUN_08037d54
    tst        r0,r0
    beq        LAB_08037d52
    push       {r5}
    ldr        r0,PTR_Scene_JackIn_08037e28
    mov        r1,#0x11
    bl         Scene_Prepare
    pop        {r5}
LAB_08037d52:
    pop        {pc}


_ts FUN_08037d54
    push       {lr}
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    mov        r1,#0x8
    strh       r1,[r0,#0x2e]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldr        r7,[r7,#0x28]
    mov        r1,#0x0
    strh       r1,[r7,#0x2e]
    pop        {r5}
    cmp        r0,#0x40
    bne        LAB_08037d9a
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08037d9a
    mov        r0,r10
    ldr        r0,[r0,#0x4]
    ldrh       r0,[r0,#0x2]
    ldr        r1,DAT_08037e2c
    and        r1,r0
    beq        LAB_08037d9a
    bl         dummy_187a0
    bne        LAB_08037d9a
    mov        r0,#0x1
    pop        {pc}
LAB_08037d9a:
    mov        r0,#0x0
    pop        {pc}


_nt FUN_08037d9e
    push       {lr}
    bl         Scene_IsSceneActive
    tst        r0,r0
    beq        LAB_08037daa
    pop        {pc}
LAB_08037daa:
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r1,[r0,#0xe]
    cmp        r1,#0x20
    bne        LAB_08037dc0
    push       {r5}
    ldr        r0,PTR_Scene_Dialogue_08037e30
    mov        r1,#0x3
    bl         Scene_Prepare
    pop        {r5}
LAB_08037dc0:
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x3
    bne        LAB_08037de0
    push       {r5}
    ldr        r0,PTR_Scene_LockedPath_08037e34
    ldr        r1,DAT_08037e38
    bl         Scene_Prepare
    pop        {r5}
LAB_08037de0:
    pop        {pc}

    .align 2, 0

PTR_PTR_MapSetup_DenTown_Block_3_F30_08037de4:
    .word PTR_MapSetup_DenTown_Block_3_F30_08037b60

PTR_EntityAllocParams_803AEB4_08037de8:
    .word EntityAllocParams_803AEB4

PTR_PTR_EventHandler_DenTown_Block_3_F30_08037dec:
    .word PTR_EventHandler_DenTown_Block_3_F30_08037b90

PTR_NPCList_80393B4_08037df0:
    .word NPCList_80393B4

PTR_PTR_EventHandler_DenTown_Block_3_F30_0_08037df4:
    .word PTR_EventHandler_DenTown_Block_3_F30_0_08037bf0

DAT_08037df8:
    .word Scene_Dialogue

DAT_08037dfc:
    .word Scene_CheckMail

DAT_08037e00:
    .word 0x104

PTR_NPCList_803942C_08037e04:
    .word NPCList_803942C

PTR_EntityAllocParams_803AF1C_08037e08:
    .word EntityAllocParams_803AF1C

PTR_PTR_EventHandler_DenTown_Block_3_F35_0_08037e0c:
    .word PTR_EventHandler_DenTown_Block_3_F35_0_08037c7c

DAT_08037e10:
    .word Scene_JackIn

PTR_NPCList_803942C_08037e14:
    .word NPCList_803942C

PTR_EntityAllocParams_803AF1C_08037e18:
    .word EntityAllocParams_803AF1C

PTR_EntityAllocParams_803AF1C_08037e1c:
    .word EntityAllocParams_803AF1C

PTR_PTR_EventHandler_DenTown_Block_3_F36_0_08037e20:
    .word PTR_EventHandler_DenTown_Block_3_F36_0_08037d20

PTR_Scene_Story_42_08037e24:
    .word Scene_Story_42

PTR_Scene_JackIn_08037e28:
    .word Scene_JackIn

DAT_08037e2c:
    .word 0x100

PTR_Scene_Dialogue_08037e30:
    .word Scene_Dialogue

PTR_Scene_LockedPath_08037e34:
    .word Scene_LockedPath

DAT_08037e38:
    .word 0xB03


_ts MapSetup_DenTown_Block_3_S4
    push       {lr}
    push       {r1,r5}
    mov        r0,#0x8
    bl         Flag_Set380
    pop        {r1,r5}
    ldr        r0,PTR_PTR_MapSetup_DenTown_Block_3_F40_08037f6c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_803AEB4_08037f70
    bl         Entity_AllocList
    pop        {r5}
    bl         Traffic_Init
    bl         Sound_AreaSongChange
    pop        {pc}

PTR_MapSetup_DenTown_Block_3_F40_08037e64:
    .word MapSetup_DenTown_Block_3_F40
    .word MapSetup_DenTown_Block_3_F40
    .word MapSetup_DenTown_Block_3_F40
    .word MapSetup_DenTown_Block_3_F40
    .word MapSetup_DenTown_Block_3_F40
    .word MapSetup_DenTown_Block_3_F40
    .word MapSetup_DenTown_Block_3_F40
    .word MapSetup_DenTown_Block_3_F40


_ts EventHandler_DenTown_Block_3_S4
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_DenTown_Block_3_F40_08037f74
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         FUN_08037f48
    bl         Traffic_Main
    pop        {pc}

PTR_EventHandler_DenTown_Block_3_F40_08037e98:
    .word EventHandler_DenTown_Block_3_F40
    .word EventHandler_DenTown_Block_3_F40
    .word EventHandler_DenTown_Block_3_F40
    .word EventHandler_DenTown_Block_3_F40
    .word EventHandler_DenTown_Block_3_F40
    .word EventHandler_DenTown_Block_3_F40
    .word EventHandler_DenTown_Block_3_F40
    .word EventHandler_DenTown_Block_3_F40


_ts MapSetup_DenTown_Block_3_F40
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_80393C4_08037f78
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_DenTown_Block_3_F40
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_DenTown_Block_3_F40_0_08037f7c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_DenTown_Block_3_F40_0_08037eec:
    .word EventHandler_DenTown_Block_3_F40_0


_ts EventHandler_DenTown_Block_3_F40_0
    push       {lr}
    bl         FUN_08037ef8
    pop        {pc}


_ts FUN_08037ef8
    push       {lr}
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    mov        r1,#0x8
    strh       r1,[r0,#0x2e]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldr        r7,[r7,#0x28]
    mov        r1,#0x0
    strh       r1,[r7,#0x2e]
    pop        {r5}
    cmp        r0,#0x40
    bne        LAB_08037f46
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08037f46
    mov        r0,r10
    ldr        r0,[r0,#0x4]
    ldrh       r0,[r0,#0x2]
    ldr        r1,DAT_08037f80
    and        r1,r0
    beq        LAB_08037f46
    bl         dummy_187a0
    bne        LAB_08037f46
    push       {r5}
    ldr        r0,PTR_Scene_JackIn_08037f84
    mov        r1,#0x11
    bl         Scene_Prepare
    pop        {r5}
LAB_08037f46:
    pop        {pc}


_ts FUN_08037f48
    push       {lr}
    bl         Scene_IsSceneActive
    tst        r0,r0
    beq        LAB_08037f54
    pop        {pc}
LAB_08037f54:
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r1,[r0,#0xe]
    cmp        r1,#0x20
    bne        LAB_08037f6a
    push       {r5}
    ldr        r0,PTR_Scene_Dialogue_08037f88
    mov        r1,#0x3
    bl         Scene_Prepare
    pop        {r5}
LAB_08037f6a:
    pop        {pc}

PTR_PTR_MapSetup_DenTown_Block_3_F40_08037f6c:
    .word PTR_MapSetup_DenTown_Block_3_F40_08037e64

PTR_EntityAllocParams_803AEB4_08037f70:
    .word EntityAllocParams_803AEB4

PTR_PTR_EventHandler_DenTown_Block_3_F40_08037f74:
    .word PTR_EventHandler_DenTown_Block_3_F40_08037e98

PTR_NPCList_80393C4_08037f78:
    .word NPCList_80393C4

PTR_PTR_EventHandler_DenTown_Block_3_F40_0_08037f7c:
    .word PTR_EventHandler_DenTown_Block_3_F40_0_08037eec

DAT_08037f80:
    .word 0x100

PTR_Scene_JackIn_08037f84:
    .word Scene_JackIn

PTR_Scene_Dialogue_08037f88:
    .word Scene_Dialogue


_ts MapSetup_DenTown_Block_3_S5
    push       {lr}
    push       {r1,r5}
    mov        r0,#0x8
    bl         Flag_Set380
    pop        {r1,r5}
    ldr        r0,PTR_PTR_MapSetup_DenTown_Block_3_F50_0803818c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_803AEB4_08038190
    bl         Entity_AllocList
    pop        {r5}
    bl         Traffic_Init
    bl         Sound_AreaSongChange
    pop        {pc}

PTR_MapSetup_DenTown_Block_3_F50_08037fb4:
    .word MapSetup_DenTown_Block_3_F50
    .word MapSetup_DenTown_Block_3_F50
    .word MapSetup_DenTown_Block_3_F52
    .word MapSetup_DenTown_Block_3_F52
    .word MapSetup_DenTown_Block_3_F52
    .word MapSetup_DenTown_Block_3_F52
    .word MapSetup_DenTown_Block_3_F52
    .word MapSetup_DenTown_Block_3_F52


_ts EventHandler_DenTown_Block_3_S5
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_DenTown_Block_3_F50_08038194
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         FUN_08038168
    bl         FUN_08038118
    bl         Traffic_Main
    pop        {pc}

PTR_EventHandler_DenTown_Block_3_F50_08037fec:
    .word EventHandler_DenTown_Block_3_F50
    .word EventHandler_DenTown_Block_3_F50
    .word EventHandler_DenTown_Block_3_F52
    .word EventHandler_DenTown_Block_3_F52
    .word EventHandler_DenTown_Block_3_F52
    .word EventHandler_DenTown_Block_3_F52
    .word EventHandler_DenTown_Block_3_F52
    .word EventHandler_DenTown_Block_3_F52


_ts MapSetup_DenTown_Block_3_F50
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_NPCList_8039438_08038198
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x64
    bl         Flag_GetBase
    bne        LAB_08038046
    push       {r5}
    mov        r0,#0x63
    bl         Flag_GetBase
    pop        {r5}
    beq        LAB_08038046
    push       {r5}
    ldr        r0,DAT_0803819c
    mov        r1,#0x16
    bl         Scene_Prepare
    pop        {r5}
LAB_08038046:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_DenTown_Block_3_F50
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_DenTown_Block_3_F50_0_080381a0
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_DenTown_Block_3_F50_0_0803805c:
    .word EventHandler_DenTown_Block_3_F50_0


_ts EventHandler_DenTown_Block_3_F50_0
    push       {lr}
    mov        r0,#0x64
    bl         Flag_GetBase
    bne        LAB_0803807e
    mov        r0,#0x63
    bl         Flag_GetBase
    beq        LAB_0803807e
    push       {r5}
    ldr        r0,DAT_080381a4
    mov        r1,#0x18
    bl         Scene_Prepare
    pop        {r5}
LAB_0803807e:
    pop        {pc}


_ts MapSetup_DenTown_Block_3_F52
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrb       r0,[r7,#0x6]
    cmp        r0,#0x53
    bge        LAB_080380aa
    push       {r5}
    ldr        r7,PTR_NPCList_8039438_080381a8
    bl         Map_LoadNPCList
    pop        {r5}
    b          LAB_080380b4
LAB_080380aa:
    push       {r5}
    ldr        r7,PTR_NPCList_8039450_080381ac
    bl         Map_LoadNPCList
    pop        {r5}
LAB_080380b4:
    mov        r0,#0x63
    bl         Flag_GetBase
    beq        LAB_080380da
    mov        r6,#0x16
    mov        r0,#0x64
    bl         Flag_GetBase
    beq        LAB_080380c8
    mov        r6,#0x1a
LAB_080380c8:
    mov        r0,#0x63
    bl         Flag_ClearBase
    add        r1,r6,#0x0
    push       {r5}
    ldr        r0,PTR_Scene_AfterFixedBattle_080381b0
    bl         Scene_Prepare
    pop        {r5}
LAB_080380da:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_DenTown_Block_3_F52
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_DenTown_Block_3_F52_0_080381b4
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_DenTown_Block_3_F52_0_080380f0:
    .word EventHandler_DenTown_Block_3_F52_0


_ts EventHandler_DenTown_Block_3_F52_0
    push       {lr}
    mov        r6,#0x18
    mov        r0,#0x64
    bl         Flag_GetBase
    beq        LAB_08038102
    mov        r6,#0x1f
LAB_08038102:
    mov        r0,#0x63
    bl         Flag_GetBase
    beq        LAB_08038116
    add        r1,r6,#0x0
    push       {r5}
    ldr        r0,DAT_080381b8
    bl         Scene_Prepare
    pop        {r5}
LAB_08038116:
    pop        {pc}


_ts FUN_08038118
    push       {lr}
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    mov        r1,#0x8
    strh       r1,[r0,#0x2e]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldr        r7,[r7,#0x28]
    mov        r1,#0x0
    strh       r1,[r7,#0x2e]
    pop        {r5}
    cmp        r0,#0x40
    bne        LAB_08038166
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08038166
    mov        r0,r10
    ldr        r0,[r0,#0x4]
    ldrh       r0,[r0,#0x2]
    ldr        r1,DAT_080381bc
    and        r1,r0
    beq        LAB_08038166
    bl         dummy_187a0
    bne        LAB_08038166
    push       {r5}
    ldr        r0,PTR_Scene_JackIn_080381c0
    mov        r1,#0x11
    bl         Scene_Prepare
    pop        {r5}
LAB_08038166:
    pop        {pc}


_ts FUN_08038168
    push       {lr}
    bl         Scene_IsSceneActive
    tst        r0,r0
    beq        LAB_08038174
    pop        {pc}
LAB_08038174:
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r1,[r0,#0xe]
    cmp        r1,#0x20
    bne        LAB_0803818a
    push       {r5}
    ldr        r0,PTR_Scene_Dialogue_080381c4
    mov        r1,#0x3
    bl         Scene_Prepare
    pop        {r5}
LAB_0803818a:
    pop        {pc}

PTR_PTR_MapSetup_DenTown_Block_3_F50_0803818c:
    .word PTR_MapSetup_DenTown_Block_3_F50_08037fb4

PTR_EntityAllocParams_803AEB4_08038190:
    .word EntityAllocParams_803AEB4

PTR_PTR_EventHandler_DenTown_Block_3_F50_08038194:
    .word PTR_EventHandler_DenTown_Block_3_F50_08037fec

PTR_NPCList_8039438_08038198:
    .word NPCList_8039438

DAT_0803819c:
    .word Scene_AfterFixedBattle

PTR_PTR_EventHandler_DenTown_Block_3_F50_0_080381a0:
    .word PTR_EventHandler_DenTown_Block_3_F50_0_0803805c

DAT_080381a4:
    .word Scene_StartFixedBattle

PTR_NPCList_8039438_080381a8:
    .word NPCList_8039438

PTR_NPCList_8039450_080381ac:
    .word NPCList_8039450

PTR_Scene_AfterFixedBattle_080381b0:
    .word Scene_AfterFixedBattle

PTR_PTR_EventHandler_DenTown_Block_3_F52_0_080381b4:
    .word PTR_EventHandler_DenTown_Block_3_F52_0_080380f0

DAT_080381b8:
    .word Scene_StartFixedBattle

DAT_080381bc:
    .word 0x100

PTR_Scene_JackIn_080381c0:
    .word Scene_JackIn

PTR_Scene_Dialogue_080381c4:
    .word Scene_Dialogue
