#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set Scene_JackIn, 0x8083EEC+1
    .set Scene_Dialogue, 0x80848FC+1


_ts MapSetup_Govt_Waterworks_Office_S2
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_Default_08034258
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r0,#0xab
    bl         Flag_GetBase
    beq        LAB_08034026
    push       {r5}
    mov        r0,#0x4
    bl         Sound_ChangeSong
    pop        {r5}
    b          LAB_0803403e
LAB_08034026:
    mov        r0,#0xdf
    bl         Flag_GetBase
    beq        LAB_0803403a
    push       {r5}
    mov        r0,#0x3
    bl         Sound_ChangeSong
    pop        {r5}
    b          LAB_0803403e
LAB_0803403a:
    bl         Sound_AreaSongChange
LAB_0803403e:
    pop        {pc}

PTR_MapSetup_Default_08034040:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Govt_Waterworks_Office_F24
    .word MapSetup_Govt_Waterworks_Office_F25
    .word MapSetup_Govt_Waterworks_Office_F25
    .word MapSetup_Govt_Waterworks_Office_F25


_ts EventHandler_Govt_Waterworks_Office_S2
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Default_0803425c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Default_0803406c:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Govt_Waterworks_Office_F24
    .word EventHandler_Govt_Waterworks_Office_F25
    .word EventHandler_Govt_Waterworks_Office_F25
    .word EventHandler_Govt_Waterworks_Office_F25


_ts MapSetup_Govt_Waterworks_Office_F24
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_NPCList_803590C_08034260
    bl         Map_LoadNPCList
    mov        r0,#0x0
    bl         Flag_Set410
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_Govt_Waterworks_Office_F24
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Waterworks_Office_F24_0_08034264
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    bl         FUN_08034152
    pop        {pc}

    .align 2, 0

PTR_EventHandler_Govt_Waterworks_Office_F24_0_080340c8:
    .word EventHandler_Govt_Waterworks_Office_F24_0


_ts EventHandler_Govt_Waterworks_Office_F24_0
    push       {lr}
    pop        {pc}


_ts MapSetup_Govt_Waterworks_Office_F25
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    mov        r0,#0x1
    bl         Flag_Set410
    mov        r0,#0x0
    bl         Flag_Set410
    pop        {pc}


_nt EventHandler_Govt_Waterworks_Office_F25
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Waterworks_Office_F25_0_08034268
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    bl         FUN_08034152
    pop        {pc}

    .align 2, 0

PTR_EventHandler_Govt_Waterworks_Office_F25_0_0803410c:
    .word EventHandler_Govt_Waterworks_Office_F25_0
    .word EventHandler_Govt_Waterworks_Office_F25_1


