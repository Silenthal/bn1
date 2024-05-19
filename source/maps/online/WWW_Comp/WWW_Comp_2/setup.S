#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set FUN_0807db72, 0x807DB72+1


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
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    bne        LAB_0804d5cc
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_0804d5d8
LAB_0804d5cc:
    push       {r5}
    ldr        r0,DAT_0804d96c
    ldr        r1,PTR_DAT_0804d970
    bl         Scene_Prepare
    pop        {r5}
LAB_0804d5d8:
    mov        r0,#0xb6
    bl         Flag_GetBase
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
    mov        r0,#0xd4
    bl         Flag_GetBase
    beq        LAB_0804d612
    mov        r0,#0x0
    bl         Flag_Set380
    b          LAB_0804d618
LAB_0804d612:
    mov        r1,#0xd
    bl         FUN_0807db72
LAB_0804d618:
    mov        r0,#0xd5
    bl         Flag_GetBase
    beq        LAB_0804d628
    mov        r0,#0x1
    bl         Flag_Set380
    b          LAB_0804d62e
LAB_0804d628:
    mov        r1,#0xe
    bl         FUN_0807db72
LAB_0804d62e:
    mov        r0,#0xd6
    bl         Flag_GetBase
    beq        LAB_0804d63e
    mov        r0,#0x2
    bl         Flag_Set380
    b          LAB_0804d644
LAB_0804d63e:
    mov        r1,#0xf
    bl         FUN_0807db72
LAB_0804d644:
    mov        r0,#0xd7
    bl         Flag_GetBase
    beq        LAB_0804d654
    mov        r0,#0x3
    bl         Flag_Set380
    b          LAB_0804d65a
LAB_0804d654:
    mov        r1,#0x10
    bl         FUN_0807db72
LAB_0804d65a:
    mov        r0,#0xca
    bl         Flag_GetBase
    beq        LAB_0804d66a
    mov        r0,#0x4
    bl         Flag_Set380
    b          LAB_0804d670
LAB_0804d66a:
    mov        r1,#0x11
    bl         FUN_0807db72
LAB_0804d670:
    mov        r0,#0xcc
    bl         Flag_GetBase
    beq        LAB_0804d680
    mov        r0,#0x5
    bl         Flag_Set380
    b          LAB_0804d686
LAB_0804d680:
    mov        r1,#0x12
    bl         FUN_0807db72
LAB_0804d686:
    mov        r0,#0xce
    bl         Flag_GetBase
    beq        LAB_0804d696
    mov        r0,#0x6
    bl         Flag_Set380
    b          LAB_0804d69c
LAB_0804d696:
    mov        r1,#0x13
    bl         FUN_0807db72
LAB_0804d69c:
    mov        r0,#0xd0
    bl         Flag_GetBase
    beq        LAB_0804d6ac
    mov        r0,#0x7
    bl         Flag_Set380
    b          LAB_0804d6b2
LAB_0804d6ac:
    mov        r1,#0x14
    bl         FUN_0807db72
LAB_0804d6b2:
    mov        r0,#0xd2
    bl         Flag_GetBase
    beq        LAB_0804d6c2
    mov        r0,#0x8
    bl         Flag_Set380
    b          LAB_0804d6ce
LAB_0804d6c2:
    mov        r1,#0x15
    bl         FUN_0807db72
    mov        r1,#0x16
    bl         FUN_0807db72
LAB_0804d6ce:
    pop        {r5}
    push       {r5}
    mov        r0,#0xb4
    bl         Flag_ClearBase
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
    mov        r0,#0xb6
    bl         Flag_GetBase
    beq        LAB_0804d708
    b          LAB_0804d960
