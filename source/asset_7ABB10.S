    .include "constants.inc"
    .include "macros.inc"

    .text

global_label tilemapShopZennyDefault
    .incbin "images/shop/zenny.tilemap"
global_label tilesetShopNumbers
    .incbin "images/shop/numbers.4bpp"
global_label tilesetShopSideArrow
    .incbin "images/shop/side_arrow.4bpp"
global_label tilesetShopLight
    .incbin "images/shop/light.4bpp"
global_label tilesetShopDark
    .incbin "images/shop/dark.4bpp"
global_label tilesetShopUpDownArrow
    .incbin "images/shop/up_down_arrow.4bpp"
global_label tilemapShopBg
    .incbin "images/shop/bg.4bpp"
global_label paletteMenuShopUi
    .incbin "images/shop/ui.gbapal"
global_label paletteMenuShopBg
    .incbin "images/shop/bg.gbapal"

global_label textDictShopClerkStandard
    .incbin "text/shop/standard.script"
global_label textDictShopClerkRobotic
    .incbin "text/shop/robotic.script"
global_label textDictShopClerkRude
    .incbin "text/shop/rude.script"

global_label TextData_BattleChip_Codes
    .incbin "text/battlechip/codes.script"
global_label textDictShopDescription
    .incbin "text/shop/stock_description.script"

global_label tilesetCapcomLogo
    .incbin "images/splash/capcom_logo.4bpp"
global_label paletteCapcomLogo
    .incbin "images/splash/capcom_logo.gbapal"
global_label tilemapCapcomLogo
    .incbin "images/splash/capcom_logo.bin"
    .end
