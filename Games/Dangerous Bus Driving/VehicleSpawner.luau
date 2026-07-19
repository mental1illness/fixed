-- omggg flohack source code
local CARMENUBUTTONCLICKED = game:GetService("ReplicatedStorage").CarMenuButtonClicked
local Vehicles = {
    "Buggy",
    "Bus",
    "CityBus",
    "Coach",
    "MiniBus",
    "ShoppingCart",
    "SportsCar",
    "SportsCar2"
}
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))();
do     --
    local Window = Library.CreateLib("Flohaxx", "DarkTheme")
    do --
        local Tab = Window:NewTab("Main")
        local Section = Tab:NewSection("Spawner")
        local VehicleChose = "Buggy"
        Section:NewDropdown("Vehicles Choice", "_____", Vehicles, function(Option)
            VehicleChose = Option
        end)
        Section:NewButton("Spawn Vehicle", "spawnshit", function()
            CARMENUBUTTONCLICKED:FireServer(
                VehicleChose,
                "Spawn1"
            )
        end)
    end
end
