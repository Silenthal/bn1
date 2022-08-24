    .include "constants.inc"
    .include "macros.inc"

    .text
    
    .incbin "images/ui/palette_061FB28.gbapal"
    .incbin "images/ui/palette_061FB48.gbapal"
    
    global_label tilesetKeyboardNumberChars
    .incbin "images/ui/keyboard.4bpp"

    global_label tilesetDialogueText
    .incbin "images/ui/charset.4bpp"

    global_label paletteKeyboardNumberChars
    .incbin "images/ui/keyboard.gbapal"

    global_label paletteChipLibraryArrow
    .incbin "images/ui/chipLibraryArrow.gbapal"

    .incbin "images/ui/palette_061BAE8.gbapal"

    global_label tilesetBoldAlphanumeric
    .incbin "images/ui/charset_bold.4bpp"

    global_label paletteUIBoldText
    .incbin "images/ui/charset_bold.gbapal"

    .incbin "images/ui/palette_061FB28.gbapal"
    .incbin "images/ui/palette_061FB48.gbapal"

    global_label tilesetDialogueWindowBorder
    .incbin "images/ui/window_border.4bpp"

    global_label tilesetArrowVert0
    .incbin "images/ui/arrow_vert_0.4bpp"

    global_label tilesetArrowVert1
    .incbin "images/ui/arrow_vert_1.4bpp"

    global_label tilesetArrowVert2
    .incbin "images/ui/arrow_vert_2.4bpp"

    global_label tilesetArrowHori0
    .incbin "images/ui/arrow_hori_0.4bpp"

    global_label tilesetArrowHori1
    .incbin "images/ui/arrow_hori_1.4bpp"

    global_label tilesetArrowHori2
    .incbin "images/ui/arrow_hori_2.4bpp"

    .end
