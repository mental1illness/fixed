--// Example, do whatever you want with this
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/mental1illness/fixed/refs/heads/main/modified_nhack/source.luau"))()
local Window = Library:Window({})
local Watermark = Library:Watermark({
    Name = "hebrewhack"
})

local Page = Window:Page({ Name = "Main" })
local SubPage = Page:SubPage({ Name = "Combat" })

local LeftSection = SubPage:Section({ Name = "Aimbot", Side = 1 })
local RightSection = SubPage:Section({ Name = "Visuals", Side = 2 })

LeftSection:Toggle({
    Name = "Enable Aimbot",
    Flag = "AimbotEnabled",
    Default = false,
    Callback = function(Value)
    end
}):Settings()

LeftSection:Slider({
    Name = "FOV",
    Flag = "AimbotFOV",
    Default = 90,
    Min = 1,
    Max = 360,
    Decimals = 0,
    Suffix = "",
    Callback = function(Value)
    end
})

RightSection:Toggle({
    Name = "ESP",
    Flag = "ESPEnabled",
    Default = false,
    Callback = function(Value)
    end
})

Library:Notification("hebrewhack Loaded", 3, Library.Theme["Accent"])

Window:CreateSettingsPage()
