#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


global_label NPCList_8046BC8
    .word NPC_8046BD0
    .word 0xFF

    .align 2, 0

NPC_8046BD0:
    a_create_bmd 68, 92, 0, FLAG_ITEM_SCHOOL_WATERWORKS_COMP_1_SONIWAVE_J, dialog=0x0
global_label NPCList_8046BF4
    .word NPC_8046C04
    .word NPC_8046C27
    .word NPC_8046C4A
    .word 0xFF

    .align 2, 0

NPC_8046C04:
    a_init
    a_set_sprite_at 20, 38, 0, SP_Overworld_ProtoMan, frame=3
L_8046C10:
    a_jump_if_flag 0xD0, L_8046C1E
    a_wait 1
    a_jump L_8046C10
L_8046C1E:
    a_set_sprite_frame 12
    a_stop

NPC_8046C27:
    a_init
    a_set_sprite_at 38, 86, 0, SP_Overworld_ColorMan, frame=6
L_8046C33:
    a_jump_if_flag 0xCF, L_8046C41
    a_wait 1
    a_jump L_8046C33
L_8046C41:
    a_set_sprite_frame 9
    a_stop

NPC_8046C4A:
    a_init
    a_set_sprite_at -124, 70, 0, SP_Overworld_ColdMan, frame=8
L_8046C56:
    a_jump_if_flag 0xF7, L_8046C64
    a_wait 1
    a_jump L_8046C56
L_8046C64:
    a_move d_ne, 16, 14
    a_set_sprite_frame 1
L_8046C6A:
    a_jump_if_flag 0xD2, L_8046C78
    a_wait 1
    a_jump L_8046C6A
L_8046C78:
    a_set_sprite_frame 7
    a_stop

    .align 2, 0

global_label NPCList_8046C84
    .word NPC_8046C8C
    .word 0xFF

    .align 2, 0

NPC_8046C8C:
    a_init
    a_set_sprite_at -374, 224, 0, SP_Overworld_ProtoMan, frame=3
L_8046C98:
    a_jump_if_flag 0xB5, L_8046CA6
    a_wait 1
    a_jump L_8046C98
L_8046CA6:
    a_set_sprite_frame 13
    a_move_f 14, d_se, 40, 2
    a_set_sprite_frame 15
L_8046CB0:
    a_jump_if_flag 0xB6, L_8046CBE
    a_wait 1
    a_jump L_8046CB0
L_8046CBE:
    a_set_sprite_frame 12
    a_stop

    .align 2, 0

global_label NPCList_8046CC8
    .word NPC_8046CDC
    .word NPC_8046CF1
    .word NPC_8046D15
    .word NPC_8046D39
    .word 0xFF

    .align 2, 0

NPC_8046CDC:
    a_init_basic_npc_talk -140, 150, 64, SP_Overworld_ColorMan, frame=7, dialog=0x14
    a_stop

NPC_8046CF1:
    a_create_bmd -280, 180, 64, FLAG_ITEM_SCHOOL_WATERWORKS_COMP_2_HPMEMORY, dialog=0x0
NPC_8046D15:
    a_create_bmd 66, 106, 32, FLAG_ITEM_SCHOOL_WATERWORKS_COMP_2_RECOV80_C, dialog=0x1
NPC_8046D39:
    a_init
    a_set_dialog 0x15
    a_sprite_mask_set_flag 0x3
    a_set_sprite_at -380, -28, 0, SP_Overworld_NormalNavi, frame=3
    a_stop

global_label NPCList_8046D50
    .word NPC_8046CF1
    .word NPC_8046D15
    .word NPC_8046D39
    .word 0xFF

global_label NPCList_8046D60
    .word NPC_8046D70
    .word NPC_8046D96
    .word NPC_8046DBC
    .word 0xFF

    .align 2, 0

NPC_8046D70:
    a_create_bmd -230, 418, 96, FLAG_ITEM_SCHOOL_WATERWORKS_COMP_3_WIDESWRD_C, dialog=0x0, no_shadow=1
NPC_8046D96:
    a_create_bmd 152, -200, 64, FLAG_ITEM_SCHOOL_WATERWORKS_COMP_3_TRIARROW_A, dialog=0x1, no_shadow=1
    .align 2, 0

NPC_8046DBC:
    a_create_bmd -230, -124, 96, FLAG_ITEM_SCHOOL_WATERWORKS_COMP_3_ICEPUNCH_B, dialog=0x2, no_shadow=1
    .align 2, 0

