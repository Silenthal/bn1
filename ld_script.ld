OUTPUT_FORMAT("elf32-littlearm", "elf32-bigarm", "elf32-littlearm")
OUTPUT_ARCH(arm)
ENTRY(Start)

MEMORY {
	bios	: ORIGIN = 0x00000000, LENGTH = 16K
	ewram	: ORIGIN = 0x02000000, LENGTH = 256K
	iwram	: ORIGIN = 0x03000000, LENGTH = 32K
	io		: ORIGIN = 0x04000000, LENGTH = 1K
	palette	: ORIGIN = 0x05000000, LENGTH = 1K
	vram	: ORIGIN = 0x06000000, LENGTH = 96K
	oam		: ORIGIN = 0x07000000, LENGTH = 1K
	rom		: ORIGIN = 0x08000000, LENGTH = 8M
	sram	: ORIGIN = 0x0E000000, LENGTH = 64K
}
__ewram_start			= ORIGIN(ewram);
__ewram_end				= ORIGIN(ewram) + LENGTH(ewram);
__iwram_start			= ORIGIN(iwram);
__iwram_end				= ORIGIN(iwram) + LENGTH(iwram);
__text_start			= ORIGIN(rom);
__vram_start			= ORIGIN(vram);
__pal_start				= ORIGIN(palette);
__ram_code_address		= ORIGIN(rom) + 0x180000;
__asset_load_addresss	= ORIGIN(rom) + 0x1E0000;

