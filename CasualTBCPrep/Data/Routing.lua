CasualTBCPrep.Routing = CasualTBCPrep.Routing or {}

local mainRouteCode = "Main"
local cachedRouteQuestDic = {}

CasualTBCPrep.Routing.DefaultRouteCode = mainRouteCode
CasualTBCPrep.Routing.CurrentRouteCode = mainRouteCode

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

CasualTBCPrep.Routing.Routes = {
    [mainRouteCode] =
    {
        key=mainRouteCode,
        name="Main",
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
            ["BurningSteppes"] = { key="BurningSteppes", estTime=1, travelType=0, target="Burning Steppes", quests={ } },
            ["Badlands"] = { key="Badlands", estTime=3, travelType=3, target="Kargath", quests={ } },
            ["AV"] = { key="AV", estTime=3, travelType=4, travelText="Tarren Mill", target="Tarren Mill, Hillsbrad Foothills", quests={ } },

            ["wsEverlook"] = { key="wsEverlook", estTime=5, travelType=4, travelText="Everlook", target="Everlook, Winterspring", quests={  } },
            ["wsDonowa"] = { key="wsDonowa", estTime=5, travelType=2, travelText="west to Donowa Snowden, south of the Timbermaw Cave", target="Donowa Snowden", quests={  } },

            ["Timbermaw"] = { key="Timbermaw", estTime=5, travelType=2, travelText="north to the Timbermaw Hold", target="Timbermaw Hold", quests={ } },

            ["Moonglade"] = { key="Moonglade", estTime=5, travelType=2, travelText="through the cave, and out north", target="Moonglade", quests={ } },
            ["felwoodTown"] = { key="felwoodTown", estTime=5, travelType=3, travelText="Bloodvenom Falls", target="Bloodvenom Falls, Felwood", quests={ } },
            ["felwoodEmerald"] = { key="felwoodEmerald", estTime=5, travelType=2, travelText="south (or summon) to the Emerald Sanctuary", target="Emerald Sanctuary", quests={ } },

            ["SilithusNE"] = { key="SilithusNE", estTime=5, travelType=4, travelText="to Valor's Rest", target="Valor's Rest, Silithus", quests={ }, canHaveZeroQuests=true },
            ["SilithusCave"] = { key="SilithusCave", estTime=5, travelType=2, travelText="south towards the hermit cave, doing the Tower quest on the way", target="Hermit Cave, Silithus", quests={ } },
            ["SilithusSouth"] = { key="SilithusSouth", estTime=5, travelType=2, target="Bronzebeard Encampment", quests={ } },
            ["SilithusHold"] = { key="SilithusHold", estTime=5, travelType=2, travelText="or deathskip to Cenarion Hold", target="Cenarion Hold", quests={ } },
            ["SilithusNE2"] = { key="SilithusNE2", estTime=5, travelType=2, travelText="northeast towards Un'goro", target="Valor's Rest", quests={ } },
            ["Ungoro"] = { key="Ungoro", estTime=5, travelType=3, travelText="to Marshal's Refuge, Un'goro", target="Un'goro Crater", quests={ } },
            ["TanarisTown"] = { key="TanarisTown", estTime=5, travelType=3, target="Gadgetzan, Tanaris", quests={ }, canHaveZeroQuests=true },
            ["TanarisPort"] = { key="TanarisPort", estTime=5, travelType=2, travelText="east to Steamwheedle Port", target="Steamwheedle Port, Tanaris", quests={ } },
            ["CavernsOfTime"] = { key="CavernsOfTime", estTime=5, travelType=2, target="The Caverns of Time", quests={ } },

            ["ThunderBluff"] = { key="ThunderBluff", estTime=5, travelType=7, target="Thunder Bluff", quests={ } },
            ["Orgrimmar"] = { key="Orgrimmar", estTime=5, travelType=6, target="Orgrimmar", quests={ } },
            ["Undercity"] = { key="Undercity", estTime=5, travelType=8, target="Undercity", quests={ } },
            ["SilvermoonCity"] = { key="SilvermoonCity", estTime=5, travelType=9, target="Silvermoon City", quests={ } },
            ["BayOfStorms"] = { key="BayOfStorms", estTime=5, travelType=4, target="Bay of Storms, Azshara", quests={ } },

            ["EPLTown"] = { key="EPLTown", estTime=5, travelType=5, travelText="to Light's Hope Chapel, EPL", target="The Plaguelands", quests={ } },
            ["EPLDarrowshire"] = { key="EPLDarrowshire", estTime=5, travelType=2, travelText="southwest to Darrowshire", target="Darrowshire", quests={ } },
            ["EPLNathanos"] = { key="EPLNathanos", estTime=5, travelType=2, travelText="west to Nathanos", target="Nathanos Blightcaller", quests={ } },
            ["EPLTirion"] = { key="EPLTirion", estTime=5, travelType=11, travelText="the river north to Tirion", target="Tirion Fordring", quests={ }, canHaveZeroQuests=true  },
            ["EPLEgan"] = { key="EPLEgan", estTime=5, travelType=2, travelText="north through the spider cave", target="Terrordale", quests={ } },
            ["WPLCauldron"] = { key="WPLCauldron", estTime=5, travelType=2, travelText="back through the cave, then west to WPL", target="Gahrron's Withering, WPL", quests={ }, canHaveZeroQuests=true },
            ["WPLCaerDarrow"] = { key="WPLCaerDarrow", estTime=5, travelType=2, travelText="south to Caer Darrow", target="Caer Darrow", quests={ }, canHaveZeroQuests=true },
            ["WPLSorrowAndorhal"] = { key="WPLSorrowAndorhal", estTime=5, travelType=2, travelText="south to Sorrow Hill", target="Sorrow Hill", quests={ } },
            ["WPLFelstoneField"] = { key="WPLFelstoneField", estTime=5, travelType=2, travelText="north to Felstone Field", target="Felstone Field", quests={ } },
            ["WPLBulwark"] = { key="WPLBulwark", estTime=5, travelType=2, travelText="west to Tirisfal Glades", target="The Bulwark, Tirisfal Glades", quests={ } },

            ["zgSTV"] = { key="zgSTV", estTime=5, travelType=4, travelText="Yojamba Isle, the ZG Island", target="Yojamba Isle, STV", quests={ }, canHaveZeroQuests=true },
            ["Stonard"] = { key="Stonard", estTime=5, travelType=10, target="Stonard", quests={ }, canHaveZeroQuests=true },
            ["oldhero"] = { key="oldhero", estTime=5, travelType=2, travelText="southwest towards The Blasted Lands", target="The Fallen Hero", quests={ } },
            ["BlastedLands"] = { key="BlastedLands", estTime=5, travelType=2, target="Blasted Lands", quests={ } },
            ["TheDarkPortal"] = { key="TheDarkPortal", estTime=5, travelType=12, travelText="towards The Dark Portal", target="The Dark Portal", quests={ }, canHaveZeroQuests=true },
        }
    },
    ["Strat"] =
    {
        key="Strat",
        name="Strat",
        description="",
        preparation=
        {
            "Set Hearthstone to Light's Hope Chapel, EPL",
            "5 Summons for full route",
            "A way to open scholo door (Rogue, BS, Engi, 2nd account with char inside)",
        },
        sectionOrder = {
            "BurningSteppes","Badlands","AV","wsEverlook","wsDonowa","Timbermaw","Moonglade","felwoodTown","felwoodEmerald",
            "SilithusNE","SilithusCave","SilithusSouth","SilithusHold","SilithusNE2","Ungoro","TanarisTown","TanarisPort","CavernsOfTime",
            "ThunderBluff","Orgrimmar","Undercity","SilvermoonCity","BayOfStorms","EPLTown","EPLDarrowshire","EPLNathanos","EPLTirion","WPLCauldron",
            "Scholomance","EPLTown2","EPLEgan","StratholmeGates1","Stratholme1","EPLTown3","StratholmeBackdoor","EPLTown4","StratholmeGates2",
            "EPLEgan2", "EPLTirion2", "EPLNathanos2","WPLSorrowAndorhal","WPLFelstoneField","WPLBulwark","zgSTV","Stonard","oldhero","BlastedLands",
            "TheDarkPortal"
        },
        sections=
        {
            ["BurningSteppes"] = { key="BurningSteppes", estTime=1, travelType=0, target="Burning Steppes", quests={ } },
            ["Badlands"] = { key="Badlands", estTime=3, travelType=3, target="Kargath", quests={ } },
            ["AV"] = { key="AV", estTime=3, travelType=4, travelText="Tarren Mill", target="Tarren Mill, Hillsbrad Foothills", quests={ } },

            ["wsEverlook"] = { key="wsEverlook", estTime=5, travelType=4, travelText="Everlook", target="Everlook, Winterspring", quests={  } },
            ["wsDonowa"] = { key="wsDonowa", estTime=5, travelType=2, travelText="west to Donowa Snowden, south of the Timbermaw Cave", target="Donowa Snowden", quests={  } },

            ["Timbermaw"] = { key="Timbermaw", estTime=5, travelType=2, travelText="north to the Timbermaw Hold", target="Timbermaw Hold", quests={ } },

            ["Moonglade"] = { key="Moonglade", estTime=5, travelType=2, travelText="through the cave, and out north", target="Moonglade", quests={ } },
            ["felwoodTown"] = { key="felwoodTown", estTime=5, travelType=3, travelText="Bloodvenom Falls", target="Bloodvenom Falls, Felwood", quests={ } },
            ["felwoodEmerald"] = { key="felwoodEmerald", estTime=5, travelType=2, travelText="south (or summon) to the Emerald Sanctuary", target="Emerald Sanctuary", quests={ } },

            ["SilithusNE"] = { key="SilithusNE", estTime=5, travelType=4, travelText="to Valor's Rest", target="Valor's Rest, Silithus", quests={ }, canHaveZeroQuests=true },
            ["SilithusCave"] = { key="SilithusCave", estTime=5, travelType=2, travelText="south to the hermit cave & do the Tower quest on the way", target="Hermit Cave, Silithus", quests={ } },
            ["SilithusSouth"] = { key="SilithusSouth", estTime=5, travelType=2, travelText="southwest to the dwarf camp", target="Bronzebeard Encampment", quests={ } },
            ["SilithusHold"] = { key="SilithusHold", estTime=5, travelType=2, travelText="or deathskip to Cenarion Hold", target="Cenarion Hold", quests={ } },
            ["SilithusNE2"] = { key="SilithusNE2", estTime=5, travelType=2, travelText="northeast towards Un'goro", target="Valor's Rest", quests={ } },
            ["Ungoro"] = { key="Ungoro", estTime=5, travelType=3, travelText="to Marshal's Refuge, Un'goro", target="Un'goro Crater", quests={ } },
            ["TanarisTown"] = { key="TanarisTown", estTime=5, travelType=3, target="Gadgetzan, Tanaris", quests={ }, canHaveZeroQuests=true },
            ["TanarisPort"] = { key="TanarisPort", estTime=5, travelType=2, travelText="east to Steamwheedle Port", target="Steamwheedle Port, Tanaris", quests={ } },
            ["CavernsOfTime"] = { key="CavernsOfTime", estTime=5, travelType=2, target="The Caverns of Time", quests={ } },

            ["ThunderBluff"] = { key="ThunderBluff", estTime=5, travelType=7, target="Thunder Bluff", quests={ } },
            ["Orgrimmar"] = { key="Orgrimmar", estTime=5, travelType=6, target="Orgrimmar", quests={ } },
            ["Undercity"] = { key="Undercity", estTime=5, travelType=8, target="Undercity", quests={ } },
            ["SilvermoonCity"] = { key="SilvermoonCity", estTime=5, travelType=9, target="Silvermoon City", quests={ } },
            ["BayOfStorms"] = { key="BayOfStorms", estTime=5, travelType=4, target="Bay of Storms, Azshara", quests={ } },

            ["EPLTown"] = { key="EPLTown", estTime=75, travelType=5, travelText="to Light's Hope Chapel, EPL", target="The Plaguelands", quests={ } },
            ["EPLDarrowshire"] = { key="EPLDarrowshire", estTime=135, travelType=2, travelText="southwest to Darrowshire", target="Darrowshire", quests={ } },
            ["EPLNathanos"] = { key="EPLNathanos", estTime=43, travelType=2, travelText="northwest to Nathanos", target="Nathanos Blightcaller", quests={ } },
            ["EPLTirion"] = { key="EPLTirion", estTime=83, travelType=11, travelText="the river north to Tirion", target="Tirion Fordring", quests={ }, canHaveZeroQuests=true },
            ["WPLCauldron"] = { key="WPLCauldron", estTime=73, travelType=2, travelText="west across the river then south", target="Gahrron's Withering, WPL", quests={ }, canHaveZeroQuests=true },
            ["WPLCaerDarrow"] = { key="WPLCaerDarrow", estTime=74, travelType=2, travelText="and swim south to Caer Darrow", target="Caer Darrow", quests={ }, canHaveZeroQuests=true },
            ["Scholomance"] = { key="Scholomance", estTime=60, travelType=13, travelText="Scholomance", target="Scholomance", quests={ }, canHaveZeroQuests=true },
            ["EPLTown2"] = { key="EPLTown2", estTime=90, travelType=14, travelText="to hearthstone to EPL", target="Light's Hope Chapel, EPL", quests={ }, canHaveZeroQuests=true },

            ["EPLEgan"] = { key="EPLEgan", estTime=191, travelType=2, travelText="northwest to Egan in Terrordale", target="Terrordale", quests={ } },
            ["StratholmeGates1"] = { key="StratholmeGates1", estTime=5, travelType=2, travelText="to the Stratholme Main Entrance & speak to Anthion", target="Stratholme Main Entrance", quests={ } },
            ["Stratholme1"] = { key="Stratholme1", estTime=5, travelType=13, travelText="Stratholme", target="Stratholme Living", isDungeon=true, quests={ } },
            ["EPLTown3"] = { key="EPLTown3", estTime=90, travelType=14, travelText="to hearthstone to town", target="Light's Hope Chapel, EPL", quests={ } },
            ["StratholmeBackdoor"] = { key="StratholmeBackdoor", estTime=5, travelType=2, travelText="to Stratholme through the back entrance", target="Stratholme Undead", isDungeon=true, quests={ } },
            ["EPLTown4"] = { key="EPLTown4", estTime=90, travelType=14, travelText="to hearthstone to town", target="Light's Hope Chapel, EPL", quests={ } },
            ["StratholmeGates2"] = { key="StratholmeGates2", estTime=5, travelType=2, travelText="to the Stratholme Main Entrance & speak to Anthion", target="Stratholme Main Entrance", quests={ } },
            ["EPLEgan2"] = { key="EPLEgan2", estTime=5, travelType=2, travelText="to Egan in Terrordale", target="Terrordale", quests={ } },
            ["EPLTirion2"] = { key="EPLTirion2", estTime=150, travelType=2, travelText="through the cave to Tirion", target="Tirion Fordring", quests={ } },
            ["EPLNathanos2"] = { key="EPLNathanos2", estTime=83, travelType=2, travelText="southeast to Nathanos", target="Nathanos Blightcaller", quests={ } },

            ["WPLSorrowAndorhal"] = { key="WPLSorrowAndorhal", estTime=130, travelType=2, travelText="west to Sorrow Hill, WPL", target="Sorrow Hill", quests={ } },
            ["WPLFelstoneField"] = { key="WPLFelstoneField", estTime=67, travelType=2, travelText="north to the Felstone Field", target="Felstone Field", quests={ } },
            ["WPLBulwark"] = { key="WPLBulwark", estTime=39, travelType=2, travelText="west to Tirisfal Glades", target="The Bulwark, Tirisfal Glades", quests={ } },

            ["zgSTV"] = { key="zgSTV", estTime=60, travelType=4, travelText="Yojamba Isle, the ZG Island", target="Yojamba Isle, STV", quests={ } },
            ["Stonard"] = { key="Stonard", estTime=60, travelType=10, target="Stonard", quests={ }, canHaveZeroQuests=true },
            ["oldhero"] = { key="oldhero", estTime=5, travelType=2, travelText="southwest towards The Blasted Lands", target="The Fallen Hero", quests={ } },
            ["BlastedLands"] = { key="BlastedLands", estTime=5, travelType=2, target="Blasted Lands", quests={ } },
            ["TheDarkPortal"] = { key="TheDarkPortal", estTime=5, travelType=12, travelText="towards The Dark Portal", target="The Dark Portal", quests={ }, canHaveZeroQuests=true },
        }
    }
}

