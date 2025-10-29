CasualTBCPrep.Routing = CasualTBCPrep.Routing or {}

local cachedRouteQuestDic = {}

CasualTBCPrep.Routing.RouteCodeMain = "Main"
CasualTBCPrep.Routing.RouteCodeStrat = "Strat"
CasualTBCPrep.Routing.RouteCodeSolo = "Solo"
CasualTBCPrep.Routing.DefaultRouteCode = CasualTBCPrep.Routing.RouteCodeMain
CasualTBCPrep.Routing.CurrentRouteCode = CasualTBCPrep.Routing.RouteCodeMain

CasualTBCPrep.Routing.TravelTypes = {
    [0] = { text="Start", internal=true, },

    [1] = { text="Walk", internal=true, icon="Walk", iconW=19, iconH=32, color="FFE5C462" },
    [2] = { text="Run", internal=true, icon="Run", iconW=19, iconH=32, color="FFE5C462" },
    [11] = { text="Follow", internal=true, icon="Run", iconW=19, iconH=32, color="FFE5C462" },

    [3] = { text="Fly", icon="Fly", iconW=24, iconH=24, color="FF858483" },
    [4] = { text="Summon", icon="Summon", iconW=24, iconH=24, color="FF8E4EA1" },
    [5] = { text="Hearthstone", icon="Hearthstone", iconW=24, iconH=24, color="FFFFFFFF" },

    [6] = { text="Portal", icon="portal_og", iconW=24, iconH=24, color="FFEA4D0F" },
    [7] = { text="Portal", icon="portal_tb", iconW=24, iconH=24, color="FF6BC9F4" },
    [8] = { text="Portal", icon="portal_uc", iconW=24, iconH=24, color="FF63D72C" },
    [9] = { text="Portal", icon="portal_sc", iconW=24, iconH=24, color="FFB82D22" },
    [10] = { text="Portal", icon="portal_stonard", iconW=24, iconH=24, color="FFB2E223" },

    [12] = { text="Proceed", icon="felarma", iconW=24, iconH=24, color="FFE5C462" },
    [13] = { text="Enter", internal=true, icon="Run", iconW=24, iconH=24, color="FFE5C462" },
    [14] = { text="Leave Group", icon="Hearthstone", iconW=24, iconH=24, color="FFFFFFFF" },
}

