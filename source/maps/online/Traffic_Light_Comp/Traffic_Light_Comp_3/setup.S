#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_Traffic_Light_Comp_3_S3
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,PTR_PTR_MapSetup_Default_08048754
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         FUN_08049958
    push       {r5}
    ldr        r0,PTR_BgTask_8047554_08048758
    bl         BgTask_AddNew
    pop        {r5}
    pop        {pc}

    .align 2, 0

PTR_MapSetup_Default_080485d8:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Traffic_Light_Comp_3_F34
    .word MapSetup_Traffic_Light_Comp_3_F35
    .word MapSetup_Default
    .word MapSetup_Default


_ts EventHandler_Traffic_Light_Comp_3_S3
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Default_0804875c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         FUN_080499a8
    pop        {pc}

PTR_EventHandler_Default_08048608:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Traffic_Light_Comp_3_F34
    .word EventHandler_Traffic_Light_Comp_3_F35
    .word EventHandler_Default
    .word EventHandler_Default


_ts MapSetup_Traffic_Light_Comp_3_F34
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_80491D0_08048760
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    bne        LAB_0804865a
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_08048666
LAB_0804865a:
    push       {r5}
    ldr        r0,DAT_08048764
    ldr        r1,PTR_DAT_08048768
    bl         Scene_Prepare
    pop        {r5}
LAB_08048666:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Traffic_Light_Comp_3_F34
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Traffic_Light_Comp_3_F34_0_0804876c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Traffic_Light_Comp_3_F34_0_0804867c:
    .word EventHandler_Traffic_Light_Comp_3_F34_0


