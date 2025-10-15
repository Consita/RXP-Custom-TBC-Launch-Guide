CasualTBCPrep = CasualTBCPrep or {}
CasualTBCPrep.WM_About = CasualTBCPrep.WM_About or {}

--[Variables]
---@class Frame|nil
local frameAbout = nil;

local clrHeader = "|cff8585AA"
local clrNormal = "|cff95A8FC" -- "|cffFFFFFF"
local clrSpecial = "|cffC9BE7B"
local clrHyperlink = "|cffBBAACC"
local clrHorde = "|cffD32D1F"
local clrAlly = "|cff0070DD"
local clrConsita = "|cffA483C9"
local clrPawa = "|cff83C8C9"

local discordLink = "https://discord.gg/V6AAXKf"

---@param wMain Frame|nil
function CasualTBCPrep.WM_About.Create(wMain)
	if wMain == nil then
		return
	end

	frameAbout = CreateFrame("Frame", nil, wMain)
	frameAbout:SetAllPoints(wMain)

	frameAbout.scrollFrame = CreateFrame("ScrollFrame", nil, frameAbout, "UIPanelScrollFrameTemplate")
	frameAbout.scrollFrame:SetPoint("TOPLEFT", frameAbout, "TOPLEFT", 11, -67)
	frameAbout.scrollFrame:SetPoint("BOTTOMRIGHT", frameAbout, "BOTTOMRIGHT", -31, 17)

	frameAbout.scrollChild = CreateFrame("Frame", nil, frameAbout.scrollFrame)
	frameAbout.scrollChild:SetSize(frameAbout.scrollFrame:GetWidth(), 1)
	--wMain.tabQuestPrep.scrollChild:SetSize(450, 1)
	frameAbout.scrollFrame:SetScrollChild(frameAbout.scrollChild)

	if not frameAbout.headerText then
		frameAbout.headerText = frameAbout:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
		frameAbout.headerText:SetPoint("TOP", frameAbout, "TOP", 0, -31)
		frameAbout.headerText:SetText("About")
	end
end

function CasualTBCPrep.WM_About.Hide()
	if frameAbout ~= nil then
		frameAbout:Hide()
	end
end

---@param wMain Frame|nil
function CasualTBCPrep.WM_About.Show(wMain)
	if frameAbout == nil then
		CasualTBCPrep.WM_About.Create(wMain)
	end

	if frameAbout ~= nil then
		frameAbout:Show()
	end
end

local function CreateCopyLink(parent, text, xOffset, yPos, width)
	local linkButton = CreateFrame("Button", nil, parent)
	linkButton:SetPoint("TOPLEFT", parent, "TOPLEFT", xOffset, yPos)
	linkButton:SetSize(width, 20)

	local linkFont = frameAbout:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	linkFont:SetAllPoints(linkButton)
	linkFont:SetJustifyH("LEFT")
	linkFont:SetJustifyV("TOP")
	linkFont:SetSpacing(3)
	linkFont:SetText(clrHyperlink .. text .. "|r")

	local editBox = CreateFrame("EditBox", nil, parent, "InputBoxTemplate")
	editBox:SetPoint("TOPLEFT", parent, "TOPLEFT", xOffset + 5, yPos)
	editBox:SetSize(linkFont:GetStringWidth(), 20)
	editBox:SetAutoFocus(false)
	editBox:SetJustifyH("LEFT")
	editBox:SetJustifyV("TOP")
	editBox:SetSpacing(3)
	editBox:Hide()

	linkButton:SetScript("OnClick", function()
		linkButton:Hide()
		linkFont:Hide()
		editBox:Show()
		editBox:SetText(text)
		editBox:HighlightText()
		editBox:SetFocus()
	end)

	editBox:SetScript("OnEscapePressed", function()
		editBox:ClearFocus()
		editBox:Hide()
		linkButton:Show()
		linkFont:Show()
	end)

	editBox:SetScript("OnEditFocusLost", function()
		editBox:Hide()
		linkButton:Show()
		linkFont:Show()
	end)

	linkButton:SetScript("OnEnter", function()
		linkFont:SetTextColor(1, 1, 0.5)
	end)

	linkButton:SetScript("OnLeave", function()
		linkFont:SetTextColor(0.5, 0.5, 1)
	end)
end



