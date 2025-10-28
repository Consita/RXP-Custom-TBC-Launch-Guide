CasualTBCPrep.QuestData = CasualTBCPrep.QuestData or {}

local cachedPlayerClass = nil
local lastLoadedRouteCode = nil

--[Forward Declarations]
CasualTBCPrep.QuestData.UpdateRoutesFromQuestData = nil

--[Data]
local questsMetadata = {
	[4123] = { id=4123, name="The Heart of the Mountain", baseexp=12250, exp=0,  qlvl=55, type="qlog", reqItems="11309-1", routes="Main,Strat,Solo", routeSection="BurningSteppes", areaType="Dungeon", area="Blackrock Depths" },
	[4862] = { id=4862, name="En-Ay-Es-Tee-Why", baseexp=13950, exp=0,  qlvl=59, type="qlog", reqItems="12530-15", routes="Main,Strat,Solo", routeSection="BurningSteppes", areaType="Dungeon", area="Lower Blackrock Spire" },
	[4729] = { id=4729, name="Kibler's Exotic Pets", baseexp=13950, exp=0,  qlvl=59, type="qlog", reqItems="12263-1", routes="Main,Strat,Solo", routeSection="BurningSteppes", areaType="Dungeon", area="Lower Blackrock Spire" },
	[4866] = { id=4866, name="Mother's Milk", baseexp=14300, exp=0,  qlvl=60, type="qlog", routes="Main,Strat,Solo", routeSection="BurningSteppes", areaType="Dungeon", area="Lower Blackrock Spire" },
	[4735] = { id=4735, name="Egg Collection", baseexp=14300, exp=0,  qlvl=60, type="qlog", reqItems="12241-8,12287-1", preQuests="4726,4808,4809,4810,4734", routes="Main,Strat,Solo", routeSection="BurningSteppes", areaType="Dungeon", area="Upper Blackrock Spire" },
	[4768] = { id=4768, name="The Darkstone Tablet", baseexp=14300, exp=0,  qlvl=60, type="qlog", reqItems="12358-1", routes="Main,Strat,Solo", routeSection="Badlands", areaType="Dungeon", area="Upper Blackrock Spire" },
	[4724] = { id=4724, name="The Pack Mistress", baseexp=13950, exp=0,  qlvl=59, type="qlog", routes="Main,Strat,Solo", routeSection="BurningSteppes", areaType="Dungeon", area="Lower Blackrock Spire" },
	[4134] = { id=4134, name="Lost Thunderbrew Recipe", baseexp=12250, exp=0,  qlvl=55, type="qlog", reqItems="11312-1", routes="Main,Strat,Solo", routeSection="Badlands", areaType="Dungeon", area="Blackrock Depths" },
	[4132] = { id=4132, name="Operation: Death to Angerforge", baseexp=13500, exp=0,  qlvl=58, type="qlog", preQuests="4081,4082,4122,4121", routes="Main,Strat,Solo", routeSection="Badlands", areaType="Dungeon", area="Blackrock Depths" },
	[4063] = { id=4063, name="The Rise of the Machines", baseexp=13500, exp=0,  qlvl=58, type="qlog", reqItems="11268-1,11269-10", preQuests="4061,4062,", routes="Main,Strat,Solo", routeSection="Badlands", areaType="Dungeon", area="Blackrock Depths" },
	[8279] = { id=8279, name="The Twilight Lexicon", baseexp=11900, exp=0,  qlvl=60, type="optional", reqItems="20394-1,20395-1,20396-1", preQuests="8284,8285", routes="Main,Strat,Solo", routeSection="SilithusCave", areaType="Zone", area="Silithus" },
	[3907] = { id=3907, name="Disharmony of Fire", baseexp=12650, exp=0,  qlvl=56, type="qlog", reqItems="11126-1", preQuests="3906", routes="Main,Strat,Solo", routeSection="Badlands", areaType="Dungeon", area="Blackrock Depths" },
	[8287] = { id=8287, name="A Terrible Purpose", baseexp=9550, exp=0,  qlvl=60, type="turnin", preQuests="8284,8285,8279", routes="Main,Strat,Solo", routeSection="SilithusHold", areaType="Zone", area="Silithus" },
	[8314] = { id=8314, name="Unraveling the Mystery", baseexp=7150, exp=0,  qlvl=60, type="turnin", preQuests="8304,8309,8310", routes="Main,Strat,Solo", routeSection="SilithusHold", areaType="Zone", area="Silithus" },
	[8306] = { id=8306, name="Into The Maw of Madness", baseexp=11900, exp=0,  qlvl=60, type="optional", preQuests="8304", routes="Main,Strat,Solo", routeSection="SilithusHold", areaType="Zone", area="Silithus" },
	[3961] = { id=3961, name="Linken's Adventure", baseexp=3900, exp=0,  qlvl=54, type="turnin", preQuests="3844,3845,3908,3909,3912,3913,3914,3941,3942,4084,4005", routes="Main,Strat,Solo", routeSection="Ungoro", areaType="Zone", area="Un'Goro" },
	[4788] = { id=4788, name="The Final Tablets", baseexp=13500, exp=0,  qlvl=58, type="qlog", reqItems="12740-1,12741-1", preQuests="3520,3527,4787,3528,5065", routes="Main,Strat,Solo", routeSection="TanarisPort", areaType="Dungeon", area="Lower Blackrock Spire" },
	[8181] = { id=8181, name="Confront Yeh'kinya", baseexp=9000, exp=0,  qlvl=58, type="turnin", preQuests="3520,3527,4787,3528,5065", routes="Main,Strat,Solo", routeSection="TanarisPort", areaType="Zone", area="Tanaris" },
	[8182] = { id=8182, name="The Hand of Rastakhan", baseexp=13500, exp=0,  qlvl=58, type="turnin", preQuests="3520,3527,4787,3528,5065", routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Zone", area="Tanaris" },
	[8201] = { id=8201, name="A Collection of Heads", baseexp=14300, exp=0,  qlvl=60, type="qlog", reqItems="19880-1", routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Raid", area="Zul'Gurub" },
	[4004] = { id=4004, name="The Princess Saved?", baseexp=14300, exp=0,  qlvl=60, type="qlog", preQuests="3906,3981,3982,4001,4002,4003", routes="Main,Strat,Solo", routeSection="Orgrimmar", areaType="Dungeon", area="Blackrock Depths" },
	[4509] = { id=4509, name="Calm Before the Storm", baseexp=790, exp=0,  qlvl=54, type="turnin", preQuests="4494,4496,4507", routes="Main,Strat,Solo", routeSection="Orgrimmar", areaType="Zone", area="Tanaris" },
	[4511] = { id=4511, name="Calm Before the Storm", baseexp=11800, exp=0,  qlvl=54, type="turnin", preQuests="4494,4496,4507", routes="Main,Strat,Solo", routeSection="Orgrimmar", areaType="City", area="Orgrimmar" },
	[6822] = { id=6822, name="The Molten Core", baseexp=14300, exp=0,  qlvl=60, type="qlog", preQuests="6804,6805,6821", replacementQuest=6824, routes="Main,Strat", routeSection="BayOfStorms", areaType="Raid", area="Molten Core" },
	[6823] = { id=6823, name="Agent of Hydraxis", baseexp=14300, exp=0,  qlvl=60, type="turnin", preQuests="6804,6805,6821", reqRep=749, reqRepRank=6, replacementQuest=7486, routes="Main,Strat", routeSection="BayOfStorms", areaType="Raid", area="The Molten Core" },
	[5522] = { id=5522, name="Leonid Barthalomew", baseexp=7150, exp=0,  qlvl=60, type="turnin", preQuests="4726,4808,4809,4810,4734", routes="Main,Strat,Solo", routeSection="EPLTown", areaType="Dungeon", area="Upper Blackrock Spire" },
	[5531] = { id=5531, name="Betina Bigglezink", baseexp=2400, exp=0,  qlvl=60, type="turnin", preQuests="4726,4808,4809,4810,4734", routes="Main,Strat,Solo", routeSection="EPLTown", areaType="Dungeon", area="Upper Blackrock Spire" },
	[5263] = { id=5263, name="Above and Beyond", baseexp=14300, exp=0,  qlvl=60, type="qlog", reqItems="13251-1", preQuests="5251,5262", routes="Main,Strat,Solo", routeSection="EPLTown", areaType="Dungeon", area="Stratholme" },
	[5264] = { id=5264, name="Lord Maxwell Tyrosus", baseexp=9550, exp=0,  qlvl=60, type="turnin", preQuests="5251,5262", routes="Main,Strat,Solo", routeSection="EPLTown", areaType="Dungeon", area="Stratholme" },
	[5265] = { id=5265, name="The Argent Hold", baseexp=14300, exp=0,  qlvl=60, type="turnin", preQuests="5251,5262", routes="Main,Strat,Solo", routeSection="EPLTown", areaType="Dungeon", area="Stratholme" },
	[5529] = { id=5529, name="Plagued Hatchlings", baseexp=13500, exp=0,  qlvl=58, type="qlog", routes="Main,Strat,Solo", routeSection="EPLTown", areaType="Dungeon", area="Scholomance" },
	[5214] = { id=5214, name="The Great Ezra Grimm", baseexp=14300, exp=0,  qlvl=60, type="qlog", reqItems="13172-1", routes="Main,Strat,Solo", routeSection="EPLTown", areaType="Zone", area="Stratholme" },
	[5212] = { id=5212, name="The Flesh Does Not Lie", baseexp=14300, exp=0,  qlvl=60, type="qlog", reqItems="13174-10", replacementQuest=5213, routes="Main,Strat,Solo", routeSection="EPLTown", areaType="Zone", area="Stratholme" },
	[5721] = { id=5721, name="The Battle of Darrowshire", baseexp=11900, exp=0,  qlvl=60, type="qlog", preQuests="5149,5152,5153,5154,5210,5181,5168,5206,5941", routes="Main,Strat,Solo", routeSection="EPLDarrowshire", areaType="Zone", area="The Plaguelands" },
	[5942] = { id=5942, name="Hidden Treasures", baseexp=14300, exp=0,  qlvl=60, type="turnin", preQuests="5149,5152,5153,5154,5210,5181,5168,5206,5941", routes="Main,Strat,Solo", routeSection="EPLDarrowshire", areaType="Zone", area="Eastern Plaguelands" },
	[6163] = { id=6163, name="Ramstein", baseexp=14300, exp=0,  qlvl=60, type="qlog", reqItems="15880-1", preQuests="6022,6042,6133,6135,6136", routes="Main,Strat,Solo", routeSection="EPLNathanos", areaType="Dungeon", area="Stratholme" },
	[5846] = { id=5846, name="Of Love and Family", baseexp=9000, exp=0,  qlvl=58, type="turnin", preQuests="5542,5543,5544,5742,5781,5845", routes="Strat", routeSection="WPLCaerDarrow", area="Eastern Plaguelands" },
	[5848] = { id=5848, name="Of Love and Family", baseexp=14300, exp=0,  qlvl=60, type="qlog", reqItems="14679-1", preQuests="5542,5543,5544,5742,5781,5845,5846", routes="Main,Strat,Solo", routeSection="EPLTirion", areaType="Dungeon", area="Stratholme" },
	[5861] = { id=5861, name="Find Myranda", baseexp=7150, exp=0,  qlvl=60, type="turnin", preQuests="5542,5543,5544,5742,5781,5845,5846", routes="Main,Strat,Solo", routeSection="WPLSorrowAndorhal", areaType="Zone", area="Eastern Plaguelands" },
	[5236] = { id=5236, name="Return to the Bulwark", baseexp=4500, exp=0,  qlvl=58, type="turnin", preQuests="5096,5228,5229,5230,5231,5232,5233,5234,5235", routes="Main,Strat,Solo", routeSection="WPLBulwark", areaType="Zone", area="Western Plaguelands" },
	[5238] = { id=5238, name="Mission Accomplished!", baseexp=13500, exp=0,  qlvl=58, type="turnin", preQuests="5096,5228,5229,5230,5231,5232,5233,5234,5235", routes="Main,Strat,Solo", routeSection="WPLBulwark", areaType="Zone", area="Western Plaguelands" },
	[5511] = { id=5511, name="The Key to Scholomance", baseexp=14300, exp=0,  qlvl=60, type="turnin", preQuests="5096,5098,838,964,5514,5802,5804", routes="Main,Strat,Solo", routeSection="WPLBulwark", areaType="Zone", area="Western Plaguelands" },
	[5341] = { id=5341, name="Barov Family Fortune", baseexp=14300, exp=0,  qlvl=60, type="qlog", reqItems="13471-1,13448-1,13450-1,13451-1", replacementQuest=5342, routes="Main,Strat,Solo", routeSection="WPLBulwark", areaType="Dungeon", area="Scholomance" },
	[105] = { id=105, name="Alas, Andorhal", baseexp=11900, exp=0,  qlvl=60, type="optional", reqItems="17114-1", preQuests="5096,5098", routes="Main,Strat,Solo", routeSection="WPLBulwark", areaType="Zone", area="Western Plaguelands" },
	[2702] = { id=2702, name="Heroes of Old", baseexp=4350, exp=0,  qlvl=57, type="turnin", preQuests="2784,2621,2622,2623,2801,2681", routes="Main,Strat,Solo", routeSection="oldhero", areaType="Zone", area="Swamp of Sorrows" },
	[2701] = { id=2701, name="Heroes of Old", baseexp=8750, exp=0,  qlvl=57, type="turnin", preQuests="2784,2621,2622,2623,2801,2681", routes="Main,Strat,Solo", routeSection="oldhero", areaType="Zone", area="Swamp of Sorrows" },
	[5213] = { id=5213, name="The Active Agent", baseexp=14300, exp=0,  qlvl=60, type="optional", reqItems="13176-1", preQuests="5212", routes="Main,Strat,Solo", routeSection="EPLTown", areaType="Dungeon", area="Stratholme" },
	[6148] = { id=6148, name="The Scarlet Oracle, Demetria", baseexp=11900, exp=0,  qlvl=60, type="optional", preQuests="6022,6042,6133,6135,6136,6144,6145,6146,6147", routes="Main,Strat,Solo", routeSection="EPLNathanos", areaType="Zone", area="Eastern Plaguelands" },
	[5342] = { id=5342, name="The Last Barov", baseexp=11900, exp=0,  qlvl=60, type="optional", reqItems="13469-1", preQuests="5341", routes="Main,Strat,Solo", routeSection="WPLBulwark", areaType="Zone", area="Western Plaguelands" },
	[5462] = { id=5462, name="The Dying, Ras Frostwhisper", baseexp=7150, exp=0,  qlvl=60, type="turnin", preQuests="5382,5515,5384,5461", routes="Strat", routeSection="EPLTown2", areaType="Zone", area="Western Plaguelands" },
	[5463] = { id=5463, name="Menethil's Gift", baseexp=14300, exp=0,  qlvl=60, type="turnin", preQuests="5382,5515,5384,5461,5462", routes="Strat", routeSection="StratholmeBackdoor", areaType="Dungeon", area="Stratholme" },
	[5464] = { id=5464, name="Menethil's Gift", baseexp=11900, exp=0,  qlvl=60, type="optional", reqItems="13624-1", preQuests="5382,5515,5384,5461,5462,5463", routes="Main,Strat,Solo", routeSection="EPLTown", areaType="Dungeon", area="Stratholme" },
	[8283] = { id=8283, name="Wanted - Deathclasp, Terror of the Sands", baseexp=11600, exp=0,  qlvl=59, type="optional", reqItems="20385-1", routes="Main,Strat,Solo", routeSection="SilithusHold", areaType="Zone", area="Silithus" },
	[9444] = { id=9444, name="Defiling Uther's Tomb", baseexp=11250, exp=0,  qlvl=58, type="optional", reqItems="23691-1", preQuests="9443", routes="Main,Strat,Solo", routeSection="WPLBulwark", areaType="Zone", area="Western Plaguelands" },
	[2681] = { id=2681, name="The Stones That Bind Us", baseexp=10900, exp=0,  qlvl=57, type="optional", preQuests="2784,2621,2622,2623,2801", routes="Main,Strat,Solo", routeSection="oldhero", areaType="Zone", area="Blasted Lands" },
	[9229] = { id=9229, name="The Fate of Ramaladni", baseexp=9550, exp=0,  qlvl=60, type="optional", reqItems="22708-1", routes="Main,Strat,Solo", routeSection="EPLTown", areaType="Raid", area="Naxxramas" },
	[8310] = { id=8310, name="Breaking the Code", baseexp=9550, exp=0,  qlvl=60, type="optional", reqItems="20457-1,20458-1,20459-1", preQuests="8304", routes="Main,Strat,Solo", routeSection="SilithusSouth", areaType="Zone", area="Silithus" },
	[8309] = { id=8309, name="Glyph Chasing", baseexp=9550, exp=0,  qlvl=60, type="optional", reqItems="20453-1,20455-1,20454-1,20456-1", preQuests="8304", routes="Main,Strat,Solo", routeSection="SilithusSouth", areaType="Zone", area="Silithus" },
	[8288] = { id=8288, name="Only One May Rise", baseexp=9550, exp=0,  qlvl=60, type="optional", reqItems="20383-1", preQuests="8286", routes="Main,Strat,Solo", routeSection="SilithusHold", areaType="Raid", area="Blackwing Lair" },
	[6024] = { id=6024, name="Hameya's Plea", baseexp=9550, exp=0,  qlvl=60, type="optional", reqItems="15767-1", routes="Main,Strat,Solo", routeSection="EPLNathanos", areaType="Zone", area="Eastern Plaguelands" },
	[9665] = { id=9665, name="Bolstering Our Defenses", baseexp=9550, exp=0,  qlvl=60, type="optional", routes="Main,Strat,Solo", routeSection="EPLTown", areaType="Zone", area="Eastern Plaguelands" },
	[8321] = { id=8321, name="Vyral the Vile", baseexp=9550, exp=0,  qlvl=60, type="optional", reqItems="20466-1", preQuests="8320", routes="Main,Strat,Solo", routeSection="SilithusHold", areaType="Zone", area="Silithus" },
	[9023] = { id=9023, name="The Perfect Poison", baseexp=9550, exp=0,  qlvl=60, type="optional", reqItems="22217-1,22216-1", routes="Main,Strat,Solo", routeSection="SilithusHold", areaType="Raid", area="AQ20 & ZG" },
	[7820] = { id=7820, name="A Donation of Wool", baseexp=960, exp=0,  qlvl=60, type="turnin", reqItems="2592-60", routes="Main,Strat,Solo", routeSection="ThunderBluff", areaType="City", area="Thunder Bluff" },
	[7821] = { id=7821, name="A Donation of Silk", baseexp=2400, exp=0,  qlvl=60, type="turnin", reqItems="4306-60", routes="Main,Strat,Solo", routeSection="ThunderBluff", areaType="City", area="Thunder Bluff" },
	[7822] = { id=7822, name="A Donation of Mageweave", baseexp=4750, exp=0,  qlvl=60, type="turnin", reqItems="4338-60", routes="Main,Strat,Solo", routeSection="ThunderBluff", areaType="City", area="Thunder Bluff" },
	[7823] = { id=7823, name="A Donation of Runecloth", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="14047-60", routes="Main,Strat,Solo", routeSection="ThunderBluff", areaType="City", area="Thunder Bluff" },
	[7813] = { id=7813, name="A Donation of Wool", baseexp=960, exp=0,  qlvl=60, type="turnin", reqItems="2592-60", routes="Main,Strat,Solo", routeSection="Undercity", areaType="City", area="Undercity" },
	[7814] = { id=7814, name="A Donation of Silk", baseexp=2400, exp=0,  qlvl=60, type="turnin", reqItems="4306-60", routes="Main,Strat,Solo", routeSection="Undercity", areaType="City", area="Undercity" },
	[7817] = { id=7817, name="A Donation of Mageweave", baseexp=4750, exp=0,  qlvl=60, type="turnin", reqItems="4338-60", routes="Main,Strat,Solo", routeSection="Undercity", areaType="City", area="Undercity" },
	[7818] = { id=7818, name="A Donation of Runecloth", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="14047-60", routes="Main,Strat,Solo", routeSection="Undercity", areaType="City", area="Undercity" },
	[10359] = { id=10359, name="A Donation of Wool", baseexp=960, exp=0,  qlvl=60, type="turnin", reqItems="2592-60", routes="Main,Strat,Solo", routeSection="SilvermoonCity", areaType="City", area="Silvermoon City" },
	[10360] = { id=10360, name="A Donation of Silk", baseexp=2400, exp=0,  qlvl=60, type="turnin", reqItems="4306-60", routes="Main,Strat,Solo", routeSection="SilvermoonCity", areaType="City", area="Silvermoon City" },
	[10361] = { id=10361, name="A Donation of Mageweave", baseexp=4750, exp=0,  qlvl=60, type="turnin", reqItems="4338-60", routes="Main,Strat,Solo", routeSection="SilvermoonCity", areaType="City", area="Silvermoon City" },
	[10362] = { id=10362, name="A Donation of Runecloth", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="14047-60", routes="Main,Strat,Solo", routeSection="SilvermoonCity", areaType="City", area="Silvermoon City" },
	[7833] = { id=7833, name="A Donation of Wool", baseexp=960, exp=0,  qlvl=60, type="turnin", reqItems="2592-60", routes="Main,Strat,Solo", routeSection="Orgrimmar", areaType="City", area="Orgrimmar" },
	[7834] = { id=7834, name="A Donation of Silk", baseexp=2400, exp=0,  qlvl=60, type="turnin", reqItems="4306-60", routes="Main,Strat,Solo", routeSection="Orgrimmar", areaType="City", area="Orgrimmar" },
	[7835] = { id=7835, name="A Donation of Mageweave", baseexp=4750, exp=0,  qlvl=60, type="turnin", reqItems="4338-60", routes="Main,Strat,Solo", routeSection="Orgrimmar", areaType="City", area="Orgrimmar" },
	[7836] = { id=7836, name="A Donation of Runecloth", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="14047-60", routes="Main,Strat,Solo", routeSection="Orgrimmar", areaType="City", area="Orgrimmar" },
	[7826] = { id=7826, name="A Donation of Wool", baseexp=960, exp=0,  qlvl=60, type="turnin", reqItems="2592-60", routes="Main,Strat,Solo", routeSection="Orgrimmar", areaType="City", area="Orgrimmar" },
	[7827] = { id=7827, name="A Donation of Silk", baseexp=2400, exp=0,  qlvl=60, type="turnin", reqItems="4306-60", routes="Main,Strat,Solo", routeSection="Orgrimmar", areaType="City", area="Orgrimmar" },
	[7831] = { id=7831, name="A Donation of Mageweave", baseexp=4750, exp=0,  qlvl=60, type="turnin", reqItems="4338-60", routes="Main,Strat,Solo", routeSection="Orgrimmar", areaType="City", area="Orgrimmar" },
	[7824] = { id=7824, name="A Donation of Runecloth", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="14047-60", routes="Main,Strat,Solo", routeSection="Orgrimmar", areaType="City", area="Orgrimmar" },
	[9120] = { id=9120, name="The Fall of Kel'Thuzad", baseexp=14300, exp=0,  qlvl=60, type="turnin", reqItems="22520-1", routes="Main,Strat,Solo", routeSection="EPLTown", areaType="Raid", area="Naxxramas" },
	[6026] = { id=6026, name="That's Asking A Lot", baseexp=9000, exp=0,  qlvl=58, type="turnin", reqItems="11128-1,12359-2,10562-8,10560-8", routes="Main,Strat,Solo", routeSection="EPLTown", areaType="Zone", area="Eastern Plaguelands" },
	[9128] = { id=9128, name="The Elemental Equation", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="22527-30", routes="Main,Strat,Solo", routeSection="EPLTown", areaType="Zone", area="Eastern Plaguelands" },
	[9124] = { id=9124, name="Cryptstalker Armor Doesn't Make Itself...", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="22525-30", routes="Main,Strat,Solo", routeSection="EPLTown", areaType="Zone", area="Eastern Plaguelands" },
	[9126] = { id=9126, name="Bonescythe Digs", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="22526-30", routes="Main,Strat,Solo", routeSection="EPLTown", areaType="Zone", area="Eastern Plaguelands" },
	[9131] = { id=9131, name="Binding the Dreadnaught", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="22528-30", routes="Main,Strat,Solo", routeSection="EPLTown", areaType="Zone", area="Eastern Plaguelands" },
	[9136] = { id=9136, name="Savage Flora", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="22529-30", routes="Main,Strat,Solo", routeSection="EPLTown", areaType="Zone", area="Eastern Plaguelands" },
	[5243] = { id=5243, name="Houses of the Holy", baseexp=14300, exp=0,  qlvl=60, type="turnin", reqItems="13180-5", routes="Main,Strat,Solo", routeSection="EPLTown", areaType="Dungeon", area="Stratholme" },
	[9141] = { id=9141, name="They Call Me \"The Rooster\"", baseexp=4750, exp=0,  qlvl=60, type="turnin", reqItems="12844-1", routes="Main,Strat,Solo", routeSection="EPLTown", areaType="Zone", area="Eastern Plaguelands" },
	[5513] = { id=5513, name="Mantles of the Dawn", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="12844-10", reqRep=529, reqRepRank=7, routes="Main,Strat,Solo", routeSection="EPLTown", areaType="Zone", area="Eastern Plaguelands" },
	[5517] = { id=5517, name="Chromatic Mantle of the Dawn", baseexp=11900, exp=0,  qlvl=60, type="turnin", reqItems="12844-25", reqRep=529, reqRepRank=8, routes="Main,Strat,Solo", routeSection="EPLTown", areaType="Zone", area="Eastern Plaguelands" },
	[9232] = { id=9232, name="The Only Song I Know...", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="22682-2,7080-2,12361-2", preQuests="9033", routes="Main,Strat,Solo", routeSection="EPLTown", areaType="Raid", area="Naxxramas" },
	[9230] = { id=9230, name="Ramaladni's Icy Grasp", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="22682-1,12361-1,12360-1", preQuests="9033,9229", routes="Main,Strat,Solo", routeSection="EPLTown", areaType="Raid", area="Naxxramas" },
	[7490] = { id=7490, name="Victory for the Horde", baseexp=14300, exp=0,  qlvl=60, type="turnin", reqItems="18422-1", routes="Main,Strat,Solo", routeSection="Orgrimmar", areaType="Raid", area="Onyxia's Lair" },
	[7491] = { id=7491, name="For All To See", baseexp=14300, exp=0,  qlvl=60, type="turnin", reqItems="18422-1", ignoreReqItemsForPrep=1, routes="Main,Strat,Solo", routeSection="Orgrimmar", areaType="Raid", area="Onyxia's Lair" },
	[7783] = { id=7783, name="The Lord of Blackrock", baseexp=14300, exp=0,  qlvl=60, type="turnin", reqItems="19002-1", routes="Main,Strat,Solo", routeSection="Orgrimmar", areaType="Raid", area="Blackwing Lair" },
	[7784] = { id=7784, name="The Lord of Blackrock", baseexp=14300, exp=0,  qlvl=60, type="turnin", reqItems="19002-1", ignoreReqItemsForPrep=1, routes="Main,Strat,Solo", routeSection="Orgrimmar", areaType="Raid", area="Blackwing Lair" },
	[8978] = { id=8978, name="Return to Mokvar", baseexp=9550, exp=0,  qlvl=60, type="turnin", preQuests="OVERWRITTEN_IN_ADDON", routes="Main,Strat,Solo", routeSection="Orgrimmar", areaType="Zone", area="Tanaris" },
	[8944] = { id=8944, name="Just Compensation", baseexp=14300, exp=0,  qlvl=60, type="turnin", reqItems="16736-1,16737-1", preQuests="8920,8923,8921,8924,8925,8928", playerClass="WARRIOR", routes="Main,Strat,Solo", routeSection="Orgrimmar", areaType="City", area="Orgrimmar" },
	[8927] = { id=8927, name="Just Compensation", baseexp=14300, exp=0,  qlvl=60, type="turnin", reqItems="16716-1,16717-1", preQuests="8913,8923,8921,8924,8925,8928", playerClass="DRUID", routes="Main,Strat,Solo", routeSection="Orgrimmar", areaType="City", area="Orgrimmar" },
	[8939] = { id=8939, name="Just Compensation", baseexp=14300, exp=0,  qlvl=60, type="turnin", reqItems="16685-1,16684-1", preQuests="8915,8923,8921,8924,8925,8928", playerClass="MAGE", routes="Main,Strat,Solo", routeSection="Orgrimmar", areaType="City", area="Orgrimmar" },
	[8943] = { id=8943, name="Just Compensation", baseexp=14300, exp=0,  qlvl=60, type="turnin", reqItems="16702-1,16705-1", preQuests="8919,8923,8921,8924,8925,8928", playerClass="WARLOCK", routes="Main,Strat,Solo", routeSection="Orgrimmar", areaType="City", area="Orgrimmar" },
	[8940] = { id=8940, name="Just Compensation", baseexp=14300, exp=0,  qlvl=60, type="turnin", reqItems="16696-1,16692-1", preQuests="8916,8923,8921,8924,8925,8928", playerClass="PRIEST", routes="Main,Strat,Solo", routeSection="Orgrimmar", areaType="City", area="Orgrimmar" },
	[8942] = { id=8942, name="Just Compensation", baseexp=14300, exp=0,  qlvl=60, type="turnin", reqItems="16673-1,16672-1", preQuests="8918,8923,8921,8924,8925,8928", playerClass="SHAMAN", routes="Main,Strat,Solo", routeSection="Orgrimmar", areaType="City", area="Orgrimmar" },
	[10495] = { id=10495, name="Just Compensation", baseexp=14300, exp=0,  qlvl=60, type="turnin", reqItems="16723-1,16724-1", preQuests="10493,8923,8921,8924,8925,8928", playerClass="PALADIN", routes="Main,Strat,Solo", routeSection="Orgrimmar", areaType="City", area="Orgrimmar" },
	[8938] = { id=8938, name="Just Compensation", baseexp=14300, exp=0,  qlvl=60, type="turnin", reqItems="16680-1,16676-1", preQuests="8914,8923,8921,8924,8925,8928", playerClass="HUNTER", routes="Main,Strat,Solo", routeSection="Orgrimmar", areaType="City", area="Orgrimmar" },
	[8941] = { id=8941, name="Just Compensation", baseexp=14300, exp=0,  qlvl=60, type="turnin", reqItems="16713-1,16712-1", preQuests="8917,8923,8921,8924,8925,8928", playerClass="ROGUE", routes="Main,Strat,Solo", routeSection="Orgrimmar", areaType="City", area="Orgrimmar" },
	[8802] = { id=8802, name="The Savior of Kalimdor", baseexp=14300, exp=0,  qlvl=60, type="qlog", reqItems="21221-1", preQuests="8801", routes="Main,Strat,Solo", routeSection="CavernsOfTime", areaType="Raid", area="Temple of Ahn'Qiraj" },
	[8301] = { id=8301, name="The Path of the Righteous", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="20384-200", preQuests="8286,8288", routes="Main,Strat,Solo", routeSection="SilithusHold", areaType="Raid", area="Blackwing Lair" },
	[8791] = { id=8791, name="The Fall of Ossirian", baseexp=14300, exp=0,  qlvl=60, type="turnin", reqItems="21220-1", routes="Main,Strat,Solo", routeSection="SilithusHold", areaType="Raid", area="Ruins of Ahn'Qiraj" },
	[8317] = { id=8317, name="Kitchen Assistance", baseexp=4350, exp=0,  qlvl=57, type="turnin", reqItems="20452-10", preQuests="8307,8313", reqProf=185, reqProfSkill=285, routes="Main,Strat,Solo", routeSection="SilithusHold", areaType="Zone", area="Silithus" },
	[8308] = { id=8308, name="Brann Bronzebeard's Lost Letter", baseexp=11900, exp=0,  qlvl=60, type="turnin", reqItems="20461-1", routes="Main,Strat,Solo", routeSection="SilithusSouth", areaType="Zone", area="Silithus" },
	[8323] = { id=8323, name="True Believers", baseexp=9300, exp=0,  qlvl=59, type="turnin", reqItems="20404-10", preQuests="8284,8285", routes="Main,Strat,Solo", routeSection="SilithusSouth", areaType="Zone", area="Silithus" },
	[8318] = { id=8318, name="Secret Communication", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="20404-10", routes="Main,Strat,Solo", routeSection="SilithusCave", areaType="Zone", area="Silithus" },
	[8361] = { id=8361, name="Abyssal Contacts", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="20513-1", reqRep=609, reqRepRank=6, routes="Main,Strat,Solo", routeSection="SilithusHold", areaType="Zone", area="Silithus" },
	[8332] = { id=8332, name="Dukes of the Council", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="20513-3,14344-1", reqRep=609, reqRepRank=6, routes="Main,Strat,Solo", routeSection="SilithusHold", areaType="Zone", area="Silithus" },
	[8341] = { id=8341, name="Lords of the Council", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="20514-3,14344-5", reqRep=609, reqRepRank=7, routes="Main,Strat,Solo", routeSection="SilithusHold", areaType="Zone", area="Silithus" },
	[8348] = { id=8348, name="Signet of the Dukes", baseexp=11900, exp=0,  qlvl=60, type="turnin", reqItems="20514-1", reqRep=609, reqRepRank=7, routes="Main,Strat,Solo", routeSection="SilithusHold", areaType="Zone", area="Silithus" },
	[8352] = { id=8352, name="Scepter of the Council", baseexp=14300, exp=0,  qlvl=60, type="turnin", reqItems="20515-1", reqRep=609, reqRepRank=7, routes="Main,Strat,Solo", routeSection="SilithusHold", areaType="Zone", area="Silithus" },
	[9248] = { id=9248, name="Humble Offering", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="20515-1", reqRep=609, reqRepRank=6, routes="Main,Strat,Solo", routeSection="SilithusHold", areaType="Zone", area="Silithus" },
	[8711] = { id=8711, name="Blade of Eternal Justice", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="20886-1,20869-2,20861-5,20865-5", playerClass="PALADIN", reqRep=609, reqRepRank=8, routes="Main,Strat,Solo", routeSection="SilithusHold", areaType="Raid", area="Ruins of Ahn'Qiraj" },
	[8709] = { id=8709, name="Dagger of Veiled Shadows", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="20886-1,20872-1,20859-5,20863-5", playerClass="ROGUE", reqRep=609, reqRepRank=8, routes="Main,Strat,Solo", routeSection="SilithusHold", areaType="Raid", area="Ruins of Ahn'Qiraj" },
	[8706] = { id=8706, name="Hammer of the Gathering Storm", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="20886-1,20869-2,20861-5,20865-5", playerClass="SHAMAN", reqRep=609, reqRepRank=8, routes="Main,Strat,Solo", routeSection="SilithusHold", areaType="Raid", area="Ruins of Ahn'Qiraj" },
	[8712] = { id=8712, name="Scythe of the Unseen Path", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="20886-1,20866-2,20860-5,20864-5", playerClass="HUNTER", reqRep=609, reqRepRank=8, routes="Main,Strat,Solo", routeSection="SilithusHold", areaType="Raid", area="Ruins of Ahn'Qiraj" },
	[8558] = { id=8558, name="Sickle of Unyielding Strength", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="20886-1,20873-2,20862-5,20858-5", playerClass="WARRIOR", reqRep=609, reqRepRank=8, routes="Main,Strat,Solo", routeSection="SilithusHold", areaType="Raid", area="Ruins of Ahn'Qiraj" },
	[8707] = { id=8707, name="Blade of Vaulted Secrets", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="20890-1,20871-2,20860-5,20864-5", playerClass="MAGE", reqRep=609, reqRepRank=8, routes="Main,Strat,Solo", routeSection="SilithusHold", areaType="Raid", area="Ruins of Ahn'Qiraj" },
	[8705] = { id=8705, name="Gavel of Infinite Wisdom", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="20890-1,20868-2,20861-5,20865-5", playerClass="PRIEST", reqRep=609, reqRepRank=8, routes="Main,Strat,Solo", routeSection="SilithusHold", areaType="Raid", area="Ruins of Ahn'Qiraj" },
	[8710] = { id=8710, name="Kris of Unspoken Names", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="20890-1,20867-2,20859-5,20863-5", playerClass="WARLOCK", reqRep=609, reqRepRank=8, routes="Main,Strat,Solo", routeSection="SilithusHold", areaType="Raid", area="Ruins of Ahn'Qiraj" },
	[8708] = { id=8708, name="Mace of Unending Life", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="20890-1,20870-2,20862-5,20858-5", playerClass="DRUID", reqRep=609, reqRepRank=8, routes="Main,Strat,Solo", routeSection="SilithusHold", areaType="Raid", area="Ruins of Ahn'Qiraj" },
	[8693] = { id=8693, name="Cloak of Veiled Shadows", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="20885-1,20866-2,20861-5,20865-5", playerClass="ROGUE", reqRep=609, reqRepRank=7, routes="Main,Strat,Solo", routeSection="SilithusHold", areaType="Raid", area="Ruins of Ahn'Qiraj" },
	[8557] = { id=8557, name="Drape of Unyielding Strength", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="20885-1,20867-2,20864-5,20860-5", playerClass="WARRIOR", reqRep=609, reqRepRank=7, routes="Main,Strat,Solo", routeSection="SilithusHold", areaType="Raid", area="Ruins of Ahn'Qiraj" },
	[8691] = { id=8691, name="Drape of Vaulted Secrets", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="20885-1,20873-2,20858-5,20862-5", playerClass="MAGE", reqRep=609, reqRepRank=7, routes="Main,Strat,Solo", routeSection="SilithusHold", areaType="Raid", area="Ruins of Ahn'Qiraj" },
	[8689] = { id=8689, name="Shroud of Infinite Wisdom", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="20885-1,20870-2,20859-5,20863-5", playerClass="PRIEST", reqRep=609, reqRepRank=7, routes="Main,Strat,Solo", routeSection="SilithusHold", areaType="Raid", area="Ruins of Ahn'Qiraj" },
	[8694] = { id=8694, name="Shroud of Unspoken Names", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="20889-1,20869-2,20861-5,20865-5", playerClass="WARLOCK", reqRep=609, reqRepRank=7, routes="Main,Strat,Solo", routeSection="SilithusHold", areaType="Raid", area="Ruins of Ahn'Qiraj" },
	[8692] = { id=8692, name="Cloak of Unending Life", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="20889-1,20872-2,20864-5,20860-5", playerClass="DRUID", reqRep=609, reqRepRank=7, routes="Main,Strat,Solo", routeSection="SilithusHold", areaType="Raid", area="Ruins of Ahn'Qiraj" },
	[8696] = { id=8696, name="Cloak of the Unseen Path", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="20889-1,20868-2,20858-5,20862-5", playerClass="HUNTER", reqRep=609, reqRepRank=7, routes="Main,Strat,Solo", routeSection="SilithusHold", areaType="Raid", area="Ruins of Ahn'Qiraj" },
	[8690] = { id=8690, name="Cloak of the Gathering Storm", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="20889-1,20871-2,20863-5,20859-5", playerClass="SHAMAN", reqRep=609, reqRepRank=7, routes="Main,Strat,Solo", routeSection="SilithusHold", areaType="Raid", area="Ruins of Ahn'Qiraj" },
	[8695] = { id=8695, name="Cape of Eternal Justice", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="20889-1,20871-2,20859-5,20863-5", playerClass="PALADIN", reqRep=609, reqRepRank=7, routes="Main,Strat,Solo", routeSection="SilithusHold", areaType="Raid", area="Ruins of Ahn'Qiraj" },
	[8697] = { id=8697, name="Ring of Infinite Wisdom", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="20888-1,20871-2,20860-5,20864-5", playerClass="PRIEST", reqRep=609, reqRepRank=6, routes="Main,Strat,Solo", routeSection="SilithusHold", areaType="Raid", area="Ruins of Ahn'Qiraj" },
	[8702] = { id=8702, name="Ring of Unspoken Names", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="20888-1,20870-2,20858-5,20862-5", playerClass="WARLOCK", reqRep=609, reqRepRank=6, routes="Main,Strat,Solo", routeSection="SilithusHold", areaType="Raid", area="Ruins of Ahn'Qiraj" },
	[8701] = { id=8701, name="Band of Veiled Shadows", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="20888-1,20867-2,20858-5,20862-5", playerClass="ROGUE", reqRep=609, reqRepRank=6, routes="Main,Strat,Solo", routeSection="SilithusHold", areaType="Raid", area="Ruins of Ahn'Qiraj" },
	[8704] = { id=8704, name="Signet of the Unseen Path", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="20888-1,20869-2,20859-5,20863-5", playerClass="HUNTER", reqRep=609, reqRepRank=6, routes="Main,Strat,Solo", routeSection="SilithusHold", areaType="Raid", area="Ruins of Ahn'Qiraj" },
	[8699] = { id=8699, name="Band of Vaulted Secrets", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="20884-1,20866-2,20859-5,20863-5", playerClass="MAGE", reqRep=609, reqRepRank=6, routes="Main,Strat,Solo", routeSection="SilithusHold", areaType="Raid", area="Ruins of Ahn'Qiraj" },
	[8700] = { id=8700, name="Band of Unending Life", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="20884-1,20873-2,20861-5,20865-5", playerClass="DRUID", reqRep=609, reqRepRank=6, routes="Main,Strat,Solo", routeSection="SilithusHold", areaType="Raid", area="Ruins of Ahn'Qiraj" },
	[8698] = { id=8698, name="Ring of the Gathering Storm", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="20884-1,20872-2,20860-5,20864-5", playerClass="SHAMAN", reqRep=609, reqRepRank=6, routes="Main,Strat,Solo", routeSection="SilithusHold", areaType="Raid", area="Ruins of Ahn'Qiraj" },
	[8556] = { id=8556, name="Signet of Unyielding Strength", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="20884-1,20868-2,20861-5,20865-5", playerClass="WARRIOR", reqRep=609, reqRepRank=6, routes="Main,Strat,Solo", routeSection="SilithusHold", areaType="Raid", area="Ruins of Ahn'Qiraj" },
	[8703] = { id=8703, name="Ring of Eternal Justice", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="20884-1,20872-2,20860-5,20864-5", playerClass="PALADIN", reqRep=609, reqRepRank=6, routes="Main,Strat,Solo", routeSection="SilithusHold", areaType="Raid", area="Ruins of Ahn'Qiraj" },
	[8183] = { id=8183, name="The Heart of Hakkar", baseexp=14300, exp=0,  qlvl=60, type="turnin", reqItems="19802-1", routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Raid", area="Zul'Gurub" },
	[8240] = { id=8240, name="A Bijou for Zanza", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="19708-1,19713-1,19715-1,19711-1,19710-1,19712-1,19707-1,19714-1,19709-1", reqAnyItem=1, routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Zone", area="Stranglethorn Vale" },
	[8145] = { id=8145, name="The Maelstrom's Tendril", baseexp=9550, exp=0,  qlvl=60, type="turnin", playerClass="HUNTER", reqRep=270, reqRepRank=5, routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Raid", area="Zul'Gurub" },
	[8146] = { id=8146, name="The Maelstrom's Tendril", baseexp=9550, exp=0,  qlvl=60, type="turnin", playerClass="HUNTER", reqRep=270, reqRepRank=6, routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Raid", area="Zul'Gurub" },
	[8147] = { id=8147, name="The Maelstrom's Tendril", baseexp=9550, exp=0,  qlvl=60, type="turnin", playerClass="HUNTER", reqRep=270, reqRepRank=7, routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Raid", area="Zul'Gurub" },
	[8148] = { id=8148, name="Maelstrom's Wrath", baseexp=9550, exp=0,  qlvl=60, type="turnin", playerClass="HUNTER", reqRep=270, reqRepRank=8, routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Raid", area="Zul'Gurub" },
	[8041] = { id=8041, name="Strength of Mount Mugamba", baseexp=9550, exp=0,  qlvl=60, type="turnin", playerClass="WARRIOR", reqRep=270, reqRepRank=5, routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Raid", area="Zul'Gurub" },
	[8042] = { id=8042, name="Strength of Mount Mugamba", baseexp=9550, exp=0,  qlvl=60, type="turnin", playerClass="WARRIOR", reqRep=270, reqRepRank=6, routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Raid", area="Zul'Gurub" },
	[8043] = { id=8043, name="Strength of Mount Mugamba", baseexp=9550, exp=0,  qlvl=60, type="turnin", playerClass="WARRIOR", reqRep=270, reqRepRank=7, routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Raid", area="Zul'Gurub" },
	[8044] = { id=8044, name="The Rage of Mugamba", baseexp=9550, exp=0,  qlvl=60, type="turnin", playerClass="WARRIOR", reqRep=270, reqRepRank=8, routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Raid", area="Zul'Gurub" },
	[8110] = { id=8110, name="Enchanted South Seas Kelp", baseexp=9550, exp=0,  qlvl=60, type="turnin", playerClass="DRUID", reqRep=270, reqRepRank=5, routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Raid", area="Zul'Gurub" },
	[8111] = { id=8111, name="Enchanted South Seas Kelp", baseexp=9550, exp=0,  qlvl=60, type="turnin", playerClass="DRUID", reqRep=270, reqRepRank=6, routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Raid", area="Zul'Gurub" },
	[8112] = { id=8112, name="Enchanted South Seas Kelp", baseexp=9550, exp=0,  qlvl=60, type="turnin", playerClass="DRUID", reqRep=270, reqRepRank=7, routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Raid", area="Zul'Gurub" },
	[8113] = { id=8113, name="Pristine Enchanted South Seas Kelp", baseexp=9550, exp=0,  qlvl=60, type="turnin", playerClass="DRUID", reqRep=270, reqRepRank=8, routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Raid", area="Zul'Gurub" },
	[8101] = { id=8101, name="The Pebble of Kajaro", baseexp=9550, exp=0,  qlvl=60, type="turnin", playerClass="MAGE", reqRep=270, reqRepRank=5, routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Raid", area="Zul'Gurub" },
	[8102] = { id=8102, name="The Pebble of Kajaro", baseexp=9550, exp=0,  qlvl=60, type="turnin", playerClass="MAGE", reqRep=270, reqRepRank=6, routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Raid", area="Zul'Gurub" },
	[8103] = { id=8103, name="The Pebble of Kajaro", baseexp=9550, exp=0,  qlvl=60, type="turnin", playerClass="MAGE", reqRep=270, reqRepRank=7, routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Raid", area="Zul'Gurub" },
	[8104] = { id=8104, name="The Jewel of Kajaro", baseexp=9550, exp=0,  qlvl=60, type="turnin", playerClass="MAGE", reqRep=270, reqRepRank=8, routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Raid", area="Zul'Gurub" },
	[8106] = { id=8106, name="Kezan's Taint", baseexp=9550, exp=0,  qlvl=60, type="turnin", playerClass="WARLOCK", reqRep=270, reqRepRank=5, routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Raid", area="Zul'Gurub" },
	[8107] = { id=8107, name="Kezan's Taint", baseexp=9550, exp=0,  qlvl=60, type="turnin", playerClass="WARLOCK", reqRep=270, reqRepRank=6, routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Raid", area="Zul'Gurub" },
	[8108] = { id=8108, name="Kezan's Taint", baseexp=9550, exp=0,  qlvl=60, type="turnin", playerClass="WARLOCK", reqRep=270, reqRepRank=7, routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Raid", area="Zul'Gurub" },
	[8109] = { id=8109, name="Kezan's Unstoppable Taint", baseexp=9550, exp=0,  qlvl=60, type="turnin", playerClass="WARLOCK", reqRep=270, reqRepRank=8, routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Raid", area="Zul'Gurub" },
	[8049] = { id=8049, name="The Eye of Zuldazar", baseexp=9550, exp=0,  qlvl=60, type="turnin", playerClass="PRIEST", reqRep=270, reqRepRank=5, routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Raid", area="Zul'Gurub" },
	[8050] = { id=8050, name="The Eye of Zuldazar", baseexp=9550, exp=0,  qlvl=60, type="turnin", playerClass="PRIEST", reqRep=270, reqRepRank=6, routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Raid", area="Zul'Gurub" },
	[8051] = { id=8051, name="The Eye of Zuldazar", baseexp=9550, exp=0,  qlvl=60, type="turnin", playerClass="PRIEST", reqRep=270, reqRepRank=7, routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Raid", area="Zul'Gurub" },
	[8052] = { id=8052, name="The All-Seeing Eye of Zuldazar", baseexp=9550, exp=0,  qlvl=60, type="turnin", playerClass="PRIEST", reqRep=270, reqRepRank=8, routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Raid", area="Zul'Gurub" },
	[8116] = { id=8116, name="Vision of Voodress", baseexp=9550, exp=0,  qlvl=60, type="turnin", playerClass="SHAMAN", reqRep=270, reqRepRank=5, routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Raid", area="Zul'Gurub" },
	[8117] = { id=8117, name="Vision of Voodress", baseexp=9550, exp=0,  qlvl=60, type="turnin", playerClass="SHAMAN", reqRep=270, reqRepRank=6, routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Raid", area="Zul'Gurub" },
	[8118] = { id=8118, name="Vision of Voodress", baseexp=9550, exp=0,  qlvl=60, type="turnin", playerClass="SHAMAN", reqRep=270, reqRepRank=7, routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Raid", area="Zul'Gurub" },
	[8119] = { id=8119, name="The Unmarred Vision of Voodress", baseexp=9550, exp=0,  qlvl=60, type="turnin", playerClass="SHAMAN", reqRep=270, reqRepRank=8, routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Raid", area="Zul'Gurub" },
	[8045] = { id=8045, name="The Hearthen's Brand", baseexp=9550, exp=0,  qlvl=60, type="turnin", playerClass="PALADIN", reqRep=270, reqRepRank=5, routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Raid", area="Zul'Gurub" },
	[8046] = { id=8046, name="The Hearthen's Brand", baseexp=9550, exp=0,  qlvl=60, type="turnin", playerClass="PALADIN", reqRep=270, reqRepRank=6, routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Raid", area="Zul'Gurub" },
	[8047] = { id=8047, name="The Hearthen's Brand", baseexp=9550, exp=0,  qlvl=60, type="turnin", playerClass="PALADIN", reqRep=270, reqRepRank=7, routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Raid", area="Zul'Gurub" },
	[8048] = { id=8048, name="The Hero's Brand", baseexp=9550, exp=0,  qlvl=60, type="turnin", playerClass="PALADIN", reqRep=270, reqRepRank=8, routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Raid", area="Zul'Gurub" },
	[8141] = { id=8141, name="Zandalarian Shadow Talisman", baseexp=9550, exp=0,  qlvl=60, type="turnin", playerClass="ROGUE", reqRep=270, reqRepRank=5, routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Raid", area="Zul'Gurub" },
	[8142] = { id=8142, name="Zandalarian Shadow Talisman", baseexp=9550, exp=0,  qlvl=60, type="turnin", playerClass="ROGUE", reqRep=270, reqRepRank=6, routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Raid", area="Zul'Gurub" },
	[8143] = { id=8143, name="Zandalarian Shadow Talisman", baseexp=9550, exp=0,  qlvl=60, type="turnin", playerClass="ROGUE", reqRep=270, reqRepRank=7, routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Raid", area="Zul'Gurub" },
	[8144] = { id=8144, name="Zandalarian Shadow Mastery Talisman", baseexp=9550, exp=0,  qlvl=60, type="turnin", playerClass="ROGUE", reqRep=270, reqRepRank=8, routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Raid", area="Zul'Gurub" },
	[8060] = { id=8060, name="Paragons of Power: The Illusionist's Wraps", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="19716-1", playerClass="MAGE", reqRep=270, reqRepRank=5, routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Raid", area="Zul'Gurub" },
	[8068] = { id=8068, name="Paragons of Power: The Illusionist's Mantle", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="19721-1", playerClass="MAGE", reqRep=270, reqRepRank=6, routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Raid", area="Zul'Gurub" },
	[8069] = { id=8069, name="Paragons of Power: The Illusionist's Robes", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="19723-1", playerClass="MAGE", reqRep=270, reqRepRank=7, routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Raid", area="Zul'Gurub" },
	[8061] = { id=8061, name="Paragons of Power: The Confessor's Wraps", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="19718-1", playerClass="PRIEST", reqRep=270, reqRepRank=5, routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Raid", area="Zul'Gurub" },
	[8070] = { id=8070, name="Paragons of Power: The Confessor's Bindings", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="19720-1", playerClass="PRIEST", reqRep=270, reqRepRank=6, routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Raid", area="Zul'Gurub" },
	[8071] = { id=8071, name="Paragons of Power: The Confessor's Mantle", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="19724-1", playerClass="PRIEST", reqRep=270, reqRepRank=7, routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Raid", area="Zul'Gurub" },
	[8059] = { id=8059, name="Paragons of Power: The Demoniac's Wraps", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="19718-1", playerClass="WARLOCK", reqRep=270, reqRepRank=5, routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Raid", area="Zul'Gurub" },
	[8076] = { id=8076, name="Paragons of Power: The Demoniac's Mantle", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="19720-1", playerClass="WARLOCK", reqRep=270, reqRepRank=6, routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Raid", area="Zul'Gurub" },
	[8077] = { id=8077, name="Paragons of Power: The Demoniac's Robes", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="19723-1", playerClass="WARLOCK", reqRep=270, reqRepRank=7, routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Raid", area="Zul'Gurub" },
	[8057] = { id=8057, name="Paragons of Power: The Haruspex's Bracers", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="19718-1", playerClass="DRUID", reqRep=270, reqRepRank=5, routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Raid", area="Zul'Gurub" },
	[8064] = { id=8064, name="Paragons of Power: The Haruspex's Belt", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="19720-1", playerClass="DRUID", reqRep=270, reqRepRank=6, routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Raid", area="Zul'Gurub" },
	[8065] = { id=8065, name="Paragons of Power: The Haruspex's Tunic", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="19722-1", playerClass="DRUID", reqRep=270, reqRepRank=7, routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Raid", area="Zul'Gurub" },
	[8063] = { id=8063, name="Paragons of Power: The Madcap's Bracers", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="19717-1", playerClass="ROGUE", reqRep=270, reqRepRank=5, routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Raid", area="Zul'Gurub" },
	[8072] = { id=8072, name="Paragons of Power: The Madcap's Mantle", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="19719-1", playerClass="ROGUE", reqRep=270, reqRepRank=6, routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Raid", area="Zul'Gurub" },
	[8073] = { id=8073, name="Paragons of Power: The Madcap's Tunic", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="19724-1", playerClass="ROGUE", reqRep=270, reqRepRank=7, routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Raid", area="Zul'Gurub" },
	[8062] = { id=8062, name="Paragons of Power: The Predator's Bracers", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="19716-1", playerClass="HUNTER", reqRep=270, reqRepRank=5, routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Raid", area="Zul'Gurub" },
	[8066] = { id=8066, name="Paragons of Power: The Predator's Belt", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="19721-1", playerClass="HUNTER", reqRep=270, reqRepRank=6, routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Raid", area="Zul'Gurub" },
	[8067] = { id=8067, name="Paragons of Power: The Predator's Mantle", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="19724-1", playerClass="HUNTER", reqRep=270, reqRepRank=7, routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Raid", area="Zul'Gurub" },
	[8056] = { id=8056, name="Paragons of Power: The Augur's Bracers", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="19717-1", playerClass="SHAMAN", reqRep=270, reqRepRank=5, routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Raid", area="Zul'Gurub" },
	[8074] = { id=8074, name="Paragons of Power: The Augur's Belt", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="19719-1", playerClass="SHAMAN", reqRep=270, reqRepRank=6, routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Raid", area="Zul'Gurub" },
	[8075] = { id=8075, name="Paragons of Power: The Augur's Hauberk", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="19722-1", playerClass="SHAMAN", reqRep=270, reqRepRank=7, routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Raid", area="Zul'Gurub" },
	[8058] = { id=8058, name="Paragons of Power: The Vindicator's Armguards", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="19717-1", playerClass="WARRIOR", reqRep=270, reqRepRank=5, routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Raid", area="Zul'Gurub" },
	[8078] = { id=8078, name="Paragons of Power: The Vindicator's Belt", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="19719-1", playerClass="WARRIOR", reqRep=270, reqRepRank=6, routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Raid", area="Zul'Gurub" },
	[8079] = { id=8079, name="Paragons of Power: The Vindicator's Breastplate", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="19723-1", playerClass="WARRIOR", reqRep=270, reqRepRank=7, routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Raid", area="Zul'Gurub" },
	[8053] = { id=8053, name="Paragons of Power: The Freethinker's Armguards", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="19716-1", playerClass="PALADIN", reqRep=270, reqRepRank=5, routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Raid", area="Zul'Gurub" },
	[8054] = { id=8054, name="Paragons of Power: The Freethinker's Belt", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="19721-1", playerClass="PALADIN", reqRep=270, reqRepRank=6, routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Raid", area="Zul'Gurub" },
	[8055] = { id=8055, name="Paragons of Power: The Freethinker's Breastplate", baseexp=9550, exp=0,  qlvl=60, type="turnin", reqItems="19722-1", playerClass="PALADIN", reqRep=270, reqRepRank=7, routes="Main,Strat,Solo", routeSection="zgSTV", areaType="Raid", area="Zul'Gurub" },
	[2521] = { id=2521, name="To Serve Kum'isha", baseexp=12250, exp=0,  qlvl=55, type="turnin", reqItems="8244-1", routes="Main,Strat,Solo", routeSection="BlastedLands", areaType="Zone", area="Blasted Lands" },
	[3501] = { id=3501, name="Everything Counts In Large Amounts", baseexp=8150, exp=0,  qlvl=55, type="turnin", reqItems="10593-1", routes="Main,Strat,Solo", routeSection="BlastedLands", areaType="Zone", area="Blasted Lands" },
	[8471] = { id=8471, name="Winterfall Ritual Totem", baseexp=8450, exp=0,  qlvl=56, type="turnin", reqItems="20742-1", reqRep=576, reqRepRank=4, routes="Main,Strat,Solo", routeSection="Timbermaw", areaType="Zone", area="Felwood" },
	[8470] = { id=8470, name="Deadwood Ritual Totem", baseexp=8150, exp=0,  qlvl=55, type="turnin", reqItems="20741-1", reqRep=576, reqRepRank=4, routes="Main,Strat,Solo", routeSection="Timbermaw", areaType="Zone", area="Felwood" },
	[4148] = { id=4148, name="Bloodpetal Zapper", baseexp=5700, exp=0,  qlvl=53, type="turnin", reqItems="11315-1", preQuests="4145,4147,4146", routes="Main,Strat,Solo", routeSection="Ungoro", areaType="Zone", area="Un'Goro Crater" },
	[4284] = { id=4284, name="Crystals of Power", baseexp=7600, exp=0,  qlvl=53, type="turnin", reqItems="11186-7,11188-7,11185-7,11184-7", routes="Main,Strat,Solo", routeSection="Ungoro", areaType="Zone", area="Un'Goro Crater" },
	[6824] = { id=6824, name="Hands of the Enemy", baseexp=14300, exp=0,  qlvl=60, type="optional", preQuests="6804,6805,6821,6822,6823", routes="Main,Strat", routeSection="BayOfStorms", areaType="Raid", area="The Molten Core" },
	[7486] = { id=7486, name="A Hero's Reward", baseexp=14300, exp=0,  qlvl=60, type="optional_turnin", preQuests="6804,6805,6821,6822,6823", routes="Main,Strat", routeSection="BayOfStorms", areaType="Raid", area="The Molten Core" },
	[8331] = { id=8331, name="Aurel Goldleaf", baseexp=960, exp=0,  qlvl=60, type="turnin", routes="Main,Strat,Solo", routeSection="SilithusHold", areaType="Zone", area="Silithus" },
	[8343] = { id=8343, name="Gloldleaf's Discovery", baseexp=960, exp=0,  qlvl=60, type="turnin", routes="Main,Strat,Solo", routeSection="SilithusHold", areaType="Zone", area="Silithus" },
	[8349] = { id=8349, name="Bor WIldmane", baseexp=960, exp=0,  qlvl=60, type="turnin", routes="Main,Strat,Solo", routeSection="SilithusHold", areaType="Zone", area="Silithus" },
	[8351] = { id=8351, name="Bor Wishes to Speak", baseexp=960, exp=0,  qlvl=60, type="turnin", routes="Main,Strat,Solo", routeSection="SilithusHold", areaType="Zone", area="Silithus" },
	[7163] = { id=7163, name="Rise and Be Recognized", baseexp=7050, exp=0,  qlvl=51, type="turnin", preQuests="7161", routes="Main,Strat", routeSection="AV", areaType="Battleground", area="Alterac Valley" },
	[7164] = { id=7164, name="Honored Amongst the Clan", baseexp=7050, exp=0,  qlvl=51, type="turnin", preQuests="7161", routes="Main,Strat", routeSection="AV", areaType="Battleground", area="Alterac Valley" },
	[7165] = { id=7165, name="Earned Reverence", baseexp=8800, exp=0,  qlvl=51, type="turnin", preQuests="7161", routes="Main,Strat", routeSection="AV", areaType="Battleground", area="Alterac Valley" },
	[7166] = { id=7166, name="Legendary Heroes", baseexp=10600, exp=0,  qlvl=51, type="turnin", preQuests="7161", routes="Main,Strat", routeSection="AV", areaType="Battleground", area="Alterac Valley" },
	[7167] = { id=7167, name="Eye of Command", baseexp=10600, exp=0,  qlvl=51, type="turnin", preQuests="7161", routes="Main,Strat", routeSection="AV", areaType="Battleground", area="Alterac Valley" },
	[5051] = { id=5051, name="Two Halves Become One", baseexp=7900, exp=0,  qlvl=54, type="turnin", preQuests="5021,5023,5049,5050", routes="Main,Strat,Solo", routeSection="WPLFelstoneField", areaType="Zone", area="Western Plaguelands" },
	[5060] = { id=5060, name="Locked Away", baseexp=10200, exp=0,  qlvl=55, type="turnin", reqItems="12739-1", preQuests="5058", routes="Main,Strat,Solo", routeSection="WPLFelstoneField", areaType="Zone", area="Western Plaguelands" },
	[6031] = { id=6031, name="Runecloth", baseexp=8150, exp=0,  qlvl=55, type="turnin", reqItems="14047-30", reqRep=576, reqRepRank=5, routes="Main,Strat,Solo", routeSection="Timbermaw", areaType="Zone", area="Timbermaw Hold" },
	[6032] = { id=6032, name="Sacred Cloth", baseexp=8150, exp=0,  qlvl=55, type="turnin", reqItems="14342-2", reqRep=576, reqRepRank=5, reqProf=197, reqProfSkill=280, routes="Main,Strat,Solo", routeSection="Timbermaw", areaType="Zone", area="Timbermaw Hold" },
	[8485] = { id=8485, name="The Brokering of Peace", baseexp=14300, exp=0,  qlvl=60, type="turnin", reqRep=576, reqRepRank=8, routes="Main,Strat,Solo", routeSection="Orgrimmar", areaType="Zone", area="Timbermaw Hold" },
	[5527] = { id=5527, name="A Reliquary of Purity", baseexp=9550, exp=0,  qlvl=60, type="optional", routes="Main,Strat,Solo", routeSection="Moonglade", areaType="Zone", area="Moonglade" },
	[5526] = { id=5526, name="Shards of the Felvine", baseexp=14300, exp=0,  qlvl=60, type="turnin", preQuests="5527", routes="Main,Strat,Solo", routeSection="Moonglade", areaType="Zone", area="Moonglade" },
	[8446] = { id=8446, name="Shrouded in Nightmare", baseexp=14300, exp=0,  qlvl=60, type="turnin", reqItems="20644-1", routes="Main,Strat,Solo", routeSection="Moonglade", areaType="Zone", area="Moonglade" },
	[6845] = { id=6845, name="Uncovering Past Secrets", baseexp=10900, exp=0,  qlvl=57, type="turnin", preQuests="6844", routes="Main,Strat,Solo", routeSection="Moonglade", areaType="Zone", area="Moonglade" },
	[1185] = { id=1185, name="Under the Chitin War...", baseexp=4350, exp=0,  qlvl=57, type="turnin", preQuests="6844", routes="Main,Strat,Solo", routeSection="Moonglade", areaType="Zone", area="Moonglade" },
	[8307] = { id=8307, name="Desert Recipe", baseexp=4350, exp=0,  qlvl=57, type="turnin", reqProf=185, reqProfSkill=285, routes="Main,Strat,Solo", routeSection="SilithusHold", areaType="Zone", area="Silithus" },
	[8313] = { id=8313, name="Sharing the Knowledge", baseexp=8750, exp=0,  qlvl=57, type="turnin", reqProf=185, reqProfSkill=285, routes="Main,Strat,Solo", routeSection="SilithusHold", areaType="Zone", area="Silithus" },
	[8315] = { id=8315, name="The Calling", baseexp=11900, exp=0,  qlvl=60, type="turnin", preQuests="8304,8309,8310", routes="Main,Strat,Solo", routeSection="SilithusHold", areaType="Zone", area="Silithus" },
	[8316] = { id=8316, name="Armaments of War", baseexp=9550, exp=0,  qlvl=60, type="turnin", preQuests="8304,8309,8310", playerClass="WARRIOR", routes="Main,Strat,Solo", routeSection="SilithusHold", areaType="Zone", area="Silithus" },
	[8376] = { id=8376, name="Armaments of War", baseexp=9550, exp=0,  qlvl=60, type="turnin", preQuests="8304,8309,8310", playerClass="PALADIN", routes="Main,Strat,Solo", routeSection="SilithusHold", areaType="Zone", area="Silithus" },
	[8377] = { id=8377, name="Armaments of War", baseexp=9550, exp=0,  qlvl=60, type="turnin", preQuests="8304,8309,8310", playerClass="HUNTER", routes="Main,Strat,Solo", routeSection="SilithusHold", areaType="Zone", area="Silithus" },
	[8380] = { id=8380, name="Armaments of War", baseexp=9550, exp=0,  qlvl=60, type="turnin", preQuests="8304,8309,8310", playerClass="SHAMAN", routes="Main,Strat,Solo", routeSection="SilithusHold", areaType="Zone", area="Silithus" },
	[8382] = { id=8382, name="Armaments of War", baseexp=9550, exp=0,  qlvl=60, type="turnin", preQuests="8304,8309,8310", playerClass="DRUID", routes="Main,Strat,Solo", routeSection="SilithusHold", areaType="Zone", area="Silithus" },
	[8381] = { id=8381, name="Armaments of War", baseexp=9550, exp=0,  qlvl=60, type="turnin", preQuests="8304,8309,8310", routes="Main,Strat,Solo", routeSection="SilithusHold", areaType="Zone", area="Silithus" },
	[8379] = { id=8379, name="Armaments of War", baseexp=9550, exp=0,  qlvl=60, type="turnin", preQuests="8304,8309,8310", playerClass="PRIEST", routes="Main,Strat,Solo", routeSection="SilithusHold", areaType="Zone", area="Silithus" },
	[8378] = { id=8378, name="Armaments of War", baseexp=9550, exp=0,  qlvl=60, type="turnin", preQuests="8304,8309,8310", playerClass="ROGUE", routes="Main,Strat,Solo", routeSection="SilithusHold", areaType="Zone", area="Silithus" },
	[5122] = { id=5122, name="The Medallion of Faith", baseexp=0, exp=0,  qlvl=60, type="turnin", reqItems="12845-1", routes="Strat", routeSection="Stratholme2", areaType="Dungeon", area="Stratholme" },
	[5125] = { id=5125, name="Aurius' Reckoning", baseexp=14300, exp=0,  qlvl=60, type="turnin", routes="Strat", routeSection="Stratholme2", areaType="Dungeon", area="Stratholme" },
	[1126] = { id=1126, name="Hive in the Tower", baseexp=8750, exp=0,  qlvl=57, type="turnin", preQuests="1123,1124,1125", routes="Main,Strat", routeSection="SilithusNE2", areaType="Zone", area="Silithus" },
	[6844] = { id=6844, name="Umber, Archivist", baseexp=4350, exp=0,  qlvl=57, type="turnin", routes="Main,Strat", routeSection="Moonglade", areaType="Zone", area="Silithus" },
	[7667] = { id=7667, name="Material Assistance", baseexp=7150, exp=0,  qlvl=60, type="turnin", reqItems="12800-1,18335-1", playerClass="SHAMAN", routes="Main,Strat,Solo", routeSection="Orgrimmar", areaType="Zone", area="Orgrimmar" },
	[8930] = { id=8930, name="In Search of Anthion", baseexp=9550, exp=0,  qlvl=60, type="turnin", preQuests="8920,8923,8921,8924,8925,8928", routes="Strat", routeSection="StratholmeGates1", areaType="Zone", area="Stratholme" },
	[8945] = { id=8945, name="Dead Man's Plea", baseexp=11900, exp=0,  qlvl=60, type="turnin", preQuests="8920,8923,8921,8924,8925,8928", routes="Strat", routeSection="Stratholme2", areaType="Dungeon", area="Stratholme" },
	[8946] = { id=8946, name="Proof of Life", baseexp=9550, exp=0,  qlvl=60, type="turnin", preQuests="8920,8923,8921,8924,8925,8928", routes="Strat", routeSection="StratholmeGates2", areaType="Dungeon", area="Stratholme" },
	[8947] = { id=8947, name="Anthion's Strange Request", baseexp=9550, exp=0,  qlvl=60, type="turnin", preQuests="8920,8923,8921,8924,8925,8928", routes="Strat", routeSection="StratholmeGates2", areaType="Zone", area="Orgrimmar" },
	[4882] = { id=4882, name="Guarding Secrets", baseexp=4650, exp=0,  qlvl=59, type="turnin", reqItems="12558-1", routes="Main,Strat,Solo", routeSection="felwoodTown", areaType="Zone", area="Winterspring" },
	[4883] = { id=4883, name="Guarding Secrets", baseexp=9300, exp=0,  qlvl=59, type="turnin", reqItems="12558-1", ignoreReqItemsForPrep=1, routes="Main,Strat,Solo", routeSection="ThunderBluff", areaType="Zone", area="Thunder Bluff" },
	[5121] = { id=5121, name="High Chief Winterfall", baseexp=11600, exp=0,  qlvl=59, type="optional", preQuests="5083,5084,5085,5086,5087", routes="Main,Strat,Solo", routeSection="wsDonowa", areaType="Zone", area="Winterspring" },
	[5123] = { id=5123, name="The Final Piece", baseexp=4650, exp=0,  qlvl=59, type="turnin", reqItems="12842-1", preQuests="5083,5084,5085,5086,5087", routes="Main,Strat,Solo", routeSection="wsDonowa", areaType="Zone", area="Winterspring" },
	[5128] = { id=5128, name="Words of the High Chief", baseexp=9300, exp=0,  qlvl=59, type="turnin", reqItems="12842-1", ignoreReqItemsForPrep=1, preQuests="5083,5084,5085,5086,5087", routes="Main,Strat,Solo", routeSection="felwoodEmerald", areaType="Zone", area="Felwood" },
	[5891] = { id=5891, name="Salve via Disenchanting", baseexp=6100, exp=0,  qlvl=55, type="turnin", reqItems="11174-1", preQuests="4102", routes="Main,Strat,Solo", routeSection="felwoodEmerald", areaType="Zone", area="Felwood" },
	[5889] = { id=5889, name="Salve via Gathering", baseexp=6100, exp=0,  qlvl=55, type="turnin", reqItems="11514-4", preQuests="4102", reqProf=182, reqProfSkill=250, routes="Main,Strat,Solo", routeSection="felwoodEmerald", areaType="Zone", area="Felwood" },
	[5887] = { id=5887, name="Salve via Hunting", baseexp=6100, exp=0,  qlvl=55, type="turnin", reqItems="11515-6", preQuests="4102", routes="Main,Strat,Solo", routeSection="felwoodEmerald", areaType="Zone", area="Felwood" },
	[5888] = { id=5888, name="Salve via Mining", baseexp=6100, exp=0,  qlvl=55, type="turnin", reqItems="11513-4", preQuests="4102", reqProf=186, reqProfSkill=175, routes="Main,Strat,Solo", routeSection="felwoodEmerald", areaType="Zone", area="Felwood" },
	[5890] = { id=5890, name="Salve via Skinning", baseexp=6100, exp=0,  qlvl=55, type="turnin", reqItems="11512-5", preQuests="4102", reqProf=393, reqProfSkill=250, routes="Main,Strat,Solo", routeSection="felwoodEmerald", areaType="Zone", area="Felwood" },
	[6030] = { id=6030, name="Duke Nicholas Zverenhoff", baseexp=3650, exp=0,  qlvl=52, type="turnin", routes="Main,Strat,Solo", routeSection="EPLTown", areaType="Zone", area="Eastern Plaguelands" },
	[6029] = { id=6029, name="The Everlook Report", baseexp=3650, exp=0,  qlvl=52, type="turnin", routes="Main,Strat,Solo", routeSection="WPLBulwark", areaType="Zone", area="Western Plaguelands" },
	[5242] = { id=5242, name="A Final Blow", baseexp=13500, exp=0,  qlvl=58, type="qlog", reqItems="13207-1", preQuests="5155,5157,5158,5159,5165", routes="Main,Strat,Solo", routeSection="felwoodEmerald", areaType="Zone", area="Felwood" },
	[6605] = { id=6605, name="A Strange One", baseexp=790, exp=0,  qlvl=54, type="turnin", routes="Main,Strat,Solo", routeSection="felwoodTown", areaType="Zone", area="Felwood" },
	[5163] = { id=5163, name="Are We There, Yeti?", baseexp=11250, exp=0,  qlvl=58, type="optional", reqItems="12928-1", preQuests="3783,977", routes="Main,Strat,Solo", routeSection="wsEverlook", areaType="Zone", area="Winterspring" },
	[969] = { id=969, name="Luck Be With You", baseexp=9550, exp=0,  qlvl=60, type="optional", reqItems="12334-4", routes="Main,Strat,Solo", routeSection="wsEverlook", areaType="Zone", area="Winterspring" },
	[5056] = { id=5056, name="Shy-Rotam", baseexp=11900, exp=0,  qlvl=60, type="optional", preQuests="5054,5055", routes="Main,Strat,Solo", routeSection="wsEverlook", areaType="Zone", area="Winterspring" },
	[5057] = { id=5057, name="Past Endeavors", baseexp=4750, exp=0,  qlvl=60, type="turnin", preQuests="5054,5055,5056", routes="Main,Strat,Solo", routeSection="ThunderBluff", areaType="Zone", area="Winterspring" },
	[5385] = { id=5385, name="The Remains of Trey Lightforge", baseexp=10900, exp=0,  qlvl=57, type="optional", reqItems="13562-1", preQuests="5202,5203,5204", routes="Main,Strat,Solo", routeSection="felwoodEmerald", areaType="Zone", area="Felwood" },
	[2938] = { id=2938, name="Venom to the Undercity", baseexp=12250, exp=0,  qlvl=55, type="turnin", preQuests="2933,2934,2935,2936,2937", routes="Main,Strat", routeSection="Undercity", areaType="Zone", area="Undercity" },
	[3570] = { id=3570, name="Seeping Corruption", baseexp=7350, exp=0,  qlvl=52, type="turnin", preQuests="3568,3569", routes="Main,Strat", routeSection="Undercity", areaType="Zone", area="Undercity" },
	[5281] = { id=5281, name="The Restless Souls", baseexp=9550, exp=0,  qlvl=60, type="turnin", routes="Main,Strat", routeSection="EPLEgan", areaType="Zone", area="Eastern Plaguelands" },
	[5282] = { id=5282, name="The Restless Souls", baseexp=14300, exp=0,  qlvl=60, type="turnin", routes="Strat", routeSection="EPLEgan2", areaType="Zone", area="Stratholme" },
	[5262] = { id=5262, name="The Truth Comes Crashing Down", baseexp=14300, exp=0,  qlvl=60, type="turnin", routes="Strat", routeSection="EPLTown3", areaType="Dungeon", area="Stratholme" },
	[5251] = { id=5251, name="The Archivist", baseexp=14300, exp=0,  qlvl=60, type="qlog", routes="Strat", routeSection="EPLTown", areaType="Dungeon", area="Stratholme" },
}

local preQuestMetadata = {
	[838] = { name = "Scholomance", startZone = "The Bulwark, Tirisfal Glades" },
    [964] = { name = "The Key to Scholomance", startZone = "The Bulwark, Tirisfal Glades" },
    [2621] = { name = "The Disgraced One", startZone = "Stonard, Swamp of Sorrows" },
    [2622] = { name = "The Missing Orders", startZone = "Stonard, Swamp of Sorrows" },
    [2623] = { name = "The Swamp Talker", startZone = "Stonard, Swamp of Sorrows" },
    [2784] = { name = "Fall From Grace", startZone = "Swamp of Sorrows" },
    [2801] = { name = "A Tale of Sorrow", startZone = "Swamp of Sorrows" },
    [3520] = { name = "Screecher Spirits", startZone = "Steamwheedle Port, Tanaris" },
    [3527] = { name = "The Prophecy of Mosh'aru", startZone = "Steamwheedle Port, Tanaris" },
    [3528] = { name = "The God Hakkar", startZone = "Steamwheedle Port, Tanaris" },
    [3844] = { name = "It's a Secret to Everybody", startZone = "Marshal's Refuge, Un'Goro Crater" },
    [3845] = { name = "It's a Secret to Everybody", startZone = "Marshal's Refuge, Un'Goro Crater" },
    [3908] = { name = "It's a Secret to Everybody", startZone = "Marshal's Refuge, Un'Goro Crater" },
    [3909] = { name = "The Videre Elixir", startZone = "Donova Snowden, Winterspring" },
    [3912] = { name = "Meet at the grave", startZone = "Donova Snowden, Winterspring" },
    [3913] = { name = "A Grave Situation", startZone = "Gadgetzan Graveyard, Tanaris" },
    [3914] = { name = "Linken's Sword", startZone = "Gadgetzan Graveyard, Tanaris" },
    [3941] = { name = "A Gnome's Assistance", startZone = "Marshal's Refuge, Un'Goro Crater" },
    [3942] = { name = "Linken's Memory", startZone = "Marshal's Refuge, Un'Goro Crater" },
    [3981] = { name = "Commander Gor'shak", startZone = "Kargath, Badlands" },
    [3982] = { name = "What Is Going On?", startZone = "Prison, Blackrock Depths" },
    [4001] = { name = "What Is Going On?", startZone = "Prison, Blackrock Depths" },
    [4002] = { name = "The Eastern Kingdoms", startZone = "Grommash Hold, Orgrimmar" },
    [4003] = { name = "The Royal Rescue", startZone = "Grommash Hold, Orgrimmar" },
    [4005] = { name = "Aquementas", startZone = "Emerald Sanctuary, Felwood" },
    [4061] = { name = "The Rise of the Machines", startZone = "Kargath, Badlands" },
    [4062] = { name = "The Rise of the Machines", startZone = "East of Kargath, Badlands" },
    [4081] = { name = "KILL ON SIGHT: Dark Iron Dwarves", startZone = "Kargath, Badlands" },
    [4082] = { name = "KILL ON SIGHT: High Ranking Dark Iron Officials", startZone = "Kargath, Badlands" },
    [4122] = { name = "Grark Lorkrub", startZone = "Kargath, Badlands" },
    [4121] = { name = "Precarious Predicament", startZone = "Blackrock Stronghold, Burning Steppes" },
    [4494] = { name = "March of the Silithid", startZone = "Orgrimmar" },
    [4496] = { name = "Bungle in the Jungle", startZone = "Gadgetzan, Tanaris" },
    [4507] = { name = "Pawn Captures Queen", startZone = "Gadgetzan, Tanaris" },
    [4726] = { name = "Broodling Essence", startZone = "Flame Crest, Burning Steppes" },
    [4734] = { name = "Egg Freezing", startZone = "Flame Crest, Burning Steppes" },
    [4787] = { name = "The Ancient Egg", startZone = "Streamwheedle Port, Tanaris" },
    [4808] = { name = "Felnok Steelspring", startZone = "Flame Crest, Burning Steppes" },
    [4809] = { name = "Chillwind Horns", startZone = "Everlook, Winterspring" },
    [4810] = { name = "Return to Tinkee", startZone = "Everlook, Winterspring" },
    [4907] = { name = "Tinkee Steamboil", startZone = "Everlook, Winterspring" },
    [5065] = { name = "The Lost Tablets of Mosh'aru", startZone = "Steamwheedle Port, Tanaris" },
    [5096] = { name = "Scarlet Diversions", startZone = "The Bulwark, Tirisfal Glades" },
    [5098] = { name = "All Along the Watchtowers", startZone = "The Bulwark, Tirisfal Glades" },
    [5149] = { name = "Pamela's Doll", startZone = "Darrowshire, EPL" },
    [5152] = { name = "Auntie Marlene", startZone = "Darrowshire, EPL" },
    [5153] = { name = "A Strange Historian", startZone = "Sorrow Hill, WPL" },
    [5154] = { name = "The Annals of Darrowshire", startZone = "Andorhal, WPL" },
    [5181] = { name = "Villains of Darrowshire", startZone = "Light's Hope Chapel, EPL" },
    [5206] = { name = "Marauders of Darrowshire", startZone = "Light's Hope Chapel, EPL" },
    [5210] = { name = "Brother Carlin", startZone = "Andorhal, WPL" },
	[5212] = { name = "The Flesh Does Not Lie", startZone= "Light's Hope Chapel, EPL" },
    [5251] = { name = "The Archivist", startZone = "Light's Hope Chapel, EPL" },
    [5262] = { name = "The Truth Comes Crashing Down", startZone = "Light's Hope Chapel, EPL" },
    [5341] = { name = "Barov Family Fortune", startZone = "The Bulwark, Tirisfal Glades" },
    [5382] = { name = "Doctor Theolen Krastinov, the Butcher", startZone = "Caer Darrow, WPL" },
    [5384] = { name = "Kirtonos the Herald", startZone = "Caer Darrow, WPL" },
    [5461] = { name = "The Human, Ras Frostwhisper", startZone = "Caer Darrow, WPL" },
    [5462] = { name = "The Dying, Ras Frostwhisper", startZone = "Caer Darrow, WPL" },
    [5463] = { name = "Menethil's Gift", startZone = "Light's Hope Chapel, EPL" },
    [5514] = { name = "Mold Rhymes With...", startZone = "The Bulwark, Tirisfal Glades" },
    [5515] = { name = "Krastinov's Bag of Horrors", startZone = "Caer Darrow, WPL" },
    [5542] = { name = "Demon Dogs", startZone = "Thondroril River (Tirion), EPL" },
    [5543] = { name = "Blood Tinged Skies", startZone = "Thondroril River (Tirion), EPL" },
    [5544] = { name = "Carrion Grubbage", startZone = "Thondroril River (Tirion), EPL" },
    [5742] = { name = "Redemption", startZone = "Thondroril River (Tirion), EPL" },
    [5781] = { name = "Of Forgotten Memories", startZone = "Thondroril River (Tirion), EPL" },
    [5802] = { name = "Fire Plume Forged", startZone = "Gadgetzan, Tanaris" },
    [5804] = { name = "Araj's Scarab", startZone = "The Bulwark, Tirisfal Glades" },
    [5845] = { name = "Of Lost Honor", startZone = "Thondroril River (Tirion), EPL" },
    [5941] = { name = "Return to Chromie", startZone = "Light's Hope Chapel, EPL" },
    [6022] = { name = "To Kill With Purpose", startZone = "Marris Stead (Nathanos), EPL" },
    [6042] = { name = "Un-Life's Little Annoyances", startZone = "Marris Stead (Nathanos), EPL" },
    [6133] = { name = "The Ranger Lord's Behest", startZone = "Marris Stead (Nathanos), EPL" },
    [6135] = { name = "Duskwing, Oh How I Hate Thee...", startZone = "Marris Stead (Nathanos), EPL" },
    [6136] = { name = "The Corpulent One", startZone = "Marris Stead (Nathanos), EPL" },
    [6144] = { name = "The Call to Command", startZone = "Marris Stead (Nathanos), EPL" },
    [6145] = { name = "The Crimson Courier", startZone = "Royal Quarter, Undercity" },
    [6146] = { name = "Nathanos' Ruse", startZone = "Marris Stead (Nathanos), EPL" },
    [6147] = { name = "Return to Nathanos", startZone = "Tyr's Hand, EPL" },
    [6804] = { name = "Poisoned Water", startZone = "Bay of Storms, Azshara" },
    [6805] = { name = "Stormers and Rumblers", startZone = "Bay of Storms, Azshara" },
    [6821] = { name = "Eye of the Emberseer", startZone = "Bay of Storms, Azshara" },
    [6822] = { name = "The Molten Core", startZone = "Bay of Storms, Azshara" },
    [6823] = { name = "Agent of Hydraxis", startZone = "Bay of Storms, Azshara" },
    [8284] = { name = "The Twilight Mystery", startZone = "Cenarion Hold, Silithus" },
    [8285] = { name = "The Deserter", startZone = "Cenarion Hold, Silithus" },
    [8304] = { name = "Dearest Natalia", startZone = "Cenarion Hold, Silithus" },
    [8307] = { name = "Desert Recipe", startZone = "Cenarion Hold, Silithus" },
    [8313] = { name = "Sharing the Knowledge", startZone = "Twilight Base Camp (Sandy Cookbook), Silithus" },
    [8320] = { name = "Twilight Geolords", startZone = "Cenarion Hold, Silithus" },
    [8331] = { name = "Aurel Goldleaf", startZone = "Cenarion Hold, Silithus" },
    [8343] = { name = "Goldleaf's Discovery", startZone = "Cenarion Hold, Silithus" },
    [8801] = { name = "C'Thun's Legacy", startZone = "Temple of Ahn'Qiraj" },
    [8913] = { name = "An Earnest Proposition", startZone = "Grommash Hold, Orgrimmar" },
    [8914] = { name = "An Earnest Proposition", startZone = "Grommash Hold, Orgrimmar" },
    [8915] = { name = "An Earnest Proposition", startZone = "Grommash Hold, Orgrimmar" },
    [8916] = { name = "An Earnest Proposition", startZone = "Grommash Hold, Orgrimmar" },
    [8917] = { name = "An Earnest Proposition", startZone = "Grommash Hold, Orgrimmar" },
    [8918] = { name = "An Earnest Proposition", startZone = "Grommash Hold, Orgrimmar" },
    [8919] = { name = "An Earnest Proposition", startZone = "Grommash Hold, Orgrimmar" },
    [8920] = { name = "An Earnest Proposition", startZone = "Grommash Hold, Orgrimmar" },
    [8921] = { name = "The Ectoplasmic Distiller", startZone = "Gadgetzan, Tanaris" },
    [8923] = { name = "A Supernatural Device", startZone = "Grommash Hold, Tanaris" },
    [8924] = { name = "Hunting for Ectoplasm", startZone = "Gadgetzan, Tanaris" },
    [8925] = { name = "A Portable Power Source", startZone = "Gadgetzan, Tanaris" },
    [8928] = { name = "A Shifty Merchant", startZone = "Gadgetzan, Tanaris" },
    [9443] = { name = "The So-Called Mark of the Lightbringer", startZone = "The Bulwark, Tirisfal Glades" },
    [10493] = { name = "An Earnest Proposition", startZone = "Grommash Hold, Orgrimmar" },
    [8309] = { name = "Glyph Chasing", startZone = "Bronzebeard Encampment, Silithus" },
    [8310] = { name = "Breaking the Code", startZone = "Bronzebeard Encampment, Silithus" },
    [4084] = { name = "Silver Heart", startZone = "Emerald Sanctuary, Felwood" },
    [9229] = { name = "The Fate of Ramaladni", startZone = "Light's Hope Chapel, EPL" },
    [8286] = { name = "What Tomorrow Brings", startZone = "Cenarion Hold, Silithus" },
    [8288] = { name = "Only One May Rise", startZone = "Cenarion Hold, Silithus" },
    [4145] = { name = "Larion and Muigin", startZone = "Marshal's Refuge, Un'goro Crater" },
    [4146] = { name = "Zapper Fuel", startZone = "Ratchet, The Barrens" },
    [4147] = { name = "Marvon's Workshop", startZone = "Marshal's Refuge, Un'goro Crater" },
    [3906] = { name = "Disharmony of Flame", startZone = "Kargath, Badlands" },
	[5168] = { name = "Heroes of Darrowshire", startZone = "Light's Hope Chapel, EPL" },
	[5228] = { name = "The Scourge Cauldrons", startZone = "The Bulwark, Tirisfal Glades" },
	[5229] = { name = "Target: Felstone Field", startZone = "The Bulwark, Tirisfal Glades" },
	[5230] = { name = "Return to the Bulwark", startZone = "Felstone Field, WPL" },
	[5231] = { name = "Target: Dalson's Tears", startZone = "The Bulwark, Tirisfal Glades" },
	[5232] = { name = "Return to the Bulwark", startZone = "Dalson's Tears, WPL" },
	[5233] = { name = "Target: Writhing Haunt", startZone = "The Bulwark, Tirisfal Glades" },
	[5234] = { name = "Return to the Bulwark", startZone = "Writhing Haunt, WPL" },
	[5235] = { name = "Target: Gahrron's Withering", startZone = "The Bulwark, Tirisfal Glades" },
	[2681] = { name = "The Stones That Bind Us", startZone = "Border to Blasted Lands" },
	[5846] = { name = "Of Love and Family", startZone = "Thondroril River (Tirion), EPL" },
	[9033] = { name = "Echoes of War", startZone="Light's Hope Chapel, EPL"},

	[5122] = { name = "The Medallion of Faith", startZone="Back Entrance, Stratholme"},
	[7161] = { name = "Proving Grounds", startZone="Alterac Mountains"},
	[5527] = { name = "A Reliquary of Purity", startZone="Nighthaven, Moonglade"},
	[5021] = { name = "Better Late Than Never", startZone="Felstone Field, WPL"},
	[5023] = { name = "Better Late Than Never", startZone="Felstone Field, WPL"},
	[5049] = { name = "The Jeremiah Blues", startZone="Undercity"},
	[5050] = { name = "Good Luck Charm", startZone="Undercity"},
	[6844] = { name = "Umber, Archivist", startZone="Silithus"},
	[5058] = { name = "Mrs. Dalson's Diary", startZone="Felstone Field, WPL"},
	[5059] = { name = "Locked Away", startZone="Felstone Field, WPL"},

	[1123] = { name = "Rabine Saturna", startZone="The Elder Rise, Thunder Bluff"},
	[1124] = { name = "Wasteland", startZone="Nighthaven, Moonglade"},
	[1125] = { name = "The Spirits of Southwind", startZone="Valor's Rest, Silithus"},
	[4102] = { name = "Cleansing Felwood", startZone="Emerald Sanctuary, Felwood"},
	[5202] = { name = "A Strange Red Key", startZone="Jaedenar Cave, Felwood (Drop)"},
	[5203] = { name = "Rescue From Jaedenar", startZone="Jaedenar Cave, Felwood"},
	[5204] = { name = "Retribution of the Light", startZone="Emerald Sanctuary, Felwood"},
	[2933] = { name = "Venom Bottles", startZone="Bottle object in Troll Camps, The Hinterlands"},
	[2934] = { name = "Undamaged Venom Sac", startZone="Tarren Mill, Hillsbrad Foothills"},
	[2935] = { name = "Consult Master Gadrin", startZone="Tarren Mill, Hillsbrad Foothills"},
	[2936] = { name = "The Spider God", startZone="Sen'jin Village, Durotar"},
	[2937] = { name = "Summoning Shadra", startZone="Sen'jin Village, Durotar"},
	[5054] = { name = "Ursius of the Shardtooth", startZone="Everlook, Winterspring"},
	[5055] = { name = "Brumeran of the Chillwind", startZone="Everlook, Winterspring"},
	[3783] = { name = "Are We There, Yeti?", startZone="Everlook, Winterspring"},
	[977] = { name = "Are We There, Yeti?", startZone="Everlook, Winterspring"},
	[5155] = { name = "Forces of Jaedenar", startZone="Emerald Sanctuary, Felwood"},
	[5157] = { name = "Collection of the Corrupt Water", startZone="Emerald Sanctuary, Felwood"},
	[5158] = { name = "Seeking Spiritual Aid", startZone="Emerald Sanctuary, Felwood"},
	[5159] = { name = "Cleansed Water Returns to Felwood", startZone="Greta Mosshoof, South of Ratchet, The Barrens"},
	[5165] = { name = "Dousing the Flames of Protection", startZone="Emerald Sanctuary, Felwood"},
	[3568] = { name = "Seeping Corruption", startZone="The Apothecarium, Undercity"},
	[3569] = { name = "Seeping Corruption", startZone="The Apothecarium, Undercity"},
	[5056] = { name = "Shy-Rotam", startZone="Everlook, Winterspring"},
	[5083] = { name = "Winterfall Firewater", startZone="Furbolg Item Drop, Winterspring"},
	[5084] = { name = "Falling to Corruptino", startZone="Donova Snowden, Winterspring"},
	[5085] = { name = "Mystery Goo", startZone="Cauldron in Felpaw Village, Felwood"},
	[5086] = { name = "Toxic Horrors", startZone="Donova Snowden, Winterspring"},
	[5087] = { name = "Winterfall Runners", startZone="Donova Snowden, Winterspring"},
	[8279] = { name = "The Twilight Lexicon", startZone="Hermit Cave, Silithus (South East)"},
	[5721] = { name = "The Battle of Darrowshire", startZone="Ruins of Andorhal, WPL (Chromie)"},
}

local _storedOriginalsForHardcodeFixes = {}

local tierQuestNotice = "~250g + AH items, This is by far the most expensive exp, the Belt+Gloves quest gives 14300 exp and doesn't have to be in the questlog.\nThe bracers only give 9550 and requires a slot in the questlog, so it's worthless.\nSkip this if you're not rich."

--['All Quests' Group Lists]
local aqgl_reqRep = {}
local aqgl_reqItems = {}
local aqgl_questPrep = {}
local aqgl_expensiveQuests = {
	[8978] = { name = "Tier 0.5 Pre-Quest", notice=tierQuestNotice},
	[8939] = { name="Tier 0.5 Quest", 	notice=tierQuestNotice },
	[8940] = { name="Tier 0.5 Quest", 	notice=tierQuestNotice },
	[8943] = { name="Tier 0.5 Quest", 	notice=tierQuestNotice },
	[8927] = { name="Tier 0.5 Quest", 	notice=tierQuestNotice },
	[8941] = { name="Tier 0.5 Quest", 	notice=tierQuestNotice },
	[8938] = { name="Tier 0.5 Quest", 	notice=tierQuestNotice },
	[8942] = { name="Tier 0.5 Quest", 	notice=tierQuestNotice },
	[8944] = { name="Tier 0.5 Quest", 	notice=tierQuestNotice },
	[10495] = { name="Tier 0.5 Quest", 	notice=tierQuestNotice },

	[8352] = { name="Scepter of the Council", notice="The Abyssal Scepter can cost several hundred gold. Check your Auction House, or farm it in a guild group." },
	[9248] = { name="A Humble Offering", notice="The Abyssal Scepter can cost several hundred gold. Check your Auction House, or farm it in a guild group." },
	[9230] = { name="Ramaladni's Icy Grasp", notice="The materials can be very expensive" },
	[9232] = { name="The Only Song I Know...", notice="The materials can be very expensive" }
}

-- [Hardcoded fixes for complex quest metadata]
-- Tier 0.5
local tempQuestManagement = questsMetadata[8978] -- Return to Mokvar, Tier 0.5 quest
if tempQuestManagement ~= nil then
	if cachedPlayerClass == nil then
		_, cachedPlayerClass = UnitClass("player")
	end

	if cachedPlayerClass == "MAGE" then
		tempQuestManagement.preQuests = "8915,"
	elseif cachedPlayerClass == "PRIEST" then
		tempQuestManagement.preQuests = "8916,"
	elseif cachedPlayerClass == "WARLOCK" then
		tempQuestManagement.preQuests = "8919,"
	elseif cachedPlayerClass == "DRUID" then
		tempQuestManagement.preQuests = "8913,"
	elseif cachedPlayerClass == "ROGUE" then
		tempQuestManagement.preQuests = "8917,"
	elseif cachedPlayerClass == "HUNTER" then
		tempQuestManagement.preQuests = "8914,"
	elseif cachedPlayerClass == "SHAMAN" then
		tempQuestManagement.preQuests = "8918,"
	elseif cachedPlayerClass == "WARRIOR" then
		tempQuestManagement.preQuests = "8920,"
	elseif cachedPlayerClass == "PALADIN" then
		tempQuestManagement.preQuests = "10493,"
	end

	tempQuestManagement.preQuests = tempQuestManagement.preQuests .. "8923,8921,8924,8925,8928"
end
tempQuestManagement = nil;

-- Split Quests (Quests that exclude eachother) - Currently Brood of Nozdormu Rings 
questsMetadata[99001] = { id=99001, name = "Brood Ring - Initial", 	baseexp=9550, exp=9550, 	qlvl=60, type="turnin", isSplitQuest=true, splitQuests={8747,8752,8757}, reqRep=910, reqRepRank=4, routes="Main,Strat", routeSection="CavernsOfTime", areaType="Raid", area="Temple of Ahn'Qiraji" }
questsMetadata[99002] = { id=99002, name = "Brood Ring - Friendly",	baseexp=9550, exp=9550, 	qlvl=60, type="turnin", isSplitQuest=true, splitQuests={8748,8753,8758}, reqRep=910, reqRepRank=5, routes="Main,Strat", routeSection="CavernsOfTime", areaType="Raid", area="Temple of Ahn'Qiraji" }
questsMetadata[99003] = { id=99003, name = "Brood Ring - Honored", 	baseexp=9550, exp=9550, 	qlvl=60, type="turnin", isSplitQuest=true, splitQuests={8749,8754,8759}, reqRep=910, reqRepRank=6, routes="Main,Strat", routeSection="CavernsOfTime", areaType="Raid", area="Temple of Ahn'Qiraji" }
questsMetadata[99004] = { id=99004, name = "Brood Ring - Revered", 	baseexp=9550, exp=9550, 	qlvl=60, type="turnin", isSplitQuest=true, splitQuests={8750,8755,8760}, reqRep=910, reqRepRank=7, routes="Main,Strat", routeSection="CavernsOfTime", areaType="Raid", area="Temple of Ahn'Qiraji" }
questsMetadata[99005] = { id=99005, name = "Brood Ring - Exalted", 	baseexp=14300, exp=14300, 	qlvl=60, type="turnin", isSplitQuest=true, splitQuests={8751,8756,8761}, reqRep=910, reqRepRank=8, routes="Main,Strat", routeSection="CavernsOfTime", areaType="Raid", area="Temple of Ahn'Qiraji" }

--[Lookup Lists]
local questLogList = {}
local dicQuestLogList = {}

local questLogListAlts = {}
local dicQuestLogListAlts = {}

local turnQuestList = {}
local dicTurnQuestList = {}

local dicReplacementQuests = {}

local function CreateAndSortLookupLists()
	aqgl_reqRep = {}
	aqgl_reqItems = {}
	aqgl_questPrep = {}

	local questLogListPreSort = {}
	questLogList = {}
	dicQuestLogList = {}
	local questLogListAltsPreSort = {}
	questLogListAlts = {}
	dicQuestLogListAlts = {}

	local turnQuestListPreSort = {}
	turnQuestList = {}
	dicTurnQuestList = {}
	dicReplacementQuests = {}

	--- QuestLogList
	for questID, quest in pairs(questsMetadata) do
		if quest.type == "qlog" then
			table.insert(questLogListPreSort, { id = questID, baseexp = quest.baseexp, name = quest.name })
			dicQuestLogList[questID] = true
		elseif quest.type == "optional" then
			table.insert(questLogListAltsPreSort, { id = questID, baseexp = quest.baseexp, name = quest.name })
			dicQuestLogListAlts[questID] = true
		elseif quest.type == "turnin" then
			table.insert(turnQuestListPreSort, { id = questID, baseexp = quest.baseexp, name = quest.name })
			dicTurnQuestList[questID] = true

			if quest.reqRep ~= nil and quest.reqRep > 0 and quest.reqRepRank ~= nil and quest.reqRepRank > 0 then
				table.insert(aqgl_reqRep, questID)
			elseif quest.reqItems ~= nil and quest.reqItems ~= "" then
				table.insert(aqgl_reqItems, questID)
			else
				if not aqgl_expensiveQuests[questID] then -- Don't add to Turnins if expensive
					table.insert(aqgl_questPrep, questID)
				end
			end
		end

		-- Store replacement details for easy lookup later
		if quest.replacementQuest ~= nil and quest.replacementQuest > 0 then
			dicReplacementQuests[quest.replacementQuest] = quest.id
		end
	end


	-- QuestLogList Sort
	table.sort(questLogListPreSort, function(a, b)
		if a.baseexp == b.baseexp then
			return a.name < b.name
		end
		return a.baseexp > b.baseexp
	end)
	for _, q in ipairs(questLogListPreSort) do
		table.insert(questLogList, q.id)
	end

	--- QuestLogListAlts Sort
	table.sort(questLogListAltsPreSort, function(a, b)
		if a.baseexp == b.baseexp then
			return a.name < b.name
		end
		return a.baseexp > b.baseexp
	end)

	for _, q in ipairs(questLogListAltsPreSort) do
		table.insert(questLogListAlts, q.id)
	end

	--- TurnQuestList Sort
	table.sort(turnQuestListPreSort, function(a, b)
		if a.baseexp == b.baseexp then
			return a.name < b.name
		end
		return a.baseexp > b.baseexp
	end)

	for _, q in ipairs(turnQuestListPreSort) do
		table.insert(turnQuestList, q.id)
	end

	-- Cleanup
	questLogListPreSort = nil
	questLogListAltsPreSort = nil
	turnQuestListPreSort = nil
end


--[Local Functions]
---@param questID number
local function UpdateQuestOnForRouteHardcodeFix(questID, type, routeSection, checkReplacement)
	local questObj = questsMetadata[questID]
	if questObj == nil then
		CasualTBCPrep.NotifyUserError("UpdateQuestOnForRouteHardcodeFix - tried to handle an invalid questID: " .. tostring(questID))
		return
	end

	if not _storedOriginalsForHardcodeFixes[questID] then
		-- Store the original values, so we can use it when changing route, before modifying again
		_storedOriginalsForHardcodeFixes[questID] = {
			type = questObj.type,
			routeSection = questObj.routeSection,
			routes = questObj.routes,
			preQuests = questObj.preQuests
		}
	end

	if type ~= nil then
		questObj.type = type
	end
	if routeSection ~= nil then
		questObj.routeSection = routeSection
	end
	if checkReplacement ~= nil then
		questObj.checkReplacement = checkReplacement
	end
	questsMetadata[questID] = questObj
end

---@param questID number
---@param preQuestID number
local function RemovePrequestFromQuest(questID, preQuestID)
	local questObj = questsMetadata[questID]
	if questObj == nil then
		CasualTBCPrep.NotifyUserError("RemovePrequestFromQuest - tried to handle an invalid questID: " .. tostring(questID))
		return
	end
	if questObj.preQuests == nil or questObj.preQuests == "" or preQuestID == nil or preQuestID <= 0 then
		return
	end

	local newPreQuests = {}
	for id in string.gmatch(questObj.preQuests, "([^,]+)") do
		if tonumber(id) ~= preQuestID then
			table.insert(newPreQuests, id)
		end
	end
	questObj.preQuests = table.concat(newPreQuests, ",")
	questsMetadata[questID] = questObj
end

---@param questID number
---@param preQuestID number
local function AddPrequestToQuest(questID, preQuestID)
	local questObj = questsMetadata[questID]
	if preQuestID == nil or preQuestID <= 0 then
		return
	end

	if questObj == nil then
		CasualTBCPrep.NotifyUserError("AddPrequestToQuest - tried to handle an invalid questID: " .. tostring(questID))
		return
	end
	if questObj.preQuests == nil or questObj.preQuests == "" then
		questObj.preQuests = tostring(preQuestID)
	else
		local exists = false
		for id in string.gmatch(questObj.preQuests, "([^,]+)") do
			if tonumber(id) == preQuestID then
				exists = true
				break
			end
		end
		if not exists then
			questObj.preQuests = questObj.preQuests .. "," .. preQuestID
		end
	end
	questsMetadata[questID] = questObj
end


local function RestoreModifiedQuests()
	for questID, orig in pairs(_storedOriginalsForHardcodeFixes) do
		local quest = questsMetadata[questID]
		if quest then
			quest.type = orig.type
			quest.routeSection = orig.routeSection
			quest.routes = orig.routes
			quest.preQuests = orig.preQuests
		end
	end
end

local function LoadRouteQuestSpecifics_Main()
	UpdateQuestOnForRouteHardcodeFix(5212, "qlog", "EPLTown", 5213) -- The Flesh Does Not Lie
	UpdateQuestOnForRouteHardcodeFix(5214, "qlog", "EPLTown", nil) -- The Great Ezra Grimm
	UpdateQuestOnForRouteHardcodeFix(5263, "qlog", "EPLTown", nil) -- Above and Beyond
	UpdateQuestOnForRouteHardcodeFix(5464, "optional", "EPLTown", nil) -- Menethil's Gift
	UpdateQuestOnForRouteHardcodeFix(5213, "optional", "EPLTown", nil) -- The Active Agent
	UpdateQuestOnForRouteHardcodeFix(6163, "qlog", "EPLNathanos", nil) -- Ramstein
	UpdateQuestOnForRouteHardcodeFix(5848, "qlog", "EPLTirion", nil) -- Of Love and Family
	UpdateQuestOnForRouteHardcodeFix(5721, "qlog", nil, nil) -- The Battle of Darrowshire

	UpdateQuestOnForRouteHardcodeFix(105, "optional", nil, nil) -- Alas, Andorhal
	UpdateQuestOnForRouteHardcodeFix(8306, "optional", nil, nil) -- Into The Maw of Madness
	UpdateQuestOnForRouteHardcodeFix(5056, "optional", nil, nil) -- Shy-Rotam
	UpdateQuestOnForRouteHardcodeFix(6148, "optional", nil, nil) -- The Scarlet Oracle, Demetria
	UpdateQuestOnForRouteHardcodeFix(8279, "optional", nil, nil) -- The Twilight Lexicon

	AddPrequestToQuest(5464, 5463) -- Menethil's Gift
	AddPrequestToQuest(5463, 5462) -- The Dying, Ras Frostwhisper as preQ
	AddPrequestToQuest(5464, 5462) -- The Dying, Ras Frostwhisper as preQ
	RemovePrequestFromQuest(5942, 5721) -- Battle of Darrowshire not a preQ to Hidden Treasure
end
local function LoadRouteQuestSpecifics_Solo()
	UpdateQuestOnForRouteHardcodeFix(5212, "qlog", "EPLTown", 5213) -- The Flesh Does Not Lie
	UpdateQuestOnForRouteHardcodeFix(5214, "qlog", "EPLTown", nil) -- The Great Ezra Grimm
	UpdateQuestOnForRouteHardcodeFix(5263, "qlog", "EPLTown", nil) -- Above and Beyond
	UpdateQuestOnForRouteHardcodeFix(5464, "optional", "EPLTown", nil) -- Menethil's Gift
	UpdateQuestOnForRouteHardcodeFix(5213, "optional", "EPLTown", nil) -- The Active Agent
	UpdateQuestOnForRouteHardcodeFix(6163, "qlog", "EPLNathanos", nil) -- Ramstein
	UpdateQuestOnForRouteHardcodeFix(5848, "qlog", "EPLTirion", nil) -- Of Love and Family
	UpdateQuestOnForRouteHardcodeFix(5721, "qlog", nil, nil) -- The Battle of Darrowshire

	UpdateQuestOnForRouteHardcodeFix(105, "optional", nil, nil) -- Alas, Andorhal
	UpdateQuestOnForRouteHardcodeFix(8306, "optional", nil, nil) -- Into The Maw of Madness
	UpdateQuestOnForRouteHardcodeFix(5056, "optional", nil, nil) -- Shy-Rotam
	UpdateQuestOnForRouteHardcodeFix(6148, "optional", nil, nil) -- The Scarlet Oracle, Demetria
	UpdateQuestOnForRouteHardcodeFix(8279, "optional", nil, nil) -- The Twilight Lexicon

	AddPrequestToQuest(5464, 5463) -- Menethil's Gift
	AddPrequestToQuest(5463, 5462) -- The Dying, Ras Frostwhisper as preQ
	AddPrequestToQuest(5464, 5462) -- The Dying, Ras Frostwhisper as preQ
	RemovePrequestFromQuest(5942, 5721) -- Battle of Darrowshire not a preQ to Hidden Treasure
end
local function LoadRouteQuestSpecifics_Strat()
	UpdateQuestOnForRouteHardcodeFix(5212, "turnin", "EPLTown3", nil) -- The Flesh Does Not Lie
	UpdateQuestOnForRouteHardcodeFix(5214, "turnin", "EPLTown3", nil) -- The Great Ezra Grimm
	UpdateQuestOnForRouteHardcodeFix(5263, "turnin", "EPLTown4", nil) -- Above and Beyond
	UpdateQuestOnForRouteHardcodeFix(5464, "turnin", "EPLTown4", nil) -- Menethil's Gift
	UpdateQuestOnForRouteHardcodeFix(5213, "turnin", "EPLTown4", nil) -- The Active Agent
	UpdateQuestOnForRouteHardcodeFix(6163, "turnin", "EPLNathanos2", nil) -- Ramstein
	UpdateQuestOnForRouteHardcodeFix(5848, "turnin", "EPLTirion2", nil) -- Of Love and Family
	UpdateQuestOnForRouteHardcodeFix(5721, "optional", nil, nil) -- The Battle of Darrowshire

	-- The new 'qlog' quests
	UpdateQuestOnForRouteHardcodeFix(105, "qlog", nil, nil) -- Alas, Andorhal
	UpdateQuestOnForRouteHardcodeFix(8306, "qlog", nil, nil) -- Into The Maw of Madness
	UpdateQuestOnForRouteHardcodeFix(5056, "qlog", nil, nil) -- Shy-Rotam
	UpdateQuestOnForRouteHardcodeFix(6148, "qlog", nil, nil) -- The Scarlet Oracle, Demetria
	UpdateQuestOnForRouteHardcodeFix(8279, "qlog", nil, nil) -- The Twilight Lexicon

	RemovePrequestFromQuest(5464, 5463) -- Menethil's Gift
	RemovePrequestFromQuest(5463, 5462) -- The Dying, Ras Frostwhisper removed as Prequest
	RemovePrequestFromQuest(5464, 5462) -- The Dying, Ras Frostwhisper removed as Prequest
	AddPrequestToQuest(5942, 5721) -- Battle of Darrowshire as preQ to Hidden Treasure
end

---@param routeCode string
local function LoadRouteQuestSpecifics(routeCode)
	RestoreModifiedQuests()
	--Hardcoded changes, cba developing a real solution for route-specifics at this point :|
	if routeCode == "Strat" then
		LoadRouteQuestSpecifics_Strat()
	elseif routeCode == "Solo" then
		LoadRouteQuestSpecifics_Solo()
	else
		LoadRouteQuestSpecifics_Main()
	end

	CasualTBCPrep.QuestData.UpdateRoutesFromQuestData()
end


--[Global Functions]
function CasualTBCPrep.QuestData.UpdateRoutesFromQuestData()
	local lastRouteObj = nil
	if lastLoadedRouteCode ~= nil and lastLoadedRouteCode ~= "" then
		lastRouteObj = CasualTBCPrep.Routing.Routes[lastLoadedRouteCode]
		if lastRouteObj then
			for sectKey, section in pairs(lastRouteObj.sections) do
				section.quests = {}
				lastRouteObj.sections[sectKey] = section
			end
		end
	end

	for _, quest in pairs(questsMetadata) do
		local isSplitQuestCompleted = false
		if quest.isSplitQuest == true then
			for _, splitQuestID in ipairs(quest.splitQuests) do
				if C_QuestLog.IsQuestFlaggedCompleted(splitQuestID) == true then
					isSplitQuestCompleted = true
					break
				end
			end
		end

		if not isSplitQuestCompleted and quest.routes ~= nil and quest.routes ~= "" and quest.routeSection ~= nil and quest.routeSection ~= "" then
			for route in string.gmatch(quest.routes, "([^,]+)") do
				route = strtrim(route)

				if lastRouteObj ~= nil and route == lastLoadedRouteCode then
					local lastRouteSectionObj = lastRouteObj.sections[quest.routeSection]
					if lastRouteSectionObj ~= nil and lastRouteSectionObj.quests ~= nil then
						table.insert(lastRouteSectionObj.quests, quest.id)
					end

				else -- First Call, do all routes
					local routeObj = CasualTBCPrep.Routing.Routes[route]
					if routeObj ~= nil then
						local routeSectionObj = routeObj.sections[quest.routeSection]

						if routeSectionObj ~= nil and routeSectionObj.quests ~= nil then
							table.insert(routeSectionObj.quests, quest.id)
						end
					else
						CasualTBCPrep.NotifyUser("routeObj is nil?  " .. route .. "." .. quest.routeSection)
						local debugger = CasualTBCPrep.Settings.GetGlobalSetting(CasualTBCPrep.Settings.DebugDetails) or -1
						if debugger == 1 then
							CasualTBCPrep.NotifyUserError("UpdateRoutesFromQuestData: Quest " .. tostring(quest.id) .. " has route '" .. tostring(route) .. "' set, but no such route exists!")
						end
					end
				end
			end
		end
	end
end


function CasualTBCPrep.QuestData.RouteQuestSanityCheck()
	for routeCode, routeObj in pairs(CasualTBCPrep.Routing.Routes) do
		for sectionKey, section in pairs(routeObj.sections) do
			if section == nil then
				CasualTBCPrep.NotifyUserError("UpdateRoutesFromQuestData: Route " .. routeCode .. " has '" .. sectionKey .. "' in the order, but not in .sections")
			else
				if (section.quests == nil or #section.quests <= 0) and section.canHaveZeroQuests ~= true then
					CasualTBCPrep.NotifyUserError("UpdateRoutesFromQuestData: Route " .. routeObj.name .. ", Section '" .. section.key .. " has no quests!")
				end
			end
		end
	end
end

---@param routeCode string
function CasualTBCPrep.QuestData.LoadRoute(routeCode)
	local route = CasualTBCPrep.Routing.Routes[routeCode]
	if route == nil or route == "" then
		return
	end

	local prevRoute = CasualTBCPrep.Routing.Routes[lastLoadedRouteCode]
	if prevRoute ~= nil then
		for _, sectionKey in ipairs(prevRoute.sectionOrder) do
			local prevSection = prevRoute.sections[sectionKey]

			for _, questID in ipairs(prevSection.quests) do
				local questObj = questsMetadata[questID]
				if questObj ~= nil then
					questObj.active = false
					questObj.exp = questObj.baseexp
				end
			end
		end
	end

	local charLvl = 60
	local expForLevel = CasualTBCPrep.Experience.GetRequiredExperienceFor(charLvl, charLvl + 1)

	for _, section in ipairs(CasualTBCPrep.Routing.GetActiveSectionsInCurrentRoute()) do
		for _, questID in ipairs(section.quests) do
			local questObj = questsMetadata[questID]

			if questObj ~= nil then
				local hasFullyPreparedQuest,_,_,_ = CasualTBCPrep.QuestData.GetQuestProgressionDetails(questObj)

				questObj.exp = CasualTBCPrep.Experience.GetActualQuestExperienceValue(questObj.qlvl, questObj.baseexp, charLvl)
				if hasFullyPreparedQuest == true then
					questObj.active = true
					expForLevel = expForLevel - questObj.exp

					if questObj.exp <= 0 then
						CasualTBCPrep.NotifyUserError("Route (NM)" .. route.name .. " would get 0 exp from quest " .. tostring(questID) .. ", " .. questObj.name .. " - Quest is lvl " .. tostring(questObj.qlvl) .. ", user would be " .. tostring(charLvl))
					end

					if expForLevel <= 0 then
						charLvl = charLvl + 1
						expForLevel = expForLevel + CasualTBCPrep.Experience.GetRequiredExperienceFor(charLvl, charLvl + 1)

						local debugger = CasualTBCPrep.Settings.GetGlobalSetting(CasualTBCPrep.Settings.DebugDetails) or -1
						if debugger == 1 then
							CasualTBCPrep.NotifyUser("Route (NM)" .. route.name .. " would ding " .. tostring(charLvl) .. " from quest " .. tostring(questID) .. ", " .. questObj.name)
						end
					end
				end
			end
		end
	end

	lastLoadedRouteCode = routeCode
	LoadRouteQuestSpecifics(routeCode)
	CreateAndSortLookupLists()
end

---@param questID number
---@return boolean
function CasualTBCPrep.QuestData.HasCharacterCompletedQuest(questID)
	local isCompleted = nil

	local quest = questsMetadata[questID]
	if quest then
		if quest.isSplitQuest == true then
			for _, splitQuestID in ipairs(quest.splitQuests) do
				if C_QuestLog.IsQuestFlaggedCompleted(splitQuestID) == true then
					isCompleted = true
					break
				end
			end
		end
	end

	return isCompleted or (C_QuestLog.IsQuestFlaggedCompleted(questID) == true) or false
end
---@return boolean
function CasualTBCPrep.QuestData.IsQuestValidForUser(quest)
	if quest == nil then
		return false
	end

	local isQuestInRoute = CasualTBCPrep.Routing.IsQuestInCurrentRoute(quest.id)
	if isQuestInRoute == false then
		return false
	end

	-- Replacement Check 1/2
	local iReplaceQuestID = dicReplacementQuests[quest.id]
	if iReplaceQuestID ~= nil and iReplaceQuestID > 0 then
		if not CasualTBCPrep.QuestData.HasCharacterCompletedQuest(iReplaceQuestID) then
			return false
		end
	end

	-- Replacement Check 2/2
	if quest.replacementQuest ~= nil and quest.replacementQuest > 0 then
		if CasualTBCPrep.QuestData.HasCharacterCompletedQuest(quest.replacementQuest) == true then
			return false
		end
	end

	if quest.playerClass == nil or quest.playerClass == "" then
		return true
	end

	if cachedPlayerClass == nil then
		_, cachedPlayerClass = UnitClass("player")
	end

	if string.find(quest.playerClass, ",") then
		for pClass in string.gmatch(quest.playerClass, "[^,]+") do
			if pClass == cachedPlayerClass then
				return true
			end
		end
	else
		return quest.playerClass == cachedPlayerClass
	end

	return false
end

---@param questID number
function CasualTBCPrep.QuestData.GetPreQuest(questID)
    return preQuestMetadata[questID]
end

---@param questID number
function CasualTBCPrep.QuestData.GetQuest(questID)
    return questsMetadata[questID]
end

---@param questID number
---@return boolean
function CasualTBCPrep.QuestData.ShouldBeInQuestLog(questID)
    return (dicQuestLogList[questID] or dicQuestLogListAlts[questID]) and true or false
end

---@param questID number
---@return boolean
function CasualTBCPrep.QuestData.IsTurnInQuest(questID)
    return (dicTurnQuestList[questID]) and true or false
end



---@param questID number
---@return boolean, boolean
function CasualTBCPrep.QuestData.HasPlayerFullyPreparedQuestExceptPrequests(questID, skipRepCheck, skipProfCheck, skipItemCheck)
	if not questID then
		return false, false
	end

	local quest = questsMetadata[questID]
	if not quest then
		return false, false
	end

	if not CasualTBCPrep.QuestData.IsQuestValidForUser(quest) or CasualTBCPrep.QuestData.HasCharacterCompletedQuest(questID) then
		return false, false
	end

	if skipRepCheck == nil then
		skipRepCheck = false
	end
	if skipProfCheck == nil then
		skipProfCheck = false
	end
	if skipItemCheck == nil then
		skipItemCheck = false
	end

	local fullyPrepared = true
	local needsItemsFromBank = false

	-- Rep Check
	if not skipRepCheck and (quest.reqRep ~= nil and quest.reqRep > 0 and quest.reqRepRank ~= nil and quest.reqRepRank > 0) then
		local _, _, standingID = GetFactionInfoByID(quest.reqRep)
		if standingID < quest.reqRepRank then
			fullyPrepared = false
		end
	end
	if not fullyPrepared then
		return false, needsItemsFromBank
	end

	-- Profession Check
	if not skipProfCheck and (quest.reqProf ~= nil and quest.reqProf > 0 and quest.reqProfSkill ~= nil and quest.reqProfSkill > 0) then
		local professionName = CasualTBCPrep.ProfessionNames[quest.reqProf] or "Unknown Profession"
		local playerProfessionSkill = 0
		for i = 1, GetNumSkillLines() do
			local skillName, _, _ , skillRank, _, _, maxSkill = GetSkillLineInfo(i)

			if professionName == skillName then
				playerProfessionSkill = skillRank
				break
			end
		end

		if playerProfessionSkill < quest.reqProfSkill then
			fullyPrepared = false
		end
	end
	if not fullyPrepared then
		return false, needsItemsFromBank
	end

	-- Required Items Check
	if not skipItemCheck and (quest.reqItems) then
		for itemPair in string.gmatch(quest.reqItems, "([^,]+)") do
			local itemIDStr, countStr = string.match(itemPair, "(%d+)-(%d+)")

			if itemIDStr and countStr then
				local itemID = tonumber(itemIDStr)
				local neededItemCount = tonumber(countStr)

				local playerTotalCount = C_Item.GetItemCount(itemID, true)
				local playerInvCount = C_Item.GetItemCount(itemID, false)
				local playerBankCount = playerTotalCount - playerInvCount

				if playerTotalCount < neededItemCount then
					fullyPrepared = false
					break
				else
					needsItemsFromBank =  playerInvCount < neededItemCount and playerTotalCount >= neededItemCount
				end
			end
		end
	end
	if not fullyPrepared then
		return false, needsItemsFromBank
	end

	-- Objective Check
	if quest.type == "qlog" then
		local qlogIndex = GetQuestLogIndexByID(questID)

		if qlogIndex and qlogIndex > 0 then
			local numObjectives = GetNumQuestLeaderBoards(qlogIndex)

			if numObjectives and numObjectives > 0 then
				for i = 1, numObjectives do
					local objectiveText, objectiveType, isCompleted = GetQuestLogLeaderBoard(i, qlogIndex)

					-- Skip item checks, it's handled above for all quests.
					if objectiveType ~= "item" and not isCompleted then
						fullyPrepared = false
						break
					end
				end
			end
		else
			fullyPrepared = false -- Must be in qLog
		end
	elseif quest.type == "optional" then
		local qlogIndex = GetQuestLogIndexByID(questID)

		if qlogIndex == nil or qlogIndex <= 0 then
			fullyPrepared = false -- Must be in qLog
		end
	end

	return fullyPrepared, needsItemsFromBank
end

---@param onlyPreparedQuests boolean
function CasualTBCPrep.QuestData.GetAllRequiredItemsForAvailableQuests(onlyPreparedQuests)
	local dicItemStats = {}
	local lstQuestsReqAnyAmount = { }

	for questID, _ in pairs(CasualTBCPrep.Routing.GetQuestsInCurrentRoute()) do
		local questData = questsMetadata[questID]

		if questData.reqItems and (not questData.reqAnyItem or questData.reqAnyItem ~= 1) and (not questData.ignoreReqItemsForPrep or questData.ignoreReqItemsForPrep ~= 1) then
			local isValidQuest = false

			if onlyPreparedQuests == true then
				local hasFullyPreparedQuest, _ = CasualTBCPrep.QuestData.HasPlayerFullyPreparedQuestExceptPrequests(questID, false, false, true)
				isValidQuest = hasFullyPreparedQuest
			else
				isValidQuest = (CasualTBCPrep.QuestData.IsQuestValidForUser(questData) == true and CasualTBCPrep.QuestData.HasCharacterCompletedQuest(questID) == false) or false
			end

			if isValidQuest then
				for itemPair in string.gmatch(questData.reqItems, "([^,]+)") do
					local itemIDStr, countStr = string.match(itemPair, "(%d+)-(%d+)")

					local itemID = tonumber(itemIDStr)
					local neededItemCount = tonumber(countStr)

					if itemID ~= nil and neededItemCount ~= nil and itemID > 0 and neededItemCount > 0 then
						local itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, itemTexture = C_Item.GetItemInfo(itemID)

						local dicCurItemStats = dicItemStats[itemID]

						if dicCurItemStats ~= nil then
							dicCurItemStats.requiredAmount = dicCurItemStats.requiredAmount + neededItemCount
							table.insert(dicCurItemStats.quests, { id=questID, quest=questData })
						else
							local playerInvCount = C_Item.GetItemCount(itemID, false)
							local playerTotalCount = C_Item.GetItemCount(itemID, true)
							local playerBankCount = playerTotalCount - playerInvCount

							dicItemStats[itemID] = { id=itemID, name=itemName, rarity=itemRarity, texture=itemTexture, requiredAmount=neededItemCount, playerInvAmount=playerInvCount, playerBankAmount=playerBankCount, playerTotalAmount=playerTotalCount, quests={ id=questID, quest=questData } }
						end
					else
						CasualTBCPrep.NotifyUserError("Unknown error in GetAllRequiredItemsForAvailableQuests. questID=" .. (questID or "") .. ", itemID=" .. (itemIDStr or "") .. "; neededItemCount=" .. (countStr or ""))
					end
				end
			end
		elseif questData.reqAnyItem then
			local questItemDetails = { }

			local userHasCompleted = false
			local completedItemData = nil

			for itemPair in string.gmatch(questData.reqItems, "([^,]+)") do
				local itemIDStr, countStr = string.match(itemPair, "(%d+)-(%d+)")
				local itemID = tonumber(itemIDStr)
				local neededItemCount = tonumber(countStr)

				local playerInvCount = C_Item.GetItemCount(itemID, false)
				local playerTotalCount = C_Item.GetItemCount(itemID, true)
				local playerBankCount = playerTotalCount - playerInvCount

				if playerTotalCount >= neededItemCount then
					userHasCompleted = true
				end

				if itemID ~= nil and neededItemCount ~= nil and itemID > 0 and neededItemCount > 0 then
					local itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, itemTexture = C_Item.GetItemInfo(itemID)

					if userHasCompleted then
						completedItemData = { id=itemID, name=itemName, rarity=itemRarity, texture=itemTexture, requiredAmount=neededItemCount, playerInvAmount=playerInvCount, playerBankAmount=playerBankCount, playerTotalAmount=playerTotalCount, quests={ id=questID, quest=questData} }
						break
					else
						table.insert(questItemDetails, { id=itemID, name=itemName, rarity=itemRarity, texture=itemTexture, requiredAmount=neededItemCount, playerInvAmount=playerInvCount, playerBankAmount=playerBankCount, playerTotalAmount=playerTotalCount, quests={ id=questID, quest=questData} })
					end
				else
					CasualTBCPrep.NotifyUserError("Unknown error in GetAllRequiredItemsForAvailableQuests. questID=" .. (questID or "") .. ", itemID=" .. (itemIDStr or "") .. "; neededItemCount=" .. (countStr or ""))
				end
			end

			if completedItemData ~= nil then
				local dicCurItemStats = dicItemStats[completedItemData.id]

				if dicCurItemStats ~= nil then
					dicCurItemStats.requiredAmount = dicCurItemStats.requiredAmount + completedItemData.requiredAmount
					table.insert(dicCurItemStats.quests, { id=questID, quest=questData })
				else
					dicItemStats[completedItemData.id] = completedItemData 
				end
			else
				table.insert(lstQuestsReqAnyAmount, { questID=questID, quest=questData, items=questItemDetails })
			end
		end
	end

	local sortedListNormal = {}
	for _, item in pairs(dicItemStats) do
		table.insert(sortedListNormal, item)
	end

	table.sort(sortedListNormal, function(a, b)
		local aName = a.name and a.name ~= "" and a.name or nil
		local bName = b.name and b.name ~= "" and b.name or nil

		if not aName and not bName then
			return a.id < b.id
		elseif not aName then
			return false
		elseif not bName then
			return true
		end

		return aName < bName
	end)


	table.sort(lstQuestsReqAnyAmount, function(a, b)
		local aName = a.quest.name
		local bName = b.quest.name

		if not aName and not bName then
			return a.id < b.id
		elseif not aName then
			return false
		elseif not bName then
			return true
		end

		return aName < bName
	end)

	return sortedListNormal, lstQuestsReqAnyAmount
end

---@param questID number
function CasualTBCPrep.QuestData.GetQuestProgressionDetailsFromID(questID)
	local questObj = questsMetadata[questID]
	return CasualTBCPrep.QuestData.GetQuestProgressionDetails(questObj)
end

function CasualTBCPrep.QuestData.GetQuestProgressionDetails(quest)
	if quest == nil or quest.id == nil then
		return false, nil, nil, {r=1,g=1,b=1}
	end

	local isQuestCompleted = CasualTBCPrep.QuestData.HasCharacterCompletedQuest(quest.id)
	local hasFullyPreparedQuest, hasRequiredItemsInBank = CasualTBCPrep.QuestData.HasPlayerFullyPreparedQuestExceptPrequests(quest.id, false, false, false)
	local itemDisplayList = { }
	local nextPreQuest = nil


	if quest.reqItems then
		for itemPair in string.gmatch(quest.reqItems, "([^,]+)") do
			local itemIDStr, countStr = string.match(itemPair, "(%d+)-(%d+)")

			if itemIDStr and countStr then
				local itemID = tonumber(itemIDStr)

				local playerInvCount = C_Item.GetItemCount(itemID, false)
				local totalPlayerCount = C_Item.GetItemCount(itemID, true)
				local playerBankCount = totalPlayerCount - playerInvCount

				table.insert(itemDisplayList, {
					itemID = itemID,
					playerInvAmount = playerInvCount,
					playerBankAmount = playerBankCount,
					playerTotalAmount = totalPlayerCount,
					requiredAmount = tonumber(countStr)
				})
			end
		end
	end

    if quest.preQuests then
    	local questCount = 0
    	local currentStep = 0
        local foundQuest = nil

        for questIDStr in string.gmatch(quest.preQuests, "([^,]+)") do
        	questCount = questCount + 1

            if foundQuest == nil then
            	currentStep = currentStep + 1
                local questID = tonumber(questIDStr)
                local preQuestObj = CasualTBCPrep.QuestData.GetPreQuest(questID)

                if preQuestObj then
                	if not CasualTBCPrep.QuestData.HasCharacterCompletedQuest(questID) then
                    	foundQuest = preQuestObj
            		currentStep = currentStep - 1
                    end
                else
                	CasualTBCPrep.NotifyUserError("Couldn't find preQuest metadata for PreQuest with ID '" .. questIDStr .. "'")
                end
			end
		end

        if foundQuest ~= nil then
        	nextPreQuest = { questName = foundQuest.name, startZone = foundQuest.startZone, step=currentStep, questCount=questCount}
        end
    end

	if nextPreQuest ~= nil then
		hasFullyPreparedQuest = false
	end

	local questTextColorRGB = nil
	if isQuestCompleted then
		questTextColorRGB = CasualTBCPrep.ColorRGB_CompletedQuest
	else
		if hasFullyPreparedQuest then
			if hasRequiredItemsInBank then
				questTextColorRGB = CasualTBCPrep.ColorRGB_BankedButReadyQuest
			else
				questTextColorRGB = CasualTBCPrep.ColorRGB_ReadyQuest
			end
		else
			questTextColorRGB = CasualTBCPrep.ColorRGB_AvailableQuest
		end
	end

	return hasFullyPreparedQuest, itemDisplayList, nextPreQuest, questTextColorRGB
end


function CasualTBCPrep.QuestData.GetCharacterQuestLogStates_Main()
	local available = {};
	local completed = {};
	local optAvailable = {};
	local optCompleted = {};


	for _, questID in ipairs(questLogList) do
		local quest = questsMetadata[questID]

		if quest then
			if CasualTBCPrep.QuestData.IsQuestValidForUser(quest) then
				if CasualTBCPrep.QuestData.HasCharacterCompletedQuest(questID) then
					table.insert(completed, {id = questID, data = quest})
				else
					table.insert(available, {id = questID, data = quest})
				end
			end
		else
			CasualTBCPrep.NotifyUserError("Quest '" .. questID .. "' was not found in metadate table!!!")
		end
	end

	for _, questID in ipairs(questLogListAlts) do
		local quest = questsMetadata[questID]

		if quest then
			if CasualTBCPrep.QuestData.IsQuestValidForUser(quest) then
				if CasualTBCPrep.QuestData.HasCharacterCompletedQuest(questID) then
					table.insert(optCompleted, {id = questID, data = quest})
				else
					table.insert(optAvailable, {id = questID, data = quest})
				end
			end
		else
			CasualTBCPrep.NotifyUserError("Optional Quest '" .. questID .. "' was not found in metadate table!!!")
		end
	end

	return available, completed, optAvailable, optCompleted
end




--[AllQuestGroup Getters]

function CasualTBCPrep.QuestData.GetAllQuestsGroup_Questlog()
	local available = {};
	local completed = {};

	for _, questID in ipairs(questLogList) do
		local quest = questsMetadata[questID]

		if quest then
			if CasualTBCPrep.QuestData.IsQuestValidForUser(quest) then
				if CasualTBCPrep.QuestData.HasCharacterCompletedQuest(questID) then
					table.insert(completed, { quest=quest })
				else
					table.insert(available, { quest=quest })
				end
			end
		else
			CasualTBCPrep.NotifyUserError("'AllQuests - Questlog List', Quest '" .. questID .. "' was not found in metadate table!!!")
		end
	end

	return available, completed
end

function CasualTBCPrep.QuestData.GetAllQuestsGroup_Questlog_Optional()
	local resultOptionalQuests = {};

	local preparedOptionalQuests = {};
	local potentialOptionalQuests = {};

	local optionalQuestsNeeded = 0

	for _, questID in ipairs(questLogList) do
		local quest = questsMetadata[questID]

		if quest then
			if CasualTBCPrep.QuestData.IsQuestValidForUser(quest) then
				if CasualTBCPrep.QuestData.HasCharacterCompletedQuest(questID) then
					optionalQuestsNeeded = optionalQuestsNeeded + 1
				end
			end
		else
			CasualTBCPrep.NotifyUserError("'AllQuests - Questlog List', Quest '" .. questID .. "' was not found in metadate table!!!")
		end
	end

	if optionalQuestsNeeded > 0 then
		local preparedOptQuestCount = 0
		for _, questID in ipairs(questLogListAlts) do
			local quest = questsMetadata[questID]

			if quest then
				if CasualTBCPrep.QuestData.IsQuestValidForUser(quest) then
					local hasFullyPreparedQuest, _, nextPreQuest, _ = CasualTBCPrep.QuestData.GetQuestProgressionDetails(quest)

					if hasFullyPreparedQuest and nextPreQuest == nil then
						table.insert(preparedOptionalQuests, quest)

						preparedOptQuestCount = preparedOptQuestCount + 1
					else
						table.insert(potentialOptionalQuests, quest)
					end
				end
			else
				CasualTBCPrep.NotifyUserError("'AllQuests - Questlog List', Quest '" .. questID .. "' was not found in metadate table!!!")
			end
		end

		if preparedOptQuestCount >= optionalQuestsNeeded then
			potentialOptionalQuests = nil

			local index = 1
			while index <= optionalQuestsNeeded do
				local quest = preparedOptionalQuests[index]
				table.insert(resultOptionalQuests, { quest=quest })
				index = index + 1
			end
		else
			for _, quest in ipairs(preparedOptionalQuests) do
				table.insert(resultOptionalQuests, { quest=quest })
			end
		end

		optionalQuestsNeeded = optionalQuestsNeeded - preparedOptQuestCount

		if optionalQuestsNeeded > 0 and potentialOptionalQuests ~= nil and #potentialOptionalQuests > 0 then
			local index = 1
			while index <= math.min(optionalQuestsNeeded, #potentialOptionalQuests) do
				local quest = potentialOptionalQuests[index]
				table.insert(resultOptionalQuests, { quest=quest })
				index = index + 1
			end
		end
	end

	-- Sort by EXP
	table.sort(resultOptionalQuests, function(a, b)
		if a.quest.baseexp == b.quest.baseexp then
			return a.quest.name < b.quest.name
		end
		return a.quest.baseexp > b.quest.baseexp
	end)
	return resultOptionalQuests
end

function CasualTBCPrep.QuestData.GetAllQuestsGroup_Expensive()
	local available = {};
	local completed = {};

	for questID, oilerData in pairs(aqgl_expensiveQuests) do
		local quest = questsMetadata[questID]

		if quest then
			if CasualTBCPrep.QuestData.IsQuestValidForUser(quest) then
				local expHeader = oilerData.name
				local expNotice = oilerData.notice

				if CasualTBCPrep.QuestData.HasCharacterCompletedQuest(questID) then
					table.insert(completed, { quest=quest, header=expHeader, notice=expNotice })
				else
					table.insert(available, { quest=quest, header=expHeader, notice=expNotice })
				end
			end
		else
			CasualTBCPrep.NotifyUserError("'AllQuests - Expensive List', Quest '" .. questID .. "' was not found in metadate table!!!")
		end
	end

	return available, completed
end

function CasualTBCPrep.QuestData.GetAllQuestsGroup_Reputation()
	local available = {};
	local completed = {};

	for _, questID in ipairs(aqgl_reqRep) do
		local quest = questsMetadata[questID]

		if quest then
			if CasualTBCPrep.QuestData.IsQuestValidForUser(quest) and not aqgl_expensiveQuests[questID] then
				if CasualTBCPrep.QuestData.HasCharacterCompletedQuest(questID) then
					table.insert(completed, { quest=quest })
				else
					table.insert(available, { quest=quest })
				end
			end
		else
			CasualTBCPrep.NotifyUserError("'AllQuests - Reputation List', Quest '" .. questID .. "' was not found in metadate table!!!")
		end
	end

	return available, completed
end

function CasualTBCPrep.QuestData.GetAllQuestsGroup_Items()
	local available = {};
	local completed = {};

	for _, questID in ipairs(aqgl_reqItems) do
		local quest = questsMetadata[questID]

		if quest then
			if CasualTBCPrep.QuestData.IsQuestValidForUser(quest) and not aqgl_expensiveQuests[questID] then
				if CasualTBCPrep.QuestData.HasCharacterCompletedQuest(questID) then
					table.insert(completed, { quest=quest })
				else
					table.insert(available, { quest=quest })
				end
			end
		else
			CasualTBCPrep.NotifyUserError("'AllQuests - Item List', Quest '" .. questID .. "' was not found in metadate table!!!")
		end
	end

	return available, completed
end

function CasualTBCPrep.QuestData.GetAllQuestsGroup_Normal()
	local available = {};
	local completed = {};

	for _, questID in ipairs(aqgl_questPrep) do
		local quest = questsMetadata[questID]

		if quest then
			if CasualTBCPrep.QuestData.IsQuestValidForUser(quest) and not aqgl_expensiveQuests[questID] then
				if CasualTBCPrep.QuestData.HasCharacterCompletedQuest(questID) then
					table.insert(completed, { quest=quest })
				else
					table.insert(available, { quest=quest })
				end
			end
		else
			CasualTBCPrep.NotifyUserError("'AllQuests - Normal List', Quest '" .. questID .. "' was not found in metadate table!!!")
		end
	end

	return available, completed
end
