global_label BGData_Offline
    .word BGData_School
    .word BGData_ACDC
    .word BGData_Govt
    .word BGData_DenTown
    .word BGData_SciLab
    .word BGData_WWW

global_label BGData_Online
    .word BGData_School_Comp
    .word BGData_Oven_Comp
    .word BGData_Waterworks_Comp
    .word BGData_Traffic_Light_Comp
    .word BGData_Power_Plant_Comp
    .word BGData_WWW_Comp
    .word 0
    .word 0
    .word BGData_ACDC_HP
    .word BGData_Govt_HP
    .word BGData_DenTown_HP
    .word BGData_SciLab_HP
    .word BGData_Other_Comp
    .word 0
    .word 0
    .word 0
    .word BGData_Internet

global_label BGData_Battle
    .word BGData_Battle_Other

BGData_School:

BgData_School_Class_5A:
    .word BgData_Tileset_School_Class_5A
    .word BgData_Palette_School_Class_5A
    .word BgData_Tilemap_School_Class_5A

BgData_School_Class_5B:
    .word BgData_Tileset_School_Class_5A
    .word BgData_Palette_School_Class_5A
    .word BgData_Tilemap_School_Class_5B

BgData_School_Library:
    .word BgData_Tileset_School_Library
    .word BgData_Palette_School_Library
    .word BgData_Tilemap_School_Library

BgData_School_2F_Hallway:
    .word BgData_Tileset_School_2F_Hallway
    .word BgData_Palette_School_2F_Hallway
    .word BgData_Tilemap_School_2F_Hallway

    .word 0x0
    .word 0x0
    .word 0x0

BgData_School_Class_1A:
    .word BgData_Tileset_School_Class_5A
    .word BgData_Palette_School_Class_1A
    .word BgData_Tilemap_School_Class_1A

BgData_School_Class_1B:
    .word BgData_Tileset_School_Class_5A
    .word BgData_Palette_School_Class_1B
    .word BgData_Tilemap_School_Class_1B

BgData_School_AV_Room:
    .word BgData_Tileset_School_Class_5A
    .word BgData_Palette_School_AV_Room
    .word BgData_Tilemap_School_AV_Room

BgData_School_Infirmary:
    .word BgData_Tileset_School_Infirmary
    .word BgData_Palette_School_Infirmary
    .word BgData_Tilemap_School_Infirmary

BgData_School_1F_Hallway:
    .word BgData_Tileset_School_2F_Hallway
    .word BgData_Palette_School_2F_Hallway
    .word BgData_Tilemap_School_1F_Hallway

    .word 0x0
    .word 0x0
    .word 0x0

BgData_School_Cross_Hallway:
    .word BgData_Tileset_School_2F_Hallway
    .word BgData_Palette_School_Cross_Hallway
    .word BgData_Tilemap_School_Cross_Hallway

BgData_School_Storage:
    .word BgData_Tileset_School_Storage
    .word BgData_Palette_School_Storage
    .word BgData_Tilemap_School_Storage

BgData_School_Staff_Lounge:
    .word BgData_Tileset_School_Staff_Lounge
    .word BgData_Palette_School_Staff_Lounge
    .word BgData_Tilemap_School_Staff_Lounge

BgData_School_Staff_Lounge_Hallway:
    .word BgData_Tileset_School_2F_Hallway
    .word BgData_Palette_School_Staff_Lounge_Hallway
    .word BgData_Tilemap_School_Staff_Lounge_Hallway

BGData_ACDC:

BgData_ACDC_Town:
    .word BgData_Tileset_ACDC_Town
    .word BgData_Palette_ACDC_Town
    .word BgData_Tilemap_ACDC_Town

BgData_ACDC_School_Gate:
    .word BgData_Tileset_ACDC_School_Gate
    .word BgData_Palette_ACDC_School_Gate
    .word BgData_Tilemap_ACDC_School_Gate

BgData_ACDC_Lan_Living_Room:
    .word BgData_Tileset_ACDC_Lan_Living_Room
    .word BgData_Palette_ACDC_Lan_Living_Room
    .word BgData_Tilemap_ACDC_Lan_Living_Room

BgData_ACDC_Lan_Room:
    .word BgData_Tileset_ACDC_Lan_Room
    .word BgData_Palette_ACDC_Lan_Room
    .word BgData_Tilemap_ACDC_Lan_Room

    .word 0x0
    .word 0x0
    .word 0x0

