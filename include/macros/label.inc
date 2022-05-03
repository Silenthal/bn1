    .macro global_label labelName
    .global \labelName
\labelName:
    .endm

    .macro spritePtr label_name
    .word \label_name
    .endm

    .macro spritePtrLz label_name
    .word (\label_name + 0x80000000)
    .endm
