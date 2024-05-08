#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set PlayerLocation_Create, 0x8056020
    .set FUN_08087400, 0x8087401


_ts MapSetup_School_AV_Room_S1
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_School_AV_Room_F10_080270a8
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    mov        r0,#0x9a
    bl         Flag_GetBase
    pop        {r5}
    beq        LAB_08026efe
    mov        r0,#0x4
    bl         Sound_ChangeSong
    pop        {pc}
LAB_08026efe:
    bl         Sound_AreaSongChange
    pop        {pc}
PTR_MapSetup_School_AV_Room_F10_08026f04:
    .word MapSetup_School_AV_Room_F10
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_School_AV_Room_F14
    .word MapSetup_School_AV_Room_F15
    .word MapSetup_Default
    .word MapSetup_Default


_ts EventHandler_School_AV_Room_S1
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_AV_Room_F10_080270ac
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_AV_Room_F10_08026f30:
    .word EventHandler_School_AV_Room_F10
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_School_AV_Room_F14
    .word EventHandler_School_AV_Room_F15
    .word EventHandler_Default
    .word EventHandler_Default


_ts MapSetup_School_AV_Room_F10
    push       {lr}
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_ARRAY_080270b0
    bl         Entity_AllocList
    ldr        r0,PTR_BgTask_080270b4
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_080270b8
    bl         BgTask_AddNew
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_School_AV_Room_F10
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_AV_Room_F10_0_080270bc
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_AV_Room_F10_0_08026f8c:
    .word EventHandler_School_AV_Room_F10_0


_ts EventHandler_School_AV_Room_F10_0
    push       {lr}
    pop        {pc}


_ts MapSetup_School_AV_Room_F14
    push       {lr}
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_ARRAY_080270c0
    bl         Entity_AllocList
    ldr        r0,PTR_BgTask_080270c4
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_080270c8
    bl         BgTask_AddNew
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    mov        r0,#0xb4
    bl         Flag_GetBase
    pop        {r5}
    bne        LAB_08026fca
    mov        r0,#0x0
    b          LAB_08026fcc
LAB_08026fca:
    mov        r0,#0x4
LAB_08026fcc:
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_School_AV_Room_F14
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_AV_Room_F14_0_080270cc
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    mov        r1,#0x5
    bl         FUN_08024f0c
    pop        {pc}

    .align 2, 0

PTR_EventHandler_School_AV_Room_F14_0_08026fe8:
    .word EventHandler_School_AV_Room_F14_0
    .word EventHandler_School_AV_Room_F14_1


_ts EventHandler_School_AV_Room_F14_0
    push       {lr}
    push       {r5}
    mov        r0,#0xad
    bl         Flag_GetBase
    pop        {r5}
    beq        LAB_0802700e
    push       {r5}
    mov        r1,#0x7
    ldr        r0,DAT_080270d0
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0802700e:
    pop        {pc}


_ts EventHandler_School_AV_Room_F14_1
    push       {lr}
    pop        {pc}


_ts MapSetup_School_AV_Room_F15
    push       {lr}
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_ARRAY_080270d4
    bl         Entity_AllocList
    ldr        r0,PTR_BgTask_080270d8
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_080270dc
    bl         BgTask_AddNew
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    mov        r0,#0xb6
    bl         Flag_GetBase
    bne        LAB_08027048
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}
LAB_08027048:
    mov        r0,#0x8
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_School_AV_Room_F15
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_AV_Room_F15_0_080270e0
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    mov        r1,#0x5
    bl         FUN_08024f0c
    pop        {pc}
PTR_EventHandler_School_AV_Room_F15_0_08027064:
    .word EventHandler_School_AV_Room_F15_0
    .word EventHandler_School_AV_Room_F15_1
    .word EventHandler_School_AV_Room_F15_2


