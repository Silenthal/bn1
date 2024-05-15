#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


global_label NPCList_8046BC8
    .word NPC_8046BD0
    .word 0xFF

    .align 2, 0

NPC_8046BD0:
    a_jump_if_flag 0x2B7, L_8046BF3
    a_init
    a_disable_turn
    a_set_dialog 0x0
    a_set_sprite 0xE3
    a_set_palette 0x0
    a_set_pos 68, 92
    a_set_radius 4
    a_set_sprite_frame 0
L_8046BEA:
    a_wait 1
    a_jump_if_not_flag 0x2B7, L_8046BEA
L_8046BF3:
    a_destroy

global_label NPCList_8046BF4
    .word NPC_8046C04
    .word NPC_8046C27
    .word NPC_8046C4A
    .word 0xFF

    .align 2, 0

NPC_8046C04:
    a_init
    a_set_sprite 0x37
    a_set_pos 20, 38
    a_set_sprite_frame 3
L_8046C10:
    a_jump_if_flag 0xD0, L_8046C1E
    a_wait 1
    a_jump L_8046C10
L_8046C1E:
    a_set_sprite_frame 12
L_8046C20:
    a_wait 1
    a_jump L_8046C20

NPC_8046C27:
    a_init
    a_set_sprite 0x36
    a_set_pos 38, 86
    a_set_sprite_frame 6
L_8046C33:
    a_jump_if_flag 0xCF, L_8046C41
    a_wait 1
    a_jump L_8046C33
L_8046C41:
    a_set_sprite_frame 9
L_8046C43:
    a_wait 1
    a_jump L_8046C43

NPC_8046C4A:
    a_init
    a_set_sprite 0x35
    a_set_pos -124, 70
    a_set_sprite_frame 8
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
L_8046C7A:
    a_wait 1
    a_jump L_8046C7A

    .align 2, 0

global_label NPCList_8046C84
    .word NPC_8046C8C
    .word 0xFF

    .align 2, 0

NPC_8046C8C:
    a_init
    a_set_sprite 0x37
    a_set_pos -374, 224
    a_set_sprite_frame 3
L_8046C98:
    a_jump_if_flag 0xB5, L_8046CA6
    a_wait 1
    a_jump L_8046C98
L_8046CA6:
    a_set_sprite_frame 13
    a_set_sprite_frame 14
    a_move d_se, 40, 2
    a_set_sprite_frame 15
L_8046CB0:
    a_jump_if_flag 0xB6, L_8046CBE
    a_wait 1
    a_jump L_8046CB0
L_8046CBE:
    a_set_sprite_frame 12
L_8046CC0:
    a_wait 1
    a_jump L_8046CC0

    .align 2, 0

global_label NPCList_8046CC8
    .word NPC_8046CDC
    .word NPC_8046CF1
    .word NPC_8046D15
    .word NPC_8046D39
    .word 0xFF

    .align 2, 0

NPC_8046CDC:
    a_init
    a_set_dialog 0x14
    a_set_sprite 0x36
    a_set_pos -140, 150, 64
    a_set_sprite_frame 7
L_8046CEA:
    a_wait 1
    a_jump L_8046CEA

NPC_8046CF1:
    a_jump_if_flag 0x2B8, L_8046D14
    a_init
    a_disable_turn
    a_set_dialog 0x0
    a_set_sprite 0xE3
    a_set_palette 0x0
    a_set_pos -280, 180, 64
    a_set_radius 4
    a_set_sprite_frame 0
L_8046D0B:
    a_wait 1
    a_jump_if_not_flag 0x2B8, L_8046D0B
L_8046D14:
    a_destroy

NPC_8046D15:
    a_jump_if_flag 0x2BB, L_8046D38
    a_init
    a_disable_turn
    a_set_dialog 0x1
    a_set_sprite 0xE3
    a_set_palette 0x0
    a_set_pos 66, 106, 32
    a_set_radius 4
    a_set_sprite_frame 0
L_8046D2F:
    a_wait 1
    a_jump_if_not_flag 0x2BB, L_8046D2F
L_8046D38:
    a_destroy

NPC_8046D39:
    a_init
    a_set_dialog 0x15
    a_sprite_mask_set_flag 0x3
    a_set_sprite 0x32
    a_set_pos -380, -28
    a_set_sprite_frame 3
L_8046D49:
    a_wait 1
    a_jump L_8046D49

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
    a_jump_if_flag 0x2B9, L_8046D95
    a_init
    a_disable_turn
    a_set_dialog 0x0
    a_set_sprite 0xE3
    a_set_palette 0x0
    a_set_pos -230, 418, 96
    a_set_radius 4
    a_set_sprite_frame 0
L_8046D8A:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag 0x2B9, L_8046D8A
L_8046D95:
    a_destroy

