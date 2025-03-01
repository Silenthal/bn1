#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


MapEntranceOptions_ARRAY_080835d8:
    MapEntrance Map_ACDC_Lan_Living_Room, d_s, f(-90, -26, 0)
    .byte -1, 0x0, 0x0, 0x0
    MapEntrance Map_School_Class_5A, d_s, f(-77, -28, 0)
    .byte -1, 0x0, 0x1, 0x0
    MapEntrance Map_ACDC_Lan_Room, d_s, f(-10, 52, 0)
    .byte -1, 0x0, 0x0, 0x0
    MapEntrance Map_ACDC_Mayl_Living_Room, d_s, f(-98, 62, 0)
    .byte -1, 0x0, 0x0, 0x0
    MapEntrance Map_ACDC_Yai_Room, d_s, f(14, -26, 0)
    .byte -1, 0x0, 0x0, 0x0
    MapEntrance Map_ACDC_Dex_Room, d_s, f(-72, 38, 0)
    .byte -1, 0x0, 0x0, 0x0
    MapEntrance Map_Govt_Waterworks_Office, d_s, f(38, 92, 0)
    .byte -1, 0x0, 0x0, 0x0
    MapEntrance Map_Govt_Yuichiro_Lab, d_s, f(-40, 270, 0)
    .byte -1, 0x0, 0x0, 0x0
    MapEntrance Map_DenTown_Block_1, d_se, f(-68, -48, 0)
    .byte -1, 0x0, 0x0, 0x0
    MapEntrance Map_DenTown_Block_1, d_se, f(-68, -48, 0)
    .byte -1, 0x0, 0x1, 0x0
    MapEntrance Map_SciLab_Power_Plant_Control_Room, d_s, f(20, 6, 0)
    .byte -1, 0x0, 0x0, 0x0
    MapEntrance Map_School_Class_5A, d_s, f(0, 0, 0)
    .byte -1, 0x0, 0x1, 0x0


_ts Scene_JackOut
    push       {lr}
    ldr        r0,PTR_PTR_Scene_JackOut_0_CheckIndex_0808386c
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_Scene_JackOut_0_CheckIndex_080836d8:
    .word Scene_JackOut_0_CheckIndex
    .word Scene_JackOut_1
    .word Scene_JackOut_2_FadeOut
    .word Scene_JackOut_3_ChangeMap
    .word Scene_JackOut_4_Regular
    .word Scene_JackOut_5_Cancel
    .word Scene_JackOut_6_NoJackOut
    .word Scene_JackOut_7_End


