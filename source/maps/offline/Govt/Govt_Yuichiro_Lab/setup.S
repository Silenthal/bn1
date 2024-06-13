#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set Scene_JackIn, 0x8083EEC+1
    .set Scene_Dialogue, 0x80848FC+1


_ts MapSetup_Govt_Yuichiro_Lab_S2
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_Default_080339bc
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r0,#0xab
    bl         Flag_GetBase
    beq        LAB_080336f2
    push       {r5}
    mov        r0,#0x4
    bl         Sound_ChangeSong
    pop        {r5}
    b          LAB_0803370a
LAB_080336f2:
    mov        r0,#0xdf
    bl         Flag_GetBase
    beq        LAB_08033706
    push       {r5}
    mov        r0,#0x3
    bl         Sound_ChangeSong
    pop        {r5}
    b          LAB_0803370a
LAB_08033706:
    bl         Sound_AreaSongChange
LAB_0803370a:
    pop        {pc}

PTR_MapSetup_Default_0803370c:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Govt_Yuichiro_Lab_F22
    .word MapSetup_Default
    .word MapSetup_Govt_Yuichiro_Lab_F24
    .word MapSetup_Govt_Yuichiro_Lab_F25
    .word MapSetup_Govt_Yuichiro_Lab_F25
    .word MapSetup_Govt_Yuichiro_Lab_F25


_ts EventHandler_Govt_Yuichiro_Lab_S2
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Default_080339c0
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r0,#0x41
    mov        r1,#0x23
    bl         CheckForJackIn
    pop        {pc}

PTR_EventHandler_Default_08033740:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Govt_Yuichiro_Lab_F22
    .word EventHandler_Default
    .word EventHandler_Govt_Yuichiro_Lab_F24
    .word EventHandler_Govt_Yuichiro_Lab_F25
    .word EventHandler_Govt_Yuichiro_Lab_F25
    .word EventHandler_Govt_Yuichiro_Lab_F25


_ts MapSetup_Govt_Yuichiro_Lab_F22
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_NPCList_8035844_080339c4
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    bl         Flag_Set410
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_Govt_Yuichiro_Lab_F22
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Yuichiro_Lab_F22_0_080339c8
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    bl         FUN_080338d0
    bl         FUN_0803391c
    pop        {pc}

    .align 2, 0

PTR_EventHandler_Govt_Yuichiro_Lab_F22_0_080337a0:
    .word EventHandler_Govt_Yuichiro_Lab_F22_0


_ts EventHandler_Govt_Yuichiro_Lab_F22_0
    push       {lr}
    pop        {pc}


_ts MapSetup_Govt_Yuichiro_Lab_F24
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_NPCList_8035844_080339cc
    bl         Map_LoadNPCList
    mov        r0,#0x0
    bl         Flag_Set410
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_Govt_Yuichiro_Lab_F24
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Yuichiro_Lab_F24_0_080339d0
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    bl         FUN_080338d0
    bl         FUN_0803391c
    pop        {pc}

    .align 2, 0

PTR_EventHandler_Govt_Yuichiro_Lab_F24_0_080337e8:
    .word EventHandler_Govt_Yuichiro_Lab_F24_0
    .word EventHandler_Govt_Yuichiro_Lab_F24_1


