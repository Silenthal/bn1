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
    .align 2, 0
    .global \name
    .thumb
    .thumb_func
    .type \name, %function
    \name:
    .endm

    .macro _nt name
    .global \name
    .thumb
    .thumb_func
    .type \name, %function
    \name:
    .endm

    .macro _fts label
    .align 2, 0
    .global \label\()_far
    .set \label\()_far, . - ROM_IntrCodeStart + IWRAM_IntrCodeStart + 1
    .global \label
    .thumb
    .thumb_func
    .type \label, %function
    \label:
    .endm

    .macro _fnt label
    .global \label\()_far
    .set \label\()_far, . - ROM_IntrCodeStart + IWRAM_IntrCodeStart + 1
    .global \label
    .thumb
    .thumb_func
    .type \label, %function
    \label:
    .endm

    .macro LoadMain stateOff, reg, regTemp=r7
    mov \regTemp,r10
    ldr \reg,[\regTemp,#\stateOff]
    .endm

    .macro bin start, end
    .incbin BASE, \start, \end - \start
    .endm
