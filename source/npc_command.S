#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set FUN_080823de_StopScript, 0x80823DE
    .set FUN_08082556_GetInt, 0x8082556
    .set FUN_0808254c_GetShort, 0x808254C

    .text

    .thumb

_ts NPC_InterpretCommands
    push       { lr }
LAB_08082106:
    ldrb       r0,[r5,#0x19]
    tst        r0,r0
    bne        LAB_0808211e
    ldr        r6,[r5,#0x50]
    ldrb       r0,[r6,#0x0]
    lsl        r0,r0,#0x2
    ldr        r7,PTR_PTR_NPC_Command_00_Stop_1_08082120
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    str        r6,[r5,#0x50]
    b          LAB_08082106
LAB_0808211e:
    pop        { pc }
PTR_PTR_NPC_Command_00_Stop_1_08082120: .word PTR_NPC_Command_00_Stop_1_08082124

PTR_NPC_Command_00_Stop_1_08082124:
    .word NPC_Command_00_Stop+1
    .word 0
    .word NPC_Command_02_Jump+1
    .word NPC_Command_03_Destroy+1
    .word NPC_Command_04_JumpIfFlag+1
    .word NPC_Command_05_JumpIfNotFlag+1
    .word NPC_Command_06_SetFlag+1
    .word NPC_Command_07_ClearFlag+1
    .word NPC_Command_08_Init+1
    .word FUN_0808223c+1
    .word FUN_08082244_0A+1
    .word FUN_0808224c+1
    .word NPC_Command_0C_SetPosition+1
    .word FUN_0808226a+1
    .word FUN_08082278+1
    .word NPC_Command_0F_SetPalette+1
    .word NPC_Command_10_Wait+1
    .word FUN_080822a4+1
    .word FUN_080822be+1
    .word FUN_080822cc_13+1
    .word NPC_Command_14_SetPositionFull+1
    .word FUN_080822fc+1
    .word NPC_Command_16_SetSpriteFrame+1
    .word NPC_Command_17_SetSprite+1
    .word NPC_Command_18_SetAreaDialogue+1
    .word NPC_Command_19_SetPriority0+1
    .word NPC_Command_1A_SetPriority1+1
    .word NPC_Command_1B_SetPriority2+1
    .word FUN_0808234a+1
    .word FUN_08082358_1D+1
    .word FUN_0808236c+1
    .word FUN_08082384+1
    .word FUN_08082390+1
    .word FUN_0808239e+1
    .word FUN_080823a8+1
    .word FUN_080823b2+1
    .word NPC_Command_24_SetSpriteLong+1


NPC_Command_00_Stop:
    push       { lr }
    bl         FUN_080823de_StopScript
    pop        { pc }

NPC_Command_02_Jump:
    push       { lr }
    add        r0,r6,#0x1
    bl         FUN_08082556_GetInt
    add        r6,r0,#0x0
    pop        { pc }

NPC_Command_03_Destroy:
    push       { lr }
    mov        r0,#0x1
    strb       r0,[r5,#0x0]
    bl         NPC_Free
    bl         FUN_080823de_StopScript
    pop        { pc }

NPC_Command_04_JumpIfFlag:
    push       { lr }
    add        r0,r6,#0x1
    bl         FUN_0808254c_GetShort
    bl         Flag_GetBase
    beq        LAB_080821f4
    add        r0,r6,#0x3
    bl         FUN_08082556_GetInt
    add        r6,r0,#0x0
    pop        { pc }
LAB_080821f4:
    add        r6,#0x7
    pop        { pc }

NPC_Command_05_JumpIfNotFlag:
    push       { lr }
    add        r0,r6,#0x1
    bl         FUN_0808254c_GetShort
    bl         Flag_GetBase
    bne        LAB_08082210
    add        r0,r6,#0x3
    bl         FUN_08082556_GetInt
    add        r6,r0,#0x0
    pop        { pc }
LAB_08082210:
    add        r6,#0x7
    pop        { pc }

NPC_Command_06_SetFlag:
    push       { lr }
    add        r0,r6,#0x1
    bl         FUN_0808254c_GetShort
    bl         Flag_SetBase
    add        r6,#0x3
    pop        { pc }

NPC_Command_07_ClearFlag:
    push       { lr }
    add        r0,r6,#0x1
    bl         FUN_0808254c_GetShort
    bl         Flag_ClearBase
    add        r6,#0x3
    pop        { pc }

NPC_Command_08_Init:
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    add        r6,#0x1
    mov        pc,lr

FUN_0808223c:
    mov        r0,#0x1
    strb       r0,[r5,#0x0]
    add        r6,#0x1
    mov        pc,lr

FUN_08082244_0A:
    ldrb       r0,[r6,#0x1]
    strb       r0,[r5,#0xc]
    add        r6,#0x2
    mov        pc,lr

FUN_0808224c:
    ldrb       r0,[r6,#0x1]
    strb       r0,[r5,#0xd]
    add        r6,#0x2
    mov        pc,lr

NPC_Command_0C_SetPosition:
    mov        r1,#0x1
    ldrsb      r0,[r6,r1]
    strb       r0,[r5,#0x11]
    mov        r1,#0x2
    ldrsb      r0,[r6,r1]
    strb       r0,[r5,#0x12]
    mov        r1,#0x3
    ldrsb      r0,[r6,r1]
    strb       r0,[r5,#0x13]
    add        r6,#0x4
    mov        pc,lr

FUN_0808226a:
    mov        r0,#0x1
    mvn        r0,r0
    ldr        r1,[r5,#0x5c]
    and        r1,r0
    str        r1,[r5,#0x5c]
    add        r6,#0x1
    mov        pc,lr

FUN_08082278:
    mov        r0,#0x1
    ldr        r1,[r5,#0x5c]
    orr        r1,r0
    str        r1,[r5,#0x5c]
    add        r6,#0x1
    mov        pc,lr

NPC_Command_0F_SetPalette:
    push       { lr }
    ldrb       r0,[r6,#0x1]
    strb       r0,[r5,#0x16]
    add        r6,#0x2
    pop        { pc }

NPC_Command_10_Wait:
    push       { lr }
    mov        r0,#0x0
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    ldrb       r0,[r6,#0x1]
    strh       r0,[r5,#0x20]
    bl         FUN_080823de_StopScript
    add        r6,#0x2
    pop        { pc }

FUN_080822a4:
    push       { lr }
    ldrb       r0,[r6,#0x1]
    strb       r0,[r5,#0x4]
    ldrb       r0,[r6,#0x2]
    strb       r0,[r5,#0x5]
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    bl         FUN_080823de_StopScript
    add        r6,#0x3
    pop        { pc }

FUN_080822be:
    mov        r0,#0x2
    mvn        r0,r0
    ldr        r1,[r5,#0x5c]
    and        r1,r0
    str        r1,[r5,#0x5c]
    add        r6,#0x1
    mov        pc,lr

FUN_080822cc_13:
    mov        r0,#0x2
    ldr        r1,[r5,#0x5c]
    orr        r1,r0
    str        r1,[r5,#0x5c]
    add        r6,#0x1
    mov        pc,lr

NPC_Command_14_SetPositionFull:
    push       { lr }
    add        r0,r6,#0x1
    bl         FUN_0808254c_GetShort
    lsl        r0,r0,#0x10
    str        r0,[r5,#0x24]
    add        r0,r6,#0x3
    bl         FUN_0808254c_GetShort
    lsl        r0,r0,#0x10
    str        r0,[r5,#0x28]
    add        r0,r6,#0x5
    bl         FUN_0808254c_GetShort
    lsl        r0,r0,#0x10
    str        r0,[r5,#0x2c]
    add        r6,#0x7
    pop        { pc }

FUN_080822fc:
    push       { lr }
    ldrb       r2,[r6,#0x1]
    strb       r2,[r5,#0xe]
    ldrb       r2,[r6,#0x2]
    strb       r2,[r5,#0x4]
    ldrb       r2,[r6,#0x3]
    strb       r2,[r5,#0x5]
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    bl         FUN_080823de_StopScript
    add        r6,#0x4
    pop        { pc }

NPC_Command_16_SetSpriteFrame:
    ldrb       r0,[r6,#0x1]
    strb       r0,[r5,#0x14]
    add        r6,#0x2
    mov        pc,lr

NPC_Command_17_SetSprite:
    ldrb       r0,[r6,#0x1]
    strh       r0,[r5,#0x3c]
    add        r6,#0x2
    mov        pc,lr

NPC_Command_18_SetAreaDialogue:
    ldrb       r0,[r6,#0x1]
    strb       r0,[r5,#0x1c]
    add        r6,#0x2
    mov        pc,lr

NPC_Command_19_SetPriority0:
    mov        r0,#0x0
    str        r0,[r5,#0x60]
    add        r6,#0x1
    mov        pc,lr

NPC_Command_1A_SetPriority1:
    mov        r0,#0x1
    str        r0,[r5,#0x60]
    add        r6,#0x1
    mov        pc,lr

NPC_Command_1B_SetPriority2:
    mov        r0,#0x2
    str        r0,[r5,#0x60]
    add        r6,#0x1
    mov        pc,lr

FUN_0808234a:
    push       { lr }
    add        r0,r6,#0x1
    bl         FUN_08082556_GetInt
    str        r0,[r5,#0x64]
    add        r6,#0x5
    pop        { pc }

FUN_08082358_1D:
    push       { lr }
    ldrb       r0,[r6,#0x1]
    mov        r1,#0x80
    lsl        r1,r1,#0x18
    lsr        r1,r0
    ldr        r0,[r5,#0x64]
    orr        r0,r1
    str        r0,[r5,#0x64]
    add        r6,#0x2
    pop        { pc }

FUN_0808236c:
    push       { lr }
    ldrb       r0,[r6,#0x1]
    ldrb       r0,[r6,#0x1]
    mov        r1,#0x80
    lsl        r1,r1,#0x18
    lsr        r1,r0
    mvn        r1,r1
    ldr        r0,[r5,#0x64]
    and        r0,r1
    str        r0,[r5,#0x64]
    add        r6,#0x2
    pop        { pc }

FUN_08082384:
    mov        r0,#0x4
    ldr        r1,[r5,#0x5c]
    orr        r1,r0
    str        r1,[r5,#0x5c]
    add        r6,#0x1
    mov        pc,lr

FUN_08082390:
    mov        r0,#0x4
    mvn        r0,r0
    ldr        r1,[r5,#0x5c]
    and        r1,r0
    str        r1,[r5,#0x5c]
    add        r6,#0x1
    mov        pc,lr

FUN_0808239e:
    push       { lr }
    bl         SpritePtr_NoZClip
    add        r6,#0x1
    pop        { pc }

FUN_080823a8:
    push       { lr }
    bl         SpritePtr_SetZClip
    add        r6,#0x1
    pop        { pc }

FUN_080823b2:
    push       { lr }
    bl         SpritePtr_Flag_ClearZClip
    add        r6,#0x1
    pop        { pc }

NPC_Command_24_SetSpriteLong:
    push       { lr }
    add        r0,r6,#0x1
    bl         FUN_0808254c_GetShort
    strh       r0,[r5,#0x3c]
    add        r6,#0x3
    pop        { pc }

    push       { lr }

.end
