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
	
	local settingsText = frameExtras:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	settingsText:SetPoint("CENTER", frameExtras, "CENTER", 0, 0)
	settingsText:SetText("Work in Progress")
end

---@param wMain Frame|nil
function CasualTBCPrep.WM_Extras.Selected(wMain)
	if frameExtras == nil then
    	CasualTBCPrep.WM_Extras.Create(wMain)
	end

    CasualTBCPrep.WM_Extras.Load(wMain)
    CasualTBCPrep.WM_Extras.Show(wMain)
end