CasualTBCPrep.QuestData = CasualTBCPrep.QuestData or {}

local cachedPlayerClass = nil

-- Types: 
--  qlog    = For the questlog on tbc release
--  opt     = Optional QuestLog (Plan B)
--  turn    = Will be picked up and turned in while doing the turn-in run.
local questsMetadata = {
	[4123] = { id=4123, name="The Heart of the Mountain", exp=12250, type="qlog", reqItems="11309-1", areaType="Dungeon", area="Blackrock Depths" },
	[4862] = { id=4862, name="En-Ay-Es-Tee-Why", exp=13950, type="qlog", reqItems="12530-15", areaType="Dungeon", area="Lower Blackrock Spire" },
	[4729] = { id=4729, name="Kibler's Exotic Pets", exp=13950, type="qlog", reqItems="12263-1", areaType="Dungeon", area="Lower Blackrock Spire" },
	[4866] = { id=4866, name="Mother's Milk", exp=14300, type="qlog", areaType="Dungeon", area="Lower Blackrock Spire" },
	[4735] = { id=4735, name="Egg Collection", exp=14300, type="qlog", reqItems="12241-8,12287-1", preQuests="4726,4808,4809,4810,4734", areaType="Dungeon", area="Upper Blackrock Spire" },
	[4768] = { id=4768, name="The Darkstone Tablet", exp=14300, type="qlog", reqItems="12358-1", areaType="Dungeon", area="Upper Blackrock Spire" },
	[4724] = { id=4724, name="The Pack Mistress", exp=13950, type="qlog", areaType="Dungeon", area="Lower Blackrock Spire" },
	[4134] = { id=4134, name="Lost Thunderbrew Recipe", exp=12250, type="qlog", reqItems="11312-1", areaType="Dungeon", area="Blackrock Depths" },
	[4132] = { id=4132, name="Operation: Death to Angerforge", exp=13500, type="qlog", preQuests="4081,4082,4122,4121", areaType="Dungeon", area="Blackrock Depths" },
	[4063] = { id=4063, name="The Rise of the Machines", exp=13500, type="qlog", reqItems="11268-1,11269-10", preQuests="4061,4062,", areaType="Dungeon", area="Blackrock Depths" },
	[8279] = { id=8279, name="The Twilight Lexicon", exp=11900, type="qlog", reqItems="20394-1,20395-1,20396-1", preQuests="8284,8285", areaType="Zone", area="Silithus" },
	[3907] = { id=3907, name="Disharmony of Fire", exp=12650, qlvl=56, type="qlog", reqItems="11126-1", preQuests="3906", areaType="Dungeon", area="Blackrock Depths" },
	[8287] = { id=8287, name="A Terrible Purpose", exp=9550, qlvl=60, type="turnin", reqItems="20405-1", preQuests="8284,8285", areaType="Zone", area="Silithus" },
	[8314] = { id=8314, name="Unraveling the Mystery", exp=7150, qlvl=60, type="turnin", preQuests="8304,8309,8310", areaType="Zone", area="Silithus" },
	[8306] = { id=8306, name="Into The Maw of Madness", exp=11900, type="qlog", preQuests="8304", areaType="Zone", area="Silithus" },
	[3961] = { id=3961, name="Linken's Adventure", exp=3100, type="turnin", preQuests="3844,3845,3908,3909,3912,3913,3914,3941,3942,4084,4005", areaType="Zone", area="Un'Goro" },
	[4788] = { id=4788, name="The Final Tablets", exp=13500, type="qlog", reqItems="12740-1,12741-1", preQuests="3520,3527,4787,3528,5065", areaType="Dungeon", area="Lower Blackrock Spire" },
	[8181] = { id=8181, name="Confront Yeh'kinya", exp=9000, type="turnin", preQuests="3520,3527,4787,3528,5065", areaType="Zone", area="Tanaris" },
	[8182] = { id=8182, name="The Hand of Rastakhan", exp=13500, type="turnin", preQuests="3520,3527,4787,3528,5065", areaType="Zone", area="Tanaris" },
	[8201] = { id=8201, name="A Collection of Heads", exp=14300, type="qlog", reqItems="19880-1", areaType="Raid", area="Zul'Gurub" },
	[4004] = { id=4004, name="The Princess Saved?", exp=14300, type="qlog", preQuests="3906,3981,3982,4001,4002,4003", areaType="Dungeon", area="Blackrock Depths" },
	[4509] = { id=4509, name="Calm Before the Storm", exp=790, type="turnin", preQuests="4494,4496,4507", areaType="Zone", area="Tanaris" },
	[4511] = { id=4511, name="Calm Before the Storm", exp=9450, type="turnin", preQuests="4494,4496,4507", areaType="City", area="Orgrimmar" },
	[6822] = { id=6822, name="The Molten Core", exp=14300, type="qlog", preQuests="6804,6805,6821", areaType="Raid", area="Molten Core" },
	[6823] = { id=6823, name="Agent of Hydraxis", exp=14300, type="turnin", preQuests="6804,6805,6821", reqRep=749, reqRepRank=6, areaType="Raid", area="The Molten Core" },
	[5522] = { id=5522, name="Leonid Barthalomew", exp=7150, type="turnin", preQuests="4726,4808,4809,4810,4734", areaType="Dungeon", area="Upper Blackrock Spire" },
	[5531] = { id=5531, name="Betina Bigglezink", exp=2400, type="turnin", preQuests="4726,4808,4809,4810,4734", areaType="Dungeon", area="Upper Blackrock Spire" },
	[5263] = { id=5263, name="Above and Beyond", exp=14300, type="qlog", reqItems="13251-1", preQuests="5251,5262", areaType="Dungeon", area="Stratholme" },
	[5264] = { id=5264, name="Lord Maxwell Tyrosus", exp=9550, type="turnin", preQuests="5251,5262", areaType="Dungeon", area="Stratholme" },
	[5265] = { id=5265, name="The Argent Hold", exp=14300, type="turnin", preQuests="5251,5262", areaType="Dungeon", area="Stratholme" },
	[5529] = { id=5529, name="Plagued Hatchlings", exp=13500, type="qlog", areaType="Dungeon", area="Scholomance" },
	[5214] = { id=5214, name="The Great Ezra Grimm", exp=14300, type="qlog", reqItems="13172-1", areaType="Zone", area="Stratholme" },
	[5212] = { id=5212, name="Flesh Does Not Lie", exp=14300, type="qlog", reqItems="13174-10", areaType="Zone", area="Stratholme" },
	[5721] = { id=5721, name="The Battle of Darrowshire", exp=11900, type="qlog", preQuests="5149,5152,5153,5154,5210,5181,5168,5206,5941", areaType="Zone", area="The Plaguelands" },
	[5942] = { id=5942, name="Hidden Treasures", exp=14300, type="turnin", preQuests="5149,5152,5153,5154,5210,5181,5168,5206,5941", areaType="Zone", area="Eastern Plaguelands" },
	[6163] = { id=6163, name="Ramstein", exp=14300, type="qlog", reqItems="15880-1", preQuests="6022,6042,6133,6135,6136", areaType="Dungeon", area="Stratholme" },
	[5848] = { id=5848, name="Of Love and Family", exp=14300, type="qlog", reqItems="14679-1", preQuests="5542,5543,5544,5742,5781,5845,5846", areaType="Dungeon", area="Stratholme" },
	[5861] = { id=5861, name="Find Myranda", exp=7150, type="turnin", preQuests="5542,5543,5544,5742,5781,5845,5846", areaType="Zone", area="Eastern Plaguelands" },
	[5236] = { id=5236, name="Return to the Bulwark", exp=4500, type="turnin", preQuests="5096,5228,5229,5230,5231,5232,5233,5234,5235", areaType="Zone", area="Western Plaguelands" },
	[5238] = { id=5238, name="Mission Accomplished!", exp=13500, type="turnin", preQuests="5096,5228,5229,5230,5231,5232,5233,5234,5235", areaType="Zone", area="Western Plaguelands" },
	[5511] = { id=5511, name="The Key to Scholomance", exp=14300, type="turnin", preQuests="5096,5098,838,964,5514,5802,5804", areaType="Zone", area="Western Plaguelands" },
	[5341] = { id=5341, name="Barov Family Fortune", exp=14300, type="qlog", reqItems="13471-1,13448-1,13450-1,13451-1", areaType="Dungeon", area="Scholomance" },
	[105] = { id=105, name="Alas, Andorhal", exp=11900, type="optional", reqItems="17114-1", preQuests="5096,5098", areaType="Zone", area="Western Plaguelands" },
	[2702] = { id=2702, name="Heroes of Old", exp=4350, type="turnin", preQuests="2784,2621,2622,2623,2801,2681", areaType="Zone", area="Swamp of Sorrows" },
	[2701] = { id=2701, name="Heroes of Old", exp=8750, type="turnin", preQuests="2784,2621,2622,2623,2801,2681", areaType="Zone", area="Swamp of Sorrows" },
	[5213] = { id=5213, name="The Active Agent", exp=14300, type="optional", reqItems="13176-1", preQuests="5212", areaType="Dungeon", area="Stratholme" },
	[6148] = { id=6148, name="The Scarlet Oracle, Demetria", exp=11900, type="optional", preQuests="6022,6042,6133,6135,6136,6144,6145,6146,6147", areaType="Zone", area="Eastern Plaguelands" },
	[5342] = { id=5342, name="The Last Barov", exp=11900, type="optional", reqItems="13469-1", preQuests="5341", areaType="Zone", area="Western Plaguelands" },
	[5464] = { id=5464, name="Menethil's Gift", exp=11900, type="optional", reqItems="13624-1", preQuests="5382,5515,5384,5461,5462,5463", areaType="Dungeon", area="Scholomance" },
	[8283] = { id=8283, name="Wanted - Deathclasp, Terror of the Sands", exp=11600, type="optional", reqItems="20385-1", areaType="Zone", area="Silithus" },
	[9444] = { id=9444, name="Defiling Uther's Tomb", exp=11250, type="optional", reqItems="23691-1", preQuests="9443", areaType="Zone", area="Western Plaguelands" },
	[2681] = { id=2681, name="The Stones That Bind Us", exp=10900, type="optional", preQuests="2784,2621,2622,2623,2801", areaType="Zone", area="Blasted Lands" },
	[9229] = { id=9229, name="The Fate of Ramaladni", exp=9550, type="optional", reqItems="22708-1", areaType="Raid", area="Naxxramas" },
	[8310] = { id=8310, name="Breaking the Code", exp=9550, type="optional", reqItems="20457-1,20458-1,20459-1", preQuests="8304", areaType="Zone", area="Silithus" },
	[8309] = { id=8309, name="Glyph Chasing", exp=9550, type="optional", reqItems="20453-1,20455-1,20454-1,20456-1", preQuests="8304", areaType="Zone", area="Silithus" },
	[8288] = { id=8288, name="Only One May Rise", exp=9550, type="optional", reqItems="20383-1", preQuests="8286", areaType="Raid", area="Blackwing Lair" },
	[6024] = { id=6024, name="Hameya's Plea", exp=9550, type="optional", reqItems="15767-1", areaType="Zone", area="Eastern Plaguelands" },
	[9665] = { id=9665, name="Bolstering Our Defenses", exp=9550, qlvl=60, type="optional", areaType="Zone", area="Eastern Plaguelands" },
	[8321] = { id=8321, name="Vyral the Vile", exp=9550, qlvl=60, type="optional", reqItems="20466-1", preQuests="8320", areaType="Zone", area="Silithus" },
	[9023] = { id=9023, name="The Perfect Poison", exp=9550, type="optional", reqItems="22217-1,22216-1", areaType="Raid", area="AQ20 & ZG" },
	[7820] = { id=7820, name="A Donation of Wool", exp=960, type="turnin", reqItems="2592-60", areaType="City", area="Thunder Bluff" },
	[7821] = { id=7821, name="A Donation of Silk", exp=2400, type="turnin", reqItems="4306-60", areaType="City", area="Thunder Bluff" },
	[7822] = { id=7822, name="A Donation of Mageweave", exp=4750, type="turnin", reqItems="4338-60", areaType="City", area="Thunder Bluff" },
	[7823] = { id=7823, name="A Donation of Runecloth", exp=9550, type="turnin", reqItems="14047-60", areaType="City", area="Thunder Bluff" },
	[7813] = { id=7813, name="A Donation of Wool", exp=960, type="turnin", reqItems="2592-60", areaType="City", area="Undercity" },
	[7814] = { id=7814, name="A Donation of Silk", exp=2400, type="turnin", reqItems="4306-60", areaType="City", area="Undercity" },
	[7817] = { id=7817, name="A Donation of Mageweave", exp=4750, type="turnin", reqItems="4338-60", areaType="City", area="Undercity" },
	[7818] = { id=7818, name="A Donation of Runecloth", exp=9550, type="turnin", reqItems="14047-60", areaType="City", area="Undercity" },
	[10359] = { id=10359, name="A Donation of Wool", exp=960, type="turnin", reqItems="2592-60", areaType="City", area="Silvermoon City" },
	[10360] = { id=10360, name="A Donation of Silk", exp=2400, type="turnin", reqItems="4306-60", areaType="City", area="Silvermoon City" },
	[10361] = { id=10361, name="A Donation of Mageweave", exp=4750, type="turnin", reqItems="4338-60", areaType="City", area="Silvermoon City" },
	[10362] = { id=10362, name="A Donation of Runecloth", exp=9550, type="turnin", reqItems="14047-60", areaType="City", area="Silvermoon City" },
	[7833] = { id=7833, name="A Donation of Wool", exp=960, type="turnin", reqItems="2592-60", areaType="City", area="Orgrimmar" },
	[7834] = { id=7834, name="A Donation of Silk", exp=2400, type="turnin", reqItems="4306-60", areaType="City", area="Orgrimmar" },
	[7835] = { id=7835, name="A Donation of Mageweave", exp=4750, type="turnin", reqItems="4338-60", areaType="City", area="Orgrimmar" },
	[7836] = { id=7836, name="A Donation of Runecloth", exp=9550, type="turnin", reqItems="14047-60", areaType="City", area="Orgrimmar" },
	[7826] = { id=7826, name="A Donation of Wool", exp=960, type="turnin", reqItems="2592-60", areaType="City", area="Orgrimmar" },
	[7827] = { id=7827, name="A Donation of Silk", exp=2400, type="turnin", reqItems="4306-60", areaType="City", area="Orgrimmar" },
	[7831] = { id=7831, name="A Donation of Mageweave", exp=4750, type="turnin", reqItems="4338-60", areaType="City", area="Orgrimmar" },
	[7824] = { id=7824, name="A Donation of Runecloth", exp=9550, type="turnin", reqItems="14047-60", areaType="City", area="Orgrimmar" },
	[9120] = { id=9120, name="The Fall of Kel'Thuzad", exp=14300, type="turnin", reqItems="22520-1", areaType="Raid", area="Naxxramas" },
	[6026] = { id=6026, name="That's Asking A Lot", exp=9000, type="turnin", reqItems="11128-1,12359-2,10562-8,10560-8", areaType="Zone", area="Eastern Plaguelands" },
	[9128] = { id=9128, name="The Elemental Equation", exp=9550, type="turnin", reqItems="22527-30", areaType="Zone", area="Eastern Plaguelands" },
	[9124] = { id=9124, name="Cryptstalker Armor Doesn't Make Itself...", exp=9550, type="turnin", reqItems="22525-30", areaType="Zone", area="Eastern Plaguelands" },
	[9126] = { id=9126, name="Bonescythe Digs", exp=9550, type="turnin", reqItems="22526-30", areaType="Zone", area="Eastern Plaguelands" },
	[9131] = { id=9131, name="Binding the Dreadnaught", exp=9550, type="turnin", reqItems="22528-30", areaType="Zone", area="Eastern Plaguelands" },
	[9136] = { id=9136, name="Savage Flora", exp=9550, type="turnin", reqItems="22529-30", areaType="Zone", area="Eastern Plaguelands" },
	[5243] = { id=5243, name="Houses of the Holy", exp=14300, type="turnin", reqItems="13180-5", areaType="Dungeon", area="Stratholme" },
	[9141] = { id=9141, name="They Call Me \"The Rooster\"", exp=4750, type="turnin", reqItems="12844-1", areaType="Zone", area="Eastern Plaguelands" },
	[5513] = { id=5513, name="Mantles of the Dawn", exp=9550, type="turnin", reqItems="12844-10", reqRep=529, reqRepRank=7, areaType="Zone", area="Eastern Plaguelands" },
	[5517] = { id=5517, name="Chromatic Mantle of the Dawn", exp=11900, type="turnin", reqItems="12844-25", reqRep=529, reqRepRank=8, areaType="Zone", area="Eastern Plaguelands" },
	[9232] = { id=9232, name="The Only Song I Know...", exp=9550, type="turnin", reqItems="22682-2,7080-2,12361-2", areaType="Zone", area="Eastern Plaguelands" },
	[9230] = { id=9230, name="Ramaladni's Icy Grasp", exp=9550, type="turnin", reqItems="22682-1,12361-1,12360-1", preQuests="9229", areaType="Raid", area="Naxxramas" },
	[7490] = { id=7490, name="Victory for the Horde", exp=14300, qlvl=60, type="turnin", reqItems="18422-1", areaType="Raid", area="Onyxia's Lair" },
	[7491] = { id=7491, name="For All To See", exp=14300, qlvl=60, type="turnin", reqItems="18422-1", ignoreReqItemsForPrep=1, areaType="Raid", area="Onyxia's Lair" },
	[7783] = { id=7783, name="The Lord of Blackrock", exp=14300, qlvl=60, type="turnin", reqItems="19002-1", areaType="Raid", area="Blackwing Lair" },
	[7784] = { id=7784, name="The Lord of Blackrock", exp=14300, qlvl=60, type="turnin", reqItems="19002-1", ignoreReqItemsForPrep=1, areaType="Raid", area="Blackwing Lair" },
	[8978] = { id=8978, name="Return to Mokvar", exp=9550, type="turnin", preQuests="OVERWRITTEN_IN_ADDON", areaType="Zone", area="Tanaris" },
	[8944] = { id=8944, name="Just Compensation", exp=14300, type="turnin", reqItems="16736-1,16737-1", preQuests="8920,8923,8921,8924,8925,8928", playerClass="WARRIOR", areaType="City", area="Orgrimmar" },
	[8927] = { id=8927, name="Just Compensation", exp=14300, type="turnin", reqItems="16716-1,16717-1", preQuests="8913,8923,8921,8924,8925,8928", playerClass="DRUID", areaType="City", area="Orgrimmar" },
	[8939] = { id=8939, name="Just Compensation", exp=14300, type="turnin", reqItems="16685-1,16684-1", preQuests="8915,8923,8921,8924,8925,8928", playerClass="MAGE", areaType="City", area="Orgrimmar" },
	[8943] = { id=8943, name="Just Compensation", exp=14300, type="turnin", reqItems="16702-1,16705-1", preQuests="8919,8923,8921,8924,8925,8928", playerClass="WARLOCK", areaType="City", area="Orgrimmar" },
	[8940] = { id=8940, name="Just Compensation", exp=14300, type="turnin", reqItems="16696-1,16692-1", preQuests="8916,8923,8921,8924,8925,8928", playerClass="PRIEST", areaType="City", area="Orgrimmar" },
	[8942] = { id=8942, name="Just Compensation", exp=14300, type="turnin", reqItems="16673-1,16672-1", preQuests="8918,8923,8921,8924,8925,8928", playerClass="SHAMAN", areaType="City", area="Orgrimmar" },
	[10495] = { id=10495, name="Just Compensation", exp=14300, type="turnin", reqItems="16723-1,16724-1", preQuests="10493,8923,8921,8924,8925,8928", playerClass="PALADIN", areaType="City", area="Orgrimmar" },
	[8938] = { id=8938, name="Just Compensation", exp=14300, type="turnin", reqItems="16680-1,16676-1", preQuests="8914,8923,8921,8924,8925,8928", playerClass="HUNTER", areaType="City", area="Orgrimmar" },
	[8941] = { id=8941, name="Just Compensation", exp=14300, type="turnin", reqItems="16713-1,16712-1", preQuests="8917,8923,8921,8924,8925,8928", playerClass="ROGUE", areaType="City", area="Orgrimmar" },
	[8802] = { id=8802, name="The Savior of Kalimdor", exp=14300, type="turnin", reqItems="21221-1", preQuests="8801", areaType="Raid", area="Temple of Ahn'Qiraj" },
	[8301] = { id=8301, name="The Path of the Righteous", exp=9550, type="turnin", reqItems="20384-200", preQuests="8286,8288", areaType="Raid", area="Blackwing Lair" },
	[8791] = { id=8791, name="The Fall of Ossirian", exp=14300, type="turnin", reqItems="21220-1", areaType="Raid", area="Ruins of Ahn'Qiraj" },
	[8317] = { id=8317, name="Kitchen Assistance", exp=4350, type="turnin", reqItems="20452-10", preQuests="8307,8313", reqProf=185, reqProfSkill=285, areaType="Zone", area="Silithus" },
	[8308] = { id=8308, name="Brann Bronzebeard's Lost Letter", exp=11900, type="turnin", reqItems="20461-1", areaType="Zone", area="Silithus" },
	[8323] = { id=8323, name="True Believers", exp=9300, type="turnin", reqItems="20404-10", preQuests="8284,8285", areaType="Zone", area="Silithus" },
	[8318] = { id=8318, name="Secret Communication", exp=9550, type="turnin", reqItems="20404-10", areaType="Zone", area="Silithus" },
	[8361] = { id=8361, name="Abyssal Contacts", exp=9550, type="turnin", reqItems="20513-1", reqRep=609, reqRepRank=6, areaType="Zone", area="Silithus" },
	[8332] = { id=8332, name="Dukes of the Council", exp=9550, type="turnin", reqItems="20513-3,14344-1", preQuests="8331", reqRep=609, reqRepRank=6, areaType="Zone", area="Silithus" },
	[8341] = { id=8341, name="Lords of the Council", exp=9550, type="turnin", reqItems="20514-3,14344-5", preQuests="8343", reqRep=609, reqRepRank=7, areaType="Zone", area="Silithus" },
	[8348] = { id=8348, name="Signet of the Dukes", exp=11900, type="turnin", reqItems="20514-1", preQuests="8331", reqRep=609, reqRepRank=7, areaType="Zone", area="Silithus" },
	[8352] = { id=8352, name="Scepter of the Council", exp=14300, type="turnin", reqItems="20515-1", reqRep=609, reqRepRank=7, areaType="Zone", area="Silithus" },
	[9248] = { id=9248, name="Humble Offering", exp=9550, type="turnin", reqItems="20515-1", reqRep=609, reqRepRank=6, areaType="Zone", area="Silithus" },
	[8711] = { id=8711, name="Blade of Eternal Justice", exp=9550, type="turnin", reqItems="20886-1,20869-2,20861-5,20865-5", playerClass="PALADIN", reqRep=609, reqRepRank=8, areaType="Raid", area="Ruins of Ahn'Qiraj" },
	[8709] = { id=8709, name="Dagger of Veiled Shadows", exp=9550, type="turnin", reqItems="20886-1,20872-1,20859-5,20863-5", playerClass="ROGUE", reqRep=609, reqRepRank=8, areaType="Raid", area="Ruins of Ahn'Qiraj" },
	[8706] = { id=8706, name="Hammer of the Gathering Storm", exp=9550, type="turnin", reqItems="20886-1,20869-2,20861-5,20865-5", playerClass="SHAMAN", reqRep=609, reqRepRank=8, areaType="Raid", area="Ruins of Ahn'Qiraj" },
	[8712] = { id=8712, name="Scythe of the Unseen Path", exp=9550, type="turnin", reqItems="20886-1,20866-2,20860-5,20864-5", playerClass="HUNTER", reqRep=609, reqRepRank=8, areaType="Raid", area="Ruins of Ahn'Qiraj" },
	[8558] = { id=8558, name="Sickle of Unyielding Strength", exp=9550, type="turnin", reqItems="20886-1,20873-2,20862-5,20858-5", playerClass="WARRIOR", reqRep=609, reqRepRank=8, areaType="Raid", area="Ruins of Ahn'Qiraj" },
	[8707] = { id=8707, name="Blade of Vaulted Secrets", exp=9550, type="turnin", reqItems="20890-1,20871-2,20860-5,20864-5", playerClass="MAGE", reqRep=609, reqRepRank=8, areaType="Raid", area="Ruins of Ahn'Qiraj" },
	[8705] = { id=8705, name="Gavel of Infinite Wisdom", exp=9550, type="turnin", reqItems="20890-1,20868-2,20861-5,20865-5", playerClass="PRIEST", reqRep=609, reqRepRank=8, areaType="Raid", area="Ruins of Ahn'Qiraj" },
	[8710] = { id=8710, name="Kris of Unspoken Names", exp=9550, type="turnin", reqItems="20890-1,20867-2,20859-5,20863-5", playerClass="WARLOCK", reqRep=609, reqRepRank=8, areaType="Raid", area="Ruins of Ahn'Qiraj" },
	[8708] = { id=8708, name="Mace of Unending Life", exp=9550, type="turnin", reqItems="20890-1,20870-2,20862-5,20858-5", playerClass="DRUID", reqRep=609, reqRepRank=8, areaType="Raid", area="Ruins of Ahn'Qiraj" },
	[8693] = { id=8693, name="Cloak of Veiled Shadows", exp=9550, type="turnin", reqItems="20885-1,20866-2,20861-5,20865-5", playerClass="ROGUE", reqRep=609, reqRepRank=7, areaType="Raid", area="Ruins of Ahn'Qiraj" },
	[8557] = { id=8557, name="Drape of Unyielding Strength", exp=9550, type="turnin", reqItems="20885-1,20867-2,20864-5,20860-5", playerClass="WARRIOR", reqRep=609, reqRepRank=7, areaType="Raid", area="Ruins of Ahn'Qiraj" },
	[8691] = { id=8691, name="Drape of Vaulted Secrets", exp=9550, type="turnin", reqItems="20885-1,20873-2,20858-5,20862-5", playerClass="MAGE", reqRep=609, reqRepRank=7, areaType="Raid", area="Ruins of Ahn'Qiraj" },
	[8689] = { id=8689, name="Shroud of Infinite Wisdom", exp=9550, type="turnin", reqItems="20885-1,20870-2,20859-5,20863-5", playerClass="PRIEST", reqRep=609, reqRepRank=7, areaType="Raid", area="Ruins of Ahn'Qiraj" },
	[8694] = { id=8694, name="Shroud of Unspoken Names", exp=9550, type="turnin", reqItems="20889-1,20869-2,20861-5,20865-5", playerClass="WARLOCK", reqRep=609, reqRepRank=7, areaType="Raid", area="Ruins of Ahn'Qiraj" },
	[8692] = { id=8692, name="Cloak of Unending Life", exp=9550, type="turnin", reqItems="20889-1,20872-2,20864-5,20860-5", playerClass="DRUID", reqRep=609, reqRepRank=7, areaType="Raid", area="Ruins of Ahn'Qiraj" },
	[8696] = { id=8696, name="Cloak of the Unseen Path", exp=9550, type="turnin", reqItems="20889-1,20868-2,20858-5,20862-5", playerClass="HUNTER", reqRep=609, reqRepRank=7, areaType="Raid", area="Ruins of Ahn'Qiraj" },
	[8690] = { id=8690, name="Cloak of the Gathering Storm", exp=9550, type="turnin", reqItems="20889-1,20871-2,20863-5,20859-5", playerClass="SHAMAN", reqRep=609, reqRepRank=7, areaType="Raid", area="Ruins of Ahn'Qiraj" },
	[8695] = { id=8695, name="Cape of Eternal Justice", exp=9550, type="turnin", reqItems="20889-1,20871-2,20859-5,20863-5", playerClass="PALADIN", reqRep=609, reqRepRank=7, areaType="Raid", area="Ruins of Ahn'Qiraj" },
	[8697] = { id=8697, name="Ring of Infinite Wisdom", exp=9550, type="turnin", reqItems="20888-1,20871-2,20860-5,20864-5", playerClass="PRIEST", reqRep=609, reqRepRank=6, areaType="Raid", area="Ruins of Ahn'Qiraj" },
	[8702] = { id=8702, name="Ring of Unspoken Names", exp=9550, type="turnin", reqItems="20888-1,20870-2,20858-5,20862-5", playerClass="WARLOCK", reqRep=609, reqRepRank=6, areaType="Raid", area="Ruins of Ahn'Qiraj" },
	[8701] = { id=8701, name="Band of Veiled Shadows", exp=9550, type="turnin", reqItems="20888-1,20867-2,20858-5,20862-5", playerClass="ROGUE", reqRep=609, reqRepRank=6, areaType="Raid", area="Ruins of Ahn'Qiraj" },
	[8704] = { id=8704, name="Signet of the Unseen Path", exp=9550, type="turnin", reqItems="20888-1,20869-2,20859-5,20863-5", playerClass="HUNTER", reqRep=609, reqRepRank=6, areaType="Raid", area="Ruins of Ahn'Qiraj" },
	[8699] = { id=8699, name="Band of Vaulted Secrets", exp=9550, type="turnin", reqItems="20884-1,20866-2,20859-5,20863-5", playerClass="MAGE", reqRep=609, reqRepRank=6, areaType="Raid", area="Ruins of Ahn'Qiraj" },
	[8700] = { id=8700, name="Band of Unending Life", exp=9550, type="turnin", reqItems="20884-1,20873-2,20861-5,20865-5", playerClass="DRUID", reqRep=609, reqRepRank=6, areaType="Raid", area="Ruins of Ahn'Qiraj" },
	[8698] = { id=8698, name="Ring of the Gathering Storm", exp=9550, type="turnin", reqItems="20884-1,20872-2,20860-5,20864-5", playerClass="SHAMAN", reqRep=609, reqRepRank=6, areaType="Raid", area="Ruins of Ahn'Qiraj" },
	[8556] = { id=8556, name="Signet of Unyielding Strength", exp=9550, type="turnin", reqItems="20884-1,20868-2,20861-5,20865-5", playerClass="WARRIOR", reqRep=609, reqRepRank=6, areaType="Raid", area="Ruins of Ahn'Qiraj" },
	[8703] = { id=8703, name="Ring of Eternal Justice", exp=9550, type="turnin", reqItems="20884-1,20872-2,20860-5,20864-5", playerClass="PALADIN", reqRep=609, reqRepRank=6, areaType="Raid", area="Ruins of Ahn'Qiraj" },
	[8183] = { id=8183, name="The Heart of Hakkar", exp=14300, type="turnin", reqItems="19802-1", areaType="Raid", area="Zul'Gurub" },
	[8240] = { id=8240, name="A Bijou for Zanza", exp=9550, type="turnin", reqItems="19708-1,19713-1,19715-1,19711-1,19710-1,19712-1,19707-1,19714-1,19709-1", reqAnyItem=1, areaType="Zone", area="Stranglethorn Vale" },
	[8145] = { id=8145, name="The Maelstrom's Tendril", exp=9550, type="turnin", playerClass="HUNTER", reqRep=270, reqRepRank=5, areaType="Raid", area="Zul'Gurub" },
	[8146] = { id=8146, name="The Maelstrom's Tendril", exp=9550, type="turnin", playerClass="HUNTER", reqRep=270, reqRepRank=6, areaType="Raid", area="Zul'Gurub" },
	[8147] = { id=8147, name="The Maelstrom's Tendril", exp=9550, type="turnin", playerClass="HUNTER", reqRep=270, reqRepRank=7, areaType="Raid", area="Zul'Gurub" },
	[8148] = { id=8148, name="Maelstrom's Wrath", exp=9550, type="turnin", playerClass="HUNTER", reqRep=270, reqRepRank=8, areaType="Raid", area="Zul'Gurub" },
	[8041] = { id=8041, name="Strength of Mount Mugamba", exp=9550, type="turnin", playerClass="WARRIOR", reqRep=270, reqRepRank=5, areaType="Raid", area="Zul'Gurub" },
	[8042] = { id=8042, name="Strength of Mount Mugamba", exp=9550, type="turnin", playerClass="WARRIOR", reqRep=270, reqRepRank=6, areaType="Raid", area="Zul'Gurub" },
	[8043] = { id=8043, name="Strength of Mount Mugamba", exp=9550, type="turnin", playerClass="WARRIOR", reqRep=270, reqRepRank=7, areaType="Raid", area="Zul'Gurub" },
	[8044] = { id=8044, name="The Rage of Mugamba", exp=9550, type="turnin", playerClass="WARRIOR", reqRep=270, reqRepRank=8, areaType="Raid", area="Zul'Gurub" },
	[8110] = { id=8110, name="Enchanted South Seas Kelp", exp=9550, type="turnin", playerClass="DRUID", reqRep=270, reqRepRank=5, areaType="Raid", area="Zul'Gurub" },
	[8111] = { id=8111, name="Enchanted South Seas Kelp", exp=9550, type="turnin", playerClass="DRUID", reqRep=270, reqRepRank=6, areaType="Raid", area="Zul'Gurub" },
	[8112] = { id=8112, name="Enchanted South Seas Kelp", exp=9550, type="turnin", playerClass="DRUID", reqRep=270, reqRepRank=7, areaType="Raid", area="Zul'Gurub" },
	[8113] = { id=8113, name="Pristine Enchanted South Seas Kelp", exp=9550, type="turnin", playerClass="DRUID", reqRep=270, reqRepRank=8, areaType="Raid", area="Zul'Gurub" },
	[8101] = { id=8101, name="The Pebble of Kajaro", exp=9550, type="turnin", playerClass="MAGE", reqRep=270, reqRepRank=5, areaType="Raid", area="Zul'Gurub" },
	[8102] = { id=8102, name="The Pebble of Kajaro", exp=9550, type="turnin", playerClass="MAGE", reqRep=270, reqRepRank=6, areaType="Raid", area="Zul'Gurub" },
	[8103] = { id=8103, name="The Pebble of Kajaro", exp=9550, type="turnin", playerClass="MAGE", reqRep=270, reqRepRank=7, areaType="Raid", area="Zul'Gurub" },
	[8104] = { id=8104, name="The Jewel of Kajaro", exp=9550, type="turnin", playerClass="MAGE", reqRep=270, reqRepRank=8, areaType="Raid", area="Zul'Gurub" },
	[8106] = { id=8106, name="Kezan's Taint", exp=9550, type="turnin", playerClass="WARLOCK", reqRep=270, reqRepRank=5, areaType="Raid", area="Zul'Gurub" },
	[8107] = { id=8107, name="Kezan's Taint", exp=9550, type="turnin", playerClass="WARLOCK", reqRep=270, reqRepRank=6, areaType="Raid", area="Zul'Gurub" },
	[8108] = { id=8108, name="Kezan's Taint", exp=9550, type="turnin", playerClass="WARLOCK", reqRep=270, reqRepRank=7, areaType="Raid", area="Zul'Gurub" },
	[8109] = { id=8109, name="Kezan's Unstoppable Taint", exp=9550, type="turnin", playerClass="WARLOCK", reqRep=270, reqRepRank=8, areaType="Raid", area="Zul'Gurub" },
	[8049] = { id=8049, name="The Eye of Zuldazar", exp=9550, type="turnin", playerClass="PRIEST", reqRep=270, reqRepRank=5, areaType="Raid", area="Zul'Gurub" },
	[8050] = { id=8050, name="The Eye of Zuldazar", exp=9550, type="turnin", playerClass="PRIEST", reqRep=270, reqRepRank=6, areaType="Raid", area="Zul'Gurub" },
	[8051] = { id=8051, name="The Eye of Zuldazar", exp=9550, type="turnin", playerClass="PRIEST", reqRep=270, reqRepRank=7, areaType="Raid", area="Zul'Gurub" },
	[8052] = { id=8052, name="The All-Seeing Eye of Zuldazar", exp=9550, type="turnin", playerClass="PRIEST", reqRep=270, reqRepRank=8, areaType="Raid", area="Zul'Gurub" },
	[8116] = { id=8116, name="Vision of Voodress", exp=9550, type="turnin", playerClass="SHAMAN", reqRep=270, reqRepRank=5, areaType="Raid", area="Zul'Gurub" },
	[8117] = { id=8117, name="Vision of Voodress", exp=9550, type="turnin", playerClass="SHAMAN", reqRep=270, reqRepRank=6, areaType="Raid", area="Zul'Gurub" },
	[8118] = { id=8118, name="Vision of Voodress", exp=9550, type="turnin", playerClass="SHAMAN", reqRep=270, reqRepRank=7, areaType="Raid", area="Zul'Gurub" },
	[8119] = { id=8119, name="The Unmarred Vision of Voodress", exp=9550, type="turnin", playerClass="SHAMAN", reqRep=270, reqRepRank=8, areaType="Raid", area="Zul'Gurub" },
	[8045] = { id=8045, name="The Hearthen's Brand", exp=9550, type="turnin", playerClass="PALADIN", reqRep=270, reqRepRank=5, areaType="Raid", area="Zul'Gurub" },
	[8046] = { id=8046, name="The Hearthen's Brand", exp=9550, type="turnin", playerClass="PALADIN", reqRep=270, reqRepRank=6, areaType="Raid", area="Zul'Gurub" },
	[8047] = { id=8047, name="The Hearthen's Brand", exp=9550, type="turnin", playerClass="PALADIN", reqRep=270, reqRepRank=7, areaType="Raid", area="Zul'Gurub" },
	[8048] = { id=8048, name="The Hero's Brand", exp=9550, type="turnin", playerClass="PALADIN", reqRep=270, reqRepRank=8, areaType="Raid", area="Zul'Gurub" },
	[8141] = { id=8141, name="Zandalarian Shadow Talisman", exp=9550, type="turnin", playerClass="ROGUE", reqRep=270, reqRepRank=5, areaType="Raid", area="Zul'Gurub" },
	[8142] = { id=8142, name="Zandalarian Shadow Talisman", exp=9550, type="turnin", playerClass="ROGUE", reqRep=270, reqRepRank=6, areaType="Raid", area="Zul'Gurub" },
	[8143] = { id=8143, name="Zandalarian Shadow Talisman", exp=9550, type="turnin", playerClass="ROGUE", reqRep=270, reqRepRank=7, areaType="Raid", area="Zul'Gurub" },
	[8144] = { id=8144, name="Zandalarian Shadow Mastery Talisman", exp=9550, type="turnin", playerClass="ROGUE", reqRep=270, reqRepRank=8, areaType="Raid", area="Zul'Gurub" },
	[8060] = { id=8060, name="Paragons of Power: The Illusionist's Wraps", exp=9550, type="turnin", reqItems="19716-1", playerClass="MAGE", reqRep=270, reqRepRank=5, areaType="Raid", area="Zul'Gurub" },
	[8068] = { id=8068, name="Paragons of Power: The Illusionist's Mantle", exp=9550, type="turnin", reqItems="19721-1", playerClass="MAGE", reqRep=270, reqRepRank=6, areaType="Raid", area="Zul'Gurub" },
	[8069] = { id=8069, name="Paragons of Power: The Illusionist's Robes", exp=9550, type="turnin", reqItems="19723-1", playerClass="MAGE", reqRep=270, reqRepRank=7, areaType="Raid", area="Zul'Gurub" },
	[8061] = { id=8061, name="Paragons of Power: The Confessor's Wraps", exp=9550, type="turnin", reqItems="19718-1", playerClass="PRIEST", reqRep=270, reqRepRank=5, areaType="Raid", area="Zul'Gurub" },
	[8070] = { id=8070, name="Paragons of Power: The Confessor's Bindings", exp=9550, type="turnin", reqItems="19720-1", playerClass="PRIEST", reqRep=270, reqRepRank=6, areaType="Raid", area="Zul'Gurub" },
	[8071] = { id=8071, name="Paragons of Power: The Confessor's Mantle", exp=9550, type="turnin", reqItems="19724-1", playerClass="PRIEST", reqRep=270, reqRepRank=7, areaType="Raid", area="Zul'Gurub" },
	[8059] = { id=8059, name="Paragons of Power: The Demoniac's Wraps", exp=9550, type="turnin", reqItems="19718-1", playerClass="WARLOCK", reqRep=270, reqRepRank=5, areaType="Raid", area="Zul'Gurub" },
	[8076] = { id=8076, name="Paragons of Power: The Demoniac's Mantle", exp=9550, type="turnin", reqItems="19720-1", playerClass="WARLOCK", reqRep=270, reqRepRank=6, areaType="Raid", area="Zul'Gurub" },
	[8077] = { id=8077, name="Paragons of Power: The Demoniac's Robes", exp=9550, type="turnin", reqItems="19723-1", playerClass="WARLOCK", reqRep=270, reqRepRank=7, areaType="Raid", area="Zul'Gurub" },
	[8057] = { id=8057, name="Paragons of Power: The Haruspex's Bracers", exp=9550, type="turnin", reqItems="19718-1", playerClass="DRUID", reqRep=270, reqRepRank=5, areaType="Raid", area="Zul'Gurub" },
	[8064] = { id=8064, name="Paragons of Power: The Haruspex's Belt", exp=9550, type="turnin", reqItems="19720-1", playerClass="DRUID", reqRep=270, reqRepRank=6, areaType="Raid", area="Zul'Gurub" },
	[8065] = { id=8065, name="Paragons of Power: The Haruspex's Tunic", exp=9550, type="turnin", reqItems="19722-1", playerClass="DRUID", reqRep=270, reqRepRank=7, areaType="Raid", area="Zul'Gurub" },
	[8063] = { id=8063, name="Paragons of Power: The Madcap's Bracers", exp=9550, type="turnin", reqItems="19717-1", playerClass="ROGUE", reqRep=270, reqRepRank=5, areaType="Raid", area="Zul'Gurub" },
	[8072] = { id=8072, name="Paragons of Power: The Madcap's Mantle", exp=9550, type="turnin", reqItems="19719-1", playerClass="ROGUE", reqRep=270, reqRepRank=6, areaType="Raid", area="Zul'Gurub" },
	[8073] = { id=8073, name="Paragons of Power: The Madcap's Tunic", exp=9550, type="turnin", reqItems="19724-1", playerClass="ROGUE", reqRep=270, reqRepRank=7, areaType="Raid", area="Zul'Gurub" },
	[8062] = { id=8062, name="Paragons of Power: The Predator's Bracers", exp=9550, type="turnin", reqItems="19716-1", playerClass="HUNTER", reqRep=270, reqRepRank=5, areaType="Raid", area="Zul'Gurub" },
	[8066] = { id=8066, name="Paragons of Power: The Predator's Belt", exp=9550, type="turnin", reqItems="19721-1", playerClass="HUNTER", reqRep=270, reqRepRank=6, areaType="Raid", area="Zul'Gurub" },
	[8067] = { id=8067, name="Paragons of Power: The Predator's Mantle", exp=9550, type="turnin", reqItems="19724-1", playerClass="HUNTER", reqRep=270, reqRepRank=7, areaType="Raid", area="Zul'Gurub" },
	[8056] = { id=8056, name="Paragons of Power: The Augur's Bracers", exp=9550, type="turnin", reqItems="19717-1", playerClass="SHAMAN", reqRep=270, reqRepRank=5, areaType="Raid", area="Zul'Gurub" },
	[8074] = { id=8074, name="Paragons of Power: The Augur's Belt", exp=9550, type="turnin", reqItems="19719-1", playerClass="SHAMAN", reqRep=270, reqRepRank=6, areaType="Raid", area="Zul'Gurub" },
	[8075] = { id=8075, name="Paragons of Power: The Augur's Hauberk", exp=9550, type="turnin", reqItems="19722-1", playerClass="SHAMAN", reqRep=270, reqRepRank=7, areaType="Raid", area="Zul'Gurub" },
	[8058] = { id=8058, name="Paragons of Power: The Vindicator's Armguards", exp=9550, type="turnin", reqItems="19717-1", playerClass="WARRIOR", reqRep=270, reqRepRank=5, areaType="Raid", area="Zul'Gurub" },
	[8078] = { id=8078, name="Paragons of Power: The Vindicator's Belt", exp=9550, type="turnin", reqItems="19719-1", playerClass="WARRIOR", reqRep=270, reqRepRank=6, areaType="Raid", area="Zul'Gurub" },
	[8079] = { id=8079, name="Paragons of Power: The Vindicator's Breastplate", exp=9550, type="turnin", reqItems="19723-1", playerClass="WARRIOR", reqRep=270, reqRepRank=7, areaType="Raid", area="Zul'Gurub" },
	[8053] = { id=8053, name="Paragons of Power: The Freethinker's Armguards", exp=9550, type="turnin", reqItems="19716-1", playerClass="PALADIN", reqRep=270, reqRepRank=5, areaType="Raid", area="Zul'Gurub" },
	[8054] = { id=8054, name="Paragons of Power: The Freethinker's Belt", exp=9550, type="turnin", reqItems="19721-1", playerClass="PALADIN", reqRep=270, reqRepRank=6, areaType="Raid", area="Zul'Gurub" },
	[8055] = { id=8055, name="Paragons of Power: The Freethinker's Breastplate", exp=9550, type="turnin", reqItems="19722-1", playerClass="PALADIN", reqRep=270, reqRepRank=7, areaType="Raid", area="Zul'Gurub" },
	[2583] = { id=2583, name="A Boar's Vitality", exp=680, type="turnin", reqItems="8392-3,8393-2,8394-1", areaType="Zone", area="Blasted Lands" },
	[2603] = { id=2603, name="Vulture's Vigor", exp=680, type="turnin", reqItems="8396-10,8391-2", areaType="Zone", area="Blasted Lands" },
	[2601] = { id=2601, name="The Basilisk's Bite", exp=680, type="turnin", reqItems="8394-10,8396-2", areaType="Zone", area="Blasted Lands" },
	[2585] = { id=2585, name="The Decisive Striker", exp=680, type="turnin", reqItems="8393-3,8396-2,8392-1", areaType="Zone", area="Blasted Lands" },
	[2581] = { id=2581, name="Snickerfang Jowls", exp=680, type="turnin", reqItems="8391-3,8392-2,8393-1", areaType="Zone", area="Blasted Lands" },
	[2521] = { id=2521, name="To Serve Kum'isha", exp=12250, type="turnin", reqItems="8244-1", areaType="Zone", area="Blasted Lands" },
	[3501] = { id=3501, name="Everything Counts In Large Amounts", exp=8150, type="turnin", reqItems="10593-1", areaType="Zone", area="Blasted Lands" },
	[8471] = { id=8471, name="Winterfall Ritual Totem", exp=8450, type="turnin", reqItems="20742-1", areaType="Zone", area="Felwood" },
	[8470] = { id=8470, name="Deadwood Ritual Totem", exp=8150, type="turnin", reqItems="20741-1", areaType="Zone", area="Felwood" },
	[5083] = { id=5083, name="Winterfall Firewater", exp=4200, type="turnin", reqItems="12771-1", areaType="Zone", area="Winterspring" },
	[4148] = { id=4148, name="Bloodpetal Zapper", exp=3400, type="turnin", reqItems="11315-1", preQuests="4145,4147,4146", areaType="Zone", area="Un'Goro Crater" },
	[4284] = { id=4284, name="Crystals of Power", exp=4550, type="turnin", reqItems="11186-7,11188-7,11185-7,11184-7", areaType="Zone", area="Un'Goro Crater" },
	[6824] = { id=6824, name="Hands of the Enemy", exp=14300, qlvl=60, type="optional", preQuests="6804,6805,6821,6822,6823", areaType="Raid", area="The Molten Core" },
	[7486] = { id=7486, name="A Hero's Reward", exp=14300, qlvl=60, type="optional_turnin", preQuests="6804,6805,6821,6822,6823", areaType="Raid", area="The Molten Core" }
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
	[5846] = { name = "Of Love and Family", startZone = "Thondroril River (Tirion), EPL" }
}

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

