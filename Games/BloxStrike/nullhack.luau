-- this version is potassium only and detected

if not PsmSignal then
    return
end

local InstanceNew = clonefunction(Instance.new)
local GetService = clonefunction(game.GetService)
local IsLoaded = clonefunction(game.IsLoaded)
local Clone = clonefunction(game.Clone)
local Destroy = clonefunction(game.Destroy)
local Remove  = clonefunction(game.Remove)
local GetChildren = clonefunction(game.GetChildren)
local ClearAllChildren = clonefunction(game.ClearAllChildren)
local GetDescendants = clonefunction(game.GetDescendants)
local IsDescendantOf = clonefunction(game.IsDescendantOf)
local IsA = clonefunction(game.IsA)
local FindFirstChild = clonefunction(game.FindFirstChild)
local WaitForChild = clonefunction(game.WaitForChild)

local FindFirstChildOfClass = clonefunction(game.FindFirstChildOfClass)
local HttpGet = clonefunction(game.HttpGet)
local GetPropertyChangedSignal = clonefunction(game.GetPropertyChangedSignal)
local GetAttribute = clonefunction(game.GetAttribute)

local GetPlayers = clonefunction(GetService(game, "Players").GetPlayers)
local GetPlayerFromCharacter = clonefunction(GetService(game, "Players").GetPlayerFromCharacter)
local CreateHumanoidModelFromUserId = clonefunction(GetService(game, "Players").CreateHumanoidModelFromUserId)
-- local GetValue = clonefunction(GetService(game, "Stats").Network.ServerStatsItem["Data Ping"].GetValue)
local GetMouseLocation = clonefunction(GetService(game, "UserInputService").GetMouseLocation)
local IsKeyDown = clonefunction(GetService(game, "UserInputService").IsKeyDown)
local IsMouseButtonPressed = clonefunction(GetService(game, "UserInputService").IsMouseButtonPressed)
local GetFocusedTextBox = clonefunction(GetService(game, "UserInputService").GetFocusedTextBox)
local GetTextSize = clonefunction(GetService(game, "TextService").GetTextSize)
local GetTextBoundsAsync = clonefunction(GetService(game, "TextService").GetTextBoundsAsync)
local SendMouseButtonEvent = clonefunction(InstanceNew("VirtualInputManager").SendMouseButtonEvent)
local SendMouseMoveDeltaEvent = clonefunction(InstanceNew("VirtualInputManager").SendMouseMoveDeltaEvent)
local GetTeams = clonefunction(GetService(game, "Teams").GetTeams)
local GetMouse = clonefunction(GetService(game, "Players").LocalPlayer.GetMouse)

local SignalWait = clonefunction(GetService(game, "RunService").RenderStepped.Wait)
local BindableFire = clonefunction(InstanceNew("BindableEvent").Fire)

local CFrameNew = clonefunction(CFrame.new)
local CFrameAngles = clonefunction(CFrame.Angles)
local CFrameLookAt = clonefunction(CFrame.lookAt)
local CFrameLerp = clonefunction(CFrameNew().Lerp)
local CFrameGetComponents = clonefunction(CFrameNew().GetComponents)
local CFramePointToObjectSpace = clonefunction(CFrameNew().PointToObjectSpace)
local CFrameToObjectSpace = clonefunction(CFrameNew().ToObjectSpace)
local CFrameToEulerAnglesXYZ = clonefunction(CFrameNew().ToEulerAnglesXYZ)

local Vector3New = clonefunction(Vector3.new)
local Vector3Lerp = clonefunction(Vector3New().Lerp)

local Vector2New = clonefunction(Vector2.new)

local UDim2New = clonefunction(UDim2.new)
local UDim2FromOffset = clonefunction(UDim2.fromOffset)
local UDim2FromScale = clonefunction(UDim2.fromScale)
local UDimNew = clonefunction(UDim.new)

local Color3New = clonefunction(Color3.new)
local Color3FromRGB = clonefunction(Color3.fromRGB)
local Color3FromHSV = clonefunction(Color3.fromHSV)
local Color3ToHSV = clonefunction(Color3.toHSV)
local Color3ToHex = clonefunction(Color3New().ToHex)
local Color3FromHex = clonefunction(Color3.fromHex)

local ColorSequenceNew = clonefunction(ColorSequence.new)
local ColorSequenceKeypointNew = clonefunction(ColorSequenceKeypoint.new)
local NumberSequenceNew = clonefunction(NumberSequence.new)
local NumberSequenceKeypointNew = clonefunction(NumberSequenceKeypoint.new)

local RayNew = clonefunction(Ray.new)
local RaycastParamsNew = clonefunction(RaycastParams.new)
local Raycast = clonefunction(workspace.Raycast)

local StringFormat = clonefunction(string.format)
local StringUpper = clonefunction(string.upper)
local StringLower = clonefunction(string.lower)
local StringFind = clonefunction(string.find)
local StringLen = clonefunction(string.len)
local StringGsub = clonefunction(string.gsub)
local StringSub = clonefunction(string.sub)
local StringMatch = clonefunction(string.match)
local StringGmatch = clonefunction(string.gmatch)
local StringSplit = clonefunction(string.split)
local ToString = clonefunction(tostring)

local TableInsert = clonefunction(table.insert)
local TableClear = clonefunction(table.clear)
local TableRemove = clonefunction(table.remove)
local TableFind = clonefunction(table.find)
local TableSort = clonefunction(table.sort)
local TableConcat = clonefunction(table.concat)
local TableUnpack = clonefunction(table.unpack)
local TablePack = clonefunction(table.pack)

local TableClone = clonefunction(table.clone)
local Select = clonefunction(select)

local MathClamp = clonefunction(math.clamp)
local MathRandom = clonefunction(math.random)
local MathRad = clonefunction(math.rad)
local MathFloor = clonefunction(math.floor)
local MathAbs = clonefunction(math.abs)
local MathMax = clonefunction(math.max)
local MathMin = clonefunction(math.min)
local MathSin = clonefunction(math.sin)
local MathCos = clonefunction(math.cos)
local MathDeg = clonefunction(math.deg)
local MathCeil = clonefunction(math.ceil)
local MathAtan2 = clonefunction(math.atan2)
local MathSqrt = clonefunction(math.sqrt)
local MathPow = clonefunction(math.pow)
local MathRound = clonefunction(math.round)

local Inf = 1e309 -- inf

local ToNumber = clonefunction(tonumber)

local MathLerp = function(A, B, T)
    return A + (B - A) * T
end

local DebugTraceback = clonefunction(debug.traceback)

local Tick = clonefunction(tick)
local OsDate = clonefunction(os.date)
local OsTime = clonefunction(os.time)
local OsClock = clonefunction(os.clock)

local WorldToViewportPoint = clonefunction(InstanceNew("Camera").WorldToViewportPoint)
local WorldToScreenPoint = clonefunction(InstanceNew("Camera").WorldToScreenPoint)
local ChangeState = clonefunction(InstanceNew("Humanoid").ChangeState)
local GetState = clonefunction(InstanceNew("Humanoid").GetState)
local SetStateEnabled = clonefunction(InstanceNew("Humanoid").SetStateEnabled)

local GetModelSize = clonefunction(InstanceNew("Model").GetModelSize)

local Kick = clonefunction(InstanceNew("Player").Kick)

local Require = clonefunction(require)
local Type = clonefunction(type)
local Typeof = clonefunction(typeof)
local CoroutineWrap = clonefunction(coroutine.wrap)
local TaskWait = clonefunction(task.wait)
local Pcall = clonefunction(pcall)
local Wait = clonefunction(wait)
local TaskSpawn = clonefunction(task.spawn)
local TaskDelay = clonefunction(task.delay)
local TaskDefer = clonefunction(task.defer)
local TaskCancel = clonefunction(task.cancel)
local GetServerTimeNow = clonefunction(workspace.GetServerTimeNow)

local IsA         = clonefunction(game.IsA)

local Workspace         = cloneref(game:GetService("Workspace"))
local Players           = cloneref(game:GetService("Players"))
local RunService        = cloneref(game:GetService("RunService"))
local InputService      = cloneref(game:GetService("UserInputService"))
local ReplicatedStorage = cloneref(game:GetService("ReplicatedStorage"))
local TweenService      = cloneref(game:GetService("TweenService"))
local ScriptContext     = cloneref(game:GetService("ScriptContext"))
local LogService        = cloneref(game:GetService("LogService"))
local SoundService      = cloneref(game:GetService("SoundService"))
local HttpService       = cloneref(game:GetService("HttpService"))

local Camera = Workspace.CurrentCamera;
local Client = Players.LocalPlayer;
local ClientTable = {};
ClientTable["IsAlive"] = function()
    if not Client.Character then return false end
    if Client:GetAttribute("IsSpectating") == true then 
        return false 
    else 
        return true 
    end
    return true
end

ClientTable["IsBusy"] = function()
    if Workspace:GetAttribute("GameState") == "Map Voting" then return true end
    return false
end

local RunOnAnotherThread = function(Function, ...)
    TaskSpawn(function(...)
        local Thread = coroutine.create(Function);
        coroutine.resume(Thread, ...);
    end, ...);
end
local RunOnFixedThread = function(Identity, Function, ...)
	local Old = Function; Function = function(...)
		setthreadidentity(Identity)
		return Old(...)
	end;

    TaskSpawn(function(...)
        local Thread = coroutine.create(Function)
        coroutine.resume(Thread, ...)
    end, ...)
end



local _DrawingObject = {
    ["Cursors"] = {
        ["Main"] = Drawing.new("Quad");
        ["Shadow"] = Drawing.new("Quad");
    }
}

do
    _DrawingObject.Cursors.Main.Filled = true;
    _DrawingObject.Cursors.Main.ZIndex = 50
    _DrawingObject.Cursors.Shadow.Filled = true;
end

_DrawingObject["Update"] = function()
    
    local MouseLocation = GetMouseLocation(InputService)
    if _DrawingObject.Cursors.Main.Visible then

        
        _DrawingObject.Cursors.Main.PointA = MouseLocation
        _DrawingObject.Cursors.Main.PointB = MouseLocation + Vector2.new(9,8)
        _DrawingObject.Cursors.Main.PointC = MouseLocation + Vector2.new(4,8)
        _DrawingObject.Cursors.Main.PointD = MouseLocation + Vector2.new(2,13)
        -- DEFINETLY not from phenomenon.
        _DrawingObject.Cursors.Shadow.PointA = _DrawingObject.Cursors.Main.PointA + Vector2.new(1, 1)
        _DrawingObject.Cursors.Shadow.PointB = _DrawingObject.Cursors.Main.PointB + Vector2.new(1, 1)
        _DrawingObject.Cursors.Shadow.PointC = _DrawingObject.Cursors.Main.PointC + Vector2.new(1, 1)
        _DrawingObject.Cursors.Shadow.PointD = _DrawingObject.Cursors.Main.PointD + Vector2.new(1, 1)
    end
end

local Security = ReplicatedStorage.Database.Security
local Remotes = require(Security.Remotes)

local GetBloxStrikeModule = function(Module: string)
    for Index, Value in getloadedmodules() do
        if Value and Value.ClassName == "ModuleScript" then
            local Ok, Table = pcall(require, Value)
            if Ok and Typeof(Table) == "table" then
                if Module == "Raycast" then
                    if Table.cast then
                        return Table
                    end
                elseif Module == "InventoryController" then
                    if Table.getCurrentInventory then
                        return Table
                    end
                elseif Module == "CharacterController" then
                    if Table.jump then
                        return Table
                    end
                elseif Module == "TeamSelection" then
                   if Table.chooseTeam then
                        return Table
                    end
                end
            end
        end
    end
end

local Garbage: {any} = getgc()

local GetBloxStrikeFunction = function(Function: string) -- yes
    local _Function = nil;
    for Index, Value in Garbage do
        if Typeof(Value) ~= "function" then continue end
        local SOURCE = debug.info(Value, "s")
        if StringFind(SOURCE, "ReplicatedStorage") and StringFind(SOURCE, Function) then
            _Function = Value
            break
        end
    end

    return _Function
end

local Constants = {
    ["GetRayIgnore"] = GetBloxStrikeFunction("Common.GetRayIgnore"); -- RETURN FUNCTION
    ["Loadout"] = GetBloxStrikeModule("InventoryController");
    ["Raycast"] = GetBloxStrikeModule("Raycast");
    ["CharacterController"] = GetBloxStrikeModule("CharacterController");
    ["WeaponAnimations"] = ReplicatedStorage.Assets.WeaponAnimations:Clone();
    ["InventoryController"] = GetBloxStrikeModule("InventoryController");
    ["TeamSelection"] = GetBloxStrikeModule("TeamSelection");
    ["SkinsModule"]   = require(ReplicatedStorage.Database.Components.Libraries.Skins);
    ["VFX"] = {
        ["Marker"] = GetBloxStrikeFunction("CreateMarker");
        ["Tracer"] = GetBloxStrikeFunction("CreateTracer");
        ["MuzzleFlash"] = GetBloxStrikeFunction("CreateMuzzleFlash.Camera");
        ["Impact"] = GetBloxStrikeFunction("CreateImpact");
        ["BreakGlass"] = GetBloxStrikeFunction("BreakGlass");
    },
    ["Remotes"] = Remotes;
    ["ShootGun"] = Remotes.Inventory["ShootWeapon"];
    ["Vertices"] = {
        vector.create(-1, -1, -1),
        vector.create(-1,  1, -1),
        vector.create(-1,  1,  1),
        vector.create(-1, -1,  1),
        vector.create( 1, -1, -1),
        vector.create( 1,  1, -1),
        vector.create( 1,  1,  1),
        vector.create( 1, -1,  1),
    },
    ["MinimumBodyParts"] = 4, -- retry if not enough bodyparts
    ["IgnoredScript"] = {
        ["KnitClient"] = true;
        ["CameraShaker"] = true;
        ["FriendList"] = true;
        ["LoadingScreen"] = true;
        ["KnitClient"] = true;
        ["RobloxCore"] = true;
        ["ControlScript"] = true;
        ["ControlModule"] = true;
        ["LoadingScreen"] = true;
        -- ["Startup"] = true;
    },
    ["Sounds"] = {
        ["Among Us"] = "5700183626",
        ["AR2 Body"] = "2062015952",
        ["AR2 Head"] = "2062016772",
        ["AR2 Limb"] = "6659353525",
        ["Bag"] = "364942410",
        ["Baimware"] = "3124331820",
        ["Bamboo"] = "3769434519",
        ["Bambi"] = "8437203821",
        ["BameWare"] = "7898991882",
        ["Bat"] = "3333907347",
        ["BB HitM"] = "4645745735",
        ["BB Kill"] = "2636743632",
        ["Bell"] = "6534947240",
        ["BitchBot"] = "5709456554",
        ["BitchBot Body"] = "3744371342",
        ["BitchBot Head"] = "5043539486",
        ["Body"] = "3213738472",
        ["Bonk"] = "3765689841",
        ["Bop"] = "8829676038",
        ["Bruh"] = "4275842574",
        ["Bubble"] = "6534947588",
        ["Button"] = "12221967",
        ["Carrier Kill"] = "7139067012",
        ["Click"] = "8053704437",
        ["Clink"] = "711751971",
        ["Clutch Kill"] = "7379106527",
        ["CoD"] = "160432334",
        ["Crickets"] = "2101148",
        ["Crit"] = "296102734",
        ["Csgo"] = "7269900245",
        ["Ding"] = "7149516994",
        ["Double Kill"] = "6818527307",
        ["Doublekill 1"] = "1950547222",
        ["Doublekill 2"] = "130819307",
        ["Elevator"] = "8322227967",
        ["EmptyGun"] = "203691822",
        ["Fart"] = "131314452",
        ["Fart2"] = "6367774932",
        ["Fatality"] = "7347423703",
        ["Fatality MKX"] = "6721975770",
        ["Fatality Original"] = "158012252",
        ["FortniteGuns"] = "3008769599",
        ["Gamesense"] = "4817809188",
        ["Grenade Hit"] = "5684745272",
        ["Headshot"] = "8418469749",
        ["HitMarker"] = "8543972310",
        ["HL Crowbar"] = "546410481",
        ["HL Door"] = "4996094887",
        ["HL Elevator"] = "237877850",
        ["HL Med Kit"] = "4720445506",
        ["HL Revolver"] = "1678424590",
        ["Kill Imanjaro"] = "6818527258",
        ["Kill Ionaire"] = "6818527200",
        ["Kill Pocalypse"] = "6818526916",
        ["Kill Tacular"] = "6818527070",
        ["Kill Tastrophe"] = "6818526916",
        ["Killing Frenzy"] = "6822465319",
        ["Killing Spree"] = "6822465178",
        ["Killing Spree 1"] = "723054723",
        ["Killing Spree 2"] = "937898383",
        ["KillTrocity"] = "6818544945",
        ["Kombat"] = "8527433497",
        ["LaserSlash"] = "199145497",
        ["Lazer Beam"] = "130791043",
        ["Mario"] = "2815207981",
        ["Mario 2"] = "5709456554",
        ["Minecraft"] = "6361963422",
        ["Minecraft Experience "] = "1053296915",
        ["Neverlose"] = "8726881116",
        ["Oof"] = "4792539171",
        ["Osu"] = "7149919358",
        ["Osu Combobreak"] = "3547118594",
        ["Over Kill"] = "6818526995",
        ["PD Body"] = "4585364605",
        ["PD Head"] = "4585351098",
        ["Pick"] = "1347140027",
        ["Pop"] = "198598793",
        ["Quake Hitsound"] = "4868633804",
        ["RailGunF"] = "199145534",
        ["Rust"] = "1255040462",
        ["Saber"] = "8415678813",
        ["ScreamingKid"] = "5980352978",
        ["Sit Dog"] = "7349055654",
        ["Skeet"] = "4753603610",
        ["Slime"] = "6916371803",
        ["Snow"] = "6455527632",
        ["Splat"] = "12222152",
        ["Steve"] = "4965083997",
        ["Stomp"] = "200632875",
        ["Stone"] = "3581383408",
        ["Taco Bell"] = "5689199277",
        ["TF2 Bat"] = "3333907347",
        ["TF2 Beepo"] = "3466987025",
        ["TF2 HitSound"] = "3455144981",
        ["TF2 Pow"] = "679798995",
        ["TF2 Retro"] = "3466984142",
        ["TF2 Space"] = "3466982899",
        ["TF2 Squasher"] = "3466981613",
        ["TF2 Vortex"] = "3466980212",
        ["TF2 You Suck"] = "1058417264",
        ["Triple kill"] = "6818526855",
        ["Windows XP Ding"] = "489390072",
        ["Windows XP Error"] = "160715357",
    }, 
    ["SoundsIndex"] = {
        "Among Us",
        "AR2 Body",
        "AR2 Head",
        "AR2 Limb",
        "Bag",
        "Baimware",
        "Bamboo",
        "Bambi",
        "BameWare",
        "Bat",
        "BB HitM",
        "BB Kill",
        "Bell",
        "BitchBot",
        "BitchBot Body",
        "BitchBot Head",
        "Body",
        "Bonk",
        "Bop",
        "Bruh",
        "Bubble",
        "Button",
        "Carrier Kill",
        "Click",
        "Clink",
        "Clutch Kill",
        "CoD",
        "Crickets",
        "Crit",
        "Csgo",
        "Ding",
        "Double Kill",
        "Doublekill 1",
        "Doublekill 2",
        "Elevator",
        "EmptyGun",
        "Fart",
        "Fart2",
        "Fatality",
        "Fatality MKX",
        "Fatality Original",
        "FortniteGuns",
        "Gamesense",
        "Grenade Hit",
        "Headshot",
        "HitMarker",
        "HL Crowbar",
        "HL Door",
        "HL Elevator",
        "HL Med Kit",
        "HL Revolver",
        "Kill Imanjaro",
        "Kill Ionaire",
        "Kill Pocalypse",
        "Kill Tacular",
        "Kill Tastrophe",
        "Killing Frenzy",
        "Killing Spree",
        "Killing Spree 1",
        "Killing Spree 2",
        "KillTrocity",
        "Kombat",
        "LaserSlash",
        "Lazer Beam",
        "Mario",
        "Mario 2",
        "Minecraft",
        "Minecraft Experience ",
        "Neverlose",
        "Oof",
        "Osu",
        "Osu Combobreak",
        "Over Kill",
        "PD Body",
        "PD Head",
        "Pick",
        "Pop",
        "Quake Hitsound",
        "RailGunF",
        "Rust",
        "Saber",
        "ScreamingKid",
        "Sit Dog",
        "Skeet",
        "Slime",
        "Snow",
        "Splat",
        "Steve",
        "Stomp",
        "Stone",
        "Taco Bell",
        "TF2 Bat",
        "TF2 Beepo",
        "TF2 HitSound",
        "TF2 Pow",
        "TF2 Retro",
        "TF2 Space",
        "TF2 Squasher",
        "TF2 Vortex",
        "TF2 You Suck",
        "Triple kill",
        "Windows XP Ding",
        "Windows XP Error",
    },
    ["SkinsIndex"] = {};
    ["Knives"] = {};
    ["Gloves"] = {};
    ["Guns"]   = {};
    ["Signals"] = {
        ["KnifeChanged"] = PsmSignal.new();
        ["KnifeSkinChanged"] = PsmSignal.new();
        ["GloveChanged"] = PsmSignal.new();
        ["GunChanged"]   = PsmSignal.new();
        ["GunSkinChanged"] = PsmSignal.new();
    };
    ["ThirdPersonViewmodelOffset"] = CFrameNew(9e9, 9e9, 9e9);
}

