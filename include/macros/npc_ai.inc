    .set NPC_LIST_END, 0xFF

    .set d_n,   0
    .set d_ne,  1
    .set d_e,   2
    .set d_se,  3
    .set d_s,   4
    .set d_sw,  5
    .set d_w,   6
    .set d_nw,  7

    .macro a_end
    .byte 0x0
    .endm

    .macro a_jump addr
    .byte 0x2
    .word \addr
    .endm

    .macro a_destroy
    .byte 0x03
    .endm

    .macro a_jump_if_flag flag addr
    .byte 0x4
    .short \flag & 0xFFFF
    .word \addr
    .endm

    .macro a_jump_if_not_flag flag addr
    .byte 0x5
    .short \flag & 0xFFFF
    .word \addr
    .endm

    .macro a_set_flag flag
    .byte 0x6
    .short \flag & 0xFFFF
    .endm

    .macro a_clear_flag flag
    .byte 0x7
    .short \flag & 0xFFFF
    .endm

    .macro a_init
    .byte 0x8
    .endm

    .macro a_init_no_sprite
    .byte 0x09
    .endm

    .macro a_set_radius radius
    .byte 0xA
    .byte \radius & 0xFF
    .endm

    .macro a_set_height height
    .byte 0xB
    .byte \height & 0xFF
    .endm

    .macro a_set_hitbox_offset x y z=0
    .byte 0xC
    .byte \x & 0xFF
    .byte \y & 0xFF
    .byte \z & 0xFF
    .endm

    .macro a_enable_dialog
    .byte 0x0D
    .endm

    .macro a_disable_dialog
    .byte 0x0E
    .endm

    .macro a_set_palette index
    .byte 0xF
    .byte \index & 0xFF
    .endm

    .macro a_wait frame
    .byte 0x10
    .byte \frame
    .endm

    .macro a_drop initial accel
    .byte 0x11
    .byte \initial & 0xFF
    .byte \accel & 0xFF
    .endm

    .macro a_enable_turn
    .byte 0x12
    .endm

    .macro a_disable_turn
    .byte 0x13
    .endm

    .macro a_set_pos x y z=0
    .byte 0x14
    .short \x & 0xFFFF
    .short \y & 0xFFFF
    .short \z & 0xFFFF
    .endm

    .macro a_move dir speed dist
    .byte 0x15
    .byte \dir
    .byte \speed & 0xFF
    .byte \dist & 0xFF
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

    .macro a_sprite_auto_priority
    .byte 0x1A
    .endm

    .macro a_sprite_high_priority
    .byte 0x1A
    .endm

    .macro a_sprite_low_priority
    .byte 0x1B
    .endm

    .macro a_sprite_mask mask
    .byte 0x1C
    .word \mask & 0xFFFFFFFF
    .endm

    .macro a_sprite_mask_set_flag flag
    .byte 0x1D
    .byte \flag & 0xFF
    .endm

    .macro a_sprite_mask_clear_flag flag
    .byte 0x1E
    .byte \flag & 0xFF
    .endm

    .macro a_disable_collision
    .byte 0x1F
    .endm

    .macro a_enable_collision
    .byte 0x20
    .endm

    .macro a_set_no_z_clip
    .byte 0x21
    .endm

    .macro a_set_z_clip
    .byte 0x22
    .endm

    .macro a_clear_z_clip
    .byte 0x23
    .endm

    .macro a_set_sprite_ex index
    .byte 0x24
    .short \index & 0xFFFF
    .endm
