#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


global_label NPCList_804DF70
    .word NPC_804E03C
    .word NPC_804E060
    .word NPC_804E084
    .word NPC_804E0A8
    .word NPC_804E11B
    .word NPC_804E131
    .word NPC_804E147
    .word NPC_804E15D
    .word NPC_804E173
    .word NPC_804E189
    .word NPC_804E19F
    .word NPC_804E1B5
    .word NPC_804E1CB
    .word NPC_804E1E1
    .word 0xFF

global_label NPCList_804DFAC
    .word NPC_804E03C
    .word NPC_804E060
    .word NPC_804E084
    .word NPC_804E0A8
    .word NPC_804E0CC
    .word NPC_804E1E1
    .word 0xFF

global_label NPCList_804DFC8
    .word NPC_804E03C
    .word NPC_804E060
    .word NPC_804E084
    .word NPC_804E0A8
    .word NPC_804E0E1
    .word NPC_804E11B
    .word NPC_804E131
    .word NPC_804E147
    .word NPC_804E15D
    .word NPC_804E173
    .word NPC_804E189
    .word NPC_804E19F
    .word NPC_804E1B5
    .word NPC_804E1CB
    .word 0xFF

global_label NPCList_804E004
    .word NPC_804E03C
    .word NPC_804E060
    .word NPC_804E084
    .word NPC_804E0A8
    .word NPC_804E102
    .word NPC_804E1E1
    .word 0xFF

global_label NPCList_804E020
    .word NPC_804E03C
    .word NPC_804E060
    .word NPC_804E084
    .word NPC_804E0A8
    .word NPC_804E1F8
    .word NPC_804E1E1
    .word 0xFF

    .align 2, 0

NPC_804E03C:
    a_create_bmd -50, -492, 0, FLAG_ITEM_WWW_COMP_1_RECOV200_C, dialog=0x23
    .align 2, 0

NPC_804E060:
    a_create_bmd 84, -208, 0, FLAG_ITEM_WWW_COMP_1_5000Z, dialog=0x24
    .align 2, 0

NPC_804E084:
    a_create_bmd 114, 210, 0, FLAG_ITEM_WWW_COMP_1_3000Z, dialog=0x25
    .align 2, 0

NPC_804E0A8:
    a_create_bmd 18, 292, 0, FLAG_ITEM_WWW_COMP_1_FIRESWRD_P, dialog=0x26
    .align 2, 0

NPC_804E0CC:
    a_init_basic_npc_talk -330, 400, 0, SP_Overworld_Glyde, frame=5, dialog=0x1E
    a_stop

NPC_804E0E1:
    a_init
    a_set_sprite_at -348, 438, 0, SP_Overworld_Glyde
    a_wait_f 15, 60
    a_wait_f 12, 2
    a_move_f 13, d_nw, 32, 4
    a_set_sprite_frame 14
    a_stop

NPC_804E102:
    a_init_basic_npc_talk -348, 406, 0, SP_Overworld_Glyde, dialog=0x1E
    a_wait_f 14, 80
    a_set_sprite_frame 3
    a_stop

NPC_804E11B:
    a_init
    a_sprite_high_priority
    a_disable_dialog
    a_disable_turn
    a_set_sprite_at -332, 358, 0, SP_BattleEffect_Meteor_Fire, frame=0
    a_stop

NPC_804E131:
    a_init
    a_sprite_high_priority
    a_disable_dialog
    a_disable_turn
    a_set_sprite_at -345, 358, 0, SP_BattleEffect_Meteor_Fire, frame=1
    a_stop

NPC_804E147:
    a_init
    a_sprite_high_priority
    a_disable_dialog
    a_disable_turn
    a_set_sprite_at -358, 358, 0, SP_BattleEffect_Meteor_Fire, frame=0
    a_stop

NPC_804E15D:
    a_init
    a_sprite_high_priority
    a_disable_dialog
    a_disable_turn
    a_set_sprite_at -332, 372, 0, SP_BattleEffect_Meteor_Fire, frame=1
    a_stop

