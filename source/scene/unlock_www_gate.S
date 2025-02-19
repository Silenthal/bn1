#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


Cam_Set_08086D24:
    cam_end

    .align 2, 0


PTR_ARRAY_08086d28:
    .word ScenarioData_16
    .word 0xFFFF
    .word 0xFFFF
    .word 0xFFFF
    .word 0xFFFF
    .word 0xFFFF
    .word 0xFFFF
    .word 0xFFFF
    .word 0xFFFF
    .word 0xFFFF
    .word 0xFFFF
    .word 0xFFFF
    .word 0xFFFF
    .word 0xFFFF
    .word 0xFFFF
    .word 0xFFFF
    .word 0xFFFF
    .word 0xFFFF
    .word 0xFFFF
    .word 0xFFFF
    .word 0xFFFF
    .word 0xFFFF
    .word 0xFFFF
    .word 0xFFFF
    .word 0xFFFF
    .word 0xFFFF
    .word 0xFFFF
    .word 0xFFFF
    .word 0xFFFF
    .word 0xFFFF

flagListGateLockFlag:
    .byte F_GATE_LOCK_SCHOOL_COMP_1
    .byte F_GATE_LOCK_SCHOOL_COMP_2_2
    .byte F_GATE_LOCK_SCHOOL_COMP_3_1
    .byte F_GATE_LOCK_SCHOOL_COMP_3_2
    .byte F_GATE_LOCK_SCHOOL_COMP_4
    .byte F_GATE_LOCK_SCHOOL_COMP_5
    .byte F_GATE_LOCK_INTERNET_1
    .byte 0x13
    .byte F_GATE_LOCK_INTERNET_2
    .byte F_GATE_LOCK_INTERNET_3
    .byte F_GATE_LOCK_INTERNET_4
    .byte F_GATE_LOCK_UNDERNET_1
    .byte F_GATE_LOCK_WWW_COMP_2_1
    .byte F_GATE_LOCK_SCHOOL_COMP_4
    .byte F_GATE_LOCK_WWW_COMP_2_3
    .byte F_GATE_LOCK_WWW_COMP_2_4
    .byte F_GATE_LOCK_SCHOOL_COMP_5
    .byte F_GATE_LOCK_WWW_COMP_2_6
    .byte F_GATE_LOCK_WWW_COMP_2_7
    .byte F_GATE_LOCK_WWW_COMP_2_8
    .byte F_GATE_LOCK_WWW_COMP_2_9
    .byte F_GATE_LOCK_WWW_COMP_2_9
    .byte F_GATE_LOCK_UNDERNET_6_1
    .byte F_GATE_LOCK_UNDERNET_6_2
    .byte F_GATE_LOCK_UNDERNET_7
    .byte F_GATE_LOCK_UNDERNET_9
    .byte F_GATE_LOCK_UNDERNET_10
    .byte F_GATE_LOCK_UNDERNET_11
    .byte F_GATE_LOCK_UNDERNET_6_3
    .byte F_GATE_LOCK_UNDERNET_10_PIN

Flag_Ignore_ARRAY_08086dbe:
    .byte F_IGNORE_WALL_00
    .byte F_IGNORE_WALL_01
    .byte F_IGNORE_WALL_01
    .byte F_IGNORE_WALL_00
    .byte F_IGNORE_WALL_00
    .byte F_IGNORE_WALL_00
    .byte F_IGNORE_WALL_01
    .byte F_IGNORE_WALL_01
    .byte F_IGNORE_WALL_00
    .byte F_IGNORE_WALL_00
    .byte F_IGNORE_WALL_00
    .byte F_IGNORE_WALL_00
    .byte F_IGNORE_WALL_00
    .byte F_IGNORE_WALL_01
    .byte F_IGNORE_WALL_02
    .byte F_IGNORE_WALL_03
    .byte F_IGNORE_WALL_04
    .byte F_IGNORE_WALL_05
    .byte F_IGNORE_WALL_06
    .byte F_IGNORE_WALL_07
    .byte F_IGNORE_WALL_08
    .byte F_IGNORE_WALL_08
    .byte F_IGNORE_WALL_01
    .byte F_IGNORE_WALL_02
    .byte F_IGNORE_WALL_00
    .byte F_IGNORE_WALL_00
    .byte F_IGNORE_WALL_01
    .byte F_IGNORE_WALL_00
    .byte F_IGNORE_WALL_00
    .byte F_IGNORE_WALL_00

BYTE_ARRAY_08086ddc:
    .byte 0x01
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00

