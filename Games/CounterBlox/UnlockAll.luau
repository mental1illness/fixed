-- RBX MCP + CHATGPT (RECODE)

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ReplicatedFirst = game:GetService("ReplicatedFirst")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local Client = getsenv(PlayerGui:WaitForChild("Client"))
local Data = require(ReplicatedFirst:WaitForChild("Data"))

local Events = ReplicatedStorage:WaitForChild("Events")
local DataEvent = Events:WaitForChild("DataEvent")
local InventoryEvent = Events:WaitForChild("InventoryAndLoadout")

local SkinFolders = LocalPlayer:WaitForChild("SkinFolder")
local SkinsFolder = ReplicatedStorage:WaitForChild("Skins")
local GlovesFolder = ReplicatedStorage:WaitForChild("Gloves")

local SkinUnlocker = {}
SkinUnlocker.__index = SkinUnlocker

SkinUnlocker.Teammates = {
	CT = {
		"P2000",
		"USP",
		"DualBerettas",
		"P250",
		"FiveSeven",
		"CZ",
		"DesertEagle",
		"R8",
		"Nova",
		"XM",
		"MAG7",
		"M249",
		"Negev",
		"MP9",
		"MP7",
		"MP7-SD",
		"UMP",
		"P90",
		"Bizon",
		"Famas",
		"M4A4",
		"M4A1",
		"Scout",
		"AUG",
		"AWP",
		"G3SG1",
		"Kevlar Vest",
		"Kevlar + Helmet",
		"Defuse Kit",
		"Incendiary Grenade",
		"Decoy Grenade",
		"Flashbang",
		"HE Grenade",
		"Smoke Grenade",
	},

	T = {
		"Glock",
		"DualBerettas",
		"P250",
		"Tec9",
		"CZ",
		"DesertEagle",
		"R8",
		"Nova",
		"XM",
		"SawedOff",
		"M249",
		"Negev",
		"MAC10",
		"MP7",
		"MP7-SD",
		"UMP",
		"P90",
		"Bizon",
		"Galil",
		"AK47",
		"Scout",
		"SG",
		"AWP",
		"G3SG1",
		"Kevlar Vest",
		"Kevlar + Helmet",
		"Molotov",
		"Decoy Grenade",
		"Flashbang",
		"HE Grenade",
		"Smoke Grenade",
	},
}

function SkinUnlocker.CreateSet(Values)
	local Set = {}

	for Index = 1, #Values do
		Set[Values[Index]] = true
	end

	return Set
end

function SkinUnlocker.IsKnife(WeaponName)
	return WeaponName == "Knife"
		or string.find(WeaponName, "Knife", 1, true) ~= nil
		or string.find(WeaponName, "Bayonet", 1, true) ~= nil
		or string.find(WeaponName, "Karambit", 1, true) ~= nil
end

function SkinUnlocker.new()
	local self = setmetatable({}, SkinUnlocker)

	self.Enabled = false
	self.Destroyed = false

	self.Hooks = {
		GetData = nil,
		Namecall = nil,
		Inventory = {},
	}

	self.SkinInfo = {}
	self.Inventory = {}
	self.Loadouts = {
		CT = {},
		T = {},
	}

	self.WeaponSets = {
		CT = SkinUnlocker.CreateSet(SkinUnlocker.Teammates.CT),
		T = SkinUnlocker.CreateSet(SkinUnlocker.Teammates.T),
	}

	self:Collect()

	return self
end

function SkinUnlocker:GetTeamLoadout(Team)
	return Client[Team .. "Loadout"]
end

function SkinUnlocker:GetTeamFolder(Team)
	return SkinFolders:FindFirstChild(Team .. "Folder")
end

function SkinUnlocker:IsSpecialSlot(Slot)
	return Slot == "Knife" or Slot == "Glove"
end

function SkinUnlocker:IsValidTeam(Team)
	return Team == "CT" or Team == "T"
end

function SkinUnlocker:GetSkinId(WeaponName, SkinName)
	return WeaponName .. "_" .. SkinName
end

function SkinUnlocker:RegisterSkin(WeaponName, SkinName, Type)
	if SkinName == "Stock" then
		return
	end

	local FullId = self:GetSkinId(WeaponName, SkinName)

	if self.SkinInfo[FullId] then
		return
	end

	local Info = {
		Weapon = WeaponName,
		Skin = SkinName,
		Type = Type,
		FullId = FullId,
	}

	self.SkinInfo[FullId] = Info
	self.Inventory[FullId] = { FullId }

	if Type == "Knife" or Type == "Glove" then
		self.Loadouts.CT[FullId] = { FullId }
		self.Loadouts.T[FullId] = { FullId }
		return
	end

	if Type ~= "Weapon" then
		return
	end

	if self.WeaponSets.CT[WeaponName] then
		self.Loadouts.CT[FullId] = { FullId }
	end

	if self.WeaponSets.T[WeaponName] then
		self.Loadouts.T[FullId] = { FullId }
	end
