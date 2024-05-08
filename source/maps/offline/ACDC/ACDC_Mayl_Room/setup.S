#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set PlayerLocation_Create, 0x8056020


_ts MapSetup_ACDC_Mayl_Room_S0
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_Default_0802da28
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Sound_AreaSongChange
    pop        {pc}
PTR_MapSetup_Default_0802d9a4:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_ACDC_Mayl_Room_F06


_ts EventHandler_ACDC_Mayl_Room_S0
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Default_0802da2c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r0,#0x40
    mov        r1,#0x1d
    bl         CheckForJackIn
    pop        {pc}
PTR_EventHandler_Default_0802d9d4:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_ACDC_Mayl_Room_F06


_ts MapSetup_ACDC_Mayl_Room_F06
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r0,PTR_DAT_0802da30
    bl         Entity_AllocList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_ACDC_Mayl_Room_F06
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Mayl_Room_F06_0_0802da34
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_Mayl_Room_F06_0_0802da20:
    .word EventHandler_ACDC_Mayl_Room_F06_0


_ts EventHandler_ACDC_Mayl_Room_F06_0
    push       {lr}
    pop        {pc}
PTR_PTR_MapSetup_Default_0802da28:
    .word PTR_MapSetup_Default_0802d9a4
PTR_PTR_EventHandler_Default_0802da2c:
    .word PTR_EventHandler_Default_0802d9d4
PTR_DAT_0802da30:
    .word EntityAllocParams_08030FE0
PTR_PTR_EventHandler_ACDC_Mayl_Room_F06_0_0802da34:
    .word PTR_EventHandler_ACDC_Mayl_Room_F06_0_0802da20


_ts MapSetup_ACDC_Mayl_Room_S2
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_ACDC_Mayl_Room_F20_0802db3c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r0,#0xab
    bl         Flag_GetBase
    beq        LAB_0802da56
    push       {r5}
    mov        r0,#0x4
    bl         Sound_ChangeSong
    pop        {r5}
    b          LAB_0802da6e
LAB_0802da56:
    mov        r0,#0xdf
    bl         Flag_GetBase
    beq        LAB_0802da6a
    push       {r5}
    mov        r0,#0x3
    bl         Sound_ChangeSong
    pop        {r5}
    b          LAB_0802da6e
LAB_0802da6a:
    bl         Sound_AreaSongChange
LAB_0802da6e:
    pop        {pc}
PTR_MapSetup_ACDC_Mayl_Room_F20_0802da70:
    .word MapSetup_ACDC_Mayl_Room_F20
    .word MapSetup_ACDC_Mayl_Room_F21
    .word MapSetup_ACDC_Mayl_Room_F21
    .word MapSetup_ACDC_Mayl_Room_F20
    .word MapSetup_ACDC_Mayl_Room_F20
    .word MapSetup_ACDC_Mayl_Room_F20
    .word MapSetup_ACDC_Mayl_Room_F20
    .word MapSetup_ACDC_Mayl_Room_F20


_ts EventHandler_ACDC_Mayl_Room_S2
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Mayl_Room_F20_0802db40
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r0,#0x40
    mov        r1,#0x1d
    bl         CheckForJackIn
    pop        {pc}
PTR_EventHandler_ACDC_Mayl_Room_F20_0802daa4:
    .word EventHandler_ACDC_Mayl_Room_F20
    .word EventHandler_ACDC_Mayl_Room_F21
    .word EventHandler_ACDC_Mayl_Room_F21
    .word EventHandler_ACDC_Mayl_Room_F20
    .word EventHandler_ACDC_Mayl_Room_F20
    .word EventHandler_ACDC_Mayl_Room_F20
    .word EventHandler_ACDC_Mayl_Room_F20
    .word EventHandler_ACDC_Mayl_Room_F20


_ts MapSetup_ACDC_Mayl_Room_F20
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r0,PTR_DAT_0802db44
    bl         Entity_AllocList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_ACDC_Mayl_Room_F20
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Mayl_Room_F20_0_0802db48
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_Mayl_Room_F20_0_0802daf4:
    .word EventHandler_ACDC_Mayl_Room_F20_0


