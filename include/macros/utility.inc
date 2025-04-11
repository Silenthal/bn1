    .macro time_msf m, s, f
    .word 0x\m\s\f
    .endm

    .macro time_sf s, f
    .short 0x\s\f
    .endm

    .macro tilemap_entry tileIndex, flipFlags, paletteBank=0
    .short (\tileIndex & 0x3FF) | (\flipFlags & 0x3) << 10 | (\paletteBank & 0xF) << 12
    .endm

    .macro obj_attr_2 tileIndex, priority, paletteBank
    .short (\tileIndex & 0x3FF) | (\priority & 0x3) << 10 | (\paletteBank & 0xF) << 12
    .endm

    .macro cursor_attr xOff, yOff, flipFlags=0
    .byte \xOff
    .byte \yOff
    .short (\flipFlags & 0x3) << 12
    .endm

    .macro CpuSetControl wordCount, isSrcFixed, is32bit
    .word (\wordCount & 0x1FFFFF) | (\isSrcFixed & 1) << 24 | (\is32bit & 1) << 26
    .endm

    .macro bgcnt priority, base, use256, screen, wrap
    .short (\priority & 3) | (\base & 3) << 2 | (\use256 & 1) << 7 | (\screen & 31) << 8 | (\wrap & 1) << 13
    .endm

    .macro pos_xyz x, y, z
    .word \x
    .word \y
    .word \z
    .endm

    .macro cell_pos x, y
    .byte \x
    .byte \y
    .endm

    .macro MapEntrance mapId, dir, x, y, z
    .short \mapId
    .byte 0
    .byte \dir
    .word \x
    .word \y
    .word \z
    .endm

    @@ fade type - 2 for white fade out, not 4 for black fade out
    @@ 1 for fade in black, not 4 for fade in white
    .macro MapEntranceOpt mapId, dir, x, y, z, dialog=-1, flag=0, changeType=0, fadeType=-1
    .short \mapId
    .byte 0
    .byte \dir
    .word \x
    .word \y
    .word \z
    .byte \dialog
    .byte \flag
    .byte \changeType
    .byte \fadeType
    .endm

    .macro shop_item_key item, stock, price
    .byte 1
    .short Item_\item
    .byte \stock
    .word \price
    .endm

    .macro shop_item chip, code, stock, price
    .byte 0
    battlechip \chip, \code
    .byte \stock
    .word \price
    .endm

    .macro chip_trader_stock id, code_1=None, code_2=None, code_3=None, code_4=None, code_5=None
    .byte CD_\id, CC_\code_1, CC_\code_2, CC_\code_3, CC_\code_4, CC_\code_5, 0xFF, 0xFF
    .endm

    .macro chip_trader_stock_end
    .byte 0, -1, -1, -1, -1, -1, -1, -1
    .endm

    .macro rect x, y, w, h
    .byte \x, \y, \w, \h
    .endm

    .macro cam_set x, y, z
    .short 0
    .short \x
    .short \y
    .short \z
    .endm

    .macro cam_move dx, dy, dz, time_f
    .short 4
    .short \dx
    .short \dy
    .short \dz
    .short \time_f
    .endm

    .macro cam_wait time_f
    .short 0xC
    .short \time_f
    .endm

    .macro cam_shake strength, time_f
    .short 0x10
    .short \strength
    .short \time_f
    .endm

    .macro cam_end
    .short 8
    .endm

    .macro player_anim animId, dx, dy, time
    .byte \animId
    .byte \dx
    .byte \dy
    .byte \time
    .endm

    .macro tutorial_battle spawn, folder, type, shuffle
    .word \spawn
    .word \type
    .word \folder
    .byte \shuffle
    .byte 0, 0, 0
    .endm

    .macro fixed_battle spawn, bg, type, dir, x, y, z, canEscape=True
    .word \spawn
    .word 0
    .byte \bg
    .byte \type
    .byte 0
    .byte \dir
    .word \x
    .word \y
    .word \z
    .byte \canEscape
    .byte -1, -1, -1
    .endm

    .macro debug_str x, y, str
    .byte \x
    .byte \y
    .asciz "\str"
    .endm

    .macro Fade_Request fadeType, time, save_r5=0
    mov        r0,#\fadeType
    mov        r1,#\time
.if \save_r5
    push       {r5}
.endif
    bl         Fade_Request
.if \save_r5
    pop        {r5}
.endif
    .endm

    .macro FadeOut_Black
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    .endm

    .macro FadeIn_Black
    mov        r0,#0x3
    mov        r1,#0x10
    bl         Fade_Request
    .endm

    .macro FadeOutFast_Black
    mov        r0,#0x4
    mov        r1,#0x8
    bl         Fade_Request
    .endm

    .macro FadeInFast_Black
    mov        r0,#0x3
    mov        r1,#0x8
    bl         Fade_Request
    .endm

    .macro FadeOut_White
    mov        r0,#0x2
    mov        r1,#0x10
    bl         Fade_Request
    .endm

    .macro FadeIn_White
    mov        r0,#0x1
    mov        r1,#0x10
    bl         Fade_Request
    .endm

    .macro FadeOutFast_White
    mov        r0,#0x2
    mov        r1,#0x8
    bl         Fade_Request
    .endm

    .macro FadeInFast_White
    mov        r0,#0x1
    mov        r1,#0x8
    bl         Fade_Request
    .endm

    .macro FadeOut_ScreenDim
    mov        r0,#0x6
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    .endm

    .macro FadeIn_ScreenDim
    mov        r0,#0x5
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    .endm
