--// Services

local RunService: RunService = game:GetService("RunService");
local Players: Players = game:GetService("Players");
local Workspace: Workspace = game:GetService("Workspace");
local CoreGui: Instance = game:GetService("CoreGui");
local LocalPlayer: Player? = Players.LocalPlayer;
local Camera: Camera = Workspace.CurrentCamera;
local ViewportSize: Vector2 = Camera and Camera.ViewportSize or Vector2.new(0, 0);

--// Aliases

local Tick, Time, OsClock = tick, time, os.clock;
local RGB, NewColor = Color3.fromRGB, Color3.new;
local TableInsert, TableClone = table.insert, table.clone;
local StringFind, StringLower, StringUpper = string.find, string.lower, string.upper;
local NewVector3, NewVector2, NewVec = Vector3.new, Vector2.new, vector.create;
local GetChildren, GetDescendants, Destroy = game.GetChildren, game.GetDescendants, game.Destroy;
local GetPlayerFromCharacter, IsPlayerCharacter = Players.GetPlayerFromCharacter, function(Model: Model)
    if not Model then return false end
    local Player = Players:GetPlayerFromCharacter(Model);
    return Player ~= nil;
end;
local TaskWait, TaskSpawn = task.wait, task.spawn
local FindFirstChild, FindFirstChildOfClass, FindFirstChildWhichIsA, IsA, WaitForChild, IsClass = game.FindFirstChild, game.FindFirstChildOfClass, game.FindFirstChildWhichIsA, game.IsA, game.WaitForChild, function(Instance, ClassName)
    return Instance.ClassName == ClassName
end;
local WaitForChildOfClass = function(Parent: Instance, ClassName: string, Timeout: number)
    local Child = FindFirstChildOfClass(Parent, ClassName);
    if Child then return Child end
    
    local StartTime = Tick();
    local Connection;
    
    Connection = Parent.ChildAdded:Connect(function(Instance)
        if IsA(Instance, ClassName) then
            Child = Instance;
            if Connection then
                Connection:Disconnect();
            end
        end
    end)
    
    repeat TaskWait() until Child or (Tick() - StartTime) >= (Timeout or 5);
    
    if Connection and Connection.Connected then
        Connection:Disconnect();
    end
    
    return Child;
end
local Typeof, Type = typeof, type;
local UDim2FromOffset, UDim2New, UDim2FromScale = UDim2.fromOffset, UDim2.new, UDim2.fromScale;

--// Constants

local Inf = 1 / 0;
local Constants = {
    ["BoundingBoxVertices"] = {
        NewVec(-1, -1, -1),
        NewVec(-1, 1, -1),
        NewVec(-1, 1, 1),
        NewVec(-1, -1, 1),
        NewVec(1, -1, -1),
        NewVec(1, 1, -1),
        NewVec(1, 1, 1),
        NewVec(1, -1, 1)
    }
}

local Create = function(ClassName, Properties)
    if not ClassName then return end
    local Okay, Object = pcall(Instance.new, ClassName);
    if not Okay then return end
    
    if Properties and Typeof(Properties) == "table" then
        for Index, Value in Properties do
            pcall(function()
                if Typeof(Value) == "string" then
                    local EnumType = Enum[Index];
                    if EnumType and EnumType[Value] then
                        Object[Index] = EnumType[Value];
                        return;
                    end
                end
                Object[Index] = Value;
            end)
        end
    end
    
    return Object;
end

