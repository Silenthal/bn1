#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set PlayerLocation_Create, 0x8056020


_ts MapSetup_School_Class_1A_S1
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_School_Class_1A_F10_080267e8
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    mov        r0,#0x9a
    bl         Flag_GetBase
    pop        {r5}
    beq        LAB_08026676
    mov        r0,#0x4
    bl         Sound_ChangeSong
    pop        {pc}
LAB_08026676:
    bl         Sound_AreaSongChange
    pop        {pc}
PTR_MapSetup_School_Class_1A_F10_0802667c:
    .word MapSetup_School_Class_1A_F10
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_School_Class_1A_F14
    .word MapSetup_School_Class_1A_F15
    .word MapSetup_Default
    .word MapSetup_Default


_ts EventHandler_School_Class_1A_S1
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Class_1A_F10_080267ec
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_Class_1A_F10_080266a8:
    .word EventHandler_School_Class_1A_F10
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_School_Class_1A_F14
    .word EventHandler_School_Class_1A_F15
    .word EventHandler_Default
    .word EventHandler_Default


_ts MapSetup_School_Class_1A_F10
    push       {lr}
    push       {r5}
    ldr        r0,PTR_BgTask_080267f0
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_080267f4
    bl         BgTask_AddNew
    ldr        r0,PTR_EntityAllocParams_ARRAY_080267f8
    bl         Entity_AllocList
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_School_Class_1A_F10
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Class_1A_F10_0_080267fc
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_Class_1A_F10_0_08026704:
    .word EventHandler_School_Class_1A_F10_0


_ts EventHandler_School_Class_1A_F10_0
    push       {lr}
    pop        {pc}


_ts MapSetup_School_Class_1A_F14
    push       {lr}
    push       {r5}
    ldr        r0,PTR_BgTask_08026800
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_08026804
    bl         BgTask_AddNew
    ldr        r0,PTR_EntityAllocParams_ARRAY_08026808
    bl         Entity_AllocList
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_PTR_DAT_0802680c
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    mov        r0,#0xb4
    bl         Flag_GetBase
    pop        {r5}
    bne        LAB_0802674c
    mov        r0,#0x0
    b          LAB_0802674e
LAB_0802674c:
    mov        r0,#0x4
LAB_0802674e:
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_School_Class_1A_F14
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Class_1A_F14_0_08026810
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    mov        r1,#0x3
    bl         FUN_08024f0c
    pop        {pc}
PTR_EventHandler_School_Class_1A_F14_0_08026768:
    .word EventHandler_School_Class_1A_F14_0
    .word EventHandler_School_Class_1A_F14_1


_ts EventHandler_School_Class_1A_F14_0
    push       {lr}
    push       {r5}
    mov        r0,#0xad
    bl         Flag_GetBase
    pop        {r5}
    beq        LAB_0802678a
    push       {r5}
    mov        r1,#0x7
    ldr        r0,DAT_08026814
    bl         Scene_Prepare
    pop        {r5}
LAB_0802678a:
    pop        {pc}


_ts EventHandler_School_Class_1A_F14_1
    push       {lr}
    pop        {pc}


_ts MapSetup_School_Class_1A_F15
    push       {lr}
    push       {r5}
    ldr        r0,PTR_BgTask_08026818
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_0802681c
    bl         BgTask_AddNew
    ldr        r0,PTR_EntityAllocParams_ARRAY_08026820
    bl         Entity_AllocList
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_PTR_DAT_08026824
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}

    .align 2, 0



_ts EventHandler_School_Class_1A_F15
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Class_1A_F15_0_08026828
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    mov        r1,#0x3
    bl         FUN_08024f0c
    pop        {pc}

    .align 2, 0

PTR_EventHandler_School_Class_1A_F15_0_080267e0:
    .word EventHandler_School_Class_1A_F15_0


_ts EventHandler_School_Class_1A_F15_0
    push       {lr}
    pop        {pc}
PTR_PTR_MapSetup_School_Class_1A_F10_080267e8:
    .word PTR_MapSetup_School_Class_1A_F10_0802667c
PTR_PTR_EventHandler_School_Class_1A_F10_080267ec:
    .word PTR_EventHandler_School_Class_1A_F10_080266a8
PTR_BgTask_080267f0:
    .word BgTask_School_TilesetBlackboardMath
PTR_BgTask_080267f4:
    .word BgTask_School_PaletteBlackboardOn_2
PTR_EntityAllocParams_ARRAY_080267f8:
    .word EntityAllocParams_08029B18
