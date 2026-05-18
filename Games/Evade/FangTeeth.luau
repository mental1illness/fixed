--ทําไม!!! ทําไมต้องทํา สิ่งนี้ด้วย!! ; translation: why!!! why do i have to do this!!
-- dexsai told me to make a some kind of cheat for this game i didnt really get to finish it so here it is!
-- (FUN FACT: This script has probably the best looking code out of all the cheats for Evade and mainly for evade. yes I am not talking about Project Aurora.)
--[[
    Logs:
        Coded the base, 
]]

local workspaceService  = cloneref(game:GetService("Workspace"));
local playersService    = cloneref(game:GetService("Players"));
local replicatedStorage = cloneref(game:GetService("ReplicatedStorage"));
local runService        = cloneref(game:GetService("RunService"));
local inputService      = cloneref(game:GetService("UserInputService"));

local startTime = tick();

local tableInsert = table.insert;
local tableSort   = table.sort;

local tableFind   = table.find;
local taskSpawn   = task.spawn;

local stringFind  = string.find;
local stringUpper = string.upper;
local stringSub   = string.sub;

local taskDelay   = task.delay;
local taskWait    = task.wait;

local mathRandom = math.random;

local isA         = game.IsA;

local findFirstChild = game.FindFirstChild;
local findFirstChildOfClass = game.FindFirstChildOfClass;

local isKeyDown = inputService.IsKeyDown;
local getMouseDelta = inputService.GetMouseDelta;

local localPlayer       = playersService.LocalPlayer;

local playersContainer  = findFirstChild(workspaceService, "Game").Players;

local modules           = {
    ["characterUtils"]  = require(replicatedStorage.Modules.Character.CharacterTable);
};

local client            = {
    ["localModules"] = nil;
    ["states"]       = {
        ["keys"]     = {
            ["A"] = false;
            ["D"] = false;
        }
    }
};

local constants         = {
    ["keys"] = {
        ["A"] = 0x41;
        ["D"] = 0x44;
    }
}

-- ใช้ เวลาแค่ 1 ช.ม. เท่านั้น ทําไม ต้องทํากับนํ้า อย่างนี้ด้วย!!!! :CCCCCCCCCCCCCCCCCCCCC
local old; old = hookfunction(modules["characterUtils"].GetLocalCharacter, newcclosure(function(...)
    local toReturn = old(...)
    if toReturn and toReturn["LocalModules"] then
        -- setclipboard(table.tostring(toReturn))
        client["localModules"] = toReturn["LocalModules"]
    end
    return toReturn
end))

local library = loadstring( request({ Url = "https://raw.githubusercontent.com/mental1illness/storage/refs/heads/main/libraries/linoria/source.lua" }).Body )()
local themeManager = loadstring( request({ Url = "https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/refs/heads/main/addons/ThemeManager.lua" }).Body )()
local saveManager  = loadstring( request({ Url = "https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/refs/heads/main/addons/SaveManager.lua" }).Body )()

local options = getgenv().Options;
local toggles = getgenv().Toggles;
local window = library:CreateWindow({ Title = 'fang.teeth', Center = true, AutoShow = true, TabPadding = 5, MenuFadeTime = 0.2 }) do
    local tabs = {
        ["main"] = window:AddTab('Main'),
        ["settings"] = window:AddTab('Settings'),
    } do
        do -- main tab
            local tab = tabs["main"];
            local leftGroupBox = tab:AddLeftGroupbox("Main");
            local rightGroupBox = tab:AddRightGroupbox("Extra");
            do -- leftGroupBox
                leftGroupBox:AddToggle('mainAutoHop', { Text = 'Auto Hop', Default = false, Tooltip = 'Automatically jumps for you when SpaceBar is held down.' });
                leftGroupBox:AddToggle('mainAutoStrafe', { Text = 'Auto Strafe', Default = false, Tooltip = 'Automatically strafes for you when your camera has been turned.' }):AddKeyPicker('mainAutoStrafeKey', { Default = 'Space', Text = 'Auto Strafe Key', SyncToggleState = false, Mode = 'Hold' }) -- sync toggle state actually makes it look like dollar store ui
                leftGroupBox:AddDropdown('mainAutoStrafePreset', { Values = {"Forward", "Backward", "Automatic"}, Default = 1, Multi = false, Text = 'Auto Strafe Type', Tooltip = 'Select the auto strafe type you need.' });
            end
            do -- rightGroupBox
               --[[ local modifyAirAcceleration = rightGroupBox:AddToggle("extraModifyAirAcceleration", {
                    Text = "Modify Air Acceleration",
                    Default = false,
                    Tooltip = 'Modifies the air acceleration so you can strafe easier, faster in the air.'
                });
                local depBox1 = rightGroupBox:AddDependencyBox()
                depBox1:AddSlider("extraModifyAirAccelerationValue", {
                    Text = "Value",
                    Default = 1,
                    Min = 0,
                    Max = 10,
                    Rounding = 0,
                })
                depBox1:SetupDependencies({
                    { toggles.extraModifyAirAcceleration, true },
                })]]
            end

        end

        do -- settings tab
            local menuGroup = tabs["settings"]:AddLeftGroupbox('Menu')
            menuGroup:AddButton('Unload', function() library:Unload() end)
            menuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'RightControl', NoUI = true, Text = 'Menu keybind' })
            library.ToggleKeybind = options.MenuKeybind

            themeManager:SetLibrary(library)
            saveManager:SetLibrary(library)
            saveManager:IgnoreThemeSettings()
            saveManager:SetIgnoreIndexes({ 'MenuKeybind' })
            themeManager:SetFolder('fangOwO')
            saveManager:SetFolder('fangOwO/saves')

            saveManager:BuildConfigSection(tabs["settings"])
            themeManager:ApplyToTab(tabs["settings"])
            saveManager:LoadAutoloadConfig()
        end

    end
