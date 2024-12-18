    .macro global_label labelName
    .global \labelName
\labelName:
    .endm

    .macro far_global_label label
    .set \label\()_far, . - ROM_IntrCodeStart + IWRAM_IntrCodeStart
    .global \label\()_far
    .global \label
\label:
    .endm

    .macro spritePtr label_name
    .word \label_name
    .endm

    .macro spritePtrLz label_name
    .word (\label_name + 0x80000000)
    .endm