BgData_ACDC_Mayl_Living_Room:
    .word BgData_Tileset_ACDC_Mayl_Living_Room
    .word BgData_Palette_ACDC_Mayl_Living_Room
    .word BgData_Tilemap_ACDC_Mayl_Living_Room

BgData_ACDC_Mayl_Room:
    .word BgData_Tileset_ACDC_Mayl_Room
    .word BgData_Palette_ACDC_Mayl_Room
    .word BgData_Tilemap_ACDC_Mayl_Room

BgData_ACDC_Dex_Room:
    .word BgData_Tileset_ACDC_Dex_Room
    .word BgData_Palette_ACDC_Dex_Room
    .word BgData_Tilemap_ACDC_Dex_Room

    .word 0x0
    .word 0x0
    .word 0x0

BgData_ACDC_Yai_Room:
    .word BgData_Tileset_ACDC_Yai_Room
    .word BgData_Palette_ACDC_Yai_Room
    .word BgData_Tilemap_ACDC_Yai_Room

    .word 0x0
    .word 0x0
    .word 0x0

BgData_ACDC_Higsbys:
    .word BgData_Tileset_ACDC_Higsbys
    .word BgData_Palette_ACDC_Higsbys
    .word BgData_Tilemap_ACDC_Higsbys

BgData_ACDC_Station:
    .word BgData_Tileset_ACDC_Station
    .word BgData_Palette_ACDC_Station
    .word BgData_Tilemap_ACDC_Station

BgData_ACDC_Secret_Station:
    .word BgData_Tileset_ACDC_Station
    .word BgData_Palette_ACDC_Secret_Station
    .word BgData_Tilemap_ACDC_Secret_Station

BGData_Govt:

BgData_Govt_Complex_Front:
    .word BgData_Tileset_Govt_Complex_Front
    .word BgData_Palette_Govt_Complex_Front
    .word BgData_Tilemap_Govt_Complex_Front

BgData_Govt_Complex_Station:
    .word BgData_Tileset_ACDC_Station
    .word BgData_Palette_Govt_Complex_Station
    .word BgData_Tilemap_Govt_Complex_Station

BgData_Govt_Waterworks_Lobby:
    .word BgData_Tileset_Govt_Waterworks_Lobby
    .word BgData_Palette_Govt_Waterworks_Lobby
    .word BgData_Tilemap_Govt_Waterworks_Lobby

BgData_Govt_SciLab_Lobby:
    .word BgData_Tileset_Govt_SciLab_Lobby
    .word BgData_Palette_Govt_SciLab_Lobby
    .word BgData_Tilemap_Govt_SciLab_Lobby

BgData_Govt_Complex_Hallway:
    .word BgData_Tileset_Govt_Complex_Hallway
    .word BgData_Palette_Govt_Complex_Hallway
    .word BgData_Tilemap_Govt_Complex_Hallway

BgData_Govt_Yuichiro_Lab:
    .word BgData_Tileset_Govt_Yuichiro_Lab
    .word BgData_Palette_Govt_Yuichiro_Lab
    .word BgData_Tilemap_Govt_Yuichiro_Lab

BgData_Govt_Waterworks_Office:
    .word BgData_Tileset_Govt_Waterworks_Office
    .word BgData_Palette_Govt_Waterworks_Office
    .word BgData_Tilemap_Govt_Waterworks_Office

BgData_Govt_Waterworks_Control_Room:
    .word BgData_Tileset_Govt_Waterworks_Control_Room
    .word BgData_Palette_Govt_Waterworks_Control_Room
    .word BgData_Tilemap_Govt_Waterworks_Control_Room

    .word 0x0
    .word 0x0
    .word 0x0

BgData_Govt_Waterworks_Pump_Room:
    .word BgData_Tileset_Govt_Waterworks_Pump_Room
    .word BgData_Palette_Govt_Waterworks_Pump_Room
    .word BgData_Tilemap_Govt_Waterworks_Pump_Room

    .word 0x0
    .word 0x0
    .word 0x0

BgData_Govt_Waterworks_Purification_Room:
    .word BgData_Tileset_Govt_Waterworks_Pump_Room
    .word BgData_Palette_Govt_Waterworks_Purification_Room
    .word BgData_Tilemap_Govt_Waterworks_Purification_Room

BGData_DenTown:

