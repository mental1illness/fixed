local Flags = {
    ["Speed"] = { ["Value"] = true };
    ["Speed/Value"] = { ["Value"] = 30 };
};

local Enum = Enum;
local InputService, Players, RunService = cloneref(game:GetService("UserInputService")), cloneref(game:GetService("Players")), cloneref(game:GetService("RunService"));
local NewVector3 = clonefunction(Vector3.new);
local CurrentCamera = workspace.CurrentCamera;
local Client = Players.LocalPlayer;

RunService.RenderStepped:Connect(function(Delta)
    local MoveDirectionPos = NewVector3();
    local MoveDirectionString = "None";

    local CurrentCameraCFrame = CurrentCamera.CFrame

    local Forward = NewVector3(CurrentCameraCFrame.LookVector.X, 0, CurrentCameraCFrame.LookVector.Z).Unit;
    local Right   = NewVector3(CurrentCameraCFrameRightVector.X, 0, CurrentCameraCFrame.RightVector.Z).Unit;

    local IsWDown, IsSDown, IsADown, IsDDown  = InputService:IsKeyDown(Enum.KeyCode.W), InputService:IsKeyDown(Enum.KeyCode.S), InputService:IsKeyDown(Enum.KeyCode.A), InputService:IsKeyDown(Enum.KeyCode.D);

    local Character = Client.Character;
    local HumanoidRootPart = Character.PrimaryPart;

    if HumanoidRootPart and Flags["Speed"].Value then
        if IsWDown then MoveDirectionPos = MoveDirectionPos + Forward end
        if IsSDown then MoveDirectionPos = MoveDirectionPos - Forward end
        if IsADown then MoveDirectionPos = MoveDirectionPos - Right end
        if IsDDown then MoveDirectionPos = MoveDirectionPos + Right end
        
        local _OldVelocity = HumanoidRootPart.AssemblyLinearVelocity;
        if MoveDirectionPos.Magnitude > 0 then
            HumanoidRootPart.AssemblyLinearVelocity = NewVector3(MoveDirectionPos.Unit.X * Flags["Speed/Value"]["Value"], _OldVelocity.Y, MoveDirectionPos.Unit.Z * Flags["Speed/Value"]["Value"]);
        else
            HumanoidRootPart.AssemblyLinearVelocity = NewVector3(_OldVelocity.X * 0.75, _OldVelocity.Y, _OldVelocity.Z * 0.75);
        end
    end
end)
