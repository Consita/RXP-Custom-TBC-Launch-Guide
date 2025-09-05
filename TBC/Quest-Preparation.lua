RXPGuides.RegisterGuide([[
#classic
#version 3
#group Consita Classic/TBC Launch Guide
#subgroup 2 - Preparation
#name 1-Quest Preparation
#displayname Quest Preparation
#next 2-Item Preparation

-- |cRXP_FRIENDLY_, |cRXP_ENEMY_, |cRXP_LOOT_, |cRXP_WARN_, |cRXP_PICK_, |cRXP_BUY_
-- |c99ffff99 OR|r
-- |Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk

--- Tanaris

	step
		#completewith next
		.zone Tanaris >>Travel to |cFFfa9602Tanaris|r
		.zoneskip Tanaris

	step
		.goto Tanaris,67.00,22.40
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Yeh'kinya|r
		.accept 3520 >> Accept Screecher Spirits
		.target Yeh'kinya

--- UnGoro

	step
		#completewith next
		.goto Tanaris,51.60,25.50
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bulkrek|r
		.fly Un'Goro Crater>>Fly to Un'Goro Crater
		.target Bulkrek Ragefist
		.zoneskip Un'Goro Crater

	step
		.goto Un'Goro Crater,45.53,8.72
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Larion|r
		.accept 4145 >>Accept Larion and Muigin
		.target Larion

	step
		#completewith ungorotrash		
		>>Collect |cRXP_LOOT_Bloodpetal Sprout|r from |cRXP_PICK_Bloodpetal Sprout|r. This is needed for the turn in guide.
		.collect 11315,1

	step
		#completewith ungorotrash	
		>>Collect |cRXP_LOOT_Un'Goro Soil|r from mobs or |cRXP_PICK_Un'Goro Dirt Piles|r
		.collect 11018,5 
		.isQuestAvailable 4496

	step
		#loop
		.goto Un'Goro Crater,57.60,36.80,0
		.goto Un'Goro Crater,57.60,36.80,60,0
		.goto Un'Goro Crater,64.40,30.80,60,0
		.goto Un'Goro Crater,68.20,24.00,60,0
		.goto Un'Goro Crater,71.20,31.00,60,0
		.goto Un'Goro Crater,74.20,39.60,60,0
		.goto Un'Goro Crater,76.00,47.40,60,0
		.goto Un'Goro Crater,74.20,39.60,60,0
		.goto Un'Goro Crater,69.40,38.00,60,0
		.goto Un'Goro Crater,66.60,35.60,60,0
		.goto Un'Goro Crater,60.00,39.40,60,0
		>>Kill |cRXP_ENEMY_Bloodpetal Threshers|r, |cRXP_ENEMY_Bloodpetal Lashers|r and |cRXP_ENEMY_Bloodpetal Flayers|r
		>>|cRXP_WARN_Their poison deals high damage and they can disarm|r << Warrior/Rogue/Shaman
		>>|cRXP_WARN_Their poison deals high damage and drains mana|r << !Warrior !Rogue !Shaman
		.complete 4145,4 
		.mob +Bloodpetal Thresher
		.complete 4145,1 
		.mob +Bloodpetal Lasher
		.complete 4145,3 
		.mob +Bloodpetal Flayer

	step
		.goto Un'Goro Crater,35.49,43.91
		>>Kill |cRXP_ENEMY_Bloodpetal Trappers|r
		>>|cRXP_WARN_Their poison deals high damage, and they can cast entangling roots|r << Warrior/Rogue/Shaman
		>>|cRXP_WARN_Their poison deals high damage and drains mana. They can cast entangling roots|r << !Warrior !Rogue !Shaman
		.complete 4145,2 
		.mob Bloodpetal Trapper

	step
		#label ungorotrash
		.goto Un'Goro Crater,45.53,8.72
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Larion|r
		.turnin 4145 >>Turn in Larion and Muigin
		.accept 4147 >> Accept Marvon's Workshop
		.target Larion

--- Feralas

	step
		#completewith next
		.goto Un'Goro Crater,45.23,5.82
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gryfe|r
		.fly Feralas >>Fly to |cFFfa9602Feralas|r
		.target Gryfe
		.zoneskip Feralas

	step	
		.goto Feralas,74.90,42.50
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hadoken|r
		.accept 2862 >> Accept War on the Woodpaw
		.target Hadoken Swiftstrider

	step
		#loop
		.goto Feralas,58.39,51.88,0
		.goto Feralas,57.54,48.70,0
		.goto Feralas,55.74,46.71,0
		.goto Feralas,58.45,55.83,0
		.goto Feralas,58.39,51.88,80,0
		.goto Feralas,57.54,48.70,80,0
		.goto Feralas,55.74,46.71,80,0
		.goto Feralas,58.45,55.83,80,0
		.goto Feralas,56.70,56.13,80,0
		.use 10699 >>Kill |cRXP_ENEMY_Vale Screechers|r
		>>|cRXP_WARN_Use|r |T135474:0|t[Yeh'kinya's Bramble] |cRXP_WARN_on their corpses. Talk to the|r |cRXP_FRIENDLY_Screecher Spirit|r |cRXP_WARN_that appears|r
		.complete 3520,1 
		.unitscan Rogue Vale Screecher
		.unitscan Vale Screecher
		.target Screecher Spirit

	step
		#loop
		.goto Feralas,72.79,39.32,0
		.goto Feralas,72.79,39.32,60,0
		.goto Feralas,72.11,37.21,60,0
		.goto Feralas,73.18,36.29,60,0
		>>Kill |cRXP_ENEMY_Woodpaw Gnolls|r. Loot them for their |cRXP_LOOT_Manes|r
		>>|cRXP_ENEMY_Woodpaw Trappers|r |cRXP_WARN_cast|r |T132149:0|t[Net] |cRXP_WARN_which immobilizes movement for 10 seconds|r
		.complete 2862,1 
		.mob Woodpaw Mongrel
		.mob Woodpaw Trapper
		.mob Woodpaw Brute
		.mob Woodpaw Reaver
		.mob Woodpaw Mystic
		.mob Woodpaw Alpha	
		
	step
		.goto Feralas,74.90,42.46
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hadoken|r
		.turnin 2862 >> Turn in War on the Woodpaw
		.accept 2863 >> Accept Alpha Strike
		.target Hadoken Swiftstrider		

	step
		#loop
		.goto Feralas,69.05,55.78,0
		.goto Feralas,68.60,54.25,0
		.goto Feralas,71.51,55.98,0
		.goto Feralas,72.42,56.63,0
		.goto Feralas,73.21,56.25,0
		.goto Feralas,69.05,55.78,50,0
		.goto Feralas,68.60,54.25,50,0
		.goto Feralas,71.51,55.98,50,0
		.goto Feralas,72.42,56.63,50,0
		.goto Feralas,73.21,56.25,50,0
		.goto Feralas,72.42,56.63,50,0
		.goto Feralas,71.51,55.98,50,0
		.goto Feralas,68.60,54.25,50,0
		>>Kill |cRXP_ENEMY_Woodpaw Alphas|r within the allotted time
		>>|cRXP_WARN_There's usually one in each camp|r
		>>|cRXP_WARN_This is a timed quest (1hour). Re-accept the quest if you failed it|r
		.complete 2863,1 
		.unitscan Woodpaw Alpha

	step
		.goto Feralas,74.90,42.50
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hadoken|r
		.turnin 2863 >> Turn in Alpha Strike
		.accept 2902 >> Accept Woodpaw Investigation
		.target Hadoken Swiftstrider	

	step
		.goto Feralas,71.60,55.90
		>>Click on the |cRXP_PICK_Woodpaw Battle Map|r, on top of a crate
		.turnin 2902 >> Turn in Woodpaw Investigation
		.accept 2903 >> Accept The Battle Plans

	step
		.goto Feralas,74.90,42.40
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hadoken|r
		.turnin 2903 >> Turn in The Battle Plans
		.accept 7730 >> Accept Zukk'ash Infestation
		.accept 7731 >> Accept Stinglasher
		.target Hadoken Swiftstrider		

	step
		#completewith next
		.goto Feralas,73.38,62.94,0
		>>Kill |cRXP_ENEMY_Zukk'ash Silithid|r. Loot them for their |cRXP_LOOT_Carapace|r
		.complete 7730,1 
		.mob Zukk'ash Worker
		.mob Zukk'ash Wasp
		.mob Zukk'ash Tunneler
		.mob Zukk'ash Stinger

	step
		#loop
		.goto Feralas,73.38,63.24,0
		.goto Feralas,76.36,61.19,0
		.goto Feralas,73.38,63.24,50,0
		.goto Feralas,76.36,61.19,50,0
		>>Kill |cRXP_ENEMY_Stinglasher|r. Loot it for its |cRXP_LOOT_Glands|r
		>>|cRXP_WARN_This mob can be quite hard make sure to have cooldowns available|r
		>>|cRXP_WARN_It patrols inside and outside of the Silithid Hives|r
		.complete 7731,1 
		.unitscan Stinglasher

	step
		#loop
		.goto Feralas,75.21,61.82,0
		.goto Feralas,75.21,61.82,60,0
		.goto Feralas,74.10,62.42,60,0
		.goto Feralas,72.86,62.78,60,0
		>>Kill |cRXP_ENEMY_Zukk'ash Silithid|r. Loot them for their |cRXP_LOOT_Carapace|r
		.complete 7730,1 
		.mob Zukk'ash Worker
		.mob Zukk'ash Wasp
		.mob Zukk'ash Tunneler
		.mob Zukk'ash Stinger

	step
		.goto Feralas,74.90,42.50
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hadoken|r
		.turnin 7730 >> Turn in Zukk'ash Infestation
		.turnin 7731 >> Turn in Stinglasher
		.accept 7732 >> Accept Zukk'ash Report
		.target Hadoken Swiftstrider

--- Azshara

	step
		#completewith next
		.goto Feralas,75.4,44.2
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shyn|r
		.fly Azshara >>Fly to |cFFfa9602Azshara|r
		.target Shyn
		.zoneskip Azshara

	step
		.goto Azshara,79.2,73.6,5,0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Duke Hydraxis|r
		.accept 6804
		.accept 6805
		.target Duke Hydraxis

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
		.hs >>Now is a good time to either use HS or buy a summon
		.use 6948
		.zone Orgrimmar >>Travel to |cFFfa9602Orgrimmar|r
		.zoneskip Orgrimmar

	step
		.goto Orgrimmar,56.50,46.60
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Zilzibin|r
		>>|cRXP_WARN_He is located on the upper level in the Drag|r
		.turnin 7732 >> Turn in Zukk'ash Report
		.accept 4494 >>Accept March of the Silithid
		.target Zilzibin Drumlore		

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

--- Ratchet

	step
		#completewith next
		.goto Orgrimmar,45.12,63.89,5,0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Doras|r
		.fly Ratchet >> Fly to |cFFfa9602Ratchet|r
		.target Doras
		.zoneskip The Barrens

	step
		.goto The Barrens,62.50,38.70
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Liv|r
		.turnin 4147 >>Turn in Marvon's Workshop
		.target Liv Rizzlefix
		.accept 4146 >>Accept Zapper Fuel

--- Tanaris

	step
		#completewith next
		.goto The Barrens,63.09,37.16
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bragok|r
		.fly Tanaris >> Fly to |cFFfa9602Tanaris|r
		.target Bragok
		.zoneskip Tanaris

	step
		.goto Tanaris,50.90,27.00
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pestlezugg|r
		.turnin 4494 >>Turn in March of the Silithid
		.accept 4496 >>Accept Bungle in the Jungle
		.target Alchemist Pestlezugg
		
	step
		.goto Tanaris,67.00,22.40
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Yeh'kinya|r
		.turnin 3520 >>Turn in Screecher Spirits
		.target Yeh'kinya
		.accept 3527 >> Accept The Prophecy of Mosh'aru

	step
		#completewith next
		>>Now you should be looking for a group to Zul'Farrak to complete |cRXP_LOOT_Accept The Prophecy of Mosh'aru|r. This can be done solo as a level 60
		.goto Tanaris,38.73,20.02 >> Travel to Zul'Farrak	
		.isOnQuest 3527	

	step
		>>Kill |cRXP_ENEMY_Theka the Martyr|r. Loot him for the |cRXP_LOOT_First Mosh'aru Tablet|r
		>>Kill |cRXP_ENEMY_Hydromancer Velratha|r. Loot her for the |cRXP_LOOT_Second Mosh'aru Tablet|r
		.complete 3527,1
		.complete 3527,2 
		.mob Theka the Martyr
		.mob Hydromancer Velratha

	step
		.goto Tanaris,66.989,22.354
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Yeh'kinya|r
		.turnin 3527 >> Turn in The Prophecy of Mosh'aru
		.target Yeh'kinya	
		.accept 4787 >> Accept The Ancient Egg

--- UnGoro

	step
		#completewith next
		.goto Tanaris,51.60,25.50
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bulkrek Ragefist|r
		.fly Un'Goro Crater >> Fly to |cFFfa9602Un'Goro Crater|r
		.target Bulkrek Ragefist
		.zoneskip Un'Goro Crater

	step
		#completewith ungorolast
		>>Collect |cRXP_LOOT_Un'Goro Soil|r from mobs or |cRXP_PICK_Un'Goro Dirt Piles|r
		.collect 11018,5 
		.isQuestAvailable 4496
	
	step
		#completewith ungorolast		
		>>Collect |cRXP_LOOT_Bloodpetal Sprout|r from |cRXP_PICK_Bloodpetal Sprout|r. This is needed for the turn in guide.
		.collect 11315,1 

	step
		.goto Un'Goro Crater,63.10,68.60
		>>Click the |cRXP_PICK_Wrecked Raft|r
		.accept 3844 >>Accept It's a Secret to Everybody

	step
		.goto Un'Goro Crater,63.10,69.00
		>>Go underwater, then click the |cRXP_PICK_Small Pack|r
		.turnin 3844 >>Turn in It's a Secret to Everybody
		.accept 3845 >>Accept It's a Secret to Everybody	

	step
		#loop
		.goto Un'Goro Crater,51.74,75.36,0
		.goto Un'Goro Crater,49.44,82.85,40,0
		.goto Un'Goro Crater,50.35,79.55,50,0
		.goto Un'Goro Crater,48.69,76.45,70,0
		.goto Un'Goro Crater,47.58,81.58,70,0
		.goto Un'Goro Crater,49.38,82.32,70,0
		.goto Un'Goro Crater,52.38,84.31,70,0
		.goto Un'Goro Crater,54.03,78.15,70,0
		.goto Un'Goro Crater,51.74,75.36,70,0
		>>Kill |cRXP_ENEMY_Gorishi Silithid|r. Loot them for a |cRXP_LOOT_Gorishi Scent Gland|r
		.complete 4496,1 
		.mob Gorishi Worker
		.mob Gorishi Wasp
		.mob Gorishi Reaver
		.mob Gorishi Tunneler
		.mob Gorishi Stinger
		.mob Gorishi Hive Guard

	step
		#completewith next
		.goto Un'Goro Crater,44.70,8.10
		.use 11107 >>Open |T133653:0|t[A Small Pack] for the following:
		.complete 3845,1 
		.complete 3845,2 
		.complete 3845,3 	

	step
		.goto Un'Goro Crater,44.70,8.10
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Linken|r
		.turnin 3845 >>Turn in It's a Secret to Everybody
		.accept 3908 >>Accept It's a Secret to Everybody
		.target Linken

	step
		#label ungorolast
		.destroy 11107 >>Destroy |T133653:0|t[A Small Pack]
		.destroy 3108 >>Destroy the |T135427:0|t[Heavy Throwing Daggers]
		.destroy 11108 >>Destroy the |T11108:0|t[Faded Photograph]	
		
	step
		>>Collect |cRXP_LOOT_Un'Goro Soil|r from mobs or |cRXP_PICK_Un'Goro Dirt Piles|r
		.collect 11018,5 
		.isQuestAvailable 4496

--- Silithus 1

	step
		#completewith next
		.goto Un'Goro Crater,45.23,5.82
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gryfe|r
		.fly Silithus >>Fly to |cFFfa9602Silithus|r
		.target Gryfe
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
		#completewith next
		>>Loot the blue |cRXP_PICK_Glowing Tablets|r on the ground for |cRXP_LOOT_Twilight Tablet Fragments|r
		.complete 8284,1
		.isOnQuest 6805

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
		>>Kill |cRXP_ENEMY_Dust Stormer|r and |cRXP_ENEMY_Desert Rumbler|r for |cRXP_LOOT_Stormers and Rumblers|r
		.mob Dust Stormer
		.mob Desert Rumbler
		.complete -6805,1
		.complete -6805,2
		
	step
		#label silithus1
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

	step
		.goto Silithus,49.7,37.5,5,0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Geologist Larksbane|r
		.target Geologist Larksbane
		.turnin 8284

		
--- Orgrimmar 2

	step
		#completewith next
		.goto Silithus,48.8,36.6
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Runk|r
		.fly Orgrimmar >>Fly to |cFFfa9602Orgrimmar|r
		.target Runk
		.zoneskip Orgrimmar
		
	step
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
		>>|cRXP_BUY_Collect the following items for the T0,5 questline:|r
		>>1x |T133001:0|t[Delicate Arcanite Converter]
		>>4x |T132864:0|t[Greater Eternal Essence]
		>>10x |T134848:0|t[Stonescale Oil]
		>>4x |T132621:0|t[Goblin Rocket Fuel] - Usually the 8 you get from the quest are enough but you might need more
		>>|cRXP_BUY_Collect the following items for the Scholomance key questline:|r
		>>2x |T133221:0|t[Thorium Bar]
		>>|cRXP_WARN_Buy them from the Auction House if possible|r
		.collect 16006,1,8921,1 --Delicate Arcanite Converter (x1)
		.collect 16203,4,8921,1 --Greater Eternal Essence (x4)
		.collect 13423,10,8921,1 --Stonescale Oil (x10)
		.collect 9061,4,8924,1 --Goblin Rocket Fuel (x4)
		.collect 12359,2,5802,1 --Thorium Bar (2x)

--- Tanaris 1

	step
		#completewith next
		.goto Orgrimmar,45.12,63.89,5,0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Doras|r
		.fly Tanaris >>Fly to |cFFfa9602Tanaris|r
		.target Doras
		.zoneskip Tanaris

	step
		.goto Tanaris,52.47,27.23,5,0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mux Manascrambler|r
		.target Mux Manascrambler
		.turnin 8923
		.accept 8921

	step
		.goto Tanaris,50.90,27.00
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pestlezugg|r
		.turnin 4496 >>Turn in Bungle in the Jungle
		.target Alchemist Pestlezugg

	step
		.goto Tanaris,66.989,22.354
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Yeh'kinya|r
		.target Yeh'kinya	
		.accept 4787 >> Accept The Ancient Egg

--- Burning Steppes

	step
		#completewith next
		.zone Burning Steppes >>Travel to |cFFfa9602Burning Steppes|r
		.zoneskip Burning Steppes

	step
		.goto Burning Steppes,65.2,24.0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tinkee Steamboil|r
		.accept 4726 >> Accept Broodling Essence
		.target Tinkee Steamboil
	
	step
		#completewith next
		>>Loot |cRXP_LOOT_Volcanic Ash|r on the ground
		>>|cRXP_WARN_They look like large piles of grey dirt and can be found in mainly in Northern Burning Steppes among the lava pools and rivers|r
		.collect 22338,25,8921,1 --Volcanic Ash (x25)


	step
		#loop
		.goto Burning Steppes,70.8,28.9,0
		.goto Burning Steppes,78.93,29.24,0
		.goto Burning Steppes,87.79,30.76,0
		.goto Burning Steppes,90.20,36.12,0
		.goto Burning Steppes,89.73,45.91,0
		.goto Burning Steppes,85.38.56.86,0
		.goto Burning Steppes,64.33,60.36,0
		.goto Burning Steppes,54.69,62.45,0
		.goto Burning Steppes,70.8,28.9,60,0
		.goto Burning Steppes,78.93,29.24,60,0
		.goto Burning Steppes,87.79,30.76,60,0
		.goto Burning Steppes,90.20,36.12,60,0
		.goto Burning Steppes,89.73,45.91,60,0
		.goto Burning Steppes,85.38.56.86,60,0
		.goto Burning Steppes,64.33,60.36,60,0
		.goto Burning Steppes,54.69,62.45,60,0
		.use 12284 >>Use |T133001:0|t[Draco-Incarcinatrix] 900 and Kill |cRXP_ENEMY_Broodlings|r in Burning Steppes
		.complete 4726,1

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

	step
		.goto Burning Steppes,65.2,24.0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tinkee Steamboil|r
		.turnin 4726 >> Accept Broodling Essence
		.target Tinkee Steamboil
		.accept 4808 >> Accept Felnok Steelspring

--- Hinterland

	step
		#completewith next
		.goto Burning Steppes,65.6,24.2
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Vahgruk|r
		.fly The Hinterlands >>Fly to |cFFfa9602The Hinterlands|r
		.target Vahgruk
		.zoneskip The Hinterlands

	step
		.goto The Hinterlands,57.60,86.79
		>>Loot the |cRXP_LOOT_Ancient Egg|r
		.complete 4787,1 
		
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
	
	step
		.destroy 22338 >>Destroy any extra |T133849:0|t[Volcanic Ash] you still have

	step
		.use 22320 >> Open |cRXP_LOOT_Mux's Quality Goods|r and keep the |T132621:0|t[Goblin Rocket Fuel] for later
		.collect 9061,8

	step
		.goto Tanaris,66.989,22.354
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Yeh'kinya|r
		.turnin 4787 >> Turn in The Ancient Egg
		.accept 3528 >> Accept The God Hakkar
		.target Yeh'kinya	

	step
		#completewith sunkentemple
		.subzone 1417 >> Now you should be looking for a group to Sunken Temple	

	step	
		#completewith next
		>>Kill |cRXP_ENEMY_Deep Lurkers|r, |cRXP_ENEMY_Murk Worms|r and |cRXP_ENEMY_Saturated Oozes|r. Loot them for their |cRXP_LOOT_Atal'ai Haze|r
		>>|cRXP_WARN_Take a right down the stairs at the beginning of the instance to find these mobs|r
		.complete 4146,1 
		.isOnQuest 4146	

	step
		>>|cRXP_WARN_Use the|r |T132834:0|t[Egg of Hakkar] |cRXP_WARN_while next to the Dragonflayer Skeleton, then complete the event|r
		>>Kill the minions of |cRXP_ENEMY_Hakkar|r until the |cRXP_ENEMY_Avatar of Hakkar|r joins
		>>Kill the |cRXP_ENEMY_Avatar of Hakkar|r. Loot it for the |T136148:0|t[|cRXP_LOOT_Essence of Hakkar|r]
		>>|cRXP_WARN_Use the|r |T136148:0|t[|cRXP_LOOT_Essence of Hakkar|r] |cRXP_WARN_to fill the|r |T132834:0|t[Egg of Hakkar]
		.collect 10663,1,3528,1 
		.disablecheckbox
		.complete 3528,1 
		.use 10465 
		.use 10663 
		.mob Avatar of Hakkar
		.isOnQuest 3528

	step
		#label sunkentemple
		>>Kill |cRXP_ENEMY_Deep Lurkers|r, |cRXP_ENEMY_Murk Worms|r and |cRXP_ENEMY_Saturated Oozes|r. Loot them for their |cRXP_LOOT_Atal'ai Haze|r
		>>|cRXP_ENEMY_Take a right down the stairs at the beginning of the instance to find these mobs|r
		.complete 4146,1 
		.isOnQuest 4146	

	step	
		#completewith next
		.zone Tanaris >>Travel to |cFFfa9602Tanaris|r
		.zoneskip Tanaris

	step
		.goto Tanaris,66.989,22.354
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Yeh'kinya|r
		.turnin 3528 >> Turn in The God Hakkar
		.target Yeh'kinya

	step
		.goto Tanaris,66.8,24.0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Prospector Ironboot|r
		.accept 5065
		.target Prospector Ironboot	

	step
		.goto Tanaris,50.90,27.00
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pestlezugg|r
		.target Alchemist Pestlezugg
		.accept 4507 >>Accept Pawn Captures Queen

--- Ungoro

	step
		#completewith next
		.goto Tanaris,51.60,25.50
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bulkrek|r
		.fly Un'Goro Crater>>Fly to |cFFfa9602Un'Goro Crater|r
		.target Bulkrek Ragefist
		.zoneskip Un'Goro Crater

	step
		.goto Un'Goro Crater,45.53,8.72
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Larion|r
		>>|cRXP_ENEMY_Warning:|r |cRXP_WARN_Do not pick up or complete the followup|r |cRXP_LOOT_Bloodpetal Zapper|r|cRXP_WARN_, as this is used for TBC|r
		.turnin 4146 >>Turn in Zapper Fuel
		.target Larion

	step
		.goto Un'Goro Crater,50.15,79.98,40,0
		.goto Un'Goro Crater,49.74,82.52,30,0
		.goto Un'Goro Crater,45.19,82.20,30,0
		.goto Un'Goro Crater,43.41,80.98
		>>Go deep into the silithid hive, until you reach a tall crystal in a round chamber
		.use 11833 >>Use your |T134809:0|t[Gorishi Queen Lure] to summon the |cRXP_ENEMY_Gorishi Hive Queen|r. Kill her, then loot her |cRXP_LOOT_Gorishi Queen Brain|r
		>>|cRXP_WARN_Proceed with caution, clear the room before summoning the queen, this quest is hard, you have to deal with 3 waves of 3 mobs. Remember to kill mobs outside the room so you can eat/drink after|r
		>>|cRXP_WARN_If you die you will have to abandon the quest and pick it up again in Tanaris|r
		.complete 4507,1 	

--- Silithus 2

	step
		#completewith next
		.goto Un'Goro Crater,45.23,5.82
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gryfe|r
		.fly Silithus >>Fly to |cFFfa9602Silithus|r
		.target Gryfe
		.zoneskip Silithus

	step
		.goto Silithus,48.6,37.9,5,0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Huum Wildmane|r
		.target Huum Wildmane
		.accept 8320

	step
		.goto Silithus,49.7,37.5,5,0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Geologist Larksbane|r
		.target Geologist Larksbane
		.accept 8285

	step
		.goto Silithus,49.20,34.30
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mar'alith|r
		.accept 8304
		.target Commander Mar'alith	

	step
		.goto Silithus,51.9,39.1,5,0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Calandrath|r
		.target Calandrath
		.accept 8307
		.skill cooking,<285,1

	step
		.goto Silithus,67,69.6
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
		.mob Twilight Keeper Havunth

	step	
		#label TwilightCook2
		.goto Silithus,38.0,45.3,5,0
		>>Interact with |cRXP_PICK_Sandy Cookbook|r
		.skipgossip
		.turnin -8307
		.accept 8313
		.skill cooking,<285,1

	step
		.goto Silithus,40.86,42.22
		>>Kill |cRXP_ENEMY_Twilight Keeper Havunth|r. Loot him for his |cRXP_LOOT_Twilight Lexicon Chapter|r
		>>He patrols the east side of the camp that's just southwest of Cenarion Hold
		>>|cRXP_WARN_Be careful, he has very high burst|r
		.complete 8279,3 
		.unitscan Twilight Keeper Havunth
		.mob Twilight Keeper Havunth


	step
		#requires TwilightCook
		#label TwilightLexicon
		.goto Silithus,26.34,36.62
		>>Kill |cRXP_ENEMY_Twilight Keeper Mayna|r. Loot her for her |cRXP_LOOT_Twilight Lexicon Chapter|r
		>>She patrols the camp far west of Cenarion Hold
		>>|cRXP_WARN_Be careful, she has Psychic Scream (instant fear)|r
		.complete 8279,1 
		.unitscan Twilight Keeper Mayna
		.mob Twilight Keeper Mayna

	step
		#requires TwilightCook
		#label TwilightLexicon3
		.goto Silithus,16.08,86.37
		>>Kill |cRXP_ENEMY_Twilight Keeper Exeter|r. Loot him for his |cRXP_LOOT_Twilight Lexicon Chapter|r
		>>He's at the back of the camp very far to the southwest of Cenarion Hold/northwest of Ahn'Qiraj
		>>|cRXP_WARN_Be careful, he has a stun and mortal strike|r
		.complete 8279,2 
		.unitscan Twilight Keeper Exeter
		.mob Twilight Keeper Exeter

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
		#completewith silithus2
		>> Keep an eye out for |T133463:0|t[|cRXP_LOOT_Brann Bronzebeard's Lost Letter|r] dropped by |cRXP_ENEMY_Hive'Ashi Drones|r. It is part of the TBC turn in.
		.collect 20461
	
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
		.goto Silithus,27.6,66.0,20,0
		.goto Silithus,37.3,62.5,0
		>>Interact with |cRXP_PICK_Hive'Zora Glyph|r
		.complete 8309,2
		.skipgossip	

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
		.goto Silithus,48.0,25.0,20,0
		.goto Silithus,50.0,26.0,0
		>>Interact with |cRXP_PICK_Hive'Ashi Glyph|r
		.complete 8309,1
		.skipgossip	

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

	step
		#label silithus2
		.goto Silithus,48.6,37.9
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Huum Wildmane|r
		.turnin 8320

	step
		.goto Silithus,51.9,39.1
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Calandrath|r
		.target Calandrath
		.turnin -8313		

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
		>>|cRXP_ENEMY_Warning:|r |cRXP_WARN_This quest is VERY HARD. Grouping up is highly recommended|r
		>>Kill |cRXP_ENEMY_Mistress Natalia Mar'alith|r for |cRXP_LOOT_Into The Maw of Madness|r
		.mob Mistress Natalia Mar'alith
		.complete 8306,1

	step
		.goto Silithus,55.0,87.0,20,0
		.goto Silithus,52.0,99.0,0
		>>Interact with |cRXP_PICK_Hive'Regal Glyph|r
		.complete 8309,3
		.skipgossip	

	step
		#label silithusglyph
		>>|cRXP_ENEMY_Warning:|r |cRXP_WARN_This quest is VERY HARD. Grouping up is highly recommended|r
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
		.turnin 8309
		.target Frankal Stonebridge
		.turnin 8310

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

--- Winterspring

	step
		#completewith next
		.goto Silithus,48.8,36.6
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Runk|r
		.fly Winterspring >>Fly to |cFFfa9602Winterspring|r
		.target Runk
		.zoneskip Winterspring

	step
		.goto Winterspring,31.269,45.164
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Donova Snowden|r
		.turnin 3908 >>Turn in It's a Secret to Everybody
		.accept 3909 >> Accept The Videre Elixir
		.target Donova Snowden

	step
		#loop
		.goto Winterspring,55.42,43.41,0
		.goto Winterspring,53.29,43.82,0
		.goto Winterspring,52.60,40.59,0
		.goto Winterspring,55.42,43.41,50,0
		.goto Winterspring,53.29,43.82,50,0
		.goto Winterspring,52.60,40.59,50,0
		>>Kill |cRXP_ENEMY_Suffering Highborne|r and |cRXP_ENEMY_Anguished Highborne|r. Loot them for their |cRXP_LOOT_Frozen Ectoplasms|r
		>>|cRXP_WARN_Pull them to the|r |T133882:0|t[Ectoplasmic Distiller] |cRXP_WARN_as you kill them|r
		.complete 8924,2 --Frozen Ectoplasm (x12)
		.mob Suffering Highborne
		.mob Anguished Highborne	

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

--- Feralas

	step
		#completewith next
		.goto Winterspring,60.4,36.4
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Yugrek|r
		.fly Feralas>>Fly to Feralas
		.target Yugrek
		.zoneskip Feralas

	step
		.goto Feralas,50.76,49.83,60,0
		.goto Feralas,45.12,25.56
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gregan|r
		>>|cRXP_BUY_Buy some|r |T134006:0|t[Bait] |cRXP_BUY_from him|r
		.collect 11141,1,3909,1 
		.target Gregan Brewspewer
		.isOnQuest 3909

	step
		.goto Feralas,44.60,10.19
		>>Give some bait to |cRXP_ENEMY_Miblon Snarltooth|r, who's guarding the |cRXP_LOOT_Evoroot|r. Loot the |cRXP_LOOT_Evoroot|r in the Ruins
		>>|cRXP_WARN_You can also get in from the backside of the building|r
		.collect 11242,1,3909,1 
		.unitscan Miblon Snarltooth
		.isOnQuest 3909

	step	
		.goto Feralas,45.12,25.56
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gregan Brewspewer|r
		.accept 4041 >> Accept The Videre Elixir
		.turnin 4041 >> Turn in The Videre Elixir
		.complete 3909,1 
		.target Gregan Brewspewer
		.isOnQuest 3909

--- Winterspring

	step
		#completewith next
		.goto Feralas,75.4,44.2
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shyn|r
		.fly Winterspring >>Fly to |cFFfa9602Winterspring|r
		.target Shyn
		.zoneskip Winterspring

	step
		.isQuestComplete 3909
		.goto Winterspring,31.269,45.164
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Donova Snowden|r
		.turnin 3909 >> Turn in The Videre Elixir
		.target Donova Snowden
		.accept 3912 >> Accept Meet at the Grave

	step
		#completewith FelElemRod
		.subzone 2256 >>Travel to Darkwhisper Gorge in |cFFfa9602Winterspring|r

	step
		#completewith next
		+|cRXP_WARN_Be careful! You will encounter level 60 mobs on the way to|r |cRXP_FRIENDLY_Vi'el|r|cRXP_WARN_. Avoid them as much as possible|r

	step
		#label FelElemRod
		.goto Winterspring,58.87,78.40
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Vi'el|r
		>>|cRXP_BUY_Buy a|r |T135155:0|t[|cRXP_LOOT_Fel Elemental Rod|r] |cRXP_BUY_from him|r
		>>|cRXP_WARN_This will cost 40 gold|r
		.collect 21939,1,8928,1 --Fel Elemental Rod (x1)
		.target Vi'el

--- Western Plaguelands

	step
		#completewith next
		.zone Tirisfal Glades >>Travel to |cFFfa9602Tirisfal Glades|r
		.zoneskip Tirisfal Glades

	step
		.goto Tirisfal Glades,83.1,68.9
		.target High Executor Derrington
		>>Talk to |cRXP_FRIENDLY_High Executor Derrington|r
		.accept 5096 >>Accept Scarlet Diversions
	
	step
		#completewith Scholomancefragments
		>>Kill |cRXP_ENEMY_Skeletons|r while doing the next quests for 15x |T133724:0|t[|cRXP_LOOT_Skeletal Fragments|r]
		.collect 14619,15

	step
		>> Be careful as the mobs are relatively difficult, and can chain-pull each other here
		>>Burn the command tent down, then use the banner in your inventory on top of it
		.goto Western Plaguelands,40.5,51.8
		.complete 5096,1 			

	step
		.goto Tirisfal Glades,83.1,68.9
		>>Talk to |cRXP_FRIENDLY_High Executor Derrington|r
		.turnin 5096 >>Turn in Scarlet Diversions
		.target High Executor Derrington
		.accept 5098 >>Accept All Along the Watchtowers
		.accept 5228 >>Accept The Scourge Cauldrons		

	step
		.goto Tirisfal Glades,83.03,71.91
		>>Talk to |cRXP_FRIENDLY_Shadow Priestess Vandis|r
		.turnin 5228 >>Turn in The Scourge Cauldrons
		.target Shadow Priestess Vandis
		.accept 5229 >>Accept Target: Felstone Field

	step
		>>Kill Cauldron Lord Bilemaw. Loot him for the key
		.goto Western Plaguelands,37.12,57.18
		.complete 5229,1 
		.unitscan Cauldron Lord Bilemaw

	step
		.goto Western Plaguelands,37.22,56.88
		.turnin 5229 >>Turn in Target: Felstone Field
		.accept 5230 >>Accept Return to the Bulwark

	step
		.goto Western Plaguelands,26.41,59.14
		>>Talk to |cRXP_FRIENDLY_Shadow Priestess Vandis|r
		.turnin 5230 >>Turn in Return to the Bulwark
		.target Shadow Priestess Vandis
		.accept 5231 >>Accept Target: Dalson's Tears

	step
		>>Kill Cauldron Lord Malvinous. Loot him for the key
		.goto Western Plaguelands,46.04,52.33
		.complete 5231,1 

	step
		.goto Western Plaguelands,46.19,52.01
		.turnin 5231 >>Turn in Target: Dalson's Tears
		.accept 5232 >>Accept Return to the Bulwark

	step
		>>Use the Beacon Torch in your bags on the side of the doorway (do NOT kill the elite inside)
		.goto Western Plaguelands,44.24,63.06
		.complete 5098,3 

	step
		.goto Western Plaguelands,26.40,59.14
		>>Talk to |cRXP_FRIENDLY_Shadow Priestess Vandis|r
		.turnin 5232 >>Turn in Return to the Bulwark
		.target Shadow Priestess Vandis
		.accept 5233 >>Accept Target: Writhing Haunt

	step
		>>Use the Beacon Torch in your bags on the side of the doorway (do NOT kill the elite inside)
		.goto Western Plaguelands,42.28,66.05
		.complete 5098,2 

	step
		>>Kill Cauldron Lord Razarch. Loot him for the key
		.goto Western Plaguelands,53.07,65.97
		.complete 5233,1 

	step
		.goto Western Plaguelands,53.05,65.71
		.turnin 5233 >>Turn in Target: Writhing Haunt
		.accept 5234 >>Accept Return to the Bulwark

	step
		>>Use the Beacon Torch in your bags on the side of the doorway (do NOT kill the elite inside)
		.goto Western Plaguelands,40.15,71.50
		.complete 5098,1 	

	step
		.goto Western Plaguelands,26.40,59.15
		>>Talk to |cRXP_FRIENDLY_Shadow Priestess Vandis|r
		.turnin 5234 >>Turn in Return to the Bulwark
		.target Shadow Priestess Vandis
		.accept 5235 >>Accept Target: Gahrron's Withering

	step
		>>Use the Beacon Torch in your bags on the side of the doorway (do NOT kill the elite inside)
		.goto Western Plaguelands,46.73,71.14
		.complete 5098,4 		

	step
		>>Kill Cauldron Lord Soulwraith. Loot him for the key
		.goto Western Plaguelands,62.80,58.76
		.complete 5235,1 

	step
		.goto Western Plaguelands,62.59,58.55
		.turnin 5235 >>Turn in Target: Gahrron's Withering

--- Eastern Plaguelands

	step
		.goto Western Plaguelands,67.33,24.23
		.target Tirion Fordring
		>>Talk to |cRXP_FRIENDLY_Tirion Fordring|r
		.accept 5542 >>Accept Demon Dogs
		.accept 5543 >>Accept Blood Tinged Skies
		.accept 5544 >>Accept Carrion Grubbage

	step
		#completewith WormMeat
		>>Kill |cRXP_ENEMY_Carrion Worms|r. Loot them for their |cRXP_LOOT_Meat|r
		.complete 5544,1 
		.mob Carrion Worm
		.mob Carrion Devourer

	step
		#completewith Pamela
		>>Kill |cRXP_ENEMY_Plaguebats|r and |cRXP_ENEMY_Plaguehound Runts|r
		.complete 5543,1 
		.mob +Plaguebat
		.complete 5542,1 
		.mob +Plaguehound Runt
				
	step
		.goto Eastern Plaguelands,26.54,74.74
		.target Nathanos Blightcaller
		>>Talk to |cRXP_FRIENDLY_Nathanos Blightcaller|r
		.accept 6042 >>Accept Un-Life's Little Annoyances
		.accept 6022 >>Accept To Kill With Purpose

	step	
		.goto Eastern Plaguelands,36.47,90.80
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pamela|r
		.turnin 5601 >>Turn in Sister Pamela
		.accept 5149 >>Accept Pamela's Doll
		.target Pamela Redpath

	step
		.goto Eastern Plaguelands,38.10,92.24
		>>Loot the 3 |cRXP_PICK_Doll Parts|r on the floor in ruined buildings
		>>|cRXP_WARN_Clicking the doll pieces can spawn a few|r |cRXP_ENEMY_Ghosts of the Past|r |cRXP_WARN_which have ice armor and frost shock|r
		.collect 12886,1,5149,1 
		.unitscan Ghost of the Past

	step
		.goto Eastern Plaguelands,39.64,92.51
		>>Loot the 3 |cRXP_PICK_Doll Parts|r on the floor in ruined buildings
		>>|cRXP_WARN_Clicking the doll pieces can spawn a few|r |cRXP_ENEMY_Ghosts of the Past|r |cRXP_WARN_which have ice armor and frost shock|r
		.collect 12887,1,5149,1 
		.unitscan Ghost of the Past

	step
		.goto Eastern Plaguelands,39.67,90.24
		>>Loot the 3 |cRXP_PICK_Doll Parts|r on the floor in ruined buildings
		>>|cRXP_WARN_Clicking the doll pieces can spawn a few|r |cRXP_ENEMY_Ghosts of the Past|r |cRXP_WARN_which have ice armor and frost shock|r
		.collect 12888,1,5149,1 
		.unitscan Ghost of the Past

	step
		.goto Eastern Plaguelands,36.47,90.80
		.use 12886 >>Click |T134164:0|t[Pamela's Doll's Head] to combine the three pieces
		.complete 5149,1 

	step
		#label Pamela
		.goto Eastern Plaguelands,36.47,90.80
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pamela|r
		.turnin 5149 >>Turn in Pamela's Doll
		.accept 5152 >>Accept Auntie Marlene
		.accept 5241 >>Accept Uncle Carlin
		.target Pamela Redpath

	step
		#loop
		.goto Eastern Plaguelands,34.16,82.21,0
		.goto Eastern Plaguelands,40.09,82.83,70,0
		.goto Eastern Plaguelands,43.06,82.47,70,0
		.goto Eastern Plaguelands,43.97,74.96,70,0
		.goto Eastern Plaguelands,36.35,69.28,70,0
		.goto Eastern Plaguelands,30.46,70.17,70,0
		.goto Eastern Plaguelands,19.69,68.12,70,0
		.goto Eastern Plaguelands,18.24,77.03,70,0
		.goto Eastern Plaguelands,24.94,70.55,70,0
		.goto Eastern Plaguelands,31.20,72.10,70,0
		.goto Eastern Plaguelands,34.16,82.21,70,0
		>>Kill |cRXP_ENEMY_Plaguebats|r and |cRXP_ENEMY_Plaguehound Runts|r
		.complete 5543,1 
		.mob +Plaguebat
		.complete 5542,1 
		.mob +Plaguehound Runt
		step
		#completewith next
		>>Kill |cRXP_ENEMY_Plaguehound|r and |cRXP_ENEMY_Noxious Plaguebats|r
		.complete 5542,2 
		.mob +Plaguehound
		.complete 6042,1 
		.mob +Noxious Plaguebat

	step
		#completewith RottingUndead
		.subzone 2264 >> Travel to Corrin's Crossing

	step
		#completewith next
		>>Kill |cRXP_ENEMY_Undead|r. Loot them for their |cRXP_LOOT_Living Rot|r.
		>>|cRXP_WARN_Groups of elites patrol the north and east road. Invisible mobs patrol inside of Corrin's Crossing, so try to pull mobs out|r
		.collect 15447,7 
		.mob Hate Shrieker
		.mob Scourge Warder
		.mob Stitched Horror
		.mob Gibbering Ghoul
		.mob Unseen Servant
		.mob Dark Caster

	step
		#label RottingUndead
		#loop
		.goto Eastern Plaguelands,58.20,70.20,0
		.goto Eastern Plaguelands,58.20,70.20,25,0
		.goto Eastern Plaguelands,60.40,71.60,25,0
		.goto Eastern Plaguelands,61.00,69.40,25,0
		.goto Eastern Plaguelands,61.40,66.40,25,0
		.goto Eastern Plaguelands,59.40,66.40,25,0
		.goto Eastern Plaguelands,58.00,67.60,25,0
		.use 15454 >>|cRXP_WARN_Use the|r |T133748:0|t[Mortar and Pestle] |cRXP_WARN_before the|r |cRXP_LOOT_Living Rot|r |cRXP_WARN_expires|r
		.complete 6022,1 

	step
		#loop
		.goto Eastern Plaguelands,77.94,69.64,0
		.goto Eastern Plaguelands,46.14,65.32,70,0
		.goto Eastern Plaguelands,49.24,61.48,70,0
		.goto Eastern Plaguelands,50.26,54.66,70,0
		.goto Eastern Plaguelands,55.24,54.72,70,0
		.goto Eastern Plaguelands,61.47,61.92,70,0
		.goto Eastern Plaguelands,65.18,70.17,70,0
		.goto Eastern Plaguelands,69.94,72.99,70,0
		.goto Eastern Plaguelands,72.99,75.98,70,0
		.goto Eastern Plaguelands,77.94,69.64,70,0
		>>Kill |cRXP_ENEMY_Plaguehound|r and |cRXP_ENEMY_Noxious Plaguebats|r
		.complete 5542,2 
		.mob +Plaguehound
		.complete 6042,1 
		.mob +Noxious Plaguebat

	step
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nicholas|r and |cRXP_FRIENDLY_Carlin|r
		.target +Duke Nicholas Zverenhoff
		.goto Eastern Plaguelands,81.44,59.81
		.turnin 5241 >>Turn in Uncle Carlin
		.accept 5211 >>Accept Defenders of Darrowshire
		.target +Carlin Redpath
		.goto Eastern Plaguelands,81.51,59.77

	step
		#sticky
		#completewith LostSymbol
		.goto Eastern Plaguelands,77.11,48.00,0
		.goto Eastern Plaguelands,67.30,40.67,0
		.goto Eastern Plaguelands,26.48,37.58,0
		>>Kill |cRXP_ENEMY_Diseased Flayers|r and |cRXP_ENEMY_Gibbering Ghouls|r
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to the |cRXP_FRIENDLY_Darrowshire Spirits|r that appear over their corpses
		>>|cRXP_WARN_These mobs share spawns with a few mob types, so kill everything after all the ghouls have died|r
		.complete 5211,1 
		.unitscan Diseased Flayer;Gibbering Ghoul;Cannibal Ghoul
		.skipgossip

	step
		#label WormMeat
		#loop
		.goto Eastern Plaguelands,51.18,39.91,0
		.goto Eastern Plaguelands,69.73,50.55,70,0
		.goto Eastern Plaguelands,70.42,43.50,70,0
		.goto Eastern Plaguelands,70.34,38.47,70,0
		.goto Eastern Plaguelands,67.02,34.41,70,0
		.goto Eastern Plaguelands,62.69,34.72,70,0
		.goto Eastern Plaguelands,50.36,28.49,70,0
		.goto Eastern Plaguelands,51.18,39.91,70,0
		>>Kill |cRXP_ENEMY_Monstrous Plaguebats|r and |cRXP_ENEMY_Frenzied Plaguehounds|r
		>>|cRXP_WARN_Be careful as|r |cRXP_ENEMY_Monstrous Plaguebats|r |cRXP_WARN_can silence for 10 seconds in melee range|r << !Rogue !Warrior
		.complete 6042,2 
		.mob +Monstrous Plaguebat
		.complete 5542,3 
		.mob +Frenzied Plaguehound

	step
		#loop
		.goto Eastern Plaguelands,67.02,34.41,0
		.goto Eastern Plaguelands,69.73,50.55,70,0
		.goto Eastern Plaguelands,70.42,43.50,70,0
		.goto Eastern Plaguelands,70.34,38.47,70,0
		.goto Eastern Plaguelands,67.02,34.41,70,0
		.goto Eastern Plaguelands,62.69,34.72,70,0
		.goto Eastern Plaguelands,50.36,28.49,70,0
		.goto Eastern Plaguelands,51.18,39.91,70,0
		>>Kill |cRXP_ENEMY_Carrion Worms|r. Loot them for their |cRXP_LOOT_Meat|r
		.complete 5544,1 
		.mob Carrion Worm
		.mob Carrion Devourer

	step
		.goto Eastern Plaguelands,7.59,43.57
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tirion|r
		.turnin 5542 >>Turn in Demon Dogs
		.turnin 5543 >>Turn in Blood Tinged Skies
		.turnin 5544 >>Turn in Carrion Grubbage
		.accept 5742 >>Accept Redemption
		.target Tirion Fordring

	step
		.goto Eastern Plaguelands,7.59,43.57
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tirion|r
		>>|cRXP_WARN_Type /sit when listening to Tirion's Tale. You can be mounted when doing this|r
		.complete 5742,1 
		.turnin 5742 >>Turn in Redemption
		.accept 5781 >>Accept Of Forgotten Memories
		.target Tirion Fordring
		.skipgossip

	step
		.goto Eastern Plaguelands,26.55,74.72
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nathanos|r
		.accept 6133 >>Accept The Ranger Lord's Behest
		.turnin 6022 >>Turn in To Kill With Purpose
		.turnin 6042 >>Turn in Un-Life's Little Annoyances
		.target Nathanos Blightcaller

	step
		.goto Eastern Plaguelands,28.34,86.79
		>>Click the |cRXP_PICK_Loose Dirt Mound|r to summon |cRXP_ENEMY_Mercutio Filthgorger|r and 3 |cRXP_ENEMY_Crypt Robbers|r. Kill him, then loot him for his |cRXP_LOOT_Hammer|r
		>>|cRXP_WARN_This quest is very dangerous. The|r |cRXP_ENEMY_Crypt Robbers|r |cRXP_WARN_are unusual; they take a LONG time to reset and can re-leash on a split pull|r
		>>|cRXP_WARN_This quest is one of the hardest in the game. Skip it if you need to|r << !Mage !Warlock !Hunter !Rogue !Druid
		>>|cRXP_WARN_Split pull the pack that spawns with Blizzard. Kite|r |cRXP_ENEMY_Mercutio|r |cRXP_WARN_away until the other mobs break leash|r << Mage
		>>|cRXP_WARN_Split pull the pack that spawns with Rain of Fire. Kite|r |cRXP_ENEMY_Mercutio|r |cRXP_WARN_away until the other mobs break leash|r << Warlock
		>>|cRXP_WARN_Split pull the pack that spawns with Volley. Kite|r |cRXP_ENEMY_Mercutio|r |cRXP_WARN_away until the other mobs break leash|r << Hunter
		>>|cRXP_WARN_Stealth into the middle of the pack that spawns, then de-stealth, immediately aggroing all mobs at once. Keep refreshing leash on|r |cRXP_ENEMY_Mercutio|r |cRXP_WARN_whilst sprinting away from the other mobs|r << Rogue
		>>|cRXP_WARN_Stealth into the middle of the pack that spawns, then de-stealth, immediately aggroing all mobs at once. Keep refreshing leash on|r |cRXP_ENEMY_Mercutio|r |cRXP_WARN_whilst dashing away from the other mobs|r << Druid
		.complete 5781,1 
		.mob Crypt Robber
		.unitscan Mercutio Filthgorger

	step
		.goto Eastern Plaguelands,7.59,43.57
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tirion|r
		.turnin 5781 >>Turn in Of Forgotten Memories
		.accept 5845 >>Accept Of Lost Honor
		.target Tirion Fordring
		.isQuestComplete 5781

	step
		.goto Western Plaguelands,49.2,78.6
		>>Talk to |cRXP_FRIENDLY_Marlene Redpath|r
		.turnin 5152 >> Turn in Auntie Marlene
		.target Marlene Redpath
		.accept 5153 >> Accept A Strange Historian

	step
		.goto Western Plaguelands,49.6,76.8
		>>Loot the gravestone right outside the house
		.complete 5153,1 

	step
		>>Go into the Inn. Try to avoid mobs en route
		.goto Western Plaguelands,39.5,66.9
		>>Talk to |cRXP_FRIENDLY_Chromie|r
		.turnin 5153 >> Turn in A Strange Historian
		.target Chromie
		.accept 5154 >> Accept The Annals of Darrowshire

	step
		.goto Western Plaguelands,43.4,69.6
		>>Loot books inside the Andorhal town hall until you get the correct one
		.complete 5154,1 
		*The correct book's pages has a lighter shade of grey on BOTH pages and sometimes the correct book won't spawn
		*If you're unlucky, you have to keep looting bad tomes until a good one spawns

	step
		.goto Western Plaguelands,39.5,66.8
		>>Talk to |cRXP_FRIENDLY_Chromie|r
		.turnin 5154 >> Turn in The Annals of Darrowshire
		.target Chromie
		.accept 5210 >> Accept Brother Carlin

	step
		.goto Eastern Plaguelands,81.5,59.8
		>>Talk to |cRXP_FRIENDLY_Carlin Redpath|r
		.turnin 5210 >> Turn in Brother Carlin
		.target Carlin Redpath
		.accept 5181 >> Accept Villains of Darrowshire
		.accept 5168 >> Accept Heroes of Darrowshire

	step
		#label LostSymbol
		.goto Eastern Plaguelands,71.30,33.97
		>>Loot the |cRXP_LOOT_Symbol of Lost Honor|r underwater
		.complete 5845,1 
		.isQuestTurnedIn 5781

	step
		.goto Eastern Plaguelands,60.6,68.4
		>>Kill ghouls and then talk to the Darrowshire spirits that spawn from their corpses
		.complete 5211,1

	step
		.goto Eastern Plaguelands,53.9,65.8
		.complete 5181,2 

	step
		.goto Eastern Plaguelands,7.6,43.6
		>>Talk to |cRXP_FRIENDLY_Tirion Fordring|r
		.turnin 5845 >> Turn in Of Lost Honor
		.target Tirion Fordring
		.accept 5846 >> Accept Of Love and Family

	step
		.goto Western Plaguelands,63.8,57.2
		>>Loot the shield on the ground, just outside the barn
		.complete 5168,2 

	step
		.goto Western Plaguelands,65.7,75.4
		.target Artist Renfray
		>>Talk to |cRXP_FRIENDLY_Artist Renfray|r
		.turnin 5846 >> Turn in Of Love and Family

	step
		.goto Western Plaguelands,42.5,18.9
		>>Loot the libram inside the town hall. Either slowly kill all the mobs one-by-one, or pull all of the mobs inside, kite them outside, freeze them in place, then loot the Libram and run
		>>do NOT die here or you have a very long run
		.complete 5168,1 

	step
		.goto Western Plaguelands,26.51,56.02
		>>Talk to |cRXP_FRIENDLY_High Executor Derrington|r
		.turnin 5098 >>Turn in All Along the Watchtowers
		.target High Executor Derrington
		.accept 838 >>Accept Scholomance
		.accept 105

	step
		#label Scholomancefragments
		.goto Western Plaguelands,26.67,56.33
		.target Apothecary Dithers
		>>Talk to |cRXP_FRIENDLY_Apothecary Dithers|r
		.turnin 838 >>Turn in Scholomance
		.accept 964
		.turnin 964	
		.accept 5514

	step
		.goto Eastern Plaguelands,81.5,59.8
		.target Carlin Redpath
		>>Talk to |cRXP_FRIENDLY_Carlin Redpath|r
		.turnin 5168 >> Turn in Heroes of Darrowshire
		.turnin 5181 >> Turn in Villains of Darrowshire
		.turnin 5211 >> Turn in Defenders of Darrowshire
		.accept 5206

	step
		#completewith next
		.goto Eastern Plaguelands,52.14,18.30,0
		>>Loot the |cRXP_LOOT_Quel'Thalas Registry|r on top of the bench
		.complete 6133,4 

	step
		#loop
		.goto Eastern Plaguelands,52.88,19.18,0
		.goto Eastern Plaguelands,51.75,21.66,40,0
		.goto Eastern Plaguelands,50.73,18.33,40,0
		.goto Eastern Plaguelands,50.89,16.50,40,0
		.goto Eastern Plaguelands,52.97,17.29,40,0
		.goto Eastern Plaguelands,52.88,19.18,40,0
		>>Kill |cRXP_ENEMY_Pathstriders|r, |cRXP_ENEMY_Rangers|r and |cRXP_ENEMY_Woodsmen|r
		>>|cRXP_WARN_These mobs hit very hard for non-elites|r << !Rogue !Druid
		>>|cRXP_WARN_These mobs hit very hard for non-elites; remember Pathstrider's Faerie Fire ability, in case you need to escape|r << Rogue/Druid
		.complete 6133,1 
		.mob +Pathstrider
		.complete 6133,2 
		.mob +Ranger
		.complete 6133,3 
		.mob +Woodsman

	step
		.goto Eastern Plaguelands,52.14,18.30
		>>Loot the |cRXP_LOOT_Quel'Thalas Registry|r on top of the bench
		.complete 6133,4 

	step
		#loop
		.goto Eastern Plaguelands,77.11,48.00,0
		.goto Eastern Plaguelands,67.30,40.67,0
		.goto Eastern Plaguelands,26.48,37.58,0
		.goto Eastern Plaguelands,68.20,40.80,60,0
		.goto Eastern Plaguelands,68.60,38.60,60,0
		.goto Eastern Plaguelands,66.00,36.00,60,0
		.goto Eastern Plaguelands,64.60,38.00,60,0
		.goto Eastern Plaguelands,65.40,41.20,60,0
		.goto Eastern Plaguelands,66.60,38.60,60,0
		.goto Eastern Plaguelands,68.20,40.80,60,0
		>>Kill |cRXP_ENEMY_Diseased Flayers|r and |cRXP_ENEMY_Gibbering Ghouls|r
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to the |cRXP_FRIENDLY_Darrowshire Spirits|r that appear over their corpses
		>>|cRXP_WARN_These mobs share spawns with a few mob types, so kill everything after all the ghouls have died|r
		.complete 5211,1 
		.unitscan Diseased Flayer;Gibbering Ghoul;Cannibal Ghoul
		.skipgossip

	step
		.goto Eastern Plaguelands,81.51,59.77
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Carlin|r
		.turnin 5211 >>Turn in Defenders of Darrowshire
		.target Carlin Redpath

	step
		.goto Eastern Plaguelands,26.55,74.72
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nathanos|r
		.turnin 6133 >>Turn in The Ranger Lord's Behest
		.target Nathanos Blightcaller
		.accept 6136
		.accept 6135

	step
		.loop 10,Eastern Plaguelands,17.2,72.2,18.6,73.0,19.8,73.8,20.2,70.4,20.8,75.4,21.4,70.0,21.4,76.4,22.0,76.8,22.8,77.6,23.0,77.4,23.8,69.4,24.0,70.4,24.0,78.4,24.0,78.6,24.8,78.2,25.2,79.2,25.4,67.8,25.4,68.6,25.4,70.0,25.4,71.8,25.6,66.6,25.6,79.4,25.8,74.4,25.8,79.6,26.0,76.8,26.2,70.4,26.4,69.0,26.4,74.6,26.6,68.2,26.6,74.6,26.6,75.8,26.8,70.4,27.0,71.8,27.0,79.8,27.2,72.8,27.2,73.6,27.2,78.2,27.4,69.0,27.6,61.4,27.6,68.2,27.6,80.6,27.8,68.8,27.8,76.6,27.8,79.0,28.0,69.6,28.0,71.4,28.0,74.6,28.0,79.6,28.2,64.0,28.2,64.8,28.2,66.2,28.2,72.2,28.2,73.4,28.2,75.6,28.4,62.8,28.4,73.8,28.6,71.2,28.6,74.8,28.6,78.0,28.8,62.2,28.8,62.6,29.0,66.8,29.0,69.2,29.0,69.6,29.0,74.4,29.0,77.2,29.0,79.0,29.2,64.6,29.2,76.0,29.2,80.0,29.2,80.6,29.4,64.4,29.4,66.0,29.4,68.4,29.4,72.2,29.4,73.4,29.6,79.4,29.8,64.6,29.8,65.8,29.8,77.2,29.8,77.6,30.0,63.4,30.0,69.4,30.2,70.2,30.2,73.0,30.2,80.4,30.4,64.2,30.4,66.6,30.4,68.4,30.4,71.2,30.4,72.4,30.4,74.0,30.4,75.0,30.4,75.6,30.4,81.4,30.6,64.4,30.6,64.6,30.6,70.2,30.6,71.2,30.6,73.4,30.8,69.2,30.8,73.6,30.8,76.2,30.8,76.6,31.0,75.0,31.0,77.6,31.2,72.2,31.2,79.0,31.4,66.4,31.4,66.6,31.4,67.6,31.4,80.2,31.6,63.6,31.6,66.2,31.6,67.0,31.6,70.0,31.6,71.8,31.6,73.4,31.6,80.6,31.8,65.4,31.8,68.4,32.0,68.6,32.0,71.4,32.0,76.4,32.0,80.4,32.2,74.2,32.2,75.0,32.4,76.8,32.4,77.8,32.4,78.8,32.6,66.4,32.6,67.0,32.6,68.0,32.6,69.6,32.6,74.8,32.6,76.6,32.8,71.4,32.8,74.0,32.8,75.8,32.8,78.6,32.8,80.2,32.8,80.6,33.0,68.8,33.0,73.4,33.2,72.2,33.2,78.4,33.6,64.8,33.6,72.2,33.6,73.8,33.6,74.8,33.8,72.8,34.0,67.8,34.0,71.2,34.0,77.2,34.0,77.6,34.0,78.6,34.2,65.8,34.2,68.6,34.2,75.6,34.4,70.2,34.4,79.8,34.6,71.6,34.6,73.6,34.6,77.2,34.6,80.0,34.8,67.2,34.8,71.2,35.2,66.4,35.2,73.0,35.2,78.0,35.4,68.2,35.4,69.4,35.4,70.4,35.4,75.2,35.4,76.2,35.4,79.4,35.6,70.8,35.8,68.0,35.8,69.4,35.8,74.2,36.2,73.0,36.2,78.4,36.4,66.6,36.4,70.2,36.4,72.4,36.4,75.2,36.4,76.0,36.4,79.4,36.4,79.6,36.6,75.0,36.8,68.4,36.8,78.6,36.8,79.8,37.0,70.4,37.0,71.0,37.0,76.0,37.2,67.0,37.2,69.4,37.2,71.6,37.2,72.8,37.2,73.6,37.4,77.2,37.4,77.8,37.6,70.2,37.6,71.4,37.6,72.6,37.6,75.0,37.6,76.4,37.6,77.8,37.8,67.2,37.8,69.0,37.8,74.2,38.0,81.4,38.2,71.6,38.4,63.6,38.4,68.2,38.4,79.4,38.4,79.6,38.6,69.4,38.6,71.2,38.8,67.6,38.8,79.6,38.8,84.6,39.0,72.8,39.0,74.4,39.2,74.8,39.4,70.2,39.4,71.8,39.6,72.6,39.8,68.2,39.8,69.4,39.8,72.0,40.0,67.4,40.0,70.2,40.0,70.6,40.0,79.6,40.6,70.8,40.8,69.2,40.8,69.8,41.0,71.6,41.2,65.4,41.2,72.6,41.2,73.8,41.4,65.8,41.4,66.8,41.4,68.4,41.4,75.4,41.4,79.6,41.6,79.6,41.8,66.4,41.8,68.6,41.8,72.0,42.0,70.0,42.0,70.6,42.2,67.4,42.2,68.2,42.4,72.8,42.4,75.2,42.6,69.6,42.6,72.2,42.6,79.2,42.8,68.4,42.8,68.6,42.8,74.4,42.8,75.6,43.4,65.8,43.4,66.6,43.6,71.6,43.6,79.4,43.8,64.4,43.8,67.6,43.8,69.0,44.0,67.2,44.2,65.0,44.2,66.0,44.2,73.6,44.6,65.4,44.6,67.0,44.8,81.2,45.0,66.0,45.0,67.6,45.6,67.2,45.6,68.2,45.8,66.0,46.0,65.4,46.0,69.8,46.2,64.0,46.4,69.0,46.6,68.8,46.8,70.2,47.0,68.4,47.4,65.4,47.8,64.8,48.6,43.8,48.6,76.0,48.8,71.6,49.2,59.2,50.2,59.0,52.0,74.4,53.6,57.6,54.2,56.6,57.4,71.4
		>>Kill |cRXP_ENEMY_Duskwing|r
		.mob Duskwing
		.complete 6135,1

	step
		.goto Eastern Plaguelands,62.8,80.4
		>>Use the |T134856:0|t[Aspect of Neptulon] on |cRXP_ENEMY_Plague Ravager|r and |cRXP_ENEMY_Blighted Surge|r, kill them and loot them for |T132606:0|t[Discordant Bracers]
		.use 17310
		.mob Plague Ravager
		.mob Blighted Surge
		.complete -6804,1

	step
		#loop
		.goto Eastern Plaguelands,79.6,56.8,20,0
		.goto Eastern Plaguelands,76.4,52.6,20,0
		.goto Eastern Plaguelands,78.6,45.6,20,0
		.goto Eastern Plaguelands,81.8,42.2,20,0
		.goto Eastern Plaguelands,86.8,44.6,20,0
		>>Kill |cRXP_ENEMY_Scourge Champion|r. Loot them for their |cRXP_LOOT_Fetid Skull|r
		>>They share spawn with the other mobs around, so kill everything if you can't find them
		.mob Scourge Champion
		.use 13156>>Use the |T134095:0|t[Mystic Crystal] to test the Fetid Skull and with a chance get |cRXP_LOOT_Resonating Skull|r
		.complete 5206,1

	step
		.goto Eastern Plaguelands,71.0,30.0
		>>Kill |cRXP_ENEMY_Eyeless Watcher|r and |cRXP_ENEMY_Death Singer|r. Loot them for their |cRXP_LOOT_Stable Ectoplasms|r
		>>|cRXP_WARN_Pull them to the|r |T133882:0|t[Ectoplasmic Distiller] |cRXP_WARN_as you kill them|r
		.complete 8924,3 --Stable Ectoplasm (x12)
		.mob Eyeless Watcher
		.mob Death Singer

	step
		.goto Eastern Plaguelands,72.7,15.7
		>>Loot the |cRXP_LOOT_Fourth Mosh'aru Tablet|r
		.complete 5065,2

	step
		.goto Eastern Plaguelands,72.5,12.9
		>>Loot the |cRXP_LOOT_Third Mosh'aru Tablet|r
		.complete 5065,1

	step
		.loop 10,Eastern Plaguelands,38.0,28.6,40.8,29.4,45.0,35.4,47.0,32.4,47.6,32.8,47.6,35.2,47.8,23.0,48.2,21.8,48.2,25.4,48.8,32.4,49.2,26.8,49.2,32.6,49.2,33.6,49.6,32.2,50.0,32.6,50.2,33.8,50.6,33.8,51.2,33.2,51.8,33.0,51.8,35.8,52.0,30.0,52.2,34.4,52.4,27.2,52.8,26.2,52.8,31.4,52.8,34.8,53.0,23.0,53.2,27.8,53.2,31.6,53.4,30.4,53.4,32.8,53.4,33.8,53.8,35.6,54.2,26.6,54.2,28.4,54.2,31.0,54.2,34.2,54.2,34.6,54.4,29.6,54.4,32.2,54.4,33.2,54.6,23.0,55.0,28.4,55.0,28.6,55.2,22.0,55.2,30.0,55.2,32.0,55.2,32.8,55.2,34.4,55.4,31.4,55.4,35.2,55.4,35.8,55.6,25.8,55.6,30.2,55.8,28.6,55.8,32.8,55.8,34.6,56.0,26.8,56.0,33.6,56.4,28.2,56.4,30.6,56.4,31.6,56.4,36.0,56.4,36.6,56.6,28.6,56.8,27.0,57.0,24.2,57.0,37.0,57.2,25.2,57.2,30.2,57.2,33.6,57.4,27.6,57.4,31.4,57.4,31.8,57.4,32.6,57.4,34.8,57.4,36.0,57.6,21.0,57.6,29.4,57.6,30.2,57.6,31.2,57.6,32.0,57.6,33.6,57.6,34.6,57.6,36.4,57.8,32.8,57.8,36.6,58.0,28.2,58.4,27.0,58.6,26.0,58.6,31.4,58.6,32.6,58.6,36.0,58.6,37.2,58.6,37.8,58.8,21.4,58.8,24.6,58.8,27.8,58.8,30.4,58.8,34.4,59.0,22.4,59.0,22.8,59.0,26.8,59.0,32.2,59.2,28.8,59.4,18.2,59.4,19.8,59.4,23.6,59.4,35.4,59.6,22.6,59.6,24.8,59.6,30.2,59.6,31.4,59.8,26.2,60.0,24.2,60.2,32.0,60.2,34.6,60.4,32.8,60.4,34.4,60.6,26.8,60.6,31.4,60.6,32.8,60.8,32.4,61.2,30.2,61.2,33.6,61.2,35.6,61.4,34.6,61.6,31.4,61.8,30.4,61.8,33.2,61.8,36.2,62.0,32.2,62.2,34.4,62.4,34.8,62.6,30.4,62.6,31.0,62.6,32.2,62.6,33.4,62.6,36.8,62.6,37.8,62.8,34.6,63.0,36.4,63.2,34.4,63.6,33.4,63.6,34.6,63.6,38.2,63.8,30.8,63.8,32.0,63.8,34.4,63.8,35.6,64.0,36.6,64.6,32.4,64.6,35.0,64.8,34.4,64.8,35.6,64.8,37.2
		>>Kill |cRXP_ENEMY_Borelgore|r
		.mob Borelgore
		.complete 6136,1

	step
		.goto Eastern Plaguelands,81.5,59.8
		>>Talk to |cRXP_FRIENDLY_Carlin Redpath|r
		.turnin 5206
		.target Carlin Redpath
		.accept 5941

	step
		.goto Eastern Plaguelands,26.54,74.74
		.target Nathanos Blightcaller
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nathanos Blightcaller|r
		.turnin 6136
		.turnin 6135
		.accept 6163

	step
		.goto Western Plaguelands,39.46,66.76
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Chromie|r on the top floor of the inn
		.turnin 5941
		.target Chromie	
		.accept 5721
		
	step
		.goto Eastern Plaguelands,39.0,91.2
		.use 15209 >>Use |T133639:0|t[Relic Bundle] at the Darrowshire Town Square to start the event
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Joseph Redpath|r after the event
		.target Joseph Redpath
		.skipgossip
		
--- Tanaris

	step
		#completewith next
		.zone Tanaris >>Travel to |cFFfa9602Tanaris|r
		.zoneskip Tanaris

	step
		.goto Tanaris,50.88,26.96
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pestlezugg|r
		.turnin 4507 >>Turn in Pawn Captures Queen
		.accept 4509 >>Accept Calm Before the Storm
		.target Alchemist Pestlezugg

	step
		.goto Tanaris,66.8,24.0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Prospector Ironboot|r
		.turnin 5065
		.accept 4788
		.target Prospector Ironboot	

	step
		.goto Tanaris,51.46,28.81
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krinkle Goodsteel|r
		>>|cRXP_WARN_Turning in this quest requires you to pay 15 Gold|r
		.turnin 5514 >>Turn in Mold Rhymes With...
		.accept 5802 >>Accept Fire Plume Forged
		.target Krinkle Goodsteel

	step
		.goto Tanaris,52.47,27.23
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mux Manascrambler|r
		.turnin 8924 >>Turn in Hunting for Ectoplasm
		.accept 8925 >>Accept A Portable Power Source
		.target Mux Manascrambler

	step
		.isOnQuest 3912
		#completewith next
		.goto Tanaris,53.99,28.63
		.cast 14050 >> |cRXP_WARN_Use the|r |T134813:0|t[Videre Elixir] |cRXP_WARN_at the Tanaris graveyard|r
		.use 11243 	
	
	step
		.isOnQuest 3912
		.goto Tanaris,53.93,23.33
		>>|cRXP_WARN_Ensure you bandage or eat food before leaving the graveyard|r
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gaeriyan|r
		>>|cRXP_WARN_You must have the |T132331:0|t[Near Death Experience] debuff to see|r |cRXP_FRIENDLY_Gaeriyan|r |cRXP_WARN_by drinking the|r |T134813:0|t[Videre Elixir]
		>>|cRXP_WARN_Blizzard has adjusted this quest so consuming this will NOT kill your character on Official Hardcore Servers|r
		.use 11243 
		.turnin 3912 >> Turn in Meet at the Grave
		.accept 3913 >> Accept A Grave Situation
		.target Gaeriyan	

	step
		.isQuestTurnedIn 3912
		.goto Tanaris,53.815,29.061
		>>Click the |cRXP_PICK_Conspicuous Gravestone|r
		.turnin 3913 >> Turn in A Grave Situation
		.accept 3914 >> Accept Linken's Sword

--- Ungoro		

	step
		#completewith next
		.goto Tanaris,51.60,25.50
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bulkrek|r
		.fly Un'Goro Crater>>Fly to Un'Goro Crater
		.target Bulkrek Ragefist
		.zoneskip Un'Goro Crater

	step
		#completewith next
		.goto Un'Goro Crater,49.62,47.56,100 >>Travel to the top of the mountain at Fire Plume Ridge

	step
		.goto Un'Goro Crater,49.28,47.04
		.use 14644 >>|cRXP_WARN_Use the|r |T134457:0|t[Skeleton Key Mold] |cRXP_WARN_at the pool of lava to create the|r |cRXP_LOOT_Unfinished Skeleton Key|r
		.complete 5802,1 --Unfinished Skeleton Key (1)

	step
		.isQuestTurnedIn 3912
		.goto Un'Goro Crater,44.658,8.098
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Linken|r
		.turnin 3914 >> Turn in Linken's Sword
		.accept 3941 >> Accept A Gnome's Assistance
		.target Linken	

	step
		.isQuestTurnedIn 3912
		.goto Un'Goro Crater,41.918,2.703
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_J.D. Collie|r
		.turnin 3941 >> Turn in A Gnome's Assistance
		.timer 25,A Gnome's Assistance RP
		.accept 3942 >> Accept Linken's Memory
		.target J.D. Collie

--- Felwood

	step
		#completewith next
		.goto Un'Goro Crater,45.23,5.82
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gryfe|r
		.fly Felwood >>Fly to |cFFfa9602Felwood|r
		.target Gryfe
		.zoneskip Felwood

	step
		.isQuestTurnedIn 3941
		.goto Felwood,51.350,81.511
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Eridan Bluewind|r
		.turnin 3942 >> Turn in Linken's Memory
		.accept 4084 >> Accept Silver Heart
		.target Eridan Bluewind

	step
		.isOnQuest 4084
		#completewith next
		>>Kill |cRXP_ENEMY_Bears|r and |cRXP_ENEMY_Wolves|r in Felwood. Loot them for their |cRXP_LOOT_Silvery Claws|r
		.complete 4084,1 
		.mob Angerclaw Bear
		.mob Angerclaw Mauler
		.mob Felpaw Wolf
		.mob Felpaw Scavenger

	step
		#loop
		.goto Felwood,49.60,30.00,0
		.goto Felwood,46.40,24.60,60,0
		.goto Felwood,49.20,19.80,60,0
		.goto Felwood,53.00,20.40,60,0
		.goto Felwood,52.00,24.80,60,0
		.goto Felwood,49.60,30.00,60,0
		>>Kill |cRXP_ENEMY_Irontree Stompers|r or |cRXP_ENEMY_Irontree Wanderers|r. Loot them for their |cRXP_LOOT_Irontree Heart|r
		.complete 4084,2 
		.mob Irontree Stomper
		.mob Irontree Wanderer

	step
		#loop
		.goto Felwood,63.27,19.15,0
		.goto Felwood,53.75,28.06,90,0
		.goto Felwood,58.03,17.83,90,0
		.goto Felwood,63.27,19.15,90,0
		>>Kill |cRXP_ENEMY_Bears|r and |cRXP_ENEMY_Wolves|r in Felwood. Loot them for their |cRXP_LOOT_Silvery Claws|r
		.complete 4084,1 
		.isOnQuest 4084
		.mob Angerclaw Bear
		.mob Angerclaw Mauler
		.mob Felpaw Wolf
		.mob Felpaw Scavenger

	step
		.isQuestTurnedIn 3912
		.goto Felwood,51.350,81.511
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Eridan Bluewind|r
		.turnin 4084 >> Turn in Silver Heart
		.accept 4005 >> Accept Aquementas
		.target Eridan Bluewind

--- Azshara

	step
		#completewith next
		.goto Tanaris,34.4,53.8
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brakkar|r
		.fly Azshara>>Fly to Azshara
		.target Brakkar
		.zoneskip Azshara

	step
		#completewith next
		.zone Azshara >>Travel to |cFFfa9602Azshara|r
		.zoneskip Azshara

	step
		.goto Azshara,79.2,73.6,5,0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Duke Hydraxis|r
		.turnin 6804
		.turnin 6805
		.accept 6821
		.target Duke Hydraxis

--- Back to Burning Steppes

	step
		#completewith next
		.hs >>Now is a good time to either use HS or buy a summon
		.use 6948
		.zone Burning Steppes >>Travel to |cFFfa9602Burning Steppes|r
		.zoneskip Burning Steppes

	step
		.goto Burning Steppes,58.2,49.4
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tinkee Steamboil|r
		.turnin 4810 >> Turn in Return to Tinkee
		.accept 4734 >> Accept Egg Freezing

	step
		.goto Burning Steppes,35.38,57.73
		>>Kill |cRXP_ENEMY_Magma Lord Bokk|r. Loot him for his |cRXP_LOOT_Magma Core|r
		.complete 8925,1 --Magma Core (x1)
		.mob Magma Lord Bokk

--- Tanaris

	step
		#completewith next
		.subzone 976 >>Travel to Gadgetzan in |cFFfa9602Tanaris|r
		.zoneskip Tanaris

	step
		.goto Tanaris,52.47,27.23
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mux Manascrambler|r
		.turnin 8925 >>Turn in A Portable Power Source
		.accept 8928 >>Accept A Shifty Merchant
		.target Mux Manascrambler
		.turnin 8928 >>Turn in A Shifty Merchant

	step
		.isQuestTurnedIn 4084
		.goto Tanaris,70.43,49.93
		>>Kill |cRXP_ENEMY_Aquementas|r
		.complete 4005,1 
		.use 11617 
		.use 11169 
		.mob Aquementas	

--- Ungoro

	step
		#completewith next
		.goto Tanaris,51.60,25.50
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bulkrek|r
		.fly Un'Goro Crater>>Fly to Un'Goro Crater
		.target Bulkrek Ragefist
		.zoneskip Un'Goro Crater

	step
		.isQuestTurnedIn 4084
		.goto Un'Goro Crater,41.918,2.703
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_J.D. Collie|r
		.turnin 4005 >> Turn in Aquementas

--- Western Plaguelands

	step
		#completewith next
		.zone Western Plaguelands >>Travel to |cFFfa9602Western Plaguelands|r
		.zoneskip Western Plaguelands

	step
		.goto Western Plaguelands,26.67,56.33
		.target Apothecary Dithers
		>>Talk to |cRXP_FRIENDLY_Apothecary Dithers|r
		.turnin 5802
		.accept 5804

	step
		.goto Western Plaguelands,46.5,69.5	
		>>Kill |cRXP_ENEMY_Alas, Andorhal|r. Open the |cRXP_PICK_Araj's Phylactery|r for |cRXP_LOOT_Araj's Phylactery Shard|r and |cRXP_LOOT_Araj's Scarab|r
		.complete 105,1
		.complete 5804,1

	step
		.goto Western Plaguelands,26.67,56.33
		.target Apothecary Dithers
		>>Talk to |cRXP_FRIENDLY_Apothecary Dithers|r
		.turnin 5804

--- Badlands

	step
		#completewith next
		.zone Badlands >>Travel to |cFFfa9602Badlands|r
		.zoneskip Badlands

	step
		#completewith KargathBRDQuests
		+You will now begin to collect quests for Blackrock Depths.
		>>Blackrock Depths is a very convoluted dungeon. In order to complete all quests in the most efficient way, it is required to leave the dungeon midrun to turn in/accept follow up quests so it may all be completed in 1 run.
		>>Try to ensure all party members have the same quests and prequests complete, along with 2-3 hours of playtime.
		>>There are additional quests included that you can skip. They will be marked as Optional

	step
		.goto Badlands,3.77,47.47
		>>Click the |cRXP_PICK_Wanted Poster|r
		.accept 4081 >> Accept KILL ON SIGHT: Dark Iron Dwarves

	step
		.goto Badlands,3.31,48.29
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thunderheart|r
		>>|cRXP_WARN_He may be patrolling around the mountain at Kargath. Find him or wait for him to return|r
		.accept 3906 >> Accept Disharmony of Flame
		.unitscan Thunderheart

	step
		.goto Badlands,2.90,47.76
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shadowmage Vivian Lagrave|r
		.accept 7201 >> Accept The Last Element
		.accept 4134 >> Accept Lost Thunderbrew Recipe
		.target Shadowmage Vivian Lagrave
		.isQuestTurnedIn 3906 

	step
		#label KargathBRDQuests
		.goto Badlands,3.03,47.80
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hierophant Theodora Mulvadania|r
		.accept 4061 >> Accept The Rise of the Machines
		.target Hierophant Theodora Mulvadania

	step
		.goto Badlands,3.98,44.76
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gorrik|r
		.fly Flame Crest >> Fly to Flame Crest
		.target Gorrik
		.zoneskip Burning Steppes

	step
		.goto Burning Steppes,65.152,23.911
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Maxwort Uberglint|r
		.accept 4123 >> Accept The Heart of the Mountain
		.target Maxwort Uberglint

	step	
		.goto Burning Steppes,66.058,21.951
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Yuka Screwspigot|r
		.accept 4136 >> Accept Ribbly Screwspigot
		.target Yuka Screwspigot

	step
		#loop
		.goto Burning Steppes,62.74,34.92,60,0
		.goto Burning Steppes,57.43,36.36,60,0
		.goto Burning Steppes,53.03,39.25,60,0
		.goto Burning Steppes,59.19,40.17,60,0
		.goto Burning Steppes,63.33,43.19,60,0
		.goto Burning Steppes,67.37,44.38,60,0
		>>Kill |cRXP_ENEMY_War Reavers|r. Loot them for their |cRXP_LOOT_Shards|r
		.complete 4061,1 
		.mob War Reaver

	step
		.goto Badlands,3.03,47.80
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hierophant Theodora Mulvadania|r
		.turnin 4061 >> Turn in The Rise of the Machines
		.target Hierophant Theodora Mulvadania
		.isQuestComplete 4061
		.accept 4062 >> Accept The Rise of the Machines

	step
		.goto Badlands,25.95,44.86
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lotwil Veriatus|r
		.turnin 4062 >> Turn in The Rise of the Machines
		.accept 4063 >> Accept The Rise of the Machines
		.target Lotwil Veriatus
		.isQuestTurnedIn 4061

	step
		#completewith CoreAttunement
		.subzone 25 >> Travel to Blackrock Mountain

	step
		>>|cRXP_WARN_OPTIONAL|r This step will grab the key quest for BRD to navigate within the dungeon easier
		+Die intentionally in the lava in Blackrock Mountain, ideally near the Molten Core entrance location
		>>For this step you must be a |T132331:0|t[Ghost] to talk to |cRXP_FRIENDLY_Franclorn Forgewright|r inside Blackrock Mountain. Resurrect at your corpse once you have the quest
		.goto 1415,48.624,64.186
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Franclorn Forgewright|r
		.accept 3801 >> Accept Dark Iron Legacy
		.turnin 3801 >> Turn in Dark Iron Legacy
		.accept 3802 >> Accept Dark Iron Legacy
		.target Franclorn Forgewright
		.isQuestAvailable 3801

	step
		>>|cRXP_WARN_OPTIONAL|r This step will grab the key quest for BRD to navigate within the dungeon easier
		+Die intentionally in the lava in Blackrock Mountain, ideally near the Molten Core entrance location
		>>For this step you must be a |T132331:0|t[Ghost] to talk to |cRXP_FRIENDLY_Franclorn Forgewright|r inside Blackrock Mountain. Resurrect at your corpse once you have the quest
		.goto 1415,48.624,64.186
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Franclorn Forgewright|r
		.accept 3801 >> Accept Dark Iron Legacy
		.turnin 3801 >> Turn in Dark Iron Legacy
		.accept 3802 >> Accept Dark Iron Legacy
		.target Franclorn Forgewright
		.isQuestAvailable 3802

	step
		#label CoreAttunement
		+|cRXP_WARN_OPTIONAL|r This step will grab the Molten Core attunement quest
		.goto 1415,48.409,63.815
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lothos Riftwaker|r
		.accept 7848 >> Accept Attunement to the Core
		.target Lothos Riftwaker

	step
		>>Kill |cRXP_ENEMY_Overmaster Pyron|r
		>>|cRXP_ENEMY_Overmaster Pyron|r |cRXP_WARN_patrols outside of the BRD instance portal|r
		.complete 3906,1 
		.mob Overmaster Pyron
		.isOnQuest 3906

	step
		#label EnterBRD1
		.subzone 1584 >>Enter the Blackrock Depths instance

	step
		>>Kill |cRXP_ENEMY_Anvilrage Dwarves|r
		.complete 4081,1 
		.mob +Anvilrage Guardsman
		.complete 4081,2 
		.mob +Anvilrage Warden
		.complete 4081,3 
		.mob +Anvilrage Footman
		.isOnQuest 4081

		step
		#completewith next
		+Travel back to Kargath

	step
		.goto Badlands,3.31,48.29
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thunderheart|r
		>>|cRXP_WARN_He may be patrolling around the mountain at Kargath. Find him or wait for him to return|r
		.turnin 3906 >> Turn in Disharmony of Flame
		.unitscan Thunderheart
		.isQuestComplete 3906

	step
		.goto Badlands,3.31,48.29
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thunderheart|r
		>>|cRXP_WARN_He may be patrolling around the mountain at Kargath. Find him or wait for him to return|r
		.accept 3907 >> Accept Disharmony of Fire
		.unitscan Thunderheart
		.isQuestTurnedIn 3906

	step
		.goto Badlands,3.03,47.80
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hierophant Theodora Mulvadania|r
		.turnin 4061 >> Turn in The Rise of the Machines
		.target Hierophant Theodora Mulvadania
		.isQuestComplete 4061

	step
		.goto Badlands,3.03,47.80
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hierophant Theodora Mulvadania|r
		.accept 4062 >> Accept The Rise of the Machines
		.target Hierophant Theodora Mulvadania
		.isQuestTurnedIn 4061

	step
		.goto Badlands,5.81,47.52
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Warlord Goretooth|r
		.turnin 4081 >> Turn in KILL ON SIGHT: Dark Iron Dwarves
		.target Warlord Goretooth
		.isQuestComplete 4081

	step
		.goto Badlands,5.96,47.73
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Galamav the Marksman|r on top of the tower
		.accept 3981 >> Accept Commander Gor'shak
		.target Galamav the Marksman
		.isQuestTurnedIn 3906

	step
		.goto Badlands,3.97,46.77
		>>Click the |cRXP_PICK_Wanted Poster|r
		.accept 4082 >> Accept KILL ON SIGHT: High Ranking Dark Iron Officials
		.isQuestTurnedIn 4081

	step
		.goto Badlands,25.95,44.86
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lotwil Veriatus|r
		.turnin 4062 >> Turn in The Rise of the Machines
		.accept 4063 >> Accept The Rise of the Machines
		.target Lotwil Veriatus
		.isQuestTurnedIn 4061

	step
		#label EnterBRD2
		.subzone 1584 >>Return to Blackrock Mountain and enter the Blackrock Depths instance

	step
		#completewith WhatsGoingOn
		>>Kill |cRXP_ENEMY_Fire Elementals|r and |cRXP_ENEMY_Golems|r. Loot them for their |cRXP_LOOT_Essence of the Elements|r
		>>|cRXP_WARN_This quest does not need to be completed now|r
		.complete 7201,1 
		.isOnQuest 7201

	step
		#completewith next
		+Complete the Ring of Law boss event, then take the exit up the tunnel and immediately turn right, crossing up over the top of the Ring of Law, making your way to the Vault

	step
		>>Loot |cRXP_LOOT_The Heart of the Mountain|r inside of the safe wall. It takes 15 seconds for it to respawn
		>>There is a trick which allows you to loot it without having to open the safe. View the link below to see how it is done
		.complete 4123,1 
		.link https://clips.twitch.tv/GenerousCarefulHerringNomNom-4BUCn6yI1dMozIkF >> Click here to see how to loot the Heart of the Mountain
		.isOnQuest 4123

	step
		>>Kill |cRXP_ENEMY_Fineous Darkvire|r. Loot him for the |cRXP_LOOT_Ironfel|r
		.complete 3802,1 
		.target Fineous Darkvire
		.isOnQuest 3802

	step
		>>Kill |cRXP_ENEMY_Lord Incendius|r
		.complete 3907,1 
		.target Lord Incendius
		.isOnQuest 3907

	step
		>>Run back near the location above the Ring of Law
		>>Click the |cRXP_PICK_Monument of Franclorn Forgewright|r
		.turnin 3802 >> Turn in Dark Iron Legacy
		.isQuestComplete 3802

	step
		#completewith next
		>>Kill |cRXP_ENEMY_Anvilrage Dwarves|r
		.complete 4082,1 
		.mob +Anvilrage Medic
		.complete 4082,2 
		.mob +Anvilrage Soldier
		.complete 4082,3 
		.mob +Anvilrage Officer
		.isOnQuest 4082

	step
		>>Head to the Shadowforge Gates at the start of the entrance
		>>Kill |cRXP_ENEMY_Bael'Gar|r
		.use 11231 >>|cRXP_WARN_Use the|r |T134430:0|t[Altered Black Dragonflight Molt] |cRXP_WARN_on his corpse|r
		.complete 4024,1 
		.mob Bael'Gar
		.isOnQuest 4024

	step
		>>Finish killing |cRXP_ENEMY_Anvilrage Dwarves|r
		.complete 4082,1 
		.mob +Anvilrage Medic
		.complete 4082,2 
		.mob +Anvilrage Soldier
		.complete 4082,3 
		.mob +Anvilrage Officer
		.isOnQuest 4082

	step
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Commander Gor'shak|r
		>>If your group does not have a Rogue you may need to kill |cRXP_ENEMY_High Interrogator Gerstahn|r for the |cRXP_LOOT_Prison Cell Key|r to open the doors
		>>|cRXP_WARN_ENSURE ALL PARTY MEMBERS HAVE AUTO ACCEPT OFF FOR THIS STEP! RestedXP HAS AUTO ACCEPT OFF FOR THIS STEP|r
		.turnin 3981 >> Turn in Commander Gor'shak
		.accept 3982,1 >> Accept What Is Going On?
		.target Commander Gor'shak

	step
		>>Defend |cRXP_FRIENDLY_Commander Gor'shak|r from the incoming |cRXP_ENEMY_Anvilrage Dwarves|r
		.complete 3982,1 
		.target Commander Gor'shak
		.isQuestTurnedIn 3981

	step
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Commander Gor'shak|r
		.turnin 3982 >> Turn in What Is Going On?
		.accept 4001 >> Accept What Is Going On?
		.target Commander Gor'shak
		.isQuestTurnedIn 3981

	step
		#label WhatsGoingOn
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kharan Mighthammer|r and listen to his story
		>>|cRXP_WARN_He is located accross the hall from|r |cRXP_FRIENDLY_Commander Gor'shak|r
		.complete 4001,1 
		.target Kharan Mighthammer
		.skipgossip
		.isQuestTurnedIn 3981

	step
		#completewith next
		+Hearth to Everlook and fly to Orgrimmar. If you have a mage, kindly ask for a portal to Orgrimmar instead

	step
		.goto Orgrimmar,31.74,37.82
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thrall|r
		.turnin 4001 >> Turn in What Is Going On?
		.accept 4002 >> Accept The Eastern Kingdoms
		.target Thrall
		.isQuestTurnedIn 3982

	step
		.goto Orgrimmar,31.74,37.82
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thrall|r again
		.complete 4002,1
		.target Thrall
		.isQuestTurnedIn 3982

	step
		.goto Orgrimmar,31.74,37.82
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thrall|r
		.turnin 4002 >> Turn in The Eastern Kingdoms
		.accept 4003 >> Accept The Royal Rescue
		.target Thrall
		.isQuestTurnedIn 3982

	step
		#completewith EnterBRD3
		+Hearth to Kargath if you put your hearthstone there. If you didn't, take the zeppelin to Stranglethorn and fly there instead

	step
		>>|cRXP_WARN_OPTIONAL|r This quest can be used for TBC turn in if you completed one of the other 25 already
		.goto Badlands,3.31,48.29
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thunderheart|r
		>>|cRXP_WARN_He may be patrolling around the mountain at Kargath. Find him or wait for him to return|r
		.turnin 3907 >> Turn in Disharmony of Fire
		.unitscan Thunderheart
		.isQuestComplete 3907

	step
		>>|cRXP_WARN_OPTIONAL|r This quest can be used for TBC turn in if you completed one of the other 25 already
		.goto Badlands,2.90,47.76
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shadowmage Vivian Lagrave|r
		.turnin 7201 >> Turn in The Last Element
		.target Shadowmage Vivian Lagrave
		.isQuestComplete 7201

	step
		.goto Badlands,5.81,47.52
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Warlord Goretooth|r
		.turnin 4082 >> Turn in KILL ON SIGHT: High Ranking Dark Iron Officials
		.target Warlord Goretooth
		.isQuestComplete 4082

	step
		.goto Badlands,5.8,47.6
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lexlort|r
		.accept 4122
		.target Lexlort

	step
		.goto Badlands,3.98,44.76
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gorrik|r
		.fly Flame Crest >> Fly to Flame Crest
		.target Gorrik
		.zoneskip Burning Steppes

	step
		.goto Burning Steppes,40.2,34.2
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Grark Lorkrub|r
		.turnin 4122
		.target Grark Lorkrub
		.accept 4121

	step
		>>Escort |cRXP_FRIENDLY_Grark Lorkrub|r into the Blackrock.
		.target Grark Lorkrub
		.complete 4121,1

	step
		.goto Badlands,5.8,47.6
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lexlort|r
		.turnin 4121
		.target Lexlort	

	step
		.goto Badlands,5.81,47.52
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Warlord Goretooth|r
		.accept 4132
		.target Warlord Goretooth

	step
		#label EnterBRD3
		.subzone 1584 >>Enter Blackrock Depths

	step
		#completewith PrincessSaved
		>>Kill |cRXP_ENEMY_Fire Elementals|r and |cRXP_ENEMY_Golems|r. Loot them for their |cRXP_LOOT_Essence of the Elements|r
		.complete 7201,1 
		.isOnQuest 7201

	step
		>>Kill |cRXP_ENEMY_General Angerforge|r.
		.complete 4132,1
		.mob +General Angerforge 

	step
		>>Kill |cRXP_ENEMY_Golem Lord Argelmach|r. Loot him for his |cRXP_LOOT_Head|r
		>>Kill |cRXP_ENEMY_Golems|r. Loot them for their |cRXP_LOOT_Elemental Cores|r
		.complete 4063,1 
		.mob +Golem Lord Argelmach
		.complete 4063,2 
		.mob +Wrath Hammer Construct

	step
		#completewith next
		>>Enter the Bar and go into the small room on the left. Do NOT attack any of the neutral mobs while running through the Bar
		>>Click on the 3 |cRXP_PICK_Thunderbrew Lager Kegs|r to destroy them, forcing |cRXP_ENEMY_Hurley Blackbreath|r and his 3 |cRXP_ENEMY_Blackbreath Cronies|r to engage
		>>Kill |cRXP_ENEMY_Hurley Blackbreath|r. Loot him for the |cRXP_LOOT_Lost Thunderbrew Recipe|r
		.complete 4134,1 
		.target Hurley Blackbreath
		.isOnQuest 4134

	step
		>>Enter the Bar and go into the small room on the left. Do NOT attack any of the neutral mobs while running through the Bar
		>>Kill |cRXP_ENEMY_Ribbly Screwspigot|r. Loot him for his |cRXP_LOOT_Head|r
		>>To engage |cRXP_ENEMY_Ribbly Screwspigot|r you have your tank talk to him, then bring him back along with his |cRXP_ENEMY_Cronies|r into the room with the kegs
		.complete 4136,1 
		.target Ribbly Screwspigot
		.skipgossip
		.isOnQuest 4136

	step
		>>Enter the Bar and go into the small room on the left. Do NOT attack any of the neutral mobs while running through the Bar
		>>Click on the 3 |cRXP_PICK_Thunderbrew Lager Kegs|r to destroy them, forcing |cRXP_ENEMY_Hurley Blackbreath|r and his 3 |cRXP_ENEMY_Blackbreath Cronies|r to engage
		>>Kill |cRXP_ENEMY_Hurley Blackbreath|r. Loot him for the |cRXP_LOOT_Lost Thunderbrew Recipe|r
		.complete 4134,1 
		.mob Hurley Blackbreath
		.isOnQuest 4134

	step
		>>Loot the |cRXP_LOOT_Core Fragment|r on the ground outside of the Molten Core instance portal
		.complete 7848,1 
		.isOnQuest 7848

	step
		>>Kill |cRXP_ENEMY_Emperor Dagran Thaurissan|r
		>>|cRXP_WARN_You must NOT kill |cRXP_ENEMY_Princess Moira Bronzebeard|r in order to complete and turn in this quest|r
		>>|cRXP_WARN_Have a party member kite |cRXP_ENEMY_Princess Moira Bronzebeard|r while the rest of the group kills|r |cRXP_ENEMY_Emperor Dagran Thaurissan|r
		.complete 4003,1 
		.mob Emperor Dagran Thaurissan
		.isOnQuest 4003

	step
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Princess Moira Bronzebeard|r
		.turnin 4003 >> Turn in The Royal Rescue
		.accept 4004 >> Accept The Princess Saved?
		.target Princess Moira Bronzebeard
		.isQuestComplete 4003

	step
		#label PrincessSaved
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Princess Moira Bronzebeard|r
		.accept 4004 >> Accept The Princess Saved?
		.target Princess Moira Bronzebeard
		.isQuestTurnedIn 4003

	step
		#completewith KargathTurnins
		+Hearth or travel back to Kargath

	step
		>>|cRXP_WARN_OPTIONAL|r This quest can be used for TBC turn in if you completed one of the other 25 already
		.goto Badlands,2.90,47.76
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shadowmage Vivian Lagrave|r
		.turnin 7201 >> Turn in The Last Element
		.target Shadowmage Vivian Lagrave
		.isQuestComplete 7201

	step
		.goto Badlands,3.98,44.76
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gorrik|r
		.fly Flame Crest >> Fly to Flame Crest
		.target Gorrik
		.zoneskip Burning Steppes

	step
		>>|cRXP_WARN_OPTIONAL|r This quest can be used for TBC turn in if you completed one of the other 25 already
		.goto Burning Steppes,66.058,21.951
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Yuka Screwspigot|r
		.turnin 4136 >> Turn in Ribbly Screwspigot
		.target Yuka Screwspigot
		.isQuestComplete 4136

	step
		#completewith KargathLBRSQuests
		+You will now begin to collect quests for Lower and Upper Blackrock Spire.
		>>Try to ensure all party members have the same quests and prequests complete, along with 2-3 hours of playtime.

	step
		.goto Burning Steppes,65.0,23.8
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ragged John|r
		.accept 4866	
		.target Ragged John	

	step
		.goto Burning Steppes,65.9,21.9
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kibler|r
		.accept 4729	
		.accept 4862
		.target Kibler

	step
		#completewith next
		.goto Burning Steppes,65.6,24.2
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Vahgruk|r
		.fly Badlands >> Fly to Badlands	
		.zoneskip Badlands

	step
		.goto Badlands,3.0,47.6
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shadowmage Vivian Lagrave|r
		.accept 4768
		.target Shadowmage Vivian Lagrave

	step
		#label KargathLBRSQuests
		.goto Badlands,5.8,47.6
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Galamav the Marksman|r. He is up on the Tower.
		.accept 4724
		.target Galamav the Marksman

--- UBRS

	step
		.goto 1415,48.409,63.815
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lothos Riftwaker|r
		>>|cRXP_WARN_You can either turn this in now or the next time you are in Blackrock Mountain|r
		.turnin 7848 >> Turn in Attunement to the Core
		.target Lothos Riftwaker
		.isQuestComplete 7848

	step
		#label
		.zone 1583 >>Enter the Upper Blackrock Spire dungeon

	step
		>>Kill |cRXP_ENEMY_Pyroguard Emberseer|r. Loot him for the |cRXP_LOOT_Eye of the Emberseer|r
		.mob Pyroguard Emberseer
		.complete 6821,1
		.isOnQuest 6821

	step		
		>>Complete the objective for |cRXP_LOOT_EggFreezing|r by freezing one of the eggs
		.complete 4734,1
		.isOnQuest 4734

	step
		>>Loot the |cRXP_LOOT_The Darkstone Tablet|r on the ground next to the eggs
		.complete 4768,1 
		.isOnQuest 4768

	step
		.goto Burning Steppes,65.2,24.0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tinkee Steamboil|r
		.turnin 4734
		.accept 4735
	
	step
		.zone 1583 >>Enter the Upper Blackrock Spire dungeon

	step
		>>Kill |cRXP_ENEMY_Pyroguard Emberseer|r. Loot him for the |cRXP_LOOT_Eye of the Emberseer|r
		.mob Pyroguard Emberseer
		.complete 6821,1
		.isOnQuest 6821

	step
		>>Loot the |cRXP_LOOT_The Darkstone Tablet|r on the ground next to the eggs
		.complete 4768,1 
		.isOnQuest 4768

	step		
		>>Complete the objective for |cRXP_LOOT_EggFreezing|r by freezing and looting 8 of the eggs
		.complete 4735,1
		.isOnQuest 4735

	step
		#completewith next
		+Make your way into the Lower Blackrock Spire dungeon
		
	step
		>>Loot the |cRXP_LOOT_Fifth Mosh'aru Tablet|r and |cRXP_LOOT_Sixth Mosh'aru Tablet|r
		>>The 5th tablet is in Shadow Hunter Vosh'Gajin's room
		>>The 6th tablet is in Warmaster Voone's room
		.complete 4788,1 
		.complete 4788,2
		.isOnQuest 4788

	step
		#completewith next
		>>This quest is one of the most annoying ones. You need to get sprayed by Mother Smolderweb and then run to Ragged John in Burning Steppes.
		>>The easiest would be to get a summon to Ragged John
		.complete 4866,1

	step
		.goto Burning Steppes,65.0,23.8
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ragged John|r
		.target Ragged John
		.skipgossip
	
	step
		>>Loot the |cRXP_LOOT_Spire Spider Eggs|r on the ground
		.complete 4862,1 
		.isOnQuest 4862

	step
		.use 12262 >>|cRXP_WARN_Use the|r |T132599:0|t[Empty Worg Pup Cage] on |cRXP_ENEMY_Bloodaxe Worg Pup|r
		.complete 4729,1 
		.isOnQuest 4729	
	
	step
		>>Kill |cRXP_ENEMY_Halycon|r
		.mob Halycon
		.complete 4724,1
		.isOnQuest 4724
		
--- Swamp of Sorrows

	step
		#completewith next
		.zone Swamp of Sorrows >>Travel to |cFFfa9602Swamp of Sorrows|r
		.zoneskip Swamp of Sorrows

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

--- Azshara

	step
		#completewith next
		.zone Azshara >>Travel to |cFFfa9602Azshara|r
		.zoneskip Azshara

	step
		.goto Azshara,79.2,73.6,5,0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Duke Hydraxis|r
		.turnin 6821
		.accept 6822
		.target Duke Hydraxis

--- ZG

	step
		#completewith next
		.zone Stranglethorn Vale >>Travel to |cFFfa9602Stranglethorn Vale|r
		.zoneskip Stranglethorn Vale

	step	
		.goto Stranglethorn Vale,15.2,15.6
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Exzhal|r
		.accept 8201	
		.isQuestAvailable 8201

--- Scholomance

	step
		#completewith next
		.zone Tirisfal Glades >>Travel to |cFFfa9602Tirisfal Glades|r
		.zoneskip Tirisfal Glades

	step
		.goto Tirisfal Glades,59.4,65.8
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alexi Barov|r
		.accept 5341 >> Accept Barov Family Fortune

	step
		.goto Eastern Plaguelands,81.4,59.8
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Betina Bigglezink|r
		.accept 5529 >> Accept Plagued Hatchlings

	step
		#completewith next
		#label BarovFamilyFortune
		>>Complete the objectives for |cRXP_LOOT_Barov Family Fortune|r inside Scholomance
		.complete 5341,1 -- The Deed to Brill
		.complete 5341,2 -- The Deed to Caer Darrow
		.complete 5341,3 -- The Deed to Southshore
		.complete 5341,4 -- The Deed to Tarren Mill

	step
		#label PlaguedHatchlingsComplete
		>>Kill 20 |cRXP_ENEMY_Plagued Hatchlings|r inside Scholomance
		.mob Plagued Hatchling
		.complete 5529,1

	step
		#label BarovFamilyFortune
		>>Complete the objectives for |cRXP_LOOT_Barov Family Fortune|r inside Scholomance
		.complete 5341,1 -- The Deed to Brill
		.complete 5341,2 -- The Deed to Caer Darrow
		.complete 5341,3 -- The Deed to Southshore
		.complete 5341,4 -- The Deed to Tarren Mill

--- Stratholme

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