LAB_0804d708:
    mov        r0,#0xc3
    bl         Flag_ClearBase
    mov        r0,#0xc5
    bl         Flag_ClearBase
    mov        r0,#0xc7
    bl         Flag_ClearBase
    mov        r0,#0xc9
    bl         Flag_ClearBase
    mov        r0,#0xcb
    bl         Flag_ClearBase
    mov        r0,#0xcd
    bl         Flag_ClearBase
    mov        r0,#0xcf
    bl         Flag_ClearBase
    mov        r0,#0xd1
    bl         Flag_ClearBase
    mov        r0,#0xd3
    bl         Flag_ClearBase
    mov        r0,#0xd4
    bl         Flag_GetBase
    bne        LAB_0804d77a
    mov        r0,#0xc2
    bl         Flag_GetBase
    beq        LAB_0804d75c
    push       {r5}
    ldr        r0,DAT_0804d984
    mov        r1,#0xc
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0804d75c:
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x20
    bne        LAB_0804d77a
    mov        r0,#0xc3
    bl         Flag_SetBase
    push       {r5}
    ldr        r0,DAT_0804d988
    mov        r1,#0xa
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0804d77a:
    mov        r0,#0xd5
    bl         Flag_GetBase
    bne        LAB_0804d7b6
    mov        r0,#0xc4
    bl         Flag_GetBase
    beq        LAB_0804d798
    push       {r5}
    ldr        r0,DAT_0804d98c
    mov        r1,#0xd
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0804d798:
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x21
    bne        LAB_0804d7b6
    mov        r0,#0xc5
    bl         Flag_SetBase
    push       {r5}
    ldr        r0,DAT_0804d990
    mov        r1,#0xa
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0804d7b6:
    mov        r0,#0xd6
    bl         Flag_GetBase
    bne        LAB_0804d7f2
    mov        r0,#0xc6
    bl         Flag_GetBase
    beq        LAB_0804d7d4
    push       {r5}
    ldr        r0,DAT_0804d994
    mov        r1,#0xe
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0804d7d4:
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x22
    bne        LAB_0804d7f2
    mov        r0,#0xc7
    bl         Flag_SetBase
    push       {r5}
    ldr        r0,DAT_0804d998
    mov        r1,#0xa
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0804d7f2:
    mov        r0,#0xd7
    bl         Flag_GetBase
    bne        LAB_0804d82e
    mov        r0,#0xc8
    bl         Flag_GetBase
    beq        LAB_0804d810
    push       {r5}
    ldr        r0,DAT_0804d99c
    mov        r1,#0xf
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0804d810:
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x23
    bne        LAB_0804d82e
    mov        r0,#0xc9
    bl         Flag_SetBase
    push       {r5}
    ldr        r0,DAT_0804d9a0
    mov        r1,#0xa
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0804d82e:
    mov        r0,#0xd8
    bl         Flag_GetBase
    bne        LAB_0804d86a
    mov        r0,#0xca
    bl         Flag_GetBase
    beq        LAB_0804d84c
    push       {r5}
    ldr        r0,DAT_0804d9a4
    mov        r1,#0x10
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0804d84c:
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x24
    bne        LAB_0804d86a
    mov        r0,#0xcb
    bl         Flag_SetBase
    push       {r5}
    ldr        r0,DAT_0804d9a8
    mov        r1,#0xa
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0804d86a:
    mov        r0,#0xd9
    bl         Flag_GetBase
    bne        LAB_0804d8a6
    mov        r0,#0xcc
    bl         Flag_GetBase
    beq        LAB_0804d888
    push       {r5}
    ldr        r0,DAT_0804d9ac
    mov        r1,#0x11
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0804d888:
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x25
    bne        LAB_0804d8a6
    mov        r0,#0xcd
    bl         Flag_SetBase
    push       {r5}
    ldr        r0,DAT_0804d9b0
    mov        r1,#0xa
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0804d8a6:
    mov        r0,#0xda
    bl         Flag_GetBase
    bne        LAB_0804d8e2
    mov        r0,#0xce
    bl         Flag_GetBase
    beq        LAB_0804d8c4
    push       {r5}
    ldr        r0,DAT_0804d9b4
    mov        r1,#0x12
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0804d8c4:
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x26
    bne        LAB_0804d8e2
    mov        r0,#0xcf
    bl         Flag_SetBase
    push       {r5}
    ldr        r0,DAT_0804d9b8
    mov        r1,#0xa
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0804d8e2:
    mov        r0,#0xdb
    bl         Flag_GetBase
    bne        LAB_0804d91e
    mov        r0,#0xd0
    bl         Flag_GetBase
    beq        LAB_0804d900
    push       {r5}
    ldr        r0,DAT_0804d9bc
    mov        r1,#0x13
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0804d900:
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x27
    bne        LAB_0804d91e
    mov        r0,#0xd1
    bl         Flag_SetBase
    push       {r5}
    ldr        r0,DAT_0804d9c0
    mov        r1,#0xa
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0804d91e:
    mov        r0,#0xdc
    bl         Flag_GetBase
    bne        LAB_0804d960
    mov        r0,#0xd2
    bl         Flag_GetBase
    beq        LAB_0804d93c
    push       {r5}
    ldr        r0,DAT_0804d9c4
    mov        r1,#0x14
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0804d93c:
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x28
    bne        LAB_0804d960
    mov        r0,#0xd3
    bl         Flag_SetBase
    mov        r0,#0xb6
    bl         Flag_GetBase
    bne        LAB_0804d960
    push       {r5}
    ldr        r0,PTR_FUN_08094b98_0804d9c8
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
    .word 0x8084071

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
    .word 0x8086E19

DAT_0804d988:
    .word 0x80848FD

DAT_0804d98c:
    .word 0x8086E19

DAT_0804d990:
    .word 0x80848FD

DAT_0804d994:
    .word 0x8086E19

DAT_0804d998:
    .word 0x80848FD

DAT_0804d99c:
    .word 0x8086E19

DAT_0804d9a0:
    .word 0x80848FD

DAT_0804d9a4:
    .word 0x8086E19

DAT_0804d9a8:
    .word 0x80848FD

DAT_0804d9ac:
    .word 0x8086E19

DAT_0804d9b0:
    .word 0x80848FD

DAT_0804d9b4:
    .word 0x8086E19

DAT_0804d9b8:
    .word 0x80848FD

DAT_0804d9bc:
    .word 0x8086E19

DAT_0804d9c0:
    .word 0x80848FD

DAT_0804d9c4:
    .word 0x8086E19

PTR_FUN_08094b98_0804d9c8:
    .word 0x8094B99
