#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_School_Comp_1_S0
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,PTR_PTR_MapSetup_Default_08040750
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_803ECB0_08040754
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_803ECF8_08040758
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_803ED68_0804075c
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_803F138_08040760
    bl         BgTask_AddNew
    ldr        r0,PTR_EntityAllocParams_8041FDC_08040764
    bl         Entity_AllocList
    pop        {r5}
    pop        {pc}

    .align 2, 0

PTR_MapSetup_Default_080406a8:
    .word MapSetup_Default
    .word MapSetup_School_Comp_1_F01
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default


_ts EventHandler_S0_School_Comp_1
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Default_08040768
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Default_080406d4:
    .word EventHandler_Default
    .word EventHandler_School_Comp_1_F01
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default


_ts MapSetup_School_Comp_1_F01
    push       {lr}
    push       {r5}
    Flag_SetSystem F_SYSTEM_NO_START_MENU
    Flag_SetSystem F_SYSTEM_NO_RANDOM_BATTLES
    Flag_GetBase 0x95
    pop        {r5}
    bne        LAB_0804071c
    push       {r5}
    ldr        r0,PTR_Scene_Story_03_BeginClassTutorial_0804076c
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_08040728
LAB_0804071c:
    push       {r5}
    ldr        r0,PTR_Scene_TutorialBattle_08040770
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_08040728:
    push       {r5}
    ldr        r7,PTR_NPCList_8041B3C_08040774
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}

_ts EventHandler_School_Comp_1_F01
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Comp_1_F01_0_08040778
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_School_Comp_1_F01_0_08040748:
    .word EventHandler_School_Comp_1_F01_0


_ts EventHandler_School_Comp_1_F01_0
    push       {lr}
    pop        {pc}

PTR_PTR_MapSetup_Default_08040750:
    .word PTR_MapSetup_Default_080406a8

PTR_BgTask_803ECB0_08040754:
    .word BgTask_803ECB0

PTR_BgTask_803ECF8_08040758:
    .word BgTask_803ECF8

PTR_BgTask_803ED68_0804075c:
    .word BgTask_803ED68

PTR_BgTask_803F138_08040760:
    .word BgTask_803F138

PTR_EntityAllocParams_8041FDC_08040764:
    .word EntityAllocParams_8041FDC

PTR_PTR_EventHandler_Default_08040768:
    .word PTR_EventHandler_Default_080406d4

PTR_Scene_Story_03_BeginClassTutorial_0804076c:
    .word Scene_Story_03_BeginClassTutorial

PTR_Scene_TutorialBattle_08040770:
    .word Scene_TutorialBattle

PTR_NPCList_8041B3C_08040774:
    .word NPCList_8041B3C

PTR_PTR_EventHandler_School_Comp_1_F01_0_08040778:
    .word PTR_EventHandler_School_Comp_1_F01_0_08040748


_ts MapSetup_School_Comp_1_S1
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,PTR_PTR_MapSetup_Default_08040a88
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_803EC68_08040a8c
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_803ECF8_08040a90
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_803ED68_08040a94
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_803F138_08040a98
    bl         BgTask_AddNew
    ldr        r0,PTR_EntityAllocParams_8041FDC_08040a9c
    bl         Entity_AllocList
    pop        {r5}
    mov        r0,#0x0
    strb       r0,[r5,#0x1]
    pop        {pc}

    .align 2, 0

PTR_MapSetup_Default_080407b8:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_School_Comp_1_F12
    .word MapSetup_School_Comp_1_F13
    .word MapSetup_School_Comp_1_F14
    .word MapSetup_School_Comp_1_F15
    .word MapSetup_Default
    .word MapSetup_Default


_ts EventHandler_School_Comp_1_S1
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Default_08040aa0
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Default_080407e4:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_School_Comp_1_F12
    .word EventHandler_School_Comp_1_F13
    .word EventHandler_School_Comp_1_F14
    .word EventHandler_School_Comp_1_F15
    .word EventHandler_Default
    .word EventHandler_Default


_ts MapSetup_School_Comp_1_F12
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_8041C1C_08040aa4
    bl         Map_LoadNPCList
    pop        {r5}
    Flag_GetBase 0xD6
    beq        LAB_0804083c
    Flag_ClearBase 0xD6
    push       {r5}
    ldr        r0,DAT_08040aa8
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_0804083c:
    push       {r5}
    Flag_GetBase 0xA6
    pop        {r5}
    beq        LAB_08040854
    push       {r5}
    Flag_SetIgnore F_IGNORE_WALL_00
    pop        {r5}
    b          LAB_08040864
LAB_08040854:
    push       {r5}
    mov        r1,#0x0
    bl         Effect_WWWGate_Create
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}
LAB_08040864:
    mov        r0,#0x8
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_School_Comp_1_F12
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Comp_1_F12_0_08040aac
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    bl         EventHandler_School_Comp_HandleJackOut
    pop        {pc}

