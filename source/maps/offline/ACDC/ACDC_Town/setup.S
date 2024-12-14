#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts FlagSetup_ACDC_S0
    mov        pc,lr

    .align 2, 0


_ts MapSetup_ACDC_Town_S0
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_ACDC_Town_F00_0802ac04
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    mov        r0,#0x46
    bl         Flag_Set380
    ldr        r0,PTR_BgTask_802AC08
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_802AC0C
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_802AC10
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_802AC14
    bl         BgTask_AddNew
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_DAT_0802ac18
    bl         Entity_AllocList
    pop        {r5}
    mov        r0,#0x0
    bl         Flag_Set380
    bl         Sound_AreaSongChange
    pop        {pc}

    .align 2, 0

PTR_MapSetup_ACDC_Town_F00_0802aa0c:
    .word MapSetup_ACDC_Town_F00
    .word MapSetup_Default
    .word MapSetup_ACDC_Town_F02
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_ACDC_Town_F06


_ts EventHandler_ACDC_Town_S0
    push       {lr}
    bl         FUN_0802b2d4
    ldr        r0,PTR_PTR_EventHandler_ACDC_Town_F00_0802ac1c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r0,#0x40
    mov        r1,#0x1c
    bl         CheckForJackIn
    pop        {pc}
PTR_EventHandler_ACDC_Town_F00_0802aa40:
    .word EventHandler_ACDC_Town_F00
    .word EventHandler_Default
    .word EventHandler_ACDC_Town_F02
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_ACDC_Town_F06


_ts MapSetup_ACDC_Town_F00
    push       {lr}
    push       {r5}
    mov        r0,#0x92
    bl         Flag_GetBase
    pop        {r5}
    bne        LAB_0802aa80
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    mov        r1,#0x0
    strb       r1,[r0,#0x7]
    push       {r5}
    bl         PlayerLocation_Create
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}
LAB_0802aa80:
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    mov        r0,#0x4
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_ACDC_Town_F00
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Town_F00_0_0802ac20
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_Town_F00_0_0802aaa8:
    .word EventHandler_ACDC_Town_F00_0
    .word EventHandler_ACDC_Town_F00_1


_ts EventHandler_ACDC_Town_F00_0
    push       {lr}
    push       {r5}
    ldr        r0,PTR_Scene_Story_01_LanWalksToSchool_0802ac24
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_ACDC_Town_F00_1
    push       {lr}
    pop        {pc}


_ts MapSetup_ACDC_Town_F02
    push       {lr}
    push       {r5}
    ldr        r7,PTR_PTR_DAT_0802ac28
    bl         Map_LoadNPCList
    mov        r0,#0x0
    bl         Flag_Set410
    mov        r0,#0x2
    bl         Flag_Set410
    mov        r0,#0x3
    bl         Flag_Set410
    mov        r0,#0x4
    bl         Flag_Set410
    mov        r0,#0x5
    bl         Flag_Set410
    mov        r0,#0x6
    bl         Flag_Set410
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    mov        r0,#0x2
    bl         Flag_GetEmailRecieved
    pop        {r5}
    bne        LAB_0802ab1e
    push       {r5}
    ldr        r0,PTR_Scene_CheckMail_0802ac2c
    ldr        r1,DAT_0802ac30
    bl         Scene_Prepare
    pop        {r5}
LAB_0802ab1e:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_ACDC_Town_F02
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Town_F02_0_0802ac34
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_Town_F02_0_0802ab34:
    .word EventHandler_ACDC_Town_F02_0


_ts EventHandler_ACDC_Town_F02_0
    push       {lr}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r1,[r0,#0xe]
    cmp        r1,#0x20
    bne        LAB_0802ab52
    push       {r5}
    ldr        r0,DAT_0802ac38
    mov        r1,#0xd
    bl         Scene_Prepare
    pop        {r5}
    bne        LAB_0802ab96
LAB_0802ab52:
    cmp        r1,#0x21
    bne        LAB_0802ab64
    push       {r5}
    ldr        r0,DAT_0802ac3c
    mov        r1,#0xe
    bl         Scene_Prepare
    pop        {r5}
    bne        LAB_0802ab96
LAB_0802ab64:
    cmp        r1,#0x22
    bne        LAB_0802ab76
    push       {r5}
    ldr        r0,DAT_0802ac40
    mov        r1,#0x2f
    bl         Scene_Prepare
    pop        {r5}
    bne        LAB_0802ab96
LAB_0802ab76:
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x1
    bne        LAB_0802ab96
    push       {r5}
    ldr        r0,DAT_0802ac44
    ldr        r1,DAT_0802ac48
    bl         Scene_Prepare
    pop        {r5}
LAB_0802ab96:
    pop        {pc}


_ts MapSetup_ACDC_Town_F06
    push       {lr}
    push       {r5}
    ldr        r7,PTR_PTR_DAT_0802ac4c
    bl         Map_LoadNPCList
    mov        r0,#0x0
    bl         Flag_Set410
    mov        r0,#0x5
    bl         Flag_Set410
    mov        r0,#0x6
    bl         Flag_Set410
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}

    .align 2, 0


_ts EventHandler_ACDC_Town_F06
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Town_F06_0_0802ac50
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_Town_F06_0_0802abdc:
    .word EventHandler_ACDC_Town_F06_0


_ts EventHandler_ACDC_Town_F06_0
    push       {lr}
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x1
    bne        LAB_0802ac02
    push       {r5}
    ldr        r0,DAT_0802ac54
    ldr        r1,DAT_0802ac48
    bl         Scene_Prepare
    pop        {r5}
LAB_0802ac02:
    pop        {pc}
PTR_PTR_MapSetup_ACDC_Town_F00_0802ac04:
    .word PTR_MapSetup_ACDC_Town_F00_0802aa0c
PTR_BgTask_802AC08:
    .word BgTask_8029F14
PTR_BgTask_802AC0C:
    .word BgTask_8029F2C