PTR_PTR_EventHandler_School_Class_1A_F10_0_080267fc:
    .word PTR_EventHandler_School_Class_1A_F10_0_08026704
PTR_BgTask_08026800:
    .word BgTask_School_TilesetBlackboardEvent
PTR_BgTask_08026804:
    .word BgTask_School_PaletteBlackboardOn
PTR_EntityAllocParams_ARRAY_08026808:
    .word EntityAllocParams_08029B18
PTR_PTR_DAT_0802680c:
    .word NPCList_8029610
PTR_PTR_EventHandler_School_Class_1A_F14_0_08026810:
    .word PTR_EventHandler_School_Class_1A_F14_0_08026768
DAT_08026814:
    .word 0x8087E35
PTR_BgTask_08026818:
    .word BgTask_School_TilesetBlackboardEvent
PTR_BgTask_0802681c:
    .word BgTask_School_PaletteBlackboardOn
PTR_EntityAllocParams_ARRAY_08026820:
    .word EntityAllocParams_08029B18
PTR_PTR_DAT_08026824:
    .word NPCList_8029610
PTR_PTR_EventHandler_School_Class_1A_F15_0_08026828:
    .word PTR_EventHandler_School_Class_1A_F15_0_080267e0


_ts MapSetup_School_Class_1A_S2
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_School_Class_1A_F20_08026994
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r0,#0xab
    bl         Flag_GetBase
    beq        LAB_0802684a
    push       {r5}
    mov        r0,#0x4
    bl         Sound_ChangeSong
    pop        {r5}
    b          LAB_08026862
LAB_0802684a:
    mov        r0,#0xdf
    bl         Flag_GetBase
    beq        LAB_0802685e
    push       {r5}
    mov        r0,#0x3
    bl         Sound_ChangeSong
    pop        {r5}
    b          LAB_08026862
LAB_0802685e:
    bl         Sound_AreaSongChange
LAB_08026862:
    pop        {pc}
PTR_MapSetup_School_Class_1A_F20_08026864:
    .word MapSetup_School_Class_1A_F20
    .word MapSetup_School_Class_1A_F21
    .word MapSetup_School_Class_1A_F22
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default


_ts EventHandler_School_Class_1A_S2
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Class_1A_F20_08026998
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_Class_1A_F20_08026890:
    .word EventHandler_School_Class_1A_F20
    .word EventHandler_School_Class_1A_F21
    .word EventHandler_School_Class_1A_F22
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default


_ts MapSetup_School_Class_1A_F20
    push       {lr}
    push       {r5}
    ldr        r0,PTR_BgTask_0802699c
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_080269a0
    bl         BgTask_AddNew
    ldr        r0,PTR_EntityAllocParams_ARRAY_080269a4
    bl         Entity_AllocList
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_School_Class_1A_F20
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Class_1A_F20_0_080269a8
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    mov        r1,#0x3
    bl         CheckJackIn_2
    pop        {pc}

    .align 2, 0

PTR_EventHandler_School_Class_1A_F20_0_080268f4:
    .word EventHandler_School_Class_1A_F20_0


_ts EventHandler_School_Class_1A_F20_0
    push       {lr}
    pop        {pc}


_ts MapSetup_School_Class_1A_F21
    push       {lr}
    push       {r5}
    ldr        r0,PTR_BgTask_080269ac
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_080269b0
    bl         BgTask_AddNew
    ldr        r0,PTR_EntityAllocParams_ARRAY_080269b4
    bl         Entity_AllocList
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_School_Class_1A_F21
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Class_1A_F21_0_080269b8
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    mov        r1,#0x3
    bl         CheckJackIn_2
    pop        {pc}

    .align 2, 0

PTR_EventHandler_School_Class_1A_F21_0_08026940:
    .word EventHandler_School_Class_1A_F21_0


_ts EventHandler_School_Class_1A_F21_0
    push       {lr}
    pop        {pc}


_ts MapSetup_School_Class_1A_F22
    push       {lr}
    push       {r5}
    ldr        r0,PTR_BgTask_080269bc
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_080269c0
    bl         BgTask_AddNew
    ldr        r0,PTR_EntityAllocParams_ARRAY_080269c4
    bl         Entity_AllocList
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_School_Class_1A_F22
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Class_1A_F22_0_080269c8
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    mov        r1,#0x3
    bl         CheckJackIn_2
    pop        {pc}

    .align 2, 0

