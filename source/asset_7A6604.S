    .include "constants.inc"
    .include "macros.inc"

    .text

global_label tilesetRarityStars
    .incbin "images/library/rarity.4bpp"
global_label tilesetNewTag
    .incbin "images/library/new_tag.4bpp"
global_label tilesetChipLibraryNumbers
    .incbin "images/library/numbers.4bpp"
global_label tilesetUnk_87A6D44
    .incbin "images/library/007A6D44.4bpp"
global_label tilemapArmorNone
    .incbin "images/menu_megaman/armor_none.tilemap"
global_label tilemapArmorHeat
    .incbin "images/menu_megaman/armor_heat.tilemap"
global_label tilemapArmorAqua
    .incbin "images/menu_megaman/armor_aqua.tilemap"
global_label tilemapArmorWood
    .incbin "images/menu_megaman/armor_wood.tilemap"
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

    .end
