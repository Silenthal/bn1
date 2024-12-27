#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_WWW_Passage_3_S5
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_Default_0803e5bc
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Sound_AreaSongChange
    pop        {pc}

PTR_MapSetup_Default_0803e520:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_WWW_Passage_3_F54
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default


_ts EventHandler_WWW_Passage_3_S5
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Default_0803e5c0
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Default_0803e54c:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_WWW_Passage_3_F54
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default


_ts MapSetup_WWW_Passage_3_F54
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
    pop        {pc}


_nt EventHandler_WWW_Passage_3_F54
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_WWW_Passage_3_F54_0_0803e5c4
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_WWW_Passage_3_F54_0_0803e598:
    .word EventHandler_WWW_Passage_3_F54_0


_ts EventHandler_WWW_Passage_3_F54_0
    push       {lr}
    mov        r0,#0xfc
    bl         Flag_GetBase
    beq        LAB_0803e5ba
    mov        r0,#0x1f
    bl         Flag_GetEmailReceived
    bne        LAB_0803e5ba
    push       {r5}
    ldr        r0,DAT_0803e5c8
    ldr        r1,DAT_0803e5cc
    bl         Scene_Prepare
    pop        {r5}
LAB_0803e5ba:
    pop        {pc}

PTR_PTR_MapSetup_Default_0803e5bc:
    .word PTR_MapSetup_Default_0803e520

PTR_PTR_EventHandler_Default_0803e5c0:
    .word PTR_EventHandler_Default_0803e54c

PTR_PTR_EventHandler_WWW_Passage_3_F54_0_0803e5c4:
    .word PTR_EventHandler_WWW_Passage_3_F54_0_0803e598

DAT_0803e5c8:
    .word Scene_CheckMail

DAT_0803e5cc:
    .word 0x101
