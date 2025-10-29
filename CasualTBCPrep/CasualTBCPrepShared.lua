CasualTBCPrep = CasualTBCPrep or {}
CasualTBCPrep.UI = CasualTBCPrep.UI or {}

CasualTBCPrep.AddonName = "TBC Prep"
CasualTBCPrep.AddonNameInternal = "RXPGuides_TBC Launch"

--[Settings]
if not CasualTBCPrepSettingChar then CasualTBCPrepSettingChar = {} end
if not CasualTBCPrepSettingGlobal then CasualTBCPrepSettingGlobal = {} end
local trace = false
local traceUI = false

-- [Frames]
---@class Frame|nil
local ttQuestAdvanced = nil;

--[Colors]
local clrNotifyErrStart = "|cFFED6D2D"
local clrNotifyErrMsg = "|cFFE32020"
local clrNotifyStart = "|cFF94C8E0"
local clrNotifyMsg = "|cFFD1E6D4"


CasualTBCPrep.ColorRed = "|cFFFF0000"
CasualTBCPrep.ColorGreen = "|cFF00FF00"
CasualTBCPrep.ColorBlue = "|cFF0000FF"
CasualTBCPrep.ColorYellow = "|cFFFFFF00"

CasualTBCPrep.ColorPoor = "|cFF9D9D9D"
CasualTBCPrep.ColorCommon = "|cFFFFFFFF"
CasualTBCPrep.ColorUncommon = "|cFF1EFF00"
CasualTBCPrep.ColorRare = "|cFF0070DD"
CasualTBCPrep.ColorEpic = "|cFFA335EE"
CasualTBCPrep.ColorLegendary = "|cFFFF8000"
CasualTBCPrep.ColorArtifact = "|cFFE6CC80"
CasualTBCPrep.ColorHeirloom = "|cFF00CCFF"

CasualTBCPrep.ColorRGB_CompletedQuest = { r=0.95, g=0.09, b=0.11, hex="|cFFF2181C" }
CasualTBCPrep.ColorRGB_AvailableQuest = { r=0.42, g=0.74, b=0.67, hex="|cFF5BBDAA" } --"|cFF6CBDAB"
CasualTBCPrep.ColorRGB_ReadyQuest = { r=0.02, g=0.99, b=0.03, hex="|cFF05FC08" }
CasualTBCPrep.ColorRGB_BankedButReadyQuest = { r=0.51, g=0.76, b=0.39, hex="|cFF82C261" }

CasualTBCPrep.ColorExpLeft = "|cFFBDBB6C"
CasualTBCPrep.ColorTooltipStandOut = "|cFF6CBDAB" --r=0.424, g=0.741, 0.671 

local clrTooltipHeader = "|cFF50608C"
local clrZoneLeft = "|cFFBDBB6C"
local clrCurrentStepLeft = "|cFFBDBB6C"
local clrCurrentStepProg = "|cFFFFFF00"
local clrCurrentStepArea = "|cFFC6CAC9"

--[World of Warcraft]
CasualTBCPrep.ReputationRanks = {
	[1] = "Hated",
	[2] = "Hostile", 
	[3] = "Unfriendly",
	[4] = "Neutral",
	[5] = "Friendly",
	[6] = "Honored",
	[7] = "Revered",
	[8] = "Exalted"
}
CasualTBCPrep.ProfessionNames = {
	[185] = "Cooking",
	[129] = "First Aid",
	[356] = "Fishing",

	[171] = "Alchemy",
	[164] = "Blacksmithing",
	[333] = "Enchanting",
	[202] = "Engineering",
	[773] = "Inscription", -- wotlk
	[755] = "Jewelcrafting", -- tbc
	[165] = "Leatherworking",
	[197] = "Tailoring",
	[182] = "Herbalism",
	[186] = "Mining",
	[393] = "Skinning"
}

CasualTBCPrep.CachedRarityColors = { }


--[Info/Error Handling]
function CasualTBCPrep.Print(message)
	if message then
		print(tostring(message));
	end
