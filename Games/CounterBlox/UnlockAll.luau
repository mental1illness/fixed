--[[
only the loader was obfuscarted [FUTA],  — Yesterday at 3:05 PM
hello guys its 6/7/2026
local LocalPlayer = game:GetService("Players").LocalPlayer
local Client = getsenv(LocalPlayer.PlayerGui.Client)

local HttpService = game:GetService("HttpService")
local Data = require(game:GetService("ReplicatedFirst").Data)
local ReplicatedStorage = game:GetService("ReplicatedStorage")

message (19).txt
7 KB
counter blox unlock all
please dont judge my code
or i dont care actually
🤦‍♂️
]]

local LocalPlayer = game:GetService("Players").LocalPlayer
local Client = getsenv(LocalPlayer.PlayerGui.Client)

local HttpService = game:GetService("HttpService")
local Data = require(game:GetService("ReplicatedFirst").Data)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local InventoryController = require(ReplicatedStorage.Controllers.InventoryController)

local SkinsTable, CTLoadout, TLoadout = (function()
	local Skins = {}
	for Index, Value in ReplicatedStorage.Skins:GetChildren() do
		if Value:IsA("Folder") then
			local GunName = Value.Name
			for _, Skin in Value:GetChildren() do
				local SkinName = Skin.Name
				if SkinName ~= "Stock" then
					Skins[HttpService:GenerateGUID(false)] = {
						GunName .. "_" .. SkinName
					}
				end
			end
		end
	end

	for Index, Value in ReplicatedStorage.Gloves:GetChildren() do
		if Value:IsA("Folder") and Value.Name ~= "Model" then
			local GloveName = Value.Name
			for _, Skin in Value:GetChildren() do
				local SkinName = Skin.Name
				Skins[HttpService:GenerateGUID(false)] = {
					GloveName .. "_" .. SkinName
				}
			end
		end
	end

	local TWeapons = {
		"Glock", "DualBerettas", "P250", "Tec9", "CZ", "DesertEagle", "R8",
		"Nova", "XM", "SawedOff", "M249", "Negev",
		"MAC10", "MP7", "MP7-SD", "UMP", "P90", "Bizon",
		"Galil", "AK47", "Scout", "SG", "AWP", "G3SG1",
		"Kevlar Vest", "Kevlar + Helmet",
		"Molotov", "Decoy Grenade", "Flashbang", "HE Grenade", "Smoke Grenade"
	}

	local CTWeapons = {
		"P2000", "USP", "DualBerettas", "P250", "FiveSeven", "CZ", "DesertEagle", "R8",
		"Nova", "XM", "MAG7", "M249", "Negev",
		"MP9", "MP7", "MP7-SD", "UMP", "P90", "Bizon",
		"Famas", "M4A4", "M4A1", "Scout", "AUG", "AWP", "G3SG1",
		"Kevlar Vest", "Kevlar + Helmet", "Defuse Kit",
		"Incendiary Grenade", "Decoy Grenade", "Flashbang", "HE Grenade", "Smoke Grenade"
	}

	local IsWeaponFundedInThisTeam = function(Team, Gun)
		if Team == "T" then
			if table.find(TWeapons, Gun) then
				return true
			end
		elseif Team == "CT" then
			if table.find(CTWeapons, Gun) then
				return true
			end
		end
	end

	for Index, Value in Skins do

		local Weapon, Skin = table.unpack(string.split(Value[1], "_"))[1]
		if IsWeaponFundedInThisTeam("CT", Weapon) then
			Client.CTLoadout[Index] = Value
		end
		if IsWeaponFundedInThisTeam("T", Weapon) then
			Client.TLoadout[Index]	 = Value
		end
	end

	return Skins
end)()


local Old; Old = hookfunction(Data.GetData, function(Type, ...)
	if Type ~= nil then
		local ToReturn = Old(Type, ...)
		for Index, Value in SkinsTable do
			ToReturn[tostring(Index)] = Value
		end
		return ToReturn
	end
	return Old(Type, ...)
end)