NPC_804E173:
    a_init
    a_sprite_high_priority
    a_disable_dialog
    a_disable_turn
    a_set_sprite_at -345, 372, 0, SP_BattleEffect_Meteor_Fire, frame=0
    a_stop

NPC_804E189:
    a_init
    a_sprite_high_priority
    a_disable_dialog
    a_disable_turn
    a_set_sprite_at -358, 372, 0, SP_BattleEffect_Meteor_Fire, frame=1
    a_stop

NPC_804E19F:
    a_init
    a_sprite_high_priority
    a_disable_dialog
    a_disable_turn
    a_set_sprite_at -332, 386, 0, SP_BattleEffect_Meteor_Fire, frame=0
    a_stop

NPC_804E1B5:
    a_init
    a_sprite_high_priority
    a_disable_dialog
    a_disable_turn
    a_set_sprite_at -345, 386, 0, SP_BattleEffect_Meteor_Fire, frame=1
    a_stop

NPC_804E1CB:
    a_init
    a_sprite_high_priority
    a_disable_dialog
    a_disable_turn
    a_set_sprite_at -358, 386, 0, SP_BattleEffect_Meteor_Fire, frame=0
    a_stop

NPC_804E1E1:
    a_init
    a_sprite_mask_set_flag 0x3
    a_set_sprite SP_Overworld_NormalNavi
    a_set_dialog 0x0
    a_set_pos -100, -424
    a_set_sprite_frame 3
    a_stop

    .align 2, 0

NPC_804E1F8:
    a_init_basic_npc -348, 406, 0, SP_Overworld_Glyde, frame=7
    a_stop

    .align 2, 0

global_label NPCList_804E20C
    .word NPC_804E244
    .word NPC_804E268
    .word NPC_804E28C
    .word 0xFF

global_label NPCList_804E21C
    .word NPC_804E244
    .word NPC_804E268
    .word NPC_804E28C
    .word NPC_804E2B0
    .word 0xFF

global_label NPCList_804E230
    .word NPC_804E244
    .word NPC_804E268
    .word NPC_804E28C
    .word NPC_804E2C5
    .word 0xFF

    .align 2, 0

NPC_804E244:
    a_create_bmd 220, 196, 0, FLAG_ITEM_WWW_COMP_2_HURICANE_L, dialog=0x28
    .align 2, 0

NPC_804E268:
    a_create_bmd 380, -284, 0, FLAG_ITEM_WWW_COMP_2_8000Z, dialog=0x29
    .align 2, 0

NPC_804E28C:
    a_create_bmd -100, -124, 0, FLAG_ITEM_WWW_COMP_2_FTRSWRD_P, dialog=0x2A
    .align 2, 0

NPC_804E2B0:
    a_init_basic_npc_talk -478, 20, 64, SP_Overworld_NumberMan, frame=7, dialog=0x2B
    a_stop

NPC_804E2C5:
    a_init
    a_set_sprite_at -484, 38, 64, SP_Overworld_NumberMan
    a_wait_f 12, 60
    a_set_sprite_frame 13
L_804E2D5:
    a_jump_if_flag 0xDD, L_804E2E3
    a_wait 1
    a_jump L_804E2D5
L_804E2E3:
    a_set_sprite_frame 14
L_804E2E5:
    a_jump_if_flag 0xD2, L_804E2F3
    a_wait 1
    a_jump L_804E2E5
L_804E2F3:
    a_set_sprite_frame 7
    a_stop

global_label NPCList_804E2FC
    .word NPC_804E328
    .word NPC_804E34C
    .word 0xFF

global_label NPCList_804E308
    .word NPC_804E328
    .word NPC_804E34C
    .word NPC_804E38E
    .word 0xFF

global_label NPCList_804E318
    .word NPC_804E328
    .word NPC_804E34C
    .word NPC_804E370
    .word 0xFF

    .align 2, 0

NPC_804E328:
    a_create_bmd -384, 58, -32, FLAG_ITEM_WWW_COMP_3_4000Z, dialog=0x19
    .align 2, 0

NPC_804E34C:
    a_create_bmd 348, 74, 32, FLAG_ITEM_WWW_COMP_3_RECOV300_L, dialog=0x1A
    .align 2, 0

