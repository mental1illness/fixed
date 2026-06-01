-- Script Path: game:GetChildren()[117].Shared.Raycast
-- Took 0.01s to decompile.
-- Executor: Potassium (v2.2.1)

local v1 = game:GetService("ReplicatedStorage")
local u2 = game:GetService("Workspace")
game:GetService("Debris")
local u3 = require(v1:WaitForChild("Packages"):WaitForChild("Sift"))
local u4 = table.freeze({
    ["Sandy Brick"] = 0.25,
    ["IndoorWall"] = 0.25
})
local u5 = table.freeze({
    [Enum.Material.Asphalt] = 0.25,
    [Enum.Material.Basalt] = 0.25,
    [Enum.Material.Brick] = 0.25,
    [Enum.Material.Cobblestone] = 0.25,
    [Enum.Material.Concrete] = 0.25,
    [Enum.Material.CrackedLava] = 0.25,
    [Enum.Material.DiamondPlate] = 0.25,
    [Enum.Material.Foil] = 0.25,
    [Enum.Material.Glacier] = 0.25,
    [Enum.Material.Granite] = 0.25,
    [Enum.Material.Grass] = 0.25,
    [Enum.Material.Ground] = 0.25,
    [Enum.Material.Ice] = 0.25,
    [Enum.Material.LeafyGrass] = 0.25,
    [Enum.Material.Limestone] = 0.25,
    [Enum.Material.Marble] = 0.25,
    [Enum.Material.Metal] = 0.25,
    [Enum.Material.Mud] = 0.25,
    [Enum.Material.Pavement] = 0.25,
    [Enum.Material.Rock] = 0.25,
    [Enum.Material.Salt] = 0.25,
    [Enum.Material.Sand] = 0.25,
    [Enum.Material.Sandstone] = 0.25,
    [Enum.Material.Slate] = 0.25,
    [Enum.Material.Snow] = 0.25,
    [Enum.Material.ForceField] = 0.25,
    [Enum.Material.Neon] = 0.25,
    [Enum.Material.CorrodedMetal] = 0.25,
    [Enum.Material.Pebble] = 0.25,
    [Enum.Material.CeramicTiles] = 0.25,
    [Enum.Material.Plaster] = 0.25,
    [Enum.Material.Plastic] = 7,
    [Enum.Material.SmoothPlastic] = 7,
    [Enum.Material.Wood] = 7,
    [Enum.Material.WoodPlanks] = 7,
    [Enum.Material.Cardboard] = 7,
    [Enum.Material.Glass] = 100,
    [Enum.Material.Fabric] = 100
})
local u6 = Instance.new("Folder")
u6.Parent = workspace:FindFirstChild("Debris") or workspace
u6.Name = "RaycastVisualizers"
local function u10(p7) --[[ Line: 112 ]]
    local v8 = p7:FindFirstAncestorWhichIsA("Model")
    if v8 then
        local v9 = not v8:FindFirstChildOfClass("Humanoid") and v8.Parent
        if v9 then
            v9 = v8.Parent:FindFirstChildOfClass("Humanoid")
        end
        if v9 then
            return true, v9
        end
    end
    return false, nil
end
local function u13(p11) --[[ Line: 127 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u10
    --]]
    local v12 = p11:IsDescendantOf(u6)
    u10(p11)
    return v12 or (p11:FindFirstAncestorWhichIsA("Accessory") ~= nil or p11.Name == "CollisionCapsule")
end
local function u17(p14, p15) --[[ Line: 139 ]]
    for _, v16 in pairs(p15) do
        if p14 == v16 or p14:IsDescendantOf(v16) then
            return true
        end
    end
    return false
end
local function u40(p18, p19, p20, p21, p22, p23, p24, p25) --[[ Line: 149 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u4
        [3] = u5
    --]]
    local v26 = RaycastParams.new()
    v26.FilterType = Enum.RaycastFilterType.Include
    v26.CollisionGroup = "Bullet"
    v26.FilterDescendantsInstances = { p20 }
    local v27 = p18 + p19 * 1000
    local v28 = u2:Raycast(v27, p18 - v27, v26)
    if not v28 then
        return 0, Vector3.zero, p24, false
    end
    local v29 = (p18 - v28.Position).Magnitude
    local v30 = v28.Position
    local v31 = p24 + v29
    local v32 = false
    local v33 = v28.Instance.MaterialVariant
    local v34
    if v33 == "" then
        v34 = false
    else
        v34 = u4[v33] ~= nil
    end
    if v34 then
        p23[v33] = (p23[v33] or 0) + v29
        local v35 = u4[v33] or 20
        if p23[v33] > v35 + p25 then
            return v29, v30, v31, true
        end
        local v36 = {
            ["instance"] = v28.Instance,
            ["position"] = v28.Position,
            ["normal"] = v28.Normal,
            ["material"] = v28.Material
        }
        table.insert(p21, v36)
        return v29, v30, v31, v32
    end
    local v37 = v28.Material
    p22[v37] = (p22[v37] or 0) + v29
    local v38 = u5[v37] or 20
    if p22[v37] > v38 + p25 then
        return v29, v30, v31, true
    end
    local v39 = {
        ["instance"] = v28.Instance,
        ["position"] = v28.Position,
        ["normal"] = v28.Normal,
        ["material"] = v28.Material
    }
    table.insert(p21, v39)
    return v29, v30, v31, v32
