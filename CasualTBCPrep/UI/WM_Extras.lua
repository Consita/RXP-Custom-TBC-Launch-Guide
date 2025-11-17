CasualTBCPrep = CasualTBCPrep or {}
CasualTBCPrep.WM_Extras = CasualTBCPrep.WM_Extras or {}

--[Variables]
---@class Frame|nil
local frameExtras = nil;

---@param wMain Frame|nil
function CasualTBCPrep.WM_Extras.Create(wMain)
	if wMain == nil then
		return
	end

	frameExtras = CreateFrame("Frame", nil, wMain)
	frameExtras:SetAllPoints(wMain)

	frameExtras:Hide()
end

function CasualTBCPrep.WM_Extras.Hide()
	if frameExtras ~= nil then
		frameExtras:Hide()
	end
end

---@param wMain Frame|nil
function CasualTBCPrep.WM_Extras.Show(wMain)
	if frameExtras == nil then
		CasualTBCPrep.WM_Extras.Create(wMain)
	end

	if frameExtras ~= nil then
		frameExtras:Show()
	end
end

---@param wMain Frame|nil
local function CreateTab(wMain)
	if wMain == nil then return end

	local basePath = "Interface\\AddOns\\" .. CasualTBCPrep.AddonNameInternal .. "\\Resources\\Images\\Extras\\"
	local w = wMain:GetSizeWidth()
	local h = wMain:GetSizeHeight()
	local imgW,imgH = 36,36

	local headerCount = 4
	local header1Offset = (w * (1 / headerCount + 1)) - (imgW / 2)
	local header2Offset = (w * (2 / headerCount + 1)) - (imgW / 2)
	local header3Offset = (w * (3 / headerCount + 1)) - (imgW / 2)
	local header4Offset = (w * (4 / headerCount + 1)) - (imgW / 2)

	CasualTBCPrep.NotifyUser("W="..tostring(w)..", H="..tostring(h))
	CasualTBCPrep.NotifyUser("1="..tostring(header1Offset)..", 2="..tostring(header2Offset)..", 3="..tostring(header3Offset)..", 4="..tostring(header4Offset))

	local headerTbcPrep = frameExtras:CreateTexture(nil, "BORDER")
	headerTbcPrep:SetPoint("TOPLEFT", frameExtras, "TOPLEFT", header1Offset, -30)
	headerTbcPrep:SetWidth(imgW)
	headerTbcPrep:SetHeight(imgH)
	headerTbcPrep:SetTexture(basePath .. "header_prep")

	local headerFlights = frameExtras:CreateTexture(nil, "BORDER")
	headerFlights:SetPoint("TOPLEFT", frameExtras, "TOPLEFT", header2Offset, -30)
	headerFlights:SetWidth(imgW)
	headerFlights:SetHeight(imgH)
	headerFlights:SetTexture(basePath .. "header_flights")
	
	local headerItems = frameExtras:CreateTexture(nil, "BORDER")
	headerItems:SetPoint("TOPLEFT", frameExtras, "TOPLEFT", header3Offset, -30)
	headerItems:SetWidth(imgW)
	headerItems:SetHeight(imgH)
	headerItems:SetTexture(basePath .. "header_items")
	
	local headerProfs = frameExtras:CreateTexture(nil, "BORDER")
	headerProfs:SetPoint("TOPLEFT", frameExtras, "TOPLEFT", header4Offset, -30)
	headerProfs:SetWidth(imgW)
	headerProfs:SetHeight(imgH)
	headerProfs:SetTexture(basePath .. "header_prof")
end

---@param wMain Frame|nil
function CasualTBCPrep.WM_Extras.Load(wMain)
	if wMain == nil then
		return
	end
	local selectedRoute = CasualTBCPrep.Settings.GetCharSetting(CasualTBCPrep.Settings.SelectedRoute)
	if selectedRoute == nil or selectedRoute == "" then
		CasualTBCPrep.UI.CreateRouteSelection(wMain, frameExtras)
		return
	end
	CasualTBCPrep.UI.ClearRouteSelectionUI(frameExtras)

	-- WIP, Don't show yet
	local settingsText = frameExtras:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	settingsText:SetPoint("CENTER", frameExtras, "CENTER", 0, 0)
	settingsText:SetText("Work in Progress")
	--CreateTab(wMain)
end

---@param wMain Frame|nil
function CasualTBCPrep.WM_Extras.Selected(wMain)
	if frameExtras == nil then
    	CasualTBCPrep.WM_Extras.Create(wMain)
	end

    CasualTBCPrep.WM_Extras.Load(wMain)
    CasualTBCPrep.WM_Extras.Show(wMain)
end