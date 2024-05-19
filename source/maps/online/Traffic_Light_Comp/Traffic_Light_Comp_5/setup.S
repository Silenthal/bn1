#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set Script_ShowDialogue, 0x80848FC+1
    .set FUN_0807f83c, 0x807F83C+1


_ts MapSetup_Traffic_Light_Comp_5_S3
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_Default_08048f30
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         FUN_0804995c
    push       {r5}
    ldr        r0,PTR_BgTask_80475A4_08048f34
    bl         BgTask_AddNew
    mov        r0,#0xba
    bl         Flag_GetBase
    bne        LAB_08048b82
    ldr        r0,PTR_BgTask_80475F4_08048f38
    bl         BgTask_AddNew
    b          LAB_08048b88
LAB_08048b82:
    ldr        r0,PTR_BgTask_804760C_08048f3c
    bl         BgTask_AddNew
LAB_08048b88:
    pop        {r5}
    mov        r0,#0x2a
    bl         Flag_Get420
    bne        LAB_08048b96
    bl         Sound_AreaSongChange
LAB_08048b96:
    pop        {pc}

PTR_MapSetup_Default_08048b98:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Traffic_Light_Comp_5_F35
    .word MapSetup_Traffic_Light_Comp_5_F36
    .word MapSetup_Traffic_Light_Comp_5_F37


_ts EventHandler_Traffic_Light_Comp_5_S3
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Default_08048f40
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         FUN_080499a8
    pop        {pc}

PTR_EventHandler_Default_08048bc8:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Traffic_Light_Comp_5_F35
    .word EventHandler_Traffic_Light_Comp_5_F36
    .word EventHandler_Traffic_Light_Comp_5_F37


_ts MapSetup_Traffic_Light_Comp_5_F35
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_80492E8_08048f44
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    bne        LAB_08048c1a
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_08048c26
LAB_08048c1a:
    push       {r5}
    ldr        r0,DAT_08048f48
    ldr        r1,PTR_DAT_08048f4c
    bl         Scene_Prepare
    pop        {r5}
LAB_08048c26:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Traffic_Light_Comp_5_F35
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Traffic_Light_Comp_5_F35_0_08048f50
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Traffic_Light_Comp_5_F35_0_08048c3c:
    .word EventHandler_Traffic_Light_Comp_5_F35_0


