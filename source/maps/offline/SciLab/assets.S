#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

global_label NPCList_803D1EC
    .word NPC_803D1F4
    .word 0xFF

    .align 2, 0

NPC_803D1F4:
    a_init
    a_set_dialog 0x0
    a_set_sprite 0x2F
    a_set_pos -236, -122
    a_set_sprite_frame 5
L_803D202:
    a_wait 1
    a_jump L_803D202

    .align 2, 0

global_label NPCList_803D20C
    .word NPC_803D214
    .word 0xFF

    .align 2, 0

NPC_803D214:
    a_init
    a_set_dialog 0x5
    a_set_sprite 0x2F
    a_set_pos -280, -126
    a_set_sprite_frame 1
L_803D222:
    a_wait 1
    a_jump L_803D222

    .align 2, 0

global_label NPCList_803D22C
    .word NPC_803D25C
    .word NPC_803D271
    .word NPC_803D286
    .word NPC_803D29B
    .word NPC_803D2C0
    .word NPC_803D2D5
    .word NPC_803D2EA
    .word NPC_803D2FF
    .word NPC_803D32A
    .word NPC_803D33F
    .word NPC_803D354
    .word 0xFF

    .align 2, 0

NPC_803D25C:
    a_init
    a_set_dialog 0x0
    a_set_sprite 0x2F
    a_set_pos -106, 44
    a_set_sprite_frame 3
L_803D26A:
    a_wait 1
    a_jump L_803D26A

NPC_803D271:
    a_init
    a_set_dialog 0x1
    a_set_sprite 0x30
    a_set_pos 50, 198
    a_set_sprite_frame 1
L_803D27F:
    a_wait 1
    a_jump L_803D27F

NPC_803D286:
    a_init
    a_set_dialog 0x2
    a_set_sprite 0x31
    a_set_pos -256, 210
    a_set_sprite_frame 1
L_803D294:
    a_wait 1
    a_jump L_803D294

NPC_803D29B:
    a_init
    a_set_dialog 0x3
    a_set_sprite 0x56
    a_set_pos -124, 256
L_803D2A7:
    a_set_sprite_frame 10
    a_move d_sw, 8, 10
    a_set_sprite_frame 7
    a_wait 30
    a_set_sprite_frame 8
    a_move d_ne, 8, 10
    a_set_sprite_frame 7
    a_wait 30
    a_jump L_803D2A7

    .align 2, 0

NPC_803D2C0:
    a_init
    a_set_dialog 0x4
    a_set_sprite 0x31
    a_set_pos -44, 100
    a_set_sprite_frame 7
L_803D2CE:
    a_wait 1
    a_jump L_803D2CE

NPC_803D2D5:
    a_init
    a_set_dialog 0x5
    a_set_sprite 0xA
    a_set_pos -230, 20
    a_set_sprite_frame 5
L_803D2E3:
    a_wait 1
    a_jump L_803D2E3

NPC_803D2EA:
    a_init
    a_set_dialog 0x6
    a_set_sprite 0x55
    a_set_pos -136, 120
    a_set_sprite_frame 3
L_803D2F8:
    a_wait 1
    a_jump L_803D2F8

NPC_803D2FF:
    a_jump_if_flag 0x9F, L_803D329
    a_init
    a_disable_turn
    a_set_dialog 0x12
    a_set_sprite 0x3E
    a_set_pos -120, 138
    a_set_sprite_frame 5
L_803D315:
    a_jump_if_flag 0x9E, L_803D323
    a_wait 1
    a_jump L_803D315
L_803D323:
    a_set_sprite_frame 8
    a_move d_ne, 8, 20
L_803D329:
    a_destroy

NPC_803D32A:
    a_init
    a_set_dialog 0x23
    a_set_sprite 0x1B
    a_set_pos -198, 38
    a_set_sprite_frame 3
L_803D338:
    a_wait 1
    a_jump L_803D338

NPC_803D33F:
    a_init
    a_set_dialog 0x25
    a_set_sprite 0x19
    a_set_pos -252, 148
    a_set_sprite_frame 1
L_803D34D:
    a_wait 1
    a_jump L_803D34D

    .align 2, 0

NPC_803D354:
    a_init
    a_set_dialog 0x24
    a_set_sprite 0x1A
    a_set_pos 78, 194
    a_set_sprite_frame 5
L_803D362:
    a_wait 1
    a_jump L_803D362

    .align 2, 0