NPC_8046D96:
    a_jump_if_flag 0x2BC, L_8046DBB
    a_init
    a_disable_turn
    a_set_dialog 0x1
    a_set_sprite 0xE3
    a_set_palette 0x0
    a_set_pos 152, -200, 64
    a_set_radius 4
    a_set_sprite_frame 0
L_8046DB0:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag 0x2BC, L_8046DB0
L_8046DBB:
    a_destroy

    .align 2, 0

NPC_8046DBC:
    a_jump_if_flag 0x2BF, L_8046DE1
    a_init
    a_disable_turn
    a_set_dialog 0x2
    a_set_sprite 0xE3
    a_set_palette 0x0
    a_set_pos -230, -124, 96
    a_set_radius 4
    a_set_sprite_frame 0
L_8046DD6:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
.byte 0x5
.short 0x2BF
.word 0x8046dd6
L_8046DE1:
.byte 3
.byte 0
.byte 0
@     a_jump_if_not_flag 0x2BF, L_8046DD6
@ L_8046DE1:
@     a_destroy

@     .align 2, 0

global_label NPCList_8046DE4
    .word NPC_8046DEC
    .word 0xFF

    .align 2, 0

NPC_8046DEC:
    a_jump_if_flag 0x2BA, L_8046E0F
    a_init
    a_disable_turn
    a_set_dialog 0x0
    a_set_sprite 0xE3
    a_set_palette 0x0
    a_set_pos -34, -166, 64
    a_set_radius 4
    a_set_sprite_frame 0
L_8046E06:
    a_wait 1
    a_jump_if_not_flag 0x2BA, L_8046E06
L_8046E0F:
    a_destroy

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
    a_jump_if_flag 0x2BD, L_8046E4B
    a_init
    a_disable_turn
    a_set_dialog 0x0
    a_set_sprite 0xE3
    a_set_palette 0x0
    a_set_pos 80, -214
    a_set_radius 4
    a_set_sprite_frame 0
L_8046E42:
    a_wait 1
    a_jump_if_not_flag 0x2BD, L_8046E42
L_8046E4B:
    a_destroy

    .align 2, 0

NPC_8046E4C:
    a_init
    a_set_dialog 0x14
    a_set_sprite 0x16
    a_set_pos -238, -18, 64
    a_set_sprite_frame 7
L_8046E5A:
    a_wait 1
    a_jump L_8046E5A

NPC_8046E61:
    a_init
    a_set_dialog 0x15
    a_set_sprite 0x16
    a_set_pos 190, 118, 96
    a_set_sprite_frame 7
L_8046E6F:
    a_wait 1
    a_jump L_8046E6F

    .align 2, 0

global_label NPCList_8046E78
    .word NPC_8046E80
    .word 0xFF

    .align 2, 0

NPC_8046E80:
    a_jump_if_flag 0x2BE, L_8046EA3
    a_init
    a_disable_turn
    a_set_dialog 0x0
    a_set_sprite 0xE3
    a_set_palette 0x0
    a_set_pos -12, 2, -96
    a_set_radius 4
    a_set_sprite_frame 0
L_8046E9A:
    a_wait 1
    a_jump_if_not_flag 0x2BE, L_8046E9A
L_8046EA3:
    a_destroy

global_label NPCList_8046EA4
    .word NPC_8046EB4
    .word NPC_8046EEF
    .word NPC_8046E80
    .word 0xFF

    .align 2, 0

NPC_8046EB4:
    a_init
    a_set_sprite 0x37
    a_set_pos 54, 380, -96
    a_set_sprite_frame 7
L_8046EC0:
    a_jump_if_flag 0xC5, L_8046ECE
    a_wait 1
    a_jump L_8046EC0
L_8046ECE:
    a_set_sprite_frame 16
    a_set_sprite_frame 17
    a_move d_se, 40, 4
    a_set_sprite_frame 18
L_8046ED8:
    a_jump_if_flag 0xC6, L_8046EE6
    a_wait 1
    a_jump L_8046ED8
L_8046EE6:
    a_set_sprite_frame 12
L_8046EE8:
    a_wait 1
    a_jump L_8046EE8

NPC_8046EEF:
    a_init
    a_set_sprite 0x35
    a_set_pos 54, 360, -96
    a_set_sprite_frame 12
L_8046EFB:
    a_jump_if_flag 0xC3, L_8046F09
    a_wait 1
    a_jump L_8046EFB
L_8046F09:
    a_set_sprite_frame 13
    a_wait 9
    a_set_flag 0xC5
    a_set_sprite_frame 14
    a_wait 9
    a_set_flag 0xCA
    a_wait 60
    a_set_sprite_frame 3
L_8046F1B:
    a_jump_if_flag 0xC4, L_8046F29
    a_wait 1
    a_jump L_8046F1B
L_8046F29:
    a_set_sprite_frame 15
    a_wait 9
    a_set_flag 0xC8
    a_wait 60
    a_set_sprite_frame 5
L_8046F34:
    a_wait 1
    a_jump L_8046F34

    .align 2, 0

