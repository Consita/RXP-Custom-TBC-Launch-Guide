CasualTBCPrep = CasualTBCPrep or {}
CasualTBCPrep.WM_ItemPrep = CasualTBCPrep.WM_ItemPrep or {}

--[Variables]
---@class Frame|nil
local frameItemPrep = nil;

--[Forward Declarations]
local RefreshQuestList


--Colors
local clrHeaderText = { r=0.40, g=0.35, b=0.72 }
local clrHeaderQuestAnyText = { r=0.75, g=0.31, b=0.41 }

---@param wMain Frame|nil
function CasualTBCPrep.WM_ItemPrep.Create(wMain)
	if wMain == nil then
		return
	end
	
	frameItemPrep = CreateFrame("Frame", nil, wMain)
	frameItemPrep:SetAllPoints(wMain)
			
	frameItemPrep.scrollFrame = CreateFrame("ScrollFrame", nil, frameItemPrep, "UIPanelScrollFrameTemplate")
	frameItemPrep.scrollFrame:SetPoint("TOPLEFT", frameItemPrep, "TOPLEFT", 11, -67)
	frameItemPrep.scrollFrame:SetPoint("BOTTOMRIGHT", frameItemPrep, "BOTTOMRIGHT", -31, 17)
	
	frameItemPrep.scrollChild = CreateFrame("Frame", nil, frameItemPrep.scrollFrame)
	frameItemPrep.scrollChild:SetSize(frameItemPrep.scrollFrame:GetWidth(), 1)
	frameItemPrep.scrollFrame:SetScrollChild(frameItemPrep.scrollChild)
	
	frameItemPrep:Hide()
end

function CasualTBCPrep.WM_ItemPrep.Hide()
	if frameItemPrep ~= nil then
		frameItemPrep:Hide()
	end
end

---@param wMain Frame|nil
function CasualTBCPrep.WM_ItemPrep.Show(wMain)
	if frameItemPrep == nil then
		CasualTBCPrep.WM_ItemPrep.Create(wMain)
	end

	if frameItemPrep ~= nil then
		frameItemPrep:Show()
	end
end

---@param wMain Frame|nil
local function CreateClickableHeader(wMain, headerFrame, collapseKey)
	if not headerFrame.clickFrame then
		headerFrame.clickFrame = CreateFrame("Button", nil, frameItemPrep.scrollChild)
		headerFrame.clickFrame:SetAllPoints(headerFrame)
		headerFrame.clickFrame:RegisterForClicks("LeftButtonUp")
		headerFrame.clickFrame:SetScript("OnClick", function()
			frameItemPrep.collapsedSections[collapseKey] = not frameItemPrep.collapsedSections[collapseKey]
			if RefreshQuestList then
				RefreshQuestList(wMain)
			end
		end)
		headerFrame.clickFrame:SetScript("OnEnter", function()
			headerFrame:SetTextColor(0.60, 0.55, 0.92)
		end)
		headerFrame.clickFrame:SetScript("OnLeave", function()
			headerFrame:SetTextColor(clrHeaderText.r, clrHeaderText.g, clrHeaderText.b)
		end)
	end
end