for Index, Value in ReplicatedStorage.Assets.Skins:GetChildren() do
    local Name = Value.Name;
    if IsA(Value, "Folder") and not Constants["SkinsIndex"][Name] then
        Constants["SkinsIndex"][Name] = {};
        for _, Skin in Value:GetChildren() do
            local SkinName = Skin.Name
            if Skin and SkinName then
                TableInsert(Constants["SkinsIndex"][Name], Skin.Name)
            end
        end
    end
end

for Index, Value in ReplicatedStorage.Database.Custom.Weapons:GetChildren() do
    if IsA(Value, "ModuleScript") then
        local Data = require(Value);
        if Data["Class"] == "Melee" then
            TableInsert(Constants["Knives"], Value.Name);
        end
        if Data["Class"] == "Glove" then
            TableInsert(Constants["Gloves"], Value.Name);
        end
        if Data["Class"] ~= "Glove" and Data["Class"] ~= "Melee" then
            TableInsert(Constants["Guns"], Value.Name);
        end
    end
end

do
    do
        local Old; Old = hookfunction(getfenv, newcclosure(function(Level, ...)
            local ScriptCalling = getcallingscript()
            if ScriptCalling then
                local Name = tostring(ScriptCalling)
                if Name and Constants["IgnoredScript"][Name] then
                    return Old(Level, ...)
                end
            end
            if not checkcaller() then
                return Old(Level, ...)
            end
        end))
    end
    --[[do -- (fps improvement)
        local Old; Old = hookfunction(workspace.Raycast, function(...)
            local CallingScript = getcallingscript()
            if CallingScript then
                local Name = tostring(CallingScript)
                if Name and Constants["IgnoredScript"][Name] then
                    return nil
                end
            end
            return Old(...)
        end)
    end]]

    do
        -- anti errror
        for Index, Connection in getconnections(ScriptContext.Error) do
            Connection:Disable()
        end
        for Index, Connection in getconnections(LogService.MessageOut) do
            Connection:Disable()
        end
    end
end

local Fonts = {  }; do
	function Fonts:New(Name, Weight, Url)
		writefile(Name .. ".tff", game:HttpGet(Url))
		local FontData = {
			name = Name,
			faces = { {
				name = "Regular",
				weight = Weight,
				style = "Regular",
				assetId = getcustomasset(Name .. ".tff")
			} }
		}
		writefile(Name .. ".json", HttpService:JSONEncode(FontData))
		return Font.new(getcustomasset(Name .. ".json"))
	end
end

local ESP = {
    ["Settings"] = {
        ["Enabled"] = { ["Value"] = false };
        ["Box"] = { 
            ["Value"] = false;
            ["Colors"] = {
                ["High"] = Color3.fromRGB(255, 100, 100);
                ["Low"] = Color3.fromRGB(255, 100, 100);
            };
            ["Fill"] = {
                ["Value"] = false;
                ["Transparency"] = 0.2;
                ["Colors"] = {
                    ["High"] = Color3.fromRGB(255, 100, 100);
                    ["Low"] = Color3.fromRGB(240, 0, 0);
                };
            };
        };
        ["HealthBar"] = {
            ["Value"] = false;
            ["Thickness"] = 1;
            ["Colors"] = {
                ["High"] = Color3.fromRGB(100, 255, 100);
                ["Low"] = Color3.fromRGB(255, 100, 100);
            };
        };
        ["Name"] = {
            ["Value"] = false;
            ["Color"] = Color3.fromRGB(255, 255, 255)
        };
        ["Distance"] = {
            ["Value"] = false;
            ["Color"] = Color3.fromRGB(255, 255, 255)
        };
        ["Tool"] = {
            ["Value"] = false;
            ["Color"] = Color3.fromRGB(255, 255, 255)
        };
        ["FadeDuration"] = 0.5
    };

    ["Entity"] = {  };
}


local Create = function(ClassName: string, Properties: table)
    local Success, Object = pcall(InstanceNew, ClassName)

    if not Success or not Object then warn("Failed to create", ClassName .. "."); return end

    pcall(function()
        for Index, Value in Properties do
            local Property = Object[Index]
            if Typeof(Property) == "EnumItem" then
                Value = Property.EnumType[Value]
            end
            Object[Index] = Value
        end
    end)

    return Object
end

local IsABodyPart = function(Part: BasePart)
    if not Part then return (false); end
    if not Part:IsA("BasePart") then return false end

    local Name = string.lower(Part.Name); -- just incase
    if string.find(Name, "arm") or string.find(Name, "leg") or string.find(Name, "torso") or string.find(Name, "head") or string.find(Name, "foot") or string.find(Name, "hand") then
        return (true);
    end

    return (false);
end

local GetTableSize = function(Table: table, Recursive: boolean)
    local Count = 0
    for _, Value in Table do
        Count += 1
        if Recursive and type(Value) == "table" then
            Count += GetTableSize(Value, true)
        end
    end
    return Count
end

local GetElementsTransparency = function(Element: any) -- just use the thing we have or need to use for an esp bruh
    if Element:IsA("ImageLabel") then
        return ("ImageTransparency");
    elseif Element:IsA("ImageButton") then
        return ("ImageTransparency");
    elseif Element:IsA("UIStroke") then
        return ("Transparency");
    elseif Element:IsA("Frame") then
        return ("BackgroundTransparency");
    elseif Element:IsA("ScrollingFrame") then
        return ("BackgroundTransparency");
    elseif Element:IsA("ViewportFrame") then
        return ("ImageTransparency");
    elseif Element:IsA("TextLabel") then
        return ("TextTransparency");
    elseif Element:IsA("TextButton") then
        return ("TextTransparency");
    elseif Element:IsA("TextBox") then
        return ("TextTransparency");
    elseif Element:IsA("CanvasGroup") then
        return ("GroupTransparency");
    elseif Element:IsA("VideoFrame") then
        return ("Transparency");
    end

    return (nil)
end

