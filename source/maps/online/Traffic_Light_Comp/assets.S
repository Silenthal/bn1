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
    a_init
    a_set_dialog 0x0
    a_set_sprite SP_Overworld_Prog
    a_set_pos -282, 124
    a_set_sprite_frame 5
L_80490FA:
    a_wait 1
    a_jump L_80490FA

NPC_8049101:
    a_init
    a_set_dialog 0x1
    a_set_sprite SP_Overworld_Prog
    a_set_pos 56, 140
    a_set_sprite_frame 5
L_804910F:
    a_wait 1
    a_jump L_804910F

NPC_8049116:
    a_jump_if_flag FLAG_ITEM_TRAFFIC_LIGHT_COMP_1_800Z, L_8049139
    a_init
    a_disable_turn
    a_set_dialog 0x6
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x0
    a_set_pos -412, -96
    a_set_radius 4
    a_set_sprite_frame 0
L_8049130:
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_TRAFFIC_LIGHT_COMP_1_800Z, L_8049130
L_8049139:
    a_destroy

NPC_804913A:
    a_jump_if_flag FLAG_ITEM_TRAFFIC_LIGHT_COMP_1_BUBBLER_K, L_804915D
    a_init
    a_disable_turn
    a_set_dialog 0x7
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x0
    a_set_pos -412, -168
    a_set_radius 4
    a_set_sprite_frame 0
L_8049154:
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_TRAFFIC_LIGHT_COMP_1_BUBBLER_K, L_8049154
L_804915D:
    a_destroy

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
    a_jump_if_flag FLAG_ITEM_TRAFFIC_LIGHT_COMP_2_800Z, L_80491AB
    a_init
    a_disable_turn
    a_set_dialog 0x5
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x0
    a_set_pos -294, 72
    a_set_radius 4
    a_set_sprite_frame 0
L_80491A2:
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_TRAFFIC_LIGHT_COMP_2_800Z, L_80491A2
L_80491AB:
    a_destroy

    .align 2, 0

NPC_80491AC:
    a_jump_if_flag FLAG_ITEM_TRAFFIC_LIGHT_COMP_2_ESCAPE_N, L_80491CF
    a_init
    a_disable_turn
    a_set_dialog 0x6
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x0
    a_set_pos 148, -380, 64
    a_set_radius 4
    a_set_sprite_frame 0
L_80491C6:
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_TRAFFIC_LIGHT_COMP_2_ESCAPE_N, L_80491C6
L_80491CF:
    a_destroy

global_label NPCList_80491D0
    .word NPC_80491E0
    .word NPC_8049204
    .word NPC_8049228
    .word 0xFF

    .align 2, 0

NPC_80491E0:
    a_jump_if_flag FLAG_ITEM_TRAFFIC_LIGHT_COMP_3_HEATER_O, L_8049203
    a_init
    a_disable_turn
    a_set_dialog 0x5
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x0
    a_set_pos -284, -244
    a_set_radius 4
    a_set_sprite_frame 0
L_80491FA:
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_TRAFFIC_LIGHT_COMP_3_HEATER_O, L_80491FA
L_8049203:
    a_destroy

    .align 2, 0

NPC_8049204:
    a_jump_if_flag FLAG_ITEM_TRAFFIC_LIGHT_COMP_3_500Z, L_8049227
    a_init
    a_disable_turn
    a_set_dialog 0x6
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x0
    a_set_pos -30, 388, -64
    a_set_radius 4
    a_set_sprite_frame 0
L_804921E:
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_TRAFFIC_LIGHT_COMP_3_500Z, L_804921E
L_8049227:
    a_destroy

    .align 2, 0

NPC_8049228:
    a_jump_if_flag FLAG_ITEM_TRAFFIC_LIGHT_COMP_3_FIRETOWR_T, L_804924B
    a_init
    a_disable_turn
    a_set_dialog 0x7
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x0
    a_set_pos 420, -84
    a_set_radius 4
    a_set_sprite_frame 0
L_8049242:
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_TRAFFIC_LIGHT_COMP_3_FIRETOWR_T, L_8049242
L_804924B:
    a_destroy

