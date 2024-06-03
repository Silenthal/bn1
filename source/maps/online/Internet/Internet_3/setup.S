#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set Script_ShowDialogue, 0x80848FC+1


_ts MapSetup_Internet_3_S0
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,PTR_FUN_08052678_08052890
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_80515C8_08052894
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051618_08052898
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051668_0805289c
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_80516B8_080528a0
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_80516F8_080528a4
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051780_080528a8
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051820_080528ac
    bl         BgTask_AddNew
    mov        r0,#0x53
    bl         Flag_GetBase
    beq        LAB_0805266a
    ldr        r0,PTR_BgTask_8051738_080528b0
    bl         BgTask_AddNew
LAB_0805266a:
    pop        {r5}
    pop        {pc}


_nt EventHandler_Internet_3_S0
    push       {lr}
    ldr        r0,PTR_FUN_08052714_080528b4
    mov        lr,pc
    bx         r0
    pop        {pc}


_ts FUN_08052678
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#0x1]
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_8054348_080528b8
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_080526b2
    push       {r5}
    ldr        r0,PTR_FUN_08084070_080528bc
    ldr        r1,PTR_DAT_080528c0
    bl         Scene_Prepare
    pop        {r5}
LAB_080526b2:
    mov        r0,#0x4a
    bl         Flag_GetBase
    bne        LAB_080526c0
    mov        r0,#0x0
    bl         Flag_Set410
LAB_080526c0:
    mov        r0,#0x48
    bl         Flag_GetBase
    bne        LAB_080526ce
    mov        r0,#0x1
    bl         Flag_Set410
LAB_080526ce:
    mov        r0,#0x49
    bl         Flag_GetBase
    bne        LAB_080526dc
    mov        r0,#0x2
    bl         Flag_Set410
LAB_080526dc:
    mov        r0,#0x53
    bl         Flag_GetBase
    beq        LAB_080526f0
    push       {r5}
    mov        r0,#0x0
    bl         Flag_Set380
    pop        {r5}
    b          LAB_080526fa
LAB_080526f0:
    push       {r5}
    mov        r1,#0x8a
    bl         Effect_WWWDoor_Create
    pop        {r5}
LAB_080526fa:
    mov        r0,#0x56
    bl         Flag_GetBase
    beq        LAB_0805270e
    push       {r5}
    ldr        r0,PTR_FUN_0808598c_080528c4
    mov        r1,#0x14
    bl         Scene_Prepare
    pop        {r5}
LAB_0805270e:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts FUN_08052714
    push       {lr}
    ldr        r0,PTR_PTR_FUN_08052728_080528c8
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_FUN_08052728_08052724:
    .word FUN_08052728