do --
    ESP["Font"] 	= Fonts:New("Tahoma", 200, "https://github.com/mental1illness/storage/raw/refs/heads/main/fonts/old-tahoma.ttf");
    ESP["OtherFonts"] 	= Fonts:New("SmallestPixel7", 200, "https://github.com/mental1illness/storage/raw/refs/heads/main/fonts/smallest_pixel-7.ttf");

    ESP["Holder"]           = Create("ScreenGui", {
        ["Parent"]          = gethui();
        ["Enabled"]         = true;
        ["IgnoreGuiInset"]  = true
    })
    ESP["GetBoundingBoxes"] = function(Parts: { BasePart }) -- best one so far
        local MinX, MinY =  math.huge,  math.huge
        local MaxX, MaxY = -math.huge, -math.huge
        local WorldPoints = {}

        for _, Part in Parts do
            local CF    = Part.CFrame
            local HalfX = Part.Size.X * 0.5
            local HalfY = Part.Size.Y * 0.5
            local HalfZ = Part.Size.Z * 0.5

            for VertexIndex = 1, #Constants["Vertices"] do
                local Vertex = Constants["Vertices"][VertexIndex]
                local World  = (CF + vector.create(HalfX * Vertex.X, HalfY * Vertex.Y, HalfZ * Vertex.Z)).Position
                table.insert(WorldPoints, World)

                local Screen = Camera:WorldToViewportPoint(World)
                if Screen.Z > 0 then
                    if Screen.X < MinX then MinX = Screen.X end
                    if Screen.Y < MinY then MinY = Screen.Y end
                    if Screen.X > MaxX then MaxX = Screen.X end
                    if Screen.Y > MaxY then MaxY = Screen.Y end
                end
            end
        end

        if MinX == math.huge then return nil, nil end

        local TopLeftX,     TopLeftY     = MathFloor(MinX), MathFloor(MinY)
        local BottomRightX, BottomRightY = MathFloor(MaxX), MathFloor(MaxY)

        return {
            TopLeft     = Vector2.new(TopLeftX,     TopLeftY),
            TopRight    = Vector2.new(BottomRightX, TopLeftY),
            BottomLeft  = Vector2.new(TopLeftX,     BottomRightY),
            BottomRight = Vector2.new(BottomRightX, BottomRightY),
        }, WorldPoints
    end

    ESP["GetBoundingBoxesFromPoints"] = function(WorldPoints: { Vector3 })
        local MinX, MinY =  math.huge,  math.huge
        local MaxX, MaxY = -math.huge, -math.huge

        for _, Point in WorldPoints do
            local Screen = Camera:WorldToViewportPoint(Point)
            if Screen.Z > 0 then
                if Screen.X < MinX then MinX = Screen.X end
                if Screen.Y < MinY then MinY = Screen.Y end
                if Screen.X > MaxX then MaxX = Screen.X end
                if Screen.Y > MaxY then MaxY = Screen.Y end
            end
        end

        if MinX == math.huge then return nil end

        local TopLeftX,     TopLeftY     = MathFloor(MinX), MathFloor(MinY)
        local BottomRightX, BottomRightY = MathFloor(MaxX), MathFloor(MaxY)

        return {
            TopLeft     = Vector2.new(TopLeftX,     TopLeftY),
            TopRight    = Vector2.new(BottomRightX, TopLeftY),
            BottomLeft  = Vector2.new(TopLeftX,     BottomRightY),
            BottomRight = Vector2.new(BottomRightX, BottomRightY),
        }
    end

    ESP["IsDead"] = function(Character: Model)
        if not Character then return (true) end

        local Humanoid = Character:FindFirstChildOfClass("Humanoid")
        if not Humanoid then return (true) end
        if not Character.PrimaryPart then return (true) end
        if Humanoid.Health <= 0 then return (true) end

        return (false)
    end

    ESP["GetHealth"] = function(Player: Player, Character: Model)
        local HPTable = {
            ["MaxHealth"] = 100;
            ["Health"] = 0;
        }

        if Character then
            local Humanoid = Character:FindFirstChildOfClass("Humanoid");
            if Humanoid then
                HPTable["MaxHealth"] = Humanoid.MaxHealth;
                HPTable["Health"]    = Humanoid.Health;
            end
        end
        
        return (HPTable);
    end

    ESP["DrawElements"] = function(This: table)
        -- holder
        This["Objects"]["Holder"] = Create("Frame", {
            ["BackgroundTransparency"] = 1;
            ["Visible"]                = ESP["Settings"]["Enabled"].Value;
            ["Parent"]                 = ESP["Holder"]
        });
        This["ExcludeFade"]["Holder"] = This["Objects"]["Holder"];
        -- main elements
        
        
        -- settings > box
        This["Objects"]["BoxStroke"] = Create("UIStroke", {
            ["Enabled"]                = ESP["Settings"]["Box"].Value;
            ["Thickness"]              = 1;
            ["LineJoinMode"]           = "Miter";
            ["Color"]                  = Color3.fromRGB(255, 255, 255);
            ["Parent"]                 = This["Objects"]["Holder"];
            ["BorderOffset"]           = UDim.new(0, 1);
            ["ZIndex"]                 = 5;
        });
        This["Objects"]["BoxOutlineStroke"] = Create("UIStroke", {
            ["Enabled"]                = ESP["Settings"]["Box"].Value;
            ["Thickness"]              = 3;
            ["LineJoinMode"]           = "Miter";
            ["Color"]                  = Color3.fromRGB(0, 0, 0);
            ["Parent"]                 = This["Objects"]["Holder"]
        });
        This["Objects"]["BoxGradient"] = Create("UIGradient", {
            ["Color"]    = ColorSequence.new({
                ColorSequenceKeypoint.new(0,    ESP["Settings"]["Box"]["Colors"]["High"]),
                ColorSequenceKeypoint.new(1,    ESP["Settings"]["Box"]["Colors"]["Low"]),
            });
            ["Rotation"] = 90;
            ["Offset"]   = Vector2.new(0, 0);
            ["Parent"]   = This["Objects"]["BoxStroke"];
        });

        -- settings > box > fill

        This["Objects"]["BoxFill"] = Create("Frame", {
            ["BackgroundTransparency"] = ESP["Settings"]["Box"]["Fill"]["Transparency"];
            ["Visible"]                = ESP["Settings"]["Box"]["Fill"].Value;
            ["Size"]                   = UDim2.fromScale(1, 1);
            ["Parent"]                 = This["Objects"]["Holder"];
        });
        This["Objects"]["BoxFillGradient"] = Create("UIGradient", {
            ["Color"]    = ColorSequence.new({
                ColorSequenceKeypoint.new(0,    ESP["Settings"]["Box"]["Fill"]["Colors"]["High"]),
                ColorSequenceKeypoint.new(1,    ESP["Settings"]["Box"]["Fill"]["Colors"]["Low"]),
            });
            ["Rotation"] = 90;
            ["Offset"]   = Vector2.new(0, 0);
            ["Parent"]   = This["Objects"]["BoxFill"];
        });

        This["Objects"]["HealthBarBG"] = Create("Frame", {
            ["BackgroundColor3"]       = Color3.fromRGB(0, 0, 0);
            ["BackgroundTransparency"] = 0.3;
            ["BorderSizePixel"]        = 0;
            ["Position"]               = UDim2.new(0, -(4 + ESP["Settings"]["HealthBar"]["Thickness"] + 1), 0, -2); -- (4 + 2 + 1) 4 == constant 2 == hpbar thickness 1 == how far do you want from the box esp (PX)
            ["Size"]                   = UDim2.new(0, ESP["Settings"]["HealthBar"]["Thickness"], 1, 4);
            ["Parent"]                 = This["Objects"]["Holder"];
            ["ZIndex"]                 = 3;
            ["Visible"]                = false;
        });

        This["Objects"]["HealthBarBGStroke"] = Create("UIStroke", {
            ["Enabled"]                = ESP["Settings"]["Box"].Value;
            ["Thickness"]              = 1;
            ["LineJoinMode"]           = "Miter";
            ["Color"]                  = Color3.fromRGB(0, 0, 0);
            ["Parent"]                 = This["Objects"]["HealthBarBG"]
        });

        This["Objects"]["HealthBarFill"] = Create("Frame", {
            ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
            ["BorderSizePixel"]  = 0;
            ["AnchorPoint"]      = Vector2.new(0, 1);
            ["Position"]         = UDim2.fromScale(0, 1);
            ["Size"]             = UDim2.fromScale(1, 1);
            ["Parent"]           = This["Objects"]["HealthBarBG"];
            ["Visible"]          = true;
            ["ZIndex"]           = 4;
        });

        This["Objects"]["HealthBarFillGradient"] = Create("UIGradient", {
            ["Color"]    = ColorSequence.new({
                ColorSequenceKeypoint.new(0,    ESP["Settings"]["HealthBar"]["Colors"]["High"]),
                ColorSequenceKeypoint.new(1,    ESP["Settings"]["HealthBar"]["Colors"]["Low"]),
            });
            ["Rotation"] = 90;
            ["Offset"]   = Vector2.new(0, 0);
            ["Parent"]   = This["Objects"]["HealthBarFill"];
        });

        This["Objects"]["SideLeft"] = Create("Frame", { Visible = true, Parent = This["Objects"]["Holder"], Size = UDim2.new(1, 0, 1, 0), Position = UDim2.new(-1, -8, 0, -3), BackgroundTransparency = 1, Name = "Left", BorderSizePixel = 0 })
        This["Objects"]["SideRight"] = Create("Frame", { Visible = true, Parent = This["Objects"]["Holder"], Size = UDim2.new(1, 0, 1, 0), Position = UDim2.new(1, 4, 0, -3), BackgroundTransparency = 1, Name = "Right", BorderSizePixel = 0 })
        This["Objects"]["SideBottom"] = Create("Frame", { Visible = true, Parent = This["Objects"]["Holder"], Size = UDim2.new(1, 0, 1, 0), Position = UDim2.new(0, 0, 1, 4), BackgroundTransparency = 1, Name = "Bottom", BorderSizePixel = 0 })
        This["Objects"]["SideTop"] = Create("Frame", { Visible = true, Parent = This["Objects"]["Holder"], Size = UDim2.new(1, 0, 1, 0), Position = UDim2.new(0, 0, -1, -4), BackgroundTransparency = 1, Name = "Top", BorderSizePixel = 0 })


        Create("UIPadding", { 
            PaddingTop = UDim.new(0, 0), 
            PaddingBottom = UDim.new(0, 0), 
            Parent = This["Objects"]["SideLeft"], 
            PaddingRight = UDim.new(0, 4), 
            PaddingLeft = UDim.new(0, 0), 
        })
        Create("UIPadding", { 
            PaddingTop = UDim.new(0, 0), 
            PaddingBottom = UDim.new(0, 0), 
            Parent = This["Objects"]["SideRight"], 
            PaddingRight = UDim.new(0, 0), 
            PaddingLeft = UDim.new(0, 4), 
        })
        Create("UIPadding", { 
            PaddingTop = UDim.new(0, 2), 
            PaddingBottom = UDim.new(0, 0), 
            Parent = This["Objects"]["SideBottom"], 
            PaddingRight = UDim.new(0, 0), 
            PaddingLeft = UDim.new(0, 0), 
        })
        Create("UIPadding", { 
            PaddingTop = UDim.new(0, 0), 
            PaddingBottom = UDim.new(0, 7), 
            Parent = This["Objects"]["SideTop"], 
            PaddingRight = UDim.new(0, 0), 
            PaddingLeft = UDim.new(0, 0), 
        })
        Create("UIListLayout", { Parent = This["Objects"]["SideLeft"], HorizontalAlignment = "Right", Padding = UDim.new(0, 1) })
        Create("UIListLayout", { Parent = This["Objects"]["SideRight"], HorizontalAlignment = "Left", Padding = UDim.new(0, 1) })
        Create("UIListLayout", { Parent = This["Objects"]["SideBottom"], HorizontalAlignment = "Center", VerticalAlignment = "Top", Padding = UDim.new(0, 5) })
        Create("UIListLayout", { Parent = This["Objects"]["SideTop"], HorizontalAlignment = "Center", Padding = UDim.new(0, 1), VerticalAlignment = "Bottom" })
        
        This["Objects"]["NameText"] = Create("TextLabel", {
            ["Text"] = "The Shooter He A Decoy",
            ["FontFace"] = ESP["Font"],
            ["TextSize"] = 12,
            ["BackgroundTransparency"] = 1,
            ["TextColor3"] = ESP["Settings"]["Name"]["Color"],
            ["Parent"] = This["Objects"]["SideTop"]
        })
        This["Objects"]["NameTextShadow"] = Create("TextLabel", {
            ["Text"] = "The Shooter He A Decoy",
            ["FontFace"] = ESP["Font"],
            ["TextSize"] = 12,
            ["TextColor3"] = Color3.fromRGB(0, 0, 0),
            ["Position"] = UDim2.fromOffset(1, 1),
            ["BackgroundTransparency"] = 1,
            ["ZIndex"] = -1,
            ["Parent"] = This["Objects"]["NameText"]
        })
        This["Objects"]["DistanceText"] = Create("TextLabel", {
            ["Text"] = "1m",
            ["FontFace"] = ESP["OtherFonts"],
            ["TextSize"] = 9,
            ["BackgroundTransparency"] = 1,
            ["Size"]     = UDim2.fromOffset(0, 5),
            ["TextColor3"] = ESP["Settings"]["Name"]["Color"],
            ["Parent"] = This["Objects"]["SideBottom"]
        })
        This["Objects"]["DistanceStroke"] = Create("UIStroke", {
            ["Enabled"]                = ESP["Settings"]["Distance"].Value;
            ["Thickness"]              = 1;
            ["LineJoinMode"]           = "Miter";
            ["Color"]                  = Color3.fromRGB(0, 0, 0);
            ["Parent"]                 = This["Objects"]["DistanceText"];
            ["ZIndex"]                 = 1;
        });
        This["Objects"]["ToolText"] = Create("TextLabel", {
            ["Text"] = "AK-47",
            ["FontFace"] = ESP["OtherFonts"],
            ["TextSize"] = 9,
            ["Size"]     = UDim2.fromOffset(0, 5),
            ["BackgroundTransparency"] = 1,
            ["TextColor3"] = ESP["Settings"]["Name"]["Color"],
            ["Parent"] = This["Objects"]["SideBottom"]
        });
        This["Objects"]["ToolStroke"] = Create("UIStroke", {
            ["Enabled"]                = ESP["Settings"]["Distance"].Value;
            ["Thickness"]              = 1;
            ["LineJoinMode"]           = "Miter";
            ["Color"]                  = Color3.fromRGB(0, 0, 0);
            ["Parent"]                 = This["Objects"]["ToolText"];
            ["ZIndex"]                 = 1;
        });

        for Index, Value in {"SideLeft", "SideRight", "SideBottom", "SideTop"} do
            This["ExcludeFade"]["Side" .. Value] = This["Objects"][Value]
        end

        This["SpecifiedTransparency"][This["Objects"]["HealthBarBG"]]   = { ["In"] = 0.3; ["Out"] = 1 };
        This["SpecifiedTransparency"][This["Objects"]["HealthBarFill"]] = { ["In"] = 0;   ["Out"] = 1 };

        This["SpecifiedTransparency"][This["Objects"]["BoxFill"]] = { ["In"] = ESP["Settings"]["Box"]["Fill"]["Transparency"]; ["Out"] = 1 }

        This["Cache"]["Settings"]["BoxColorHigh"] = ESP["Settings"]["Box"]["Colors"]["High"];
        This["Cache"]["Settings"]["BoxColorLow"] = ESP["Settings"]["Box"]["Colors"]["Low"];
        
        This["Cache"]["Settings"]["BoxFillColorHigh"] = ESP["Settings"]["Box"]["Fill"]["Colors"]["High"];
        This["Cache"]["Settings"]["BoxFillColorLow"] = ESP["Settings"]["Box"]["Fill"]["Colors"]["Low"];

        This["Cache"]["Settings"]["HealthColorHigh"] = ESP["Settings"]["HealthBar"]["Colors"]["High"];
        This["Cache"]["Settings"]["HealthColorLow"] = ESP["Settings"]["HealthBar"]["Colors"]["Low"];

        return (This);
    end

    ESP["Fade"] = function(This: table, Duration: number, FadeIn: boolean)
        if not This then return end
        if not This["ActiveTweens"] then return end
        for Index, ExistingTween in This["ActiveTweens"] do
            ExistingTween:Cancel()
        end
        table.clear(This["ActiveTweens"])

        if FadeIn then
            if This["IsFaded"] == false and not This["IsFading"] then return end
        else
            if This["IsFaded"] == true and not This["IsFading"] then return end
        end

        This["IsFading"] = true

        local TargetTransparency = FadeIn and 0 or 1
        local TweenTotal = 0
        local TweenFinished = 0

        for Name, Object in This["Objects"] do
            if not Object or not Object.Parent then continue end

            local Skip = false
            for Index, ExcludedObject in This["ExcludeFade"] do
                if ExcludedObject == Object then
                    Skip = true
                    break
                end
            end
            if Skip then continue end

            local TransparencyProperty = GetElementsTransparency(Object)
            if not TransparencyProperty then continue end

            local Special = This["SpecifiedTransparency"][Object]
            local Final = Special and (FadeIn and Special.In or Special.Out) or TargetTransparency

            TweenTotal += 1

            local Tween = TweenService:Create(
                Object,
                TweenInfo.new(Duration, Enum.EasingStyle.Linear),
                { [TransparencyProperty] = Final }
            )

            table.insert(This["ActiveTweens"], Tween)

            Tween.Completed:Once(function(State)
                if State ~= Enum.PlaybackState.Completed then return end
                TweenFinished += 1

                if TweenFinished >= TweenTotal then
                    This["IsFading"] = false
                    This["IsFaded"] = not FadeIn
                end
            end)

            Tween:Play()
        end

        if TweenTotal == 0 then
            This["IsFading"] = false
            This["IsFaded"] = not FadeIn
        end
    end
    ESP["AddEntity"] = function(Entity: Player)
        local Data = {  };
        print(Entity)
        local Name = Entity.Name
        local This = { 
            ["Objects"]               = {  }; 
            ["ExcludeFade"]           = {  };
            ["SpecifiedTransparency"] = {  };
            ["Functions"]             = {  }; 
            ["Connections"]           = {  }; 
            ["Cache"]                 = { 
                ["BodyParts"]       = {};
                ["Settings"]        = {};
                ["LastPos"]         = nil;
                ["LastCorner"]      = nil;
                ["LastRootPos"]     = nil;
                ["LastWorldPoints"] = nil;
                ["OldJSON"]         = nil;
            };
            ["RootPart"]              = nil;
            ["IsFading"]              = false;
            ["IsFaded"]               = false;
            ["IsDead"]                = false;
            ["IsFadedIn"]             = false;
            ["DrainingHealth"]        = false; -- this looks COOL
            ["ActiveTweens"]          = {   };
        }
        ESP["Entity"][Entity] = This;
        ESP["DrawElements"](This);

        This["Objects"]["NameText"].Text = Name;
        This["Objects"]["NameTextShadow"].Text = Name;

        This["Connections"]["CharacterAdded"] = Entity.CharacterAdded:Connect(function(Character: Model)
            This["Cache"]["BodyParts"]       = {}
            This["Cache"]["LastWorldPoints"] = nil
            This["Cache"]["LastCorner"]      = nil
            This["RootPart"]                 = nil
            This["IsDead"]                   = false
            This["IsFaded"]                  = true
            -- ESP["Fade"](This, ESP["Settings"]["FadeDuration"], true)
            This["IsFadedIn"]                = false
            task.defer(function()
                Character:WaitForChild("HumanoidRootPart")
                Character:WaitForChild("Head")
                local IsTorsoFound = Character:WaitForChild("UpperTorso", 3) or Character:WaitForChild("Torso", 3)
                if not IsTorsoFound then return end

                for Index, Value in GetChildren(Character) do
                    if IsABodyPart(Value) then
                        This["Cache"]["BodyParts"][Value.Name] = Value
                    end
                end

                This["RootPart"] = Character.PrimaryPart
            end)
        end)

        This["Connections"]["CharacterRemoving"] = Entity.CharacterRemoving:Connect(function()
            This["Cache"]["BodyParts"] = {}
            This["RootPart"] = nil
        end)
        
        if Entity.Character then
            task.defer(function() 
                for Index, Value in GetChildren(Entity.Character) do
                    if IsABodyPart(Value) then
                        This["Cache"]["BodyParts"][Value.Name] = Value
                    end
                end
                This["RootPart"] = Entity.Character.PrimaryPart
            end)
        end

        This["Functions"]["Render"] = function()
            if not ESP["Settings"]["Enabled"].Value then
                This["Objects"]["Holder"].Visible = false
                return (false);
            end
            if Client:GetAttribute("Team") == Entity:GetAttribute("Team") then This["Objects"]["Holder"].Visible = false return end

            --[[if not This["RootPart"] or ESP["IsDead"](Entity.Character) == true then -- TODO: make it fade instead
                This["Objects"]["Holder"].Visible = false
                return (false)
            end]]

            local EntityIsDead = not This["RootPart"] or ESP["IsDead"](Entity.Character) == true
            
            if EntityIsDead then
                if not This["IsDead"] then
                    This["IsDead"] = true
                    This["IsFaded"] = false
                    This["IsFadedIn"] = false
                    This["DrainingHealth"] = true
                end

                if This["DrainingHealth"] then
                    local CurrentSize = This["Objects"]["HealthBarFill"].Size
                    local RealY = CurrentSize.Y.Scale + (0 - CurrentSize.Y.Scale) * 0.2
                    
                    This["Objects"]["HealthBarFill"].Size = UDim2.fromScale(1, RealY)
                    
                    if RealY < 0.01 then
                        This["Objects"]["HealthBarFill"].Size = UDim2.fromScale(1, 0)
                        This["DrainingHealth"] = false
                        ESP["Fade"](This, ESP["Settings"]["FadeDuration"], false)
                    end
                end

                local CachedWorldPoints = This["Cache"]["LastWorldPoints"]
                if CachedWorldPoints then
                    local ReprojectedCorners = ESP["GetBoundingBoxesFromPoints"](CachedWorldPoints)
                    if ReprojectedCorners then
                        local ReprojectedSize = ReprojectedCorners.BottomRight - ReprojectedCorners.TopLeft
                        This["Objects"]["Holder"].Position = UDim2.fromOffset(ReprojectedCorners.TopLeft.X, ReprojectedCorners.TopLeft.Y)
                        This["Objects"]["Holder"].Size     = UDim2.fromOffset(ReprojectedSize.X, ReprojectedSize.Y)
                        This["Objects"]["Holder"].Visible  = true
                    else
                        This["Objects"]["Holder"].Visible = false
                    end
                else
                    This["Objects"]["Holder"].Visible = false
                end

                return false
            end

            if not EntityIsDead then
                if not This["IsFadedIn"] then
                    This["IsFadedIn"] = true
                    ESP["Fade"](This, ESP["Settings"]["FadeDuration"], true)
                end
            end

            if This["IsDead"] then
                This["IsDead"]   = false
                This["IsFaded"]  = true
                This["IsFading"] = false
                This["DrainingHealth"] = false
            end

            local Vector, OnScreen = Camera:WorldToViewportPoint(This["RootPart"].CFrame.Position)
            if not OnScreen then
                This["Objects"]["Holder"].Visible = false
                return false
            end
            This["Objects"]["Holder"].Visible = true

            if GetTableSize(This["Cache"]["BodyParts"]) < Constants["MinimumBodyParts"] then
                This["Cache"]["BodyParts"] = {}
                for Index, Value in Entity.Character:GetChildren() do
                    if IsABodyPart(Value) then
                        This["Cache"]["BodyParts"][Value.Name] = Value
                    end
                end
            end
            local Corners, WorldPoints = ESP["GetBoundingBoxes"](This["Cache"]["BodyParts"])
            if not Corners then
                
                This["Objects"]["Holder"].Visible = false

                return (false);
            end

            This["Cache"]["LastWorldPoints"] = WorldPoints
            local BoxSize = Corners.BottomRight - Corners.TopLeft

            This["Objects"]["Holder"].Visible = true
            This["Objects"]["Holder"].Position = UDim2.fromOffset(Corners.TopLeft.X, Corners.TopLeft.Y)
            This["Objects"]["Holder"].Size     = UDim2.fromOffset(BoxSize.X, BoxSize.Y)
            This["Cache"]["LastCorner"] = Corners
            This["Cache"]["LastRootPos"] = This["RootPart"].CFrame.Position

            do -- Update
                do -- Box
                    if This["Objects"]["BoxGradient"] then
                        if This["Cache"]["Settings"]["BoxColorHigh"] ~= ESP["Settings"]["Box"]["Colors"]["High"] or This["Cache"]["Settings"]["BoxColorLow"] ~= ESP["Settings"]["Box"]["Colors"]["Low"] then
                            This["Objects"]["BoxGradient"].Color = ColorSequence.new({
                                ColorSequenceKeypoint.new(0,    ESP["Settings"]["Box"]["Colors"]["High"]),
                                ColorSequenceKeypoint.new(1,    ESP["Settings"]["Box"]["Colors"]["Low"]),
                            });
                            This["Cache"]["Settings"]["BoxColorHigh"] = ESP["Settings"]["Box"]["Colors"]["High"];
                            This["Cache"]["Settings"]["BoxColorLow"] = ESP["Settings"]["Box"]["Colors"]["Low"];
                        end
                    end

                    if This["Objects"]["BoxStroke"].Enabled ~= ESP["Settings"]["Box"]["Value"] or This["Objects"]["BoxOutlineStroke"].Enabled ~= ESP["Settings"]["Box"]["Value"] then
                        This["Objects"]["BoxStroke"].Enabled = ESP["Settings"]["Box"]["Value"];
                        This["Objects"]["BoxOutlineStroke"].Enabled = ESP["Settings"]["Box"]["Value"];
                    end
                    do -- Box/Fill
                        if This["Objects"]["BoxFill"] then
                            if This["Cache"]["Settings"]["BoxFillColorHigh"] ~= ESP["Settings"]["Box"]["Fill"]["Colors"]["High"] or This["Cache"]["Settings"]["BoxFillColorLow"] ~= ESP["Settings"]["Box"]["Fill"]["Colors"]["Low"] then
                                This["Objects"]["BoxFillGradient"].Color = ColorSequence.new({
                                    ColorSequenceKeypoint.new(0, ESP["Settings"]["Box"]["Fill"]["Colors"]["High"]),
                                    ColorSequenceKeypoint.new(1, ESP["Settings"]["Box"]["Fill"]["Colors"]["Low"]),
                                })
                                This["Cache"]["Settings"]["BoxFillColorHigh"] = ESP["Settings"]["Box"]["Fill"]["Colors"]["High"]
                                This["Cache"]["Settings"]["BoxFillColorLow"]  = ESP["Settings"]["Box"]["Fill"]["Colors"]["Low"]
                            end

                            local FillTransparency = ESP["Settings"]["Box"]["Fill"]["Transparency"]
                            if This["Cache"]["Settings"]["BoxFillTransparency"] ~= FillTransparency then
                                This["Cache"]["Settings"]["BoxFillTransparency"] = FillTransparency
                                This["Objects"]["BoxFill"].BackgroundTransparency = FillTransparency
                                This["SpecifiedTransparency"][This["Objects"]["BoxFill"]] = {
                                    ["In"]  = FillTransparency;
                                    ["Out"] = 1;
                                }
                            end

                            if This["Objects"]["BoxFill"].Visible ~= ESP["Settings"]["Box"]["Fill"]["Value"] then
                                This["Objects"]["BoxFill"].Visible = ESP["Settings"]["Box"]["Fill"]["Value"]
                            end
                        end
                    end
                    do -- Name/Esp
                        if This["Objects"]["NameText"] then
                            local Color = ESP["Settings"]["Name"]["Color"];
                            local IsEnabled = ESP["Settings"]["Name"]["Value"];

                            if This["Objects"]["NameText"].Visible ~= IsEnabled then
                                This["Objects"]["NameText"].Visible = IsEnabled;
                                This["Objects"]["NameTextShadow"].Visible = IsEnabled;
                            end

                            if This["Objects"]["NameText"].TextColor3 ~= Color then
                                This["Objects"]["NameText"].TextColor3 = Color;
                            end

                        end
                    end
                    
                    do -- Tool
                        if This["Objects"]["ToolText"] then
                            local IsEnabled = ESP["Settings"]["Tool"]["Value"]

                            if This["Objects"]["ToolText"].Visible ~= IsEnabled then
                                This["Objects"]["ToolText"].Visible = IsEnabled
                                This["Objects"]["ToolText"].Parent = IsEnabled and This["Objects"]["SideBottom"] or This["Objects"]["Holder"]
                            end
                            if This["Objects"]["ToolStroke"].Enabled ~= IsEnabled then
                                This["Objects"]["ToolStroke"].Enabled = IsEnabled
                            end

                            if IsEnabled then
                                local CurrentEquipped = GetAttribute(Entity, "CurrentEquipped")

                                local CanIGo = true;

                                if This["Cache"]["OldJSON"] ~= CurrentEquipped then
                                    This["Cache"]["OldJSON"] = CurrentEquipped
                                    CanIGo = false
                                end
                                if not CanIGo then
                                    local IsOkay, Returned = pcall(function()
                                        return HttpService:JSONDecode(CurrentEquipped or "")
                                    end)

                                    if IsOkay then
                                        if This["Objects"]["ToolText"].Text ~= Returned.Name then
                                            This["Objects"]["ToolText"].Text = Returned.Name
                                        end
                                    end
                                end

                                local Color = ESP["Settings"]["Tool"]["Color"]
                                if This["Objects"]["ToolText"].TextColor3 ~= Color then
                                    This["Objects"]["ToolText"].TextColor3 = Color
                                end
                            end
                        end
                    end

                    do -- Distance
                        if This["Objects"]["DistanceText"] then
                            local IsEnabled = ESP["Settings"]["Distance"]["Value"]

                            if This["Objects"]["DistanceText"].Visible ~= IsEnabled then
                                This["Objects"]["DistanceText"].Visible = IsEnabled
                                This["Objects"]["DistanceText"].Parent = IsEnabled and This["Objects"]["SideBottom"] or This["Objects"]["Holder"]
                            end
                            if This["Objects"]["DistanceStroke"].Enabled ~= IsEnabled then
                                This["Objects"]["DistanceStroke"].Enabled = IsEnabled
                            end

                            if IsEnabled then
                                local Distance = 0
                                if This["RootPart"] then
                                    Distance = MathFloor((This["RootPart"].Position - Camera.CFrame.Position).Magnitude)
                                end

                                local DistanceText = Distance .. "m"
                                if This["Objects"]["DistanceText"].Text ~= DistanceText then
                                    This["Objects"]["DistanceText"].Text = DistanceText
                                end

                                local Color = ESP["Settings"]["Distance"]["Color"]
                                if This["Objects"]["DistanceText"].TextColor3 ~= Color then
                                    This["Objects"]["DistanceText"].TextColor3 = Color
                                end
                            end
                        end
                    end
                    do -- HealthBar
                        if This["Objects"]["HealthBarBG"].Visible ~= ESP["Settings"]["HealthBar"]["Value"] then
                            This["Objects"]["HealthBarBG"].Visible        = ESP["Settings"]["HealthBar"]["Value"];
                            This["Objects"]["HealthBarBGStroke"].Enabled  = ESP["Settings"]["HealthBar"]["Value"];
                        end

                        if ESP["Settings"]["HealthBar"]["Value"] then
                            This["Objects"]["SideLeft"].Position = UDim2.new(-1, -(6 + ESP["Settings"]["HealthBar"]["Thickness"] + 1), 0, -3)
                        else
                            This["Objects"]["SideLeft"].Position = UDim2.new(-1, -4, 0, -3)
                        end

                        if This["Objects"]["HealthBarFill"] then
                            if This["Cache"]["Settings"]["HealthColorHigh"] ~= ESP["Settings"]["HealthBar"]["Colors"]["High"] or This["Cache"]["Settings"]["HealthColorLow"] ~= ESP["Settings"]["HealthBar"]["Colors"]["Low"] then
                                This["Objects"]["HealthBarFillGradient"].Color = ColorSequence.new({
                                    ColorSequenceKeypoint.new(0,    ESP["Settings"]["HealthBar"]["Colors"]["High"]),
                                    ColorSequenceKeypoint.new(1,    ESP["Settings"]["HealthBar"]["Colors"]["Low"]),
                                });
                                This["Cache"]["Settings"]["HealthColorHigh"] = ESP["Settings"]["HealthBar"]["Colors"]["High"];
                                This["Cache"]["Settings"]["HealthColorLow"] = ESP["Settings"]["HealthBar"]["Colors"]["Low"];
                            end
                        end

                        if ESP["Settings"]["HealthBar"]["Value"] then
                            local HealthData   = ESP["GetHealth"](Entity, Entity.Character)
                            local Ratio  = math.clamp(HealthData["Health"] / math.max(HealthData["MaxHealth"], 1), 0, 1)

                            local CurrentSize  = This["Objects"]["HealthBarFill"].Size
                            local RealY    = CurrentSize.Y.Scale + (Ratio - CurrentSize.Y.Scale) * 0.2

                            This["Objects"]["HealthBarFill"].Size = UDim2.fromScale(1, RealY)
                        end
                    end
                end
            end
            
            return (true);
        end;

        This["Functions"]["Kill"] = function()
            for Index, Connection in This["Connections"] do
                Connection:Disconnect()
            end

            This["Objects"]["Holder"]:Destroy()
            ESP["Entity"][Entity] = nil
        end;
    end
    ESP["RemoveEntity"] = function(Player: Player)
        local This = ESP["Entity"][Player]
        This["Functions"]["Kill"]()
    end
    for Index, Value in Players:GetPlayers() do
        ESP["AddEntity"](Value)
    end
    Players.PlayerAdded:Connect(function(Player)
        repeat task.wait() until Player.Name ~= nil
        ESP["AddEntity"](Player)
    end)
    Players.PlayerRemoving:Connect(function(Player)
        ESP["RemoveEntity"](Player)
    end)