end

local utils = {}; do
    utils.getNextBot = function() -- idk
        local nextbots = {};
        for index, value in playersContainer:GetChildren() do
            
        end
    end
    utils.getMoveDirection = function(rootPart)
        local velocity = rootPart.AssemblyLinearVelocity
        local flatVelocity = Vector3.new(velocity.X, 0, velocity.Z)

        if flatVelocity.Magnitude > 0.1 then
            return flatVelocity.Unit
        end

        return Vector3.zero
    end
end
library:GiveSignal(runService.RenderStepped:Connect(function(DeltaTime)
    local mouseDelta = getMouseDelta(inputService)
    local character  = localPlayer.Character
    if character then
        if toggles.mainAutoHop.Value then -- we dont return this just incase we need to add something else
            if client and client["localModules"] and isKeyDown(inputService, "Space") then
                client["localModules"]["Movement"].JumpHeldDown = false
                client["localModules"]["Movement"]:JumpReact(true)
            end
        end

        if toggles.mainAutoStrafe.Value and options.mainAutoStrafeKey:GetState() then -- holy shit this took hours
            local currentDirection = mouseDelta.X > 0.25 and "Right" or mouseDelta.X < -0.25 and "Left" or "None"
            local preset = options.mainAutoStrafePreset.Value

            if preset == "Automatic" then
                local dot = utils.getMoveDirection(character.HumanoidRootPart):Dot(character.HumanoidRootPart.CFrame.LookVector)
                preset = dot > 0.5 and "Forward" or dot < -0.5 and "Backward" or "None"
            end

            local pressA = (preset == "Backward" and currentDirection == "Right") or (preset == "Forward" and currentDirection == "Left")
            local pressD = (preset == "Backward" and currentDirection == "Left") or (preset == "Forward" and currentDirection == "Right")
            
            if pressA then
                if client["states"]["keys"]["D"] then keyrelease(constants["keys"]["D"]) client["states"]["keys"]["D"] = false end
                if not client["states"]["keys"]["A"] then keypress(constants["keys"]["A"]) client["states"]["keys"]["A"] = true end
            elseif pressD then
                if client["states"]["keys"]["A"] then keyrelease(constants["keys"]["A"]) client["states"]["keys"]["A"] = false end
                if not client["states"]["keys"]["D"] then keypress(constants["keys"]["D"]) client["states"]["keys"]["D"] = true end
            else
                if client["states"]["keys"]["A"] then keyrelease(constants["keys"]["A"]) client["states"]["keys"]["A"] = false end
                if client["states"]["keys"]["D"] then keyrelease(constants["keys"]["D"]) client["states"]["keys"]["D"] = false end
            end
        else
            if client["states"]["keys"]["A"] then keyrelease(constants["keys"]["A"]) client["states"]["keys"]["A"] = false end
            if client["states"]["keys"]["D"] then keyrelease(constants["keys"]["D"]) client["states"]["keys"]["D"] = false end
        end
    end
end))

do -- hooks
    
end
