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