end

local Menu = loadstring(game:HttpGet("https://gist.githubusercontent.com/wristslashing1337/2fbe36ec4f6df04fb61751d7d916f6f6/raw/38021ed34e15818bc80bc593730543a9d4387d8c/OoIThinkHeGotCapturedByThePDiddler.luau"))() do

    local Images = Menu.Images
    local MenuTheme = Menu.Theme

    local Library = Menu.Library
    local Flags = Menu.Flags

    local ScreenGui = Menu.Draw("ScreenGui", {
        Name = "",
        Parent = gethui(),
        IgnoreGuiInset = true,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
    })

    local _ModalButton = Menu.Draw("TextButton", {
        Text = "",
        Size = UDim2.fromOffset(0, 0),
        ZIndex = 9999,
        Parent = ScreenGui,
    })

    local Environment
    local Theme

    local Dock

    local Tab
    local Section
    local MultiSection

    local Tree

    local Watermark
    local KeybindsList

    local MouseBehaviour
    local IconEnabled
    local DockEnabled = true

    local Window = Menu.Library:Window({ Name = "moneyhack.cc", HasTabs = true, Visible = true, Bind = Enum.KeyCode.Delete, Callback = function(Boolean)
        _ModalButton.Modal = Boolean
        if _DrawingObject and _DrawingObject.Cursors then
            _DrawingObject.Cursors.Main.Visible = Boolean
            _DrawingObject.Cursors.Shadow.Visible = Boolean
            _DrawingObject.Cursors.Main.Color = Menu.Theme.Accent["A"]
            _DrawingObject.Cursors.Shadow.Color = Color3.fromRGB(0, 0, 0)
        end
    end })

    local Environment = Menu.Library:Window({
        Name = "Environment",
        Size = UDim2.new(0, 589, 0, 402),
        Bind = "none",
        Visible = false,
        HasTabs = true,
        Disabled = true
    })

    local Theme = Menu.Library:Window({
        Name = "Theme",
        Size = UDim2.new(0, 450, 0, 274),
        Bind = "none",
        Visible = false,
        Disabled = true
    })

    local Tabs = { 
        ["Legitbot"] = Window:Tab({ Name = "Legit" }),
        ["Ragebot"] = Window:Tab({ Name = "Rage" }),
        ["Visuals"] = Window:Tab({ Name = "Visuals" }),
        ["Misc"] = Window:Tab({ Name = "Misc" }),
    } do

        do -- Legit tab
            local Tab = Tabs.Legitbot
            local Section1 = Tab:Section({ Name = "Aim Assistance", Size = 300 })
            local Section2 = Tab:Section({ Name = "Trigger Bot", Fill = false, Size = 229 })
            local Section3 = Tab:Section({ Name = "Bullet Redirection", Fill = true,  Side = "Right" })

            do -- Section2
                Section2:Toggle({Name = "Enabled", Flag = "Legit_Triggerbot"}):Keybind({Mode = "Toggle", Flag = "Legit_Triggerbot_Keybind", Name = "Triggerbot"})
                Section2:Toggle({Name = "Use Autowall", Flag = "Legit_Triggerbot_AutoWall"})
                Section2:Dropdown({Name = "Hitboxes", Options = {"Head", "Torso", "Arms", "Legs", "Closest"}, Default = {"Head"}, Flag = "Legit_Triggerbot_Hitpart"})
                Section2:Slider({Name = "Reaction Time", Min = 0, Max = 950, Default = 115, Prefix = "ms", Flag = "Legit_Triggerbot_ReactionTime"})
                Section2:Slider({Name = "FOV", Min = 1, Max = 25, Default = 5, Decimals = 0.1, Prefix = "°", Flag = "Legit_Triggerbot_FOV"})
                Section2:Slider({Name = "Max Distance", Min = 1, Max = 2000, Default = 500, Prefix = "m", Flag = "Legit_Triggerbot_MaxDistance"})
            end
            do -- Section3
                Section3:Toggle({Name = "Enabled", Flag = "Legit_BulletRedirection"}):Keybind({Mode = "Toggle", Flag = "Legit_BulletRedirection_Keybind", Name = "Silent Aim"})
                Section3:Toggle({Name = "Use Autowall", Flag = "Legit_BulletRedirection_AutoWall"})
                Section3:Dropdown({Name = "Hitboxes", Options = {"Head", "Torso", "Arms", "Legs", "Closest"}, Default = {"Head"}, Flag = "Legit_BulletRedirection_Hitpart"})
                Section3:Slider({Name = "FOV", Flag = "Legit_BulletRedirection_FOV", Min = 1, Max = 90, Default = 40, Decimals = 0.1, Prefix = "°"})
                -- Section3:Slider({Name = "Max Distance", Min = 1, Max = 2000, Default = 500, Prefix = "m", Flag = "Legit_BulletRedirection_MaxDistance"})
                Section3:Slider({Name = "Hit Chance", Min = 1, Max = 100, Default = 45, Prefix = "%", Flag = "Legit_BulletRedirection_HitChance"})
            end
        end

        do -- Ragebot
 
        end
        do -- Misc
            local Tab = Tabs["Misc"]
            local MovementSection = Tab:Section({ Name = "Movement", Fill = true })
            local MiscSection = Tab:Section({ Name = "Misc", Side = "Right", Size = 300 })
            local ExploitSection = Tab:Section({ Name = "Exploit", Side = "Right", Size = 229 })

            do -- Main
                MovementSection:Toggle({ Name = "Speed Hack" , Category = "Movement", Flag = "SpeedHack", Unsafe = false });
                MovementSection:Slider({ Name = "Speed Hack Velocity", Category = "Movement", Flag = "SpeedHackVelocity", Decimals = 1, Min = 1, Max = 30, Default = 1, Prefix = " studs/s"});
                MovementSection:Toggle({ Name = "Auto Jump" , Category = "Movement", Flag = "AutoJump", Unsafe = false });
            end

            do -- Main
                ExploitSection:Toggle({ Name = "Bypass Team Balance Check" , Category = "Exploit", Flag = "BypassTeamBalance", Unsafe = false });
                ExploitSection:Toggle({ Name = "Bypass Fall Damage" , Category = "Exploit", Flag = "BypassFallDMG", Unsafe = false });
                ExploitSection:Toggle({ Name = "Force BackStab" , Category = "Exploit", Flag = "ForceBackStab", Unsafe = false });
                ExploitSection:Toggle({ Name = "Override Ping" , Category = "Exploit", Flag = "SpoofPing", Unsafe = false, Callback = function()
                    Remotes.Player.ReportPlayerConnect.Send()
                end});
                ExploitSection:Slider({ Name = "Override Ping Amount", Category = "Exploit", Flag = "SpoofPingValue", Decimals = 0.1, Min = 1, Max = 999, Default = 2569, Prefix = "MS", Callback = function()
                    Remotes.Player.ReportPlayerConnect.Send()
                end});
                local Random = ExploitSection:ExpandableToggle({ Name = "Randomize Override Ping Amount" , Category = "Exploit", Flag = "RandomPingShit", Unsafe = false, Size = 50 });
                local _Min = Random:Slider({ Name = "Min", Category = "Exploit", Flag = "MinPingRandom", Decimals = 0.1, Min = 1, Max = 999, Default = 1500, Prefix = "MS", Callback = function()
                    Remotes.Player.ReportPlayerConnect.Send()
                end});
                Random:Slider({ Name = "Max", Category = "Exploit", Flag = "MaxPingRandom", Decimals = 0.1, Min = 1, Max = 999, Default = 2569, Prefix = "MS", Callback = function(Value)
                    if _Min then
                        _Min.SetMax(Value)
                    end
                    Remotes.Player.ReportPlayerConnect.Send()
                end});
            end

            do -- Misc
                MiscSection:Toggle({ Name = "Hit Sounds" , Category = "Misc", Flag = "HitSound", Unsafe = false });
                MiscSection:Dropdown({Name = "Hit Sounds List", Flag = "HitSoundList", Options = Constants["SoundsIndex"], Default = "BitchBot", Size = 200, Category = "Misc"})
                MiscSection:Slider({ Name = "Hit Sounds Volume", Category = "Misc", Flag = "HitSoundVolume", Decimals = 0.1, Min = 1, Max = 10, Default = 1, Prefix = "Vol"})

                MiscSection:Toggle({ Name = "Kill Sounds", Category = "Misc", Flag = "KillSound", Unsafe = false })
                MiscSection:Dropdown({Name = "Kill Sounds List", Flag = "KillSoundList", Options = Constants["SoundsIndex"], Default = "Sit Dog", Size = 200, Category = "Misc"})
                MiscSection:Slider({ Name = "Kill Sounds Volume", Category = "Misc", Flag = "KillSoundVolume", Decimals = 0.1, Min = 1, Max = 10, Default = 1, Prefix = "Vol"})
                local SkinChanger = MiscSection:ExpandableToggle({ Name = "Inventory Changer" , Category = "Misc", Flag = "EnableChanger", Unsafe = false, Size = 229 });
                SkinChanger:Toggle({ Name = "Knife Changer", Category = "Misc", Flag = "KnifeChanger", Unsafe = false });

                local SkinsList_Knife, GlovesList, GunSkinList = nil;

                local Data = SkinChanger:TextBox({ Name = "", Flag = "GunSkinChanger_Data" })
                Data:Hide()

                SkinChanger:Dropdown({Name = "Knife Changer List", Flag = "KnifeChangerList", Options = Constants["Knives"], Default = Constants["Knives"][1], Size = 200, Category = "Misc", Callback = function(Knife)
                    Constants["Signals"]["KnifeChanged"]:Fire(Knife, SkinsList_Knife)
                end});
                SkinsList_Knife = SkinChanger:Dropdown({Name = "Knife Changer Skins List", Flag = "KnifeChangerSkinsList", Options = Constants["SkinsIndex"][Constants["Knives"][1]], Default = Constants["SkinsIndex"][Constants["Knives"][1]][1], Size = 200, Category = "Misc", Callback = function()
                    Constants["Signals"]["KnifeSkinChanged"]:Fire()
                end});

                SkinChanger:Toggle({ Name = "Glove Changer", Category = "Misc", Flag = "GloveChanger", Unsafe = false });
                SkinChanger:Dropdown({ Name = "Glove Changer List", Flag = "GloveChangerList", Options = Constants["Gloves"], Default = Constants["Gloves"][1], Size = 200, Category = "Misc", Callback = function(Glove)
                    Constants["Signals"]["GloveChanged"]:Fire(Glove, GlovesList)
                end });
                GlovesList = SkinChanger:Dropdown({ Name = "Glove Changer Skins List", Flag = "GloveChangerSkinsList", Options = Constants["SkinsIndex"][Constants["Gloves"][1]], Default = Constants["SkinsIndex"][Constants["Gloves"][1]][1], Size = 200, Category = "Misc" });
                
                SkinChanger:Toggle({ Name = "Gun Changer", Category = "Misc", Flag = "GunSkinChanger", Unsafe = false });
                SkinChanger:Dropdown({ Name = "Gun List", Flag = "GunSkinChangerList", Options = Constants["Guns"], Default = Constants["Guns"][1], Size = 200, Category = "Misc", Callback = function(Gun)
                    Constants["Signals"]["GunChanged"]:Fire(Gun, GunSkinList)
                end });
                GunSkinList = SkinChanger:Dropdown({ Name = "Gun Changer Skins List", Flag = "GunSkinChangerSkinsList", Options = Constants["SkinsIndex"][Constants["Guns"][1]], Default = Constants["SkinsIndex"][Constants["Guns"][1]][1], Size = 200, Category = "Misc", Callback = function(Skin)
                    local Gun = Menu.Flags["Misc"].GunSkinChangerList.Value
                    Constants["Signals"]["GunSkinChanged"]:Fire(Gun, Skin)
                end });
            end

        end
        do -- Visuals
            local Tab = Tabs["Visuals"];

            do -- ESP Section
                local Sections, MultiSection = Tab:MultiSection({
                    Name = "Player ESP",
                    Side = "Left",
                    Size = 300,
                    OpenIndex = 1,
                    Sections = { "Enemies", "Settings" }
                })
                local MainSection = Sections[1];
                local SettingsSection = Sections[2];
                do
                    MainSection:Toggle({ Name = "Enabled", Flag = "ESP/Enabled", Callback = function(Bool)
                        ESP["Settings"]["Enabled"]["Value"] = Bool
                    end })

                    local BoxToggle = MainSection:Toggle({ Name = "Box", Flag = "ESP/Box", Callback = function(Bool)
                        ESP["Settings"]["Box"]["Value"] = Bool
                    end })
                    BoxToggle:Colorpicker({ Name = "Box High", Color = Color3.fromRGB(255, 100, 100), Flag = "ESP/BoxHigh", Callback = function(Color)
                        ESP["Settings"]["Box"]["Colors"]["High"] = Color
                    end })
                    BoxToggle:Colorpicker({ Name = "Box Low", Color = Color3.fromRGB(255, 100, 100), Flag = "ESP/BoxLow", Callback = function(Color)
                        ESP["Settings"]["Box"]["Colors"]["Low"] = Color
                    end })

                    local BoxFillToggle = MainSection:Toggle({ Name = "Box Fill", Flag = "ESP/BoxFill", Callback = function(Bool)
                        ESP["Settings"]["Box"]["Fill"]["Value"] = Bool
                    end })
                    BoxFillToggle:Colorpicker({ Name = "Box Fill High", Color = Color3.fromRGB(255, 100, 100), Flag = "ESP/BoxFillHigh", Callback = function(Color)
                        ESP["Settings"]["Box"]["Fill"]["Colors"]["High"] = Color
                    end })
                    BoxFillToggle:Colorpicker({ Name = "Box Fill Low", Color = Color3.fromRGB(240, 0, 0), Flag = "ESP/BoxFillLow", Callback = function(Color)
                        ESP["Settings"]["Box"]["Fill"]["Colors"]["Low"] = Color
                    end })
                    MainSection:Slider({
                        Name = "Box Fill Transparency",
                        Min = 0,
                        Max = 1,
                        Default = 0.2,
                        Decimals = 0.05,
                        Callback = function(Value)
                            ESP["Settings"]["Box"]["Fill"]["Transparency"] = Value
                        end
                    })

                    local HealthBarToggle = MainSection:Toggle({ Name = "Health Bar", Flag = "ESP/HealthBar", Callback = function(Bool)
                        ESP["Settings"]["HealthBar"]["Value"] = Bool
                    end })
                    HealthBarToggle:Colorpicker({ Name = "Health Bar High", Color = Color3.fromRGB(100, 255, 100), Flag = "ESP/HealthBarHigh", Callback = function(Color)
                        ESP["Settings"]["HealthBar"]["Colors"]["High"] = Color
                    end })
                    HealthBarToggle:Colorpicker({ Name = "Health Bar Low", Color = Color3.fromRGB(255, 100, 100), Flag = "ESP/HealthBarLow", Callback = function(Color)
                        ESP["Settings"]["HealthBar"]["Colors"]["Low"] = Color
                    end })

                    local NameToggle = MainSection:Toggle({ Name = "Name", Flag = "ESP/Name", Callback = function(Bool)
                        ESP["Settings"]["Name"]["Value"] = Bool
                    end })
                    NameToggle:Colorpicker({ Name = "Name Color", Color = Color3.fromRGB(255, 255, 255), Flag = "ESP/NameColor", Callback = function(Color)
                        ESP["Settings"]["Name"]["Color"] = Color
                    end })

                    local DistanceToggle = MainSection:Toggle({ Name = "Distance", Flag = "ESP/Distance", Callback = function(Bool)
                        ESP["Settings"]["Distance"]["Value"] = Bool
                    end })
                    DistanceToggle:Colorpicker({ Name = "Distance Color", Color = Color3.fromRGB(255, 255, 255), Flag = "ESP/DistanceColor", Callback = function(Color)
                        ESP["Settings"]["Distance"]["Color"] = Color
                    end })

                    local ToolToggle = MainSection:Toggle({ Name = "Tool", Flag = "ESP/Tool", Callback = function(Bool)
                        ESP["Settings"]["Tool"]["Value"] = Bool
                    end })
                    ToolToggle:Colorpicker({ Name = "Tool Color", Color = Color3.fromRGB(255, 255, 255), Flag = "ESP/ToolColor", Callback = function(Color)
                        ESP["Settings"]["Tool"]["Color"] = Color
                    end })

                    SettingsSection:Slider({
                        Name = "Fade Duration",
                        Min = 0,
                        Max = 2,
                        Default = 0.5,
                        Decimals = 0.1,
                        Callback = function(Value)
                            ESP["Settings"]["FadeDuration"] = Value
                        end
                    })
                end
            end

            do -- Camera Section
                local Camera = Tab:Section({ Name = "Camera", Side = "Left", Size = 229 });
                Camera:Toggle({
                    Name = "Third Person",
                    Flag = "VisualThirdPerson"
                }):Keybind({
                    Default = Enum.KeyCode.T,
                    Modes = {},
                    Mode = "Toggle",
                    Name = "Third Person",
                    Flag = "ThirdPersonKey",
                    ExcludeList = false
                })
                
                Camera:Slider({Name = "Distance", Min = 0, Max = 10, Default = 1, Decimals = 1, Category = "Visuals", Flag = "ThirdPersonDist"})
            end

            do -- World Section
                local World = Tab:Section({ Name = "World", Side = "Right", Fill = true })
                
            end

        end


        Tab = Window:Tab({
            Name = "Settings"
        })
        do
            Section = Tab:Section({
                Name = "Settings",
                Fill = true
            })
            do
                Section:Toggle({
                    Name = "Dock Enabled",
                    Flag = "Dock Enabled",
                    Default = true,
                    Callback = function(Value)
                        if Dock then
                            Dock.Enable(Value)
                        end
                    end
                }):Keybind({
                    Default = Enum.KeyCode.Insert,
                    Modes = {},
                    Mode = "Toggle",
                    Flag = "Dock Keybind",
                    ExcludeList = true
                })

                Section:Label({
                    Text = "Menu Key"
                }):Keybind({
                    Default = Enum.KeyCode.RightAlt,
                    Modes = {},
                    Mode = "Toggle",
                    Flag = "Menu Keybind",
                    ExcludeList = true,
                    Changed = function(Value)
                        local InputName = Value[2]

                        Window.Key = InputName and Enum[Value[1]][InputName]
                    end
                })

                Section:Label({
                    Text = "Additional Menu Key"
                }):Keybind({
                    Default = {},
                    Modes = {},
                    Mode = "Toggle",
                    Flag = "Additional Menu Keybind",
                    ExcludeList = true,
                    Changed = function(Value)
                        local InputName = Value[2]
                        local Keybind = InputName and Enum[Value[1]][InputName]

                        Environment.Key = Keybind
                        Theme.Key = Keybind
                        -- Activity.Key = Keybind
                    end
                })

                Section:Slider({
                    Name = "FPS Limit",
                    Min = 30,
                    Max = 999,
                    Default = 144,
                    Callback = function(Value)
                        setfpscap(Value)
                    end
                })

                Section:TextBox({
                    Name = "Custom Title",
                    Flag = "Custom Title",
                    Default = "moneyhack.cc | {date}",
                    Placeholder = "{date}",
                    Callback = function(Text)
                        Dock.SetText(string.gsub(Text, "{date}", os.date("%B. %d, %Y")))
                    end
                })

                Section:TextBox({
                    Name = "Custom Watermark",
                    Flag = "Custom Watermark",
                    Default = "moneyhack.cc | {date}",
                    Placeholder = "{date} - {uid} - {fps} - {ping}"
                })

                Section:Button({
                    Name = "Reset Position",
                    Callback = function()
                        Watermark.Outline.Position = UDim2.new(1, -23, 0, 23)
                    end
                })
            end

            Section = Tab:Section({
                Name = "Configurations",
                Side = "Right",
                Fill = true
            })
            do
                local Options = Menu.Config("List")

                local ConfigList = Section:Dropdown({
                    Name = "Config",
                    Flag = "Config List",
                    Exclude = true,
                    Options = Options,
                    Default = Options[1],
                    Size = 125
                })

                local ConfigTextBox = Section:TextBox({
                    Placeholder = "Config Name",
                    Default = ""
                })

                Section:Button({
                    Name = "New",
                    CallbackText = "Created!",
                    Callback = function()
                        local String = ConfigTextBox.Get()

                        if String then
                            Menu.Config("New", String)

                            local List = Menu.Config("List")

                            ConfigList.Options = List
                            ConfigList.Set(List[1])
                        end
                    end
                })

                Section:Button({
                    Name = "Save",
                    CallbackText = "Saved!",
                    Callback = function()
                        local String = ConfigList.Get()

                        if String then
                            Menu.Config("Save", String)
                        end
                    end
                })

                Section:Button({
                    Name = "Load",
                    CallbackText = "Loaded!",
                    Callback = function()
                        local String = ConfigList.Get()

                        if String then
                            Menu.Config("Load", String)

                            Library:Notify({
                                Text = string.format("Loaded config: %s", String),
                                Time = 3
                            })
                        end
                    end
                })

                Section:Button({
                    Name = "Set Autoload",
                    CallbackText = "Set!",
                    Callback = function()
                        local String = ConfigList.Get()

                        if String then
                            Menu.Config("Set Autoload", String)
                        end
                    end
                })

                Section:Button({
                    Name = "Reset",
                    CallbackText = "Reset!",
                    Confirm = true,
                    Callback = function()
                        local String = ConfigList.Get()

                        if String then
                            Menu.Config("Reset", String)
                        end
                    end
                })

                Section:Button({
                    Name = "Refresh",
                    CallbackText = "Refreshed!",
                    Callback = function()
                        local List = Menu.Config("List")
                        local FirstValue = List[1]

                        ConfigList.Close()

                        ConfigList.Options = List

                        if FirstValue then
                            ConfigList.Set(FirstValue)
                        else
                            ConfigList.Value = nil

                            ConfigList.Update()
                        end
                    end
                })

                Section:Button({
                    Name = "Delete",
                    CallbackText = "Deleted!",
                    Confirm = true,
                    Callback = function()
                        local String = ConfigList.Get()

                        if String then
                            Menu.Config("Delete", String)

                            local List = Menu.Config("List")

                            ConfigList.Options = List
                            ConfigList.Set(List[1])
                        end
                    end
                })
            end
        end
    end

    do
        local Tab = Environment:Tab({ Name = "Players", Opened = true })

        local SearchString = ""

        Tab:Bar({
            Side = "Fill",
            TextBox = true,
            Placeholder = "Search Players...",
            Callback = function(String)
                SearchString = String:lower()
            end
        })

        local Section = Tab:ContentBox({ Side = "Fill", Size = 312 })

        local OptionsTab = Environment:Tab({ Name = "Options" })
        local OptionsSection = OptionsTab:ContentBox({ Side = "Fill", Size = 334 })

        local ListLabel = OptionsSection:Label({ Text = "Select a player" })

        local PlayerList = Section:List({
            Options = {},
            Clickable = true,
            Flag = "Player List",
            Rows = { "Player", "Team", "Priority" },
            Callback = function(String)
                local Player = Players:FindFirstChild(String)
                if Player then
                    local Team = Player:GetAttribute("Team") or (Player.Team and Player.Team.Name) or "Neutral"

                    ListLabel.SetText(string.format(
                        "Display Name: %s\nUsername: %s\nUser Id: %d\nTeam: %s",
                        Player.DisplayName,
                        Player.Name,
                        Player.UserId,
                        tostring(Team)
                    ))
                end
            end
        })
    end

    Theme = Library:Window({
        Name = "Theme",
        Size = UDim2.new(0, 450, 0, 274),
        Bind = "none",
        Visible = false,
        Disabled = true
    })
    do
        local Bar

        Bar = Theme:Bar({
            Side = "Fill",
            ButtonsSide = "Center",
            Buttons = {
                {
                    "Default.json",
                    function(Value)
                        Menu.ConfigTheme("Load", Value)

                        MenuTheme = Menu.Theme

                        Flags["Menu Outline Color"].FromRGB(MenuTheme.Outline, false)

                        Flags["Accent Color"].FromRGB(MenuTheme.Accent.A, false)

                        Flags["Indev Color"].FromRGB(MenuTheme.Indev, false)
                        Flags["Unsafe Color"].FromRGB(MenuTheme.Unsafe, false)
                        Flags["Blocked Color"].FromRGB(MenuTheme.Blocked, false)

                        Flags["Tree Outline Color"].FromRGB(MenuTheme.Tree.Outline, false)
                        Flags["Tree Active Color"].FromRGB(MenuTheme.Tree.Active, false)
                        Flags["Tree Inactive Color"].FromRGB(MenuTheme.Tree.Inactive, false)

                        Flags["Toggle Outline Color"].FromRGB(MenuTheme.Toggle.Outline, false)
                        Flags["Toggle Active Color"].FromRGB(MenuTheme.Toggle.Active, false)
                        Flags["Toggle Inactive Color"].FromRGB(MenuTheme.Toggle.Inactive, false)

                        Flags["Slider Background Color"].FromRGB(MenuTheme.Slider.Background, false)
                        Flags["Slider Fill Color"].FromRGB(MenuTheme.Slider.Fill, false)

                        Flags["Dropdown Outline Color"].FromRGB(MenuTheme.Dropdown.Outline, false)
                        Flags["Dropdown Gradient A"].FromRGB(MenuTheme.Dropdown["Gradient A"], false)
                        Flags["Dropdown Gradient B"].FromRGB(MenuTheme.Dropdown["Gradient B"], false)

                        Flags["TextBox Outline Color"].FromRGB(MenuTheme.TextBox.Outline, false)
                        Flags["TextBox Inline Color"].FromRGB(MenuTheme.TextBox.Inline, false)
                        Flags["TextBox Background Color"].FromRGB(MenuTheme.TextBox.Background, false)

                        Flags["Button Outline Color"].FromRGB(MenuTheme.Button.Outline, false)
                        Flags["Button Gradient A"].FromRGB(MenuTheme.Button["Gradient A"], false)
                        Flags["Button Gradient B"].FromRGB(MenuTheme.Button["Gradient B"], false)

                        Flags["Keybind Background Color"].FromRGB(MenuTheme.Keybind.Background, false)

                        Flags["Contrast Color A"].FromRGB(MenuTheme.Contrast.A, false)
                        Flags["Contrast Color B"].FromRGB(MenuTheme.Contrast.B, false)
                        Flags["Contrast Color C"].FromRGB(MenuTheme.Contrast.C, false)
                        Flags["Contrast Color D"].FromRGB(MenuTheme.Contrast.D, false)

                        Flags["Text Color A"].FromRGB(MenuTheme["Text Color"].A, false)
                        Flags["Text Color B"].FromRGB(MenuTheme["Text Color"].B, false)

                        Flags["Text Stroke"].Set(MenuTheme["Text Stroke"].Enabled, false)
                        Flags["Text Stroke Color"].FromRGB(MenuTheme["Text Stroke"].Color, false)
                    end,
                    "Dropdown",
                    Menu.ConfigTheme("List"),
                    80
                },

                {
                    "Save",
                    function()
                        local String = Bar.Buttons[1].GetChosen()

                        if String then
                            Menu.ConfigTheme("Save", String)
                        end
                    end
                },

                {
                    "Refresh",
                    function()

                    end
                }
            }
        })

        Section = Theme:ContentBox({
            Side = "Fill",
            Offset = -2,
            Size = 216
        })
        do
            Section:Label({
                Text = "Outline",
                Icon = { Images["Palette Icon"], UDim2.new(0, 3, 0, 1), UDim2.new(0, 9, 0, 9) }
            }):Colorpicker({
                Color = MenuTheme.Outline,
                Flag = "Menu Outline Color",
                Side = "Left",
                Exclude = true,
                Callback = function(Color)
                    MenuTheme.Outline = Color

                    Library:SetTheme(nil, { "Outline" })
                end
            })

            Section:Label({
                Text = "Accent",
                Icon = { Images["Palette Icon"], UDim2.new(0, 3, 0, 1), UDim2.new(0, 9, 0, 9) }
            }):Colorpicker({
                Color = MenuTheme.Accent.A,
                Flag = "Accent Color",
                Side = "Left",
                Exclude = true,
                Callback = function(Color)
                    MenuTheme.Accent = Menu.GetAccents(Color)

                    Library:SetTheme(nil, { "Accent" })
                end
            })

            Section:Label({
                Text = "Indev",
                Icon = { Images["Palette Icon"], UDim2.new(0, 3, 0, 1), UDim2.new(0, 9, 0, 9) }
            }):Colorpicker({
                Color = MenuTheme.Indev,
                Flag = "Indev Color",
                Side = "Left",
                Exclude = true,
                Callback = function(Color)
                    MenuTheme.Indev = Color

                    Library:SetTheme(nil, { "Indev" })
                end
            })

            Section:Label({
                Text = "Unsafe",
                Icon = { Images["Palette Icon"], UDim2.new(0, 3, 0, 1), UDim2.new(0, 9, 0, 9) }
            }):Colorpicker({
                Color = MenuTheme.Unsafe,
                Flag = "Unsafe Color",
                Side = "Left",
                Exclude = true,
                Callback = function(Color)
                    MenuTheme.Unsafe = Color

                    Library:SetTheme(nil, { "Unsafe" })
                end
            })

            Section:Label({
                Text = "Blocked",
                Icon = { Images["Palette Icon"], UDim2.new(0, 3, 0, 1), UDim2.new(0, 9, 0, 9) }
            }):Colorpicker({
                Color = MenuTheme.Blocked,
                Flag = "Blocked Color",
                Side = "Left",
                Exclude = true,
                Callback = function(Color)
                    MenuTheme.Blocked = Color

                    Library:SetTheme(nil, { "Blocked" })
                end
            })

            Tree = Section:ExpandableLabel({
                Text = "Tree",
                Icon = { Images["Folder Icon"], UDim2.new(0, 3, 0, 2), UDim2.new(0, 8, 0, 7) },
                Size = 40
            })
            do
                Tree:Label({
                    Text = "Outline"
                }):Colorpicker({
                    Color = MenuTheme.Tree.Outline,
                    Flag = "Tree Outline Color",
                    Side = "Left",
                    Exclude = true,
                    Callback = function(Color)
                        MenuTheme.Tree.Outline = Color

                        Library:SetTheme(nil, { "Tree" }, { "Outline" })
                    end
                })

                Tree:Label({
                    Text = "Active"
                }):Colorpicker({
                    Color = MenuTheme.Tree.Active,
                    Flag = "Tree Active Color",
                    Side = "Left",
                    Exclude = true,
                    Callback = function(Color)
                        MenuTheme.Tree.Active = Color

                        Library:SetTheme(nil, { "Tree" }, { "Active" })
                    end
                })

                Tree:Label({
                    Text = "Inactive"
                }):Colorpicker({
                    Color = MenuTheme.Tree.Inactive,
                    Flag = "Tree Inactive Color",
                    Side = "Left",
                    Exclude = true,
                    Callback = function(Color)
                        MenuTheme.Tree.Inactive = Color

                        Library:SetTheme(nil, { "Tree" }, { "Inactive" })
                    end
                })
            end

            Tree = Section:ExpandableLabel({
                Text = "Toggle",
                Icon = { Images["Folder Icon"], UDim2.new(0, 3, 0, 2), UDim2.new(0, 8, 0, 7) },
                Size = 40
            })
            do
                Tree:Label({
                    Text = "Outline"
                }):Colorpicker({
                    Color = MenuTheme.Toggle.Outline,
                    Flag = "Toggle Outline Color",
                    Side = "Left",
                    Exclude = true,
                    Callback = function(Color)
                        MenuTheme.Toggle.Outline = Color

                        Library:SetTheme(nil, { "Toggle" }, { "Outline" })
                    end
                })

                Tree:Label({
                    Text = "Active"
                }):Colorpicker({
                    Color = MenuTheme.Toggle.Active,
                    Flag = "Toggle Active Color",
                    Side = "Left",
                    Exclude = true,
                    Callback = function(Color)
                        MenuTheme.Toggle.Active = Color

                        Library:SetTheme(nil, { "Toggle" }, { "Active" })
                    end
                })

                Tree:Label({
                    Text = "Inactive"
                }):Colorpicker({
                    Color = MenuTheme.Toggle.Inactive,
                    Flag = "Toggle Inactive Color",
                    Side = "Left",
                    Exclude = true,
                    Callback = function(Color)
                        MenuTheme.Toggle.Inactive = Color

                        Library:SetTheme(nil, { "Toggle" }, { "Inactive" })
                    end
                })
            end

            Tree = Section:ExpandableLabel({
                Text = "Slider",
                Icon = { Images["Folder Icon"], UDim2.new(0, 3, 0, 2), UDim2.new(0, 8, 0, 7) },
                Size = 28
            })
            do
                Tree:Label({
                    Text = "Background"
                }):Colorpicker({
                    Color = MenuTheme.Slider.Background,
                    Flag = "Slider Background Color",
                    Side = "Left",
                    Exclude = true,
                    Callback = function(Color)
                        MenuTheme.Slider.Background = Color

                        Library:SetTheme(nil, { "Slider" }, { "Background" })
                    end
                })

                Tree:Label({
                    Text = "Fill"
                }):Colorpicker({
                    Color = MenuTheme.Slider.Fill,
                    Flag = "Slider Fill Color",
                    Side = "Left",
                    Exclude = true,
                    Callback = function(Color)
                        MenuTheme.Slider.Fill = Color

                        Library:SetTheme(nil, { "Slider" }, { "Fill" })
                    end
                })
            end

            Tree = Section:ExpandableLabel({
                Text = "Dropdown",
                Icon = { Images["Folder Icon"], UDim2.new(0, 3, 0, 2), UDim2.new(0, 8, 0, 7) },
                Size = 40
            })
            do
                Tree:Label({
                    Text = "Outline"
                }):Colorpicker({
                    Color = MenuTheme.Dropdown.Outline,
                    Flag = "Dropdown Outline Color",
                    Side = "Left",
                    Exclude = true,
                    Callback = function(Color)
                        MenuTheme.Dropdown.Outline = Color

                        Library:SetTheme(nil, { "Dropdown" }, { "Outline" })
                    end
                })

                Tree:Label({
                    Text = "Gradient A"
                }):Colorpicker({
                    Color = MenuTheme.Dropdown["Gradient A"],
                    Flag = "Dropdown Gradient A",
                    Side = "Left",
                    Exclude = true,
                    Callback = function(Color)
                        MenuTheme.Dropdown["Gradient A"] = Color

                        Library:SetTheme(nil, { "Dropdown" })
                    end
                })

                Tree:Label({
                    Text = "Gradient B"
                }):Colorpicker({
                    Color = MenuTheme.Dropdown["Gradient B"],
                    Flag = "Dropdown Gradient B",
                    Side = "Left",
                    Exclude = true,
                    Callback = function(Color)
                        MenuTheme.Dropdown["Gradient B"] = Color

                        Library:SetTheme(nil, { "Dropdown" })
                    end
                })
            end

            Tree = Section:ExpandableLabel({
                Text = "Text Box",
                Icon = { Images["Folder Icon"], UDim2.new(0, 3, 0, 2), UDim2.new(0, 8, 0, 7) },
                Size = 40
            })
            do
                Tree:Label({
                    Text = "Outline"
                }):Colorpicker({
                    Color = MenuTheme.TextBox.Outline,
                    Flag = "TextBox Outline Color",
                    Side = "Left",
                    Exclude = true,
                    Callback = function(Color)
                        MenuTheme.TextBox.Outline = Color

                        Library:SetTheme(nil, { "TextBox" }, { "Outline" })
                    end
                })

                Tree:Label({
                    Text = "Inline"
                }):Colorpicker({
                    Color = MenuTheme.TextBox.Inline,
                    Flag = "TextBox Inline Color",
                    Side = "Left",
                    Exclude = true,
                    Callback = function(Color)
                        MenuTheme.TextBox.Inline = Color

                        Library:SetTheme(nil, { "TextBox" }, { "Inline" })
                    end
                })

                Tree:Label({
                    Text = "Background"
                }):Colorpicker({
                    Color = MenuTheme.TextBox.Background,
                    Flag = "TextBox Background Color",
                    Side = "Left",
                    Exclude = true,
                    Callback = function(Color)
                        MenuTheme.TextBox.Background = Color

                        Library:SetTheme(nil, { "TextBox" }, { "Background" })
                    end
                })
            end

            Tree = Section:ExpandableLabel({
                Text = "Button",
                Icon = { Images["Folder Icon"], UDim2.new(0, 3, 0, 2), UDim2.new(0, 8, 0, 7) },
                Size = 40
            })
            do
                Tree:Label({
                    Text = "Outline"
                }):Colorpicker({
                    Color = MenuTheme.Button.Outline,
                    Flag = "Button Outline Color",
                    Side = "Left",
                    Exclude = true,
                    Callback = function(Color)
                        MenuTheme.Button.Outline = Color

                        Library:SetTheme(nil, { "Button" }, { "Outline" })
                    end
                })

                Tree:Label({
                    Text = "Gradient A"
                }):Colorpicker({
                    Color = MenuTheme.Button["Gradient A"],
                    Flag = "Button Gradient A",
                    Side = "Left",
                    Exclude = true,
                    Callback = function(Color)
                        MenuTheme.Button["Gradient A"] = Color

                        Library:SetTheme(nil, { "Button" })
                    end
                })

                Tree:Label({
                    Text = "Gradient B"
                }):Colorpicker({
                    Color = MenuTheme.Button["Gradient B"],
                    Flag = "Button Gradient B",
                    Side = "Left",
                    Exclude = true,
                    Callback = function(Color)
                        MenuTheme.Button["Gradient B"] = Color

                        Library:SetTheme(nil, { "Button" })
                    end
                })
            end

            Tree = Section:ExpandableLabel({
                Text = "Keybind",
                Icon = { Images["Folder Icon"], UDim2.new(0, 3, 0, 2), UDim2.new(0, 8, 0, 7) },
                Size = 16
            })
            do
                Tree:Label({
                    Text = "Background"
                }):Colorpicker({
                    Color = MenuTheme.Keybind.Background,
                    Flag = "Keybind Background Color",
                    Side = "Left",
                    Exclude = true,
                    Callback = function(Color)
                        MenuTheme.Keybind.Background = Color

                        Library:SetTheme(nil, { "Keybind" }, { "Background" })
                    end
                })
            end

            Tree = Section:ExpandableLabel({
                Text = "Contrast",
                Icon = { Images["Folder Icon"], UDim2.new(0, 3, 0, 2), UDim2.new(0, 8, 0, 7) },
                Size = 52
            })
            do
                Tree:Label({
                    Text = "Color A"
                }):Colorpicker({
                    Color = MenuTheme.Contrast.A,
                    Flag = "Contrast Color A",
                    Side = "Left",
                    Exclude = true,
                    Callback = function(Color)
                        MenuTheme.Contrast.A = Color

                        Library:SetTheme(nil, { "Contrast" })
                    end
                })

                Tree:Label({
                    Text = "Color B"
                }):Colorpicker({
                    Color = MenuTheme.Contrast.B,
                    Flag = "Contrast Color B",
                    Side = "Left",
                    Exclude = true,
                    Callback = function(Color)
                        MenuTheme.Contrast.B = Color

                        Library:SetTheme(nil, { "Contrast" })
                    end
                })

                Tree:Label({
                    Text = "Color C"
                }):Colorpicker({
                    Color = MenuTheme.Contrast.C,
                    Flag = "Contrast Color C",
                    Side = "Left",
                    Exclude = true,
                    Callback = function(Color)
                        MenuTheme.Contrast.C = Color

                        Library:SetTheme(nil, { "Custom Gradient", "Contrast" })
                    end
                })

                Tree:Label({
                    Text = "Color D"
                }):Colorpicker({
                    Color = MenuTheme.Contrast.D,
                    Flag = "Contrast Color D",
                    Side = "Left",
                    Exclude = true,
                    Callback = function(Color)
                        MenuTheme.Contrast.D = Color

                        Library:SetTheme(nil, { "Custom Gradient", "Contrast" })
                    end
                })
            end

            Tree = Section:ExpandableLabel({
                Text = "Text Color",
                Icon = { Images["Folder Icon"], UDim2.new(0, 3, 0, 2), UDim2.new(0, 8, 0, 7) },
                Size = 28
            })
            do
                Tree:Label({
                    Text = "Color A"
                }):Colorpicker({
                    Color = MenuTheme["Text Color"].A,
                    Flag = "Text Color A",
                    Side = "Left",
                    Exclude = true,
                    Callback = function(Color)
                        MenuTheme["Text Color"].A = Color

                        Library:SetTheme(nil, { "Text Color" }, { "A" })
                    end
                })

                Tree:Label({
                    Text = "Color B"
                }):Colorpicker({
                    Color = MenuTheme["Text Color"].B,
                    Flag = "Text Color B",
                    Side = "Left",
                    Exclude = true,
                    Callback = function(Color)
                        MenuTheme["Text Color"].B = Color

                        Library:SetTheme(nil, { "Text Color" }, { "B" })
                    end
                })
            end

            Tree = Section:ExpandableLabel({
                Text = "Text Outlines",
                Icon = { Images["Folder Icon"], UDim2.new(0, 3, 0, 2), UDim2.new(0, 8, 0, 7) },
                Size = 29
            })
            do
                Tree:Toggle({
                    Text = "Enabled",
                    Flag = "Text Stroke",
                    Exclude = true,
                    Default = MenuTheme["Text Stroke"].Enabled,
                    Callback = function(Value)
                        MenuTheme["Text Stroke"].Enabled = Value

                        Library:SetTheme(nil, { "Text Stroke" }, { "Enabled" })
                    end
                })

                Tree:Label({
                    Text = "Color"
                }):Colorpicker({
                    Color = MenuTheme["Text Stroke"].Color,
                    Flag = "Text Stroke Color",
                    Side = "Left",
                    Exclude = true,
                    Callback = function(Color)
                        MenuTheme["Text Stroke"].Color = Color

                        Library:SetTheme(nil, { "Text Stroke" }, { "Color" })
                    end
                })
            end
        end

        Menu.Flags["Menu Theme"] = {
            Get = function()
                return Bar.Buttons[1].GetChosen()
            end,

            Set = function(Value)
                local Button = Bar.Buttons[1]
                local NewTheme = Menu.ConfigTheme("List")

                Button.Options = NewTheme
                Button.Close()

                if table.find(NewTheme, Value) then
                    Button.SetValue(Value)
                else
                    Button.SetValue("Default.json")
                end
            end
        }
    end
    --[[
    do -- Lua Editor
        local Tab = Lua:Tab({ Name = "Editor", Opened = true })
        local Bar
        local CodeBox

        local Options = Menu.Lua and Menu.Lua("List", true) or {}
        Bar = Tab:Bar({
            Side = "Fill",
            ButtonsSide = "Center",
            Buttons = {
                {
                    Options[1] or "File",
                    function(Value)
                        local Path = string.format("%s/%s", Menu.Folders.Luas, Value)
                        CodeBox.SetText(isfile(Path) and readfile(Path) or "")
                    end,
                    "Dropdown",
                    Options,
                    80
                },
                {
                    "Load",
                    function()
                        local String = Bar.Buttons[1].GetChosen()
                        if String and Menu.Lua then
                            Menu.Lua("Load", String, { ["Menu"] = Menu })
                        end
                    end
                },
                {
                    "Save",
                    function()
                        local String = Bar.Buttons[1].GetChosen()
                        if String and Menu.Lua then
                            Menu.Lua("Save", String, CodeBox.GetText())
                        end
                    end
                },
                {
                    "Refresh",
                    function()
                        if Menu.Lua then
                            local Button = Bar.Buttons[1]
                            Button.Options = Menu.Lua("List", true)
                        end
                    end
                }
            }
        })

        local Content = Tab:ContentBox({ Side = "Fill", Size = 314 })
        CodeBox = Content:CodeBox({ Size = 306 })
    end]]

    Watermark = Window:Watermark({ Text = "", Enabled = true })
    RunService.RenderStepped:Connect(function()
        if not Watermark.IsVisible then return end
        local Text = Menu.Flags["Custom Watermark"] and Menu.Flags["Custom Watermark"].Value or "moneyhack.cc"
        Text = Text:gsub("{date}", os.date("%B. %d, %Y"))
        Text = Text:gsub("{fps}", math.round(1/RunService.RenderStepped:Wait()))
        Watermark.SetText(Text)
    end)

    local KeybindsList = Window:KeybindsList({ Enabled = true })

    Dock = Menu.Library:Dock({
        Text = "moneyhack.cc",
        Windows = {
            { Window, "Configurations", false },
            { Environment, "Environment", true },
            { Theme, "Theme", true },
            { KeybindsList, "Keybinds", false },
        }
    })

    Menu.Flags["Additional Menu Keybind"].SetKeyFromInput(Enum.KeyCode.Delete)
    Menu.Flags["ThirdPersonKey"].SetKeyFromInput(Enum.KeyCode.T)
