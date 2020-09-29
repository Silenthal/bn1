    .macro far_thumb_func_start label
    .global \label\()_far
    .set \label\()_far, . - ROM_IntrCodeStart + IWRAM_IntrCodeStart + 1
    thumb_func_start \label
    .endm

    .macro far_label label
    .word \label - ROM_IntrCodeStart + IWRAM_IntrCodeStart
    .endm