PTR_BgTask_802AC10:
    .word BgTask_8029F8C
PTR_BgTask_802AC14:
    .word BgTask_8029FA4
PTR_DAT_0802ac18:
    .word EntityAllocParams_8030D38
PTR_PTR_EventHandler_ACDC_Town_F00_0802ac1c:
    .word PTR_EventHandler_ACDC_Town_F00_0802aa40
PTR_PTR_EventHandler_ACDC_Town_F00_0_0802ac20:
    .word PTR_EventHandler_ACDC_Town_F00_0_0802aaa8
PTR_Scene_Story_01_LanWalksToSchool_0802ac24:
    .word Scene_Story_01_LanWalksToSchool
PTR_PTR_DAT_0802ac28:
    .word NPCList_802F994
PTR_Scene_CheckMail_0802ac2c:
    .word Scene_CheckMail
DAT_0802ac30:
    .word 0x111
PTR_PTR_EventHandler_ACDC_Town_F02_0_0802ac34:
    .word PTR_EventHandler_ACDC_Town_F02_0_0802ab34
DAT_0802ac38:
    .word Scene_Dialogue
DAT_0802ac3c:
    .word Scene_Dialogue
DAT_0802ac40:
    .word Scene_Dialogue
DAT_0802ac44:
    .word Scene_LockedPath
DAT_0802ac48:
    .word 0xC05
PTR_PTR_DAT_0802ac4c:
    .word NPCList_802F9CC
PTR_PTR_EventHandler_ACDC_Town_F06_0_0802ac50:
    .word PTR_EventHandler_ACDC_Town_F06_0_0802abdc
DAT_0802ac54:
    .word Scene_LockedPath


_ts MapSetup_ACDC_Town_S1
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_ACDC_Town_F10_0802ad70
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    mov        r0,#0x46
    bl         Flag_Set380
    mov        r0,#0x48
    bl         Flag_Set380
    ldr        r0,PTR_BgTask_802AD74
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_802AD78
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_802AD7C
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_802AD80
    bl         BgTask_AddNew
    pop        {r5}
    mov        r0,#0x28
    bl         Flag_Get420
    bne        LAB_0802ac96
    bl         Sound_AreaSongChange
LAB_0802ac96:
    pop        {pc}
PTR_MapSetup_ACDC_Town_F10_0802ac98:
    .word MapSetup_ACDC_Town_F10


_ts EventHandler_ACDC_Town_S1
    push       {lr}
    bl         FUN_0802b2d4
    ldr        r0,PTR_PTR_EventHandler_ACDC_Town_F10_0802ad84
    ldr        r0,[r0,r1]
    bx         r0
PTR_EventHandler_ACDC_Town_F10_0802aca8:
    .word EventHandler_ACDC_Town_F10