end
local function u54(p41, p42, p43, p44) --[[ Line: 215 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u40
    --]]
    local v45 = p42.Unit
    local v46 = {}
    local v47 = {}
    local v48 = 0
    local v49 = {}
    for _ = 1, 100 do
        local v50 = u2:Raycast(p41, v45 * 1000, p44)
        if not v50 then
            break
        end
        p44:AddToFilter(v50.Instance)
        local v51 = {
            ["instance"] = v50.Instance,
            ["position"] = v50.Position,
            ["normal"] = v50.Normal,
            ["material"] = v50.Material
        }
        table.insert(v49, v51)
        local v52, v53
        v52, p41, v48, v53 = u40(v50.Position, v45, v50.Instance, v49, v46, v47, v48, p43)
        if v53 then
            break
        end
    end
    return v49
end
local u76 = {
    ["isPartOfHumanoid"] = function(p55) --[[ Name: isPartOfHumanoid, Line 273 ]]
        --[[
        Upvalues:
            [1] = u10
        --]]
        return u10(p55)
    end,
    ["cast"] = function(p56, p57, p58, p59, p60) --[[ Name: cast, Line 277 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u76
            [3] = u2
            [4] = u17
            [5] = u13
        --]]
        local v61 = not p59 and {} or u3.Array.copy(p59)
        local v63 = p58 or (function() --[[ Line: 287 ]]
            local v62 = RaycastParams.new()
            v62.FilterType = Enum.RaycastFilterType.Exclude
            v62.IgnoreWater = false
            v62.CollisionGroup = "Bullet"
            return v62
        end)()
        v63.FilterDescendantsInstances = v61
        while true do
            local v66 = u2:Raycast(p56, p57, v63)
            if not v66 then
                break
            end
            local v67
            if p60 == nil then
                if v63.FilterType == Enum.RaycastFilterType.Include then
                    v67 = not u17(v66.Instance, v61)
                else
                    v67 = u13(v66.Instance)
                end
            else
                v67 = p60(v66.Instance)
            end
            if not v67 then
                return {
                    ["instance"] = v66.Instance,
                    ["position"] = v66.Position,
                    ["normal"] = v66.Normal,
                    ["material"] = v66.Material
                }
            end
            local v68 = v66.Instance
            table.insert(v61, v68)
            v63.FilterDescendantsInstances = v61
        end
        return {
            ["position"] = p56 + p57
        }
    end,
    ["castThrough"] = function(p69, p70, p71, p72) --[[ Name: castThrough, Line 342 ]]
        --[[
        Upvalues:
            [1] = u76
            [2] = u54
        --]]
        local v73 = RaycastParams.new()
        v73.CollisionGroup = "Bullet"
    
        if p72 then
            v73.FilterDescendantsInstances = p72
        end
        return u54(p69, p70, p71, v73)
    end
}
return u76

-- // Function Dumper made by King.Kevin
-- // Script Path: game:GetChildren()[117].Shared.Raycast

