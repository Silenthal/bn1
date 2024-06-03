#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_Internet_4_S0
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,DAT_08052ad0
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_80515C8_08052ad4
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051618_08052ad8
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051668_08052adc
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_80516B8_08052ae0
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_80516F8_08052ae4
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051780_08052ae8
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051820_08052aec
    bl         BgTask_AddNew
    mov        r0,#0x58
    bl         Flag_GetBase
    beq        LAB_0805293e
    ldr        r0,PTR_BgTask_8051738_08052af0
    bl         BgTask_AddNew
LAB_0805293e:
    pop        {r5}
    pop        {pc}


_nt EventHandler_Internet_4_S0
    push       {lr}
    ldr        r0,DAT_08052af4
    mov        lr,pc
    bx         r0
    pop        {pc}


_ts FUN_0805294c
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
    ldr        r7,PTR_NPCList_8054464_08052af8
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_08052986
    push       {r5}
    ldr        r0,PTR_FUN_08084070_08052afc
    ldr        r1,PTR_DAT_08052b00
    bl         Scene_Prepare
    pop        {r5}
LAB_08052986:
    mov        r0,#0x4b
    bl         Flag_GetBase
    bne        LAB_08052994
    mov        r0,#0x2
    bl         Flag_Set410
LAB_08052994:
    mov        r0,#0x5a
    bl         Flag_GetBase
    bne        LAB_080529a2
    mov        r0,#0x1
    bl         Flag_Set410
LAB_080529a2:
    mov        r0,#0x2f
    bl         Flag_Get420
    beq        LAB_080529c4
    mov        r0,#0x2f
    bl         Flag_Clear420
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    mov        r1,#0x0
    strb       r1,[r0,#0x7]
    push       {r5}
    ldr        r0,PTR_FUN_08087e34_08052b04
    mov        r1,#0x1a
    bl         Scene_Prepare
    pop        {r5}
LAB_080529c4:
    mov        r0,#0x58
    bl         Flag_GetBase
    beq        LAB_080529d8
    push       {r5}
    mov        r0,#0x0
    bl         Flag_Set380
    pop        {r5}
    b          LAB_080529e2
LAB_080529d8:
    push       {r5}
    mov        r1,#0x8b
    bl         Effect_WWWDoor_Create
    pop        {r5}
LAB_080529e2:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts FUN_080529e8
    push       {lr}
    ldr        r0,PTR_PTR_FUN_080529fc_08052b08
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_FUN_080529fc_080529f8:
    .word FUN_080529fc


_ts FUN_080529fc
    push       {lr}
    ldrb       r0,[r5,#0x1]
    tst        r0,r0
    beq        LAB_08052a12
    mov        r0,#0x0
    strb       r0,[r5,#0x1]
    push       {r5}
    ldr        r0,PTR_BgTask_8051738_08052b0c
    bl         BgTask_AddNew
    pop        {r5}
LAB_08052a12:
    mov        r0,#0x58
    bl         Flag_GetBase
    bne        LAB_08052a4a
    mov        r0,#0x59
    bl         Flag_GetBase
    beq        LAB_08052a34
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
    push       {r5}
    ldr        r0,DAT_08052b10
    mov        r1,#0xa
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_08052a34:
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x20
    bne        LAB_08052a4a
    push       {r5}
    ldr        r0,DAT_08052b14
    mov        r1,#0x1f
    bl         Scene_Prepare
    pop        {r5}
LAB_08052a4a:
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x3
    bne        LAB_08052a86
    mov        r0,#0x2
    bl         Flag_Get410
    beq        LAB_08052ac8
    mov        r0,#0x28
    bl         KeyItem_IsPresent
    bne        LAB_08052a82
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldr        r7,[r7,#0x28]
    ldr        r0,[r7,#0x10]
    add        r0,#0x4
    mov        r2,#0x7
    and        r0,r2
    ldr        r1,DAT_08052b18
    orr        r1,r0
    b          LAB_08052abe
LAB_08052a82:
    mov        r1,#0xa
    b          LAB_08052aac
LAB_08052a86:
    cmp        r0,#0x2
    bne        LAB_08052ac8
    mov        r0,#0x1
    bl         Flag_Get410
    beq        LAB_08052ac8
    mov        r0,#0x34
    bl         KeyItem_IsPresent
    bne        LAB_08052a9e
    ldr        r1,DAT_08052b1c
    b          LAB_08052abe
LAB_08052a9e:
    mov        r1,#0xc
    push       {r5}
    ldr        r0,PTR_FUN_08097db0_08052b20
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_08052aac:
    push       {r5}
    ldr        r0,DAT_08052b24
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}
LAB_08052abe:
    push       {r5}
    ldr        r0,DAT_08052b28
    bl         Scene_Prepare
    pop        {r5}
LAB_08052ac8:
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}

DAT_08052ad0:
    .word FUN_0805294c

PTR_BgTask_80515C8_08052ad4:
    .word BgTask_80515C8

PTR_BgTask_8051618_08052ad8:
    .word BgTask_8051618

PTR_BgTask_8051668_08052adc:
    .word BgTask_8051668

PTR_BgTask_80516B8_08052ae0:
    .word BgTask_80516B8

PTR_BgTask_80516F8_08052ae4:
    .word BgTask_80516F8

PTR_BgTask_8051780_08052ae8:
    .word BgTask_8051780

PTR_BgTask_8051820_08052aec:
    .word BgTask_8051820

PTR_BgTask_8051738_08052af0:
    .word BgTask_8051738

DAT_08052af4:
    .word FUN_080529e8

PTR_NPCList_8054464_08052af8:
    .word NPCList_8054464

PTR_FUN_08084070_08052afc:
    .word 0x8084071

PTR_DAT_08052b00:
    .word 0x2000

PTR_FUN_08087e34_08052b04:
    .word 0x8087E35

PTR_PTR_FUN_080529fc_08052b08:
    .word PTR_FUN_080529fc_080529f8

PTR_BgTask_8051738_08052b0c:
    .word BgTask_8051738

DAT_08052b10:
    .word 0x8086E19

DAT_08052b14:
    .word 0x80848FD

DAT_08052b18:
    .word 0xA00

DAT_08052b1c:
    .word 0xC03

PTR_FUN_08097db0_08052b20:
    .word 0x8097DB1

DAT_08052b24:
    .word 0x80848FD

DAT_08052b28:
    .word 0x8082DE5