NPC_804E370:
    a_init
    a_disable_collision
    a_set_sprite_at 516, 88, 32, SP_Overworld_ColdMan, frame=11
    a_move d_nw, 8, 11
    a_wait_f 7, 30
    a_set_sprite_frame 17
    a_stop

NPC_804E38E:
    a_init_basic_npc_talk 518, 10, 32, SP_Overworld_ColdMan, frame=5, dialog=0x14
    a_stop

    .align 2, 0

global_label NPCList_804E3A4
    .word NPC_804E3C0
    .word NPC_804E3E4
    .word 0xFF

global_label NPCList_804E3B0
    .word NPC_804E3C0
    .word NPC_804E3E4
    .word NPC_804E408
    .word 0xFF

    .align 2, 0

NPC_804E3C0:
    a_create_bmd -92, 332, 0, FLAG_ITEM_WWW_COMP_4_TIMEBOM3_P, dialog=0x5
    .align 2, 0

NPC_804E3E4:
    a_create_bmd -316, -118, 0, FLAG_ITEM_WWW_COMP_4_HPMEMORY, dialog=0x6
    .align 2, 0

NPC_804E408:
    a_init_basic_npc_talk -486, -20, 0, SP_Overworld_GutsMan, frame=5, dialog=0x0
    a_stop

    .align 2, 0

global_label NPCList_804E420
    .word NPC_804E4D4
    .word NPC_804E4F8
    .word NPC_804E6FA
    .word 0xFF

global_label NPCList_804E430
    .word NPC_804E4D4
    .word NPC_804E4F8
    .word NPC_804E51C
    .word NPC_804E6FA
    .word 0xFF

global_label NPCList_804E444
    .word NPC_804E4D4
    .word NPC_804E4F8
    .word NPC_804E531
    .word NPC_804E6FA
    .word 0xFF

global_label NPCList_804E458
    .word NPC_804E4D4
    .word NPC_804E4F8
    .word NPC_804E51C
    .word NPC_804E597
    .word NPC_804E6FA
    .word 0xFF

global_label NPCList_804E470
    .word NPC_804E4D4
    .word NPC_804E4F8
    .word NPC_804E5AA
    .word NPC_804E5D4
    .word NPC_804E6FA
    .word 0xFF

global_label NPCList_804E488
    .word NPC_804E4D4
    .word NPC_804E4F8
    .word NPC_804E629
    .word NPC_804E63C
    .word NPC_804E667
    .word NPC_804E6FA
    .word 0xFF

global_label NPCList_804E4A4
    .word NPC_804E4D4
    .word NPC_804E4F8
    .word NPC_804E6AD
    .word NPC_804E69A
    .word NPC_804E6FA
    .word 0xFF

global_label NPCList_804E4BC
    .word NPC_804E4D4
    .word NPC_804E4F8
    .word NPC_804E6D0
    .word NPC_804E6E5
    .word NPC_804E6FA
    .word 0xFF

    .align 2, 0

NPC_804E4D4:
    a_create_bmd -144, 248, 64, FLAG_ITEM_WWW_COMP_5_2000Z, dialog=0x5
    .align 2, 0

NPC_804E4F8:
    a_create_bmd 246, 376, 0, FLAG_ITEM_WWW_COMP_5_BIGWAVE_K, dialog=0x6
    .align 2, 0

NPC_804E51C:
    a_init_basic_npc_talk 562, -122, 0, SP_Overworld_Roll, frame=5, dialog=0x0
    a_stop

NPC_804E531:
    a_init
    a_disable_collision
    a_set_sprite_at 562, 14, 0, SP_Overworld_Roll, frame=15
    a_move d_nw, 16, 9
    a_set_sprite_frame 7
L_804E544:
    a_jump_if_flag 0xE3, L_804E552
    a_wait 1
    a_jump L_804E544
L_804E552:
    a_jump_if_not_flag 0xE3, L_804E560
    a_wait 1
    a_jump L_804E552
