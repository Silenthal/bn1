#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_WWW_Rocket_Hangar_S5
    push       {lr}
    push       {r0,r1}
    bl         Sound_AreaSongChange
    pop        {r0,r1}
    ldr        r0,PTR_PTR_MapSetup_Default_0803e23c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_803D814_0803e240
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_803D844_0803e244
    bl         BgTask_AddNew
    pop        {r5}
    pop        {pc}

PTR_MapSetup_Default_0803e140:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_WWW_Rocket_Hangar_F54
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default


_ts EventHandler_WWW_Rocket_Hangar_S5
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Default_0803e248
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Default_0803e16c:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_WWW_Rocket_Hangar_F54
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default


_ts MapSetup_WWW_Rocket_Hangar_F54
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    Flag_GetBase 0xF8
    bne        LAB_0803e1be
    LoadMain world, r0, r0
    mov        r1,#0x0
    strb       r1,[r0,#World_fadeType]
    push       {r5}
    ldr        r0,PTR_Scene_Story_73_0803e24c
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_0803e21e
LAB_0803e1be:
    Flag_GetBase 0xE7
    bne        LAB_0803e1dc
    LoadMain world, r0, r0
    mov        r1,#0x0
    strb       r1,[r0,#World_fadeType]
    push       {r5}
    ldr        r0,PTR_Scene_Story_7A_0803e250
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_0803e21e
LAB_0803e1dc:
    Flag_GetBase 0xE8
    bne        LAB_0803e1fe
    LoadMain world, r0, r0
    mov        r1,#0x0
    strb       r1,[r0,#World_fadeType]
    bl         Sound_StopAllMusic
    push       {r5}
    ldr        r0,PTR_Scene_Story_7B_0803e254
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_0803e21e
LAB_0803e1fe:
    Flag_GetBase 0xEB
    bne        LAB_0803e21e
    LoadMain world, r0, r0
    mov        r1,#0x0
    strb       r1,[r0,#World_fadeType]
    bl         Sound_StopAllMusic
    push       {r5}
    ldr        r0,PTR_Scene_Story_7E_0803e258
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_0803e21e:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_WWW_Rocket_Hangar_F54
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_WWW_Rocket_Hangar_F54_0_0803e25c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_WWW_Rocket_Hangar_F54_0_0803e234:
    .word EventHandler_WWW_Rocket_Hangar_F54_0


_ts EventHandler_WWW_Rocket_Hangar_F54_0
    push       {lr}
    pop        {pc}

PTR_PTR_MapSetup_Default_0803e23c:
    .word PTR_MapSetup_Default_0803e140

PTR_BgTask_803D814_0803e240:
    .word BgTask_803D814

PTR_BgTask_803D844_0803e244:
    .word BgTask_803D844

PTR_PTR_EventHandler_Default_0803e248:
    .word PTR_EventHandler_Default_0803e16c

PTR_Scene_Story_73_0803e24c:
    .word Scene_Story_73

PTR_Scene_Story_7A_0803e250:
    .word Scene_Story_7A

PTR_Scene_Story_7B_0803e254:
    .word Scene_Story_7B

PTR_Scene_Story_7E_0803e258:
    .word Scene_Story_7E

PTR_PTR_EventHandler_WWW_Rocket_Hangar_F54_0_0803e25c:
    .word PTR_EventHandler_WWW_Rocket_Hangar_F54_0_0803e234
