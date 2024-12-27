#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_Internet_1_S0
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,PTR_MapSetup_Internet_1_0805221c
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_BgTask_80515C8_08052220
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051618_08052224
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051668_08052228
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_80516B8_0805222c
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_80516F8_08052230
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051780_08052234
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8051820_08052238
    bl         BgTask_AddNew
    mov        r0,#0x25
    bl         Flag_GetBase
    beq        LAB_08051f2e
    ldr        r0,PTR_BgTask_8051738_0805223c
    bl         BgTask_AddNew
LAB_08051f2e:
    pop        {r5}
    pop        {pc}


_nt EventHandler_Internet_1_S0
    push       {lr}
    ldr        r0,PTR_EventHandler_Internet_1_08052240
    mov        lr,pc
    bx         r0
    pop        {pc}


_ts MapSetup_Internet_1
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
    mov        r0,#0x25
    bl         Flag_GetBase
    beq        LAB_08051f68
    push       {r5}
    mov        r0,#0x1
    bl         Flag_Set380
    pop        {r5}
    b          LAB_08051f72
LAB_08051f68:
    push       {r5}
    mov        r1,#0x87
    bl         Effect_WWWGate_Create
    pop        {r5}
LAB_08051f72:
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_08051f8c
    push       {r5}
    ldr        r0,PTR_Scene_MegaManJackIn_08052244
    ldr        r1,PTR_DAT_08052248
    bl         Scene_Prepare
    pop        {r5}
    b          LAB_08051f98
