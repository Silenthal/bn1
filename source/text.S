#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set Sprite_Init, 0x8002460
    .set Sprite_InitFrames, 0x8002354
    .set Sprite_LoadPalette, 0x8002740
    .set Sprite_ProcessFrameDelay, 0x800239d
    .set Sprite_LoadTileset, 0x80027cc
    .set LC_Sprite_AddSpriteToOam, 0x8002338
    .set FUN_08018e4c, 0x8018e4c
    .set tilesetArrowVert0, 0x861fc88
    .set tilesetArrowVert1, 0x861fd08
    .set tilesetArrowVert2, 0x861fd88
    .set tileArrow0, 0x861fe08
    .set tileArrow1, 0x861fe88
    .set tileArrow2, 0x861ff08
    .set tilesetDialogueWindowBorder, 0x861fb68
    .set FUN_0801f974, 0x801f974
    .set Status_GetLevel, 0x801bf58
    .set Library_GetStandardChipCount, 0x801E814
    .set Passcode_Init, 0x8018dec
    .set FUN_080190cc, 0x80190cc
    .set FUN_080190dc, 0x80190dc
    .set Folder_GetChipCount, 0x801a640
    .set PlayerAnimation_Lock, 0x8056058
    .set PlayerAnimation_Get, 0x80560B4
    .set PlayerAnimation_Set, 0x8056074
    .set PlayerAnimation_Unlock, 0x8056064
    .set FUN_080025ec, 0x80025ec
    .set Area_GetBackgroundId, 0x8004674
    .set FUN_08004a10, 0x8004a10
    .set Encounter_SetEnemyList, 0x80098cc
    .set Battle_SetBattleParams, 0x8004610
    .set PTR_EnemySpawn_08014cf8, 0x8014cf8
    .set FUN_08004a74, 0x8004a74
    .set Save_SaveGame, 0x801fADC
    .set DAT_0600d820, 0x600d820
    .set DAT_0600d8a0, 0x600d8a0

    .text

thumb_func_start Text_Init
Text_Init:
    push       { lr }
    LoadStateTo r0, Main_text, r0
    mov        r1,#0x8c
    bl         memset0_32
    mov        r0,#(TF_ClearDialogBox|TF_DisableInput)
    bl         Text_DisableOption
    pop        { pc }
thumb_func_end Text_Init