---@param wMain Frame|nil
---@return  number, number, number, number, number
local function LoadItemList(wMain)
	local itemList, lstQuestsReqAnyAmount = CasualTBCPrep.QuestData.GetAllRequiredItemsForAvailableQuests()

	local iconSize = 26
	local iconSidePaddingX = 3
	local iconPaddingY = 2
	local borderSize = iconSize + 2

	local yPosition = 0
	local yPosLeft = yPosition
	local yPosRight = yPosition

	local totalPlayerInventoryCount = 0
	local totalPlayerBankCount = 0
	local totalRunningRequiredAmount = 0
	local itemTypes = 0
	local completedItemTypes = 0

	local xTextOffset = 0
	local xProgOffset = 1
	local anchorPoint = ""
	local anchorPointTextToImg_ItemName_Text = ""
	local anchorPointTextToImg_ItemName_Img = ""
	local anchorPointTextToImg_ItemProg_Text = ""
	local anchorPointTextToImg_ItemProg_Img = ""

	-- Collapse Prep
	if not frameItemPrep.collapsedSections then
		frameItemPrep.collapsedSections = {}
	end
	local isCollapsedMissing = frameItemPrep.collapsedSections["Missing"] or false
	local collapseIndicatorMissing = isCollapsedMissing and "v " or "> "
	local isCollapsedCollected = frameItemPrep.collapsedSections["Collected"] or false
	local collapseIndicatorCollected = isCollapsedCollected and "v " or "> "

	-- Normal Header Creation
	local frame = frameItemPrep.scrollChild

	if not frame.headerTextLeft then
		frame.headerTextLeft = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
	end
	if not frame.headerTextRight then
		frame.headerTextRight = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
	end

	frame.headerTextLeft:SetPoint("TOPLEFT", frame, "TOPLEFT", 2, yPosition)
	frame.headerTextLeft:SetText(collapseIndicatorMissing .. "Missing Items")
	frame.headerTextLeft:SetTextColor(clrHeaderText.r, clrHeaderText.g, clrHeaderText.b)
	CreateClickableHeader(wMain, frame.headerTextLeft, "Missing")
	frame.headerTextLeft:Show()

	frame.headerTextRight:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -2, yPosition)
	frame.headerTextRight:SetText(collapseIndicatorCollected .. "Collected Items")
	frame.headerTextRight:SetTextColor(clrHeaderText.r, clrHeaderText.g, clrHeaderText.b)
	CreateClickableHeader(wMain, frame.headerTextRight, "Collected")
	frame.headerTextRight:Show()


	-- Create lines
	yPosition = yPosition - 22
	yPosLeft = yPosition
	yPosRight = yPosition

	for _, itemDetails in ipairs(itemList) do
		if itemDetails and itemDetails.id > 0 then

			local isCompleted = false

			local itemTexture = itemDetails.texture
			local itemRarity = itemDetails.rarity
			local itemName = itemDetails.name
			local reqAmount = itemDetails.requiredAmount
			totalRunningRequiredAmount = totalRunningRequiredAmount + reqAmount
			totalPlayerInventoryCount = totalPlayerInventoryCount + itemDetails.playerInvAmount
			totalPlayerBankCount = totalPlayerBankCount + itemDetails.playerBankAmount

			local totalPlayerCount = itemDetails.playerInvAmount + itemDetails.playerBankAmount

			itemTypes = itemTypes + 1
			if totalPlayerCount >= itemDetails.requiredAmount then
				isCompleted = true
				completedItemTypes = completedItemTypes + 1

				anchorPoint = "TOPRIGHT"
				anchorPointTextToImg_ItemName_Text = "TOPRIGHT"
				anchorPointTextToImg_ItemName_Img = "TOPLEFT"
				anchorPointTextToImg_ItemProg_Text = "BOTTOMRIGHT"
				anchorPointTextToImg_ItemProg_Img = "BOTTOMLEFT"

				iconSidePaddingX = -7
				xProgOffset = -1
				xTextOffset = -iconPaddingY
				yPosition = yPosRight
			else
				anchorPoint = "TOPLEFT"
				anchorPointTextToImg_ItemName_Text = "TOPLEFT"
				anchorPointTextToImg_ItemName_Img = "TOPRIGHT"
				anchorPointTextToImg_ItemProg_Text = "BOTTOMLEFT"
				anchorPointTextToImg_ItemProg_Img = "BOTTOMRIGHT"

				iconSidePaddingX = 7
				xProgOffset = 1
				xTextOffset = iconPaddingY
				yPosition = yPosLeft
			end

			local doCreateItem = (isCompleted and not isCollapsedCollected) or (not isCompleted and not isCollapsedMissing)

			if doCreateItem then
				if not itemTexture then
					itemTexture = 134400 -- inv_misc_questionmark
				end

				local icon, borderFrame, textRarityColor, itemName = CasualTBCPrep.UI.CreateItemImage(frame, iconSize, borderSize, itemDetails.id, anchorPoint, anchorPoint, iconSidePaddingX, yPosition, false)
				table.insert(frameItemPrep.content, icon)
				table.insert(frameItemPrep.content, borderFrame)

				local itemNameText = textRarityColor .. (itemName or ("Item " .. itemDetails.id))

				local progressText = ""
				local needsBank = false
				local bankTextColor = CasualTBCPrep.ColorYellow
				if itemDetails.playerInvAmount < reqAmount then
					if itemDetails.playerBankAmount > 0 then
						needsBank = true
					end
				end

				if itemDetails.playerTotalAmount >= reqAmount then
					progressText = (needsBank and CasualTBCPrep.ColorYellow or CasualTBCPrep.ColorGreen) .. math.min(itemDetails.playerTotalAmount, reqAmount) .. "/" .. reqAmount
				else
					progressText = CasualTBCPrep.ColorRed .. math.min(itemDetails.playerTotalAmount, reqAmount) .. "/" .. reqAmount
					bankTextColor = CasualTBCPrep.ColorRed
				end

				if needsBank then
					progressText = progressText .. "|r " .. bankTextColor .. "(" .. tostring(itemDetails.playerBankAmount) .. " in bank)"
				end

				-- Text, Item Name
				local textItemName = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
				textItemName:SetPoint(anchorPointTextToImg_ItemName_Text, icon, anchorPointTextToImg_ItemName_Img, xTextOffset, -1)
				textItemName:SetText(itemNameText)
				table.insert(frameItemPrep.itemTexts, textItemName)

				-- Text, Player Progress
				local textProgress = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
				textProgress:SetPoint(anchorPointTextToImg_ItemProg_Text, icon, anchorPointTextToImg_ItemProg_Img, xTextOffset + xProgOffset, 1)
				textProgress:SetText(progressText)
				table.insert(frameItemPrep.itemTexts, textProgress)

				yPosition = yPosition - iconSize - iconPaddingY

				if totalPlayerCount >= itemDetails.requiredAmount then
					yPosRight = yPosition
				else
					yPosLeft = yPosition
				end
			end
		end
	end

	if #lstQuestsReqAnyAmount > 0 then
		local yPosition = math.min(yPosLeft, yPosRight) - 15

		if not frame.headerTextReqAnyItems then
			frame.headerTextReqAnyItems = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
		end

		frame.headerTextReqAnyItems:SetPoint("TOPLEFT", frame, "TOPLEFT", 2, yPosition)
		frame.headerTextReqAnyItems:SetText("Quests requiring any of multiple items")
		frame.headerTextReqAnyItems:SetTextColor(clrHeaderText.r, clrHeaderText.g, clrHeaderText.b)
		frame.headerTextReqAnyItems:Show()

		yPosition = yPosition - 25

		local anyqImgSpacing = 8
		local anyqImgSize = 38
		local anyqImgOffsetX = anyqImgSpacing

		for _, questWrap in ipairs(lstQuestsReqAnyAmount) do
			if questWrap and questWrap.questID > 0 and questWrap.items and #questWrap.items > 0 then

				local questHeaderText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
				questHeaderText:SetPoint("TOPLEFT", frame, "TOPLEFT", 5, yPosition)
				questHeaderText:SetText(questWrap.quest.name)
				questHeaderText:SetTextColor(clrHeaderQuestAnyText.r, clrHeaderQuestAnyText.g, clrHeaderQuestAnyText.b)
				table.insert(frameItemPrep.itemTexts, questHeaderText)

				yPosition = yPosition - 18

				--{ id=itemID, name=itemName, rarity=itemRarity, texture=itemTexture, requiredAmount=neededItemCount, playerInvAmount=playerInvCount, playerBankAmount=playerBankCount, playerTotalAmount=playerTotalCount }
				for _, itemData in ipairs(questWrap.items) do
					local icon, borderFrame, textRarityColor, itemName = CasualTBCPrep.UI.CreateItemImage(frame, anyqImgSize, anyqImgSize + 3, itemData.id, "TOPLEFT", "BOTTOMLEFT", anyqImgOffsetX, yPosition, true)
					table.insert(frameItemPrep.content, icon)
					table.insert(frameItemPrep.content, borderFrame)

					local anyqItemProgText = ""
					if itemData.playerTotalAmount >= itemData.requiredAmount then
						anyqItemProgText = CasualTBCPrep.ColorGreen .. math.min(itemData.playerTotalAmount, itemData.requiredAmount) .. "/" .. itemData.requiredAmount
					else
						anyqItemProgText = CasualTBCPrep.ColorRed .. math.min(itemData.playerTotalAmount, itemData.requiredAmount) .. "/" .. itemData.requiredAmount
					end

					local anyqItemProg = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
					anyqItemProg:SetPoint("TOP", icon, "BOTTOM", 0, -1)
					anyqItemProg:SetText(anyqItemProgText)
					table.insert(frameItemPrep.itemTexts, anyqItemProg)

					anyqImgOffsetX = anyqImgOffsetX + anyqImgSize + anyqImgSpacing
				end

			end
		end
	elseif frame.headerTextReqAnyItems then
		frame.headerTextReqAnyItems:Hide()
	end

	return totalPlayerInventoryCount, totalPlayerBankCount, totalRunningRequiredAmount, itemTypes, completedItemTypes