LAB_08051f8c:
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    beq        LAB_08051fd0
LAB_08051f98:
    ldr        r6,PTR_DAT_0805224c
    ldr        r3,PTR_PTR_08052250
    mov        r4,#0x4
    lsl        r4,r4,#0x2
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrb       r7,[r7,#0x6]
    cmp        r7,#0x2
    bne        LAB_08051fba
    ldr        r0,[r3,#0x28]
    ldr        r0,[r0,#0x0]
    str        r0,[r6,r4]
    add        r4,#0x4
    ldr        r0,[r3,#0x2c]
    ldr        r0,[r0,#0x0]
    str        r0,[r6,r4]
    add        r4,#0x4
LAB_08051fba:
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrb       r7,[r7,#0x6]
    cmp        r7,#0x20
    blt        LAB_08051fcc
    ldr        r0,[r3,#0x30]
    ldr        r0,[r0,#0x0]
    str        r0,[r6,r4]
    add        r4,#0x4
LAB_08051fcc:
    mov        r1,#0xff
    str        r1,[r6,r4]
LAB_08051fd0:
    ldr        r7,PTR_DAT_08052254
    push       {r5}
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x6
    bl         Flag_GetBase
    bne        LAB_08051fe8
    mov        r0,#0x1
    bl         Flag_Set410
LAB_08051fe8:
    mov        r0,#0x7
    bl         Flag_GetBase
    bne        LAB_08051ff6
    mov        r0,#0x2
    bl         Flag_Set410
LAB_08051ff6:
    mov        r0,#0x8
    bl         Flag_GetBase
    bne        LAB_08052004
    mov        r0,#0x3
    bl         Flag_Set410
LAB_08052004:
    mov        r0,#0xa
    bl         Flag_GetBase
    bne        LAB_08052012
    mov        r0,#0x5
    bl         Flag_Set410
LAB_08052012:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}

PTR_PTR_NPC_8053E1C_08052018:
    .word PTR_NPC_8053E1C_08053de4
    .word PTR_NPC_8053E42_08053de8
    .word PTR_NPC_8053E68_08053dec
    .word PTR_NPC_8053E8E_08053df0
    .word PTR_NPC_8053EB4_08053df4
    .word PTR_NPC_8053EDA_08053df8
    .word PTR_NPC_8053F00_08053dfc
    .word PTR_NPC_8053F26_08053e00

PTR_PTR_NPC_8053F72_08052038:
    .word PTR_NPC_8053F72_08053e04

PTR_PTR_NPC_8053F4C_0805203c:
    .word PTR_NPC_8053F4C_08053e08

PTR_PTR_NPC_8053F89_08052040:
    .word PTR_NPC_8053F89_08053e0c

PTR_PTR_NPC_8053FA8_08052044:
    .word PTR_NPC_8053FA8_08053e10

PTR_NPCList_8053E14_08052048:
    .word NPCList_8053E14

DAT_0805204c:
    .byte 0x00
    .byte 0x02
    .byte 0x04
    .byte 0x07

DAT_08052050:
    .byte 0x01
    .byte 0x03
    .byte 0x05
    .byte 0x06


_ts EventHandler_Internet_1
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_Internet_1_0_08052258
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_Internet_1_0_08052064:
    .word EventHandler_Internet_1_0


_ts EventHandler_Internet_1_0
    push       {lr}
    ldrb       r0,[r5,#0x1]
    tst        r0,r0
    beq        LAB_0805207e
    mov        r0,#0x0
    strb       r0,[r5,#0x1]
    push       {r5}
    ldr        r0,PTR_BgTask_8051738_0805225c
    bl         BgTask_AddNew
    pop        {r5}
LAB_0805207e:
    mov        r0,#0x25
    bl         Flag_GetBase
    bne        LAB_080520a0
    mov        r0,#0x26
    bl         Flag_GetBase
    beq        LAB_080520a0
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
    push       {r5}
    ldr        r0,PTR_Scene_UnlockWWWGate_08052260
    mov        r1,#0x6
    bl         Scene_Prepare
    pop        {r5}
    pop        {pc}
LAB_080520a0:
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrb       r1,[r7,#0x6]
    mov        r2,#0xf0
    and        r1,r2
    tst        r1,r1
    beq        LAB_080520e4
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x10
    bne        LAB_080520e4
    mov        r0,#0x5c
    bl         Flag_GetBase
    bne        LAB_080520e4
    mov        r0,#0x5c
    bl         Flag_SetBase
    push       {r5}
    ldr        r0,PTR_Scene_StartFixedBattle_08052264
    mov        r1,#0x5
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}
LAB_080520e4:
    mov        r0,#0x25
    bl         Flag_GetBase
    bne        LAB_080520fa
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0xe]
    cmp        r0,#0x21
    bne        LAB_080520fa
    mov        r1,#0x23
    b          LAB_080521a8
LAB_080520fa:
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_08052136
    mov        r0,#0x1
    bl         Flag_Get410
    beq        LAB_080521c4
    mov        r0,#0x21
    bl         KeyItem_IsPresent
    bne        LAB_08052132
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldr        r7,[r7,#0x28]
    ldr        r0,[r7,#0x10]
    add        r0,#0x4
    mov        r2,#0x7
    and        r0,r2
    ldr        r1,DAT_08052268
    orr        r1,r0
    b          LAB_080521ba
LAB_08052132:
    mov        r1,#0xa
    b          LAB_080521a8
LAB_08052136:
    cmp        r0,#0x3
    bne        LAB_08052162
    mov        r0,#0x2
    bl         Flag_Get410
    beq        LAB_080521c4
    mov        r0,#0x22
    bl         KeyItem_IsPresent
    bne        LAB_0805215e
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldr        r7,[r7,#0x28]
    ldr        r0,[r7,#0x10]
    add        r0,#0x4
    mov        r2,#0x7
    and        r0,r2
    ldr        r1,DAT_0805226c
    orr        r1,r0
    b          LAB_080521ba
LAB_0805215e:
    mov        r1,#0xc
    b          LAB_080521a8
LAB_08052162:
    cmp        r0,#0x4
    bne        LAB_0805218e
    mov        r0,#0x3
    bl         Flag_Get410
    beq        LAB_080521c4
    mov        r0,#0x23
    bl         KeyItem_IsPresent
    bne        LAB_0805218a
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldr        r7,[r7,#0x28]
    ldr        r0,[r7,#0x10]
    add        r0,#0x4
    mov        r2,#0x7
    and        r0,r2
    ldr        r1,DAT_08052270
    orr        r1,r0
    b          LAB_080521ba
LAB_0805218a:
    mov        r1,#0xe
    b          LAB_080521a8
LAB_0805218e:
    cmp        r0,#0x6
    bne        LAB_080521c4
    mov        r0,#0x5
    bl         Flag_Get410
    beq        LAB_080521c4
    mov        r0,#0x30
    bl         KeyItem_IsPresent
    bne        LAB_080521a6
    ldr        r1,PTR_DAT_08052274
    b          LAB_080521ba
LAB_080521a6:
    mov        r1,#0x12
LAB_080521a8:
    push       {r5}
    ldr        r0,PTR_Scene_Dialogue_08052278
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}
LAB_080521ba:
    push       {r5}
    ldr        r0,DAT_0805227c
    bl         Scene_Prepare
    pop        {r5}
LAB_080521c4:
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}


_ts EventHandler_Internet_1_SetupRandomGMD
    push       {lr}
    ldr        r6,PTR_DAT_08052280
    ldr        r3,PTR_PTR_08052284
    mov        r4,#0x0
    push       {r3}
    bl         Rng_RandomUint
    pop        {r3}
    lsr        r0,r0,#0x4
    add        r2,r0,#0x0
    mov        r1,#0x3
    and        r0,r1
    ldr        r1,PTR_DAT_08052288
    ldrb       r1,[r1,r0]
    lsl        r0,r1,#0x2
    ldr        r0,[r3,r0]
    ldr        r0,[r0,#0x0]
    str        r0,[r6,r4]
    add        r4,#0x4
    add        r0,r2,#0x0
    lsr        r0,r0,#0x4
    add        r2,r0,#0x0
    mov        r1,#0x3
    and        r0,r1
    ldr        r1,PTR_DAT_0805228c
    ldrb       r1,[r1,r0]
    lsl        r0,r1,#0x2
    ldr        r0,[r3,r0]
    ldr        r0,[r0,#0x0]
    str        r0,[r6,r4]
    add        r4,#0x4
    ldr        r0,[r3,#0x20]
    ldr        r0,[r0,#0x0]
    str        r0,[r6,r4]
    add        r4,#0x4
    ldr        r0,[r3,#0x24]
    ldr        r0,[r0,#0x0]
    str        r0,[r6,r4]
    add        r4,#0x4
    pop        {pc}

PTR_MapSetup_Internet_1_0805221c:
    .word MapSetup_Internet_1

PTR_BgTask_80515C8_08052220:
    .word BgTask_80515C8

PTR_BgTask_8051618_08052224:
    .word BgTask_8051618

PTR_BgTask_8051668_08052228:
    .word BgTask_8051668

PTR_BgTask_80516B8_0805222c:
    .word BgTask_80516B8

PTR_BgTask_80516F8_08052230:
    .word BgTask_80516F8

PTR_BgTask_8051780_08052234:
    .word BgTask_8051780

PTR_BgTask_8051820_08052238:
    .word BgTask_8051820

PTR_BgTask_8051738_0805223c:
    .word BgTask_8051738

PTR_EventHandler_Internet_1_08052240:
    .word EventHandler_Internet_1

PTR_Scene_MegaManJackIn_08052244:
    .word Scene_MegaManJackIn

PTR_DAT_08052248:
    .word 0x2000

PTR_DAT_0805224c:
    .word 0x2000290

PTR_PTR_08052250:
    .word PTR_PTR_NPC_8053E1C_08052018

PTR_DAT_08052254:
    .word 0x2000290

PTR_PTR_EventHandler_Internet_1_0_08052258:
    .word PTR_EventHandler_Internet_1_0_08052064

PTR_BgTask_8051738_0805225c:
    .word BgTask_8051738

PTR_Scene_UnlockWWWGate_08052260:
    .word Scene_UnlockWWWGate

PTR_Scene_StartFixedBattle_08052264:
    .word Scene_StartFixedBattle

DAT_08052268:
    .word 0xA00

DAT_0805226c:
    .word 0xC00

DAT_08052270:
    .word 0xE00

PTR_DAT_08052274:
    .word 0x1205

PTR_Scene_Dialogue_08052278:
    .word Scene_Dialogue

DAT_0805227c:
    .word Scene_LockedPath

PTR_DAT_08052280:
    .word 0x2000290

PTR_PTR_08052284:
    .word PTR_PTR_NPC_8053E1C_08052018

PTR_DAT_08052288:
    .word DAT_0805204c

PTR_DAT_0805228c:
    .word DAT_08052050
