#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_WWW_Comp_2_S5
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_Default_0804d560
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_803ECF8_0804d578
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_803ED68_0804d57c
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_803F138_0804d580
    bl         BgTask_AddNew
    pop        {r5}
    bl         Sound_AreaSongChange
    pop        {pc}

    .align 2, 0

PTR_PTR_MapSetup_Default_0804d560:
    .word PTR_MapSetup_Default_0804d564

PTR_MapSetup_Default_0804d564:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_WWW_Comp_2_F54

PTR_BgTask_803ECF8_0804d578:
    .word BgTask_803ECF8

PTR_BgTask_803ED68_0804d57c:
    .word BgTask_803ED68

PTR_BgTask_803F138_0804d580:
    .word BgTask_803F138


_ts EventHandler_WWW_Comp_2_S5
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Default_0804d968
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Default_0804d590:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_WWW_Comp_2_F54


_ts MapSetup_WWW_Comp_2_F54
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
    bne        LAB_0804d5cc
    ldrb       r1,[r0,#World_currentArea]
    ldrb       r2,[r0,#World_lastArea]
    cmp        r1,r2
    beq        LAB_0804d5d8
LAB_0804d5cc:
    push       {r5}
    ldr        r0,DAT_0804d96c
    ldr        r1,PTR_DAT_0804d970
    bl         Scene_Prepare
    pop        {r5}
LAB_0804d5d8:
    Flag_GetBase 0xB6
    bne        LAB_0804d5ec
    push       {r5}
    ldr        r7,PTR_NPCList_804E20C_0804d974
    bl         Map_LoadNPCList
    pop        {r5}
    b          LAB_0804d600
LAB_0804d5ec:
    push       {r5}
    ldr        r7,PTR_NPCList_804E21C_0804d978
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    mov        r2,#0x8
    bl         FUN_0804d3fe
    b          LAB_0804d6e0
LAB_0804d600:
    push       {r5}
    Flag_GetBase 0xD4
    beq        LAB_0804d612
    Flag_SetIgnore F_IGNORE_WALL_00
    b          LAB_0804d618
LAB_0804d612:
    mov        r1,#0xd
    bl         Effect_WWWGate_Create
LAB_0804d618:
    Flag_GetBase 0xD5
    beq        LAB_0804d628
    Flag_SetIgnore F_IGNORE_WALL_01
    b          LAB_0804d62e
LAB_0804d628:
    mov        r1,#0xe
    bl         Effect_WWWGate_Create
LAB_0804d62e:
    Flag_GetBase 0xD6
    beq        LAB_0804d63e
    Flag_SetIgnore F_IGNORE_WALL_02
    b          LAB_0804d644
LAB_0804d63e:
    mov        r1,#0xf
    bl         Effect_WWWGate_Create
LAB_0804d644:
    Flag_GetBase 0xD7
    beq        LAB_0804d654
    Flag_SetIgnore F_IGNORE_WALL_03
    b          LAB_0804d65a
LAB_0804d654:
    mov        r1,#0x10
    bl         Effect_WWWGate_Create
LAB_0804d65a:
    Flag_GetBase 0xCA
    beq        LAB_0804d66a
    Flag_SetIgnore F_IGNORE_WALL_04
    b          LAB_0804d670
LAB_0804d66a:
    mov        r1,#0x11
    bl         Effect_WWWGate_Create
LAB_0804d670:
    Flag_GetBase 0xCC
    beq        LAB_0804d680
    Flag_SetIgnore F_IGNORE_WALL_05
    b          LAB_0804d686
LAB_0804d680:
    mov        r1,#0x12
    bl         Effect_WWWGate_Create
LAB_0804d686:
    Flag_GetBase 0xCE
    beq        LAB_0804d696
    Flag_SetIgnore F_IGNORE_WALL_06
    b          LAB_0804d69c
LAB_0804d696:
    mov        r1,#0x13
    bl         Effect_WWWGate_Create
LAB_0804d69c:
    Flag_GetBase 0xD0
    beq        LAB_0804d6ac
    Flag_SetIgnore F_IGNORE_WALL_07
    b          LAB_0804d6b2
LAB_0804d6ac:
    mov        r1,#0x14
    bl         Effect_WWWGate_Create
LAB_0804d6b2:
    Flag_GetBase 0xD2
    beq        LAB_0804d6c2
    Flag_SetIgnore F_IGNORE_WALL_08
    b          LAB_0804d6ce
LAB_0804d6c2:
    mov        r1,#0x15
    bl         Effect_WWWGate_Create
    mov        r1,#0x16
    bl         Effect_WWWGate_Create
LAB_0804d6ce:
    pop        {r5}
    push       {r5}
    Flag_ClearBase 0xB4
    ldr        r0,PTR_EntityAllocParams_804E90C_0804d97c
    bl         Entity_AllocList
    pop        {r5}
LAB_0804d6e0:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_WWW_Comp_2_F54
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_WWW_Comp_2_F54_0_0804d980
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_WWW_Comp_2_F54_0_0804d6f8:
    .word EventHandler_WWW_Comp_2_F54_0


_ts EventHandler_WWW_Comp_2_F54_0
    push       {lr}
    Flag_GetBase 0xB6
    beq        LAB_0804d708
    b          LAB_0804d960
LAB_0804d708:
    Flag_ClearBase 0xC3
    Flag_ClearBase 0xC5
    Flag_ClearBase 0xC7
    Flag_ClearBase 0xC9
    Flag_ClearBase 0xCB
    Flag_ClearBase 0xCD
    Flag_ClearBase 0xCF
    Flag_ClearBase 0xD1
    Flag_ClearBase 0xD3
    Flag_GetBase 0xD4
    bne        LAB_0804d77a
    Flag_GetBase 0xC2
    beq        LAB_0804d75c
    push       {r5}
    ldr        r0,DAT_0804d984
    mov        r1,#0xc
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0804d75c:
    LoadMain world, r0, r7
    ldrb       r0,[r0,#World_curEventFlag]
    cmp        r0,#0x20
    bne        LAB_0804d77a
    Flag_SetBase 0xC3
    push       {r5}
    ldr        r0,DAT_0804d988
    mov        r1,#0xa
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0804d77a:
    Flag_GetBase 0xD5
    bne        LAB_0804d7b6
    Flag_GetBase 0xC4
    beq        LAB_0804d798
    push       {r5}
    ldr        r0,DAT_0804d98c
    mov        r1,#0xd
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0804d798:
    LoadMain world, r0, r7
    ldrb       r0,[r0,#World_curEventFlag]
    cmp        r0,#0x21
    bne        LAB_0804d7b6
    Flag_SetBase 0xC5
    push       {r5}
    ldr        r0,DAT_0804d990
    mov        r1,#0xa
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0804d7b6:
    Flag_GetBase 0xD6
    bne        LAB_0804d7f2
    Flag_GetBase 0xC6
    beq        LAB_0804d7d4
    push       {r5}
    ldr        r0,DAT_0804d994
    mov        r1,#0xe
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0804d7d4:
    LoadMain world, r0, r7
    ldrb       r0,[r0,#World_curEventFlag]
    cmp        r0,#0x22
    bne        LAB_0804d7f2
    Flag_SetBase 0xC7
    push       {r5}
    ldr        r0,DAT_0804d998
    mov        r1,#0xa
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0804d7f2:
    Flag_GetBase 0xD7
    bne        LAB_0804d82e
    Flag_GetBase 0xC8
    beq        LAB_0804d810
    push       {r5}
    ldr        r0,DAT_0804d99c
    mov        r1,#0xf
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0804d810:
    LoadMain world, r0, r7
    ldrb       r0,[r0,#World_curEventFlag]
    cmp        r0,#0x23
    bne        LAB_0804d82e
    Flag_SetBase 0xC9
    push       {r5}
    ldr        r0,DAT_0804d9a0
    mov        r1,#0xa
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0804d82e:
    Flag_GetBase 0xD8
    bne        LAB_0804d86a
    Flag_GetBase 0xCA
    beq        LAB_0804d84c
    push       {r5}
    ldr        r0,DAT_0804d9a4
    mov        r1,#0x10
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0804d84c:
    LoadMain world, r0, r7
    ldrb       r0,[r0,#World_curEventFlag]
    cmp        r0,#0x24
    bne        LAB_0804d86a
    Flag_SetBase 0xCB
    push       {r5}
    ldr        r0,DAT_0804d9a8
    mov        r1,#0xa
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0804d86a:
    Flag_GetBase 0xD9
    bne        LAB_0804d8a6
    Flag_GetBase 0xCC
    beq        LAB_0804d888
    push       {r5}
    ldr        r0,DAT_0804d9ac
    mov        r1,#0x11
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0804d888:
    LoadMain world, r0, r7
    ldrb       r0,[r0,#World_curEventFlag]
    cmp        r0,#0x25
    bne        LAB_0804d8a6
    Flag_SetBase 0xCD
    push       {r5}
    ldr        r0,DAT_0804d9b0
    mov        r1,#0xa
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0804d8a6:
    Flag_GetBase 0xDA
    bne        LAB_0804d8e2
    Flag_GetBase 0xCE
    beq        LAB_0804d8c4
    push       {r5}
    ldr        r0,DAT_0804d9b4
    mov        r1,#0x12
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0804d8c4:
    LoadMain world, r0, r7
    ldrb       r0,[r0,#World_curEventFlag]
    cmp        r0,#0x26
    bne        LAB_0804d8e2
    Flag_SetBase 0xCF
    push       {r5}
    ldr        r0,DAT_0804d9b8
    mov        r1,#0xa
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0804d8e2:
    Flag_GetBase 0xDB
    bne        LAB_0804d91e
    Flag_GetBase 0xD0
    beq        LAB_0804d900
    push       {r5}
    ldr        r0,DAT_0804d9bc
    mov        r1,#0x13
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0804d900:
    LoadMain world, r0, r7
    ldrb       r0,[r0,#World_curEventFlag]
    cmp        r0,#0x27
    bne        LAB_0804d91e
    Flag_SetBase 0xD1
    push       {r5}
    ldr        r0,DAT_0804d9c0
    mov        r1,#0xa
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0804d91e:
    Flag_GetBase 0xDC
    bne        LAB_0804d960
    Flag_GetBase 0xD2
    beq        LAB_0804d93c
    push       {r5}
    ldr        r0,DAT_0804d9c4
    mov        r1,#0x14
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0804d93c:
    LoadMain world, r0, r7
    ldrb       r0,[r0,#World_curEventFlag]
    cmp        r0,#0x28
    bne        LAB_0804d960
    Flag_SetBase 0xD3
    Flag_GetBase 0xB6
    bne        LAB_0804d960
    push       {r5}
    ldr        r0,PTR_Scene_Story_72_0804d9c8
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_0804d960:
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}

PTR_PTR_EventHandler_Default_0804d968:
    .word PTR_EventHandler_Default_0804d590

DAT_0804d96c:
    .word Scene_MegaManJackIn

PTR_DAT_0804d970:
    .word 0x2000

PTR_NPCList_804E20C_0804d974:
    .word NPCList_804E20C

PTR_NPCList_804E21C_0804d978:
    .word NPCList_804E21C

PTR_EntityAllocParams_804E90C_0804d97c:
    .word EntityAllocParams_804E90C

PTR_PTR_EventHandler_WWW_Comp_2_F54_0_0804d980:
    .word PTR_EventHandler_WWW_Comp_2_F54_0_0804d6f8

DAT_0804d984:
    .word Scene_UnlockWWWGate

DAT_0804d988:
    .word Scene_Dialogue

DAT_0804d98c:
    .word Scene_UnlockWWWGate

DAT_0804d990:
    .word Scene_Dialogue

DAT_0804d994:
    .word Scene_UnlockWWWGate

DAT_0804d998:
    .word Scene_Dialogue

DAT_0804d99c:
    .word Scene_UnlockWWWGate

DAT_0804d9a0:
    .word Scene_Dialogue

DAT_0804d9a4:
    .word Scene_UnlockWWWGate

DAT_0804d9a8:
    .word Scene_Dialogue

DAT_0804d9ac:
    .word Scene_UnlockWWWGate

DAT_0804d9b0:
    .word Scene_Dialogue

DAT_0804d9b4:
    .word Scene_UnlockWWWGate

DAT_0804d9b8:
    .word Scene_Dialogue

DAT_0804d9bc:
    .word Scene_UnlockWWWGate

DAT_0804d9c0:
    .word Scene_Dialogue

DAT_0804d9c4:
    .word Scene_UnlockWWWGate

PTR_Scene_Story_72_0804d9c8:
    .word Scene_Story_72
