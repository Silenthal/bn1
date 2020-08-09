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

    // ChipId
    DECLARE("CD_Buster"                         , 0);
    DECLARE("CD_Cannon"                         , 1);
    DECLARE("CD_HiCannon"                       , 2);
    DECLARE("CD_M_Cannon"                       , 3);
    DECLARE("CD_Sword"                          , 4);
    DECLARE("CD_WideSwrd"                       , 5);
    DECLARE("CD_LongSwrd"                       , 6);
    DECLARE("CD_LilBomb"                        , 7);
    DECLARE("CD_CrosBomb"                       , 8);
    DECLARE("CD_BigBomb"                        , 9);
    DECLARE("CD_Spreader"                       , 10);
    DECLARE("CD_Bubbler"                        , 11);
    DECLARE("CD_Heater"                         , 12);
    DECLARE("CD_MiniBomb"                       , 13);
    DECLARE("CD_Shotgun"                        , 14);
    DECLARE("CD_CrossGun"                       , 15);
    DECLARE("CD_ShokWave"                       , 16);
    DECLARE("CD_SoniWave"                       , 17);
    DECLARE("CD_DynaWave"                       , 18);
    DECLARE("CD_FireTowr"                       , 19);
    DECLARE("CD_AquaTowr"                       , 20);
    DECLARE("CD_WoodTowr"                       , 21);
    DECLARE("CD_Quake1"                         , 22);
    DECLARE("CD_Quake2"                         , 23);
    DECLARE("CD_Quake3"                         , 24);
    DECLARE("CD_FireSwrd"                       , 25);
    DECLARE("CD_ElecSwrd"                       , 26);
    DECLARE("CD_AquaSwrd"                       , 27);
    DECLARE("CD_GutsPnch"                       , 28);
    DECLARE("CD_IcePunch"                       , 29);
    DECLARE("CD_FtrSword"                       , 30);
    DECLARE("CD_Dash"                           , 31);
    DECLARE("CD_KngtSwrd"                       , 32);
    DECLARE("CD_HeroSwrd"                       , 33);
    DECLARE("CD_MetGuard"                       , 34);
    DECLARE("CD_TriArrow"                       , 37);
    DECLARE("CD_TriSpear"                       , 38);
    DECLARE("CD_TriLance"                       , 39);
    DECLARE("CD_Typhoon"                        , 40);
    DECLARE("CD_Huricane"                       , 41);
    DECLARE("CD_Cyclone"                        , 42);
    DECLARE("CD_Howitzer"                       , 43);
    DECLARE("CD_Thunder1"                       , 44);
    DECLARE("CD_Thunder2"                       , 45);
    DECLARE("CD_Thunder3"                       , 46);
    DECLARE("CD_Snakegg1"                       , 49);
    DECLARE("CD_Snakegg2"                       , 50);
    DECLARE("CD_Snakegg3"                       , 51);
    DECLARE("CD_Hammer"                         , 52);
    DECLARE("CD_BodyBurn"                       , 55);
    DECLARE("CD_Ratton1"                        , 58);
    DECLARE("CD_Ratton2"                        , 59);
    DECLARE("CD_Ratton3"                        , 60);
    DECLARE("CD_Lockon1"                        , 61);
    DECLARE("CD_Lockon2"                        , 62);
    DECLARE("CD_Lockon3"                        , 63);
    DECLARE("CD_X_Panel1"                       , 64);
    DECLARE("CD_X_Panel3"                       , 65);
    DECLARE("CD_Recov10"                        , 67);
    DECLARE("CD_Recov30"                        , 68);
    DECLARE("CD_Recov50"                        , 69);
    DECLARE("CD_Recov80"                        , 70);
    DECLARE("CD_Recov120"                       , 71);
    DECLARE("CD_Recov150"                       , 72);
    DECLARE("CD_Recov200"                       , 73);
    DECLARE("CD_Recov300"                       , 74);
    DECLARE("CD_Steal"                          , 76);
    DECLARE("CD_Geddon1"                        , 79);
    DECLARE("CD_Geddon2"                        , 80);
    DECLARE("CD_Escape"                         , 82);
    DECLARE("CD_Interrupt"                      , 83);
    DECLARE("CD_LifeAura"                       , 84);
    DECLARE("CD_AquaAura"                       , 85);
    DECLARE("CD_FireAura"                       , 86);
    DECLARE("CD_WoodAura"                       , 87);
    DECLARE("CD_Repair"                         , 88);
    DECLARE("CD_Cloud"                          , 91);
    DECLARE("CD_Cloudier"                       , 92);
    DECLARE("CD_Cloudest"                       , 93);
    DECLARE("CD_IceCube"                        , 94);
    DECLARE("CD_RockCube"                       , 95);
    DECLARE("CD_TimeBom1"                       , 97);
    DECLARE("CD_TimeBom2"                       , 98);
    DECLARE("CD_TimeBom3"                       , 99);
    DECLARE("CD_Invis1"                         , 100);
    DECLARE("CD_Invis2"                         , 101);
    DECLARE("CD_Invis3"                         , 102);
    DECLARE("CD_IronBody"                       , 103);
    DECLARE("CD_Remobit1"                       , 105);
    DECLARE("CD_Remobit2"                       , 106);
    DECLARE("CD_Remobit3"                       , 107);
    DECLARE("CD_BstrGard"                       , 108);
    DECLARE("CD_BstrBomb"                       , 109);
    DECLARE("CD_BstrSwrd"                       , 110);
    DECLARE("CD_BstrPnch"                       , 111);
    DECLARE("CD_RingZap1"                       , 112);
    DECLARE("CD_RingZap2"                       , 113);
    DECLARE("CD_RingZap3"                       , 114);
    DECLARE("CD_Candle1"                        , 115);
    DECLARE("CD_Candle2"                        , 116);
    DECLARE("CD_Candle3"                        , 117);
    DECLARE("CD_SloGauge"                       , 118);
    DECLARE("CD_FstGauge"                       , 119);
    DECLARE("CD_Drain1"                         , 121);
    DECLARE("CD_Drain2"                         , 122);
    DECLARE("CD_Drain3"                         , 123);
    DECLARE("CD_Mine1"                          , 124);
    DECLARE("CD_Mine2"                          , 125);
    DECLARE("CD_Mine3"                          , 126);
    DECLARE("CD_Gaia1"                          , 127);
    DECLARE("CD_Gaia2"                          , 128);
    DECLARE("CD_Gaia3"                          , 129);
    DECLARE("CD_BblWrap1"                       , 130);
    DECLARE("CD_BblWrap2"                       , 131);
    DECLARE("CD_BblWrap3"                       , 132);
    DECLARE("CD_Wave"                           , 133);
    DECLARE("CD_RedWave"                        , 134);
    DECLARE("CD_BigWave"                        , 135);
    DECLARE("CD_Muramasa"                       , 136);
    DECLARE("CD_Dropdown"                       , 137);
    DECLARE("CD_Popup"                          , 138);
    DECLARE("CD_Dynamyt1"                       , 139);
    DECLARE("CD_Dynamyt2"                       , 140);
    DECLARE("CD_Dynamyt3"                       , 141);
    DECLARE("CD_Anubis"                         , 142);
    DECLARE("CD_IronShld"                       , 145);
    DECLARE("CD_LeafShld"                       , 146);
    DECLARE("CD_Barrier"                        , 147);
    DECLARE("CD_PharoMan"                       , 148);
    DECLARE("CD_PharoMn2"                       , 149);
    DECLARE("CD_PharoMn3"                       , 150);
    DECLARE("CD_ShadoMan"                       , 151);
    DECLARE("CD_ShadoMn2"                       , 152);
    DECLARE("CD_ShadoMn3"                       , 153);
    DECLARE("CD_MagicMan"                       , 157);
    DECLARE("CD_MagicMn2"                       , 158);
    DECLARE("CD_MagicMn3"                       , 159);
    DECLARE("CD_Roll"                           , 160);
    DECLARE("CD_Roll2"                          , 161);
    DECLARE("CD_Roll3"                          , 162);
    DECLARE("CD_GutsMan"                        , 163);
    DECLARE("CD_GutsMan2"                       , 164);
    DECLARE("CD_GutsMan3"                       , 165);
    DECLARE("CD_ProtoMan"                       , 166);
    DECLARE("CD_ProtoMn2"                       , 167);
    DECLARE("CD_ProtoMn3"                       , 168);
    DECLARE("CD_WoodMan"                        , 169);
    DECLARE("CD_WoodMan2"                       , 170);
    DECLARE("CD_WoodMan3"                       , 171);
    DECLARE("CD_FireMan"                        , 172);
    DECLARE("CD_FireMan2"                       , 173);
    DECLARE("CD_FireMan3"                       , 174);
    DECLARE("CD_NumbrMan"                       , 175);
    DECLARE("CD_NumbrMn2"                       , 176);
    DECLARE("CD_NumbrMn3"                       , 177);
    DECLARE("CD_StoneMan"                       , 178);
    DECLARE("CD_StoneMn2"                       , 179);
    DECLARE("CD_StoneMn3"                       , 180);
    DECLARE("CD_IceMan"                         , 181);
    DECLARE("CD_IceMan2"                        , 182);
    DECLARE("CD_IceMan3"                        , 183);
    DECLARE("CD_SkullMan"                       , 184);
    DECLARE("CD_SkullMn2"                       , 185);
    DECLARE("CD_SkullMn3"                       , 186);
    DECLARE("CD_ColorMan"                       , 187);
    DECLARE("CD_ColorMn2"                       , 188);
    DECLARE("CD_ColorMn3"                       , 189);
    DECLARE("CD_BombMan"                        , 190);
    DECLARE("CD_BombMan2"                       , 191);
    DECLARE("CD_BombMan3"                       , 192);
    DECLARE("CD_SharkMan"                       , 193);
    DECLARE("CD_SharkMn2"                       , 194);
    DECLARE("CD_SharkMn3"                       , 195);
    DECLARE("CD_ElecMan"                        , 196);
    DECLARE("CD_ElecMan2"                       , 197);
    DECLARE("CD_ElecMan3"                       , 198);
    DECLARE("CD_Bass"                           , 199);

    // ChipCode
    DECLARE("CC_A"                              , 0);
    DECLARE("CC_B"                              , 1);
    DECLARE("CC_C"                              , 2);
    DECLARE("CC_D"                              , 3);
    DECLARE("CC_E"                              , 4);
    DECLARE("CC_F"                              , 5);
    DECLARE("CC_G"                              , 6);
    DECLARE("CC_H"                              , 7);
    DECLARE("CC_I"                              , 8);
    DECLARE("CC_J"                              , 9);
    DECLARE("CC_K"                              , 10);
    DECLARE("CC_L"                              , 11);
    DECLARE("CC_M"                              , 12);
    DECLARE("CC_N"                              , 13);
    DECLARE("CC_O"                              , 14);
    DECLARE("CC_P"                              , 15);
    DECLARE("CC_Q"                              , 16);
    DECLARE("CC_R"                              , 17);
    DECLARE("CC_S"                              , 18);
    DECLARE("CC_T"                              , 19);
    DECLARE("CC_U"                              , 20);
    DECLARE("CC_V"                              , 21);
    DECLARE("CC_W"                              , 22);
    DECLARE("CC_X"                              , 23);
    DECLARE("CC_Y"                              , 24);
    DECLARE("CC_Z"                              , 25);

    // ElementId
    DECLARE("EL_None"                           , 0);
    DECLARE("EL_Elec"                           , 1);
    DECLARE("EL_Fire"                           , 2);
    DECLARE("EL_Water"                          , 3);
    DECLARE("EL_Wood"                           , 4);
}
