#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set Scene_JackOut, 0x80836C8+1
    .set PlayerLocation_Create, 0x8056020+1
    .set FUN_0807db72, 0x807DB72+1


_ts MapSetup_School_Comp_1_S0
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,PTR_PTR_MapSetup_Default_08040750
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_803ECB0_08040754
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_803ECF8_08040758
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_803ED68_0804075c
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_803F138_08040760
    bl         BgTask_AddNew
    ldr        r0,PTR_EntityAllocParams_8041FDC_08040764
    bl         Entity_AllocList
    pop        {r5}
    pop        {pc}

    .align 2, 0

PTR_MapSetup_Default_080406a8:
    .word MapSetup_Default
    .word MapSetup_School_Comp_1_F01
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default


_ts EventHandler_S0_School_Comp_1
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Default_08040768
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Default_080406d4:
    .word EventHandler_Default
    .word EventHandler_School_Comp_1_F01
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default


_ts MapSetup_School_Comp_1_F01
    push       {lr}
    push       {r5}
    mov        r0,#0x7
    bl         Flag_Set400
    mov        r0,#0x2
    bl         Flag_Set400
    mov        r0,#0x95
    bl         Flag_GetBase
    pop        {r5}
    bne        LAB_0804071c
    push       {r5}
    ldr        r0,PTR_FUN_08083348_0804076c
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_08040728
LAB_0804071c:
    push       {r5}
    ldr        r0,PTR_FUN_08085104_08040770
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_08040728:
    push       {r5}
    ldr        r7,PTR_NPCList_8041B3C_08040774
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}

_ts EventHandler_School_Comp_1_F01
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Comp_1_F01_0_08040778
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_School_Comp_1_F01_0_08040748:
    .word EventHandler_School_Comp_1_F01_0


_ts EventHandler_School_Comp_1_F01_0
    push       {lr}
    pop        {pc}

PTR_PTR_MapSetup_Default_08040750:
    .word PTR_MapSetup_Default_080406a8

PTR_BgTask_803ECB0_08040754:
    .word BgTask_803ECB0

PTR_BgTask_803ECF8_08040758:
    .word BgTask_803ECF8

PTR_BgTask_803ED68_0804075c:
    .word BgTask_803ED68

PTR_BgTask_803F138_08040760:
    .word BgTask_803F138

PTR_EntityAllocParams_8041FDC_08040764:
    .word EntityAllocParams_8041FDC

PTR_PTR_EventHandler_Default_08040768:
    .word PTR_EventHandler_Default_080406d4

PTR_FUN_08083348_0804076c:
    .word 0x8083349

PTR_FUN_08085104_08040770:
    .word 0x8085105

PTR_NPCList_8041B3C_08040774:
    .word NPCList_8041B3C

PTR_PTR_EventHandler_School_Comp_1_F01_0_08040778:
    .word PTR_EventHandler_School_Comp_1_F01_0_08040748


