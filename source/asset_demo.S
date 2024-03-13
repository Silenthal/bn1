    .include "constants.inc"
    .include "macros.inc"

    .text

global_label tileset8ThankYouMessage0
    .incbin "images/demo/message.8bpp", 0, 0x3C00

global_label tileset8ThankYouMessage1
    .incbin "images/demo/message.8bpp", 0x3C00, 0x3C00

global_label tileset8ThankYouMessage2
    .incbin "images/demo/message.8bpp", 0x7800, 0x1E00

global_label palette8ThankYouMessage
    .incbin "images/demo/message.gbapal"

global_label tilesetStartMenuText
    .incbin "images/start_menu/menu_text.4bpp"

global_label tilemapStartMenu
    .incbin "images/start_menu/menu.tilemap"

global_label paletteStartMenuNoSave
    .incbin "images/start_menu/menu_enabled.gbapal"
    .incbin "images/start_menu/menu_disabled.gbapal"

global_label paletteStartMenu
    .incbin "images/start_menu/menu_enabled.gbapal"
    .incbin "images/start_menu/menu_enabled.gbapal"

global_label tilesetStartMenuZenny
    .incbin "images/start_menu/zenny.4bpp"

global_label tilemapStartMenuZennyUi
    .incbin "images/start_menu/zenny.tilemap"

global_label tilesetStartMenuArrowNumbers
    .incbin "images/start_menu/arrow.4bpp"
    .incbin "images/start_menu/numbers.4bpp"

global_label tilesetChipLibrary
    .incbin "images/start_menu/library.4bpp"

global_label tilesetNoChip
    .incbin "images/start_menu/no_chip.4bpp"

global_label paletteChipLibrary
    .incbin "images/start_menu/library.gbapal"

    .end
