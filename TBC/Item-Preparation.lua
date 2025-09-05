RXPGuides.RegisterGuide([[
#classic
#version 3
#group Consita Classic/TBC Launch Guide
#subgroup 2 - Preparation
#name 2-Item Preparation
#displayname Item Preparation

-- |cRXP_FRIENDLY_, |cRXP_ENEMY_, |cRXP_LOOT_, |cRXP_WARN_, |cRXP_PICK_, |cRXP_BUY_
-- |c99ffff99 OR|r
-- |Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk

    step
    	>>Welcome to the |cRXP_BUY_TBC|r Item Preparation Guide!
		>>|cRXP_WARN_The item guide assumes you have all quests still available and meet the reputation requirements!|r
		>>|cRXP_WARN_There is no automatic check in any of the following steps!|r
		>>|cRXP_WARN_Make sure to put all items you already have in the inventory or manually complete the steps!|r
		+|cRXP_PICK_I understand|r

	step
	    #label Buy Cloth for city-turnins
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tBuy the following items for cloth turn-ins
		>>|cRXP_BUY_Collect the following items|r:
		>>|cRXP_WARN_300x|r|T132911:0|t[Wool Cloth]
		>>|cRXP_WARN_300x|r|T132905:0|t[Silk Cloth]
		>>|cRXP_WARN_300x|r|T132892:0|t[Mageweave Cloth]
        >>|cRXP_WARN_330x|r|T132903:0|t[Runecloth]
        >>|cRXP_WARN_Buy them from the Auction House if possible|r
		.collect 2592,300
		.collect 4306,300
		.collect 4338,300
		.collect 14047,330

	step
	    #label Buy stuff for EPL turnin
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tBuy the following items for EPL turn-ins
		>>|cRXP_BUY_Collect the following items|r:
		>>|cRXP_WARN_1x|r|T134422:0|t[Frozen Rune]
		>>|cRXP_WARN_1x|r|T134132:0|t[Blue Sapphire]
		>>|cRXP_WARN_1x|r|T134459:0|t[Arcanite Bar]
		>>|cRXP_WARN_2x|r|T133221:0|t[Thorium Bar]
		>>|cRXP_WARN_1x|r|T135147:0|t[Golden Rod]
		>>|cRXP_WARN_8x|r|T133715:0|t[Hi-Explosive Bomb]
		>>|cRXP_WARN_8x|r|T132488:0|t[Unstable Trigger]
		>>|cRXP_WARN_30x|r|T134139:0|t[Core of Elements]
		>>|cRXP_WARN_30x|r|T133571:0|t[Crypt Fiend Parts]
		>>|cRXP_WARN_30x|r|T133724:0|t[Bone Fragments]
		>>|cRXP_WARN_30x|r|T133614:0|t[Dark Iron Scraps]
		>>|cRXP_WARN_30x|r|T136074:0|t[Savage Frond]
		.collect 22682,1
		.collect 12361,1
		.collect 12360,1
		.collect 12359,2
		.collect 11128,1
		.collect 10562,8
		.collect 10560,8
		.collect 22527,30
		.collect 22525,30
		.collect 22526,30
		.collect 22528,30
		.collect 22529,30

	step
	    #label Buy stuff for Silithus
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tBuy the following items for Silithus
		>>|cRXP_WARN_Some quests require reputation with Cenarion Circle (Honored/Revered).|r
		>>|cRXP_BUY_Collect the following items|r:
		>>|cRXP_WARN_200x|r|T134315:0|t[Silithid Carapace Fragment]
		>>|cRXP_WARN_10x|r|T134020:0|t[Smoked Desert Dumplings]
		>>|cRXP_WARN_20x|r|T134332:0|t[Encrypted Twilight Text]
		>>|cRXP_WARN_4x|r|T133438:0|t[Abyssal Crest]
		>>|cRXP_WARN_4x|r|T133378:0|t[Abyssal Signet]
		>>|cRXP_WARN_2x|r|T135150:0|t[Abyssal Scepter]
		>>|cRXP_WARN_6x|r|T132873:0|t[Large Brilliant Shard]
		.collect 20384,200
		.collect 20452,10
		.collect 20404,20
		.collect 20513,4
		.collect 20514,4
		.collect 20515,2
		.collect 14344,6

	-- DRUID
	step << Druid
		#label Buy stuff for Silithus Tier
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tBuy the following items for Silithus AQ20 turn in
		>>|cRXP_WARN_The AQ20 quests require reputation with Cenarion Circle (Honored/Revered/Exalted) and items from the raid.|r
		>>|cRXP_BUY_Collect the following items|r:
		>>|cRXP_WARN_1x|r|T134894:0|t[Qiraji Magisterial Ring]
		>>|cRXP_WARN_2x|r|T134896:0|t[Alabaster Idol]
		>>|cRXP_WARN_5x|r|T134930:0|t[Bronze Scarab]
		>>|cRXP_WARN_5x|r|T2241756:0|t[Ivory Scarab]
		.collect 20884,1
		.collect 20873,2
		.collect 20861,5
		.collect 20865,5

		>>|cRXP_WARN_1x|r|T132617:0|t[Qiraji Regal Drape]
		>>|cRXP_WARN_2x|r|T134910:0|t[Vermillion Idol]
		>>|cRXP_WARN_5x|r|T134929:0|t[Bone Scarab]
		>>|cRXP_WARN_5x|r|T134935:0|t[Silver Scarab]
		.collect 20889,1
		.collect 20872,2
		.collect 20864,5
		.collect 20860,5

		>>|cRXP_WARN_1x|r|T134885:0|t[Qiraji Ornate Hilt]
		>>|cRXP_WARN_2x|r|T134900:0|t[Jasper Idol]
		>>|cRXP_WARN_5x|r|T134932:0|t[Crystal Scarab]
		>>|cRXP_WARN_5x|r|T134936:0|t[Stone Scarab]
		.collect 20890,1
		.collect 20870,2
		.collect 20862,5
		.collect 20858,5

	-- HUNTER
	step << Hunter
		#label Buy stuff for Silithus Tier
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tBuy the following items for Silithus AQ20 turn in
		>>|cRXP_WARN_The AQ20 quests require reputation with Cenarion Circle (Honored/Revered/Exalted) and items from the raid.|r
		>>|cRXP_BUY_Collect the following items|r:
		>>|cRXP_WARN_1x|r|T134893:0|t[Qiraji Ceremonial Ring]
		>>|cRXP_WARN_2x|r|T134897:0|t[Amber Idol]
		>>|cRXP_WARN_5x|r|T134931:0|t[Clay Scarab]
		>>|cRXP_WARN_5x|r|T134933:0|t[Gold Scarab]
		.collect 20888,1
		.collect 20869,2
		.collect 20863,5
		.collect 20859,5

		>>|cRXP_WARN_1x|r|T132617:0|t[Qiraji Regal Drape]
		>>|cRXP_WARN_2x|r|T134901:0|t[Lambent Idol]
		>>|cRXP_WARN_5x|r|T134932:0|t[Crystal Scarab]
		>>|cRXP_WARN_5x|r|T134936:0|t[Stone Scarab]
		.collect 20889,1
		.collect 20868,2
		.collect 20862,5
		.collect 20858,5

		>>|cRXP_WARN_1x|r|T134886:0|t[Qiraji Spiked Hilt]
		>>|cRXP_WARN_2x|r|T134898:0|t[Azure Idol]
		>>|cRXP_WARN_5x|r|T134929:0|t[Bone Scarab]
		>>|cRXP_WARN_5x|r|T134935:0|t[Silver Scarab]
		.collect 20886,1
		.collect 20866,2
		.collect 20864,5
		.collect 20860,5

	-- MAGE
	step << Mage
		#label Buy stuff for Silithus Tier
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tBuy the following items for Silithus AQ20 turn in
		>>|cRXP_WARN_The AQ20 quests require reputation with Cenarion Circle (Honored/Revered/Exalted) and items from the raid.|r
		>>|cRXP_BUY_Collect the following items|r:
		>>|cRXP_WARN_1x|r|T134894:0|t[Qiraji Magisterial Ring]
		>>|cRXP_WARN_2x|r|T134898:0|t[Azure Idol]
		>>|cRXP_WARN_5x|r|T134931:0|t[Clay Scarab]
		>>|cRXP_WARN_5x|r|T134933:0|t[Gold Scarab]
		.collect 20884,1
		.collect 20866,2
		.collect 20863,5
		.collect 20859,5

		>>|cRXP_WARN_1x|r|T134883:0|t[Qiraji Martial Drape]
		>>|cRXP_WARN_2x|r|T134896:0|t[Alabaster Idol]
		>>|cRXP_WARN_5x|r|T134932:0|t[Crystal Scarab]
		>>|cRXP_WARN_5x|r|T134936:0|t[Stone Scarab]
		.collect 20885,1
		.collect 20873,2
		.collect 20862,5
		.collect 20858,5

		>>|cRXP_WARN_1x|r|T134885:0|t[Qiraji Ornate Hilt]
		>>|cRXP_WARN_2x|r|T134904:0|t[Obsidian Idol]
		>>|cRXP_WARN_5x|r|T134929:0|t[Bone Scarab]
		>>|cRXP_WARN_5x|r|T134935:0|t[Silver Scarab]
		.collect 20890,1
		.collect 20871,2
		.collect 20864,5
		.collect 20860,5

	-- PALADIN
	step << Paladin
		#label Buy stuff for Silithus Tier
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tBuy the following items for Silithus AQ20 turn in
		>>|cRXP_WARN_The AQ20 quests require reputation with Cenarion Circle (Honored/Revered/Exalted) and items from the raid.|r
		>>|cRXP_BUY_Collect the following items|r:
		>>|cRXP_WARN_1x|r|T134894:0|t[Qiraji Magisterial Ring]
		>>|cRXP_WARN_2x|r|T134910:0|t[Vermillion Idol]
		>>|cRXP_WARN_5x|r|T134929:0|t[Bone Scarab]
		>>|cRXP_WARN_5x|r|T134935:0|t[Silver Scarab]
		.collect 20884,1
		.collect 20872,2
		.collect 20864,5
		.collect 20860,5

		>>|cRXP_WARN_1x|r|T132617:0|t[Qiraji Regal Drape]
		>>|cRXP_WARN_2x|r|T134904:0|t[Obsidian Idol]
		>>|cRXP_WARN_5x|r|T134931:0|t[Clay Scarab]
		>>|cRXP_WARN_5x|r|T134933:0|t[Gold Scarab]
		.collect 20889,1
		.collect 20871,2
		.collect 20863,5
		.collect 20859,5

		>>|cRXP_WARN_1x|r|T134886:0|t[Qiraji Spiked Hilt]
		>>|cRXP_WARN_2x|r|T134897:0|t[Amber Idol]
		>>|cRXP_WARN_5x|r|T2241756:0|t[Ivory Scarab]
		>>|cRXP_WARN_5x|r|T134930:0|t[Bronze Scarab]
		.collect 20886,1
		.collect 20869,2
		.collect 20865,5
		.collect 20861,5

	-- PRIEST
	step << Priest
		#label Buy stuff for Silithus Tier
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tBuy the following items for Silithus AQ20 turn in
		>>|cRXP_WARN_The AQ20 quests require reputation with Cenarion Circle (Honored/Revered/Exalted) and items from the raid.|r
		>>|cRXP_BUY_Collect the following items|r:
		>>|cRXP_WARN_1x|r|T134893:0|t[Qiraji Ceremonial Ring]
		>>|cRXP_WARN_2x|r|T134904:0|t[Obsidian Idol]
		>>|cRXP_WARN_5x|r|T134929:0|t[Bone Scarab]
		>>|cRXP_WARN_5x|r|T134935:0|t[Silver Scarab]
		.collect 20888,1
		.collect 20871,2
		.collect 20864,5
		.collect 20860,5

		>>|cRXP_WARN_1x|r|T134883:0|t[Qiraji Martial Drape]
		>>|cRXP_WARN_2x|r|T134900:0|t[Jasper Idol]
		>>|cRXP_WARN_5x|r|T134931:0|t[Clay Scarab]
		>>|cRXP_WARN_5x|r|T134933:0|t[Gold Scarab]
		.collect 20885,1
		.collect 20870,2
		.collect 20863,5
		.collect 20859,5

		>>|cRXP_WARN_1x|r|T134885:0|t[Qiraji Ornate Hilt]
		>>|cRXP_WARN_2x|r|T134901:0|t[Lambent Idol]
		>>|cRXP_WARN_5x|r|T134930:0|t[Bronze Scarab]
		>>|cRXP_WARN_5x|r|T2241756:0|t[Ivory Scarab]
		.collect 20890,1
		.collect 20868,2
		.collect 20861,5
		.collect 20865,5

	-- ROGUE
	step << Rogue
		#label Buy stuff for Silithus Tier
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tBuy the following items for Silithus AQ20 turn in
		>>|cRXP_WARN_The AQ20 quests require reputation with Cenarion Circle (Honored/Revered/Exalted) and items from the raid.|r
		>>|cRXP_BUY_Collect the following items|r:
		>>|cRXP_WARN_1x|r|T134893:0|t[Qiraji Ceremonial Ring]
		>>|cRXP_WARN_2x|r|T134905:0|t[Onyx Idol]
		>>|cRXP_WARN_5x|r|T134932:0|t[Crystal Scarab]
		>>|cRXP_WARN_5x|r|T134936:0|t[Stone Scarab]
		.collect 20888,1
		.collect 20867,2
		.collect 20862,5
		.collect 20858,5

		>>|cRXP_WARN_1x|r|T134883:0|t[Qiraji Martial Drape]
		>>|cRXP_WARN_2x|r|T134898:0|t[Azure Idol]
		>>|cRXP_WARN_5x|r|T134930:0|t[Bronze Scarab]
		>>|cRXP_WARN_5x|r|T2241756:0|t[Ivory Scarab]
		.collect 20885,1
		.collect 20866,2
		.collect 20861,5
		.collect 20865,5

		>>|cRXP_WARN_1x|r|T134886:0|t[Qiraji Spiked Hilt]
		>>|cRXP_WARN_2x|r|T134910:0|t[Vermillion Idol]
		>>|cRXP_WARN_5x|r|T134931:0|t[Clay Scarab]
		>>|cRXP_WARN_5x|r|T134933:0|t[Gold Scarab]
		.collect 20886,1
		.collect 20872,2
		.collect 20863,5
		.collect 20859,5

	-- SHAMAN
	step << Shaman
		#label Buy stuff for Silithus Tier
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tBuy the following items for Silithus AQ20 turn in
		>>|cRXP_WARN_The AQ20 quests require reputation with Cenarion Circle (Honored/Revered/Exalted) and items from the raid.|r
		>>|cRXP_BUY_Collect the following items|r:
		>>|cRXP_WARN_1x|r|T134894:0|t[Qiraji Magisterial Ring]
		>>|cRXP_WARN_2x|r|T134910:0|t[Vermillion Idol]
		>>|cRXP_WARN_5x|r|T134929:0|t[Bone Scarab]
		>>|cRXP_WARN_5x|r|T134935:0|t[Silver Scarab]
		.collect 20884,1
		.collect 20872,2
		.collect 20864,5
		.collect 20860,5

		>>|cRXP_WARN_1x|r|T132617:0|t[Qiraji Regal Drape]
		>>|cRXP_WARN_2x|r|T134904:0|t[Obsidian Idol]
		>>|cRXP_WARN_5x|r|T134931:0|t[Clay Scarab]
		>>|cRXP_WARN_5x|r|T134933:0|t[Gold Scarab]
		.collect 20889,1
		.collect 20871,2
		.collect 20863,5
		.collect 20859,5

		>>|cRXP_WARN_1x|r|T134886:0|t[Qiraji Spiked Hilt]
		>>|cRXP_WARN_2x|r|T134897:0|t[Amber Idol]
		>>|cRXP_WARN_5x|r|T2241756:0|t[Ivory Scarab]
		>>|cRXP_WARN_5x|r|T134930:0|t[Bronze Scarab]
		.collect 20886,1
		.collect 20869,2
		.collect 20865,5
		.collect 20861,5

	-- WARLOCK
	step << Warlock
		#label Buy stuff for Silithus Tier
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tBuy the following items for Silithus AQ20 turn in
		>>|cRXP_WARN_The AQ20 quests require reputation with Cenarion Circle (Honored/Revered/Exalted) and items from the raid.|r
		>>|cRXP_BUY_Collect the following items|r:
		>>|cRXP_WARN_1x|r|T134893:0|t[Qiraji Ceremonial Ring]
		>>|cRXP_WARN_2x|r|T134900:0|t[Jasper Idol]
		>>|cRXP_WARN_5x|r|T134932:0|t[Crystal Scarab]
		>>|cRXP_WARN_5x|r|T134936:0|t[Stone Scarab]
		.collect 20888,1
		.collect 20870,2
		.collect 20862,5
		.collect 20858,5

		>>|cRXP_WARN_1x|r|T132617:0|t[Qiraji Regal Drape]
		>>|cRXP_WARN_2x|r|T134897:0|t[Amber Idol]
		>>|cRXP_WARN_5x|r|T2241756:0|t[Ivory Scarab]
		>>|cRXP_WARN_5x|r|T134930:0|t[Bronze Scarab]
		.collect 20889,1
		.collect 20869,2
		.collect 20865,5
		.collect 20861,5

		>>|cRXP_WARN_1x|r|T134885:0|t[Qiraji Ornate Hilt]
		>>|cRXP_WARN_2x|r|T134905:0|t[Onyx Idol]
		>>|cRXP_WARN_5x|r|T134931:0|t[Clay Scarab]
		>>|cRXP_WARN_5x|r|T134933:0|t[Gold Scarab]
		.collect 20890,1
		.collect 20867,2
		.collect 20863,5
		.collect 20859,5

	-- WARRIOR
	step << Warrior
		#label Buy stuff for Silithus Tier
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tBuy the following items for Silithus AQ20 turn in
		>>|cRXP_WARN_The AQ20 quests require reputation with Cenarion Circle (Honored/Revered/Exalted) and items from the raid.|r
		>>|cRXP_BUY_Collect the following items|r:
		>>|cRXP_WARN_1x|r|T134894:0|t[Qiraji Magisterial Ring]
		>>|cRXP_WARN_2x|r|T134901:0|t[Lambent Idol]
		>>|cRXP_WARN_5x|r|T134930:0|t[Bronze Scarab]
		>>|cRXP_WARN_5x|r|T2241756:0|t[Ivory Scarab]
		.collect 20884,1
		.collect 20868,2
		.collect 20861,5
		.collect 20865,5

		>>|cRXP_WARN_1x|r|T134883:0|t[Qiraji Martial Drape]
		>>|cRXP_WARN_2x|r|T134905:0|t[Onyx Idol]
		>>|cRXP_WARN_5x|r|T134929:0|t[Bone Scarab]
		>>|cRXP_WARN_5x|r|T134935:0|t[Silver Scarab]
		.collect 20885,1
		.collect 20867,2
		.collect 20864,5
		.collect 20860,5

		>>|cRXP_WARN_1x|r|T134886:0|t[Qiraji Spiked Hilt]
		>>|cRXP_WARN_2x|r|T134896:0|t[Alabaster Idol]
		>>|cRXP_WARN_5x|r|T134932:0|t[Crystal Scarab]
		>>|cRXP_WARN_5x|r|T134936:0|t[Stone Scarab]
		.collect 20886,1
		.collect 20873,2
		.collect 20862,5
		.collect 20858,5


	step
	    #label Buy stuff for Un'Goro Crater
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tBuy the following items for Un'Goro Crater
		>>|cRXP_BUY_Collect the following items|r:
		>>|cRXP_WARN_7x|r|T134130:0|t[Red Power Crystal]
		>>|cRXP_WARN_7x|r|T134136:0|t[Yellow Power Crystal]
		>>|cRXP_WARN_7x|r|T134105:0|t[Green Power Crystal]
		>>|cRXP_WARN_7x|r|T134133:0|t[Blue Power Crystal]
		.collect 11186,7
		.collect 11188,7
		.collect 11185,7
		.collect 11184,7

	step
	    #label Buy stuff for Blasted Lands
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tBuy the following items for Blasted Lands
		>>|cRXP_BUY_Collect the following items|r:
		>>|cRXP_WARN_6x|r|T134343:0|t[Blasted Boar Lung]
		>>|cRXP_WARN_6x|r|T133708:0|t[Scorpok Pincer]
		>>|cRXP_WARN_5x|r|T133972:0|t[Snickerfang Jowl]
		>>|cRXP_WARN_14x|r|T134342:0|t[Vulture Gizzard]
		>>|cRXP_WARN_11x|r|T134340:0|t[Basilisk Brain]
		>>|cRXP_WARN_1x|r|T134089:0|t[Imperfect Draenethyst Fragment]
		>>|cRXP_WARN_1x|r|T134564:0|t[Flawless Draenethyst Sphere]
		.collect 8392,6
		.collect 8393,6
		.collect 8391,5
		.collect 8396,14
		.collect 8394,11
		.collect 10593,1
		.collect 8244,1

	step
	    #label Buy stuff for ZG turnin
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tBuy any |cRXP_FRIENDLY_Hakkari Bijou|r for ZG turn-ins
		>>|cRXP_BUY_Only ONE of the following is needed:|r
		>>|cRXP_WARN_1x|r|T132526:0|t[Blue Hakkari Bijou]
		>>|cRXP_WARN_1x|r|T132531:0|t[Purple Hakkari Bijou]
		>>|cRXP_WARN_1x|r|T132528:0|t[Gold Hakkari Bijou]
		>>|cRXP_WARN_1x|r|T132532:0|t[Red Hakkari Bijou]
		>>|cRXP_WARN_1x|r|T132533:0|t[Silver Hakkari Bijou]
		>>|cRXP_WARN_1x|r|T132527:0|t[Bronze Hakkari Bijou]
		>>|cRXP_WARN_1x|r|T132534:0|t[Yellow Hakkari Bijou]
		>>|cRXP_WARN_1x|r|T132529:0|t[Green Hakkari Bijou]
		>>|cRXP_WARN_1x|r|T132530:0|t[Orange Hakkari Bijou]
		+1 Bijou of any color available
		.isQuestAvailable 8240

	step
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tCollect the following items for EPL quest turn ins.|r
		>>|cRXP_WARN_The quests require reputation with Argent Dawn (Revered/Exalted).|r
		>>|cRXP_BUY_Those items have to be collected via Scourgestone turn ins in the Plaguelands.|r
		>>|cRXP_WARN_36x|r|T133441:0|t[Argent Dawn Valor Token]
		.collect 12844,36

	step
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tCollect the following items for EPL quest turn ins.|r
		>>|cRXP_WARN_Those items have to be collected from the Stratholme dungeon.|r
		>>|cRXP_WARN_5x|r|T134855:0|t[Stratholme Holy Water]
		.collect 13180,5

	step 
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tCollect the following items for Timbermaw Hold quest turn in.|r
		>>|cRXP_WARN_The quests requires reputation with Timbermaw Hold (Neutral+).|r
		>>|cRXP_BUY_Those items have to be collected from the furbolgs in Felwood and Winterspring.|r
		>>|cRXP_WARN_1x|r|T136232:0|t[Deadwood Ritual Totem]
		>>|cRXP_WARN_1x|r|T134865:0|t[Empty Firewater Flask]
		>>|cRXP_WARN_1x|r|T135816:0|t[Winterfall Ritual Totem]
		.collect 20741,1
		.collect 12771,1
		.collect 20742,1

	step << Druid
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tCollect the following item for Druid Moonglade quest turn in.|r
		>>|cRXP_WARN_This items has to be collected from the Diremaul East dungeon.|r
		>>|cRXP_WARN_1x|r|T132884:0|t[Felvine Shard]
		.collect 18501,1
		.isQuestAvailable 5526

	step
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tCollect the following item for Silithus quest turn in.|r
		>>|cRXP_WARN_This items has to be collected from the elite bugs in Silithus.|r
		>>|cRXP_WARN_1x|r|T133463:0|t[Brann Bronzebeard's Lost Letter]
		.collect 20461,1
		.isQuestAvailable 8308

	step
	+Congratz you are now ready for the TBC launch. Make sure to select one of the two turn in guides on launch and pump that Exp!
]])