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
}

CasualTBCPrep.Routing.Routes = {
    [mainRouteCode] =
    {
        name="Main",
        description="",
        preparation=
        {
            "Set Hearthstone to Light's Hope Chapel, EPL"
        },
        sectionOrder = {
            "BurningSteppes","Badlands","AV","wsEverlook","WinterspringWest","Timbermaw","Moonglade","felwoodTown","felwoodEmerald",
            "SilithusNE","SilithusCave","SilithusSouth","SilithusHold","SilithusNE2","Ungoro","TanarisTown","TanarisPort","CavernsOfTime",
            "ThunderBluff","Orgrimmar","Undercity","Silvermoon","BayOfStorms","EPLTown","EPLDarrowshire","EPLNathanos","EPLTirion","EPLEgan",
            "WPLCauldron","WPLCaerDarrow","WPLSorrowAndorhal","WPLFelstoneField","WPLBulwark","zgSTV","Stonard","oldhero","BlastedLands",
            "TheDarkPortal"
        },
        sections=
        {
            ["BurningSteppes"] = { key="BurningSteppes", estTime=1, travelType=0, target="Burning Steppes", quests={ } },
            ["Badlands"] = { key="Badlands", estTime=3, travelType=3, target="Kargath", quests={ } },
            ["AV"] = { key="AV", estTime=3, travelType=4, travelText="Tarren Mill", target="Tarren Mill, Hillsbrad Foothills", quests={ } },

            ["wsEverlook"] = { key="wsEverlook", estTime=5, travelType=4, travelText="Everlook", target="Everlook, Winterspring", quests={  } },
            ["WinterspringWest"] = { key="WinterspringWest", estTime=5, travelType=2, travelText="west to Donowa Snowden south of the Timbermaw Cave", target="Donowa Snowden", quests={  } },

            ["Timbermaw"] = { key="Timbermaw", estTime=5, travelType=2, travelText="north to the Timbermaw Hold", target="Timbermaw Hold", quests={ } },

            ["Moonglade"] = { key="Moonglade", estTime=5, travelType=2, travelText="back through the cave, and out north", target="Moonglade", quests={ } },
            ["felwoodTown"] = { key="felwoodTown", estTime=5, travelType=3, travelText="Bloodvenom Falls", target="Bloodvenom Falls, Felwood", quests={ } },
            ["felwoodEmerald"] = { key="felwoodEmerald", estTime=5, travelType=2, travelText="south (or summon) to the Emerald Sanctuary", target="Emerald Sanctuary", quests={ } },

            ["SilithusNE"] = { key="SilithusNE", estTime=5, travelType=4, travelText="to Valor's Rest", target="Silithus", quests={ } },
            ["SilithusCave"] = { key="SilithusCave", estTime=5, travelType=2, travelText="south towards the hermit cave, doing the Tower quest on the way", target="Hermit Cave, Silithus", quests={ } },
            ["SilithusSouth"] = { key="SilithusSouth", estTime=5, travelType=2, target="Bronzebard Encampment", quests={ } },
            ["SilithusHold"] = { key="SilithusHold", estTime=5, travelType=2, travelText="or deathskip to Cenarion Hold", target="Cenarion Hold", quests={ } },
            ["SilithusNE2"] = { key="SilithusNE2", estTime=5, travelType=2, travelText="northeast towards Un'goro", target="Valor's Rest", quests={ } },
            ["Ungoro"] = { key="Ungoro", estTime=5, travelType=3, target="Marshal's Refuge, Un'goro", quests={ } },
            ["TanarisTown"] = { key="TanarisTown", estTime=5, travelType=3, target="Gadgetzan, Tanaris", quests={ } },
            ["TanarisPort"] = { key="TanarisPort", estTime=5, travelType=2, travelText="east to Steamwheedle Port", target="Steamwheedle Port, Tanaris", quests={ } },
            ["CavernsOfTime"] = { key="CavernsOfTime", estTime=5, travelType=2, target="The Caverns of Time", quests={ } },

            ["ThunderBluff"] = { key="ThunderBluff", estTime=5, travelType=7, target="Thunder Bluff", quests={ } },
            ["Orgrimmar"] = { key="Orgrimmar", estTime=5, travelType=6, target="Orgrimmar", quests={ } },
            ["Undercity"] = { key="Undercity", estTime=5, travelType=8, target="Undercity", quests={ } },
            ["Silvermoon"] = { key="Silvermoon", estTime=5, travelType=9, target="Silvermoon City", quests={ } },
            ["BayOfStorms"] = { key="BayOfStorms", estTime=5, travelType=4, target="Bay of Storms, Azshara", quests={ } },

            ["EPLTown"] = { key="EPLTown", estTime=5, travelType=5, travelText="to Light's Hope Chapel, EPL", target="The Plaguelands", quests={ } },
            ["EPLDarrowshire"] = { key="EPLDarrowshire", estTime=5, travelType=2, travelText="southwest to Darrowshire", target="Darrowshire", quests={ } },
            ["EPLNathanos"] = { key="EPLNathanos", estTime=5, travelType=2, travelText="west to Nathanos", target="Nathanos Blightcaller", quests={ } },
            ["EPLTirion"] = { key="EPLTirion", estTime=5, travelType=11, travelText="the river north to Tirion", target="Tirion Fordring", quests={ } },
            ["EPLEgan"] = { key="EPLEgan", estTime=5, travelType=2, travelText="north through the spider cave", target="Terrordale", quests={ } },
            ["WPLCauldron"] = { key="WPLCauldron", estTime=5, travelType=2, travelText="back through the cave, then west to WPL", target="Gahrron's Withering, WPL", quests={ } },
            ["WPLCaerDarrow"] = { key="WPLCaerDarrow", estTime=5, travelType=2, travelText="south to Caer Darrow", target="Caer Darrow", quests={ } },
            ["WPLSorrowAndorhal"] = { key="WPLSorrowAndorhal", estTime=5, travelType=2, travelText="south to Sorrow Hill", target="Sorrow Hill", quests={ } },
            ["WPLFelstoneField"] = { key="WPLFelstoneField", estTime=5, travelType=2, travelText="north to Felstone Field", target="Felstone Field", quests={ } },
            ["WPLBulwark"] = { key="WPLBulwark", estTime=5, travelType=2, travelText="west to Tirisfal Glades", target="The Bulwark, Tirisfal Glades", quests={ } },

            ["zgSTV"] = { key="zgSTV", estTime=5, travelType=4, travelText="Yojamba Isle, the ZG Island", target="Yojamba Isle, STV", quests={ } },
            ["Stonard"] = { key="Stonard", estTime=5, travelType=10, target="Stonard", quests={ } },
            ["oldhero"] = { key="oldhero", estTime=5, travelType=2, travelText="southwest towards The Blasted Lands", target="The Fallen Hero", quests={ } },
            ["BlastedLands"] = { key="BlastedLands", estTime=5, travelType=2, target="Blasted Lands", quests={ } },
            ["TheDarkPortal"] = { key="TheDarkPortal", estTime=5, travelType=12, travelText="towards The Dark Portal", target="The Dark Portal", quests={ } },
        }
    },
    ["Strat"] =
    {
        name="Strat",
        description="",
        preparation=
        {
            "Set Hearthstone to Light's Hope Chapel, EPL"
        },
        sectionOrder = {
            "BurningSteppes","Badlands","AV","wsEverlook","WinterspringWest","Timbermaw","Moonglade","felwoodTown","felwoodEmerald",
            "SilithusNE","SilithusCave","SilithusSouth","SilithusHold","SilithusNE2","Ungoro","TanarisTown","TanarisPort","CavernsOfTime",
            "ThunderBluff","Orgrimmar","Undercity","Silvermoon","BayOfStorms","EPLTown","EPLDarrowshire","EPLNathanos","EPLTirion","EPLEgan",
            "WPLCauldron","WPLCaerDarrow","WPLSorrowAndorhal","WPLFelstoneField","WPLBulwark","zgSTV","Stonard","oldhero","BlastedLands",
            "TheDarkPortal"
        },
        sections=
        {
            ["BurningSteppes"] = { key="BurningSteppes", estTime=1, travelType=0, target="Burning Steppes", quests={ } },
            ["Badlands"] = { key="Badlands", estTime=3, travelType=3, target="Kargath", quests={ } },
            ["AV"] = { key="AV", estTime=3, travelType=4, travelText="Tarren Mill", target="Tarren Mill, Hillsbrad Foothills", quests={ } },

            ["wsEverlook"] = { key="wsEverlook", estTime=5, travelType=4, travelText="Everlook", target="Everlook, Winterspring", quests={  } },
            ["WinterspringWest"] = { key="WinterspringWest", estTime=5, travelType=2, travelText="west to Donowa Snowden south of the Timbermaw Cave", target="Donowa Snowden", quests={  } },

            ["Timbermaw"] = { key="Timbermaw", estTime=5, travelType=2, travelText="north to the Timbermaw Hold", target="Timbermaw Hold", quests={ } },

            ["Moonglade"] = { key="Moonglade", estTime=5, travelType=2, travelText="back through the cave, and out north", target="Moonglade", quests={ } },
            ["felwoodTown"] = { key="felwoodTown", estTime=5, travelType=3, travelText="Bloodvenom Falls", target="Bloodvenom Falls, Felwood", quests={ } },
            ["felwoodEmerald"] = { key="felwoodEmerald", estTime=5, travelType=2, travelText="south (or summon) to the Emerald Sanctuary", target="Emerald Sanctuary", quests={ } },

            ["SilithusNE"] = { key="SilithusNE", estTime=5, travelType=4, travelText="to Valor's Rest", target="Silithus", quests={ } },
            ["SilithusCave"] = { key="SilithusCave", estTime=5, travelType=2, travelText="south towards the hermit cave, doing the Tower quest on the way", target="Hermit Cave, Silithus", quests={ } },
            ["SilithusSouth"] = { key="SilithusSouth", estTime=5, travelType=2, target="Bronzebard Encampment", quests={ } },
            ["SilithusHold"] = { key="SilithusHold", estTime=5, travelType=2, travelText="or deathskip to Cenarion Hold", target="Cenarion Hold", quests={ } },
            ["SilithusNE2"] = { key="SilithusNE2", estTime=5, travelType=2, travelText="northeast towards Un'goro", target="Valor's Rest", quests={ } },
            ["Ungoro"] = { key="Ungoro", estTime=5, travelType=3, target="Marshal's Refuge, Un'goro", quests={ } },
            ["TanarisTown"] = { key="TanarisTown", estTime=5, travelType=3, target="Gadgetzan, Tanaris", quests={ } },
            ["TanarisPort"] = { key="TanarisPort", estTime=5, travelType=2, travelText="east to Steamwheedle Port", target="Steamwheedle Port, Tanaris", quests={ } },
            ["CavernsOfTime"] = { key="CavernsOfTime", estTime=5, travelType=2, target="The Caverns of Time", quests={ } },

            ["ThunderBluff"] = { key="ThunderBluff", estTime=5, travelType=7, target="Thunder Bluff", quests={ } },
            ["Orgrimmar"] = { key="Orgrimmar", estTime=5, travelType=6, target="Orgrimmar", quests={ } },
            ["Undercity"] = { key="Undercity", estTime=5, travelType=8, target="Undercity", quests={ } },
            ["Silvermoon"] = { key="Silvermoon", estTime=5, travelType=9, target="Silvermoon City", quests={ } },
            ["BayOfStorms"] = { key="BayOfStorms", estTime=5, travelType=4, target="Bay of Storms, Azshara", quests={ } },

            ["EPLTown"] = { key="EPLTown", estTime=5, travelType=5, travelText="to Light's Hope Chapel, EPL", target="The Plaguelands", quests={ } },
            ["EPLDarrowshire"] = { key="EPLDarrowshire", estTime=5, travelType=2, travelText="southwest to Darrowshire", target="Darrowshire", quests={ } },
            ["EPLNathanos"] = { key="EPLNathanos", estTime=5, travelType=2, travelText="west to Nathanos", target="Nathanos Blightcaller", quests={ } },
            ["EPLTirion"] = { key="EPLTirion", estTime=5, travelType=11, travelText="the river north to Tirion", target="Tirion Fordring", quests={ } },
            ["EPLEgan"] = { key="EPLEgan", estTime=5, travelType=2, travelText="north through the spider cave", target="Terrordale", quests={ } },
            ["WPLCauldron"] = { key="WPLCauldron", estTime=5, travelType=2, travelText="back through the cave, then west to WPL", target="Gahrron's Withering, WPL", quests={ } },
            ["WPLCaerDarrow"] = { key="WPLCaerDarrow", estTime=5, travelType=2, travelText="south to Caer Darrow", target="Caer Darrow", quests={ } },
            ["WPLSorrowAndorhal"] = { key="WPLSorrowAndorhal", estTime=5, travelType=2, travelText="south to Sorrow Hill", target="Sorrow Hill", quests={ } },
            ["WPLFelstoneField"] = { key="WPLFelstoneField", estTime=5, travelType=2, travelText="north to Felstone Field", target="Felstone Field", quests={ } },
            ["WPLBulwark"] = { key="WPLBulwark", estTime=5, travelType=2, travelText="west to Tirisfal Glades", target="The Bulwark, Tirisfal Glades", quests={ } },

            ["zgSTV"] = { key="zgSTV", estTime=5, travelType=4, travelText="Yojamba Isle, the ZG Island", target="Yojamba Isle, STV", quests={ } },
            ["Stonard"] = { key="Stonard", estTime=5, travelType=10, target="Stonard", quests={ } },
            ["oldhero"] = { key="oldhero", estTime=5, travelType=2, travelText="southwest towards The Blasted Lands", target="The Fallen Hero", quests={ } },
            ["BlastedLands"] = { key="BlastedLands", estTime=5, travelType=2, target="Blasted Lands", quests={ } },
            ["TheDarkPortal"] = { key="TheDarkPortal", estTime=5, travelType=12, travelText="towards The Dark Portal", target="The Dark Portal", quests={ } },
        }
    },
    ["Test"] =
    {
        name="Test",
        description="",
        preparation=
        {
            "Set Hearthstone to Ligh's Hope Chapel, EPL"
        },
        sectionOrder = {
            "broodRing",
        },
        sections=
        {
            ["broodRing"] = { key="broodRing", visible=false, estTime=2, travelType=2, target="Brood Ring Quest Dump", quests={
                4123, 4862, 4729, 4866, 4735, 4768, 4724, 4134, 4132, 4063, 8279, 3907, 8287, 8314, 8306, 3961, 4788, 8181, 8182, 8201, 4004, 4509, 4511, 6822, 6823, 5522, 5531,
                5263, 5264, 5265, 5529, 5214, 5212, 5721, 5942, 6163, 5848, 5861, 5236, 5238, 5511, 5341, 105, 2702, 2701, 5213, 6148, 5342, 5464, 8283, 9444, 2681, 9229, 8310, 8309,
                8288, 6024, 9665, 8321, 9023, 7820, 7821, 7822, 7823, 7813, 7814, 7817, 7818, 10359, 10360, 10361, 10362, 7833, 7834, 7835, 7836, 7826, 7827, 7831, 7824, 9120, 6026,
                9128, 9124, 9126, 9131, 9136, 5243, 9141, 5513, 5517, 9232, 9230, 7490, 7491, 7783, 7784, 8978, 8944, 8927, 8939, 8943, 8940, 8942, 10495, 8938, 8941, 8802, 8301, 8791,
                8317, 8308, 8323, 8318, 8361, 8332, 8341, 8348, 8352, 9248, 8711, 8709, 8706, 8712, 8558, 8707, 8705, 8710, 8708, 8693, 8557, 8691, 8689, 8694, 8692, 8696, 8690, 8695,
                8697, 8702, 8701, 8704, 8699, 8700, 8698, 8556, 8703, 8183, 8240, 8145, 8146, 8147, 8148, 8041, 8042, 8043, 8044, 8110, 8111, 8112, 8113, 8101, 8102, 8103, 8104, 8106,
                8107, 8108, 8109, 8049, 8050, 8051, 8052, 8116, 8117, 8118, 8119, 8045, 8046, 8047, 8048, 8141, 8142, 8143, 8144, 8060, 8068, 8069, 8061, 8070, 8071, 8059, 8076, 8077,
                8057, 8064, 8065, 8063, 8072, 8073, 8062, 8066, 8067, 8056, 8074, 8075, 8058, 8078, 8079, 8053, 8054, 8055, 2583, 2603, 2601, 2585, 2581, 2521, 3501, 8471, 8470, 5083,
                4148, 4284, 6824, 7486, 8331, 8343, 8349, 8351, 7163, 7164, 7165, 7166, 7167, 5051, 5060, 6031, 6032, 8485, 5527, 5526, 8446, 6845, 1185, 8307, 8313, 8315, 8316, 8376,
                8377, 8380, 8382, 8381, 8379, 8378, 5125, 8757, 8758, 8759, 8760, 8761}
            },
        }
    },
    ["SoloSimple"] = {
        name="Solo",
        description="",
        preparation=
        {
            "Set Hearthstone to Ligh's Hope Chapel, EPL"
        },
        sectionOrder = {
            "BurningSteppes","kargath1"
        },
        sections=
        {
            ["BurningSteppes"] = { key="BurningSteppes", estTime=1, travelType=0, target="Burning Steppes", quests={ } },
            ["kargath1"] = { key="kargath1", estTime=3, travelType=3, target="Kargath", quests=
                {
                    4123, 4862, 4729, 4866, 4735, 4768, 4724, 4134, 4132, 4063, 8279, 3907, 8287, 8314, 8306, 3961, 4788, 8181, 8182, 8201, 4004, 4509, 4511, 6822, 6823, 5522, 5531, 5263,
                    5264, 5265, 5529, 5214, 5212, 5721, 5942, 6163, 5848, 5861, 5236, 5238, 5511, 5341, 105, 2702, 2701
                }
            },
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

        local isIgnored = ignoredRouteSections[sectKey] or false

        if isIgnored == false and section.visible ~= false then
            CasualTBCPrep.NotifyUser(route.name .. ": " .. sectKey)
            table.insert(results, section)
        end
    end

    return results
end

function CasualTBCPrep.Routing.ChangeCurrentRoute(routeCode)
    CasualTBCPrep.Routing.CurrentRouteCode = routeCode
    cachedRouteQuestDic = CasualTBCPrep.Routing.GetQuestsInCurrentRoute()
end

---@return boolean
function CasualTBCPrep.Routing.IsQuestInCurrentRoute(questID)
    if cachedRouteQuestDic == nil then
        return false
    end
    return cachedRouteQuestDic[questID] == true
end