SECTIONS {
	. = __ewram_start;
	ewram (NOLOAD) :
	{
		gFlagBase					= 0;
		gShopInventory0				= 0x90;
		gTraffic					= 0x120;
		gShopInventory4				= 0x130;
		gFolder						= 0x1C0;
		gBitsetNPC					= 0x1FC;
		gEmailCount					= 0x200;
		gWorld						= 0x210;
		gKeyItemInventory			= 0x2D0;
		gShopHpMemoryBuyCount		= 0x330;
		gShopPowerUpBuyCount		= 0x338;
		gShopInventory2				= 0x340;
		gGameStats					= 0x3D0;
		gShopInventory1				= 0x410;
		gBattleChipInventory		= 0x4A0;
		gEntityListNpc				= 0x13A0;
		gEmailIndexes				= 0x1FA0;
		gShopInventory7				= 0x1FE0;
		gPowerPlant					= 0x2070;
		gInventoryChecksumIndex		= 0x2150;
		gShopInventory6				= 0x2160;
		gShopInventory3				= 0x21F0;
		gShopInventory5				= 0x2280;
		gPrintBufferStart			= 0x2318;
		gPrintBufferEnd				= 0x2716;
		gPrintBufferCur				= 0x2718;
		gMonitorCurrentTask			= 0x3420;
		gMonitorTaskList			= 0x3430;
		gMonitorLastStackPtr		= 0x3470;
		gStartMenuState				= 0x3480;
		gBitsetActor				= 0x3484;
		gEntityBoundsList			= 0x3490;
		gBattle						= 0x3710;
		gAreaProperties				= 0x37A0;
		gTextTileBuffer				= 0x37E0;
		tempBg1Hofs					= 0x46E0;
		gSpriteTilesetDetailCount	= 0x4704;
		gBgAnimationTaskList		= 0x4710;
		gTransition					= 0x48B8;
		gBitsetAttack				= 0x4890;
		gCurMapElevationData		= 0x48A0;
		gFillValue					= 0x48C0;
		gBattleUi					= 0x48D0;
		gBlendSettings				= 0x4900;
		gBitsetEffect				= 0x4908;
		gBattleFolder				= 0x4910;
		gBattleSpriteArgsArrayCount	= 0x4930;
		eFrameWaitValue				= 0x4934;
		gMapEventState				= 0x4940;
		gCamera						= 0x4950;
		gIsObjectXFlipped			= 0x4994;
		eObjPalette0				= 0x49A0;
		eObjPalette1				= 0x49C0;
		eObjPalette2				= 0x49E0;
		eObjPalette3				= 0x4A00;
		eObjPalette4				= 0x4A20;
		eObjPalette5				= 0x4A40;
		eObjPalette6				= 0x4A60;
		eObjPalette7				= 0x4A80;
		eObjPalette8				= 0x4AA0;
		eObjPalette9				= 0x4AC0;
		eObjPaletteA				= 0x4AE0;
		eObjPaletteB				= 0x4B00;
		eObjPaletteC				= 0x4B20;
		eObjPaletteD				= 0x4B40;
		eObjPaletteE				= 0x4B60;
		eObjPaletteF				= 0x4B80;
		gSpriteAffineDataFlag		= 0x4BA4;
		gMapChange					= 0x4BB0;
		gBattleMessageList			= 0x4BD0;
		gListEffect					= 0x4CD0;
		gPETBattery					= 0x62D0;
		gMenu						= 0x62E0;
		gOamAttributeCount			= 0x6338;
		gSceneCamera				= 0x6340;
		gText						= 0x6350;
		gBitsetPlayerLocation		= 0x63DC;
		gTextOptionFlags			= 0x63E0;
		gEntityListPlayerLocation	= 0x63F0;
		gFrameCounter				= 0x64A0;
		gTextUi						= 0x65D0;
		gInput						= 0x65F0;
		gShop						= 0x6610;
		gEntityListActor			= 0x66B0;
		gFadeSettings				= 0x6CB0;
		gManager					= 0x6CB8;
		eRngState					= 0x6CC0;
		eBgPalette0					= 0x6CD0;
		eBgPalette1					= 0x6CF0;
		eBgPalette2					= 0x6D10;
		eBgPalette3					= 0x6D30;
		eBgPalette4					= 0x6D50;
		eBgPalette5					= 0x6D70;
		eBgPalette6					= 0x6D90;
		eBgPalette7					= 0x6DB0;
		eBgPalette8					= 0x6DD0;
		eBgPalette9					= 0x6DF0;
		eBgPaletteA					= 0x6E10;
		eBgPaletteB					= 0x6E30;
		eBgPaletteC					= 0x6E50;
		eBgPaletteD					= 0x6E70;
		eBgPaletteE					= 0x6E90;
		eBgPaletteF					= 0x6EB0;
		gFieldObstacleManager		= 0x6ED0;
		gSpriteAffineDataList		= 0x6F00;
		eFrameCounter				= 0x7080;
		gFuncPtrBgUpdatePostLoop	= 0x7090;
		gFuncPtrBgUpdateHBlank		= 0x7094;
		gFuncPtrBgUpdatePreLoop		= 0x7098;
		gScene						= 0x70A0;
		gCredits					= 0x70D0;
		gCurMapBoundaryData			= 0x70E0;
		gListSpriteTilesetDetail	= 0x7200;
		gPetStatusControl			= 0x74C8;
		gEntityBoundsListCount		= 0x74D0;
		eDmaParamListSize			= 0x74D4;
		gDemo						= 0x74D8;
		gDisplaySettings			= 0x7510;
		gChipTrader					= 0x7530;
		gPlayerAnimation			= 0x7570;
		gMainMenu					= 0x7590;
		gListMPStateAll				= 0x75A0;
		gPlayerBattleStates			= 0x75F0;
		gTextBufferList				= 0x76D0;
		gBattleSpriteArgsArray		= 0x78D0;
		gOamFreeObjectCount			= 0x7B50;
		gPanelStatuses				= 0x7B60;
		gScreenDim					= 0x7DE0;
		gLayoutDialogueText			= 0x7E10;
		eDmaParamList				= 0x8010;
		gEntityListAttack			= 0x8410;
		gCurMapEventData			= 0x9A10;
		gCurMapCoverData			= 0x9A30;
		gBgDataManager				= 0x9A50;
		gPasscodeEntry				= 0x9A80;
		gSpriteLzDetails			= 0x9AA0;
		gListFieldObject			= 0xA9E0;
		gStartMenu					= 0xACF0;
		gBgTileDataBuffer0			= 0xAD10;
		gBgTileDataBuffer9			= 0xAED0;
		gBgTileDataBuffer8			= 0xAF10;
		gBgTileDataBufferA			= 0xAFF0;
		gBgTileDataBuffer4			= 0xB110;
		gBgTileDataBuffer5			= 0xB150;
		gBgTileDataBuffer6			= 0xB290;
		gBgTileDataBuffer1			= 0xB510;
		gBgTileDataBuffer2			= 0xB710;
		gBgTileDataBuffer7			= 0xB8D0;
		gBgTileDataBufferB			= 0xB1B0;
		gBgTileDataBuffer3			= 0xBC10;
		gSpritePalettesLoaded		= 0xC110;
		gBitsetFieldObject			= 0xC114;
		gGameOverState				= 0xC118;
		gSpriteTilesetOffset0		= 0xC120;
		tempBg1Vofs					= 0xC190;
		gWindowSettings				= 0xC1B0;
		gMPState0					= 0xC1D0;
		gMPState1					= 0xC1E0;
		gLatestMpInput				= 0xC1F0;
		gListMpState				= 0xC200;
		gCurPlayerPos				= 0xC230;
		gMapSegPos					= 0xC240;
		gCustomScreen				= 0xC270;
		gNpcTalkState				= 0xC51A;
		musicPlayerInfo_13			= 0xC520;
		musicPlayerInfo_17			= 0xC560;
		musicPlayerInfo_0D			= 0xC5A0;
		musicPlayerInfo_05			= 0xC5E0;
		musicPlayerInfo_1E			= 0xC620;
		musicPlayerInfo_10			= 0xC660;
		musicPlayerInfo_09			= 0xC6A0;
		musicPlayerInfo_06			= 0xC6E0;
		musicPlayerInfo_00			= 0xC720;
		musicPlayerInfo_1A			= 0xC760;
		musicPlayerInfo_14			= 0xC7A0;
		musicPlayerInfo_18			= 0xC7E0;
		musicPlayerInfo_15			= 0xC820;
		musicPlayerInfo_12			= 0xC860;
		musicPlayerInfo_0E			= 0xC8A0;
		musicPlayerInfo_1C			= 0xC8E0;
		musicPlayerInfo_1F			= 0xC920;
		musicPlayerInfo_07			= 0xC960;
		musicPlayerInfo_01			= 0xC9A0;
		musicPlayerInfo_02			= 0xC9E0;
		musicPlayerInfo_0A			= 0xCA20;
		musicPlayerInfo_19			= 0xCA60;
		musicPlayerInfo_1D			= 0xCAA0;
		musicPlayerInfo_16			= 0xCAE0;
		musicPlayerInfo_0F			= 0xCB20;
		musicPlayerInfo_0C			= 0xCB60;
		musicPlayerInfo_11			= 0xCBA0;
		musicPlayerInfo_04			= 0xCBE0;
		gMPlayMemAccArea			= 0xCC20;
		musicPlayerInfo_1B			= 0xCC30;
		musicPlayerInfo_08			= 0xCC70;
		musicPlayerInfo_03			= 0xCCB0;
		musicPlayerInfo_0B			= 0xCCF0;
		gTempMemory					= 0x11000;
		gLibraryChipIndexList		= 0x15000;
		gSpriteDecompLocation1		= 0x16000;
		gChipBag					= 0x19000;
		gDstCompressedSpriteData	= 0x3C000;
	} > ewram

	. = __iwram_start;
	iwram (NOLOAD) :
	{
		gScreens				= 0x0;
		interruptVector			= 0x2000;
		interruptVectorHblank	= 0x2004;
		iwOamAttributeList		= 0x21E0;
		iwBufferUITextTile		= 0x25E0;
		iwTilesetSelectedChips	= 0x2FA0;
		gBattleHandChipIcons	= 0x30E0;
		gSoundInfo				= 0x4B10;
		gMPlayJumpTable			= 0x5AC0;
		gCgbChans				= 0x5B50;
		SoundMainRAM			= 0x5C50;
		interruptHandlerStart	= 0x6800;
		interruptHandlerEnd		= 0x7640;
		iwMonitorStackTop		= 0x7D80;
		iwSpriteContainerList	= 0x47C0;
		iwSpriteList0			= 0x47E0;
		iwSpriteList1			= 0x4780;
		iwSpriteList2			= 0x2040;
		iwSpriteList3			= 0x45E0;
	} > iwram

	. = __text_start;
	.text :  {
		build/crt0.o(.text)
		build/main.o(.text)
		build/monitor.o(.text)
		build/sound.o(.text)
		build/dma.o(.text)
		build/utility.o(.text)
		build/field.o(.text)
		build/rng.o(.text)
		build/video.o(.text)
		build/bg_update.o(.text)
		build/bg_task.o(.text)
		build/screen.o(.text)
		build/asset_entity.o(.text)
		build/sprite.o(.text)
		build/entity.o(.text)
		build/entity_bounds.o(.text)
		build/sio.o(.text)
		build/field_object.o(.text)
		build/player_location.o(.text)
		build/actor.o(.text)
		build/attack.o(.text)
		build/effect.o(.text)
		build/npc.o(.text)
		build/debug.o(.text)
		build/world.o(.text)
		build/fade.o(.text)
		build/battle/battle_init.o(.text)
		build/battle/battle.o(.text)
		build/battle/screendim/screendim.o(.text)
		build/battle/battle_util.o(.text)
		build/battle/battle_regular.o(.text)
		build/battle/battle_tutorial1.o(.text)
		build/battle/battle_tutorial2.o(.text)
		build/battle/battle_tutorial3.o(.text)
		build/battle/battle_mpstate.o(.text)
		build/battle/battle_util2.o(.text)
		build/enemy_detail.o(.text)
		build/flag.o(.text)
		build/main_menu.o(.text)
		build/oam.o(.text)
		build/camera.o(.text)
		build/bg_data_manager.o(.text)
		build/map.o(.text)
		build/asset_spritelist.o(.text)
		build/asset_bgdata.o(.text)
		build/text.o(.text)
		build/battle_ui.o(.text)
		build/custom_screen.o(.text)
		build/pet_status_control.o(.text)
		build/transition.o(.text)
		build/battle_message.o(.text)
		build/map_setup.o(.text)
		build/scene.o(.text)
		build/scene_camera.o(.text)
		build/demo.o(.text)
		build/key_item.o(.text)
		build/splash.o(.text)
		build/passcode.o(.text)
		build/start_menu.o(.text)
		build/menu/menu.o(.text)
		build/menu/folder.o(.text)
		build/menu/library.o(.text)
		build/menu/megaman.o(.text)
		build/menu/email.o(.text)
		build/menu/item.o(.text)
		build/menu/network.o(.text)
		build/menu/save.o(.text)
		build/shop.o(.text)
		build/save.o(.text)
		build/pet_battery.o(.text)
		build/game_over.o(.text)
		build/chip_trader.o(.text)
		build/credits.o(.text)
		build/maps/offline/School/exit.o(.text)
		build/maps/offline/School/anim.o(.text)
		build/maps/offline/School/setup.o(.text)
		build/maps/offline/School/directory.o(.text)
		build/maps/offline/School/School_Class_5A/setup.o(.text)
		build/maps/offline/School/School_Class_5B/setup.o(.text)
		build/maps/offline/School/School_Library/setup.o(.text)
		build/maps/offline/School/School_2F_Hallway/setup.o(.text)
		build/maps/offline/School/School_Class_1A/setup.o(.text)
		build/maps/offline/School/School_Class_1B/setup.o(.text)
		build/maps/offline/School/School_AV_Room/setup.o(.text)
		build/maps/offline/School/School_Infirmary/setup.o(.text)
		build/maps/offline/School/School_1F_Hallway/setup.o(.text)
		build/maps/offline/School/School_Cross_Hallway/setup.o(.text)
		build/maps/offline/School/School_Storage/setup.o(.text)
		build/maps/offline/School/School_Staff_Lounge/setup.o(.text)
		build/maps/offline/School/School_Staff_Lounge_Hallway/setup.o(.text)
		build/maps/offline/School/assets.o(.text)
		build/maps/offline/ACDC/exit.o(.text)
		build/maps/offline/ACDC/anim.o(.text)
		build/maps/offline/ACDC/setup.o(.text)
		build/maps/offline/ACDC/directory.o(.text)
		build/maps/offline/ACDC/ACDC_Town/setup.o(.text)
		build/maps/offline/ACDC/ACDC_School_Gate/setup.o(.text)
		build/maps/offline/ACDC/ACDC_Lan_Living_Room/setup.o(.text)
		build/maps/offline/ACDC/ACDC_Lan_Room/setup.o(.text)
		build/maps/offline/ACDC/ACDC_Mayl_Living_Room/setup.o(.text)
		build/maps/offline/ACDC/ACDC_Mayl_Room/setup.o(.text)
		build/maps/offline/ACDC/ACDC_Dex_Room/setup.o(.text)
		build/maps/offline/ACDC/ACDC_Yai_Room/setup.o(.text)
		build/maps/offline/ACDC/ACDC_Higsbys/setup.o(.text)
		build/maps/offline/ACDC/ACDC_Station/setup.o(.text)
		build/maps/offline/ACDC/ACDC_Secret_Station/setup.o(.text)
		build/maps/offline/ACDC/assets.o(.text)
		build/maps/offline/Govt/exit.o(.text)
		build/maps/offline/Govt/anim.o(.text)
		build/maps/offline/Govt/setup.o(.text)
		build/maps/offline/Govt/directory.o(.text)
		build/maps/offline/Govt/Govt_Complex_Front/setup.o(.text)
		build/maps/offline/Govt/Govt_Complex_Station/setup.o(.text)
		build/maps/offline/Govt/Govt_Waterworks_Lobby/setup.o(.text)
		build/maps/offline/Govt/Govt_SciLab_Lobby/setup.o(.text)
		build/maps/offline/Govt/Govt_Complex_Hallway/setup.o(.text)
		build/maps/offline/Govt/Govt_Yuichiro_Lab/setup.o(.text)
		build/maps/offline/Govt/Govt_Waterworks_Office/setup.o(.text)
		build/maps/offline/Govt/Govt_Waterworks_Control_Room/setup.o(.text)
		build/maps/offline/Govt/Govt_Waterworks_Pump_Room/setup.o(.text)
		build/maps/offline/Govt/Govt_Waterworks_Purification_Room/setup.o(.text)
		build/maps/offline/Govt/assets.o(.text)
		build/maps/offline/DenTown/exit.o(.text)
		build/maps/offline/DenTown/setup.o(.text)
		build/maps/offline/DenTown/directory.o(.text)
		build/maps/offline/DenTown/DenTown_Center/setup.o(.text)
		build/maps/offline/DenTown/DenTown_Station/setup.o(.text)
		build/maps/offline/DenTown/DenTown_Block_1/setup.o(.text)
		build/maps/offline/DenTown/DenTown_Block_2/setup.o(.text)
		build/maps/offline/DenTown/DenTown_Block_3/setup.o(.text)
		build/maps/offline/DenTown/DenTown_Block_4/setup.o(.text)
		build/maps/offline/DenTown/DenTown_Miyu_Antiques/setup.o(.text)
		build/maps/offline/DenTown/DenTown_Summer_School/setup.o(.text)
		build/maps/offline/DenTown/assets.o(.text)
		build/maps/offline/SciLab/exit.o(.text)
		build/maps/offline/SciLab/anim.o(.text)
		build/maps/offline/SciLab/setup.o(.text)
		build/maps/offline/SciLab/directory.o(.text)
		build/maps/offline/SciLab/SciLab_Restaurant_Hallway/setup.o(.text)
		build/maps/offline/SciLab/SciLab_Restaurant/setup.o(.text)
		build/maps/offline/SciLab/SciLab_Power_Plant_Hallway/setup.o(.text)
		build/maps/offline/SciLab/SciLab_Power_Plant/setup.o(.text)
		build/maps/offline/SciLab/SciLab_Power_Plant_Control_Room/setup.o(.text)
		build/maps/offline/SciLab/SciLab_Generator_Room/setup.o(.text)
		build/maps/offline/SciLab/assets.o(.text)
		build/maps/offline/WWW/exit.o(.text)
		build/maps/offline/WWW/anim.o(.text)
		build/maps/offline/WWW/setup.o(.text)
		build/maps/offline/WWW/directory.o(.text)
		build/maps/offline/WWW/WWW_Base/setup.o(.text)
		build/maps/offline/WWW/WWW_Wily_Lab/setup.o(.text)
		build/maps/offline/WWW/WWW_Rocket_Hangar/setup.o(.text)
		build/maps/offline/WWW/WWW_Passage_1/setup.o(.text)
		build/maps/offline/WWW/WWW_Passage_2/setup.o(.text)
		build/maps/offline/WWW/WWW_Passage_3/setup.o(.text)
		build/maps/offline/WWW/assets.o(.text)
		build/maps/online/School_Comp/exit.o(.text)
		build/maps/online/School_Comp/anim.o(.text)
		build/maps/online/School_Comp/setup.o(.text)
		build/maps/online/School_Comp/directory.o(.text)
		build/maps/online/School_Comp/School_Comp_1/setup.o(.text)
		build/maps/online/School_Comp/School_Comp_2/setup.o(.text)
		build/maps/online/School_Comp/School_Comp_3/setup.o(.text)
		build/maps/online/School_Comp/School_Comp_4/setup.o(.text)
		build/maps/online/School_Comp/School_Comp_5/setup.o(.text)
		build/maps/online/School_Comp/assets.o(.text)
		build/maps/online/Oven_Comp/exit.o(.text)
		build/maps/online/Oven_Comp/anim.o(.text)
		build/maps/online/Oven_Comp/setup.o(.text)
		build/maps/online/Oven_Comp/directory.o(.text)
		build/maps/online/Oven_Comp/Oven_Comp_1/setup_S0.o(.text)
		build/maps/online/Oven_Comp/Oven_Comp_2/setup_S0.o(.text)
		build/maps/online/Oven_Comp/Oven_Comp_1/setup_S2.o(.text)
		build/maps/online/Oven_Comp/Oven_Comp_2/setup_S2.o(.text)
		build/maps/online/Oven_Comp/assets.o(.text)
		build/maps/online/Waterworks_Comp/exit.o(.text)
		build/maps/online/Waterworks_Comp/anim.o(.text)
		build/maps/online/Waterworks_Comp/setup.o(.text)
		build/maps/online/Waterworks_Comp/directory.o(.text)
		build/maps/online/Waterworks_Comp/Waterworks_Comp_1/setup.o(.text)
		build/maps/online/Waterworks_Comp/Waterworks_Comp_2/setup.o(.text)
		build/maps/online/Waterworks_Comp/Waterworks_Comp_3/setup.o(.text)
		build/maps/online/Waterworks_Comp/Waterworks_Comp_4/setup.o(.text)
		build/maps/online/Waterworks_Comp/Waterworks_Comp_5/setup.o(.text)
		build/maps/online/Waterworks_Comp/Waterworks_Comp_6/setup.o(.text)
		build/maps/online/Waterworks_Comp/assets.o(.text)
		build/maps/online/Traffic_Light_Comp/exit.o(.text)
		build/maps/online/Traffic_Light_Comp/anim.o(.text)
		build/maps/online/Traffic_Light_Comp/setup.o(.text)
		build/maps/online/Traffic_Light_Comp/directory.o(.text)
		build/maps/online/Traffic_Light_Comp/Traffic_Light_Comp_1/setup.o(.text)
		build/maps/online/Traffic_Light_Comp/Traffic_Light_Comp_2/setup.o(.text)
		build/maps/online/Traffic_Light_Comp/Traffic_Light_Comp_3/setup.o(.text)
		build/maps/online/Traffic_Light_Comp/Traffic_Light_Comp_4/setup.o(.text)
		build/maps/online/Traffic_Light_Comp/Traffic_Light_Comp_5/setup.o(.text)
		build/maps/online/Traffic_Light_Comp/assets.o(.text)
		build/maps/online/Power_Plant_Comp/exit.o(.text)
		build/maps/online/Power_Plant_Comp/anim.o(.text)
		build/maps/online/Power_Plant_Comp/setup.o(.text)
		build/maps/online/Power_Plant_Comp/directory.o(.text)
		build/maps/online/Power_Plant_Comp/Power_Plant_Comp_1/setup.o(.text)
		build/maps/online/Power_Plant_Comp/Power_Plant_Comp_2/setup.o(.text)
		build/maps/online/Power_Plant_Comp/Power_Plant_Comp_3/setup.o(.text)
		build/maps/online/Power_Plant_Comp/Power_Plant_Comp_4/setup.o(.text)
		build/maps/online/Power_Plant_Comp/assets.o(.text)
		build/maps/online/WWW_Comp/exit.o(.text)
		build/maps/online/WWW_Comp/anim.o(.text)
		build/maps/online/WWW_Comp/setup.o(.text)
		build/maps/online/WWW_Comp/directory.o(.text)
		build/maps/online/WWW_Comp/WWW_Comp_1/setup.o(.text)
		build/maps/online/WWW_Comp/WWW_Comp_2/setup.o(.text)
		build/maps/online/WWW_Comp/WWW_Comp_3/setup.o(.text)
		build/maps/online/WWW_Comp/WWW_Comp_4/setup.o(.text)
		build/maps/online/WWW_Comp/WWW_Comp_5/setup.o(.text)
		build/maps/online/WWW_Comp/Rocket_Comp/setup.o(.text)
		build/maps/online/WWW_Comp/assets.o(.text)
		build/maps/online/ACDC_HP/exit.o(.text)
		build/maps/online/ACDC_HP/anim.o(.text)
		build/maps/online/ACDC_HP/setup.o(.text)
		build/maps/online/ACDC_HP/directory.o(.text)
		build/maps/online/ACDC_HP/ACDC_Lan_PC/setup.o(.text)
		build/maps/online/ACDC_HP/ACDC_Mayl_PC/setup.o(.text)
		build/maps/online/ACDC_HP/ACDC_Yai_PC/setup.o(.text)
		build/maps/online/ACDC_HP/ACDC_Dex_PC/setup.o(.text)
		build/maps/online/ACDC_HP/assets.o(.text)
		build/maps/online/Govt_HP/exit.o(.text)
		build/maps/online/Govt_HP/anim.o(.text)
		build/maps/online/Govt_HP/setup.o(.text)
		build/maps/online/Govt_HP/directory.o(.text)
		build/maps/online/Govt_HP/Govt_Yuichiro_PC/setup.o(.text)
		build/maps/online/Govt_HP/Govt_Lunch_Cart_Comp/setup.o(.text)
		build/maps/online/Govt_HP/assets.o(.text)
		build/maps/online/DenTown_HP/exit.o(.text)
		build/maps/online/DenTown_HP/anim.o(.text)
		build/maps/online/DenTown_HP/setup.o(.text)
		build/maps/online/DenTown_HP/directory.o(.text)
		build/maps/online/DenTown_HP/DenTown_Antique_Comp/setup.o(.text)
		build/maps/online/DenTown_HP/assets.o(.text)
		build/maps/online/SciLab_HP/exit.o(.text)
		build/maps/online/SciLab_HP/anim.o(.text)
		build/maps/online/SciLab_HP/setup.o(.text)
		build/maps/online/SciLab_HP/directory.o(.text)
		build/maps/online/SciLab_HP/SciLab_Fish_Stand_Comp/setup.o(.text)
		build/maps/online/SciLab_HP/assets.o(.text)
		build/maps/online/Other_Comp/exit.o(.text)
		build/maps/online/Other_Comp/anim.o(.text)
		build/maps/online/Other_Comp/setup.o(.text)
		build/maps/online/Other_Comp/directory.o(.text)
		build/maps/online/Other_Comp/Other_Doghouse_Comp/setup.o(.text)
		build/maps/online/Other_Comp/Other_Servbot_Comp/setup.o(.text)
		build/maps/online/Other_Comp/Other_New_Game_Machine_Comp/setup.o(.text)
		build/maps/online/Other_Comp/Other_Telephone_Comp/setup.o(.text)
		build/maps/online/Other_Comp/Other_Car_Comp/setup.o(.text)
		build/maps/online/Other_Comp/Other_Waterworks_Vending_Machine/setup.o(.text)
		build/maps/online/Other_Comp/Other_Lobby_TV_Comp/setup.o(.text)
		build/maps/online/Other_Comp/Other_Large_Monitor_Comp/setup.o(.text)
		build/maps/online/Other_Comp/Other_Control_Equipment_Comp/setup.o(.text)
		build/maps/online/Other_Comp/Other_SciLab_Vending_Machine/setup.o(.text)
		build/maps/online/Other_Comp/Other_Recycled_PET_Comp/setup.o(.text)
		build/maps/online/Other_Comp/Other_Big_Vase_Comp/setup.o(.text)
		build/maps/online/Other_Comp/Other_Blackboard_Comp/setup.o(.text)
		build/maps/online/Other_Comp/assets.o(.text)
		build/maps/online/Internet/exit.o(.text)
		build/maps/online/Internet/anim.o(.text)
		build/maps/online/Internet/setup.o(.text)
		build/maps/online/Internet/directory.o(.text)
		build/maps/online/Internet/Internet_1/setup.o(.text)
		build/maps/online/Internet/Internet_2/setup.o(.text)
		build/maps/online/Internet/Internet_3/setup.o(.text)
		build/maps/online/Internet/Internet_4/setup.o(.text)
		build/maps/online/Internet/Undernet_1/setup.o(.text)
		build/maps/online/Internet/Undernet_2/setup.o(.text)
		build/maps/online/Internet/Undernet_3/setup.o(.text)
		build/maps/online/Internet/Undernet_4/setup.o(.text)
		build/maps/online/Internet/Undernet_5/setup.o(.text)
		build/maps/online/Internet/Undernet_6/setup.o(.text)
		build/maps/online/Internet/Undernet_7/setup.o(.text)
		build/maps/online/Internet/Undernet_8/setup.o(.text)
		build/maps/online/Internet/Undernet_9/setup.o(.text)
		build/maps/online/Internet/Undernet_10/setup.o(.text)
		build/maps/online/Internet/Undernet_11/setup.o(.text)
		build/maps/online/Internet/Undernet_12/setup.o(.text)
		build/maps/online/Internet/assets.o(.text)
		build/player_location_handler.o(.text)
		build/routine/actor.o(.text)
		build/routine/field_obstacle.o(.text)
		build/routine/poison_drain.o(.text)
		build/routine/player.o(.text)
		build/routine/woodman.o(.text)
		build/routine/canodumb.o(.text)
		build/routine/fireman.o(.text)
		build/routine/mettaur.o(.text)
		build/routine/vulgear.o(.text)
		build/routine/mayl.o(.text)
		build/routine/lan_bed.o(.text)
		build/routine/brown_car.o(.text)
		build/routine/beetank.o(.text)
		build/routine/spooky.o(.text)
		build/routine/poweredcannon.o(.text)
		build/routine/gutsman.o(.text)
		build/routine/hardhead.o(.text)
		build/routine/fishy.o(.text)
		build/routine/numberman.o(.text)
		build/routine/swordy.o(.text)
		build/routine/puffy.o(.text)
		build/routine/flappy.o(.text)
		build/routine/piranha.o(.text)
		build/routine/cloudy.o(.text)
		build/routine/stoneman.o(.text)
		build/routine/fireman_chip.o(.text)
		build/routine/numberman_chip.o(.text)
		build/routine/floshell.o(.text)
		build/routine/gutsman_chip.o(.text)
		build/routine/handy.o(.text)
		build/routine/iceman.o(.text)
		build/routine/coldbear.o(.text)
		build/routine/iceman_chip.o(.text)
		build/routine/stoneman_chip.o(.text)
		build/routine/jelly.o(.text)
		build/routine/ratty.o(.text)
		build/routine/popper.o(.text)
		build/routine/skullman.o(.text)
		build/routine/colorman.o(.text)
		build/routine/mini_colorman.o(.text)
		build/routine/elecman.o(.text)
		build/routine/protoman.o(.text)
		build/routine/miney.o(.text)
		build/routine/ammonicule.o(.text)
		build/routine/sharkman.o(.text)
		build/routine/prog.o(.text)
		build/routine/billy.o(.text)
		build/routine/megalian.o(.text)
		build/routine/remobit.o(.text)
		build/routine/bombman.o(.text)
		build/routine/skullman_chip.o(.text)
		build/routine/roll_chip.o(.text)
		build/routine/bigstraight.o(.text)
		build/routine/gutsshoot_gutsman.o(.text)
		build/routine/gutsshoot_megaman.o(.text)
		build/routine/fanner.o(.text)
		build/routine/candevil.o(.text)
		build/routine/deathstorm.o(.text)
		build/routine/mosqurito.o(.text)
		build/routine/drain.o(.text)
		build/routine/lifevirus.o(.text)
		build/routine/colorman_chip.o(.text)
		build/routine/mini_colorman_chip.o(.text)
		build/routine/protoman_chip.o(.text)
		build/routine/sharkman_chip.o(.text)
		build/routine/elecman_chip.o(.text)
		build/routine/magicman.o(.text)
		build/routine/pharaohman.o(.text)
		build/routine/poitton.o(.text)
		build/routine/shadowman.o(.text)
		build/routine/bigsnake.o(.text)
		build/routine/bigsnake_body.o(.text)
		build/routine/gaia.o(.text)
		build/routine/bass.o(.text)
		build/routine/satella.o(.text)
		build/routine/pharaohman_chip.o(.text)
		build/routine/shadowman_chip.o(.text)
		build/routine/magicman_chip.o(.text)
		build/routine/bombman_chip.o(.text)
		build/routine/bass_chip.o(.text)
		build/routine/lifesaver.o(.text)
		build/routine/2xhero_megaman.o(.text)
		build/routine/2xhero_protoman.o(.text)
		build/routine/heavystamp.o(.text)
		build/routine/bloodsuck.o(.text)
		build/routine/mole.o(.text)
		build/attack/animation_only.o(.text)
		build/attack/icemanbeetankbomb.o(.text)
		build/attack/woodtower.o(.text)
		build/attack/sword.o(.text)
		build/attack/cannon.o(.text)
		build/attack/unk05.o(.text)
		build/attack/unk06.o(.text)
		build/attack/metguard.o(.text)
		build/attack/aura.o(.text)
		build/attack/unk09.o(.text)
		build/attack/bomb.o(.text)
		build/attack/charging.o(.text)
		build/attack/shotgun.o(.text)
		build/attack/burnerbomb.o(.text)
		build/attack/shockwave.o(.text)
		build/attack/unk0F.o(.text)
		build/attack/tower.o(.text)
		build/attack/firearm.o(.text)
		build/attack/buster.o(.text)
		build/attack/shotgun_burst.o(.text)
		build/attack/meteor.o(.text)
		build/attack/meteor_fire.o(.text)
		build/attack/powered_cannon.o(.text)
		build/attack/steal.o(.text)
		build/attack/quick_attack.o(.text)
		build/attack/sharp_strike.o(.text)
		build/attack/canodumb_target.o(.text)
		build/attack/howitzer.o(.text)
		build/attack/seed.o(.text)
		build/attack/numberball.o(.text)
		build/attack/timebomb.o(.text)
		build/attack/swordy_slash.o(.text)
		build/attack/diebomb.o(.text)
		build/attack/puffy_bubble.o(.text)
		build/attack/arrow.o(.text)
		build/attack/quake.o(.text)
		build/attack/cloudy.o(.text)
		build/attack/cube.o(.text)
		build/attack/stone.o(.text)
		build/attack/stoneman_laser.o(.text)
		build/attack/diebomb_chip.o(.text)
		build/attack/floshell_shield.o(.text)
		build/attack/floshell_minibomb.o(.text)
		build/attack/iceman_spikes.o(.text)
		build/attack/wave.o(.text)
		build/attack/ratton.o(.text)
		build/attack/magicfire.o(.text)
		build/attack/bonecrush.o(.text)
		build/attack/skull.o(.text)
		build/attack/colorman_ball.o(.text)
		build/attack/sparkstrike.o(.text)
		build/attack/columncurrent_h.o(.text)
		build/attack/columncurrent_v.o(.text)
		build/attack/mine.o(.text)
		build/attack/ammonicule_bubblewrap.o(.text)
		build/attack/progthunder.o(.text)
		build/attack/thunder.o(.text)
		build/attack/remobit.o(.text)
		build/attack/megalian_head.o(.text)
		build/attack/anubis.o(.text)
		build/attack/candle.o(.text)
		build/attack/ironshield.o(.text)
		build/attack/remobit_chip.o(.text)
		build/attack/bodyburn.o(.text)
		build/attack/battery.o(.text)
		build/attack/bigstraight.o(.text)
		build/attack/tornado.o(.text)
		build/attack/tornado_chip.o(.text)
		build/attack/bombman_bomb.o(.text)
		build/attack/lifevirus_sword.o(.text)
		build/attack/lifevirus_meteor_explosion.o(.text)
		build/attack/scuttlest.o(.text)
		build/attack/sarcophagus.o(.text)
		build/attack/pharaohtrap.o(.text)
		build/attack/dynamyte.o(.text)
		build/attack/bakufu.o(.text)
		build/attack/shuriken.o(.text)
		build/attack/bunshin.o(.text)
		build/attack/snakeegg.o(.text)
		build/attack/airburst.o(.text)
		build/attack/gaia_explosion.o(.text)
		build/attack/bass_explosion_yellow.o(.text)
		build/attack/bass_explosion_blue.o(.text)
		build/attack/lockon_target.o(.text)
		build/attack/pharaohman_coffin.o(.text)
		build/attack/shuriken_chip.o(.text)
		build/attack/magicfire_chip.o(.text)
		build/attack/bombshoot.o(.text)
		build/attack/bass_explosion_chip.o(.text)
		build/attack/lockon.o(.text)
		build/attack/bloodsuck_syringe.o(.text)
		build/attack/mole_hole.o(.text)
		build/effect/quick_effect.o(.text)
		build/effect/map_object.o(.text)
		build/effect/battle_hp.o(.text)
		build/effect/unk03.o(.text)
		build/effect/bomb_explosion.o(.text)
		build/effect/tower.o(.text)
		build/effect/unk06.o(.text)
		build/effect/sword_slash.o(.text)
		build/effect/fire_column.o(.text)
		build/effect/battlechip.o(.text)
		build/effect/tall_explosion.o(.text)
		build/effect/water_spray.o(.text)
		build/effect/program_advance.o(.text)
		build/effect/megaman_delete.o(.text)
		build/effect/virus_delete.o(.text)
		build/effect/battle_result.o(.text)
		build/effect/www_gate.o(.text)
		build/effect/diebomb_explosion.o(.text)
		build/effect/cloudy_rain.o(.text)
		build/effect/stone_piece.o(.text)
		build/effect/laser.o(.text)
		build/effect/boulders.o(.text)
		build/effect/teleport_portal.o(.text)
		build/effect/cube_break.o(.text)
		build/effect/jelly_charging.o(.text)
		build/effect/air_blowing.o(.text)
		build/effect/traffic_light.o(.text)
		build/effect/traffic_barrier.o(.text)
		build/effect/car.o(.text)
		build/effect/traffic_barrier_2.o(.text)
		build/effect/traffic_light_2.o(.text)
		build/effect/traffic.o(.text)
		build/effect/traffic_explosion.o(.text)
		build/effect/traffic_car_parts.o(.text)
		build/effect/traffic_light_toggle.o(.text)
		build/effect/pipe.o(.text)
		build/effect/pipe_2.o(.text)
		build/effect/pipe_3.o(.text)
		build/effect/nonstop_bus.o(.text)
		build/effect/electric_field.o(.text)
		build/effect/floor_break.o(.text)
		build/effect/colorman.o(.text)
		build/effect/remobit_thunder.o(.text)
		build/effect/chaud.o(.text)
		build/effect/poison_cloud.o(.text)
		build/effect/traffic_switch.o(.text)
		build/effect/count_zap.o(.text)
		build/effect/elecman.o(.text)
		build/effect/bar_switch.o(.text)
		build/effect/light_bulb.o(.text)
		build/effect/roll_heart.o(.text)
		build/effect/small_electrified.o(.text)
		build/effect/bombman_bomb_explosion.o(.text)
		build/effect/lifevirus_seed.o(.text)
		build/effect/bombman.o(.text)
		build/effect/lifevirus_aura.o(.text)
		build/effect/www_pass.o(.text)
		build/effect/scuttlest.o(.text)
		build/effect/lifevirus_meteor.o(.text)
		build/effect/magicman.o(.text)
		build/effect/lock_program.o(.text)
		build/effect/www_ice_wall.o(.text)
		build/effect/www_boulder.o(.text)
		build/effect/gutsman.o(.text)
		build/effect/dynamyte_red_dot.o(.text)
		build/effect/pharaohman_curse.o(.text)
		build/effect/dynamyte_explosion.o(.text)
		build/effect/megaman.o(.text)
		build/effect/jack_in.o(.text)
		build/effect/sparks.o(.text)
		build/effect/bass.o(.text)
		build/effect/gaia_base.o(.text)
		build/effect/generator_lightning.o(.text)
		build/effect/pharaohman_laser.o(.text)
		build/effect/bombshoot_explosion.o(.text)
		build/effect/navi_delete.o(.text)
		build/npc_handler.o(.text)
		build/battlechip/powered_cannon.o(.text)
		build/battlechip/zeta_omega_pa.o(.text)
		build/battlechip/beta_sigma_pa.o(.text)
		build/battlechip/buster_chip.o(.text)
		build/battlechip/geddon.o(.text)
		build/scene/story_00.o(.text)
		build/scene/story_01.o(.text)
		build/scene/locked_path.o(.text)
		build/scene/locked_path_M0000.o(.text)
		build/scene/story_02.o(.text)
		build/scene/story_03.o(.text)
		build/scene/story_04.o(.text)
		build/scene/jack_out.o(.text)
		build/scene/story_05.o(.text)
		build/scene/story_06.o(.text)
		build/scene/locked_path_M0102.o(.text)
		build/scene/jack_in.o(.text)
		build/scene/megaman_jack_in.o(.text)
		build/scene/story_07.o(.text)
		build/scene/story_08.o(.text)
		build/scene/meteor_attack.o(.text)
		build/scene/extinguish_flame.o(.text)
		build/scene/story_09.o(.text)
		build/scene/dialogue.o(.text)
		build/scene/story_0A.o(.text)
		build/scene/story_0B.o(.text)
		build/scene/story_0C.o(.text)
		build/scene/story_0D.o(.text)
		build/scene/story_0E.o(.text)
		build/scene/tutorial_battle.o(.text)
		build/scene/fixed_battle.o(.text)
		build/scene/after_fixed_battle.o(.text)
		build/scene/check_mail.o(.text)
		build/scene/skill_gate_fail.o(.text)
		build/scene/chip_trader_main.o(.text)
		build/scene/chip_trader_dialogue.o(.text)
		build/scene/story_0F.o(.text)
		build/scene/story_10.o(.text)
		build/scene/story_11.o(.text)
		build/scene/story_12.o(.text)
		build/scene/story_13.o(.text)
		build/scene/story_14.o(.text)
		build/scene/story_15.o(.text)
		build/scene/unlock_www_gate.o(.text)
		build/scene/school_comp_2_gateclear.o(.text)
		build/scene/story_17.o(.text)
		build/scene/story_18.o(.text)
		build/scene/story_19.o(.text)
		build/scene/school_comp_5_passcode.o(.text)
		build/scene/story_1A.o(.text)
		build/scene/story_1B.o(.text)
		build/scene/story_1C.o(.text)
		build/scene/change_map.o(.text)
		build/scene/get_schoolid.o(.text)
		build/scene/story_1D.o(.text)
		build/scene/story_1E.o(.text)
		build/scene/story_1F.o(.text)
		build/scene/story_20.o(.text)
		build/scene/story_21.o(.text)
		build/scene/story_22.o(.text)
		build/scene/story_23.o(.text)
		build/scene/story_24.o(.text)
		build/scene/story_25.o(.text)
		build/scene/story_26.o(.text)
		build/scene/story_27.o(.text)
		build/scene/story_28.o(.text)
		build/scene/story_29.o(.text)
		build/scene/story_2A.o(.text)
		build/scene/story_2B.o(.text)
		build/scene/story_2C.o(.text)
		build/scene/story_2D.o(.text)
		build/scene/story_2E.o(.text)
		build/scene/story_2F.o(.text)
		build/scene/story_30.o(.text)
		build/scene/story_31.o(.text)
		build/scene/story_32.o(.text)
		build/scene/story_33.o(.text)
		build/scene/story_34.o(.text)
		build/scene/train_ride.o(.text)
		build/scene/waterworks_purification_room_chaud.o(.text)
		build/scene/govt_yuichiro_pc_wait.o(.text)
		build/scene/waterworks_comp_turn_handle.o(.text)
		build/scene/waterworks_comp_ice_slide.o(.text)
		build/scene/story_35.o(.text)
		build/scene/story_36.o(.text)
		build/scene/story_37.o(.text)
		build/scene/story_38.o(.text)
		build/scene/story_39.o(.text)
		build/scene/story_3A.o(.text)
		build/scene/story_3B.o(.text)
		build/scene/story_3C.o(.text)
		build/scene/story_3D.o(.text)
		build/scene/story_3E.o(.text)
		build/scene/story_3F.o(.text)
		build/scene/story_40.o(.text)
		build/scene/story_41.o(.text)
		build/scene/story_42.o(.text)
		build/scene/story_43.o(.text)
		build/scene/story_44.o(.text)
		build/scene/story_45.o(.text)
		build/scene/story_46.o(.text)
		build/scene/story_47.o(.text)
		build/scene/story_48.o(.text)
		build/scene/story_49.o(.text)
		build/scene/story_4A.o(.text)
		build/scene/story_4B.o(.text)
		build/scene/story_4C.o(.text)
		build/scene/story_4D.o(.text)
		build/scene/story_4E.o(.text)
		build/scene/story_4F.o(.text)
		build/scene/story_50.o(.text)
		build/scene/story_51.o(.text)
		build/scene/story_52.o(.text)
		build/scene/story_53.o(.text)
		build/scene/story_54.o(.text)
		build/scene/story_55.o(.text)
		build/scene/story_56.o(.text)
		build/scene/story_57.o(.text)
		build/scene/story_58.o(.text)
		build/scene/story_5B.o(.text)
		build/scene/story_5C.o(.text)
		build/scene/story_5D.o(.text)
		build/scene/story_5E.o(.text)
		build/scene/story_5F.o(.text)
		build/scene/story_60.o(.text)
		build/scene/story_61.o(.text)
		build/scene/govt_elevator.o(.text)
		build/scene/recharge_success.o(.text)
		build/scene/recharge_prompt.o(.text)
		build/scene/story_elecman.o(.text)
		build/scene/story_62.o(.text)
		build/scene/story_63.o(.text)
		build/scene/story_64.o(.text)
		build/scene/battery.o(.text)
		build/scene/battery_switch.o(.text)
		build/scene/story_65.o(.text)
		build/scene/story_66.o(.text)
		build/scene/story_67.o(.text)
		build/scene/story_68.o(.text)
		build/scene/story_69.o(.text)
		build/scene/story_6A.o(.text)
		build/scene/story_6B.o(.text)
		build/scene/story_6C.o(.text)
		build/scene/story_6D.o(.text)
		build/scene/story_6E.o(.text)
		build/scene/story_6F.o(.text)
		build/scene/story_70.o(.text)
		build/scene/story_71.o(.text)
		build/scene/story_72.o(.text)
		build/scene/story_73.o(.text)
		build/scene/story_74.o(.text)
		build/scene/story_75.o(.text)
		build/scene/story_76.o(.text)
		build/scene/story_77.o(.text)
		build/scene/story_78.o(.text)
		build/scene/story_79.o(.text)
		build/scene/story_7A.o(.text)
		build/scene/story_7B.o(.text)
		build/scene/story_7C.o(.text)
		build/scene/story_7D.o(.text)
		build/scene/story_7E.o(.text)
		build/scene/story_7F.o(.text)
		build/scene/dentown_chaud.o(.text)
		build/scene/higmemo.o(.text)
		build/scene/auto_chip_shop.o(.text)
		build/scene/www_base_exit.o(.text)
		build/scene/lifevirus.o(.text)
		build/scene/www_comp_1_iceblock.o(.text)
		build/battle/screendim/util.o(.text)
		build/battle/screendim/recover.o(.text)
		build/battle/screendim/woodman.o(.text)
		build/battle/screendim/steal.o(.text)
		build/battle/screendim/powered_cannon.o(.text)
		build/battle/screendim/activate_progadv.o(.text)
		build/battle/screendim/fireman.o(.text)
		build/battle/screendim/numberman.o(.text)
		build/battle/screendim/gutsman.o(.text)
		build/battle/screendim/escape.o(.text)
		build/battle/screendim/repair.o(.text)
		build/battle/screendim/cube.o(.text)
		build/battle/screendim/timebomb.o(.text)
		build/battle/screendim/invisible.o(.text)
		build/battle/screendim/iceman.o(.text)
		build/battle/screendim/stoneman.o(.text)
		build/battle/screendim/geddon.o(.text)
		build/battle/screendim/cloudy.o(.text)
		build/battle/screendim/elecman_escape.o(.text)
		build/battle/screendim/mine.o(.text)
		build/battle/screendim/anubis.o(.text)
		build/battle/screendim/barrier.o(.text)
		build/battle/screendim/ironbody.o(.text)
		build/battle/screendim/candle.o(.text)
		build/battle/screendim/gauge.o(.text)
		build/battle/screendim/remobit.o(.text)
		build/battle/screendim/interrupt.o(.text)
		build/battle/screendim/skullman.o(.text)
		build/battle/screendim/roll.o(.text)
		build/battle/screendim/bigstraight.o(.text)
		build/battle/screendim/gutsshoot.o(.text)
		build/battle/screendim/deathstorm.o(.text)
		build/battle/screendim/drain.o(.text)
		build/battle/screendim/colorman.o(.text)
		build/battle/screendim/protoman.o(.text)
		build/battle/screendim/sharkman.o(.text)
		build/battle/screendim/elecman.o(.text)
		build/battle/screendim/pharaohtrap.o(.text)
		build/battle/screendim/snakeegg.o(.text)
		build/battle/screendim/dynamyte.o(.text)
		build/battle/screendim/pharaohman.o(.text)
		build/battle/screendim/shadowman.o(.text)
		build/battle/screendim/magicman.o(.text)
		build/battle/screendim/bombman.o(.text)
		build/battle/screendim/bass.o(.text)
		build/battle/screendim/lockon.o(.text)
		build/battle/screendim/lifesaver.o(.text)
		build/battle/screendim/doublehero.o(.text)
		build/battle/screendim/heavystamp.o(.text)
		build/battle/screendim/bloodsuck.o(.text)
		build/network.o(.text)
		build/m4a.o(.text)
		build/swi.o(.text)
		build/m4a_data.o(.text)
		build/sound_data.o(.text)
		build/sram_ptr.o(.text)
	} > rom

	intr __ram_code_address : {
		build/interrupt_handler.o(.text)
		build/screen_far.o(.text)
		build/sprite_frame_far.o(.text)
		build/oam_far.o(.text)
		build/text_far.o(.text)
		build/sort_sack_far.o(.text)
		build/irq_timer_far.o(.text)
		build/build_chip_sack_far.o(.text)
		build/extra_far.o(.text)
	} > rom

	asset __asset_load_addresss : {
		build/asset_1E0000.o(.text)
	} > rom

	. = __pal_start;
	pal (NOLOAD) :
	{
		PAL_BG = 0;
		PAL_OBJ = 0x200;
	} > palette

	. = __vram_start;
	vram (NOLOAD) :
	{
		BG_VRAM_BASE0			= 0;
		BG_VRAM_BASE1			= 0x4000;
		BG_VRAM_BASE2			= 0x8000;
		vtTilesetSelectedChips	= 0xAA80;
		BG_VRAM_BASE3			= 0xC000;
		BG_VRAM_SCREEN0			= 0xE000;
		vTextTileStart			= 0xC800;
		OBJ_VRAM0				= 0x10000;
	} > vram

	/DISCARD/ : {
		*(.glue_7*);
		*(.vfp11_veneer);
		*(.v4_bx);
		*(.iplt);
		*(.igot.plt);
		*(.rel*);
		*(.comment);
		*(.ARM*);
	}
}