_ts MapSetup_ACDC_Town_F10
    push       {lr}
    mov        r0,#0x0
    bl         Flag_Set380
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    mov        r0,#0x90
    bl         Flag_GetBase
    beq        LAB_0802acde
    push       {r5}
    ldr        r0,PTR_BgTask_802AD88
    bl         BgTask_AddNew
    pop        {r5}
    mov        r0,#0xc
    str        r0,[r5,#0x0]
    pop        {pc}
LAB_0802acde:
    mov        r0,#0xd7
    bl         Flag_GetBase
    beq        LAB_0802acf8
    push       {r5}
    ldr        r0,PTR_Scene_Story_10_0802ad8c
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x8
    str        r0,[r5,#0x0]
    pop        {pc}
LAB_0802acf8:
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    mov        r1,#0x8
    strb       r1,[r7,#0x7]
    mov        r1,#0xff
    strb       r1,[r7,#0x13]
    ldr        r0,DAT_0802ad90
    str        r0,[r7,#0x38]
    ldr        r0,DAT_0802ad94
    str        r0,[r7,#0x3c]
    mov        r0,#0x0
    str        r0,[r7,#0x40]
    push       {r5}
    ldr        r7,PTR_PTR_DAT_0802ad98
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_BgTask_802AD9C
    bl         BgTask_AddNew
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_Scene_Story_0F_0802ada0
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_ACDC_Town_F10
    ldr        r0,PTR_PTR_EventHandler_ACDC_Town_F10_0_0802ada4
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_Town_F10_0_0802ad44:
    .word EventHandler_ACDC_Town_F10_0
    .word EventHandler_ACDC_Town_F10_1
    .word EventHandler_ACDC_Town_F10_2
    .word EventHandler_ACDC_Town_F10_3


_ts EventHandler_ACDC_Town_F10_0
    mov        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_ACDC_Town_F10_1
    push       {r5}
    mov        r0,#0xd7
    bl         Flag_GetBase
    pop        {r5}
    beq        LAB_0802ad6a
    mov        r0,#0x8
    strb       r0,[r5,#0x0]
LAB_0802ad6a:
    pop        {pc}


_ts EventHandler_ACDC_Town_F10_2
    pop        {pc}


_nt EventHandler_ACDC_Town_F10_3
    pop        {pc}
PTR_PTR_MapSetup_ACDC_Town_F10_0802ad70:
    .word PTR_MapSetup_ACDC_Town_F10_0802ac98
PTR_BgTask_802AD74:
    .word BgTask_8029F14
PTR_BgTask_802AD78:
    .word BgTask_8029F2C
PTR_BgTask_802AD7C:
    .word BgTask_8029F8C
PTR_BgTask_802AD80:
    .word BgTask_8029FA4
PTR_PTR_EventHandler_ACDC_Town_F10_0802ad84:
    .word PTR_EventHandler_ACDC_Town_F10_0802aca8
PTR_BgTask_802AD88:
    .word BgTask_8029EFC
PTR_Scene_Story_10_0802ad8c:
    .word Scene_Story_10
DAT_0802ad90:
    .word 0xF00000
DAT_0802ad94:
    .word 0x140000
PTR_PTR_DAT_0802ad98:
    .word NPCList_802FB74
PTR_BgTask_802AD9C:
    .word BgTask_8029EE4
PTR_Scene_Story_0F_0802ada0:
    .word Scene_Story_0F
PTR_PTR_EventHandler_ACDC_Town_F10_0_0802ada4:
    .word PTR_EventHandler_ACDC_Town_F10_0_0802ad44


_ts MapSetup_ACDC_Town_S2
    push       {lr}
    push       {r1,r5}
    mov        r0,#0x46
    bl         Flag_Set380
    mov        r0,#0x48
    bl         Flag_Set380
    pop        {r1,r5}
    ldr        r0,PTR_PTR_MapSetup_ACDC_Town_F20_0802ae84
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    mov        r0,#0xd3
    bl         Flag_GetBase
    bne        LAB_0802adfe
    mov        r0,#0xab
    bl         Flag_GetBase
    beq        LAB_0802ade8
    ldr        r0,PTR_BgTask_802AEB0
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_802AEB4
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_802AEB8
    bl         BgTask_AddNew
    b          LAB_0802ae0a
LAB_0802ade8:
    mov        r0,#0xa2
    bl         Flag_GetBase
    beq        LAB_0802adfe
    ldr        r0,PTR_BgTask_802AEBC
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_802AEC0
    bl         BgTask_AddNew
    b          LAB_0802ae0a
LAB_0802adfe:
    ldr        r0,PTR_BgTask_802AEB0
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_802AEB4
    bl         BgTask_AddNew
LAB_0802ae0a:
    mov        r0,#0xa8
    bl         Flag_GetBase
    bne        LAB_0802ae22
    ldr        r0,PTR_BgTask_802AEC4
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_802AEC8
    bl         BgTask_AddNew
    pop        {r5}
    b          LAB_0802ae30
LAB_0802ae22:
    ldr        r0,PTR_BgTask_802AECC
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_802AED0
    bl         BgTask_AddNew
    pop        {r5}
LAB_0802ae30:
    mov        r0,#0xd3
    bl         Flag_GetBase
    bne        LAB_0802ae60
    mov        r0,#0xab
    bl         Flag_GetBase
    beq        LAB_0802ae4c
    push       {r5}
    mov        r0,#0x4
    bl         Sound_ChangeSong
    pop        {r5}
    b          LAB_0802ae64
LAB_0802ae4c:
    mov        r0,#0xdf
    bl         Flag_GetBase
    beq        LAB_0802ae60
    push       {r5}
    mov        r0,#0x3
    bl         Sound_ChangeSong
    pop        {r5}
    b          LAB_0802ae64
LAB_0802ae60:
    bl         Sound_AreaSongChange
LAB_0802ae64:
    mov        r0,#0xdc
    bl         Flag_GetBase
    beq        LAB_0802ae78
    push       {r5}
    ldr        r0,PTR_DAT_0802aea8
    bl         Entity_AllocList
    pop        {r5}
    pop        {pc}
LAB_0802ae78:
    push       {r5}
    ldr        r0,PTR_DAT_0802aeac
    bl         Entity_AllocList
    pop        {r5}
    pop        {pc}
PTR_PTR_MapSetup_ACDC_Town_F20_0802ae84:
    .word PTR_MapSetup_ACDC_Town_F20_0802ae88
PTR_MapSetup_ACDC_Town_F20_0802ae88:
    .word MapSetup_ACDC_Town_F20
    .word MapSetup_ACDC_Town_F21
    .word MapSetup_ACDC_Town_F22
    .word MapSetup_ACDC_Town_F23
    .word MapSetup_ACDC_Town_F24
    .word MapSetup_ACDC_Town_F25
    .word MapSetup_ACDC_Town_F26
    .word MapSetup_ACDC_Town_F27
PTR_DAT_0802aea8:
    .word EntityAllocParams_8030D68
PTR_DAT_0802aeac:
    .word EntityAllocParams_8030D38
PTR_BgTask_802AEB0:
    .word BgTask_8029F14
PTR_BgTask_802AEB4:
    .word BgTask_8029F2C
PTR_BgTask_802AEB8:
    .word BgTask_8029F74
PTR_BgTask_802AEBC:
    .word BgTask_8029F44
PTR_BgTask_802AEC0:
    .word BgTask_8029F5C
PTR_BgTask_802AEC4:
    .word BgTask_8029F8C
PTR_BgTask_802AEC8:
    .word BgTask_8029FA4
PTR_BgTask_802AECC:
    .word BgTask_8029FBC
PTR_BgTask_802AED0:
    .word BgTask_8029FD4


_ts EventHandler_ACDC_Town_S2
    push       {lr}
    bl         FUN_0802b2d4
    ldr        r0,PTR_PTR_EventHandler_ACDC_Town_F20_0802aeec
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r0,#0x40
    mov        r1,#0x1c
    bl         CheckForJackIn
    pop        {pc}
PTR_PTR_EventHandler_ACDC_Town_F20_0802aeec:
    .word PTR_EventHandler_ACDC_Town_F20_0802aef0
PTR_EventHandler_ACDC_Town_F20_0802aef0:
    .word EventHandler_ACDC_Town_F20
    .word EventHandler_ACDC_Town_F21
    .word EventHandler_ACDC_Town_F22
    .word EventHandler_ACDC_Town_F23
    .word EventHandler_ACDC_Town_F24
    .word EventHandler_ACDC_Town_F25
    .word EventHandler_ACDC_Town_F26
    .word EventHandler_ACDC_Town_F27


_ts MapSetup_ACDC_Town_F20
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_PTR_DAT_0802af4c
    bl         Map_LoadNPCList
    ldr        r0,PTR_EntityAllocParams_802af50
    bl         Entity_AllocList
    mov        r0,#0x46
    bl         Flag_Clear380
    pop        {r5}
    mov        r0,#0x5
    bl         Flag_Set410
    mov        r0,#0x0
    bl         Flag_Set380
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}
PTR_PTR_DAT_0802af4c:
    .word NPCList_802FB90
PTR_EntityAllocParams_802af50:
    .word EntityAllocParams_8030D50


_ts EventHandler_ACDC_Town_F20
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Town_F20_0_0802b2f4
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_Town_F20_0_0802af64:
    .word EventHandler_ACDC_Town_F20_0


_ts EventHandler_ACDC_Town_F20_0
    push       {lr}
    mov        r0,#0x97
    bl         Flag_GetBase
    beq        LAB_0802af7a
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    mov        r1,#0x21
    strb       r1,[r0,#0x6]
LAB_0802af7a:
    pop        {pc}


_ts MapSetup_ACDC_Town_F21
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_PTR_DAT_0802b2f8
    bl         Map_LoadNPCList
    ldr        r0,PTR_EntityAllocParams_802b2fc
    bl         Entity_AllocList
    mov        r0,#0x46
    bl         Flag_Clear380
    pop        {r5}
    mov        r0,#0x5
    bl         Flag_Set410
    mov        r0,#0x0
    bl         Flag_Set380
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_ACDC_Town_F21
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Town_F21_0_0802b300
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_Town_F21_0_0802afc8:
    .word EventHandler_ACDC_Town_F21_0


_ts EventHandler_ACDC_Town_F21_0
    push       {lr}
    mov        r0,#0x30
    bl         KeyItem_IsPresent
    bne        LAB_0802b000
    mov        r0,#0x45
    mov        r1,#0xb
    bl         Inventory_GetChipCount
    cmp        r0,#0x0
    beq        LAB_0802b000
    mov        r0,#0xb
    bl         Flag_GetBase
    beq        LAB_0802b000
    mov        r0,#0x5
    bl         Flag_GetEmailRecieved
    bne        LAB_0802b000
    push       {r5}
    ldr        r0,DAT_0802b304
    ldr        r1,DAT_0802b308
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0802b000:
    pop        {pc}

    .align 2, 0


_ts MapSetup_ACDC_Town_F22
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_PTR_DAT_0802b30c
    bl         Map_LoadNPCList
    ldr        r0,PTR_EntityAllocParams_802b310
    bl         Entity_AllocList
    mov        r0,#0x46
    bl         Flag_Clear380
    pop        {r5}
    mov        r0,#0x5
    bl         Flag_Set410
    mov        r0,#0x0
    bl         Flag_Set380
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_ACDC_Town_F22
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Town_F22_0_0802b314
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_Town_F22_0_0802b050:
    .word EventHandler_ACDC_Town_F22_0


_ts EventHandler_ACDC_Town_F22_0
    push       {lr}
    mov        r0,#0xe2
    bl         Flag_GetBase
    beq        LAB_0802b072
    mov        r0,#0x7
    bl         Flag_GetEmailRecieved
    bne        LAB_0802b072
    push       {r5}
    ldr        r0,DAT_0802b318
    ldr        r1,DAT_0802b31c
    bl         Scene_Prepare
    pop        {r5}
LAB_0802b072:
    pop        {pc}


_ts MapSetup_ACDC_Town_F23
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    mov        r0,#0x0
    bl         Flag_Set380
    mov        r0,#0x5
    bl         Flag_Set410
    push       {r5}
    mov        r0,#0xa2
    bl         Flag_GetBase
    pop        {r5}
    bne        LAB_0802b0ae
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    mov        r1,#0x0
    strb       r1,[r0,#0x7]
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}
LAB_0802b0ae:
    mov        r0,#0x4
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_ACDC_Town_F23
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Town_F23_0_0802b320
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_Town_F23_0_0802b0c4:
    .word EventHandler_ACDC_Town_F23_0
    .word EventHandler_ACDC_Town_F23_1


_ts EventHandler_ACDC_Town_F23_0
    push       {lr}
    push       {r5}
    ldr        r0,PTR_Scene_Story_23_0802b324
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_ACDC_Town_F23_1
    push       {lr}
    pop        {pc}


_ts MapSetup_ACDC_Town_F24
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_PTR_DAT_0802b328
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0xdc
    bl         Flag_SetBase
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_ACDC_Town_F24
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Town_F24_0_0802b32c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    bl         FUN_0802b2b0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_ACDC_Town_F24_0_0802b124:
    .word EventHandler_ACDC_Town_F24_0


_ts EventHandler_ACDC_Town_F24_0
    push       {lr}
    pop        {pc}


_ts MapSetup_ACDC_Town_F25
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_PTR_DAT_0802b330
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0xdc
    bl         Flag_SetBase
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_ACDC_Town_F25
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Town_F25_0_0802b334
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    bl         FUN_0802b2b0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_ACDC_Town_F25_0_0802b16c:
    .word EventHandler_ACDC_Town_F25_0


_ts EventHandler_ACDC_Town_F25_0
    push       {lr}
    pop        {pc}


_ts MapSetup_ACDC_Town_F26
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    mov        r0,#0xdc
    bl         Flag_SetBase
    push       {r5}
    mov        r0,#0xab
    bl         Flag_GetBase
    pop        {r5}
    bne        LAB_0802b1b4
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    mov        r1,#0x0
    strb       r1,[r0,#0x7]
    push       {r5}
    ldr        r0,PTR_Scene_Story_2D_0802b338
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}
LAB_0802b1b4:
    push       {r5}
    ldr        r7,PTR_PTR_DAT_0802b33c
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_ACDC_Town_F26
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Town_F26_0_0802b340
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_Town_F26_0_0802b1d4:
    .word EventHandler_ACDC_Town_F26_0


_ts EventHandler_ACDC_Town_F26_0
    push       {lr}
    mov        r0,#0x6
    bl         Flag_GetEmailRecieved
    bne        LAB_0802b1ee
    push       {r5}
    ldr        r0,DAT_0802b344
    ldr        r1,DAT_0802b348
    bl         Scene_Prepare
    pop        {r5}
LAB_0802b1ee:
    mov        r0,#0xb0
    bl         Flag_GetBase
    bne        LAB_0802b1fc
    bl         FUN_0802b2b0
    pop        {pc}
LAB_0802b1fc:
    mov        r0,#0xb1
    bl         Flag_GetBase
    bne        LAB_0802b220
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x30
    bne        LAB_0802b2ae
    mov        r0,#0x0
    bl         Flag_Set380
    push       {r5}
    ldr        r0,PTR_Scene_Story_30_0802b34c
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_0802b220:
    pop        {pc}

    .align 2, 0


_ts MapSetup_ACDC_Town_F27
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    mov        r0,#0xdc
    bl         Flag_SetBase
    mov        r0,#0xb1
    bl         Flag_GetBase
    beq        LAB_0802b26a
    mov        r0,#0xd3
    bl         Flag_GetBase
    beq        LAB_0802b25a
    push       {r5}
    ldr        r7,PTR_PTR_DAT_0802b350
    bl         Map_LoadNPCList
    pop        {r5}
    b          LAB_0802b264
LAB_0802b25a:
    push       {r5}
    ldr        r7,PTR_PTR_DAT_0802b354
    bl         Map_LoadNPCList
    pop        {r5}
LAB_0802b264:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}
LAB_0802b26a:
    push       {r5}
    ldr        r7,PTR_PTR_DAT_0802b358
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_ACDC_Town_F27
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Town_F27_0_0802b35c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_ACDC_Town_F27_0_0802b28c:
    .word EventHandler_ACDC_Town_F27_0


_ts EventHandler_ACDC_Town_F27_0
    push       {lr}
    mov        r0,#0xd3
    bl         Flag_GetBase
    beq        LAB_0802b2ae
    mov        r0,#0xd4
    bl         Flag_GetBase
    bne        LAB_0802b2ae
    push       {r5}
    ldr        r0,PTR_Scene_Story_34_0802b360
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_0802b2ae:
    pop        {pc}


_ts FUN_0802b2b0
    push       {lr}
    bl         Scene_IsSceneActive
    tst        r0,r0
    beq        LAB_0802b2bc
    pop        {pc}
LAB_0802b2bc:
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x30
    bne        LAB_0802b2d2
    push       {r5}
    ldr        r0,PTR_Scene_Dialogue_0802b364
    mov        r1,#0x48
    bl         Scene_Prepare
    pop        {r5}
LAB_0802b2d2:
    pop        {pc}


_ts FUN_0802b2d4
    push       {r1,r5,lr}
    mov        r0,#0x47
    bl         Flag_Set380
    mov        r0,#0xc
    bl         Flag_Get420
    bne        LAB_0802b2f2
    mov        r0,#0x15
    bl         Flag_Get420
    beq        LAB_0802b2f2
    mov        r0,#0x47
    bl         Flag_Clear380
LAB_0802b2f2:
    pop        {r1,r5,pc}
PTR_PTR_EventHandler_ACDC_Town_F20_0_0802b2f4:
    .word PTR_EventHandler_ACDC_Town_F20_0_0802af64
PTR_PTR_DAT_0802b2f8:
    .word NPCList_802FC80
PTR_EntityAllocParams_802b2fc:
    .word EntityAllocParams_8030D50
PTR_PTR_EventHandler_ACDC_Town_F21_0_0802b300:
    .word PTR_EventHandler_ACDC_Town_F21_0_0802afc8
DAT_0802b304:
    .word Scene_CheckMail
DAT_0802b308:
    .word 0x137
PTR_PTR_DAT_0802b30c:
    .word NPCList_802FDB4
PTR_EntityAllocParams_802b310:
    .word EntityAllocParams_8030D50
PTR_PTR_EventHandler_ACDC_Town_F22_0_0802b314:
    .word PTR_EventHandler_ACDC_Town_F22_0_0802b050
DAT_0802b318:
    .word Scene_CheckMail
DAT_0802b31c:
    .word 0x13E
PTR_PTR_EventHandler_ACDC_Town_F23_0_0802b320:
    .word PTR_EventHandler_ACDC_Town_F23_0_0802b0c4
PTR_Scene_Story_23_0802b324:
    .word Scene_Story_23
PTR_PTR_DAT_0802b328:
    .word NPCList_802FDE8
PTR_PTR_EventHandler_ACDC_Town_F24_0_0802b32c:
    .word PTR_EventHandler_ACDC_Town_F24_0_0802b124
PTR_PTR_DAT_0802b330:
    .word NPCList_802FDE8
PTR_PTR_EventHandler_ACDC_Town_F25_0_0802b334:
    .word PTR_EventHandler_ACDC_Town_F25_0_0802b16c
PTR_Scene_Story_2D_0802b338:
    .word Scene_Story_2D
PTR_PTR_DAT_0802b33c:
    .word NPCList_802FE6C
PTR_PTR_EventHandler_ACDC_Town_F26_0_0802b340:
    .word PTR_EventHandler_ACDC_Town_F26_0_0802b1d4
DAT_0802b344:
    .word Scene_CheckMail
DAT_0802b348:
    .word 0x13F
PTR_Scene_Story_30_0802b34c:
    .word Scene_Story_30
PTR_PTR_DAT_0802b350:
    .word NPCList_802FF6C
PTR_PTR_DAT_0802b354:
    .word NPCList_802FF2C
PTR_PTR_DAT_0802b358:
    .word NPCList_802FE6C
PTR_PTR_EventHandler_ACDC_Town_F27_0_0802b35c:
    .word PTR_EventHandler_ACDC_Town_F27_0_0802b28c
PTR_Scene_Story_34_0802b360:
    .word Scene_Story_34
PTR_Scene_Dialogue_0802b364:
    .word Scene_Dialogue


_ts MapSetup_ACDC_Town_S3
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_ACDC_Town_F30_0802b4a0
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    mov        r0,#0x46
    bl         Flag_Set380
    mov        r0,#0x48
    bl         Flag_Set380
    ldr        r0,PTR_DAT_0802b4a4
    bl         Entity_AllocList
    ldr        r0,PTR_BgTask_802B4A8
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_802B4AC
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_802B4B0
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_802B4B4
    bl         BgTask_AddNew
    pop        {r5}
    bl         Sound_AreaSongChange
    pop        {pc}

    .align 2, 0

PTR_MapSetup_ACDC_Town_F30_0802b3a8:
    .word MapSetup_ACDC_Town_F30


_ts EventHandler_ACDC_Town_S3
    push       {lr}
    bl         FUN_0802b2d4
    ldr        r0,PTR_PTR_EventHandler_ACDC_Town_F30_0802b4b8
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r0,#0x40
    mov        r1,#0x1c
    bl         CheckForJackIn
    pop        {pc}
PTR_EventHandler_ACDC_Town_F30_0802b3c4:
    .word EventHandler_ACDC_Town_F30


_ts MapSetup_ACDC_Town_F30
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    mov        r0,#0x0
    bl         Flag_Set380
    mov        r0,#0x2
    bl         Flag_Set410
    mov        r0,#0x94
    bl         Flag_GetBase
    bne        LAB_0802b400
    push       {r5}
    ldr        r7,PTR_PTR_DAT_0802b4bc
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r3,#0x0
    str        r3,[r5,#0x0]
    pop        {pc}
LAB_0802b400:
    mov        r0,#0x95
    bl         Flag_GetBase
    beq        LAB_0802b412
    push       {r5}
    ldr        r7,PTR_PTR_DAT_0802b4c0
    bl         Map_LoadNPCList
    pop        {r5}
LAB_0802b412:
    mov        r3,#0x4
    str        r3,[r5,#0x0]
    pop        {pc}


_ts EventHandler_ACDC_Town_F30
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Town_F30_0_0802b4c4
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    bl         EventHandler_ACDC_Town_F30_HandleExits
    pop        {pc}
PTR_EventHandler_ACDC_Town_F30_0_0802b42c:
    .word EventHandler_ACDC_Town_F30_0
    .word EventHandler_ACDC_Town_F30_1


_ts EventHandler_ACDC_Town_F30_0
    push       {lr}
    mov        r0,#0x13
    bl         Flag_GetEmailRecieved
    bne        LAB_0802b44c
    push       {r5}
    ldr        r0,DAT_0802b4c8
    ldr        r1,DAT_0802b4cc
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0802b44c:
    pop        {pc}


_nt EventHandler_ACDC_Town_F30_1
    push       {lr}
    mov        r0,#0x13
    bl         Flag_GetEmailRecieved
    bne        LAB_0802b466
    push       {r5}
    ldr        r0,PTR_Scene_CheckMail_0802b4d0
    ldr        r1,DAT_0802b4cc
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0802b466:
    mov        r0,#0x95
    bl         Flag_GetBase
    bne        LAB_0802b47a
    push       {r5}
    ldr        r0,PTR_Scene_Story_37_0802b4d4
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_0802b47a:
    pop        {pc}


_ts EventHandler_ACDC_Town_F30_HandleExits
    push       {lr}
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x3
    bne        LAB_0802b49e
    push       {r5}
    ldr        r1,DAT_0802b4d8
    ldr        r0,PTR_Scene_LockedPath_0802b4dc
    bl         Scene_Prepare
    pop        {r5}
LAB_0802b49e:
    pop        {pc}
PTR_PTR_MapSetup_ACDC_Town_F30_0802b4a0:
    .word PTR_MapSetup_ACDC_Town_F30_0802b3a8
PTR_DAT_0802b4a4:
    .word EntityAllocParams_8030D38
PTR_BgTask_802B4A8:
    .word BgTask_8029F14
PTR_BgTask_802B4AC:
    .word BgTask_8029F2C
PTR_BgTask_802B4B0:
    .word BgTask_8029FBC
PTR_BgTask_802B4B4:
    .word BgTask_8029FD4
PTR_PTR_EventHandler_ACDC_Town_F30_0802b4b8:
    .word PTR_EventHandler_ACDC_Town_F30_0802b3c4
PTR_PTR_DAT_0802b4bc:
    .word NPCList_8030004
PTR_PTR_DAT_0802b4c0:
    .word NPCList_8030004
PTR_PTR_EventHandler_ACDC_Town_F30_0_0802b4c4:
    .word PTR_EventHandler_ACDC_Town_F30_0_0802b42c
DAT_0802b4c8:
    .word Scene_CheckMail
DAT_0802b4cc:
    .word 0x16F
PTR_Scene_CheckMail_0802b4d0:
    .word Scene_CheckMail
PTR_Scene_Story_37_0802b4d4:
    .word Scene_Story_37
DAT_0802b4d8:
    .word 0x6603
PTR_Scene_LockedPath_0802b4dc:
    .word Scene_LockedPath


_ts MapSetup_ACDC_Town_S4
    push       {lr}
    push       {r0,r1}
    mov        r0,#0x93
    bl         Flag_GetBase
    pop        {r0,r1}
    beq        LAB_0802b4f6
    push       {r0,r1}
    bl         Sound_AreaSongChange
    pop        {r0,r1}
LAB_0802b4f6:
    ldr        r0,PTR_PTR_MapSetup_ACDC_Town_F40_0802b604
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    mov        r0,#0x46
    bl         Flag_Set380
    mov        r0,#0x48
    bl         Flag_Set380
    ldr        r0,PTR_DAT_0802b608
    bl         Entity_AllocList
    ldr        r0,PTR_BgTask_802B60C
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_802B610
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_802B614
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_802B618
    bl         BgTask_AddNew
    pop        {r5}
    pop        {pc}

    .align 2, 0

PTR_MapSetup_ACDC_Town_F40_0802b530:
    .word MapSetup_ACDC_Town_F40
    .word MapSetup_ACDC_Town_F40
    .word MapSetup_ACDC_Town_F40
    .word MapSetup_ACDC_Town_F40
    .word MapSetup_ACDC_Town_F40
    .word MapSetup_ACDC_Town_F40
    .word MapSetup_ACDC_Town_F40
    .word MapSetup_ACDC_Town_F40


_ts EventHandler_ACDC_Town_S4
    push       {lr}
    bl         FUN_0802b2d4
    ldr        r0,PTR_PTR_EventHandler_ACDC_Town_F40_0802b61c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r0,#0x40
    mov        r1,#0x1c
    bl         CheckForJackIn
    pop        {pc}
PTR_EventHandler_ACDC_Town_F40_0802b568:
    .word EventHandler_ACDC_Town_F40
    .word EventHandler_ACDC_Town_F40
    .word EventHandler_ACDC_Town_F40
    .word EventHandler_ACDC_Town_F40
    .word EventHandler_ACDC_Town_F40
    .word EventHandler_ACDC_Town_F40
    .word EventHandler_ACDC_Town_F40
    .word EventHandler_ACDC_Town_F40


_ts MapSetup_ACDC_Town_F40
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    mov        r0,#0x0
    bl         Flag_Set380
    push       {r5}
    ldr        r7,PTR_PTR_DAT_0802b620
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x93
    bl         Flag_GetBase
    bne        LAB_0802b5cc
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    mov        r1,#0x8
    strb       r1,[r7,#0x7]
    mov        r1,#0xff
    strb       r1,[r7,#0x13]
    push       {r5}
    ldr        r0,PTR_Scene_Story_4E_0802b624
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_0802b5cc:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_ACDC_Town_F40
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Town_F40_0_0802b628
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_ACDC_Town_F40_0_0802b5e4:
    .word EventHandler_ACDC_Town_F40_0


_ts EventHandler_ACDC_Town_F40_0
    push       {lr}
    mov        r0,#0x12
    bl         Flag_GetEmailRecieved
    bne        LAB_0802b600
    push       {r5}
    ldr        r0,DAT_0802b62c
    ldr        r1,DAT_0802b630
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0802b600:
    pop        {pc}

    .align 2, 0

PTR_PTR_MapSetup_ACDC_Town_F40_0802b604:
    .word PTR_MapSetup_ACDC_Town_F40_0802b530
PTR_DAT_0802b608:
    .word EntityAllocParams_8030D38
PTR_BgTask_802B60C:
    .word BgTask_8029F14
PTR_BgTask_802B610:
    .word BgTask_8029F2C
PTR_BgTask_802B614:
    .word BgTask_8029FBC
PTR_BgTask_802B618:
    .word BgTask_8029FD4
PTR_PTR_EventHandler_ACDC_Town_F40_0802b61c:
    .word PTR_EventHandler_ACDC_Town_F40_0802b568
PTR_PTR_DAT_0802b620:
    .word NPCList_803002C
PTR_Scene_Story_4E_0802b624:
    .word Scene_Story_4E
PTR_PTR_EventHandler_ACDC_Town_F40_0_0802b628:
    .word PTR_EventHandler_ACDC_Town_F40_0_0802b5e4
DAT_0802b62c:
    .word Scene_CheckMail
DAT_0802b630:
    .word 0x17E


_ts MapSetup_ACDC_Town_S5
    push       {lr}
    push       {r0,r1}
    bl         Sound_AreaSongChange
    pop        {r0,r1}
    ldr        r0,PTR_PTR_MapSetup_ACDC_Town_F50_0802b890
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    mov        r0,#0x46
    bl         Flag_Set380
    mov        r0,#0x48
    bl         Flag_Set380
    ldr        r0,PTR_DAT_0802b894
    bl         Entity_AllocList
    ldr        r0,PTR_BgTask_802B898
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_802B89C
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_802B8A0
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_802B8A4
    bl         BgTask_AddNew
    pop        {r5}
    pop        {pc}

    .align 2, 0

PTR_MapSetup_ACDC_Town_F50_0802b678:
    .word MapSetup_ACDC_Town_F50
    .word MapSetup_ACDC_Town_F50
    .word MapSetup_ACDC_Town_F50
    .word MapSetup_ACDC_Town_F53
    .word MapSetup_ACDC_Town_F54
    .word MapSetup_ACDC_Town_F50
    .word MapSetup_ACDC_Town_F50
    .word MapSetup_ACDC_Town_F50


_ts EventHandler_ACDC_Town_S5
    push       {lr}
    bl         FUN_0802b2d4
    ldr        r0,PTR_PTR_EventHandler_ACDC_Town_F50_0802b8a8
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r0,#0x40
    mov        r1,#0x1c
    bl         CheckForJackIn
    pop        {pc}
PTR_EventHandler_ACDC_Town_F50_0802b6b0:
    .word EventHandler_ACDC_Town_F50
    .word EventHandler_ACDC_Town_F50
    .word EventHandler_ACDC_Town_F50
    .word EventHandler_ACDC_Town_F53
    .word EventHandler_ACDC_Town_F54
    .word EventHandler_ACDC_Town_F50
    .word EventHandler_ACDC_Town_F50
    .word EventHandler_ACDC_Town_F50


_ts MapSetup_ACDC_Town_F50
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_PTR_DAT_0802b8ac
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    bl         Flag_Set380
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_ACDC_Town_F50
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Town_F50_0_0802b8b0
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_ACDC_Town_F50_0_0802b708:
    .word EventHandler_ACDC_Town_F50_0


_ts EventHandler_ACDC_Town_F50_0
    push       {lr}
    pop        {pc}


_ts MapSetup_ACDC_Town_F53
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_PTR_DAT_0802b8b4
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    bl         Flag_Set380
    mov        r0,#0x63
    bl         Flag_GetBase
    beq        LAB_0802b758
    mov        r6,#0x1f
    mov        r0,#0x64
    bl         Flag_GetBase
    beq        LAB_0802b744
    mov        r6,#0x20
LAB_0802b744:
    mov        r0,#0x63
    bl         Flag_ClearBase
    add        r1,r6,#0x0
    push       {r5}
    ldr        r0,PTR_Scene_AfterFixedBattle_0802b8b8
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0802b758:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_ACDC_Town_F53
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Town_F53_0_0802b8bc
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_ACDC_Town_F53_0_0802b770:
    .word EventHandler_ACDC_Town_F53_0


_ts EventHandler_ACDC_Town_F53_0
    push       {lr}
    mov        r0,#0xa3
    bl         Flag_GetBase
    beq        LAB_0802b792
    mov        r0,#0x19
    bl         Flag_GetEmailRecieved
    bne        LAB_0802b792
    push       {r5}
    ldr        r0,DAT_0802b8c0
    ldr        r1,DAT_0802b8c4
    bl         Scene_Prepare
    pop        {r5}
LAB_0802b792:
    mov        r6,#0x25
    mov        r0,#0x64
    bl         Flag_GetBase
    beq        LAB_0802b79e
    mov        r6,#0x26
LAB_0802b79e:
    mov        r0,#0x63
    bl         Flag_GetBase
    beq        LAB_0802b7b4
    add        r1,r6,#0x0
    push       {r5}
    ldr        r0,DAT_0802b8c8
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0802b7b4:
    pop        {pc}

    .align 2, 0


_ts MapSetup_ACDC_Town_F54
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    mov        r0,#0x0
    bl         Flag_Set380
    mov        r0,#0xeb
    bl         Flag_GetBase
    beq        LAB_0802b800
    mov        r0,#0xec
    bl         Flag_GetBase
    bne        LAB_0802b800
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    mov        r1,#0x8
    strb       r1,[r7,#0x7]
    mov        r1,#0xff
    strb       r1,[r7,#0x13]
    bl         Sound_StopAllMusic
    push       {r5}
    ldr        r0,PTR_Scene_Story_7F_0802b8cc
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_0802b80a
LAB_0802b800:
    push       {r5}
    ldr        r7,PTR_PTR_DAT_0802b8d0
    bl         Map_LoadNPCList
    pop        {r5}
LAB_0802b80a:
    mov        r0,#0x63
    bl         Flag_GetBase
    beq        LAB_0802b832
    mov        r6,#0x1f
    mov        r0,#0x64
    bl         Flag_GetBase
    beq        LAB_0802b81e
    mov        r6,#0x20
LAB_0802b81e:
    mov        r0,#0x63
    bl         Flag_ClearBase
    add        r1,r6,#0x0
    push       {r5}
    ldr        r0,DAT_0802b8d4
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0802b832:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_ACDC_Town_F54
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_ACDC_Town_F54_0_0802b8d8
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_ACDC_Town_F54_0_0802b848:
    .word EventHandler_ACDC_Town_F54_0


_ts EventHandler_ACDC_Town_F54_0
    push       {lr}
    mov        r0,#0xaa
    bl         Flag_GetBase
    beq        LAB_0802b86a
    mov        r0,#0x1b
    bl         Flag_GetEmailRecieved
    bne        LAB_0802b86a
    push       {r5}
    ldr        r0,DAT_0802b8dc
    ldr        r1,DAT_0802b8e0
    bl         Scene_Prepare
    pop        {r5}
LAB_0802b86a:
    mov        r6,#0x25
    mov        r0,#0x64
    bl         Flag_GetBase
    beq        LAB_0802b876
    mov        r6,#0x26
LAB_0802b876:
    mov        r0,#0x63
    bl         Flag_GetBase
    beq        LAB_0802b88c
    add        r1,r6,#0x0
    push       {r5}
    ldr        r0,DAT_0802b8e4
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0802b88c:
    pop        {pc}

    .align 2, 0

PTR_PTR_MapSetup_ACDC_Town_F50_0802b890:
    .word PTR_MapSetup_ACDC_Town_F50_0802b678
PTR_DAT_0802b894:
    .word EntityAllocParams_8030D38
PTR_BgTask_802B898:
    .word BgTask_8029F14
PTR_BgTask_802B89C:
    .word BgTask_8029F2C
PTR_BgTask_802B8A0:
    .word BgTask_8029FBC
PTR_BgTask_802B8A4:
    .word BgTask_8029FD4
PTR_PTR_EventHandler_ACDC_Town_F50_0802b8a8:
    .word PTR_EventHandler_ACDC_Town_F50_0802b6b0
PTR_PTR_DAT_0802b8ac:
    .word NPCList_8030128
PTR_PTR_EventHandler_ACDC_Town_F50_0_0802b8b0:
    .word PTR_EventHandler_ACDC_Town_F50_0_0802b708
PTR_PTR_DAT_0802b8b4:
    .word NPCList_8030154
PTR_Scene_AfterFixedBattle_0802b8b8:
    .word Scene_AfterFixedBattle
PTR_PTR_EventHandler_ACDC_Town_F53_0_0802b8bc:
    .word PTR_EventHandler_ACDC_Town_F53_0_0802b770
DAT_0802b8c0:
    .word Scene_CheckMail
DAT_0802b8c4:
    .word 0x1AC
DAT_0802b8c8:
    .word Scene_StartFixedBattle
PTR_Scene_Story_7F_0802b8cc:
    .word Scene_Story_7F
PTR_PTR_DAT_0802b8d0:
    .word NPCList_8030154
DAT_0802b8d4:
    .word Scene_AfterFixedBattle
PTR_PTR_EventHandler_ACDC_Town_F54_0_0802b8d8:
    .word PTR_EventHandler_ACDC_Town_F54_0_0802b848
DAT_0802b8dc:
    .word Scene_CheckMail
DAT_0802b8e0:
    .word 0x1AD
DAT_0802b8e4:
    .word Scene_StartFixedBattle
