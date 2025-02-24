    .macro SD_LoadMessage
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Load
    pop        {r5}
    .endm

    .macro SD_ShowMessage
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Main
    pop        {r5}
    .endm

    .macro SD_HideMessage
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Disable
    pop        {r5}
    .endm

    .macro SD_ClearChipAndNext_A
    push       {r5}
    bl         BattleUi_ClearActiveChip
    pop        {r5}
    mov        r0,#0x4
    str        r0,[r5,#0x0]
    .endm

    .macro SD_ClearChipAndNext_B
    push       {r5}
    bl         BattleUi_ClearActiveChip
    pop        {r5}
    mov        r0,#0x4
    strb       r0,[r5,#0x0]
    .endm

    .macro SD_SetTimer time
    mov        r0,#\time
    strh       r0,[r5,#0x8]
    .endm

    .macro SD_SetTimer_B time
    mov        r0,#\time
    strb       r0,[r5,#0x8]
    .endm

    .macro SD_DecreaseTimer
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    .endm