local targetTexts = {
    ["BurningSteppes"] = { text="Flame Crest, Burning Steppe", travel="" },
    ["Badlands"] = { text="Kargath", travel="to Kargath, Badlands" },
    ["TarrenMill"] = { text="Tarren Mill", travel="to Tarren Mill, Hillsbrad Foothills" },
    ["wsEverlook"] = { text="Everlook", travel="to Everlook, Winterspring" },
    ["wsDonowa"] = { text="Donowa Snowden", travel="west to Donowa Snowden, south of the Timbermaw Cave" },
    ["Timbermaw"] = { text="Timbermaw Hold", travel="north to the Timbermaw Hold" },
    ["Moonglade"] = { text="Moonglade", travel="through the cave, and out north" },
    ["felwoodTown"] = { text="Bloodvenom Falls", travel="to Bloodvenom Falls, Felwood" },
    ["felwoodEmerald"] = { text="Emerald Sanctuary", travel="south (or summon) to the Emerald Sanctuary" },
    ["SilithusNE"] = { text="Valor's Rest", travel="Valor's Rest, Silithus" },
    ["SilithusCave"] = { text="Hermit Cave", travel="south to the hermit cave & do the Tower quest on the way" },
    ["SilithusSouth"] = { text="Bronzebeard Encampment", travel="southwest to the dwarf camp" },
    ["SilithusHold"] = { text="Cenarion Hold", travel="or deathskip to Cenarion Hold" },
    ["Ungoro"] = { text="Marshal's Refuge", travel="to Marshal's Refuge, Un'goro" },
    ["TanarisTown"] = { text="Gadgetzan", travel="to Gadgetzan, Tanaris" },
    ["TanarisPort"] = { text="Steamwheedle Port", travel="east to Steamwheedle Port" },
    ["CavernsOfTime"] = { text="Caverns of Time", travel="south to the Caverns of Time" },
    ["ThunderBluff"] = { text="Thunder Bluff", travel="to Thunder Bluff, Mulgore" },
    ["Orgrimmar"] = { text="Orgrimmar", travel="to Orgrimmar, Durotar" },
    ["Undercity"] = { text="Undercity", travel="to Undercity, Tirisfal Glades" },
    ["SilvermoonCity"] = { text="Silvermoon City", travel="to Silvermoon City, Eversong Woods" },
    ["BayOfStorms"] = { text="Bay of Storms", travel="to Bay of Storms, Azshara" },
    ["EPLTownMain"] = { text="The Plaguelands", travel="to Light's Hope Chapel, EPL" },
    ["EPLTown"] = { text="Light's Hope Chapel, EPL", travel="" },
    ["EPLDarrowshire"] = { text="Darrowshire", travel="southwest to Darrowshire" },
    ["EPLNathanos"] = { text="Nathanos Blightcaller", travel="northwest to Nathanos" },
    ["EPLTirion"] = { text="Tirion Fordring", travel="the river north to Tirion" },
    ["WPLCauldron"] = { text="Gahrron's Withering, WPL", travel="west across the river then south" },
    ["WPLCaerDarrow"] = { text="Caer Darrow", travel="and swim south to Caer Darrow" },
    ["Terrordale"] = { text="Terrordale", travel="" },
    ["Scholomance"] = { text="Scholomance", travel="Scholomance" },
    ["StratholmeGates"] = { text="Stratholme Main Entrance", travel="to the Stratholme Main Entrance & speak to Anthion" },
    ["StratholmeLiving"] = { text="Stratholme Living", travel="Stratholme" },
    ["StratholmeBackdoor"] = { text="Stratholme back entrance", travel="to the Stratholme back entrance" },
    ["StratholmeDead"] = { text="Stratholme Undead", travel="Stratholme" },
    ["WPLSorrowAndorhal"] = { text="Sorrow Hill", travel="west to Sorrow Hill, WPL" },
    ["WPLFelstoneField"] = { text="Felstone Field", travel="north to the Felstone Field" },
    ["WPLBulwark"] = { text="The Bulwark, Tirisfal Glades", travel="west to Tirisfal Glades" },
    ["zgSTV"] = { text="Stranglethorn Vale", travel="to Yojamba Isle, the ZG isle in STV" },
    ["Stonard"] = { text="Stonard", travel="" },
    ["oldhero"] = { text="The Fallen Hero", travel="southwest towards The Blasted Lands" },
    ["BlastedLands"] = { text="Blasted Lands", travel="" },
    ["TheDarkPortal"] = { text="The Dark Portal", travel="towards The Dark Portal" },
}

