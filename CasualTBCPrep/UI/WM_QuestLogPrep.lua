CasualTBCPrep = CasualTBCPrep or {}
CasualTBCPrep.WM_QuestLogPrep = CasualTBCPrep.WM_QuestLogPrep or {}

--[Variables]
---@class Frame|nil
local fQuestLogPrep = nil;

---@param wMain Frame|nil
local function CreateListQuestTooltip(wMain, point, quest, questText, yOffset, nextPreQuest, itemDisplayList, reqAnyItem)
	if wMain == nil then
		return
	end

	local ttLines = {}
	if quest.data then

		local plrName = UnitName("player")

		if quest.data.areaType ~= nil and quest.data.area ~= nil  and quest.data.areaType ~= "" then
			table.insert(ttLines, CasualTBCPrep.CreateZoneText(quest.data.areaType .. ": ", quest.data.area))
		end
		if quest.data.baseexp then
			table.insert(ttLines, CasualTBCPrep.CreateExpText("Experience: ", quest.data.baseexp))
		end

		if quest.data.reqRep ~= nil and quest.data.reqRep > 0 and quest.data.reqRepRank ~= nil and quest.data.reqRepRank > 0 then
			table.insert(ttLines, CasualTBCPrep.CreateRepRankText(quest.data.reqRep, quest.data.reqRepRank))
		end

		if quest.data.reqProf ~= nil and quest.data.reqProf > 0 and quest.data.reqProfSkill ~= nil and quest.data.reqProfSkill > 0 then
			table.insert(ttLines, CasualTBCPrep.CreateProfRankText(quest.data.reqProf, quest.data.reqProfSkill))
		end

		local dataName = "Unknown"
		if quest.data.name then
			dataName = quest.data.name
		end

		if quest.data.comments ~= nil and quest.data.comments ~= "" then
			table.insert(ttLines, " ")
			table.insert(ttLines, CasualTBCPrep.CreateZoneText("Comments",""))
			table.insert(ttLines, CasualTBCPrep.CreateZoneText("",string.gsub(quest.data.comments, "%. ", ".\r")))
			if string.find(quest.data.comments, "%.") then
				table.insert(ttLines, " ")
			end
		end

		local tooltip = CasualTBCPrep.UI.UpdateAdvancedQuestTooltip(fQuestLogPrep.scrollChild, point, questText:GetStringWidth(), questText:GetStringHeight(), 0, yOffset, dataName, ttLines, nextPreQuest, itemDisplayList, reqAnyItem)
		table.insert(fQuestLogPrep.tooltips, tooltip)
	end
end
local function CreateListQuestTooltipSimple(wMain, quest, questText)
	if wMain == nil then
		return
	end

	local ttLines = {}
	if quest.data then
		if quest.data.areaType ~= nil and quest.data.area ~= nil  and quest.data.areaType ~= "" then
			table.insert(ttLines, CasualTBCPrep.CreateZoneText(quest.data.areaType .. ": ", quest.data.area))
		end

		if quest.data.baseexp then
			table.insert(ttLines, CasualTBCPrep.CreateExpText("Experience: ", quest.data.baseexp))
		end

		if quest.reqRep ~= nil and quest.reqRep > 0 and quest.reqRepRank ~= nil and quest.reqRepRank > 0 then
			table.insert(ttLines, CasualTBCPrep.CreateRepRankText(quest.reqRep, quest.reqRepRank))
		end

		local dataName = "Unknown"
		if quest.data.name then
			dataName = quest.data.name
		end

		if quest.data.comments ~= nil and quest.data.comments ~= "" then
			table.insert(ttLines, " ")
			table.insert(ttLines, CasualTBCPrep.CreateZoneText("Comments",""))
			table.insert(ttLines, CasualTBCPrep.CreateZoneText("",string.gsub(quest.data.comments, "%. ", ".\r")))
			if string.find(quest.data.comments, "%.") then
				table.insert(ttLines, " ")
			end
		end
		CasualTBCPrep.UI.HookTooltip(questText, dataName, ttLines, nil)
	end
end

