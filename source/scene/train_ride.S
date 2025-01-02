#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


    cam_end

    .align 2, 0


listTrainDestination:
    MapEntrance Map_Govt_Complex_Station, d_sw, f(-18, 8, 0)
    .byte 0x15, 0x0, 0x0, 0x0
    MapEntrance Map_ACDC_Station, d_sw, f(-18, 8, 0)
    .byte 0x9, 0x0, 0x0, 0x0
    MapEntrance Map_DenTown_Station, d_sw, f(-18, 8, 0)
    .byte 0x18, 0x0, 0x0, 0x0
    MapEntrance Map_DenTown_Station, d_sw, f(-18, 8, 0)
    .byte 0xC, 0x0, 0x0, 0x0
    MapEntrance Map_ACDC_Station, d_sw, f(-18, 8, 0)
    .byte 0x5, 0x0, 0x0, 0x0
    MapEntrance Map_Govt_Complex_Station, d_sw, f(-18, 8, 0)
    .byte 0x6, 0x0, 0x0, 0x0
    MapEntrance Map_WWW_Base, d_sw, f(-190, -50, -64)
    .byte -1, 0x0, 0x0, 0x0


_ts Scene_TrainRide
    push       {lr}
    ldr        r0,PTR_PTR_S_TrainRide_0_0808b834
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_TrainRide_0_0808b694:
    .word S_TrainRide_0
    .word S_TrainRide_1
    .word S_TrainRide_2
    .word S_TrainRide_3
    .word S_TrainRide_4
    .word S_TrainRide_5
    .word S_TrainRide_6


_ts S_TrainRide_0
    ldr        r0,PTR_listTrainDestination_0808b838
    ldrb       r1,[r5,#0x4]
    mov        r2,#0x14
    mul        r2,r1
    add        r0,r0,r2
    str        r0,[r5,#0x10]
    bl         Flag_SetPlayerInactive
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_TrainRide_1
    push       {r5}
    ldr        r0,[r5,#0x10]
    ldrb       r0,[r0,#0x10]
    cmp        r0,#0xff
    beq        LAB_0808b6d6
    bl         Text_LoadAreaDialogue
LAB_0808b6d6:
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_TrainRide_2
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808b71e
    push       {r5}
    mov        r0,#0xbf
    bl         Sound_PlaySongImmediate
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_BgTask_ACDC_Station_Tileset_Gate_Open_0808b83c
    bl         BgTask_AddNew
    pop        {r5}
    Flag_SetIgnore F_IGNORE_WALL_00
    bl         Flag_SetPlayerActive
    bl         PlayerAnimation_Lock
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    bl         Scene_IsStartPressed
    beq        LAB_0808b71e
    mov        r0,#0x14
    strb       r0,[r5,#0x0]
LAB_0808b71e:
    bl         Scene_IsStartPressed
    beq        LAB_0808b728
    bl         S_TrainRide_SkipIfStart
LAB_0808b728:
    pop        {pc}


_nt S_TrainRide_3
    bl         PlayerAnimation_GetState
    cmp        r0,#0x2
    bne        LAB_0808b746
    push       {r5}
    mov        r0,#0x9
    bl         PlayerAnimation_SetState
    pop        {r5}
    mov        r0,#0x1e
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808b746:
    bl         Scene_IsStartPressed
    beq        LAB_0808b750
    bl         S_TrainRide_SkipIfStart
LAB_0808b750:
    pop        {pc}


_nt S_TrainRide_4
    mov        r0,#0x8
    lsl        r0,r0,#0xc
    mov        r1,#0x0
    mov        r2,#0x0
    bl         PlayerAnimation_Move
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    cmp        r0,#0x14
    bne        LAB_0808b776
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    pop        {pc}
LAB_0808b776:
    cmp        r0,#0x0
    bne        LAB_0808b780
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808b780:
    bl         Scene_IsStartPressed
    beq        LAB_0808b78a
    bl         S_TrainRide_SkipIfStart
LAB_0808b78a:
    pop        {pc}


_ts S_TrainRide_5
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808b7b8
    push       {r5}
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_BgTask_ACDC_Station_Tileset_Gate_Open_0808b840
    bl         BgTask_AddNew
    pop        {r5}
    Flag_SetIgnore F_IGNORE_WALL_00
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808b7b8:
    pop        {pc}


_nt S_TrainRide_6
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808b81a
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    LoadMain world, r0, r7
    mov        r1,#0x3
    strb       r1,[r0,#0x7]
    ldr        r0,[r7,#0x2c]
    mov        r1,#0x1
    strb       r1,[r0,#0x10]
    ldr        r2,[r5,#0x10]
    strb       r1,[r0,#0x12]
    str        r2,[r0,#0x14]
    push       {r5}
    ldr        r0,[r5,#0x10]
    ldrb       r0,[r0,#0x12]
    bl         World_ChangeMap
    pop        {r5}
    push       {r5}
    mov        r0,#0x1f
    bl         Entity_FreeAllMultiple
    pop        {r5}
    push       {r5}
    bl         PlayerAnimation_Unlock
    bl         Flag_SetPlayerActive
    pop        {r5}
    ldrb       r1,[r5,#0x4]
    cmp        r1,#0x6
    beq        LAB_0808b816
    Flag_ClearBase 0x2A
LAB_0808b816:
    bl         Scene_UnloadAndResetStepCounter
LAB_0808b81a:
    pop        {pc}


_ts S_TrainRide_SkipIfStart
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x14
    strb       r0,[r5,#0x0]
    pop        {pc}

PTR_PTR_S_TrainRide_0_0808b834:
    .word PTR_S_TrainRide_0_0808b694

PTR_listTrainDestination_0808b838:
    .word listTrainDestination

PTR_BgTask_ACDC_Station_Tileset_Gate_Open_0808b83c:
    .word BgTask_ACDC_Station_Tileset_Gate_Open

PTR_BgTask_ACDC_Station_Tileset_Gate_Open_0808b840:
    .word BgTask_ACDC_Station_Tileset_Gate_Open