end
---@param message string|nil
function CasualTBCPrep.NotifyUser(message)
	print(clrNotifyStart .. "[" .. CasualTBCPrep.AddonName .. "]: " .. clrNotifyMsg .. (message or "???"));
end
---@param message string|nil
function CasualTBCPrep.NotifyUserError(message)
	print(clrNotifyErrStart .. "[" .. CasualTBCPrep.AddonName .. "]: " .. clrNotifyErrMsg .. (message or "Unknown Error"));
	CasualTBCPrep.Sounds.PlaySound_WhisperPing()
end

---@param message string|nil
function CasualTBCPrep.Trace(message)
	if not trace or message == nil or message == "" then
		return
	end
	print(clrNotifyStart .. "[" .. CasualTBCPrep.AddonName .. "] Trace: " .. clrNotifyMsg .. tostring(message));
end
---@param message string|nil
function CasualTBCPrep.TraceUI(message)
	if not traceUI or message == nil or message == "" then
		return
	end
	print(clrNotifyStart .. "[" .. CasualTBCPrep.AddonName .. "] Trace: " .. clrNotifyMsg .. tostring(message));
end

--[Text Helpers]
---@param left string
---@param right string
---@param clrLeft string
---@param clrRight string
function CasualTBCPrep.CreateDuoText(left, right, clrLeft, clrRight)
	return clrLeft .. left .. clrRight .. right
end

---@param left string
---@param right string
function CasualTBCPrep.CreateZoneText(left, right)
	return CasualTBCPrep.CreateDuoText(left, right, clrZoneLeft, CasualTBCPrep.ColorTooltipStandOut)
end

---@param left string
---@param right string
function CasualTBCPrep.CreateExpText(left, right)
	return CasualTBCPrep.CreateDuoText(left, right, CasualTBCPrep.ColorExpLeft, CasualTBCPrep.ColorTooltipStandOut)
end

---@param repID number
---@param repRank number
function CasualTBCPrep.CreateRepRankText(repID, repRank)
	local repName, _, standingID = GetFactionInfoByID(repID)
	local repRankTxt = CasualTBCPrep.ReputationRanks[repRank] or "Unknown"

	local clrRepToUse = CasualTBCPrep.ColorRed
	if standingID >= repRank then
		clrRepToUse = CasualTBCPrep.ColorGreen
	end
	return clrRepToUse .. "Requires " .. CasualTBCPrep.ColorTooltipStandOut .. repName .. " " .. clrRepToUse .. repRankTxt
end

---@param profID number
---@param reqProfLevel number
function CasualTBCPrep.CreateProfRankText(profID, reqProfLevel)
	local professionName = CasualTBCPrep.ProfessionNames[profID] or "Unknown Profession"

	local playerProfessionSkill = 0

	for i = 1, GetNumSkillLines() do
		local skillName, _, _ , skillRank, _, _, maxSkill = GetSkillLineInfo(i)

		if professionName == skillName then
			playerProfessionSkill = skillRank
			break
		end
	end

	local clrProfToUse = CasualTBCPrep.ColorRed
	if playerProfessionSkill >= reqProfLevel then
		clrProfToUse = CasualTBCPrep.ColorGreen
	end
	return clrProfToUse .. "Requires " .. CasualTBCPrep.ColorTooltipStandOut .. reqProfLevel .. " " .. clrProfToUse .. professionName
end


function CasualTBCPrep.TableInsertUnique(list, value)
	for _, v in ipairs(list) do
		if v == value then
			return
		end
	end
	table.insert(list, value)
end


local function GetOrCreateCustomTooltip()
	if ttQuestAdvanced then
		return ttQuestAdvanced
	end

	ttQuestAdvanced = CreateFrame("Frame", "CasualTBCPrepCustomTooltip", UIParent, "BackdropTemplate")
	ttQuestAdvanced:SetSize(250, 100)
	ttQuestAdvanced:SetBackdrop({
		bgFile = "Interface\\Buttons\\WHITE8X8",
		edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
		tile = true, tileSize = 16, edgeSize = 16,
		insets = { left = 4, right = 4, top = 4, bottom = 4 }
	})
	ttQuestAdvanced:SetBackdropColor(0, 0, 0, 0.85)
	ttQuestAdvanced:SetFrameStrata("TOOLTIP")
	ttQuestAdvanced:Hide()

	ttQuestAdvanced.content = {}

	return ttQuestAdvanced