---@param wMain Frame|nil
function CasualTBCPrep.WM_QuestLogPrep.Create(wMain)
	if wMain == nil or fQuestLogPrep ~= nil then
		return
	end
	fQuestLogPrep = CreateFrame("Frame", nil, wMain)
	fQuestLogPrep:SetAllPoints(wMain)

	fQuestLogPrep.scrollFrame = CreateFrame("ScrollFrame", nil, fQuestLogPrep, "UIPanelScrollFrameTemplate")
	fQuestLogPrep.scrollFrame:SetPoint("TOPLEFT", fQuestLogPrep, "TOPLEFT", 11, -67)
	fQuestLogPrep.scrollFrame:SetPoint("BOTTOMRIGHT", fQuestLogPrep, "BOTTOMRIGHT", -31, 17)

	fQuestLogPrep.scrollChild = CreateFrame("Frame", nil, fQuestLogPrep.scrollFrame)
	fQuestLogPrep.scrollChild:SetSize(fQuestLogPrep.scrollFrame:GetWidth(), 1)
	fQuestLogPrep.scrollFrame:SetScrollChild(fQuestLogPrep.scrollChild)

	fQuestLogPrep:Hide()
end

function CasualTBCPrep.WM_QuestLogPrep.Hide()
	if fQuestLogPrep ~= nil then
		fQuestLogPrep:Hide()
	end
end

---@param wMain Frame|nil
function CasualTBCPrep.WM_QuestLogPrep.Show(wMain)
	if fQuestLogPrep == nil then
		CasualTBCPrep.WM_QuestLogPrep.Create(wMain)
	end

	if fQuestLogPrep ~= nil then
		fQuestLogPrep:Show()
	end
end

