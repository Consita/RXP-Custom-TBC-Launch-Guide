CasualTBCPrep.Experience = CasualTBCPrep.Experience or {}

local requiredExperience = {
    [51] = 120900,
    [52] = 126100,
    [53] = 131500,
    [54] = 137000,
    [55] = 142500,
    [56] = 148200,
    [57] = 154000,
    [58] = 159900,
    [59] = 165800,
    [60] = 172000,
    [61] = 494000,
    [62] = 574700,
    [63] = 614400,
    [64] = 650300,
    [65] = 682300,
    [66] = 710200,
    [67] = 734100,
    [68] = 753700,
    [69] = 768800,
    [70] = 779770
}

---@param questLevel number
---@param questExp number
---@param charLevel number
---@return number
function CasualTBCPrep.Experience.GetActualQuestExperienceValue(questLevel, questExp, charLevel)
    local lvlDiff = charLevel - questLevel

    -- This calc is probably accurate... probably
    if lvlDiff <= 5 then
        return questExp
    elseif lvlDiff >= 10 then
        local xp = questExp * 0.1 --10+ lvl difference is 10% xp
        return math.floor((xp + 2.5) / 5) * 5 -- Round to 5 cuz blizzard
    else
        local multi = 1 - (0.2 * (lvlDiff - 5)) -- -20% per lvl
        local xp = questExp * multi
        return math.floor((xp + 2.5) / 5) * 5 -- Round to 5 cuz blizzard
    end
end

---@param fromLevel number
---@param toLevel number
---@return number
function CasualTBCPrep.Experience.GetRequiredExperienceFor(fromLevel, toLevel)
    if fromLevel >= toLevel or fromLevel == 70 then
        return 0
    elseif fromLevel < 51 or fromLevel > 69 or toLevel < 51 or toLevel > 70 then
        return 0
    end

    local totalNeededExp = 0
    for level = fromLevel + 1, toLevel do
        totalNeededExp = totalNeededExp + (requiredExperience[level] or 0)
    end

    return totalNeededExp
end

---@param startLevel number
---@param startExp number
---@param addedExp number
---@return number, number, number
function CasualTBCPrep.Experience.GetLevelProgress(startLevel, startExp, addedExp)
    local targetLevel = startLevel
    local targetExp = startExp + addedExp

    if targetLevel >= 70 then
        return 70, 0, 0
    end

    local expNeeded = requiredExperience[targetLevel + 1]
    while expNeeded and targetExp >= expNeeded and targetLevel < 70 do
        targetLevel = targetLevel + 1
        targetExp = targetExp - expNeeded

        expNeeded = requiredExperience[targetLevel + 1]
    end

    if targetLevel >= 70 then
        return 70, 0, 0
    end

    local percentProgress = (targetExp / expNeeded) * 100
    return targetLevel, targetExp, percentProgress
end