end

---@param index number
function OnRouteSelection(index)
	local targetRouteCode = nil
	local routeSelectedMessage = ""
	if index == 1 then -- Strat
		routeSelectedMessage = "Route Selected: 'Full Stratholme Route'. You can change it in the 'Route' tab."
		targetRouteCode = CasualTBCPrep.Routing.RouteCodeStrat
	elseif index == 2 then -- Main
		routeSelectedMessage = "Route Selected: 'Main Route'. You can change it in the 'Route' tab."
		targetRouteCode = CasualTBCPrep.Routing.RouteCodeMain
	elseif index == 3 then -- Solo
		routeSelectedMessage = "Route Selected: 'Solo Route'. You can change it in the 'Route' tab."
		targetRouteCode = CasualTBCPrep.Routing.RouteCodeSolo
	end

	if targetRouteCode ~= nil then
		CasualTBCPrep.Settings.SetCharSetting(CasualTBCPrep.Settings.SelectedRoute, targetRouteCode)
		CasualTBCPrep.Routing.ChangeCurrentRoute(targetRouteCode)
		CasualTBCPrep.W_Main.ReloadActiveTab()

		CasualTBCPrep.NotifyUser(routeSelectedMessage)
	end
end


local frameRouteSelection
local routeSelectionElements = { }
---@param index number
function ShowRouteText(index)
	if frameRouteSelection == nil then
		return
	end

	if index == 1 then -- Strat
		frameRouteSelection.textRouteHeader:SetText("Full Stratholme Route")
		frameRouteSelection.textLine1:SetText("Expects 5 summons and access to mage portals in 2 zones & cities")
		frameRouteSelection.textLine2:SetText("This is the Main route, but with 1 Living & 1 Undead Stratholme run")
		frameRouteSelection.textLine3:SetText("Mob experience from Stratholme is not calculated into 'Possible Level' below")
		frameRouteSelection.textLine4:SetText("Possible Level: 62 + 75%")
		frameRouteSelection.textLine5:SetText("Estimated Time:  118 minutes")
	elseif index == 2 then -- Main
		frameRouteSelection.textRouteHeader:SetText("Main Route")
		frameRouteSelection.textLine1:SetText("Expects 5 summons and access to mage portals in 2 zones & cities")
		frameRouteSelection.textLine2:SetText("This route was made for a 5man group that wants a headstart before entering TBC")
		frameRouteSelection.textLine3:SetText("3 Summons can be skipped for less or slower exp")
		frameRouteSelection.textLine4:SetText("Possible Level: 62 + 46%")
		frameRouteSelection.textLine5:SetText("Estimated Time:   64 minutes")
	elseif index == 3 then -- Solo
		frameRouteSelection.textRouteHeader:SetText("Solo Route")
		frameRouteSelection.textLine1:SetText("Work in Progress: This route is not finished yet")
		frameRouteSelection.textLine2:SetText("This route requires no outside help on TBC Release")
		frameRouteSelection.textLine3:SetText("It takes longer, but routes through zones with other quests available")
		frameRouteSelection.textLine4:SetText("Possible Level:                 ")
		frameRouteSelection.textLine5:SetText("Estimated Time:                       ")
	end
end


function CasualTBCPrep.UI.ClearRouteSelectionUI(parentFrame)
	if routeSelectionElements ~= nil then
		for _, obj in ipairs(routeSelectionElements) do
			obj:Hide()
		end
	end

	if frameRouteSelection ~= nil then
		frameRouteSelection:Hide()
		frameRouteSelection = nil
	end

	if parentFrame.scrollFrame ~= nil then
		parentFrame.scrollFrame:Show()
	end
end