global_label NPCList_804924C
    .word NPC_8049258
    .word NPC_804927C
    .word 0xFF

    .align 2, 0

NPC_8049258:
    a_jump_if_flag FLAG_ITEM_TRAFFIC_LIGHT_COMP_4_1000Z, L_804927B
    a_init
    a_disable_turn
    a_set_dialog 0x5
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x0
    a_set_pos -22, -152
    a_set_radius 4
    a_set_sprite_frame 0
L_8049272:
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_TRAFFIC_LIGHT_COMP_4_1000Z, L_8049272
L_804927B:
    a_destroy

    .align 2, 0

NPC_804927C:
    a_jump_if_flag FLAG_ITEM_TRAFFIC_LIGHT_COMP_4_HPMEMORY, L_804929F
    a_init
    a_disable_turn
    a_set_dialog 0x6
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x0
    a_set_pos 230, 224, 8
    a_set_radius 4
    a_set_sprite_frame 0
L_8049296:
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_TRAFFIC_LIGHT_COMP_4_HPMEMORY, L_8049296
L_804929F:
    a_destroy

global_label NPCList_80492A0
    .word NPC_80492A8
    .word 0xFF

    .align 2, 0

NPC_80492A8:
    a_init
    a_set_sprite SP_Overworld_Roll
    a_set_pos 114, -22
    a_set_sprite_frame 13
L_80492B4:
    a_jump_if_flag 0xBC, L_80492C2
    a_wait 1
    a_jump L_80492B4
L_80492C2:
    a_set_sprite_frame 12
L_80492C4:
    a_wait 1
    a_jump L_80492C4

    .align 2, 0

global_label NPCList_80492CC
    .word NPC_80492D4
    .word 0xFF

    .align 2, 0

NPC_80492D4:
    a_init
    a_set_sprite SP_Overworld_Roll
    a_set_pos 114, -22
    a_set_sprite_frame 3
L_80492E0:
    a_wait 1
    a_jump L_80492E0

    .align 2, 0

global_label NPCList_80492E8
    .word NPC_80492F8
    .word NPC_804931C
    .word NPC_8049340
    .word 0xFF

    .align 2, 0

NPC_80492F8:
    a_jump_if_flag FLAG_ITEM_TRAFFIC_LIGHT_COMP_5_AQUATOWR_C, L_804931B
    a_init
    a_disable_turn
    a_set_dialog 0xF
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x0
    a_set_pos -350, -194
    a_set_radius 4
    a_set_sprite_frame 0
L_8049312:
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_TRAFFIC_LIGHT_COMP_5_AQUATOWR_C, L_8049312
L_804931B:
    a_destroy

    .align 2, 0

NPC_804931C:
    a_jump_if_flag FLAG_ITEM_TRAFFIC_LIGHT_COMP_5_2400Z, L_804933F
    a_init
    a_disable_turn
    a_set_dialog 0x10
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x0
    a_set_pos -62, -336
    a_set_radius 4
    a_set_sprite_frame 0
L_8049336:
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_TRAFFIC_LIGHT_COMP_5_2400Z, L_8049336
L_804933F:
    a_destroy

    .align 2, 0

NPC_8049340:
    a_jump_if_flag FLAG_ITEM_TRAFFIC_LIGHT_COMP_5_RECOV80_G, L_8049363
    a_init
    a_disable_turn
    a_set_dialog 0x11
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x0
    a_set_pos 82, 370
    a_set_radius 4
    a_set_sprite_frame 0
L_804935A:
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_TRAFFIC_LIGHT_COMP_5_RECOV80_G, L_804935A
L_8049363:
    a_destroy

global_label EntityAllocParams_8049364
    entity Effect, 0x2D, f(-158, 236, 0), 0xFFFFFF00
    entity Effect, 0x2D, f(2, 140, 0), 0xFFFFFF01
    entity Effect, 0x2D, f(68, 60, 64), 0xFFFFFF02
    entity Effect, 0x2D, f(2, -4, 0), 0xFFFFFF03
    entity Effect, 0x2D, f(-300, -308, 0), 0xFFFFFF04
    .word 0xFF