_ts EventHandler_Govt_Yuichiro_Lab_F24_0
    push       {lr}
    mov        r0,#0xbd
    bl         Flag_GetBase
    beq        LAB_0803381e
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x10
    bne        LAB_0803381e
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x4
    str        r0,[r5,#0x0]
LAB_0803381e:
    pop        {pc}


_ts EventHandler_Govt_Yuichiro_Lab_F24_1
    push       {lr}
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08033850
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    mov        r1,#0x25
    strb       r1,[r0,#0x6]
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x2c]
    mov        r1,#0x1
    strb       r1,[r0,#0x10]
    mov        r1,#0x1
    strb       r1,[r0,#0x12]
    ldr        r1,PTR_MapEntrance_080339d4
    str        r1,[r0,#0x14]
    mov        r0,#0x0
    bl         World_ChangeMap
    pop        {r5}
LAB_08033850:
    pop        {pc}

    .align 2, 0

MapEntrance_08033854:
    MapEntrance Map_Govt_Yuichiro_Lab, d_s, f(80, 102, 0)


_ts MapSetup_Govt_Yuichiro_Lab_F25
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    mov        r0,#0x0
    bl         Flag_Set410
    mov        r4,#0x4
    mov        r0,#0xbf
    bl         Flag_GetBase
    bne        LAB_08033892
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    mov        r1,#0x0
    strb       r1,[r0,#0x7]
    mov        r4,#0x0
LAB_08033892:
    str        r4,[r5,#0x0]
    pop        {pc}


_nt EventHandler_Govt_Yuichiro_Lab_F25
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Yuichiro_Lab_F25_0_080339d8
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    bl         FUN_080338d0
    bl         FUN_0803391c
    pop        {pc}

    .align 2, 0

PTR_EventHandler_Govt_Yuichiro_Lab_F25_0_080338b0:
    .word EventHandler_Govt_Yuichiro_Lab_F25_0
    .word EventHandler_Govt_Yuichiro_Lab_F25_1


_ts EventHandler_Govt_Yuichiro_Lab_F25_0
    push       {lr}
    push       {r5}
    ldr        r0,PTR_FUN_08089508_080339dc
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Govt_Yuichiro_Lab_F25_1
    push       {lr}
    pop        {pc}


_ts FUN_080338d0
    push       {lr}
    bl         Scene_IsSceneActive
    tst        r0,r0
    beq        LAB_080338dc
    pop        {pc}
LAB_080338dc:
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0803391a
    mov        r0,r10
    ldr        r0,[r0,#0x4]
    ldrh       r0,[r0,#0x2]
    ldr        r1,DAT_080339e0
    and        r1,r0
    beq        LAB_0803391a
    bl         dummy_187a0
    bne        LAB_0803391a
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x40
    bne        LAB_0803391a
    push       {r5}
    ldr        r0,PTR_Scene_JackIn_080339e4
    mov        r1,#0xc
    bl         Scene_Prepare
    pop        {r5}
LAB_0803391a:
    pop        {pc}


_ts FUN_0803391c
    push       {lr}
    bl         Scene_IsSceneActive
    tst        r0,r0
    bne        LAB_080339ba
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0xe]
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x22
    bne        LAB_08033944
    push       {r5}
    ldr        r0,PTR_Scene_Dialogue_080339e8
    mov        r1,#0x1
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_080339ba
LAB_08033944:
    cmp        r0,#0x21
    bne        LAB_08033956
    push       {r5}
    ldr        r0,PTR_Scene_Dialogue_080339ec
    mov        r1,#0x10
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_080339ba
LAB_08033956:
    cmp        r0,#0x20
    bne        LAB_0803397e
    mov        r0,#0xe2
    bl         Flag_GetBase
    bne        LAB_08033970
    push       {r5}
    ldr        r0,PTR_Scene_Dialogue_080339f0
    mov        r1,#0xd
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_080339ba
LAB_08033970:
    push       {r5}
    ldr        r0,PTR_FUN_08087e34_080339f4
    mov        r1,#0xf
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_080339ba
LAB_0803397e:
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x1
    bne        LAB_080339ba
    mov        r0,#0xe2
    bl         Flag_GetBase
    bne        LAB_080339a8
    push       {r5}
    ldr        r0,PTR_FUN_08082de4_080339f8
    ldr        r1,DAT_080339fc
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_080339ba
LAB_080339a8:
    push       {r5}
    mov        r1,#0xb
    lsl        r1,r1,#0x8
    mov        r0,#0x3
    orr        r1,r0
    ldr        r0,PTR_FUN_08082de4_08033a00
    bl         Scene_Prepare
    pop        {r5}
LAB_080339ba:
    pop        {pc}

PTR_PTR_MapSetup_Default_080339bc:
    .word PTR_MapSetup_Default_0803370c

PTR_PTR_EventHandler_Default_080339c0:
    .word PTR_EventHandler_Default_08033740

PTR_NPCList_8035844_080339c4:
    .word NPCList_8035844

PTR_PTR_EventHandler_Govt_Yuichiro_Lab_F22_0_080339c8:
    .word PTR_EventHandler_Govt_Yuichiro_Lab_F22_0_080337a0

PTR_NPCList_8035844_080339cc:
    .word NPCList_8035844

PTR_PTR_EventHandler_Govt_Yuichiro_Lab_F24_0_080339d0:
    .word PTR_EventHandler_Govt_Yuichiro_Lab_F24_0_080337e8

PTR_MapEntrance_080339d4:
    .word MapEntrance_08033854

PTR_PTR_EventHandler_Govt_Yuichiro_Lab_F25_0_080339d8:
    .word PTR_EventHandler_Govt_Yuichiro_Lab_F25_0_080338b0

PTR_FUN_08089508_080339dc:
    .word 0x8089509

DAT_080339e0:
    .word 0x100

PTR_Scene_JackIn_080339e4:
    .word Scene_JackIn

PTR_Scene_Dialogue_080339e8:
    .word Scene_Dialogue

PTR_Scene_Dialogue_080339ec:
    .word Scene_Dialogue

PTR_Scene_Dialogue_080339f0:
    .word Scene_Dialogue

PTR_FUN_08087e34_080339f4:
    .word 0x8087E35

PTR_FUN_08082de4_080339f8:
    .word 0x8082DE5

DAT_080339fc:
    .word 0xD03

PTR_FUN_08082de4_08033a00:
    .word 0x8082DE5


_ts MapSetup_Govt_Yuichiro_Lab_S3
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_Govt_Yuichiro_Lab_F30_08033b74
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Sound_AreaSongChange
    pop        {pc}

PTR_MapSetup_Govt_Yuichiro_Lab_F30_08033a14:
    .word MapSetup_Govt_Yuichiro_Lab_F30
    .word MapSetup_Govt_Yuichiro_Lab_F30
    .word MapSetup_Govt_Yuichiro_Lab_F30
    .word MapSetup_Govt_Yuichiro_Lab_F30
    .word MapSetup_Govt_Yuichiro_Lab_F30
    .word MapSetup_Govt_Yuichiro_Lab_F30
    .word MapSetup_Govt_Yuichiro_Lab_F30
    .word MapSetup_Govt_Yuichiro_Lab_F30


_ts EventHandler_Govt_Yuichiro_Lab_S3
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Yuichiro_Lab_F30_08033b78
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r0,#0x41
    mov        r1,#0x23
    bl         CheckForJackIn
    pop        {pc}

PTR_EventHandler_Govt_Yuichiro_Lab_F30_08033a48:
    .word EventHandler_Govt_Yuichiro_Lab_F30
    .word EventHandler_Govt_Yuichiro_Lab_F30
    .word EventHandler_Govt_Yuichiro_Lab_F30
    .word EventHandler_Govt_Yuichiro_Lab_F30
    .word EventHandler_Govt_Yuichiro_Lab_F30
    .word EventHandler_Govt_Yuichiro_Lab_F30
    .word EventHandler_Govt_Yuichiro_Lab_F30
    .word EventHandler_Govt_Yuichiro_Lab_F30


_ts MapSetup_Govt_Yuichiro_Lab_F30
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_8035844_08033b7c
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    bl         Flag_Set410
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_Govt_Yuichiro_Lab_F30
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Yuichiro_Lab_F30_0_08033b80
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    bl         FUN_08033ab4
    bl         FUN_08033b00
    pop        {pc}

    .align 2, 0

PTR_EventHandler_Govt_Yuichiro_Lab_F30_0_08033aac:
    .word EventHandler_Govt_Yuichiro_Lab_F30_0


_ts EventHandler_Govt_Yuichiro_Lab_F30_0
    push       {lr}
    pop        {pc}


_ts FUN_08033ab4
    push       {lr}
    bl         Scene_IsSceneActive
    tst        r0,r0
    beq        LAB_08033ac0
    pop        {pc}
LAB_08033ac0:
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08033afe
    mov        r0,r10
    ldr        r0,[r0,#0x4]
    ldrh       r0,[r0,#0x2]
    ldr        r1,DAT_08033b84
    and        r1,r0
    beq        LAB_08033afe
    bl         dummy_187a0
    bne        LAB_08033afe
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x40
    bne        LAB_08033afe
    push       {r5}
    ldr        r0,PTR_Scene_JackIn_08033b88
    mov        r1,#0x15
    bl         Scene_Prepare
    pop        {r5}
LAB_08033afe:
    pop        {pc}


_ts FUN_08033b00
    push       {lr}
    bl         Scene_IsSceneActive
    tst        r0,r0
    bne        LAB_08033b72
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0xe]
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x22
    bne        LAB_08033b28
    push       {r5}
    ldr        r0,PTR_Scene_Dialogue_08033b8c
    mov        r1,#0x1
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_08033b72
LAB_08033b28:
    cmp        r0,#0x21
    bne        LAB_08033b3a
    push       {r5}
    ldr        r0,PTR_Scene_Dialogue_08033b90
    mov        r1,#0x10
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_08033b72
LAB_08033b3a:
    cmp        r0,#0x20
    bne        LAB_08033b4c
    push       {r5}
    ldr        r0,PTR_FUN_08087e34_08033b94
    mov        r1,#0xf
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_08033b72
LAB_08033b4c:
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x1
    bne        LAB_08033b72
    push       {r5}
    mov        r1,#0xb
    lsl        r1,r1,#0x8
    mov        r0,#0x3
    orr        r1,r0
    ldr        r0,PTR_FUN_08082de4_08033b98
    bl         Scene_Prepare
    pop        {r5}
LAB_08033b72:
    pop        {pc}

PTR_PTR_MapSetup_Govt_Yuichiro_Lab_F30_08033b74:
    .word PTR_MapSetup_Govt_Yuichiro_Lab_F30_08033a14

PTR_PTR_EventHandler_Govt_Yuichiro_Lab_F30_08033b78:
    .word PTR_EventHandler_Govt_Yuichiro_Lab_F30_08033a48

PTR_NPCList_8035844_08033b7c:
    .word NPCList_8035844

PTR_PTR_EventHandler_Govt_Yuichiro_Lab_F30_0_08033b80:
    .word PTR_EventHandler_Govt_Yuichiro_Lab_F30_0_08033aac

DAT_08033b84:
    .word 0x100

PTR_Scene_JackIn_08033b88:
    .word Scene_JackIn

PTR_Scene_Dialogue_08033b8c:
    .word Scene_Dialogue

PTR_Scene_Dialogue_08033b90:
    .word Scene_Dialogue

PTR_FUN_08087e34_08033b94:
    .word 0x8087E35

PTR_FUN_08082de4_08033b98:
    .word 0x8082DE5


_ts MapSetup_Govt_Yuichiro_Lab_S4
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_Govt_Yuichiro_Lab_F40_08033d24
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Sound_AreaSongChange
    pop        {pc}

PTR_MapSetup_Govt_Yuichiro_Lab_F40_08033bac:
    .word MapSetup_Govt_Yuichiro_Lab_F40
    .word MapSetup_Govt_Yuichiro_Lab_F40
    .word MapSetup_Govt_Yuichiro_Lab_F40
    .word MapSetup_Govt_Yuichiro_Lab_F40
    .word MapSetup_Govt_Yuichiro_Lab_F40
    .word MapSetup_Govt_Yuichiro_Lab_F40
    .word MapSetup_Govt_Yuichiro_Lab_F40
    .word MapSetup_Govt_Yuichiro_Lab_F40


_ts EventHandler_Govt_Yuichiro_Lab_S4
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Yuichiro_Lab_F40_08033d28
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r0,#0x41
    mov        r1,#0x23
    bl         CheckForJackIn
    pop        {pc}

PTR_EventHandler_Govt_Yuichiro_Lab_F40_08033be0:
    .word EventHandler_Govt_Yuichiro_Lab_F40
    .word EventHandler_Govt_Yuichiro_Lab_F40
    .word EventHandler_Govt_Yuichiro_Lab_F40
    .word EventHandler_Govt_Yuichiro_Lab_F40
    .word EventHandler_Govt_Yuichiro_Lab_F40
    .word EventHandler_Govt_Yuichiro_Lab_F40
    .word EventHandler_Govt_Yuichiro_Lab_F40
    .word EventHandler_Govt_Yuichiro_Lab_F40


_ts MapSetup_Govt_Yuichiro_Lab_F40
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_8035844_08033d2c
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    bl         Flag_Set410
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_Govt_Yuichiro_Lab_F40
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Yuichiro_Lab_F40_0_08033d30
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    bl         EventHandler_Govt_Yuichiro_Lab_F40_HandleJackIn
    bl         EventHandler_Govt_Yuichiro_Lab_F40_HandleExits
    pop        {pc}

    .align 2, 0

PTR_EventHandler_Govt_Yuichiro_Lab_F40_0_08033c44:
    .word EventHandler_Govt_Yuichiro_Lab_F40_0


_ts EventHandler_Govt_Yuichiro_Lab_F40_0
    push       {lr}
    pop        {pc}


_ts EventHandler_Govt_Yuichiro_Lab_F40_HandleJackIn
    push       {lr}
    bl         Scene_IsSceneActive
    tst        r0,r0
    beq        LAB_08033c58
    pop        {pc}
LAB_08033c58:
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08033c96
    mov        r0,r10
    ldr        r0,[r0,#0x4]
    ldrh       r0,[r0,#0x2]
    ldr        r1,DAT_08033d34
    and        r1,r0
    beq        LAB_08033c96
    bl         dummy_187a0
    bne        LAB_08033c96
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x40
    bne        LAB_08033c96
    push       {r5}
    ldr        r0,PTR_Scene_JackIn_08033d38
    mov        r1,#0x15
    bl         Scene_Prepare
    pop        {r5}
LAB_08033c96:
    pop        {pc}


_ts EventHandler_Govt_Yuichiro_Lab_F40_HandleExits
    push       {lr}
    bl         Scene_IsSceneActive
    tst        r0,r0
    bne        LAB_08033d20
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0xe]
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x22
    bne        LAB_08033cc0
    push       {r5}
    ldr        r0,PTR_Scene_Dialogue_08033d3c
    mov        r1,#0x1
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_08033d20
LAB_08033cc0:
    cmp        r0,#0x21
    bne        LAB_08033cd2
    push       {r5}
    ldr        r0,PTR_Scene_Dialogue_08033d40
    mov        r1,#0x10
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_08033d20
LAB_08033cd2:
    cmp        r0,#0x20
    bne        LAB_08033cfa
    mov        r0,#0x9c
    bl         Flag_GetBase
    beq        LAB_08033cec
    push       {r5}
    ldr        r0,PTR_LAB_080918c0_08033d44
    mov        r1,#0x23
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_08033cec:
    push       {r5}
    ldr        r0,PTR_FUN_08087e34_08033d48
    mov        r1,#0xf
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_08033cfa:
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x1
    bne        LAB_08033d20
    push       {r5}
    mov        r1,#0xb
    lsl        r1,r1,#0x8
    mov        r0,#0x3
    orr        r1,r0
    ldr        r0,PTR_FUN_08082de4_08033d4c
    bl         Scene_Prepare
    pop        {r5}
LAB_08033d20:
    pop        {pc}

    .align 2, 0

PTR_PTR_MapSetup_Govt_Yuichiro_Lab_F40_08033d24:
    .word PTR_MapSetup_Govt_Yuichiro_Lab_F40_08033bac

PTR_PTR_EventHandler_Govt_Yuichiro_Lab_F40_08033d28:
    .word PTR_EventHandler_Govt_Yuichiro_Lab_F40_08033be0

PTR_NPCList_8035844_08033d2c:
    .word NPCList_8035844

PTR_PTR_EventHandler_Govt_Yuichiro_Lab_F40_0_08033d30:
    .word PTR_EventHandler_Govt_Yuichiro_Lab_F40_0_08033c44

DAT_08033d34:
    .word 0x100

PTR_Scene_JackIn_08033d38:
    .word Scene_JackIn

PTR_Scene_Dialogue_08033d3c:
    .word Scene_Dialogue

PTR_Scene_Dialogue_08033d40:
    .word Scene_Dialogue

PTR_LAB_080918c0_08033d44:
    .word 0x80918C1

PTR_FUN_08087e34_08033d48:
    .word 0x8087E35

PTR_FUN_08082de4_08033d4c:
    .word 0x8082DE5


_ts MapSetup_Govt_Yuichiro_Lab_S5
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_Govt_Yuichiro_Lab_F50_08033fc4
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r0,#0x2c
    bl         Flag_Get420
    bne        LAB_08033d66
    bl         Sound_AreaSongChange
LAB_08033d66:
    pop        {pc}

PTR_MapSetup_Govt_Yuichiro_Lab_F50_08033d68:
    .word MapSetup_Govt_Yuichiro_Lab_F50
    .word MapSetup_Govt_Yuichiro_Lab_F50
    .word MapSetup_Govt_Yuichiro_Lab_F52
    .word MapSetup_Govt_Yuichiro_Lab_F53
    .word MapSetup_Govt_Yuichiro_Lab_F54
    .word MapSetup_Govt_Yuichiro_Lab_F50
    .word MapSetup_Govt_Yuichiro_Lab_F50
    .word MapSetup_Govt_Yuichiro_Lab_F50


_ts EventHandler_Govt_Yuichiro_Lab_S5
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Yuichiro_Lab_F50_08033fc8
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r0,#0x41
    mov        r1,#0x23
    bl         CheckForJackIn
    pop        {pc}

PTR_EventHandler_Govt_Yuichiro_Lab_F50_08033d9c:
    .word EventHandler_Govt_Yuichiro_Lab_F50
    .word EventHandler_Govt_Yuichiro_Lab_F50
    .word EventHandler_Govt_Yuichiro_Lab_F52
    .word EventHandler_Govt_Yuichiro_Lab_F53
    .word EventHandler_Govt_Yuichiro_Lab_F54
    .word EventHandler_Govt_Yuichiro_Lab_F50
    .word EventHandler_Govt_Yuichiro_Lab_F50
    .word EventHandler_Govt_Yuichiro_Lab_F50


_ts MapSetup_Govt_Yuichiro_Lab_F50
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_NPCList_8035844_08033fcc
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    bl         Flag_Set410
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_Govt_Yuichiro_Lab_F50
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Yuichiro_Lab_F50_0_08033fd0
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    bl         FUN_08033f04
    bl         EventHandler_Govt_Yuichiro_Lab_F50_HandleExits
    pop        {pc}

    .align 2, 0

PTR_EventHandler_Govt_Yuichiro_Lab_F50_0_08033dfc:
    .word EventHandler_Govt_Yuichiro_Lab_F50_0


_ts EventHandler_Govt_Yuichiro_Lab_F50_0
    push       {lr}
    pop        {pc}


_ts MapSetup_Govt_Yuichiro_Lab_F52
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_NPCList_803586C_08033fd4
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    bl         Flag_Set410
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_Govt_Yuichiro_Lab_F52
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Yuichiro_Lab_F52_0_08033fd8
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    bl         FUN_08033f04
    bl         EventHandler_Govt_Yuichiro_Lab_F50_HandleExits
    pop        {pc}

    .align 2, 0

PTR_EventHandler_Govt_Yuichiro_Lab_F52_0_08033e44:
    .word EventHandler_Govt_Yuichiro_Lab_F52_0


_ts EventHandler_Govt_Yuichiro_Lab_F52_0
    push       {lr}
    pop        {pc}


_ts MapSetup_Govt_Yuichiro_Lab_F53
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_NPCList_8035878_08033fdc
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    bl         Flag_Set410
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_Govt_Yuichiro_Lab_F53
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Yuichiro_Lab_F53_0_08033fe0
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    bl         FUN_08033f04
    bl         EventHandler_Govt_Yuichiro_Lab_F50_HandleExits
    pop        {pc}

    .align 2, 0

PTR_EventHandler_Govt_Yuichiro_Lab_F53_0_08033e8c:
    .word EventHandler_Govt_Yuichiro_Lab_F53_0


_ts EventHandler_Govt_Yuichiro_Lab_F53_0
    push       {lr}
    pop        {pc}


_ts MapSetup_Govt_Yuichiro_Lab_F54
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_NPCList_803586C_08033fe4
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    bl         Flag_Set410
    mov        r0,#0xab
    bl         Flag_GetBase
    bne        LAB_08033ede
    mov        r0,#0xac
    bl         Flag_GetBase
    beq        LAB_08033ede
    mov        r0,#0x2c
    bl         Flag_Set420
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    mov        r1,#0x0
    strb       r1,[r0,#0x7]
    push       {r5}
    ldr        r0,PTR_FUN_08093ed4_08033fe8
    mov        r1,#0x17
    bl         Scene_Prepare
    pop        {r5}
LAB_08033ede:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Govt_Yuichiro_Lab_F54
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Yuichiro_Lab_F54_0_08033fec
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    bl         FUN_08033f04
    bl         EventHandler_Govt_Yuichiro_Lab_F50_HandleExits
    pop        {pc}

PTR_EventHandler_Govt_Yuichiro_Lab_F54_0_08033efc:
    .word EventHandler_Govt_Yuichiro_Lab_F54_0


_ts EventHandler_Govt_Yuichiro_Lab_F54_0
    push       {lr}
    pop        {pc}


_ts FUN_08033f04
    push       {lr}
    bl         Scene_IsSceneActive
    tst        r0,r0
    beq        LAB_08033f10
    pop        {pc}
LAB_08033f10:
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08033f4e
    mov        r0,r10
    ldr        r0,[r0,#0x4]
    ldrh       r0,[r0,#0x2]
    ldr        r1,DAT_08033ff0
    and        r1,r0
    beq        LAB_08033f4e
    bl         dummy_187a0
    bne        LAB_08033f4e
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x40
    bne        LAB_08033f4e
    push       {r5}
    ldr        r0,PTR_Scene_JackIn_08033ff4
    mov        r1,#0x15
    bl         Scene_Prepare
    pop        {r5}
LAB_08033f4e:
    pop        {pc}


_ts EventHandler_Govt_Yuichiro_Lab_F50_HandleExits
    push       {lr}
    bl         Scene_IsSceneActive
    tst        r0,r0
    bne        LAB_08033fc2
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0xe]
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x22
    bne        LAB_08033f78
    push       {r5}
    ldr        r0,PTR_Scene_Dialogue_08033ff8
    mov        r1,#0x1
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_08033fc2
LAB_08033f78:
    cmp        r0,#0x21
    bne        LAB_08033f8a
    push       {r5}
    ldr        r0,PTR_Scene_Dialogue_08033ffc
    mov        r1,#0x10
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_08033fc2
LAB_08033f8a:
    cmp        r0,#0x20
    bne        LAB_08033f9c
    push       {r5}
    ldr        r0,PTR_LAB_080918c0_08034000
    mov        r1,#0x23
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_08033fc2
LAB_08033f9c:
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x1
    bne        LAB_08033fc2
    push       {r5}
    mov        r1,#0xb
    lsl        r1,r1,#0x8
    mov        r0,#0x3
    orr        r1,r0
    ldr        r0,PTR_FUN_08082de4_08034004
    bl         Scene_Prepare
    pop        {r5}
LAB_08033fc2:
    pop        {pc}

PTR_PTR_MapSetup_Govt_Yuichiro_Lab_F50_08033fc4:
    .word PTR_MapSetup_Govt_Yuichiro_Lab_F50_08033d68

PTR_PTR_EventHandler_Govt_Yuichiro_Lab_F50_08033fc8:
    .word PTR_EventHandler_Govt_Yuichiro_Lab_F50_08033d9c

PTR_NPCList_8035844_08033fcc:
    .word NPCList_8035844

PTR_PTR_EventHandler_Govt_Yuichiro_Lab_F50_0_08033fd0:
    .word PTR_EventHandler_Govt_Yuichiro_Lab_F50_0_08033dfc

PTR_NPCList_803586C_08033fd4:
    .word NPCList_803586C

PTR_PTR_EventHandler_Govt_Yuichiro_Lab_F52_0_08033fd8:
    .word PTR_EventHandler_Govt_Yuichiro_Lab_F52_0_08033e44

PTR_NPCList_8035878_08033fdc:
    .word NPCList_8035878

PTR_PTR_EventHandler_Govt_Yuichiro_Lab_F53_0_08033fe0:
    .word PTR_EventHandler_Govt_Yuichiro_Lab_F53_0_08033e8c

PTR_NPCList_803586C_08033fe4:
    .word NPCList_803586C

PTR_FUN_08093ed4_08033fe8:
    .word 0x8093ED5

PTR_PTR_EventHandler_Govt_Yuichiro_Lab_F54_0_08033fec:
    .word PTR_EventHandler_Govt_Yuichiro_Lab_F54_0_08033efc

DAT_08033ff0:
    .word 0x100

PTR_Scene_JackIn_08033ff4:
    .word Scene_JackIn

PTR_Scene_Dialogue_08033ff8:
    .word Scene_Dialogue

PTR_Scene_Dialogue_08033ffc:
    .word Scene_Dialogue

PTR_LAB_080918c0_08034000:
    .word 0x80918C1

PTR_FUN_08082de4_08034004:
    .word 0x8082DE5
