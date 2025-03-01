#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Scene_Battery
    push       {lr}
    ldr        r0,PTR_PTR_S_Battery_0_08092ab4
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_S_Battery_0_0809273c:
    .word S_Battery_0
    .word S_Battery_1
    .word S_Battery_2_SwitchActivatedEnd
    .word S_Battery_3_GetBattery
    .word S_Battery_4_InsertBatteryPromptEnd
    .word S_Battery_5_UseBattery
    .word S_Battery_6_End
    .word S_Battery_7_End
    .word S_Battery_8_BatteryCountDialogueEnd


_ts S_Battery_0
    push       {lr}
    push       {r5}
    bl         Flag_SetPlayerInactive
    bl         PlayerAnimation_Lock
    pop        {r5}
    mov        r0,#0x4
    strb       r0,[r5,#Scene_state_s0]
    pop        {pc}


_ts S_Battery_1
    push       {lr}
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_08092834
    LoadMain world, r0, r7
    push       {r5}
    ldr        r0,[r0,#World_playerLocation]
    ldrb       r0,[r0,#PlayerLocation_currDirMoveIndex]
    mov        r1,#0x7
    and        r0,r1
    bl         PlayerAnimation_SetState
    pop        {r5}
    ldrb       r0,[r5,#Scene_dialogueIndex]
    push       {r0,r5}
    bl         PowerPlant_GetBatteryInSlot
    pop        {r0,r5}
    bne        LAB_080927fa
    push       {r5}
    bl         PowerPlant_TestSwitch
    pop        {r5}
    bne        LAB_08092806
    push       {r5}
    mov        r0,#0x9
    bl         KeyItem_IsPresent
    push       {r0}
    mov        r0,#0xa
    bl         KeyItem_IsPresent
    push       {r0}
    mov        r0,#0xb
    bl         KeyItem_IsPresent
    push       {r0}
    mov        r0,#0xc
    bl         KeyItem_IsPresent
    push       {r0}
    mov        r0,#0xd
    bl         KeyItem_IsPresent
    pop        {r1}
    add        r0,r0,r1
    pop        {r1}
    add        r0,r0,r1
    pop        {r1}
    add        r0,r0,r1
    pop        {r1}
    add        r0,r0,r1
    pop        {r5}
    tst        r0,r0
    bne        LAB_08092826
    push       {r5}
    mov        r0,#0xab
    @@ "Insert batteries into the box."
    bl         Text_LoadAreaDialogue
    pop        {r5}
    mov        r0,#0x10
    strb       r0,[r5,#Scene_state_s0]
    b          LAB_08092834
LAB_080927fa:
    ldrb       r0,[r5,#Scene_dialogueIndex]
    push       {r5}
    bl         PowerPlant_TestSwitch
    pop        {r5}
    beq        LAB_08092816
LAB_08092806:
    push       {r5}
    mov        r0,#0xc0
    @@ "Switch activated! Deactivate before touching boxes!"
    bl         Text_LoadAreaDialogue
    pop        {r5}
    mov        r0,#0x8
    strb       r0,[r5,#Scene_state_s0]
    b          LAB_08092834
LAB_08092816:
    push       {r5}
    mov        r0,#0xa6
    @@ "Remove this battery?"
    bl         Text_LoadAreaDialogue
    pop        {r5}
    mov        r0,#0xc
    strb       r0,[r5,#Scene_state_s0]
    b          LAB_08092834
LAB_08092826:
    push       {r5}
    mov        r0,#0xc4
    @@ "Put a battery in this box?"
    bl         Text_LoadAreaDialogue
    pop        {r5}
    mov        r0,#0x14
    strb       r0,[r5,#Scene_state_s0]
LAB_08092834:
    pop        {pc}

    .align 2, 0



_ts S_Battery_2_SwitchActivatedEnd
    push       {lr}
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0809284a
    mov        r0,#0x1c
    strb       r0,[r5,#Scene_state_s0]
LAB_0809284a:
    pop        {pc}


_ts S_Battery_3_GetBattery
    push       {lr}
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08092888
    push       {r5}
    bl         TextOption_GetDefaultOption
    pop        {r5}
    beq        LAB_0809286a
    mov        r0,#0x1c
    strb       r0,[r5,#Scene_state_s0]
    b          LAB_08092888
LAB_0809286a:
    ldrb       r0,[r5,#Scene_dialogueIndex]
    push       {r5}
    bl         PowerPlant_GetBatteryInSlot
    mov        r1,#0x1
    bl         KeyItem_SetAmount
    pop        {r5}
    push       {r5}
    ldrb       r0,[r5,#Scene_dialogueIndex]
    bl         PowerPlant_RemoveBattery
    pop        {r5}
    mov        r0,#0x1c
    strb       r0,[r5,#Scene_state_s0]
LAB_08092888:
    pop        {pc}

    .align 2, 0



_ts S_Battery_4_InsertBatteryPromptEnd
    push       {lr}
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0809289e
    mov        r0,#0x1c
    strb       r0,[r5,#Scene_state_s0]
LAB_0809289e:
    pop        {pc}


_ts S_Battery_5_UseBattery
    push       {lr}
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_080928b4
    mov        r0,#0x1c
    strb       r0,[r5,#Scene_state_s0]
    b          LAB_08092a74
LAB_080928b4:
    push       {r5}
    Flag_GetBase 0xD3
    pop        {r5}
    bne        LAB_080928c2
    pop        {pc}
LAB_080928c2:
    push       {r5}
    Flag_ClearBase 0xD3
    pop        {r5}
    mov        r7,#0x0
    mov        r8,r7
    push       {r5}
    mov        r0,#0x9
    bl         KeyItem_IsPresent
    pop        {r5}
    tst        r0,r0
    beq        LAB_0809290e
    push       {r5}
    mov        r0,#0x50
    bl         KeyItem_IsPresent
    pop        {r5}
    tst        r0,r0
    beq        LAB_0809290e
    ldrb       r0,[r5,#Scene_dialogueIndex]
    push       {r0,r5}
    bl         PowerPlant_GetBatteryInSlot
    pop        {r0,r5}
    bne        LAB_0809290e
    push       {r5}
    mov        r1,#0x9
    bl         PowerPlant_AddBattery
    mov        r0,#0x9
    mov        r1,#0x1
    bl         KeyItem_SubtractAmount
    mov        r7,#0x1
    mov        r8,r7
    pop        {r5}
LAB_0809290e:
    push       {r5}
    mov        r0,#0xa
    bl         KeyItem_IsPresent
    pop        {r5}
    tst        r0,r0
    beq        LAB_0809294c
    push       {r5}
    mov        r0,#0x51
    bl         KeyItem_IsPresent
    pop        {r5}
    tst        r0,r0
    beq        LAB_0809294c
    ldrb       r0,[r5,#Scene_dialogueIndex]
    push       {r0,r5}
    bl         PowerPlant_GetBatteryInSlot
    pop        {r0,r5}
    bne        LAB_0809294c
    push       {r5}
    mov        r1,#0xa
    bl         PowerPlant_AddBattery
    mov        r0,#0xa
    mov        r1,#0x1
    bl         KeyItem_SubtractAmount
    mov        r7,#0x1
    mov        r8,r7
    pop        {r5}
LAB_0809294c:
    push       {r5}
    mov        r0,#0xb
    bl         KeyItem_IsPresent
    pop        {r5}
    tst        r0,r0
    beq        LAB_0809298a
    push       {r5}
    mov        r0,#0x52
    bl         KeyItem_IsPresent
    pop        {r5}
    tst        r0,r0
    beq        LAB_0809298a
    ldrb       r0,[r5,#Scene_dialogueIndex]
    push       {r0,r5}
    bl         PowerPlant_GetBatteryInSlot
    pop        {r0,r5}
    bne        LAB_0809298a
    push       {r5}
    mov        r1,#0xb
    bl         PowerPlant_AddBattery
    mov        r0,#0xb
    mov        r1,#0x1
    bl         KeyItem_SubtractAmount
    mov        r7,#0x1
    mov        r8,r7
    pop        {r5}
LAB_0809298a:
    push       {r5}
    mov        r0,#0xc
    bl         KeyItem_IsPresent
    pop        {r5}
    tst        r0,r0
    beq        LAB_080929c8
    push       {r5}
    mov        r0,#0x53
    bl         KeyItem_IsPresent
    pop        {r5}
    tst        r0,r0
    beq        LAB_080929c8
    ldrb       r0,[r5,#Scene_dialogueIndex]
    push       {r0,r5}
    bl         PowerPlant_GetBatteryInSlot
    pop        {r0,r5}
    bne        LAB_080929c8
    push       {r5}
    mov        r1,#0xc
    bl         PowerPlant_AddBattery
    mov        r0,#0xc
    mov        r1,#0x1
    bl         KeyItem_SubtractAmount
    mov        r7,#0x1
    mov        r8,r7
    pop        {r5}
LAB_080929c8:
    push       {r5}
    mov        r0,#0xd
    bl         KeyItem_IsPresent
    pop        {r5}
    tst        r0,r0
    beq        LAB_08092a06
    push       {r5}
    mov        r0,#0x54
    bl         KeyItem_IsPresent
    pop        {r5}
    tst        r0,r0
    beq        LAB_08092a06
    ldrb       r0,[r5,#Scene_dialogueIndex]
    push       {r0,r5}
    bl         PowerPlant_GetBatteryInSlot
    pop        {r0,r5}
    bne        LAB_08092a06
    push       {r5}
    mov        r1,#0xd
    bl         PowerPlant_AddBattery
    mov        r0,#0xd
    mov        r1,#0x1
    bl         KeyItem_SubtractAmount
    mov        r7,#0x1
    mov        r8,r7
    pop        {r5}
LAB_08092a06:
    mov        r7,r8
    tst        r7,r7
    bne        LAB_08092a1c
    push       {r5}
    add        r0,#0xc8
    bl         Text_LoadAreaDialogue
    pop        {r5}
    mov        r0,#0x20
    strb       r0,[r5,#Scene_state_s0]
    b          LAB_08092a74
LAB_08092a1c:
    mov        r0,#0x0
    push       {r0,r5}
    Flag_GetBase 0xD8
    pop        {r0,r5}
    beq        LAB_08092a2c
    add        r0,#0x1
LAB_08092a2c:
    push       {r0,r5}
    Flag_GetBase 0xD9
    pop        {r0,r5}
    beq        LAB_08092a3a
    add        r0,#0x2
LAB_08092a3a:
    push       {r0,r5}
    Flag_GetBase 0xDA
    pop        {r0,r5}
    beq        LAB_08092a48
    add        r0,#0x4
LAB_08092a48:
    push       {r0,r5}
    Flag_GetBase 0xDB
    pop        {r0,r5}
    beq        LAB_08092a56
    add        r0,#0x8
LAB_08092a56:
    push       {r0,r5}
    Flag_GetBase 0xDC
    pop        {r0,r5}
    beq        LAB_08092a64
    add        r0,#0x10
LAB_08092a64:
    push       {r5}
    @@ Battery count
    add        r0,#0xc8
    bl         Text_LoadAreaDialogue
    pop        {r5}
    mov        r0,#0x20
    strb       r0,[r5,#Scene_state_s0]
    b          LAB_08092a74
LAB_08092a74:
    pop        {pc}

    .align 2, 0



_ts S_Battery_6_End
    push       {lr}
    mov        r0,#0x1c
    strb       r0,[r5,#Scene_state_s0]
    pop        {pc}


_ts S_Battery_7_End
    push       {lr}
    push       {r5}
    bl         Flag_SetPlayerActive
    bl         PlayerAnimation_Unlock
    pop        {r5}
    bl         Scene_MarkForUnloading
    pop        {pc}


_ts S_Battery_8_BatteryCountDialogueEnd
    push       {lr}
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08092ab2
    push       {r5}
    bl         Flag_SetPlayerActive
    bl         PlayerAnimation_Unlock
    pop        {r5}
    bl         Scene_MarkForUnloading
LAB_08092ab2:
    pop        {pc}

PTR_PTR_S_Battery_0_08092ab4:
    .word PTR_S_Battery_0_0809273c