_ts EventHandler_ACDC_Mayl_Room_F20_0
    push       {lr}
    pop        {pc}


_ts MapSetup_ACDC_Mayl_Room_F21
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r0,PTR_DAT_0802db4c
    bl         Entity_AllocList
    ldr        r7,PTR_PTR_DAT_0802db50
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_ACDC_Mayl_Room_F21
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Mayl_Room_F21_0_0802db54
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_ACDC_Mayl_Room_F21_0_0802db34:
    .word EventHandler_ACDC_Mayl_Room_F21_0


_ts EventHandler_ACDC_Mayl_Room_F21_0
    push       {lr}
    pop        {pc}
PTR_PTR_MapSetup_ACDC_Mayl_Room_F20_0802db3c:
    .word PTR_MapSetup_ACDC_Mayl_Room_F20_0802da70
PTR_PTR_EventHandler_ACDC_Mayl_Room_F20_0802db40:
    .word PTR_EventHandler_ACDC_Mayl_Room_F20_0802daa4
PTR_DAT_0802db44:
    .word EntityAllocParams_08030FE0
PTR_PTR_EventHandler_ACDC_Mayl_Room_F20_0_0802db48:
    .word PTR_EventHandler_ACDC_Mayl_Room_F20_0_0802daf4
PTR_DAT_0802db4c:
    .word EntityAllocParams_08030FE0
PTR_PTR_DAT_0802db50:
    .word NPCList_80308E0
PTR_PTR_EventHandler_ACDC_Mayl_Room_F21_0_0802db54:
    .word PTR_EventHandler_ACDC_Mayl_Room_F21_0_0802db34


_ts MapSetup_ACDC_Mayl_Room_S4
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_ACDC_Mayl_Room_F40_0802dbfc
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Sound_AreaSongChange
    pop        {pc}
PTR_MapSetup_ACDC_Mayl_Room_F40_0802db68:
    .word MapSetup_ACDC_Mayl_Room_F40
    .word MapSetup_ACDC_Mayl_Room_F40
    .word MapSetup_ACDC_Mayl_Room_F40
    .word MapSetup_ACDC_Mayl_Room_F40
    .word MapSetup_ACDC_Mayl_Room_F40
    .word MapSetup_ACDC_Mayl_Room_F40
    .word MapSetup_ACDC_Mayl_Room_F40
    .word MapSetup_ACDC_Mayl_Room_F40


_ts EventHandler_ACDC_Mayl_Room_S4
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Mayl_Room_F40_0802dc00
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r0,#0x40
    mov        r1,#0x1d
    bl         CheckForJackIn
    pop        {pc}
PTR_EventHandler_ACDC_Mayl_Room_F40_0802db9c:
    .word EventHandler_ACDC_Mayl_Room_F40
    .word EventHandler_ACDC_Mayl_Room_F40
    .word EventHandler_ACDC_Mayl_Room_F40
    .word EventHandler_ACDC_Mayl_Room_F40
    .word EventHandler_ACDC_Mayl_Room_F40
    .word EventHandler_ACDC_Mayl_Room_F40
    .word EventHandler_ACDC_Mayl_Room_F40
    .word EventHandler_ACDC_Mayl_Room_F40


_ts MapSetup_ACDC_Mayl_Room_F40
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_PTR_DAT_0802dc04
    bl         Map_LoadNPCList
    ldr        r0,PTR_DAT_0802dc08
    bl         Entity_AllocList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_ACDC_Mayl_Room_F40
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Mayl_Room_F40_0_0802dc0c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_ACDC_Mayl_Room_F40_0_0802dbf4:
    .word EventHandler_ACDC_Mayl_Room_F40_0


_ts EventHandler_ACDC_Mayl_Room_F40_0
    push       {lr}
    pop        {pc}
PTR_PTR_MapSetup_ACDC_Mayl_Room_F40_0802dbfc:
    .word PTR_MapSetup_ACDC_Mayl_Room_F40_0802db68
