-- скрипт паста ебанная я хз кто спастит в ответ тот сын шлюхи | t.me/enderphobia1337
-- bypess aka cb hueta
-- проверка на пидорасов
if identifyexecutor then
    local name = identifyexecutor()
    local n = tostring(name):lower()
    if n:find("solara") or n:find("xeno") or n:find("codex") or n:find("vega") then
        game:GetService("Players").LocalPlayer:Kick(tostring(name) .. " dont support")
    end
else
    print("иди нахуй")
end

do
	local originalNamecallMethod
	originalNamecallMethod = hookmetamethod(game, "__namecall", function(self, ...)
		local methodName = getnamecallmethod()
		
		if self.Name == "HaIIoooooooooooo" or self.Name == "Boogers" then
			if methodName == "FireServer"
				or methodName == "Rem3"
				or methodName == "Kick"
				or methodName == "ewrtsjkwrslk"
				or methodName == "FireUnreliable"
				or methodName == "InvokeServer" then
				return nil
			end
		end
		
		return originalNamecallMethod(self, ...)
	end)
end

-- skipaite nahui
players = game:GetService("Players")
localPlayer = players.LocalPlayer
workspace = game:GetService("Workspace")
currentCamera = workspace.CurrentCamera
guiService = game:GetService("GuiService")
runService = game:GetService("RunService")
lighting = game.Lighting
mouse = localPlayer:GetMouse()
userInput = game:GetService("UserInputService")
TweenService = game:GetService("TweenService")
rayignore = workspace.Ray_Ignore
CNew, CF, C3, Vec2, Vec3 = ColorSequence.new, CFrame.new, Color3.fromRGB, Vector2.new, Vector3.new;
GetPlayers = players.GetPlayers
local offscreenArrows = { enabled = false, radius = 100, size = 10, color = C3(255, 255, 255), transparency = 0.20, outlineColor = C3(0, 0, 0), outlineTransparency = 0, arrows = {} }
local weaponMods = { no_recoil = false, no_spread = false, }
local originalWeaponValues = {}
local spinbot = { enabled = false, speed = 150 }
local antiaim = { enabled = false }
local aastates = { "Standing" , "Moving", "Crouch" , "Jumping" , "SlowWalk" }
local function aadefset()
    return { yaw_base = "Spin", yaw_offset = 0, jitter = false, jitter_offset = 30, jitter_speed = 10, pitch = "None", extend_pitch = false, body_roll = "None", spin_speed = 50, smooth_jitter = false, smooth_jitter_from = -30, smooth_jitter_to = 30, smooth_jitter_speed = 3, }
end
local aacfgpizda = {}
for _, s in ipairs(aastates) do aacfgpizda[s] = aadefset() end
local aaspinangles = { Standing = 0, Moving = 0, Crouch = 0, Jumping = 0, SlowWalk = 0 }
local aajittertoggles = { Standing = false, Moving = false, Crouch = false, Jumping = false, SlowWalk = false }
local aalastjittertime = { Standing = 0, Moving = 0, Crouch = 0, Jumping = 0, SlowWalk = 0 }
local legAnimDone = false
local nameChangerEnabled = false
local clantagEnabled = false
local originalName = localPlayer.Name
getgenv().newname = "t.me/enderphobia1337"
getgenv().clantag = "ANYAGANG'"
local atm = Instance.new("Atmosphere"); atm.Parent = nil; atm.Density = 0; atm.Offset = 0; atm.Haze = 0; atm.Glare = 0; atm.Color = C3(255, 255, 255); atm.Decay = C3(255, 255, 255)
grenadenames = { ["Smoke Grenade"] = true, Flashbang = true, ["HE Grenade"] = true, Molotov = true, ["Incendiary Grenade"] = true, ["Decoy Grenade"] = true, Smoke = true, Flash = true, Grenade = true, Incendiary = true }
-- fynkcions wathahell shto
function kykoldingrenade()
	local ok, weapName = pcall(function()
		return workspace[localPlayer.Name].EquippedTool.Value;
	end);
	if (not ok or not weapName) then
		return false;
	end
	return grenadenames[weapName] == true;
end
local function IsAlive(plr)
    return plr and plr.Character and plr.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.Health > 0
end
-- parasha
local NewInstance = clonefunction(Instance.new)
local GetService = clonefunction(game.GetService)
clonefunction(game.IsLoaded)
local Clone = clonefunction(game.Clone)
clonefunction(game.Destroy)
local Remove = clonefunction(game.Remove)
local GetChildren = clonefunction(game.GetChildren)
clonefunction(game.ClearAllChildren)
clonefunction(game.GetDescendants)
local IsDescendantOf = clonefunction(game.IsDescendantOf)
clonefunction(game.IsA)
local FindFirstChild = clonefunction(game.FindFirstChild)
local WaitForChild = clonefunction(game.WaitForChild)
local FindFirstChildOfClass = clonefunction(game.FindFirstChildOfClass)
clonefunction(game.HttpGet)
clonefunction(game.GetPropertyChangedSignal)
local GetAttribute = clonefunction(game.GetAttribute)
local GetPlayers = clonefunction(GetService(game, "Players").GetPlayers)
local GetPlayerFromCharacter = clonefunction(GetService(game, "Players").GetPlayerFromCharacter)
clonefunction(GetService(game, "Players").CreateHumanoidModelFromUserId)
clonefunction(GetService(game, "Stats").Network.ServerStatsItem["Data Ping"].GetValue)
clonefunction(GetService(game, "UserInputService").GetMouseLocation)
local IsKeyDown = clonefunction(GetService(game, "UserInputService").IsKeyDown)
clonefunction(GetService(game, "UserInputService").IsMouseButtonPressed)
clonefunction(GetService(game, "UserInputService").GetFocusedTextBox)
clonefunction(GetService(game, "TextService").GetTextSize)
local GetTextBoundsAsync = clonefunction(GetService(game, "TextService").GetTextBoundsAsync)
clonefunction(NewInstance("VirtualInputManager").SendMouseButtonEvent)
clonefunction(NewInstance("VirtualInputManager").SendMouseMoveDeltaEvent)
clonefunction(GetService(game, "Teams").GetTeams)
clonefunction(GetService(game, "Players").LocalPlayer.GetMouse)
clonefunction(GetService(game, "RunService").RenderStepped.Wait)
clonefunction(NewInstance("BindableEvent").Fire)
local NewCFrame = clonefunction(CF)
local CFrameAngles = clonefunction(CFrame.Angles)
local CFrameLookAt = clonefunction(CFrame.lookAt)
clonefunction(NewCFrame().Lerp)
local GetComponents = clonefunction(NewCFrame().GetComponents)
clonefunction(NewCFrame().PointToObjectSpace)
clonefunction(NewCFrame().ToObjectSpace)
clonefunction(NewCFrame().ToEulerAnglesXYZ)
local NewVector3 = clonefunction(Vec3)
clonefunction(NewVector3().Lerp)
local NewVector2 = clonefunction(Vec2)
local NewUDim2 = clonefunction(UDim2.new)
local UDim2FromOffset = clonefunction(UDim2.fromOffset)
clonefunction(UDim2.fromScale)
local NewUDim = clonefunction(UDim.new)
local NewColor3 = clonefunction(Color3.new)
local Color3FromRGB = clonefunction(C3)
clonefunction(Color3.fromHSV)
clonefunction(Color3.toHSV)
clonefunction(NewColor3().ToHex)
clonefunction(Color3.fromHex)
local NewColorSequence = clonefunction(CNew)
local NewColorSequenceKeypoint = clonefunction(ColorSequenceKeypoint.new)
local NewNumberSequence = clonefunction(NumberSequence.new)
local NewNumberSequenceKeypoint = clonefunction(NumberSequenceKeypoint.new)
clonefunction(Ray.new)
local NewRaycastParams = clonefunction(RaycastParams.new)
local WorkspaceRaycast = clonefunction(workspace.Raycast)
clonefunction(string.format)
local StringUpper = clonefunction(string.upper)
local StringLower = clonefunction(string.lower)
local StringFind = clonefunction(string.find)
clonefunction(string.len)
clonefunction(string.gsub)
clonefunction(string.sub)
clonefunction(string.match)
clonefunction(string.gmatch)
clonefunction(string.split)
clonefunction(tostring)
local TableInsert = clonefunction(table.insert)
local TableClear = clonefunction(table.clear)
local TableRemove = clonefunction(table.remove)
clonefunction(table.find)
local TableSort = clonefunction(table.sort)
clonefunction(table.concat)
local TableUnpack = clonefunction(table.unpack)
clonefunction(table.pack)
clonefunction(table.clone)
local Select = clonefunction(select)
local MathClamp = clonefunction(math.clamp)
clonefunction(math.random)
local MathRad = clonefunction(math.rad)
local MathFloor = clonefunction(math.floor)
clonefunction(math.abs)
local MathMax = clonefunction(math.max)
local MathMin = clonefunction(math.min)
local MathSin = clonefunction(math.sin)
local MathCos = clonefunction(math.cos)
clonefunction(math.deg)
clonefunction(math.ceil)
clonefunction(math.atan2)
clonefunction(math.sqrt)
local MathPow = clonefunction(math.pow)
local MathRound = clonefunction(math.round)
local HUGE_VALUE = 1e309
clonefunction(tonumber)
local LerpFunction = function(start, finish, alpha)
	return start + (finish - start) * alpha
end
clonefunction(debug.traceback)
local Tick = clonefunction(tick)
clonefunction(os.date)
clonefunction(os.time)
local OsClock = clonefunction(os.clock)
local WorldToViewportPoint = clonefunction(NewInstance("Camera").WorldToViewportPoint)
clonefunction(NewInstance("Camera").WorldToScreenPoint)
clonefunction(NewInstance("Humanoid").ChangeState)
local GetState = clonefunction(NewInstance("Humanoid").GetState)
clonefunction(NewInstance("Humanoid").SetStateEnabled)
clonefunction(NewInstance("Model").GetModelSize)
clonefunction(NewInstance("Player").Kick)
clonefunction(require)
clonefunction(type)
local Typeof = clonefunction(typeof)
clonefunction(coroutine.wrap)
local TaskWait = clonefunction(task.wait)
clonefunction(pcall)
clonefunction(wait)
local TaskSpawn = clonefunction(task.spawn)
local TaskDelay = clonefunction(task.delay)
clonefunction(task.defer)
clonefunction(task.cancel)
local GetServerTimeNow = clonefunction(workspace.GetServerTimeNow)
local IsA = clonefunction(game.IsA)
local HttpService = cloneref(GetService(game, "HttpService"))
local Lighting = cloneref(GetService(game, "Lighting"))
local TweenService = cloneref(GetService(game, "TweenService"))
local Workspace = cloneref(GetService(game, "Workspace"))
local RunService = cloneref(GetService(game, "RunService"))
local TextService = cloneref(GetService(game, "TextService"))
local UserInputService = cloneref(GetService(game, "UserInputService"))
local ReplicatedStorage = cloneref(GetService(game, "ReplicatedStorage"))
local Players = cloneref(GetService(game, "Players"))
local LocalPlayer = Players.LocalPlayer
local UIHolder = gethui() or FindFirstChild(cloneref(GetService(game, "CoreGui")), "RobloxGui", true)
local ZeroVector3 = NewVector3()
local NaNVector3 = { X = math.sqrt(-1), Y = math.sqrt(-1), Z = math.sqrt(-1) }
local CurrentCamera = Workspace.CurrentCamera

local SpawnFunction = function(func, ...)
	TaskSpawn(function(...)
		local co = coroutine.create(func)
		coroutine.resume(co, ...)
	end, ...)
end

local SpawnWithIdentity = function(identityLevel, func, ...)
	local originalFunc = func
	func = function(...)
		setthreadidentity(identityLevel)
		return originalFunc(...)
	end

	TaskSpawn(function(...)
		local co = coroutine.create(func)
		coroutine.resume(co, ...)
	end, ...)
end

local function GetFileName(path)
	return path:match("[^/\\]+$")
end

local function GetFilesName(files)
	local names = {}
	for i, filePath in files do
		names[i] = GetFileName(filePath)
	end
	return names
end

local GlobalConfig = {
	TextCache = {},
	HitPartCache = {},
	ViewmodelOffsetX = 0,
	ViewmodelOffsetY = 0,
	ViewmodelOffsetZ = 0,
	ViewmodelOffsetRoll = 0,
	ViewmodelOffsetYaw = 0,
	ViewmodelOffsetPitch = 0,
	RaycastParameter = NewRaycastParams(),
	RageBotCache = {
		Entities = {},
		RaycastResults = {},
		LastCleanup = 0,
		Enemies = {},
		LastEnemyUpdate = 0,
		OriginCache = {},
		LastThink = 0,
		RaycastParams = RaycastParams.new(),
	},
	FadeHitmarker = TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
}
GlobalConfig.RaycastParameter.FilterType = Enum.RaycastFilterType.Exclude
GlobalConfig.RaycastParameter.FilterDescendantsInstances = { Character }
GlobalConfig.RaycastParameter.IgnoreWater = true

local LoadedFonts = {}

do
	local LoadFont = function(fontName, fontData)
		writefile(fontName .. ".ttf", fontData)

		local fontConfig = {
			Name = fontName,
			faces = {
				{
					name = "Regular",
					weight = 400,
					style = "normal",
					assetId = getcustomasset(fontName .. ".ttf"),
				},
			},
		}

		writefile(fontName .. ".json", HttpService:JSONEncode(fontConfig))
		return Font.new(getcustomasset(fontName .. ".json"), Enum.FontWeight.Regular)
	end

	LoadedFonts = {
		Tahoma = LoadFont("tahoma", game:HttpGet("https://raw.githubusercontent.com/mental1illness/storage/refs/heads/main/fonts/old-tahoma.ttf")),
		TahomaBold = LoadFont("tahomabold", game:HttpGet("https://raw.githubusercontent.com/mental1illness/storage/refs/heads/main/fonts/old-tahoma-bold.ttf")),
		SmallestPixel7 = LoadFont("smallestpixel-7", game:HttpGet("https://raw.githubusercontent.com/mental1illness/storage/refs/heads/main/fonts/smallest_pixel-7.ttf")),
		ProggyClean = LoadFont("proggyclean", game:HttpGet("https://raw.githubusercontent.com/mental1illness/storage/refs/heads/main/fonts/proggyclean.ttf")),
		Minecraftia = LoadFont("minecraftia", game:HttpGet("https://raw.githubusercontent.com/mental1illness/storage/refs/heads/main/fonts/Minecraftia-Regular.ttf")),
	}
end

local customScope = {enabled=false,originalValues={},crosshairGui=nil,lineH=nil,lineV=nil,renderConnection=nil}

local FontIndexToName = {
	[0] = "Tahoma",
	[1] = "TahomaBold",
	[2] = "Verdana",
	[3] = "VerdanaBold",
	[4] = "SmallestPixel7",
	[5] = "ProggyClean",
	[6] = "Minecraftia",
}

local GetFontByIndex = function(index)
	if Typeof(index) ~= "number" then return nil end
	local fontName = FontIndexToName[index]
	if not fontName then return nil end
	return LoadedFonts[fontName]
end

local ApplyDefaultUIProperties = function(object, variant)
	if IsA(object, "Frame") and variant == "Circle" then
		object.BorderSizePixel = 0
		object.BackgroundColor3 = Color3FromRGB(255, 255, 255)
		object.Size = NewUDim2(0, 200, 0, 200)
		object.ClipsDescendants = false

		local corner = NewInstance("UICorner")
		corner.CornerRadius = NewUDim(1, 0)
		corner.Parent = object

	elseif IsA(object, "Frame") then
		object.BorderSizePixel = 0
		object.BackgroundColor3 = Color3FromRGB(255, 255, 255)
		object.Size = NewUDim2(0, 200, 0, 200)
		object.ClipsDescendants = false

	elseif IsA(object, "TextLabel") then
		object.BackgroundTransparency = 1
		object.TextSize = 12
		object.FontFace = LoadedFonts.Tahoma
		object.TextColor3 = Color3FromRGB(255, 255, 255)
		object.ClipsDescendants = false
	elseif IsA(object, "ScreenGui") then
		object.IgnoreGuiInset = true
		object.ResetOnSpawn = false
	end
end

local RenderObjectUtils = {
	SetRenderProperty = function(object, property, value)
		if object and object[property] ~= nil then
			if property == "Font" then
				property = "FontFace"
			end

			if property == "FontFace" and Typeof(value) == "number" then
				value = GetFontByIndex(value)
			end

			local currentType = object[property]

			if Typeof(currentType) == "EnumItem" then
				value = currentType.EnumType[value]
			end

			object[property] = value
		end

		return object
	end,
	GetRenderProperty = function(object, property)
		if object then
			return object[property]
		end
		return nil
	end,
	DestroyRenderObject = function(object)
		if object and object.Remove then
			Remove(object)
		else
			return false
		end
		return true
	end,
	new = function(className, properties)
		local variant
		if className == "Circle" then
			className = "Frame"
			variant = "Circle"
		end
		local instance = NewInstance(className)
		properties = properties or {}
		ApplyDefaultUIProperties(instance, variant)

		for propName, propValue in properties do
			pcall(function()
				if propName == "Font" then
					propName = "FontFace"
				end

				if propName == "FontFace" and Typeof(propValue) == "number" then
					propValue = GetFontByIndex(propValue)
				end

				local currentType = instance[propName]

				if Typeof(currentType) == "EnumItem" then
					propValue = currentType.EnumType[propValue]
				end

				instance[propName] = propValue
				GlobalConfig[propName] = propValue
			end)
		end

		return instance
	end,
	Fonts = {
		Tahoma = 0,
		TahomaBold = 1,
		Verdana = 2,
		VerdanaBold = 3,
		SmallestPixel7 = 4,
		ProggyClean = 5,
		Minecraftia = 6,
	},
}

local RemoteEvents = {
	ToUse = {
		HitPart = FindFirstChild(ReplicatedStorage.Events, "HitParl"),
		ReplicateAnimations = FindFirstChild(ReplicatedStorage.Events, "ReplicateAnimation"),
		ReplicateSound = FindFirstChild(ReplicatedStorage.Events, "ReplicateSound"),
	},
}

local WeaponFolder = {
	Guns = Clone(FindFirstChild(ReplicatedStorage, "Weapons")),
}

local GlobalState = {
	LastHit = nil,
	RageBot = {
		Functions = {},
		CurrentTarget = nil,
		LastRageBotFired = 0,
		TimeOffset = {
			Last = 0,
			LastChanged = OsClock(),
		},
		TimeOffset2 = {
			Last = 0,
			LastChanged = OsClock(),
		},
		CanRage = true,
		CanKillAll = true,
	},
	Backtrack = {
		Records = {},
	},
	ForwardTrack = {
		Records = {},
	},
	Misc = {
		Functions = {},
	},
	Visuals = {
		Functions = {},
		States = {
			ThirdPerson = "",
		},
	},
	Esp = {
		Entities = {},
		SettingsCache = {
			TextCases = {},
			TweenInformation = {
				[1] = TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
			},
		},
		TextOffsets = {
			SmallestPixel7 = {
				X = 0,
				Y = 0,
				Side = {
					Bottom = { X = 0, Y = -2 },
					Left = { X = -1, Y = 0 },
					Right = { X = 0, Y = 0 },
				},
			},
			Minecraftia = {
				X = 0,
				Y = -3,
				Side = {
					Bottom = { X = 0, Y = -6 },
					Left = { X = -1, Y = -5 },
					Right = { X = -1, Y = -5 },
				},
			},
			Tahoma = {
				X = 0,
				Y = 1,
				Side = {
					Bottom = { X = 0, Y = -2 },
					Left = { X = -1, Y = 0 },
					Right = { X = -1, Y = 0 },
				},
			},
			TahomaBold = {
				X = 0,
				Y = 1,
				Side = {
					Bottom = { X = 0, Y = -2 },
					Left = { X = -1, Y = 0 },
					Right = { X = -1, Y = 0 },
				},
			},
			Verdana = {
				X = 0,
				Y = 1,
				Side = {
					Bottom = { X = 0, Y = -2 },
					Left = { X = -1, Y = 0 },
					Right = { X = -1, Y = 0 },
				},
			},
			VerdanaBold = {
				X = 0,
				Y = 1,
				Side = {
					Bottom = { X = 0, Y = -2 },
					Left = { X = -1, Y = 0 },
					Right = { X = -1, Y = 0 },
				},
			},
			ProggyClean = {
				X = 0,
				Y = 0,
				Side = {
					Bottom = { X = 0, Y = -2 },
					Left = { X = 1, Y = -3 },
					Right = { X = 1, Y = -3 },
				},
			},
		},
		Holder = RenderObjectUtils.new("ScreenGui", { Parent = UIHolder }),
		Holder2 = RenderObjectUtils.new("ScreenGui", { Parent = UIHolder }),
	},
	Utility = {
		GetTeam = function(player)
			local team = player.Team
			if team ~= nil then
				return team
			end
			return GetAttribute(player, "Team")
		end,
		GetTransparency = function(object)
			if object and object.IsA then
				if object.ClassName == "UIStroke" then
					return "Transparency"
				elseif object.ClassName == "Frame" then
					return "BackgroundTransparency"
				elseif object.ClassName == "TextLabel" then
					return "TextTransparency"
				elseif object.ClassName == "ImageLabel" then
					return "ImageTransparency"
				end
			end
		end,
		GetTextBounds = function(text, font, size, maxWidth)
			local cacheKey = text .. "|" .. tostring(font) .. "|" .. tostring(size) .. "|" .. tostring(maxWidth)
			local cached = GlobalConfig.TextCache[cacheKey]
			if cached then
				return cached.X, cached.Y
			end
			local params = NewInstance("GetTextBoundsParams")
			params.Text = text
			params.RichText = true
			params.Font = font
			params.Size = size
			params.Width = maxWidth or CurrentCamera.ViewportSize.X - 32

			local bounds = GetTextBoundsAsync(TextService, params)
			GlobalConfig.TextCache[cacheKey] = { X = bounds.X, Y = bounds.Y }
			return bounds.X, bounds.Y
		end,
		GetNilsForRemote = function(remoteName)
			if remoteName == "HitPart" then
				return nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
			end
		end,
		EncodePosition = function(pos)
			return NewVector3(((pos.X - 156325) * 13 + 17854) * 16, (pos.Y + 64000) * 7 - 142657, (pos.Z * 9 - 47000) * 6)
		end,
		DecodePosition = function(pos)
			return NewVector3(((pos.X / 16) - 17854) / 13 + 156325, ((pos.Y + 142657) / 7) - 64000, (pos.Z / 6 + 47000) / 9)
		end,
		IsJumpingOrFalling = function()
			local char = LocalPlayer.Character
			if not char then return false end

			local humanoid = FindFirstChildOfClass(char, "Humanoid")
			if not humanoid then return false end

			local state = GetState(humanoid)
			return state == Enum.HumanoidStateType.Jumping or state == Enum.HumanoidStateType.Freefall
		end,
		GetWeaponReference = function(weapon)
			if Typeof(weapon) == "Instance" and FindFirstChild(weapon, "CopyFrom") then
				return weapon.CopyFrom.Value
			else
				return weapon
			end
		end,
	},
	Constants = {
		EasingStyles = {
			"Linear",
			"Sine",
			"Back",
			"Quad",
			"Quart",
			"Quint",
			"Bounce",
			"Elastic",
			"Exponential",
			"Circular",
			"Cubic",
		},
		MaterialMultipliers = {
			[Enum.Material.DiamondPlate] = 3,
			[Enum.Material.CorrodedMetal] = 2,
			[Enum.Material.Metal] = 2,
			[Enum.Material.Concrete] = 2,
			[Enum.Material.Brick] = 2,
			[Enum.Material.Wood] = 0.1,
			[Enum.Material.WoodPlanks] = 0.1,
		},
		Debris = FindFirstChild(Workspace, "Debris"),
		RayIgnore = FindFirstChild(Workspace, "Ray_Ignore"),
		Status = FindFirstChild(Workspace, "Status"),
		SoundsIndex = {
			"AR2 Head",
			"AR2 Body",
			"AR2 Limb",
			"BB HitM",
			"BB Kill",
			"PD Head",
			"PD Body",
			"Neverlose",
			"Gamesense",
			"Baimware",
			"Steve",
			"Skeet",
			"Body",
			"Ding",
			"Mario",
			"Mario 2",
			"Minecraft",
			"Among Us",
			"Button",
			"Oof",
			"Osu",
			"Osu Combobreak",
			"Bambi",
			"Click",
			"Snow",
			"Stone",
			"Rust",
			"Splat",
			"Bell",
			"Slime",
			"Saber",
			"Bat",
			"Bubble",
			"Pick",
			"Pop",
			"EmptyGun",
			"Bamboo",
			"Stomp",
			"Bag",
			"HitMarker",
			"LaserSlash",
			"RailGunF",
			"Bruh",
			"Crit",
			"Bonk",
			"Clink",
			"CoD",
			"Lazer Beam",
			"Windows XP Error",
			"Windows XP Ding",
			"HL Med Kit",
			"HL Door",
			"HL Crowbar",
			"HL Revolver",
			"HL Elevator",
			"TF2 HitSound",
			"TF2 Squasher",
			"TF2 Retro",
			"TF2 Space",
			"TF2 Vortex",
			"TF2 Beepo",
			"TF2 Bat",
			"TF2 Pow",
			"TF2 You Suck",
			"Quake Hitsound",
			"Fart",
			"Fart2",
			"FortniteGuns",
			"Crickets",
			"ScreamingKid",
			"BitchBot",
			"BitchBot Head",
			"BitchBot Body",
			"Minecraft Experience ",
			"BameWare",
			"Fatality",
			"Fatality MKX",
			"Fatality Original",
			"Doublekill 1",
			"Doublekill 2",
			"Killing Spree 1",
			"Killing Spree 2",
			"Sit Dog",
			"Csgo",
			"Bop",
			"Grenade Hit",
			"KillTrocity",
			"Double Kill",
			"Triple kill",
			"Over Kill",
			"Kill Tacular",
			"Kill Imanjaro",
			"Kill Tastrophe",
			"Kill Pocalypse",
			"Kill Ionaire",
			"Killing Spree",
			"Killing Frenzy",
			"Carrier Kill",
			"Clutch Kill",
			"Taco Bell",
			"Kombat",
			"Headshot",
			"Elevator",
		},
		Hitboxes = {
			HeadHB = true,
			Head = true,
			UpperTorso = true,
			LowerTorso = true,
			LeftUpperArm = true,
			LeftLowerArm = true,
			LeftHand = true,
			RightUpperArm = true,
			RightLowerArm = true,
			RightHand = true,
			LeftUpperLeg = true,
			LeftLowerLeg = true,
			LeftFoot = true,
			RightUpperLeg = true,
			RightLowerLeg = true,
			RightFoot = true,
		},
		Sounds = {
			["AR2 Head"] = "2062016772",
			["AR2 Body"] = "2062015952",
			["AR2 Limb"] = "6659353525",
			["BB HitM"] = "4645745735",
			["BB Kill"] = "2636743632",
			["PD Head"] = "4585351098",
			["PD Body"] = "4585364605",
			Neverlose = "8726881116",
			Gamesense = "4817809188",
			Baimware = "3124331820",
			Steve = "4965083997",
			Skeet = "4753603610",
			Body = "3213738472",
			Ding = "7149516994",
			Mario = "2815207981",
			["Mario 2"] = "5709456554",
			Minecraft = "6361963422",
			["Among Us"] = "5700183626",
			Button = "12221967",
			Oof = "4792539171",
			Osu = "7149919358",
			["Osu Combobreak"] = "3547118594",
			Bambi = "8437203821",
			Click = "8053704437",
			Snow = "6455527632",
			Stone = "3581383408",
			Rust = "1255040462",
			Splat = "12222152",
			Bell = "6534947240",
			Slime = "6916371803",
			Saber = "8415678813",
			Bat = "3333907347",
			Bubble = "6534947588",
			Pick = "1347140027",
			Pop = "198598793",
			EmptyGun = "203691822",
			Bamboo = "3769434519",
			Stomp = "200632875",
			Bag = "364942410",
			HitMarker = "8543972310",
			LaserSlash = "199145497",
			RailGunF = "199145534",
			Bruh = "4275842574",
			Crit = "296102734",
			Bonk = "3765689841",
			Clink = "711751971",
			CoD = "160432334",
			["Lazer Beam"] = "130791043",
			["Windows XP Error"] = "160715357",
			["Windows XP Ding"] = "489390072",
			["HL Med Kit"] = "4720445506",
			["HL Door"] = "4996094887",
			["HL Crowbar"] = "546410481",
			["HL Revolver"] = "1678424590",
			["HL Elevator"] = "237877850",
			["TF2 HitSound"] = "3455144981",
			["TF2 Squasher"] = "3466981613",
			["TF2 Retro"] = "3466984142",
			["TF2 Space"] = "3466982899",
			["TF2 Vortex"] = "3466980212",
			["TF2 Beepo"] = "3466987025",
			["TF2 Bat"] = "3333907347",
			["TF2 Pow"] = "679798995",
			["TF2 You Suck"] = "1058417264",
			["Quake Hitsound"] = "4868633804",
			Fart = "131314452",
			Fart2 = "6367774932",
			FortniteGuns = "3008769599",
			Crickets = "2101148",
			ScreamingKid = "5980352978",
			BitchBot = "5709456554",
			["BitchBot Head"] = "5043539486",
			["BitchBot Body"] = "3744371342",
			["Minecraft Experience "] = "1053296915",
			BameWare = "7898991882",
			Fatality = "7347423703",
			["Fatality MKX"] = "6721975770",
			["Fatality Original"] = "158012252",
			["Doublekill 1"] = "1950547222",
			["Doublekill 2"] = "130819307",
			["Killing Spree 1"] = "723054723",
			["Killing Spree 2"] = "937898383",
			["Sit Dog"] = "7349055654",
			Csgo = "7269900245",
			Bop = "8829676038",
			["Grenade Hit"] = "5684745272",
			KillTrocity = "6818544945",
			["Double Kill"] = "6818527307",
			["Triple kill"] = "6818526855",
			["Over Kill"] = "6818526995",
			["Kill Tacular"] = "6818527070",
			["Kill Imanjaro"] = "6818527258",
			["Kill Tastrophe"] = "6818526916",
			["Kill Pocalypse"] = "6818527144",
			["Kill Ionaire"] = "6818527200",
			["Killing Spree"] = "6822465178",
			["Killing Frenzy"] = "6822465319",
			["Carrier Kill"] = "7139067012",
			["Clutch Kill"] = "7379106527",
			["Taco Bell"] = "5689199277",
			Kombat = "8527433497",
			Headshot = "8418469749",
			Elevator = "8322227967",
		},
	},
	Assets = {
		Images = {
			Girls = {
				Rem = "https://github.com/mental1illness/flohaxx-storage/blob/main/images/Rem.png?raw=true",
				Aiko = "https://github.com/mental1illness/flohaxx-storage/blob/main/images/Aiko.png?raw=true",
			},
		},
	},
	ClientScript = getsenv(WaitForChild(LocalPlayer.PlayerGui, "Client")),
	GarbageCollector = {},
	MainScreenGui = RenderObjectUtils.new("ScreenGui", { Parent = UIHolder }),
}

local SkyboxesTable = {
    Galaxy = {SkyboxBk="http://www.roblox.com/asset/?id=159454299", SkyboxDn="http://www.roblox.com/asset/?id=159454296", SkyboxFt="http://www.roblox.com/asset/?id=159454293", SkyboxLf="http://www.roblox.com/asset/?id=159454286", SkyboxRt="http://www.roblox.com/asset/?id=159454300", SkyboxUp="http://www.roblox.com/asset/?id=159454288"},
    ["Pink Sky"] = {SkyboxLf="rbxassetid://271042310", SkyboxBk="rbxassetid://271042516", SkyboxDn="rbxassetid://271077243", SkyboxFt="rbxassetid://271042556", SkyboxRt="rbxassetid://271042467", SkyboxUp="rbxassetid://271077958"},
    Sunset = {SkyboxBk="http://www.roblox.com/asset/?id=458016711", SkyboxDn="http://www.roblox.com/asset/?id=458016826", SkyboxFt="http://www.roblox.com/asset/?id=458016532", SkyboxLf="http://www.roblox.com/asset/?id=458016655", SkyboxRt="http://www.roblox.com/asset/?id=458016782", SkyboxUp="http://www.roblox.com/asset/?id=458016792"},
    Night = {SkyboxBk="rbxassetid://48020371", SkyboxDn="rbxassetid://48020144", SkyboxFt="rbxassetid://48020234", SkyboxLf="rbxassetid://48020211", SkyboxRt="rbxassetid://48020254", SkyboxUp="rbxassetid://48020383"},
    Evening = {SkyboxLf="http://www.roblox.com/asset/?id=7950573918", SkyboxBk="http://www.roblox.com/asset/?id=7950569153", SkyboxDn="http://www.roblox.com/asset/?id=7950570785", SkyboxFt="http://www.roblox.com/asset/?id=7950572449", SkyboxRt="http://www.roblox.com/asset/?id=7950575055", SkyboxUp="http://www.roblox.com/asset/?id=7950627627"},
    ["Purple Nebula"] = {SkyboxBk="rbxassetid://159454299", SkyboxDn="rbxassetid://159454296", SkyboxFt="rbxassetid://159454293", SkyboxLf="rbxassetid://159454286", SkyboxRt="rbxassetid://159454300", SkyboxUp="rbxassetid://159454288"},
    ["Night Sky"] = {SkyboxBk="rbxassetid://12064107", SkyboxDn="rbxassetid://12064152", SkyboxFt="rbxassetid://12064121", SkyboxLf="rbxassetid://12063984", SkyboxRt="rbxassetid://12064115", SkyboxUp="rbxassetid://12064131"},
    ["Pink Daylight"] = {SkyboxBk="rbxassetid://271042516", SkyboxDn="rbxassetid://271077243", SkyboxFt="rbxassetid://271042556", SkyboxLf="rbxassetid://271042310", SkyboxRt="rbxassetid://271042467", SkyboxUp="rbxassetid://271077958"},
    ["Morning Glow"] = {SkyboxBk="rbxassetid://1417494030", SkyboxDn="rbxassetid://1417494146", SkyboxFt="rbxassetid://1417494253", SkyboxLf="rbxassetid://1417494402", SkyboxRt="rbxassetid://1417494499", SkyboxUp="rbxassetid://1417494643"},
    ["Setting Sun"] = {SkyboxBk="rbxassetid://626460377", SkyboxDn="rbxassetid://626460216", SkyboxFt="rbxassetid://626460513", SkyboxLf="rbxassetid://626473032", SkyboxRt="rbxassetid://626458639", SkyboxUp="rbxassetid://626460625"},
    ["Fade Blue"] = {SkyboxBk="rbxassetid://153695414", SkyboxDn="rbxassetid://153695352", SkyboxFt="rbxassetid://153695452", SkyboxLf="rbxassetid://153695320", SkyboxRt="rbxassetid://153695383", SkyboxUp="rbxassetid://153695471"},
    ["Elegant Morning"] = {SkyboxBk="rbxassetid://153767241", SkyboxDn="rbxassetid://153767216", SkyboxFt="rbxassetid://153767266", SkyboxLf="rbxassetid://153767200", SkyboxRt="rbxassetid://153767231", SkyboxUp="rbxassetid://153767288"},
    Neptune = {SkyboxBk="rbxassetid://218955819", SkyboxDn="rbxassetid://218953419", SkyboxFt="rbxassetid://218954524", SkyboxLf="rbxassetid://218958493", SkyboxRt="rbxassetid://218957134", SkyboxUp="rbxassetid://218950090"},
    Redshift = {SkyboxBk="rbxassetid://401664839", SkyboxDn="rbxassetid://401664862", SkyboxFt="rbxassetid://401664960", SkyboxLf="rbxassetid://401664881", SkyboxRt="rbxassetid://401664901", SkyboxUp="rbxassetid://401664936"},
    ["Aesthetic Night"] = {SkyboxBk="rbxassetid://1045964490", SkyboxDn="rbxassetid://1045964368", SkyboxFt="rbxassetid://1045964655", SkyboxLf="rbxassetid://1045964655", SkyboxRt="rbxassetid://1045964655", SkyboxUp="rbxassetid://1045962969"}
}

for obj, value in getgc(true) do
	local objType = Typeof(value)
	if objType == "table" then
		if rawget(value, "ammocount") then
			GlobalState.GarbageCollector.StatusTable = value
		end
	end
end

for name, url in GlobalState.Assets.Images.Girls do
	if name and url then
		writefile(name .. ".png", game:HttpGet(url))
		GlobalState.Assets.Images.Girls[name] = getcustomasset(name .. ".png")
	end