CasualTBCPrep.Routing.Routes = {
    [CasualTBCPrep.Routing.RouteCodeMain] =
    {
        key=CasualTBCPrep.Routing.RouteCodeMain,
        name="Main",
        extraExperience=0,
        description="",
        preparation=
        {
            "Set Hearthstone to Light's Hope Chapel, EPL"
        },
        sectionOrder = {
            "BurningSteppes","Badlands","AV","wsEverlook","wsDonowa","Timbermaw","Moonglade","felwoodTown","felwoodEmerald",
            "SilithusNE","SilithusCave","SilithusSouth","SilithusHold","SilithusNE2","Ungoro","TanarisTown","TanarisPort","CavernsOfTime",
            "ThunderBluff","Orgrimmar","Undercity","SilvermoonCity","BayOfStorms","EPLTown","EPLDarrowshire","EPLNathanos","EPLTirion","EPLEgan",
            "WPLCauldron","WPLCaerDarrow","WPLSorrowAndorhal","WPLFelstoneField","WPLBulwark","zgSTV","Stonard","oldhero","BlastedLands",
            "TheDarkPortal"
        },
        sections=
        {
            ["BurningSteppes"] = { key="BurningSteppes", estTime=30, travelType=0, quests={ } },
            ["Badlands"] = { key="Badlands", estTime=70, travelType=3, quests={ } },
            ["AV"] = { key="AV", estTime=125, travelType=4, textKey="TarrenMill", quests={ } },

            ["wsEverlook"] = { key="wsEverlook", estTime=75, travelType=4, quests={  } },
            ["wsDonowa"] = { key="wsDonowa", estTime=151, travelType=2, quests={  } },

            ["Timbermaw"] = { key="Timbermaw", estTime=112, travelType=2, quests={ } },

            ["Moonglade"] = { key="Moonglade", estTime=205, travelType=2, quests={ } },
            ["felwoodTown"] = { key="felwoodTown", estTime=165, travelType=3, quests={ } },
            ["felwoodEmerald"] = { key="felwoodEmerald", estTime=135, travelType=2, quests={ } },

            ["SilithusNE"] = { key="SilithusNE", estTime=60, travelType=4, quests={ }, canHaveZeroQuests=true },
            ["SilithusCave"] = { key="SilithusCave", estTime=180, travelType=2, quests={ } },
            ["SilithusSouth"] = { key="SilithusSouth", estTime=75, travelType=2, quests={ } },
            ["SilithusHold"] = { key="SilithusHold", estTime=95, travelType=2, quests={ } },
            ["SilithusNE2"] = { key="SilithusNE2", estTime=85, travelType=2, travelText="northeast towards Un'goro", textKey="SilithusNE", quests={ } },
            ["Ungoro"] = { key="Ungoro", estTime=177, travelType=3, quests={ } },
            ["TanarisTown"] = { key="TanarisTown", estTime=120, travelType=3, quests={ }, canHaveZeroQuests=true },
            ["TanarisPort"] = { key="TanarisPort", estTime=75, travelType=2, quests={ } },
            ["CavernsOfTime"] = { key="CavernsOfTime", estTime=111, travelType=2, quests={ } },

            ["ThunderBluff"] = { key="ThunderBluff", estTime=130, travelType=7, quests={ } },
            ["Orgrimmar"] = { key="Orgrimmar", estTime=167, travelType=6, quests={ } },
            ["Undercity"] = { key="Undercity", estTime=70, travelType=8, quests={ } },
            ["SilvermoonCity"] = { key="SilvermoonCity", estTime=120, travelType=9, quests={ } },
            ["BayOfStorms"] = { key="BayOfStorms", estTime=60, travelType=4, quests={ } },

            ["EPLTown"] = { key="EPLTown", estTime=191, travelType=5, textKey="EPLTownMain", quests={ } },
            ["EPLDarrowshire"] = { key="EPLDarrowshire", estTime=67, travelType=2, quests={ } },
            ["EPLNathanos"] = { key="EPLNathanos", estTime=43, travelType=2, quests={ } },
            ["EPLTirion"] = { key="EPLTirion", estTime=83, travelType=11, quests={ }, canHaveZeroQuests=true  },
            ["EPLEgan"] = { key="EPLEgan", estTime=150, travelType=2, quests={ } },
            ["WPLCauldron"] = { key="WPLCauldron", estTime=173, travelType=2, travelText="back through the cave, then west to WPL", quests={ }, canHaveZeroQuests=true },
            ["WPLCaerDarrow"] = { key="WPLCaerDarrow", estTime=74, travelType=2, quests={ }, canHaveZeroQuests=true },
            ["WPLSorrowAndorhal"] = { key="WPLSorrowAndorhal", estTime=70, travelType=2, quests={ } },
            ["WPLFelstoneField"] = { key="WPLFelstoneField", estTime=67, travelType=2, quests={ } },
            ["WPLBulwark"] = { key="WPLBulwark", estTime=39, travelType=2, quests={ } },

            ["zgSTV"] = { key="zgSTV", estTime=60, travelType=4, quests={ }, canHaveZeroQuests=true },
            ["Stonard"] = { key="Stonard", estTime=20, travelType=10, quests={ }, canHaveZeroQuests=true },
            ["oldhero"] = { key="oldhero", estTime=25, travelType=2, quests={ } },
            ["BlastedLands"] = { key="BlastedLands", estTime=52, travelType=2, quests={ } },
            ["TheDarkPortal"] = { key="TheDarkPortal", estTime=45, travelType=12, quests={ }, canHaveZeroQuests=true },
        }
    },
    [CasualTBCPrep.Routing.RouteCodeStrat] =
    {
        key=CasualTBCPrep.Routing.RouteCodeStrat,
        name="Strat",
        extraExperience=56000,
        description="",
        preparation=
        {
            "Set Hearthstone to Light's Hope Chapel, EPL",
            "5 Summons for full route",
            "A way to open strat backdoor (Key, Rogue, BS, Engi, character already inside)",
            "A way to open scholo door (Rogue, BS, Engi, character already inside)",
        },
        sectionOrder = {
            "BurningSteppes","Badlands","AV","wsEverlook","wsDonowa","Timbermaw","Moonglade","felwoodTown","felwoodEmerald",
            "SilithusNE","SilithusCave","SilithusSouth","SilithusHold","SilithusNE2","Ungoro","TanarisTown","TanarisPort","CavernsOfTime",
            "ThunderBluff","Orgrimmar","Undercity","SilvermoonCity","BayOfStorms","EPLTown","EPLDarrowshire","EPLNathanos","EPLTirion","WPLCauldron",
            "Scholomance","EPLTown2","EPLEgan","StratholmeGates1","Stratholme1","EPLTown3","StratholmeBackdoor","Stratholme2","EPLTown4","StratholmeGates2",
            "EPLEgan2", "EPLTirion2", "EPLNathanos2","WPLSorrowAndorhal","WPLFelstoneField","WPLBulwark","zgSTV","Stonard","oldhero","BlastedLands",
            "TheDarkPortal"
        },
        sections=
        {
            ["BurningSteppes"] = { key="BurningSteppes", estTime=30, travelType=0, quests={ } },
            ["Badlands"] = { key="Badlands", estTime=70, travelType=3, quests={ } },
            ["AV"] = { key="AV", estTime=125, travelType=4, textKey="TarrenMill", quests={ } },
            ["wsEverlook"] = { key="wsEverlook", estTime=75, travelType=4, quests={  } },
            ["wsDonowa"] = { key="wsDonowa", estTime=151, travelType=2, quests={  } },
            ["Timbermaw"] = { key="Timbermaw", estTime=112, travelType=2, quests={ } },
            ["Moonglade"] = { key="Moonglade", estTime=205, travelType=2, quests={ } },
            ["felwoodTown"] = { key="felwoodTown", estTime=165, travelType=3, quests={ } },
            ["felwoodEmerald"] = { key="felwoodEmerald", estTime=135, travelType=2, quests={ } },
            ["SilithusNE"] = { key="SilithusNE", estTime=60, travelType=4, quests={ }, canHaveZeroQuests=true },
            ["SilithusCave"] = { key="SilithusCave", estTime=180, travelType=2, quests={ } },
            ["SilithusSouth"] = { key="SilithusSouth", estTime=75, travelType=2, quests={ } },
            ["SilithusHold"] = { key="SilithusHold", estTime=95, travelType=2, quests={ } },
            ["SilithusNE2"] = { key="SilithusNE2", estTime=85, travelType=2, travelText="northeast towards Un'goro", textKey="SilithusNE", quests={ } },
            ["Ungoro"] = { key="Ungoro", estTime=177, travelType=3, quests={ } },
            ["TanarisTown"] = { key="TanarisTown", estTime=120, travelType=3, quests={ }, canHaveZeroQuests=true },
            ["TanarisPort"] = { key="TanarisPort", estTime=75, travelType=2, quests={ } },
            ["CavernsOfTime"] = { key="CavernsOfTime", estTime=111, travelType=2, quests={ } },
            ["ThunderBluff"] = { key="ThunderBluff", estTime=130, travelType=7, quests={ } },
            ["Orgrimmar"] = { key="Orgrimmar", estTime=167, travelType=6, quests={ } },
            ["Undercity"] = { key="Undercity", estTime=70, travelType=8, quests={ } },
            ["SilvermoonCity"] = { key="SilvermoonCity", estTime=120, travelType=9, quests={ } },
            ["BayOfStorms"] = { key="BayOfStorms", estTime=60, travelType=4, quests={ } },
            ["EPLTown"] = { key="EPLTown", estTime=85, travelType=5, textKey="EPLTownMain", quests={ } },
            ["EPLDarrowshire"] = { key="EPLDarrowshire", estTime=135, travelType=2, quests={ } },
            ["EPLNathanos"] = { key="EPLNathanos", estTime=43, travelType=2, quests={ } },
            ["EPLTirion"] = { key="EPLTirion", estTime=83, travelType=11, quests={ }, canHaveZeroQuests=true },
            ["WPLCauldron"] = { key="WPLCauldron", estTime=73, travelType=2, quests={ }, canHaveZeroQuests=true },
            ["WPLCaerDarrow"] = { key="WPLCaerDarrow", estTime=74, travelType=2, quests={ }, canHaveZeroQuests=true },
            ["Scholomance"] = { key="Scholomance", estTime=60, travelType=13, quests={ }, canHaveZeroQuests=true },
            ["EPLTown2"] = { key="EPLTown2", estTime=90, travelType=14, travelText="to hearthstone back to EPL", textKey="EPLTown", quests={ }, canHaveZeroQuests=true },
            ["EPLEgan"] = { key="EPLEgan", estTime=191, travelType=2, travelText="northwest to Egan in Terrordale", textKey="Terrordale", quests={ } },
            ["StratholmeGates1"] = { key="StratholmeGates1", estTime=67, travelType=2, textKey="StratholmeGates", quests={ } },
            ["Stratholme1"] = { key="Stratholme1", estTime=1200, travelType=13, textKey="StratholmeLiving", isDungeon=true, quests={ }, canHaveZeroQuests=true },
            ["EPLTown3"] = { key="EPLTown3", estTime=90, travelType=14, travelText="to hearthstone to town", textKey="EPLTown", quests={ } },
            ["StratholmeBackdoor"] = { key="StratholmeBackdoor", estTime=125, travelType=2, quests={ } },
            ["Stratholme2"] = { key="Stratholme2", estTime=1200, travelType=13, textKey="StratholmeDead", isDungeon=true, quests={ } },
            ["EPLTown4"] = { key="EPLTown4", estTime=90, travelType=14, travelText="to hearthstone to town", textKey="EPLTown", quests={ } },
            ["StratholmeGates2"] = { key="StratholmeGates2", estTime=167, travelType=2, textKey="StratholmeGates", quests={ } },
            ["EPLEgan2"] = { key="EPLEgan2", estTime=73, travelType=2, travelText="to Egan in Terrordale", textKey="Terrordale", quests={ } },
            ["EPLTirion2"] = { key="EPLTirion2", estTime=150, travelType=2, travelText="through the cave to Tirion", textKey="EPLTirion", quests={ } },
            ["EPLNathanos2"] = { key="EPLNathanos2", estTime=83, travelType=2, travelText="southeast to Nathanos", textKey="EPLNathanos", quests={ } },
            ["WPLSorrowAndorhal"] = { key="WPLSorrowAndorhal", estTime=130, travelType=2, quests={ } },
            ["WPLFelstoneField"] = { key="WPLFelstoneField", estTime=67, travelType=2, quests={ } },
            ["WPLBulwark"] = { key="WPLBulwark", estTime=39, travelType=2, quests={ } },
            ["zgSTV"] = { key="zgSTV", estTime=60, travelType=4, quests={ } },
            ["Stonard"] = { key="Stonard", estTime=20, travelType=10, quests={ }, canHaveZeroQuests=true },
            ["oldhero"] = { key="oldhero", estTime=25, travelType=2, quests={ } },
            ["BlastedLands"] = { key="BlastedLands", estTime=52, travelType=2, quests={ } },
            ["TheDarkPortal"] = { key="TheDarkPortal", estTime=45, travelType=12, quests={ }, canHaveZeroQuests=true },
        }
    },
    [CasualTBCPrep.Routing.RouteCodeSolo] =
    {
        key=CasualTBCPrep.Routing.RouteCodeSolo,
        name="Solo",
        extraExperience=0,
        description="",
        preparation=
        {
            "Set Hearthstone to Cenarion Hold, Silithus",
            " ",
            "[Work In Progress] This route is currently being finalized, and will be ready in a later update"
        },
        sectionOrder = {
            "BurningSteppes","Badlands","SilithusCave","SilithusSouth","SilithusHold","Ungoro","TanarisTown","TanarisPort",
            "CavernsOfTime","TanarisTown2","ThunderBluff","wsEverlook","wsDonowa","Timbermaw","Moonglade", "felwoodTown",
            "felwoodEmerald","Ashenvale","Orgrimmar","Undercity","SilvermoonCity","EPLTown","EPLDarrowshire","EPLNathanos","EPLTirion",
            "WPLCauldron","WPLSorrowAndorhal","WPLFelstoneField","WPLBulwark","zgSTV","Stonard","oldhero","BlastedLands","TheDarkPortal",
        },
        sections=
        {
            ["BurningSteppes"] = { key="BurningSteppes", estTime=30, travelType=0, quests={ } },
            ["Badlands"] = { key="Badlands", estTime=70, travelType=3, quests={ } },

            ["SilithusCave"] = { key="SilithusCave", estTime=0, travelType=2, travelText="south towards the hermit cave, doing the Tower quest on the way", target="Hermit Cave", quests={ } },
            ["SilithusSouth"] = { key="SilithusSouth", estTime=0, travelType=2, target="Bronzebeard Encampment", quests={ } },
            ["SilithusHold"] = { key="SilithusHold", estTime=0, travelType=2, travelText="or deathskip to Cenarion Hold", target="Cenarion Hold", quests={ } },
            ["Ungoro"] = { key="Ungoro", estTime=0, travelType=3, travelText="to Marshal's Refuge, Un'goro", target="Un'goro Crater", quests={ } },
            ["TanarisTown"] = { key="TanarisTown", estTime=0, travelType=3, target="Gadgetzan, Tanaris", quests={ }, canHaveZeroQuests=true },
            ["TanarisPort"] = { key="TanarisPort", estTime=0, travelType=2, travelText="east to Steamwheedle Port", target="Steamwheedle Port, Tanaris", quests={ } },
            ["CavernsOfTime"] = { key="CavernsOfTime", estTime=0, travelType=2, target="The Caverns of Time", quests={ } },
            ["TanarisTown2"] = { key="TanarisTown", estTime=0, travelType=3, target="Gadgetzan, Tanaris", quests={ }, canHaveZeroQuests=true },

            ["ThunderBluff"] = { key="ThunderBluff", estTime=0, travelType=7, target="Thunder Bluff", quests={ } },

            ["wsEverlook"] = { key="wsEverlook", estTime=0, travelType=4, travelText="Everlook", target="Everlook, Winterspring", quests={  } },
            ["wsDonowa"] = { key="wsDonowa", estTime=0, travelType=2, travelText="west to Donowa Snowden, south of the Timbermaw Cave", target="Donowa Snowden", quests={  } },
            ["Timbermaw"] = { key="Timbermaw", estTime=0, travelType=2, travelText="north to the Timbermaw Hold", target="Timbermaw Hold", quests={ } },
            ["Moonglade"] = { key="Moonglade", estTime=0, travelType=2, travelText="through the cave, and out north", target="Moonglade", quests={ } },
            ["felwoodTown"] = { key="felwoodTown", estTime=0, travelType=3, travelText="Bloodvenom Falls", target="Bloodvenom Falls, Felwood", quests={ } },
            ["felwoodEmerald"] = { key="felwoodEmerald", estTime=0, travelType=2, travelText="south (or summon) to the Emerald Sanctuary", target="Emerald Sanctuary", quests={ } },
            ["Ashenvale"] = { key="Ashenvale", estTime=0, travelType=2, travelText="south (or summon) to the Emerald Sanctuary", target="Splintertree Post, Ashenvale", quests={ }, canHaveZeroQuests=true },

            ["Orgrimmar"] = { key="Orgrimmar", estTime=0, travelType=6, target="Orgrimmar", quests={ } },
            ["Undercity"] = { key="Undercity", estTime=0, travelType=8, target="Undercity", quests={ } },
            ["SilvermoonCity"] = { key="SilvermoonCity", estTime=0, travelType=9, target="Silvermoon City", quests={ } },

            ["EPLTown"] = { key="EPLTown", estTime=0, travelType=5, travelText="to Light's Hope Chapel, EPL", target="The Plaguelands", quests={ } },
            ["EPLDarrowshire"] = { key="EPLDarrowshire", estTime=0, travelType=2, travelText="southwest to Darrowshire", target="Darrowshire", quests={ } },
            ["EPLNathanos"] = { key="EPLNathanos", estTime=0, travelType=2, travelText="west to Nathanos", target="Nathanos Blightcaller", quests={ } },
            ["EPLTirion"] = { key="EPLTirion", estTime=0, travelType=11, travelText="the river north to Tirion", target="Tirion Fordring", quests={ }, canHaveZeroQuests=true  },
            ["WPLCauldron"] = { key="WPLCauldron", estTime=0, travelType=2, travelText="back through the cave, then west to WPL", target="Gahrron's Withering, WPL", quests={ }, canHaveZeroQuests=true },
            ["WPLSorrowAndorhal"] = { key="WPLSorrowAndorhal", estTime=0, travelType=2, travelText="south to Sorrow Hill", target="Sorrow Hill", quests={ } },
            ["WPLFelstoneField"] = { key="WPLFelstoneField", estTime=0, travelType=2, travelText="north to Felstone Field", target="Felstone Field", quests={ } },
            ["WPLBulwark"] = { key="WPLBulwark", estTime=0, travelType=2, travelText="west to Tirisfal Glades", target="The Bulwark, Tirisfal Glades", quests={ } },

            ["zgSTV"] = { key="zgSTV", estTime=0, travelType=4, travelText="Yojamba Isle, the ZG Island", target="Yojamba Isle, STV", quests={ }, canHaveZeroQuests=true },
            ["Stonard"] = { key="Stonard", estTime=0, travelType=10, target="Stonard", quests={ }, canHaveZeroQuests=true },
            ["oldhero"] = { key="oldhero", estTime=0, travelType=2, travelText="southwest towards The Blasted Lands", target="The Fallen Hero", quests={ } },
            ["BlastedLands"] = { key="BlastedLands", estTime=0, travelType=2, target="Blasted Lands", quests={ } },
            ["TheDarkPortal"] = { key="TheDarkPortal", estTime=0, travelType=12, travelText="towards The Dark Portal", target="The Dark Portal", quests={ }, canHaveZeroQuests=true },
        }
    },
}

