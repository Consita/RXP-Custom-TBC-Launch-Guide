CasualTBCPrep.Faction = CasualTBCPrep.Faction or {}

function CasualTBCPrep.Faction.GetPlayerFactionID()
    local facID = 0

    local factionName = UnitFactionGroup("player")
    if "Horde" == factionName then
        facID = 1
    elseif "Alliance" == factionName then
        facID = 2
    else
        CasualTBCPrep.NotifyUserError("Unknown faction: "..factionName..", using NEUTRAL(0) instead")
    end
    return facID, factionName
end