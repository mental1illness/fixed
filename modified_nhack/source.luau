--[[
    2/22/2026
    Library.lua
    Purpose:
        NH ui library

    Author: @joestar._3
    Dependencies:
        None
]]

-- hi guys

if getgenv().Library and getgenv().Library.Exit then
    getgenv().Library:Exit()
end

-- Bad executor support (atleast by a bit)
cloneref = cloneref or function(Object) return Object end

--#region Services
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local ContextActionService = game:GetService("ContextActionService")
local CoreGui = cloneref(game:GetService("CoreGui"))
local GuiService = game:GetService("GuiService")
--#endregion

gethui = gethui or function() return CoreGui end

--#region Variables
local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera
local Mouse = cloneref(LocalPlayer:GetMouse())
local GuiInset = GuiService:GetGuiInset().Y
local BlockedWindowInputs = {
    Enum.KeyCode.W,
    Enum.KeyCode.A,
    Enum.KeyCode.S,
    Enum.KeyCode.D,
    Enum.KeyCode.Space,
    Enum.KeyCode.LeftShift,
    Enum.KeyCode.RightShift,
    Enum.KeyCode.LeftControl,
    Enum.KeyCode.RightControl,
    Enum.KeyCode.LeftAlt,
    Enum.KeyCode.RightAlt,
    Enum.KeyCode.Up,
    Enum.KeyCode.Down,
    Enum.KeyCode.Left,
    Enum.KeyCode.Right,
    Enum.KeyCode.Return,
    Enum.KeyCode.KeypadEnter,
    Enum.KeyCode.Slash,
    Enum.KeyCode.Backquote,
    Enum.KeyCode.Tab,
    Enum.KeyCode.E,
    Enum.KeyCode.Q,
    Enum.KeyCode.R,
    Enum.KeyCode.F,
    Enum.KeyCode.C,
    Enum.KeyCode.Z,
    Enum.KeyCode.X,
    Enum.KeyCode.One,
    Enum.KeyCode.Two,
    Enum.KeyCode.Three,
    Enum.KeyCode.Four,
    Enum.KeyCode.Five,
    Enum.KeyCode.Six,
    Enum.KeyCode.Seven,
    Enum.KeyCode.Eight,
    Enum.KeyCode.Nine,
    Enum.KeyCode.Zero
}
--#endregion

