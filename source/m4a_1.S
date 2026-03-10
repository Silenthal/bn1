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
    beq        SoundMainRAM_NoReverb
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
SoundMainRAM_NoReverb:
    mov        r0,#0x0
    mov        r1,r8
    add        r6,r6,r5
    lsr        r1,r1,#0x3
    bcc        SoundMainRAM_NoReverb_Ok
    stmia      r5!,{r0}
    stmia      r6!,{r0}
SoundMainRAM_NoReverb_Ok:
    lsr        r1,r1,#0x1
    bcc        SoundMainRAM_NoReverb_Loop
    stmia      r5!,{r0}
    stmia      r6!,{r0}
    stmia      r5!,{r0}
    stmia      r6!,{r0}
SoundMainRAM_NoReverb_Loop:
    stmia      r5!,{r0}
    stmia      r6!,{r0}
    stmia      r5!,{r0}
    stmia      r6!,{r0}
    stmia      r5!,{r0}
    stmia      r6!,{r0}
    stmia      r5!,{r0}
    stmia      r6!,{r0}
    sub        r1,#0x1
    bgt        SoundMainRAM_NoReverb_Loop


_nt FUN_0809c0b2
    ldr        r4,[sp,#0x18]
    ldr        r0,[r4,#0x14]
    mov        r9,r0
    ldr        r0,[r4,#0x18]
    mov        r12,r0
    ldrb       r0,[r4,#0x6]
    add        r4,#0x50
SoundMainRAM_ChanLoop:
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
    b          SoundMainRAM_ChanLoop
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


_ts ply_prio
    mov        r12,lr
    bl         ld_r3_tp_adr_i
    strb       r3,[r1,#0x1d]
    bx         r12


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


_ts ply_vol
    mov        r12,lr
    bl         ld_r3_tp_adr_i
    strb       r3,[r1,#0x12]
    ldrb       r3,[r1,#0x0]
    mov        r2,#0x3
    orr        r3,r2
    strb       r3,[r1,#0x0]
    bx         r12


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


_ts ply_lfodl
    mov        r12,lr
    bl         ld_r3_tp_adr_i
    strb       r3,[r1,#0x1b]
    bx         r12


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
    bl         Clear64byte
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


_ts ld_r3_tp_adr_i_unchecked
    ldr        r2,[r1,#0x40]
    add        r3,r2,#0x1
    str        r3,[r1,#0x40]
    ldrb       r3,[r2,#0x0]
    bx         lr


_ts ply_lfos
    mov        r12,lr
    bl         ld_r3_tp_adr_i_unchecked
    strb       r3,[r1,#0x19]
    cmp        r3,#0x0
    bne        LAB_0809cad4
    bl         clear_modM
LAB_0809cad4:
    bx         r12


_ts ply_mod
    mov        r12,lr
    bl         ld_r3_tp_adr_i_unchecked
    strb       r3,[r1,#0x17]
    cmp        r3,#0x0
    bne        LAB_0809cae8
    bl         clear_modM
LAB_0809cae8:
    bx         r12

