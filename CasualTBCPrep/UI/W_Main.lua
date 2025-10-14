CasualTBCPrep = CasualTBCPrep or {}
CasualTBCPrep.W_Main = CasualTBCPrep.W_Main or {}

--[Variables]
local w_main_name = "CasualTBCPrep_W_Main"
---@class Frame|nil
local wMain = nil
local lastTabID = 0

function CasualTBCPrep.W_Main.ShowTab(tabID)
	if wMain == nil then
		return
	end

    if lastTabID == 1 then
        CasualTBCPrep.WM_QuestLogPrep.Hide()
	elseif lastTabID == 2 then
        CasualTBCPrep.WM_QuestPrep.Hide()
	elseif lastTabID == 3 then
        CasualTBCPrep.WM_ItemPrep.Hide()
	elseif lastTabID == 4 then
        CasualTBCPrep.WM_TurnIn.Hide()
	elseif lastTabID == 5 then
        CasualTBCPrep.WM_Extras.Hide()
	elseif lastTabID == 6 then
        CasualTBCPrep.WM_Settings.Hide()
	elseif lastTabID == 7 then
        CasualTBCPrep.WM_About.Hide()
    end

	if tabID == 1 then
        CasualTBCPrep.WM_QuestLogPrep.Selected(wMain)
	elseif tabID == 2 then
        CasualTBCPrep.WM_QuestPrep.Selected(wMain)
	elseif tabID == 3 then
        CasualTBCPrep.WM_ItemPrep.Selected(wMain)
	elseif tabID == 4 then
        CasualTBCPrep.WM_TurnIn.Selected(wMain)
	elseif tabID == 5 then
        CasualTBCPrep.WM_Extras.Selected(wMain)
	elseif tabID == 6 then
        CasualTBCPrep.WM_Settings.Selected(wMain)
	elseif tabID == 7 then
        CasualTBCPrep.WM_About.Selected(wMain)
	end
    lastTabID = tabID
	CasualTBCPrep.Sounds:PlaySound_Click()
end

local function CreateTabs()
	if wMain == nil then
		return
	end
	local tabs = {}
	-- Tab 1: Quest Prep
	tabs[1] = CreateFrame("Button", "$parentTab1", wMain, "CharacterFrameTabButtonTemplate")
	tabs[1]:SetID(1)
	tabs[1]:SetText("Questlog")
	tabs[1]:SetPoint("TOPLEFT", wMain, "BOTTOMLEFT", 12, 7)
	
	-- Tab 2: All Quests
	tabs[2] = CreateFrame("Button", "$parentTab2", wMain, "CharacterFrameTabButtonTemplate")
	tabs[2]:SetID(2)
	tabs[2]:SetText("Quests")
	tabs[2]:SetPoint("LEFT", tabs[1], "RIGHT", -15, 0)

	-- Tab 3: Item Prep
	tabs[3] = CreateFrame("Button", "$parentTab3", wMain, "CharacterFrameTabButtonTemplate")
	tabs[3]:SetID(3)
	tabs[3]:SetText("Items")
	tabs[3]:SetPoint("LEFT", tabs[2], "RIGHT", -15, 0)
	
	-- Tab 4: Turn-in
	tabs[4] = CreateFrame("Button", "$parentTab4", wMain, "CharacterFrameTabButtonTemplate")
	tabs[4]:SetID(4)
	tabs[4]:SetText("Turn-in")
	tabs[4]:SetPoint("LEFT", tabs[3], "RIGHT", -15, 0)
	
	-- Tab 5: Extras
	tabs[5] = CreateFrame("Button", "$parentTab5", wMain, "CharacterFrameTabButtonTemplate")
	tabs[5]:SetID(5)
	tabs[5]:SetText("Extras")
	tabs[5]:SetPoint("LEFT", tabs[4], "RIGHT", -15, 0)

	-- Tab 6: Settings
	tabs[6] = CreateFrame("Button", "$parentTab6", wMain, "CharacterFrameTabButtonTemplate")
	tabs[6]:SetID(6)
	tabs[6]:SetText("Settings")
	tabs[6]:SetPoint("LEFT", tabs[5], "RIGHT", -15, 0)

	-- Tab 7: About
	tabs[7] = CreateFrame("Button", "$parentTab7", wMain, "CharacterFrameTabButtonTemplate")
	tabs[7]:SetID(7)
	tabs[7]:SetText("About")
	tabs[7]:SetPoint("LEFT", tabs[6], "RIGHT", -15, 0)

	for i, tab in ipairs(tabs) do
		tab:SetScript("OnClick", function(self)
			PanelTemplates_SetTab(wMain, self:GetID())
			CasualTBCPrep.W_Main.ShowTab(self:GetID())
		end)
	end

	wMain.tabs = tabs
	PanelTemplates_SetNumTabs(wMain, #tabs)
	PanelTemplates_SetTab(wMain, 1)

	return tabs
end

local function Create()
	--[Basic Window]
	local w = 500
	local h = 505

	wMain = CreateFrame("Frame", w_main_name, UIParent, "PortraitFrameTemplate")
	wMain:SetSize(w, h);
	wMain:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
	wMain:EnableMouse(true)
	wMain:SetMovable(true)
	wMain:RegisterForDrag("LeftButton")
	wMain:SetScript("OnDragStart", function(self) self:StartMoving() end)
	wMain:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)
	
	wMain:SetFrameStrata("FULLSCREEN_DIALOG")
	wMain:SetFrameLevel(500)

	wMain.GetSizeWidth = function()
		return w
	end
	wMain.GetSizeHeight = function()
		return h
	end
	
	table.insert(UISpecialFrames, w_main_name)
	
	--[Inset]
	wMain.Inset = CreateFrame("Frame", nil, wMain, "InsetFrameTemplate")
	wMain.Inset:SetPoint("TOPLEFT", wMain, "TOPLEFT", 4, -55)
	wMain.Inset:SetPoint("BOTTOMRIGHT", wMain, "BOTTOMRIGHT", -4, 4)

	--[Title]
	wMain.TitleBg:SetHeight(20);
	wMain.title = wMain:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	wMain.title:SetPoint("CENTER", wMain.TitleBg, "CENTER", 0, 1)
	wMain.title:SetText("TBC Preparation")

	--[Portrait]
	SetPortraitToTexture(wMain.portrait, "255348") -- The Dark Portal
	
	--[Tabs]
	CreateTabs()
	CasualTBCPrep.W_Main.ShowTab(1);

	--[QoL]
	wMain:SetScript("OnShow", function() CasualTBCPrep.Sounds:PlaySound_Click() end)
	wMain:SetScript("OnHide", function() CasualTBCPrep.Sounds:PlaySound_Click() end)
	wMain:Hide();
	wMain:Show();
end

function CasualTBCPrep.W_Main.Show()
	if wMain == nil then
		Create()
	elseif not wMain:IsShown() then
		wMain:Show()
	end
end

function CasualTBCPrep.W_Main.Hide()
	if wMain ~= nil and wMain:IsShown() then
		CasualTBCPrep.W_Main.Show()
	end
end

function CasualTBCPrep.W_Main.Toggle()
	if wMain == nil then
		Create()
	else
		if wMain:IsShown() then
			CasualTBCPrep.W_Main.Hide()
		else
			CasualTBCPrep.W_Main.Show()
		end
	end
end