CasualTBCPrep = CasualTBCPrep or {}
CasualTBCPrep.WM_Extras = CasualTBCPrep.WM_Extras or {}

--[Variables]
---@class Frame|nil
local frameHelp = nil;

---@param wMain Frame|nil
function CasualTBCPrep.WM_Extras.Create(wMain)
	if wMain == nil then
		return
	end

	frameHelp = CreateFrame("Frame", nil, wMain)
	frameHelp:SetAllPoints(wMain)
			
	local settingsText = frameHelp:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	settingsText:SetPoint("CENTER", frameHelp, "CENTER", 0, 0)
	settingsText:SetText("Work in Progress")

	frameHelp:Hide()
end

function CasualTBCPrep.WM_Extras.Hide()
	if frameHelp ~= nil then
		frameHelp:Hide()
	end
end

---@param wMain Frame|nil
function CasualTBCPrep.WM_Extras.Show(wMain)
	if frameHelp == nil then
		CasualTBCPrep.WM_Extras.Create(wMain)
	end

	if frameHelp ~= nil then
		frameHelp:Show()
	end
end

---@param wMain Frame|nil
function CasualTBCPrep.WM_Extras.Load(wMain)
	if wMain == nil then
		return
	end
end

---@param wMain Frame|nil
function CasualTBCPrep.WM_Extras.Selected(wMain)
	if frameHelp == nil then
    	CasualTBCPrep.WM_Extras.Create(wMain)
	end
	
    CasualTBCPrep.WM_Extras.Load(wMain)
    CasualTBCPrep.WM_Extras.Show(wMain)
end