L_804E560:
    a_move_f 15, d_nw, 16, 8
    a_set_sprite_frame 7
L_804E568:
    a_jump_if_flag 0xE3, L_804E576
    a_wait 1
    a_jump L_804E568
L_804E576:
    a_wait_f 16, 14
    a_set_sprite_frame 17
L_804E57C:
    a_jump_if_not_flag 0xE3, L_804E58A
    a_wait 1
    a_jump L_804E57C
L_804E58A:
    a_wait_f 7, 10
    a_set_sprite_frame 5
    a_stop

NPC_804E597:
    a_init_basic_npc 560, -236, 0, SP_Overworld_MagicMan, frame=20
    a_stop

NPC_804E5AA:
    a_init
    a_disable_collision
    a_set_sprite_at 568, -130, 0, SP_Overworld_Roll, frame=7
L_804E5B7:
    a_jump_if_flag 0xE3, L_804E5C5
    a_wait 1
    a_jump L_804E5B7
L_804E5C5:
    a_move_f 15, d_nw, 16, 3
    a_set_sprite_frame 18
    a_stop

    .align 2, 0

NPC_804E5D4:
    a_init
    a_set_sprite_at 556, -236, 0, SP_Overworld_MagicMan, frame=12
L_804E5E0:
    a_jump_if_flag 0xF9, L_804E5EE
    a_wait 1
    a_jump L_804E5E0
L_804E5EE:
    a_wait_f 13, 15
    a_wait_f 14, 40
    a_wait_f 15, 7
    a_set_sprite_frame 16
L_804E5FC:
    a_jump_if_not_flag 0xF9, L_804E60A
    a_wait 1
    a_jump L_804E5FC
L_804E60A:
    a_wait 30
    a_wait_f 17, 30
    a_set_sprite_frame 18
L_804E612:
    a_jump_if_flag 0xF9, L_804E620
    a_wait 1
    a_jump L_804E612
L_804E620:
    a_set_sprite_frame 19
    a_stop

NPC_804E629:
    a_init_basic_npc 568, -154, 0, SP_Overworld_Roll, frame=18
    a_stop

    .align 2, 0

NPC_804E63C:
    a_init
    a_set_sprite_at 556, -236, 0, SP_Overworld_MagicMan, frame=14
L_804E648:
    a_jump_if_flag 0xF9, L_804E656
    a_wait 1
    a_jump L_804E648
L_804E656:
    a_set_sprite_frame 19
L_804E658:
    a_jump_if_not_flag 0xF9, L_804E666
    a_wait 1
    a_jump L_804E658
L_804E666:
    a_destroy

NPC_804E667:
    a_init
    a_set_sprite_at 556, -180, 0, SP_Overworld_ProtoMan
    a_wait_f 25, 14
    a_move_f 26, d_nw, 40, 1
    a_move_f 27, d_nw, 40, 4
    a_set_sprite_frame 28
L_804E683:
    a_jump_if_flag 0x93, L_804E691
    a_wait 1
    a_jump L_804E683
L_804E691:
    a_set_sprite_frame 3
    a_stop

NPC_804E69A:
    a_init_basic_npc 556, -220, 0, SP_Overworld_ProtoMan, frame=3
    a_stop

NPC_804E6AD:
    a_init
    a_set_sprite_at 568, -154, 0, SP_Overworld_Roll, frame=18
L_804E6B9:
    a_jump_if_flag 0xE3, L_804E6C7
    a_wait 1
    a_jump L_804E6B9
L_804E6C7:
    a_set_sprite_frame 5
    a_stop

    .align 2, 0

NPC_804E6D0:
    a_init_basic_npc_talk 568, -154, 0, SP_Overworld_Roll, frame=5, dialog=0x0
    a_stop

NPC_804E6E5:
    a_init_basic_npc_talk 556, -220, 0, SP_Overworld_ProtoMan, frame=3, dialog=0x1
    a_stop

NPC_804E6FA:
    a_init_basic_npc_talk 566, 94, 0, SP_Overworld_Prog, frame=5, dialog=0x2
    a_stop

    .align 2, 0

