if RXPGuides == nil then
	return
end

RXPGuides.RegisterGuide([[
#classic
#version 3
#group Consita Classic/TBC Launch Guide
#subgroup 5 - TBC Launch Day
#name Group Turn-in

--- |cRXP_FRIENDLY_, |cRXP_ENEMY_, |cRXP_LOOT_, |cRXP_WARN_, |cRXP_PICK_, |cRXP_BUY_
--- |c99ffff99 OR|r
--- |Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk

	--- Start in Burning Steppes

		step
			#completewith next
			.zone Burning Steppes >> Travel to |cFFfa9602Burning Steppes|r
			.zoneskip Burning Steppes
					
		step
			.goto Burning Steppes,65.2,24.0
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tinkee Steamboil|r
			.turnin -4735
			.target Tinkee Steamboil

		step
			.goto Burning Steppes,65.2,24.0
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tinkee Steamboil|r
			.accept 5522
			.target Tinkee Steamboil	
			.isQuestComplete 4735
			
		step
			.goto Burning Steppes,65.0,23.8
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ragged John|r
			.turnin -4866	
			.target Ragged John	
			
		step
			.goto Burning Steppes,65.2,23.8
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Maxwort Uberglint|r
			.turnin -4123	
			.target Maxwort Uberglint		
			
		step
			.goto Burning Steppes,65.9,21.9
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kibler|r
			.turnin -4729	
			.turnin -4862
			.target Kibler
		
	--- Go to Badlands

		step	
			#completewith next
			.goto Burning Steppes,65.6,24.2
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Vahgruk|r
			.fly Badlands >> Fly to |cFFfa9602Badlands|r
			.zoneskip Badlands
			.target Vahgruk

		step
			.goto Badlands,3.0,47.6
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shadowmage Vivian Lagrave|r
			.turnin -4768
			.turnin -4134
			.target Shadowmage Vivian Lagrave

		step
			.goto Badlands,5.8,47.6
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Warlord Goretooth|r
			.turnin -4132
			.target Warlord Goretooth

		step
			.goto Badlands,5.8,47.6
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Galamav the Marksman|r. He is up on the Tower.
			.turnin -4724
			.target Galamav the Marksman

		step
			.goto Badlands,25.8,45.0
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lotwil Veriatus|r
			.turnin -4063
			.target Lotwil Veriatus

		step
			.goto Badlands,3.31,48.29
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thunderheart|r
			>>|cRXP_WARN_He may be patrolling around the mountain at Kargath. Find him or wait for him to return|r
			.turnin -3906 >> Accept Disharmony of Flame
			.target Thunderheart	

	--- Go to Silithus

		step
			#completewith next
			.zone Silithus >> Get summon to |cFFfa9602Silithus|r
			.zoneskip Silithus

		step
			.goto Silithus,81.87,18.93
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Layo|r
			.accept 1126 >>Accept Hive in the Tower
			.target Layo Starstrike

		step
			#label SilithidObject
			.goto Silithus,60.22,52.55
			>>Click on the |cRXP_PICK_Gooey Nest|r at the top of the tower
			>>Kill the two |cRXP_ENEMY_Hive'Ashi Ambushers|r that spawn on the top floor. Loot them for a |cRXP_LOOT_Encrusted Silithid Object|r
			>>|cRXP_WARN_Be careful! Three|r |cRXP_ENEMY_Hive'Ashi Drones|r |cRXP_WARN_will spawn when you enter the bottom floor of the tower!|r
			.complete 1126,1 
			.mob Hive'Ashi Drone
			.mob Hive'Ashi Ambusher
		
		step									
			.goto Silithus,67.0,69.6	
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hermit Ortell|r	
			.turnin -8279
			.target Hermit Ortell

		step									
			.goto Silithus,67.0,69.6	
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hermit Ortell|r	
			.accept 8323
			.turnin 8323
			.accept 8287
			.isQuestComplete 8279
			.itemcount 20404,10
			.target Hermit Ortell	

		step									
			.goto Silithus,67.0,69.6	
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hermit Ortell|r	
			.accept 8287
			.isQuestComplete 8279
			.target Hermit Ortell	
			
		step	
			.goto Silithus,40.8,88.6
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Frankal Stonebridge|r	
			.turnin -8310	
			.target Frankal Stonebridge
			
		step
			.use 20461
			.goto Silithus,41.2,88.4	
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rutgar Glyphshaper|r	
			.turnin -8308
			.itemcount 20461,1
			.target Rutgar Glyphshaper

		step
			.goto Silithus,41.2,88.4	
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rutgar Glyphshaper|r	
			.turnin -8309
			.turnin -8310
			.target Rutgar Glyphshaper

		step
			.isQuestComplete 8309
			.goto Silithus,41.2,88.4	
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rutgar Glyphshaper|r	
			.accept 8314
			.target Rutgar Glyphshaper

		step
			.goto Silithus,51.9,39.1,5,0
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Calandrath|r
			.target Calandrath
			.accept 8307
			.skill cooking,<285,1

		step	
			#label TwilightCook2
			.goto Silithus,38.0,45.3,5,0
			>>Interact with |cRXP_PICK_Sandy Cookbook|r
			.skipgossip
			.turnin -8307
			.accept 8313
			.skill cooking,<285,1

		step	
			.goto Silithus,49.6,36.6
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Baristolth of the Shifting Sands|r	
			.turnin -8288
			.target Baristolth of the Shifting Sands

		step	
			.goto Silithus,49.6,36.6
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Baristolth of the Shifting Sands|r	
			.accept 8301
			.turnin 8301
			.isQuestComplete 8288
			.itemcount 20402,1
			.itemcount 20384,200
			.target Baristolth of the Shifting Sands	

		step	
			.use 21220
			.goto Silithus,49.2,34.2
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Commander Mar'alith|r	
			.turnin -8791
			.turnin -8306
			.turnin -8287
			.target Commander Mar'alith

		step
			.goto Silithus,51.9,39.1
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Calandrath|r
			.target Calandrath
			.turnin -8313	

		step	
			.goto Silithus,51.8,39.0
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Calandrath|r	
			.accept 8317
			.turnin 8317
			.itemcount 20452,10
			.skill cooking,<285,1
			.target Calandrath

		step	
			.goto Silithus,48.6,37.6
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Huum Wildmane|r	
			.turnin -8321
			.accept 8343
			.accept 8331
			.target Huum Wildmane

		step	
			.goto Silithus,51.8,38.0
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aurel Goldleaf|r	
			.turnin -8343
			.turnin -8331
			.accept 8341
			.turnin 8341
			.accept 8332
			.turnin 8332
			.accept 9248
			.turnin 9248
			.accept 8351
			.accept 8349
			.target Aurel Goldleaf

		step	
			.goto Silithus,48.6,37.6
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bor Wildmane|r	
			.accept 8318
			.turnin 8318
			.turnin 8351
			.turnin 8349
			.accept 8361	
			.turnin 8361
			.accept 8348
			.turnin 8348
			.accept 8352
			.turnin 8352
			.target Bor Wildmane

		step	
			.goto Silithus,50.8,33.6
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Vish Kozus|r	
			.turnin -8283
			.target Vish Kozus

		step	
			.goto Silithus,52.0,39.0
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dirk Thunderwood|r	
			.turnin -9023	
			.target Dirk Thunderwood	

		step	
			.goto Silithus,51.0,38.8
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Warden Haro|r	
			.accept 8711 << Paladin
			.turnin 8711 << Paladin
			.accept 8707 << Mage
			.turnin 8707 << Mage
			.accept 8709 << Rogue
			.turnin 8709 << Rogue
			.accept 8705 << Priest
			.turnin 8705 << Priest
			.accept 8706 << Shaman
			.turnin 8706 << Shaman
			.accept 8710 << Warlock
			.turnin 8710 << Warlock
			.accept 8708 << Druid
			.turnin 8708 << Druid
			.accept 8712 << Hunter
			.turnin 8712 << Hunter
			.accept 8558 << Warrior
			.turnin 8558 << Warrior
			.target Warden Haro

		step	
			.goto Silithus,51.8,39.4
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Keyl Swiftclaw|r	
			.accept 8695 << Paladin
			.turnin 8695 << Paladin
			.accept 8691 << Mage
			.turnin 8691 << Mage
			.accept 8693 << Rogue
			.turnin 8693 << Rogue
			.accept 8689 << Priest
			.turnin 8689 << Priest
			.accept 8690 << Shaman
			.turnin 8690 << Shaman
			.accept 8694 << Warlock
			.turnin 8694 << Warlock
			.accept 8692 << Druid
			.turnin 8692 << Druid
			.accept 8696 << Hunter
			.turnin 8696 << Hunter
			.accept 8557 << Warrior
			.turnin 8557 << Warrior
			.target Keyl Swiftclaw
			
		step	
			.goto Silithus,52.0,38.0
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Windcaller Yessendra|r	
			.accept 8703 << Paladin
			.turnin 8703 << Paladin
			.accept 8699 << Mage
			.turnin 8699 << Mage
			.accept 8701 << Rogue
			.turnin 8701 << Rogue
			.accept 8697 << Priest
			.turnin 8697 << Priest
			.accept 8698 << Shaman
			.turnin 8698 << Shaman
			.accept 8702 << Warlock
			.turnin 8702 << Warlock
			.accept 8700 << Druid
			.turnin 8700 << Druid
			.accept 8704 << Hunter
			.turnin 8704 << Hunter
			.accept 8556 << Warrior
			.turnin 8555 << Warrior
			.target Windcaller Yessendra

		step
			.goto Silithus,81.87,18.93
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Layo|r
			.turnin 1126 >>Turn in Hive in the Tower
			.accept 6844 >>Accept Umber, Archivist
			.target Layo Starstrike	
		
	--- Go to Ungoro
		
		step
			#completewith next
			.zone Un'Goro Crater >> Travel to |cFFfa9602Un'Goro Crater|r
			.zoneskip Un'Goro Crater

		step	
			.goto Silithus,48.8,36.6
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Runk Windtamer|r
			.fly Un'Goro Crater >>Fly to |cFFfa9602Un'Goro Crater|r
			.zoneskip Un'Goro Crater

		step
			.goto Un'Goro Crater,41.8,2.6
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Prospector Ironboot|r
			.accept 4284
			.turnin 4284
			.accept 3961
			.target Prospector Ironboot

		step	
			.goto Un'Goro Crater,44.6,8.2
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Linken|r
			.turnin -3961	
			.target Linken

		step
			.goto Un'Goro Crater,43.0,9.6
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Muigin|r
			.turnin -4143
			.accept 4144
			.turnin 4144	
			.target Muigin

	--- Go to Tanaris


		step
			#completewith next
			.zone Tanaris >> Travel to |cFFfa9602Tanaris|r
			.zoneskip Tanaris

		step
			.goto Un'Goro Crater,45.2,5.8
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gryfe|r
			.fly Tanaris>>Fly to |cFFfa9602Tanaris|r
			.zoneskip Tanaris

		step
			.goto Tanaris,52.47,27.23
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mux Manascrambler|r
			.accept 8978 >>Accept Return to Mokvar
			.target Mux Manascrambler	

		step
			.goto Tanaris,50.88,26.96
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pestlezugg|r
			.accept 4509 >>Accept Calm Before the Storm
			.target Alchemist Pestlezugg
						
		step
			.goto Tanaris,66.8,24.0
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Prospector Ironboot|r
			.turnin -4788
			.target Prospector Ironboot

		step	
			.goto Tanaris,67.0,22.4
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Yeh'kinya|r
			.turnin -8181
			.target Yeh'kinya

		step
			.goto Tanaris,66.8,24.0
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Prospector Ironboot|r
			.accept 8182
			.target Prospector Ironboot
				
		step
			.goto Tanaris,65.2,50.0
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Anachronos|r
			.turnin -8802
			.target Anachronos

		step
			.goto Tanaris,65.2,50.0
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Anachronos|r
			>>Choose one of the available quests depending on your needs:
			>>Path of the Conquerer - Agility/Hit
			>>Path of the Invoker - Spelldmg/Healing
			>>Path of the Protector - Defensive
			.accept 8752
			.isQuestAvailable 8752
			.target Anachronos

	--- Go to Azshara

		step
			#completewith next
			.zone Azshara >> Get summon to |cFFfa9602Azshara|r
			.zoneskip Azshara

		step	
			.goto Azshara,79.2,73.6
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Duke Hydraxis|r
			.turnin -6822
			.accept 6823
			.turnin 6823
			.target Duke Hydraxis

	--- Go to Furbolgs


		step
			#completewith next
			.zone Felwood >> Get summon to |cFFfa9602Felwood|r
			.zoneskip Felwood

		step
			.use 20742
			.accept 8471
			.use 20741	
			.accept 8470
			.goto Felwood,65.4,2.8
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kernda|r
			.turnin 8471
			.turnin 8470
			.target Kernda

		step
			.goto Felwood,65.6,2.8
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Meilosh|r
			.target Meilosh
			.accept 6031
			.turnin 6031

		step
			#comepletewith next
			.zone Winterspring >> Travel to Winterspring
			.zoneskip Winterspring

		step
			.zone Winterspring >> Run to Winterspring through the Tunnel		

		step
			.use 12771	
			.accept 5083
			.goto Winterspring,31.2,45.2
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Donova Snowden|r
			.turnin 5083
			.target Donova Snowden


		step
			.goto Moonglade,44.88,35.60
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Umber|r
			.turnin 6844 >>Turn in Umber, Archivist		
			.target Umber	

	--- Go to STV

		step
			.zone Stranglethorn Vale >> Get summon to |cFFfa9602Stranglethorn Vale|r
			.zoneskip Stranglethorn Vale
			
		step
			.use 19802
			.accept 8183
			
		step	
			.goto Stranglethorn Vale,15.0,15.2
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Molthor|r
			.turnin -8182
			.turnin -8183
			.target Molthor

		step	
			.goto Stranglethorn Vale,15.2,15.6
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Exzhal|r
			.turnin -8201	
			.target Exzhal	
			
		step
			.goto Stranglethorn Vale,14.4,15.8
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Vinchaxa|r
			.accept 8240
			.target Vinchaxa

		step
			.goto Stranglethorn Vale,13.4,15.1
			.goto Stranglethorn Vale,13.4,15.1 >> Got to the altar and destroy any Bijou
			>>|cRXP_WARN_Destroy any Bijou|r
			.complete 8240,1

		step
			.goto Stranglethorn Vale,14.4,15.8
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Vinchaxa|r
			.turnin -8240
			.target Vinchaxa
			
		step << Rogue
			.goto Stranglethorn Vale,14.0,13.6
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Falthir the Sightless|r
			.accept 8141
			.turnin 8141
			.accept 8142
			.turnin 8142
			.accept 8143
			.turnin 8143	
			.accept 8144
			.turnin 8144	
			.accept 8063
			.turnin 8063	
			.accept 8072
			.turnin 8072	
			.accept 8073
			.turnin 8073	
			.target Falthir the Sightless
			
		step << Hunter
			.goto Stranglethorn Vale,14.0,13.6
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Falthir the Sightless|r
			.accept 8145
			.turnin 8145
			.accept 8146
			.turnin 8146
			.accept 8147
			.turnin 8147	
			.accept 8148
			.turnin 8148	
			.accept 8066
			.turnin 8066	
			.accept 8062
			.turnin 8062	
			.accept 8067
			.turnin 8067	
			.target Falthir the Sightless	
			
		step << Paladin
			.goto Stranglethorn Vale,15.2,14.6
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jin'rokh the Breaker|r
			.accept 8045
			.turnin 8045
			.accept 8046
			.turnin 8046
			.accept 8047
			.turnin 8047	
			.accept 8048
			.turnin 8048	
			.accept 8053
			.turnin 8053	
			.accept 8054
			.turnin 8054	
			.accept 8055
			.turnin 8055	
			.target Jin'rokh the Breaker
			
		step << Warrior
			.goto Stranglethorn Vale,15.2,14.6
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jin'rokh the Breaker|r
			.accept 8041
			.turnin 8041
			.accept 8042
			.turnin 8042
			.accept 8043
			.turnin 8043
			.accept 8044
			.turnin 8044
			.accept 8058
			.turnin 8058	
			.accept 8078
			.turnin 8078	
			.accept 8079
			.turnin 8079
			.target Jin'rokh the Breaker
			
		step << Warlock
			.goto Stranglethorn Vale,15.2,16.0
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Al'tabim the All-Seeing|r
			.accept 8106
			.turnin 8106
			.accept 8107
			.turnin 8107
			.accept 8108
			.turnin 8108	
			.accept 8109
			.turnin 8109	
			.accept 8076
			.turnin 8076	
			.accept 8077
			.turnin 8077	
			.accept 8059
			.turnin 8059	
			.target Al'tabim the All-Seeing

		step << Priest
			.goto Stranglethorn Vale,15.2,16.0
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Al'tabim the All-Seeing|r
			.accept 8049
			.turnin 8049
			.accept 8050
			.turnin 8050
			.accept 8051
			.turnin 8051	
			.accept 8052
			.turnin 8052	
			.accept 8070
			.turnin 8070	
			.accept 8071
			.turnin 8071	
			.accept 8061
			.turnin 8061
			.target Al'tabim the All-Seeing	

		step << Mage
			.goto Stranglethorn Vale,15.2,16.0
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Al'tabim the All-Seeing|r
			.accept 8101
			.turnin 8101
			.accept 8102
			.turnin 8102
			.accept 8103
			.turnin 8103	
			.accept 8104
			.turnin 8104	
			.accept 8068
			.turnin 8068	
			.accept 8069
			.turnin 8069	
			.accept 8060
			.turnin 8060	
			.target Al'tabim the All-Seeing

		step << Shaman
			.goto Stranglethorn Vale,15.2,16.0
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Maywiki of Zuldazar|r
			.accept 8116
			.turnin 8116
			.accept 8117
			.turnin 8117
			.accept 8118
			.turnin 8118	
			.accept 8119
			.turnin 8119	
			.accept 8074
			.turnin 8074	
			.accept 8056
			.turnin 8056	
			.accept 8075
			.turnin 8075
			.target Maywiki of Zuldazar

		step << Druid
			.goto Stranglethorn Vale,15.2,16.0
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Maywiki of Zuldazar|r
			.accept 8110
			.turnin 8110
			.accept 8111
			.turnin 8111
			.accept 8112
			.turnin 8112	
			.accept 8113
			.turnin 8113	
			.accept 8064
			.turnin 8064	
			.accept 8057
			.turnin 8057	
			.accept 8065
			.turnin 8065
			.target Maywiki of Zuldazar

	--- Go to LHC/EPL	

		step
			#completewith next
			.zone Eastern Plaguelands >> Travel to |cFFfa9602Lights Hope Chapel|r
			.zoneskip Eastern Plaguelands

		step
			.hs >> Hearth to |cFFfa9602Lights Hope Chapel|r
			.use 6948
			
		step	
			.goto Eastern Plaguelands,81.6,60.0
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Quartermaster Miranda Breechlock|r
			.accept 5513
			.accept 5517
			.turnin 5513
			.turnin 5517
			.target Quartermaster Miranda Breechlock
			
		step	
			.goto Eastern Plaguelands,81.4,59.8
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Duke Nicholas Zverenhoff|r	
			.turnin -5263
			.accept 5264
			.target Duke Nicholas Zverenhoff

		step	
			.goto Eastern Plaguelands,81.4,58.5
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rayne|r	
			.accept 9136
			.turnin 9136
			.target Rayne
			
		step	
			.goto Eastern Plaguelands,81.7,57.8
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Leonid Barthalomew the Revered|r	
			.turnin -5243
			.turnin -5464
			.turnin -5522
			.accept 5531
			.target Leonid Barthalomew the Revered

		step	
			.goto Eastern Plaguelands,81.7,58.0
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lord Maxwell Tyrosus|r
			.target Lord Maxwell Tyrosus	
			.turnin -5264
			.accept 5265

		step	
			.goto Eastern Plaguelands,81.8,58.0
			>>Click |cRXP_PICK_the Argent Hold|r
			.turnin -5265

		step	
			.goto Eastern Plaguelands,81.8,58.1
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Korfax, Champion of the Light|r	
			.turnin -9229
			.accept 9230
			.turnin 9230
			.turnin -9131
			.target Korfax, Champion of the Light
			.isQuestComplete 9033

		step	
			.goto Eastern Plaguelands,81.8,58.1
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Korfax, Champion of the Light|r	
			.turnin -9229
			.turnin -9131
			.target Korfax, Champion of the Light

		step	
			.goto Eastern Plaguelands,81.5,58.3
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Archmage Angela Dosantos|r	
			.accept 9128
			.turnin 9128
			.target Archmage Angela Dosantos

		step	
			.goto Eastern Plaguelands,81.5,58.5
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Huntsman Leopold|r	
			.accept 9124
			.turnin 9124
			.target Huntsman Leopold
			
		step	
			.goto Eastern Plaguelands,81.4,58.5
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rohan the Assassin|r	
			.accept 9126
			.turnin 9126
			.target Rohan the Assassin
			
		step	
			.goto Eastern Plaguelands,81.5,58.1
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Father Inigo Montoy|r	
			.use 22520
			.accept 9120
			.turnin 9120	
			.target Father Inigo Montoy
			
		step	
			.goto Eastern Plaguelands,80.6,58.0
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Smokey LaRue|r	
			.accept 6026
			.turnin 6026
			.turnin -5214
			.target Smokey LaRue

		step	
			.goto Eastern Plaguelands,81.0,57.6
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dispatch Commander Metz|r	
			.accept 9141
			.turnin 9141
			.target Dispatch Commander Metz

		step	
			.goto Eastern Plaguelands,80.0,57.6
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Emissary Gormok|r	
			.turnin -9665
			.target Emissary Gormok

		step	
			.goto Eastern Plaguelands,81.5,59.6
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Betina Bigglezink|r	
			.turnin -5529
			.turnin -5213
			.turnin -5212
			.turnin -5531
			.target Betina Bigglezink

		step	
			.goto Eastern Plaguelands,81.0,59.6
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Craftsman Wilhelm|r	
			.accept 9232
			.turnin 9232
			.isQuestComplete 9033
			.target Craftsman Wilhelm

		step
			.goto Eastern Plaguelands,36.4,90.8
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pamela Redpath|r
			.turnin -5721
			.accept 5942
			.target Pamela Redpath
			
		step	
			.goto Eastern Plaguelands,36.2,90.4
			>>Click |cRXP_PICK_Joseph's Chest|r
			.turnin -5942

		step	
			.goto Eastern Plaguelands,28.1,86.1
			>>Click |cRXP_PICK_Mound of Dirt|r
			.turnin -6024	

		step	
			.goto Eastern Plaguelands,26.6,74.8
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nathanos Blightcaller|r
			.turnin -6163
			.turnin -6136
			.turnin -6148
			.target Nathanos Blightcaller

		step	
			.goto Eastern Plaguelands,7.6,43.6
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tirion Fordring|r
			.turnin -5848
			.accept 5861
			.target Tirion Fordring


	--- Go to WPL

		step
			#completewith next
			.zone Western Plaguelands >> Travel to |cFFfa9602Western Plaguelands|r
			.zoneskip Western Plaguelands

		step
			.goto Western Plaguelands,62.5,58.6
			>>Click |cRXP_PICK_Scourge Cauldron|r
			.accept 5236

		step
			.isOnQuest 5861
			.goto Eastern Plaguelands,50.8,77.8
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Myranda the Hag|r
			.turnin -5861
			.target Myranda the Hag
		
	--- Go to Tirisfal
		
		
		step
			#completewith next
			.zone Tirisfal Glades >> Travel to |cFFfa9602Tirisfal Glades|r
			.zoneskip Tirisfal Glades
			
		step
			.goto Tirisfal Glades,83.0,71.9
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shadow Priestess Vandis|r
			.turnin -5236
			.target Shadow Priestess Vandis

		step
			.goto Tirisfal Glades,83.1,71.6
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alexi Barov|r
			.turnin -5341	
			.turnin -5342
			.target Alexi Barov

		step
			.goto Tirisfal Glades,83.2,71.2
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mehlar Dawnblade|r
			.turnin -9444
			.target Mehlar Dawnblade			
			
		step
			.goto Tirisfal Glades,83.3,69.2
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Apothecary Dithers|r
			.accept 5511
			.turnin 5511
			.target Apothecary Dithers

		step	
			.goto Tirisfal Glades,83.1,68.9
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Executor Derrington|r
			.turnin -105	
			.accept 5238
			.turnin 5238
			.target High Executor Derrington

	--- Go to Silvermoon City


		step <<tbc
			.zone Silvermoon City >> Take Portal to |cFFfa9602Silvermoon City|r
			.zoneskip Silvermoon City
		
		step <<tbc
			.goto Silvermoon City,56.6,52.8
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sorim Lightsong|r
			.accept 10359
			.turnin 10359
			.accept 10360
			.turnin 10360
			.accept 10361
			.turnin 10361
			.accept 10362
			.turnin 10362
			.target Sorim Lightsong

	--- Go to Thunder Bluff


		step
			.zone Thunder Bluff >> Take Portal to |cFFfa9602Thunder Bluff|r
			.zoneskip Thunder Bluff

		step
			.goto Thunder Bluff,43.2,42.8
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rumstag Proudstrider|r
			.accept 7820
			.turnin 7820
			.accept 7821
			.turnin 7821
			.accept 7822
			.turnin 7822
			.accept 7823
			.turnin 7823
			.target Rumstag Proudstrider	
		
	--- Go to Orgrimmar


		step
			.zone Orgrimmar >> Take Portal to |cFFfa9602Orgrimmar|r
			.zoneskip Orgrimmar

		step
			.goto Orgrimmar,37.8,87.6
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Vehena|r
			.accept 7833
			.turnin 7833
			.accept 7834
			.turnin 7834
			.accept 7835
			.turnin 7835
			.accept 7836
			.turnin 7836	
			.target Vehena

		step
			.goto Orgrimmar,32.0,37.8
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thrall|r	
			.use 18422
			.accept 7490
			.use 19002
			.accept 7783
			.turnin -4004
			.turnin 7490
			.accept 7491
			.turnin 7783
			.accept 7784
			.target Thrall
		
		step << Horde
			.goto Orgrimmar,34.96,38.28
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mokvar|r
			.turnin -8978 >>Turn in Return to Mokvar
			.accept 8927 >>Accept Just Compensation << Druid
			.accept 8938 >>Accept Just Compensation << Hunter
			.accept 8939 >>Accept Just Compensation << Mage
			.accept 8940 >>Accept Just Compensation << Priest
			.accept 8941 >>Accept Just Compensation << Rogue
			.accept 8942 >>Accept Just Compensation << Shaman
			.accept 8943 >>Accept Just Compensation << Warlock
			.accept 8944 >>Accept Just Compensation << Warrior
			.target Mokvar

		step << Horde
			.goto Orgrimmar,34.96,38.28
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mokvar|r
			>>You will need |T132504:0|t[|cRXP_LOOT_Wildheart Belt|r] and |T132951:0|t[|cRXP_LOOT_Wildheart Gloves|r] to turn in this quest << Druid
			>>You will need |T132517:0|t[|cRXP_LOOT_Beaststalker's Belt|r] and |T132944:0|t[|cRXP_LOOT_Beaststalker's Gloves|r] to turn in this quest << Hunter
			>>You will need |T132497:0|t[|cRXP_LOOT_Magister's Belt|r] and |T132951:0|t[|cRXP_LOOT_Magister's Gloves|r] to turn in this quest << Mage
			>>You will need |T132499:0|t[|cRXP_LOOT_Devout Belt|r] and |T132948:0|t[|cRXP_LOOT_Devout Gloves|r] to turn in this quest << Priest
			>>You will need |T132492:0|t[|cRXP_LOOT_Shadowcraft Belt|r] and |T132958:0|t[|cRXP_LOOT_Shadowcraft Gloves|r] to turn in this quest << Rogue
			>>You will need |T132505:0|t[|cRXP_LOOT_Cord of Elements|r] and |T132945:0|t[|cRXP_LOOT_Gauntlets of Elements|r] to turn in this quest << Shaman
			>>You will need |T132501:0|t[|cRXP_LOOT_Dreadmist Belt|r] and |T132966:0|t[|cRXP_LOOT_Dreadmist Wraps|r] to turn in this quest << Warlock
			>>You will need |T132523:0|t[|cRXP_LOOT_Belt of Valor|r] and |T132960:0|t[|cRXP_LOOT_Gauntlets of Valor|r]r to turn in this quest << Warrior
			.collect 16716,1,8927,1 << Horde Druid --Wildheart Belt (x1)
			.collect 16717,1,8927,1 << Horde Druid --Wildheart Gloves (x1)
			.collect 16680,1,8938,1 << Horde Hunter --Beaststalker's Belt (x1)
			.collect 16676,1,8938,1 << Horde Hunter --Beaststalker's Gloves (x1)
			.collect 16685,1,8939,1 << Horde Mage --Magister's Belt (x1)
			.collect 16684,1,8939,1 << Horde Mage --Magister's Gloves (x1)
			.collect 16696,1,8940,1 << Horde Priest --Devout Belt (x1)
			.collect 16692,1,8940,1 << Horde Priest --Devout Gloves (x1)
			.collect 16713,1,8941,1 << Horde Rogue --Shadowcraft Belt (x1)
			.collect 16712,1,8941,1 << Horde Rogue --Shadowcraft Gloves (x1)
			.collect 16673,1,8942,1 << Horde Shaman --Cord of Elements (x1)
			.collect 16672,1,8942,1 << Horde Shaman --Gauntlets of Elements (x1)
			.collect 16702,1,8943,1 << Horde Warlock --Dreadmist Belt (x1)
			.collect 16705,1,8943,1 << Horde Warlock --Dreadmist Wraps (x1)
			.collect 16736,1,8944,1 << Horde Warrior --Belt of Valor (x1)
			.collect 16737,1,8944,1 << Horde Warrior --Gauntlets of Valor (x1)
			.turnin -8927 >>Turn in Just Compensation << Druid
			.turnin -8938 >>Turn in Just Compensation << Hunter
			.turnin -8939 >>Turn in Just Compensation << Mage
			.turnin -8940 >>Turn in Just Compensation << Priest
			.turnin -8941 >>Turn in Just Compensation << Rogue
			.turnin -8942 >>Turn in Just Compensation << Shaman
			.turnin -8943 >>Turn in Just Compensation << Warlock
			.turnin -8944 >>Turn in Just Compensation << Warrior
			.accept 8930 >>Accept In Search of Anthion
			.target Mokvar	
				
		step
			.goto Orgrimmar,63.4,51.0
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rashona Straglash|r
			.accept 7826
			.turnin 7826
			.accept 7827
			.turnin 7827
			.accept 7831
			.turnin 7831
			.accept 7824
			.turnin 7824
			.target Rashona Straglash		

		step
			.goto Orgrimmar,56.4,46.6
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Zilzibin Drumlore|r
			.turnin -4509
			.accept 4511
			.target Zilzibin Drumlore

		step
			.goto Orgrimmar,49.8,70.0
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Karus|r
			.turnin -4511
			.target Karus

		step
			.goto Orgrimmar,52.4,78.0
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Overlord Saurfang|r
			.turnin -7784
			.target High Overlord Saurfang

		step
			.goto Orgrimmar,51.6,78.2
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Overlord Runthak|r
			.turnin -7491
			.target Overlord Runthak

	--- Go to Undercity

		step
			.zone Undercity	 >> Take Portal to |cFFfa9602Undercity	|r
			.zoneskip Undercity	
			
		step
			.goto Undercity,72.4,29.8
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ralston Farnsley|r
			.accept 7813
			.turnin 7813
			.accept 7814
			.turnin 7814
			.accept 7817
			.turnin 7817
			.accept 7818
			.turnin 7818	
			.target Ralston Farnsley
		
	--- Go to Swamp of Sorrows

		step
			.zone Swamp of Sorrows >> Take Portal to |cFFfa9602Swamp of Sorrows|r
			.zoneskip Swamp of Sorrows

		step
			.goto Swamp of Sorrows,34.2,66.0
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fallen Hero of the Horde|r
			.turnin -2681
			.accept 2702
			.target Fallen Hero of the Horde

		step
			.goto Swamp of Sorrows,33.6,66.0
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Corporal Thund Splithoof|r
			.turnin -2702
			.accept 2701
			.target Corporal Thund Splithoof
			
		step	
			.goto Swamp of Sorrows,33.5,66.0
			>>Click |cRXP_PICK_Spectral Lockbox|r
			.turnin -2701
		
	--- Go to Blasted Lands	

		step
			#completewith next
			.zone Blasted Lands >> Travel to |cFFfa9602Blasted Lands|r
			.zoneskip Blasted Lands

		step
			.goto Blasted Lands,50.6,14.2
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bloodmage Drazial|r
			.accept 2583
			.turnin 2583
			.accept 2603
			.turnin 2603
			.accept 2601
			.turnin 2601
			.accept 2585
			.turnin 2585
			.accept 2581
			.turnin 2581
			.target Bloodmage Drazial

		step
			.goto Blasted Lands,51.8,35.6
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kum'isha the Collector|r
			.accept 2521
			.turnin 2521
			.accept 3501
			.turnin 3501
			.target Kum'isha the Collector

	--- Go through Portal


		step <<tbc
			.goto Blasted Lands,58.0,55.8
			>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Warlord Dar'toon|r
			.accept 9407
			.target Warlord Dar'toon

		step <<tbc
			#completewith next
			.zone Hellfire Peninsula >> Travel to |cFFfa9602Hellfire Peninsula|r
			.zoneskip Hellfire Peninsula

		step <<tbc
			.zone Hellfire Peninsula >> Go through the Portal to |cFFfa9602Hellfire Peninsula|r and enjoy leveling! :)

]])

RXPGuides.RegisterGuide([[
#classic
#version 3
#group Consita Classic/TBC Launch Guide
#subgroup 5 - TBC Launch Day
#name Solo Turn-in

--- |cRXP_FRIENDLY_, |cRXP_ENEMY_, |cRXP_LOOT_, |cRXP_WARN_, |cRXP_PICK_, |cRXP_BUY_
--- |c99ffff99 OR|r
--- |Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk


]])

RXPGuides.RegisterGuide([[
#classic
#version 3
#group Consita Classic/TBC Launch Guide
#subgroup 5 - TBC Launch Day
#name Strat Group Turn-in

--- |cRXP_FRIENDLY_, |cRXP_ENEMY_, |cRXP_LOOT_, |cRXP_WARN_, |cRXP_PICK_, |cRXP_BUY_
--- |c99ffff99 OR|r
--- |Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk


]])
