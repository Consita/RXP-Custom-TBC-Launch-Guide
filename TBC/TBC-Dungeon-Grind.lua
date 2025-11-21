RXPGuides.RegisterGuide([[
#tbc
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
		.goto Hellfire Peninsula,46.0,58.7,20,0
		.goto Hellfire Peninsula,46.1,51.7,20 >> Travel to Blood Furnace. At the waypoint look for wooden stairs that lead up to the wall. Riding along this wall will take you to the instance.

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
		#completewith next
		.goto Zangarmarsh,50.4,40.8,15,0
		.goto Zangarmarsh,51.9,37.8,20 >>Swim to the center of Coilfang Reservoir until you are over the open drain pipe below. Dive and swim through it until you find the underwater cavern.

	step
		.goto Zangarmarsh,48.9,35.7,20 >> Enter The Slave Pens

    step
		>>Clear |cFFfa9602The Slave Pens|r until you reach level 65 and 5999 reputation into friendly with |cRXP_FRIENDLY_Cenarion Expedition|r
        .reputation,942,Friendly,5999   
        .xp 65

	step
		.hs >>Hearth to Shattrath
		.zoneskip Shattrath City

	step
		>>Travel to the Sethekk Area of Lower City
		.goto Shattrath City, 58.0,15.5
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Oloraak|r
		.accept 10180 >> Accept Can't Stay Away	
		.target Oloraak

	step
		#completewith next
		.subzone 3683 >>Travel to Stonebreaker Hold	

	step
		.goto Terokkar Forest,49.2,43.6
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kerna|r
		.fp Stonebreaker Hold
		.target Kerna

	step
		>>Run to the entrance of Mana Tombs in Auchindoun.
		.goto Terokkar Forest,39.4,58.6,20
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Artificer Morphalius|r
		.accept 10216
		.target Artificer Morphalius

	step
		.goto Terokkar Forest,39.4,58.6
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nexus-Prince Haramad|r
		.accept 10165
		.target Nexus-Prince Haramad

	step
		.complete 10216,1
		.complete 10216,2
		.complete 10216,3
		.complete 10216,4
		.complete 10165,1
		.mob Ethereal Crypt Raider
		.mob Nexus Stalker
		.mob Ethereal Sorcerer
		.mob Ethereal Spellbinder
		.mob Nexus-Prince Shaffar

	step
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ethereal Transporter Control Panel|r
		.turnin 10216 >>Turn In Safety Is Job One		

	step
		.accept 10218 >>Complete Escort Quest Starting at Cryo-Engineer Sha'heen
		.complete 10218,1
		.target Cryo-Engineer Sha'heen

	step
		#sticky
		.goto Terokkar Forest,39.4,58.6
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nexus-Prince Haramad|r
		.turnin 10165
		.turnin 10218
		.target Nexus-Prince Haramad

    step
		>>Clear |cFFfa9602The Mana Tombs|r until you reach level 66 
        .xp 66

	step
		.goto Terokkar Forest,43.1,65.6,20 >>Run to the entrance of Sethekk Halls in Auchindoun.

	step
		.goto Terokkar Forest,44.1,65.0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Isfar|r
		.turnin 10180 >>Turn In Can't Stay Away
		.accept 10097 >>Accept Brother Against Brother
		.accept 10098 >>Accept Terokk's Legacy
		.target Isfar

	step
		>>Make sure you loot the Key to Shadow Labyrinth at the end of the dungeon in the chest behind the boss.
		.complete 10097,1 
		.complete 10098,1 
		.collect 27991,1 

	step
		.goto Terokkar Forest,44.1,65.0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Isfar|r
		.turnin 10097 >>Turn In Brother Against Brother
		.turnin 10098 >>Turn In Terokk's Legacy	
		.target Isfar

	step
		>>Clear |cFFfa9602The Sethekk Halls|r until you reach 5999 reputation into friendly with |cRXP_FRIENDLY_Lower City|r
        >>This will take around 8 runs with an average of 1139 rep per run
        .reputation,1011,Friendly,5999
		.collect 27991

	step
		.hs >> Hearth to Shattrath City
		.zoneskip Shattrath City

	step
		+Take the Portal to Orgrimmar
		.goto Shattrath City,52.2,52.8
		.zone Orgrimmar >> Go to Orgrimmar
		.zoneskip Orgrimmar
		
	step << Paladin
		.goto Orgrimmar,32.4,35.8
		.trainer >> Go and train your class spells

	step << Shaman
		.goto Orgrimmar,38.6,36.0
		.trainer >> Go and train your class spells

	step << Hunter
		.goto Orgrimmar,66.1,18.5
		.trainer >> Go and train your class spells

	step << Warrior
		.goto Orgrimmar,79.7,31.4
		.trainer >> Go and train your class spells

	step << Rogue
		.goto Orgrimmar,44.0,54.6
		.trainer >> Go and train your class spells

	step << Warlock
		.goto Orgrimmar,48.0,46.0
		.trainer >> Go and train your class spells

	step << Mage
		.goto Orgrimmar,38.8,85.6
		.trainer >> Go and train your class spells

	step << Priest
		.goto Orgrimmar,35.6,87.8
		.trainer >> Go and train your class spells

	step
		.goto Durotar,50.6,12.6,20
		>>Take the Zeppelin to Grom'Gol Base Camp in Stranglethorn Vale

	step
		.goto Stranglethorn Vale,32.5,29.3
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thysta|r
		.fly Stonard >>Fly to Stonard
		.target Thysta

	step
		.goto Deadwind Pass,47.0,75.7,20
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Archmage Alturus|r
		.accept 9824
		.accept 9825
		.target Archmage Alturus			

	step
		.goto Deadwind Pass,48.7,78.9,20,0
		.goto Deadwind Pass,51.7,79.3,30 >> Go down the entrance of the cellar

	step
		#sticky
		#completewith PondR
		>>Kill Ghosts. Loot them for Ghostly Essences
		.complete 9825,1
		.mob Unliving Caretaker
		.mob Damned Soul
		.mob Wailing Spectre
		.mob Restless Shade

	step
		.use 24474 >>Use |T134075:0|t[Violet Scrying Crystal] at the Well
		.goto Deadwind Pass,53.3,90.2
		.complete 9824,1 

	step
		.goto Deadwind Pass,48.7,78.9,20,0
		.goto Deadwind Pass,45.9,78.1,15 >>Go down the entrance of the other cellar

	step
		#label PondR
		.use 24474 >>Use |T134075:0|t[Violet Scrying Crystal] in the water
		.goto Deadwind Pass,42.8,78.1
		.complete 9824,2 

	step
		.goto Deadwind Pass,43.4,71.2,20,0
		.goto Deadwind Pass,45.6,71.6,40,0
		.goto Deadwind Pass,41.3,70.0,40,0
		.goto Deadwind Pass,41.5,63.0,40,0
		.goto Deadwind Pass,41.7,76.8,40,0
		.goto Deadwind Pass,46.8,75.1,40,0
		.goto Deadwind Pass,43.4,71.2,20,0
		.goto Deadwind Pass,45.6,71.6,40,0
		.goto Deadwind Pass,41.3,70.0,40,0
		.goto Deadwind Pass,41.5,63.0,40,0
		.goto Deadwind Pass,41.7,76.8,40,0
		.goto Deadwind Pass,46.8,75.1,40,0
		.goto Deadwind Pass,43.4,71.2,20,0
		.goto Deadwind Pass,45.6,71.6,40,0
		.goto Deadwind Pass,41.3,70.0,40,0
		.goto Deadwind Pass,41.5,63.0,40,0
		.goto Deadwind Pass,41.7,76.8,40,0
		.goto Deadwind Pass,46.8,75.1,40,0
		>>Finish looting Ghosts for the essences. Split your group up to go back to the other cellar for more spawns if you wish
		.complete 9825,1 
		.mob Unliving Caretaker
		.mob Damned Soul
		.mob Wailing Spectre
		.mob Restless Shade

	step
		.goto Deadwind Pass,47.0,75.6
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Archmage Alturus|r
		.turnin 9825 >>Turn in Restless Activity
		.turnin 9824 >>Turn in Arcane Disturbances
		.accept 9826 >>Accept Contact from Dalaran
		.target Archmage Alturus

	step
		.goto Swamp of Sorrows,46.0,54.7
		.fly Tarren Mill >>Fly to Tarren Mill or use a Portal to Undercity
		.zoneskip Hillsbrad Foothills

	step
		>>Ride to the Outskirts of Dalaran and speak to Archmage Cedric.
		.goto Alterac Mountains,15.6,54.6
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Archmage Cedric|r
		.turnin 9826 >>Turn in Contact from Dalaran
		.accept 9829 >>Accept Khadgar
		.target Archmage Cedric

	step
		#sticky
		#completewith ShattAlterac
		>>Hearth or Mage portal to Shattrath City
		.zoneskip Shattrath

	step
		#sticky
		#completewith next
		+If your Hearthstone is on cooldown, ghetto hearth using Shadowfang Keep. Zone into Shadowfang Keep then drop group
		.goto Silverpine Forest,45.5,68.8

	step
		#label ShattAlterac
		.zone Shattrath City >> Go to Shattrath City
		.zoneskip Shattrath City

	step
		.goto Shattrath City,54.7,44.4
		.turnin 9829 >>Turn in Khadgar
		.accept 9831 >>Accept Entry Into Karazhan
		.target Khadgar

	step
		+Take the Portal to Orgrimmar
		.goto Shattrath City,52.2,52.8
		.zone Orgrimmar >> Go to Orgrimmar
		.zoneskip Orgrimmar

	step
		#completewith next
		.goto Orgrimmar,45.12,63.89,5,0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Doras|r
		.fly Tanaris >>Fly to |cFFfa9602Tanaris|r
		.target Doras
		.zoneskip Tanaris

	step
		.goto Tanaris,66.1,49.7 >>Travel to the Caverns of Time
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Steward of Time|r
		.accept 10279 >>Accept To The Master's Lair
		.target Steward of Time

	step
		.goto Tanaris,58.4,54.2
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Andormu|r
		.turnin 10279
		.accept 10277
		.target Andormu

	step
		>> Follow the |cRXP_FRIENDLY_Custodian of Time|r or afk next to |cRXP_FRIENDLY_Andormu|r
		.complete 10277,1 
		.target Custodian of Time

	step
		.goto Tanaris,58.4,54.2
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Andormu|r
		.turnin 10277
		.accept 10282
		.target Andormu

	step
		.goto Tanaris,55.6,53.6,20 >>Enter Old Hillsbrad Foothills Dungeon.

	step
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Erozion|r
		.turnin 10282 >>Turn in Old Hillsbrad
		.accept 10283 >>Accept Taretha's Diversion
		.target Erozion

	step
		>>Click on the barrel in the barracks in order to set them ablaze
		.complete 10283,1

	step
		>>Clear up to Thrall who is located in the basement prison of Durnholde Keep.
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thrall|r
		.turnin 10283 >>Turn in Taretha's Diversion
		.accept 10284 >>Accept Escape from Durnholde
		.target Thrall

	step
		>>Clear the rest of the dungeon killing the Epoch Hunter in Tarren Mill
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Erozion|r
		.turnin 10284 >>Turn in Escape from Durnholde
		.accept 10285 >>Accept Return to Andormu
		.target Erozion

	step
		>>Exit Old Hillsbrad Foothills Dungeon.
		.goto Tanaris,58.4,54.2
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Andormu|r
		.turnin 10285 >>Turn in Return to Andormu
		.accept 10296 >>Accept The Black Morass
		.target Andormu

	step
		.goto Tanaris,57.4,62.8,20 >> Enter The Black Morass

	step
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sa'at|r
		>>Make sure each member of your Dungeon Group picks up a Chrono-Beacon from him.
		.turnin 10296 >>Turn in The Black Morass
		.accept 10297 >>Accept The Opening of the Dark Portal	
		.target Sa'at
		
	step
		>>Defend |cRXP_FRIENDLY_Medivh|r
		.complete 10297,1

	step
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sa'at|r
		.turnin 10297
		.accept 10298
		.target Sa'at
		
	step
		.goto Tanaris,58.4,54.2
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Andormu|r
		.turnin 10298
		.target Andormu

	step
		>>Clear |cFFfa9602Black Morass|r until you are 1000 rep away from revered with |cRXP_FRIENDLY_Keepers of Time|r
        >>This will take around 5-6 runs with an average of 1100 rep per run
        .reputation,989,Honored,11000

	step
		.hs >> Hearth to Shattrath City
		.zoneskip Shattrath City

	step
		.goto Shattrath City,64.0,41.1
		.fly Stonebreaker Hold >>Fly to Stonebreaker Hold

	step
		#sticky
		#completewith next
		>>Restock from the vendors outside if you're running low on food/drink/ammo/poisons etc
		.goto Terokkar Forest,39.7,70.1

	step
		.goto Terokkar Forest,39.7,71.0,30 >> Use the key from Sethekk Halls to open the Shadow Labyrinth Door

	step
		>>Click the Container on the left after killing Murmur to spawn the |cRXP_ENEMY_First Fragment Guardian|r
		>>Kill and loot him for the |cRXP_LOOT_First Key Fragment|r
		.complete 9831,1 
		.mob First Fragment Guardian

	step
		>>Clear |cFFfa9602The Shadow Labyrinth|r until you reach revered reputation with |cRXP_FRIENDLY_Lower City|r
        >>This will take around 6 runs with an average of 2000 rep per run
		>> You can opt to clear only the first two bosses of the dungeon for improved efficiency
        .reputation,1011,Revered
		
	step
		.hs >> Hearth to Shattrath City
		.zoneskip Shattrath City	

    step
        .goto Shattrath City,54.74,44.32
        >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Khadgar|r
       	.turnin 9831 >>Turn In Entry Into Karazhan
		.accept 9832 >>Accept The Second and Third Fragments
        .target Khadgar   

    step
        #completewith next
        .goto Shattrath City,45.12,63.89,5,0
        >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nutral|r
        .fly Swamprat Post >>Fly to |cFFfa9602Swamprat Post|r
        .target Nutral
        .zoneskip Zangarmarsh

	step
		#completewith next
		.goto Zangarmarsh,50.4,40.8,15,0
		.goto Zangarmarsh,51.9,37.8,20 >>Swim to the center of Coilfang Reservoir until you are over the open drain pipe below. Dive and swim through it until you find the underwater cavern.

	step
		.goto Zangarmarsh,52.3,36.0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Watcher Jhang|r
		.accept 9763 >>Accept The Warlord's Hideout
		.target Watcher Jhang

	step
		.goto Zangarmarsh,50.4,33.3,20 >> Enter The Steamvaults

	step
		>>Click the Container underwater near the first boss (northern part of the water) to spawn the |cRXP_ENEMY_Second Fragment Guardian|r
		>>Kill and loot him for the |cRXP_LOOT_Second Key Fragment|r
		.complete 9832,1 
		.mob Second Fragment Guardian		

	step
		#sticky
		.complete 9763,1
		.target Warlord Kalithresh
	
	step
		#completewith next
		.goto Zangarmarsh,52.3,36.0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Watcher Jhang|r
		.turnin 9763 >>Turn In The Warlord's Hideout
		.target Watcher Jhang

    step
		>>Clear |cFFfa9602The Steamvault|r until you reach revered reputation with |cRXP_FRIENDLY_Cenarion Expedition|r
        >>This will take around 7 runs with an average of 1800 rep per run
        .reputation,942,Revered

	step
		.hs >> Hearth to Shattrath City
		.zoneskip Shattrath City	

    step
        #completewith next
        .goto Shattrath City,45.12,63.89,5,0
        >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nutral|r
        .fly Stonebreaker Hold >>Fly to |cFFfa9602Stonebreaker Hold|r
        .target Nutral
        .zoneskip Terokkar Forest

	step
		.goto Shadowmoon Valley,30.3,29.2
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Drek'Gol|r
		.fp Shadowmoon Village >> Get the Shadowmoon Village flight path
		.target Drek'Gol

	step
		.goto Shadowmoon Valley,29.2,29.2
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Olrokk|r
		.skill riding,225,1
		.target Olrokk


-- include shattered halls key

	step
		>>Clear |cFFfa9602The Shattered Halls|r until you reach revered reputation with |cRXP_FRIENDLY_Thrallmar|r
        >>This will take around 8 runs with an average of 1600 rep per run
        .reputation,947,Revered  

	step
		.hs >> Hearth to Shattrath City
		.zoneskip Shattrath City	

    step
        #completewith next
        .goto Shattrath City,45.12,63.89,5,0
        >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nutral|r
        .fly Shadowmoon Village >>Fly to |cFFfa9602Shadowmoon Village|r
        .target Nutral
        .zoneskip Shadowmoon Valley	

	step
		.goto Shadowmoon Valley,29.2,29.2
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Olrokk|r
		.skill riding,225,1
		.target Olrokk	

	step
		.goto Netherstorm,33.7,64.0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krexcil|r
		.fp Area 52 >> Get the Area 52 flight path
		.target Krexcil

	step
		.goto Netherstorm,32.4,64.2
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nether-Stalker Khay'ji|r
		.accept 10265 >>Accept Consortium Crystal Collection
		.target Nether-Stalker Khay'ji

	step	
		>>Kill |cRXP_ENEMY_Pentatharon|r (The Dreadlord) and loot him for |cRXP_LOOT_Arklon Crystal Artifact|r
		.goto Netherstorm,42.7,72.2
		.complete 10265,1 
		.mob Pentatharon

	step
		.goto Netherstorm,32.5,64.3
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nether-Stalker Khay'ji|r
		.turnin 10265 >>Turn in Consortium Crystal Collection
		.accept 10262 >>Accept A Heap of Ethereals
		.target Nether-Stalker Khay'ji

	step
		>>Note: This quest isn't group friendly but it is essential to do for the Arcatraz Attunement which is needed for Karazhan Attunement.
		.goto Netherstorm,31.2,74.7
		>>Kill |cRXP_ENEMY_Zaxxis|r mobs in the area. Loot them for their |cRXP_LOOT_Zaxxis Insignia|r
		.complete 10262,1
		.mob Zaxxis Raider
		.mob Zaxxis Stalker
		.mob Warp-Raider Nesaad

	step
		.goto Netherstorm,32.5,64.3
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nether-Stalker Khay'ji|r
		.turnin 10262 >>Turn in A Heap of Ethereals
		.accept 10205 >>Accept Warp-Raider Nesaad
		.target Nether-Stalker Khay'ji

	step
		>>Kill |cRXP_ENEMY_Warp-Raider Nesaad|r
		.goto Netherstorm,28.0,79.2
		.complete 10205,1 
		.mob Warp-Raider Nesaad

	step
		.goto Netherstorm,32.5,64.3
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nether-Stalker Khay'ji|r
		.turnin 10205 >>Turn in Warp-Raider Nesaad
		.accept 10266 >>Accept Request for Assistance
		.target Nether-Stalker Khay'ji

	step
		.goto Netherstorm,46.7,57.0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gahruj|r
		.turnin 10266 >>Turn in Request for Assistance
		.accept 10267 >>Accept Rightful Repossession
		.target Gahruj

	step
		>>This quest isn't group friendly but it is essential to do for the Arcatraz Attunement which is needed for Karazhan Attunement
		>>Loot |cRXP_LOOT_Box of Surveying Equipment|r on the ground in the area
		.goto Netherstorm,57.5,66.8
		.complete 10267,1

	step
		.goto Netherstorm,46.7,57.0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gahruj|r
		.turnin 10267 >>Turn in Rightful Repossession
		.accept 10268 >>Accept An Audience with the Prince
		.target Gahruj

	step
		.goto Netherstorm,45.3,34.9
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Grennik|r
		.fp Stormspire >> Get The Stormspire flight path
		.target Grennik

	step
		.goto Netherstorm,45.8,36.0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Image of Nexus-Prince Haramad|r
		.turnin 10268 >>Turn in An Audience with the Prince
		.accept 10269 >>Accept Triangulation Point One
		.target Image of Nexus-Prince Haramad

	step
		.goto Netherstorm,66.7,33.6
		.use 28962 >>Use the |T135164:0|t[Triangulation Device] at the 3-way fork in the road, northeast of Manaforge Ultris
		.complete 10269,1 

	step
		.goto Netherstorm,58.4,31.3
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dealer Hazzin|r
		.turnin 10269 >>Turn in Triangulation Point One
		.accept 10275 >>Accept Triangulation Point Two
		.target Dealer Hazzin

	step
		.goto Netherstorm,29.0,41.2
		.use 29018 >>Use the |T135164:0|t[Triangulation Device] east of the bottom of Manaforge Ara
		.complete 10275,1 

	step
		.goto Netherstorm,34.6,37.9
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Wind Trader Tuluman|r
		.turnin 10275 >>Turn in Triangulation Point Two
		.accept 10276 >>Accept Full Triangle
		.target Wind Trader Tuluman

	step
		>>Kill |cRXP_ENEMY_Culuthas|r (Level 70 Elite Demon) and loot him for |cRXP_LOOT_Ata'mal Crystal|r
		.goto Netherstorm,53.5,21.5
		.complete 10276,1 
		.mob Culuthas

	step
		.goto Netherstorm,45.9,36.0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Image of Nexus-Prince Haramad|r
		.turnin 10276 >>Turn in Full Triangle
		.accept 10280 >>Accept Special Delivery to Shattrath City
		.target Image of Nexus-Prince Haramad

	step
		.hs >> Hearth to Shattrath City
		.zoneskip Shattrath City	

    step
        .goto Shattrath City,54.6,44.6
        >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_A'dal|r
        .turnin 10280
		.accept 10704
        .target A'dal

	step
		.goto Netherstorm,71.7,55.1,20 >> Fly to |cFFfa9602The Botanica|r, then go inside

	step
		>>Kill |cRXP_ENEMY_Warpsplinter|r at the end of |cFFfa9602The Botanica|r and loot him to obtain the |cRXP_LOOT_Top Shard of the Arcatraz Key|r
		.complete 10704,1
		.mob Warpsplinter

	step
		#completewith next
		+Exit the dungeon and prepare to run cFFfa9602Mechanar|r. Go back to Cosmowrench if you need to vendor/repair

	step
		.goto Netherstorm,70.6,69.8,20 >> Fly to cFFfa9602The Mechanar|r, then go inside

	step
		>>Kill |cRXP_ENEMYN_Pathaleon|r and loot him for the |cRXP_LOOT_Bottom Shard of the Arcatraz Key|r
		.complete 10704,2
		.mob Pathaleon

	step
		.hs >> Hearth to Shattrath City
		.zoneskip Shattrath City	

	step
		.goto Shattrath City,54.0,44.9
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_A'dal|r
		.turnin 10704 >>Turn in How to Break Into the Arcatraz
		.target A'dal

	 step
        #completewith next
        .goto Shattrath City,45.12,63.89,5,0
        >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nutral|r
        .fly Area 52 >>Fly to |cFFfa9602Area 52|r
        .target Nutral
        .zoneskip Area 52

	step
		.goto Netherstorm,74.4,57.7,20 >> Fly to The Arcatraz, unlock the door, then go inside

	step
		>>Click the Container tucked in the corner of the blue room after the first boss to spawn the |cRXP_ENEMY_Third Fragment Guardian|r
		>>Kill and loot him for the |cRXP_LOOT_Third Key Fragment|r
		.complete 9832,2
		.mob Third Fragment Guardian	

    step
        .goto Shattrath City,54.74,44.32
        >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Khadgar|r
		.turnin 9832
        .accept 9836
        .target Khadgar

	step
		+Take the Portal to Thunder Bluff
		.goto Shattrath City,52.2,52.8
		.zone Thunder Bluff >> Go to Thunder Bluff
		.zoneskip Thunder Bluff

	step
		#completewith next
		.goto Thunder Bluff,47.00,49.82
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tal|r
		.fly Gadgetzan >> Fly to Gadgetzan
		.target Tal
		.zoneskip Tanaris

	step
		#completewith next
		.goto Tanaris,62.0,50.4,100 >>Travel to the Caverns of Time

	step
		#completewith next
		+Talk to the Steward Of Time. Accept the ride down to the Master's Lair

	step
		.goto Tanaris,57.4,62.8,20 >> Enter The Black Morass

	step
		>>Defend |cRXP_FRIENDLY_Medivh|r. After defeating |cRXP_ENEMY_Aeonus|r:
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Medivh|r
		.turnin 9836 >>Turn In the Master's Touch
		.accept 9837 >>Return to Khadgar
		.target Medivh
		.mob Aeonus

	step
		.hs >> Hearth to Shattrath City
		.zoneskip Shattrath City	

    step
        .goto Shattrath City,54.74,44.32
        >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Khadgar|r
        .accept 9837
        .target Khadgar

	 step
        #completewith next
        .goto Shattrath City,45.12,63.89,5,0
        >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nutral|r
        .fly Area 52 >>Fly to |cFFfa9602Area 52|r
        .target Nutral
        .zoneskip Area 52

	step
		.goto Netherstorm,71.7,55.1,20 >> Fly to |cFFfa9602The Botanica|r, then go inside

	step
		>>Clear |cFFfa9602The Botancia|r until you reach revered reputation with |cRXP_FRIENDLY_Sha'tar|r
        >>This will take around 8 runs with an average of 1600 rep per run
        .reputation,935,Revered  

	step
		+Congratulations, you have now reached Level 70, unlocked 15/15 Heroic Dungeons, got your Flying Mount and are attuned for Karazhan.

]])