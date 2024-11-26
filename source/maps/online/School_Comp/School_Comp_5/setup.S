#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_School_Comp_5_S1
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,PTR_PTR_MapSetup_Default_080419fc
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_803EC68_08041a00
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_803ECF8_08041a04
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_803ED68_08041a08
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_803F138_08041a0c
    bl         BgTask_AddNew
    ldr        r0,PTR_EntityAllocParams_804231C_08041a10
    bl         Entity_AllocList
    pop        {r5}
    mov        r0,#0x0
    strb       r0,[r5,#0x1]
    mov        r0,#0xc2
    bl         Flag_GetBase
    beq        LAB_0804188c
    push       {r5}
    bl         Sound_StopAllMusic
    pop        {r5}
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
LAB_0804188c:
    pop        {pc}

    .align 2, 0

PTR_MapSetup_Default_08041890:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_School_Comp_5_F15
    .word MapSetup_Default
    .word MapSetup_Default


_ts EventHandler_School_Comp_5_S1
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Default_08041a14
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    ldrb       r0,[r5,#0x1]
    tst        r0,r0
    bne        LAB_0804188c
    pop        {pc}

    .align 2, 0

PTR_EventHandler_Default_080418c4:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_School_Comp_5_F15
    .word EventHandler_Default
    .word EventHandler_Default


_ts MapSetup_School_Comp_5_F15
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    mov        r0,#0xd6
    bl         Flag_GetBase
    beq        LAB_08041912
    mov        r0,#0xd6
    bl         Flag_ClearBase
    push       {r5}
    ldr        r0,DAT_08041a18
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_08041912:
    push       {r5}
    mov        r0,#0xc2
    bl         Flag_GetBase
    pop        {r5}
    beq        LAB_08041930
    push       {r5}
    ldr        r0,PTR_FUN_080878c0_08041a1c
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0xc
    str        r0,[r5,#0x0]
    pop        {pc}
LAB_08041930:
    mov        r0,#0xbb
    bl         Flag_GetBase
    bne        LAB_08041942
    push       {r5}
    mov        r1,#0x6
    bl         Effect_WWWGate_Create
    pop        {r5}
LAB_08041942:
    push       {r5}
    ldr        r7,PTR_NPCList_8041F68_08041a20
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    mov        r0,#0xbd
    bl         Flag_GetBase
    pop        {r5}
    bne        LAB_0804195c
    mov        r0,#0x0
    b          LAB_08041964
LAB_0804195c:
    mov        r0,#0x0
    bl         Flag_Set380
    mov        r0,#0x8
LAB_08041964:
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_School_Comp_5_F15
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Comp_5_F15_0_08041a24
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    bl         EventHandler_School_Comp_HandleJackOut
    pop        {pc}

PTR_EventHandler_School_Comp_5_F15_0_0804197c:
    .word EventHandler_School_Comp_5_F15_0
    .word EventHandler_School_Comp_5_F15_1
    .word EventHandler_School_Comp_5_F15_2
    .word EventHandler_School_Comp_5_F15_3


_ts EventHandler_School_Comp_5_F15_0
    push       {lr}
    push       {r5}
    mov        r0,#0xbb
    bl         Flag_GetBase
    pop        {r5}
    bne        LAB_080419b2
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x20
    bne        LAB_080419c2
    push       {r5}
    mov        r1,#0x0
    ldr        r0,PTR_FUN_080875f8_08041a28
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_080419b2:
    push       {r5}
    ldr        r0,DAT_08041a2c
    mov        r1,#0x5
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x8
    str        r0,[r5,#0x0]
LAB_080419c2:
    pop        {pc}


_ts EventHandler_School_Comp_5_F15_1
    push       {lr}
    push       {r5}
    ldr        r0,PTR_Scene_UnlockWWWGate_08041a30
    mov        r1,#0x5
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x8
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_School_Comp_5_F15_2
    push       {lr}
    push       {r5}
    mov        r0,#0xbd
    bl         Flag_GetBase
    pop        {r5}
    beq        LAB_080419f6
    push       {r5}
    ldr        r0,PTR_FUN_0808771c_08041a34
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0xc
    str        r0,[r5,#0x0]
LAB_080419f6:
    pop        {pc}


_ts EventHandler_School_Comp_5_F15_3
    push       {lr}
    pop        {pc}

PTR_PTR_MapSetup_Default_080419fc:
    .word PTR_MapSetup_Default_08041890

PTR_BgTask_803EC68_08041a00:
    .word BgTask_803EC68

PTR_BgTask_803ECF8_08041a04:
    .word BgTask_803ECF8

PTR_BgTask_803ED68_08041a08:
    .word BgTask_803ED68

PTR_BgTask_803F138_08041a0c:
    .word BgTask_803F138

PTR_EntityAllocParams_804231C_08041a10:
    .word EntityAllocParams_804231C

PTR_PTR_EventHandler_Default_08041a14:
    .word PTR_EventHandler_Default_080418c4

DAT_08041a18:
    .word Scene_MegaManJackIn

PTR_FUN_080878c0_08041a1c:
    .word 0x80878C1

PTR_NPCList_8041F68_08041a20:
    .word NPCList_8041F68

PTR_PTR_EventHandler_School_Comp_5_F15_0_08041a24:
    .word PTR_EventHandler_School_Comp_5_F15_0_0804197c

PTR_FUN_080875f8_08041a28:
    .word 0x80875F9

DAT_08041a2c:
    .word 0x8086E19

PTR_Scene_UnlockWWWGate_08041a30:
    .word 0x8086E19

PTR_FUN_0808771c_08041a34:
    .word 0x808771D


_ts MapSetup_School_Comp_5_S2
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,PTR_PTR_MapSetup_School_Comp_5_F20_08041b18
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_803ECB0_08041b1c
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_803ECF8_08041b20
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_803ED68_08041b24
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_803F138_08041b28
    bl         BgTask_AddNew
    ldr        r0,PTR_EntityAllocParams_804231C_08041b2c
    bl         Entity_AllocList
    pop        {r5}
    pop        {pc}

    .align 2, 0

PTR_MapSetup_School_Comp_5_F20_08041a70:
    .word MapSetup_School_Comp_5_F20
    .word MapSetup_School_Comp_5_F20
    .word MapSetup_School_Comp_5_F20
    .word MapSetup_School_Comp_5_F20
    .word MapSetup_School_Comp_5_F20
    .word MapSetup_School_Comp_5_F20
    .word MapSetup_School_Comp_5_F20
    .word MapSetup_School_Comp_5_F20


_ts EventHandler_School_Comp_5_S2
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Comp_5_F20_08041b30
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_School_Comp_5_F20_08041a9c:
    .word EventHandler_School_Comp_5_F20
    .word EventHandler_School_Comp_5_F20
    .word EventHandler_School_Comp_5_F20
    .word EventHandler_School_Comp_5_F20
    .word EventHandler_School_Comp_5_F20
    .word EventHandler_School_Comp_5_F20
    .word EventHandler_School_Comp_5_F20
    .word EventHandler_School_Comp_5_F20


_ts MapSetup_School_Comp_5_F20
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    mov        r0,#0x0
    bl         Flag_Set380
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    bne        LAB_08041ae6
    cmp        r1,#0x80
    beq        LAB_08041af2
LAB_08041ae6:
    push       {r5}
    ldr        r0,DAT_08041b34
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_08041af2:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_School_Comp_5_F20
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Comp_5_F20_0_08041b38
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}

    .align 2, 0

PTR_EventHandler_School_Comp_5_F20_0_08041b10:
    .word EventHandler_School_Comp_5_F20_0


_ts EventHandler_School_Comp_5_F20_0
    push       {lr}
    pop        {pc}

PTR_PTR_MapSetup_School_Comp_5_F20_08041b18:
    .word PTR_MapSetup_School_Comp_5_F20_08041a70

PTR_BgTask_803ECB0_08041b1c:
    .word BgTask_803ECB0

PTR_BgTask_803ECF8_08041b20:
    .word BgTask_803ECF8

PTR_BgTask_803ED68_08041b24:
    .word BgTask_803ED68

PTR_BgTask_803F138_08041b28:
    .word BgTask_803F138

PTR_EntityAllocParams_804231C_08041b2c:
    .word EntityAllocParams_804231C

PTR_PTR_EventHandler_School_Comp_5_F20_08041b30:
    .word PTR_EventHandler_School_Comp_5_F20_08041a9c

DAT_08041b34:
    .word Scene_MegaManJackIn

PTR_PTR_EventHandler_School_Comp_5_F20_0_08041b38:
    .word PTR_EventHandler_School_Comp_5_F20_0_08041b10
