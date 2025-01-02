#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_Rocket_Comp_S5
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,PTR_PTR_MapSetup_Default_0804df38
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_804CCB0_0804df3c
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_804CCF8_0804df40
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_804CD30_0804df44
    bl         BgTask_AddNew
    ldr        r0,DAT_0804df48
    ldr        r1,DAT_0804df4c
    ldr        r2,PTR_IRQ_Dummy_0804df50
    bl         BgUpdate_Set
    pop        {r5}
    pop        {pc}

PTR_MapSetup_Default_0804de4c:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Rocket_Comp_F54


_ts EventHandler_Rocket_Comp_S5
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Default_0804df54
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r0,#0xfd
    bl         CheckForJackOut
    pop        {pc}

    .align 2, 0

PTR_EventHandler_Default_0804de74:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Rocket_Comp_F54


_ts MapSetup_Rocket_Comp_F54
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
    bne        LAB_0804deb0
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_0804debc
LAB_0804deb0:
    push       {r5}
    ldr        r0,DAT_0804df58
    ldr        r1,PTR_DAT_0804df5c
    bl         Scene_Prepare
    pop        {r5}
LAB_0804debc:
    Flag_GetBase 0xFE
    beq        LAB_0804dede
    LoadMain world, r0, r0
    mov        r1,#0x0
    strb       r1,[r0,#0x7]
    bl         Sound_StopAllMusic
    push       {r5}
    ldr        r0,DAT_0804df60
    mov        r1,#0x19
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_0804dee8
LAB_0804dede:
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_804EB1C_0804df64
    bl         Entity_AllocList
    pop        {r5}
LAB_0804dee8:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_Rocket_Comp_F54
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Rocket_Comp_F54_0_0804df68
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_Rocket_Comp_F54_0_0804df00:
    .word EventHandler_Rocket_Comp_F54_0


_ts EventHandler_Rocket_Comp_F54_0
    push       {lr}
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x10
    bne        LAB_0804df34
    Flag_GetBase 0xFE
    bne        LAB_0804df34
    Flag_SetBase 0xFE
    push       {r5}
    ldr        r0,PTR_Scene_Rocket_Comp_LifeVirus_0804df6c
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_0804df34:
    pop        {pc}

    .align 2, 0

PTR_PTR_MapSetup_Default_0804df38:
    .word PTR_MapSetup_Default_0804de4c

PTR_BgTask_804CCB0_0804df3c:
    .word BgTask_804CCB0

PTR_BgTask_804CCF8_0804df40:
    .word BgTask_804CCF8

PTR_BgTask_804CD30_0804df44:
    .word BgTask_804CD30

DAT_0804df48:
    .word BgUpdate_NoMove

DAT_0804df4c:
    .word BgUpdate_MoveLeft

PTR_IRQ_Dummy_0804df50:
    .word IRQ_Dummy_far

PTR_PTR_EventHandler_Default_0804df54:
    .word PTR_EventHandler_Default_0804de74

DAT_0804df58:
    .word Scene_MegaManJackIn

PTR_DAT_0804df5c:
    .word 0x2000

DAT_0804df60:
    .word Scene_ChangeMap

PTR_EntityAllocParams_804EB1C_0804df64:
    .word EntityAllocParams_804EB1C

PTR_PTR_EventHandler_Rocket_Comp_F54_0_0804df68:
    .word PTR_EventHandler_Rocket_Comp_F54_0_0804df00

PTR_Scene_Rocket_Comp_LifeVirus_0804df6c:
    .word Scene_Rocket_Comp_LifeVirus
