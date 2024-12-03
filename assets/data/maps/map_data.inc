global_label MapData_Offline
    .word MapData_School
    .word MapData_ACDC
    .word MapData_Govt
    .word MapData_DenTown
    .word MapData_SciLab
    .word MapData_WWW

global_label MapData_Online
    .word MapData_School_Comp
    .word MapData_Oven_Comp
    .word MapData_Waterworks_Comp
    .word MapData_Traffic_Light_Comp
    .word MapData_Power_Plant_Comp
    .word MapData_WWW_Comp
    .word 0
    .word 0
    .word MapData_ACDC_HP
    .word MapData_Govt_HP
    .word MapData_DenTown_HP
    .word MapData_SciLab_HP
    .word MapData_Other_Comp
    .word 0
    .word 0
    .word 0
    .word MapData_Internet

global_label MapData_Battle
    .word 0

MapData_School:
    .word MapData_School_Class_5A
    .word MapData_School_Class_5B
    .word MapData_School_Library
    .word MapData_School_2F_Hallway
    .word 0
    .word MapData_School_Class_1A
    .word MapData_School_Class_1B
    .word MapData_School_AV_Room
    .word MapData_School_Infirmary
    .word MapData_School_1F_Hallway
    .word 0
    .word MapData_School_Cross_Hallway
    .word MapData_School_Storage
    .word MapData_School_Staff_Lounge
    .word MapData_School_Staff_Lounge_Hallway

MapData_ACDC:
    .word MapData_ACDC_Town
    .word MapData_ACDC_School_Gate
    .word MapData_ACDC_Lan_Living_Room
    .word MapData_ACDC_Lan_Room
    .word 0
    .word MapData_ACDC_Mayl_Living_Room
    .word MapData_ACDC_Mayl_Room
    .word MapData_ACDC_Dex_Room
    .word 0
    .word MapData_ACDC_Yai_Room
    .word 0
    .word MapData_ACDC_Higsbys
    .word MapData_ACDC_Station
    .word MapData_ACDC_Secret_Station

MapData_Govt:
    .word MapData_Govt_Complex_Front
    .word MapData_Govt_Complex_Station
    .word MapData_Govt_Waterworks_Lobby
    .word MapData_Govt_SciLab_Lobby
    .word MapData_Govt_Complex_Hallway
    .word MapData_Govt_Yuichiro_Lab
    .word MapData_Govt_Waterworks_Office
    .word MapData_Govt_Waterworks_Control_Room
    .word 0
    .word MapData_Govt_Waterworks_Pump_Room
    .word 0
    .word MapData_Govt_Waterworks_Purification_Room

MapData_DenTown:
    .word MapData_DenTown_Center
    .word MapData_DenTown_Station
    .word MapData_DenTown_Block_1
    .word MapData_DenTown_Block_2
    .word MapData_DenTown_Block_3
    .word MapData_DenTown_Block_4
    .word MapData_DenTown_Miyu_Antiques
    .word MapData_DenTown_Summer_School

MapData_SciLab:
    .word MapData_SciLab_Restaurant_Hallway
    .word MapData_SciLab_Restaurant
    .word MapData_SciLab_Power_Plant_Hallway
    .word MapData_SciLab_Power_Plant
    .word MapData_SciLab_Power_Plant_Control_Room
    .word MapData_SciLab_Generator_Room

MapData_WWW:
    .word MapData_WWW_Base
    .word MapData_WWW_Wily_Lab
    .word MapData_WWW_Rocket_Hangar
    .word MapData_WWW_Passage_1
    .word MapData_WWW_Passage_2
    .word MapData_WWW_Passage_3

MapData_School_Comp:
    .word MapData_School_Comp_1
    .word MapData_School_Comp_2
    .word MapData_School_Comp_3
    .word MapData_School_Comp_4
    .word MapData_School_Comp_5

MapData_Oven_Comp:
    .word MapData_Oven_Comp_1
    .word MapData_Oven_Comp_2

MapData_Waterworks_Comp:
    .word MapData_Waterworks_Comp_1
    .word MapData_Waterworks_Comp_2
    .word MapData_Waterworks_Comp_3
    .word MapData_Waterworks_Comp_4
    .word MapData_Waterworks_Comp_5
    .word MapData_Waterworks_Comp_6

MapData_Traffic_Light_Comp:
    .word MapData_Traffic_Light_Comp_1
    .word MapData_Traffic_Light_Comp_2
    .word MapData_Traffic_Light_Comp_3
    .word MapData_Traffic_Light_Comp_4
    .word MapData_Traffic_Light_Comp_5

MapData_Power_Plant_Comp:
    .word MapData_Power_Plant_Comp_1
    .word MapData_Power_Plant_Comp_2
    .word MapData_Power_Plant_Comp_3
    .word MapData_Power_Plant_Comp_4

MapData_WWW_Comp:
    .word MapData_WWW_Comp_1
    .word MapData_WWW_Comp_2
    .word MapData_WWW_Comp_3
    .word MapData_WWW_Comp_4
    .word MapData_WWW_Comp_5
    .word MapData_Rocket_Comp

MapData_ACDC_HP:
    .word MapData_ACDC_Lan_PC
    .word MapData_ACDC_Mayl_PC
    .word MapData_ACDC_Yai_PC
    .word MapData_ACDC_Dex_PC

MapData_Govt_HP:
    .word MapData_Govt_Yuichiro_PC
    .word MapData_Govt_Lunch_Cart_Comp

MapData_DenTown_HP:
    .word MapData_DenTown_Antique_Comp

MapData_SciLab_HP:
    .word MapData_SciLab_Fish_Stand_Comp

MapData_Other_Comp:
    .word MapData_Other_Generic_Comp
    .word MapData_Other_Generic_Comp
    .word MapData_Other_Generic_Comp
    .word MapData_Other_Generic_Comp
    .word MapData_Other_Generic_Comp
    .word MapData_Other_Generic_Comp
    .word MapData_Other_Generic_Comp
    .word MapData_Other_Generic_Comp
    .word MapData_Other_Generic_Comp
    .word MapData_Other_Generic_Comp
    .word MapData_Other_Generic_Comp
    .word MapData_Other_Generic_Comp
    .word MapData_Other_Generic_Comp

MapData_Internet:
    .word MapData_Internet_1
    .word MapData_Internet_2
    .word MapData_Internet_3
    .word MapData_Internet_4
    .word MapData_Undernet_1
    .word MapData_Undernet_2
    .word MapData_Undernet_3
    .word MapData_Undernet_4
    .word MapData_Undernet_5
    .word MapData_Undernet_6
    .word MapData_Undernet_7
    .word MapData_Undernet_8
    .word MapData_Undernet_9
    .word MapData_Undernet_10
    .word MapData_Undernet_11
    .word MapData_Undernet_12
