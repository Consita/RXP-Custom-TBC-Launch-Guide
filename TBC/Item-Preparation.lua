RXPGuides.RegisterGuide([[
#classic
#version 3
#group Consita Classic/TBC Launch Guide
#subgroup 2 - Quest Preparation
#name 2-Item Preparation
#displayname Item Preparation

-- |cRXP_FRIENDLY_, |cRXP_ENEMY_, |cRXP_LOOT_, |cRXP_WARN_, |cRXP_PICK_, |cRXP_BUY_
-- |c99ffff99 OR|r
-- |Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk

    step
     >>Welcome to 

	step	
	    #label Buy Cloth for city-turnins
    	.goto Orgrimmar,55.59,62.92
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thathung|r
		>>|cRXP_BUY_Collect the following items|r:
		>>|cRXP_WARN_300x|r|T132911:0|t[Wool Cloth]
		>>|cRXP_WARN_300x|r|T132905:0|t[Silk Cloth]
		>>|cRXP_WARN_300x|r|T132892:0|t[Mageweave Cloth]
        >>|cRXP_WARN_330x|r|T132903:0|t[Runecloth]
		>>|cRXP_WARN_Buy them from the Auction House if possible|r
		.collect 2592,300 >> Buy 300 Wool Cloth
		.collect 4306,300 >> Buy 300 Silk Cloth
		.collect 4338,300 >> Buy 300 Mageweave Cloth
		.collect 14047,330 >> Buy 330 Runecloth

	step
	    #label Buy stuff for EPL turnin
		.collect 22682,1 >> Buy 1 Frozen Rune
		.collect 12361,1 >> Buy 1 Blue Sapphire
		.collect 12360,1 >> Buy 1 Arcanite Bar
		.collect 12359,2 >> Buy 2 Thorium Bar
		.collect 11128,1 >> Buy 1 Golden Rod
		.collect 10562,8 >> Buy 8 Hi-Explosive Bomb
		.collect 10560,8 >> Buy 8 Unstable Trigger
		.collect 22527,30 >> Buy 30 Core of Elements
		.collect 22525,30 >> Buy 30 Crypt Fiend Parts
		.collect 22526,30 >> Buy 30 Bone Fragments
		.collect 22528,30 >> Buy 30 Dark Iron Scraps
		.collect 22529,30 >> Buy 30 Savage Frond

	step
	    #label Buy stuff for Silithus
    	.collect 20384,200 >> Buy 200 Silithid Carapace Fragment
		.collect 20452,10 >> Buy 10 Smoked Desert Dumplings
		.collect 20404,20 >> Buy 20 Encrypted Twilight Text
		.collect 20513,4 >> Buy 4 Abyssal Crest
		.collect 20514,4 >> Buy 4 Abyssal Signet
		.collect 14344,6 >> Buy 6 Large Brilliant Shard

    step    
	    #label Buy stuff for AQ items
    	.collect	

	AQ20 Weapon + AQ Mats
	AQ20 Cloak + AQ Mats
	AQ20 Ring + AQ Mats


	step
	    #label Buy stuff for Un'Goro Crater
		.collect 11186,7 >> Buy 7 Red Power Crystal
		.collect 11188,7 >> Buy 7 Yellow Power Crystal
		.collect 11185,7 >> Buy 7 Green Power Crystal
		.collect 11184,7 >> Buy 7 Blue Power Crystal

	step
	    #label Buy Stuff for Blasted Lands
		.collect 8392,6 >> Buy 6 Blasted Boar Lung
		.collect 8393,6 >> Buy 6 Scorpok Pincer
		.collect 8391,5 >> Buy 5 Snickerfang Jowl
		.collect 8396,14 >> Buy 14 Vulture Gizzard
		.collect 8394,11 >> Buy 11 Basilisk Brain
		.collect 10593,1 >> Buy 1 Imperfect Draenethyst Fragment
		.collect 8244,1 >> Buy 1 Flawless Draenethyst Sphere

	step
	    #label Buy stuff for ZG turnin
		.collect 19715,1 >> Buy any Bijou

]])