_ts EventHandler_Traffic_Light_Comp_5_F35_0
    push       {lr}
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08048c6e
    mov        r0,r10
    ldr        r0,[r0,#0x4]
    ldrh       r0,[r0,#0x2]
    ldr        r1,DAT_08048f54
    and        r1,r0
    beq        LAB_08048c6e
    bl         dummy_187a0
    bne        LAB_08048c6e
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    mov        r1,#0x36
    strb       r1,[r0,#0x6]
    mov        r0,#0x9
    bl         CheckForJackOut
LAB_08048c6e:
    pop        {pc}


_ts MapSetup_Traffic_Light_Comp_5_F36
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_80492E8_08048f58
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0xb8
    bl         Flag_GetBase
    bne        LAB_08048cb6
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    bne        LAB_08048caa
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_08048cb6
LAB_08048caa:
    push       {r5}
    ldr        r0,PTR_FUN_08084070_08048f5c
    ldr        r1,PTR_DAT_08048f4c
    bl         Scene_Prepare
    pop        {r5}
LAB_08048cb6:
    mov        r0,#0xb4
    bl         Flag_GetBase
    beq        LAB_08048cf2
    mov        r0,#0xb9
    bl         Flag_GetBase
    bne        LAB_08048cee
    mov        r0,#0xb7
    bl         Flag_GetBase
    bne        LAB_08048cea
    mov        r0,#0xb6
    bl         Flag_GetBase
    bne        LAB_08048ce6
    mov        r0,#0xb5
    bl         Flag_GetBase
    bne        LAB_08048ce2
    mov        r0,#0x4
    b          LAB_08048cf4
LAB_08048ce2:
    mov        r0,#0x8
    b          LAB_08048cf4
LAB_08048ce6:
    mov        r0,#0xc
    b          LAB_08048cf4
LAB_08048cea:
    mov        r0,#0x10
    b          LAB_08048cf4
LAB_08048cee:
    mov        r0,#0x14
    b          LAB_08048cf4
LAB_08048cf2:
    mov        r0,#0x0
LAB_08048cf4:
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Traffic_Light_Comp_5_F36
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Traffic_Light_Comp_5_F36_0_08048f60
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Traffic_Light_Comp_5_F36_0_08048d08:
    .word EventHandler_Traffic_Light_Comp_5_F36_0
    .word EventHandler_Traffic_Light_Comp_5_F36_1
    .word EventHandler_Traffic_Light_Comp_5_F36_2
    .word EventHandler_Traffic_Light_Comp_5_F36_3
    .word EventHandler_Traffic_Light_Comp_5_F36_4
    .word EventHandler_Traffic_Light_Comp_5_F36_5


_ts EventHandler_Traffic_Light_Comp_5_F36_0
    push       {lr}
    push       {r5}
    ldr        r0,PTR_FUN_0808de30_08048f64
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x4
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Traffic_Light_Comp_5_F36_1
    push       {lr}
    bl         FUN_08048ee4
    mov        r0,#0xc6
    bl         Flag_GetBase
    beq        LAB_08048d54
    mov        r0,#0xb8
    bl         Flag_SetBase
    push       {r5}
    ldr        r0,PTR_FUN_08087e34_08048f68
    mov        r1,#0x11
    bl         Scene_Prepare
    pop        {r5}
LAB_08048d54:
    bl         FUN_08048eac
    pop        {pc}


_nt EventHandler_Traffic_Light_Comp_5_F36_2
    push       {lr}
    bl         FUN_08048ee4
    mov        r0,#0xc7
    bl         Flag_GetBase
    beq        LAB_08048d86
    push       {r5}
    ldr        r0,PTR_Script_ShowDialogue_08048f6c
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0xb8
    bl         Flag_SetBase
    push       {r5}
    ldr        r0,PTR_FUN_08087e34_08048f70
    mov        r1,#0x11
    bl         Scene_Prepare
    pop        {r5}
LAB_08048d86:
    bl         FUN_08048eac
    pop        {pc}


_ts EventHandler_Traffic_Light_Comp_5_F36_3
    push       {lr}
    bl         FUN_08048ee4
    mov        r0,#0xc8
    bl         Flag_GetBase
    beq        LAB_08048dac
    mov        r0,#0xb8
    bl         Flag_SetBase
    push       {r5}
    ldr        r0,PTR_FUN_08087e34_08048f74
    mov        r1,#0x11
    bl         Scene_Prepare
    pop        {r5}
LAB_08048dac:
    bl         FUN_08048eac
    pop        {pc}


_nt EventHandler_Traffic_Light_Comp_5_F36_4
    push       {lr}
    bl         FUN_08048ee4
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x10
    bne        LAB_08048dde
    mov        r0,#0xb8
    bl         Flag_SetBase
    push       {r5}
    ldr        r0,PTR_FUN_08087e34_08048f78
    mov        r1,#0x11
    bl         Scene_Prepare
    pop        {r5}
LAB_08048dde:
    bl         FUN_08048eac
    pop        {pc}


_ts EventHandler_Traffic_Light_Comp_5_F36_5
    push       {lr}
    bl         FUN_08048ee4
    mov        r0,#0xad
    bl         Flag_GetBase
    beq        LAB_08048e04
    mov        r0,#0xb8
    bl         Flag_SetBase
    push       {r5}
    ldr        r0,PTR_FUN_08087e34_08048f7c
    mov        r1,#0x13
    bl         Scene_Prepare
    pop        {r5}
LAB_08048e04:
    bl         FUN_08048eac
    pop        {pc}


_nt MapSetup_Traffic_Light_Comp_5_F37
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    mov        r0,#0xbb
    bl         Flag_GetBase
    beq        LAB_08048e40
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    mov        r1,#0x0
    strb       r1,[r0,#0x7]
    push       {r5}
    ldr        r0,PTR_LAB_0808eaa8_08048f80
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x4
    str        r0,[r5,#0x0]
    pop        {pc}
LAB_08048e40:
    push       {r5}
    ldr        r7,PTR_NPCList_80492A0_08048f84
    bl         Map_LoadNPCList
    bl         FUN_0807f83c
    pop        {r5}
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    bne        LAB_08048e62
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_08048e6e
LAB_08048e62:
    push       {r5}
    ldr        r0,PTR_FUN_08084070_08048f88
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_08048e6e:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Traffic_Light_Comp_5_F37
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Traffic_Light_Comp_5_F37_0_08048f8c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Traffic_Light_Comp_5_F37_0_08048e84:
    .word EventHandler_Traffic_Light_Comp_5_F37_0
    .word EventHandler_Traffic_Light_Comp_5_F37_1


_ts EventHandler_Traffic_Light_Comp_5_F37_0
    push       {lr}
    mov        r0,#0xbb
    bl         Flag_GetBase
    bne        LAB_08048ea6
    push       {r5}
    ldr        r0,PTR_LAB_0808e808_08048f90
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x4
    str        r0,[r5,#0x0]
LAB_08048ea6:
    pop        {pc}


_ts EventHandler_Traffic_Light_Comp_5_F37_1
    push       {lr}
    pop        {pc}


_ts FUN_08048eac
    push       {lr}
    push       {r0}
    bl         Scene_IsSceneActive
    pop        {r0}
    bne        LAB_08048ee2
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08048ee2
    mov        r2,r10
    ldr        r2,[r2,#0x4]
    ldrh       r2,[r2,#0x2]
    ldr        r1,DAT_08048f54
    and        r1,r2
    beq        LAB_08048ee2
    bl         dummy_187a0
    bne        LAB_08048ee2
    push       {r5}
    ldr        r0,PTR_Script_ShowDialogue_08048f94
    mov        r1,#0xd
    bl         Scene_Prepare
    pop        {r5}
LAB_08048ee2:
    pop        {pc}


_ts FUN_08048ee4
    push       {lr}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x20
    bne        LAB_08048efc
    push       {r5}
    ldr        r0,PTR_Script_ShowDialogue_08048f98
    mov        r1,#0x9
    bl         Scene_Prepare
    pop        {r5}
LAB_08048efc:
    cmp        r0,#0x21
    bne        LAB_08048f0c
    push       {r5}
    ldr        r0,PTR_Script_ShowDialogue_08048f9c
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_08048f0c:
    cmp        r0,#0x22
    bne        LAB_08048f1c
    push       {r5}
    ldr        r0,PTR_Script_ShowDialogue_08048fa0
    mov        r1,#0x3
    bl         Scene_Prepare
    pop        {r5}
LAB_08048f1c:
    cmp        r0,#0x23
    bne        LAB_08048f2c
    push       {r5}
    ldr        r0,PTR_Script_ShowDialogue_08048fa4
    mov        r1,#0x6
    bl         Scene_Prepare
    pop        {r5}
LAB_08048f2c:
    pop        {pc}

    .align 2, 0

PTR_PTR_MapSetup_Default_08048f30:
    .word PTR_MapSetup_Default_08048b98

PTR_BgTask_80475A4_08048f34:
    .word BgTask_80475A4

PTR_BgTask_80475F4_08048f38:
    .word BgTask_80475F4

PTR_BgTask_804760C_08048f3c:
    .word BgTask_804760C

PTR_PTR_EventHandler_Default_08048f40:
    .word PTR_EventHandler_Default_08048bc8

PTR_NPCList_80492E8_08048f44:
    .word NPCList_80492E8

DAT_08048f48:
    .word 0x8084071

PTR_DAT_08048f4c:
    .word 0x2000

PTR_PTR_EventHandler_Traffic_Light_Comp_5_F35_0_08048f50:
    .word PTR_EventHandler_Traffic_Light_Comp_5_F35_0_08048c3c

DAT_08048f54:
    .word 0x100

PTR_NPCList_80492E8_08048f58:
    .word NPCList_80492E8

PTR_FUN_08084070_08048f5c:
    .word 0x8084071

PTR_PTR_EventHandler_Traffic_Light_Comp_5_F36_0_08048f60:
    .word PTR_EventHandler_Traffic_Light_Comp_5_F36_0_08048d08

PTR_FUN_0808de30_08048f64:
    .word 0x808DE31

PTR_FUN_08087e34_08048f68:
    .word 0x8087E35

PTR_Script_ShowDialogue_08048f6c:
    .word Script_ShowDialogue

PTR_FUN_08087e34_08048f70:
    .word 0x8087E35

PTR_FUN_08087e34_08048f74:
    .word 0x8087E35

PTR_FUN_08087e34_08048f78:
    .word 0x8087E35

PTR_FUN_08087e34_08048f7c:
    .word 0x8087E35

PTR_LAB_0808eaa8_08048f80:
    .word 0x808EAA9

PTR_NPCList_80492A0_08048f84:
    .word NPCList_80492A0

PTR_FUN_08084070_08048f88:
    .word 0x8084071

PTR_PTR_EventHandler_Traffic_Light_Comp_5_F37_0_08048f8c:
    .word PTR_EventHandler_Traffic_Light_Comp_5_F37_0_08048e84

PTR_LAB_0808e808_08048f90:
    .word 0x808E809

PTR_Script_ShowDialogue_08048f94:
    .word Script_ShowDialogue

PTR_Script_ShowDialogue_08048f98:
    .word Script_ShowDialogue

PTR_Script_ShowDialogue_08048f9c:
    .word Script_ShowDialogue

PTR_Script_ShowDialogue_08048fa0:
    .word Script_ShowDialogue

PTR_Script_ShowDialogue_08048fa4:
    .word Script_ShowDialogue


_ts MapSetup_Traffic_Light_Comp_5_S4
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,PTR_PTR_MapSetup_Traffic_Light_Comp_5_F40_080490b4
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         FUN_08049958
    push       {r5}
    ldr        r0,PTR_BgTask_80475A4_080490b8
    bl         BgTask_AddNew
    mov        r0,#0xba
    bl         Flag_GetBase
    bne        LAB_08048fd6
    ldr        r0,PTR_BgTask_80475F4_080490bc
    bl         BgTask_AddNew
    b          LAB_08048fdc
LAB_08048fd6:
    ldr        r0,PTR_BgTask_804760C_080490c0
    bl         BgTask_AddNew
LAB_08048fdc:
    pop        {r5}
    pop        {pc}

PTR_MapSetup_Traffic_Light_Comp_5_F40_08048fe0:
    .word MapSetup_Traffic_Light_Comp_5_F40
    .word MapSetup_Traffic_Light_Comp_5_F40
    .word MapSetup_Traffic_Light_Comp_5_F40
    .word MapSetup_Traffic_Light_Comp_5_F40
    .word MapSetup_Traffic_Light_Comp_5_F40
    .word MapSetup_Traffic_Light_Comp_5_F40
    .word MapSetup_Traffic_Light_Comp_5_F40
    .word MapSetup_Traffic_Light_Comp_5_F40


_ts EventHandler_Traffic_Light_Comp_5_S4
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Traffic_Light_Comp_5_F40_080490c4
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         FUN_080499a8
    pop        {pc}

PTR_EventHandler_Traffic_Light_Comp_5_F40_08049010:
    .word EventHandler_Traffic_Light_Comp_5_F40
    .word EventHandler_Traffic_Light_Comp_5_F40
    .word EventHandler_Traffic_Light_Comp_5_F40
    .word EventHandler_Traffic_Light_Comp_5_F40
    .word EventHandler_Traffic_Light_Comp_5_F40
    .word EventHandler_Traffic_Light_Comp_5_F40
    .word EventHandler_Traffic_Light_Comp_5_F40
    .word EventHandler_Traffic_Light_Comp_5_F40


_ts MapSetup_Traffic_Light_Comp_5_F40
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_80492E8_080490c8
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    bne        LAB_08049062
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_0804906e
LAB_08049062:
    push       {r5}
    ldr        r0,DAT_080490cc
    ldr        r1,PTR_DAT_080490d0
    bl         Scene_Prepare
    pop        {r5}
LAB_0804906e:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Traffic_Light_Comp_5_F40
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Traffic_Light_Comp_5_F40_0_080490d4
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Traffic_Light_Comp_5_F40_0_08049084:
    .word EventHandler_Traffic_Light_Comp_5_F40_0


_ts EventHandler_Traffic_Light_Comp_5_F40_0
    push       {lr}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x20
    beq        LAB_080490a0
    cmp        r0,#0x21
    beq        LAB_080490a0
    cmp        r0,#0x22
    beq        LAB_080490a0
    cmp        r0,#0x23
    bne        LAB_080490ac
LAB_080490a0:
    push       {r5}
    ldr        r0,DAT_080490d8
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_080490ac:
    mov        r0,#0x9
    bl         CheckForJackOut
    pop        {pc}

PTR_PTR_MapSetup_Traffic_Light_Comp_5_F40_080490b4:
    .word PTR_MapSetup_Traffic_Light_Comp_5_F40_08048fe0

PTR_BgTask_80475A4_080490b8:
    .word BgTask_80475A4

PTR_BgTask_80475F4_080490bc:
    .word BgTask_80475F4

PTR_BgTask_804760C_080490c0:
    .word BgTask_804760C

PTR_PTR_EventHandler_Traffic_Light_Comp_5_F40_080490c4:
    .word PTR_EventHandler_Traffic_Light_Comp_5_F40_08049010

PTR_NPCList_80492E8_080490c8:
    .word NPCList_80492E8

DAT_080490cc:
    .word 0x8084071

PTR_DAT_080490d0:
    .word 0x2000

PTR_PTR_EventHandler_Traffic_Light_Comp_5_F40_0_080490d4:
    .word PTR_EventHandler_Traffic_Light_Comp_5_F40_0_08049084

DAT_080490d8:
    .word 0x80848FD
