#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set FUN_0808199e, 0x808199E
    .set FUN_0807ffba, 0x807FFBA


_ts MapSetup_SciLab_Generator_Room_S4
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_Default_0803d0f4
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r0,#0xc5
    bl         Flag_GetBase
    beq        LAB_0803cf36
    push       {r5}
    ldr        r0,PTR_BgTask_803BD78_0803d0f8
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_803BB84_0803d0fc
    bl         BgTask_AddNew
    b          LAB_0803cf54
LAB_0803cf36:
    push       {r5}
    mov        r0,#0xc4
    bl         Flag_GetBase
    beq        LAB_0803cf4e
    ldr        r0,PTR_BgTask_803BB6C_0803d100
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_803BCD8_0803d104
    bl         BgTask_AddNew
    b          LAB_0803cf54
LAB_0803cf4e:
    ldr        r0,PTR_BgTask_803BB84_0803d108
    bl         BgTask_AddNew
LAB_0803cf54:
    pop        {r5}
    mov        r0,#0xc5
    bl         Flag_GetBase
    bne        LAB_0803cf66
    mov        r0,#0x3
    bl         Sound_ChangeSong
    b          LAB_0803cf6a
LAB_0803cf66:
    bl         Sound_AreaSongChange
LAB_0803cf6a:
    pop        {pc}

PTR_MapSetup_Default_0803cf6c:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_SciLab_Generator_Room_F43
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default


_ts EventHandler_SciLab_Generator_Room_S4
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Default_0803d10c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Default_0803cf98:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_SciLab_Generator_Room_F43
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default


