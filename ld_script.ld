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
__ewram_start	= ORIGIN(ewram);
__ewram_end		= ORIGIN(ewram) + LENGTH(ewram);
__iwram_start	= ORIGIN(iwram);
__iwram_end		= ORIGIN(iwram) + LENGTH(iwram);
__text_start	= ORIGIN(rom);
__vram_start    = ORIGIN(vram);
__pal_start     = ORIGIN(palette);

SECTIONS {
	. = __ewram_start;
	ewram (NOLOAD) :
	{
		gFlagBase					= 0;
		gShopInventory0				= 0x90;
		gShopInventory4				= 0x130;
		gFolder						= 0x1C0;
		gBitsetNPC					= 0x1FC;
		gEmailCount					= 0x200;
		gWorld						= 0x210;
		gKeyItemInventory			= 0x2D0;
		gShopHpMemoryBuyCount		= 0x330;
		gShopPowerUpBuyCount		= 0x338;
		gShopInventory2				= 0x340;
		eGameStats					= 0x3D0;
		gShopInventory1				= 0x410;
		gBattleChipInventory		= 0x4A0;
		gEntityListNpc				= 0x13A0;
		gEmailIndexes				= 0x1FA0;
		gShopInventory7				= 0x1FE0;
		gInventoryChecksumIndex		= 0x2150;
		gShopInventory6				= 0x2160;
		gShopInventory3				= 0x21F0;
		gShopInventory5				= 0x2280;
		gStartMenuState				= 0x3480;
		gBitsetActor				= 0x3484;
		gEntityBoundsList			= 0x3490;
		gBattle						= 0x3710;
		gAreaProperties				= 0x37A0;
		gTextTileBuffer				= 0x37E0;
		tempBg1Hofs					= 0x46E0;
		gSpriteTilesetDetailCount	= 0x4704;
		eMainState0x58				= 0x4710;
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
		eMainState0x24				= 0x4940;
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
		eMainState0x2C				= 0x4BB0;
		eMainState0x4C				= 0x4BD0;
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
		eMainState0x7C				= 0x6ED0;
		gSpriteAffineDataList		= 0x6F00;
		eFrameCounter				= 0x7080;
		gFuncPtrBgUpdatePostLoop	= 0x7090;
		gFuncPtrBgUpdateHBlank		= 0x7094;
		gFuncPtrBgUpdatePreLoop		= 0x7098;
		eMainState0x28				= 0x70A0;
		gCredits					= 0x70D0;
		gCurMapBoundaryData			= 0x70E0;
		gListSpriteTilesetDetail	= 0x7200;
		eMainState0x60				= 0x74C8;
		gEntityBoundsListCount		= 0x74D0;
		eDmaParamListSize			= 0x74D4;
		gDemo						= 0x74D8;
		gDisplaySettings			= 0x7510;
		gChipTrader					= 0x7530;
		gPlayerFixedAnimationState	= 0x7570;
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
		eMainState0x44				= 0x9A50;
		eMainState0x64				= 0x9A80;
		gSpriteLzDetails			= 0x9AA0;
		gListFieldObject			= 0xA9E0;
		eMainState0x6C				= 0xACF0;
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
		interruptHandlerStart	= 0x6800;
		interruptHandlerEnd		= 0x7640;
		iwSpriteContainerList	= 0x47C0;
		iwSpriteList0			= 0x47E0;
		iwSpriteList1			= 0x4780;
		iwSpriteList2			= 0x2040;
		iwSpriteList3			= 0x45E0;
	} > iwram

	. = __text_start;
	.text :  {
		INCLUDE include.ld
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
