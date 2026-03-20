-- i saw this image on unknowncheatz i thought it'd be cool to make that in roblox (no it's not)
-- https://files.catbox.moe/0wbxzd.png

-- also i coded  this on stream after i typed udim theres a suggestion i used udim2.new
-- and yuna said udim is an alternative keyword for udim2.new holy retard
-- clap for yuna guys literally not helping and harassing me for no reason 👏👏👏
-- ik u would say its just a joke between friends but ya dk what i feel 😂

-- honestly i should just go die what's the point of being misunderstood all the time
-- whats the point of actually living when you get harassed all day to be honest

-- ik im not going to kill myself its really wtv

-- ^^ honestly this is just how i vent now thru this thing literally no one would notice this lol

local RobloxGui     = gethui() or cloneref(game:GetService("CoreGui"))
local HttpService   = cloneref(game:GetService("HttpService"))
local TweenService  = cloneref(game:GetService("TweenService"))
local Workspace     = cloneref(game:GetService("Workspace"))
local CurrentCamera = Workspace.CurrentCamera
local Constants     = {
    ["TweenInfo"]   = TweenInfo.new(1.2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0)
}

-- Fonts
local Fonts = {  } do
	local ImportFont = function(Name, Url)
        writefile(Name .. ".ttf", Url)
        local CustomTable = {
            Name = Name,
            faces = {
                {
                    name = "Regular",
                    weight = 400,
                    style = "normal",
                    assetId = getcustomasset(Name .. ".ttf")
                }
            }
        }
        writefile(Name .. ".json", HttpService:JSONEncode(CustomTable))

        return Font.new(getcustomasset(Name .. ".json"), Enum.FontWeight.Regular)
    end

    Fonts = {
        ["Tahoma"] = ImportFont("tahoma", game:HttpGet("https://github.com/mental1illness/storage/raw/refs/heads/main/fonts/old-tahoma.ttf")),
        ["TahomaBold"] = ImportFont("tahomabold", game:HttpGet("https://github.com/mental1illness/storage/raw/refs/heads/main/fonts/old-tahoma-bold.ttf")),
        ["VerdanaBold"] = ImportFont("verdanabold", game:HttpGet("https://github.com/mental1illness/storage/raw/refs/heads/main/fonts/verdana_bold.ttf"))
    }
end

local CreateInstance = function(ClassName: string, Properties: table)
    local Object = Instance.new(ClassName)
    for Index, Value in Properties do
        pcall(function()
            Object[Index] = Value        
        end)
    end
    return Object
end

do
    local ScreenGui = CreateInstance("ScreenGui", {
        Enabled = true,
        Parent = RobloxGui,
        IgnoreGuiInset = true
    })
    local Intro = {Text = {}} do
        local Tint = CreateInstance("Frame", {
            BackgroundTransparency = 1,
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            Size = UDim2.new(1, 0, 1, 0),
            Parent = ScreenGui
        })

        local Blur = CreateInstance("BlurEffect", {
            Size = 0,
            Parent = CurrentCamera
        })

        Intro.Text["GachaLife"] = CreateInstance("TextLabel", {
            Text = "(◣_◢)",
            Parent = ScreenGui,
            BackgroundTransparency = 1,
            TextColor3 = Color3.fromRGB(224, 224, 224),
            Visible = true,
            FontFace = Fonts.VerdanaBold,
            TextTransparency = 1,
            AutomaticSize = Enum.AutomaticSize.XY,
            Position = UDim2.new(0.5, 0, 0.5, -25),
            AnchorPoint = Vector2.new(0.5, 0.5),
            TextSize = 12,
            ZIndex = 50
        })
        Intro.Text["CheatName"] = CreateInstance("TextLabel", {
            Text = "unname enchancement loaded",
            Parent = ScreenGui,
            BackgroundTransparency = 1,
            TextColor3 = Color3.fromRGB(255, 0, 0),
            Visible = true,
            FontFace = Fonts.TahomaBold,
            TextTransparency = 1,
            AutomaticSize = Enum.AutomaticSize.XY,
            Position = UDim2.new(0.5, 0, 0.5, 0),
            AnchorPoint = Vector2.new(0.5, 0.5),
            TextSize = 12,
            ZIndex = 50
        })
        Intro.Text["Description"] = CreateInstance("TextLabel", {
            Text = "press INSERT to show/unshow menu",
            Parent = ScreenGui,
            BackgroundTransparency = 1,
            TextColor3 = Color3.fromRGB(107, 107, 107),
            Visible = true,
            FontFace = Fonts.Tahoma,
            TextTransparency = 1,
            AutomaticSize = Enum.AutomaticSize.XY,
            Position = UDim2.new(0.5, 0, 0.5, 25),
            AnchorPoint = Vector2.new(0.5, 0.5),
            TextSize = 12,
            ZIndex = 50
        })
        task.spawn(function()
            for Index, Value in Intro.Text do
                local Stroke = CreateInstance("UIStroke", {
                    Name = "Stroke",
                    Thickness = 1,
                    Transparency = 1,
                    Enabled = true,
                    Parent = Value
                })
            end
        end)
        TweenService:Create(Tint, Constants.TweenInfo, { BackgroundTransparency = 0.5 }):Play()
        TweenService:Create(Blur, Constants.TweenInfo, { Size = 50 }):Play()
        for Index, Value in Intro.Text do
            if Value.Stroke then
                TweenService:Create(Value.Stroke, Constants.TweenInfo, { Transparency = 0 }):Play()
            end
            if Index == "GachaLife" then
                TweenService:Create(Value, Constants.TweenInfo, { TextTransparency = 0 }):Play()
                task.wait(0.05)
            elseif Index == "CheatName" then
                TweenService:Create(Value, Constants.TweenInfo, { TextTransparency = 0 }):Play()
            elseif Index == "Description" then
                TweenService:Create(Value, Constants.TweenInfo, { TextTransparency = 0 }):Play()
            end
        end

        -- undetected  ( for those who will harass me that also takes roblox exploiting seriously this is a joke if you can't tell yet remove it if you wish. )
        clonefunction(clonefunction(clonefunction(task.wait)))(5)

        -- out animations and clean up

        for Index, Value in Intro.Text do
            if Value.Stroke then
                TweenService:Create(Value.Stroke, Constants.TweenInfo, { Transparency = 1 }):Play()
            end
            if Index == "GachaLife" then
                local Tween = TweenService:Create(Value, Constants.TweenInfo, { TextTransparency = 1 }):Play()
            elseif Index == "CheatName" then
                local Tween = TweenService:Create(Value, Constants.TweenInfo, { TextTransparency = 1 }):Play()
            elseif Index == "Description" then
                local Tween = TweenService:Create(Value, Constants.TweenInfo, { TextTransparency = 1 }):Play()
            end
        end
        TweenService:Create(Tint, Constants.TweenInfo, { BackgroundTransparency = 1 }):Play()
        TweenService:Create(Blur, Constants.TweenInfo, { Size = 0 }):Play()

        task.delay(1.2, function()
            ScreenGui:Destroy()
        end)
    end
end