PTR_PTR_EventHandler_ACDC_Mayl_Room_F40_0802dc00:
    .word PTR_EventHandler_ACDC_Mayl_Room_F40_0802db9c
PTR_PTR_DAT_0802dc04:
    .word NPCList_8030900
PTR_DAT_0802dc08:
    .word EntityAllocParams_08030FE0
PTR_PTR_EventHandler_ACDC_Mayl_Room_F40_0_0802dc0c:
    .word PTR_EventHandler_ACDC_Mayl_Room_F40_0_0802dbf4


_ts MapSetup_ACDC_Mayl_Room_S5
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_ACDC_Mayl_Room_F50_0802dcec
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Sound_AreaSongChange
    pop        {pc}
PTR_MapSetup_ACDC_Mayl_Room_F50_0802dc20:
    .word MapSetup_ACDC_Mayl_Room_F50
    .word MapSetup_ACDC_Mayl_Room_F50
    .word MapSetup_ACDC_Mayl_Room_F50
    .word MapSetup_ACDC_Mayl_Room_F50
    .word MapSetup_ACDC_Mayl_Room_F54
    .word MapSetup_ACDC_Mayl_Room_F50
    .word MapSetup_ACDC_Mayl_Room_F50
    .word MapSetup_ACDC_Mayl_Room_F50


_ts EventHandler_ACDC_Mayl_Room_S5
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Mayl_Room_F50_0802dcf0
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r0,#0x40
    mov        r1,#0x1d
    bl         CheckForJackIn
    pop        {pc}
PTR_EventHandler_ACDC_Mayl_Room_F50_0802dc54:
    .word EventHandler_ACDC_Mayl_Room_F50
    .word EventHandler_ACDC_Mayl_Room_F50
    .word EventHandler_ACDC_Mayl_Room_F50
    .word EventHandler_ACDC_Mayl_Room_F50
    .word EventHandler_ACDC_Mayl_Room_F54
    .word EventHandler_ACDC_Mayl_Room_F50
    .word EventHandler_ACDC_Mayl_Room_F50
    .word EventHandler_ACDC_Mayl_Room_F50


_ts MapSetup_ACDC_Mayl_Room_F50
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r0,PTR_DAT_0802dcf4
    bl         Entity_AllocList
    ldr        r7,PTR_PTR_DAT_0802dcf8
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_ACDC_Mayl_Room_F50
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Mayl_Room_F50_0_0802dcfc
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_ACDC_Mayl_Room_F50_0_0802dcac:
    .word EventHandler_ACDC_Mayl_Room_F50_0


_ts EventHandler_ACDC_Mayl_Room_F50_0
    push       {lr}
    pop        {pc}


_ts MapSetup_ACDC_Mayl_Room_F54
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r0,PTR_DAT_0802dd00
    bl         Entity_AllocList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_ACDC_Mayl_Room_F54
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Mayl_Room_F54_0_0802dd04
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_Mayl_Room_F54_0_0802dce4:
    .word EventHandler_ACDC_Mayl_Room_F54_0


_ts EventHandler_ACDC_Mayl_Room_F54_0
    push       {lr}
    pop        {pc}
PTR_PTR_MapSetup_ACDC_Mayl_Room_F50_0802dcec:
    .word PTR_MapSetup_ACDC_Mayl_Room_F50_0802dc20
PTR_PTR_EventHandler_ACDC_Mayl_Room_F50_0802dcf0:
    .word PTR_EventHandler_ACDC_Mayl_Room_F50_0802dc54
PTR_DAT_0802dcf4:
    .word EntityAllocParams_08030FE0
PTR_PTR_DAT_0802dcf8:
    .word NPCList_8030900
PTR_PTR_EventHandler_ACDC_Mayl_Room_F50_0_0802dcfc:
    .word PTR_EventHandler_ACDC_Mayl_Room_F50_0_0802dcac
PTR_DAT_0802dd00:
    .word EntityAllocParams_08030FE0
PTR_PTR_EventHandler_ACDC_Mayl_Room_F54_0_0802dd04:
    .word PTR_EventHandler_ACDC_Mayl_Room_F54_0_0802dce4
