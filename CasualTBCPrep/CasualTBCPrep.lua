CasualTBCPrep = CasualTBCPrep or {}

--[Slash Commands]
SLASH_CASUAL_TBC_PREP1 = "/tbc"
SLASH_CASUAL_TBC_PREP2 = "/tbcprep"
SlashCmdList["CASUAL_TBC_PREP"] = function(msg)

	local args = {}
    for word in string.gmatch(msg, "%S+") do
        table.insert(args, string.lower(word))
    end

	local notifyText = nil

	if #args == 0 then
		CasualTBCPrep.W_Main.Show();
	elseif args[1] == "debug" then
		if args[2] == "warn1" then
			CasualTBCPrep.W_WarningNotice.Show(8201, "A Collection of Heads", nil, "qlog")
		elseif args[2] == "warn2" then
			CasualTBCPrep.W_WarningNotice.Show(8341, "Lords of the Council", nil, "turnin")
		elseif args[2] == "warn3" then
			CasualTBCPrep.W_WarningNotice.Show(6163, "Ramstein", nil, "completing")
		else
			notifyText = "Invalid syntax, use: /tbcprep debug <warn1|warn2|warn3>"
		end
	else
		--Subcommands removed, just show window
		CasualTBCPrep.W_Main.Show();
		--notifyText = "Unknown subcommand, possible commands are: 'debug', 'warn'"
	end

	if notifyText then
		CasualTBCPrep.NotifyUser(notifyText)
	end
end

--[Event Wrappers]
local function OnQuestAcceptedEvent(self, event, questLogIndex)
	if event == "QUEST_ACCEPTED" then
		local questName, _, _, _, _, _, _, questID = GetQuestLogTitle(questLogIndex)

		if CasualTBCPrep.QuestData.ShouldBeInQuestLog(questID) then

			if not CasualTBCPrep.GetIsFeatureDisabledGlobalOrChar(CasualTBCPrep.Settings.Warning_QLOG) then
				CasualTBCPrep.W_WarningNotice.Show(questID, questName, questLogIndex, "qlog");
			end
		elseif CasualTBCPrep.QuestData.IsTurnInQuest(questID) then
			if not CasualTBCPrep.GetIsFeatureDisabledGlobalOrChar(CasualTBCPrep.Settings.Warning_TURNIN) then
				CasualTBCPrep.W_WarningNotice.Show(questID, questName, questLogIndex, "turnin");
			end
		end
	elseif event == "QUEST_COMPLETE" then
		if CasualTBCPrep.GetIsFeatureDisabledGlobalOrChar(CasualTBCPrep.Settings.Warning_COMPLETING) then
			return
		end

		local questID = GetQuestID()
		local questName = GetTitleText()

		if CasualTBCPrep.QuestData.ShouldBeInQuestLog(questID) or CasualTBCPrep.QuestData.IsTurnInQuest(questID) then
			CasualTBCPrep.W_WarningNotice.Show(questID, questName, nil, "completing");
			CloseQuest()
		end
	end
end

local function OnAddonLoadedEvent(self, event, addonName)
	if event == "ADDON_LOADED" and addonName == CasualTBCPrep.AddonNameInternal then
		for _, settingsObj in ipairs(CasualTBCPrep.Settings.AllSettings) do
			if CasualTBCPrepSettingGlobal[settingsObj.key] == nil then
				CasualTBCPrepSettingGlobal[settingsObj.key] = settingsObj.defaultValueGlobal
			end
			if CasualTBCPrepSettingChar[settingsObj.key] == nil then
				CasualTBCPrepSettingChar[settingsObj.key] = settingsObj.defaultValueChar
			end
		end
	end
end

--[Event Listeners]
local questEventFrame = CreateFrame("Frame")
questEventFrame:RegisterEvent("QUEST_ACCEPTED")
questEventFrame:RegisterEvent("QUEST_COMPLETE")
questEventFrame:SetScript("OnEvent", OnQuestAcceptedEvent)

local basicEventFrame = CreateFrame("Frame")
basicEventFrame:RegisterEvent("ADDON_LOADED")
basicEventFrame:SetScript("OnEvent", OnAddonLoadedEvent)