---@param wMain Frame
---@param parentFrame Frame
function CasualTBCPrep.UI.CreateRouteSelection(wMain, parentFrame)
	if frameRouteSelection ~= nil then
		return
	end

	local imgPath = "Interface\\AddOns\\" .. CasualTBCPrep.AddonNameInternal .. "\\Resources\\Images\\Backgrounds\\darkportal"
	local buttonIconPath = "Interface\\AddOns\\" .. CasualTBCPrep.AddonNameInternal .. "\\Resources\\Images\\RouteSelect\\"

    frameRouteSelection = CreateFrame("Frame", nil, wMain)
    frameRouteSelection:SetClipsChildren(true)
	frameRouteSelection:SetAllPoints(wMain)
	table.insert(routeSelectionElements, frameRouteSelection)

    local bg = frameRouteSelection:CreateTexture(nil, "BACKGROUND")
    bg:SetSize(540, 360)
    bg:SetPoint("BOTTOM", frameRouteSelection, "BOTTOM", 7, -1)
    bg:SetTexture(imgPath)
    bg:SetTexCoord(0, 1, 0, 1)
    bg:SetAlpha(0.50)
	table.insert(routeSelectionElements, bg)

	local topHeaderText = frameRouteSelection:CreateFontString(nil, "OVERLAY", "GameFontNormalHuge")
	topHeaderText:SetPoint("TOP", frameRouteSelection, "TOP", 0, -30)
	topHeaderText:SetText("Route Selection")
	topHeaderText:SetTextColor(0.53, 0.92, 0.63)
	table.insert(routeSelectionElements, topHeaderText)

	local iconSize = 52
	local iconSpacing = 18
    local frameButtons = CreateFrame("Frame", nil, wMain)
	frameButtons:SetPoint("BOTTOM", wMain, "BOTTOM", 0, (iconSize * 3) + (iconSpacing * 2) - 5)
	frameButtons:SetPoint("LEFT", wMain, "LEFT")
	frameButtons:SetPoint("RIGHT", wMain, "RIGHT")
	frameButtons.buttons = {}
	table.insert(routeSelectionElements, frameButtons)

	local iconPaths = {
		buttonIconPath.."routeStrat",
		buttonIconPath.."routeMain",
		buttonIconPath.."routeSolo"
	}

	for i, path in ipairs(iconPaths) do
		local btn = CreateFrame("Button", nil, frameButtons)
		btn:SetSize(iconSize, iconSize)
		btn:SetPoint("CENTER", frameButtons, "BOTTOM", 0, -(i-1)*(iconSize + iconSpacing))

		local tex = btn:CreateTexture(nil, "BACKGROUND")
		tex:SetAllPoints()
		tex:SetTexture(path)
		tex:SetAlpha(1)
		btn.Texture = tex
		btn.ButtonIndex = i

		btn:SetScript("OnEnter", function(self)
			self.Texture:ClearAllPoints()
			self.Texture:SetPoint("TOPLEFT", -16, 16)
			self.Texture:SetPoint("BOTTOMRIGHT", 16, -16)
			self.Texture:SetAlpha(0.95)
			ShowRouteText(self.ButtonIndex)
		end)
		btn:SetScript("OnLeave", function(self)
			self.Texture:ClearAllPoints()
			self.Texture:SetAllPoints()
			self.Texture:SetAlpha(1)
		end)

		btn:SetScript("OnClick", function()
			OnRouteSelection(i)
		end)

		table.insert(routeSelectionElements, btn)
	end

	-- Create Texts
	local routeHeader = frameRouteSelection:CreateFontString(nil, "OVERLAY", "GameFontNormalHuge")
	routeHeader:SetPoint("TOP", frameRouteSelection, "TOP", 0, -63)
	routeHeader:SetText("Hover a route for details")
	routeHeader:SetTextColor(0.94, 0.86, 0.5)
	table.insert(routeSelectionElements, routeHeader)
	frameRouteSelection.textRouteHeader = routeHeader

	local routeLine1 = frameRouteSelection:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	routeLine1:SetPoint("TOP", routeHeader, "TOP", 0, -21)
	routeLine1:SetText("")
	routeLine1:SetTextColor(1, 0.35, 0.22)
	table.insert(routeSelectionElements, routeLine1)
	frameRouteSelection.textLine1 = routeLine1
	local routeLine2 = frameRouteSelection:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	routeLine2:SetPoint("TOP", routeLine1, "TOP", 0, -22)
	routeLine2:SetText("")
	routeLine2:SetTextColor(0.9, 0.88, 0.78)
	table.insert(routeSelectionElements, routeLine2)
	frameRouteSelection.textLine2 = routeLine2
	local routeLine3 = frameRouteSelection:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	routeLine3:SetPoint("TOP", routeLine2, "TOP", 0, -13)
	routeLine3:SetText("")
	routeLine3:SetTextColor(0.9, 0.88, 0.78)
	table.insert(routeSelectionElements, routeLine3)
	frameRouteSelection.textLine3 = routeLine3
	local routeLine4 = frameRouteSelection:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	routeLine4:SetPoint("TOP", routeLine3, "TOP", 0, -22)
	routeLine4:SetText("")
	routeLine4:SetTextColor(0.745, 0.9, 0.88)
	table.insert(routeSelectionElements, routeLine4)
	frameRouteSelection.textLine4 = routeLine4

	local routeLine5 = frameRouteSelection:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	routeLine5:SetPoint("TOP", routeLine4, "TOP", 0, -14)
	routeLine5:SetText("")
	routeLine5:SetTextColor(0.745, 0.9, 0.88)
	table.insert(routeSelectionElements, routeLine5)
	frameRouteSelection.textLine5 = routeLine5
