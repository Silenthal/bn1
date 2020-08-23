    .include "constants.inc"
    .include "macros.inc"

    .text

global_label tileset8ThankYouMessage0
    .incbin "images/other/demo_message.8bpp", 0, 0x3C00

global_label tileset8ThankYouMessage1
    .incbin "images/other/demo_message.8bpp", 0x3C00, 0x3C00

global_label tileset8ThankYouMessage2
    .incbin "images/other/demo_message.8bpp", 0x7800, 0x1E00

global_label palette8ThankYouMessage
    .incbin "images/other/demo_message.gbapal"

    .end