-- Brood of Nozdormu Ring variations
questsMetadata[99001] = { name = "Brood Ring - Initial", 	exp=9550, 	qlvl=60, type="turnin", virtualQuest=true, actualQuests={8747,8752,8757}, reqRep=910, reqRepRank=4, areaType="Raid", area="Temple of Ahn'Qiraji" }
questsMetadata[99002] = { name = "Brood Ring - Friendly", 	exp=9550, 	qlvl=60, type="turnin", virtualQuest=true, actualQuests={8748,8753,8758}, reqRep=910, reqRepRank=5, areaType="Raid", area="Temple of Ahn'Qiraji" }
questsMetadata[99003] = { name = "Brood Ring - Honored", 	exp=9550, 	qlvl=60, type="turnin", virtualQuest=true, actualQuests={8749,8754,8759}, reqRep=910, reqRepRank=6, areaType="Raid", area="Temple of Ahn'Qiraji" }
questsMetadata[99004] = { name = "Brood Ring - Revered", 	exp=9550, 	qlvl=60, type="turnin", virtualQuest=true, actualQuests={8750,8755,8760}, reqRep=910, reqRepRank=7, areaType="Raid", area="Temple of Ahn'Qiraji" }
questsMetadata[99005] = { name = "Brood Ring - Exalted", 	exp=14300, 	qlvl=60, type="turnin", virtualQuest=true, actualQuests={8751,8756,8761}, reqRep=910, reqRepRank=8, areaType="Raid", area="Temple of Ahn'Qiraji" }


