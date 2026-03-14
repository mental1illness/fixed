-- this is still a shit code theres no automatic scaling like my love (swimhub)
-- edit: nevermind there is an automatic scaling sorry i forgot why i named it larpvision tbh i think it was my deadline cheat project lol

local Utility = {
    ["Elements"] = loadstring(game:HttpGet("https://raw.githubusercontent.com/mental1illness/modules/refs/heads/main/elements.lua"))();
}
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
    
    local Tahoma = Register_Font("Taahouma", 100, "Normal", {
        Id = "TouhouMa.ttf";
        Font = game:HttpGet("https://github.com/mental1illness/storage/raw/refs/heads/main/fonts/old-tahoma.ttf");
    })
    Fonts = {
        ["Tahoma"] = Font.new(Tahoma, Enum.FontWeight.Regular, Enum.FontStyle.Normal);
    }
end
do
    local Watermark = Utility.Elements:Create("ScreenGui", {
        Name = "Watermark",
        DisplayOrder = 900,
        IgnoreGuiInset = true,
        ResetOnSpawn = false,
    }, gethui() or game.CoreGui)

    local Holder = Utility.Elements:Create("Frame", {
        Name = "Holder",
        AnchorPoint = Vector2.new(0.1, 0.1),
        Position = UDim2.new(0.1, 0, 0.1, 0),
        Size = UDim2.new(0, 150, 0, 40),
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(24, 25, 27)
    }, Watermark)
    Utility.Elements:Dragify(Holder)

    Utility.Elements:Create("UIStroke", {
        Color = Color3.fromRGB(225, 102, 102),
        LineJoinMode = Enum.LineJoinMode.Miter
    }, Holder)

    local Up = Utility.Elements:Create("Frame", {
        Name = "Up",
        Size = UDim2.new(1, 0, 0, 20),
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(19, 19, 19)
    }, Holder)

    local Title = Utility.Elements:Create("TextLabel", {
        Name = "Title",
        RichText = true,
        Text = 'larp<font color="rgb(227, 101, 102)">vision</font>',
        FontFace = Fonts["Tahoma"],
        TextColor3 = Color3.fromRGB(208, 208, 208),
        TextSize = 12,
        Size = UDim2.new(0.2, 0, 0.25, 0),
        AnchorPoint = Vector2.new(0.05, 0.5),
        Position = UDim2.new(0.05, 0, 0.5, 0),
        BackgroundTransparency = 1,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 3
    }, Up)

    local Name_Shadow = Utility.Elements:Create("TextLabel", {
        Name = "shadow",
        RichText = true,
        Text = "larpvision",
        FontFace = Fonts["Tahoma"],
        TextColor3 = Color3.fromRGB(0, 0, 0),
        TextSize = 12,
        Size = UDim2.new(1, 0, 1, 0),
        Position = UDim2.new(0, 1, 0, 1),
        BackgroundTransparency = 1,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 2
    }, Title)

    local BuildTop = Utility.Elements:Create("TextLabel", {
        Name = "Build",
        RichText = true,
        Text = '<font color="rgb(227, 101, 102)">private</font>',
        FontFace = Title.FontFace,
        TextColor3 = Color3.fromRGB(207, 207, 207),
        TextSize = 12,
        Size = UDim2.new(0.2, 0, 0.25, 0),
        AnchorPoint = Vector2.new(0.95, 0.5),
        Position = UDim2.new(0.95, 0, 0.5, 0),
        BackgroundTransparency = 1,
        TextXAlignment = Enum.TextXAlignment.Right,
        ZIndex = 3
    }, Up)

    Utility.Elements:Create("TextLabel", {
        Name = "shadow",
        RichText = true,
        Text = "private",
        FontFace = Title.FontFace,
        TextColor3 = Color3.fromRGB(0, 0, 0),
        TextSize = 12,
        Size = UDim2.new(1, 0, 1, 0),
        Position = UDim2.new(0, 1, 0, 1),
        BackgroundTransparency = 1,
        TextXAlignment = Enum.TextXAlignment.Right,
        ZIndex = 2
    }, BuildTop)

    local Down = Utility.Elements:Create("Frame", {
        Name = "Down",
        AnchorPoint = Vector2.new(0.5, 1),
        Position = UDim2.new(0.5, 0, 1, 0),
        Size = UDim2.new(1, 0, 0.5, 0),
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(27, 27, 27),
        ZIndex = 4
    }, Holder)

    local Info = Utility.Elements:Create("TextLabel", {
        Name = "Build",
        RichText = true,
        Text = "ping: 0 | 10/2 21:39",
        FontFace = Title.FontFace,
        TextColor3 = Color3.fromRGB(207, 207, 207),
        TextSize = 12,
        Size = UDim2.new(1, 0, 0.5, 0),
        AnchorPoint = Vector2.new(1, 1),
        Position = UDim2.new(1, 0, 0.7, 0),
        BackgroundTransparency = 1,
        ZIndex = 5
    }, Down)

    local Info_Shadow = Utility.Elements:Create("TextLabel", {
        Name = "Build",
        RichText = true,
        Text = Info.Text,
        FontFace = Title.FontFace,
        TextColor3 = Color3.fromRGB(0, 0, 0),
        TextSize = 12,
        Size = UDim2.new(1, 0, 1, 0),
        Position = UDim2.new(0, 1, 0, 1),
        BackgroundTransparency = 1,
        ZIndex = 4
    }, Info)

    Utility.Elements:Create("Frame", {
        Name = "Effect2",
        Rotation = -15,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.492165, 0, 0.50548, 0),
        Size = UDim2.new(0, 54, 0, 26),
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(22, 22, 22)
    }, Holder)

    Utility.Elements:Create("Frame", {
        Name = "Effect1",
        Rotation = 50,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.906156, 0, 0.532992, 0),
        Size = UDim2.new(0, 16, 0, 19),
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(22, 22, 22)
    }, Holder)
    do
        local Padding = 20
        local Minimum_Width = 150

        local function UpdateSize()
            local TopWidth =
                Title.TextBounds.X +
                BuildTop.TextBounds.X +
                Padding * 2

            local BottomWidth =
                Info.TextBounds.X +
                Padding * 2

            local width = math.max(Minimum_Width, TopWidth, BottomWidth)
            Holder.Size = UDim2.new(0, math.ceil(width), 0, 40)
        end

        local Accent = Color3.fromRGB(255, 165, 0)
        local Accent2 = Color3.fromRGB(255, 127, 80)

        local RunService = game:GetService("RunService")
        local Tick = 0
        local Timer = 0

        local FirstLetter = "larp"
        local SecondLetter = "vision"

        Info.Text = "ping: " .. math.floor(game:GetService("Players").localPlayer:GetNetworkPing() * 1000) .. " | " .. os.date("%d/%m %H:%M")
        RunService.RenderStepped:Connect(function(DeltaTime)
            Timer += DeltaTime * 1.5
            local haxx = ""
            for i = 1, #SecondLetter do
                local a = (math.sin(Timer + i * 0.35) + 1) * 0.5
                local c = Accent:Lerp(Accent2, a)
                local ch = SecondLetter:sub(i, i)

                haxx ..=
                    '<font color="rgb(' ..
                    math.floor(c.R * 255) .. ',' ..
                    math.floor(c.G * 255) .. ',' ..
                    math.floor(c.B * 255) ..
                    ')">' .. ch .. '</font>'
            end

            local priv = ""
            for i = 1, 7 do
                local a = (math.sin(Timer + 1.2 + i * 0.35) + 1) * 0.5
                local c = Accent:Lerp(Accent2, a)
                local ch = ("private"):sub(i, i)

                priv ..=
                    '<font color="rgb(' ..
                    math.floor(c.R * 255) .. ',' ..
                    math.floor(c.G * 255) .. ',' ..
                    math.floor(c.B * 255) ..
                    ')">' .. ch .. '</font>'
            end

            Title.Text = FirstLetter .. haxx
            BuildTop.Text = priv
                Tick += DeltaTime
            if Tick >= 1 then
                Tick = 0
                Info.Text = "ping: " .. math.floor(game:GetService("Players").localPlayer:GetNetworkPing() * 1000) .. " / " .. os.date("%d/%m %H:%M") .. " / certified moneyblox paste"
            end
        end)
        Info:GetPropertyChangedSignal("Text"):Connect(function()
            Info_Shadow.Text = Info.Text
        end)
        Title:GetPropertyChangedSignal("Text"):Connect(function()
            Name_Shadow.Text = Title.Text:gsub("<[^>]->", "")
        end)
        Title:GetPropertyChangedSignal("Text"):Connect(UpdateSize)
        BuildTop:GetPropertyChangedSignal("Text"):Connect(UpdateSize)
        Info:GetPropertyChangedSignal("Text"):Connect(UpdateSize)
        UpdateSize()
    end
end