global_label EntityAllocParams_80493CC
    entity Effect, 0x2D, f(-38, 164, 0), 0xFFFFFF00
    entity Effect, 0x2D, f(188, 356, 0), 0xFFFFFF01
    entity Effect, 0x2D, f(-230, 68, 0), 0xFFFFFF02
    entity Effect, 0x2D, f(-244, -92, 0), 0xFFFFFF03
    entity Effect, 0x2D, f(-292, -188, 64), 0xFFFFFF04
    entity Effect, 0x2D, f(-100, -188, 64), 0xFFFFFF05
    entity Effect, 0x2D, f(92, -220, 64), 0xFFFFFF06
    entity Effect, 0x2D, f(220, -252, 64), 0xFFFFFF07
    .word 0xFF

global_label EntityAllocParams_8049470
    entity Effect, 0x2D, f(-60, -116, 0), 0xFFFFFF00
    entity Effect, 0x2D, f(-124, -116, 0), 0xFFFFFF01
    entity Effect, 0x2D, f(-28, 284, -64), 0xFFFFFF02
    entity Effect, 0x2D, f(130, 318, -64), 0xFFFFFF03
    entity Effect, 0x2D, f(254, 156, -64), 0xFFFFFF04
    entity Effect, 0x2D, f(228, 94, -64), 0xFFFFFF05
    entity Effect, 0x2D, f(254, 60, -64), 0xFFFFFF06
    entity Effect, 0x2D, f(420, -164, 0), 0xFFFFFF07
    .word 0xFF

global_label EntityAllocParams_8049514
    entity Effect, 0x2D, f(-150, -220, 0), 0xFFFFFF00
    entity Effect, 0x2D, f(42, -124, 0), 0xFFFFFF01
    entity Effect, 0x2D, f(300, 4, 64), 0xFFFFFF02
    entity Effect, 0x2D, f(236, 292, 0), 0xFFFFFF03
    entity Effect, 0x2D, f(204, 100, 64), 0xFFFFFF04
    entity Effect, 0x2D, f(-20, 236, 0), 0xFFFFFF05
    entity Effect, 0x2D, f(-20, 174, 0), 0xFFFFFF06
    entity Effect, 0x2D, f(-84, 330, 0), 0xFFFFFF07
    entity Effect, 0x2D, f(-84, 178, 0), 0xFFFFFF08
    entity Effect, 0x2D, f(-84, 0, 0), 0xFFFFFF09
    .word 0xFF

