CasualTBCPrep = CasualTBCPrep or {}
CasualTBCPrep.UI = CasualTBCPrep.UI or {}
CasualTBCPrep.Settings = CasualTBCPrep.Settings or {}

CasualTBCPrep.AddonName = "TBC Prep"
CasualTBCPrep.AddonNameInternal = "RXPGuides_TBC Launch"

--[Settings]
if not CasualTBCPrepSettingChar then CasualTBCPrepSettingChar = {} end
if not CasualTBCPrepSettingGlobal then CasualTBCPrepSettingGlobal = {} end

-- [Frames]
---@class Frame|nil
local ttQuestAdvanced = nil;

--[Colors]
local clrNotifyErrStart = "|cFFDE5764"
local clrNotifyErrMsg = "|cFFC99E38" 
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

CasualTBCPrep.ColorRGB_CompletedQuest = { r=0.95, g=0.09, b=0.11 }
CasualTBCPrep.ColorRGB_AvailableQuest = { r=0.42, g=0.74, b=0.67 } --"|cFF6CBDAB"
CasualTBCPrep.ColorRGB_ReadyQuest = { r=0.02, g=0.99, b=0.03 }
CasualTBCPrep.ColorRGB_BankedButReadyQuest = { r=0.71, g=0.77, b=0.39 }

local clrTooltipHeader = "|cFF50608C"
local clrZoneLeft = "|cFFBDBB6C"
local clrExpLeft = "|cFFBDBB6C"
local clrCurrentStepLeft = "|cFFBDBB6C"
local clrCurrentStepProg = "|cFFFFFF00"
local clrCurrentStepArea = "|cFFC6CAC9"
local clrTooltipStandOut = "|cFF6CBDAB" --r=0.424, g=0.741, 0.671 

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
end


CasualTBCPrep.CachedRarityColors = { }
--[Default Settings Values]
-- Keys
local settingsKeyPrefix = "casualTbcPrep_z"
CasualTBCPrep.Settings.Warning_QLOG = settingsKeyPrefix .. "PreventAcceptQuestlog"
CasualTBCPrep.Settings.Warning_TURNIN = settingsKeyPrefix .. "PreventAcceptTurnin"
CasualTBCPrep.Settings.Warning_COMPLETING = settingsKeyPrefix .. "PreventCompletingQuest"

CasualTBCPrep.Settings.AllSettings = {
	{ key=CasualTBCPrep.Settings.Warning_QLOG, 			dataType="bit", 	type="cmb", defaultValueGlobal=0,	defaultValueChar=-1,	values={ { text="Use Global", value=-1}, { text="On", value=1 }, { text="Off", value=0}},	name="Questlog Warnings", 	description={ "This will prevent you from picking up quests that should be in your questlog.", "This can be used while leveling to avoid doing anything by mistake.", " ", "Default: Off" }},
	{ key=CasualTBCPrep.Settings.Warning_TURNIN, 		dataType="bit",		type="cmb", defaultValueGlobal=1,	defaultValueChar=-1,	values={ { text="Use Global", value=-1}, { text="On", value=1 }, { text="Off", value=0}},	name="Turnin Warnings",		description={ "This will prevent you from picking up quests that are turned in on TBC Release for exp.", " ", "Turn this off if you're only doing the questlog", " ", "Default: On" } },
	{ key=CasualTBCPrep.Settings.Warning_COMPLETING, 	dataType="bit",		type="cmb",	defaultValueGlobal=1,	defaultValueChar=-1,	values={ { text="Use Global", value=-1}, { text="On", value=1 }, { text="Off", value=0}},	name="Completion Warnings",	description={ "This will prevent you from completing any quests used for TBC Exp.", " ", "Default: On" } },
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
			--Do nothing
		end
	end

	return value
end

---@param key string
function CasualTBCPrep.GetCharSetting(key)
	return ParseSettingsValue(key, CasualTBCPrepSettingChar[key])
end
---@param key string
function CasualTBCPrep.SetCharSetting(key, value)
	CasualTBCPrepSettingChar[key] = value
end

---@param key string
function CasualTBCPrep.GetGlobalSetting(key)
	return CasualTBCPrepSettingGlobal[key]
end
---@param key string
function CasualTBCPrep.SetGlobalSetting(key, value)
	CasualTBCPrepSettingGlobal[key] = value
end

---@param key string
function CasualTBCPrep.GetIsFeatureDisabledGlobalOrChar(key)
	local storedValue = CasualTBCPrep.GetGlobalSetting(key)

	if storedValue == false then
		return true
	end

	return CasualTBCPrep.GetCharSetting(key) == false
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
	return CasualTBCPrep.CreateDuoText(left, right, clrZoneLeft, clrTooltipStandOut)
end

---@param left string
---@param right string
function CasualTBCPrep.CreateExpText(left, right)
	return CasualTBCPrep.CreateDuoText(left, right, clrExpLeft, clrTooltipStandOut)
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
	return clrRepToUse .. "Requires " .. clrTooltipStandOut .. repName .. " " .. clrRepToUse .. repRankTxt
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
	return clrProfToUse .. "Requires " .. clrTooltipStandOut .. reqProfLevel .. " " .. clrProfToUse .. professionName
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
					
			local stepText = clrCurrentStepLeft .. "Next Prequest: |r" .. clrCurrentStepProg .. nextPreQuest.step .. "/" .. nextPreQuest.questCount .. " |r" .. clrTooltipStandOut .. nextPreQuest.questName .. clrCurrentStepArea .. " (" .. nextPreQuest.startZone .. ")|r"
					
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

function CasualTBCPrep.UI.CreateTooltip(parent, point, triggerWidth, triggerHeight, xOffset, yOffset, header, lines, itemDisplayList)
	local tooltip = CreateFrame("Button", nil, parent)
	tooltip:SetPoint(point, parent, point, xOffset, yOffset)
	tooltip:SetSize(triggerWidth, triggerHeight)
	tooltip:SetScript("OnEnter", function(self)
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
	tooltip:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	return tooltip
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