--[Debugging]
local checkPreQuests = false

if checkPreQuests == true then
	print("Checking preQuests");
	local cpqCount = 0
	for questID, questData in pairs(questsMetadata) do
		if questData.preQuests then
			for preQuestIDStr in string.gmatch(questData.preQuests, "([^,]+)") do
				local preQuestID = tonumber(preQuestIDStr)
				if preQuestID then
					if cpqCount < 15 then
						print("Quest " .. questID .. " (" .. questData.name .. ") references missing preQuest: " .. preQuestID)
					end
					cpqCount = cpqCount+ 1
				end
			end
		end
	end

	print("Found " .. cpqCount .. " prequests missing in questsMetadata")
end

--[Create & Sort Lookup Lists]

local questLogListPreSort = {}
local questLogList = {}
local dicQuestLogList = {}

local questLogListAltsPreSort = {}
local questLogListAlts = {}
local dicQuestLogListAlts = {}

local turnQuestListPreSort = {}
local turnQuestList = {}
local dicTurnQuestList = {}

-- Sorted Lists
--- QuestLogList
for questID, quest in pairs(questsMetadata) do
    if quest.type == "qlog" then
        table.insert(questLogListPreSort, { id = questID, exp = quest.exp, name = quest.name })
	    dicQuestLogList[questID] = true
    elseif quest.type == "optional" then
        table.insert(questLogListAltsPreSort, { id = questID, exp = quest.exp, name = quest.name })
	    dicQuestLogListAlts[questID] = true
    elseif quest.type == "turnin" then
        table.insert(turnQuestListPreSort, { id = questID, exp = quest.exp, name = quest.name })
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
end