end

function SkinUnlocker:CollectWeapons()
	for _, Folder in SkinsFolder:GetChildren() do
		if not Folder:IsA("Folder") then
			continue
		end

		local Type = SkinUnlocker.IsKnife(Folder.Name) and "Knife" or "Weapon"

		for _, Skin in Folder:GetChildren() do
			self:RegisterSkin(Folder.Name, Skin.Name, Type)
		end
	end
end

function SkinUnlocker:CollectGloves()
	for _, Folder in GlovesFolder:GetChildren() do
		if not Folder:IsA("Folder") or Folder.Name == "Model" then
			continue
		end

		for _, Skin in Folder:GetChildren() do
			self:RegisterSkin(Folder.Name, Skin.Name, "Glove")
		end
	end
end

function SkinUnlocker:ClearCollection()
	table.clear(self.SkinInfo)
	table.clear(self.Inventory)
	table.clear(self.Loadouts.CT)
	table.clear(self.Loadouts.T)
end

function SkinUnlocker:Collect()
	self:ClearCollection()
	self:CollectWeapons()
	self:CollectGloves()
end

function SkinUnlocker:AddLoadout(Team, SkinId, Value)
	local Loadout = self:GetTeamLoadout(Team)

	if Loadout then
		Loadout[SkinId] = Value
	end
end

function SkinUnlocker:RemoveLoadout(Team, SkinId)
	local Loadout = self:GetTeamLoadout(Team)

	if Loadout and Loadout[SkinId] then
		Loadout[SkinId] = nil
	end
end

function SkinUnlocker:MergeTeam(Team)
	local Loadout = self.Loadouts[Team]

	if not Loadout then
		return
	end

	for SkinId, Value in Loadout do
		self:AddLoadout(Team, SkinId, Value)
	end
end

function SkinUnlocker:Merge()
	self:MergeTeam("CT")
	self:MergeTeam("T")
end

function SkinUnlocker:IsManagedSkin(Value)
	return type(Value) == "table"
		and type(Value[1]) == "string"
		and self.SkinInfo[Value[1]] ~= nil
end

function SkinUnlocker:RemoveSpecialSlots(Team)
	local Loadout = self:GetTeamLoadout(Team)

	if not Loadout then
		return
	end

	for _, Slot in { "Knife", "Glove" } do
		local Current = Loadout[Slot]

		if self:IsManagedSkin(Current) then
			Loadout[Slot] = nil
			Loadout[Slot .. "Over"] = nil
		end
	end
end

function SkinUnlocker:UnmergeTeam(Team)
	local Loadout = self:GetTeamLoadout(Team)
	local ManagedLoadout = self.Loadouts[Team]

	if not Loadout or not ManagedLoadout then
		return
	end

	for SkinId in ManagedLoadout do
		local Current = Loadout[SkinId]

		if type(Current) == "table" and Current[1] == SkinId then
			Loadout[SkinId] = nil
		end
	end

	self:RemoveSpecialSlots(Team)
end

function SkinUnlocker:Unmerge()
	self:UnmergeTeam("CT")
	self:UnmergeTeam("T")
end

function SkinUnlocker:ApplySpecialSlot(Team, Slot, Info)
	local TeamFolder = self:GetTeamFolder(Team)

	if not TeamFolder then
		return
	end

	local Object = TeamFolder:FindFirstChild(Slot)

	if Object then
		Object.Value = Info.Skin
	end

	local Loadout = self:GetTeamLoadout(Team)

	if Loadout then
		Loadout[Slot .. "Over"] = true
		Loadout[Slot] = { Info.FullId }
	end
end

function SkinUnlocker:ApplyWeapon(Team, Info)
	local TeamFolder = self:GetTeamFolder(Team)

	if not TeamFolder then
		return
	end

	local Weapon = TeamFolder:FindFirstChild(Info.Weapon)

	if Weapon then
		Weapon.Value = Info.Skin
	end
end

function SkinUnlocker:ApplySkin(Team, Slot, Info)
	if self:IsSpecialSlot(Slot) then
		self:ApplySpecialSlot(Team, Slot, Info)
	else
		self:ApplyWeapon(Team, Info)
	end
end

function SkinUnlocker:ApplyToTeams(Team, Slot, Info)
	if Team == "Both" then
		self:ApplySkin("CT", Slot, Info)
		self:ApplySkin("T", Slot, Info)
		return
	end

	if self:IsValidTeam(Team) then
		self:ApplySkin(Team, Slot, Info)
	end
end

