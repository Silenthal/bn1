#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


global_label NPCList_80490DC
    .word NPC_80490EC
    .word NPC_8049116
    .word NPC_804913A
    .word 0xFF

    .align 2, 0

NPC_80490EC:
    a_init_basic_npc_talk -282, 124, 0, SP_Overworld_Prog, frame=5, dialog=0x0
    a_stop

NPC_8049101:
    a_init_basic_npc_talk 56, 140, 0, SP_Overworld_Prog, frame=5, dialog=0x1
    a_stop

NPC_8049116:
    a_create_bmd -412, -96, 0, FLAG_ITEM_TRAFFIC_LIGHT_COMP_1_800Z, dialog=0x6
NPC_804913A:
    a_create_bmd -412, -168, 0, FLAG_ITEM_TRAFFIC_LIGHT_COMP_1_BUBBLER_K, dialog=0x7
    .align 2, 0

global_label NPCList_8049160
    .word NPC_80490EC
    .word NPC_8049116
    .word NPC_804913A
    .word 0xFF

global_label NPCList_8049170
    .word NPC_8049116
    .word NPC_804913A
    .word 0xFF

global_label NPCList_804917C
    .word NPC_8049188
    .word NPC_80491AC
    .word 0xFF

    .align 2, 0

NPC_8049188:
    a_create_bmd -294, 72, 0, FLAG_ITEM_TRAFFIC_LIGHT_COMP_2_800Z, dialog=0x5
    .align 2, 0

NPC_80491AC:
    a_create_bmd 148, -380, 64, FLAG_ITEM_TRAFFIC_LIGHT_COMP_2_ESCAPE_N, dialog=0x6
global_label NPCList_80491D0
    .word NPC_80491E0
    .word NPC_8049204
    .word NPC_8049228
    .word 0xFF

    .align 2, 0

NPC_80491E0:
    a_create_bmd -284, -244, 0, FLAG_ITEM_TRAFFIC_LIGHT_COMP_3_HEATER_O, dialog=0x5
    .align 2, 0

NPC_8049204:
    a_create_bmd -30, 388, -64, FLAG_ITEM_TRAFFIC_LIGHT_COMP_3_500Z, dialog=0x6
    .align 2, 0

NPC_8049228:
    a_create_bmd 420, -84, 0, FLAG_ITEM_TRAFFIC_LIGHT_COMP_3_FIRETOWR_T, dialog=0x7
global_label NPCList_804924C
    .word NPC_8049258
    .word NPC_804927C
    .word 0xFF

    .align 2, 0

NPC_8049258:
    a_create_bmd -22, -152, 0, FLAG_ITEM_TRAFFIC_LIGHT_COMP_4_1000Z, dialog=0x5
    .align 2, 0

NPC_804927C:
    a_create_bmd 230, 224, 8, FLAG_ITEM_TRAFFIC_LIGHT_COMP_4_HPMEMORY, dialog=0x6
global_label NPCList_80492A0
    .word NPC_80492A8
    .word 0xFF

    .align 2, 0

NPC_80492A8:
    a_init
    a_set_sprite_at 114, -22, 0, SP_Overworld_Roll, frame=13
L_80492B4:
    a_jump_if_flag 0xBC, L_80492C2
    a_wait 1
    a_jump L_80492B4
L_80492C2:
    a_set_sprite_frame 12
    a_stop

    .align 2, 0

global_label NPCList_80492CC
    .word NPC_80492D4
    .word 0xFF

    .align 2, 0

NPC_80492D4:
    a_init_basic_npc 114, -22, 0, SP_Overworld_Roll, frame=3
    a_stop

    .align 2, 0

global_label NPCList_80492E8
    .word NPC_80492F8
    .word NPC_804931C
    .word NPC_8049340
    .word 0xFF

    .align 2, 0

NPC_80492F8:
    a_create_bmd -350, -194, 0, FLAG_ITEM_TRAFFIC_LIGHT_COMP_5_AQUATOWR_C, dialog=0xF
    .align 2, 0

NPC_804931C:
    a_create_bmd -62, -336, 0, FLAG_ITEM_TRAFFIC_LIGHT_COMP_5_2400Z, dialog=0x10
    .align 2, 0

