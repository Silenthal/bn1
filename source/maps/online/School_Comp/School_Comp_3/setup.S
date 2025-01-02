#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_School_Comp_3_S1
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,PTR_PTR_MapSetup_Default_0804135c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_803EC68_08041360
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_803ECF8_08041364
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_803ED68_08041368
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_803F138_0804136c
    bl         BgTask_AddNew
    ldr        r0,PTR_EntityAllocParams_8042148_08041370
    bl         Entity_AllocList
    pop        {r5}
    mov        r0,#0x0
    strb       r0,[r5,#0x1]
    pop        {pc}

    .align 2, 0

PTR_MapSetup_Default_0804109c:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_School_Comp_3_F14
    .word MapSetup_School_Comp_3_F15
    .word MapSetup_Default
    .word MapSetup_Default


_ts EventHandler_School_Comp_3_S1
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Default_08041374
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Default_080410c8:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_School_Comp_3_F14
    .word EventHandler_School_Comp_3_F15
    .word EventHandler_Default
    .word EventHandler_Default


_ts MapSetup_School_Comp_3_F14
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_8041DC8_08041378
    bl         Map_LoadNPCList
    pop        {r5}
    Flag_GetBase 0xD6
    beq        LAB_08041120
    Flag_ClearBase 0xD6
    push       {r5}
    ldr        r0,DAT_0804137c
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_08041120:
    push       {r5}
    Flag_GetBase 0xB2
    pop        {r5}
    bne        LAB_08041138
    push       {r5}
    mov        r1,#0x4
    bl         Effect_WWWGate_Create
    pop        {r5}
    b          LAB_08041142
LAB_08041138:
    push       {r5}
    Flag_SetIgnore F_IGNORE_DOOR_00
    pop        {r5}
LAB_08041142:
    push       {r5}
    Flag_GetBase 0xAD
    pop        {r5}
    bne        LAB_0804115c
    push       {r5}
    mov        r1,#0x3
    bl         Effect_WWWGate_Create
    pop        {r5}
    mov        r0,#0x0
    b          LAB_0804119c
LAB_0804115c:
    push       {r5}
    Flag_GetBase 0xAF
    pop        {r5}
    bne        LAB_08041180
    push       {r5}
    mov        r1,#0x3
    bl         Effect_WWWGate_Create
    pop        {r5}
    push       {r5}
    ldr        r0,DAT_08041380
    mov        r1,#0x2
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_0804118a
LAB_08041180:
    push       {r5}
    Flag_SetIgnore F_IGNORE_DOOR_01
    pop        {r5}
LAB_0804118a:
    push       {r5}
    Flag_GetBase 0xB2
    pop        {r5}
    bne        LAB_0804119a
    mov        r0,#0x0
    b          LAB_0804119c
LAB_0804119a:
    mov        r0,#0x4
LAB_0804119c:
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_School_Comp_3_F14
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Comp_3_F14_0_08041384
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    bl         EventHandler_School_Comp_HandleJackOut
    pop        {pc}

PTR_EventHandler_School_Comp_3_F14_0_080411b4:
    .word EventHandler_School_Comp_3_F14_0
    .word EventHandler_School_Comp_3_F14_1
    .word EventHandler_School_Comp_3_F14_2
    .word EventHandler_School_Comp_3_F14_3


_ts EventHandler_School_Comp_3_F14_0
    push       {lr}
    push       {r5}
    Flag_GetBase 0xB0
    pop        {r5}
    bne        LAB_080411f4
    LoadMain world, r0, r7
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x20
    bne        LAB_080411f4
    Flag_SetBase 0xC1
    push       {r5}
    mov        r1,#0x5
    ldr        r0,DAT_08041388
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x8
    str        r0,[r5,#0x0]
    pop        {pc}
LAB_080411f4:
    push       {r5}
    Flag_GetBase 0xAD
    pop        {r5}
    bne        LAB_0804121a
    LoadMain world, r0, r7
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x21
    bne        LAB_0804121a
    push       {r5}
    mov        r1,#0x6
    ldr        r0,DAT_0804138c
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x4
    str        r0,[r5,#0x0]
LAB_0804121a:
    pop        {pc}


_ts EventHandler_School_Comp_3_F14_1
    push       {lr}
    pop        {pc}


_ts EventHandler_School_Comp_3_F14_2
    push       {lr}
    push       {r5}
    Flag_GetBase 0xB0
    pop        {r5}
    beq        LAB_08041240
    push       {r5}
    ldr        r0,PTR_Scene_UnlockWWWGate_08041390
    mov        r1,#0x3
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0xc
    str        r0,[r5,#0x0]
    pop        {pc}
LAB_08041240:
    Flag_ClearBase 0xC1
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_School_Comp_3_F14_3
    push       {lr}
    push       {r5}
    Flag_GetBase 0xB2
    pop        {r5}
    beq        LAB_0804125e
    mov        r0,#0x0
    str        r0,[r5,#0x0]
LAB_0804125e:
    pop        {pc}


_ts MapSetup_School_Comp_3_F15
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_8041DC8_08041394
    bl         Map_LoadNPCList
    pop        {r5}
    Flag_GetBase 0xD6
    beq        LAB_08041298
    Flag_ClearBase 0xD6
    push       {r5}
    ldr        r0,PTR_Scene_MegaManJackIn_08041398
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_08041298:
    push       {r5}
    Flag_SetIgnore F_IGNORE_DOOR_01
    pop        {r5}
    push       {r5}
    Flag_GetBase 0xB2
    pop        {r5}
    bne        LAB_080412c6
    push       {r5}
    mov        r1,#0x4
    bl         Effect_WWWGate_Create
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_Scene_UnlockWWWGate_0804139c
    mov        r1,#0x2
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_080412d0
LAB_080412c6:
    push       {r5}
    Flag_SetIgnore F_IGNORE_DOOR_00
    pop        {r5}
LAB_080412d0:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_School_Comp_3_F15
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Comp_3_F15_0_080413a0
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    bl         EventHandler_School_Comp_HandleJackOut
    pop        {pc}

    .align 2, 0

PTR_EventHandler_School_Comp_3_F15_0_080412ec:
    .word EventHandler_School_Comp_3_F15_0
    .word EventHandler_School_Comp_3_F15_1
    .word EventHandler_School_Comp_3_F15_2


_ts EventHandler_School_Comp_3_F15_0
    push       {lr}
    LoadMain world, r0, r7
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x20
    bne        LAB_0804131a
    Flag_SetBase 0xC1
    push       {r5}
    mov        r1,#0x5
    ldr        r0,DAT_080413a4
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x4
    str        r0,[r5,#0x0]
LAB_0804131a:
    pop        {pc}


_ts EventHandler_School_Comp_3_F15_1
    push       {lr}
    push       {r5}
    Flag_GetBase 0xB0
    pop        {r5}
    beq        LAB_0804133c
    push       {r5}
    ldr        r0,PTR_Scene_UnlockWWWGate_080413a8
    mov        r1,#0x3
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x8
    str        r0,[r5,#0x0]
    pop        {pc}
LAB_0804133c:
    Flag_ClearBase 0xC1
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_School_Comp_3_F15_2
    push       {lr}
    push       {r5}
    Flag_GetBase 0xB2
    pop        {r5}
    beq        LAB_0804135a
    mov        r0,#0x0
    str        r0,[r5,#0x0]
LAB_0804135a:
    pop        {pc}

PTR_PTR_MapSetup_Default_0804135c:
    .word PTR_MapSetup_Default_0804109c

PTR_BgTask_803EC68_08041360:
    .word BgTask_803EC68

PTR_BgTask_803ECF8_08041364:
    .word BgTask_803ECF8

PTR_BgTask_803ED68_08041368:
    .word BgTask_803ED68

PTR_BgTask_803F138_0804136c:
    .word BgTask_803F138

PTR_EntityAllocParams_8042148_08041370:
    .word EntityAllocParams_8042148

PTR_PTR_EventHandler_Default_08041374:
    .word PTR_EventHandler_Default_080410c8

PTR_NPCList_8041DC8_08041378:
    .word NPCList_8041DC8

DAT_0804137c:
    .word Scene_MegaManJackIn

DAT_08041380:
    .word Scene_UnlockWWWGate

PTR_PTR_EventHandler_School_Comp_3_F14_0_08041384:
    .word PTR_EventHandler_School_Comp_3_F14_0_080411b4

DAT_08041388:
    .word Scene_ChangeMap

DAT_0804138c:
    .word Scene_ChangeMap

PTR_Scene_UnlockWWWGate_08041390:
    .word Scene_UnlockWWWGate

PTR_NPCList_8041DC8_08041394:
    .word NPCList_8041DC8

PTR_Scene_MegaManJackIn_08041398:
    .word Scene_MegaManJackIn

PTR_Scene_UnlockWWWGate_0804139c:
    .word Scene_UnlockWWWGate

PTR_PTR_EventHandler_School_Comp_3_F15_0_080413a0:
    .word PTR_EventHandler_School_Comp_3_F15_0_080412ec

DAT_080413a4:
    .word Scene_ChangeMap

PTR_Scene_UnlockWWWGate_080413a8:
    .word Scene_UnlockWWWGate


_ts MapSetup_School_Comp_3_S2
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,PTR_PTR_MapSetup_School_Comp_3_F20_0804149c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_803ECB0_080414a0
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_803ECF8_080414a4
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_803ED68_080414a8
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_803F138_080414ac
    bl         BgTask_AddNew
    ldr        r0,PTR_EntityAllocParams_8042148_080414b0
    bl         Entity_AllocList
    pop        {r5}
    pop        {pc}

    .align 2, 0

PTR_MapSetup_School_Comp_3_F20_080413e4:
    .word MapSetup_School_Comp_3_F20
    .word MapSetup_School_Comp_3_F20
    .word MapSetup_School_Comp_3_F20
    .word MapSetup_School_Comp_3_F20
    .word MapSetup_School_Comp_3_F20
    .word MapSetup_School_Comp_3_F20
    .word MapSetup_School_Comp_3_F20
    .word MapSetup_School_Comp_3_F20


_ts EventHandler_School_Comp_3_S2
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Comp_3_F20_080414b4
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_School_Comp_3_F20_08041410:
    .word EventHandler_School_Comp_3_F20
    .word EventHandler_School_Comp_3_F20
    .word EventHandler_School_Comp_3_F20
    .word EventHandler_School_Comp_3_F20
    .word EventHandler_School_Comp_3_F20
    .word EventHandler_School_Comp_3_F20
    .word EventHandler_School_Comp_3_F20
    .word EventHandler_School_Comp_3_F20


_ts MapSetup_School_Comp_3_F20
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    Flag_SetIgnore F_IGNORE_DOOR_00
    Flag_SetIgnore F_IGNORE_DOOR_01
    push       {r5}
    ldr        r7,PTR_NPCList_8041E38_080414b8
    bl         Map_LoadNPCList
    pop        {r5}
    LoadMain world, r0, r0
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    bne        LAB_0804146a
    cmp        r1,#0x80
    beq        LAB_08041476
LAB_0804146a:
    push       {r5}
    ldr        r0,DAT_080414bc
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_08041476:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_School_Comp_3_F20
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Comp_3_F20_0_080414c0
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}

    .align 2, 0

PTR_EventHandler_School_Comp_3_F20_0_08041494:
    .word EventHandler_School_Comp_3_F20_0


_ts EventHandler_School_Comp_3_F20_0
    push       {lr}
    pop        {pc}

PTR_PTR_MapSetup_School_Comp_3_F20_0804149c:
    .word PTR_MapSetup_School_Comp_3_F20_080413e4

PTR_BgTask_803ECB0_080414a0:
    .word BgTask_803ECB0

PTR_BgTask_803ECF8_080414a4:
    .word BgTask_803ECF8

PTR_BgTask_803ED68_080414a8:
    .word BgTask_803ED68

PTR_BgTask_803F138_080414ac:
    .word BgTask_803F138

PTR_EntityAllocParams_8042148_080414b0:
    .word EntityAllocParams_8042148

PTR_PTR_EventHandler_School_Comp_3_F20_080414b4:
    .word PTR_EventHandler_School_Comp_3_F20_08041410

PTR_NPCList_8041E38_080414b8:
    .word NPCList_8041E38

DAT_080414bc:
    .word Scene_MegaManJackIn

PTR_PTR_EventHandler_School_Comp_3_F20_0_080414c0:
    .word PTR_EventHandler_School_Comp_3_F20_0_08041494
