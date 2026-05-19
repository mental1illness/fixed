
local WorldStateTable = {}
for Index, Value in next, getgc(true) do
    if typeof(Value) == "table" and rawget(Value, "WorldState") then
        WorldStateTable = Value
    end
end
WorldStateTable.Changed:Fire("pl_autobhop", true)