NPC_8049340:
    a_create_bmd 82, 370, 0, FLAG_ITEM_TRAFFIC_LIGHT_COMP_5_RECOV80_G, dialog=0x11
global_label EntityAllocParams_8049364
    entity Effect, EFI_TrafficSwitch, f(-158, 236, 0), 0xFFFFFF00
    entity Effect, EFI_TrafficSwitch, f(2, 140, 0), 0xFFFFFF01
    entity Effect, EFI_TrafficSwitch, f(68, 60, 64), 0xFFFFFF02
    entity Effect, EFI_TrafficSwitch, f(2, -4, 0), 0xFFFFFF03
    entity Effect, EFI_TrafficSwitch, f(-300, -308, 0), 0xFFFFFF04
    .word 0xFF

global_label EntityAllocParams_80493CC
    entity Effect, EFI_TrafficSwitch, f(-38, 164, 0), 0xFFFFFF00
    entity Effect, EFI_TrafficSwitch, f(188, 356, 0), 0xFFFFFF01
    entity Effect, EFI_TrafficSwitch, f(-230, 68, 0), 0xFFFFFF02
    entity Effect, EFI_TrafficSwitch, f(-244, -92, 0), 0xFFFFFF03
    entity Effect, EFI_TrafficSwitch, f(-292, -188, 64), 0xFFFFFF04
    entity Effect, EFI_TrafficSwitch, f(-100, -188, 64), 0xFFFFFF05
    entity Effect, EFI_TrafficSwitch, f(92, -220, 64), 0xFFFFFF06
    entity Effect, EFI_TrafficSwitch, f(220, -252, 64), 0xFFFFFF07
    .word 0xFF

global_label EntityAllocParams_8049470
    entity Effect, EFI_TrafficSwitch, f(-60, -116, 0), 0xFFFFFF00
    entity Effect, EFI_TrafficSwitch, f(-124, -116, 0), 0xFFFFFF01
    entity Effect, EFI_TrafficSwitch, f(-28, 284, -64), 0xFFFFFF02
    entity Effect, EFI_TrafficSwitch, f(130, 318, -64), 0xFFFFFF03
    entity Effect, EFI_TrafficSwitch, f(254, 156, -64), 0xFFFFFF04
    entity Effect, EFI_TrafficSwitch, f(228, 94, -64), 0xFFFFFF05
    entity Effect, EFI_TrafficSwitch, f(254, 60, -64), 0xFFFFFF06
    entity Effect, EFI_TrafficSwitch, f(420, -164, 0), 0xFFFFFF07
    .word 0xFF

global_label EntityAllocParams_8049514
    entity Effect, EFI_TrafficSwitch, f(-150, -220, 0), 0xFFFFFF00
    entity Effect, EFI_TrafficSwitch, f(42, -124, 0), 0xFFFFFF01
    entity Effect, EFI_TrafficSwitch, f(300, 4, 64), 0xFFFFFF02
    entity Effect, EFI_TrafficSwitch, f(236, 292, 0), 0xFFFFFF03
    entity Effect, EFI_TrafficSwitch, f(204, 100, 64), 0xFFFFFF04
    entity Effect, EFI_TrafficSwitch, f(-20, 236, 0), 0xFFFFFF05
    entity Effect, EFI_TrafficSwitch, f(-20, 174, 0), 0xFFFFFF06
    entity Effect, EFI_TrafficSwitch, f(-84, 330, 0), 0xFFFFFF07
    entity Effect, EFI_TrafficSwitch, f(-84, 178, 0), 0xFFFFFF08
    entity Effect, EFI_TrafficSwitch, f(-84, 0, 0), 0xFFFFFF09
    .word 0xFF

