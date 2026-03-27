-- not mine

local Core = {} do
    local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/lelo0002/hai../refs/heads/main/roxylinoria.lua'))()
    local ThemeManager = loadstring(game:HttpGet('https://raw.githubusercontent.com/lelo0002/hai../refs/heads/main/theme.lua'))()
    local SaveManager = loadstring(game:HttpGet('https://raw.githubusercontent.com/mstudio45/LinoriaLib/main/addons/SaveManager.lua'))()
    local Options = Library.Options
    local Toggles = Library.Toggles
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local Lighting = game:GetService("Lighting")
    local UserInputService = game:GetService("UserInputService")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local workspace = game:GetService("Workspace")
    local LocalPlayer = Players.LocalPlayer
    local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
    local Camera = workspace.CurrentCamera
    local PlayersFolder = workspace:WaitForChild("Players")
    local HudGui = PlayerGui:WaitForChild("HudScreenGui")
    local Hud = HudGui.Main.DisplayStatus
    local player = LocalPlayer
    Core.HideSleevesEnabled = false
    Core.AimbotEnabled = false
    Core.AimbotPredDropEnabled = false
    Core.StickyAim = false
    Core.WallCheck = false
    Core.CachedTarget = nil
    Core.NextTargetUpdate = 0
    Core.MaxAimDistance = 500
    Core.CurrentFont = 2
    Core.SnapLineMethod = "Gun Barrel"
    Core.GunBarrel = nil
    Core.FovPositionMethod = "Mouse"
    Core.HasKnife = false
    Core.StartTime = tick()
    Core.AntiAimEnabled = false
    Core.AntiAimYawEnabled = false
    Core.AntiAimYawAngle = 0
    Core.AntiAimYawWaveRate = 1
    Core.AntiAimYawWaveDegree = 0
    Core.AntiAimYawType = "Custom"
    Core.AntiAimPitchEnabled = false
    Core.AntiAimPitchAngle = 0
    Core.AntiAimPitchWaveRate = 0
    Core.AntiAimPitchType = "Custom"
    Core.AntiAimSpinBotEnabled = false
    Core.AntiAimSpinBotType = "Custom"
    Core.AntiAimSpinBotDegreeRate = 0
    Core.AntiAimSpinBotWaveRate = 0
    Core.InstantAim = false
    Core.InstantEquip = false
    local FontMap = {
        ["UI"] = 0,
        ["System"] = 1,
        ["Plex"] = 2,
        ["Monospace"] = 3
    }
    local SafeFonts = {
        0,
        1,
        2,
        3
    }
    Core.NameCache = setmetatable({}, {
        __mode = "k"
    })
    Core.EntryCache = setmetatable({}, {
        __mode = "k"
    })
    Core.VisualHealth = setmetatable({}, {
        __mode = "k"
    })
    Core.HealthCache = Core.HealthCache or setmetatable({}, {
        __mode = "k"
    })
    Core.FadeCache = setmetatable({}, {
        __mode = "k"
    })
    Core.HealthTextFadeCache = setmetatable({}, {
        __mode = "k"
    })
    Core.FadeTime = 0.15
    Core.AimbotType = "Closest To Mouse"
    Core.Smoothness = 0.1
    Core.HideArmsEnabled = false
    Core.ArmTransparencyOriginals = setmetatable({}, {
        __mode = "k"
    })
    Core.AimVelocity = 1200
    Core.TEAM = {
        PHANTOMS = Color3.fromRGB(155, 182, 255),
        GHOSTS = Color3.fromRGB(231, 183, 88)
    }
    Core.BODY_COLOR = {
        PHANTOMS = Color3.fromRGB(54, 75, 90),
        GHOSTS = Color3.fromRGB(89, 69, 56)
    }
    Core.SnapEnabled = false
    Core.ShowFOV = false
    Core.FOVRadius = 120
    Core.FOVColor = Color3.fromRGB(255, 255, 255)
    Core.AimKey = Enum.UserInputType.MouseButton2
    Core.HoldingKey = false
    Core.LockedTarget = nil
    Core.TARGET_UPDATE_RATE = 0.08
    Core.MESH_IDS = {
        Head = "128240072851827",
        Torso = "130888355860552"
    }
    Core.OriginalClockTime = Lighting.ClockTime
    Core.CustomClockTimeEnabled = false
    Core.CustomClockTimeValue = 12
    Core.SelectedAimPart = "Head"
    Core.TARGET_MESH_ID = Core.MESH_IDS[Core.SelectedAimPart]
    Core.CurrentHumanoid = nil
    Core.DynamicFOVEnabled = false
    Core.DynamicFOVMultiplier = 1.85
    Core.DynamicFOVSpeedIn = 0.05
    Core.UnlockAll = false
    Core.UnlockCamos = false
    Core.UnlockKnives = false
    Core.UnlockAttachments = false
    Core.RealWeapons = {
        Assault = {},
        Scout = {},
        Support = {},
        Recon = {}
    }
    Core.FakeWeapons = {
        Assault = {},
        Scout = {},
        Support = {},
        Recon = {}
    }
    Core.DynamicFOVSpeedOut = 0.05
    Core.SelectedSleeveTexture = "rbxassetid://2163189692"
    Core.OriginalOffsets = {}
    Core.ViewmodelOffsetCFrame = CFrame.identity
    function Core:UpdateViewmodelOffset()
        self.ViewmodelOffsetCFrame = CFrame.new(self.ViewmodelOffsetX or 0, self.ViewmodelOffsetY or 0, -(self.ViewmodelOffsetZ or 0))
    end
    Core.ViewmodelOffsetEnabled = false
    Core.ViewmodelOffsetRemoveOnAim = false
    Core.ViewmodelOffsetX = 0
    Core.ViewmodelOffsetY = 0
    Core.ViewmodelOffsetZ = 0
    local SleeveTextureIds = {
        Default = "rbxassetid://2163189692",
        Beach = "rbxassetid://7582881674",
        Camo = "rbxassetid://819001409"
    }
    Core.ChamsType = "Highlight"
    Core.ChamsBehavior = "AlwaysOnTop"
    Core.CurrentFOVRadius = Core.FOVRadius
    Core.KillConnection = nil
    Core.LastLockedModel = nil
    Core.KillNotifyEnabled = false
    Core.SilentHeadshotChance = 100
    Core.RayParams = RaycastParams.new()
    Core.RayParams.FilterType = Enum.RaycastFilterType.Exclude
    Core.RayParams.IgnoreWater = true
    Core.TARGET_WALKSPEED = 16
    Core.WalkSpeedEnabled = false
    Core.newSpawnCache = {
        walkSpeed = 16,
        lastUpdate = nil,
        lastUpdateTime = 0,
        latency = 0,
        currentAddition = 0,
        updateDebt = 0
    }
    Core.MasterEnabled = false
    Core.HighlightEnabled = false
    Core.WeaponMasterEnabled = false
    Core.ArmHighlights = setmetatable({}, {
        __mode = "k"
    })
    Core.ArmsMaterialEnabled = false
    Core.ArmsMaterialColor = Color3.fromRGB(84, 132, 171)
    Core.ArmsMaterialEnum = Enum.Material.ForceField
    Core.SelectedArmForcefieldTexture = "Honeycomb"
    Core.ArmOriginals = setmetatable({}, {
        __mode = "k"
    })
    Core.MaterialMap = {
        ForceField = Enum.Material.ForceField,
        Neon = Enum.Material.Neon,
        SmoothPlastic = Enum.Material.SmoothPlastic,
        Glass = Enum.Material.Glass,
        Metal = Enum.Material.Metal
    }
    Core.FillColor = Color3.fromRGB(84, 132, 171)
    Core.OutlineColor = Color3.fromRGB(255, 255, 255)
    Core.HighlightFillTransparency = 0.4
    Core.WeaponHighlights = setmetatable({}, {
        __mode = "k"
    })
    Core.WeaponHighlightEnabled = false
    Core.WeaponMaterialEnabled = false
    Core.WeaponMaterialColor = Color3.fromRGB(84, 132, 171)
    Core.WeaponMaterialEnum = Enum.Material.ForceField
    Core.SelectedWeaponForcefieldTexture = "Honeycomb"
    Core.WeaponMaterialOriginals = setmetatable({}, {
        __mode = "k"
    })
    Core.HideGunEnabled = false
    Core.HideGunOriginals = setmetatable({}, {
        __mode = "k"
    })
    Core.HealthESPEnabled = false
    Core.HealthTextEnabled = false
    Core.HealthTextColor = Color3.fromRGB(255, 255, 255)
    Core.HealthHighColor = Color3.fromRGB(0, 255, 0)
    Core.HealthLowColor = Color3.fromRGB(255, 0, 0)
    Core.HealthGradientEnabled = false
    Core.WeaponMaterialMap = {
        ForceField = Enum.Material.ForceField,
        Neon = Enum.Material.Neon,
        SmoothPlastic = Enum.Material.SmoothPlastic,
        Glass = Enum.Material.Glass,
        Metal = Enum.Material.Metal
    }
    Core.WeaponFillColor = Color3.fromRGB(84, 132, 171)
    Core.WeaponOutlineColor = Color3.fromRGB(255, 255, 255)
    Core.WeaponFillTransparency = 0.4
    Core.OriginalValues = {
        Ambient = Lighting.Ambient
    }
    Core.CAmbientColor = Color3.fromRGB(84, 132, 171)
    Core.ChamsEnabled = false
    Core.ViewModelEnabled = false
    Core.Offset = Vector3.zero
    Core.Roots = {}
    Core.BaseCF = setmetatable({}, {
        __mode = "k"
    })
    Core.LastScan = 0
    Core.ScanInterval = 0.25
    Core.ChamsColor = Color3.fromRGB(84, 132, 171)
    Core.ChamsTransparency = 0.5
    Core.ChamsShrinkDefault = 1.2
    Core.DistanceESPEnabled = false
    Core.DistanceMax = 750
    Core.DistanceTextColor = Color3.fromRGB(255, 255, 255)
    Core.WeaponTextColor = Color3.fromRGB(255, 255, 255)
    Core.DistanceDrawings = {}
    Core.WeaponDrawings = {}
    Core.DistanceTorsoCache = setmetatable({}, {
        __mode = "k"
    })
    Core.DistanceTeamTick = 0
    Core.ActiveChams = setmetatable({}, {
        __mode = "k"
    })
    Core.ChamsLastTeamCheck = 0
    Core.NameESPEnabled = false
    Core.SkyboxEnabled = false
    Core.SelectedSky = "ElegantMorning"
    Core.Skyboxes = {
        Space = {
            Bk = "rbxassetid://159454299",
            Dn = "rbxassetid://159454296",
            Ft = "rbxassetid://159454293",
            Lf = "rbxassetid://159454286",
            Rt = "rbxassetid://159454300",
            Up = "rbxassetid://159454288"
        },
        Dark = {
            Bk = "rbxassetid://12064107",
            Dn = "rbxassetid://12064152",
            Ft = "rbxassetid://12064121",
            Lf = "rbxassetid://12063984",
            Rt = "rbxassetid://12064115",
            Up = "rbxassetid://12064131"
        },
        Pink = {
            Bk = "rbxassetid://11427769401",
            Dn = "rbxassetid://11427770685",
            Ft = "rbxassetid://11427769401",
            Lf = "rbxassetid://11427769401",
            Rt = "rbxassetid://11427769401",
            Up = "rbxassetid://11427771954"
        },
        PurpleNebula = {
            Bk = "rbxassetid://129876530632297",
            Dn = "rbxassetid://108406529909981",
            Ft = "rbxassetid://104400530594543",
            Lf = "rbxassetid://73372229972523",
            Rt = "rbxassetid://87408857415924",
            Up = "rbxassetid://137817405681365"
        },
        Red = {
            Bk = "rbxassetid://401664839",
            Dn = "rbxassetid://401664862",
            Ft = "rbxassetid://401664960",
            Lf = "rbxassetid://401664881",
            Rt = "rbxassetid://401664901",
            Up = "rbxassetid://401664936"
        },
        White = {
            Bk = "rbxassetid://6213159304",
            Dn = "rbxassetid://6213218651",
            Ft = "rbxassetid://6213159304",
            Lf = "rbxassetid://6213159304",
            Rt = "rbxassetid://6213159304",
            Up = "rbxassetid://6213176544"
        },
        Cartoon1 = {
            Bk = "rbxassetid://15114954171",
            Dn = "rbxassetid://15114958869",
            Ft = "rbxassetid://15114963740",
            Lf = "rbxassetid://15114957947",
            Rt = "rbxassetid://15114955238",
            Up = "rbxassetid://15114948718"
        },
        Cartoon2 = {
            Bk = "rbxassetid://6295671271",
            Dn = "rbxassetid://6295671382",
            Ft = "rbxassetid://6295671136",
            Lf = "rbxassetid://6295670996",
            Rt = "rbxassetid://6295671509",
            Up = "rbxassetid://6295671667"
        },
        PurpleClouds = {
            Bk = "rbxassetid://151165214",
            Dn = "rbxassetid://151165197",
            Ft = "rbxassetid://151165224",
            Lf = "rbxassetid://151165191",
            Rt = "rbxassetid://151165206",
            Up = "rbxassetid://151165227"
        },
        CloudySkies = {
            Bk = "rbxassetid://151165214",
            Dn = "rbxassetid://151165197",
            Ft = "rbxassetid://151165224",
            Lf = "rbxassetid://151165191",
            Rt = "rbxassetid://151165206",
            Up = "rbxassetid://151165227"
        },
        PurpleAndBlue = {
            Bk = "rbxassetid://149397692",
            Dn = "rbxassetid://149397686",
            Ft = "rbxassetid://149397697",
            Lf = "rbxassetid://149397684",
            Rt = "rbxassetid://149397688",
            Up = "rbxassetid://149397702"
        },
        VividSkies = {
            Bk = "rbxassetid://271042516",
            Dn = "rbxassetid://271077243",
            Ft = "rbxassetid://271042556",
            Lf = "rbxassetid://271042310",
            Rt = "rbxassetid://271042467",
            Up = "rbxassetid://271077958"
        },
        Twighlight = {
            Bk = "rbxassetid://264908339",
            Dn = "rbxassetid://264907909",
            Ft = "rbxassetid://264909420",
            Lf = "rbxassetid://264909758",
            Rt = "rbxassetid://264908886",
            Up = "rbxassetid://264907379"
        },
        Vaporwave = {
            Bk = "rbxassetid://1417494030",
            Dn = "rbxassetid://1417494146",
            Ft = "rbxassetid://1417494253",
            Lf = "rbxassetid://1417494402",
            Rt = "rbxassetid://1417494499",
            Up = "rbxassetid://1417494643"
        },
        Clouds = {
            Bk = "rbxassetid://570557514",
            Dn = "rbxassetid://570557775",
            Ft = "rbxassetid://570557559",
            Lf = "rbxassetid://570557620",
            Rt = "rbxassetid://570557672",
            Up = "rbxassetid://570557727"
        },
        NightSky = {
            Bk = "rbxassetid://12064107",
            Dn = "rbxassetid://12064152",
            Ft = "rbxassetid://12064121",
            Lf = "rbxassetid://12063984",
            Rt = "rbxassetid://12064115",
            Up = "rbxassetid://12064131"
        },
        SettingSun = {
            Bk = "rbxassetid://626460377",
            Dn = "rbxassetid://626460216",
            Ft = "rbxassetid://626460513",
            Lf = "rbxassetid://626473032",
            Rt = "rbxassetid://626458639",
            Up = "rbxassetid://626460625"
        },
        FadeBlue = {
            Bk = "rbxassetid://153695414",
            Dn = "rbxassetid://153695352",
            Ft = "rbxassetid://153695452",
            Lf = "rbxassetid://153695320",
            Rt = "rbxassetid://153695383",
            Up = "rbxassetid://153695471"
        },
        ElegantMorning = {
            Bk = "rbxassetid://153767241",
            Dn = "rbxassetid://153767216",
            Ft = "rbxassetid://153767266",
            Lf = "rbxassetid://153767200",
            Rt = "rbxassetid://153767231",
            Up = "rbxassetid://153767288"
        },
        Neptune = {
            Bk = "rbxassetid://218955819",
            Dn = "rbxassetid://218953419",
            Ft = "rbxassetid://218954524",
            Lf = "rbxassetid://218958493",
            Rt = "rbxassetid://218957134",
            Up = "rbxassetid://218950090"
        },
        Redshift = {
            Bk = "rbxassetid://401664839",
            Dn = "rbxassetid://401664862",
            Ft = "rbxassetid://401664960",
            Lf = "rbxassetid://401664881",
            Rt = "rbxassetid://401664901",
            Up = "rbxassetid://401664936"
        },
        AestheticNight = {
            Bk = "rbxassetid://1045964490",
            Dn = "rbxassetid://1045964368",
            Ft = "rbxassetid://1045964655",
            Lf = "rbxassetid://1045964655",
            Rt = "rbxassetid://1045964655",
        }
    }
    Core.ForceFieldTextures = {
        ["Off"] = "rbxassetid://0",
        ["Web"] = "rbxassetid://301464986",
        ["Webbed"] = "rbxassetid://2179243880",
        ["Scanning"] = "rbxassetid://5843010904",
        ["Pixelated"] = "rbxassetid://140652787",
        ["Swirl"] = "rbxassetid://8133639623",
        ["Checkerboard"] = "rbxassetid://5790215150",
        ["Christmas"] = "rbxassetid://6853532738",
        ["Player"] = "rbxassetid://4494641460",
        ["Shield"] = "rbxassetid://361073795",
        ["Dots"] = "rbxassetid://5830615971",
        ["Bubbles"] = "rbxassetid://1461576423",
        ["Matrix"] = "rbxassetid://10713189068",
        ["Honeycomb"] = "rbxassetid://179898251",
        ["Groove"] = "rbxassetid://10785404176",
        ["Cloud"] = "rbxassetid://5176277457",
        ["Sky"] = "rbxassetid://1494603972",
        ["Smudge"] = "rbxassetid://6096634060",
        ["Scrapes"] = "rbxassetid://6248583558",
        ["Galaxy"] = "rbxassetid://1120738433",
        ["Galaxies"] = "rbxassetid://5101923607",
        ["Stars"] = "rbxassetid://598201818",
        ["Rainbow"] = "rbxassetid://10037165803",
        ["Wires"] = "rbxassetid://14127933",
        ["Camo"] = "rbxassetid://3280937154",
        ["Hexagon"] = "rbxassetid://6175083785",
        ["Particles"] = "rbxassetid://1133822388",
        ["Triangular"] = "rbxassetid://4504368932",
        ["Wall"] = "rbxassetid://4271279"
    }
    Core.NameDrawings = {}
    Core.NameHeadCache = setmetatable({}, {
        __mode = "k"
    })
    Core.NoJumpCooldownEnabled = false
    Core.HoldingJump = false
    Core.NoFallDamageEnabled = false
    Core.movementCache = {
        time = {},
        position = setmetatable({}, {
            __mode = "k"
        })
    }
    Core.BoxESPEnabled = false
    Core.BoxDrawings = {}
    Core.BoxOutlineDrawings = {}
    Core.HealthDrawings = {}
    Core.HealthOutlineDrawings = {}
    Core.HealthTextDrawings = {}
    Core.BoxColor = Color3.fromRGB(255, 255, 255)
    Core.BoxThickness = 0.5
    Core.BoxOutlineThickness = 3
    Core.BoxMaxDistance = Core.DistanceMax
    Core.GunshotOverride = false
    Core.SelectedSound = "Minecraft experience"
    Core.SoundVolume = 1
    Core.SoundBackup = setmetatable({}, {
        __mode = "k"
    })
    Core.ValidSoundIds = {}
    Core.SoundMap = {
        ["Minecraft experience"] = "rbxassetid://7151570575",
        Neverlose = "rbxassetid://8726881116",
        Gamesense = "rbxassetid://4817809188",
        One = "rbxassetid://7380502345",
        Bell = "rbxassetid://6534947240",
        Rust = "rbxassetid://1255040462",
        TF2 = "rbxassetid://2868331684",
        Slime = "rbxassetid://6916371803",
        ["Among Us"] = "rbxassetid://5700183626",
        Minecraft = "rbxassetid://4018616850",
        ["CS:GO"] = "rbxassetid://6937353691",
        Saber = "rbxassetid://8415678813",
        Baimware = "rbxassetid://3124331820",
        Osu = "rbxassetid://7149255551",
        ["TF2 Critical"] = "rbxassetid://296102734",
        Bat = "rbxassetid://3333907347",
        ["Call of Duty"] = "rbxassetid://5952120301",
        Bubble = "rbxassetid://6534947588",
        Pick = "rbxassetid://1347140027",
        Pop = "rbxassetid://198598793",
        Bruh = "rbxassetid://4275842574",
        ["[Bamboo]"] = "rbxassetid://3769434519",
        Crowbar = "rbxassetid://546410481",
        Weeb = "rbxassetid://6442965016",
        Beep = "rbxassetid://8177256015",
        Bambi = "rbxassetid://8437203821",
        Stone = "rbxassetid://3581383408",
        ["Old Fatality"] = "rbxassetid://6607142036",
        Click = "rbxassetid://8053704437",
        Ding = "rbxassetid://7149516994",
        Snow = "rbxassetid://6455527632",
        Laser = "rbxassetid://7837461331",
        Mario = "rbxassetid://2815207981",
        Steve = "rbxassetid://4965083997",
        Snowdrake = "rbxassetid://7834724809",
        Default = "rbxassetid://4581728529"
    }
    Core.HitSoundSelected = "rbxassetid://8726881116"
    Core.HitSoundVolume = 1
    Core.HitSoundOverride = false
    Core.HitSoundBackup = setmetatable({}, {
        __mode = "k"
    })
    Core.HitSoundMap = {
        ["Minecraft experience"] = "rbxassetid://7151570575",
        Neverlose = "rbxassetid://8726881116",
        Gamesense = "rbxassetid://4817809188",
        One = "rbxassetid://7380502345",
        Bell = "rbxassetid://6534947240",
        Rust = "rbxassetid://1255040462",
        TF2 = "rbxassetid://2868331684",
        Slime = "rbxassetid://6916371803",
        ["Among Us"] = "rbxassetid://5700183626",
        Minecraft = "rbxassetid://4018616850",
        ["CS:GO"] = "rbxassetid://6937353691",
        Saber = "rbxassetid://8415678813",
        Baimware = "rbxassetid://3124331820",
        Osu = "rbxassetid://7149255551",
        ["TF2 Critical"] = "rbxassetid://296102734",
        Bat = "rbxassetid://3333907347",
        ["Call of Duty"] = "rbxassetid://5952120301",
        Bubble = "rbxassetid://6534947588",
        Pick = "rbxassetid://1347140027",
        Pop = "rbxassetid://198598793",
        Bruh = "rbxassetid://4275842574",
        ["[Bamboo]"] = "rbxassetid://3769434519",
        Crowbar = "rbxassetid://546410481",
        Weeb = "rbxassetid://6442965016",
        Beep = "rbxassetid://8177256015",
        Bambi = "rbxassetid://8437203821",
        Stone = "rbxassetid://3581383408",
        ["Old Fatality"] = "rbxassetid://6607142036",
        Click = "rbxassetid://8053704437",
        Ding = "rbxassetid://7149516994",
        Snow = "rbxassetid://6455527632",
        Laser = "rbxassetid://7837461331",
        Mario = "rbxassetid://2815207981",
        Steve = "rbxassetid://4965083997",
        Snowdrake = "rbxassetid://7834724809",
        Default = "rbxassetid://4581728529"
    }
    Core.KillSoundSelected = "rbxassetid://4817809188"
    Core.KillSoundVolume = 1
    Core.KillSoundOverride = false
    Core.KillSoundBackup = setmetatable({}, {
        __mode = "k"
    })
    Core.KillSoundMap = {
        ["Minecraft experience"] = "rbxassetid://7151570575",
        Neverlose = "rbxassetid://8726881116",
        Gamesense = "rbxassetid://4817809188",
        One = "rbxassetid://7380502345",
        Bell = "rbxassetid://6534947240",
        Rust = "rbxassetid://1255040462",
        TF2 = "rbxassetid://2868331684",
        Slime = "rbxassetid://6916371803",
        ["Among Us"] = "rbxassetid://5700183626",
        Minecraft = "rbxassetid://4018616850",
        ["CS:GO"] = "rbxassetid://6937353691",
        Saber = "rbxassetid://8415678813",
        Baimware = "rbxassetid://3124331820",
        Osu = "rbxassetid://7149255551",
        ["TF2 Critical"] = "rbxassetid://296102734",
        Bat = "rbxassetid://3333907347",
        ["Call of Duty"] = "rbxassetid://5952120301",
        Bubble = "rbxassetid://6534947588",
        Pick = "rbxassetid://1347140027",
        Pop = "rbxassetid://198598793",
        Bruh = "rbxassetid://4275842574",
        ["[Bamboo]"] = "rbxassetid://3769434519",
        Crowbar = "rbxassetid://546410481",
        Weeb = "rbxassetid://6442965016",
        Beep = "rbxassetid://8177256015",
        Bambi = "rbxassetid://8437203821",
        Stone = "rbxassetid://3581383408",
        ["Old Fatality"] = "rbxassetid://6607142036",
        Click = "rbxassetid://8053704437",
        Ding = "rbxassetid://7149516994",
        Snow = "rbxassetid://6455527632",
        Laser = "rbxassetid://7837461331",
        Mario = "rbxassetid://2815207981",
        Steve = "rbxassetid://4965083997",
        Snowdrake = "rbxassetid://7834724809",
        Default = "rbxassetid://4581728529"
    }
    if not Core.HitSoundSelected then
        Core.HitSoundSelected = "rbxassetid://8726881116"
    end
    if not Core.KillSoundSelected then
        Core.KillSoundSelected = "rbxassetid://4817809188"
    end
    local WeaponRoots = {
        ReplicatedStorage.Content.ProductionContent.WeaponDatabase["TWO HAND BLUNT"],
        ReplicatedStorage.Content.ProductionContent.WeaponDatabase,
        ReplicatedStorage.Content.ProductionContent.WeaponDatabase["ASSAULT RIFLE"],
        ReplicatedStorage.Content.ProductionContent.WeaponDatabase["BATTLE RIFLE"],
        ReplicatedStorage.Content.ProductionContent.WeaponDatabase.CARBINE,
        ReplicatedStorage.Content.ProductionContent.WeaponDatabase.DMR,
        ReplicatedStorage.Content.ProductionContent.WeaponDatabase.FRAGMENTATION,
        ReplicatedStorage.Content.ProductionContent.WeaponDatabase["HIGH EXPLOSIVE"],
        ReplicatedStorage.Content.ProductionContent.WeaponDatabase.IMPACT,
        ReplicatedStorage.Content.ProductionContent.WeaponDatabase.LMG,
        ReplicatedStorage.Content.ProductionContent.WeaponDatabase["MACHINE PISTOLS"],
        ReplicatedStorage.Content.ProductionContent.WeaponDatabase["ONE HAND BLADE"],
        ReplicatedStorage.Content.ProductionContent.WeaponDatabase["ONE HAND BLUNT"],
        ReplicatedStorage.Content.ProductionContent.WeaponDatabase.OTHER,
        ReplicatedStorage.Content.ProductionContent.WeaponDatabase.PDW,
        ReplicatedStorage.Content.ProductionContent.WeaponDatabase.PISTOLS,
        ReplicatedStorage.Content.ProductionContent.WeaponDatabase.REVOLVERS,
        ReplicatedStorage.Content.ProductionContent.WeaponDatabase.SHOTGUN,
        ReplicatedStorage.Content.ProductionContent.WeaponDatabase["SNIPER RIFLE"],
        ReplicatedStorage.Content.ProductionContent.WeaponDatabase["TWO HAND BLADE"]
    }
    Core.CrosshairTop = true
    Core.CrosshairRight = true
    Core.CrosshairBottom = true
    Core.CrosshairLeft = true
    local STYLE_SIDES = {
        ["1"] = {
            Top = true,
            Right = true,
            Bottom = true,
            Left = true
        },
        ["2"] = {
            Top = true,
            Right = false,
            Bottom = true,
            Left = false
        },
        ["3"] = {
            Top = true,
            Right = true,
            Bottom = true,
            Left = false
        }
    }
    Core.CrosshairEnabled = false
    Core.CrosshairColor = Color3.fromRGB(255, 255, 255)
    Core.CrosshairSpin = false
    Core.CrosshairSize = 25
    Core.CrosshairSpinSpeed = 25
    Core.CrosshairThickness = 2
    Core.CrosshairGap = 6
    Core.CrosshairSides = {
        Top = true,
        Bottom = true,
        Left = true,
        Right = true
    }
    Core.CrosshairPositionMode = "Center Of Screen"
    Core.SilentEnabled = false
    Core.SilentHolding = false
    Core.SilentSticky = false
    Core.SilentWallCheck = false
    Core.SilentHitChance = 50
    Core.SilentPriority = "Closest To Mouse"
    Core.SilentShowFOV = false
    Core.SilentDynamicFOV = false
    Core.SilentFOVRadius = 120
    Core.SilentCurrentFOV = 120
    Core.SilentFOVColor = Color3.fromRGB(255, 255, 255)
    Core.SilentSnapEnabled = false
    Core.SilentSnapColor = Color3.fromRGB(255, 255, 255)
    Core.SilentSnapOriginMethod = "Gun Barrel"
    Core.SilentFOVOriginMethod = "Gun Barrel"
    Core.SilentLockedPart = nil
    Core.SilentMaxAimDistance = 500
    Core.SilentOriginalCF = nil
    Core.SilentHeartbeat = nil
    Core.SILENT_MESH_IDS = {
        Head = "128240072851827",
        Torso = "130888355860552"
    }
    Core.SilentAimPart = "Head"
    Core.SILENT_TARGET_MESH = Core.SILENT_MESH_IDS[Core.SilentAimPart]
    local function ClearAll()
        for _, h in pairs(Core.ArmHighlights) do
            pcall(function()
                h:Destroy()
            end)
        end
        table.clear(Core.ArmHighlights)
    end
    local function SetSleeveSlotsTransparency(value)
        for _, obj in ipairs(Camera:GetChildren()) do
            if obj:IsA("Model") then
                local sleeves = obj:FindFirstChild("Sleeves", true)
                if sleeves and sleeves:IsA("MeshPart") then
                    if sleeves.Transparency ~= value then
                        sleeves.Transparency = value
                    end
                    for _, tex in ipairs(sleeves:GetChildren()) do
                        if tex:IsA("Texture") and tex.Name == "Slot1" and tex.Transparency ~= value then
                            tex.Transparency = value
                        end
                    end
                end
            end
        end
    end
    local function CreateHighlight(part)
        if Core.ArmHighlights[part] or not Core.HighlightEnabled then
            return
        end
        if not part:IsA("MeshPart") or part.Name ~= "SkinTone" then
            return
        end
        local h = Instance.new("Highlight")
        h.Adornee = part
        h.FillColor = Core.FillColor
        h.OutlineColor = Core.OutlineColor
        h.FillTransparency = Core.HighlightFillTransparency
        h.OutlineTransparency = 0
        h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        h.Parent = part
        Core.ArmHighlights[part] = h
    end
    local function getArmModels()
        local arms = {}
        for _, obj in ipairs(Camera:GetChildren()) do
            if obj:IsA("Model") then
                if obj:FindFirstChild("SkinTone", true) then
                    table.insert(arms, obj)
                end
            end
        end
        return arms
    end
    local function applyArmMaterial()
        local texture = Core.ForceFieldTextures[Core.SelectedArmForcefieldTexture or "Off"]
        for _, model in ipairs(getArmModels()) do
            for _, part in ipairs(model:GetDescendants()) do
                if part:IsA("MeshPart") then
                    if not Core.ArmOriginals[part] then
                        Core.ArmOriginals[part] = {
                            Material = part.Material,
                            Color = part.Color,
                            TextureId = part.TextureID
                        }
                    end
                    if part.Material ~= Core.ArmsMaterialEnum then
                        part.Material = Core.ArmsMaterialEnum
                    end
                    if part.Color ~= Core.ArmsMaterialColor then
                        part.Color = Core.ArmsMaterialColor
                    end
                    local targetTex = (Core.ArmsMaterialEnum == Enum.Material.ForceField) and texture or ""
                    if part.TextureID ~= targetTex then
                        part.TextureID = targetTex
                    end
                elseif part:IsA("SpecialMesh") then
                    if not Core.ArmOriginals[part] then
                        Core.ArmOriginals[part] = {
                            TextureId = part.TextureId
                        }
                    end
                    local targetTex = (Core.ArmsMaterialEnum == Enum.Material.ForceField) and texture or ""
                    if part.TextureId ~= targetTex then
                        part.TextureId = targetTex
                    end
                end
            end
        end
    end
    local function restoreArmMaterial()
        for part, data in pairs(Core.ArmOriginals) do
            if part and (part:IsDescendantOf(Camera) or part:IsDescendantOf(workspace)) then
                if part:IsA("BasePart") then
                    part.Material = data.Material
                    part.Color = data.Color
                    if part:IsA("MeshPart") then
                        part.TextureID = data.TextureId
                    end
                elseif part:IsA("SpecialMesh") then
                    part.TextureId = data.TextureId
                end
            end
        end
        table.clear(Core.ArmOriginals)
    end
    local function applyHideArms()
        for _, model in ipairs(getArmModels()) do
            for _, part in ipairs(model:GetDescendants()) do
                if part:IsA("BasePart") and part.Name ~= "Sleeves" then
                    if not Core.ArmTransparencyOriginals[part] and part.Transparency < 0.9 then
                        Core.ArmTransparencyOriginals[part] = {
                            Trans = part.Transparency,
                            LTrans = part.LocalTransparencyModifier
                        }
                    end
                    if part.Transparency ~= 1 then
                        part.Transparency = 1
                    end
                    if part.LocalTransparencyModifier ~= 1 then
                        part.LocalTransparencyModifier = 1
                    end
                end
            end
        end
    end
    local function restoreHideArms()
        for part, data in pairs(Core.ArmTransparencyOriginals) do
            if part and (part:IsDescendantOf(Camera) or part:IsDescendantOf(workspace)) then
                if type(data) == "table" then
                    part.Transparency = data.Trans
                    part.LocalTransparencyModifier = data.LTrans
                else
                    part.Transparency = data
                end
            end
        end
        table.clear(Core.ArmTransparencyOriginals)
    end
    RunService.Heartbeat:Connect(function()
        if not Core.MasterEnabled and not Core.ThirdPersonHideChar then
            if next(Core.ArmOriginals) then
                restoreArmMaterial()
            end
            if next(Core.ArmTransparencyOriginals) then
                restoreHideArms()
            end
            SetSleeveSlotsTransparency(0)
            for part, h in pairs(Core.ArmHighlights) do
                pcall(function()
                    h:Destroy()
                end)
                Core.ArmHighlights[part] = nil
            end
            return
        end
        if Core.ArmsMaterialEnabled or Core.ThirdPersonHideChar then
            applyArmMaterial()
        else
            restoreArmMaterial()
        end
        if Core.HideSleevesEnabled or Core.ThirdPersonHideChar then
            SetSleeveSlotsTransparency(1)
        else
            SetSleeveSlotsTransparency(0)
        end
        if Core.HideArmsEnabled or Core.ThirdPersonHideChar then
            applyHideArms()
        elseif next(Core.ArmTransparencyOriginals) then
            restoreHideArms()
        end
        for part, h in pairs(Core.ArmHighlights) do
            if not part or not part:IsDescendantOf(Camera) or not Core.HighlightEnabled then
                pcall(function()
                    h:Destroy()
                end)
                Core.ArmHighlights[part] = nil
            end
        end
        if Core.HighlightEnabled then
            for _, obj in ipairs(Camera:GetDescendants()) do
                if obj:IsA("MeshPart") and obj.Name == "SkinTone" then
                    CreateHighlight(obj)
                end
            end
        end
    end)
    local function modelHasSleeves(model)
        return model:FindFirstChild("Sleeves", true) ~= nil
    end
    local function getWeaponModel()
        for _, model in ipairs(Camera:GetChildren()) do
            if model:IsA("Model") and not modelHasSleeves(model) then
                return model
            end
        end
        return nil
    end
    local function clearWeaponHighlights()
        for _, h in pairs(Core.WeaponHighlights) do
            pcall(function()
                h:Destroy()
            end)
        end
        table.clear(Core.WeaponHighlights)
    end
    local function applyWeaponHighlight(model)
        if not model or Core.WeaponHighlights[model] or not Core.WeaponHighlightEnabled then
            return
        end
        local h = Instance.new("Highlight")
        h.Adornee = model
        h.FillColor = Core.WeaponFillColor
        h.OutlineColor = Core.WeaponOutlineColor
        h.FillTransparency = Core.WeaponFillTransparency
        h.OutlineTransparency = 0
        h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        h.Parent = model
        Core.WeaponHighlights[model] = h
    end
    RunService.Heartbeat:Connect(function()
        if not Core.WeaponMasterEnabled then
            return
        end
        local weaponModel = getWeaponModel()
        for model, h in pairs(Core.WeaponHighlights) do
            if not model or not model:IsDescendantOf(Camera) or not Core.WeaponHighlightEnabled or model ~= weaponModel then
                pcall(function()
                    h:Destroy()
                end)
                Core.WeaponHighlights[model] = nil
            end
        end
        if not Core.WeaponHighlightEnabled then
            return
        end
        if weaponModel then
            applyWeaponHighlight(weaponModel)
        end
    end)
    local function applyWeaponMaterial(model)
        if not model then
            return
        end
        local texture = Core.ForceFieldTextures[Core.SelectedWeaponForcefieldTexture or "Off"]
        for _, part in ipairs(model:GetDescendants()) do
            if part:IsA("MeshPart") then
                if not Core.WeaponMaterialOriginals[part] then
                    Core.WeaponMaterialOriginals[part] = {
                        Material = part.Material,
                        Color = part.Color,
                        TextureId = part.TextureID
                    }
                end
                if part.Material ~= Core.WeaponMaterialEnum then
                    part.Material = Core.WeaponMaterialEnum
                end
                if part.Color ~= Core.WeaponMaterialColor then
                    part.Color = Core.WeaponMaterialColor
                end
                local targetTex = (Core.WeaponMaterialEnum == Enum.Material.ForceField) and texture or ""
                if part.TextureID ~= targetTex then
                    part.TextureID = targetTex
                end
            elseif part:IsA("BasePart") then
                if not Core.WeaponMaterialOriginals[part] then
                    Core.WeaponMaterialOriginals[part] = {
                        Material = part.Material,
                        Color = part.Color
                    }
                end
                if part.Material ~= Core.WeaponMaterialEnum then
                    part.Material = Core.WeaponMaterialEnum
                end
                if part.Color ~= Core.WeaponMaterialColor then
                    part.Color = Core.WeaponMaterialColor
                end
            elseif part:IsA("SpecialMesh") then
                if not Core.WeaponMaterialOriginals[part] then
                    Core.WeaponMaterialOriginals[part] = {
                        TextureId = part.TextureId
                    }
                end
                local targetTex = (Core.WeaponMaterialEnum == Enum.Material.ForceField) and texture or ""
                if part.TextureId ~= targetTex then
                    part.TextureId = targetTex
                end
            end
        end
    end
    local function restoreWeaponMaterial()
        for part, data in pairs(Core.WeaponMaterialOriginals) do
            if part and (part:IsDescendantOf(Camera) or part:IsDescendantOf(workspace)) then
                if part:IsA("BasePart") then
                    part.Material = data.Material
                    part.Color = data.Color
                    if part:IsA("MeshPart") then
                        part.TextureID = data.TextureId
                    end
                elseif part:IsA("SpecialMesh") then
                    part.TextureId = data.TextureId
                end
            end
        end
        table.clear(Core.WeaponMaterialOriginals)
    end
    local function applyHideGun(model)
        if not model then
            return
        end
        for _, part in ipairs(model:GetDescendants()) do
            if part:IsA("BasePart") or part:IsA("Decal") or part:IsA("Texture") then
                if not Core.HideGunOriginals[part] and part.Transparency < 0.9 then
                    Core.HideGunOriginals[part] = {
                        Trans = part.Transparency,
                        LTrans = part:IsA("BasePart") and part.LocalTransparencyModifier or nil
                    }
                end
                if part.Transparency ~= 1 then
                    part.Transparency = 1
                end
                if part:IsA("BasePart") and part.LocalTransparencyModifier ~= 1 then
                    part.LocalTransparencyModifier = 1
                end
            end
        end
    end
    local function restoreHideGun()
        for part, data in pairs(Core.HideGunOriginals) do
            if part and part:IsDescendantOf(Camera) then
                if type(data) == "table" then
                    part.Transparency = data.Trans
                    if part:IsA("BasePart") and data.LTrans then
                        part.LocalTransparencyModifier = data.LTrans
                    end
                else
                    part.Transparency = data
                end
            end
        end
        table.clear(Core.HideGunOriginals)
    end
    RunService.Heartbeat:Connect(function()
        if Core.WeaponMasterEnabled then
            local weaponModel = getWeaponModel()
            if weaponModel then
                if Core.WeaponMaterialEnabled then
                    applyWeaponMaterial(weaponModel)
                end
            end
        end
        if not Core.WeaponMasterEnabled or not Core.WeaponMaterialEnabled then
            if next(Core.WeaponMaterialOriginals) then
                restoreWeaponMaterial()
            end
        end
        if not Core.WeaponMasterEnabled or not Core.HideGunEnabled then
            if next(Core.HideGunOriginals) then
                restoreHideGun()
            end
        end
    end)
    RunService.RenderStepped:Connect(function()
        if Core.WeaponMasterEnabled and Core.HideGunEnabled then
            local weaponModel = getWeaponModel()
            if weaponModel then
                applyHideGun(weaponModel)
            end
        end
    end)
    local SnapOutline = Drawing.new("Line")
    SnapOutline.Thickness = 3
    SnapOutline.Color = Color3.new(0, 0, 0)
    SnapOutline.Transparency = 1
    SnapOutline.Visible = false
    local SnapLine = Drawing.new("Line")
    SnapLine.Thickness = 1
    SnapLine.Color = Color3.fromRGB(255, 255, 255)
    SnapLine.Transparency = 1
    SnapLine.Visible = false
    local FOVOutline = Drawing.new("Circle")
    FOVOutline.Filled = false
    FOVOutline.Thickness = 3
    FOVOutline.Color = Color3.new(0, 0, 0)
    FOVOutline.Transparency = 1
    FOVOutline.Visible = false
    local FOVCircle = Drawing.new("Circle")
    FOVCircle.Filled = false
    FOVCircle.Thickness = 1
    FOVCircle.Color = Core.FOVColor
    FOVCircle.Transparency = 1
    FOVCircle.Visible = false
    Core.FOVFill = Drawing.new("Circle")
    Core.FOVFill.Filled = true
    Core.FOVFill.Thickness = 0
    Core.FOVFill.Color = Color3.fromRGB(83, 132, 171)
    Core.FOVFill.Transparency = 0.5
    Core.FOVFill.Visible = false
    local function isOnScreen(part)
        local screenPos, onScreen = Camera:WorldToViewportPoint(part.Position)
        return onScreen
    end
    local function isVisible(part)
        if not Core.WallCheck then
            return true
        end
        if not part or not part:IsA("BasePart") or not part:IsDescendantOf(workspace) then
            return false
        end
        if not isOnScreen(part) then
            return false
        end
        local origin = Camera.CFrame.Position
        local targetPos = part.Position
        local direction = targetPos - origin
        local distance = direction.Magnitude
        direction = direction.Unit * (distance + 0.5)
        local params = RaycastParams.new()
        params.FilterType = Enum.RaycastFilterType.Exclude
        params.FilterDescendantsInstances = {
            LocalPlayer.Character,
            Camera
        }
        params.IgnoreWater = true
        local result = workspace:Raycast(origin, direction, params)
        if not result then
            return true
        end
        if result.Instance:IsDescendantOf(part.Parent) then
            return true
        end
        local tolerance = part.Size.Magnitude * 0.75
        if (result.Position - targetPos).Magnitude <= tolerance then
            return true
        end
        return false
    end
    local LocalTeam = nil
    local validPatternSleeves = nil
    local function getLocalTeam()
        if validPatternSleeves and validPatternSleeves:IsDescendantOf(Camera) then
            local tex = validPatternSleeves:FindFirstChild("Slot1")
            if tex and tex:IsA("Texture") then
                local c = tex.Color3
                if c == Core.TEAM.PHANTOMS then
                    return "PHANTOMS"
                elseif c == Core.TEAM.GHOSTS then
                    return "GHOSTS"
                end
            end
        end
        for _, obj in ipairs(Camera:GetDescendants()) do
            if obj:IsA("MeshPart") and obj.Name == "Sleeves" then
                validPatternSleeves = obj
                for _, tex in ipairs(obj:GetChildren()) do
                    if tex:IsA("Texture") and tex.Name == "Slot1" then
                        local c = tex.Color3
                        if c == Core.TEAM.PHANTOMS then
                            return "PHANTOMS"
                        elseif c == Core.TEAM.GHOSTS then
                            return "GHOSTS"
                        end
                    end
                end
            end
        end
        return nil
    end
    local function isEnemy(part)
        if not LocalTeam then
            return false
        end
        if not part or not part:IsDescendantOf(workspace) then
            return false
        end
        local pparent = part.Parent
        local torso
        for _, p in ipairs(pparent:GetChildren()) do
            if p:IsA("MeshPart") and p.MeshId and p.MeshId:find(Core.MESH_IDS.Torso) then
                torso = p
                break
            end
        end
        if not torso then
            return false
        end
        local torsoColor = torso.Color
        if LocalTeam == "PHANTOMS" then
            return torsoColor == Core.BODY_COLOR.GHOSTS
        elseif LocalTeam == "GHOSTS" then
            return torsoColor == Core.BODY_COLOR.PHANTOMS
        end
        return false
    end
    local function checkEnemyByModel(model)
        local torso = Core.DistanceTorsoCache and Core.DistanceTorsoCache[model]
        if torso == false then
            return false
        end
        if not torso or not torso:IsDescendantOf(model) then
            for _, v in ipairs(model:GetDescendants()) do
                if v:IsA("MeshPart") and v.MeshId and v.MeshId:find(Core.MESH_IDS.Torso) then
                    torso = v
                    if Core.DistanceTorsoCache then
                        Core.DistanceTorsoCache[model] = v
                    end
                    break
                end
            end
        end
        if not torso then
            if Core.DistanceTorsoCache then
                Core.DistanceTorsoCache[model] = false
            end
            return false
        end
        if not LocalTeam then
            return true
        end
        local c = torso.Color
        if LocalTeam == "PHANTOMS" then
            return c == Core.BODY_COLOR.GHOSTS
        elseif LocalTeam == "GHOSTS" then
            return c == Core.BODY_COLOR.PHANTOMS
        end
        return false
    end
    Core.AimPartCache = Core.AimPartCache or setmetatable({}, {
        __mode = "k"
    })
    local function getCachedTargetPart(model)
        local c = Core.AimPartCache[model]
        if c == false then
            return nil
        end
        if c and c:IsDescendantOf(model) and c.MeshId:find(Core.TARGET_MESH_ID) then
            return c
        end
        for _, v in ipairs(model:GetDescendants()) do
            if v:IsA("MeshPart") and v.MeshId and v.MeshId:find(Core.TARGET_MESH_ID) then
                Core.AimPartCache[model] = v
                return v
            end
        end
        Core.AimPartCache[model] = false
        return nil
    end
    local function getTargetParts()
        local t = {}
        for model, _ in pairs(Core.NameDrawings or {}) do
            if checkEnemyByModel(model) then
                local part = getCachedTargetPart(model)
                if part then
                    t[#t + 1] = part
                end
            end
        end
        return t
    end
    local function getClosestTarget()
        local camPos = Camera.CFrame.Position
        local origin
        if Core.FovPositionMethod == "Gun Barrel" then
            if Core.HasKnife or not Core.GunBarrel or not Core.GunBarrel:IsDescendantOf(Camera) then
                return nil
            end
            local forwardOffset = 7.5
            local worldPos = Core.GunBarrel.Position + (Core.GunBarrel.CFrame.LookVector * forwardOffset)
            local v, onScreen = Camera:WorldToViewportPoint(worldPos)
            if not onScreen then
                return nil
            end
            origin = Vector2.new(v.X, v.Y)
        else
            origin = UserInputService:GetMouseLocation()
        end
        local closest = nil
        local shortest = math.huge
        for _, part in ipairs(getTargetParts()) do
            if part and part:IsDescendantOf(workspace) then
                local worldDist = (camPos - part.Position).Magnitude
                if worldDist <= Core.MaxAimDistance then
                    local pos, onScreen = Camera:WorldToViewportPoint(part.Position)
                    if onScreen and isVisible(part) then
                        local screenDist = (Vector2.new(pos.X, pos.Y) - origin).Magnitude
                        if screenDist <= Core.FOVRadius then
                            if Core.AimbotType == "Closest To You" then
                                if worldDist < shortest then
                                    shortest = worldDist
                                    closest = part
                                end
                            else
                                if screenDist < shortest then
                                    shortest = screenDist
                                    closest = part
                                end
                            end
                        end
                    end
                end
            end
        end
        return closest
    end
    UserInputService.InputBegan:Connect(function(input, gpe)
        if gpe then
            return
        end
        if input.KeyCode == Core.AimKey or input.UserInputType == Core.AimKey then
            Core.HoldingKey = true
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.KeyCode == Core.AimKey or input.UserInputType == Core.AimKey then
            Core.HoldingKey = false
            Core.LockedTarget = nil
            Core.LastLockedModel = nil
            if Core.KillConnection then
                Core.KillConnection:Disconnect()
                Core.KillConnection = nil
            end
        end
    end)
    RunService.Heartbeat:Connect(function()
        local newTeam = getLocalTeam()
        if newTeam and LocalTeam ~= newTeam then
            table.clear(Core.EnemyCache)
            table.clear(Core.EntryCache or {})
            LocalTeam = newTeam
        end
    end)
    local insert = table.insert
    local ipairs = ipairs
    local pairs = pairs
    local clock = os.clock
    Core.ActiveChams = Core.ActiveChams and setmetatable(Core.ActiveChams, {
        __mode = "k"
    }) or setmetatable({}, {
        __mode = "k"
    })
    Core.ChamsTicks = Core.ChamsTicks and setmetatable(Core.ChamsTicks, {
        __mode = "k"
    }) or setmetatable({}, {
        __mode = "k"
    })
    Core.CachedOnScreen = Core.CachedOnScreen and setmetatable(Core.CachedOnScreen, {
        __mode = "k"
    }) or setmetatable({}, {
        __mode = "k"
    })
    Core.EnemyCache = Core.EnemyCache and setmetatable(Core.EnemyCache, {
        __mode = "k"
    }) or setmetatable({}, {
        __mode = "k"
    })
    Core.StreamingHold = Core.StreamingHold and setmetatable(Core.StreamingHold, {
        __mode = "k"
    }) or setmetatable({}, {
        __mode = "k"
    })
    local STREAM_HOLD_TIME = 0.35
    local function getTorso(model)
        local c = Core.DistanceTorsoCache[model]
        if c == false then
            return nil
        end
        if c and c:IsDescendantOf(model) then
            return c
        end
        for _, v in ipairs(model:GetDescendants()) do
            if v:IsA("MeshPart") and v.MeshId and v.MeshId:find(Core.MESH_IDS.Torso) then
                Core.DistanceTorsoCache[model] = v
                return v
            end
        end
        Core.DistanceTorsoCache[model] = false
        return nil
    end
    local function clearChams(model)
        local boxes = Core.ActiveChams[model]
        if not boxes then
            return
        end
        for i = 1, #boxes do
            local b = boxes[i]
            if b and b.Parent then
                b:Destroy()
            end
        end
        Core.ActiveChams[model] = nil
        Core.ChamsTicks[model] = nil
        Core.CachedOnScreen[model] = nil
    end
    local function isValidModel(model)
        return model:IsA("Model") and model:FindFirstChildWhichIsA("BasePart", true)
    end
    local function isEnemyModel(model)
        local cached = Core.EnemyCache[model]
        if cached ~= nil then
            return cached
        end
        if not LocalTeam then
            return false
        end
        local isEnm = checkEnemyByModel(model)
        Core.EnemyCache[model] = isEnm
        return isEnm
    end
    local function createBox(model, part, shrink)
        local boxes = Core.ActiveChams[model]
        if not boxes then
            boxes = {}
            Core.ActiveChams[model] = boxes
        end
        for i = 1, #boxes do
            local b = boxes[i]
            if b.Adornee == part then
                return b
            end
        end
        local box = Instance.new("BoxHandleAdornment")
        box.Adornee = part
        box.AlwaysOnTop = (Core.ChamsBehavior == "AlwaysOnTop")
        box.ZIndex = box.AlwaysOnTop and 10 or 0
        box.Size = part.Size / shrink
        box.Color3 = Core.ChamsColor
        box.Transparency = Core.ChamsTransparency
        box.Parent = part
        insert(boxes, box)
        return box
    end
    local ValidLimbs = {
        "head",
        "torso",
        "arm",
        "leg",
        "hand",
        "foot"
    }
    local function isValidLimb(part)
        if not part or not part:IsA("MeshPart") then
            return false
        end
        local n = string.lower(part.Name)
        for _, limb in ipairs(ValidLimbs) do
            if string.find(n, limb) then
                return true
            end
        end
        return false
    end
    local function applyChams(model)
        clearChams(model)
        local boxes = {}
        Core.ActiveChams[model] = boxes
        local color = Core.ChamsColor
        if Core.ChamsType == "Highlight" then
            local hl = Instance.new("Highlight")
            hl.Adornee = model
            hl.FillColor = color
            hl.OutlineColor = color
            hl.FillTransparency = Core.ChamsTransparency
            hl.OutlineTransparency = Core.ChamsTransparency
            hl.DepthMode = (Core.ChamsBehavior == "AlwaysOnTop") and Enum.HighlightDepthMode.AlwaysOnTop or Enum.HighlightDepthMode.Occluded
            hl.Parent = Core.CoreGui
            local success = pcall(function()
                hl.Parent = Core.CoreGui
            end)
            if not success then
                hl.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
            end
            insert(boxes, hl)
        else
            local shrink = (Core.ChamsBehavior == "Occluded") and (Core.ChamsShrinkDefault / 1.2) or Core.ChamsShrinkDefault
            for _, part in ipairs(model:GetDescendants()) do
                if isValidLimb(part) then
                    local box = createBox(model, part, shrink)
                    box.Color3 = color
                end
            end
        end
    end
    local function updateAllChams()
        local color = Core.ChamsColor
        local trans = Core.ChamsTransparency
        local shrink = (Core.ChamsBehavior == "Occluded") and (Core.ChamsShrinkDefault / 1.2) or Core.ChamsShrinkDefault
        local alwaysOnTop = (Core.ChamsBehavior == "AlwaysOnTop")
        local zIndex = alwaysOnTop and 10 or 0
        local depthMode = alwaysOnTop and Enum.HighlightDepthMode.AlwaysOnTop or Enum.HighlightDepthMode.Occluded
        for model, boxes in pairs(Core.ActiveChams) do
            for i = 1, #boxes do
                local b = boxes[i]
                if b then
                    if b:IsA("Highlight") then
                        b.FillColor = color
                        b.OutlineColor = color
                        b.FillTransparency = trans
                        b.OutlineTransparency = trans
                        b.DepthMode = depthMode
                    else
                        b.Color3 = color
                        b.Transparency = trans
                        b.AlwaysOnTop = alwaysOnTop
                        b.ZIndex = zIndex
                        if b.Adornee then
                            b.Size = b.Adornee.Size / shrink
                        end
                    end
                end
            end
        end
    end
    Core.ChamsHooked = Core.ChamsHooked and setmetatable(Core.ChamsHooked, {
        __mode = "k"
    }) or setmetatable({}, {
        __mode = "k"
    })
    local function hookModelRealtime(model)
        if not isValidModel(model) then
            return
        end
        if Core.ChamsHooked[model] then
            return
        end
        local conns = {}
        Core.ChamsHooked[model] = conns
        local function refresh()
            Core.EnemyCache[model] = nil
            if Core.ChamsEnabled and isEnemyModel(model) then
                applyChams(model)
            else
                clearChams(model)
            end
        end
        refresh()
        table.insert(conns, model.DescendantAdded:Connect(function(d)
            if not Core.ChamsEnabled or not isEnemyModel(model) then
                return
            end
            if Core.ChamsType == "Highlight" then
                return
            end
            if not isValidLimb(d) then
                return
            end
            local shrink = (Core.ChamsBehavior == "Occluded") and (Core.ChamsShrinkDefault / 1.2) or Core.ChamsShrinkDefault
            local box = createBox(model, d, shrink)
            box.Color3 = Core.ChamsColor
            box.Transparency = Core.ChamsTransparency
            box.AlwaysOnTop = (Core.ChamsBehavior == "AlwaysOnTop")
            box.ZIndex = box.AlwaysOnTop and 10 or 0
        end))
        table.insert(conns, model.DescendantRemoving:Connect(function(d)
            if Core.ChamsType == "Highlight" then
                return
            end
            if not d:IsA("BasePart") then
                return
            end
            local boxes = Core.ActiveChams[model]
            if boxes then
                for i = #boxes, 1, -1 do
                    local b = boxes[i]
                    if not b or b.Adornee == d or not b.Parent then
                        if b then
                            b:Destroy()
                        end
                        table.remove(boxes, i)
                    end
                end
            end
        end))
        table.insert(conns, model.AncestryChanged:Connect(function()
            Core.StreamingHold[model] = nil
            refresh()
        end))
    end
    local function processChams(model)
        if not model or not isValidModel(model) then
            return
        end
        Core.EnemyCache[model] = nil
        hookModelRealtime(model)
        if Core.ChamsEnabled and isEnemyModel(model) then
            applyChams(model)
        end
    end
    local function hookChamsFolder(folder)
        if not folder then
            return
        end
        for _, model in ipairs(folder:GetChildren()) do
            processChams(model)
        end
        folder.ChildAdded:Connect(function(m)
            if not m then
                return
            end
            processChams(m)
        end)
        folder.ChildRemoved:Connect(function(m)
            if not m then
                return
            end
            clearChams(m)
            Core.EnemyCache[m] = nil
            if Core.ChamsHooked[m] and type(Core.ChamsHooked[m]) == "table" then
                for _, conn in ipairs(Core.ChamsHooked[m]) do
                    conn:Disconnect()
                end
            end
            Core.ChamsHooked[m] = nil
        end)
    end
    for _, folder in ipairs(PlayersFolder:GetChildren()) do
        if folder and folder:IsA("Folder") then
            hookChamsFolder(folder)
        end
    end
    PlayersFolder.ChildAdded:Connect(function(folder)
        if folder and folder:IsA("Folder") then
            hookChamsFolder(folder)
        end
    end)
    local function createDistance(model)
        if Core.DistanceDrawings[model] then
            return
        end
        local d = Drawing.new("Text")
        d.Center = true
        d.Outline = true
        d.Size = 13
        if table.find(SafeFonts, Core.CurrentFont) then
            d.Font = Core.CurrentFont
        end
        d.Color = Core.DistanceTextColor
        d.Visible = false
        Core.DistanceDrawings[model] = d
    end
    local function createWeapon(model)
        if Core.WeaponDrawings[model] then
            return
        end
        local d = Drawing.new("Text")
        d.Center = true
        d.Outline = true
        d.Size = 13
        if table.find(SafeFonts, Core.CurrentFont) then
            d.Font = Core.CurrentFont
        end
        d.Color = Core.WeaponTextColor
        d.Visible = false
        Core.WeaponDrawings[model] = d
    end
    local function removeDistance(model)
        if Core.DistanceDrawings[model] then
            Core.DistanceDrawings[model]:Remove()
            Core.DistanceDrawings[model] = nil
        end
        if Core.WeaponDrawings[model] then
            Core.WeaponDrawings[model]:Remove()
            Core.WeaponDrawings[model] = nil
        end
        Core.DistanceTorsoCache[model] = nil
    end
    local function hookDistanceModel(model)
        if not model:IsA("Model") then
            return
        end
        createDistance(model)
        createWeapon(model)
        for _, c in ipairs(model:GetChildren()) do
            if c:IsA("Model") then
                createDistance(c)
                createWeapon(c)
            end
        end
    end
    for _, folder in ipairs(PlayersFolder:GetChildren()) do
        if folder:IsA("Folder") then
            for _, model in ipairs(folder:GetChildren()) do
                hookDistanceModel(model)
            end
            folder.ChildAdded:Connect(hookDistanceModel)
            folder.ChildRemoved:Connect(removeDistance)
        end
    end
    PlayersFolder.ChildAdded:Connect(function(folder)
        if folder:IsA("Folder") then
            folder.ChildAdded:Connect(hookDistanceModel)
            folder.ChildRemoved:Connect(removeDistance)
        end
    end)
    local function getNameHead(model)
        local c = Core.NameHeadCache[model]
        if c == false then
            return nil
        end
        if c and c:IsDescendantOf(model) then
            return c
        end
        for _, v in ipairs(model:GetDescendants()) do
            if v:IsA("MeshPart") and v.MeshId and v.MeshId:find(Core.MESH_IDS.Head) then
                Core.NameHeadCache[model] = v
                return v
            end
        end
        Core.NameHeadCache[model] = false
        return nil
    end
    local function getPlayerName(model)
        local cached = Core.NameCache[model]
        if cached ~= nil then
            return cached == false and nil or cached
        end
        for _, v in ipairs(model:GetDescendants()) do
            if v:IsA("TextLabel") and v.Name == "PlayerTag" then
                Core.NameCache[model] = v.Text
                return v.Text
            end
        end
        Core.NameCache[model] = false
        return nil
    end
    local function createName(model)
        if Core.NameDrawings[model] then
            return
        end
        local t = Drawing.new("Text")
        t.Center = true
        t.Outline = true
        t.Size = 13
        if table.find(SafeFonts, Core.CurrentFont) then
            t.Font = Core.CurrentFont
        end
        t.Color = Core.NameTextColor or Color3.new(1, 1, 1)
        t.Visible = false
        Core.NameDrawings[model] = t
    end
    local function removeName(model)
        if Core.NameDrawings[model] then
            Core.NameDrawings[model]:Remove()
            Core.NameDrawings[model] = nil
        end
        Core.NameHeadCache[model] = nil
    end
    local function hookNameModel(model)
        if not model:IsA("Model") then
            return
        end
        createName(model)
        for _, c in ipairs(model:GetChildren()) do
            if c:IsA("Model") then
                createName(c)
            end
        end
    end
    for _, folder in ipairs(PlayersFolder:GetChildren()) do
        if folder:IsA("Folder") then
            for _, model in ipairs(folder:GetChildren()) do
                hookNameModel(model)
            end
            folder.ChildAdded:Connect(hookNameModel)
            folder.ChildRemoved:Connect(removeName)
        end
    end
    PlayersFolder.ChildAdded:Connect(function(folder)
        if folder:IsA("Folder") then
            folder.ChildAdded:Connect(hookNameModel)
            folder.ChildRemoved:Connect(removeName)
        end
    end)
    local FOVCachedTarget = nil
    local FOVNextTargetUpdate = 0
    RunService.RenderStepped:Connect(function(dt)
        local mousePos = UserInputService:GetMouseLocation()
        local baseFOV = Core.FOVRadius
        local targetFOV = baseFOV
        if Core.DynamicFOVEnabled and Core.HoldingKey then
            targetFOV = baseFOV * Core.DynamicFOVMultiplier
        end
        local speed = (targetFOV > Core.CurrentFOVRadius) and Core.DynamicFOVSpeedIn or Core.DynamicFOVSpeedOut
        Core.CurrentFOVRadius = Core.CurrentFOVRadius + (targetFOV - Core.CurrentFOVRadius) * speed
        local fovOrigin
        local validFovOrigin = false
        if Core.FovPositionMethod == "Gun Barrel" then
            if not Core.HasKnife and Core.GunBarrel and Core.GunBarrel:IsDescendantOf(Camera) then
                local forwardOffset = 7.5
                local worldPos = Core.GunBarrel.Position + (Core.GunBarrel.CFrame.LookVector * forwardOffset)
                local v, onScreen = Camera:WorldToViewportPoint(worldPos)
                if onScreen then
                    fovOrigin = Vector2.new(v.X, v.Y)
                    validFovOrigin = true
                end
            end
            if not validFovOrigin and not Core.HasKnife then
                if Core.LastGunBarrelTime and (os.clock() - Core.LastGunBarrelTime) < 1 then
                else
                    fovOrigin = mousePos
                    validFovOrigin = true
                end
            end
        else
            fovOrigin = mousePos
            validFovOrigin = true
        end
        if Core.FOVLockOnTarget and Core.AimbotEnabled then
            local now = os.clock()
            if Core.LockedTarget and Core.LockedTarget:IsDescendantOf(workspace) then
                FOVCachedTarget = Core.LockedTarget
                FOVNextTargetUpdate = now + Core.TARGET_UPDATE_RATE
            elseif now >= FOVNextTargetUpdate then
                FOVCachedTarget = getClosestTarget()
                FOVNextTargetUpdate = now + Core.TARGET_UPDATE_RATE
            end
            if FOVCachedTarget and FOVCachedTarget:IsDescendantOf(workspace) then
                local pos, onScreen = Camera:WorldToViewportPoint(FOVCachedTarget.Position)
                if onScreen then
                    local targetPos = Vector2.new(pos.X, pos.Y)
                    if not Core.FOVCurrentOrigin then
                        Core.FOVCurrentOrigin = fovOrigin
                    end
                    Core.FOVCurrentOrigin = Core.FOVCurrentOrigin:Lerp(targetPos, math.clamp(dt * 22.5, 0, 1))
                    fovOrigin = Core.FOVCurrentOrigin
                    validFovOrigin = true
                else
                    if Core.FOVCurrentOrigin and (Core.FOVCurrentOrigin - fovOrigin).Magnitude > 1 then
                        Core.FOVCurrentOrigin = Core.FOVCurrentOrigin:Lerp(fovOrigin, math.clamp(dt * 22.5, 0, 1))
                        fovOrigin = Core.FOVCurrentOrigin
                    else
                        Core.FOVCurrentOrigin = nil
                    end
                end
            else
                if Core.FOVCurrentOrigin and (Core.FOVCurrentOrigin - fovOrigin).Magnitude > 1 then
                    Core.FOVCurrentOrigin = Core.FOVCurrentOrigin:Lerp(fovOrigin, math.clamp(dt * 22.5, 0, 1))
                    fovOrigin = Core.FOVCurrentOrigin
                else
                    Core.FOVCurrentOrigin = nil
                end
            end
        else
            if Core.FOVCurrentOrigin and (Core.FOVCurrentOrigin - fovOrigin).Magnitude > 1 then
                Core.FOVCurrentOrigin = Core.FOVCurrentOrigin:Lerp(fovOrigin, math.clamp(dt * 22.5, 0, 1))
                fovOrigin = Core.FOVCurrentOrigin
            else
                Core.FOVCurrentOrigin = nil
            end
        end
        FOVCircle.Visible = validFovOrigin and Core.ShowFOV
        FOVOutline.Visible = validFovOrigin and Core.ShowFOV
        Core.FOVFill.Visible = validFovOrigin and Core.ShowFOV
        if validFovOrigin then
            FOVCircle.Position = fovOrigin
            FOVOutline.Position = fovOrigin
            Core.FOVFill.Position = fovOrigin
            FOVCircle.Radius = Core.CurrentFOVRadius
            FOVOutline.Radius = Core.CurrentFOVRadius
            Core.FOVFill.Radius = Core.CurrentFOVRadius
            FOVCircle.Color = Core.FOVColor
            if Options["Core.FOVFillColor"] then
                Core.FOVFill.Color = Core.FOVFillColor or Color3.fromRGB(83, 132, 171)
                Core.FOVFill.Transparency = 1 - Options["Core.FOVFillColor"].Transparency
            end
        end
        if not Core.AimbotEnabled or not Core.HoldingKey or not validFovOrigin then
            Core.LockedTarget = nil
            return
        end
        local now = os.clock()
        if Core.StickyAim then
            if not Core.LockedTarget or not Core.LockedTarget:IsDescendantOf(workspace) then
                if now >= Core.NextTargetUpdate then
                    Core.LockedTarget = getClosestTarget()
                    Core.CachedTarget = Core.LockedTarget
                    Core.NextTargetUpdate = now + Core.TARGET_UPDATE_RATE
                else
                    Core.LockedTarget = Core.CachedTarget
                end
            end
        else
            if now >= Core.NextTargetUpdate then
                Core.LockedTarget = getClosestTarget()
                Core.CachedTarget = Core.LockedTarget
                Core.NextTargetUpdate = now + Core.TARGET_UPDATE_RATE
            else
                Core.LockedTarget = Core.CachedTarget
            end
        end
        if Core.LockedTarget then
            local targetPos3D = Core.LockedTarget.Position
            if (Core.AimbotPredDropEnabled or Core.AimbotPredictionEnabled) and Core.activeWeaponInterface and Core.publicSettings then
                local activeController = Core.activeWeaponInterface.getActiveWeaponController and Core.activeWeaponInterface.getActiveWeaponController()
                local activeWeapon = activeController and activeController:getActiveWeapon()
                if activeWeapon then
                    local targetVelocity = Vector3.zero
                    if Core.AimbotPredictionEnabled and Core.movementCache then
                        local player
                        local targetModel = Core.LockedTarget
                        for _ = 1, 4 do
                            if targetModel and targetModel:IsA("Model") and targetModel:FindFirstChild("PlayerTag", true) then
                                break
                            end
                            if targetModel then
                                targetModel = targetModel.Parent
                            end
                        end
                        if targetModel then
                            local targetName = getPlayerName(targetModel)
                            if targetName then
                                for _, p in pairs(Players:GetPlayers()) do
                                    if p.Name == targetName or p.DisplayName == targetName then
                                        player = p
                                        break
                                    end
                                end
                            end
                        end
                        if player and Core.movementCache.position[player] and Core.movementCache.position[player][15] and Core.movementCache.time[15] then
                            targetVelocity = (Core.movementCache.position[player][15] - Core.movementCache.position[player][1]) / (Core.movementCache.time[15] - Core.movementCache.time[1])
                        end
                    end
                    local speed = activeWeapon._weaponData.bulletspeed or 10000
                    local accel = Core.AimbotPredDropEnabled and (Core.publicSettings.bulletAcceleration or Vector3.new(0, -workspace.Gravity, 0)) or Vector3.zero
                    local origin = Camera.CFrame.Position
                    local velocity, time = Core.complexTrajectory(origin, accel, targetPos3D, speed, targetVelocity)
                    if time and time > 0 then
                        if Core.AimbotPredictionEnabled then
                            targetPos3D = targetPos3D + (targetVelocity * time)
                        end
                        if Core.AimbotPredDropEnabled then
                            targetPos3D = targetPos3D - (0.5 * accel * time * time)
                        end
                    end
                end
            end
            local pos = Camera:WorldToViewportPoint(targetPos3D)
            local targetPos = Vector2.new(pos.X, pos.Y)
            local diff = targetPos - mousePos
            local dist = diff.Magnitude
            if dist > 0 then
                local maxStep = Core.AimVelocity * dt
                local move
                if dist <= maxStep then
                    move = diff
                else
                    move = diff.Unit * maxStep
                end
                mousemoverel(move.X, move.Y)
            end
        end
    end)
    local OriginalSky = Lighting:FindFirstChild("OriginalSkyBackup")
    if not OriginalSky then
        local current = Lighting:FindFirstChildOfClass("Sky")
        if current then
            OriginalSky = current:Clone()
            OriginalSky.Name = "OriginalSkyBackup"
            OriginalSky.Parent = Lighting
        end
    end
    local function ApplySky(name)
        local data = Core.Skyboxes[name]
        if not data then
            return
        end
        local sky = Lighting:FindFirstChildOfClass("Sky")
        if sky then
            sky:Destroy()
        end
        sky = Instance.new("Sky")
        sky.SkyboxBk = data.Bk
        sky.SkyboxDn = data.Dn
        sky.SkyboxFt = data.Ft
        sky.SkyboxLf = data.Lf
        sky.SkyboxRt = data.Rt
        sky.SkyboxUp = data.Up
        sky.Parent = Lighting
    end
    local function RestoreSky()
        local sky = Lighting:FindFirstChildOfClass("Sky")
        if sky then
            sky:Destroy()
        end
        if OriginalSky then
            OriginalSky:Clone().Parent = Lighting
        end
    end
    if Core.SkyboxEnabled then
        ApplySky(Core.SelectedSky)
    else
        RestoreSky()
    end
    local aimbotSnapAlpha = 0
    local aimbotSnapWasDrawing = false
    RunService.RenderStepped:Connect(function(dt)
        if not Core.SnapEnabled then
            SnapLine.Visible = false
            SnapOutline.Visible = false
            aimbotSnapWasDrawing = false
            return
        end
        local now = os.clock()
        if Core.LockedTarget then
            Core.CachedTarget = Core.LockedTarget
        elseif now >= Core.NextTargetUpdate then
            Core.CachedTarget = getClosestTarget()
            Core.NextTargetUpdate = now + Core.TARGET_UPDATE_RATE
        end
        local target = Core.CachedTarget
        if not target or not target:IsDescendantOf(workspace) then
            SnapLine.Visible = false
            SnapOutline.Visible = false
            aimbotSnapWasDrawing = false
            return
        end
        local pos, onScreen = Camera:WorldToViewportPoint(target.Position)
        if not onScreen then
            SnapLine.Visible = false
            SnapOutline.Visible = false
            aimbotSnapWasDrawing = false
            return
        end
        local origin
        if Core.SnapLineMethod == "Gun Barrel" then
            if Core.HasKnife or not Core.GunBarrel or not Core.GunBarrel:IsDescendantOf(Camera) then
                SnapLine.Visible = false
                SnapOutline.Visible = false
                aimbotSnapWasDrawing = false
                return
            end
            local v, onscreen = Camera:WorldToViewportPoint(Core.GunBarrel.Position)
            if not onscreen then
                SnapLine.Visible = false
                SnapOutline.Visible = false
                aimbotSnapWasDrawing = false
                return
            end
            origin = Vector2.new(v.X, v.Y)
        else
            origin = UserInputService:GetMouseLocation()
        end
        local targetPos = Vector2.new(pos.X, pos.Y)
        if not aimbotSnapWasDrawing then
            aimbotSnapAlpha = 0
        end
        aimbotSnapWasDrawing = true
        aimbotSnapAlpha = math.clamp(aimbotSnapAlpha + (dt / 0.1), 0, 1)
        SnapOutline.From = origin
        SnapOutline.To = targetPos
        SnapOutline.Transparency = aimbotSnapAlpha
        SnapOutline.Visible = true
        SnapLine.From = origin
        SnapLine.To = targetPos
        SnapLine.Transparency = aimbotSnapAlpha
        SnapLine.Visible = true
    end)
    UserInputService.InputBegan:Connect(function(input, gp)
        if gp then
            return
        end
        if input.KeyCode == Enum.KeyCode.Space then
            Core.HoldingJump = true
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.Space then
            Core.HoldingJump = false
            local char = Core.charInterface and Core.charInterface.getCharacterObject()
            local hum = char and char._humanoid
            if hum then
                hum.Jump = false
            end
        end
    end)
    RunService.Heartbeat:Connect(function()
        if not Core.NoJumpCooldownEnabled or not Core.HoldingJump then
            return
        end
        local char = Core.charInterface and Core.charInterface.getCharacterObject()
        local hum = char and char._humanoid
        if hum and hum.Health > 0 then
            hum.Jump = true
        end
    end)
    local function collect()
        table.clear(Core.Roots)
        table.clear(Core.BaseCF)
        for _, model in ipairs(Camera:GetChildren()) do
            if model:IsA("Model") then
                local root = model.PrimaryPart or model:FindFirstChildWhichIsA("BasePart")
                if root then
                    model.PrimaryPart = root
                    Core.Roots[#Core.Roots + 1] = root
                    Core.BaseCF[root] = root.CFrame
                end
            end
        end
    end
    RunService:BindToRenderStep(
                        "ViewModelUpdater",
                        Enum.RenderPriority.Last.Value,
                        function(dt)
        if not Core.ViewModelEnabled then
            return
        end
        Core.LastScan += dt
        if Core.LastScan >= Core.ScanInterval then
            Core.LastScan = 0
            collect()
        end
        for _, root in ipairs(Core.Roots) do
            local base = Core.BaseCF[root]
            if root and base then
                root.CFrame = Camera.CFrame * CFrame.new(Core.Offset) * (Camera.CFrame:Inverse() * base)
            end
        end
    end
                    )
    local function reset()
        for root, cf in pairs(Core.BaseCF) do
            if root and root:IsDescendantOf(Camera) then
                root.CFrame = cf
            end
        end
    end
    local function createBox1(model)
        if Core.BoxDrawings[model] then
            return
        end
        local outline = Drawing.new("Square")
        outline.Color = Color3.new(0, 0, 0)
        outline.Thickness = Core.BoxOutlineThickness or 3
        outline.Filled = false
        outline.Visible = false
        local box = Drawing.new("Square")
        box.Color = Core.BoxColor
        box.Thickness = Core.BoxThickness or 1
        box.Filled = false
        box.Visible = false
        Core.BoxFillDrawings = Core.BoxFillDrawings or {}
        Core.BoxFillDrawings[model] = Drawing.new("Square")
        Core.BoxFillDrawings[model].Color = Core.BoxFillColor or Color3.fromRGB(84, 132, 171)
        Core.BoxFillDrawings[model].Thickness = 0
        Core.BoxFillDrawings[model].Filled = true
        Core.BoxFillDrawings[model].Visible = false
        Core.BoxOutlineDrawings[model] = outline
        Core.BoxDrawings[model] = box
    end
    local function removeBox(model)
        if Core.BoxDrawings[model] then
            Core.BoxDrawings[model]:Remove()
            Core.BoxDrawings[model] = nil
        end
        if Core.BoxOutlineDrawings[model] then
            Core.BoxOutlineDrawings[model]:Remove()
            Core.BoxOutlineDrawings[model] = nil
        end
        if Core.BoxFillDrawings and Core.BoxFillDrawings[model] then
            Core.BoxFillDrawings[model]:Remove()
            Core.BoxFillDrawings[model] = nil
        end
    end
    local function hookBoxModel(model)
        if not model:IsA("Model") then
            return
        end
        createBox1(model)
        for _, c in ipairs(model:GetChildren()) do
            if c:IsA("Model") then
                createBox1(c)
            end
        end
    end
    for _, folder in ipairs(PlayersFolder:GetChildren()) do
        if folder:IsA("Folder") then
            for _, model in ipairs(folder:GetChildren()) do
                hookBoxModel(model)
            end
            folder.ChildAdded:Connect(hookBoxModel)
            folder.ChildRemoved:Connect(removeBox)
        end
    end
    PlayersFolder.ChildAdded:Connect(function(folder)
        if folder:IsA("Folder") then
            folder.ChildAdded:Connect(hookBoxModel)
            folder.ChildRemoved:Connect(removeBox)
        end
    end)
    for _, root in ipairs(WeaponRoots) do
        for _, obj in ipairs(root:GetDescendants()) do
            if obj:IsA("ModuleScript") then
                local ok, data = pcall(require, obj)
                if ok and type(data) == "table" and type(data.firesoundid) == "string" then
                    Core.ValidSoundIds[data.firesoundid] = true
                end
            end
        end
    end
    local function applySound(s)
        if not s:IsA("Sound") then
            return
        end
        if not Core.ValidSoundIds[s.SoundId] then
            return
        end
        if not Core.SoundBackup[s] then
            Core.SoundBackup[s] = {
                Id = s.SoundId,
                Volume = s.Volume
            }
        end
        local id = Core.SoundMap[Core.SelectedSound]
        if id and s.SoundId ~= id then
            s.SoundId = id
        end
        s.Volume = Core.SoundVolume
    end
    local function restoreSound(s)
        local old = Core.SoundBackup[s]
        if old then
            s.SoundId = old.Id
            s.Volume = old.Volume
            Core.SoundBackup[s] = nil
        end
    end
    local function scan(m)
        for _, v in ipairs(m:GetDescendants()) do
            if v:IsA("Sound") then
                if Core.GunshotOverride then
                    applySound(v)
                else
                    restoreSound(v)
                end
            end
        end
    end
    RunService.RenderStepped:Connect(function()
        local cam = Camera
        if not cam then
            return
        end
        for _, obj in ipairs(cam:GetChildren()) do
            if obj:IsA("Model") then
                scan(obj)
            end
        end
    end)
    Core.CoreGui = game:GetService("CoreGui")
    Core.MiniUI = Instance.new("ScreenGui")
    Core.MiniUI.Name = "MiniLibUI"
    Core.MiniUI.ZIndexBehavior = Enum.ZIndexBehavior.Global
    Core.MiniUI.ResetOnSpawn = false
    Core.MiniUI.DisplayOrder = 999999999
    Core.MiniUI.Enabled = false
    Core.ProtectGui = protectgui or (syn and syn.protect_gui) or function()
    end
    pcall(Core.ProtectGui, Core.MiniUI)
    Core.Success = pcall(function()
        Core.MiniUI.Parent = Core.CoreGui
    end)
    if not Core.Success then
        Core.MiniUI.Parent = LocalPlayer:WaitForChild("PlayerGui")
    end
    Core.MiniMainColor = Color3.fromRGB(22, 22, 22)
    Core.MiniBackgroundColor = Color3.fromRGB(19, 19, 19)
    Core.MiniAccentColor = Color3.fromRGB(131, 146, 255)
    Core.MiniOutlineColor = Color3.fromRGB(30, 30, 30)
    Core.MiniBlackColor = Color3.new(0, 0, 0)
    Core.MiniOuterBorder = Instance.new("Frame")
    Core.MiniOuterBorder.Name = "OuterBorder"
    Core.MiniOuterBorder.BackgroundColor3 = Core.MiniBlackColor
    Core.MiniOuterBorder.BorderColor3 = Core.MiniBlackColor
    Core.MiniOuterBorder.BorderSizePixel = 0
    Core.MiniOuterBorder.Position = UDim2.new(0.5, -45, 0.5, 40)
    Core.MiniOuterBorder.Size = UDim2.new(0, 66, 0, 26)
    Core.MiniOuterBorder.Parent = Core.MiniUI
    Core.MiniDragButton = Instance.new("TextButton")
    Core.MiniDragButton.Name = "DragButton"
    Core.MiniDragButton.Size = UDim2.new(1, 40, 1, 40)
    Core.MiniDragButton.Position = UDim2.new(0, -20, 0, -20)
    Core.MiniDragButton.BackgroundTransparency = 1
    Core.MiniDragButton.Text = ""
    Core.MiniDragButton.ZIndex = 10
    Core.MiniDragButton.Parent = Core.MiniOuterBorder
    Core.MiniDragButton.Active = true
    Core.MiniMainOutline = Instance.new("Frame")
    Core.MiniMainOutline.Name = "MainOutline"
    Core.MiniMainOutline.BackgroundColor3 = Core.MiniOutlineColor
    Core.MiniMainOutline.BorderSizePixel = 0
    Core.MiniMainOutline.Position = UDim2.new(0, 1, 0, 1)
    Core.MiniMainOutline.Size = UDim2.new(1, -2, 1, -2)
    Core.MiniMainOutline.Parent = Core.MiniOuterBorder
    Core.MiniInnerBorder = Instance.new("Frame")
    Core.MiniInnerBorder.Name = "InnerBorder"
    Core.MiniInnerBorder.BackgroundColor3 = Core.MiniBlackColor
    Core.MiniInnerBorder.BorderSizePixel = 0
    Core.MiniInnerBorder.Position = UDim2.new(0, 1, 0, 1)
    Core.MiniInnerBorder.Size = UDim2.new(1, -2, 1, -2)
    Core.MiniInnerBorder.Parent = Core.MiniMainOutline
    Core.MiniBackground = Instance.new("Frame")
    Core.MiniBackground.Name = "Background"
    Core.MiniBackground.BackgroundColor3 = Core.MiniBackgroundColor
    Core.MiniBackground.BorderSizePixel = 0
    Core.MiniBackground.Position = UDim2.new(0, 1, 0, 1)
    Core.MiniBackground.Size = UDim2.new(1, -2, 1, -2)
    Core.MiniBackground.Parent = Core.MiniInnerBorder
    Core.MiniAccentLine = Instance.new("Frame")
    Core.MiniAccentLine.Name = "AccentLine"
    Core.MiniAccentLine.BackgroundColor3 = Library.AccentColor
    Core.MiniAccentLine.BorderSizePixel = 0
    Core.MiniAccentLine.Position = UDim2.new(0, 0, 0, 0)
    Core.MiniAccentLine.Size = UDim2.new(1, 0, 0, 1)
    Core.MiniAccentLine.Parent = Core.MiniBackground
    Core.AmmoLabel = Instance.new("TextLabel")
    Core.AmmoLabel.Name = "ValueLabel"
    Core.AmmoLabel.BackgroundTransparency = 1
    Core.AmmoLabel.Position = UDim2.new(0, 0, 0, 0)
    Core.AmmoLabel.Size = UDim2.new(1, 0, 1, 0)
    Core.AmmoLabel.Font = Enum.Font.BuilderSans
    Core.AmmoLabel.Text = "0/0"
    Core.AmmoLabel.LineHeight = 1.1
    Core.AmmoLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    Core.AmmoLabel.TextSize = 15
    Core.AmmoLabel.TextStrokeTransparency = 0
    Core.AmmoLabel.Parent = Core.MiniBackground
    Core.MiniUIPadding = Instance.new("UIPadding")
    Core.MiniUIPadding.Parent = Core.AmmoLabel
    Core.MiniUITextSizeConstraint = Instance.new("UITextSizeConstraint")
    Core.MiniUITextSizeConstraint.MaxTextSize = 17
    Core.MiniUITextSizeConstraint.MinTextSize = 14
    Core.MiniUITextSizeConstraint.Parent = Core.AmmoLabel
    Core.MiniDragButton.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            Core.MiniDragging = true
            Core.MiniDragStart = input.Position
            Core.MiniStartPos = Core.MiniOuterBorder.Position
        end
    end)
    Core.MiniDragButton.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            if Core.MiniDragging then
                local delta = input.Position - Core.MiniDragStart
                Core.MiniOuterBorder.Position = UDim2.new(Core.MiniStartPos.X.Scale, Core.MiniStartPos.X.Offset + delta.X, Core.MiniStartPos.Y.Scale, Core.MiniStartPos.Y.Offset + delta.Y)
            end
        end
    end)
    Core.MiniDragButton.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            Core.MiniDragging = false
        end
    end)
    Core.HealthDrawings = Core.HealthDrawings or {}
    Core.HealthOutlineDrawings = Core.HealthOutlineDrawings or {}
    Core.HealthTextDrawings = Core.HealthTextDrawings or {}
    local BAR_WIDTH = 2
    local OUTLINE_WIDTH = 4
    local function createHealth(model)
        if Core.HealthDrawings[model] then
            return
        end
        local outline = Drawing.new("Square")
        outline.Color = Color3.new(0, 0, 0)
        outline.Thickness = 1
        outline.Filled = true
        outline.ZIndex = 10
        outline.Visible = false
        local segments = {}
        for i = 1, 80 do
            local bar = Drawing.new("Square")
            bar.Thickness = 0
            bar.Filled = true
            bar.ZIndex = 11
            bar.Visible = false
            segments[i] = bar
        end
        local hText = Drawing.new("Text")
        hText.Size = 13
        hText.Outline = true
        hText.Center = true
        hText.ZIndex = 12
        if table.find(SafeFonts, Core.CurrentFont) then
            hText.Font = Core.CurrentFont
        end
        hText.Visible = false
        Core.HealthOutlineDrawings[model] = outline
        Core.HealthDrawings[model] = segments
        Core.HealthTextDrawings[model] = hText
    end
    local function removeHealth(model)
        if Core.HealthDrawings[model] then
            for _, bar in ipairs(Core.HealthDrawings[model]) do
                bar:Remove()
            end
            Core.HealthDrawings[model] = nil
        end
        if Core.HealthOutlineDrawings[model] then
            Core.HealthOutlineDrawings[model]:Remove()
            Core.HealthOutlineDrawings[model] = nil
        end
        if Core.HealthTextDrawings[model] then
            Core.HealthTextDrawings[model]:Remove()
            Core.HealthTextDrawings[model] = nil
        end
    end
    Core.HealthCache = Core.HealthCache or {}
    local function getEntryByModel(model)
        local cached = Core.EntryCache[model]
        if cached ~= nil then
            return cached
        end
        if not Core.SilentRE then
            return nil
        end
        local foundEntry = nil
        local name = model.Name
        local player = game:GetService("Players"):FindFirstChild(name)
        if player then
            foundEntry = Core.SilentRE.getEntry(player)
        end
        if not foundEntry then
            local foundName = getPlayerName(model)
            if foundName then
                local foundPlayer = game:GetService("Players"):FindFirstChild(foundName)
                if foundPlayer then
                    foundEntry = Core.SilentRE.getEntry(foundPlayer)
                end
            end
        end
        if not foundEntry then
            Core.SilentRE.operateOnAllEntries(function(plr, entry)
                if foundEntry then
                    return
                end
                local tp = entry.getThirdPersonObject and entry:getThirdPersonObject()
                if tp and tp.getCharacterModel and tp:getCharacterModel() == model then
                    foundEntry = entry
                end
            end)
        end
        if Core.SilentRE then
            local res = foundEntry or false
            Core.EntryCache[model] = res
        end
        return foundEntry
    end
    local function getHealthScale(model)
        local entry = getEntryByModel(model)
        if entry and entry.getHealth then
            local h = entry:getHealth()
            if type(h) == "number" then
                return math.clamp(h / 100, 0, 1)
            end
        end
        local ch = Core.HealthCache[model]
        if ch == false then
            return 1
        end
        if ch and ch:IsDescendantOf(model) then
            local scale = ch.Size.X.Scale
            if scale ~= scale then
                return 1
            end
            return math.clamp(scale, 0, 1)
        end
        for _, d in ipairs(model:GetDescendants()) do
            if d:IsA("Frame") and d.Name == "Percent" then
                local health = d:FindFirstAncestor("Health")
                if health then
                    local tag = health:FindFirstAncestor("PlayerTag")
                    if tag and tag:FindFirstAncestor("NameTagGui") then
                        Core.HealthCache[model] = d
                        local scale = d.Size.X.Scale
                        if scale ~= scale then
                            return 1
                        end
                        return math.clamp(scale, 0, 1)
                    end
                end
            end
        end
        Core.HealthCache[model] = false
        return 1
    end
    local function hookHealthModel(model)
        if not model:IsA("Model") then
            return
        end
        createHealth(model)
        for _, c in ipairs(model:GetChildren()) do
            if c:IsA("Model") then
                createHealth(c)
            end
        end
    end
    for _, folder in ipairs(PlayersFolder:GetChildren()) do
        if folder:IsA("Folder") then
            for _, model in ipairs(folder:GetChildren()) do
                hookHealthModel(model)
            end
            folder.ChildAdded:Connect(hookHealthModel)
            folder.ChildRemoved:Connect(removeHealth)
        end
    end
    PlayersFolder.ChildAdded:Connect(function(folder)
        if folder:IsA("Folder") then
            folder.ChildAdded:Connect(hookHealthModel)
            folder.ChildRemoved:Connect(removeHealth)
        end
    end)
    local lastESPUpdate = 0
    RunService.RenderStepped:Connect(function(dt)
        for m, d in pairs(Core.DistanceDrawings) do
            if not m.Parent then
                d:Remove()
                Core.DistanceDrawings[m] = nil
                if Core.WeaponDrawings[m] then
                    Core.WeaponDrawings[m]:Remove()
                    Core.WeaponDrawings[m] = nil
                end
            end
        end
        for m, d in pairs(Core.NameDrawings) do
            if not m.Parent then
                d:Remove()
                Core.NameDrawings[m] = nil
            end
        end
        for m, box in pairs(Core.BoxDrawings) do
            if not m.Parent then
                box:Remove()
                Core.BoxDrawings[m] = nil
                if Core.BoxOutlineDrawings[m] then
                    Core.BoxOutlineDrawings[m]:Remove()
                    Core.BoxOutlineDrawings[m] = nil
                end
                if Core.BoxFillDrawings and Core.BoxFillDrawings[m] then
                    Core.BoxFillDrawings[m]:Remove()
                    Core.BoxFillDrawings[m] = nil
                end
            end
        end
        for m, arr in pairs(Core.HealthDrawings) do
            if not m.Parent then
                for _, l in ipairs(arr) do
                    l:Remove()
                end
                Core.HealthDrawings[m] = nil
                if Core.HealthOutlineDrawings[m] then
                    Core.HealthOutlineDrawings[m]:Remove()
                    Core.HealthOutlineDrawings[m] = nil
                end
                if Core.HealthTextDrawings[m] then
                    Core.HealthTextDrawings[m]:Remove()
                    Core.HealthTextDrawings[m] = nil
                end
            end
        end
        local now = os.clock()
        local distEnabled = Core.DistanceESPEnabled
        local weaponEnabled = Core.WeaponESPEnabled
        local nameEnabled = Core.NameESPEnabled
        local boxEnabled = Core.BoxESPEnabled
        local healthEnabled = Core.HealthESPEnabled
        local chamsEnabled = Core.ChamsEnabled
        if now - lastESPUpdate < 0.008333333333333333 then
            return
        end
        lastESPUpdate = now
        for _, t in pairs(Core.DistanceDrawings) do
            if not distEnabled then
                t.Visible = false
            end
        end
        for _, t in pairs(Core.WeaponDrawings) do
            if not weaponEnabled then
                t.Visible = false
            end
        end
        for _, t in pairs(Core.NameDrawings) do
            if not nameEnabled then
                t.Visible = false
            end
        end
        for _, b in pairs(Core.BoxDrawings) do
            if not boxEnabled then
                b.Visible = false
            end
        end
        for _, o in pairs(Core.BoxOutlineDrawings) do
            if not boxEnabled then
                o.Visible = false
            end
        end
        if Core.BoxFillDrawings then
            for _, f in pairs(Core.BoxFillDrawings) do
                if not (Core.BoxFillEnabled and boxEnabled) then
                    f.Visible = false
                end
            end
        end
        for _, hTable in pairs(Core.HealthDrawings) do
            if not healthEnabled then
                for i = 1, 80 do
                    hTable[i].Visible = false
                end
            end
        end
        for _, o in pairs(Core.HealthOutlineDrawings) do
            if not healthEnabled then
                o.Visible = false
            end
        end
        if not (distEnabled or weaponEnabled or nameEnabled or boxEnabled or healthEnabled or chamsEnabled) then
            return
        end
        local camPos = Camera.CFrame.Position
        local maxDist = Core.DistanceMax or 750
        for model, _ in pairs(Core.DistanceDrawings) do
            local textName = Core.NameDrawings[model]
            local textWeapon = Core.WeaponDrawings[model]
            local textDist = Core.DistanceDrawings[model]
            local boxes = Core.BoxDrawings[model]
            local outlines = Core.BoxOutlineDrawings[model]
            local healthBar = Core.HealthDrawings[model]
            local healthOutline = Core.HealthOutlineDrawings[model]
            local healthText = Core.HealthTextDrawings[model]
            local shouldShow = true
            local torso, dist, topPos, bottomPos, topVis, bottomVis, topWorld, bottomWorld, nameWorld
            if not model:IsDescendantOf(PlayersFolder) then
                shouldShow = false
            end
            if shouldShow then
                torso = getTorso(model)
                if not torso or not checkEnemyByModel(model) then
                    shouldShow = false
                end
            end
            if shouldShow then
                dist = (camPos - torso.Position).Magnitude
                if dist > maxDist or not isOnScreen(torso) then
                    shouldShow = false
                end
            end
            if shouldShow then
                topWorld = torso.Position + Vector3.new(0, 3, 0)
                bottomWorld = torso.Position - Vector3.new(0, 3.5, 0)
                nameWorld = torso.Position + Vector3.new(0, 3.5, 0)
                topPos, topVis = Camera:WorldToViewportPoint(topWorld)
                bottomPos, bottomVis = Camera:WorldToViewportPoint(bottomWorld)
                if not topVis or not bottomVis then
                    shouldShow = false
                end
            end
            if not shouldShow then
                Core.FadeCache[model] = nil
                if textName then
                    textName.Visible = false
                end
                if textWeapon then
                    textWeapon.Visible = false
                end
                if textDist then
                    textDist.Visible = false
                end
                if boxes then
                    boxes.Visible = false
                end
                if outlines then
                    outlines.Visible = false
                end
                if Core.BoxFillDrawings and Core.BoxFillDrawings[model] then
                    Core.BoxFillDrawings[model].Visible = false
                end
                if healthBar then
                    for i = 1, 80 do
                        healthBar[i].Visible = false
                    end
                end
                if healthOutline then
                    healthOutline.Visible = false
                end
                if healthText then
                    healthText.Visible = false
                    Core.HealthTextFadeCache[model] = nil
                end
                local activeChams = Core.ActiveChams[model]
                if activeChams then
                    for i = 1, #activeChams do
                        local b = activeChams[i]
                        if b:IsA("Highlight") then
                            b.Enabled = false
                            b.FillTransparency = 1
                            b.OutlineTransparency = 1
                        else
                            b.Visible = false
                            b.Transparency = 1
                        end
                    end
                end
                continue
            end
            local startTime = Core.FadeCache[model]
            if not startTime then
                startTime = now
                Core.FadeCache[model] = startTime
            end
            local fadeAlpha = math.clamp((now - startTime) / Core.FadeTime, 0, 1)
            local height = math.floor(math.abs(topPos.Y - bottomPos.Y))
            local width = math.floor(height * 0.55)
            local x = math.floor(topPos.X - width / 2)
            local y = math.floor(topPos.Y)
            local function applyFontCase(txt)
                if not txt then
                    return txt
                end
                local case = Core.FontCase or Options.FontCaseDropdown and Options.FontCaseDropdown.Value or "Normal"
                if case == "Lowercase" then
                    return string.lower(txt)
                elseif case == "Uppercase" then
                    return string.upper(txt)
                elseif case == "Normal" then
                    return (string.lower(txt):gsub("^%l", string.upper):gsub("[%s%p]%l", string.upper))
                end
                return txt
            end
            if textName and nameEnabled then
                local name = getPlayerName(model)
                if name then
                    textName.Position = Vector2.new(x + width / 2, y - 15)
                    textName.Text = applyFontCase(name)
                    textName.Transparency = fadeAlpha
                    textName.Visible = true
                else
                    textName.Visible = false
                end
            elseif textName then
                textName.Visible = false
            end
            if textWeapon and weaponEnabled then
                local weaponName = "Unknown"
                if Core.SilentRE then
                    local targetName = getPlayerName(model)
                    for _, player in pairs(Players:GetPlayers()) do
                        if targetName and (player.Name == targetName or player.DisplayName == targetName) then
                            local entry = Core.SilentRE.getEntry(player)
                            if entry then
                                local pWeaponObj = entry:getWeaponObject()
                                if pWeaponObj and pWeaponObj.weaponName then
                                    weaponName = pWeaponObj.weaponName
                                end
                            end
                            break
                        end
                    end
                end
                textWeapon.Position = Vector2.new(x + width / 2, y + height)
                textWeapon.Text = applyFontCase(weaponName)
                textWeapon.Color = Core.WeaponTextColor
                textWeapon.Transparency = fadeAlpha
                textWeapon.Visible = true
            elseif textWeapon then
                textWeapon.Visible = false
            end
            if textDist and distEnabled then
                textDist.Position = Vector2.new(x + width / 2, y + height + (weaponEnabled and 13 or 0))
                textDist.Text = math.floor(dist) .. "s"
                textDist.Color = Core.DistanceTextColor
                textDist.Transparency = fadeAlpha
                textDist.Visible = true
            elseif textDist then
                textDist.Visible = false
            end
            if boxes and outlines and boxEnabled then
                boxes.Visible = true
                outlines.Visible = true
                boxes.Color = Core.BoxColor
                outlines.Color = Color3.new(0, 0, 0)
                boxes.Transparency = fadeAlpha
                outlines.Transparency = fadeAlpha
                local tl = Vector2.new(x, y)
                local sz = Vector2.new(width, height)
                boxes.Size = sz
                boxes.Position = tl
                outlines.Size = sz
                outlines.Position = tl
                if Core.BoxFillDrawings and Core.BoxFillDrawings[model] and Core.BoxFillEnabled then
                    Core.BoxFillDrawings[model].Visible = true
                    Core.BoxFillDrawings[model].Color = Core.BoxFillColor or Color3.fromRGB(84, 132, 171)
                    Core.fillTrans = 0.5
                    if Options and Options["BoxFillColorPicker"] then
                        Core.fillTrans = Options["BoxFillColorPicker"].Transparency
                    end
                    Core.BoxFillDrawings[model].Transparency = (1 - Core.fillTrans) * fadeAlpha
                    Core.BoxFillDrawings[model].Size = sz
                    Core.BoxFillDrawings[model].Position = tl
                elseif Core.BoxFillDrawings and Core.BoxFillDrawings[model] then
                    Core.BoxFillDrawings[model].Visible = false
                end
            elseif boxes then
                boxes.Visible = false
                outlines.Visible = false
                if Core.BoxFillDrawings and Core.BoxFillDrawings[model] then
                    Core.BoxFillDrawings[model].Visible = false
                end
            end
            if healthBar and healthOutline and healthEnabled then
                local healthScale = getHealthScale(model)
                local visualScale = Core.VisualHealth[model]
                if not visualScale then
                    visualScale = healthScale
                    Core.VisualHealth[model] = visualScale
                end
                visualScale = visualScale + (healthScale - visualScale) * math.clamp(dt * 10, 0, 1)
                Core.VisualHealth[model] = visualScale
                local barX = math.floor(x - 5)
                local barY = math.floor(y)
                healthOutline.Size = Vector2.new(OUTLINE_WIDTH, math.floor(height) + 2)
                healthOutline.Position = Vector2.new(barX - 1, barY - 1)
                healthOutline.Transparency = fadeAlpha
                healthOutline.Visible = true
                if Core.HealthGradientEnabled then
                    local segmentCount = 80
                    local segmentHeight = height / segmentCount
                    local totalFillHeight = height * visualScale
                    for i = 1, segmentCount do
                        local segment = healthBar[i]
                        if segment then
                            local sP = (i - 1) / (segmentCount - 1)
                            if Core.HealthGradientRotationEnabled then
                                sP = (math.sin(i / 15 + tick() * (Core.HealthGradientRotationSpeed or 4)) + 1) / 2
                            end
                            local sBottomOffset = (i - 1) * segmentHeight
                            if sBottomOffset < totalFillHeight then
                                local sFillHeight = math.min(segmentHeight, totalFillHeight - sBottomOffset)
                                local sTopPos = math.floor(barY + height - sBottomOffset - sFillHeight)
                                local sBottomPos = math.floor(barY + height - sBottomOffset)
                                segment.Size = Vector2.new(BAR_WIDTH, sBottomPos - sTopPos)
                                segment.Position = Vector2.new(barX, sTopPos)
                                segment.Color = Core.HealthLowColor:Lerp(Core.HealthHighColor, sP)
                                segment.Transparency = fadeAlpha
                                segment.Visible = true
                            else
                                segment.Visible = false
                            end
                        end
                    end
                else
                    local barHeight = math.ceil(height * visualScale)
                    local barYPos = math.floor(barY + (height - barHeight))
                    if healthBar[1] then
                        healthBar[1].Size = Vector2.new(BAR_WIDTH, barHeight)
                        healthBar[1].Position = Vector2.new(barX, barYPos)
                        healthBar[1].Color = Core.HealthLowColor:Lerp(Core.HealthHighColor, visualScale)
                        healthBar[1].Transparency = fadeAlpha
                        healthBar[1].Visible = true
                    end
                    for i = 2, 80 do
                        if healthBar[i] then
                            healthBar[i].Visible = false
                        end
                    end
                end
                local hText = Core.HealthTextDrawings[model]
                if hText then
                    local fadeProgress = Core.HealthTextFadeCache[model] or 0
                    if Core.HealthTextEnabled and healthScale < 1 then
                        fadeProgress = math.min(fadeProgress + (dt / 0.15), 1)
                    else
                        fadeProgress = math.max(fadeProgress - (dt / 0.15), 0)
                    end
                    Core.HealthTextFadeCache[model] = fadeProgress
                    if fadeProgress > 0 then
                        local textY = barY + height - (height * visualScale)
                        hText.Text = tostring(math.floor(healthScale * 100))
                        hText.Position = Vector2.new(barX - 10, textY - 8)
                        hText.Size = 13
                        hText.Color = Core.HealthTextColor
                        hText.Transparency = fadeProgress * fadeAlpha
                        hText.Visible = true
                    else
                        hText.Visible = false
                    end
                end
            elseif healthBar then
                for i = 1, 80 do
                    healthBar[i].Visible = false
                end
                healthOutline.Visible = false
                local hText = Core.HealthTextDrawings[model]
                if hText then
                    hText.Visible = false
                end
            end
            if chamsEnabled then
                local activeChams = Core.ActiveChams[model]
                if activeChams then
                    local chamsBaseTrans = Core.ChamsTransparency or 0.5
                    local chamsFadeAlpha = 1 - (fadeAlpha * (1 - chamsBaseTrans))
                    for i = 1, #activeChams do
                        local b = activeChams[i]
                        if b:IsA("Highlight") then
                            b.FillTransparency = chamsFadeAlpha
                            b.OutlineTransparency = chamsFadeAlpha
                            b.Enabled = true
                        else
                            b.Transparency = chamsFadeAlpha
                            b.Visible = true
                        end
                    end
                end
            else
                local activeChams = Core.ActiveChams[model]
                if activeChams then
                    for i = 1, #activeChams do
                        local b = activeChams[i]
                        if b:IsA("Highlight") then
                            b.Enabled = false
                        else
                            b.Visible = false
                        end
                    end
                end
            end
        end
    end)
    local function applyFontSafe(drawing, font)
        if table.find(SafeFonts, font) then
            drawing.Font = font
        end
    end
    local function updateAllFonts(fontId)
        Core.CurrentFont = fontId
        for _, d in pairs(Core.DistanceDrawings) do
            applyFontSafe(d, fontId)
        end
        for _, d in pairs(Core.NameDrawings) do
            applyFontSafe(d, fontId)
        end
        for _, d in pairs(Core.WeaponDrawings) do
            applyFontSafe(d, fontId)
        end
        for _, d in pairs(Core.HealthTextDrawings) do
            applyFontSafe(d, fontId)
        end
    end
    local BARREL_MESH_ID = "12272787618"
    local nextGunCheck = 0
    RunService.Heartbeat:Connect(function()
        local now = os.clock()
        if now >= nextGunCheck then
            local knifeFound = false
            for _, m in ipairs(Camera:GetChildren()) do
                if m:IsA("Model") and m:FindFirstChild("Trigger", true) then
                    knifeFound = true
                    break
                end
            end
            Core.HasKnife = knifeFound
        end
        if Core.SnapLineMethod ~= "Gun Barrel" and Core.FovPositionMethod ~= "Gun Barrel" and Core.SilentSnapOriginMethod ~= "Gun Barrel" and Core.SilentFOVOriginMethod ~= "Gun Barrel" and Core.CrosshairPositionMode ~= "Gun Barrel" then
            Core.GunBarrel = nil
            return
        end
        if Core.GunBarrel and Core.GunBarrel:IsDescendantOf(Camera) then
            Core.LastGunBarrelTime = now
            return
        end
        if now >= nextGunCheck then
            nextGunCheck = now + 0.25
            local found = nil
            for _, obj in ipairs(Camera:GetDescendants()) do
                if obj:IsA("SpecialMesh") and obj.MeshId:find(BARREL_MESH_ID) then
                    local p = obj.Parent
                    if p and p:IsA("BasePart") then
                        found = p
                        Core.LastGunBarrelTime = now
                        break
                    end
                end
            end
            Core.GunBarrel = found
        end
    end)
    local lines = {}
    for i = 1, 4 do
        lines[i] = Drawing.new("Line")
        lines[i].Thickness = 2
        lines[i].Color = Core.CrosshairColor
        lines[i].ZIndex = 2
        lines[i].Visible = false
    end
    local outlines = {}
    for i = 1, 4 do
        outlines[i] = Drawing.new("Line")
        outlines[i].Thickness = 4
        outlines[i].Color = Color3.new(0, 0, 0)
        outlines[i].ZIndex = 1
        outlines[i].Visible = false
    end
    local flapLines = {}
    for i = 1, 4 do
        flapLines[i] = Drawing.new("Line")
        flapLines[i].Thickness = 2
        flapLines[i].Color = Core.CrosshairColor
        flapLines[i].ZIndex = 2
        flapLines[i].Visible = false
    end
    local flapOutlines = {}
    for i = 1, 4 do
        flapOutlines[i] = Drawing.new("Line")
        flapOutlines[i].Thickness = 4
        flapOutlines[i].Color = Color3.new(0, 0, 0)
        flapOutlines[i].ZIndex = 1
        flapOutlines[i].Visible = false
    end
    local starLines = {}
    local starOutlines = {}
    for i = 1, 6 do
        starLines[i] = Drawing.new("Line")
        starLines[i].Thickness = 2
        starLines[i].Color = Color3.fromRGB(255, 255, 255)
        starLines[i].ZIndex = 2
        starLines[i].Visible = false
        starOutlines[i] = Drawing.new("Line")
        starOutlines[i].Thickness = 4
        starOutlines[i].Color = Color3.new(0, 0, 0)
        starOutlines[i].ZIndex = 1
        starOutlines[i].Visible = false
    end
    local dot = Drawing.new("Circle")
    dot.Filled = true
    dot.Thickness = 1
    dot.Color = Core.CrosshairColor
    dot.ZIndex = 2
    dot.Visible = false
    local dotOutline = Drawing.new("Circle")
    dotOutline.Filled = true
    dotOutline.Thickness = 1
    dotOutline.Color = Color3.new(0, 0, 0)
    dotOutline.ZIndex = 1
    dotOutline.Visible = false
    local angle = 0
    local SIDE_ORDER = {
        "Top",
        "Right",
        "Bottom",
        "Left"
    }
    local ANGLES = {
        0,
        90,
        180,
        270
    }
    local cachedTarget = nil
    local nextTargetUpdate = 0
    local function getDefaultCrosshairCenter(camera)
        if Core.CrosshairPositionMode == "Center Of Screen" then
            local size = camera.ViewportSize
            return Vector2.new(size.X / 2, size.Y / 2)
        elseif Core.CrosshairPositionMode == "Gun Barrel" then
            if Core.HasKnife or not Core.GunBarrel or not Core.GunBarrel:IsDescendantOf(Camera) then
                return nil
            end
            local forwardOffset = 7.5
            local worldPos = Core.GunBarrel.Position + (Core.GunBarrel.CFrame.LookVector * forwardOffset)
            local v, onScreen = camera:WorldToViewportPoint(worldPos)
            if not onScreen then
                return nil
            end
            return Vector2.new(v.X, v.Y)
        else
            local mousePos = UserInputService:GetMouseLocation()
            return Vector2.new(mousePos.X, mousePos.Y)
        end
    end
    local function getCrosshairCenter(dt)
        local camera = Workspace.CurrentCamera
        if not camera then
            return Vector2.new(0, 0)
        end
        if Core.CrosshairLockOnTarget then
            local now = os.clock()
            local activeTarget = nil
            if Core.SilentEnabled then
                if now >= (Core.CrosshairSilentNextUpdate or 0) then
                    local _, _, tPart = Core:GetSilentClosestTarget()
                    Core.CrosshairSilentCachedTarget = tPart
                    Core.CrosshairSilentNextUpdate = now + Core.TARGET_UPDATE_RATE
                end
                activeTarget = Core.CrosshairSilentCachedTarget
            elseif Core.AimbotEnabled then
                if Core.LockedTarget and Core.LockedTarget:IsDescendantOf(workspace) then
                    cachedTarget = Core.LockedTarget
                    nextTargetUpdate = now + Core.TARGET_UPDATE_RATE
                    activeTarget = cachedTarget
                elseif now >= nextTargetUpdate then
                    cachedTarget = getClosestTarget()
                    nextTargetUpdate = now + Core.TARGET_UPDATE_RATE
                    activeTarget = cachedTarget
                else
                    activeTarget = cachedTarget
                end
            end
            if activeTarget and activeTarget:IsDescendantOf(workspace) then
                local pos, onScreen = camera:WorldToViewportPoint(activeTarget.Position)
                if onScreen then
                    local targetPos = Vector2.new(pos.X, pos.Y)
                    if not Core.CrosshairCurrentOrigin then
                        Core.CrosshairCurrentOrigin = targetPos
                    else
                        Core.CrosshairCurrentOrigin = Core.CrosshairCurrentOrigin:Lerp(targetPos, math.clamp(dt * 35, 0, 1))
                    end
                    return Core.CrosshairCurrentOrigin
                end
            end
        end
        local fallback = getDefaultCrosshairCenter(camera)
        local origin = fallback or Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
        if Core.CrosshairCurrentOrigin and (Core.CrosshairCurrentOrigin - origin).Magnitude > 1 then
            Core.CrosshairCurrentOrigin = Core.CrosshairCurrentOrigin:Lerp(origin, math.clamp(dt * 35, 0, 1))
        else
            Core.CrosshairCurrentOrigin = nil
        end
        return Core.CrosshairCurrentOrigin or origin
    end
    RunService.RenderStepped:Connect(function(dt)
        if not Core.CrosshairEnabled then
            for i = 1, 4 do
                lines[i].Visible = false
                outlines[i].Visible = false
                flapLines[i].Visible = false
                flapOutlines[i].Visible = false
            end
            for i = 1, 6 do
                starLines[i].Visible = false
                starOutlines[i].Visible = false
            end
            if dot then
                dot.Visible = false
            end
            if dotOutline then
                dotOutline.Visible = false
            end
            return
        end
        local center = getCrosshairCenter(dt)
        if Core.CrosshairSpin then
            angle = (angle + dt * Core.CrosshairSpinSpeed) % 360
        else
            angle = 0
        end
        local size = Core.CrosshairSize
        local gap = Core.CrosshairGap
        local thickness = Core.CrosshairThickness
        local sides = STYLE_SIDES[Core.CrosshairStyle] or STYLE_SIDES["1"]
        if Core.CrosshairStyle == "4" then
            for i = 1, 4 do
                lines[i].Visible = false
                outlines[i].Visible = false
                flapLines[i].Visible = false
                flapOutlines[i].Visible = false
            end
            for i = 1, 6 do
                starLines[i].Visible = false
                starOutlines[i].Visible = false
            end
            local dotRadius = math.max(1, math.floor(thickness * 1.5))
            dot.Radius = dotRadius
            dot.Position = center
            dot.Color = Core.CrosshairColor
            dot.Visible = true
            dotOutline.Radius = dotRadius + 1
            dotOutline.Position = center
            dotOutline.Visible = true
            return
        elseif Core.CrosshairStyle == "6" then
            dot.Visible = false
            dotOutline.Visible = false
            for i = 1, 4 do
                lines[i].Visible = false
                outlines[i].Visible = false
                flapLines[i].Visible = false
                flapOutlines[i].Visible = false
            end
            local R = size
            local triAngles = {
                {
                    90,
                    210,
                    330
                },
                {
                    270,
                    30,
                    150
                },
            }
            local lineIdx = 1
            for _, tri in ipairs(triAngles) do
                local verts = {}
                for j = 1, 3 do
                    local rad = math.rad(angle + tri[j])
                    verts[j] = center + Vector2.new(math.cos(rad), -math.sin(rad)) * R
                end
                for j = 1, 3 do
                    local a = verts[j]
                    local b = verts[(j % 3) + 1]
                    starLines[lineIdx].From = a
                    starLines[lineIdx].To = b
                    starLines[lineIdx].Thickness = thickness
                    starLines[lineIdx].Color = Core.CrosshairColor
                    starLines[lineIdx].Visible = true
                    starOutlines[lineIdx].From = a
                    starOutlines[lineIdx].To = b
                    starOutlines[lineIdx].Thickness = thickness + 2
                    starOutlines[lineIdx].Visible = true
                    lineIdx = lineIdx + 1
                end
            end
            return
        else
            dot.Visible = false
            dotOutline.Visible = false
            for i = 1, 6 do
                starLines[i].Visible = false
                starOutlines[i].Visible = false
            end
        end
        for i = 1, 4 do
            lines[i].Thickness = thickness
            outlines[i].Thickness = thickness + 2
            flapLines[i].Thickness = thickness
            flapOutlines[i].Thickness = thickness + 2
            local sideName = SIDE_ORDER[i]
            if sides[sideName] then
                local rad = math.rad(angle + ANGLES[i])
                local dir = Vector2.new(math.cos(rad), math.sin(rad))
                local from = center + dir * gap
                local to = center + dir * (gap + size)
                if Core.CrosshairStyle == "5" then
                    local perp = Vector2.new(-dir.Y, dir.X)
                    local offset = math.max(2, size)
                    from = center
                    to = center + dir * (gap + size)
                    flapLines[i].From = to
                    flapLines[i].To = to + perp * offset
                    flapLines[i].Color = Core.CrosshairColor
                    flapLines[i].Visible = true
                    flapOutlines[i].From = to
                    flapOutlines[i].To = to + perp * offset
                    flapOutlines[i].Visible = true
                else
                    flapLines[i].Visible = false
                    flapOutlines[i].Visible = false
                end
                lines[i].From = from
                lines[i].To = to
                lines[i].Color = Core.CrosshairColor
                lines[i].Visible = true
                outlines[i].From = from
                outlines[i].To = to
                outlines[i].Visible = true
            else
                lines[i].Visible = false
                outlines[i].Visible = false
                flapLines[i].Visible = false
                flapOutlines[i].Visible = false
            end
        end
    end)
    local SilentSnapOutline = Drawing.new("Line")
    SilentSnapOutline.Thickness = 3
    SilentSnapOutline.Color = Color3.new(0, 0, 0)
    SilentSnapOutline.Transparency = 1
    SilentSnapOutline.Visible = false
    local SilentSnapLine = Drawing.new("Line")
    SilentSnapLine.Thickness = 1
    SilentSnapLine.Color = Color3.fromRGB(255, 255, 255)
    SilentSnapLine.Transparency = 1
    SilentSnapLine.Visible = false
    local SilentFOVOutline = Drawing.new("Circle")
    SilentFOVOutline.Filled = false
    SilentFOVOutline.Thickness = 3
    SilentFOVOutline.Color = Color3.new(0, 0, 0)
    SilentFOVOutline.Transparency = 1
    SilentFOVOutline.Visible = false
    local SilentFOVCircle = Drawing.new("Circle")
    SilentFOVCircle.Filled = false
    SilentFOVCircle.Thickness = 1
    SilentFOVCircle.Color = Core.SilentFOVColor
    SilentFOVCircle.Transparency = 1
    SilentFOVCircle.Visible = false
    Core.SilentFOVFill = Drawing.new("Circle")
    Core.SilentFOVFill.Filled = true
    Core.SilentFOVFill.Thickness = 0
    Core.SilentFOVFill.Color = Color3.fromRGB(83, 132, 171)
    Core.SilentFOVFill.Transparency = 0.5
    Core.SilentFOVFill.Visible = false
    local SilentLocalTeam = nil
    function Core:ResolveBarrelMotor()
        if self.GunBarrelMotor or not self.GunBarrel then
            return
        end
        for _, d in ipairs(self.GunBarrel:GetDescendants()) do
            if d:IsA("Motor6D") then
                self.GunBarrelMotor = d
                self.GunBarrelMotorOriginal = d.Transform
                return
            end
        end
        for _, d in ipairs(self.GunBarrel:GetDescendants()) do
            if d:IsA("Weld") then
                self.GunBarrelMotor = d
                self.GunBarrelMotorOriginal = d.C0
                return
            end
        end
    end
    local function GetSilentScreenOrigin()
        if Core.SilentFOVOriginMethod == "Gun Barrel" then
            if Core.HasKnife then
                return nil, false, nil
            end
            if Core.GunBarrel and Core.GunBarrel:IsDescendantOf(Camera) then
                local p = Core.GunBarrel.Position + (Core.GunBarrel.CFrame.LookVector * 7.5)
                local v, onScreen = Camera:WorldToViewportPoint(p)
                if onScreen then
                    return Vector2.new(v.X, v.Y), true, p
                end
            end
            if Core.LastGunBarrelTime and (os.clock() - Core.LastGunBarrelTime) < 1 then
                return nil, false, nil
            end
            local m = UserInputService:GetMouseLocation()
            return m, true, nil
        end
        local m = UserInputService:GetMouseLocation()
        return m, true, Core.GunBarrel and Core.GunBarrel.Position or nil
    end
    local function SilentGetLocalTeam()
        return LocalTeam or getLocalTeam()
    end
    local function SilentIsEnemy(part)
        return isEnemy(part)
    end
    local function SilentIsVisible(part)
        if not Core.SilentWallCheck then
            return true
        end
        local origin = Camera.CFrame.Position
        local dir = part.Position - origin
        local params = RaycastParams.new()
        params.FilterType = Enum.RaycastFilterType.Exclude
        local filter = {
            LocalPlayer.Character,
            Camera
        }
        local weapon = workspace.CurrentCamera:FindFirstChildWhichIsA("Model")
        if weapon then
            table.insert(filter, weapon)
        end
        params.FilterDescendantsInstances = filter
        params.IgnoreWater = true
        local result = workspace:Raycast(origin, dir, params)
        return not result or result.Instance:IsDescendantOf(part.Parent)
    end
    Core.SilentAimPartCache = Core.SilentAimPartCache or setmetatable({}, {
        __mode = "k"
    })
    local function getCachedSilentTargetPart(model)
        local targetMesh = Core.SILENT_TARGET_MESH or Core.MESH_IDS["Head"]
        local c = Core.SilentAimPartCache[model]
        if c == false then
            return nil
        end
        if c and c:IsDescendantOf(model) and c.MeshId:find(targetMesh) then
            return c
        end
        for _, v in ipairs(model:GetDescendants()) do
            if v:IsA("MeshPart") and v.MeshId and v.MeshId:find(targetMesh) then
                Core.SilentAimPartCache[model] = v
                return v
            end
        end
        Core.SilentAimPartCache[model] = false
        return nil
    end
    local function SilentGetTargetParts()
        local t = {}
        for model, _ in pairs(Core.NameDrawings or {}) do
            if checkEnemyByModel(model) then
                local p = getCachedSilentTargetPart(model)
                if p then
                    t[#t + 1] = p
                end
            end
        end
        return t
    end
    function Core:GetSilentClosestTarget(overridePart)
        local camPos = Camera.CFrame.Position
        local origin
        if Core.SilentFOVOriginMethod == "Gun Barrel" then
            if Core.HasKnife or not Core.GunBarrel or not Core.GunBarrel:IsDescendantOf(Camera) then
                return nil
            end
            local forwardOffset = 7.5
            local worldPos = Core.GunBarrel.Position + (Core.GunBarrel.CFrame.LookVector * forwardOffset)
            local v, onScreen = Camera:WorldToViewportPoint(worldPos)
            if not onScreen then
                return nil
            end
            origin = Vector2.new(v.X, v.Y)
        else
            origin = UserInputService:GetMouseLocation()
        end
        local distance = math.huge
        if Core.SilentPriority == "Closest To Mouse" then
            distance = Core.SilentCurrentFOV or math.huge
        end
        local position, closestEntry, closestPart
        local partName = overridePart or Core.SilentAimPart or "Head"
        if not Core.SilentRE then
            return nil
        end
        local physicsignore = {
            workspace.Terrain,
            Camera,
            workspace:FindFirstChild("Ignore"),
            workspace:FindFirstChild("Players")
        }
        local raycastparameters = RaycastParams.new()
        raycastparameters.IgnoreWater = true
        raycastparameters.FilterDescendantsInstances = physicsignore
        raycastparameters.FilterType = Enum.RaycastFilterType.Exclude
        Core.SilentRE.operateOnAllEntries(function(player, entry)
            local character = entry._thirdPersonObject and entry._thirdPersonObject._characterModelHash
            if character and entry._isEnemy then
                local targetPart = character[partName]
                if targetPart then
                    local target = targetPart.Position
                    local isVisible = true
                    if Core.SilentWallCheck then
                        local result = workspace:Raycast(camPos, target - camPos, raycastparameters)
                        if result then
                            isVisible = false
                        end
                    end
                    if isVisible then
                        local screenPosition, onscreen = Camera:WorldToViewportPoint(target)
                        local currentDist = math.huge
                        if Core.SilentPriority == "Closest To You" then
                            currentDist = (camPos - target).Magnitude
                        else
                            currentDist = (Vector2.new(screenPosition.X, screenPosition.Y) - origin).Magnitude
                        end
                        if screenPosition.Z > 0 and currentDist < distance then
                            closestPart = targetPart
                            position = target
                            distance = currentDist
                            closestEntry = entry
                        end
                    end
                end
            end
        end)
        return position, closestEntry, closestPart
    end
    Core.solve = function(v44, v45, v46, v47, v48)
        if not v44 then
            return
        elseif v44 > -1.0E-10 and v44 < 1.0E-10 then
            return Core.solve(v45, v46, v47, v48)
        else
            if v48 then
                local v49 = -v45 / (4 * v44)
                local v50 = (v46 + v49 * (3 * v45 + 6 * v44 * v49)) / v44
                local v51 = (v47 + v49 * (2 * v46 + v49 * (3 * v45 + 4 * v44 * v49))) / v44
                local v52 = (v48 + v49 * (v47 + v49 * (v46 + v49 * (v45 + v44 * v49)))) / v44
                if v51 > -1.0E-10 and v51 < 1.0E-10 then
                    local v53, v54 = Core.solve(1, v50, v52)
                    if not v54 or v54 < 0 then
                        return
                    else
                        local v55 = math.sqrt(v53)
                        local v56 = math.sqrt(v54)
                        return v49 - v56, v49 - v55, v49 + v55, v49 + v56
                    end
                else
                    local v57, _, v59 = Core.solve(1, 2 * v50, v50 * v50 - 4 * v52, -v51 * v51)
                    local v60 = v59 or v57
                    local v61 = math.sqrt(v60)
                    local v62, v63 = Core.solve(1, v61, (v60 + v50 - v51 / v61) / 2)
                    local v64, v65 = Core.solve(1, -v61, (v60 + v50 + v51 / v61) / 2)
                    if v62 and v64 then
                        return v49 + v62, v49 + v63, v49 + v64, v49 + v65
                    elseif v62 then
                        return v49 + v62, v49 + v63
                    elseif v64 then
                        return v49 + v64, v49 + v65
                    end
                end
            elseif v47 then
                local v66 = -v45 / (3 * v44);
                local v67 = -(v46 + v66 * (2 * v45 + 3 * v44 * v66)) / (3 * v44)
                local v68 = -(v47 + v66 * (v46 + v66 * (v45 + v44 * v66))) / (2 * v44)
                local v69 = v68 * v68 - v67 * v67 * v67
                local v70 = math.sqrt((math.abs(v69)))
                if v69 > 0 then
                    local v71 = v68 + v70
                    local v72 = v68 - v70
                    v71 = v71 < 0 and -(-v71) ^ 0.3333333333333333 or v71 ^ 0.3333333333333333
                    local v73 = v72 < 0 and -(-v72) ^ 0.3333333333333333 or v72 ^ 0.3333333333333333
                    return v66 + v71 + v73
                else
                    local v74 = math.atan2(v70, v68) / 3
                    local v75 = 2 * math.sqrt(v67)
                    return v66 - v75 * math.sin(v74 + 0.5235987755982988), v66 + v75 * math.sin(v74 - 0.5235987755982988), v66 + v75 * math.cos(v74)
                end;
            elseif v46 then
                local v76 = -v45 / (2 * v44)
                local v77 = v76 * v76 - v46 / v44
                if v77 < 0 then
                    return
                else
                    local v78 = math.sqrt(v77)
                    return v76 - v78, v76 + v78
                end
            elseif v45 then
                return -v45 / v44
            end
            return
        end
    end
    Core.complexTrajectory = function(o, a, t, s, e)
        if not o or not t then
            return
        end
        local ld = t - o
        a = -a
        e = e or Vector3.zero
        local r1, r2, r3, r4 = Core.solve(
            a:Dot(a) * 0.25,
            a:Dot(e),
            a:Dot(ld) + e:Dot(e) - s ^ 2,
            ld:Dot(e) * 2,
            ld:Dot(ld)
        )
        local x = (r1 and r1 > 0 and r1) or (r2 and r2 > 0 and r2) or (r3 and r3 > 0 and r3) or r4
        if not x then
            return
        end
        local v = (ld + e * x + 0.5 * a * x ^ 2) / x
        return v, x
    end
    Core.trajectory = function(o, a, t, s)
        if not o or not t then
            return
        end
        local f = -a
        local ld = t - o
        local a_dot = f:Dot(f)
        local b = 4 * ld:Dot(ld)
        local k = (4 * (f:Dot(ld) + s * s)) / (2 * a_dot)
        local v = (k * k - b / a_dot) ^ 0.5
        local t1, t0 = k - v, k + v
        t1 = t1 < 0 and t0 or t1;
        t1 = t1 ^ 0.5
        return f * t1 / 2 + ld / t1, t1
    end
    UserInputService.InputBegan:Connect(function(input, gpe)
        if not gpe and input.UserInputType == Enum.UserInputType.MouseButton2 then
            Core.SilentHolding = true
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton2 then
            Core.SilentHolding = false
        end
    end)
    RunService.RenderStepped:Connect(function(dt)
        local now = os.clock()
        local base = Core.SilentFOVRadius
        local targetFOV = base
        if Core.SilentDynamicFOV and Core.SilentHolding then
            targetFOV = base * (Core.DynamicFOVMultiplier or 1.85)
        end
        local speed = (targetFOV > Core.SilentCurrentFOV) and (Core.DynamicFOVSpeedIn or 0.05) or (Core.DynamicFOVSpeedOut or 0.05)
        Core.SilentCurrentFOV = Core.SilentCurrentFOV + (targetFOV - Core.SilentCurrentFOV) * speed
        local origin, valid = GetSilentScreenOrigin()
        if not Core.SilentFOVNextTargetUpdate then
            Core.SilentFOVNextTargetUpdate = 0
        end
        if Core.SilentFOVLockOnTarget and Core.SilentEnabled then
            if Core.SilentHolding and Core.SilentCachedTarget and Core.SilentCachedTarget:IsDescendantOf(workspace) then
                Core.SilentFOVCachedTarget = Core.SilentCachedTarget
                Core.SilentFOVNextTargetUpdate = now + Core.TARGET_UPDATE_RATE
            elseif now >= Core.SilentFOVNextTargetUpdate then
                local tPos, tEntry, tPart = Core:GetSilentClosestTarget()
                Core.SilentFOVCachedTarget = tPart
                Core.SilentFOVNextTargetUpdate = now + Core.TARGET_UPDATE_RATE
            end
            if Core.SilentFOVCachedTarget and typeof(Core.SilentFOVCachedTarget) == "Instance" and Core.SilentFOVCachedTarget:IsDescendantOf(workspace) then
                local pos, onScreen = Camera:WorldToViewportPoint(Core.SilentFOVCachedTarget.Position)
                if onScreen then
                    origin = Vector2.new(pos.X, pos.Y)
                    valid = true
                end
            end
        end
        if valid then
            if Core.SilentFOVLockOnTarget and Core.SilentEnabled and Core.SilentFOVCachedTarget and typeof(Core.SilentFOVCachedTarget) == "Instance" and Core.SilentFOVCachedTarget:IsDescendantOf(workspace) then
                if not Core.SilentFOVCurrentOrigin then
                    Core.SilentFOVCurrentOrigin = origin
                else
                    Core.SilentFOVCurrentOrigin = Core.SilentFOVCurrentOrigin:Lerp(origin, math.clamp(dt * 22.5, 0, 1))
                end
                origin = Core.SilentFOVCurrentOrigin
            else
                if Core.SilentFOVCurrentOrigin and (Core.SilentFOVCurrentOrigin - origin).Magnitude > 1 then
                    Core.SilentFOVCurrentOrigin = Core.SilentFOVCurrentOrigin:Lerp(origin, math.clamp(dt * 22.5, 0, 1))
                    origin = Core.SilentFOVCurrentOrigin
                else
                    Core.SilentFOVCurrentOrigin = nil
                end
            end
            SilentFOVCircle.Visible = Core.SilentShowFOV
            SilentFOVOutline.Visible = Core.SilentShowFOV
            Core.SilentFOVFill.Visible = Core.SilentShowFOV
            SilentFOVCircle.Position = origin
            SilentFOVOutline.Position = origin
            Core.SilentFOVFill.Position = origin
            SilentFOVCircle.Radius = Core.SilentCurrentFOV
            SilentFOVOutline.Radius = Core.SilentCurrentFOV
            Core.SilentFOVFill.Radius = Core.SilentCurrentFOV
            SilentFOVCircle.Color = Core.SilentFOVColor
            if Options["SilentCore.FOVFillColor"] then
                Core.SilentFOVFill.Color = Core.SilentFOVFillColor or Color3.fromRGB(83, 132, 171)
                Core.SilentFOVFill.Transparency = 1 - Options["SilentCore.FOVFillColor"].Transparency
            end
        else
            Core.SilentFOVCurrentOrigin = nil
            SilentFOVCircle.Visible = false
            SilentFOVOutline.Visible = false
            Core.SilentFOVFill.Visible = false
        end
        local snapOrigin
        local snapValid = false
        if Core.SilentSnapOriginMethod == "Gun Barrel" then
            if not Core.HasKnife and Core.GunBarrel and Core.GunBarrel:IsDescendantOf(Camera) then
                local v, onScreen = Camera:WorldToViewportPoint(Core.GunBarrel.Position)
                if onScreen then
                    snapOrigin = Vector2.new(v.X, v.Y)
                    snapValid = true
                end
            end
        else
            snapOrigin = UserInputService:GetMouseLocation()
            snapValid = true
        end
        local snapTarget = nil
        if Core.SilentSnapEnabled and snapValid then
            if not Core.SilentNextTargetUpdate then
                Core.SilentNextTargetUpdate = 0
            end
            if now >= Core.SilentNextTargetUpdate then
                local tPos, tEntry, tPart = Core:GetSilentClosestTarget()
                snapTarget = tPart
                Core.SilentCachedTarget = snapTarget
                Core.SilentNextTargetUpdate = now + Core.TARGET_UPDATE_RATE
            else
                snapTarget = Core.SilentCachedTarget
            end
            if snapTarget and typeof(snapTarget) == "Instance" and snapTarget:IsDescendantOf(workspace) then
                local pos, onScreen = Camera:WorldToViewportPoint(snapTarget.Position)
                if onScreen then
                    local dist = origin and (Vector2.new(pos.X, pos.Y) - origin).Magnitude or math.huge
                    if Core.SilentHolding or dist <= (Core.SilentCurrentFOV * 1.5) then
                        if not Core.SilentSnapWasDrawing then
                            Core.SilentSnapAlpha = 0
                        end
                        Core.SilentSnapWasDrawing = true
                        Core.SilentSnapAlpha = math.clamp((Core.SilentSnapAlpha or 0) + (dt / 0.1), 0, 1)
                        SilentSnapLine.Visible = true
                        SilentSnapOutline.Visible = true
                        SilentSnapLine.From = snapOrigin
                        SilentSnapLine.To = Vector2.new(pos.X, pos.Y)
                        SilentSnapOutline.From = snapOrigin
                        SilentSnapOutline.To = Vector2.new(pos.X, pos.Y)
                        SilentSnapLine.Transparency = Core.SilentSnapAlpha
                        SilentSnapOutline.Transparency = Core.SilentSnapAlpha
                    else
                        SilentSnapLine.Visible = false
                        SilentSnapOutline.Visible = false
                        Core.SilentSnapWasDrawing = false
                    end
                else
                    SilentSnapLine.Visible = false
                    SilentSnapOutline.Visible = false
                    Core.SilentSnapWasDrawing = false
                end
            else
                SilentSnapLine.Visible = false
                SilentSnapOutline.Visible = false
                Core.SilentSnapWasDrawing = false
            end
        else
            SilentSnapLine.Visible = false
            SilentSnapOutline.Visible = false
            Core.SilentSnapWasDrawing = false
        end
    end)
    local function applyHitSound(s)
        if not s:IsA("Sound") then
            return
        end
        if s.Name ~= "hitmarker" then
            return
        end
        if not Core.HitSoundBackup[s] then
            Core.HitSoundBackup[s] = {
                Id = s.SoundId,
                Volume = s.Volume
            }
        end
        local id = Core.HitSoundMap[Core.HitSoundSelected]
        if id and s.SoundId ~= id then
            s.SoundId = id
        end
        s.Volume = Core.HitSoundVolume
    end
    local function restoreHitSound(s)
        local old = Core.HitSoundBackup[s]
        if old then
            s.SoundId = old.Id
            s.Volume = old.Volume
            Core.HitSoundBackup[s] = nil
        end
    end
    local function applyKillSound(s)
        if not s:IsA("Sound") then
            return
        end
        if s.Name ~= "killshot" and s.Name ~= "headshotkill" then
            return
        end
        if not Core.KillSoundBackup[s] then
            Core.KillSoundBackup[s] = {
                Id = s.SoundId,
                Volume = s.Volume
            }
        end
        local id = Core.KillSoundMap[Core.KillSoundSelected]
        if id and s.SoundId ~= id then
            s.SoundId = id
        end
        s.Volume = Core.KillSoundVolume
    end
    local function restoreKillSound(s)
        local old = Core.KillSoundBackup[s]
        if old then
            s.SoundId = old.Id
            s.Volume = old.Volume
            Core.KillSoundBackup[s] = nil
        end
    end
    local CachedSlots = {}
    local OriginalColors = {}
    local function CacheSleeves()
        table.clear(CachedSlots)
        table.clear(OriginalColors)
        for _, obj in ipairs(Camera:GetDescendants()) do
            if obj:IsA("MeshPart") and obj.Name == "Sleeves" then
                for _, tex in ipairs(obj:GetChildren()) do
                    if tex:IsA("Texture") and tex.Name == "Slot1" then
                        table.insert(CachedSlots, tex)
                        OriginalColors[tex] = tex.Color3
                    end
                end
            end
        end
    end
    local function Apply()
        if #CachedSlots == 0 then
            CacheSleeves()
        end
        local texId
        if Core.MasterEnabled then
            texId = SleeveTextureIds[Core.SelectedSleeveTexture or "Default"]
        else
            texId = SleeveTextureIds.Default
        end
        if not texId then
            warn("sleeves arent found.. WTF!!")
            return
        end
        for _, tex in ipairs(CachedSlots) do
            if tex:IsDescendantOf(Camera) then
                tex.Texture = texId
                if Core.MasterEnabled and Core.SleeveColor then
                    tex.Color3 = Core.SleeveColor
                else
                    tex.Color3 = OriginalColors[tex] or tex.Color3
                end
            end
        end
    end
    Camera.DescendantAdded:Connect(function(obj)
        if obj:IsA("Texture") and obj.Name == "Slot1" then
            if obj.Parent and obj.Parent:IsA("MeshPart") and obj.Parent.Name == "Sleeves" then
                table.insert(CachedSlots, obj)
                OriginalColors[obj] = obj.Color3
                Apply()
            end
        end
    end)
    local lastState = Core.MasterEnabled
    game:GetService("RunService").Stepped:Connect(function()
        if Core.MasterEnabled ~= lastState then
            lastState = Core.MasterEnabled
            Apply()
        end
    end)
    local Window = Library:CreateWindow({
        Title = "                                          $$ roxy.win $$",
        Center = true,
        AutoShow = true,
        MenuFadeTime = 0.1,
        Resizable = true,
        ShowCustomCursor = false,
        NotifySide = "Bottom",
        Size = UDim2.new(0, 800, 0, 600)
    })
    for _, v in ipairs(Window.Holder:GetDescendants()) do
        if v:IsA("TextLabel") and v.Text:find("roxy.win") then
            v.RichText = true
            break
        end
    end
    local Tabs = {
        A = Window:AddTab("Legitbot"),
        B2 = Window:AddTab("Ragebot"),
        B = Window:AddTab("Visuals"),
        C = Window:AddTab("Misc"),
        ["UI Settings"] = Window:AddTab("Configs")
    }
    local Aimbot = Tabs.A:AddLeftGroupbox("Aimbot")
    local Silent = Tabs.A:AddRightGroupbox("Silent")
    local LOCALP = Tabs.A:AddLeftGroupbox("Local")
    local GunMods = Tabs.A:AddRightGroupbox("Gun Mods")
    GunMods:AddToggle("NoRecoil", {
        Text = "No Recoil",
        Default = false,
        Tooltip = "Removes weapon recoil",
        Callback = function(v)
            Core.NoRecoil = v
        end
    })
    GunMods:AddToggle("NoSpread", {
        Text = "No Spread",
        Default = false,
        Tooltip = "Removes weapon spread/bullet deviation",
        Callback = function(v)
            Core.NoSpread = v
        end
    })
    GunMods:AddToggle("NoCameraSway", {
        Text = "No Camera Sway",
        Default = false,
        Tooltip = "Removes camera sway while aiming",
        Callback = function(v)
            Core.NoCameraSway = v
        end
    })
    GunMods:AddToggle("NoCameraBob", {
        Text = "No Camera Bob",
        Default = false,
        Tooltip = "Removes camera bobbing while moving",
        Callback = function(v)
            Core.NoCameraBob = v
        end
    })
    GunMods:AddToggle("NoWalkSway", {
        Text = "No Walk Sway",
        Default = false,
        Tooltip = "Removes weapon sway caused by walking",
        Callback = function(v)
            Core.NoWalkSway = v
        end
    })
    GunMods:AddToggle("NoGunSway", {
        Text = "No Gun Sway",
        Default = false,
        Tooltip = "Removes weapon sway completely",
        Callback = function(v)
            Core.NoGunSway = v
        end
    })
    GunMods:AddToggle("InstantReload", {
        Text = "Instant Reload",
        Default = false,
        Tooltip = "Reloads your weapon instantly",
        Callback = function(v)
            Core.InstantReload = v
        end
    })
    GunMods:AddToggle("InstantAim", {
        Text = "Instant Aim",
        Default = false,
        Tooltip = "Makes aiming down sights instantaneous",
        Callback = function(v)
            Core.InstantAim = v
        end
    })
    GunMods:AddToggle("InstantEquip", {
        Text = "Instant Equip",
        Default = false,
        Tooltip = "Makes weapon switching instantaneous",
        Callback = function(v)
            Core.InstantEquip = v
        end
    })
    local ESP1 = Tabs.B:AddLeftGroupbox("Enemy")
    local ESP2 = Tabs.B:AddRightTabbox()
    local ESP4 = Tabs.B:AddLeftGroupbox("Crosshair")
    local AimbotToggle = Aimbot:AddToggle("ToggleAimbot", {
        Text = "Toggle Aimbot",
        Default = false,
        Callback = function(v)
            Core.AimbotEnabled = v
        end
    })
    AimbotToggle:AddKeyPicker("AimbotToggleKeybind", {
        Default = "MB2",
        Mode = "Hold",
        SyncToggleState = false,
        Text = "Aimbot",
        Callback = function()
        end,
        ChangedCallback = function(New)
            Core.AimKey = New
        end
    })
    Aimbot:AddToggle("AimbotStickyAimToggle", {
        Text = "Sticky Aim",
        Default = false,
        Callback = function(v)
            Core.StickyAim = v
        end
    })
    Aimbot:AddToggle("WallCheckToggle", {
        Text = "Wall Check",
        Default = false,
        Callback = function(v)
            Core.WallCheck = v
        end
    })
    Aimbot:AddToggle("AimbotPredDropToggle", {
        Text = "Calculate Bullet Drop",
        Default = false,
        Callback = function(v)
            Core.AimbotPredDropEnabled = v
        end
    })
    Aimbot:AddToggle("AimbotPredictionToggle", {
        Text = "Calculate Prediction",
        Default = false,
        Callback = function(v)
            Core.AimbotPredictionEnabled = v
        end
    })
    Aimbot:AddSlider("SmoothnessSlider", {
        Text = "Smoothness",
        Default = 1.2,
        Min = 0.3,
        Max = 5,
        Rounding = 1,
        Compact = true,
        Callback = function(v)
            Core.AimVelocity = v * 1000
        end
    })
    Aimbot:AddSlider("MaxDistanceB", {
        Text = "Max Distance",
        Default = 500,
        Min = 1,
        Max = 1000,
        Rounding = 0,
        Compact = true,
        Suffix = "stds",
        Callback = function(v)
            Core.MaxAimDistance = v
        end
    })
    Aimbot:AddDropdown('AimbotPartSelection', {
        Values = {
            'Head',
            'Torso'
        },
        Default = 1,
        Multi = false,
        Text = 'Aimbot Bone',
        Callback = function(Value)
            Core.SelectedAimPart = Value
            Core.TARGET_MESH_ID = Core.MESH_IDS[Value]
        end
    })
    Aimbot:AddDropdown('AimbotTypeDropdown', {
        Values = {
            'Closest To Mouse',
            'Closest To You'
        },
        Default = 1,
        Multi = false,
        Text = 'Target Priority',
        Callback = function(Value)
            Core.AimbotType = Value
        end
    })
    Aimbot:AddDivider()
    local SnapLine1 = Aimbot:AddToggle("SnapLineToggle", {
        Text = "Snap Line",
        Default = false,
        Callback = function(v)
            Core.SnapEnabled = v
            if not v then
                SnapLine.Visible = false
                SnapOutline.Visible = false
            end
        end
    })
    SnapLine1:AddColorPicker("SnapLineColor", {
        Default = Color3.fromRGB(255, 255, 255),
        Title = "Line Color",
        Callback = function(v)
            SnapLine.Color = v
        end
    })
    local FOVToggle = Aimbot:AddToggle("ToggleFOV", {
        Text = "Show FOV",
        Default = false,
        Callback = function(v)
            Core.ShowFOV = v
        end
    })
    Aimbot:AddToggle("DynamicFOVToggle", {
        Text = "Dynamic FOV",
        Default = false,
        Callback = function(v)
            Core.DynamicFOVEnabled = v
        end
    })
    Aimbot:AddToggle("FOVLockOnTarget", {
        Text = "Lock On Target",
        Tooltip = "Locks FOV on aimbot target",
        Default = false,
        Callback = function(v)
            Core.FOVLockOnTarget = v
        end
    })
    FOVToggle:AddColorPicker("Core.FOVColor", {
        Default = Color3.fromRGB(255, 255, 255),
        Title = "FOV Color",
        Callback = function(v)
            Core.FOVColor = v
        end
    })
    FOVToggle:AddColorPicker("Core.FOVFillColor", {
        Default = Color3.fromRGB(83, 132, 171),
        Title = "FOV Fill Color",
        Transparency = 0.5,
        Callback = function(v)
            Core.FOVFillColor = v
        end
    })
    Aimbot:AddSlider("FOVSize1", {
        Text = "Size",
        Default = 120,
        Min = 0,
        Max = 500,
        Rounding = 0,
        Suffix = "px",
        Compact = true,
        Callback = function(v)
            Core.FOVRadius = v
        end
    })
    Aimbot:AddDropdown('SnapLineMethod', {
        Values = {
            'Gun Barrel',
            'Mouse'
        },
        Default = 1,
        Multi = false,
        Text = 'Snap From',
        Callback = function(v)
            Core.SnapLineMethod = v
        end
    })
    Aimbot:AddDropdown('FovPositionMethod', {
        Values = {
            'Gun Barrel',
            'Mouse'
        },
        Default = 2,
        Multi = false,
        Text = 'Fov Position',
        Callback = function(v)
            Core.FovPositionMethod = v
        end
    })
    LOCALP:AddToggle("WALKSPEEDLOCK", {
        Text = "Walkspeed Modifier",
        Default = false,
        Compact = true,
        Callback = function(value)
            Core.WalkSpeedEnabled = value
            local char = Core.charInterface and Core.charInterface.getCharacterObject()
            if char then
                char:setBaseWalkSpeed(value and Core.TARGET_WALKSPEED or (Core.newSpawnCache.walkSpeed or 16))
            end
        end
    }):AddKeyPicker("WalkSpeedKeybind", {
        Default = "None",
        SyncToggleState = true,
        Mode = "Toggle",
        Text = "Walkspeed",
        NoUI = false
    })
    LOCALP:AddToggle("NOJUMPCOOLDOWN", {
        Text = "No Jump Cooldown",
        Default = false,
        Callback = function(value)
            Core.NoJumpCooldownEnabled = value
            if not value then
                local char = Core.charInterface and Core.charInterface.getCharacterObject()
                local hum = char and char._humanoid
                if hum then
                    hum.Jump = false
                end
            end
        end
    })
    LOCALP:AddToggle("NOFALLDAMAGE", {
        Text = "No Fall Damage",
        Default = false,
        Callback = function(value)
            Core.NoFallDamageEnabled = value
        end
    })
    LOCALP:AddSlider("WALKSPEEDSLIDER", {
        Text = "WalkSpeed",
        Default = 16,
        Min = 5,
        Max = 250,
        Rounding = 0,
        Compact = false,
        Callback = function(Value)
            Core.TARGET_WALKSPEED = Value
            local char = Core.charInterface and Core.charInterface.getCharacterObject()
            if Core.WalkSpeedEnabled and char then
                char:setBaseWalkSpeed(Value)
            end
        end
    })
    local ESP2TAB = ESP2:AddTab('Arm')
    ESP2TAB:AddToggle('ArmVisualsToggle', {
        Text = 'Toggle Arm Visuals',
        Default = false,
        Tooltip = nil,
        Callback = function(Value)
            Core.MasterEnabled = Value
            if not Value then
                ClearAll()
                restoreArmMaterial()
                restoreHideArms()
                SetSleeveSlotsTransparency(0)
            end
        end
    })
    local ArmsHighlight = ESP2TAB:AddToggle('ArmHighlighToggle', {
        Text = 'Arm Highlight',
        Default = false,
        Tooltip = nil,
        Callback = function(Value)
            Core.HighlightEnabled = Value
            if not Value then
                ClearAll()
            end
        end
    })
    ArmsHighlight:AddColorPicker("ArmFillCP", {
        Default = Color3.fromRGB(84, 132, 171),
        Title = "Fill Color",
        Transparency = nil,
        Callback = function(value)
            Core.FillColor = value
            for _, h in pairs(Core.ArmHighlights) do
                h.FillColor = value
            end
        end
    })
    ArmsHighlight:AddColorPicker("ArmHighlightCP", {
        Default = Color3.fromRGB(255, 255, 255),
        Title = "Highlight Color",
        Transparency = nil,
        Callback = function(value)
            Core.OutlineColor = value
            for _, h in pairs(Core.ArmHighlights) do
                h.OutlineColor = value
            end
        end
    })
    ESP2TAB:AddSlider('HighlightTransparency', {
        Text = 'Transparency',
        Default = Core.HighlightFillTransparency,
        Min = 0,
        Max = 1,
        Rounding = 1,
        Compact = true,
        Callback = function(Value)
            Core.HighlightFillTransparency = Value
            for _, h in pairs(Core.ArmHighlights) do
                h.FillTransparency = Value
            end
        end
    })
    local ArmsMaterial = ESP2TAB:AddToggle('ArmsMaterialToggle', {
        Text = 'Arm Material',
        Default = false,
        Callback = function(Value)
            Core.ArmsMaterialEnabled = Value
            if not Value then
                restoreArmMaterial()
            end
        end
    })
    ArmsMaterial:AddColorPicker("ArmMaterialCP", {
        Default = Color3.fromRGB(84, 132, 171),
        Title = "Material Color",
        Callback = function(value)
            Core.ArmsMaterialColor = value
        end
    })
    ESP2TAB:AddToggle('HideArmsToggle', {
        Text = 'Hide Arms',
        Default = false,
        Callback = function(Value)
            Core.HideArmsEnabled = Value
            if not Value then
                restoreHideArms()
            end
        end
    })
    ESP2TAB:AddToggle('HideSleevesToggle', {
        Text = 'Hide Sleeves',
        Default = false,
        Callback = function(Value)
            Core.HideSleevesEnabled = Value
            if Value and Core.MasterEnabled then
                SetSleeveSlotsTransparency(1)
            else
                SetSleeveSlotsTransparency(0)
            end
        end
    })
    ESP2TAB:AddDropdown('ArmMaterialDropdown', {
        Values = {
            'ForceField',
            'Neon',
            'SmoothPlastic',
            'Glass',
            'Metal'
        },
        Default = 1,
        Multi = false,
        Text = 'Material Selection',
        Callback = function(Value)
            Core.ArmsMaterialEnum = Core.MaterialMap[Value] or Enum.Material.ForceField
        end
    })
    ESP2TAB:AddDropdown('ArmForceFieldTextureDropdown', {
        Values = (function()
            local keys = {}
            for k, _ in pairs(Core.ForceFieldTextures) do
                table.insert(keys, k)
            end
            table.sort(keys)
            return keys
        end)(),
        Default = "Honeycomb",
        Multi = false,
        Text = 'ForceField Texture',
        Callback = function(Value)
            Core.SelectedArmForcefieldTexture = Value
        end
    })
    ESP2TAB:AddDropdown('SleeveTextureDropdown', {
        Values = {
            'Default',
            'Beach',
            'Camo'
        },
        Default = 1,
        Multi = false,
        Text = 'Sleeves Texture',
        Callback = function(Value)
            Core.SelectedSleeveTexture = Value
            Apply()
        end
    })
    ESP2TAB:AddLabel('Sleeves Color'):AddColorPicker('SleeveColorP', {
        Default = Color3.new(1, 1, 1),
        Title = 'Sleeve Color',
        Transparency = nil,
        Callback = function(Value)
            Core.SleeveColor = Value
            if Core.MasterEnabled then
                Apply()
            end
        end
    })
    local ESP2TAB1 = ESP2:AddTab('Weapon')
    ESP2TAB1:AddToggle('WeaponVisualsToggle', {
        Text = 'Toggle Weapon Visuals',
        Default = false,
        Tooltip = nil,
        Callback = function(Value)
            Core.WeaponMasterEnabled = Value
            if not Value then
                clearWeaponHighlights()
                restoreWeaponMaterial()
            end
        end
    })
    local WeaponHighlightT = ESP2TAB1:AddToggle('WeaponHighlightToggle', {
        Text = 'Weapon Highlight',
        Default = false,
        Tooltip = nil,
        Callback = function(Value)
            Core.WeaponHighlightEnabled = Value
            if not Value then
                clearWeaponHighlights()
            end
        end
    })
    WeaponHighlightT:AddColorPicker("WeaponFillCP", {
        Default = Core.WeaponFillColor,
        Title = "Fill Color",
        Transparency = nil,
        Callback = function(value)
            Core.WeaponFillColor = value
            for _, h in pairs(Core.WeaponHighlights) do
                h.FillColor = value
            end
        end
    })
    WeaponHighlightT:AddColorPicker("WeaponHighlightCP", {
        Default = Core.WeaponOutlineColor,
        Title = "Highlight Color",
        Transparency = nil,
        Callback = function(value)
            Core.WeaponOutlineColor = value
            for _, h in pairs(Core.WeaponHighlights) do
                h.OutlineColor = value
            end
        end
    })
    ESP2TAB1:AddSlider('WeaponHighlightTransparency', {
        Text = 'Transparency',
        Default = Core.WeaponFillTransparency,
        Min = 0,
        Max = 1,
        Rounding = 1,
        Compact = true,
        Callback = function(Value)
            Core.WeaponFillTransparency = Value
            for _, h in pairs(Core.WeaponHighlights) do
                h.FillTransparency = Value
            end
        end
    })
    local WeaponMaterial = ESP2TAB1:AddToggle('WeaponMaterialToggle', {
        Text = 'Weapon Material',
        Default = false,
        Callback = function(Value)
            Core.WeaponMaterialEnabled = Value
            if not Value or not Core.WeaponMasterEnabled then
                restoreWeaponMaterial()
            end
        end
    })
    WeaponMaterial:AddColorPicker("WeaponMaterialCP", {
        Default = Color3.fromRGB(84, 132, 171),
        Title = "Material Color",
        Callback = function(value)
            Core.WeaponMaterialColor = value
        end
    })
    ESP2TAB1:AddToggle('HideGunToggle', {
        Text = 'Hide Gun',
        Default = false,
        Callback = function(Value)
            Core.HideGunEnabled = Value
            if not Value or not Core.WeaponMasterEnabled then
                if type(restoreHideGun) == "function" then
                    restoreHideGun()
                end
            end
        end
    })
    ESP2TAB1:AddDropdown('WeaponMaterialDropdown', {
        Values = {
            'ForceField',
            'Neon',
            'SmoothPlastic',
            'Glass',
            'Metal'
        },
        Default = 1,
        Multi = false,
        Text = 'Material Selection',
        Callback = function(Value)
            Core.WeaponMaterialEnum = Core.WeaponMaterialMap[Value] or Enum.Material.ForceField
        end
    })
    ESP2TAB1:AddDropdown('WeaponForceFieldTextureDropdown', {
        Values = (function()
            local keys = {}
            for k, _ in pairs(Core.ForceFieldTextures) do
                table.insert(keys, k)
            end
            table.sort(keys)
            return keys
        end)(),
        Default = "Honeycomb",
        Multi = false,
        Text = 'ForceField Texture',
        Callback = function(Value)
            Core.SelectedWeaponForcefieldTexture = Value
        end
    })
    ESP2TAB1:AddDivider()
    ESP2TAB1:AddToggle('ViewmodelOffsetToggle', {
        Text = 'Offset Changer',
        Default = false,
        Callback = function(v)
            Core.ViewmodelOffsetEnabled = v
        end
    })
    ESP2TAB1:AddToggle('ViewmodelOffsetRemoveOnAim', {
        Text = 'Remove On Aim',
        Default = false,
        Callback = function(v)
            Core.ViewmodelOffsetRemoveOnAim = v
        end
    })
    ESP2TAB1:AddSlider('ViewmodelOffsetX', {
        Text = 'Offset X',
        Default = 0,
        Min = -5,
        Max = 5,
        Rounding = 1,
        Compact = true,
        Callback = function(v)
            Core.ViewmodelOffsetX = v
            Core:UpdateViewmodelOffset()
        end
    })
    ESP2TAB1:AddSlider('ViewmodelOffsetY', {
        Text = 'Offset Y',
        Default = 0,
        Min = -5,
        Max = 5,
        Rounding = 1,
        Compact = true,
        Callback = function(v)
            Core.ViewmodelOffsetY = v
            Core:UpdateViewmodelOffset()
        end
    })
    ESP2TAB1:AddSlider('ViewmodelOffsetZ', {
        Text = 'Offset Z',
        Default = 0,
        Min = -5,
        Max = 5,
        Rounding = 1,
        Compact = true,
        Callback = function(v)
            Core.ViewmodelOffsetZ = v
            Core:UpdateViewmodelOffset()
        end
    })
    local CHAMSESP1 = ESP1:AddToggle('ChamsESP', {
        Text = 'Player Chams',
        Default = false,
        Callback = function(v)
            Core.ChamsEnabled = v
            if Core.ChamsEnabled then
                for _, folder in ipairs(PlayersFolder:GetChildren()) do
                    if folder:IsA("Folder") then
                        for _, model in ipairs(folder:GetChildren()) do
                            processChams(model)
                            for _, child in ipairs(model:GetChildren()) do
                                if isValidModel(child) then
                                    processChams(child)
                                end
                            end
                        end
                    end
                end
            else
                for model in pairs(Core.ActiveChams) do
                    clearChams(model)
                end
            end
        end
    })
    CHAMSESP1:AddColorPicker("ChamsESPCP", {
        Default = Color3.fromRGB(84, 132, 171),
        Title = "Chams Color",
        Callback = function(v)
            Core.ChamsColor = v
            updateAllChams()
        end
    })
    local NAMEVISUALS = ESP1:AddToggle('ShowPlayerTags', {
        Text = 'Player Name',
        Default = false,
        Callback = function(state)
            Core.NameESPEnabled = state
        end
    })
    NAMEVISUALS:AddColorPicker('NameTagColor', {
        Default = Color3.fromRGB(255, 255, 255),
        Title = 'Name Text Color',
        Transparency = 0,
        Callback = function(color)
            Core.NameTextColor = color
            for _, text in pairs(Core.NameDrawings) do
                text.Color = color
            end
        end
    })
    local BOXVISUALS = ESP1:AddToggle("BoxESP", {
        Text = "Player Box",
        Default = false,
        Callback = function(state)
            Core.BoxESPEnabled = state
        end
    })
    BOXVISUALS:AddColorPicker("BoxESPColor", {
        Default = Color3.fromRGB(255, 255, 255),
        Title = "Box Color",
        Transparency = 0,
        Callback = function(color)
            Core.BoxColor = color
            for _, box in pairs(Core.BoxDrawings) do
                box.Color = color
            end
        end
    })
    Core.BoxFillDepBox = ESP1:AddDependencyBox()
    Core.BoxFillDepBox:AddToggle("BoxFillToggle", {
        Text = "Box Fill",
        Default = false,
        Callback = function(state)
            Core.BoxFillEnabled = state
        end
    }):AddColorPicker("BoxFillColorPicker", {
        Default = Color3.fromRGB(84, 132, 171),
        Title = "Box Fill Color",
        Transparency = 0.5,
        Callback = function(color)
            Core.BoxFillColor = color
        end
    })
    Core.BoxFillDepBox:SetupDependencies({
        {
            BOXVISUALS,
            true
        }
    })
    local HEALTHVISUALS = ESP1:AddToggle("HealthESP", {
        Text = "Player Health",
        Default = false,
        Callback = function(state)
            Core.HealthESPEnabled = state
        end
    })
    HEALTHVISUALS:AddColorPicker("HealthESPHigh", {
        Default = Color3.fromRGB(0, 255, 0),
        Title = "Health Color ( High )",
        Transparency = nil,
        Callback = function(color)
            Core.HealthHighColor = color
        end
    })
    HEALTHVISUALS:AddColorPicker("HealthESPLow", {
        Default = Color3.fromRGB(255, 0, 0),
        Title = "Health Color ( Low )",
        Transparency = nil,
        Callback = function(color)
            Core.HealthLowColor = color
        end
    })
    local HealthDepBox = ESP1:AddDependencyBox()
    local HealthTextToggle = HealthDepBox:AddToggle("HealthTextToggle", {
        Text = "Player Health Text",
        Default = false,
        Callback = function(state)
            Core.HealthTextEnabled = state
        end
    })
    HealthTextToggle:AddColorPicker("HealthTextColor", {
        Default = Color3.fromRGB(255, 255, 255),
        Title = "Health Text Color",
        Callback = function(color)
            Core.HealthTextColor = color
        end
    })
    HealthDepBox:AddToggle("HealthGradientToggle", {
        Text = "Gradient Color",
        Default = false,
        Callback = function(state)
            Core.HealthGradientEnabled = state
        end
    })
    HealthDepBox:SetupDependencies({
        {
            HEALTHVISUALS,
            true
        }
    })
    HealthDepBox = ESP1:AddDependencyBox()
    HealthDepBox:AddToggle("HealthGradientRotationToggle", {
        Text = "Gradient Rotation",
        Default = false,
        Callback = function(v)
            Core.HealthGradientRotationEnabled = v
        end
    })
    HealthDepBox:SetupDependencies({
        {
            Toggles.HealthGradientToggle,
            true
        }
    })
    HealthDepBox = ESP1:AddDependencyBox()
    HealthDepBox:AddSlider("HealthGradientRotationSpeed", {
        Text = "Gradient Rotation Speed",
        Default = 1,
        Min = 0.1,
        Max = 10,
        Rounding = 1,
        Compact = true,
        Callback = function(v)
            Core.HealthGradientRotationSpeed = v
        end
    })
    HealthDepBox:SetupDependencies({
        {
            Toggles.HealthGradientRotationToggle,
            true
        }
    })
    local CHAMSESP2 = ESP1:AddToggle('DistanceESP', {
        Text = 'Player Distance',
        Default = false,
        Callback = function(v)
            Core.DistanceESPEnabled = v
        end
    })
    CHAMSESP2:AddColorPicker("DistanceESPCP", {
        Default = Color3.fromRGB(255, 255, 255),
        Title = "Text Color",
        Callback = function(v)
            Core.DistanceTextColor = v
        end
    })
    local CHAMSESP3 = ESP1:AddToggle('WeaponESP', {
        Text = 'Player Weapon',
        Default = false,
        Callback = function(v)
            Core.WeaponESPEnabled = v
        end
    })
    CHAMSESP3:AddColorPicker("WeaponESPCP", {
        Default = Color3.fromRGB(255, 255, 255),
        Title = "Text Color",
        Callback = function(v)
            Core.WeaponTextColor = v
        end
    })
    ESP1:AddSlider("ChamsTransparencySlider", {
        Text = "Chams Transparency",
        Default = Core.ChamsTransparency or 0.5,
        Min = 0,
        Max = 1,
        Rounding = 2,
        Compact = true,
        Callback = function(v)
            Core.ChamsTransparency = v
            updateAllChams()
        end
    })
    ESP1:AddDropdown('FontTypeDropdown', {
        Values = {
            'UI',
            'System',
            'Plex',
            'Monospace'
        },
        Default = 3,
        Multi = false,
        Text = 'Font Type',
        Callback = function(Value)
            local fontId = FontMap[Value]
            if fontId ~= nil then
                updateAllFonts(fontId)
            end
        end
    })
    ESP1:AddDropdown('FontCaseDropdown', {
        Values = {
            'Normal',
            'Lowercase',
            'Uppercase'
        },
        Default = 1,
        Multi = false,
        Text = 'Font Case',
        Callback = function(Value)
            Core.FontCase = Value
        end
    })
    local TabBox2 = Tabs.B:AddRightTabbox()
    local WorldTab = TabBox2:AddTab('World')
    local CAmbientToggle = WorldTab:AddToggle('CustomAmbienToggle', {
        Text = 'Custom Ambient',
        Default = false,
        Callback = function(enabled)
            Core.CustomAmbientEnabled = enabled
            if enabled then
                Lighting.Ambient = Core.CAmbientColor
                task.spawn(function()
                    while Core.CustomAmbientEnabled and not Library.Unloaded do
                        if Lighting.Ambient ~= Core.CAmbientColor then
                            Lighting.Ambient = Core.CAmbientColor
                        end
                        task.wait()
                    end
                end)
            else
                Lighting.Ambient = Color3.fromRGB(150, 150, 150)
            end
        end
    })
    CAmbientToggle:AddColorPicker('CAmbientCP1', {
        Default = Core.CAmbientColor,
        Title = 'Ambient Color',
        Callback = function(color)
            Core.CAmbientColor = color
            if Core.CustomAmbientEnabled then
                Lighting.Ambient = Core.CAmbientColor
            end
        end
    })
    WorldTab:AddToggle('CustomSkyboxToggle', {
        Text = 'Custom Skybox',
        Default = false,
        Tooltip = "If skyboxes arent showing toggle custom clocktime",
        Callback = function(enabled)
            Core.SkyboxEnabled = enabled
            if Core.SkyboxEnabled then
                ApplySky(Core.SelectedSky)
            else
                RestoreSky()
            end
        end
    })
    WorldTab:AddToggle('CustomClockTimeToggle', {
        Text = 'Custom ClockTime',
        Default = false,
        Callback = function(enabled)
            Core.CustomClockTimeEnabled = enabled
            if enabled then
                Core.OriginalClockTime = Lighting.ClockTime
                Lighting.ClockTime = Core.CustomClockTimeValue
            else
                Lighting.ClockTime = Core.OriginalClockTime
            end
        end
    })
    WorldTab:AddSlider("CustomClockTimeSlider", {
        Text = "ClockTime",
        Default = 12,
        Min = 0,
        Max = 24,
        Rounding = 0,
        Compact = true,
        Callback = function(v)
            Core.CustomClockTimeValue = v
            if Core.CustomClockTimeEnabled then
                Lighting.ClockTime = v
            end
        end
    })
    WorldTab:AddDropdown('SkyboxSelectionDropdown', {
        Values = (function()
            local skyKeys = {}
            for k, _ in pairs(Core.Skyboxes) do
                table.insert(skyKeys, k)
            end
            table.sort(skyKeys)
            return skyKeys
        end)(),
        Default = "ElegantMorning",
        Multi = false,
        Text = 'Skybox Selection',
        Callback = function(value)
            Core.SelectedSky = value
            if Core.SkyboxEnabled then
                ApplySky(Core.SelectedSky)
            end
        end
    })
    WorldTab:AddDivider()
    WorldTab:AddToggle('BloomToggle', {
        Text = 'Bloom',
        Default = false,
        Callback = function(enabled)
            Core.BloomEnabled = enabled
            if enabled then
                if not Lighting:FindFirstChild("RoxyBloom") then
                    Instance.new("BloomEffect", Lighting).Name = "RoxyBloom"
                end
                if not Lighting:FindFirstChild("RoxyBloomCC") then
                    Instance.new("ColorCorrectionEffect", Lighting).Name = "RoxyBloomCC"
                end
                Lighting.RoxyBloom.Enabled = true
                Lighting.RoxyBloomCC.Enabled = true
                Lighting.RoxyBloom.Intensity = Core.BloomIntensity or 1
                Lighting.RoxyBloom.Size = Core.BloomSize or 24
                Lighting.RoxyBloom.Threshold = Core.BloomThreshold or 2
                Lighting.RoxyBloomCC.TintColor = Core.BloomColor or Color3.fromRGB(255, 255, 255)
            else
                if Lighting:FindFirstChild("RoxyBloom") then
                    Lighting.RoxyBloom.Enabled = false
                end
                if Lighting:FindFirstChild("RoxyBloomCC") then
                    Lighting.RoxyBloomCC.Enabled = false
                end
            end
        end
    }):AddColorPicker('BloomColorCP', {
        Default = Color3.fromRGB(255, 255, 255),
        Title = 'Bloom Color',
        Callback = function(color)
            Core.BloomColor = color
            if Core.BloomEnabled and Lighting:FindFirstChild("RoxyBloomCC") then
                Lighting.RoxyBloomCC.TintColor = color
            end
        end
    })
    WorldTab:AddSlider("BloomSizeSlider", {
        Text = "Bloom Size",
        Default = 24,
        Min = 0,
        Max = 56,
        Rounding = 0,
        Compact = true,
        Callback = function(v)
            Core.BloomSize = v
            if Core.BloomEnabled and Lighting:FindFirstChild("RoxyBloom") then
                Lighting.RoxyBloom.Size = v
            end
        end
    })
    WorldTab:AddSlider("BloomThresholdSlider", {
        Text = "Bloom Threshold",
        Default = 2,
        Min = 0,
        Max = 10,
        Rounding = 1,
        Compact = true,
        Callback = function(v)
            Core.BloomThreshold = v
            if Core.BloomEnabled and Lighting:FindFirstChild("RoxyBloom") then
                Lighting.RoxyBloom.Threshold = v
            end
        end
    })
    WorldTab:AddSlider("BloomIntensitySlider", {
        Text = "Bloom Intensity",
        Default = 1,
        Min = 0,
        Max = 10,
        Rounding = 1,
        Compact = true,
        Callback = function(v)
            Core.BloomIntensity = v
            if Core.BloomEnabled and Lighting:FindFirstChild("RoxyBloom") then
                Lighting.RoxyBloom.Intensity = v
            end
        end
    })
    WorldTab:AddDivider()
    local CameraTab = TabBox2:AddTab('Camera')
    CameraTab:AddToggle("ThirdPersonEnabled", {
        Text = "Toggle Third Person",
        Default = false,
        Callback = function(v)
            Core.ThirdPersonEnabled = v
            if Core.ThirdPerson then
                if Core.ThirdPerson.Active ~= v then
                    Core.ThirdPerson:Activate()
                end
            end
        end
    }):AddKeyPicker("ThirdPersonKeybind", {
        Default = "None",
        SyncToggleState = true,
        Mode = "Toggle",
        Text = "Third Person",
        NoUI = false
    })
    CameraTab:AddToggle("ThirdPersonHideChar", {
        Text = "Hide Character",
        Default = false,
        Callback = function(v)
            Core.ThirdPersonHideChar = v
        end
    })
    CameraTab:AddSlider("ThirdPersonDistance", {
        Text = "Third person distance",
        Default = 7,
        Min = 0,
        Max = 20,
        Rounding = 1,
        Callback = function(v)
            Core.ThirdPersonDistance = v
        end
    })
    CameraTab:AddSlider("ThirdPersonReplicationDelay", {
        Text = "Character Replication Delay",
        Default = 0,
        Min = 0,
        Max = 0.75,
        Rounding = 2,
        Callback = function(v)
            Core.ThirdPersonReplicationDelay = v
        end
    })
    CameraTab:AddToggle("ToggleCharacterVisuals", {
        Text = "Toggle Character Visuals",
        Default = false,
        Callback = function(v)
            Core.ToggleCharacterVisuals = v
        end
    }):AddColorPicker("ThirdPersonChamsColor", {
        Default = Color3.fromRGB(83, 132, 171),
        Title = "Third Person Chams Color",
        Callback = function(v)
            Core.ThirdPersonChamsColor = v
        end
    })
    CameraTab:AddDropdown("CharacterMaterial", {
        Values = {
            "Glass",
            "Neon",
            "ForceField",
            "Wood"
        },
        Default = "ForceField",
        Multi = false,
        Text = "Character Material",
        Callback = function(v)
            Core.CharacterMaterial = v
        end
    })
    CameraTab:AddDropdown("ForceFieldTexture", {
        Values = (function()
            local keys = {}
            for k, _ in pairs(Core.ForceFieldTextures) do
                table.insert(keys, k)
            end
            table.sort(keys)
            return keys
        end)(),
        Default = "Honeycomb",
        Multi = false,
        Text = "ForceField Texture",
        Callback = function(v)
            Core.SelectedForceFieldTexture = v
        end
    })
    local TabBox = Tabs.B:AddRightTabbox()
    local ExtraTab = TabBox:AddTab('Extra')
    local extracount = ExtraTab:AddToggle('AmmoCountToggle', {
        Text = 'Ammo Count',
        Default = false,
        Callback = function(v)
            Core.MiniUI.Enabled = v
        end
    })
    local BulletTab = TabBox:AddTab('Bullets')
    local BulletToggle = BulletTab:AddToggle('BulletTracersToggle', {
        Text = 'Bullet Tracers',
        Default = false,
        Callback = function(v)
            Core.BulletTracersEnabled = v
        end
    })
    Core.BulletTracerLink = true
    BulletTab:AddToggle('BulletTracerLink', {
        Text = 'Origin Link Connection',
        Default = true,
        Tooltip = 'Visually connects your physical Torso to the scanned offset firing position for ragebot',
        Callback = function(v)
            Core.BulletTracerLink = v
        end
    })
    BulletToggle:AddColorPicker("TracerColor", {
        Default = Color3.fromRGB(83, 132, 171),
        Title = "Tracer Color",
        Callback = function(v)
            Core.TracerColor = v
        end
    })
    BulletTab:AddSlider("TracerSize", {
        Text = "Size",
        Default = 0.1,
        Min = 0.05,
        Max = 3,
        Rounding = 2,
        Compact = true,
        Suffix = " Studs",
        Callback = function(v)
            Core.TracerSize = v
        end
    })
    BulletTab:AddSlider("TracerAnimationSpeed", {
        Text = "Animation Speed",
        Default = 3,
        Min = 0,
        Max = 10,
        Rounding = 1,
        Compact = true,
        Callback = function(v)
            Core.TracerAnimationSpeed = v
        end
    })
    BulletTab:AddSlider("TracerDuration", {
        Text = "Duration",
        Default = 3.5,
        Min = 0.1,
        Max = 3.5,
        Rounding = 1,
        Compact = true,
        Suffix = "s",
        Callback = function(v)
            Core.TracerDuration = v
        end
    })
    BulletTab:AddDropdown('TracerStyle', {
        Values = {
            '1',
            '2',
            '3',
            '4',
            '5',
            '6'
        },
        Default = '1',
        Multi = false,
        Text = 'Tracer Style',
        Callback = function(v)
            Core.TracerStyle = v
        end
    })

    Core.CrosshairLockOnTarget = false
    Core.CrosshairEnabled = false
    Core.CrosshairColor = Color3.fromRGB(255, 255, 255)
    Core.CrosshairSpin = false
    Core.CrosshairSize = 20
    Core.CrosshairSpinSpeed = 150
    Core.CrosshairThickness = 1
    Core.CrosshairGap = 2
    Core.CrosshairSides = {
        Top = true,
        Bottom = true,
        Left = true,
        Right = true
    }
    Core.CrosshairPositionMode = "Center Of Screen"
    ESP4:AddToggle('CrosshairToggle1', {
        Text = 'Toggle Crosshair',
        Default = Core.CrosshairEnabled,
        Callback = function(v)
            Core.CrosshairEnabled = v
        end
    }):AddColorPicker("CrosshairMainColor", {
        Default = Core.CrosshairColor,
        Title = "Crosshair Color",
        Callback = function(v)
            Core.CrosshairColor = v
        end
    })
    ESP4:AddToggle('CrosshairSpinToggle', {
        Text = 'Spin',
        Default = Core.CrosshairSpin,
        Callback = function(v)
            Core.CrosshairSpin = v
        end
    })
    ESP4:AddToggle('CrosshairLockOnTarget', {
        Text = 'Lock On Target',
        Tooltip = "Locks Crosshair On Aimbot/Silent Target",
        Default = false,
        Callback = function(v)
            Core.CrosshairLockOnTarget = v
        end
    })
    ESP4:AddToggle('CrosshairRemoveIGCH', {
        Text = 'No Crosshair',
        Tooltip = "Hides in-game crosshair",
        Default = false,
        Callback = function(v)
            local crosshairs = player.PlayerGui.HudScreenGui.Main.DisplayCrosshairs
            local parts = {
                crosshairs.Up,
                crosshairs.Center,
                crosshairs.Down,
                crosshairs.Left,
                crosshairs.Right,
            }
            for _, part in ipairs(parts) do
                if part then
                    part.Visible = not v
                end
            end
        end
    })
    ESP4:AddSlider("CrossHairSizeSlider", {
        Text = "Crosshair Size",
        Default = Core.CrosshairSize,
        Min = 2,
        Max = 100,
        Rounding = 0,
        Compact = true,
        Callback = function(v)
            Core.CrosshairSize = v
        end
    })
    ESP4:AddSlider("CrosshairSpinSpeed", {
        Text = "Spin Speed",
        Default = Core.CrosshairSpinSpeed,
        Min = 1,
        Max = 200,
        Rounding = 0,
        Compact = true,
        Callback = function(v)
            Core.CrosshairSpinSpeed = v
        end
    })
    ESP4:AddSlider("CrosshairThickness", {
        Text = "Crosshair Thickness",
        Default = Core.CrosshairThickness,
        Min = 1,
        Max = 10,
        Rounding = 1,
        Compact = true,
        Callback = function(v)
            Core.CrosshairThickness = v
        end
    })
    ESP4:AddSlider("CrosshairGap", {
        Text = "Crosshair Gap",
        Default = Core.CrosshairGap,
        Min = 0,
        Max = 50,
        Rounding = 0,
        Compact = true,
        Callback = function(v)
            Core.CrosshairGap = v
        end
    })
    ESP4:AddDropdown('CrosshairStyles', {
        Values = {
            '1',
            '2',
            '3',
            '4',
            '5',
            '6'
        },
        Default = '1',
        Multi = false,
        Text = 'Crosshair Style',
        Callback = function(v)
            Core.CrosshairStyle = v
        end
    })
    ESP4:AddDropdown('CrosshairScreenPosition', {
        Values = {
            'Center Of Screen',
            'Gun Barrel'
        },
        Default = "Center Of Screen",
        Multi = false,
        Text = 'Crosshair Position',
        Callback = function(v)
            Core.CrosshairPositionMode = v
        end
    })
    local SilentToggle = Silent:AddToggle("ToggleSilent", {
        Text = "Toggle Silent",
        Default = false,
        Risky = false,
        Tooltip = nil,
        Callback = function(v)
            Core.SilentEnabled = v
            if not v then
                Core.SilentHolding = false
            end
        end
    })
    SilentToggle:AddKeyPicker("AimbotToggleKeybind", {
        Default = "None",
        Mode = "Hold",
        SyncToggleState = false,
        Text = "Silent Aim",
        Callback = function()
            Core.SilentHolding = true
        end,
        ChangedCallback = function()
            Core.SilentHolding = false
        end
    })
    Silent:AddToggle("SilentStickyAimToggle", {
        Text = "Sticky Aim",
        Default = false,
        Callback = function(v)
            Core.SilentSticky = v
        end
    })
    Silent:AddToggle("SilentWallCheckToggle", {
        Text = "Wall Check",
        Default = false,
        Callback = function(v)
            Core.SilentWallCheck = v
        end
    })
    Silent:AddSlider("SilentRedirectChanceSlider", {
        Text = "Hit Chance",
        Default = 50,
        Min = 1,
        Max = 100,
        Rounding = 0,
        Compact = true,
        Suffix = "%",
        Callback = function(v)
            Core.SilentHitChance = v
        end
    })
    Silent:AddSlider("SilentHeadshotChance", {
        Text = "Headshot Chance",
        Default = 100,
        Min = 0,
        Max = 100,
        Rounding = 0,
        Compact = true,
        Suffix = "%",
        Callback = function(v)
            Core.SilentHeadshotChance = v
        end
    })
    Silent:AddSlider("SilentMaxDistanceB", {
        Text = "Max Distance",
        Default = 500,
        Min = 1,
        Max = 1000,
        Rounding = 0,
        Compact = true,
        Suffix = "stds",
        Callback = function(v)
            Core.SilentMaxDistance = v
        end
    })
    Silent:AddDropdown("SilentTypeDropdown", {
        Values = {
            "Closest To Mouse",
            "Closest To You"
        },
        Default = 1,
        Multi = false,
        Text = "Target Priority",
        Callback = function(v)
            Core.SilentPriority = v
        end
    })
    Silent:AddDivider()
    local SnapLine2 = Silent:AddToggle("SilentSnapLineToggle", {
        Text = "Snap Line",
        Default = false,
        Callback = function(v)
            Core.SilentSnapEnabled = v
        end
    })
    SnapLine2:AddColorPicker("SilentSnapLineColor", {
        Default = Color3.fromRGB(255, 255, 255),
        Title = "Line Color",
        Callback = function(v)
            Core.SilentSnapColor = v
        end
    })
    local SilentFovToggle = Silent:AddToggle("SilentToggleFOV", {
        Text = "Show FOV",
        Default = false,
        Callback = function(v)
            Core.SilentShowFOV = v
        end
    })
    Silent:AddToggle("SilentDynamicFOVToggle", {
        Text = "Dynamic FOV",
        Default = false,
        Callback = function(v)
            Core.SilentDynamicFOV = v
        end
    })
    Silent:AddToggle("SilentFOVLockOnTarget", {
        Text = "Lock On Target",
        Tooltip = "Locks FOV On Silent Target",
        Default = false,
        Callback = function(v)
            Core.SilentFOVLockOnTarget = v
        end
    })
    SilentFovToggle:AddColorPicker("SilentCore.FOVColor", {
        Default = Color3.fromRGB(255, 255, 255),
        Title = "FOV Color",
        Callback = function(v)
            Core.SilentFOVColor = v
        end
    })
    SilentFovToggle:AddColorPicker("SilentCore.FOVFillColor", {
        Default = Color3.fromRGB(83, 132, 171),
        Title = "FOV Fill Color",
        Transparency = 0.5,
        Callback = function(v)
            Core.SilentFOVFillColor = v
        end
    })
    Silent:AddSlider("SilentFOVSize1", {
        Text = "Size",
        Default = 120,
        Min = 0,
        Max = 500,
        Rounding = 0,
        Suffix = "px",
        Compact = true,
        Callback = function(v)
            Core.SilentFOVRadius = v
        end
    })
    Silent:AddDropdown("SilentSnapLineMethod", {
        Values = {
            "Gun Barrel",
            "Mouse"
        },
        Default = 1,
        Multi = false,
        Text = "Snap From",
        Callback = function(v)
            Core.SilentSnapOriginMethod = v
        end
    })
    Silent:AddDropdown("SilentFovPositionMethod", {
        Values = {
            "Gun Barrel",
            "Mouse"
        },
        Default = 1,
        Multi = false,
        Text = "Fov Position",
        Callback = function(v)
            Core.SilentFOVOriginMethod = v
        end
    })
    local Rage = Tabs.B2:AddLeftGroupbox("Rage")
    Rage:AddToggle("RageBotAutoShoot", {
        Text = "Auto Shoot",
        Tooltip = "Automatically shoots valid targets",
        Default = false,
        Callback = function(v)
            Core.RageBotAutoShoot = v
        end
    }):AddKeyPicker("RageBotAutoShootKeybind", {
        Default = "None",
        SyncToggleState = true,
        Mode = "Toggle",
        Text = "Auto Shoot",
        NoUI = false
    })
    Rage:AddToggle("RageBotFirePosScan", {
        Text = "Fire Position Scanning",
        Tooltip = "Scans fire positions around corners for valid shots",
        Default = false,
        Callback = function(v)
            Core.RageBotFirePosScan = v
        end
    })
    Rage:AddSlider("RageBotFirePosOffset", {
        Text = "Fire Position Offset",
        Default = 9,
        Min = 1,
        Max = 15.9,
        Rounding = 1,
        Suffix = " Studs",
        Compact = true,
        Callback = function(v)
            Core.RageBotFirePosOffset = v
        end
    })
    Rage:AddSlider("RageBotFirePosCount", {
        Text = "Scanning Count",
        Default = 5,
        Min = 1,
        Max = 16,
        Rounding = 0,
        Compact = true,
        Callback = function(v)
            Core.RageBotFirePosCount = v
        end
    })
    Rage:AddDropdown("RageBotFirePosMethod", {
        Values = {
            "Cardinal",
            "Spinning Cardinal",
            "Random"
        },
        Default = 3,
        Multi = false,
        Text = "Scanning Method",
        Callback = function(v)
            Core.RageBotFirePosMethod = v
        end
    })
    Rage:AddToggle("RageBotHitPosScan", {
        Text = "Hit Position Scanning",
        Tooltip = "Scans the outer edges of the enemy hitbox for valid hits",
        Default = false,
        Callback = function(v)
            Core.RageBotHitPosScan = v
        end
    })
    Rage:AddSlider("RageBotHitPosOffset", {
        Text = "Hit Position Offset",
        Default = 6,
        Min = 1,
        Max = 10,
        Rounding = 1,
        Suffix = " Studs",
        Compact = true,
        Callback = function(v)
            Core.RageBotHitPosOffset = v
        end
    })
    Rage:AddSlider("RageBotHitPosCount", {
        Text = "Scanning Count",
        Default = 5,
        Min = 1,
        Max = 16,
        Rounding = 0,
        Compact = true,
        Callback = function(v)
            Core.RageBotHitPosCount = v
        end
    })
    Rage:AddDropdown("RageBotHitPosMethod", {
        Values = {
            "Cardinal",
            "Spinning Cardinal",
            "Random"
        },
        Default = 3,
        Multi = false,
        Text = "Scanning Method",
        Callback = function(v)
            Core.RageBotHitPosMethod = v
        end
    })
    Rage:AddToggle("CollatScanningEnabled", {
        Text = "Collat Scanning",
        Default = false,
        Callback = function(v)
            Core.CollatScanningEnabled = v
        end
    })
    Rage:AddSlider("CollatScanningRadius", {
        Text = "Collat Scanning Radius",
        Default = 1,
        Min = 0.1,
        Max = 10,
        Rounding = 1,
        Compact = true,
        Callback = function(v)
            Core.CollatScanningRadius = v
        end
    })
    local AntiA = Tabs.B2:AddRightGroupbox("Anti Aim")
    AntiA:AddToggle("AntiAimEnabled", {
        Text = "Toggle Anti Aim",
        Default = false,
        Callback = function(v)
            Core.AntiAimEnabled = v
        end
    }):AddKeyPicker("AntiAimKeybind", {
        Default = "None",
        SyncToggleState = true,
        Mode = "Toggle",
        Text = "Anti Aim",
        NoUI = false
    })
    AntiA:AddToggle("AntiAimYawEnabled", {
        Text = "Yaw",
        Default = false,
        Callback = function(v)
            Core.AntiAimYawEnabled = v
        end
    })
    AntiA:AddSlider("AntiAimYawAngle", {
        Text = "Yaw Angle",
        Min = -180,
        Max = 180,
        Default = 0,
        Rounding = 0,
        Compact = true,
        Callback = function(v)
            Core.AntiAimYawAngle = v
        end
    })
    AntiA:AddSlider("AntiAimYawWaveRate", {
        Text = "Yaw Wave Rate",
        Min = 1,
        Max = 10,
        Default = 1,
        Rounding = 1,
        Compact = true,
        Callback = function(v)
            Core.AntiAimYawWaveRate = v
        end
    })
    AntiA:AddSlider("AntiAimYawWaveDegree", {
        Text = "Yaw Wave Degree",
        Min = 0,
        Max = 360,
        Default = 0,
        Rounding = 0,
        Compact = true,
        Callback = function(v)
            Core.AntiAimYawWaveDegree = v
        end
    })
    AntiA:AddDropdown("AntiAimYawType", {
        Text = "Yaw Type",
        Values = {
            "Custom",
            "Wave"
        },
        Default = "Custom",
        Callback = function(v)
            Core.AntiAimYawType = v
        end
    })
    AntiA:AddToggle("AntiAimPitchEnabled", {
        Text = "Pitch",
        Default = false,
        Callback = function(v)
            Core.AntiAimPitchEnabled = v
        end
    })
    AntiA:AddSlider("AntiAimPitchAngle", {
        Text = "Pitch Angle",
        Min = -90,
        Max = 90,
        Default = 0,
        Rounding = 0,
        Compact = true,
        Callback = function(v)
            Core.AntiAimPitchAngle = v
        end
    })
    AntiA:AddSlider("AntiAimPitchWaveRate", {
        Text = "Pitch Wave Rate",
        Min = 0,
        Max = 10,
        Default = 0,
        Rounding = 1,
        Compact = true,
        Callback = function(v)
            Core.AntiAimPitchWaveRate = v
        end
    })
    AntiA:AddDropdown("AntiAimPitchType", {
        Text = "Pitch Type",
        Values = {
            "Custom",
            "Wave"
        },
        Default = "Custom",
        Callback = function(v)
            Core.AntiAimPitchType = v
        end
    })
    AntiA:AddToggle("AntiAimSpinBotEnabled", {
        Text = "Spin Bot",
        Default = false,
        Callback = function(v)
            Core.AntiAimSpinBotEnabled = v
        end
    })
    AntiA:AddSlider("AntiAimSpinBotDegreeRate", {
        Text = "Spin Bot Degree Rate",
        Min = -1800,
        Max = 1800,
        Default = 0,
        Rounding = 0,
        Compact = true,
        Callback = function(v)
            Core.AntiAimSpinBotDegreeRate = v
        end
    })
    AntiA:AddSlider("AntiAimSpinBotWaveRate", {
        Text = "Spin Bot Wave Rate",
        Min = 0,
        Max = 10,
        Default = 0,
        Rounding = 0,
        Compact = true,
        Callback = function(v)
            Core.AntiAimSpinBotWaveRate = v
        end
    })
    AntiA:AddDropdown("AntiAimSpinBotType", {
        Text = "Spin Type",
        Values = {
            "Custom",
            "Wave"
        },
        Default = "Custom",
        Callback = function(v)
            Core.AntiAimSpinBotType = v
        end
    })
    AntiA:AddDivider()
    AntiA:AddToggle("FakeLagEnabled", {
        Text = "Fake Lag",
        Default = false,
        Callback = function(v)
            Core.FakeLagEnabled = v
        end
    })
    AntiA:AddSlider("FakeLagRefreshDistance", {
        Text = "Update Distance",
        Min = 0,
        Max = 3,
        Default = 3,
        Rounding = 1,
        Compact = true,
        Callback = function(v)
            Core.FakeLagRefreshDistance = v
        end
    })
    AntiA:AddSlider("FakeLagRefreshRate", {
        Text = "Update Interval",
        Min = 0,
        Max = 1.2,
        Default = 0.5,
        Rounding = 2,
        Compact = true,
        Callback = function(v)
            Core.FakeLagRefreshRate = v
        end
    })
    AntiA:AddToggle("FakePositionEnabled", {
        Text = "Fake Position",
        Default = false,
        Callback = function(v)
            Core.FakePositionEnabled = v
        end
    })
    AntiA:AddSlider("FakePositionRadius", {
        Text = "Fake Position Radius",
        Min = 0.1,
        Max = 8.5,
        Default = 1,
        Rounding = 1,
        Compact = true,
        Callback = function(v)
            Core.FakePositionRadius = v
        end
    })
    AntiA:AddSlider("FakePositionInterval", {
        Text = "Fake Position Interval",
        Min = 1,
        Max = 75,
        Default = 10,
        Rounding = 0,
        Compact = true,
        Callback = function(v)
            Core.FakePositionInterval = v
        end
    })

    Core.UnlocksGroup = Tabs.C:AddLeftGroupbox("Unlocks")
    Core.UnlockAllButton = Core.UnlocksGroup:AddButton({
        Text = 'Unlock All',
        Func = function()
            if Core.TriggerUnlockAll then
                Core.TriggerUnlockAll()
            end
        end,
        DoubleClick = true,
        Tooltip = 'Unlocks all weapons, knifes & attachments'
    })
    Core.UnlockAllButton:AddButton({
        Text = 'Unlock All Camos',
        Func = function()
            if Core.TriggerUnlockCamos then
                Core.TriggerUnlockCamos()
            end
        end,
        DoubleClick = true,
        Tooltip = 'Unlocks all camos for every weapon.'
    })

    local Notifications = Tabs.C:AddLeftGroupbox("Notifications")
    Notifications:AddToggle("NotifyOnSpectator", {
        Text = "Notify On Spectator",
        Default = false
    })
    Notifications:AddToggle("NotifyOnKillToggle", {
        Text = "Notify On Kill",
        Default = false,
        Callback = function(v)
            Core.NotifyOnKill = v
        end
    })
    Notifications:AddDropdown("NotifyOnKillOptions", {
        Values = {
            "Name",
            "Distance",
            "Hitpart"
        },
        Default = 1,
        Multi = true,
        Text = "Options",
        Callback = function(v)
            Core.NotifyOnKillOptions = v
        end
    })
    local SoundGroup = Tabs.C:AddRightGroupbox("Sound")
    SoundGroup:AddToggle('GunShotSound', {
        Text = 'Gunshot Sound Override',
        Default = false,
        Callback = function(v)
            Core.GunshotOverride = v
        end
    })
    SoundGroup:AddDropdown('GunShotSoundIds', {
        Values = {
            'Minecraft experience',
            'Neverlose',
            'Gamesense',
            'One',
            'Bell',
            'Rust',
            'TF2',
            'Slime',
            'Among Us',
            'Minecraft',
            'CS:GO',
            'Saber',
            'Baimware',
            'Osu',
            'TF2 Critical',
            'Bat',
            'Call of Duty',
            'Bubble',
            'Pick',
            'Pop',
            'Bruh',
            '[Bamboo]',
            'Crowbar',
            'Weeb',
            'Beep',
            'Bambi',
            'Stone',
            'Old Fatality',
            'Click',
            'Ding',
            'Snow',
            'Laser',
            'Mario',
            'Steve',
            'Snowdrake',
            'Default'
        },
        Default = "",
        Multi = false,
        Text = 'Sound Selection',
        Callback = function(v)
            Core.SelectedSound = v
        end
    })
    SoundGroup:AddSlider("SoundVolumeSlider", {
        Text = "Volume",
        Default = 1,
        Min = 0,
        Max = 10,
        Rounding = 1,
        Compact = true,
        Callback = function(v)
            Core.SoundVolume = v
        end
    })
    SoundGroup:AddToggle('HitSoundShot', {
        Text = 'Hit Sound Override',
        Default = false,
        Callback = function(v)
            Core.HitSoundOverride = v
            local playerGui = game:GetService("Players").LocalPlayer.PlayerGui
            for _, root in ipairs(playerGui:GetChildren()) do
                for _, s in ipairs(root:GetDescendants()) do
                    if s:IsA("Sound") and s.Name == "hitmarker" then
                        if v then
                            applyHitSound(s)
                        else
                            restoreHitSound(s)
                        end
                    end
                end
            end
        end
    })
    SoundGroup:AddDropdown('HitSoundShotDropdown', {
        Values = {
            "Minecraft experience",
            "Neverlose",
            "Gamesense",
            "One",
            "Bell",
            "Rust",
            "TF2",
            "Slime",
            "Among Us",
            "Minecraft",
            "CS:GO",
            "Saber",
            "Baimware",
            "Osu",
            "TF2 Critical",
            "Bat",
            "Call of Duty",
            "Bubble",
            "Pick",
            "Pop",
            "Bruh",
            "[Bamboo]",
            "Crowbar",
            "Weeb",
            "Beep",
            "Bambi",
            "Stone",
            "Old Fatality",
            "Click",
            "Ding",
            "Snow",
            "Laser",
            "Mario",
            "Steve",
            "Snowdrake",
            "Default"
        },
        Default = Core.HitSoundSelected,
        Multi = false,
        Text = 'Sound Selection',
        Callback = function(v)
            Core.HitSoundSelected = v
            if Core.HitSoundOverride then
                local playerGui = game:GetService("Players").LocalPlayer.PlayerGui
                for _, root in ipairs(playerGui:GetChildren()) do
                    for _, s in ipairs(root:GetDescendants()) do
                        if s:IsA("Sound") and s.Name == "hitmarker" then
                            applyHitSound(s)
                        end
                    end
                end
            end
        end
    })
    SoundGroup:AddSlider("HitSoundVolumeSlider", {
        Text = "Volume",
        Default = 1,
        Min = 0,
        Max = 10,
        Rounding = 1,
        Compact = true,
        Callback = function(v)
            Core.HitSoundVolume = v
            if Core.HitSoundOverride then
                local playerGui = game:GetService("Players").LocalPlayer.PlayerGui
                for _, root in ipairs(playerGui:GetChildren()) do
                    for _, s in ipairs(root:GetDescendants()) do
                        if s:IsA("Sound") and s.Name == "hitmarker" then
                            applyHitSound(s)
                        end
                    end
                end
            end
        end
    })
    SoundGroup:AddToggle('KillSoundShot', {
        Text = 'Kill Sound Override',
        Default = false,
        Callback = function(v)
            Core.KillSoundOverride = v
            local playerGui = game:GetService("Players").LocalPlayer.PlayerGui
            for _, root in ipairs(playerGui:GetChildren()) do
                for _, s in ipairs(root:GetDescendants()) do
                    if s:IsA("Sound") and (s.Name == "killshot" or s.Name == "headshotkill") then
                        if v then
                            applyKillSound(s)
                        else
                            restoreKillSound(s)
                        end
                    end
                end
            end
        end
    })
    SoundGroup:AddDropdown('KillSoundShotDropdown', {
        Values = {
            "Minecraft experience",
            "Neverlose",
            "Gamesense",
            "One",
            "Bell",
            "Rust",
            "TF2",
            "Slime",
            "Among Us",
            "Minecraft",
            "CS:GO",
            "Saber",
            "Baimware",
            "Osu",
            "TF2 Critical",
            "Bat",
            "Call of Duty",
            "Bubble",
            "Pick",
            "Pop",
            "Bruh",
            "[Bamboo]",
            "Crowbar",
            "Weeb",
            "Beep",
            "Bambi",
            "Stone",
            "Old Fatality",
            "Click",
            "Ding",
            "Snow",
            "Laser",
            "Mario",
            "Steve",
            "Snowdrake",
            "Default"
        },
        Default = Core.KillSoundSelected or "Default",
        Multi = false,
        Text = 'Sound Selection',
        Callback = function(v)
            Core.KillSoundSelected = v
            if Core.KillSoundOverride then
                local playerGui = game:GetService("Players").LocalPlayer.PlayerGui
                for _, root in ipairs(playerGui:GetChildren()) do
                    for _, s in ipairs(root:GetDescendants()) do
                        if s:IsA("Sound") and (s.Name == "killshot" or s.Name == "headshotkill") then
                            applyKillSound(s)
                        end
                    end
                end
            end
        end
    })
    SoundGroup:AddSlider("KillSoundVolumeSlider", {
        Text = "Volume",
        Default = 1,
        Min = 0,
        Max = 10,
        Rounding = 1,
        Compact = true,
        Callback = function(v)
            Core.KillSoundVolume = v
            if Core.KillSoundOverride then
                local playerGui = game:GetService("Players").LocalPlayer.PlayerGui
                for _, root in ipairs(playerGui:GetChildren()) do
                    for _, s in ipairs(root:GetDescendants()) do
                        if s:IsA("Sound") and (s.Name == "killshot" or s.Name == "headshotkill") then
                            applyKillSound(s)
                        end
                    end
                end
            end
        end
    })
    game:GetService("Players").LocalPlayer.PlayerGui.DescendantAdded:Connect(function(c)
        if c:IsA("Sound") then
            if c.Name == "hitmarker" and Core.HitSoundOverride then
                applyHitSound(c)
            elseif (c.Name == "killshot" or c.Name == "headshotkill") and Core.KillSoundOverride then
                applyKillSound(c)
            end
        end
    end)
    game:GetService("Players").LocalPlayer.PlayerGui.HudScreenGui.Main.DisplayNotifications.ChildAdded:Connect(function(child)
        if child.Name == "DisplayBigAward" and Toggles.NotifyOnSpectator.Value then
            local enemy = child:WaitForChild("TextEnemy", 1)
            if enemy then
                local isAward = false
                local conns = {}
                local function chk(txt)
                    local t = string.lower(txt)
                    if string.find(t, "secured") or string.find(t, "picked") or string.find(t, "friend") then
                        isAward = true
                    end
                end
                local function hk(v)
                    if v:IsA("TextLabel") and v ~= enemy then
                        chk(v.Text)
                        table.insert(conns, v:GetPropertyChangedSignal("Text"):Connect(function()
                            chk(v.Text)
                        end))
                    end
                end
                for _, v in ipairs(child:GetDescendants()) do
                    hk(v)
                end
                table.insert(conns, child.DescendantAdded:Connect(hk))
                
                local name = enemy.Text
                if name == "" then
                    local start = tick()
                    repeat
                        task.wait()
                        name = enemy.Text
                    until name ~= "" or tick() - start > 1
                end
                
                if not isAward then
                    local ew = tick()
                    repeat
                        task.wait()
                    until isAward or tick() - ew > 0.25
                end
                for _, c in ipairs(conns) do
                    c:Disconnect()
                end
                if isAward then
                    return
                end
                if name ~= "" then
                    Library:Notify(name .. " Is Now Spectating", 3)
                    task.delay(3, function()
                        Library:Notify(name .. " Is No Longer Spectating", 3)
                    end)
                end
            end
        end
    end)
    task.spawn(function()
        local killfeedContainer = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("HudScreenGui"):WaitForChild("Main"):WaitForChild("DisplayKillfeed"):WaitForChild("Container")
        killfeedContainer.ChildAdded:Connect(function(child)
            if not Core.NotifyOnKill then
                return
            end
            if child.Name ~= "DisplayKillfeedLine" then
                return
            end
            task.spawn(function()
                local textKillfeed = child:WaitForChild("TextKillfeed", 0.5)
                if not textKillfeed then
                    return
                end
                local t = tick()
                repeat
                    task.wait()
                until textKillfeed.Text ~= "Label" and textKillfeed.Text ~= "" or tick() - t > 0.5
                local textDistance = textKillfeed:FindFirstChild("TextDistance")
                local killer, victim
                for v in textKillfeed.Text:gmatch(">([^<]+)</font>") do
                    if not killer then
                        killer = v
                    end
                    victim = v
                end
                if killer ~= game:GetService("Players").LocalPlayer.Name then
                    return
                end
                if killer == victim then
                    return
                end
                local opts = Core.NotifyOnKillOptions or {}
                local msg = "Killed"
                if opts["Name"] and victim then
                    msg = msg .. " " .. victim
                else
                    if opts["Distance"] and not opts["Hitpart"] then
                        msg = msg .. " player"
                    else
                        msg = msg .. " Player"
                    end
                end
                if opts["Distance"] and textDistance then
                    local distStr = textDistance.Text:match("([%d%.]+)") or "0"
                    msg = msg .. " from " .. distStr .. " studs away"
                end
                if opts["Hitpart"] then
                    local imgHead = child:FindFirstChild("ImageHeadshot")
                    local isHead = imgHead and imgHead.Visible
                    msg = msg .. " [" .. (isHead and "Head" or "Body") .. "]"
                end
                Library:Notify(msg, 3)
            end)
        end)
    end)
    local Ts = game:GetService("TweenService")
    local fadeInfo = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local isMiniAmmoVisible = false
    RunService.RenderStepped:Connect(function()
        if not extracount.Value then
            Core.MiniUI.Enabled = false
            isMiniAmmoVisible = false
            for _, v in ipairs(Core.MiniOuterBorder:GetDescendants()) do
                if v:IsA("Frame") then
                    v.BackgroundTransparency = 1
                end
                if v:IsA("TextLabel") then
                    v.TextTransparency = 1;
                    v.TextStrokeTransparency = 1
                end
            end
            Core.MiniOuterBorder.BackgroundTransparency = 1
            return
        end
        local magText = Hud.TextMagCount.Text
        local spareText = Hud.TextSpareCount.Text
        local currentAmmo = tonumber(magText) or 0
        local spareAmmo = tonumber(spareText) or 0
        local isHudVisible = false
        if Hud.TextMagCount and Hud.TextMagCount.Visible and Hud.TextMagCount.Parent and Hud.TextMagCount.Parent.Visible then
            isHudVisible = true
        end
        local hasAmmo = (currentAmmo ~= 0 or spareAmmo ~= 0)
        if hasAmmo and isHudVisible then
            Core.AmmoLabel.Text = currentAmmo .. " / " .. spareAmmo
            Core.MiniAccentLine.BackgroundColor3 = Library.AccentColor
            if not isMiniAmmoVisible then
                isMiniAmmoVisible = true
                Core.MiniUI.Enabled = true
                Ts:Create(Core.MiniOuterBorder, fadeInfo, {
                    BackgroundTransparency = 0
                }):Play()
                for _, v in ipairs(Core.MiniOuterBorder:GetDescendants()) do
                    if v:IsA("Frame") then
                        if v.Name ~= "Background" then 
                            Ts:Create(v, fadeInfo, {
                                BackgroundTransparency = 0
                            }):Play()
                        else
                            Ts:Create(v, fadeInfo, {
                                BackgroundTransparency = 0
                            }):Play()
                        end
                    elseif v:IsA("TextLabel") then
                        Ts:Create(v, fadeInfo, {
                            TextTransparency = 0,
                            TextStrokeTransparency = 0
                        }):Play()
                    end
                end
            end
        else
            if isMiniAmmoVisible then
                isMiniAmmoVisible = false
                Ts:Create(Core.MiniOuterBorder, fadeInfo, {
                    BackgroundTransparency = 1
                }):Play()
                for _, v in ipairs(Core.MiniOuterBorder:GetDescendants()) do
                    if v:IsA("Frame") then
                        Ts:Create(v, fadeInfo, {
                            BackgroundTransparency = 1
                        }):Play()
                    elseif v:IsA("TextLabel") then
                        Ts:Create(v, fadeInfo, {
                            TextTransparency = 1,
                            TextStrokeTransparency = 1
                        }):Play()
                    end
                end
            end
        end
    end)
    pcall(function()
        workspace.StreamingEnabled = false
    end)
    Library:SetWatermarkVisibility(true)
    local FrameTimer = tick()
    local FrameCounter = 0
    local FPS = 60
    local GetPing = (function()
        return math.floor(game:GetService('Stats').Network.ServerStatsItem['Data Ping']:GetValue())
    end)
    local CanDoPing = pcall(function()
        return GetPing()
    end)
    local WatermarkConnection = RunService.RenderStepped:Connect(function()
        FrameCounter += 1
        if (tick() - FrameTimer) >= 1 then
            FPS = FrameCounter
            FrameTimer = tick()
            FrameCounter = 0
        end
        if CanDoPing then
            Library:SetWatermark(('roxy.win / dev | %d fps | %d ms'):format(math.floor(FPS), GetPing()))
        else
            Library:SetWatermark(('roxy.win | %d fps'):format(math.floor(FPS)))
        end
    end)
    Library:OnUnload(function()
        Core.AimbotEnabled = false
        Core.ShowFOV = false
        Core.ChamsEnabled = false
        Core.BoxESPEnabled = false
        Core.CrosshairEnabled = false
        Core.GunshotOverride = false
        Core.KillSoundOverride = false
        Core.HitSoundOverride = false
        Core.SkyboxEnabled = false
        Core.NameESPEnabled = false
        Core.DistanceESPEnabled = false
        Core.WeaponESPEnabled = false
        Core.ViewModelEnabled = false
        Core.WeaponMasterEnabled = false
        Core.HealthESPEnabled = false
        Core.SnapEnabled = false
        Core.KillNotifyEnabled = false
        Core.WalkSpeedEnabled = false
        Core.MasterEnabled = false
        Core.HighlightEnabled = false
        Core.SilentEnabled = false
        Lighting.Ambient = Core.OriginalValues.Ambient
        if Core.OriginalClockTime then
            Lighting.ClockTime = Core.OriginalClockTime
        end
        local sky = Lighting:FindFirstChildOfClass("Sky")
        if sky then
            sky:Destroy()
        end
        local origSky = Lighting:FindFirstChild("OriginalSkyBackup")
        if origSky then
            origSky:Clone().Parent = Lighting
        end
        local hum = findHumanoid()
        if hum then
            hum.WalkSpeed = 16
        end
        restoreHideArms()
        restoreArmMaterial()
        restoreWeaponMaterial()
        SetSleeveSlotsTransparency(0)
        for s, old in pairs(Core.HitSoundBackup) do
            if s and s:IsDescendantOf(game) then
                s.SoundId = old.Id
                s.Volume = old.Volume
            end
        end
        for s, old in pairs(Core.KillSoundBackup) do
            if s and s:IsDescendantOf(game) then
                s.SoundId = old.Id
                s.Volume = old.Volume
            end
        end
        for s, old in pairs(Core.SoundBackup) do
            if s and s:IsDescendantOf(game) then
                s.SoundId = old.Id
                s.Volume = old.Volume
            end
        end
        if Core.MiniUI then
            Core.MiniUI:Destroy()
        end
        for _, h in pairs(Core.ArmHighlights) do
            pcall(function()
                h:Destroy()
            end)
        end
        for _, h in pairs(Core.WeaponHighlights) do
            pcall(function()
                h:Destroy()
            end)
        end
        for m, _ in pairs(Core.ActiveChams) do
            clearChams(m)
        end
        pcall(function()
            for _, v in pairs(Core.DistanceDrawings) do
                v:Remove()
            end
            for _, v in pairs(Core.WeaponDrawings) do
                v:Remove()
            end
            for _, v in pairs(Core.NameDrawings) do
                v:Remove()
            end
            for _, boxes in pairs(Core.BoxDrawings) do
                for _, l in ipairs(boxes) do
                    l:Remove()
                end
            end
            for _, outlines in pairs(Core.BoxOutlineDrawings) do
                for _, l in ipairs(outlines) do
                    l:Remove()
                end
            end
            for _, v in pairs(Core.HealthDrawings) do
                v:Remove()
            end
            for _, v in pairs(Core.HealthOutlineDrawings) do
                v:Remove()
            end
            for i = 1, 4 do
                lines[i]:Remove()
                outlines[i]:Remove()
                flapLines[i]:Remove()
                flapOutlines[i]:Remove()
            end
            for i = 1, 6 do
                starLines[i]:Remove()
                starOutlines[i]:Remove()
            end
            if dot then
                dot:Remove()
            end
            if dotOutline then
                dotOutline:Remove()
            end
            if SnapLine then
                SnapLine:Remove()
            end
            if SnapOutline then
                SnapOutline:Remove()
            end
            if FOVCircle then
                FOVCircle:Remove()
            end
            if FOVOutline then
                FOVOutline:Remove()
            end
            if SilentSnapLine then
                SilentSnapLine:Remove()
            end
            if SilentSnapOutline then
                SilentSnapOutline:Remove()
            end
            if SilentFOVCircle then
                SilentFOVCircle:Remove()
            end
            if SilentFOVOutline then
                SilentFOVOutline:Remove()
            end
        end)
        WatermarkConnection:Disconnect()
        Library.Unloaded = true
    end)
    local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')
    MenuGroup:AddToggle("KeybindMenuOpen", {
        Default = Library.KeybindFrame.Visible,
        Text = "Open Keybind Menu",
        Callback = function(v)
            Library.KeybindFrame.Visible = v
        end
    })
    MenuGroup:AddToggle("ShowCustomCursor", {
        Text = "Custom Cursor",
        Default = false,
        Callback = function(v)
            Library.ShowCustomCursor = v
        end
    })

    MenuGroup:AddToggle("HideLogo", {
        Text = "Hide Logo",
        Default = false,
        Callback = function(v)
            Library.HideImages = v
            if Library.BackgroundImage then
                Library.BackgroundImage.Visible = not v
            end
        end
    })
    MenuGroup:AddDivider()
    MenuGroup:AddLabel("Menu bind"):AddKeyPicker("MenuKeybind", {
        Default = "RightShift",
        NoUI = true,
        Text = "Menu keybind"
    })
    MenuGroup:AddButton("Unload", function()
        Library:Unload()
    end)
    MenuGroup:AddDropdown("NotificationPosition", {
        Values = {
            "Left",
            "Right",
            "Bottom"
        },
        Default = "Bottom",
        Multi = false,
        Text = "Notification Position",
        Callback = function(v)
            Library.NotifySide = v
        end
    })
    local text = "you're a customer.."
    local label = MenuGroup:AddLabel("")
    label.RichText = true
    task.spawn(function()
        while true do
            local color = string.format("rgb(%d,%d,%d)", Library.AccentColor.R * 255, Library.AccentColor.G * 255, Library.AccentColor.B * 255)
            for i = 1, #text do
                label:SetText('<font color="' .. color .. '">' .. text:sub(1, i) .. '</font>')
                task.wait(0.05)
            end
            task.wait(0.3)
            for i = #text - 1, 0, -1 do
                label:SetText('<font color="' .. color .. '">' .. text:sub(1, i) .. '</font>')
                task.wait(0.05)
            end
            task.wait(0.1)
        end
    end)
    local baseTitle = "                                                                                       "
    local current = "roxy.win"
    local flickerChar = "$$"
    task.spawn(function()
        local visible = true
        while true do
            local accent = Library.AccentColor
            local color = visible and "FFFFFF" or string.format("%02X%02X%02X", accent.R * 255, accent.G * 255, accent.B * 255)
            local left = '<font color="#' .. color .. '">$$</font>'
            local right = '<font color="#' .. color .. '">$$</font>'
            Window:SetWindowTitle(baseTitle .. left .. " " .. current .. " " .. right)
            visible = not visible
            task.wait(0.5)
        end
    end)
    Library.ToggleKeybind = Options.MenuKeybind
    ThemeManager:SetLibrary(Library)
    SaveManager:SetLibrary(Library)
    SaveManager:IgnoreThemeSettings()
    SaveManager:SetIgnoreIndexes({
        'MenuKeybind'
    })
    ThemeManager:SetFolder('Roxy.win')
    SaveManager:SetFolder('Roxy.win/Phantom-Forces')
    SaveManager:SetSubFolder('specific-place')
    SaveManager:BuildConfigSection(Tabs['UI Settings'])
    ThemeManager:ApplyToTab(Tabs['UI Settings'])
    SaveManager:LoadAutoloadConfig()
    task.spawn(function()
        local modules
        for _, require in getgc(false) do
            if (
                            type(require) == 'function'
                            and islclosure(require)
                            and debug.getinfo(require).name == 'require'
                            and string.find(debug.getinfo(require).source, 'ClientLoader')
                        ) then
                modules = {};
                for name, cache in debug.getupvalue(require, 1)._cache do
                    modules[name] = cache.module;
                    print(name)
                end;
                break;
            end;
        end;
        local network = modules.NetworkClient
        local cframeLib = modules.CFrameLib
        local recoil = modules.RecoilSprings
        local cameraObject = modules.MainCameraObject
        local firearmObject = modules.FirearmObject
        local contentInterface = modules.ContentInterface
        local charInterface = modules.CharacterInterface
        local weaponInterface = modules.WeaponControllerInterface
        local bulletObject = modules.BulletObject
        local publicSettings = modules.PublicSettings
        local replicationInterface = modules.ReplicationInterface
        local screenCull = modules.ScreenCull
        local thirdPersonObject = modules.ThirdPersonObject
        local bulletCheck = modules.BulletCheck
        local effects = modules.Effects
        local charObject = modules.CharacterObject
        local audioSystem = modules.AudioSystem
        local crosshairsInterface = modules.HudCrosshairsInterface
        local replicationObject = modules.ReplicationObject
        local activeLoadoutUtils = modules.ActiveLoadoutUtils
        local playerDataClientInterface = modules.PlayerDataClientInterface
        Core.Storage = {}
        Core.TriggerUnlockAll = function()
            Core.UnlockAll, Core.UnlockKnives, Core.UnlockAttachments = true, true, true
            local pData = modules.PlayerDataClientInterface.getPlayerData()
            if pData then
                pData.unlockAll = true
                local cData = modules.PlayerDataUtils.getClassData(pData)
                if cData then
                    for _, cl in ipairs({
                        "Assault",
                        "Scout",
                        "Support",
                        "Recon"
                    }) do
                        local pri = cData[cl].Primary.Name
                        local sec = cData[cl].Secondary.Name
                        Core.FakeWeapons[cl] = {
                            pri,
                            sec
                        }
                        Core.RealWeapons[cl] = {
                            pri,
                            sec
                        }
                    end
                end
            end
        end
        Core.TriggerUnlockCamos = function()
            Core.UnlockCamos = true
            if not Core.camoDatabase then
                for _, v in ipairs(getgc(true)) do
                    if type(v) == "table" and rawget(v, "Mentha Spicata") and rawget(v, "Dove blue") then
                        Core.camoDatabase = v
                        break
                    end
                end
            end
            if Core.camoDatabase then
                local pData = modules.PlayerDataClientInterface.getPlayerData()
                if pData then
                    for cName, cData in pairs(Core.camoDatabase) do
                        if cData.Case then
                            modules.PlayerDataUtils.getCasePacketData(pData, cData.Case, true).Skins[cName] = {
                                ALL = true
                            }
                        end
                    end
                end
            end
        end
        local ThirdPerson = {
            Active = false;
            ThirdPersonObject = nil
        }
        do
            local newReplicationObject = replicationObject.new;
            local FakePlayer = Instance.new('Player');
            FakePlayer.Name = LocalPlayer.Name;
            debug.setupvalue(newReplicationObject, 3, FakePlayer);
            Core.ThirdPersonEnabled = false
            Core.ThirdPersonDistance = 7
            Core.ThirdPersonMode = 'Interpolation'
            Core.ThirdPersonReplicationDelay = 0
            function ThirdPerson:Init()
                if self.Initializing then
                    return
                end
                self.Initializing = true
                local oldFakePlayer = debug.getupvalue(newReplicationObject, 3);
                debug.setupvalue(newReplicationObject, 3, FakePlayer);
                local Entry
                for i = 1, 10 do
                    Entry = replicationInterface.getEntry(LocalPlayer)
                    if Entry then
                        break
                    end
                    if not replicationInterface.getEntry(LocalPlayer) then
                        replicationInterface.addEntry(LocalPlayer)
                    end
                    task.wait(0.1)
                end
                if not Entry then
                    warn("roxy.win / failed to get local player entry for third person")
                    self.Initializing = false
                    return
                end
                local Loadout = self:GetLoadout();
                Entry:spawn(Vector3.zero, Loadout);
                debug.setupvalue(newReplicationObject, 3, oldFakePlayer);
                local SmoothReplicator = Entry._smoothReplication;
                local setCharacterRender = Entry._thirdPersonObject.setCharacterRender
                Entry._thirdPersonObject.setCharacterRender = function(self, Visible)
                    if Core.ThirdPersonEnabled then
                        Visible = not Core.ThirdPersonHideChar;
                    end
                    return setCharacterRender(self, Visible);
                end;
                if self.Active then
                    Entry._thirdPersonObject:setCharacterRender(not Core.ThirdPersonHideChar)
                end
                local PositionSpring = Entry._posspring;
                local AngleSpring = Entry._lookangles;
                if self.Replication then
                    self.Replication:Disconnect()
                end
                local ThirdPersonReplication = RunService.Stepped:Connect(function()
                    local CharacterObject = charInterface.getCharacterObject()
                    if not CharacterObject then
                        return
                    end;
                    local ThirdPersonObject = Entry:getThirdPersonObject();
                    if not ThirdPersonObject then
                        return
                    end;
                    rawset(self, 'ThirdPersonObject', ThirdPersonObject);
                    Entry:step(true, 3);
                    local Stance = CharacterObject:getMovementMode();
                    ThirdPersonObject:setStance(self.Active and Stance:lower() or 'prone');
                    if (not charInterface.isAlive()) and ThirdPersonObject._characterModel then
                        pcall(function()
                            ThirdPersonObject._characterModel:PivotTo(CFrame.new(0, -500, 0))
                        end)
                        return
                    end
                    local Position, Angles = Core.Storage.Repupdate, Core.Storage.LookAngles;
                    if Position and Angles then
                        Position = Position + (not self.Active and Vector3.new(0, -250, 0) or Vector3.zero);
                        local function processReplication()
                            setidentity(2);
                            SmoothReplicator:receive(os.clock(), tick(), {
                                breakcount = 0;
                                position = Position;
                                velocity = Vector3.zero;
                                angles = Angles;
                                t = tick();
                            }, true);
                            Entry:step(3, true);
                            setidentity(8);
                        end;
                        if Core.ThirdPersonReplicationDelay and Core.ThirdPersonReplicationDelay ~= 0 then
                            task.delay(Core.ThirdPersonReplicationDelay, processReplication);
                        else
                            processReplication();
                        end;
                    end;
                end);
                ThirdPerson.Replication = ThirdPersonReplication;
                self.Initializing = false
                self.Initialized = true
            end;
            local CharacterObjectDespawn = charInterface.despawn;
            function charInterface.despawn()
                setidentity(8)
                if ThirdPerson.Replication and ThirdPerson.ThirdPersonObject then
                    if ThirdPerson.ThirdPersonObject._characterModel then
                        pcall(function()
                            ThirdPerson.ThirdPersonObject._characterModel:PivotTo(CFrame.new(0, -500, 0))
                        end)
                    end
                    ThirdPerson.Replication:Disconnect();
                    ThirdPerson.ThirdPersonObject._replicationObject:despawn();
                    ThirdPerson.Replication = nil;
                    ThirdPerson.ThirdPersonObject = nil;
                end;
                setidentity(2);
                return CharacterObjectDespawn();
            end;
            function ThirdPerson:GetLoadout()
                return activeLoadoutUtils.getActiveLoadoutData(playerDataClientInterface.getPlayerData());
            end;
            function ThirdPerson:Activate()
                self.Active = not self.Active;
                Core.ThirdPersonEnabled = self.Active
                -- if Options.ThirdPersonEnabled then
                --     Options.ThirdPersonEnabled:SetValue(self.Active)
                -- end
                if self.Active and not self.Initialized then
                    task.spawn(function()
                        self:Init()
                    end)
                end
                if self.ThirdPersonObject then
                    self.ThirdPersonObject:setCharacterRender(self.Active and not Core.ThirdPersonHideChar)
                end
            end;
            Core.ThirdPerson = ThirdPerson
        end;
        Core.SilentRE = replicationInterface
        if network and cframeLib and recoil and cameraObject and firearmObject and contentInterface and charInterface and weaponInterface and bulletObject and replicationInterface and publicSettings and bulletCheck then
            Core.activeWeaponInterface = weaponInterface
            Core.charInterface = charInterface
            Core.publicSettings = publicSettings
            Core.bulletCheck = bulletCheck
            Core.networkClient = network
            Core.effects = effects
            Core.audioSystem = audioSystem
            Core.crosshairsInterface = crosshairsInterface
            local setBaseWalkSpeed = charObject.setBaseWalkSpeed
            function charObject:setBaseWalkSpeed(speed)
                Core.newSpawnCache.walkSpeed = Core.newSpawnCache.walkSpeed or speed
                return setBaseWalkSpeed(self, Core.WalkSpeedEnabled and Core.TARGET_WALKSPEED or speed)
            end
            local CFIdentity = CFrame.identity
            RunService.RenderStepped:Connect(function()
                if Options.ThirdPersonEnabled and Options.ThirdPersonEnabled.Value then
                    return
                end
                local activeInterface = Core.activeWeaponInterface
                local controller = activeInterface and activeInterface.getActiveWeaponController()
                if not controller then
                    return
                end
                local weapon = controller:getActiveWeapon()
                if not weapon or not weapon._mainOffset then
                    return
                end
                local name = weapon.weaponName or "Unknown"
                local original = Core.OriginalOffsets[name]
                if not original then
                    original = weapon._mainOffset
                    Core.OriginalOffsets[name] = original
                end
                local target = original
                if Core.ViewmodelOffsetEnabled then
                    if not (Core.ViewmodelOffsetRemoveOnAim and weapon._aiming) then
                        target = original * (Core.ViewmodelOffsetCFrame or CFIdentity)
                    end
                end
                local current = weapon._mainOffset
                local posDiff = (current.p - target.p).Magnitude
                if posDiff > 0.001 then
                    weapon._mainOffset = current:Lerp(target, 0.1)
                elseif posDiff > 0 then
                    weapon._mainOffset = target
                end
            end)
            RunService.Stepped:Connect(function()
                local clockTime = os.clock()
                replicationInterface.operateOnAllEntries(function(player, entry)
                    if entry._isEnemy then
                        local tpObj = rawget(entry, "_thirdPersonObject")
                        local character = tpObj and rawget(tpObj, "_characterModelHash")
                        Core.movementCache.position[player] = Core.movementCache.position[player] or {}
                        if character and character.Head then
                            table.insert(Core.movementCache.position[player], 1, character.Head.Position)
                            table.remove(Core.movementCache.position[player], 16)
                        end
                    end
                end)
                table.insert(Core.movementCache.time, 1, clockTime)
                table.remove(Core.movementCache.time, 16)
            end)
            local offsetsB1 = table.create(16)
            local offsetsB2 = table.create(16)
            local function getPositionOffsets(origin, target, offset, method, count, buffer)
                buffer[1] = origin
                if offset and count and count > 1 then
                    local methodType = method or "Spinning Cardinal"
                    local angleOffset = 0
                    if methodType == "Spinning Cardinal" then
                        angleOffset = (os.clock() * 3) % (math.pi * 2)
                    elseif methodType == "Random" then
                        angleOffset = math.rad(math.random(1, 360))
                    elseif methodType == "Cardinal" then
                        angleOffset = 0
                    end
                    local cframe = CFrame.new(origin, target) * CFrame.Angles(0, 0, angleOffset)
                    local iters = count - 1
                    for i = 1, iters do
                        local ang = (math.pi * 2 / iters) * i
                        buffer[i + 1] = cframe * (Vector3.new(math.cos(ang), math.sin(ang), 0) * offset)
                    end
                    return count
                end
                return 1
            end
            local cBuf = {}
            local cCount = 0
            local tBuf = {}
            local sBuf = {}
            local function sortDist(a, b)
                if a and b and a.dist and b.dist then
                    return a.dist < b.dist
                end
                return false
            end
            local function getClosestPlayers(position)
                cCount = 0
                Core.SilentRE.operateOnAllEntries(function(player, entry)
                    local tpObj = rawget(entry, "_thirdPersonObject")
                    local character = tpObj and rawget(tpObj, "_characterModelHash")
                    if entry._receivedPosition and entry._velspring and entry._velspring.t and character and entry._isEnemy and character.Head then
                        local charModel = tpObj.getCharacterModel and tpObj:getCharacterModel()
                        if charModel then
                            if not checkEnemyByModel(charModel) then
                                return
                            end
                        else
                            local torso = character["Torso"] or character["torso"]
                            if LocalTeam and torso then
                                local c = torso.Color
                                local isActuallyEnemy = (LocalTeam == "PHANTOMS" and c == Core.BODY_COLOR.GHOSTS)
                                    or (LocalTeam == "GHOSTS" and c == Core.BODY_COLOR.PHANTOMS)
                                if not isActuallyEnemy then
                                    return
                                end
                            elseif LocalTeam then
                                return
                            end
                        end
                        local dist = (character.Head.Position - position).Magnitude
                        cCount = cCount + 1
                        local item = cBuf[cCount]
                        if not item then
                            item = {}
                            cBuf[cCount] = item
                        end
                        item.entry = entry
                        item.dist = dist
                    end
                end)
                if cCount == 0 then
                    return nil
                end
                table.clear(sBuf)
                for i = 1, cCount do
                    sBuf[i] = cBuf[i]
                end
                table.sort(sBuf, sortDist)
                table.clear(tBuf)
                for i = 1, math.min(cCount, 5) do
                    tBuf[i] = sBuf[i]
                end
                return tBuf
            end
            local raycastStep = 0.03333333333333333
            local function scanPositions(origin, target, accel, speed, penetration, closestPlayers, playerIndex, collatRadius)
                local oCount = getPositionOffsets(origin, target, Core.RageBotFirePosScan and Core.RageBotFirePosOffset, Core.RageBotFirePosMethod, Core.RageBotFirePosCount or 5, offsetsB1)
                local tCount = getPositionOffsets(target, origin, Core.RageBotHitPosScan and Core.RageBotHitPosOffset, Core.RageBotHitPosMethod, Core.RageBotHitPosCount or 5, offsetsB2)
                local bestScore = -1
                local bOrigin, bTarget, bVel, bHitTime
                local validCount = 0
                for oIdx = oCount, 1, -1 do
                    local newOrigin = offsetsB1[oIdx]
                    for tIdx = tCount, 1, -1 do
                        if oIdx ~= 1 and tIdx ~= 1 and oIdx ~= tIdx and (oIdx + tIdx) % 11 ~= 0 then
                            continue
                        end
                        local newTarget = offsetsB2[tIdx]
                        local velocity, hitTime = Core.complexTrajectory(newOrigin, accel, newTarget, speed)
                        if velocity and Core.bulletCheck(newOrigin, newTarget, velocity, accel, penetration, raycastStep) then
                            local score = oIdx
                            if closestPlayers and collatRadius then
                                for cIdx = playerIndex + 1, #closestPlayers do
                                    local cEntry = closestPlayers[cIdx].entry
                                    if cEntry and cEntry._receivedPosition then
                                        local dist = (cEntry._receivedPosition - newTarget).Magnitude
                                        if dist <= collatRadius then
                                            local cVelocity = Core.complexTrajectory(newOrigin, accel, cEntry._receivedPosition, speed)
                                            if cVelocity and Core.bulletCheck(newOrigin, cEntry._receivedPosition, cVelocity, accel, penetration, raycastStep) then
                                                score = score + 100
                                            end
                                        end
                                    end
                                end
                            end
                            if score >= bestScore then
                                bestScore = score
                                bOrigin = newOrigin
                                bTarget = newTarget
                                bVel = velocity
                                bHitTime = hitTime
                                if score >= 100 then
                                    return bOrigin, bTarget, bVel, bHitTime
                                end
                            end
                            validCount = validCount + 1
                            if validCount >= 3 then
                                return bOrigin, bTarget, bVel, bHitTime
                            end
                        end
                    end
                end
                if bOrigin then
                    return bOrigin, bTarget, bVel, bHitTime
                end
                return false
            end
            local newFrameTime, frameAcceleration, physicsignore, raycast, simulateBullet, drawTracer, drawSegment
            local nextShot = 0
            local nextScan = 0
            local ticket = 0
            local ticketAddition = 0
            local currentScanIndex = 1
            RunService.Heartbeat:Connect(function()
                local clockTime = os.clock()
                local newSpawnCache = Core.newSpawnCache
                local activeInterface = Core.activeWeaponInterface
                local controller = activeInterface and activeInterface.getActiveWeaponController()
                local weapon = controller and controller:getActiveWeapon()
                if Core.RageBotAutoShoot and clockTime > nextShot and clockTime > nextScan and weapon and weapon._weaponData and newSpawnCache.lastUpdate then
                    local origin = newSpawnCache.lastUpdate
                    local closestPlayers = getClosestPlayers(origin)
                    local data = weapon._weaponData
                    local penetration = data.penetrationdepth
                    local speed = data.bulletspeed
                    if closestPlayers and penetration and speed and (weapon._magCount > 0 or weapon._spareCount > 0) then
                        local shotFired = false
                        local totalPlayers = #closestPlayers
                        if currentScanIndex > totalPlayers then
                            currentScanIndex = 1
                        end
                        local playersChecked = 0
                        local maxChecksPerFrame = math.max(1, math.floor(800 / ((Core.RageBotFirePosCount or 5) * (Core.RageBotHitPosCount or 5))))
                        while playersChecked < maxChecksPerFrame and playersChecked < totalPlayers do
                            local playerIndex = currentScanIndex
                            local entryData = closestPlayers[playerIndex]
                            local entry = entryData.entry
                            local colRadius = Core.CollatScanningEnabled and (Core.CollatScanningRadius or 1) or nil
                            local newOrigin, newTarget, velocity, hitTime = scanPositions(origin, entry._receivedPosition, Core.publicSettings.bulletAcceleration, speed, penetration, closestPlayers, playerIndex, colRadius)
                            if newOrigin then
                                shotFired = true
                                if weapon._magCount < 1 then
                                    if weapon._spareCount >= data.magsize then
                                        weapon._magCount = data.magsize
                                        weapon._spareCount = weapon._spareCount - weapon._magCount
                                    else
                                        weapon._magCount = weapon._spareCount
                                        weapon._spareCount = 0
                                    end
                                    Core.networkClient.send(Core.networkClient, "reload")
                                end
                                local bullets = {}
                                local bulletData = {
                                    camerapos = origin,
                                    firepos = newOrigin,
                                    bullets = bullets
                                }
                                for _ = 1, data.pelletcount or 1 do
                                    table.insert(bullets, {
                                        velocity.Unit,
                                        ticket + ticketAddition
                                    })
                                    ticketAddition = ticketAddition + 1
                                end
                                local timeVal = Core.networkClient.getTime() + newSpawnCache.latency + newSpawnCache.currentAddition
                                Core.networkClient.send(Core.networkClient, "newbullets", weapon.uniqueId, bulletData, timeVal)
                                for bulletIndex = 1, #bullets do
                                    local theTicket = bullets[bulletIndex][2]
                                    Core.networkClient.send(Core.networkClient, "bullethit", weapon.uniqueId, entry._player, newTarget, "Head", theTicket, timeVal)
                                end
                                if Core.CollatScanningEnabled then
                                    for cIdx = playerIndex + 1, #closestPlayers do
                                        local cEntryData = closestPlayers[cIdx]
                                        local cEntry = cEntryData.entry
                                        if cEntry and cEntry._receivedPosition then
                                            local dist = (cEntry._receivedPosition - newTarget).Magnitude
                                            if dist <= (Core.CollatScanningRadius or 1) then
                                                local cOrigin, cTarget = scanPositions(origin, cEntry._receivedPosition, Core.publicSettings.bulletAcceleration, speed, penetration)
                                                if cOrigin then
                                                    for bulletIndex = 1, #bullets do
                                                        local theTicket = bullets[bulletIndex][2]
                                                        Core.networkClient.send(Core.networkClient, "bullethit", weapon.uniqueId, cEntry._player, cTarget, "Head", theTicket, timeVal)
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                                if Core.BulletTracersEnabled then
                                    if Core.BulletTracerLink and Core.RageBotFirePosScan and (newOrigin - origin).Magnitude > 0.1 then
                                        task.spawn(drawSegment, origin, newOrigin)
                                    end
                                    task.spawn(drawTracer, newOrigin, velocity, penetration)
                                end
                                if weapon._barrelPart then
                                    local barrel = weapon._barrelPart
                                    for _, c in ipairs(barrel:GetChildren()) do
                                        if c:IsA("ParticleEmitter") or c:IsA("PointLight") or c:IsA("Sound") or c.Name == "MuzzleFlash" then
                                            c:Destroy()
                                        end
                                    end
                                    Core.effects.muzzleflash(barrel, data.hideflash, 0.9)
                                    if data.type == "SNIPER" then
                                        Core.audioSystem.play("metalshell", 0.1)
                                    elseif data.type == "SHOTGUN" then
                                        Core.audioSystem.play("shotWeaponshell", 0.2)
                                    elseif data.type == "REVOLVER" and not data.caselessammo then
                                        Core.audioSystem.play("metalshell", 0.15, 0.8)
                                    end
                                    if data.sniperbass then
                                        Core.audioSystem.play("1PsniperBass", 0.75)
                                        Core.audioSystem.play("1PsniperEcho", 1)
                                    end
                                    Core.audioSystem.playSoundId(data.firesoundid, 2, data.firevolume, data.firepitch, barrel, nil, 0, 0.05)
                                end
                                if Core.crosshairsInterface and not weapon._aiming then
                                    Core.crosshairsInterface.fireImpulse(data.crossexpansion)
                                end
                                local fireDelay = 60 / (data.variablefirerate and data.firerate[weapon._firemodeIndex] or data.firerate)
                                nextShot = clockTime + fireDelay
                                weapon._magCount = weapon._magCount - 1
                                break
                            end
                            currentScanIndex = (currentScanIndex % totalPlayers) + 1
                            playersChecked = playersChecked + 1
                        end
                        if not shotFired and playersChecked >= totalPlayers then
                            nextScan = clockTime + 0.015
                        end
                    else
                        nextScan = clockTime + 0.015
                    end
                end
            end)
            newFrameTime = 0.005
            frameAcceleration = Vector3.new(0, -workspace.Gravity, 0)
            physicsignore = {
                workspace.Terrain,
                workspace:FindFirstChild("Ignore"),
                workspace:FindFirstChild("Players"),
                workspace.CurrentCamera
            }
            local sharedRaycastParams = RaycastParams.new()
            sharedRaycastParams.IgnoreWater = true
            raycast = function(origin, direction, filterlist, whitelist)
                sharedRaycastParams.FilterDescendantsInstances = filterlist or physicsignore
                sharedRaycastParams.FilterType = whitelist and Enum.RaycastFilterType.Include or Enum.RaycastFilterType.Exclude
                local result = workspace:Raycast(origin, direction, sharedRaycastParams)
                if result then
                    return result.Instance, result.Position, result.Normal
                end
                return nil, nil, nil
            end
            simulateBullet = function(origin, velocity, penetration)
                local newTime = 0
                local newOrigin = origin
                local newVelocity = velocity
                local newPenetration = penetration
                local ignoreList = {
                    table.unpack(physicsignore)
                }
                local firstOrigin = origin
                local lastTarget = origin
                local hitDetermined = false
                while (newTime < 1) do
                    local frameTime = newFrameTime
                    local motion = (frameTime * newVelocity) + (((frameTime * frameTime) / 2) * frameAcceleration)
                    local hit, enter = raycast(newOrigin, motion, ignoreList)
                    if hit and hit.CanCollide and hit.Transparency ~= 1 and hit.Name ~= "Window" then
                        local canShoot = false
                        local normal = motion.Unit
                        local maxExtent = hit.Size.Magnitude * normal
                        local _, exit = raycast(enter + maxExtent, -maxExtent, {
                            hit
                        }, true)
                        if exit then
                            canShoot = true
                            newPenetration = newPenetration - normal:Dot(exit - enter)
                            if (newPenetration < 0) then
                                lastTarget = enter
                                hitDetermined = true
                                break
                            end
                        else
                            canShoot = true
                        end
                        if canShoot then
                            table.insert(ignoreList, hit)
                            local timePassed = (motion:Dot(enter - newOrigin) / motion:Dot(motion)) * frameTime
                            newOrigin = enter + (0.01 * (newOrigin - enter).Unit)
                            newVelocity = newVelocity + (timePassed * frameAcceleration)
                            newTime = newTime + timePassed
                            lastTarget = exit or enter
                        end
                    else
                        lastTarget = newOrigin + motion
                        newOrigin = newOrigin + motion
                        newVelocity = newVelocity + (frameTime * frameAcceleration)
                        newTime = newTime + frameTime
                    end
                end
                return firstOrigin, lastTarget
            end
            Core.BulletTracersList = {}
            Core.TracerPool = {}
            Core.TransparencyCache = table.create(21)
            for i = 0, 20 do
                Core.TransparencyCache[i] = NumberSequence.new(i / 20)
            end
            RunService.RenderStepped:Connect(function()
                local c = #Core.BulletTracersList
                if c == 0 then
                    return
                end
                local now = os.clock()
                for i = c, 1, -1 do
                    local t = Core.BulletTracersList[i]
                    if not t.beam or not t.container or not t.beam.Parent then
                        if t.container then
                            pcall(function()
                                t.container:Destroy()
                            end)
                        end
                        table.remove(Core.BulletTracersList, i)
                        continue
                    end
                    local passed = now - t.created
                    if passed < 0.5 then
                        local pVal = 1 - (passed * 2)
                        local idx = math.clamp(math.floor(pVal * 20 + 0.5), 0, 20)
                        t.beam.Transparency = Core.TransparencyCache[idx]
                    elseif passed < t.duration then
                        if not t.fullyVisible then
                            t.beam.Transparency = Core.TransparencyCache[0]
                            t.fullyVisible = true
                        end
                    elseif passed < t.duration + 1 then
                        t.fullyVisible = false
                        local pVal = passed - t.duration
                        local idx = math.clamp(math.floor(pVal * 20 + 0.5), 0, 20)
                        t.beam.Transparency = Core.TransparencyCache[idx]
                    else
                        t.beam.Enabled = false
                        table.insert(Core.TracerPool, t)
                        table.remove(Core.BulletTracersList, i)
                    end
                end
            end)
            drawSegment = function(firstOrigin, lastTarget)
                local tracerColor = Core.TracerColor or Color3.fromRGB(83, 132, 171)
                local diameter = Core.TracerSize or 0.1
                local duration = Core.TracerDuration or 4
                local textureId = "rbxthumb://type=Asset&id=7151778311&w=420&h=420"
                local texSpeed = Core.TracerAnimationSpeed or 3
                if Core.TracerStyle == "2" then
                    textureId = "rbxthumb://type=Asset&id=446111271&w=420&h=420"
                elseif Core.TracerStyle == "3" then
                    textureId = "rbxthumb://type=Asset&id=86406621856457&w=420&h=420"
                elseif Core.TracerStyle == "4" then
                    textureId = "rbxthumb://type=Asset&id=7151842833&w=420&h=420"
                elseif Core.TracerStyle == "5" then
                    textureId = "rbxthumb://type=Asset&id=15000399181&w=420&h=420"
                elseif Core.TracerStyle == "6" then
                    textureId = "rbxthumb://type=Asset&id=73663492833517&w=420&h=420"
                end
                local poolSize = #Core.TracerPool
                local t
                if poolSize > 0 then
                    t = Core.TracerPool[poolSize]
                    Core.TracerPool[poolSize] = nil
                    t.container.CFrame = CFrame.new(firstOrigin)
                    t.a1.WorldPosition = firstOrigin
                    t.a2.WorldPosition = lastTarget
                    t.beam.Color = ColorSequence.new(tracerColor)
                    t.beam.Width0 = diameter * 2.5
                    t.beam.Width1 = diameter * 2.5
                    t.beam.Texture = textureId
                    t.beam.TextureSpeed = texSpeed
                    t.beam.Transparency = Core.TransparencyCache[20]
                    t.beam.Enabled = true
                    t.created = os.clock()
                    t.duration = duration
                    t.fullyVisible = false
                else
                    local container = Instance.new("Part")
                    container.Name = "TracerContainer"
                    container.Anchored = true
                    container.CanCollide = false
                    container.Transparency = 1
                    container.Size = Vector3.zero
                    container.CFrame = CFrame.new(firstOrigin)
                    container.Parent = workspace:FindFirstChild("Ignore") or workspace
                    local a1 = Instance.new("Attachment", container)
                    a1.WorldPosition = firstOrigin
                    local a2 = Instance.new("Attachment", container)
                    a2.WorldPosition = lastTarget
                    local beam = Instance.new("Beam", container)
                    beam.Attachment0 = a1
                    beam.Attachment1 = a2
                    beam.Color = ColorSequence.new(tracerColor)
                    beam.Width0 = diameter * 2.5
                    beam.Width1 = diameter * 2.5
                    beam.Texture = textureId
                    beam.TextureMode = Enum.TextureMode.Static
                    beam.TextureLength = 4
                    beam.TextureSpeed = texSpeed
                    beam.Transparency = Core.TransparencyCache[20]
                    beam.ZOffset = 1
                    beam.FaceCamera = true
                    beam.LightEmission = 10
                    beam.LightInfluence = 0
                    t = {
                        container = container,
                        a1 = a1,
                        a2 = a2,
                        beam = beam,
                        created = os.clock(),
                        duration = duration,
                        fullyVisible = false
                    }
                end
                table.insert(Core.BulletTracersList, t)
            end
            drawTracer = function(origin, velocity, penetration, isSubPellet)
                if not Core.BulletTracersEnabled then
                    return
                end
                if isSubPellet then
                    return
                end
                local firstOrigin, lastTarget = simulateBullet(origin, velocity, penetration)
                if not firstOrigin or not lastTarget then
                    return
                end
                drawSegment(firstOrigin, lastTarget)
            end
            Core.newbullet = bulletObject.new
            function bulletObject.new(bulletData)
                if bulletData.onplayerhit then
                    if Core.UnlockAll then
                        local controller = weaponInterface.getActiveWeaponController()
                        local weapon = controller and controller:getActiveWeapon()
                        local data = weapon and weapon:getWeaponData()
                        if data then
                            local pData = playerDataClientInterface.getPlayerData()
                            local cl = (pData and modules.PlayerDataUtils.getClassData(pData)) and modules.PlayerDataUtils.getClassData(pData).curclass
                            if cl and Core.FakeWeapons[cl] and Core.FakeWeapons[cl][controller:getActiveWeaponIndex()] == (data.displayname or data.name) then
                                local realSpeed = contentInterface.getWeaponData(Core.FakeWeapons[cl][controller:getActiveWeaponIndex()], false).bulletspeed
                                if realSpeed then
                                    bulletData.velocity = bulletData.velocity.Unit * realSpeed
                                end
                            end
                        end
                    end
                    if Core.SilentEnabled and (Core.SilentHitChance >= math.random(1, 100)) then
                        local targetPos, entry, targetPart = Core:GetSilentClosestTarget((Core.SilentHeadshotChance >= math.random(1, 100)) and "Head" or "Torso")
                        if targetPos then
                            local targetVelocity = Vector3.zero
                            if entry and entry._player then
                                local player = entry._player
                                if Core.movementCache.position[player] and Core.movementCache.position[player][15] and Core.movementCache.time[15] then
                                    targetVelocity = (Core.movementCache.position[player][15] - Core.movementCache.position[player][1]) / (Core.movementCache.time[15] - Core.movementCache.time[1])
                                end
                            end
                            local origin = bulletData.position
                            local velocity = (Core.complexTrajectory(origin, bulletData.acceleration, targetPos, bulletData.velocity.Magnitude, targetVelocity))
                            bulletData.velocity = velocity
                        end
                    end
                    drawTracer(bulletData.position, bulletData.velocity, bulletData.penetrationdepth, bulletData.isSubPellet)
                end
                return Core.newbullet(bulletData)
            end
            local send = network.send
            function network:send(name, ...)
                local Arguments = {
                    ...
                }
                if name == "spawn" then
                    Core.LastSpawnTime = tick()
                    task.spawn(function()
                        local start = tick()
                        repeat
                            task.wait()
                        until charInterface.isAlive() or (tick() - start > 5);
                        if not charInterface.isAlive() then
                            return
                        end
                        Core.ThirdPerson:Init();
                    end);
                end
                if not Core.ThirdPersonInitialized then
                    Core.ThirdPersonInitialized = true
                    task.spawn(function()
                        local start = tick()
                        repeat
                            task.wait()
                        until charInterface.isAlive() or (tick() - start > 5);
                        if charInterface.isAlive() then
                            Core.ThirdPerson:Init();
                        end
                    end)
                end
                if name == "repupdate" then
                    local position, angles, angles2, time = ...
                    if Core.AntiAimEnabled and Core.FakeLagEnabled then
                        if not Core.fakelag_lastRefreshPosition or not Core.fakelag_lastRefreshTime then
                            Core.fakelag_lastRefreshPosition = position
                            Core.fakelag_lastRefreshTime = tick()
                        end
                        local dt = tick() - Core.fakelag_lastRefreshTime
                        local dist = (position - Core.fakelag_lastRefreshPosition).Magnitude
                        local safeDistance = Core.FakeLagRefreshDistance or 5
                        if dt > 0 and (dist / dt) > 25 then
                            safeDistance = math.min(safeDistance, 3.25)
                        end
                        if (dist > safeDistance) or (dt > math.clamp(Core.FakeLagRefreshRate or 0.5, 0, 1.5)) then
                            Core.fakelag_lastRefreshPosition = position
                            Core.fakelag_lastRefreshTime = tick()
                        else
                            return
                        end
                    else
                        Core.fakelag_lastRefreshPosition = nil
                        Core.fakelag_lastRefreshTime = nil
                    end
                    if Core.AntiAimEnabled and Core.FakePositionEnabled then
                        Core.fakePos_Tick = (Core.fakePos_Tick or 0) + 1
                        if Core.fakePos_Tick >= (Core.FakePositionInterval or 1) then
                            Core.fakePos_Tick = 0
                            local rad = Core.FakePositionRadius or 1
                            Core.fakePos_Offset = Vector3.new((math.random() - 0.5) * 2 * rad, 0, (math.random() - 0.5) * 2 * rad)
                        end
                        position = position + (Core.fakePos_Offset or Vector3.zero)
                    end
                    Core.Storage.Repupdate = position
                    if Core.AntiAimEnabled then
                        local X, Y, Z = angles.X, angles.Y, angles.Z
                        if Core.AntiAimYawEnabled then
                            if Core.AntiAimYawType == "Custom" then
                                Y = Y + math.rad(Core.AntiAimYawAngle)
                            elseif Core.AntiAimYawType == "Wave" then
                                Y = Y + math.rad(math.sin(tick() * Core.AntiAimYawWaveRate) * Core.AntiAimYawWaveDegree)
                            end
                        end
                        if Core.AntiAimPitchEnabled then
                            if Core.AntiAimPitchType == "Custom" then
                                X = Core.AntiAimPitchAngle / 45
                            elseif Core.AntiAimPitchType == "Wave" then
                                X = math.sin((tick() - Core.StartTime) * Core.AntiAimPitchWaveRate) * 2
                            end
                        end
                        if Core.AntiAimSpinBotEnabled then
                            Y = Y + (tick() - Core.StartTime) * math.rad(Core.AntiAimSpinBotDegreeRate * ((Core.AntiAimSpinBotType == "Wave") and math.sin(tick()) * (Core.AntiAimSpinBotWaveRate) or 1))
                        end
                        angles = Vector3.new(X, Y, Z)
                    end
                    Core.Storage.LookAngles = angles
                    if Core.newSpawnCache.updateDebt > 0 then
                        Core.newSpawnCache.updateDebt = Core.newSpawnCache.updateDebt - 1
                        return
                    end
                    if Core.WalkSpeedEnabled and Core.newSpawnCache.lastUpdate then
                        send(self, name, Core.newSpawnCache.lastUpdate, angles, angles2, time + Core.newSpawnCache.latency + Core.newSpawnCache.currentAddition)
                        Core.newSpawnCache.updateDebt = Core.newSpawnCache.updateDebt + 1
                    end
                    Core.newSpawnCache.lastUpdateTime = time
                    Core.newSpawnCache.lastUpdate = position
                    local Object = Core.ThirdPerson.ThirdPersonObject;
                    if Object and Core.ThirdPerson.Active then
                    end
                    return send(self, name, position, angles, angles2, time + Core.newSpawnCache.latency + Core.newSpawnCache.currentAddition)
                elseif name == "ping" then
                    local a, b, c = ...
                    local add = Core.newSpawnCache.latency + Core.newSpawnCache.currentAddition
                    return send(self, name, a, b + add, c + add)
                elseif name == "newbullets" then
                    local uniqueId, bulletData, time = ...
                    local Object = Core.ThirdPerson.ThirdPersonObject;
                    if Object and Core.ThirdPerson.Active then
                        Object:kickWeapon(0, 0, 0, 0);
                    end
                    if Core.SilentEnabled and (Core.SilentHitChance >= math.random(1, 100)) then
                        local targetPos, entry, targetPart = Core:GetSilentClosestTarget((Core.SilentHeadshotChance >= math.random(1, 100)) and "Head" or "Torso")
                        if targetPos then
                            local activeController = weaponInterface.getActiveWeaponController()
                            local activeWeapon = activeController and activeController:getActiveWeapon()
                            if activeWeapon then
                                local targetVelocity = vector3_zero
                                if entry and entry._player then
                                    local player = entry._player
                                    local posCache = Core.movementCache.position[player]
                                    local timeCache = Core.movementCache.time
                                    if posCache and posCache[15] and timeCache[15] then
                                        targetVelocity = (posCache[15] - posCache[1]) / (timeCache[15] - timeCache[1])
                                    end
                                end
                                local speed = activeWeapon._weaponData.bulletspeed
                                local rawVel = speed and Core.complexTrajectory(bulletData.firepos, Core.publicSettings.bulletAcceleration, targetPos, speed, targetVelocity)
                                local velocity = rawVel and rawVel.Unit
                                for idx, bullet in bulletData.bullets do
                                    if velocity then
                                        bullet[1] = velocity
                                    end
                                    if idx > 1 then
                                        bullet.isSubPellet = true
                                    end
                                end
                            end
                        end
                    end
                    return send(self, name, uniqueId, bulletData, time)
                elseif name == "equip" then
                    local Object = Core.ThirdPerson.ThirdPersonObject;
                    if Object and Core.ThirdPerson.Active then
                        local Slot = Arguments[1];
                        if Slot == 3 then
                            Object:equipMelee();
                        else
                            Object:equip(Slot);
                        end;
                    end
                elseif name == "sprint" then
                    local Object = Core.ThirdPerson.ThirdPersonObject;
                    if Object and Core.ThirdPerson.Active then
                        Object:setSprint(Arguments[1]);
                    end
                elseif name == "aim" then
                    local Object = Core.ThirdPerson.ThirdPersonObject;
                    if Object and Core.ThirdPerson.Active then
                        Object:setAim(Arguments[1]);
                    end
                elseif name == "stab" then
                    local Object = Core.ThirdPerson.ThirdPersonObject;
                    if Object and Core.ThirdPerson.Active then
                        Object:stab();
                    end
                end
                if name == "changeCamo" and Core.UnlockCamos then
                    return
                end
                if name == "changeAttachment" and Core.UnlockAttachments then
                    return
                end
                if name == "changeWeapon" then
                    local slot, weapon = ...
                    if Core.UnlockKnives and slot == "Knife" then
                        return
                    end
                    if Core.UnlockAll then
                        local pData = playerDataClientInterface.getPlayerData()
                        local cl = (pData and modules.PlayerDataUtils.getClassData(pData)) and modules.PlayerDataUtils.getClassData(pData).curclass
                        if cl then
                            local newPData = table.clone(pData)
                            newPData.unlockAll = false
                            if slot == "Primary" then
                                Core.FakeWeapons[cl][1] = weapon
                                if modules.PlayerDataUtils.ownsWeapon(newPData, weapon) then
                                    Core.RealWeapons[cl][1] = weapon
                                end
                            elseif slot == "Secondary" then
                                Core.FakeWeapons[cl][2] = weapon
                                if modules.PlayerDataUtils.ownsWeapon(newPData, weapon) then
                                    Core.RealWeapons[cl][2] = weapon
                                end
                            end
                        end
                    end
                end
                if name == "falldamage" and Core.NoFallDamageEnabled then
                    return
                end
                return send(self, name, ...)
            end
            Core.getWeaponDataOriginal = contentInterface.getWeaponData
            function contentInterface.getWeaponData(weaponName, makeClone)
                local data = Core.getWeaponDataOriginal(weaponName, makeClone)
                if makeClone and Core.UnlockAll then
                    local p = playerDataClientInterface.getPlayerData()
                    local cl = (p and modules.PlayerDataUtils.getClassData(p)) and modules.PlayerDataUtils.getClassData(p).curclass
                    if cl and Core.FakeWeapons[cl] then
                        for s, fn in pairs(Core.FakeWeapons[cl]) do
                            if fn == (data.displayname or data.name) and Core.RealWeapons[cl][s] then
                                local r = Core.getWeaponDataOriginal(Core.RealWeapons[cl][s], false)
                                if r then
                                    setreadonly(data, false)
                                    local cap = r.firecap or (r.variablefirerate and math.max(unpack(r.firerate))) or r.firecap
                                    if data.variablefirerate then
                                        for i, v in ipairs(data.firerate) do
                                            data.firerate[i] = math.min(v, cap)
                                        end
                                    elseif data.firerate > cap then
                                        data.firerate = cap
                                    end
                                    if data.firecap and data.firecap > cap then
                                        data.firecap = cap
                                    end
                                    if r.magsize then
                                        if data.magsize > r.magsize then
                                            data.magsize, data.sparerounds = r.magsize, r.sparerounds
                                        else
                                            data.sparerounds = (r.magsize + r.sparerounds) - data.magsize
                                        end
                                    end
                                    data.pelletcount, data.penetrationdepth, data.bulletspeed = r.pelletcount, r.penetrationdepth, r.bulletspeed
                                end;
                                break
                            end
                        end
                    end
                end
                return data
            end
            Core.ownsWeaponOriginal = modules.PlayerDataUtils.ownsWeapon
            Core.weaponDatabaseFolder = ReplicatedStorage.Content.ProductionContent.WeaponDatabase
            function modules.PlayerDataUtils.ownsWeapon(player, weapon)
                if Core.UnlockKnives then
                    local w = string.upper(weapon)
                    for _, i in ipairs({
                        "ONE HAND BLUNT",
                        "ONE HAND BLADE",
                        "TWO HAND BLUNT",
                        "TWO HAND BLADE"
                    }) do
                        local t = Core.weaponDatabaseFolder:FindFirstChild(i)
                        if t and t:FindFirstChild(w) then
                            return true
                        end
                    end
                end
                return Core.ownsWeaponOriginal(player, weapon)
            end
            Core.getUnlocksDataOriginal = modules.PlayerDataUtils.getUnlocksData
            function modules.PlayerDataUtils.getUnlocksData(player)
                local unlocks = Core.getUnlocksDataOriginal(player)
                if Core.UnlockAttachments and player == playerDataClientInterface.getPlayerData() then
                    local old = unlocks
                    unlocks = setmetatable({}, {
                        __index = function(self, k)
                            local val = old[k]
                            if not val then
                                val = {}
                                old[k] = val
                            end
                            val.kills = 1
                            return val
                        end,
                        __newindex = function(self, k, v)
                            old[k] = v
                        end
                    })
                end
                return unlocks
            end
            local applyImpulse = recoil.applyImpulse
            function recoil.applyImpulse(...)
                if Core.NoRecoil then
                    return
                end
                return applyImpulse(...)
            end
            local reload = firearmObject.reload
            function firearmObject:reload()
                if Core.InstantReload and self._spareCount > 0 then
                    if self._spareCount >= self._weaponData.magsize then
                        self._spareCount = self._spareCount - (self._weaponData.magsize - self._magCount)
                        self._magCount = self._weaponData.magsize
                    else
                        self._magCount = self._spareCount
                        self._spareCount = 0
                    end
                    network:send("reload")
                    return
                end
                return reload(self)
            end
            local computeWalkSway = firearmObject.computeWalkSway
            function firearmObject:computeWalkSway(dy, dx)
                if Core.NoWalkSway then
                    dy = 0;
                    dx = 0
                end
                return computeWalkSway(self, dy, dx)
            end
            local computeGunSway = firearmObject.computeGunSway
            function firearmObject.computeGunSway(...)
                if Core.NoGunSway then
                    return CFrame.identity
                end
                return computeGunSway(...)
            end
            local fromAxisAngle = cframeLib.fromAxisAngle
            function cframeLib.fromAxisAngle(x, y, z)
                if Core.NoCameraSway then
                    local controller = weaponInterface.getActiveWeaponController()
                    local weapon = controller and controller:getActiveWeapon()
                    return (weapon and weapon._blackScoped and CFrame.identity) or fromAxisAngle(x, y, z)
                end
                return fromAxisAngle(x, y, z)
            end
            local getWeaponStat = firearmObject.getWeaponStat
            function firearmObject:getWeaponStat(stat)
                if Core.NoSpread and stat and stat:match('spread') then
                    local spreadSpring = self._spreadSpring
                    if spreadSpring then
                        spreadSpring._p0 = Vector3.zero
                        spreadSpring._v0 = Vector3.zero
                    end
                end
                return getWeaponStat(self, stat)
            end
            local instantAimOriginals = setmetatable({}, {
                __mode = "k"
            })
            RunService.RenderStepped:Connect(function()
                local controller = weaponInterface and weaponInterface.getActiveWeaponController()
                local weapon = controller and controller.getActiveWeapon and controller:getActiveWeapon()
                if weapon and weapon.getWeaponType and weapon:getWeaponType() == 'Firearm' then
                    local aimStats = weapon._activeAimStats and weapon._activeAimStats[weapon._activeAimStatIndex]
                    if aimStats then
                        if not instantAimOriginals[aimStats] then
                            instantAimOriginals[aimStats] = {
                                aimspeed = aimStats.aimspeed,
                                magnifyspeed = aimStats.magnifyspeed,
                                unaimspeed = aimStats.unaimspeed,
                                unmagnifyspeed = aimStats.unmagnifyspeed,
                            }
                        end
                        if Core.InstantAim then
                            aimStats.aimspeed = 999
                            aimStats.magnifyspeed = 999
                            aimStats.unaimspeed = 999
                            aimStats.unmagnifyspeed = 999
                        else
                            local orig = instantAimOriginals[aimStats]
                            aimStats.aimspeed = orig.aimspeed
                            aimStats.magnifyspeed = orig.magnifyspeed
                            aimStats.unaimspeed = orig.unaimspeed
                            aimStats.unmagnifyspeed = orig.unmagnifyspeed
                        end
                    end
                end
                if Core.InstantEquip then
                    local charObject = charInterface and charInterface.getCharacterObject()
                    if charObject then
                        local equipSpring = charObject:getSpring('equipspring')
                        if equipSpring then
                            equipSpring.s = 999
                        end
                    end
                end
            end)
            local mainStep = cameraObject.step
            cameraObject.step = function(self, dt)
                local characterObject = charInterface.getCharacterObject()
                local l_NoCameraSway = Core.NoCameraSway
                local l_NoCameraBob = Core.NoCameraBob
                local useNoBob = l_NoCameraBob and characterObject
                local stepDt = l_NoCameraSway and 0 or dt
                if useNoBob then
                    local oldSpeed = characterObject._speed
                    characterObject._speed = 0
                    mainStep(self, stepDt)
                    characterObject._speed = oldSpeed
                else
                    mainStep(self, stepDt)
                end
                if l_NoCameraSway then
                    self._lookDt = dt
                end
                if Core.ThirdPersonEnabled then
                    local cameraCF = Camera.CFrame
                    local lookVector = cameraCF.LookVector
                    local distance = Core.ThirdPersonDistance or 7
                    local params = RaycastParams.new()
                    params.FilterDescendantsInstances = {
                        workspace:FindFirstChild("Players"),
                        workspace.CurrentCamera,
                        workspace:FindFirstChild("Ignore")
                    }
                    params.FilterType = Enum.RaycastFilterType.Exclude
                    local rayResult = workspace:Raycast(cameraCF.Position, lookVector * -distance, params)
                    if rayResult and rayResult.Instance.CanCollide then
                        distance = (rayResult.Position - cameraCF.Position).Magnitude
                    end
                    Camera.CFrame *= CFrame.new(0, 0, distance)
                end
            end
            RunService.PreRender:Connect(function()
                if Core.ThirdPerson and Core.ThirdPerson.Active and Core.ThirdPerson.ThirdPersonObject and Core.ToggleCharacterVisuals then
                    local Character = Core.ThirdPerson.ThirdPersonObject._characterModel
                    if Character then
                        local material = Core.CharacterMaterial or "ForceField"
                        local texture = Core.ForceFieldTextures[Core.SelectedForceFieldTexture or "Honeycomb"]
                        local color = Core.ThirdPersonChamsColor or Color3.fromRGB(131, 146, 255)
                        local vColor = Vector3.new(color.R, color.G, color.B)
                        for _, Object in ipairs(Character:GetDescendants()) do
                            if Object:IsA('BasePart') then
                                if material == "ForceField" then
                                    Object.Material = Enum.Material.ForceField
                                else
                                    pcall(function()
                                        Object.Material = Enum.Material[material] or Enum.Material.ForceField
                                    end)
                                end
                                Object.Color = color
                                if Object:IsA('MeshPart') then
                                    if material == "ForceField" then
                                        pcall(function()
                                            Object.TextureID = texture
                                        end)
                                    else
                                        pcall(function()
                                            Object.TextureID = ""
                                        end)
                                    end
                                end
                            elseif Object:IsA('SpecialMesh') then
                                if material == "ForceField" then
                                    Object.TextureId = texture
                                    Object.VertexColor = vColor
                                else
                                    Object.TextureId = ""
                                    Object.VertexColor = Vector3.new(1, 1, 1)
                                end
                            elseif Object:IsA('Decal') or Object:IsA('Texture') then
                                Object.Transparency = 1
                            end
                        end
                    end
                end
            end)
            Library:Notify('roxy loaded in ' .. string.format("%.2f", tick() - Core.StartTime) .. ' seconds', 5)
        else
            warn("roxy.win / failed to hook gun mods modules {fuck} ")
        end
    end)
end
