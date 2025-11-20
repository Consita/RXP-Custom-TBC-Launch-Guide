CasualTBCPrep = CasualTBCPrep or {}

CasualTBCPrep.BlockSlashCommandsUntillReloaded = false

--[Slash Commands]
SLASH_CASUAL_TBC_PREP1 = "/tbc"
SLASH_CASUAL_TBC_PREP2 = "/tbcprep"
SlashCmdList["CASUAL_TBC_PREP"] = function(msg)
	if CasualTBCPrep.BlockSlashCommandsUntillReloaded == true then
		CasualTBCPrep.NotifyUserError("Please do a /reload to open tbcprep")
		return
	end

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
		elseif args[2] == "witem" then
			CasualTBCPrep.W_ItemManagement.Show(20644)
		elseif args[2] == "err" or args[3] == "error" then
			CasualTBCPrep.NotifyUserError("This is an example ERROR message... Oh no!")
		elseif args[2] == "not" or args[3] == "notify" then
			CasualTBCPrep.NotifyUser("This is an example message from " .. CasualTBCPrep.AddonName .. "... Hello!")
		elseif args[2] == "on" then
			CasualTBCPrep.Settings.SetGlobalSetting(CasualTBCPrep.Settings.DebugDetails, 1)
			notifyText = "Debugging Details is now ON"
		elseif args[2] == "off" then
			CasualTBCPrep.Settings.SetGlobalSetting(CasualTBCPrep.Settings.DebugDetails, -1)
			notifyText = "Debugging Details is now OFF"
		elseif args[2] == "wiperoute" then
			CasualTBCPrep.Settings.SetCharSetting(CasualTBCPrep.Settings.SelectedRoute, nil)
			notifyText = "Removed your selected route, please do a /reload"
			CasualTBCPrep.W_Main.Hide()
			CasualTBCPrep.BlockSlashCommandsUntillReloaded = true
		else
			notifyText = "Invalid syntax, use: /tbcprep debug <warn1/warn2/warn3/witem/err/not/on/off/wiperoute>"
		end
	elseif args[1] == "flights" then
		for _, routeCode in ipairs({ CasualTBCPrep.Routing.RouteCodeStrat,CasualTBCPrep.Routing.RouteCodeMain,CasualTBCPrep.Routing.RouteCodeSolo}) do
			CasualTBCPrep.NotifyUser("Checking flightpaths for the "..routeCode.. " route")
			local unlockedAllFPs, fpList, undiscoveredCount = CasualTBCPrep.Flights.GetPlayerFlightPathState(routeCode)
			if unlockedAllFPs == true then
				CasualTBCPrep.NotifyUser("You have all the flightpaths needed for the '"..routeCode.."' route.")
			else
				for _, fpData in ipairs(fpList) do
					if fpData.discovered ~= true then
						CasualTBCPrep.NotifyUserError("Missing "..fpData.name)
					end
				end
			end
		end
	else
		CasualTBCPrep.W_Main.Show();
	end

	if notifyText then
		CasualTBCPrep.NotifyUser(notifyText)
	end
end

--[Event Wrappers]
local function OnQuestAcceptedEvent(self, event, questLogIndex)
	if event == "QUEST_ACCEPTED" then
		local questName, _, _, _, _, _, _, questID = GetQuestLogTitle(questLogIndex)

		if not CasualTBCPrep.Routing.IsQuestInCurrentRoute(questID) then
			return
		end

		if CasualTBCPrep.QuestData.ShouldBeInQuestLog(questID) then
			if CasualTBCPrep.Settings.GetIsFeatureDisabledGlobalOrChar(CasualTBCPrep.Settings.Warning_QLOG) == false then
				CasualTBCPrep.W_WarningNotice.Show(questID, questName, questLogIndex, "qlog");
			end
		elseif CasualTBCPrep.QuestData.IsTurnInQuest(questID) then
			if CasualTBCPrep.Settings.GetIsFeatureDisabledGlobalOrChar(CasualTBCPrep.Settings.Warning_TURNIN) == false then
				CasualTBCPrep.W_WarningNotice.Show(questID, questName, questLogIndex, "turnin");
			end
		end

		CasualTBCPrep.W_Main.ReloadActiveTab()
	elseif event == "QUEST_COMPLETE" then
		if CasualTBCPrep.Settings.GetIsFeatureDisabledGlobalOrChar(CasualTBCPrep.Settings.Warning_COMPLETING) == true then
			return
		end

		local questID = GetQuestID()
		local questName = GetTitleText()

		if not CasualTBCPrep.Routing.IsQuestInCurrentRoute(questID) then
			return
		end

		if CasualTBCPrep.QuestData.ShouldBeInQuestLog(questID) or CasualTBCPrep.QuestData.IsTurnInQuest(questID) then
			CasualTBCPrep.W_WarningNotice.Show(questID, questName, nil, "completing");
			CloseQuest()
		end

		CasualTBCPrep.W_Main.ReloadActiveTab()
	elseif event == "QUEST_LOG_UPDATE" then -- Will this spam updates? This happens a lot... But if you have the window open, is it fine?
		CasualTBCPrep.W_Main.ReloadActiveTab()
	end
end

local function OnInventoryChangedEvent(self, event)
	if event == "BAG_UPDATE" or event == "UNIT_INVENTORY_CHANGED" then
		CasualTBCPrep.W_Main.ReloadActiveTab()
	end
end
local function OnAddonLoadedEvent(self, event, addonName)
	if event == "ADDON_LOADED" and addonName == CasualTBCPrep.AddonNameInternal then
		--CasualTBCPrep.Settings.SetCharSetting(CasualTBCPrep.Settings.SelectedRoute, nil)
		CasualTBCPrep.Settings.LoadDefaults()

		CasualTBCPrep.QuestData.UpdateRoutesFromQuestData(nil)
		local selRouteCode = CasualTBCPrep.Settings.GetCharSetting(CasualTBCPrep.Settings.SelectedRoute)
		if selRouteCode == nil or selRouteCode == "" then
			return
		end
		CasualTBCPrep.Routing.ChangeCurrentRoute(selRouteCode)
	end
end

local function OnTalkToFlightMaster(self, event)
	CasualTBCPrep.Flights.OnTaxiMapOpened()
end

--[Event Listeners]
local questEventFrame = CreateFrame("Frame")
questEventFrame:RegisterEvent("QUEST_ACCEPTED")
questEventFrame:RegisterEvent("QUEST_COMPLETE")
questEventFrame:RegisterEvent("QUEST_LOG_UPDATE")
questEventFrame:SetScript("OnEvent", OnQuestAcceptedEvent)

local inventoryEventFrame = CreateFrame("Frame")
inventoryEventFrame:RegisterEvent("BAG_UPDATE")
inventoryEventFrame:RegisterEvent("UNIT_INVENTORY_CHANGED")
inventoryEventFrame:SetScript("OnEvent", OnInventoryChangedEvent)

local basicEventFrame = CreateFrame("Frame")
basicEventFrame:RegisterEvent("ADDON_LOADED")
basicEventFrame:SetScript("OnEvent", OnAddonLoadedEvent)

local taxiFrame = CreateFrame("Frame")
taxiFrame:RegisterEvent("TAXIMAP_OPENED")
taxiFrame:SetScript("OnEvent", OnTalkToFlightMaster)