global_label EntityAllocParams_80495E0
    entity Effect, EFI_TrafficSwitch, f(-222, 188, 0), 0xFFFFFF00
    entity Effect, EFI_TrafficSwitch, f(-282, 188, 0), 0xFFFFFF01
    entity Effect, EFI_TrafficSwitch, f(-316, 26, 0), 0xFFFFFF02
    entity Effect, EFI_TrafficSwitch, f(-250, -6, 0), 0xFFFFFF03
    entity Effect, EFI_TrafficSwitch, f(-222, -162, 0), 0xFFFFFF04
    entity Effect, EFI_TrafficSwitch, f(-12, -144, 0), 0xFFFFFF05
    entity Effect, EFI_TrafficSwitch, f(-206, -306, 0), 0xFFFFFF06
    entity Effect, EFI_TrafficSwitch, f(-90, -386, 0), 0xFFFFFF07
    entity Effect, EFI_TrafficSwitch, f(4, -386, 0), 0xFFFFFF08
    entity Effect, EFI_TrafficSwitch, f(84, -386, 0), 0xFFFFFF09
    entity Effect, EFI_TrafficSwitch, f(148, -386, 0), 0xFFFFFF0A
    entity Effect, EFI_TrafficSwitch, f(320, -68, 0), 0xFFFFFF0B
    entity Effect, EFI_TrafficSwitch, f(386, -104, 0), 0xFFFFFF0C
    entity Effect, EFI_TrafficSwitch, f(386, -30, 0), 0xFFFFFF0D
    entity Effect, EFI_TrafficSwitch, f(424, -68, 0), 0xFFFFFF0E
    entity Effect, EFI_TrafficSwitch, f(386, -292, 0), 0xFFFFFF0F
    entity Effect, EFI_TrafficSwitch, f(356, 124, 0), 0xFFFFFF10
    entity Effect, EFI_TrafficSwitch, f(242, 204, 0), 0xFFFFFF11
    entity Effect, EFI_TrafficSwitch, f(82, 332, 0), 0xFFFFFF12
    entity Effect, EFI_TrafficSwitch, f(258, 444, 0), 0xFFFFFF13
    entity Effect, EFI_TrafficSwitch, f(-60, 444, 0), 0xFFFFFF14
    .word 0xFF


PTR_EntityAllocParams_8049364_08049788:
    .word EntityAllocParams_8049364
    .word EntityAllocParams_80493CC
    .word EntityAllocParams_8049470
    .word EntityAllocParams_8049514
    .word EntityAllocParams_80495E0

PTR_BYTE_ARRAY_ARRAY_0804979c:
    .word BYTE_ARRAY_ARRAY_080497b0
    .word BYTE_ARRAY_ARRAY_080497dc
    .word BYTE_ARRAY_ARRAY_0804981c
    .word BYTE_ARRAY_ARRAY_08049860
    .word BYTE_ARRAY_ARRAY_080498b0

BYTE_ARRAY_ARRAY_080497b0:
    .byte 0x51, 0xFF, 0xFF, 0xFF
    .byte 0x50, 0xFF, 0xFF, 0xFF
    .byte 0x53, 0xFF, 0xFF, 0xFF
    .byte 0x52, 0xFF, 0xFF, 0xFF
    .byte 0x55, 0xFF, 0xFF, 0xFF
    .byte 0x54, 0xFF, 0xFF, 0xFF
    .byte 0x57, 0xFF, 0xFF, 0xFF
    .byte 0x56, 0xFF, 0xFF, 0xFF
    .byte 0x59, 0x5A, 0xFF, 0xFF
    .byte 0x58, 0x5A, 0xFF, 0xFF
    .byte 0x58, 0x59, 0xFF, 0xFF

BYTE_ARRAY_ARRAY_080497dc:
    .byte 0x51, 0xFF, 0xFF, 0xFF
    .byte 0x50, 0xFF, 0xFF, 0xFF
    .byte 0x53, 0xFF, 0xFF, 0xFF
    .byte 0x52, 0xFF, 0xFF, 0xFF
    .byte 0x55, 0xFF, 0xFF, 0xFF
    .byte 0x54, 0xFF, 0xFF, 0xFF
    .byte 0x57, 0xFF, 0xFF, 0xFF
    .byte 0x56, 0xFF, 0xFF, 0xFF
    .byte 0x59, 0xFF, 0xFF, 0xFF
    .byte 0x58, 0xFF, 0xFF, 0xFF
    .byte 0x5B, 0xFF, 0xFF, 0xFF
    .byte 0x5A, 0xFF, 0xFF, 0xFF
    .byte 0x5D, 0xFF, 0xFF, 0xFF
    .byte 0x5C, 0xFF, 0xFF, 0xFF
    .byte 0x5F, 0xFF, 0xFF, 0xFF
    .byte 0x5E, 0xFF, 0xFF, 0xFF

