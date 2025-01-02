    .macro Flag_SetEvent flag
    mov r0,#\flag
    bl Flag_SetEvent
    .endm

    .macro Flag_SetGate flag
    mov r0,#\flag
    bl Flag_SetGate
    .endm

    .macro Flag_SetSystem flag
    mov r0,#\flag
    bl Flag_SetSystem
    .endm

    .macro Flag_SetIgnore flag
    mov r0,#\flag
    bl Flag_SetIgnore
    .endm

    .macro Flag_SetItem flag
    mov r0,#\flag
    bl Flag_SetItem
    .endm

    .macro Flag_SetEmailUnread flag
    mov r0,#\flag
    bl Flag_SetEmailUnread
    .endm

    .macro Flag_SetEmailReceived flag
    mov r0,#\flag
    bl Flag_SetEmailReceived
    .endm

    .macro Flag_SetLibrary flag
    mov r0,#\flag
    bl Flag_SetLibrary
    .endm

    .macro Flag_SetBase flag
    mov r0,#\flag
    bl Flag_SetBase
    .endm

    .macro Flag_ClearEvent flag
    mov r0,#\flag
    bl Flag_ClearEvent
    .endm

    .macro Flag_ClearGate flag
    mov r0,#\flag
    bl Flag_ClearGate
    .endm

    .macro Flag_ClearSystem flag
    mov r0,#\flag
    bl Flag_ClearSystem
    .endm

    .macro Flag_ClearIgnore flag
    mov r0,#\flag
    bl Flag_ClearIgnore
    .endm

    .macro Flag_ClearItem flag
    mov r0,#\flag
    bl Flag_ClearItem
    .endm

    .macro Flag_ClearBase flag
    mov r0,#\flag
    bl Flag_ClearBase
    .endm

    .macro Flag_GetEvent flag
    mov r0,#\flag
    bl Flag_GetEvent
    .endm

    .macro Flag_GetGate flag
    mov r0,#\flag
    bl Flag_GetGate
    .endm

    .macro Flag_GetSystem flag
    mov r0,#\flag
    bl Flag_GetSystem
    .endm

    .macro Flag_GetIgnore flag
    mov r0,#\flag
    bl Flag_GetIgnore
    .endm

    .macro Flag_GetItem flag
    mov r0,#\flag
    bl Flag_GetItem
    .endm

    .macro Flag_GetEmailUnread flag
    mov r0,#\flag
    bl Flag_GetEmailUnread
    .endm

    .macro Flag_GetEmailReceived flag
    mov r0,#\flag
    bl Flag_GetEmailReceived
    .endm

    .macro Flag_GetLibrary flag
    mov r0,#\flag
    bl Flag_GetLibrary
    .endm

    .macro Flag_GetBase flag
    mov r0,#\flag
    bl Flag_GetBase
    .endm

    .macro Flag_ToggleEvent flag
    mov r0,#\flag
    bl Flag_ToggleEvent
    .endm

    .macro Flag_ToggleIgnore flag
    mov r0,#\flag
    bl Flag_ToggleIgnore
    .endm

    .macro Flag_ToggleBase flag
    mov r0,#\flag
    bl Flag_ToggleBase
    .endm
