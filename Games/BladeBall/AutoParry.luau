-- this is so dogshit


local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService		= game:GetService("RunService")
local Players			= game:GetService("Players")
local Stats             = game:GetService("Stats")
local LocalPlayer		= Players.LocalPlayer

local Pry = require(ReplicatedStorage:FindFirstChild("PRY", true))
local Ups = getupvalues(Pry)

local Network = Ups[6]

local Hash2 = Ups[5][3]
local Hash1 = Ups[8]

local ParryRemoteName = string.gsub(game.JobId, "-", "")
local ParryRemote = nil
local GetRemote = Network.RemoteEvent

task.spawn(function()
    setthreadidentity(2)
    setfenv(0, getfenv(Pry))
    setfenv(1, getfenv(Pry))
    ParryRemote = GetRemote(Network, ParryRemoteName)
end)

if ParryRemote then
    ParryRemote = cloneref(ParryRemote)
else
    return
end

local BladeBall = {} do
	BladeBall.Balls = {}
end

(function() -- balls
	for index, value in workspace.Balls:GetChildren() do
		table.insert(BladeBall.Balls, value)
	end
	for index, value in workspace.TrainingBalls:GetChildren() do
		table.insert(BladeBall.Balls, value)
	end
end)()

-- ok

workspace.Balls.ChildAdded:Connect(function(value)
	table.insert(BladeBall.Balls, value)
end)

workspace.TrainingBalls.ChildAdded:Connect(function(value)
	table.insert(BladeBall.Balls, value)
end)

workspace.TrainingBalls.ChildRemoved:Connect(function(Value)
	table.clear(BladeBall.Balls)
end)

workspace.Balls.ChildRemoved:Connect(function(Value)
	table.clear(BladeBall.Balls)
end)

local Utility = {} do
	--// Game
	function Utility:PerformParry()
		local PlayerPositions = {}

		for Index, Value in next, workspace.Alive:GetChildren() do
			if Value:FindFirstChild("HumanoidRootPart") then
				PlayerPositions[Value.Name] = Value.HumanoidRootPart.Position
			end
		end

		local CameraData = {}
		local CameraCenter = workspace.CurrentCamera.ViewportSize / 2

		CameraData[1] = CameraCenter.X
		CameraData[2] = CameraCenter.Y

		ParryRemote.FireServer(
			ParryRemote,
			Hash1,
			Hash2,
			0.05,
			workspace.CurrentCamera.CFrame,
			PlayerPositions,
			CameraData,
			false
		)
	end

    function Utility:IsBallClose()
        local Character = LocalPlayer.Character
        if not Character then return false end

        local Root = Character.PrimaryPart
        if not Root then return false end

        local PlayerPos = Root.Position
        local Ping = Stats.Network.ServerStatsItem["Data Ping"]:GetValue() / 1000

        for _, Ball in BladeBall.Balls do
            if not (Ball and Ball:IsA("BasePart")) then
                continue
            end

            local BallVel = Ball.AssemblyLinearVelocity
            local BallSpeed = BallVel.Magnitude
            if BallSpeed <= 0 then
                continue
            end

            local BallPos = Ball.Position
            local ClosestTime = math.huge

            for t = 0, 0.75, 0.05 do
                local PredictedPos = BallPos + (BallVel * t)
                local FutureDistance = (PredictedPos - PlayerPos).Magnitude

                if FutureDistance < (Ball.Size.Magnitude / 2) + 3 then
                    ClosestTime = t
                    break
                end
            end

            local ParryWindow = math.clamp(
                0.15 + (BallSpeed / 1000),
                0.1,
                0.6
            )

            if ClosestTime <= (ParryWindow + Ping) then
                return true
            end
        end

        return false
    end

    function Utility:IsTargeted()
		local Character = LocalPlayer.Character
		if not Character then return false end
        return (Character:FindFirstChildOfClass("Highlight")) ~= nil
    end

end

RunService.PreSimulation:Connect(function(DeltaTime)
    if Utility:IsTargeted() and Utility:IsBallClose(DeltaTime) then
        Utility:PerformParry()
    end
end)