local ESP = {
    ["Entities"]    = {};
    ["Functions"]   = {};
    ["Connections"] = {};
    ["ScreenGui"]   = Create("ScreenGui", {
        ["Name"] = "\0";
        ["ResetOnSpawn"] = false;
        ["IgnoreGuiInset"] = true;
        ["Parent"] = (gethui and gethui()) or CoreGui;
    })
} do
    do -- Functions
        local Functions = ESP["Functions"] do
            Functions["Humanoid"] = {}; do 
                Functions["Humanoid"].GetHealth = function(Entity: Instance)
                    local Health, MaxHealth = 0, 0;
                    if IsA(Entity, "Model") then
                        local Humanoid = WaitForChildOfClass(Entity, "Humanoid", 5);
                        if Humanoid then
                            Health = Humanoid.Health;
                            MaxHealth = Humanoid.MaxHealth;
                        end
                    elseif IsClass(Entity, "Player") then
                        local Character = Entity.Character;
                        if Character then
                            local Humanoid = WaitForChildOfClass(Character, "Humanoid", 5);
                            if Humanoid then
                                Health = Humanoid.Health;
                                MaxHealth = Humanoid.MaxHealth;
                            end
                        end
                    end
                    return Health, MaxHealth;
                end
                Functions["Humanoid"].IsBodyPart = function(Part: BasePart)
                    if Part and IsA(Part, "BasePart") then
                        local Name = StringLower(Part.Name);
                        if Name and StringFind(Name, "arm") or StringFind(Name, "head") or StringFind(Name, "torso") or StringFind(Name, "foot") or StringFind(Name, "leg") or StringFind(Name, "hand") then
                            return true;
                        end
                    end
                    return false;
                end
            end

            Functions.Connect = function(Signal: RBXScriptConnection, Callback: any)
                local Connection = Signal:Connect(Callback);
                TableInsert(ESP["Connections"], Connection);
                return Connection;
            end

            Functions.GetBoundingBox = function(Parts: {})
                local MinX, MinY =  Inf,  Inf
                local MaxX, MaxY = -Inf, -Inf

                for _, Part in Parts do
                    local _CFrame    = Part.CFrame
                    local HalfX = Part.Size.X * 0.5
                    local HalfY = Part.Size.Y * 0.5
                    local HalfZ = Part.Size.Z * 0.5

                    for Index = 1, #Constants["BoundingBoxVertices"] do
                        local Vertex = Constants["BoundingBoxVertices"][Index]
                        local World  = (_CFrame + NewVec(HalfX * Vertex.X, HalfY * Vertex.Y, HalfZ * Vertex.Z)).Position
                        local Screen = Camera:WorldToViewportPoint(World)

                        if Screen.Z > 0 then
                            if Screen.X < MinX then MinX = Screen.X end
                            if Screen.Y < MinY then MinY = Screen.Y end
                            if Screen.X > MaxX then MaxX = Screen.X end
                            if Screen.Y > MaxY then MaxY = Screen.Y end
                        end
                    end
                end

                if MinX == Inf then return nil end

                local TopLeftX,     TopLeftY     = math.floor(MinX), math.floor(MinY)
                local BottomRightX, BottomRightY = math.floor(MaxX), math.floor(MaxY)

                return {
                    TopLeft     = NewVector2(TopLeftX,     TopLeftY),
                    TopRight    = NewVector2(BottomRightX, TopLeftY),
                    BottomLeft  = NewVector2(TopLeftX,     BottomRightY),
                    BottomRight = NewVector2(BottomRightX, BottomRightY),
                }
            end
            
            Functions.RegisterEntity = function(Model: Model, CustomProperties: {[string]: any}?)
                if not Model then return end
                if Typeof(CustomProperties) ~= "table" then return end

                local IsPlayer = IsPlayerCharacter(Model);
                local EntityData = {
                    ["Functions"] = {};
                    ["Objects"]   = {};
                    ["Connections"] = {};
                    ["Parts"]     = {};
                };
                local Properties  = {
                    ["Name"] = (CustomProperties and CustomProperties["Name"]) or Model.Name;
                    ["UseBodyPart"] = (CustomProperties and CustomProperties["UseBodyPart"]) or false;
                };
                local Objects = EntityData["Objects"] do
                    Objects["Holder"] = Create("Frame", {
                        ["Parent"] = ESP["ScreenGui"];
                        ["Name"] = "\0";
                    });

                end

                for Index, Descendant in GetDescendants(Model) do
                    if IsA(Descendant, "BasePart") then
                        if Properties["UseBodyPart"] then
                            if Functions["Humanoid"].IsBodyPart(Descendant) then
                                TableInsert(EntityData["Parts"], Descendant)
                            end
                        else
                            if IsA(Descendant, "BasePart") then
                                TableInsert(EntityData["Parts"], Descendant)
                            end
                        end
                    end
                end

                do
                    local Functions = EntityData["Functions"] do
                    Functions.Render = function(DeltaTime: number)
                        if not Model or not Model.Parent then
                            Functions.Destroy()
                            return
                        end
                        
                        if #EntityData["Parts"] == 0 then return end
                        
                        local BoundingBox = ESP.Functions.GetBoundingBox(EntityData["Parts"])
                        if not BoundingBox then
                            Objects["Holder"].Visible = false
                            return
                        end
                        
                        Objects["Holder"].Visible = true
                        Objects["Holder"].Position = UDim2FromOffset(BoundingBox.TopLeft.X, BoundingBox.TopLeft.Y)
                        Objects["Holder"].Size = UDim2FromOffset(
                            BoundingBox.BottomRight.X - BoundingBox.TopLeft.X,
                            BoundingBox.BottomRight.Y - BoundingBox.TopLeft.Y
                        )
                    end
                        Functions.Destroy = function()
                            for Index, Value in Objects do
                                pcall(Destroy, Value);
                            end
                            ESP["Entities"][Model] = nil;
                        end
                    end
                end

                ESP["Entities"][Model] = EntityData
            end

        end
    end

    ESP.Functions.RegisterEntity(LocalPlayer.Character, { ["Name"] = "hello" })

    ESP.Functions.Connect(RunService.PreRender, function(DeltaTime)
        for Index, Value in ESP["Entities"] do
            if Index and Value and Value.Functions then
                Value.Functions.Render(DeltaTime);
            end
        end
    end)
end
