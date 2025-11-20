RXPGuides.RegisterGuide([[
#classic
#version 3
#group Consita Classic/TBC Launch Guide
#subgroup 5 - TBC Dungeon Grind
#name Dungeon Grind to 70

--- |cRXP_FRIENDLY_, |cRXP_ENEMY_, |cRXP_LOOT_, |cRXP_WARN_, |cRXP_PICK_, |cRXP_BUY_
--- |c99ffff99 OR|r
--- |Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk

--- https://docs.google.com/spreadsheets/d/12fL1aMmTYYnPKwRrFUyrummi5LBZ_OrxceVVLOxqbcU/htmlview

--- Go through Portal

    step
        .goto Blasted Lands,58.0,55.8
        >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Warlord Dar'toon|r
        .accept 9407
        .target Warlord Dar'toon

    step
        #completewith next
        .zone Hellfire Peninsula >> Go through the Dark Portal to |cFFfa9602Hellfire Peninsula|r
        .zoneskip Hellfire Peninsula

    step
        .goto Hellfire Peninsula,87.4,49.8
        >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lieutenant General Orion|r
        .turnin 9407
        .accept 10120
        .target Lieutenant General Orion

    step
        .goto Hellfire Peninsula,87.4,48.2
        >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Vlagga Freyfeather|r
        .turnin 10120
        .accept 10289
        .target Vlagga Freyfeather   

    step
        .goto Hellfire Peninsula,87.4,48.2
        >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Vlagga Freyfeather|r
        .skipgossip
        .target Vlagga Freyfeather       
        
    step
        .goto Hellfire Peninsula,55.8,36.8
        >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_General Krakork|r
        .turnin 10289
        .target General Krakork       
        
    step
        .goto Hellfire Peninsula,56.6,37.6
        >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Floyd Pinkus|r
        .home
        .target Floyd Pinkus  

	step
		>>Do |cFFfa9602The Blood Furnace|r until you reach 5999 reputation into friendly with |cRXP_FRIENDLY_Thrallmar|r
        >>This will take around 12 runs with an average of 750 rep per run
        .reputation,947,Friendly,5999

    step
        .goto Zangarmarsh,84.8,55.0
        >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gur'zil|r
        .fp
        .target Gur'zil
        
    step
        .goto Shattrath City,59.8,41.6
        >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Haggard War Veteran|r
        .accept 10210
        .target Haggard War Veteran

    step
        .goto Shattrath City,54.6,44.6
        >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_A'dal|r
        .turnin 10210
        .target A'dal

    step
        .goto Shattrath City,54.8,44.6
        >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Khadgar|r
        .accept 10211
        .target Khadgar   
        
YOU DO NOT HAVE TO FOLLOW HIM ON THE ESCORT. Get the quest, watch him walk away, follow him out the door, turn right and run around to the NW ramp, go up the ramp, and come out up top where G'eras the badge vendor is. Go afk for 10 minutes. When you come back, jump down and turn in the quest. You're welcome. YOU MUST BE UP TOP. -- NOTE: You have to go outside the central area and around, then back in the Northwest entrance and then stop near G'eras. It still works in 2023, I literally just now did it on a new character. If at any time, the guide stops talking to you may need to reset.        

    step
        >>Move close to |cRXP_FRIENDLY_G'eras|r and wait there until the quest completes
        >>|cRXP_WARN_Do not jump down before the quest is completed|r
        .goto Shattrath City,50.8,42.6
        .complete 10211,1
        .target Khadgar's Servant
        .target G'eras

    step
        .goto Shattrath City,54.8,44.6
        >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Khadgar|r
        .turnin 10211
        .target Khadgar          

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