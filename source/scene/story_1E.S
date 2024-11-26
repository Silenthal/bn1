#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


BYTE_ARRAY_08088238:
    .byte 0x11
    .byte 0x12

Flag_Base_ARRAY_0808823a:
    .byte FLAG_CLEAR_CHAPTER_1
    .byte FLAG_CLEAR_CHAPTER_1

    cam_end

    .align 2, 0


_ts Scene_Story_1E
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_1E_0_08088358
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_1E_0_0808824c:
    .word S_Story_1E_0
    .word S_Story_1E_1
    .word S_Story_1E_2
    .word S_Story_1E_3


_ts S_Story_1E_0
    push       {r5}
    bl         Flag_SetPlayerInactive
    bl         PlayerAnimation_Lock
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_Story_1E_1
    bl         PlayerAnimation_GetState
    cmp        r0,#0x2
    bne        LAB_080882e6
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080882e6
    push       {r5}
    mov        r0,#0x45
    mov        r1,#0xb
    mov        r2,#0x1
    bl         Inventory_SubtractChip
    pop        {r5}
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrb       r7,[r7,#0x10]
    cmp        r7,#0x0
    beq        LAB_080882bc
    mov        r0,#0x92
    bl         Flag_ClearBase
    mov        r0,#0x2b
    bl         Flag_ClearBase
    ldr        r6,PTR_BYTE_ARRAY_0808835c
    ldrb       r0,[r5,#0x4]
    lsl        r0,r0,#0x2
    add        r6,r6,r0
    push       {r5}
    ldrb       r0,[r6,#0x1]
    bl         Text_LoadAreaDialogue
    pop        {r5}
    b          LAB_080882e0
LAB_080882bc:
    push       {r5}
    ldr        r0,PTR_ScenarioData_1E_08088360
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    mov        r0,#0x45
    bl         Flag_SetBase
    mov        r0,#0x30
    mov        r1,#0x1
    bl         KeyItem_AddAmount
    mov        r0,#0xa3
    mov        r1,#0x6
    mov        r2,#0x1
    bl         Inventory_AddChip
LAB_080882e0:
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080882e6:
    pop        {pc}


_ts S_Story_1E_2
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_080882fa
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080882fa:
    bl         Scene_IsStartPressed
    beq        LAB_08088304
    bl         S_Story_1E_SkipIfStart
LAB_08088304:
    pop        {pc}


_nt S_Story_1E_3
    push       {r5}
    ldr        r6,PTR_BYTE_ARRAY_08088364
    ldrb       r0,[r5,#0x4]
    lsl        r0,r0,#0x2
    add        r6,r6,r0
    ldrb       r0,[r6,#0x2]
    tst        r0,r0
    beq        LAB_0808831e
    push       {r6}
    bl         Flag_SetBase
    pop        {r6}
LAB_0808831e:
    ldrb       r0,[r6,#0x3]
    tst        r0,r0
    beq        LAB_08088328
    bl         Flag_ClearBase
LAB_08088328:
    bl         Text_DisableDialogue
    bl         PlayerAnimation_Unlock
    bl         Flag_SetPlayerActive
    pop        {r5}
    mov        r0,#0x2
    bl         Sound_ChangeSong
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}


_nt S_Story_1E_SkipIfStart
    push       {r5}
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x7
    bl         PlayerAnimation_SetState
    mov        r0,#0xc
    strb       r0,[r5,#0x0]
    pop        {pc}

PTR_PTR_S_Story_1E_0_08088358:
    .word PTR_S_Story_1E_0_0808824c

PTR_BYTE_ARRAY_0808835c:
    .word BYTE_ARRAY_08088238

PTR_ScenarioData_1E_08088360:
    .word ScenarioData_1E

PTR_BYTE_ARRAY_08088364:
    .word BYTE_ARRAY_08088238
