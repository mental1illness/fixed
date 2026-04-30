local Players     = cloneref(game:GetService("Players"))
local RunService  = cloneref(game:GetService("RunService"))
local LocalPlayer = Players.LocalPlayer

local SECONDS_TO_SET_LABEL = LocalPlayer.PlayerGui.GameUI.SecondsToSet
local HITBOX_BUTTON        = LocalPlayer.PlayerGui.GameUI.Hitbox

local GetNumberFromString = function(str)
    local BigGuy = str:gsub("<[^>]+>", "")
    return tonumber(BigGuy:match("%d+"))
end

local GetCurrentTimer = function()
    if not LocalPlayer.Character then return nil end
    local SeatPart = LocalPlayer.Character.Humanoid.SeatPart
    if SeatPart then
        local OurPlayer = SeatPart.Parent.Name
        local CurrentChair = SeatPart.Parent.Parent.Parent
        if CurrentChair then
            local OurTimer = CurrentChair:FindFirstChild("Timer"):FindFirstChild(OurPlayer)
            local SurfaceGui = OurTimer.SurfaceGui
            if SurfaceGui then
                return SurfaceGui.TimerText.Text
            end
        end
    end
    return nil
end
local DoesCurrentTimeMatch = function()
    local CurrentTime = GetCurrentTimer()
    if CurrentTime then
        local RealCurrentTime = GetNumberFromString(CurrentTime);
        local RealSeconds = GetNumberFromString(SECONDS_TO_SET_LABEL.Text)
        if RealCurrentTime == RealSeconds or math.abs(RealCurrentTime - RealSeconds) <= 0.5 then
            return true
        end
    end
    return false
end

RunService.PreRender:Connect(function()
    local Bool = DoesCurrentTimeMatch()
    if Bool then
        for Index, Value in getconnections(HITBOX_BUTTON.MouseButton1Down) do
            Value:Fire()
        end
    end
end)
