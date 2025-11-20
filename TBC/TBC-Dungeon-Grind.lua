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
		.goto Blasted Lands,58.09,56.00
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dar'toon|r
		.accept 9407 >> Accept Through the Dark Portal
		.target Warlord Dar'toon

	step
		#completewith next
		.goto Blasted Lands,58.74,60.28
		.zone Hellfire Peninsula >> Go through the Dark Portal

    step
		.goto Hellfire Peninsula,87.35,49.80
        >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lieutenant General Orion|r
        .turnin 9407
        .accept 10120
        .target Lieutenant General Orion

    step
        .goto Hellfire Peninsula,87.34,48.13
        >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Vlagga Freyfeather|r
        .turnin 10120
        .accept 10289
        .target Vlagga Freyfeather   

    step
        .goto Hellfire Peninsula,87.34,48.13
        >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Vlagga Freyfeather|r
		.fly Thrallmar >> Fly to Thrallmar
        .skipgossip
        .target Vlagga Freyfeather       
        
    step
        .goto Hellfire Peninsula,55.89,36.60,15,0
		.goto Hellfire Peninsula,55.86,37.12
        >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_General Krakork|r
        .turnin 10289
        .target General Krakork       
        
    step
        .goto Hellfire Peninsula,56.71,37.47
        >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Floyd Pinkus|r
        .home
        .target Floyd Pinkus  

	step
		>>Clear |cFFfa9602The Blood Furnace|r until you reach 5999 reputation into friendly with |cRXP_FRIENDLY_Thrallmar|r
        >>This will take around 12 runs with an average of 750 rep per run
        .reputation,947,Friendly,5999

	step
		#completewith next
		.subzone 3718 >>Travel to Swamprat Post in Zangarmarsh

    step
        .goto Zangarmarsh,84.76,55.11
        >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gur'zil|r
        .fp Swamprat Post
        .target Gur'zil
    
	step
		#completewith next
		.zone Shattrath City >>Travel to Shattrath City
		.zoneskip Shattrath City
		
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
        .goto Shattrath City,54.74,44.32
        >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Khadgar|r
        .accept 10211
        .target Khadgar   
        
    step
		.goto Shattrath City,50.36,42.87
		>>Follow |cRXP_FRIENDLY_Khadgar's Servant|r << wotlk
		>>Head up to the second floor with |cRXP_FRIENDLY_G'eras|r and wait out the RP. If someone elses |cRXP_FRIENDLY_Khadgar's Servant|r arrives in the meantime, you can target it and it will complete the quest for you. If the quest fails, abandon it, accept the quest from |cRXP_FRIENDLY_Khadgar's Servant|r again, then follow the |cRXP_FRIENDLY_Khadgar's Servant|r around << tbc
		.complete 10211,1 
		.target Khadgar's Servant

	step
		.goto Shattrath City,54.74,44.32
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Khadgar|r
		.turnin 10211
		.target Khadgar

	step
		.goto Shattrath City,54.74,44.32
		.turninmultiple 10551,10552>>Talk to |cRXP_FRIENDLY_Khadgar's Servant|r. Pledge your Allegiance to either the Aldor or Scryers
		*If you do not see Aldor or Scryer specific quest steps after this, type "/reload" into your ingame chat box
		.target Khadgar
		.isQuestAvailable 10551
		.isQuestAvailable 10552	

	step
		.goto Shattrath City,54.74,44.32
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Khadgar|r
		.turnin -10551
		.turnin -10552
		.target Khadgar

	step
		#scryer
		.goto Shattrath City,56.2,81.6
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Innkeeper Haelthol|r
		.home
		.target Innkeeper Haelthol

	step
		#aldor
		.goto Shattrath City,28.0,49.2
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Minalei|r
		.home
		.target Minalei		

	step
		.goto Shattrath City,64.05,41.12
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nutral|r
		.fp Shattrath
		.target Nutral

    step
        #completewith next
        .goto Shattrath City,45.12,63.89,5,0
        >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nutral|r
        .fly Swamprat Post >>Fly to |cFFfa9602Swamprat Post|r
        .target Nutral
        .zoneskip Zangarmarsh

    step
		>>Clear |cFFfa9602The Slave Pens|r until you reach level 65 and 5999 reputation into friendly with |cRXP_FRIENDLY_Cenarion Expedition|r
        .reputation,942,Friendly,5999   
        .xp 65

	step
		.hs >>Hearth to Shattrath
		.zoneskip Shattrath City

	step
		#completewith next
		.subzone 3683 >>Travel to Stonebreaker Hold	

	step
		.goto Terokkar Forest,49.2,43.6
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kerna|r
		.fp Stonebreaker Hold
		.target Kerna

    step
		>>Clear |cFFfa9602The Mana Tombs|r until you reach level 66 
        .xp 66

	step
		>>Clear |cFFfa9602The Sethekk Halls|r until you reach 5999 reputation into friendly with |cRXP_FRIENDLY_Lower City|r
        >>This will take around 8 runs with an average of 1139 rep per run
        .reputation,1011,Friendly,5999
		.collect 27991

	step
		#completewith next
		>>The easiest way to get to Karazhan is via a Portal to Stonard
		.subzone 2562 >> Travel to Karazhan

	step
		.goto Shattrath City,47.0,75.6
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Archmage Alturus|r
		.accept 9824
		.target Archmage Alturus			

	step
		>>Clear |cFFfa9602Black Morass|r until you reach revered reputation with |cRXP_FRIENDLY_Keepers of Time|r
        >>This will take around 7-8 runs with an average of 1100 rep per run
        .reputation,989,Revered

	step
		>>Clear |cFFfa9602The Shadow Labyrinth|r until you reach revered reputation with |cRXP_FRIENDLY_Lower City|r
        >>This will take around 6 runs with an average of 2012 rep per run
        .reputation,1011,Revered      

    step
		>>Clear |cFFfa9602The Steamvault|r until you reach revered reputation with |cRXP_FRIENDLY_Cenarion Expedition|r
        >>This will take around 7 runs with an average of 1796 rep per run
        .reputation,942,Revered

	step
		>>Clear |cFFfa9602The Shattered Halls|r until you reach revered reputation with |cRXP_FRIENDLY_Thrallmar|r
        >>This will take around 8 runs with an average of 1604 rep per run
        .reputation,947,Revered  

]])