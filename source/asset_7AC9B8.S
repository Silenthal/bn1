    .include "constants.inc"
    .include "macros.inc"

    .text

    .incbin "text/shop/standard.script"
    .incbin "text/shop/robotic.script"
    .incbin "text/shop/rude.script"

global_label textDict_BattleChip_Codes
    .incbin "text/battlechip/codes.script"
    .incbin "text/shop/stock_description.script"

    .end
