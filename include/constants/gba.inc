    .set FALSE, 0
    .set TRUE, 1

    .set EWRAM_START, 0x2000000
    .set EWRAM_END,   EWRAM_START + 0x40000
    .set IWRAM_START, 0x3000000
    .set IWRAM_END,   IWRAM_START + 0x8000
    .set OAM_BEGIN,   0x7000000
    .set OAM_END,     OAM_BEGIN + 0x400
    .set SRAM_START,  0xE000000

    .set IRQ_STACK_TOP, IWRAM_END - 0x60
    .set FIQ_STACK_TOP, IWRAM_END - 0x4
    .set SWI_STACK_TOP, IWRAM_END - 0x20
    .set SYSTEM_STACK_TOP, IWRAM_END - 0x200

    .set KEYCNT_BUTTON_A        , 0x0001
    .set KEYCNT_BUTTON_B        , 0x0002
    .set KEYCNT_BUTTON_SELECT   , 0x0004
    .set KEYCNT_BUTTON_START    , 0x0008
    .set KEYCNT_BUTTON_RIGHT    , 0x0010
    .set KEYCNT_BUTTON_LEFT     , 0x0020
    .set KEYCNT_BUTTON_UP       , 0x0040
    .set KEYCNT_BUTTON_DOWN     , 0x0080
    .set KEYCNT_BUTTON_R        , 0x0100
    .set KEYCNT_BUTTON_L        , 0x0200
    .set KEYCNT_BUTTON_ALL      , 0x03FF
    .set KEYCNT_IRQ_ENABLE      , 0x4000
    .set KEYCNT_IRQ_COND_ALL    , 0x8000

    .set IWRAM_IntrCodeStart, IWRAM_START + 0x6800
    .set ROM_IntrCodeStart, 0x8180000
