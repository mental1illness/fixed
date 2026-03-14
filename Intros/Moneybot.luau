-- this is also a shit code i don't care about this anymore have fun!

local HttpService = cloneref(game:GetService("HttpService"))
local Fonts = {}; do
    function Register_Font(Name, Weight, Style, Asset)
        if not isfile(Asset.Id) then
            writefile(Asset.Id, Asset.Font)
        end

        if isfile(Name .. ".font") then
            delfile(Name .. ".font")
        end

        local Data = {
            ["name"] = Name,
            ["faces"] = {
                {
                    ["name"] = "Normal",
                    ["weight"] = Weight,
                    ["style"] = Style,
                    ["assetId"] = getcustomasset(Asset.Id),
                },
            },
        }
        writefile(Name .. ".font", HttpService:JSONEncode(Data))

        return getcustomasset(Name .. ".font");
    end
    
    local VerdanaBold = Register_Font("VerdanaBold_AF", 100, "Normal", {
        Id = "VerdanaBold_.ttf";
        Font = game:HttpGet("https://flohaxx.vercel.app/font/VerdanaBold.ttf");
    })
    local Verdana = Register_Font("VerdanaNomarl_AF", 100, "Normal", {
        Id = "VerdanaNormal.ttf";
        Font = game:HttpGet("https://flohaxx.vercel.app/font/Verdana.ttf");
    })

    Fonts = {
        ["Verdana"] = Font.new(Verdana, Enum.FontWeight.Regular, Enum.FontStyle.Normal);
        ["VerdanaBold"] = Font.new(VerdanaBold, Enum.FontWeight.Regular, Enum.FontStyle.Normal);
    }
end
local Constants= {
    ["Messages"] = {
        ["Under"] = {
            "$$$";
            "the script you wish you had";
            "stop leaking the fucking loader";
            "god you fucking wish"
        };
        ["Upper"] = {
            ["Plain"] = "flo";
            ["Colored"] = "haxx";
        };
    }
}
local Utility = {}; do
	function Utility:Create(_ClassName, _Properties, _Parent)
		local _Object = Instance.new(_ClassName);
		if _Properties and _Object then
			for Key, Value in pairs(_Properties) do
				_Object[Key] = Value;
			end
		end
		if _Parent then
			_Object.Parent = _Parent;
		end
		return _Object
	end
	function Utility:Tween(_Object, _TweenInfo, _Properties)
		local TweenService = game:GetService("TweenService");
		local Tween = TweenService:Create(_Object, _TweenInfo, _Properties);
		Tween:Play()
		return Tween
	end
