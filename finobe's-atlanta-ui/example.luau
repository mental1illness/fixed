local Library, Themes       = loadstring(game:HttpGet("https://raw.githubusercontent.com/mental1illness/storage/refs/heads/main/libraries/atlanta/source.lua"))()
local Signal                = loadstring(game:HttpGet("https://raw.githubusercontent.com/mental1illness/modules/refs/heads/main/Signals.lua"))()
local Signals               = {
    ["EspChanged"] = Signal.new(),
}
local Window                = Library:Window({})
local Tabs                  = {
    [1] = {
        Name    = "ESP",
        Object  = Window:Tab({name = "Esp"})
    }

}
local Columns = {
    [1] = {
        Name    = "ESP",
        Left    = Tabs[1].Object:Column(),
        Right   = Tabs[1].Object:Column()
    }
}

-- ESP
do 
    local Left      = Columns[1].Left
    local Right     = Columns[1].Right
    
    local Main        = Left:MultiSection({ Names = {"Enemy", "Team"} })
    local Options     = Right:Section({ Name = "Esp Settings" })
    do
        for Index, Value in Main do
            local TeamFlag = "Enemy"
            if Index == 1 then
                -- Enemy
                TeamFlag = "Enemy"
            elseif Index == 2 then
                -- Team
                TeamFlag = "Team"
            end
            Value:Toggle({ Name = "Enabled", Default = false, Flag = TeamFlag .. "/Enabled", Callback = function(Boolean)
                Signals.EspChanged:Fire(TeamFlag .. "/Enabled", Boolean)
            end })
            Value:Toggle({ Name = "Box", Default = false, Flag = TeamFlag .. "/Box", Callback = function(Boolean)
                Signals.EspChanged:Fire(TeamFlag .. "/Box", Boolean)
            end })

            Value:Toggle({ Name = "Name", Default = false, Flag = TeamFlag .. "/Name", Callback = function(Boolean)
                Signals.EspChanged:Fire(TeamFlag .. "/Name", Boolean)
            end })
            Value:Dropdown({ Name = "Name Side", Items = { "Left", "Right", "Top", "Bottom" }, Flag = TeamFlag .. "/NameSide", Default = "Left", Callback = function(String)
                Signals.EspChanged:Fire(TeamFlag .. "/NameSide", String)
            end })

            Value:Toggle({ Name = "Health Bar", Default = false, Flag = TeamFlag .. "/HealthBar", Callback = function(Boolean)
                Signals.EspChanged:Fire(TeamFlag .. "/HealthBar", Boolean)
            end })
            Value:Dropdown({ Name = "Health Bar Side", Items = { "Left", "Right", "Top", "Bottom" }, Flag = TeamFlag .. "/HealthBarSide", Default = "Left", Callback = function(String)
                Signals.EspChanged:Fire(TeamFlag .. "/HealthBarSide", String)
            end })
        end
    end
end

Library:ConfigListUpdate()
for Index, Value in Themes.Preset do 
	pcall(function()
		Library:UpdateTheme(Index, Value)
	end)
end
task.wait()
Library.OldConfig = Library:GetConfig()