end

---@param parentFrame Frame
---@param iconSize number
---@param borderSize number
---@param itemID number
---@param anchorPoint string
---@param anchorRelativeTo string
---@param xOffset number
---@param yOffset number
---@param withTooltip boolean
function CasualTBCPrep.UI.CreateItemImage(parentFrame, iconSize, borderSize, itemID, anchorPoint, anchorRelativeTo, xOffset, yOffset, withTooltip)
	if itemID == nil or itemID <= 0 then
		return nil, nil
	end
	local itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, itemTexture = C_Item.GetItemInfo(itemID)

	if not itemTexture or itemTexture <= 0 then
		itemTexture = 134400 -- inv_misc_questionmark
	end
	
	-- Icon
	local icon = parentFrame:CreateTexture(nil, "ARTWORK")
	icon:SetTexture(itemTexture)
	icon:SetSize(iconSize, iconSize)
	icon:SetPoint(anchorPoint, parentFrame, anchorPoint, xOffset, yOffset)
		
	-- Icon Rarity Border
	local borderFrame = CreateFrame("Frame", nil, parentFrame, "BackdropTemplate")
	borderFrame:SetSize(borderSize, borderSize)
	borderFrame:SetPoint("CENTER", icon, "CENTER", 0, 0)
	borderFrame:SetBackdrop({
		edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
		edgeSize = 12,
		insets = { left = 0, right = 0, top = 0, bottom = 0 }
	})

	local textRarityColor = "|cFFFFFFFF" -- white default
	
	if itemRarity and itemRarity > 1 then
		if CasualTBCPrep.CachedRarityColors[itemRarity] then
			local cachedColor = CasualTBCPrep.CachedRarityColors[itemRarity]
			textRarityColor = cachedColor.textColor
			
			borderFrame:SetBackdropBorderColor(cachedColor.r, cachedColor.g, cachedColor.b, 1)
		else
			local r, g, b = C_Item.GetItemQualityColor(itemRarity)
			textRarityColor = string.format("|cFF%02x%02x%02x", r * 255, g * 255, b * 255)
			CasualTBCPrep.CachedRarityColors[itemRarity] = { textColor=textRarityColor, r=r, g=g, b=b }

			borderFrame:SetBackdropBorderColor(r, g, b, 1)
		end
	else
		borderFrame:Hide()
	end

	return icon, borderFrame, textRarityColor, itemName
