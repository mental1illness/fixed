-- yall niggas retarded for actually not figuring this out (Especially all the script that replaces model to be more specified Exceptional.Dev, wyvern)
-- ok well it doesn't matter here it is

local HttpService       = cloneref(game:GetService("HttpService"));
local ReplicatedStorage = cloneref(game:GetService("ReplicatedStorage"));
local Players           = cloneref(game:GetService("Players"));
local Client            = { Player = Players.LocalPlayer }

Client["IsAlive"] = function()
    if not Client.Player.Character then return false end
    if Client.Player:GetAttribute("IsSpectating") == true then 
        return false 
    else 
        return true 
    end
    return true
end

Client["IsBusy"] = function()
    if workspace:GetAttribute("GameState") == "Map Voting" then return true end
    return false
end

local InventoryController = require(ReplicatedStorage.Controllers.InventoryController);
local SkinsModule         = require(ReplicatedStorage.Database.Components.Libraries.Skins)

local Old; Old = hookfunction(SkinsModule.GetGloves, newcclosure(function(...)
    local _Arguments = {...}
    if Client.IsAlive() and not Client.IsBusy() then
        if _Arguments[1] == "T Glove" then
            _Arguments[1] = "Driver Gloves";
            _Arguments[2] = "Leopard";
        elseif _Arguments[1] == "CT Glove" then
            _Arguments[1] = "Driver Gloves";
            _Arguments[2] = "Leopard";
        end
    end

    return Old(table.unpack(_Arguments))
end))

local Old; Old = hookfunction(InventoryController.newInventoryItem, newcclosure(function(Data, ...)
    if Data._id and Data.weapon and Data.skin then
        
        if Data.weapon == "CT Knife" then
            Data.weapon = "Butterfly Knife";
            Data.skin = "Tiger Stripes";
            Data._id = "Butterfly Knife_Stock";
        elseif Data.weapon == "T Knife" then
            Data.weapon = "Butterfly Knife";
            Data.skin = "Tiger Stripes";
            Data._id = "Butterfly Knife_Stock";
        end

        if Data["OriginalOwner"] == nil or Data["OriginalOwner"] == Client.Player then
            if Data["weapon"] == "Glock-18"  then
                Data.skin = "Fade";
            end
        end

    end
    return Old(Data, ...)
end))

task.spawn(function(...)
    local Thread = coroutine.create(function()
        setthreadidentity(1)

        if not InventoryController.getCurrentEquipped() then return end

        local Name = nil;
        local _ID = nil;
        local Skin = "Stock";
        local Float = 0;
        local Identifier = nil;

        local Inventory = InventoryController.getCurrentInventory()
        for Index, Value in Inventory do
            if Index == 3 and Value and Value._items then
                local ItemsProperties = Value._items[1];
                Name = ItemsProperties.Name;
                _ID = ItemsProperties._id;
                Identifier = ItemsProperties.Identifier;
                Skin = ItemsProperties.Viewmodel.Skin;
                Float = ItemsProperties.Viewmodel.Float;
                break
            end
        end

        InventoryController.removeInventoryItem(Identifier)
        InventoryController.newInventoryItem({
            slot = 3,
            identifier = Identifier, -- "This can be anything actually",
            _id = _ID,
            weapon = Name,
            skin = Skin,
            Float = Float,
            StatTrack = 0,
            NameTag = nil,-- "Dragon Lore Nigga",
            OriginalOwner = nil, -- Client,
            Charm = {},
            Stickers = {},
            customProperties = nil,
            shouldEquip = true -- false
        })
    end)
    coroutine.resume(Thread)
end)