_ts EventHandler_School_AV_Room_F15_0
    push       {lr}
    mov        r0,#0xc5
    bl         Flag_GetBase
    beq        LAB_08027086
    mov        r0,#0xc5
    bl         Flag_ClearBase
    mov        r0,#0x0
    strb       r0,[r5,#0x0]
    pop        {pc}
LAB_08027086:
    mov        r0,#0xb6
    bl         Flag_GetBase
    beq        LAB_0802709e
    push       {r5}
    mov        r1,#0x0
    ldr        r0,PTR_FUN_08087400_080270e4
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x8
    strb       r0,[r5,#0x0]
LAB_0802709e:
    pop        {pc}


_ts EventHandler_School_AV_Room_F15_1
    push       {lr}
    pop        {pc}


_ts EventHandler_School_AV_Room_F15_2
    push       {lr}
    pop        {pc}
PTR_PTR_MapSetup_School_AV_Room_F10_080270a8:
    .word PTR_MapSetup_School_AV_Room_F10_08026f04
PTR_PTR_EventHandler_School_AV_Room_F10_080270ac:
    .word PTR_EventHandler_School_AV_Room_F10_08026f30
PTR_EntityAllocParams_ARRAY_080270b0:
    .word EntityAllocParams_08029C10
PTR_BgTask_080270b4:
    .word BgTask_School_TilesetBlackboardTriangle
PTR_BgTask_080270b8:
    .word BgTask_School_PaletteBlackboardOff
PTR_PTR_EventHandler_School_AV_Room_F10_0_080270bc:
    .word PTR_EventHandler_School_AV_Room_F10_0_08026f8c
PTR_EntityAllocParams_ARRAY_080270c0:
    .word EntityAllocParams_08029C10
PTR_BgTask_080270c4:
    .word BgTask_School_TilesetBlackboardEvent
PTR_BgTask_080270c8:
    .word BgTask_School_PaletteBlackboardOn
PTR_PTR_EventHandler_School_AV_Room_F14_0_080270cc:
    .word PTR_EventHandler_School_AV_Room_F14_0_08026fe8
DAT_080270d0:
    .word 0x8087E35
PTR_EntityAllocParams_ARRAY_080270d4:
    .word EntityAllocParams_08029C10
PTR_BgTask_080270d8:
    .word BgTask_School_TilesetBlackboardEvent
PTR_BgTask_080270dc:
    .word BgTask_School_PaletteBlackboardOn
PTR_PTR_EventHandler_School_AV_Room_F15_0_080270e0:
    .word PTR_EventHandler_School_AV_Room_F15_0_08027064
PTR_FUN_08087400_080270e4:
    .word FUN_08087400


_ts MapSetup_School_AV_Room_S2
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_School_AV_Room_F20_080271d8
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r0,#0xab
    bl         Flag_GetBase
    beq        LAB_08027106
    push       {r5}
    mov        r0,#0x4
    bl         Sound_ChangeSong
    pop        {r5}
    b          LAB_0802711e
LAB_08027106:
    mov        r0,#0xdf
    bl         Flag_GetBase
    beq        LAB_0802711a
    push       {r5}
    mov        r0,#0x3
    bl         Sound_ChangeSong
    pop        {r5}
    b          LAB_0802711e
LAB_0802711a:
    bl         Sound_AreaSongChange
LAB_0802711e:
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrb       r0,[r7,#0x5]
    ldrb       r1,[r7,#0xd]
    cmp        r0,r1
    beq        LAB_08027138
    mov        r0,#0x13
    bl         Flag_Get420
    beq        LAB_08027138
    mov        r0,#0x14
    bl         Flag_Set420
LAB_08027138:
    pop        {pc}

    .align 2, 0

PTR_MapSetup_School_AV_Room_F20_0802713c:
    .word MapSetup_School_AV_Room_F20
    .word MapSetup_School_AV_Room_F20
    .word MapSetup_School_AV_Room_F20
    .word MapSetup_Default
    .word MapSetup_School_AV_Room_F20
    .word MapSetup_School_AV_Room_F20
    .word MapSetup_School_AV_Room_F20
    .word MapSetup_School_AV_Room_F20


_ts EventHandler_School_AV_Room_S2
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_AV_Room_F20_080271dc
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_AV_Room_F20_08027168:
    .word EventHandler_School_AV_Room_F20
    .word EventHandler_School_AV_Room_F20
    .word EventHandler_School_AV_Room_F20
    .word EventHandler_Default
    .word EventHandler_School_AV_Room_F20
    .word EventHandler_School_AV_Room_F20
    .word EventHandler_School_AV_Room_F20
    .word EventHandler_School_AV_Room_F20


_ts MapSetup_School_AV_Room_F20
    push       {lr}
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_ARRAY_080271e0
    bl         Entity_AllocList
    ldr        r0,PTR_BgTask_080271e4
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_080271e8
    bl         BgTask_AddNew
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_PTR_DAT_080271ec
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_School_AV_Room_F20
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_AV_Room_F20_0_080271f0
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    mov        r1,#0x5
    bl         CheckJackIn_2
    pop        {pc}
PTR_EventHandler_School_AV_Room_F20_0_080271d0:
    .word EventHandler_School_AV_Room_F20_0


_ts EventHandler_School_AV_Room_F20_0
    push       {lr}
    pop        {pc}
PTR_PTR_MapSetup_School_AV_Room_F20_080271d8:
    .word PTR_MapSetup_School_AV_Room_F20_0802713c
PTR_PTR_EventHandler_School_AV_Room_F20_080271dc:
    .word PTR_EventHandler_School_AV_Room_F20_08027168
PTR_EntityAllocParams_ARRAY_080271e0:
    .word EntityAllocParams_08029C10
PTR_BgTask_080271e4:
    .word BgTask_School_TilesetBlackboardTriangle
PTR_BgTask_080271e8:
    .word BgTask_School_PaletteBlackboardOff
PTR_PTR_DAT_080271ec:
    .word NPCList_80297C4
PTR_PTR_EventHandler_School_AV_Room_F20_0_080271f0:
    .word PTR_EventHandler_School_AV_Room_F20_0_080271d0


_ts MapSetup_School_AV_Room_S3
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_School_AV_Room_F30_080272bc
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Sound_AreaSongChange
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrb       r0,[r7,#0x5]
    ldrb       r1,[r7,#0xd]
    cmp        r0,r1
    beq        LAB_0802721c
    mov        r0,#0x13
    bl         Flag_Get420
    beq        LAB_0802721c
    mov        r0,#0x14
    bl         Flag_Set420
LAB_0802721c:
    pop        {pc}

    .align 2, 0

PTR_MapSetup_School_AV_Room_F30_08027220:
    .word MapSetup_School_AV_Room_F30
    .word MapSetup_School_AV_Room_F30
    .word MapSetup_School_AV_Room_F30
    .word MapSetup_School_AV_Room_F30
    .word MapSetup_School_AV_Room_F30
    .word MapSetup_School_AV_Room_F30
    .word MapSetup_School_AV_Room_F30
    .word MapSetup_School_AV_Room_F30


_ts EventHandler_School_AV_Room_S3
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_AV_Room_F30_080272c0
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_AV_Room_F30_0802724c:
    .word EventHandler_School_AV_Room_F30
    .word EventHandler_School_AV_Room_F30
    .word EventHandler_School_AV_Room_F30
    .word EventHandler_School_AV_Room_F30
    .word EventHandler_School_AV_Room_F30
    .word EventHandler_School_AV_Room_F30
    .word EventHandler_School_AV_Room_F30
    .word EventHandler_School_AV_Room_F30


_ts MapSetup_School_AV_Room_F30
    push       {lr}
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_ARRAY_080272c4
    bl         Entity_AllocList
    ldr        r0,PTR_BgTask_080272c8
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_080272cc
    bl         BgTask_AddNew
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_PTR_DAT_080272d0
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_School_AV_Room_F30
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_AV_Room_F30_0_080272d4
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    mov        r1,#0x5
    bl         CheckJackIn_2
    pop        {pc}
PTR_EventHandler_School_AV_Room_F30_0_080272b4:
    .word EventHandler_School_AV_Room_F30_0


_ts EventHandler_School_AV_Room_F30_0
    push       {lr}
    pop        {pc}
PTR_PTR_MapSetup_School_AV_Room_F30_080272bc:
    .word PTR_MapSetup_School_AV_Room_F30_08027220
PTR_PTR_EventHandler_School_AV_Room_F30_080272c0:
    .word PTR_EventHandler_School_AV_Room_F30_0802724c
PTR_EntityAllocParams_ARRAY_080272c4:
    .word EntityAllocParams_08029C10
PTR_BgTask_080272c8:
    .word BgTask_School_TilesetBlackboardTriangle
PTR_BgTask_080272cc:
    .word BgTask_School_PaletteBlackboardOff
PTR_PTR_DAT_080272d0:
    .word NPCList_80297C4
PTR_PTR_EventHandler_School_AV_Room_F30_0_080272d4:
    .word PTR_EventHandler_School_AV_Room_F30_0_080272b4