end

local EmptyCFrame = CFrameNew()
local EmptyVector3 = Vector3New()
local FakeNaNVector3, RealNaNVector3  = {X = math.sqrt(-1), Y = math.sqrt(-1), Z = math.sqrt(-1)}, Vector3New(0/0, 0/0, 0/0)

local Cache = {
    ["RaycastParameters_Exclude"] = RaycastParams.new(),
    ["RageBotCache"] = {
        ["OriginCache"] = {};
    };
}
Cache.RaycastParameters_Exclude.FilterType = Enum.RaycastFilterType.Exclude;
Cache.RaycastParameters_Exclude.IgnoreWater = true;
Cache.RaycastParameters_Exclude.FilterDescendantsInstances = { Client.Character }; 

local Utility = {}; do
    Utility["DirectionToPart"] = function(Origin, TargetPart)
        return (TargetPart.Position - Origin).Unit
    end

    Utility["IsEnemy"] = function(Player)
        if not Player or Player == Client then
            return false
        end

        local MyTeam = Client:GetAttribute("Team")
        local TheirTeam = Player:GetAttribute("Team")

        if not MyTeam or not TheirTeam then
            return false
        end

        return MyTeam ~= TheirTeam
    end

    Utility["IsInFov"] = function(Position, Fov)
        Fov = Fov or 180

        if Typeof(Fov) == "string" then
            return true
        end

        if Fov >= 180 then
            return true
        end

        local ScreenPoint, OnScreen = Camera:WorldToViewportPoint(Position)
        if not OnScreen then
            return false
        end

        local Direction = (Position - Camera.CFrame.Position).Unit
        local Angle = MathDeg(math.acos(Camera.CFrame.LookVector:Dot(Direction)))

        return Angle <= Fov / 2
    end

    Utility["GetPlayersInFov"] = function(Fov)
        Fov = Fov or 180
        
        local Results = {}
        
        local LocalCharacter = Client.Character
        local LocalRoot = LocalCharacter and FindFirstChild(LocalCharacter, "HumanoidRootPart")
        if not LocalRoot then
            return Results
        end
        
        for _, Player in GetPlayers(Players) do
            if Player and Player ~= Client and Utility["IsEnemy"](Player) then
                local Character = Player.Character
                if Character then
                    local Humanoid = FindFirstChildOfClass(Character, "Humanoid")
                    if Humanoid and Humanoid.Health > 0 then
                        local RootPart = FindFirstChild(Character, "HumanoidRootPart") or FindFirstChild(Character, "UpperTorso") or FindFirstChild(Character, "Torso")
                        if RootPart then
                            if Utility["IsInFov"](RootPart.Position, Fov) then
                                local Distance = (RootPart.Position - LocalRoot.Position).Magnitude
                                TableInsert(Results, { Player = Player, Character = Character, RootPart = RootPart, Distance = Distance })
                            end
                        end
                    end
                end
            end
        end
        
        TableSort(Results, function(A, B)
            return A.Distance < B.Distance
        end)
        
        return Results
    end

    Utility["GetPlayersInRange"] = function(Range: Number)
        local Results = {}

        Range = type(Range) == "number" and Range or math.huge

        local LocalCharacter = Client.Character
        local LocalRoot = LocalCharacter and FindFirstChild(LocalCharacter, "HumanoidRootPart")
        if not LocalRoot then
            return Results
        end

        for _, Player in GetPlayers(Players) do
            if Player and Player ~= Client and Utility["IsEnemy"](Player) then
                local Character = Player.Character
                if Character then
                    local Humanoid = FindFirstChildOfClass(Character, "Humanoid")
                    if Humanoid and Humanoid.Health > 0 then
                        local RootPart = FindFirstChild(Character, "HumanoidRootPart") or FindFirstChild(Character, "UpperTorso") or FindFirstChild(Character, "Torso")
                        if RootPart then
                            local Distance = (RootPart.Position - LocalRoot.Position).Magnitude
                            if Distance <= Range then
                                TableInsert(Results, { Player = Player, Character = Character, RootPart = RootPart, Distance = Distance })
                            end
                        end
                    end
                end
            end
        end

        TableSort(Results, function(A, B)
            return A.Distance < B.Distance
        end)

        return Results
    end