PTR_EventHandler_School_Comp_1_F12_0_08040880:
    .word EventHandler_School_Comp_1_F12_0
    .word EventHandler_School_Comp_1_F12_1
    .word EventHandler_School_Comp_1_F12_2


_ts EventHandler_School_Comp_1_F12_0
    push       {lr}
    push       {r5}
    Flag_GetBase 0xA1
    pop        {r5}
    bne        LAB_080408a6
    push       {r5}
    ldr        r0,PTR_Scene_Story_15_08040ab0
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_080408a6:
    mov        r0,#0x4
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_School_Comp_1_F12_1
    push       {lr}
    LoadMain world, r0, r7
    ldrb       r0,[r0,#World_curEventFlag]
    cmp        r0,#0x20
    bne        LAB_080408c8
    push       {r5}
    mov        r1,#0x0
    ldr        r0,PTR_Scene_ChangeMap_08040ab4
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x8
    str        r0,[r5,#0x0]
LAB_080408c8:
    pop        {pc}


_nt EventHandler_School_Comp_1_F12_2
    push       {lr}
    pop        {pc}


_ts MapSetup_School_Comp_1_F13
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_8041C34_08040ab8
    bl         Map_LoadNPCList
    pop        {r5}
    Flag_GetBase 0xD6
    beq        LAB_08040908
    Flag_ClearBase 0xD6
    push       {r5}
    ldr        r0,DAT_08040abc
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_08040908:
    push       {r5}
    Flag_GetBase 0xA6
    pop        {r5}
    beq        LAB_08040920
    push       {r5}
    Flag_SetIgnore F_IGNORE_WALL_00
    pop        {r5}
    b          LAB_08040942
LAB_08040920:
    push       {r5}
    mov        r1,#0x0
    bl         Effect_WWWGate_Create
    pop        {r5}
    push       {r5}
    Flag_GetBase 0xA4
    pop        {r5}
    beq        LAB_08040948
    push       {r5}
    ldr        r0,PTR_Scene_UnlockWWWGate_08040ac0
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_08040942:
    mov        r0,#0x4
    str        r0,[r5,#0x0]
    pop        {pc}
LAB_08040948:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_School_Comp_1_F13
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Comp_1_F13_0_08040ac4
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    bl         EventHandler_School_Comp_HandleJackOut
    pop        {pc}

PTR_EventHandler_School_Comp_1_F13_0_08040964:
    .word EventHandler_School_Comp_1_F13_0
    .word EventHandler_School_Comp_1_F13_1


_ts EventHandler_School_Comp_1_F13_0
    push       {lr}
    LoadMain world, r0, r7
    ldrb       r0,[r0,#World_curEventFlag]
    cmp        r0,#0x20
    bne        LAB_08040988
    push       {r5}
    mov        r1,#0x0
    ldr        r0,DAT_08040ac8
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x4
    str        r0,[r5,#0x0]
LAB_08040988:
    pop        {pc}


_nt EventHandler_School_Comp_1_F13_1
    push       {lr}
    pop        {pc}


_nt MapSetup_School_Comp_1_F14
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_8041C34_08040acc
    bl         Map_LoadNPCList
    pop        {r5}
    Flag_GetBase 0xD6
    beq        LAB_080409c6
    Flag_ClearBase 0xD6
    push       {r5}
    ldr        r0,PTR_Scene_MegaManJackIn_08040ad0
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_080409c6:
    Flag_SetIgnore F_IGNORE_WALL_00
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_School_Comp_1_F14
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Comp_1_F14_0_08040ad4
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    bl         EventHandler_School_Comp_HandleJackOut
    pop        {pc}

    .align 2, 0

PTR_EventHandler_School_Comp_1_F14_0_080409e8:
    .word EventHandler_School_Comp_1_F14_0


_ts EventHandler_School_Comp_1_F14_0
    push       {lr}
    pop        {pc}


_ts MapSetup_School_Comp_1_F15
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_8041C34_08040ad8
    bl         Map_LoadNPCList
    pop        {r5}
    Flag_GetBase 0xD6
    beq        LAB_08040a28
    Flag_ClearBase 0xD6
    push       {r5}
    ldr        r0,PTR_Scene_MegaManJackIn_08040adc
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_08040a28:
    Flag_SetIgnore F_IGNORE_WALL_00
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_School_Comp_1_F15
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Comp_1_F15_0_08040ae0
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    bl         EventHandler_School_Comp_HandleJackOut
    pop        {pc}

PTR_EventHandler_School_Comp_1_F15_0_08040a48:
    .word EventHandler_School_Comp_1_F15_0


_ts EventHandler_School_Comp_1_F15_0
    push       {lr}
    pop        {pc}


_ts EventHandler_School_Comp_HandleJackOut
    push       {lr}
    bl         Scene_IsSceneActive
    tst        r0,r0
    bne        LAB_08040a84
    push       {r5}
    mov        r0,#TF_DialogueActive
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08040a84
    LoadMain input, r0, r0
    ldrh       r0,[r0,#Input_toggleKeyState]
    ldr        r1,DAT_08040ae4
    and        r1,r0
    beq        LAB_08040a84
    bl         dummy_187a0
    bne        LAB_08040a84
    push       {r5}
    ldr        r0,PTR_Scene_JackOut_08040ae8
    mov        r1,#0x1
    bl         Scene_Prepare
    pop        {r5}
LAB_08040a84:
    pop        {pc}

    .align 2, 0

PTR_PTR_MapSetup_Default_08040a88:
    .word PTR_MapSetup_Default_080407b8

PTR_BgTask_803EC68_08040a8c:
    .word BgTask_803EC68

PTR_BgTask_803ECF8_08040a90:
    .word BgTask_803ECF8

PTR_BgTask_803ED68_08040a94:
    .word BgTask_803ED68

PTR_BgTask_803F138_08040a98:
    .word BgTask_803F138

PTR_EntityAllocParams_8041FDC_08040a9c:
    .word EntityAllocParams_8041FDC

PTR_PTR_EventHandler_Default_08040aa0:
    .word PTR_EventHandler_Default_080407e4

PTR_NPCList_8041C1C_08040aa4:
    .word NPCList_8041C1C

DAT_08040aa8:
    .word Scene_MegaManJackIn

PTR_PTR_EventHandler_School_Comp_1_F12_0_08040aac:
    .word PTR_EventHandler_School_Comp_1_F12_0_08040880

PTR_Scene_Story_15_08040ab0:
    .word Scene_Story_15

PTR_Scene_ChangeMap_08040ab4:
    .word Scene_ChangeMap

PTR_NPCList_8041C34_08040ab8:
    .word NPCList_8041C34

DAT_08040abc:
    .word Scene_MegaManJackIn

PTR_Scene_UnlockWWWGate_08040ac0:
    .word Scene_UnlockWWWGate

PTR_PTR_EventHandler_School_Comp_1_F13_0_08040ac4:
    .word PTR_EventHandler_School_Comp_1_F13_0_08040964

DAT_08040ac8:
    .word Scene_ChangeMap

PTR_NPCList_8041C34_08040acc:
    .word NPCList_8041C34

PTR_Scene_MegaManJackIn_08040ad0:
    .word Scene_MegaManJackIn

PTR_PTR_EventHandler_School_Comp_1_F14_0_08040ad4:
    .word PTR_EventHandler_School_Comp_1_F14_0_080409e8

PTR_NPCList_8041C34_08040ad8:
    .word NPCList_8041C34

PTR_Scene_MegaManJackIn_08040adc:
    .word Scene_MegaManJackIn

PTR_PTR_EventHandler_School_Comp_1_F15_0_08040ae0:
    .word PTR_EventHandler_School_Comp_1_F15_0_08040a48

DAT_08040ae4:
    .word KEY_R

PTR_Scene_JackOut_08040ae8:
    .word Scene_JackOut


_ts MapSetup_School_Comp_1_S2
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,PTR_PTR_MapSetup_School_Comp_1_F20_08040bd0
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_803ECB0_08040bd4
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_803ECF8_08040bd8
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_803ED68_08040bdc
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_803F138_08040be0
    bl         BgTask_AddNew
    ldr        r0,PTR_EntityAllocParams_8041FDC_08040be4
    bl         Entity_AllocList
    ldr        r7,PTR_NPCList_8041CCC_08040be8
    bl         Map_LoadNPCList
    pop        {r5}
    pop        {pc}

PTR_MapSetup_School_Comp_1_F20_08040b28:
    .word MapSetup_School_Comp_1_F20
    .word MapSetup_School_Comp_1_F20
    .word MapSetup_School_Comp_1_F20
    .word MapSetup_School_Comp_1_F20
    .word MapSetup_School_Comp_1_F20
    .word MapSetup_School_Comp_1_F20
    .word MapSetup_School_Comp_1_F20
    .word MapSetup_School_Comp_1_F20


_ts EventHandler_School_Comp_1_S2
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Comp_1_F20_08040bec
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_School_Comp_1_F20_08040b54:
    .word EventHandler_School_Comp_1_F20
    .word EventHandler_School_Comp_1_F20
    .word EventHandler_School_Comp_1_F20
    .word EventHandler_School_Comp_1_F20
    .word EventHandler_School_Comp_1_F20
    .word EventHandler_School_Comp_1_F20
    .word EventHandler_School_Comp_1_F20
    .word EventHandler_School_Comp_1_F20


_ts MapSetup_School_Comp_1_F20
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    LoadMain world, r0, r0
    ldrb       r1,[r0,#World_currentArea]
    ldrb       r2,[r0,#World_lastArea]
    cmp        r1,r2
    bne        LAB_08040b98
    cmp        r1,#0x80
    beq        LAB_08040ba4
LAB_08040b98:
    push       {r5}
    ldr        r0,DAT_08040bf0
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_08040ba4:
    Flag_SetIgnore F_IGNORE_WALL_00
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_School_Comp_1_F20
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Comp_1_F20_0_08040bf4
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}

    .align 2, 0

PTR_EventHandler_School_Comp_1_F20_0_08040bc8:
    .word EventHandler_School_Comp_1_F20_0


_ts EventHandler_School_Comp_1_F20_0
    push       {lr}
    pop        {pc}

PTR_PTR_MapSetup_School_Comp_1_F20_08040bd0:
    .word PTR_MapSetup_School_Comp_1_F20_08040b28

PTR_BgTask_803ECB0_08040bd4:
    .word BgTask_803ECB0

PTR_BgTask_803ECF8_08040bd8:
    .word BgTask_803ECF8

PTR_BgTask_803ED68_08040bdc:
    .word BgTask_803ED68

PTR_BgTask_803F138_08040be0:
    .word BgTask_803F138

PTR_EntityAllocParams_8041FDC_08040be4:
    .word EntityAllocParams_8041FDC

PTR_NPCList_8041CCC_08040be8:
    .word NPCList_8041CCC

PTR_PTR_EventHandler_School_Comp_1_F20_08040bec:
    .word PTR_EventHandler_School_Comp_1_F20_08040b54

DAT_08040bf0:
    .word Scene_MegaManJackIn

PTR_PTR_EventHandler_School_Comp_1_F20_0_08040bf4:
    .word PTR_EventHandler_School_Comp_1_F20_0_08040bc8