---@param wMain Frame|nil
function CasualTBCPrep.WM_About.Load(wMain)
	if wMain == nil then
		return
	end

	if frameAbout.texts then
		for _, fontString in ipairs(frameAbout.texts) do
			fontString:Hide()
			fontString:SetText("")
			fontString:SetSize(0, 0)
		end
	end
	frameAbout.texts = {}

	local _, class = UnitClass("player")
	local ccR,ccG,ccB,hex = GetClassColor(class) --rgb+hex
	local playerName = "|c" .. hex .. UnitName("player") .. "|r"

	local xOffset = 9

	local msg = clrNormal .. "Created by: " .. clrSpecial .. "<Casual> " .. clrConsita .. "Consita|r & " .. clrPawa .. "Pawaox|r on Spineshatter-EU\n\n"
	msg = msg .. clrNormal .. "Currently only supports " .. clrHorde .. "HORDE|r characters\n"
	msg = msg .. clrSpecial .. "- We probably won't be adding " .. clrAlly .. "Alliance|r support :(\n\n"

	msg = msg .. clrNormal .. "Join our guild's discord to ask questions or suggest changes... or say hi\n"

	local knownIssueList = {
		"'Turn-in' guide & tab, and the 'Extras'tab,  is not yet implemented",
		"Item tab shows items for all quests, instead of only relevant ones",
		"Item tooltips on the 'Items' tab are missing",
		"Quest 'Replacements' are not handled yet (if you did a quest, but not a later quest, that can replace it)",
		"The 'Title' & 'Header' texts are not centered on all views",
		"And many more..."
	}

	local specialThanks = clrSpecial .. "Thanks to all our guildies that helped test the addon\n"
	specialThanks = specialThanks .. clrSpecial .. "And special thanks to you, " .. playerName .. ", for using our guide!\n\n"
	specialThanks = specialThanks .. clrSpecial .. "We hope you enjoy TBC as much as we will!"

	--[If you are reading this... Know that the Citizens of Dalaran will always be safe!]
	local citizens = clrNormal .. "CITIZENS OF DALARAN!\n"
	citizens = citizens .. clrSpecial .. "Raise your eyes to the skies and observe! Today our world's destruction has been averted in defiance of our very makers!\n\n"
	citizens = citizens .. clrSpecial .. "Algalon the Observer, herald of the titans, has been defeated by our brave comrades in the depths of the titan city of Ulduar.\n\n"
	citizens = citizens .. clrSpecial .. "Algalon was sent here to judge the fate of our world. He found a planet whose races had deviated from the titans' blueprints. A planet where not everything had gone according to plan.\n\n"
	citizens = citizens .. clrSpecial .. "Cold logic deemed our world not worth saving. Cold logic, however, does not account for the power of free will. It's up to each of us to prove this is a world worth saving. That our lives… our lives are worth living."
	--[Praise the defeat of Algalon!]

	local yPos = 10
	local txtIntro = frameAbout:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	txtIntro:SetPoint("TOPLEFT", frameAbout.scrollChild, "TOPLEFT", xOffset, -yPos)
	txtIntro:SetWidth(frameAbout.scrollFrame:GetWidth() - 2)
	txtIntro:SetJustifyH("LEFT")
	txtIntro:SetJustifyV("TOP")
	txtIntro:SetSpacing(3)
	txtIntro:SetText(msg)
	txtIntro:SetTextColor(1, 1, 0.9)
	table.insert(frameAbout.texts, txtIntro)
	local yPos = yPos + txtIntro:GetStringHeight() + 5

	CreateCopyLink(frameAbout.scrollChild, discordLink, xOffset, -yPos, 190)
	yPos = yPos + 35

	local txtThanksHeader = frameAbout:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
	txtThanksHeader:SetPoint("TOPLEFT", frameAbout.scrollChild, "TOPLEFT", xOffset, -yPos)
	txtThanksHeader:SetWidth(frameAbout.scrollFrame:GetWidth() - 2)
	txtThanksHeader:SetJustifyH("LEFT")
	txtThanksHeader:SetJustifyV("TOP")
	txtThanksHeader:SetSpacing(3)
	txtThanksHeader:SetText(clrHeader .. "SPECIAL THANKS")
	txtThanksHeader:SetTextColor(1, 1, 0.9)
	table.insert(frameAbout.texts, txtThanksHeader)
	yPos = yPos + txtThanksHeader:GetStringHeight() + 4

	local txtThanks = frameAbout:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	txtThanks:SetPoint("TOPLEFT", frameAbout.scrollChild, "TOPLEFT", xOffset, -yPos)
	txtThanks:SetWidth(frameAbout.scrollFrame:GetWidth() - 2)
	txtThanks:SetJustifyH("LEFT")
	txtThanks:SetJustifyV("TOP")
	txtThanks:SetSpacing(3)
	txtThanks:SetText(specialThanks)
	txtThanks:SetTextColor(1, 1, 0.9)
	table.insert(frameAbout.texts, txtThanks)
	yPos = yPos + txtThanks:GetStringHeight() + 25

	local txtKnownIssuesHeader = frameAbout:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
	txtKnownIssuesHeader:SetPoint("TOPLEFT", frameAbout.scrollChild, "TOPLEFT", xOffset, -yPos)
	txtKnownIssuesHeader:SetWidth(frameAbout.scrollFrame:GetWidth() - 2)
	txtKnownIssuesHeader:SetJustifyH("LEFT")
	txtKnownIssuesHeader:SetJustifyV("TOP")
	txtKnownIssuesHeader:SetSpacing(3)
	txtKnownIssuesHeader:SetText(clrHeader .. "KNOWN ISSUES")
	txtKnownIssuesHeader:SetTextColor(1, 1, 0.9)
	table.insert(frameAbout.texts, txtKnownIssuesHeader)
	yPos = yPos + txtKnownIssuesHeader:GetStringHeight() + 4

	for _, kIssue in ipairs(knownIssueList) do
		local txtKnownIssues = frameAbout:CreateFontString(nil, "OVERLAY", "GameFontNormal")
		txtKnownIssues:SetPoint("TOPLEFT", frameAbout.scrollChild, "TOPLEFT", xOffset + 2, -yPos)
		txtKnownIssues:SetWidth(frameAbout.scrollFrame:GetWidth() - 2)
		txtKnownIssues:SetJustifyH("LEFT")
		txtKnownIssues:SetJustifyV("TOP")
		txtKnownIssues:SetSpacing(3)
		txtKnownIssues:SetText(clrSpecial .. " > " .. kIssue .. "|r")
		txtKnownIssues:SetTextColor(1,1,1)
		table.insert(frameAbout.texts, txtKnownIssues)
		yPos = yPos + txtKnownIssues:GetStringHeight() + 3
	end



end

---@param wMain Frame|nil
function CasualTBCPrep.WM_About.Selected(wMain)
	if frameAbout == nil then
    	CasualTBCPrep.WM_About.Create(wMain)
	end

    CasualTBCPrep.WM_About.Load(wMain)
    CasualTBCPrep.WM_About.Show(wMain)
end
