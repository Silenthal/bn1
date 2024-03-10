#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set tilesetCustomScreenBg_2, 0x863FE34
    .set FUN_0805758a, 0x805758A
    .set FUN_0805738e, 0x805738e
    .set Text_CheckIfDialogActive, 0x8007240
    .set Text_SetTextPointer_Tutorial1, 0x800722c
    .set Text_SetTextPointer_Tutorial2, 0x8007658
    .text

    .thumb

_ts CustomScreen_Main
    push       { lr }
    ldr        r5,PTR_gCustomScreen_08015928
    mov        r0,#0x0
    mov        r1,#0x0
    ldrb       r2,[r5,#0x1a]
    tst        r2,r2
    beq        LAB_08015902
    mov        r7,r10
    ldr        r7,[r7,#0x4]
    ldrh       r0,[r7,#0x2]
    ldrh       r1,[r7,#0x4]
LAB_08015902:
    strh       r0,[r5,#0x38]
    strh       r1,[r5,#0x3a]
    ldrb       r0,[r5,#0x0]
    ldr        r7,PTR_JT_R5_CustomScreen_15918_08015924
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    ldrb       r1,[r5,#0x1]
    lsr        r1,r1,#0x2
    pop        { pc }
    .align 2, 0

JT_R5_CustomScreen_15918:
    .word CustomScreen_0_Init
    .word CustomScreen_1_Main
    .word CustomScreen_2_TakeOrAddChips
PTR_JT_R5_CustomScreen_15918_08015924:
    .word JT_R5_CustomScreen_15918
PTR_gCustomScreen_08015928:
    .word gCustomScreen

_ts CustomScreen_0_Init
    push       { lr }
    bl         FUN_0805758a
    mov        r0,#0x4
    strb       r0,[r5,#0x0]
    mov        r0,#0x0
    strb       r0,[r5,#0x4]
    strb       r0,[r5,#0x5]
    strb       r0,[r5,#0xb]
    strb       r0,[r5,#0xc]
    strh       r0,[r5,#0x24]
    strb       r0,[r5,#0xd]
    strh       r0,[r5,#0x3c]
    strh       r0,[r5,#0x3e]
    strb       r0,[r5,#0xf]
    strb       r0,[r5,#0x1b]
    strb       r0,[r5,#0x1c]
    strb       r0,[r5,#0x10]
    mov        r0,#0x6
    add        r0,r0,r5
    mov        r1,#0x5
    mov        r2,#0xff
    bl         memset
    mov        r0,#0x40
    add        r0,r0,r5
    mov        r1,#0xf
    mov        r2,#0x0
    bl         memset
    bl         CustomScreen_1_Main
    mov        r0,#0x1
    pop        { pc }


_ts CustomScreen_1_Main
    push       { lr }
    ldr        r7,=JT_R5_CustomScreen_15980
    ldrb       r0,[r5,#0x1]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    mov        r0,#0x1
    pop        { pc }


JT_R5_CustomScreen_15980:
    .word CustomScreen_1_0_Open
    .word CustomScreen_1_1_ChipSelect
    .word CustomScreen_1_2_Ok
    .word CustomScreen_1_3_Add
    .word CustomScreen_1_4_Close
    .word CustomScreen_1_5_ShowDescription
    .word CustomScreen_1_6_NoMoreData

    .pool

    .word gFrameCounter


_ts CustomScreen_1_0_Open
    push       { lr }
    ldr        r7,=JT_R5_BCS_159CC
    ldrb       r0,[r5,#0x2]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         CustomScreen_GetChipFromPosition
    bl         CustomScreen_GetChipDetailFromFolder
    bl         CustomScreen_LoadChipDetail
    bl         CustomScreen_LoadUILower
    bl         CustomScreen_LoadSelectedChips
    bl         CustomScreen_UpdateChipSelectPosition
    pop        { pc }

    .align 2, 0
JT_R5_BCS_159CC:
    .word CustomScreen_StartSlideOpen
    .word CustomScreen_SlideOpen

    .pool


_ts CustomScreen_StartSlideOpen
    push       { lr }
    mov        r0,#0x0
    strh       r0,[r5,#0x24]
    strh       r0,[r5,#0x20]
    mov        r0,#0x4
    strb       r0,[r5,#0x2]
    mov        r0,#0xbe
    bl         Sound_PlaySongImmediate
    pop        { pc }


_ts CustomScreen_SlideOpen
    push       { lr }
    mov        r7,r10
    ldr        r7,[r7,#0x14]
    ldr        r0,[r7,#0x30]
    ldr        r1,=0x10000
    sub        r0,r0,r1
    str        r0,[r7,#0x30]
    ldrh       r0,[r5,#0x24]
    sub        r0,#0x8
    strh       r0,[r5,#0x24]
    ldrh       r0,[r5,#0x20]
    add        r0,#0x1
    strh       r0,[r5,#0x20]
    cmp        r0,#0xf
    bne        LAB_08015a20
    bl         CustomScreen_GetChipFromPosition
    mov        r1,#0x4
    cmp        r0,#0xff
    bne        LAB_08015a1a
    mov        r1,#0x1
    strb       r1,[r5,#0xc]
    mov        r1,#0x8
LAB_08015a1a:
    strb       r1,[r5,#0x1]
    mov        r1,#0x0
    strh       r1,[r5,#0x2]
LAB_08015a20:
    pop        { pc }
    
    .align 2, 0
    .pool


_ts CustomScreen_1_1_ChipSelect
    push       { lr }
    bl         CustomScreen_CheckRToggle
    tst        r0,r0
    beq        LAB_08015a34
    pop        { pc }
LAB_08015a34:
    bl         CustomScreen_CheckCursorMove
    tst        r0,r0
    beq        LAB_08015a46
    mov        r0,#0x8
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
    b          LAB_08015abc
LAB_08015a46:
    ldrh       r0,[r5,#0x38]
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_08015a84
    bl         CustomScreen_GetSelectedChipOffset
    bl         CustomScreen_ValidateSelection
    tst        r0,r0
    beq        LAB_08015a84
    ldrb       r2,[r5,#0xb]
    mov        r3,#0x15
    add        r3,r3,r2
    strb       r1,[r5,r3]
    bl         CustomScreen_GetSelectedChipOffset
    ldrb       r1,[r5,#0xb]
    mov        r2,#0x6
    add        r2,r2,r1
    strb       r0,[r5,r2]
    add        r1,#0x1
    strb       r1,[r5,#0xb]
    mov        r2,#0x40
    add        r2,r2,r0
    strb       r1,[r5,r2]
    mov        r0,#0x6a
    bl         Sound_PlaySongImmediate
    mov        r0,#0x1
    strb       r0,[r5,#0x1b]
    b          LAB_08015abc
LAB_08015a84:
    mov        r1,#0x2
    tst        r0,r1
    beq        LAB_08015aae
    ldrb       r0,[r5,#0xb]
    tst        r0,r0
    beq        LAB_08015abc
    sub        r0,#0x1
    strb       r0,[r5,#0xb]
    mov        r1,#0x6
    add        r1,r1,r0
    ldrb       r2,[r5,r1]
    mov        r0,#0xff
    strb       r0,[r5,r1]
    mov        r0,#0x0
    mov        r3,#0x40
    add        r3,r3,r2
    strb       r0,[r5,r3]
    mov        r0,#0x6b
    bl         Sound_PlaySongImmediate
    b          LAB_08015abc
LAB_08015aae:
    mov        r1,#0x8
    tst        r0,r1
    beq        LAB_08015abc
    mov        r0,#0x8
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
LAB_08015abc:
    bl         CustomScreen_GetChipFromPosition
    bl         CustomScreen_GetChipDetailFromFolder
    bl         CustomScreen_LoadChipDetail
    bl         CustomScreen_LoadChipSelectCursor
    bl         dummy_167d0
    bl         CustomScreen_LoadUILower
    bl         CustomScreen_LoadSelectedChips
    bl         CustomScreen_AnimateLogo
    bl         CustomScreen_UpdateChipSelectPosition
    pop        { pc }

_nt CustomScreen_GetSelectedChipOffset
    ldrb       r0,[r5,#0x4]
    ldrb       r1,[r5,#0x5]
    mov        r2,#0x5
    mul        r1,r2
    add        r0,r0,r1
    mov        pc,lr

_nt CustomScreen_GetChipSelectIndex
    mov        r2,#0x5
    mul        r1,r2
    add        r0,r0,r1
    mov        pc,lr

_nt CustomScreen_1_2_Ok
    push       { lr }
    ldrh       r0,[r5,#0x38]
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_08015b5a
    mov        r0,#0x6d
    bl         Sound_PlaySongImmediate
    mov        r6,r10
    ldr        r6,[r6,#0xc]
    ldrb       r3,[r5,#0xb]
    tst        r3,r3
    beq        LAB_08015b4c
    strb       r3,[r6,#0x11]
    mov        r0,#0x0
    strb       r0,[r6,#0x19]
    mov        r0,r10
    ldr        r0,[r0,#0xc]
    add        r0,#0x78
    mov        r1,#0x6
    mov        r2,#0xff
    bl         memset
    mov        r6,r10
    ldr        r6,[r6,#0xc]
    add        r6,#0x78
    mov        r4,#0x6
    add        r4,r4,r5
LAB_08015b2e:
    ldrb       r0,[r4,#0x0]
    bl         CustomScreen_GetChipDetailFromDeck
    strb       r0,[r6,#0x0]
    strb       r1,[r6,#0x6]
    add        r6,#0x1
    add        r4,#0x1
    sub        r3,#0x1
    bne        LAB_08015b2e
    mov        r0,#0x0
    bl         FUN_0805738e
    mov        r0,#0x1
    bl         FUN_0805738e
LAB_08015b4c:
    mov        r0,#0x10
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
    mov        r0,#0x0
    strb       r0,[r5,#0xf]
    pop        { pc }
LAB_08015b5a:
    ldrh       r0,[r5,#0x3a]
    mov        r1,#0x22
    tst        r0,r1
    beq        LAB_08015b8c
    mov        r0,#0x5
LAB_08015b64:
    sub        r0,#0x1
    bmi        LAB_08015bda
    push       { r0 }
    ldrb       r1,[r5,#0x5]
    bl         CustomScreen_GetChipSelectIndex
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldrb       r1,[r7,#0x10]
    cmp        r0,r1
    bmi        LAB_08015b7e
    mov        r0,#0xff
    b          LAB_08015b82
LAB_08015b7e:
    bl         CustomScreen_GetChipDetailFromDeck
LAB_08015b82:
    cmp        r0,#0xff
    pop        { r0 }
    beq        LAB_08015b64
    strb       r0,[r5,#0x4]
    b          LAB_08015bb0
LAB_08015b8c:
    mov        r1,#0x10
    tst        r0,r1
    beq        LAB_08015bc0
    mov        r0,#0x1
    neg        r0,r0
LAB_08015b96:
    add        r0,#0x1
    cmp        r0,#0x5
    beq        LAB_08015bda
    push       { r0 }
    ldrb       r1,[r5,#0x5]
    bl         CustomScreen_GetChipSelectIndex
    bl         CustomScreen_GetChipDetailFromDeck
    cmp        r0,#0xff
    pop        { r0 }
    beq        LAB_08015b96
    strb       r0,[r5,#0x4]
LAB_08015bb0:
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
    mov        r0,#0x69
    bl         Sound_PlaySongImmediate
    b          LAB_08015bda
LAB_08015bc0:
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08015bda
    ldrb       r0,[r5,#0xb]
    tst        r0,r0
    bne        LAB_08015bda
    mov        r0,#0x69
    bl         Sound_PlaySongImmediate
    mov        r0,#0xc
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
LAB_08015bda:
    mov        r0,#0x0
    ldrb       r1,[r5,#0xb]
    tst        r1,r1
    beq        LAB_08015be4
    mov        r0,#0x1
LAB_08015be4:
    bl         CustomScreen_LoadAlternateArt
    bl         CustomScreen_DrawCursorOkButton
    bl         dummy_167d0
    bl         CustomScreen_LoadUILower
    bl         CustomScreen_LoadSelectedChips
    bl         CustomScreen_UpdateChipSelectPosition
    pop        { pc }

_nt CustomScreen_1_3_Add
    push       { lr }
    ldr        r7,PTR_PTR_CustomScreen_1_3_0_ShowMessage_08015c24
    ldrb       r0,[r5,#0x2]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    mov        r0,#0x2
    bl         CustomScreen_LoadAlternateArt
    bl         dummy_167d0
    bl         CustomScreen_LoadUILower
    bl         CustomScreen_LoadSelectedChips
    bl         CustomScreen_UpdateChipSelectPosition
    pop        { pc }

    .align 2, 0
PTR_PTR_CustomScreen_1_3_0_ShowMessage_08015c24:
    .word PTR_CustomScreen_1_3_0_ShowMessage_08015c28
PTR_CustomScreen_1_3_0_ShowMessage_08015c28:
    .word CustomScreen_1_3_0_ShowMessage
    .word CustomScreen_1_3_1_Success
    .word CustomScreen_1_3_2_NoMoreData

_ts CustomScreen_1_3_0_ShowMessage
    push       { lr }
    ldrh       r0,[r5,#0x38]
    mov        r1,#0x40
    tst        r0,r1
    beq        LAB_08015c4e
    mov        r0,#0x69
    bl         Sound_PlaySongImmediate
    mov        r0,#0x8
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
    b          LAB_08015cb2
LAB_08015c4e:
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_08015cb2
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    bl         CustomScreen_GetDeckSize
    ldrb       r1,[r7,#0x10]
    cmp        r1,#0xf
    bge        LAB_08015c66
    cmp        r1,r0
    blt        LAB_08015c78
LAB_08015c66:
    mov        r0,#0x8
    strb       r0,[r5,#0x2]
    ldr        r0,PTR_TextData_BattleMessages_08015d94
    mov        r1,#0x1
    push       { r5 }
    bl         Text_LoadDialogue
    pop        { r5 }
    b          LAB_08015cb2
LAB_08015c78:
    mov        r0,#0x0
    strb       r0,[r7,#0x19]
    mov        r1,#0x1f
    lsl        r1,r0
    strh       r1,[r5,#0x3c]
    mov        r0,#0x1
    strb       r0,[r5,#0xd]
    mov        r0,#0x3c
    strh       r0,[r5,#0x20]
    mov        r0,#0x4
    strb       r0,[r5,#0x2]
    mov        r0,r10
    ldr        r0,[r0,#0xc]
    mov        r1,#0x0
    strb       r1,[r0,#0x11]
    add        r0,#0x78
    mov        r1,#0x6
    mov        r2,#0xff
    bl         memset
    mov        r0,#0x6a
    bl         Sound_PlaySongImmediate
    ldr        r0,PTR_TextData_BattleMessages_08015d94
    mov        r1,#0x0
    push       { r5 }
    bl         Text_LoadDialogue
    pop        { r5 }
LAB_08015cb2:
    bl         CustomScreen_DrawCursorAddButton
    pop        { pc }

    .word TextData_BattleMessages

_ts CustomScreen_1_3_1_Success
    push       { lr }
    bl         Text_CheckIfDialogActive
    bne        LAB_08015cd0
    mov        r0,#0x10
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
    mov        r0,#0x1
    strb       r0,[r5,#0xf]
LAB_08015cd0:
    pop        { pc }

_nt CustomScreen_1_3_2_NoMoreData
    push       { lr }
    bl         Text_CheckIfDialogActive
    bne        LAB_08015cde
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
LAB_08015cde:
    pop        { pc }

_ts CustomScreen_1_4_Close
    push       { lr }
    ldr        r7,PTR_PTR_CustomScreen_1_4_0_CloseStart_1_08015cfc
    ldrb       r0,[r5,#0x2]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         CustomScreen_UpdateChipSelectPosition
    pop        { pc }

    .align 2, 0
PTR_CustomScreen_1_4_0_CloseStart_1_08015cf4:
    .word CustomScreen_1_4_0_CloseStart
    .word CustomScreen_1_4_1_SlideClosed
PTR_PTR_CustomScreen_1_4_0_CloseStart_1_08015cfc:
    .word PTR_CustomScreen_1_4_0_CloseStart_1_08015cf4

_ts CustomScreen_1_4_0_CloseStart
    push       { lr }
    mov        r0,#0x0
    strh       r0,[r5,#0x20]
    mov        r0,#0x4
    strb       r0,[r5,#0x2]
    pop        { pc }

_ts CustomScreen_1_4_1_SlideClosed
    push       { lr }
    mov        r7,r10
    ldr        r7,[r7,#0x14]
    ldr        r0,[r7,#0x30]
    ldr        r1,DAT_08015d30
    add        r0,r0,r1
    str        r0,[r7,#0x30]
    ldrh       r0,[r5,#0x24]
    add        r0,#0x8
    strh       r0,[r5,#0x24]
    ldrh       r0,[r5,#0x20]
    add        r0,#0x1
    strh       r0,[r5,#0x20]
    cmp        r0,#0xf
    bne        LAB_08015d2e
    mov        r0,#0x8
    strb       r0,[r5,#0x0]
LAB_08015d2e:
    pop        { pc }
DAT_08015d30:
    .word 0x10000

_ts CustomScreen_1_5_ShowDescription
    push       { lr }
    bl         CustomScreen_CheckHideDescriptionKeyPress
    tst        r0,r0
    beq        LAB_08015d40
    pop        { pc }
LAB_08015d40:
    bl         CustomScreen_GetChipFromPosition
    bl         CustomScreen_GetChipDetailFromFolder
    bl         CustomScreen_LoadChipDetail
    bl         CustomScreen_GetChipFromPosition
    bl         CustomScreen_GetChipDetailFromFolder
    bl         CustomScreen_LoadChipDescription
    bl         CustomScreen_UpdateChipSelectPosition
    pop        { pc }

_nt CustomScreen_1_6_NoMoreData
    push       { lr }
    ldr        r7,=PTR_CustomScreen_1_6_0_ShowMessage
    ldrb       r0,[r5,#0x2]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        { pc }

    .align 2, 0
PTR_CustomScreen_1_6_0_ShowMessage:
    .word CustomScreen_1_6_0_ShowMessage
    .word CustomScreen_1_6_1_FadeOut
    .word CustomScreen_1_6_2_ExitBattle
    .word CustomScreen_1_6_3_Return

    .pool

_ts CustomScreen_1_6_0_ShowMessage
    push       { lr }
    ldr        r0,PTR_TextData_BattleMessages_08015d94
    mov        r1,#0x1
    push       { r5 }
    bl         Text_LoadDialogue
    pop        { r5 }
    mov        r0,#0xc
    strb       r0,[r5,#0x2]
    pop        { pc }
PTR_TextData_BattleMessages_08015d94:
    .word TextData_BattleMessages

_ts CustomScreen_1_6_1_FadeOut
    push       { lr }
    ldr        r0,PTR_gTextOptionFlags_08015dc8
    ldr        r0,[r0,#0x0]
    mov        r1,#0x80
    tst        r0,r1
    bne        LAB_08015dc4
    mov        r1,#0xf
    and        r0,r1
    beq        LAB_08015db4
    ldrb       r0,[r5,#0x14]
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
    pop        { pc }
LAB_08015db4:
    push       { r5 }
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        { r5 }
    mov        r0,#0x8
    strb       r0,[r5,#0x2]
LAB_08015dc4:
    pop        { pc }

    .align 2, 0
PTR_gTextOptionFlags_08015dc8:
    .word gTextOptionFlags

_ts CustomScreen_1_6_2_ExitBattle
    push       { lr }
    mov        r7,r10
    ldr        r7,[r7,#0x18]
    ldrb       r0,[r7,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08015e10
    push       { r5 }
    mov        r0,#0xf
    bl         Entity_FreeAllMultiple
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    mov        r1,#0x0
    ldrb       r2,[r0,#0x4]
    ldrb       r3,[r0,#0xc]
    cmp        r2,r3
    bne        LAB_08015df2
    mov        r1,#0x4
LAB_08015df2:
    strb       r1,[r0,#0x0]
    ldrb       r1,[r0,#0x4]
    strb       r1,[r0,#0xc]
    ldrb       r1,[r0,#0x5]
    strb       r1,[r0,#0xd]
    ldr        r0,[r7,#0x0]
    mov        r1,#0x4
    strb       r1,[r0,#0x0]
    ldr        r0,[r7,#0x10]
    mov        r1,#0x40
    strh       r1,[r0,#0x0]
    mov        r0,#0x3
    bl         Video_SetBgControl
    pop        { r5 }
LAB_08015e10:
    pop        { pc }

_nt CustomScreen_1_6_3_Return
    push       { lr }
    ldr        r0,PTR_gTextOptionFlags_08015e28
    ldr        r0,[r0,#0x0]
    mov        r1,#0x80
    tst        r0,r1
    bne        LAB_08015e26
    ldrb       r0,[r5,#0x14]
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
LAB_08015e26:
    pop        { pc }
PTR_gTextOptionFlags_08015e28:
    .word gTextOptionFlags

_ts CustomScreen_2_TakeOrAddChips
    push       { lr }
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldrb       r0,[r5,#0xf]
    tst        r0,r0
    bne        LAB_08015e48
    ldrb       r1,[r5,#0xb]
    tst        r1,r1
    beq        LAB_08015e42
    mov        r1,#0x5
    strb       r1,[r7,#0x10]
LAB_08015e42:
    bl         CustomScreen_TakeSelectedChipsFromDeck
    b          LAB_08015e54
LAB_08015e48:
    ldrb       r0,[r7,#0x10]
    add        r0,#0x5
    cmp        r0,#0x10
    bmi        LAB_08015e52
    mov        r0,#0xf
LAB_08015e52:
    strb       r0,[r7,#0x10]
LAB_08015e54:
    mov        r0,#0x0
    pop        { pc }

_ts CustomScreen_LoadUIUpper
    push       { lr }
    ldr        r0,PTR_gCustomScreen_08015ee4
    mov        r1,#0xaa
    lsl        r1,r1,#0x2
    mov        r2,#0x0
    bl         memset
    ldr        r7,PTR_gCustomScreen_08015ee4
    mov        r0,#0x0
    str        r0,[r7,#0x0]
    mov        r0,#0x6
    ldr        r7,PTR_DmaTransferDetail_ARRAY_08015ee0
LAB_08015e70:
    push       { r0, r7 }
    ldr        r0,[r7,#0x0]
    ldr        r1,[r7,#0x4]
    ldr        r2,[r7,#0x8]
    bl         Dma_TransferListAdd
    pop        { r0, r7 }
    add        r7,#0xc
    sub        r0,#0x1
    bne        LAB_08015e70
    ldr        r0,PTR_tilemapCustomScreenUi_08015ee8
    ldr        r7,PTR_gCustomScreen_08015ee4
    mov        r3,#0x50
    add        r1,r7,r3
    mov        r2,#0x96
    lsl        r2,r2,#0x2
    bl         memcpy_32
    pop        { pc }

    .align 2, 0
DmaTransferDetail_ARRAY_08015e98:
    .word tilesetCustomScreenBg_1
    .word 0x6009000
    .word 0x138

    .word paletteCustomScreenBg_1
    .word eBgPaletteC
    .word 8

    .word tilesetCustomScreenBg_2
    .word 0x6009e40
    .word 0x288

    .word 0x86385d4
    .word eBgPaletteD
    .word 0x10

    .word Color_ARRAY_086414d4
    .word eObjPaletteD
    .word 8

    .word 0x8638614
    .word eObjPaletteC
    .word 8
PTR_DmaTransferDetail_ARRAY_08015ee0:
    .word DmaTransferDetail_ARRAY_08015e98
PTR_gCustomScreen_08015ee4:
    .word gCustomScreen
PTR_tilemapCustomScreenUi_08015ee8:
    .word tilemapCustomScreenBg_1

_ts CustomScreen_CopyTilemap
    push       { r5, lr }
    mov        r7,#0x50
    add        r7,r7,r5
    mov        r6,#0xf
    lsl        r6,r1,#0x4
    sub        r6,r6,r1
    add        r0,r0,r6
    add        r0,r0,r0
    add        r7,r7,r0
    add        r5,r7,#0x0
    mov        r1,#0x0
LAB_08015f02:
    mov        r0,#0x0
LAB_08015f04:
    ldrh       r6,[r2,#0x0]
    strh       r6,[r7,#0x0]
    add        r7,#0x2
    add        r2,#0x2
    add        r0,#0x1
    cmp        r0,r3
    bne        LAB_08015f04
    add        r5,#0x1e
    add        r7,r5,#0x0
    add        r1,#0x1
    cmp        r1,r4
    bne        LAB_08015f02
    pop        { r5, pc }

_nt CustomScreen_LoadChipDetail
    push       { lr }
    sub        sp,#0x70
    mov        r6,sp
    push       { r0, r6 }
    push       { r5 }
    add        r1,r0,#0x0
    ldr        r0,PTR_TextData_BattleChip_Names_08015fd0
    ldr        r2,PTR_DAT_08015fc0
    ldr        r3,PTR_DAT_08015fc4
    mov        r4,#0x8
    mov        r5,#0x1
    ldr        r6,PTR_tilesetDialogueText_08015fd4
    mov        r7,#0x0
    bl         Text_CopyCharTileUI
    pop        { r5 }
    mov        r0,#0x1
    mov        r1,#0x1
    ldr        r2,PTR_tilemapCustomScreenChipName_08015fd8
    mov        r3,#0x8
    mov        r4,#0x2
    bl         CustomScreen_CopyTilemap
    pop        { r0, r6 }
    cmp        r0,#0xff
    bne        LAB_08015f5a
    add        r0,r6,#0x0
    bl         CustomScreen_LoadBlankChipTilemap
    b          LAB_08015fae
LAB_08015f5a:
    push       { r6 }
    push       { r0 }
    add        r0,r6,#0x0
    bl         CustomScreen_LoadChipTilemap
    pop        { r0 }
    bl         BattleChip_GetChipData
    add        r7,r0,#0x0
    push       { r5, r7 }
    ldr        r0,[r7,#0x14]
    ldr        r1,PTR_DAT_08015fc8
    mov        r2,#0x7
    lsl        r2,r2,#0x6
    bl         Dma_TransferListAdd
    pop        { r5, r7 }
    push       { r5, r7 }
    ldr        r0,[r7,#0x18]
    ldr        r1,PTR_eBgPaletteB_08015fcc
    mov        r2,#0x8
    bl         Dma_TransferListAdd
    pop        { r5, r7 }
    push       { r7 }
    ldrb       r0,[r7,#0x5]
    bl         CustomScreen_DrawChipElement
    pop        { r7 }
    push       { r7 }
    ldrh       r0,[r7,#0xc]
    bl         CustomScreen_LoadDamageTilemap
    pop        { r7 }
    bl         CustomScreen_GetChipFromPosition
    bl         CustomScreen_GetChipDetailFromFolder
    add        r0,r1,#0x0
    bl         CustomScreen_DrawChipCode
    pop        { r6 }
LAB_08015fae:
    mov        r0,#0x1
    mov        r1,#0x3
    add        r2,r6,#0x0
    mov        r3,#0x8
    mov        r4,#0x7
    bl         CustomScreen_CopyTilemap
    add        sp,#0x70
    pop        { pc }
PTR_DAT_08015fc0:
    .word 0x3003220
PTR_DAT_08015fc4:
    .word 0x600ad00
PTR_DAT_08015fc8:
    .word 0x600af00
PTR_eBgPaletteB_08015fcc:
    .word eBgPaletteB
PTR_TextData_BattleChip_Names_08015fd0:
    .word TextData_BattleChip_Names
PTR_tilesetDialogueText_08015fd4:
    .word tilesetDialogueText
PTR_tilemapCustomScreenChipName_08015fd8:
    .word tilemapCustomScreenChipName
tilemapCustomScreenChipName:
    .incbin "images/custom_screen/chip_name.tilemap"

_ts CustomScreen_LoadAlternateArt
    push       { lr }
    sub        sp,#0x70
    mov        r6,sp
    ldr        r7,PTR_PTR_tileSetNoDataSelected_08016068
    lsl        r0,r0,#0x3
    add        r7,r7,r0
    push       { r6 }
    push       { r5, r7 }
    ldr        r0,[r7,#0x0]
    ldr        r1,PTR_DAT_08016060
    mov        r2,#0x7
    lsl        r2,r2,#0x6
    bl         Dma_TransferListAdd
    pop        { r5, r7 }
    push       { r5, r7 }
    ldr        r0,[r7,#0x4]
    ldr        r1,PTR_eBgPaletteB_08016064
    mov        r2,#0x8
    bl         Dma_TransferListAdd
    pop        { r5, r7 }
    pop        { r6 }
    add        r0,r6,#0x0
    bl         CustomScreen_LoadChipTilemap
    mov        r0,#0x1
    mov        r1,#0x3
    add        r2,r6,#0x0
    mov        r3,#0x8
    mov        r4,#0x7
    bl         CustomScreen_CopyTilemap
    mov        r0,#0x1
    mov        r1,#0x1
    ldr        r2,PTR_tilemapCustomScreenChipNameBlank_08016084
    mov        r3,#0x8
    mov        r4,#0x2
    bl         CustomScreen_CopyTilemap
    mov        r0,#0x1
    mov        r1,#0xa
    ldr        r2,PTR_tilemapChipSelectChipAttributes_08016088
    mov        r3,#0x8
    mov        r4,#0x2
    bl         CustomScreen_CopyTilemap
    add        sp,#0x70
    pop        { pc }

    .align 2, 0
PTR_DAT_08016060:
    .word 0x600af00
PTR_eBgPaletteB_08016064:
    .word eBgPaletteB
PTR_PTR_tileSetNoDataSelected_08016068:
    .word PTR_tileSetNoDataSelected_0801606c
PTR_tileSetNoDataSelected_0801606c:
    .word tileSetNoDataSelected
    .word paletteNoChipSelected
    .word tilesetChipDataTransmission
    .word paletteChipDataTransmission
    .word tilesetAdditionalChipData
    .word paletteAdditionalChipData
PTR_tilemapCustomScreenChipNameBlank_08016084:
    .word tilemapCustomScreenChipNameBlank
PTR_tilemapChipSelectChipAttributes_08016088:
    .word tilemapChipSelectChipAttributes
tilemapCustomScreenChipNameBlank:
    .incbin "images/custom_screen/chip_name_blank.tilemap"
tilemapChipSelectChipAttributes:
    .incbin "images/custom_screen/chip_attributes.tilemap"

_ts CustomScreen_LoadChipDescription
    push       { lr }
    add        r1,r0,#0x0
    ldr        r0,PTR_TextData_BattleChip_Descriptions_08016104
    ldr        r2,PTR_iwBufferUITextTile_08016108
    ldr        r3,PTR_DAT_0801610c
    mov        r4,#0xa
    push       { r5 }
    mov        r5,#0x3
    ldr        r6,PTR_tilesetDialogueText_08016110
    mov        r7,#0x0
    bl         Text_CopyCharTileUI
    pop        { r5 }
    mov        r0,#0x1
    mov        r1,#0xd
    ldr        r2,PTR_tilemapChipSelectDescription_08016114
    mov        r3,#0xa
    mov        r4,#0x6
    bl         CustomScreen_CopyTilemap
    mov        r0,#0xb
    mov        r1,#0xe
    ldr        r2,PTR_tilemapChipSelectDescriptionPadding_0801611c
    mov        r3,#0x3
    mov        r4,#0x5
    bl         CustomScreen_CopyTilemap
    pop        { pc }
PTR_TextData_BattleChip_Descriptions_08016104:
    .word TextData_BattleChip_Descriptions
PTR_iwBufferUITextTile_08016108:
    .word iwBufferUITextTile
PTR_DAT_0801610c:
    .word 0x600b600
PTR_tilesetDialogueText_08016110:
    .word tilesetDialogueText
PTR_tilemapChipSelectDescription_08016114:
    .word tilemapChipSelectDescription
    .word TilemapEntry_ARRAY_08016198
PTR_tilemapChipSelectDescriptionPadding_0801611c:
    .word tilemapChipSelectDescriptionPadding 
tilemapChipSelectDescription:
    .incbin "images/custom_screen/chip_description.tilemap"
TilemapEntry_ARRAY_08016198:
    .incbin "images/custom_screen/00016198.tilemap"
tilemapChipSelectDescriptionPadding:
    .incbin "images/custom_screen/chip_description_padding.tilemap"

_ts CustomScreen_LoadUILower
    push       { lr }
    bl         CustomScreen_LoadIcons
    push       { r5 }
    ldr        r0,PTR_iwBufferUITextTile_08016378
    ldr        r1,PTR_DAT_08016204
    ldr        r2,DAT_08016200
    bl         Dma_TransferListAdd
    pop        { r5 }
    mov        r0,#0xb
    mov        r1,#0xe
    ldr        r2,PTR_tilemapChipSelectOk_0801620c
    mov        r3,#0x3
    mov        r4,#0x3
    bl         CustomScreen_CopyTilemap
    ldrb       r0,[r5,#0xb]
    ldr        r2,PTR_tilemapChipSelectAddDisabled_08016214
    tst        r0,r0
    bne        LAB_080161f0
    ldr        r2,PTR_tilemapChipSelectAddEnabled_08016210
LAB_080161f0:
    mov        r0,#0xb
    mov        r1,#0x11
    mov        r3,#0x3
    mov        r4,#0x2
    bl         CustomScreen_CopyTilemap
    pop        { pc }
    .align 2, 0
DAT_08016200:
    .word 0x1E0
PTR_DAT_08016204:
    .word 0x600b600
    .word TilemapEntry_ARRAY_08016218
PTR_tilemapChipSelectOk_0801620c:
    .word tilemapChipSelectOk
PTR_tilemapChipSelectAddEnabled_08016210:
    .word tilemapChipSelectAddEnabled
PTR_tilemapChipSelectAddDisabled_08016214:
    .word tilemapChipSelectAddDisabled
TilemapEntry_ARRAY_08016218:
    .incbin "images/custom_screen/00016218.tilemap"
tilemapChipSelectOk:
    .incbin "images/custom_screen/ok_button.tilemap"
tilemapChipSelectAddEnabled:
    .incbin "images/custom_screen/add_button_enabled.tilemap"
tilemapChipSelectAddDisabled:
    .incbin "images/custom_screen/add_button_disabled.tilemap"
    tilemap_entry 0x330, 0, 0xC
_nt CustomScreen_LoadChipSelectIconTilemap
    push       { lr }
    sub        sp,#0x8
    mov        r6,sp
    add        r3,#0xc
    lsl        r3,r3,#0xc
    add        r2,r2,r3
    strh       r2,[r6,#0x0]
    add        r2,#0x1
    strh       r2,[r6,#0x2]
    add        r2,#0x1
    strh       r2,[r6,#0x4]
    add        r2,#0x1
    strh       r2,[r6,#0x6]
    add        r2,r6,#0x0
    mov        r3,#0x2
    mov        r4,#0x2
    bl         CustomScreen_CopyTilemap
    add        sp,#0x8
    pop        { pc }

_nt CustomScreen_LoadSelectedChipFrameTilemap
    push       { lr }
    sub        sp,#0x10
    mov        r6,sp
    push       { r0, r1, r2, r3 }
    ldr        r0,PTR_tilemapChipSlotEmpty_080162b4
    lsl        r1,r3,#0x4
    add        r0,r0,r1
    add        r1,r6,#0x0
    mov        r2,#0x10
    bl         memcpy_32
    pop        { r0, r1, r2, r3 }
    add        r3,#0xc
    lsl        r3,r3,#0xc
    add        r2,r2,r3
    strh       r2,[r6,#0x2]
    add        r2,#0x1
    strh       r2,[r6,#0x4]
    add        r2,#0x1
    strh       r2,[r6,#0xa]
    add        r2,#0x1
    strh       r2,[r6,#0xc]
    add        r2,r6,#0x0
    mov        r3,#0x4
    mov        r4,#0x2
    bl         CustomScreen_CopyTilemap
    add        sp,#0x10
    pop        { pc }
PTR_tilemapChipSlotEmpty_080162b4:
    .word tilemapChipSlotEmpty
tilemapChipSlotEmpty:
    .incbin "images/custom_screen/chip_slot_empty.tilemap"
tilemapChipSlotSelected:
    .incbin "images/custom_screen/chip_slot_selected.tilemap"

_ts CustomScreen_LoadIcons
    push       { r5, lr }
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldrb       r7,[r7,#0x10]
    mov        r4,#0x0
LAB_080162e2:
    mov        r3,#0x0
LAB_080162e4:
    push       { r3, r4 }
    mov        r1,#0x5
    mul        r1,r4
    add        r1,r1,r3
    push       { r1, r3, r4 }
    sub        r7,#0x1
    ldrh       r0,[r5,#0x3e]
    mov        r2,#0x1
    lsl        r2,r1
    tst        r0,r2
    beq        LAB_08016300
    ldr        r0,PTR_tileNullChipIconLight_08016380
    mov        r6,#0x0
    b          LAB_08016328
LAB_08016300:
    ldr        r2,PTR_gBattleFolder_08016384
    ldrb       r0,[r2,r1]
    cmp        r0,#0xff
    bne        LAB_0801630e
    ldr        r0,PTR_tileNullChipIconDark_0801637c
    mov        r6,#0x0
    b          LAB_08016328
LAB_0801630e:
    tst        r7,r7
    bpl        LAB_08016318
    ldr        r0,PTR_tileNullChipIconDark_0801637c
    mov        r6,#0x0
    b          LAB_08016328
LAB_08016318:
    mov        r6,#0x1
    push       { r1, r7 }
    bl         CustomScreen_GetChipDetailFromFolder
    bl         BattleChip_GetChipData
    ldr        r0,[r0,#0x10]
    pop        { r1, r7 }
LAB_08016328:
    ldr        r2,PTR_iwBufferUITextTile_08016378
    lsl        r1,r1,#0x7
    add        r1,r1,r2
    ldr        r2,UINT_08016374
    bl         SWI_CpuSet
    pop        { r1, r3, r4 }
    tst        r6,r6
    beq        LAB_08016348
    mov        r6,#0x1
    mov        r2,#0x40
    add        r2,r2,r1
    ldrb       r0,[r5,r2]
    tst        r0,r0
    beq        LAB_08016348
    mov        r6,#0x2
LAB_08016348:
    ldr        r2,DAT_08016370
    lsl        r1,r1,#0x2
    add        r2,r2,r1
    add        r0,r3,r3
    add        r0,#0x1
    add        r1,r4,r4
    add        r1,#0xd
    add        r3,r6,#0x0
    push       { r7 }
    bl         CustomScreen_LoadChipSelectIconTilemap
    pop        { r7 }
    pop        { r3, r4 }
    add        r3,#0x1
    cmp        r3,#0x5
    bmi        LAB_080162e4
    add        r4,#0x1
    cmp        r4,#0x3
    bmi        LAB_080162e2
    pop        { r5, pc }
DAT_08016370:
    .word 0x3B0
UINT_08016374:
    .word 0x4000020
PTR_iwBufferUITextTile_08016378:
    .word iwBufferUITextTile
PTR_tileNullChipIconDark_0801637c:
    .word tileNullChipIconDark
PTR_tileNullChipIconLight_08016380:
    .word tileNullChipIconLight
PTR_gBattleFolder_08016384:
    .word gBattleFolder

_ts CustomScreen_LoadSelectedChips
    push       { r5, lr }
    mov        r3,#0x0
LAB_0801638c:
    push       { r3 }
    mov        r2,#0x6
    add        r2,r2,r3
    ldrb       r0,[r5,r2]
    push       { r3 }
    cmp        r0,#0xff
    bne        LAB_080163a0
    ldr        r0,PTR_tileNullChipIconLight_080163f8
    mov        r6,#0x0
    b          LAB_080163b4
LAB_080163a0:
    mov        r6,#0x1
    ldr        r2,PTR_gBattleFolder_08016404
    ldrb       r0,[r2,r0]
    push       { r3 }
    bl         CustomScreen_GetChipDetailFromFolder
    bl         BattleChip_GetChipData
    ldr        r0,[r0,#0x10]
    pop        { r3 }
LAB_080163b4:
    ldr        r1,PTR_iwTilesetSelectedChips_080163f4
    lsl        r3,r3,#0x7
    add        r1,r1,r3
    ldr        r2,CpuSetControl_080163f0
    bl         SWI_CpuSet
    pop        { r3 }
    ldr        r2,DAT_080163ec
    lsl        r1,r3,#0x2
    add        r2,r2,r1
    mov        r0,#0xb
    add        r1,r3,r3
    add        r1,#0x3
    add        r3,r6,#0x0
    bl         CustomScreen_LoadSelectedChipFrameTilemap
    pop        { r3 }
    add        r3,#0x1
    cmp        r3,#0x5
    bmi        LAB_0801638c
    push       { r5 }
    ldr        r0,PTR_iwTilesetSelectedChips_080163f4
    ldr        r1,PTR_vtTilesetSelectedChips_08016400
    ldr        r2,DAT_080163fc
    bl         Dma_TransferListAdd
    pop        { r5 }
    pop        { r5, pc }
DAT_080163ec:                           .word 0x00000354
CpuSetControl_080163f0:                 .word 0x4000020
PTR_iwTilesetSelectedChips_080163f4:    .word iwTilesetSelectedChips
PTR_tileNullChipIconLight_080163f8:     .word tileNullChipIconDark
DAT_080163fc:                           .word 0x000000A0
PTR_vtTilesetSelectedChips_08016400:    .word vtTilesetSelectedChips
PTR_gBattleFolder_08016404:             .word gBattleFolder

_ts CustomScreen_UpdateChipSelectPosition
    push       { r5, lr }
    mov        r7,r10
    ldr        r7,[r7,#0x10]
    mov        r1,#0x24
    ldrsh      r0,[r5,r1]
    strh       r0,[r7,#0x18]
    neg        r1,r0
    lsr        r1,r1,#0x3
    add        r1,#0x1
    mov        r2,#0x40
    lsl        r2,r2,#0x8
    mov        r0,#0x0
LAB_08016420:
    orr        r0,r2
    lsr        r2,r2,#0x1
    sub        r1,#0x1
    bne        LAB_08016420
    bl         CustomScreen_LoadChipLayout
    pop        { r5, pc }
    .align 2, 0
unknown_16430:
    .word 0x7FFFF

_ts CustomScreen_LoadChipLayout
    push       { lr }
    sub        sp,#0x28
    mov        r4,sp
    mov        r7,#0x50
    add        r7,r7,r5
    mov        r2,#0x0
LAB_08016440:
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_0801645c
    mov        r3,#0x0
    push       { r7 }
LAB_0801644a:
    add        r6,r3,r3
    ldrh       r1,[r7,#0x0]
    strh       r1,[r4,r6]
    add        r7,#0x1e
    add        r3,#0x1
    cmp        r3,#0x14
    bne        LAB_0801644a
    pop        { r7 }
    b          LAB_0801646a
LAB_0801645c:
    mov        r3,#0x0
    mov        r1,#0x0
LAB_08016460:
    add        r6,r3,r3
    strh       r1,[r4,r6]
    add        r3,#0x1
    cmp        r3,#0x14
    bne        LAB_08016460
LAB_0801646a:
    push       { r0, r2, r4, r7 }
    add        r0,r2,#0x0
    add        r0,#0x11
    mov        r1,#0x0
    mov        r2,#0x3
    add        r3,r4,#0x0
    mov        r4,#0x14
    bl         Screen_CopyTileMapV
    pop        { r0, r2, r4, r7 }
    lsr        r0,r0,#0x1
    add        r7,#0x2
    add        r2,#0x1
    cmp        r2,#0xf
    bne        LAB_08016440
    add        sp,#0x28
    pop        { pc }

_ts CustomScreen_LoadChipSelectCursor
    push       { r5, lr }
    ldrb       r0,[r5,#0x4]
    lsl        r0,r0,#0x4
    add        r0,#0x10
    ldrb       r1,[r5,#0x5]
    lsl        r1,r1,#0x4
    add        r1,#0x70
    mov        r3,#0x0
    bl         CustomScreen_DrawCursor
    bl         CustomScreen_GetSelectedChipOffset
    mov        r1,#0x40
    add        r1,r1,r0
    ldrb       r1,[r5,r1]
    tst        r1,r1
    beq        LAB_080164bc
    mov        r0,#0x68
    sub        r1,#0x1
    lsl        r1,r1,#0x4
    add        r1,#0x20
    mov        r3,#0x0
    bl         CustomScreen_DrawCursor
LAB_080164bc:
    pop        { r5, pc }

_nt CustomScreen_DrawCursorOkButton
    push       { r5, lr }
    mov        r0,#0x58
    mov        r1,#0x72
    mov        r3,#0x1
    bl         CustomScreen_DrawCursor
    pop        { r5, pc }

_ts CustomScreen_DrawCursorAddButton
    push       { r5, lr }
    mov        r0,#0x58
    mov        r1,#0x8a
    mov        r3,#0x2
    bl         CustomScreen_DrawCursor
    pop        { r5, pc }

_nt CustomScreen_DrawCursor
    push       { r5, lr }
    cmp        r3,#0x3
    beq        LAB_080164e6
    ldrb       r4,[r5,#0x1a]
    tst        r4,r4
    beq        LAB_0801654a
LAB_080164e6:
    ldr        r7,PTR_PTR_CursorAttributes_08016554
    lsl        r3,r3,#0x2
    ldr        r7,[r7,r3]
    ldr        r3,PTR_gFrameCounter_08016550
    ldrh       r3,[r3,#0x0]
    mov        r4,#0x8
    tst        r4,r3
    bne        LAB_080164f8
    add        r7,#0x10
LAB_080164f8:
    mov        r4,#0x7
    and        r4,r3
    cmp        r4,#0x7
    bne        LAB_0801650a
    ldrb       r3,[r5,#0x10]
    add        r3,#0x1
    mov        r4,#0x3
    and        r3,r4
    strb       r3,[r5,#0x10]
LAB_0801650a:
    ldrb       r2,[r5,#0x10]
    mov        r4,#0x0
LAB_0801650e:
    push       { r0, r1, r2, r4, r7 }
    push       { r2 }
    mov        r3,#0x0
    ldrsb      r2,[r7,r3]
    add        r0,r0,r2
    mov        r2,#0xff
    lsl        r2,r2,#0x1
    add        r2,#0x1
    and        r0,r2
    ldrh       r3,[r7,#0x2]
    orr        r0,r3
    lsl        r0,r0,#0x10
    mov        r3,#0x1
    ldrsb      r2,[r7,r3]
    add        r1,r1,r2
    mov        r2,#0xff
    and        r1,r2
    orr        r0,r1
    pop        { r2 }
    ldr        r1,ObjectTileAttributes_0801654c
    add        r1,r1,r2
    mov        r2,#0x0
    mov        r3,#0x0
    bl         Oam_AddObject
    pop        { r0, r1, r2, r4, r7 }
    add        r7,#0x4
    add        r4,#0x1
    cmp        r4,#0x4
    bne        LAB_0801650e
LAB_0801654a:
    pop        { r5, pc }
ObjectTileAttributes_0801654c:
    obj_attr_2 0x3A8, 0, 0xD
    .align 2, 0
PTR_gFrameCounter_08016550: .word gFrameCounter
PTR_PTR_CursorAttributes_08016554: .word PTR_CursorAttributes_08016558
PTR_CursorAttributes_08016558:
    .word CursorAttributes_08016564
    .word CursorAttributes_08016584
    .word CursorAttributes_080165a4
CursorAttributes_08016564:
    cursor_attr -8, -8
    cursor_attr  0, -8, FLIP_H
    cursor_attr  0,  0, FLIP_HV
    cursor_attr -8,  0, FLIP_V

    cursor_attr -9, -9
    cursor_attr  1, -9, FLIP_H
    cursor_attr  1,  1, FLIP_HV
    cursor_attr -9,  1, FLIP_V

CursorAttributes_08016584:
    cursor_attr  0,   0
    cursor_attr  16,  0, FLIP_H
    cursor_attr  16, 11, FLIP_HV
    cursor_attr  0,  11, FLIP_V

    cursor_attr  -1, -1
    cursor_attr  17, -1, FLIP_H
    cursor_attr  17, 12, FLIP_HV
    cursor_attr  -1, 12, FLIP_V

CursorAttributes_080165a4:
    cursor_attr  0,   0
    cursor_attr  16,  0, FLIP_H
    cursor_attr  16,  5, FLIP_HV
    cursor_attr  0,   5, FLIP_V

    cursor_attr  -1, -1
    cursor_attr  17, -1, FLIP_H
    cursor_attr  17,  6, FLIP_HV
    cursor_attr  -1,  6, FLIP_V



@@ Checks for the cursor moving on the chip select screen.
@ Out:
@ r0: 1 if cursor is moved to a non-chip position (like OK)
_ts CustomScreen_CheckCursorMove
    push       { lr }
    mov        r6,#0x0
    ldrb       r2,[r5,#CustomScreen_m_chipX]
    ldrb       r3,[r5,#CustomScreen_m_chipY]
    ldrh       r0,[r5,#CustomScreen_heldKeyState]
    mov        r1,#KEY_LEFT
    tst        r0,r1
    beq        .check_key_right
    mov        r0,#SE_Battle_ChipSelectMoveCursor
    bl         Sound_PlaySongImmediate
    mov        r6,#0x1
    tst        r2,r2
    beq        .check_if_valid
    sub        r2,#0x1
    add        r6,#0x1
    b          .check_if_valid
.check_key_right:
    mov        r1,#KEY_RIGHT
    tst        r0,r1
    beq        .check_key_up
    mov        r0,#SE_Battle_ChipSelectMoveCursor
    bl         Sound_PlaySongImmediate
    add        r6,#0x1
    cmp        r2,#0x4
    beq        .check_if_valid
    add        r2,#0x1
    add        r6,#0x1
    b          .check_if_valid
.check_key_up:
    mov        r1,#KEY_UP
    tst        r0,r1
    beq        .check_key_down
    mov        r0,#SE_Battle_ChipSelectMoveCursor
    bl         Sound_PlaySongImmediate
    tst        r3,r3
    beq        .check_if_valid
    sub        r3,#0x1
    b          .check_if_valid
.check_key_down:
    mov        r1,#KEY_DOWN
    tst        r0,r1
    beq        .check_if_valid
    mov        r0,#SE_Battle_ChipSelectMoveCursor
    bl         Sound_PlaySongImmediate
    cmp        r3,#0x2
    beq        .check_if_valid
    add        r3,#0x1
.check_if_valid:
    mov        r1,#0x5
    mul        r1,r3
    add        r1,r1,r2
    ldr        r4,=gBattleFolder
    ldrb       r0,[r4,r1]
    cmp        r0,#0xff
    beq        .is_invalid_position
    LoadStateTo r7, Main_battle
    ldrb       r0,[r7,#Battle_m_customScreenChipCount]
    cmp        r1,r0
    bpl        .is_invalid_position
    cmp        r6,#0x1
    beq        .cursor_moved_to_non_chip
    strb       r2,[r5,#0x4]
    strb       r3,[r5,#0x5]
.valid_move:
    mov        r0,#0x0
    pop        { pc }
.is_invalid_position:
    tst        r6,r6
    beq        .valid_move
.cursor_moved_to_non_chip:
    mov        r0,#0x1
    pop        { pc }
    .pool

_ts CustomScreen_GetChipDetailFromFolder
    push       { lr }
    cmp        r0,#0xff
    beq        LAB_08016668
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldr        r7,[r7,#0x30]
    lsl        r0,r0,#0x1
    add        r7,r7,r0
    ldrb       r0,[r7,#0x0]
    ldrb       r1,[r7,#0x1]
LAB_08016668:
    pop        { pc }

_nt CustomScreen_GetChipDetailFromDeck
    push       { lr }
    ldr        r1,=gBattleFolder
    ldrb       r0,[r1,r0]
    bl         CustomScreen_GetChipDetailFromFolder
    pop        { pc }
    .pool

_ts CustomScreen_GetChipFromPosition
    push       { lr }
    ldr        r7,=gBattleFolder
    ldrb       r0,[r5,#0x4]
    ldrb       r1,[r5,#0x5]
    mov        r2,#0x5
    mul        r1,r2
    add        r0,r0,r1
    ldrb       r0,[r7,r0]
    pop        { pc }
    .pool

_ts CustomScreen_CheckRToggle
    push       { lr }
    mov        r0,#0x0
    ldrh       r2,[r5,#0x38]
    mov        r1,#0x1
    lsl        r1,r1,#0x8
    tst        r2,r1
    beq        LAB_080166ac
    ldrb       r1,[r5,#0x1]
    strb       r1,[r5,#0x13]
    mov        r1,#0x14
    strb       r1,[r5,#0x1]
    mov        r0,#0x1
LAB_080166ac:
    pop        { pc }

_nt CustomScreen_CheckHideDescriptionKeyPress
    push       { lr }
    mov        r0,#0x0
    ldrh       r2,[r5,#0x38]
    ldr        r1,=0x1F3
    tst        r2,r1
    beq        LAB_080166c0
    ldrb       r1,[r5,#0x13]
    strb       r1,[r5,#0x1]
    mov        r0,#0x1
LAB_080166c0:
    pop        { pc }
    .pool

_ts CustomScreen_LoadDamageTilemap
    push       { lr }
    sub        sp,#0x10
    tst        r0,r0
    beq        LAB_080166dc
    mov        r1,#0x5
    mov        r2,#0xa
    mov        r3,#0x4
    bl         CustomScreen_LoadNumberDamageTilemap
    b          LAB_080166f4
LAB_080166dc:
    ldr        r0,TilemapEntry_080166f8
    str        r0,[sp,#0x0]
    str        r0,[sp,#0x4]
    str        r0,[sp,#0x8]
    str        r0,[sp,#0xc]
    mov        r0,#0x5
    mov        r1,#0xa
    mov        r2,sp
    mov        r3,#0x4
    mov        r4,#0x2
    bl         CustomScreen_CopyTilemap
LAB_080166f4:
    add        sp,#0x10
    pop        { pc }
TilemapEntry_080166f8:
    tilemap_entry 0x314, 0, 0xC
    tilemap_entry 0x314, 0, 0xC

_ts CustomScreen_LoadNumberDamageTilemap
    push       { lr }
    sub        sp,#0x10
    mov        r8,sp
    push       { r1, r2, r3 }
    push       { r3 }
    mov        r1,#0x8
    mov        r2,r8
    ldr        r3,TilemapEntry_08016760
LAB_0801670c:
    strh       r3,[r2,#0x0]
    add        r2,#0x2
    sub        r1,#0x1
    bne        LAB_0801670c
    push       { r5 }
    bl         ConvertNumToBCD
    pop        { r5 }
    pop        { r3 }
    mov        r6,r8
    sub        r2,r3,#0x1
    add        r2,r2,r2
    add        r6,r6,r2
    add        r4,r3,r3
    push       { r0 }
    bl         GetWidthOfBcdNumber
    add        r3,r0,#0x0
    pop        { r0 }
    ldr        r7,tilemapDamageNumberStart
LAB_08016734:
    mov        r1,#0xf
    and        r1,r0
    add        r1,r1,r1
    add        r1,r1,r7
    strh       r1,[r6,#0x0]
    add        r1,#0x1
    strh       r1,[r6,r4]
    lsr        r0,r0,#0x4
    sub        r6,#0x2
    sub        r3,#0x1
    bne        LAB_08016734
    pop        { r1, r2, r3 }
    add        r0,r1,#0x0
    add        r1,r2,#0x0
    mov        r2,r8
    mov        r4,#0x2
    bl         CustomScreen_CopyTilemap
    add        sp,#0x10
    pop        { pc }
tilemapDamageNumberStart:
    tilemap_entry 0x300, 0, 0xC
    .align 2, 0
TilemapEntry_08016760:
    tilemap_entry 0x314, 0, 0xC

_ts CustomScreen_DrawChipElement
    push       { lr }
    push       { r5 }
    lsl        r0,r0,#0x7
    ldr        r1,PTR_tilesetBattleChipElements_08016790
    add        r0,r0,r1
    ldr        r1,PTR_DAT_0801678c
    mov        r2,#0x20
    bl         Dma_TransferListAdd
    pop        { r5 }
    mov        r0,#0x3
    mov        r1,#0xa
    ldr        r2,PTR_TilemapEntry_08016788
    mov        r3,#0x2
    mov        r4,#0x2
    bl         CustomScreen_CopyTilemap
    pop        { pc }
PTR_TilemapEntry_08016788: .word TilemapEntry_08016794
PTR_DAT_0801678c: .word 0x600aa00
PTR_tilesetBattleChipElements_08016790: .word tilesetBattleChipElements
TilemapEntry_08016794:
    tilemap_entry 0x350, 0, 0xC
    tilemap_entry 0x351, 0, 0xC
    tilemap_entry 0x352, 0, 0xC
    tilemap_entry 0x353, 0, 0xC

_ts CustomScreen_DrawChipCode
    push       { r5, lr }
    push       { r5 }
    lsl        r0,r0,#0x6
    ldr        r1,PTR_tilesetBattleChipCodes_080167c0
    add        r0,r0,r1
    ldr        r1,PTR_DAT_080167c4
    mov        r2,#0x10
    bl         Dma_TransferListAdd
    pop        { r5 }
    mov        r0,#0x1
    mov        r1,#0xa
    ldr        r2,PTR_TilemapEntry_ARRAY_080167c8
    mov        r3,#0x1
    mov        r4,#0x2
    bl         CustomScreen_CopyTilemap
    pop        { r5, pc }

PTR_tilesetBattleChipCodes_080167c0:
    .word tilesetBattleChipCodes
PTR_DAT_080167c4:
    .word 0x600a9c0
PTR_TilemapEntry_ARRAY_080167c8:
    .word TilemapEntry_ARRAY_080167cc
TilemapEntry_ARRAY_080167cc:
    tilemap_entry 0x34E, 0, 0xC
    tilemap_entry 0x34F, 0, 0xC


dummy_167d0:
    push       { r5, lr }
    pop        { r5, pc }


FUN_080167d4:
    ldrb       r0,[r5,#0x12]
    add        r0,#0x1
    strb       r0,[r5,#0x12]
    mov        r1,#0xe
    bl         SWI_Div
    cmp        r0,#0x6
    bmi        LAB_080167e8
    mov        r0,#0x0
    strb       r0,[r5,#0x12]
LAB_080167e8:
    ldr        r1,PTR_BYTE_ARRAY_08016840
    ldrb       r0,[r1,r0]
    cmp        r0,#0x2
    beq        LAB_0801682e
    push       { r0, r5 }
    ldr        r0,DAT_08016834
    mov        r1,#0x20
    mov        r2,#0x56
    mov        r3,#0xd
    mov        r4,#0x0
    mov        r5,#0x1
    mov        r6,#0x0
    bl         Battle_AddObject
    ldr        r0,DAT_08016830
    mov        r1,#0x0
    mov        r2,#0x56
    mov        r3,#0xd
    mov        r4,#0x1
    mov        r5,#0x1
    mov        r6,#0x0
    bl         Battle_AddObject
    pop        { r0, r5 }
    cmp        r0,#0x1
    bne        LAB_0801682e
    ldr        r0,DAT_08016838
    mov        r1,#0x18
    mov        r2,#0x56
    mov        r3,#0xd
    mov        r4,#0x0
    mov        r5,#0x1
    mov        r6,#0x0
    bl         Battle_AddObject
LAB_0801682e:
    pop        { r5, pc }
DAT_08016830: .word 0x3B4
DAT_08016834: .word 0x3B8
DAT_08016838: .word 0x3BA
    .word 0x20064A0
PTR_BYTE_ARRAY_08016840: .word BYTE_ARRAY_08016844

BYTE_ARRAY_08016844:
    .byte 0, 1, 0, 1, 0, 2


_nt CustomScreen_LoadChipTilemap
    push       { lr }
    ldr        r1,TilemapEntry_0801685c
    mov        r2,#0x38
LAB_08016850:
    strh       r1,[r0,#0x0]
    add        r1,#0x1
    add        r0,#0x2
    sub        r2,#0x1
    bne        LAB_08016850
    pop        { pc }
TilemapEntry_0801685c:
    tilemap_entry 0x378, 0, 0xB

_ts CustomScreen_LoadBlankChipTilemap
    push       { lr }
    ldr        r1,tilemapBlank
    mov        r2,#0x38
LAB_08016866:
    strh       r1,[r0,#0x0]
    add        r0,#0x2
    sub        r2,#0x1
    bne        LAB_08016866
    pop        { pc }
tilemapBlank:
    tilemap_entry 0x315, 0x0, 0xC


@@ Moves up chip IDs in a chip list to eliminate empty spaces.
@@ In: 
@@ r0: deckPtr: The pointer to the group to optimize.
@@ r1: deckSz: The size of the group.
_ts CustomScreen_NormalizeChipGroup
    push       { r5, r6, lr }
    add        r5,r0,r1
    add        r6,r0,#0x0
    add        r7,r0,#0x0
LAB_0801687c:
    ldrb       r2,[r6,#0x0]
    cmp        r2,#0xff
    beq        LAB_08016886
    strb       r2,[r7,#0x0]
    add        r7,#0x1
LAB_08016886:
    add        r6,#0x1
    sub        r1,#0x1
    bne        LAB_0801687c
    mov        r1,#0xff
LAB_0801688e:
    cmp        r7,r5
    beq        LAB_08016898
    strb       r1,[r7,#0x0]
    add        r7,#0x1
    b          LAB_0801688e
LAB_08016898:
    pop        { r5, r6, pc }

@@ Removes the selected battle chips from the active battle deck.
_nt CustomScreen_TakeSelectedChipsFromDeck
    push       { lr }
    mov        r6,#0x40
    add        r6,r6,r5
    ldr        r7,PTR_gBattleFolder_080168c0
    mov        r4,#0x0
LAB_080168a4:
    ldrb       r0,[r6,r4]
    tst        r0,r0
    beq        LAB_080168ae
    mov        r0,#0xff
    strb       r0,[r7,r4]
LAB_080168ae:
    add        r4,#0x1
    cmp        r4,#0xf
    bmi        LAB_080168a4
    ldr        r0,PTR_gBattleFolder_080168c0
    @ 
    mov        r1,#30
    bl         CustomScreen_NormalizeChipGroup
    pop        { pc }
    .align 2,0
PTR_gBattleFolder_080168c0: .word gBattleFolder

@@ Check if a given battle chip is allowed to be selected
@ r0 - The ID of the chip.
_ts CustomScreen_ValidateSelection
    push       { lr }
    mov        r6,#0x3
    @ First, check if there are any chips selected at all
    @ If none, then chip can be selected, with "all flags"
    ldrb       r1,[r5,#CustomScreen_m_selectedChipCount]
    tst        r1,r1
    beq        .acceptSelection
    @ Check if chip selection is full - if so, then play the
    @ "you can't select more chips" sound and return
    @ false
    cmp        r1,#0x5
    beq        .rejectSelection
    @ Based on the given chip folder ID in r0, look at
    @ the corresponding area in the chip selection list
    @ and see if it was selected already (has a value
    @ greater than 0).
    @ If it has an order (it was selected), then play the
    @ rejection sound and return false.
    mov        r2,#CustomScreen_m_chipSelectionOrder
    add        r2,r2,r0
    ldrb       r2,[r5,r2]
    tst        r2,r2
    bne        .rejectSelection
    @ At this point, there are between 1 and 4 chips selected,
    @ inclusive.
    @ r1 - selected chip count
    push       { r0 }
    mov        r2,#CustomScreen_m_selectedChipIndices
    add        r2,r2,r1
    sub        r2,#0x1
    @ Get the last chip folder ID selected, and get the details
    @ about the chip.
    ldrb       r0,[r5,r2]
    bl         CustomScreen_GetChipDetailFromDeck
    add        r2,r0,#0x0
    add        r3,r1,#0x0
    @ r2 - last chip ID
    @ r3 - last chip code
    pop        { r0 }
    bl         CustomScreen_GetChipDetailFromDeck
    @ r0 - curr chip ID
    @ r1 - curr chip code
    mov        r6,#0x0
    @ If the last chip selected has the same chip ID
    @ as the chip being checked, set the "same chip ID"
    @ flag
    cmp        r0,r2
    bne        .checkChipCode
    add        r6,#0x1
    @ If the code of the last selected chip matches the code
    @ of the chip being checked, set the "same code" flag
.checkChipCode:
    cmp        r1,r3
    bne        .checkValidFlags
    add        r6,#0x2
    @ If no flags are set (both chips have different
    @ IDs and different codes), then play the reject
    @ sound and return false
.checkValidFlags:
    tst        r6,r6
    beq        .rejectSelection
    @ If there are no flags shared between the last chip
    @ selected and the current chip, play reject sound
    @ and return false.
    @ This encodes the "rules" of the hand selection:
    @ - There are two flags: Flag 1 = same ID, Flag 2 = same code 
    @ - When a chip is selected, the corresponding flag that
    @ shows its relationship with the prior selected chip
    @ is saved.
    @ - The next chip you select must share a relation flag
    @ with the prior chip in some way.
    @ - The first chip you select is "free" (flag 2 | flag 1)
    @ - Selecting chips with the same ID and code after the
    @ "free" chip will keep both flags.
    @ - Picking a chip after a free chip that has only one
    @ of the relation flags "locks" that property for
    @ future chip selections. For example:
    @ - Cannon A
    @ - Cannon A
    @ - Cannon B
    @  ^ After this, the "same ID" flag is the most current,
    @    and future chip selections for the same hand have
    @    to match this relation flag.
    ldrb       r1,[r5,#CustomScreen_m_selectedChipCount]
    mov        r2,#CustomScreen_m_selectedChipConditions
    add        r2,r2,r1
    sub        r2,#0x1
    ldrb       r0,[r5,r2]
    and        r6,r0
    bne        .acceptSelection
.rejectSelection:
    mov        r0,#0x6c
    bl         Sound_PlaySongImmediate
    mov        r0,#0x0
    mov        r1,#0x0
    pop        { pc }
    @ Return true, along with the
    @ appropriate relation flags
.acceptSelection:
    add        r1,r6,#0x0
    mov        r0,#0x1
    pop        { pc }


_nt CustomScreen_EnableInput
    ldr        r7,=gCustomScreen
    mov        r0,#0x1
    strb       r0,[r7,#0x1a]
    mov        pc,lr

    .align 2,0
    .pool


_nt CustomScreen_DisableInput
    ldr        r7,=gCustomScreen
    mov        r0,#0x0
    strb       r0,[r7,#0x1a]
    mov        pc,lr

    .align 2, 0
    .pool


_ts CustomScreen_AnimateLogo
    push       { lr }
    ldrb       r0,[r5,#0x1b]
    tst        r0,r0
    bne        LAB_0801694e
    mov        r0,#0x0
    strb       r0,[r5,#0x1c]
    pop        { pc }
LAB_0801694e:
    ldrb       r0,[r5,#0x1c]
    add        r0,#0x1
    cmp        r0,#0x0
    cmp        r0,#0x10
    bmi        LAB_0801695c
    mov        r0,#0x0
    strb       r0,[r5,#0x1b]
LAB_0801695c:
    strb       r0,[r5,#0x1c]
    ldr        r7,PTR_framesLogoAnimation_080169cc
    ldrb       r0,[r7,r0]
    lsl        r0,r0,#0x2
    ldr        r7,PTR_logoFrameList_080169c8
    ldr        r2,[r7,r0]
    mov        r0,#0xc
    mov        r1,#0x0
    mov        r3,#0x2
    mov        r4,#0x3
    bl         CustomScreen_CopyTilemap
    pop        { pc }

framesLogoAnimation:
    .byte 0, 1, 2, 3
    .byte 3, 0, 0, 1
    .byte 1, 1, 2, 2
    .byte 2, 3, 3, 3

    .align 2, 0
tilemapCustomScreenLogoFrame0:
    tilemap_entry 0x331, 0, 0xC
    tilemap_entry 0x332, 0, 0xC
    tilemap_entry 0x333, 0, 0xC
    tilemap_entry 0x334, 0, 0xC
    tilemap_entry 0x335, 0, 0xC
    tilemap_entry 0x336, 0, 0xC
tilemapCustomScreenLogoFrame1:
    tilemap_entry 0x337, 0, 0xC
    tilemap_entry 0x338, 0, 0xC
    tilemap_entry 0x339, 0, 0xC
    tilemap_entry 0x33A, 0, 0xC
    tilemap_entry 0x33B, 0, 0xC
    tilemap_entry 0x33C, 0, 0xC
tilemapCustomScreenLogoFrame2:
    tilemap_entry 0x332, 1, 0xC
    tilemap_entry 0x331, 1, 0xC
    tilemap_entry 0x334, 1, 0xC
    tilemap_entry 0x333, 1, 0xC
    tilemap_entry 0x336, 1, 0xC
    tilemap_entry 0x335, 1, 0xC
tilemapCustomScreenLogoFrame3:
    tilemap_entry 0x33D, 0, 0xC
    tilemap_entry 0x33E, 0, 0xC
    tilemap_entry 0x33F, 0, 0xC
    tilemap_entry 0x340, 0, 0xC
    tilemap_entry 0x341, 0, 0xC
    tilemap_entry 0x342, 0, 0xC
logoFrameList:
    .word tilemapCustomScreenLogoFrame0
    .word tilemapCustomScreenLogoFrame1
    .word tilemapCustomScreenLogoFrame2
    .word tilemapCustomScreenLogoFrame3
PTR_logoFrameList_080169c8: .word logoFrameList
PTR_framesLogoAnimation_080169cc: .word framesLogoAnimation

@@ Gets the amount of chips remaining in the deck.
@ Out:
@ r0: The amount of chips remaining in the deck. Can be between 0 and 30.
_ts CustomScreen_GetDeckSize
    push       { r1, r7, lr }
    mov        r0,#0x0
    ldr        r7,=gBattleFolder
LAB_080169d6:
    ldrb       r1,[r7,r0]
    cmp        r1,#0xff
    beq        LAB_080169e2
    add        r0,#0x1
    cmp        r0,#0x1e
    blt        LAB_080169d6
LAB_080169e2:
    pop        { r1, r7, pc }

    .pool


_nt CustomScreenT1_Main
    push       {lr}
    ldr        r5,PTR_gCustomScreen_08016a24
    mov        r0,#0x0
    mov        r1,#0x0
    ldrb       r2,[r5,#0x1a]
    tst        r2,r2
    beq        LAB_080169fe
    mov        r7,r10
    ldr        r7,[r7,#0x4]
    ldrh       r0,[r7,#0x2]
    ldrh       r1,[r7,#0x4]
LAB_080169fe:
    strh       r0,[r5,#0x38]
    strh       r1,[r5,#0x3a]
    ldrb       r0,[r5,#0x0]
    ldr        r7,PTR_PTR_CustomScreen_0_Init
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    ldrb       r1,[r5,#0x1]
    lsr        r1,r1,#0x2
    pop        {pc}

    .align 2, 0
PTR_CustomScreen_0_Init:
    .word       CustomScreen_0_Init
    .word       CustomScreenT1_1_Main
    .word       CustomScreen_2_TakeOrAddChips
PTR_PTR_CustomScreen_0_Init:
    .word       PTR_CustomScreen_0_Init
PTR_gCustomScreen_08016a24:
    .word       gCustomScreen


_nt CustomScreenT1_1_Main
    push       {lr}
    ldr        r7,=PTR_CustomScreen_1_0_Open_08016a38
    ldrb       r0,[r5,#0x1]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    mov        r0,#0x1
    pop        {pc}
PTR_CustomScreen_1_0_Open_08016a38:
    .word       CustomScreen_1_0_Open
    .word       CustomScreenT1_1_1_ChipSelect
    .word       CustomScreenT1_1_2_Ok
    .word       CustomScreenT1_1_3_Add
    .word       CustomScreen_1_4_Close
    .word       CustomScreen_1_5_ShowDescription
    .word       CustomScreen_1_6_NoMoreData

    .pool
    .word       gFrameCounter


_nt CustomScreenT1_1_1_ChipSelect
    push       {lr}
    ldr        r7,=PTR_CustomScreenT1_1_1_0_CheckChips_08016a94
    ldrb       r0,[r5,#0x2]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         CustomScreen_GetChipFromPosition
    bl         CustomScreen_GetChipDetailFromFolder
    bl         CustomScreen_LoadChipDetail
    bl         CustomScreen_LoadChipSelectCursor
    bl         dummy_167d0
    bl         CustomScreen_LoadUILower
    bl         CustomScreen_LoadSelectedChips
    bl         CustomScreen_AnimateLogo
    bl         CustomScreen_UpdateChipSelectPosition
    pop        {pc}

    .align 2, 0
    .pool

PTR_CustomScreenT1_1_1_0_CheckChips_08016a94:
    .word CustomScreenT1_1_1_0_CheckChips
    .word CustomScreenT1_1_1_1_WaitDialog


_nt CustomScreenT1_1_1_0_CheckChips
    push       {lr}
    bl         CustomScreen_CheckRToggle
    tst        r0,r0
    beq        LAB_08016aa8
    pop        {pc}
LAB_08016aa8:
    bl         CustomScreen_CheckCursorMove
    tst        r0,r0
    beq        LAB_08016aba
    mov        r0,#0x8
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strb       r0,[r5,#0x2]
    b          dummy_16b84
LAB_08016aba:
    ldrh       r0,[r5,#0x38]
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_08016b34
    bl         CustomScreen_GetSelectedChipOffset
    bl         CustomScreen_ValidateSelection
    tst        r0,r0
    beq        LAB_08016b34
    ldrb       r2,[r5,#0xb]
    mov        r3,#0x15
    add        r3,r3,r2
    strb       r1,[r5,r3]
    bl         CustomScreen_GetSelectedChipOffset
    ldrb       r1,[r5,#0xb]
    mov        r2,#0x6
    add        r2,r2,r1
    strb       r0,[r5,r2]
    add        r1,#0x1
    strb       r1,[r5,#0xb]
    mov        r2,#0x40
    add        r2,r2,r0
    strb       r1,[r5,r2]
    push       {r0}
    mov        r0,#0x6a
    bl         Sound_PlaySongImmediate
    mov        r0,#0x1
    strb       r0,[r5,#0x1b]
    pop        {r0}
    bl         CustomScreen_GetSelectedChipOffset
    bl         CustomScreen_GetChipDetailFromFolder
    cmp        r0,#0x1
    beq        LAB_08016b16
    mov        r0,#0x23
    @ "OK, let's send the data - choose OK"
    bl         Text_SetTextPointer_Tutorial1
    mov        r0,#0x1
    strb       r0,[r5,#0x3]
    mov        r0,#0x4
    strb       r0,[r5,#0x2]
    b          dummy_16b84
LAB_08016b16:
    ldrb       r1,[r5,#0x3]
    tst        r1,r1
    beq        LAB_08016b24
    @ "OK, let's send the data - choose OK"
    mov        r0,#0x23
    mov        r1,#0x3
    strb       r1,[r5,#0x3]
    b          LAB_08016b2a
    @ "You chose a Cannon. Pick another Cannon"
LAB_08016b24:
    mov        r0,#0x15
    mov        r1,#0x2
    strb       r1,[r5,#0x3]
LAB_08016b2a:
    bl         Text_SetTextPointer_Tutorial1
    mov        r0,#0x4
    strb       r0,[r5,#0x2]
    b          dummy_16b84
LAB_08016b34:
    mov        r1,#0x2
    tst        r0,r1
    beq        LAB_08016b76
    ldrb       r1,[r5,#0x3]
    tst        r1,r1
    beq        LAB_08016b76
    @ "Don't worry, don't cancel"
    mov        r0,#0x24
    cmp        r1,#0x2
    bne        LAB_08016b48
    @ "Don't need to cancel"
    mov        r0,#0x16
LAB_08016b48:
    bl         Text_SetTextPointer_Tutorial1
    mov        r0,#0x4
    strb       r0,[r5,#0x2]
    b          dummy_16b84


_nt CustomScreenT1_Cancel
    ldrb       r0,[r5,#0xb]
    tst        r0,r0
    beq        dummy_16b84
    sub        r0,#0x1
    strb       r0,[r5,#0xb]
    mov        r1,#0x6
    add        r1,r1,r0
    ldrb       r2,[r5,r1]
    mov        r0,#0xff
    strb       r0,[r5,r1]
    mov        r0,#0x0
    mov        r3,#0x40
    add        r3,r3,r2
    strb       r0,[r5,r3]
    mov        r0,#0x6b
    bl         Sound_PlaySongImmediate
    b          dummy_16b84
LAB_08016b76:
    mov        r1,#0x8
    tst        r0,r1
    beq        dummy_16b84
    mov        r0,#0x8
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strb       r0,[r5,#0x2]
    

_nt dummy_16b84
    pop        {pc}


_nt CustomScreenT1_1_1_1_WaitDialog
    push       {lr}
    bl         CustomScreen_DisableInput
    bl         Text_CheckIfDialogActive
    bne        LAB_08016b9a
    bl         CustomScreen_EnableInput
    mov        r0,#0x0
    strb       r0,[r5,#0x2]
LAB_08016b9a:
    pop        {pc}


_nt CustomScreenT1_1_2_Ok
    push       {lr}
    ldr        r7,=PTR_CustomScreenT1_1_2_0_CheckChips
    ldrb       r0,[r5,#0x2]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    mov        r0,#0x0
    ldrb       r1,[r5,#0xb]
    tst        r1,r1
    beq        LAB_08016bb2
    mov        r0,#0x1
LAB_08016bb2:
    bl         CustomScreen_LoadAlternateArt
    bl         CustomScreen_DrawCursorOkButton
    bl         dummy_167d0
    bl         CustomScreen_LoadUILower
    bl         CustomScreen_LoadSelectedChips
    bl         CustomScreen_UpdateChipSelectPosition
    pop        {pc}

    .align 2, 0
    .pool
PTR_CustomScreenT1_1_2_0_CheckChips:
    .word       CustomScreenT1_1_2_0_CheckChips
    .word       CustomScreenT1_1_2_1_Fail
    .word       CustomScreenT1_1_2_2_Success


_nt CustomScreenT1_1_2_0_CheckChips
    push       {lr}
    ldrh       r0,[r5,#0x38]
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_08016c4e
    mov        r0,#0x6d
    bl         Sound_PlaySongImmediate
    ldrb       r3,[r5,#0xb]
    tst        r3,r3
    bne        LAB_08016bf6
    @ "Choose the cannons"
    mov        r0,#0x19
    b          LAB_08016c02
LAB_08016bf6:
    ldrb       r3,[r5,#0x3]
    cmp        r3,#0x1
    beq        LAB_08016c0c
    cmp        r3,#0x2
    bne        LAB_08016c0c
    @ "Choose another cannon"
    mov        r0,#0x17
LAB_08016c02:
    bl         Text_SetTextPointer_Tutorial1
    mov        r0,#0x4
    strb       r0,[r5,#0x2]
    pop        {pc}
LAB_08016c0c:
    mov        r0,r10
    ldr        r0,[r0,#0xc]
    add        r0,#0x78
    mov        r1,#0x6
    mov        r2,#0xff
    bl         memset
    mov        r6,r10
    ldr        r6,[r6,#0xc]
    ldrb       r3,[r5,#0xb]
    strb       r3,[r6,#0x11]
    tst        r3,r3
    beq        LAB_08016c3e
    add        r6,#0x78
    mov        r4,#0x6
    add        r4,r4,r5
LAB_08016c2c:
    ldrb       r0,[r4,#0x0]
    bl         CustomScreen_GetChipDetailFromDeck
    strb       r0,[r6,#0x0]
    strb       r1,[r6,#0x6]
    add        r6,#0x1
    add        r4,#0x1
    sub        r3,#0x1
    bne        LAB_08016c2c
LAB_08016c3e:
    mov        r0,#0x25
    @ "We've sent the data - time to fight the virus"
    bl         Text_SetTextPointer_Tutorial1
    mov        r0,#0x8
    strb       r0,[r5,#0x2]
    mov        r0,#0x0
    strb       r0,[r5,#0xf]
    pop        {pc}
LAB_08016c4e:
    ldrh       r0,[r5,#0x3a]
    mov        r1,#0x22
    tst        r0,r1
    beq        LAB_08016c86
    mov        r0,#0x5
LAB_08016c58:
    sub        r0,#0x1
    bmi        LAB_08016cd4
    push       {r0}
    ldrb       r1,[r5,#0x5]
    bl         CustomScreen_GetChipSelectIndex
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldrb       r1,[r7,#0x10]
    cmp        r0,r1
    bmi        LAB_08016c72
    mov        r0,#0xff
    b          LAB_08016c76
LAB_08016c72:
    bl         CustomScreen_GetChipDetailFromDeck
LAB_08016c76:
    cmp        r0,#0xff
    pop        {r0}
    beq        LAB_08016c58
    strb       r0,[r5,#0x4]
    mov        r0,#0x69
    bl         Sound_PlaySongImmediate
    b          LAB_08016caa
LAB_08016c86:
    mov        r1,#0x10
    tst        r0,r1
    beq        LAB_08016cba
    mov        r0,#0x1
    neg        r0,r0
LAB_08016c90:
    add        r0,#0x1
    cmp        r0,#0x5
    beq        LAB_08016cd4
    push       {r0}
    ldrb       r1,[r5,#0x5]
    bl         CustomScreen_GetChipSelectIndex
    bl         CustomScreen_GetChipDetailFromDeck
    cmp        r0,#0xff
    pop        {r0}
    beq        LAB_08016c90
    strb       r0,[r5,#0x4]
LAB_08016caa:
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strb       r0,[r5,#0x2]
    mov        r0,#0x69
    bl         Sound_PlaySongImmediate
    b          LAB_08016cd4
LAB_08016cba:
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08016cd4
    ldrb       r0,[r5,#0xb]
    tst        r0,r0
    bne        LAB_08016cd4
    mov        r0,#0x69
    bl         Sound_PlaySongImmediate
    mov        r0,#0xc
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strb       r0,[r5,#0x2]
LAB_08016cd4:
    mov        r0,#0x0
    ldrb       r1,[r5,#0xb]
    tst        r1,r1
    beq        LAB_08016cde
    mov        r0,#0x1
LAB_08016cde:
    pop        {pc}


_nt CustomScreenT1_1_2_1_Fail
    push       {lr}
    bl         CustomScreen_DisableInput
    bl         Text_CheckIfDialogActive
    bne        LAB_08016cf4
    bl         CustomScreen_EnableInput
    mov        r0,#0x0
    strb       r0,[r5,#0x2]
LAB_08016cf4:
    mov        r0,#0x0
    pop        {pc}
   
   
_nt CustomScreenT1_1_2_2_Success
    push       {lr}
    bl         CustomScreen_DisableInput
    bl         Text_CheckIfDialogActive
    bne        LAB_08016d10
    bl         CustomScreen_EnableInput
    mov        r0,#0x10
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strb       r0,[r5,#0x2]
LAB_08016d10:
    mov        r0,#0x0
    pop        {pc}
    
    
_nt CustomScreenT1_1_3_Add
    push       {lr}
    ldr        r7,=PTR_CustomScreenT1_1_3_0_ShowMessage_08016d40
    ldrb       r0,[r5,#0x2]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    mov        r0,#0x2
    bl         CustomScreen_LoadAlternateArt
    bl         CustomScreen_DrawCursorAddButton
    bl         dummy_167d0
    bl         CustomScreen_LoadUILower
    bl         CustomScreen_LoadSelectedChips
    bl         CustomScreen_UpdateChipSelectPosition
    pop        {pc}
    
    .align 2, 0
    .pool
PTR_CustomScreenT1_1_3_0_ShowMessage_08016d40:
    .word       CustomScreenT1_1_3_0_ShowMessage
    .word       CustomButtonT1_1_3_1_Return
   
   
_nt CustomScreenT1_1_3_0_ShowMessage
    push       {lr}
    ldrh       r0,[r5,#0x38]
    mov        r1,#0x40
    tst        r0,r1
    beq        LAB_08016d5c
    mov        r0,#0x8
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strb       r0,[r5,#0x2]
    b          LAB_08016d74
LAB_08016d5c:
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_08016d74
    @ "Don't need to use this yet"
    mov        r0,#0x1a
    ldrb       r1,[r5,#0x3]
    cmp        r1,#0x2
    bne        LAB_08016d6c
    @ "Don't need to use this yet"
    mov        r0,#0x18
LAB_08016d6c:
    bl         Text_SetTextPointer_Tutorial1
    mov        r0,#0x4
    strb       r0,[r5,#0x2]
LAB_08016d74:
    pop        {pc}
    
    
_nt CustomButtonT1_1_3_1_Return
    push       {lr}
    bl         CustomScreen_DisableInput
    bl         Text_CheckIfDialogActive
    bne        LAB_08016d8a
    mov        r0,#0x0
    strb       r0,[r5,#0x2]
    bl         CustomScreen_EnableInput
LAB_08016d8a:
    pop        {pc}
    
    
_nt CustomScreenT2_Main
    push       {lr}
    ldr        r5,PTR_gCustomScreen_08016dd4
    mov        r0,#0x0
    mov        r1,#0x0
    ldrb       r2,[r5,#0x1a]
    tst        r2,r2
    beq        LAB_08016da2
    mov        r7,r10
    ldr        r7,[r7,#0x4]
    ldrh       r0,[r7,#0x2]
    ldrh       r1,[r7,#0x4]
LAB_08016da2:
    strh       r0,[r5,#0x38]
    strh       r1,[r5,#0x3a]
    ldrb       r0,[r5,#0x0]
    ldr        r7,PTR_PTR_CustomScreen_0_Init_08016dd0
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    ldrb       r1,[r5,#0x1]
    lsr        r1,r1,#0x2
    push       {r0,r1,r5}
    ldr        r0,PTR_DAT_08016dd8
    ldrb       r1,[r5,#0x3]
    bl         PrintDebugString
    pop        {r0,r1,r5}
    pop        {pc}

    .align 2, 0
PTR_CustomScreen_0_Init_08016dc4:
    .word       CustomScreen_0_Init
    .word       CustomScreenT2_1_Main
    .word       CustomScreen_2_TakeOrAddChips
PTR_PTR_CustomScreen_0_Init_08016dd0:
    .word       PTR_CustomScreen_0_Init_08016dc4
PTR_gCustomScreen_08016dd4:
    .word       gCustomScreen
PTR_DAT_08016dd8:
    .word       DAT_08016ddc
DAT_08016ddc:
    .byte 0, 0x13
    .asciz "%D"
    .align 2, 0
   
   
_nt CustomScreenT2_1_Main
    push       {lr}
    ldr        r7,=PTR_CustomScreen_1_0_Open_08016df4
    ldrb       r0,[r5,#0x1]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    mov        r0,#0x1
    pop        {pc}
PTR_CustomScreen_1_0_Open_08016df4:
    .word       CustomScreen_1_0_Open
    .word       CustomScreenT2_1_1_ChipSelect
    .word       CustomScreenT2_1_2_Ok
    .word       CustomScreenT2_1_3_Add
    .word       CustomScreen_1_4_Close
    .word       CustomScreen_1_5_ShowDescription
    .word       CustomScreen_1_6_NoMoreData

    .pool
    .word       gFrameCounter


_nt CustomScreenT2_1_1_ChipSelect
    push       {lr}
    ldr        r7,=PTR_CustomScreenT2_1_1_0_CheckChips_08016e50
    ldrb       r0,[r5,#0x2]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         CustomScreen_GetChipFromPosition
    bl         CustomScreen_GetChipDetailFromFolder
    bl         CustomScreen_LoadChipDetail
    bl         CustomScreen_LoadChipSelectCursor
    bl         dummy_167d0
    bl         CustomScreen_LoadUILower
    bl         CustomScreen_LoadSelectedChips
    bl         CustomScreen_AnimateLogo
    bl         CustomScreen_UpdateChipSelectPosition
    pop        {pc}

    .align 2, 0
    .pool
PTR_CustomScreenT2_1_1_0_CheckChips_08016e50:
    .word       CustomScreenT2_1_1_0_CheckChips
    .word       CustomScreenT2_1_1_1_WaitDialog
    
    
_nt CustomScreenT2_1_1_0_CheckChips
    push       {lr}
    bl         CustomScreen_CheckRToggle
    tst        r0,r0
    beq        LAB_08016e64
    pop        {pc}
LAB_08016e64:
    bl         CustomScreen_CheckCursorMove
    tst        r0,r0
    beq        LAB_08016e76
    mov        r0,#0x8
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strb       r0,[r5,#0x2]
    b          LAB_08016f16
LAB_08016e76:
    ldrh       r0,[r5,#0x38]
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_08016ed6
    bl         CustomScreen_GetSelectedChipOffset
    bl         CustomScreen_ValidateSelection
    tst        r0,r0
    beq        LAB_08016ec4
    ldrb       r2,[r5,#0xb]
    mov        r3,#0x15
    add        r3,r3,r2
    strb       r1,[r5,r3]
    bl         CustomScreen_GetSelectedChipOffset
    ldrb       r1,[r5,#0xb]
    mov        r2,#0x6
    add        r2,r2,r1
    strb       r0,[r5,r2]
    add        r1,#0x1
    strb       r1,[r5,#0xb]
    mov        r2,#0x40
    add        r2,r2,r0
    strb       r1,[r5,r2]
    push       {r0}
    mov        r0,#0x6a
    bl         Sound_PlaySongImmediate
    mov        r0,#0x1
    strb       r0,[r5,#0x1b]
    pop        {r0}
    bl         CustomScreen_GetSelectedChipOffset
    bl         CustomScreen_GetChipDetailFromFolder
    bl         CustomScreenT2_VerifySelection
    b          LAB_08016f16
LAB_08016ec4:
    ldrb       r1,[r5,#0x3]
    cmp        r1,#0x2
    bne        LAB_08016ed6
    mov        r0,#0x15
    @ "That's not WideSwrd"
    bl         Text_SetTextPointer_Tutorial2
    mov        r0,#0x4
    strb       r0,[r5,#0x2]
    b          LAB_08016f16
LAB_08016ed6:
    mov        r1,#0x2
    tst        r0,r1
    beq        LAB_08016f08
    bl         CustomScreenT2_CheckCancel
    tst        r0,r0
    bne        LAB_08016f16
    ldrb       r0,[r5,#0xb]
    tst        r0,r0
    beq        LAB_08016f16
    sub        r0,#0x1
    strb       r0,[r5,#0xb]
    mov        r1,#0x6
    add        r1,r1,r0
    ldrb       r2,[r5,r1]
    mov        r0,#0xff
    strb       r0,[r5,r1]
    mov        r0,#0x0
    mov        r3,#0x40
    add        r3,r3,r2
    strb       r0,[r5,r3]
    mov        r0,#0x6b
    bl         Sound_PlaySongImmediate
    b          LAB_08016f16
LAB_08016f08:
    mov        r1,#0x8
    tst        r0,r1
    beq        LAB_08016f16
    mov        r0,#0x8
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strb       r0,[r5,#0x2]
LAB_08016f16:
    pop        {pc}
   
   
_nt CustomScreenT2_1_1_1_WaitDialog
    push       {lr}
    bl         CustomScreen_DisableInput
    bl         Text_CheckIfDialogActive
    bne        LAB_08016f2c
    bl         CustomScreen_EnableInput
    mov        r0,#0x0
    strb       r0,[r5,#0x2]
LAB_08016f2c:
    pop        {pc}
    
    
_nt CustomScreenT2_1_2_Ok
    push       {lr}
    ldr        r7,=PTR_CustomScreenT2_1_2_0_CheckChips_08016f64
    ldrb       r0,[r5,#0x2]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    mov        r0,#0x0
    ldrb       r1,[r5,#0xb]
    tst        r1,r1
    beq        LAB_08016f44
    mov        r0,#0x1
LAB_08016f44:
    bl         CustomScreen_LoadAlternateArt
    bl         CustomScreen_DrawCursorOkButton
    bl         dummy_167d0
    bl         CustomScreen_LoadUILower
    bl         CustomScreen_LoadSelectedChips
    bl         CustomScreen_UpdateChipSelectPosition
    pop        {pc}

    .align 2, 0
    .pool
PTR_CustomScreenT2_1_2_0_CheckChips_08016f64:
    .word       CustomScreenT2_1_2_0_CheckChips
    .word       CustomScreenT2_1_2_1_Fail
    .word       CustomScreenT2_1_2_2_Success

_nt CustomScreenT2_1_2_0_CheckChips
    push       {lr}
    ldrh       r0,[r5,#0x38]
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_08016fca
    mov        r0,#0x6d
    bl         Sound_PlaySongImmediate
    bl         CustomScreenT2_OkButtonPressCheck
    tst        r0,r0
    bne        LAB_0801704a
    mov        r0,r10
    ldr        r0,[r0,#0xc]
    add        r0,#0x78
    mov        r1,#0x6
    mov        r2,#0xff
    bl         memset
    mov        r6,r10
    ldr        r6,[r6,#0xc]
    ldrb       r3,[r5,#0xb]
    strb       r3,[r6,#0x11]
    tst        r3,r3
    beq        LAB_08016fba
    add        r6,#0x78
    mov        r4,#0x6
    add        r4,r4,r5
LAB_08016fa8:
    ldrb       r0,[r4,#0x0]
    bl         CustomScreen_GetChipDetailFromDeck
    strb       r0,[r6,#0x0]
    strb       r1,[r6,#0x6]
    add        r6,#0x1
    add        r4,#0x1
    sub        r3,#0x1
    bne        LAB_08016fa8
LAB_08016fba:
    mov        r0,#0x20
    @ "We've sent the data. Time to test our strategy"
    bl         Text_SetTextPointer_Tutorial2
    mov        r0,#0x8
    strb       r0,[r5,#0x2]
    mov        r0,#0x0
    strb       r0,[r5,#0xf]
    pop        {pc}
LAB_08016fca:
    ldrh       r0,[r5,#0x3a]
    mov        r1,#0x22
    tst        r0,r1
    beq        LAB_08016ffc
    mov        r0,#0x5
LAB_08016fd4:
    sub        r0,#0x1
    bmi        LAB_0801704a
    push       {r0}
    ldrb       r1,[r5,#0x5]
    bl         CustomScreen_GetChipSelectIndex
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldrb       r1,[r7,#0x10]
    cmp        r0,r1
    bmi        LAB_08016fee
    mov        r0,#0xff
    b          LAB_08016ff2
LAB_08016fee:
    bl         CustomScreen_GetChipDetailFromDeck
LAB_08016ff2:
    cmp        r0,#0xff
    pop        {r0}
    beq        LAB_08016fd4
    strb       r0,[r5,#0x4]
    b          LAB_08017020
LAB_08016ffc:
    mov        r1,#0x10
    tst        r0,r1
    beq        LAB_08017030
    mov        r0,#0x1
    neg        r0,r0
LAB_08017006:
    add        r0,#0x1
    cmp        r0,#0x5
    beq        LAB_0801704a
    push       {r0}
    ldrb       r1,[r5,#0x5]
    bl         CustomScreen_GetChipSelectIndex
    bl         CustomScreen_GetChipDetailFromDeck
    cmp        r0,#0xff
    pop        {r0}
    beq        LAB_08017006
    strb       r0,[r5,#0x4]
LAB_08017020:
    mov        r0,#0x69
    bl         Sound_PlaySongImmediate
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strb       r0,[r5,#0x2]
    b          LAB_0801704a
LAB_08017030:
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0801704a
    ldrb       r0,[r5,#0xb]
    tst        r0,r0
    bne        LAB_0801704a
    mov        r0,#0x69
    bl         Sound_PlaySongImmediate
    mov        r0,#0xc
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strb       r0,[r5,#0x2]
LAB_0801704a:
    mov        r0,#0x0
    ldrb       r1,[r5,#0xb]
    tst        r1,r1
    beq        LAB_08017054
    mov        r0,#0x1
LAB_08017054:
    pop        {pc}
    
    
_nt CustomScreenT2_1_2_1_Fail
    push       {lr}
    bl         CustomScreen_DisableInput
    bl         Text_CheckIfDialogActive
    bne        LAB_0801706a
    bl         CustomScreen_EnableInput
    mov        r0,#0x0
    strb       r0,[r5,#0x2]
LAB_0801706a:
    mov        r0,#0x0
    pop        {pc}
    
    
_nt CustomScreenT2_1_2_2_Success
    push       {lr}
    bl         CustomScreen_DisableInput
    bl         Text_CheckIfDialogActive
    bne        LAB_08017086
    bl         CustomScreen_EnableInput
    mov        r0,#0x10
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strb       r0,[r5,#0x2]
LAB_08017086:
    mov        r0,#0x0
    pop        {pc}
    
    
_nt CustomScreenT2_1_3_Add
    push       {lr}
    ldr        r7,=PTR_CustomScreenT2_1_3_0_ShowMessage_080170b8
    ldrb       r0,[r5,#0x2]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    mov        r0,#0x2
    bl         CustomScreen_LoadAlternateArt
    bl         CustomScreen_DrawCursorAddButton
    bl         dummy_167d0
    bl         CustomScreen_LoadUILower
    bl         CustomScreen_LoadSelectedChips
    bl         CustomScreen_UpdateChipSelectPosition
    pop        {pc}

    .align 2, 0
    .pool
PTR_CustomScreenT2_1_3_0_ShowMessage_080170b8:
    .word       CustomScreenT2_1_3_0_ShowMessage
    .word       CustomScreenT2_1_3_1_Next
    
    
_nt CustomScreenT2_1_3_0_ShowMessage
    push       {lr}
    ldrh       r0,[r5,#0x38]
    mov        r1,#0x40
    tst        r0,r1
    beq        LAB_080170d4
    mov        r0,#0x8
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strb       r0,[r5,#0x2]
    b          LAB_080170ec
LAB_080170d4:
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_080170ec
    @ "Don't need to use this yet."
    mov        r0,#0xe
    ldrb       r1,[r5,#0x3]
    cmp        r1,#0x2
    bne        LAB_080170e4
    @ "Don't need to use this yet."
    mov        r0,#0x18
LAB_080170e4:
    bl         Text_SetTextPointer_Tutorial2
    mov        r0,#0x4
    strb       r0,[r5,#0x2]
LAB_080170ec:
    pop        {pc}
   
   
_nt CustomScreenT2_1_3_1_Next
    push       {lr}
    bl         CustomScreen_DisableInput
    bl         Text_CheckIfDialogActive
    bne        LAB_08017102
    mov        r0,#0x0
    strb       r0,[r5,#0x2]
    bl         CustomScreen_EnableInput
LAB_08017102:
    pop        {pc}
    
    
_nt CustomScreenT2_VerifySelection
    push       {r0,lr}
    ldr        r7,=PTR_CustomScreenT2_1_1_0_0_CheckIfStealSelected
    ldrb       r1,[r5,#0x3]
    lsl        r1,r1,#0x2
    ldr        r7,[r7,r1]
    mov        lr,pc
    bx         r7
    pop        {r0,pc}

    .align 2, 0
PTR_CustomScreenT2_1_1_0_0_CheckIfStealSelected:
    .word       CustomScreenT2_1_1_0_0_CheckIfStealSelected
    .word       dummy_1715a
    .word       CustomScreenT2_1_1_0_1_PromptPressOk
    .word       CustomScreenT2_1_1_0_2_Next
    .pool
    
    
_nt CustomScreenT2_1_1_0_0_CheckIfStealSelected
    push       {lr}
    cmp        r0,#0x4c
    bne        LAB_0801713a
    mov        r0,#0x14
    @ Chose Steal first -> "OK - Choose WideSword next"
    bl         Text_SetTextPointer_Tutorial2
    mov        r0,#0x2
    strb       r0,[r5,#0x3]
    b          LAB_08017154
LAB_0801713a:
    cmp        r0,#0x5
    bne        LAB_0801714a
    mov        r0,#0xb
    @ Chose WideSwrd first -> "Choose Steal first"
    bl         Text_SetTextPointer_Tutorial2
    mov        r0,#0x3
    strb       r0,[r5,#0x3]
    b          LAB_08017154
LAB_0801714a:
    mov        r0,#0xc
    @ Chose any other chip first -> "Choose Steal first"
    bl         Text_SetTextPointer_Tutorial2
    mov        r0,#0x1
    strb       r0,[r5,#0x3]
LAB_08017154:
    mov        r0,#0x4
    strb       r0,[r5,#0x2]
    pop        {pc}
    
    
_nt dummy_1715a
    push       {lr}
    pop        {pc}
    
    
_nt CustomScreenT2_1_1_0_1_PromptPressOk
    push       {lr}
    mov        r0,#0x1e
    @ "OK, let's send data to the navi - choose OK"
    bl         Text_SetTextPointer_Tutorial2
    mov        r0,#0x4
    strb       r0,[r5,#0x2]
    mov        r0,#0x5
    strb       r0,[r5,#0x3]
    pop        {pc}
    
    
_nt CustomScreenT2_1_1_0_2_Next
    push       {lr}
    mov        r0,#0x4
    strb       r0,[r5,#0x3]
    pop        {pc}
    
    
_nt dummy_17178
    push       {lr}
    pop        {pc}
   
   
_nt dummy_1717c
    push       {lr}
    pop        {pc}
    
    
_nt CustomScreenT2_CheckCancel
    push       {lr}
    ldr        r7,=PTR_CustomScreenT2_1_1_0_0_Next_08017190
    ldrb       r1,[r5,#0x3]
    lsl        r1,r1,#0x2
    ldr        r7,[r7,r1]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0
PTR_CustomScreenT2_1_1_0_0_Next_08017190:
    .word       CustomScreenT2_1_1_0_0_Next
    .word       CustomScreenT2_1_1_0_1_Next
    .word       CustomScreenT2_1_1_0_2_DontCancel
    .word       CustomScreenT2_1_1_0_3_Next
    .word       CustomScreenT2_1_1_0_4_Next
    .word       CustomScreenT2_1_1_0_5_DontCancel
    .pool
    .align 2, 0
    
    
_nt CustomScreenT2_1_1_0_0_Next
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#0x3]
    mov        r0,#0x0
    pop        {pc}
    
    
_nt CustomScreenT2_1_1_0_1_Next
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#0x3]
    mov        r0,#0x0
    mov        r0,#0x0
    pop        {pc}
    
    
_nt CustomScreenT2_1_1_0_2_DontCancel
    push       {lr}
    mov        r0,#0x16
    @ "Don't cancel - select WideSwrd"
    bl         Text_SetTextPointer_Tutorial2
    mov        r0,#0x4
    strb       r0,[r5,#0x2]
    mov        r0,#0x1
    pop        {pc}
    
    
_nt CustomScreenT2_1_1_0_3_Next
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#0x3]
    mov        r0,#0x0
    pop        {pc}
    
    
_nt CustomScreenT2_1_1_0_4_Next
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#0x3]
    mov        r0,#0x0
    pop        {pc}
    
    
_nt CustomScreenT2_1_1_0_5_DontCancel
    push       {lr}
    mov        r0,#0x1f
    @ "Don't worry - don't cancel now"
    bl         Text_SetTextPointer_Tutorial2
    mov        r0,#0x4
    strb       r0,[r5,#0x2]
    mov        r0,#0x1
    pop        {pc}
    
    
_nt CustomScreenT2_OkButtonPressCheck
    push       {lr}
    ldr        r7,=PTR_CustomScreenT2_1_2_0_0_ChooseStealFirst
    ldrb       r1,[r5,#0x3]
    lsl        r1,r1,#0x2
    ldr        r7,[r7,r1]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0
PTR_CustomScreenT2_1_2_0_0_ChooseStealFirst:
    .word       CustomScreenT2_1_2_0_0_ChooseStealFirst
    .word       CustomScreenT2_1_2_0_1_ChooseStealFirst
    .word       CustomScreenT2_1_2_0_2_SelectWideSwrd
    .word       CustomScreenT2_1_2_0_3_ChooseStealFirst
    .word       CustomScreenT2_1_2_0_4_WrongOrder
    .word       CustomScreenT2_1_2_0_5_DontCancelNow
    .pool
    
    
_nt CustomScreenT2_1_2_0_0_ChooseStealFirst
    push       {lr}
    mov        r0,#0xd
    @ "Choose Steal first"
    bl         Text_SetTextPointer_Tutorial2
    mov        r0,#0x4
    strb       r0,[r5,#0x2]
    mov        r0,#0x1
    pop        {pc}
    
    
_nt CustomScreenT2_1_2_0_1_ChooseStealFirst
    push       {lr}
    mov        r0,#0xd
    @ "Choose Steal first"
    bl         Text_SetTextPointer_Tutorial2
    mov        r0,#0x4
    strb       r0,[r5,#0x2]
    mov        r0,#0x1
    pop        {pc}
    
    
_nt CustomScreenT2_1_2_0_2_SelectWideSwrd
    push       {lr}
    mov        r0,#0x17
    @ "Send WideSwrd data too"
    bl         Text_SetTextPointer_Tutorial2
    mov        r0,#0x4
    strb       r0,[r5,#0x2]
    mov        r0,#0x1
    pop        {pc}
    
    
_nt CustomScreenT2_1_2_0_3_ChooseStealFirst
    push       {lr}
    mov        r0,#0xd
    @ "Choose Steal first"
    bl         Text_SetTextPointer_Tutorial2
    mov        r0,#0x4
    strb       r0,[r5,#0x2]
    mov        r0,#0x1
    pop        {pc}
    
    
_nt CustomScreenT2_1_2_0_4_WrongOrder
    push       {lr}
    mov        r0,#0xf
    @ "Wrong order"
    bl         Text_SetTextPointer_Tutorial2
    mov        r0,#0x4
    strb       r0,[r5,#0x2]
    mov        r0,#0x1
    pop        {pc}
    
    
_nt CustomScreenT2_1_2_0_5_DontCancelNow
    push       {lr}
    mov        r0,#0x1f
    @ "Don't cancel now"
    bl         Text_SetTextPointer_Tutorial2
    mov        r0,#0x4
    strb       r0,[r5,#0x2]
    mov        r0,#0x0
    pop        {pc}
