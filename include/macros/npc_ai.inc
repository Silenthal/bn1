    .set NPC_LIST_END, 0xFF
    .set d_n,   0
    .set d_ne,  1
    .set d_e,   2
    .set d_se,  3
    .set d_s,   4
    .set d_sw,  5
    .set d_w,   6
    .set d_nw,  7

    .macro a_jump addr
    .byte 0x2
    .word \addr
    .endm

    .macro a_jump_flag flag addr
    .byte 0x4
    .short \flag & 0xFFFF
    .word \addr
    .endm

    .macro a_jump_not_flag flag addr
    .byte 0x5
    .short \flag & 0xFFFF
    .word \addr
    .endm

    .macro a_init
    .byte 0x8
    .endm

    .macro a_init_nosprite
    .byte 0x09
    .endm

    .macro ax_set_0C val
    .byte 0xA
    .byte \val & 0xFF
    .endm

    .macro a_wait frame
    .byte 0x10
    .byte \frame
    .endm

    .macro a_sprite_dir_on
    .byte 0x12
    .endm

    .macro a_sprite_dir_off
    .byte 0x13
    .endm

    .macro a_set_pos_16 x y z=0
    .byte 0x14
    .short \x & 0xFFFF
    .short \y & 0xFFFF
    .short \z & 0xFFFF
    .endm

    .macro a_dir dir ic ct
    .byte 0x15
    .byte \dir
    .byte \ic & 0xFF
    .byte \ct & 0xFF
    .endm

    .macro a_set_sprite_frame index
    .byte 0x16
    .byte \index & 0xFF
    .endm

    .macro a_set_sprite index
    .byte 0x17
    .byte \index & 0xFF
    .endm

    .macro a_set_dialog index
    .byte 0x18
    .byte \index & 0xFF
    .endm

    .macro ax_set_flag_64 val
    .byte 0x1D
    .byte \val & 0xFF
    .endm

    .macro a_cmd_0E_set_flag_1
    .byte 0x0E
    .endm

    .macro a_cmd_1F_set_flag_4
    .byte 0x1F
    .endm
