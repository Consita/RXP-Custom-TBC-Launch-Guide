CasualTBCPrep = CasualTBCPrep or {}
CasualTBCPrep.W_ItemManagement = CasualTBCPrep.W_ItemManagement or {}

--[Variables]
local w_window_name = "CasualTBCPrep_W_ItemManagement"
local _bankAltCheckValue = false

---@class Frame|nil
local wItemManagement = nil;

local function Display()
	if wItemManagement.texts then
		for _, fontString in ipairs(wItemManagement.texts) do
			fontString:Hide()
			fontString:SetText("")
			fontString:SetSize(0, 0)
		end
	end
	if wItemManagement.content then
		for _, borderFrame in ipairs(wItemManagement.content) do
			borderFrame:Hide()
		end
	end
	wItemManagement.texts = {}
	wItemManagement.content = {}

    local item = wItemManagement.currentItem;
    if not item then return end
    local itemID = item.id
    if not item or item.id <= 0 then return end

	local itemStates = CasualTBCPrep.Settings.GetCharSetting(CasualTBCPrep.Settings.ItemStates)
    local itemState = itemStates[item.id]

    local isBankAlted = false
    if itemState then isBankAlted = itemState.isBankAlted or false end
    _bankAltCheckValue = isBankAlted

    local playerInvCount = C_Item.GetItemCount(itemID, false)
    local playerTotalCount = C_Item.GetItemCount(itemID, true)
    local playerBankCount = playerTotalCount - playerInvCount

    -- UI elements
    local yPosition = -49


	local iconSize = 38
	local iconPaddingY = 2
	local borderSize = iconSize + 2
    local icon, borderFrame, textRarityColor, item = CasualTBCPrep.UI.CreateItemImage(wItemManagement, iconSize, borderSize, item.id, "TOP", "TOP", 0, yPosition)
    local itemName = ""
    if item then
        local r,g,b,cHex = CasualTBCPrep.GetRarityColor(item.rarity)
        itemName = cHex..item.name.."|r"
    end

    table.insert(wItemManagement.content, icon)
    table.insert(wItemManagement.content, borderFrame)

    local itemNameText = textRarityColor .. (itemName or ("Item " .. item.id))

    -- Text, Item Name
    local textItemName = wItemManagement:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    textItemName:SetPoint("BOTTOM", icon, "TOP", 0, 3)
    textItemName:SetText(itemNameText)
    table.insert(wItemManagement.texts, textItemName)

    -- BankAlt Checkbox
    yPosition = yPosition - iconSize - 2 - 3
    local checkBoxTooltipWidth = 24

    local checkbox = CreateFrame("CheckButton", nil, wItemManagement, "UICheckButtonTemplate")
    checkbox:SetPoint("TOPLEFT", wItemManagement, "TOPLEFT", 6, yPosition)
    checkbox:SetSize(checkBoxTooltipWidth, checkBoxTooltipWidth)

    local chbLabel = checkbox:CreateFontString(nil, "OVERLAY", "GameTooltipTextSmall")
    chbLabel:SetPoint("LEFT", checkbox, "RIGHT", 0, 0)
    chbLabel:SetText("Mark item as collected on an alt")

    checkbox:SetChecked(_bankAltCheckValue)
    checkbox:SetScript("OnClick", function(self)
        _bankAltCheckValue = self:GetChecked()

	    local eItemStates = CasualTBCPrep.Settings.GetCharSetting(CasualTBCPrep.Settings.ItemStates)
        local eState = eItemStates[item.id]
        if not eState then eState={id=item.id} end

        eState.isBankAlted = _bankAltCheckValue
        eItemStates[item.id] = eState
        CasualTBCPrep.NotifyUser("Stored Item State BankAlt value: "..tostring(eState.isBankAlted))
        CasualTBCPrep.Settings.SetCharSetting(itemState.id, itemState)
    end)

    local ttLines = { "When checked, this item will always be considered collected for this specific character." }
    CasualTBCPrep.UI.HookTooltip(checkbox, "Alt Storage", ttLines , nil)
    CasualTBCPrep.UI.HookTooltip(chbLabel, "Alt Storage", ttLines , nil)

    table.insert(wItemManagement.texts, chbLabel)
    table.insert(wItemManagement.chbRelevant, checkbox)
end

--@param type string|nil
local function Create()
	wItemManagement = CreateFrame("Frame", w_window_name, UIParent, "BasicFrameTemplateWithInset")
	wItemManagement:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
	wItemManagement:EnableMouse(true)
	wItemManagement:SetMovable(true)
	wItemManagement:RegisterForDrag("LeftButton")
	wItemManagement:SetScript("OnDragStart", function(self) self:StartMoving() end)
	wItemManagement:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)

	-- Place in the front above other UI/addons
	wItemManagement:SetFrameStrata("FULLSCREEN_DIALOG")
	wItemManagement:SetFrameLevel(1000)
	table.insert(UISpecialFrames, w_window_name)

	--[Title]
	wItemManagement.TitleBg:SetHeight(30);
	wItemManagement.title = wItemManagement:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	wItemManagement.title:SetPoint("LEFT", wItemManagement.TitleBg, "LEFT", 8, 6)

	--[QoL]
	wItemManagement:SetScript("OnShow", function() CasualTBCPrep.Sounds.PlaySound_Click() end)
	wItemManagement:SetScript("OnHide", function() CasualTBCPrep.Sounds.PlaySound_Click() end)
	wItemManagement:Hide();
	wItemManagement:Show();
end

function CasualTBCPrep.W_ItemManagement.Show(itemID)
    CasualTBCPrep.NotifyUser("A")
	if wItemManagement == nil then

		Create()
		if wItemManagement == nil then
			return
		end
	end
    CasualTBCPrep.NotifyUser("B")

    wItemManagement.currentItem = CasualTBCPrep.Items.GetItemDetails(itemID)

	wItemManagement:SetSize(275, 200)
	wItemManagement.title:SetText("TBCPrep - Item Settings")

    CasualTBCPrep.NotifyUser("C")
    Display()
    CasualTBCPrep.NotifyUser("D")
	if not wItemManagement:IsShown() then
    CasualTBCPrep.NotifyUser("E")
		wItemManagement:Show()
	end
    CasualTBCPrep.NotifyUser("F")
end