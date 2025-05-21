#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_Waterworks_Comp_1_S2
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,PTR_PTR_MapSetup_Default_08045b70
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    Flag_GetBase 0xCC
    bne        LAB_080458e8
    ldr        r0,PTR_BgTask_8044078_08045b74
    bl         BgTask_AddNew
    b          LAB_080458f4
LAB_080458e8:
    ldr        r0,PTR_BgTask_80442E8_08045b78
    bl         BgTask_AddNew
    ldr        r0,DAT_08045b7c
    bl         BgTask_AddNew
LAB_080458f4:
    ldr        r0,PTR_EntityAllocParams_8046F90_08045b80
    bl         Entity_AllocList
    pop        {r5}
    Flag_GetBase 0xE4
    beq        LAB_0804590e
    push       {r5}
    Flag_SetIgnore F_IGNORE_WALL_00
    pop        {r5}
LAB_0804590e:
    pop        {pc}

PTR_MapSetup_Default_08045910:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Waterworks_Comp_1_F25
    .word MapSetup_Waterworks_Comp_1_F25
    .word MapSetup_Waterworks_Comp_1_F27


_ts EventHandler_Waterworks_Comp_1_S2
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Default_08045b84
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Default_0804593c:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Waterworks_Comp_1_F25
    .word EventHandler_Waterworks_Comp_1_F25
    .word EventHandler_Waterworks_Comp_1_F27


_ts MapSetup_Waterworks_Comp_1_F25
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_8046BC8_08045b88
    bl         Map_LoadNPCList
    pop        {r5}
    LoadMain world, r0, r0
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    bne        LAB_0804598e
    ldrb       r1,[r0,#World_currentArea]
    ldrb       r2,[r0,#World_lastArea]
    cmp        r1,r2
    beq        LAB_0804599a
LAB_0804598e:
    push       {r5}
    ldr        r0,DAT_08045b8c
    ldr        r1,PTR_DAT_08045b90
    bl         Scene_Prepare
    pop        {r5}
LAB_0804599a:
    Flag_GetBase 0xB3
    bne        LAB_080459a8
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}
LAB_080459a8:
    mov        r0,#0x4
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_Waterworks_Comp_1_F25
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Waterworks_Comp_1_F25_0_08045b94
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}

PTR_EventHandler_Waterworks_Comp_1_F25_0_080459c4:
    .word EventHandler_Waterworks_Comp_1_F25_0
    .word EventHandler_Waterworks_Comp_1_F25_1