function CasualTBCPrep.Routing.GetCurrentRoute()
    return CasualTBCPrep.Routing.Routes[CasualTBCPrep.Routing.CurrentRouteCode]
end
function CasualTBCPrep.Routing.GetQuestsInCurrentRoute()
    local route = CasualTBCPrep.Routing.Routes[CasualTBCPrep.Routing.CurrentRouteCode]
	local ignoredRouteSections = CasualTBCPrep.Settings.GetCharSetting(CasualTBCPrep.Settings.IgnoredRouteSections) or { }

    local quests = { }
    for sectKey, section in pairs(route.sections) do
        local isIgnored = ignoredRouteSections[sectKey] or false

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
            local isIgnored = ignoredRouteSections[sectKey] or false

            if isIgnored == false and section.visible ~= false then
                table.insert(results, section)
            end
        end
    end

    return results
end

function CasualTBCPrep.Routing.ChangeCurrentRoute(routeCode)
    CasualTBCPrep.Routing.CurrentRouteCode = routeCode
    CasualTBCPrep.Settings.SetCharSetting(CasualTBCPrep.Settings.SelectedRoute, routeCode)
    cachedRouteQuestDic = CasualTBCPrep.Routing.GetQuestsInCurrentRoute()

	CasualTBCPrep.QuestData.LoadRoute(routeCode)
	CasualTBCPrep.WM_Route.RefreshRoute()
end

---@return boolean
function CasualTBCPrep.Routing.IsQuestInCurrentRoute(questID)
    if cachedRouteQuestDic == nil then
        return false
    end
    return cachedRouteQuestDic[questID] == true
end