BgData_DenTown_Center:
    .word BgData_Tileset_DenTown_Center
    .word BgData_Palette_DenTown_Center
    .word BgData_Tilemap_DenTown_Center

BgData_DenTown_Station:
    .word BgData_Tileset_ACDC_Station
    .word BgData_Palette_DenTown_Station
    .word BgData_Tilemap_DenTown_Station

BgData_DenTown_Block_1:
    .word BgData_Tileset_DenTown_Block_1
    .word BgData_Palette_DenTown_Block_1
    .word BgData_Tilemap_DenTown_Block_1

BgData_DenTown_Block_2:
    .word BgData_Tileset_DenTown_Block_1
    .word BgData_Palette_DenTown_Block_2
    .word BgData_Tilemap_DenTown_Block_2

BgData_DenTown_Block_3:
    .word BgData_Tileset_DenTown_Block_1
    .word BgData_Palette_DenTown_Block_3
    .word BgData_Tilemap_DenTown_Block_3

BgData_DenTown_Block_4:
    .word BgData_Tileset_DenTown_Block_1
    .word BgData_Palette_DenTown_Block_4
    .word BgData_Tilemap_DenTown_Block_4

BgData_DenTown_Miyu_Antiques:
    .word BgData_Tileset_DenTown_Miyu_Antiques
    .word BgData_Palette_DenTown_Miyu_Antiques
    .word BgData_Tilemap_DenTown_Miyu_Antiques

BgData_DenTown_Summer_School:
    .word BgData_Tileset_DenTown_Summer_School
    .word BgData_Palette_DenTown_Summer_School
    .word BgData_Tilemap_DenTown_Summer_School

BGData_SciLab:

BgData_SciLab_Restaurant:
    .word BgData_Tileset_SciLab_Restaurant_Hallway
    .word BgData_Palette_SciLab_Restaurant_Hallway
    .word BgData_Tilemap_SciLab_Restaurant_Hallway

BgData_SciLab_Restaurant_Hallway:
    .word BgData_Tileset_SciLab_Restaurant
    .word BgData_Palette_SciLab_Restaurant
    .word BgData_Tilemap_SciLab_Restaurant

BgData_SciLab_Power_Plant_Hallway:
    .word BgData_Tileset_SciLab_Restaurant_Hallway
    .word BgData_Palette_SciLab_Power_Plant_Hallway
    .word BgData_Tilemap_SciLab_Power_Plant_Hallway

BgData_SciLab_Power_Plant:
    .word BgData_Tileset_SciLab_Restaurant_Hallway
    .word BgData_Palette_SciLab_Power_Plant
    .word BgData_Tilemap_SciLab_Power_Plant

BgData_SciLab_Power_Plant_Control_Room:
    .word BgData_Tileset_Govt_Waterworks_Control_Room
    .word BgData_Palette_SciLab_Power_Plant_Control_Room
    .word BgData_Tilemap_SciLab_Power_Plant_Control_Room

BgData_SciLab_Generator_Room:
    .word BgData_Tileset_SciLab_Generator_Room
    .word BgData_Palette_SciLab_Generator_Room
    .word BgData_Tilemap_SciLab_Generator_Room

BGData_WWW:

BgData_WWW_Base:
    .word BgData_Tileset_WWW_Base
    .word BgData_Palette_WWW_Base
    .word BgData_Tilemap_WWW_Base

BgData_WWW_Wily_Lab:
    .word BgData_Tileset_WWW_Wily_Lab
    .word BgData_Palette_WWW_Wily_Lab
    .word BgData_Tilemap_WWW_Wily_Lab

BgData_WWW_Rocket_Hangar:
    .word BgData_Tileset_WWW_Rocket_Hangar
    .word BgData_Palette_WWW_Rocket_Hangar
    .word BgData_Tilemap_WWW_Rocket_Hangar

BgData_WWW_Passage_1:
    .word BgData_Tileset_WWW_Passage_1
    .word BgData_Palette_WWW_Passage_1
    .word BgData_Tilemap_WWW_Passage_1

BgData_WWW_Passage_2:
    .word BgData_Tileset_WWW_Passage_1
    .word BgData_Palette_WWW_Passage_2
    .word BgData_Tilemap_WWW_Passage_2

BgData_WWW_Passage_3:
    .word BgData_Tileset_WWW_Passage_1
    .word BgData_Palette_WWW_Passage_3
    .word BgData_Tilemap_WWW_Passage_3

