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

local _compactView = true

--[Forward Declarations]
local RefreshQuestList
local CreateExperienceBar

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
	frameQuestPrep.scrollFrame:SetPoint("TOPLEFT", frameQuestPrep, "TOPLEFT", 11, -70)
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

	checkbox:SetChecked(_compactView)

	checkbox:SetScript("OnClick", function(self)
		_compactView = self:GetChecked()
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

		if not _compactView then
			local aHasRep = a.reqRep ~= nil
			local bHasRep = b.reqRep ~= nil

			if aHasRep and bHasRep then
				local aFacName = GetFactionInfoByID(a.reqRep) or ""
				local bFacName = GetFactionInfoByID(b.reqRep) or ""

				if aFacName ~= bFacName then
					return aFacName < bFacName
				end
				if a.reqRepRank ~= b.reqRepRank then
					return a.reqRepRank < b.reqRepRank
				end
			elseif aHasRep or bHasRep then
				return aHasRep -- Return reps at the top
			else
				local aPrio = areaTypePriority[a.areaType] or 5
				local bPrio = areaTypePriority[b.areaType] or 5

				if aPrio ~= bPrio then
					return aPrio < bPrio
				end

				if a.area ~= b.area then
					return a.area < b.area
				end
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
local function LoadSpecificQuestList(wMain, xOffset, yOffset, headerText, headerFrame, availableQuests, completedQuests, point, relativePoint, isReputationList)
	local aCount = #availableQuests
	local cCount = #completedQuests
	local totalCount = aCount + cCount
	local readyQuestCount = 0

	if not frameQuestPrep.collapsedSections then
		frameQuestPrep.collapsedSections = {}
	end

	local isCollapsed = frameQuestPrep.collapsedSections[headerText] or false
	local collapseIndicator = isCollapsed and "v " or "> "

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
			xOffsetQuestText = xOffset + 4
		else
			xOffsetQuestText = xOffset - 4
		end

		local newList = { }
		for i, quest in ipairs(availableQuests) do
			table.insert(newList, { quest = quest, completed = false })
		end
		for i, quest in ipairs(completedQuests) do
			table.insert(newList, { quest = quest, completed = true })
		end

		if not isCollapsed then
			SortQuestList(newList)

			local currentFactionName = ""
			local currentSeparator = nil
			for i, questWrap in ipairs(newList) do
				local quest = questWrap.quest

				if not _compactView then
					if isReputationList == true then
						if currentSeparator ~= quest.data.reqRep then
							if currentSeparator == nil then
								yOffset = yOffset - 5
							else
								yOffset = yOffset - 2
							end
							currentFactionName = GetFactionInfoByID(quest.data.reqRep) or ""
							currentSeparator = quest.data.reqRep

							local repHeaderText = frameQuestPrep.scrollChild:CreateFontString(nil, "OVERLAY", "GameFontNormal")
							repHeaderText:SetPoint(point, frameQuestPrep.scrollChild, relativePoint, xOffset, yOffset)
							repHeaderText:SetText(currentFactionName or currentSeparator)
							repHeaderText:SetTextColor(0.59, 0.39, 0.77)
							table.insert(frameQuestPrep.questTexts, repHeaderText)

							yOffset = yOffset - 15
						end
					else
						if currentSeparator ~= quest.data.area then
							if currentSeparator == nil then
								yOffset = yOffset - 5
							else
								yOffset = yOffset - 2
							end
							currentSeparator = quest.data.area

							local zoneHeaderText = frameQuestPrep.scrollChild:CreateFontString(nil, "OVERLAY", "GameFontNormal")
							zoneHeaderText:SetPoint(point, frameQuestPrep.scrollChild, relativePoint, xOffset, yOffset)
							zoneHeaderText:SetText(currentSeparator)
							zoneHeaderText:SetTextColor(0.59, 0.39, 0.77)
							table.insert(frameQuestPrep.questTexts, zoneHeaderText)

							yOffset = yOffset - 15
						end
					end
				end

				local hasFullyPreparedQuest, itemDisplayList, nextPreQuest, questTextColorRGB = CasualTBCPrep.QuestData.GetQuestProgressionDetails(quest)

				if hasFullyPreparedQuest then
					readyQuestCount = readyQuestCount + 1
					frameQuestPrep.expectedExperienceTotal = frameQuestPrep.expectedExperienceTotal + quest.data.exp
					frameQuestPrep.expectedQuestCompletion = frameQuestPrep.expectedQuestCompletion + 1
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
		else -- Collapsed, but still accumulate exp
			for i, questWrap in ipairs(newList) do
				local quest = questWrap.quest
				local hasFullyPreparedQuest, _, _, _ = CasualTBCPrep.QuestData.GetQuestProgressionDetails(quest)

				if hasFullyPreparedQuest then
					frameQuestPrep.expectedExperienceTotal = frameQuestPrep.expectedExperienceTotal + quest.data.exp
					frameQuestPrep.expectedQuestCompletion = frameQuestPrep.expectedQuestCompletion + 1
				end
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
	return LoadSpecificQuestList(wMain, xOffset, yOffset, "Questlog", frameQuestPrep.qloglist_header, availableQuests, completedQuests, point, relativePoint, false)
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
	return LoadSpecificQuestList(wMain,xOffset, yOffset, "Turnin", frameQuestPrep.turninlist_header, availableQuests, completedQuests, point, relativePoint, false)
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
	return LoadSpecificQuestList(wMain, xOffset, yOffset, "Reputation", frameQuestPrep.replist_header, availableQuests, completedQuests, point, relativePoint, true)
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
	return LoadSpecificQuestList(wMain, xOffset, yOffset, "Expensive", frameQuestPrep.explist_header, availableQuests, completedQuests, point, relativePoint, false)
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
	return LoadSpecificQuestList(wMain, xOffset, yOffset, "Item", frameQuestPrep.itemlist_header, availableQuests, completedQuests, point, relativePoint, false)
end

---@param wMain Frame|nil
function CasualTBCPrep.WM_QuestPrep.Load(wMain)
	if wMain == nil then
		return
	end

	local xOffset = 0
	local yOffset = -3

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
	if frameQuestPrep.expBar then
		for _, frame in ipairs(frameQuestPrep.expBar) do
			frame:Hide()
			frame:SetSize(0, 0)
		end
	end
	frameQuestPrep.questTexts = {}
	frameQuestPrep.tooltips = {}
	frameQuestPrep.expBar = {}
	frameQuestPrep.expectedExperienceTotal = 0
	frameQuestPrep.expectedQuestCompletion = 0

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
	xOffset = -1
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

	CreateExperienceBar(wMain, frameQuestPrep)

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

CreateExperienceBar = function(wMain, parent)
	local barWidth = wMain.GetSizeWidth() - 14
	local barHeight = 11
	local chunks = 20

	local xOffset = 0
	local yOffset = -57

	local expectedExpTotal = frameQuestPrep.expectedExperienceTotal or 0
	local targetLevel, targetExp, expPercentProgress = CasualTBCPrep.Experience.GetLevelProgress(60, 0, expectedExpTotal)-- Could use player values, but no point rn? UnitLevel("player") and UnitXP("player")
	local thisLevelTotalExp = CasualTBCPrep.Experience.GetRequiredExperienceFor(targetLevel, targetLevel + 1)

	local expBarFrame = CreateFrame("StatusBar", nil, parent)
	expBarFrame:SetSize(barWidth, barHeight)
    expBarFrame:SetPoint("TOP", parent, "TOP", xOffset, yOffset)
	expBarFrame:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
	--expBarFrame:SetStatusBarColor(0.64, 0.68, 0.17) -- Yellow, Energy
	expBarFrame:SetStatusBarColor(0.45, 0.02, 0.42)
	expBarFrame:SetMinMaxValues(0, 100)
	expBarFrame:SetValue(expPercentProgress)
	table.insert(frameQuestPrep.expBar, expBarFrame)

	local bgFrame = expBarFrame:CreateTexture(nil, "BACKGROUND")
	bgFrame:SetTexture("Interface\\PaperDollInfoFrame\\UI-Character-Skills-Bar")
	bgFrame:SetAllPoints(expBarFrame)
	bgFrame:SetVertexColor(0.3, 0.3, 0.3, 0.8)
	table.insert(frameQuestPrep.expBar, bgFrame)

	for i = 1, chunks - 1 do
		local segmentFrame = expBarFrame:CreateTexture(nil, "OVERLAY")
		segmentFrame:SetColorTexture(0, 0, 0, 0.2)
		segmentFrame:SetWidth(2)
		segmentFrame:SetHeight(expBarFrame:GetHeight() - 2)
		segmentFrame:SetPoint("LEFT", expBarFrame, "LEFT", i * (expBarFrame:GetWidth() / chunks), 0)
		table.insert(frameQuestPrep.expBar, segmentFrame)
	end

	-- Make it look like the expbar blends in well...
	-- Zoomed in for edge colors, make it seem like it blends in naturally... ish
	local tBrdClrR = 0.161
	local tBrdClrG = 0.149
	local tBrdClrB = 0.137
	local lBrdClrR = 0.247
	local lBrdClrG = 0.220
	local lBrdClrB = 0.188
	local rBrdClrR = 0.086
	local rBrdClrG = 0.094
	local rBrdClrB = 0.086

	local texTopBorder = expBarFrame:CreateTexture(nil, "OVERLAY")
	texTopBorder:SetColorTexture(tBrdClrR, tBrdClrG, tBrdClrB, 0.8)
	texTopBorder:SetHeight(2)
	texTopBorder:SetWidth(expBarFrame:GetWidth())
	texTopBorder:SetPoint("TOP", expBarFrame, "TOP", 0, 1)
	table.insert(frameQuestPrep.expBar, texTopBorder)

	local texLeftBorder = expBarFrame:CreateTexture(nil, "OVERLAY")
	texLeftBorder:SetColorTexture(lBrdClrR, lBrdClrG, lBrdClrB, 0.8)
	texLeftBorder:SetWidth(2)
	texLeftBorder:SetHeight(expBarFrame:GetHeight())
	texLeftBorder:SetPoint("LEFT", expBarFrame, "LEFT", -2, 0)
	table.insert(frameQuestPrep.expBar, texLeftBorder)

	local texRightBorder = expBarFrame:CreateTexture(nil, "OVERLAY")
	texRightBorder:SetColorTexture(rBrdClrR, rBrdClrG, rBrdClrB, 0.8)
	texRightBorder:SetWidth(2)
	texRightBorder:SetHeight(expBarFrame:GetHeight())
	texRightBorder:SetPoint("RIGHT", expBarFrame, "RIGHT", 1, 0)
	table.insert(frameQuestPrep.expBar, texRightBorder)

	if expPercentProgress > 1 then
		local sparkStrength = math.ceil(expPercentProgress / 20) * 7 --7/14/21/28 at 20/40/60/80 %

		local texExpSpark = expBarFrame:CreateTexture(nil, "OVERLAY")
		texExpSpark:SetTexture("Interface\\CastingBar\\UI-CastingBar-Spark")
		texExpSpark:SetBlendMode("ADD")
		texExpSpark:SetWidth(sparkStrength)
		texExpSpark:SetHeight(26)
		texExpSpark:SetPoint("CENTER", expBarFrame:GetStatusBarTexture(), "RIGHT", 0, 0)
		table.insert(frameQuestPrep.expBar, texExpSpark)
	end

	local txtClrR = 0.9
	local txtClrG = 0.9
	local txtClrB = 0.9

	-- Visuals done, add progression text
	local rawExpText = tostring(targetExp) .. " / " .. tostring(thisLevelTotalExp)
	local expPercentText = tostring(math.floor(expPercentProgress + 0.5)) .. "%"
	local targetLevelText = tostring(targetLevel)
	local nextLevelText = tostring((targetLevel + 1))

	local txtExpValue = expBarFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
	txtExpValue:SetPoint("CENTER", expBarFrame, "CENTER", 0, 0)
	txtExpValue:SetText(rawExpText)
	txtExpValue:SetTextColor(txtClrR, txtClrG, txtClrB)
	table.insert(frameQuestPrep.expBar, txtExpValue)

	local txtCurLvl = expBarFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
	txtCurLvl:SetPoint("LEFT", expBarFrame, "LEFT", 3, 0)
	txtCurLvl:SetText(targetLevelText)
	txtCurLvl:SetTextColor(txtClrR, txtClrG, txtClrB)
	table.insert(frameQuestPrep.expBar, txtCurLvl)

	local txtNextLvl = expBarFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
	txtNextLvl:SetPoint("RIGHT", expBarFrame, "RIGHT", -4, 0)
	txtNextLvl:SetText(nextLevelText)
	txtNextLvl:SetTextColor(txtClrR, txtClrG, txtClrB)
	table.insert(frameQuestPrep.expBar, txtNextLvl)

	local qCount = (frameQuestPrep.expectedQuestCompletion or 0)
	local ttLines = {
		"You will hit level " .. targetLevelText .. " with " .. expPercentText .. " exp",
		"|cFFB4C2B8Assuming you complete your " .. tostring(qCount) .. " quest" .. (qCount == 1 and "" or "s") .. "|r",
		" ",
		"Experience: |cFFFFFFFF" .. rawExpText .. "|r",
	}
	local tooltip = CasualTBCPrep.UI.CreateTooltip(expBarFrame, "CENTER", expBarFrame:GetWidth(), barHeight, 0, 0, "Experience Progress", ttLines, nil)
	table.insert(frameQuestPrep.tooltips, tooltip)
end