_ts EventHandler_Waterworks_Comp_1_F25_0
    push       {lr}
    bl         FUN_08045a8c
    beq        LAB_080459ea
    bl         FUN_08045ae0
    beq        LAB_080459ea
    push       {r5}
    ldr        r0,PTR_Scene_Story_2A_08045b98
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x4
    str        r0,[r5,#0x0]
LAB_080459ea:
    pop        {pc}


_ts EventHandler_Waterworks_Comp_1_F25_1
    push       {lr}
    bl         FUN_08045a8c
    beq        LAB_080459fa
    bl         FUN_08045ae0
    beq        LAB_080459fa
LAB_080459fa:
    pop        {pc}


_ts MapSetup_Waterworks_Comp_1_F27
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_8046BC8_08045b9c
    bl         Map_LoadNPCList
    pop        {r5}
    Flag_GetBase 0xCD
    beq        LAB_08045a3a
    push       {r5}
    ldr        r7,PTR_NPCList_8046BF4_08045ba0
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_Scene_Story_33_08045ba4
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_08045a3a:
    LoadMain world, r0, r0
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    bne        LAB_08045a4e
    ldrb       r1,[r0,#World_currentArea]
    ldrb       r2,[r0,#World_lastArea]
    cmp        r1,r2
    beq        LAB_08045a5a
LAB_08045a4e:
    push       {r5}
    ldr        r0,PTR_Scene_MegaManJackIn_08045ba8
    ldr        r1,PTR_DAT_08045b90
    bl         Scene_Prepare
    pop        {r5}
LAB_08045a5a:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Waterworks_Comp_1_F27
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Waterworks_Comp_1_F27_0_08045bac
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}

    .align 2, 0

PTR_EventHandler_Waterworks_Comp_1_F27_0_08045a78:
    .word EventHandler_Waterworks_Comp_1_F27_0


_ts EventHandler_Waterworks_Comp_1_F27_0
    push       {lr}
    bl         FUN_08045a8c
    beq        LAB_08045a8a
    bl         FUN_08045ae0
    beq        LAB_08045a8a
LAB_08045a8a:
    pop        {pc}


_ts FUN_08045a8c
    push       {lr}
    bl         Scene_IsSceneActive
    bne        LAB_08045adc
    mov        r0,#TF_DialogueActive
    bl         Text_CheckOption
    bne        LAB_08045adc
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#World_playerLocation]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x10
    beq        LAB_08045ace
    LoadMain world, r7, r7
    ldrb       r7,[r7,#World_storyFlag]
    lsr        r7,r7,#0x4
    cmp        r7,#0x2
    bne        LAB_08045adc
    cmp        r0,#0x10
    blt        LAB_08045adc
    cmp        r0,#0x15
    bgt        LAB_08045adc
    sub        r0,#0x11
    add        r0,#0xf0
    bl         Flag_GetBase
    bne        LAB_08045adc
LAB_08045ace:
    push       {r5}
    ldr        r0,PTR_Scene_Ice_Slide_08045bb0
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x0
LAB_08045adc:
    pop        {pc}


_ts FUN_08045ae0
    push       {lr}
    bl         Scene_IsSceneActive
    bne        LAB_08045b36
    mov        r0,#TF_DialogueActive
    bl         Text_CheckOption
    bne        LAB_08045b36
    LoadMain world, r7, r7
    ldrb       r1,[r7,#World_curEventFlag]
    cmp        r1,#0x20
    blt        LAB_08045b36
    cmp        r1,#0x2a
    bgt        LAB_08045b36
    push       {r7}
    Flag_GetBase 0xE3
    pop        {r7}
    bne        LAB_08045b26
    ldrb       r0,[r7,#0x5]
    cmp        r0,#0x1
    bne        LAB_08045b26
    ldrb       r0,[r7,#World_curEventFlag]
    cmp        r0,#0x21
    bne        LAB_08045b26
    push       {r5}
    ldr        r0,PTR_Scene_Dialogue_08045bb4
    mov        r1,#0x7
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x0
    pop        {pc}
LAB_08045b26:
    push       {r5}
    ldr        r0,PTR_Scene_Waterworks_Comp_TurnHandle_08045bb8
    ldrb       r1,[r7,#World_curEventFlag]
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x0
    pop        {pc}
LAB_08045b36:
    mov        r0,#0x1
    pop        {pc}


_ts FUN_08045b3c
    push       {lr}
    bl         Scene_IsSceneActive
    bne        LAB_08045b6a
    mov        r0,#TF_DialogueActive
    bl         Text_CheckOption
    bne        LAB_08045b6a
    LoadMain world, r7, r7
    ldrb       r1,[r7,#World_curEventFlag]
    cmp        r1,#0x20
    blt        LAB_08045b6a
    cmp        r1,#0x2a
    bgt        LAB_08045b6a
    push       {r5}
    ldr        r0,DAT_08045bbc
    mov        r1,#0xf
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x0
    pop        {pc}
LAB_08045b6a:
    mov        r0,#0x1
    pop        {pc}

    .align 2, 0

PTR_PTR_MapSetup_Default_08045b70:
    .word PTR_MapSetup_Default_08045910

PTR_BgTask_8044078_08045b74:
    .word BgTask_8044078

PTR_BgTask_80442E8_08045b78:
    .word BgTask_80442E8

DAT_08045b7c:
    .word BgTask_8044318

PTR_EntityAllocParams_8046F90_08045b80:
    .word EntityAllocParams_8046F90

PTR_PTR_EventHandler_Default_08045b84:
    .word PTR_EventHandler_Default_0804593c

PTR_NPCList_8046BC8_08045b88:
    .word NPCList_8046BC8

DAT_08045b8c:
    .word Scene_MegaManJackIn

PTR_DAT_08045b90:
    .word 0x2000

PTR_PTR_EventHandler_Waterworks_Comp_1_F25_0_08045b94:
    .word PTR_EventHandler_Waterworks_Comp_1_F25_0_080459c4

PTR_Scene_Story_2A_08045b98:
    .word Scene_Story_2A

PTR_NPCList_8046BC8_08045b9c:
    .word NPCList_8046BC8

PTR_NPCList_8046BF4_08045ba0:
    .word NPCList_8046BF4

PTR_Scene_Story_33_08045ba4:
    .word Scene_Story_33

PTR_Scene_MegaManJackIn_08045ba8:
    .word Scene_MegaManJackIn

PTR_PTR_EventHandler_Waterworks_Comp_1_F27_0_08045bac:
    .word PTR_EventHandler_Waterworks_Comp_1_F27_0_08045a78

PTR_Scene_Ice_Slide_08045bb0:
    .word Scene_Ice_Slide

PTR_Scene_Dialogue_08045bb4:
    .word Scene_Dialogue

PTR_Scene_Waterworks_Comp_TurnHandle_08045bb8:
    .word Scene_Waterworks_Comp_TurnHandle

DAT_08045bbc:
    .word Scene_Dialogue


_ts MapSetup_Waterworks_Comp_1_S3
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,PTR_PTR_MapSetup_Waterworks_Comp_1_F30_08045cac
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_80442E8_08045cb0
    bl         BgTask_AddNew
    ldr        r0,DAT_08045cb4
    bl         BgTask_AddNew
    ldr        r0,PTR_EntityAllocParams_8046F90_08045cb8
    bl         Entity_AllocList
    Flag_SetIgnore F_IGNORE_WALL_00
    pop        {r5}
    pop        {pc}

PTR_MapSetup_Waterworks_Comp_1_F30_08045bf0:
    .word MapSetup_Waterworks_Comp_1_F30
    .word MapSetup_Waterworks_Comp_1_F30
    .word MapSetup_Waterworks_Comp_1_F30
    .word MapSetup_Waterworks_Comp_1_F30
    .word MapSetup_Waterworks_Comp_1_F30
    .word MapSetup_Waterworks_Comp_1_F30
    .word MapSetup_Waterworks_Comp_1_F30
    .word MapSetup_Waterworks_Comp_1_F30


_ts EventHandler_Waterworks_Comp_1_S3
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Waterworks_Comp_1_F30_08045cbc
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Waterworks_Comp_1_F30_08045c1c:
    .word EventHandler_Waterworks_Comp_1_F30
    .word EventHandler_Waterworks_Comp_1_F30
    .word EventHandler_Waterworks_Comp_1_F30
    .word EventHandler_Waterworks_Comp_1_F30
    .word EventHandler_Waterworks_Comp_1_F30
    .word EventHandler_Waterworks_Comp_1_F30
    .word EventHandler_Waterworks_Comp_1_F30
    .word EventHandler_Waterworks_Comp_1_F30


_ts MapSetup_Waterworks_Comp_1_F30
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_8046BC8_08045cc0
    bl         Map_LoadNPCList
    pop        {r5}
    LoadMain world, r0, r0
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    bne        LAB_08045c6e
    ldrb       r1,[r0,#World_currentArea]
    ldrb       r2,[r0,#World_lastArea]
    cmp        r1,r2
    beq        LAB_08045c7a
LAB_08045c6e:
    push       {r5}
    ldr        r0,DAT_08045cc4
    ldr        r1,PTR_DAT_08045cc8
    bl         Scene_Prepare
    pop        {r5}
LAB_08045c7a:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Waterworks_Comp_1_F30
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Waterworks_Comp_1_F30_0_08045ccc
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}

    .align 2, 0

PTR_EventHandler_Waterworks_Comp_1_F30_0_08045c98:
    .word EventHandler_Waterworks_Comp_1_F30_0


_ts EventHandler_Waterworks_Comp_1_F30_0
    push       {lr}
    bl         FUN_08045a8c
    beq        LAB_08045caa
    bl         FUN_08045b3c
    beq        LAB_08045caa
LAB_08045caa:
    pop        {pc}

PTR_PTR_MapSetup_Waterworks_Comp_1_F30_08045cac:
    .word PTR_MapSetup_Waterworks_Comp_1_F30_08045bf0

PTR_BgTask_80442E8_08045cb0:
    .word BgTask_80442E8

DAT_08045cb4:
    .word BgTask_8044318

PTR_EntityAllocParams_8046F90_08045cb8:
    .word EntityAllocParams_8046F90

PTR_PTR_EventHandler_Waterworks_Comp_1_F30_08045cbc:
    .word PTR_EventHandler_Waterworks_Comp_1_F30_08045c1c

PTR_NPCList_8046BC8_08045cc0:
    .word NPCList_8046BC8

DAT_08045cc4:
    .word Scene_MegaManJackIn

PTR_DAT_08045cc8:
    .word 0x2000

PTR_PTR_EventHandler_Waterworks_Comp_1_F30_0_08045ccc:
    .word PTR_EventHandler_Waterworks_Comp_1_F30_0_08045c98
