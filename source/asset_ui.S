    .include "constants.inc"
    .include "macros.inc"

    .text

    global_label tilesetKeyboardNumberChars
    .incbin "images/ui/keyboard.4bpp"

    global_label tilesetDialogueText
    .incbin "images/ui/charset.4bpp"

    global_label paletteKeyboardNumberChars
    .incbin "images/ui/keyboard.gbapal"

    .end