_ts MapSetup_SciLab_Generator_Room_F43
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    mov        r0,#0xb6
    bl         Flag_GetBase
    beq        LAB_0803d014
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    mov        r1,#0x0
    strb       r1,[r0,#0x7]
    mov        r0,#0xb7
    bl         Flag_GetBase
    bne        LAB_0803cff2
    push       {r5}
    ldr        r0,PTR_FUN_08091e8c_0803d110
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_0803d014
LAB_0803cff2:
    mov        r0,#0xb8
    bl         Flag_GetBase
    bne        LAB_0803d008
    push       {r5}
    ldr        r0,PTR_FUN_0809216c_0803d114
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_0803d014
LAB_0803d008:
    push       {r5}
    ldr        r0,PTR_FUN_0809244c_0803d118
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_0803d014:
    mov        r0,#0xc1
    bl         Flag_ClearBase
    mov        r0,#0xc4
    bl         Flag_GetBase
    beq        LAB_0803d032
    push       {r5}
    mov        r0,#0x2
    bl         FUN_0807ffba
    pop        {r5}
    mov        r0,#0x8
    str        r0,[r5,#0x0]
    pop        {pc}
LAB_0803d032:
    push       {r5}
    mov        r0,#0x0
    bl         FUN_0808199e
    pop        {r5}
    push       {r5}
    mov        r0,#0x0
    bl         FUN_0807ffba
    pop        {r5}
    mov        r0,#0xbf
    bl         Flag_GetBase
    beq        LAB_0803d054
    mov        r0,#0x4
    str        r0,[r5,#0x0]
    pop        {pc}
LAB_0803d054:
    mov        r0,#0xbb
    bl         Flag_GetBase
    bne        LAB_0803d06e
    mov        r0,#0xbb
    bl         Flag_SetBase
    push       {r5}
    ldr        r0,DAT_0803d11c
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_0803d06e:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_SciLab_Generator_Room_F43
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_SciLab_Generator_Room_F43_0_0803d120
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_SciLab_Generator_Room_F43_0_0803d084:
    .word EventHandler_SciLab_Generator_Room_F43_0
    .word EventHandler_SciLab_Generator_Room_F43_1
    .word EventHandler_SciLab_Generator_Room_F43_2


_ts EventHandler_SciLab_Generator_Room_F43_0
    push       {lr}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x20
    bne        LAB_0803d0ae
    mov        r0,#0xbc
    bl         Flag_SetBase
    push       {r5}
    ldr        r0,PTR_FUN_08091b70_0803d124
    mov        r1,#0x4
    bl         Scene_Prepare
    pop        {r5}
LAB_0803d0ae:
    pop        {pc}


_ts EventHandler_SciLab_Generator_Room_F43_1
    push       {lr}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x20
    bne        LAB_0803d0d0
    mov        r0,#0xc0
    bl         Flag_GetBase
    bne        LAB_0803d0d0
    push       {r5}
    ldr        r0,PTR_FUN_08090dbc_0803d128
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_0803d0d0:
    pop        {pc}


_nt EventHandler_SciLab_Generator_Room_F43_2
    push       {lr}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x20
    bne        LAB_0803d0f2
    mov        r0,#0xc5
    bl         Flag_GetBase
    bne        LAB_0803d0f2
    push       {r5}
    ldr        r0,PTR_FUN_08091468_0803d12c
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_0803d0f2:
    pop        {pc}

PTR_PTR_MapSetup_Default_0803d0f4:
    .word PTR_MapSetup_Default_0803cf6c

PTR_BgTask_803BD78_0803d0f8:
    .word BgTask_803BD78

PTR_BgTask_803BB84_0803d0fc:
    .word BgTask_803BB84

PTR_BgTask_803BB6C_0803d100:
    .word BgTask_803BB6C

PTR_BgTask_803BCD8_0803d104:
    .word BgTask_803BCD8

PTR_BgTask_803BB84_0803d108:
    .word BgTask_803BB84

PTR_PTR_EventHandler_Default_0803d10c:
    .word PTR_EventHandler_Default_0803cf98

PTR_FUN_08091e8c_0803d110:
    .word 0x8091E8D

PTR_FUN_0809216c_0803d114:
    .word 0x809216D

PTR_FUN_0809244c_0803d118:
    .word 0x809244D

DAT_0803d11c:
    .word 0x80848FD

PTR_PTR_EventHandler_SciLab_Generator_Room_F43_0_0803d120:
    .word PTR_EventHandler_SciLab_Generator_Room_F43_0_0803d084

PTR_FUN_08091b70_0803d124:
    .word 0x8091B71

PTR_FUN_08090dbc_0803d128:
    .word 0x8090DBD

PTR_FUN_08091468_0803d12c:
    .word 0x8091469


_ts MapSetup_SciLab_Generator_Room_S5
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_SciLab_Generator_Room_F50_0803d1d8
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_803BD78_0803d1dc
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_803BB84_0803d1e0
    bl         BgTask_AddNew
    pop        {r5}
    bl         Sound_AreaSongChange
    pop        {pc}

PTR_MapSetup_SciLab_Generator_Room_F50_0803d150:
    .word MapSetup_SciLab_Generator_Room_F50
    .word MapSetup_SciLab_Generator_Room_F50
    .word MapSetup_SciLab_Generator_Room_F50
    .word MapSetup_SciLab_Generator_Room_F50
    .word MapSetup_SciLab_Generator_Room_F50
    .word MapSetup_SciLab_Generator_Room_F50
    .word MapSetup_SciLab_Generator_Room_F50
    .word MapSetup_SciLab_Generator_Room_F50


_ts EventHandler_SciLab_Generator_Room_S5
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_SciLab_Generator_Room_F50_0803d1e4
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_SciLab_Generator_Room_F50_0803d17c:
    .word EventHandler_SciLab_Generator_Room_F50
    .word EventHandler_SciLab_Generator_Room_F50
    .word EventHandler_SciLab_Generator_Room_F50
    .word EventHandler_SciLab_Generator_Room_F50
    .word EventHandler_SciLab_Generator_Room_F50
    .word EventHandler_SciLab_Generator_Room_F50
    .word EventHandler_SciLab_Generator_Room_F50
    .word EventHandler_SciLab_Generator_Room_F50


_ts MapSetup_SciLab_Generator_Room_F50
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    mov        r0,#0x0
    bl         FUN_0807ffba
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_SciLab_Generator_Room_F50
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_SciLab_Generator_Room_F50_0_0803d1e8
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_SciLab_Generator_Room_F50_0_0803d1d0:
    .word EventHandler_SciLab_Generator_Room_F50_0


_ts EventHandler_SciLab_Generator_Room_F50_0
    push       {lr}
    pop        {pc}

PTR_PTR_MapSetup_SciLab_Generator_Room_F50_0803d1d8:
    .word PTR_MapSetup_SciLab_Generator_Room_F50_0803d150

PTR_BgTask_803BD78_0803d1dc:
    .word BgTask_803BD78

PTR_BgTask_803BB84_0803d1e0:
    .word BgTask_803BB84

PTR_PTR_EventHandler_SciLab_Generator_Room_F50_0803d1e4:
    .word PTR_EventHandler_SciLab_Generator_Room_F50_0803d17c

PTR_PTR_EventHandler_SciLab_Generator_Room_F50_0_0803d1e8:
    .word PTR_EventHandler_SciLab_Generator_Room_F50_0_0803d1d0
