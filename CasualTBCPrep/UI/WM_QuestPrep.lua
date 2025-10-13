CasualTBCPrep = CasualTBCPrep or {}
CasualTBCPrep.WM_QuestPrep = CasualTBCPrep.WM_QuestPrep or {}

--[Variables]
---@class Frame|nil
local frameQuestPrep = nil;

--Sorting Variables
local areaTypePriority = {
	["Raid"] = 1,
	["Dungeon"] = 2,
	["Zone"] = 3,
	["City"] = 4
}

local _ignoreZonesAndAreas = true


--[Forward Declarations]
local RefreshQuestList 


---@param wMain Frame|nil
local function CreateListQuestTooltip(wMain, point, quest, questText, yOffset, nextPreQuest, itemDisplayList, reqAnyItem)
	if wMain == nil then
		return
	end

	local ttLines = {}
	if quest.data then

		local plrName = UnitName("player")

		if plrName == "Pawstab" or plrName == "Pawy" or plrName == "Pawaox" then
			table.insert(ttLines, "QuestID: " .. tostring(quest.id))
		end

		if quest.data.areaType ~= nil and quest.data.area ~= nil  and quest.data.areaType ~= "" then
			table.insert(ttLines, CasualTBCPrep.CreateZoneText(quest.data.areaType .. ": ", quest.data.area))
		end
		if quest.data.exp then
			table.insert(ttLines, CasualTBCPrep.CreateExpText("Experience: ", quest.data.exp))
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

		local tooltip = CasualTBCPrep.UI.UpdateAdvancedQuestTooltip(frameQuestPrep.scrollChild, point, questText:GetStringWidth(), questText:GetStringHeight(), 0, yOffset, dataName, ttLines, nextPreQuest, itemDisplayList, reqAnyItem)
		table.insert(frameQuestPrep.tooltips, tooltip)
	end
end

---@param wMain Frame|nil
function CasualTBCPrep.WM_QuestPrep.Create(wMain)
	if wMain == nil then
		return
	end

	frameQuestPrep = CreateFrame("Frame", nil, wMain)
	frameQuestPrep:SetAllPoints(wMain)

	frameQuestPrep.scrollFrame = CreateFrame("ScrollFrame", nil, frameQuestPrep, "UIPanelScrollFrameTemplate")
	frameQuestPrep.scrollFrame:SetPoint("TOPLEFT", frameQuestPrep, "TOPLEFT", 11, -67)
	frameQuestPrep.scrollFrame:SetPoint("BOTTOMRIGHT", frameQuestPrep, "BOTTOMRIGHT", -31, 17)

	frameQuestPrep.scrollChild = CreateFrame("Frame", nil, frameQuestPrep.scrollFrame)
	frameQuestPrep.scrollChild:SetSize(frameQuestPrep.scrollFrame:GetWidth(), 1)
	frameQuestPrep.scrollFrame:SetScrollChild(frameQuestPrep.scrollChild)

	frameQuestPrep.tooltips = { }

	local checkbox = CreateFrame("CheckButton", nil, frameQuestPrep, "UICheckButtonTemplate")
	checkbox:SetPoint("TOPRIGHT", frameQuestPrep, "TOPRIGHT", -5, -30)
	checkbox:SetSize(24, 24)

	local label = checkbox:CreateFontString(nil, "OVERLAY", "GameTooltipTextSmall")
	label:SetPoint("LEFT", checkbox, "LEFT", -48, 1)
	label:SetText("Compact")

	checkbox:SetChecked(_ignoreZonesAndAreas)

	checkbox:SetScript("OnClick", function(self)
		_ignoreZonesAndAreas = self:GetChecked()
		if RefreshQuestList then
			RefreshQuestList(wMain)
		end
	end)

	frameQuestPrep:Hide()
end

function CasualTBCPrep.WM_QuestPrep.Hide()
	if frameQuestPrep ~= nil then
		frameQuestPrep:Hide()
	end
end

---@param wMain Frame|nil
function CasualTBCPrep.WM_QuestPrep.Show(wMain)
	if frameQuestPrep == nil then
		CasualTBCPrep.WM_QuestPrep.Create(wMain)
	end

	if frameQuestPrep ~= nil then
		frameQuestPrep:Show()
	end