global_label NPCList_8046F3C
    .word NPC_8046F48
    .word NPC_8046E80
    .word 0xFF

    .align 2, 0

NPC_8046F48:
    a_init
    a_set_sprite 0x35
    a_set_pos 54, 360, -96
    a_set_sprite_frame 5
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
    a_set_sprite_frame 3
    a_wait 45
    a_set_sprite_frame 16
L_8046F78:
    a_jump_if_flag 0xCC, L_8046F86
    a_wait 1
    a_jump L_8046F78
L_8046F86:
    a_set_sprite_frame 5
L_8046F88:
    a_wait 1
    a_jump L_8046F88

    .align 2, 0

global_label EntityAllocParams_8046F90
    entity Effect, 0x23, f(-314, 36, 64), 0xFF000020
    entity Effect, 0x24, f(-314, 60, 0), 0x10520
    .word 0xFF

global_label EntityAllocParams_8046FBC
    entity Effect, 0x23, f(-82, 316, 64), 0xFFFF0021
    entity Effect, 0x24, f(-82, 340, 0), 0xFF010521
    entity Effect, 0x23, f(-188, 50, 64), 0xFF000122
    entity Effect, 0x25, f(-212, 50, 0), 0xFF000622
    entity Effect, 0x25, f(-244, 50, 0), 0xFF000622
    entity Effect, 0x25, f(-276, 50, 0), 0xFF000622
    entity Effect, 0x25, f(-308, 50, 0), 0xFF000622
    entity Effect, 0x25, f(-340, 50, 0), 0xFF000622
    entity Effect, 0x25, f(-372, 50, 0), 0xFF000622
    entity Effect, 0x25, f(-404, 50, 0), 0xFF000622
    entity Effect, 0x24, f(-212, 50, 0), 0xFF000522
    entity Effect, 0x23, f(132, -270, 64), 0xFF000123
    entity Effect, 0x25, f(110, -270, 0), 0xFF010623
    entity Effect, 0x25, f(78, -270, 0), 0xFF010623
    entity Effect, 0x25, f(46, -270, 0), 0xFF010623
    entity Effect, 0x24, f(108, -270, 0), 0xFF010523
    .word 0xFF

global_label EntityAllocParams_8047100
    entity Effect, 0x23, f(-322, -148, 128), 0xFF000024
    entity Effect, 0x24, f(-322, -124, 96), 0xFF010324
    entity Effect, 0x23, f(-174, -94, 96), 0xFF000126
    entity Effect, 0x24, f(-198, -94, 64), 0xFF010326
    entity Effect, 0x23, f(178, 100, 96), 0xFF000127
    entity Effect, 0x25, f(158, 100, 64), 0xFF000627
    entity Effect, 0x25, f(126, 100, 64), 0xFF000627
    entity Effect, 0x25, f(94, 100, 64), 0xFF000627
    entity Effect, 0x24, f(154, 100, 64), 0xFF000327
    .word 0xFF

global_label EntityAllocParams_80471B8
    entity Effect, 0x23, f(140, 46, 96), 0xFF000129
    entity Effect, 0x25, f(114, 44, 64), 0xFF000629
    entity Effect, 0x25, f(82, 44, 64), 0xFF000629
    entity Effect, 0x25, f(50, 44, 64), 0xFF000629
    entity Effect, 0x25, f(18, 44, 64), 0xFF000629
    entity Effect, 0x25, f(-14, 44, 64), 0xFF000629
    entity Effect, 0x25, f(-46, 44, 64), 0xFF000629
    entity Effect, 0x25, f(-78, 44, 64), 0xFF000629
    entity Effect, 0x25, f(-110, 44, 64), 0xFF000629
    entity Effect, 0x24, f(116, 46, 64), 0xFF000329
    entity Effect, 0x23, f(-14, -236, 96), 0xFF000028
    entity Effect, 0x25, f(-12, -210, 64), 0xFF000828
    entity Effect, 0x25, f(-12, -178, 64), 0xFF000828
    entity Effect, 0x25, f(-12, -146, 64), 0xFF000828
    entity Effect, 0x25, f(-12, -114, 64), 0xFF000828
    entity Effect, 0x25, f(-12, -82, 64), 0xFF000828
    entity Effect, 0x25, f(-12, -50, 64), 0xFF000828
    entity Effect, 0x25, f(-12, -18, 64), 0xFF000828
    entity Effect, 0x24, f(-14, -212, 64), 0xFF000328
    .word 0xFF

global_label EntityAllocParams_8047338
    entity Effect, 0x23, f(-188, 66, -32), 0xFF00012A
    entity Effect, 0x25, f(-212, 66, -96), 0xFF00062A
    entity Effect, 0x25, f(-244, 66, -96), 0xFF00062A
    entity Effect, 0x25, f(-276, 66, -96), 0xFF00062A
    entity Effect, 0x24, f(-212, 66, -96), 0xFF00052A
    .word 0xFF