-- Fill routes with texts from 'targetTexts' to not repeat the same texts again and again and again
for routeKey, route in pairs(CasualTBCPrep.Routing.Routes) do
    for sectionKey, section in pairs(route.sections) do
        local ttObj = targetTexts[sectionKey]

        if ttObj == nil and section.textKey ~= nil and section.textKey ~= "" then
            ttObj = targetTexts[section.textKey]
        end

        if ttObj ~= nil then
            if section.target == nil or section.target == "" then
                if ttObj.text ~= nil and ttObj.text ~= "" then
                    section.target = ttObj.text
                end
            end

            if section.travelText == nil or section.travelText == "" then
                if ttObj.travel ~= nil and ttObj.travel ~= "" then
                section.travelText = ttObj.travel
                end
            end
        end
    end
end


function CasualTBCPrep.Routing.GetCurrentRoute()
    return CasualTBCPrep.Routing.Routes[CasualTBCPrep.Routing.CurrentRouteCode]
end
function CasualTBCPrep.Routing.GetQuestsInCurrentRoute()
    local route = CasualTBCPrep.Routing.Routes[CasualTBCPrep.Routing.CurrentRouteCode]
	local ignoredRouteSections = CasualTBCPrep.Settings.GetCharSetting(CasualTBCPrep.Settings.IgnoredRouteSections) or { }

    local quests = { }
    for sectKey, section in pairs(route.sections) do
        local ignoredSectionKey = route.key .. "_" .. sectKey
        local isIgnored = ignoredRouteSections[ignoredSectionKey] or false

        if isIgnored == false and section.quests ~= nil then
            for _, questID in ipairs(section.quests) do
                quests[questID] = true
            end
        end
    end

    return quests
