CasualTBCPrep = CasualTBCPrep or {}
CasualTBCPrep.Extras_Flights = CasualTBCPrep.Extras_Flights or {}

local elements = {}

function CasualTBCPrep.Extras_Flights.Clean(parent)
    if parent == nil or elements == nil or #elements == 0 then return end

    for _, ele in ipairs(elements) do
        ele:Hide()
    end

    elements = {}
end
---@param parent Frame
function CasualTBCPrep.Extras_Flights.Create(parent)
    if parent == nil then return end
    CasualTBCPrep.Extras_Flights.Clean(parent)


end