end

local function SortQuestList(questList)
	table.sort(questList, function(aWrap, bWrap)
		local a = aWrap.quest.data;
		local b = bWrap.quest.data;

		if not _ignoreZonesAndAreas then
			local aPrio = areaTypePriority[a.areaType] or 5
			local bPrio = areaTypePriority[b.areaType] or 5

			if aPrio ~= bPrio then
				return aPrio < bPrio
			end

			if a.area ~= b.area then
				return a.area < b.area
			end
		end

		if aWrap.completed ~= bWrap.completed then
			return not aWrap.completed
		end

		if a.exp == b.exp then
			return a.name < b.name
		end
		return a.exp > b.exp
	end)
end

---@param wMain Frame|nil
---@param xOffset number
---@param yOffset number
---@param headerText string
---@return number, number, number, number
local function LoadSpecificQuestList(wMain, xOffset, yOffset, headerText, headerFrame, availableQuests, completedQuests, point, relativePoint)
	local aCount = #availableQuests
	local cCount = #completedQuests
	local totalCount = aCount + cCount
	local readyQuestCount = 0

	if not frameQuestPrep.collapsedSections then
		frameQuestPrep.collapsedSections = {}
	end

	local isCollapsed = frameQuestPrep.collapsedSections[headerText] or false
	local collapseIndicator = isCollapsed and "+ " or "- "

	headerFrame:SetText(collapseIndicator .. totalCount .. " " .. headerText .. " Quest" .. (totalCount == 1 and "" or "s"))
	headerFrame:SetTextColor(0.40, 0.35, 0.72)
	headerFrame:SetPoint(point, frameQuestPrep.scrollChild, relativePoint, xOffset, yOffset)

	if not headerFrame.clickFrame then
		headerFrame.clickFrame = CreateFrame("Button", nil, frameQuestPrep.scrollChild)
		headerFrame.clickFrame:SetAllPoints(headerFrame)
		headerFrame.clickFrame:RegisterForClicks("LeftButtonUp")
		headerFrame.clickFrame:SetScript("OnClick", function()
			frameQuestPrep.collapsedSections[headerText] = not frameQuestPrep.collapsedSections[headerText]
			if RefreshQuestList then
				RefreshQuestList(wMain)
			end
		end)
		headerFrame.clickFrame:SetScript("OnEnter", function()
			headerFrame:SetTextColor(0.60, 0.55, 0.92)
		end)
		headerFrame.clickFrame:SetScript("OnLeave", function()
			headerFrame:SetTextColor(0.40, 0.35, 0.72)
		end)
	end

	if totalCount > 0 then
		yOffset = yOffset - 20

		local xOffsetQuestText = 0
		if xOffset >= 0 then
			xOffsetQuestText = xOffset + 2
		else
			xOffsetQuestText = xOffset - 2
		end
		if not isCollapsed then

			local newList = { }
			for i, quest in ipairs(availableQuests) do
				table.insert(newList, { quest = quest, completed = false })
			end
			for i, quest in ipairs(completedQuests) do
				table.insert(newList, { quest = quest, completed = true })
			end

			SortQuestList(newList)

			local currentArea = nil
			for i, questWrap in ipairs(newList) do
				local quest = questWrap.quest

				if not _ignoreZonesAndAreas then
					if currentArea ~= quest.data.area then
						if currentArea == nil then
							yOffset = yOffset - 5
						else
							yOffset = yOffset - 2
						end
						currentArea = quest.data.area

						local zoneHeaderText = frameQuestPrep.scrollChild:CreateFontString(nil, "OVERLAY", "GameFontNormal")
						zoneHeaderText:SetPoint(point, frameQuestPrep.scrollChild, relativePoint, xOffset, yOffset)
						zoneHeaderText:SetText(currentArea)
						zoneHeaderText:SetTextColor(0.59, 0.39, 0.77)
						table.insert(frameQuestPrep.questTexts, zoneHeaderText)

						yOffset = yOffset - 15
					end
				end

				local hasFullyPreparedQuest, itemDisplayList, nextPreQuest, questTextColorRGB = CasualTBCPrep.QuestData.GetQuestProgressionDetails(quest)

				if hasFullyPreparedQuest then
					readyQuestCount = readyQuestCount + 1
				end

				local questNameText = ""--"• "
				local overrideTooltip = nil

				if quest.notice ~= nil and quest.header ~= nil then
					questNameText = questNameText .. quest.header
				else
					questNameText = questNameText .. quest.data.name
				end

				local questText = frameQuestPrep.scrollChild:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
				questText:SetPoint(point, frameQuestPrep.scrollChild, relativePoint, xOffsetQuestText, yOffset)
				questText:SetText(questNameText)
				questText:SetTextColor(questTextColorRGB.r, questTextColorRGB.g, questTextColorRGB.b)

				CreateListQuestTooltip(wMain, point, quest, questText, yOffset, nextPreQuest, itemDisplayList, quest.data.reqAnyItem)
				table.insert(frameQuestPrep.questTexts, questText)

				yOffset = yOffset - 15
			end

		end
		yOffset = yOffset - 10
	else
		if headerFrame then
			headerFrame:Hide()
		end
	end

	return yOffset, aCount, cCount, readyQuestCount