_ts FUN_08052728
    push       {lr}
    mov        r0,#0x53
    bl         Flag_GetBase
    bne        LAB_0805274c
    mov        r0,#0x54
    bl         Flag_GetBase
    beq        LAB_0805274c
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
    push       {r5}
    ldr        r0,PTR_FUN_08086e18_080528cc
    mov        r1,#0x9
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_0805274c:
    ldrb       r0,[r5,#0x1]
    tst        r0,r0
    beq        LAB_08052760
    mov        r0,#0x0
    strb       r0,[r5,#0x1]
    push       {r5}
    ldr        r0,PTR_BgTask_8051738_080528d0
    bl         BgTask_AddNew
    pop        {r5}
LAB_08052760:
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x10
    bne        LAB_08052796
    mov        r0,#0x55
    bl         Flag_GetBase
    bne        LAB_08052796
    mov        r0,#0x56
    bl         Flag_SetBase
    push       {r5}
    ldr        r0,PTR_FUN_080857b8_080528d4
    mov        r1,#0x17
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}
LAB_08052796:
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x20
    bne        LAB_080527b4
    mov        r0,#0x53
    bl         Flag_GetBase
    bne        LAB_080527b4
    push       {r5}
    ldr        r0,PTR_Script_ShowDialogue_080528d8
    mov        r1,#0x15
    bl         Scene_Prepare
    pop        {r5}
LAB_080527b4:
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x1
    bne        LAB_080527f0
    mov        r0,#0x0
    bl         Flag_Get410
    beq        LAB_08052874
    mov        r0,#0x25
    bl         KeyItem_IsPresent
    bne        LAB_080527ec
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldr        r7,[r7,#0x28]
    ldr        r0,[r7,#0x10]
    add        r0,#0x4
    mov        r2,#0x7
    and        r0,r2
    ldr        r1,DAT_080528dc
    orr        r1,r0
    b          LAB_0805286a
LAB_080527ec:
    mov        r1,#0xa
    b          LAB_08052858
LAB_080527f0:
    cmp        r0,#0x2
    bne        LAB_0805281c
    mov        r0,#0x1
    bl         Flag_Get410
    beq        LAB_08052874
    mov        r0,#0x26
    bl         KeyItem_IsPresent
    bne        LAB_08052818
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldr        r7,[r7,#0x28]
    ldr        r0,[r7,#0x10]
    add        r0,#0x4
    mov        r2,#0x7
    and        r0,r2
    ldr        r1,DAT_080528e0
    orr        r1,r0
    b          LAB_0805286a
LAB_08052818:
    mov        r1,#0xc
    b          LAB_08052858
LAB_0805281c:
    cmp        r0,#0x3
    bne        LAB_08052848
    mov        r0,#0x2
    bl         Flag_Get410
    beq        LAB_08052874
    mov        r0,#0x2b
    bl         KeyItem_IsPresent
    bne        LAB_08052844
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldr        r7,[r7,#0x28]
    ldr        r0,[r7,#0x10]
    add        r0,#0x4
    mov        r2,#0x7
    and        r0,r2
    ldr        r1,DAT_080528e4
    orr        r1,r0
    b          LAB_0805286a
LAB_08052844:
    mov        r1,#0xe
    b          LAB_08052858
LAB_08052848:
    cmp        r0,#0x5
    bne        LAB_08052874
    mov        r0,#0x4
    bl         Flag_Get410
    beq        LAB_08052874
    ldr        r1,PTR_DAT_080528e8
    b          LAB_0805286a
LAB_08052858:
    push       {r5}
    ldr        r0,PTR_Script_ShowDialogue_080528ec
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}
LAB_0805286a:
    push       {r5}
    ldr        r0,PTR_FUN_08082de4_080528f0
    bl         Scene_Prepare
    pop        {r5}
LAB_08052874:
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}


_ts ClearFlagRange280
    push       {lr}
LAB_0805287e:
    push       {r0,r1}
    bl         Flag_Clear280
    pop        {r0,r1}
    add        r0,#0x1
    sub        r1,#0x1
    tst        r1,r1
    bne        LAB_0805287e
    pop        {pc}

PTR_FUN_08052678_08052890:
    .word FUN_08052678

PTR_BgTask_80515C8_08052894:
    .word BgTask_80515C8

PTR_BgTask_8051618_08052898:
    .word BgTask_8051618

PTR_BgTask_8051668_0805289c:
    .word BgTask_8051668

PTR_BgTask_80516B8_080528a0:
    .word BgTask_80516B8

PTR_BgTask_80516F8_080528a4:
    .word BgTask_80516F8

PTR_BgTask_8051780_080528a8:
    .word BgTask_8051780

PTR_BgTask_8051820_080528ac:
    .word BgTask_8051820

PTR_BgTask_8051738_080528b0:
    .word BgTask_8051738

PTR_FUN_08052714_080528b4:
    .word FUN_08052714

PTR_NPCList_8054348_080528b8:
    .word NPCList_8054348

PTR_FUN_08084070_080528bc:
    .word 0x8084071

PTR_DAT_080528c0:
    .word 0x2000

PTR_FUN_0808598c_080528c4:
    .word 0x808598D

PTR_PTR_FUN_08052728_080528c8:
    .word PTR_FUN_08052728_08052724

PTR_FUN_08086e18_080528cc:
    .word 0x8086E19

PTR_BgTask_8051738_080528d0:
    .word BgTask_8051738

PTR_FUN_080857b8_080528d4:
    .word 0x80857B9

PTR_Script_ShowDialogue_080528d8:
    .word Script_ShowDialogue

DAT_080528dc:
    .word 0xA00

DAT_080528e0:
    .word 0xC00

DAT_080528e4:
    .word 0xE00

PTR_DAT_080528e8:
    .word 0x1305

PTR_Script_ShowDialogue_080528ec:
    .word Script_ShowDialogue

PTR_FUN_08082de4_080528f0:
    .word 0x8082DE5