PTR_EventHandler_School_Class_1A_F22_0_0802698c:
    .word EventHandler_School_Class_1A_F22_0


_ts EventHandler_School_Class_1A_F22_0
    push       {lr}
    pop        {pc}
PTR_PTR_MapSetup_School_Class_1A_F20_08026994:
    .word PTR_MapSetup_School_Class_1A_F20_08026864
PTR_PTR_EventHandler_School_Class_1A_F20_08026998:
    .word PTR_EventHandler_School_Class_1A_F20_08026890
PTR_BgTask_0802699c:
    .word BgTask_School_TilesetBlackboardMath
PTR_BgTask_080269a0:
    .word BgTask_School_PaletteBlackboardOn_2
PTR_EntityAllocParams_ARRAY_080269a4:
    .word EntityAllocParams_08029B18
PTR_PTR_EventHandler_School_Class_1A_F20_0_080269a8:
    .word PTR_EventHandler_School_Class_1A_F20_0_080268f4
PTR_BgTask_080269ac:
    .word BgTask_School_TilesetBlackboardMath
PTR_BgTask_080269b0:
    .word BgTask_School_PaletteBlackboardOn_2
PTR_EntityAllocParams_ARRAY_080269b4:
    .word EntityAllocParams_08029B18
PTR_PTR_EventHandler_School_Class_1A_F21_0_080269b8:
    .word PTR_EventHandler_School_Class_1A_F21_0_08026940
PTR_BgTask_080269bc:
    .word BgTask_School_TilesetBlackboardMath
PTR_BgTask_080269c0:
    .word BgTask_School_PaletteBlackboardOn_2
PTR_EntityAllocParams_ARRAY_080269c4:
    .word EntityAllocParams_08029B18
PTR_PTR_EventHandler_School_Class_1A_F22_0_080269c8:
    .word PTR_EventHandler_School_Class_1A_F22_0_0802698c


_ts MapSetup_School_Class_1A_S3
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_School_Class_1A_F30_08026a74
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Sound_AreaSongChange
    pop        {pc}
PTR_MapSetup_School_Class_1A_F30_080269dc:
    .word MapSetup_School_Class_1A_F30
    .word MapSetup_School_Class_1A_F30
    .word MapSetup_School_Class_1A_F30
    .word MapSetup_School_Class_1A_F30
    .word MapSetup_School_Class_1A_F30
    .word MapSetup_School_Class_1A_F30
    .word MapSetup_School_Class_1A_F30
    .word MapSetup_School_Class_1A_F30


_ts EventHandler_School_Class_1A_S3
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Class_1A_F30_08026a78
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_Class_1A_F30_08026a08:
    .word EventHandler_School_Class_1A_F30
    .word EventHandler_School_Class_1A_F30
    .word EventHandler_School_Class_1A_F30
    .word EventHandler_School_Class_1A_F30
    .word EventHandler_School_Class_1A_F30
    .word EventHandler_School_Class_1A_F30
    .word EventHandler_School_Class_1A_F30
    .word EventHandler_School_Class_1A_F30


_ts MapSetup_School_Class_1A_F30
    push       {lr}
    push       {r5}
    ldr        r0,PTR_BgTask_08026a7c
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_08026a80
    bl         BgTask_AddNew
    ldr        r0,PTR_EntityAllocParams_ARRAY_08026a84
    bl         Entity_AllocList
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_School_Class_1A_F30
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Class_1A_F30_0_08026a88
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    mov        r1,#0x3
    bl         CheckJackIn_2
    pop        {pc}

    .align 2, 0

PTR_EventHandler_School_Class_1A_F30_0_08026a6c:
    .word EventHandler_School_Class_1A_F30_0


_ts EventHandler_School_Class_1A_F30_0
    push       {lr}
    pop        {pc}
PTR_PTR_MapSetup_School_Class_1A_F30_08026a74:
    .word PTR_MapSetup_School_Class_1A_F30_080269dc
PTR_PTR_EventHandler_School_Class_1A_F30_08026a78:
    .word PTR_EventHandler_School_Class_1A_F30_08026a08
PTR_BgTask_08026a7c:
    .word BgTask_School_TilesetBlackboardMath
PTR_BgTask_08026a80:
    .word BgTask_School_PaletteBlackboardOn_2
PTR_EntityAllocParams_ARRAY_08026a84:
    .word EntityAllocParams_08029B18
PTR_PTR_EventHandler_School_Class_1A_F30_0_08026a88:
    .word PTR_EventHandler_School_Class_1A_F30_0_08026a6c