end

---@param yOffset number
---@param point string
---@param relativePoint string
---@return number, number, number, number
local function LoadQuestlogQuests(wMain, xOffset, yOffset, point, relativePoint)
	if not frameQuestPrep.qloglist_header then
		frameQuestPrep.qloglist_header = frameQuestPrep.scrollChild:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
	end

	local availableQuests, completedQuests = CasualTBCPrep.QuestData.GetAllQuestsGroup_Questlog()
	return LoadSpecificQuestList(wMain, xOffset, yOffset, "Questlog", frameQuestPrep.qloglist_header, availableQuests, completedQuests, point, relativePoint)
end

---@param yOffset number
---@param point string
---@param relativePoint string
---@return number, number, number, number
local function LoadTurninQuests(wMain, xOffset, yOffset, point, relativePoint)
	if not frameQuestPrep.turninlist_header then
		frameQuestPrep.turninlist_header = frameQuestPrep.scrollChild:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
	end

	local availableQuests, completedQuests = CasualTBCPrep.QuestData.GetAllQuestsGroup_Normal()
	return LoadSpecificQuestList(wMain,xOffset, yOffset, "Turnin", frameQuestPrep.turninlist_header, availableQuests, completedQuests, point, relativePoint)
end

---@param yOffset number
---@param point string
---@param relativePoint string
---@return number, number, number, number
local function LoadReputationQuests(wMain, xOffset, yOffset, point, relativePoint)
	if not frameQuestPrep.replist_header then
		frameQuestPrep.replist_header = frameQuestPrep.scrollChild:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
	end

	local availableQuests, completedQuests = CasualTBCPrep.QuestData.GetAllQuestsGroup_Reputation()
	return LoadSpecificQuestList(wMain, xOffset, yOffset, "Reputation", frameQuestPrep.replist_header, availableQuests, completedQuests, point, relativePoint)
	
end

---@param yOffset number
---@param point string
---@param relativePoint string
---@return number, number, number, number
local function LoadExpensiveQuests(wMain, xOffset, yOffset, point, relativePoint)
	if not frameQuestPrep.explist_header then
		frameQuestPrep.explist_header = frameQuestPrep.scrollChild:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
	end

	local availableQuests, completedQuests = CasualTBCPrep.QuestData.GetAllQuestsGroup_Expensive()
	return LoadSpecificQuestList(wMain, xOffset, yOffset, "Expensive", frameQuestPrep.explist_header, availableQuests, completedQuests, point, relativePoint)
end

---@param yOffset number
---@param point string
---@param relativePoint string
---@return number, number, number, number
local function LoadItemQuests(wMain, xOffset, yOffset, point, relativePoint)
	if not frameQuestPrep.itemlist_header then
		frameQuestPrep.itemlist_header = frameQuestPrep.scrollChild:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
	end

	local availableQuests, completedQuests = CasualTBCPrep.QuestData.GetAllQuestsGroup_Items()
	return LoadSpecificQuestList(wMain, xOffset, yOffset, "Item", frameQuestPrep.itemlist_header, availableQuests, completedQuests, point, relativePoint)
