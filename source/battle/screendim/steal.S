#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_Steal
    push       {lr}
    ldr        r7,PTR_PTR_SD_Steal_0_0809858c
    ldrb       r0,[r5,#ScreenDim_state_s0]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_SD_Steal_0_0809858c:
    .word PTR_SD_Steal_0_08098590

PTR_SD_Steal_0_08098590:
    .word SD_Steal_0
    .word SD_Steal_1
    .word SD_Steal_2
    .word SD_Steal_3


_ts SD_Steal_0
    push       {lr}
    FadeOut_ScreenDim
    SD_SetTimer 0x1e
    mov        r1,#CD_Steal
    SD_LoadMessage
    SD_ClearChipAndNext_A
    pop        {pc}


_nt SD_Steal_1
    push       {lr}
    SD_ShowMessage
    tst        r0,r0
    bne        LAB_08098656
    SD_HideMessage
    SD_DecreaseTimer
    bne        LAB_08098656
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldrb       r0,[r5,#ScreenDim_owner]
    lsl        r3,r0,#0x2
    ldr        r7,PTR_PanelFlag_ARRAY_08098658
    ldr        r1,[r7,r3]
    ldr        r7,PTR_PanelFlag_ARRAY_0809865c
    ldr        r2,[r7,r3]
    bl         Field_GetFirstPanelForward
    tst        r0,r0
    beq        LAB_0809864e
    ldrb       r2,[r5,#ScreenDim_owner]
    mov        r6,#0xa
    mov        r1,#0x1
    mov        r4,#0x0
    bl         Attack_Steal_Create
    tst        r7,r7
    beq        LAB_0809864e
    ldrb       r3,[r7,#0x0]
    mov        r4,#0x4
    orr        r3,r4
    strb       r3,[r7,#0x0]
    mov        r1,#0x2
    mov        r4,#0x1
    bl         Attack_Steal_Create
    tst        r7,r7
    beq        LAB_0809864e
    ldrb       r3,[r7,#0x0]
    mov        r4,#0x4
    orr        r3,r4
    strb       r3,[r7,#0x0]
    mov        r1,#0x3
    mov        r4,#0x1
    bl         Attack_Steal_Create
    tst        r7,r7
    beq        LAB_0809864e
    ldrb       r3,[r7,#0x0]
    mov        r4,#0x4
    orr        r3,r4
    strb       r3,[r7,#0x0]
LAB_0809864e:
    SD_SetTimer 0x3c
    mov        r0,#0x8
    str        r0,[r5,#ScreenDim_state_s0]
LAB_08098656:
    pop        {pc}

PTR_PanelFlag_ARRAY_08098658:
    .word PanelFlag_ARRAY_08098660

PTR_PanelFlag_ARRAY_0809865c:
    .word PanelFlag_ARRAY_08098668

PanelFlag_ARRAY_08098660:
    .word PF_EnemyTerritory
    .word 0

PanelFlag_ARRAY_08098668:
    .word 0
    .word PF_EnemyTerritory


_ts SD_Steal_2
    push       {lr}
    SD_DecreaseTimer
    bne        LAB_0809868a
    FadeIn_ScreenDim
    mov        r0,#0xc
    str        r0,[r5,#ScreenDim_state_s0]
LAB_0809868a:
    pop        {pc}


_ts SD_Steal_3
    push       {lr}
    LoadMain fade, r0, r7
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080986a6
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_080986a6:
    pop        {pc}