global_label EntityAllocParams_804E710
    entity Effect, EFI_LockProgram, f(-338, 256, 0), 0x0
    entity Effect, EFI_LockProgram, f(-338, 256, 0), 0x8
    .word 0xFF

global_label EntityAllocParams_804E73C
    entity Attack, ACI_MeteorFire, f(84, -426, 0), 0x100
    entity Attack, ACI_MeteorFire, f(84, -402, 0), 0x1
    entity Attack, ACI_MeteorFire, f(60, -402, 0), 0x102
    entity Attack, ACI_MeteorFire, f(-54, -234, 0), 0x3
    entity Attack, ACI_MeteorFire, f(-30, -234, 0), 0x104
    entity Attack, ACI_MeteorFire, f(164, -266, 0), 0x5
    entity Attack, ACI_MeteorFire, f(220, -202, 0), 0x106
    entity Attack, ACI_MeteorFire, f(220, -178, 0), 0x7
    entity Attack, ACI_MeteorFire, f(100, -106, 0), 0x108
    entity Attack, ACI_MeteorFire, f(100, -82, 0), 0x9
    entity Attack, ACI_MeteorFire, f(212, 150, 0), 0x10A
    entity Attack, ACI_MeteorFire, f(212, 174, 0), 0xB
    entity Attack, ACI_MeteorFire, f(132, 86, 0), 0x10C
    entity Attack, ACI_MeteorFire, f(108, 86, 0), 0xD
    entity Attack, ACI_MeteorFire, f(108, 278, 0), 0x10E
    entity Attack, ACI_MeteorFire, f(132, 278, 0), 0xF
    entity Attack, ACI_MeteorFire, f(34, 166, 0), 0x110
    entity Attack, ACI_MeteorFire, f(12, 86, 0), 0x11
    entity Attack, ACI_MeteorFire, f(12, 110, 0), 0x112
    entity Attack, ACI_MeteorFire, f(12, 246, 0), 0x13
    entity Attack, ACI_MeteorFire, f(12, 270, 0), 0x114
    entity Attack, ACI_MeteorFire, f(-84, 166, 0), 0x15
    entity Attack, ACI_MeteorFire, f(-84, 190, 0), 0x116
    .word 0xFF

global_label EntityAllocParams_804E90C
    entity Effect, EFI_LockProgram, f(-486, -58, 64), 0x0
    entity Effect, EFI_LockProgram, f(-486, -58, 64), 0x8
    .word 0xFF

global_label EntityAllocParams_804E938
    entity Effect, EFI_LockProgram, f(508, -124, 32), 0x0
    entity Effect, EFI_LockProgram, f(508, -124, 32), 0x8
    entity Effect, EFI_WWWIceWall, f(508, -32, 32), 0x0
    .word 0xFF

global_label EntityAllocParams_804E978
    entity Effect, EFI_LockProgram, f(508, -124, 32), 0x0
    entity Effect, EFI_LockProgram, f(508, -124, 32), 0x8
    .word 0xFF

global_label EntityAllocParams_804E9A4
    entity Effect, EFI_TrafficSwitch, f(450, -84, 0), 0xFFFFFF00
    entity Effect, EFI_TrafficSwitch, f(484, 16, 0), 0xFFFFFF01
    entity Effect, EFI_TrafficSwitch, f(452, 236, 0), 0xFFFFFF02
    entity Effect, EFI_TrafficSwitch, f(320, 236, 0), 0xFFFFFF03
    entity Effect, EFI_TrafficSwitch, f(260, 76, 0), 0xFFFFFF04
    entity Effect, EFI_TrafficSwitch, f(34, 140, 0), 0xFFFFFF05
    entity Effect, EFI_TrafficSwitch, f(-28, -84, 0), 0xFFFFFF06
    entity Effect, EFI_TrafficSwitch, f(-188, -54, 0), 0xFFFFFF07
    entity Effect, EFI_TrafficSwitch, f(-160, -84, 0), 0xFFFFFF08
    entity Effect, EFI_TrafficSwitch, f(-252, -212, 0), 0xFFFFFF09
    entity Effect, EFI_TrafficSwitch, f(-410, 142, 0), 0xFFFFFF0A
    .word 0xFF