BGData_School_Comp:

BgData_School_Comp_1:
    .word BgData_Tileset_School_Comp_1
    .word BgData_Palette_School_Comp_1
    .word BgData_Tilemap_School_Comp_1

BgData_School_Comp_2:
    .word BgData_Tileset_School_Comp_2
    .word BgData_Palette_School_Comp_2
    .word BgData_Tilemap_School_Comp_2

BgData_School_Comp_3:
    .word BgData_Tileset_School_Comp_1
    .word BgData_Palette_School_Comp_3
    .word BgData_Tilemap_School_Comp_3

BgData_School_Comp_4:
    .word BgData_Tileset_School_Comp_1
    .word BgData_Palette_School_Comp_4
    .word BgData_Tilemap_School_Comp_4

BgData_School_Comp_5:
    .word BgData_Tileset_School_Comp_1
    .word BgData_Palette_School_Comp_5
    .word BgData_Tilemap_School_Comp_5

BGData_Oven_Comp:

BgData_Oven_Comp_1:
    .word BgData_Tileset_Oven_Comp_1
    .word BgData_Palette_Oven_Comp_1
    .word BgData_Tilemap_Oven_Comp_1

BgData_Oven_Comp_2:
    .word BgData_Tileset_Oven_Comp_1
    .word BgData_Palette_Oven_Comp_1
    .word BgData_Tilemap_Oven_Comp_2

BGData_Waterworks_Comp:

BgData_Waterworks_Comp_1:
    .word BgData_Tileset_Waterworks_Comp_1
    .word BgData_Palette_Waterworks_Comp_1
    .word BgData_Tilemap_Waterworks_Comp_1

BgData_Waterworks_Comp_2:
    .word BgData_Tileset_Waterworks_Comp_1
    .word BgData_Palette_Waterworks_Comp_1
    .word BgData_Tilemap_Waterworks_Comp_2

BgData_Waterworks_Comp_3:
    .word BgData_Tileset_Waterworks_Comp_1
    .word BgData_Palette_Waterworks_Comp_1
    .word BgData_Tilemap_Waterworks_Comp_3

BgData_Waterworks_Comp_4:
    .word BgData_Tileset_Waterworks_Comp_4
    .word BgData_Palette_Waterworks_Comp_4
    .word BgData_Tilemap_Waterworks_Comp_4

BgData_Waterworks_Comp_5:
    .word BgData_Tileset_Waterworks_Comp_5
    .word BgData_Palette_Waterworks_Comp_5
    .word BgData_Tilemap_Waterworks_Comp_5

BgData_Waterworks_Comp_6:
    .word BgData_Tileset_Waterworks_Comp_4
    .word BgData_Palette_Waterworks_Comp_6
    .word BgData_Tilemap_Waterworks_Comp_6

BGData_Traffic_Light_Comp:

BgData_Traffic_Light_Comp_1:
    .word BgData_Tileset_Traffic_Light_Comp_1
    .word BgData_Palette_Traffic_Light_Comp_1
    .word BgData_Tilemap_Traffic_Light_Comp_1

BgData_Traffic_Light_Comp_2:
    .word BgData_Tileset_Traffic_Light_Comp_1
    .word BgData_Palette_Traffic_Light_Comp_1
    .word BgData_Tilemap_Traffic_Light_Comp_2

BgData_Traffic_Light_Comp_3:
    .word BgData_Tileset_Traffic_Light_Comp_1
    .word BgData_Palette_Traffic_Light_Comp_1
    .word BgData_Tilemap_Traffic_Light_Comp_3

BgData_Traffic_Light_Comp_4:
    .word BgData_Tileset_Traffic_Light_Comp_1
    .word BgData_Palette_Traffic_Light_Comp_1
    .word BgData_Tilemap_Traffic_Light_Comp_4

BgData_Traffic_Light_Comp_5:
    .word BgData_Tileset_Traffic_Light_Comp_1
    .word BgData_Palette_Traffic_Light_Comp_1
    .word BgData_Tilemap_Traffic_Light_Comp_5

BGData_Power_Plant_Comp:

BgData_Power_Plant_Comp_1:
    .word BgData_Tileset_Power_Plant_Comp_1
    .word BgData_Palette_Power_Plant_Comp_1
    .word BgData_Tilemap_Power_Plant_Comp_1

