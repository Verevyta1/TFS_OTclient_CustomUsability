
-- Define all combat effects and arrays in tables
local combats = {}



local myArray1 = {
	{1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0},
	{1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0},
	{1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0},
	{0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0},
	{0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0},
	{0, 1, 1, 1, 0, 3, 1, 1, 1, 0, 0},
	{0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0},
	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0},
	{0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0},
	{0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0}
}
local myArray2 = {
	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
	{0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0},
	{0, 0, 1, 1, 1, 1, 0, 1, 1, 0, 0},
	{0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0},
	{0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0},
	{0, 0, 1, 1, 1, 3, 1, 1, 1, 1, 0},
	{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
	{0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0},
	{0, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0},
	{0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
}

local myArray3 = {
	{0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0},
	{0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0},
	{0, 0, 0, 1, 1, 1, 0, 1, 1, 0, 0},
	{0, 0, 0, 1, 1, 1, 0, 1, 1, 0, 0},
	{0, 0, 0, 1, 1, 1, 0, 1, 1, 1, 0},
	{0, 0, 1, 1, 1, 3, 1, 1, 1, 1, 0},
	{0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 1, 1, 0, 0, 1, 1, 1},
	{0, 0, 0, 0, 0, 1, 0, 1, 1, 1, 1},
	{0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1},
	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
}
local myArray4 = {
	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
	{0, 0, 0, 1, 1, 1, 0, 1, 1, 0, 0},
	{0, 0, 0, 1, 1, 1, 0, 1, 1, 1, 1},
	{0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1},
	{0, 0, 1, 1, 1, 3, 1, 1, 1, 1, 1},
	{0, 0, 0, 1, 1, 1, 0, 1, 1, 1, 1},
	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0},
	{0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0},
	{0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0}
}


local myArray5 = {
	{0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1},
	{0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 1},
	{0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1},
	{0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0},
	{0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0},
	{0, 0, 1, 1, 0, 3, 1, 1, 0, 0, 0},
	{0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0},
	{0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0},
	{0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0},
	{0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0},
	{0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0}
}

local areas = {myArray1, myArray2, myArray3, myArray4, myArray5}


function onGetFormulaValues(player, level, magicLevel)
    local min = (magicLevel * 5.5) + 25
    local max = (magicLevel * 11) + 50
    return -min, -max
end

-- Initialize combat objects and set parameters using a loop
for i = 1, #areas do
    local combat = Combat()
    combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
    combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICETORNADO)
    local area = createCombatArea(areas[i])
    combat:setArea(area)
    combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")
    combats[i] = combat
end


local function onCastCombat(parameters, index)
    if not combats[index] then
        print("Error: Invalid combat index or combat object is nil", index)
        return
    end
    doCombat(parameters.cid, combats[index], parameters.var)
end

function onCastSpell(creature, variant)
    local parameters = {cid = creature, var = variant}
    if not combats or #combats == 0 then
        print("Error: Combat objects array 'combats' is not properly initialized or empty.")
        return false
    end

    -- Execute the first combat immediately if it exists
    if combats[1] then
        onCastCombat(parameters, 1)
    else
        print("Error: First combat object is nil")
    end

    -- Schedule the execution of subsequent combats
    for i = 2, #combats do
        if combats[i] then
            addEvent(onCastCombat, 500 * (i-1), parameters, i)
        else
            print("Error: Combat object at index is nil", i)
        end
    end

    return true
end
