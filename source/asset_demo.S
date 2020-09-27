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

    .end
