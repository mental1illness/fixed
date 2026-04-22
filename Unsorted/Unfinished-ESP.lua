--[[ TODO: 
    Finish up the ESP;
    Try to optimize the ESP as much as possible;
    Try to find the best bounding boxes;
    Spread the love pls.
--]]

local ESP = {
    ["Settings"] = {
        ["Enabled"] = { ["Value"] = true };
        ["Box"] = { 
            ["Value"] = true;
            ["Colors"] = {
                ["High"] = Color3.fromRGB(254, 51, 62);
                ["Low"] = Color3.fromRGB(240, 0, 0);
            };
            ["Fill"] = {
                ["Value"] = true;
                ["Transparency"] = 0.2;
                ["Colors"] = {
                    ["High"] = Color3.fromRGB(254, 51, 62);
                    ["Low"] = Color3.fromRGB(240, 0, 0);
                };
            };
        };

    };

    ["Entity"] = {  };
}
local Constants = {
    ["Vertices"] = {
        vector.create(-1, -1, -1),
        vector.create(-1,  1, -1),
        vector.create(-1,  1,  1),
        vector.create(-1, -1,  1),
        vector.create( 1, -1, -1),
        vector.create( 1,  1, -1),
        vector.create( 1,  1,  1),
        vector.create( 1, -1,  1),
    },
    ["MinimumBodyParts"] = 4 -- retry if not enough bodyparts
}

local Players       = cloneref(game:GetService("Players"));
local RunService    = cloneref(game:GetService("RunService"));
local Client        = Players.LocalPlayer;
local Camera        = workspace.CurrentCamera

local Create = function(ClassName: string, Properties: table)
    local Success, Object = pcall(Instance.new, ClassName)

    if not Success or not Object then warn("Failed to create", ClassName .. "."); return end

    pcall(function()
        for Index, Value in Properties do
            local Property = Object[Index]
            if typeof(Property) == "EnumItem" then
                Value = Property.EnumType[Value]
            end
            Object[Index] = Value
        end
    end)

    return Object
end

local IsABodyPart = function(Part: BasePart)
    if not Part then return (false); end
    if not Part:IsA("BasePart") then return false end

    local Name = string.lower(Part.Name); -- just incase
    if string.find(Name, "arm") or string.find(Name, "leg") or string.find(Name, "torso") or string.find(Name, "head") or string.find(Name, "foot") or string.find(Name, "hand") then
        return (true);
    end

    return (false);
end

local GetTableSize = function(Table: table, Recursive: boolean)
    local Count = 0
    for _, Value in Table do
        Count += 1
        if Recursive and type(Value) == "table" then
            Count += GetTableSize(Value, true)
        end
    end
    return Count
end

local GetElementsTransparency = function(Element: any) -- just use the thing we have or need to use for an esp bruh
    if Element:IsA("ImageLabel") then
        return ("ImageTransparency");
    elseif Element:IsA("ImageButton") then
        return ("ImageTransparency");
    elseif Element:IsA("UIStroke") then
        return ("Transparency");
    elseif Element:IsA("Frame") then
        return ("BackgroundTransparency");
    elseif Element:IsA("ScrollingFrame") then
        return ("BackgroundTransparency");
    elseif Element:IsA("ViewportFrame") then
        return ("ImageTransparency");
    elseif Element:IsA("TextLabel") then
        return ("TextTransparency");
    elseif Element:IsA("TextButton") then
        return ("TextTransparency");
    elseif Element:IsA("TextBox") then
        return ("TextTransparency");
    elseif Element:IsA("CanvasGroup") then
        return ("GroupTransparency");
    elseif Element:IsA("VideoFrame") then
        return ("Transparency");
    end

    return (nil)
end