thumb_func_start Text_LoadAreaDialogue
Text_LoadAreaDialogue:
    push       { lr }
    push       { r0 }
    LoadStateTo r5, Main_world
    ldrb       r0,[r5,#World_m_currentArea]
    ldrb       r1,[r5,#World_m_currentSubArea]
    cmp        r0,#0xf0
    bge        LAB_08013592
    cmp        r0,#0x80
    bge        LAB_0801358c
    ldr        r3,PTR_textDictDir_Offline
    b          LAB_08013596
LAB_0801358c:
    ldr        r3,PTR_PTR_08013950
    sub        r0,#0x80
    b          LAB_08013596
LAB_08013592:
    ldr        r3,PTR_PTR_PTR_08013954
    sub        r0,#0xf0
LAB_08013596:
    lsl        r0,r0,#0x2
    add        r3,r3,r0
    ldr        r3,[r3,#0x0]
    lsl        r1,r1,#0x2
    add        r3,r3,r1
    ldr        r0,[r3,#0x0]
    pop        { r1 }
    bl         Text_LoadDialogue
    pop        { pc }
thumb_func_end Text_LoadAreaDialogue

thumb_func_start Text_LoadCommentaryDialogue
Text_LoadCommentaryDialogue:
    push       { lr }
    cmp        r0,#0xff
    beq        LAB_080135e4
    push       { r0 }
    mov        r7,r10
    ldr        r5,[r7,#0x8]
    ldrb       r0,[r5,#0x4]
    ldrb       r1,[r5,#0x5]
    cmp        r0,#0xf0
    bge        LAB_080135ce
    cmp        r0,#0x80
    bge        LAB_080135c8
    ldr        r3,PTR_PTR_08013958
    b          LAB_080135d2
LAB_080135c8:
    ldr        r3,PTR_PTR_0801395c
    sub        r0,#0x80
    b          LAB_080135d2
LAB_080135ce:
    ldr        r3,PTR_PTR_PTR_08013960
    sub        r0,#0xf0
LAB_080135d2:
    lsl        r0,r0,#0x2
    add        r3,r3,r0
    ldr        r3,[r3,#0x0]
    lsl        r1,r1,#0x2
    add        r3,r3,r1
    ldr        r0,[r3,#0x0]
    pop        { r1 }
    bl         Text_LoadDialogue
LAB_080135e4:
    pop        { pc }
thumb_func_end Text_LoadCommentaryDialogue

thumb_func_start Text_LoadDialogue
Text_LoadDialogue:
    push       { lr }
    LoadStateTo r5, Main_text, r5
    ldr        r2,[r5,#0x30]
    ldr        r3,[r5,#0x34]
    ldr        r4,[r5,#0x38]
    ldr        r6,[r5,#0x3c]
    push       { r0, r1, r2, r3, r4, r5, r6 }
    mov        r0,r10
    ldr        r0,[r0,#0x48]
    mov        r1,#0x8c
    bl         memset0_32
    pop        { r0, r1, r2, r3, r4, r5, r6 }
    str        r2,[r5,#0x30]
    str        r3,[r5,#0x34]
    str        r4,[r5,#0x38]
    str        r6,[r5,#0x3c]
    str        r0,[r5,#Text_m_textBlockPointer]
    strb       r1,[r5,#0x1]
    lsl        r1,r1,#0x1
    ldrh       r1,[r0,r1]
    add        r0,r0,r1
    str        r0,[r5,#Text_m_commandTextPointer]
    str        r0,[r5,#Text_m_layoutTextPointer]
    mov        r0,#TRUE
    strb       r0,[r5,#Text_m_isWriteText]
    mov        r0,#0x2
    strb       r0,[r5,#Text_m_nextDelay]
    mov        r0,#0xff
    strb       r0,[r5,#0x15]
    ldr        r0,PTR_gLayoutDialogueText_08013964
    str        r0,[r5,#Text_m_dialogLayout]
    mov        r0,#0x15
    @ 0x15 is just offscreen
    strb       r0,[r5,#Text_m_layoutLineOffset]
    mov        r0,#TF_ClearDialogBox
    bl         Text_EnableOption
    mov        r0,#0x5
    strb       r0,[r5,#0x12]
    ldr        r0,PTR_tilesetDialogueWindowBorder_08013968
    ldr        r1,PTR_DAT_0801396c
    mov        r2,#0x48
    bl         Dma_TransferListAdd
    pop        { pc }
thumb_func_end Text_LoadDialogue

thumb_func_start Text_DisableDialogue
Text_DisableDialogue:
    push       { lr }
    LoadStateTo r5, Main_text, r5
    mov        r0,#FALSE
    strb       r0,[r5,#Text_m_isWriteText]
    mov        r0,#(TF_DisableInput|TF_ClearDialogBox)
    bl         Text_DisableOption
    pop        { pc }
thumb_func_end Text_DisableDialogue

thumb_func_start Text_Main
Text_Main:
    push       { lr }
    LoadStateTo r5, Main_text, r5
    ldrb       r0,[r5,#Text_m_isWriteText]
    cmp        r0,#FALSE
    bne        write_text_start
    pop        { pc }
write_text_start:
    mov        r0,#TF_Flag_20
    bl         Text_DisableOption
    mov        r0,#TF_DisableInput
    bl         Text_CheckOption
    beq        state_store_input
    mov        r1,#0x0
    strh       r1,[r5,#Text_m_curKeyState]
    strh       r1,[r5,#Text_m_toggleKeyState]
    strh       r1,[r5,#Text_m_heldKeyState]
    b          state_after_input_check
state_store_input:
    LoadStateTo r0, Main_input
    ldrh       r1,[r0,#Input_curKeyState]
    strh       r1,[r5,#Text_m_curKeyState]
    ldrh       r1,[r0,#Input_toggleKeyState]
    strh       r1,[r5,#Text_m_toggleKeyState]
    ldrh       r1,[r0,#Input_heldKeyState]
    strh       r1,[r5,#Text_m_heldKeyState]
state_after_input_check:
    ldrb       r0,[r5,#Text_m_nextDelay]
    strb       r0,[r5,#Text_m_scriptParseDelay]
    ldrb       r0,[r5,#Text_m_dialogSkipDelay]
    cmp        r0,#0
    ble        LAB_0801369e
    sub        r0,#0x1
    strb       r0,[r5,#Text_m_dialogSkipDelay]
    b          LAB_080136ba
LAB_0801369e:
    ldrh       r0,[r5,#Text_m_toggleKeyState]
    mov        r1,#(KEY_A|KEY_B)
    tst        r1,r0
    bne        LAB_080136ae
    ldrh       r0,[r5,#Text_m_curKeyState]
    mov        r1,#KEY_B
    and        r1,r0
    beq        LAB_080136ba
LAB_080136ae:
    mov        r0,#TS_Unskippable_Script
    bl         Text_CheckScriptOption
    bne        LAB_080136ba
    mov        r0,#0x0
    strb       r0,[r5,#Text_m_scriptParseDelay]
LAB_080136ba:
    ldr        r4,[r5,#Text_m_commandTextPointer]
LAB_080136bc:
    ldrb       r1,[r4,#0x0]
    cmp        r1,#0xe7
    bge        do_command
    b          check_counter_and_sound
do_command:
    sub        r1,#0xe7
    lsl        r1,r1,#0x2
    ldr        r2,PTR_JT_Command_08013970
    ldr        r1,[r2,r1]
    mov        lr,pc
    bx         r1
    b          LAB_08013722
check_counter_and_sound:
    ldrb       r2,[r5,#Text_m_commandParseDelay]
    cmp        r2,#0x0
    bgt        decrease_counter1
    ldrb       r2,[r5,#Text_m_nextDelay]
    strb       r2,[r5,#Text_m_commandParseDelay]
    mov        r0,#TS_Skip_Text_Sound
    bl         Text_CheckScriptOption
    bne        check_extended_char
    mov        r0,#SE_Text_Character
    bl         Sound_PlaySongImmediate
check_extended_char:
    cmp        r1,#0xe5
    beq        command_E5
    cmp        r1,#0xe6
    beq        command_E6
    bl         Text_CopyCharTile
    add        r4,#0x1
    mov        r0,#0x0
    b          LAB_08013722
command_E5:
    ldrb       r1,[r4,#0x1]
    add        r1,#0xe5
    bl         Text_CopyCharTile
    add        r4,#0x2
    mov        r0,#0x0
    b          LAB_08013722
command_E6:
    ldrb       r1,[r4,#0x1]
    add        r1,#0xe6
    add        r1,#0xff
    bl         Text_CopyCharTile
    add        r4,#0x2
    mov        r0,#0x0
    b          LAB_08013722
decrease_counter1:
    sub        r2,#0x1
    strb       r2,[r5,#Text_m_commandParseDelay]
    mov        r0,#0x0
    b          LAB_08013722
LAB_08013722:
    str        r4,[r5,#Text_m_commandTextPointer]
    ldrb       r2,[r5,#Text_m_scriptOptions]
    mov        r3,#0x1
    and        r2,r3
    ldrb       r3,[r5,#Text_m_scriptParseDelay]
    add        r2,r2,r3
    cmp        r2,#0x0
    beq        LAB_080136bc
    cmp        r0,#0x0
    bne        LAB_080136bc
    mov        r0,#TS_BreakLoop
    bl         Text_DisableScriptOption
    bl         Text_LoadDialogBoxLayout
    bl         Text_LoadDialoguePromptArrow
    mov        r0,#0x0
    strb       r0,[r5,#Text_m_textCol]
    strb       r0,[r5,#Text_m_textRow]
    strb       r0,[r5,#Text_m_b14]
    strb       r0,[r5,#Text_m_counter1]
    add        r7,r5,#0x0
    add        r7,#0x58
    strh       r0,[r7,#0x2]
    mov        r3,#0x0
    ldr        r4,[r5,#Text_m_layoutTextPointer]
layout_eval_command:
    @ Layout text according to the commands used
    ldr        r1,[r5,#Text_m_commandTextPointer]
    cmp        r1,r4
    beq        layout_finish
    ldrb       r1,[r4,#0x0]
    cmp        r1,#0xe7
    bge        layout_command_advance
    cmp        r1,#0xe5
    beq        layout_single_char_advance_2
    cmp        r1,#0xe6
    beq        layout_single_char_advance_2
    b          layout_single_char_advance_1
layout_command_advance:
    sub        r1,#0xe7
    lsl        r1,r1,#0x2
    ldr        r2,PTR_JT_LayoutCommand_08013974
    ldr        r1,[r2,r1]
    mov        lr,pc
    bx         r1
    b          layout_after_advance
layout_single_char_advance_1:
    bl         Text_LoadCharTileLayout
    add        r3,#0x1
    add        r4,#0x1
    b          layout_after_advance
layout_single_char_advance_2:
    bl         Text_LoadCharTileLayout
    add        r3,#0x1
    add        r4,#0x2
layout_after_advance:
    b          layout_eval_command
layout_finish:
    ldrb       r0,[r5,#Text_m_layoutLineOffset]
    lsl        r1,r0,#0x6
    ldr        r0,[r5,#Text_m_dialogLayout]
    LoadStateTo r2, Main_screens, r2
    add        r1,r1,r2
    mov        r2,#0x80
    push       { r5 }
    bl         Dma_TransferListAdd
    pop        { r5 }
    ldr        r0,PTR_gTextTileBuffer_08013978
    ldr        r1,dstvTextTileStart
    ldr        r2,DAT_08013980
    push       { r5 }
    bl         Dma_TransferListAdd
    pop        { r5 }
    bl         Text_CheckPortraitLoad
    bl         Text_CheckPasscodeEntryLoad
    pop        { pc }
thumb_func_end Text_Main

thumb_func_start Text_CopyCharTile
Text_CopyCharTile:
    ldr        r0,PTR_tilesetDialogueText_08013984
    lsl        r1,r1,#0x6
    add        r0,r0,r1
    ldr        r1,PTR_gTextTileBuffer_08013988
    ldrb       r2,[r5,#Text_m_textBufferOffset]
    lsl        r2,r2,#0x6
    add        r1,r1,r2
    ldr        r7,PTR_charShade_0801398c
    ldrb       r2,[r5,#Text_m_charShade]
    lsl        r2,r2,#0x2
    ldr        r7,[r7,r2]
    mov        r2,#0x40
LAB_080137d8:
    ldr        r3,[r0,#0x0]
    add        r3,r3,r7
    str        r3,[r1,#0x0]
    add        r0,#0x4
    add        r1,#0x4
    sub        r2,#0x4
    bne        LAB_080137d8
    ldrb       r3,[r5,#Text_m_textBufferOffset]
    add        r3,#0x1
    strb       r3,[r5,#Text_m_textBufferOffset]
    mov        pc,lr
thumb_func_end Text_CopyCharTile

    .align 2, 0
charShade:
    .word 0x00000000
    .word 0x33333333
    .word 0x66666666
    .word 0x99999999
    .word 0xCCCCCCCC

thumb_func_start Text_LoadCharTileLayout
Text_LoadCharTileLayout:
    push       { lr }
    ldrb       r6,[r5,#Text_m_textCol]
    add        r0,r6,#0x1
    strb       r0,[r5,#Text_m_textCol]
    add        r6,#0x8
    ldrb       r7,[r5,#Text_m_textRow]
    lsl        r7,r7,#0x1
    add        r7,#0x1
    lsl        r0,r3,#0x1
    add        r0,#0x40
    mov        r2,#0xf2
    lsl        r2,r2,#0x8
    orr        r0,r2
    ldr        r2,[r5,#Text_m_dialogLayout]
    lsl        r6,r6,#0x1
    lsl        r7,r7,#0x6
    add        r2,r2,r6
    add        r2,r2,r7
    strh       r0,[r2,#0x0]
    add        r0,#0x1
    add        r2,#0x40
    strh       r0,[r2,#0x0]
    pop        { pc }
thumb_func_end Text_LoadCharTileLayout

thumb_func_start Text_SetDialogPortrait
Text_SetDialogPortrait:
    push       { r5, lr }
    add        r5,#Text_m_portrait
    push       { r0, r1 }
    lsl        r0,r0,#0x2
    ldr        r1,PTR_tilesetListPortraits_08013990
    ldr        r0,[r1,r0]
    bl         Sprite_Init
    pop        { r0, r1 }
    strb       r1,[r5,#0x5]
    mov        r1,#0x0
    strb       r1,[r5,#0x1]
    mov        r1,#0xa
    strb       r1,[r5,#0x4]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    strh       r0,[r5,#0x10]
    strh       r0,[r5,#0x12]
    strh       r0,[r5,#0x14]
    mov        r0,#0xe0
    strb       r0,[r5,#0x15]
    bl         Sprite_InitFrames
    ldr        r1,DAT_08013980
    strh       r1,[r5,#0x8]
    bl         Sprite_LoadPalette
    mov        r1,#0x22
    strh       r1,[r5,#0xc]
    pop        { r5, pc }
thumb_func_end Text_SetDialogPortrait

thumb_func_start Text_CheckPortraitLoad
Text_CheckPortraitLoad:
    push       { r5, lr }
    mov        r0,#TS_ShowPortrait
    bl         Text_CheckScriptOption
    beq        LAB_080138ae
    ldrb       r1,[r5,#Text_m_nextAnimationIndex]
    ldrb       r2,[r5,#Text_m_currAnimationIndex]
    strb       r1,[r5,#Text_m_currAnimationIndex]
    ldrb       r0,[r5,#Text_m_layoutLineOffset]
    lsl        r0,r0,#0x3
    push       { r0 }
    ldrb       r3,[r5,#Text_m_portraitPalIndex]
    add        r5,#Text_m_portrait
    strb       r3,[r5,#0x5]
    cmp        r1,r2
    bge        LAB_08013896
    strb       r1,[r5,#0x1]
    bl         Sprite_InitFrames
LAB_08013896:
    bl         Sprite_ProcessFrameDelay
    pop        { r0 }
    add        r0,#0x20
    strb       r0,[r5,#0xe]
    bl         Sprite_LoadPalette
    bl         Sprite_LoadTileset
    mov        r0,#0x0
    bl         LC_Sprite_AddSpriteToOam
LAB_080138ae:
    pop        { r5, pc }
thumb_func_end Text_CheckPortraitLoad

thumb_func_start Text_LoadDialogBoxLayout
Text_LoadDialogBoxLayout:
    push       { r5, lr }
    ldr        r0,PTR_layoutDialogBox_08013994
    ldr        r1,[r5,#Text_m_dialogLayout]
    ldr        r2,DAT_08013998
    bl         memcpy_32
    pop        { r5, pc }
thumb_func_end Text_LoadDialogBoxLayout

thumb_func_start Text_CheckPasscodeEntryLoad
Text_CheckPasscodeEntryLoad:
    push       { r5, lr }
    mov        r0,#TS_PasscodeEntry
    bl         Text_CheckScriptOption
    beq        LAB_080138dc
    mov        r0,#TS_40
    bl         Text_CheckScriptOption
    push       { r5 }
    bl         FUN_08018e4c
    pop        { r5 }
    strb       r0,[r5,#Text_m_b16]
    strb       r1,[r5,#Text_m_b17]
LAB_080138dc:
    pop        { r5, pc }
thumb_func_end Text_CheckPasscodeEntryLoad

thumb_func_start Text_EnableScriptOption
Text_EnableScriptOption:
    push       { r1 }
    ldrb       r1,[r5,#Text_m_scriptOptions]
    orr        r1,r0
    strb       r1,[r5,#Text_m_scriptOptions]
    pop        { r1 }
    mov        pc,lr
thumb_func_end Text_EnableScriptOption

thumb_func_start Text_DisableScriptOption
Text_DisableScriptOption:
    push       { r1 }
    ldrb       r1,[r5,#Text_m_scriptOptions]
    bic        r1,r0
    strb       r1,[r5,#Text_m_scriptOptions]
    pop        { r1 }
    mov        pc,lr
thumb_func_end Text_DisableScriptOption

thumb_func_start Text_CheckScriptOption
Text_CheckScriptOption:
    push       { r1 }
    ldrb       r1,[r5,#Text_m_scriptOptions]
    and        r0,r1
    pop        { r1 }
    mov        pc,lr
thumb_func_end Text_CheckScriptOption

thumb_func_start Text_EnableOption
Text_EnableOption:
    push       { r1, r2 }
    ldr        r1,PTR_gTextOptionFlags_0801399c
    ldr        r2,[r1,#0x0]
    orr        r2,r0
    str        r2,[r1,#0x0]
    pop        { r1, r2 }
    mov        pc,lr
thumb_func_end Text_EnableOption

thumb_func_start Text_DisableOption
Text_DisableOption:
    push       { r1, r2 }
    ldr        r1,PTR_gTextOptionFlags_080139a0
    ldr        r2,[r1,#0x0]
    bic        r2,r0
    str        r2,[r1,#0x0]
    pop        { r1, r2 }
    mov        pc,lr
thumb_func_end Text_DisableOption

thumb_func_start Text_CheckOption
Text_CheckOption:
    push       { r1 }
    ldr        r1,PTR_gTextOptionFlags_080139a4
    ldr        r1,[r1,#0x0]
    and        r0,r1
    pop        { r1 }
    mov        pc,lr
thumb_func_end Text_CheckOption

thumb_func_start TextOption_GetDefaultOption
TextOption_GetDefaultOption:
    push       { r1 }
    ldr        r1,PTR_gTextOptionFlags_080139a8
    ldr        r1,[r1,#0x0]
    mov        r0,#0xf
    and        r0,r1
    pop        { r1 }
    mov        pc,lr
thumb_func_end TextOption_GetDefaultOption

thumb_func_start Text_CopyCharTileUI
Text_CopyCharTileUI:
    push       { lr }
    push       { r0 }
    ldr        r0,PTR_Screen_WriteUIText_1_080139ac
    mov        lr,pc
    bx         r0
    pop        { pc }
thumb_func_end Text_CopyCharTileUI

PTR_textDictDir_Offline:                           .word textDictDir_Offline
PTR_PTR_08013950:                           .word textDictDir_Online
PTR_PTR_PTR_08013954:                       .word PTR_PTR_08014d68
PTR_PTR_08013958:                           .word textDictDir_Commentary_Offline
PTR_PTR_0801395c:                           .word textDictDir_Commentary_Online
PTR_PTR_PTR_08013960:                       .word PTR_PTR_08014fc4
PTR_gLayoutDialogueText_08013964:           .word gLayoutDialogueText
PTR_tilesetDialogueWindowBorder_08013968:   .word tilesetDialogueWindowBorder
PTR_DAT_0801396c:                           .word 0x600d700
PTR_JT_Command_08013970:                    .word JT_Command
PTR_JT_LayoutCommand_08013974:              .word JT_LayoutCommand
PTR_gTextTileBuffer_08013978:                .word gTextTileBuffer
dstvTextTileStart:                           .word vTextTileStart
DAT_08013980:                               .word 0x3C0
PTR_tilesetDialogueText_08013984:           .word tilesetDialogueText
PTR_gTextTileBuffer_08013988:                .word gTextTileBuffer
PTR_charShade_0801398c:                     .word charShade
PTR_tilesetListPortraits_08013990:          .word 0x8012b20 @ tilesetListPortraits
PTR_layoutDialogBox_08013994:               .word 0x80151c8 @ layoutDialogBox
DAT_08013998:                               .word 0x200
PTR_gTextOptionFlags_0801399c:              .word gTextOptionFlags
PTR_gTextOptionFlags_080139a0:              .word gTextOptionFlags
PTR_gTextOptionFlags_080139a4:              .word gTextOptionFlags
PTR_gTextOptionFlags_080139a8:              .word gTextOptionFlags
PTR_Screen_WriteUIText_1_080139ac:          .word 0x30070e4 + 1 @ Screen_WriteUIText

JT_Command:
    .word JT_Command_E7_End
    .word JT_Command_E8_NewLine
    .word JT_Command_E9_Wait
    .word JT_Command_EA_TextDelay
    .word JT_Command_EB_WaitForButtonPress
    .word JT_Command_EC_ParseDelay
    .word JT_Command_ED_PortraitControl
    .word JT_Command_EE_PortraitAnimChange
    .word JT_Command_EF_SetTextCol
    .word JT_Command_F0_CreateDialogueOption
    .word JT_Command_F1_HandleDialogueOptionSelect
    .word JT_Command_F2_DialogueControl
    .word JT_Command_F3_FlagControl
    .word JT_Command_F4_JumpConditional
    .word JT_Command_F5_InputControl
    .word JT_Command_F6_JumpTextBlock
    .word JT_Command_F7_ItemControl
    .word JT_Command_F8_PasscodeControl
    .word JT_Command_F9_TextPalette
    .word JT_Command_FA_PlayerAnimControl
    .word JT_Command_FB_PrintControl
    .word JT_Command_FC_SongControl
    .word JT_Command_FD_MiscControl
    .word JT_Command_FE_Save
JT_LayoutCommand:
    .word JT_Layout_E7_End
    .word JT_Layout_E8_NewLine
    .word JT_Layout_E7_Wait
    .word JT_Layout_E7_TextDelay
    .word JT_Layout_EB_WaitForButtonPress
    .word JT_Layout_EC_ParseDelay
    .word JT_Layout_ED_PortraitControl
    .word JT_Layout_EE_PortraitAnimChange
    .word JT_Layout_EF_SetTextCol
    .word JT_Layout_F0_CreateDialogueOption
    .word JT_Layout_F1_HandleDialogueOptionSelect
    .word JT_Layout_F2_DialogueControl
    .word JT_Layout_F3_FlagControl
    .word JT_Layout_F4_JumpConditional
    .word JT_Layout_F5_InputControl
    .word JT_Layout_F6_JumpTextBlock
    .word JT_Layout_F7_ItemControl
    .word JT_Layout_F8_PasscodeControl
    .word JT_Layout_F9_TextPalette
    .word JT_Layout_FA_PlayerAnimControl
    .word JT_Layout_FB_PrintControl
    .word JT_Layout_FC_SongControl
    .word JT_Layout_FD_MiscControl
    .word JT_Layout_FE_Save

thumb_func_start JT_Command_E7_End
JT_Command_E7_End:
    push       { lr }
    ldrb       r0,[r5,#Text_m_isScriptJump]
    tst        r0,r0
    beq        LAB_08013a82
    @ If text is printing from another buffer, set it back to
    @ the previous position and continue
    sub        r0,#0x1
    strb       r0,[r5,#Text_m_isScriptJump]
    @ r4 = textState->textPointerAfterKeyPrint
    ldr        r4,[r5,#Text_m_textPointerAfterKeyPrint]
    mov        r0,#0x1
    pop        { pc }
LAB_08013a82:
    mov        r0,#0x1
    bl         Text_EnableScriptOption
    ldrb       r0,[r5,#Text_m_dialogDelayType]
    cmp        r0,#TSDT_DelayCounter
    beq        LAB_08013aa0
    cmp        r0,#TSDT_WaitForButtonPress
    beq        LAB_08013ab2
    @ If delay is off, set counter to next two bytes
    @ and set delay mode to counter
    ldrb       r0,[r4,#0x1]
    ldrb       r1,[r4,#0x2]
    lsl        r1,r1,#0x8
    orr        r0,r1
    strh       r0,[r5,#Text_m_dialogDelayCounter]
    mov        r0,#TSDT_DelayCounter
    strb       r0,[r5,#Text_m_dialogDelayType]
LAB_08013aa0:
    ldrh       r0,[r5,#Text_m_dialogDelayCounter]
    cmp        r0,#0x0
    beq        LAB_08013aae
    @ If delay type is counter and counter > 0, decrement
    @ counter and return
    sub        r0,#0x1
    strh       r0,[r5,#Text_m_dialogDelayCounter]
    mov        r0,#0x0
    pop        { pc }
    @ Set delay type to button prompt, and start sliding
    @ dialog box down
LAB_08013aae:
    mov        r0,#TSDT_WaitForButtonPress
    strb       r0,[r5,#Text_m_dialogDelayType]
LAB_08013ab2:
    ldrb       r0,[r5,#Text_m_layoutLineOffset]
    add        r0,#0x1
    strb       r0,[r5,#Text_m_layoutLineOffset]
    cmp        r0,#0x15
    bge        LAB_08013ac0
    mov        r0,#0x0
    pop        { pc }
    @ Once dialog box is hidden, disable text mode and
    @ set delay to 0
LAB_08013ac0:
    mov        r0,#TF_ClearDialogBox
    bl         Text_DisableOption
    mov        r0,#0x0
    strb       r0,[r5,#Text_m_isWriteText]
    strb       r0,[r5,#Text_m_dialogDelayType]
    mov        r0,#0x0
    pop        { pc }
thumb_func_end JT_Command_E7_End

thumb_func_start JT_Layout_E7_End
JT_Layout_E7_End:
    ldrb       r0,[r5,#Text_m_counter1]
    tst        r0,r0
    beq        LAB_08013ade
    sub        r0,#0x1
    strb       r0,[r5,#Text_m_counter1]
    ldr        r4,[r5,#0x44]
    mov        pc,lr
LAB_08013ade:
    add        r4,#0x3
    mov        pc,lr
thumb_func_end JT_Layout_E7_End

thumb_func_start JT_Command_E8_NewLine
JT_Command_E8_NewLine:
    add        r4,#0x1
    mov        r0,#0x1
    mov        pc,lr
thumb_func_end JT_Command_E8_NewLine

thumb_func_start JT_Layout_E8_NewLine
JT_Layout_E8_NewLine:
    mov        r0,#0
    strb       r0,[r5,#Text_m_textCol]
    ldrb       r0,[r5,#Text_m_textRow]
    add        r0,#1
    strb       r0,[r5,#Text_m_textRow]
    add        r4,#1
    mov        pc,lr
thumb_func_end JT_Layout_E8_NewLine

thumb_func_start JT_Command_E9_Wait
JT_Command_E9_Wait:
    push       { lr }
    mov        r0,#TS_BreakLoop
    bl         Text_EnableScriptOption
    ldrb       r0,[r5,#Text_m_dialogDelayType]
    cmp        r0,#TSDT_NoDelay
    bne        LAB_08013b18
    @ If delay mode is off, set counter to next two bytes and
    @ change mode to counter
    ldrb       r0,[r4,#0x1]
    ldrb       r1,[r4,#0x2]
    lsl        r1,r1,#0x8
    orr        r0,r1
    strh       r0,[r5,#Text_m_dialogDelayCounter]
    mov        r0,#TSDT_DelayCounter
    strb       r0,[r5,#Text_m_dialogDelayType]
LAB_08013b18:
    ldrh       r0,[r5,#Text_m_dialogDelayCounter]
    cmp        r0,#0x0
    beq        LAB_08013b26
    @ If counter > 0, decrement counter and return
    sub        r0,#0x1
    strh       r0,[r5,#Text_m_dialogDelayCounter]
    mov        r0,#0x0
    pop        { pc }
    @ Set up text pointer, set delay type to 0, buffer offsets
    @ to 0, and dialog skip delay to 5
LAB_08013b26:
    add        r4,#0x3
    str        r4,[r5,#Text_m_layoutTextPointer]
    mov        r0,#0x0
    strb       r0,[r5,#Text_m_dialogDelayType]
    str        r0,[r5,#Text_m_textBufIndex]
    strb       r0,[r5,#Text_m_textBufferOffset]
    mov        r0,#0x5
    strb       r0,[r5,#Text_m_dialogSkipDelay]
    mov        r0,#0x0
    pop        { pc }
thumb_func_end JT_Command_E9_Wait

thumb_func_start JT_Layout_E7_Wait
JT_Layout_E7_Wait:
    add        r4,#0x3
    mov        pc,lr
thumb_func_end JT_Layout_E7_Wait

thumb_func_start JT_Command_EA_TextDelay
JT_Command_EA_TextDelay:
    push       { lr }
    ldrb       r1,[r4,#0x1]
    cmp        r1,#0xff
    beq        LAB_08013b8c
    ldrb       r0,[r5,#0x11]
    tst        r0,r0
    bne        LAB_08013b54
    tst        r1,r1
    beq        LAB_08013b54
    b          LAB_08013b7c
    @ if dialog delay is active or EA 00 is the command
LAB_08013b54:
    mov        r0,#0x1
    bl         Text_EnableScriptOption
    ldrb       r0,[r5,#0x4]
    cmp        r0,#0x0
    bne        LAB_08013b6e
    @ if delay is inactive, store next short as delay counter and a
    ldrb       r0,[r4,#0x2]
    ldrb       r1,[r4,#0x3]
    lsl        r1,r1,#0x8
    orr        r0,r1
    strh       r0,[r5,#0xc]
    mov        r0,#0x1
    strb       r0,[r5,#0x4]
LAB_08013b6e:
    ldrh       r0,[r5,#0xc]
    cmp        r0,#0x0
    beq        LAB_08013b7c
    @ If counter > 0, subtract 1 and don't advance
    sub        r0,#0x1
    strh       r0,[r5,#0xc]
    mov        r0,#0x0
    pop        { pc }
    @ Clear the break loop flag, clear the flag1, advance to next
LAB_08013b7c:
    mov        r0,#0x1
    bl         Text_DisableScriptOption
    mov        r0,#0x0
    strb       r0,[r5,#0x4]
    add        r4,#0x4
    mov        r0,#0x1
    pop        { pc }
    @ EA FF = Set break flag and loop forever
LAB_08013b8c:
    mov        r0,#0x1
    bl         Text_EnableScriptOption
    mov        r0,#0x0
    pop        { pc }
thumb_func_end JT_Command_EA_TextDelay

thumb_func_start JT_Layout_E7_TextDelay
JT_Layout_E7_TextDelay:
    add        r4,#0x4
    mov        pc,lr
thumb_func_end JT_Layout_E7_TextDelay

thumb_func_start JT_Command_EB_WaitForButtonPress
JT_Command_EB_WaitForButtonPress:
    push       { lr }
    mov        r0,#0x11
    bl         Text_EnableScriptOption
    ldrb       r0,[r5,#0x4]
    cmp        r0,#0x1
    beq        LAB_08013bb8
    cmp        r0,#0x2
    beq        LAB_08013bcc
    @ If delay is not active, set a delay counter of 5
    mov        r0,#0x5
    strh       r0,[r5,#0xc]
    mov        r0,#0x1
    strb       r0,[r5,#0x4]
    b          LAB_08013bfa
LAB_08013bb8:
    ldrh       r0,[r5,#0xc]
    cmp        r0,#0x0
    beq        LAB_08013bc4
    @ If delay counter is active, decrement and return
    sub        r0,#0x1
    strh       r0,[r5,#0xc]
    b          LAB_08013bfa
    @ When delay becomes 0, switch to button-based delay
LAB_08013bc4:
    mov        r0,#0x2
    strb       r0,[r5,#0x4]
    mov        r0,#0x0
    strh       r0,[r5,#0xc]
LAB_08013bcc:
    ldrh       r0,[r5,#0x1c]
    mov        r1,#0x3
    tst        r1,r0
    bne        LAB_08013be8
    @ If B is held down, auto advance with a small
    @ amount of delay between pages
    ldrh       r0,[r5,#0x18]
    mov        r1,#0x2
    tst        r1,r0
    beq        LAB_08013bfa
    ldrh       r0,[r5,#0xc]
    cmp        r0,#0xa
    bge        LAB_08013be8
    add        r0,#0x1
    strh       r0,[r5,#0xc]
    b          LAB_08013bfa
    @ If A or B is pressed, advance the page
LAB_08013be8:
    mov        r0,#0x10
    bl         Text_DisableScriptOption
    mov        r0,#0x0
    strb       r0,[r5,#0x4]
    strh       r0,[r5,#0xc]
    add        r4,#0x1
    mov        r0,#0x0
    pop        { pc }
LAB_08013bfa:
    mov        r0,#0x0
    pop        { pc }
thumb_func_end JT_Command_EB_WaitForButtonPress

thumb_func_start JT_Layout_EB_WaitForButtonPress
JT_Layout_EB_WaitForButtonPress:
    add        r4,#0x1
    mov        pc,lr
thumb_func_end JT_Layout_EB_WaitForButtonPress

thumb_func_start JT_Command_EC_ParseDelay
JT_Command_EC_ParseDelay:
    push       { lr }
    ldrb       r0,[r4,#0x1]
    cmp        r0,#0x0
    beq        LAB_08013c12
    cmp        r0,#0x1
    beq        LAB_08013c20
    b          LAB_08013c2c
    @ EC 00 = Set general parsing delay to next byte
LAB_08013c12:
    ldrb       r0,[r4,#0x2]
    strb       r0,[r5,#0x8]
    strb       r0,[r5,#0x11]
    strb       r0,[r5,#0x9]
    mov        r0,#0x1
    add        r4,#0x3
    pop        { pc }
    @ EC 01 = Make script skippable
LAB_08013c20:
    mov        r0,#0x4
    bl         Text_DisableScriptOption
    mov        r0,#0x1
    add        r4,#0x2
    pop        { pc }
    @ EC xx = Make script unskippable with A/B
LAB_08013c2c:
    mov        r0,#0x4
    bl         Text_EnableScriptOption
    mov        r0,#0x1
    add        r4,#0x2
    pop        { pc }
thumb_func_end JT_Command_EC_ParseDelay

thumb_func_start JT_Layout_EC_ParseDelay
JT_Layout_EC_ParseDelay:
    ldr        r0,=DAT_08013c48
    ldrb       r1,[r4,#0x1]
    ldrb       r0,[r0,r1]
    add        r4,r4,r0
    mov        pc,lr
thumb_func_end JT_Layout_EC_ParseDelay

    .align 2, 0
    .pool
DAT_08013c48:
    .byte 3, 2, 2, 0

thumb_func_start JT_Command_ED_PortraitControl
JT_Command_ED_PortraitControl:
    push       { lr }
    ldrb       r0,[r4,#0x1]
    cmp        r0,#0x1
    beq        LAB_08013c72
    cmp        r0,#0x2
    beq        LAB_08013c7c
    @ ED xx = use next two bytes to enable portrait
    @ pointer[2] = portrait
    @ pointer[3] = palette
    mov        r0,#0x2
    bl         Text_EnableScriptOption
    ldrb       r0,[r4,#0x2]
    ldrb       r1,[r4,#0x3]
    strb       r1,[r5,#0x7]
    mov        r2,#0x0
    strb       r2,[r5,#0xa]
    strb       r2,[r5,#0xb]
    bl         Text_SetDialogPortrait
    add        r4,#0x4
    b          LAB_08013c82
    @ ED 01 = Disable portrait
LAB_08013c72:
    mov        r0,#0x2
    bl         Text_DisableScriptOption
    add        r4,#0x2
    b          LAB_08013c82
    @ ED 02 = Set portrait palette
LAB_08013c7c:
    ldrb       r0,[r4,#0x2]
    strb       r0,[r5,#0x7]
    add        r4,#0x3
LAB_08013c82:
    mov        r0,#0x1
    pop        { pc }
thumb_func_end JT_Command_ED_PortraitControl

thumb_func_start JT_Layout_ED_PortraitControl
JT_Layout_ED_PortraitControl:
    ldr        r0,=DAT_08013c98
    ldrb       r1,[r4,#0x1]
    ldrb       r0,[r0,r1]
    add        r4,r4,r0
    mov        pc,lr
thumb_func_end JT_Layout_ED_PortraitControl

    .align 2, 0
    .pool
DAT_08013c98: .byte 4, 2, 3, 0

thumb_func_start JT_Command_EE_PortraitAnimChange
JT_Command_EE_PortraitAnimChange:
    ldrb       r0,[r4,#0x1]
    strb       r0,[r5,#0xa]
    mov        r0,#0xff
    strb       r0,[r5,#0xb]
    mov        r0,#0x1
    add        r4,#0x2
    mov        pc,lr
thumb_func_end JT_Command_EE_PortraitAnimChange

thumb_func_start JT_Layout_EE_PortraitAnimChange
JT_Layout_EE_PortraitAnimChange:
    add        r4,#0x2
    mov        pc,lr
thumb_func_end JT_Layout_EE_PortraitAnimChange

thumb_func_start JT_Command_EF_SetTextCol
JT_Command_EF_SetTextCol:
    add        r4,#0x3
    mov        r0,#0x1
    mov        pc,lr
thumb_func_end JT_Command_EF_SetTextCol

thumb_func_start JT_Layout_EF_SetTextCol
JT_Layout_EF_SetTextCol:
    ldrb       r1,[r4,#0x1]
    cmp        r1,#0x0
    beq        LAB_08013cc0
    b          LAB_08013cc8
    @ EF 00 = Add next byte to current text column
LAB_08013cc0:
    ldrb       r1,[r4,#0x2]
    ldrb       r0,[r5,#0xe]
    add        r0,r0,r1
    b          LAB_08013cca
    @ EF xx = Set text column directly
LAB_08013cc8:
    ldrb       r0,[r4,#0x2]
LAB_08013cca:
    strb       r0,[r5,#0xe]
    add        r4,#0x3
    mov        pc,lr
thumb_func_end JT_Layout_EF_SetTextCol

thumb_func_start JT_Command_F0_CreateDialogueOption
JT_Command_F0_CreateDialogueOption:
    push       { lr }
    mov        r0,#0xff
    strb       r0,[r5,#0x15]
    mov        r0,#0x8
    bl         Text_EnableScriptOption
    mov        r0,#0xa
    strh       r0,[r5,#0xc]
    add        r4,#0x3
    mov        r0,#0x1
    pop        { pc }
thumb_func_end JT_Command_F0_CreateDialogueOption

thumb_func_start JT_Layout_F0_CreateDialogueOption
JT_Layout_F0_CreateDialogueOption:
    push       { r3, lr }
    ldrb       r0,[r5,#0x14]
    ldrb       r1,[r5,#0x15]
    cmp        r0,r1
    bne        LAB_08013d44
    mov        r0,#0x8
    bl         Text_CheckScriptOption
    cmp        r0,#0x0
    beq        LAB_08013d34
    ldrb       r0,[r4,#0x1]
    ldrb       r1,[r4,#0x2]
    lsl        r1,r1,#0x8
    orr        r0,r1
    ldrh       r1,[r5,#0x1a]
    ldr        r2,=KeyInput_ARRAY_08013d54
    mov        r3,#0xc
LAB_08013d0a:
    ldrh       r6,[r2,#0x0]
    tst        r6,r1
    bne        LAB_08013d1a
    add        r2,#0x2
    sub        r3,#0x4
    cmp        r3,#0x0
    blt        LAB_08013d34
    b          LAB_08013d0a
LAB_08013d1a:
    mov        r6,#0xf0
    bic        r1,r6
    strh       r1,[r5,#0x1a]
    lsr        r0,r3
    mov        r1,#0xf
    and        r0,r1
    ldrb       r1,[r5,#0x15]
    strb       r0,[r5,#0x15]
    cmp        r0,r1
    beq        LAB_08013d34
    mov        r0,#0x66
    bl         Sound_PlaySongImmediate
LAB_08013d34:
    ldrb       r0,[r5,#0x14]
    ldrb       r1,[r5,#0x15]
    cmp        r0,r1
    blt        LAB_08013d44
    push       { r3, r4 }
    bl         Text_LoadOptionSelectArrow
    pop        { r3, r4 }
LAB_08013d44:
    ldrb       r0,[r5,#0x14]
    add        r0,#0x1
    strb       r0,[r5,#0x14]
    add        r4,#0x3
    pop        { r3, pc }
thumb_func_end JT_Layout_F0_CreateDialogueOption

    .align 2, 0
    .pool
KeyInput_ARRAY_08013d54:
    .short 0x40 @ KeyInput  KEY_UP
    .short 0x80 @ KeyInput  KEY_DOWN
    .short 0x20 @ KeyInput  KEY_LEFT
    .short 0x10 @ KeyInput  KEY_RIGHT

thumb_func_start JT_Command_F1_HandleDialogueOptionSelect
JT_Command_F1_HandleDialogueOptionSelect:
    push       { lr }
    mov        r0,#0x1
    bl         Text_EnableScriptOption
    ldrh       r0,[r5,#0xc]
    cmp        r0,#0x0
    ble        LAB_08013d70
    @ If counter is active, decrement and return
    sub        r0,#0x1
    strh       r0,[r5,#0xc]
    b          LAB_08013da4
    @ If delay counter = 0, check next for the delay type
LAB_08013d70:
    ldrb       r0,[r5,#0x4]
    cmp        r0,#0x1
    beq        LAB_08013d8e
    cmp        r0,#0x2
    beq        LAB_08013e30
    @ if delay type is off but there is a delay counter:
    @ set optionDir to default option
    @ set delay type to counter
    @ set flag 8
    @ don't advance
    ldrb       r0,[r4,#0x2]
    mov        r1,#0x3f
    and        r0,r1
    strb       r0,[r5,#0x15]
    mov        r0,#0x1
    strb       r0,[r5,#0x4]
    mov        r0,#0x8
    bl         Text_EnableScriptOption
    b          LAB_08013da4
    @ If delay type is counter and delay counter == 0
    @ check if A is pressed
LAB_08013d8e:
    ldrh       r0,[r5,#0x1c]
    mov        r1,#0x1
    tst        r0,r1
    bne        LAB_08013da8
    @ If A is not pressed, check the flag byte and see if B
    @ is disabled
    ldrb       r1,[r4,#0x2]
    mov        r2,#0x40
    tst        r1,r2
    bne        LAB_08013da4
    @ If B is enabled, then check if B was pressed
    mov        r1,#0x2
    tst        r0,r1
    bne        LAB_08013e12
    @ Conditions where 0 is returned here:
    @ 1. Delay counter > 0, so it is decremented
    @ 2. Delay counter = 0, and neither A nor B are pressed
    @ (or B is disabled)
LAB_08013da4:
    mov        r0,#0x0
    pop        { pc }
    @ If A is pressed while delay counter is active,
    @ play sound and go to the "delay button" code
LAB_08013da8:
    mov        r0,#0x67
    bl         Sound_PlaySongImmediate
    @ If delay type is button, or A is pressed while
    @ delay type is counter and delay counter = 0
LAB_08013dae:
    mov        r0,#0x8
    bl         Text_DisableScriptOption
    @ Clear all options
    mov        r0,#0xf
    bl         Text_DisableOption
    @ Set defined options in b15
    ldrb       r0,[r5,#0x15]
    bl         Text_EnableOption
    @ Get code of next script jump
    add        r0,#0x3
    ldrb       r0,[r4,r0]
    cmp        r0,#0xff
    bne        LAB_08013de0
    @ If code is 0xFF, skip jump and continue with following code
    ldrb       r0,[r4,#0x1]
    ldrb       r1,[r4,#0x2]
    add        r4,r4,r0
    mov        r2,#0x80
    tst        r1,r2
    beq        LAB_08013dfe
    @ If 'force clear' is active, reset offsets
    mov        r1,#0x0
    str        r1,[r5,#0x58]
    strb       r1,[r5,#0x2]
    str        r4,[r5,#0x20]
    str        r4,[r5,#0x28]
    b          LAB_08013dfe
    @ If code is not 0xFF, go here
LAB_08013de0:
    ldrb       r1,[r4,#0x2]
    mov        r2,#0x80
    tst        r1,r2
    beq        LAB_08013dee
    @ If 'force clear' is active, reset offsets
    mov        r1,#0x0
    str        r1,[r5,#0x58]
    strb       r1,[r5,#0x2]
    @ Set up next command pointer
LAB_08013dee:
    add        r1,r0,#0x0
    ldr        r0,[r5,#0x24]
    lsl        r1,r1,#0x1
    ldrh       r1,[r0,r1]
    add        r0,r0,r1
    str        r0,[r5,#0x20]
    str        r0,[r5,#0x28]
    add        r4,r0,#0x0
    @ Turn off delay, set flag 20, and return
LAB_08013dfe:
    mov        r0,#0x0
    strb       r0,[r5,#0x4]
    strh       r0,[r5,#0xc]
    mov        r0,#0x5
    strb       r0,[r5,#0x12]
    mov        r0,#0x20
    bl         Text_EnableOption
    mov        r0,#0x0
    pop        { pc }
    @ If delay type is counter, delay counter = 0,
    @ and B is pressed
LAB_08013e12:
    mov        r0,#0x68
    bl         Sound_PlaySongImmediate
    @ Set b15 = b14 - 1
    @ (Default option is supposed to be set here)
    ldrb       r0,[r5,#0x14]
    sub        r0,#0x1
    strb       r0,[r5,#0x15]
    @ Set delay to buttonpress(3)
    mov        r0,#0x2
    strb       r0,[r5,#0x4]
    mov        r0,#0x3
    strh       r0,[r5,#0xc]
    mov        r0,#0x8
    bl         Text_DisableScriptOption
    mov        r0,#0x0
    pop        { pc }
LAB_08013e30:
    b          LAB_08013dae
thumb_func_end JT_Command_F1_HandleDialogueOptionSelect

thumb_func_start JT_Layout_F1_HandleDialogueOptionSelect
JT_Layout_F1_HandleDialogueOptionSelect:
    ldrb       r0,[r4,#0x1]
    add        r4,r4,r0
    mov        pc,lr
thumb_func_end JT_Layout_F1_HandleDialogueOptionSelect

thumb_func_start JT_Command_F2_DialogueControl
JT_Command_F2_DialogueControl:
    push       { lr }
    ldrb       r1,[r4,#0x1]
    cmp        r1,#0x0
    beq        LAB_08013e50
    cmp        r1,#0x1
    beq        LAB_08013e64
    cmp        r1,#0x2
    beq        LAB_08013e78
    cmp        r1,#0x3
    beq        LAB_08013e7c
    @ F2 00 slides dialog box up, then advances script
LAB_08013e50:
    mov        r0,#0x1
    bl         Text_EnableScriptOption
    ldrb       r0,[r5,#0x10]
    sub        r0,#0x1
    cmp        r0,#0xc
    bgt        LAB_08013e80
    beq        LAB_08013e86
    add        r0,#0x1
    b          LAB_08013e86
    @ F2 01 slides dialog box down, then advances script
LAB_08013e64:
    mov        r0,#0x1
    bl         Text_EnableScriptOption
    ldrb       r0,[r5,#0x10]
    add        r0,#0x1
    cmp        r0,#0x15
    blt        LAB_08013e80
    beq        LAB_08013e86
    sub        r0,#0x1
    b          LAB_08013e86
    @ F2 02 moves dialog box onscreen immediately
LAB_08013e78:
    mov        r0,#0xc
    b          LAB_08013e86
    @ F2 03 moves dialog box offscreen immediately
LAB_08013e7c:
    mov        r0,#0x15
    b          LAB_08013e86
LAB_08013e80:
    strb       r0,[r5,#0x10]
    mov        r0,#0x0
    pop        { pc }
LAB_08013e86:
    strb       r0,[r5,#0x10]
    add        r4,#0x2
    mov        r0,#0x1
    pop        { pc }
thumb_func_end JT_Command_F2_DialogueControl

thumb_func_start JT_Layout_F2_DialogueControl
JT_Layout_F2_DialogueControl:
    add        r4,#0x2
    mov        pc,lr
thumb_func_end JT_Layout_F2_DialogueControl

thumb_func_start JT_Command_F3_FlagControl
JT_Command_F3_FlagControl:
    push       { lr }
    ldr        r1,=funcListFlagControl
    ldrb       r0,[r4,#0x1]
    ldr        r1,[r1,r0]
    ldrb       r0,[r4,#0x2]
    ldrb       r2,[r4,#0x3]
    lsl        r2,r2,#0x8
    orr        r0,r2
    push       { r4, r5 }
    mov        lr,pc
    bx         r1
    pop        { r4, r5 }
    add        r4,#0x4
    mov        r0,#0x1
    pop        { pc }
thumb_func_end JT_Command_F3_FlagControl

    .align 2, 0
    .pool
funcListFlagControl:
    .word Flag_SetBase+1
    .word Flag_ClearBase+1
    .word Flag_SetEmail+1

thumb_func_start JT_Layout_F3_FlagControl
JT_Layout_F3_FlagControl:
    add        r4,#0x4
    mov        pc,lr
thumb_func_end JT_Layout_F3_FlagControl

thumb_func_start JT_Command_F4_JumpConditional
JT_Command_F4_JumpConditional:
    push       { lr }
    ldr        r0,=funcListJumpConditional
    ldrb       r1,[r4,#0x1]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        { pc }
thumb_func_end JT_Command_F4_JumpConditional

    .align 2, 0
    .pool
funcListJumpConditional:
    .word JT_Command_F4_00_JumpIfFlag
    .word JT_Command_F4_04_JumpIfStoryRange
    .word JT_Command_F4_08_JumpIfShopStock
    .word JT_Command_F4_0C_JumpIfChip
    .word JT_Command_F4_10_JumpIfLevel
    .word JT_Command_F4_14_JumpIfBustRank
    .word JT_Command_F4_18_JumpIfLibrary

thumb_func_start JT_Command_F4_00_JumpIfFlag
JT_Command_F4_00_JumpIfFlag:
    push       { lr }
    ldrb       r0,[r4,#0x2]
    ldrb       r2,[r4,#0x3]
    lsl        r2,r2,#0x8
    orr        r0,r2
    mov        r1,#0x0
    push       { r1, r4, r5 }
    bl         Flag_GetBase
    pop        { r0, r4, r5 }
    bne        LAB_08013f10
    mov        r0,#0x1
LAB_08013f10:
    add        r0,#0x4
    ldrb       r0,[r4,r0]
    cmp        r0,#0xff
    beq        LAB_08013f2c
    add        r1,r0,#0x0
    ldr        r0,[r5,#0x24]
    lsl        r1,r1,#0x1
    ldrh       r1,[r0,r1]
    add        r0,r0,r1
    str        r0,[r5,#0x20]
    str        r0,[r5,#0x28]
    add        r4,r0,#0x0
    mov        r0,#0x1
    pop        { pc }
LAB_08013f2c:
    add        r4,#0x6
    mov        r0,#0x1
    pop        { pc }
thumb_func_end JT_Command_F4_00_JumpIfFlag

thumb_func_start JT_Command_F4_04_JumpIfStoryRange
JT_Command_F4_04_JumpIfStoryRange:
    push       { lr }
    ldrb       r1,[r4,#0x2]
    ldrb       r2,[r4,#0x3]
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrb       r7,[r7,#0x6]
    mov        r0,#0x5
    cmp        r7,r1
    blt        LAB_08013f4c
    cmp        r7,r2
    bgt        LAB_08013f4c
    mov        r0,#0x4
LAB_08013f4c:
    ldrb       r0,[r4,r0]
    cmp        r0,#0xff
    beq        LAB_08013f66
    add        r1,r0,#0x0
    ldr        r0,[r5,#0x24]
    lsl        r1,r1,#0x1
    ldrh       r1,[r0,r1]
    add        r0,r0,r1
    str        r0,[r5,#0x20]
    str        r0,[r5,#0x28]
    add        r4,r0,#0x0
    mov        r0,#0x1
    pop        { pc }
LAB_08013f66:
    add        r4,#0x6
    mov        r0,#0x1
    pop        { pc }
thumb_func_end JT_Command_F4_04_JumpIfStoryRange

thumb_func_start JT_Command_F4_08_JumpIfShopStock
JT_Command_F4_08_JumpIfShopStock:
    push       { lr }
    ldrb       r0,[r4,#0x2]
    push       { r4, r5 }
    bl         FUN_0801f974
    pop        { r4, r5 }
    mov        r1,#0x4
    tst        r0,r0
    beq        LAB_08013f80
    mov        r1,#0x3
LAB_08013f80:
    ldrb       r0,[r4,r1]
    cmp        r0,#0xff
    beq        LAB_08013f9a
    add        r1,r0,#0x0
    ldr        r0,[r5,#0x24]
    lsl        r1,r1,#0x1
    ldrh       r1,[r0,r1]
    add        r0,r0,r1
    str        r0,[r5,#0x20]
    str        r0,[r5,#0x28]
    add        r4,r0,#0x0
    mov        r0,#0x1
    pop        { pc }
LAB_08013f9a:
    add        r4,#0x5
    mov        r0,#0x1
    pop        { pc }
thumb_func_end JT_Command_F4_08_JumpIfShopStock

thumb_func_start JT_Command_F4_0C_JumpIfChip
JT_Command_F4_0C_JumpIfChip:
    push       { lr }
    ldrb       r0,[r4,#0x2]
    ldrb       r6,[r4,#0x3]
    mov        r3,#0x0
    ldr        r7,PTR_gFolder_08013fe4
    mov        r1,#0x4
LAB_08013fac:
    ldrb       r2,[r7,#0x0]
    cmp        r0,r2
    bne        LAB_08013fb8
    ldrb       r2,[r7,#0x1]
    cmp        r6,r2
    beq        LAB_08013fc2
LAB_08013fb8:
    add        r7,#0x2
    add        r3,#0x1
    cmp        r3,#0x1e
    blt        LAB_08013fac
    mov        r1,#0x5
LAB_08013fc2:
    ldrb       r0,[r4,r1]
    cmp        r0,#0xff
    beq        LAB_08013fdc
    add        r1,r0,#0x0
    ldr        r0,[r5,#0x24]
    lsl        r1,r1,#0x1
    ldrh       r1,[r0,r1]
    add        r0,r0,r1
    str        r0,[r5,#0x20]
    str        r0,[r5,#0x28]
    add        r4,r0,#0x0
    mov        r0,#0x1
    pop        { pc }
LAB_08013fdc:
    add        r4,#0x6
    mov        r0,#0x1
    pop        { pc }
thumb_func_end JT_Command_F4_0C_JumpIfChip

    .align 2, 0
PTR_gFolder_08013fe4:
    .word       gFolder

thumb_func_start JT_Command_F4_10_JumpIfLevel
JT_Command_F4_10_JumpIfLevel:
    push       { lr }
    ldrb       r1,[r4,#0x2]
    ldrb       r2,[r4,#0x3]
    push       { r1, r2, r4, r5 }
    bl         Status_GetLevel
    add        r7,r0,#0x0
    pop        { r1, r2, r4, r5 }
    mov        r0,#0x5
    cmp        r7,r1
    blt        LAB_08014004
    cmp        r7,r2
    bgt        LAB_08014004
    mov        r0,#0x4
LAB_08014004:
    ldrb       r0,[r4,r0]
    cmp        r0,#0xff
    beq        LAB_0801401e
    add        r1,r0,#0x0
    ldr        r0,[r5,#0x24]
    lsl        r1,r1,#0x1
    ldrh       r1,[r0,r1]
    add        r0,r0,r1
    str        r0,[r5,#0x20]
    str        r0,[r5,#0x28]
    add        r4,r0,#0x0
    mov        r0,#0x1
    pop        { pc }
LAB_0801401e:
    add        r4,#0x6
    mov        r0,#0x1
    pop        { pc }
thumb_func_end JT_Command_F4_10_JumpIfLevel

thumb_func_start JT_Command_F4_14_JumpIfBustRank
JT_Command_F4_14_JumpIfBustRank:
    push       { lr }
    ldrb       r1,[r4,#0x2]
    ldrb       r2,[r4,#0x3]
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrb       r7,[r7,#0x19]
    mov        r0,#0x5
    cmp        r7,r1
    blt        LAB_0801403c
    cmp        r7,r2
    bgt        LAB_0801403c
    mov        r0,#0x4
LAB_0801403c:
    ldrb       r0,[r4,r0]
    cmp        r0,#0xff
    beq        LAB_08014056
    add        r1,r0,#0x0
    ldr        r0,[r5,#0x24]
    lsl        r1,r1,#0x1
    ldrh       r1,[r0,r1]
    add        r0,r0,r1
    str        r0,[r5,#0x20]
    str        r0,[r5,#0x28]
    add        r4,r0,#0x0
    mov        r0,#0x1
    pop        { pc }
LAB_08014056:
    add        r4,#0x6
    mov        r0,#0x1
    pop        { pc }
thumb_func_end JT_Command_F4_14_JumpIfBustRank

thumb_func_start JT_Command_F4_18_JumpIfLibrary
JT_Command_F4_18_JumpIfLibrary:
    push       { lr }
    ldrb       r1,[r4,#0x2]
    ldrb       r2,[r4,#0x3]
    push       { r1, r2, r4, r5 }
    bl         Library_GetStandardChipCount
    add        r7,r1,#0x0
    pop        { r1, r2, r4, r5 }
    mov        r0,#0x5
    cmp        r7,r1
    blt        LAB_08014078
    cmp        r7,r2
    bgt        LAB_08014078
    mov        r0,#0x4
LAB_08014078:
    ldrb       r0,[r4,r0]
    cmp        r0,#0xff
    beq        LAB_08014092
    add        r1,r0,#0x0
    ldr        r0,[r5,#0x24]
    lsl        r1,r1,#0x1
    ldrh       r1,[r0,r1]
    add        r0,r0,r1
    str        r0,[r5,#0x20]
    str        r0,[r5,#0x28]
    add        r4,r0,#0x0
    mov        r0,#0x1
    pop        { pc }
LAB_08014092:
    add        r4,#0x6
    mov        r0,#0x1
    pop        { pc }
thumb_func_end JT_Command_F4_18_JumpIfLibrary

thumb_func_start JT_Layout_F4_JumpConditional
JT_Layout_F4_JumpConditional:
    ldr        r0,=INT_ARRAY_080140a8
    ldrb       r1,[r4,#0x1]
    ldr        r0,[r0,r1]
    add        r4,r4,r0
    mov        pc,lr
thumb_func_end JT_Layout_F4_JumpConditional

    .align 2, 0
    .pool
INT_ARRAY_080140a8:
    .word 6, 6, 5, 6, 6, 6, 6

thumb_func_start JT_Command_F5_InputControl
JT_Command_F5_InputControl:
    push       { lr }
    ldrb       r0,[r4,#0x1]
    tst        r0,r0
    beq        LAB_080140d4
    @ F5 xx = Enable input reading
    mov        r0,#TF_DisableInput
    bl         Text_DisableOption
    b          LAB_080140da
    @ F5 00 = Disable input reading
LAB_080140d4:
    mov        r0,#TF_DisableInput
    bl         Text_EnableOption
LAB_080140da:
    add        r4,#0x2
    mov        r0,#0x1
    pop        { pc }
thumb_func_end JT_Command_F5_InputControl

thumb_func_start JT_Layout_F5_InputControl
JT_Layout_F5_InputControl:
    add        r4,#0x2
    mov        pc,lr
thumb_func_end JT_Layout_F5_InputControl

thumb_func_start JT_Command_F6_JumpTextBlock
JT_Command_F6_JumpTextBlock:
    push       { lr }
    ldrb       r0,[r4,#0x1]
    tst        r0,r0
    bne        LAB_0801410c
    mov        r1,#0x2
    ldrb       r0,[r4,r1]
LAB_080140f0:
    cmp        r0,#0xff
    beq        LAB_08014122
    @ F6 00 xx = Jump to text block xx
    add        r1,r0,#0x0
    ldr        r0,[r5,#0x24]
    lsl        r1,r1,#0x1
    ldrh       r1,[r0,r1]
    add        r0,r0,r1
    str        r0,[r5,#0x20]
    str        r0,[r5,#0x28]
    mov        r1,#0x0
    str        r1,[r5,#0x58]
    strb       r1,[r5,#0x2]
    add        r4,r0,#0x0
    b          LAB_08014124
LAB_0801410c:
    push       { r0, r4, r5 }
    bl         Rng_RandomInt
    pop        { r1, r4, r5 }
    add        r2,r1,#0x0
    and        r1,r0
    add        r4,#0x2
    ldrb       r0,[r4,r1]
    sub        r4,#0x2
    add        r4,r4,r2
    b          LAB_080140f0
LAB_08014122:
    add        r4,#0x3
LAB_08014124:
    mov        r0,#0x1
    pop        { pc }
thumb_func_end JT_Command_F6_JumpTextBlock

thumb_func_start JT_Layout_F6_JumpTextBlock
JT_Layout_F6_JumpTextBlock:
    ldrb       r0,[r4,#0x1]
    add        r0,#0x3
    add        r4,r4,r0
    mov        pc,lr
thumb_func_end JT_Layout_F6_JumpTextBlock

@ Handle general item commands
thumb_func_start JT_Command_F7_ItemControl
JT_Command_F7_ItemControl:
    push       { lr }
    @ If following byte is >= 0x10, go to chip control instead
    ldrb       r0,[r4,#0x1]
    mov        r1,#0x10
    tst        r0,r1
    beq        .checkCommand
    bl         JT_Command_F7_ChipControl
.checkCommand:
    cmp        r0,#0x0
    beq        .checkGiveItem
    cmp        r0,#0x1
    beq        .checkTakeItem
    cmp        r0,#0x2
    beq        .checkSetItem
    b          .checkItemPresent
.checkGiveItem:
    @ F7 00 id am - Attempt to give [am] amount of [id] item
    push       { r4, r5 }
    mov        r0,#SE_MysteryDataItemGet
    bl         Sound_PlaySongImmediate
    ldrb       r0,[r4,#0x2]
    ldrb       r1,[r4,#0x3]
    bl         KeyItem_AddAmount
    pop        { r4, r5 }
    add        r0,#0x4
    ldrb       r1,[r4,r0]
    b          .jumpToNextScript
.checkTakeItem:
    @ F7 01 id am - Attempt to take [am] amount of [id] item
    push       { r4, r5 }
    ldrb       r0,[r4,#0x2]
    ldrb       r1,[r4,#0x3]
    bl         KeyItem_SubtractAmount
    pop        { r4, r5 }
    add        r0,#0x4
    ldrb       r1,[r4,r0]
    b          .jumpToNextScript
.checkSetItem:
    @ F7 02 id am - Attempt to set [am] amount of [id] item
    push       { r4, r5 }
    mov        r0,#0x85
    bl         Sound_PlaySongImmediate
    ldrb       r0,[r4,#0x2]
    ldrb       r1,[r4,#0x3]
    bl         KeyItem_SetAmount
    pop        { r4, r5 }
    add        r4,#0x4
    mov        r0,#0x1
    pop        { pc }
.checkItemPresent:
    @ F7 xx id am - - Attempt to check for [am] amount of [id] item
    push       { r4, r5 }
    ldrb       r0,[r4,#0x2]
    bl         KeyItem_IsPresent
    pop        { r4, r5 }
    ldrb       r1,[r4,#0x3]
    @ item present in exact amount = 0
    mov        r2,#0x0
    cmp        r0,r1
    beq        .afterItemPresent
    @ item has greater than specified = 1
    add        r2,#0x1
    cmp        r0,r1
    bgt        .afterItemPresent
    @ item has less than specified = 2
    add        r2,#0x1
.afterItemPresent:
    add        r2,#0x4
    ldrb       r1,[r4,r2]
.jumpToNextScript:
    @ Following 3 bytes determine where to jump next
    @ First is for all items given, second is for none, third is for some
    cmp        r1,#0xff
    beq        .continueScript
    ldr        r0,[r5,#Text_m_textBlockPointer]
    lsl        r1,r1,#0x1
    ldrh       r1,[r0,r1]
    add        r0,r0,r1
    str        r0,[r5,#Text_m_commandTextPointer]
    str        r0,[r5,#Text_m_layoutTextPointer]
    mov        r1,#0x0
    str        r1,[r5,#Text_m_textBufIndex]
    strb       r1,[r5,#Text_m_textBufferOffset]
    add        r4,r0,#0x0
    mov        r0,#0x1
    pop        { pc }
.continueScript:
    add        r4,#0x7
    mov        r0,#0x1
    pop        { pc }
thumb_func_end JT_Command_F7_ItemControl

thumb_func_start JT_Layout_F7_ItemControl
JT_Layout_F7_ItemControl:
    push       { lr }
    ldrb       r0,[r4,#0x1]
    mov        r1,#0x10
    tst        r0,r1
    beq        1f
    bl         JT_Layout_F7_1X_ChipControl
1:
    ldrb       r0,[r4,#0x1]
    ldr        r1,=DAT_080141ec
    ldrb       r0,[r1,r0]
    add        r4,r4,r0
    pop        { pc }
thumb_func_end JT_Layout_F7_ItemControl

    .align 2, 0
    .pool
DAT_080141ec:
    .byte 7, 7, 4, 7, 7, 0

thumb_func_start JT_Command_F8_PasscodeControl
JT_Command_F8_PasscodeControl:
    push       { lr }
    ldr        r0,=funcListPasscodeControl
    ldrb       r1,[r4,#0x1]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        { pc }
thumb_func_end JT_Command_F8_PasscodeControl

    .align 2, 0
    .pool
funcListPasscodeControl:
    .word       JT_Command_F8_00_PasscodeInit
    .word       JT_Command_F8_04_PasscodePick
    .word       JT_Command_F8_08_PasscodeCheck
    .word       JT_Command_F8_0C_PasscodeHide
    .word       JT_Command_F8_10_PasscodeShift

thumb_func_start JT_Command_F8_00_PasscodeInit
JT_Command_F8_00_PasscodeInit:
    push       { lr }
    mov        r0,#0x1
    bl         Text_EnableScriptOption
    ldrb       r0,[r5,#0x4]
    cmp        r0,#0x0
    bne        LAB_08014258
    mov        r0,#0x20
    bl         Text_CheckScriptOption
    bne        LAB_0801423e
    ldrb       r0,[r4,#0x2]
    ldrb       r1,[r4,#0x3]
    push       { r4, r5 }
    bl         Passcode_Init
    pop        { r4, r5 }
LAB_0801423e:
    push       { r4, r5 }
    bl         FUN_080190cc
    pop        { r4, r5 }
    mov        r0,#0x60
    bl         Text_EnableScriptOption
    mov        r0,#0x5
    strh       r0,[r5,#0xc]
    mov        r0,#0x1
    strb       r0,[r5,#0x4]
    mov        r0,#0x0
    pop        { pc }
LAB_08014258:
    ldrh       r0,[r5,#0xc]
    sub        r0,#0x1
    strh       r0,[r5,#0xc]
    cmp        r0,#0x0
    ble        LAB_08014266
    mov        r0,#0x0
    pop        { pc }
LAB_08014266:
    mov        r0,#0x41
    bl         Text_DisableScriptOption
    mov        r0,#0x0
    strh       r0,[r5,#0xc]
    strb       r0,[r5,#0x4]
    add        r4,#0x4
    mov        r0,#0x1
    pop        { pc }
thumb_func_end JT_Command_F8_00_PasscodeInit

thumb_func_start JT_Command_F8_04_PasscodePick
JT_Command_F8_04_PasscodePick:
    push       { lr }
    mov        r0,#0x1
    bl         Text_EnableScriptOption
    ldrb       r1,[r5,#0x16]
    tst        r1,r1
    beq        LAB_080142b2
    mov        r0,#0x40
    bl         Text_EnableScriptOption
    add        r1,#0x1
    ldrb       r1,[r4,r1]
    cmp        r1,#0xff
    beq        LAB_080142ac
    ldr        r0,[r5,#0x24]
    lsl        r1,r1,#0x1
    ldrh       r1,[r0,r1]
    add        r0,r0,r1
    str        r0,[r5,#0x20]
    str        r0,[r5,#0x28]
    mov        r1,#0x0
    str        r1,[r5,#0x58]
    strb       r1,[r5,#0x2]
    add        r4,r0,#0x0
    mov        r0,#0x1
    pop        { pc }
LAB_080142ac:
    add        r4,#0x2
    mov        r0,#0x1
    pop        { pc }
LAB_080142b2:
    mov        r0,#0x0
    pop        { pc }
thumb_func_end JT_Command_F8_04_PasscodePick

thumb_func_start JT_Command_F8_08_PasscodeCheck
JT_Command_F8_08_PasscodeCheck:
    push       { lr }
    mov        r0,#0x1
    bl         Text_EnableScriptOption
    ldrb       r1,[r5,#0x17]
    add        r1,#0x2
    ldrb       r1,[r4,r1]
    cmp        r1,#0xff
    beq        LAB_080142e2
    ldr        r0,[r5,#0x24]
    lsl        r1,r1,#0x1
    ldrh       r1,[r0,r1]
    add        r0,r0,r1
    str        r0,[r5,#0x20]
    str        r0,[r5,#0x28]
    mov        r1,#0x0
    str        r1,[r5,#0x58]
    strb       r1,[r5,#0x2]
    add        r4,r0,#0x0
    mov        r0,#0x1
    pop        { pc }
LAB_080142e2:
    add        r4,#0x9
    mov        r0,#0x1
    pop        { pc }
thumb_func_end JT_Command_F8_08_PasscodeCheck

thumb_func_start FUN_080142e8
FUN_080142e8:
    mov        r0,#0x0
    pop        { pc }
thumb_func_end FUN_080142e8

thumb_func_start JT_Command_F8_10_PasscodeShift
JT_Command_F8_10_PasscodeShift:
    push       { lr }
    mov        r0,#0x1
    bl         Text_EnableScriptOption
    push       { r4, r5 }
    bl         FUN_080190dc
    pop        { r4, r5 }
    add        r1,r0,#0x0
    cmp        r1,#0xff
    beq        LAB_08014322
    add        r1,#0x2
    ldrb       r1,[r4,r1]
    cmp        r1,#0xff
    beq        LAB_08014322
    ldr        r0,[r5,#0x24]
    lsl        r1,r1,#0x1
    ldrh       r1,[r0,r1]
    add        r0,r0,r1
    str        r0,[r5,#0x20]
    str        r0,[r5,#0x28]
    mov        r1,#0x0
    str        r1,[r5,#0x58]
    strb       r1,[r5,#0x2]
    add        r4,r0,#0x0
    mov        r0,#0x1
    pop        { pc }
LAB_08014322:
    add        r4,#0x6
    mov        r0,#0x1
    pop        { pc }
thumb_func_end JT_Command_F8_10_PasscodeShift

thumb_func_start FUN_08014328
FUN_08014328:
    mov        r0,#0x0
    pop        { pc }
thumb_func_end FUN_08014328

thumb_func_start JT_Command_F8_0C_PasscodeHide
JT_Command_F8_0C_PasscodeHide:
    push       { lr }
    mov        r0,#0x20
    bl         Text_DisableScriptOption
    add        r4,#0x2
    mov        r0,#0x1
    pop        { pc }
thumb_func_end JT_Command_F8_0C_PasscodeHide

thumb_func_start JT_Layout_F8_PasscodeControl
JT_Layout_F8_PasscodeControl:
    ldr        r0,=INT_ARRAY_0801434c
    ldrb       r1,[r4,#0x1]
    ldr        r0,[r0,r1]
    add        r4,r4,r0
    mov        pc,lr
thumb_func_end JT_Layout_F8_PasscodeControl

    .align 2, 0
    .pool
INT_ARRAY_0801434c:
    .word 4, 6, 9, 2, 6

@ Handle chip bag actions
thumb_func_start JT_Command_F7_ChipControl
JT_Command_F7_ChipControl:
    sub        r0,#0x10
    cmp        r0,#0x0
    beq        .checkGiveChip
    cmp        r0,#0x1
    beq        .checkTakeChip
    cmp        r0,#0x2
    beq        LAB_080143a2
    cmp        r0,#0x4
    beq        LAB_080143bc
    b          LAB_080143de
    @ F7 10 id cd ct al nn sm
    @ Try and give ct chips id cc
.checkGiveChip:
    push       { r4, r5 }
    mov        r0,#SE_MysteryDataItemGet
    bl         Sound_PlaySongImmediate
    ldrb       r0,[r4,#0x2]
    ldrb       r1,[r4,#0x3]
    ldrb       r2,[r4,#0x4]
    bl         Inventory_AddChip
    pop        { r4, r5 }
    add        r0,#0x5
    ldrb       r1,[r4,r0]
    b          LAB_0801440e
    @ F7 11 id cc ct
.checkTakeChip:
    push       { r4, r5 }
    ldrb       r0,[r4,#0x2]
    ldrb       r1,[r4,#0x3]
    ldrb       r2,[r4,#0x4]
    bl         Inventory_SubtractChip
    pop        { r4, r5 }
    add        r0,#0x5
    ldrb       r1,[r4,r0]
    b          LAB_0801440e
    @ F7 12
LAB_080143a2:
    push       { r4, r5 }
    mov        r0,#0x85
    bl         Sound_PlaySongImmediate
    ldrb       r0,[r4,#0x2]
    ldrb       r1,[r4,#0x3]
    ldrb       r2,[r4,#0x4]
    bl         Inventory_SetChip
    pop        { r4, r5 }
    add        r4,#0x5
    mov        r0,#0x1
    pop        { pc }
    @ F7 14
LAB_080143bc:
    push       { r4, r5 }
    ldrb       r0,[r4,#0x2]
    ldrb       r1,[r4,#0x3]
    bl         Inventory_GetChipCount
    pop        { r4, r5 }
    ldrb       r1,[r4,#0x4]
    mov        r2,#0x0
    cmp        r0,r1
    beq        LAB_080143d8
    add        r2,#0x1
    cmp        r0,r1
    bgt        LAB_080143d8
    add        r2,#0x1
LAB_080143d8:
    add        r2,#0x5
    ldrb       r1,[r4,r2]
    b          LAB_0801440e
    @ F7 1X
LAB_080143de:
    push       { r4, r5 }
    ldrb       r0,[r4,#0x2]
    ldrb       r1,[r4,#0x3]
    bl         Inventory_GetChipCount
    pop        { r4, r5 }
    push       { r0, r4, r5 }
    ldrb       r0,[r4,#0x2]
    ldrb       r1,[r4,#0x3]
    bl         Folder_GetChipCount
    add        r1,r0,#0x0
    pop        { r0, r4, r5 }
    sub        r0,r0,r1
    ldrb       r1,[r4,#0x4]
    mov        r2,#0x0
    cmp        r0,r1
    beq        LAB_0801440a
    add        r2,#0x1
    cmp        r0,r1
    bgt        LAB_0801440a
    add        r2,#0x1
LAB_0801440a:
    add        r2,#0x5
    ldrb       r1,[r4,r2]
LAB_0801440e:
    cmp        r1,#0xff
    beq        LAB_0801442a
    ldr        r0,[r5,#0x24]
    lsl        r1,r1,#0x1
    ldrh       r1,[r0,r1]
    add        r0,r0,r1
    str        r0,[r5,#0x20]
    str        r0,[r5,#0x28]
    mov        r1,#0x0
    str        r1,[r5,#0x58]
    strb       r1,[r5,#0x2]
    add        r4,r0,#0x0
    mov        r0,#0x1
    pop        { pc }
LAB_0801442a:
    add        r4,#0x8
    mov        r0,#0x1
    pop        { pc }
thumb_func_end JT_Command_F7_ChipControl

thumb_func_start JT_Layout_F7_1X_ChipControl
JT_Layout_F7_1X_ChipControl:
    sub        r0,#0x10
    ldrb       r0,[r4,#0x1]
    sub        r0,#0x10
    ldr        r1,=DAT_08014444
    ldrb       r0,[r1,r0]
    add        r4,r4,r0
    pop        { pc }
thumb_func_end JT_Layout_F7_1X_ChipControl

    .align 2, 0
    .pool
DAT_08014444:
    .byte 8, 8, 5, 8, 8, 8

thumb_func_start JT_Command_F9_TextPalette
JT_Command_F9_TextPalette:
    ldrb       r0,[r4,#0x1]
    strb       r0,[r5,#0x13]
    add        r4,#0x2
    mov        r0,#0x1
    mov        pc,lr
thumb_func_end JT_Command_F9_TextPalette


thumb_func_start JT_Layout_F9_TextPalette
JT_Layout_F9_TextPalette:
    add        r4,#0x2
    mov        pc,lr
thumb_func_end JT_Layout_F9_TextPalette

thumb_func_start JT_Command_FA_PlayerAnimControl
JT_Command_FA_PlayerAnimControl:
    push       { lr }
    ldr        r0,=funcListPlayerAnimControl
    ldrb       r1,[r4,#0x1]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        { pc }
thumb_func_end JT_Command_FA_PlayerAnimControl

    .align 2, 0
    .pool
funcListPlayerAnimControl:
    .word      JT_Command_FA_00_PlayerAnimLock
    .word      JT_Command_FA_04_PlayerAnimSet
    .word      JT_Command_FA_08_PlayerAnimUnlock
    .word      JT_Command_FA_0C_WaitForPlayerAnim
    .word      JT_Command_FA_10_RestorePlayerAnim

thumb_func_start JT_Command_FA_00_PlayerAnimLock
JT_Command_FA_00_PlayerAnimLock:
    push       { lr }
    mov        r0,#0x1
    bl         Text_EnableScriptOption
    ldrb       r0,[r5,#0x4]
    tst        r0,r0
    bne        LAB_080144a0
    push       { r4, r5 }
    bl         PlayerAnimation_Lock
    pop        { r4, r5 }
    mov        r0,#0x1
    strb       r0,[r5,#0x4]
    b          LAB_080144b6
LAB_080144a0:
    push       { r4, r5 }
    bl         PlayerAnimation_Get
    pop        { r4, r5 }
    cmp        r0,#0x2
    bne        LAB_080144b6
    mov        r0,#0x0
    strb       r0,[r5,#0x4]
    add        r4,#0x2
    mov        r0,#0x1
    pop        { pc }
LAB_080144b6:
    mov        r0,#0x0
    pop        { pc }
thumb_func_end JT_Command_FA_00_PlayerAnimLock


thumb_func_start JT_Command_FA_04_PlayerAnimSet
JT_Command_FA_04_PlayerAnimSet:
    push       { lr }
    mov        r0,#0x1
    bl         Text_EnableScriptOption
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldr        r7,[r7,#0x28]
    add        r1,r5,#0x0
    add        r1,#0x54
    ldrb       r2,[r7,#0x14]
    strb       r2,[r1,#0x0]
    push       { r4, r5 }
    ldrb       r0,[r4,#0x2]
    cmp        r0,#0x7
    bgt        LAB_080144dc
    strb       r0,[r7,#0x10]
LAB_080144dc:
    bl         PlayerAnimation_Set
    pop        { r4, r5 }
    add        r4,#0x3
    mov        r0,#0x0
    pop        { pc }
thumb_func_end JT_Command_FA_04_PlayerAnimSet

thumb_func_start JT_Command_FA_08_PlayerAnimUnlock
JT_Command_FA_08_PlayerAnimUnlock:
    push       { lr }
    push       { r4, r5 }
    bl         PlayerAnimation_Unlock
    pop        { r4, r5 }
    add        r4,#0x2
    mov        r0,#0x1
    pop        { pc }
thumb_func_end JT_Command_FA_08_PlayerAnimUnlock

thumb_func_start JT_Command_FA_0C_WaitForPlayerAnim
JT_Command_FA_0C_WaitForPlayerAnim:
    push       { lr }
    mov        r0,#0x1
    bl         Text_EnableScriptOption
    push       { r4, r5 }
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldr        r5,[r0,#0x28]
    bl         FUN_080025ec
    pop        { r4, r5 }
    mov        r1,#0x80
    and        r1,r0
    bne        LAB_08014518
    mov        r0,#0x0
    pop        { pc }
LAB_08014518:
    add        r4,#0x2
    mov        r0,#0x1
    pop        { pc }
thumb_func_end JT_Command_FA_0C_WaitForPlayerAnim

thumb_func_start JT_Command_FA_10_RestorePlayerAnim
JT_Command_FA_10_RestorePlayerAnim:
    push       { lr }
    mov        r0,#0x1
    bl         Text_EnableScriptOption
    push       { r4, r5 }
    add        r1,r5,#0x0
    add        r1,#0x54
    ldrb       r0,[r1,#0x0]
    cmp        r0,#0x7
    bgt        LAB_0801453c
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldr        r7,[r7,#0x28]
    strb       r0,[r7,#0x10]
LAB_0801453c:
    bl         PlayerAnimation_Set
    pop        { r4, r5 }
    add        r4,#0x2
    mov        r0,#0x0
    pop        { pc }
thumb_func_end JT_Command_FA_10_RestorePlayerAnim

thumb_func_start JT_Layout_FA_PlayerAnimControl
JT_Layout_FA_PlayerAnimControl:
    ldr        r0,=INT_ARRAY_08014558
    ldrb       r1,[r4,#0x1]
    ldr        r0,[r0,r1]
    add        r4,r4,r0
    mov        pc,lr
thumb_func_end JT_Layout_FA_PlayerAnimControl

    .align 2, 0
    .pool
INT_ARRAY_08014558:
    .word 2, 3, 2, 2, 2

thumb_func_start JT_Command_FB_PrintControl
JT_Command_FB_PrintControl:
    push       { lr }
    ldr        r0,=funcListPrintControl
    ldrb       r1,[r4,#0x1]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        { pc }
thumb_func_end JT_Command_FB_PrintControl

    .align 2, 0
    .pool
funcListPrintControl:
    .word      JT_Command_FB_00_PrintItemName
    .word      JT_Command_FB_04_PrintItemAmount
    .word      JT_Command_FB_08_PrintChipAmount
    .word      JT_Command_FB_0C_PrintZennyBuffer

thumb_func_start JT_Command_FB_00_PrintItemName
JT_Command_FB_00_PrintItemName:
    push       { lr }
    ldrb       r0,[r5,#0x5]
    add        r0,#0x1
    strb       r0,[r5,#0x5]
    ldr        r0,=PTR_textDict_Item_Names_080145f0
    ldrb       r1,[r4,#0x2]
    ldrb       r2,[r4,#0x3]
    lsr        r3,r2,#0x4
    tst        r3,r3
    beq        LAB_080145ac
    sub        r3,#0x1
    lsl        r3,r3,#0x2
    add        r3,#0x30
    ldr        r1,[r5,r3]
LAB_080145ac:
    mov        r3,#0xf
    and        r2,r3
    lsl        r2,r2,#0x2
    ldr        r0,[r0,r2]
    lsl        r1,r1,#0x1
    ldrh       r1,[r0,r1]
    add        r0,r0,r1
    push       { r4, r5 }
    add        r7,r5,#0x0
    add        r7,#0x58
    ldrh       r2,[r7,#0x0]
    lsl        r2,r2,#0x6
    ldr        r1,PTR_gTextBufferList_080146d8
    add        r1,r1,r2
    push       { r1 }
    mov        r2,#0x40
    bl         memcpy_8
    pop        { r0 }
    pop        { r4, r5 }
    add        r7,r5,#0x0
    add        r7,#0x58
    ldrh       r1,[r7,#0x0]
    add        r1,#0x1
    str        r1,[r7,#0x0]
    str        r0,[r5,#0x20]
    add        r4,#0x4
    str        r4,[r5,#0x40]
    add        r4,r0,#0x0
    mov        r0,#0x1
    pop        { pc }
thumb_func_end JT_Command_FB_00_PrintItemName
    
    .align  2, 0
    .pool
PTR_textDict_Item_Names_080145f0:
    .word textDict_Item_Names
    .word textDict_BattleChip_Names
    .word textDict_BattleChip_Codes

thumb_func_start JT_Command_FB_04_PrintItemAmount
JT_Command_FB_04_PrintItemAmount:
    push       { lr }
    ldrb       r0,[r5,#0x5]
    add        r0,#0x1
    strb       r0,[r5,#0x5]
    push       { r4, r5 }
    ldrb       r0,[r4,#0x3]
    bl         KeyItem_IsPresent
    pop        { r4, r5 }
    ldrb       r1,[r4,#0x2]
    add        r2,r5,#0x0
    add        r2,#0x48
    bl         Text_WriteNumberToBcdBuffer
    add        r0,r5,#0x0
    add        r0,#0x48
    str        r0,[r5,#0x20]
    add        r4,#0x4
    str        r4,[r5,#0x40]
    add        r4,r0,#0x0
    mov        r0,#0x1
    pop        { pc }
thumb_func_end JT_Command_FB_04_PrintItemAmount

thumb_func_start JT_Command_FB_08_PrintChipAmount
JT_Command_FB_08_PrintChipAmount:
    push       { lr }
    ldrb       r0,[r5,#0x5]
    add        r0,#0x1
    strb       r0,[r5,#0x5]
    push       { r4, r5 }
    ldrb       r0,[r4,#0x3]
    ldrb       r1,[r4,#0x4]
    bl         Inventory_GetChipCount
    pop        { r4, r5 }
    ldrb       r1,[r4,#0x2]
    add        r2,r5,#0x0
    add        r2,#0x48
    bl         Text_WriteNumberToBcdBuffer
    add        r0,r5,#0x0
    add        r0,#0x48
    str        r0,[r5,#0x20]
    add        r4,#0x5
    str        r4,[r5,#0x40]
    add        r4,r0,#0x0
    mov        r0,#0x1
    pop        { pc }
thumb_func_end JT_Command_FB_08_PrintChipAmount

thumb_func_start JT_Command_FB_0C_PrintZennyBuffer
JT_Command_FB_0C_PrintZennyBuffer:
    push       { lr }
    ldrb       r0,[r5,#0x5]
    add        r0,#0x1
    strb       r0,[r5,#0x5]
    ldrb       r0,[r4,#0x3]
    tst        r0,r0
    beq        LAB_08014670
    sub        r0,#0x1
    lsl        r0,r0,#0x2
    add        r0,#0x30
    ldr        r0,[r5,r0]
    b          LAB_08014676
LAB_08014670:
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldr        r0,[r7,#0x74]
LAB_08014676:
    ldrb       r1,[r4,#0x2]
    add        r2,r5,#0x0
    add        r2,#0x48
    bl         Text_WriteNumberToBcdBuffer
    add        r0,r5,#0x0
    add        r0,#0x48
    str        r0,[r5,#0x20]
    add        r4,#0x4
    str        r4,[r5,#0x40]
    add        r4,r0,#0x0
    mov        r0,#0x1
    pop        { pc }
thumb_func_end JT_Command_FB_0C_PrintZennyBuffer

thumb_func_start JT_Layout_FB_PrintControl
JT_Layout_FB_PrintControl:
    push       { lr }
    ldr        r0,=funcListLayoutPrintControl
    ldrb       r1,[r4,#0x1]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        { pc }
thumb_func_end JT_Layout_FB_PrintControl

    .align 2, 0
    .pool
funcListLayoutPrintControl:
    .word       JT_Layout_FB_00_PrintItemName
    .word       JT_Layout_FB_XX_PrintMisc
    .word       JT_Layout_FB_XX_PrintMisc
    .word       JT_Layout_FB_XX_PrintMisc

thumb_func_start JT_Layout_FB_00_PrintItemName
JT_Layout_FB_00_PrintItemName:
    push       { r3, lr }
    ldrb       r0,[r5,#0x6]
    add        r0,#0x1
    strb       r0,[r5,#0x6]
    add        r7,r5,#0x0
    add        r7,#0x58
    ldrh       r1,[r7,#0x2]
    lsl        r1,r1,#0x6
    ldr        r0,PTR_gTextBufferList_080146d8
    add        r0,r0,r1
    ldrh       r1,[r7,#0x2]
    add        r1,#0x1
    strh       r1,[r7,#0x2]
    add        r4,#0x4
    str        r4,[r5,#0x44]
    add        r4,r0,#0x0
    pop        { r3, pc }
thumb_func_end JT_Layout_FB_00_PrintItemName

    .align 2, 0
PTR_gTextBufferList_080146d8:
    .word       gTextBufferList

thumb_func_start JT_Layout_FB_XX_PrintMisc
JT_Layout_FB_XX_PrintMisc:
    ldrb       r0,[r5,#0x6]
    add        r0,#0x1
    strb       r0,[r5,#0x6]
    add        r0,r5,#0x0
    add        r0,#0x48
    ldr        r2,=DAT_080146fc
    ldrb       r7,[r4,#0x1]
    lsr        r7,r7,#0x2
    ldrb       r2,[r2,r7]
    add        r4,r4,r2
    str        r4,[r5,#0x44]
    add        r4,r0,#0x0
    mov        pc,lr
thumb_func_end JT_Layout_FB_XX_PrintMisc

    .align 2, 0
    .pool
DAT_080146fc:
    .byte 0xFF, 4, 5, 4

thumb_func_start JT_Command_FC_SongControl
JT_Command_FC_SongControl:
    push       { lr }
    ldr        r0,=funcListSongControl
    ldrb       r1,[r4,#0x1]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        { pc }
thumb_func_end JT_Command_FC_SongControl

    .align 2, 0
    .pool
funcListSongControl:
    .word       JT_Command_FC_00_PlaySoundEffect
    .word       JT_Command_FC_01_ChangeSong
    .word       JT_Command_FC_02_DialogSoundOn
    .word       JT_Command_FC_03_DialogSoundOff
    .word       JT_Command_FC_04_StopMusic
    .word       JT_Command_FC_05_SongFadeOut

thumb_func_start JT_Command_FC_00_PlaySoundEffect
JT_Command_FC_00_PlaySoundEffect:
    push       { lr }
    ldrb       r0,[r4,#0x2]
    ldrb       r1,[r4,#0x3]
    lsl        r1,r1,#0x8
    orr        r0,r1
    bl         Sound_PlaySongImmediate
    add        r4,#0x4
    mov        r0,#0x1
    pop        { pc }
thumb_func_end JT_Command_FC_00_PlaySoundEffect

thumb_func_start JT_Command_FC_01_ChangeSong
JT_Command_FC_01_ChangeSong:
    push       { lr }
    ldrb       r0,[r4,#0x2]
    ldrb       r1,[r4,#0x3]
    lsl        r1,r1,#0x8
    orr        r0,r1
    bl         Sound_ChangeSong
    add        r4,#0x4
    mov        r0,#0x1
    pop        { pc }
thumb_func_end JT_Command_FC_01_ChangeSong

thumb_func_start JT_Command_FC_02_DialogSoundOn
JT_Command_FC_02_DialogSoundOn:
    push       { lr }
    mov        r0,#0x80
    bl         Text_DisableScriptOption
    add        r4,#0x2
    mov        r0,#0x1
    pop        { pc }
thumb_func_end JT_Command_FC_02_DialogSoundOn

thumb_func_start JT_Command_FC_03_DialogSoundOff
JT_Command_FC_03_DialogSoundOff:
    push       { lr }
    mov        r0,#0x80
    bl         Text_EnableScriptOption
    add        r4,#0x2
    mov        r0,#0x1
    pop        { pc }
thumb_func_end JT_Command_FC_03_DialogSoundOff

thumb_func_start JT_Command_FC_04_StopMusic
JT_Command_FC_04_StopMusic:
    push       { lr }
    bl         Sound_StopAllMusic
    add        r4,#0x2
    mov        r0,#0x1
    pop        { pc }
thumb_func_end JT_Command_FC_04_StopMusic

thumb_func_start JT_Command_FC_05_SongFadeOut
JT_Command_FC_05_SongFadeOut:
    push       { lr }
    ldrb       r0,[r4,#0x2]
    ldrb       r1,[r4,#0x3]
    bl         Song_FadeOut
    add        r4,#0x4
    mov        r0,#0x1
    pop        { pc }
thumb_func_end JT_Command_FC_05_SongFadeOut

thumb_func_start JT_Layout_FC_SongControl
JT_Layout_FC_SongControl:
    ldr        r0,=INT_ARRAY_080147a0
    ldrb       r1,[r4,#0x1]
    ldr        r0,[r0,r1]
    add        r4,r4,r0
    mov        pc,lr
thumb_func_end JT_Layout_FC_SongControl

    .align 2, 0
    .pool
INT_ARRAY_080147a0:
    .word 4, 4, 2, 2, 2, 4

thumb_func_start JT_Command_FD_MiscControl
JT_Command_FD_MiscControl:
    push       { lr }
    ldr        r0,=funcListMiscControl
    ldrb       r1,[r4,#0x1]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        { pc }
thumb_func_end JT_Command_FD_MiscControl

    .align 2, 0
    .pool
funcListMiscControl:
    .word       JT_Command_FD_00_AwardZenny
    .word       JT_Command_FD_04_AwardChip
    .word       JT_Command_FD_08_StartBattle
    .word       JT_Command_FD_0C_StartShop
    .word       JT_Command_FD_10_StartMiniBoss
    .word       JT_Command_FD_14_StartChipTrader
    .word       JT_Command_FD_18_StartVirusMachineBattle

thumb_func_start JT_Command_FD_00_AwardZenny
JT_Command_FD_00_AwardZenny:
    push       { lr }
    push       { r4, r5 }
    mov        r0,#0x85
    bl         Sound_PlaySongImmediate
    bl         Rng_RandomInt
    pop        { r4, r5 }
    ldrb       r1,[r4,#0x2]
    and        r1,r0
    lsl        r1,r1,#0x2
    add        r0,r1,r4
    add        r0,#0x6
    ldrb       r2,[r0,#0x0]
    ldrb       r1,[r0,#0x1]
    lsl        r1,r1,#0x8
    orr        r2,r1
    ldrb       r1,[r0,#0x2]
    lsl        r1,r1,#0x10
    orr        r2,r1
    ldrb       r1,[r0,#0x3]
    lsl        r1,r1,#0x18
    orr        r2,r1
    add        r0,r2,#0x0
    str        r0,[r5,#0x30]
    push       { r4, r5 }
    bl         Inventory_AddZenny
    mov        r0,#0x0
    pop        { r4, r5 }
    add        r0,#0x3
    ldrb       r1,[r4,r0]
    cmp        r1,#0xff
    beq        LAB_08014844
    ldr        r0,[r5,#0x24]
    lsl        r1,r1,#0x1
    ldrh       r1,[r0,r1]
    add        r0,r0,r1
    str        r0,[r5,#0x20]
    str        r0,[r5,#0x28]
    mov        r1,#0x0
    str        r1,[r5,#0x58]
    strb       r1,[r5,#0x2]
    add        r4,r0,#0x0
    mov        r0,#0x1
    pop        { pc }
LAB_08014844:
    ldrb       r0,[r4,#0x2]
    add        r0,#0x1
    lsl        r0,r0,#0x2
    add        r4,r4,r0
    add        r4,#0x6
    mov        r0,#0x1
    pop        { pc }
thumb_func_end JT_Command_FD_00_AwardZenny

thumb_func_start JT_Command_FD_04_AwardChip
JT_Command_FD_04_AwardChip:
    push       { lr }
    push       { r4, r5 }
    mov        r0,#0x85
    bl         Sound_PlaySongImmediate
    bl         Rng_RandomInt
    pop        { r4, r5 }
    ldrb       r1,[r4,#0x2]
    and        r1,r0
    lsl        r1,r1,#0x1
    add        r0,r1,r4
    add        r0,#0x6
    push       { r4, r5 }
    mov        r2,#0x1
    str        r2,[r5,#0x38]
    ldrb       r1,[r0,#0x1]
    str        r1,[r5,#0x34]
    ldrb       r0,[r0,#0x0]
    str        r0,[r5,#0x30]
    bl         Inventory_AddChip
    pop        { r4, r5 }
    add        r0,#0x3
    ldrb       r1,[r4,r0]
    cmp        r1,#0xff
    beq        LAB_080148a2
    ldr        r0,[r5,#0x24]
    lsl        r1,r1,#0x1
    ldrh       r1,[r0,r1]
    add        r0,r0,r1
    str        r0,[r5,#0x20]
    str        r0,[r5,#0x28]
    mov        r1,#0x0
    str        r1,[r5,#0x58]
    strb       r1,[r5,#0x2]
    add        r4,r0,#0x0
    mov        r0,#0x1
    pop        { pc }
LAB_080148a2:
    ldrb       r0,[r4,#0x2]
    add        r0,#0x1
    lsl        r0,r0,#0x1
    add        r4,r4,r0
    add        r4,#0x6
    mov        r0,#0x1
    pop        { pc }
thumb_func_end JT_Command_FD_04_AwardChip

thumb_func_start JT_Command_FD_08_StartBattle
JT_Command_FD_08_StartBattle:
    push       { lr }
    mov        r0,#0x1
    bl         Text_EnableScriptOption
    ldrb       r0,[r5,#0x4]
    cmp        r0,#0x0
    beq        LAB_080148c0
    b          LAB_080148ea
LAB_080148c0:
    push       { r4, r5 }
    bl         Area_GetBackgroundId
    mov        r1,#0x0
    mov        r2,#0x0
    mov        r4,#0x1
    mov        r6,#0x0
    bl         Battle_SetBattleParams
    mov        r0,#0x2
    mov        r1,#0x8
    bl         Fade_Request
    bl         Sound_StopAllMusic
    mov        r0,#0xc7
    bl         Sound_PlaySongImmediate
    pop        { r4, r5 }
    mov        r0,#0x1
    strb       r0,[r5,#0x4]
LAB_080148ea:
    mov        r0,#0x0
    pop        { pc }
thumb_func_end JT_Command_FD_08_StartBattle

thumb_func_start JT_Command_FD_0C_StartShop
JT_Command_FD_0C_StartShop:
    push       { lr }
    mov        r0,#0x1
    bl         Text_EnableScriptOption
    ldrb       r0,[r5,#0x4]
    cmp        r0,#0x0
    beq        LAB_08014900
    b          LAB_0801490e
LAB_08014900:
    push       { r4, r5 }
    ldrb       r0,[r4,#0x2]
    bl         FUN_08004a10
    pop        { r4, r5 }
    mov        r0,#0x1
    strb       r0,[r5,#0x4]
LAB_0801490e:
    mov        r0,#0x0
    pop        { pc }
thumb_func_end JT_Command_FD_0C_StartShop

thumb_func_start JT_Command_FD_10_StartMiniBoss
JT_Command_FD_10_StartMiniBoss:
    push       { lr }
    mov        r0,#0x1
    bl         Text_EnableScriptOption
    ldrb       r0,[r5,#0x4]
    cmp        r0,#0x0
    beq        LAB_08014924
    b          LAB_0801496a
LAB_08014924:
    push       { r4, r5 }
    ldrb       r1,[r4,#0x8]
    lsl        r1,r1,#0x2
    ldr        r0,PTR_PTR_EnemySpawn_08014970
    ldr        r0,[r0,r1]
    bl         Encounter_SetEnemyList
    pop        { r4, r5 }
    ldrb       r0,[r4,#0x2]
    cmp        r0,#0xff
    bne        LAB_08014942
    push       { r4, r5 }
    bl         Area_GetBackgroundId
    pop        { r4, r5 }
LAB_08014942:
    push       { r4, r5 }
    ldrb       r1,[r4,#0x3]
    ldrb       r2,[r4,#0x4]
    ldrb       r3,[r4,#0x5]
    ldrb       r6,[r4,#0x7]
    ldrb       r4,[r4,#0x6]
    bl         Battle_SetBattleParams
    mov        r0,#0x2
    mov        r1,#0x8
    bl         Fade_Request
    bl         Sound_StopAllMusic
    mov        r0,#0xc7
    bl         Sound_PlaySongImmediate
    pop        { r4, r5 }
    mov        r0,#0x1
    strb       r0,[r5,#0x4]
LAB_0801496a:
    mov        r0,#0x0
    pop        { pc }
thumb_func_end JT_Command_FD_10_StartMiniBoss

    .align 2, 0
PTR_PTR_EnemySpawn_08014970:
    .word       PTR_EnemySpawn_08014cf8

thumb_func_start JT_Command_FD_14_StartChipTrader
JT_Command_FD_14_StartChipTrader:
    push       { lr }
    ldrb       r0,[r5,#0x4]
    cmp        r0,#0x0
    beq        LAB_08014984
    mov        r0,#0x1
    bl         Text_EnableScriptOption
    b          LAB_080149c8
LAB_08014984:
    push       { r4, r5 }
    ldrb       r0,[r4,#0x2]
    bl         FUN_08004a74
    pop        { r4, r5 }
    bne        LAB_0801499c
    mov        r0,#0x1
    strb       r0,[r5,#0x4]
    mov        r0,#0x1
    bl         Text_EnableScriptOption
    b          LAB_080149c8
LAB_0801499c:
    ldrb       r1,[r4,#0x3]
    cmp        r1,#0xff
    beq        LAB_080149ba
    ldr        r0,[r5,#0x24]
    lsl        r1,r1,#0x1
    ldrh       r1,[r0,r1]
    add        r0,r0,r1
    str        r0,[r5,#0x20]
    str        r0,[r5,#0x28]
    mov        r1,#0x0
    str        r1,[r5,#0x58]
    strb       r1,[r5,#0x2]
    add        r4,r0,#0x0
    mov        r0,#0x1
    pop        { pc }
LAB_080149ba:
    ldrb       r0,[r4,#0x2]
    add        r0,#0x1
    lsl        r0,r0,#0x1
    add        r4,r4,r0
    add        r4,#0x6
    mov        r0,#0x1
    pop        { pc }
LAB_080149c8:
    mov        r0,#0x0
    pop        { pc }
thumb_func_end JT_Command_FD_14_StartChipTrader

thumb_func_start JT_Command_FD_18_StartVirusMachineBattle
JT_Command_FD_18_StartVirusMachineBattle:
    push       { lr }
    mov        r0,#0x1
    bl         Text_EnableScriptOption
    ldrb       r0,[r5,#0x4]
    cmp        r0,#0x0
    beq        LAB_080149dc
    b          LAB_08014a30
LAB_080149dc:
    push       { r4, r5 }
    bl         Rng_RandomInt
    mov        r1,#0xff
    and        r0,r1
    mov        r1,r10
    ldr        r1,[r1,#0x8]
    ldrb       r1,[r1,#0x6]
    lsr        r1,r1,#0x4
    ldr        r7,PTR_BYTE_ARRAY_08014a34
    ldrb       r1,[r7,r1]
    bl         SWI_Div
    ldr        r7,PTR_AreaIdPack_ARRAY_08014a40
    lsl        r1,r1,#0x1
    add        r7,r7,r1
    ldrb       r0,[r7,#0x0]
    ldrb       r1,[r7,#0x1]
    bl         Encounter_GetRandomEncounter
    bl         Encounter_SetEnemyList
    bl         Area_GetBackgroundId
    mov        r1,#0x0
    mov        r2,#0x0
    mov        r4,#0x1
    mov        r6,#0x0
    bl         Battle_SetBattleParams
    mov        r0,#0x2
    mov        r1,#0x8
    bl         Fade_Request
    bl         Sound_StopAllMusic
    mov        r0,#0xc7
    bl         Sound_PlaySongImmediate
    pop        { r4, r5 }
    mov        r0,#0x1
    strb       r0,[r5,#0x4]
LAB_08014a30:
    mov        r0,#0x0
    pop        { pc }
thumb_func_end JT_Command_FD_18_StartVirusMachineBattle

    .align 2, 0
PTR_BYTE_ARRAY_08014a34:
    .word       BYTE_ARRAY_08014a38
BYTE_ARRAY_08014a38:
    .byte 0x7, 0x7, 0x7, 0xD, 0x12, 0x16

    .align 2, 0
PTR_AreaIdPack_ARRAY_08014a40:
    .word       AreaIdPack_ARRAY_08014a44
AreaIdPack_ARRAY_08014a44:
    .byte Area_SchoolComp, 0
    .byte Area_SchoolComp, 1
    .byte Area_SchoolComp, 2
    .byte Area_SchoolComp, 3
    .byte Area_SchoolComp, 4
    .byte Area_OvenComp, 0
    .byte Area_OvenComp, 1
    .byte Area_WaterworksComp, 0
    .byte Area_WaterworksComp, 1
    .byte Area_WaterworksComp, 2
    .byte Area_WaterworksComp, 3
    .byte Area_WaterworksComp, 4
    .byte Area_WaterworksComp, 5
    .byte Area_TrafficLightComp, 0
    .byte Area_TrafficLightComp, 1
    .byte Area_TrafficLightComp, 2
    .byte Area_TrafficLightComp, 3
    .byte Area_TrafficLightComp, 4
    .byte Area_Power_Plant_Comp, 0
    .byte Area_Power_Plant_Comp, 1
    .byte Area_Power_Plant_Comp, 2
    .byte Area_Power_Plant_Comp, 3
    .byte Area_WWW_Comp, 0
    .byte Area_WWW_Comp, 1
    .byte Area_WWW_Comp, 2
    .byte Area_WWW_Comp, 3
    .byte Area_WWW_Comp, 4
    .byte Area_WWW_Comp, 5

thumb_func_start JT_Layout_FD_MiscControl
JT_Layout_FD_MiscControl:
    push       { lr }
    ldr        r0,=funcListLayoutMiscControl
    ldrb       r1,[r4,#0x1]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        { pc }
thumb_func_end JT_Layout_FD_MiscControl

    .align 2, 0
    .pool
funcListLayoutMiscControl:
    .word       JT_Layout_FD_00_AwardZenny
    .word       JT_Layout_FD_04_AwardChip
    .word       JT_Layout_FD_08_StartBattle
    .word       JT_Layout_FD_0C_StartShop
    .word       JT_Layout_FD_10_StartMiniBoss
    .word       JT_Layout_FD_14_StartChipTrader
    .word       JT_Layout_FD_18_StartVirusMachineBattle

thumb_func_start JT_Layout_FD_00_AwardZenny
JT_Layout_FD_00_AwardZenny:
    ldrb       r0,[r4,#0x2]
    add        r0,#0x1
    lsl        r0,r0,#0x2
    add        r4,r4,r0
    add        r4,#0x6
    mov        pc,lr
thumb_func_end JT_Layout_FD_00_AwardZenny

thumb_func_start JT_Layout_FD_04_AwardChip
JT_Layout_FD_04_AwardChip:
    ldrb       r0,[r4,#0x2]
    add        r0,#0x1
    lsl        r0,r0,#0x1
    add        r4,r4,r0
    add        r4,#0x6
    mov        pc,lr
thumb_func_end JT_Layout_FD_04_AwardChip

thumb_func_start JT_Layout_FD_08_StartBattle
JT_Layout_FD_08_StartBattle:
    add        r4,#0x2
    mov        pc,lr
thumb_func_end JT_Layout_FD_08_StartBattle

thumb_func_start JT_Layout_FD_0C_StartShop
JT_Layout_FD_0C_StartShop:
    add        r4,#0x3
    mov        pc,lr
thumb_func_end JT_Layout_FD_0C_StartShop

thumb_func_start JT_Layout_FD_10_StartMiniBoss
JT_Layout_FD_10_StartMiniBoss:
    add        r4,#0x8
    mov        pc,lr
thumb_func_end JT_Layout_FD_10_StartMiniBoss

thumb_func_start JT_Layout_FD_14_StartChipTrader
JT_Layout_FD_14_StartChipTrader:
    add        r4,#0x4
    mov        pc,lr
thumb_func_end JT_Layout_FD_14_StartChipTrader

thumb_func_start JT_Layout_FD_18_StartVirusMachineBattle
JT_Layout_FD_18_StartVirusMachineBattle:
    add        r4,#0x2
    mov        pc,lr
thumb_func_end JT_Layout_FD_18_StartVirusMachineBattle

thumb_func_start JT_Command_FE_Save
JT_Command_FE_Save:
    push       { lr }
    mov        r7,r10
    ldr        r6,[r7,#0x8]
    ldr        r7,[r6,#0x28]
    ldr        r0,[r7,#0x24]
    str        r0,[r6,#0x38]
    ldr        r0,[r7,#0x28]
    str        r0,[r6,#0x3c]
    ldr        r0,[r7,#0x2c]
    str        r0,[r6,#0x40]
    ldrb       r0,[r7,#0x10]
    str        r0,[r6,#0x44]
    push       { r4, r5 }
    bl         Save_SaveGame
    pop        { r4, r5 }
    add        r0,#0x1
    ldrb       r1,[r4,r0]
    cmp        r1,#0xff
    beq        LAB_08014b18
    ldr        r0,[r5,#0x24]
    lsl        r1,r1,#0x1
    ldrh       r1,[r0,r1]
    add        r0,r0,r1
    str        r0,[r5,#0x20]
    str        r0,[r5,#0x28]
    mov        r1,#0x0
    str        r1,[r5,#0x58]
    strb       r1,[r5,#0x2]
    add        r4,r0,#0x0
    mov        r0,#0x1
    pop        { pc }
LAB_08014b18:
    add        r4,#0x3
    mov        r0,#0x1
    pop        { pc }
thumb_func_end JT_Command_FE_Save

thumb_func_start JT_Layout_FE_Save
JT_Layout_FE_Save:
    add        r4,#0x3
    mov        pc,lr
thumb_func_end JT_Layout_FE_Save

thumb_func_start Text_LoadOptionSelectArrow
Text_LoadOptionSelectArrow:
    push       { lr }
    ldrb       r0,[r5,#0x1e]
    ldr        r1,PTR_PTR_tilesetArrowVert0_08014cd
    push       { r5 }
    ldr        r0,[r1,r0]
    ldr        r1,PTR_DAT_08014ce0
    mov        r2,#0x20
    bl         Dma_TransferListAdd
    pop        { r5 }
    ldrb       r0,[r5,#0xe]
    add        r0,#0x8
    lsl        r0,r0,#0x1
    ldrb       r1,[r5,#0xf]
    lsl        r1,r1,#0x1
    add        r1,#0x1
    lsl        r1,r1,#0x6
    ldr        r2,[r5,#0x2c]
    add        r2,r2,r0
    add        r2,r2,r1
    ldr        r0,PTR_LayoutEntry_08014ce4
    ldrh       r3,[r0,#0x0]
    strh       r3,[r2,#0x0]
    ldrh       r3,[r0,#0x2]
    strh       r3,[r2,#0x2]
    add        r2,#0x40
    ldrh       r3,[r0,#0x4]
    strh       r3,[r2,#0x0]
    ldrh       r3,[r0,#0x6]
    strh       r3,[r2,#0x2]
    ldrb       r0,[r5,#0x1e]
    add        r0,#0x4
    cmp        r0,#0x50
    blt        LAB_08014b6a
    mov        r0,#0x0
LAB_08014b6a:
    strb       r0,[r5,#0x1e]
    pop        { pc }
thumb_func_end Text_LoadOptionSelectArrow

    .align 2, 0
PTR_tilesetArrowVert0_08014b70:
    .word       tilesetArrowVert0
    .word       tilesetArrowVert0
    .word       tilesetArrowVert0
    .word       tilesetArrowVert0
    .word       tilesetArrowVert0
    .word       tilesetArrowVert0
    .word       tilesetArrowVert0
    .word       tilesetArrowVert0
    .word       tilesetArrowVert1
    .word       tilesetArrowVert1
    .word       tilesetArrowVert1
    .word       tilesetArrowVert2
    .word       tilesetArrowVert2
    .word       tilesetArrowVert2
    .word       tilesetArrowVert2
    .word       tilesetArrowVert2
    .word       tilesetArrowVert2
    .word       tilesetArrowVert1
    .word       tilesetArrowVert1
    .word       tilesetArrowVert1
LayoutEntry_08014bc0:
    .byte 0xC1, 0xF2
    .byte 0xC2, 0xF2
    .byte 0xC3, 0xF2
    .byte 0xC4, 0xF2

thumb_func_start Text_LoadDialoguePromptArrow
Text_LoadDialoguePromptArrow:
    push       { lr }
    mov        r0,#0x10
    bl         Text_CheckScriptOption
    cmp        r0,#0x0
    beq        LAB_08014c02
    ldrb       r0,[r5,#0x1f]
    ldr        r1,PTR_tileArrowAnimArray_08014ce8
    push       { r5 }
    ldr        r0,[r1,r0]
    ldr        r1,PTR_DAT_08014cec
    mov        r2,#0x20
    bl         Dma_TransferListAdd
    pop        { r5 }
    ldr        r0,PTR_LayoutEntry_ARRAY_08014cf
    ldr        r3,[r0,#0x0]
    ldr        r1,[r5,#0x2c]
    ldr        r2,DAT_08014cf4
    str        r3,[r1,r2]
    ldr        r3,[r0,#0x4]
    add        r2,#0x40
    str        r3,[r1,r2]
    ldrb       r0,[r5,#0x1f]
    add        r0,#0x4
    cmp        r0,#0x50
    blt        LAB_08014c00
    mov        r0,#0x0
LAB_08014c00:
    strb       r0,[r5,#0x1f]
LAB_08014c02:
    pop        { pc }
thumb_func_end Text_LoadDialoguePromptArrow

    .align 2, 0
tileArrowAnimArray:
    .word tileArrow0
    .word tileArrow0
    .word tileArrow0
    .word tileArrow0
    .word tileArrow0
    .word tileArrow0
    .word tileArrow0
    .word tileArrow0
    .word tileArrow1
    .word tileArrow1
    .word tileArrow1
    .word tileArrow2
    .word tileArrow2
    .word tileArrow2
    .word tileArrow2
    .word tileArrow2
    .word tileArrow2
    .word tileArrow1
    .word tileArrow1
    .word tileArrow1
LayoutEntry_ARRAY_08014c54:
    .byte 0xC5, 0xF2
    .byte 0xC6, 0xF2
    .byte 0xC7, 0xF2
    .byte 0xC8, 0xF2

thumb_func_start Text_WriteNumberToBcdBuffer
Text_WriteNumberToBcdBuffer:
    push       { r4, r5, lr }
    push       { r1, r2 }
    bl         ConvertNumToBCD
    mov        r8,r0
    bl         GetWidthOfBcdNumber
    pop        { r1, r2 }
    mov        r6,#0x40
    tst        r1,r6
    bne        LAB_08014c76
    mov        r6,#0x0
    b          LAB_08014c78
LAB_08014c76:
    mov        r6,#0x1
LAB_08014c78:
    mov        r3,#0xf
    and        r3,r1
    cmp        r3,#0x0
    bne        LAB_08014c82
    add        r3,r0,#0x0
LAB_08014c82:
    sub        r3,r3,r0
    mov        r4,#0x80
    tst        r1,r4
    bne        LAB_08014cac
    @ pad right
    sub        r4,r0,#0x1
    lsl        r4,r4,#0x2
    mov        r0,#0xf
LAB_08014c90:
    mov        r7,r8
    lsr        r7,r4
    and        r7,r0
    add        r7,#0x1
    strb       r7,[r2,#0x0]
    add        r2,#0x1
    sub        r4,#0x4
    bge        LAB_08014c90
LAB_08014ca0:
    cmp        r3,#0x0
    ble        LAB_08014cce
    sub        r3,#0x1
    strb       r6,[r2,#0x0]
    add        r2,#0x1
    b          LAB_08014ca0
    @ pad left
LAB_08014cac:
    sub        r4,r0,#0x1
    lsl        r4,r4,#0x2
LAB_08014cb0:
    cmp        r3,#0x0
    ble        LAB_08014cbc
    sub        r3,#0x1
    strb       r6,[r2,#0x0]
    add        r2,#0x1
    b          LAB_08014cb0
LAB_08014cbc:
    mov        r0,#0xf
LAB_08014cbe:
    mov        r7,r8
    lsr        r7,r4
    and        r7,r0
    add        r7,#0x1
    strb       r7,[r2,#0x0]
    add        r2,#0x1
    sub        r4,#0x4
    bge        LAB_08014cbe
LAB_08014cce:
    mov        r7,#0xe7
    @ Command E7 00 00
    strb       r7,[r2,#0x0]
    mov        r7,#0x0
    strb       r7,[r2,#0x1]
    mov        r7,#0x0
    strb       r7,[r2,#0x2]
    pop        { r4, r5, pc }
thumb_func_end Text_WriteNumberToBcdBuffer

    .align 2, 0
PTR_PTR_tilesetArrowVert0_08014cd:  .word PTR_tilesetArrowVert0_08014b70
PTR_DAT_08014ce0:                   .word DAT_0600d820
PTR_LayoutEntry_08014ce4:           .word LayoutEntry_08014bc0
PTR_tileArrowAnimArray_08014ce8:    .word tileArrowAnimArray
PTR_DAT_08014cec:                   .word DAT_0600d8a0
PTR_LayoutEntry_ARRAY_08014cf:      .word LayoutEntry_ARRAY_08014c54
DAT_08014cf4:                       .word 0x1B8

PTR_EnemySpawn_08014cf8:
    .word EnemySpawn_0800b354
    .word EnemySpawn_0800b35c
    .word EnemySpawn_0800b364
    .word EnemySpawn_0800b3a4
    .word EnemySpawn_0800b3b4

textDictDir_Offline:
    .word       textDictBlock_ACDCElementary
    .word       textDictBlock_ACDCTown
    .word       textDictBlock_GovtComplex
    .word       textDictBlock_DenTown
    .word       textDictBlock_SciLabBasement
    .word       textDictBlock_WWWBase
textDictDir_Online:
    .word       textDictBlock_SchoolComp
    .word       textDictBlock_OvenComp
    .word       textDictBlock_WaterworksComp
    .word       textDictBlock_TrafficLightComp
    .word       textDictBlock_PowerPlantComp
    .word       textDictBlock_WWWComp
    .word       0
    .word       0
    .word       textDictBlock_ACDCHP
    .word       textDictBlock_GovtComplexHP
    .word       textDictBlock_DenTownHP
    .word       textDictBlock_GovtComplex2HP
    .word       textDictBlock_OtherComp
    .word       0
    .word       0
    .word       0
    .word       textDictBlock_Internet
PTR_PTR_08014d68:
    .word       PTR_08014f60
textDictBlock_ACDCElementary:
    .word       textDict_ACDC_Elementary_Area_0
    .word       textDict_ACDC_Elementary_Area_1
    .word       textDict_ACDC_Elementary_Area_2
    .word       textDict_ACDC_Elementary_Area_3
    .word       0
    .word       textDict_ACDC_Elementary_Area_5
    .word       textDict_ACDC_Elementary_Area_6
    .word       textDict_ACDC_Elementary_Area_7
    .word       textDict_ACDC_Elementary_Area_8
    .word       textDict_ACDC_Elementary_Area_9
    .word       0
    .word       textDict_ACDC_Elementary_Area_B
    .word       textDict_ACDC_Elementary_Area_C
    .word       textDict_ACDC_Elementary_Area_D
    .word       textDict_ACDC_Elementary_Area_E
textDictBlock_ACDCTown:
    .word       textDict_ACDC_Town_Area_0
    .word       textDict_ACDC_Town_Area_1
    .word       textDict_ACDC_Town_Area_2
    .word       textDict_ACDC_Town_Area_3
    .word       0
    .word       textDict_ACDC_Town_Area_5
    .word       textDict_ACDC_Town_Area_6
    .word       textDict_ACDC_Town_Area_7
    .word       0
    .word       textDict_ACDC_Town_Area_9
    .word       0
    .word       textDict_ACDC_Town_Area_B
    .word       textDict_ACDC_Town_Area_C
textDictBlock_GovtComplex:
    .word       textDict_GovernmentComplex_Area_0
    .word       textDict_GovernmentComplex_Area_1
    .word       textDict_GovernmentComplex_Area_2
    .word       textDict_GovernmentComplex_Area_3
    .word       0
    .word       textDict_GovernmentComplex_Area_5
    .word       textDict_GovernmentComplex_Area_6
    .word       textDict_GovernmentComplex_Area_7
    .word       0
    .word       textDict_GovernmentComplex_Area_9
    .word       0
    .word       textDict_GovernmentComplex_Area_B
textDictBlock_DenTown:
    .word       textDict_DenTown_Area_0
    .word       textDict_DenTown_Area_1
    .word       textDict_DenTown_Area_2
    .word       textDict_DenTown_Area_3
    .word       textDict_DenTown_Area_4
    .word       textDict_DenTown_Area_5
    .word       textDict_DenTown_Area_6
    .word       textDict_DenTown_Area_7
textDictBlock_SciLabBasement:
    .word       textDict_SciLabBasement_Area_0
    .word       textDict_SciLabBasement_Area_1
    .word       textDict_SciLabBasement_Area_2
    .word       textDict_SciLabBasement_Area_3
    .word       textDict_SciLabBasement_Area_4
    .word       textDict_SciLabBasement_Area_5
textDictBlock_WWWBase:
    .word       textDict_WWWBase_Area_0
    .word       textDict_WWWBase_Area_1
    .word       textDict_WWWBase_Area_2
    .word       textDict_WWWBase_Area_3
    .word       textDict_WWWBase_Area_4
    .word       textDict_WWWBase_Area_5
textDictBlock_SchoolComp:
    .word       textDict_SchoolComp_Area_0
    .word       textDict_SchoolComp_Area_1
    .word       textDict_SchoolComp_Area_2
    .word       textDict_SchoolComp_Area_3
    .word       textDict_SchoolComp_Area_4
textDictBlock_OvenComp:
    .word       textDict_OvenComp_Area_0
    .word       textDict_OvenComp_Area_1
textDictBlock_WaterworksComp:
    .word       textDict_WaterworksComp_Area_0
    .word       textDict_WaterworksComp_Area_1
    .word       textDict_WaterworksComp_Area_2
    .word       textDict_WaterworksComp_Area_3
    .word       textDict_WaterworksComp_Area_4
    .word       textDict_WaterworksComp_Area_5
textDictBlock_TrafficLightComp:
    .word       textDict_TrafficLightComp_Area_0
    .word       textDict_TrafficLightComp_Area_1
    .word       textDict_TrafficLightComp_Area_2
    .word       textDict_TrafficLightComp_Area_3
    .word       textDict_TrafficLightComp_Area_4
textDictBlock_PowerPlantComp:
    .word       textDict_PowerPlantComp_Area_0
    .word       textDict_PowerPlantComp_Area_1
    .word       textDict_PowerPlantComp_Area_2
    .word       textDict_PowerPlantComp_Area_3
textDictBlock_WWWComp:
    .word       textDict_WWWComp_Area_0
    .word       textDict_WWWComp_Area_1
    .word       textDict_WWWComp_Area_2
    .word       textDict_WWWComp_Area_3
    .word       textDict_WWWComp_Area_4
    .word       textDict_WWWComp_Area_5
textDictBlock_ACDCHP:
    .word       textDict_ACDCHP_Area_0
    .word       textDict_ACDCHP_Area_1
    .word       textDict_ACDCHP_Area_2
    .word       textDict_ACDCHP_Area_3
textDictBlock_GovtComplexHP:
    .word       textDict_GovernmentComplexHP_Area_0
    .word       textDict_GovernmentComplexHP_Area_1
textDictBlock_DenTownHP:
    .word       textDict_DenTownHP_Area_0
textDictBlock_GovtComplex2HP:
    .word       textDict_GovernmentComplex2HP_Area_0
textDictBlock_OtherComp:
    .word       textDict_Other_Area_0
    .word       textDict_Other_Area_1
    .word       textDict_Other_Area_2
    .word       textDict_Other_Area_3
    .word       textDict_Other_Area_4
    .word       textDict_Other_Area_5
    .word       textDict_Other_Area_6
    .word       textDict_Other_Area_7
    .word       textDict_Other_Area_8
    .word       textDict_Other_Area_9
    .word       textDict_Other_Area_A
    .word       textDict_Other_Area_B
    .word       textDict_Other_Area_C
textDictBlock_Internet:
    .word       textDict_Internet_Area_0
    .word       textDict_Internet_Area_1
    .word       textDict_Internet_Area_2
    .word       textDict_Internet_Area_3
    .word       textDict_Internet_Area_4
    .word       textDict_Internet_Area_5
    .word       textDict_Internet_Area_6
    .word       textDict_Internet_Area_7
    .word       textDict_Internet_Area_8
    .word       textDict_Internet_Area_9
    .word       textDict_Internet_Area_A
    .word       textDict_Internet_Area_B
    .word       textDict_Internet_Area_C
    .word       textDict_Internet_Area_D
    .word       textDict_Internet_Area_E
    .word       textDict_Internet_Area_F
PTR_08014f60:
    .word       0
    .word       0
textDictDir_Commentary_Offline:
    .word       textDictBlock_Commentary_ACDC_Elementary
    .word       textDictBlock_Commentary_ACDC_Town
    .word       textDictBlock_Commentary_GovernmentComplex
    .word       textDictBlock_Commentary_DenTown
    .word       textDictBlock_Commentary_SciLabBasement
    .word       textDictBlock_Commentary_WWWBase
textDictDir_Commentary_Online:
    .word       textDictBlock_Commentary_SchoolComp
    .word       textDictBlock_Commentary_OvenComp
    .word       textDictBlock_Commentary_WaterworksComp
    .word       textDictBlock_Commentary_TrafficLightComp
    .word       textDictBlock_Commentary_PowerPlantComp
    .word       textDictBlock_Commentary_WWWComp
    .word       0
    .word       0
    .word       textDictBlock_Commentary_ACDCHP
    .word       textDictBlock_Commentary_GovernmentComplexHP
    .word       textDictBlock_Commentary_DenTownHP
    .word       textDictBlock_Commentary_GovernmentComplex2HP
    .word       textDictBlock_Commentary_Other
    .word       0
    .word       0
    .word       0
    .word       textDictBlock_Commentary_Internet
PTR_PTR_08014fc4:
    .word       PTR_080151c0
textDictBlock_Commentary_ACDC_Elementary:
    .word       textDict_Commentary_ACDC_Elementary_Area_0
    .word       textDict_Commentary_ACDC_Elementary_Area_1
    .word       textDict_Commentary_ACDC_Elementary_Area_2
    .word       textDict_Commentary_ACDC_Elementary_Area_3
    .word       textDict_Commentary_None
    .word       textDict_Commentary_ACDC_Elementary_Area_5
    .word       textDict_Commentary_ACDC_Elementary_Area_6
    .word       textDict_Commentary_ACDC_Elementary_Area_7
    .word       textDict_Commentary_ACDC_Elementary_Area_8
    .word       textDict_Commentary_ACDC_Elementary_Area_9
    .word       textDict_Commentary_None
    .word       textDict_Commentary_ACDC_Elementary_Area_B
    .word       textDict_Commentary_ACDC_Elementary_Area_C
    .word       textDict_Commentary_ACDC_Elementary_Area_D
    .word       textDict_Commentary_ACDC_Elementary_Area_E
textDictBlock_Commentary_ACDC_Town:
    .word       textDict_Commentary_ACDC_Town_Area_0
    .word       textDict_Commentary_ACDC_Town_Area_1
    .word       textDict_Commentary_ACDC_Town_Area_2
    .word       textDict_Commentary_ACDC_Town_Area_3
    .word       textDict_Commentary_None
    .word       textDict_Commentary_ACDC_Town_Area_5
    .word       textDict_Commentary_ACDC_Town_Area_6
    .word       textDict_Commentary_ACDC_Town_Area_7
    .word       textDict_Commentary_None
    .word       textDict_Commentary_ACDC_Town_Area_9
    .word       textDict_Commentary_None
    .word       textDict_Commentary_ACDC_Town_Area_B
    .word       textDict_Commentary_ACDC_Town_Area_C
    .word       textDict_Commentary_ACDC_Town_Area_D
textDictBlock_Commentary_GovernmentComplex:
    .word       textDict_Commentary_GovernmentComplex_Area_0
    .word       textDict_Commentary_GovernmentComplex_Area_1
    .word       textDict_Commentary_GovernmentComplex_Area_2
    .word       textDict_Commentary_GovernmentComplex_Area_3
    .word       textDict_Commentary_GovernmentComplex_Area_4
    .word       textDict_Commentary_GovernmentComplex_Area_5
    .word       textDict_Commentary_GovernmentComplex_Area_6
    .word       textDict_Commentary_GovernmentComplex_Area_7
    .word       textDict_Commentary_None
    .word       textDict_Commentary_GovernmentComplex_Area_9
    .word       textDict_Commentary_None
    .word       textDict_Commentary_GovernmentComplex_Area_B
textDictBlock_Commentary_DenTown:
    .word       textDict_Commentary_DenTown_Area_0
    .word       textDict_Commentary_DenTown_Area_1
    .word       textDict_Commentary_DenTown_Area_2
    .word       textDict_Commentary_DenTown_Area_3
    .word       textDict_Commentary_DenTown_Area_4
    .word       textDict_Commentary_DenTown_Area_5
    .word       textDict_Commentary_DenTown_Area_6
    .word       textDict_Commentary_DenTown_Area_7
textDictBlock_Commentary_SciLabBasement:
    .word       textDict_Commentary_SciLabBasement_Area_0
    .word       textDict_Commentary_SciLabBasement_Area_1
    .word       textDict_Commentary_SciLabBasement_Area_2
    .word       textDict_Commentary_SciLabBasement_Area_3
    .word       textDict_Commentary_SciLabBasement_Area_4
    .word       textDict_Commentary_SciLabBasement_Area_5
textDictBlock_Commentary_WWWBase:
    .word       textDict_Commentary_WWWBase_Area_0
    .word       textDict_Commentary_WWWBase_Area_1
    .word       textDict_Commentary_None
    .word       textDict_Commentary_WWWBase_Area_3
    .word       textDict_Commentary_WWWBase_Area_4
    .word       textDict_Commentary_WWWBase_Area_5
textDictBlock_Commentary_SchoolComp:
    .word       textDict_Commentary_SchoolComp_Area_0
    .word       textDict_Commentary_SchoolComp_Area_1
    .word       textDict_Commentary_SchoolComp_Area_2
    .word       textDict_Commentary_SchoolComp_Area_3
    .word       textDict_Commentary_SchoolComp_Area_4
textDictBlock_Commentary_OvenComp:
    .word       textDict_Commentary_OvenComp_Area_0
    .word       textDict_Commentary_OvenComp_Area_1
textDictBlock_Commentary_WaterworksComp:
    .word       textDict_Commentary_WaterworksComp_Area_0
    .word       textDict_Commentary_WaterworksComp_Area_1
    .word       textDict_Commentary_WaterworksComp_Area_2
    .word       textDict_Commentary_WaterworksComp_Area_3
    .word       textDict_Commentary_WaterworksComp_Area_4
    .word       textDict_Commentary_WaterworksComp_Area_5
textDictBlock_Commentary_TrafficLightComp:
    .word       textDict_Commentary_TrafficLightComp_Area_0
    .word       textDict_Commentary_TrafficLightComp_Area_1
    .word       textDict_Commentary_TrafficLightComp_Area_2
    .word       textDict_Commentary_TrafficLightComp_Area_3
    .word       textDict_Commentary_TrafficLightComp_Area_4
textDictBlock_Commentary_PowerPlantComp:
    .word       textDict_Commentary_PowerPlantComp_Area_0
    .word       textDict_Commentary_PowerPlantComp_Area_1
    .word       textDict_Commentary_PowerPlantComp_Area_2
    .word       textDict_Commentary_PowerPlantComp_Area_3
textDictBlock_Commentary_WWWComp:
    .word       textDict_Commentary_WWWComp_Area_0
    .word       textDict_Commentary_WWWComp_Area_1
    .word       textDict_Commentary_WWWComp_Area_2
    .word       textDict_Commentary_WWWComp_Area_3
    .word       textDict_Commentary_WWWComp_Area_4
    .word       textDict_Commentary_WWWComp_Area_5
textDictBlock_Commentary_ACDCHP:
    .word       textDict_Commentary_ACDCHP_Area_0
    .word       textDict_Commentary_ACDCHP_Area_1
    .word       textDict_Commentary_ACDCHP_Area_2
    .word       textDict_Commentary_ACDCHP_Area_3
textDictBlock_Commentary_GovernmentComplexHP:
    .word       textDict_Commentary_GovernmentComplexHP_Area_0
    .word       textDict_Commentary_GovernmentComplexHP_Area_1
textDictBlock_Commentary_DenTownHP:
    .word       textDict_Commentary_DenTownHP_Area_0
textDictBlock_Commentary_GovernmentComplex2HP:
    .word       textDict_Commentary_GovernmentComplex2HP_Area_0
textDictBlock_Commentary_Other:
    .word       textDict_Commentary_Other_Area_0
    .word       textDict_Commentary_Other_Area_1
    .word       textDict_Commentary_Other_Area_2
    .word       textDict_Commentary_Other_Area_3
    .word       textDict_Commentary_Other_Area_4
    .word       textDict_Commentary_Other_Area_5
    .word       textDict_Commentary_Other_Area_6
    .word       textDict_Commentary_Other_Area_7
    .word       textDict_Commentary_Other_Area_8
    .word       textDict_Commentary_Other_Area_9
    .word       textDict_Commentary_Other_Area_A
    .word       textDict_Commentary_Other_Area_B
    .word       textDict_Commentary_Other_Area_C
textDictBlock_Commentary_Internet:
    .word       textDict_Commentary_Internet_Area_0
    .word       textDict_Commentary_Internet_Area_1
    .word       textDict_Commentary_Internet_Area_2
    .word       textDict_Commentary_Internet_Area_3
    .word       textDict_Commentary_Internet_Area_4
    .word       textDict_Commentary_Internet_Area_5
    .word       textDict_Commentary_Internet_Area_6
    .word       textDict_Commentary_Internet_Area_7
    .word       textDict_Commentary_Internet_Area_8
    .word       textDict_Commentary_Internet_Area_9
    .word       textDict_Commentary_Internet_Area_A
    .word       textDict_Commentary_Internet_Area_B
    .word       textDict_Commentary_Internet_Area_C
    .word       textDict_Commentary_Internet_Area_D
    .word       textDict_Commentary_Internet_Area_E
    .word       textDict_Commentary_Internet_Area_F
PTR_080151c0:
    .word       0
    .word       0

layoutDialogBox:
    .incbin "images/text/dialog_box.tilemap"

    .end