global_label EntityAllocParams_804EA84
    entity Effect, EFI_LockProgram, f(-512, -66, 0), 0x0
    entity Effect, EFI_LockProgram, f(-512, -66, 0), 0x8
    entity Effect, EFI_WWWBoulder, f(-508, 20, 8), 0x0
    .word 0xFF

global_label EntityAllocParams_804EAC4
    entity Effect, EFI_LockProgram, f(-512, -66, 0), 0x0
    entity Effect, EFI_LockProgram, f(-512, -66, 0), 0x8
    .word 0xFF

global_label EntityAllocParams_804EAF0
    entity Effect, EFI_LockProgram, f(558, -230, 0), 0x0
    entity Effect, EFI_LockProgram, f(558, -230, 0), 0x8
    .word 0xFF

global_label EntityAllocParams_804EB1C
    entity Effect, EFI_LifeVirusSeed, f(450, -4, 0), 0x20
    .word 0xFF

PTR_0804eb34:
    .word 0
    .word 0
    .word 0
    .word EntityAllocParams_804E9A4
    .word 0
    .word 0
PTR_0804eb4c:
    .word 0
    .word 0
    .word 0
    .word DAT_0804eb64
    .word 0
    .word 0

DAT_0804eb64:
    .byte 0x51,0xFF,0xFF,0xFF
    .byte 0x50,0xFF,0xFF,0xFF
    .byte 0x53,0xFF,0xFF,0xFF
    .byte 0x52,0xFF,0xFF,0xFF
    .byte 0x55,0xFF,0xFF,0xFF
    .byte 0x54,0xFF,0xFF,0xFF
    .byte 0x57,0xFF,0xFF,0xFF
    .byte 0x56,0xFF,0xFF,0xFF
    .byte 0x59,0x5A,0xFF,0xFF
    .byte 0x58,0x5A,0xFF,0xFF
    .byte 0x58,0x59,0xFF,0xFF
    .byte 0x5C,0x5D,0xFF,0xFF
    .byte 0x5B,0x5D,0xFF,0xFF
    .byte 0x5B,0x5C,0xFF,0xFF
    .byte 0x5F,0xFF,0xFF,0xFF
    .byte 0x5E,0xFF,0xFF,0xFF
    .byte 0x61,0xFF,0xFF,0xFF
    .byte 0x60,0xFF,0xFF,0xFF
    .byte 0x63,0xFF,0xFF,0xFF
    .byte 0x62,0xFF,0xFF,0xFF
    .byte 0x65,0xFF,0xFF,0xFF
    .byte 0x64,0xFF,0xFF,0xFF
    .byte 0x67,0xFF,0xFF,0xFF
    .byte 0x66,0xFF,0xFF,0xFF

_ts FUN_0804ebc4
    mov        r0,#0x0
    b          FUN_0804ebca


_ts FUN_0804ebc8
    mov        r0,#0x1


