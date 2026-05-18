--[[
    This script was made at midnight so please respect my sober code. (its better than half of my enemies code anyways)
        MADE POSSIBLE BY USING
            1. HYDROXIDE;
            2. LOW IQ BRAIN;
            3. DEX ++; (i love you so much)
        --
    --
    @mental1illness
]]

-- OK! THANK YOUIUUU And.. fang teeth fang.teeth.. get it? fang tooth.. adorable! I'll provide an image!

local startTime = tick();

local tableInsert = table.insert;
local tableSort   = table.sort;
local tableRemove = table.remove;

local tableFind   = table.find;
local taskSpawn   = task.spawn;

local stringFind  = string.find;
local stringUpper = string.upper;
local stringSub   = string.sub;

local taskDelay   = task.delay;
local taskWait    = task.wait;

local mathRandom = math.random;

local isA         = game.IsA;

local findFirstChildOfClass = game.FindFirstChildOfClass
local findFirstChild = game.FindFirstChild

local playersService = cloneref(game:GetService("Players"));
local replicatedStorage = cloneref(game:GetService("ReplicatedStorage"));
local runService = cloneref(game:GetService("RunService"));
local virtualUser = cloneref(game:GetService("VirtualUser"))

local localPlayer = playersService.LocalPlayer;
local playerGui = localPlayer.PlayerGui;

repeat task.wait() until #localPlayer.PlayerGui.Main.Upgrades.ScrollingFrame:GetChildren() > 5

local gameData = getrenv()._G;

local diceData = require(replicatedStorage.Modules.DiceData);
local eggData = require(replicatedStorage.Modules.PetConfig.EggData);
local codeReference = require(replicatedStorage.Modules.CodeRef);

local diceKeys = {};
local eggKeys = {};
local gemsData = {
    "AbnormalLuckyBlock";
    "+EquipSlot";
    "AutoSkip";
    "EggLuck";
    "FastHatch";
    "GalaxyLuckyBlock";
    "NullLuckyBlock";
    "SuperEggLuck";
    "VIP";
};
local merchantBullshit = {
    "BasicBox";
    "LegendaryBox";
    "RareBox";
    "SupremeBox";

};
local upgradeType = {};
local potions = {};
local tools = {};

for Index, Value in replicatedStorage.Assets.Potions:GetChildren() do
    if stringFind(Value.Name, "Potion") then
        tableInsert(potions, Value.Name)
    end
    tableInsert(tools, Value.Name)
end

for Index, Value in replicatedStorage.Assets.Potions:GetChildren() do
    local name = Value.Name

    if not tableFind(tools, name) then
        if stringFind(name, "Potion") then
            tableInsert(potions, name)
        end
        tableInsert(tools, name)
    end
end

for Index, Value in localPlayer.PlayerGui.Main.Upgrades.ScrollingFrame:GetChildren() do
    if isA(Value, "Frame") and Value.Name ~= "Template" then
        tableInsert(upgradeType, Value.Name)
    end
end

for Index, Value in diceData do
    tableInsert(diceKeys, Index)
end

for Index, Value in eggData do
    tableInsert(eggKeys, Index)
end

