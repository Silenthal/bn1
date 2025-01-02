#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_WWW_Comp_5_S5
    push       {lr}
    push       {r0,r1}
    bl         Sound_AreaSongChange
    pop        {r0,r1}
    ldr        r0,PTR_PTR_MapSetup_Default_0804ddd4
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_8049BA8_0804ddd8
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8049C18_0804dddc
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8049C88_0804dde0
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8049CF8_0804dde4
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8049D68_0804dde8
    bl         BgTask_AddNew
    pop        {r5}
    pop        {pc}

    .align 2, 0

PTR_MapSetup_Default_0804dc90:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_WWW_Comp_5_F54


_ts EventHandler_WWW_Comp_5_S5
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Default_0804ddec
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Default_0804dcb0:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_WWW_Comp_5_F54


_ts MapSetup_WWW_Comp_5_F54
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    LoadMain world, r0, r0
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    bne        LAB_0804dcec
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_0804dcf8
LAB_0804dcec:
    push       {r5}
    ldr        r0,DAT_0804ddf0
    ldr        r1,PTR_DAT_0804ddf4
    bl         Scene_Prepare
    pop        {r5}
LAB_0804dcf8:
    Flag_GetBase 0xE1
    bne        LAB_0804dd28
    push       {r5}
    ldr        r7,PTR_NPCList_804E420_0804ddf8
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    Flag_ClearBase 0xB4
    Flag_ClearBase 0xF9
    Flag_ClearBase 0xDF
    ldr        r0,PTR_EntityAllocParams_804EAF0_0804ddfc
    bl         Entity_AllocList
    pop        {r5}
    b          LAB_0804dd86
LAB_0804dd28:
    push       {r5}
    ldr        r0,PTR_BgTask_804CC98_0804de00
    bl         BgTask_AddNew
    Flag_SetIgnore F_IGNORE_DOOR_00
    pop        {r5}
    Flag_GetBase 0xE4
    bne        LAB_0804dd5a
    LoadMain world, r0, r0
    mov        r1,#0x0
    strb       r1,[r0,#0x7]
    bl         Sound_StopAllMusic
    push       {r5}
    ldr        r0,PTR_Scene_Story_77_0804de04
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_0804dd86
LAB_0804dd5a:
    Flag_GetBase 0xE6
    bne        LAB_0804dd7c
    LoadMain world, r0, r0
    mov        r1,#0x0
    strb       r1,[r0,#0x7]
    bl         Sound_StopAllMusic
    push       {r5}
    ldr        r0,PTR_Scene_Story_79_0804de08
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_0804dd86
LAB_0804dd7c:
    push       {r5}
    ldr        r7,PTR_NPCList_804E4BC_0804de0c
    bl         Map_LoadNPCList
    pop        {r5}
LAB_0804dd86:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_WWW_Comp_5_F54
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_WWW_Comp_5_F54_0_0804de10
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_WWW_Comp_5_F54_0_0804dd9c:
    .word EventHandler_WWW_Comp_5_F54_0


_ts EventHandler_WWW_Comp_5_F54_0
    push       {lr}
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x10
    bne        LAB_0804ddca
    Flag_GetBase 0xE1
    bne        LAB_0804ddca
    push       {r5}
    ldr        r0,PTR_Scene_Story_76_0804de14
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_0804ddca:
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}

    .align 2, 0

PTR_PTR_MapSetup_Default_0804ddd4:
    .word PTR_MapSetup_Default_0804dc90

PTR_BgTask_8049BA8_0804ddd8:
    .word BgTask_8049BA8

PTR_BgTask_8049C18_0804dddc:
    .word BgTask_8049C18

PTR_BgTask_8049C88_0804dde0:
    .word BgTask_8049C88

PTR_BgTask_8049CF8_0804dde4:
    .word BgTask_8049CF8

PTR_BgTask_8049D68_0804dde8:
    .word BgTask_8049D68

PTR_PTR_EventHandler_Default_0804ddec:
    .word PTR_EventHandler_Default_0804dcb0

DAT_0804ddf0:
    .word Scene_MegaManJackIn

PTR_DAT_0804ddf4:
    .word 0x2000

PTR_NPCList_804E420_0804ddf8:
    .word NPCList_804E420

PTR_EntityAllocParams_804EAF0_0804ddfc:
    .word EntityAllocParams_804EAF0

PTR_BgTask_804CC98_0804de00:
    .word BgTask_804CC98

PTR_Scene_Story_77_0804de04:
    .word Scene_Story_77

PTR_Scene_Story_79_0804de08:
    .word Scene_Story_79

PTR_NPCList_804E4BC_0804de0c:
    .word NPCList_804E4BC

PTR_PTR_EventHandler_WWW_Comp_5_F54_0_0804de10:
    .word PTR_EventHandler_WWW_Comp_5_F54_0_0804dd9c

PTR_Scene_Story_76_0804de14:
    .word Scene_Story_76