end

function CasualTBCPrep.Routing.GetActiveSectionsInCurrentRoute()
    local results = {}
    local route = CasualTBCPrep.Routing.Routes[CasualTBCPrep.Routing.CurrentRouteCode]
	local ignoredRouteSections = CasualTBCPrep.Settings.GetCharSetting(CasualTBCPrep.Settings.IgnoredRouteSections) or { }

    for _, sectKey in ipairs(route.sectionOrder) do
        local section = route.sections[sectKey]

        if section == nil then
            CasualTBCPrep.NotifyUserError("CasualTBCPrep.Routing.GetActiveSectionsInCurrentRoute > " .. sectKey .. " found in .sectionOrder, but not in .sections for route " .. route.name)
        else
            local ignoredSectionKey = route.key .. "_" .. sectKey
            local isIgnored = ignoredRouteSections[ignoredSectionKey] or false

            if isIgnored == false and section.visible ~= false then
                table.insert(results, section)
            end
        end
    end

    return results
end

function CasualTBCPrep.Routing.OnSectionIgnoreToggled()
    cachedRouteQuestDic = CasualTBCPrep.Routing.GetQuestsInCurrentRoute()
end

function CasualTBCPrep.Routing.ChangeCurrentRoute(routeCode)
    CasualTBCPrep.Routing.CurrentRouteCode = routeCode

	CasualTBCPrep.QuestData.LoadRoute(routeCode)
	--CasualTBCPrep.QuestData.UpdateRoutesFromQuestData()
    cachedRouteQuestDic = CasualTBCPrep.Routing.GetQuestsInCurrentRoute()
	CasualTBCPrep.WM_Route.RefreshRoute()
end

---@return boolean
function CasualTBCPrep.Routing.IsQuestInCurrentRoute(questID)
    if cachedRouteQuestDic == nil then
        return false
    end
    return cachedRouteQuestDic[questID] == true
end