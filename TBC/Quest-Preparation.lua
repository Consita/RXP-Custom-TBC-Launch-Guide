RXPGuides.RegisterGuide([[
#classic
#version 3
#group Consita Classic/TBC Launch Guide
#subgroup 2 - Quest Preparation
#name 1-Quest Preparation
#displayname Quest Preparation
#next Group Turn-in

-- |cRXP_FRIENDLY_, |cRXP_ENEMY_, |cRXP_LOOT_, |cRXP_WARN_, |cRXP_PICK_, |cRXP_BUY_
-- |c99ffff99 OR|r
-- |Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk

--- BRD

--- Azshara

	step
		#completewith next
		.zone Azshara >>Travel to |cFFfa9602Azshara|r
		.zoneskip Azshara

	step
		.goto Azshara,79.2,73.6,5,0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Duke Hydraxis|r
		.accept 6804
		.accept 6805

--- Moonglade 1

	step << Druid
		#completewith next
		.cast 18960 >>Cast |T135758:0|t[Teleport: Moonglade]
		.zoneskip Moonglade

	step << Druid
		.goto Moonglade,51.70,45.00
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rabine|r
		.accept 1124 >>Accept Wasteland
		.accept 5527
		.target Rabine Saturna

--- Orgrimmar 1

	step
		#completewith next
		.zone Orgrimmar >>Travel to |cFFfa9602Orgrimmar|r
		.zoneskip Orgrimmar

	step
	    .goto Orgrimmar,34.96,38.28
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mokvar|r
		.accept 8913 >>Accept An Earnest Proposition << Druid
		.accept 8914 >>Accept An Earnest Proposition << Hunter
		.accept 8915 >>Accept An Earnest Proposition << Mage
		.accept 8916 >>Accept An Earnest Proposition << Priest
		.accept 8917 >>Accept An Earnest Proposition << Rogue
		.accept 8918 >>Accept An Earnest Proposition << Shaman
		.accept 8919 >>Accept An Earnest Proposition << Warlock
		.accept 8920 >>Accept An Earnest Proposition << Warrior
		.target Mokvar

--- Silithus 1

	step
		>> Keep an eye out for |T133463:0|t[|cRXP_LOOT_Brann Bronzebeard's Lost Letter|r] dropped by |cRXP_ENEMY_Hive'Ashi Drones|r. It is part of the TBC turn in.
		.collect 20461

	step
		#completewith next
		.zone Silithus >>Travel to |cFFfa9602Silithus|r
		.zoneskip Silithus

	step
		.goto Silithus,49.7,37.5,5,0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Geologist Larksbane|r
		.accept 8284 >> Accept The Twilight Mystery
		.target Geologist Larksbane

	step
		#label scorpidst0
		#loop
		.goto Silithus,64.82,41.47,0
		.goto Silithus,58.38,21.10,0
		.goto Silithus,33.34,35.27,0
		.goto Silithus,36.65,62.73,0
		.goto Silithus,28.52,77.73,0
		.goto Silithus,45.40,80.20,0
		.goto Silithus,58.80,61.99,0
		.goto Silithus,64.82,41.47,90,0
		.goto Silithus,58.38,21.10,90,0
		.goto Silithus,33.34,35.27,90,0
		.goto Silithus,36.65,62.73,90,0
		.goto Silithus,28.52,77.73,90,0
		.goto Silithus,45.40,80.20,90,0
		.goto Silithus,58.80,61.99,90,0
		>>Kill all types of |cRXP_ENEMY_Spiders|r and |cRXP_ENEMY_Scorpids|r. Loot them for their |cRXP_LOOT_Silithus Venom Samples|r
		.complete 8913,1 << Druid --Silithus Venom Sample (x15)
		.complete 8914,1 << Hunter --Silithus Venom Sample (x15)
		.complete 8915,1 << Mage --Silithus Venom Sample (x15)
		.complete 8916,1 << Priest --Silithus Venom Sample (x15)
		.complete 8917,1 << Rogue --Silithus Venom Sample (x15)
		.complete 8918,1 << Shaman --Silithus Venom Sample (x15)
		.complete 8919,1 << Warlock --Silithus Venom Sample (x15)
		.complete 8920,1 << Warrior --Silithus Venom Sample (x15)
		.mob Sand Skitterer
		.mob Stonelash Pincer
		.mob Stonelash Scorpid
		.mob Stonelash Flayer
		.mob Rock Stalker

	step
		#complete with next
		>>Loot the blue |cRXP_PICK_Glowing Tablets|r on the ground for |cRXP_LOOT_Twilight Tablet Fragments|r
		.complete 8284,1 

	step
		#label mcpre1
		#loop
		.goto Silithus,19.50,21.10,0
		.goto Silithus,19.50,21.10,50,0
		.goto Silithus,20.10,15.50,50,0
		.goto Silithus,21.50,12.80,50,0
		.goto Silithus,21.70,9.40,50,0
		.goto Silithus,24.10,9.80,50,0
		.goto Silithus,26.60,13.30,50,0
		.goto Silithus,24.10,15.50,50,0
		.goto Silithus,21.50,22.00,50,0
		>>Kill |cRXP_ENEMY_Dust Stormer|r and |cRXP_ENEMY_Desert Rumbler|r for |cRXP_LOOT_Stormers and Rumblers|r
		.mob Dust Stormer
		.mob Desert Rumbler
		.complete 6805,1
		.complete 6805,2

	step
		#loop
		.goto Silithus,19.50,21.10,0
		.goto Silithus,19.50,21.10,50,0
		.goto Silithus,20.10,15.50,50,0
		.goto Silithus,21.50,12.80,50,0
		.goto Silithus,21.70,9.40,50,0
		.goto Silithus,24.10,9.80,50,0
		.goto Silithus,26.60,13.30,50,0
		.goto Silithus,24.10,15.50,50,0
		.goto Silithus,21.50,22.00,50,0
		>>Loot the blue |cRXP_PICK_Glowing Tablets|r on the ground for |cRXP_LOOT_Twilight Tablet Fragments|r
		.complete 8284,1 

		
--- Orgrimmar 2

	step
		#requires scorpidst0
		#requires mcpre1
		#completewith next
		.zone Orgrimmar >>Travel to |cFFfa9602Orgrimmar|r
		.zoneskip Orgrimmar
		
	step
		#requires scorpidst0
		#requires mcpre1
		.goto Orgrimmar,34.96,38.28
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mokvar|r
		>>|cRXP_WARN_You will need 20 gold and|r |T132608:0|t[|cRXP_LOOT_Wildheart Bracers|r] |cRXP_WARN_to turn in this quest|r << Druid
		>>|cRXP_WARN_You will need 20 gold and|r |T132616:0|t[|cRXP_LOOT_Beaststalker's Bindings|r] |cRXP_WARN_to turn in this quest|r << Hunter
		>>|cRXP_WARN_You will need 20 gold and|r |T133365:0|t[|cRXP_LOOT_Magister's Bindings|r] |cRXP_WARN_to turn in this quest|r << Mage
		>>|cRXP_WARN_You will need 20 gold and|r |T132520:0|t[|cRXP_LOOT_Devout Bracers|r] |cRXP_WARN_to turn in this quest|r << Priest
		>>|cRXP_WARN_You will need 20 gold and|r |T132606:0|t[|cRXP_LOOT_Shadowcraft Bracers|r] |cRXP_WARN_to turn in this quest|r << Rogue
		>>|cRXP_WARN_You will need 20 gold and|r |T132601:0|t[|cRXP_LOOT_Bindings of Elements|r] |cRXP_WARN_to turn in this quest|r << Shaman
		>>|cRXP_WARN_You will need 20 gold and|r |T132612:0|t[|cRXP_LOOT_Dreadmist Bracers|r] |cRXP_WARN_to turn in this quest|r << Warlock
		>>|cRXP_WARN_You will need 20 gold and|r |T132617:0|t[|cRXP_LOOT_Bracers of Valor|r] |cRXP_WARN_to turn in this quest|r << Warrior
		.collect 16714,1,8913,1 << Druid --Wildheart Bracers (x1)
		.collect 16681,1,8914,1 << Hunter --Beaststalker's Bindings (x1)
		.collect 16683,1,8915,1 << Mage --Magister's Bindings (x1)
		.collect 16697,1,8916,1 << Priest --Devout Bracers (x1)
		.collect 16710,1,8917,1 << Rogue --Shadowcraft Bracers (x1)
		.collect 16671,1,8918,1 << Shaman --Bindings of Elements (x1)
		.collect 16703,1,8919,1 << Warlock --Dreadmist Bracers (x1)
		.collect 16735,1,8920,1 << Warrior --Bracers of Valor (x1)
		.turnin 8913 >>Turn in An Earnest Proposition << Druid
		.turnin 8914 >>Turn in An Earnest Proposition << Hunter
		.turnin 8915 >>Turn in An Earnest Proposition << Mage
		.turnin 8916 >>Turn in An Earnest Proposition << Priest
		.turnin 8917 >>Turn in An Earnest Proposition << Rogue
		.turnin 8918 >>Turn in An Earnest Proposition << Shaman
		.turnin 8919 >>Turn in An Earnest Proposition << Warlock
		.turnin 8920 >>Turn in An Earnest Proposition << Warrior
		.accept 8923 >>Accept A Supernatural Device
		.target Mokvar

	step
		.goto Orgrimmar,55.59,62.92
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thathung|r
		>>|cRXP_BUY_Collect the following items|r:
		>>|T133001:0|t[Delicate Arcanite Converters] |cRXP_WARN_are made by engineers|r
		>>|T132864:0|t[|cRXP_FRIENDLY_Greater Eternal Essences|r] |cRXP_WARN_are obtained by enchanters|r
		>>|T134848:0|t[Stonescale Oil] |cRXP_WARN_is made by alchemists|r
		>>|T132621:0|t[Goblin Rocket Fuel] |cRXP_WARN_is made by engineers|r
		>>|cRXP_WARN_Buy them from the Auction House if possible|r
		.collect 16006,1,8921,1 --Delicate Arcanite Converter (x1)
		.collect 16203,4,8921,1 --Greater Eternal Essence (x4)
		.collect 13423,10,8921,1 --Stonescale Oil (x10)

--- Tanaris 1

	step
		.goto Orgrimmar,45.12,63.89,5,0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Doras|r
		.fly Gadgetzan >> Fly to Gadgetzan
		.target Doras
		.zoneskip Tanaris

	step
		.goto Tanaris,52.47,27.23,5,0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mux Manascrambler|r
		.target Mux Manascrambler
		.turnin 8923
		.accept 8921

--- Burning Steppes

	step
		#completewith next
		.zone Burning Steppes >>Travel to |cFFfa9602Burning Steppes|r
		.zoneskip Burning Steppes

	step
		#loop
		.goto Burning Steppes,71.87,29.57,0
		.goto Burning Steppes,64.74,33.56,0
		.goto Burning Steppes,50.35,35.24,0
		.goto Burning Steppes,52.08,42.58,0
		.goto Burning Steppes,40.66,43.78,0
		.goto Burning Steppes,34.95,47.61,0
		.goto Burning Steppes,23.40,46.28,0
		.goto Burning Steppes,34.32,58.78,0
		.goto Burning Steppes,55.26,47.90,0
		.goto Burning Steppes,71.87,29.57,60,0
		.goto Burning Steppes,64.74,33.56,60,0
		.goto Burning Steppes,50.35,35.24,60,0
		.goto Burning Steppes,52.08,42.58,60,0
		.goto Burning Steppes,40.66,43.78,60,0
		.goto Burning Steppes,34.95,47.61,60,0
		.goto Burning Steppes,23.40,46.28,60,0
		.goto Burning Steppes,34.32,58.78,60,0
		.goto Burning Steppes,55.26,47.90,60,0
		>>Loot |cRXP_LOOT_Volcanic Ash|r on the ground
		>>|cRXP_WARN_They look like large piles of grey dirt and can be found in mainly in Northern Burning Steppes among the lava pools and rivers|r
		.collect 22338,25,8921,1 --Volcanic Ash (x25)

--- Tanaris 2

	step
		#completewith next
		.subzone 976 >>Travel to Gadgetzan in |cFFfa9602Tanaris|r
		.zoneskip Tanaris

	step
		.goto Tanaris,52.47,27.23
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mux Manascrambler|r
		>>|cRXP_WARN_You will need 40 gold to turn in this quest|r
		.turnin 8921 >>Turn in The Ectoplasmic Distiller
		.accept 8924 >>Accept Hunting for Ectoplasm
		.target Mux Manascrambler

--- Silithus 2

	step
		>> Keep an eye out for |T133463:0|t[|cRXP_LOOT_Brann Bronzebeard's Lost Letter|r] dropped by |cRXP_ENEMY_Hive'Ashi Drones|r. It is part of the TBC turn in.
		.collect 20461

	step
		.goto Silithus,49.7,37.5,5,0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Geologist Larksbane|r
		.target Geologist Larksbane
		.turnin 8284
		.accept 8285

	step
		.goto Silithus,48.6,37.9,5,0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Huum Wildmane|r
		.target Huum Wildmane
		.accept 8320

	step
		.isQuestAvailable 8307
		.goto Silithus,51.9,39.1,5,0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Calandrath|r
		.target Calandrath
		.accept 8307

	step
		.goto Silithus,67,69.6,5,0
		>>Find and speak to |cRXP_FRIENDLY_Hermit Ortell|r (The Deserter)
		.complete 8285,1
		.target Hermit Ortell
		.turnin 8285
		.accept 8279

	step
		.goto Silithus,41.30,88.50,10,0
		.goto Silithus,40.80,88.80
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rutgar|r and |cRXP_FRIENDLY_Frankal|r
		.complete 8304,2 
		.complete 8304,1 
		.target Rutgar Glyphshaper
		.target Frankal Stonebridge
		.skipgossip		

	step
		.goto Silithus,49.20,34.30
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mar'alith|r
		.turnin 8304 >>Turn in Dearest Natalia
		.accept 8306
		.target Commander Mar'alith	

	step
		#completewith TwilightLexicon3
		#label TwilightGeolords
		>>Kill |cRXP_ENEMY_Twilight Geolords|r at multiple locations while doing the next quests
		.mob Twilight Geolord
		.complete 8320,1

	step
		#sticky
		#label TwilightLexicon
		#label TwilightCook
		#completewith TwilightCook2
		.goto Silithus,40.86,42.22
		>>Kill |cRXP_ENEMY_Twilight Keeper Havunth|r. Loot him for his |cRXP_LOOT_Twilight Lexicon Chapter|r
		>>He patrols the east side of the camp that's just southwest of Cenarion Hold
		>>|cRXP_WARN_Be careful, he has very high burst|r
		.complete 8279,3 
		.unitscan Twilight Keeper Havunth

	step	
		#label TwilightCook2
		.isOnQuest 8307
		.goto Silithus,38.0,45.3,5,0
		>>Interact with |cRXP_PICK_Sandy Cookbook|r
		.skipgossip
		.turnin 8307
		.accept 8313

	step
		.goto Silithus,40.86,42.22
		>>Kill |cRXP_ENEMY_Twilight Keeper Havunth|r. Loot him for his |cRXP_LOOT_Twilight Lexicon Chapter|r
		>>He patrols the east side of the camp that's just southwest of Cenarion Hold
		>>|cRXP_WARN_Be careful, he has very high burst|r
		.complete 8279,3 
		.unitscan Twilight Keeper Havunth


	step
		#requires TwilightCook
		#label TwilightLexicon
		.goto Silithus,26.34,36.62
		>>Kill |cRXP_ENEMY_Twilight Keeper Mayna|r. Loot her for her |cRXP_LOOT_Twilight Lexicon Chapter|r
		>>She patrols the camp far west of Cenarion Hold
		>>|cRXP_WARN_Be careful, she has Psychic Scream (instant fear)|r
		.complete 8279,1 
		.unitscan Twilight Keeper Mayna

	step
		#requires TwilightCook
		#label TwilightLexicon3
		.goto Silithus,16.08,86.37
		>>Kill |cRXP_ENEMY_Twilight Keeper Exeter|r. Loot him for his |cRXP_LOOT_Twilight Lexicon Chapter|r
		>>He's at the back of the camp very far to the southwest of Cenarion Hold/northwest of Ahn'Qiraj
		>>|cRXP_WARN_Be careful, he has a stun and mortal strike|r
		.complete 8279,2 
		.unitscan Twilight Keeper Exeter

	step
		#label TwilightGeolords
		>>Kill |cRXP_ENEMY_Twilight Geolords|r at the Twilight Camps.
		.mob Twilight Geolord
		.complete 8320,1

	step
		.goto Silithus,41.30,88.50,10,0
		.goto Silithus,40.80,88.80
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rutgar|r and |cRXP_FRIENDLY_Frankal|r
		.target Rutgar Glyphshaper
		.target Frankal Stonebridge
		.accept 8309
		.accept 8310

	step
		#completewith next
		>>Kill |cRXP_ENEMY_Hive'Zora Bugs|r. Loot them for |cRXP_LOOT_Hive'Zora Silithid Brain|r
		.mob Hive'Zora Reaver
		.mob Hive'Zora Waywatcher
		.mob Hive'Zora Hive Sister
		.mob Hive'Zora Wasp
		.mob Hive'Zora Tunneler
		.complete 8310,2

	step
		.goto Silithus,27.6,66.0,10,0
		.goto Silithus,37.3,62.5,5,0
		>>Interact with |cRXP_PICK_Hive'Zora Glyph|r
		.complete 8309,2

	step
		>>Kill |cRXP_ENEMY_Hive'Zora Bugs|r. Loot them for |cRXP_LOOT_Hive'Zora Silithid Brain|r
		.mob Hive'Zora Reaver
		.mob Hive'Zora Waywatcher
		.mob Hive'Zora Hive Sister
		.mob Hive'Zora Wasp
		.mob Hive'Zora Tunneler
		.complete 8310,2

	step
		#completewith next
		>>Kill |cRXP_ENEMY_Hive'Ashi Bugs|r. Loot them for |cRXP_LOOT_Hive'Ashi Silithid Brain|r
		.mob Hive'Ashi Defender
		.mob Hive'Ashi Swarmer
		.mob Hive'Ashi Sandstalker
		.mob Hive'Ashi Stinger
		.mob Hive'Ashi Worker
		.mob Hive'Ashi Ambusher
		.mob Hive'Ashi Drone
		.complete 8310,1

	step
		.goto Silithus,48.0,25.0,10,0
		.goto Silithus,50.0,26.0,5,0
		>>Interact with |cRXP_PICK_Hive'Ashi Glyph|r
		.complete 8309,1

	step
		>>Kill |cRXP_ENEMY_Hive'Ashi Bugs|r. Loot them for |cRXP_LOOT_Hive'Ashi Silithid Brain|r
		.mob Hive'Ashi Defender
		.mob Hive'Ashi Swarmer
		.mob Hive'Ashi Sandstalker
		.mob Hive'Ashi Stinger
		.mob Hive'Ashi Worker
		.mob Hive'Ashi Ambusher
		.mob Hive'Ashi Drone
		.complete 8310,1

	step << Druid
		.goto Silithus,81.87,18.93
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Layo|r
		.turnin 1124 >>Turn in Wasteland
		.accept 1125 >>Accept The Spirits of Southwind

	step << Druid
		#completewith SilithidObject
		>>Kill |cRXP_ENEMY_Tortured Druids|r and |cRXP_ENEMY_Tortured Sentinels|r
		>>|cRXP_WARN_They have a high chance to spawn a|r |cRXP_ENEMY_Hive'Ashi Drone|r |cRXP_WARN_after dying|r
		.complete 1125,1 
		.mob +Tortured Druid
		.complete 1125,2 
		.mob +Tortured Sentinel

	step
		#completewith next
		.cast 27433 >>|cRXP_WARN_Place the|r |T133882:0|t[Ectoplasmic Distiller] |cRXP_WARN_on the ground. It lasts for 5 minutes|r
		.use 21946 >>|cRXP_WARN_One|r |T132621:0|t[Goblin Rocket Fuel] |cRXP_WARN_is needed each time you use the|r |T133882:0|t[Ectoplasmic Distiller]
	
	step
		#loop
		.goto Silithus,61.60,48.60,0
		.goto Silithus,61.60,48.60,60,0
		.goto Silithus,63.80,48.60,60,0
		.goto Silithus,63.60,51.60,60,0
		.goto Silithus,62.60,55.60,60,0
		.goto Silithus,62.60,58.60,60,0
		.goto Silithus,60.00,55.80,60,0
		.goto Silithus,60.60,52.80,60,0
		>>Kill |cRXP_ENEMY_Tortured Druids|r and |cRXP_ENEMY_Tortured Sentinels|r. Loot them for their |cRXP_LOOT_Scorched Ectoplasms|r
		>>|cRXP_WARN_Pull them to the|r |T133882:0|t[Ectoplasmic Distiller] |cRXP_WARN_as you kill them|r
		.complete 8924,1 --Scorched Ectoplasm (x12)
		.mob Tortured Druid
		.mob Tortured Sentinel

	step << Druid
		.goto Silithus,63.22,55.35
		>>Loot the |cRXP_PICK_Dusty Reliquary|r inside the lodge for the |cRXP_LOOT_Reliquary of Purity|r
		.complete 5527,1 
		.isOnQuest 5527

	step << Druid
		.goto Silithus,81.87,18.93
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Layo|r
		.turnin 1125 >>Turn in The Spirits of Southwind
		.accept 1126 >>Accept Hive in the Tower
		.target Layo Starstrike

	step << Druid
		#label SilithidObject
		.goto Silithus,60.22,52.55
		>>Click on the |cRXP_PICK_Gooey Nest|r at the top of the tower
		>>Kill the two |cRXP_ENEMY_Hive'Ashi Ambushers|r that spawn on the top floor. Loot them for a |cRXP_LOOT_Encrusted Silithid Object|r
		>>|cRXP_WARN_Be careful! Three|r |cRXP_ENEMY_Hive'Ashi Drones|r |cRXP_WARN_will spawn when you enter the bottom floor of the tower!|r
		.complete 1126,1 
		.mob Hive'Ashi Drone
		.mob Hive'Ashi Ambusher

	step << Druid
		#loop
		.goto Silithus,61.60,48.60,0
		.goto Silithus,61.60,48.60,50,0
		.goto Silithus,63.80,48.60,50,0
		.goto Silithus,63.60,51.60,50,0
		.goto Silithus,62.60,55.60,50,0
		.goto Silithus,62.60,58.60,50,0
		.goto Silithus,60.00,55.80,50,0
		.goto Silithus,60.60,52.80,50,0
		>>Kill |cRXP_ENEMY_Tortured Druids|r and |cRXP_ENEMY_Tortured Sentinels|r
		>>|cRXP_WARN_They have a high chance to spawn a|r |cRXP_ENEMY_Hive'Ashi Drone|r |cRXP_WARN_after dying|r
		.complete 1125,1 
		.mob +Tortured Druid
		.complete 1125,2 
		.mob +Tortured Sentinel

	step << Druid
		.goto Silithus,81.87,18.93
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Layo|r
		.turnin 1126 >>Turn in Hive in the Tower
		.accept 6844 >>Accept Umber, Archivist
		.target Layo Starstrike

	step
		#completewith silithusglyph
		>>Kill |cRXP_ENEMY_Hive'Regal Bugs|r. Loot them for |cRXP_LOOT_Hive'Regal Silithid Brain|r
		.mob Hive'Ashi Hive Lord
		.mob Hive'Ashi Slavemaker
		.mob Hive'Ashi Ambusher
		.mob Hive'Ashi Spitfire
		.mob Hive'Ashi Burrower
		.complete 8310,3

	step
		#completewith next
		>>Kill |cRXP_ENEMY_Mistress Natalia Mar'alith|r for |cRXP_LOOT_Into The Maw of Madness|r
		.mob Mistress Natalia Mar'alith
		.complete 8306,1

	step
		.goto Silithus,55.0,87.0,10,0
		.goto Silithus,52.0,99.0,5,0
		>>Interact with |cRXP_PICK_Hive'Regal Glyph|r
		.complete 8309,3

	step
		#label silithusglyph
		>>Kill |cRXP_ENEMY_Mistress Natalia Mar'alith|r for |cRXP_LOOT_Into The Maw of Madness|r
		.mob Mistress Natalia Mar'alith
		.complete 8306,1

	step
		>>Kill |cRXP_ENEMY_Hive'Regal Bugs|r. Loot them for |cRXP_LOOT_Hive'Regal Silithid Brain|r
		.mob Hive'Ashi Hive Lord
		.mob Hive'Ashi Slavemaker
		.mob Hive'Ashi Ambusher
		.mob Hive'Ashi Spitfire
		.mob Hive'Ashi Burrower
		.complete 8310,3		

	step
		>>|cRXP_WARN_Both of those quests can be used as optional turn in quests for TBC if you completed others already.|r
		.goto Silithus,41.30,88.50,10,0
		.goto Silithus,40.80,88.80
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rutgar|r and |cRXP_FRIENDLY_Frankal|r
		.target Rutgar Glyphshaper
		.target Frankal Stonebridge
		.turnin 8309
		.turnin 8310

	step
		.goto Silithus,51.9,39.1,5,0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Calandrath|r
		.target Calandrath
		.turnin -8313		

	step
		.goto Silithus,48.6,37.9,5,0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Huum Wildmane|r
		.turnin 8320

--- Moonglade 2

	step << Druid
		#completewith next
		.cast 18960 >>Cast |T135758:0|t[Teleport: Moonglade]
		.zoneskip Moonglade

	step << Druid
		.goto Moonglade,44.88,35.60
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Umber|r
		.turnin 6844 >>Turn in Umber, Archivist		
		.target Umber		

	step << Druid
		.goto Moonglade,51.70,45.00
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rabine|r
		.turnin 5527
		.target Rabine Saturna

--- Burning Steppes

	step
		.goto Burning Steppes,58.2,49.4
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tinkee Steamboil|r
		.accept 4726 >> Accept Broodling Essence

	step
		.goto Burning Steppes,60.0,50.0
		.use 12284
		>>Use Draco-Incarcinatrix 900 and Kill |cRXP_ENEMY_Broodlings|r in Burning Steppes
		.complete 4726,1

	step
		.goto Burning Steppes,58.2,49.4
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tinkee Steamboil|r
		.turnin 4726 >> Turn in Broodling Essence
		.accept 4808 >> Accept Felnok Steelspring

--- Winterspring

	step
		.goto Winterspring,61.2,38.6
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Felnok Steelspring|r
		.turnin 4808 >> Turn in Felnok Steelspring
		.accept 4809 >> Accept Chillwind Horns

	step
		.goto Winterspring,63.0,42.0
		>>Kill Chillwind Yetis and collect |cRXP_LOOT_Chillwind Horns|r
		.complete 4809,1

	step
		.goto Winterspring,61.2,38.6
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Felnok Steelspring|r
		.turnin 4808 >> Turn in Chillwind Horns
		.accept 4810 >> Return to Tinkee

--- Back to Burning Steppes

	step
		.goto Burning Steppes,58.2,49.4
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tinkee Steamboil|r
		.turnin 4810 >> Turn in Return to Tinkee
		.accept 4734 >> Accept Egg Freezing

--- UBRS

	step		
		#sticky
		#label EggFreezing
		>>Complete the objectives for |cRXP_LOOT_EggFreezing|r inside UBRS
		.complete 4734,1


--- Swamp of Sorrows

	step
		.goto Swamp of Sorrows,34.8,66.0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to the |cRXP_FRIENDLY_Fallen Hero of the Horde|r
		.accept 2784 >> Accept Fall From Grace

	step
		>>Listen to the |cRXP_FRIENDLY_Fallen Hero of the Horde|r tell his tale
		.complete 2784,1

	step
		.goto Swamp of Sorrows,34.8,66.0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to the |cRXP_FRIENDLY_Fallen Hero of the Horde|r
		.turnin 2784 >> Turn in Fall From Grace
		.accept 2621 >> Accept The Disgraced One

	step
		.goto Swamp of Sorrows,47.9,54.9
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dispatch Commander Ruag|r in Stonard
		.turnin 2621 >> Turn in The Disgraced One
		.accept 2622 >> Accept The Missing Orders

	step
		.goto Swamp of Sorrows,47.9,54.9
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dispatch Commander Ruag|r again
		.turnin 2622 >> Turn in The Missing Orders
		.accept 2623 >> Accept The Swamp-Talker

	step
		.goto Swamp of Sorrows,65.4,22.2
		>>Kill |cRXP_ENEMY_Swamp Talker|r inside the cave and loot his heart
		.complete 2623,1
		.mob Swamp Talker

	step
		.goto Swamp of Sorrows,47.9,54.9
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tReturn to |cRXP_FRIENDLY_Dispatch Commander Ruag|r
		.turnin 2623 >> Turn in The Swamp-Talker
		.accept 2801 >> Accept A Tale of Sorrow

	step
		.goto Swamp of Sorrows,34.8,66.0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tReturn to the |cRXP_FRIENDLY_Fallen Hero of the Horde|r
		.turnin 2801 >> Turn in A Tale of Sorrow
		.accept 2681 >> Accept The Stones That Bind Us

	step
		#label Stones
		>>Free the enslaved demons at the Altar of Storms by pulling them out of their summoning circles before they rebind
		>>- Kill |cRXP_ENEMY_Servants of Grol|r (3)  
		>>- Kill |cRXP_ENEMY_Servants of Allistarj|r (3)  
		>>- Kill |cRXP_ENEMY_Servants of Sevine|r (3)  
		>>- Defeat |cRXP_ENEMY_Razelikh's guardians|r to weaken his hold
		.goto Blasted Lands,63.0,31.0,40,0
		.goto Blasted Lands,62.0,29.0,40,0
		.goto Blasted Lands,62.0,28.0,40,0
		.goto Blasted Lands,62.0,26.0,40,0
		.complete 2681,1 -- Servants of Grol Freed (3)
		.complete 2681,2 -- Servants of Allistarj Freed (3)
		.complete 2681,3 -- Servants of Sevine Freed (3)
		.complete 2681,4 -- Razelikh weakened
		.mob Servant of Grol
		.mob Servant of Allistarj
		.mob Servant of Sevine
		.mob Razelikh the Defiler

	step
		#requires Stones
		>>|cRXP_WARN_Optional|r. This quest can also be used for turnin if you miss one of the big quests.
		.goto Swamp of Sorrows,34.8,66.0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tReturn to the |cRXP_FRIENDLY_Fallen Hero of the Horde|r
		.turnin 2681 >> Turn in The Stones That Bind Us

--- Scholomance

	step
		.goto Tirisfal Glades,59.4,65.8
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alexi Barov|r
		.accept 5341 >> Accept Barov Family Fortune

	step
		.goto Eastern Plaguelands,81.4,59.8
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Betina Bigglezink|r
		.accept 5529 >> Accept Plagued Hatchlings

	step
		#sticky
		#label BarovFamilyFortune
		>>Complete the objectives for |cRXP_LOOT_Barov Family Fortune|r inside Scholomance
		.complete 5341,1 -- The Deed to Brill
		.complete 5341,2 -- The Deed to Caer Darrow
		.complete 5341,3 -- The Deed to Southshore
		.complete 5341,4 -- The Deed to Tarren Mill

	step
		#sticky
		#label PlaguedHatchlingsComplete
		>>Kill 20 |cRXP_ENEMY_Plagued Hatchlings|r inside Stratholme
		.mob Plagued Hatchling
		.complete 5529,1

--- Stratholme

	step
		#requires PlaguedHatchlingsComplete
		#requires BarovFamilyFortune
		.goto Western Plaguelands,65.6,75.4
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Artist Renfray|r
		.turnin 5846
		.accept 5848

	step	
		.goto Eastern Plaguelands,81.4,59.8
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Duke Nicholas Zverenhoff|r	   
		.accept 5251

	step
		#sticky
		#label Stratholme1
		>>Kill |cRXP_ENEMY_Archivist Galford|r inside Stratholme and
		>>Burn the Archives
		.mob Archivist Galford
		.complete 5251,1
		.complete 5251,2

	step
		#sticky
		#label Stratholme2
		>>Go inside Stratholme for the painting |cRXP_LOOT_Of Love and Family|r
		.complete 5848,1

	step
		#requires Stratholme1
		#requires Stratholme2
		.goto Eastern Plaguelands,81.4,59.8
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Duke Nicholas Zverenhoff|r	   
		.turnin 5251

	step
		#sticky
		#label Stratholme3
		>>Kill |cRXP_ENEMY_Balnazzar|r inside Stratholme for |cRXP_LOOT_Head of Balnazzar|r
		.mob Balnazzar
		.use 13250
		.accept 5262 >>Accept The Truth Comes Crashing Down

	step
		#requires Stratholme3
		.goto Eastern Plaguelands,81.4,59.8
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Duke Nicholas Zverenhoff|r	   
		.turnin 5262
		.accept 5263

	step	
		.goto Eastern Plaguelands,80.6,58.0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Smokey LaRue|r	
		.accept 5214

	step	
		.goto Eastern Plaguelands,81.5,59.6
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Betina Bigglezink|r	
		.accept 5212	

	step	
		.goto Eastern Plaguelands,26.6,74.8
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nathanos Blightcaller|r
		.accept 6163	

	step
		#completewith StratholmeLast
		>>Kill |cRXP_ENEMY_Ramstein|r inside Stratholme for |cRXP_LOOT_Head of Ramstein the Gorger|r
		.mob Ramstein
		.complete 6163,1

	step
		#completewith StratholmeLast
		>>Kill |cRXP_ENEMY_Ezra Grimm|r inside Stratholme for |cRXP_LOOT_Grimm's Premium Tobacco|r
		.mob Ezra Grimm
		.complete 5214,1

	step
		#completewith StratholmeLast
		>>Kill |cRXP_ENEMY_any Undead|r inside Stratholme for |cRXP_LOOT_Plagued Flesh Sample|r
		.complete 5212,1

	step
		#label StratholmeLast
		>>Kill |cRXP_ENEMY_Baron Rivendare|r inside Stratholme for |cRXP_LOOT_Head of Baron Rivendare|r
		.mob Baron Rivendare
		.complete 5262,1

]])