BYTE_ARRAY_ARRAY_0804981c:
    .byte 0x51, 0xFF, 0xFF, 0xFF
    .byte 0x50, 0xFF, 0xFF, 0xFF
    .byte 0x53, 0xFF, 0xFF, 0xFF
    .byte 0x52, 0xFF, 0xFF, 0xFF
    .byte 0x55, 0x56, 0xFF, 0xFF
    .byte 0x54, 0x56, 0xFF, 0xFF
    .byte 0x54, 0x55, 0xFF, 0xFF
    .byte 0x58, 0xFF, 0xFF, 0xFF
    .byte 0x57, 0xFF, 0xFF, 0xFF
    .byte 0x5A, 0xFF, 0xFF, 0xFF
    .byte 0x59, 0xFF, 0xFF, 0xFF
    .byte 0x5C, 0xFF, 0xFF, 0xFF
    .byte 0x5B, 0xFF, 0xFF, 0xFF
    .byte 0x5E, 0xFF, 0xFF, 0xFF
    .byte 0x5D, 0xFF, 0xFF, 0xFF
    .byte 0x60, 0xFF, 0xFF, 0xFF
    .byte 0x5F, 0xFF, 0xFF, 0xFF

BYTE_ARRAY_ARRAY_08049860:
    .byte 0x51, 0xFF, 0xFF, 0xFF
    .byte 0x50, 0xFF, 0xFF, 0xFF
    .byte 0x53, 0xFF, 0xFF, 0xFF
    .byte 0x52, 0xFF, 0xFF, 0xFF
    .byte 0x55, 0xFF, 0xFF, 0xFF
    .byte 0x54, 0xFF, 0xFF, 0xFF
    .byte 0x57, 0xFF, 0xFF, 0xFF
    .byte 0x56, 0xFF, 0xFF, 0xFF
    .byte 0x59, 0xFF, 0xFF, 0xFF
    .byte 0x58, 0xFF, 0xFF, 0xFF
    .byte 0x5B, 0xFF, 0xFF, 0xFF
    .byte 0x5A, 0xFF, 0xFF, 0xFF
    .byte 0x5D, 0xFF, 0xFF, 0xFF
    .byte 0x5C, 0xFF, 0xFF, 0xFF
    .byte 0x5F, 0xFF, 0xFF, 0xFF
    .byte 0x5E, 0xFF, 0xFF, 0xFF
    .byte 0x61, 0xFF, 0xFF, 0xFF
    .byte 0x60, 0xFF, 0xFF, 0xFF
    .byte 0x63, 0xFF, 0xFF, 0xFF
    .byte 0x62, 0xFF, 0xFF, 0xFF