end

pcall(function()
	setfflag("AdornShadingAPI", "true")
end)

local GlobalEnv = getgenv and getgenv()
local RobloxEnv = getrenv or getfenv()

local ObsidianRepo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
local Library = loadstring(game:HttpGet(ObsidianRepo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(ObsidianRepo .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(ObsidianRepo .. "addons/SaveManager.lua"))()

local Options = Library.Options
local Toggles = Library.Toggles

Library.ForceCheckbox = false
Library.ShowToggleFrameInKeybinds = true

local ObsidianWindow = Library:CreateWindow({
	Title = "Enderphobia",
	Footer = "t.me/Enderphobia1337",
	Icon = 112012071630242,
	NotifySide = "Right",
	ShowCustomCursor = true,
})

local UISettingsTab
local Connections = {}
local FlagTypes = {}
local TabIcons = {
	Info = "info",
	Rage = "crosshair",
	Legit = "circle-plus",
	Misc = "box",
	Esp = "user",
	Visuals = "earth",
	Skins = "palette",
	["UI Settings"] = "settings",
}

local function SanitizeFlag(flag)
	return (flag:gsub("/", "_"))
end

local function IntervalToRounding(interval)
	if interval == nil then return 0 end
	local str = tostring(interval)
	local dot = string.find(str, "%.")
	if not dot then return 0 end
	return #str - dot
end

local function KeyCodeToString(key)
	if typeof(key) == "EnumItem" then
		return key.Name
	end
	return tostring(key)
end

local function ModeToObsidian(mode)
	mode = string.lower(mode or "toggle")
	if mode == "hold" then return "Hold" end
	if mode == "press" then return "Press" end
	if mode == "always" then return "Always" end
	return "Toggle"
end

local function WrapColorAlphaCallback(callback, idx)
	if not callback then return nil end
	return function(color)
		local transparency = Options[idx] and Options[idx].Transparency or 0
		callback({ Color = color, Transparency = transparency })
	end
end

local Flags = setmetatable({}, {
	__index = function(_, flag)
		local flagType = FlagTypes[flag]
		if flagType == "keybind" then
			local idx = SanitizeFlag(flag)
			local picker = Options[idx]
			if picker then
				return { Active = picker:GetState() == true }
			end
			return { Active = false }
		end
		if flagType == "color" then
			local idx = SanitizeFlag(flag)
			local picker = Options[idx]
			if picker then
				return {
					Color = picker.Value,
					Transparency = picker.Transparency or 0,
				}
			end
			return { Color = Color3.new(1, 1, 1), Transparency = 0 }
		end
		if flagType == "toggle" then
			local idx = SanitizeFlag(flag)
			local toggle = Toggles[idx]
			if toggle then return toggle.Value end
			return false
		end
		if flagType == "option" then
			local idx = SanitizeFlag(flag)
			local option = Options[idx]
			if option then return option.Value end
			return nil
		end
		return nil
	end,
})

local function ChangeCharacter(model)
	local character = localPlayer.Character;
	if not character then
		return;
	end
	for _, item in ipairs(character:GetChildren()) do
		if item:IsA("Accessory") then
			item:Destroy();
		end
	end
	for _, part in ipairs(character:GetDescendants()) do
		if part:IsA("BasePart") then
			local newPart = model:FindFirstChild(part.Name, true);
			if (newPart and newPart:IsA("BasePart")) then
				part.Color = newPart.Color;
				part.Transparency = newPart.Transparency;
				local colorVal = Instance.new("Color3Value");
				colorVal.Name = "OriginalColor";
				colorVal.Value = part.Color;
				colorVal.Parent = part;
				local materialVal = Instance.new("StringValue");
				materialVal.Name = "OriginalMaterial";
				materialVal.Value = tostring(part.Material);
				materialVal.Parent = part;
			end
		end
	end
	local srcBodyColors = model:FindFirstChildOfClass("BodyColors");
	local dstBodyColors = character:FindFirstChildOfClass("BodyColors");
	if (srcBodyColors and dstBodyColors) then
		pcall(function()
			dstBodyColors.HeadColor = srcBodyColors.HeadColor;
			dstBodyColors.TorsoColor = srcBodyColors.TorsoColor;
			dstBodyColors.LeftArmColor = srcBodyColors.LeftArmColor;
			dstBodyColors.RightArmColor = srcBodyColors.RightArmColor;
			dstBodyColors.LeftLegColor = srcBodyColors.LeftLegColor;
			dstBodyColors.RightLegColor = srcBodyColors.RightLegColor;
		end);
		pcall(function()
			dstBodyColors.HeadColor3 = srcBodyColors.HeadColor3;
			dstBodyColors.TorsoColor3 = srcBodyColors.TorsoColor3;
			dstBodyColors.LeftArmColor3 = srcBodyColors.LeftArmColor3;
			dstBodyColors.RightArmColor3 = srcBodyColors.RightArmColor3;
			dstBodyColors.LeftLegColor3 = srcBodyColors.LeftLegColor3;
			dstBodyColors.RightLegColor3 = srcBodyColors.RightLegColor3;
		end);
	end
	local head = character:FindFirstChild("Head");
	local newHead = model:FindFirstChild("Head");
	if (head and newHead) then
		for _, decal in ipairs(head:GetChildren()) do
			if decal:IsA("Decal") then
				decal:Destroy();
			end
		end
		for _, newDecal in ipairs(newHead:GetChildren()) do
			if newDecal:IsA("Decal") then
				local clonedDecal = newDecal:Clone();
				clonedDecal.Parent = head;
				local textureVal = Instance.new("StringValue");
				textureVal.Name = "OriginalFaceTexture";
				textureVal.Value = clonedDecal.Texture;
				textureVal.Parent = clonedDecal;
			end
		end
	end
	local function copyClothing(className)
		local old = character:FindFirstChildOfClass(className);
		if old then
			old:Destroy();
		end
		local new = model:FindFirstChildOfClass(className);
		if new then
			local clone = new:Clone();
			clone.Parent = character;
			local value = Instance.new("StringValue");
			value.Name = "OriginalTexture";
			value.Value = clone[className .. "Template"];
			value.Parent = clone;
		end
	end
	copyClothing("Shirt");
	copyClothing("Pants");
	for _, accessory in ipairs(model:GetChildren()) do
		if accessory:IsA("Accessory") then
			local cloned = accessory:Clone();
			local handle = cloned:FindFirstChild("Handle");
			if handle then
				for _, weld in ipairs(handle:GetChildren()) do
					if (weld:IsA("Weld") and weld.Part1) then
						local match = character:FindFirstChild(weld.Part1.Name);
						if match then
							weld.Part1 = match;
						end
					end
				end
				local colorVal = Instance.new("Color3Value");
				colorVal.Name = "OriginalColor";
				colorVal.Value = handle.Color;
				colorVal.Parent = handle;
				local materialVal = Instance.new("StringValue");
				materialVal.Name = "OriginalMaterial";
				materialVal.Value = tostring(handle.Material);
				materialVal.Parent = handle;
			end
			cloned.Parent = character;
		end
	end
end

local function TrackConnection(signal, callback)
	local conn = signal:Connect(callback)
	TableInsert(Connections, conn)
	return conn
end

local function CreateSectionMethods(groupbox)
	local section = {}

	function section:Toggle(opts)
		opts = opts or {}
		local idx = SanitizeFlag(opts.Flag)
		FlagTypes[opts.Flag] = "toggle"
		local toggleObj = groupbox:AddToggle(idx, {
			Text = opts.Name,
			Default = opts.Default == true,
			Tooltip = opts.Tooltip,
			Callback = opts.Callback,
		})
		local chain = {}
		function chain:Keybind(kbOpts)
			kbOpts = kbOpts or {}
			FlagTypes[kbOpts.Flag] = "keybind"
			local kbIdx = SanitizeFlag(kbOpts.Flag)
			toggleObj:AddKeyPicker(kbIdx, {
				Default = KeyCodeToString(kbOpts.Key or Enum.KeyCode.Unknown),
				SyncToggleState = true,
				Mode = ModeToObsidian(kbOpts.Mode),
				Text = kbOpts.Name or kbOpts.Flag,
				NoUI = false,
			})
			return chain
		end
		function chain:Colorpicker(cpOpts)
			cpOpts = cpOpts or {}
			FlagTypes[cpOpts.Flag] = "color"
			local cpIdx = SanitizeFlag(cpOpts.Flag)
			local defaultColor = cpOpts.Default or cpOpts.Color or Color3.new(1, 1, 1)
			local pickerOptions = {
				Default = defaultColor,
				Title = cpOpts.Name,
				Callback = WrapColorAlphaCallback(cpOpts.Callback, cpIdx),
			}
			if cpOpts.Alpha ~= nil then
				pickerOptions.Transparency = cpOpts.Alpha
			end
			toggleObj:AddColorPicker(cpIdx, pickerOptions)
			if cpOpts.Callback then
				Options[cpIdx]:OnChanged(function()
					cpOpts.Callback({
						Color = Options[cpIdx].Value,
						Transparency = Options[cpIdx].Transparency or 0,
					})
				end)
			end
			return chain
		end
		function chain:Slider(slOpts)
			slOpts = slOpts or {}
			FlagTypes[slOpts.Flag] = "option"
			groupbox:AddSlider(SanitizeFlag(slOpts.Flag), {
				Text = slOpts.Name,
				Default = slOpts.Default or slOpts.Min or 0,
				Min = slOpts.Min or 0,
				Max = slOpts.Max or 100,
				Rounding = IntervalToRounding(slOpts.Interval),
				Suffix = slOpts.Suffix,
				Callback = slOpts.Callback,
			})
			return chain
		end
		return chain
	end

	function section:Slider(opts)
		opts = opts or {}
		FlagTypes[opts.Flag] = "option"
		groupbox:AddSlider(SanitizeFlag(opts.Flag), {
			Text = opts.Name,
			Default = opts.Default or opts.Min or 0,
			Min = opts.Min or 0,
			Max = opts.Max or 100,
			Rounding = IntervalToRounding(opts.Interval),
			Suffix = opts.Suffix,
			Callback = opts.Callback,
		})
	end

	function section:Dropdown(opts)
		opts = opts or {}
		FlagTypes[opts.Flag] = "option"
		local idx = SanitizeFlag(opts.Flag)
		groupbox:AddDropdown(idx, {
			Values = opts.Items or {},
			Default = opts.Default or (opts.Items and opts.Items[1]),
			Multi = false,
			Text = opts.Name,
			Searchable = opts.Scrolling == true,
			Callback = opts.Callback,
		})
	end

	function section:MultiDropdown(opts)
		opts = opts or {}
		FlagTypes[opts.Flag] = "option"
		local idx = SanitizeFlag(opts.Flag)
		groupbox:AddDropdown(idx, {
			Values = opts.Items or {},
			Default = opts.Default or {},
			Multi = true,
			Text = opts.Name,
			Tooltip = opts.Tooltip,
			Searchable = opts.Scrolling == true,
			Callback = opts.Callback,
		})
	end

	function section:Input(opts)
    	opts = opts or {}
    	FlagTypes[opts.Flag] = "option"
    	local idx = SanitizeFlag(opts.Flag)
    	groupbox:AddInput(idx, {
        	Text = opts.Name,
        	Default = opts.Default or "",
        	Numeric = opts.Numeric or false,
        	Finished = opts.Finished or false,
        	ClearTextOnFocus = opts.ClearTextOnFocus ~= false,
        	Placeholder = opts.Placeholder or "",
        	Callback = opts.Callback,
    	})
	end

	function section:Label(text)
		groupbox:AddLabel(text)
	end

	function section:Button(opts)
		opts = opts or {}
		groupbox:AddButton({
			Text = opts.Name,
			Func = opts.Callback or function() end,
			DoubleClick = false,
		})
	end

	function section:ButtonHolder(text)
		if type(text) == "table" then
			text = text[1]
		end
		if text then
			groupbox:AddDivider(text)
		else
			groupbox:AddDivider()
		end
	end

	function section:List(opts)
		opts = opts or {}
		FlagTypes[opts.Flag] = "option"
		local idx = SanitizeFlag(opts.Flag)
		groupbox:AddDropdown(idx, {
			Values = opts.Items or {},
			Default = opts.Items and opts.Items[1],
			Multi = false,
			Text = opts.Name,
			Searchable = true,
		})
		local listObj = {}
		function listObj.RefreshOptions(newItems)
			local dropdown = Options[idx]
			if dropdown then
				dropdown:SetValues(newItems or {})
				if newItems and newItems[1] then
					dropdown:SetValue(newItems[1])
				end
			end
		end
		return listObj
	end

	function section:AddDependencyBox()
		return groupbox:AddDependencyBox()
	end

	return section
end

local function CreateColumn(tabObj)
	if not tabObj._columnCounts then tabObj._columnCounts = 0 end
	tabObj._columnCounts = tabObj._columnCounts + 1
	local isLeft = tabObj._columnCounts == 1

	local column = {}
	function column:Section(opts)
		opts = opts or {}
		local groupbox
		if isLeft then
			groupbox = tabObj:AddLeftGroupbox(opts.Name)
		else
			groupbox = tabObj:AddRightGroupbox(opts.Name)
		end
		return CreateSectionMethods(groupbox)
	end

	function column:MultiSection(opts)
		opts = opts or {}
		local sections = {}
		for i, name in ipairs(opts.Names) do
			local groupbox
			if isLeft then
				groupbox = tabObj:AddLeftGroupbox(name)
			else
				groupbox = tabObj:AddRightGroupbox(name)
			end
			sections[i] = CreateSectionMethods(groupbox)
		end
		return sections
	end

	return column
end

local UILibrary = {
	Flags = Flags,
	Directory = "Enderphobia",
	OldConfig = {},
}

function UILibrary:Window(opts)
	opts = opts or {}
	ObsidianWindow.Title = opts.name or opts.Name or "Menu"
	return {
		Tab = function(_, tabOpts)
			tabOpts = tabOpts or {}
			local tabName = tabOpts.name or tabOpts.Name or "Tab"
			local icon = TabIcons[tabName] or "circle"
			local tabObj = ObsidianWindow:AddTab(tabName, icon)
			tabObj._columnCounts = 0
			return {
				Column = function()
					return CreateColumn(tabObj)
				end,
			}
		end,
	}
end

function UILibrary:Notification(opts)
	opts = opts or {}
	local text = opts.Text or opts.text or ""
	Library:Notify({
		Title = "Menu",
		Description = text,
		Time = 4,
	})
end

function UILibrary:Connection(signal, callback)
	return TrackConnection(signal, callback)
end

function UILibrary:GetConfig()
	local config = {}
	for flag, flagType in FlagTypes do
		if flagType == "toggle" then
			local idx = SanitizeFlag(flag)
			if Toggles[idx] then config[flag] = Toggles[idx].Value end
		elseif flagType == "option" then
			local idx = SanitizeFlag(flag)
			if Options[idx] then config[flag] = Options[idx].Value end
		elseif flagType == "color" then
			local idx = SanitizeFlag(flag)
			if Options[idx] then
				config[flag] = {
					Color = Options[idx].Value,
					Transparency = Options[idx].Transparency or 0,
				}
			end
		end
	end
	return config
end

do
    if not GlobalState.MapObjects then
        GlobalState.MapObjects = {
            Drop = {},
            C4 = nil,
            C4Gui = nil,
            C4TimerValue = 40,
            C4TimerRunning = false,
            C4TimerStartTime = 0,
        }
    end

    if not GlobalState.Esp then
        GlobalState.Esp = {}
    end
    
    if not GlobalState.Esp.Holder2 then
        GlobalState.Esp.Holder2 = RenderObjectUtils.new("ScreenGui", { Parent = UIHolder })
    end

    function GlobalState.Esp.FixTextPadding(textLabel)
        if not textLabel then return end
        local fontFace = textLabel.FontFace
        local fontName = ""
        if LoadedFonts then
            for name, font in LoadedFonts do
                if font == fontFace then
                    fontName = name
                    break
                end
            end
        end

        if GlobalState.Esp.TextOffsets and GlobalState.Esp.TextOffsets[fontName] then
            local offsets = GlobalState.Esp.TextOffsets[fontName]
            local sideName = textLabel.Parent and textLabel.Parent.Name or ""
            local textWidth, textHeight = GlobalState.Utility.GetTextBounds(
                textLabel.Text,
                textLabel.FontFace,
                textLabel.TextSize
            )
            if offsets.Side and offsets.Side[sideName] then
                local sideOffsets = offsets.Side[sideName]
                textLabel.Size = UDim2FromOffset(textWidth + sideOffsets.X, textHeight + sideOffsets.Y)
            else
                textLabel.Size = UDim2FromOffset(textWidth + offsets.X, textHeight + offsets.Y)
            end
        else
            local textWidth, textHeight = GlobalState.Utility.GetTextBounds(
                textLabel.Text,
                textLabel.FontFace,
                textLabel.TextSize
            )
            textLabel.Size = UDim2FromOffset(textWidth, textHeight)
        end
    end

    local function GetC4Position(c4)
        if not c4 then return nil end
        if c4:IsA("BasePart") then
            return c4.Position
        elseif c4:IsA("Model") then
            local hrp = c4:FindFirstChild("HumanoidRootPart") or c4:FindFirstChild("Head") or c4:FindFirstChild("Torso")
            if hrp and hrp:IsA("BasePart") then
                return hrp.Position
            end
            for _, child in ipairs(c4:GetChildren()) do
                if child:IsA("BasePart") then
                    return child.Position
                end
            end
        end
        return nil
    end

    local function UpdateDrop()
        local enabled = Flags["Map/Drop"] or false
        local color = Flags["Map/DropColor"] and Flags["Map/DropColor"].Color or Color3.new(1,1,1)
        local transparency = Flags["Map/DropTransparency"] or 0

        local debris = Workspace:FindFirstChild("Debris")
        if not debris then return end

        local currentObjects = {}
        for _, obj in ipairs(debris:GetChildren()) do
            if (obj:IsA("Part") or obj:IsA("MeshPart")) then
                local name = obj.Name
                if name ~= "Bullet" and name ~= "Model" and name ~= "Part" and not obj:IsA("SurfaceGui") then
                    currentObjects[obj] = true
                end
            end
        end

        for obj, data in pairs(GlobalState.MapObjects.Drop) do
            if not currentObjects[obj] then
                if data.Label then
                    data.Label:Destroy()
                end
                GlobalState.MapObjects.Drop[obj] = nil
            end
        end

        for obj, _ in pairs(currentObjects) do
            if not GlobalState.MapObjects.Drop[obj] then
                if GlobalState.Esp and GlobalState.Esp.Holder2 then
                    local label = RenderObjectUtils.new("TextLabel", {
                        Parent = GlobalState.Esp.Holder2,
                        Font = LoadedFonts.SmallestPixel7,
                        TextSize = 9,
                        Text = obj.Name,
                        TextColor3 = color,
                        TextTransparency = transparency,
                        BackgroundTransparency = 1,
                        ZIndex = 10,
                        Visible = enabled,
                    })
                    RenderObjectUtils.new("UIStroke", {
                        Parent = label,
                        Thickness = 1,
                        Color = Color3.fromRGB(0,0,0),
                        LineJoinMode = "Miter",
                    })
                    GlobalState.Esp.FixTextPadding(label)
                    GlobalState.MapObjects.Drop[obj] = { Label = label }
                end
            else
                local data = GlobalState.MapObjects.Drop[obj]
                data.Label.Text = obj.Name
                data.Label.TextColor3 = color
                data.Label.TextTransparency = transparency
                data.Label.Visible = enabled
                GlobalState.Esp.FixTextPadding(data.Label)
            end

            if GlobalState.MapObjects.Drop[obj] and GlobalState.MapObjects.Drop[obj].Label then
                local pos, onScreen = CurrentCamera:WorldToViewportPoint(obj.Position)
                local label = GlobalState.MapObjects.Drop[obj].Label
                if onScreen then
                    label.Position = UDim2.new(0, pos.X, 0, pos.Y)
                    label.Visible = enabled
                else
                    label.Visible = false
                end
            end
        end
    end

    local function UpdateC4()
        local enabled = Flags["Map/C4"] or false
        local colorC4 = Flags["Map/C4Color"] and Flags["Map/C4Color"].Color or Color3.new(1,1,1)
        local colorTimer = Flags["Map/C4TimerColor"] and Flags["Map/C4TimerColor"].Color or Color3.new(1,1,1)
        local transparency = Flags["Map/C4Transparency"] or 0

        local c4 = Workspace:FindFirstChild("C4")
        
        if c4 and not GlobalState.MapObjects.C4TimerRunning then
            GlobalState.MapObjects.C4TimerRunning = true
            GlobalState.MapObjects.C4TimerStartTime = tick()
            GlobalState.MapObjects.C4TimerValue = 40
            GlobalState.MapObjects.C4 = c4
        end
        
        if not c4 then
            if GlobalState.MapObjects.C4Gui then
                if GlobalState.MapObjects.C4Gui.LabelC4 then GlobalState.MapObjects.C4Gui.LabelC4:Destroy() end
                if GlobalState.MapObjects.C4Gui.LabelTimer then GlobalState.MapObjects.C4Gui.LabelTimer:Destroy() end
                GlobalState.MapObjects.C4Gui = nil
            end
            GlobalState.MapObjects.C4 = nil
            GlobalState.MapObjects.C4TimerRunning = false
            GlobalState.MapObjects.C4TimerValue = 40
            return
        end
		
        if GlobalState.MapObjects.C4TimerRunning then
            local elapsed = tick() - GlobalState.MapObjects.C4TimerStartTime
            GlobalState.MapObjects.C4TimerValue = math.max(0, 40 - elapsed)
        end

        local c4Pos = GetC4Position(c4)
        if not c4Pos then return end

        local timer = GlobalState.MapObjects.C4TimerValue
        
        if GlobalState.Esp and GlobalState.Esp.Holder2 then
            if not GlobalState.MapObjects.C4Gui then
                local labelC4 = RenderObjectUtils.new("TextLabel", {
                    Parent = GlobalState.Esp.Holder2,
                    Font = LoadedFonts.SmallestPixel7,
                    TextSize = 9,
                    Text = "C4",
                    TextColor3 = colorC4,
                    TextTransparency = transparency,
                    BackgroundTransparency = 1,
                    ZIndex = 10,
                    Visible = enabled,
                })
                RenderObjectUtils.new("UIStroke", {
                    Parent = labelC4,
                    Thickness = 1,
                    Color = Color3.fromRGB(0,0,0),
                    LineJoinMode = "Miter",
                })
                GlobalState.Esp.FixTextPadding(labelC4)

                local labelTimer = RenderObjectUtils.new("TextLabel", {
                    Parent = GlobalState.Esp.Holder2,
                    Font = LoadedFonts.SmallestPixel7,
                    TextSize = 9,
                    Text = "40.00",
                    TextColor3 = colorTimer,
                    TextTransparency = transparency,
                    BackgroundTransparency = 1,
                    ZIndex = 10,
                    Visible = enabled,
                })
                RenderObjectUtils.new("UIStroke", {
                    Parent = labelTimer,
                    Thickness = 1,
                    Color = Color3.fromRGB(0,0,0),
                    LineJoinMode = "Miter",
                })
                GlobalState.Esp.FixTextPadding(labelTimer)

                GlobalState.MapObjects.C4Gui = {
                    LabelC4 = labelC4,
                    LabelTimer = labelTimer,
                }
            else
                local gui = GlobalState.MapObjects.C4Gui
                gui.LabelC4.TextColor3 = colorC4
                gui.LabelC4.TextTransparency = transparency
                gui.LabelC4.Visible = enabled
                gui.LabelTimer.TextColor3 = colorTimer
                gui.LabelTimer.TextTransparency = transparency
                gui.LabelTimer.Visible = enabled
            end

            local timerStr = string.format("%05.2f", timer)
            local gui = GlobalState.MapObjects.C4Gui
            if gui.LabelTimer.Text ~= timerStr then
                gui.LabelTimer.Text = timerStr
                GlobalState.Esp.FixTextPadding(gui.LabelTimer)
            end

            local pos, onScreen = CurrentCamera:WorldToViewportPoint(c4Pos)
            if onScreen and timer > 0 then
                local c4Label = gui.LabelC4
                local timerLabel = gui.LabelTimer
                local c4Size = c4Label.AbsoluteSize
                local timerSize = timerLabel.AbsoluteSize
                local totalHeight = c4Size.Y + timerSize.Y + 2
                local startY = pos.Y - totalHeight/2
                c4Label.Position = UDim2.new(0, pos.X - c4Size.X/2, 0, startY)
                timerLabel.Position = UDim2.new(0, pos.X - timerSize.X/2, 0, startY + c4Size.Y + 2)
                c4Label.Visible = enabled
                timerLabel.Visible = enabled
            else
                gui.LabelC4.Visible = false
                gui.LabelTimer.Visible = false
            end

            if timer <= 0 then
                gui.LabelC4.Visible = false
                gui.LabelTimer.Visible = false
            end
        end
    end

    local function UpdateMapObjects()
        UpdateDrop()
        UpdateC4()
    end

    RunService.RenderStepped:Connect(UpdateMapObjects)

    local function SetupMapToggleListeners()
        local flags = {"Map/Drop", "Map/C4"}
        for _, flag in ipairs(flags) do
            local idx = SanitizeFlag(flag)
            local toggle = Toggles[idx]
            if toggle then
                toggle:OnChanged(function() end)
            end
        end
    end
    SetupMapToggleListeners()
    UpdateMapObjects()
end

function UILibrary:UpdateTheme(_, _)
end

function UILibrary:ConfigListUpdate()
	if UISettingsTab then return end
	UISettingsTab = ObsidianWindow:AddTab("UI Settings", TabIcons["UI Settings"])
	local MenuGroup = UISettingsTab:AddLeftGroupbox("Menu", "wrench")

	MenuGroup:AddToggle("KeybindMenuOpen", {
		Default = Library.KeybindFrame.Visible,
		Text = "Open Keybind Menu",
		Callback = function(value)
			Library.KeybindFrame.Visible = value
		end,
	})
	MenuGroup:AddToggle("ShowCustomCursor", {
		Text = "Custom Cursor",
		Default = true,
		Callback = function(value)
			Library.ShowCustomCursor = value
		end,
	})
	MenuGroup:AddDropdown("NotificationSide", {
		Values = { "Left", "Right" },
		Default = "Right",
		Text = "Notification Side",
		Callback = function(value)
			Library:SetNotifySide(value)
		end,
	})
	MenuGroup:AddSlider("UICornerSlider", {
		Text = "Corner Radius",
		Default = Library.CornerRadius,
		Min = 0,
		Max = 20,
		Rounding = 0,
		Callback = function(value)
			ObsidianWindow:SetCornerRadius(value)
		end,
	})
	MenuGroup:AddDivider()
	MenuGroup:AddLabel("Menu bind"):AddKeyPicker("MenuKeybind", {
		Default = "End",
		NoUI = true,
		Text = "Menu keybind",
	})
	MenuGroup:AddButton({
		Text = "Unload",
		Func = function()
			for _, conn in Connections do
				pcall(function() conn:Disconnect() end)
			end
			Library:Unload()
		end,
	})

	Library.ToggleKeybind = Options.MenuKeybind

	ThemeManager:SetLibrary(Library)
	SaveManager:SetLibrary(Library)
	SaveManager:IgnoreThemeSettings()
	SaveManager:SetIgnoreIndexes({ "MenuKeybind" })
	ThemeManager:SetFolder("Enderphobia")
	SaveManager:SetFolder("Enderphobia/menu")
	SaveManager:BuildConfigSection(UISettingsTab)
	ThemeManager:ApplyToTab(UISettingsTab)
	SaveManager:LoadAutoloadConfig()

	if makefolder then
		pcall(makefolder, "Enderphobia")
		pcall(makefolder, "Enderphobia/lua")
	end
end

Library:OnUnload(function()
	for _, conn in Connections do
		pcall(function() conn:Disconnect() end)
	end
end)

local UIPresets = { Preset = {} }
local Flags = UILibrary.Flags
local SignalModule = (function()
    local signal = {}
    signal.__index = signal

    function signal.new()
        local self = setmetatable({}, signal)
        self.connections = {}
        self._is_destroyed = false
        return self
    end

    function signal:Connect(func)
        if self._is_destroyed then return nil end
        if type(func) ~= "function" then warn("u need a function", 2) end

        local connection = {}
        local key = connection

        self.connections[key] = func

        function connection:Disconnect()
            if self._signal then
                self._signal.connections[key] = nil
                self._signal = nil
            end
        end
        connection.disconnect = connection.Disconnect

        connection._signal = self
        return connection
    end

    function signal:Fire(...)
        if self._is_destroyed then return end
        for _, func in pairs(self.connections) do
            task.spawn(func, ...)
        end
    end

    function signal:Destroy()
        self._is_destroyed = true
        for key, _ in pairs(self.connections) do
            self.connections[key] = nil
        end
        self.connections = nil
        setmetatable(self, nil)
    end

    return signal
end)()
local GlobalSignals = { EspChanged = SignalModule.new() }
local GlobalEvents = {
	Events = {
		HitPlayer = SignalModule.new(),
		KillPlayer = SignalModule.new(),
	},
	RageBot = {
		TargetChanged = SignalModule.new(),
		Fired = SignalModule.new(),
	},
}

local HitmarkerData = { Hitmarker = {} }

do
	local HitmarkerMain = RenderObjectUtils.new("Frame", {
		BorderColor3 = Color3FromRGB(0, 0, 0),
		Parent = GlobalState.MainScreenGui,
		Rotation = 45,
		Name = "Hitmarker",
		BackgroundTransparency = 1,
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = NewVector2(0.5, 0.5),
		Size = UDim2FromOffset(25, 26),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3FromRGB(255, 255, 255),
	})

	local TopLine = RenderObjectUtils.new("Frame", {
		AnchorPoint = NewVector2(0.5, 0),
		Parent = HitmarkerMain,
		Name = "Frame2",
		Position = UDim2.fromScale(0.5, 0),
		BorderColor3 = Color3FromRGB(0, 0, 0),
		Size = UDim2FromOffset(1, 10),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3FromRGB(255, 255, 255),
	})

	local LeftLine = RenderObjectUtils.new("Frame", {
		AnchorPoint = NewVector2(0, 0.5),
		Parent = HitmarkerMain,
		Name = "Frame3",
		Position = UDim2.fromScale(0, 0.5),
		BorderColor3 = Color3FromRGB(0, 0, 0),
		Size = UDim2FromOffset(10, 1),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3FromRGB(255, 255, 255),
	})

	local RightLine = RenderObjectUtils.new("Frame", {
		AnchorPoint = NewVector2(1, 0.5),
		Parent = HitmarkerMain,
		Name = "Frame4",
		Position = UDim2.fromScale(1, 0.5),
		BorderColor3 = Color3FromRGB(0, 0, 0),
		Size = UDim2FromOffset(10, 1),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3FromRGB(255, 255, 255),
	})

	local BottomLine = RenderObjectUtils.new("Frame", {
		AnchorPoint = NewVector2(0.5, 1),
		Parent = HitmarkerMain,
		Position = UDim2.fromScale(0.5, 1),
		BorderColor3 = Color3FromRGB(0, 0, 0),
		Size = UDim2FromOffset(1, 10),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3FromRGB(255, 255, 255),
	})

	RenderObjectUtils.new("ImageLabel", {
		Parent = BottomLine,
		Name = "Glow",
		ImageColor3 = Color3FromRGB(255, 255, 255),
		ScaleType = "Slice",
		ImageTransparency = 0.8999999761581421,
		BorderColor3 = Color3FromRGB(0, 0, 0),
		BackgroundColor3 = Color3FromRGB(255, 255, 255),
		Image = "http://www.roblox.com/asset/?id=18245826428",
		BackgroundTransparency = 1,
		Position = NewUDim2(0, -20, 0, -20),
		Size = NewUDim2(1, 40, 0, 42),
		ZIndex = 2,
		BorderSizePixel = 0,
		SliceCenter = Rect.new(NewVector2(21, 21), NewVector2(79, 79)),
	})
	RenderObjectUtils.new("ImageLabel", {
		Parent = RightLine,
		Name = "Glow",
		ImageColor3 = Color3FromRGB(255, 255, 255),
		ScaleType = "Slice",
		ImageTransparency = 0.8999999761581421,
		BorderColor3 = Color3FromRGB(0, 0, 0),
		BackgroundColor3 = Color3FromRGB(255, 255, 255),
		Image = "http://www.roblox.com/asset/?id=18245826428",
		BackgroundTransparency = 1,
		Position = NewUDim2(0, -20, 0, -20),
		Size = NewUDim2(1, 40, 0, 42),
		ZIndex = 2,
		BorderSizePixel = 0,
		SliceCenter = Rect.new(NewVector2(21, 21), NewVector2(79, 79)),
	})
	RenderObjectUtils.new("ImageLabel", {
		Parent = LeftLine,
		Name = "Glow",
		ImageColor3 = Color3FromRGB(255, 255, 255),
		ScaleType = "Slice",
		ImageTransparency = 0.8999999761581421,
		BorderColor3 = Color3FromRGB(0, 0, 0),
		BackgroundColor3 = Color3FromRGB(255, 255, 255),
		Image = "http://www.roblox.com/asset/?id=18245826428",
		BackgroundTransparency = 1,
		Position = NewUDim2(0, -20, 0, -20),
		Size = NewUDim2(1, 40, 0, 42),
		ZIndex = 2,
		BorderSizePixel = 0,
		SliceCenter = Rect.new(NewVector2(21, 21), NewVector2(79, 79)),
	})
	RenderObjectUtils.new("ImageLabel", {
		Parent = TopLine,
		Name = "Glow",
		ImageColor3 = Color3FromRGB(255, 255, 255),
		ScaleType = "Slice",
		ImageTransparency = 0.8999999761581421,
		BorderColor3 = Color3FromRGB(0, 0, 0),
		BackgroundColor3 = Color3FromRGB(255, 255, 255),
		Image = "http://www.roblox.com/asset/?id=18245826428",
		BackgroundTransparency = 1,
		Position = NewUDim2(0, -20, 0, -20),
		Size = NewUDim2(1, 40, 0, 42),
		ZIndex = 2,
		BorderSizePixel = 0,
		SliceCenter = Rect.new(NewVector2(21, 21), NewVector2(79, 79)),
	})

	HitmarkerData.Hitmarker.Holder = HitmarkerMain
	HitmarkerData.Hitmarker.Line1 = BottomLine
	HitmarkerData.Hitmarker.Line2 = TopLine
	HitmarkerData.Hitmarker.Line3 = LeftLine
	HitmarkerData.Hitmarker.Line4 = RightLine

	for key, object in HitmarkerData.Hitmarker do
		RenderObjectUtils.SetRenderProperty(object, "BackgroundTransparency", 1)
		if FindFirstChild(object, "Glow") then
			RenderObjectUtils.SetRenderProperty(object.Glow, "ImageTransparency", 1)
		end
	end
end

local function getDisplayName()
    local base = nameChangerEnabled and (getgenv().newname or originalName) or originalName
    if clantagEnabled and getgenv().clantag and getgenv().clantag ~= "" then
        return "[" .. getgenv().clantag .. "] " .. base
    end
    return base
end

local function SetupNameChanger()
    local mt = getrawmetatable(game)
    local __oldNewIndex = mt.__newindex
    setreadonly(mt, false)

    mt.__newindex = newcclosure(function(self, k, v)
        if (game.IsA(self, "TextLabel") or game.IsA(self, "TextButton")) and k == "Text" and string.find(tostring(v), originalName) then
            return __oldNewIndex(self, k, string.gsub(tostring(v), originalName, getDisplayName()))
        end
        return __oldNewIndex(self, k, v)
    end)

    setreadonly(mt, true)

    local function patchText(v)
        if v:IsA("TextLabel") or v:IsA("TextButton") then
            local function update()
                v.Text = string.gsub(v.Text, originalName, getDisplayName())
            end
            update()
            v:GetPropertyChangedSignal("Text"):Connect(update)
        end
    end

    for _, v in pairs(game:GetDescendants()) do
        patchText(v)
    end

    game.DescendantAdded:Connect(patchText)
end

SetupNameChanger()

function UpdateOffscreenArrows()
    if not offscreenArrows.enabled then
        for player, arrowData in pairs(offscreenArrows.arrows) do
            pcall(function()
                if arrowData.fill then arrowData.fill:Remove() end
                if arrowData.line1 then arrowData.line1:Remove() end
                if arrowData.line2 then arrowData.line2:Remove() end
                if arrowData.line3 then arrowData.line3:Remove() end
                if arrowData.outline1 then arrowData.outline1:Remove() end
                if arrowData.outline2 then arrowData.outline2:Remove() end
                if arrowData.outline3 then arrowData.outline3:Remove() end
            end)
        end
        offscreenArrows.arrows = {}
        return
    end

    local viewport = currentCamera.ViewportSize
    local screenCenter = Vec2(viewport.X / 2, viewport.Y / 2)
    local arrowSize = offscreenArrows.size
    local arrowColor = offscreenArrows.color
    local arrowRadius = offscreenArrows.radius
    local arrowTransparency = offscreenArrows.transparency or 0.65
    local outlineColor = offscreenArrows.outlineColor or C3(0,0,0)
    local outlineTransparency = offscreenArrows.outlineTransparency or 0

    local camP = currentCamera.CFrame.Position
    local flatCF = CFrame.lookAt(camP, camP + (currentCamera.CFrame.LookVector * Vec3(1, 0, 1)))

    local activePlayers = {}

    for _, player in pairs(GetPlayers(Players)) do
        if player == LocalPlayer then continue end
        local char = player.Character
        if not char then continue end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then continue end
        local hum = char:FindFirstChild("Humanoid")
        if not hum or hum.Health <= 0 then continue end
        local localTeam = GlobalState.Utility.GetTeam(LocalPlayer)
        local playerTeam = GlobalState.Utility.GetTeam(player)
        if playerTeam == localTeam then continue end

        local pos, onScreen = currentCamera:WorldToViewportPoint(hrp.Position)
        if not onScreen then
            activePlayers[player] = true

            local relativePos = flatCF:PointToObjectSpace(hrp.Position)
            local angle = math.atan2(relativePos.Z, relativePos.X)
            local cx = math.cos(angle)
            local sy = math.sin(angle)
            local cx1 = math.cos(angle + math.pi/2)
            local sy1 = math.sin(angle + math.pi/2)
            local cx2 = math.cos(angle + 3*math.pi/2)
            local sy2 = math.sin(angle + 3*math.pi/2)

            local arrowOrigin = screenCenter + Vec2(cx * arrowRadius, sy * arrowRadius)
            local pA = arrowOrigin + Vec2(arrowSize * 2 * cx, arrowSize * 2 * sy)
            local pB = arrowOrigin + Vec2(arrowSize * cx1, arrowSize * sy1)
            local pC = arrowOrigin + Vec2(arrowSize * cx2, arrowSize * sy2)

            if not offscreenArrows.arrows[player] then
                local fill = Drawing.new("Triangle")
                local line1 = Drawing.new("Line")
                local line2 = Drawing.new("Line")
                local line3 = Drawing.new("Line")
                local outline1 = Drawing.new("Line")
                local outline2 = Drawing.new("Line")
                local outline3 = Drawing.new("Line")
                
                fill.Filled = true
                fill.Visible = false
                line1.Visible = false
                line2.Visible = false
                line3.Visible = false
                outline1.Visible = false
                outline2.Visible = false
                outline3.Visible = false

                offscreenArrows.arrows[player] = {
                    fill = fill,
                    line1 = line1,
                    line2 = line2,
                    line3 = line3,
                    outline1 = outline1,
                    outline2 = outline2,
                    outline3 = outline3
                }
            end

            local arrowData = offscreenArrows.arrows[player]
            local thickness = 2
            local outlineThickness = thickness + 3

            arrowData.fill.PointA = pA
            arrowData.fill.PointB = pB
            arrowData.fill.PointC = pC
            arrowData.fill.Color = arrowColor
            arrowData.fill.Transparency = arrowTransparency
            arrowData.fill.Visible = true

            arrowData.outline1.From = pA
            arrowData.outline1.To = pB
            arrowData.outline1.Color = outlineColor
            arrowData.outline1.Thickness = outlineThickness
            arrowData.outline1.Transparency = outlineTransparency
            arrowData.outline1.Visible = true

            arrowData.outline2.From = pB
            arrowData.outline2.To = pC
            arrowData.outline2.Color = outlineColor
            arrowData.outline2.Thickness = outlineThickness
            arrowData.outline2.Transparency = outlineTransparency
            arrowData.outline2.Visible = true

            arrowData.outline3.From = pC
            arrowData.outline3.To = pA
            arrowData.outline3.Color = outlineColor
            arrowData.outline3.Thickness = outlineThickness
            arrowData.outline3.Transparency = outlineTransparency
            arrowData.outline3.Visible = true

            arrowData.line1.From = pA
            arrowData.line1.To = pB
            arrowData.line1.Color = arrowColor
            arrowData.line1.Thickness = thickness
            arrowData.line1.Transparency = arrowTransparency
            arrowData.line1.Visible = true

            arrowData.line2.From = pB
            arrowData.line2.To = pC
            arrowData.line2.Color = arrowColor
            arrowData.line2.Thickness = thickness
            arrowData.line2.Transparency = arrowTransparency
            arrowData.line2.Visible = true

            arrowData.line3.From = pC
            arrowData.line3.To = pA
            arrowData.line3.Color = arrowColor
            arrowData.line3.Thickness = thickness
            arrowData.line3.Transparency = arrowTransparency
            arrowData.line3.Visible = true
        end
    end

    for player, arrowData in pairs(offscreenArrows.arrows) do
        if not activePlayers[player] then
            pcall(function()
                arrowData.fill.Visible = false
                arrowData.line1.Visible = false
                arrowData.line2.Visible = false
                arrowData.line3.Visible = false
                arrowData.outline1.Visible = false
                arrowData.outline2.Visible = false
                arrowData.outline3.Visible = false
            end)
            local stillExists = pcall(function() return player and player.Parent end)
            if not stillExists then
                pcall(function()
                    arrowData.fill:Remove()
                    arrowData.line1:Remove()
                    arrowData.line2:Remove()
                    arrowData.line3:Remove()
                    arrowData.outline1:Remove()
                    arrowData.outline2:Remove()
                    arrowData.outline3:Remove()
                end)
                offscreenArrows.arrows[player] = nil
            end
        end
    end
end

local function getScope()
    local pg = localPlayer.PlayerGui
    local gui = pg:FindFirstChild("GUI")
    if not gui then return nil end
    local crosshairs = gui:FindFirstChild("Crosshairs")
    if not crosshairs then return nil end
    local scope = crosshairs:FindFirstChild("Scope")
    if not scope then return nil end
    local scopeInner = scope:FindFirstChild("Scope")
    if not scopeInner then return nil end
    return scope, scopeInner, crosshairs
end

local function saveOriginalValues()
    local scope, scopeInner, crosshairs = getScope()
    if not scope then return end
    customScope.originalValues.ScopeImage = scope.Image
    customScope.originalValues.ScopeInnerImage = scopeInner.Image
    customScope.originalValues.ScopeInnerTransp = scopeInner.ImageTransparency
    local blur1 = scopeInner:FindFirstChild("Blur")
    if blur1 then
        customScope.originalValues.Blur1_ImageTransp = blur1.ImageTransparency
        local blur2 = blur1:FindFirstChild("Blur")
        if blur2 then
            customScope.originalValues.Blur2_ImageTransp = blur2.ImageTransparency
        end
    end
    for _, name in ipairs({"Frame1","Frame2","Frame3","Frame4"}) do
        local f = crosshairs:FindFirstChild(name)
        if f then
            customScope.originalValues[name .. "_BT"] = f.BackgroundTransparency
        end
    end
    customScope.originalValues.FOV = workspace.Camera.FieldOfView
end

local function applyCustomScopeSettings()
    local scope, scopeInner, crosshairs = getScope()
    if not scope then return end
    scope.Image = ""
    scopeInner.Image = ""
    local blur1 = scopeInner:FindFirstChild("Blur")
    if blur1 then
        blur1.Image = ""
        local blur2 = blur1:FindFirstChild("Blur")
        if blur2 then
            blur2.Image = ""
        end
    end
    for _, name in ipairs({"Frame1","Frame2","Frame3","Frame4"}) do
        local f = crosshairs:FindFirstChild(name)
        if f then
            f.BackgroundTransparency = 1
        end
    end
    if not Flags["Visuals/CustomScopeUseZoom"] then
        if customScope.originalValues.FOV then
            workspace.Camera.FieldOfView = customScope.originalValues.FOV
        end
    end
end

local function restoreOriginalValues()
    local scope, scopeInner, crosshairs = getScope()
    if not scope then return end
    local ov = customScope.originalValues
    scope.Image = ov.ScopeImage or ""
    scopeInner.Image = ov.ScopeInnerImage or ""
    scopeInner.ImageTransparency = ov.ScopeInnerTransp or 1
    local blur1 = scopeInner:FindFirstChild("Blur")
    if blur1 then
        blur1.ImageTransparency = ov.Blur1_ImageTransp or 1
        local blur2 = blur1:FindFirstChild("Blur")
        if blur2 then
            blur2.ImageTransparency = ov.Blur2_ImageTransp or 1
        end
    end
    for _, name in ipairs({"Frame1","Frame2","Frame3","Frame4"}) do
        local f = crosshairs:FindFirstChild(name)
        if f then
            f.BackgroundTransparency = ov[name .. "_BT"] or 0
        end
    end
end

local function createScopeLines()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "CustomScopeLines"
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.ResetOnSpawn = false
    screenGui.IgnoreGuiInset = true
    screenGui.Parent = localPlayer.PlayerGui
    local lineH = Instance.new("Frame")
    lineH.Name = "LineH"
    lineH.BackgroundColor3 = C3(0, 0, 0)
    lineH.BorderSizePixel = 0
    lineH.AnchorPoint = Vec2(0.5, 0.5)
    lineH.Position = UDim2.new(0.5, 0, 0.5, 0)
    lineH.Size = UDim2.new(1, 0, 0, 1)
    lineH.Visible = false
    lineH.Parent = screenGui
    local lineV = Instance.new("Frame")
    lineV.Name = "LineV"
    lineV.BackgroundColor3 = C3(0, 0, 0)
    lineV.BorderSizePixel = 0
    lineV.AnchorPoint = Vec2(0.5, 0.5)
    lineV.Position = UDim2.new(0.5, 0, 0.5, 0)
    lineV.Size = UDim2.new(0, 1, 1, 0)
    lineV.Visible = false
    lineV.Parent = screenGui
    customScope.crosshairGui = screenGui
    customScope.lineH = lineH
    customScope.lineV = lineV
end

local function destroyScopeLines()
    if customScope.crosshairGui then
        customScope.crosshairGui:Destroy()
        customScope.crosshairGui = nil
        customScope.lineH = nil
        customScope.lineV = nil
    end
end

local function startScopeRender()
    if customScope.renderConnection then return end
    customScope.renderConnection = runService.RenderStepped:Connect(function()
        if not customScope.enabled then return end
        local pg = localPlayer.PlayerGui
        local gui = pg:FindFirstChild("GUI")
        if not gui then return end
        local crosshairs = gui:FindFirstChild("Crosshairs")
        if not crosshairs then return end
        local scopeFrame = crosshairs:FindFirstChild("Scope")
        if not scopeFrame then return end
        if not Flags["Visuals/CustomScopeUseZoom"] then
            if customScope.originalValues.FOV then
                workspace.Camera.FieldOfView = customScope.originalValues.FOV
            end
        end
        local isScoped = scopeFrame.Visible
        if customScope.lineH then
            customScope.lineH.Visible = isScoped
        end
        if customScope.lineV then
            customScope.lineV.Visible = isScoped
        end
    end)
end

local function stopScopeRender()
    if customScope.renderConnection then
        customScope.renderConnection:Disconnect()
        customScope.renderConnection = nil
    end
    if customScope.lineH then
        customScope.lineH.Visible = false
    end
    if customScope.lineV then
        customScope.lineV.Visible = false
    end
end

local MainWindow = UILibrary:Window { name = "Enderphobia", Icon = 112012071630242 }
local Tabs = {
	[8] = { Name = "Info", Object = MainWindow:Tab { name = "Info" } },
	[1] = { Name = "RageBot", Object = MainWindow:Tab { name = "Rage",  } },
	[6] = { Name = "Legit", Object = MainWindow:Tab { name = "Legit" } },
	[3] = { Name = "ESP", Object = MainWindow:Tab { name = "Esp" } },
	[4] = { Name = "Visuals", Object = MainWindow:Tab { name = "Visuals" } },
	[2] = { Name = "Misc", Object = MainWindow:Tab { name = "Misc" } },
	[7] = { Name = "Skins", Object = MainWindow:Tab { name = "Skins" } },
}
local Columns = {
	[8] = { Name = "Info", Left = Tabs[8].Object:Column(), Right = Tabs[8].Object:Column() },
	[1] = { Name = "RageBot", Left = Tabs[1].Object:Column(), Right = Tabs[1].Object:Column() },
	[6] = { Name = "Legit", Left = Tabs[6].Object:Column(), Right = Tabs[6].Object:Column() },
	[3] = { Name = "ESP", Left = Tabs[3].Object:Column(), Right = Tabs[3].Object:Column() },
	[4] = { Name = "Visuals", Left = Tabs[4].Object:Column(), Right = Tabs[4].Object:Column() },
	[2] = { Name = "Misc", Left = Tabs[2].Object:Column(), Right = Tabs[2].Object:Column() },
	[7] = { Name = "Skins", Left = Tabs[7].Object:Column(), Right = Tabs[7].Object:Column() },
}

local function GetUserDataPath()
    if not isfolder("enderphobia") then
        makefolder("enderphobia")
    end
    return "enderphobia/userdata.json"
end

local function LoadUserData()
    local path = GetUserDataPath()
    if isfile(path) then
        local ok, data = pcall(function()
            return HttpService:JSONDecode(readfile(path))
        end)
        if ok and type(data) == "table" then
            return data
        end
    end
    return { TotalExecutions = 0 }
end

local function SaveUserData(data)
    local path = GetUserDataPath()
    pcall(function()
        writefile(path, HttpService:JSONEncode(data))
    end)
end

local UserData = LoadUserData()
UserData.TotalExecutions = (UserData.TotalExecutions or 0) + 1
SaveUserData(UserData)

local function GetExecutorInfo()
    local name, version = "Unknown", "Unknown"
    if identifyexecutor then
        local ok, n, v = pcall(identifyexecutor)
        if ok then
            if v then
                name = tostring(n or "Unknown")
                version = tostring(v)
            elseif n then
                local s = tostring(n)
                local parsedName, parsedVer = s:match("^([^%s]+)%s+v?(.+)$")
                if parsedName then
                    name = parsedName
                    version = parsedVer
                else
                    name = s
                end
            end
        end
    end
    return name, version
end

local ExecutorName, ExecutorVersion = GetExecutorInfo()

do
    local InfoColumn = Columns[8]
    local LeftInfo = InfoColumn.Left
    local RightInfo = InfoColumn.Right

    local UserSection = LeftInfo:Section { Name = "User" }
    UserSection:Label("Username: " .. LocalPlayer.Name)
    UserSection:Label("User ID: " .. tostring(LocalPlayer.UserId))
    UserSection:Label("Total Executions: " .. tostring(UserData.TotalExecutions))

    local CommunitySection = LeftInfo:Section { Name = "Community" }
    CommunitySection:Label("Want to buy a key?")
    CommunitySection:Label("Use Telegram or Funpay")
	CommunitySection:Button { Name = "Copy Funpay Link", Callback = function()
        local ok = pcall(function()
            setclipboard("https://funpay.com/users/21637949/")
        end)
    end }
    CommunitySection:Button { Name = "Copy Telegram Link (chat)", Callback = function()
        local ok = pcall(function()
            setclipboard("https://t.me/+66c2vLw1bgo2ZWRi")
        end)
    end }

    local LogsSection = RightInfo:Section { Name = "Change Logs" }
	LogsSection:Label("02.10.2026:")
    LogsSection:Label("[~] LegitBot Fix")
	LogsSection:Label("[+] PixelSurf")

    local ExecSection = RightInfo:Section { Name = "Executor" }
    ExecSection:Label("Executor: " .. ExecutorName)
    ExecSection:Label("Version: " .. ExecutorVersion)
end

do
	GlobalEnv.Enderphobia = GlobalEvents
	GlobalEnv.RobloxObj = RenderObjectUtils
	GlobalEnv.RemoteEvents = RemoteEvents
	GlobalEnv.Library = UILibrary
	GlobalEnv.Tabs = Tabs
	GlobalEnv.Columns = Columns
end

do
	local LeftColumn = Columns[1].Left
	local RightColumn = Columns[1].Right

	local LeftSection = LeftColumn:Section { Name = "Main" }
	local RightSection = RightColumn:Section { Name = "Rage" }

	LeftSection:Toggle { Name = "Enabled", Flag = "Rage/Enabled" }:Keybind { Name = "RageBot", Flag = "Rage/EnabledKey", Key = Enum.KeyCode.Unknown, Mode = "toggle" }
	LeftSection:Toggle { Name = "Multi Target", Flag = "Rage/MultiTarget" }
	LeftSection:Toggle { Name = "Use Custom Weapon", Flag = "Rage/UseCustomWeapon" }
	LeftSection:Dropdown { Name = "Custom Weapon List", Items = { "AK-47", "AWP" }, Flag = "Rage/CustomWeaponList", Default = "AK-47" }
	LeftSection:Dropdown { Name = "Fake Shoot Type", Items = { "Loud", "Normal", "Silent" }, Flag = "Rage/FakeShootType", Default = "Normal" }

	RightSection:Toggle { Name = "Auto Wall", Flag = "Rage/AutoWall" }
	RightSection:Slider { Name = "Auto Wall Maximum Wall", Default = 1, Min = 1, Max = 4, Flag = "Rage/AutoWallMaxWalls", Interval = 1 }
	RightSection:Toggle { Name = "Disable Auto Wall Dmg Reduction", Flag = "Rage/NoAutoWallDmgReduction" }
	RightSection:Toggle { Name = "Origin Scan", Flag = "Rage/OriginScan" }
	RightSection:Slider { Name = "Origin Max Scan", Default = 20, Min = 1, Max = 60, Flag = "Rage/OriginMaxScan", Interval = 1 }
	RightSection:Slider { Name = "Origin Scan Radius", Default = 6, Min = 1, Max = 20, Flag = "Rage/OriginScanRadius", Interval = 1 }
	RightSection:Toggle { Name = "Multi Point", Flag = "Rage/MultiPoint" }
	RightSection:Slider { Name = "Multi Point Scale", Default = 1, Min = 1, Max = 6, Flag = "Rage/MultiPointScale", Interval = 1 }
	RightSection:ButtonHolder { "Time manipulation" }
	RightSection:Toggle { Name = "Backtrack", Flag = "Rage/Backtrack" }
	RightSection:Slider { Name = "Backtrack Time", Default = 200, Min = 1, Max = 1000, Flag = "Rage/BacktrackTime", Interval = 1, Suffix = "ms" }
	RightSection:Toggle { Name = "Forward Track", Flag = "Rage/FTrack" }
	RightSection:Slider { Name = "Forward Track Time", Default = 500, Min = 500, Max = 5000, Flag = "Rage/FTrackTime", Interval = 1, Suffix = "ms" }
	RightSection:ButtonHolder { "Other" }
	RightSection:Toggle { Name = "Adaptive Forward Track", Flag = "Rage/FTrackAdaptive" }
	RightSection:Toggle { Name = "Camera Resolver", Flag = "Rage/CameraResolver" }
	LeftSection:Toggle { Name = "Rapid Fire", Flag = "Rage/RapidFire" }
	LeftSection:Slider { Name = "Rapid Fire Tick", Default = 0.1, Min = 0.01, Max = 0.1, Flag = "Rage/RapidFireTick", Interval = 0.01 }
	LeftSection:Toggle { Name = "Rotate Viewmodel To ", Flag = "Rage/RotateVM" }
	LeftSection:Toggle { Name = "Preparation Check", Flag = "Rage/PrepCheck" }
	LeftSection:Toggle { Name = "Time Offset", Flag = "Rage/TimeOffset", Tooltip = "The ragebot will target and try to shoot the player before the timer so for example if you do 300ms and when the timer reached 300ms then the ragebot will start targetting." }
	LeftSection:Slider { Name = "Time Offset Value", Default = 1, Min = 1, Max = 1000, Flag = "Rage/TimeOffsetValue", Interval = 1, Suffix = "ms" }
end

do
    local ups = debug.getupvalues(GlobalState.ClientScript.Button2Down)
    local v5 = ups[2]

    local skipEffects = false

    local originalTrail = GlobalState.ClientScript.createtrail
    GlobalState.ClientScript.createtrail = function(...)
        if not skipEffects then originalTrail(...) end
    end

    local originalBullethole = GlobalState.ClientScript.createbullethole
    GlobalState.ClientScript.createbullethole = function(...)
        if not skipEffects then originalBullethole(...) end
    end

    local LegitBot = {
        LastShot = 0,
        Debounce = false,
    }

    local LeftColumn = Columns[6].Left
    local LegitSection = LeftColumn:Section { Name = "LegitBot" } 
	LegitSection:Toggle { Name = "Enabled", Flag = "Legit/Enabled", Default = false }:Keybind { Name = "LegitBot", Flag = "Legit/EnabledKey", Key = Enum.KeyCode.Unknown, Mode = "toggle" }
    LegitSection:Slider { Name = "Delay (ms)", Default = 0, Min = 0, Max = 500, Flag = "Legit/Delay", Interval = 1, Suffix = "ms" }
    LegitSection:Toggle { Name = "Auto Wall", Flag = "Legit/AutoWall", Default = false }
	LegitSection:Slider { Name = "Auto Wall Max Walls", Default = 1, Min = 1, Max = 4, Flag = "Legit/AutoWallMaxWalls", Interval = 1 }
    LegitSection:Dropdown { Name = "Hitbox", Items = { "Head", "UpperTorso" }, Flag = "Legit/Hitbox", Default = "Head" }
	LegitSection:Toggle { Name = "Rotate Camera", Flag = "Legit/RotateCamera", Default = false }

    local function LegitGetTarget()
		local closest = nil
		local closestDist = math.huge

		for _, plr in ipairs(GetPlayers(Players)) do
			if plr == LocalPlayer then continue end
			if GlobalState.Utility.GetTeam(plr) == GlobalState.Utility.GetTeam(LocalPlayer) then continue end

			local status = plr:FindFirstChild("Status")
			if not status or not status.Alive or not status.Alive.Value then continue end

			local char = plr.Character
			if not char then continue end

			local hitbox = char:FindFirstChild(Flags["Legit/Hitbox"] or "Head")
			if not hitbox then continue end

			if not Flags["Legit/AutoWall"] then
				local params = RaycastParams.new()
				params.FilterType = Enum.RaycastFilterType.Exclude
				params.FilterDescendantsInstances = { LocalPlayer.Character, CurrentCamera, Workspace:FindFirstChild("Camera") }
				local dir = (hitbox.Position - CurrentCamera.CFrame.Position)
				local dist = dir.Magnitude
				local result = Workspace:Raycast(CurrentCamera.CFrame.Position, dir.Unit * dist, params)
				if not result or not result.Instance or not result.Instance:IsDescendantOf(char) then continue end
			end

			local dist = (hitbox.Position - CurrentCamera.CFrame.Position).Magnitude
			if dist < closestDist then
				closest = { Player = plr, Part = hitbox }
				closestDist = dist
			end
		end

		return closest
	end

    local function LegitThink()
        if not Flags["Legit/Enabled"] then return end
        if LegitBot.Debounce then return end

        local fgun = GlobalState.ClientScript.fgun
        if not fgun or fgun == "none" then return end
        if FindFirstChild(fgun, "Grenade") or FindFirstChild(fgun, "Stab") or fgun.Name == "C4" then return end

        local fireRate = fgun.FireRate and fgun.FireRate.Value or 0.1
        local now = tick()
        if now - LegitBot.LastShot < fireRate then return end

        local target = LegitGetTarget()
		if not target then return end
		local ammoTable = GlobalState.GarbageCollector.StatusTable
		if not ammoTable then return end
		if Flags["Legit/AutoWall"] then
			local penValue = fgun.Penetration and fgun.Penetration.Value or 100
			local success = GlobalState.RageBot.Functions.WallBang(CurrentCamera.CFrame.Position, target.Part.Position, penValue, Flags["Legit/AutoWallMaxWalls"] or 1)
			if not success then return end
		end
		LegitBot.Debounce = true

        local delay = (Flags["Legit/Delay"] or 0) / 1000
        if delay > 0 then task.wait(delay) end

		skipEffects = true
		v5.Held = true
		task.wait(0.08)
		v5.Held = false
		skipEffects = false

		if Flags["Legit/RotateCamera"] then
			local targetPos = target.Part.Position
			local camPos = CurrentCamera.CFrame.Position
			CurrentCamera.CFrame = CFrame.lookAt(camPos, camPos + (targetPos - camPos).Unit)
		end

		if not target.Player.Character then return end
		GlobalState.RageBot.Functions.HitPart(target.Player, Flags["Legit/Hitbox"] or "Head", fgun.Name, 1)

        LegitBot.LastShot = tick()
        LegitBot.Debounce = false
    end

    RunService.RenderStepped:Connect(function()
        TaskSpawn(LegitThink)
    end)
end

do
    if not GlobalState.AimAssist then
        GlobalState.AimAssist = { Functions = {} }
    end

    local LeftColumn = Columns[6].Left
    local RightColumn = Columns[6].Right

    local MainSection = LeftColumn:Section { Name = "Aim Assist" }

	MainSection:Toggle { Name = "Enabled", Flag = "AimAssist/Enabled", Default = false }:Keybind { Name = "AimAssist", Flag = "AimAssist/EnabledKey", Key = Enum.KeyCode.Unknown, Mode = "toggle" }
	MainSection:ButtonHolder { "Settings" }
    MainSection:Slider { Name = "Smoothing", Flag = "AimAssist/Smoothing", Default = 10, Min = 0, Max = 100, Interval = 1 }
    MainSection:Toggle { Name = "Team Check", Flag = "AimAssist/TeamCheck", Default = false }
    MainSection:Toggle { Name = "Visible Check", Flag = "AimAssist/VisibleCheck", Default = false }
    MainSection:Dropdown {
        Name = "Target Part",
        Items = { "Head", "Body", "All" },
        Flag = "AimAssist/TargetPart",
        Default = "Head"
    }

    local FOVSection = RightColumn:Section { Name = "FOV Display" }
    local fovToggle = FOVSection:Toggle { Name = "Show FOV", Flag = "AimAssist/ShowFOV", Default = false }
    fovToggle:Colorpicker { Name = "FOV Color", Color = Color3FromRGB(255, 255, 255), Flag = "AimAssist/FOVColor" }
    fovToggle:Colorpicker { Name = "Fill Color", Color = Color3FromRGB(255, 255, 255), Flag = "AimAssist/FOVFillColor" }
	FOVSection:ButtonHolder { "Settings" }
    FOVSection:Slider {
        Name = "FOV Radius",
        Flag = "AimAssist/FOVRadius",
        Default = 200,
        Min = 10,
        Max = 800,
        Interval = 1
    }
    FOVSection:Slider {
        Name = "FOV Transparency",
        Flag = "AimAssist/FOVTransparency",
        Default = 100,
        Min = 0,
        Max = 100,
        Interval = 1
    }
    FOVSection:Slider {
        Name = "Fill Transparency",
        Flag = "AimAssist/FOVFillTransparency",
        Default = 15,
        Min = 0,
        Max = 100,
        Interval = 1
    }

    local aa_fov_circle = Drawing.new("Circle")
    aa_fov_circle.Thickness = 1
    aa_fov_circle.NumSides = 100
    aa_fov_circle.Radius = 200
    aa_fov_circle.Filled = false
    aa_fov_circle.Visible = false
    aa_fov_circle.ZIndex = 10
    aa_fov_circle.Transparency = 1
    aa_fov_circle.Color = Color3FromRGB(255, 255, 255)

    local aa_fov_circle_fill = Drawing.new("Circle")
    aa_fov_circle_fill.Thickness = 1
    aa_fov_circle_fill.NumSides = 100
    aa_fov_circle_fill.Radius = 200
    aa_fov_circle_fill.Filled = true
    aa_fov_circle_fill.Visible = false
    aa_fov_circle_fill.ZIndex = 8
    aa_fov_circle_fill.Transparency = 0.15
    aa_fov_circle_fill.Color = Color3FromRGB(255, 255, 255)

    local function IsPartVisible(part)
    	if not part then return false end
    	local lc = LocalPlayer.Character
    	if not lc then return false end

    	local params = RaycastParams.new()
    	params.FilterType = Enum.RaycastFilterType.Exclude
    	params.FilterDescendantsInstances = { lc, part.Parent }
    	params.IgnoreWater = true

    	local origin = CurrentCamera.CFrame.Position
    	local direction = (part.Position - origin).Unit
    	local distance = (part.Position - origin).Magnitude

    	local result = Workspace:Raycast(origin, direction * distance, params)
    	return not result
	end

    local function GetClosestPlayer()
    	local fov = Flags["AimAssist/FOVRadius"] or 200
    	local teamCheck = Flags["AimAssist/TeamCheck"] or false
    	local visibleCheck = Flags["AimAssist/VisibleCheck"] or false
    	local targetPartChoice = Flags["AimAssist/TargetPart"] or "Head"

    	local closest = nil
    	local closestDist = fov
    	local mousePos = UserInputService:GetMouseLocation()

    	for _, plr in ipairs(GetPlayers(Players)) do
        	if plr == LocalPlayer then continue end
        	if teamCheck and plr.Team == LocalPlayer.Team then continue end

        	local char = plr.Character
        	if not char then continue end
        	local hum = char:FindFirstChild("Humanoid")
        	if not hum or hum.Health <= 0 then continue end
        	local hrp = char:FindFirstChild("HumanoidRootPart")
        	if not hrp then continue end

        	local targetPart = nil
        	if targetPartChoice == "Head" then
        	    targetPart = char:FindFirstChild("Head")
        	elseif targetPartChoice == "Body" then
        	    targetPart = char:FindFirstChild("UpperTorso") or char:FindFirstChild("Torso")
        	else
        	    targetPart = char:FindFirstChild("Head") or char:FindFirstChild("UpperTorso") or char:FindFirstChild("Torso") or hrp
        	end
        	if not targetPart then continue end

        	if visibleCheck and not IsPartVisible(targetPart) then
        	    continue
        	end

        	local screenPos, onScreen = CurrentCamera:WorldToViewportPoint(targetPart.Position)
        	if not onScreen then continue end

        	local dist = (mousePos - Vec2(screenPos.X, screenPos.Y)).Magnitude
        	if dist < closestDist then
        	    closest = targetPart
        	    closestDist = dist
        	end
    	end
    	return closest
	end

    local function UpdateFOVCircles()
        local show = Flags["AimAssist/ShowFOV"] or false
        local radius = Flags["AimAssist/FOVRadius"] or 200
        local color = Flags["AimAssist/FOVColor"] and Flags["AimAssist/FOVColor"].Color or Color3FromRGB(255, 255, 255)
        local fillColor = Flags["AimAssist/FOVFillColor"] and Flags["AimAssist/FOVFillColor"].Color or Color3FromRGB(255, 255, 255)
        local transparency = Flags["AimAssist/FOVTransparency"] or 100
        local fillTransparency = Flags["AimAssist/FOVFillTransparency"] or 15

        local mousePos = UserInputService:GetMouseLocation()
        local center = Vec2(mousePos.X, mousePos.Y)

        aa_fov_circle.Visible = show
        aa_fov_circle_fill.Visible = show
        aa_fov_circle.Position = center
        aa_fov_circle_fill.Position = center
        aa_fov_circle.Radius = radius
        aa_fov_circle_fill.Radius = radius
        aa_fov_circle.Color = color
        aa_fov_circle.Transparency = transparency / 100
        aa_fov_circle_fill.Color = fillColor
        aa_fov_circle_fill.Transparency = fillTransparency / 100
    end

    function GlobalState.AimAssist.Functions.Update()
        UpdateFOVCircles()

        if not Flags["AimAssist/Enabled"] then return end

        local target = GetClosestPlayer()
        if not target then return end

        local targetPos, onScreen = CurrentCamera:WorldToViewportPoint(target.Position)
        if not onScreen then return end

        local smoothing = Flags["AimAssist/Smoothing"] or 10
        local smoothFactor = math.min(1 / smoothing, 1)

        local vpSize = CurrentCamera.ViewportSize
        local centerX = vpSize.X / 2
        local centerY = vpSize.Y / 2

        local deltaX = targetPos.X - centerX
        local deltaY = targetPos.Y - centerY

        if math.abs(deltaX) > 0.5 or math.abs(deltaY) > 0.5 then
            mousemoverel(deltaX * smoothFactor, deltaY * smoothFactor)
        end
    end

    do
        local TriggerbotSection = Columns[6].Right:Section { Name = "Triggerbot" }
		TriggerbotSection:Toggle { Name = "Enabled", Flag = "Triggerbot/Enabled", Default = false }:Keybind { Name = "Triggerbot", Flag = "Triggerbot/EnabledKey", Key = Enum.KeyCode.Unknown, Mode = "toggle" }
		TriggerbotSection:ButtonHolder { "Settings" }
        TriggerbotSection:Slider { Name = "Delay (ms)", Default = 100, Min = 0, Max = 1500, Flag = "Triggerbot/Delay", Interval = 1, Suffix = "ms" }
        TriggerbotSection:Toggle { Name = "Team Check", Flag = "Triggerbot/TeamCheck", Default = false }
        TriggerbotSection:Toggle { Name = "Visible Check", Flag = "Triggerbot/VisibleCheck", Default = true }
    end

    if not GlobalState.Triggerbot then
        GlobalState.Triggerbot = {
            LastShot = 0,
        }
    end

    function GlobalState.Triggerbot.Tick()
        if not Flags["Triggerbot/Enabled"] then return end

        local char = LocalPlayer.Character
        if not char then return end
        if LocalPlayer.Status and LocalPlayer.Status.Alive and not LocalPlayer.Status.Alive.Value then return end

        local camera = CurrentCamera
        local origin = camera.CFrame.Position
        local direction = camera.CFrame.LookVector * 1000

        local targetPlayer = nil

        if Flags["Triggerbot/VisibleCheck"] then
            local params = RaycastParams.new()
            params.FilterType = Enum.RaycastFilterType.Exclude
            params.FilterDescendantsInstances = { char, camera }
            params.IgnoreWater = true
            local result = workspace:Raycast(origin, direction, params)
            if result then
                local hit = result.Instance
                local parent = hit and hit.Parent
                if parent then
                    local player = Players:GetPlayerFromCharacter(parent)
                    if player and player ~= LocalPlayer then
                        local status = player:FindFirstChild("Status")
                        if status and status.Alive and status.Alive.Value == true then
                            targetPlayer = player
                        elseif not status then
                            local hum = parent:FindFirstChildOfClass("Humanoid")
                            if hum and hum.Health > 0 then
                                targetPlayer = player
                            end
                        end
                    end
                end
            end
        else
            local plrs = Players:GetPlayers()
            local viewportSize = camera.ViewportSize
            local centerX, centerY = viewportSize.X / 2, viewportSize.Y / 2

            for _, plr in ipairs(plrs) do
                if plr == LocalPlayer then continue end

                local status = plr:FindFirstChild("Status")
                if status and status.Alive and not status.Alive.Value then continue end
                if not status then
                    local char2 = plr.Character
                    if not char2 then continue end
                    local hum = char2:FindFirstChildOfClass("Humanoid")
                    if not hum or hum.Health <= 0 then continue end
                end

                if Flags["Triggerbot/TeamCheck"] then
                    if GlobalState.Utility.GetTeam(plr) == GlobalState.Utility.GetTeam(LocalPlayer) then
                        continue
                    end
                end

                local head = plr.Character and plr.Character:FindFirstChild("Head")
                if not head then
                    head = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
                end
                if not head then continue end

                local screenPos, onScreen = camera:WorldToViewportPoint(head.Position)
                if not onScreen then continue end

                if screenPos.X >= 0 and screenPos.X <= viewportSize.X and screenPos.Y >= 0 and screenPos.Y <= viewportSize.Y then
                    targetPlayer = plr
                    break
                end
            end
        end

        if not targetPlayer then return end

        if Flags["Triggerbot/TeamCheck"] then
            if GlobalState.Utility.GetTeam(targetPlayer) == GlobalState.Utility.GetTeam(LocalPlayer) then
                return
            end
        end

        local now = tick()
        local delay = Flags["Triggerbot/Delay"] / 1000
        if now - GlobalState.Triggerbot.LastShot >= delay then
            local vim = Instance.new("VirtualInputManager")
            vim:SendMouseButtonEvent(0, 0, 0, true, game, 1)
            task.wait(0.01)
            vim:SendMouseButtonEvent(0, 0, 0, false, game, 1)
            GlobalState.Triggerbot.LastShot = now
        end
    end

    RunService.RenderStepped:Connect(function()
		TaskSpawn(GlobalState.Triggerbot.Tick)
        GlobalState.AimAssist.Functions.Update()
    end)
end

do
	local LeftColumn = Columns[3].Left
	local RightColumn = Columns[3].Right

	local CategorySections = LeftColumn:MultiSection { Names = { "Enemy", "Team" } }
	local SettingsSection = RightColumn:Section { Name = "Esp Settings" }

	for sectionIndex, sectionObject in CategorySections do
		local category = "Enemy"
		if sectionIndex == 1 then
			category = "Enemy"
		elseif sectionIndex == 2 then
			category = "Team"
		end
		sectionObject:Toggle { Name = "Enabled", Default = false, Flag = category .. "/Enabled" }:Keybind { Name = "ESP", Flag = category .. "/EnabledKey", Key = Enum.KeyCode.Unknown, Mode = "toggle" }
		sectionObject:ButtonHolder { "Box" }
		local boxToggle = sectionObject:Toggle { Name = "Box", Default = false, Flag = category .. "/Box", Callback = function(state)
			GlobalSignals.EspChanged:Fire(category .. "/Box", state)
		end }
		boxToggle:Colorpicker { Name = "Box Color 1", Color = Color3FromRGB(255, 0, 0), Flag = category .. "/BoxColor1", Callback = function(color)
			GlobalSignals.EspChanged:Fire(category .. "/BoxColor1", color)
		end }
		boxToggle:Colorpicker { Name = "Box Color 2", Color = Color3FromRGB(255, 0, 0), Flag = category .. "/BoxColor2", Callback = function(color)
			GlobalSignals.EspChanged:Fire(category .. "/BoxColor2", color)
		end }

		local boxFillToggle = sectionObject:Toggle { Name = "Box Fill", Default = false, Flag = category .. "/BoxFill", Callback = function(state)
			GlobalSignals.EspChanged:Fire(category .. "/BoxFill", state)
		end }
		boxFillToggle:Colorpicker { Name = "Box Fill Color 1", Color = Color3FromRGB(255, 0, 0), Alpha = 0.5, Flag = category .. "/BoxFillColor1", Callback = function(color)
			GlobalSignals.EspChanged:Fire(category .. "/BoxFillColor1", color)
		end }
		boxFillToggle:Colorpicker { Name = "Box Fill Color 2", Color = Color3FromRGB(255, 0, 0), Alpha = 0.5, Flag = category .. "/BoxFillColor2", Callback = function(color)
			GlobalSignals.EspChanged:Fire(category .. "/BoxFillColor2", color)
		end }

		sectionObject:Toggle { Name = "Image", Default = false, Flag = category .. "/Image", Callback = function(state)
			GlobalSignals.EspChanged:Fire(category .. "/Image", state)
		end }
		sectionObject:Dropdown { Name = "Image Type", Items = { "Rem", "Aiko" }, Flag = category .. "/ImageType", Default = "Aiko", Callback = function(value)
			GlobalSignals.EspChanged:Fire(category .. "/ImageType", value)
		end }
		sectionObject:Slider { Name = "Image Transparency", Default = 0.5, Min = 0, Max = 1, Flag = "Esp/ImageTransparency", Interval = 0.1, Callback = function(value)
			GlobalSignals.EspChanged:Fire("Esp/ImageTransparency", value)
		end }
		sectionObject:ButtonHolder { "Info" }
		local nameToggle = sectionObject:Toggle { Name = "Name", Default = false, Flag = category .. "/Name", Callback = function(state)
			GlobalSignals.EspChanged:Fire(category .. "/Name", state)
		end }
		nameToggle:Colorpicker { Name = "Name Color", Default = Color3FromRGB(255, 255, 255), Flag = category .. "/NameColor", Callback = function(color)
			GlobalSignals.EspChanged:Fire(category .. "/NameColor", color)
		end }
		local distanceToggle = sectionObject:Toggle { Name = "Distance", Default = false, Flag = category .. "/Distance", Callback = function(state)
			GlobalSignals.EspChanged:Fire(category .. "/Distance", state)
		end }
		distanceToggle:Colorpicker { Name = "Distance Color", Default = Color3FromRGB(255, 255, 255), Flag = category .. "/DistanceColor", Callback = function(color)
			GlobalSignals.EspChanged:Fire(category .. "/DistanceColor", color)
		end }
		local toolToggle = sectionObject:Toggle { Name = "Tool", Default = false, Flag = category .. "/Tool", Callback = function(state)
			GlobalSignals.EspChanged:Fire(category .. "/Tool", state)
		end }
		toolToggle:Colorpicker { Name = "Tool Color", Default = Color3FromRGB(255, 255, 255), Flag = category .. "/ToolColor", Callback = function(color)
			GlobalSignals.EspChanged:Fire(category .. "/ToolColor", color)
		end }
		local cashToggle = sectionObject:Toggle { Name = "Cash", Default = false, Flag = category .. "/Cash", Callback = function(state)
			GlobalSignals.EspChanged:Fire(category .. "/Cash", state)
		end }
		cashToggle:Colorpicker { Name = "Cash Color", Default = Color3FromRGB(0, 180, 80), Flag = category .. "/CashColor", Callback = function(color)
			GlobalSignals.EspChanged:Fire(category .. "/CashColor", color)
		end }
		local zoomToggle = sectionObject:Toggle { Name = "Zoom", Default = false, Flag = category .. "/Zoom", Callback = function(state)
			GlobalSignals.EspChanged:Fire(category .. "/Zoom", state)
		end }
		zoomToggle:Colorpicker { Name = "Zoom Color", Default = Color3FromRGB(0, 180, 255), Flag = category .. "/ZoomColor", Callback = function(color)
			GlobalSignals.EspChanged:Fire(category .. "/ZoomColor", color)
		end }
		local c4FlagToggle = sectionObject:Toggle { Name = "C4", Default = false, Flag = category .. "/C4Flag", Callback = function(state)
			GlobalSignals.EspChanged:Fire(category .. "/C4Flag", state)
		end }
		c4FlagToggle:Colorpicker { Name = "C4 Flag Color", Default = Color3FromRGB(255, 50, 50), Flag = category .. "/C4FlagColor", Callback = function(color)
			GlobalSignals.EspChanged:Fire(category .. "/C4FlagColor", color)
		end }
		sectionObject:ButtonHolder { "Health Bar" }
		local healthBarToggle = sectionObject:Toggle { Name = "Health Bar", Default = false, Flag = category .. "/HealthBar", Callback = function(state)
			GlobalSignals.EspChanged:Fire(category .. "/HealthBar", state)
		end }
		healthBarToggle:Colorpicker { Name = "Health Bar Color 1", Color = Color3FromRGB(0, 255, 0), Alpha = 0, Flag = category .. "/HealthBarColor1", Callback = function(color)
			GlobalSignals.EspChanged:Fire(category .. "/HealthBarColor1", color)
		end }
		healthBarToggle:Colorpicker { Name = "Health Bar Color 2", Color = Color3FromRGB(255, 0, 0), Alpha = 0, Flag = category .. "/HealthBarColor2", Callback = function(color)
			GlobalSignals.EspChanged:Fire(category .. "/HealthBarColor2", color)
		end }
		sectionObject:Dropdown { Name = "Health Bar Side", Items = { "Left", "Right", "Top", "Bottom" }, Flag = category .. "/HealthBarSide", Default = "Left", Callback = function(value)
			GlobalSignals.EspChanged:Fire(category .. "/HealthBarSide", value)
		end }
		sectionObject:Slider { Name = "Health Bar Thickness", Default = 1, Min = 1, Max = 2, Flag = "Esp/HealthBarThickness", Interval = 1, Callback = function(value)
			GlobalSignals.EspChanged:Fire("Esp/HealthBarThickness", value)
		end }
		local healthBarNumberToggle = sectionObject:Toggle { Name = "Health Bar Number", Default = false, Flag = category .. "/HealthBarNumber", Callback = function(state)
			GlobalSignals.EspChanged:Fire(category .. "/HealthBarNumber", state)
		end }
		healthBarNumberToggle:Colorpicker { Name = "Health Bar Number Color", Color = Color3FromRGB(255, 255, 255), Alpha = 0, Flag = category .. "/HealthBarNumberColor", Callback = function(color)
			GlobalSignals.EspChanged:Fire(category .. "/HealthBarNumberColor", color)
		end }
		sectionObject:ButtonHolder { "Chams" }
		local chamsToggle = sectionObject:Toggle { Name = "Chams", Default = false, Flag = category .. "/Chams", Callback = function(state)
			GlobalSignals.EspChanged:Fire(category .. "/Chams", state)
		end }
		chamsToggle:Colorpicker { Name = "Chams Color", Color = Color3FromRGB(255, 255, 255), Flag = category .. "/ChamsColor", Callback = function(color)
			GlobalSignals.EspChanged:Fire(category .. "/ChamsColor", color)
		end }
		chamsToggle:Slider { Name = "Chams Transparency", Default = 0.5, Min = 0, Max = 1, Flag = category .. "/ChamsTransparency", Interval = 0.01, Callback = function(value)
			GlobalSignals.EspChanged:Fire(category .. "/ChamsTransparency", value)
		end }
	end

	SettingsSection:Slider { Name = "Max Distance", Default = 500, Min = 0, Max = 1000, Flag = "Esp/Distance" }
	SettingsSection:Toggle { Name = "Fade On Distance", Default = false, Flag = "Esp/FadeOnDistance" }
	SettingsSection:Slider { Name = "Scale", Default = 1, Min = 0.01, Max = 2, Flag = "Esp/Scale", Interval = 0.01 }
	SettingsSection:Dropdown { Name = "Text Cases", Items = { "Normal", "UPPER", "lower" }, Flag = "Esp/TextCases", Default = "Normal", Callback = function(value)
		GlobalSignals.EspChanged:Fire("Esp/TextCases", value)
	end }
	SettingsSection:Dropdown { Name = "Text Wrapper", Items = { "None", "[Brackets]", "{Braces}" }, Flag = "Esp/TextWrapper", Default = "None", Callback = function(value)
		GlobalSignals.EspChanged:Fire("Esp/TextWrapper", value)
	end }
	SettingsSection:Slider { Name = "Health Bar Speed", Default = 0.1, Min = 0.05, Max = 0.9, Flag = "Esp/HealthBarSpeed", Interval = 0.01 }
	SettingsSection:Slider { Name = "Fade Time", Default = 0.5, Min = 0.1, Max = 2, Suffix = "s", Flag = "Esp/FadeTime", Interval = 0.1, Callback = function(value)
		GlobalSignals.EspChanged:Fire("Esp/FadeTime", value)
	end }
	SettingsSection:Dropdown { Name = "Fade Easing Style", Items = GlobalState.Constants.EasingStyles, Flag = "Esp/FadeEasingStyle", Default = "Exponential", Callback = function(value)
		GlobalSignals.EspChanged:Fire("Esp/FadeEasingStyle", value)
	end }
	SettingsSection:ButtonHolder { "Map" }
	local dropToggle = SettingsSection:Toggle { Name = "Drop", Flag = "Map/Drop", Default = false }
	dropToggle:Colorpicker { Name = "Drop Color", Color = Color3FromRGB(255, 255, 255), Flag = "Map/DropColor" }
	SettingsSection:Slider { Name = "Drop Transparency", Default = 0, Min = 0, Max = 1, Flag = "Map/DropTransparency", Interval = 0.01 }
	local c4Toggle = SettingsSection:Toggle { Name = "C4", Flag = "Map/C4", Default = false }
	c4Toggle:Colorpicker { Name = "C4 Color", Color = Color3FromRGB(255, 138, 138), Flag = "Map/C4Color" }
	c4Toggle:Colorpicker { Name = "C4 Timer Color", Color = Color3FromRGB(255, 255, 255), Flag = "Map/C4TimerColor" }
	SettingsSection:Slider { Name = "C4 Transparency", Default = 0, Min = 0, Max = 1, Flag = "Map/C4Transparency", Interval = 0.01 }
	SettingsSection:ButtonHolder { "TAK NADO SYKA" }
	local arrowToggle = SettingsSection:Toggle { Name = "Offscreen Arrows", Flag = "Esp/OffscreenArrows", Default = false, Callback = function(state)
		offscreenArrows.enabled = state
	end }
	arrowToggle:Colorpicker { Name = "Arrow Color", Color = C3(255, 255, 255), Flag = "Esp/OffscreenArrowsColor", Callback = function(color) offscreenArrows.color = color.Color end }
	SettingsSection:Slider { Name = "Arrow Transparency", Flag = "Esp/OffscreenArrowsTransparency", Default = 20, Min = 0, Max = 100, Interval = 1, Callback = function(value) offscreenArrows.transparency = value / 100 end }
	SettingsSection:Slider { Name = "Arrow Radius", Flag = "Esp/OffscreenArrowsRadius", Default = 100, Min = 50, Max = 400, Interval = 1, Callback = function(value) offscreenArrows.radius = value end }
	SettingsSection:Slider { Name = "Arrow Size", Flag = "Esp/OffscreenArrowsSize", Default = 10, Min = 5, Max = 30, Interval = 1, Callback = function(value) offscreenArrows.size = value end }
	SettingsSection:ButtonHolder { "Global Chamsiki" }
	SettingsSection:Toggle { Name = "Global Chams", Default = false, Flag = "GlobalChams/Enabled", Callback = function(state)
		GlobalSignals.EspChanged:Fire("GlobalChams/Enabled", state)
	end }
	local globalChamsEnemyToggle = SettingsSection:Toggle { Name = "Enemy Chams", Default = true, Flag = "GlobalChams/Enemy", Callback = function(state)
		GlobalSignals.EspChanged:Fire("GlobalChams/Enemy", state)
	end }
	globalChamsEnemyToggle:Colorpicker { Name = "Enemy Chams Color", Color = Color3FromRGB(255, 0, 0), Flag = "GlobalChams/EnemyColor", Callback = function(color)
		GlobalSignals.EspChanged:Fire("GlobalChams/EnemyColor", color)
	end }
	local globalChamsTeamToggle = SettingsSection:Toggle { Name = "Team Chams", Default = false, Flag = "GlobalChams/Team", Callback = function(state)
		GlobalSignals.EspChanged:Fire("GlobalChams/Team", state)
	end }
	globalChamsTeamToggle:Colorpicker { Name = "Team Chams Color", Color = Color3FromRGB(0, 100, 255), Flag = "GlobalChams/TeamColor", Callback = function(color)
		GlobalSignals.EspChanged:Fire("GlobalChams/TeamColor", color)
	end }
	SettingsSection:ButtonHolder { "ETO TOJE" }
	SettingsSection:Toggle { Name = "Hide on visible", Default = false, Flag = "Chams/HideOnVisible", Callback = function(value)
		GlobalSignals.EspChanged:Fire("Chams/HideOnVisible", value)
	end }		
end

do
	local LeftColumn = Columns[4].Left
	local RightColumn = Columns[4].Right

	local LeftColumnMultiSections = LeftColumn:MultiSection { Names = { "Viewmodel", "User Interface" } }
	local RightColumnMultiSections = RightColumn:MultiSection { Names = { "Camera", "World" } }
	local SkyboxSection = RightColumn:Section { Name = "Skybox" }
	local FogSection = RightColumn:Section { Name = "Fog" }

	local ViewmodelSection, UISection = TableUnpack(LeftColumnMultiSections)
	local CameraSection, WorldSection = TableUnpack(RightColumnMultiSections)

	ViewmodelSection:Toggle { Name = "Viewmodel Offset", Flag = "Visuals/VmOffset" }
	ViewmodelSection:Slider { Name = "X", Default = 0, Min = -180, Max = 180, Flag = "Visuals/VmOffsetX", Interval = 1, Callback = function(value)
		GlobalConfig.ViewmodelOffsetX = MathRad(value)
	end }
	ViewmodelSection:Slider { Name = "Y", Default = 0, Min = -180, Max = 180, Flag = "Visuals/VmOffsetY", Interval = 1, Callback = function(value)
		GlobalConfig.ViewmodelOffsetY = MathRad(value)
	end }
	ViewmodelSection:Slider { Name = "Z", Default = 0, Min = -180, Max = 180, Flag = "Visuals/VmOffsetZ", Interval = 1, Callback = function(value)
		GlobalConfig.ViewmodelOffsetZ = MathRad(value)
	end }
	ViewmodelSection:Slider { Name = "Roll", Default = 0, Min = -360, Max = 360, Flag = "Visuals/VmOffsetRoll", Interval = 1, Callback = function(value)
		GlobalConfig.ViewmodelOffsetRoll = MathRad(value)
	end }
	ViewmodelSection:Slider { Name = "Yaw", Default = 0, Min = -360, Max = 360, Flag = "Visuals/VmOffsetYaw", Interval = 1, Callback = function(value)
		GlobalConfig.ViewmodelOffsetYaw = MathRad(value)
	end }
	ViewmodelSection:Slider { Name = "Pitch", Default = 0, Min = -360, Max = 360, Flag = "Visuals/VmOffsetPitch", Interval = 1, Callback = function(value)
		GlobalConfig.ViewmodelOffsetPitch = MathRad(value)
	end }

	CameraSection:Toggle { Flag="local_thirdperson", Name="Third Person", Default=false }:Keybind { Flag="local_thirdpersonbind", Key=Enum.KeyCode.X, Mode="toggle", Name="Third Person" };
    Toggles.local_thirdperson:OnChanged(function()
        if (Toggles.local_thirdperson.Value == true) then
            savedArmsData = {};
            local arms = Workspace.Camera:FindFirstChild("Arms");
            if arms then
                for _, part in ipairs(arms:GetDescendants()) do
                    if (part:IsA("BasePart") or part:IsA("MeshPart")) then
                        savedArmsData[part] = part.Transparency;
                        part.Transparency = 1;
                    end
                end
            end
            RunService:BindToRenderStep("ThirdPerson", 100, function()
                LocalPlayer.CameraMinZoomDistance = Options.local_thirdpersondist.Value;
                LocalPlayer.CameraMaxZoomDistance = Options.local_thirdpersondist.Value;
                Workspace.ThirdPerson.Value = true;
                local arms = Workspace.Camera:FindFirstChild("Arms");
                if arms then
                    for _, part in ipairs(arms:GetDescendants()) do
                        if (part:IsA("BasePart") or part:IsA("MeshPart")) then
                            if not savedArmsData[part] then
                                savedArmsData[part] = part.Transparency;
                            end
                            part.Transparency = 1;
                        end
                    end
                end
            end);
        elseif (Toggles.local_thirdperson.Value == false) then
            RunService:UnbindFromRenderStep("ThirdPerson");
            if IsAlive(LocalPlayer) then
                Workspace.ThirdPerson.Value = false;
                LocalPlayer.CameraMinZoomDistance = 0;
                LocalPlayer.CameraMaxZoomDistance = 0;
                local arms = Workspace.Camera:FindFirstChild("Arms");
                if arms then
                    for _, part in ipairs(arms:GetDescendants()) do
                        if (part:IsA("BasePart") or part:IsA("MeshPart")) then
                            if savedArmsData[part] then
                                part.Transparency = savedArmsData[part];
                            else
                                part.Transparency = 0;
                            end
                        end
                    end
                end
                savedArmsData = {};
            end
        end
    end);
    CameraSection:Slider { Flag="local_thirdpersondist", Name="Distance", Default=15, Min=1, Max=50, Interval=1 };

	UISection:Toggle { Name = "Hitmarker", Flag = "Visuals/Hitmarker" }
	UISection:Dropdown { Name = "Hitmarker Type", Items = { "Screen", "World" }, Flag = "Visuals/HitmarkerType", Default = "World" }
	UISection:Slider { Name = "Hitmarker Duration", Default = 0.2, Min = 0, Max = 5, Flag = "Visuals/HitmarkerDuration", Interval = 0.01 }
	UISection:Slider { Name = "Hitmarker Fade Time Duration", Default = 0.2, Min = 0, Max = 5, Flag = "Visuals/HitmarkerFadeTimeDuration", Interval = 0.01, Callback = function(value)
		GlobalConfig.FadeHitmarker = TweenInfo.new(value, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
	end }
	UISection:Toggle { Name = "Custom Scope", Flag = "Visuals/CustomScope", Default = false }
	UISection:Toggle { Name = "Use Zoom", Flag = "Visuals/CustomScopeUseZoom", Default = true }
	UISection:ButtonHolder { "Indicators" }
	UISection:Toggle { Name = "Indicators", Flag = "Visuals/Indicators", Default = false }
	UISection:MultiDropdown {
		Name = "Items",
		Flag = "Visuals/IndicatorItems",
		Items = { "Ragebot", "AimAssist", "FOV", "Triggerbot", "TriggerDelay", "ThirdPerson", "State" },
		Default = {},
	}
	UISection:Slider { Name = "X", Default = 0, Min = -60, Max = 60, Flag = "Visuals/IndicatorsX", Interval = 1 }
	UISection:Slider { Name = "Y", Default = 0, Min = -60, Max = 60, Flag = "Visuals/IndicatorsY", Interval = 1 }
	UISection:Slider { Name = "Scope X", Default = -55, Min = -60, Max = 60, Flag = "Visuals/IndicatorsScopeX", Interval = 1 }
	UISection:Slider { Name = "Scope Y", Default = 0, Min = -60, Max = 60, Flag = "Visuals/IndicatorsScopeY", Interval = 1 }
	local ambienceToggle = WorldSection:Toggle { Name = "Ambience", Flag = "Visuals/Ambience", Tooltip = "Changes the map's ambient colors to your defined colors." }
	ambienceToggle:Colorpicker { Name = "Outside Ambience", Color = Color3FromRGB(117, 76, 236), Flag = "Visuals/OutdoorAmbient" }
	ambienceToggle:Colorpicker { Name = "Inside Ambience", Color = Color3FromRGB(117, 76, 236), Flag = "Visuals/InsideAmbience" }

	WorldSection:Toggle { Name = "Force Time", Flag = "Visuals/ForceTime", Tooltip = "Forces the time to the time set by your below." }
	WorldSection:Slider { Name = "Custom Time", Default = 0, Min = 0, Max = 24, Flag = "Visuals/CustomTime", Interval = 1, Suffix = "h" }

	local BulletSection = RightColumn:Section { Name = "Bullets and other" }

	BulletSection:Toggle { Name = "Bullet Tracer", Flag = "Visuals/BulletTracer" }:Colorpicker { Name = "Tracer Color", Color = Color3FromRGB(255, 255, 255), Flag = "Visuals/BulletTracerColor" }
	BulletSection:Slider { Name = "Tracer Life Time", Default = 2, Min = 1, Max = 10, Flag = "Visuals/BulletTracerTime", Interval = 1 }
	BulletSection:Dropdown {
		Name = "Tracer Texture",
		Items = { "Lightning", "Laser 1", "Laser 2", "Energy", "Unnamed" },
		Flag = "Visuals/BulletTracerTexture",
		Default = "Lightning",
	}
	BulletSection:ButtonHolder { "Impacts" }
	BulletSection:Toggle { Name = "Bullet Impact", Flag = "Visuals/BulletImpact" }:Colorpicker { Name = "Impact Color", Color = Color3FromRGB(255, 255, 255), Flag = "Visuals/BulletImpactColor" }
	BulletSection:Slider { Name = "Impact Life Time", Default = 3, Min = 1, Max = 10, Flag = "Visuals/BulletImpactTime", Interval = 1 }
	BulletSection:ButtonHolder { "Hit Chams" }
	local hitChamsToggle = BulletSection:Toggle { Name = "Hit Chams", Flag = "Visuals/HitChams", Default = false }:Colorpicker { Name = "Hit Color", Color = Color3FromRGB(255, 255, 255), Flag = "Visuals/HitChamsColor" }
	BulletSection:Slider { Name = "Hit Life Time", Default = 3, Min = 1, Max = 10, Flag = "Visuals/HitChamsTime", Interval = 1 }
	BulletSection:Slider { Name = "Hit Chams Transparency", Default = 0.5, Min = 0, Max = 1, Flag = "Visuals/HitChamsTransparency", Interval = 0.01 }

	local skyboxToggle = SkyboxSection:Toggle {
    	Name = "Enable Skybox",
    	Flag = "Visuals/SkyboxEnabled",
    	Default = false
	}

	SkyboxSection:Dropdown {
    	Name = "Skybox Type",
    	Items = {
    	    "Galaxy", "Pink Sky", "Sunset", "Night", "Evening",
    	    "Purple Nebula", "Night Sky", "Pink Daylight", "Morning Glow",
    	    "Setting Sun", "Fade Blue", "Elegant Morning", "Neptune",
    	    "Redshift", "Aesthetic Night"
    	},
    	Flag = "Visuals/SkyboxType",
    	Default = "Galaxy"
	}

	local fogToggle = FogSection:Toggle { Name = "Enable Fog", Flag = "Visuals/FogEnabled", Default = false }
	fogToggle:Colorpicker { Name = "Fog Color", Color = Color3FromRGB(255, 255, 255), Flag = "Visuals/FogColor" }
	fogToggle:Colorpicker { Name = "Fog Decay", Color = Color3FromRGB(255, 255, 255), Flag = "Visuals/FogDecay" }
	FogSection:Slider { Name = "Fog Density", Flag = "Visuals/FogDensity", Default = 0, Min = 0, Max = 1, Interval = 0.01 }
	FogSection:Slider { Name = "Fog Offset", Flag = "Visuals/FogOffset", Default = 0, Min = 0, Max = 1, Interval = 0.01 }
	FogSection:Slider { Name = "Fog Haze", Flag = "Visuals/FogHaze", Default = 0, Min = 0, Max = 1, Interval = 0.01 }
	FogSection:Slider { Name = "Fog Glare", Flag = "Visuals/FogGlare", Default = 0, Min = 0, Max = 1, Interval = 0.01 }
end

local function ChangeCharacterToUserIdAvatar(userId)
	userId = tonumber(userId)
	if not userId then return end
	local model = Players:CreateHumanoidModelFromUserId(userId)
	for _, descendant in ipairs(model:GetDescendants()) do
		if descendant:IsA("ParticleEmitter") or descendant:IsA("Trail") or descendant:IsA("Beam")
			or descendant:IsA("Fire") or descendant:IsA("Sparkles") or descendant:IsA("Smoke")
			or descendant:IsA("Highlight") then
			descendant:Destroy()
		end
	end
	local fullOutline = model:FindFirstChild("FullOutline")
	if fullOutline then fullOutline:Destroy() end
	model.Name = "TargetCharacter"
	model:WaitForChild("Humanoid")
	ChangeCharacter(model)
	model:Destroy()
end

do
	local LeftColumn = Columns[2].Left
	local RightColumn = Columns[2].Right

	local LeftSection = LeftColumn:Section { Name = "Movement" }
	local GunModSection = LeftColumn:Section { Name = "Gun Modification" }
	local RightSection = RightColumn:Section { Name = "Misc" }
	local AntiAimSection = RightColumn:Section { Name = "Anti-Popadalki" }

	LeftSection:Toggle { Name = "Speed", Flag = "Misc/Speed" }:Keybind { Name = "Speed", Flag = "Misc/SpeedKey", Key = Enum.KeyCode.Unknown, Mode = "toggle" }
	LeftSection:Slider { Name = "Speed Value", Flag = "Misc/SpeedValue", Default = 16, Min = 16, Max = 900 }
	LeftSection:Toggle { Name = "Override Speed", Flag = "Misc/OverrideSpeed" }:Keybind { Name = "Override Key", Active = false, Mode = "hold", Key = Enum.KeyCode.LeftShift, Flag = "Misc/OverrideSpeedKey" }
	LeftSection:Slider { Name = "Override Speed Value", Flag = "Misc/OverrideSpeedValue", Default = 16, Min = 16, Max = 900 }
	LeftSection:Toggle { Name = "Auto Jump", Flag = "Misc/AutoJump" }:Keybind { Name = "Auto Jump", Flag = "Misc/AutoJumpKey", Key = Enum.KeyCode.Unknown, Mode = "toggle" }

	RightSection:Toggle { Name = "Kill All", Flag = "Misc/KillAll" }:Keybind { Name = "Kill All", Flag = "Misc/KillAllKey", Key = Enum.KeyCode.Unknown, Mode = "toggle" }
	RightSection:Toggle { Name = "Kill All Preparation Check", Flag = "Misc/KillAllPrepCheck" }
	RightSection:Toggle { Name = "Kill All Time Offset", Flag = "Misc/KillAllTimeOffset" }
	RightSection:Slider { Name = "Kill All Time Offset Value", Default = 1, Min = 1, Max = 1000, Flag = "Misc/KillAllTimeOffsetValue", Interval = 1, Suffix = "ms" }
	RightSection:ButtonHolder { "Sounds" }
	RightSection:Toggle { Name = "Head Shot Hit Sound", Flag = "Misc/HeadHitSound" }
	RightSection:Dropdown { Name = "Head Shot Hit Sound Type", Items = GlobalState.Constants.SoundsIndex, Flag = "Misc/HeadHitSoundType", Scrolling = true }
	RightSection:Slider { Name = "Head Shot Hit Sound Volume", Default = 0.5, Min = 0, Max = 10, Flag = "Misc/HeadHitSoundVolume", Interval = 0.1 }
	RightSection:Toggle { Name = "Hit Sound", Flag = "Misc/HitSound" }
	RightSection:Dropdown { Name = "Hit Sound Type", Items = GlobalState.Constants.SoundsIndex, Flag = "Misc/HitSoundType", Scrolling = true }
	RightSection:Slider { Name = "Hit Sound Volume", Default = 0.5, Min = 0, Max = 10, Flag = "Misc/HitSoundVolume", Interval = 0.1 }
	RightSection:Toggle { Name = "Kill Sound", Flag = "Misc/KillSound" }
	RightSection:Dropdown { Name = "Kill Sound Type", Items = GlobalState.Constants.SoundsIndex, Flag = "Misc/KillSoundType", Scrolling = true }
	RightSection:Slider { Name = "Kill Sound Volume", Default = 0.5, Min = 0, Max = 10, Flag = "Misc/KillSoundVolume", Interval = 0.1 }
	RightSection:Toggle { Name = "Old Gun Sounds", Flag = "Misc/OldGunSounds" }
	RightSection:ButtonHolder { "Other" }
	RightSection:Toggle { Name = "Remove Fall Damage", Flag = "Misc/NoFallDamage" }
	RightSection:Toggle { Name = "Remove Fire Damage", Flag = "Misc/NoFireDamage" }
	RightSection:Toggle { Name = "Resolution Changer", Flag = "Misc/ResolutionEnabled", Default = false }
	RightSection:Slider { Name = "Resolution", Default = 65, Min = 10, Max = 100, Flag = "Misc/ResolutionValue", Interval = 1 }
	RightSection:Toggle { Name = "No Leg Animation", Flag = "Misc/NoLegAnim", Default = false }
	RightSection:Toggle { Name = "Pixel Surf", Flag = "Misc/PixelSurf", Default = false }:Keybind { Name = "Pixel Surf", Flag = "Misc/PixelSurfKey", Key = Enum.KeyCode.Unknown, Mode = "toggle" }
	RightSection:Toggle { Name = "Name Changer", Flag = "Misc/NameChanger", Default = false, Callback = function(val)
		nameChangerEnabled = val
	end }
	RightSection:Input { Name = "Custom Name", Flag = "Misc/CustomName", Default = "t.me/enderphobia1337", Placeholder = "siski", Finished = false, Callback = function(val)
		getgenv().newname = val
	end }
	RightSection:Button { Name = "Apply Name", Callback = function()
		for _, v in pairs(game:GetDescendants()) do
			if v:IsA("TextLabel") or v:IsA("TextButton") then
				pcall(function()
					v.Text = string.gsub(v.Text, originalName, getDisplayName())
				end)
			end
		end
	end }

	RightSection:Toggle { Name = "Clantag", Flag = "Misc/Clantag", Default = false, Callback = function(val)
		clantagEnabled = val
	end }
	RightSection:Input { Name = "Clantag Text", Flag = "Misc/ClantagText", Default = "ANYAGANG'", Placeholder = "siski", Finished = false, Callback = function(val)
		getgenv().clantag = val
	end }
	RightSection:Button { Name = "Apply Clantag", Callback = function()
		for _, v in pairs(game:GetDescendants()) do
			if v:IsA("TextLabel") or v:IsA("TextButton") then
				pcall(function()
					v.Text = string.gsub(v.Text, originalName, getDisplayName())
				end)
			end
		end
	end }

	GunModSection:Toggle { Name = "Enable", Flag = "Misc/GunMod" }
	GunModSection:ButtonHolder { "Knopki" }
	GunModSection:Toggle { Name = "No Recoil", Flag = "Misc/GunModNoRecoil", Default = false }
	GunModSection:Toggle { Name = "No Spread", Flag = "Misc/GunModNoSpread", Default = false }
	GunModSection:Toggle { Name = "Fire Rate", Flag = "Misc/GunModFireRate" }
	GunModSection:Slider { Name = "Fire Rate Value", Default = 0, Min = 0, Max = 0.1, Flag = "Misc/GunModFireRateValue", Interval = 0.01 }

	local function addAaDepBox(parentBox, stateName, dropdownKey, dropdownValue)
		local depBox = parentBox:AddDependencyBox();
		depBox:AddDropdown("aa_" .. stateName .. "_yaw_base", {Text="Yaw Base",Default="Spin",Values={"Spin","Random","Targets","Backward"}}):OnChanged(function()
			aacfgpizda[stateName].yaw_base = Options["aa_" .. stateName .. "_yaw_base"].Value;
		end);
		depBox:AddSlider("aa_" .. stateName .. "_yaw_offset", {Text="Yaw Offset",Default=0,Min=-180,Max=180,Rounding=0}):OnChanged(function()
			aacfgpizda[stateName].yaw_offset = Options["aa_" .. stateName .. "_yaw_offset"].Value;
		end);
		depBox:AddToggle("aa_" .. stateName .. "_jitter", {Text="Jitter",Default=false}):OnChanged(function()
			aacfgpizda[stateName].jitter = Toggles["aa_" .. stateName .. "_jitter"].Value;
		end);
		depBox:AddSlider("aa_" .. stateName .. "_jitter_offset", {Text="Jitter Offset",Default=30,Min=0,Max=180,Rounding=0}):OnChanged(function()
			aacfgpizda[stateName].jitter_offset = Options["aa_" .. stateName .. "_jitter_offset"].Value;
		end);
		depBox:AddSlider("aa_" .. stateName .. "_jitter_speed", {Text="Jitter Speed",Default=10,Min=1,Max=500,Rounding=0,Suffix="ms"}):OnChanged(function()
			aacfgpizda[stateName].jitter_speed = Options["aa_" .. stateName .. "_jitter_speed"].Value;
		end);
		depBox:AddToggle("aa_" .. stateName .. "_smooth_jitter", {Text="Smooth Jitter",Default=false}):OnChanged(function()
			aacfgpizda[stateName].smooth_jitter = Toggles["aa_" .. stateName .. "_smooth_jitter"].Value;
		end);
		depBox:AddSlider("aa_" .. stateName .. "_smooth_jitter_from", {Text="Smooth From",Default=-30,Min=-180,Max=0,Rounding=0,Suffix="°"}):OnChanged(function()
			aacfgpizda[stateName].smooth_jitter_from = Options["aa_" .. stateName .. "_smooth_jitter_from"].Value;
		end);
		depBox:AddSlider("aa_" .. stateName .. "_smooth_jitter_to", {Text="Smooth To",Default=30,Min=0,Max=180,Rounding=0,Suffix="°"}):OnChanged(function()
			aacfgpizda[stateName].smooth_jitter_to = Options["aa_" .. stateName .. "_smooth_jitter_to"].Value;
		end);
		depBox:AddSlider("aa_" .. stateName .. "_smooth_jitter_speed", {Text="Smooth Speed",Default=3,Min=1,Max=20,Rounding=1}):OnChanged(function()
			aacfgpizda[stateName].smooth_jitter_speed = Options["aa_" .. stateName .. "_smooth_jitter_speed"].Value;
		end);
		depBox:AddDropdown("aa_" .. stateName .. "_pitch", {Text="Pitch",Default="None",Values={"None","Up","Down","Zero","Random","Custom"}}):OnChanged(function()
			aacfgpizda[stateName].pitch = Options["aa_" .. stateName .. "_pitch"].Value;
		end);
		depBox:AddSlider("aa_" .. stateName .. "_pitch_custom", {Text="Custom Pitch",Default=0,Min=-90,Max=90,Rounding=0,Suffix="°"}):OnChanged(function()
			aacfgpizda[stateName].pitch_custom = Options["aa_" .. stateName .. "_pitch_custom"].Value / 90;
		end);
		depBox:AddToggle("aa_" .. stateName .. "_extend_pitch", {Text="Extend Pitch",Default=false}):OnChanged(function()
			aacfgpizda[stateName].extend_pitch = Toggles["aa_" .. stateName .. "_extend_pitch"].Value;
		end);
		depBox:AddDropdown("aa_" .. stateName .. "_body_roll", {Text="Body Roll",Default="None",Values={"None","180"}}):OnChanged(function()
			aacfgpizda[stateName].body_roll = Options["aa_" .. stateName .. "_body_roll"].Value;
		end);
		depBox:AddSlider("aa_" .. stateName .. "_spin_speed", {Text="Spin Speed",Default=50,Min=1,Max=150,Rounding=0}):OnChanged(function()
			aacfgpizda[stateName].spin_speed = Options["aa_" .. stateName .. "_spin_speed"].Value;
		end);
		depBox:SetupDependencies({{Options[dropdownKey], dropdownValue}});
	end
	AntiAimSection:Toggle({Flag="antiaim_enabled", Name="Enabled", Default=false}):Keybind { Name = "Anti-Aim", Flag = "antiaim_enabledKey", Key = Enum.KeyCode.Unknown, Mode = "toggle" }
	AntiAimSection:Dropdown({Flag="antiaim_edit_state", Name="Edit State", Default="Standing", Items=aastates});
	addAaDepBox(AntiAimSection, "Standing", "antiaim_edit_state", "Standing");
	addAaDepBox(AntiAimSection, "Moving", "antiaim_edit_state", "Moving");
	addAaDepBox(AntiAimSection, "Crouch", "antiaim_edit_state", "Crouch");
	addAaDepBox(AntiAimSection, "Jumping", "antiaim_edit_state", "Jumping");
	addAaDepBox(AntiAimSection, "SlowWalk", "antiaim_edit_state", "SlowWalk");
	for _, stateName in ipairs(aastates) do
		if Options["aa_" .. stateName .. "_pitch"] then
			aacfgpizda[stateName].pitch = Options["aa_" .. stateName .. "_pitch"].Value
		end
		if Options["aa_" .. stateName .. "_pitch_custom"] then
			aacfgpizda[stateName].pitch_custom = Options["aa_" .. stateName .. "_pitch_custom"].Value / 90
		end
		if Toggles["aa_" .. stateName .. "_extend_pitch"] then
			aacfgpizda[stateName].extend_pitch = Toggles["aa_" .. stateName .. "_extend_pitch"].Value
		end
	end
	Toggles.antiaim_enabled:OnChanged(function()
		antiaim.enabled = Toggles.antiaim_enabled.Value;
		if (localPlayer.Character and localPlayer.Character:FindFirstChild("Humanoid")) then
			localPlayer.Character.Humanoid.AutoRotate = not Toggles.antiaim_enabled.Value;
		end
	end);

	local CharSection = LeftColumn:Section { Name = "Character Changer" }
	CharSection:Toggle { Flag = "Misc/CharChanger", Name = "Character Changer", Default = false }
	CharSection:Input { Flag = "Misc/CharChangerId", Name = "User ID", Default = 39520136, Min = 1, Max = 9999999999, Interval = 1 }
	CharSection:Button { Name = "Apply", Callback = function()
		local userId = tonumber(Flags["Misc/CharChangerId"])
		if userId and userId > 0 then
			pcall(ChangeCharacterToUserIdAvatar, userId)
		end
	end }

	Toggles[SanitizeFlag("Misc/CharChanger")]:OnChanged(function()
		if Flags["Misc/CharChanger"] then
			local userId = tonumber(Flags["Misc/CharChangerId"])
			if userId and userId > 0 then
				pcall(ChangeCharacterToUserIdAvatar, userId)
			end
		end
	end)

	LocalPlayer.CharacterAdded:Connect(function()
		TaskWait()
		if Flags["Misc/CharChanger"] then
			local userId = tonumber(Flags["Misc/CharChangerId"])
			if userId and userId > 0 then
				pcall(ChangeCharacterToUserIdAvatar, userId)
			end
		end
	end)
end

do
    local SkinTab = Columns[7]
    local LeftGroup = SkinTab.Left:Section { Name = "CT Skins" }
    local RightGroup = SkinTab.Right:Section { Name = "T Skins" }
    
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local HttpService = game:GetService("HttpService")
    
    local function getTeam(weapon)
        local CTWeapons = {
            "P2000", "USP", "DualBerettas", "P250", "FiveSeven", "CZ", "DesertEagle", "R8",
            "Nova", "XM", "MAG7", "M249", "Negev",
            "MP9", "MP7", "MP7-SD", "UMP", "P90", "Bizon",
            "Famas", "M4A4", "M4A1", "Scout", "AUG", "AWP", "G3SG1",
            "Kevlar Vest", "Kevlar + Helmet", "Defuse Kit",
            "Incendiary Grenade", "Decoy Grenade", "Flashbang", "HE Grenade", "Smoke Grenade"
        }
        local TWeapons = {
            "Glock", "DualBerettas", "P250", "Tec9", "CZ", "DesertEagle", "R8",
            "Nova", "XM", "SawedOff", "M249", "Negev",
            "MAC10", "MP7", "MP7-SD", "UMP", "P90", "Bizon",
            "Galil", "AK47", "Scout", "SG", "AWP", "G3SG1",
            "Kevlar Vest", "Kevlar + Helmet",
            "Molotov", "Decoy Grenade", "Flashbang", "HE Grenade", "Smoke Grenade"
        }
        local inCT = table.find(CTWeapons, weapon) ~= nil
        local inT = table.find(TWeapons, weapon) ~= nil
        if inCT and inT then return "Both"
        elseif inCT then return "CT"
        elseif inT then return "T"
        else return nil end
    end
    
    local function buildSkinData()
        local knifeSkins = {}
        local gloveSkins = {}
        local weaponSkins = {}
        
        if not ReplicatedStorage:FindFirstChild("Skins") then
            warn("Skins folder not found!")
            return knifeSkins, gloveSkins, weaponSkins
        end
        
        for _, folder in ReplicatedStorage.Skins:GetChildren() do
            if folder:IsA("Folder") then
                local weaponName = folder.Name
                local team = getTeam(weaponName)
                if team then
                    if not weaponSkins[weaponName] then
                        weaponSkins[weaponName] = { team = team, skins = {} }
                    end
                    for _, skinObj in folder:GetChildren() do
                        local skinName = skinObj.Name
                        if skinName ~= "Stock" then
                            table.insert(weaponSkins[weaponName].skins, skinName)
                        end
                    end
                else
                    for _, skinObj in folder:GetChildren() do
                        local skinName = skinObj.Name
                        if skinName ~= "Stock" then
                            table.insert(knifeSkins, weaponName .. "_" .. skinName)
                        end
                    end
                end
            end
        end
        
        if ReplicatedStorage:FindFirstChild("Gloves") then
            for _, folder in ReplicatedStorage.Gloves:GetChildren() do
                if folder:IsA("Folder") and folder.Name ~= "Model" then
                    local gloveName = folder.Name
                    for _, skinObj in folder:GetChildren() do
                        local skinName = skinObj.Name
                        table.insert(gloveSkins, gloveName .. "_" .. skinName)
                    end
                end
            end
        end
        
        return knifeSkins, gloveSkins, weaponSkins
    end
    
    local knifeSkins, gloveSkins, weaponSkins = buildSkinData()
    
    local function sortTable(t)
        table.sort(t, function(a,b) return a < b end)
    end
    sortTable(knifeSkins)
    sortTable(gloveSkins)
    
    local function createDropdown(group, weaponName, skins, team)
        local values = {"None"}
        for _, skin in ipairs(skins) do
            table.insert(values, skin)
        end
        group:Dropdown {
            Name = weaponName,
            Items = values,
            Flag = "Skin/" .. weaponName .. "_" .. team,
            Default = "None",
            Scrolling = #skins > 10,
            Callback = function(Value)
                if Value ~= "None" then
                    local fullName = weaponName .. "_" .. Value
                    local DataEvent = ReplicatedStorage:FindFirstChild("Events")
                    if DataEvent then
                        DataEvent = DataEvent:FindFirstChild("DataEvent")
                        if DataEvent then
                            DataEvent:FireServer({
                                [1] = "EquipItem",
                                [2] = team,
                                [3] = weaponName,
                                [4] = { [1] = fullName }
                            })
                        end
                    end
                end
            end
        }
    end
    
    local function createCategoryDropdown(group, category, skinList, team, itemType)
        local values = {"None"}
        for _, skin in ipairs(skinList) do
            table.insert(values, skin)
        end
        group:Dropdown {
            Name = category,
            Items = values,
            Flag = "Skin/" .. category .. "_" .. team,
            Default = "None",
            Scrolling = #skinList > 10,
            Callback = function(Value)
                if Value ~= "None" then
                    local DataEvent = ReplicatedStorage:FindFirstChild("Events")
                    if DataEvent then
                        DataEvent = DataEvent:FindFirstChild("DataEvent")
                        if DataEvent then
                            DataEvent:FireServer({
                                [1] = "EquipItem",
                                [2] = team,
                                [3] = itemType,
                                [4] = { [1] = Value }
                            })
                        end
                    end
                end
            end
        }
    end
    
    if #knifeSkins > 0 then
        createCategoryDropdown(LeftGroup, "Knives", knifeSkins, "CT", "Knife")
        createCategoryDropdown(RightGroup, "Knives", knifeSkins, "T", "Knife")
    end
    
    if #gloveSkins > 0 then
        createCategoryDropdown(LeftGroup, "Gloves", gloveSkins, "CT", "Glove")
        createCategoryDropdown(RightGroup, "Gloves", gloveSkins, "T", "Glove")
    end
    
    local weaponNames = {}
    for w, _ in pairs(weaponSkins) do
        table.insert(weaponNames, w)
    end
    sortTable(weaponNames)
    
    for _, w in ipairs(weaponNames) do
        local data = weaponSkins[w]
        local team = data.team
        if team == "CT" or team == "Both" then
            createDropdown(LeftGroup, w, data.skins, "CT")
        end
        if team == "T" or team == "Both" then
            createDropdown(RightGroup, w, data.skins, "T")
        end
    end
    
    local function setupInventoryUnlock()
        local Client = getsenv(LocalPlayer and LocalPlayer.PlayerGui and LocalPlayer.PlayerGui:FindFirstChild("Client"))
        if not Client then return end
        
        local SkinsTable = {}
        for Index, Value in ReplicatedStorage.Skins:GetChildren() do
            if Value:IsA("Folder") then
                local GunName = Value.Name
                for _, Skin in Value:GetChildren() do
                    local SkinName = Skin.Name
                    if SkinName ~= "Stock" then
                        SkinsTable[HttpService:GenerateGUID(false)] = {
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
                    SkinsTable[HttpService:GenerateGUID(false)] = {
                        GloveName .. "_" .. SkinName
                    }
                end
            end
        end
        
        local Data = require(ReplicatedStorage:FindFirstChild("ReplicatedFirst") and ReplicatedStorage.ReplicatedFirst:FindFirstChild("Data") or game:GetService("ReplicatedFirst"):FindFirstChild("Data"))
        if Data then
            local OldGetData
            OldGetData = hookfunction(Data.GetData, function(Type, ...)
                if Type ~= nil then
                    local ToReturn = OldGetData(Type, ...)
                    for Index, Value in SkinsTable do
                        ToReturn[tostring(Index)] = Value
                    end
                    return ToReturn
                end
                return OldGetData(Type, ...)
            end)
        end
        
        local InventoryEvent = ReplicatedStorage:FindFirstChild("Events") and ReplicatedStorage.Events:FindFirstChild("InventoryAndLoadout")
        if InventoryEvent then
            for Index, Value in getconnections(InventoryEvent.OnClientEvent) do
                local Function = Value.Function
                if Function then
                    local OldHook
                    OldHook = hookfunction(Function, function(Type, Skins, ...)
                        if Type == "CTLoadout" then
                            Skins = Client.CTLoadout
                        elseif Type == "TLoadout" then
                            Skins = Client.TLoadout
                        elseif Type == "Inventory" then
                            Skins = SkinsTable
                        end
                        return OldHook(Type, Skins, ...)
                    end)
                end
            end
        end
        
        local DataEvent = ReplicatedStorage:FindFirstChild("Events") and ReplicatedStorage.Events:FindFirstChild("DataEvent")
        if DataEvent then
            local OldNamecall
            OldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
                local Method = getnamecallmethod()
                local Args = {...}
                if Method == "FireServer" then
                    if self and self.Name == "DataEvent" then
                        local Table = Args[1]
                        if Table and Table[1] == "EquipItem" then
                            if Table[2] ~= "Both" then
                                local SkinFolder = LocalPlayer.SkinFolder[Table[2] .. "Folder"]
                                local Weapon, Skin = table.unpack(string.split(Table[4][1], "_"))
                                if Table[3] == "Knife" or Table[3] == "Glove" then
                                    SkinFolder[Table[3]].Value = Skin
                                    local Loadout = Client[Table[2] .. "Loadout"]
                                    if Loadout then
                                        Loadout[Table[3] .. "Over"] = true
                                        Loadout[Table[3]] = {
                                            tostring(Weapon .. "_" .. Skin)
                                        }
                                    end
                                else
                                    SkinFolder[Weapon].Value = Skin
                                end
                            else
                                for _, Team in {"CT", "T"} do
                                    local SkinFolder = LocalPlayer.SkinFolder[Team .. "Folder"]
                                    local Weapon, Skin = table.unpack(string.split(Table[4][1], "_"))
                                    if Table[3] == "Knife" or Table[3] == "Glove" then
                                        SkinFolder[Table[3]].Value = Skin
                                        local Loadout = Client[Team .. "Loadout"]
                                        if Loadout then
                                            Loadout[Table[3] .. "Over"] = true
                                            Loadout[Table[3]] = {
                                                tostring(Weapon .. "_" .. Skin)
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
                return OldNamecall(self, ...)
            end)
        end
        
        local function refreshInventory()
            if InventoryEvent then
                firesignal(InventoryEvent.OnClientEvent, "Inventory", SkinsTable)
                firesignal(InventoryEvent.OnClientEvent, "CTLoadout", Client.CTLoadout)
                firesignal(InventoryEvent.OnClientEvent, "TLoadout", Client.TLoadout)
            end
        end
        
        refreshInventory()
    end
    
    task.wait(1)
    pcall(setupInventoryUnlock)
end

do
	local BulletTracerTextures = {
		["Lightning"] = 446111271,
		["Laser 1"] = 7136858729,
		["Laser 2"] = 6333823534,
		["Energy"] = 5864341017,
		["Unnamed"] = 118340191499338,
	}

	local BeamPart = NewInstance("Part")
	BeamPart.Name = "BulletBeamHolder"
	BeamPart.Transparency = 1
	BeamPart.Anchored = true
	BeamPart.CanCollide = false
	BeamPart.Parent = Workspace

	GlobalState.Visuals.Functions.CreateBeam = function(v1, v2)
		local tracerColor = Flags["Visuals/BulletTracerColor"]
		local color = tracerColor and tracerColor.Color or Color3FromRGB(255, 0, 0)
		local lifeTime = Flags["Visuals/BulletTracerTime"] or 2
		local textureName = Flags["Visuals/BulletTracerTexture"] or "Lightning"
		local textureId = BulletTracerTextures[textureName] or 446111271

		local colorSeq = NewColorSequence({
			NewColorSequenceKeypoint(0, color),
			NewColorSequenceKeypoint(1, color),
		})

		local Part = NewInstance("Part")
		Part.Size = NewVector3(1, 1, 1)
		Part.Transparency = 1
		Part.CanCollide = false
		Part.CFrame = NewCFrame(v1)
		Part.Anchored = true
		Part.Parent = BeamPart

		local Attachment = NewInstance("Attachment")
		Attachment.Parent = Part

		local Part2 = NewInstance("Part")
		Part2.Size = NewVector3(1, 1, 1)
		Part2.Transparency = 1
		Part2.CanCollide = false
		Part2.CFrame = NewCFrame(v2)
		Part2.Anchored = true
		Part2.Parent = BeamPart

		local Attachment2 = NewInstance("Attachment")
		Attachment2.Parent = Part2

		local Beam = NewInstance("Beam")
		Beam.FaceCamera = true
		Beam.Color = colorSeq
		Beam.Attachment0 = Attachment
		Beam.Attachment1 = Attachment2
		Beam.LightEmission = 1
		Beam.LightInfluence = 1
		local isUnnamed = (textureName == "Unnamed")
		Beam.Width0 = isUnnamed and 0.2 or 1
		Beam.Width1 = isUnnamed and 0.1 or 0.6
		Beam.Texture = "rbxassetid://" .. tostring(textureId)
		Beam.TextureMode = Enum.TextureMode.Wrap
		Beam.TextureLength = 3
		Beam.TextureSpeed = 3
		Beam.Parent = Part

		TaskDelay(lifeTime, function()
			for i = 0, 1, 0.02 do
				TaskWait()
				Beam.Transparency = NumberSequence.new(i)
			end
			Remove(Part)
			Remove(Part2)
		end)
	end

	GlobalState.Visuals.Functions.CreateBulletImpact = function(pos)
		local impactColor = Flags["Visuals/BulletImpactColor"]
		local color = impactColor and impactColor.Color or Color3FromRGB(0, 0, 255)
		local lifeTime = Flags["Visuals/BulletImpactTime"] or 3

		local Part = NewInstance("Part")
		Part.Anchored = true
		Part.CanCollide = false
		Part.Material = Enum.Material.Neon
		Part.Color = color
		Part.Size = NewVector3(0.25, 0.25, 0.25)
		Part.Position = pos
		Part.Name = "BulletImpact"
		Part.Parent = CurrentCamera
		TaskDelay(lifeTime, function()
			Remove(Part)
		end)
	end

    GlobalState.Visuals.Functions.CreateHitChams = function(targetPlayer)
        if not Flags["Visuals/HitChams"] then return end
        if not targetPlayer or not targetPlayer.Character then return end

        local hitChar = targetPlayer.Character
        local localTeam = GlobalState.Utility.GetTeam(LocalPlayer)
        local targetTeam = GlobalState.Utility.GetTeam(targetPlayer)
        if targetTeam == localTeam then return end

        local color = Flags["Visuals/HitChamsColor"] and Flags["Visuals/HitChamsColor"].Color or Color3FromRGB(255,255,255)
        local lifetime = Flags["Visuals/HitChamsTime"] or 3
        local baseTransparency = Flags["Visuals/HitChamsTransparency"]
        if baseTransparency == nil then baseTransparency = 0.5 end
        local chamsMaterial = Enum.Material.ForceField

        local ALLOWED_HITCHAMS_PARTS = {
            Head = true,
            UpperTorso = true,
            LowerTorso = true,
            Torso = true,
            LeftUpperArm = true,
            LeftLowerArm = true,
            LeftHand = true,
            RightUpperArm = true,
            RightLowerArm = true,
            RightHand = true,
            LeftUpperLeg = true,
            LeftLowerLeg = true,
            LeftFoot = true,
            RightUpperLeg = true,
            RightLowerLeg = true,
            RightFoot = true,
            ["Left Arm"] = true,
            ["Right Arm"] = true,
            ["Left Leg"] = true,
            ["Right Leg"] = true,
        }

        for _, hitbox in ipairs(hitChar:GetChildren()) do
            if hitbox:IsA("BasePart") and ALLOWED_HITCHAMS_PARTS[hitbox.Name] then
                TaskSpawn(function()
                    local p = NewInstance("Part")
                    p.CFrame = hitbox.CFrame
                    p.Anchored = true
                    p.CanCollide = false
                    p.TopSurface = Enum.SurfaceType.Smooth
                    p.BottomSurface = Enum.SurfaceType.Smooth
                    p.Shape = Enum.PartType.Block
                    p.Material = chamsMaterial
                    p.Color = color
                    p.Size = hitbox.Size
                    p.Transparency = baseTransparency
                    p.Parent = GlobalState.Constants.Debris

                    local fadeTime = MathMin(0.5, lifetime * 0.4)
                    TaskWait(lifetime - fadeTime)
                    for i = 1, 20 do
                        p.Transparency = baseTransparency + ((1 - baseTransparency) * (i / 20))
                        TaskWait(fadeTime / 20)
                    end
                    p:Destroy()
                end)
            end
        end
    end

	local VisualsFunctions = GlobalState.Visuals.Functions
	local VisualsStates = GlobalState.Visuals.States
	local Constants = GlobalState.Constants

	VisualsFunctions.Hitmark = function(hitPosition)
		if Flags["Visuals/Hitmarker"] == false then return false end
		local hitmarkerClone = Clone(HitmarkerData.Hitmarker.Holder)
		hitmarkerClone.Parent = GlobalState.MainScreenGui
		hitmarkerClone.Visible = false

		if GlobalState.RageBot.Active ~= nil and GlobalState.RageBot.Active.Point then
			hitPosition = GlobalState.RageBot.Active.Point
		end
		if Flags["Visuals/HitmarkerType"] == "Screen" then
			for key, child in GetChildren(hitmarkerClone) do
				RenderObjectUtils.SetRenderProperty(child, "BackgroundTransparency", 0)
				if child:FindFirstChild("Glow") then
					RenderObjectUtils.SetRenderProperty(child.Glow, "ImageTransparency", 0.8)
				end
			end
			TaskDelay(Flags["Visuals/HitmarkerDuration"], function()
				local lastTween
				for key, child in GetChildren(hitmarkerClone) do
					local tween = TweenService:Create(child, GlobalConfig.FadeHitmarker, { BackgroundTransparency = 1 })
					tween:Play()
					if child:FindFirstChild("Glow") then
						local glowTween = TweenService:Create(child.Glow, GlobalConfig.FadeHitmarker, { ImageTransparency = 1 })
						glowTween:Play()
						lastTween = glowTween
					end
					if not lastTween then lastTween = tween end
				end
				if lastTween then
					lastTween.Completed:Wait()
				end
				hitmarkerClone:Destroy()
			end)
			return true
		elseif Flags["Visuals/HitmarkerType"] == "World" then
			hitmarkerClone.Position = UDim2FromOffset(5000, 5000)
			local renderConnection

			renderConnection = RunService.RenderStepped:Connect(function()
				local screenPos, onScreen = WorldToViewportPoint(CurrentCamera, hitPosition)
				if onScreen then
					hitmarkerClone.Position = UDim2FromOffset(screenPos.X, screenPos.Y)
					hitmarkerClone.Visible = true
				else
					hitmarkerClone.Visible = false
				end
			end)
			for key, child in GetChildren(hitmarkerClone) do
				RenderObjectUtils.SetRenderProperty(child, "BackgroundTransparency", 0)
			end
			TaskDelay(Flags["Visuals/HitmarkerDuration"], function()
				local lastTween
				for key, child in GetChildren(hitmarkerClone) do
					local tween = TweenService:Create(child, GlobalConfig.FadeHitmarker, { BackgroundTransparency = 1 })
					tween:Play()
					if not lastTween then lastTween = tween end
				end
				if lastTween then
					lastTween.Completed:Wait()
				end
				if renderConnection then renderConnection:Disconnect() end
				hitmarkerClone:Destroy()
			end)
			return true
		end
		return false
	end

	VisualsFunctions.ResetLighting = function(resetType)
		local map = FindFirstChild(Workspace, "Map")
		if not map then return end
		local mapLighting = FindFirstChild(map, "Lighting")
		if not mapLighting then return end

		if resetType == "Ambience" then
			if Lighting.Ambient ~= mapLighting.Ambient.Value then
				Lighting.Ambient = mapLighting.Ambient.Value
			end
			if Lighting.OutdoorAmbient ~= mapLighting.OutdoorAmbient.Value then
				Lighting.OutdoorAmbient = mapLighting.OutdoorAmbient.Value
			end
		elseif resetType == "Time" then
			if Lighting.ClockTime ~= mapLighting.ClockTime.Value then
				Lighting.ClockTime = mapLighting.ClockTime.Value
			end
		elseif resetType == "All" then
			for propertyName, propertyValue in GetChildren(mapLighting) do
				if Lighting[propertyName] then
					pcall(function()
						Lighting[propertyName] = propertyValue
					end)
				end
			end
		end
	end

	VisualsFunctions.Lighting = function()
    	if Flags["Visuals/Ambience"] then
        	Lighting.Ambient = Flags["Visuals/InsideAmbience"].Color
        	Lighting.OutdoorAmbient = Flags["Visuals/OutdoorAmbient"].Color
    	else
        	VisualsFunctions.ResetLighting("Ambience")
    	end
    	if Flags["Visuals/ForceTime"] then
    	    Lighting.ClockTime = Flags["Visuals/CustomTime"] or 10
    	else
    	    VisualsFunctions.ResetLighting("Time")
    	end
    
    	if Flags["Visuals/FogEnabled"] then
    	    atm.Parent = Lighting
    	    atm.Density = Flags["Visuals/FogDensity"] or 0
    	    atm.Offset = Flags["Visuals/FogOffset"] or 0
    	    atm.Haze = Flags["Visuals/FogHaze"] or 0
    	    atm.Glare = Flags["Visuals/FogGlare"] or 0
    	    atm.Color = Flags["Visuals/FogColor"].Color or Color3FromRGB(199, 199, 199)
    	    atm.Decay = Flags["Visuals/FogDecay"].Color or Color3FromRGB(199, 199, 199)
    	else
    	    atm.Parent = nil
    	end
	end
end

do
	local GLOBAL_CHAMS_ALLOWED_PARTS = {
		Head = true,
		UpperTorso = true,
		LowerTorso = true,
		Torso = true,
		LeftUpperArm = true,
		LeftLowerArm = true,
		LeftHand = true,
		RightUpperArm = true,
		RightLowerArm = true,
		RightHand = true,
		LeftUpperLeg = true,
		LeftLowerLeg = true,
		LeftFoot = true,
		RightUpperLeg = true,
		RightLowerLeg = true,
		RightFoot = true,
		["Left Arm"] = true,
		["Right Arm"] = true,
		["Left Leg"] = true,
		["Right Leg"] = true,
	}

	local function globalChamsResetCharacter(character)
    	if not character then return end
    	local cylinderHead = FindFirstChild(character, "CylinderHead")
    	if cylinderHead then
    	    local tween = TweenService:Create(cylinderHead, TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
    	        Transparency = 1
    	    })
    	    tween:Play()
    	    task.wait(0.3)
    	    Remove(cylinderHead)
    	end
    	local head = FindFirstChild(character, "Head")
    	if head then head.Transparency = 0 end
    	for _, part in GetChildren(character) do
    	    if IsA(part, "BasePart") and GLOBAL_CHAMS_ALLOWED_PARTS[part.Name] then
    	        part.Material = Enum.Material.Plastic
    	    end
    	end
	end

	local function globalChamsApplyToPlayer(player)
		if player == LocalPlayer then return end

		local character = player.Character
		if not character then return end

		local playerTeam = GlobalState.Utility.GetTeam(player)
		local localTeam = GlobalState.Utility.GetTeam(LocalPlayer)
		local isTeammate = playerTeam == localTeam

		local shouldApply
		local chamColor

		if isTeammate then
			shouldApply = Flags["GlobalChams/Team"]
			chamColor = Flags["GlobalChams/TeamColor"] and Flags["GlobalChams/TeamColor"].Color or Color3FromRGB(0, 100, 255)
		else
			shouldApply = Flags["GlobalChams/Enemy"]
			chamColor = Flags["GlobalChams/EnemyColor"] and Flags["GlobalChams/EnemyColor"].Color or Color3FromRGB(255, 0, 0)
		end

		if not shouldApply then
			globalChamsResetCharacter(character)
			return
		end

		for _, part in GetChildren(character) do
			if IsA(part, "BasePart") and GLOBAL_CHAMS_ALLOWED_PARTS[part.Name] then
				part.Material = Enum.Material.Neon
				part.Color = chamColor
				part.Reflectance = 0
			end
		end

		local head = FindFirstChild(character, "Head")
		if head then
			head.Transparency = 1
			local face = FindFirstChild(head, "face")
			if face then Remove(face) end

			local cylinderHead = FindFirstChild(character, "CylinderHead")
			if not cylinderHead then
				cylinderHead = NewInstance("Part")
				cylinderHead.Name = "CylinderHead"
				cylinderHead.Shape = Enum.PartType.Cylinder
				cylinderHead.Size = NewVector3(0.8, 1, 1)
				cylinderHead.Material = Enum.Material.Neon
				cylinderHead.Color = chamColor
				cylinderHead.Reflectance = 0
				cylinderHead.CanCollide = false
				cylinderHead.Parent = character

				local weld = NewInstance("Weld")
				weld.Part0 = head
				weld.Part1 = cylinderHead
				weld.C0 = NewCFrame(0, -0.1, 0)
				weld.Parent = cylinderHead
				cylinderHead.Orientation = NewVector3(0, 0, 90)
			else
				cylinderHead.Color = chamColor
			end
		end

		local playerFolder = FindFirstChild(Workspace, player.Name)
		if playerFolder then
			for _, item in GetChildren(playerFolder) do
				if IsA(item, "Shirt") or IsA(item, "Pants") or IsA(item, "Accessory") then
					Remove(item)
				end
			end

			local fakeHead = FindFirstChild(playerFolder, "FakeHead")
			if fakeHead then
				fakeHead.Transparency = 1
				local fakeFace = FindFirstChild(fakeHead, "face")
				if fakeFace then Remove(fakeFace) end
			end

			local backC4 = FindFirstChild(playerFolder, "BackC4")
			if backC4 then
				for _, part in ipairs(backC4:GetDescendants()) do
					if part:IsA("BasePart") then
						part.Material = Enum.Material.Neon
						part.Color = chamColor
					end
				end
			end

			for _, handName in ipairs({"LeftHand", "RightHand"}) do
				local hand = FindFirstChild(playerFolder, handName)
				if hand then
					for _, obj in GetChildren(hand) do
						if StringFind(StringLower(obj.Name), "glove") then
							Remove(obj)
						end
					end
				end
			end
		end
	end

	local function globalChamsUpdateAll()
		local enabled = Flags["GlobalChams/Enabled"]
		
		if not enabled then
			if chamsWasEnabled then
				for _, player in GetPlayers(players) do
					local character = player.Character
					if character then
						globalChamsResetCharacter(character)
					end
				end
				chamsWasEnabled = false
			end
			return
		end

		chamsWasEnabled = true
		for _, player in GetPlayers(players) do
			globalChamsApplyToPlayer(player)
		end
	end

	GlobalState.Visuals.Functions.GlobalChamsUpdateAll = globalChamsUpdateAll

	RunService.RenderStepped:Connect(globalChamsUpdateAll)
end

do
	GlobalState.Esp.GetBoundingBoxes = function(rootCFrame, screenPos, scale, useCachedCharacter, entityData)
		local minX, maxX = HUGE_VALUE, -HUGE_VALUE
		local minY, maxY = HUGE_VALUE, -HUGE_VALUE

		if useCachedCharacter and entityData and entityData.LastCharacter then
			local lastChar = entityData.LastCharacter
			local minX2, minY2, maxX2, maxY2 = HUGE_VALUE, HUGE_VALUE, -HUGE_VALUE, -HUGE_VALUE

			local modelCFrame, modelSize = lastChar:GetBoundingBox()

			local halfSizeX = modelSize.X * 0.5
			local halfSizeY = modelSize.Y * 0.5
			local halfSizeZ = modelSize.Z * 0.5

			local m11, m12, m13, m14,
				  m21, m22, m23, m24,
				  m31, m32, m33, m34 = GetComponents(modelCFrame)

			local offsetsX = { halfSizeX, -halfSizeX, halfSizeX, -halfSizeX, halfSizeX, -halfSizeX, halfSizeX, -halfSizeX }
			local offsetsY = { halfSizeY, halfSizeY, -halfSizeY, -halfSizeY, halfSizeY, halfSizeY, -halfSizeY, -halfSizeY }
			local offsetsZ = { halfSizeZ, halfSizeZ, halfSizeZ, halfSizeZ, -halfSizeZ, -halfSizeZ, -halfSizeZ, -halfSizeZ }

			local projX, projY
			for i = 1, 8 do
				local ox, oy, oz = offsetsX[i], offsetsY[i], offsetsZ[i]
				local worldX = m11 * ox + m12 * oy + m13 * oz + m14
				local worldY = m21 * ox + m22 * oy + m23 * oz + m24
				local worldZ = m31 * ox + m32 * oy + m33 * oz + m34
				projX, projY = WorldToViewportPoint(CurrentCamera, NewVector3(worldX, worldY, worldZ))
				if projY then
					if projX < minX2 then minX2 = projX end
					if projX > maxX2 then maxX2 = projX end
					if projY < minY2 then minY2 = projY end
					if projY > maxY2 then maxY2 = projY end
				end
			end

			if minX2 == HUGE_VALUE then
				minX2 = screenPos.X - 20
				maxX2 = screenPos.X + 20
				minY2 = screenPos.Y - 40
				maxY2 = screenPos.Y + 40
			end

			return
				MathFloor(minX2),
				MathFloor(minY2),
				MathFloor(maxX2),
				MathFloor(maxY2),
				MathFloor(minX2 + (maxX2 - minX2) / 2),
				MathFloor(minY2 + (maxY2 - minY2) / 2)
		else
			local headHeight = 2.68 * scale
			local bodyWidth = 1.6 * scale

			local headScreenPos = WorldToViewportPoint(CurrentCamera, rootCFrame.Position + NewVector3(0, headHeight, 0))
			local heightDiff = headScreenPos.Y - screenPos.Y

			local boxWidth = heightDiff / 1.5
			local centerX = screenPos.X
			local centerY = screenPos.Y

			local leftX = centerX + boxWidth
			local rightX = centerX - boxWidth
			local bottomY = centerY + (boxWidth * 1.15)
			local topY = centerY - (heightDiff * 1.15)

			local corners = {
				NewVector2(leftX, bottomY),
				NewVector2(rightX, topY),
				NewVector2(leftX, topY),
				NewVector2(rightX, bottomY),
			}

			for _, corner in corners do
				if minX > corner.X then minX = corner.X end
				if maxX < corner.X then maxX = corner.X end
				if minY > corner.Y then minY = corner.Y end
				if maxY < corner.Y then maxY = corner.Y end
			end

			return
				MathFloor(minX),
				MathFloor(minY),
				MathFloor(maxX),
				MathFloor(maxY),
				MathFloor(minX + (maxX - minX) / 2),
				MathFloor(minY + (maxY - minY) / 2)
		end
	end

	GlobalState.Esp.Hide = function(entity)
		if entity.IsFading then return end
		local frameHolder = entity.Objects.FrameHolder
		if frameHolder and RenderObjectUtils.GetRenderProperty(frameHolder, "Visible") == true then
			RenderObjectUtils.SetRenderProperty(frameHolder, "Visible", false)
		end
	end

	GlobalState.Esp.Show = function(entity)
		if entity.IsFading then return end
		local frameHolder = entity.Objects.FrameHolder
		if frameHolder and RenderObjectUtils.GetRenderProperty(frameHolder, "Visible") == false then
			RenderObjectUtils.SetRenderProperty(frameHolder, "Visible", true)
		end
	end

	GlobalState.Esp.ApplyTextLabel = function(textLabel)
		local textCase = Flags["Esp/TextCases"]
		local textWrapper = Flags["Esp/TextWrapper"]

		if not GlobalState.Esp.SettingsCache.TextCases[textLabel] then
			local originalText = textLabel.Text
			GlobalState.Esp.SettingsCache.TextCases[textLabel] = {
				Upper = StringUpper(originalText),
				Normal = originalText,
				Lower = StringLower(originalText),
			}
		end

		local cachedTexts = GlobalState.Esp.SettingsCache.TextCases[textLabel]

		local newText
		if textCase == "UPPER" then
			newText = cachedTexts.Upper
		elseif textCase == "lower" then
			newText = cachedTexts.Lower
		else
			newText = cachedTexts.Normal
		end

		if textWrapper == "[Brackets]" then
			textLabel.Text = "[" .. newText .. "]"
		elseif textWrapper == "{Braces}" then
			textLabel.Text = "{" .. newText .. "}"
		else
			textLabel.Text = newText
		end

		GlobalState.Esp.FixTextPadding(textLabel)
	end

	GlobalState.Esp.UpdateElement = function(player)
		local entity = GlobalState.Esp.Entities[player]
		if not entity then return end
		local objects = entity.Objects

		local playerTeam = GlobalState.Utility.GetTeam(player)
		local localTeam = GlobalState.Utility.GetTeam(LocalPlayer)
		local isTeam = playerTeam == localTeam
		local category = isTeam and "Team" or "Enemy"

		local sideObjects = {
			Left = objects.SideLeft,
			Right = objects.SideRight,
			Top = objects.SideTop,
			Bottom = objects.SideBottom,
		}

		do
			GlobalState.Esp.SettingsCache.TweenInformation[1] = TweenInfo.new(
				Flags["Esp/FadeTime"],
				Enum.EasingStyle[Flags["Esp/FadeEasingStyle"]],
				Enum.EasingDirection.Out
			)
		end

		do
			RenderObjectUtils.SetRenderProperty(objects.HealthBarNumber, "Visible", Flags[category .. "/HealthBarNumber"] and Flags[category .. "/HealthBar"])
			local Font = Flags["Esp/Font"] or "SmallestPixel7"
			if RenderObjectUtils.Fonts[Font] then
				local size = Font == "SmallestPixel7" and 9 or 12
				RenderObjectUtils.SetRenderProperty(objects.HealthBarNumber, "Font", RenderObjectUtils.Fonts[Font])
				RenderObjectUtils.SetRenderProperty(objects.HealthBarNumber, "TextSize", size)
			end
			objects.HealthBarNumber.TextColor3 = Flags[category .. "/HealthBarNumberColor"].Color
		end

		do
			local imageEnabled = Flags[category .. "/Image"]
			local imageType = Flags[category .. "/ImageType"] or "Aiko"
			local imageTransparency = Flags["Esp/ImageTransparency"] or 0
			local imageLabel = objects.Image
			RenderObjectUtils.SetRenderProperty(imageLabel, "Visible", imageEnabled)
			RenderObjectUtils.SetRenderProperty(imageLabel, "ImageTransparency", imageTransparency)
			local imageAsset = GlobalState.Assets.Images.Girls[imageType]
			if imageAsset then
				RenderObjectUtils.SetRenderProperty(imageLabel, "Image", imageAsset)
			end
		end

		do
			local color1 = Flags[category .. "/BoxColor1"].Color or Color3FromRGB(255, 255, 255)
			local color2 = Flags[category .. "/BoxColor2"].Color or Color3FromRGB(255, 255, 255)

			RenderObjectUtils.SetRenderProperty(
				objects.BoxGradient,
				"Color",
				NewColorSequence {
					NewColorSequenceKeypoint(0, color1),
					NewColorSequenceKeypoint(1, color2),
				}
			)

			RenderObjectUtils.SetRenderProperty(objects.Box, "Visible", Flags[category .. "/Box"])
			RenderObjectUtils.SetRenderProperty(objects.FullBoxHolder, "Visible", Flags[category .. "/Box"])
			do
				local fillColor1 = Flags[category .. "/BoxFillColor1"].Color or Color3FromRGB(255, 255, 255)
				local fillColor2 = Flags[category .. "/BoxFillColor2"].Color or Color3FromRGB(255, 255, 255)
				local fillAlpha1 = Flags[category .. "/BoxFillColor1"].Transparency or 0.5
				local fillAlpha2 = Flags[category .. "/BoxFillColor2"].Transparency or 0.5

				RenderObjectUtils.SetRenderProperty(
					objects.BoxFillGradient,
					"Color",
					NewColorSequence {
						NewColorSequenceKeypoint(0, fillColor1),
						NewColorSequenceKeypoint(1, fillColor2),
					}
				)

				RenderObjectUtils.SetRenderProperty(
					objects.BoxFillGradient,
					"Transparency",
					NewNumberSequence {
						NewNumberSequenceKeypoint(0, fillAlpha1),
						NewNumberSequenceKeypoint(1, fillAlpha2),
					}
				)

				RenderObjectUtils.SetRenderProperty(objects.BoxFill, "BackgroundTransparency", 0)
				RenderObjectUtils.SetRenderProperty(objects.BoxFill, "Visible", Flags[category .. "/BoxFill"] and Flags[category .. "/Box"])
			end
		end

		do
			local nameLabel = objects.Name
			nameLabel.Visible = Flags[category .. "/Name"]
			nameLabel.TextColor3 = Flags[category .. "/NameColor"].Color
			GlobalState.Esp.ApplyTextLabel(nameLabel)
		end

		do
			local distanceLabel = objects.Distance
			distanceLabel.Visible = Flags[category .. "/Distance"]
			distanceLabel.TextColor3 = Flags[category .. "/DistanceColor"].Color
			GlobalState.Esp.ApplyTextLabel(distanceLabel)
		end

		do
			local toolLabel = objects.Tool
			toolLabel.Visible = Flags[category .. "/Tool"]
			toolLabel.TextColor3 = Flags[category .. "/ToolColor"] and Flags[category .. "/ToolColor"].Color or Color3FromRGB(255, 255, 255)
			GlobalState.Esp.ApplyTextLabel(toolLabel)
		end

		do
			local cashLabel = objects.Cash
			cashLabel.Visible = Flags[category .. "/Cash"]
			cashLabel.TextColor3 = Flags[category .. "/CashColor"] and Flags[category .. "/CashColor"].Color or Color3FromRGB(0, 180, 80)

			local zoomLabel = objects.Zoom
			zoomLabel.Visible = Flags[category .. "/Zoom"]
			zoomLabel.TextColor3 = Flags[category .. "/ZoomColor"] and Flags[category .. "/ZoomColor"].Color or Color3FromRGB(0, 180, 255)

			local c4FlagLabel = objects.C4Flag
			c4FlagLabel.Visible = Flags[category .. "/C4Flag"]
			c4FlagLabel.TextColor3 = Flags[category .. "/C4FlagColor"] and Flags[category .. "/C4FlagColor"].Color or Color3FromRGB(255, 50, 50)
		end

		do
			local healthBarThickness = Flags["Esp/HealthBarThickness"] or 1
			RenderObjectUtils.SetRenderProperty(objects.HealthBarHolder, "Size", NewUDim2(0, healthBarThickness, 1, 2))
			local color1 = Flags[category .. "/HealthBarColor1"].Color or Color3FromRGB(255, 255, 255)
			local color2 = Flags[category .. "/HealthBarColor2"].Color or Color3FromRGB(255, 255, 255)
			entity.LastHealthBarSide = nil
			RenderObjectUtils.SetRenderProperty(
				objects.HealthBarFillGradient,
				"Color",
				NewColorSequence {
					NewColorSequenceKeypoint(0, color1),
					NewColorSequenceKeypoint(0.5, color1:Lerp(color2, 0.5)),
					NewColorSequenceKeypoint(1, color2),
				}
			)
		end

		do
			local chamsEnabled = Flags[category .. "/Chams"]
			if chamsEnabled then
				local needRebuild = false
				if entity.Chams and next(entity.Chams) then
					local firstAdorn = entity.Chams["main_1"]
					if firstAdorn and (not firstAdorn.Adornee or not firstAdorn.Adornee:IsDescendantOf(player.Character)) then
						needRebuild = true
					end
				else
					needRebuild = true
				end
				if needRebuild then
					GlobalState.Esp.RemoveChams(entity)
					GlobalState.Esp.DrawChams(player, entity)
				else
					local defaultColor = category == "Enemy" and Color3FromRGB(255, 0, 0) or Color3FromRGB(0, 100, 255)
					local chamsColor = Flags[category .. "/ChamsColor"] and Flags[category .. "/ChamsColor"].Color or defaultColor
					local chamsTransparency = Flags[category .. "/ChamsTransparency"] or 0.5
					for key, adornment in entity.Chams do
						if string.find(key, "main_") then
							pcall(function()
								adornment.Color3 = chamsColor
								adornment.Transparency = chamsTransparency
							end)
						end
					end
				end
			else
				GlobalState.Esp.RemoveChams(entity)
			end
		end
	end

	GlobalState.Esp.CanChangeTransparency = function(entity, object)
		if object == nil or entity == nil then return false end
		local noFade = entity.NoFade
		local can = true
		for _, noFadeObj in noFade do
			if noFadeObj == object then
				can = false
				break
			end
		end
		return can
	end

	GlobalState.Esp.Fade = function(fadeIn, entity)
		local targetAlpha = fadeIn and 0 or 1

		for _, object in entity.Objects do
			if GlobalState.Esp.CanChangeTransparency(entity, object) == true then
				local transparencyProp = GlobalState.Utility.GetTransparency(object)
				if transparencyProp then
					local tween = TweenService:Create(
						object,
						GlobalState.Esp.SettingsCache.TweenInformation[1],
						{ [transparencyProp] = targetAlpha }
					)
					tween:Play()
				end
			end
		end

		if entity.Chams then
			for key, adornment in entity.Chams do
				if string.find(key, "main_") then
					pcall(function()
						adornment.Transparency = fadeIn and entity.ChamsTransparencyTo or 1
					end)
				end
			end
		end
	end

	GlobalState.Esp.SetTransparency = function(entity, alpha)
		if entity.LastAlpha == alpha then return end
		entity.LastAlpha = alpha
		for _, object in entity.Objects do
			if GlobalState.Esp.CanChangeTransparency(entity, object) then
				local transparencyProp = GlobalState.Utility.GetTransparency(object)
				if transparencyProp then
					object[transparencyProp] = alpha
				end
			end
		end
		if entity.Chams then
			for key, adornment in entity.Chams do
				if string.find(key, "main_") then
					pcall(function()
						adornment.Transparency = alpha
					end)
				end
			end
		end
	end

	GlobalState.Esp.FixTextPadding = function(textLabel)
		local fontFace = textLabel.FontFace
		local fontName = ""
		local found = false
		for name, font in LoadedFonts do
			if font == fontFace then
				fontName = name
			end
		end

		if GlobalState.Esp.TextOffsets[fontName] then
			local offsets = GlobalState.Esp.TextOffsets[fontName]
			local sideName = textLabel.Parent.Name

			do
				local textWidth, textHeight = GlobalState.Utility.GetTextBounds(
					textLabel.Text,
					textLabel.FontFace,
					textLabel.TextSize
				)

				if offsets.Side[sideName] then
					local sideOffsets = offsets.Side[textLabel.Parent.Name]
					textLabel.Size = UDim2FromOffset(textWidth + sideOffsets.X, textHeight + sideOffsets.Y)
				else
					textLabel.Size = UDim2FromOffset(textWidth + offsets.X, textHeight + offsets.Y)
				end
			end
			found = true
		else
			local textWidth, textHeight = GlobalState.Utility.GetTextBounds(
				textLabel.Text,
				textLabel.FontFace,
				textLabel.TextSize
			)
			textLabel.Size = UDim2FromOffset(textWidth, textHeight)
		end
		return found
	end

	GlobalState.Esp.GetHealth = function(player)
		local humanoid = FindFirstChildOfClass(player, "Humanoid")

		if game.PlaceId == 79393329652220 then
			local plr = GetPlayerFromCharacter(Players, player)
			if not plr then return 0, 100 end
			local health = GetAttribute(plr, "Health")
			local maxHealth = GetAttribute(plr, "MaxHealth")
			if not health or not maxHealth then return 0, 100 end
			return health, maxHealth
		end

		if not humanoid then return 0, 100 end
		return humanoid.Health, humanoid.MaxHealth
	end

	GlobalState.Esp.GetEquipped = function(player)
		if player == nil then return end
		local tool = FindFirstChild(player, "EquippedTool")
		if not tool then return "None" end
		if tool.Value then
			return tool.Value
		end
		return "None"
	end

	GlobalState.Esp.DoNothing = function()
		local a = true
		local b = true
		local c = "Yuri"
		local d = "Dexsai"
		if a == true and b == true then
			local e = { c, d }
			return e
		end
		return "sorry dexsai"
	end

	GlobalState.Esp.RemoveChams = function(entity)
		if not entity.Chams then return end
		for key, adornment in entity.Chams do
			pcall(function() adornment:Destroy() end)
			entity.Objects["Chams_main_" .. key] = nil
		end
		entity.Chams = {}
	end

	local function IsPartVisible(part)
		if not part then return false end
		local cameraPos = CurrentCamera.CFrame.Position
		local direction = part.Position - cameraPos
		local length = direction.Magnitude
		if length == 0 then return false end
		local params = NewRaycastParams()
		params.FilterType = Enum.RaycastFilterType.Exclude
		params.FilterDescendantsInstances = { LocalPlayer.Character, part.Parent }
		params.IgnoreWater = true
		local result = Workspace:Raycast(cameraPos, direction, params)
		return result == nil or result.Instance:IsDescendantOf(part.Parent)
	end

	GlobalState.Esp.UpdateChamsVisibility = function(player, entity)
		local hideOnVisible = Flags["Chams/HideOnVisible"]
		if not hideOnVisible or not entity.Chams then return end
		
		local playerTeam = GlobalState.Utility.GetTeam(player)
		local localTeam = GlobalState.Utility.GetTeam(LocalPlayer)
		local category = (playerTeam == localTeam) and "Team" or "Enemy"
		
		local sliderTransparency = Flags[category .. "/ChamsTransparency"] or 0.5
		local chamsTransparency = sliderTransparency
		
		if entity.ChamsTransparencyTo and entity.ChamsTransparencyTo ~= sliderTransparency then
			chamsTransparency = sliderTransparency
		elseif entity.ChamsTransparencyTo then
			chamsTransparency = entity.ChamsTransparencyTo
		end
		
		for key, adornment in entity.Chams do
			if string.find(key, "main_") then
				local part = adornment.Adornee
				if part and part:IsA("BasePart") then
					local visible = IsPartVisible(part)
					local trans = visible and 1 or chamsTransparency
					
					if adornment.Transparency ~= trans then
						pcall(function()
							adornment.Transparency = trans
						end)
					end
				end
			end
		end
	end

	GlobalState.Esp.DrawChams = function(player, entity)
    	GlobalState.Esp.RemoveChams(entity)

    	local playerTeam = GlobalState.Utility.GetTeam(player)
    	local localTeam = GlobalState.Utility.GetTeam(LocalPlayer)
    	local category = (playerTeam == localTeam) and "Team" or "Enemy"

    	if not Flags[category .. "/Chams"] then return end

    	local character = player.Character or entity.LastCharacter
    	if not character then return end

    	local defaultColor = category == "Enemy" and Color3FromRGB(255, 0, 0) or Color3FromRGB(0, 100, 255)
    	local mainColor = Flags[category .. "/ChamsColor"] and Flags[category .. "/ChamsColor"].Color or defaultColor
    	local transparency = Flags[category .. "/ChamsTransparency"] or 0.5
    	entity.ChamsTransparencyTo = transparency
    	entity.ChamsCategory = category

    	entity.Chams = {}

    	local ALLOWED_PARTS = {
    		Head = true,
    		FakeHead = true,
    		CylinderHead = true,
    		UpperTorso = true,
    		LowerTorso = true,
    		Torso = true,
    		LeftUpperArm = true,
    		LeftLowerArm = true,
    		LeftHand = true,
    		RightUpperArm = true,
    		RightLowerArm = true,
    		RightHand = true,
    		LeftUpperLeg = true,
    		LeftLowerLeg = true,
    		LeftFoot = true,
    		RightUpperLeg = true,
    		RightLowerLeg = true,
    		RightFoot = true,
    		["Left Arm"] = true,
    		["Right Arm"] = true,
    		["Left Leg"] = true,
    		["Right Leg"] = true,
		}

    	local count = 0
    	for _, part in GetChildren(character) do
    	    if not IsA(part, "BasePart") then continue end
    	    if not ALLOWED_PARTS[part.Name] then continue end
    	    local p = part
    	    if p.Transparency >= 1 then continue end

    	    local isHead = p.Name == "Head" or p.Name == "FakeHead"

    	    local adorn = NewInstance("BoxHandleAdornment")
    	    adorn.Size = p.Size
    	    adorn.Name = "Chams"
    	    adorn.AlwaysOnTop = true
    	    adorn.ZIndex = isHead and 10 or 9
    	    adorn.Adornee = p
    	    adorn.Color3 = mainColor
    	    adorn.Transparency = transparency
    	    adorn.Parent = p

    	    count = count + 1
    	    entity.Chams["main_" .. count] = adorn
    	    entity.Objects["Chams_main_" .. count] = adorn
    	end
	end
	
	GlobalState.Esp.UpdateAllChamsTransparency = function(category)
		for player, entity in pairs(GlobalState.Esp.Entities) do
			if entity.ChamsCategory == category and entity.Chams then
				local sliderTransparency = Flags[category .. "/ChamsTransparency"] or 0.5
				entity.ChamsTransparencyTo = sliderTransparency
				
				for key, adornment in entity.Chams do
					if string.find(key, "main_") then
						local part = adornment.Adornee
						if part and part:IsA("BasePart") then
							local visible = IsPartVisible(part)
							local trans = visible and 1 or sliderTransparency
							
							pcall(function()
								adornment.Transparency = trans
							end)
						end
					end
				end
			end
		end
	end

	GlobalState.Esp.AddEntity = function(player)
		local objects = {}
		local noFadeObjects = {}

		local entityData = { Objects = objects, NoFade = noFadeObjects, IsOnScreen = false, IsFading = false, HasFadedIn = false, LastTool = nil, LastToolText = nil }
		GlobalState.Esp.Entities[player] = entityData

		objects.FrameHolder = RenderObjectUtils.new("Frame", { Visible = false, Parent = GlobalState.Esp.Holder, BackgroundTransparency = 1 })
		objects.Box = RenderObjectUtils.new("Frame", { Visible = true, Parent = objects.FrameHolder, Size = NewUDim2(1, 0, 1, 0), BackgroundTransparency = 1 })
		noFadeObjects.Holder = objects.FrameHolder
		noFadeObjects.BoxHolder = objects.Box

		objects.FullBoxHolder = RenderObjectUtils.new("Frame", { Visible = false, Parent = objects.Box, Size = NewUDim2(1, 0, 1, 0), BackgroundTransparency = 1 })
		noFadeObjects.FullBoxHolder = objects.FullBoxHolder
		objects.BoxStroke = RenderObjectUtils.new("UIStroke", { Parent = objects.FullBoxHolder, LineJoinMode = "Miter", Thickness = 1, ZIndex = 5, Color = Color3FromRGB(255, 255, 255) })
		objects.BoxOutline = RenderObjectUtils.new("UIStroke", { Parent = objects.FullBoxHolder, Thickness = 3, Color = Color3FromRGB(0, 0, 0), BorderOffset = NewUDim(0, -1), LineJoinMode = "Miter" })
		objects.BoxGradient = RenderObjectUtils.new("UIGradient", { Parent = objects.BoxStroke, Rotation = 90, Color = CNew {
			ColorSequenceKeypoint.new(0, Color3FromRGB(255, 255, 255)),
			ColorSequenceKeypoint.new(1, Color3FromRGB(255, 255, 255)),
		} })

		objects.SideLeft = RenderObjectUtils.new("Frame", { Visible = true, Parent = objects.FrameHolder, Size = NewUDim2(1, 0, 1, 0), Position = NewUDim2(-1, -0, 0, -4), BackgroundTransparency = 1, Name = "Left" })
		objects.SideRight = RenderObjectUtils.new("Frame", { Visible = true, Parent = objects.FrameHolder, Size = NewUDim2(1, 0, 1, 0), Position = NewUDim2(1, 0, 0, -4), BackgroundTransparency = 1, Name = "Right" })
		objects.SideBottom = RenderObjectUtils.new("Frame", { Visible = true, Parent = objects.FrameHolder, Size = NewUDim2(1, 0, 1, 0), Position = NewUDim2(0, 0, 1, 0), BackgroundTransparency = 1, Name = "Bottom" })
		objects.SideTop = RenderObjectUtils.new("Frame", { Visible = true, Parent = objects.FrameHolder, Size = NewUDim2(1, 0, 1, 0), Position = NewUDim2(0, 0, -1, -0), BackgroundTransparency = 1, Name = "Top" })
		noFadeObjects.Left = objects.SideLeft
		noFadeObjects.Right = objects.SideRight
		noFadeObjects.Bottom = objects.SideBottom
		noFadeObjects.Top = objects.SideTop
		RenderObjectUtils.new("UIListLayout", { Parent = objects.SideLeft, HorizontalAlignment = "Right", Padding = NewUDim(0, 1) })
		RenderObjectUtils.new("UIListLayout", { Parent = objects.SideRight, HorizontalAlignment = "Left", Padding = NewUDim(0, -1) })
		RenderObjectUtils.new("UIListLayout", { Parent = objects.SideBottom, HorizontalAlignment = "Center", VerticalAlignment = "Top", Padding = NewUDim(0, 1) })
		RenderObjectUtils.new("UIListLayout", { Parent = objects.SideTop, HorizontalAlignment = "Center", Padding = NewUDim(0, 1), VerticalAlignment = "Bottom" })

		RenderObjectUtils.new("UIPadding", {
			PaddingTop = UDim.new(0, 0),
			PaddingBottom = UDim.new(0, 0),
			Parent = objects.SideLeft,
			PaddingRight = UDim.new(0, 4),
			PaddingLeft = UDim.new(0, 0),
		})
		RenderObjectUtils.new("UIPadding", {
			PaddingTop = UDim.new(0, 0),
			PaddingBottom = UDim.new(0, 0),
			Parent = objects.SideRight,
			PaddingRight = UDim.new(0, 0),
			PaddingLeft = UDim.new(0, 4),
		})
		RenderObjectUtils.new("UIPadding", {
			PaddingTop = UDim.new(0, 2),
			PaddingBottom = UDim.new(0, 0),
			Parent = objects.SideBottom,
			PaddingRight = UDim.new(0, 0),
			PaddingLeft = UDim.new(0, 0),
		})
		RenderObjectUtils.new("UIPadding", {
			PaddingTop = UDim.new(0, 0),
			PaddingBottom = UDim.new(0, 3),
			Parent = objects.SideTop,
			PaddingRight = UDim.new(0, 0),
			PaddingLeft = UDim.new(0, 0),
		})

		objects.Name = RenderObjectUtils.new("TextLabel", {
			Text = player.Name,
			Font = 4,
			TextSize = 9,
			Parent = objects.SideTop,
		})
		objects.NameOutline = RenderObjectUtils.new("UIStroke", { Parent = objects.Name, Thickness = 1, Color = Color3FromRGB(0, 0, 0), LineJoinMode = "Miter" })
		GlobalState.Esp.FixTextPadding(objects.Name)

		objects.Distance = RenderObjectUtils.new("TextLabel", {
			Text = "0m",
			Font = 4,
			TextSize = 9,
			Parent = objects.SideBottom,
		})
		objects.DistanceOutline = RenderObjectUtils.new("UIStroke", { Parent = objects.Distance, Thickness = 1, Color = Color3FromRGB(0, 0, 0), LineJoinMode = "Miter" })
		GlobalState.Esp.FixTextPadding(objects.Distance)

		objects.Tool = RenderObjectUtils.new("TextLabel", {
			Text = "None",
			Font = 4,
			TextSize = 9,
			Parent = objects.SideBottom,
		})
		objects.ToolOutline = RenderObjectUtils.new("UIStroke", { Parent = objects.Tool, Thickness = 1, Color = Color3FromRGB(0, 0, 0), LineJoinMode = "Miter" })
		GlobalState.Esp.FixTextPadding(objects.Tool)
		objects.Cash = RenderObjectUtils.new("TextLabel", {
			Text = "$0",
			Font = 4,
			TextSize = 9,
			Parent = objects.SideRight,
			TextColor3 = Color3FromRGB(0, 180, 80),
		})
		objects.CashOutline = RenderObjectUtils.new("UIStroke", { Parent = objects.Cash, Thickness = 1, Color = Color3FromRGB(0, 0, 0), LineJoinMode = "Miter" })
		GlobalState.Esp.FixTextPadding(objects.Cash)

		objects.Zoom = RenderObjectUtils.new("TextLabel", {
			Text = "ZOOM",
			Font = 4,
			TextSize = 9,
			Parent = objects.SideRight,
			TextColor3 = Color3FromRGB(0, 180, 255),
		})
		objects.ZoomOutline = RenderObjectUtils.new("UIStroke", { Parent = objects.Zoom, Thickness = 1, Color = Color3FromRGB(0, 0, 0), LineJoinMode = "Miter" })
		GlobalState.Esp.FixTextPadding(objects.Zoom)

		objects.C4Flag = RenderObjectUtils.new("TextLabel", {
			Text = "C4",
			Font = 4,
			TextSize = 9,
			Parent = objects.SideRight,
			TextColor3 = Color3FromRGB(255, 50, 50),
		})
		objects.C4FlagOutline = RenderObjectUtils.new("UIStroke", { Parent = objects.C4Flag, Thickness = 1, Color = Color3FromRGB(0, 0, 0), LineJoinMode = "Miter" })
		GlobalState.Esp.FixTextPadding(objects.C4Flag)

		objects.HealthBarHolder = RenderObjectUtils.new("Frame", {
			Visible = true,
			Parent = objects.FrameHolder,
			BackgroundColor3 = Color3FromRGB(0, 0, 0),
			BackgroundTransparency = 0,
			Size = NewUDim2(0, 1, 1, 2),
			AnchorPoint = NewVector2(1, 0),
			Position = NewUDim2(0, -4, 0, -1),
			BorderSizePixel = 0,
			ZIndex = 4,
			ClipsDescendants = true,
		})
		objects.HealthBarFill = RenderObjectUtils.new("Frame", {
			Parent = objects.HealthBarHolder,
			BackgroundColor3 = Color3FromRGB(255, 255, 255),
			Size = NewUDim2(1, 0, 1, 0),
			AnchorPoint = NewVector2(0, 1),
			Position = NewUDim2(0, 0, 1, 0),
			BorderSizePixel = 0,
			ZIndex = 5,
		})
		objects.HealthBarOutline = RenderObjectUtils.new("UIStroke", {
			Parent = objects.HealthBarHolder,
			Thickness = 1,
			Color = Color3FromRGB(0, 0, 0),
			LineJoinMode = "Miter",
		})

		objects.HealthBarNumber = RenderObjectUtils.new("TextLabel", {
			Text = "100",
			Font = 4,
			TextSize = 9,
			Parent = objects.FrameHolder,
			TextColor3 = Color3FromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			ZIndex = 7,
			AnchorPoint = NewVector2(0.5, 1),
			Position = NewUDim2(0, 0, 0, 0),
			Size = UDim2FromOffset(30, 12),
			ClipsDescendants = false,
		})
		objects.HealthBarNumberOutline = RenderObjectUtils.new("UIStroke", {
			Parent = objects.HealthBarNumber,
			Thickness = 1,
			Color = Color3FromRGB(0, 0, 0),
			LineJoinMode = "Miter",
		})

		objects.HealthBarFillGradient = RenderObjectUtils.new("UIGradient", { Parent = objects.HealthBarFill, Rotation = 90, Color = CNew {
			ColorSequenceKeypoint.new(0, Color3FromRGB(0, 255, 0)),
			ColorSequenceKeypoint.new(1, Color3FromRGB(255, 0, 0)),
		} })

		objects.BoxFill = RenderObjectUtils.new("Frame", { Visible = false, Parent = objects.Box, Size = NewUDim2(1, 0, 1, 0), BackgroundTransparency = 0.5, ZIndex = -5 })
		objects.BoxFillGradient = RenderObjectUtils.new("UIGradient", { Parent = objects.BoxFill, Rotation = 90, Color = CNew {
			ColorSequenceKeypoint.new(0, Color3FromRGB(255, 255, 255)),
			ColorSequenceKeypoint.new(1, Color3FromRGB(0, 0, 0)),
		} })
		objects.Image = RenderObjectUtils.new("ImageLabel", {
			Visible = true,
			Parent = objects.FrameHolder,
			Size = NewUDim2(1, 0, 1, 0),
			Position = NewUDim2(0.5, 0, 0.5, 0),
			AnchorPoint = NewVector2(0.5, 0.5),
			BackgroundTransparency = 1,
			ZIndex = -3,
			Image = GlobalState.Assets.Images.Girls.Aiko,
		})

		entityData.Render = function()
			local character = player.Character
			if not character then
				if not entityData.IsFading then
					GlobalState.Esp.Hide(entityData)
					return
				end
			end

			if character then
				local rootPart = FindFirstChild(character, "HumanoidRootPart")
				local headPart = FindFirstChild(character, "Head")
				local humanoid = FindFirstChildOfClass(character, "Humanoid")
				if rootPart then
					entityData.LastCFrame = rootPart.CFrame
					entityData.LastRootSize = rootPart.Size
					entityData.LastCharacter = character
				end
				if headPart then
					entityData.LastHeadCFrame = headPart.CFrame
					entityData.LastHeadSize = headPart.Size
				end
				if humanoid then
					entityData.LastHipHeight = humanoid.HipHeight
				end
			end

			if not entityData.LastCFrame then GlobalState.Esp.Hide(entityData) return end
			local rootCFrame = entityData.LastCFrame

			local rootPosition = rootCFrame.Position
			local screenPoint, onScreen = WorldToViewportPoint(CurrentCamera, rootPosition)

			if entityData.IsFading then
				if onScreen then
					local x = MathFloor(screenPoint.X) - 1
					local y = MathFloor(screenPoint.Y) - 1
					local minX, minY, maxX, maxY = GlobalState.Esp.GetBoundingBoxes(rootCFrame, screenPoint, Flags["Esp/Scale"], false, entityData)
					local width = (maxX + 1) - (minX - 1)
					local height = (maxY + 1) - (minY - 1)
					RenderObjectUtils.SetRenderProperty(objects.FrameHolder, "Position", UDim2FromOffset(minX - 1, minY - 1))
					RenderObjectUtils.SetRenderProperty(objects.FrameHolder, "Size", UDim2FromOffset(width, height))
				else
					RenderObjectUtils.SetRenderProperty(objects.FrameHolder, "Visible", false)
				end
				return
			end

			local playerTeam = GlobalState.Utility.GetTeam(player)
			if playerTeam ~= entityData.LastTeam then
				GlobalState.Esp.UpdateElement(player)
			end
			entityData.LastTeam = playerTeam
			local localTeam = GlobalState.Utility.GetTeam(LocalPlayer)
			local isTeam = playerTeam == localTeam
			local category = isTeam and "Team" or "Enemy"

			local textCase = Flags["Esp/TextCases"]
			local textWrapper = Flags["Esp/TextWrapper"]

			if not Flags[category .. "/Enabled"] then GlobalState.Esp.Hide(entityData) return end

			local maxDistance = Flags["Esp/Distance"] or 500
			local distance = (CurrentCamera.CFrame.Position - rootPosition).Magnitude

			if distance > maxDistance then
				GlobalState.Esp.Hide(entityData)
				return
			end

			do
				local health, maxHealth = 0, 100
				if character then
					health, maxHealth = GlobalState.Esp.GetHealth(character)
				end
				local ratio = MathClamp(health / MathMax(maxHealth, 1), 0, 1)

				entityData.HealthRatio = LerpFunction(entityData.HealthRatio or ratio, ratio, Flags["Esp/HealthBarSpeed"] or 0.1)
				local currentRatio = entityData.HealthRatio

				if currentRatio <= 0.01 then
					if RenderObjectUtils.GetRenderProperty(objects.FrameHolder, "Visible") then
						entityData.IsFading = true
						entityData.HasFadedIn = false
						GlobalState.Esp.Fade(false, entityData)
						TaskDelay(1.1, function()
							entityData.IsFading = false
							entityData.LastCFrame = nil
							entityData.LastCharacter = nil
							entityData.HealthRatio = nil
							entityData.LastAlpha = nil
							entityData.LastTool = nil
							entityData.LastToolText = nil
							entityData.LastHealthBarSide = nil
							GlobalState.Esp.Hide(entityData)
							for _, obj in objects do
								if GlobalState.Esp.CanChangeTransparency(entityData, obj) then
									local transparencyProp = GlobalState.Utility.GetTransparency(obj)
									if transparencyProp then
										obj[transparencyProp] = 0
									end
								end
							end
						end)
					end
					return
				end

				if ratio == 1 and not entityData.HasFadedIn then
					entityData.HasFadedIn = true
					entityData.LastAlpha = nil
					for _, obj in objects do
						if GlobalState.Esp.CanChangeTransparency(entityData, obj) then
							local transparencyProp = GlobalState.Utility.GetTransparency(obj)
							if transparencyProp then
								obj[transparencyProp] = 1
							end
						end
					end
					GlobalState.Esp.Show(entityData)
					GlobalState.Esp.Fade(true, entityData)
				else
					GlobalState.Esp.Show(entityData)
				end
			end

			do
				local distanceLabel = objects.Distance
				if distanceLabel.Visible then
					local distText = MathFloor(distance) .. "m"
					if textWrapper == "[Brackets]" then
						distText = "[" .. distText .. "]"
					elseif textWrapper == "{Braces}" then
						distText = "{" .. distText .. "}"
					end
					if textCase == "UPPER" then
						distText = StringUpper(distText)
					elseif textCase == "lower" then
						distText = StringLower(distText)
					end
					if distanceLabel.Text ~= distText then
						distanceLabel.Text = distText
						GlobalState.Esp.FixTextPadding(distanceLabel)
					end
				end

				local toolLabel = objects.Tool
				if toolLabel.Visible and character then
					local toolName = GlobalState.Esp.GetEquipped(character)
					local displayName = toolName or "None"
					if entityData.LastTool ~= displayName then
						entityData.LastTool = displayName
						local formatted = displayName
						if textWrapper == "[Brackets]" then
							formatted = "[" .. formatted .. "]"
						elseif textWrapper == "{Braces}" then
							formatted = "{" .. formatted .. "}"
						end
						if textCase == "UPPER" then
							formatted = StringUpper(formatted)
						elseif textCase == "lower" then
							formatted = StringLower(formatted)
						end
						if toolLabel.Text ~= formatted then
							toolLabel.Text = formatted
							GlobalState.Esp.FixTextPadding(toolLabel)
						end
					end
				end

				do
					local cashLabel = objects.Cash
					if cashLabel.Visible then
						local ok, cash = pcall(function()
							return Players:FindFirstChild(player.Name) and Players[player.Name].Cash and Players[player.Name].Cash.Value or 0
						end)
						local cashText = "$" .. tostring(ok and cash or 0)
						if cashLabel.Text ~= cashText then
							cashLabel.Text = cashText
							GlobalState.Esp.FixTextPadding(cashLabel)
						end
					end

					local zoomLabel = objects.Zoom
					if Flags[category .. "/Zoom"] then
						local ok, isADS = pcall(function()
							local plrFolder = workspace:FindFirstChild(player.Name)
							local ads = plrFolder and plrFolder:FindFirstChild("ADS")
							return ads and (ads.Value == true) or false
						end)
						zoomLabel.Visible = ok and isADS or false
					end

					local c4FlagLabel = objects.C4Flag
					if Flags[category .. "/C4Flag"] then
						local ok, hasC4 = pcall(function()
							local plrFolder = workspace:FindFirstChild(player.Name)
							local backC4 = plrFolder and plrFolder:FindFirstChild("BackC4")
							if not backC4 then return false end
							local part = backC4:FindFirstChildWhichIsA("BasePart") or backC4
							return part.Transparency == 0
						end)
						c4FlagLabel.Visible = ok and hasC4 or false
					end
				end

				if Flags["Esp/FadeOnDistance"] then
					local fadeStart = maxDistance * 0.6
					local fadeAlpha = MathClamp((distance - fadeStart) / (maxDistance - fadeStart), 0, 1)
					GlobalState.Esp.SetTransparency(entityData, fadeAlpha)
				else
					GlobalState.Esp.SetTransparency(entityData, 0)
				end
			end

			local minX, minY, maxX, maxY = GlobalState.Esp.GetBoundingBoxes(rootCFrame, screenPoint, Flags["Esp/Scale"], false, entityData)

			if onScreen then
				local left = minX - 1
				local top = minY - 1
				local width = (maxX + 1) - left
				local height = (maxY + 1) - top

				entityData.IsOnScreen = true
				RenderObjectUtils.SetRenderProperty(objects.FrameHolder, "Position", UDim2FromOffset(left, top))
				RenderObjectUtils.SetRenderProperty(objects.FrameHolder, "Size", UDim2FromOffset(width, height))
			else
				entityData.IsOnScreen = false
				GlobalState.Esp.Hide(entityData)
				return
			end

			do
				local healthBarEnabled = Flags[category .. "/HealthBar"]
				RenderObjectUtils.SetRenderProperty(objects.HealthBarHolder, "Visible", healthBarEnabled)

				local side = "Left"
				local thickness = Flags["Esp/HealthBarThickness"] or 1
				local offset = 4
				local totalThickness = healthBarEnabled and (thickness + offset - 1) or 0

				if healthBarEnabled then
					local currentRatio = entityData.HealthRatio or 1
					local sideChanged = entityData.LastHealthBarSide ~= side
					entityData.LastHealthBarSide = side

					if sideChanged then
						if side then
							RenderObjectUtils.SetRenderProperty(objects.HealthBarHolder, "AnchorPoint", NewVector2(1, 0))
							RenderObjectUtils.SetRenderProperty(objects.HealthBarHolder, "Size", NewUDim2(0, thickness, 1, 2))
							RenderObjectUtils.SetRenderProperty(objects.HealthBarHolder, "Position", NewUDim2(0, -offset, 0, -1))
						end

						if side == "Left" or side == "Right" then
							RenderObjectUtils.SetRenderProperty(objects.HealthBarFill, "AnchorPoint", NewVector2(0, 1))
							RenderObjectUtils.SetRenderProperty(objects.HealthBarFill, "Position", NewUDim2(0, 0, 1, 0))
							RenderObjectUtils.SetRenderProperty(objects.HealthBarFillGradient, "Rotation", 90)
						else
							RenderObjectUtils.SetRenderProperty(objects.HealthBarFill, "AnchorPoint", NewVector2(0, 0))
							RenderObjectUtils.SetRenderProperty(objects.HealthBarFill, "Position", NewUDim2(0, 0, 0, 0))
							RenderObjectUtils.SetRenderProperty(objects.HealthBarFillGradient, "Rotation", 0)
						end
					end

					if side == "Left" or side == "Right" then
						RenderObjectUtils.SetRenderProperty(objects.HealthBarFill, "Size", NewUDim2(1, 0, currentRatio, 0))
					else
						RenderObjectUtils.SetRenderProperty(objects.HealthBarFill, "Size", NewUDim2(currentRatio, 0, 1, 0))
					end

					do
						local healthBarNumberLabel = objects.HealthBarNumber
						local showNumber = Flags[category .. "/HealthBarNumber"]
						RenderObjectUtils.SetRenderProperty(healthBarNumberLabel, "Visible", showNumber and healthBarEnabled)
						if showNumber then
							local displayNum = MathClamp(MathRound(currentRatio * 100), 0, 100)
							local numText = displayNum
							if healthBarNumberLabel.Text ~= numText then
								healthBarNumberLabel.Text = numText
							end

							local fontName = "SmallestPixel7"

							local posXOffset = 0
							local posYOffset = 0
							if fontName == "SmallestPixel7" then
								posXOffset = 5 - (Flags["Esp/HealthBarThickness"] - 1)
							end

							if side then
								RenderObjectUtils.SetRenderProperty(healthBarNumberLabel, "AnchorPoint", NewVector2(1, 0.5))
								RenderObjectUtils.SetRenderProperty(healthBarNumberLabel, "Position", NewUDim2(0, -(offset) + posXOffset, 1 - currentRatio, posYOffset))
							end
						end
					end
				end
			end

			GlobalState.Esp.UpdateChamsVisibility(player, entityData)
		end
		entityData.CharacterConn = player.CharacterAdded:Connect(function()
			TaskSpawn(function()
				local char = player.Character
				if not char then return end
				local root = char:WaitForChild("HumanoidRootPart", 5)
				local head = char:WaitForChild("Head", 5) or char:WaitForChild("FakeHead", 5)
				if root and head then
					task.wait(0.5)
					GlobalState.Esp.RemoveChams(entityData)
					GlobalState.Esp.DrawChams(player, entityData)
					GlobalState.Esp.UpdateElement(player)
				end
			end)
		end)
		GlobalState.Esp.UpdateElement(player)
	end

	GlobalState.Esp.RemoveEntity = function(player)
		local entity = GlobalState.Esp.Entities[player]
		if entity then
			if entity.Objects then
				for _, obj in entity.Objects do
					RenderObjectUtils.DestroyRenderObject(obj)
				end
			end
			GlobalState.Esp.RemoveChams(entity)
			if entity.CharacterConn then
				entity.CharacterConn:Disconnect()
				entity.CharacterConn = nil
			end
			GlobalState.Esp.Entities[player] = nil
		end
	end

	UILibrary:Connection(RunService.RenderStepped, function(deltaTime)
		for player, entity in GlobalState.Esp.Entities do
			if player and entity and entity.Render then
				entity.Render()
			end
		end
	end)
	for _, player in GetPlayers(Players) do
		GlobalState.Esp.AddEntity(player)
	end
	UILibrary:Connection(Players.PlayerAdded, function(player)
		GlobalState.Esp.AddEntity(player)
		player.CharacterAdded:Connect(function()
			GlobalState.Esp.UpdateElement(player)
		end)
	end)
	UILibrary:Connection(Players.PlayerRemoving, function(player)
		GlobalState.Esp.RemoveEntity(player)
	end)
	GlobalSignals.EspChanged:Connect(function(flag, value)
		for _, player in GetPlayers(Players) do
			local entity = GlobalState.Esp.Entities[player]
			if entity then
				GlobalState.Esp.UpdateElement(player)
				GlobalState.Esp.RemoveChams(entity)
				GlobalState.Esp.DrawChams(player, entity)
			end
		end
	end)
end

Toggles[SanitizeFlag("Visuals/CustomScopeUseZoom")]:OnChanged(function()
    if customScope.enabled then
        if not Flags["Visuals/CustomScopeUseZoom"] then
            if customScope.originalValues.FOV then
                workspace.Camera.FieldOfView = customScope.originalValues.FOV
            end
        end
    end
end)

Toggles[SanitizeFlag("Visuals/CustomScope")]:OnChanged(function()
    customScope.enabled = Flags["Visuals/CustomScope"]
    if customScope.enabled then
        saveOriginalValues()
        applyCustomScopeSettings()
        createScopeLines()
        startScopeRender()
    else
        stopScopeRender()
        destroyScopeLines()
        restoreOriginalValues()
    end
end)

local function NoLegAnimation()
    if (not Toggles[SanitizeFlag("Misc/NoLegAnim")].Value or not IsAlive(localPlayer)) then
        legAnimDone = false
        return
    end
    if legAnimDone then return end
    local character = localPlayer.Character
    if not character then return end
    local humanoid = character:FindFirstChild("Humanoid")
    if not humanoid then return end
    humanoid.AnimationPlayed:Connect(function(track)
        if not Toggles[SanitizeFlag("Misc/NoLegAnim")].Value then return end
        local animName = track.Name:lower()
        if (animName:find("walk") or animName:find("run") or animName:find("leg") or animName:find("jump") or animName:find("fall") or animName:find("climb")) then
            track:Stop(0)
        end
    end)
    for _, track in pairs(humanoid:GetPlayingAnimationTracks()) do
        local animName = track.Name:lower()
        if (animName:find("walk") or animName:find("run") or animName:find("leg") or animName:find("jump") or animName:find("fall") or animName:find("climb")) then
            track:Stop(0)
        end
    end
    legAnimDone = true
end

local wallGlideActive = false
local GLIDE_SPEED = 37

local function PixelSurf()
    if not Flags["Misc/PixelSurf"] then
        wallGlideActive = false
        return
    end
    local char = localPlayer.Character
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart")
    local humanoid = char:FindFirstChild("Humanoid")
    if not root or not humanoid then return end

    local inAir = humanoid.FloorMaterial == Enum.Material.Air
    if not inAir then
        wallGlideActive = false
        return
    end

    local directions = {
        Vector3.new(1,0,0), Vector3.new(-1,0,0),
        Vector3.new(0,0,1), Vector3.new(0,0,-1)
    }

    local hitWall = false
    local wallNormal = nil

    for _, dir in ipairs(directions) do
        local ray = Ray.new(root.Position, dir * 2.5)
        local hit, pos, normal = Workspace:FindPartOnRayWithIgnoreList(ray, {char})
        if hit then
            local lookDir = CurrentCamera.CFrame.LookVector
            local flatLook = Vector3.new(lookDir.X, 0, lookDir.Z).Unit
            local cornerCheck = Ray.new(root.Position + flatLook * 1.5, dir * 2.5)
            local cornerHit = Workspace:FindPartOnRayWithIgnoreList(cornerCheck, {char})
            if not cornerHit then
                hitWall = false
                break
            end
            hitWall = true
            wallNormal = normal
            break
        end
    end

    if hitWall and wallNormal then
        wallGlideActive = true
        local lookDir = CurrentCamera.CFrame.LookVector
        local glideDir = Vector3.new(lookDir.X, 0, lookDir.Z).Unit
        root.Velocity = Vector3.new(glideDir.X * GLIDE_SPEED, 0, glideDir.Z * GLIDE_SPEED)
    else
        wallGlideActive = false
    end
end

localPlayer.CharacterAdded:Connect(function()
    legAnimDone = false
end)

localPlayer.CharacterAdded:Connect(function()
    if customScope.enabled then
        task.wait(0.5)
        saveOriginalValues()
        applyCustomScopeSettings()
        createScopeLines()
        startScopeRender()
    end
end)

do
	local MiscFunctions = GlobalState.Misc.Functions
	local Constants = GlobalState.Constants
	local GarbageCollector = GlobalState.GarbageCollector
	local ClientScript = GlobalState.ClientScript

	MiscFunctions.Movement = function()
		local character = LocalPlayer.Character
		if not character then return end
		local rootPart = FindFirstChild(character, "HumanoidRootPart")
		local humanoid = FindFirstChildOfClass(character, "Humanoid")
		if not rootPart or not humanoid then return end

		if IsKeyDown(UserInputService, "Space") and Flags["Misc/AutoJump"] then
			humanoid.Jump = true
		end

		if Flags["Misc/Speed"] then
			local targetSpeed = Flags["Misc/SpeedValue"] or 30
			
			if Flags["Misc/OverrideSpeed"] and Flags["Misc/OverrideSpeedKey"].Active then
				targetSpeed = Flags["Misc/OverrideSpeedValue"] or 30
			end

			local cam = CurrentCamera.CFrame
			local lookVector = NewVector3(cam.LookVector.X, 0, cam.LookVector.Z).Unit
			local rightVector = NewVector3(cam.RightVector.X, 0, cam.RightVector.Z).Unit

			local moveDirection = NewVector3()
			if IsKeyDown(UserInputService, "W") then moveDirection = moveDirection + lookVector end
			if IsKeyDown(UserInputService, "S") then moveDirection = moveDirection - lookVector end
			if IsKeyDown(UserInputService, "A") then moveDirection = moveDirection - rightVector end
			if IsKeyDown(UserInputService, "D") then moveDirection = moveDirection + rightVector end

			local bv = rootPart:FindFirstChild("SpeedBodyVelocity")
			if not bv then
				bv = Instance.new("BodyVelocity")
				bv.Name = "SpeedBodyVelocity"
				bv.MaxForce = NewVector3(10000, 0, 10000)
				bv.P = 10000
				bv.Parent = rootPart
			end

			if moveDirection.Magnitude > 0.1 then
				moveDirection = moveDirection.Unit
				bv.Velocity = NewVector3(
					moveDirection.X * targetSpeed,
					0,
					moveDirection.Z * targetSpeed
				)
			else
				bv.Velocity = NewVector3(0, 0, 0)
			end
		else
			local bv = rootPart:FindFirstChild("SpeedBodyVelocity")
			if bv then bv:Destroy() end
		end
	end

	MiscFunctions.HitSound = function(hitboxName)
		if hitboxName == "Head" or hitboxName == "HeadHB" then
			if not Flags["Misc/HeadHitSound"] then return end
			local sound = RenderObjectUtils.new("Sound", {
				SoundId = "rbxassetid://" .. Constants.Sounds[Flags["Misc/HeadHitSoundType"]],
				Parent = CurrentCamera,
				Volume = Flags["Misc/HeadHitSoundVolume"],
				PlayOnRemove = true,
			})
			RenderObjectUtils.DestroyRenderObject(sound)
		else
			if not Constants.Hitboxes[hitboxName] then return end
			if not Flags["Misc/HitSound"] then return end
			local sound = RenderObjectUtils.new("Sound", {
				SoundId = "rbxassetid://" .. Constants.Sounds[Flags["Misc/HitSoundType"]],
				Parent = CurrentCamera,
				Volume = Flags["Misc/HitSoundVolume"],
				PlayOnRemove = true,
			})
			RenderObjectUtils.DestroyRenderObject(sound)
		end
	end

	MiscFunctions.KillSound = function()
		if not Flags["Misc/KillSound"] then return end
		local sound = RenderObjectUtils.new("Sound", {
			SoundId = "rbxassetid://" .. Constants.Sounds[Flags["Misc/KillSoundType"]],
			Parent = CurrentCamera,
			Volume = Flags["Misc/KillSoundVolume"],
			PlayOnRemove = true,
		})
		RenderObjectUtils.DestroyRenderObject(sound)
	end

	MiscFunctions.ApplyGunModification = function()
		local currentGun = ClientScript.fgun
		local baseGunStats = GlobalState.Utility.GetWeaponReference(FindFirstChild(WeaponFolder.Guns, currentGun.Name))
		if currentGun == "none" then return end

		if Flags["Misc/GunMod"] then
			if Flags["Misc/GunModFireRate"] then
				currentGun.FireRate.Value = Flags["Misc/GunModFireRateValue"]
			else
				if baseGunStats then
					currentGun.FireRate.Value = baseGunStats.FireRate.Value
				end
			end
		else
			if baseGunStats then
				currentGun.FireRate.Value = baseGunStats.FireRate.Value
			end
		end
	end
end

do
    local ResCamera = workspace.CurrentCamera
    RunService.RenderStepped:Connect(function()
        if Flags["Misc/ResolutionEnabled"] then
            local res = (Flags["Misc/ResolutionValue"] or 65) / 100
            ResCamera.CFrame = ResCamera.CFrame * CFrame.new(0, 0, 0, 1, 0, 0, 0, res, 0, 0, 0, 1)
        end
    end)
end

local function SaveWeaponValues()
    local weapons = {"AK47","AUG","AWP","Bizon","CZ","DesertEagle","DualBerettas","Famas","FiveSeven","G3SG1","Galil","Glock","M249","M4A1","M4A4","MAC10","Mag7","MP7","MP7-SD","MP9","Negev","Nova","P2000","P250","P90","R8","SG","SawedOff","Scout","Tec9","UMP","USP","XM"}
    
    for _, weaponName in ipairs(weapons) do
        local weapon = ReplicatedStorage.Weapons:FindFirstChild(weaponName)
        if weapon and not originalWeaponValues[weaponName] then
            originalWeaponValues[weaponName] = {}
            local spread = weapon:FindFirstChild("Spread")
            if spread then
                originalWeaponValues[weaponName].spread = spread.Value
                for _, child in ipairs(spread:GetChildren()) do
                    if child:IsA("NumberValue") and child.Name ~= "Recoil" then
                        originalWeaponValues[weaponName][child.Name] = child.Value
                    end
                end
            end
            local recoil = weapon:FindFirstChild("Spread") and weapon.Spread:FindFirstChild("Recoil")
            if recoil then
                originalWeaponValues[weaponName].recoil = recoil.Value
            end
        end
    end
end

local function ApplyNoRecoil()
    local weapons = {
        "AK47","AUG","AWP","Bizon","CZ","DesertEagle","DualBerettas","Famas","FiveSeven",
        "G3SG1","Galil","Glock","M249","M4A1","M4A4","MAC10","Mag7","MP7","MP7-SD","MP9",
        "Negev","Nova","P2000","P250","P90","R8","SG","SawedOff","Scout","Tec9","UMP","USP","XM"
    }

    for _, weaponName in ipairs(weapons) do
        local weapon = game:GetService("ReplicatedStorage").Weapons:FindFirstChild(weaponName)
        if weapon then
            if not originalWeaponValues[weaponName] then
                originalWeaponValues[weaponName] = {}
                local recoil = weapon:FindFirstChild("Spread") and weapon.Spread:FindFirstChild("Recoil")
                if recoil then
                    originalWeaponValues[weaponName].recoil = recoil.Value
                end
            end

            local recoil = weapon:FindFirstChild("Spread") and weapon.Spread:FindFirstChild("Recoil")
            if recoil then
                if weaponMods.no_recoil then
                    recoil.Value = 0
                else
                    recoil.Value = originalWeaponValues[weaponName].recoil or recoil.Value
                end
            end
        end
    end
end

local function ApplyNoSpread()
    local weapons = {
        "AK47","AUG","AWP","Bizon","CZ","DesertEagle","DualBerettas","Famas","FiveSeven",
        "G3SG1","Galil","Glock","M249","M4A1","M4A4","MAC10","Mag7","MP7","MP7-SD","MP9",
        "Negev","Nova","P2000","P250","P90","R8","SG","SawedOff","Scout","Tec9","UMP","USP","XM"
    }

    for _, weaponName in ipairs(weapons) do
        local weapon = game:GetService("ReplicatedStorage").Weapons:FindFirstChild(weaponName)
        if weapon then
            if not originalWeaponValues[weaponName] then
                originalWeaponValues[weaponName] = {}
                local spread = weapon:FindFirstChild("Spread")
                if spread then
                    originalWeaponValues[weaponName].spread = spread.Value
                    for _, child in ipairs(spread:GetChildren()) do
                        if (child:IsA("NumberValue") and (child.Name ~= "Recoil")) then
                            originalWeaponValues[weaponName][child.Name] = child.Value
                        end
                    end
                end
            end

            local spread = weapon:FindFirstChild("Spread")
            if spread then
                if weaponMods.no_spread then
                    spread.Value = 0
                    for _, child in ipairs(spread:GetChildren()) do
                        if (child:IsA("NumberValue") and (child.Name ~= "Recoil")) then
                            child.Value = 0
                        end
                    end
                else
                    spread.Value = originalWeaponValues[weaponName].spread or spread.Value
                    for _, child in ipairs(spread:GetChildren()) do
                        if (child:IsA("NumberValue") and (child.Name ~= "Recoil")) then
                            child.Value = originalWeaponValues[weaponName][child.Name] or child.Value
                        end
                    end
                end
            end
        end
    end
end

do
	local RageBotData = GlobalState.RageBot
	local TimeOffsetData = RageBotData.TimeOffset
	local TimeOffset2Data = RageBotData.TimeOffset2
	local RageBotFunctions = RageBotData.Functions

	local MaterialMultipliers = GlobalState.Constants.MaterialMultipliers
	local RayIgnorePart = GlobalState.Constants.RayIgnore
	local Status = GlobalState.Constants.Status
	local ClientScript = GlobalState.ClientScript
	local HitPartRemote = RemoteEvents.ToUse.HitPart
	local TimerObject = Status.Timer

	RageBotFunctions.HitPart = function(targetPlayer, hitboxName, gunName, damageMultiplier)
		if not LocalPlayer.Character then return end
		if not targetPlayer.Character then return end
		local gun = FindFirstChild(LocalPlayer.Character, "Gun")
		local targetPart = FindFirstChild(targetPlayer.Character, hitboxName or "Head")
		local isJumpingOrFalling = (GlobalState.Utility.IsJumpingOrFalling() or false)
		if not targetPart then return end
		local encodedPos = GlobalState.Utility.EncodePosition(targetPart.Position)

		HitPartRemote:FireServer(
			targetPart,
			encodedPos,
			gunName,
			0,
			gun,
			nil,
			damageMultiplier or 1,
			0,
			true,
			CurrentCamera.CFrame.Position,
			GetServerTimeNow(Workspace),
			ZeroVector3,
			false,
			false,
			false,
			isJumpingOrFalling,
			true,
			GlobalState.Utility.GetNilsForRemote("HitPart")
		)
	end

	RageBotFunctions.GetEnemies = function()
		local cache = GlobalConfig.RageBotCache
		local now = Tick()
		if now - cache.LastEnemyUpdate < 0.1 then
			return cache.Enemies
		end
		cache.LastEnemyUpdate = now

		local enemies = cache.Enemies
		TableClear(enemies)
		local localTeam = GlobalState.Utility.GetTeam(LocalPlayer)
		local entities = cache.Entities

		for _, player in GetPlayers(Players) do
			if player == LocalPlayer then continue end

			local playerStatus = FindFirstChild(player, "Status")
			if not playerStatus or playerStatus.Alive.Value ~= true then
				entities[player] = nil
				continue
			end

			local playerTeam = GlobalState.Utility.GetTeam(player)
			if playerTeam ~= localTeam then
				TableInsert(enemies, player)

				if not entities[player] or entities[player].Character ~= player.Character or not entities[player].Root then
					local character = player.Character
					if character then
						local head = FindFirstChild(character, "Head")
						local root = FindFirstChild(character, "HumanoidRootPart")
						if head and root then
							entities[player] = {
								Character = character,
								Head = head,
								Root = root,
							}
						else
							entities[player] = nil
						end
					end
				end
			end
		end

		return enemies
	end

	RageBotFunctions.FakeShoot = function()
		local arms = FindFirstChild(CurrentCamera, "Arms")
		local currentGun = ClientScript.fgun
		if not arms or currentGun == "none" then return end

		local fireAnim = FindFirstChild(arms, "fire")
		if not fireAnim then return end

		local animController = FindFirstChildOfClass(arms, "AnimationController")
		if animController then
			animController:LoadAnimation(fireAnim):Play()
		end

		local flash = FindFirstChild(arms, "Flash")
		ClientScript.createparticle("muzzle", flash)

		local gunModel = currentGun.Model
		local shootSound = FindFirstChild(gunModel, "SShoot") or FindFirstChild(gunModel, "Shoot") or FindFirstChild(gunModel, "Shoot1")
		if shootSound then
			local sound = RenderObjectUtils.new("Sound", {
				SoundId = shootSound.Value,
				Parent = CurrentCamera,
				Volume = 0.3,
				PlayOnRemove = true,
			})
			RenderObjectUtils.DestroyRenderObject(sound)
		end

		local shootRemote = FindFirstChild(LocalPlayer.Character.Gun, "Shoot", true)
		if shootRemote then
			RemoteEvents.ToUse.ReplicateSound:FireServer(
				shootRemote,
				nil,
				1,
				Flags["Rage/FakeShootType"] == "Normal" and 1 or Flags["Rage/FakeShootType"] == "Loud" and HUGE_VALUE or Flags["Rage/FakeShootType"] == "Silent" and 0.1 or 1,
				nil
			)
		end
		RemoteEvents.ToUse.ReplicateAnimations:FireServer("Fire")
	end

	RageBotFunctions.GetMultiPoints = function(part, scale)
		local cframe = part.CFrame
		local offset = scale * 0.15

		return {
			cframe.Position,
			(cframe * NewCFrame(offset, 0, 0)).Position,
			(cframe * NewCFrame(-offset, 0, 0)).Position,
			(cframe * NewCFrame(0, offset, 0)).Position,
			(cframe * NewCFrame(0, -offset, 0)).Position,
			(cframe * NewCFrame(0, 0, offset)).Position,
			(cframe * NewCFrame(0, 0, -offset)).Position,
		}
	end

	RageBotFunctions.ScanOrigin = function(targetPart, maxScans)
		local localCharacter = LocalPlayer.Character
		if not localCharacter then return nil, nil end
		local localHead = FindFirstChild(localCharacter, "Head")
		if not localHead then return nil, nil end

		local localHeadPos = localHead.Position
		local targetPos = targetPart.Position
		local targetPlayer = GetPlayerFromCharacter(Players, targetPart.Parent)
		local cache = GlobalConfig.RageBotCache

		if targetPlayer and cache.OriginCache[targetPlayer] then
			local originData = cache.OriginCache[targetPlayer]
			if Tick() - originData.Time < 0.5 then
				local originToTarget = targetPos - originData.Origin
				cache.RaycastParams.FilterDescendantsInstances = { localCharacter, CurrentCamera }
				local rayResult = WorkspaceRaycast(Workspace, originData.Origin, originToTarget, cache.RaycastParams)
				if rayResult and IsDescendantOf(rayResult.Instance, targetPart.Parent) then
					return originData.Origin, targetPos
				end
			end
		end

		cache.RaycastParams.FilterDescendantsInstances = { localCharacter, CurrentCamera }
		local localToTarget = targetPos - localHeadPos
		local rayResult = WorkspaceRaycast(Workspace, localHeadPos, localToTarget, cache.RaycastParams)

		if rayResult and IsDescendantOf(rayResult.Instance, targetPart.Parent) then
			return localHeadPos, targetPos
		end

		if Flags["Rage/MultiPoint"] then
			local multiPoints = RageBotFunctions.GetMultiPoints(targetPart, Flags["Rage/MultiPointScale"] or 1)
			for i = 2, 7 do
				localToTarget = multiPoints[i] - localHeadPos
				rayResult = WorkspaceRaycast(Workspace, localHeadPos, localToTarget, cache.RaycastParams)
				if rayResult and IsDescendantOf(rayResult.Instance, targetPart.Parent) then
					return localHeadPos, multiPoints[i]
				end
			end
		end

		local scanRadius = Flags["Rage/OriginScanRadius"] or 6
		local numScans = MathMin(maxScans or 12, 20)
		local angleStep = MathRad(360 / numScans)

		for i = 1, numScans do
			local angle = angleStep * i
			local originPos = localHeadPos + NewVector3(MathCos(angle) * scanRadius, 0, MathSin(angle) * scanRadius)
			local verticalOffsets = { 0, 4, -4 }
			for j = 1, 3 do
				local origin = originPos + NewVector3(0, verticalOffsets[j], 0)
				localToTarget = targetPos - origin

				GlobalConfig.RaycastParameter.FilterDescendantsInstances = { localCharacter, CurrentCamera }
				local rayToOrigin = WorkspaceRaycast(Workspace, localHeadPos, origin - localHeadPos, GlobalConfig.RaycastParameter)

				if not rayToOrigin then
					rayResult = WorkspaceRaycast(Workspace, origin, localToTarget, cache.RaycastParams)
					if rayResult and IsDescendantOf(rayResult.Instance, targetPart.Parent) then
						if targetPlayer then cache.OriginCache[targetPlayer] = { Origin = origin, Time = Tick() } end
						return origin, targetPos
					end
				end
			end
		end

		return nil, nil
	end

	RageBotFunctions.FindPoint = function(targetPart)
		local cameraPos = CurrentCamera.CFrame.Position
		local cache = GlobalConfig.RageBotCache
		cache.RaycastParams.FilterDescendantsInstances = { LocalPlayer.Character, CurrentCamera }
		local direction = targetPart.Position - cameraPos
		local rayResult = WorkspaceRaycast(Workspace, cameraPos, direction, cache.RaycastParams)

		if rayResult and IsDescendantOf(rayResult.Instance, targetPart.Parent) then
			return targetPart.Position
		end

		if Flags["Rage/MultiPoint"] then
			local multiPoints = RageBotFunctions.GetMultiPoints(targetPart, Flags["Rage/MultiPointScale"] or 1)
			for i = 2, 7 do
				local point = multiPoints[i]
				direction = point - cameraPos
				rayResult = WorkspaceRaycast(Workspace, cameraPos, direction, cache.RaycastParams)
				if rayResult and IsDescendantOf(rayResult.Instance, targetPart.Parent) then
					return point
				end
			end
		end
		return nil
	end

	RageBotFunctions.WallBang = function(origin, target, penetration, maxWalls)
		local cache = GlobalConfig.RageBotCache
		penetration = penetration * 0.01

		if Flags["Rage/AutoWall"] == false then
			local direction = target - origin
			cache.RaycastParams.FilterDescendantsInstances = { LocalPlayer.Character, CurrentCamera }
			local rayResult = WorkspaceRaycast(Workspace, origin, direction, cache.RaycastParams)

			if not rayResult or (rayResult.Instance and rayResult.Instance.Parent and FindFirstChild(rayResult.Instance.Parent, "Humanoid")) then
				return true, 1, 0
			end
			return false, 0, 0
		end

		local direction = target - origin
		local dirUnit = direction.Unit
		local totalThickness = 0
		local wallsHit = 0
		local remainingDamage = 1
		local currentOrigin = origin
		local ignoreList = { LocalPlayer.Character, CurrentCamera }
		cache.RaycastParams.FilterDescendantsInstances = ignoreList

		while true do
			local rayResult = WorkspaceRaycast(Workspace, currentOrigin, target - currentOrigin, cache.RaycastParams)
			if not rayResult then
				return true, remainingDamage, wallsHit
			end

			local hitInstance = rayResult.Instance
			local hitPosition = rayResult.Position

			if hitInstance.Parent and FindFirstChild(hitInstance.Parent, "Humanoid") then
				return true, remainingDamage, wallsHit
			end

			local materialMultiplier = MaterialMultipliers[hitInstance.Material] or 1

			if hitInstance.Name == "Grate" then materialMultiplier = 0.1 end
			if hitInstance.Name == "nowallbang" then return false, 0, wallsHit end

			if hitInstance.Transparency == 1 or not hitInstance.CanCollide or hitInstance.Name == "Glass" or hitInstance.Name == "Cardboard"
				or (RayIgnorePart and IsDescendantOf(hitInstance, RayIgnorePart)) or (Debris and IsDescendantOf(hitInstance, Debris)) then
				materialMultiplier = 0
			end

			local parent = hitInstance.Parent
			if parent then
				if parent.Name == "Hitboxes" then
					materialMultiplier = 0
				elseif FindFirstChild(parent, "Humanoid") then
					materialMultiplier = 0.1
				end
			end

			local partModifier = FindFirstChild(hitInstance, "PartModifier")
			if partModifier then materialMultiplier = partModifier.Value end

			if materialMultiplier > 0 then
				local rayParams = RaycastParams.new()
				rayParams.FilterType = Enum.RaycastFilterType.Include
				rayParams.FilterDescendantsInstances = { hitInstance }

				local backDist = 20
				local backRay = WorkspaceRaycast(Workspace, hitPosition + dirUnit * backDist, dirUnit * -backDist, rayParams)

				local exitPoint
				if backRay then
					exitPoint = backRay.Position
				else
					return false, 0, wallsHit
				end

				totalThickness = totalThickness + (exitPoint - hitPosition).Magnitude * materialMultiplier
				remainingDamage = 1 - totalThickness / penetration
				wallsHit = wallsHit + 1
				currentOrigin = exitPoint + dirUnit * 0.01
			else
				currentOrigin = hitPosition + dirUnit * 0.01
			end

			if totalThickness >= penetration or wallsHit >= maxWalls or remainingDamage <= 0 then
				return false, 0, wallsHit
			end

			TableInsert(ignoreList, (parent and parent.Name == "Hitboxes") and parent or hitInstance)
			cache.RaycastParams.FilterDescendantsInstances = ignoreList
		end
	end

	RageBotFunctions.Think = function()
		if not Flags["Rage/Enabled"] then
			GlobalState.RageBot.Active = nil
			return
		end

		local now = Tick()
		local cache = GlobalConfig.RageBotCache

		if now - cache.LastThink < (1.6666666666666665E-2) then return end
		cache.LastThink = now

		if now - cache.LastCleanup > 1 then
			TableClear(cache.RaycastResults)
			cache.LastCleanup = now
		end

		local active = GlobalState.RageBot.Active
		if active ~= nil then
			local target = active.Player
			local targetChar = target.Character
			local status = FindFirstChild(target, "Status")
			if not target or not targetChar or not status or status.Alive.Value ~= true or ClientScript.fgun == "none" or ClientScript.fgun.Name == "C4" or FindFirstChild(ClientScript.fgun, "Grenade") or FindFirstChild(ClientScript.fgun, "Stab") or FindFirstChild(targetChar, "ForceField") or LocalPlayer.Status.Alive.Value == false then
				GlobalState.RageBot.Active = nil
			end
		end

		local fireDelay = Flags["Rage/RapidFire"] and Flags["Rage/RapidFireTick"] or (ClientScript.fgun ~= "none" and ClientScript.fgun.FireRate.Value) or 0.1
		if now - GlobalState.RageBot.LastRageBotFired < fireDelay then return end
		if LocalPlayer.Status.Alive.Value == false then return end

		local enemies = RageBotFunctions.GetEnemies()

		local forwardRecords = GlobalState.ForwardTrack.Records
		local backRecords = GlobalState.Backtrack.Records
		local entities = cache.Entities

		for playerName, record in forwardRecords do
			local player = Players:FindFirstChild(playerName)
			if not player or not entities[player] then
				forwardRecords[playerName] = nil
			end
		end

		for playerName, record in backRecords do
			local player = Players:FindFirstChild(playerName)
			if not player or not entities[player] then
				backRecords[playerName] = nil
			end
		end

		if #enemies == 0 then
			GlobalState.RageBot.Active = nil
			return
		end

		local cameraPos = CurrentCamera.CFrame.Position
		local maxPenetration = Flags["Rage/AutoWall"] == true and Flags["Rage/AutoWallMaxWalls"] * 1000 or 4
		local gunPenetration = (ClientScript.fgun ~= "none" and ClientScript.fgun.Penetration.Value) or 100

		if Flags["Rage/FTrack"] then
			local fTrackRecords = GlobalState.ForwardTrack.Records
			local fTrackTime = (Flags["Rage/FTrackTime"] or 100) / 1000
			for i = 1, #enemies do
				local enemy = enemies[i]
				local data = entities[enemy]
				if not data then continue end
				local head = data.Head
				local root = data.Root
				local velocity = root.Velocity
				local time = fTrackTime
				if Flags["Rage/FTrackAdaptive"] then time = time * (1 + ((head.Position - cameraPos).Magnitude / 100)) end
				local predictedPos = head.Position + (velocity * time)

				GlobalConfig.RaycastParameter.FilterDescendantsInstances = { Character, CurrentCamera, enemy.Character }
				local rayResult = WorkspaceRaycast(Workspace, head.Position, predictedPos - head.Position, GlobalConfig.RaycastParameter)
				if rayResult then
					predictedPos = rayResult.Position - (velocity.Unit * 0.1)
				end

				if not fTrackRecords[enemy.Name] then fTrackRecords[enemy.Name] = {} end
				fTrackRecords[enemy.Name][1] = { Position = predictedPos, Time = now + fTrackTime }
			end
		end

		if Flags["Rage/Backtrack"] then
			local backRecords = GlobalState.Backtrack.Records
			local backTime = (Flags["Rage/BacktrackTime"] or 200) / 1000
			for i = 1, #enemies do
				local enemy = enemies[i]
				local data = entities[enemy]
				if not data then continue end
				if not backRecords[enemy.Name] then backRecords[enemy.Name] = {} end
				local records = backRecords[enemy.Name]
				TableInsert(records, 1, { Position = data.Head.Position, Time = now })
				if #records > 1 and now - records[#records].Time > backTime then TableRemove(records, #records) end
			end
		end

		if Flags["Rage/TimeOffset"] and Status.Preparation.Value == true then
			local timerValue = TimerObject.Value
			local currentTime = OsClock()

			if timerValue ~= TimeOffsetData.LastValue then
				TimeOffsetData.LastValue = timerValue
				TimeOffsetData.LastChange = currentTime
				RageBotData.CanRage = false
			end

			local elapsed = currentTime - TimeOffsetData.LastChange
			local remaining = (timerValue * 1000) - (elapsed * 1000)

			if remaining < (timerValue - 1) * 1000 then
				remaining = (timerValue - 1) * 1000
			end

			local floorRemaining = math.floor(remaining)
			if not RageBotData.CanRage and floorRemaining <= (Flags["Rage/TimeOffsetValue"] or 30) then
				RageBotData.CanRage = true
			end
		else
			RageBotData.CanRage = true
		end

		if Flags["Rage/PrepCheck"] and Status.Preparation.Value then
			GlobalState.RageBot.Active = nil
			return
		end
		if Flags["Rage/TimeOffset"] and RageBotData.CanRage == false then
			GlobalState.RageBot.Active = nil
			return
		end

		if ClientScript.fgun == "none" then
			GlobalState.RageBot.Active = nil
			return
		end
		if ClientScript.fgun.Name == "C4" or FindFirstChild(ClientScript.fgun, "Stab") then
			GlobalState.RageBot.Active = nil
			return
		end
		if FindFirstChild(ClientScript.fgun, "Grenade") then
			GlobalState.RageBot.Active = nil
			return
		end

		local fireRate = Flags["Rage/RapidFire"] and Flags["Rage/RapidFireTick"] or ClientScript.fgun.FireRate.Value or 0.1
		local time = Tick()

		local autoWallMaxWalls = Flags["Rage/AutoWall"] == true and Flags["Rage/AutoWallMaxWalls"] * 1000 or 4
		local penValue = ClientScript.fgun.Penetration.Value
		local camPos = CurrentCamera.CFrame.Position

		do
			if #enemies > 1 then
				TableSort(enemies, function(a, b)
					local dataA = entities[a]
					local dataB = entities[b]
					if not dataA or not dataB or not dataA.Root or not dataB.Root then return false end
					return (dataA.Root.Position - camPos).Magnitude < (dataB.Root.Position - camPos).Magnitude
				end)
			end

			local foundTarget = false
			local rayResultsCache = cache.RaycastResults

			for i = 1, #enemies do
				local enemy = enemies[i]
				local data = entities[enemy]
				if not data then continue end

				local character = data.Character
				local head = data.Head
				if not character or not head or FindFirstChildOfClass(character, "ForceField") then continue end

				local shootPoint, shootOrigin
				local canShoot = false
				local damage = 0

				local cameraCF = FindFirstChild(enemy, "CameraCF")
				if cameraCF and IsA(cameraCF, "CFrameValue") and Flags["Rage/CameraResolver"] then
					local camTarget = cameraCF.Value.Position
					local success, dmg, walls = RageBotFunctions.WallBang(camPos, camTarget, penValue, autoWallMaxWalls)

					if success then
						shootPoint = camTarget
						shootOrigin = camPos
						damage = dmg or 1
						canShoot = true
					end
				end
				if not canShoot then
					if Flags["Rage/OriginScan"] then
						shootOrigin, shootPoint = RageBotFunctions.ScanOrigin(head, Flags["Rage/OriginMaxScan"] or 20)
					else
						if rayResultsCache[enemy] then
							shootPoint = rayResultsCache[enemy]
							shootOrigin = camPos
							canShoot = true
						else
							shootPoint = RageBotFunctions.FindPoint(head)
							if shootPoint then
								shootOrigin = camPos
								rayResultsCache[enemy] = shootPoint
							end
						end
					end

					if shootPoint and not canShoot then
						local origin = shootOrigin or camPos
						local success, dmg, walls = RageBotFunctions.WallBang(origin, shootPoint, penValue, autoWallMaxWalls)

						if success then
							damage = dmg or 1
							canShoot = true
						end
					end
				end

				if not canShoot and Flags["Rage/FTrack"] then
					local fRecords = GlobalState.ForwardTrack.Records
					local fData = fRecords[enemy.Name]
					if fData and fData[1] then
						local fPos = fData[1].Position
						local success, dmg, walls = RageBotFunctions.WallBang(camPos, fPos, penValue, autoWallMaxWalls)

						if success then
							shootPoint = fPos
							shootOrigin = camPos
							damage = dmg or 1
							canShoot = true
						end
					end
				end

				if not canShoot and Flags["Rage/Backtrack"] then
					local bRecords = GlobalState.Backtrack.Records
					local bData = bRecords[enemy.Name]
					if bData then
						local bPos = bData[#bData]
						if bPos then
							local pos = bPos.Position
							local success, dmg, walls = RageBotFunctions.WallBang(camPos, pos, penValue, autoWallMaxWalls)

							if success then
								shootPoint = pos
								shootOrigin = camPos
								damage = dmg or 1
								canShoot = true
							end
						end
					end
				end

				if canShoot then
					GlobalState.RageBot.Active = {
						Player = enemy,
						Character = character,
						Point = shootPoint,
						Origin = shootOrigin,
					}

					local finalDamage = Flags["Rage/NoAutoWallDmgReduction"] and 1 or damage
					RageBotFunctions.HitPart(enemy, "Head", ClientScript.fgun.Name, finalDamage)

					GlobalEvents.RageBot.Fired:Fire { Player = enemy, Position = shootPoint, Origin = shootOrigin, Damage = finalDamage }

					GlobalState.RageBot.LastRageBotFired = time
					RageBotFunctions.FakeShoot()
					foundTarget = true

					if not Flags["Rage/MultiTarget"] then
						break
					end
				end
			end

			if not foundTarget then
				GlobalState.RageBot.Active = nil
			end
		end
	end

	RageBotFunctions.KillAll = function()
		if not Flags["Misc/KillAll"] then return end
		if Flags["Misc/KillAllTimeOffset"] and Status.Preparation.Value == true then
			local timerValue = TimerObject.Value
			local currentTime = OsClock()

			if timerValue ~= TimeOffset2Data.LastValue then
				TimeOffset2Data.LastValue = timerValue
				TimeOffset2Data.LastChange = currentTime
				RageBotData.CanKillAll = false
			end

			local elapsed = currentTime - TimeOffset2Data.LastChange
			local remaining = (timerValue * 1000) - (elapsed * 1000)

			if remaining < (timerValue - 1) * 1000 then
				remaining = (timerValue - 1) * 1000
			end

			local floorRemaining = math.floor(remaining)
			if not RageBotData.CanKillAll and floorRemaining <= (Flags["Misc/KillAllTimeOffsetValue"] or 30) then
				RageBotData.CanKillAll = true
			end
		else
			RageBotData.CanKillAll = true
		end

		if Flags["Misc/KillAllTimeOffset"] and RageBotData.CanKillAll == false then return end
		if Flags["Misc/KillAllPrepCheck"] and Status.Preparation.Value then return end
		if LocalPlayer.Status.Alive.Value == false then return end

		local enemies = RageBotFunctions.GetEnemies()
		if #enemies == 0 then return end
		for i = 1, #enemies do
			local enemy = enemies[i]
			local character = enemy.Character
			if not character or not FindFirstChild(character, "HumanoidRootPart") then
				continue
			end
			if FindFirstChildOfClass(character, "ForceField") then
				continue
			end
			RageBotFunctions.HitPart(enemy, "Head", "AWP", 1)
		end
	end

	local renderConnection
	UILibrary:Connection(RunService.RenderStepped, function(deltaTime)
		TaskSpawn(GlobalState.Misc.Functions.Movement)
		TaskSpawn(GlobalState.Visuals.Functions.Lighting)
		TaskSpawn(RageBotFunctions.KillAll)

		if GlobalState.RageBot.CurrentTarget ~= nil then
			if GlobalState.RageBot.CurrentTarget ~= renderConnection then
				GlobalEvents.RageBot.TargetChanged:Fire { OldTarget = renderConnection, CurrentTarget = GlobalState.RageBot.CurrentTarget }
			end
			renderConnection = GlobalState.RageBot.CurrentTarget
		end

		UpdateOffscreenArrows()
		RageBotFunctions.Think()
	end)
end

do
    local originalNamecallHook2
    originalNamecallHook2 = hookmetamethod(game, "__namecall", function(self, ...)
        local method = getnamecallmethod()
        local args = { ... }

        if method == "FireServer" then
            if self.Name == "HitParl" then
				if Toggles[SanitizeFlag("Misc/QuickPeek")] and Toggles[SanitizeFlag("Misc/QuickPeek")].Value and quickPeek.active then
					task.defer(DoReturn)
				end
                local decodedPosition = GlobalState.Utility.DecodePosition(args[2])
                local hitPlayer
                if args[1] and args[1].Parent and FindFirstChild(Players, args[1].Parent.Name) then
                    hitPlayer = FindFirstChild(Players, args[1].Parent.Name)
                end
                SpawnFunction(GlobalState.Misc.Functions.HitSound, args[1].Name or "Head")
                if Flags["Visuals/BulletTracer"] then
                    SpawnFunction(function()
                        local origin
                        if Toggles.local_thirdperson and Toggles.local_thirdperson.Value then
                            local char = LocalPlayer.Character
                            local head = char and FindFirstChild(char, "Head")
                            origin = head and head.Position or CurrentCamera.CFrame.Position
                        else
                            local arms = FindFirstChild(CurrentCamera, "Arms")
                            local flash = arms and FindFirstChild(arms, "Flash")
                            origin = flash and flash.Position or CurrentCamera.CFrame.Position
                        end
                        GlobalState.Visuals.Functions.CreateBeam(origin, args[1].Position)
                    end)
                end
				if Flags["Visuals/BulletImpact"] then
					SpawnFunction(function()
						local origin
						if Toggles.local_thirdperson and Toggles.local_thirdperson.Value then
							local char = LocalPlayer.Character
							local head = char and FindFirstChild(char, "Head")
							origin = head and head.Position or CurrentCamera.CFrame.Position
						else
							local arms = FindFirstChild(CurrentCamera, "Arms")
							local flash = arms and FindFirstChild(arms, "Flash")
							origin = flash and flash.Position or CurrentCamera.CFrame.Position
						end

						local endPos = args[1].Position
						local direction = (endPos - origin)
						local distance = direction.Magnitude
						local unitDir = direction.Unit

						local rayParams = RaycastParams.new()
						rayParams.FilterDescendantsInstances = { LocalPlayer.Character, CurrentCamera }
						rayParams.FilterType = Enum.RaycastFilterType.Exclude

						GlobalState.Visuals.Functions.CreateBulletImpact(endPos)
					end)
				end
                if GlobalState.Constants.Hitboxes[args[1].Name] then
                    GlobalState.LastHit = hitPlayer
                    if Flags["Misc/KillAll"] ~= true then
                        SpawnWithIdentity(8, GlobalState.Visuals.Functions.Hitmark, decodedPosition)
                    end
                    SpawnWithIdentity(8, GlobalState.Visuals.Functions.Hitmark, decodedPosition)
                    SpawnWithIdentity(8, function()
                        GlobalEvents.Events.HitPlayer:Fire { Player = (hitPlayer or nil), Position = decodedPosition, UsedGun = args[3], Hitbox = args[1].Name }
                    end)
                end
                if GlobalState.RageBot.Active ~= nil or Flags["Misc/KillAll"] == true then
                    args[2] = NaNVector3
                end
                if hitPlayer and Flags["Visuals/HitChams"] then
                    SpawnWithIdentity(8, GlobalState.Visuals.Functions.CreateHitChams, hitPlayer)
                end
            end
            if self.Name == "ApplyGun" then
                SpawnFunction(GlobalState.Misc.Functions.ApplyGunModification)
            end
            if self.Name == "ohnoflames" and Flags["Misc/NoFireDamage"] then
                return
            elseif self.Name == "FallDamage" and Flags["Misc/NoFallDamage"] then
                return
            end
            if self.Name == "RemoteEvent" then
                local eventArgs = args[1]
                if type(eventArgs) ~= "table" then return end
                local arg1 = eventArgs[1]
                local arg2 = eventArgs[2]
                if (Typeof(arg1) == "string" and StringLower(arg1) == "kick")
                    or (Typeof(arg2) == "string" and StringFind(StringLower(arg2), "error")) then
                    return
                end
            end
        end

        if method == "PivotTo" and self.Name == "Arms" then
            local pivot = args[1]
            if Flags["Visuals/VmOffset"] then
                if pivot then
                    local rotation = CFrameAngles(GlobalConfig.ViewmodelOffsetPitch, GlobalConfig.ViewmodelOffsetYaw, GlobalConfig.ViewmodelOffsetRoll)
                    args[1] = pivot * NewCFrame(GlobalConfig.ViewmodelOffsetX, GlobalConfig.ViewmodelOffsetY, GlobalConfig.ViewmodelOffsetZ) * rotation
                    pivot = pivot * NewCFrame(GlobalConfig.ViewmodelOffsetX, GlobalConfig.ViewmodelOffsetY, GlobalConfig.ViewmodelOffsetZ) * rotation
                end
            end
            if Flags["Rage/RotateVM"] then
                local active = GlobalState.RageBot.Active
                if active ~= nil and active.Point then
                    local targetPoint = active.Point
                    if pivot then
                        args[1] = CFrameLookAt(pivot.Position, targetPoint)
                    end
                end
            end
            if GlobalState.Visuals.States.ThirdPerson == "Out" or GlobalState.Visuals.States.ThirdPerson == "Transitioing_Out" then
                args[1] = NewCFrame(0, 0, 0)
            end
            return originalNamecallHook2(self, TableUnpack(args))
        end

        if self.Name == "HaIIoooooooooooo" or self.Name == "Boogers" then
            if method == "FireServer"
                or method == "FireUnreliable"
                or method == "InvokeServer" then
                return nil
            end
        end

        return originalNamecallHook2(self, ...)
    end)
end

do
	UILibrary:Connection(LocalPlayer.Status.Kills.Changed, function(kills)
		if kills == 0 then return end
		TaskSpawn(GlobalState.Misc.Functions.KillSound)
		if GlobalState.LastHit ~= nil then
			if FindFirstChild(GlobalState.LastHit, "Status") and GlobalState.LastHit.Status.Alive.Value ~= true then
				GlobalEvents.Events.KillPlayer:Fire { Kills = kills, Player = GlobalState.LastHit }
			end
		end
	end)
end

UILibrary:ConfigListUpdate()
for presetName, presetTable in UIPresets.Preset do
	pcall(function()
		UILibrary:UpdateTheme(presetName, presetTable)
	end)
end
TaskWait()
UILibrary.OldConfig = UILibrary:GetConfig()

local function OnNoRecoilChanged()
    weaponMods.no_recoil = Flags["Misc/NoRecoil"] or false
    ApplyNoRecoil()
end

local function OnNoSpreadChanged()
    weaponMods.no_spread = Flags["Misc/NoSpread"] or false
    ApplyNoSpread()
end

local function ApplySkybox()
    local enabled = Flags["Visuals/SkyboxEnabled"]
    local skyType = Flags["Visuals/SkyboxType"] or "Galaxy"
    local sky = Lighting:FindFirstChild("CustomSky")

    if not enabled then
        if sky then sky:Destroy() end
        return
    end

    local skyData = SkyboxesTable[skyType]
    if not skyData then return end

    if not sky then
        sky = Instance.new("Sky")
        sky.Name = "CustomSky"
        sky.Parent = Lighting
    end

    for key, value in pairs(skyData) do
        sky[key] = value
    end
end

Toggles[SanitizeFlag("Visuals/SkyboxEnabled")]:OnChanged(function()
    ApplySkybox()
end)

Options[SanitizeFlag("Visuals/SkyboxType")]:OnChanged(function()
    ApplySkybox()
end)

local function parasha()
    local e = Flags["Esp/OffscreenArrows"]
    if e ~= nil then offscreenArrows.enabled = e end

    local c = Flags["Esp/OffscreenArrowsColor"]
    if c then offscreenArrows.color = c.Color end
    
    local t = Flags["Esp/OffscreenArrowsTransparency"]
    if t then offscreenArrows.transparency = t / 100 end
    
    local r = Flags["Esp/OffscreenArrowsRadius"]
    if r then offscreenArrows.radius = r end
    
    local s = Flags["Esp/OffscreenArrowsSize"]
    if s then offscreenArrows.size = s end
end

Workspace.ChildAdded:Connect(function(child)
    if child.Name == "Map" then
        task.wait(0.5)
        ApplySkybox()
    end
end)

Workspace.ChildAdded:Connect(function(child)
    if child.Name == "Map" then
        task.wait(0.5)
        ApplySkybox()
        if Flags["Visuals/FogEnabled"] then
            atm.Parent = Lighting
        end
    end
end)

function kykoldingrenade()
	local ok, weapName = pcall(function()
		return workspace[localPlayer.Name].EquippedTool.Value;
	end);
	if (not ok or not weapName) then
		return false;
	end
	return grenadenames[weapName] == true;
end

local aaSmoothJitterState = {
    currentAngle = -30,
    direction = 1,
}

local function getSmoothJitterOffset(aaState, dt)
    local cfg = aacfgpizda[aaState]
    if not cfg or not cfg.smooth_jitter then return nil end

    local fromAngle = cfg.smooth_jitter_from
    local toAngle = cfg.smooth_jitter_to
    local speed = cfg.smooth_jitter_speed

    local target = (aaSmoothJitterState.direction == 1) and toAngle or fromAngle
    local diff = target - aaSmoothJitterState.currentAngle
    local step = speed * dt * 60

    if math.abs(diff) <= step then
        aaSmoothJitterState.currentAngle = target
        aaSmoothJitterState.direction = -aaSmoothJitterState.direction
    else
        aaSmoothJitterState.currentAngle = aaSmoothJitterState.currentAngle + (diff > 0 and step or -step)
    end

    return aaSmoothJitterState.currentAngle
end

RunService.RenderStepped:Connect(function()
	if (antiaim.enabled and IsAlive(localPlayer)) then
		if kykoldingrenade() then
			local character = localPlayer.Character;
			if character then
				local humanoid = character:FindFirstChild("Humanoid");
				if humanoid then humanoid.AutoRotate = true; end
			end
		else
			local character = localPlayer.Character;
			local root = character:FindFirstChild("HumanoidRootPart");
			local humanoid = character:FindFirstChild("Humanoid");
			local camLook = currentCamera.CFrame.LookVector;
			if (root and humanoid) then
				humanoid.AutoRotate = false;
				local aaState = "Standing";
				local isInAir = (humanoid.FloorMaterial == Enum.Material.Air) or userInput:IsKeyDown(Enum.KeyCode.Space);
				if isInAir then
					aaState = "Jumping";
				elseif character:FindFirstChild("Crouched") then
					aaState = "Crouch";
				elseif character:GetAttribute("Walking") == true then
					aaState = "SlowWalk";
				else
					local hrp = character:FindFirstChild("HumanoidRootPart");
					if hrp and Vec2(hrp.AssemblyLinearVelocity.X, hrp.AssemblyLinearVelocity.Z).Magnitude > 0.5 then
						aaState = "Moving";
					end
				end
				local s = {
					yaw_base = Options["aa_" .. aaState .. "_yaw_base"].Value,
					yaw_offset = Options["aa_" .. aaState .. "_yaw_offset"].Value,
					jitter = Toggles["aa_" .. aaState .. "_jitter"].Value,
					jitter_offset = Options["aa_" .. aaState .. "_jitter_offset"].Value,
					jitter_speed = Options["aa_" .. aaState .. "_jitter_speed"].Value,
					spin_speed = Options["aa_" .. aaState .. "_spin_speed"].Value,
					body_roll = Options["aa_" .. aaState .. "_body_roll"].Value,
				};
				local currentTime = tick()
				local dt = currentTime - (aaSmoothJitterState.lastTime or currentTime)
				aaSmoothJitterState.lastTime = currentTime
				dt = math.clamp(dt, 0.001, 0.05)

				if ((currentTime - aalastjittertime[aaState]) >= (s.jitter_speed / 1000)) then
					aajittertoggles[aaState] = not aajittertoggles[aaState]
					aalastjittertime[aaState] = currentTime
				end

				aaspinangles[aaState] = aaspinangles[aaState] + math.rad(s.spin_speed * 0.1)
				if (aaspinangles[aaState] > math.rad(360)) then aaspinangles[aaState] = 0 end

				local angle = -math.atan2(camLook.Z, camLook.X) + math.rad(-90)
				if (s.yaw_base == "Spin") then
					angle = angle + aaspinangles[aaState]
				elseif (s.yaw_base == "Random") then
					angle = angle + math.rad(math.random(0, 360))
				elseif (s.yaw_base == "Backward") then
					angle = angle + math.rad(180)
				elseif (s.yaw_base == "Targets") then
					local closestPart = nil
					local closestDistance = 9999
					for _, player in pairs(players:GetPlayers()) do
						if ((player ~= localPlayer) and player.Character and player.Character:FindFirstChild("Humanoid") and (player.Character.Humanoid.Health > 0) and (player.Team ~= localPlayer.Team)) then
							local rootPart = player.Character:FindFirstChild("HumanoidRootPart")
							if rootPart then
								local pos = currentCamera:WorldToViewportPoint(rootPart.Position)
								local mousePos = userInput:GetMouseLocation()
								local distance = (Vec2(pos.X, pos.Y) - Vec2(mousePos.X, mousePos.Y)).Magnitude
								if (distance < closestDistance) then
									closestPart = rootPart
									closestDistance = distance
								end
							end
						end
					end
					if closestPart then
						angle = -math.atan2((closestPart.Position - root.Position).Z, (closestPart.Position - root.Position).X) + math.rad(-90)
					end
				end

				local smoothOffset = getSmoothJitterOffset(aaState, dt)
				local jitterOffset
				if smoothOffset ~= nil then
					jitterOffset = smoothOffset
				else
					jitterOffset = (s.jitter and aajittertoggles[aaState] and s.jitter_offset) or 0
				end

				local offset = math.rad(-s.yaw_offset - jitterOffset)
				local targetCFrame = CF(root.Position) * CFrame.Angles(0, angle + offset, 0);
				if (s.body_roll == "180") then
					targetCFrame = targetCFrame * CFrame.Angles(math.rad(180), 0, 0);
					humanoid.HipHeight = 4;
				else
					humanoid.HipHeight = 2;
				end
				root.CFrame = targetCFrame;
			end
		end
	elseif IsAlive(localPlayer) then
		local char = localPlayer.Character;
		if (char and char:FindFirstChild("Humanoid")) then
			char.Humanoid.AutoRotate = true;
			char.Humanoid.HipHeight = 2;
		end
	end
end);

do
	local indGui = Instance.new("ScreenGui")
	indGui.Name = "IndicatorsGui"
	indGui.IgnoreGuiInset = true
	indGui.ResetOnSpawn = false
	indGui.Parent = UIHolder

	local indLabels = {}
	local indCurrentX = 0

	local function getMovementState()
		local char = LocalPlayer.Character
		if not char then return "UNKNOWN" end
		local hum = char:FindFirstChildOfClass("Humanoid")
		if not hum then return "UNKNOWN" end
		local hrp = char:FindFirstChild("HumanoidRootPart")
		local isInAir = hum and ((hum.FloorMaterial == Enum.Material.Air) or IsKeyDown(UserInputService, "Space"))
		if isInAir then return "JUMPING" end
		if char:FindFirstChild("Crouched") then return "CROUCHING" end
		if char:GetAttribute("Walking") == true then return "SLOWWALK" end
		if hrp and Vector2.new(hrp.AssemblyLinearVelocity.X, hrp.AssemblyLinearVelocity.Z).Magnitude > 0.5 then
			return "MOVING"
		end
		return "STANDING"
	end

	local function getLines()
		local selected = Flags["Visuals/IndicatorItems"]
		if not selected then return {} end
		local lines = {}
		if selected["Ragebot"] then
			table.insert(lines, "RAGEBOT: " .. (Flags["Rage/Enabled"] and "ON" or "OFF"))
		end
		if selected["AimAssist"] then
			table.insert(lines, "AIM ASSIST: " .. (Flags["AimAssist/Enabled"] and "ON" or "OFF"))
		end
		if selected["FOV"] then
			table.insert(lines, "FOV: " .. tostring(Flags["AimAssist/FOVRadius"] or 200))
		end
		if selected["Triggerbot"] then
			table.insert(lines, "TRIGGERBOT: " .. (Flags["Triggerbot/Enabled"] and "ON" or "OFF"))
		end
		if selected["TriggerDelay"] then
			table.insert(lines, "DELAY: " .. tostring(Flags["Triggerbot/Delay"] or 100) .. "ms")
		end
		if selected["ThirdPerson"] then
			local tp = Toggles["local_thirdperson"] and Toggles["local_thirdperson"].Value
			table.insert(lines, "THIRD PERSON: " .. (tp and "ON" or "OFF"))
		end
		if selected["State"] then
			table.insert(lines, "STATE: " .. getMovementState())
		end
		return lines
	end

	local function isScoped()
		local ok, result = pcall(function()
			local pg = LocalPlayer.PlayerGui
			local gui = pg:FindFirstChild("GUI")
			if not gui then return false end
			local ch = gui:FindFirstChild("Crosshairs")
			if not ch then return false end
			local sc = ch:FindFirstChild("Scope")
			return sc and sc.Visible or false
		end)
		return ok and result or false
	end

	RunService.RenderStepped:Connect(function(dt)
		if not Flags["Visuals/Indicators"] then
			for _, l in ipairs(indLabels) do l.Visible = false end
			return
		end

		local scoped = isScoped()
		local vp = CurrentCamera.ViewportSize
		local cx = vp.X / 2
		local cy = vp.Y / 2

		local targetX, baseY, alignment
		if scoped then
			targetX = (Flags["Visuals/IndicatorsScopeX"] or 0) + 80
			baseY = cy + 20 + (Flags["Visuals/IndicatorsScopeY"] or 0)
			alignment = Enum.TextXAlignment.Left
		else
			targetX = Flags["Visuals/IndicatorsX"] or 0
			baseY = cy + 20 + (Flags["Visuals/IndicatorsY"] or 0)
			alignment = Enum.TextXAlignment.Center
		end

		indCurrentX = indCurrentX + (targetX - indCurrentX) * math.min(dt * 8, 1)

		local lines = getLines()

		while #indLabels < #lines do
			local l = Instance.new("TextLabel")
			l.BackgroundTransparency = 1
			l.TextColor3 = Color3.new(1, 1, 1)
			l.TextSize = 9
			l.FontFace = LoadedFonts.SmallestPixel7
			l.TextStrokeTransparency = 0
			l.TextStrokeColor3 = Color3.new(0, 0, 0)
			l.Size = UDim2.new(0, 300, 0, 11)
			l.Parent = indGui
			table.insert(indLabels, l)
		end

		for i, label in ipairs(indLabels) do
			if i <= #lines then
				label.Text = lines[i]
				label.TextXAlignment = alignment
				local px = cx + indCurrentX
				if alignment == Enum.TextXAlignment.Center then
					label.Position = UDim2.new(0, px - 150, 0, baseY + (i - 1) * 11)
				else
					label.Position = UDim2.new(0, px, 0, baseY + (i - 1) * 11)
				end
				label.Visible = true
			else
				label.Visible = false
			end
		end
	end)
end

game:GetService("RunService").Heartbeat:Connect(function()
    local currentNoRecoil = Flags["Misc/NoRecoil"] or false
    local currentNoSpread = Flags["Misc/NoSpread"] or false
    
    if currentNoRecoil ~= weaponMods.no_recoil then
        OnNoRecoilChanged()
    end
    
    if currentNoSpread ~= weaponMods.no_spread then
        OnNoSpreadChanged()
    end
	
	if (antiaim.enabled and IsAlive(localPlayer) and not kykoldingrenade()) then
		local character = localPlayer.Character;
		local camLook = currentCamera.CFrame.LookVector;
		if character then
			local humanoid = character:FindFirstChild("Humanoid");
			local isInAir = humanoid and ((humanoid.FloorMaterial == Enum.Material.Air) or userInput:IsKeyDown(Enum.KeyCode.Space));
			local aaState = "Standing";
			if isInAir then
				aaState = "Jumping";
			elseif character:FindFirstChild("Crouched") then
				aaState = "Crouch";
			elseif character:GetAttribute("Walking") == true then
				aaState = "SlowWalk";
			else
				local hrp = character:FindFirstChild("HumanoidRootPart");
				if hrp and Vec2(hrp.AssemblyLinearVelocity.X, hrp.AssemblyLinearVelocity.Z).Magnitude > 0.5 then
					aaState = "Moving";
				end
			end
			local s = {
				pitch        = Options["aa_" .. aaState .. "_pitch"].Value,
				extend_pitch = Toggles["aa_" .. aaState .. "_extend_pitch"].Value,
			};
			local finalPitch = camLook.Y;
			local pMode = s.pitch;
			if (pMode == "Down") then
				finalPitch = -1;
			elseif (pMode == "Up") then
				finalPitch = 1;
			elseif (pMode == "Zero") then
				finalPitch = 0;
			elseif (pMode == "Random") then
				finalPitch = math.random(-100, 100) / 100;
			elseif (pMode == "Custom") then
				finalPitch = math.clamp((aacfgpizda[aaState].pitch_custom or 0), -1, 1);
			end
			if s.extend_pitch then
				finalPitch = finalPitch * 1.5;
				if finalPitch > 1 then finalPitch = 1; end
				if finalPitch < -1 then finalPitch = -1; end
			end
			game.ReplicatedStorage.Events.ControlTurn:FireServer(finalPitch, finalPitch - camLook.Y);
		end
	elseif IsAlive(localPlayer) then
		local char = localPlayer.Character;
		if char then
			game.ReplicatedStorage.Events.ControlTurn:FireServer(currentCamera.CFrame.LookVector.Y, 0);
		end
	end
end);

local function SaveOriginalWeaponValues()
    local weapons = game:GetService("ReplicatedStorage").Weapons
    for _, gun in ipairs(weapons:GetChildren()) do
        if gun:IsA("Folder") or gun:IsA("Model") then
            if not originalWeaponValues[gun.Name] then
                originalWeaponValues[gun.Name] = {}
                
                local spread = gun:FindFirstChild("Spread")
                if spread then
                    originalWeaponValues[gun.Name].spread = spread.Value
                    for _, child in ipairs(spread:GetChildren()) do
                        if child:IsA("NumberValue") then
                            originalWeaponValues[gun.Name][child.Name] = child.Value
                        end
                    end
                end
            end
        end
    end
end

SaveOriginalWeaponValues()

do
    local waistC0 = CFrame.new(-1.1920929e-07, 0.550000072, 7.64462551e-20, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    local neckC0 = CFrame.new(-5.96046448e-08, 0.799999952, 1.1920929e-07, 1, 0, 0, 0, 1, 0, 0, 0, 1)

    RunService.RenderStepped:Connect(function()
		if not antiaim.enabled then return end
        local char = LocalPlayer.Character
        if not char then return end
        
        local head = char:FindFirstChild("Head")
        local upperTorso = char:FindFirstChild("UpperTorso")
        if not head or not upperTorso then return end
        
        local neck = head:FindFirstChild("Neck")
        local waist = upperTorso:FindFirstChild("Waist")
        
        local pitchAngle
        if antiaim.enabled then
            local aaState = "Standing"
            local hum = char:FindFirstChild("Humanoid")
            if hum then
                local isInAir = hum.FloorMaterial == Enum.Material.Air
                if isInAir then aaState = "Jumping"
                elseif char:FindFirstChild("Crouched") then aaState = "Crouch"
                elseif char:GetAttribute("Walking") == true then aaState = "SlowWalk"
                else
                    local hrp = char:FindFirstChild("HumanoidRootPart")
                    if hrp and Vector2.new(hrp.AssemblyLinearVelocity.X, hrp.AssemblyLinearVelocity.Z).Magnitude > 0.5 then
                        aaState = "Moving"
                    end
                end
            end
            local pMode = Options["aa_" .. aaState .. "_pitch"] and Options["aa_" .. aaState .. "_pitch"].Value or "None"
            local camPitchY = CurrentCamera.CFrame.LookVector.Y
            local finalPitch = camPitchY
            if pMode == "Down" then finalPitch = -1
            elseif pMode == "Up" then finalPitch = 1
            elseif pMode == "Zero" then finalPitch = 0
            elseif pMode == "Random" then finalPitch = math.random(-100, 100) / 100
            elseif pMode == "Custom" then finalPitch = math.clamp(aacfgpizda[aaState].pitch_custom or 0, -1, 1)
            end
            pitchAngle = math.asin(math.clamp(finalPitch, -1, 1))
        else
            local pitchY = CurrentCamera.CFrame.LookVector.Y
            pitchAngle = math.asin(math.clamp(pitchY, -1, 1))
        end
        
        if neck and neck:IsA("Motor6D") then
            neck.C0 = neckC0 * CFrame.Angles(pitchAngle * 0.5, 0, 0)
        end
        
        if waist and waist:IsA("Motor6D") then
            waist.C0 = waistC0 * CFrame.Angles(pitchAngle * 0.5, 0, 0)
        end
    end)
end

Toggles[SanitizeFlag("Misc/GunModNoRecoil")]:OnChanged(function()
    local state = Toggles[SanitizeFlag("Misc/GunModNoRecoil")].Value
    local weapons = game:GetService("ReplicatedStorage").Weapons
    for _, gun in ipairs(weapons:GetChildren()) do
        if gun:IsA("Folder") or gun:IsA("Model") then
            local recoil = gun:FindFirstChild("Spread") and gun.Spread:FindFirstChild("Recoil")
            if recoil then
                if state then
                    recoil.Value = 0
                else
                    local orig = originalWeaponValues[gun.Name] and originalWeaponValues[gun.Name].Recoil
                    if orig ~= nil then
                        recoil.Value = orig
                    end
                end
            end
        end
    end
end)

Toggles[SanitizeFlag("Misc/GunModNoSpread")]:OnChanged(function()
    local state = Toggles[SanitizeFlag("Misc/GunModNoSpread")].Value
    local weapons = game:GetService("ReplicatedStorage").Weapons
    for _, gun in ipairs(weapons:GetChildren()) do
        if gun:IsA("Folder") or gun:IsA("Model") then
            local spread = gun:FindFirstChild("Spread")
            if spread then
                if state then
                    spread.Value = 0
                    for _, child in ipairs(spread:GetChildren()) do
                        if child:IsA("NumberValue") and child.Name ~= "Recoil" then
                            child.Value = 0
                        end
                    end
                else
                    local orig = originalWeaponValues[gun.Name]
                    if orig then
                        spread.Value = orig.spread or spread.Value
                        for _, child in ipairs(spread:GetChildren()) do
                            if child:IsA("NumberValue") and child.Name ~= "Recoil" then
                                child.Value = orig[child.Name] or child.Value
                            end
                        end
                    end
                end
            end
        end
    end
end)

task.spawn(function()
    task.wait(0.6)
    parasha()
end)

runService.Heartbeat:Connect(function()
	PixelSurf()
	NoLegAnimation()
    for _, plr in ipairs(players:GetPlayers()) do
        if plr ~= players.LocalPlayer then
            local isDead = false
            local status = plr:FindFirstChild("Status")
            
            if status and status:FindFirstChild("Alive") and status.Alive.Value == false then
                isDead = true
            elseif plr.Character and plr.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.Health <= 0 then
                isDead = true
            end

            if isDead then
                local partsToDestroy = {"Head", "FakeHead", "CylinderHead"}
                
                if plr.Character then
                    for _, name in ipairs(partsToDestroy) do
                        local head = plr.Character:FindFirstChild(name)
                        if head then head:Destroy() end
                    end
                end
                
                local plrFolder = workspace:FindFirstChild(plr.Name)
                if plrFolder then
                    for _, name in ipairs(partsToDestroy) do
                        local head = plrFolder:FindFirstChild(name)
                        if head then head:Destroy() end
                    end
                end
            end
        end
    end
    
    if Flags["Misc/OldGunSounds"] then
        pcall(function()
            local equippedTool = localPlayer.Character.EquippedTool
            if equippedTool then
                if equippedTool.Value == "AK47" then
                    localPlayer.Character.Gun.Shoot.Value = "rbxassetid://1112730119"
                elseif equippedTool.Value == "M4A1" then
                    localPlayer.Character.Gun.Shoot.Value = "rbxassetid://1665639883"
                    localPlayer.Character.Gun.Shoot.Value = "rbxassetid://2515498997"
                elseif equippedTool.Value == "Glock" then
                    localPlayer.Character.Gun.Shoot.Value = "rbxassetid://1112951656"
                elseif equippedTool.Value == "Galil" then
                    localPlayer.Character.Gun.Shoot.Value = "rbxassetid://344800912"
                elseif equippedTool.Value == "USP" then
                    localPlayer.Character.Gun.Shoot.Value = "rbxassetid://1112952739"
                    localPlayer.Character.Gun.Shoot.Value = "rbxassetid://2515499360"
                elseif equippedTool.Value == "P2000" then
                    localPlayer.Character.Gun.Shoot.Value = "rbxassetid://263589107"
                elseif equippedTool.Value == "P250" then
                    localPlayer.Character.Gun.Shoot.Value = "rbxassetid://340365431"
                elseif equippedTool.Value == "DesertEagle" then
                    localPlayer.Character.Gun.Shoot.Value = "rbxassetid://202918645"
                elseif equippedTool.Value == "MP9" then
                    localPlayer.Character.Gun.Shoot.Value = "rbxassetid://222888810"
                elseif equippedTool.Value == "UMP" then
                    localPlayer.Character.Gun.Shoot.Value = "rbxassetid://206953341"
                elseif equippedTool.Value == "Famas" then
                    localPlayer.Character.Gun.Shoot.Value = "rbxassetid://206953280"
                elseif equippedTool.Value == "Scout" then
                    localPlayer.Character.Gun.Shoot.Value = "rbxassetid://1112858108"
                elseif equippedTool.Value == "AUG" then
                    localPlayer.Character.Gun.Shoot.Value = "rbxassetid://515215839"
                elseif equippedTool.Value == "AWP" then
                    localPlayer.Character.Gun.Shoot.Value = "rbxassetid://202918637"
                elseif equippedTool.Value == "G3SG1" then
                    localPlayer.Character.Gun.Shoot.Value = "rbxassetid://340365815"
                elseif equippedTool.Value == "SG" then
                    localPlayer.Character.Gun.Shoot.Value = "rbxassetid://347270113"
                elseif equippedTool.Value == "M4A4" then
                    localPlayer.Character.Gun.Shoot.Value = "rbxassetid://202918741"
				elseif equippedTool.Value == "Scout" then
                    localPlayer.Character.Gun.Shoot.Value = "rbxassetid://81899527007318"
                elseif equippedTool.Value == "Tec9" then
                    localPlayer.Character.Gun.Shoot.Value = "rbxassetid://206953317"
                end
            end
        end)
    end
end)