end

--[Shared UI Functions]
---@param parent Frame
---@param point string
---@param width number
---@param height number
---@param header string
function CasualTBCPrep.UI.UpdateAdvancedQuestTooltip(parent, point, width, height, x, y, header, lines, nextPreQuest, itemDisplayList, reqAnyItem)

	local tooltip = CreateFrame("Button", nil, parent)
	tooltip:SetPoint(point, parent, point, x, y)
	tooltip:SetSize(width, height)
	tooltip:SetScript("OnEnter", function(self)
		local ttFrame = GetOrCreateCustomTooltip()

		for _, contentObj in ipairs(ttFrame.content) do
			if contentObj then
			contentObj:Hide()
			end
		end

		local wideElementWidth = 0

		ttFrame.content = {}
		ttFrame:ClearAllPoints()
		ttFrame:SetPoint("LEFT", self, "RIGHT", 5, 0)

		local marginLeft = 10
		local marginRight = 10
		local marginTop = -10
		local marginBot = -4;

		local yPosition = marginTop

		if not ttFrame.headerText then
			ttFrame.headerText = ttFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
			ttFrame.headerText:SetTextColor(1, 1, 1)
		end

		ttFrame.headerText:SetPoint("TOPLEFT", ttFrame, "TOPLEFT", marginLeft, yPosition)
		ttFrame.headerText:SetText(header)
		ttFrame.headerText:Show()
		table.insert(ttFrame.content, ttFrame.headerText)
		yPosition = yPosition - 18
		wideElementWidth = math.max(wideElementWidth, ttFrame.headerText:GetStringWidth() )

		if lines then
			for _, text in ipairs(lines) do
				local line = ttFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
				line:SetPoint("TOPLEFT", ttFrame, "TOPLEFT", marginLeft, yPosition)
				line:SetText(text)
				line:SetJustifyH("LEFT")
				table.insert(ttFrame.content, line)
				yPosition = yPosition - 15

				wideElementWidth = math.max(wideElementWidth, line:GetStringWidth())
			end
		end

		-- Prequests
		if nextPreQuest ~= nil then
			local preQuestLine = ttFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
			preQuestLine:SetPoint("TOPLEFT", ttFrame, "TOPLEFT", marginLeft, yPosition)
					
			local stepText = clrCurrentStepLeft .. "Next Prequest: |r" .. clrCurrentStepProg .. nextPreQuest.step .. "/" .. nextPreQuest.questCount .. " |r" .. CasualTBCPrep.ColorTooltipStandOut .. nextPreQuest.questName .. clrCurrentStepArea .. " (" .. nextPreQuest.startZone .. ")|r"
					
			preQuestLine:SetText(stepText)
			preQuestLine:SetJustifyH("LEFT")
			table.insert(ttFrame.content, preQuestLine)
			yPosition = yPosition - 15

			wideElementWidth = math.max(wideElementWidth, preQuestLine:GetStringWidth())
					
			yPosition = yPosition - 5
		end

		-- Items
		if itemDisplayList then
			local iconSize = 28
			local iconPaddingX = 3
			local iconPaddingY = 5
			local borderSize = iconSize + 2
			local textLineHeight = 12

			yPosition = yPosition - iconPaddingY

			local itemsToDisplay = {}
			if reqAnyItem then
				local foundItem = nil

				for _, item in ipairs(itemDisplayList) do
					if item.playerTotalAmount >= item.requiredAmount then
						foundItem = item
						break
					end
				end

				if foundItem then
					table.insert(itemsToDisplay, foundItem)
				else
					itemsToDisplay = itemDisplayList
				end
			else
				itemsToDisplay = itemDisplayList
			end

			for _, item in ipairs(itemsToDisplay) do
				local icon, borderFrame, textRarityColor, itemName = CasualTBCPrep.UI.CreateItemImage(ttFrame, iconSize, borderSize, item.itemID, "TOPLEFT", "TOPLEFT", marginLeft, yPosition, false)
				table.insert(ttFrame.content, icon)
				table.insert(ttFrame.content, borderFrame)

				local itemNameText = textRarityColor .. (itemName or ("Item " .. item.itemID))

				local progressText = ""
				local needsBank = false
				local bankTextColor = CasualTBCPrep.ColorYellow
				if item.playerInvAmount < item.requiredAmount then
					if item.playerBankAmount > 0 then
						needsBank = true
					end
				end

				if item.playerTotalAmount >= item.requiredAmount then
					progressText = (needsBank and CasualTBCPrep.ColorYellow or CasualTBCPrep.ColorGreen) .. math.min(item.playerTotalAmount, item.requiredAmount) .. "/" .. item.requiredAmount
				else
					progressText = CasualTBCPrep.ColorRed .. math.min(item.playerTotalAmount, item.requiredAmount) .. "/" .. item.requiredAmount
					bankTextColor = CasualTBCPrep.ColorRed
				end

				if needsBank then
					progressText = progressText .. "|r " .. bankTextColor .. "(" .. tostring(item.playerBankAmount) .. " in bank)"
				end

				-- Text, Item Name
				local textItemName = ttFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
				textItemName:SetPoint("TOPLEFT", icon, "TOPRIGHT", iconPaddingX, - 1)
				textItemName:SetText(itemNameText)
				table.insert(ttFrame.content, textItemName)
				
				-- Text, Player Progress
				local textProgress = ttFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
				textProgress:SetPoint("TOPLEFT", icon, "TOPRIGHT", iconPaddingX, -textLineHeight - 3)
				textProgress:SetText(progressText)
				table.insert(ttFrame.content, textProgress)
				
				yPosition = yPosition - iconSize - iconPaddingY

				local fattestTextWidth = math.max(textItemName:GetStringWidth(), textProgress:GetStringWidth())
				wideElementWidth = math.max(wideElementWidth, iconSize + iconPaddingX + fattestTextWidth)
			end
		end

		ttFrame:SetWidth(marginLeft + wideElementWidth + marginRight)
		ttFrame:SetHeight(math.abs(yPosition + marginBot)) -- marginTop is added to yPosition earlier
		ttFrame:Show()
	end)

	tooltip:SetScript("OnLeave", function(self)
		local ttFrame = GetOrCreateCustomTooltip()
		if ttFrame then
			ttFrame:Hide()
		end
	end)

	return tooltip