end



---@param wMain Frame|nil
function CasualTBCPrep.WM_ItemPrep.Load(wMain)
	if wMain == nil then
		return
	end

	if frameItemPrep.itemTexts then
		for _, fontString in ipairs(frameItemPrep.itemTexts) do
			fontString:Hide()
			fontString:SetText("")
			fontString:SetSize(0, 0)
		end
	end
	if frameItemPrep.content then
		for _, borderFrame in ipairs(frameItemPrep.content) do
			borderFrame:Hide()
		end
	end
	frameItemPrep.itemTexts = {}
	frameItemPrep.content = {}


	frameItemPrep.scrollChild:SetSize(frameItemPrep.scrollFrame:GetWidth(), 1)

	local totalPlayerInventoryCount, totalPlayerBankCount, totalRunningRequiredAmount, itemTypes, completedItemTypes = LoadItemList(wMain)
	local totalPlayerCount = totalPlayerInventoryCount + totalPlayerBankCount

	if not frameItemPrep.headerText then
		frameItemPrep.headerText = frameItemPrep:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
		frameItemPrep.headerText:SetPoint("TOP", frameItemPrep, "TOP", 0, -31)
	end

	if totalPlayerCount == totalPlayerInventoryCount then
		frameItemPrep.headerText:SetText("You have all " .. totalRunningRequiredAmount .. " items!")
	else
		local hdrText = "You have collected " .. completedItemTypes .. " / " .. itemTypes .. " itemtypes"

		if itemTypes > 0 then
			if not completedItemTypes or completedItemTypes <= 0 then
				completedItemTypes = 1
			end

			local progressPercent = completedItemTypes / itemTypes * 100 or 0
			hdrText = hdrText .. string.format(" (%.1f%%)", progressPercent)
		end

		frameItemPrep.headerText:SetText(hdrText)
	end
end

---@param wMain Frame|nil
function CasualTBCPrep.WM_ItemPrep.Selected(wMain)
	if frameItemPrep == nil then
    	CasualTBCPrep.WM_ItemPrep.Create(wMain)
	end

    CasualTBCPrep.WM_ItemPrep.Load(wMain)
    CasualTBCPrep.WM_ItemPrep.Show(wMain)
end

---@param wMain Frame|nil
RefreshQuestList = function(wMain)
	CasualTBCPrep.WM_ItemPrep.Load(wMain)
end