global_label NPCList_803D36C
    .word NPC_803D25C
    .word NPC_803D271
    .word NPC_803D286
    .word NPC_803D29B
    .word NPC_803D2C0
    .word NPC_803D2D5
    .word NPC_803D2EA
    .word NPC_803D32A
    .word NPC_803D33F
    .word NPC_803D354
    .word 0xFF

global_label NPCList_803D398
    .word NPC_803D25C
    .word NPC_803D271
    .word NPC_803D286
    .word NPC_803D29B
    .word NPC_803D2C0
    .word NPC_803D2EA
    .word NPC_803D32A
    .word NPC_803D33F
    .word NPC_803D354
    .word 0xFF

global_label NPCList_803D3C0
    .word NPC_803D25C
    .word NPC_803D271
    .word NPC_803D286
    .word NPC_803D29B
    .word NPC_803D2C0
    .word NPC_803D3E8
    .word NPC_803D32A
    .word NPC_803D33F
    .word NPC_803D354
    .word 0xFF

    .align 2, 0

NPC_803D3E8:
    a_init
    a_disable_turn
    a_set_dialog 0x6
    a_set_sprite 0x55
    a_set_pos -136, 120
    a_set_sprite_frame 3
L_803D3F7:
    a_wait 1
    a_jump L_803D3F7

    .align 2, 0

global_label NPCList_803D400
    .word NPC_803D40C
    .word NPC_803D434
    .word 0xFF

    .align 2, 0

NPC_803D40C:
    a_init
    a_set_dialog 0x14
    a_set_sprite 0x56
    a_set_pos -124, 256
L_803D418:
    a_set_sprite_frame 10
    a_move d_sw, 8, 10
    a_set_sprite_frame 7
    a_wait 30
    a_set_sprite_frame 8
    a_move d_ne, 8, 10
    a_set_sprite_frame 7
    a_wait 30
    a_jump L_803D418

    .align 2, 0

    .align 2, 0

NPC_803D434:
    a_init
    a_set_dialog 0xBE
    a_set_sprite 0x1E
    a_set_pos -228, 250
    a_set_sprite_frame 7
L_803D442:
    a_wait 1
    a_jump L_803D442

    .align 2, 0

global_label NPCList_803D44C
    .word NPC_803D454
    .word 0xFF

    .align 2, 0

NPC_803D454:
    a_init
    a_set_dialog 0x0
    a_set_sprite 0x2F
    a_set_pos -280, -110
    a_set_sprite_frame 7
L_803D462:
    a_wait 1
    a_jump L_803D462

    .align 2, 0

global_label NPCList_803D46C
    .word NPC_803D474
    .word 0xFF

    .align 2, 0

NPC_803D474:
    a_init
    a_set_dialog 0x5
    a_set_sprite 0x2F
    a_set_pos -280, -110
    a_set_sprite_frame 3
L_803D482:
    a_wait 1
    a_jump L_803D482

    .align 2, 0

global_label NPCList_803D48C
    .word NPC_803D498
    .word NPC_803D4B5
    .word 0xFF

    .align 2, 0

NPC_803D498:
    a_init
    a_set_dialog 0x0
    a_set_sprite 0x31
    a_set_pos -334, 10
    a_set_sprite_frame 7
L_803D4A6:
    a_jump_if_flag 0xAF, L_803D4B4
    a_wait 1
    a_jump L_803D4A6
L_803D4B4:
    a_destroy

NPC_803D4B5:
    a_init
    a_set_dialog 0x1
    a_set_sprite 0x2F
    a_set_pos -46, 10
    a_set_sprite_frame 7
L_803D4C3:
    a_wait 1
    a_jump L_803D4C3

    .align 2, 0

global_label NPCList_803D4CC
    .word NPC_803D4B5
    .word 0xFF

global_label NPCList_803D4D4
    .word NPC_803D4DC
    .word 0xFF

    .align 2, 0

NPC_803D4DC:
    a_init
    a_set_dialog 0x5
    a_set_sprite 0x2F
    a_set_pos -80, 10
    a_set_sprite_frame 3
L_803D4EA:
    a_wait 1
    a_jump L_803D4EA

    .align 2, 0

global_label NPCList_803D4F4
    .word NPC_803D510
    .word NPC_803D535
    .word 0xFF

global_label NPCList_803D500
    .word NPC_803D510
    .word NPC_803D535
    .word NPC_803D54C
    .word 0xFF

    .align 2, 0

NPC_803D510:
    a_init
    a_set_dialog 0xB
    a_set_sprite 0x31
    a_set_pos -334, 82