end

function CasualTBCPrep.UI.CreateTooltip(parent, header, lines, itemDisplayList)
	parent:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText(header, 1, 1, 1)

		if lines then
			for _, text in ipairs(lines) do
				GameTooltip:AddLine(text, nil, nil, nil, true)
			end
		end

		if itemDisplayList then
			for _, item in ipairs(itemDisplayList) do
				local itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, itemTexture = C_Item.GetItemInfo(item.itemID)

				if itemTexture == nil or itemTexture <= 0 then
					itemTexture = 134400 -- inv_misc_questionmark
				end

				local iconTexture = "|T" .. itemTexture .. ":24:24|t"
				GameTooltip:AddLine(iconTexture .. " " .. item.headerText, nil, nil, nil, true)
			end
		end

		GameTooltip:Show()
	end)
	parent:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)
end

---@param fontString FontString:nil
---@param defaultR number
---@param defaultG number
---@param defaultB number
function CasualTBCPrep.UI.SetQuestTextColor(fontString, quest, defaultR, defaultG, defaultB)
	if fontString == nil then
		return
	end

	local r = defaultR or 0
	local g = defaultG or 1
	local b = defaultB or 0

	if quest ~= nil and quest.data ~= nil then
		local targetRepID = quest.data.repReq
		local targetRepStanding = quest.data.repReqRank
		
		if targetRepID ~= nil and targetRepID > 0 then
			local repName, _, standingID = GetFactionInfoByID(targetRepID)

			if standingID < targetRepStanding then
				r = 1.00
				g = 0.47
				b = 0.04
			else
				r = 0
				b = 0
			end
		end
	end

	fontString:SetTextColor(r,g,b)
end