BYTE_ARRAY_ARRAY_080498b0:
    .byte 0x51, 0xFF, 0xFF, 0xFF
    .byte 0x50, 0xFF, 0xFF, 0xFF
    .byte 0x53, 0xFF, 0xFF, 0xFF
    .byte 0x52, 0xFF, 0xFF, 0xFF
    .byte 0x55, 0xFF, 0xFF, 0xFF
    .byte 0x54, 0xFF, 0xFF, 0xFF
    .byte 0x57, 0xFF, 0xFF, 0xFF
    .byte 0x56, 0xFF, 0xFF, 0xFF
    .byte 0x59, 0xFF, 0xFF, 0xFF
    .byte 0x58, 0xFF, 0xFF, 0xFF
    .byte 0x5B, 0xFF, 0xFF, 0xFF
    .byte 0x5A, 0xFF, 0xFF, 0xFF
    .byte 0x5D, 0xFF, 0xFF, 0xFF
    .byte 0x5C, 0xFF, 0xFF, 0xFF
    .byte 0x5F, 0xFF, 0xFF, 0xFF
    .byte 0x5E, 0xFF, 0xFF, 0xFF
    .byte 0x61, 0xFF, 0xFF, 0xFF
    .byte 0x60, 0xFF, 0xFF, 0xFF
    .byte 0x63, 0xFF, 0xFF, 0xFF
    .byte 0x62, 0xFF, 0xFF, 0xFF
    .byte 0x65, 0xFF, 0xFF, 0xFF
    .byte 0x64, 0xFF, 0xFF, 0xFF
    .byte 0x67, 0xFF, 0xFF, 0xFF
    .byte 0x66, 0xFF, 0xFF, 0xFF
    .byte 0x69, 0xFF, 0xFF, 0xFF
    .byte 0x68, 0xFF, 0xFF, 0xFF
    .byte 0x6B, 0xFF, 0xFF, 0xFF
    .byte 0x6A, 0xFF, 0xFF, 0xFF
    .byte 0x6D, 0xFF, 0xFF, 0xFF
    .byte 0x6C, 0xFF, 0xFF, 0xFF
    .byte 0x6F, 0xFF, 0xFF, 0xFF
    .byte 0x6E, 0xFF, 0xFF, 0xFF
    .byte 0x71, 0xFF, 0xFF, 0xFF
    .byte 0x70, 0xFF, 0xFF, 0xFF
    .byte 0x73, 0xFF, 0xFF, 0xFF
    .byte 0x72, 0xFF, 0xFF, 0xFF
    .byte 0x75, 0xFF, 0xFF, 0xFF
    .byte 0x74, 0xFF, 0xFF, 0xFF
    .byte 0x77, 0xFF, 0xFF, 0xFF
    .byte 0x76, 0xFF, 0xFF, 0xFF
    .byte 0x79, 0xFF, 0xFF, 0xFF
    .byte 0x78, 0xFF, 0xFF, 0xFF

_ts FUN_08049958
    mov        r0,#0x0
    b          FUN_0804995e


_ts FUN_0804995c
    mov        r0,#0x1