_nt FUN_0804ebca
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
    ldr        r0,PTR_PTR_0804ed28
    ldr        r0,[r0,r1]
    bl         Entity_AllocList
    pop        {r5}
    LoadMain world, r7, r7
    ldrb       r1,[r7,#0x4]
    ldrb       r2,[r7,#0xc]
    cmp        r1,r2
    beq        LAB_0804ec0c
    ldr        r7,[r7,#0x78]
    mov        r0,#0x0
    strb       r0,[r7,#0x4]
    mov        r0,r8
    tst        r0,r0
    bne        LAB_0804ec0c
    push       {r5}
    Flag_ClearBase 0x30
    pop        {r5}
LAB_0804ec0c:
    bl         FUN_0804ecd0
    pop        {pc}

    .align 2, 0


_ts FUN_0804ec14
    push       {lr}
    ldr        r0,PTR_PTR_FUN_0804ec28_0804ed2c
    ldrb       r1,[r5,#0x8]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_FUN_0804ec28_0804ec24:
    .word FUN_0804ec28


_ts FUN_0804ec28
    push       {lr}
    push       {r5}
    LoadMain world, r7, r7
    ldr        r0,[r7,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x80
    beq        LAB_0804ecb0
    cmp        r0,#0x50
    blt        LAB_0804eca8
    cmp        r0,#0x7f
    bgt        LAB_0804eca8
    LoadMain world, r7, r7
    ldrb       r1,[r7,#0x5]
    lsl        r1,r1,#0x2
    LoadMain gameStats, r7, r7
    ldrb       r6,[r7,#0x4]
    strb       r0,[r7,#0x4]
    mov        r8,r0
    ldr        r7,PTR_PTR_0804ed30
    ldr        r7,[r7,r1]
    sub        r0,#0x50
    lsl        r0,r0,#0x2
    add        r7,r7,r0
    mov        r2,#0x0
LAB_0804ec64:
    ldrb       r3,[r7,r2]
    cmp        r3,r6
    bne        LAB_0804ec6c
    b          LAB_0804ec74
LAB_0804ec6c:
    add        r2,#0x1
    cmp        r2,#0x4
    blt        LAB_0804ec64
    b          LAB_0804ecb0
LAB_0804ec74:
    LoadMain world, r7, r7
    ldrb       r1,[r7,#0x5]
    lsl        r1,r1,#0x2
    mov        r7,r8
    ldr        r0,PTR_PTR_0804ed34
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    Flag_ToggleBase 0x30
    Flag_ToggleIgnore F_IGNORE_DOOR_00
    Flag_ToggleIgnore F_IGNORE_DOOR_01
    mov        r0,#0xba
    bl         Sound_PlaySE
    pop        {r5}
    bl         FUN_0804ecd0
    b          LAB_0804ecb0
LAB_0804eca8:
    LoadMain gameStats, r7, r7
    mov        r0,#0x0
    strb       r0,[r7,#0x4]
LAB_0804ecb0:
    pop        {pc}

    .align 2, 0

PTR_0804ecb4:
    .word 0
    .word 0
    .word 0
    .word FUN_0804eccc
    .word 0
    .word 0


_ts FUN_0804eccc
    mov        pc,lr

    .align 2, 0


_ts FUN_0804ecd0
    push       {r5,lr}
    Flag_GetBase 0x30
    bne        LAB_0804ed00
    ldr        r0,PTR_BgTask_80473FC_0804ed38
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8047414_0804ed3c
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_804742C_0804ed40
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8047444_0804ed44
    bl         BgTask_AddNew
    Flag_SetIgnore F_IGNORE_DOOR_00
    Flag_ClearIgnore F_IGNORE_DOOR_01
    b          LAB_0804ed24
LAB_0804ed00:
    ldr        r0,PTR_BgTask_80473B4_0804ed48
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_80473CC_0804ed4c
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_80473E4_0804ed50
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8047474_0804ed54
    bl         BgTask_AddNew
    Flag_ClearIgnore F_IGNORE_DOOR_00
    Flag_SetIgnore F_IGNORE_DOOR_01
LAB_0804ed24:
    pop        {r5,pc}

    .align 2, 0

PTR_PTR_0804ed28:
    .word PTR_0804eb34

PTR_PTR_FUN_0804ec28_0804ed2c:
    .word PTR_FUN_0804ec28_0804ec24

PTR_PTR_0804ed30:
    .word PTR_0804eb4c

PTR_PTR_0804ed34:
    .word PTR_0804ecb4

PTR_BgTask_80473FC_0804ed38:
    .word BgTask_80473FC

PTR_BgTask_8047414_0804ed3c:
    .word BgTask_8047414

PTR_BgTask_804742C_0804ed40:
    .word BgTask_804742C

PTR_BgTask_8047444_0804ed44:
    .word BgTask_8047444

PTR_BgTask_80473B4_0804ed48:
    .word BgTask_80473B4

PTR_BgTask_80473CC_0804ed4c:
    .word BgTask_80473CC

PTR_BgTask_80473E4_0804ed50:
    .word BgTask_80473E4

PTR_BgTask_8047474_0804ed54:
    .word BgTask_8047474
