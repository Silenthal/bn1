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

global_label tilesetMenuDesign
    .incbin "images/menu/design.4bpp"

global_label tilesetNoChip
    .incbin "images/start_menu/no_chip.4bpp"

global_label paletteMenuDesign
    .incbin "images/menu/design.gbapal"

global_label paletteFolder2
    .incbin "images/start_menu/library/palette_07A2DE4.gbapal"
    .incbin "images/start_menu/library/palette_07A2E64.gbapal"

global_label tilemapFolderFrameFolder
    .incbin "images/start_menu/folder/folder_frame.tilemap"

global_label tilemapFolderFrameSack
    .incbin "images/start_menu/folder/sack_frame.tilemap"

global_label tilemapFolderSortList
    .incbin "images/start_menu/folder/folder_sort_list.tilemap"

global_label tilemapMenuLibrary
    .incbin "images/start_menu/library/library.tilemap"

global_label tilemapMenuMegaMan
    .incbin "images/start_menu/megaman/megaman.tilemap"

global_label tilemapMenuEmail
    .incbin "images/start_menu/email/email.tilemap"

global_label tilemapMenuItem
    .incbin "images/start_menu/item/item.tilemap"

global_label tilemapMenuNetwork
    .incbin "images/start_menu/network/network.tilemap"

global_label tilemapMenuNetworkTrade
    .incbin "images/start_menu/network/network_trade.tilemap"

global_label tilemapMenuNetwork3
    .incbin "images/start_menu/network/network3.tilemap"

global_label tilemapMenuNetwork4
    .incbin "images/start_menu/network/network4.tilemap"

global_label tilemapMenuSave
    .incbin "images/start_menu/save/save.tilemap"

global_label tilemapChipTrader
    .incbin "images/chip_trader/chip_trader.tilemap"

global_label tilemapChipTraderFrameLeft
    .incbin "images/chip_trader/chip_frame_left.tilemap"

global_label tilesetChipFrame
    .incbin "images/menu/chip_frame.4bpp"

global_label tilemapChipDetailBG
    .incbin "images/menu/chip_detail_bg.tilemap"

global_label TilemapEntry_ARRAY_087a6000
    .incbin "images/menu/007a6000.tilemap"

global_label paletteFolder1
    .incbin "images/menu/palette_07A6104_0.gbapal"
    .incbin "images/menu/palette_07A6104_1.gbapal"

global_label tilesetMenuSideArrow
    .incbin "images/menu/side_arrow.4bpp"

global_label tilesetMenuUpDownArrow
    .incbin "images/menu/up_down_arrow.4bpp"

global_label tilesetMenuMegaManSideArrow
    .incbin "images/start_menu/megaman/side_arrow.4bpp"

global_label tilesetRarityStars
    .incbin "images/start_menu/library/rarity.4bpp"

global_label tilesetNewTag
    .incbin "images/start_menu/library/new_tag.4bpp"

global_label tilesetChipLibraryNumbers
    .incbin "images/start_menu/library/numbers.4bpp"

global_label tilesetArmor
    .incbin "images/start_menu/megaman/armor.4bpp"

global_label tilemapArmorNone
    .incbin "images/start_menu/megaman/armor_none.tilemap"

global_label tilemapArmorHeat
    .incbin "images/start_menu/megaman/armor_heat.tilemap"

global_label tilemapArmorAqua
    .incbin "images/start_menu/megaman/armor_aqua.tilemap"

global_label tilemapArmorWood
    .incbin "images/start_menu/megaman/armor_wood.tilemap"

global_label textDict_MenuMessages
    .incbin "text/menu/messages.script"

global_label textDict_MailSubjects
    .incbin "text/mail/subjects.script"

global_label textDict_MailBodies
    .incbin "text/mail/bodies.script"

global_label textDict_ChipTrader
    .incbin "text/trader/messages.script"

global_label textDict_Credits
    .incbin "text/credits/main.script"

global_label tilesetElements
    .incbin "images/menu/chip_elements.4bpp"

global_label tilesetNumbers
    .incbin "images/menu/numbers.4bpp"

global_label tilesetMenuShopUi
    .incbin "images/shop/ui.4bpp"

    .end