L_803D51C:
    a_set_sprite_frame 7
    a_wait 30
    a_set_sprite_frame 8
    a_move d_ne, 8, 8
    a_set_sprite_frame 7
    a_wait 30
    a_set_sprite_frame 10
    a_move d_sw, 8, 8
    a_jump L_803D51C

NPC_803D535:
    a_init
    a_set_dialog 0xA
    a_set_sprite 0x2F
    a_set_pos 12, 50
    a_set_sprite_frame 1
L_803D543:
    a_wait 1
    a_jump L_803D543

    .align 2, 0

    .align 2, 0

NPC_803D54C:
    a_init
    a_set_dialog 0xBE
    a_set_sprite 0x31
    a_set_pos -370, 38
    a_set_sprite_frame 1
L_803D55A:
    a_wait 1
    a_jump L_803D55A

    .align 2, 0

global_label NPCList_803D564
    .word NPC_803D56C
    .word 0xFF

    .align 2, 0

NPC_803D56C:
    a_init
    a_set_dialog 0x0
    a_set_sprite 0x31
    a_set_sprite_frame 1
    a_set_pos 22, 44
L_803D57A:
    a_jump_if_flag 0xB1, L_803D588
    a_wait 1
    a_jump L_803D57A
L_803D588:
    a_set_sprite_frame 11
    a_move d_nw, 8, 3
    a_set_sprite_frame 7
L_803D590:
    a_wait 1
    a_jump L_803D590

    .align 2, 0

global_label NPCList_803D598
    .word NPC_803D5A0
    .word 0xFF

    .align 2, 0

NPC_803D5A0:
    a_init
    a_set_dialog 0x5
    a_set_sprite 0x31
    a_set_pos 22, 44
    a_set_sprite_frame 1
L_803D5AE:
    a_wait 1
    a_jump L_803D5AE

    .align 2, 0

global_label NPCList_803D5B8
    .word NPC_803D5C0
    .word 0xFF

    .align 2, 0

NPC_803D5C0:
    a_init
    a_set_dialog 0x0
    a_set_sprite 0x31
    a_set_sprite_frame 7
    a_set_pos 22, 20
L_803D5CE:
    a_wait 1
    a_jump L_803D5CE

    .align 2, 0

global_label NPCList_803D5D8
    .word NPC_803D5E0
    .word 0xFF

    .align 2, 0

NPC_803D5E0:
    a_init
    a_set_dialog 0x0
    a_set_sprite 0x31
    a_set_sprite_frame 7
    a_set_pos 22, 44
L_803D5EE:
    a_wait 1
    a_jump L_803D5EE

    .align 2, 0

global_label NPCList_803D5F8
    .word NPC_803D604
    .word NPC_803D62B
    .word 0xFF

    .align 2, 0

NPC_803D604:
    a_init
    a_set_dialog 0xA
    a_set_sprite 0x31
    a_set_pos -124, 30
    a_set_sprite_frame 1
L_803D612:
    a_set_sprite_frame 9
    a_move d_se, 8, 6
    a_set_sprite_frame 1
    a_wait 30
    a_set_sprite_frame 11
    a_move d_nw, 8, 6
    a_set_sprite_frame 1
    a_wait 30
    a_jump L_803D612

NPC_803D62B:
    a_init
    a_set_dialog 0xB
    a_set_sprite 0x31
    a_set_pos 22, 44
    a_set_sprite_frame 1
L_803D639:
    a_wait 1
    a_jump L_803D639

global_label NPCList_803D640
    .word NPC_803D650
    .word 0xFF

global_label NPCList_803D648
    .word NPC_803D679
    .word 0xFF

    .align 2, 0

NPC_803D650:
    a_init
    a_set_sprite 0x31
    a_set_sprite_frame 7
    a_set_pos 8, 28
L_803D65C:
    a_jump_if_flag 0xE0, L_803D66A
    a_wait 1
    a_jump L_803D65C
L_803D66A:
    a_set_sprite_frame 11
    a_move d_nw, 32, 17
    a_set_sprite_frame 7
L_803D672:
    a_wait 1
    a_jump L_803D672

NPC_803D679:
    a_init
    a_set_sprite 0x31
    a_set_sprite_frame 7
    a_set_pos 8, -108
L_803D685:
    a_wait 1
    a_jump L_803D685

global_label EntityAllocParams_803D68C
    entity Effect, 0x1, f(6, -136, 0), 0x3F
    .word 0xFF
