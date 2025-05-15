RXPGuides.RegisterGuide("Consita Classic/TBC Launch Guide",[[

--- To Do:
--- Create Kalimdor Preparation Guide

--- Create Eastern Kingdoms Preparation Guide

--- Create Item Preparation Guide

--- Turnin Guide:
--- Fix Silithus order
--- Fix requirements for quests and check if requirements and items are done/available


#name Kalimdor Preparation Guide
#next Eastern Kingdoms Preparation Guide

--- Start
	step


#name Eastern Kingdoms Preparation Guide
#next Item Preparation Guide

--- Start
	step


#name Item Perparation Guide
#next 60-62 TBC Launch	

--- Start
	step
	

#name 60-62 TBC Launch			

--- Start at Silithus


	step
		#completewith next
		.zone Silithus >> Go to Silithus
		.zoneskip Silithus
	
	step									
		.goto Silithus,67.0,69.6	
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hermit Ortell|r	
		.turnin 8279
		.accept 8287
		.accept 8323
		.turnin 8323
		
	step	
		.goto Silithus,40.8,88.6
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Frankal Stonebridge|r	
		.turnin 8310	
		
	step
		.use 20461
		.goto Silithus,41.2,88.4	
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rutgar Glyphshaper|r	
		.turnin 8308
		.turnin 8309
		.accept 8314

	step
		.deathskip

	step	
		.goto Silithus,49.6,36.6
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Baristolth of the Shifting Sands|r	
		.turnin 8288
		.accept 8301
		.turnin 8301

	step	
		.use 21220
		.goto Silithus,49.2,34.2
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Commander Mar'alith|r	
		.turnin 8791
		.turnin 8306

	step	
		.goto Silithus,51.8,39.0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Calandrath|r	
		.accept 8317
		.turnin 8317

	step	
		.goto Silithus,48.6,37.6
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_Huum Wildmane|r	
		.accept 8321

	step	
		.goto Silithus,48.6,37.6
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bor Wildmane|r	
		.accept 8318
		.turnin 8318
		.accept 8361	
		.turnin 8361
		.accept 8332
		.turnin 8332
		.accept 8341
		.turnin 8341
		.accept 8348
		.turnin 8348

	step	
		.goto Silithus,50.8,33.6
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Vish Kozus|r	
		.turnin 8283

	step	
		.goto Silithus,52.0,39.0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dirk Thunderwood|r	
		.turnin 9023		

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
	

--- Go to Ungoro
	

	step
		#completewith next
		.zone Un'Goro Crater >> Travel to Un'Goro Crater
		.zoneskip Un'Goro Crater

	step	
		.goto Silithus,48.8,36.6
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Runk Windtamer|r
		.fly Un'Goro Crater >>Fly to Un'Goro Crater

	step
		.goto Un'Goro Crater,41.8,2.6
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Prospector Ironboot|r
		.accept 4284
		.turnin 4284
		.accept 3961

	step	
		.goto Un'Goro Crater,44.6,8.2
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Linken|r
		.turnin 3961	

	step
		.goto Un'Goro Crater,43.0,9.6
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Muigin|r
		.turnin 4143
		.accept 4144
		.turnin 4144	


--- Go to Tanaris


	step
		#completewith next
		.zone Tanaris >> Travel to Tanaris
		.zoneskip Tanaris

	step
		.goto Un'Goro Crater,45.2,5.8
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gryfe|r
		.fly Tanaris>>Fly to Tanaris
		
	step
		.goto Tanaris,66.8,24.0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Prospector Ironboot|r
		.turnin 4788

	step	
		.goto Tanaris,67.0,22.4
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Yeh'kinya|r
		.turnin 8181

	step
		.goto Tanaris,66.8,24.0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Prospector Ironboot|r
		.accept 8182
			
	step
		.goto Tanaris,65.2,50.0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Anachronos|r
		.turnin -8802


--- Go to Azshara


	step
		#completewith next
		.zone Azshara >> Travel to Azshara
		.zoneskip Azshara
		
	step
		.zone Azshara >> Get summon to Azshara

	step	
		.goto Azshara,79.2,73.6
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Duke Hydraxis|r
		.turnin 6822
		.accept 6823
		.turnin 6823


--- Go to Furbolgs


	step
		#comepletewith next
		.zone Felwood >> Travel to Felwood
		.zoneskip Felwood

	step
		.zone Felwood >> Get summon to Felwood

	step
		.use 20742
		.accept 8471
		.use 20741	
		.accept 8470
		.goto Felwood,65.4,2.8
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kernda|r
		.turnin 8471
		.turnin 8470

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


--- Go to STV


	step
		#completewith next
		.zone Stranglethorn Vale >> Travel to Stranglethorn Vale
		.zoneskip Stranglethorn Vale
		
	step
		.zone Stranglethorn Vale >> Get summon to Stranglethorn Vale
		
	step
		.use 19802
		.accept 8183
		
	step	
		.goto Stranglethorn Vale,15.0,15.2
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Molthor|r
		.turnin 8182
		.turnin 8183

	step	
		.goto Stranglethorn Vale,15.2,15.6
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Exzhal|r
		.turnin 8201		
		
	step
		.goto Stranglethorn Vale,14.4,15.8
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Vinchaxa|r
		.accept 8240

	step
		.goto Stranglethorn Vale,13.4,15.1
		.goto Stranglethorn Vale,13.4,15.1 >> Got to the altar and destroy any Bijou
		+Destroy any Bijou
		.complete 8240

	step
		.goto Stranglethorn Vale,14.4,15.8
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Vinchaxa|r
		.turnin 8240
		
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


--- Go to Burning Steppes


	step
		#completewith next
		.zone Burning Steppes >> Travel to Burning Steppes
		.zoneskip Burning Steppes
		
	step	
		.goto Stranglethorn Vale,32.5,29.4
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thysta|r
		.fly Burning Steppes >>Fly to Burning Steppes
		
	step
		.goto Burning Steppes,65.2,24.0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tinkee Steamboil|r
		.turnin 4735
		.accept 5522	
		
	step
		.goto Burning Steppes,65.0,23.8
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ragged John|r
		.turnin 4866	

	step
		.goto Burning Steppes,65.2,23.8
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Maxwort Uberglint|r
		.turnin 4123			
		
	step
		.goto Burning Steppes,65.9,21.9
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kibler|r
		.turnin 4729	
		.turnin 4862
		
	step
		.goto Burning Steppes,66.1,22.0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Yuka Screwspigot|r
		.turnin 4136
	
	
--- Go to LHC/EPL	


	step
		#completewith next
		.zone Eastern Plaguelands >> Travel to Lights Hope Chapel
		.zoneskip Eastern Plaguelands
		
	step
		.zone Eastern Plaguelands >> Get summon to Eastern Plaguelands
		
	step	
		.goto Eastern Plaguelands,81.6,60.0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Quartermaster Miranda Breechlock|r
		.accept 5513
		.accept 5517
		.turnin 5513
		.turnin 5517
		
	step	
		.goto Eastern Plaguelands,81.4,59.8
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Duke Nicholas Zverenhoff|r	
		.turnin 5263
		.accept 5264

	step	
		.goto Eastern Plaguelands,81.4,58.5
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rayne|r	
		.accept 9136
		.turnin 9136
		
	step	
		.goto Eastern Plaguelands,81.7,57.8
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Leonid Barthalomew the Revered|r	
		.turnin 5243
		.turnin 5464
		.turnin 5522
		.accept 5531

	step	
		.goto Eastern Plaguelands,81.7,58.0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lord Maxwell Tyrosus|r	
		.turnin 5264
		.accept 5265

	step	
		.goto Eastern Plaguelands,81.8,58.0
		>>Click |cRXP_PICK_the Argent Hold|r
		.turnin 5265

	step	
		.goto Eastern Plaguelands,81.8,58.1
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Korfax, Champion of the Light|r	
		.turnin 9229
		.accept 9230
		.turnin 9230
		.turnin 9131

	step	
		.goto Eastern Plaguelands,81.5,58.3
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Archmage Angela Dosantos|r	
		.accept 9128
		.turnin 9128

	step	
		.goto Eastern Plaguelands,81.5,58.5
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Huntsman Leopold|r	
		.accept 9124
		.turnin 9124
		
	step	
		.goto Eastern Plaguelands,81.4,58.5
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rohan the Assassin|r	
		.accept 9126
		.turnin 9126
		
	step	
		.goto Eastern Plaguelands,81.5,58.1
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Father Inigo Montoy|r	
		.use 22520
		.accept 9120
		.turnin 9120	
		
	step	
		.goto Eastern Plaguelands,80.6,58.0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Smokey LaRue|r	
		.accept 6026
		.turnin 6026
		.turnin 5214

	step	
		.goto Eastern Plaguelands,81.0,57.6
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dispatch Commander Metz|r	
		.accept 9141
		.turnin 9141

	step	
		.goto Eastern Plaguelands,80.0,57.6
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Emissary Gormok|r	
		.turnin 9665

	step	
		.goto Eastern Plaguelands,81.5,59.6
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Betina Bigglezink|r	
		.turnin 5529
		.turnin 5213
		.turnin 5531

	step
		.goto Eastern Plaguelands,36.4,90.8
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Pamela Redpath|r
		.turnin 5721
		.accept 5942
		
	step	
		.goto Eastern Plaguelands,36.2,90.4
		>>Click |cRXP_PICK_Joseph's Chest|r
		.turnin 5942

	step	
		.goto Eastern Plaguelands,28.1,86.1
		>>Click |cRXP_PICK_Mound of Dirt|r
		.turnin 6024	

	step	
		.goto Eastern Plaguelands,26.6,74.8
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nathanos Blightcaller|r
		.turnin 6163
		.turnin 6136
		.turnin 6148

	
--- Go to WPL


	step
		#completewith next
		.zone Western Plaguelands >> Travel to Western Plaguelands
		.zoneskip Western Plaguelands

	step
		.goto Western Plaguelands,62.5,58.6
		>>Click |cRXP_PICK_Scourge Cauldron|r
		.turnin 5235
		.accept 5236
	
	
--- Go to Tirisfal
	
	
	step
		#completewith next
		.zone Tirisfal Glades >> Travel to Tirisfal Glades
		.zoneskip Tirisfal Glades
		
	step
		.goto Tirisfal Glades,83.0,71.9
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shadow Priestess Vandis|r
		.turnin 5236

	step
		.goto Tirisfal Glades,83.1,71.6
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alexi Barov|r
		.turnin 5341	
		.turnin 5342

	step
		.goto Tirisfal Glades,83.2,71.2
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mehlar Dawnblade|r
		.turnin 9444			
		
	step
		.goto Tirisfal Glades,83.3,69.2
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Apothecary Dithers|r
		.turnin 5804	
		.accept 5511
		.turnin 5511

	step	
		.goto Tirisfal Glades,83.1,68.9
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Executor Derrington|r
		.turnin 105	
		.accept 5238
		.turnin 5238


--- Go to Silvermoon City


	step
		#completewith next
		.zone Silvermoon City >> Travel to Silvermoon City
		.zoneskip Silvermoon City
		
	step
		.zone Silvermoon City >> Take Portal to Silvermoon City

	step
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

	
--- Go to Thunder Bluff


	step
		#completewith next
		.zone Thunder Bluff >> Travel to Thunder Bluff
		.zoneskip Thunder Bluff
		
	step
		.zone Thunder Bluff >> Take Portal to Thunder Bluff

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
	
	
--- Go to Orgrimmar


	step
		#completewith next
		.zone Orgrimmar >> Travel to Orgrimmar
		.zoneskip Orgrimmar
		
	step
		.zone Orgrimmar >> Travel to Orgrimmar

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

	step
		.use 18422
		.accept 7490
		.use 19002
		.accept 7783
		
	step
		.goto Orgrimmar,32.0,37.8
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thrall|r	
		.turnin 4004
		.turnin 7490
		.accept 7491
		.turnin 7783
		.accept 7784
		
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

	step
		.goto Orgrimmar,52.4,78.0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Overlord Saurfang|r
		.turnin 7784

	step
		.goto Orgrimmar,51.6,78.2
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Overlord Runthak|r
		.turnin 7491


--- Go to Undercity


	step
		#completewith next
		.zone Undercity	 >> Travel to Undercity	
		.zoneskip Undercity	

	step
		.zone Undercity >> Take Portal to Undercity	
		
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
	

--- Go to Tarren's Mill


	step
		#completewith next
		.zone Hillsbrad Foothills >> Travel to Hillsbrad Foothills
		.zoneskip Hillsbrad Foothills
		
	step	
		.goto Undercity,63.5,48.6
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Michael Garrett|r
		.fly Hillsbrad Foothills >>Fly to Hillsbrad Foothills
		
	step
		.goto Alterac Mountains,62.2,59.0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Warmaster Laggrond|r
		.turnin 7163
		.accept 7164
		.turnin 7164
		.accept 7165
		.turnin 7165
		.accept 7166
		.turnin 7166
		.accept 7167
		.turnin 7167
	
	
--- Go to Swamp of Sorrows


	step
		#completewith next
		.zone Swamp of Sorrows >> Travel to Swamp of Sorrows
		.zoneskip Swamp of Sorrows

	step
		.hs >> Hearth to Stonard
		.use 6948

	step
		.goto Swamp of Sorrows,34.2,66.0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fallen Hero of the Horde|r
		.turnin 2681
		.accept 2702

	step
		.goto Swamp of Sorrows,33.6,66.0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Corporal Thund Splithoof|r
		.turnin 2702
		.accept 2701
		
	step	
		.goto Swamp of Sorrows,33.5,66.0
		>>Click |cRXP_PICK_Spectral Lockbox|r
		.turnin 2701
	
	
--- Go to Blasted Lands	


	step
		#completewith next
		.zone Blasted Lands >> Travel to Blasted Lands
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

	step
		.goto Blasted Lands,51.8,35.6
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kum'isha the Collector|r
		.accept 2521
		.turnin 2521
		.accept 3501
		.turnin 3501


--- Go through Portal


	step
		.goto Blasted Lands,58.0,55.8
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Warlord Dar'toon|r
		.accept 9407

	step
		#completewith next
		.zone Hellfire Peninsula >> Travel to Hellfire Peninsula
		.zoneskip Hellfire Peninsula

	step
		.zone Hellfire Peninsula >> Go through the Portal to Hellfire Peninsula and enjoy leveling! :)



]])