global_label NPCList_8046DE4
    .word NPC_8046DEC
    .word 0xFF

    .align 2, 0

NPC_8046DEC:
    a_create_bmd -34, -166, 64, FLAG_ITEM_SCHOOL_WATERWORKS_COMP_4_MCANNON_L, dialog=0x0
global_label NPCList_8046E10
    .word NPC_8046E28
    .word 0xFF

global_label NPCList_8046E18
    .word NPC_8046E28
    .word NPC_8046E4C
    .word NPC_8046E61
    .word 0xFF

    .align 2, 0

NPC_8046E28:
    a_create_bmd 80, -214, 0, FLAG_ITEM_SCHOOL_WATERWORKS_COMP_5_POWERUP, dialog=0x0
    .align 2, 0

NPC_8046E4C:
    a_init_basic_npc_talk -238, -18, 64, SP_Overworld_Prog, frame=7, dialog=0x14
    a_stop

NPC_8046E61:
    a_init_basic_npc_talk 190, 118, 96, SP_Overworld_Prog, frame=7, dialog=0x15
    a_stop

    .align 2, 0

global_label NPCList_8046E78
    .word NPC_8046E80
    .word 0xFF

    .align 2, 0

NPC_8046E80:
    a_create_bmd -12, 2, -96, FLAG_ITEM_SCHOOL_WATERWORKS_COMP_6_1000Z, dialog=0x0
global_label NPCList_8046EA4
    .word NPC_8046EB4
    .word NPC_8046EEF
    .word NPC_8046E80
    .word 0xFF

    .align 2, 0

NPC_8046EB4:
    a_init
    a_set_sprite_at 54, 380, -96, SP_Overworld_ProtoMan, frame=7
L_8046EC0:
    a_jump_if_flag 0xC5, L_8046ECE
    a_wait 1
    a_jump L_8046EC0
L_8046ECE:
    a_set_sprite_frame 16
    a_move_f 17, d_se, 40, 4
    a_set_sprite_frame 18
L_8046ED8:
    a_jump_if_flag 0xC6, L_8046EE6
    a_wait 1
    a_jump L_8046ED8
L_8046EE6:
    a_set_sprite_frame 12
    a_stop

NPC_8046EEF:
    a_init
    a_set_sprite_at 54, 360, -96, SP_Overworld_ColdMan, frame=12
L_8046EFB:
    a_jump_if_flag 0xC3, L_8046F09
    a_wait 1
    a_jump L_8046EFB
L_8046F09:
    a_wait_f 13, 9
    a_set_flag 0xC5
    a_wait_f 14, 9
    a_set_flag 0xCA
    a_wait 60
    a_set_sprite_frame 3
L_8046F1B:
    a_jump_if_flag 0xC4, L_8046F29
    a_wait 1
    a_jump L_8046F1B
L_8046F29:
    a_wait_f 15, 9
    a_set_flag 0xC8
    a_wait 60
    a_set_sprite_frame 5
    a_stop

    .align 2, 0

global_label NPCList_8046F3C
    .word NPC_8046F48
    .word NPC_8046E80
    .word 0xFF

    .align 2, 0

NPC_8046F48:
    a_init
    a_set_sprite_at 54, 360, -96, SP_Overworld_ColdMan, frame=5
L_8046F54:
    a_jump_if_flag 0xCE, L_8046F62
    a_wait 1
    a_jump L_8046F54
L_8046F62:
    a_set_sprite_frame 3
L_8046F64:
    a_jump_if_flag 0xCB, L_8046F72
    a_wait 1
    a_jump L_8046F64
L_8046F72:
    a_wait_f 3, 45
    a_set_sprite_frame 16
L_8046F78:
    a_jump_if_flag 0xCC, L_8046F86
    a_wait 1
    a_jump L_8046F78
L_8046F86:
    a_set_sprite_frame 5
    a_stop

    .align 2, 0

global_label EntityAllocParams_8046F90
    entity Effect, EFI_Pipe, f(-314, 36, 64), 0xFF000020
    entity Effect, EFI_Pipe2, f(-314, 60, 0), 0x10520
    .word 0xFF