---@param wMain Frame|nil
function CasualTBCPrep.WM_QuestLogPrep.Load(wMain)
	if wMain == nil or fQuestLogPrep == nil then
		return
	end
	local selectedRoute = CasualTBCPrep.Settings.GetCharSetting(CasualTBCPrep.Settings.SelectedRoute)
	if selectedRoute == nil or selectedRoute == "" then
		CasualTBCPrep.UI.CreateRouteSelection(wMain, fQuestLogPrep)
		fQuestLogPrep.scrollFrame:Hide()
		return
	end
	CasualTBCPrep.UI.ClearRouteSelectionUI(fQuestLogPrep)
	fQuestLogPrep.scrollFrame:Show()

	local availableQuests, completedQuests, optAvailableQuests, optCompletedQuests = CasualTBCPrep.QuestData.GetCharacterQuestLogStates_Main()
	local aCount = #availableQuests
	local cCount = #completedQuests
	local yOffset = -31
	local yActualStart = 0
	local yOffsetFinalMax = 0;

	-- Clear questTexts
	if fQuestLogPrep.questTexts then
		for _, fontString in ipairs(fQuestLogPrep.questTexts) do
			fontString:Hide()
			fontString:SetText("")
			fontString:SetParent(nil)
		end
	end
	if fQuestLogPrep.tooltips then
		for _, ttFrame in ipairs(fQuestLogPrep.tooltips) do
			ttFrame:Hide()
			ttFrame:SetSize(0, 0)
			ttFrame:SetParent(nil)
		end
	end
	fQuestLogPrep.questTexts = {}
	fQuestLogPrep.tooltips = {}


	-- Main Header Text
	if not fQuestLogPrep.headerText then
		fQuestLogPrep.headerText = fQuestLogPrep:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
		fQuestLogPrep.headerText:SetPoint("TOP", fQuestLogPrep, "TOP", 0, yOffset)
	end

	if aCount == 25 and cCount == 0 then
		fQuestLogPrep.headerText:SetText("You have all 25 quests available!")
	else
		fQuestLogPrep.headerText:SetText("You have " .. aCount .. " / 25 quests available")
	end
	yOffset = yActualStart

	-- Completed Quests
	if cCount > 0 then
		if not fQuestLogPrep.completedHeader then
			fQuestLogPrep.completedHeader = fQuestLogPrep.scrollChild:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
			fQuestLogPrep.completedHeader:SetText("Completed Quests")
			fQuestLogPrep.completedHeader:SetTextColor(1, 0, 0)
		end
		fQuestLogPrep.completedHeader:SetPoint("TOPLEFT", fQuestLogPrep.scrollChild, "TOPLEFT", 0, yOffset)

		yOffset = yOffset - 20

		for _, quest in ipairs(completedQuests) do
			local questText = fQuestLogPrep.scrollChild:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
			questText:SetPoint("TOPLEFT", fQuestLogPrep.scrollChild, "TOPLEFT", 10, yOffset)
			questText:SetText(quest.data.name)
			questText:SetTextColor(1, 0, 0)

			CreateListQuestTooltipSimple(wMain, quest, questText)
			table.insert(fQuestLogPrep.questTexts, questText)

			yOffset = yOffset - 15
		end

		yOffset = yOffset - 10
	else
		if fQuestLogPrep.completedHeader then
			fQuestLogPrep.completedHeader:Hide()
		end
	end

	local questsReadyCount = 0

	-- Available Quests
	if aCount > 0 then
		if not fQuestLogPrep.availableHeader then
			fQuestLogPrep.availableHeader = fQuestLogPrep.scrollChild:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
			fQuestLogPrep.availableHeader:SetText("Available Quests")
			fQuestLogPrep.availableHeader:SetTextColor(0, 1, 0)
		end
		fQuestLogPrep.availableHeader:SetPoint("TOPLEFT", fQuestLogPrep.scrollChild, "TOPLEFT", 1, yOffset)

		yOffset = yOffset - 20

		for _, quest in ipairs(availableQuests) do
			local hasFullyPreparedQuest, itemDisplayList, nextPreQuest, questTextColorRGB = CasualTBCPrep.QuestData.GetQuestProgressionDetails(quest)

			if hasFullyPreparedQuest then
				questsReadyCount = questsReadyCount + 1
			end

			local questText = fQuestLogPrep.scrollChild:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
			questText:SetPoint("TOPLEFT", fQuestLogPrep.scrollChild, "TOPLEFT", 6, yOffset)
			questText:SetText(quest.data.name)
			questText:SetTextColor(questTextColorRGB.r, questTextColorRGB.g, questTextColorRGB.b)

			CreateListQuestTooltip(wMain, "TOPLEFT", quest, questText, yOffset, nextPreQuest, itemDisplayList, quest.data.reqAnyItem)
			table.insert(fQuestLogPrep.questTexts, questText)

			yOffset = yOffset - 15
		end
	else
		if fQuestLogPrep.availableHeader then
			fQuestLogPrep.availableHeader:Hide()
		end
	end

	yOffsetFinalMax = math.abs(yOffset) + 20

	-- OptionalAvailable Quests
	yOffset = yActualStart
	if not fQuestLogPrep.optionalQuestHeader then
		fQuestLogPrep.optionalQuestHeader = fQuestLogPrep.scrollChild:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
		fQuestLogPrep.optionalQuestHeader:SetText("Optional Quests")
		fQuestLogPrep.optionalQuestHeader:SetTextColor(0, 1, 0)
	end
	fQuestLogPrep.optionalQuestHeader:SetPoint("TOPRIGHT", fQuestLogPrep.scrollChild, "TOPRIGHT", 0, yOffset)

	yOffset = yOffset - 20

	for i, quest in ipairs(optAvailableQuests) do

		local hasFullyPreparedQuest, itemDisplayList, nextPreQuest, questTextColorRGB = CasualTBCPrep.QuestData.GetQuestProgressionDetails(quest)

		if hasFullyPreparedQuest then
			questsReadyCount = questsReadyCount + 1
		end

		local questText = fQuestLogPrep.scrollChild:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
		questText:SetPoint("TOPRIGHT", fQuestLogPrep.scrollChild, "TOPRIGHT", 0, yOffset)
		questText:SetText(quest.data.name)
		questText:SetTextColor(questTextColorRGB.r, questTextColorRGB.g, questTextColorRGB.b)

		CreateListQuestTooltip(wMain, "TOPRIGHT", quest, questText, yOffset, nextPreQuest, itemDisplayList, quest.data.reqAnyItem)
		table.insert(fQuestLogPrep.questTexts, questText)

		yOffset = yOffset - 15
	end

	for i, quest in ipairs(optCompletedQuests) do
		local questText = fQuestLogPrep.scrollChild:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
		questText:SetPoint("TOPRIGHT", fQuestLogPrep.scrollChild, "TOPRIGHT", 0, yOffset)
		questText:SetText(quest.data.name)
		questText:SetTextColor(1, 0, 0)

		CreateListQuestTooltipSimple(wMain, quest, questText)
		table.insert(fQuestLogPrep.questTexts, questText)

		yOffset = yOffset - 15
	end

	-- Use the bigger values from left or right side
	yOffset = math.abs(yOffset) + 20
	if yOffset> yOffsetFinalMax then
		yOffsetFinalMax = yOffset
	end

	fQuestLogPrep.scrollChild:SetHeight(yOffsetFinalMax)
end

---@param wMain Frame|nil
function CasualTBCPrep.WM_QuestLogPrep.Selected(wMain)
	if fQuestLogPrep == nil then
    	CasualTBCPrep.WM_QuestLogPrep.Create(wMain)
	end

    CasualTBCPrep.WM_QuestLogPrep.Load(wMain)
    CasualTBCPrep.WM_QuestLogPrep.Show(wMain)
end