function SkinUnlocker:HandleEquip(Packet)
	if type(Packet) ~= "table" or Packet[1] ~= "EquipItem" then
		return
	end

	local Team = Packet[2]
	local Slot = Packet[3]
	local Wrapper = Packet[4]

	if type(Wrapper) ~= "table" then
		return
	end

	local FullId = Wrapper[1]

	if type(FullId) ~= "string" then
		return
	end

	local Info = self.SkinInfo[FullId]

	if not Info then
		return
	end

	self:ApplyToTeams(Team, Slot, Info)
end

function SkinUnlocker:InstallDataHook()
	if self.Hooks.GetData then
		return
	end

	local OriginalGetData

	OriginalGetData = hookfunction(Data.GetData, function(DataType, ...)
		local Result = OriginalGetData(DataType, ...)

		if not self.Enabled or type(Result) ~= "table" then
			return Result
		end

		if DataType == "Inventory" then
			for SkinId, Value in self.Inventory do
				Result[SkinId] = Value
			end
		elseif DataType == "CTLoadout" then
			for SkinId, Value in self.Loadouts.CT do
				Result[SkinId] = Value
			end
		elseif DataType == "TLoadout" then
			for SkinId, Value in self.Loadouts.T do
				Result[SkinId] = Value
			end
		end

		return Result
	end)

	self.Hooks.GetData = OriginalGetData
end

function SkinUnlocker:InstallInventoryHooks()
	if #self.Hooks.Inventory > 0 then
		return
	end

	for _, Connection in getconnections(InventoryEvent.OnClientEvent) do
		local Function = Connection.Function

		if type(Function) ~= "function" then
			continue
		end

		local OriginalFunction

		OriginalFunction = hookfunction(Function, function(DataType, Skins, ...)
			if self.Enabled then
				if DataType == "Inventory" then
					Skins = self.Inventory
				elseif DataType == "CTLoadout" then
					Skins = Client.CTLoadout
				elseif DataType == "TLoadout" then
					Skins = Client.TLoadout
				end
			end

			return OriginalFunction(DataType, Skins, ...)
		end)

		table.insert(self.Hooks.Inventory, {
			Function = Function,
			Original = OriginalFunction,
		})
	end
end

function SkinUnlocker:InstallNamecallHook()
	if self.Hooks.Namecall then
		return
	end

	local OriginalNamecall

	OriginalNamecall = hookmetamethod(game, "__namecall", function(Self, ...)
		if self.Enabled
			and Self == DataEvent
			and getnamecallmethod() == "FireServer"
		then
			self:HandleEquip(...)
		end

		return OriginalNamecall(Self, ...)
	end)

	self.Hooks.Namecall = OriginalNamecall
end

function SkinUnlocker:InstallHooks()
	self:InstallDataHook()
	self:InstallInventoryHooks()
	self:InstallNamecallHook()
end

function SkinUnlocker:GetOriginalData(DataType)
	if not self.Hooks.GetData then
		return {}
	end

	return self.Hooks.GetData(DataType)
end

function SkinUnlocker:GetRefreshData()
	if self.Enabled then
		return self.Inventory, Client.CTLoadout, Client.TLoadout
	end

	return self:GetOriginalData("Inventory"),
		self:GetOriginalData("CTLoadout"),
		self:GetOriginalData("TLoadout")
end

function SkinUnlocker:FireInventoryUpdate()
	local Inventory, CTLoadout, TLoadout = self:GetRefreshData()

	task.defer(function()
		firesignal(InventoryEvent.OnClientEvent, "Inventory", Inventory)

		task.defer(function()
			firesignal(InventoryEvent.OnClientEvent, "CTLoadout", CTLoadout)
			firesignal(InventoryEvent.OnClientEvent, "TLoadout", TLoadout)
		end)
	end)
end

function SkinUnlocker:Refresh()
	self:FireInventoryUpdate()
	return self
end

function SkinUnlocker:IsEnabled()
	return self.Enabled
end

function SkinUnlocker:Enable()
	if self.Destroyed then
		return self
	end

	self:InstallHooks()

	if self.Enabled then
		return self:Refresh()
	end

	self.Enabled = true

	self:Merge()
	self:Refresh()

	return self
end

function SkinUnlocker:Disable()
	if self.Destroyed or not self.Enabled then
		return self
	end

	self.Enabled = false

	self:Unmerge()
	self:Refresh()

	return self
end

function SkinUnlocker:Destroy()
	if self.Destroyed then
		return
	end

	self:Disable()

	self.Hooks.GetData = nil
	self.Hooks.Namecall = nil
	table.clear(self.Hooks.Inventory)

	table.clear(self.SkinInfo)
	table.clear(self.Inventory)
	table.clear(self.Loadouts.CT)
	table.clear(self.Loadouts.T)

	self.Destroyed = true
end

local Unlocker = SkinUnlocker.new()

return Unlocker:Enable()