end
local Intro = {}; do
    Intro["LineSize"] = {["Line1"] = UDim2.new(1, 0, 0, 1); ["Line3"] = UDim2.new(0, 1, 1, 0); ["Line2"] = UDim2.new(1, 0, 0, 1); ["Line4"] = UDim2.new(0, 1, 1, 1)};
    function Intro:Init()
        local Under = "" -- brooo ender)) ender))))
        do 
            local UnderText_Counts = #Constants["Messages"]["Under"]
            Under = Constants["Messages"]["Under"][math.random(1, UnderText_Counts)]
        end

        local ScreenGui = Utility:Create("ScreenGui", {
            Name = "Intro",
            Enabled = true,
            IgnoreGuiInset = true,
            DisplayOrder = 500,
        }, gethui() or game.CoreGui)

        local Background = Utility:Create("Frame", {
            Name = "Background",
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Size = UDim2.new(1, 0, 1, 0),
            BorderSizePixel = 0,
            BackgroundColor3 = Color3.fromRGB(23, 25, 27)
        }, ScreenGui)

        local Container = Utility:Create("Frame", {
            Name = "Container",
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundTransparency = 1,
            Position = UDim2.new(0.5, 0, 0.5, 0),
            Size = UDim2.new(0, 700, 0, 300),
            ZIndex = 2,
            BorderSizePixel = 0,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        }, ScreenGui)

        local Line1 = Utility:Create("Frame", {
            Name = "Line1",
            Size = UDim2.new(1, 0, 0, 1),
            ZIndex = 2,
            BorderSizePixel = 0,
            BackgroundColor3 = Color3.fromRGB(124, 91, 93)
        }, Container)

        Utility:Create("ImageLabel", {
            Name = "Shadow",
            ImageColor3 = Color3.fromRGB(0, 0, 0),
            ScaleType = Enum.ScaleType.Slice,
            ImageTransparency = 0.2,
            Image = "rbxassetid://114686646075517",
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 1, 1, 1),
            SliceCenter = Rect.new(Vector2.new(95, 95), Vector2.new(205, 205))
        }, Line1)

        local Line4 = Utility:Create("Frame", {
            Name = "Line",
            Size = UDim2.new(0, 1, 1, 0),
            AnchorPoint = Vector2.new(0, 1),
            Position = UDim2.new(0, 0, 1, 1),
            ZIndex = 2,
            BorderSizePixel = 0,
            BackgroundColor3 = Color3.fromRGB(124, 91, 93)
        }, Container)

        Utility:Create("ImageLabel", {
            Name = "Shadow",
            ImageColor3 = Color3.fromRGB(0, 0, 0),
            ScaleType = Enum.ScaleType.Slice,
            ImageTransparency = 0.2,
            Image = "rbxassetid://114686646075517",
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 1, 1, 1),
            SliceCenter = Rect.new(Vector2.new(95, 95), Vector2.new(205, 205))
        }, Line4)

        local Line2 = Utility:Create("Frame", {
            Name = "Line2",
            Size = UDim2.new(1, 0, 0, 1),
            Position = UDim2.new(1, 0, 1, 0),
            ZIndex = 2,
            AnchorPoint = Vector2.new(1, 0),
            BorderSizePixel = 0,
            BackgroundColor3 = Color3.fromRGB(124, 91, 93)
        }, Container)

        Utility:Create("ImageLabel", {
            Name = "Shadow",
            ImageColor3 = Color3.fromRGB(0, 0, 0),
            ScaleType = Enum.ScaleType.Slice,
            ImageTransparency = 0.2,
            Image = "rbxassetid://114686646075517",
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 1, 1, 1),
            SliceCenter = Rect.new(Vector2.new(95, 95), Vector2.new(205, 205))
        }, Line2)

        local Line3 = Utility:Create("Frame", {
            Name = "Line3",
            AnchorPoint = Vector2.new(1, 0),
            Size = UDim2.new(0, 1, 1, 1),
            Position = UDim2.new(1, 0, 0, 0),
            ZIndex = 2,
            BorderSizePixel = 0,
            BackgroundColor3 = Color3.fromRGB(124, 91, 93)
        }, Container)


        Utility:Create("ImageLabel", {
            Name = "Shadow",
            ImageColor3 = Color3.fromRGB(0, 0, 0),
            ScaleType = Enum.ScaleType.Slice,
            ImageTransparency = 0.2,
            Image = "rbxassetid://114686646075517",
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 1, 1, 1),
            SliceCenter = Rect.new(Vector2.new(95, 95), Vector2.new(205, 205))
        }, Line3)

        local Text1 = Utility:Create("TextLabel", {
            Name = "Text1",
            FontFace = Fonts["VerdanaBold"],
            AnchorPoint = Vector2.new(0.5, 0.3),
            ZIndex = 3,
            BorderSizePixel = 0,
            Size = UDim2.new(0, 400, 0, 100),
            RichText = true,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            Text = Constants["Messages"]["Upper"]["Plain"] .. '<font color="rgb(227, 101, 102)">'  .. Constants["Messages"]["Upper"]["Colored"] .. '</font>',
            BackgroundTransparency = 1,
            Position = UDim2.new(0.5, 0, 0.24, 0),
            TextWrapped = true,
            TextSize = 85
        }, Container)

        Utility:Create("TextLabel", {
            Name = "Shadow",
            TextWrapped = true,
            TextColor3 = Color3.fromRGB(0, 0, 0),
            Text = Constants["Messages"]["Upper"]["Plain"] .. Constants["Messages"]["Upper"]["Colored"],
            Size = UDim2.new(1, 0, 1, 0),
            RichText = true,
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 2, 0, 2),
            FontFace = Fonts["VerdanaBold"],
            TextSize = 85
        }, Text1)

        local Divider = Utility:Create("Frame", {
            Name = "Divider",
            AnchorPoint = Vector2.new(0.5, 0.45),
            Position = UDim2.new(0.5, 0, 0.47, 0),
            Size = UDim2.new(0.58, 0, 0, 1),
            ZIndex = 2,
            BorderSizePixel = 0,
            BackgroundColor3 = Color3.fromRGB(124, 91, 93)
        }, Container)

        Utility:Create("ImageLabel", {
            Name = "Shadow",
            ImageColor3 = Color3.fromRGB(0, 0, 0),
            ScaleType = Enum.ScaleType.Slice,
            ImageTransparency = 0.2,
            Image = "rbxassetid://114686646075517",
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 1, 1, 1),
            SliceCenter = Rect.new(Vector2.new(95, 95), Vector2.new(205, 205))
        }, Divider)

        local Text2 = Utility:Create("TextLabel", {
            Name = "Text2",
            TextWrapped = true,
            TextColor3 = Color3.fromRGB(241, 241, 242),
            Text = Under,
            RichText = true,
            Size = UDim2.new(1, 0, 0, 40),
            AnchorPoint = Vector2.new(0.5, 0.3),
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            Position = UDim2.new(0.499, 0, 0.515, 0),
            FontFace = Fonts["Verdana"],
            ZIndex = 3,
            TextSize = 30
        }, Container)

        Utility:Create("TextLabel", {
            Name = "Shadow",
            TextWrapped = true,
            TextColor3 = Color3.fromRGB(0, 0, 0),
            Text = Under,
            Size = UDim2.new(1, 0, 1, 0),
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 2, 0, 2),
            RichText = true,
            FontFace = Fonts["Verdana"],
            TextSize = 30
        }, Text2)

        do --  animations
            local Fade = {}
                for Name, Line in pairs({["Line1"] = Line1, ["Line3"] = Line3, ["Line2"] = Line2, ["Line4"] = Line4}) do
                    local Data = Intro.LineSize[Name]
                if Name == "Line1" or Name == "Line2" then
                    Line.Size = UDim2.new(0, 1, Data.Y.Scale, Data.Y.Offset)
                else
                    Line.Size = UDim2.new(Data.X.Scale, Data.X.Offset, 0, 1)
                end
            end
            local OldDivider_Size = Divider.Size
            Divider.Size = UDim2.new(0, 1, OldDivider_Size.Y.Scale, OldDivider_Size.Y.Offset)
            for Index, Value in pairs(ScreenGui:GetDescendants()) do
                local Obj = Value
                if Obj:IsA("Frame") then
                    table.insert(Fade, {Obj, "BackgroundTransparency", Obj.BackgroundTransparency})
                    Obj.BackgroundTransparency = 1
                elseif Obj:IsA("TextLabel") then
                    table.insert(Fade, {Obj, "TextTransparency", Obj.TextTransparency})
                    table.insert(Fade, {Obj, "TextStrokeTransparency", Obj.TextStrokeTransparency})
                    Obj.TextTransparency = 1
                    Obj.TextStrokeTransparency = 1
                elseif Obj:IsA("ImageLabel") then
                    table.insert(Fade, {Obj, "ImageTransparency", Obj.ImageTransparency})
                    Obj.ImageTransparency = 1
                end
            end
            for Index, Value in ipairs(Fade) do
                local Data = Value
                if not Data[1]:IsA("TextLabel") then
                    Utility:Tween(
                        Data[1],
                        TweenInfo.new(1.2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out),
                        { [Data[2]] = Data[3] }
                    )
                end
            end
            task.delay(0.35, function()
                for Index, Value in ipairs(Fade) do
                    local Data = Value
                    if Data[2] == "TextTransparency" or Data[2] == "TextStrokeTransparency" then
                        Utility:Tween(
                            Data[1],
                            TweenInfo.new(1.2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out),
                            { [Data[2]] = Data[3] }
                        )
                    end
                end
                Utility:Tween(
                    Divider,
                    TweenInfo.new(2.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out),
                    { Size = OldDivider_Size }
                )
                for Name, Line in pairs({["Line1"] = Line1, ["Line3"] = Line3, ["Line2"] = Line2, ["Line4"] = Line4}) do
                    local Data = Intro.LineSize[Name]
                    if Name == "Line1" or Name == "Line2" then
                        Line.Size = UDim2.new(0, 1, Data.Y.Scale, Data.Y.Offset)
                    else
                        Line.Size = UDim2.new(Data.X.Scale, Data.X.Offset, 0, 1)
                    end
                    local Duration = 0.15
                    if Name == "Line4" then
                        Duration = 1.5
                    end
                    local LineTween = Utility:Tween(
                        Line,
                        TweenInfo.new(Duration, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out),
                        { Size = Data }
                    )
                    task.wait(0.1)
                end
            end)
        end
        task.delay(3, function()
            local SmallDividerSize = UDim2.new(0, 1, Divider.Size.Y.Scale, Divider.Size.Y.Offset)

            Utility:Tween(
                Divider,
                TweenInfo.new(1.3, Enum.EasingStyle.Cubic, Enum.EasingDirection.In),
                { Size = SmallDividerSize }
            )

            for Name, Line in pairs({Line1 = Line1, Line2 = Line2, Line3 = Line3, Line4 = Line4}) do
                local Data = Intro.LineSize[Name]
                local SmallSize

                if Name == "Line1" or Name == "Line2" then
                    SmallSize = UDim2.new(0, 1, Data.Y.Scale, Data.Y.Offset)
                else
                    SmallSize = UDim2.new(Data.X.Scale, Data.X.Offset, 0, 1)
                end

                Utility:Tween(
                    Line,
                    TweenInfo.new(1.3, Enum.EasingStyle.Cubic, Enum.EasingDirection.In),
                    { Size = SmallSize }
                )
            end

            for _, obj in ipairs(ScreenGui:GetDescendants()) do
                if obj:IsA("Frame") then
                    Utility:Tween(
                        obj,
                        TweenInfo.new(1.3, Enum.EasingStyle.Cubic, Enum.EasingDirection.In),
                        { BackgroundTransparency = 1 }
                    )
                elseif obj:IsA("TextLabel") then
                    Utility:Tween(
                        obj,
                        TweenInfo.new(1.3, Enum.EasingStyle.Cubic, Enum.EasingDirection.In),
                        {
                            TextTransparency = 1,
                            TextStrokeTransparency = 1
                        }
                    )
                elseif obj:IsA("ImageLabel") then
                    Utility:Tween(
                        obj,
                        TweenInfo.new(1.3, Enum.EasingStyle.Cubic, Enum.EasingDirection.In),
                        { ImageTransparency = 1 }
                    )
                end
            end

            task.delay(1.3, function()
                ScreenGui:Destroy()
            end)
        end)
    end
end
return Intro