for Index, Value in getconnections(ReplicatedStorage.Events.InventoryAndLoadout.OnClientEvent) do
	local Function = Value.Function
	if Function then
		local Old; Old = hookfunction(Function, function(Type, Skins, ...)
			if Type == "CTLoadout" then
				Skins = Client.CTLoadout
			elseif Type == "TLoadout" then
				Skins = Client.TLoadout
			elseif Type == "Inventory" then
				Skins = SkinsTable
			end
			return Old(Type, Skins, ...)
		end)
	end
end

--[[
	reference
{
    "EquipItem",
    "CT",
    "Knife",
    {
            "Butterfly Knife_Ciro"
        }
}

]]

local Old; Old = hookmetamethod(game, "__namecall", function(self, ...)
	local Method = getnamecallmethod()
	local Args	 = {...}
	if Method == "FireServer" then
		if self and self.Name == "DataEvent" then
			local Table = Args[1]
			if Table[1] == "EquipItem" then
				--[[if Table[2] == "CT" then
					local SkinFolder = LocalPlayer.SkinFolder[Table[2] .. "Folder"]

				elseif Table[2] == "T" then
				elseif Table[2] == "Both" then

				end]]

				if Table[2] ~= "Both" then
					local SkinFolder = LocalPlayer.SkinFolder[Table[2] .. "Folder"]
					local Weapon, Skin = table.unpack(string.split(Table[4][1], "_")) -- wow.
					if Table[3] == "Knife" or Table[3] == "Glove" then
						SkinFolder[Table[3]].Value = Skin
						--[[if Table[3] == "Knife" then
							local Loadout = Client.[Table[2] .. "Loadout"]
							if Loadout then
								Loadout.KnifeOver = true
								Loadout.Knife = 
							end
							
							fuck this lets make it automatic.
						end]] 

						local Loadout = Client[Table[2] .. "Loadout"]
						if Loadout then
							Loadout[Table[3] .. "Over"] = true
							Loadout[Table[3]] = {
								tostring(Weapon .. "_" .. Skin) -- WJHYYY??
							}
							-- print(Loadout[Table[3]])
							-- print("nigga")
						end
					else
						SkinFolder[Weapon].Value = Skin
					end
				else
					for Index, Value in {"CT", "T"} do
						local SkinFolder = LocalPlayer.SkinFolder[Value .. "Folder"]
						local Weapon, Skin = table.unpack(string.split(Table[4][1], "_")) -- wow.
						if Table[3] == "Knife" or Table[3] == "Glove" then
							SkinFolder[Table[3]].Value = Skin
							--[[if Table[3] == "Knife" then
								local Loadout = Client.[Table[2] .. "Loadout"]
								if Loadout then
									Loadout.KnifeOver = true
									Loadout.Knife = 
								end
								
								fuck this lets make it automatic.
							end]] 

							local Loadout = Client[Value .. "Loadout"]
							if Loadout then
								Loadout[Table[3] .. "Over"] = true
								Loadout[Table[3]] = {
									tostring(Weapon .. "_" .. Skin) -- WJHYYY??
								}
							end
						else
							SkinFolder[Weapon].Value = Skin
						end
					end
				end

			end
		end
	end

	return Old(self, ...)
end)

firesignal(ReplicatedStorage.Events.InventoryAndLoadout.OnClientEvent, "Inventory", SkinsTable)
firesignal(ReplicatedStorage.Events.InventoryAndLoadout.OnClientEvent, "CTLoadout", Client.CTLoadout)
firesignal(ReplicatedStorage.Events.InventoryAndLoadout.OnClientEvent, "TLoadout", Client.TLoadout)


--[[
hookfunction(filtergc("function", {Name = "equipitem"}, true), function(...)
	local args = {...}
    local v1 = string.split(args[1][1], "_")[1] -- Bayonet
	print(v1)
	print(args[1][1])
    if table.find(CurrentKnives, v1) then
        v1 = "Knife"
    elseif table.find(CurrentGloves, v1) then
        v1 = "Glove"
    end
	ReplicatedStorage.Events.DataEvent:FireServer({ "EquipItem", args[2], v1, args[1] })
end)]]