--[[
Function Dump: cast

Function Upvalues: cast
        1 [table]:
        1 [table] table: 0xe41d689782cfd9a3
                1 [function] = equalObjects
                2 [table]:
                Dictionary [table] table: 0x8939e502fb4dc993
                        1 [function] = mergeDeep
                        2 [function] = includes
                        3 [function] = flip
                        4 [function] = every
                        5 [function] = merge
                        6 [function] = update
                        7 [function] = equalsDeep
                        8 [function] = flatten
                        9 [function] = clone
                        10 [function] = mergeDeep
                        11 [function] = values
                        12 [function] = keys
                        13 [function] = copyDeep
                        14 [function] = some
                        15 [function] = freeze
                        16 [function] = map
                        17 [function] = removeValue
                        18 [function] = fromEntries
                        19 [function] = equals
                        20 [function] = set
                        21 [function] = removeValues
                        22 [function] = fromArrays
                        23 [function] = entries
                        24 [function] = removeKeys
                        25 [function] = removeKey
                        26 [function] = count
                        27 [function] = filter
                        28 [function] = has
                        29 [function] = withKeys
                        30 [function] = freezeDeep
                        31 [function] = merge
                3 [table]:
                List [table] table: 0x8c9403948d812c63
                        1 [function] = last
                        2 [function] = shuffle
                        3 [function] = every
                        4 [function] = concatDeep
                        5 [function] = update
                        6 [function] = clone
                        7 [function] = reduceRight
                        8 [function] = copyDeep
                        9 [function] = is
                        10 [function] = freezeDeep
                        11 [function] = map
                        12 [function] = removeValue
                        13 [function] = includes
                        14 [function] = differenceSymmetric
                        15 [function] = find
                        16 [function] = first
                        17 [function] = find
                        18 [function] = unshift
                        19 [function] = removeIndex
                        20 [function] = concatDeep
                        21 [function] = concat
                        22 [function] = reverse
                        23 [function] = push
                        24 [function] = slice
                        25 [function] = concat
                        26 [function] = concat
                        27 [function] = zipAll
                        28 [function] = zip
                        29 [function] = includes
                        30 [function] = removeValues
                        31 [function] = unshift
                        32 [function] = toSet
                        33 [function] = splice
                        34 [function] = equalsDeep
                        35 [function] = flatten
                        36 [function] = sort
                        37 [function] = dedupe
                        38 [function] = difference
                        39 [function] = count
                        40 [function] = concatDeep
                        41 [function] = findLast
                        42 [function] = freeze
                        43 [function] = findWhere
                        44 [function] = removeIndices
                        45 [function] = findWhereLast
                        46 [function] = shift
                        47 [function] = pop
                        48 [function] = set
                        49 [function] = create
                        50 [function] = equals
                        51 [function] = at
                        52 [function] = push
                        53 [function] = is
                        54 [function] = filter
                        55 [function] = insert
                        56 [function] = includes
                        57 [function] = reduce
                        58 [function] = some
                4 [table]:
                Set [table] table: 0x13bc1f7d200fe7f3
                        1 [function] = intersection
                        2 [function] = fromArray
                        3 [function] = isSuperset
                        4 [function] = clone
                        5 [function] = difference
                        6 [function] = map
                        7 [function] = delete
                        8 [function] = differenceSymmetric
                        9 [function] = merge
                        10 [function] = delete
                        11 [function] = merge
                        12 [function] = fromArray
                        13 [function] = isSubset
                        14 [function] = count
                        15 [function] = filter
                        16 [function] = has
                        17 [function] = merge
                        18 [function] = toArray
                        19 [function] = add
                5 [function] = isEmpty
                6 [table] (Recursive table detected)
                7 [userdata] = Sift.None
        2 [table]:
        2 [table] table: 0x987544511d6271a3
                1 [function] = isPartOfHumanoid
                2 [function] = castThrough
                3 [function] = cast
        3 [Instance] = Bloxstrike | Frog | BAC
        4 [function] = isPartWhitelisted
        5 [function] = isPartFiltered

Function Constants: cast
        1 [string] = Array
        2 [string] = copy
        4 [string] = FilterDescendantsInstances
        5 [string] = debug
        6 [string] = info
        8 [string] = f
        9 [string] = getfenv
        11 [string] = getgenv
        12 [string] = hookfunction
        13 [string] = Raycast
        14 [string] = Instance
        15 [string] = FilterType
        16 [string] = Enum
        17 [string] = RaycastFilterType
        18 [string] = Include
        19 [EnumItem] = Enum.RaycastFilterType.Include
        20 [string] = table
        21 [string] = insert
        23 [string] = instance
        24 [string] = position
        25 [string] = normal
        26 [string] = material
        27 [table]:
        27 [table] table: 0xf7f3162e97ed3e33
                1 [number] = 0
                2 [number] = 0
                3 [number] = 0
                4 [number] = 0
        28 [string] = Position
        29 [string] = Normal
        30 [string] = Material
        31 [table]:
        31 [table] table: 0x3ec8a01b75d8f363
                1 [number] = 0

====================================================================================================

Function Dump: isPartWhitelisted

Function Upvalues: isPartWhitelisted

Function Constants: isPartWhitelisted
        1 [string] = pairs
        3 [string] = IsDescendantOf

====================================================================================================

Function Dump: isPartOfHumanoid

Function Upvalues: isPartOfHumanoid

Function Constants: isPartOfHumanoid
        1 [string] = Model
        2 [string] = FindFirstAncestorWhichIsA
        3 [string] = Humanoid
        4 [string] = FindFirstChildOfClass
        5 [string] = Parent

====================================================================================================

Function Dump: Unknown Name

Function Upvalues: Unknown Name

Function Constants: Unknown Name
        1 [string] = RaycastParams
        2 [string] = new
        4 [string] = Enum
        5 [string] = RaycastFilterType
        6 [string] = Exclude
        7 [EnumItem] = Enum.RaycastFilterType.Exclude
        8 [string] = FilterType
        9 [string] = IgnoreWater
        10 [string] = Bullet
        11 [string] = CollisionGroup

====================================================================================================

Function Dump: checkMaterialDepth

Function Upvalues: checkMaterialDepth
        1 [Instance] = Bloxstrike | Frog | BAC
        2 [table]:
        2 [table] table: 0xefc7504586c4e043
                1 [number] = 0.25
                2 [number] = 0.25
        3 [table]:
        3 [table] table: 0xd0257e454351bb73
                1 [number] = 7
                2 [number] = 0.25
                3 [number] = 0.25
                4 [number] = 0.25
                5 [number] = 7
                6 [number] = 0.25
                7 [number] = 7
                8 [number] = 100
                9 [number] = 0.25
                10 [number] = 0.25
                11 [number] = 7
                12 [number] = 0.25
                13 [number] = 0.25
                14 [number] = 0.25
                15 [number] = 0.25
                16 [number] = 0.25
                17 [number] = 0.25
                18 [number] = 0.25
                19 [number] = 0.25
                20 [number] = 0.25
                21 [number] = 0.25
                22 [number] = 7
                23 [number] = 0.25
                24 [number] = 0.25
                25 [number] = 100
                26 [number] = 0.25
                27 [number] = 0.25
                28 [number] = 0.25
                29 [number] = 0.25
                30 [number] = 0.25
                31 [number] = 0.25
                32 [number] = 0.25
                33 [number] = 0.25
                34 [number] = 0.25
                35 [number] = 0.25
                36 [number] = 0.25
                37 [number] = 0.25
                38 [number] = 0.25

Function Constants: checkMaterialDepth
        1 [string] = RaycastParams
        2 [string] = new
        4 [string] = Enum
        5 [string] = RaycastFilterType
        6 [string] = Include
        7 [EnumItem] = Enum.RaycastFilterType.Include
        8 [string] = FilterType
        9 [string] = Bullet
        10 [string] = CollisionGroup
        11 [string] = FilterDescendantsInstances
        12 [number] = 1000
        13 [string] = Raycast
        14 [string] = Vector3
        15 [string] = zero
        16 [Vector3] = 0, 0, 0
        17 [string] = Position
        18 [string] = Magnitude
        19 [string] = Instance
        20 [string] = MaterialVariant
        21 [string] = 
        22 [number] = 0
        23 [number] = 20
        24 [string] = instance
        25 [string] = position
        26 [string] = normal
        27 [string] = material
        28 [table]:
        28 [table] table: 0x65898e260080bb13
                1 [number] = 0
                2 [number] = 0
                3 [number] = 0
                4 [number] = 0
        29 [string] = Normal
        30 [string] = Material
        31 [string] = table
        32 [string] = insert

====================================================================================================

Function Dump: isPartOfHumanoid

Function Upvalues: isPartOfHumanoid
        1 [function] = isPartOfHumanoid

Function Constants: isPartOfHumanoid

====================================================================================================

Function Dump: castThrough

Function Upvalues: castThrough
        1 [table] (Recursive table detected)
        2 [function] = castThroughMaterials

Function Constants: castThrough
        1 [string] = RaycastParams
        2 [string] = new
        4 [string] = Bullet
        5 [string] = CollisionGroup
        6 [string] = debug
        7 [string] = info
        9 [string] = f
        10 [string] = getfenv
        12 [string] = getgenv
        13 [string] = hookfunction
        14 [string] = FilterDescendantsInstances

====================================================================================================

Function Dump: castThroughMaterials

Function Upvalues: castThroughMaterials
        1 [Instance] = Bloxstrike | Frog | BAC
        2 [function] = checkMaterialDepth

Function Constants: castThroughMaterials
        1 [string] = Unit
        2 [number] = 1000
        3 [string] = Raycast
        4 [string] = Instance
        5 [string] = AddToFilter
        6 [string] = instance
        7 [string] = position
        8 [string] = normal
        9 [string] = material
        10 [table]:
        10 [table] table: 0xae92cc2445b57e83
                1 [number] = 0
                2 [number] = 0
                3 [number] = 0
                4 [number] = 0
        11 [string] = Position
        12 [string] = Normal
        13 [string] = Material
        14 [string] = table
        15 [string] = insert

====================================================================================================

Function Dump: isPartFiltered

Function Upvalues: isPartFiltered
        1 [Instance] = RaycastVisualizers
        2 [function] = isPartOfHumanoid

Function Constants: isPartFiltered
        1 [string] = IsDescendantOf
        2 [string] = Accessory
        3 [string] = FindFirstAncestorWhichIsA
        4 [string] = Name
        5 [string] = CollisionCapsule

====================================================================================================
]]
