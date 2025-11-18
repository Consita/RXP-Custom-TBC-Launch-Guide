CasualTBCPrep = CasualTBCPrep or {}
CasualTBCPrep.W_QuestManagement = CasualTBCPrep.W_QuestManagement or {}

--[Variables]
local w_window_name = "CasualTBCPrep_W_QuestManagement"
local _bankAltCheckValue = false

---@class Frame|nil
local wQuestManagement = nil;

local function Display()
	if wQuestManagement.texts then
		for _, fontString in ipairs(wQuestManagement.texts) do
			fontString:Hide()
			fontString:SetText("")
			fontString:SetSize(0, 0)
		end
	end
	if wQuestManagement.content then
		for _, borderFrame in ipairs(wQuestManagement.content) do
			borderFrame:Hide()
		end
	end
	wQuestManagement.texts = {}
	wQuestManagement.content = {}

    local selectedRoute = CasualTBCPrep.Routing.CurrentRouteCode
    local questID = wQuestManagement.currentQuestID;
    if not questID or questID <= 0 then return end
    if not selectedRoute or selectedRoute == '' then return end

    local quest = CasualTBCPrep.QuestData.GetQuest(questID)
    local isQuestCompleted = CasualTBCPrep.QuestData.HasCharacterCompletedQuest(quest.id)
	local _, _, _, questTextColorRGB = CasualTBCPrep.QuestData.GetQuestProgressionDetails(quest)
    local currentPriorityChanged = CasualTBCPrep.Settings.GetQuestPriority(selectedRoute, questID)

    local qType = string.lower(quest.type)
    -- UI elements
    local yPosition = -34

    -- Text, Item Name
    local txtQuestName = wQuestManagement:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    txtQuestName:SetPoint("TOP", wQuestManagement, "TOP", 0, yPosition)
    txtQuestName:SetText(quest.name)
    table.insert(wQuestManagement.texts, txtQuestName)
    yPosition = yPosition - 21
    CasualTBCPrep.UI.SetQuestTextColor(txtQuestName, quest, questTextColorRGB.r,questTextColorRGB.g,questTextColorRGB.b)

    if isQuestCompleted == false and (qType == "qlog" or qType == "opt" or qType == "optional") then
        local qTypText = ""
        if "qlog" == qType then
            qTypText = "Questlog Quest"
        elseif "opt" == qType or "optional" == qType then
            qTypText = "Optional Quest"
        end
        local btn = CreateFrame("Button", nil, wQuestManagement, "UIPanelButtonTemplate")
        btn:SetSize(170, 25)
        btn:SetPoint("TOP", wQuestManagement, "TOP", 0, yPosition)
        btn:SetNormalFontObject("GameFontNormal")

        local function funcUpdateButton()
            if qType == "qlog" then
                if currentPriorityChanged == true then
                    btn:SetText("Set Questlog Again")
                else
                    btn:SetText("Remove from Questlog")
                end
            else --optional
                if currentPriorityChanged == true then
                    btn:SetText("Set Optional Again")
                else
                    btn:SetText("Set as Questlog Quest")
                end
            end
        end
        btn:SetScript("OnClick", function()
            if currentPriorityChanged == true then
                currentPriorityChanged = nil
            else
                currentPriorityChanged = true
            end

            CasualTBCPrep.Settings.SetQuestPriority(selectedRoute, questID, currentPriorityChanged)

            funcUpdateButton()
            CasualTBCPrep.W_Main.ReloadActiveTab()
        end)

        -- Tooltip
        local btnTooltip = ""
        if "qlog" == qType then
            btnTooltip =  "Click to toggle questlog priority for this character"
        else
            btnTooltip =  "Click to toggle optional quest priority for this character"
        end

        CasualTBCPrep.UI.HookTooltip(btn, "Quest State", { btnTooltip }, nil,nil,nil)

        funcUpdateButton()
        table.insert(wQuestManagement.content, btn)

        local txtQuestType = wQuestManagement:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        txtQuestType:SetPoint("TOP", btn, "BOTTOM", 0, -5)
        txtQuestType:SetText(CasualTBCPrep.ColorTooltipStandOut..qTypText)
        table.insert(wQuestManagement.texts, txtQuestType)
        CasualTBCPrep.UI.HookTooltip(txtQuestType, "Quest Type", { "This is the default type for this quest, on your current route" }, nil,nil,nil)
    end
end

--@param type string|nil
local function Create()
	wQuestManagement = CreateFrame("Frame", w_window_name, UIParent, "BasicFrameTemplateWithInset")
	wQuestManagement:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
	wQuestManagement:EnableMouse(true)
	wQuestManagement:SetMovable(true)
	wQuestManagement:RegisterForDrag("LeftButton")
	wQuestManagement:SetScript("OnDragStart", function(self) self:StartMoving() end)
	wQuestManagement:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)

	-- Place in the front above other UI/addons
	wQuestManagement:SetFrameStrata("FULLSCREEN_DIALOG")
	wQuestManagement:SetFrameLevel(1001)
	table.insert(UISpecialFrames, w_window_name)

	--[Title]
	wQuestManagement.TitleBg:SetHeight(30);
	wQuestManagement.title = wQuestManagement:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	wQuestManagement.title:SetPoint("LEFT", wQuestManagement.TitleBg, "LEFT", 8, 6)

	--[QoL]
	wQuestManagement:SetScript("OnShow", function() CasualTBCPrep.Sounds.PlaySound_Click() end)
	wQuestManagement:SetScript("OnHide", function() CasualTBCPrep.Sounds.PlaySound_Click() end)
	wQuestManagement:Hide();
	wQuestManagement:Show();
end

function CasualTBCPrep.W_QuestManagement.Show(questID)
	if wQuestManagement == nil then

		Create()
		if wQuestManagement == nil then
			return
		end
	end

    wQuestManagement.currentQuestID = questID

	wQuestManagement:SetSize(310, 140)
	wQuestManagement.title:SetText("TBCPrep - Quest Settings")

    Display()
	if not wQuestManagement:IsShown() then
		wQuestManagement:Show()
	end
end