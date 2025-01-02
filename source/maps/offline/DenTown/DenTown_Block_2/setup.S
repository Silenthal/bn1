#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_DenTown_Block_2_S3
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_DenTown_Block_2_F30_08037824
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_803A954_08037828
    bl         Entity_AllocList
    pop        {r5}
    Flag_GetBase 0xBD
    bne        LAB_08037600
    Flag_GetBase 0xA6
    beq        LAB_080375e0
    mov        r0,#0x4
    bl         Sound_ChangeSong
    b          LAB_08037604
LAB_080375e0:
    Flag_GetBase 0x9B
    beq        LAB_080375f0
    mov        r0,#0x3
    bl         Sound_ChangeSong
    b          LAB_08037604
LAB_080375f0:
    Flag_GetBase 0x98
    beq        LAB_08037600
    mov        r0,#0x4
    bl         Sound_ChangeSong
    b          LAB_08037604
LAB_08037600:
    bl         Sound_AreaSongChange
LAB_08037604:
    pop        {pc}

    .align 2, 0

PTR_MapSetup_DenTown_Block_2_F30_08037608:
    .word MapSetup_DenTown_Block_2_F30
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_DenTown_Block_2_F34
    .word MapSetup_DenTown_Block_2_F35
    .word MapSetup_Default
    .word MapSetup_Default


_ts EventHandler_DenTown_Block_2_S3
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_DenTown_Block_2_F30_0803782c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         FUN_0803779c
    pop        {pc}

PTR_EventHandler_DenTown_Block_2_F30_08037638:
    .word EventHandler_DenTown_Block_2_F30
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_DenTown_Block_2_F34
    .word EventHandler_DenTown_Block_2_F35
    .word EventHandler_Default
    .word EventHandler_Default


_ts MapSetup_DenTown_Block_2_F30
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
    ldr        r7,PTR_NPCList_80392E4_08037830
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_DenTown_Block_2_F30
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_DenTown_Block_2_F30_0_08037834
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    bl         Traffic_Main
    pop        {pc}

PTR_EventHandler_DenTown_Block_2_F30_0_08037698:
    .word EventHandler_DenTown_Block_2_F30_0


_ts EventHandler_DenTown_Block_2_F30_0
    push       {lr}
    pop        {pc}