global_label EntityAllocParams_8046FBC
    entity Effect, EFI_Pipe, f(-82, 316, 64), 0xFFFF0021
    entity Effect, EFI_Pipe2, f(-82, 340, 0), 0xFF010521
    entity Effect, EFI_Pipe, f(-188, 50, 64), 0xFF000122
    entity Effect, EFI_Pipe3, f(-212, 50, 0), 0xFF000622
    entity Effect, EFI_Pipe3, f(-244, 50, 0), 0xFF000622
    entity Effect, EFI_Pipe3, f(-276, 50, 0), 0xFF000622
    entity Effect, EFI_Pipe3, f(-308, 50, 0), 0xFF000622
    entity Effect, EFI_Pipe3, f(-340, 50, 0), 0xFF000622
    entity Effect, EFI_Pipe3, f(-372, 50, 0), 0xFF000622
    entity Effect, EFI_Pipe3, f(-404, 50, 0), 0xFF000622
    entity Effect, EFI_Pipe2, f(-212, 50, 0), 0xFF000522
    entity Effect, EFI_Pipe, f(132, -270, 64), 0xFF000123
    entity Effect, EFI_Pipe3, f(110, -270, 0), 0xFF010623
    entity Effect, EFI_Pipe3, f(78, -270, 0), 0xFF010623
    entity Effect, EFI_Pipe3, f(46, -270, 0), 0xFF010623
    entity Effect, EFI_Pipe2, f(108, -270, 0), 0xFF010523
    .word 0xFF

global_label EntityAllocParams_8047100
    entity Effect, EFI_Pipe, f(-322, -148, 128), 0xFF000024
    entity Effect, EFI_Pipe2, f(-322, -124, 96), 0xFF010324
    entity Effect, EFI_Pipe, f(-174, -94, 96), 0xFF000126
    entity Effect, EFI_Pipe2, f(-198, -94, 64), 0xFF010326
    entity Effect, EFI_Pipe, f(178, 100, 96), 0xFF000127
    entity Effect, EFI_Pipe3, f(158, 100, 64), 0xFF000627
    entity Effect, EFI_Pipe3, f(126, 100, 64), 0xFF000627
    entity Effect, EFI_Pipe3, f(94, 100, 64), 0xFF000627
    entity Effect, EFI_Pipe2, f(154, 100, 64), 0xFF000327
    .word 0xFF

global_label EntityAllocParams_80471B8
    entity Effect, EFI_Pipe, f(140, 46, 96), 0xFF000129
    entity Effect, EFI_Pipe3, f(114, 44, 64), 0xFF000629
    entity Effect, EFI_Pipe3, f(82, 44, 64), 0xFF000629
    entity Effect, EFI_Pipe3, f(50, 44, 64), 0xFF000629
    entity Effect, EFI_Pipe3, f(18, 44, 64), 0xFF000629
    entity Effect, EFI_Pipe3, f(-14, 44, 64), 0xFF000629
    entity Effect, EFI_Pipe3, f(-46, 44, 64), 0xFF000629
    entity Effect, EFI_Pipe3, f(-78, 44, 64), 0xFF000629
    entity Effect, EFI_Pipe3, f(-110, 44, 64), 0xFF000629
    entity Effect, EFI_Pipe2, f(116, 46, 64), 0xFF000329
    entity Effect, EFI_Pipe, f(-14, -236, 96), 0xFF000028
    entity Effect, EFI_Pipe3, f(-12, -210, 64), 0xFF000828
    entity Effect, EFI_Pipe3, f(-12, -178, 64), 0xFF000828
    entity Effect, EFI_Pipe3, f(-12, -146, 64), 0xFF000828
    entity Effect, EFI_Pipe3, f(-12, -114, 64), 0xFF000828
    entity Effect, EFI_Pipe3, f(-12, -82, 64), 0xFF000828
    entity Effect, EFI_Pipe3, f(-12, -50, 64), 0xFF000828
    entity Effect, EFI_Pipe3, f(-12, -18, 64), 0xFF000828
    entity Effect, EFI_Pipe2, f(-14, -212, 64), 0xFF000328
    .word 0xFF

global_label EntityAllocParams_8047338
    entity Effect, EFI_Pipe, f(-188, 66, -32), 0xFF00012A
    entity Effect, EFI_Pipe3, f(-212, 66, -96), 0xFF00062A
    entity Effect, EFI_Pipe3, f(-244, 66, -96), 0xFF00062A
    entity Effect, EFI_Pipe3, f(-276, 66, -96), 0xFF00062A
    entity Effect, EFI_Pipe2, f(-212, 66, -96), 0xFF00052A
    .word 0xFF
