    .macro hp amt
    .short \amt
    .endm

    .macro zenny amt
    .short 0x8000 | (\amt & 0x7FFF)
    .endm

    .macro battlechip id, code
    .byte CD_\id, CC_\code
    .endm

    .macro damage dmg
    .short \dmg
    .endm

    .macro chip_icon index
    .word tilesetChipIcons + \index * 128
    .endm

    .macro chip_art index
    .word tilesetChipArt + \index * 32 * 8 * 7
    .word paletteChipArt + \index * 32
    .endm

    .macro codes c1=None, c2=None, c3=None, c4=None, c5=None
    .byte CC_\c1, CC_\c2, CC_\c3, CC_\c4, CC_\c5
    .endm

    .macro nocodes
    .byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
    .endm

    .macro element elem
    .byte EL_\elem
    .endm

    .macro routine rt
    .byte \rt
    .endm

    .macro lzSprite index
    .byte \index
    .short 0
    .endm

    .macro noelement
    .byte EL_None
    .endm

    .macro hp_pos ht
    .byte \ht & 0xFF
    .endm

    .macro family main, sub
    .byte \main * 4, \sub
    .endm

    .macro nofamily
    .byte 0xFF, 0
    .endm

    .macro rarity r
    .byte \r -1
    .endm

    .macro norarity
    .byte 0xFF
    .endm

    .macro library index
    .byte \index
    .endm

    .macro nolibrary
    .byte 0xFF
    .endm

    .macro spawn enemyId, x, y
    .byte ED_\enemyId
    .byte \x
    .byte \y
    .byte 0
    .endm

    .macro spawn_end
    spawn Invalid, 0, 0
    .endm

    .macro encounter threshold spawnlist
    .byte \threshold
    .byte 0
    .byte 0
    .byte 0
    .word \spawnlist
    .endm

    .macro encounter_boss threshold spawnlist
    .byte \threshold
    .byte 1
    .byte 0
    .byte 0
    .word \spawnlist
    .endm
