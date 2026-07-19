-- matas looking ass code burh

local Find, Insert, Remove, Clear, Clone, Move, Sort, Concat, Freeze = table.find, table.insert, table.remove, table.clear, table.clone, table.move, table.sort, table.concat, table.freeze;
local Abs, Clamp, Floor, Ceil, Round, Min, Max, Random, Sqrt, Huge = math.abs, math.clamp, math.floor, math.ceil, math.round, math.min, math.max, math.random, math.sqrt, math.huge;
local Byte, Char, Format, GSub, GMatch, Match, Lower, Upper, Split = string.byte, string.char, string.format, string.gsub, string.gmatch, string.match, string.lower, string.upper, string.split;
local Wait, Spawn, Delay, Clock = task.wait, task.spawn, task.delay, os.clock;
local FindFirstChild, WaitForChild, FindFirstChildOfClass, FindFirstChildWhichIsA, FindFirstAncestor, FindFirstAncestorOfClass, FindFirstAncestorWhichIsA, IsDescendantOf, GetChildren, GetDescendants, QueryDescendants, IsA, CloneObj, Destroy, ClearAllChildren, GetAttribute, SetAttribute = game.FindFirstChild, game.WaitForChild, game.FindFirstChildOfClass, game.FindFirstChildWhichIsA, game.FindFirstAncestor, game.FindFirstAncestorOfClass, game.FindFirstAncestorWhichIsA, game.IsDescendantOf, game.GetChildren, game.GetDescendants, game.QueryDescendants, game.IsA, game.Clone, game.Destroy, game.ClearAllChildren, game.GetAttribute, game.SetAttribute;
local Vec2, Vec3, Cfr, Dim2, RGB = Vector2.new, Vector3.new, CFrame.new, UDim2.new, Color3.fromRGB;

local Players, InputService, RunService = cloneref(game:GetService("Players")), cloneref(game:GetService("UserInputService")), cloneref(game:GetService("RunService"));
local Client, Workspace, Camera = Players.LocalPlayer, cloneref(game:GetService("Workspace")), cloneref(workspace.CurrentCamera);
local Viewmodels = WaitForChild(Workspace, "Viewmodels", 1/0);

local Visuals, Cheat = {
    Adornments  = {},
    Connections = {},
    Cache       = {Team = {

    }},
}, {
    
};

do -- Visuals
    --
    function Visuals:CreateAdornment(Part: Instance, Properties: {[string]: any})
        local Adornment = Instance.new("BoxHandleAdornment")
        
		Adornment.Adornee = Part
        Adornment.Size = Part.Size
		Adornment.Parent = gethui()

        for Property, Value in Properties do
            Adornment[Property] = Value
        end

        return Adornment
    end
    --
    function Visuals:CheckClientTeam(Model: Model)
        if Visuals.Cache.Team[Model] ~= nil then
            return Visuals.Cache.Team[Model]
        end
        for _, Object in QueryDescendants(Workspace, "#PlayerHighlight") do
            if IsA(Object, "Highlight") and Object.Adornee == Model then
                Visuals.Cache.Team[Model] = true
                return true
            end
        end
        Visuals.Cache.Team[Model] = false
        return false
    end
end

do -- Cheat
    --
    function Cheat:Chams()
        for Index, Model in GetChildren(Viewmodels) do
            
            if not IsA(Model, "Model") then continue end
            if Model.Name ~= "Viewmodel" then continue end
            if (Visuals.Adornments[Model] or Visuals.Connections[Model]) then continue end
            if Visuals:CheckClientTeam(Model) then continue end

            --
            Visuals.Adornments[Model] = {}
            Visuals.Connections[Model] = {}
            --
            for _, Part in GetChildren(Model) do
                if IsA(Part, "BasePart") and Part.Transparency < 1 then
					local Adornment = Visuals:CreateAdornment(Part, {
                        AlwaysOnTop = true,
						Visible = true,
                        ZIndex = 10,
                        Color3 = RGB(255, 0, 0),
                        Transparency = 0.9,
                    })
                    Insert(Visuals.Adornments[Model], Adornment)
                end
            end
            --

            do -- Connections
                Insert(Visuals.Connections[Model], Model.AncestryChanged:Connect(function(_, Parent)
                    if not Parent or not IsDescendantOf(Parent, Workspace) then
						--
                        for _, Adorment in Visuals.Adornments[Model] do
                            Destroy(Adorment)
                        end
                        Clear(Visuals.Adornments[Model])
                        for _, Connection in Visuals.Connections[Model] do
                            Connection:Disconnect()
                        end
                        Clear(Visuals.Connections[Model])
                        --
                    end
                end))
            end
            --
        end
    end
    --
end

do -- Main
    do -- Connections
		--
        RunService.Heartbeat:Connect(function()
            Cheat:Chams()
        end)
		--
    end
    --
end