_ts EventHandler_Traffic_Light_Comp_3_F34_0
    push       {lr}
    mov        r0,#0xc5
    bl         Flag_GetBase
    beq        LAB_080486a0
    mov        r0,#0xaa
    bl         Flag_GetBase
    bne        LAB_080486a0
    push       {r5}
    ldr        r0,PTR_FUN_0808d684_08048770
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_080486a0:
    mov        r0,#0xab
    bl         Flag_GetBase
    beq        LAB_080486be
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    mov        r1,#0x35
    strb       r1,[r0,#0x6]
    push       {r5}
    ldr        r0,DAT_08048774
    mov        r1,#0x12
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_080486be:
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x20
    bne        LAB_080486d4
    push       {r5}
    ldr        r0,DAT_08048778
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_080486d4:
    mov        r0,#0x9
    bl         CheckForJackOut
    pop        {pc}


_ts MapSetup_Traffic_Light_Comp_3_F35
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_80491D0_0804877c
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    bne        LAB_0804870e
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_0804871a
LAB_0804870e:
    push       {r5}
    ldr        r0,PTR_Scene_MegaManJackIn_08048780
    ldr        r1,PTR_DAT_08048768
    bl         Scene_Prepare
    pop        {r5}
LAB_0804871a:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Traffic_Light_Comp_3_F35
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Traffic_Light_Comp_3_F35_0_08048784
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Traffic_Light_Comp_3_F35_0_08048730:
    .word EventHandler_Traffic_Light_Comp_3_F35_0


_ts EventHandler_Traffic_Light_Comp_3_F35_0
    push       {lr}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x20
    bne        LAB_0804874c
    push       {r5}
    ldr        r0,DAT_08048788
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_0804874c:
    mov        r0,#0x9
    bl         CheckForJackOut
    pop        {pc}

PTR_PTR_MapSetup_Default_08048754:
    .word PTR_MapSetup_Default_080485d8

PTR_BgTask_8047554_08048758:
    .word BgTask_8047554

PTR_PTR_EventHandler_Default_0804875c:
    .word PTR_EventHandler_Default_08048608

PTR_NPCList_80491D0_08048760:
    .word NPCList_80491D0

DAT_08048764:
    .word Scene_MegaManJackIn

PTR_DAT_08048768:
    .word 0x2000

PTR_PTR_EventHandler_Traffic_Light_Comp_3_F34_0_0804876c:
    .word PTR_EventHandler_Traffic_Light_Comp_3_F34_0_0804867c

PTR_FUN_0808d684_08048770:
    .word 0x808D685

DAT_08048774:
    .word 0x8087E35

DAT_08048778:
    .word Scene_Dialogue

PTR_NPCList_80491D0_0804877c:
    .word NPCList_80491D0

PTR_Scene_MegaManJackIn_08048780:
    .word Scene_MegaManJackIn

PTR_PTR_EventHandler_Traffic_Light_Comp_3_F35_0_08048784:
    .word PTR_EventHandler_Traffic_Light_Comp_3_F35_0_08048730

DAT_08048788:
    .word Scene_Dialogue


_ts MapSetup_Traffic_Light_Comp_3_S4
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,PTR_PTR_MapSetup_Traffic_Light_Comp_3_F40_08048878
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         FUN_08049958
    push       {r5}
    ldr        r0,PTR_BgTask_8047554_0804887c
    bl         BgTask_AddNew
    pop        {r5}
    pop        {pc}

    .align 2, 0

PTR_MapSetup_Traffic_Light_Comp_3_F40_080487b0:
    .word MapSetup_Traffic_Light_Comp_3_F40
    .word MapSetup_Traffic_Light_Comp_3_F40
    .word MapSetup_Traffic_Light_Comp_3_F40
    .word MapSetup_Traffic_Light_Comp_3_F40
    .word MapSetup_Traffic_Light_Comp_3_F40
    .word MapSetup_Traffic_Light_Comp_3_F40
    .word MapSetup_Traffic_Light_Comp_3_F40
    .word MapSetup_Traffic_Light_Comp_3_F40


_ts EventHandler_Traffic_Light_Comp_3_S4
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Traffic_Light_Comp_3_F40_08048880
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         FUN_080499a8
    pop        {pc}

PTR_EventHandler_Traffic_Light_Comp_3_F40_080487e0:
    .word EventHandler_Traffic_Light_Comp_3_F40
    .word EventHandler_Traffic_Light_Comp_3_F40
    .word EventHandler_Traffic_Light_Comp_3_F40
    .word EventHandler_Traffic_Light_Comp_3_F40
    .word EventHandler_Traffic_Light_Comp_3_F40
    .word EventHandler_Traffic_Light_Comp_3_F40
    .word EventHandler_Traffic_Light_Comp_3_F40
    .word EventHandler_Traffic_Light_Comp_3_F40


_ts MapSetup_Traffic_Light_Comp_3_F40
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_80491D0_08048884
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    bne        LAB_08048832
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_0804883e
LAB_08048832:
    push       {r5}
    ldr        r0,DAT_08048888
    ldr        r1,PTR_DAT_0804888c
    bl         Scene_Prepare
    pop        {r5}
LAB_0804883e:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_Traffic_Light_Comp_3_F40
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Traffic_Light_Comp_3_F40_0_08048890
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Traffic_Light_Comp_3_F40_0_08048854:
    .word EventHandler_Traffic_Light_Comp_3_F40_0


_ts EventHandler_Traffic_Light_Comp_3_F40_0
    push       {lr}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x20
    bne        LAB_08048870
    push       {r5}
    ldr        r0,DAT_08048894
    mov        r1,#0x0
    bl         Scene_Prepare
    pop        {r5}
LAB_08048870:
    mov        r0,#0x9
    bl         CheckForJackOut
    pop        {pc}

PTR_PTR_MapSetup_Traffic_Light_Comp_3_F40_08048878:
    .word PTR_MapSetup_Traffic_Light_Comp_3_F40_080487b0

PTR_BgTask_8047554_0804887c:
    .word BgTask_8047554

PTR_PTR_EventHandler_Traffic_Light_Comp_3_F40_08048880:
    .word PTR_EventHandler_Traffic_Light_Comp_3_F40_080487e0

PTR_NPCList_80491D0_08048884:
    .word NPCList_80491D0

DAT_08048888:
    .word Scene_MegaManJackIn

PTR_DAT_0804888c:
    .word 0x2000

PTR_PTR_EventHandler_Traffic_Light_Comp_3_F40_0_08048890:
    .word PTR_EventHandler_Traffic_Light_Comp_3_F40_0_08048854

DAT_08048894:
    .word Scene_Dialogue