_ts Scene_JackOut_0_CheckIndex
    push       {lr}
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    ldrb       r0,[r5,#Scene_dialogueIndex]
    cmp        r0,#0xff
    beq        LAB_08083720
    cmp        r0,#0xfe
    beq        LAB_08083720
    cmp        r0,#0xfd
    beq        LAB_08083720
    mov        r2,#0x14
    mul        r2,r0
    ldr        r0,PTR_MapEntranceOptions_ARRAY_08083870
    add        r0,r0,r2
    str        r0,[r5,#Scene_sceneArg]
    mov        r0,#0x4
    strb       r0,[r5,#Scene_state_s0]
    pop        {pc}
LAB_08083720:
    mov        r0,#0x18
    strb       r0,[r5,#Scene_state_s0]
    pop        {pc}

    .align 2, 0



_ts Scene_JackOut_1
    push       {lr}
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08083784
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_08083784
    push       {r5}
    mov        r0,#0x4
    bl         PlayerAnimation_SetState
    LoadMain world, r7, r7
    ldr        r7,[r7,#World_playerLocation]
    mov        r0,#0x4
    strb       r0,[r7,#PlayerLocation_direction]
    pop        {r5}
    ldr        r0,[r5,#Scene_sceneArg]
    ldrb       r0,[r0,#0x13]
    cmp        r0,#0xff
    beq        LAB_08083770
    push       {r5}
    ldr        r0,PTR_TextData_JackOut_08083874
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    mov        r0,#0x10
    strb       r0,[r5,#Scene_state_s0]
    b          LAB_08083784
LAB_08083770:
    ldr        r0,[r5,#Scene_sceneArg]
    ldrb       r0,[r0,#0x10]
    cmp        r0,#0xff
    beq        LAB_08083780
    push       {r5}
    bl         Text_LoadAreaDialogue
    pop        {r5}
LAB_08083780:
    mov        r0,#0x8
    strb       r0,[r5,#Scene_state_s0]
LAB_08083784:
    pop        {pc}

    .align 2, 0



_ts Scene_JackOut_2_FadeOut
    push       {lr}
    mov        r0,#0x80
    bl         Text_CheckOption
    bne        LAB_080837a2
    push       {r5}
    FadeOut_White
    pop        {r5}
    mov        r0,#0xc
    strb       r0,[r5,#Scene_state_s0]
LAB_080837a2:
    pop        {pc}


_ts Scene_JackOut_3_ChangeMap
    push       {lr}
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080837da
    ldr        r0,[r5,#Scene_sceneArg]
    ldrb       r0,[r0,#0x11]
    tst        r0,r0
    beq        LAB_080837c2
    push       {r5}
    bl         Flag_SetBase
    pop        {r5}
LAB_080837c2:
    push       {r5}
    bl         PlayerAnimation_Unlock
    pop        {r5}
    push       {r5}
    ldr        r0,[r5,#Scene_sceneArg]
    ldrb       r1,[r0,#0x12]
    bl         World_SetTransitionLocation
    pop        {r5}
    bl         Scene_MarkForUnloading
LAB_080837da:
    pop        {pc}


_ts Scene_JackOut_4_Regular
    push       {lr}
    mov        r0,#0x80
    bl         Text_CheckOption
    bne        LAB_080837fe
    bl         TextOption_GetDefaultOption
    cmp        r0,#0x0
    beq        LAB_080837f4
    mov        r0,#0x14
    strb       r0,[r5,#Scene_state_s0]
    b          LAB_080837fe
LAB_080837f4:
    mov        r0,#0x8
    strb       r0,[r5,#Scene_state_s0]
    Flag_ClearBase 0x35
LAB_080837fe:
    pop        {pc}


_ts Scene_JackOut_5_Cancel
    push       {lr}
    push       {r5}
    bl         PlayerAnimation_Unlock
    pop        {r5}
    bl         Scene_MarkForUnloading
    pop        {pc}


_ts Scene_JackOut_6_NoJackOut
    push       {lr}
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08083850
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_08083850
    push       {r5}
    mov        r0,#0x4
    bl         PlayerAnimation_SetState
    LoadMain world, r7, r7
    ldr        r7,[r7,#World_playerLocation]
    mov        r0,#0x4
    strb       r0,[r7,#PlayerLocation_direction]
    ldrb       r2,[r5,#Scene_dialogueIndex]
    mov        r1,#0xff
    sub        r1,r1,r2
    add        r1,#0x5
    ldr        r0,PTR_TextData_JackOut_08083874
    bl         Text_LoadDialogue
    pop        {r5}
    mov        r0,#0x1c
    strb       r0,[r5,#Scene_state_s0]
LAB_08083850:
    pop        {pc}

    .align 2, 0



_ts Scene_JackOut_7_End
    push       {lr}
    mov        r0,#0x80
    bl         Text_CheckOption
    bne        LAB_0808386a
    push       {r5}
    bl         PlayerAnimation_Unlock
    pop        {r5}
    bl         Scene_MarkForUnloading
LAB_0808386a:
    pop        {pc}

PTR_PTR_Scene_JackOut_0_CheckIndex_0808386c:
    .word PTR_Scene_JackOut_0_CheckIndex_080836d8

PTR_MapEntranceOptions_ARRAY_08083870:
    .word MapEntranceOptions_ARRAY_080835d8

PTR_TextData_JackOut_08083874:
    .word TextData_JackOut