local Library = {
    Flags = {},
    MenuKeybind = tostring(Enum.KeyCode.X),

    Directory = "niggahack",
    Folders = {
        Assets = "/Assets",
        Configs = "/Configs"
    },

    FontSize = 12,

    Animation = {
        Time = 0.3,
        Style = "Quint",
        Direction = "Out"
    },

    Theme = nil,

    -- Ignore below
    Threads = {},
    Connections = {},
    Notifications = {},
    SetFlags = {},

    ThemingStuff = {},
    ThemeMap = {},

    OpenFrames = {},
    WindowVisibilityBindings = {},
    WindowOpenState = true,
    InputBlockAction = "NH_UI_INPUT_BLOCK",
    BackgroundEffects = nil,
    BackgroundBlurEnabled = true,
    BackgroundSnowEnabled = true,
    CopiedColor = nil,
    LayoutRegistry = {},
    SettingsWidgets = {},
    ActiveConfirmDialog = nil,
    MouseCursor = nil,
    MouseStateBeforeOpen = nil,

    Holder = nil,
    UnusedHolder = nil,

    Font = nil
}
do
    Library.__index = Library

    local Flags = Library.Flags
    local SetFlags = Library.SetFlags

    local Keys = {
        ["Unknown"]          = "Unknown",
        ["Backspace"]        = "Back",
        ["Tab"]              = "Tab",
        ["Clear"]            = "Clear",
        ["Return"]           = "Return",
        ["Pause"]            = "Pause",
        ["Escape"]           = "Escape",
        ["Space"]            = "Space",
        ["QuotedDouble"]     = '"',
        ["Hash"]             = "#",
        ["Dollar"]           = "$",
        ["Percent"]          = "%",
        ["Ampersand"]        = "&",
        ["Quote"]            = "'",
        ["LeftParenthesis"]  = "(",
        ["RightParenthesis"] = " )",
        ["Asterisk"]         = "*",
        ["Plus"]             = "+",
        ["Comma"]            = ",",
        ["Minus"]            = "-",
        ["Period"]           = ".",
        ["Slash"]            = "`",
        ["Three"]            = "3",
        ["Seven"]            = "7",
        ["Eight"]            = "8",
        ["Colon"]            = ":",
        ["Semicolon"]        = ";",
        ["LessThan"]         = "<",
        ["GreaterThan"]      = ">",
        ["Question"]         = "?",
        ["Equals"]           = "=",
        ["At"]               = "@",
        ["LeftBracket"]      = "LeftBracket",
        ["RightBracket"]     = "RightBracked",
        ["BackSlash"]        = "BackSlash",
        ["Caret"]            = "^",
        ["Underscore"]       = "_",
        ["Backquote"]        = "`",
        ["LeftCurly"]        = "{",
        ["Pipe"]             = "|",
        ["RightCurly"]       = "}",
        ["Tilde"]            = "~",
        ["Delete"]           = "Delete",
        ["End"]              = "End",
        ["KeypadZero"]       = "Keypad0",
        ["KeypadOne"]        = "Keypad1",
        ["KeypadTwo"]        = "Keypad2",
        ["KeypadThree"]      = "Keypad3",
        ["KeypadFour"]       = "Keypad4",
        ["KeypadFive"]       = "Keypad5",
        ["KeypadSix"]        = "Keypad6",
        ["KeypadSeven"]      = "Keypad7",
        ["KeypadEight"]      = "Keypad8",
        ["KeypadNine"]       = "Keypad9",
        ["KeypadPeriod"]     = "KeypadP",
        ["KeypadDivide"]     = "KeypadD",
        ["KeypadMultiply"]   = "KeypadM",
        ["KeypadMinus"]      = "KeypadM",
        ["KeypadPlus"]       = "KeypadP",
        ["KeypadEnter"]      = "KeypadE",
        ["KeypadEquals"]     = "KeypadE",
        ["Insert"]           = "Insert",
        ["Home"]             = "Home",
        ["PageUp"]           = "PageUp",
        ["PageDown"]         = "PageDown",
        ["RightShift"]       = "RightShift",
        ["LeftShift"]        = "LeftShift",
        ["RightControl"]     = "RightControl",
        ["LeftControl"]      = "LeftControl",
        ["LeftAlt"]          = "LeftAlt",
        ["RightAlt"]         = "RightAlt"
    }

    -- Folders
    if not isfolder(Library.Directory) then
        makefolder(Library.Directory)
    end

    for _, Folder in Library.Folders do
        if not isfolder(Library.Directory .. Folder) then
            makefolder(Library.Directory .. Folder)
        end
    end

	local Themes = {
		["Preset"] = {
			["Background"] = Color3.fromRGB(18, 16, 16),
			["Outline"] = Color3.fromRGB(42, 36, 36),
			["Border"] = Color3.fromRGB(10, 7, 7),
			["Accent"] = Color3.fromRGB(220, 60, 60),
			["Risky"] = Color3.fromRGB(255, 40, 40),
			["Light Border"] = Color3.fromRGB(14, 10, 10),
			["Border 2"] = Color3.fromRGB(12, 8, 8),
			["Text"] = Color3.fromRGB(180, 180, 180),
			["Section"] = Color3.fromRGB(22, 20, 20),
			["Element"] = Color3.fromRGB(32, 28, 28),
			["Hovered Element"] = Color3.fromRGB(45, 35, 35),
			["Inactive Text"] = Color3.fromRGB(100, 100, 100)
		}
	}

    Library.Theme = Themes.Preset

    -- Custom Font
    local CustomFont = {}
    do
        function CustomFont:New(Name, Weight, Style, Data)
            if not isfile(Data.Id) then
                writefile(Data.Id, game:HttpGet(Data.Url))
            end

            local Data = {
                name = Name,
                faces = {
                    {
                        name = Name,
                        weight = Weight,
                        style = Style,
                        assetId = getcustomasset(Data.Id)
                    }
                }
            }

            writefile(`{Library.Directory .. Library.Folders.Assets}/{Name}.font`, HttpService:JSONEncode(Data))
            return Font.new(getcustomasset(`{Library.Directory .. Library.Folders.Assets}/{Name}.font`))
        end

        Library.Font = CustomFont:New("atte", 400, "Regular", {
            Id = "atte",
            Url = "https://github.com/mental1illness/storage/raw/refs/heads/main/fonts/old-tahoma.ttf"
        })
    end

    Library.Exit = function(Self)
        Self:ApplyWindowInputState(false)

        if Self.BackgroundEffects then
            Self.BackgroundEffects.IsSnowing = false

            if Self.BackgroundEffects.BlurEffect and Self.BackgroundEffects.BlurEffect.Parent then
                Self.BackgroundEffects.BlurEffect:Destroy()
            end

            if Self.BackgroundEffects.Background and Self.BackgroundEffects.Background.Parent then
                Self.BackgroundEffects.Background:Destroy()
            end
        end

        for _, Connection in Library.Connections do
            Connection:Disconnect()
        end

        for _, Thread in Library.Threads do
            coroutine.close(Thread)
        end

        if Self.Holder then
            Self.Holder.Instance:Destroy()
        end

        if Self.UnusedHolder then
            Self.UnusedHolder.Instance:Destroy()
        end

        Library = nil
        getgenv().Library = nil
    end

    Library.Create = function(Self, Class, Properties)
        local Data = {
            Class = Class,
            Properties = Properties,
            Instance = Instance.new(Class)
        }

        for Index, Property in Properties do
            if Property == "FontFace" then
                Data.Instance[Property] = Library.Font
                continue
            end

            if Property == "TextSize" then
                Data.Instance[Property] = Library.FontSize
                continue
            end

            if Property == "Name" then
                Data.Instance[Property] = "\0"
                continue
            end

            if Class == "TextButton" then
                if Property == "AutoButtonColor" then
                    Data.Instance[Property] = false
                    continue
                end

                if Property == "Text" then
                    Data.Instance[Property] = ""
                    continue
                end
            end

            Data.Instance[Index] = Property
        end

        return setmetatable(Data, Library)
    end

    Library.Thread = function(Self, Function)
        local NewThread = coroutine.create(Function)

        coroutine.wrap(function()
            coroutine.resume(NewThread)
        end)()

        table.insert(Library.Threads, NewThread)
        return NewThread
    end

    Library.Connect = function(Self, Signal, Callback)
        local Connection

        if Self.Instance then
            if Self.Instance[Signal] then
                Connection = Self.Instance[Signal]:Connect(Callback)
            else
                Connection = Signal:Connect(Callback)
            end
        else
            Connection = Signal:Connect(Callback)
        end

        table.insert(Library.Connections, Connection)
        return Connection
    end

    Library.Tween = function(Self, Properties, Info, IsRawItem)
        local Object = Self.Instance or IsRawItem
        Info = Info or
            TweenInfo.new(Library.Animation.Time, Enum.EasingStyle[Library.Animation.Style],
                Enum.EasingDirection[Library.Animation.Direction])

        if not Object then
            return
        end

        local NewTween = TweenService:Create(Object, Info, Properties)
        NewTween:Play()

        return NewTween
    end

    Library.GetTweenProperty = function(Self, IsRawItem)
        local Object = Self.Instance or IsRawItem

        if not Object then
            return {}
        end

        if Object:IsA("Frame") then
            return { "BackgroundTransparency" }
        elseif Object:IsA("TextLabel") or Object:IsA("TextButton") then
            return { "TextTransparency", "BackgroundTransparency" }
        elseif Object:IsA("ImageLabel") or Object:IsA("ImageButton") then
            return { "BackgroundTransparency", "ImageTransparency" }
        elseif Object:IsA("ScrollingFrame") then
            return { "BackgroundTransparency", "ScrollBarImageTransparency" }
        elseif Object:IsA("TextBox") then
            return { "TextTransparency", "BackgroundTransparency" }
        elseif Object:IsA("UIStroke") then
            return { "Transparency" }
        end
    end

    Library.Fade = function(Self, Property, Visibility, IsRawItem)
        local Object = Self.Instance or IsRawItem

        if not Object then
            return
        end

        local OldTransparency = Object[Property]
        Object[Property] = Visibility and 1 or OldTransparency

        local NewTween = Library:Tween({
            [Property] = Visibility and OldTransparency or 1
        }, nil, Object)

        Library:Connect(NewTween.Completed, function()
            if not Visibility then
                task.wait()
                Object[Property] = OldTransparency
            end
        end)

        return NewTween
    end

    Library.FadeDescendants = function(Self, Visibility, Callback)
        if Visibility then
            Self.Instance.Visible = true
        end

        local NewTween

        local Children = Self.Instance:GetDescendants()
        table.insert(Children, Self.Instance)

        for _, Child in Children do
            local TransparencyProperty = Library:GetTweenProperty(Child)

            if not TransparencyProperty then
                continue
            end

            if type(TransparencyProperty) == "table" then
                for _, Property in TransparencyProperty do
                    NewTween = Library:Fade(Property, Visibility, Child)
                end
            else
                NewTween = Library:Fade(TransparencyProperty, Visibility, Child)
            end
        end

        Library:Connect(NewTween.Completed, function()
            if Callback and type(Callback) == "function" then
                Callback()
            end

            Self.Instance.Visible = Visibility
        end)
    end

    Library.MakeDraggable = function(Self)
        if not Self.Instance then
            return
        end

        local Gui = Self.Instance
        local Dragging = false
        local DragStart
        local StartPosition

        local Set = function(Input)
            local DragDelta = Input.Position - DragStart
            local NewX = StartPosition.X.Offset + DragDelta.X
            local NewY = StartPosition.Y.Offset + DragDelta.Y

            local ScreenSize = Gui.Parent.AbsoluteSize
            local GuiSize = Gui.AbsoluteSize

            NewX = math.clamp(NewX, 0, ScreenSize.X - GuiSize.X)
            NewY = math.clamp(NewY, 0, ScreenSize.Y - GuiSize.Y)

            Gui.Position = UDim2.new(0, math.floor(NewX + 0.5), 0, math.floor(NewY + 0.5))
        end

        local InputChanged
        Self:Connect("InputBegan", function(Input)
            if not Library.WindowOpenState then
                return
            end

            if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                Dragging = true
                DragStart = Input.Position

                if Gui.Position.X.Scale ~= 0 or Gui.Position.Y.Scale ~= 0 then
                    Gui.AnchorPoint = Vector2.new(0, 0)
                    Gui.Position = UDim2.fromOffset(Gui.AbsolutePosition.X, Gui.AbsolutePosition.Y)
                end

                StartPosition = Gui.Position

                if InputChanged then
                    return
                end

                InputChanged = Input.Changed:Connect(function()
                    if Input.UserInputState == Enum.UserInputState.End then
                        Dragging = false
                        InputChanged:Disconnect()
                        InputChanged = nil
                    end
                end)
            end
        end)

        Library:Connect(UserInputService.InputChanged, function(Input)
            if Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch then
                if Dragging and not Library.WindowOpenState then
                    Dragging = false
                    return
                end

                if Dragging then
                    Set(Input)
                end
            end
        end)

        return Dragging
    end

    Library.MakeResizeable = function(Self, Minimum)
        if not Self.Instance then
            return
        end

        local Gui = Self.Instance

        local Resizing = false
        local CurrentSide = nil

        local StartMouse = nil
        local StartPosition = nil
        local StartSize = nil

        local EdgeThickness = 2

        local MakeEdge = function(Name, Position, Size)
            local Button = Library:Create("TextButton", {
                Name = "\0",
                Size = Size,
                Position = Position,
                BackgroundColor3 = Color3.fromRGB(166, 147, 243),
                BackgroundTransparency = 1,
                Text = "",
                BorderSizePixel = 0,
                AutoButtonColor = false,
                Parent = Gui,
                ZIndex = 99999,
            })
            Button:AddToTheme({ BackgroundColor3 = "Accent" })

            return Button
        end

        local Edges = {
            {
                Button = MakeEdge(
                    "Left",
                    UDim2.new(0, 0, 0, 0),
                    UDim2.new(0, EdgeThickness, 1, 0)),
                Side = "L"
            },

            {
                Button = MakeEdge(
                    "Right",
                    UDim2.new(1, -EdgeThickness, 0, 0),
                    UDim2.new(0, EdgeThickness, 1, 0)),
                Side = "R"
            },

            {
                Button = MakeEdge(
                    "Top", UDim2.new(0, 0, 0, 0),
                    UDim2.new(1, 0, 0, EdgeThickness)),
                Side = "T"
            },

            {
                Button = MakeEdge(
                    "Bottom",
                    UDim2.new(0, 0, 1, -EdgeThickness),
                    UDim2.new(1, 0, 0, EdgeThickness)),
                Side = "B"
            },
        }

        local BeginResizing = function(Side)
            Resizing = true
            CurrentSide = Side

            StartMouse = UserInputService:GetMouseLocation()

            StartPosition = Vector2.new(Gui.Position.X.Offset, Gui.Position.Y.Offset)
            StartSize = Vector2.new(Gui.Size.X.Offset, Gui.Size.Y.Offset)

            for Index, Value in Edges do
                Value.Button.Instance.BackgroundTransparency = (Value.Side == Side) and 0 or 1
            end
        end

        local EndResizing = function()
            Resizing = false
            CurrentSide = nil

            for Index, Value in Edges do
                Value.Button.Instance.BackgroundTransparency = 1
            end
        end

        for Index, Value in Edges do
            Value.Button:Connect("InputBegan", function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                    BeginResizing(Value.Side)
                end
            end)
        end

        Library:Connect(UserInputService.InputEnded, function(Input)
            if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                if Resizing then
                    EndResizing()
                end
            end
        end)

        Library:Connect(RunService.RenderStepped, function()
            if not Resizing or not CurrentSide then
                return
            end

            local MouseLocation = UserInputService:GetMouseLocation()
            local dx = MouseLocation.X - StartMouse.X
            local dy = MouseLocation.Y - StartMouse.Y

            local x, y = StartPosition.X, StartPosition.Y
            local w, h = StartSize.X, StartSize.Y

            if CurrentSide == "L" then
                x = StartPosition.X + dx
                w = StartSize.X - dx
            elseif CurrentSide == "R" then
                w = StartSize.X + dx
            elseif CurrentSide == "T" then
                y = StartPosition.Y + dy
                h = StartSize.Y - dy
            elseif CurrentSide == "B" then
                h = StartSize.Y + dy
            end

            if w < Minimum.X then
                if CurrentSide == "L" then
                    x = x - (Minimum.X - w)
                end
                w = Minimum.X
            end
            if h < Minimum.Y then
                if CurrentSide == "T" then
                    y = y - (Minimum.Y - h)
                end
                h = Minimum.Y
            end

            Self:Tween({ Position = UDim2.fromOffset(x, y) },
                TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out))
            Self:Tween({ Size = UDim2.fromOffset(w, h) },
                TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out))
        end)
    end

    Library.IsMouseOverFrame = function(Self)
        if not Self.Instance then
            return
        end

        local Object = Self.Instance

        local MousePosition = Vector2.new(Mouse.X, Mouse.Y)

        return MousePosition.X >= Object.AbsolutePosition.X and
            MousePosition.X <= Object.AbsolutePosition.X + Object.AbsoluteSize.X
            and MousePosition.Y >= Object.AbsolutePosition.Y and
            MousePosition.Y <= Object.AbsolutePosition.Y + Object.AbsoluteSize.Y
    end

    Library.CompareVectors = function(Self, PointA, PointB)
        return (PointA.X < PointB.X) or (PointA.Y < PointB.Y)
    end

    Library.IsClipped = function(Self, Column)
        if not Self.Instance then
            return
        end

        local Parent = Column
        local Object = Self.Instance

        local BoundryTop = Parent.AbsolutePosition
        local BoundryBottom = BoundryTop + Parent.AbsoluteSize

        local Top = Object.AbsolutePosition
        local Bottom = Top + Object.AbsoluteSize

        return Library:CompareVectors(Top, BoundryTop) or Library:CompareVectors(BoundryBottom, Bottom)
    end

    Library.SafeCall = function(Self, Function, ...)
        local Arguements = { ... }
        local Success, Result = pcall(Function, table.unpack(Arguements))

        if not Success then
            warn(Result)
            return false
        end

        return Success, Result
    end

    Library.BindToWindowVisibility = function(Self, Callback)
        if type(Callback) ~= "function" then
            return
        end

        table.insert(Library.WindowVisibilityBindings, Callback)
        Library:SafeCall(Callback, Library.WindowOpenState)
    end

    Library.ApplyWindowInputState = function(Self, Bool)
        if Self.InputBlocker and Self.InputBlocker.Instance then
            Self.InputBlocker.Instance.Visible = Bool and true or false
        end

        if Bool then
            ContextActionService:BindActionAtPriority(Self.InputBlockAction, function(_, State, Input)
                    if State ~= Enum.UserInputState.Begin and State ~= Enum.UserInputState.Change then
                        return Enum.ContextActionResult.Pass
                    end

                    if not Self.WindowOpenState or UserInputService:GetFocusedTextBox() then
                        return Enum.ContextActionResult.Pass
                    end

                    if Input and (tostring(Input.KeyCode) == Self.MenuKeybind or tostring(Input.UserInputType) == Self.MenuKeybind) then
                        return Enum.ContextActionResult.Pass
                    end

                    return Enum.ContextActionResult.Sink
                end, false, 5000,
                Enum.UserInputType.Gamepad1,
                Enum.UserInputType.Gamepad2,
                Enum.UserInputType.Gamepad3,
                Enum.UserInputType.Gamepad4,
                Enum.UserInputType.Gamepad5,
                Enum.UserInputType.Gamepad6,
                Enum.UserInputType.Gamepad7,
                Enum.UserInputType.Gamepad8,
                Enum.UserInputType.MouseWheel,
                Enum.UserInputType.MouseButton2,
                Enum.UserInputType.MouseButton3
            )

            ContextActionService:BindActionAtPriority(Self.InputBlockAction .. "_KEYS", function(_, State)
                if State ~= Enum.UserInputState.Begin and State ~= Enum.UserInputState.Change then
                    return Enum.ContextActionResult.Pass
                end

                if not Self.WindowOpenState or UserInputService:GetFocusedTextBox() then
                    return Enum.ContextActionResult.Pass
                end

                return Enum.ContextActionResult.Sink
            end, false, 5000, table.unpack(BlockedWindowInputs))
            return
        end

        ContextActionService:UnbindAction(Self.InputBlockAction)
        ContextActionService:UnbindAction(Self.InputBlockAction .. "_KEYS")
    end

    Library.SetWindowVisibilityState = function(Self, Bool)
        Library.WindowOpenState = Bool and true or false
        Library:ApplyWindowInputState(Library.WindowOpenState)

        if Library.WindowOpenState then
            Library.MouseStateBeforeOpen = {
                MouseBehavior = UserInputService.MouseBehavior,
                MouseIconEnabled = UserInputService.MouseIconEnabled,
            }
            UserInputService.MouseBehavior = Enum.MouseBehavior.Default
            UserInputService.MouseIconEnabled = false
        elseif Library.MouseStateBeforeOpen then
            UserInputService.MouseBehavior = Library.MouseStateBeforeOpen.MouseBehavior or Enum.MouseBehavior.Default
            UserInputService.MouseIconEnabled = Library.MouseStateBeforeOpen.MouseIconEnabled ~= false
            Library.MouseStateBeforeOpen = nil
        else
            UserInputService.MouseIconEnabled = true
        end

        if Library.MouseCursor and Library.MouseCursor.Instance then
            Library.MouseCursor.Instance.Visible = Library.WindowOpenState
        end

        if not Library.WindowOpenState then
            for _, OpenFrame in Library.OpenFrames do
                if OpenFrame and OpenFrame.IsOpen and OpenFrame.SetOpen then
                    OpenFrame:SetOpen(false)
                end
            end
        end

        for _, Callback in Library.WindowVisibilityBindings do
            Library:SafeCall(Callback, Library.WindowOpenState)
        end
    end

    Library.RegisterSettingsWidget = function(Self, Data)
        if type(Data) ~= "table" then
            return
        end

        local Name = Data.Name or Data.name
        local Callback = Data.Callback or Data.callback
        if type(Name) ~= "string" or type(Callback) ~= "function" then
            return
        end

        table.insert(Library.SettingsWidgets, {
            Name = Name,
            Flag = Data.Flag or Data.flag or ("UIWidget" .. Name:gsub("%s+", "")),
            Default = Data.Default ~= false,
            Callback = Callback,
            Settings = Data.Settings or Data.settings
        })
    end

    Library.SetupBackgroundEffects = function(Self)
        if Library.BackgroundEffects then
            return
        end

        local Background = Library:Create("Frame", {
            Name = "\0",
            Parent = Library.Holder.Instance,
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Position = UDim2.new(0, 0, 0, 0),
            Size = UDim2.new(1, 0, 1, 0),
            Visible = false,
            ZIndex = 0
        })

        local SnowHolder = Library:Create("Frame", {
            Name = "\0",
            Parent = Background.Instance,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ClipsDescendants = true,
            Position = UDim2.new(0, 0, 0, 0),
            Size = UDim2.new(1, 0, 1, 0),
            ZIndex = 0
        })

        local BlurEffect = Instance.new("BlurEffect")
        BlurEffect.Size = 0
        BlurEffect.Parent = Camera

        Library.BackgroundEffects = {
            Background = Background.Instance,
            SnowHolder = SnowHolder.Instance,
            BlurEffect = BlurEffect,
            SnowAsset = "http://www.roblox.com/asset/?id=6871196088",
            IsSnowing = false
        }

        Library:Thread(function()
            while Library and Library.BackgroundEffects do
                local Effects = Library.BackgroundEffects

                if not Effects.IsSnowing then
                    task.wait(0.1)
                    continue
                end

                local Holder = Effects.SnowHolder
                if not Holder or not Holder.Parent then
                    task.wait(0.1)
                    continue
                end

                local Width = Holder.AbsoluteSize.X
                local Height = Holder.AbsoluteSize.Y
                if Width <= 0 or Height <= 0 then
                    task.wait(0.1)
                    continue
                end

                local Image = Instance.new("ImageLabel")
                Image.Name = "\0"
                Image.Parent = Holder
                Image.BackgroundTransparency = 1
                Image.Image = Effects.SnowAsset
                Image.ZIndex = 0

                local RandomSize = math.random(5, 8)
                local SpawnX = math.random(0, math.max(0, Width - RandomSize))

                Image.Size = UDim2.new(0, RandomSize, 0, RandomSize)
                Image.Position = UDim2.new(0, SpawnX, 0, -10)

                local FallDuration = math.random(20, 40) / 10
                local SwayX = math.random(-18, 18)
                local GoalPosition = UDim2.new(0, SpawnX + SwayX, 0, Height + 10)

                local FallTween = TweenService:Create(Image,
                    TweenInfo.new(FallDuration, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                        Position = GoalPosition,
                        ImageTransparency = 1
                    })

                FallTween:Play()
                Library:Connect(FallTween.Completed, function()
                    if Image and Image.Parent then
                        Image:Destroy()
                    end
                end)

                task.wait(0.1)
            end
        end)
    end

    Library.SetBackgroundEffectsVisible = function(Self, Bool, Instant)
        local Effects = Library.BackgroundEffects
        if not Effects then
            return
        end

        local HasAnyEffect = Library.BackgroundBlurEnabled or Library.BackgroundSnowEnabled
        local IsVisible = Bool and true or false
        Effects.IsSnowing = IsVisible and Library.BackgroundSnowEnabled

        local TargetTransparency = (IsVisible and HasAnyEffect) and 0.5 or 1
        local TargetBlur = (IsVisible and Library.BackgroundBlurEnabled) and 20 or 0

        if IsVisible and HasAnyEffect then
            Effects.Background.Visible = true
        end

        if Instant then
            Effects.Background.BackgroundTransparency = TargetTransparency
            Effects.BlurEffect.Size = TargetBlur
        else
            local FadeTween = TweenService:Create(Effects.Background,
                TweenInfo.new(0.33, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    BackgroundTransparency = TargetTransparency
                })

            local BlurTween = TweenService:Create(Effects.BlurEffect,
                TweenInfo.new(0.33, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    Size = TargetBlur
                })

            FadeTween:Play()
            BlurTween:Play()
        end

        if (not IsVisible) or (not HasAnyEffect) then
            task.delay(0.35, function()
                if not Library or not Library.BackgroundEffects then
                    return
                end

                local CurrentEffects = Library.BackgroundEffects
                if CurrentEffects.IsSnowing then
                    return
                end

                CurrentEffects.Background.Visible = false

                for _, Child in CurrentEffects.SnowHolder:GetChildren() do
                    if Child:IsA("ImageLabel") then
                        Child:Destroy()
                    end
                end
            end)
        end
    end

    Library.SetBackgroundBlurEnabled = function(Self, Bool)
        Library.BackgroundBlurEnabled = Bool and true or false
        Library:SetBackgroundEffectsVisible(Library.WindowOpenState, true)
    end

    Library.SetBackgroundSnowEnabled = function(Self, Bool)
        Library.BackgroundSnowEnabled = Bool and true or false
        Library:SetBackgroundEffectsVisible(Library.WindowOpenState, true)
    end

    Library.Round = function(Self, Number, Float)
        local Multiplier = 1 / (Float or 1)
        return math.floor(Number * Multiplier) / Multiplier
    end

    Library.RegisterLayout = function(Self, Id, Data)
        if type(Id) ~= "string" or Id == "" or type(Data) ~= "table" or not Data.Instance then
            return
        end

        Library.LayoutRegistry[Id] = Data
        return Data
    end

    Library.GetLayoutConfig = function(Self)
        local Layout = {}

        for Id, Data in Library.LayoutRegistry do
            local Instance = Data and Data.Instance
            if not Instance or not Instance.Parent then
                continue
            end

            local Entry = {}
            local Position = Instance.Position

            if Data.SavePosition ~= false then
                Entry.Position = {
                    X = math.floor((tonumber(Position.X.Offset) or 0) + 0.5),
                    Y = math.floor((tonumber(Position.Y.Offset) or 0) + 0.5)
                }
            end

            if Data.SaveSize == true then
                local Size = Instance.Size
                Entry.Size = {
                    X = math.floor((tonumber(Size.X.Offset) or 0) + 0.5),
                    Y = math.floor((tonumber(Size.Y.Offset) or 0) + 0.5)
                }
            end

            if next(Entry) ~= nil then
                Layout[Id] = Entry
            end
        end

        return Layout
    end

    Library.ApplyLayoutConfig = function(Self, Layout)
        if type(Layout) ~= "table" then
            return
        end

        for Id, State in Layout do
            local Data = Library.LayoutRegistry[Id]
            local Instance = Data and Data.Instance
            if not Instance or not Instance.Parent or type(State) ~= "table" then
                continue
            end

            local ParentSize = Instance.Parent.AbsoluteSize
            local MinimumSize = Data.MinimumSize or Vector2.new(0, 0)
            local MaximumSize = Data.MaximumSize

            if Data.SaveSize == true and type(State.Size) == "table" then
                local MaxWidth = math.max(ParentSize.X, MinimumSize.X)
                local MaxHeight = math.max(ParentSize.Y, MinimumSize.Y)

                if typeof(MaximumSize) == "Vector2" then
                    MaxWidth = math.min(MaxWidth, MaximumSize.X)
                    MaxHeight = math.min(MaxHeight, MaximumSize.Y)
                end

                local Width = math.clamp(
                    tonumber(State.Size.X) or Instance.AbsoluteSize.X,
                    math.min(MinimumSize.X, MaxWidth),
                    MaxWidth
                )
                local Height = math.clamp(
                    tonumber(State.Size.Y) or Instance.AbsoluteSize.Y,
                    math.min(MinimumSize.Y, MaxHeight),
                    MaxHeight
                )

                Instance.Size = UDim2.fromOffset(
                    math.floor(Width + 0.5),
                    math.floor(Height + 0.5)
                )
            end

            if Data.SavePosition ~= false and type(State.Position) == "table" then
                local CurrentSize = Instance.AbsoluteSize
                local Width = CurrentSize.X > 0 and CurrentSize.X or (tonumber(Instance.Size.X.Offset) or 0)
                local Height = CurrentSize.Y > 0 and CurrentSize.Y or (tonumber(Instance.Size.Y.Offset) or 0)
                local X = tonumber(State.Position.X) or Instance.Position.X.Offset
                local Y = tonumber(State.Position.Y) or Instance.Position.Y.Offset

                Instance.AnchorPoint = Vector2.new(0, 0)
                Instance.Position = UDim2.fromOffset(
                    math.clamp(math.floor(X + 0.5), 0, math.max(ParentSize.X - Width, 0)),
                    math.clamp(math.floor(Y + 0.5), 0, math.max(ParentSize.Y - Height, 0))
                )
            end
        end
    end

    Library.GetConfig = function(Self)
        local Config = {}

        local Success, Result = Library:SafeCall(function()
            for Index, Value in Library.Flags do
                if type(Value) == "table" and Value.Key then
                    Config[Index] = { Key = tostring(Value.Key), Mode = Value.Mode, Toggled = Value.Toggled }
                elseif type(Value) == "table" and Value.Color then
                    Config[Index] = { Color = "#" .. Value.HexValue, Alpha = Value.Alpha }
                else
                    Config[Index] = Value
                end
            end
        end)

        if not Success then
            warn("Failed to get config:\n" .. Result)
            return
        end

        return HttpService:JSONEncode({
            Flags = Config,
            Layout = Library:GetLayoutConfig()
        })
    end

    Library.LoadConfig = function(Self, Config)
        local Decoded = HttpService:JSONDecode(Config)
        local FlagData = type(Decoded) == "table" and Decoded.Flags or Decoded
        local LayoutData = type(Decoded) == "table" and Decoded.Layout

        local Success, Result = Library:SafeCall(function()
            for Index, Value in FlagData do
                local SetFunction = Library.SetFlags[Index]

                if not SetFunction then
                    continue
                end

                if type(Value) == "table" and Value.Key then
                    SetFunction(Value)
                elseif type(Value) == "table" and Value.Color then
                    SetFunction(Value.Color, Value.Alpha)
                else
                    SetFunction(Value)
                end
            end

            for Index, Value in FlagData do
                if type(Value) ~= "table" or not Value.Key then
                    continue
                end

                local SetFunction = Library.SetFlags[Index]
                if not SetFunction then
                    continue
                end

                SetFunction(Value)
            end
        end)

        if Success and type(LayoutData) == "table" then
            task.defer(function()
                task.wait()
                Library:ApplyLayoutConfig(LayoutData)
            end)
        end

        return Success, Result
    end

    Library.GetConfigsList = function(Self, Element)
        local List = {}
        local ReturnList = {}

        List = listfiles(Library.Directory .. Library.Folders.Configs)

        for Index = 1, #List do
            local File = List[Index]

            if File:sub(-5) == ".json" then
                local Position = File:find(".json", 1, true)
                local StartPosition = Position

                local Character = File:sub(Position, Position)
                while Character ~= "/" and Character ~= "\\" and Character ~= "" do
                    Position = Position - 1
                    Character = File:sub(Position, Position)
                end

                if Character == "/" or Character == "\\" then
                    table.insert(ReturnList, File:sub(Position + 1, StartPosition - 1))
                end
            end
        end

        Element:Refresh(ReturnList)
    end

    Library.AddToTheme = function(Self, Properties)
        local Object = Self.Instance

        local ThemeData = {
            Item = Object,
            Properties = Properties,
        }

        for Property, Value in ThemeData.Properties do
            if type(Value) == "string" then
                if not Library.Theme[Value] then
                    Object[Property] = Value
                end

                Object[Property] = Library.Theme[Value]
            else
                Object[Property] = Value()
            end
        end

        table.insert(Library.ThemingStuff, ThemeData)
        Library.ThemeMap[Object] = ThemeData
        return Self
    end

    Library.ChangeItemTheme = function(Self, Properties)
        local Object = Self.Instance

        if not Library.ThemingStuff[Object] then
            return
        end

        Library.ThemingStuff[Object].Properties = Properties
        Library.ThemingStuff[Object] = Library.ThemeMap[Object]
    end

    Library.ChangeTheme = function(Self, Theme, Color)
        Library.Theme[Theme] = Color

        for _, Item in Library.ThemingStuff do
            for Property, Value in Item.Properties do
                if type(Value) == "string" and Value == Theme then
                    Item.Item[Property] = Color
                elseif type(Value) == "function" then
                    Item.Item[Property] = Value()
                end
            end
        end
    end

    Library.OnHover = function(Self, OnHoverEnter, OnHoverLeave)
        local Object = Self.Instance

        if not Object then
            return
        end

        Library:Connect(Object.MouseEnter, OnHoverEnter)
        Library:Connect(Object.MouseLeave, OnHoverLeave)
    end

    Library.GlobalUpdateOpenFrames = function(Self)
        local StaleEntries = {}

        for Key, Item in Library.OpenFrames do
            if not Item then
                table.insert(StaleEntries, Key)
                continue
            end

            local IsOpen = Item.IsOpen
            local AttachedButton = Item.AttachedButton
            local Frame = Item.Frame

            local CanUpdateNow = Item.CanUpdateNow

            if not IsOpen then
                table.insert(StaleEntries, Key)
                continue
            end

            if not CanUpdateNow then
                continue
            end

            if not AttachedButton or not AttachedButton.Parent or not Frame or not Frame.Parent then
                table.insert(StaleEntries, Key)
                continue
            end

            if CanUpdateNow and IsOpen then
                local ParentSize = Frame.Parent.AbsoluteSize
                local FrameSize = Frame.AbsoluteSize
                local X = AttachedButton.AbsolutePosition.X
                local Y = AttachedButton.AbsolutePosition.Y + AttachedButton.AbsoluteSize.Y + 10 + GuiInset

                if ParentSize.X > 0 and FrameSize.X > 0 then
                    X = math.clamp(X, 0, math.max(ParentSize.X - FrameSize.X, 0))
                end

                if ParentSize.Y > 0 and FrameSize.Y > 0 then
                    Y = math.clamp(Y, 0, math.max(ParentSize.Y - FrameSize.Y, 0))
                end

                Frame.Position = UDim2.fromOffset(X, Y)
            end
        end

        for _, Key in StaleEntries do
            Library.OpenFrames[Key] = nil
        end
    end

    Library.Holder = Library:Create("ScreenGui", {
        Parent = gethui(),
        Name = "\0",
        ZIndexBehavior = Enum.ZIndexBehavior.Global,
        IgnoreGuiInset = true,
        ResetOnSpawn = false
    })

    Library.InputBlocker = Library:Create("TextButton", {
        Parent = Library.Holder.Instance,
        Name = "\0",
        Visible = false,
        Modal = true,
        AutoButtonColor = false,
        Active = true,
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Text = "",
        ZIndex = 0
    })

    Library.MouseCursor = Library:Create("ImageLabel", {
        Parent = Library.Holder.Instance,
        Name = "\0",
        Visible = false,
        BackgroundTransparency = 1,
        Image = "http://www.roblox.com/asset/?id=5545698398",
        Size = UDim2.new(0, 36, 0, 36),
        ZIndex = 10000
    })

    Library.UnusedHolder = Library:Create("ScreenGui", {
        Parent = gethui(),
        Name = "\0",
        Enabled = false,
        ZIndexBehavior = Enum.ZIndexBehavior.Global,
        ResetOnSpawn = false
    })

    Library:SetupBackgroundEffects()
    Library:SetBackgroundEffectsVisible(false, true)

    Library.NotifHolder = Library:Create("Frame", {
        Name = "\0",
        Parent = Library.Holder.Instance,
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 0, 0, 10 + GuiInset),
        Size = UDim2.new(0, 0, 1, 0),
        BorderSizePixel = 0,
        AutomaticSize = Enum.AutomaticSize.X
    })

    Library:Create("UIListLayout", {
        Name = "\0",
        Parent = Library.NotifHolder.Instance,
        SortOrder = Enum.SortOrder.LayoutOrder,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        Padding = UDim.new(0, 6)
    })

    Library:Create("UIPadding", {
        Name = "\0",
        Parent = Library.NotifHolder.Instance,
        PaddingTop = UDim.new(0, 10),
        PaddingBottom = UDim.new(0, 8),
        PaddingRight = UDim.new(0, 8),
        PaddingLeft = UDim.new(0, 8)
    })

    Library:Connect(RunService.RenderStepped, function()
        local MouseCursor = Library.MouseCursor
        if not (MouseCursor and MouseCursor.Instance and Library.WindowOpenState) then
            return
        end

        local MouseLocation = UserInputService:GetMouseLocation()
        MouseCursor.Instance.Position = UDim2.new(0, MouseLocation.X - 18, 0, MouseLocation.Y - 18)
    end)

    do
        Library.CreateColorpicker = function(Self, Data)
            local Colorpicker = {
                Hue = 0,
                Saturation = 0,
                Value = 0,

                Alpha = 0,

                Color = Color3.fromRGB(255, 255, 255),
                HexValue = "#FFFFFF",

                Flag = Data.Flag,
                IsOpen = false,

                Items = {}
            }

            local Items = {}
            do
                Items["ColorpickerButton"] = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Data.Parent.Instance,
                    TextColor3 = Color3.fromRGB(0, 0, 0),
                    Text = "",
                    AutoButtonColor = false,
                    Size = UDim2.new(0, 22, 0, 12),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Color3.fromRGB(158, 255, 252)
                })

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["ColorpickerButton"].Instance,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    Color = Library.Theme["Border"]
                }):AddToTheme({ Color = 'Border' })

                Library:Create("UIGradient", {
                    Name = "\0",
                    Parent = Items["ColorpickerButton"].Instance,
                    Rotation = -90,
                    Color = ColorSequence.new {
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                        ColorSequenceKeypoint.new(1, Color3.fromRGB(172, 172, 172))
                    }
                })

                Items["ColorpickerWindow"] = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Library.UnusedHolder.Instance,
                    TextColor3 = Color3.fromRGB(0, 0, 0),
                    Text = "",
                    AutoButtonColor = false,
                    Position = UDim2.new(0, 1056, 0, 203),
                    Size = UDim2.new(0, 230, 0, 205),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Background"]
                }):AddToTheme({ BackgroundColor3 = 'Background' })

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["ColorpickerWindow"].Instance,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    Color = Library.Theme["Outline"]
                }):AddToTheme({ Color = 'Outline' })

                Items["AccentLiner"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["ColorpickerWindow"].Instance,
                    Size = UDim2.new(1, 0, 0, 1),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Accent"]
                }):AddToTheme({ BackgroundColor3 = 'Accent' })

                Items["Shadow"] = Library:Create("ImageLabel", {
                    Name = "\0",
                    Parent = Items["ColorpickerWindow"].Instance,
                    ImageColor3 = Color3.fromRGB(103, 164, 255),
                    ScaleType = Enum.ScaleType.Slice,
                    ImageTransparency = 0.699999988079071,
                    Size = UDim2.new(1, 25, 1, 25),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Image = "http://www.roblox.com/asset/?id=18245826428",
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0.5, 0, 0.5, 0),
                    ZIndex = -1,
                    BorderSizePixel = 0,
                    SliceCenter = Rect.new(Vector2.new(21, 21), Vector2.new(79, 79))
                })

                Items["Palette"] = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["ColorpickerWindow"].Instance,
                    TextColor3 = Color3.fromRGB(0, 0, 0),
                    Text = "",
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    AutoButtonColor = false,
                    Position = UDim2.new(0, 10, 0, 12),
                    Size = UDim2.new(1, -46, 1, -48),
                    BorderSizePixel = 0,
                })

                Items["Saturation"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["Palette"].Instance,
                    Size = UDim2.new(1, 0, 1, 0),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BorderSizePixel = 0
                })

                Library:Create("UIGradient", {
                    Name = "\0",
                    Parent = Items["Saturation"].Instance,
                    Transparency = NumberSequence.new {
                        NumberSequenceKeypoint.new(0, 1),
                        NumberSequenceKeypoint.new(1, 0)
                    }
                })

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["Palette"].Instance,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    Color = Library.Theme["Border"]
                }):AddToTheme({ Color = 'Border' })

                Items["Value"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["Palette"].Instance,
                    Size = UDim2.new(1, 0, 1, 0),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                })

                Library:Create("UIGradient", {
                    Name = "\0",
                    Parent = Items["Value"].Instance,
                    Rotation = 90,
                    Transparency = NumberSequence.new {
                        NumberSequenceKeypoint.new(0, 1),
                        NumberSequenceKeypoint.new(1, 0)
                    }
                })

                Items["PaletteDragger"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["Palette"].Instance,
                    Size = UDim2.new(0, 1, 0, 1),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BorderSizePixel = 0
                })

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["PaletteDragger"].Instance,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    Color = Library.Theme["Border"]
                }):AddToTheme({ Color = 'Border' })

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["ColorpickerWindow"].Instance,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    Color = Library.Theme["Border"],
                    BorderOffset = UDim.new(0, 1)
                }):AddToTheme({ Color = 'Border' })

                Items["Hue"] = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["ColorpickerWindow"].Instance,
                    TextColor3 = Color3.fromRGB(0, 0, 0),
                    Text = "",
                    AutoButtonColor = false,
                    AnchorPoint = Vector2.new(1, 0),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    Position = UDim2.new(1, -10, 0, 12),
                    Size = UDim2.new(0, 15, 1, -20),
                    BorderSizePixel = 0
                })

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["Hue"].Instance,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    Color = Library.Theme["Border"]
                }):AddToTheme({ Color = 'Border' })

                Library:Create("UIGradient", {
                    Name = "\0",
                    Parent = Items["Hue"].Instance,
                    Rotation = 90,
                    Color = ColorSequence.new {
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
                        ColorSequenceKeypoint.new(0.17, Color3.fromRGB(255, 255, 0)),
                        ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0, 255, 0)),
                        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 255)),
                        ColorSequenceKeypoint.new(0.67, Color3.fromRGB(0, 0, 255)),
                        ColorSequenceKeypoint.new(0.83, Color3.fromRGB(255, 0, 255)),
                        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0))
                    }
                })

                Items["HueDragger"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["Hue"].Instance,
                    Size = UDim2.new(1, 0, 0, 1),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BorderSizePixel = 0
                })

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["HueDragger"].Instance,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    Color = Library.Theme["Border"]
                }):AddToTheme({ Color = 'Border' })

                Items["Alpha"] = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    Parent = Items["ColorpickerWindow"].Instance,
                    TextColor3 = Color3.fromRGB(0, 0, 0),
                    Text = "",
                    AutoButtonColor = false,
                    AnchorPoint = Vector2.new(0, 1),
                    Position = UDim2.new(0, 10, 1, -10),
                    Size = UDim2.new(1, -46, 0, 15),
                    BorderSizePixel = 0
                })

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["Alpha"].Instance,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    Color = Library.Theme["Border"]
                }):AddToTheme({ Color = 'Border' })

                Items["AlphaColor"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["Alpha"].Instance,
                    Size = UDim2.new(1, 0, 1, 0),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Color3.fromRGB(158, 255, 252)
                })

                Library:Create("UIGradient", {
                    Name = "\0",
                    Parent = Items["AlphaColor"].Instance,
                    Transparency = NumberSequence.new {
                        NumberSequenceKeypoint.new(0, 1),
                        NumberSequenceKeypoint.new(1, 0)
                    }
                })

                Items["AlphaDragger"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["Alpha"].Instance,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    Size = UDim2.new(0, 1, 1, 0),
                    BorderSizePixel = 0
                })

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["AlphaDragger"].Instance,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    Color = Library.Theme["Border"]
                }):AddToTheme({ Color = 'Border' })

                Items["CopyPasteWindow"] = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Library.UnusedHolder.Instance,
                    TextColor3 = Color3.fromRGB(0, 0, 0),
                    Text = "",
                    AutoButtonColor = false,
                    Position = UDim2.new(0, 1056, 0, 203),
                    Size = UDim2.new(0, 96, 0, 44),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Background"],
                    Visible = false
                }):AddToTheme({ BackgroundColor3 = "Background" })

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["CopyPasteWindow"].Instance,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    Color = Library.Theme["Outline"]
                }):AddToTheme({ Color = "Outline" })

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["CopyPasteWindow"].Instance,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    Color = Library.Theme["Border"],
                    BorderOffset = UDim.new(0, 1)
                }):AddToTheme({ Color = "Border" })

                Items["CopyButton"] = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["CopyPasteWindow"].Instance,
                    TextColor3 = Library.Theme["Text"],
                    Text = "Copy",
                    AutoButtonColor = false,
                    Position = UDim2.new(0, 4, 0, 4),
                    Size = UDim2.new(1, -8, 0, 16),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Element"]
                }):AddToTheme({
                    BackgroundColor3 = "Element",
                    TextColor3 = "Text"
                })

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["CopyButton"].Instance,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    Color = Library.Theme["Border"],
                    BorderOffset = UDim.new(0, 1)
                }):AddToTheme({ Color = "Border" })

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["CopyButton"].Instance,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    Color = Library.Theme["Outline"]
                }):AddToTheme({ Color = "Outline" })

                Library:Create("UIGradient", {
                    Name = "\0",
                    Parent = Items["CopyButton"].Instance,
                    Rotation = -90,
                    Color = ColorSequence.new {
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                        ColorSequenceKeypoint.new(1, Color3.fromRGB(172, 172, 172))
                    }
                })

                Items["PasteButton"] = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["CopyPasteWindow"].Instance,
                    TextColor3 = Library.Theme["Text"],
                    Text = "Paste",
                    AutoButtonColor = false,
                    Position = UDim2.new(0, 4, 0, 24),
                    Size = UDim2.new(1, -8, 0, 16),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Element"]
                }):AddToTheme({
                    BackgroundColor3 = "Element",
                    TextColor3 = "Text"
                })

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["PasteButton"].Instance,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    Color = Library.Theme["Border"],
                    BorderOffset = UDim.new(0, 1)
                }):AddToTheme({ Color = "Border" })

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["PasteButton"].Instance,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    Color = Library.Theme["Outline"]
                }):AddToTheme({ Color = "Outline" })

                Library:Create("UIGradient", {
                    Name = "\0",
                    Parent = Items["PasteButton"].Instance,
                    Rotation = -90,
                    Color = ColorSequence.new {
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                        ColorSequenceKeypoint.new(1, Color3.fromRGB(172, 172, 172))
                    }
                })

                Colorpicker.Items = Items
            end

            function Colorpicker:SetVisibility(Bool)
                Items["ColorpickerButton"].Instance.Visible = Bool
            end

            function Colorpicker:Update(IsFromAlpha)
                local Hue, Saturation, Value = Colorpicker.Hue, Colorpicker.Saturation, Colorpicker.Value
                Colorpicker.Color = Color3.fromHSV(Hue, Saturation, Value)
                Colorpicker.HexValue = Colorpicker.Color:ToHex()

                Items["ColorpickerButton"]:Tween({ BackgroundColor3 = Colorpicker.Color })
                Items["Palette"]:Tween({ BackgroundColor3 = Color3.fromHSV(Hue, 1, 1) })

                Flags[Colorpicker.Flag] = {
                    Alpha = Colorpicker.Alpha,
                    Color = Colorpicker.Color,
                    HexValue = Colorpicker.HexValue,
                    Transparency = 1 - Colorpicker.Alpha
                }

                if not IsFromAlpha then
                    Items["AlphaColor"]:Tween({ BackgroundColor3 = Colorpicker.Color })
                end

                if Data.Callback then
                    Library:SafeCall(Data.Callback, Colorpicker.Color, Colorpicker.Alpha)
                end
            end

            local Debounce = false
            local RenderStepped
            local ColorpickerWindow = Items["ColorpickerWindow"].Instance
            local ColorpickerButton = Items["ColorpickerButton"].Instance
            local CopyPasteDebounce = false
            local CopyPasteWindow = Items["CopyPasteWindow"].Instance
            local CopyToClipboard = setclipboard or toclipboard

            Colorpicker.AttachedButton = ColorpickerButton
            Colorpicker.CanUpdateNow = false
            Colorpicker.Frame = ColorpickerWindow

            local function ResolveAttachedFramePosition(Frame)
                local Parent = Frame and Frame.Parent
                local ParentSize = Parent and Parent.AbsoluteSize or Vector2.new(0, 0)
                local FrameSize = Frame and Frame.AbsoluteSize or Vector2.new(0, 0)
                local X = ColorpickerButton.AbsolutePosition.X
                local Y = ColorpickerButton.AbsolutePosition.Y + ColorpickerButton.AbsoluteSize.Y + 10 + GuiInset

                if ParentSize.X > 0 and FrameSize.X > 0 then
                    X = math.clamp(X, 0, math.max(ParentSize.X - FrameSize.X, 0))
                end

                if ParentSize.Y > 0 and FrameSize.Y > 0 then
                    Y = math.clamp(Y, 0, math.max(ParentSize.Y - FrameSize.Y, 0))
                end

                return UDim2.fromOffset(X, Y)
            end

            local CopyPasteMenu = {
                IsOpen = false,
                AttachedButton = ColorpickerButton,
                CanUpdateNow = false,
                Frame = CopyPasteWindow
            }

            function CopyPasteMenu:SetOpen(Bool)
                if CopyPasteDebounce then
                    return
                end

                CopyPasteMenu.IsOpen = Bool and true or false
                CopyPasteDebounce = true

                if CopyPasteMenu.IsOpen then
                    if Colorpicker.IsOpen then
                        Colorpicker:SetOpen(false)
                    end

                    CopyPasteWindow.Parent = Library.Holder.Instance
                    CopyPasteWindow.Position = ResolveAttachedFramePosition(CopyPasteWindow)
                    CopyPasteWindow.Visible = true

                    Items["CopyPasteWindow"]:Tween({
                        Position = ResolveAttachedFramePosition(CopyPasteWindow)
                    })

                    Items["CopyPasteWindow"]:FadeDescendants(true, function()
                        CopyPasteMenu.CanUpdateNow = true
                        CopyPasteDebounce = false
                    end)

                    for _, Value in Library.OpenFrames do
                        if not Data.Section.IsSettings and Value ~= CopyPasteMenu then
                            Value:SetOpen(false)
                        end
                    end

                    Library.OpenFrames[CopyPasteMenu] = CopyPasteMenu
                else
                    Items["CopyPasteWindow"]:Tween({
                        Position = ResolveAttachedFramePosition(CopyPasteWindow)
                    })

                    Items["CopyPasteWindow"]:FadeDescendants(false, function()
                        CopyPasteWindow.Parent = Library.UnusedHolder.Instance
                        CopyPasteMenu.CanUpdateNow = false
                        CopyPasteDebounce = false
                    end)

                    if Library.OpenFrames[CopyPasteMenu] then
                        Library.OpenFrames[CopyPasteMenu] = nil
                    end
                end

                local Descendants = CopyPasteWindow:GetDescendants()
                table.insert(Descendants, CopyPasteWindow)

                for _, Value in Descendants do
                    if Value.ClassName:find("UI") then
                        continue
                    end

                    Value.ZIndex = CopyPasteMenu.IsOpen and 4 or 1
                end
            end

            function Colorpicker:SetOpen(Bool)
                if Debounce then
                    return
                end

                Colorpicker.IsOpen = Bool

                Debounce = true

                if Colorpicker.IsOpen then
                    ColorpickerWindow.Parent = Library.Holder.Instance
                    ColorpickerWindow.Position = ResolveAttachedFramePosition(ColorpickerWindow)
                    ColorpickerWindow.Visible = true
                    Items["ColorpickerWindow"]:Tween({
                        Position = ResolveAttachedFramePosition(ColorpickerWindow)
                    })

                    Items["ColorpickerWindow"]:FadeDescendants(true, function()
                        Colorpicker.CanUpdateNow = true
                        Debounce = false
                    end)

                    for Index, Value in Library.OpenFrames do
                        if not Data.Section.IsSettings then
                            Value:SetOpen(false)
                        end
                    end

                    Library.OpenFrames[Colorpicker] = Colorpicker
                else
                    Items["ColorpickerWindow"]:Tween({
                        Position = ResolveAttachedFramePosition(ColorpickerWindow)
                    })
                    Items["ColorpickerWindow"]:FadeDescendants(false, function()
                        ColorpickerWindow.Parent = Library.UnusedHolder.Instance
                        Colorpicker.CanUpdateNow = false
                        Debounce = false
                    end)

                    if Library.OpenFrames[Colorpicker] then
                        Library.OpenFrames[Colorpicker] = nil
                    end

                    if RenderStepped then
                        RenderStepped:Disconnect()
                        RenderStepped = nil
                    end
                end

                local Descendants = ColorpickerWindow:GetDescendants()
                table.insert(Descendants, ColorpickerWindow)

                for Index, Value in Descendants do
                    if Value.ClassName:find("UI") then
                        continue
                    end

                    Value.ZIndex = Colorpicker.IsOpen and 4 or 1
                end

                Items["PaletteDragger"].Instance.ZIndex = 5
                Items["HueDragger"].Instance.ZIndex = 5
                Items["AlphaDragger"].Instance.ZIndex = 5
                Items["Shadow"].Instance.ZIndex = 3
            end

            local SlidingPalette = false
            local PaletteChanged

            function Colorpicker:SlidePalette(Input)
                if not Input or not SlidingPalette then
                    return
                end

                local ValueX = math.clamp(
                    1 -
                    (Input.Position.X - Items["Palette"].Instance.AbsolutePosition.X) /
                    Items["Palette"].Instance.AbsoluteSize.X, 0, 1)
                local ValueY = math.clamp(
                    1 -
                    (Input.Position.Y - Items["Palette"].Instance.AbsolutePosition.Y) /
                    Items["Palette"].Instance.AbsoluteSize.Y, 0, 1)

                Colorpicker.Saturation = ValueX
                Colorpicker.Value = ValueY

                local SlideX = math.clamp(
                    (Input.Position.X - Items["Palette"].Instance.AbsolutePosition.X) /
                    Items["Palette"].Instance.AbsoluteSize.X, 0, 1)
                local SlideY = math.clamp(
                    (Input.Position.Y - Items["Palette"].Instance.AbsolutePosition.Y) /
                    Items["Palette"].Instance.AbsoluteSize.Y, 0, 1)

                Items["PaletteDragger"]:Tween({ Position = UDim2.new(SlideX, 0, SlideY, 0) },
                    TweenInfo.new(Library.Animation.Time, Enum.EasingStyle.Quart, Enum.EasingDirection.Out))
                Colorpicker:Update()
            end

            local SlidingHue = false
            local HueChanged

            function Colorpicker:SlideHue(Input)
                if not Input or not SlidingHue then
                    return
                end

                local ValueY = math.clamp(
                    (Input.Position.Y - Items["Hue"].Instance.AbsolutePosition.Y) / Items["Hue"].Instance.AbsoluteSize.Y,
                    0,
                    1)

                Colorpicker.Hue = ValueY

                local SlideY = math.clamp(
                    (Input.Position.Y - Items["Hue"].Instance.AbsolutePosition.Y) / Items["Hue"].Instance.AbsoluteSize.Y,
                    0,
                    1)

                Items["HueDragger"]:Tween({ Position = UDim2.new(0, 0, SlideY, 0) },
                    TweenInfo.new(Library.Animation.Time, Enum.EasingStyle.Quart, Enum.EasingDirection.Out))
                Colorpicker:Update()
            end

            local SlidingAlpha = false
            local AlphaChanged

            function Colorpicker:SlideAlpha(Input)
                if not Input or not SlidingAlpha then
                    return
                end

                local ValueX = math.clamp(
                    (Input.Position.X - Items["Alpha"].Instance.AbsolutePosition.X) /
                    Items["Alpha"].Instance.AbsoluteSize.X,
                    0, 1)

                Colorpicker.Alpha = ValueX

                local SlideX = math.clamp(
                    (Input.Position.X - Items["Alpha"].Instance.AbsolutePosition.X) /
                    Items["Alpha"].Instance.AbsoluteSize.X,
                    0, 1)

                Items["AlphaDragger"]:Tween({ Position = UDim2.new(SlideX, 0, 0, 0) },
                    TweenInfo.new(Library.Animation.Time, Enum.EasingStyle.Quart, Enum.EasingDirection.Out))
                Colorpicker:Update(true)
            end

            function Colorpicker:Set(Color, Alpha)
                if type(Color) == "table" then
                    Color = Color3.fromRGB(Color[1], Color[2], Color[3])
                elseif type(Color) == "string" then
                    Color = Color3.fromHex(Color)
                else
                    Color = Color -- lul
                end

                Colorpicker.Hue, Colorpicker.Saturation, Colorpicker.Value = Color:ToHSV()
                Colorpicker.Alpha = Alpha or 0

                local PaletteValueX = math.clamp(1 - Colorpicker.Saturation, 0, 1)
                local PaletteValueY = math.clamp(1 - Colorpicker.Value, 0, 1)

                local AlphaPositionX = math.clamp(Colorpicker.Alpha, 0, 1)

                local HuePositionY = math.clamp(Colorpicker.Hue, 0, 1)

                Items["PaletteDragger"]:Tween({ Position = UDim2.new(PaletteValueX, 0, PaletteValueY, 0) },
                    TweenInfo.new(Library.Animation.Time, Enum.EasingStyle.Quart, Enum.EasingDirection.Out))
                Items["HueDragger"]:Tween({ Position = UDim2.new(0, 0, HuePositionY, 0) },
                    TweenInfo.new(Library.Animation.Time, Enum.EasingStyle.Quart, Enum.EasingDirection.Out))
                Items["AlphaDragger"]:Tween({ Position = UDim2.new(AlphaPositionX, 0, 0, 0) },
                    TweenInfo.new(Library.Animation.Time, Enum.EasingStyle.Quart, Enum.EasingDirection.Out))
                Colorpicker:Update()
            end

            Items["ColorpickerButton"]:Connect("MouseButton1Down", function()
                if CopyPasteMenu.IsOpen then
                    CopyPasteMenu:SetOpen(false)
                end

                Colorpicker:SetOpen(not Colorpicker.IsOpen)
            end)

            Items["ColorpickerButton"]:Connect("MouseButton2Down", function()
                CopyPasteMenu:SetOpen(not CopyPasteMenu.IsOpen)
            end)

            Items["CopyButton"]:Connect("MouseButton1Down", function()
                Library.CopiedColor = Colorpicker.Color

                if CopyToClipboard then
                    pcall(CopyToClipboard, "#" .. Colorpicker.HexValue)
                end

                CopyPasteMenu:SetOpen(false)
            end)

            Items["PasteButton"]:Connect("MouseButton1Down", function()
                if Library.CopiedColor then
                    Colorpicker:Set(Library.CopiedColor, Colorpicker.Alpha)
                end

                CopyPasteMenu:SetOpen(false)
            end)

            Items["Palette"]:Connect("InputBegan", function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                    SlidingPalette = true

                    Colorpicker:SlidePalette(Input)

                    if PaletteChanged then
                        return
                    end

                    PaletteChanged = Input.Changed:Connect(function()
                        if Input.UserInputState == Enum.UserInputState.End then
                            SlidingPalette = false

                            PaletteChanged:Disconnect()
                            PaletteChanged = nil
                        end
                    end)
                end
            end)

            Items["Hue"]:Connect("InputBegan", function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                    SlidingHue = true

                    Colorpicker:SlideHue(Input)

                    if HueChanged then
                        return
                    end

                    HueChanged = Input.Changed:Connect(function()
                        if Input.UserInputState == Enum.UserInputState.End then
                            SlidingHue = false

                            HueChanged:Disconnect()
                            HueChanged = nil
                        end
                    end)
                end
            end)

            Items["Alpha"]:Connect("InputBegan", function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                    SlidingAlpha = true

                    Colorpicker:SlideAlpha(Input)

                    if AlphaChanged then
                        return
                    end

                    AlphaChanged = Input.Changed:Connect(function()
                        if Input.UserInputState == Enum.UserInputState.End then
                            SlidingAlpha = false

                            AlphaChanged:Disconnect()
                            AlphaChanged = nil
                        end
                    end)
                end
            end)

            Library:Connect(UserInputService.InputChanged, function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch then
                    if SlidingPalette then
                        Colorpicker:SlidePalette(Input)
                    end

                    if SlidingHue then
                        Colorpicker:SlideHue(Input)
                    end

                    if SlidingAlpha then
                        Colorpicker:SlideAlpha(Input)
                    end
                end
            end)

            Library:Connect(UserInputService.InputBegan, function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                    if not Colorpicker.IsOpen then
                        if CopyPasteMenu.IsOpen and not Items["CopyPasteWindow"]:IsMouseOverFrame() then
                            CopyPasteMenu:SetOpen(false)
                        end

                        return
                    end

                    if Items["ColorpickerWindow"]:IsMouseOverFrame() then
                        return
                    end

                    Colorpicker:SetOpen(false)
                end
            end)

            if Data.Default then
                Colorpicker:Set(Data.Default, Data.Alpha)
            end

            SetFlags[Colorpicker.Flag] = function(Value, Alpha)
                Colorpicker:Set(Value, Alpha)
            end

            return Colorpicker, Items
        end

        Library.CreateKeybind = function(Self, Data)
            local Keybind = {
                Flag = Data.Flag,
                IsOpen = false,

                Key = "",
                Mode = "",
                Value = "",

                Toggled = false,
                Picking = false,

                Items = {}
            }

            local Items = {}
            do
                Items["KeyButton"] = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Data.Parent.Instance,
                    TextColor3 = Library.Theme["Text"],
                    Text = "[...]",
                    AutoButtonColor = false,
                    BackgroundTransparency = 1,
                    Size = UDim2.new(0, 0, 1, 0),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.X
                }):AddToTheme({ TextColor3 = 'Text' })

                Items["KeybindWindow"] = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Library.UnusedHolder.Instance,
                    Visible = false,
                    TextColor3 = Color3.fromRGB(0, 0, 0),
                    Text = "",
                    AutoButtonColor = false,
                    Position = UDim2.new(0.7021276354789734, 0, 0.4859813153743744, 0),
                    Size = UDim2.new(0, 200, 0, 82),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Background"]
                }):AddToTheme({ BackgroundColor3 = 'Background' })

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["KeybindWindow"].Instance,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    Color = Library.Theme["Border"],
                    BorderOffset = UDim.new(0, 1)
                }):AddToTheme({ Color = 'Border' })

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["KeybindWindow"].Instance,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    Color = Library.Theme["Outline"]
                }):AddToTheme({ Color = 'Outline' })

                Items["AccentLiner"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["KeybindWindow"].Instance,
                    Size = UDim2.new(1, 0, 0, 1),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Accent"]
                }):AddToTheme({ BackgroundColor3 = 'Accent' })

                Keybind.Items = Items
            end

            local KeybindObject

            if Library.KeyList then
                KeybindObject = Library.KeyList:Add("", "", "")
            end

            local Update = function()
                if KeybindObject then
                    KeybindObject:SetStatus(Keybind.Toggled)
                    KeybindObject:Set(Keybind.Value, Data.Name, Keybind.Mode)
                end
            end

            local Debounce = false
            local RenderStepped
            local KeybindWindow = Items["KeybindWindow"].Instance
            local KeyButton = Items["KeyButton"].Instance

            Keybind.AttachedButton = KeyButton
            Keybind.CanUpdateNow = false
            Keybind.Frame = KeybindWindow

            local ModeDropdown = Library:Dropdown({
                Name = "Mode",
                Flag = Data.Flag .. "Mode",
                Parent = Items["KeybindWindow"],
                Items = { "Toggle", "Hold", "Always" },
                Default = "Toggle",
                Callback = function(Value)
                    Keybind.Mode = Value
                    if Value == "Always" then
                        Keybind.Toggled = true
                    end

                    Flags[Keybind.Flag] = {
                        Mode = Keybind.Mode,
                        Key = Keybind.Key,
                        Toggled = Keybind.Toggled
                    }

                    if Data.Callback then
                        Library:SafeCall(Data.Callback, Keybind.Toggled)
                    end

                    Update()
                end
            })

            local ShowInKeybindsList = Library:Toggle({
                Name = "Show in keybinds list",
                Flag = Data.Flag .. "ShowInKeybindsList",
                Parent = Items["KeybindWindow"],
                Default = true,
                Callback = function(Value)
                    if KeybindObject then
                        KeybindObject:SetVis(Value)
                        Update()
                    end
                end
            })

            ShowInKeybindsList.Items.Toggle.Instance.Position = UDim2.new(0, 8, 1, -8)
            ShowInKeybindsList.Items.Toggle.Instance.Size = UDim2.new(1, -16, 0, 12)
            ShowInKeybindsList.Items.Toggle.Instance.AnchorPoint = Vector2.new(0, 1)
            ShowInKeybindsList.Items.Indicator.Instance.Position = UDim2.new(0, 0, 0.5, 0)
            ShowInKeybindsList.Items.Text.Instance.Position = UDim2.new(0, 15, 0.5, -1)

            ModeDropdown.Items.Dropdown.Instance.Position = UDim2.new(0, 8, 0, 8)
            ModeDropdown.Items.Dropdown.Instance.Size = UDim2.new(1, -16, 0, 40)

            function Keybind:SetOpen(Bool)
                if Debounce then
                    return
                end

                Keybind.IsOpen = Bool

                Debounce = true

                if Keybind.IsOpen then
                    KeybindWindow.Position = UDim2.new(0, KeyButton.AbsolutePosition.X, 0,
                        KeyButton.AbsolutePosition.Y + KeyButton.AbsoluteSize.Y + GuiInset)

                    KeybindWindow.Parent = Library.Holder.Instance
                    KeybindWindow.Visible = true
                    Items["KeybindWindow"]:Tween({
                        Position = UDim2.new(0, KeyButton.AbsolutePosition.X, 0,
                            KeyButton.AbsolutePosition.Y + KeyButton.AbsoluteSize.Y + 10 + GuiInset)
                    })

                    Items["KeybindWindow"]:FadeDescendants(true, function()
                        Debounce = false
                        Keybind.CanUpdateNow = true
                    end)

                    for Index, Value in Library.OpenFrames do
                        if not Data.Section.IsSettings then
                            Value:SetOpen(false)
                        end
                    end

                    Library.OpenFrames[Keybind] = Keybind
                else
                    Items["KeybindWindow"]:Tween({
                        Position = UDim2.new(0, KeyButton.AbsolutePosition.X, 0,
                            KeyButton.AbsolutePosition.Y + KeyButton.AbsoluteSize.Y - 10 + GuiInset)
                    })
                    Items["KeybindWindow"]:FadeDescendants(false, function()
                        Items["KeybindWindow"].Instance.Parent = Library.UnusedHolder.Instance
                        Debounce = false
                        Keybind.CanUpdateNow = false
                    end)

                    if Library.OpenFrames[Keybind] then
                        Library.OpenFrames[Keybind] = nil
                    end

                    if RenderStepped then
                        RenderStepped:Disconnect()
                        RenderStepped = nil
                    end
                end

                local Descendants = KeybindWindow:GetDescendants()
                table.insert(Descendants, KeybindWindow)

                for Index, Value in Descendants do
                    if Value.ClassName:find("UI") then
                        continue
                    end

                    Value.ZIndex = Keybind.IsOpen and 4 or 1
                end
            end

            function Keybind:SetMode(Mode)
                ModeDropdown:Set(Mode)
                if Mode == "Always" then
                    Keybind.Toggled = true
                end

                Flags[Keybind.Flag] = {
                    Mode = Keybind.Mode,
                    Key = Keybind.Key,
                    Toggled = Keybind.Toggled
                }

                if Data.Callback then
                    Library:SafeCall(Data.Callback, Keybind.Toggled)
                end

                Update()
            end

            function Keybind:Press(Bool)
                if Keybind.Mode == "Toggle" then
                    Keybind.Toggled = not Keybind.Toggled
                elseif Keybind.Mode == "Hold" then
                    Keybind.Toggled = Bool
                elseif Keybind.Mode == "Always" then
                    Keybind.Toggled = true
                end

                Flags[Keybind.Flag] = {
                    Mode = Keybind.Mode,
                    Key = Keybind.Key,
                    Toggled = Keybind.Toggled
                }

                if Data.Callback then
                    Library:SafeCall(Data.Callback, Keybind.Toggled)
                end

                Update()
            end

            function Keybind:Set(Key)
                if string.find(tostring(Key), "Enum") then
                    Keybind.Key = tostring(Key)

                    Key = Key.Name == "Backspace" and "None" or Key.Name

                    local KeyString = Keys[Keybind.Key] or string.gsub(Key, "Enum.", "") or "None"
                    local TextToDisplay = string.gsub(string.gsub(KeyString, "KeyCode.", ""), "UserInputType.", "") or
                        "None"

                    Keybind.Value = TextToDisplay
                    Items["KeyButton"].Instance.Text = "[" .. TextToDisplay .. "]"

                    Flags[Keybind.Flag] = {
                        Mode = Keybind.Mode,
                        Key = Keybind.Key,
                        Toggled = Keybind.Toggled
                    }

                    if Data.Callback then
                        Library:SafeCall(Data.Callback, Keybind.Toggled)
                    end

                    Update()
                elseif type(Key) == "table" then
                    local RealKey = Key.Key == "Backspace" and "None" or Key.Key
                    Keybind.Key = tostring(Key.Key)

                    if Key.Mode then
                        Keybind.Mode = Key.Mode
                        Keybind:SetMode(Key.Mode)
                    else
                        Keybind.Mode = "Toggle"
                        Keybind:SetMode("Toggle")
                    end

                    local KeyString = Keys[Keybind.Key] or string.gsub(tostring(RealKey), "Enum.", "") or RealKey
                    local TextToDisplay = KeyString and
                        string.gsub(string.gsub(KeyString, "KeyCode.", ""), "UserInputType.", "") or "None"

                    TextToDisplay = string.gsub(string.gsub(KeyString, "KeyCode.", ""), "UserInputType.", "")

                    Keybind.Value = TextToDisplay
                    Items["KeyButton"].Instance.Text = "[" .. TextToDisplay .. "]"
                    if Keybind.Mode == "Always" then
                        Keybind.Toggled = true
                    elseif type(Key.Toggled) == "boolean" then
                        Keybind.Toggled = Key.Toggled
                    end

                    Flags[Keybind.Flag] = {
                        Mode = Keybind.Mode,
                        Key = Keybind.Key,
                        Toggled = Keybind.Toggled
                    }

                    if Data.Callback then
                        Library:SafeCall(Data.Callback, Keybind.Toggled)
                    end

                    Update()
                elseif table.find({ "Toggle", "Hold", "Always" }, Key) then
                    Keybind.Mode = Key
                    Keybind:SetMode(Key)

                    if Data.Callback then
                        Library:SafeCall(Data.Callback, Keybind.Toggled)
                    end

                    Update()
                end

                Keybind.Picking = false
            end

            Items["KeyButton"]:Connect("MouseButton1Click", function()
                if Keybind.Disabled then
                    return
                end

                Keybind.Picking = true

                Items["KeyButton"].Instance.Text = "press a key"

                local InputBegan
                InputBegan = UserInputService.InputBegan:Connect(function(Input)
                    if Input.UserInputType == Enum.UserInputType.Keyboard then
                        Keybind:Set(Input.KeyCode)
                    else
                        Keybind:Set(Input.UserInputType)
                    end

                    InputBegan:Disconnect()
                    InputBegan = nil
                end)
            end)

            Library:Connect(UserInputService.InputBegan, function(Input, GPE)
                if Keybind.Value == "None" then
                    return
                end

                if not GPE then
                    if tostring(Input.KeyCode) == Keybind.Key then
                        if Keybind.Mode == "Toggle" then
                            Keybind:Press()
                        elseif Keybind.Mode == "Hold" then
                            Keybind:Press(true)
                        elseif Keybind.Mode == "Always" then
                            Keybind:Press(true)
                        end
                    elseif tostring(Input.UserInputType) == Keybind.Key then
                        if Keybind.Mode == "Toggle" then
                            Keybind:Press()
                        elseif Keybind.Mode == "Hold" then
                            Keybind:Press(true)
                        elseif Keybind.Mode == "Always" then
                            Keybind:Press(true)
                        end
                    end
                end

                if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                    if not Keybind.IsOpen then
                        return
                    end

                    if Items["KeybindWindow"]:IsMouseOverFrame() or ModeDropdown.Items.OptionHolder:IsMouseOverFrame() then
                        return
                    end

                    Keybind:SetOpen(false)
                end
            end)

            Library:Connect(UserInputService.InputEnded, function(Input, GPE)
                if GPE then
                    return
                end

                if Keybind.Value == "None" then
                    return
                end

                if tostring(Input.KeyCode) == Keybind.Key then
                    if Keybind.Mode == "Hold" then
                        Keybind:Press(false)
                    elseif Keybind.Mode == "Always" then
                        Keybind:Press(true)
                    end
                elseif tostring(Input.UserInputType) == Keybind.Key then
                    if Keybind.Mode == "Hold" then
                        Keybind:Press(false)
                    elseif Keybind.Mode == "Always" then
                        Keybind:Press(true)
                    end
                end
            end)

            Items["KeyButton"]:Connect("MouseButton2Down", function()
                Keybind:SetOpen(not Keybind.IsOpen)
            end)

            if Data.Default then
                Keybind:Set({
                    Mode = Data.Mode or "Toggle",
                    Key = Data.Default,
                })
            end

            SetFlags[Keybind.Flag] = function(Value)
                Keybind:Set(Value)
            end

            return Keybind, Items
        end

        Library.Watermark = function(Self, Params)
            local Watermark = {}
            local PrefixText = tostring((Params and Params.Name) or "niggahack")
            local WatermarkTick = tick()
            local WatermarkFps = 0
            local WatermarkDisplayedFps = 0
            local WatermarkStatsText = ""
            local DynamicTextProvider = nil
            local DynamicText = PrefixText
            local DynamicTextTick = 0
            local WatermarkLastShimmerTime = tick()
            local WatermarkShimmerPhase = 0

            local Items = {}
            do
                Items["Watermark"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Library.Holder.Instance,
                    AnchorPoint = Vector2.new(0.5, 0),
                    Position = UDim2.new(0.5, 0, 0, 42),
                    Size = UDim2.new(0, 0, 0, 25),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.X,
                    BackgroundColor3 = Library.Theme["Background"]
                }):AddToTheme({ BackgroundColor3 = 'Background' })

                Items["Watermark"]:MakeDraggable()

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["Watermark"].Instance,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    Color = Library.Theme["Outline"]
                }):AddToTheme({ Color = 'Outline' })

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["Watermark"].Instance,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    Color = Library.Theme["Border"],
                    BorderOffset = UDim.new(0, 1)
                }):AddToTheme({ Color = 'Border' })

                Items["DarkLiner"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["Watermark"].Instance,
                    Position = UDim2.new(0, -8, 0, 1),
                    Size = UDim2.new(1, 16, 0, 1),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Light Border"]
                }):AddToTheme({ BackgroundColor3 = 'Light Border' })

                Items["AccentLiner"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["Watermark"].Instance,
                    Position = UDim2.new(0, -8, 0, 0),
                    Size = UDim2.new(1, 16, 0, 1),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Accent"]
                }):AddToTheme({ BackgroundColor3 = 'Accent' })

                Items["AccentGradient"] = Library:Create("UIGradient", {
                    Name = "\0",
                    Parent = Items["AccentLiner"].Instance,
                    Offset = Vector2.new(0, 0),
                    Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 0),
                        NumberSequenceKeypoint.new(0.5, 1),
                        NumberSequenceKeypoint.new(1, 0),
                    })
                })

                Items["Text"] = Library:Create("TextLabel", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["Watermark"].Instance,
                    RichText = true,
                    TextColor3 = Library.Theme["Text"],
                    Text = PrefixText,
                    AnchorPoint = Vector2.new(0, 0.5),
                    Size = UDim2.new(0, 0, 0, 15),
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0, 0, 0.5, 0),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.X
                }):AddToTheme({ TextColor3 = 'Text' })

                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["Watermark"].Instance,
                    PaddingRight = UDim.new(0, 8),
                    PaddingLeft = UDim.new(0, 8)
                })
            end

            function Watermark:SetVisibility(Bool)
                Items["Watermark"].Instance.Visible = Bool
            end

            function Watermark:Center()
                local AbsPos = Items["Watermark"].Instance.AbsolutePosition
                Items["Watermark"].Instance.AnchorPoint = Vector2.new(0, 0)
                task.wait()
                Items["Watermark"].Instance.Position = UDim2.new(0, AbsPos.X, 0, AbsPos.Y + GuiInset)
            end

            function Watermark:SetText(Text)
                DynamicTextProvider = nil
                PrefixText = tostring(Text or "")
                DynamicText = PrefixText
                Items["Text"].Instance.Text = PrefixText
            end

            function Watermark:SetDynamicTextProvider(Callback)
                DynamicTextProvider = type(Callback) == "function" and Callback or nil
                DynamicTextTick = 0
                DynamicText = PrefixText
            end

            function Watermark:SetName(Text)
                self:SetText(Text)
            end

            function Watermark:GetBounds()
                local Instance = Items["Watermark"].Instance
                return Instance.AbsolutePosition, Instance.AbsoluteSize
            end

            Library:RegisterLayout("Watermark", {
                Instance = Items["Watermark"].Instance
            })

            Library:Connect(RunService.RenderStepped, function()
                if not Items["Watermark"].Instance.Visible then
                    return
                end

                local CurrentTick = tick()
                WatermarkFps += 1

                if CurrentTick - WatermarkLastShimmerTime >= (1 / 30) then
                    WatermarkShimmerPhase = (WatermarkShimmerPhase + (CurrentTick - WatermarkLastShimmerTime) * (1 / 1.2)) %
                        1
                    WatermarkLastShimmerTime = CurrentTick
                    if DynamicTextProvider and (CurrentTick - DynamicTextTick) >= 0.25 then
                        DynamicTextTick = CurrentTick
                        DynamicText = tostring(DynamicTextProvider(WatermarkDisplayedFps) or "")
                    end
                    local PlainText = DynamicTextProvider and DynamicText or (PrefixText .. WatermarkStatsText)
                    local ShineWidth = 6
                    local ShinePos = WatermarkShimmerPhase * (#PlainText + ShineWidth)
                    local Rich = {}
                    for Index = 1, #PlainText do
                        local Distance = math.abs(Index - ShinePos)
                        local Alpha = math.clamp(1 - (Distance / ShineWidth), 0, 1)
                        local Color = Library.Theme["Text"]:Lerp(Library.Theme["Accent"], Alpha)
                        Rich[#Rich + 1] = string.format(
                            '<font color="rgb(%d,%d,%d)">%s</font>',
                            math.floor(Color.R * 255),
                            math.floor(Color.G * 255),
                            math.floor(Color.B * 255),
                            PlainText:sub(Index, Index)
                        )
                    end

                    Items["AccentGradient"].Instance.Offset = Vector2.new((WatermarkShimmerPhase * 2) - 1, 0)
                    Items["Text"].Instance.Text = table.concat(Rich)
                end

                if CurrentTick - WatermarkTick >= 1 then
                    WatermarkTick = CurrentTick
                    WatermarkDisplayedFps = WatermarkFps
                    if not DynamicTextProvider then
                        WatermarkStatsText = string.format(
                            ' / %s / %sfps',
                            os.date("%a %b %d %X %Y"),
                            WatermarkDisplayedFps
                        )
                    else
                        WatermarkStatsText = ""
                    end
                    WatermarkFps = 0
                end
            end)

            Watermark:Center()

            return Watermark
        end

        Library.KeybindList = function(Self, Params)
            local KeybindList = {}
            Library.KeyList = KeybindList

            local Items = {}
            do
                Items["KeybindList"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Library.Holder.Instance,
                    AnchorPoint = Vector2.new(0, 0.5),
                    Position = UDim2.new(0, 10, 0.5, 0),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.XY,
                    BackgroundColor3 = Library.Theme["Background"]
                }):AddToTheme({ BackgroundColor3 = 'Background' })

                Items["KeybindList"]:MakeDraggable()

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["KeybindList"].Instance,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    Color = Library.Theme["Outline"]
                }):AddToTheme({ Color = 'Outline' })

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["KeybindList"].Instance,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    Color = Library.Theme["Border"],
                    BorderOffset = UDim.new(0, 1)
                }):AddToTheme({ Color = 'Border' })

                Items["Text"] = Library:Create("TextLabel", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["KeybindList"].Instance,
                    TextColor3 = Library.Theme["Text"],
                    Text = Params.Name,
                    BackgroundTransparency = 1,
                    Size = UDim2.new(0, 0, 0, 15),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.X
                }):AddToTheme({ TextColor3 = 'Text' })

                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["KeybindList"].Instance,
                    PaddingTop = UDim.new(0, 4),
                    PaddingBottom = UDim.new(0, 4),
                    PaddingRight = UDim.new(0, 8),
                    PaddingLeft = UDim.new(0, 8)
                })

                Items["AccentLiner"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["KeybindList"].Instance,
                    Position = UDim2.new(0, -2, 0, 20),
                    Size = UDim2.new(1, 4, 0, 1),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Accent"]
                }):AddToTheme({ BackgroundColor3 = 'Accent' })

                Items["Content"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["KeybindList"].Instance,
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0, 0, 0, 25),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.XY
                })

                Library:Create("UIListLayout", {
                    Name = "\0",
                    Parent = Items["Content"].Instance,
                    Padding = UDim.new(0, 2),
                    SortOrder = Enum.SortOrder.LayoutOrder
                })

                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["KeybindList"].Instance,
                    PaddingTop = UDim.new(0, 4),
                    PaddingBottom = UDim.new(0, 4),
                    PaddingRight = UDim.new(0, 8),
                    PaddingLeft = UDim.new(0, 8)
                })
            end

            function KeybindList:SetVisibility(Bool)
                Items["KeybindList"].Instance.Visible = Bool
            end

            function KeybindList:Center()
                local AbsPos = Items["KeybindList"].Instance.AbsolutePosition
                Items["KeybindList"].Instance.AnchorPoint = Vector2.new(0, 0)
                task.wait()
                Items["KeybindList"].Instance.Position = UDim2.new(0, AbsPos.X, 0, AbsPos.Y + GuiInset)
            end

            function KeybindList:SetText(Text)
                Items["KeybindList"].Instance.Text = Text
            end

            function KeybindList:Add(Key, Name, Mode)
                local CanShowInKeybindsList = true

                local NewKey = Library:Create("TextLabel", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["Content"].Instance,
                    TextColor3 = Library.Theme["Text"],
                    Text = Key .. " - " .. Name .. " - " .. Mode,
                    BackgroundTransparency = 1,
                    Size = UDim2.new(0, 0, 0, 15),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.X
                }):AddToTheme({ TextColor3 = 'Text' })

                function NewKey:Set(Key, Name, Mode)
                    NewKey.Instance.Text = Key .. " - " .. Name .. " - " .. Mode
                end

                function NewKey:SetStatus(Bool)
                    if not CanShowInKeybindsList then
                        Bool = false
                    end

                    NewKey.Instance.Visible = Bool
                end

                function NewKey:SetVis(Bool)
                    CanShowInKeybindsList = Bool
                end

                return NewKey
            end

            KeybindList.Items = Items

            Library:RegisterLayout("KeybindList", {
                Instance = Items["KeybindList"].Instance
            })

            return KeybindList
        end

        Library.Notification = function(Self, Name, Duration, Color)
            local Items = {}
            do
                Items["Notification"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Library.NotifHolder.Instance,
                    Size = UDim2.new(0, 0, 0, 20),
                    Position = UDim2.new(0, 471, 0, 678),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.X,
                    BackgroundColor3 = Library.Theme["Section"]
                }):AddToTheme({ BackgroundColor3 = 'Section' })

                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["Notification"].Instance,
                    PaddingRight = UDim.new(0, 8),
                    PaddingLeft = UDim.new(0, 8)
                })

                Items["Stroke"] = Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["Notification"].Instance,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    Color = Library.Theme["Border"],
                    BorderOffset = UDim.new(0, 1)
                }):AddToTheme({ Color = 'Border' })

                Items["Stroke1"] = Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["Notification"].Instance,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    Color = Library.Theme["Outline"]
                }):AddToTheme({ Color = 'Outline' })

                Items["AccentLiner"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["Notification"].Instance,
                    Position = UDim2.new(0, -8, 0, 0),
                    Size = UDim2.new(0, 1, 1, 0),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Color
                })

                Items["Text"] = Library:Create("TextLabel", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["Notification"].Instance,
                    TextColor3 = Library.Theme["Text"],
                    Text = Name,
                    AnchorPoint = Vector2.new(0, 0.5),
                    Size = UDim2.new(0, 0, 0, 15),
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0, 2, 0.5, -1),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.X
                }):AddToTheme({ TextColor3 = 'Text' })
            end

            for Index, Value in Items do
                if Value.Instance:IsA("Frame") then
                    Value.Instance.BackgroundTransparency = 1
                elseif Value.Instance:IsA("TextLabel") then
                    Value.Instance.TextTransparency = 1
                elseif Value.Instance:IsA("UIStroke") then
                    Value.Instance.Transparency = 1
                end
            end

            local GetSize = function()
                local AbsSize = Items["Notification"].Instance.AbsoluteSize
                Items["Notification"].Instance.AutomaticSize = Enum.AutomaticSize.None
                task.wait()
                Items["Notification"].Instance.Size = UDim2.new(0, AbsSize.X, 0, AbsSize.Y)
                return AbsSize
            end

            local Size = GetSize()
            task.wait()
            Items["Notification"].Instance.Size = UDim2.new(0, 0, 0, Size.Y)

            local Info = TweenInfo.new(0.85, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false, 0)

            Library:Thread(function()
                for Index, Value in Items do
                    if Value.Instance:IsA("Frame") then
                        Value:Tween({ BackgroundTransparency = 0 }, Info)
                    elseif Value.Instance:IsA("TextLabel") then
                        Value:Tween({ TextTransparency = 0 }, Info)
                    elseif Value.Instance:IsA("UIStroke") then
                        Value:Tween({ Transparency = 0 }, Info)
                    end
                end

                Items["Notification"]:Tween({ Size = UDim2.new(0, Size.X, 0, Size.Y) }, Info)

                task.delay(Duration + 0.1, function()
                    for Index, Value in Items do
                        if Value.Instance:IsA("Frame") then
                            Value:Tween({ BackgroundTransparency = 1 })
                        elseif Value.Instance:IsA("TextLabel") then
                            Value:Tween({ TextTransparency = 1 })
                        elseif Value.Instance:IsA("UIStroke") then
                            Value:Tween({ Transparency = 1 })
                        end
                    end

                    Items["Notification"]:Tween({ Size = UDim2.new(0, 0, 0, Size.Y) }, Info)
                    task.wait(0.5)
                    Items["Notification"].Instance:Destroy()
                end)
            end)
        end

        Library.Playerlist = function(Self, Params)
            local Playerlist = {
                Items = {},
                IsSettings = true,
                Players = {},
                Selected = nil,
            }

            local Items = {}
            do
                Items["Playerlist"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Library.Holder.Instance,
                    Size = UDim2.new(0, 461, 0, 403),
                    Position = UDim2.new(0, 828, 0, 99),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.Y,
                    BackgroundColor3 = Library.Theme["Background"]
                }):AddToTheme({ BackgroundColor3 = 'Background' })

                Items["Playerlist"]:MakeDraggable()

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["Playerlist"].Instance,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    Color = Library.Theme["Border"],
                    BorderOffset = UDim.new(0, 1)
                }):AddToTheme({ Color = 'Border' })

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["Playerlist"].Instance,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    Color = Library.Theme["Outline"]
                }):AddToTheme({ Color = 'Outline' })

                Items["AccentLiner"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["Playerlist"].Instance,
                    Size = UDim2.new(1, 0, 0, 1),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Accent"]
                }):AddToTheme({ BackgroundColor3 = 'Accent' })

                Items["DarkLiner"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["Playerlist"].Instance,
                    Position = UDim2.new(0, 0, 0, 1),
                    Size = UDim2.new(1, 0, 0, 1),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Light Border"]
                }):AddToTheme({ BackgroundColor3 = 'Light Border' })

                Items["Background"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["Playerlist"].Instance,
                    Position = UDim2.new(0, 10, 0, 30),
                    Size = UDim2.new(1, -20, 1, -90),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Section"]
                }):AddToTheme({ BackgroundColor3 = 'Section' })

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["Background"].Instance,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    Color = Library.Theme["Outline"]
                }):AddToTheme({ Color = 'Outline' })

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["Background"].Instance,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    Color = Library.Theme["Border"],
                    BorderOffset = UDim.new(0, 1)
                }):AddToTheme({ Color = 'Border' })

                Items["Holder"] = Library:Create("ScrollingFrame", {
                    Name = "\0",
                    Parent = Items["Background"].Instance,
                    Active = true,
                    AutomaticCanvasSize = Enum.AutomaticSize.Y,
                    BorderSizePixel = 0,
                    CanvasSize = UDim2.new(0, 0, 0, 0),
                    ScrollBarImageColor3 = Library.Theme["Accent"],
                    MidImage = "rbxassetid://129030709932941",
                    ScrollBarThickness = 1,
                    Size = UDim2.new(1, -16, 1, -16),
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0, 8, 0, 8),
                    BottomImage = "rbxassetid://129030709932941",
                    TopImage = "rbxassetid://129030709932941"
                }):AddToTheme({ ScrollBarImageColor3 = 'Accent' })

                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["Holder"].Instance,
                    PaddingTop = UDim.new(0, -4),
                    PaddingRight = UDim.new(0, 8)
                })

                Library:Create("UIListLayout", {
                    Name = "\0",
                    Parent = Items["Holder"].Instance,
                    Padding = UDim.new(0, 8),
                    SortOrder = Enum.SortOrder.LayoutOrder
                })

                Items["Content"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["Playerlist"].Instance,
                    AnchorPoint = Vector2.new(0, 1),
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0, 10, 1, 0),
                    Size = UDim2.new(1, -20, 0, 0),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.Y
                })

                Library:Create("UIListLayout", {
                    Name = "\0",
                    Parent = Items["Content"].Instance,
                    Padding = UDim.new(0, 6),
                    SortOrder = Enum.SortOrder.LayoutOrder
                })

                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["Content"].Instance,
                    PaddingBottom = UDim.new(0, 10)
                })

                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["Playerlist"].Instance
                })

                Items["Text"] = Library:Create("TextLabel", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["Playerlist"].Instance,
                    TextColor3 = Library.Theme["Accent"],
                    Text = Params.Name,
                    Size = UDim2.new(0, 0, 0, 15),
                    Position = UDim2.new(0, 10, 0, 6),
                    BackgroundTransparency = 1,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.X
                }):AddToTheme({ TextColor3 = 'Accent' })

                Playerlist.Items = Items
            end

            function Playerlist:Add(Player)
                local PlayerName = Player.Name
                local PlayerDisplay = Player.DisplayName or PlayerName
                local PlayerUserID = Player.UserId

                local PlayerItems = {}
                do
                    PlayerItems["NewPlayer"] = Library:Create("TextButton", {
                        Name = "\0",
                        FontFace = Library.Font,
                        TextSize = Library.FontSize,
                        Parent = Items["Holder"].Instance,
                        TextColor3 = Color3.fromRGB(0, 0, 0),
                        Text = "",
                        AutoButtonColor = false,
                        BackgroundTransparency = 1,
                        Size = UDim2.new(1, 0, 0, 20),
                        BorderSizePixel = 0
                    })

                    PlayerItems["Username"] = Library:Create("TextLabel", {
                        Name = "\0",
                        FontFace = Library.Font,
                        TextSize = Library.FontSize,
                        Parent = PlayerItems["NewPlayer"].Instance,
                        TextWrapped = true,
                        TextColor3 = Library.Theme["Text"],
                        Text = PlayerDisplay .. " (" .. PlayerName .. ")",
                        Size = UDim2.new(0, 0, 0, 15),
                        AnchorPoint = Vector2.new(0, 0.5),
                        BorderSizePixel = 0,
                        BackgroundTransparency = 1,
                        Position = UDim2.new(0, 0, 0.5, 0),
                        AutomaticSize = Enum.AutomaticSize.X
                    }):AddToTheme({ TextColor3 = 'Text' })

                    PlayerItems["UserID"] = Library:Create("TextLabel", {
                        Name = "\0",
                        FontFace = Library.Font,
                        TextSize = Library.FontSize,
                        Parent = PlayerItems["NewPlayer"].Instance,
                        TextWrapped = true,
                        TextColor3 = Library.Theme["Text"],
                        Text = tostring(PlayerUserID),
                        Size = UDim2.new(0, 0, 0, 15),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        BorderSizePixel = 0,
                        BackgroundTransparency = 1,
                        Position = UDim2.new(0.5, 0, 0.5, 0),
                        AutomaticSize = Enum.AutomaticSize.X
                    }):AddToTheme({ TextColor3 = 'Text' })

                    PlayerItems["Status"] = Library:Create("TextLabel", {
                        Name = "\0",
                        FontFace = Library.Font,
                        TextSize = Library.FontSize,
                        Parent = PlayerItems["NewPlayer"].Instance,
                        TextWrapped = true,
                        TextColor3 = Library.Theme["Text"],
                        Text = "Neutral",
                        Size = UDim2.new(0, 0, 0, 15),
                        AnchorPoint = Vector2.new(1, 0.5),
                        BorderSizePixel = 0,
                        BackgroundTransparency = 1,
                        Position = UDim2.new(1, 0, 0.5, 0),
                        AutomaticSize = Enum.AutomaticSize.X
                    }):AddToTheme({ TextColor3 = 'Text' })
                end


                local PlayerData = {
                    Name = PlayerName,
                    Display = PlayerDisplay,
                    Player = Player,
                    Items = PlayerItems,
                    Status = "Neutral",
                    IsSelected = false,
                }

                function PlayerData:ToggleState(Status)
                    if Status == "Active" then
                        PlayerItems["Username"]:ChangeItemTheme({ TextColor3 = "Accent" })
                        PlayerItems["Username"]:Tween({ TextColor3 = Library.Theme.Accent })
                    else
                        PlayerItems["Username"]:ChangeItemTheme({ TextColor3 = "Text" })
                        PlayerItems["Username"]:Tween({ TextColor3 = Library.Theme.Text })
                    end
                end

                function PlayerData:Set()
                    PlayerData.IsSelected = not PlayerData.IsSelected

                    if PlayerData.IsSelected then
                        Playerlist.Selected = PlayerData

                        PlayerData.IsSelected = true
                        PlayerData:ToggleState("Active")

                        for Index, Value in Playerlist.Players do
                            if Value ~= PlayerData then
                                Value.IsSelected = false
                                Value:ToggleState("Inactive")
                            end
                        end
                    else
                        Playerlist.Selected = nil

                        PlayerData.IsSelected = false
                        PlayerData:ToggleState("Inactive")
                    end

                    Library:SafeCall(Playerlist.Callback, Playerlist.Selected)
                end

                PlayerData.Items.NewPlayer:Connect("MouseButton1Down", function()
                    PlayerData:Set()
                end)

                Playerlist.Players[PlayerData.Name] = PlayerData
                return PlayerData
            end

            function Playerlist:Remove(Player)
                if Playerlist.Players[Player.Name] then
                    Playerlist.Players[Player.Name].Items.NewPlayer.Instance:Destroy()
                end
            end

            function Playerlist:SetVisibility(Bool)
                Playerlist.Visible = Bool
                Items["Playerlist"].Instance.Visible = Bool and Library.WindowOpenState
            end

            function Playerlist:Center()
                local AbsPos = Items["Playerlist"].Instance.AbsolutePosition
                Items["Playerlist"].Instance.AnchorPoint = Vector2.new(0, 0)
                task.wait()
                Items["Playerlist"].Instance.Position = UDim2.new(0, AbsPos.X, 0, AbsPos.Y + GuiInset)
            end

            function Playerlist:SetText(Text)
                Items["Text"].Instance.Text = Text
            end

            local StatusDropdown = Library:Dropdown({
                Name = "Status",
                Flag = "PlayerlistStatus",
                Items = { "Neutral", "Enemy", "Friendly" },
                Parent = Items["Playerlist"],
                Callback = function(Value)
                    if Playerlist.Selected then
                        local PlayerItems = Playerlist.Selected.Items

                        if PlayerItems then
                            local NeutralColor = Library.Theme.Text
                            local EnemyColor = Color3.fromRGB(255, 0, 0)
                            local FriendlyColor = Color3.fromRGB(0, 255, 0)

                            PlayerItems["Status"]:Tween({
                                TextColor3 = Value == "Enemy" and EnemyColor or Value == "Friendly" and FriendlyColor or
                                    NeutralColor
                            })

                            PlayerItems["Status"].Instance.Text = Value
                            Playerlist.Selected.Status = Value
                        end
                    end
                end
            })

            StatusDropdown.Items.Dropdown.Instance.Position = UDim2.new(0, 10, 1, -10)
            StatusDropdown.Items.Dropdown.Instance.AnchorPoint = Vector2.new(0, 1)
            StatusDropdown.Items.Dropdown.Instance.Size = UDim2.new(1, -20, 0, 40)

            for Index, Value in Players:GetPlayers() do
                Playerlist:Add(Value)
            end

            Playerlist.Visible = true
            Library:BindToWindowVisibility(function(IsWindowOpen)
                Items["Playerlist"].Instance.Visible = Playerlist.Visible and IsWindowOpen
            end)

            Library:Connect(Items["Content"].Instance.ChildAdded, function()
                task.wait()
                Items["Content"].Instance.Position = UDim2.new(0, 10, 1, Items["Content"].Instance.AbsoluteSize.Y)
            end)

            Library:Connect(Players.PlayerAdded, function(Player)
                Playerlist:Add(Player)
            end)

            Library:Connect(Players.PlayerRemoving, function(Player)
                Playerlist:Remove(Player)
            end)

            Library:RegisterLayout("Playerlist", {
                Instance = Items["Playerlist"].Instance
            })

            Playerlist:Center()

            return setmetatable(Playerlist, Library)
        end

        Library.Tooltip = function(Self, Text)
            local Object = Self.Instance

            if not Object or Text == nil then
                return
            end

            if type(Text) == "string" then
                Text = {
                    Title = "",
                    Description = Text
                }
            end

            local TitleThemeKey = Text.ColorThemeKey or Text.colorThemeKey or (Text.Risky and "Risky") or "Accent"
            local TitleText = tostring(Text.Title or "")
            local DescriptionText = tostring(Text.Description or "")
            local ShowTitle = TitleText ~= ""
            local TooltipFrame = nil
            local RenderStepped = nil

            local function DestroyTooltip()
                if RenderStepped then
                    RenderStepped:Disconnect()
                    RenderStepped = nil
                end

                if TooltipFrame then
                    TooltipFrame:Destroy()
                    TooltipFrame = nil
                end
            end

            local function CreateTooltip()
                DestroyTooltip()

                local Items = {}
                Items["Tooltip"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Library.Holder.Instance,
                    Position = UDim2.new(0, 873, 0, 10),
                    BorderSizePixel = 0,
                    ZIndex = 50,
                    AutomaticSize = Enum.AutomaticSize.XY,
                    BackgroundColor3 = Library.Theme["Element"]
                }):AddToTheme({ BackgroundColor3 = "Element" })
                TooltipFrame = Items["Tooltip"].Instance

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = TooltipFrame,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    Color = Library.Theme["Border"],
                    BorderOffset = UDim.new(0, 1)
                }):AddToTheme({ Color = "Border" })

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = TooltipFrame,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    Color = Library.Theme["Outline"]
                }):AddToTheme({ Color = "Outline" })

                local TitleLabel = Library:Create("TextLabel", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = TooltipFrame,
                    ZIndex = 51,
                    TextColor3 = Library.Theme[TitleThemeKey] or Library.Theme["Accent"],
                    Text = TitleText,
                    Size = UDim2.new(0, 0, 0, 15),
                    BackgroundTransparency = 1,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.X,
                    Visible = ShowTitle
                }):AddToTheme({ TextColor3 = TitleThemeKey })
                TitleLabel.Instance.Text = TitleText
                TitleLabel.Instance.Visible = ShowTitle

                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = TooltipFrame,
                    PaddingTop = UDim.new(0, 4),
                    PaddingBottom = UDim.new(0, 4),
                    PaddingRight = UDim.new(0, 8),
                    PaddingLeft = UDim.new(0, 8)
                })

                local DescriptionLabel = Library:Create("TextLabel", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = TooltipFrame,
                    ZIndex = 51,
                    TextColor3 = Library.Theme["Text"],
                    Text = DescriptionText,
                    Size = UDim2.new(0, 0, 0, 15),
                    Position = ShowTitle and UDim2.new(0, 0, 0, 18) or UDim2.new(0, 0, 0, 0),
                    BackgroundTransparency = 1,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.X
                }):AddToTheme({ TextColor3 = "Text" })
                DescriptionLabel.Instance.Text = DescriptionText

                local MouseLocation = UserInputService:GetMouseLocation()
                TooltipFrame.Position = UDim2.new(0, MouseLocation.X + 20, 0, MouseLocation.Y + 20)

                RenderStepped = RunService.RenderStepped:Connect(function()
                    if not TooltipFrame then
                        return
                    end

                    local UpdatedLocation = UserInputService:GetMouseLocation()
                    TooltipFrame.Position = UDim2.new(0, UpdatedLocation.X + 20, 0, UpdatedLocation.Y + 20)
                end)
            end

            Self:OnHover(CreateTooltip, DestroyTooltip)
            Library:Connect(Object.AncestryChanged, function(_, Parent)
                if Parent == nil then
                    DestroyTooltip()
                end
            end)
        end

        Library.Window = function(Self, Params)
            Params = Params or {}

            local Window = {
                IsOpen = true,
                Title = tostring(Params.Title or Params.title or Params.Name or Params.name or "Panel"),
                DockButtonText = tostring(Params.ButtonName or Params.buttonName or "Main UI"),
                Pages = {},
                Items = {}
            }

            local Items = {}
            do
                Items["MainFrame"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Library.Holder.Instance,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.new(0.5, 0, 0.5, 0),
                    Size = UDim2.new(0, 560, 0, 740),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Background"]
                }):AddToTheme({ BackgroundColor3 = 'Background' })

                Items["MainFrame"]:MakeDraggable()
                Items["MainFrame"]:MakeResizeable(Vector2.new(Items["MainFrame"].Instance.AbsoluteSize.X,
                    Items["MainFrame"].Instance.AbsoluteSize.Y))

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["MainFrame"].Instance,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    Color = Library.Theme["Outline"]
                }):AddToTheme({ Color = 'Outline' })

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["MainFrame"].Instance,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    Color = Library.Theme["Border"],
                    BorderOffset = UDim.new(0, 1)
                }):AddToTheme({ Color = 'Border' })

                Items["AccentLiner"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["MainFrame"].Instance,
                    Size = UDim2.new(1, 0, 0, 1),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Accent"]
                }):AddToTheme({ BackgroundColor3 = 'Accent' })

                Items["DarkLiner"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["MainFrame"].Instance,
                    Position = UDim2.new(0, 0, 0, 1),
                    Size = UDim2.new(1, 0, 0, 1),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Light Border"]
                }):AddToTheme({ BackgroundColor3 = 'Light Border' })


                Items["Shadow"] = Library:Create("ImageLabel", {
                    Name = "\0",
                    Parent = Items["MainFrame"].Instance,
                    ImageColor3 = Color3.fromRGB(103, 164, 255),
                    ScaleType = Enum.ScaleType.Slice,
                    ImageTransparency = 0.699999988079071,
                    Size = UDim2.new(1, 25, 1, 25),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Image = "http://www.roblox.com/asset/?id=18245826428",
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0.5, 0, 0.5, 0),
                    ZIndex = -1,
                    BorderSizePixel = 0,
                    SliceCenter = Rect.new(Vector2.new(21, 21), Vector2.new(79, 79))
                }):AddToTheme({ ImageColor3 = 'Accent' })

                Items["Header"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Library.Holder.Instance,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Visible = true,
                    Position = UDim2.new(0, 0, 0, 0),
                    Size = UDim2.new(1, 0, 1, 0),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                })

                Items["HeaderFirstInline"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["Header"].Instance,
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0, 6, 0, 26),
                    Size = UDim2.new(1, -12, 1, -36),
                    BorderSizePixel = 0,
                    ZIndex = 2,
                    BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                })

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["HeaderFirstInline"].Instance,
                    Color = Color3.fromRGB(40, 40, 45),
                    LineJoinMode = Enum.LineJoinMode.Miter
                }):AddToTheme({ Color = function() return Library.Theme["Border"] end })

                Items["HeaderSecondInline"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["HeaderFirstInline"].Instance,
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0, 1, 0, 1),
                    Size = UDim2.new(1, -2, 1, -2),
                    BorderSizePixel = 0,
                    ZIndex = 2,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                })

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["HeaderSecondInline"].Instance,
                    Color = Color3.fromRGB(10, 10, 15),
                    LineJoinMode = Enum.LineJoinMode.Miter
                }):AddToTheme({ Color = function() return Library.Theme["Outline"] end })

                Items["HeaderAccent"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["HeaderSecondInline"].Instance,
                    Size = UDim2.new(1, 0, 0, 1),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Color3.fromRGB(19, 128, 225)
                }):AddToTheme({ BackgroundColor3 = "Accent" })

                Items["HeaderThirdInline"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["HeaderSecondInline"].Instance,
                    Position = UDim2.new(0, 0, 0, 1),
                    Size = UDim2.new(1, 0, 0, 1),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Color3.fromRGB(46, 46, 46)
                }):AddToTheme({ BackgroundColor3 = function() return Library.Theme["Outline"] end })

                Items["HeaderOutline"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["HeaderSecondInline"].Instance,
                    Position = UDim2.new(0, 0, 0, 2),
                    Size = UDim2.new(1, 0, 0, 1),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Color3.fromRGB(10, 10, 15)
                }):AddToTheme({ BackgroundColor3 = function() return Library.Theme["Border"] end })

                Items["HeaderInnerOutline"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["Header"].Instance,
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0, 6, 0, 26),
                    Size = UDim2.new(1, -12, 1, -36),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                })

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["HeaderInnerOutline"].Instance,
                    Color = Color3.fromRGB(15, 15, 20),
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    Thickness = 10000
                }):AddToTheme({ Color = function() return Library.Theme["Background"] end })

                Items["HeaderTitle"] = Library:Create("TextLabel", {
                    Name = "\0",
                    Parent = Items["HeaderInnerOutline"].Instance,
                    FontFace = Library.Font,
                    TextColor3 = Color3.fromRGB(235, 235, 235),
                    TextStrokeColor3 = Color3.fromRGB(255, 255, 255),
                    Text = Window.Title,
                    AnchorPoint = Vector2.new(0, 1),
                    BorderSizePixel = 0,
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0, -1, 0, -8),
                    AutomaticSize = Enum.AutomaticSize.XY,
                    TextSize = 12,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                }):AddToTheme({ TextColor3 = "Text" })

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["HeaderTitle"].Instance,
                    LineJoinMode = Enum.LineJoinMode.Miter
                })

                Items["HeaderButtonHolder"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["HeaderInnerOutline"].Instance,
                    AnchorPoint = Vector2.new(1, 1),
                    BackgroundTransparency = 1,
                    Position = UDim2.new(1, 1, 0, -6),
                    Size = UDim2.new(0, 0, 0, 16),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                })

                Library:Create("UIListLayout", {
                    Name = "\0",
                    Parent = Items["HeaderButtonHolder"].Instance,
                    FillDirection = Enum.FillDirection.Horizontal,
                    HorizontalAlignment = Enum.HorizontalAlignment.Right,
                    Padding = UDim.new(0, 7),
                    SortOrder = Enum.SortOrder.LayoutOrder
                })

                Items["DockOutline"] = Library:Create("TextButton", {
                    Name = "\0",
                    Parent = Items["HeaderButtonHolder"].Instance,
                    AutoButtonColor = false,
                    Active = false,
                    Selectable = false,
                    Text = "",
                    Size = UDim2.new(0, 0, 0, 16),
                    AutomaticSize = Enum.AutomaticSize.X,
                    BorderSizePixel = 0,
                    BackgroundColor3 = Color3.fromRGB(46, 46, 46)
                }):AddToTheme({ BackgroundColor3 = function() return Library.Theme["Outline"] end })

                Items["DockInline"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["DockOutline"].Instance,
                    Position = UDim2.new(0, 1, 0, 1),
                    Size = UDim2.new(1, -2, 1, -2),
                    AutomaticSize = Enum.AutomaticSize.X,
                    BorderSizePixel = 0,
                    BackgroundColor3 = Color3.fromRGB(10, 10, 15)
                }):AddToTheme({ BackgroundColor3 = function() return Library.Theme["Border"] end })

                Items["Dock"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["DockInline"].Instance,
                    Position = UDim2.new(0, 1, 0, 1),
                    Size = UDim2.new(1, -2, 1, -2),
                    AutomaticSize = Enum.AutomaticSize.X,
                    BorderSizePixel = 0,
                    BackgroundColor3 = Color3.fromRGB(30, 30, 35)
                }):AddToTheme({ BackgroundColor3 = function() return Library.Theme["Section"] end })

                Items["DockText"] = Library:Create("TextLabel", {
                    Name = "\0",
                    Parent = Items["DockOutline"].Instance,
                    FontFace = Library.Font,
                    TextSize = 12,
                    Text = Window.DockButtonText,
                    TextColor3 = Color3.fromRGB(145, 145, 145),
                    TextStrokeColor3 = Color3.fromRGB(255, 255, 255),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.XY,
                    AnchorPoint = Vector2.new(0, 0.5),
                    Position = UDim2.new(0, 0, 0.5, 0),
                    ZIndex = 2,
                    Size = UDim2.new(0, 0, 0, 15),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                }):AddToTheme({
                    TextColor3 = function()
                        return Window.IsOpen and Library.Theme["Text"] or Library.Theme["Inactive Text"]
                    end
                })

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["DockText"].Instance,
                    LineJoinMode = Enum.LineJoinMode.Miter
                })

                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["DockText"].Instance,
                    PaddingLeft = UDim.new(0, 7),
                    PaddingRight = UDim.new(0, 5)
                })

                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["DockInline"].Instance,
                    PaddingRight = UDim.new(0, 2)
                })

                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["DockOutline"].Instance,
                    PaddingRight = UDim.new(0, 2)
                })

                Items["Header"].Instance.Visible = Window.IsOpen

                Items["PagesOutline"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["MainFrame"].Instance,
                    Position = UDim2.new(0, 10, 0, 11),
                    Size = UDim2.new(1, -20, 0, 30),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Border 2"]
                }):AddToTheme({ BackgroundColor3 = 'Border 2' })

                Library:Create("UIListLayout", {
                    Name = "\0",
                    Parent = Items["PagesOutline"].Instance,
                    FillDirection = Enum.FillDirection.Horizontal,
                    HorizontalFlex = Enum.UIFlexAlignment.Fill,
                    Padding = UDim.new(0, 1),
                    SortOrder = Enum.SortOrder.LayoutOrder
                })

                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["PagesOutline"].Instance,
                    PaddingTop = UDim.new(0, 1),
                    PaddingBottom = UDim.new(0, 1),
                    PaddingRight = UDim.new(0, 1),
                    PaddingLeft = UDim.new(0, 1)
                })

                Items["ContentOutline"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["MainFrame"].Instance,
                    Position = UDim2.new(0, 10, 0, 42),
                    Size = UDim2.new(1, -20, 1, -52),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Border 2"]
                }):AddToTheme({ BackgroundColor3 = 'Border 2' })

                Items["Content"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["ContentOutline"].Instance,
                    Position = UDim2.new(0, 2, 0, 2),
                    Size = UDim2.new(1, -4, 1, -4),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Background"]
                }):AddToTheme({ BackgroundColor3 = 'Background' })

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["Content"].Instance,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    Color = Library.Theme["Outline"]
                }):AddToTheme({ Color = 'Outline' })

                Window.Items = Items
                Library.MainWindowFrame = Items["MainFrame"].Instance
            end

            local Debounce = false

            local function CreateHeaderButton(Text, DefaultActive)
                local ButtonData = {
                    Active = DefaultActive == true
                }

                local ButtonItems = {}

                ButtonItems["Outline"] = Library:Create("TextButton", {
                    Name = "\0",
                    Parent = Items["HeaderButtonHolder"].Instance,
                    AutoButtonColor = false,
                    Active = false,
                    Selectable = false,
                    Text = "",
                    Size = UDim2.new(0, 0, 0, 16),
                    AutomaticSize = Enum.AutomaticSize.X,
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Outline"]
                }):AddToTheme({ BackgroundColor3 = function() return Library.Theme["Outline"] end })

                ButtonItems["Inline"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = ButtonItems["Outline"].Instance,
                    Position = UDim2.new(0, 1, 0, 1),
                    Size = UDim2.new(1, -2, 1, -2),
                    AutomaticSize = Enum.AutomaticSize.X,
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Border"]
                }):AddToTheme({ BackgroundColor3 = function() return Library.Theme["Border"] end })

                ButtonItems["Background"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = ButtonItems["Inline"].Instance,
                    Position = UDim2.new(0, 1, 0, 1),
                    Size = UDim2.new(1, -2, 1, -2),
                    AutomaticSize = Enum.AutomaticSize.X,
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Section"]
                }):AddToTheme({ BackgroundColor3 = function() return Library.Theme["Section"] end })

                ButtonItems["Text"] = Library:Create("TextLabel", {
                    Name = "\0",
                    Parent = ButtonItems["Outline"].Instance,
                    FontFace = Library.Font,
                    TextSize = 12,
                    Text = tostring(Text or ""),
                    TextColor3 = ButtonData.Active and Library.Theme["Text"] or Library.Theme["Inactive Text"],
                    TextStrokeColor3 = Color3.fromRGB(255, 255, 255),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.XY,
                    AnchorPoint = Vector2.new(0, 0.5),
                    Position = UDim2.new(0, 0, 0.5, 0),
                    ZIndex = 2,
                    Size = UDim2.new(0, 0, 0, 15),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                }):AddToTheme({
                    TextColor3 = function()
                        return ButtonData.Active and Library.Theme["Text"] or Library.Theme["Inactive Text"]
                    end
                })

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = ButtonItems["Text"].Instance,
                    LineJoinMode = Enum.LineJoinMode.Miter
                })

                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = ButtonItems["Text"].Instance,
                    PaddingLeft = UDim.new(0, 7),
                    PaddingRight = UDim.new(0, 5)
                })

                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = ButtonItems["Inline"].Instance,
                    PaddingRight = UDim.new(0, 2)
                })

                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = ButtonItems["Outline"].Instance,
                    PaddingRight = UDim.new(0, 2)
                })

                function ButtonData:SetText(Value)
                    ButtonItems["Text"].Instance.Text = tostring(Value or "")
                end

                function ButtonData:SetActive(Value)
                    ButtonData.Active = Value == true
                    ButtonItems["Text"]:Tween({
                        TextColor3 = ButtonData.Active and Library.Theme["Text"] or Library.Theme["Inactive Text"]
                    })
                end

                function ButtonData:SetVisible(Value)
                    ButtonItems["Outline"].Instance.Visible = Value == true
                end

                function ButtonData:SetCallback(Callback)
                    ButtonData.Callback = Callback
                end

                ButtonItems["Outline"]:Connect("MouseButton1Down", function()
                    if type(ButtonData.Callback) == "function" then
                        ButtonData.Callback(ButtonData)
                    end
                end)

                ButtonData.Items = ButtonItems
                return ButtonData
            end

            local function UpdateDockState()
                Items["DockText"]:Tween({
                    TextColor3 = Window.IsOpen and Library.Theme["Text"] or Library.Theme["Inactive Text"]
                })
            end

            function Window:SetOpen(Bool)
                if Debounce then
                    return
                end

                Debounce = true

                Window.IsOpen = Bool
                Items["Header"].Instance.Visible = Bool
                Library:SetWindowVisibilityState(Bool)
                Library:SetBackgroundEffectsVisible(Bool)
                UpdateDockState()

                Items["MainFrame"]:FadeDescendants(Bool, function()
                    Debounce = false
                end)
            end

            function Window:Center()
                task.defer(function()
                    local ScreenSize = Camera.ViewportSize
                    local FrameSize = Items["MainFrame"].Instance.AbsoluteSize
                    Items["MainFrame"].Instance.AnchorPoint = Vector2.new(0, 0)
                    Items["MainFrame"].Instance.Position = UDim2.fromOffset(
                        math.floor((ScreenSize.X - FrameSize.X) / 2),
                        math.floor((ScreenSize.Y - FrameSize.Y) / 2)
                    )
                end)
            end

            function Window:SetTitle(Text)
                Window.Title = tostring(Text or "Panel")
                Items["HeaderTitle"].Instance.Text = Window.Title
            end

            function Window:SetDockText(Text)
                Window.DockButtonText = tostring(Text or "Main UI")
                Items["DockText"].Instance.Text = Window.DockButtonText
            end

            function Window:AddHeaderButton(Params)
                Params = Params or {}

                local Button = CreateHeaderButton(Params.Text or Params.Name or "Button", Params.Active)
                if type(Params.Callback) == "function" then
                    Button:SetCallback(Params.Callback)
                end

                return Button
            end

            Items["DockOutline"]:Connect("MouseButton1Down", function()
                Window:SetOpen(not Window.IsOpen)
            end)

            Library:Connect(UserInputService.InputBegan, function(Input)
                if tostring(Input.KeyCode) == Library.MenuKeybind or tostring(Input.UserInputType) == Library.MenuKeybind then
                    Window:SetOpen(not Window.IsOpen)
                end
            end)

            Library:Connect(RunService.RenderStepped, function()
                if Window.IsOpen then
                    Library:GlobalUpdateOpenFrames()
                end
            end)

            Library:RegisterLayout("MainWindow", {
                Instance = Items["MainFrame"].Instance,
                SaveSize = true,
                MinimumSize = Vector2.new(552, 451)
            })

            Library:RegisterLayout("MainWindowDock", {
                Instance = Items["DockOutline"].Instance
            })

            UpdateDockState()
            Window:Center()
            return setmetatable(Window, Library)
        end

        Library.Page = function(Self, Params)
            Params = Params or {}

            local Page = {
                Name = Params.Name or Params.name or "Page",

                Window = Self,
                Items = {},
                Pages = {},
                Active = false
            }

            local Items = {}
            do
                Items["Inactive"] = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Page.Window.Items["PagesOutline"].Instance,
                    TextColor3 = Color3.fromRGB(0, 0, 0),
                    Text = "",
                    AutoButtonColor = false,
                    Size = UDim2.new(1, 0, 1, 0),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Outline"]
                }):AddToTheme({ BackgroundColor3 = 'Outline' })

                Items["InactiveInline"] = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["Inactive"].Instance,
                    TextColor3 = Color3.fromRGB(0, 0, 0),
                    Text = "",
                    AutoButtonColor = false,
                    Position = UDim2.new(0, 1, 0, 1),
                    Size = UDim2.new(1, -2, 1, -2),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Outline"]
                }):AddToTheme({ BackgroundColor3 = 'Outline' })

               Items["Poophack"] = Library:Create("UIGradient", {
                    Name = "\0",
                    Parent = Items["InactiveInline"].Instance,
                    Rotation = -90,
                    Color = ColorSequence.new {
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                        ColorSequenceKeypoint.new(1, Color3.fromRGB(172, 172, 172))
                    }
                })

                Items["Text"] = Library:Create("TextLabel", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["InactiveInline"].Instance,
                    TextWrapped = true,
                    TextColor3 = Library.Theme["Text"],
                    Text = Page.Name,
                    Size = UDim2.new(0, 0, 0, 15),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    BorderSizePixel = 0,
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0.5, 0, 0.5, 0),
                    AutomaticSize = Enum.AutomaticSize.X
                }):AddToTheme({ TextColor3 = 'Text' })

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["Inactive"].Instance,
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    Color = Library.Theme["Border 2"],
                    BorderOffset = UDim.new(0, 1)
                }):AddToTheme({ Color = 'Border 2' })

                Items["Page"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Library.UnusedHolder.Instance,
                    BackgroundTransparency = 1,
                    Visible = false,
                    Size = UDim2.new(1, 0, 1, 0),
                    BorderSizePixel = 0
                })

                Items["Columns"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["Page"].Instance,
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0, 0, 0, 10),
                    Size = UDim2.new(1, 0, 1, -10),
                    BorderSizePixel = 0
                })

                Items["SubPages"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["Page"].Instance,
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0, 14, 0, 0),
                    Size = UDim2.new(1, 0, 0, 20),
                    BorderSizePixel = 0
                })

                Library:Create("UIListLayout", {
                    Name = "\0",
                    Parent = Items["SubPages"].Instance,
                    FillDirection = Enum.FillDirection.Horizontal,
                    Padding = UDim.new(0, 15),
                    SortOrder = Enum.SortOrder.LayoutOrder
                })

                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["SubPages"].Instance,
                    PaddingTop = UDim.new(0, 3)
                })

                Page.Items = Items
            end

            local Debounce = false

            function Page:Turn(Bool)
                if Debounce then
                    return
                end

                Debounce = true

                Page.Active = Bool

                if Bool then
                    Items["Text"]:ChangeItemTheme({ TextColor3 = "Accent" })
                    Items["Text"]:Tween({ TextColor3 = Library.Theme.Accent })

                    local Dummy = Instance.new("Color3Value")
                    Dummy.Value = Color3.fromRGB(255, 255, 255)

                    local Connection
                    Connection = Dummy:GetPropertyChangedSignal("Value"):Connect(function()
                        Items["Poophack"].Instance.Color = ColorSequence.new {
                            ColorSequenceKeypoint.new(0, Dummy.Value),
                            ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
                        }
                    end)

                    local Tween = TweenService:Create(Dummy,
                        TweenInfo.new(Library.Animation.Time, Enum.EasingStyle[Library.Animation.Style], Enum.EasingDirection[Library.Animation.Direction]),
                        { Value = Color3.fromRGB(172, 172, 172) }
                    )
                    Tween:Play()
                    Tween.Completed:Once(function()
                        Connection:Disconnect()
                        Dummy:Destroy()
                    end)
                else
                    Items["Text"]:ChangeItemTheme({ TextColor3 = "Text" })
                    Items["Text"]:Tween({ TextColor3 = Library.Theme.Text })

                    local Dummy = Instance.new("Color3Value")
                    Dummy.Value = Color3.fromRGB(172, 172, 172)

                    local Connection
                    Connection = Dummy:GetPropertyChangedSignal("Value"):Connect(function()
                        Items["Poophack"].Instance.Color = ColorSequence.new {
                            ColorSequenceKeypoint.new(0, Dummy.Value),
                            ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
                        }
                    end)

                    local Tween = TweenService:Create(Dummy,
                        TweenInfo.new(Library.Animation.Time, Enum.EasingStyle[Library.Animation.Style], Enum.EasingDirection[Library.Animation.Direction]),
                        { Value = Color3.fromRGB(255, 255, 255) }
                    )
                    Tween:Play()
                    Tween.Completed:Once(function()
                        Connection:Disconnect()
                        Dummy:Destroy()
                    end)
                end

                Items["Page"]:FadeDescendants(Bool, function()
                    Debounce = false

                    if Items["Page"].Instance.Visible then
                        Items["Page"].Instance.Parent = Page.Window.Items["Content"].Instance
                    else
                        Items["Page"].Instance.Parent = Library.UnusedHolder.Instance
                    end
                end)
            end

            Items["InactiveInline"]:Connect("MouseButton1Down", function()
                for Index, Value in Page.Window.Pages do
                    Value:Turn(Value == Page)
                end
            end)

            if #Page.Window.Pages == 0 then
                Page:Turn(true)
            end

            table.insert(Page.Window.Pages, Page)
            return setmetatable(Page, Library)
        end

        Library.SubPage = function(Self, Params)
            Params = Params or {}

            local Page = {
                Name = Params.Name or Params.name or "Page",

                Window = Self.Window,
                Page = Self,
                ColumnsData = {},
                Items = {},
                Active = false
            }

            local Items = {}
            do
                Items["Inactive"] = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Page.Page.Items["SubPages"].Instance,
                    TextColor3 = Library.Theme["Text"],
                    Text = Page.Name,
                    AutoButtonColor = false,
                    BackgroundTransparency = 1,
                    Size = UDim2.new(0, 0, 0, 15),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.X
                }):AddToTheme({ TextColor3 = 'Text' })

                Items["Page"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Library.UnusedHolder.Instance,
                    BackgroundTransparency = 1,
                    Visible = false,
                    Size = UDim2.new(1, 0, 1, 0),
                    BorderSizePixel = 0
                })

                Library:Create("UIListLayout", {
                    Name = "\0",
                    Parent = Items["Page"].Instance,
                    FillDirection = Enum.FillDirection.Horizontal,
                    HorizontalFlex = Enum.UIFlexAlignment.Fill,
                    Padding = UDim.new(0, 12),
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    VerticalFlex = Enum.UIFlexAlignment.Fill
                })

                Items["LeftColumn"] = Library:Create("ScrollingFrame", {
                    Name = "\0",
                    Parent = Items["Page"].Instance,
                    ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0),
                    Active = true,
                    AutomaticCanvasSize = Enum.AutomaticSize.Y,
                    ScrollBarThickness = 0,
                    BackgroundTransparency = 1,
                    Size = UDim2.new(0, 100, 0, 100),
                    BorderSizePixel = 0,
                    CanvasSize = UDim2.new(0, 0, 0, 0)
                })

                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["LeftColumn"].Instance,
                    PaddingTop = UDim.new(0, 14),
                    PaddingLeft = UDim.new(0, 14),
                    PaddingBottom = UDim.new(0, 14)
                })

                Library:Create("UIListLayout", {
                    Name = "\0",
                    Parent = Items["LeftColumn"].Instance,
                    Padding = UDim.new(0, 14),
                    SortOrder = Enum.SortOrder.LayoutOrder
                })

                Items["RightColumn"] = Library:Create("ScrollingFrame", {
                    Name = "\0",
                    Parent = Items["Page"].Instance,
                    ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0),
                    Active = true,
                    AutomaticCanvasSize = Enum.AutomaticSize.Y,
                    ScrollBarThickness = 0,
                    BackgroundTransparency = 1,
                    Size = UDim2.new(0, 100, 0, 100),
                    BorderSizePixel = 0,
                    CanvasSize = UDim2.new(0, 0, 0, 0)
                })

                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["RightColumn"].Instance,
                    PaddingTop = UDim.new(0, 14),
                    PaddingRight = UDim.new(0, 14),
                    PaddingBottom = UDim.new(0, 14)
                })

                Library:Create("UIListLayout", {
                    Name = "\0",
                    Parent = Items["RightColumn"].Instance,
                    Padding = UDim.new(0, 14),
                    SortOrder = Enum.SortOrder.LayoutOrder
                })

                Page.ColumnsData[1] = Items["LeftColumn"]
                Page.ColumnsData[2] = Items["RightColumn"]

                Page.Items = Items
            end

            local Debounce = false

            function Page:Turn(Bool)
                if Debounce then
                    return
                end

                Page.Active = Bool

                Debounce = true

                if Bool then
                    Items["Inactive"]:ChangeItemTheme({ TextColor3 = "Accent" })
                    Items["Inactive"]:Tween({ TextColor3 = Library.Theme.Accent })
                else
                    Items["Inactive"]:ChangeItemTheme({ TextColor3 = "Text" })
                    Items["Inactive"]:Tween({ TextColor3 = Library.Theme.Text })
                end

                Items["Page"]:FadeDescendants(Bool, function()
                    Debounce = false

                    if Items["Page"].Instance.Visible then
                        Items["Page"].Instance.Parent = Page.Page.Items["Columns"].Instance
                    else
                        Items["Page"].Instance.Parent = Library.UnusedHolder.Instance
                    end
                end)
            end

            Items["Inactive"]:Connect("MouseButton1Down", function()
                for Index, Value in Page.Page.Pages do
                    Value:Turn(Value == Page)
                end
            end)

            if #Page.Page.Pages == 0 then
                Page:Turn(true)
            end

            table.insert(Page.Page.Pages, Page)
            return setmetatable(Page, Library)
        end

        Library.Section = function(Self, Params)
            Params = Params or {}

            local Section = {
                Name = Params.Name or Params.name or "Section",
                Side = Params.Side or Params.side or 1,

                Window = Self.Window,
                Page = Self,
                Items = {},
            }

            local Items = {}
            do
                Items["SectionOutline"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Section.Page.ColumnsData[Section.Side].Instance,
                    Size = UDim2.new(1, 0, 0, 20),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.Y,
                    BackgroundColor3 = Library.Theme["Outline"]
                }):AddToTheme({ BackgroundColor3 = 'Outline' })

                Items["Section"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["SectionOutline"].Instance,
                    Position = UDim2.new(0, 1, 0, 1),
                    Size = UDim2.new(1, -2, 1, -2),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Section"]
                }):AddToTheme({ BackgroundColor3 = 'Section' })

                Items["Content"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["Section"].Instance,
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0, 36, 0, 15),
                    Size = UDim2.new(1, -72, 0, 0),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.Y
                })

                Library:Create("UIListLayout", {
                    Name = "\0",
                    Parent = Items["Content"].Instance,
                    Padding = UDim.new(0, 7),
                    SortOrder = Enum.SortOrder.LayoutOrder
                })

                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["Content"].Instance,
                    PaddingBottom = UDim.new(0, 20)
                })

                Items["Text"] = Library:Create("TextLabel", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["SectionOutline"].Instance,
                    TextColor3 = Library.Theme["Text"],
                    Text = Section.Name,
                    Size = UDim2.new(0, 0, 0, 4),
                    Position = UDim2.new(0, 6, 0, 0),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.X,
                    BackgroundColor3 = Library.Theme["Section"]
                }):AddToTheme({ BackgroundColor3 = 'Section' })

                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["Text"].Instance,
                    PaddingRight = UDim.new(0, 4),
                    PaddingLeft = UDim.new(0, 4)
                })

                Section.Items = Items
            end

            return setmetatable(Section, Library)
        end

        Library.Toggle = function(Self, Params)
            Params = Params or {}

            local Toggle = {
                Name = Params.Name or Params.name or "Toggle",
                Flag = Params.Flag or Params.flag or (Params.Name or Params.name),
                Default = Params.Default or Params.default or false,
                Risky = Params.Risky or Params.risky or false,
                Tooltip = Params.Tooltip or Params.tooltip or nil,
                Callback = Params.Callback or Params.callback or function() end,

                Window = Self.Window,
                Page = Self.Page,
                Section = Self,

                Value = false,
                Items = {}
            }

            local Parent

            if Params.Parent then
                Parent = Params.Parent
            else
                Parent = Toggle.Section.Items["Content"]
            end

            local Items = {}
            local ToggleButtonOffset = Toggle.Section.IsSettings and 0 or 20
            local ToggleTextOffset = Toggle.Section.IsSettings and 14 or 20
            do
                Items["Toggle"] = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Parent.Instance,
                    TextColor3 = Color3.fromRGB(0, 0, 0),
                    Text = "",
                    AutoButtonColor = false,
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0, -ToggleButtonOffset, 0, 0),
                    Size = UDim2.new(1, ToggleButtonOffset, 0, 12),
                    BorderSizePixel = 0
                })

                local TooltipData = Toggle.Tooltip
                if Toggle.Risky and typeof(Toggle.Tooltip) == "table" then
                    TooltipData = table.clone(Toggle.Tooltip)
                    TooltipData.Risky = true
                end
                Items["Toggle"]:Tooltip(TooltipData)

                Items["Indicator"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["Toggle"].Instance,
                    AnchorPoint = Vector2.new(0, 0.5),
                    Position = UDim2.new(0, 0, 0.5, 0),
                    Size = UDim2.new(0, 8, 0, 8),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Element"]
                }):AddToTheme({ BackgroundColor3 = 'Element' })

                Library:Create("UIGradient", {
                    Name = "\0",
                    Parent = Items["Indicator"].Instance,
                    Rotation = -90,
                    Color = ColorSequence.new {
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                        ColorSequenceKeypoint.new(1, Color3.fromRGB(172, 172, 172))
                    }
                })

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["Indicator"].Instance,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    Color = Library.Theme["Border"]
                }):AddToTheme({ Color = 'Border' })

                Items["Inline"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["Indicator"].Instance,
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, 0, 1, 0),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Accent"]
                }):AddToTheme({ BackgroundColor3 = 'Accent' })

                Library:Create("UIGradient", {
                    Name = "\0",
                    Parent = Items["Inline"].Instance,
                    Rotation = 90,
                    Color = ColorSequence.new {
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                        ColorSequenceKeypoint.new(1, Color3.fromRGB(172, 172, 172))
                    }
                })

                Items["Text"] = Library:Create("TextLabel", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["Toggle"].Instance,
                    TextColor3 = Color3.fromRGB(100, 100, 100),
                    Text = Toggle.Name,
                    AnchorPoint = Vector2.new(0, 0.5),
                    Size = UDim2.new(0, 0, 0, 12),
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0, ToggleTextOffset, 0.5, -1),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.X
                }):AddToTheme({ TextColor3 = 'Inactive Text' })

                if Toggle.Risky then
                    Items["Text"]:ChangeItemTheme({ TextColor3 = "Risky" })
                    Items["Text"].Instance.TextColor3 = Library.Theme["Risky"]
                end

                Items["SubElements"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["Toggle"].Instance,
                    AnchorPoint = Vector2.new(1, 0),
                    BackgroundTransparency = 1,
                    Position = UDim2.new(1, 0, 0, 0),
                    Size = UDim2.new(0, 0, 1, 0),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.X
                })

                Library:Create("UIListLayout", {
                    Name = "\0",
                    Parent = Items["SubElements"].Instance,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    FillDirection = Enum.FillDirection.Horizontal,
                    HorizontalAlignment = Enum.HorizontalAlignment.Right,
                    Padding = UDim.new(0, 6),
                    SortOrder = Enum.SortOrder.LayoutOrder
                })

                Items["Toggle"]:OnHover(function()
                    Items["Indicator"]:Tween({ BackgroundColor3 = Library.Theme["Hovered Element"] })
                end, function()
                    Items["Indicator"]:Tween({ BackgroundColor3 = Library.Theme["Element"] })
                end)

                Toggle.Items = Items
            end

            function Toggle:Set(Bool)
                Toggle.Value = Bool

                if Bool then
                    Items["Inline"]:Tween({ BackgroundTransparency = 0, Size = UDim2.new(1, 0, 1, 0) })
                    if not Toggle.Risky then
                        Items["Text"]:ChangeItemTheme({ TextColor3 = "Text" })
                        Items["Text"]:Tween({ TextColor3 = Library.Theme.Text })
                    end
                else
                    Items["Inline"]:Tween({ BackgroundTransparency = 1, Size = UDim2.new(0, 0, 0, 0) })
                    if not Toggle.Risky then
                        Items["Text"]:ChangeItemTheme({ TextColor3 = "Inactive Text" })
                        Items["Text"]:Tween({ TextColor3 = Library.Theme["Inactive Text"] })
                    end
                end

                Flags[Toggle.Flag] = Bool
                Library:SafeCall(Toggle.Callback, Bool)
            end

            function Toggle:SetVisibility(Bool)
                Items["Toggle"].Instance.Visible = Bool
            end

            function Toggle:SetText(Text)
                Items["Text"].Instance.Text = tostring(Text)
            end

            function Toggle:Settings()
                local Settingss = {
                    IsSettings = true
                }

                Items["SettingsButton"] = Library:Create("ImageButton", {
                    Name = "\0",
                    Parent = Items["SubElements"].Instance,
                    ImageColor3 = Library.Theme["Text"],
                    AutoButtonColor = false,
                    Image = "rbxassetid://124244905334583",
                    BackgroundTransparency = 1,
                    Size = UDim2.new(0, 12, 0, 12),
                    BorderSizePixel = 0
                }):AddToTheme({ ImageColor3 = 'Text' })

                local SettingsItems = {
                    IsOpen = false,
                    Items = {},
                }
                do
                    SettingsItems["ToggleSettings"] = Library:Create("Frame", {
                        Name = "\0",
                        Parent = Library.UnusedHolder.Instance,
                        Position = UDim2.new(0.5156353712081909, 0, 0.08411215990781784, 0),
                        Visible = false,
                        Size = UDim2.new(0, 254, 0, 242),
                        BorderSizePixel = 0,
                        BackgroundColor3 = Library.Theme["Background"]
                    }):AddToTheme({ BackgroundColor3 = 'Background' })

                    Library:Create("UIStroke", {
                        Name = "\0",
                        Parent = SettingsItems["ToggleSettings"].Instance,
                        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                        LineJoinMode = Enum.LineJoinMode.Miter,
                        Color = Library.Theme["Outline"]
                    }):AddToTheme({ Color = 'Outline' })

                    Library:Create("UIStroke", {
                        Name = "\0",
                        Parent = SettingsItems["ToggleSettings"].Instance,
                        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                        LineJoinMode = Enum.LineJoinMode.Miter,
                        Color = Library.Theme["Border"],
                        BorderOffset = UDim.new(0, 1)
                    }):AddToTheme({ Color = 'Border' })

                    SettingsItems["Text"] = Library:Create("TextLabel", {
                        Name = "\0",
                        FontFace = Library.Font,
                        TextSize = Library.FontSize,
                        Parent = SettingsItems["ToggleSettings"].Instance,
                        TextColor3 = Library.Theme["Text"],
                        Text = Toggle.Name,
                        Size = UDim2.new(0, 0, 0, 12),
                        BackgroundTransparency = 1,
                        Position = UDim2.new(0, 28, 0, 9),
                        BorderSizePixel = 0,
                        AutomaticSize = Enum.AutomaticSize.X
                    }):AddToTheme({ TextColor3 = 'Text' })

                    SettingsItems["Content"] = Library:Create("ScrollingFrame", {
                        Name = "\0",
                        Parent = SettingsItems["ToggleSettings"].Instance,
                        AutomaticCanvasSize = Enum.AutomaticSize.Y,
                        BorderSizePixel = 0,
                        CanvasSize = UDim2.new(0, 0, 0, 0),
                        MidImage = "rbxassetid://86870199131153",
                        ClipsDescendants = true,
                        ScrollBarThickness = 2,
                        Size = UDim2.new(1, 0, 1, -30),
                        Selectable = false,
                        BackgroundTransparency = 1,
                        Position = UDim2.new(0, 0, 0, 30),
                        BottomImage = "rbxassetid://86870199131153",
                        TopImage = "rbxassetid://86870199131153"
                    })

                    Library:Create("UIPadding", {
                        Name = "\0",
                        Parent = SettingsItems["Content"].Instance,
                        PaddingTop = UDim.new(0, 5),
                        PaddingBottom = UDim.new(0, 5),
                        PaddingRight = UDim.new(0, 10),
                        PaddingLeft = UDim.new(0, 10)
                    })

                    Library:Create("UIListLayout", {
                        Name = "\0",
                        Parent = SettingsItems["Content"].Instance,
                        Padding = UDim.new(0, 5),
                        SortOrder = Enum.SortOrder.LayoutOrder
                    })

                    SettingsItems["SettingsButton"] = Library:Create("ImageButton", {
                        Name = "\0",
                        Parent = SettingsItems["ToggleSettings"].Instance,
                        ImageColor3 = Library.Theme["Text"],
                        AutoButtonColor = false,
                        Image = "rbxassetid://124244905334583",
                        BackgroundTransparency = 1,
                        Position = UDim2.new(0, 10, 0, 10),
                        Size = UDim2.new(0, 12, 0, 12),
                        BorderSizePixel = 0
                    }):AddToTheme({ ImageColor3 = 'Text' })

                    Settingss.Items = SettingsItems
                end

                local Debounce = false
                local RenderStepped
                local SettingsHolder = SettingsItems["ToggleSettings"].Instance
                local SettingsButton = Items["SettingsButton"].Instance

                Settingss.AttachedButton = SettingsButton
                Settingss.CanUpdateNow = false
                Settingss.Frame = SettingsHolder

                function Settingss:SetOpen(Bool)
                    if Debounce then
                        return
                    end

                    Settingss.IsOpen = Bool

                    Debounce = true

                    if Settingss.IsOpen then
                        SettingsHolder.Position = UDim2.new(0, SettingsButton.AbsolutePosition.X, 0,
                            SettingsButton.AbsolutePosition.Y + SettingsButton.AbsoluteSize.Y + GuiInset)

                        SettingsHolder.Parent = Library.Holder.Instance
                        SettingsHolder.Visible = true
                        SettingsItems["ToggleSettings"]:Tween({
                            Position = UDim2.new(0, SettingsButton.AbsolutePosition
                                .X, 0, SettingsButton.AbsolutePosition.Y + SettingsButton.AbsoluteSize.Y + 10 + GuiInset)
                        })

                        SettingsItems["ToggleSettings"]:FadeDescendants(true, function()
                            Debounce = false
                            Settingss.CanUpdateNow = true
                        end)

                        for Index, Value in Library.OpenFrames do
                            Value:SetOpen(false)
                        end

                        Library.OpenFrames[Settingss] = Settingss
                    else
                        for _, OpenFrame in Library.OpenFrames do
                            if OpenFrame
                                and OpenFrame ~= Settingss
                                and OpenFrame.IsOpen
                                and OpenFrame.SetOpen
                                and OpenFrame.AttachedButton
                                and OpenFrame.AttachedButton:IsDescendantOf(SettingsHolder)
                            then
                                OpenFrame:SetOpen(false)
                            end
                        end

                        for _, OpenFrame in Library.OpenFrames do
                            if OpenFrame and OpenFrame ~= Settingss and OpenFrame.IsOpen and OpenFrame.SetOpen then
                                OpenFrame:SetOpen(false)
                            end
                        end

                        SettingsItems["ToggleSettings"]:Tween({
                            Position = UDim2.new(0, SettingsButton.AbsolutePosition
                                .X, 0, SettingsButton.AbsolutePosition.Y + SettingsButton.AbsoluteSize.Y - 10 + GuiInset)
                        })
                        SettingsItems["ToggleSettings"]:FadeDescendants(false, function()
                            SettingsHolder.Parent = Library.UnusedHolder.Instance
                            Debounce = false
                            Settingss.CanUpdateNow = false
                        end)

                        if Library.OpenFrames[Settingss] then
                            Library.OpenFrames[Settingss] = nil
                        end

                        if RenderStepped then
                            RenderStepped:Disconnect()
                            RenderStepped = nil
                        end
                    end

                    local Descendants = SettingsHolder:GetDescendants()
                    table.insert(Descendants, SettingsHolder)

                    for Index, Value in Descendants do
                        if Value.ClassName:find("UI") then
                            continue
                        end

                        Value.ZIndex = Settingss.IsOpen and 2 or 1
                    end
                end

                Items["SettingsButton"]:Connect("MouseButton1Down", function()
                    Settingss:SetOpen(not Settingss.IsOpen)
                end)

                Library:Connect(UserInputService.InputBegan, function(Input)
                    if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                        if Settingss.IsOpen then
                            if SettingsItems["ToggleSettings"]:IsMouseOverFrame() then
                                return
                            end

                            for _, OpenFrame in Library.OpenFrames do
                                if OpenFrame
                                    and OpenFrame ~= Settingss
                                    and OpenFrame.IsOpen
                                    and OpenFrame.Frame
                                    and OpenFrame.Frame:IsMouseOverFrame()
                                then
                                    return
                                end
                            end

                            Settingss:SetOpen(false)
                        end
                    end
                end)

                return setmetatable(Settingss, Library)
            end

            function Toggle:Colorpicker(Data)
                Data = Data or {}

                local Colorpicker = {
                    Flag = Data.Flag or Data.flag or (Data.Name or Data.name or Toggle.Name),
                    Default = Data.Default or Data.default or Color3.fromRGB(255, 255, 255),
                    Callback = Data.Callback or Data.callback or function() end,
                    Alpha = Data.Alpha or Data.alpha or 0,

                    Window = Toggle.Window,
                    Page = Toggle.Page,
                    Section = Toggle.Section,
                }

                local NewColorpicker, ColorpickerItems = Library:CreateColorpicker({
                    Parent = Items["SubElements"],
                    Page = Colorpicker.Page,
                    Section = Colorpicker.Section,
                    Flag = Colorpicker.Flag,
                    Default = Colorpicker.Default,
                    Callback = Colorpicker.Callback,
                    Alpha = Colorpicker.Alpha
                })

                return NewColorpicker
            end

            function Toggle:Keybind(Data)
                Data = Data or {}

                local Keybind = {
                    Name = Data.Name or Data.name or Toggle.Name,
                    Flag = Data.Flag or Data.flag or (Data.Name or Data.name or Toggle.Name),
                    Default = Data.Default or Data.default,
                    Callback = Data.Callback or Data.callback or function() end,
                    Mode = Data.Mode or Data.mode or "Toggle",

                    Window = Toggle.Window,
                    Page = Toggle.Page,
                    Section = Toggle.Section,
                }

                local NewKeybind, KeybindItems = Library:CreateKeybind({
                    Parent = Items["SubElements"],
                    Name = Keybind.Name,
                    Page = Keybind.Page,
                    Section = Keybind.Section,
                    Flag = Keybind.Flag,
                    Default = Keybind.Default,
                    Mode = Keybind.Mode,
                    Callback = Keybind.Callback
                })

                return NewKeybind
            end

            Items["Toggle"]:Connect("MouseButton1Down", function()
                Toggle:Set(not Toggle.Value)
            end)

            Toggle:Set(Toggle.Default)

            SetFlags[Toggle.Flag] = function(Value)
                Toggle:Set(Value)
            end

            return setmetatable(Toggle, Library)
        end

        Library.Button = function(Self, Params)
            Params = Params or {}

            local Button = {
                Name = Params.Name or Params.name or "Button",
                Callback = Params.Callback or Params.callback or function() end,
                Tooltip = Params.Tooltip or Params.tooltip or nil,

                Window = Self.Window,
                Page = Self.Page,
                Section = Self,
                Items = {}
            }

            local Items = {}
            do
                Items["Button"] = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Button.Section.Items["Content"].Instance,
                    TextColor3 = Color3.fromRGB(0, 0, 0),
                    Text = "",
                    AutoButtonColor = false,
                    Size = UDim2.new(1, 0, 0, 18),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Element"]
                }):AddToTheme({ BackgroundColor3 = 'Element' })

                Items["Button"]:Tooltip(Button.Tooltip)

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["Button"].Instance,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    Color = Library.Theme["Border"],
                    BorderOffset = UDim.new(0, 1)
                }):AddToTheme({ Color = 'Border' })

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["Button"].Instance,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    Color = Library.Theme["Outline"]
                }):AddToTheme({ Color = 'Outline' })

                Library:Create("UIGradient", {
                    Name = "\0",
                    Parent = Items["Button"].Instance,
                    Rotation = -90,
                    Color = ColorSequence.new {
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                        ColorSequenceKeypoint.new(1, Color3.fromRGB(172, 172, 172))
                    }
                })

                Items["Text"] = Library:Create("TextLabel", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["Button"].Instance,
                    TextColor3 = Library.Theme["Text"],
                    Text = Button.Name,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Size = UDim2.new(0, 0, 0, 15),
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0.5, 0, 0.5, -1),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.X
                }):AddToTheme({ TextColor3 = 'Text' })

                Items["Button"]:OnHover(function()
                    Items["Button"]:Tween({ BackgroundColor3 = Library.Theme["Hovered Element"] })
                end, function()
                    Items["Button"]:Tween({ BackgroundColor3 = Library.Theme["Element"] })
                end)

                Button.Items = Items
            end

            function Button:Press()
                Items["Button"]:ChangeItemTheme({ BackgroundColor3 = "Accent" })
                Items["Button"]:Tween({ BackgroundColor3 = Library.Theme.Accent })
                task.wait(0.1)
                Items["Button"]:ChangeItemTheme({ BackgroundColor3 = "Element" })
                Items["Button"]:Tween({ BackgroundColor3 = Library.Theme.Element })

                Library:SafeCall(Button.Callback)
            end

            function Button:SetVisibility(Bool)
                Items["Button"].Instance.Visible = Bool
            end

            function Button:SetText(Text)
                Items["Text"].Instance.Text = tostring(Text)
            end

            Items["Button"]:Connect("MouseButton1Down", function()
                Button:Press()
            end)

            return setmetatable(Button, Library)
        end

        Library.Slider = function(Self, Params)
            Params = Params or {}

            local Slider = {
                Name = Params.Name or Params.name or "Slider",
                Flag = Params.Flag or Params.flag or (Params.Name or Params.name),
                Default = Params.Default or Params.default or 0,
                Min = Params.Min or Params.min or 0,
                Tooltip = Params.Tooltip or Params.tooltip or nil,
                Max = Params.Max or Params.max or 100,
                Callback = Params.Callback or Params.callback or function() end,
                Decimals = Params.Decimals or Params.decimals or 0,
                Suffix = Params.Suffix or Params.suffix or "",

                Window = Self.Window,
                Page = Self.Page,
                Section = Self,

                Value = 0,
                Sliding = false,
                Items = {}
            }

            local Items = {}
            do
                Items["Slider"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Slider.Section.Items["Content"].Instance,
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, 0, 0, 25),
                    BorderSizePixel = 0
                })

                Items["Slider"]:Tooltip(Slider.Tooltip)

                Items["Text"] = Library:Create("TextLabel", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["Slider"].Instance,
                    TextColor3 = Library.Theme["Text"],
                    Text = Slider.Name,
                    BackgroundTransparency = 1,
                    Size = UDim2.new(0, 0, 0, 12),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.X
                }):AddToTheme({ TextColor3 = 'Text' })

                Items["RealSlider"] = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["Slider"].Instance,
                    TextColor3 = Color3.fromRGB(0, 0, 0),
                    Text = "",
                    AutoButtonColor = false,
                    AnchorPoint = Vector2.new(0, 1),
                    Position = UDim2.new(0, 0, 1, 0),
                    Size = UDim2.new(1, 0, 0, 6),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Element"]
                }):AddToTheme({ BackgroundColor3 = 'Element' })

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["RealSlider"].Instance,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    Color = Library.Theme["Border"]
                }):AddToTheme({ Color = 'Border' })

                Items["Accent"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["RealSlider"].Instance,
                    Size = UDim2.new(1, 0, 1, 0),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Accent"]
                }):AddToTheme({ BackgroundColor3 = 'Accent' })

                Library:Create("UIGradient", {
                    Name = "\0",
                    Parent = Items["Accent"].Instance,
                    Rotation = -90,
                    Color = ColorSequence.new {
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                        ColorSequenceKeypoint.new(1, Color3.fromRGB(172, 172, 172))
                    }
                })

                Items["Value"] = Library:Create("TextLabel", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["Accent"].Instance,
                    TextColor3 = Library.Theme["Text"],
                    Text = "100%",
                    AnchorPoint = Vector2.new(1, 0),
                    Size = UDim2.new(0, 0, 0, 12),
                    BackgroundTransparency = 1,
                    Position = UDim2.new(1, 0, 0, 0),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.X
                }):AddToTheme({ TextColor3 = 'Text' })

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["Value"].Instance,
                    LineJoinMode = Enum.LineJoinMode.Miter
                })

                Items["RealSlider"]:OnHover(function()
                    Items["RealSlider"]:Tween({ BackgroundColor3 = Library.Theme["Hovered Element"] })
                end, function()
                    Items["RealSlider"]:Tween({ BackgroundColor3 = Library.Theme["Element"] })
                end)

                Slider.Items = Items
            end

            function Slider:Set(Value)
                Slider.Value = Library:Round(math.clamp(Value, Slider.Min, Slider.Max), Slider.Decimals)

                Items["Accent"]:Tween(
                    { Size = UDim2.new((Slider.Value - Slider.Min) / (Slider.Max - Slider.Min), 0, 1, 0) },
                    TweenInfo.new(Library.Animation.Time, Enum.EasingStyle.Quart, Enum.EasingDirection.Out))
                Items["Value"].Instance.Text = string.format("%s%s", Slider.Value, Slider.Suffix)

                Flags[Slider.Flag] = Slider.Value
                Library:SafeCall(Slider.Callback, Slider.Value)
            end

            function Slider:SetVisibility(Bool)
                Items["Slider"].Instance.Visible = Bool
            end

            function Slider:GetSize(Input)
                local SizeX = (Input.Position.X - Items["RealSlider"].Instance.AbsolutePosition.X) /
                    Items["RealSlider"].Instance.AbsoluteSize.X
                local Value = ((Slider.Max - Slider.Min) * SizeX) + Slider.Min

                return Value
            end

            function Slider:SetText(Text)
                Items["Text"].Instance.Text = tostring(Text)
            end

            local InputChanged

            Items["RealSlider"]:Connect("InputBegan", function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                    Slider.Sliding = true

                    local Value = Slider:GetSize(Input)

                    Slider:Set(Value)

                    if InputChanged then
                        return
                    end

                    InputChanged = Input.Changed:Connect(function()
                        if Input.UserInputState == Enum.UserInputState.End then
                            Slider.Sliding = false

                            InputChanged:Disconnect()
                            InputChanged = nil
                        end
                    end)
                end
            end)

            Library:Connect(UserInputService.InputChanged, function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch then
                    if Slider.Sliding then
                        local Value = Slider:GetSize(Input)

                        Slider:Set(Value)
                    end
                end
            end)

            Slider:Set(Slider.Default)

            SetFlags[Slider.Flag] = function(Value)
                Slider:Set(Value)
            end

            return setmetatable(Slider, Library)
        end

        Library.Dropdown = function(Self, Params)
            Params = Params or {}

            local Dropdown = {
                Name = Params.Name or Params.name or "Dropdown",
                OptionItems = Params.Items or Params.items or {},
                Tooltip = Params.Tooltip or Params.tooltip or nil,
                Flag = Params.Flag or Params.flag or (Params.Name or Params.name),
                Default = Params.Default or Params.default or "",
                Callback = Params.Callback or Params.callback or function() end,
                Multi = Params.Multi or Params.multi or false,

                Window = Self.Window,
                Page = Self.Page,
                Section = Self,

                Value = {},
                Options = {},
                IsOpen = false,
                Items = {}
            }

            local Parent

            if Params.Parent then
                Parent = Params.Parent
            else
                Parent = Dropdown.Section.Items["Content"]
            end

            local Items = {}
            do
                Items["Dropdown"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Parent.Instance,
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, 0, 0, 40),
                    BorderSizePixel = 0
                })

                Items["Dropdown"]:Tooltip(Dropdown.Tooltip)

                Items["RealDropdown"] = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["Dropdown"].Instance,
                    TextColor3 = Color3.fromRGB(0, 0, 0),
                    Text = "",
                    AutoButtonColor = false,
                    AnchorPoint = Vector2.new(0, 1),
                    Position = UDim2.new(0, 0, 1, 0),
                    Size = UDim2.new(1, 0, 0, 20),
                    ClipsDescendants = true,
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Element"]
                }):AddToTheme({ BackgroundColor3 = 'Element' })

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["RealDropdown"].Instance,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    Color = Library.Theme["Border"],
                    BorderOffset = UDim.new(0, 1)
                }):AddToTheme({ Color = 'Border' })

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["RealDropdown"].Instance,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    Color = Library.Theme["Outline"]
                }):AddToTheme({ Color = 'Outline' })

                Library:Create("UIGradient", {
                    Name = "\0",
                    Parent = Items["RealDropdown"].Instance,
                    Rotation = -90,
                    Color = ColorSequence.new {
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                        ColorSequenceKeypoint.new(1, Color3.fromRGB(172, 172, 172))
                    }
                })

                Items["Value"] = Library:Create("TextLabel", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["RealDropdown"].Instance,
                    TextColor3 = Library.Theme["Text"],
                    Text = "...",
                    AnchorPoint = Vector2.new(0, 0.5),
                    Size = UDim2.new(1, -24, 0, 15),
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0, 8, 0.5, -1),
                    BorderSizePixel = 0,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextTruncate = Enum.TextTruncate.AtEnd
                }):AddToTheme({ TextColor3 = 'Text' })

                Items["Icon"] = Library:Create("ImageLabel", {
                    Name = "\0",
                    Parent = Items["RealDropdown"].Instance,
                    ImageColor3 = Library.Theme["Text"],
                    AnchorPoint = Vector2.new(1, 0.5),
                    Image = "rbxassetid://88550711858254",
                    BackgroundTransparency = 1,
                    Position = UDim2.new(1, -4, 0.5, 0),
                    Size = UDim2.new(0, 14, 0, 14),
                    BorderSizePixel = 0
                }):AddToTheme({ ImageColor3 = 'Text' })

                Items["Text"] = Library:Create("TextLabel", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["Dropdown"].Instance,
                    TextColor3 = Library.Theme["Text"],
                    Text = Dropdown.Name,
                    BackgroundTransparency = 1,
                    Size = UDim2.new(0, 0, 0, 12),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.X
                }):AddToTheme({ TextColor3 = 'Text' })

                Items["OptionHolder"] = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Library.UnusedHolder.Instance,
                    Visible = false,
                    TextColor3 = Color3.fromRGB(0, 0, 0),
                    Text = "",
                    AutoButtonColor = false,
                    Size = UDim2.new(0, 210, 0, 50),
                    Position = UDim2.new(0, 1056, 0, 521),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.Y,
                    BackgroundColor3 = Library.Theme["Background"]
                }):AddToTheme({ BackgroundColor3 = 'Background' })

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["OptionHolder"].Instance,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    Color = Library.Theme["Outline"]
                }):AddToTheme({ Color = 'Outline' })

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["OptionHolder"].Instance,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    Color = Library.Theme["Border"],
                    BorderOffset = UDim.new(0, 1)
                }):AddToTheme({ Color = 'Border' })

                Library:Create("UIListLayout", {
                    Name = "\0",
                    Parent = Items["OptionHolder"].Instance,
                    Padding = UDim.new(0, 3),
                    SortOrder = Enum.SortOrder.LayoutOrder
                })

                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["OptionHolder"].Instance,
                    PaddingTop = UDim.new(0, 4),
                    PaddingLeft = UDim.new(0, 8),
                    PaddingBottom = UDim.new(0, 6)
                })

                Items["RealDropdown"]:OnHover(function()
                    Items["RealDropdown"]:Tween({ BackgroundColor3 = Library.Theme["Hovered Element"] })
                end, function()
                    Items["RealDropdown"]:Tween({ BackgroundColor3 = Library.Theme["Element"] })
                end)

                Dropdown.Items = Items
            end

            function Dropdown:Set(Value)
                if Dropdown.Multi then
                    if type(Value) ~= "table" then
                        return
                    end

                    Dropdown.Value = Value

                    for Index, Value in Value do
                        local OptionData = Dropdown.Options[Value]

                        if not OptionData then
                            continue
                        end

                        OptionData.IsSelected = true
                        OptionData:ToggleState("Active")
                    end

                    Flags[Dropdown.Flag] = Value
                    Items["Value"].Instance.Text = table.concat(Value, ", ")
                else
                    if not Dropdown.Options[Value] then
                        return
                    end

                    local OptionData = Dropdown.Options[Value]

                    Dropdown.Value = Value

                    for Index, Value in Dropdown.Options do
                        if Value ~= OptionData then
                            Value.IsSelected = false
                            Value:ToggleState("Inactive")
                        else
                            Value.Selected = true
                            Value:ToggleState("Active")
                        end
                    end

                    Flags[Dropdown.Flag] = Value
                    Items["Value"].Instance.Text = Value
                end

                Library:SafeCall(Dropdown.Callback, Dropdown.Value)
            end

            function Dropdown:Add(Value)
                local OptionButton = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["OptionHolder"].Instance,
                    TextColor3 = Library.Theme["Text"],
                    Text = Value,
                    AutoButtonColor = false,
                    BackgroundTransparency = 1,
                    Size = UDim2.new(0, 0, 0, 15),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.X
                }):AddToTheme({ TextColor3 = 'Text' })

                local OptionData = {
                    Button = OptionButton,
                    Name = Value,
                    IsSelected = false
                }

                function OptionData:ToggleState(Value)
                    if Value == "Active" then
                        OptionData.Button:ChangeItemTheme({ TextColor3 = "Accent" })
                        OptionData.Button:Tween({ TextColor3 = Library.Theme.Accent })
                    else
                        OptionData.Button:ChangeItemTheme({ TextColor3 = "Text" })
                        OptionData.Button:Tween({ TextColor3 = Library.Theme.Text })
                    end
                end

                function OptionData:Set()
                    OptionData.IsSelected = not OptionData.IsSelected

                    if Dropdown.Multi then
                        local Index = table.find(Dropdown.Value, OptionData.Name)

                        if Index then
                            table.remove(Dropdown.Value, Index)
                        else
                            table.insert(Dropdown.Value, OptionData.Name)
                        end

                        OptionData:ToggleState(Index and "Inactive" or "Active")

                        Flags[Dropdown.Flag] = Dropdown.Value

                        local TextFormat = #Dropdown.Value > 0 and table.concat(Dropdown.Value, ", ") or ""
                        Items["Value"].Instance.Text = TextFormat
                    else
                        if OptionData.IsSelected then
                            Dropdown.Value = OptionData.Name
                            Flags[Dropdown.Flag] = OptionData.Name

                            OptionData.IsSelected = true
                            OptionData:ToggleState("Active")

                            for Index, Value in Dropdown.Options do
                                if Value ~= OptionData then
                                    Value.IsSelected = false
                                    Value:ToggleState("Inactive")
                                end
                            end

                            Items["Value"].Instance.Text = OptionData.Name
                        else
                            Dropdown.Value = nil
                            Flags[Dropdown.Flag] = nil

                            OptionData.IsSelected = false
                            OptionData:ToggleState("Inactive")

                            Items["Value"].Instance.Text = "..."
                        end
                    end

                    Library:SafeCall(Dropdown.Callback, Dropdown.Value)
                end

                OptionData.Button:Connect("MouseButton1Down", function()
                    OptionData:Set()
                end)

                Dropdown.Options[OptionData.Name] = OptionData
                return OptionData
            end

            function Dropdown:Remove(Option)
                if Dropdown.Options[Option] then
                    Dropdown.Options[Option].Button.Instance:Destroy()
                    Dropdown.Options[Option] = nil
                end
            end

            function Dropdown:Refresh(List)
                for Index, Value in Dropdown.Options do
                    Dropdown:Remove(Value.Name)
                end

                for Index, Value in List do
                    Dropdown:Add(Value)
                end
            end

            function Dropdown:SetText(Text)
                Items["Text"].Instance.Text = tostring(Text)
            end

            function Dropdown:SetVisibility(Bool)
                Items["Dropdown"].Instance.Visible = Bool
            end

            local Debounce = false
            local RenderStepped
            local OptionHolder = Items["OptionHolder"].Instance
            local RealDropdown = Items["RealDropdown"].Instance

            Dropdown.AttachedButton = RealDropdown
            Dropdown.CanUpdateNow = false
            Dropdown.Frame = OptionHolder

            function Dropdown:SetOpen(Bool)
                if Debounce then
                    return
                end

                Dropdown.IsOpen = Bool

                Debounce = true

                if Dropdown.IsOpen then
                    Items["Icon"]:Tween({ Rotation = -90 })
                    OptionHolder.Position = UDim2.new(0, RealDropdown.AbsolutePosition.X, 0,
                        RealDropdown.AbsolutePosition.Y + RealDropdown.AbsoluteSize.Y + GuiInset)
                    OptionHolder.Size = UDim2.new(0, RealDropdown.AbsoluteSize.X, 0, Dropdown.MaxSize)

                    OptionHolder.Parent = Library.Holder.Instance
                    OptionHolder.Visible = true
                    Items["OptionHolder"]:Tween({
                        Position = UDim2.new(0, RealDropdown.AbsolutePosition.X, 0,
                            RealDropdown.AbsolutePosition.Y + RealDropdown.AbsoluteSize.Y + 10 + GuiInset)
                    })

                    Items["OptionHolder"]:FadeDescendants(true, function()
                        Debounce = false
                        Dropdown.CanUpdateNow = true
                    end)

                    for Index, Value in Library.OpenFrames do
                        if not Params.Parent and not Dropdown.Section.IsSettings then
                            Value:SetOpen(false)
                        end
                    end

                    Library.OpenFrames[Dropdown] = Dropdown
                else
                    Items["Icon"]:Tween({ Rotation = 0 })
                    Items["OptionHolder"]:Tween({
                        Position = UDim2.new(0, RealDropdown.AbsolutePosition.X, 0,
                            RealDropdown.AbsolutePosition.Y + RealDropdown.AbsoluteSize.Y - 10 + GuiInset)
                    })
                    Items["OptionHolder"]:FadeDescendants(false, function()
                        OptionHolder.Parent = Library.UnusedHolder.Instance
                        Debounce = false
                        Dropdown.CanUpdateNow = false
                    end)

                    if Library.OpenFrames[Dropdown] then
                        Library.OpenFrames[Dropdown] = nil
                    end

                    if RenderStepped then
                        RenderStepped:Disconnect()
                        RenderStepped = nil
                    end
                end

                local Descendants = OptionHolder:GetDescendants()
                table.insert(Descendants, OptionHolder)

                for Index, Value in Descendants do
                    if Value.ClassName:find("UI") then
                        continue
                    end

                    if not Params.Parent then
                        Value.ZIndex = Dropdown.IsOpen and 3 or 1
                    else
                        Value.ZIndex = Dropdown.IsOpen and 6 or 1
                    end
                end
            end

            Items["RealDropdown"]:Connect("MouseButton1Down", function()
                Dropdown:SetOpen(not Dropdown.IsOpen)
            end)

            Library:Connect(UserInputService.InputBegan, function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                    if Dropdown.IsOpen then
                        if Items["OptionHolder"]:IsMouseOverFrame() then
                            return
                        end

                        Dropdown:SetOpen(false)
                    end
                end
            end)

            Items["RealDropdown"]:Connect("Changed", function(Property)
                if Property == "AbsolutePosition" and Dropdown.IsOpen then
                    local Section = Dropdown.Section
                    local SectionItem = Section and Section.Items and Section.Items["Section"]
                    local SectionInstance = SectionItem and SectionItem.Instance
                    local SectionParent = SectionInstance and SectionInstance.Parent

                    if SectionParent then
                        Dropdown.IsOpen = not Items["OptionHolder"]:IsClipped(SectionParent)
                    else
                        Dropdown.IsOpen = false
                    end
                    Items["OptionHolder"].Instance.Visible = Dropdown.IsOpen
                end
            end)

            for Index, Value in Dropdown.OptionItems do
                Dropdown:Add(Value)
            end

            Dropdown:Set(Dropdown.Default)

            SetFlags[Dropdown.Flag] = function(Value)
                Dropdown:Set(Value)
            end

            return setmetatable(Dropdown, Library)
        end

        Library.Label = function(Self, Params)
            Params = Params or {}

            local Label = {
                Name = Params.Name or Params.name or "Label",
                Tooltip = Params.Tooltip or Params.tooltip or nil,

                Window = Self.Window,
                Page = Self.Page,
                Section = Self,

                Items = {}
            }

            local Items = {}
            do
                Items["Label"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Label.Section.Items["Content"].Instance,
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, 0, 0, 12),
                    BorderSizePixel = 0
                })

                Items["Label"]:Tooltip(Label.Tooltip)

                Items["Text"] = Library:Create("TextLabel", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["Label"].Instance,
                    TextColor3 = Library.Theme["Text"],
                    Text = Label.Name,
                    AnchorPoint = Vector2.new(0, 0.5),
                    Size = UDim2.new(0, 0, 0, 12),
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0, 0, 0.5, 0),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.X
                }):AddToTheme({ TextColor3 = 'Text' })

                Items["SubElements"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["Label"].Instance,
                    AnchorPoint = Vector2.new(1, 0),
                    BackgroundTransparency = 1,
                    Position = UDim2.new(1, 0, 0, 0),
                    Size = UDim2.new(0, 0, 1, 0),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.X
                })

                Library:Create("UIListLayout", {
                    Name = "\0",
                    Parent = Items["SubElements"].Instance,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    FillDirection = Enum.FillDirection.Horizontal,
                    HorizontalAlignment = Enum.HorizontalAlignment.Right,
                    Padding = UDim.new(0, 6),
                    SortOrder = Enum.SortOrder.LayoutOrder
                })

                Label.Items = Items
            end

            function Label:SetVisibility(Bool)
                Items["Label"].Instance.Visible = Bool
            end

            function Label:SetText(Text)
                Items["Text"].Instance.Text = tostring(Text)
            end

            function Label:Colorpicker(Data)
                Data = Data or {}

                local Colorpicker = {
                    Flag = Data.Flag or Data.flag or (Data.Name or Data.name or Label.Name),
                    Default = Data.Default or Data.default or Color3.fromRGB(255, 255, 255),
                    Callback = Data.Callback or Data.callback or function() end,
                    Alpha = Data.Alpha or Data.alpha or 0,

                    Window = Label.Window,
                    Page = Label.Page,
                    Section = Label.Section,
                }

                local NewColorpicker, ColorpickerItems = Library:CreateColorpicker({
                    Parent = Items["SubElements"],
                    Page = Colorpicker.Page,
                    Section = Colorpicker.Section,
                    Flag = Colorpicker.Flag,
                    Default = Colorpicker.Default,
                    Callback = Colorpicker.Callback,
                    Alpha = Colorpicker.Alpha
                })

                return NewColorpicker
            end

            function Label:Keybind(Data)
                Data = Data or {}

                local Keybind = {
                    Name = Data.Name or Data.name or Label.Name,
                    Flag = Data.Flag or Data.flag or (Data.Name or Data.name or Label.Name),
                    Default = Data.Default or Data.default,
                    Callback = Data.Callback or Data.callback or function() end,
                    Mode = Data.Mode or Data.mode or "Toggle",

                    Window = Label.Window,
                    Page = Label.Page,
                    Section = Label.Section,
                }

                local NewKeybind, KeybindItems = Library:CreateKeybind({
                    Parent = Items["SubElements"],
                    Name = Keybind.Name,
                    Page = Keybind.Page,
                    Section = Keybind.Section,
                    Flag = Keybind.Flag,
                    Default = Keybind.Default,
                    Mode = Keybind.Mode,
                    Callback = Keybind.Callback
                })

                return NewKeybind
            end

            Label:SetText(Label.Name)

            return setmetatable(Label, Library)
        end

        Library.Textbox = function(Self, Params)
            Params = Params or {}

            local Textbox = {
                Name = Params.Name or Params.name or "Textbox",
                Flag = Params.Flag or Params.flag or (Params.Name or Params.name),
                Default = Params.Default or Params.default or "",
                Callback = Params.Callback or Params.callback or function() end,
                Tooltip = Params.Tooltip or Params.tooltip or nil,
                Finished = Params.Finished or Params.finished or false,
                Numeric = Params.Numeric or Params.numeric or false,
                Placeholder = Params.Placeholder or Params.placeholder or "...",

                Window = Self.Window,
                Page = Self.Page,
                Section = Self,
                Value = "",

                Items = {},
            }

            local Items = {}
            do
                Items["Textbox"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Textbox.Section.Items["Content"].Instance,
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, 0, 0, 20),
                    BorderSizePixel = 0
                })

                Items["Textbox"]:Tooltip(Textbox.Tooltip)

                Items["Background"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["Textbox"].Instance,
                    ClipsDescendants = true,
                    Size = UDim2.new(1, 0, 1, 0),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Element"]
                }):AddToTheme({ BackgroundColor3 = 'Element' })

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["Background"].Instance,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    Color = Library.Theme["Outline"]
                }):AddToTheme({ Color = 'Outline' })

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["Background"].Instance,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    Color = Library.Theme["Border"],
                    BorderOffset = UDim.new(0, 1)
                }):AddToTheme({ Color = 'Border' })

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["Background"].Instance,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    Color = Library.Theme["Border"],
                    BorderOffset = UDim.new(0, -1)
                }):AddToTheme({ Color = 'Border' })

                Items["Input"] = Library:Create("TextBox", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["Background"].Instance,
                    AnchorPoint = Vector2.new(0, 0.5),
                    PlaceholderColor3 = Library.Theme["Inactive Text"],
                    PlaceholderText = Textbox.Placeholder,
                    Size = UDim2.new(1, -16, 0, 15),
                    TextColor3 = Library.Theme["Text"],
                    Text = "",
                    BackgroundTransparency = 1,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Position = UDim2.new(0, 8, 0.5, -1),
                    ClearTextOnFocus = false,
                    BorderSizePixel = 0
                }):AddToTheme({ TextColor3 = 'Text' })

                Textbox.Items = Items
            end

            function Textbox:SetVisibility(Bool)
                Items["Textbox"].Instance.Visible = Bool
            end

            function Textbox:SetText(Text)
                Items["Text"].Instance.Text = tostring(Text)
            end

            function Textbox:Set(Value)
                if Textbox.Numeric then
                    if (not tonumber(Value)) and string.len(tostring(Value)) > 0 then
                        Value = Textbox.Value
                    end
                end

                Textbox.Value = Value
                Items["Input"].Instance.Text = Value
                Flags[Textbox.Flag] = Value

                Library:SafeCall(Textbox.Callback, Value)
            end

            if Textbox.Finished then
                Items["Input"]:Connect("FocusLost", function(PressedEnterQuestionMark)
                    if PressedEnterQuestionMark then
                        Textbox:Set(Items["Input"].Instance.Text)
                    end
                end)
            else
                Library:Connect(Items["Input"].Instance:GetPropertyChangedSignal("Text"), function()
                    Textbox:Set(Items["Input"].Instance.Text)
                end)
            end

            Textbox:Set(Textbox.Default)

            SetFlags[Textbox.Flag] = function(Value)
                Textbox:Set(Value)
            end

            return setmetatable(Textbox, Library)
        end

        Library.Searchbox = function(Self, Params) -- just the dropdown func with diff items
            Params = Params or {}

            local Dropdown = {
                OptionItems = Params.Items or Params.items or {},
                Tooltip = Params.Tooltip or Params.tooltip or nil,
                Flag = Params.Flag or Params.flag or (Params.Name or Params.name),
                Default = Params.Default or Params.default or "",
                Callback = Params.Callback or Params.callback or function() end,
                Multi = Params.Multi or Params.multi or false,

                Window = Self.Window,
                Page = Self.Page,
                Section = Self,

                Value = {},
                Options = {},
                Items = {}
            }

            local Items = {}
            do
                Items["Searchbox"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Dropdown.Section.Items["Content"].Instance,
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, 0, 0, 173),
                    BorderSizePixel = 0
                })

                Items["Search"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["Searchbox"].Instance,
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, 0, 0, 20),
                    BorderSizePixel = 0
                })

                Items["SearchBackground"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["Search"].Instance,
                    ClipsDescendants = true,
                    Size = UDim2.new(1, 0, 1, 0),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Element"]
                }):AddToTheme({ BackgroundColor3 = 'Element' })

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["SearchBackground"].Instance,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    Color = Library.Theme["Outline"]
                }):AddToTheme({ Color = 'Outline' })

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["SearchBackground"].Instance,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    Color = Library.Theme["Border"],
                    BorderOffset = UDim.new(0, 1)
                }):AddToTheme({ Color = 'Border' })

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["SearchBackground"].Instance,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    Color = Library.Theme["Border"],
                    BorderOffset = UDim.new(0, -1)
                }):AddToTheme({ Color = 'Border' })

                Items["Input"] = Library:Create("TextBox", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["SearchBackground"].Instance,
                    AnchorPoint = Vector2.new(0, 0.5),
                    PlaceholderColor3 = Library.Theme["Inactive Text"],
                    PlaceholderText = "Search",
                    Size = UDim2.new(1, -16, 0, 15),
                    TextColor3 = Library.Theme["Text"],
                    Text = "",
                    BackgroundTransparency = 1,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Position = UDim2.new(0, 8, 0.5, 0),
                    ClearTextOnFocus = false,
                    BorderSizePixel = 0
                }):AddToTheme({ TextColor3 = 'Text', PlaceholderColor3 = 'Inactive Text' })

                Items["RealSearchbox"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["Searchbox"].Instance,
                    Position = UDim2.new(0, 0, 0, 25),
                    Size = UDim2.new(1, 0, 1, -25),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme["Element"]
                }):AddToTheme({ BackgroundColor3 = 'Element' })

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["RealSearchbox"].Instance,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    Color = Library.Theme["Border"],
                    BorderOffset = UDim.new(0, 1)
                }):AddToTheme({ Color = 'Border' })

                Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = Items["RealSearchbox"].Instance,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    Color = Library.Theme["Outline"]
                }):AddToTheme({ Color = 'Outline' })

                Items["Holder"] = Library:Create("ScrollingFrame", {
                    Name = "\0",
                    Parent = Items["RealSearchbox"].Instance,
                    Active = true,
                    AutomaticCanvasSize = Enum.AutomaticSize.Y,
                    BorderSizePixel = 0,
                    CanvasSize = UDim2.new(0, 0, 0, 0),
                    ScrollBarImageColor3 = Library.Theme["Accent"],
                    MidImage = "rbxassetid://129030709932941",
                    ScrollBarThickness = 1,
                    Size = UDim2.new(1, -8, 1, -8),
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0, 4, 0, 4),
                    BottomImage = "rbxassetid://129030709932941",
                    TopImage = "rbxassetid://129030709932941"
                }):AddToTheme({ ScrollBarImageColor3 = 'Accent' })

                Library:Create("UIListLayout", {
                    Name = "\0",
                    Parent = Items["Holder"].Instance,
                    Padding = UDim.new(0, 3),
                    SortOrder = Enum.SortOrder.LayoutOrder
                })

                Library:Create("UIPadding", {
                    Name = "\0",
                    Parent = Items["Holder"].Instance,
                    PaddingBottom = UDim.new(0, 6),
                    PaddingLeft = UDim.new(0, 6)
                })

                Dropdown.Items = Items
            end

            function Dropdown:Set(Value)
                if Dropdown.Multi then
                    if type(Value) ~= "table" then
                        return
                    end

                    Dropdown.Value = Value

                    for Index, Value in Value do
                        local OptionData = Dropdown.Options[Value]

                        if not OptionData then
                            continue
                        end

                        OptionData.IsSelected = true
                        OptionData:ToggleState("Active")
                    end

                    Flags[Dropdown.Flag] = Value
                else
                    if not Dropdown.Options[Value] then
                        return
                    end

                    local OptionData = Dropdown.Options[Value]

                    Dropdown.Value = Value

                    for Index, Value in Dropdown.Options do
                        if Value ~= OptionData then
                            Value.IsSelected = false
                            Value:ToggleState("Inactive")
                        else
                            Value.Selected = true
                            Value:ToggleState("Active")
                        end
                    end

                    Flags[Dropdown.Flag] = Value
                end

                Library:SafeCall(Dropdown.Callback, Dropdown.Value)
            end

            function Dropdown:Add(Value)
                local OptionButton = Library:Create("TextButton", {
                    Name = "\0",
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    Parent = Items["Holder"].Instance,
                    TextColor3 = Library.Theme["Text"],
                    Text = Value,
                    AutoButtonColor = false,
                    BackgroundTransparency = 1,
                    Size = UDim2.new(0, 0, 0, 15),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.X
                }):AddToTheme({ TextColor3 = 'Text' })

                local OptionData = {
                    Button = OptionButton,
                    Name = Value,
                    IsSelected = false
                }

                function OptionData:ToggleState(Value)
                    if Value == "Active" then
                        OptionData.Button:ChangeItemTheme({ TextColor3 = "Accent" })
                        OptionData.Button:Tween({ TextColor3 = Library.Theme.Accent })
                    else
                        OptionData.Button:ChangeItemTheme({ TextColor3 = "Text" })
                        OptionData.Button:Tween({ TextColor3 = Library.Theme.Text })
                    end
                end

                function OptionData:Set()
                    OptionData.IsSelected = not OptionData.IsSelected

                    if Dropdown.Multi then
                        local Index = table.find(Dropdown.Value, OptionData.Name)

                        if Index then
                            table.remove(Dropdown.Value, Index)
                        else
                            table.insert(Dropdown.Value, OptionData.Name)
                        end

                        OptionData:ToggleState(Index and "Inactive" or "Active")

                        Flags[Dropdown.Flag] = Dropdown.Value
                    else
                        if OptionData.IsSelected then
                            Dropdown.Value = OptionData.Name
                            Flags[Dropdown.Flag] = OptionData.Name

                            OptionData.IsSelected = true
                            OptionData:ToggleState("Active")

                            for Index, Value in Dropdown.Options do
                                if Value ~= OptionData then
                                    Value.IsSelected = false
                                    Value:ToggleState("Inactive")
                                end
                            end
                        else
                            Dropdown.Value = nil
                            Flags[Dropdown.Flag] = nil

                            OptionData.IsSelected = false
                            OptionData:ToggleState("Inactive")
                        end
                    end

                    Library:SafeCall(Dropdown.Callback, Dropdown.Value)
                end

                OptionData.Button:Connect("MouseButton1Down", function()
                    OptionData:Set()
                end)

                Dropdown.Options[OptionData.Name] = OptionData
                return OptionData
            end

            function Dropdown:Remove(Option)
                if Dropdown.Options[Option] then
                    Dropdown.Options[Option].Button.Instance:Destroy()
                    Dropdown.Options[Option] = nil
                end
            end

            function Dropdown:Refresh(List)
                for Index, Value in Dropdown.Options do
                    Dropdown:Remove(Value.Name)
                end

                for Index, Value in List do
                    Dropdown:Add(Value)
                end
            end

            function Dropdown:SetVisibility(Bool)
                Items["Searchbox"].Instance.Visible = Bool
            end

            Library:Connect(Items["Input"].Instance:GetPropertyChangedSignal("Text"), function()
                for Index, Value in Dropdown.Options do
                    if string.lower(Value.Name):find(string.lower(Items["Input"].Instance.Text)) then
                        Value.Button.Instance.Visible = true
                    else
                        Value.Button.Instance.Visible = false
                    end
                end
            end)

            for Index, Value in Dropdown.OptionItems do
                Dropdown:Add(Value)
            end

            Dropdown:Set(Dropdown.Default)

            SetFlags[Dropdown.Flag] = function(Value)
                Dropdown:Set(Value)
            end

            return setmetatable(Dropdown, Library)
        end

        Library.OpenConfirmDialog = function(Self, Config)
            Config = Config or {}

            local Title = tostring(Config.Title or "Confirm")
            local Message = tostring(Config.Message or "Are you sure you want to continue?")
            local ConfirmText = tostring(Config.ConfirmText or "Confirm")
            local CancelText = tostring(Config.CancelText or "Cancel")
            local AccentColor = Config.AccentColor or Color3.fromRGB(255, 95, 95)
            local Callback = Config.Callback or function() end

            if Self.ActiveConfirmDialog and Self.ActiveConfirmDialog.Close then
                Self.ActiveConfirmDialog:Close(false, true)
            end

            local Items = {}
            local Connections = {}
            local IsClosed = false

            local function AddConnection(Connection)
                table.insert(Connections, Connection)
                return Connection
            end

            local function DisconnectConnections()
                for _, Connection in Connections do
                    if Connection and Connection.Connected then
                        Connection:Disconnect()
                    end
                end
            end

            local function CreateModalButton(Name, Position, Width, TextColor, BackgroundTheme)
                local ButtonItems = {}

                ButtonItems["Button"] = Library:Create("TextButton", {
                    Name = "\0",
                    Parent = Items["Panel"].Instance,
                    Position = Position,
                    Size = UDim2.new(Width, 0, 0, 18),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Library.Theme[BackgroundTheme]
                }):AddToTheme({ BackgroundColor3 = BackgroundTheme })

                ButtonItems["OuterStroke"] = Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = ButtonItems["Button"].Instance,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    Color = Library.Theme["Border"],
                    BorderOffset = UDim.new(0, 1)
                }):AddToTheme({ Color = "Border" })

                ButtonItems["InnerStroke"] = Library:Create("UIStroke", {
                    Name = "\0",
                    Parent = ButtonItems["Button"].Instance,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    Color = Library.Theme["Outline"]
                }):AddToTheme({ Color = "Outline" })

                Library:Create("UIGradient", {
                    Name = "\0",
                    Parent = ButtonItems["Button"].Instance,
                    Rotation = -90,
                    Color = ColorSequence.new {
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                        ColorSequenceKeypoint.new(1, Color3.fromRGB(172, 172, 172))
                    }
                })

                ButtonItems["Label"] = Library:Create("TextLabel", {
                    Name = "\0",
                    Parent = ButtonItems["Button"].Instance,
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0.5, 0, 0.5, -1),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Size = UDim2.new(0, 0, 0, 15),
                    AutomaticSize = Enum.AutomaticSize.X,
                    BorderSizePixel = 0,
                    Text = Name,
                    TextColor3 = TextColor,
                    FontFace = Library.Font,
                    TextSize = Library.FontSize
                })

                ButtonItems["Button"]:OnHover(function()
                    ButtonItems["Button"]:Tween({ BackgroundColor3 = Library.Theme["Hovered Element"] })
                end, function()
                    ButtonItems["Button"]:Tween({ BackgroundColor3 = Library.Theme[BackgroundTheme] })
                end)

                return ButtonItems
            end

            do
                Items["Overlay"] = Library:Create("TextButton", {
                    Name = "\0",
                    Parent = Self.Holder.Instance,
                    Size = UDim2.new(1, 0, 1, 0),
                    BackgroundColor3 = Color3.new(0, 0, 0),
                    BackgroundTransparency = 1,
                    Text = "",
                    AutoButtonColor = false,
                    BorderSizePixel = 0,
                    ZIndex = 9000
                })

                Items["PanelOutline"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["Overlay"].Instance,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.new(0.5, 0, 0.5, 10),
                    Size = UDim2.new(0, 264, 0, 124),
                    BackgroundColor3 = Library.Theme["Outline"],
                    BorderSizePixel = 0,
                    ZIndex = 9001
                }):AddToTheme({ BackgroundColor3 = "Outline" })

                Items["PanelScale"] = Library:Create("UIScale", {
                    Name = "\0",
                    Parent = Items["PanelOutline"].Instance,
                    Scale = 0.94
                })

                Items["Panel"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["PanelOutline"].Instance,
                    Position = UDim2.new(0, 1, 0, 1),
                    Size = UDim2.new(1, -2, 1, -2),
                    BackgroundColor3 = Library.Theme["Section"],
                    BorderSizePixel = 0,
                    ZIndex = 9002
                }):AddToTheme({ BackgroundColor3 = "Section" })

                Items["AccentLine"] = Library:Create("Frame", {
                    Name = "\0",
                    Parent = Items["Panel"].Instance,
                    Size = UDim2.new(1, 0, 0, 1),
                    BorderSizePixel = 0,
                    BackgroundColor3 = AccentColor,
                    ZIndex = 9003
                })

                Items["Title"] = Library:Create("TextLabel", {
                    Name = "\0",
                    Parent = Items["Panel"].Instance,
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0, 12, 0, 10),
                    Size = UDim2.new(1, -24, 0, 12),
                    BorderSizePixel = 0,
                    Text = Title,
                    TextColor3 = Library.Theme["Text"],
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    ZIndex = 9003
                }):AddToTheme({ TextColor3 = "Text" })

                Items["Message"] = Library:Create("TextLabel", {
                    Name = "\0",
                    Parent = Items["Panel"].Instance,
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0, 12, 0, 29),
                    Size = UDim2.new(1, -24, 0, 50),
                    BorderSizePixel = 0,
                    Text = Message,
                    TextColor3 = Library.Theme["Text"],
                    TextTransparency = 0.25,
                    TextWrapped = true,
                    TextYAlignment = Enum.TextYAlignment.Top,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    ZIndex = 9003
                }):AddToTheme({
                    TextColor3 = function()
                        return Library.Theme["Text"]:Lerp(Color3.new(0, 0, 0), 0.25)
                    end
                })

                Items["Hint"] = Library:Create("TextLabel", {
                    Name = "\0",
                    Parent = Items["Panel"].Instance,
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0, 12, 1, -49),
                    Size = UDim2.new(1, -24, 0, 10),
                    BorderSizePixel = 0,
                    Text = "Click off this window to cancel\nHit enter to confirm",
                    TextColor3 = Library.Theme["Text"],
                    TextTransparency = 0.45,
                    FontFace = Library.Font,
                    TextSize = Library.FontSize,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    ZIndex = 9003
                }):AddToTheme({
                    TextColor3 = function()
                        return Library.Theme["Text"]:Lerp(Color3.new(0, 0, 0), 0.45)
                    end
                })

                Items["CancelButton"] = CreateModalButton(CancelText, UDim2.new(0, 12, 1, -30), 0.45,
                    Library.Theme["Text"], "Element")
                Items["ConfirmButton"] = CreateModalButton(ConfirmText, UDim2.new(0.55, 0, 1, -30), 0.45,
                    AccentColor, "Element")
            end

            local FadeItems = {
                Items["Overlay"],
                Items["PanelOutline"],
                Items["Panel"],
                Items["AccentLine"],
                Items["Title"],
                Items["Message"],
                Items["Hint"],
                Items["CancelButton"]["OuterStroke"],
                Items["CancelButton"]["InnerStroke"],
                Items["CancelButton"]["Label"],
                Items["CancelButton"]["Button"],
                Items["ConfirmButton"]["OuterStroke"],
                Items["ConfirmButton"]["InnerStroke"],
                Items["ConfirmButton"]["Label"],
                Items["ConfirmButton"]["Button"]
            }

            for _, Item in FadeItems do
                if Item.Instance:IsA("Frame") then
                    Item.Instance.BackgroundTransparency = 1
                elseif Item.Instance:IsA("TextLabel") then
                    Item.Instance.TextTransparency = 1
                elseif Item.Instance:IsA("UIStroke") then
                    Item.Instance.Transparency = 1
                elseif Item.Instance:IsA("TextButton") then
                    Item.Instance.BackgroundTransparency = 1
                end
            end

            local OpenInfo = TweenInfo.new(0.22, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
            local CloseInfo = TweenInfo.new(0.16, Enum.EasingStyle.Quint, Enum.EasingDirection.In)

            local Dialog = {}

            function Dialog:Close(Confirmed, SkipCallback)
                if IsClosed then
                    return
                end

                IsClosed = true
                Self.ActiveConfirmDialog = nil

                Items["Overlay"]:Tween({ BackgroundTransparency = 1 }, CloseInfo)
                Items["PanelOutline"]:Tween({ BackgroundTransparency = 1, Position = UDim2.new(0.5, 0, 0.5, 6) },
                    CloseInfo)
                Items["Panel"]:Tween({ BackgroundTransparency = 1 }, CloseInfo)
                Items["AccentLine"]:Tween({ BackgroundTransparency = 1 }, CloseInfo)
                Items["Title"]:Tween({ TextTransparency = 1 }, CloseInfo)
                Items["Message"]:Tween({ TextTransparency = 1 }, CloseInfo)
                Items["Hint"]:Tween({ TextTransparency = 1 }, CloseInfo)
                Items["CancelButton"]["Button"]:Tween({ BackgroundTransparency = 1 }, CloseInfo)
                Items["CancelButton"]["OuterStroke"]:Tween({ Transparency = 1 }, CloseInfo)
                Items["CancelButton"]["InnerStroke"]:Tween({ Transparency = 1 }, CloseInfo)
                Items["CancelButton"]["Label"]:Tween({ TextTransparency = 1 }, CloseInfo)
                Items["ConfirmButton"]["Button"]:Tween({ BackgroundTransparency = 1 }, CloseInfo)
                Items["ConfirmButton"]["OuterStroke"]:Tween({ Transparency = 1 }, CloseInfo)
                Items["ConfirmButton"]["InnerStroke"]:Tween({ Transparency = 1 }, CloseInfo)
                Items["ConfirmButton"]["Label"]:Tween({ TextTransparency = 1 }, CloseInfo)
                Items["PanelScale"]:Tween({ Scale = 0.97 }, CloseInfo)

                task.delay(CloseInfo.Time + 0.03, function()
                    DisconnectConnections()

                    if Items["Overlay"] and Items["Overlay"].Instance.Parent then
                        Items["Overlay"].Instance:Destroy()
                    end
                end)

                if not SkipCallback then
                    task.defer(function()
                        Library:SafeCall(Callback, Confirmed)
                    end)
                end
            end

            Self.ActiveConfirmDialog = Dialog

            Items["Overlay"]:Tween({ BackgroundTransparency = 0.35 }, OpenInfo)
            Items["PanelOutline"]:Tween({ BackgroundTransparency = 0, Position = UDim2.new(0.5, 0, 0.5, 0) }, OpenInfo)
            Items["Panel"]:Tween({ BackgroundTransparency = 0 }, OpenInfo)
            Items["AccentLine"]:Tween({ BackgroundTransparency = 0 }, OpenInfo)
            Items["Title"]:Tween({ TextTransparency = 0 }, OpenInfo)
            Items["Message"]:Tween({ TextTransparency = 0.25 }, OpenInfo)
            Items["Hint"]:Tween({ TextTransparency = 0.45 }, OpenInfo)
            Items["CancelButton"]["Button"]:Tween({ BackgroundTransparency = 0 }, OpenInfo)
            Items["CancelButton"]["OuterStroke"]:Tween({ Transparency = 0 }, OpenInfo)
            Items["CancelButton"]["InnerStroke"]:Tween({ Transparency = 0 }, OpenInfo)
            Items["CancelButton"]["Label"]:Tween({ TextTransparency = 0 }, OpenInfo)
            Items["ConfirmButton"]["Button"]:Tween({ BackgroundTransparency = 0 }, OpenInfo)
            Items["ConfirmButton"]["OuterStroke"]:Tween({ Transparency = 0 }, OpenInfo)
            Items["ConfirmButton"]["InnerStroke"]:Tween({ Transparency = 0 }, OpenInfo)
            Items["ConfirmButton"]["Label"]:Tween({ TextTransparency = 0 }, OpenInfo)
            Items["PanelScale"]:Tween({ Scale = 1 }, OpenInfo)

            AddConnection(Items["Overlay"].Instance.MouseButton1Click:Connect(function()
                Dialog:Close(false)
            end))

            AddConnection(Items["CancelButton"]["Button"].Instance.MouseButton1Click:Connect(function()
                Dialog:Close(false)
            end))

            AddConnection(Items["ConfirmButton"]["Button"].Instance.MouseButton1Click:Connect(function()
                Dialog:Close(true)
            end))

            AddConnection(UserInputService.InputBegan:Connect(function(Input, Processed)
                if Processed or IsClosed then
                    return
                end

                if Input.KeyCode == Enum.KeyCode.Escape then
                    Dialog:Close(false)
                elseif Input.KeyCode == Enum.KeyCode.Return or Input.KeyCode == Enum.KeyCode.KeypadEnter then
                    Dialog:Close(true)
                end
            end))

            return Dialog
        end

        Library.CreateSettingsPage = function(Self)
            local Page = Self:Page({ Name = "Settings", Icon = "rbxassetid://0" })

            local ConfigsSubPage = Page:SubPage({ Name = "Configs" })
            local OtherSubPage = Page:SubPage({ Name = "Other" })

            do
                local ConfigName
                local ConfigSelected
                local ConfigsFolder = Library.Directory .. Library.Folders.Configs .. "/"

                local ConfigsSection = ConfigsSubPage:Section({ Name = "Configs", Side = 1 })
                do
                    local ConfigName
                    local ConfigSelected
                    local ConfigsFolder = Library.Directory .. Library.Folders.Configs .. "/"

                    local ConfigsDropdown = ConfigsSection:Dropdown({
                        Name = "Configs",
                        Flag = "ConfigsDropdown",
                        Items = {},
                        Multi = false,
                        Callback = function(Value)
                            ConfigSelected = Value
                        end
                    })

                    ConfigsSection:Textbox({
                        Name = "Config name",
                        Flag = "ConfigName",
                        Placeholder = "Config name",
                        Callback = function(Value)
                            ConfigName = Value
                        end
                    })

                    ConfigsSection:Button({
                        Name = "Create",
                        Callback = function()
                            if ConfigName then
                                if ConfigName == "" then
                                    return
                                end

                                writefile(ConfigsFolder .. ConfigName .. ".json", Library:GetConfig())
                                Library:GetConfigsList(ConfigsDropdown)
                                Library:Notification("Succesfully created config", 3, Color3.fromRGB(0, 255, 0))
                            end
                        end
                    })

                    ConfigsSection:Button({
                        Name = "Delete",
                        Callback = function()
                            if ConfigSelected then
                                if isfile(ConfigsFolder .. ConfigSelected .. ".json") then
                                    local SelectedConfig = ConfigSelected

                                    Library:OpenConfirmDialog({
                                        Title = "Delete config",
                                        Message = string.format(
                                            'Delete "%s"? This permanently removes the file from your config folder.',
                                            SelectedConfig),
                                        ConfirmText = "Delete",
                                        CancelText = "Keep",
                                        AccentColor = Color3.fromRGB(255, 95, 95),
                                        Callback = function(Confirmed)
                                            if not Confirmed then
                                                return
                                            end

                                            if not isfile(ConfigsFolder .. SelectedConfig .. ".json") then
                                                Library:Notification("Config no longer exists", 3,
                                                    Color3.fromRGB(255, 0, 0))
                                                return
                                            end

                                            delfile(ConfigsFolder .. SelectedConfig .. ".json")
                                            ConfigSelected = nil
                                            Library:GetConfigsList(ConfigsDropdown)
                                            Library:Notification("Succesfully deleted config", 3,
                                                Color3.fromRGB(0, 255, 0))
                                        end
                                    })
                                end
                            end
                        end
                    })

                    ConfigsSection:Button({
                        Name = "Load",
                        Callback = function()
                            if ConfigSelected then
                                if isfile(ConfigsFolder .. ConfigSelected .. ".json") then
                                    local ConfigContent = readfile(ConfigsFolder .. ConfigSelected .. ".json")
                                    local Success, Error = Library:LoadConfig(ConfigContent)

                                    if Success then
                                        Library:Notification("Succesfully loaded config", 3, Color3.fromRGB(0, 255, 0))
                                    else
                                        Library:Notification("Failed to load config: \n" .. Error, 3,
                                            Color3.fromRGB(255, 0, 0))
                                    end
                                end
                            else
                                Library:Notification("No config selected", 3, Color3.fromRGB(255, 0, 0))
                            end
                        end
                    })

                    ConfigsSection:Button({
                        Name = "Save",
                        Callback = function()
                            if ConfigSelected then
                                if isfile(ConfigsFolder .. ConfigSelected .. ".json") then
                                    local Success, Error = pcall(function()
                                        writefile(ConfigsFolder .. ConfigSelected .. ".json", Library:GetConfig())
                                    end)

                                    if Success then
                                        Library:Notification("Succesfully saved config", 3, Color3.fromRGB(0, 255, 0))
                                    else
                                        Library:Notification("Failed to save config: \n" .. Error, 3,
                                            Color3.fromRGB(255, 0, 0))
                                    end
                                end
                            end
                        end
                    })

                    Library:GetConfigsList(ConfigsDropdown)
                end
            end

            do
                local ThemingSection = OtherSubPage:Section({ Name = "Theming", Side = 1 })
                do
                    for Index, Value in Library.Theme do
                        ThemingSection:Label({ Name = Index }):Colorpicker({
                            Flag = Index .. "Theme",
                            Default = Value,
                            Callback = function(Value)
                                Library.Theme[Index] = Value
                                Library:ChangeTheme(Index, Value)
                            end
                        })
                    end
                end

                local SettingsSection = OtherSubPage:Section({ Name = "Settings", Side = 2 })
                do
                    SettingsSection:Label({ Name = "UI Bind" }):Keybind({
                        Flag = "UIBind",
                        Mode = "Toggle",
                        Default = Enum.KeyCode.RightShift,
                        Callback = function(Value)
                            Library.MenuKeybind = Flags["UIBind"].Key
                        end
                    })

                    SettingsSection:Toggle({
                        Name = "Background Blur",
                        Flag = "UIBackgroundBlur",
                        Default = Library.BackgroundBlurEnabled,
                        Callback = function(Value)
                            Library:SetBackgroundBlurEnabled(Value)
                        end
                    })

                    SettingsSection:Toggle({
                        Name = "Background Snow",
                        Flag = "UIBackgroundSnow",
                        Default = Library.BackgroundSnowEnabled,
                        Callback = function(Value)
                            Library:SetBackgroundSnowEnabled(Value)
                        end
                    })

                    SettingsSection:Button({
                        Name = "Unload",
                        Callback = function()
                            Library:Exit()
                        end
                    })

                    SettingsSection:Slider({
                        Name = "Animation Speed",
                        Flag = "AnimationSpeed",
                        Default = Library.Animation.Time,
                        Min = 0,
                        Max = 1.5,
                        Decimals = .01,
                        Callback = function(Value)
                            Library.Animation.Time = Value
                        end
                    })
                end
            end
        end
    end
end

_G.Library = Library
getgenv().Library = Library
return Library