_nt FUN_0804995e
    mov        r8,r0
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strb       r0,[r5,#0x8]
    push       {r5}
    LoadMain world, r1, r1
    ldrb       r1,[r1,#0x5]
    lsl        r1,r1,#0x2
    ldr        r0,PTR_PTR_EntityAllocParams_8049364_08049b08
    ldr        r0,[r0,r1]
    bl         Entity_AllocList
    pop        {r5}
    LoadMain world, r7, r7
    ldrb       r1,[r7,#World_currentArea]
    ldrb       r2,[r7,#World_lastArea]
    cmp        r1,r2
    beq        LAB_080499a0
    ldr        r7,[r7,#0x78]
    mov        r0,#0x0
    strb       r0,[r7,#0x4]
    mov        r0,r8
    tst        r0,r0
    bne        LAB_080499a0
    push       {r5}
    Flag_ClearBase 0x30
    pop        {r5}
LAB_080499a0:
    bl         FUN_08049ab0
    pop        {pc}

    .align 2, 0


_ts FUN_080499a8
    push       {lr}
    ldr        r0,PTR_PTR_FUN_080499bc_08049b0c
    ldrb       r1,[r5,#0x8]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_FUN_080499bc_080499b8:
    .word FUN_080499bc


_ts FUN_080499bc
    push       {lr}
    push       {r5}
    LoadMain world, r7, r7
    ldr        r0,[r7,#World_playerLocation]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x80
    beq        LAB_08049a44
    cmp        r0,#0x50
    blt        LAB_08049a3c
    cmp        r0,#0x7f
    bgt        LAB_08049a3c
    LoadMain world, r7, r7
    ldrb       r1,[r7,#0x5]
    lsl        r1,r1,#0x2
    LoadMain gameStats, r7, r7
    ldrb       r6,[r7,#World_currentArea]
    strb       r0,[r7,#World_currentArea]
    mov        r8,r0
    ldr        r7,PTR_PTR_BYTE_ARRAY_ARRAY_08049b10
    ldr        r7,[r7,r1]
    sub        r0,#0x50
    lsl        r0,r0,#0x2
    add        r7,r7,r0
    mov        r2,#0x0
LAB_080499f8:
    ldrb       r3,[r7,r2]
    cmp        r3,r6
    bne        LAB_08049a00
    b          LAB_08049a08
LAB_08049a00:
    add        r2,#0x1
    cmp        r2,#0x4
    blt        LAB_080499f8
    b          LAB_08049a44
LAB_08049a08:
    LoadMain world, r7, r7
    ldrb       r1,[r7,#0x5]
    lsl        r1,r1,#0x2
    mov        r7,r8
    ldr        r0,PTR_PTR_FUN_08049aac_08049b14
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    Flag_ToggleBase 0x30
    Flag_ToggleIgnore F_IGNORE_WALL_00
    Flag_ToggleIgnore F_IGNORE_WALL_01
    mov        r0,#0xba
    bl         Sound_PlaySE
    pop        {r5}
    bl         FUN_08049ab0
    b          LAB_08049a44
LAB_08049a3c:
    LoadMain gameStats, r7, r7
    mov        r0,#0x0
    strb       r0,[r7,#World_currentArea]
LAB_08049a44:
    pop        {pc}

    .align 2, 0

PTR_FUN_08049aac_08049a48:
    .word FUN_08049aac
    .word FUN_08049a5c
    .word FUN_08049a84
    .word FUN_08049aac
    .word FUN_08049aac


_ts FUN_08049a5c
    push       {r5,lr}
    LoadMain world, r0, r0
    ldrb       r0,[r0,#World_storyFlag]
    lsr        r0,r0,#0x4
    cmp        r0,#0x3
    bne        LAB_08049a80
    cmp        r6,#0x5e
    bne        LAB_08049a80
    cmp        r7,#0x5f
    bne        LAB_08049a80
    Flag_GetBase 0x30
    bne        LAB_08049a80
    Flag_SetBase 0xC4
LAB_08049a80:
    pop        {r5,pc}

    .align 2, 0


_ts FUN_08049a84
    push       {r5,lr}
    LoadMain world, r0, r0
    ldrb       r0,[r0,#World_storyFlag]
    lsr        r0,r0,#0x4
    cmp        r0,#0x3
    bne        LAB_08049aa8
    cmp        r6,#0x5e
    bne        LAB_08049a80
    cmp        r7,#0x5d
    bne        LAB_08049a80
    Flag_GetBase 0x30
    bne        LAB_08049aa8
    Flag_SetBase 0xC5
LAB_08049aa8:
    pop        {r5,pc}

    .align 2, 0


_ts FUN_08049aac
    mov        pc,lr

    .align 2, 0


_ts FUN_08049ab0
    push       {r5,lr}
    Flag_GetBase 0x30
    bne        LAB_08049ae0
    ldr        r0,PTR_BgTask_80473FC_08049b18
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8047414_08049b1c
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_804742C_08049b20
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8047444_08049b24
    bl         BgTask_AddNew
    Flag_SetIgnore F_IGNORE_WALL_00
    Flag_ClearIgnore F_IGNORE_WALL_01
    b          LAB_08049b04
LAB_08049ae0:
    ldr        r0,PTR_BgTask_80473B4_08049b28
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_80473CC_08049b2c
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_80473E4_08049b30
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8047474_08049b34
    bl         BgTask_AddNew
    Flag_ClearIgnore F_IGNORE_WALL_00
    Flag_SetIgnore F_IGNORE_WALL_01
LAB_08049b04:
    pop        {r5,pc}

    .align 2, 0

PTR_PTR_EntityAllocParams_8049364_08049b08:
    .word PTR_EntityAllocParams_8049364_08049788

PTR_PTR_FUN_080499bc_08049b0c:
    .word PTR_FUN_080499bc_080499b8

PTR_PTR_BYTE_ARRAY_ARRAY_08049b10:
    .word PTR_BYTE_ARRAY_ARRAY_0804979c

PTR_PTR_FUN_08049aac_08049b14:
    .word PTR_FUN_08049aac_08049a48

PTR_BgTask_80473FC_08049b18:
    .word BgTask_80473FC

PTR_BgTask_8047414_08049b1c:
    .word BgTask_8047414

PTR_BgTask_804742C_08049b20:
    .word BgTask_804742C

PTR_BgTask_8047444_08049b24:
    .word BgTask_8047444

PTR_BgTask_80473B4_08049b28:
    .word BgTask_80473B4

PTR_BgTask_80473CC_08049b2c:
    .word BgTask_80473CC

PTR_BgTask_80473E4_08049b30:
    .word BgTask_80473E4

PTR_BgTask_8047474_08049b34:
    .word BgTask_8047474