do --
    ESP["Holder"]           = Create("ScreenGui", {
        ["Parent"]          = gethui();
        ["Enabled"]         = true;
        ["IgnoreGuiInset"]  = true
    })
    ESP["GetBoundingBoxes"] = function(Parts: { BasePart }) -- probably the best one so far
        local MinX, MinY =  math.huge,  math.huge
        local MaxX, MaxY = -math.huge, -math.huge

        for _, Part in Parts do
            local CF    = Part.CFrame
            local HalfX = Part.Size.X * 0.5
            local HalfY = Part.Size.Y * 0.5
            local HalfZ = Part.Size.Z * 0.5

            for VertexIndex = 1, #Constants["Vertices"] do
                local Vertex = Constants["Vertices"][VertexIndex]
                local World  = (CF + vector.create(HalfX * Vertex.X, HalfY * Vertex.Y, HalfZ * Vertex.Z)).Position
                local Screen = Camera:WorldToViewportPoint(World)

                if Screen.Z > 0 then
                    if Screen.X < MinX then MinX = Screen.X end
                    if Screen.Y < MinY then MinY = Screen.Y end
                    if Screen.X > MaxX then MaxX = Screen.X end
                    if Screen.Y > MaxY then MaxY = Screen.Y end
                end
            end
        end

        if MinX == math.huge then return nil end

        local TopLeftX,     TopLeftY     = math.floor(MinX), math.floor(MinY)
        local BottomRightX, BottomRightY = math.floor(MaxX), math.floor(MaxY)

        return {
            TopLeft     = Vector2.new(TopLeftX,     TopLeftY),
            TopRight    = Vector2.new(BottomRightX, TopLeftY),
            BottomLeft  = Vector2.new(TopLeftX,     BottomRightY),
            BottomRight = Vector2.new(BottomRightX, BottomRightY),
        }
    end

    ESP["IsDead"] = function(Character: Model)
        if not Character then return (true) end

        local Humanoid = Character:FindFirstChildOfClass("Humanoid")
        if not Humanoid then return (true) end
        if not Character.PrimaryPart then return (true) end
        if Humanoid.Health <= 0 then return (true) end

        return (false)
    end

    ESP["GetHealth"] = function(Player: Player, Character: Model)
        local HPTable = {
            ["MaxHealth"] = 100;
            ["Health"] = 0;
        }

        if Character then
            local Humanoid = Character:FindFirstChildOfClass("Humanoid");
            if Humanoid then
                HPTable["MaxHealth"] = Humanoid.MaxHealth;
                HPTable["Health"]    = Humanoid.Health;
            end
        end
        
        return (HPTable);
    end

    ESP["DrawElements"] = function(This: table)
        -- holder
        This["Objects"]["Holder"] = Create("Frame", {
            ["BackgroundTransparency"] = 1;
            ["Visible"]                = ESP["Settings"]["Enabled"].Value;
            ["Parent"]                 = ESP["Holder"]
        });
        This["ExcludeFade"]["Holder"] = This["Objects"]["Holder"];
        -- main elements
        
        
        -- settings > box
        This["Objects"]["BoxStroke"] = Create("UIStroke", {
            ["Enabled"]                = ESP["Settings"]["Box"].Value;
            ["Thickness"]              = 1;
            ["LineJoinMode"]           = "Miter";
            ["Color"]                  = Color3.fromRGB(255, 255, 255);
            ["Parent"]                 = This["Objects"]["Holder"];
            ["BorderOffset"]           = UDim.new(0, 1);
            ["ZIndex"]                 = 5;
        });
        This["Objects"]["BoxOutlineStroke"] = Create("UIStroke", {
            ["Enabled"]                = ESP["Settings"]["Box"].Value;
            ["Thickness"]              = 3;
            ["LineJoinMode"]           = "Miter";
            ["Color"]                  = Color3.fromRGB(0, 0, 0);
            ["Parent"]                 = This["Objects"]["Holder"]
        });
        This["Objects"]["BoxGradient"] = Create("UIGradient", {
            ["Color"]    = ColorSequence.new({
                ColorSequenceKeypoint.new(0,    ESP["Settings"]["Box"]["Colors"]["High"]),
                ColorSequenceKeypoint.new(1,    ESP["Settings"]["Box"]["Colors"]["Low"]),
            });
            ["Rotation"] = 90;
            ["Offset"]   = Vector2.new(0, 0);
            ["Parent"]   = This["Objects"]["BoxStroke"];
        });

        -- settings > box > fill

        This["Objects"]["BoxFill"] = Create("Frame", {
            ["BackgroundTransparency"] = ESP["Settings"]["Box"]["Fill"]["Transparency"];
            ["Visible"]                = ESP["Settings"]["Box"]["Fill"].Value;
            ["Size"]                   = UDim2.fromScale(1, 1);
            ["Parent"]                 = This["Objects"]["Holder"];
        });
        This["Objects"]["BoxFillGradient"] = Create("UIGradient", {
            ["Color"]    = ColorSequence.new({
                ColorSequenceKeypoint.new(0,    ESP["Settings"]["Box"]["Fill"]["Colors"]["High"]),
                ColorSequenceKeypoint.new(1,    ESP["Settings"]["Box"]["Fill"]["Colors"]["Low"]),
            });
            ["Rotation"] = 90;
            ["Offset"]   = Vector2.new(0, 0);
            ["Parent"]   = This["Objects"]["BoxFill"];
        });

        This["SpecifiedTransparency"][This["Objects"]["BoxFill"]] = { ["In"] = ESP["Settings"]["Box"]["Fill"]["Transparency"]; ["Out"] = 1 }

        This["Cache"]["Settings"]["BoxColorHigh"] = ESP["Settings"]["Box"]["Colors"]["High"];
        This["Cache"]["Settings"]["BoxColorLow"] = ESP["Settings"]["Box"]["Colors"]["Low"];
        
        This["Cache"]["Settings"]["BoxFillColorHigh"] = ESP["Settings"]["Box"]["Fill"]["Colors"]["High"];
        This["Cache"]["Settings"]["BoxFillColorLow"] = ESP["Settings"]["Box"]["Fill"]["Colors"]["Low"];

        return (This);
    end

    ESP["Fade"] = function(This: table, Duration: number, InOrOut: boolean)
        if InOrOut and This["IsFaded"] == false then return end
        if not InOrOut and This["IsFaded"] == true then return end
        if This["IsFading"] then return end

        This["IsFading"] = true
        This["IsFaded"]  = not InOrOut

        local Whys_Stephen_Hawking_InTheList = InOrOut and 0 or 1
        local TweenCount         = 0
        local TweenCompleted     = 0

        for Name, Object in This["Objects"] do
            local IsExcluded = false
            local AreYouSpecial     = This["SpecifiedTransparency"][Object]
            local CustomTransparency = if AreYouSpecial
                then (InOrOut and AreYouSpecial.In or AreYouSpecial.Out)
                else Whys_Stephen_Hawking_InTheList-- omfg
            
            for WeGotHellaRacks, ExcludedObject in This["ExcludeFade"] do
                if ExcludedObject == Object then
                    IsExcluded = true
                    break
                end
            end
            
            -- This["SpecifiedTransparency"][This["Objects"]["BoxFill"]] = ESP["Settings"]["Box"]["Fill"]["Transparency"];

            if IsExcluded then continue end
            if not Object or not Object.Parent then continue end

            local TransparencyProperty = GetElementsTransparency(Object)
            if not TransparencyProperty then continue end

            TweenCount += 1
            local Tween = TweenService:Create(Object, TweenInfo.new(Duration, Enum.EasingStyle.Linear), {[TransparencyProperty] = CustomTransparency})
            --[[Tween.Completed:Connect(function()
                TweenCompleted += 1
                if TweenCompleted >= TweenCount then
                    This["IsFading"] = false
                end
            end)]]

            Tween.Completed:Once(function()
                TweenCompleted += 1
                if TweenCompleted >= TweenCount then
                    This["IsFading"] = false
                end
            end)

            Tween:Play()
        end

        if TweenCount == 0 then
            This["IsFading"] = false
        end
    end

    ESP["AddEntity"] = function(Entity: Player)
        local Data = {  };
        local Name = Entity.Name
        local This = { 
            ["Objects"]               = {  }; 
            ["ExcludeFade"]           = {  };
            ["SpecifiedTransparency"] = {  };
            ["Functions"]             = {  }; 
            ["Connections"]           = {  }; 
            ["Cache"]                 = { 
                ["BodyParts"]   = {  }; 
                ["Settings"]    = {  };
                ["LastPos"]     = nil;
                ["LastCorner"]  = nil;
            }; 
            ["RootPart"]              = nil;
            ["IsFading"]              = false;
            ["IsFaded"]               = false;
        }
        ESP["Entity"][Entity] = This;
        ESP["DrawElements"](This);

        This["Connections"]["CharacterAdded"] = Entity.CharacterAdded:Connect(function(Character: Model)
            This["Cache"]["BodyParts"] = {}
            This["RootPart"] = nil

            task.defer(function()
                
                Character:WaitForChild("HumanoidRootPart")
                Character:WaitForChild("Head")
                local IsTorsoFound = Character:WaitForChild("UpperTorso", 3) or Character:WaitForChild("Torso", 3)
                if not IsTorsoFound then return end
                -- ^^ so fucking annoying
                
                for Index, Value in Character:GetChildren() do
                    if IsABodyPart(Value) then
                        This["Cache"]["BodyParts"][Value.Name] = Value
                    end
                end

                This["RootPart"] = Character.PrimaryPart
            end)
        end)

        This["Connections"]["CharacterRemoving"] = Entity.CharacterRemoving:Connect(function()
            This["Cache"]["BodyParts"] = {}
            This["RootPart"] = nil
        end)
        
        if Entity.Character then
            task.defer(function()
                for Index, Value in Entity.Character:GetChildren() do
                    if IsABodyPart(Value) then
                        This["Cache"]["BodyParts"][Value.Name] = Value
                    end
                end
                This["RootPart"] = Entity.Character.PrimaryPart
            end)
        end

        This["Functions"]["Render"] = function()
            if not ESP["Settings"]["Enabled"].Value then
                This["Objects"]["Holder"].Visible = false
                return (false);
            end
            
            if not This["RootPart"] or ESP["IsDead"](Entity.Character) then -- TODO: make it fade instead
                This["Objects"]["Holder"].Visible = false
                return (false)
            end

            local Vector, OnScreen = Camera:WorldToViewportPoint(This["RootPart"].CFrame.Position)
            if not OnScreen then
                
                This["Objects"]["Holder"].Visible = false
                return false
            end
            This["Objects"]["Holder"].Visible = true

            if GetTableSize(This["Cache"]["BodyParts"]) < Constants["MinimumBodyParts"] then
                This["Cache"]["BodyParts"] = {}
                for Index, Value in Entity.Character:GetChildren() do
                    if IsABodyPart(Value) then
                        This["Cache"]["BodyParts"][Value.Name] = Value
                    end
                end
            end
            local Corners = ESP["GetBoundingBoxes"](This["Cache"]["BodyParts"])
            if not Corners then
                
                This["Objects"]["Holder"].Visible = false

                return (false);
            end

            local BoxSize = Corners.BottomRight - Corners.TopLeft

            This["Objects"]["Holder"].Visible = true
            This["Objects"]["Holder"].Position = UDim2.fromOffset(Corners.TopLeft.X, Corners.TopLeft.Y)
            This["Objects"]["Holder"].Size     = UDim2.fromOffset(BoxSize.X, BoxSize.Y)

            do -- Update
                do -- Box
                    if This["Objects"]["BoxGradient"] then
                        if This["Cache"]["Settings"]["BoxColorHigh"] ~= ESP["Settings"]["Box"]["Colors"]["High"] or This["Cache"]["Settings"]["BoxColorLow"] ~= ESP["Settings"]["Box"]["Colors"]["Low"] then
                            This["Objects"]["BoxGradient"].Color = ColorSequence.new({
                                ColorSequenceKeypoint.new(0,    ESP["Settings"]["Box"]["Colors"]["High"]),
                                ColorSequenceKeypoint.new(1,    ESP["Settings"]["Box"]["Colors"]["Low"]),
                            });
                            This["Cache"]["Settings"]["BoxColorHigh"] = ESP["Settings"]["Box"]["Colors"]["High"];
                            This["Cache"]["Settings"]["BoxColorLow"] = ESP["Settings"]["Box"]["Colors"]["Low"];
                        end
                    end

                    if This["Objects"]["BoxStroke"].Enabled ~= ESP["Settings"]["Box"]["Value"] or This["Objects"]["BoxOutlineStroke"].Enabled ~= ESP["Settings"]["Box"]["Value"] then
                        This["Objects"]["BoxStroke"].Enabled = ESP["Settings"]["Box"]["Value"];
                        This["Objects"]["BoxOutlineStroke"].Enabled = ESP["Settings"]["Box"]["Value"];
                    end
                    do -- Box/Fill
                        if This["Objects"]["BoxFillGradient"] then
                            if This["Cache"]["Settings"]["BoxFillColorHigh"] ~= ESP["Settings"]["Box"]["Colors"]["High"] or This["Cache"]["Settings"]["BoxFillColorLow"] ~= ESP["Settings"]["Box"]["Colors"]["Low"] then
                                This["Objects"]["BoxFillGradient"].Color = ColorSequence.new({
                                    ColorSequenceKeypoint.new(0,    ESP["Settings"]["Box"]["Fill"]["Colors"]["High"]),
                                    ColorSequenceKeypoint.new(1,    ESP["Settings"]["Box"]["Fill"]["Colors"]["Low"]),
                                });
                                This["Cache"]["Settings"]["BoxFillColorHigh"] = ESP["Settings"]["Box"]["Fill"]["Colors"]["High"];
                                This["Cache"]["Settings"]["BoxFillColorLow"] = ESP["Settings"]["Box"]["Fill"]["Colors"]["Low"];
                            end

                            if This["Objects"]["BoxFill"].Visible ~= ESP["Settings"]["Box"]["Fill"]["Value"] then
                                This["Objects"]["BoxFill"].Visible = ESP["Settings"]["Box"]["Fill"]["Value"];
                            end
                        end

                    end



                end

            end

            return (true);
        end;

        

        This["Functions"]["Kill"] = function()
            for Index, Connection in This["Connections"] do
                Connection:Disconnect()
            end

            This["Objects"]["Holder"]:Destroy()
            ESP["Entity"][Entity] = nil
        end;
    end
    for Index, Value in Players:GetPlayers() do
        ESP["AddEntity"](Value)
    end
    RunService.RenderStepped:Connect(function()
        for Key, This in ESP["Entity"] do
            if This["Functions"] then
                This["Functions"]["Render"]()
            end
        end
    end)
end