tableSort(diceKeys, function(firstDice, secondDice)
    return diceData[firstDice].Layout_Order < diceData[secondDice].Layout_Order
end)

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
                leftGroupBox:AddToggle('mainAutoRoll', { Text = 'Auto Roll', Default = false, Tooltip = 'Automatically rolls your current dices and skip every single cutscene.' });
                leftGroupBox:AddToggle('mainAutoEquipBestDice', { Text = 'Auto Equip Best Dice', Default = false, Tooltip = "Will automatically equip the best dice avaliable in user's inventory." });
                leftGroupBox:AddToggle('mainAutoBuyDice', { Text = 'Auto Buy Dice', Default = false, Tooltip = "Will automatically buy dice selected by user's choice." });
                leftGroupBox:AddDropdown('mainDicesToBuy', { Values = diceKeys, Default = 1, Multi = true, Text = 'Dices To Buy', Tooltip = 'Select the dices you need.' });
                leftGroupBox:AddToggle('mainAutoBuyAllDice', { Text = 'Auto Buy All Dice', Default = false, Tooltip = "Skips the choices and buy every single dices avaliable in stock." });
                leftGroupBox:AddToggle('mainAutoUpgrade', { Text = 'Auto Upgrade', Default = false, Tooltip = "Will automatically upgrade by the selected by user's choice." });
                leftGroupBox:AddDropdown('mainThingsToUpgrade', { Values = upgradeType, Default = 1, Multi = true, Text = 'To Upgrade', Tooltip = 'Select the upgrades you need.' });
                leftGroupBox:AddToggle('mainAutoEquipBestBaddies', { Text = 'Auto Equip Best Baddies', Default = false, Tooltip = "Will automatically equip the best baddies." });
                leftGroupBox:AddToggle('mainAutoSellAllBaddies', { Text = 'Auto Sell All Baddies', Default = false, Tooltip = "Will sell every single things in your inventory. (AUTO EQUIP IS RECOMMANDED TO BE ENABLED FOR THIS!)" });
                leftGroupBox:AddSlider('mainMinBaddiesBeforeSelling', {Text = 'Minimum Baddies Before Selling', Default = 100, Min = 1, Max = 1000, Rounding = 0, Compact = false, })
                leftGroupBox:AddSlider('mainMinBaddiesInPlotBeforeSelling', {Text = 'Minimum Baddies Must Be In Plot Before Selling', Default = 22, Min = 1, Max = 100, Rounding = 0, Compact = false })
            end

            do -- rightGroupBox
                rightGroupBox:AddToggle('extraAutoClaimAll', { Text = 'Auto Claim All', Default = false, Tooltip = 'Automatically claims the avaliable rewards.' });
                rightGroupBox:AddDropdown('extraThingsToClaim', { Values = {'Time Rewards', 'Indexes'}, Default = 1, Multi = true, Text = 'To Claim', Tooltip = 'Select the upgrades you need.' });
                rightGroupBox:AddToggle('extraAutoClaimAllCodes', { Text = 'Auto Claim All Codes', Default = false, Tooltip = 'Automatically claims the avaliable non-expired avaliable codes.' });
                rightGroupBox:AddToggle('extraAutoSpinWheel', { Text = 'Auto Spin Wheel', Default = false, Tooltip = "Automatically spin the wheel for you." });
                rightGroupBox:AddToggle('extraAutoPotionsBuy', { Text = 'Auto Potions Buy', Default = false, Tooltip = "Automatically buys the potions by user's choice." });
                rightGroupBox:AddDropdown('extraPotionsToBuy', { Values = potions, Default = 1, Multi = true, Text = 'To Potions Buy', Tooltip = 'Select the potions you need.' });
                
                rightGroupBox:AddToggle('extraAutoGemsShopBuy', { Text = 'Auto Buy From Gems Shop', Default = false, Tooltip = "Automatically buys the stuff from the gems shop by user's choice." });
                rightGroupBox:AddDropdown('extraGemsShopToBuy', { Values = gemsData, Default = 1, Multi = true, Text = 'To Buy', Tooltip = 'Select the stuff you need.' });
                
                rightGroupBox:AddToggle('extraAutoUse', { Text = 'Auto Use', Default = false, Tooltip = "Automatically use the equipped tool." });
                rightGroupBox:AddDropdown('extraToUse', { Values = tools, Default = 1, Multi = true, Text = 'To Use', Tooltip = 'Select the tools you need to use.' });

                leftGroupBox:AddToggle('extraAutoHatchEggs', { Text = 'Auto Hatch Egg (s)', Default = false, Tooltip = 'Automatically rolls your current dices and skip every single cutscene.' });
                leftGroupBox:AddDropdown('extraToHatchEggs', { Values = eggKeys, Default = 1, Multi = true, Text = 'Eggs To Hatch', Tooltip = 'Select the eggs you need.' });

                rightGroupBox:AddToggle('extraAutoRebirth', { Text = 'Auto Rebirth', Default = false, Tooltip = "Automatically rebirth for you. (This will run at last but still pretty dangerous.)" });

                rightGroupBox:AddToggle('extraAutoBuyMerchant', { Text = 'Auto Buy From Merchant', Default = false, Tooltip = "Automatically buy stuff from the merchant." });
                rightGroupBox:AddDropdown('extraMerchantShopToBuy', { Values = merchantBullshit, Default = 1, Multi = true, Text = 'To Buy', Tooltip = 'Select the stuff you need.' });

                rightGroupBox:AddSlider('extraLoopDelays', {Text = 'Delay', Default = 0.1, Min = 0.05, Max = 1, Rounding = 3, Compact = false, })
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

-- workspace.CurvyBodies["Luck Potion 1"]:Activate()