_ts EventHandler_Govt_Waterworks_Office_F25_0
    push       {lr}
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_0803414c
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r1,[r0,#0x6]
    cmp        r1,#0x27
    bne        LAB_0803413a
    mov        r0,#0xd9
    bl         Flag_SetBase
LAB_0803413a:
    push       {r5}
    mov        r1,#0xa
    lsl        r1,r1,#0x8
    mov        r0,#0x3
    orr        r1,r0
    ldr        r0,DAT_0803426c
    bl         Scene_Prepare
    pop        {r5}
LAB_0803414c:
    pop        {pc}


_nt EventHandler_Govt_Waterworks_Office_F25_1
    push       {lr}
    pop        {pc}


_nt FUN_08034152
    push       {lr}
    bl         Scene_IsSceneActive
    tst        r0,r0
    beq        LAB_0803415e
    pop        {pc}
LAB_0803415e:
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x20
    bne        LAB_08034176
    push       {r5}
    ldr        r0,PTR_FUN_08087e34_08034270
    mov        r1,#0x10
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_08034176:
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x1
    bne        LAB_0803419e
    push       {r5}
    mov        r1,#0x9
    lsl        r1,r1,#0x8
    mov        r0,#0x5
    orr        r1,r0
    ldr        r0,PTR_FUN_08082de4_08034274
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0803419e:
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r1,[r0,#0x6]
    cmp        r1,#0x24
    beq        LAB_08034254
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08034254
    mov        r0,r10
    ldr        r0,[r0,#0x4]
    ldrh       r0,[r0,#0x2]
    ldr        r1,DAT_08034278
    and        r1,r0
    beq        LAB_08034254
    bl         dummy_187a0
    bne        LAB_08034254
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x40
    bne        LAB_08034254
    mov        r0,#0xbe
    bl         Flag_GetBase
    bne        LAB_080341f0
    push       {r5}
    ldr        r0,PTR_Scene_Dialogue_0803427c
    mov        r1,#0x7
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_08034254
LAB_080341f0:
    mov        r0,#0xc7
    bl         Flag_GetBase
    bne        LAB_08034206
    push       {r5}
    ldr        r0,PTR_FUN_080897a4_08034280
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_08034254
LAB_08034206:
    push       {r5}
    ldr        r0,PTR_Scene_JackIn_08034284
    mov        r1,#0xb
    bl         Scene_Prepare
    mov        r0,#0xe4
    bl         Flag_ClearBase
    mov        r0,#0xe5
    bl         Flag_ClearBase
    mov        r0,#0xe6
    bl         Flag_ClearBase
    mov        r0,#0xe7
    bl         Flag_ClearBase
    mov        r0,#0xe8
    bl         Flag_ClearBase
    mov        r0,#0xe9
    bl         Flag_ClearBase
    mov        r0,#0xea
    bl         Flag_ClearBase
    mov        r0,#0xeb
    bl         Flag_ClearBase
    mov        r0,#0xec
    bl         Flag_ClearBase
    mov        r0,#0xed
    bl         Flag_ClearBase
    mov        r0,#0xee
    bl         Flag_ClearBase
    pop        {r5}
LAB_08034254:
    pop        {pc}

    .align 2, 0

PTR_PTR_MapSetup_Default_08034258:
    .word PTR_MapSetup_Default_08034040

PTR_PTR_EventHandler_Default_0803425c:
    .word PTR_EventHandler_Default_0803406c

PTR_NPCList_803590C_08034260:
    .word NPCList_803590C

PTR_PTR_EventHandler_Govt_Waterworks_Office_F24_0_08034264:
    .word PTR_EventHandler_Govt_Waterworks_Office_F24_0_080340c8

PTR_PTR_EventHandler_Govt_Waterworks_Office_F25_0_08034268:
    .word PTR_EventHandler_Govt_Waterworks_Office_F25_0_0803410c

DAT_0803426c:
    .word 0x8082DE5

PTR_FUN_08087e34_08034270:
    .word 0x8087E35

PTR_FUN_08082de4_08034274:
    .word 0x8082DE5

DAT_08034278:
    .word 0x100

PTR_Scene_Dialogue_0803427c:
    .word Scene_Dialogue

PTR_FUN_080897a4_08034280:
    .word 0x80897A5

PTR_Scene_JackIn_08034284:
    .word Scene_JackIn


_ts MapSetup_Govt_Waterworks_Office_S3
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_Govt_Waterworks_Office_F40_080343b4
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Sound_AreaSongChange
    pop        {pc}

PTR_MapSetup_Govt_Waterworks_Office_F40_08034298:
    .word MapSetup_Govt_Waterworks_Office_F40
    .word MapSetup_Govt_Waterworks_Office_F40
    .word MapSetup_Govt_Waterworks_Office_F40
    .word MapSetup_Govt_Waterworks_Office_F40
    .word MapSetup_Govt_Waterworks_Office_F40
    .word MapSetup_Govt_Waterworks_Office_F40
    .word MapSetup_Govt_Waterworks_Office_F40
    .word MapSetup_Govt_Waterworks_Office_F40


_ts EventHandler_Govt_Waterworks_Office_S3
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Waterworks_Office_F30_080343b8
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Govt_Waterworks_Office_F30_080342c4:
    .word EventHandler_Govt_Waterworks_Office_F30
    .word EventHandler_Govt_Waterworks_Office_F30
    .word EventHandler_Govt_Waterworks_Office_F30
    .word EventHandler_Govt_Waterworks_Office_F30
    .word EventHandler_Govt_Waterworks_Office_F30
    .word EventHandler_Govt_Waterworks_Office_F30
    .word EventHandler_Govt_Waterworks_Office_F30
    .word EventHandler_Govt_Waterworks_Office_F30


_ts MapSetup_Govt_Waterworks_Office_F40
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_NPCList_80359C8_080343bc
    bl         Map_LoadNPCList
    mov        r0,#0x0
    bl         Flag_Set410
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_Govt_Waterworks_Office_F30
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Waterworks_Office_F30_0_080343c0
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    bl         FUN_08034328
    pop        {pc}

    .align 2, 0

PTR_EventHandler_Govt_Waterworks_Office_F30_0_08034320:
    .word EventHandler_Govt_Waterworks_Office_F30_0


_ts EventHandler_Govt_Waterworks_Office_F30_0
    push       {lr}
    pop        {pc}


_ts FUN_08034328
    push       {lr}
    bl         Scene_IsSceneActive
    tst        r0,r0
    beq        LAB_08034334
    pop        {pc}
LAB_08034334:
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x20
    bne        LAB_0803434c
    push       {r5}
    ldr        r0,PTR_FUN_08087e34_080343c4
    mov        r1,#0x10
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0803434c:
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x1
    bne        LAB_08034374
    push       {r5}
    mov        r1,#0x9
    lsl        r1,r1,#0x8
    mov        r0,#0x5
    orr        r1,r0
    ldr        r0,PTR_FUN_08082de4_080343c8
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_08034374:
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_080343b2
    mov        r0,r10
    ldr        r0,[r0,#0x4]
    ldrh       r0,[r0,#0x2]
    ldr        r1,DAT_080343cc
    and        r1,r0
    beq        LAB_080343b2
    bl         dummy_187a0
    bne        LAB_080343b2
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x40
    bne        LAB_080343b2
    push       {r5}
    ldr        r0,PTR_Scene_JackIn_080343d0
    mov        r1,#0xb
    bl         Scene_Prepare
    pop        {r5}
LAB_080343b2:
    pop        {pc}

PTR_PTR_MapSetup_Govt_Waterworks_Office_F40_080343b4:
    .word PTR_MapSetup_Govt_Waterworks_Office_F40_08034298

PTR_PTR_EventHandler_Govt_Waterworks_Office_F30_080343b8:
    .word PTR_EventHandler_Govt_Waterworks_Office_F30_080342c4

PTR_NPCList_80359C8_080343bc:
    .word NPCList_80359C8

PTR_PTR_EventHandler_Govt_Waterworks_Office_F30_0_080343c0:
    .word PTR_EventHandler_Govt_Waterworks_Office_F30_0_08034320

PTR_FUN_08087e34_080343c4:
    .word 0x8087E35

PTR_FUN_08082de4_080343c8:
    .word 0x8082DE5

DAT_080343cc:
    .word 0x100

PTR_Scene_JackIn_080343d0:
    .word Scene_JackIn


_ts MapSetup_Govt_Waterworks_Office_S5
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_Govt_Waterworks_Office_F50_08034500
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Sound_AreaSongChange
    pop        {pc}

PTR_MapSetup_Govt_Waterworks_Office_F50_080343e4:
    .word MapSetup_Govt_Waterworks_Office_F50
    .word MapSetup_Govt_Waterworks_Office_F50
    .word MapSetup_Govt_Waterworks_Office_F50
    .word MapSetup_Govt_Waterworks_Office_F50
    .word MapSetup_Govt_Waterworks_Office_F50
    .word MapSetup_Govt_Waterworks_Office_F50
    .word MapSetup_Govt_Waterworks_Office_F50
    .word MapSetup_Govt_Waterworks_Office_F50


_ts EventHandler_Govt_Waterworks_Office_S5
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Waterworks_Office_F50_08034504
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Govt_Waterworks_Office_F50_08034410:
    .word EventHandler_Govt_Waterworks_Office_F50
    .word EventHandler_Govt_Waterworks_Office_F50
    .word EventHandler_Govt_Waterworks_Office_F50
    .word EventHandler_Govt_Waterworks_Office_F50
    .word EventHandler_Govt_Waterworks_Office_F50
    .word EventHandler_Govt_Waterworks_Office_F50
    .word EventHandler_Govt_Waterworks_Office_F50
    .word EventHandler_Govt_Waterworks_Office_F50


_ts MapSetup_Govt_Waterworks_Office_F50
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_NPCList_8035A4C_08034508
    bl         Map_LoadNPCList
    mov        r0,#0x0
    bl         Flag_Set410
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_Govt_Waterworks_Office_F50
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Govt_Waterworks_Office_F50_0_0803450c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    bl         FUN_08034474
    pop        {pc}

    .align 2, 0

PTR_EventHandler_Govt_Waterworks_Office_F50_0_0803446c:
    .word EventHandler_Govt_Waterworks_Office_F50_0


_ts EventHandler_Govt_Waterworks_Office_F50_0
    push       {lr}
    pop        {pc}


_ts FUN_08034474
    push       {lr}
    bl         Scene_IsSceneActive
    tst        r0,r0
    beq        LAB_08034480
    pop        {pc}
LAB_08034480:
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x20
    bne        LAB_08034498
    push       {r5}
    ldr        r0,PTR_FUN_08087e34_08034510
    mov        r1,#0x10
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_08034498:
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x1
    bne        LAB_080344c0
    push       {r5}
    mov        r1,#0x9
    lsl        r1,r1,#0x8
    mov        r0,#0x5
    orr        r1,r0
    ldr        r0,PTR_FUN_08082de4_08034514
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_080344c0:
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_080344fe
    mov        r0,r10
    ldr        r0,[r0,#0x4]
    ldrh       r0,[r0,#0x2]
    ldr        r1,DAT_08034518
    and        r1,r0
    beq        LAB_080344fe
    bl         dummy_187a0
    bne        LAB_080344fe
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x40
    bne        LAB_080344fe
    push       {r5}
    ldr        r0,PTR_Scene_JackIn_0803451c
    mov        r1,#0xb
    bl         Scene_Prepare
    pop        {r5}
LAB_080344fe:
    pop        {pc}

PTR_PTR_MapSetup_Govt_Waterworks_Office_F50_08034500:
    .word PTR_MapSetup_Govt_Waterworks_Office_F50_080343e4

PTR_PTR_EventHandler_Govt_Waterworks_Office_F50_08034504:
    .word PTR_EventHandler_Govt_Waterworks_Office_F50_08034410

PTR_NPCList_8035A4C_08034508:
    .word NPCList_8035A4C

PTR_PTR_EventHandler_Govt_Waterworks_Office_F50_0_0803450c:
    .word PTR_EventHandler_Govt_Waterworks_Office_F50_0_0803446c

PTR_FUN_08087e34_08034510:
    .word 0x8087E35

PTR_FUN_08082de4_08034514:
    .word 0x8082DE5

DAT_08034518:
    .word 0x100

PTR_Scene_JackIn_0803451c:
    .word Scene_JackIn
