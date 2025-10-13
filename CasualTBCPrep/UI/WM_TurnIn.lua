CasualTBCPrep = CasualTBCPrep or {}
CasualTBCPrep.WM_TurnIn = CasualTBCPrep.WM_TurnIn or {}

--[Variables]
---@class Frame|nil
local frameTurnIn = nil;

---@param wMain frame|nil
function CasualTBCPrep.WM_TurnIn.Create(wMain)
	if wMain == nil then
		return
	end

	frameTurnIn = CreateFrame("Frame", nil, wMain)
	frameTurnIn:SetAllPoints(wMain)
			
	local settingsText = frameTurnIn:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	settingsText:SetPoint("CENTER")
	settingsText:SetText("Work in Progress")

	frameTurnIn:Hide()
end

function CasualTBCPrep.WM_TurnIn.Hide()
	if frameTurnIn ~= nil then
		frameTurnIn:Hide()
	end
end

---@param wMain frame|nil
function CasualTBCPrep.WM_TurnIn.Show(wMain)
	if frameTurnIn == nil then
		CasualTBCPrep.WM_TurnIn.Create(wMain)
	end

	if frameTurnIn ~= nil then
		frameTurnIn:Show()
	end
end

---@param wMain frame|nil
function CasualTBCPrep.WM_TurnIn.Load(wMain)
	if wMain == nil then
		return
	end
end

---@param wMain frame|nil
function CasualTBCPrep.WM_TurnIn.Selected(wMain)
	if frameTurnIn == nil then
    	CasualTBCPrep.WM_TurnIn.Create(wMain)
	end
	
    CasualTBCPrep.WM_TurnIn.Load(wMain)
    CasualTBCPrep.WM_TurnIn.Show(wMain)
end