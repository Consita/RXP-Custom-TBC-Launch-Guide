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

---@param fromLevel number
---@param toLevel number
function CasualTBCPrep.Experience.GetRequiredExperienceFor(fromLevel, toLevel)
    if fromLevel >= toLevel or fromLevel == 70 then
        return 0
    elseif fromLevel < 51 or fromLevel > 69 or toLevel < 51 or toLevel > 70 then
        return -1
    end

    local totalNeededExp = 0
    for level = fromLevel + 1, toLevel do
        totalNeededExp = totalNeededExp + (requiredExperience[level] or 0)
    end

    return totalNeededExp
end

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