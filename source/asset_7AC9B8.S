    .include "constants.inc"
    .include "macros.inc"

    .text

    .incbin "text/shop/standard.script"
    .incbin "text/shop/robotic.script"
    .incbin "text/shop/rude.script"

global_label TextData_BattleChip_Codes
    .incbin "text/battlechip/codes.script"
    .incbin "text/shop/stock_description.script"

global_label tilesetCapcomLogo
    .incbin "images/splash/capcom_logo.4bpp"
global_label paletteCapcomLogo
    .incbin "images/splash/capcom_logo.gbapal"
global_label tilemapCapcomLogo
    .incbin "images/splash/capcom_logo.bin"
    .end