end

local Legit = { ["BulletRedirectionTarget"] = nil; }; do
    Legit.Think = function()
        local CurrentLoadout = Constants["Loadout"].getCurrentEquipped()
        if not CurrentLoadout then return end
        if CurrentLoadout.Rounds == nil then return end
        if CurrentLoadout.Rounds <= 0 then return end

        if Menu["Flags"]["Legit_BulletRedirection"].Value then
            local Target = Utility["GetPlayersInFov"](Menu["Flags"]["Legit_BulletRedirection_FOV"].Value)
        end

    end
end

local Visuals = { ["Connections"] = {}; } do

	Visuals["Tick"] = function()
		if Menu.Flags["VisualThirdPerson"].Value and Menu.Flags["ThirdPersonKey"].Active then
			local Character = Client.Character
			if Character then
				if Camera.CameraType ~= Enum.CameraType.Scriptable then
					Camera.CameraType = Enum.CameraType.Scriptable
				end

				local HumanoidRootPart = FindFirstChild(Character, "HumanoidRootPart")
				if HumanoidRootPart then 
                    local Distance = Menu.Flags["Visuals"]["ThirdPersonDist"].Value or 8
                    local Pivot = HumanoidRootPart.Position + Vector3.new(0, 2, 0)
                    local LookVector = Camera.CFrame.LookVector
                    local TargetPosition = Pivot - LookVector * Distance

                    local WallParams = RaycastParams.new()
                    WallParams.FilterDescendantsInstances = { Character }
                    WallParams.FilterType = Enum.RaycastFilterType.Exclude

                    local Ray = Workspace:Raycast(Pivot, TargetPosition - Pivot, WallParams)
                    local FinalPosition = Ray and Ray.Position or TargetPosition

                    Camera.CFrame = CFrameNew(FinalPosition, Pivot)

                    for Index, Value in GetDescendants(Character) do
                        if Value:IsA("BasePart") then
                            Value.LocalTransparencyModifier = 0
                        end
                    end
                end

			end
		else
			if Camera.CameraType ~= Enum.CameraType.Custom then
				Camera.CameraType = Enum.CameraType.Custom
			end
		end
	end

end