end

---@param wMain Frame|nil
function CasualTBCPrep.WM_QuestPrep.Load(wMain)
	if wMain == nil then
		return
	end

	local xOffset = 0
	local yOffset = 0
	local yActualStart = 0
	local yOffsetFinalMax = 0;

	local runningAvailableCount = 0
	local runningTotalCount = 0
	local runningReadyCount = 0

	if frameQuestPrep.questTexts then
		for _, fontString in ipairs(frameQuestPrep.questTexts) do
			fontString:Hide()
			fontString:SetText("")
			fontString:SetSize(0, 0)
		end
	end
	if frameQuestPrep.tooltips then
		for _, ttFrame in ipairs(frameQuestPrep.tooltips) do
			ttFrame:Hide()
			ttFrame:SetSize(0, 0)
		end
	end
	frameQuestPrep.questTexts = {}
	frameQuestPrep.tooltips = {}

	-- Left Side
	xOffset = 2
	local newYOffset, aCount, cCount, readyCount = LoadTurninQuests(wMain, xOffset, yOffset, "TOPLEFT", "TOPLEFT")
	runningAvailableCount = runningAvailableCount + aCount
	runningTotalCount = runningTotalCount + aCount + cCount
	runningReadyCount = runningReadyCount + readyCount

	newYOffset, aCount, cCount, readyCount = LoadItemQuests(wMain, xOffset, newYOffset, "TOPLEFT", "TOPLEFT")
	runningAvailableCount = runningAvailableCount + aCount
	runningTotalCount = runningTotalCount + aCount + cCount
	runningReadyCount = runningReadyCount + readyCount

	-- Right Side
	xOffset = 0
	newYOffset, aCount, cCount, readyCount = LoadReputationQuests(wMain, xOffset, yOffset, "TOPRIGHT", "TOPRIGHT")
	runningAvailableCount = runningAvailableCount + aCount
	runningTotalCount = runningTotalCount + aCount + cCount
	runningReadyCount = runningReadyCount + readyCount

	newYOffset, aCount, cCount, readyCount = LoadExpensiveQuests(wMain, xOffset, newYOffset, "TOPRIGHT", "TOPRIGHT")
	runningAvailableCount = runningAvailableCount + aCount
	runningTotalCount = runningTotalCount + aCount + cCount
	runningReadyCount = runningReadyCount + readyCount

	newYOffset, aCount, cCount, readyCount = LoadQuestlogQuests(wMain, xOffset, newYOffset, "TOPRIGHT", "TOPRIGHT")
	runningAvailableCount = runningAvailableCount + aCount
	runningTotalCount = runningTotalCount + aCount + cCount
	runningReadyCount = runningReadyCount + readyCount

	-- Main Header Text
	if not frameQuestPrep.headerText then
		frameQuestPrep.headerText = frameQuestPrep:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
		frameQuestPrep.headerText:SetPoint("TOP", frameQuestPrep, "TOP", 0, -31)
	end

	if runningAvailableCount == runningTotalCount then
		frameQuestPrep.headerText:SetText("You have prepared all " .. runningTotalCount .. " quests!")
	else
		frameQuestPrep.headerText:SetText("Prepared " .. runningReadyCount .. " / " .. runningTotalCount .. " quests")
	end

	yOffset = yActualStart
end

---@param wMain Frame|nil
function CasualTBCPrep.WM_QuestPrep.Selected(wMain)
	if frameQuestPrep == nil then
    	CasualTBCPrep.WM_QuestPrep.Create(wMain)
	end

    CasualTBCPrep.WM_QuestPrep.Load(wMain)
    CasualTBCPrep.WM_QuestPrep.Show(wMain)
end

---@param wMain Frame|nil
RefreshQuestList = function(wMain)
	CasualTBCPrep.WM_QuestPrep.Load(wMain)
end