global_label EntityAllocParams_80495E0
    entity Effect, 0x2D, f(-222, 188, 0), 0xFFFFFF00
    entity Effect, 0x2D, f(-282, 188, 0), 0xFFFFFF01
    entity Effect, 0x2D, f(-316, 26, 0), 0xFFFFFF02
    entity Effect, 0x2D, f(-250, -6, 0), 0xFFFFFF03
    entity Effect, 0x2D, f(-222, -162, 0), 0xFFFFFF04
    entity Effect, 0x2D, f(-12, -144, 0), 0xFFFFFF05
    entity Effect, 0x2D, f(-206, -306, 0), 0xFFFFFF06
    entity Effect, 0x2D, f(-90, -386, 0), 0xFFFFFF07
    entity Effect, 0x2D, f(4, -386, 0), 0xFFFFFF08
    entity Effect, 0x2D, f(84, -386, 0), 0xFFFFFF09
    entity Effect, 0x2D, f(148, -386, 0), 0xFFFFFF0A
    entity Effect, 0x2D, f(320, -68, 0), 0xFFFFFF0B
    entity Effect, 0x2D, f(386, -104, 0), 0xFFFFFF0C
    entity Effect, 0x2D, f(386, -30, 0), 0xFFFFFF0D
    entity Effect, 0x2D, f(424, -68, 0), 0xFFFFFF0E
    entity Effect, 0x2D, f(386, -292, 0), 0xFFFFFF0F
    entity Effect, 0x2D, f(356, 124, 0), 0xFFFFFF10
    entity Effect, 0x2D, f(242, 204, 0), 0xFFFFFF11
    entity Effect, 0x2D, f(82, 332, 0), 0xFFFFFF12
    entity Effect, 0x2D, f(258, 444, 0), 0xFFFFFF13
    entity Effect, 0x2D, f(-60, 444, 0), 0xFFFFFF14
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
    mov        r1,r10
    ldr        r1,[r1,#0x8]
    ldrb       r1,[r1,#0x5]
    lsl        r1,r1,#0x2
    ldr        r0,PTR_PTR_EntityAllocParams_8049364_08049b08
    ldr        r0,[r0,r1]
    bl         Entity_AllocList
    pop        {r5}
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrb       r1,[r7,#0x4]
    ldrb       r2,[r7,#0xc]
    cmp        r1,r2
    beq        LAB_080499a0
    ldr        r7,[r7,#0x78]
    mov        r0,#0x0
    strb       r0,[r7,#0x4]
    mov        r0,r8
    tst        r0,r0
    bne        LAB_080499a0
    push       {r5}
    mov        r0,#0x30
    bl         Flag_ClearBase
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
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldr        r0,[r7,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x80
    beq        LAB_08049a44
    cmp        r0,#0x50
    blt        LAB_08049a3c
    cmp        r0,#0x7f
    bgt        LAB_08049a3c
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrb       r1,[r7,#0x5]
    lsl        r1,r1,#0x2
    mov        r7,r10
    ldr        r7,[r7,#0x78]
    ldrb       r6,[r7,#0x4]
    strb       r0,[r7,#0x4]
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
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrb       r1,[r7,#0x5]
    lsl        r1,r1,#0x2
    mov        r7,r8
    ldr        r0,PTR_PTR_FUN_08049aac_08049b14
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    mov        r0,#0x30
    bl         Flag_ToggleBase
    mov        r0,#0x0
    bl         Flag_ToggleIgnore
    mov        r0,#0x1
    bl         Flag_ToggleIgnore
    mov        r0,#0xba
    bl         Sound_PlaySongImmediate
    pop        {r5}
    bl         FUN_08049ab0
    b          LAB_08049a44
LAB_08049a3c:
    mov        r7,r10
    ldr        r7,[r7,#0x78]
    mov        r0,#0x0
    strb       r0,[r7,#0x4]
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
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r0,[r0,#0x6]
    lsr        r0,r0,#0x4
    cmp        r0,#0x3
    bne        LAB_08049a80
    cmp        r6,#0x5e
    bne        LAB_08049a80
    cmp        r7,#0x5f
    bne        LAB_08049a80
    mov        r0,#0x30
    bl         Flag_GetBase
    bne        LAB_08049a80
    mov        r0,#0xc4
    bl         Flag_SetBase
LAB_08049a80:
    pop        {r5,pc}

    .align 2, 0


_ts FUN_08049a84
    push       {r5,lr}
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r0,[r0,#0x6]
    lsr        r0,r0,#0x4
    cmp        r0,#0x3
    bne        LAB_08049aa8
    cmp        r6,#0x5e
    bne        LAB_08049a80
    cmp        r7,#0x5d
    bne        LAB_08049a80
    mov        r0,#0x30
    bl         Flag_GetBase
    bne        LAB_08049aa8
    mov        r0,#0xc5
    bl         Flag_SetBase
LAB_08049aa8:
    pop        {r5,pc}

    .align 2, 0


_ts FUN_08049aac
    mov        pc,lr

    .align 2, 0


_ts FUN_08049ab0
    push       {r5,lr}
    mov        r0,#0x30
    bl         Flag_GetBase
    bne        LAB_08049ae0
    ldr        r0,PTR_BgTask_80473FC_08049b18
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8047414_08049b1c
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_804742C_08049b20
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8047444_08049b24
    bl         BgTask_AddNew
    mov        r0,#0x0
    bl         Flag_SetIgnore
    mov        r0,#0x1
    bl         Flag_ClearIgnore
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
    mov        r0,#0x0
    bl         Flag_ClearIgnore
    mov        r0,#0x1
    bl         Flag_SetIgnore
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