BgData_Power_Plant_Comp_2:
    .word BgData_Tileset_Power_Plant_Comp_1
    .word BgData_Palette_Power_Plant_Comp_1
    .word BgData_Tilemap_Power_Plant_Comp_2

BgData_Power_Plant_Comp_3:
    .word BgData_Tileset_Power_Plant_Comp_1
    .word BgData_Palette_Power_Plant_Comp_1
    .word BgData_Tilemap_Power_Plant_Comp_3

BgData_Power_Plant_Comp_4:
    .word BgData_Tileset_Power_Plant_Comp_1
    .word BgData_Palette_Power_Plant_Comp_1
    .word BgData_Tilemap_Power_Plant_Comp_4

BGData_WWW_Comp:

BgData_WWW_Comp_1:
    .word BgData_Tileset_Oven_Comp_1
    .word BgData_Palette_Oven_Comp_1
    .word BgData_Tilemap_WWW_Comp_1

BgData_WWW_Comp_2:
    .word BgData_Tileset_School_Comp_2
    .word BgData_Palette_WWW_Comp_2
    .word BgData_Tilemap_WWW_Comp_2

BgData_WWW_Comp_3:
    .word BgData_Tileset_Waterworks_Comp_1
    .word BgData_Palette_Waterworks_Comp_1
    .word BgData_Tilemap_WWW_Comp_3

BgData_WWW_Comp_4:
    .word BgData_Tileset_Traffic_Light_Comp_1
    .word BgData_Palette_Traffic_Light_Comp_1
    .word BgData_Tilemap_WWW_Comp_4

BgData_WWW_Comp_5:
    .word BgData_Tileset_Power_Plant_Comp_1
    .word BgData_Palette_Power_Plant_Comp_1
    .word BgData_Tilemap_WWW_Comp_5

BgData_Rocket_Comp:
    .word BgData_Tileset_Rocket_Comp
    .word BgData_Palette_Rocket_Comp
    .word BgData_Tilemap_Rocket_Comp

BGData_ACDC_HP:

BgData_ACDC_Lan_PC:
    .word BgData_Tileset_ACDC_Lan_PC
    .word BgData_Palette_ACDC_Lan_PC
    .word BgData_Tilemap_ACDC_Lan_PC

BgData_ACDC_Mayl_PC:
    .word BgData_Tileset_ACDC_Lan_PC
    .word BgData_Palette_ACDC_Mayl_PC
    .word BgData_Tilemap_ACDC_Mayl_PC

BgData_ACDC_Yai_PC:
    .word BgData_Tileset_ACDC_Lan_PC
    .word BgData_Palette_ACDC_Dex_PC
    .word BgData_Tilemap_ACDC_Dex_PC

BgData_ACDC_Dex_PC:
    .word BgData_Tileset_ACDC_Lan_PC
    .word BgData_Palette_ACDC_Yai_PC
    .word BgData_Tilemap_ACDC_Yai_PC

BGData_Govt_HP:

BgData_Govt_Yuichiro_PC:
    .word BgData_Tileset_Govt_Yuichiro_PC
    .word BgData_Palette_Govt_Yuichiro_PC
    .word BgData_Tilemap_Govt_Yuichiro_PC

BgData_Govt_Lunch_Cart_Comp:
    .word BgData_Tileset_Govt_Yuichiro_PC
    .word BgData_Palette_Govt_Lunch_Cart_Comp
    .word BgData_Tilemap_Govt_Lunch_Cart_Comp

BGData_DenTown_HP:

BgData_DenTown_Antique_Comp:
    .word BgData_Tileset_Govt_Yuichiro_PC
    .word BgData_Palette_DenTown_Antique_Comp
    .word BgData_Tilemap_DenTown_Antique_Comp

BGData_SciLab_HP:

BgData_SciLab_Fish_Stand_Comp:
    .word BgData_Tileset_Govt_Yuichiro_PC
    .word BgData_Palette_SciLab_Fish_Stand_Comp
    .word BgData_Tilemap_SciLab_Fish_Stand_Comp

BGData_Other_Comp:

BgData_Other_Doghouse_Comp:
    .word BgData_Tileset_Govt_Yuichiro_PC
    .word BgData_Palette_Other_Generic_Comp
    .word BgData_Tilemap_Other_Generic_Comp

BgData_Other_Servbot_Comp:
    .word BgData_Tileset_Govt_Yuichiro_PC
    .word BgData_Palette_Other_Generic_Comp
    .word BgData_Tilemap_Other_Generic_Comp

