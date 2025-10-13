CasualTBCPrep = CasualTBCPrep or {}
CasualTBCPrep.W_WarningNotice = CasualTBCPrep.W_WarningNotice or {}

--[Variables]
local mainText_qlog = "This quest is used for TBC Quest Preparation!\nBe careful not to turn it in, it should be in your questlog on release.\n\nTo turn off this warning, disable \"Questlog Warnings\"\nin the /tbcprep settings."
local mainText_turnin = "This quest is turned in during TBC Release, this quest should NOT be in your questlog until release.\n\nTo turn off this warning, disable \"Quest Turnin Warnings\"\nin the /tbcprep settings."
local mainText_completing  = "You just tried to complete a quest used on TBC Release for EXP!\nThis is currently being blocked!\n\nTo turn off this warning, disable \"Quest Completion Warnings\"\nin the /tbcprep settings."

local w_window_name = "CasualTBCPrep_W_WarningNotice"
---@class Frame|nil
local wAcceptQuestWarning = nil;

--@param type string|nil
local function Create(type)
	wAcceptQuestWarning = CreateFrame("Frame", w_window_name, UIParent, "BasicFrameTemplateWithInset")
	wAcceptQuestWarning:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
	wAcceptQuestWarning:EnableMouse(true)
	wAcceptQuestWarning:SetMovable(true)
	wAcceptQuestWarning:RegisterForDrag("LeftButton")
	wAcceptQuestWarning:SetScript("OnDragStart", function(self) self:StartMoving() end)
	wAcceptQuestWarning:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)

	-- Place in the front above other UI/addons
	wAcceptQuestWarning:SetFrameStrata("FULLSCREEN_DIALOG")
	wAcceptQuestWarning:SetFrameLevel(1000)
	table.insert(UISpecialFrames, w_window_name)

	--[Title]
	wAcceptQuestWarning.TitleBg:SetHeight(30);
	wAcceptQuestWarning.title = wAcceptQuestWarning:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	wAcceptQuestWarning.title:SetPoint("LEFT", wAcceptQuestWarning.TitleBg, "LEFT", 8, 6)

	--[Warning]
	wAcceptQuestWarning.warningText = wAcceptQuestWarning:CreateFontString(nil, "OVERLAY", "GameFontNormalHuge")
	wAcceptQuestWarning.warningText:SetPoint("TOP", wAcceptQuestWarning, "TOP", 0, -40)
	wAcceptQuestWarning.warningText:SetWidth(450)

	wAcceptQuestWarning.warningText:SetJustifyH("CENTER")
	wAcceptQuestWarning.warningText:SetWordWrap(true)

	wAcceptQuestWarning.questNameText = wAcceptQuestWarning:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
	wAcceptQuestWarning.questNameText:SetPoint("TOP", wAcceptQuestWarning.warningText, "BOTTOM", 0, -20)
	wAcceptQuestWarning.questNameText:SetWidth(450)
	wAcceptQuestWarning.questNameText:SetTextColor(1, 0.82, 0)
	wAcceptQuestWarning.questNameText:SetJustifyH("CENTER")
	wAcceptQuestWarning.questNameText:SetWordWrap(true)

	wAcceptQuestWarning.detailText = wAcceptQuestWarning:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	wAcceptQuestWarning.detailText:SetPoint("TOP", wAcceptQuestWarning.questNameText, "BOTTOM", 0, -20)
	wAcceptQuestWarning.detailText:SetWidth(450)
	wAcceptQuestWarning.detailText:SetTextColor(1, 1, 1)
	wAcceptQuestWarning.detailText:SetJustifyH("CENTER")
	wAcceptQuestWarning.detailText:SetWordWrap(true)

	--[Abandon Button]
	wAcceptQuestWarning.abandonButton = CreateFrame("Button", nil, wAcceptQuestWarning, "UIPanelButtonTemplate")
	wAcceptQuestWarning.abandonButton:SetSize(120, 30)
	wAcceptQuestWarning.abandonButton:SetPoint("BOTTOM", wAcceptQuestWarning, "BOTTOM", 0, 20)
	wAcceptQuestWarning.abandonButton:SetText("Abandon")

	wAcceptQuestWarning.abandonButton:SetScript("OnClick", function()
		if wAcceptQuestWarning.currentQuestLogEntryID ~= nil and  wAcceptQuestWarning.currentQuestLogEntryID > 0 then
			SelectQuestLogEntry(wAcceptQuestWarning.currentQuestLogEntryID)
			SetAbandonQuest()
			AbandonQuest()
			CasualTBCPrep.NotifyUser("Abandoned quest: " .. wAcceptQuestWarning.currentQuestName)
		end
		wAcceptQuestWarning:Hide()
	end)

	wAcceptQuestWarning.abandonButton:Hide()

	--[QoL]
	wAcceptQuestWarning:SetScript("OnShow", function() PlaySound(8959) end)
	wAcceptQuestWarning:SetScript("OnHide", function() PlaySound(808) end)
	wAcceptQuestWarning:Hide();
	wAcceptQuestWarning:Show();
end

local function UpdateElementsFromType(type)
	local title = ""
	local isDangerous = false
	local showAbandonButton = false
	local width = 450
	local height = 240

	local headerText = ""
	local messageText = ""

	if type == "qlog" then
		title = "Questlog Warning - Quest Accepted"
		headerText = "WARNING!"
		messageText = mainText_qlog
		width = 440
		height = 205
	elseif type == "turnin" then
		title = "Turnin Warning - Quest Accepted"
		headerText = "Warning"
		messageText = mainText_turnin
		width = 470
		height = 210
		isDangerous = true
		showAbandonButton = true
	elseif type == "completing" then
		title = "Quest Completion Warning"
		headerText = "STOP!"
		messageText = mainText_completing
		width = 420
		height = 200
		isDangerous = true
	end

	wAcceptQuestWarning:SetSize(width, height)
	wAcceptQuestWarning.title:SetText(title)

	if isDangerous then 
		wAcceptQuestWarning.warningText:SetTextColor(1, 0, 0)
	else
		wAcceptQuestWarning.warningText:SetTextColor(0.86, 0.623, 0.1529) -- Orange'ish
	end

	if showAbandonButton and wAcceptQuestWarning.currentQuestLogEntryID ~= nil and  wAcceptQuestWarning.currentQuestLogEntryID > 0 then
		wAcceptQuestWarning.abandonButton:Show()
	else
		wAcceptQuestWarning.abandonButton:Hide()
	end

	wAcceptQuestWarning.warningText:SetText(headerText)
	wAcceptQuestWarning.detailText:SetText(messageText)
end

function CasualTBCPrep.W_WarningNotice.Show(questID, questName, qLogEntry, type)
	if wAcceptQuestWarning == nil then

		Create(type)
		if wAcceptQuestWarning == nil then
			return
		end
	end

	wAcceptQuestWarning.currentQuestLogEntryID = qLogEntry;
	wAcceptQuestWarning.currentQuestName = questName;

	wAcceptQuestWarning.questNameText:SetText(questName)
	UpdateElementsFromType(type)

	if not wAcceptQuestWarning:IsShown() then
		wAcceptQuestWarning:Show()
	end
end