local utils = {}; do
    function utils.buyStuff(diceName: string, amount: number, thingsType: string)
        local SelectedDice = diceName or diceKeys[1];
        local PurchaseAmount = amount or 1;
        local ItemType = thingsType;

        replicatedStorage.Events.buy:InvokeServer(SelectedDice, PurchaseAmount, ItemType);
    end

    function utils.rollDice()
        playerGui.Main.Dice.RollState:InvokeServer();
    end

    function utils.sellAllBaddies()
        return replicatedStorage.Events.sell:InvokeServer("all");
    end

    function utils.upgradePlayer(upgradeType: string)
        local UpgradeChoice = upgradeType or "PlayerLuck"
        replicatedStorage.Events.upgrade:InvokeServer(UpgradeChoice);
    end

    function utils.claimAll(_type: string)
        if _type == "timeReward" then
            for RewardIndex = 1, 9 do
                replicatedStorage.Events.ClaimTimeReward:InvokeServer(RewardIndex);
            end
        elseif _type == "indexes" then
            replicatedStorage.Events.claimAll:InvokeServer();
        end
    end

    function utils.getBestDice() -- OK i didnt know something this simple TAKES 5 FKUCKING HOURS!!
        local bestDice = nil;
        local highestLuck = 0;
        
        for diceName, diceAmount in next, gameData.Profile.Data.dices do
            if diceAmount > 0 then
                local diceInfo = diceData[diceName];
                if diceInfo and diceInfo.Luck_Percentage > highestLuck then
                    bestDice = diceName;
                    highestLuck = diceInfo.Luck_Percentage;
                end
            end
        end
        
        return bestDice, highestLuck
    end

    function utils.getInventoryCount()
        local count = 0;
        local inventory = gameData.Profile.Data.inv.unique; -- theres no index so i cant just do #T (theres only keys)
        for index, value in inventory do
            count += 1;
        end
        return count
    end

    function utils.doesToolExist(toolName: string)
        if toolName then
            local toolData = gameData.Profile.Data.inv.stackable[toolName];
            if toolData then
                return true, toolData;
            end
        end
        return false, nil;
    end

    function utils.getBaddiesCount()
        local baddies = gameData.Profile.Data.Baddies
        local count = 0
        for index, value in baddies do
            count += 1
        end
        return count
    end
end

local favorited = {}; 
local toUnFavoriteBitch = {};

local lastFired       = 0
local lastHeartbeat   = 0
local okDontEquipAll  = false

runService.Heartbeat:Connect(function()
    if tick() - lastHeartbeat < 0.5 then return end
    lastHeartbeat = tick()

    if toggles.mainAutoRoll.Value then
        utils.rollDice()
    end

    if toggles.mainAutoEquipBestDice.Value then
        local diceName = utils.getBestDice()
        if diceName and diceName ~= gameData.Profile.Data.equipped then
            replicatedStorage.Events.updateRollingDice:FireServer(diceName)
        end
    end

    if toggles.extraAutoSpinWheel.Value then
        replicatedStorage.Events.spinrequest:InvokeServer()
    end

    if toggles.extraAutoRebirth.Value then
        replicatedStorage.Events.rebirth:InvokeServer()
    end
end)