-- QuestLogList Sort
table.sort(questLogListPreSort, function(a, b)
    if a.exp == b.exp then
        return a.name < b.name
    end
    return a.exp > b.exp
end)
for _, q in ipairs(questLogListPreSort) do
    table.insert(questLogList, q.id)
end

--- QuestLogListAlts Sort
table.sort(questLogListAltsPreSort, function(a, b)
    if a.exp == b.exp then
        return a.name < b.name
    end
    return a.exp > b.exp
end)

for _, q in ipairs(questLogListAltsPreSort) do
    table.insert(questLogListAlts, q.id)
end

--- TurnQuestList Sort
table.sort(turnQuestListPreSort, function(a, b)
    if a.exp == b.exp then
        return a.name < b.name
    end
    return a.exp > b.exp
end)

for _, q in ipairs(turnQuestListPreSort) do
    table.insert(turnQuestList, q.id)
end

-- Cleanup
questLogListPreSort = nil
questLogListAltsPreSort = nil
turnQuestListPreSort = nil


--[Local Functions]


--[Global Functions]
---@return boolean
function CasualTBCPrep.QuestData.IsQuestValidForUser(quest)
	if quest == nil then
		return false
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

	if not CasualTBCPrep.QuestData.IsQuestValidForUser(quest) or C_QuestLog.IsQuestFlaggedCompleted(questID) then
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

	for questID, questData in pairs(questsMetadata) do
		if questData.reqItems and (not questData.reqAnyItem or questData.reqAnyItem ~= 1) and (not questData.ignoreReqItemsForPrep or questData.ignoreReqItemsForPrep ~= 1) then
			local isValidQuest = false

			if onlyPreparedQuests == true then
				local hasFullyPreparedQuest, _ = CasualTBCPrep.QuestData.HasPlayerFullyPreparedQuestExceptPrequests(questID, false, false, true)
				isValidQuest = hasFullyPreparedQuest
			else
				isValidQuest = CasualTBCPrep.QuestData.IsQuestValidForUser(questData)
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

