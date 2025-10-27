CasualTBCPrep.Settings = CasualTBCPrep.Settings or {}

-- Keys
local settingsKeyPrefix = "CasualPrepTBC_"
CasualTBCPrep.Settings.Warning_QLOG = settingsKeyPrefix .. "PreventAcceptQuestlog"
CasualTBCPrep.Settings.Warning_TURNIN = settingsKeyPrefix .. "PreventAcceptTurnin"
CasualTBCPrep.Settings.Warning_COMPLETING = settingsKeyPrefix .. "PreventCompletingQuest"
CasualTBCPrep.Settings.EnabledSounds = settingsKeyPrefix .. "SoundState"

CasualTBCPrep.Settings.DebugDetails = settingsKeyPrefix .. "DebugDetails"
CasualTBCPrep.Settings.SelectedRoute = settingsKeyPrefix .. "SelectedRoute"
CasualTBCPrep.Settings.IgnoredQuests = settingsKeyPrefix .. "IgnoredQuests"
CasualTBCPrep.Settings.IgnoredRouteSections = settingsKeyPrefix .. "IgnoredRouteSections"

CasualTBCPrep.Settings.AllSettings = {
	{ key=CasualTBCPrep.Settings.Warning_QLOG, 			dataType="bit", 	type="cmb", defaultValueGlobal=0,	defaultValueChar=-1,	values={ { text="Use Global", value=-1}, { text="On", value=1 }, { text="Off", value=0}},	name="Questlog Warnings", 	description={ "This will |cFFD47400WARN|r you when you pick up a quest that should be in your questlog.", "This can be used while leveling to avoid doing anything by mistake.", " ", "Default: Off" }},
	{ key=CasualTBCPrep.Settings.Warning_TURNIN, 		dataType="bit",		type="cmb", defaultValueGlobal=1,	defaultValueChar=-1,	values={ { text="Use Global", value=-1}, { text="On", value=1 }, { text="Off", value=0}},	name="Turnin Warnings",		description={ "This will |cFFD47400WARN|r you when you pick up a quest that is turned in on TBC Release for exp.", " ", "Turn this off if you're only doing the questlog", " ", "Default: On" } },
	{ key=CasualTBCPrep.Settings.Warning_COMPLETING, 	dataType="bit",		type="cmb",	defaultValueGlobal=1,	defaultValueChar=-1,	values={ { text="Use Global", value=-1}, { text="On", value=1 }, { text="Off", value=0}},	name="Completion Warnings",	description={ "This will |cFFFF1111PREVENT|r you from completing any quests used for TBC Exp.", " ", "Default: On" } },

	{ key=CasualTBCPrep.Settings.EnabledSounds, 		dataType="text",	type="cmb",	defaultValueGlobal=1,	defaultValueChar=-1,	values={ { text="Use Global", value=-1}, { text="All", value=2 }, { text="SFX Only", value=1}, { text="None", value=0}},	name="Enabled Sounds",	description={ "All: SFX & Raid Warning sound when a popup shows", " ", "SFX: Small sound effects, like opening the window.", " ", "Default: All" } },
}

--[Settings Getter/Setter]
---@param key string
local function ParseSettingsValue(key, value)
	if value == nil then
		return nil
	end

	local settingsObj = CasualTBCPrep.Settings.AllSettings[key]
	if settingsObj ~= nil then
		if settingsObj.dataType == "bit" then
			if value == 1 or value == "1" then
				value = true
			elseif value == 0 or value == "0" then
				value = false
			else
				value = nil
			end
		elseif settingsObj == "text" then
			if value == -1 or value == "-1" then
				value = nil
			end
		end
	end

	return value
end

---@param key string
---@return any|nil
function CasualTBCPrep.Settings.GetCharSetting(key)
	return ParseSettingsValue(key, CasualTBCPrepSettingChar[key])
end
---@param key string
function CasualTBCPrep.Settings.SetCharSetting(key, value)
	CasualTBCPrepSettingChar[key] = value
end

---@param key string
---@return any|nil
function CasualTBCPrep.Settings.GetGlobalSetting(key)
	return ParseSettingsValue(key, CasualTBCPrepSettingGlobal[key])
end
---@param key string
function CasualTBCPrep.Settings.SetGlobalSetting(key, value)
	CasualTBCPrepSettingGlobal[key] = value
end

---@param key string
---@return any|nil
function CasualTBCPrep.Settings.GetIsFeatureDisabledGlobalOrChar(key)
	local storedValue = CasualTBCPrep.Settings.GetGlobalSetting(key)

	if storedValue == false then
		return true
	end

	return CasualTBCPrep.Settings.GetCharSetting(key) == false
end

---@param key string
function CasualTBCPrep.Settings.GetSettingFromCharOrGlobal(key)
	local storedValue = CasualTBCPrep.Settings.GetCharSetting(key)

	local settingsObj = CasualTBCPrep.Settings.AllSettings[key]
	if storedValue == nil or storedValue == -1 or (settingsObj ~= nil and storedValue == settingsObj.defaultValueChar) then
		storedValue = CasualTBCPrep.Settings.GetGlobalSetting(key)
	end

	return storedValue
end


function CasualTBCPrep.Settings.LoadDefaults()
    for _, settingsObj in ipairs(CasualTBCPrep.Settings.AllSettings) do
        if CasualTBCPrepSettingGlobal[settingsObj.key] == nil then
            CasualTBCPrepSettingGlobal[settingsObj.key] = settingsObj.defaultValueGlobal
        end
        if CasualTBCPrepSettingChar[settingsObj.key] == nil then
            CasualTBCPrepSettingChar[settingsObj.key] = settingsObj.defaultValueChar
        end
    end

	-- Global Defaults
	local debugger = CasualTBCPrep.Settings.GetGlobalSetting(CasualTBCPrep.Settings.DebugDetails)
	if debugger == nil then
		CasualTBCPrep.Settings.SetGlobalSetting(CasualTBCPrep.Settings.DebugDetails, -1)
	end

	-- Character Defaults
	local tempCharSetting = CasualTBCPrep.Settings.GetCharSetting(CasualTBCPrep.Settings.IgnoredQuests)
	if tempCharSetting == nil then
		CasualTBCPrep.Settings.SetCharSetting(CasualTBCPrep.Settings.IgnoredQuests, { })
	end
	tempCharSetting = CasualTBCPrep.Settings.GetCharSetting(CasualTBCPrep.Settings.IgnoredRouteSections)
	if tempCharSetting == nil then
		CasualTBCPrep.Settings.SetCharSetting(CasualTBCPrep.Settings.IgnoredRouteSections, { })
	end

	-- Used to be at bottom of Routing.lua
	local selectedRouteCode = CasualTBCPrep.Settings.GetCharSetting(CasualTBCPrep.Settings.SelectedRoute)
	if selectedRouteCode == nil then
		selectedRouteCode = CasualTBCPrep.Routing.DefaultRouteCode
		CasualTBCPrep.Settings.SetCharSetting(CasualTBCPrep.Settings.SelectedRoute, selectedRouteCode)
	end
end