BgData_Other_New_Game_Machine_Comp:
    .word BgData_Tileset_Govt_Yuichiro_PC
    .word BgData_Palette_Other_Generic_Comp
    .word BgData_Tilemap_Other_Generic_Comp

BgData_Other_Telephone_Comp:
    .word BgData_Tileset_Govt_Yuichiro_PC
    .word BgData_Palette_Other_Generic_Comp
    .word BgData_Tilemap_Other_Generic_Comp

BgData_Other_Car_Comp:
    .word BgData_Tileset_Govt_Yuichiro_PC
    .word BgData_Palette_Other_Generic_Comp
    .word BgData_Tilemap_Other_Generic_Comp

BgData_Other_Waterworks_Vending_Machine_Comp:
    .word BgData_Tileset_Govt_Yuichiro_PC
    .word BgData_Palette_Other_Generic_Comp
    .word BgData_Tilemap_Other_Generic_Comp

BgData_Other_Lobby_TV_Comp:
    .word BgData_Tileset_Govt_Yuichiro_PC
    .word BgData_Palette_Other_Generic_Comp
    .word BgData_Tilemap_Other_Generic_Comp

BgData_Other_Large_Monitor_Comp:
    .word BgData_Tileset_Govt_Yuichiro_PC
    .word BgData_Palette_Other_Generic_Comp
    .word BgData_Tilemap_Other_Generic_Comp

BgData_Other_Control_Equipment_Comp:
    .word BgData_Tileset_Govt_Yuichiro_PC
    .word BgData_Palette_Other_Generic_Comp
    .word BgData_Tilemap_Other_Generic_Comp

BgData_Other_SciLab_Vending_Machine_Comp:
    .word BgData_Tileset_Govt_Yuichiro_PC
    .word BgData_Palette_Other_Generic_Comp
    .word BgData_Tilemap_Other_Generic_Comp

BgData_Other_Recycled_PET_Comp:
    .word BgData_Tileset_Govt_Yuichiro_PC
    .word BgData_Palette_Other_Generic_Comp
    .word BgData_Tilemap_Other_Generic_Comp

BgData_Other_Big_Vase_Comp:
    .word BgData_Tileset_Govt_Yuichiro_PC
    .word BgData_Palette_Other_Generic_Comp
    .word BgData_Tilemap_Other_Generic_Comp

BgData_Other_Blackboard_Comp:
    .word BgData_Tileset_Govt_Yuichiro_PC
    .word BgData_Palette_Other_Generic_Comp
    .word BgData_Tilemap_Other_Generic_Comp

BGData_Internet:

BgData_Internet_1:
    .word BgData_Tileset_Internet_1
    .word BgData_Palette_Internet_1
    .word BgData_Tilemap_Internet_1

BgData_Internet_2:
    .word BgData_Tileset_Internet_1
    .word BgData_Palette_Internet_1
    .word BgData_Tilemap_Internet_2

BgData_Internet_3:
    .word BgData_Tileset_Internet_1
    .word BgData_Palette_Internet_1
    .word BgData_Tilemap_Internet_3

BgData_Internet_4:
    .word BgData_Tileset_Internet_1
    .word BgData_Palette_Internet_1
    .word BgData_Tilemap_Internet_4

BgData_Undernet_1:
    .word BgData_Tileset_Internet_1
    .word BgData_Palette_Internet_1
    .word BgData_Tilemap_Undernet_1

BgData_Undernet_2:
    .word BgData_Tileset_Internet_1
    .word BgData_Palette_Internet_1
    .word BgData_Tilemap_Undernet_2

BgData_Undernet_3:
    .word BgData_Tileset_Internet_1
    .word BgData_Palette_Internet_1
    .word BgData_Tilemap_Undernet_3

BgData_Undernet_4:
    .word BgData_Tileset_Internet_1
    .word BgData_Palette_Internet_1
    .word BgData_Tilemap_Undernet_4

BgData_Undernet_5:
    .word BgData_Tileset_Internet_1
    .word BgData_Palette_Internet_1
    .word BgData_Tilemap_Undernet_5

BgData_Undernet_6:
    .word BgData_Tileset_Internet_1
    .word BgData_Palette_Internet_1
    .word BgData_Tilemap_Undernet_6