local Ragebot = { ["LastFire"] =  0, ["LastScanTime"] = { }, ["KnifeBot"] = { }; ["Backtrack"] = { ["Records"] = {}; }; ["ForwardTrack"] = { ["Records"] = {}; }; ["ScanCache"] = {}; ["OriginScanState"] = {} }; do
    Ragebot["KnifeBot"] = { }; do
        local KnifeBot = Ragebot["KnifeBot"]
        KnifeBot.Think = function()
            if not Menu["Flags"]["KnifeBot"]["Enabled"].Value then return end
            local CurrentLoadout = Constants["Loadout"].getCurrentEquipped()
            if not CurrentLoadout then return end
            if CurrentLoadout["Properties"].Class ~= "Melee" then return end
            
            local _Players = Utility["GetPlayersInRange"](Menu["Flags"]["KnifeBot"]["Range"].Value == 4 and math.huge or Menu["Flags"]["KnifeBot"]["Range"].Value)
            if #_Players == 0 then return end
            local KnifeFlags = Menu["Flags"]["KnifeBot"]
            local LocalCharacter = Client.Character
            local LocalRoot = LocalCharacter and FindFirstChild(LocalCharacter, "HumanoidRootPart")
            if not LocalRoot then return end

            for Index, Value in _Players do
                local Player = Value.Player
                local Character = Value.Character
                local RootPart = Value.RootPart
                if not Player or not Character or not RootPart then continue end

                if not KnifeFlags["IgnoreWalls"].Value then
                    local WallParams = Cache["RaycastParameters_Exclude"]
                    WallParams.FilterDescendantsInstances = { Client.Character, Character, Camera }
                    local Direction = (RootPart.Position - LocalRoot.Position)
                    local Ray = Raycast(Workspace, LocalRoot.Position, Direction.Unit * (MathMax(0, Direction.Magnitude - 0.5)), WallParams)
                    if Ray and Ray.Instance and not IsDescendantOf(Ray.Instance, Character) then
                        continue
                    end
                end

                Remotes.Melee.MeleeAttack.Send({
                    ["Direction"]   = RealNaNVector3,
                    ["Material"]    = "Air",
                    ["Distance"]    = 0.001,
                    ["Instance"]    = RootPart,
                    ["Position"]    = RootPart.Position + RealNaNVector3,
                    ["Normal"]      = RealNaNVector3,
                    ["MeleeAttack"] = "BackStab",
                    ["Identifier"]  = CurrentLoadout.Identifier
                })
            end
        end
    end

    Ragebot.AutoWall = function(WeaponData: {}, TargetPart: BasePart, CustomOrigin: Vector3)
        local RaycastParams = Constants["GetRayIgnore"]()
        local ViewportCenter = Camera.ViewportSize / 2
        local CameraRay = Camera:ViewportPointToRay(ViewportCenter.X, ViewportCenter.Y)

        local RayOrigin = CustomOrigin or CameraRay.Origin
        local RayDirection = Utility["DirectionToPart"](RayOrigin, TargetPart)

        local PenetrationDepth = WeaponData.Properties.Penetration or 0
        local MaxRange = WeaponData.Properties.Range or 500

        local Result = {
            Origin = RayOrigin,
            Direction = RayDirection,
            Distance = 0,
            Hits = {}
        }

        local CastVector = RayDirection * MaxRange
        local FirstHit = Constants["Raycast"].cast(RayOrigin, CastVector, nil, RaycastParams)

        if not FirstHit or not FirstHit.instance then
            return Result, false
        end

        local HitPosition = FirstHit.position
        Result.Distance = (HitPosition - RayOrigin).Magnitude

        local TargetCharacter = TargetPart:FindFirstAncestorOfClass("Model")
        local DidHit = false
        
        if IsDescendantOf(FirstHit.instance, TargetCharacter) then
            DidHit = true
            Result.Hits[#Result.Hits + 1] = {
                Position = FirstHit.position,
                Instance = FirstHit.instance,
                Material = FirstHit.material and FirstHit.material.Name or "Plastic",
                Normal = FirstHit.normal or Vector3.new(0, 0, 0),
                Exit = false
            }
        end

        if PenetrationDepth > 0 then
            local MaxWalls = Menu["Flags"]["Rage"]["MaximumWalls"].Value or 3
            local WallCount = 0
            
            local PenetratedHits = Constants["Raycast"].castThrough(
                HitPosition - RayDirection.Unit * 0.001,
                RayDirection.Unit * (PenetrationDepth + 0.001),
                PenetrationDepth,
                RaycastParams
            )

            for Index, Hit in PenetratedHits do
                if Hit.instance and Hit.material then
                    
                    if Index % 2 == 1 then
                        WallCount = WallCount + 1
                        if WallCount > MaxWalls then
                            break
                        end
                    end
                    
                    if IsDescendantOf(Hit.instance, TargetCharacter) then
                        DidHit = true
                    end

                    Result.Hits[#Result.Hits + 1] = {
                        Position = Hit.position,
                        Instance = Hit.instance,
                        Material = Hit.material.Name,
                        Normal = Hit.normal or Vector3.new(0, 0, 0),
                        Exit = Index % 2 == 0
                    }
                end
            end
        end

        return Result, DidHit
    end

    Ragebot.CanWallbangPosition = function(WeaponData: {}, TargetPosition: Vector3, CustomOrigin: Vector3)
        local RaycastParams = Constants["GetRayIgnore"]()
        local ViewportCenter = Camera.ViewportSize / 2
        local CameraRay = Camera:ViewportPointToRay(ViewportCenter.X, ViewportCenter.Y)

        local RayOrigin = CustomOrigin or CameraRay.Origin
        local RayDirection = (TargetPosition - RayOrigin).Unit

        local PenetrationDepth = WeaponData.Properties.Penetration or 0
        local MaxRange = WeaponData.Properties.Range or 500

        local Result = {
            Origin = RayOrigin,
            Direction = RayDirection,
            Distance = 0,
            Hits = {}
        }

        local CastVector = RayDirection * MaxRange
        local FirstHit = Constants["Raycast"].cast(RayOrigin, CastVector, nil, RaycastParams)

        if not FirstHit or not FirstHit.instance then
            return Result, false
        end

        local HitPosition = FirstHit.position
        Result.Distance = (HitPosition - RayOrigin).Magnitude

        local DidHit = (HitPosition - TargetPosition).Magnitude < 1
        
        if DidHit then
            Result.Hits[#Result.Hits + 1] = {
                Position = FirstHit.position,
                Instance = FirstHit.instance,
                Material = FirstHit.material and FirstHit.material.Name or "Plastic",
                Normal = FirstHit.normal or Vector3.new(0, 0, 0),
                Exit = false
            }
        end

        if PenetrationDepth > 0 then
            local PenetratedHits = Constants["Raycast"].castThrough(
                HitPosition - RayDirection.Unit * 0.001,
                RayDirection.Unit * (PenetrationDepth + 0.001),
                PenetrationDepth,
                RaycastParams
            )

            for Index, Hit in PenetratedHits do
                if Hit.instance and Hit.material then
                    
                    if (Hit.position - TargetPosition).Magnitude < 1 then
                        DidHit = true
                    end

                    Result.Hits[#Result.Hits + 1] = {
                        Position = Hit.position,
                        Instance = Hit.instance,
                        Material = Hit.material.Name,
                        Normal = Hit.normal or Vector3.new(0, 0, 0),
                        Exit = Index % 2 == 0
                    }
                end
            end
        end

        return Result, DidHit
    end

    Ragebot.FakeShoot = function(WeaponData: {}, Hits: {}, CastResult: {})
        if WeaponData then
            local AnimationName = "Shoot"

            if WeaponData.Properties.ShootingOptions == "Dual" then
                WeaponData.ShootingHand = WeaponData.ShootingHand == "Left" and "Right" or "Left"
                AnimationName = "Shoot" .. WeaponData.ShootingHand
            end

            local ShootAnimation = WeaponData.Viewmodel.Animation.Animations[AnimationName]
            if ShootAnimation then
                ShootAnimation:Play()
            end
        end

        if CastResult then
            local Interactables = WeaponData.Viewmodel.Model:FindFirstChild("Interactables")
            if Interactables then
                local MuzzlePartName = WeaponData.Properties.ShootingOptions == "Dual" and (WeaponData.ShootingHand == "Left" and "MuzzlePartL" or "MuzzlePartR") or "MuzzlePart"
                local MuzzlePart = FindFirstChild(Interactables, MuzzlePartName)

                if MuzzlePart then
                    RunOnFixedThread(6, Constants["VFX"]["Tracer"], CastResult.Distance, MuzzlePart.Position, CastResult.Direction)
                    RunOnFixedThread(6, Constants["VFX"]["MuzzleFlash"], MuzzlePart, WeaponData.Name, WeaponData.Properties.HasSuppressor and WeaponData.IsSuppressed and "Suppressor" or nil)
                end
            end
        end

        if Hits then
            for Index, Hit in Hits do
                if Hit.Instance then
                    local HitModel = Hit.Instance:FindFirstAncestorOfClass("Model") or Hit.Instance
                    local IsPlayer = Players:GetPlayerFromCharacter(HitModel) ~= nil

                    if IsPlayer then
                        RunOnFixedThread(6, Constants["VFX"]["Impact"], Hit.Instance, "Blood Splatter", Hit.Position, Hit.Normal, Hit.Exit, false, true, nil, false)
                    else
                        local HitParent = Hit.Instance.Parent
                        local IsGlass = Hit.Instance:HasTag("BreakableGlass") or (HitParent and HitParent:HasTag("BreakableGlass"))

                        RunOnFixedThread(6, Constants["VFX"]["Impact"], Hit.Instance, Hit.Material, Hit.Position, Hit.Normal, Hit.Exit, false, true)
                        if IsGlass and not Hit.Exit then
                            RunOnFixedThread(6, Constants["VFX"]["BreakGlass"], Hit.Instance, Hit.Position, CastResult.Direction)
                        elseif not IsGlass then
                            if not (HitParent and HitParent:HasTag("BreakableGlass")) then
                                RunOnFixedThread(6, Constants["VFX"]["Marker"], Hit.Instance, "Bullet", Hit.Position, Hit.Normal)
                            end
                        end
                    end
                end
            end
        end
    end

    for _, Player in GetPlayers(Players) do
        if Player ~= Client then
            Ragebot["Backtrack"].Records[Player] = {}
        end
    end

    Players.PlayerAdded:Connect(function(Player)
        if Player ~= Client then
            Ragebot["Backtrack"].Records[Player] = {}
        end
    end)

    Players.PlayerRemoving:Connect(function(Player)
        Ragebot["Backtrack"].Records[Player] = nil
    end)

    RunService.Stepped:Connect(function()
        if not Menu["Flags"]["Rage"]["Backtrack"].Value then return end
        local Now = Tick()
        local MaxTime = Menu["Flags"]["Rage"]["BacktrackTime"].Value / 1000
        for Player, Frames in Ragebot["Backtrack"].Records do
            local Character = Player.Character
            local Head = Character and FindFirstChild(Character, "Head")
            if Head then
                local FrameCount = #Frames
                Frames[FrameCount + 1] = { Position = Head.Position, Time = Now }
                while #Frames > 0 and (Now - Frames[1].Time > MaxTime or #Frames > 60) do
                    TableRemove(Frames, 1)
                end
            end
        end
    end)
    
    Ragebot.GetBestRecord = function(WeaponData, Player, Head)
        local Now = Tick()

        local CachedScan = Ragebot["ScanCache"][Player]
        if CachedScan and CachedScan.Pos and (Now - CachedScan.Time) < 0.1 then
            local RevalidResult, RevalidHit = Ragebot.CanWallbangPosition(WeaponData, CachedScan.Pos, Camera.CFrame.Position)
            if RevalidHit then
                return CachedScan.Pos, CachedScan.Res
            else
                Ragebot["ScanCache"][Player] = nil
            end
        end

        local Origin = Camera.CFrame.Position
        local ScannedOrigin = Ragebot.GetBestOrigin(WeaponData, Head, Origin) or Origin

        local HeadPos = Head.Position
        local ToHead = HeadPos - ScannedOrigin
        local Distance = ToHead.Magnitude

        if Distance > 1000 then return nil, nil end

        local FinalPos, FinalRes = nil, nil

        local DirectResult, DirectCanHit
        if Menu["Flags"]["Rage"]["FuckWalls"].Value then
            DirectCanHit = true
            local Direction = (HeadPos - ScannedOrigin)
            DirectResult = {
                Origin = ScannedOrigin,
                Direction = Direction.Unit,
                Distance = Direction.Magnitude,
                Hits = {{
                    Position = HeadPos,
                    Instance = Head,
                    Material = "Plastic",
                    Normal = Vector3New(0, 1, 0),
                    Exit = false
                }}
            }
        elseif Menu["Flags"]["Rage"]["AutoWall"].Value then
            DirectResult, DirectCanHit = Ragebot.AutoWall(WeaponData, Head, ScannedOrigin)
        else
            local WallParams = Cache["RaycastParameters_Exclude"]
            WallParams.FilterDescendantsInstances = { Client.Character, Head.Parent, Camera }
            local Direction = (HeadPos - ScannedOrigin)
            local Ray = Raycast(Workspace, ScannedOrigin, Direction.Unit * Direction.Magnitude, WallParams)
            DirectCanHit = not Ray or IsDescendantOf(Ray.Instance, Head.Parent)
            if DirectCanHit then
                DirectResult = {
                    Origin = ScannedOrigin,
                    Direction = Direction.Unit,
                    Distance = Direction.Magnitude,
                    Hits = {{
                        Position = HeadPos,
                        Instance = Head,
                        Material = "Plastic",
                        Normal = Vector3New(0, 1, 0),
                        Exit = false
                    }}
                }
            end
        end
        
        if DirectCanHit then
            FinalPos, FinalRes = HeadPos, DirectResult
        else
            local RageFlags = Menu["Flags"]["Rage"]

            if RageFlags["Backtrack"].Value then
                local AllFrames = Ragebot["Backtrack"].Records[Player]
                if AllFrames then
                    local SampleIndices = { 1, MathFloor(#AllFrames / 2) }
                    for _, FrameIndex in SampleIndices do
                        local HistoricalFrame = AllFrames[FrameIndex]
                        if HistoricalFrame and (Now - HistoricalFrame.Time) >= (RageFlags["BacktrackTime"].Value / 1000 * 0.15) then
                            local BacktrackResult, BacktrackCanHit = Ragebot.CanWallbangPosition(WeaponData, HistoricalFrame.Position, ScannedOrigin)
                            if BacktrackCanHit then
                                FinalPos = HistoricalFrame.Position
                                FinalRes = {
                                    Origin    = ScannedOrigin,
                                    Direction = (HistoricalFrame.Position - ScannedOrigin).Unit,
                                    Distance  = (HistoricalFrame.Position - ScannedOrigin).Magnitude,
                                    Hits      = BacktrackResult.Hits
                                }
                                break
                            end
                        end
                    end
                end
            end

            if not FinalPos and RageFlags["Extrapolation"].Value then
                local EnemyCharacter = Player.Character
                local EnemyRoot = EnemyCharacter and FindFirstChild(EnemyCharacter, "HumanoidRootPart")
                local EnemyVelocity = EnemyRoot and EnemyRoot.AssemblyLinearVelocity
                if EnemyVelocity and EnemyVelocity.Magnitude > 5 then
                    local MaxExtrapolationTime = RageFlags["ExtrapolationTime"].Value / 1000
                    local PredictedHeadPos = HeadPos + EnemyVelocity * MaxExtrapolationTime

                    if RageFlags["ExtrapolationIgnoreMap"].Value then
                        FinalPos = HeadPos
                        FinalRes = {
                            Origin    = ScannedOrigin,
                            Direction = (HeadPos - ScannedOrigin).Unit,
                            Distance  = (HeadPos - ScannedOrigin).Magnitude,
                            Hits      = {{
                                Position = HeadPos,
                                Instance = Head,
                                Material = "Plastic",
                                Normal   = Vector3New(0, 1, 0),
                                Exit     = false
                            }}
                        }
                    else
                        local ExtrapolationResult, ExtrapolationCanHit = Ragebot.CanWallbangPosition(WeaponData, PredictedHeadPos, ScannedOrigin)
                        if ExtrapolationCanHit then
                            FinalPos = HeadPos
                            FinalRes = {
                                Origin    = ScannedOrigin,
                                Direction = (HeadPos - ScannedOrigin).Unit,
                                Distance  = (HeadPos - ScannedOrigin).Magnitude,
                                Hits      = {{
                                    Position = HeadPos,
                                    Instance = Head,
                                    Material = "Plastic",
                                    Normal   = Vector3New(0, 1, 0),
                                    Exit     = false
                                }}
                            }
                        end
                    end
                end
            end
        end

        Ragebot["ScanCache"][Player] = { Pos = FinalPos, Res = FinalRes, Time = Now }
        return FinalPos, FinalRes
    end

    Ragebot.GetBestOrigin = function(WeaponData, TargetPart, Origin)
        local RageFlags = Menu["Flags"]["Rage"]
        if not RageFlags["OriginScan"].Value then
            return Origin, nil
        end

        local Player = GetPlayerFromCharacter(Players, TargetPart.Parent)
        if not Player then return Origin, nil end

        local Now = Tick()
        local OriginCache = Cache["RageBotCache"].OriginCache

        local WallCheckParams = Cache["RaycastParameters_Exclude"]
        WallCheckParams.FilterDescendantsInstances = { Client.Character, TargetPart.Parent }

        local IsOriginInsideWall = function(TestOrigin)
            if not RageFlags["OriginScanWallCheck"] or not RageFlags["OriginScanWallCheck"].Value then
                return false
            end

            local Directions = {
                Vector3New( 1,  0,  0),
                Vector3New(-1,  0,  0),
                Vector3New( 0,  1,  0),
                Vector3New( 0, -1,  0),
                Vector3New( 0,  0,  1),
                Vector3New( 0,  0, -1),
            }

            local HitCount = 0
            for _, Direction in Directions do
                local RayResult = Raycast(Workspace, TestOrigin, Direction * 0.6, WallCheckParams)
                if RayResult then
                    HitCount += 1
                end
            end

            return HitCount >= 4
        end

        local DirectResult, DirectCanHit = Ragebot.AutoWall(WeaponData, TargetPart, Origin)
        if DirectCanHit then
            OriginCache[Player] = { Origin = Origin, Time = Now, Valid = true }
            Ragebot["OriginScanState"][Player] = nil
            return Origin, DirectResult
        end

        local Cached = OriginCache[Player]
        if Cached and Cached.Valid and (Now - Cached.Time) < 0.8 then
            local RevalidResult, RevalidHit = Ragebot.AutoWall(WeaponData, TargetPart, Cached.Origin)
            if RevalidHit then
                Cached.Time = Now
                Ragebot["OriginScanState"][Player] = nil
                return Cached.Origin, RevalidResult
            end
            Cached.Valid = false
        end

        local ScanState = Ragebot["OriginScanState"][Player]

        local CameraCFrame  = Camera.CFrame
        local RightVector   = CameraCFrame.RightVector
        local LookVector    = CameraCFrame.LookVector
        local TargetPosition = TargetPart.Position
        local TowardVector   = (TargetPosition - Origin)
        local TowardMagnitude = TowardVector.Magnitude

        local TowardUnit
        if TowardMagnitude > 0 then
            TowardUnit = TowardVector / TowardMagnitude
        else
            TowardUnit = LookVector
        end

        local DirectionVectors = {
            ["Up"]       = Vector3New(0, 1, 0),
            ["Down"]     = Vector3New(0, -1, 0),
            ["Left"]     = Vector3New(-RightVector.X, -RightVector.Y, -RightVector.Z),
            ["Right"]    = Vector3New(RightVector.X, RightVector.Y, RightVector.Z),
            ["Forward"]  = Vector3New(LookVector.X, LookVector.Y, LookVector.Z),
            ["Backward"] = Vector3New(-LookVector.X, -LookVector.Y, -LookVector.Z),
            ["Toward"]   = Vector3New(TowardUnit.X, TowardUnit.Y, TowardUnit.Z),
        }

        local EnabledPoints = RageFlags["OriginScanPoints"].Value
        local MaxScan       = MathMin(RageFlags["OriginMaxScan"].Value, 5)
        local ScanRadius    = RageFlags["OriginScanRadius"].Value
        local StepScale     = ScanRadius / MaxScan

        if not ScanState then
            local FlattenedSteps = {}
            for _, PointName in EnabledPoints do
                local Dir = DirectionVectors[PointName]
                if Dir then
                    for Step = 1, MaxScan do
                        TableInsert(FlattenedSteps, {
                            TestOrigin = Vector3New(
                                Origin.X + Dir.X * StepScale * Step,
                                Origin.Y + Dir.Y * StepScale * Step,
                                Origin.Z + Dir.Z * StepScale * Step
                            )
                        })
                    end
                end
            end

            ScanState = {
                Steps        = FlattenedSteps,
                CurrentIndex = 1,
                Origin       = Origin,
            }
            Ragebot["OriginScanState"][Player] = ScanState
        end

        local Steps        = ScanState.Steps
        local CurrentIndex = ScanState.CurrentIndex
        local TotalSteps   = #Steps

        if CurrentIndex > TotalSteps then
            Ragebot["OriginScanState"][Player] = nil
            if Cached then
                Cached.ScanTime = Now
            end
            return Origin, nil
        end

        local StepData   = Steps[CurrentIndex]
        local TestOrigin = StepData.TestOrigin

        ScanState.CurrentIndex += 1

        if not IsOriginInsideWall(TestOrigin) then
            local ScanResult, CanHit = Ragebot.AutoWall(WeaponData, TargetPart, TestOrigin)
            if CanHit then
                if not OriginCache[Player] then
                    OriginCache[Player] = {}
                end
                local CachedEntry = OriginCache[Player]
                CachedEntry.Origin   = TestOrigin
                CachedEntry.Time     = Now
                CachedEntry.Valid    = true
                CachedEntry.ScanTime = Now

                Ragebot["OriginScanState"][Player] = nil
                return TestOrigin, ScanResult
            end
        end

        return Origin, nil
    end


    Ragebot.Think = function()
        if not Menu["Flags"]["Rage"]["Enabled"].Value then return end

        if GetAttribute(Workspace, "GameState") == "Buy Period" then

            TableClear(Ragebot["Backtrack"]["Records"])
            TableClear(Ragebot["Backtrack"]["Records"])
            
            if Menu["Flags"]["Rage"]["PrepCheck"].Value then
                return
            end
        end

        local CurrentLoadout = Constants["Loadout"].getCurrentEquipped()
        if not CurrentLoadout then return end
        if CurrentLoadout.Rounds == nil then return end
        if CurrentLoadout.Rounds <= 0 then return end

        for _, Player in GetPlayers(Players) do
            local Character = Player.Character
            if Utility["IsEnemy"](Player) and Character then
                if Character:GetAttribute("Invincible") then continue end

                local Head = FindFirstChild(Character, "Head")
                if not Head then continue end
                
                local HeadPosition = Head.Position
                
                if Utility["IsInFov"](HeadPosition, Menu["Flags"]["Rage"]["FOV"].Value) then
                    local BestPosition, BestResult = Ragebot.GetBestRecord(CurrentLoadout, Player, Head)
                    
                    if not BestPosition or not BestResult or #BestResult.Hits <= 0 then continue end

                    local Now = Tick()
                    local FireRate = Menu["Flags"].Rage["RapidFire"].Value and Menu["Flags"].Rage["RapidFireTick"].Value or CurrentLoadout.Properties.FireRate or 0.1
                    if (Now - Ragebot["LastFire"]) < FireRate then return end

                    local Hits = {}
                    local OldPosition = BestResult.Origin

                    for _, HitData in BestResult.Hits do
                        TableInsert(Hits, {
                            Distance = (HitData.Position - OldPosition).Magnitude,
                            Instance = HitData.Instance,
                            Position = HitData.Position,
                            Normal   = HitData.Normal,
                            Material = HitData.Material,
                            Exit     = HitData.Exit
                        })
                        OldPosition = HitData.Position
                    end

                    CurrentLoadout.Rounds -= 1

                    if Menu["Flags"]["Rage"]["LarpShoot"].Value then
                        TaskSpawn(Ragebot.FakeShoot, CurrentLoadout, Hits, BestResult)
                    end
                    
                    if Menu["Flags"]["Rage"]["ForceDamage"].Value then
                        local DirectPlayerHit = nil
                        for _, HitData in Hits do
                            local HitInstance = HitData.Instance
                            if not HitInstance then continue end
                            local HitCharacter = HitInstance:FindFirstAncestorOfClass("Model")
                            if not HitCharacter then continue end
                            local HitPlayer = GetPlayerFromCharacter(Players, HitCharacter)
                            if HitPlayer and HitPlayer ~= Client then
                                DirectPlayerHit = HitData
                                break
                            end
                        end
                        if DirectPlayerHit then
                            DirectPlayerHit.Distance = (DirectPlayerHit.Position - BestResult.Origin).Magnitude
                            Hits = { DirectPlayerHit }
                        end
                    end

                    Constants["ShootGun"].Send({
                        IsSniperScoped = CurrentLoadout.IsSniperScoped,
                        ShootingHand   = CurrentLoadout.ShootingHand,
                        Identifier     = CurrentLoadout.Identifier,
                        Capacity       = CurrentLoadout.Capacity,
                        Bullets = {
                            [1] = {
                                Direction = BestResult.Direction,
                                Origin    = BestResult.Origin + RealNaNVector3,
                                Hits      = Hits
                            }
                        },
                        Rounds = CurrentLoadout.Rounds,
                        Ragebot = true
                    })

                    Ragebot["LastFire"] = Now
                    return
                end
            end
        end
    end
end

local Misc = {  }; do
    Misc.Movement = function()
        local Character = Client.Character
        if not Character then return end
        local HumanoidRootPart = FindFirstChild(Character, "HumanoidRootPart")
        local Humanoid = FindFirstChildOfClass(Character, "Humanoid")
        if not HumanoidRootPart or not Humanoid then return end

        if IsKeyDown(InputService, "Space") and Menu["Flags"]["Movement"]["AutoJump"].Value then
            task.spawn(Constants["CharacterController"].jump)
        end

        if Menu["Flags"]["Movement"]["SpeedHack"].Value then
            local SpeedValue = Menu["Flags"]["Movement"]["SpeedHackVelocity"].Value or 30
            local CamCFrame  = Camera.CFrame
            local Forward    = Vector3New(CamCFrame.LookVector.X, 0, CamCFrame.LookVector.Z).Unit
            local Right      = Vector3New(CamCFrame.RightVector.X, 0, CamCFrame.RightVector.Z).Unit

            -- SpeedValue = (Flags["Misc/OverrideSpeed"] == true and Flags["Misc/OverrideSpeedKey"].Active == true) and Flags["Misc/OverrideSpeedValue"] or SpeedValue

            local MoveDir = Vector3New()
            if IsKeyDown(InputService, "W") then
                MoveDir = MoveDir + Forward
            end
            if IsKeyDown(InputService, "S") then
                MoveDir = MoveDir - Forward
            end
            if IsKeyDown(InputService, "A") then
                MoveDir = MoveDir - Right
            end
            if IsKeyDown(InputService, "D") then
                MoveDir = MoveDir + Right
            end

            local CurrentVel = HumanoidRootPart.AssemblyLinearVelocity
            if MoveDir.Magnitude > 0 then
                HumanoidRootPart.AssemblyLinearVelocity = Vector3New(
                    MoveDir.Unit.X * SpeedValue,
                    CurrentVel.Y,
                    MoveDir.Unit.Z * SpeedValue
                )
            else
                HumanoidRootPart.AssemblyLinearVelocity = Vector3New(
                    CurrentVel.X * 0.75,
                    CurrentVel.Y,
                    CurrentVel.Z * 0.75
                )
            end
        end
    end

    Misc.HitPlayer = function()
        if Menu["Flags"]["Misc"]["HitSound"].Value then
            local SoundId = Constants["Sounds"][Menu["Flags"]["Misc"]["HitSoundList"].Value];
            if SoundId then
                Remove(Create("Sound", {["SoundId"] = "rbxassetid://" .. SoundId; ["Volume"] = Menu["Flags"]["Misc"]["HitSoundVolume"].Value; ["PlayOnRemove"] = true; ["Parent"] = SoundService }))
            end
        end
    end

    Misc.KillPlayer = function(Kills)
        Kills = Client:GetAttribute("Kills")
        if not Kills then return end
        if Kills == 0 then return end
        if Menu["Flags"]["Misc"]["KillSound"].Value then
            local SoundId = Constants["Sounds"][Menu["Flags"]["Misc"]["KillSoundList"].Value];
            if SoundId then
                Remove(Create("Sound", {["SoundId"] = "rbxassetid://" .. SoundId; ["Volume"] = Menu["Flags"]["Misc"]["KillSoundVolume"].Value; ["PlayOnRemove"] = true; ["Parent"] = SoundService }))
            end
        end
    end

    Client:GetAttributeChangedSignal("Kills"):Connect(Misc.KillPlayer) -- its not returning anything so
end
-- fuck this i hate fuck this fuck fuckf usdjfvdjoicvplxckvb ;zlxmvp salkdfvplsdmkfgsdf gedfghahahah ahahahahaahahahahaahahahahaahahahahaahahahahaahahahahaahahahahaahahahahaahahahahaahahahahaahahahahaahahahahaahahahahaahahahahaahahahahaahahahahaahahahahaahahahahaahahahahaahahahahaahahahahaahahahahaahahahahaahahahahaahahahahaahahahahaahahahahaahahahahaahahahahaahahahahaahahahahaahahahahaahahahahaahahahahaahahahahaahahahaha

do -- Hooks
    do -- team bullshit
        local Old; Old = hookfunction(Constants["TeamSelection"].chooseTeam, newcclosure(function(Team, ...)
            if Menu["Flags"]["Exploit"]["BypassTeamBalance"].Value == true then
                Remotes.TeamSelection.SelectTeam.Send(Team)
                -- Constants["TeamSelection"].closeFrame()
                return
            end
            return Old(Team, ...)
        end))
    end

    do -- Force Backstab
        local Old; Old = hookfunction(Remotes.Melee.MeleeAttack.Send, newcclosure(function(Data, ...)
            if Menu["Flags"]["Exploit"]["ForceBackStab"].Value then
                if Data then
                    Data["MeleeAttack"] = "BackStab"
                end
            end
            return Old(Data, ...)
        end))
    end

    do -- Fall damage
        local Old; Old = hookfunction(Remotes.Character.FallDamage.Send, newcclosure(function(Data, ...)
            if Menu["Flags"]["Exploit"]["BypassFallDMG"].Value then
                return nil;
            end
            return Old(Data, ...)
        end))
    end

    do -- override ping
        local Old; Old = hookfunction(Remotes.Player.ReportPlayerConnect.Send, newcclosure(function(Ping)
            if Menu["Flags"]["Exploit"]["SpoofPing"].Value then
                if Menu["Flags"]["Exploit"]["RandomPingShit"].Value then
                    Ping = tostring(MathRandom(Menu["Flags"]["Exploit"]["MinPingRandom"].Value, Menu["Flags"]["Exploit"]["MaxPingRandom"].Value))
                else
                    Ping = tostring(Menu["Flags"]["Exploit"]["SpoofPingValue"].Value)
                end
            end
            return Old(Ping);
        end))
    end

--[[
Flags reference.
(ive been diagnosed with autism and i can't remember stuff very well)
                local SkinChanger = MiscSection:ExpandableToggle({ Name = "Inventory Changer" , Category = "Misc", Flag = "EnableChanger", Unsafe = false, Size = 500 });
                SkinChanger:Toggle({ Name = "Knife Changer", Category = "Misc", Flag = "KnifeChanger", Unsafe = false });
                SkinChanger:Dropdown({Name = "Knife Changer List", Flag = "KnifeChangerList", Options = Constants["Knives"], Default = Constants["Knives"][1], Size = 200, Category = "Misc"});
                SkinChanger:Dropdown({Name = "Knife Changer Skins List", Flag = "KnifeChangerSkinsList", Options = 
]]

    do -- skin changer

        Constants["Signals"]["KnifeChanged"]:Connect(function(Knife, SkinsListKnife)
            local Skins = Constants["SkinsIndex"][Knife]
            if Skins and SkinsListKnife then
                local FirstValue = Skins[1]

                SkinsListKnife:Close()
                SkinsListKnife.Options = Skins

                if TableFind(Skins, "Stock") then
                    SkinsListKnife:Set("Stock")
                    SkinsListKnife.Value = "Stock"
                elseif TableFind(Skins, "Vanilla") then
                    SkinsListKnife:Set("Vanilla")
                    SkinsListKnife.Value = "Vanilla"
                end

                SkinsListKnife:Update()
            end
            --[[
            RunOnFixedThread(1, function()
                if not Constants["InventoryController"].getCurrentEquipped() then return end

                local Name = nil;
                local _ID = nil;
                local Skin = "Stock";
                local Float = 0;
                local Identifier = nil;

                local Inventory = Constants["InventoryController"].getCurrentInventory()
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

                Constants["InventoryController"].removeInventoryItem(Identifier)
                Constants["InventoryController"].newInventoryItem({
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
            end)]]
        end)

        Constants["Signals"]["GloveChanged"]:Connect(function(Glove, GloveList)
            local Skins = Constants["SkinsIndex"][Glove]
            if Glove and GloveList then
                local FirstValue = Skins[1]

                GloveList:Close()
                GloveList.Options = Skins

                if TableFind(Skins, "Stock") then
                    GloveList:Set("Stock")
                    GloveList.Value = "Stock"
                elseif TableFind(Skins, "Vanilla") then
                    GloveList:Set("Vanilla")
                    GloveList.Value = "Vanilla"
                end

                GloveList:Update()
            end
        end)

        Constants["Signals"]["GunChanged"]:Connect(function(Gun, GunList)
            local Skins = Constants["SkinsIndex"][Gun]
            if Gun and GunList then
                local FirstValue = Skins[1]

                local Data = Menu.Flags["GunSkinChanger_Data"]

                local Success, CurrentTable = pcall(HttpService.JSONDecode, HttpService, Data.Value)
                if not Success or Typeof(CurrentTable) ~= "table" then
                    CurrentTable = {}
                end

                GunList:Close()
                GunList.Options = Skins
                if not CurrentTable[Gun] then
                    if TableFind(Skins, "Stock") then
                        GunList:Set("Stock")
                        GunList.Value = "Stock"
                    elseif TableFind(Skins, "Vanilla") then
                        GunList:Set("Vanilla")
                        GunList.Value = "Vanilla"
                    end
                end

                if CurrentTable[Gun] then
                    GunList:Set(CurrentTable[Gun])
                    GunList.Value = CurrentTable[Gun]
                end
                GunList:Update()
            end
        end)

        Constants["Signals"]["GunSkinChanged"]:Connect(function(Gun, Skin)
            local Data = Menu.Flags["GunSkinChanger_Data"]

            local Success, CurrentTable = pcall(HttpService.JSONDecode, HttpService, Data.Value)
            if not Success or Typeof(CurrentTable) ~= "table" then
                CurrentTable = {}
            end

            if Skin and Typeof(Skin) ~= "string" then return end
            CurrentTable[tostring(Gun)] = tostring(Skin)
            Data.Set(HttpService:JSONEncode(CurrentTable))
        end)

        Constants["Signals"]["KnifeSkinChanged"]:Connect(function()
            RunOnFixedThread(1, function()
                if not Constants["InventoryController"].getCurrentEquipped() then return end

                local Name = nil;
                local _ID = nil;
                local Skin = "Stock";
                local Float = 0;
                local Identifier = nil;

                local Inventory = Constants["InventoryController"].getCurrentInventory()
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

                Constants["InventoryController"].removeInventoryItem(Identifier)
                Constants["InventoryController"].newInventoryItem({
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
        end)

        local Old; Old = hookfunction(Constants["InventoryController"].newInventoryItem, newcclosure(function(Data, ...)

            if Menu.Flags["Misc"]["EnableChanger"].Value then
                if Data._id and Data.weapon and Data.skin then
                    if TableFind(Constants["Knives"], Data.weapon) and Menu.Flags["Misc"]["KnifeChanger"].Value then
                        local Knife = Menu.Flags["Misc"]["KnifeChangerList"].Value or Data.weapon;
                        local ExistingSkins = Constants["SkinsIndex"][Knife]
                        local Skin = (Menu.Flags["Misc"]["KnifeChangerSkinsList"].Value or TableFind(ExistingSkins, "Stock") and "Stock" or "Vanilla");

                        Data.weapon = Knife;
                        Data.skin = Skin;
                        Data._id = Knife .. "_" .. Skin;
                    end

                    if not Data.OriginalOwner or Data.OriginalOwner == Client.Name then

                        local SkinData = Menu.Flags["GunSkinChanger_Data"]
                        local Success, DecodedData = pcall(HttpService.JSONDecode, HttpService, SkinData.Value)
                        local CurrentTable = (Success and Typeof(DecodedData) == "table") and DecodedData or {}
                        
                        if Data.weapon and CurrentTable[Data.weapon] then
                            Data.skin = CurrentTable[Data.weapon]
                        end
                    end

                end
            end
            
            return Old(Data, ...);
        end))


        do -- Gloves
            local Old; Old = hookfunction(Constants["SkinsModule"].GetGloves, newcclosure(function(...)
                local Arguments = {...}
                if ClientTable.IsAlive() and not ClientTable.IsBusy() and Menu.Flags["Misc"]["EnableChanger"].Value and Menu.Flags["Misc"]["GloveChanger"].Value then
                    if Arguments[1] and Typeof(Arguments[1]) == "string" then
                        if TableFind(Constants["Gloves"], Arguments[1]) then
                            Arguments[1] = (Menu.Flags["Misc"]["GloveChangerList"].Value or Arguments[1]);
                            Arguments[2] = (Menu.Flags["Misc"]["GloveChangerSkinsList"].Value or Arguments[2]);
                        end
                    end
                end

                return Old(TableUnpack(Arguments));
            end))
        end
    end

    do -- namecall hook
        --[[local OldNamecall; OldNamecall = hookmetamethod(game, "__namecall", newcclosure(function(Self, ...)     
            local Method = getnamecallmethod()
            local Arguments = {...}
            
            if Method == "Raycast" and Self == workspace then
                local Origin = Arguments[1]
                local Direction = Arguments[2]
                local RayParameters = Arguments[3]
                
                if RayParameters then
                    if RayParameters.CollisionGroup == "Bullet" then

                    end
                end
            end
            
            return OldNamecall(Self, ...) 
        end))]]
    end

    do -- shoot gun handler
        local Old; Old = hookfunction(Constants["ShootGun"].Send, newcclosure(function(BulletData, ...)
            local IsThisRagebot = false

            if BulletData["Ragebot"] then
                BulletData["Ragebot"] = nil;
                IsThisRagebot = true;
            end
            if (BulletData and BulletData.Bullets) then
                local Bullets = BulletData.Bullets
                for BulletIndex = 1, #Bullets do
                    local CurrentBullet = Bullets[BulletIndex]
                    local Hits = CurrentBullet.Hits

                    if not Hits or #Hits == 0 then continue end

                    for HitIndex = 1, #Hits do
                        local HitInstance = Hits[HitIndex].Instance

                        if not HitInstance then continue end

                        local HitCharacter = HitInstance:FindFirstAncestorOfClass("Model")

                        if not HitCharacter then continue end

                        local HitPlayer = GetPlayerFromCharacter(Players, HitCharacter)

                        if HitPlayer and HitPlayer ~= Client then
                            RunOnFixedThread(8, Misc.HitPlayer)
                            break
                        end
                    end
                end
            end
            
            return Old(BulletData, ...)
        end))
    end
end

do -- Hooks
    local ToNotTrust = nil;
    local Old; Old = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
        local Method = getnamecallmethod();
        local ScriptCalling = getcallingscript();

        local Arguments = {...}

        if Method == "FakeIndex" then
            if ScriptCalling then
                ToNotTrust = ScriptCalling;
            end
            return false, 'FakeIndex is not a valid member of DataModel "Ugc"'
        end

        if ScriptCalling and ToNotTrust and ScriptCalling == ToNotTrust then
            return Old(self, ...);
        end

        if Method == "PivotTo" then
            if self and self.Parent == Camera and IsA(self, "Model") then
                if Menu.Flags["VisualThirdPerson"].Value and Menu.Flags["ThirdPersonKey"].Active then
                    Arguments[1] = Constants["ThirdPersonViewmodelOffset"]
                end
            end
        end

        return Old(self, TableUnpack(Arguments, 1, #Arguments));
    end))
end

RunService:BindToRenderStep("_", Enum.RenderPriority.Camera.Value + 1, function()
    _DrawingObject.Update()
    Misc.Movement()
    Ragebot.Think()
    Visuals.Tick()
    Ragebot["KnifeBot"].Think()
end)

RunService.RenderStepped:Connect(function()
    for Key, This in ESP["Entity"] do
        if This["Functions"] then
            This["Functions"]["Render"]()
        end
    end
end)
