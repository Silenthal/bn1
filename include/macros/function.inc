    .macro arm_func_start name
    .align 2, 0
    .global \name
    .arm
    .type \name, %function
    .endm

    .macro arm_func_end name
    .size \name, .-\name
    .endm

    .macro thumb_func_start name
    .align 2, 0
    .global \name
    .thumb
    .thumb_func
    .type \name, %function
    .endm

    .macro non_word_aligned_thumb_func_start name
    .global \name
    .thumb
    .thumb_func
    .type \name, %function
    .endm

    .macro thumb_func_end name
    .size \name, .-\name
    .endm

    .macro _ts name
    thumb_func_start \name
    \name:
    .endm

    .macro _nt name
    non_word_aligned_thumb_func_start \name
    \name:
    .endm

    .macro LoadStateTo reg, stateOff, regTemp=r7
    mov \regTemp,r10
    ldr \reg,[\regTemp,#\stateOff]
    .endm

    .macro bin start, end
    .incbin BASE, \start, \end - \start
    .endm
