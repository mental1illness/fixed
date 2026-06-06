-- PUT IN AUTO EXECUTE

repeat task.wait() until game:IsLoaded()
-- repeat task.wait() until game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("build")

if game.PlaceId ~= 123974602339071 then return end

local Garbage = getgc(true)
-- local AntiFlingFunc = nil
for Index, Value in Garbage do
    if typeof(Value) == "function" and not iscclosure(Value) then
        local Info = getinfo(Value)
        if Info.name == "antiflingF" then
            -- AntiFlingFunc = Value
            Value(true)
            print("my hood is a fucking baseplate nigger dont fw me, u fw me u fucking with yo life nigga ill fling the fuck outta you stop playin with me")
            break
        end
    end
end
