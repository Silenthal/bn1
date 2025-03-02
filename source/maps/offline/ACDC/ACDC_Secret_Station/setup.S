#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_ACDC_Secret_Station_S5
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_Default_0802f978
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Sound_AreaSongChange
    pop        {pc}
PTR_MapSetup_Default_0802f864:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_ACDC_Secret_Station_F54
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default


_ts EventHandler_ACDC_Secret_Station_S5
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Default_0802f97c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_Default_0802f894:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_ACDC_Secret_Station_F54
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default


_ts MapSetup_ACDC_Secret_Station_F54
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_BgTask_802F980
    bl         BgTask_AddNew
    pop        {r5}
    Flag_GetBase 0xA9
    bne        LAB_0802f8f2
    LoadMain world, r0, r0
    mov        r1,#0x0
    strb       r1,[r0,#World_fadeType]
    push       {r5}
    ldr        r0,PTR_Scene_Story_6C_0802f984
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_0802f8f2:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_ACDC_Secret_Station_F54
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Secret_Station_F54_0_0802f988
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_Secret_Station_F54_0_0802f908:
    .word EventHandler_ACDC_Secret_Station_F54_0


_ts EventHandler_ACDC_Secret_Station_F54_0
    push       {lr}
    Flag_GetBase 0x74
    beq        LAB_0802f92a
    ldrb       r0,[r5,#0x6]
    sub        r0,#0x1
    strb       r0,[r5,#0x6]
    tst        r0,r0
    bne        LAB_0802f92a
    mov        r0,#0xd1
    bl         Sound_PlaySE
    mov        r0,#0x36
    strb       r0,[r5,#0x6]
LAB_0802f92a:
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#World_playerLocation]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x10
    bne        LAB_0802f974
    Flag_GetBase 0xAA
    beq        LAB_0802f974
    Flag_GetBase 0xAB
    bne        LAB_0802f968
    Flag_SetBase 0xAC
    mov        r0,#0xbf
    bl         Sound_PlaySE
    push       {r5}
    ldr        r0,DAT_0802f98c
    mov        r1,#0x17
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_0802f974
LAB_0802f968:
    push       {r5}
    ldr        r0,PTR_Scene_TrainRide_0802f990
    mov        r1,#0x6
    bl         Scene_Prepare
    pop        {r5}
LAB_0802f974:
    pop        {pc}

    .align 2, 0

PTR_PTR_MapSetup_Default_0802f978:
    .word PTR_MapSetup_Default_0802f864
PTR_PTR_EventHandler_Default_0802f97c:
    .word PTR_EventHandler_Default_0802f894
PTR_BgTask_802F980:
    .word BgTask_ACDC_Station_Tileset_Gate_Closed
PTR_Scene_Story_6C_0802f984:
    .word Scene_Story_6C
PTR_PTR_EventHandler_ACDC_Secret_Station_F54_0_0802f988:
    .word PTR_EventHandler_ACDC_Secret_Station_F54_0_0802f908
DAT_0802f98c:
    .word Scene_ChangeMap
PTR_Scene_TrainRide_0802f990:
    .word Scene_TrainRide