BgData_Undernet_7:
    .word BgData_Tileset_Internet_1
    .word BgData_Palette_Internet_1
    .word BgData_Tilemap_Undernet_7

BgData_Undernet_8:
    .word BgData_Tileset_Internet_1
    .word BgData_Palette_Internet_1
    .word BgData_Tilemap_Undernet_8

BgData_Undernet_9:
    .word BgData_Tileset_Internet_1
    .word BgData_Palette_Internet_1
    .word BgData_Tilemap_Undernet_9

BgData_Undernet_10:
    .word BgData_Tileset_Internet_1
    .word BgData_Palette_Internet_1
    .word BgData_Tilemap_Undernet_10

BgData_Undernet_11:
    .word BgData_Tileset_Internet_1
    .word BgData_Palette_Internet_1
    .word BgData_Tilemap_Undernet_11

BgData_Undernet_12:
    .word BgData_Tileset_Internet_1
    .word BgData_Palette_Internet_1
    .word BgData_Tilemap_Undernet_12

BGData_Battle_Other:

BgData_Battle_NumberMan:
    .word BgData_Tileset_Battle_NumberMan
    .word BgData_Palette_Battle_NumberMan
    .word BgData_Tilemap_Battle_NumberMan

BgData_Battle_FireMan:
    .word BgData_Tileset_Battle_FireMan
    .word BgData_Palette_Battle_FireMan
    .word BgData_Tilemap_Battle_FireMan

BgData_Battle_IceMan:
    .word BgData_Tileset_Battle_IceMan
    .word BgData_Palette_Battle_IceMan
    .word BgData_Tilemap_Battle_IceMan

BgData_Battle_ColorMan:
    .word BgData_Tileset_Battle_ColorMan
    .word BgData_Palette_Battle_ColorMan
    .word BgData_Tilemap_Battle_ColorMan

BgData_Battle_ElecMan:
    .word BgData_Tileset_Battle_ElecMan
    .word BgData_Palette_Battle_ElecMan
    .word BgData_Tilemap_Battle_ElecMan

BgData_Battle_WWW:
    .word BgData_Tileset_Battle_WWW
    .word BgData_Palette_Battle_WWW
    .word BgData_Tilemap_Battle_WWW

BgData_Battle_Internet:
    .word BgData_Tileset_Battle_Internet
    .word BgData_Palette_Battle_Internet
    .word BgData_Tilemap_Battle_Internet

BgData_Battle_Generic:
    .word BgData_Tileset_Battle_Generic
    .word BgData_Palette_Battle_Generic
    .word BgData_Tilemap_Battle_Generic

BgData_Battle_LanHP:
    .word BgData_Tileset_Battle_LanHP
    .word BgData_Palette_Battle_LanHP
    .word BgData_Tilemap_Battle_LanHP

BgData_Battle_MaylHP:
    .word BgData_Tileset_Battle_MaylHP
    .word BgData_Palette_Battle_MaylHP
    .word BgData_Tilemap_Battle_MaylHP

BgData_Battle_YaiHP:
    .word BgData_Tileset_Battle_YaiHP
    .word BgData_Palette_Battle_YaiHP
    .word BgData_Tilemap_Battle_YaiHP

BgData_Battle_DexHP:
    .word BgData_Tileset_Battle_DexHP
    .word BgData_Palette_Battle_DexHP
    .word BgData_Tilemap_Battle_DexHP

BgData_Battle_YuichiroHP:
    .word BgData_Tileset_Battle_YuichiroHP
    .word BgData_Palette_Battle_YuichiroHP
    .word BgData_Tilemap_Battle_YuichiroHP

BgData_Battle_SalHP:
    .word BgData_Tileset_Battle_SalHP
    .word BgData_Palette_Battle_SalHP
    .word BgData_Tilemap_Battle_SalHP

BgData_Battle_MiyuHP:
    .word BgData_Tileset_Battle_MiyuHP
    .word BgData_Palette_Battle_MiyuHP
    .word BgData_Tilemap_Battle_MiyuHP

BgData_Battle_MasaHP:
    .word BgData_Tileset_Battle_MasaHP
    .word BgData_Palette_Battle_MasaHP
    .word BgData_Tilemap_Battle_MasaHP

BgData_Battle_LifeVirus:
    .word BgData_Tileset_Battle_LifeVirus
    .word BgData_Palette_Battle_LifeVirus
    .word BgData_Tilemap_Battle_LifeVirus