_ts MapSetup_School_Comp_1_S1
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,PTR_PTR_MapSetup_Default_08040a88
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_803EC68_08040a8c
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_803ECF8_08040a90
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_803ED68_08040a94
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_803F138_08040a98
    bl         BgTask_AddNew
    ldr        r0,PTR_EntityAllocParams_8041FDC_08040a9c
    bl         Entity_AllocList
    pop        {r5}
    mov        r0,#0x0
    strb       r0,[r5,#0x1]
    pop        {pc}

    .align 2, 0

PTR_MapSetup_Default_080407b8:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_School_Comp_1_F12
    .word MapSetup_School_Comp_1_F13
    .word MapSetup_School_Comp_1_F14
    .word MapSetup_School_Comp_1_F15
    .word MapSetup_Default
    .word MapSetup_Default


_ts EventHandler_School_Comp_1_S1
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Default_08040aa0
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Default_080407e4:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_School_Comp_1_F12
    .word EventHandler_School_Comp_1_F13
    .word EventHandler_School_Comp_1_F14
    .word EventHandler_School_Comp_1_F15
    .word EventHandler_Default
    .word EventHandler_Default


_ts MapSetup_School_Comp_1_F12
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_8041C1C_08040aa4
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0xd6
    bl         Flag_GetBase
    beq        LAB_0804083c
    mov        r0,#0xd6
    bl         Flag_ClearBase
    push       {r5}
    ldr        r0,DAT_08040aa8
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_0804083c:
    push       {r5}
    mov        r0,#0xa6
    bl         Flag_GetBase
    pop        {r5}
    beq        LAB_08040854
    push       {r5}
    mov        r0,#0x0
    bl         Flag_Set380
    pop        {r5}
    b          LAB_08040864
LAB_08040854:
    push       {r5}
    mov        r1,#0x0
    bl         FUN_0807db72
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}
LAB_08040864:
    mov        r0,#0x8
    str        r0,[r5,#0x0]
    pop        {pc}

    .align 2, 0


_ts EventHandler_School_Comp_1_F12
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Comp_1_F12_0_08040aac
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    bl         FUN_08040a50
    pop        {pc}

PTR_EventHandler_School_Comp_1_F12_0_08040880:
    .word EventHandler_School_Comp_1_F12_0
    .word EventHandler_School_Comp_1_F12_1
    .word EventHandler_School_Comp_1_F12_2


_ts EventHandler_School_Comp_1_F12_0
    push       {lr}
    push       {r5}
    mov        r0,#0xa1
    bl         Flag_GetBase
    pop        {r5}
    bne        LAB_080408a6
    push       {r5}
    ldr        r0,PTR_FUN_08086c3c_08040ab0
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_080408a6:
    mov        r0,#0x4
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_School_Comp_1_F12_1
    push       {lr}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x20
    bne        LAB_080408c8
    push       {r5}
    mov        r1,#0x0
    ldr        r0,PTR_FUN_08087e34_08040ab4
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x8
    str        r0,[r5,#0x0]
LAB_080408c8:
    pop        {pc}


_nt EventHandler_School_Comp_1_F12_2
    push       {lr}
    pop        {pc}

    .align 2, 0


_ts MapSetup_School_Comp_1_F13
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_8041C34_08040ab8
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0xd6
    bl         Flag_GetBase
    beq        LAB_08040908
    mov        r0,#0xd6
    bl         Flag_ClearBase
    push       {r5}
    ldr        r0,DAT_08040abc
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_08040908:
    push       {r5}
    mov        r0,#0xa6
    bl         Flag_GetBase
    pop        {r5}
    beq        LAB_08040920
    push       {r5}
    mov        r0,#0x0
    bl         Flag_Set380
    pop        {r5}
    b          LAB_08040942
LAB_08040920:
    push       {r5}
    mov        r1,#0x0
    bl         FUN_0807db72
    pop        {r5}
    push       {r5}
    mov        r0,#0xa4
    bl         Flag_GetBase
    pop        {r5}
    beq        LAB_08040948
    push       {r5}
    ldr        r0,DAT_08040ac0
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_08040942:
    mov        r0,#0x4
    str        r0,[r5,#0x0]
    pop        {pc}
LAB_08040948:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}

    .align 2, 0


_ts EventHandler_School_Comp_1_F13
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Comp_1_F13_0_08040ac4
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    bl         FUN_08040a50
    pop        {pc}

PTR_EventHandler_School_Comp_1_F13_0_08040964:
    .word EventHandler_School_Comp_1_F13_0
    .word EventHandler_School_Comp_1_F13_1


_ts EventHandler_School_Comp_1_F13_0
    push       {lr}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x20
    bne        LAB_08040988
    push       {r5}
    mov        r1,#0x0
    ldr        r0,DAT_08040ac8
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x4
    str        r0,[r5,#0x0]
LAB_08040988:
    pop        {pc}


_nt EventHandler_School_Comp_1_F13_1
    push       {lr}
    pop        {pc}


_nt MapSetup_School_Comp_1_F14
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_8041C34_08040acc
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0xd6
    bl         Flag_GetBase
    beq        LAB_080409c6
    mov        r0,#0xd6
    bl         Flag_ClearBase
    push       {r5}
    ldr        r0,PTR_FUN_08084070_08040ad0
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_080409c6:
    mov        r0,#0x0
    bl         Flag_Set380
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_School_Comp_1_F14
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Comp_1_F14_0_08040ad4
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    bl         FUN_08040a50
    pop        {pc}

    .align 2, 0

PTR_EventHandler_School_Comp_1_F14_0_080409e8:
    .word EventHandler_School_Comp_1_F14_0


_ts EventHandler_School_Comp_1_F14_0
    push       {lr}
    pop        {pc}


_ts MapSetup_School_Comp_1_F15
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_8041C34_08040ad8
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0xd6
    bl         Flag_GetBase
    beq        LAB_08040a28
    mov        r0,#0xd6
    bl         Flag_ClearBase
    push       {r5}
    ldr        r0,PTR_FUN_08084070_08040adc
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_08040a28:
    mov        r0,#0x0
    bl         Flag_Set380
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_School_Comp_1_F15
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Comp_1_F15_0_08040ae0
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    bl         FUN_08040a50
    pop        {pc}

PTR_EventHandler_School_Comp_1_F15_0_08040a48:
    .word EventHandler_School_Comp_1_F15_0


_ts EventHandler_School_Comp_1_F15_0
    push       {lr}
    pop        {pc}


_ts FUN_08040a50
    push       {lr}
    bl         Scene_IsSceneActive
    tst        r0,r0
    bne        LAB_08040a84
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08040a84
    mov        r0,r10
    ldr        r0,[r0,#0x4]
    ldrh       r0,[r0,#0x2]
    ldr        r1,DAT_08040ae4
    and        r1,r0
    beq        LAB_08040a84
    bl         dummy_187a0
    bne        LAB_08040a84
    push       {r5}
    ldr        r0,PTR_Scene_JackOut_08040ae8
    mov        r1,#0x1
    bl         Scene_Prepare
    pop        {r5}
LAB_08040a84:
    pop        {pc}

    .align 2, 0

PTR_PTR_MapSetup_Default_08040a88:
    .word PTR_MapSetup_Default_080407b8

PTR_BgTask_803EC68_08040a8c:
    .word BgTask_803EC68

PTR_BgTask_803ECF8_08040a90:
    .word BgTask_803ECF8

PTR_BgTask_803ED68_08040a94:
    .word BgTask_803ED68

PTR_BgTask_803F138_08040a98:
    .word BgTask_803F138

PTR_EntityAllocParams_8041FDC_08040a9c:
    .word EntityAllocParams_8041FDC

PTR_PTR_EventHandler_Default_08040aa0:
    .word PTR_EventHandler_Default_080407e4

PTR_NPCList_8041C1C_08040aa4:
    .word NPCList_8041C1C

DAT_08040aa8:
    .word 0x8084071

PTR_PTR_EventHandler_School_Comp_1_F12_0_08040aac:
    .word PTR_EventHandler_School_Comp_1_F12_0_08040880

PTR_FUN_08086c3c_08040ab0:
    .word 0x8086C3D

PTR_FUN_08087e34_08040ab4:
    .word 0x8087E35

PTR_NPCList_8041C34_08040ab8:
    .word NPCList_8041C34

DAT_08040abc:
    .word 0x8084071

DAT_08040ac0:
    .word 0x8086E19

PTR_PTR_EventHandler_School_Comp_1_F13_0_08040ac4:
    .word PTR_EventHandler_School_Comp_1_F13_0_08040964

DAT_08040ac8:
    .word 0x8087E35

PTR_NPCList_8041C34_08040acc:
    .word NPCList_8041C34

PTR_FUN_08084070_08040ad0:
    .word 0x8084071

PTR_PTR_EventHandler_School_Comp_1_F14_0_08040ad4:
    .word PTR_EventHandler_School_Comp_1_F14_0_080409e8

PTR_NPCList_8041C34_08040ad8:
    .word NPCList_8041C34

PTR_FUN_08084070_08040adc:
    .word 0x8084071

PTR_PTR_EventHandler_School_Comp_1_F15_0_08040ae0:
    .word PTR_EventHandler_School_Comp_1_F15_0_08040a48

DAT_08040ae4:
    .word 0x100

PTR_Scene_JackOut_08040ae8:
    .word Scene_JackOut


_ts MapSetup_School_Comp_1_S2
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,PTR_PTR_MapSetup_School_Comp_1_F20_08040bd0
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_803ECB0_08040bd4
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_803ECF8_08040bd8
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_803ED68_08040bdc
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_803F138_08040be0
    bl         BgTask_AddNew
    ldr        r0,PTR_EntityAllocParams_8041FDC_08040be4
    bl         Entity_AllocList
    ldr        r7,PTR_NPCList_8041CCC_08040be8
    bl         Map_LoadNPCList
    pop        {r5}
    pop        {pc}

PTR_MapSetup_School_Comp_1_F20_08040b28:
    .word MapSetup_School_Comp_1_F20
    .word MapSetup_School_Comp_1_F20
    .word MapSetup_School_Comp_1_F20
    .word MapSetup_School_Comp_1_F20
    .word MapSetup_School_Comp_1_F20
    .word MapSetup_School_Comp_1_F20
    .word MapSetup_School_Comp_1_F20
    .word MapSetup_School_Comp_1_F20


_ts EventHandler_School_Comp_1_S2
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Comp_1_F20_08040bec
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_School_Comp_1_F20_08040b54:
    .word EventHandler_School_Comp_1_F20
    .word EventHandler_School_Comp_1_F20
    .word EventHandler_School_Comp_1_F20
    .word EventHandler_School_Comp_1_F20
    .word EventHandler_School_Comp_1_F20
    .word EventHandler_School_Comp_1_F20
    .word EventHandler_School_Comp_1_F20
    .word EventHandler_School_Comp_1_F20


_ts MapSetup_School_Comp_1_F20
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
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    bne        LAB_08040b98
    cmp        r1,#0x80
    beq        LAB_08040ba4
LAB_08040b98:
    push       {r5}
    ldr        r0,DAT_08040bf0
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_08040ba4:
    mov        r0,#0x0
    bl         Flag_Set380
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_School_Comp_1_F20
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Comp_1_F20_0_08040bf4
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}

    .align 2, 0

PTR_EventHandler_School_Comp_1_F20_0_08040bc8:
    .word EventHandler_School_Comp_1_F20_0


_ts EventHandler_School_Comp_1_F20_0
    push       {lr}
    pop        {pc}

PTR_PTR_MapSetup_School_Comp_1_F20_08040bd0:
    .word PTR_MapSetup_School_Comp_1_F20_08040b28

PTR_BgTask_803ECB0_08040bd4:
    .word BgTask_803ECB0

PTR_BgTask_803ECF8_08040bd8:
    .word BgTask_803ECF8

PTR_BgTask_803ED68_08040bdc:
    .word BgTask_803ED68

PTR_BgTask_803F138_08040be0:
    .word BgTask_803F138

PTR_EntityAllocParams_8041FDC_08040be4:
    .word EntityAllocParams_8041FDC

PTR_NPCList_8041CCC_08040be8:
    .word NPCList_8041CCC

PTR_PTR_EventHandler_School_Comp_1_F20_08040bec:
    .word PTR_EventHandler_School_Comp_1_F20_08040b54

DAT_08040bf0:
    .word 0x8084071

PTR_PTR_EventHandler_School_Comp_1_F20_0_08040bf4:
    .word PTR_EventHandler_School_Comp_1_F20_0_08040bc8
