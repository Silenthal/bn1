#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts umul3232H32
    adr        r2,__umul3232H32
    bx         r2

    .arm
__umul3232H32:
    umull      r2,r3,r0,r1
    add        r0,r3,#0x0
    bx         lr


_ts SoundMain
    ldr        r0,PTR_ptrSoundInfo_0809bfc4
    ldr        r0,[r0,#0x0]
    ldr        r2,soundMagic_9bfc8
    ldr        r3,[r0,#0x0]
    cmp        r2,r3
    beq        SoundMain_1
    bx         lr

    .align 2, 0


PTR_ptrSoundInfo_0809bfc4:
    .word 0x3007FF0

soundMagic_9bfc8:
    .word 0x68736D53
SoundMain_1:
    add        r3,#0x1
    str        r3,[r0,#0x0]
    push       {r4,r5,r6,r7,lr}
    mov        r1,r8
    mov        r2,r9
    mov        r3,r10
    mov        r4,r11
    push       {r0,r1,r2,r3,r4}
    sub        sp,#0x18
    ldrb       r1,[r0,#0xc]
    cmp        r1,#0x0
    beq        SoundMain_3
    ldr        r2,PTR_REG_VCOUNT_0809c0dc
    ldrb       r2,[r2,#0x0]
    cmp        r2,#0xa0
    bcs        SoundMain_2
    add        r2,#0xe4
SoundMain_2:
    add        r1,r1,r2
SoundMain_3:
    str        r1,[sp,#0x14]
    ldr        r3,[r0,#0x20]
    cmp        r3,#0x0
    beq        SoundMain_4
    ldr        r0,[r0,#0x24]
    bl         Call_R3_9c32e
    ldr        r0,[sp,#0x18]
SoundMain_4:
    ldr        r3,[r0,#0x28]
    bl         Call_R3_9c32e
    ldr        r0,[sp,#0x18]
    ldr        r3,[r0,#0x10]
    mov        r8,r3
    ldr        r5,DAT_0809c334
    add        r5,r5,r0
    ldrb       r4,[r0,#0x4]
    sub        r7,r4,#0x1
    bls        SoundMain_5
    ldrb       r1,[r0,#0xb]
    sub        r1,r1,r7
    mov        r2,r8
    mul        r2,r1
    add        r5,r5,r2
SoundMain_5:
    str        r5,[sp,#0x8]
    ldr        r6,lt_PCM_DMA_BUF_SIZE
SoundMainRAM:
    ldrb       r3,[r0,#0x5]
    cmp        r3,#0x0
    beq        LAB_0809c084
    adr        r1,SoundMainRAM_Reverb
    bx         r1

    .align 2, 0

    .arm

SoundMainRAM_Reverb:
    cmp        r4,#0x2
    addeq      r7,r0,#0x350
    addne      r7,r5,r8
    mov        r4,r8
LAB_0809c040:
    ldrsb      r0,[r5,r6]
    ldrsb      r1,[r5,#0x0]
    add        r0,r0,r1
    ldrsb      r1,[r7,r6]
    add        r0,r0,r1
    ldrsb      r1,[r7],#0x1
    add        r0,r0,r1
    mul        r1,r0,r3
    mov        r0,r1,asr #0x9
    tst        r0,#0x80
    addne      r0,r0,#0x1
    strb       r0,[r5,r6]
    strb       r0,[r5],#0x1
    subs       r4,r4,#0x1
    bgt        LAB_0809c040
    adr        r0,FUN_0809c0b2+1
    bx         r0

.thumb
LAB_0809c084:
    mov        r0,#0x0
    mov        r1,r8
    add        r6,r6,r5
    lsr        r1,r1,#0x3
    bcc        LAB_0809c092
    stmia      r5!,{r0}
    stmia      r6!,{r0}
LAB_0809c092:
    lsr        r1,r1,#0x1
    bcc        LAB_0809c09e
    stmia      r5!,{r0}
    stmia      r6!,{r0}
    stmia      r5!,{r0}
    stmia      r6!,{r0}
LAB_0809c09e:
    stmia      r5!,{r0}
    stmia      r6!,{r0}
    stmia      r5!,{r0}
    stmia      r6!,{r0}
    stmia      r5!,{r0}
    stmia      r6!,{r0}
    stmia      r5!,{r0}
    stmia      r6!,{r0}
    sub        r1,#0x1
    bgt        LAB_0809c09e


_nt FUN_0809c0b2
    ldr        r4,[sp,#0x18]
    ldr        r0,[r4,#0x14]
    mov        r9,r0
    ldr        r0,[r4,#0x18]
    mov        r12,r0
    ldrb       r0,[r4,#0x6]
    add        r4,#0x50
LAB_0809c0c0:
    str        r0,[sp,#0x4]
    ldr        r3,[r4,#0x24]
    ldr        r0,[sp,#0x14]
    cmp        r0,#0x0
    beq        LAB_0809c0e0
    ldr        r1,PTR_REG_VCOUNT_0809c0dc
    ldrb       r1,[r1,#0x0]
    cmp        r1,#0xa0
    bcs        LAB_0809c0d4
    add        r1,#0xe4
LAB_0809c0d4:
    cmp        r1,r0
    bcc        LAB_0809c0e0
    b          LAB_0809c31a

    .align 2, 0


PTR_REG_VCOUNT_0809c0dc:
    .word REG_VCOUNT
LAB_0809c0e0:
    ldrb       r6,[r4,#0x0]
    mov        r0,#0xc7
    tst        r0,r6
    bne        LAB_0809c0ea
    b          LAB_0809c310
LAB_0809c0ea:
    mov        r0,#0x80
    tst        r0,r6
    beq        LAB_0809c11a
    mov        r0,#0x40
    tst        r0,r6
    bne        LAB_0809c12a
    mov        r6,#0x3
    strb       r6,[r4,#0x0]
    add        r0,r3,#0x0
    add        r0,#0x10
    str        r0,[r4,#0x28]
    ldr        r0,[r3,#0xc]
    str        r0,[r4,#0x18]
    mov        r5,#0x0
    strb       r5,[r4,#0x9]
    str        r5,[r4,#0x1c]
    ldrb       r2,[r3,#0x3]
    mov        r0,#0xc0
    tst        r0,r2
    beq        LAB_0809c172
    mov        r0,#0x10
    orr        r6,r0
    strb       r6,[r4,#0x0]
    b          LAB_0809c172
LAB_0809c11a:
    ldrb       r5,[r4,#0x9]
    mov        r0,#0x4
    tst        r0,r6
    beq        LAB_0809c130
    ldrb       r0,[r4,#0xd]
    sub        r0,#0x1
    strb       r0,[r4,#0xd]
    bhi        LAB_0809c180
LAB_0809c12a:
    mov        r0,#0x0
    strb       r0,[r4,#0x0]
    b          LAB_0809c310
LAB_0809c130:
    mov        r0,#0x40
    tst        r0,r6
    beq        LAB_0809c150
    ldrb       r0,[r4,#0x7]
    mul        r5,r0
    lsr        r5,r5,#0x8
    ldrb       r0,[r4,#0xc]
    cmp        r5,r0
    bhi        LAB_0809c180
LAB_0809c142:
    ldrb       r5,[r4,#0xc]
    cmp        r5,#0x0
    beq        LAB_0809c12a
    mov        r0,#0x4
    orr        r6,r0
    strb       r6,[r4,#0x0]
    b          LAB_0809c180
LAB_0809c150:
    mov        r2,#0x3
    and        r2,r6
    cmp        r2,#0x2
    bne        LAB_0809c16e
    ldrb       r0,[r4,#0x5]
    mul        r5,r0
    lsr        r5,r5,#0x8
    ldrb       r0,[r4,#0x6]
    cmp        r5,r0
    bhi        LAB_0809c180
    add        r5,r0,#0x0
    beq        LAB_0809c142
    sub        r6,#0x1
    strb       r6,[r4,#0x0]
    b          LAB_0809c180
LAB_0809c16e:
    cmp        r2,#0x3
    bne        LAB_0809c180
LAB_0809c172:
    ldrb       r0,[r4,#0x4]
    add        r5,r5,r0
    cmp        r5,#0xff
    bcc        LAB_0809c180
    mov        r5,#0xff
    sub        r6,#0x1
    strb       r6,[r4,#0x0]
LAB_0809c180:
    strb       r5,[r4,#0x9]
    ldr        r0,[sp,#0x18]
    ldrb       r0,[r0,#0x7]
    add        r0,#0x1
    mul        r0,r5
    lsr        r5,r0,#0x4
    ldrb       r0,[r4,#0x2]
    mul        r0,r5
    lsr        r0,r0,#0x8
    strb       r0,[r4,#0xa]
    ldrb       r0,[r4,#0x3]
    mul        r0,r5
    lsr        r0,r0,#0x8
    strb       r0,[r4,#0xb]
    mov        r0,#0x10
    and        r0,r6
    str        r0,[sp,#0x10]
    beq        LAB_0809c1b4
    add        r0,r3,#0x0
    add        r0,#0x10
    ldr        r1,[r3,#0x8]
    add        r0,r0,r1
    str        r0,[sp,#0xc]
    ldr        r0,[r3,#0xc]
    sub        r0,r0,r1
    str        r0,[sp,#0x10]
LAB_0809c1b4:
    ldr        r5,[sp,#0x8]
    ldr        r2,[r4,#0x18]
    ldr        r3,[r4,#0x28]
    adr        r0,LAB_0809c1c0
    bx         r0

    .align 2, 0

    .arm

LAB_0809c1c0:
    str        r8,[sp,#0x0]
    ldrb       r10,[r4,#0xa]
    ldrb       r11,[r4,#0xb]
    ldrb       r0,[r4,#0x1]
    tst        r0,#0x8
    beq        LAB_0809c228
LAB_0809c1d8:
    ldrsb      r6,[r3],#0x1
    mul        r1,r6,r11
    ldrb       r0,[r5,#0x630]
    add        r0,r0,r1,asr #0x8
    strb       r0,[r5,#0x630]
    mul        r1,r6,r10
    ldrb       r0,[r5,#0x0]
    add        r0,r0,r1,asr #0x8
    strb       r0,[r5],#0x1
    subs       r2,r2,#0x1
    bne        LAB_0809c21c
    ldr        r2,[sp,#0x10]
    cmp        r2,#0x0
    ldrne      r3,[sp,#0xc]
    bne        LAB_0809c21c
    strb       r2,[r4,#0x0]
    b          LAB_0809c304
LAB_0809c21c:
    subs       r8,r8,#0x1
    bgt        LAB_0809c1d8
    b          LAB_0809c2fc
LAB_0809c228:
    ldr        r7,[r4,#0x1c]
    ldr        lr,[r4,#0x20]
LAB_0809c230:
    cmp        r7,r9,lsl #0x2
    bcc        LAB_0809c254
LAB_0809c238:
    cmp        r2,#0x4
    ble        LAB_0809c278
    sub        r2,r2,#0x4
    add        r3,r3,#0x4
    sub        r7,r7,r9,lsl #0x2
    cmp        r7,r9,lsl #0x2
    bcs        LAB_0809c238
LAB_0809c254:
    cmp        r7,r9,lsl #0x1
    bcc        LAB_0809c270
    cmp        r2,#0x2
    ble        LAB_0809c278
    sub        r2,r2,#0x2
    add        r3,r3,#0x2
    sub        r7,r7,r9,lsl #0x1
LAB_0809c270:
    cmp        r7,r9
    bcc        LAB_0809c2a8
LAB_0809c278:
    subs       r2,r2,#0x1
    bne        LAB_0809c298
    ldr        r2,[sp,#0x10]
    cmp        r2,#0x0
    ldrne      r3,[sp,#0xc]
    bne        LAB_0809c29c
    strb       r2,[r4,#0x0]
    b          LAB_0809c304
LAB_0809c298:
    add        r3,r3,#0x1
LAB_0809c29c:
    sub        r7,r7,r9
    cmp        r7,r9
    bcs        LAB_0809c278
LAB_0809c2a8:
    ldrsb      r0,[r3,#0x0]
    ldrsb      r1,[r3,#0x1]
    sub        r1,r1,r0
    mul        r6,r1,r7
    mul        r1,r6,r12
    add        r6,r0,r1,asr #0x17
    mul        r1,r6,r11
    ldrb       r0,[r5,#0x630]
    add        r0,r0,r1,asr #0x8
    strb       r0,[r5,#0x630]
    mul        r1,r6,r10
    ldrb       r0,[r5,#0x0]
    add        r0,r0,r1,asr #0x8
    strb       r0,[r5],#0x1
    add        r7,r7,lr
    subs       r8,r8,#0x1
    beq        LAB_0809c2f8
    cmp        r7,r9
    bcc        LAB_0809c2a8
    b          LAB_0809c230
LAB_0809c2f8:
    str        r7,[r4,#0x1c]
LAB_0809c2fc:
    str        r2,[r4,#0x18]
    str        r3,[r4,#0x28]
LAB_0809c304:
    ldr        r8,[sp,#0x0]
    adr        r0,LAB_0809c310+1
    bx         r0

    .thumb

LAB_0809c310:
    ldr        r0,[sp,#0x4]
    sub        r0,#0x1
    ble        LAB_0809c31a
    add        r4,#0x40
    b          LAB_0809c0c0
LAB_0809c31a:
    ldr        r0,[sp,#0x18]
    ldr        r3,soundMagic
    str        r3,[r0,#0x0]
    add        sp,#0x1c
    pop        {r0,r1,r2,r3,r4,r5,r6,r7}
    mov        r8,r0
    mov        r9,r1
    mov        r10,r2
    mov        r11,r3
    pop        {r3}


_nt Call_R3_9c32e
    bx         r3

soundMagic:
    .word 0x68736D53

DAT_0809c334:
    .word 0x350

lt_PCM_DMA_BUF_SIZE:
    .byte 0x30, 0x06

    .align 2, 0



_ts SoundMainBTM
    mov        r12,r4
    mov        r1,#0x0
    mov        r2,#0x0
    mov        r3,#0x0
    mov        r4,#0x0
    stmia      r0!,{r1,r2,r3,r4}
    stmia      r0!,{r1,r2,r3,r4}
    stmia      r0!,{r1,r2,r3,r4}
    stmia      r0!,{r1,r2,r3,r4}
    mov        r4,r12
    bx         lr

    .align 2, 0



_ts RealClearChain
    ldr        r3,[r0,#0x2c]
    cmp        r3,#0x0
    beq        LAB_0809c372
    ldr        r1,[r0,#0x34]
    ldr        r2,[r0,#0x30]
    cmp        r2,#0x0
    beq        LAB_0809c366
    str        r1,[r2,#0x34]
    b          LAB_0809c368
LAB_0809c366:
    str        r1,[r3,#0x20]
LAB_0809c368:
    cmp        r1,#0x0
    beq        LAB_0809c36e
    str        r2,[r1,#0x30]
LAB_0809c36e:
    mov        r1,#0x0
    str        r1,[r0,#0x2c]
LAB_0809c372:
    bx         lr


_ts ply_fine
    push       {r4,r5,lr}
    add        r5,r1,#0x0
    ldr        r4,[r5,#0x20]
    cmp        r4,#0x0
    beq        ply_fine_done
ply_fine_loop:
    ldrb       r1,[r4,#0x0]
    mov        r0,#0xc7
    tst        r0,r1
    beq        ply_fine_ok
    mov        r0,#0x40
    orr        r1,r0
    strb       r1,[r4,#0x0]
ply_fine_ok:
    add        r0,r4,#0x0
    bl         RealClearChain
    ldr        r4,[r4,#0x34]
    cmp        r4,#0x0
    bne        ply_fine_loop
ply_fine_done:
    mov        r0,#0x0
    strb       r0,[r5,#0x0]
    pop        {r4,r5}
    pop        {r0}
    bx         r0

    .align 2, 0



_ts MPlayJumpTableCopy
    mov        r12,lr
    mov        r1,#0x24
    ldr        r2,PTR_gMPlayJumpTableTemplate_0809c3d4
MPlayJumpTableCopy_Loop:
    ldr        r3,[r2,#0x0]
    bl         chk_adr_r2
    stmia      r0!,{r3}
    add        r2,#0x4
    sub        r1,#0x1
    bgt        MPlayJumpTableCopy_Loop
    bx         r12

    .align 2, 0



_ts ldrb_r3_r2
    ldrb       r3,[r2,#0x0]


_nt chk_adr_r2
    push       {r0}
    lsr        r0,r2,#0x19
    @@ If address is >= 0x4000000, it's fine
    bne        chk_adr_r2_done
    ldr        r0,PTR_gMPlayJumpTableTemplate_0809c3d4
    cmp        r2,r0
    @@ Reject if address is before jump table template
    bcc        chk_adr_r2_reject
    lsr        r0,r2,#0xe
    beq        chk_adr_r2_done
chk_adr_r2_reject:
    mov        r3,#0x0
chk_adr_r2_done:
    pop        {r0}
    bx         lr

PTR_gMPlayJumpTableTemplate_0809c3d4:
    .word gMPlayJumpTableTemplate


_ts ld_r3_tp_adr_i
    ldr        r2,[r1,#0x40]


_nt FUN_0809c3da
    add        r3,r2,#0x1
    str        r3,[r1,#0x40]
    ldrb       r3,[r2,#0x0]
    b          chk_adr_r2

    .align 2, 0



_ts ply_goto
    push       {lr}


_nt ply_goto_1
    ldr        r2,[r1,#0x40]
    ldrb       r0,[r2,#0x3]
    lsl        r0,r0,#0x8
    ldrb       r3,[r2,#0x2]
    orr        r0,r3
    lsl        r0,r0,#0x8
    ldrb       r3,[r2,#0x1]
    orr        r0,r3
    lsl        r0,r0,#0x8
    bl         ldrb_r3_r2
    orr        r0,r3
    str        r0,[r1,#0x40]
    pop        {r0}
    bx         r0


_ts ply_patt
    ldrb       r2,[r1,#0x2]
    cmp        r2,#0x3
    bcs        ply_patt_done
    lsl        r2,r2,#0x2
    add        r3,r1,r2
    ldr        r2,[r1,#0x40]
    add        r2,#0x4
    str        r2,[r3,#0x44]
    ldrb       r2,[r1,#0x2]
    add        r2,#0x1
    strb       r2,[r1,#0x2]
    b          ply_goto
ply_patt_done:
    b          ply_fine

    .align 2, 0



_ts ply_pend
    ldrb       r2,[r1,#0x2]
    cmp        r2,#0x0
    beq        ply_pend_done
    sub        r2,#0x1
    strb       r2,[r1,#0x2]
    lsl        r2,r2,#0x2
    add        r3,r1,r2
    ldr        r2,[r3,#0x44]
    str        r2,[r1,#0x40]
ply_pend_done:
    bx         lr


_ts ply_rept
    push       {lr}
    ldr        r2,[r1,#0x40]
    ldrb       r3,[r2,#0x0]
    cmp        r3,#0x0
    bne        ply_rept_1
    add        r2,#0x1
    str        r2,[r1,#0x40]
    b          ply_goto_1
ply_rept_1:
    ldrb       r3,[r1,#0x3]
    add        r3,#0x1
    strb       r3,[r1,#0x3]
    mov        r12,r3
    bl         ld_r3_tp_adr_i
    cmp        r12,r3
    bcs        ply_rept_2
    b          ply_goto_1
ply_rept_2:
    mov        r3,#0x0
    strb       r3,[r1,#0x3]
    add        r2,#0x5
    str        r2,[r1,#0x40]
    pop        {r0}
    bx         r0

    .align 2, 0



_ts ply_prio
    mov        r12,lr
    bl         ld_r3_tp_adr_i
    strb       r3,[r1,#0x1d]
    bx         r12

    .align 2, 0



_ts ply_tempo
    mov        r12,lr
    bl         ld_r3_tp_adr_i
    lsl        r3,r3,#0x1
    strh       r3,[r0,#0x1c]
    ldrh       r2,[r0,#0x1e]
    mul        r3,r2
    lsr        r3,r3,#0x8
    strh       r3,[r0,#0x20]
    bx         r12


_ts ply_keysh
    mov        r12,lr
    bl         ld_r3_tp_adr_i
    strb       r3,[r1,#0xa]
    ldrb       r3,[r1,#0x0]
    mov        r2,#0xc
    orr        r3,r2
    strb       r3,[r1,#0x0]
    bx         r12

    .align 2, 0



_ts ply_voice
    mov        r12,lr
    ldr        r2,[r1,#0x40]
    ldrb       r3,[r2,#0x0]
    add        r2,#0x1
    str        r2,[r1,#0x40]
    lsl        r2,r3,#0x1
    add        r2,r2,r3
    lsl        r2,r2,#0x2
    ldr        r3,[r0,#0x30]
    add        r2,r2,r3
    ldr        r3,[r2,#0x0]
    bl         chk_adr_r2
    str        r3,[r1,#0x24]
    ldr        r3,[r2,#0x4]
    bl         chk_adr_r2
    str        r3,[r1,#0x28]
    ldr        r3,[r2,#0x8]
    bl         chk_adr_r2
    str        r3,[r1,#0x2c]
    bx         r12

    .align 2, 0



_ts ply_vol
    mov        r12,lr
    bl         ld_r3_tp_adr_i
    strb       r3,[r1,#0x12]
    ldrb       r3,[r1,#0x0]
    mov        r2,#0x3
    orr        r3,r2
    strb       r3,[r1,#0x0]
    bx         r12

    .align 2, 0



_ts ply_pan
    mov        r12,lr
    bl         ld_r3_tp_adr_i
    sub        r3,#0x40
    strb       r3,[r1,#0x14]
    ldrb       r3,[r1,#0x0]
    mov        r2,#0x3
    orr        r3,r2
    strb       r3,[r1,#0x0]
    bx         r12


_ts ply_bend
    mov        r12,lr
    bl         ld_r3_tp_adr_i
    sub        r3,#0x40
    strb       r3,[r1,#0xe]
    ldrb       r3,[r1,#0x0]
    mov        r2,#0xc
    orr        r3,r2
    strb       r3,[r1,#0x0]
    bx         r12


_ts ply_bendr
    mov        r12,lr
    bl         ld_r3_tp_adr_i
    strb       r3,[r1,#0xf]
    ldrb       r3,[r1,#0x0]
    mov        r2,#0xc
    orr        r3,r2
    strb       r3,[r1,#0x0]
    bx         r12

    .align 2, 0



_ts ply_lfodl
    mov        r12,lr
    bl         ld_r3_tp_adr_i
    strb       r3,[r1,#0x1b]
    bx         r12

    .align 2, 0



_ts ply_modt
    mov        r12,lr
    bl         ld_r3_tp_adr_i
    ldrb       r0,[r1,#0x18]
    cmp        r0,r3
    beq        ply_modt_1
    strb       r3,[r1,#0x18]
    ldrb       r3,[r1,#0x0]
    mov        r2,#0xf
    orr        r3,r2
    strb       r3,[r1,#0x0]
ply_modt_1:
    bx         r12


_ts ply_tune
    mov        r12,lr
    bl         ld_r3_tp_adr_i
    sub        r3,#0x40
    strb       r3,[r1,#0xc]
    ldrb       r3,[r1,#0x0]
    mov        r2,#0xc
    orr        r3,r2
    strb       r3,[r1,#0x0]
    bx         r12


_ts ply_port
    mov        r12,lr
    ldr        r2,[r1,#0x40]
    ldrb       r3,[r2,#0x0]
    add        r2,#0x1
    ldr        r0,PTR_REG_NR10_0809c564
    add        r0,r0,r3
    bl         FUN_0809c3da
    strb       r3,[r0,#0x0]
    bx         r12

PTR_REG_NR10_0809c564:
    .word REG_NR10


_ts m4aSoundVSync
    ldr        r0,PTR_ptrSoundInfo_0809c804
    ldr        r0,[r0,#0x0]
    ldr        r2,soundMagic_9c808
    ldr        r3,[r0,#0x0]
    sub        r3,r3,r2
    cmp        r3,#0x1
    bhi        m4aSoundVSync_Done
    ldrb       r1,[r0,#0x4]
    sub        r1,#0x1
    strb       r1,[r0,#0x4]
    bgt        m4aSoundVSync_Done
    ldrb       r1,[r0,#0xb]
    strb       r1,[r0,#0x4]
    @@ Do sound DMA
    mov        r0,#0x0
    mov        r1,#0xb6
    lsl        r1,r1,#0x8
    ldr        r2,dma1_control
    ldr        r3,dma2_control
    strh       r0,[r2,#0x0]
    strh       r0,[r3,#0x0]
    strh       r1,[r2,#0x0]
    strh       r1,[r3,#0x0]
m4aSoundVSync_Done:
    bx         lr

    .align 2, 0


dma1_control:
    .word 0x40000C6

dma2_control:
    .word 0x40000D2


_ts MPlayMain
    ldr        r2,soundMagic_9c808
    ldr        r3,[r0,#0x34]
    cmp        r2,r3
    beq        LAB_0809c5aa
    bx         lr
LAB_0809c5aa:
    add        r3,#0x1
    str        r3,[r0,#0x34]
    push       {r0,lr}
    ldr        r3,[r0,#0x38]
    cmp        r3,#0x0
    beq        LAB_0809c5bc
    ldr        r0,[r0,#0x3c]
    bl         call_r3
LAB_0809c5bc:
    pop        {r0}
    push       {r4,r5,r6,r7}
    mov        r4,r8
    mov        r5,r9
    mov        r6,r10
    mov        r7,r11
    push       {r4,r5,r6,r7}
    add        r7,r0,#0x0
    ldr        r0,[r7,#0x4]
    cmp        r0,#0x0
    bge        LAB_0809c5d4
    b          LAB_0809c7ec
LAB_0809c5d4:
    ldr        r0,PTR_ptrSoundInfo_0809c804
    ldr        r0,[r0,#0x0]
    mov        r8,r0
    add        r0,r7,#0x0
    bl         FadeOutBody
    ldrh       r0,[r7,#0x22]
    ldrh       r1,[r7,#0x20]
    add        r0,r0,r1
    b          LAB_0809c730
LAB_0809c5e8:
    ldrb       r6,[r7,#0x8]
    ldr        r5,[r7,#0x2c]
    mov        r3,#0x1
    mov        r4,#0x0
LAB_0809c5f0:
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x80
    tst        r1,r0
    bne        LAB_0809c5fa
    b          LAB_0809c70c
LAB_0809c5fa:
    mov        r10,r3
    orr        r4,r3
    mov        r11,r4
    ldr        r4,[r5,#0x20]
    cmp        r4,#0x0
    beq        LAB_0809c62e
LAB_0809c606:
    ldrb       r1,[r4,#0x0]
    mov        r0,#0xc7
    tst        r0,r1
    beq        LAB_0809c622
    ldrb       r0,[r4,#0x10]
    cmp        r0,#0x0
    beq        LAB_0809c628
    sub        r0,#0x1
    strb       r0,[r4,#0x10]
    bne        LAB_0809c628
    mov        r0,#0x40
    orr        r1,r0
    strb       r1,[r4,#0x0]
    b          LAB_0809c628
LAB_0809c622:
    add        r0,r4,#0x0
    bl         ClearSoundChannelTracks
LAB_0809c628:
    ldr        r4,[r4,#0x34]
    cmp        r4,#0x0
    bne        LAB_0809c606
LAB_0809c62e:
    ldrb       r3,[r5,#0x0]
    mov        r0,#0x40
    tst        r0,r3
    beq        LAB_0809c6ac
    add        r0,r5,#0x0
    bl         InitializeMusicPlayerTrack
    mov        r0,#0x80
    strb       r0,[r5,#0x0]
    mov        r0,#0x2
    strb       r0,[r5,#0xf]
    mov        r0,#0x40
    strb       r0,[r5,#0x13]
    mov        r0,#0x16
    strb       r0,[r5,#0x19]
    mov        r0,#0x1
    add        r1,r5,#0x6
    strb       r0,[r1,#0x1e]
    b          LAB_0809c6ac
LAB_0809c654:
    ldr        r2,[r5,#0x40]
    ldrb       r1,[r2,#0x0]
    cmp        r1,#0x80
    bcs        LAB_0809c660
    ldrb       r1,[r5,#0x7]
    b          LAB_0809c66a
LAB_0809c660:
    add        r2,#0x1
    str        r2,[r5,#0x40]
    cmp        r1,#0xbd
    bcc        LAB_0809c66a
    strb       r1,[r5,#0x7]
LAB_0809c66a:
    cmp        r1,#0xcf
    bcc        LAB_0809c680
    mov        r0,r8
    ldr        r3,[r0,#0x38]
    add        r0,r1,#0x0
    sub        r0,#0xcf
    add        r1,r7,#0x0
    add        r2,r5,#0x0
    bl         call_r3
    b          LAB_0809c6ac
LAB_0809c680:
    cmp        r1,#0xb0
    bls        LAB_0809c6a2
    add        r0,r1,#0x0
    sub        r0,#0xb1
    strb       r0,[r7,#0xa]
    mov        r3,r8
    ldr        r3,[r3,#0x34]
    lsl        r0,r0,#0x2
    ldr        r3,[r3,r0]
    add        r0,r7,#0x0
    add        r1,r5,#0x0
    bl         call_r3
    ldrb       r0,[r5,#0x0]
    cmp        r0,#0x0
    beq        LAB_0809c708
    b          LAB_0809c6ac
LAB_0809c6a2:
    ldr        r0,PTR_gClockTable_0809c800
    sub        r1,#0x80
    add        r1,r1,r0
    ldrb       r0,[r1,#0x0]
    strb       r0,[r5,#0x1]
LAB_0809c6ac:
    ldrb       r0,[r5,#0x1]
    cmp        r0,#0x0
    beq        LAB_0809c654
    sub        r0,#0x1
    strb       r0,[r5,#0x1]
    ldrb       r1,[r5,#0x19]
    cmp        r1,#0x0
    beq        LAB_0809c708
    ldrb       r0,[r5,#0x17]
    cmp        r0,#0x0
    beq        LAB_0809c708
    ldrb       r0,[r5,#0x1c]
    cmp        r0,#0x0
    beq        LAB_0809c6ce
    sub        r0,#0x1
    strb       r0,[r5,#0x1c]
    b          LAB_0809c708
LAB_0809c6ce:
    ldrb       r0,[r5,#0x1a]
    add        r0,r0,r1
    strb       r0,[r5,#0x1a]
    add        r1,r0,#0x0
    sub        r0,#0x40
    lsl        r0,r0,#0x18
    bpl        LAB_0809c6e2
    lsl        r2,r1,#0x18
    asr        r2,r2,#0x18
    b          LAB_0809c6e6
LAB_0809c6e2:
    mov        r0,#0x80
    sub        r2,r0,r1
LAB_0809c6e6:
    ldrb       r0,[r5,#0x17]
    mul        r0,r2
    asr        r2,r0,#0x6
    ldrb       r0,[r5,#0x16]
    eor        r0,r2
    lsl        r0,r0,#0x18
    beq        LAB_0809c708
    strb       r2,[r5,#0x16]
    ldrb       r0,[r5,#0x0]
    ldrb       r1,[r5,#0x18]
    cmp        r1,#0x0
    bne        LAB_0809c702
    mov        r1,#0xc
    b          LAB_0809c704
LAB_0809c702:
    mov        r1,#0x3
LAB_0809c704:
    orr        r0,r1
    strb       r0,[r5,#0x0]
LAB_0809c708:
    mov        r3,r10
    mov        r4,r11
LAB_0809c70c:
    sub        r6,#0x1
    ble        LAB_0809c718
    mov        r0,#0x50
    add        r5,r5,r0
    lsl        r3,r3,#0x1
    b          LAB_0809c5f0
LAB_0809c718:
    ldr        r0,[r7,#0xc]
    add        r0,#0x1
    str        r0,[r7,#0xc]
    cmp        r4,#0x0
    bne        LAB_0809c72a
    mov        r0,#0x80
    lsl        r0,r0,#0x18
    str        r0,[r7,#0x4]
    b          LAB_0809c7ec
LAB_0809c72a:
    str        r4,[r7,#0x4]
    ldrh       r0,[r7,#0x22]
    sub        r0,#0x96
LAB_0809c730:
    strh       r0,[r7,#0x22]
    cmp        r0,#0x96
    bcc        LAB_0809c738
    b          LAB_0809c5e8
LAB_0809c738:
    ldrb       r2,[r7,#0x8]
    ldr        r5,[r7,#0x2c]
LAB_0809c73c:
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x80
    tst        r1,r0
    beq        LAB_0809c7e2
    mov        r1,#0xf
    tst        r1,r0
    beq        LAB_0809c7e2
    mov        r9,r2
    add        r0,r7,#0x0
    add        r1,r5,#0x0
    bl         TrkVolPitSet
    ldr        r4,[r5,#0x20]
    cmp        r4,#0x0
    beq        LAB_0809c7d8
LAB_0809c75a:
    ldrb       r1,[r4,#0x0]
    mov        r0,#0xc7
    tst        r0,r1
    bne        LAB_0809c76a
    add        r0,r4,#0x0
    bl         ClearSoundChannelTracks
    b          LAB_0809c7d2
LAB_0809c76a:
    ldrb       r0,[r4,#0x1]
    mov        r6,#0x7
    and        r6,r0
    ldrb       r3,[r5,#0x0]
    mov        r0,#0x3
    tst        r0,r3
    beq        LAB_0809c796
    ldrb       r1,[r4,#0x12]
    ldrb       r0,[r5,#0x10]
    mul        r0,r1
    asr        r0,r0,#0x7
    strb       r0,[r4,#0x2]
    ldrb       r0,[r5,#0x11]
    mul        r0,r1
    asr        r0,r0,#0x7
    strb       r0,[r4,#0x3]
    cmp        r6,#0x0
    beq        LAB_0809c796
    ldrb       r0,[r4,#0x1d]
    mov        r1,#0x1
    orr        r0,r1
    strb       r0,[r4,#0x1d]
LAB_0809c796:
    mov        r0,#0xc
    tst        r0,r3
    beq        LAB_0809c7d2
    ldrb       r1,[r4,#0x8]
    mov        r0,#0x8
    ldrsb      r0,[r5,r0]
    add        r2,r1,r0
    bpl        LAB_0809c7a8
    mov        r2,#0x0
LAB_0809c7a8:
    cmp        r6,#0x0
    beq        LAB_0809c7c6
    mov        r0,r8
    ldr        r3,[r0,#0x30]
    add        r1,r2,#0x0
    ldrb       r2,[r5,#0x9]
    add        r0,r6,#0x0
    bl         call_r3
    str        r0,[r4,#0x20]
    ldrb       r0,[r4,#0x1d]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r4,#0x1d]
    b          LAB_0809c7d2
LAB_0809c7c6:
    add        r1,r2,#0x0
    ldrb       r2,[r5,#0x9]
    ldr        r0,[r4,#0x24]
    bl         MidiKeyToFreq
    str        r0,[r4,#0x20]
LAB_0809c7d2:
    ldr        r4,[r4,#0x34]
    cmp        r4,#0x0
    bne        LAB_0809c75a
LAB_0809c7d8:
    ldrb       r0,[r5,#0x0]
    mov        r1,#0xf0
    and        r0,r1
    strb       r0,[r5,#0x0]
    mov        r2,r9
LAB_0809c7e2:
    sub        r2,#0x1
    ble        LAB_0809c7ec
    mov        r0,#0x50
    add        r5,r5,r0
    bgt        LAB_0809c73c
LAB_0809c7ec:
    ldr        r0,soundMagic_9c808
    str        r0,[r7,#0x34]
    pop        {r0,r1,r2,r3,r4,r5,r6,r7}
    mov        r8,r0
    mov        r9,r1
    mov        r10,r2
    mov        r11,r3
    pop        {r3}


_ts call_r3
    bx         r3

    .align 2, 0


PTR_gClockTable_0809c800:
    .word gClockTable

PTR_ptrSoundInfo_0809c804:
    .word 0x3007FF0

soundMagic_9c808:
    .word 0x68736D53


_ts TrackStop
    push       {r4,r5,r6,lr}
    add        r5,r1,#0x0
    ldrb       r1,[r5,#0x0]
    mov        r0,#0x80
    tst        r0,r1
    beq        TrackStop_Done
    ldr        r4,[r5,#0x20]
    cmp        r4,#0x0
    beq        TrackStop_3
    mov        r6,#0x0
TrackStop_Loop:
    ldrb       r0,[r4,#0x0]
    cmp        r0,#0x0
    beq        TrackStop_2
    ldrb       r0,[r4,#0x1]
    mov        r3,#0x7
    and        r0,r3
    beq        TrackStop_1
    ldr        r3,PTR_ptrSoundInfo_0809c84c
    ldr        r3,[r3,#0x0]
    ldr        r3,[r3,#0x2c]
    bl         call_r3
TrackStop_1:
    strb       r6,[r4,#0x0]
TrackStop_2:
    str        r6,[r4,#0x2c]
    ldr        r4,[r4,#0x34]
    cmp        r4,#0x0
    bne        TrackStop_Loop
TrackStop_3:
    str        r4,[r5,#0x20]
TrackStop_Done:
    pop        {r4,r5,r6}
    pop        {r0}
    bx         r0

    .align 2, 0


PTR_ptrSoundInfo_0809c84c:
    .word 0x3007FF0


_ts ply_note
    push       {r4,r5,r6,r7,lr}
    mov        r4,r8
    mov        r5,r9
    mov        r6,r10
    mov        r7,r11
    push       {r4,r5,r6,r7}
    sub        sp,#0x14
    str        r1,[sp,#0x0]
    add        r5,r2,#0x0
    ldr        r1,PTR_ptrSoundInfo_0809ca54
    ldr        r1,[r1,#0x0]
    str        r1,[sp,#0x4]
    ldr        r1,PTR_gClockTable_0809ca58
    add        r0,r0,r1
    ldrb       r0,[r0,#0x0]
    strb       r0,[r5,#0x4]
    ldr        r3,[r5,#0x40]
    ldrb       r0,[r3,#0x0]
    cmp        r0,#0x80
    bcs        LAB_0809c896
    strb       r0,[r5,#0x5]
    add        r3,#0x1
    ldrb       r0,[r3,#0x0]
    cmp        r0,#0x80
    bcs        LAB_0809c894
    strb       r0,[r5,#0x6]
    add        r3,#0x1
    ldrb       r0,[r3,#0x0]
    cmp        r0,#0x80
    bcs        LAB_0809c894
    ldrb       r1,[r5,#0x4]
    add        r1,r1,r0
    strb       r1,[r5,#0x4]
    add        r3,#0x1
LAB_0809c894:
    str        r3,[r5,#0x40]
LAB_0809c896:
    add        r4,r5,#0x0
    add        r4,#0x24
    ldrb       r2,[r4,#0x0]
    mov        r0,#0xc0
    tst        r0,r2
    beq        LAB_0809c8ec
    ldrb       r3,[r5,#0x5]
    mov        r0,#0x40
    tst        r0,r2
    beq        LAB_0809c8b2
    ldr        r1,[r5,#0x2c]
    add        r1,r1,r3
    ldrb       r0,[r1,#0x0]
    b          LAB_0809c8b4
LAB_0809c8b2:
    add        r0,r3,#0x0
LAB_0809c8b4:
    lsl        r1,r0,#0x1
    add        r1,r1,r0
    lsl        r1,r1,#0x2
    ldr        r0,[r5,#0x28]
    add        r1,r1,r0
    mov        r9,r1
    mov        r6,r9
    ldrb       r1,[r6,#0x0]
    mov        r0,#0xc0
    tst        r0,r1
    beq        LAB_0809c8cc
    b          LAB_0809ca44
LAB_0809c8cc:
    mov        r0,#0x80
    tst        r0,r2
    beq        LAB_0809c8f0
    ldrb       r1,[r6,#0x3]
    mov        r0,#0x80
    tst        r0,r1
    beq        LAB_0809c8e8
    sub        r1,#0xc0
    lsl        r1,r1,#0x1
    strb       r1,[r5,#0x15]
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x3
    orr        r0,r1
    strb       r0,[r5,#0x0]
LAB_0809c8e8:
    ldrb       r3,[r6,#0x1]
    b          LAB_0809c8f0
LAB_0809c8ec:
    mov        r9,r4
    ldrb       r3,[r5,#0x5]
LAB_0809c8f0:
    str        r3,[sp,#0x8]
    ldr        r6,[sp,#0x0]
    ldrb       r1,[r6,#0x9]
    ldrb       r0,[r5,#0x1d]
    add        r0,r0,r1
    cmp        r0,#0xff
    bls        LAB_0809c900
    mov        r0,#0xff
LAB_0809c900:
    str        r0,[sp,#0x10]
    mov        r6,r9
    ldrb       r0,[r6,#0x0]
    mov        r6,#0x7
    and        r6,r0
    str        r6,[sp,#0xc]
    beq        LAB_0809c940
    ldr        r0,[sp,#0x4]
    ldr        r4,[r0,#0x1c]
    cmp        r4,#0x0
    bne        LAB_0809c918
    b          LAB_0809ca44
LAB_0809c918:
    sub        r6,#0x1
    lsl        r0,r6,#0x6
    add        r4,r4,r0
    ldrb       r1,[r4,#0x0]
    mov        r0,#0xc7
    tst        r0,r1
    beq        LAB_0809c994
    mov        r0,#0x40
    tst        r0,r1
    bne        LAB_0809c994
    ldrb       r1,[r4,#0x13]
    ldr        r0,[sp,#0x10]
    cmp        r1,r0
    bcc        LAB_0809c994
    beq        LAB_0809c938
    b          LAB_0809ca44
LAB_0809c938:
    ldr        r0,[r4,#0x2c]
    cmp        r0,r5
    bcs        LAB_0809c994
    b          LAB_0809ca44
LAB_0809c940:
    ldr        r6,[sp,#0x10]
    add        r7,r5,#0x0
    mov        r2,#0x0
    mov        r8,r2
    ldr        r4,[sp,#0x4]
    ldrb       r3,[r4,#0x6]
    add        r4,#0x50
LAB_0809c94e:
    ldrb       r1,[r4,#0x0]
    mov        r0,#0xc7
    tst        r0,r1
    beq        LAB_0809c994
    mov        r0,#0x40
    tst        r0,r1
    beq        LAB_0809c968
    cmp        r2,#0x0
    bne        LAB_0809c96c
    add        r2,#0x1
    ldrb       r6,[r4,#0x13]
    ldr        r7,[r4,#0x2c]
    b          LAB_0809c986
LAB_0809c968:
    cmp        r2,#0x0
    bne        LAB_0809c988
LAB_0809c96c:
    ldrb       r0,[r4,#0x13]
    cmp        r0,r6
    bcs        LAB_0809c978
    add        r6,r0,#0x0
    ldr        r7,[r4,#0x2c]
    b          LAB_0809c986
LAB_0809c978:
    bhi        LAB_0809c988
    ldr        r0,[r4,#0x2c]
    cmp        r0,r7
    bls        LAB_0809c984
    add        r7,r0,#0x0
    b          LAB_0809c986
LAB_0809c984:
    bcc        LAB_0809c988
LAB_0809c986:
    mov        r8,r4
LAB_0809c988:
    add        r4,#0x40
    sub        r3,#0x1
    bgt        LAB_0809c94e
    mov        r4,r8
    cmp        r4,#0x0
    beq        LAB_0809ca44
LAB_0809c994:
    add        r0,r4,#0x0
    bl         ClearSoundChannelTracks
    mov        r1,#0x0
    str        r1,[r4,#0x30]
    ldr        r3,[r5,#0x20]
    str        r3,[r4,#0x34]
    cmp        r3,#0x0
    beq        LAB_0809c9a8
    str        r4,[r3,#0x30]
LAB_0809c9a8:
    str        r4,[r5,#0x20]
    str        r5,[r4,#0x2c]
    ldrb       r0,[r5,#0x1b]
    strb       r0,[r5,#0x1c]
    cmp        r0,r1
    beq        LAB_0809c9ba
    add        r1,r5,#0x0
    bl         clear_modM
LAB_0809c9ba:
    ldr        r0,[sp,#0x0]
    add        r1,r5,#0x0
    bl         TrkVolPitSet
    ldr        r0,[r5,#0x4]
    str        r0,[r4,#0x10]
    ldr        r0,[sp,#0x10]
    strb       r0,[r4,#0x13]
    ldr        r0,[sp,#0x8]
    strb       r0,[r4,#0x8]
    mov        r6,r9
    ldrb       r0,[r6,#0x0]
    strb       r0,[r4,#0x1]
    ldr        r7,[r6,#0x4]
    str        r7,[r4,#0x24]
    ldr        r0,[r6,#0x8]
    str        r0,[r4,#0x4]
    ldrh       r0,[r5,#0x1e]
    strh       r0,[r4,#0xc]
    ldrb       r1,[r4,#0x12]
    ldrb       r0,[r5,#0x10]
    mul        r0,r1
    asr        r0,r0,#0x7
    strb       r0,[r4,#0x2]
    ldrb       r0,[r5,#0x11]
    mul        r0,r1
    asr        r0,r0,#0x7
    strb       r0,[r4,#0x3]
    ldrb       r1,[r4,#0x8]
    mov        r0,#0x8
    ldrsb      r0,[r5,r0]
    add        r3,r1,r0
    bpl        LAB_0809c9fe
    mov        r3,#0x0
LAB_0809c9fe:
    ldr        r6,[sp,#0xc]
    cmp        r6,#0x0
    beq        LAB_0809ca2c
    mov        r6,r9
    ldrb       r0,[r6,#0x2]
    strb       r0,[r4,#0x1e]
    ldrb       r1,[r6,#0x3]
    mov        r0,#0x80
    tst        r0,r1
    bne        LAB_0809ca18
    mov        r0,#0x70
    tst        r0,r1
    bne        LAB_0809ca1a
LAB_0809ca18:
    mov        r1,#0x8
LAB_0809ca1a:
    strb       r1,[r4,#0x1f]
    ldrb       r2,[r5,#0x9]
    add        r1,r3,#0x0
    ldr        r0,[sp,#0xc]
    ldr        r3,[sp,#0x4]
    ldr        r3,[r3,#0x30]
    bl         call_r3
    b          LAB_0809ca36
LAB_0809ca2c:
    ldrb       r2,[r5,#0x9]
    add        r1,r3,#0x0
    add        r0,r7,#0x0
    bl         MidiKeyToFreq
LAB_0809ca36:
    str        r0,[r4,#0x20]
    mov        r0,#0x80
    strb       r0,[r4,#0x0]
    ldrb       r1,[r5,#0x0]
    mov        r0,#0xf0
    and        r0,r1
    strb       r0,[r5,#0x0]
LAB_0809ca44:
    add        sp,#0x14
    pop        {r0,r1,r2,r3,r4,r5,r6,r7}
    mov        r8,r0
    mov        r9,r1
    mov        r10,r2
    mov        r11,r3
    pop        {r0}
    bx         r0

PTR_ptrSoundInfo_0809ca54:
    .word 0x3007FF0

PTR_gClockTable_0809ca58:
    .word gClockTable


_ts ply_endtie
    push       {r4,r5}
    ldr        r2,[r1,#0x40]
    ldrb       r3,[r2,#0x0]
    cmp        r3,#0x80
    bcs        LAB_0809ca6e
    strb       r3,[r1,#0x5]
    add        r2,#0x1
    str        r2,[r1,#0x40]
    b          LAB_0809ca70
LAB_0809ca6e:
    ldrb       r3,[r1,#0x5]
LAB_0809ca70:
    ldr        r1,[r1,#0x20]
    cmp        r1,#0x0
    beq        LAB_0809ca98
    mov        r4,#0x83
    mov        r5,#0x40
LAB_0809ca7a:
    ldrb       r2,[r1,#0x0]
    tst        r2,r4
    beq        LAB_0809ca92
    tst        r2,r5
    bne        LAB_0809ca92
    ldrb       r0,[r1,#0x11]
    cmp        r0,r3
    bne        LAB_0809ca92
    mov        r0,#0x40
    orr        r2,r0
    strb       r2,[r1,#0x0]
    b          LAB_0809ca98
LAB_0809ca92:
    ldr        r1,[r1,#0x34]
    cmp        r1,#0x0
    bne        LAB_0809ca7a
LAB_0809ca98:
    pop        {r4,r5}
    bx         lr


_ts clear_modM
    mov        r2,#0x0
    strb       r2,[r1,#0x16]
    strb       r2,[r1,#0x1a]
    ldrb       r2,[r1,#0x18]
    cmp        r2,#0x0
    bne        LAB_0809caac
    mov        r2,#0xc
    b          LAB_0809caae
LAB_0809caac:
    mov        r2,#0x3
LAB_0809caae:
    ldrb       r3,[r1,#0x0]
    orr        r3,r2
    strb       r3,[r1,#0x0]
    bx         lr

    .align 2, 0



_ts ld_r3_tp_adr_i_unchecked
    ldr        r2,[r1,#0x40]
    add        r3,r2,#0x1
    str        r3,[r1,#0x40]
    ldrb       r3,[r2,#0x0]
    bx         lr

    .align 2, 0



_ts ply_lfos
    mov        r12,lr
    bl         ld_r3_tp_adr_i_unchecked
    strb       r3,[r1,#0x19]
    cmp        r3,#0x0
    bne        LAB_0809cad4
    bl         clear_modM
LAB_0809cad4:
    bx         r12

    .align 2, 0



_ts ply_mod
    mov        r12,lr
    bl         ld_r3_tp_adr_i_unchecked
    strb       r3,[r1,#0x17]
    cmp        r3,#0x0
    bne        LAB_0809cae8
    bl         clear_modM
LAB_0809cae8:
    bx         r12

    .align 2, 0



_ts MidiKeyToFreq
    push       {r4,r5,r6,r7,lr}
    mov        r12,r0
    lsl        r1,r1,#0x18
    lsr        r6,r1,#0x18
    lsl        r7,r2,#0x18
    cmp        r6,#0xb2
    bls        LAB_0809cb00
    mov        r6,#0xb2
    mov        r7,#0xff
    lsl        r7,r7,#0x18
LAB_0809cb00:
    ldr        r3,PTR_gScaleTable_0809cb48
    add        r0,r6,r3
    ldrb       r5,[r0,#0x0]
    ldr        r4,PTR_gFreqTable_0809cb4c
    mov        r2,#0xf
    add        r0,r5,#0x0
    and        r0,r2
    lsl        r0,r0,#0x2
    add        r0,r0,r4
    lsr        r1,r5,#0x4
    ldr        r5,[r0,#0x0]
    lsr        r5,r1
    add        r0,r6,#0x1
    add        r0,r0,r3
    ldrb       r1,[r0,#0x0]
    add        r0,r1,#0x0
    and        r0,r2
    lsl        r0,r0,#0x2
    add        r0,r0,r4
    lsr        r1,r1,#0x4
    ldr        r0,[r0,#0x0]
    lsr        r0,r1
    mov        r1,r12
    ldr        r4,[r1,#0x4]
    sub        r0,r0,r5
    add        r1,r7,#0x0
    bl         umul3232H32
    add        r1,r0,#0x0
    add        r1,r5,r1
    add        r0,r4,#0x0
    bl         umul3232H32
    pop        {r4,r5,r6,r7}
    pop        {r1}
    bx         r1

PTR_gScaleTable_0809cb48:
    .word gScaleTable

PTR_gFreqTable_0809cb4c:
    .word gFreqTable


_ts dummy_9CB50
    bx         lr

    .align 2, 0



_ts MPlayContinue
    add        r2,r0,#0x0
    ldr        r3,[r2,#0x34]
    ldr        r0,soundMagic_9cb68
    cmp        r3,r0
    bne        LAB_0809cb66
    ldr        r0,[r2,#0x4]
    ldr        r1,DAT_0809cb6c
    and        r0,r1
    str        r0,[r2,#0x4]
LAB_0809cb66:
    bx         lr

soundMagic_9cb68:
    .word 0x68736D53

DAT_0809cb6c:
    .word 0x7FFFFFFF


_ts MPlayFadeOut
    add        r2,r0,#0x0
    lsl        r1,r1,#0x10
    lsr        r1,r1,#0x10
    ldr        r3,[r2,#0x34]
    ldr        r0,soundMagic_9cb8c
    cmp        r3,r0
    bne        LAB_0809cb88
    strh       r1,[r2,#0x26]
    strh       r1,[r2,#0x24]
    mov        r0,#0x80
    lsl        r0,r0,#0x1
    strh       r0,[r2,#0x28]
LAB_0809cb88:
    bx         lr

    .align 2, 0


soundMagic_9cb8c:
    .word 0x68736D53


_ts m4aSoundInit
    push       {r4,r5,r6,r7,lr}
    mov        r7,r8
    push       {r7}
    ldr        r0,PTR_SoundMain_0809cbf8
    mov        r1,#0x2
    neg        r1,r1
    @@ copy from 0x809BFB4 to 0x3005C50 for 0x100 32-bit words
    and        r0,r1
    ldr        r1,PTR_SoundMainRAM_0809cbfc
    ldr        r2,cpuSetControl
    bl         SWI_CpuSet
    ldr        r0,PTR_gSoundInfo_0809cc04
    bl         SoundInit
    ldr        r0,PTR_gCgbChans_0809cc08
    bl         MPlayExtender
    ldr        r0,DAT_0809cc0c
    bl         m4aSoundMode
    ldr        r0,DAT_0809cc10
    lsl        r0,r0,#0x10
    lsr        r0,r0,#0x10
    cmp        r0,#0x0
    beq        LAB_0809cbec
    ldr        r1,PTR_gMPlayTable_0809cc14
    mov        r8,r1
    mov        r5,r8
    mov        r7,#0x0
    add        r6,r0,#0x0
LAB_0809cbcc:
    ldr        r4,[r5,#0x0]
    mov        r0,r8
    add        r0,#0x4
    add        r0,r7,r0
    ldr        r1,[r0,#0x0]
    ldrb       r2,[r5,#0x8]
    add        r0,r4,#0x0
    bl         MPlayOpen
    ldr        r0,PTR_gMPlayMemAccArea_0809cc18
    str        r0,[r4,#0x18]
    add        r5,#0xc
    add        r7,#0xc
    sub        r6,#0x1
    cmp        r6,#0x0
    bne        LAB_0809cbcc
LAB_0809cbec:
    pop        {r3}
    mov        r8,r3
    pop        {r4,r5,r6,r7}
    pop        {r0}
    bx         r0

    .align 2, 0


PTR_SoundMain_0809cbf8:
    .word SoundMain

PTR_SoundMainRAM_0809cbfc:
    .word 0x3005C50

cpuSetControl:
    .word 0x4000100

PTR_gSoundInfo_0809cc04:
    .word 0x3004B10

PTR_gCgbChans_0809cc08:
    .word 0x3005B50

DAT_0809cc0c:
    .word 0x93D400

DAT_0809cc10:
    .word 0x20

PTR_gMPlayTable_0809cc14:
    .word gMPlayTable

PTR_gMPlayMemAccArea_0809cc18:
    .word gMPlayMemAccArea


_ts m4aSoundMain
    push       {lr}
    ldr        r0,PTR_SoundMainRAM_0809cc28
    bl         Call_R0_9e0fc
    pop        {r0}
    bx         r0

PTR_SoundMainRAM_0809cc28:
    .word 0x3005C50+1


_ts m4aSongNumStart
    push       {lr}
    lsl        r0,r0,#0x10
    ldr        r2,PTR_gMPlayTable_0809cc50
    ldr        r1,PTR_gSongTable_0809cc54
    lsr        r0,r0,#0xd
    add        r0,r0,r1
    ldrh       r3,[r0,#0x4]
    lsl        r1,r3,#0x1
    add        r1,r1,r3
    lsl        r1,r1,#0x2
    add        r1,r1,r2
    ldr        r2,[r1,#0x0]
    ldr        r1,[r0,#0x0]
    add        r0,r2,#0x0
    bl         MPlayStart
    pop        {r0}
    bx         r0

PTR_gMPlayTable_0809cc50:
    .word gMPlayTable

PTR_gSongTable_0809cc54:
    .word gSongTable


_ts m4aSongNumStartOrChange
    push       {lr}
    lsl        r0,r0,#0x10
    ldr        r2,PTR_gMPlayTable_0809cc84
    ldr        r1,PTR_gSongTable_0809cc88
    lsr        r0,r0,#0xd
    add        r0,r0,r1
    ldrh       r3,[r0,#0x4]
    lsl        r1,r3,#0x1
    add        r1,r1,r3
    lsl        r1,r1,#0x2
    add        r1,r1,r2
    ldr        r1,[r1,#0x0]
    ldr        r3,[r1,#0x0]
    ldr        r2,[r0,#0x0]
    cmp        r3,r2
    beq        LAB_0809cc8c
    add        r0,r1,#0x0
    add        r1,r2,#0x0
    bl         MPlayStart
    b          LAB_0809cca0

    .align 2, 0


PTR_gMPlayTable_0809cc84:
    .word gMPlayTable

PTR_gSongTable_0809cc88:
    .word gSongTable
LAB_0809cc8c:
    ldr        r2,[r1,#0x4]
    ldrh       r0,[r1,#0x4]
    cmp        r0,#0x0
    beq        LAB_0809cc98
    cmp        r2,#0x0
    bge        LAB_0809cca0
LAB_0809cc98:
    add        r0,r1,#0x0
    add        r1,r3,#0x0
    bl         MPlayStart
LAB_0809cca0:
    pop        {r0}
    bx         r0


_ts m4aSongNumStartOrContinue
    push       {lr}
    lsl        r0,r0,#0x10
    ldr        r2,PTR_gMPlayTable_0809ccd0
    ldr        r1,PTR_gSongTable_0809ccd4
    lsr        r0,r0,#0xd
    add        r0,r0,r1
    ldrh       r3,[r0,#0x4]
    lsl        r1,r3,#0x1
    add        r1,r1,r3
    lsl        r1,r1,#0x2
    add        r1,r1,r2
    ldr        r1,[r1,#0x0]
    ldr        r3,[r1,#0x0]
    ldr        r2,[r0,#0x0]
    cmp        r3,r2
    beq        LAB_0809ccd8
    add        r0,r1,#0x0
    add        r1,r2,#0x0
    bl         MPlayStart
    b          LAB_0809ccf4

    .align 2, 0


PTR_gMPlayTable_0809ccd0:
    .word gMPlayTable

PTR_gSongTable_0809ccd4:
    .word gSongTable
LAB_0809ccd8:
    ldr        r2,[r1,#0x4]
    ldrh       r0,[r1,#0x4]
    cmp        r0,#0x0
    bne        LAB_0809ccea
    add        r0,r1,#0x0
    add        r1,r3,#0x0
    bl         MPlayStart
    b          LAB_0809ccf4
LAB_0809ccea:
    cmp        r2,#0x0
    bge        LAB_0809ccf4
    add        r0,r1,#0x0
    bl         MPlayContinue
LAB_0809ccf4:
    pop        {r0}
    bx         r0


_ts m4aSongNumStop
    push       {lr}
    lsl        r0,r0,#0x10
    ldr        r2,PTR_gMPlayTable_0809cd24
    ldr        r1,PTR_gSongTable_0809cd28
    lsr        r0,r0,#0xd
    add        r0,r0,r1
    ldrh       r3,[r0,#0x4]
    lsl        r1,r3,#0x1
    add        r1,r1,r3
    lsl        r1,r1,#0x2
    add        r1,r1,r2
    ldr        r2,[r1,#0x0]
    ldr        r1,[r2,#0x0]
    ldr        r0,[r0,#0x0]
    cmp        r1,r0
    bne        LAB_0809cd1e
    add        r0,r2,#0x0
    bl         m4aMPlayStop
LAB_0809cd1e:
    pop        {r0}
    bx         r0

    .align 2, 0


PTR_gMPlayTable_0809cd24:
    .word gMPlayTable

PTR_gSongTable_0809cd28:
    .word gSongTable


_ts m4aSongNumContinue
    push       {lr}
    lsl        r0,r0,#0x10
    ldr        r2,PTR_gMPlayTable_0809cd58
    ldr        r1,PTR_gSongTable_0809cd5c
    lsr        r0,r0,#0xd
    add        r0,r0,r1
    ldrh       r3,[r0,#0x4]
    lsl        r1,r3,#0x1
    add        r1,r1,r3
    lsl        r1,r1,#0x2
    add        r1,r1,r2
    ldr        r2,[r1,#0x0]
    ldr        r1,[r2,#0x0]
    ldr        r0,[r0,#0x0]
    cmp        r1,r0
    bne        LAB_0809cd52
    add        r0,r2,#0x0
    bl         MPlayContinue
LAB_0809cd52:
    pop        {r0}
    bx         r0

    .align 2, 0


PTR_gMPlayTable_0809cd58:
    .word gMPlayTable

PTR_gSongTable_0809cd5c:
    .word gSongTable


_ts m4aMPlayAllStop
    push       {r4,r5,lr}
    ldr        r0,DAT_0809cd84
    lsl        r0,r0,#0x10
    lsr        r0,r0,#0x10
    cmp        r0,#0x0
    beq        LAB_0809cd7e
    ldr        r5,PTR_gMPlayTable_0809cd88
    add        r4,r0,#0x0
LAB_0809cd70:
    ldr        r0,[r5,#0x0]
    bl         m4aMPlayStop
    add        r5,#0xc
    sub        r4,#0x1
    cmp        r4,#0x0
    bne        LAB_0809cd70
LAB_0809cd7e:
    pop        {r4,r5}
    pop        {r0}
    bx         r0

DAT_0809cd84:
    .word 0x20

PTR_gMPlayTable_0809cd88:
    .word gMPlayTable


_ts m4aMPlayAllContinue
    push       {r4,r5,lr}
    ldr        r0,DAT_0809cdb0
    lsl        r0,r0,#0x10
    lsr        r0,r0,#0x10
    cmp        r0,#0x0
    beq        LAB_0809cdaa
    ldr        r5,PTR_gMPlayTable_0809cdb4
    add        r4,r0,#0x0
LAB_0809cd9c:
    ldr        r0,[r5,#0x0]
    bl         MPlayContinue
    add        r5,#0xc
    sub        r4,#0x1
    cmp        r4,#0x0
    bne        LAB_0809cd9c
LAB_0809cdaa:
    pop        {r4,r5}
    pop        {r0}
    bx         r0

DAT_0809cdb0:
    .word 0x20

PTR_gMPlayTable_0809cdb4:
    .word gMPlayTable


_ts m4aMPlayImmInit
    push       {r4,r5,r6,r7,lr}
    ldrb       r5,[r0,#0x8]
    ldr        r4,[r0,#0x2c]
    cmp        r5,#0x0
    ble        LAB_0809cdfa
    mov        r7,#0x80
LAB_0809cdc4:
    ldrb       r1,[r4,#0x0]
    add        r0,r7,#0x0
    and        r0,r1
    cmp        r0,#0x0
    beq        LAB_0809cdf2
    mov        r6,#0x40
    add        r0,r6,#0x0
    and        r0,r1
    cmp        r0,#0x0
    beq        LAB_0809cdf2
    add        r0,r4,#0x0
    bl         InitializeMusicPlayerTrack
    strb       r7,[r4,#0x0]
    mov        r0,#0x2
    strb       r0,[r4,#0xf]
    strb       r6,[r4,#0x13]
    mov        r0,#0x16
    strb       r0,[r4,#0x19]
    add        r1,r4,#0x0
    add        r1,#0x24
    mov        r0,#0x1
    strb       r0,[r1,#0x0]
LAB_0809cdf2:
    sub        r5,#0x1
    add        r4,#0x50
    cmp        r5,#0x0
    bgt        LAB_0809cdc4
LAB_0809cdfa:
    pop        {r4,r5,r6,r7}
    pop        {r0}
    bx         r0


_ts MPlayExtender
    push       {r4,r5,r6,r7,lr}
    sub        sp,#0x4
    add        r6,r0,#0x0
    @@ Turn on all sounds and enable PSG/FIFO
    ldr        r1,PTR_REG_SOUNDCNT_X_0809ced4
    mov        r0,#0x8f
    strh       r0,[r1,#0x0]
    @@ Set all sound channels to max volume
    ldr        r2,PTR_REG_NR50_0809ced8
    mov        r0,#0x77
    strh       r0,[r2,#0x0]
    @@ Initial vol of Channel 1, 2, 4 = 15
    ldr        r0,PTR_REG_NR12_0809cedc
    mov        r1,#0x8
    strb       r1,[r0,#0x0]
    add        r0,#0x6
    strb       r1,[r0,#0x0]
    add        r0,#0x10
    strb       r1,[r0,#0x0]
    sub        r0,#0x14
    @@ Channel 1, 2, 4 restart sound
    mov        r1,#0x80
    strb       r1,[r0,#0x0]
    add        r0,#0x8
    strb       r1,[r0,#0x0]
    add        r0,#0x10
    strb       r1,[r0,#0x0]
    @@ Clear channel 3
    ldr        r1,PTR_REG_NR30_0809cee0
    mov        r0,#0x0
    strb       r0,[r1,#0x0]
    @@ Enable right/left audio at max volume
    ldr        r1,USHORT_0809cee4
    add        r0,r1,#0x0
    strh       r0,[r2,#0x0]
    ldr        r0,PTR_ptrSoundInfo_0809cee8
    ldr        r5,[r0,#0x0]
    ldr        r7,[r5,#0x0]
    ldr        r0,soundMagic_9ceec
    cmp        r7,r0
    bne        LAB_0809cecc
    add        r0,r7,#0x1
    str        r0,[r5,#0x0]
    ldr        r4,PTR_gMPlayJumpTable_0809cef0
    add        r0,r4,#0x0
    bl         MPlayJumpTableCopy
    ldr        r0,PTR_ply_memacc_0809cef4
    str        r0,[r4,#0x20]
    ldr        r0,PTR_ply_lfos_0809cef8
    str        r0,[r4,#0x44]
    ldr        r0,PTR_ply_mod_0809cefc
    str        r0,[r4,#0x4c]
    ldr        r0,PTR_ply_xcmd_0809cf00
    str        r0,[r4,#0x70]
    ldr        r0,PTR_ply_endtie_0809cf04
    str        r0,[r4,#0x74]
    ldr        r0,PTR_SampleFreqSet_0809cf08
    str        r0,[r4,#0x78]
    ldr        r0,PTR_TrackStop_0809cf0c
    str        r0,[r4,#0x7c]
    add        r1,r4,#0x0
    add        r1,#0x80
    ldr        r0,PTR_FadeOutBody_0809cf10
    str        r0,[r1,#0x0]
    add        r1,#0x4
    ldr        r0,PTR_TrkVolPitSet_0809cf14
    str        r0,[r1,#0x0]
    str        r6,[r5,#0x1c]
    ldr        r0,PTR_CgbSound_0809cf18
    str        r0,[r5,#0x28]
    ldr        r0,PTR_CgbOscOff_0809cf1c
    str        r0,[r5,#0x2c]
    ldr        r0,PTR_MidiKeyToCgbFreq_0809cf20
    str        r0,[r5,#0x30]
    str        r4,[r5,#0x34]
    ldr        r0,DAT_0809cf24
    mov        r1,#0x0
    strb       r0,[r5,#0xc]
    str        r1,[sp,#0x0]
    ldr        r2,INT_0809cf28
    mov        r0,sp
    add        r1,r6,#0x0
    bl         SWI_CpuSet
    mov        r0,#0x1
    strb       r0,[r6,#0x1]
    mov        r0,#0x11
    strb       r0,[r6,#0x1c]
    add        r1,r6,#0x0
    add        r1,#0x41
    mov        r0,#0x2
    strb       r0,[r1,#0x0]
    add        r1,#0x1b
    mov        r0,#0x22
    strb       r0,[r1,#0x0]
    add        r1,#0x25
    mov        r0,#0x3
    strb       r0,[r1,#0x0]
    add        r1,#0x1b
    mov        r0,#0x44
    strb       r0,[r1,#0x0]
    add        r1,#0x24
    mov        r0,#0x4
    strb       r0,[r1,#0x1]
    mov        r0,#0x88
    strb       r0,[r1,#0x1c]
    str        r7,[r5,#0x0]
LAB_0809cecc:
    add        sp,#0x4
    pop        {r4,r5,r6,r7}
    pop        {r0}
    bx         r0

PTR_REG_SOUNDCNT_X_0809ced4:
    .word REG_SOUNDCNT_X

PTR_REG_NR50_0809ced8:
    .word REG_NR50

PTR_REG_NR12_0809cedc:
    .word REG_NR12

PTR_REG_NR30_0809cee0:
    .word REG_NR30

USHORT_0809cee4:
    .short 0xFF77

    .align 2, 0


PTR_ptrSoundInfo_0809cee8:
    .word 0x3007FF0

soundMagic_9ceec:
    .word 0x68736D53

PTR_gMPlayJumpTable_0809cef0:
    .word 0x3005AC0

PTR_ply_memacc_0809cef4:
    .word ply_memacc

PTR_ply_lfos_0809cef8:
    .word ply_lfos

PTR_ply_mod_0809cefc:
    .word ply_mod

PTR_ply_xcmd_0809cf00:
    .word ply_xcmd

PTR_ply_endtie_0809cf04:
    .word ply_endtie

PTR_SampleFreqSet_0809cf08:
    .word SampleFreqSet

PTR_TrackStop_0809cf0c:
    .word TrackStop

PTR_FadeOutBody_0809cf10:
    .word FadeOutBody

PTR_TrkVolPitSet_0809cf14:
    .word TrkVolPitSet

PTR_CgbSound_0809cf18:
    .word CgbSound

PTR_CgbOscOff_0809cf1c:
    .word CgbOscOff

PTR_MidiKeyToCgbFreq_0809cf20:
    .word MidiKeyToCgbFreq

DAT_0809cf24:
    .word 0x0

INT_0809cf28:
    .word 0x5000040


_ts MusicPlayerJumpTableCopy
    svc        #0x2a
    bx         lr


_ts ClearSoundChannelTracks
    push       {lr}
    ldr        r1,PTR_gMPlayJumpTable_0809cf40
    ldr        r1,[r1,#0x0]
    bl         Call_R1_9E100
    pop        {r0}
    bx         r0

    .align 2, 0


PTR_gMPlayJumpTable_0809cf40:
    .word 0x3005B48


_ts InitializeMusicPlayerTrack
    push       {lr}
    ldr        r1,PTR_gMPlayJumpTable_0809cf54
    ldr        r1,[r1,#0x0]
    bl         Call_R1_9E100
    pop        {r0}
    bx         r0

    .align 2, 0


PTR_gMPlayJumpTable_0809cf54:
    .word 0x3005B4C


_ts SoundInit
    push       {r4,lr}
    sub        sp,#0x4
    add        r4,r0,#0x0
    mov        r3,#0x0
    str        r3,[r4,#0x0]
    @@ Turn off DMA1 and DMA2
    ldr        r0,dma1Control
    strh       r3,[r0,#0x0]
    add        r0,#0xc
    strh       r3,[r0,#0x0]
    @@ Turn on all sound channels, enable FIFO
    ldr        r1,soundControlAll
    mov        r0,#0x8f
    strh       r0,[r1,#0x0]
    @@ Set all volume to 100%, set Sound A to right and Sound B to left, and reset FIFO for both
    sub        r1,#0x2
    ldr        r2,uint32_t_0809cfec
    add        r0,r2,#0x0
    strh       r0,[r1,#0x0]
    ldr        r2,PTR_REG_SOUNDBIAS_H_0809cff0
    ldrb       r1,[r2,#0x0]
    mov        r0,#0x3f
    and        r0,r1
    mov        r1,#0x40
    orr        r0,r1
    strb       r0,[r2,#0x0]
    ldr        r1,PTR_REG_DMA1_0809cff4
    mov        r2,#0xd4
    lsl        r2,r2,#0x2
    add        r0,r4,r2
    str        r0,[r1,#0x0]
    add        r1,#0x4
    ldr        r0,PTR_REG_FIFO_A_0809cff8
    str        r0,[r1,#0x0]
    add        r1,#0x8
    mov        r2,#0x98
    lsl        r2,r2,#0x4
    add        r0,r4,r2
    str        r0,[r1,#0x0]
    add        r1,#0x4
    ldr        r0,PTR_REG_FIFO_B_0809cffc
    str        r0,[r1,#0x0]
    ldr        r0,PTR_ptrSoundInfo_0809d000
    str        r4,[r0,#0x0]
    str        r3,[sp,#0x0]
    ldr        r2,DWORD_0809d004
    mov        r0,sp
    add        r1,r4,#0x0
    bl         SWI_CpuSet
    mov        r0,#0x8
    strb       r0,[r4,#0x6]
    mov        r0,#0xf
    strb       r0,[r4,#0x7]
    ldr        r0,PTR_ply_note_0809d008
    str        r0,[r4,#0x38]
    ldr        r0,PTR_dummy_9DF4C_0809d00c
    str        r0,[r4,#0x28]
    str        r0,[r4,#0x2c]
    str        r0,[r4,#0x30]
    str        r0,[r4,#0x3c]
    ldr        r0,PTR_gMPlayJumpTableTemplate_0809d010
    str        r0,[r4,#0x34]
    mov        r0,#0x80
    lsl        r0,r0,#0xb
    bl         SampleFreqSet
    ldr        r0,soundMagic_9d014
    str        r0,[r4,#0x0]
    add        sp,#0x4
    pop        {r4}
    pop        {r0}
    bx         r0

dma1Control:
    .word 0x40000C6

soundControlAll:
    .word REG_SOUNDCNT_X

uint32_t_0809cfec:
    .word 0xA90E

PTR_REG_SOUNDBIAS_H_0809cff0:
    .word REG_SOUNDBIAS_H

PTR_REG_DMA1_0809cff4:
    .word REG_DMA1

PTR_REG_FIFO_A_0809cff8:
    .word REG_FIFO_A

PTR_REG_FIFO_B_0809cffc:
    .word REG_FIFO_B

PTR_ptrSoundInfo_0809d000:
    .word 0x3007FF0

DWORD_0809d004:
    .byte 0xEC, 0x03, 0x00, 0x05

PTR_ply_note_0809d008:
    .word ply_note

PTR_dummy_9DF4C_0809d00c:
    .word dummy_9DF4C

PTR_gMPlayJumpTableTemplate_0809d010:
    .word gMPlayJumpTableTemplate

soundMagic_9d014:
    .word 0x68736D53


_ts SampleFreqSet
    push       {r4,r5,r6,lr}
    add        r2,r0,#0x0
    ldr        r0,PTR_ptrSoundInfo_0809d098
    ldr        r4,[r0,#0x0]
    mov        r0,#0xf0
    lsl        r0,r0,#0xc
    and        r0,r2
    lsr        r2,r0,#0x10
    mov        r6,#0x0
    strb       r2,[r4,#0x8]
    ldr        r1,PTR_gPcmSamplesPerVBlankTable_0809d09c
    sub        r0,r2,#0x1
    lsl        r0,r0,#0x1
    add        r0,r0,r1
    ldrh       r5,[r0,#0x0]
    str        r5,[r4,#0x10]
    mov        r0,#0xc6
    lsl        r0,r0,#0x3
    add        r1,r5,#0x0
    bl         div
    strb       r0,[r4,#0xb]
    ldr        r0,INT_0809d0a0
    mul        r0,r5
    ldr        r1,INT_0809d0a4
    add        r0,r0,r1
    ldr        r1,INT_0809d0a8
    bl         div
    add        r1,r0,#0x0
    str        r1,[r4,#0x14]
    mov        r0,#0x80
    lsl        r0,r0,#0x11
    bl         div
    add        r0,#0x1
    asr        r0,r0,#0x1
    str        r0,[r4,#0x18]
    ldr        r0,PTR_REG_TM0CNT_H_0809d0ac
    strh       r6,[r0,#0x0]
    ldr        r4,PTR_REG_TM0CNT_L_0809d0b0
    ldr        r0,INT_0809d0b4
    add        r1,r5,#0x0
    bl         div
    neg        r0,r0
    strh       r0,[r4,#0x0]
    bl         m4aSoundVSyncOn
    @@ Wait for the very start of Vblank
    ldr        r1,PTR_REG_VCOUNT_0809d0b8
.waitForVblank:
    ldrb       r0,[r1,#0x0]
    cmp        r0,#0x9f
    beq        .waitForVblank
    ldr        r1,PTR_REG_VCOUNT_0809d0b8
LAB_0809d084:
    ldrb       r0,[r1,#0x0]
    cmp        r0,#0x9f
    bne        LAB_0809d084
    @@ Start TIMER0
    ldr        r1,PTR_REG_TM0CNT_H_0809d0ac
    mov        r0,#0x80
    strh       r0,[r1,#0x0]
    pop        {r4,r5,r6}
    pop        {r0}
    bx         r0

    .align 2, 0


PTR_ptrSoundInfo_0809d098:
    .word 0x3007FF0

PTR_gPcmSamplesPerVBlankTable_0809d09c:
    .word gPcmSamplesPerVBlankTable

INT_0809d0a0:
    .word 0x91D1B

INT_0809d0a4:
    .word 0x1388

INT_0809d0a8:
    .word 0x2710

PTR_REG_TM0CNT_H_0809d0ac:
    .word REG_TM0CNT_H

PTR_REG_TM0CNT_L_0809d0b0:
    .word REG_TM0CNT_L

INT_0809d0b4:
    .word 0x44940

PTR_REG_VCOUNT_0809d0b8:
    .word REG_VCOUNT


_ts m4aSoundMode
    push       {r4,r5,lr}
    add        r3,r0,#0x0
    ldr        r0,PTR_ptrSoundInfo_0809d148
    ldr        r5,[r0,#0x0]
    ldr        r1,[r5,#0x0]
    ldr        r0,soundMagic_9d14c
    cmp        r1,r0
    bne        LAB_0809d142
    add        r0,r1,#0x1
    str        r0,[r5,#0x0]
    mov        r4,#0xff
    and        r4,r3
    cmp        r4,#0x0
    beq        LAB_0809d0de
    mov        r0,#0x7f
    and        r4,r0
    strb       r4,[r5,#0x5]
LAB_0809d0de:
    mov        r4,#0xf0
    lsl        r4,r4,#0x4
    and        r4,r3
    cmp        r4,#0x0
    beq        LAB_0809d0fe
    lsr        r0,r4,#0x8
    strb       r0,[r5,#0x6]
    mov        r4,#0xc
    add        r0,r5,#0x0
    add        r0,#0x50
    mov        r1,#0x0
LAB_0809d0f4:
    strb       r1,[r0,#0x0]
    sub        r4,#0x1
    add        r0,#0x40
    cmp        r4,#0x0
    bne        LAB_0809d0f4
LAB_0809d0fe:
    mov        r4,#0xf0
    lsl        r4,r4,#0x8
    and        r4,r3
    cmp        r4,#0x0
    beq        LAB_0809d10c
    lsr        r0,r4,#0xc
    strb       r0,[r5,#0x7]
LAB_0809d10c:
    mov        r4,#0xb0
    lsl        r4,r4,#0x10
    and        r4,r3
    cmp        r4,#0x0
    beq        LAB_0809d12a
    mov        r0,#0xc0
    lsl        r0,r0,#0xe
    and        r0,r4
    lsr        r4,r0,#0xe
    ldr        r2,PTR_REG_SOUNDBIAS_H_0809d150
    ldrb       r1,[r2,#0x0]
    mov        r0,#0x3f
    and        r0,r1
    orr        r0,r4
    strb       r0,[r2,#0x0]
LAB_0809d12a:
    mov        r4,#0xf0
    lsl        r4,r4,#0xc
    and        r4,r3
    cmp        r4,#0x0
    beq        LAB_0809d13e
    bl         m4aSoundVSyncOff
    add        r0,r4,#0x0
    bl         SampleFreqSet
LAB_0809d13e:
    ldr        r0,soundMagic_9d14c
    str        r0,[r5,#0x0]
LAB_0809d142:
    pop        {r4,r5}
    pop        {r0}
    bx         r0

PTR_ptrSoundInfo_0809d148:
    .word 0x3007FF0

soundMagic_9d14c:
    .word 0x68736D53

PTR_REG_SOUNDBIAS_H_0809d150:
    .word REG_SOUNDBIAS_H


_ts SoundClear
    push       {r4,r5,r6,r7,lr}
    ldr        r0,PTR_ptrSoundInfo_0809d1a0
    ldr        r6,[r0,#0x0]
    ldr        r1,[r6,#0x0]
    ldr        r0,soundMagic_9d1a4
    cmp        r1,r0
    bne        LAB_0809d19a
    add        r0,r1,#0x1
    str        r0,[r6,#0x0]
    mov        r5,#0xc
    add        r4,r6,#0x0
    add        r4,#0x50
    mov        r0,#0x0
LAB_0809d16e:
    strb       r0,[r4,#0x0]
    sub        r5,#0x1
    add        r4,#0x40
    cmp        r5,#0x0
    bgt        LAB_0809d16e
    ldr        r4,[r6,#0x1c]
    cmp        r4,#0x0
    beq        LAB_0809d196
    mov        r5,#0x1
    mov        r7,#0x0
LAB_0809d182:
    lsl        r0,r5,#0x18
    lsr        r0,r0,#0x18
    ldr        r1,[r6,#0x2c]
    bl         Call_R1_9E100
    strb       r7,[r4,#0x0]
    add        r5,#0x1
    add        r4,#0x40
    cmp        r5,#0x4
    ble        LAB_0809d182
LAB_0809d196:
    ldr        r0,soundMagic_9d1a4
    str        r0,[r6,#0x0]
LAB_0809d19a:
    pop        {r4,r5,r6,r7}
    pop        {r0}
    bx         r0

PTR_ptrSoundInfo_0809d1a0:
    .word 0x3007FF0

soundMagic_9d1a4:
    .word 0x68736D53


_ts m4aSoundVSyncOff
    push       {lr}
    sub        sp,#0x4
    ldr        r0,PTR_ptrSoundInfo_0809d1e4
    ldr        r2,[r0,#0x0]
    ldr        r1,[r2,#0x0]
    ldr        r3,DAT_0809d1e8
    add        r0,r1,r3
    cmp        r0,#0x1
    bhi        LAB_0809d1dc
    add        r0,r1,#0x0
    add        r0,#0xa
    str        r0,[r2,#0x0]
    ldr        r0,PTR_REG_DMA1_control_0809d1ec
    mov        r1,#0x0
    strh       r1,[r0,#0x0]
    add        r0,#0xc
    strh       r1,[r0,#0x0]
    mov        r0,#0x0
    str        r0,[sp,#0x0]
    mov        r0,#0xd4
    lsl        r0,r0,#0x2
    add        r1,r2,r0
    ldr        r2,UINT_0809d1f0
    mov        r0,sp
    bl         SWI_CpuSet
LAB_0809d1dc:
    add        sp,#0x4
    pop        {r0}
    bx         r0

    .align 2, 0


PTR_ptrSoundInfo_0809d1e4:
    .word 0x3007FF0

DAT_0809d1e8:
    .word 0x978C92AD

PTR_REG_DMA1_control_0809d1ec:
    .word 0x40000C6

UINT_0809d1f0:
    .word 0x5000318


_ts m4aSoundVSyncOn
    push       {r4,lr}
    ldr        r0,PTR_ptrSoundInfo_0809d224
    ldr        r2,[r0,#0x0]
    ldr        r3,[r2,#0x0]
    ldr        r0,soundMagic_9d228
    cmp        r3,r0
    beq        LAB_0809d21c
    ldr        r0,PTR_REG_DMA1_control_0809d22c
    @@ Set DMA1 and DMA2 to trigger a 32-bit transfer every HBLANK until stopped manually
    mov        r4,#0xb6
    lsl        r4,r4,#0x8
    add        r1,r4,#0x0
    strh       r1,[r0,#0x0]
    add        r0,#0xc
    strh       r1,[r0,#0x0]
    ldrb       r0,[r2,#0x4]
    mov        r0,#0x0
    strb       r0,[r2,#0x4]
    add        r0,r3,#0x0
    sub        r0,#0xa
    str        r0,[r2,#0x0]
LAB_0809d21c:
    pop        {r4}
    pop        {r0}
    bx         r0

    .align 2, 0


PTR_ptrSoundInfo_0809d224:
    .word 0x3007FF0

soundMagic_9d228:
    .word 0x68736D53

PTR_REG_DMA1_control_0809d22c:
    .word 0x40000C6


_ts MPlayOpen
    push       {r4,r5,r6,r7,lr}
    add        r7,r0,#0x0
    add        r6,r1,#0x0
    lsl        r2,r2,#0x18
    lsr        r4,r2,#0x18
    cmp        r4,#0x0
    beq        LAB_0809d294
    cmp        r4,#0x10
    bls        LAB_0809d244
    mov        r4,#0x10
LAB_0809d244:
    ldr        r0,PTR_ptrSoundInfo_0809d29c
    ldr        r5,[r0,#0x0]
    ldr        r1,[r5,#0x0]
    ldr        r0,soundMagic_9d2a0
    cmp        r1,r0
    bne        LAB_0809d294
    add        r0,r1,#0x1
    str        r0,[r5,#0x0]
    add        r0,r7,#0x0
    bl         InitializeMusicPlayerTrack
    str        r6,[r7,#0x2c]
    strb       r4,[r7,#0x8]
    mov        r0,#0x80
    lsl        r0,r0,#0x18
    str        r0,[r7,#0x4]
    cmp        r4,#0x0
    beq        LAB_0809d278
    mov        r1,#0x0
LAB_0809d26a:
    strb       r1,[r6,#0x0]
    sub        r0,r4,#0x1
    lsl        r0,r0,#0x18
    lsr        r4,r0,#0x18
    add        r6,#0x50
    cmp        r4,#0x0
    bne        LAB_0809d26a
LAB_0809d278:
    ldr        r0,[r5,#0x20]
    cmp        r0,#0x0
    beq        LAB_0809d288
    str        r0,[r7,#0x38]
    ldr        r0,[r5,#0x24]
    str        r0,[r7,#0x3c]
    mov        r0,#0x0
    str        r0,[r5,#0x20]
LAB_0809d288:
    str        r7,[r5,#0x24]
    ldr        r0,PTR_MPlayMain_0809d2a4
    str        r0,[r5,#0x20]
    ldr        r0,soundMagic_9d2a0
    str        r0,[r5,#0x0]
    str        r0,[r7,#0x34]
LAB_0809d294:
    pop        {r4,r5,r6,r7}
    pop        {r0}
    bx         r0

    .align 2, 0


PTR_ptrSoundInfo_0809d29c:
    .word 0x3007FF0

soundMagic_9d2a0:
    .word 0x68736D53

PTR_MPlayMain_0809d2a4:
    .word MPlayMain


_ts MPlayStart
    push       {r4,r5,r6,r7,lr}
    mov        r7,r8
    push       {r7}
    add        r5,r0,#0x0
    add        r7,r1,#0x0
    ldr        r1,[r5,#0x34]
    ldr        r0,soundMagic_9d358
    cmp        r1,r0
    bne        LAB_0809d34e
    add        r0,r1,#0x1
    str        r0,[r5,#0x34]
    mov        r1,#0x0
    str        r1,[r5,#0x4]
    str        r7,[r5,#0x0]
    ldr        r0,[r7,#0x4]
    str        r0,[r5,#0x30]
    ldrb       r0,[r7,#0x2]
    strb       r0,[r5,#0x9]
    str        r1,[r5,#0xc]
    mov        r0,#0x96
    strh       r0,[r5,#0x1c]
    strh       r0,[r5,#0x20]
    add        r0,#0x6a
    strh       r0,[r5,#0x1e]
    strh       r1,[r5,#0x22]
    strh       r1,[r5,#0x24]
    mov        r6,#0x0
    ldr        r4,[r5,#0x2c]
    ldrb       r0,[r7,#0x0]
    cmp        r6,r0
    bge        LAB_0809d31a
    ldrb       r1,[r5,#0x8]
    cmp        r6,r1
    bge        LAB_0809d33a
    mov        r8,r6
LAB_0809d2ee:
    add        r0,r5,#0x0
    add        r1,r4,#0x0
    bl         TrackStop
    mov        r0,#0xc0
    strb       r0,[r4,#0x0]
    mov        r0,r8
    str        r0,[r4,#0x20]
    lsl        r1,r6,#0x2
    add        r0,r7,#0x0
    add        r0,#0x8
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    str        r0,[r4,#0x40]
    add        r6,#0x1
    add        r4,#0x50
    ldrb       r1,[r7,#0x0]
    cmp        r6,r1
    bge        LAB_0809d31a
    ldrb       r0,[r5,#0x8]
    cmp        r6,r0
    blt        LAB_0809d2ee
LAB_0809d31a:
    ldrb       r1,[r5,#0x8]
    cmp        r6,r1
    bge        LAB_0809d33a
    mov        r0,#0x0
    mov        r8,r0
LAB_0809d324:
    add        r0,r5,#0x0
    add        r1,r4,#0x0
    bl         TrackStop
    mov        r1,r8
    strb       r1,[r4,#0x0]
    add        r6,#0x1
    add        r4,#0x50
    ldrb       r0,[r5,#0x8]
    cmp        r6,r0
    blt        LAB_0809d324
LAB_0809d33a:
    mov        r0,#0x80
    ldrb       r1,[r7,#0x3]
    and        r0,r1
    cmp        r0,#0x0
    beq        LAB_0809d34a
    ldrb       r0,[r7,#0x3]
    bl         m4aSoundMode
LAB_0809d34a:
    ldr        r0,soundMagic_9d358
    str        r0,[r5,#0x34]
LAB_0809d34e:
    pop        {r3}
    mov        r8,r3
    pop        {r4,r5,r6,r7}
    pop        {r0}
    bx         r0

soundMagic_9d358:
    .word 0x68736D53


_ts m4aMPlayStop
    push       {r4,r5,r6,lr}
    add        r6,r0,#0x0
    ldr        r1,[r6,#0x34]
    ldr        r0,soundMagic_9d398
    cmp        r1,r0
    bne        LAB_0809d392
    add        r0,r1,#0x1
    str        r0,[r6,#0x34]
    ldr        r0,[r6,#0x4]
    mov        r1,#0x80
    lsl        r1,r1,#0x18
    orr        r0,r1
    str        r0,[r6,#0x4]
    ldrb       r4,[r6,#0x8]
    ldr        r5,[r6,#0x2c]
    cmp        r4,#0x0
    ble        LAB_0809d38e
LAB_0809d37e:
    add        r0,r6,#0x0
    add        r1,r5,#0x0
    bl         TrackStop
    sub        r4,#0x1
    add        r5,#0x50
    cmp        r4,#0x0
    bgt        LAB_0809d37e
LAB_0809d38e:
    ldr        r0,soundMagic_9d398
    str        r0,[r6,#0x34]
LAB_0809d392:
    pop        {r4,r5,r6}
    pop        {r0}
    bx         r0

soundMagic_9d398:
    .word 0x68736D53


_ts FadeOutBody
    push       {r4,r5,r6,r7,lr}
    add        r6,r0,#0x0
    ldrh       r2,[r6,#0x24]
    cmp        r2,#0x0
    beq        LAB_0809d416
    ldrh       r0,[r6,#0x26]
    sub        r0,#0x1
    strh       r0,[r6,#0x26]
    ldr        r3,DAT_0809d3e4
    add        r1,r3,#0x0
    lsl        r0,r0,#0x10
    cmp        r0,#0x0
    bne        LAB_0809d416
    ldrh       r0,[r6,#0x28]
    sub        r0,#0x10
    strh       r0,[r6,#0x28]
    and        r0,r1
    lsl        r0,r0,#0x10
    cmp        r0,#0x0
    bgt        LAB_0809d3e8
    ldrb       r5,[r6,#0x8]
    ldr        r4,[r6,#0x2c]
    cmp        r5,#0x0
    ble        LAB_0809d416
    mov        r7,#0x0
LAB_0809d3ce:
    add        r0,r6,#0x0
    add        r1,r4,#0x0
    bl         TrackStop
    strb       r7,[r4,#0x0]
    sub        r5,#0x1
    add        r4,#0x50
    cmp        r5,#0x0
    bgt        LAB_0809d3ce
    b          LAB_0809d416

    .align 2, 0


DAT_0809d3e4:
    .word 0xFFFF
LAB_0809d3e8:
    strh       r2,[r6,#0x26]
    ldrb       r5,[r6,#0x8]
    ldr        r4,[r6,#0x2c]
    cmp        r5,#0x0
    ble        LAB_0809d416
    mov        r3,#0x80
    mov        r7,#0x0
    mov        r2,#0x3
LAB_0809d3f8:
    ldrb       r1,[r4,#0x0]
    add        r0,r3,#0x0
    and        r0,r1
    cmp        r0,#0x0
    beq        LAB_0809d40e
    ldrh       r7,[r6,#0x28]
    lsr        r0,r7,#0x2
    strb       r0,[r4,#0x13]
    add        r0,r1,#0x0
    orr        r0,r2
    strb       r0,[r4,#0x0]
LAB_0809d40e:
    sub        r5,#0x1
    add        r4,#0x50
    cmp        r5,#0x0
    bgt        LAB_0809d3f8
LAB_0809d416:
    pop        {r4,r5,r6,r7}
    pop        {r0}
    bx         r0


_ts TrkVolPitSet
    push       {r4,lr}
    add        r2,r1,#0x0
    mov        r0,#0x1
    ldrb       r1,[r2,#0x0]
    and        r0,r1
    cmp        r0,#0x0
    beq        LAB_0809d494
    ldrb       r3,[r2,#0x13]
    ldrb       r1,[r2,#0x12]
    add        r0,r3,#0x0
    mul        r0,r1
    lsr        r3,r0,#0x5
    ldrb       r4,[r2,#0x18]
    cmp        r4,#0x1
    bne        LAB_0809d444
    mov        r0,#0x16
    ldrsb      r0,[r2,r0]
    add        r0,#0x80
    mul        r0,r3
    lsr        r3,r0,#0x7
LAB_0809d444:
    mov        r0,#0x14
    ldrsb      r0,[r2,r0]
    lsl        r0,r0,#0x1
    mov        r1,#0x15
    ldrsb      r1,[r2,r1]
    add        r1,r0,r1
    cmp        r4,#0x2
    bne        LAB_0809d45a
    mov        r0,#0x16
    ldrsb      r0,[r2,r0]
    add        r1,r1,r0
LAB_0809d45a:
    mov        r0,#0x80
    neg        r0,r0
    cmp        r1,r0
    bge        LAB_0809d466
    add        r1,r0,#0x0
    b          LAB_0809d46c
LAB_0809d466:
    cmp        r1,#0x7f
    ble        LAB_0809d46c
    mov        r1,#0x7f
LAB_0809d46c:
    add        r0,r1,#0x0
    add        r0,#0x80
    mul        r0,r3
    lsr        r0,r0,#0x8
    lsl        r0,r0,#0x18
    lsr        r0,r0,#0x18
    cmp        r0,#0xff
    bls        LAB_0809d47e
    mov        r0,#0xff
LAB_0809d47e:
    strb       r0,[r2,#0x10]
    mov        r0,#0x7f
    sub        r0,r0,r1
    mul        r0,r3
    lsr        r0,r0,#0x8
    lsl        r0,r0,#0x18
    lsr        r0,r0,#0x18
    cmp        r0,#0xff
    bls        LAB_0809d492
    mov        r0,#0xff
LAB_0809d492:
    strb       r0,[r2,#0x11]
LAB_0809d494:
    ldrb       r1,[r2,#0x0]
    mov        r0,#0x4
    and        r0,r1
    add        r3,r1,#0x0
    cmp        r0,#0x0
    beq        LAB_0809d4d8
    mov        r0,#0xe
    ldrsb      r0,[r2,r0]
    ldrb       r1,[r2,#0xf]
    mul        r0,r1
    mov        r1,#0xc
    ldrsb      r1,[r2,r1]
    add        r1,r1,r0
    lsl        r1,r1,#0x2
    mov        r0,#0xa
    ldrsb      r0,[r2,r0]
    lsl        r0,r0,#0x8
    add        r1,r1,r0
    mov        r0,#0xb
    ldrsb      r0,[r2,r0]
    lsl        r0,r0,#0x8
    add        r1,r1,r0
    ldrb       r0,[r2,#0xd]
    add        r1,r0,r1
    ldrb       r0,[r2,#0x18]
    cmp        r0,#0x0
    bne        LAB_0809d4d2
    mov        r0,#0x16
    ldrsb      r0,[r2,r0]
    lsl        r0,r0,#0x4
    add        r1,r1,r0
LAB_0809d4d2:
    asr        r0,r1,#0x8
    strb       r0,[r2,#0x8]
    strb       r1,[r2,#0x9]
LAB_0809d4d8:
    mov        r0,#0xfa
    and        r0,r3
    strb       r0,[r2,#0x0]
    pop        {r4}
    pop        {r0}
    bx         r0


_ts MidiKeyToCgbFreq
    push       {r4,r5,r6,r7,lr}
    lsl        r0,r0,#0x18
    lsr        r0,r0,#0x18
    lsl        r1,r1,#0x18
    lsr        r5,r1,#0x18
    lsl        r2,r2,#0x18
    lsr        r2,r2,#0x18
    mov        r12,r2
    cmp        r0,#0x4
    bne        LAB_0809d51c
    cmp        r5,#0x14
    bhi        LAB_0809d500
    mov        r5,#0x0
    b          LAB_0809d50e
LAB_0809d500:
    add        r0,r5,#0x0
    sub        r0,#0x15
    lsl        r0,r0,#0x18
    lsr        r5,r0,#0x18
    cmp        r5,#0x3b
    bls        LAB_0809d50e
    mov        r5,#0x3b
LAB_0809d50e:
    ldr        r0,PTR_gNoiseTable_0809d518
    add        r0,r5,r0
    ldrb       r0,[r0,#0x0]
    b          LAB_0809d57e

    .align 2, 0


PTR_gNoiseTable_0809d518:
    .word gNoiseTable
LAB_0809d51c:
    cmp        r5,#0x23
    bhi        LAB_0809d528
    mov        r0,#0x0
    mov        r12,r0
    mov        r5,#0x0
    b          LAB_0809d53a
LAB_0809d528:
    add        r0,r5,#0x0
    sub        r0,#0x24
    lsl        r0,r0,#0x18
    lsr        r5,r0,#0x18
    cmp        r5,#0x82
    bls        LAB_0809d53a
    mov        r5,#0x82
    mov        r1,#0xff
    mov        r12,r1
LAB_0809d53a:
    ldr        r3,PTR_gCgbScaleTable_0809d584
    add        r0,r5,r3
    ldrb       r6,[r0,#0x0]
    ldr        r4,PTR_gCgbFreqTable_0809d588
    mov        r2,#0xf
    add        r0,r6,#0x0
    and        r0,r2
    lsl        r0,r0,#0x1
    add        r0,r0,r4
    mov        r7,#0x0
    ldrsh      r1,[r0,r7]
    asr        r0,r6,#0x4
    add        r6,r1,#0x0
    asr        r6,r0
    add        r0,r5,#0x1
    add        r0,r0,r3
    ldrb       r1,[r0,#0x0]
    add        r0,r1,#0x0
    and        r0,r2
    lsl        r0,r0,#0x1
    add        r0,r0,r4
    mov        r2,#0x0
    ldrsh      r0,[r0,r2]
    asr        r1,r1,#0x4
    asr        r0,r1
    sub        r0,r0,r6
    mov        r7,r12
    mul        r7,r0
    add        r0,r7,#0x0
    asr        r0,r0,#0x8
    add        r0,r6,r0
    mov        r1,#0x80
    lsl        r1,r1,#0x4
    add        r0,r0,r1
LAB_0809d57e:
    pop        {r4,r5,r6,r7}
    pop        {r1}
    bx         r1

PTR_gCgbScaleTable_0809d584:
    .word gCgbScaleTable

PTR_gCgbFreqTable_0809d588:
    .word gCgbFreqTable


_ts CgbOscOff
    lsl        r0,r0,#0x18
    lsr        r0,r0,#0x18
    add        r1,r0,#0x0
    cmp        r0,#0x2
    beq        LAB_0809d5b4
    cmp        r0,#0x2
    bgt        LAB_0809d5a0
    cmp        r0,#0x1
    beq        LAB_0809d5a6
    b          LAB_0809d5c8
LAB_0809d5a0:
    cmp        r1,#0x3
    beq        LAB_0809d5bc
    b          LAB_0809d5c8
LAB_0809d5a6:
    ldr        r1,PTR_REG_NR12_0809d5b0
    mov        r0,#0x8
    strb       r0,[r1,#0x0]
    add        r1,#0x2
    b          LAB_0809d5d0

PTR_REG_NR12_0809d5b0:
    .word REG_NR12
LAB_0809d5b4:
    ldr        r1,PTR_REG_NR22_0809d5b8
    b          LAB_0809d5ca

PTR_REG_NR22_0809d5b8:
    .word REG_NR22
LAB_0809d5bc:
    ldr        r1,PTR_REG_NR30_0809d5c4
    mov        r0,#0x0
    b          LAB_0809d5d2

    .align 2, 0


PTR_REG_NR30_0809d5c4:
    .word REG_NR30
LAB_0809d5c8:
    ldr        r1,PTR_REG_NR42_0809d5d8
LAB_0809d5ca:
    mov        r0,#0x8
    strb       r0,[r1,#0x0]
    add        r1,#0x4
LAB_0809d5d0:
    mov        r0,#0x80
LAB_0809d5d2:
    strb       r0,[r1,#0x0]
    bx         lr

    .align 2, 0


PTR_REG_NR42_0809d5d8:
    .word REG_NR42


_ts CgbModVol
    push       {r4,lr}
    add        r1,r0,#0x0
    ldrb       r0,[r1,#0x2]
    lsl        r2,r0,#0x18
    lsr        r4,r2,#0x18
    ldrb       r3,[r1,#0x3]
    lsl        r0,r3,#0x18
    lsr        r3,r0,#0x18
    cmp        r4,r3
    bcc        LAB_0809d5fc
    lsr        r0,r2,#0x19
    cmp        r0,r3
    bcc        LAB_0809d608
    mov        r0,#0xf
    strb       r0,[r1,#0x1b]
    b          LAB_0809d616
LAB_0809d5fc:
    lsr        r0,r0,#0x19
    cmp        r0,r4
    bcc        LAB_0809d608
    mov        r0,#0xf0
    strb       r0,[r1,#0x1b]
    b          LAB_0809d616
LAB_0809d608:
    mov        r0,#0xff
    strb       r0,[r1,#0x1b]
    ldrb       r2,[r1,#0x3]
    ldrb       r3,[r1,#0x2]
    add        r0,r2,r3
    lsr        r0,r0,#0x4
    b          LAB_0809d626
LAB_0809d616:
    ldrb       r2,[r1,#0x3]
    ldrb       r3,[r1,#0x2]
    add        r0,r2,r3
    lsr        r0,r0,#0x4
    strb       r0,[r1,#0xa]
    cmp        r0,#0xf
    bls        LAB_0809d628
    mov        r0,#0xf
LAB_0809d626:
    strb       r0,[r1,#0xa]
LAB_0809d628:
    ldrb       r2,[r1,#0x6]
    ldrb       r3,[r1,#0xa]
    add        r0,r2,#0x0
    mul        r0,r3
    add        r0,#0xf
    asr        r0,r0,#0x4
    strb       r0,[r1,#0x19]
    ldrb       r0,[r1,#0x1c]
    ldrb       r2,[r1,#0x1b]
    and        r0,r2
    strb       r0,[r1,#0x1b]
    pop        {r4}
    pop        {r0}
    bx         r0


_ts CgbSound
    push       {r4,r5,r6,r7,lr}
    mov        r7,r10
    mov        r6,r9
    mov        r5,r8
    push       {r5,r6,r7}
    sub        sp,#0x18
    ldr        r0,PTR_ptrSoundInfo_0809d664
    ldr        r0,[r0,#0x0]
    str        r0,[sp,#0x4]
    ldrb       r0,[r0,#0xa]
    cmp        r0,#0x0
    beq        LAB_0809d668
    sub        r0,#0x1
    ldr        r1,[sp,#0x4]
    strb       r0,[r1,#0xa]
    b          LAB_0809d66e

PTR_ptrSoundInfo_0809d664:
    .word 0x3007FF0
LAB_0809d668:
    mov        r0,#0xe
    ldr        r2,[sp,#0x4]
    strb       r0,[r2,#0xa]
LAB_0809d66e:
    mov        r6,#0x1
    ldr        r0,[sp,#0x4]
    ldr        r4,[r0,#0x1c]
LAB_0809d674:
    ldrb       r1,[r4,#0x0]
    mov        r0,#0xc7
    and        r0,r1
    add        r2,r6,#0x1
    mov        r9,r2
    mov        r2,#0x40
    add        r2,r2,r4
    mov        r8,r2
    cmp        r0,#0x0
    bne        LAB_0809d68a
    b          LAB_0809da44
LAB_0809d68a:
    cmp        r6,#0x2
    beq        LAB_0809d6bc
    cmp        r6,#0x2
    bgt        LAB_0809d698
    cmp        r6,#0x1
    beq        LAB_0809d69e
    b          LAB_0809d6f4
LAB_0809d698:
    cmp        r6,#0x3
    beq        LAB_0809d6d4
    b          LAB_0809d6f4
LAB_0809d69e:
    ldr        r0,PTR_REG_NR10_0809d6b0
    str        r0,[sp,#0x8]
    ldr        r7,PTR_REG_NR11_0809d6b4
    ldr        r2,PTR_REG_NR12_0809d6b8
    mov        r10,r2
    add        r0,#0x4
    str        r0,[sp,#0xc]
    add        r2,#0x2
    b          LAB_0809d704

PTR_REG_NR10_0809d6b0:
    .word REG_NR10

PTR_REG_NR11_0809d6b4:
    .word REG_NR11

PTR_REG_NR12_0809d6b8:
    .word REG_NR12
LAB_0809d6bc:
    ldr        r0,PTR_DAT_0809d6c8
    str        r0,[sp,#0x8]
    ldr        r7,PTR_REG_NR21_0809d6cc
    ldr        r2,PTR_REG_NR22_0809d6d0
    b          LAB_0809d6fc

    .align 2, 0


PTR_DAT_0809d6c8:
    .word REG_NR10+1

PTR_REG_NR21_0809d6cc:
    .word REG_NR21

PTR_REG_NR22_0809d6d0:
    .word REG_NR22
LAB_0809d6d4:
    ldr        r0,PTR_REG_NR30_0809d6e8
    str        r0,[sp,#0x8]
    ldr        r7,PTR_REG_NR31_0809d6ec
    ldr        r2,PTR_REG_NR32_0809d6f0
    mov        r10,r2
    add        r0,#0x4
    str        r0,[sp,#0xc]
    add        r2,#0x2
    b          LAB_0809d704

    .align 2, 0


PTR_REG_NR30_0809d6e8:
    .word REG_NR30

PTR_REG_NR31_0809d6ec:
    .word REG_NR31

PTR_REG_NR32_0809d6f0:
    .word REG_NR32
LAB_0809d6f4:
    ldr        r0,PTR_BYTE_0809d74c
    str        r0,[sp,#0x8]
    ldr        r7,PTR_REG_NR41_0809d750
    ldr        r2,PTR_REG_NR42_0809d754
LAB_0809d6fc:
    mov        r10,r2
    add        r0,#0xb
    str        r0,[sp,#0xc]
    add        r2,#0x4
LAB_0809d704:
    str        r2,[sp,#0x10]
    ldr        r0,[sp,#0x4]
    ldrb       r0,[r0,#0xa]
    str        r0,[sp,#0x0]
    add        r2,r1,#0x0
    mov        r0,#0x80
    and        r0,r2
    cmp        r0,#0x0
    beq        LAB_0809d7f4
    mov        r3,#0x40
    add        r0,r3,#0x0
    and        r0,r2
    lsl        r0,r0,#0x18
    lsr        r5,r0,#0x18
    add        r1,r6,#0x1
    mov        r9,r1
    mov        r2,#0x40
    add        r2,r2,r4
    mov        r8,r2
    cmp        r5,#0x0
    bne        LAB_0809d818
    mov        r0,#0x3
    strb       r0,[r4,#0x0]
    strb       r0,[r4,#0x1d]
    add        r0,r4,#0x0
    str        r3,[sp,#0x14]
    bl         CgbModVol
    ldr        r3,[sp,#0x14]
    cmp        r6,#0x2
    beq        LAB_0809d764
    cmp        r6,#0x2
    bgt        LAB_0809d758
    cmp        r6,#0x1
    beq        LAB_0809d75e
    b          LAB_0809d7b8

PTR_BYTE_0809d74c:
    .word REG_NR30+1

PTR_REG_NR41_0809d750:
    .word REG_NR41

PTR_REG_NR42_0809d754:
    .word REG_NR42
LAB_0809d758:
    cmp        r6,#0x3
    beq        LAB_0809d770
    b          LAB_0809d7b8
LAB_0809d75e:
    ldrb       r0,[r4,#0x1f]
    ldr        r1,[sp,#0x8]
    strb       r0,[r1,#0x0]
LAB_0809d764:
    ldr        r0,[r4,#0x24]
    lsl        r0,r0,#0x6
    ldrb       r2,[r4,#0x1e]
    add        r0,r2,r0
    strb       r0,[r7,#0x0]
    b          LAB_0809d7c4
LAB_0809d770:
    ldr        r1,[r4,#0x24]
    ldr        r0,[r4,#0x28]
    cmp        r1,r0
    beq        LAB_0809d798
    ldr        r0,[sp,#0x8]
    strb       r3,[r0,#0x0]
    ldr        r1,PTR_REG_WAVERAM0_0809d7ac
    ldr        r2,[r4,#0x24]
    ldr        r0,[r2,#0x0]
    str        r0,[r1,#0x0]
    add        r1,#0x4
    ldr        r0,[r2,#0x4]
    str        r0,[r1,#0x0]
    add        r1,#0x4
    ldr        r0,[r2,#0x8]
    str        r0,[r1,#0x0]
    add        r1,#0x4
    ldr        r0,[r2,#0xc]
    str        r0,[r1,#0x0]
    str        r2,[r4,#0x28]
LAB_0809d798:
    ldr        r1,[sp,#0x8]
    strb       r5,[r1,#0x0]
    ldrb       r0,[r4,#0x1e]
    strb       r0,[r7,#0x0]
    ldrb       r0,[r4,#0x1e]
    cmp        r0,#0x0
    beq        LAB_0809d7b0
    mov        r0,#0xc0
    b          LAB_0809d7d4

    .align 2, 0


PTR_REG_WAVERAM0_0809d7ac:
    .word REG_WAVE_RAM0
LAB_0809d7b0:
    mov        r2,#0x80
    neg        r2,r2
    strb       r2,[r4,#0x1a]
    b          LAB_0809d7d6
LAB_0809d7b8:
    ldrb       r0,[r4,#0x1e]
    strb       r0,[r7,#0x0]
    ldr        r0,[r4,#0x24]
    lsl        r0,r0,#0x3
    ldr        r1,[sp,#0xc]
    strb       r0,[r1,#0x0]
LAB_0809d7c4:
    ldrb       r0,[r4,#0x4]
    add        r0,#0x8
    mov        r2,r10
    strb       r0,[r2,#0x0]
    ldrb       r0,[r4,#0x1e]
    cmp        r0,#0x0
    beq        LAB_0809d7d4
    mov        r0,#0x40
LAB_0809d7d4:
    strb       r0,[r4,#0x1a]
LAB_0809d7d6:
    ldrb       r1,[r4,#0x4]
    mov        r2,#0x0
    strb       r1,[r4,#0xb]
    mov        r0,#0xff
    and        r0,r1
    add        r1,r6,#0x1
    mov        r9,r1
    mov        r1,#0x40
    add        r1,r1,r4
    mov        r8,r1
    cmp        r0,#0x0
    bne        LAB_0809d7f0
    b          LAB_0809d91e
LAB_0809d7f0:
    strb       r2,[r4,#0x9]
    b          LAB_0809d94c
LAB_0809d7f4:
    mov        r0,#0x4
    and        r0,r2
    cmp        r0,#0x0
    beq        LAB_0809d826
    ldrb       r0,[r4,#0xd]
    sub        r0,#0x1
    strb       r0,[r4,#0xd]
    mov        r2,#0xff
    and        r0,r2
    lsl        r0,r0,#0x18
    add        r1,r6,#0x1
    mov        r9,r1
    mov        r2,#0x40
    add        r2,r2,r4
    mov        r8,r2
    cmp        r0,#0x0
    ble        LAB_0809d818
    b          LAB_0809d95e
LAB_0809d818:
    lsl        r0,r6,#0x18
    lsr        r0,r0,#0x18
    bl         CgbOscOff
    mov        r0,#0x0
    strb       r0,[r4,#0x0]
    b          last_label
LAB_0809d826:
    mov        r0,#0x40
    and        r0,r1
    add        r2,r6,#0x1
    mov        r9,r2
    mov        r2,#0x40
    add        r2,r2,r4
    mov        r8,r2
    cmp        r0,#0x0
    beq        LAB_0809d85e
    mov        r0,#0x3
    and        r0,r1
    cmp        r0,#0x0
    beq        LAB_0809d85e
    mov        r0,#0xfc
    and        r0,r1
    mov        r2,#0x0
    strb       r0,[r4,#0x0]
    ldrb       r1,[r4,#0x7]
    strb       r1,[r4,#0xb]
    mov        r0,#0xff
    and        r0,r1
    cmp        r0,#0x0
    beq        LAB_0809d890
    mov        r0,#0x1
    ldrb       r2,[r4,#0x1d]
    orr        r0,r2
    strb       r0,[r4,#0x1d]
    b          LAB_0809d93e
LAB_0809d85e:
    ldrb       r0,[r4,#0xb]
    cmp        r0,#0x0
    bne        LAB_0809d94c
    cmp        r6,#0x3
    bne        LAB_0809d870
    mov        r0,#0x1
    ldrb       r1,[r4,#0x1d]
    orr        r0,r1
    strb       r0,[r4,#0x1d]
LAB_0809d870:
    add        r0,r4,#0x0
    bl         CgbModVol
    mov        r0,#0x3
    ldrb       r2,[r4,#0x0]
    and        r0,r2
    cmp        r0,#0x0
    bne        LAB_0809d8bc
    ldrb       r0,[r4,#0x9]
    sub        r0,#0x1
    strb       r0,[r4,#0x9]
    mov        r1,#0xff
    and        r0,r1
    lsl        r0,r0,#0x18
    cmp        r0,#0x0
    bgt        LAB_0809d8b8
LAB_0809d890:
    ldrb       r2,[r4,#0xc]
    ldrb       r1,[r4,#0xa]
    add        r0,r2,#0x0
    mul        r0,r1
    add        r0,#0xff
    asr        r0,r0,#0x8
    mov        r1,#0x0
    strb       r0,[r4,#0x9]
    lsl        r0,r0,#0x18
    cmp        r0,#0x0
    beq        LAB_0809d818
    mov        r0,#0x4
    ldrb       r2,[r4,#0x0]
    orr        r0,r2
    strb       r0,[r4,#0x0]
    mov        r0,#0x1
    ldrb       r1,[r4,#0x1d]
    orr        r0,r1
    strb       r0,[r4,#0x1d]
    b          LAB_0809d95e
LAB_0809d8b8:
    ldrb       r0,[r4,#0x7]
    b          LAB_0809d94a
LAB_0809d8bc:
    cmp        r0,#0x1
    bne        LAB_0809d8c8
LAB_0809d8c0:
    ldrb       r0,[r4,#0x19]
    strb       r0,[r4,#0x9]
    mov        r0,#0x7
    b          LAB_0809d94a
LAB_0809d8c8:
    cmp        r0,#0x2
    bne        LAB_0809d90e
    ldrb       r0,[r4,#0x9]
    sub        r0,#0x1
    strb       r0,[r4,#0x9]
    mov        r2,#0xff
    and        r0,r2
    lsl        r0,r0,#0x18
    ldrb       r2,[r4,#0x19]
    lsl        r1,r2,#0x18
    cmp        r0,r1
    bgt        LAB_0809d90a
LAB_0809d8e0:
    ldrb       r0,[r4,#0x6]
    cmp        r0,#0x0
    bne        LAB_0809d8f0
    mov        r0,#0xfc
    ldrb       r1,[r4,#0x0]
    and        r0,r1
    strb       r0,[r4,#0x0]
    b          LAB_0809d890
LAB_0809d8f0:
    ldrb       r0,[r4,#0x0]
    sub        r0,#0x1
    strb       r0,[r4,#0x0]
    mov        r0,#0x1
    ldrb       r2,[r4,#0x1d]
    orr        r0,r2
    strb       r0,[r4,#0x1d]
    cmp        r6,#0x3
    beq        LAB_0809d8c0
    mov        r0,#0x8
    mov        r1,r10
    strb       r0,[r1,#0x0]
    b          LAB_0809d8c0
LAB_0809d90a:
    ldrb       r0,[r4,#0x5]
    b          LAB_0809d94a
LAB_0809d90e:
    ldrb       r0,[r4,#0x9]
    add        r0,#0x1
    strb       r0,[r4,#0x9]
    mov        r2,#0xff
    and        r0,r2
    ldrb       r1,[r4,#0xa]
    cmp        r0,r1
    bcc        LAB_0809d948
LAB_0809d91e:
    ldrb       r0,[r4,#0x0]
    sub        r0,#0x1
    mov        r2,#0x0
    strb       r0,[r4,#0x0]
    ldrb       r1,[r4,#0x5]
    strb       r1,[r4,#0xb]
    mov        r0,#0xff
    and        r0,r1
    cmp        r0,#0x0
    beq        LAB_0809d8e0
    mov        r0,#0x1
    ldrb       r2,[r4,#0x1d]
    orr        r0,r2
    strb       r0,[r4,#0x1d]
    ldrb       r0,[r4,#0xa]
    strb       r0,[r4,#0x9]
LAB_0809d93e:
    cmp        r6,#0x3
    beq        LAB_0809d94c
    mov        r0,r10
    strb       r1,[r0,#0x0]
    b          LAB_0809d94c
LAB_0809d948:
    ldrb       r0,[r4,#0x4]
LAB_0809d94a:
    strb       r0,[r4,#0xb]
LAB_0809d94c:
    ldrb       r0,[r4,#0xb]
    sub        r0,#0x1
    strb       r0,[r4,#0xb]
    ldr        r1,[sp,#0x0]
    cmp        r1,#0x0
    bne        LAB_0809d95e
    sub        r1,#0x1
    str        r1,[sp,#0x0]
    b          LAB_0809d85e
LAB_0809d95e:
    mov        r0,#0x2
    ldrb       r2,[r4,#0x1d]
    and        r0,r2
    cmp        r0,#0x0
    beq        LAB_0809d9d4
    cmp        r6,#0x3
    bgt        LAB_0809d99e
    mov        r0,#0x8
    ldrb       r1,[r4,#0x1]
    and        r0,r1
    cmp        r0,#0x0
    beq        LAB_0809d99e
    ldr        r0,PTR_REG_SOUNDBIAS_H_0809d988
    ldrb       r0,[r0,#0x0]
    cmp        r0,#0x3f
    bgt        LAB_0809d990
    ldr        r0,[r4,#0x20]
    add        r0,#0x2
    ldr        r1,DAT_0809d98c
    b          LAB_0809d99a

    .align 2, 0


PTR_REG_SOUNDBIAS_H_0809d988:
    .word REG_SOUNDBIAS_H

DAT_0809d98c:
    .word 0x7FC
LAB_0809d990:
    cmp        r0,#0x7f
    bgt        LAB_0809d99e
    ldr        r0,[r4,#0x20]
    add        r0,#0x1
    ldr        r1,DAT_0809d9a8
LAB_0809d99a:
    and        r0,r1
    str        r0,[r4,#0x20]
LAB_0809d99e:
    cmp        r6,#0x4
    beq        LAB_0809d9ac
    ldr        r0,[r4,#0x20]
    b          LAB_0809d9b8

    .align 2, 0


DAT_0809d9a8:
    .word 0x7FE
LAB_0809d9ac:
    ldr        r1,[sp,#0xc]
    ldrb       r0,[r1,#0x0]
    mov        r1,#0x8
    and        r1,r0
    ldr        r0,[r4,#0x20]
    orr        r0,r1
LAB_0809d9b8:
    ldr        r2,[sp,#0xc]
    strb       r0,[r2,#0x0]
    mov        r0,#0xc0
    ldrb       r1,[r4,#0x1a]
    and        r0,r1
    add        r1,r4,#0x0
    add        r1,#0x21
    ldrb       r1,[r1,#0x0]
    add        r0,r1,r0
    strb       r0,[r4,#0x1a]
    mov        r2,#0xff
    and        r0,r2
    ldr        r1,[sp,#0x10]
    strb       r0,[r1,#0x0]
LAB_0809d9d4:
    mov        r0,#0x1
    ldrb       r2,[r4,#0x1d]
    and        r0,r2
    cmp        r0,#0x0
    beq        last_label
    ldr        r1,PTR_REG_NR51_0809da1c
    ldrb       r0,[r1,#0x0]
    ldrb       r2,[r4,#0x1c]
    bic        r0,r2
    ldrb       r2,[r4,#0x1b]
    orr        r0,r2
    strb       r0,[r1,#0x0]
    cmp        r6,#0x3
    bne        LAB_0809da24
    ldr        r0,PTR_gCgb3Vol_0809da20
    ldrb       r1,[r4,#0x9]
    add        r0,r1,r0
    ldrb       r0,[r0,#0x0]
    mov        r2,r10
    strb       r0,[r2,#0x0]
    mov        r1,#0x80
    add        r0,r1,#0x0
    ldrb       r2,[r4,#0x1a]
    and        r0,r2
    cmp        r0,#0x0
    beq        last_label
    ldr        r0,[sp,#0x8]
    strb       r1,[r0,#0x0]
    ldrb       r0,[r4,#0x1a]
    ldr        r1,[sp,#0x10]
    strb       r0,[r1,#0x0]
    mov        r0,#0x7f
    ldrb       r2,[r4,#0x1a]
    and        r0,r2
    strb       r0,[r4,#0x1a]
    b          last_label

PTR_REG_NR51_0809da1c:
    .word REG_NR51

PTR_gCgb3Vol_0809da20:
    .word gCgb3Vol
LAB_0809da24:
    mov        r0,r10
    ldrb       r1,[r0,#0x0]
    mov        r0,#0xf
    and        r0,r1
    ldrb       r2,[r4,#0x9]
    lsl        r1,r2,#0x4
    add        r0,r0,r1
    mov        r1,r10
    strb       r0,[r1,#0x0]
    mov        r0,#0x80
    ldrb       r2,[r4,#0x1a]
    orr        r0,r2
    ldr        r1,[sp,#0x10]
    strb       r0,[r1,#0x0]
last_label:
    mov        r0,#0x0
    strb       r0,[r4,#0x1d]
LAB_0809da44:
    mov        r6,r9
    mov        r4,r8
    cmp        r6,#0x4
    bgt        LAB_0809da4e
    b          LAB_0809d674
LAB_0809da4e:
    add        sp,#0x18
    pop        {r3,r4,r5}
    mov        r8,r3
    mov        r9,r4
    mov        r10,r5
    pop        {r4,r5,r6,r7}
    pop        {r0}
    bx         r0

    .align 2, 0



_ts m4aMPlayTempoControl
    push       {r4,lr}
    add        r2,r0,#0x0
    lsl        r1,r1,#0x10
    lsr        r1,r1,#0x10
    ldr        r3,[r2,#0x34]
    ldr        r0,LAB_0809da84
    cmp        r3,r0
    bne        LAB_0809da7c
    strh       r1,[r2,#0x1e]
    ldrh       r4,[r2,#0x1c]
    add        r0,r1,#0x0
    mul        r0,r4
    asr        r0,r0,#0x8
    strh       r0,[r2,#0x20]
LAB_0809da7c:
    pop        {r4}
    pop        {r0}
    bx         r0

    .align 2, 0

LAB_0809da84:
    ldr        r3,[r2,#0x54]
    ldr        r3,[r6,#0x4]


_ts m4aMPlayVolumeControl
    push       {r4,r5,r6,r7,lr}
    mov        r7,r9
    mov        r6,r8
    push       {r6,r7}
    add        r4,r0,#0x0
    lsl        r1,r1,#0x10
    lsr        r7,r1,#0x10
    lsl        r6,r2,#0x10
    ldr        r3,[r4,#0x34]
    ldr        r0,DAT_0809daec
    cmp        r3,r0
    bne        LAB_0809dae0
    add        r0,r3,#0x1
    str        r0,[r4,#0x34]
    ldrb       r2,[r4,#0x8]
    ldr        r1,[r4,#0x2c]
    mov        r5,#0x1
    cmp        r2,#0x0
    ble        LAB_0809dadc
    mov        r0,#0x80
    mov        r8,r0
    lsr        r6,r6,#0x12
    mov        r0,#0x3
    mov        r12,r0
LAB_0809dab8:
    add        r0,r7,#0x0
    and        r0,r5
    cmp        r0,#0x0
    beq        LAB_0809dad2
    ldrb       r3,[r1,#0x0]
    mov        r0,r8
    and        r0,r3
    cmp        r0,#0x0
    beq        LAB_0809dad2
    strb       r6,[r1,#0x13]
    mov        r0,r12
    orr        r0,r3
    strb       r0,[r1,#0x0]
LAB_0809dad2:
    sub        r2,#0x1
    add        r1,#0x50
    lsl        r5,r5,#0x1
    cmp        r2,#0x0
    bgt        LAB_0809dab8
LAB_0809dadc:
    ldr        r0,DAT_0809daec
    str        r0,[r4,#0x34]
LAB_0809dae0:
    pop        {r3,r4}
    mov        r8,r3
    mov        r9,r4
    pop        {r4,r5,r6,r7}
    pop        {r0}
    bx         r0

DAT_0809daec:
    .word 0x68736D53


_ts m4aMPlayPitchControl
    push       {r4,r5,r6,r7,lr}
    mov        r7,r10
    mov        r6,r9
    mov        r5,r8
    push       {r5,r6,r7}
    add        r4,r0,#0x0
    lsl        r1,r1,#0x10
    lsr        r1,r1,#0x10
    mov        r12,r1
    lsl        r2,r2,#0x10
    lsr        r6,r2,#0x10
    ldr        r3,[r4,#0x34]
    ldr        r0,DAT_0809db60
    cmp        r3,r0
    bne        LAB_0809db52
    add        r0,r3,#0x1
    str        r0,[r4,#0x34]
    ldrb       r2,[r4,#0x8]
    ldr        r3,[r4,#0x2c]
    mov        r5,#0x1
    cmp        r2,#0x0
    ble        LAB_0809db4e
    mov        r0,#0x80
    mov        r9,r0
    lsl        r0,r6,#0x10
    asr        r7,r0,#0x18
    mov        r0,#0xc
    mov        r8,r0
LAB_0809db28:
    mov        r0,r12
    and        r0,r5
    cmp        r0,#0x0
    beq        LAB_0809db44
    ldrb       r1,[r3,#0x0]
    mov        r0,r9
    and        r0,r1
    cmp        r0,#0x0
    beq        LAB_0809db44
    strb       r7,[r3,#0xb]
    strb       r6,[r3,#0xd]
    mov        r0,r8
    orr        r0,r1
    strb       r0,[r3,#0x0]
LAB_0809db44:
    sub        r2,#0x1
    add        r3,#0x50
    lsl        r5,r5,#0x1
    cmp        r2,#0x0
    bgt        LAB_0809db28
LAB_0809db4e:
    ldr        r0,DAT_0809db60
    str        r0,[r4,#0x34]
LAB_0809db52:
    pop        {r3,r4,r5}
    mov        r8,r3
    mov        r9,r4
    mov        r10,r5
    pop        {r4,r5,r6,r7}
    pop        {r0}
    bx         r0

DAT_0809db60:
    .word 0x68736D53


_ts m4aMPlayPanpotControl
    push       {r4,r5,r6,r7,lr}
    mov        r7,r9
    mov        r6,r8
    push       {r6,r7}
    add        r4,r0,#0x0
    lsl        r1,r1,#0x10
    lsr        r7,r1,#0x10
    lsl        r2,r2,#0x18
    lsr        r6,r2,#0x18
    ldr        r3,[r4,#0x34]
    ldr        r0,DAT_0809dbc8
    cmp        r3,r0
    bne        LAB_0809dbbc
    add        r0,r3,#0x1
    str        r0,[r4,#0x34]
    ldrb       r2,[r4,#0x8]
    ldr        r1,[r4,#0x2c]
    mov        r5,#0x1
    cmp        r2,#0x0
    ble        LAB_0809dbb8
    mov        r0,#0x80
    mov        r8,r0
    mov        r0,#0x3
    mov        r12,r0
LAB_0809db94:
    add        r0,r7,#0x0
    and        r0,r5
    cmp        r0,#0x0
    beq        LAB_0809dbae
    ldrb       r3,[r1,#0x0]
    mov        r0,r8
    and        r0,r3
    cmp        r0,#0x0
    beq        LAB_0809dbae
    strb       r6,[r1,#0x15]
    mov        r0,r12
    orr        r0,r3
    strb       r0,[r1,#0x0]
LAB_0809dbae:
    sub        r2,#0x1
    add        r1,#0x50
    lsl        r5,r5,#0x1
    cmp        r2,#0x0
    bgt        LAB_0809db94
LAB_0809dbb8:
    ldr        r0,DAT_0809dbc8
    str        r0,[r4,#0x34]
LAB_0809dbbc:
    pop        {r3,r4}
    mov        r8,r3
    mov        r9,r4
    pop        {r4,r5,r6,r7}
    pop        {r0}
    bx         r0

DAT_0809dbc8:
    .word 0x68736D53


_ts ClearModM
    add        r1,r0,#0x0
    mov        r2,#0x0
    mov        r0,#0x0
    strb       r0,[r1,#0x1a]
    strb       r0,[r1,#0x16]
    ldrb       r0,[r1,#0x18]
    cmp        r0,#0x0
    bne        LAB_0809dbe0
    mov        r0,#0xc
    b          LAB_0809dbe2
LAB_0809dbe0:
    mov        r0,#0x3
LAB_0809dbe2:
    ldrb       r2,[r1,#0x0]
    orr        r0,r2
    strb       r0,[r1,#0x0]
    bx         lr

    .align 2, 0



_ts m4aMPlayModDepthSet
    push       {r4,r5,r6,r7,lr}
    mov        r7,r10
    mov        r6,r9
    mov        r5,r8
    push       {r5,r6,r7}
    add        r6,r0,#0x0
    lsl        r1,r1,#0x10
    lsr        r1,r1,#0x10
    mov        r10,r1
    lsl        r2,r2,#0x18
    lsr        r2,r2,#0x18
    mov        r8,r2
    ldr        r1,[r6,#0x34]
    ldr        r0,soundMagic_9dc5c
    cmp        r1,r0
    bne        LAB_0809dc4c
    add        r0,r1,#0x1
    str        r0,[r6,#0x34]
    ldrb       r5,[r6,#0x8]
    ldr        r4,[r6,#0x2c]
    mov        r7,#0x1
    cmp        r5,#0x0
    ble        LAB_0809dc48
    mov        r9,r8
LAB_0809dc1c:
    mov        r0,r10
    and        r0,r7
    cmp        r0,#0x0
    beq        LAB_0809dc3e
    mov        r0,#0x80
    ldrb       r1,[r4,#0x0]
    and        r0,r1
    cmp        r0,#0x0
    beq        LAB_0809dc3e
    mov        r0,r8
    strb       r0,[r4,#0x17]
    mov        r1,r9
    cmp        r1,#0x0
    bne        LAB_0809dc3e
    add        r0,r4,#0x0
    bl         ClearModM
LAB_0809dc3e:
    sub        r5,#0x1
    add        r4,#0x50
    lsl        r7,r7,#0x1
    cmp        r5,#0x0
    bgt        LAB_0809dc1c
LAB_0809dc48:
    ldr        r0,soundMagic_9dc5c
    str        r0,[r6,#0x34]
LAB_0809dc4c:
    pop        {r3,r4,r5}
    mov        r8,r3
    mov        r9,r4
    mov        r10,r5
    pop        {r4,r5,r6,r7}
    pop        {r0}
    bx         r0

    .align 2, 0


soundMagic_9dc5c:
    .word 0x68736D53


_ts m4aMPlayLFOSpeedSet
    push       {r4,r5,r6,r7,lr}
    mov        r7,r10
    mov        r6,r9
    mov        r5,r8
    push       {r5,r6,r7}
    add        r6,r0,#0x0
    lsl        r1,r1,#0x10
    lsr        r1,r1,#0x10
    mov        r10,r1
    lsl        r2,r2,#0x18
    lsr        r2,r2,#0x18
    mov        r8,r2
    ldr        r1,[r6,#0x34]
    ldr        r0,soundMagic_9dcd0
    cmp        r1,r0
    bne        LAB_0809dcc0
    add        r0,r1,#0x1
    str        r0,[r6,#0x34]
    ldrb       r5,[r6,#0x8]
    ldr        r4,[r6,#0x2c]
    mov        r7,#0x1
    cmp        r5,#0x0
    ble        LAB_0809dcbc
    mov        r9,r8
LAB_0809dc90:
    mov        r0,r10
    and        r0,r7
    cmp        r0,#0x0
    beq        LAB_0809dcb2
    mov        r0,#0x80
    ldrb       r1,[r4,#0x0]
    and        r0,r1
    cmp        r0,#0x0
    beq        LAB_0809dcb2
    mov        r0,r8
    strb       r0,[r4,#0x19]
    mov        r1,r9
    cmp        r1,#0x0
    bne        LAB_0809dcb2
    add        r0,r4,#0x0
    bl         ClearModM
LAB_0809dcb2:
    sub        r5,#0x1
    add        r4,#0x50
    lsl        r7,r7,#0x1
    cmp        r5,#0x0
    bgt        LAB_0809dc90
LAB_0809dcbc:
    ldr        r0,soundMagic_9dcd0
    str        r0,[r6,#0x34]
LAB_0809dcc0:
    pop        {r3,r4,r5}
    mov        r8,r3
    mov        r9,r4
    mov        r10,r5
    pop        {r4,r5,r6,r7}
    pop        {r0}
    bx         r0

    .align 2, 0


soundMagic_9dcd0:
    .word 0x68736D53


_ts ply_memacc
    push       {r4,r5,r6,lr}
    add        r4,r0,#0x0
    add        r6,r1,#0x0
    ldr        r1,[r6,#0x40]
    ldrb       r5,[r1,#0x0]
    add        r2,r1,#0x1
    str        r2,[r6,#0x40]
    ldr        r0,[r4,#0x18]
    ldrb       r1,[r1,#0x1]
    add        r3,r1,r0
    add        r0,r2,#0x1
    str        r0,[r6,#0x40]
    ldrb       r2,[r2,#0x1]
    add        r0,#0x1
    str        r0,[r6,#0x40]
    cmp        r5,#0x11
    bls        LAB_0809dcf8
    b          LAB_0809de26
LAB_0809dcf8:
    lsl        r0,r5,#0x2
    ldr        r1,PTR_switchdataD_0809dd04
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
switchD:
    mov        pc,r0

    .align 2, 0


PTR_switchdataD_0809dd04:
    .word switchdataD_0809dd08

switchdataD_0809dd08:
    .word caseD_0
    .word caseD_1
    .word caseD_2
    .word caseD_3
    .word caseD_4
    .word caseD_5
    .word caseD_6
    .word caseD_7
    .word caseD_8
    .word caseD_9
    .word caseD_a
    .word caseD_b
    .word caseD_c
    .word caseD_d
    .word caseD_e
    .word caseD_f
    .word caseD_10
    .word caseD_11
caseD_0:
    strb       r2,[r3,#0x0]
    b          LAB_0809de26
caseD_1:
    ldrb       r1,[r3,#0x0]
    add        r0,r1,r2
    strb       r0,[r3,#0x0]
    b          LAB_0809de26
caseD_2:
    ldrb       r1,[r3,#0x0]
    sub        r0,r1,r2
    strb       r0,[r3,#0x0]
    b          LAB_0809de26
caseD_3:
    ldr        r0,[r4,#0x18]
    add        r0,r0,r2
    ldrb       r0,[r0,#0x0]
    strb       r0,[r3,#0x0]
    b          LAB_0809de26
caseD_4:
    ldr        r0,[r4,#0x18]
    add        r0,r0,r2
    ldrb       r1,[r3,#0x0]
    ldrb       r0,[r0,#0x0]
    add        r0,r1,r0
    strb       r0,[r3,#0x0]
    b          LAB_0809de26
caseD_5:
    ldr        r0,[r4,#0x18]
    add        r0,r0,r2
    ldrb       r1,[r3,#0x0]
    ldrb       r0,[r0,#0x0]
    sub        r0,r1,r0
    strb       r0,[r3,#0x0]
    b          LAB_0809de26
caseD_6:
    ldrb       r3,[r3,#0x0]
    cmp        r3,r2
    beq        LAB_0809de0c
    b          LAB_0809de20
caseD_7:
    ldrb       r3,[r3,#0x0]
    cmp        r3,r2
    bne        LAB_0809de0c
    b          LAB_0809de20
caseD_8:
    ldrb       r3,[r3,#0x0]
    cmp        r3,r2
    bhi        LAB_0809de0c
    b          LAB_0809de20
caseD_9:
    ldrb       r3,[r3,#0x0]
    cmp        r3,r2
    bcs        LAB_0809de0c
    b          LAB_0809de20
caseD_a:
    ldrb       r3,[r3,#0x0]
    cmp        r3,r2
    bls        LAB_0809de0c
    b          LAB_0809de20
caseD_b:
    ldrb       r3,[r3,#0x0]
    cmp        r3,r2
    bcc        LAB_0809de0c
    b          LAB_0809de20
caseD_c:
    ldr        r0,[r4,#0x18]
    add        r0,r0,r2
    ldrb       r3,[r3,#0x0]
    ldrb       r0,[r0,#0x0]
    cmp        r3,r0
    beq        LAB_0809de0c
    b          LAB_0809de20
caseD_d:
    ldr        r0,[r4,#0x18]
    add        r0,r0,r2
    ldrb       r3,[r3,#0x0]
    ldrb       r0,[r0,#0x0]
    cmp        r3,r0
    bne        LAB_0809de0c
    b          LAB_0809de20
caseD_e:
    ldr        r0,[r4,#0x18]
    add        r0,r0,r2
    ldrb       r3,[r3,#0x0]
    ldrb       r0,[r0,#0x0]
    cmp        r3,r0
    bhi        LAB_0809de0c
    b          LAB_0809de20
caseD_f:
    ldr        r0,[r4,#0x18]
    add        r0,r0,r2
    ldrb       r3,[r3,#0x0]
    ldrb       r0,[r0,#0x0]
    cmp        r3,r0
    bcs        LAB_0809de0c
    b          LAB_0809de20
caseD_10:
    ldr        r0,[r4,#0x18]
    add        r0,r0,r2
    ldrb       r3,[r3,#0x0]
    ldrb       r0,[r0,#0x0]
    cmp        r3,r0
    bls        LAB_0809de0c
    b          LAB_0809de20
caseD_11:
    ldr        r0,[r4,#0x18]
    add        r0,r0,r2
    ldrb       r3,[r3,#0x0]
    ldrb       r0,[r0,#0x0]
    cmp        r3,r0
    bcs        LAB_0809de20
LAB_0809de0c:
    ldr        r0,PTR_gMPlayJumpTable_0809de1c
    ldr        r2,[r0,#0x0]
    add        r0,r4,#0x0
    add        r1,r6,#0x0
    bl         Call_R2_9e103
    b          LAB_0809de26

    .align 2, 0


PTR_gMPlayJumpTable_0809de1c:
    .word 0x3005AC4
LAB_0809de20:
    ldr        r0,[r6,#0x40]
    add        r0,#0x4
    str        r0,[r6,#0x40]
LAB_0809de26:
    pop        {r4,r5,r6}
    pop        {r0}
    bx         r0


_ts ply_xcmd
    push       {lr}
    ldr        r2,[r1,#0x40]
    ldrb       r3,[r2,#0x0]
    add        r2,#0x1
    str        r2,[r1,#0x40]
    ldr        r2,PTR_gXcmdTable_0809de48
    lsl        r3,r3,#0x2
    add        r3,r3,r2
    ldr        r2,[r3,#0x0]
    bl         Call_R2_9e103
    pop        {r0}
    bx         r0

    .align 2, 0


PTR_gXcmdTable_0809de48:
    .word gXcmdTable


_ts ply_xxx
    push       {lr}
    ldr        r2,PTR_gMPlayJumpTable_0809de5c
    ldr        r2,[r2,#0x0]
    bl         Call_R2_9e103
    pop        {r0}
    bx         r0

    .align 2, 0


PTR_gMPlayJumpTable_0809de5c:
    .word 0x3005AC0


_ts ply_xwave
    push       {r4,lr}
    ldr        r2,[r1,#0x40]
    ldr        r0,DAT_0809de98
    and        r4,r0
    ldrb       r0,[r2,#0x0]
    orr        r4,r0
    ldrb       r0,[r2,#0x1]
    lsl        r3,r0,#0x8
    ldr        r0,DAT_0809de9c
    and        r4,r0
    orr        r4,r3
    ldrb       r0,[r2,#0x2]
    lsl        r3,r0,#0x10
    ldr        r0,DAT_0809dea0
    and        r4,r0
    orr        r4,r3
    ldrb       r0,[r2,#0x3]
    lsl        r3,r0,#0x18
    ldr        r0,DAT_0809dea4
    and        r4,r0
    orr        r4,r3
    str        r4,[r1,#0x28]
    add        r2,#0x4
    str        r2,[r1,#0x40]
    pop        {r4}
    pop        {r0}
    bx         r0

    .align 2, 0


DAT_0809de98:
    .word 0xFFFFFF00

DAT_0809de9c:
    .word 0xFFFF00FF

DAT_0809dea0:
    .word 0xFF00FFFF

DAT_0809dea4:
    .word 0xFFFFFF


_ts ply_xtype
    ldr        r0,[r1,#0x40]
    ldrb       r2,[r0,#0x0]
    add        r0,r1,#0x0
    add        r0,#0x24
    strb       r2,[r0,#0x0]
    ldr        r0,[r1,#0x40]
    add        r0,#0x1
    str        r0,[r1,#0x40]
    bx         lr

    .align 2, 0



_ts ply_xatta
    ldr        r0,[r1,#0x40]
    ldrb       r2,[r0,#0x0]
    add        r0,r1,#0x0
    add        r0,#0x2c
    strb       r2,[r0,#0x0]
    ldr        r0,[r1,#0x40]
    add        r0,#0x1
    str        r0,[r1,#0x40]
    bx         lr

    .align 2, 0



_ts ply_xdeca
    ldr        r0,[r1,#0x40]
    ldrb       r0,[r0,#0x0]
    add        r2,r1,#0x0
    add        r2,#0x2d
    strb       r0,[r2,#0x0]
    ldr        r0,[r1,#0x40]
    add        r0,#0x1
    str        r0,[r1,#0x40]
    bx         lr

    .align 2, 0



_ts ply_xsust
    ldr        r0,[r1,#0x40]
    ldrb       r0,[r0,#0x0]
    add        r2,r1,#0x0
    add        r2,#0x2e
    strb       r0,[r2,#0x0]
    ldr        r0,[r1,#0x40]
    add        r0,#0x1
    str        r0,[r1,#0x40]
    bx         lr

    .align 2, 0



_ts ply_xrele
    ldr        r0,[r1,#0x40]
    ldrb       r0,[r0,#0x0]
    add        r2,r1,#0x0
    add        r2,#0x2f
    strb       r0,[r2,#0x0]
    ldr        r0,[r1,#0x40]
    add        r0,#0x1
    str        r0,[r1,#0x40]
    bx         lr

    .align 2, 0



_ts ply_xiecv
    ldr        r0,[r1,#0x40]
    ldrb       r2,[r0,#0x0]
    strb       r2,[r1,#0x1e]
    add        r0,#0x1
    str        r0,[r1,#0x40]
    bx         lr


_ts ply_xiecl
    ldr        r0,[r1,#0x40]
    ldrb       r2,[r0,#0x0]
    strb       r2,[r1,#0x1f]
    add        r0,#0x1
    str        r0,[r1,#0x40]
    bx         lr


_ts ply_xleng
    ldr        r0,[r1,#0x40]
    ldrb       r0,[r0,#0x0]
    add        r2,r1,#0x0
    add        r2,#0x26
    strb       r0,[r2,#0x0]
    ldr        r0,[r1,#0x40]
    add        r0,#0x1
    str        r0,[r1,#0x40]
    bx         lr

    .align 2, 0



_ts ply_xswee
    ldr        r0,[r1,#0x40]
    ldrb       r0,[r0,#0x0]
    add        r2,r1,#0x0
    add        r2,#0x27
    strb       r0,[r2,#0x0]
    ldr        r0,[r1,#0x40]
    add        r0,#0x1
    str        r0,[r1,#0x40]
    bx         lr

    .align 2, 0



_ts dummy_9DF4C
    bx         lr

    .align 2, 0