flagListGateClearFlag:
    .byte F_GATE_CLEAR_SCHOOL_COMP_1
    .byte F_GATE_CLEAR_SCHOOL_COMP_2_2
    .byte F_GATE_CLEAR_SCHOOL_COMP_3_1
    .byte F_GATE_CLEAR_SCHOOL_COMP_3_2
    .byte F_GATE_LOCK_WWW_COMP_2_3
    .byte F_GATE_LOCK_WWW_COMP_2_6
    .byte F_GATE_CLEAR_INTERNET_1
    .byte 0x14
    .byte F_GATE_CLEAR_INTERNET_2
    .byte F_GATE_CLEAR_INTERNET_3
    .byte F_GATE_CLEAR_INTERNET_4
    .byte F_GATE_CLEAR_UNDERNET_1
    .byte F_GATE_CLEAR_WWW_COMP_2_1
    .byte F_GATE_CLEAR_SCHOOL_COMP_4
    .byte F_GATE_CLEAR_WWW_COMP_2_3
    .byte F_GATE_CLEAR_WWW_COMP_2_4
    .byte F_GATE_CLEAR_SCHOOL_COMP_5
    .byte F_GATE_CLEAR_WWW_COMP_2_6
    .byte F_GATE_CLEAR_WWW_COMP_2_7
    .byte F_GATE_CLEAR_WWW_COMP_2_8
    .byte F_GATE_CLEAR_WWW_COMP_2_9
    .byte F_GATE_CLEAR_WWW_COMP_2_9
    .byte F_GATE_CLEAR_UNDERNET_6_1
    .byte F_GATE_CLEAR_UNDERNET_6_2
    .byte F_GATE_CLEAR_UNDERNET_7
    .byte F_GATE_CLEAR_UNDERNET_9
    .byte F_GATE_CLEAR_UNDERNET_10
    .byte F_GATE_CLEAR_UNDERNET_11
    .byte F_GATE_CLEAR_UNDERNET_6_3
    .byte F_GATE_CLEAR_UNDERNET_10_PIN


_ts Scene_UnlockWWWGate
    push       {lr}
    ldr        r0,PTR_PTR_S_UnlockWWWGate_0_08086f4c
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_UnlockWWWGate_0_08086e24:
    .word S_UnlockWWWGate_0
    .word S_UnlockWWWGate_1
    .word S_UnlockWWWGate_2
    .word S_UnlockWWWGate_3
    .word S_UnlockWWWGate_4
    .word S_UnlockWWWGate_5
    .word S_UnlockWWWGate_6


_ts S_UnlockWWWGate_0
    push       {r5}
    bl         Flag_SetPlayerInactive
    pop        {r5}
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08086e5e
    mov        r0,#0x0
    strb       r0,[r5,#Scene_sceneArg]
    Scene_Next
LAB_08086e5e:
    pop        {pc}


_ts S_UnlockWWWGate_1
    push       {r5}
    ldr        r0,PTR_flagListGateLockFlag_08086f50
    ldr        r1,[r5,#Scene_dialogueIndex]
    ldrb       r0,[r0,r1]
    bl         Flag_ClearBase
    ldr        r0,PTR_Flag_Ignore_ARRAY_08086f54
    ldr        r1,[r5,#Scene_dialogueIndex]
    ldrb       r0,[r0,r1]
    bl         Flag_SetIgnore
    pop        {r5}
    ldr        r0,PTR_BYTE_ARRAY_08086f58
    ldr        r1,[r5,#Scene_dialogueIndex]
    ldrb       r0,[r0,r1]
    cmp        r0,#0x0
    bne        LAB_08086e8a
    ldrb       r0,[r5,#Scene_state_s0]
    add        r0,#0x8
    strb       r0,[r5,#Scene_state_s0]
    pop        {pc}
LAB_08086e8a:
    push       {r5}
    ldr        r0,PTR_PTR_ARRAY_08086f5c
    ldr        r1,[r5,#Scene_dialogueIndex]
    mov        r2,#0x4
    mul        r1,r2
    add        r0,r0,r1
    ldr        r0,[r0,r1]
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
    pop        {pc}


_nt S_UnlockWWWGate_2
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08086ec6
    Scene_Next
    bl         Scene_IsStartPressed
    beq        LAB_08086ec6
    mov        r0,#0x1
    strb       r0,[r5,#Scene_sceneArg]
    mov        r0,#0x14
    strb       r0,[r5,#Scene_state_s0]
LAB_08086ec6:
    pop        {pc}


_ts S_UnlockWWWGate_3
    ldrb       r0,[r5,#Scene_sceneArg]
    cmp        r0,#0x0
    beq        LAB_08086eda
    push       {r5}
    FadeOutFast_Black
    pop        {r5}
LAB_08086eda:
    push       {r5}
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    Scene_Next
    pop        {pc}


_ts S_UnlockWWWGate_4
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08086f0c
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    Scene_Next
LAB_08086f0c:
    pop        {pc}


_nt S_UnlockWWWGate_5
    ldrb       r0,[r5,#Scene_sceneArg]
    cmp        r0,#0x0
    beq        LAB_08086f20
    push       {r5}
    FadeInFast_Black
    pop        {r5}
LAB_08086f20:
    Scene_Next
    pop        {pc}


_ts S_UnlockWWWGate_6
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08086f4a
    push       {r5}
    bl         Flag_SetPlayerActive
    ldr        r0,PTR_flagListGateClearFlag_08086f60
    ldr        r1,[r5,#Scene_dialogueIndex]
    ldrb       r0,[r0,r1]
    bl         Flag_SetBase
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
LAB_08086f4a:
    pop        {pc}

PTR_PTR_S_UnlockWWWGate_0_08086f4c:
    .word PTR_S_UnlockWWWGate_0_08086e24

PTR_flagListGateLockFlag_08086f50:
    .word flagListGateLockFlag

PTR_Flag_Ignore_ARRAY_08086f54:
    .word Flag_Ignore_ARRAY_08086dbe

PTR_BYTE_ARRAY_08086f58:
    .word BYTE_ARRAY_08086ddc

PTR_PTR_ARRAY_08086f5c:
    .word PTR_ARRAY_08086d28

PTR_flagListGateClearFlag_08086f60:
    .word flagListGateClearFlag
