RXPGuides.RegisterGuide([[
#classic
#version 3
#group Consita Classic/TBC Launch Guide
#subgroup 5 - TBC Dungeon Grind
#name Dungeon Grind to 70

--- |cRXP_FRIENDLY_, |cRXP_ENEMY_, |cRXP_LOOT_, |cRXP_WARN_, |cRXP_PICK_, |cRXP_BUY_
--- |c99ffff99 OR|r
--- |Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk

	step
		>>Do |cFFfa9602The Blood Furnace|r until you reach 5999 reputation into friendly with |cRXP_FRIENDLY_Thrallmar|r
        >>This will take around 12 runs with an average of 750 rep per run
        .reputation,947,Friendly,5999

    step
		>>Do |cFFfa9602The Slave Pens|r until you reach level 65 and 5999 reputation into friendly with |cRXP_FRIENDLY_Cenarion Expedition|r
        .reputation,942,Friendly,5999   
        .xp 65

    step
		>>Do |cFFfa9602The Mana Tombs|r until you reach level 66 
        .xp 66

	step
		>>Do |cFFfa9602The Blood Furnace|r until you reach 5999 reputation into friendly with |cRXP_FRIENDLY_Lower City|r
        >>This will take around 8 runs with an average of 1139 rep per run
        .reputation,1011,Friendly,5999

	step
		>>Do |cFFfa9602Black Morass|r until you reach revered reputation with |cRXP_FRIENDLY_Keepers of Time|r
        >>This will take around 7-8 runs with an average of 1100 rep per run
        .reputation,989,Revered

	step
		>>Do |cFFfa9602The Shadow Labyrinth|r until you reach revered reputation with |cRXP_FRIENDLY_Lower City|r
        >>This will take around 6 runs with an average of 2012 rep per run
        .reputation,1011,Revered      

    step
		>>Do |cFFfa9602The Steamvault|r until you reach revered reputation with |cRXP_FRIENDLY_Cenarion Expedition|r
        >>This will take around 7 runs with an average of 1796 rep per run
        .reputation,942,Revered

	step
		>>Do |cFFfa9602The Shattered Halls|r until you reach revered reputation with |cRXP_FRIENDLY_Thrallmar|r
        >>This will take around 8 runs with an average of 1604 rep per run
        .reputation,947,Revered  

]])