_ts MapSetup_DenTown_Block_2_F34
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    Flag_ClearIgnore F_IGNORE_DOOR_00
    Flag_ClearIgnore F_IGNORE_DOOR_01
    mov        r0,#0x0
    strb       r0,[r5,#0x8]
    strb       r0,[r5,#0x9]
    mov        r0,#0x2
    strb       r0,[r5,#0xa]
    strb       r0,[r5,#0xb]
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_803A9A8_08037838
    bl         Entity_AllocList
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_80392E4_0803783c
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_DenTown_Block_2_F34
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_DenTown_Block_2_F34_0_08037840
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_DenTown_Block_2_F34_0_080376f8:
    .word EventHandler_DenTown_Block_2_F34_0


_ts EventHandler_DenTown_Block_2_F34_0
    push       {lr}
    pop        {pc}


_ts MapSetup_DenTown_Block_2_F35
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_80392E4_08037844
    bl         Map_LoadNPCList
    pop        {r5}
    Flag_GetBase 0xAF
    bne        LAB_08037748
    LoadMain world, r0, r0
    mov        r1,#0x0
    strb       r1,[r0,#0x7]
    mov        r0,#0x0
    strb       r0,[r5,#0x8]
    strb       r0,[r5,#0x9]
    mov        r0,#0x2
    strb       r0,[r5,#0xa]
    strb       r0,[r5,#0xb]
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_803AB3C_08037848
    bl         Entity_AllocList
    pop        {r5}
    mov        r0,#0x0
    b          LAB_08037766
LAB_08037748:
    Flag_SetIgnore F_IGNORE_DOOR_00
    mov        r0,#0x2
    strb       r0,[r5,#0x8]
    strb       r0,[r5,#0xa]
    mov        r0,#0x0
    strb       r0,[r5,#0x9]
    strb       r0,[r5,#0xb]
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_803AB3C_0803784c
    bl         Entity_AllocList
    pop        {r5}
    mov        r0,#0x4
LAB_08037766:
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_DenTown_Block_2_F35
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_DenTown_Block_2_F35_0_08037850
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_DenTown_Block_2_F35_0_0803777c:
    .word EventHandler_DenTown_Block_2_F35_0
    .word EventHandler_DenTown_Block_2_F35_1


_ts EventHandler_DenTown_Block_2_F35_0
    push       {lr}
    push       {r5}
    ldr        r0,PTR_Scene_Story_41_08037854
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x4
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_DenTown_Block_2_F35_1
    push       {lr}
    pop        {pc}


_ts FUN_0803779c
    push       {lr}
    bl         Scene_IsSceneActive
    tst        r0,r0
    beq        LAB_080377a8
    pop        {pc}
LAB_080377a8:
    LoadMain world, r0, r7
    ldrb       r1,[r0,#0xe]
    cmp        r1,#0x20
    bne        LAB_080377be
    push       {r5}
    ldr        r0,PTR_Scene_Dialogue_08037858
    mov        r1,#0x3
    bl         Scene_Prepare
    pop        {r5}
LAB_080377be:
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#0x28]
    mov        r1,#0x8
    strh       r1,[r0,#0x2e]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    LoadMain world, r7, r7
    ldr        r7,[r7,#0x28]
    mov        r1,#0x0
    strh       r1,[r7,#0x2e]
    pop        {r5}
    cmp        r0,#0x40
    bne        LAB_08037822
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08037822
    LoadMain input, r0, r0
    ldrh       r0,[r0,#0x2]
    ldr        r1,DAT_0803785c
    and        r1,r0
    beq        LAB_08037822
    bl         dummy_187a0
    bne        LAB_08037822
    LoadMain world, r0, r0
    ldrb       r1,[r0,#0x6]
    cmp        r1,#0x30
    bne        LAB_08037816
    push       {r5}
    ldr        r0,PTR_Scene_Dialogue_08037860
    mov        r1,#0x4
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_08037816:
    push       {r5}
    ldr        r0,PTR_Scene_JackIn_08037864
    mov        r1,#0x10
    bl         Scene_Prepare
    pop        {r5}
LAB_08037822:
    pop        {pc}

PTR_PTR_MapSetup_DenTown_Block_2_F30_08037824:
    .word PTR_MapSetup_DenTown_Block_2_F30_08037608

PTR_EntityAllocParams_803A954_08037828:
    .word EntityAllocParams_803A954

PTR_PTR_EventHandler_DenTown_Block_2_F30_0803782c:
    .word PTR_EventHandler_DenTown_Block_2_F30_08037638

PTR_NPCList_80392E4_08037830:
    .word NPCList_80392E4

PTR_PTR_EventHandler_DenTown_Block_2_F30_0_08037834:
    .word PTR_EventHandler_DenTown_Block_2_F30_0_08037698

PTR_EntityAllocParams_803A9A8_08037838:
    .word EntityAllocParams_803A9A8

PTR_NPCList_80392E4_0803783c:
    .word NPCList_80392E4

PTR_PTR_EventHandler_DenTown_Block_2_F34_0_08037840:
    .word PTR_EventHandler_DenTown_Block_2_F34_0_080376f8

PTR_NPCList_80392E4_08037844:
    .word NPCList_80392E4

PTR_EntityAllocParams_803AB3C_08037848:
    .word EntityAllocParams_803AB3C

PTR_EntityAllocParams_803AB3C_0803784c:
    .word EntityAllocParams_803AB3C

PTR_PTR_EventHandler_DenTown_Block_2_F35_0_08037850:
    .word PTR_EventHandler_DenTown_Block_2_F35_0_0803777c

PTR_Scene_Story_41_08037854:
    .word Scene_Story_41

PTR_Scene_Dialogue_08037858:
    .word Scene_Dialogue

DAT_0803785c:
    .word 0x100

PTR_Scene_Dialogue_08037860:
    .word Scene_Dialogue

PTR_Scene_JackIn_08037864:
    .word Scene_JackIn


_ts MapSetup_DenTown_Block_2_S4
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_DenTown_Block_2_F40_08037988
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_803A954_0803798c
    bl         Entity_AllocList
    pop        {r5}
    bl         Traffic_Init
    bl         Sound_AreaSongChange
    pop        {pc}

    .align 2, 0

PTR_MapSetup_DenTown_Block_2_F40_08037888:
    .word MapSetup_DenTown_Block_2_F40
    .word MapSetup_DenTown_Block_2_F40
    .word MapSetup_DenTown_Block_2_F40
    .word MapSetup_DenTown_Block_2_F40
    .word MapSetup_DenTown_Block_2_F40
    .word MapSetup_DenTown_Block_2_F40
    .word MapSetup_DenTown_Block_2_F40
    .word MapSetup_DenTown_Block_2_F40


_ts EventHandler_DenTown_Block_2_S4
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_DenTown_Block_2_F40_08037990
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         FUN_08037918
    bl         Traffic_Main
    pop        {pc}

PTR_EventHandler_DenTown_Block_2_F40_080378bc:
    .word EventHandler_DenTown_Block_2_F40
    .word EventHandler_DenTown_Block_2_F40
    .word EventHandler_DenTown_Block_2_F40
    .word EventHandler_DenTown_Block_2_F40
    .word EventHandler_DenTown_Block_2_F40
    .word EventHandler_DenTown_Block_2_F40
    .word EventHandler_DenTown_Block_2_F40
    .word EventHandler_DenTown_Block_2_F40


_ts MapSetup_DenTown_Block_2_F40
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_80392E4_08037994
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_DenTown_Block_2_F40
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_DenTown_Block_2_F40_0_08037998
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_DenTown_Block_2_F40_0_08037910:
    .word EventHandler_DenTown_Block_2_F40_0


_ts EventHandler_DenTown_Block_2_F40_0
    push       {lr}
    pop        {pc}


_ts FUN_08037918
    push       {lr}
    bl         Scene_IsSceneActive
    tst        r0,r0
    beq        LAB_08037924
    pop        {pc}
LAB_08037924:
    LoadMain world, r0, r7
    ldrb       r1,[r0,#0xe]
    cmp        r1,#0x20
    bne        LAB_0803793a
    push       {r5}
    ldr        r0,PTR_Scene_Dialogue_0803799c
    mov        r1,#0x3
    bl         Scene_Prepare
    pop        {r5}
LAB_0803793a:
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#0x28]
    mov        r1,#0x8
    strh       r1,[r0,#0x2e]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    LoadMain world, r7, r7
    ldr        r7,[r7,#0x28]
    mov        r1,#0x0
    strh       r1,[r7,#0x2e]
    pop        {r5}
    cmp        r0,#0x40
    bne        LAB_08037986
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08037986
    LoadMain input, r0, r0
    ldrh       r0,[r0,#0x2]
    ldr        r1,DAT_080379a0
    and        r1,r0
    beq        LAB_08037986
    bl         dummy_187a0
    bne        LAB_08037986
    push       {r5}
    ldr        r0,PTR_Scene_JackIn_080379a4
    mov        r1,#0x10
    bl         Scene_Prepare
    pop        {r5}
LAB_08037986:
    pop        {pc}

PTR_PTR_MapSetup_DenTown_Block_2_F40_08037988:
    .word PTR_MapSetup_DenTown_Block_2_F40_08037888

PTR_EntityAllocParams_803A954_0803798c:
    .word EntityAllocParams_803A954

PTR_PTR_EventHandler_DenTown_Block_2_F40_08037990:
    .word PTR_EventHandler_DenTown_Block_2_F40_080378bc

PTR_NPCList_80392E4_08037994:
    .word NPCList_80392E4

PTR_PTR_EventHandler_DenTown_Block_2_F40_0_08037998:
    .word PTR_EventHandler_DenTown_Block_2_F40_0_08037910

PTR_Scene_Dialogue_0803799c:
    .word Scene_Dialogue

DAT_080379a0:
    .word 0x100

PTR_Scene_JackIn_080379a4:
    .word Scene_JackIn


_ts MapSetup_DenTown_Block_2_S5
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_DenTown_Block_2_F50_08037ae0
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_803A954_08037ae4
    bl         Entity_AllocList
    pop        {r5}
    bl         Traffic_Init
    bl         Sound_AreaSongChange
    pop        {pc}

    .align 2, 0

PTR_MapSetup_DenTown_Block_2_F50_080379c8:
    .word MapSetup_DenTown_Block_2_F50
    .word MapSetup_DenTown_Block_2_F50
    .word MapSetup_DenTown_Block_2_F50
    .word MapSetup_DenTown_Block_2_F50
    .word MapSetup_DenTown_Block_2_F50
    .word MapSetup_DenTown_Block_2_F50
    .word MapSetup_DenTown_Block_2_F50
    .word MapSetup_DenTown_Block_2_F50


_ts EventHandler_DenTown_Block_2_S5
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_DenTown_Block_2_F50_08037ae8
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         FUN_08037a70
    bl         Traffic_Main
    pop        {pc}

PTR_EventHandler_DenTown_Block_2_F50_080379fc:
    .word EventHandler_DenTown_Block_2_F50
    .word EventHandler_DenTown_Block_2_F50
    .word EventHandler_DenTown_Block_2_F50
    .word EventHandler_DenTown_Block_2_F50
    .word EventHandler_DenTown_Block_2_F50
    .word EventHandler_DenTown_Block_2_F50
    .word EventHandler_DenTown_Block_2_F50
    .word EventHandler_DenTown_Block_2_F50


_ts MapSetup_DenTown_Block_2_F50
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    LoadMain world, r7, r7
    ldrb       r0,[r7,#0x6]
    cmp        r0,#0x53
    bge        LAB_08037a46
    push       {r5}
    ldr        r7,PTR_NPCList_8039348_08037aec
    bl         Map_LoadNPCList
    pop        {r5}
    b          LAB_08037a50
LAB_08037a46:
    push       {r5}
    ldr        r7,PTR_NPCList_8039358_08037af0
    bl         Map_LoadNPCList
    pop        {r5}
LAB_08037a50:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_DenTown_Block_2_F50
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_DenTown_Block_2_F50_0_08037af4
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_DenTown_Block_2_F50_0_08037a68:
    .word EventHandler_DenTown_Block_2_F50_0


_ts EventHandler_DenTown_Block_2_F50_0
    push       {lr}
    pop        {pc}


_ts FUN_08037a70
    push       {lr}
    bl         Scene_IsSceneActive
    tst        r0,r0
    beq        LAB_08037a7c
    pop        {pc}
LAB_08037a7c:
    LoadMain world, r0, r7
    ldrb       r1,[r0,#0xe]
    cmp        r1,#0x20
    bne        LAB_08037a92
    push       {r5}
    ldr        r0,PTR_Scene_Dialogue_08037af8
    mov        r1,#0x3
    bl         Scene_Prepare
    pop        {r5}
LAB_08037a92:
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#0x28]
    mov        r1,#0x8
    strh       r1,[r0,#0x2e]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    LoadMain world, r7, r7
    ldr        r7,[r7,#0x28]
    mov        r1,#0x0
    strh       r1,[r7,#0x2e]
    pop        {r5}
    cmp        r0,#0x40
    bne        LAB_08037ade
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08037ade
    LoadMain input, r0, r0
    ldrh       r0,[r0,#0x2]
    ldr        r1,DAT_08037afc
    and        r1,r0
    beq        LAB_08037ade
    bl         dummy_187a0
    bne        LAB_08037ade
    push       {r5}
    ldr        r0,PTR_Scene_JackIn_08037b00
    mov        r1,#0x10
    bl         Scene_Prepare
    pop        {r5}
LAB_08037ade:
    pop        {pc}

PTR_PTR_MapSetup_DenTown_Block_2_F50_08037ae0:
    .word PTR_MapSetup_DenTown_Block_2_F50_080379c8

PTR_EntityAllocParams_803A954_08037ae4:
    .word EntityAllocParams_803A954

PTR_PTR_EventHandler_DenTown_Block_2_F50_08037ae8:
    .word PTR_EventHandler_DenTown_Block_2_F50_080379fc

PTR_NPCList_8039348_08037aec:
    .word NPCList_8039348

PTR_NPCList_8039358_08037af0:
    .word NPCList_8039358

PTR_PTR_EventHandler_DenTown_Block_2_F50_0_08037af4:
    .word PTR_EventHandler_DenTown_Block_2_F50_0_08037a68

PTR_Scene_Dialogue_08037af8:
    .word Scene_Dialogue

DAT_08037afc:
    .word 0x100

PTR_Scene_JackIn_08037b00:
    .word Scene_JackIn
