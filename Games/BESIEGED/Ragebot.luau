-- what ever u wanna call this

local ReplicatedStorage = cloneref(game:GetService("ReplicatedStorage"));
local RunService        = cloneref(game:GetService("RunService"));
local Players           = cloneref(game:GetService("Players"));
local ScriptContext     = cloneref(game:GetService("ScriptContext"));
local LogService        = cloneref(game:GetService("LogService"));
local LocalPlayer       = Players.LocalPlayer;

local InflictTarget     = ReplicatedStorage.Storage.Remotes.InflictTarget
local SkipVote          = ReplicatedStorage.Storage.Remotes.SkipVoteEvent
local MobsStorage       = workspace.Mobs

local RaycastParameters = RaycastParams.new()
RaycastParameters.FilterType = Enum.RaycastFilterType.Exclude
RaycastParameters.FilterDescendantsInstances = {Character, Tool, workspace.CurrentCamera}

local SoFarVector3      = Vector3.new(1/0, 1/0, 1/0)

do
    do
        for Index, Connection in getconnections(ScriptContext.Error) do
            Connection:Disable();
        end
        for Index, Connection in getconnections(LogService.MessageOut) do
            Connection:Disable();
        end
    end
end

local Utils = {}; do
    Utils.FireBullet = function(EnemyCharacter: Model, HitPart: string)

        local Character = LocalPlayer.Character
        local Tool = Character:FindFirstChildOfClass("Tool")
        local TargetPart = EnemyCharacter:FindFirstChild(HitPart) or EnemyCharacter.PrimaryPart

        if Character and Tool and TargetPart then
            local FirePoint = Tool:FindFirstChild("GunFirePoint")
            local Origin = FirePoint and FirePoint.WorldPosition or Character.PrimaryPart.Position

            local HitPosition = TargetPart.Position
            local ShootDirection = (HitPosition - Origin).Unit
            local Distance = (HitPosition - Origin).Magnitude

            InflictTarget:InvokeServer(
                Tool,
                LocalPlayer,
                EnemyCharacter:FindFirstChildOfClass("Humanoid"),
                EnemyCharacter.PrimaryPart,
                {
                    Distance = Distance,
                    ChargeLevel = 0,
                    Character = Character,
                    ToolName = Tool.Name
                },
                TargetPart,
                HitPosition,
                ShootDirection,
                false
            )
        end
    end

    Utils.GetAllMobs = function(): {}
        local Mobs = {};
        for Index, Value in MobsStorage:GetDescendants() do
            if Value:IsA("Model") and Value.PrimaryPart and not Value:FindFirstChildOfClass("ForceField") then
                table.insert(Mobs, Value);
            end
        end
        return Mobs
    end


end
RunService.RenderStepped:Connect(function()
    for Index, Value in Utils.GetAllMobs() do
        local Character = Value;
        if Character then
            Utils.FireBullet(Character, "Head")
        end
    end
    SkipVote:FireServer("Vote")
end)
