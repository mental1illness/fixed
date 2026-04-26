local Find: (string, string) -> (number?, number?) = string.find
local Garbage: {any} = getgc()

local GetBloxStrikeFunction = function(Function: string) -- yes
    local _Function = nil;
    for Index, Value in Garbage do
        if typeof(Value) ~= "function" then continue end
        local SOURCE = debug.info(Value, "s")
        if Find(SOURCE, "ReplicatedStorage") and Find(SOURCE, Function) then
            _Function = Value
            break
        end
    end

    return _Function
end

-- print(GetBloxStrikeFunction("Common.GetRayIgnore"))
return GetBloxStrikeFunction