function CasualTBCPrep.QuestData.GetQuestProgressionDetails(quest)
	if quest == nil or quest.id == nil then
		return false, nil, nil, {r=1,g=1,b=1}
	end
	
	local isQuestCompleted = C_QuestLog.IsQuestFlaggedCompleted(quest.id)
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
                	if not C_QuestLog.IsQuestFlaggedCompleted(questID) then
                    	foundQuest = preQuestObj
            		currentStep = currentStep - 1
                    end
                else
                	CasualTBCPrep.NotifyUserError("Couldn't find metadata for PreQuest with ID '" .. questIDStr .. "'")
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
				if C_QuestLog.IsQuestFlaggedCompleted(questID) then
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
				if C_QuestLog.IsQuestFlaggedCompleted(questID) then
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
				if C_QuestLog.IsQuestFlaggedCompleted(questID) then
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
				if C_QuestLog.IsQuestFlaggedCompleted(questID) then
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
				local hasFullyPreparedQuest, _, nextPreQuest, _ = CasualTBCPrep.QuestData.GetQuestProgressionDetails(quest)

				if hasFullyPreparedQuest and nextPreQuest == nil then
					table.insert(preparedOptionalQuests, quest)

					preparedOptQuestCount = preparedOptQuestCount + 1
				else
					table.insert(potentialOptionalQuests, quest)
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
		if a.quest.exp == b.quest.exp then
			return a.quest.name < b.quest.name
		end
		return a.quest.exp > b.quest.exp
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

				if C_QuestLog.IsQuestFlaggedCompleted(questID) then
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
				if C_QuestLog.IsQuestFlaggedCompleted(questID) then
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
				if C_QuestLog.IsQuestFlaggedCompleted(questID) then
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
				if C_QuestLog.IsQuestFlaggedCompleted(questID) then
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
