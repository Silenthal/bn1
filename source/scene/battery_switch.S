#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Scene_BatterySwitch
    push       {lr}
    ldr        r0,PTR_PTR_S_BatterySwitch_0_08092d04
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_S_BatterySwitch_0_08092ac8:
    .word S_BatterySwitch_0
    .word S_BatterySwitch_1_Check
    .word S_BatterySwitch_2_InsertBatteryEnd
    .word S_BatterySwitch_3_SwitchSuccess
    .word S_BatterySwitch_4_SwitchFailure
    .word S_BatterySwitch_5_SwitchOff
    .word S_BatterySwitch_6_SwitchDisableEnd
    .word S_BatterySwitch_7_End
    .word S_BatterySwitch_8_End


_ts S_BatterySwitch_0
    push       {lr}
    push       {r5}
    bl         Flag_SetPlayerInactive
    bl         PlayerAnimation_Lock
    pop        {r5}
    mov        r0,#0x4
    strb       r0,[r5,#Scene_state_s0]
    pop        {pc}


_ts S_BatterySwitch_1_Check
    push       {lr}
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_08092bc2
    LoadMain world, r0, r7
    push       {r5}
    ldr        r0,[r0,#0x28]
    ldrb       r0,[r0,#0x14]
    mov        r1,#0x7
    and        r0,r1
    bl         PlayerAnimation_SetState
    pop        {r5}
    ldrb       r0,[r5,#Scene_dialogueIndex]
    lsl        r0,r0,#0x1c
    lsr        r0,r0,#0x18
    add        r0,#0x50
    mov        r1,#0x0
LAB_08092b2c:
    push       {r0,r1,r5}
    bl         PowerPlant_GetBatteryInSlot
    pop        {r0,r1,r5}
    bne        LAB_08092b4e
    add        r0,#0x1
    add        r1,#0x1
    cmp        r1,#0x10
    blt        LAB_08092b2c
    push       {r5}
    mov        r0,#0x96
    @@ "Insert batteries into the box."
    bl         Text_LoadAreaDialogue
    pop        {r5}
    mov        r0,#0x8
    strb       r0,[r5,#Scene_state_s0]
    b          LAB_08092bc2
LAB_08092b4e:
    ldrb       r0,[r5,#Scene_dialogueIndex]
    lsl        r0,r0,#0x1c
    lsr        r0,r0,#0x18
    add        r0,#0x50
    push       {r0,r5}
    bl         PowerPlant_TestSwitch
    pop        {r0,r5}
    beq        LAB_08092b7a
    push       {r0,r5}
    mov        r0,#0xb7
    @@ "Turn off the switch?"
    bl         Text_LoadAreaDialogue
    pop        {r0,r5}
    push       {r5}
    Flag_ClearBase 0xDD
    pop        {r5}
    mov        r0,#0x14
    strb       r0,[r5,#Scene_state_s0]
    b          LAB_08092bc2
LAB_08092b7a:
    push       {r5}
    ldrb       r0,[r5,#Scene_dialogueIndex]
    lsl        r0,r0,#0x1c
    lsr        r0,r0,#0x18
    add        r0,#0x50
    bl         PowerPlant_TestBatteryCount
    pop        {r5}
    bne        LAB_08092b9c
    push       {r5}
    mov        r0,#0xbc
    @@ "Unpowered batteries detected! Switch disabled to prevent system damage!"
    bl         Text_LoadAreaDialogue
    pop        {r5}
    mov        r0,#0x18
    strb       r0,[r5,#Scene_state_s0]
    b          LAB_08092bc2
LAB_08092b9c:
    push       {r5}
    ldrb       r0,[r5,#Scene_dialogueIndex]
    lsl        r0,r0,#0x1c
    lsr        r0,r0,#0x18
    add        r0,#0x50
    bl         PowerPlant_GetBatteryCount
    pop        {r5}
    push       {r0,r5}
    mov        r0,#0x9a
    @@ "Throw the switch?"
    bl         Text_LoadAreaDialogue
    pop        {r0,r5}
    tst        r0,r0
    beq        LAB_08092bbe
    mov        r0,#0xc
    b          LAB_08092bc0
LAB_08092bbe:
    mov        r0,#0x10
LAB_08092bc0:
    strb       r0,[r5,#Scene_state_s0]
LAB_08092bc2:
    pop        {pc}


_ts S_BatterySwitch_2_InsertBatteryEnd
    push       {lr}
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08092bd6
    mov        r0,#0x1c
    strb       r0,[r5,#Scene_state_s0]
LAB_08092bd6:
    pop        {pc}


_ts S_BatterySwitch_3_SwitchSuccess
    push       {lr}
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08092bec
    mov        r0,#0x1c
    strb       r0,[r5,#Scene_state_s0]
    b          LAB_08092c28
LAB_08092bec:
    push       {r5}
    Flag_GetBase 0xD3
    pop        {r5}
    beq        LAB_08092c28
    ldrb       r0,[r5,#Scene_dialogueIndex]
    lsl        r0,r0,#0x1c
    lsr        r0,r0,#0x18
    add        r0,#0x50
    push       {r5}
    push       {r0}
    bl         PowerPlant_DrainBattery
    pop        {r0}
    push       {r0}
    bl         PowerPlant_SwitchOn
    pop        {r0}
    bl         PowerPlant_CheckPaths
    Flag_ClearBase 0xD3
    mov        r0,#0x9e
    @@ "A bulb has been turned on! A path is revealed!"
    bl         Text_LoadAreaDialogue
    pop        {r5}
    mov        r0,#0x20
    strb       r0,[r5,#Scene_state_s0]
LAB_08092c28:
    pop        {pc}

    .align 2, 0



_ts S_BatterySwitch_4_SwitchFailure
    push       {lr}
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08092c40
    mov        r0,#0x1c
    strb       r0,[r5,#Scene_state_s0]
    b          LAB_08092c74
LAB_08092c40:
    push       {r5}
    Flag_GetBase 0xD3
    pop        {r5}
    beq        LAB_08092c74
    ldrb       r0,[r5,#Scene_dialogueIndex]
    lsl        r0,r0,#0x1c
    lsr        r0,r0,#0x18
    add        r0,#0x50
    push       {r5}
    push       {r0}
    bl         PowerPlant_DrainBattery
    pop        {r0}
    bl         PowerPlant_SwitchOn
    Flag_ClearBase 0xD3
    mov        r0,#0xa2
    @@ "Huh? Nothing happened! Wrong box, maybe?"
    bl         Text_LoadAreaDialogue
    pop        {r5}
    mov        r0,#0x20
    strb       r0,[r5,#Scene_state_s0]
LAB_08092c74:
    pop        {pc}

    .align 2, 0



_ts S_BatterySwitch_5_SwitchOff
    push       {lr}
    push       {r5}
    mov        r0,#0x20
    bl         Text_CheckOption
    pop        {r5}
    beq        LAB_08092cb8
    push       {r5}
    bl         TextOption_GetDefaultOption
    pop        {r5}
    beq        LAB_08092c96
    mov        r0,#0x20
    strb       r0,[r5,#Scene_state_s0]
    b          LAB_08092cb8
LAB_08092c96:
    ldrb       r0,[r5,#Scene_dialogueIndex]
    lsl        r0,r0,#0x1c
    lsr        r0,r0,#0x18
    add        r0,#0x50
    push       {r5}
    push       {r0}
    bl         PowerPlant_SwitchOff
    pop        {r0}
    push       {r0}
    bl         PowerPlant_CheckPaths
    pop        {r0}
    pop        {r5}
    mov        r0,#0x20
    strb       r0,[r5,#Scene_state_s0]
    b          LAB_08092cb8
LAB_08092cb8:
    pop        {pc}

    .align 2, 0



_ts S_BatterySwitch_6_SwitchDisableEnd
    push       {lr}
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08092cce
    mov        r0,#0x1c
    strb       r0,[r5,#Scene_state_s0]
LAB_08092cce:
    pop        {pc}


_ts S_BatterySwitch_7_End
    push       {lr}
    push       {r5}
    bl         Flag_SetPlayerActive
    bl         PlayerAnimation_Unlock
    pop        {r5}
    bl         Scene_MarkForUnloading
    pop        {pc}


_ts S_BatterySwitch_8_End
    push       {lr}
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08092d02
    push       {r5}
    bl         Flag_SetPlayerActive
    bl         PlayerAnimation_Unlock
    pop        {r5}
    bl         Scene_MarkForUnloading
LAB_08092d02:
    pop        {pc}

PTR_PTR_S_BatterySwitch_0_08092d04:
    .word PTR_S_BatterySwitch_0_08092ac8