runService.RenderStepped:Connect(function()
    if tick() - lastFired < options.extraLoopDelays.Value then return end
    lastFired = tick()

    local inPlot = {};
    if gameData.Profile.Data.Baddies then
        for index, value in gameData.Profile.Data.Baddies do
            inPlot[value.id] = true
            if not favorited[value.id] then
                replicatedStorage.Events.fav:InvokeServer(value.id, true)
                favorited[value.id] = true
            end
            toUnFavoriteBitch[value.id] = nil
        end
    end

    if gameData.Profile.Data.inv.unique then
        for uid in gameData.Profile.Data.inv.unique do
            if favorited[uid] and not inPlot[uid] then
                if not toUnFavoriteBitch[uid] then
                    toUnFavoriteBitch[uid] = tick()
                end
            end
        end
    end

    for uid, time in toUnFavoriteBitch do
        if tick() - time > 3 then
            replicatedStorage.Events.fav:InvokeServer(uid, false)
            favorited[uid] = nil
            toUnFavoriteBitch[uid] = nil
        end
    end

    local character = localPlayer.Character

    if not toggles.mainAutoBuyAllDice.Value then
        if toggles.mainAutoBuyDice.Value then
            local inStock = gameData.Profile.Data.dice_stock
            local toGet = options.mainDicesToBuy.Value
            for diceName, diceAmount in inStock do
                if toGet[diceName] and diceAmount > 0 then
                    utils.buyStuff(diceName, 1, "dice")
                end
            end
        end
    else
        replicatedStorage.Events.BatchBuyDice:InvokeServer()
    end

    if toggles.extraAutoGemsShopBuy.Value then
        for gamepassName in options.extraGemsShopToBuy.Value do
            replicatedStorage.Events.gemPurchase:InvokeServer(gamepassName)
        end
    end

    if toggles.extraAutoBuyMerchant.Value then
        for shopName in options.extraMerchantShopToBuy.Value do
            replicatedStorage.Events.gemPurchase:InvokeServer(shopName)
        end
    end
    
    if toggles.extraAutoClaimAllCodes.Value then
        for codeName, codeData in codeReference do
            if not codeData["Expired"] then
                replicatedStorage.Events.CodeSubmit:InvokeServer(codeName)
            end
        end
    end

    if toggles.mainAutoUpgrade.Value then
        for name in options.mainThingsToUpgrade.Value do
            utils.upgradePlayer(name)
        end
    end

    if toggles.mainAutoSellAllBaddies.Value then
        if utils.getBaddiesCount() >= options.mainMinBaddiesInPlotBeforeSelling.Value then
            if utils.getInventoryCount() >= options.mainMinBaddiesBeforeSelling.Value then
                library:Notify('selling baddies..', 5)
                local result = utils.sellAllBaddies()
                okDontEquipAll = (result and result.success) or false
            end
        end
    end

    if toggles.mainAutoEquipBestBaddies.Value and not okDontEquipAll then
        replicatedStorage.Events.PlaceBestBaddies:InvokeServer()
    end
    okDontEquipAll = false

    if toggles.extraAutoClaimAll.Value then
        if options.extraThingsToClaim.Value["Time Rewards"] then utils.claimAll("timeReward") end
        if options.extraThingsToClaim.Value["Indexes"] then utils.claimAll("indexes") end
    end

    if toggles.extraAutoPotionsBuy.Value then
        for potionName in options.extraPotionsToBuy.Value do
            utils.buyStuff(potionName, 1, "potion")
        end
    end

    if toggles.extraAutoUse.Value then
        for toolName, bool in options.extraToUse.Value do
            if bool and utils.doesToolExist(toolName) then
                replicatedStorage.Events.equip:InvokeServer(toolName, true)
                if character then
                    local toolInstance = character:FindFirstChildOfClass("Tool")
                    if toolInstance then toolInstance:Activate() end
                end
                break
            end
        end
    end

    if toggles.extraAutoHatchEggs.Value then
        for eggName in options.extraToHatchEggs.Value do
            replicatedStorage.Events.RegularPet:InvokeServer(eggName, 1)
        end
    end
end)

do -- destroy errors
    for index, connection in getconnections(replicatedStorage.Events.bottomnotification.OnClientEvent) do
        local old; old = hookfunction(connection.Function, function(...)
            -- print(`Intercepted (Connection) {Event.Name}.OnClientEvent`, ...)
            local arguments = {...}
            if arguments[2] == "error" then
                return nil
            end

            return old(...)
        end)
    end
    for index, connection in getconnections(replicatedStorage.Events.notification.OnClientEvent) do
        local old; old = hookfunction(connection.Function, function(...)
            -- print(`Intercepted (Connection) {Event.Name}.OnClientEvent`, ...)
            local arguments = {...}
            if arguments[2] == "error" then
                return nil
            end

            return old(...)
        end)
    end
end

playersService.LocalPlayer.Idled:Connect(function()
    virtualUser:CaptureController()
    virtualUser:ClickButton2(Vector2.new())
end)

do -- init notification
    library:Notify('Took ' .. (tostring(math.floor(tick() - startTime))) .. 's to load.', 5);
    library:Notify('Welcome to fang.teeth, ' .. localPlayer.Name .. ".", 5);
    taskSpawn(function()
        local windowName = "fang.teeth"

        while taskWait(1) do
            local result = ""
            for i = 1, #windowName do
                local char = stringSub(windowName, i, i)
                result ..= mathRandom(0, 1) == 0 and stringUpper(char) or char
            end
            window:SetWindowTitle(result)
        end
    end)
end
