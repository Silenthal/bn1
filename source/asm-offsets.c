#include <stddef.h>
#include "mmbn.h"

#define DECLARE(SYM,VAL) __asm("__AS_DEFINE__ " SYM "\t%0" : : "n" ((unsigned long)(VAL)))

int main(void)
{
    // Main
    DECLARE("Main_manager"                  , offsetof(struct Main, manager));
    DECLARE("Main_input"                    , offsetof(struct Main, input));
    DECLARE("Main_unk_08"                   , offsetof(struct Main, unk_08));
    DECLARE("Main_unk_0C"                   , offsetof(struct Main, unk_0C));
    DECLARE("Main_displaySettings"          , offsetof(struct Main, displaySettings));
    DECLARE("Main_unk_14"                   , offsetof(struct Main, unk_14));
    DECLARE("Main_fadeSettings"             , offsetof(struct Main, fadeSettings));
    DECLARE("Main_unk_1C"                   , offsetof(struct Main, unk_1C));
    DECLARE("Main_unk_20"                   , offsetof(struct Main, unk_20));
    DECLARE("Main_unk_24"                   , offsetof(struct Main, unk_24));
    DECLARE("Main_unk_28"                   , offsetof(struct Main, unk_28));
    DECLARE("Main_unk_2C"                   , offsetof(struct Main, unk_2C));
    DECLARE("Main_unk_30"                   , offsetof(struct Main, unk_30));
    DECLARE("Main_mainMenu"                 , offsetof(struct Main, mainMenu));
    DECLARE("Main_windowSettings"           , offsetof(struct Main, windowSettings));
    DECLARE("Main_blendSettings"            , offsetof(struct Main, blendSettings));
    DECLARE("Main_demo"                     , offsetof(struct Main, demo));
    DECLARE("Main_unk_44"                   , offsetof(struct Main, unk_44));
    DECLARE("Main_text"                     , offsetof(struct Main, text));
    DECLARE("Main_unk_4C"                   , offsetof(struct Main, unk_4C));
    DECLARE("Main_unk_50"                   , offsetof(struct Main, unk_50));
    DECLARE("Main_unk_54"                   , offsetof(struct Main, unk_54));
    DECLARE("Main_unk_58"                   , offsetof(struct Main, unk_58));
    DECLARE("Main_screens"                  , offsetof(struct Main, screens));
    DECLARE("Main_unk_60"                   , offsetof(struct Main, unk_60));
    DECLARE("Main_unk_64"                   , offsetof(struct Main, unk_64));
    DECLARE("Main_unk_68"                   , offsetof(struct Main, unk_68));
    DECLARE("Main_unk_6C"                   , offsetof(struct Main, unk_6C));
    DECLARE("Main_shop"                     , offsetof(struct Main, shop));
    DECLARE("Main_unk_74"                   , offsetof(struct Main, unk_74));
    DECLARE("Main_unk_78"                   , offsetof(struct Main, unk_78));
    DECLARE("Main_unk_7C"                   , offsetof(struct Main, unk_7C));

    // Manager
    DECLARE("Manager_m_state0"              , offsetof(struct Manager, m_state0));
    DECLARE("Manager_m_softResetDelayTimer" , offsetof(struct Manager, m_softResetDelayTimer));

    // FadeSettings
    DECLARE("FadeSettings_m_isApplyFadeFunc", offsetof(struct FadeSettings, m_isApplyFadeFunc));
    DECLARE("FadeSettings_m_fadeType"       , offsetof(struct FadeSettings, m_fadeType));
    DECLARE("FadeSettings_m_fadeStep"       , offsetof(struct FadeSettings, m_fadeStep));
    DECLARE("FadeSettings_m_isFadeActive"   , offsetof(struct FadeSettings, m_isFadeActive));
    DECLARE("FadeSettings_m_isFadeStarted"  , offsetof(struct FadeSettings, m_isFadeStarted));

    // DisplaySettings
    DECLARE("DisplaySettings_dispcnt"       , offsetof(struct DisplaySettings, dispcnt));
    DECLARE("DisplaySettings_bg0Cnt"        , offsetof(struct DisplaySettings, bg0Cnt));
    DECLARE("DisplaySettings_bg1Cnt"        , offsetof(struct DisplaySettings, bg1Cnt));
    DECLARE("DisplaySettings_bg2Cnt"        , offsetof(struct DisplaySettings, bg2Cnt));
    DECLARE("DisplaySettings_bg3Cnt"        , offsetof(struct DisplaySettings, bg3Cnt));
    DECLARE("DisplaySettings_bg0Hofs"       , offsetof(struct DisplaySettings, bg0Hofs));
    DECLARE("DisplaySettings_bg0Vofs"       , offsetof(struct DisplaySettings, bg0Vofs));
    DECLARE("DisplaySettings_bg1Hofs"       , offsetof(struct DisplaySettings, bg1Hofs));
    DECLARE("DisplaySettings_bg1Vofs"       , offsetof(struct DisplaySettings, bg1Vofs));
    DECLARE("DisplaySettings_bg2Hofs"       , offsetof(struct DisplaySettings, bg2Hofs));
    DECLARE("DisplaySettings_bg2Vofs"       , offsetof(struct DisplaySettings, bg2Vofs));
    DECLARE("DisplaySettings_bg3Hofs"       , offsetof(struct DisplaySettings, bg3Hofs));
    DECLARE("DisplaySettings_bg3Vofs"       , offsetof(struct DisplaySettings, bg3Vofs));

    // Demo
    DECLARE("Demo_m_state0"                 , offsetof(struct Demo, m_state0));
    DECLARE("Demo_m_state1"                 , offsetof(struct Demo, m_state1));
    DECLARE("Demo_m_b2"                     , offsetof(struct Demo, m_b2));
    DECLARE("Demo_m_demoMessageTimer"       , offsetof(struct Demo, m_demoMessageTimer));
    DECLARE("Demo_m_b6"                     , offsetof(struct Demo, m_b6));

    // Demo_State_0
    DECLARE("D_State_0_State0"                  , 0);
    DECLARE("D_State_0_State1"                  , 4);
    DECLARE("D_State_0_State2_InitializeGame"   , 8);

    // Demo_State_1
    DECLARE("D_State_1_State0"                  , 0);
    DECLARE("D_State_1_State1"                  , 4);
    DECLARE("D_State_1_State2"                  , 8);
    DECLARE("D_State_1_State3"                  , 12);
    DECLARE("D_State_1_State4"                  , 16);
    DECLARE("D_State_1_State5"                  , 20);
    
    // FadeType
    DECLARE("FT_None"                           , 0);
    DECLARE("FT_FadeInFromWhite"                , 1);
    DECLARE("FT_FadeOutToWhite"                 , 2);
    DECLARE("FT_FadeInFromBlack"                , 3);
    DECLARE("FT_FadeOutToBlack"                 , 4);
    DECLARE("FT_FadeInFromBlackExceptSpritesBG0", 5);
    DECLARE("FT_DarkenExceptSpritesBG0"         , 6);
    DECLARE("FT_FadeInFromBlackExceptBG0"       , 7);
    DECLARE("FT_FadeOutToBlackExceptBG0"        , 8);
    DECLARE("FT_FadeInFromWhiteExceptBG0"       , 9);
    DECLARE("FT_FadeOutToWhiteExceptBG0"        , 10);
    DECLARE("FT_FadeInFromBlackExceptBG3"       , 11);
    DECLARE("FT_DarkenExceptBG3"                , 12);
    DECLARE("FT_FadeInAlphaBlendBG0"            , 13);
    DECLARE("FT_FadeOutAlphaBlendBG0"           , 14);

    // BgControlType
    DECLARE("BGC_Standard"                      , 0);
    DECLARE("BGC_OnlyBg0"                       , 1);
    DECLARE("BGC_OnlyBg01"                      , 2);
    DECLARE("BGC_All_4bpp"                      , 3);
    DECLARE("BGC_OnlyBg012"                     , 4);
    DECLARE("BGC_All_8bpp"                      , 5);
    DECLARE("BGC_All_Bg3_8bpp"                  , 6);

    // Manager_State
    DECLARE("MS_State0"                         , 0);
    DECLARE("MS_State1"                         , 4);
    DECLARE("MS_State2"                         , 8);
    DECLARE("MS_State3"                         , 12);
    DECLARE("MS_State4_Demo"                    , 16);
    DECLARE("MS_State5_Initial"                 , 20);
    DECLARE("MS_State6"                         , 24);
    DECLARE("MS_State7"                         , 28);
    DECLARE("MS_State8_GameOver"                , 32);
    DECLARE("MS_State9"                         , 36);
    DECLARE("MS_StateA"                         , 40);

    // DispCnt
    DECLARE("DISPCNT_MODE0"                     , 0);
    DECLARE("DISPCNT_MODE1"                     , 1);
    DECLARE("DISPCNT_MODE2"                     , 2);
    DECLARE("DISPCNT_MODE3"                     , 3);
    DECLARE("DISPCNT_MODE4"                     , 4);
    DECLARE("DISPCNT_MODE5"                     , 5);
    DECLARE("DISPCNT_FRMSEL"                    , 16);
    DECLARE("DISPCNT_HFREE"                     , 32);
    DECLARE("DISPCNT_OMAP1D"                    , 64);
    DECLARE("DISPCNT_FORCEBLANK"                , 128);
    DECLARE("DISPCNT_BG0"                       , 256);
    DECLARE("DISPCNT_BG1"                       , 512);
    DECLARE("DISPCNT_BG2"                       , 1024);
    DECLARE("DISPCNT_BG3"                       , 2048);
    DECLARE("DISPCNT_BGALL"                     , 3840);
    DECLARE("DISPCNT_OBJ"                       , 4096);
    DECLARE("DISPCNT_WIN0"                      , 8192);
    DECLARE("DISPCNT_WIN1"                      , 16384);
    DECLARE("DISPCNT_OBJWIN"                    , 32768);
}
