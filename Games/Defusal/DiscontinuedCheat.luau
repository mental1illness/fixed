--!native
--!optimize 2

-- FABRICATED VALUES!!!
if not LPH_OBFUSCATED then
	LPH_JIT = function(...)
		return ...;
	end;
	LPH_JIT_MAX = function(...)
		return ...;
	end;
	LPH_NO_VIRTUALIZE = function(...)
		return ...;
	end;
	LPH_NO_UPVALUES = function(f)
		return (function(...)
			return f(...);
		end);
	end;
	LPH_ENCSTR = function(...)
		return ...;
	end;
	LPH_ENCNUM = function(...)
		return ...;
	end;
	LPH_ENCFUNC = function(func, key1, key2)
		if key1 ~= key2 then return print("LPH_ENCFUNC mismatch") end
		return func
	end
	LPH_CRASH = function()
		return print(debug.traceback());
	end;
end;

if (getgenv and getgenv() or _G).Library then
	(getgenv and getgenv() or _G).Library.Unload()
end

local Folder = "bakadere"
makefolder(Folder)

local ImagesFolder = string.format( "%s\\%s\\", Folder, "Images" )
makefolder(ImagesFolder)

local FontsFolder = string.format( "%s\\%s\\", Folder, "FontsFolder" )
makefolder(FontsFolder)

local HitsoundFolder = string.format( "%s\\%s\\", Folder, "Hitsounds" )
makefolder(HitsoundFolder)

local PicturesOnKillFolder = string.format( "%s\\%s\\", Folder, "PicturesOnKill" )

local CREATE_PRESET_IMAGES = isfolder(PicturesOnKillFolder)
makefolder(PicturesOnKillFolder)

local TempFolder = string.format( "%s\\%s\\", Folder, "TempFolder" )
makefolder(TempFolder)

local ConfigFolder = string.format( "%s\\%s\\", Folder, "Configs" )
makefolder(ConfigFolder)

local ThemeFolder = string.format( "%s\\%s\\", Folder, "Themes" )
makefolder(ThemeFolder)

local Fonts, Images = LPH_JIT(function()
	local RunService = game:GetService("RunService")
	local HttpService = game:GetService("HttpService")

	local Fonts = {
		URL = "https://raw.githubusercontent.com/mental1illness/swimhub_assets/refs/heads/main/base64/",

		Names = {
			"Tahoma",
			"TahomaXP",
			"Comfortaa",
			"Verdana",
			"SmallestPixel7",
			"Proggy",
		},

		Data = {}
	}; do
		function Fonts.Load(font)
			if not RunService:IsStudio() then
				local TTF = string.format("%s%s.ttf", FontsFolder, font)
				local JSON = string.format("%s%s.json", FontsFolder, font)

				if not isfile(TTF) then
					local success, data = pcall(function()
						return game:HttpGet( string.format("%s%s.txt", Fonts.URL, font) )
					end)

					if success and data then
						writefile(TTF, base64_decode(data))
					else
						return
					end			
				end

				if not isfile(JSON) then
					local Font = {
						name = font,
						faces = {{
							name = "Regular",
							weight = 400,
							style = "normal",
							assetId = getcustomasset(TTF)
						}}
					}

					writefile(JSON, HttpService:JSONEncode(Font))
				end

				local temp_TTF = string.format("%s%s.ttf", TempFolder, font)
				local temp_JSON = string.format("%s%s.json", TempFolder, font)
				writefile(temp_TTF, readfile(TTF))
				writefile(temp_JSON, HttpService:JSONEncode({
					name = font,
					faces = {{
						name = "Regular",
						weight = 400,
						style = "normal",
						assetId = getcustomasset(temp_TTF)
					}}
				}))

				Fonts.Data[font] = Font.new(getcustomasset(temp_JSON), Enum.FontWeight.Regular)
			end
		end

		function Fonts.Get(font)
			return Fonts.Data[font]
		end

		for _,font in Fonts.Names do
			Fonts.Load(font)
		end
	end

	local Images = {
		URL = "https://raw.githubusercontent.com/mental1illness/swimhub_assets/refs/heads/main/base64/",

		Names = {
			"combat",
			"visuals",
			"misc",
			"config",
			"checkers",
			"saturation",
			"scrollbar",
			"lines"
		},

		Data = {}
	}; do
		function Images.Load(image)
			if not RunService:IsStudio() then
				local PNG = string.format("%s%s.png", ImagesFolder, image)

				if not isfile(PNG) then
					local success, data = pcall(function()
						return game:HttpGet( string.format( "%s%s.txt", Images.URL, image ) )
					end)

					if success and data then
						writefile(PNG, base64_decode(data))
					else
						return
					end
				end

				Images.Data[image] = getcustomasset(PNG)
			end
		end

		function Images.Get(image)
			return Images.Data[image]
		end

		for _,image in Images.Names do
			Images.Load(image)
		end
	end
	return Fonts, Images
end)();
local Library, Utility = LPH_JIT(function()
	local UserInputService = game:GetService("UserInputService")
	local RunService = game:GetService("RunService")
	local HttpService = game:GetService("HttpService")
	local GuiService = game:GetService("GuiService")
	local TweenService = game:GetService("TweenService")
	local Stats = game:GetService("Stats")
	local Players = game:GetService("Players")
	local LocalPlayer = Players.LocalPlayer
	local Camera = Workspace.CurrentCamera

	local Env = RunService:IsStudio() and _G or getgenv()
	local HiddenUI = RunService:IsStudio() and game.Players.LocalPlayer.PlayerGui --[[or gethui and gethui()]] or game:GetService("CoreGui")
	local Converts = {
		[0] = "0",
		"1",
		"2",
		"3",
		"4",
		"5",
		"6",
		"7",
		"8",
		"9",
	}
	local KeyConverters = {
		escape = "ESC",
		backquote = "`",
		backspace = "BSP",
		slash = "/",
		leftquote = "'",
		rightquote = '"',
		leftbracket = "[",
		rightbracket = "]",
		semicolon = ";",
		comma = ",",
		period = ".",
		backslash = "\\",
		minus = "-",
		equals = "=",
		space = "SPC",
		[ "return" ] = "ENT",
		tab = "TAB",
		capslock = "CAP",
		leftshift = "LSH",
		mousebutton1 = "MB1",
		mousebutton2 = "MB2",
		mousebutton3 = "MB3",
		rightshift = "RSH",
		leftcontrol = "CTRL",
		leftalt = "ALT",
		leftsuper = "WIN",
		rightcontrol = "CTRL",
		rightalt = "ALT",
		rightsuper = "WIN",
		insert = "INS",
		delete = "DEL",
		home = "HME",
		pageup = "PUD",
		pagedown = "PDN",
		up = "UP",
		down = "DWN",
		left = "LFT",
		right = "RGT",
		numlock = "NUM",
		numpad0 = "N0",
		numpad1 = "N1",
		numpad2 = "N2",
		numpad3 = "N3",
		numpad4 = "N4",
		numpad5 = "N5",
		numpad6 = "N6",
		numpad7 = "N7",
		numpad8 = "N8",
		numpad9 = "N9",
	}
	local Library = {
		TweenSpeed = 0.4,
		TweenStyle = Enum.EasingStyle.Exponential,

		ThemeObjects = {},

		Font = Fonts.Get("Verdana"),
		FontSize = 16,

		Flags = {},
		ConfigFlags = {},

		Popups = {},

		CopiedColor = nil,

		Fps = 0,

		Images = {
			Lines = Images.Get("lines"),
			ScrollBar = Images.Get("scrollbar"),
			Saturation = Images.Get("saturation"),
			Checkers = Images.Get("checkers")
		},

		Theme = {
			outline = Color3.fromRGB(0, 0, 0),
			inline = Color3.fromRGB(40, 42, 44),
			["inline hovering"] = Color3.fromRGB(50, 52, 54),

			background = Color3.fromRGB(23, 25, 26),
			["dock background"] = Color3.fromRGB(19, 19, 19),

			accent = Color3.fromRGB(220, 100, 100),

			text = Color3.fromRGB(230, 230, 230),
			["dark text"] = Color3.fromRGB(86, 86, 86),
		},

	}; Library.__index = Library
	do
		Library.Utility = { Objects = {}, Connections = {} }; local Utility = Library.Utility do
			function Utility.New(object, props, theme)
				local Obj = Instance.new(object)

				if object == "TextButton" then
					Obj.AutoButtonColor = false
					Obj.Text = ""
					Obj.Style = Enum.ButtonStyle.Custom
				end

				if props then
					for prop, val in props do
						--if prop ~= "Color" and prop:lower():find("color") then continue end
						--if prop == "FontFace" then Obj.Font = val continue end

						Obj[prop] = val
					end
				end

				if theme then
					Library.AddObjectTheme(Obj, theme)
				end

				table.insert(Utility.Objects, Obj)

				return Obj
			end

			function Utility.Signal(connection)
				table.insert(Utility.Connections, connection)

				return connection
			end

			function Utility.GetTransparency(obj)
				if obj:IsA("Frame") then
					return "BackgroundTransparency"
				elseif obj:IsA("TextLabel") or obj:IsA("TextButton") then
					return { "TextTransparency", "BackgroundTransparency" }
				elseif obj:IsA("ImageLabel") or obj:IsA("ImageButton") then
					return { "BackgroundTransparency", "ImageTransparency" }
				elseif obj:IsA("ScrollingFrame") then
					return { "BackgroundTransparency", "ScrollBarImageTransparency" }
				elseif obj:IsA("TextBox") then
					return { "TextTransparency", "BackgroundTransparency" }
				elseif obj:IsA("UIStroke") then
					return "Transparency"
				end

				return nil
			end

			function Utility.Round(number, float)
				local Mult = 1 / (float or 1)

				return math.floor(number * Mult + 0.5) / Mult
			end

			-- taken from dev forums.
			function Utility.PositionOver(position, object, addedy)
				addedy = addedy or 0

				local posX, posY = object.AbsolutePosition.X, (object.AbsolutePosition.Y - addedy)
				local size = object.AbsoluteSize
				local sizeX, sizeY = posX + size.X, posY + size.Y + addedy

				if position.X >= posX and position.Y >= posY and position.X <= sizeX and position.Y <= sizeY then
					return true
				end

				return false
			end

			function Utility.MouseOver(object, input)
				local posX, posY = object.AbsolutePosition.X, object.AbsolutePosition.Y
				local size = object.AbsoluteSize
				local sizeX, sizeY = posX + size.X, posY + size.Y
				local position = input.Position

				if position.X >= posX and position.Y >= posY and position.X <= sizeX and position.Y <= sizeY then
					return true
				end

				return false
			end

			function Utility.Lerp(a, b, c)
				c = c or 1 / 8

				local offset = math.abs(b - a)
				if (offset < c) then 
					return b 
				end 

				return a + (b - a) * c
			end

			function Utility.StringToEnum(enumstring)
				local EnumType, EnumValue = enumstring:match("Enum%.([^%.]+)%.(.+)")

				if EnumType and EnumValue then
					return Enum[EnumType][EnumValue]
				end

				return nil
			end

			function Utility.TextTriggers(text)
				local Triggers = {
					["{hour}"] = os.date("%H"),
					["{minute}"] = os.date("%M"),
					["{second}"] = os.date("%S"),
					["{ap}"] = os.date("%p"),
					["{month}"] = os.date("%b"),
					["{day}"] = os.date("%d"),
					["{year}"] = os.date("%Y"),
					["{fps}"] = Library.Fps,
					["{user}"] = "admin",
					["{ping}"] = RunService:IsStudio() and 0 or math.floor(Stats.PerformanceStats.Ping:GetValue() or 0),
					["{time}"] = os.date("%H:%M:%S"),
					["{date}"] = os.date("%b. %d, %Y"),
					["{game}"] = Game and Game.Name or "Universal",
					["{n}"] = "\n"
				}

				for i,v in Triggers do
					text = string.gsub(text, i, v)
				end

				return text
			end

			function Utility.ToTitleCase(str)
				return str:gsub("(%a)([%w_']*)", function(first, rest)
					return first:upper() .. rest:lower()
				end)
			end

			function Utility.IsScrollable(frame)
				local CanvasSize = frame.AbsoluteCanvasSize
				local WindowSize = frame.AbsoluteWindowSize

				return CanvasSize.Y > WindowSize.Y
			end

			function Utility.IsAtBottom(frame)
				return frame.CanvasPosition.Y == frame.AbsoluteCanvasSize.Y - frame.AbsoluteWindowSize.Y
			end

			function Utility.RichText(text, color)
				return string.format('<font color="rgb(%s, %s, %s)">%s</font>', math.floor(color.r * 255), math.floor(color.g * 255), math.floor(color.b * 255), text)
			end

			function Utility.GetFiles(folder, extensions)
				if not isfolder(folder) then
					makefolder(folder)
				end

				local Files = isfolder(folder) and listfiles(folder) or {}
				local StoredFiles = {}
				local FileNames = {}

				for _,v in Files do
					for _,ext in extensions do
						if v:find(ext) then
							StoredFiles[#StoredFiles + 1] = v
							FileNames[#FileNames + 1] = v:gsub(folder, ""):gsub(ext, "")
						end
					end
				end

				return StoredFiles, FileNames
			end
		end

		Library.ScreenGui = Utility.New("ScreenGui", {
			Name = "\0",
			DisplayOrder = 1,
			Parent = HiddenUI,
			IgnoreGuiInset = true,
		})

		Library.ScreenGuiPopups = Utility.New("ScreenGui", {
			Name = "\0",
			DisplayOrder = -1,
			Parent = HiddenUI,
			IgnoreGuiInset = true,
		})

		local ItemsHolder = Utility.New("Frame", {
			Name = "leftholder",
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			Position = UDim2.new(0, 0, 0, 60),
			BorderSizePixel = 0,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			Parent = Library.ScreenGuiPopups,
		})

		Utility.New("UIListLayout", {
			Padding = UDim.new(0, 0),
			SortOrder = Enum.SortOrder.LayoutOrder,
			Parent = ItemsHolder
		})

		Library.NotificationHolder = ItemsHolder

		function Library.Tween(obj, props, tweeninfo)
			tweeninfo = tweeninfo or TweenInfo.new(Library.TweenSpeed, Library.TweenStyle)

			local Tween = TweenService:Create(obj, tweeninfo, props)

			Tween:Play()

			return Tween
		end

		function Library.Fade(obj, prop, vis)
			if not ((obj:IsA("UIStroke") and obj.Enabled or obj.Visible) and prop) then
				return
			end

			local OldTransparency = obj[prop]
			obj[prop] = vis and 1 or OldTransparency

			local Tween = Library.Tween(obj, { [prop] = vis and OldTransparency or 1 })

			Utility.Signal(Tween.Completed:Connect(function()
				if not vis then
					task.wait()
					obj[prop] = OldTransparency
				end
			end))

			return Tween
		end

		function Library.AddObjectTheme(object, props)
			local Theme = {
				Props = props,
				Object = object
			}

			for prop,v in props do
				if type(v) == "string" then
					object[prop] = Library.Theme[v]
				elseif type(v) == "function" then
					object[prop] = v()
				end
			end

			Library.ThemeObjects[object] = Theme
		end

		function Library.ChangeObjectTheme(object, props, tweened)
			local Theme = Library.ThemeObjects[object]

			if Theme then
				Theme.Props = props

				for prop,v in props do
					if type(v) == "string" then
						if tweened then
							Theme.Tween = Library.Tween(object, {
								[prop] = Library.Theme[v]
							})
						else
							object[prop] = Library.Theme[v]
						end
					elseif type(v) == "function" then
						object[prop] = v()
					end
				end
			end
		end

		function Library.UpdateTheme(theme, color)
			if not Library.Theme[theme] then
				return
			end

			Library.Theme[theme] = color

			for _,themeobj in Library.ThemeObjects do
				for prop,val in themeobj.Props do
					if val == theme then
						if themeobj.Tween then
							themeobj.Tween:Cancel()
						end

						themeobj.Object[prop] = color
					end
				end
			end
		end

		function Library.Config(cfg, default)
			local Table = { }

			for name, val in cfg do
				Table[name:lower()] = val
			end

			for name, val in default do
				if Table[name] == nil then
					Table[name] = val
				end
			end

			return Table
		end

		function Library.Resize(holder, box)
			local Start, StartSize, Resizing;
			local CurrentSize = holder.Size
			local OriginalSize = holder.Size

			Utility.Signal(box.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					Resizing = true
					Start = input.Position
					StartSize = holder.Size
				end
			end))

			Utility.Signal(UserInputService.InputChanged:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement and Resizing then
					local ViewportSize = Camera.ViewportSize
					CurrentSize = UDim2.new(0, math.clamp(StartSize.X.Offset + (input.Position.X - Start.X), OriginalSize.X.Offset, ViewportSize.x), 0, math.clamp(StartSize.Y.Offset + (input.Position.Y - Start.Y), OriginalSize.Y.Offset, ViewportSize.y))
					holder.Size = CurrentSize
				end
			end))

			Utility.Signal(UserInputService.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					Resizing = false
				end
			end))
		end

		function Library.Dragging(holder, box, useinset)
			useinset = useinset == nil and true or useinset

			local Start, StartPos, Dragging;
			local CurrentPos;
			local Inset = GuiService:GetGuiInset( );

			Utility.Signal(box.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					Dragging = true
					Start = input.Position
					StartPos = holder.AbsolutePosition
				end
			end))

			Utility.Signal(UserInputService.InputChanged:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement and Dragging then
					local MaxSize = holder.AbsoluteSize
					local ViewportSize = Camera.ViewportSize
					CurrentPos = UDim2.new(0, math.clamp(StartPos.X + (input.Position.X - Start.X), 0, ViewportSize.x - MaxSize.x), 0, math.clamp(StartPos.Y + (input.Position.Y - Start.Y + 36), 0, ViewportSize.y - MaxSize.y) + ( useinset and (Inset.Y / 2) or 0 ))
					holder.Position = CurrentPos
				end
			end))

			Utility.Signal(UserInputService.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					Dragging = false
				end
			end))
		end

		function Library.CreateList(cfg)
			cfg = cfg or {}; cfg = Library.Config(cfg, {
				NameStart = "Key",
				NameEnd = "binds",
				size = 150,
			})

			local List = {
				Objects = { },

				Items = { },

				ShowMode = cfg.showmode,
			}

			local Objects = List.Objects; do
				Objects.accent = Utility.New("Frame", {
					Name = "accent",
					Position = UDim2.new(0, 20, 0.5, 0),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Size = UDim2.new(0, cfg.size, 0, 0),
					BorderSizePixel = 0,
					AutomaticSize = Enum.AutomaticSize.Y,
					BackgroundColor3 = Color3.fromRGB(220, 100, 100),
					Parent = Library.ScreenGuiPopups,
				}, { BackgroundColor3 = "accent" })

				Library.Dragging(Objects.accent, Objects.accent, true)

				Objects.background = Utility.New("Frame", {
					Name = "background",
					Position = UDim2.new(0, 1, 0, 1),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Size = UDim2.new(1, -2, 1, -2),
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.fromRGB(23, 25, 26),
					Parent = Objects.accent,
				}, { BackgroundColor3 = "background" })

				Utility.New("UIListLayout", {
					Padding = UDim.new(0, 4),
					SortOrder = Enum.SortOrder.LayoutOrder,
					Parent = Objects.background,
				})

				Objects.dock_background = Utility.New("Frame", {
					Name = "dock_background",
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Size = UDim2.new(1, 0, 0, 23),
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.fromRGB(19, 19, 19),
					Parent = Objects.background,
				}, { BackgroundColor3 = "dock background" })

				Objects.textholder = Utility.New("Frame", {
					Name = "textholder",
					BackgroundTransparency = 1,
					Size = UDim2.new(0, 0, 1, 0),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					AutomaticSize = Enum.AutomaticSize.X,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					Parent = Objects.dock_background,
				})

				Utility.New("UIPadding", {
					PaddingRight = UDim.new(0, 6),
					PaddingLeft = UDim.new(0, 6),
					Parent = Objects.textholder,
				})

				Utility.New("UIListLayout", {
					VerticalAlignment = Enum.VerticalAlignment.Center,
					FillDirection = Enum.FillDirection.Horizontal,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Parent = Objects.textholder,
				})

				Objects.text = Utility.New("TextLabel", {
					FontFace = Library.Font,
					TextColor3 = Color3.fromRGB(230, 230, 230),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Text = cfg.NameStart,
					TextStrokeTransparency = 0,
					BackgroundTransparency = 1,
					Name = "text",
					BorderSizePixel = 0,
					AutomaticSize = Enum.AutomaticSize.X,
					TextSize = Library.FontSize,
					BackgroundColor3 = Color3.fromRGB(25, 25, 25),
					Parent = Objects.textholder,
				}, { TextColor3 = "text" })

				Objects.text2 = Utility.New("TextLabel", {
					FontFace = Library.Font,
					TextColor3 = Color3.fromRGB(220, 100, 100),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Text = cfg.NameEnd,
					TextStrokeTransparency = 0,
					BackgroundTransparency = 1,
					Name = "accent",
					BorderSizePixel = 0,
					AutomaticSize = Enum.AutomaticSize.X,
					TextSize = Library.FontSize,
					BackgroundColor3 = Color3.fromRGB(25, 25, 25),
					Parent = Objects.textholder,
				}, { TextColor3 = "accent" })

				Objects.content = Utility.New("Frame", {
					Name = "content",
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					Parent = Objects.background,
				})

				Utility.New("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					Parent = Objects.content,
					Padding = UDim.new(0, 0),
				})
			end

			function List.Add()
				local Item = {}

				local Holder = Utility.New("Frame", {
					Name = "holder",
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 0),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					AutomaticSize = Enum.AutomaticSize.Y,
					Visible = false,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					Parent = Objects.content,
				})

				Utility.New("UIPadding", {
					Parent = Holder,
					PaddingBottom = UDim.new(0, 8),
				})

				local Text = Utility.New("TextLabel", {
					FontFace = Fonts.Get("TahomaXP"),
					TextColor3 = Color3.fromRGB(230, 230, 230),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Text = "",
					Name = "text",
					TextStrokeTransparency = 0,
					Size = UDim2.new(1, -16, 0, 0),
					Position = UDim2.new(0, 8, 0, 0),
					BackgroundTransparency = 1,
					TextXAlignment = Enum.TextXAlignment.Left,
					BorderSizePixel = 0,
					AutomaticSize = Enum.AutomaticSize.Y,
					TextSize = 12,
					BackgroundColor3 = Color3.fromRGB(25, 25, 25),
					Parent = Holder,
				}, { TextColor3 = "text" })

				Utility.New("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					HorizontalAlignment = Enum.HorizontalAlignment.Right,
					Parent = Text,
				})

				local Accent = Utility.New("TextLabel", {
					FontFace = Fonts.Get("TahomaXP"),
					TextColor3 = Color3.fromRGB(220, 100, 100),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Text = "[]",
					TextStrokeTransparency = 0,
					BackgroundTransparency = 1,
					Name = "accent",
					BorderSizePixel = 0,
					AutomaticSize = Enum.AutomaticSize.XY,
					TextSize = 12,
					BackgroundColor3 = Color3.fromRGB(25, 25, 25),
					Parent = Text,
				}, { TextColor3 = "accent" })

				function Item.Set(value, text, mode)
					Holder.Visible = value
					Text.Text = text
					Accent.Text = string.format("[%s]", mode)
				end

				table.insert(List.Items, Item)

				return Item
			end

			function List.Status(value)
				Objects.accent.Visible = value
			end

			return List
		end

		local KeybindList = Library.CreateList()
		Library.KeybindsList = KeybindList

		-- Element

		function Library.ColorpickerWindow(self)
			local Popup = {
				Visible = false,

				Tweening = false,

				Objects = { },

				Flag = nil,

				SetFunc = function() end,

				Alpha = 1,

				Color = Color3.new(1, 1, 1),

				HuePos = nil,
			}

			local Objects = Popup.Objects; do
				Objects.accent = Utility.New("Frame", {
					Size = UDim2.new(0, 200, 0, 200),
					Name = "accent",
					Position = UDim2.new(0, 0, 0, 0),
					Visible = false,
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					AutomaticSize = Enum.AutomaticSize.XY,
					BackgroundColor3 = Color3.fromRGB(220, 100, 100),
					Parent = Library.ScreenGui,
				}, { BackgroundColor3 = "accent" })

				Objects.outline = Utility.New("Frame", {
					Name = "outline",
					Position = UDim2.new(0, 1, 0, 1),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Size = UDim2.new(1, -2, 1, -2),
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.fromRGB(0, 0, 0),
					Parent = Objects.accent,
				}, { BackgroundColor3 = "outline" })

				Objects.background = Utility.New("Frame", {
					Name = "background",
					Position = UDim2.new(0, 1, 0, 1),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Size = UDim2.new(1, -2, 1, -2),
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.fromRGB(23, 25, 26),
					Parent = Objects.outline,
				}, { BackgroundColor3 = "background" })

				Utility.New("UIPadding", {
					PaddingTop = UDim.new(0, 6),
					PaddingBottom = UDim.new(0, 6),
					PaddingRight = UDim.new(0, 6),
					PaddingLeft = UDim.new(0, 6),
					Parent = Objects.background,
				})

				Utility.New("UIListLayout", {
					Padding = UDim.new(0, 5),
					SortOrder = Enum.SortOrder.LayoutOrder,
					Parent = Objects.background,
				})

				Objects.satholder = Utility.New("Frame", {
					Name = "satholder",
					BackgroundTransparency = 1,
					Size = UDim2.new(0, 0, 0, 186),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					AutomaticSize = Enum.AutomaticSize.XY,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					Parent = Objects.background,
				})

				Utility.New("UIListLayout", {
					Padding = UDim.new(0, 6),
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Horizontal,
					Parent = Objects.satholder,
				})

				Objects.saturation = Utility.New("TextButton", {
					Name = "saturation",
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Size = UDim2.new(0, 186, 0, 186),
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.fromRGB(255, 0, 4),
					Parent = Objects.satholder,
				})

				Objects.saturationimage = Utility.New("ImageLabel", {
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Image = Library.Images.Saturation,
					BackgroundTransparency = 1,
					Name = "saturationimage",
					Size = UDim2.new(1, 0, 1, 0),
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					Parent = Objects.saturation,
				})

				Objects.saturationpickeroutline = Utility.New("Frame", {
					Name = "saturationpickeroutline",
					Position = UDim2.new(0, 0, 0, 0),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Size = UDim2.new(0, 3, 0, 3),
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.fromRGB(0, 0, 0),
					Parent = Objects.saturationimage,
				})

				Objects.saturationpicker = Utility.New("Frame", {
					Name = "saturationpicker",
					Position = UDim2.new(0, 1, 0, 1),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Size = UDim2.new(1, -2, 1, -2),
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					Parent = Objects.saturationpickeroutline,
				})

				Objects.hue = Utility.New("TextButton", {
					Name = "hue",
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Size = UDim2.new(0, 12, 0, 186),
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					Parent = Objects.satholder,
				})

				Objects.huepickeroutline = Utility.New("Frame", {
					Name = "huepickeroutline",
					Position = UDim2.new(0, 0, 0.5, 0),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Size = UDim2.new(1, 0, 0, 3),
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.fromRGB(0, 0, 0),
					Parent = Objects.hue,
				})

				Objects.huepicker = Utility.New("Frame", {
					Name = "huepicker",
					Position = UDim2.new(0, 0, 0, 1),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Size = UDim2.new(1, 0, 1, -2),
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					Parent = Objects.huepickeroutline,
				})

				Utility.New("UIGradient", {
					Rotation = -90,
					Color = ColorSequence.new{
						ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
						ColorSequenceKeypoint.new(0.17, Color3.fromRGB(255, 0, 255)),
						ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0, 0, 255)),
						ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 255)),
						ColorSequenceKeypoint.new(0.67, Color3.fromRGB(0, 255, 0)),
						ColorSequenceKeypoint.new(0.83, Color3.fromRGB(255, 255, 0)),
						ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0))
					},
					Parent = Objects.hue,
				})

				Objects.alphaimage = Utility.New("ImageLabel", {
					ScaleType = Enum.ScaleType.Tile,
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Name = "alphaimage",
					Image = Library.Images.Checkers,
					TileSize = UDim2.new(0, 6, 0, 6),
					Position = UDim2.new(0, 1, 0, 1),
					Size = UDim2.new(0, 186, 0, 12),
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					Parent = Objects.background,
				})

				Objects.alpha = Utility.New("TextButton", {
					Name = "alpha",
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Size = UDim2.new(1, 0, 1, 0),
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					Parent = Objects.alphaimage,
				})

				Objects.UIGradient = Utility.New("UIGradient", {
					Transparency = NumberSequence.new{
						NumberSequenceKeypoint.new(0, 1),
						NumberSequenceKeypoint.new(1, 0)
					},
					Parent = Objects.alpha,
				})

				Objects.alphapickeroutline = Utility.New("Frame", {
					Name = "alphapickeroutline",
					Position = UDim2.new(0.5, 0, 0, 0),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Size = UDim2.new(0, 3, 1, 0),
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.fromRGB(0, 0, 0),
					Parent = Objects.alpha,
				})

				Objects.alphapicker = Utility.New("Frame", {
					Name = "alphapicker",
					Position = UDim2.new(0, 1, 0, 0),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Size = UDim2.new(1, -2, 1, 0),
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					Parent = Objects.alphapickeroutline,
				})

				Objects.buttonline = Utility.New("Frame", {
					Name = "buttonline",
					BackgroundTransparency = 1,
					Size = UDim2.new(0, 186, 0, 0),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					AutomaticSize = Enum.AutomaticSize.Y,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					Parent = Objects.background,
				})

				Utility.New("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalFlex = Enum.UIFlexAlignment.Fill,
					Padding = UDim.new(0, 5),
					SortOrder = Enum.SortOrder.LayoutOrder,
					Parent = Objects.buttonline,
				})

				Library.Button({
					holder = Objects.buttonline,
				}, {Name = "Copy", Callback = function()
					Library.CopiedColor = Popup.Color
				end})

				Library.Button({
					holder = Objects.buttonline,
				}, {Name = "Paste", Callback = function()
					if not Library.CopiedColor then 
						Library.Notification("Please copy a color first.", 5)
						return 
					end

					Popup.Set(Library.CopiedColor, Popup.Alpha, false)
				end})
			end

			local Hue, Sat, Val;
			function Popup.Set(color, alpha, ignore)
				alpha = alpha or Popup.Alpha

				Hue, Sat, Val = color:ToHSV()

				Popup.Color = color
				Popup.Alpha = alpha

				if not ignore then
					Library.Tween(Objects.saturationpickeroutline, {
						Position = UDim2.new(
							Sat,
							0,
							1 - Val,
							0
						),
						AnchorPoint = Vector2.new(Sat, 1 - Val)
					})

					Popup.HuePos = Hue

					Library.Tween(Objects.huepickeroutline, {
						Position = UDim2.new(
							0,
							0,
							Hue,
							0
						),
						AnchorPoint = Vector2.new(0, Hue)
					})

					Library.Tween(Objects.alphapickeroutline, {
						Position = UDim2.new(
							1 - alpha,
							0,
							0,
							0
						),
						AnchorPoint = Vector2.new(1 - alpha, 0)
					})
				end

				Popup.SetFunc(color, alpha)

				Objects.huepicker.BackgroundColor3 = Color3.fromHSV(Popup.HuePos, 1, 1)
				Objects.saturationpicker.BackgroundColor3 = color
				Objects.alphapicker.BackgroundColor3 = color
				Objects.saturation.BackgroundColor3 = Color3.fromHSV(Popup.HuePos, 1, 1)
			end

			function Popup.Open(visibility, position)
				if Popup.Tweening or Popup.Visible == visibility then
					return
				end

				Popup.Tweening = true

				Popup.Visible = visibility

				if Popup.Visible then
					Objects.accent.Visible = true

					Objects.saturationpickeroutline.Position = UDim2.new(0, 0, 0, 0)
					Objects.alphapickeroutline.Position = UDim2.new(0, 0, 0, 0)
					Objects.huepickeroutline.Position = UDim2.new(0, 0, 0, 0)
				end

				local ParentObjects = Objects.accent:GetDescendants()

				table.insert(ParentObjects, Objects.accent)

				local Tween;
				for _, obj in ParentObjects do
					local Index = Utility.GetTransparency(obj)
					if not Index then continue end

					if type(Index) == "table" then
						for _, prop in Index do
							Tween = Library.Fade(obj, prop, Popup.Visible)
						end
					else
						Tween = Library.Fade(obj, Index, Popup.Visible)
					end
				end

				if not Popup.Visible then
					Library.Tween(Objects.saturationpickeroutline, {
						Position = UDim2.new(
							0,
							0,
							0,
							0
						),
						AnchorPoint = Vector2.new(0, 0)
					})

					Library.Tween(Objects.huepickeroutline, {
						Position = UDim2.new(
							0,
							0,
							0,
							0
						),
						AnchorPoint = Vector2.new(0, 0)
					})

					Library.Tween(Objects.alphapickeroutline, {
						Position = UDim2.new(
							0,
							0,
							0,
							0
						),
						AnchorPoint = Vector2.new(0, 0)
					})
				end

				if position then
					Objects.accent.Position = UDim2.new(0, position.X, 0, position.Y)
				end

				Utility.Signal(Tween.Completed:Connect(function()
					Objects.accent.Visible = Popup.Visible

					Popup.Tweening = false
				end))
			end

			function Popup.SlideSaturation(input)
				if Popup.Tweening or not Popup.Visible then return end

				local SizeX = math.clamp((input.Position.X - Objects.saturation.AbsolutePosition.X) / Objects.saturation.AbsoluteSize.X, 0, 1)
				local SizeY = 1 - math.clamp((input.Position.Y - Objects.saturation.AbsolutePosition.Y) / Objects.saturation.AbsoluteSize.Y, 0, 1)

				Objects.saturationpickeroutline.Position = UDim2.new(SizeX, 0, 1 - SizeY, 0)
				Objects.saturationpickeroutline.AnchorPoint = Vector2.new(SizeX, 1 - SizeY)

				Popup.Set(Color3.fromHSV(Popup.HuePos, SizeX, SizeY), Popup.Alpha, true)
			end

			Utility.Signal(Objects.saturation.MouseButton1Down:Connect(function()
				Popup.SlidingSaturation = true
				Popup.SlideSaturation({ Position = UserInputService:GetMouseLocation() - Vector2.new(0, GuiService:GetGuiInset( ).Y) })
			end))

			function Popup.SlideHue(input)
				if Popup.Tweening or not Popup.Visible then return end

				local SizeY = math.clamp((input.Position.Y - Objects.hue.AbsolutePosition.Y) / Objects.hue.AbsoluteSize.Y, 0, 1)

				Objects.huepickeroutline.Position = UDim2.new(0, 0, SizeY, 0)
				Objects.huepickeroutline.AnchorPoint = Vector2.new(0, SizeY)
				Popup.HuePos = SizeY

				Popup.Set(Color3.fromHSV(SizeY, Sat, Val), Popup.Alpha, true)
			end

			Utility.Signal(Objects.hue.MouseButton1Down:Connect(function()
				Popup.SlidingHue = true
				Popup.SlideHue({ Position = UserInputService:GetMouseLocation() - Vector2.new(0, GuiService:GetGuiInset( ).Y) })
			end))

			function Popup.SlideAlpha(input)
				if Popup.Tweening or not Popup.Visible then return end

				local SizeX = math.clamp((input.Position.X - Objects.alpha.AbsolutePosition.X) / Objects.alpha.AbsoluteSize.X, 0, 1)

				Objects.alphapickeroutline.Position = UDim2.new(SizeX, 0, 0, 0)
				Objects.alphapickeroutline.AnchorPoint = Vector2.new(SizeX, 0)
				Popup.Set(Popup.Color, 1 - SizeX, true)
			end

			Utility.Signal(Objects.alpha.MouseButton1Down:Connect(function()
				Popup.SlidingAlpha = true
				Popup.SlideAlpha({ Position = UserInputService:GetMouseLocation() })
			end))

			Utility.Signal(UserInputService.InputChanged:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement then
					if Popup.SlidingSaturation then Popup.SlideSaturation({ Position = UserInputService:GetMouseLocation() - Vector2.new(0, GuiService:GetGuiInset( ).Y) }) end
					if Popup.SlidingHue then Popup.SlideHue({ Position = UserInputService:GetMouseLocation() - Vector2.new(0, GuiService:GetGuiInset( ).Y) }) end
					if Popup.SlidingAlpha then Popup.SlideAlpha({ Position = UserInputService:GetMouseLocation() }) end
				end
			end))

			Utility.Signal(UserInputService.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					Popup.SlidingSaturation, Popup.SlidingHue, Popup.SlidingAlpha = false, false, false
				end
			end))

			return Popup
		end

		function Library.Window(self, cfg)
			cfg = cfg or { }; cfg = Library.Config(cfg, {
				size = UDim2.fromOffset(602, 502),
				open = true,
				NameStart = "baka",
				NameEnd = "dere",
			})

			local Window = {
				Objects = { },

				Visible = cfg.open,

				Tweening = false,

				TabsTweening = false,

				Tabs = { },

				CurrentPage = nil,
			}

			local Objects = Window.Objects; do
				Objects.ScreenGui = Utility.New("ScreenGui", {
					Name = "\0",
					Parent = HiddenUI,
					IgnoreGuiInset = true,
				})

				Objects.accent = Utility.New("Frame", {
					Name = "accent",
					Position = UDim2.new(0.5, -cfg.size.X.Offset / 2, 0.5, -cfg.size.Y.Offset / 2),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Size = cfg.size,
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.fromRGB(220, 100, 100),
					Parent = Objects.ScreenGui,
				}, { BackgroundColor3 = "accent" })

				Objects.outline = Utility.New("Frame", {
					Name = "outline",
					Position = UDim2.new(0, 1, 0, 1),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Size = UDim2.new(1, -2, 1, -2),
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.fromRGB(0, 0, 0),
					Parent = Objects.accent,
				}, { BackgroundColor3 = "outline" })

				Objects.background = Utility.New("Frame", {
					Name = "background",
					Position = UDim2.new(0, 1, 0, 1),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Size = UDim2.new(1, -2, 1, -2),
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.fromRGB(23, 25, 26),
					Parent = Objects.outline,
				}, { BackgroundColor3 = "background" })

				Objects.holder = Utility.New("Frame", {
					Name = "holder",
					BackgroundTransparency = 1,
					Position = UDim2.new(0, 0, 0, 44),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Size = UDim2.new(1, -14, 1, -58),
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					Parent = Objects.background,
				})

				Objects.dock_background = Utility.New("Frame", {
					Name = "dock_background",
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Size = UDim2.new(1, 0, 0, 30),
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.fromRGB(19, 19, 19),
					Parent = Objects.background,
				}, { BackgroundColor3 = "dock background" })

				Library.Dragging(Objects.accent, Objects.dock_background, true)

				Objects.textholder = Utility.New("Frame", {
					Name = "textholder",
					BackgroundTransparency = 1,
					Size = UDim2.new(0, 0, 1, 0),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					AutomaticSize = Enum.AutomaticSize.X,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					Parent = Objects.dock_background,
				})

				Utility.New("UIPadding", {
					PaddingRight = UDim.new(0, 6),
					PaddingLeft = UDim.new(0, 6),
					Parent = Objects.textholder,
				})

				Utility.New("UIListLayout", {
					VerticalAlignment = Enum.VerticalAlignment.Center,
					FillDirection = Enum.FillDirection.Horizontal,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Parent = Objects.textholder,
				})

				Objects.text = Utility.New("TextLabel", {
					FontFace = Library.Font,
					TextColor3 = Color3.fromRGB(230, 230, 230),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Text = cfg.NameStart,
					TextStrokeTransparency = 0,
					BackgroundTransparency = 1,
					Name = "text",
					BorderSizePixel = 0,
					AutomaticSize = Enum.AutomaticSize.X,
					TextSize = Library.FontSize,
					BackgroundColor3 = Color3.fromRGB(25, 25, 25),
					Parent = Objects.textholder,
				}, { TextColor3 = "text" })

				Objects.text2 = Utility.New("TextLabel", {
					FontFace = Library.Font,
					TextColor3 = Color3.fromRGB(220, 100, 100),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Text = cfg.NameEnd,
					TextStrokeTransparency = 0,
					BackgroundTransparency = 1,
					Name = "accent",
					BorderSizePixel = 0,
					AutomaticSize = Enum.AutomaticSize.X,
					TextSize = Library.FontSize,
					BackgroundColor3 = Color3.fromRGB(25, 25, 25),
					Parent = Objects.textholder,
				}, { TextColor3 = "accent" })

				Objects.shadow = Utility.New("Frame", {
					Name = "shadow",
					Position = UDim2.new(0, 0, 1, 0),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Size = UDim2.new(1, 0, 0, 8),
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.fromRGB(16, 16, 16),
					Parent = Objects.dock_background,
				})

				Utility.New("UIGradient", {
					Rotation = 90,
					Transparency = NumberSequence.new{
						NumberSequenceKeypoint.new(0, 0),
						NumberSequenceKeypoint.new(1, 1)
					},
					Parent = Objects.shadow,
				})

				Objects.tabsholder = Utility.New("Frame", {
					BackgroundTransparency = 1,
					Name = "tabsholder",
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Size = UDim2.new(0, 105, 1, 0),
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					Parent = Objects.holder,
				})

				Utility.New("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalFlex = Enum.UIFlexAlignment.Fill,
					Parent = Objects.tabsholder,
				})

				Window.tabsholder = Objects.tabsholder

				Window.pageholder = Objects.holder
			end

			function Window.Open()
				if Window.Tweening then
					return
				end

				Window.Tweening = true

				Library.ColorpickerWindow.Open(false)

				Window.Visible = not Window.Visible

				if Window.Visible then
					Objects.accent.Visible = true
				end

				for _,popup in Library.Popups do
					popup.Open(false)
				end

				local Tween;
				for _,obj in Objects.ScreenGui:GetDescendants() do
					local Index = Utility.GetTransparency(obj)

					if not Index then continue end

					if type(Index) == "table" then
						for _,prop in Index do
							Tween = Library.Fade(obj, prop, Window.Visible)
						end
					else
						Tween = Library.Fade(obj, Index, Window.Visible)
					end
				end

				Utility.Signal(Tween.Completed:Connect(function()
					Window.Tweening = false
					Objects.accent.Visible = Window.Visible
				end))
			end

			return setmetatable(Window, Library)
		end

		function Library.Tab(self, cfg)
			cfg = cfg or { }; cfg = Library.Config(cfg, {
				name = "Tab",
				image = "rbxassetid://12941020168",
				size = 45,
				side = false,
			})

			local Tab = {
				Selected = false,

				Objects = { },

				Name = cfg.name,

				Tabs = {}
			}

			local Objects = Tab.Objects; do
				Objects.holder = Utility.New("TextButton", {
					BackgroundTransparency = 1,
					Name = "holder",
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Size = UDim2.new(0, 105, 0, 88),
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					Parent = self.tabsholder,
				})

				Objects.icon = Utility.New("ImageLabel", {
					ImageColor3 = Color3.fromRGB(215, 215, 215),
					ScaleType = Enum.ScaleType.Fit,
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Name = "icon",
					AnchorPoint = Vector2.new(0.5, 0.5),
					Image = cfg.image,
					BackgroundTransparency = 1,
					Position = UDim2.new(0.5, -2, 0.5, 0),
					Size = UDim2.new(0, cfg.size, 0, cfg.size),
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					Parent = Objects.holder,
				}, { ImageColor3 = "text" })

				Objects.accent = Utility.New("Frame", {
					Name = "accent",
					Position = UDim2.new(1, -2, 0, 0),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Size = UDim2.new(0, 2, 1, 0),
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.fromRGB(220, 100, 100),
					Parent = Objects.holder,
				}, { BackgroundColor3 = "accent" })

				Objects.pagetabsholder = Utility.New("Frame", {
					Name = "pagetabsholder",
					BackgroundTransparency = 1,
					Position = UDim2.new(0, 115, 0, 0),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Size = UDim2.new(1, -115, 0, 32),
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					Parent = self.pageholder,
				})

				Utility.New("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					SortOrder = Enum.SortOrder.LayoutOrder,
					HorizontalFlex = Enum.UIFlexAlignment.Fill,
					Parent = Objects.pagetabsholder,
				})

				Tab.pagetabsholder = Objects.pagetabsholder

				Objects.page = Utility.New("Frame", {
					Name = "page",
					BackgroundTransparency = 1,
					Position = UDim2.new(0, 115, 0, 42),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Size = UDim2.new(1, -115, 1, -42),
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					Parent = self.pageholder,
				})

				Tab.pageholder = Objects.page
			end

			function Tab.Set(status, nested)
				Library.ChangeObjectTheme(Objects.accent, {
					BackgroundColor3 = status and "accent" or "inline",
				}, true)

				Library.ChangeObjectTheme(Objects.icon, {
					ImageColor3 = status and "text" or "dark text",
				}, true)

				Objects.pagetabsholder.Parent = status and self.pageholder or HiddenUI
				Objects.page.Parent = status and self.pageholder or HiddenUI

				Tab.Selected = status

				if not nested then
					for _,tab in self.Tabs do
						if tab == Tab then continue end

						tab.Set(false, true)
					end
				end
			end

			Utility.Signal(Objects.holder.MouseButton1Click:Connect(function()
				Tab.Set(true)
			end))

			table.insert(self.Tabs, Tab)

			return setmetatable(Tab, Library)
		end

		function Library.SubTab(self, cfg)
			cfg = cfg or { }; cfg = Library.Config(cfg, {
				name = "Tab",
			})

			local Tab = {
				Selected = false,

				Objects = { },
			}

			local Objects = Tab.Objects; do
				Objects.holder = Utility.New("TextButton", {
					BackgroundTransparency = 1,
					Name = "holder",
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Size = UDim2.new(0, 0, 1, 0),
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					Parent = self.pagetabsholder,
				})

				Objects.accent = Utility.New("Frame", {
					Name = "accent",
					Position = UDim2.new(0, 0, 1, -2),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Size = UDim2.new(1, 0, 0, 2),
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.fromRGB(220, 100, 100),
					Parent = Objects.holder,
				}, { BackgroundColor3 = "accent" })

				Objects.text = Utility.New("TextLabel", {
					FontFace = Library.Font,
					TextColor3 = Color3.fromRGB(230, 230, 230),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Text = cfg.name,
					TextStrokeTransparency = 0,
					Name = "text",
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 18),
					BorderSizePixel = 0,
					AutomaticSize = Enum.AutomaticSize.Y,
					TextSize = Library.FontSize,
					BackgroundColor3 = Color3.fromRGB(25, 25, 25),
					Parent = Objects.holder,
				}, { TextColor3 = "text" })  

				Objects.page = Utility.New("Frame", {
					Name = "page",
					BackgroundTransparency = 1,
					Position = UDim2.new(0, 0, 0, 0),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Size = UDim2.new(1, 0, 1, 0),
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					Parent = self.pageholder,
				})

				Utility.New("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalFlex = Enum.UIFlexAlignment.Fill,
					Padding = UDim.new(0, 10),
					SortOrder = Enum.SortOrder.LayoutOrder,
					Parent = Objects.page,
				})

				Objects.left = Utility.New("Frame", {
					BackgroundTransparency = 1,
					Name = "left",
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Size = UDim2.new(1, 0, 1, 0),
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					Parent = Objects.page,
				})

				Tab.left = Objects.left

				Utility.New("UIListLayout", {
					Padding = UDim.new(0, 10),
					SortOrder = Enum.SortOrder.LayoutOrder,
					Parent = Objects.left,
				})

				Objects.right = Utility.New("Frame", {
					BackgroundTransparency = 1,
					Name = "right",
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Size = UDim2.new(1, 0, 1, 0),
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					Parent = Objects.page,
				})

				Tab.right = Objects.right

				Utility.New("UIListLayout", {
					Padding = UDim.new(0, 10),
					SortOrder = Enum.SortOrder.LayoutOrder,
					Parent = Objects.right,
				})
			end

			function Tab.Set(status, nested)
				Library.ChangeObjectTheme(Objects.accent, {
					BackgroundColor3 = status and "accent" or "inline",
				}, true)

				Library.ChangeObjectTheme(Objects.text, {
					TextColor3 = status and "text" or "dark text",
				}, true)

				Tab.Selected = status

				Objects.page.Parent = status and self.pageholder or HiddenUI

				if not nested then
					for _,tab in self.Tabs do
						if tab == Tab then continue end

						tab.Set(false, true)
					end
				end
			end

			Utility.Signal(Objects.holder.MouseButton1Click:Connect(function()
				Tab.Set(true)
			end))

			table.insert(self.Tabs, Tab)

			return setmetatable(Tab, Library)
		end

		function Library.Section(self, cfg)
			cfg = cfg or { }; cfg = Library.Config(cfg, {
				name = "Section",
				tabs = false,
				side = "left",
				size = UDim2.new(1, 0, 1, 0)
			})

			local Side = cfg.side:lower() == "left" and self.left or self.right

			local Section = {
				Objects = {},

				Tabs = {},
			}

			local Objects = Section.Objects; do
				Objects.outline = Utility.New("Frame", {
					Name = "outline",
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Size = cfg.size,
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.fromRGB(0, 0, 0),
					Parent = Side,
				}, { BackgroundColor3 = "outline" })

				Objects.accent = Utility.New("Frame", {
					Name = "accent",
					Position = UDim2.new(0, 1, 0, 1),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Size = UDim2.new(1, -2, 1, -2),
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.fromRGB(220, 100, 100),
					Parent = Objects.outline,
				}, { BackgroundColor3 = "accent" })

				Objects.outline = Utility.New("Frame", {
					Name = "outline",
					Position = UDim2.new(0, 1, 0, 1),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Size = UDim2.new(1, -2, 1, -2),
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.fromRGB(0, 0, 0),
					Parent = Objects.accent,
				}, { BackgroundColor3 = "outline" })

				Objects.background = Utility.New("Frame", {
					Name = "background",
					Position = UDim2.new(0, 1, 0, 1),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Size = UDim2.new(1, -2, 1, -2),
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.fromRGB(23, 25, 26),
					Parent = Objects.outline,
				}, { BackgroundColor3 = "background" })

				Objects.dock_background = Utility.New("Frame", {
					Name = "dock_background",
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Size = UDim2.new(1, 0, 0, 28),
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.fromRGB(19, 19, 19),
					Parent = Objects.background,
				}, { BackgroundColor3 = "dock background" })

				Objects.shadow = Utility.New("Frame", {
					Name = "shadow",
					Position = UDim2.new(0, 0, 1, 0),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Size = UDim2.new(1, 0, 0, 8),
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.fromRGB(16, 16, 16),
					Parent = Objects.dock_background,
				})

				Utility.New("UIGradient", {
					Rotation = 90,
					Transparency = NumberSequence.new{
						NumberSequenceKeypoint.new(0, 0),
						NumberSequenceKeypoint.new(1, 1)
					},
					Parent = Objects.shadow,
				})

				Objects.text = Utility.New("TextLabel", {
					FontFace = Library.Font,
					TextColor3 = Color3.fromRGB(230, 230, 230),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Text = cfg.name,
					TextStrokeTransparency = 0,
					Name = "text",
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 1, -2),
					BorderSizePixel = 0,
					AutomaticSize = Enum.AutomaticSize.X,
					TextSize = Library.FontSize,
					BackgroundColor3 = Color3.fromRGB(25, 25, 25),
					Parent = Objects.dock_background,
				}, { TextColor3 = "text" })

				Objects.accent = Utility.New("ScrollingFrame", {
					Active = true,
					AutomaticCanvasSize = Enum.AutomaticSize.Y,
					BorderSizePixel = 0,
					CanvasSize = UDim2.new(0, 0, 0, 0),
					ScrollBarImageColor3 = Color3.fromRGB(220, 100, 100),
					MidImage = Library.Images.ScrollBar,
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					ScrollBarThickness = 1,
					Name = "accent",
					Size = UDim2.new(1, -12, 1, -28),
					BackgroundTransparency = 1,
					Position = UDim2.new(0, 12, 0, 28),
					BottomImage = Library.Images.ScrollBar,
					TopImage = Library.Images.ScrollBar,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					Parent = Objects.background,
				}, { ScrollBarImageColor3 = "accent" })

				Objects.content = Utility.New("Frame", {
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Name = "content",
					BackgroundTransparency = 1,
					Position = UDim2.new(0, 0, 0, 12),
					Size = UDim2.new(1, -12, 0, 0),
					BorderSizePixel = 0,
					AutomaticSize = Enum.AutomaticSize.Y,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					Parent = Objects.accent,
				})

				Utility.New("UIListLayout", {
					Padding = UDim.new(0, 9),
					SortOrder = Enum.SortOrder.LayoutOrder,
					Parent = Objects.content,
				})

				Utility.New("UIPadding", {
					Parent = Objects.accent,
					PaddingBottom = UDim.new(0, 4),
				})

				Section.holder = Objects.content
			end

			function Section.State(value)
				Objects.outline.Visible = value
			end

			return setmetatable(Section, Library)
		end

		function Library.Toggle(self, cfg)
			cfg = cfg or { }; cfg = Library.Config(cfg, {
				name = "New Toggle",
				value = false,
				callback = function() end,
				flag = nil,
			})



			if not cfg.flag then
				cfg.flag = cfg.name
			end

			local Toggle = {
				Objects = { },

				Tweening = false,

				Value = false,
			}

			local Objects = Toggle.Objects; do
				Objects.holder = Utility.New("Frame", {
					Name = "holder",
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 0),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					AutomaticSize = Enum.AutomaticSize.Y,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					Parent = self.holder,
				})

				Objects.line = Utility.New("TextButton", {
					Name = "line",
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 0),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					AutomaticSize = Enum.AutomaticSize.Y,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					Parent = Objects.holder,
				})

				Objects.inline = Utility.New("Frame", {
					Name = "inline",
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Size = UDim2.new(0, 17, 0, 17),
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.fromRGB(40, 42, 44),
					Parent = Objects.line,
				}, { BackgroundColor3 = "inline" })

				Objects.background = Utility.New("Frame", {
					Name = "background",
					Position = UDim2.new(0, 1, 0, 1),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Size = UDim2.new(1, -2, 1, -2),
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.fromRGB(23, 25, 26),
					Parent = Objects.inline,
				}, { BackgroundColor3 = "background" })

				Objects.accent = Utility.New("Frame", {
					Name = "accent",
					Position = UDim2.new(0, 1, 0, 1),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Size = UDim2.new(1, -2, 1, -2),
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.fromRGB(220, 100, 100),
					Parent = Objects.background,
				}, { BackgroundColor3 = "accent" })

				Objects.text = Utility.New("TextLabel", {
					FontFace = Library.Font,
					TextColor3 = Color3.fromRGB(230, 230, 230),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Text = cfg.name,
					TextStrokeTransparency = 0,
					Name = "text",
					Size = UDim2.new(1, -25, 1, -3),
					BackgroundTransparency = 1,
					TextXAlignment = Enum.TextXAlignment.Left,
					Position = UDim2.new(0, 25, 0, 0),
					BorderSizePixel = 0,
					TextSize = Library.FontSize,
					BackgroundColor3 = Color3.fromRGB(25, 25, 25),
					Parent = Objects.line,
				}, { TextColor3 = "text" })

				Utility.New("UIListLayout", {
					VerticalAlignment = Enum.VerticalAlignment.Center,
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Right,
					Padding = UDim.new(0, 2),
					SortOrder = Enum.SortOrder.LayoutOrder,
					Parent = Objects.text,
				})

				Toggle.childholder = Objects.text
			end

			function Toggle.Set(value)
				Toggle.Value = value

				Library.ChangeObjectTheme(Objects.text, {
					TextColor3 = value and "text" or "dark text"
				}, true)

				Library.Tween(Objects.accent, {
					BackgroundTransparency = value and 0 or 1
				})

				cfg.callback(value)

				Library.Flags[cfg.flag] = value
			end

			function Toggle.Enable()
				Toggle.Set(not Toggle.Value)
			end

			function Toggle.State(value)
				Objects.holder.Visible = value
			end

			Utility.Signal(Objects.line.MouseButton1Click:Connect(Toggle.Enable))

			Utility.Signal(Objects.line.MouseEnter:Connect(function()
				Library.ChangeObjectTheme(Objects.inline, {
					BackgroundColor3 = "inline hovering"
				}, true)

				Library.ChangeObjectTheme(Objects.text, {
					TextColor3 = "text"
				}, true)
			end))

			Utility.Signal(Objects.line.MouseLeave:Connect(function()
				Library.ChangeObjectTheme(Objects.inline, {
					BackgroundColor3 = "inline"
				}, true)

				if not Toggle.Value then
					Library.ChangeObjectTheme(Objects.text, {
						TextColor3 = "dark text"
					}, true)
				end
			end))

			Toggle.Set(cfg.value)

			Library.ConfigFlags[cfg.flag] = Toggle.Set

			return setmetatable(Toggle, Library)
		end

		function Library.Data(cfg)
			cfg = cfg or { }; cfg = Library.Config(cfg, {
				callback = function() end,
				value = nil,
				flag = nil,
			})

			if not cfg.flag then
				return;
			end

			local Data = {
				Value = cfg.value,
				Changed = function() end
			}

			Data.Set = function(Value)
				Data["Value"] = Value;
				cfg.callback(Value);
				Data.Changed(Value);
			end

			Data.Get = function()
				return Data["Value"];
			end

			Data.Set(cfg.value)

			Library.Flags[cfg.flag] = Data;
			Library.ConfigFlags[cfg.flag] = Data.Set
		end

		function Library.Slider(self, cfg)
			cfg = cfg or { }; cfg = Library.Config(cfg, {
				name = "New Slider",
				value = 50,
				min = 0,
				max = 100,
				float = 1,
				suffix = "%s",
				callback = function() end,
				flag = nil,
			})

			if not cfg.flag then
				cfg.flag = cfg.name
			end

			local Slider = {
				Tweening = false,

				Objects = { },

				Value = cfg.value,

				Sliding = false,
			}

			local Objects = Slider.Objects; do
				Objects.holder = Utility.New("Frame", {
					Name = "holder",
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 0),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					AutomaticSize = Enum.AutomaticSize.Y,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					Parent = self.holder,
				})

				Objects.line = Utility.New("TextButton", {
					Name = "line",
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 0),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					AutomaticSize = Enum.AutomaticSize.Y,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					Parent = Objects.holder,
				})

				if cfg.name ~= "" then
					Objects.text = Utility.New("TextLabel", {
						FontFace = Library.Font,
						TextColor3 = Color3.fromRGB(86, 86, 86),
						BorderColor3 = Color3.fromRGB(0, 0, 0),
						Text = cfg.name,
						TextStrokeTransparency = 0,
						Name = "text",
						Size = UDim2.new(1, 0, 0, 0),
						BackgroundTransparency = 1,
						TextXAlignment = Enum.TextXAlignment.Left,
						BorderSizePixel = 0,
						AutomaticSize = Enum.AutomaticSize.Y,
						TextSize = Library.FontSize,
						BackgroundColor3 = Color3.fromRGB(25, 25, 25),
						Parent = Objects.line,
					}, { TextColor3 = "dark text" })

					Slider.childholder = Objects.text

					Utility.New("UIListLayout", {
						VerticalAlignment = Enum.VerticalAlignment.Center,
						FillDirection = Enum.FillDirection.Horizontal,
						HorizontalAlignment = Enum.HorizontalAlignment.Right,
						Padding = UDim.new(0, 2),
						SortOrder = Enum.SortOrder.LayoutOrder,
						Parent = Objects.text,
					})
				end

				Objects.value = Utility.New("TextLabel", {
					FontFace = Library.Font,
					TextColor3 = Color3.fromRGB(86, 86, 86),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Text = "50%",
					TextStrokeTransparency = 0,
					Name = "text",
					Size = UDim2.new(0, 0, 1, 0),
					BackgroundTransparency = 1,
					TextXAlignment = Enum.TextXAlignment.Left,
					BorderSizePixel = 0,
					AutomaticSize = Enum.AutomaticSize.X,
					TextSize = Library.FontSize,
					BackgroundColor3 = Color3.fromRGB(25, 25, 25),
					Parent = Objects.text,
				}, { TextColor3 = "dark text" })

				Utility.New("UIListLayout", {
					VerticalAlignment = Enum.VerticalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder,
					HorizontalAlignment = Enum.HorizontalAlignment.Right,
					FillDirection = Enum.FillDirection.Horizontal,
					Parent = Objects.value,
				})

				Utility.New("UIListLayout", {
					Padding = UDim.new(0, 3),
					SortOrder = Enum.SortOrder.LayoutOrder,
					Parent = Objects.line,
				})

				Objects.inline = Utility.New("Frame", {
					Name = "inline",
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Size = UDim2.new(1, 0, 0, 14),
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.fromRGB(40, 42, 44),
					Parent = Objects.line,
				}, { BackgroundColor3 = "inline" })

				Objects.background = Utility.New("Frame", {
					Name = "background",
					Position = UDim2.new(0, 1, 0, 1),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Size = UDim2.new(1, -2, 1, -2),
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.fromRGB(23, 25, 26),
					Parent = Objects.inline,
				}, { BackgroundColor3 = "background" })

				Objects.accent = Utility.New("Frame", {
					Name = "accent",
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Size = UDim2.new(0.5, 0, 1, 0),
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.fromRGB(220, 100, 100),
					Parent = Objects.background,
				}, { BackgroundColor3 = "accent" })

				Utility.New("UIPadding", {
					PaddingTop = UDim.new(0, 1),
					PaddingBottom = UDim.new(0, 1),
					PaddingRight = UDim.new(0, 1),
					PaddingLeft = UDim.new(0, 1),
					Parent = Objects.background,
				})  
			end

			function Slider.Set(value)
				Slider.Value = math.clamp(Utility.Round(value, cfg.float), cfg.min, cfg.max)

				if Objects.value then
					Objects.value.Text = string.format(cfg.suffix, tostring(Slider.Value))
				end

				Objects.accent.Size = UDim2.new((Slider.Value - cfg.min) / (cfg.max - cfg.min), 0, 1, 0)

				cfg.callback(Slider.Value)

				Library.Flags[cfg.flag] = Slider.Value
			end

			function Slider.State(value)
				Objects.holder.Visible = value
			end

			Utility.Signal(Objects.line.MouseButton1Down:Connect(function(input)
				local MouseLocation = UserInputService:GetMouseLocation()

				Slider.Sliding = true

				Library.ChangeObjectTheme(Objects.text, {
					TextColor3 = "text"
				}, true)

				Library.ChangeObjectTheme(Objects.value, {
					TextColor3 = "text"
				}, true)

				Slider.Set( ((cfg.max - cfg.min) * ((MouseLocation.x - Objects.inline.AbsolutePosition.x) / Objects.inline.AbsoluteSize.x)) + cfg.min )
			end))

			Utility.Signal(Objects.line.MouseEnter:Connect(function(input)
				Library.ChangeObjectTheme(Objects.inline, {
					BackgroundColor3 = "inline hovering"
				}, true)

				Library.ChangeObjectTheme(Objects.text, {
					TextColor3 = "text"
				}, true)

				Library.ChangeObjectTheme(Objects.value, {
					TextColor3 = "text"
				}, true)
			end))

			Utility.Signal(Objects.line.MouseLeave:Connect(function(input)
				Library.ChangeObjectTheme(Objects.inline, {
					BackgroundColor3 = "inline"
				}, true)

				if not Slider.Sliding then
					Library.ChangeObjectTheme(Objects.text, {
						TextColor3 = "dark text"
					}, true)

					Library.ChangeObjectTheme(Objects.value, {
						TextColor3 = "dark text"
					}, true)
				end
			end))

			Utility.Signal(UserInputService.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 and Slider.Sliding then
					Slider.Sliding = false

					Library.ChangeObjectTheme(Objects.text, {
						TextColor3 = "dark text"
					}, true)

					Library.ChangeObjectTheme(Objects.value, {
						TextColor3 = "dark text"
					}, true)
				end
			end))

			Utility.Signal(UserInputService.InputChanged:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement and Slider.Sliding then
					Slider.Set( ((cfg.max - cfg.min) * ((input.Position.x - Objects.inline.AbsolutePosition.x) / Objects.inline.AbsoluteSize.x)) + cfg.min )
				end
			end))

			Slider.Set(cfg.value)

			Library.ConfigFlags[cfg.flag] = Slider.Set

			return setmetatable(Slider, Library)
		end

		function Library.Button(self, cfg)
			cfg = cfg or { }; cfg = Library.Config(cfg, {
				name = "New Button",
				confirm = false,
				callback = function() end,
			})

			local Button = {
				Clicked = false,

				Time = 0,

				Objects = { },
			}

			local Objects = Button.Objects; do
				Objects.holder = Utility.New("Frame", {
					Name = "holder",
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 0),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					AutomaticSize = Enum.AutomaticSize.Y,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					Parent = self.holder,
				})

				Objects.line = Utility.New("TextButton", {
					Name = "line",
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 0),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					AutomaticSize = Enum.AutomaticSize.Y,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					Parent = Objects.holder,
				})

				Objects.inline = Utility.New("Frame", {
					Name = "inline",
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Size = UDim2.new(1, 0, 0, 27),
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.fromRGB(40, 42, 44),
					Parent = Objects.line,
				}, { BackgroundColor3 = "inline" })

				Objects.background = Utility.New("Frame", {
					Name = "background",
					Position = UDim2.new(0, 1, 0, 1),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Size = UDim2.new(1, -2, 1, -2),
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.fromRGB(23, 25, 26),
					Parent = Objects.inline,
				}, { BackgroundColor3 = "background" })

				Objects.text = Utility.New("TextLabel", {
					FontFace = Library.Font,
					TextColor3 = Color3.fromRGB(86, 86, 86),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Text = cfg.name,
					TextStrokeTransparency = 0,
					BackgroundTransparency = 1,
					Name = "dark_text",
					Size = UDim2.new(1, 0, 1, -2),
					BorderSizePixel = 0,
					TextSize = Library.FontSize,
					BackgroundColor3 = Color3.fromRGB(25, 25, 25),
					Parent = Objects.background,
				}, { TextColor3 = "dark text" })
			end

			function Button.StartConfirmation()
				Button.Clicked = true

				Button.Time = 5

				Objects.text.Text = string.format("Confirm %s? (%s)", cfg.name, Button.Time)

				Button.Coroutine = coroutine.create(function()
					for i = 1, 5 do
						task.wait(1)

						Button.Time -= 1

						if Button.Time > 0 then
							Objects.text.Text = string.format("Confirm %s? (%s)", cfg.name, Button.Time)
						else
							Objects.text.Text = cfg.name

							if Button.Clicked then
								Library.ChangeObjectTheme(Objects.text, {
									TextColor3 = "dark text"
								}, true)

								Button.Clicked = false
							end

							break
						end
					end
				end); coroutine.resume(Button.Coroutine)
			end

			function Button.Click()
				if cfg.confirm then
					if Button.Clicked then
						Library.ChangeObjectTheme(Objects.text, {
							TextColor3 = "dark text"
						}, true)

						coroutine.close(Button.Coroutine)

						Objects.text.Text = cfg.name

						Button.Clicked = false

						cfg.callback()
					else
						Library.ChangeObjectTheme(Objects.text, {
							TextColor3 = "text"
						}, true)

						Button.StartConfirmation()
					end
				else
					cfg.callback()	

					Library.ChangeObjectTheme(Objects.text, {
						TextColor3 = "text"
					}, true)

					task.wait(Library.TweenSpeed)

					Library.ChangeObjectTheme(Objects.text, {
						TextColor3 = "dark text"
					}, true)
				end
			end

			function Button.State(value)
				Objects.holder.Visible = value
			end

			Utility.Signal(Objects.line.MouseButton1Click:Connect(Button.Click))

			Utility.Signal(Objects.line.MouseEnter:Connect(function()
				Library.ChangeObjectTheme(Objects.inline, {
					BackgroundColor3 = "inline hovering"
				}, true)

				if not Button.Clicked then
					Library.ChangeObjectTheme(Objects.text, {
						TextColor3 = "text"
					}, true)
				end
			end))

			Utility.Signal(Objects.line.MouseLeave:Connect(function()
				Library.ChangeObjectTheme(Objects.inline, {
					BackgroundColor3 = "inline"
				}, true)

				if not Button.Clicked then
					Library.ChangeObjectTheme(Objects.text, {
						TextColor3 = "dark text"
					}, true)
				end
			end))

			return setmetatable(Button, Library)
		end

		function Library.Dropdown(self, cfg)
			cfg = cfg or {}; cfg = Library.Config(cfg, {
				name = "New Dropdown",
				values = { "value1", "value2", "value3", "value4", "value5", "value6" },
				value = "value1",
				multi = false,
				flag = nil,
				callback = function() end,
			})

			if not cfg.flag then
				cfg.flag = cfg.name
			end

			local Dropdown = {
				Tweening = false,

				Visible = false,

				Objects = { },

				Popup = { Objects = {} },

				Items = { },

				Value = nil,
			}

			local Objects = Dropdown.Objects; do
				Objects.holder = Utility.New("Frame", {
					Name = "holder",
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 0),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					AutomaticSize = Enum.AutomaticSize.Y,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					Parent = self.holder,
				})

				Objects.line = Utility.New("TextButton", {
					Name = "line",
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 0),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					AutomaticSize = Enum.AutomaticSize.Y,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					Parent = Objects.holder,
				})

				Utility.New("UIListLayout", {
					Padding = UDim.new(0, 3),
					SortOrder = Enum.SortOrder.LayoutOrder,
					Parent = Objects.line,
				})

				if cfg.name ~= "" then
					Objects.text = Utility.New("TextLabel", {
						FontFace = Library.Font,
						TextColor3 = Color3.fromRGB(86, 86, 86),
						BorderColor3 = Color3.fromRGB(0, 0, 0),
						Text = cfg.name,
						TextStrokeTransparency = 0,
						Name = "text",
						Size = UDim2.new(1, 0, 0, 0),
						BackgroundTransparency = 1,
						TextXAlignment = Enum.TextXAlignment.Left,
						BorderSizePixel = 0,
						AutomaticSize = Enum.AutomaticSize.Y,
						TextSize = Library.FontSize,
						BackgroundColor3 = Color3.fromRGB(25, 25, 25),
						Parent = Objects.line,
					}, { TextColor3 = "dark text" })

					Dropdown.childholder = Objects.text

					Utility.New("UIListLayout", {
						VerticalAlignment = Enum.VerticalAlignment.Center,
						FillDirection = Enum.FillDirection.Horizontal,
						HorizontalAlignment = Enum.HorizontalAlignment.Right,
						Padding = UDim.new(0, 2),
						SortOrder = Enum.SortOrder.LayoutOrder,
						Parent = Objects.text,
					})
				end

				Objects.inline = Utility.New("Frame", {
					Name = "inline",
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Size = UDim2.new(1, 0, 0, 27),
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.fromRGB(40, 42, 44),
					Parent = Objects.line,
				}, { BackgroundColor3 = "inline" })

				Objects.background = Utility.New("Frame", {
					Name = "background",
					Position = UDim2.new(0, 1, 0, 1),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Size = UDim2.new(1, -2, 1, -2),
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.fromRGB(23, 25, 26),
					Parent = Objects.inline,
				}, { BackgroundColor3 = "background" })

				Objects.value = Utility.New("TextLabel", {
					FontFace = Library.Font,
					TextColor3 = Color3.fromRGB(86, 86, 86),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Text = "-",
					TextStrokeTransparency = 0,
					Name = "dark_text",
					Size = UDim2.new(1, -4, 1, -2),
					BackgroundTransparency = 1,
					TextXAlignment = Enum.TextXAlignment.Left,
					Position = UDim2.new(0, 4, 0, 0),
					BorderSizePixel = 0,
					ClipsDescendants = true,
					TextSize = Library.FontSize,
					BackgroundColor3 = Color3.fromRGB(25, 25, 25),
					Parent = Objects.background,
				}, { TextColor3 = "dark text" })

				Objects.ImageLabel = Utility.New("ImageLabel", {
					ImageColor3 = Color3.fromRGB(86, 86, 86),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					AnchorPoint = Vector2.new(1, 0.5),
					Image = Library.Images.Lines,
					BackgroundTransparency = 1,
					Position = UDim2.new(1, -8, 0.5, 0),
					Size = UDim2.new(0, 10, 0, 7),
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					Parent = Objects.background,
				})

				Objects.value.Size = UDim2.new(1, -(4 + Objects.ImageLabel.AbsoluteSize.X + 12), 1, -2)
			end

			local Popup = Dropdown.Popup; do
				local Objects = Popup.Objects

				Objects.inline = Utility.New("Frame", {
					Name = "inline",
					Position = UDim2.new(0, 618, 0, 464),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Size = UDim2.new(0, 199, 0, 60),
					BorderSizePixel = 0,
					Visible = false,
					ClipsDescendants = true,
					BackgroundColor3 = Color3.fromRGB(40, 42, 44),
					Parent = Library.ScreenGui,
				}, { BackgroundColor3 = "inline" })

				Objects.background = Utility.New("Frame", {
					Name = "background",
					Position = UDim2.new(0, 1, 0, 0),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Size = UDim2.new(1, -2, 1, -1),
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.fromRGB(23, 25, 26),
					Parent = Objects.inline,
				}, { BackgroundColor3 = "background" })

				Objects.accent = Utility.New("ScrollingFrame", {
					Active = true,
					AutomaticCanvasSize = Enum.AutomaticSize.Y,
					BorderSizePixel = 0,
					CanvasSize = UDim2.new(0, 0, 0, 0),
					ScrollBarImageColor3 = Color3.fromRGB(220, 100, 100),
					MidImage = Library.Images.ScrollBar,
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					ScrollBarThickness = 1,
					Name = "accent",
					Size = UDim2.new(1, 1, 1, 0),
					BackgroundTransparency = 1,
					Position = UDim2.new(0, -1, 0, 0),
					BottomImage = Library.Images.ScrollBar,
					TopImage = Library.Images.ScrollBar,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					Parent = Objects.background,
				}, { ScrollBarImageColor3 = "accent" })

				Utility.New("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					Parent = Objects.accent,
				})
			end

			-- Change Pos
			Utility.Signal(Objects.inline:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
				if Dropdown.Visible then
					local Size = Objects.inline.AbsoluteSize

					local Position = Objects.inline.AbsolutePosition

					Popup.Objects.inline.Position = UDim2.new(0, math.round(Position.X), 0, math.round(Position.Y) + math.round(Size.Y) + GuiService:GetGuiInset().Y - 2)
				end
			end))

			Utility.Signal(UserInputService.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 and Dropdown.Visible and not Utility.MouseOver(Popup.Objects.inline, input) then
					Dropdown.Open(false)
				end
			end))
			--

			function Dropdown.Display()
				local Value = Dropdown.Value

				if cfg.multi then
					local CurrentText = {}

					if #Value > 0 then
						for _,item in Value do
							table.insert(CurrentText, item)

							Objects.value.Text = table.concat(CurrentText, ", ")
						end
					else
						Objects.value.Text = "-"
					end
				else
					Objects.value.Text = type(Value) == "string" and Value or "-"
				end
			end

			function Dropdown.Size()
				local Size = 0

				local Count = 0

				for _,v in Popup.Objects.accent:GetChildren() do
					Count += 1

					if v:IsA("TextButton") then
						Size += v.AbsoluteSize.y
					end

					if Count > 5 then
						break
					end
				end

				return Size
			end

			function Dropdown.Open(visbility)
				if Dropdown.Tweening or Dropdown.Visible == visbility then
					return
				end

				Dropdown.Tweening = true

				Dropdown.Visible = visbility

				if Dropdown.Visible then
					Popup.Objects.inline.Visible = true
				end

				local ParentObjects = Popup.Objects.inline:GetDescendants()

				table.insert(ParentObjects, Popup.Objects.inline)

				for _, obj in ParentObjects do
					local Index = Utility.GetTransparency(obj)
					if not Index then continue end

					if type(Index) == "table" then
						for _, prop in Index do
							Library.Fade(obj, prop, Dropdown.Visible)
						end
					else
						Library.Fade(obj, Index, Dropdown.Visible)
					end
				end

				local Size = Vector2.new(Objects.inline.AbsoluteSize.x, math.round(Objects.inline.AbsoluteSize.y))

				local Position = Vector2.new(math.round(Objects.inline.AbsolutePosition.x), math.round(Objects.inline.AbsolutePosition.y))

				Popup.Objects.inline.Position = UDim2.new(0, Position.X, 0, Position.Y + Size.Y + 1 + GuiService:GetGuiInset().Y - 2)

				Popup.Objects.inline.Size = Dropdown.Visible and UDim2.new(0, Size.X, 0, 10) or UDim2.new(0, Size.X + 1, 0, Dropdown.Size())

				local Tween = Library.Tween(Popup.Objects.inline, {
					Size = Dropdown.Visible and UDim2.new(0, Size.X, 0, Dropdown.Size()) or UDim2.new(0, Size.X + 1, 0, 10),
				})

				Utility.Signal(Tween.Completed:Connect(function()
					Popup.Objects.inline.Visible = Dropdown.Visible

					Dropdown.Tweening = false
				end))
			end

			function Dropdown.Set(value, ignore)
				if cfg.multi then
					if type(value) == "table" then -- probably means config/values is loading...
						for _,item in Dropdown.Items do
							item.Select(false)
						end

						for _,item in value do
							for _,item2 in Dropdown.Items do
								if item2.Name == item then
									item2.Select(true)
								end
							end
						end

						Dropdown.Value = value

						Dropdown.Display()

						if not ignore then
							cfg.callback(Dropdown.Value)
						end

						Library.Flags[cfg.flag] = Dropdown.Value
					else
						local Index = table.find(Dropdown.Value, value)

						if Index then
							table.remove(Dropdown.Value, Index)

							for _,item in Dropdown.Items do
								if item.Name == value then
									item.Select(false)
								end
							end

							Dropdown.Display()

							if not ignore then
								cfg.callback(Dropdown.Value)
							end

							Library.Flags[cfg.flag] = Dropdown.Value
						else
							table.insert(Dropdown.Value, value)

							for _,item in Dropdown.Items do
								if item.Name == value then
									item.Select(true)
								end
							end

							Dropdown.Display()

							if not ignore then
								cfg.callback(Dropdown.Value)
							end

							Library.Flags[cfg.flag] = Dropdown.Value
						end
					end
				else
					for _,item in Dropdown.Items do
						item.Select(item.Name == value)
					end

					Dropdown.Value = value

					Dropdown.Display()

					if not ignore then
						cfg.callback(Dropdown.Value)
					end

					Library.Flags[cfg.flag] = Dropdown.Value
				end
			end

			function Dropdown.Add(name)
				local Item = {
					Objects = {},

					Name = name,

					Selected = false,
				}

				local Objects = Item.Objects; do
					Objects.holder = Utility.New("TextButton", {
						Name = "holder",
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, 0),
						BorderColor3 = Color3.fromRGB(0, 0, 0),
						BorderSizePixel = 0,
						AutomaticSize = Enum.AutomaticSize.Y,
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						Parent = Popup.Objects.accent,
					})

					Objects.text = Utility.New("TextLabel", {
						FontFace = Library.Font,
						TextColor3 = Color3.fromRGB(230, 230, 230),
						BorderColor3 = Color3.fromRGB(0, 0, 0),
						Text = name,
						TextStrokeTransparency = 0,
						Name = "text",
						BackgroundTransparency = 1,
						Position = UDim2.new(0, 5, 0, 0),
						BorderSizePixel = 0,
						AutomaticSize = Enum.AutomaticSize.XY,
						TextSize = Library.FontSize,
						BackgroundColor3 = Color3.fromRGB(25, 25, 25),
						Parent = Objects.holder,
					}, { TextColor3 = "dark text" })

					Utility.New("UIPadding", {
						PaddingBottom = UDim.new(0, 4),
						PaddingTop = UDim.new(0, 4),
						PaddingRight = UDim.new(0, 6),
						Parent = Objects.text,
					})

					Objects.accent = Utility.New("Frame", {
						Name = "accent",
						BorderColor3 = Color3.fromRGB(0, 0, 0),
						Size = UDim2.new(0, 1, 1, 0),
						BorderSizePixel = 0,
						BackgroundColor3 = Color3.fromRGB(220, 100, 100),
						Parent = Objects.holder,
					}, { BackgroundColor3 = "accent" })

					Utility.New("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						Parent = Objects.accent,
					})
				end

				function Item.Select(value)
					Library.ChangeObjectTheme(Objects.text, {
						TextColor3 = value and "text" or "dark text"
					}, true)

					Library.Tween(Objects.accent, {
						BackgroundTransparency = value and 0 or 1
					})

					Item.Selected = value
				end

				Utility.Signal(Objects.holder.MouseButton1Click:Connect(function()
					Dropdown.Set(name)
				end))

				Utility.Signal(Objects.holder.MouseEnter:Connect(function()
					if Item.Selected then return end

					Library.ChangeObjectTheme(Objects.text, {
						TextColor3 = "text"
					}, true)
				end))

				Utility.Signal(Objects.holder.MouseLeave:Connect(function()
					if Item.Selected then return end

					Library.ChangeObjectTheme(Objects.text, {
						TextColor3 = "dark text"
					}, true)
				end))

				table.insert(Dropdown.Items, Item)

				return Item
			end

			function Dropdown.Refresh(tbl)
				for _,item in Dropdown.Items do
					item.Objects.holder:Destroy()
				end

				Dropdown.Items = { }

				Dropdown.Value = cfg.multi and { } or nil

				for _,item in tbl do
					Dropdown.Add(item)
				end

				Dropdown.Display()
			end

			function Dropdown.State(value)
				Objects.holder.Visible = value
				Dropdown.Open(false)
			end

			for _,item in cfg.values do
				Dropdown.Add(item)
			end

			Dropdown.Set(cfg.value)

			Utility.Signal(Objects.line.MouseButton1Click:Connect(function()
				Dropdown.Open(not Dropdown.Visible)
			end))

			Utility.Signal(Objects.line.MouseEnter:Connect(function()
				Library.ChangeObjectTheme(Objects.inline, {
					BackgroundColor3 = "inline hovering"
				}, true)

				Library.ChangeObjectTheme(Objects.text, {
					TextColor3 = "text"
				}, true)

				Library.ChangeObjectTheme(Objects.value, {
					TextColor3 = "text"
				}, true)
			end))

			Utility.Signal(Objects.line.MouseLeave:Connect(function()
				Library.ChangeObjectTheme(Objects.inline, {
					BackgroundColor3 = "inline"
				}, true)

				Library.ChangeObjectTheme(Objects.text, {
					TextColor3 = "dark text"
				}, true)

				Library.ChangeObjectTheme(Objects.value, {
					TextColor3 = "dark text"
				}, true)
			end))

			Library.ConfigFlags[cfg.flag] = Dropdown.Set

			table.insert(Library.Popups, Dropdown)

			return setmetatable(Dropdown, Library)
		end

		function Library.List(self, cfg)
			cfg = cfg or { }; cfg = Library.Config(cfg, {
				name = "New List",
				value = "value1",
				values = { "value1", "value2", "value3", "value4", "value5", "value6" },
				multi = false,
				size = 100,
				search = false,
				callback = function() end,
				flag = nil,
			})

			if not cfg.flag then
				cfg.flag = cfg.name
			end

			local List = {
				Objects = { },

				Items = { },

				Value = nil,
			}

			function List.SearchFunc(text)
				text = text:lower()

				for _,item in List.Items do
					local Holder = item.Objects.text

					Holder.Visible = text == "" and true or item.Name:lower():find(text)
				end
			end

			local Objects = List.Objects; do
				Objects.holder = Utility.New("Frame", {
					Name = "holder",
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 0),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					AutomaticSize = Enum.AutomaticSize.Y,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					Parent = self.holder,
				})

				Objects.line = Utility.New("Frame", {
					Name = "line",
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 0),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					AutomaticSize = Enum.AutomaticSize.Y,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					Parent = Objects.holder,
				})

				Utility.New("UIListLayout", {
					Padding = UDim.new(0, 3),
					SortOrder = Enum.SortOrder.LayoutOrder,
					Parent = Objects.line,
				})

				if cfg.name ~= "" then
					Objects.text = Utility.New("TextLabel", {
						FontFace = Library.Font,
						TextColor3 = Color3.fromRGB(86, 86, 86),
						BorderColor3 = Color3.fromRGB(0, 0, 0),
						Text = cfg.name,
						TextStrokeTransparency = 0,
						Name = "text",
						Size = UDim2.new(1, 0, 0, 0),
						BackgroundTransparency = 1,
						TextXAlignment = Enum.TextXAlignment.Left,
						BorderSizePixel = 0,
						AutomaticSize = Enum.AutomaticSize.Y,
						TextSize = Library.FontSize,
						BackgroundColor3 = Color3.fromRGB(25, 25, 25),
						Parent = Objects.line,
					}, { TextColor3 = "dark text" })

					Utility.New("UIListLayout", {
						VerticalAlignment = Enum.VerticalAlignment.Center,
						FillDirection = Enum.FillDirection.Horizontal,
						HorizontalAlignment = Enum.HorizontalAlignment.Right,
						Padding = UDim.new(0, 2),
						SortOrder = Enum.SortOrder.LayoutOrder,
						Parent = Objects.text,
					})

					List.childholder = Objects.text
				end

				Objects.box = Utility.New("Frame", {
					Name = "box",
					Size = UDim2.new(1, 0, 0, 0),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					AutomaticSize = Enum.AutomaticSize.Y,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					Parent = Objects.line,
				})

				Utility.New("UIListLayout", {
					Padding = UDim.new(0, -1),
					SortOrder = Enum.SortOrder.LayoutOrder,
					Parent = Objects.box,
				})

				if cfg.search then
					Library.Textbox({
						holder = Objects.box
					}, {
						name = "",
						callback = function(value)
							List.SearchFunc(value)
						end,
						flag = "list_search_" .. cfg.name,
					})
				end

				Objects.inline = Utility.New("Frame", {
					Name = "inline",
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Size = UDim2.new(1, 0, 0, cfg.size),
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.fromRGB(40, 42, 44),
					Parent = Objects.box,
				}, { BackgroundColor3 = "inline" })

				Objects.background = Utility.New("Frame", {
					Name = "background",
					Position = UDim2.new(0, 1, 0, 1),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Size = UDim2.new(1, -2, 1, -2),
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.fromRGB(23, 25, 26),
					Parent = Objects.inline,
				}, { BackgroundColor3 = "background" })

				Objects.accent = Utility.New("ScrollingFrame", {
					Active = true,
					AutomaticCanvasSize = Enum.AutomaticSize.Y,
					BorderSizePixel = 0,
					CanvasSize = UDim2.new(0, 0, 0, 0),
					ScrollBarImageColor3 = Color3.fromRGB(220, 100, 100),
					MidImage = Library.Images.ScrollBar,
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					ScrollBarThickness = 1,
					Name = "accent",
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 1, 0),
					BottomImage = Library.Images.ScrollBar,
					TopImage = Library.Images.ScrollBar,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					Parent = Objects.background,
				}, { ScrollBarImageColor3 = "accent" })

				Utility.New("UIListLayout", {
					Padding = UDim.new(0, 10),
					SortOrder = Enum.SortOrder.LayoutOrder,
					Parent = Objects.accent,
				})

				Utility.New("UIPadding", {
					PaddingTop = UDim.new(0, 4),
					PaddingBottom = UDim.new(0, 4),
					PaddingRight = UDim.new(0, 4),
					PaddingLeft = UDim.new(0, 4),
					Parent = Objects.accent,
				})
			end

			function List.Set(value)
				if cfg.multi then
					if type(value) == "table" then -- probably means config/values is loading...
						for _,item in List.Items do
							item.Select(false)
						end

						for _,item in value do
							for _,item2 in List.Items do
								if item2.Name == item then
									item2.Select(true)
								end
							end
						end

						List.Value = value

						cfg.callback(List.Value)

						Library.Flags[cfg.flag] = List.Value
					else
						local Index = table.find(List.Value, value)

						if Index then
							table.remove(List.Value, Index)

							for _,item in List.Items do
								if item.Name == value then
									item.Select(false)
								end
							end

							cfg.callback(List.Value)

							Library.Flags[cfg.flag] = List.Value
						else
							table.insert(List.Value, value)

							for _,item in List.Items do
								if item.Name == value then
									item.Select(true)
								end
							end

							cfg.callback(List.Value)

							Library.Flags[cfg.flag] = List.Value
						end
					end
				else
					for _,item in List.Items do
						item.Select(item.Name == value)
					end

					List.Value = value

					cfg.callback(List.Value)

					Library.Flags[cfg.flag] = List.Value
				end
			end

			function List.Add(name)
				local Item = {
					Objects = {},

					Name = name,

					Selected = false,
				}

				local Objs = Item.Objects; do
					Objs.text = Utility.New("TextButton", {
						FontFace = Library.Font,
						TextColor3 = Color3.fromRGB(86, 86, 86),
						BorderColor3 = Color3.fromRGB(0, 0, 0),
						Text = name,
						TextStrokeTransparency = 0,
						Name = "text",
						Size = UDim2.new(1, 0, 0, 0),
						BackgroundTransparency = 1,
						TextXAlignment = Enum.TextXAlignment.Left,
						BorderSizePixel = 0,
						AutomaticSize = Enum.AutomaticSize.Y,
						TextSize = Library.FontSize,
						BackgroundColor3 = Color3.fromRGB(25, 25, 25),
						Parent = Objects.accent,
					}, { TextColor3 = "dark text" })
				end

				function Item.Select(value)
					Library.ChangeObjectTheme(Objs.text, {
						TextColor3 = value and "text" or "dark text"
					}, true)

					Item.Selected = value
				end

				Utility.Signal(Objs.text.MouseButton1Click:Connect(function()
					List.Set(name)
				end))

				Utility.Signal(Objs.text.MouseEnter:Connect(function()
					if Item.Selected then return end

					Library.ChangeObjectTheme(Objs.text, {
						TextColor3 = "text"
					}, true)
				end))

				Utility.Signal(Objs.text.MouseLeave:Connect(function()
					if Item.Selected then return end

					Library.ChangeObjectTheme(Objs.text, {
						TextColor3 = "dark text"
					}, true)
				end))

				table.insert(List.Items, Item)

				return Item
			end

			function List.Refresh(tbl)
				for _,item in List.Items do
					item.Objects.text:Destroy()
				end

				List.Items = { }

				List.Value = cfg.multi and { } or nil

				for _,item in tbl do
					List.Add(item)
				end
			end

			function List.State(value)
				Objects.holder.Visible = value
			end

			for _,item in cfg.values do
				List.Add(item)
			end

			Utility.Signal(Objects.inline.MouseEnter:Connect(function()
				Library.ChangeObjectTheme(Objects.inline, {
					BackgroundColor3 = "inline hovering"
				}, true)
			end))

			Utility.Signal(Objects.inline.MouseLeave:Connect(function()
				Library.ChangeObjectTheme(Objects.inline, {
					BackgroundColor3 = "inline"
				}, true)
			end))

			List.Set(cfg.value)

			Library.ConfigFlags[cfg.flag] = List.Set

			return setmetatable(List, Library)
		end

		function Library.Textbox(self, cfg)
			cfg = cfg or { }; cfg = Library.Config(cfg, {
				name = "Textbox",
				value = "",
				callback = function() end,
				flag = nil,
			})

			if not cfg.flag then
				cfg.flag = cfg.name
			end

			local Textbox = {
				Objects = { },
			}

			local Objects = Textbox.Objects; do
				Objects.holder = Utility.New("Frame", {
					Name = "holder",
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 0),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					AutomaticSize = Enum.AutomaticSize.Y,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					Parent = self.holder,
				})

				Objects.line = Utility.New("Frame", {
					Name = "line",
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 0),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					AutomaticSize = Enum.AutomaticSize.Y,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					Parent = Objects.holder,
				})

				Utility.New("UIListLayout", {
					Padding = UDim.new(0, 3),
					SortOrder = Enum.SortOrder.LayoutOrder,
					Parent = Objects.line,
				})

				if cfg.name ~= "" then
					Objects.text = Utility.New("TextLabel", {
						FontFace = Library.Font,
						TextColor3 = Color3.fromRGB(86, 86, 86),
						BorderColor3 = Color3.fromRGB(0, 0, 0),
						Text = cfg.name,
						TextStrokeTransparency = 0,
						Name = "text",
						Size = UDim2.new(1, 0, 0, 0),
						BackgroundTransparency = 1,
						TextXAlignment = Enum.TextXAlignment.Left,
						BorderSizePixel = 0,
						AutomaticSize = Enum.AutomaticSize.Y,
						TextSize = Library.FontSize,
						BackgroundColor3 = Color3.fromRGB(25, 25, 25),
						Parent = Objects.line,
					}, { TextColor3 = "dark text" })

					Textbox.childholder = Objects.text

					Utility.New("UIListLayout", {
						VerticalAlignment = Enum.VerticalAlignment.Center,
						FillDirection = Enum.FillDirection.Horizontal,
						HorizontalAlignment = Enum.HorizontalAlignment.Right,
						Padding = UDim.new(0, 2),
						SortOrder = Enum.SortOrder.LayoutOrder,
						Parent = Objects.text,
					})
				end

				Objects.inline = Utility.New("Frame", {
					Name = "inline",
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Size = UDim2.new(1, 0, 0, 27),
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.fromRGB(40, 42, 44),
					Parent = Objects.line,
				}, { BackgroundColor3 = "inline" })

				Objects.background = Utility.New("Frame", {
					Name = "background",
					Position = UDim2.new(0, 1, 0, 1),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Size = UDim2.new(1, -2, 1, -2),
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.fromRGB(23, 25, 26),
					Parent = Objects.inline,
				}, { BackgroundColor3 = "background" })

				Objects.textbox = Utility.New("TextBox", {
					FontFace = Library.Font,
					Name = "text",
					TextColor3 = Color3.fromRGB(230, 230, 230),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Text = cfg.value,
					Size = UDim2.new(1, -5, 1, 0),
					TextStrokeTransparency = 0,
					Position = UDim2.new(0, 4, 0, 0),
					ClipsDescendants = true,
					BackgroundTransparency = 1,
					TextXAlignment = Enum.TextXAlignment.Left,
					BorderSizePixel = 0,
					ClearTextOnFocus = false,
					TextSize = Library.FontSize,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					Parent = Objects.background,
				}, { TextColor3 = "dark text" })			 
			end

			function Textbox.Set(value)
				Objects.textbox.Text = value

				Library.Flags[cfg.flag] = value
				cfg.callback(value)
			end

			function Textbox.State(value)
				Objects.holder.Visible = value
			end

			Utility.Signal(Objects.textbox.FocusLost:Connect(function()
				Textbox.Set(Objects.textbox.Text)

				Library.ChangeObjectTheme(Objects.textbox, {
					TextColor3 = "dark text"
				}, true)
			end))

			Utility.Signal(Objects.textbox.Focused:Connect(function()
				Library.ChangeObjectTheme(Objects.textbox, {
					TextColor3 = "text"
				}, true)
			end))

			Utility.Signal(Objects.line.MouseEnter:Connect(function()
				Library.ChangeObjectTheme(Objects.inline, {
					BackgroundColor3 = "inline hovering"
				}, true)

				Library.ChangeObjectTheme(Objects.text, {
					TextColor3 = "text"
				}, true)
			end))

			Utility.Signal(Objects.line.MouseLeave:Connect(function()
				Library.ChangeObjectTheme(Objects.inline, {
					BackgroundColor3 = "inline"
				}, true)

				Library.ChangeObjectTheme(Objects.text, {
					TextColor3 = "dark text"
				}, true)
			end))

			Textbox.Set(cfg.value)

			Library.ConfigFlags[cfg.flag] = Textbox.Set

			return setmetatable(Textbox, Library)
		end

		function Library.Colorpicker(self, cfg)
			cfg = cfg or { }; cfg = Library.Config(cfg, {
				name = "New Colorpicker",
				value = Color3.new(1, 1, 1),
				alpha = 0,
				usealpha = true,
				flag = nil,
				ignore = false,
				callback = function() end,
			})

			if not cfg.flag then
				cfg.flag = cfg.name
			end

			local Colorpicker = {
				Tweening = false,

				ZIndex = self.ZIndex,

				Objects = { },

				OriginalColor = cfg.value,

				Popup = { },

				Value = cfg.value,

				Alpha = cfg.alpha,
			}

			local ZIndex = Colorpicker.ZIndex

			local Objects = Colorpicker.Objects; do
				if not self.childholder then
					Objects.holder = Utility.New("Frame", {
						Name = "holder",
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, 0),
						BorderColor3 = Color3.fromRGB(0, 0, 0),
						BorderSizePixel = 0,
						AutomaticSize = Enum.AutomaticSize.Y,
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						Parent = self.holder,
					})

					Objects.line = Utility.New("Frame", {
						Name = "line",
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, 0),
						BorderColor3 = Color3.fromRGB(0, 0, 0),
						BorderSizePixel = 0,
						AutomaticSize = Enum.AutomaticSize.Y,
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						Parent = Objects.holder,
					})

					Objects.text = Utility.New("TextLabel", {
						FontFace = Library.Font,
						TextColor3 = Color3.fromRGB(86, 86, 86),
						BorderColor3 = Color3.fromRGB(0, 0, 0),
						Text = cfg.name,
						TextStrokeTransparency = 0,
						Name = "text",
						Size = UDim2.new(1, 0, 0, 0),
						BackgroundTransparency = 1,
						TextXAlignment = Enum.TextXAlignment.Left,
						BorderSizePixel = 0,
						AutomaticSize = Enum.AutomaticSize.Y,
						TextSize = Library.FontSize,
						BackgroundColor3 = Color3.fromRGB(25, 25, 25),
						Parent = Objects.line,
					}, { TextColor3 = "dark text" })

					Utility.New("UIListLayout", {
						VerticalAlignment = Enum.VerticalAlignment.Center,
						FillDirection = Enum.FillDirection.Horizontal,
						HorizontalAlignment = Enum.HorizontalAlignment.Right,
						Padding = UDim.new(0, 2),
						SortOrder = Enum.SortOrder.LayoutOrder,
						Parent = Objects.text,
					})

					Colorpicker.childholder = Objects.text
				end

				local Parent = self.childholder or Objects.text

				Objects.inline = Utility.New("TextButton", {
					Name = "inline",
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Size = UDim2.new(0, 24, 0, 12),
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.fromRGB(40, 42, 44),
					Parent = Parent,
				}, { BackgroundColor3 = "inline" })

				Objects.background = Utility.New("Frame", {
					Name = "background",
					Position = UDim2.new(0, 1, 0, 1),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Size = UDim2.new(1, -2, 1, -2),
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.fromRGB(23, 25, 26),
					Parent = Objects.inline,
				}, { BackgroundColor3 = "background" })

				Objects.alphaimage = Utility.New("ImageLabel", {
					ScaleType = Enum.ScaleType.Tile,
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Name = "alphaimage",
					Image = Library.Images.Checkers,
					TileSize = UDim2.new(0, 6, 0, 6),
					Position = UDim2.new(0, 1, 0, 1),
					Size = UDim2.new(1, -2, 1, -2),
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					Parent = Objects.background,
				})

				Objects.color = Utility.New("Frame", {
					BackgroundTransparency = 0,
					Name = "color",
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Size = UDim2.new(1, 0, 1, 0),
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.fromRGB(0, 151, 197),
					Parent = Objects.alphaimage,
				})
			end

			local ColorpickerWindow = Library.ColorpickerWindow

			function Colorpicker.Set(value, alpha)
				local Color, Alpha;

				if type(value) == "table" then
					Color = value.c
					Alpha = value.a
				else
					Color = value
					Alpha = alpha or Colorpicker.Alpha
				end

				Colorpicker.Value = Color

				if Alpha then
					Colorpicker.Alpha = Alpha

					Objects.color.BackgroundTransparency = Alpha
				end

				Objects.color.BackgroundColor3 = Color

				if not cfg.ignore then
					Library.Flags[cfg.flag] = {
						c = Color,
						a = Alpha
					}
				end

				cfg.callback({
					c = Color,
					a = Alpha
				})
			end

			function Colorpicker.State(state)
				if Objects.holder then Objects.holder.Visible = state end
				Objects.inline.Visible = state
				ColorpickerWindow.Open(false)
			end

			Utility.Signal(Objects.inline.MouseButton1Click:Connect(function(input)
				ColorpickerWindow.Flag = cfg.flag

				ColorpickerWindow.SetFunc = Colorpicker.Set

				ColorpickerWindow.OriginalColor = Colorpicker.OriginalColor

				ColorpickerWindow.Set(Colorpicker.Value, Colorpicker.Alpha)

				ColorpickerWindow.Open(not ColorpickerWindow.Visible, Objects.inline.AbsolutePosition + Vector2.new(0, Objects.inline.AbsoluteSize.Y + 2 + GuiService:GetGuiInset().Y) )

				ColorpickerWindow.Objects.alphaimage.Visible = cfg.usealpha
			end))

			Utility.Signal(UserInputService.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 and ColorpickerWindow.Visible and ColorpickerWindow.Flag == cfg.flag and not (Utility.MouseOver(ColorpickerWindow.Objects.accent, input) or Utility.MouseOver(Objects.inline, input)) then
					ColorpickerWindow.Open(false, Objects.inline.AbsolutePosition + Vector2.new(0, Objects.inline.AbsoluteSize.Y + 2 + GuiService:GetGuiInset().Y) )
				end
			end))

			Utility.Signal(Objects.inline.MouseEnter:Connect(function()
				Library.ChangeObjectTheme(Objects.inline, {
					BackgroundColor3 = "inline hovering"
				}, true)
			end))

			Utility.Signal(Objects.inline.MouseLeave:Connect(function()
				Library.ChangeObjectTheme(Objects.inline, {
					BackgroundColor3 = "inline"
				}, true)
			end))

			if Objects.line then
				Utility.Signal(Objects.line.MouseEnter:Connect(function()
					Library.ChangeObjectTheme(Objects.text, {
						TextColor3 = "text"
					}, true)
				end))

				Utility.Signal(Objects.line.MouseLeave:Connect(function()
					Library.ChangeObjectTheme(Objects.text, {
						TextColor3 = "dark text"
					}, true)
				end))
			end

			Colorpicker.Set(cfg.value, cfg.alpha)

			if not cfg.ignore then
				Library.ConfigFlags[cfg.flag] = Colorpicker.Set
			end

			return setmetatable(Colorpicker, Library)
		end

		function Library.Keybind(self, cfg)
			cfg = cfg or { }; cfg = Library.Config(cfg, {
				name = "New Keybind",
				value = false,
				key = nil,
				mode = "Toggle",
				ignore = false,
				callback = function() end,
				flag = nil,
			})

			if not cfg.flag then
				cfg.flag = cfg.name
			end

			local Keybind = {
				Tweening = false,

				Visible = false,

				Objects = { },

				Popup = { Objects = {}, Items = {} },

				Key = nil,

				Mode = nil,

				Value = false,

				OnHold = nil,

				Listener = nil,
			}

			local Objects = Keybind.Objects; do
				if not self.childholder then
					Objects.holder = Utility.New("Frame", {
						Name = "holder",
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, 0),
						BorderColor3 = Color3.fromRGB(0, 0, 0),
						BorderSizePixel = 0,
						AutomaticSize = Enum.AutomaticSize.Y,
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						Parent = self.holder,
					})

					Objects.line = Utility.New("Frame", {
						Name = "line",
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, 0),
						BorderColor3 = Color3.fromRGB(0, 0, 0),
						BorderSizePixel = 0,
						AutomaticSize = Enum.AutomaticSize.Y,
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						Parent = Objects.holder,
					})

					Objects.text = Utility.New("TextLabel", {
						FontFace = Library.Font,
						TextColor3 = Color3.fromRGB(86, 86, 86),
						BorderColor3 = Color3.fromRGB(0, 0, 0),
						Text = cfg.name,
						TextStrokeTransparency = 0,
						Name = "text",
						Size = UDim2.new(1, 0, 0, 0),
						BackgroundTransparency = 1,
						TextXAlignment = Enum.TextXAlignment.Left,
						BorderSizePixel = 0,
						AutomaticSize = Enum.AutomaticSize.Y,
						TextSize = Library.FontSize,
						BackgroundColor3 = Color3.fromRGB(25, 25, 25),
						Parent = Objects.line,
					}, { TextColor3 = "dark text" })

					Utility.New("UIListLayout", {
						VerticalAlignment = Enum.VerticalAlignment.Center,
						FillDirection = Enum.FillDirection.Horizontal,
						HorizontalAlignment = Enum.HorizontalAlignment.Right,
						Padding = UDim.new(0, 2),
						SortOrder = Enum.SortOrder.LayoutOrder,
						Parent = Objects.text,
					})

					Keybind.childholder = Objects.text
				end

				local Parent = self.childholder or Objects.text

				Objects.value = Utility.New("TextButton", {
					FontFace = Library.Font,
					TextColor3 = Color3.fromRGB(86, 86, 86),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Text = "[-]",
					TextStrokeTransparency = 0,
					Name = "text",
					Size = UDim2.new(0, 0, 1, 0),
					BackgroundTransparency = 1,
					TextXAlignment = Enum.TextXAlignment.Left,
					BorderSizePixel = 0,
					AutomaticSize = Enum.AutomaticSize.X,
					TextSize = 12,
					BackgroundColor3 = Color3.fromRGB(25, 25, 25),
					Parent = Parent,
				}, { TextColor3 = "dark text" })

				Utility.New("UIListLayout", {
					VerticalAlignment = Enum.VerticalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder,
					HorizontalAlignment = Enum.HorizontalAlignment.Right,
					FillDirection = Enum.FillDirection.Horizontal,
					Parent = Objects.value,
				})
			end

			local Popup = Keybind.Popup; do
				Popup.Objects.inline = Utility.New("Frame", {
					Name = "inline",
					Position = UDim2.new(0, 0, 0, 0),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					Visible = false,
					AutomaticSize = Enum.AutomaticSize.XY,
					BackgroundColor3 = Color3.fromRGB(40, 42, 44),
					Parent = Library.ScreenGui,
				}, { BackgroundColor3 = "inline" })

				Popup.Objects.background = Utility.New("Frame", {
					Name = "background",
					Position = UDim2.new(0, 1, 0, 1),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Size = UDim2.new(1, -2, 1, -2),
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.fromRGB(23, 25, 26),
					Parent = Popup.Objects.inline,
				}, { BackgroundColor3 = "background" })

				Utility.New("UIPadding", {
					PaddingBottom = UDim.new(0, 1),
					Parent = Popup.Objects.background,
				})

				Utility.New("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					Parent = Popup.Objects.background,
				})

				function Popup.SetMode(mode)
					for _,item in Popup.Items do
						item.Select(item.Mode == mode)
					end
				end

				function Popup.Add(mode)
					local Item = {
						Objects = {},

						Mode = mode,

						Selected = false,
					}

					local Objs = Item.Objects; do
						Objs.holder = Utility.New("TextButton", {
							BackgroundTransparency = 1,
							Name = "holder",
							BorderColor3 = Color3.fromRGB(0, 0, 0),
							BorderSizePixel = 0,
							AutomaticSize = Enum.AutomaticSize.XY,
							BackgroundColor3 = Color3.fromRGB(255, 255, 255),
							Parent = Popup.Objects.background,
						})

						Objs.text = Utility.New("TextLabel", {
							FontFace = Library.Font,
							TextColor3 = Color3.fromRGB(230, 230, 230),
							BorderColor3 = Color3.fromRGB(0, 0, 0),
							Text = mode,
							TextStrokeTransparency = 0,
							Name = "text",
							BackgroundTransparency = 1,
							Position = UDim2.new(0, 4, 0, 0),
							BorderSizePixel = 0,
							AutomaticSize = Enum.AutomaticSize.XY,
							TextSize = 12,
							BackgroundColor3 = Color3.fromRGB(25, 25, 25),
							Parent = Objs.holder,
						}, { TextColor3 = "dark text" })

						Utility.New("UIPadding", {
							PaddingBottom = UDim.new(0, 4),
							PaddingTop = UDim.new(0, 4),
							PaddingRight = UDim.new(0, 6),
							Parent = Objs.text,
						})

						Objs.accent = Utility.New("Frame", {
							Name = "accent",
							Position = UDim2.new(0, -1, 0, 0),
							BorderColor3 = Color3.fromRGB(0, 0, 0),
							Size = UDim2.new(0, 1, 1, 0),
							BorderSizePixel = 0,
							BackgroundTransparency = 1,
							BackgroundColor3 = Color3.fromRGB(220, 100, 100),
							Parent = Objs.holder,
						}, { BackgroundColor3 = "accent" })
					end

					function Item.Select(value)
						Library.ChangeObjectTheme(Objs.text, {
							TextColor3 = value and "text" or "dark text"
						})

						Library.Tween(Objs.accent, {
							BackgroundTransparency = value and 0 or 1
						})

						Item.Selected = value
					end

					Utility.Signal(Objs.holder.MouseButton1Click:Connect(function()
						Keybind.Set(mode)
					end))

					Utility.Signal(Objs.holder.MouseEnter:Connect(function()
						if Item.Selected then return end

						Library.ChangeObjectTheme(Objs.text, {
							TextColor3 = "text"
						})
					end))

					Utility.Signal(Objs.holder.MouseLeave:Connect(function()
						if Item.Selected then return end

						Library.ChangeObjectTheme(Objs.text, {
							TextColor3 = "dark text"
						})
					end))

					Popup.Items[mode] = Item

					return Item
				end

				Utility.Signal(Objects.value:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
					if Keybind.Visible then
						local Size = Objects.value.AbsoluteSize
						local Position = Objects.value.AbsolutePosition

						Popup.Objects.inline.Position = UDim2.new(0, math.round(Position.X), 0, math.round(Position.Y) + math.round(Size.Y) + 2 + GuiService:GetGuiInset().Y)
					end
				end))
			end; Keybind.ZIndex = ZIndex

			for _,mode in {"Always on", "Hold", "Toggle"} do
				Popup.Add(mode)
			end

			local Item;
			if not cfg.ignore then
				Item = Library.KeybindsList.Add()
			end

			function Keybind.Set(value, ignore)
				if type(value) == "table" then
					for _,v in value do 
						Keybind.Set(v, true)
					end

					return 
				end

				local Type = typeof(value)
				if Type == "EnumItem" then
					Keybind.Key = value 

					value = ( value == Enum.KeyCode.Unknown and "-" or value.Name )

					Objects.value.Text = string.format("[%s]", KeyConverters[ value:lower() ] or value)
				elseif Type == "boolean" then
					-- state 
					if Keybind.Mode == "Always on" and not value then
						value = true 
					end 

					Keybind.Value = value 
				elseif Type == "string" then
					-- method
					if Keybind.OnHold and value ~= "Hold" then 
						Keybind.OnHold:Disconnect( )
						Keybind.OnHold = nil 
					end 

					Keybind.Mode = value 

					Popup.SetMode(value)

					if value == "Always on" then
						Keybind.Value = true 
					end	
				end 

				if Item then
					Item.Set(Keybind.Value, cfg.name, Keybind.Mode or "Toggle")
				end

				if not ignore then
					Library.Flags[cfg.flag] = Keybind.Value
					cfg.callback(Keybind.Value)
				end

				Library.Flags[string.format("%s_data", cfg.flag)] = {
					value = Keybind.Value,
					key = Keybind.Key,
					mode = Keybind.Mode
				}
			end

			function Keybind.Open(visibility)
				if Keybind.Tweening or Keybind.Visible == visibility then
					return
				end

				Keybind.Tweening = true

				Keybind.Visible = visibility

				if Keybind.Visible then
					Popup.Objects.inline.Visible = true
				end

				local ParentObjects = Popup.Objects.inline:GetDescendants()

				table.insert(ParentObjects, Popup.Objects.inline)

				local Tween;
				for _, obj in ParentObjects do
					local Index = Utility.GetTransparency(obj)
					if not Index then continue end

					if type(Index) == "table" then
						for _, prop in Index do
							Tween = Library.Fade(obj, prop, Keybind.Visible)
						end
					else
						Tween = Library.Fade(obj, Index, Keybind.Visible)
					end
				end

				Popup.Objects.inline.Position = UDim2.new(0, Objects.value.AbsolutePosition.X, 0, Objects.value.AbsolutePosition.Y + Objects.value.AbsoluteSize.Y + 2 + GuiService:GetGuiInset().Y)

				Utility.Signal(Tween.Completed:Connect(function()
					Keybind.Tweening = false

					Popup.Objects.inline.Visible = Keybind.Visible
				end))
			end

			function Keybind.State(state)
				if Objects.holder then Objects.holder.Visible = state end
				Objects.inline.Visible = state
				Keybind.Open(false)
			end

			Utility.Signal(Objects.value.MouseButton1Click:Connect(function(input)
				if Keybind.Listener then 
					Keybind.Listener:Disconnect( )
					Keybind.Listener = nil 

					return
				end

				Objects.value.Text = string.format("[%s]", "...")

				Library.ChangeObjectTheme(Objects.value, {
					TextColor3 = "text"
				}, true)

				task.wait( 1/50 )

				Keybind.Listener = Utility.Signal(UserInputService.InputBegan:Connect(function(input) 
					if input.KeyCode == Enum.KeyCode.Escape or input.KeyCode == Enum.KeyCode.Backspace then 
						Keybind.Set( Enum.KeyCode.Unknown )

						Library.ChangeObjectTheme(Objects.value, {
							TextColor3 = "dark text"
						}, true)

						Keybind.Listener:Disconnect( )
						Keybind.Listener = nil

						return
					end

					if input.UserInputType == Enum.UserInputType.Keyboard or table.find({ Enum.UserInputType.MouseButton1, Enum.UserInputType.MouseButton2, Enum.UserInputType.MouseButton3 }, input.UserInputType ) then 
						local Key = input.KeyCode ~= Enum.KeyCode.Unknown and input.KeyCode or input.UserInputType or Enum.KeyCode.Unknown

						Keybind.Set( Key )

						Library.ChangeObjectTheme(Objects.value, {
							TextColor3 = "dark text"
						}, true)

						Keybind.Listener:Disconnect( )
						Keybind.Listener = nil
					end
				end))
			end))

			Utility.Signal(Objects.value.MouseButton2Click:Connect(function(input)
				Keybind.Open(not Keybind.Visible)
			end))

			Utility.Signal(UserInputService.InputBegan:Connect(function(input) 
				if input.KeyCode == Keybind.Key or input.UserInputType == Keybind.Key then 
					local Value = Keybind.Mode ~= "Toggle" or not Keybind.Value
					Keybind.Set( Value )

					if Keybind.Mode == "Hold" then 
						if Keybind.OnHold then 
							Keybind.OnHold:Disconnect( ) 
						end

						Keybind.OnHold = Utility.Signal(UserInputService.InputEnded:Connect(function(input) 
							if input.KeyCode == Keybind.Key or input.UserInputType == Keybind.Key then 
								Keybind.Set( false )

								if Keybind.OnHold then 
									Keybind.OnHold:Disconnect( )
									Keybind.OnHold = nil
								end
							end
						end))
						-- elseif keybind.method == "single" then 
						--	 keybind.set( false )
					end
				end
			end))

			Utility.Signal(UserInputService.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 and Keybind.Visible and not Utility.MouseOver(Popup.Objects.inline, input) then
					Keybind.Open(false)
				end
			end))

			if Objects.line then
				Utility.Signal(Objects.line.MouseEnter:Connect(function(input)
					Library.ChangeObjectTheme(Objects.text, {
						TextColor3 = "text"
					}, true)
				end))

				Utility.Signal(Objects.line.MouseLeave:Connect(function(input)
					Library.ChangeObjectTheme(Objects.text, {
						TextColor3 = "dark text"
					}, true)
				end))
			end

			Keybind.Set({ cfg.key, cfg.mode, cfg.value }, true)
			-- Library.ConfigFlags[cfg.flag] = Keybind.Set
			Library.ConfigFlags[string.format("%s_data", cfg.flag)] = Keybind.Set

			table.insert(Library.Popups, Keybind)

			return setmetatable(Keybind, Library)
		end

        function Library.Watermark(self, cfg)
            cfg = cfg or { }; cfg = Library.Config(cfg, {
                text = "ping: {ping}ms | user: admin | {date}",
                titlestart = "swim",
                titleend = "bot",
                visible = true,
                rate = 1 / 20,
            })

            local Watermark = {
                Objects = {},
                Visible = cfg.visible,
                Rate = cfg.rate,
                Text = cfg.text,
                Clock = os.clock(),
            }

            local Objects = Watermark.Objects; do
                Objects.accent = Utility.New("Frame", {
                    Size = UDim2.new(0, 250, 0, 0),
                    Name = "accent",
                    Position = UDim2.new(0, 5, 0, 60),
                    BorderColor3 = Color3.fromRGB(0, 0, 0),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.XY,
                    BackgroundColor3 = Color3.fromRGB(220, 100, 100),
                    Parent = Library.NotificationHolder,
                }, { BackgroundColor3 = "accent" })

                Objects.background = Utility.New("Frame", {
                    Name = "background",
                    Position = UDim2.new(0, 1, 0, 1),
                    BorderColor3 = Color3.fromRGB(0, 0, 0),
                    Size = UDim2.new(1, -2, 1, -2),
                    BorderSizePixel = 0,
                    BackgroundColor3 = Color3.fromRGB(23, 25, 26),
                    Parent = Objects.accent,
                }, { BackgroundColor3 = "background" })

                Utility.New("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Parent = Objects.background,
                })

                Objects.topbar = Utility.New("Frame", {
                    Name = "topbar",
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, 0, 0, 0),
                    BorderColor3 = Color3.fromRGB(0, 0, 0),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.Y,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    Parent = Objects.background,
                })

                Objects.textholder = Utility.New("Frame", {
                    Name = "textholder",
                    BackgroundTransparency = 1,
                    Size = UDim2.new(0, 0, 1, 0),
                    BorderColor3 = Color3.fromRGB(0, 0, 0),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.XY,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    Parent = Objects.topbar,
                })

                Utility.New("UIPadding", {
                    PaddingBottom = UDim.new(0, 2),
                    PaddingTop = UDim.new(0, 4),
                    Parent = Objects.topbar,
                })

                Utility.New("UIPadding", {
                    PaddingRight = UDim.new(0, 6),
                    PaddingLeft = UDim.new(0, 6),
                    Parent = Objects.textholder,
                })

                Utility.New("UIListLayout", {
                    Padding = UDim.new(0, 1),
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    FillDirection = Enum.FillDirection.Horizontal,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Parent = Objects.textholder,
                })

                Objects.text = Utility.New("TextLabel", {
                    FontFace = Fonts.Get("TahomaXP"),
                    TextColor3 = Color3.fromRGB(230, 230, 230),
                    BorderColor3 = Color3.fromRGB(0, 0, 0),
                    Text = cfg.titlestart,
                    TextStrokeTransparency = 1,
                    BackgroundTransparency = 1,
                    Name = "text",
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.XY,
                    TextSize = 12,
                    BackgroundColor3 = Color3.fromRGB(25, 25, 25),
                    Parent = Objects.textholder,
                }, { TextColor3 = "text" })

                Utility.New("UIStroke", {
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual,
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    Color = Color3.new(0, 0, 0),
                    Thickness = 1,
                    Parent = Objects.text,
                })

                Objects.text2 = Utility.New("TextLabel", {
                    FontFace = Fonts.Get("TahomaXP"),
                    TextColor3 = Color3.fromRGB(220, 100, 100),
                    BorderColor3 = Color3.fromRGB(0, 0, 0),
                    Text = cfg.titleend,
                    TextStrokeTransparency = 1,
                    BackgroundTransparency = 1,
                    Name = "accent",
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.XY,
                    TextSize = 12,
                    BackgroundColor3 = Color3.fromRGB(25, 25, 25),
                    Parent = Objects.textholder,
                }, { TextColor3 = "accent" })

                Utility.New("UIStroke", {
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual,
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    Color = Color3.new(0, 0, 0),
                    Thickness = 1,
                    Parent = Objects.text2,
                })

                Objects.bottombar = Utility.New("Frame", {
                    Name = "bottombar",
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, 0, 0, 0),
                    BorderColor3 = Color3.fromRGB(0, 0, 0),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.XY,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    Parent = Objects.background,
                })

                Utility.New("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal,
                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Parent = Objects.bottombar,
                })

                Utility.New("UIPadding", {
                    PaddingTop = UDim.new(0, 4),
                    PaddingBottom = UDim.new(0, 8),
                    PaddingRight = UDim.new(0, 14),
                    PaddingLeft = UDim.new(0, 14),
                    Parent = Objects.bottombar,
                })

                Objects.bottomtext = Utility.New("TextLabel", {
                    FontFace = Fonts.Get("TahomaXP"),
                    TextColor3 = Color3.fromRGB(230, 230, 230),
                    BorderColor3 = Color3.fromRGB(0, 0, 0),
                    Text = "",
                    TextStrokeTransparency = 1,
                    BackgroundTransparency = 1,
                    Name = "text",
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.XY,
                    TextSize = 12,
                    BackgroundColor3 = Color3.fromRGB(25, 25, 25),
                    Parent = Objects.bottombar,
                }, { TextColor3 = "text" })

                Utility.New("UIStroke", {
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual,
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    Color = Color3.new(0, 0, 0),
                    Thickness = 1,
                    Parent = Objects.bottomtext,
                })
            end

            function Watermark.SetText(text)
                Watermark.Text = text
            end

            function Watermark.SetVisible(visibility)
                Objects.accent.Visible = visibility
                Watermark.Visible = visibility
            end

            function Watermark.SetRate(rate)
                Watermark.Rate = rate
            end

            local LastTime = 0
            local Frames = 0
            function Watermark.Think(step)
                Frames += 1
                if tick() - LastTime >= 1 then
                    Library.Fps = Frames
                    LastTime = tick()
                    Frames = 0
                end

                if Watermark.Visible and os.clock() - Watermark.Clock >= Watermark.Rate then
                    Watermark.Clock = os.clock()
                    Objects.bottomtext.Text = Utility.TextTriggers(Watermark.Text)
                end
            end

            Utility.Signal(RunService.RenderStepped:Connect(Watermark.Think))

            return Watermark
        end

		function Library.Notification(text, time)
			local Notification = {
				Objects = { },
			}

			local Objects = Notification.Objects; do
				Objects.holder = Utility.New("Frame", {
					Name = "holder",
					BackgroundTransparency = 1,
					Position = UDim2.new(0, 0, 0, 70),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					AutomaticSize = Enum.AutomaticSize.XY,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					Parent = Library.NotificationHolder,
				})

				Objects.background = Utility.New("Frame", {
					BackgroundTransparency = 0.5,
					Name = "background",
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					AutomaticSize = Enum.AutomaticSize.XY,
					BackgroundColor3 = Color3.fromRGB(23, 25, 26),
					Position = UDim2.new(-1, 0, 0, 0),
					Parent = Objects.holder,
				}, { BackgroundColor3 = "background" })

				Objects.text = Utility.New("TextLabel", {
					FontFace = Fonts.Get("TahomaXP"),
					TextColor3 = Color3.fromRGB(230, 230, 230),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Text = text,
					RichText = true,
					TextStrokeTransparency = 0,
					Name = "text",
					BackgroundTransparency = 1,
					Position = UDim2.new(0, 4, 0, 0),
					BorderSizePixel = 0,
					AutomaticSize = Enum.AutomaticSize.XY,
					TextSize = 12,
					BackgroundColor3 = Color3.fromRGB(25, 25, 25),
					Parent = Objects.background,
				}, { TextColor3 = "text" })

				Utility.New("UIPadding", {
					PaddingBottom = UDim.new(0, 8),
					PaddingTop = UDim.new(0, 6),
					PaddingRight = UDim.new(0, 6),
					Parent = Objects.text,
				})

				Objects.accent = Utility.New("Frame", {
					Name = "accent",
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					Size = UDim2.new(0, 2, 1, 0),
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.fromRGB(220, 100, 100),
					Parent = Objects.background,
				}, { BackgroundColor3 = "accent" })	
			end

			task.spawn(function()
				Library.Tween(Objects.background, {
					Position = UDim2.new(0, 0, 0, 0),
				})

				task.wait(time)

				Library.Tween(Objects.background, {
					Position = UDim2.new(-1, 0, 0, 0),
				})

				task.wait(Library.TweenSpeed)

				local Size = Objects.holder.AbsoluteSize

				Objects.holder.AutomaticSize = Enum.AutomaticSize.None

				Objects.background:Destroy()

				Objects.holder.Size = UDim2.new(0, Size.X, 0, Size.Y)

				Library.Tween(Objects.holder, {
					Size = UDim2.new(0, Size.X, 0, 0),
				})

				task.wait(Library.TweenSpeed)

				Notification.Objects.holder:Destroy()
			end)

			return Notification
		end

		Library.ColorpickerWindow = Library.ColorpickerWindow()

		--

		function Library.GetConfig()
			local Config = { }

			for flag, _ in Library.ConfigFlags do
				local Value = Library.Flags[flag]

				if type(Value) == "table" and type(Value.Get) == "function" then
					Value = Value.Get()
				end

				if type(Value) == "table" and Value["key"] then
					Config[flag] = { value = Value.value, mode = Value.mode, key = tostring(Value.key) }
				elseif type(Value) == "table" and Value["a"] and Value["c"] then
					Config[flag] = { a = Value.a, c = Value.c:ToHex() }
				else
					Config[flag] = Value
				end
			end

			return HttpService:JSONEncode(Config)
		end

		function Library.GetTheme()
			local Theme = { }

			for theme,v in Library.Theme do
				if typeof(v) == "Color3" then
					Theme[theme] = v:ToHex()
				end
			end

			return HttpService:JSONEncode(Theme)
		end

		function Library.GetThemeData(data)
			data = HttpService:JSONDecode(data)

			local RawData = {  }
			for theme,v in data do
				RawData[theme] = Color3.fromHex(v)
			end

			return RawData
		end

		function Library.LoadConfig(data)
			data = HttpService:JSONDecode(data)

			for i,v in data do
				local Config = Library.ConfigFlags[i]

				if Config then
					if type(v) == "table" and v["a"] and v["c"] then
						Config({
							a = v.a,
							c = type(v.c) == "string" and Color3.fromHex(v.c) or v.c
						})
					elseif type(v) == "table" and v["key"] then
						Config({
							value = v.value,
							mode = v.mode,
							key = Utility.StringToEnum(v.key)
						}, true)
					else
						Config(v)
					end
				end
			end
		end

		function Library.Unload()
			for _,obj in Utility.Connections do
				obj:Disconnect()
			end

			for _,obj in Utility.Objects do
				obj:Destroy()
			end

			Env.Library = nil
		end
	end;
	Env.Library = Library
	Env.Utility = Library.Utility
	return Library, Library.Utility
end)();

local InputService, Players, RunService, ReplicatedFirst, ReplicatedStorage, TweenService, Workspace, NetworkClient = cloneref(game:GetService("UserInputService")), cloneref(game:GetService("Players")), cloneref(game:GetService("RunService")), cloneref(game:GetService("ReplicatedFirst")), cloneref(game:GetService("ReplicatedStorage")), cloneref(game:GetService("TweenService")), cloneref(game:GetService("Workspace")), cloneref(game:GetService("NetworkClient"));
local CurrentCamera = Workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer;
local NewVector3, NewCFrame, NewVector2, GetChildren, GetDescendants, GetAttribute, SetAttribute = Vector3.new, CFrame.new, Vector2.new, Game.GetChildren, Game.GetDescendants, Game.GetAttribute, Game.SetAttribute;
local FindFirstChildOfClass, FindFirstChild, WaitForChild = Game.FindFirstChildOfClass, Game.FindFirstChild, Game.WaitForChild;
local TableFind, TableInsert, TableUnpack = table.find, table.insert, table.unpack;
local MathAbs, MathAcos, MathAsin, MathAtan, MathCeil, MathClamp, MathCos, MathCosh, MathDeg, MathExp, MathFloor, MathFmod, MathFrexp, MathHuge, MathLdexp, MathLog, MathLog10, MathMax, MathMin, MathModf, MathNoise, MathPi, MathPow, MathRad, MathRandom, MathRandomSeed, MathRound, MathSign, MathSin, MathSinh, MathSqrt, MathTan, MathTanh, MathTointeger, MathType = math.abs, math.acos, math.asin, math.atan, math.ceil, math.clamp, math.cos, math.cosh, math.deg, math.exp, math.floor, math.fmod, math.frexp, math.huge, math.ldexp, math.log, math.log10, math.max, math.min, math.modf, math.noise, math.pi, math.pow, math.rad, math.random, math.randomseed, math.round, math.sign, math.sin, math.sinh, math.sqrt, math.tan, math.tanh, math.tointeger, math.type
local EmptyVector2 = NewVector2(0, 0);

local RunOnAnotherThread = function(Function, ...)
    task.spawn(function(...)
        local Thread = coroutine.create(Function);
        coroutine.resume(Thread, ...);
    end, ...);
end
local RunOnFixedThread = function(Identity, Function, ...)
	local Old = Function; Function = function(...)
		setthreadidentity(Identity)
		return Old(...)
	end;

    task.spawn(function(...)
        local Thread = coroutine.create(Function)
        coroutine.resume(Thread, ...)
    end, ...)
end

local Modules = LPH_JIT(function()
	local Modules = { ["ReplicatedFirst"] = {}, ["ReplicatedStorage"] = {} };
	for Index, Module in getloadedmodules() do
		if Module and Module:IsDescendantOf(ReplicatedFirst) then
			local IsOkay, Returned = pcall(require, Module);
			if IsOkay then
				Modules["ReplicatedFirst"][Module.Name] = Returned;
			end
		elseif Module:IsDescendantOf(ReplicatedStorage) then
			local IsOkay, Returned = pcall(require, Module);
			if IsOkay then
				Modules["ReplicatedStorage"][Module.Name] = Returned;
			end
		end
	end
	return Modules;
end)()

local Constants = LPH_JIT(function()
	local Constants = { 
		["Knives"] = { ["Keys"] = {}; }, 
		["Gloves"] = { ["Keys"] = {} },
		["Guns"]   = { ["Keys"] = {} },
		["Skins"] = {},
	};

	local WeaponFolder = ReplicatedStorage.Weapons;
	local SkinFolder   = ReplicatedStorage.Skins;
	local GlovesFolder = ReplicatedStorage.Gloves;

	do -- Knives, Guns
		for Index, Value in GetChildren(WeaponFolder) do
			local WeaponType = GetAttribute(Value, "WeaponType");
			if Value and WeaponType ~= nil and WeaponType == "Melee" then
				Constants["Knives"][Value.Name] = Value; -- Constants["Knives"][KEY] = FOLDER;
				TableInsert(Constants["Knives"]["Keys"], Value.Name);
			end
			if Value and WeaponType ~= nil and WeaponType == "Sniper" or WeaponType == "Automatic" or WeaponType == "Pistol" or WeaponType == "SMG" then
				Constants["Guns"][Value.Name] = Value; -- Constants["Knives"][KEY] = FOLDER;
				TableInsert(Constants["Guns"]["Keys"], Value.Name);
			end
		end
	end

	do -- Skins
		for Index, Value in GetChildren(SkinFolder) do
			local SkinTable = {};
			Constants["Skins"][Value.Name] = SkinTable;
			for _, Skin in GetChildren(Value) do
				TableInsert(SkinTable, Skin.Name);
			end
		end
	end

	do -- Gloves
		for Index, Value in GetChildren(GlovesFolder) do
			if Value then
				Constants["Gloves"][Value.Name] = Value;
				TableInsert(Constants["Gloves"]["Keys"], Value.Name);
			end
		end
	end

	return Constants;
end)()

local Cache = LPH_JIT(function() -- it'll look confusing as hell :skull:
	local Cache = { ["_"] = {} }; do
		Cache.Get = function(_Name)
			if Cache["_"][_Name] then
				return Cache["_"][_Name];
			end
			return nil;
		end
		Cache.Add = function(_Name, _Value)
			print(_Name, _Value);
			Cache["_"][_Name] = _Value;
		end
	end
	return Cache;
end)()

local Cheat = {
	["PicturesOnKill"] = LPH_JIT(function()
		local PicturesOnKill = {
			URL = "https://raw.githubusercontent.com/mental1illness/swimhub_assets/refs/heads/main/base64/Picturesonkill/",

			Names = {
				"felix",
				"gn_rikka",
				"nekoparaithink",
				"rem"
			},

			Data = {},
			ScreenGui = Instance.new("ScreenGui")
		}
		do
			local CurrentImageIndex = 1
			local MaxImageIndex = 0

			function PicturesOnKill.Load(ImageName)
				if RunService:IsStudio() then return end

				local FilePath = string.format("%s%s.png", PicturesOnKillFolder, ImageName)

				if not isfile(FilePath) then
					local Success, RawData = pcall(function()
						return game:HttpGet(string.format("%s%s.txt", PicturesOnKill.URL, ImageName))
					end)

					if not Success or not RawData then return end

					writefile(FilePath, base64_decode(RawData))
				end

				MaxImageIndex += 1
				PicturesOnKill.Data[MaxImageIndex] = getcustomasset(FilePath)
			end

			function PicturesOnKill.Get(ImageName)
				return PicturesOnKill.Data[ImageName]
			end

			function PicturesOnKill.GetNextPicture()
				if MaxImageIndex < 1 then return end

				local CurrentImage = PicturesOnKill.Data[CurrentImageIndex]

				CurrentImageIndex += 1

				if CurrentImageIndex > MaxImageIndex then
					CurrentImageIndex = 1
				end

				return CurrentImage
			end

			function PicturesOnKill.Reload()
				table.clear(PicturesOnKill.Data)
				CurrentImageIndex = 1
				MaxImageIndex = 0

				for Index, ImageName in PicturesOnKill.Names do
					PicturesOnKill.Load(ImageName)
				end
			end

			function PicturesOnKill.Display()
				--[[
					do
						local PictureOnKill, PictureOnKillNoBg, PictureDuration, FadeDuration = false, false, 0.05, 0.5
						EffsecRef:Toggle({Name = "Picture on kill", Value = false, Flag = "picture_on_kill", Callback = function(Bool)
						end})
						EffsecRef:Slider({Name = "Picture duration", Min = 0, Max = 10, Float = 0.1, Value = 0.05, Flag = "picture_on_kill_duration", Suffix = "%ss", Callback = function(Int)
						end})
						EffsecRef:Slider({Name = "Picture fade duration", Min = 0, Max = 10, Float = 0.1, Value = 5, Flag = "picture_on_kill_fade_duration", Suffix = "%ss", Callback = function(Int)
						end})
					end
				]]

				local ImageLabel = Instance.new("ImageLabel")
				ImageLabel.Image = PicturesOnKill.GetNextPicture()
				ImageLabel.Size = UDim2.new(1, 0, 1, 0)
				ImageLabel.Position = UDim2.new(0, 0, 0, 0)
				ImageLabel.BackgroundTransparency = 1
				ImageLabel.ImageTransparency = 0
				ImageLabel.Parent = PicturesOnKill.ScreenGui -- fuck

				task.wait(Library.Flags["picture_on_kill_duration"])

				local Connection; Connection = RunService.RenderStepped:Connect(function(DeltaTime)
					if ImageLabel.ImageTransparency < 1 then
						ImageLabel.ImageTransparency += DeltaTime * (1 / Library.Flags["picture_on_kill_fade_duration"])
					else
						Connection:Disconnect()
						ImageLabel:Destroy()
					end
				end)
			end

			PicturesOnKill.Reload()
			PicturesOnKill.ScreenGui.Parent = gethui()
			PicturesOnKill.ScreenGui.Name = "/0"
			PicturesOnKill.ScreenGui.IgnoreGuiInset = true
			PicturesOnKill.ScreenGui.ResetOnSpawn = false
		end

		return PicturesOnKill
	end)(),
	["Visuals"] = {
		["CreateBeam"] = function(Origin, Position, Color)
			local Part1 = Instance.new("Part")
			Part1.CFrame = NewCFrame(Origin)
			Part1.Transparency = 1
			Part1.CanCollide = false
			Part1.Size = Vector3.zero
			Part1.Anchored = true
			Part1.Parent = Workspace.CurrentCamera
			
			local Part2 = Instance.new("Part")
			Part2.CFrame = NewCFrame(Position)
			Part2.Transparency = 1
			Part2.CanCollide = false
			Part2.Size = Vector3.zero
			Part2.Anchored = true
			Part2.Parent = Workspace.CurrentCamera
			
			local OriginAttachment = Instance.new("Attachment", Part1)
			local PositionAttachment = Instance.new("Attachment", Part2)
			
			local Beam = Instance.new("Beam")
			Beam.Color = ColorSequence.new{
				ColorSequenceKeypoint.new(0, Color),
				ColorSequenceKeypoint.new(1, Color)
			}
			Beam.LightEmission = 1
			Beam.LightInfluence = 0
			Beam.Transparency = NumberSequence.new(0)
			Beam.Attachment0 = OriginAttachment
			Beam.Attachment1 = PositionAttachment
			Beam.FaceCamera = true
			Beam.Texture = "http://www.roblox.com/asset/?id=446111271"
			Beam.Segments = 1
			Beam.Width0 = 0.2
			Beam.Width1 = 0.2
			Beam.Parent = Workspace.CurrentCamera
			
			local StartTick = tick()
			local Speed = 150
			local FadeTime = 0.5
			
			local Connection; Connection = RunService.RenderStepped:Connect(function()
				local TimePassed = tick() - StartTick
				local Distance = (Position - Origin).Magnitude
				local TravelTime = Distance / Speed
				
				if TimePassed < TravelTime then
					local Progress = TimePassed / TravelTime
					local CurrentPos = Origin + (Position - Origin) * Progress
					Part2.CFrame = NewCFrame(CurrentPos)
				else
					local FadeProgress = (TimePassed - TravelTime) / FadeTime
					if FadeProgress >= 1 then
						Connection:Disconnect()
						Beam:Destroy()
						OriginAttachment:Destroy()
						PositionAttachment:Destroy()
						Part1:Destroy()
						Part2:Destroy()
						return
					end
					Beam.Transparency = NumberSequence.new(FadeProgress)
				end
			end)
		end
	};


	["AntiAim"] = {
		["UpdatePitch"] = function(Pitch)
			Modules["ReplicatedFirst"].Network.FireServer("0R5lsPxqfSH3", (Pitch or 0), 0); -- Second argument is yaw but it is unused.
		end,
		["PitchAnimations"] = {
			["Random"] = function()
				return (MathRandom() * (MathRandom(2) == 2 and -1 or 1)) * 2
			end,
			["Bob"] = function()
				return MathSin(tick() * 10) * 2
			end,
			["Roll forward"] = function()
				return 2 * MathSin(((((2 * MathPi / 2) / MathPi)) * MathAtan(1/MathTan((MathPi * 1.24 * tick()/1)))))
			end,
			["Roll backward"] = function()
				return 2 * MathSin(((((2 * MathPi / 2) / MathPi)) * MathAtan(1/MathTan((MathPi * 1.24 * tick()/1)))))
			end,
			["Shaky"] = function()
				local speed = 2
				return MathSin(MathSin(MathSin(MathSin(tick() * MathPi * speed * 4) + tick() * MathPi * speed * 2) + tick() * MathPi * speed) * 2) * 2
			end,
			["YawAnimations"] = {

			}
		};
		["PitchValue"] = 0;
	};

	["GetFlashPart"] = function()
		local Viewmodel = FindFirstChild(CurrentCamera, "Arms");
		if Viewmodel then
			local Flash = FindFirstChild(Viewmodel, "Flash");
			if Flash then
				return Flash;
			end
		end
		return nil;
	end,
}

local SkinListShit = {};

-- Cheat["PicturesOnKilll"].Display
local Events = ReplicatedStorage.Events;
local Remotes = {
	["HitPart"] = Events["\224\182\189\224\183\128\224\182\158\224\182\169"];
} do 
	(function()
		for Index, Value in GetDescendants(Events) do
			if Value and Value:IsA("RemoteEvent") and Value ~= Remotes["HitPart"] then
				Remotes[Value.Name] = Value;
			end
		end
	end)()
end

local UI = {
	Window = Library:Window({
		NameStart = "hebrew",
		NameEnd = "hack"
	})
}

UI.Tabs = {
	Combat  = UI.Window:Tab({ Name = "Combat",   Image = Images.Get("combat")  }),
	Visuals = UI.Window:Tab({ Name = "Visuals",  Image = Images.Get("visuals") }),
	Misc    = UI.Window:Tab({ Name = "Misc",     Image = Images.Get("misc")    }),
	Settings = UI.Window:Tab({ Name = "Settings", Image = Images.Get("config") })
}

UI.SubTabs = {
	CombatAimbot   = UI.Tabs.Combat:SubTab({ Name = "Aimbot"    }),
	CombatMisc     = UI.Tabs.Combat:SubTab({ Name = "Misc"      }),

	VisualsESP     = UI.Tabs.Visuals:SubTab({ Name = "Player ESP" }),
	VisualsESPMisc = UI.Tabs.Visuals:SubTab({ Name = "Misc ESP"   }),
	VisualsLighting = UI.Tabs.Visuals:SubTab({ Name = "Lighting"  }),
	VisualsMisc    = UI.Tabs.Visuals:SubTab({ Name = "Misc"       }),

	MiscMain       = UI.Tabs.Misc:SubTab({ Name = "Main"      }),
	MiscAntiAim    = UI.Tabs.Misc:SubTab({ Name = "Anti-aim"  }),
	MiscExploit    = UI.Tabs.Misc:SubTab({ Name = "Exploits"  }),

	SettingsMain   = UI.Tabs.Settings:SubTab({ Name = "Main"    }),
	SettingsTheme  = UI.Tabs.Settings:SubTab({ Name = "Themeing" })
}

UI.Sections = {
	-- Combat
	AimbotMain    = UI.SubTabs.CombatAimbot:Section({ Name = "Aimbot",       Side = "Left"  }),
	AimbotMisc    = UI.SubTabs.CombatAimbot:Section({ Name = "Misc",         Side = "Right" }),
	-- AimbotSilent = UI.SubTabs.CombatAimbot:Section({ Name = "Silent",      Side = "Right" }),
	AimbotEffects = UI.SubTabs.CombatMisc:Section({   Name = "Effects/Logs", Side = "Left"  }),
	GunMods       = UI.SubTabs.CombatMisc:Section({   Name = "Gun mods",     Side = "Right" }),

	-- Visuals
	PlayerESP       = UI.SubTabs.VisualsESP:Section({      Name = "Players",  Side = "Left"  }),
	ESPSettings     = UI.SubTabs.VisualsESP:Section({      Name = "Settings", Side = "Right" }),
	ItemESP         = UI.SubTabs.VisualsESPMisc:Section({  Name = "Items",    Side = "Left"  }),
	OtherESP        = UI.SubTabs.VisualsESPMisc:Section({  Name = "Other",    Side = "Right" }),
	WorldLighting   = UI.SubTabs.VisualsLighting:Section({ Name = "Lighting", Side = "Left"  }),
	WorldMisc       = UI.SubTabs.VisualsLighting:Section({ Name = "Misc",     Side = "Right" }),
	VisualsView     = UI.SubTabs.VisualsMisc:Section({     Name = "View",     Side = "Left"  }),
	VisualsLocal    = UI.SubTabs.VisualsMisc:Section({     Name = "Local",    Side = "Right" }),

	-- Misc
	Movement           = UI.SubTabs.MiscMain:Section({    Name = "Movement",       Side = "Left"  }),
	Misc               = UI.SubTabs.MiscMain:Section({    Name = "Misc",           Side = "Right" }),
	AntiAim            = UI.SubTabs.MiscAntiAim:Section({ Name = "Antiaim",        Side = "Left"  }),
	AntiAimAnimations  = UI.SubTabs.MiscAntiAim:Section({ Name = "Animation",      Side = "Right" }),
	CustomDesync       = UI.SubTabs.MiscExploit:Section({ Name = "Custom desync",  Side = "Left"  }),
	Exploit            = UI.SubTabs.MiscExploit:Section({ Name = "Exploit",        Side = "Right" }),

	-- Settings
	SettingsConfig        = UI.SubTabs.SettingsMain:Section({  Name = "Config",         Side = "Left"  }),
	SettingsPersonal      = UI.SubTabs.SettingsMain:Section({  Name = "Personalization", Side = "Right" }),
	ThemeConfig           = UI.SubTabs.SettingsTheme:Section({ Name = "Config",          Side = "Left"  }),
	ThemeColors           = UI.SubTabs.SettingsTheme:Section({ Name = "Colors",          Side = "Right" })
}

do
	UI.Tabs.Combat.Set(true)

	UI.SubTabs.CombatAimbot.Set(true)
	UI.SubTabs.VisualsESP.Set(true)
	UI.SubTabs.MiscMain.Set(true)
	UI.SubTabs.SettingsMain.Set(true)
end



do
	local AimsecRef = UI.Sections.AimbotMain
	local MscsecRef = UI.Sections.AimbotMisc
	local EffsecRef = UI.Sections.AimbotEffects
	local GunsecRef = UI.Sections.GunMods

	do

		local AimKeybind; AimKeybind = AimsecRef:Toggle({Name = "Enabled", Value = false, Flag = "aimbot_enable", Callback = function(Bool)
			AimbotEnabled = Bool
		end}):Keybind({Name = "Aimbot", Mode = "Hold", Key = Enum.KeyCode.E, Value = false, Flag = "aimbot_enabled_keybind", Callback = function(Bool)
			AimbotEnabledKey = AimbotEnabled and Bool
			AimKeybind.Set(AimbotEnabledKey, true)
		end})

		AimsecRef:Dropdown({Name = "Aim part", Values = {"Head", "UpperTorso"}, Value = "Head", Flag = "aimbot_hitpart", Multi = false, Callback = function(Str)

		end})
		AimsecRef:Dropdown({Name = "Aim mode", Values = {"Camera", "Mouse", "Silent"}, Value = "Camera", Flag = "aimbot_mode", Multi = false, Callback = function(Str)

		end})
		AimsecRef:Slider({Name = "Aim smoothness", Min = 0.01, Max = 1, Float = 0.01, Value = 0.7, Flag = "aimbot_smoothness", Suffix = "%sx", Callback = function(Int)
		end})

	end

	do
		MscsecRef:Dropdown({Name = "Checks", Values = {"Team check", "Dead check", "Distance check"}, Value = {}, Flag = "aimbot_checks", Multi = true, Callback = function(Tbl)
		end})
		MscsecRef:Slider({Name = "Max distance", Min = 0, Max = 2000, Float = 10, Value = 200, Flag = "aimbot_max_distance", Callback = function(Int)
			AimbotMaxDistance = Int * 3
		end})
		MscsecRef:Slider({Name = "Aim size", Min = 0, Max = 180, Float = 1, Value = 10, Flag = "aimbot_fov_size", Suffix = "%s\194\176", Callback = function(Int)
		end})
		MscsecRef:Toggle({Name = "Silent force-hit", Value = false, Flag = "silent_forcehit", Callback = function(Bool)
		end})

		local AutoShootKeybind; AutoShootKeybind = MscsecRef:Toggle({Name = "Silent auto-shoot", Value = false, Flag = "aimbot_autoshoot", Callback = function(Bool)
		end}):Keybind({Name = "Auto-shoot", Mode = "Toggle", Key = Enum.KeyCode.G, Value = false, Flag = "aimbot_autoshoot_keybind", Callback = function(Bool)
		end})
		MscsecRef:Toggle({Name = "Auto-wall penetration", Value = false, Flag = "silent_autowall", Callback = function(Bool)
		end})
		MscsecRef:Dropdown({Name = "Auto-shoot hitscan", Values = {
			"Head","Torso","Arms","Legs"
		}, Value = {"Head"}, Flag = "aimbot_autoshoot_hitscan", Multi = true, Callback = function(Tbl)
			HitscanHitboxes = {}
			for _, Chosen in Tbl do
				table.insert(HitscanHitboxes, Chosen)
			end
		end})
	end

	do
		local BulletTracers, BulletTracersColor = false, Color3.new(1,1,1)

		EffsecRef:Toggle({Name = "Aimbot FOV", Value = false, Flag = "fov_enabled", Callback = function(Bool)
		end}):Colorpicker({Name = "FOV Color", Value = Color3.new(1,1,1), Usealpha = false, Flag = "fov_color", Callback = function(Color)

		end})
		EffsecRef:Toggle({Name = "FOV Outline", Value = false, Flag = "fov_outline", Callback = function(Bool)

		end})
		EffsecRef:Slider({Name = "FOV Sides", Min = 3, Max = 100, Float = 1, Value = 67, Flag = "fov_sides", Suffix = "%s", Callback = function(Int)

		end})
		EffsecRef:Toggle({Name = "Bullet tracers", Value = false, Flag = "bullet_tracers", Callback = function(Bool)

		end}):Colorpicker({Name = "Tracer color", Value = Color3.new(1,1,1), Usealpha = false, Flag = "bullet_tracers_color", Callback = function(Color)

		end})
		EffsecRef:Toggle({Name = "Hit sound", Value = false, Flag = "hit_sound", Callback = function(Bool)

		end})
		EffsecRef:Slider({Name = "Hit sound volume", Min = 0.1, Max = 10, Float = 0.1, Value = 1, Flag = "hit_sound_volume", Suffix = "%s", Callback = function(Int)

		end})
		EffsecRef:Slider({Name = "Hit sound speed", Min = 0.1, Max = 3, Float = 0.1, Value = 1, Flag = "hit_sound_speed", Suffix = "%s", Callback = function(Int)
		end})
		EffsecRef:Toggle({Name = "Hit logs", Value = false, Flag = "hit_logs", Callback = function(Bool)
		end})
		EffsecRef:Slider({Name = "Log duration", Min = 0, Max = 10, Float = 0.1, Value = 5, Flag = "hit_logs_duration", Suffix = "%ss", Callback = function(Int)

		end})

		do
			local PictureOnKill, PictureOnKillNoBg, PictureDuration, FadeDuration = false, false, 0.05, 0.5
			EffsecRef:Toggle({Name = "Picture on kill", Value = false, Flag = "picture_on_kill", Callback = function(Bool)
			end})
			EffsecRef:Slider({Name = "Picture duration", Min = 0, Max = 10, Float = 0.1, Value = 0.05, Flag = "picture_on_kill_duration", Suffix = "%ss", Callback = function(Int)
			end})
			EffsecRef:Slider({Name = "Picture fade duration", Min = 0, Max = 10, Float = 0.1, Value = 5, Flag = "picture_on_kill_fade_duration", Suffix = "%ss", Callback = function(Int)
			end})
		end
	end

	do
		GunsecRef:Dropdown({Name = "Removals", Values = {"Recoil","Bobbing","Sway","Jumping/Landing"}, Value = {}, Flag = "gunmods_removals", Multi = true, Callback = function(Tbl)
		end})
		GunsecRef:Toggle({Name = "Infinite ammo", Value = false, Flag = "gunmods_inf_ammo", Callback = function(Bool)
		end})
		GunsecRef:Toggle({Name = "Instant equip", Value = false, Flag = "gunmods_instant_equip", Callback = function(Bool)
		end})
		--[[GunsecRef:Toggle({Name = "Instant aim", Value = false, Flag = "gunmods_instant_aim", Callback = function(Bool)
		end})]]
		GunsecRef:Toggle({Name = "Force auto", Value = false, Flag = "gunmods_force_auto", Callback = function(Bool)
		end})
		GunsecRef:Toggle({Name = "Force no spread", Value = false, Flag = "gunmods_force_ns", Callback = function(Bool)
		end})
		GunsecRef:Toggle({Name = "Force rare inspect", Value = false, Flag = "gunmods_force_rareins", Callback = function(Bool)
		end})
		GunsecRef:Toggle({Name = "Always headshot", Value = false, Flag = "gunmods_force_hs", Callback = function(Bool)
		end})
		GunsecRef:Toggle({Name = "Rapid fire", Value = false, Flag = "gunmods_rapid_fire", Callback = function(Bool)
		end})
		GunsecRef:Slider({Name = "Rounds per second", Min = 10, Max = 100, Float = 1, Value = 60, Flag = "gunmods_rapid_fire_speed", Suffix = "1s/%s", Callback = function(Int)
		end})
	end
end

do
	local EspsecRef  = UI.Sections.PlayerESP
	local SetsecRef  = UI.Sections.ESPSettings
	local ItmsecRef  = UI.Sections.ItemESP
	local OthsecRef  = UI.Sections.OtherESP
	local MscsecRef  = UI.Sections.VisualsView
	local LclsecRef  = UI.Sections.VisualsLocal

	do
		EspsecRef:Toggle({Name = "Enabled", Value = false, Flag = "esp_enabled", Callback = function(Bool)
		end})
		do
			local BoxToggle = EspsecRef:Toggle({Name = "Box", Value = false, Flag = "esp_box", Callback = function(Bool)
			end})
			BoxToggle:Colorpicker({Name = "Box color left", Value = Color3.new(1,1,1), Usealpha = true, Flag = "esp_box_color_left", Callback = function(Color)
			end})
			BoxToggle:Colorpicker({Name = "Box color right", Value = Color3.new(1,1,1), Usealpha = false, Flag = "esp_box_color_right", Callback = function(Color)
			end})
			EspsecRef:Slider({Name = "Box rotation", Min = 0, Max = 20, Float = 0.1, Value = 0, Flag = "esp_box_rotation", Callback = function(Int)
			end})
			local OutlineToggle = EspsecRef:Toggle({Name = "Box outline", Value = false, Flag = "esp_box_outline", Callback = function(Bool)
			end})
			OutlineToggle:Colorpicker({Name = "Outline color left", Value = Color3.new(), Usealpha = true, Flag = "esp_box_outline_color_left", Callback = function(Color)
			end})
			OutlineToggle:Colorpicker({Name = "Outline color right", Value = Color3.new(), Usealpha = true, Flag = "esp_box_outline_color_right", Callback = function(Color)
			end})
		end
		do
			local HealthToggle = EspsecRef:Toggle({Name = "Health bar", Value = false, Flag = "esp_health_bar", Callback = function(Bool)
			end})
			HealthToggle:Colorpicker({Name = "Bar color top", Value = Color3.new(1,1,1), Usealpha = false, Flag = "esp_health_bar_color_top", Callback = function(Color)
			end})
			HealthToggle:Colorpicker({Name = "Bar color bottom", Value = Color3.new(1,1,1), Usealpha = false, Flag = "esp_health_bar_color_bottom", Callback = function(Color)
			end})
		end
		for _, Element in {
			{"Name", "name"}, {"Distance", "distance"}, {"Weapon", "weapon"},
			{"Health text", "health_text"}, {"Flags", "flags"}, {"Skeleton", "skeleton"}
		} do
			EspsecRef:Toggle({Name = Element[1], Value = false, Flag = "esp_" .. Element[2], Callback = function(Bool)
			end}):Colorpicker({Name = Element[1] .. " color", Value = Color3.new(1,1,1), Usealpha = true, Flag = "esp_" .. Element[2] .. "_color", Callback = function(Color)
			end})
		end
		EspsecRef:Slider({Name = "Skeleton update rate", Min = 0, Max = 1, Float = 0.01, Value = 0, Flag = "esp_skeleton_rate", Callback = function(Int)
		end})
		EspsecRef:Toggle({Name = "Chams", Value = false, Flag = "esp_chams", Callback = function(Bool)
		end})
		EspsecRef:Colorpicker({Name = "Chams color", Value = Color3.new(1,1,1), Usealpha = false, Flag = "esp_chams_color", Callback = function(Color)
		end})
		EspsecRef:Slider({Name = "Chams glow factor", Min = 0, Max = 100, Float = 0.1, Value = 3, Flag = "esp_chams_glow_factor", Callback = function(Int)
		end})
	end

	do
		SetsecRef:Dropdown({Name = "Flags", Values = {"Target","Team","Friend","Visor","Desynced","Visible","NPC","KD","Suspiciousness"}, Value = {}, Flag = "esp_selected_flags", Multi = true, Callback = function(Tbl)
		end})
		SetsecRef:Dropdown({Name = "Checks", Values = {"Team check","Dead check","Distance check"}, Value = {}, Flag = "esp_checks", Multi = true, Callback = function(Tbl)
		end})
		SetsecRef:Slider({Name = "Max distance", Min = 0, Max = 2000, Float = 10, Value = 200, Flag = "esp_max_distance", Callback = function(Int)
		end})
		SetsecRef:Toggle({Name = "Gradient spin", Value = false, Flag = "esp_gradient_spin", Callback = function(Bool)
		end})
		SetsecRef:Slider({Name = "Gradient speed", Min = -20, Max = 20, Float = 0.1, Value = 0, Flag = "esp_gradient_speed", Callback = function(Int)
		end})
		SetsecRef:Toggle({Name = "Holder spin", Value = false, Flag = "esp_holder_spin", Callback = function(Bool)
		end})
		SetsecRef:Slider({Name = "Holder speed", Min = -20, Max = 20, Float = 0.1, Value = 0, Flag = "esp_holder_speed", Callback = function(Int)
		end})
	end

	do
		ItmsecRef:Toggle({Name = "Item ESP", Value = false, Flag = "esp_item", Callback = function(Bool)
		end}):Colorpicker({Name = "Item color", Value = Color3.new(1,1,1), Usealpha = true, Flag = "esp_item_color", Callback = function(Color)
		end})
		ItmsecRef:Toggle({Name = "Show distance", Value = false, Flag = "esp_item_distance", Callback = function(Bool)
		end})
		ItmsecRef:Toggle({Name = "Show amount", Value = false, Flag = "esp_item_amount", Callback = function(Bool)
		end})
		ItmsecRef:Slider({Name = "Max distance (0 = inf)", Min = 0, Max = 200, Float = 1, Value = 10, Flag = "esp_item_max_distance", Callback = function(Int)
		end})
	end

	do
		local OldFov = game:GetService("Workspace").CurrentCamera.FieldOfView

		MscsecRef:Toggle({Name = "FOV Changer", Value = false, Flag = "view_fov_changer", Callback = function(Bool)
		end})
		MscsecRef:Slider({Name = "Desired FOV", Min = 50, Max = 120, Float = 1, Value = 100, Flag = "view_fov_changer_size", Callback = function(Int)
		end})
		local ZoomKeybind; ZoomKeybind = MscsecRef:Toggle({Name = "Zoom", Value = false, Flag = "view_zoom", Callback = function(Bool)
		end}):Keybind({Name = "Zoom", Mode = "Toggle", Key = Enum.KeyCode.Z, Value = false, Flag = "view_zoom_keybind", Callback = function(Bool)
		end})
		MscsecRef:Slider({Name = "Desired zoom", Min = 1, Max = 50, Float = 1, Value = 20, Flag = "view_zoom_size", Callback = function(Int)
		end})

		do
			MscsecRef:Toggle({Name = "Freecam", Value = false, Flag = "view_freecam", Callback = function(Bool)
			end}):Keybind({Name = "Freecam", Mode = "Toggle", Key = Enum.KeyCode.L, Value = false, Flag = "view_freecam_keybind", Callback = function(Bool)
			end})
			MscsecRef:Slider({Name = "Freecam speed", Min = 100, Max = 1000, Float = 10, Value = 750, Flag = "view_freecam_speed", Callback = function(Int)

			end})
		end


		MscsecRef:Toggle({Name = "Thirdperson", Value = false, Flag = "view_thirdperson", Callback = function(Bool)
		end}):Keybind({Name = "Thirdperson", Mode = "Toggle", Key = Enum.KeyCode.N, Value = false, Flag = "view_thirdperson_keybind", Callback = function(Bool)
		end})
		MscsecRef:Slider({Name = "Thirdperson distance", Min = 0, Max = 15, Float = 0.1, Value = 5, Flag = "view_thirdperson_distance", Callback = function(Int)
		end})

		MscsecRef:Toggle({Name = "Aspect ratio", Value = false, Flag = "view_aspect_ratio", Callback = function(Bool)
		end})
		MscsecRef:Slider({Name = "Aspect X", Min = 0.5, Max = 1.1, Float = 0.01, Value = 1, Flag = "aspect_ratio_x", Callback = function(Int)
		end})
		MscsecRef:Slider({Name = "Aspect Y", Min = 0.5, Max = 1.1, Float = 0.01, Value = 1, Flag = "aspect_ratio_y", Callback = function(Int)
		end})

		MscsecRef:Toggle({Name = "Avatar changer", Value = false, Flag = "view_avatar_changer", Callback = function(Bool)
		end})
		MscsecRef:Textbox({Name = "Avatar UserId", Value = "80254", Flag = "view_avatar_userid", Callback = function(Val)
		end})
	end

	do
		--[[do
			local OffColor, OnColor = Color3.new(1,0.1,0.1), Color3.new(0.1,1,0.1)
			local OffTransparency, OnTransparency = 0, 0
			local VisorToggle = LclsecRef:Toggle({Name = "Visor indicator", Value = false, Flag = "visor_indicator", Callback = function(Bool)
			end})
			VisorToggle:Colorpicker({Name = "Indicator Off Color", Value = Color3.new(1,0.3,0.3), Usealpha = true, Flag = "visor_indicator_off_color", Callback = function(Color)
				OffColor = Color.c; OffTransparency = Color.a
			end})
			VisorToggle:Colorpicker({Name = "Indicator On Color", Value = Color3.new(0.3,1,0.3), Usealpha = true, Flag = "visor_indicator_on_color", Callback = function(Color)
				OnColor = Color.c; OnTransparency = Color.a
			end})
		end

		LclsecRef:Dropdown({Name = "Indicator font", Values = {"Tahoma","TahomaXP","Comfortaa","Verdana","SmallestPixel7","Proggy"}, Value = "SmallestPixel7", Flag = "visor_indicator_font", Multi = false, Callback = function(Str)
		end})
		LclsecRef:Slider({Name = "Indicator size", Min = 1, Max = 30, Float = 1, Value = 9, Flag = "visor_indicator_size", Suffix = "%spx", Callback = function(Int)
		end})
		LclsecRef:Slider({Name = "Indicator X", Min = 0, Max = 100, Float = 1, Value = 5, Flag = "visor_indicator_x", Suffix = "%s%%", Callback = function(Int)
		end})
		LclsecRef:Slider({Name = "Indicator Y", Min = 0, Max = 100, Float = 1, Value = 5, Flag = "visor_indicator_y", Suffix = "%s%%", Callback = function(Int)
		end})]]

		--[[LclsecRef:Toggle({Name = "Remove screen effects", Value = false, Flag = "no_screen_effects", Callback = function(Bool)
		end})]]
		LclsecRef:Toggle({Name = "Gun changer", Value = false, Flag = "gun_changer", Callback = function(Bool)
		end})
		LclsecRef:Colorpicker({Name = "Gun color", Value = Color3.new(1,1,1), Usealpha = false, Flag = "gun_color", Callback = function(Color)
		end})
		LclsecRef:Dropdown({Name = "Gun material", Values = {"ForceField","Neon","SmoothPlastic","Glass"}, Value = "ForceField", Flag = "gun_material", Multi = false, Callback = function(Str)
		end})
		LclsecRef:Toggle({Name = "Arm changer", Value = false, Flag = "arm_changer", Callback = function(Bool)
		end})
		LclsecRef:Colorpicker({Name = "Arm color", Value = Color3.new(1,1,1), Usealpha = false, Flag = "arm_color", Callback = function(Color)
		end})
		LclsecRef:Dropdown({Name = "Arm material", Values = {"ForceField","Neon","SmoothPlastic","Glass"}, Value = "ForceField", Flag = "arm_material", Multi = false, Callback = function(Str)
		end})

		local KnifeSkinChangerDropdown, KnifeTypeChanger, GloveSkinChanger, GloveChanger, GunChanger, GunSkinChanger = nil, nil, nil, nil, nil, nil;
		Library.Data({ Flag = "in_game_changer_data", Value = SkinListShit });

		LclsecRef:Toggle({Name = "Knife changer", Value = false, Flag = "knife_changer", Callback = function(Bool)
		end})

		local LastKnife, LastGlove, LastGun = nil, nil, nil;

		KnifeTypeChanger = LclsecRef:Dropdown({Name = "Knife type changer", Values = Constants["Knives"]["Keys"], Value = "Karambit", Flag = "knifetype_changer", Multi = false, Callback = function(Str)
			local Skin = Constants["Skins"][Str];
			if KnifeSkinChangerDropdown ~= nil and Skin then

				LastKnife = Str;

				local AppliedSkin = nil;
				KnifeSkinChangerDropdown.Refresh(Skin);
				if SkinListShit[Str] then
					KnifeSkinChangerDropdown.Set(SkinListShit[Str])
				else
					KnifeSkinChangerDropdown.Set(Skin[1])
				end
			elseif not Skin then
				KnifeSkinChangerDropdown.Refresh({ "Stock" });
				KnifeSkinChangerDropdown.Set("Stock")
			end
		end})
		KnifeSkinChangerDropdown = LclsecRef:Dropdown({Name = "Knife skin changer", Values = Constants["Skins"]["Karambit"], Value = Constants["Skins"]["Karambit"][1], Flag = "knifeskin_changer", Multi = false, Callback = function(Str)
			if LastKnife then
				SkinListShit[LastKnife] = Str;
				Library.Flags.in_game_changer_data.Set(SkinListShit);
			end
		end})
		LclsecRef:Toggle({Name = "Glove changer", Value = false, Flag = "glove_changer", Callback = function(Bool)
		end})
		GloveChanger = LclsecRef:Dropdown({Name = "Gloves changer", Values = Constants["Gloves"]["Keys"], Value = "Strapped Gloves", Flag = "glovetype_changer", Multi = false, Callback = function(Str)
			local Skin = Constants["Skins"][Str];
			if GloveSkinChanger ~= nil and Skin then

				LastGlove = Str;

				local AppliedSkin = nil;
				GloveSkinChanger.Refresh(Skin);
				if SkinListShit[Str] then
					GloveSkinChanger.Set(SkinListShit[Str])
				else
					GloveSkinChanger.Set(Skin[1])
				end
			elseif not Skin then
				GloveSkinChanger.Refresh({ "Stock" });
				GloveSkinChanger.Set("Stock")
			end
		end})
		GloveSkinChanger = LclsecRef:Dropdown({Name = "Gloves skin changer", Values = Constants["Skins"]["Strapped Gloves"], Value = Constants["Skins"]["Strapped Gloves"][1], Flag = "gloveskin_changer", Multi = false, Callback = function(Str)
			if LastGlove then
				SkinListShit[LastGlove] = Str;
				Library.Flags.in_game_changer_data.Set(SkinListShit);
			end
		end})
		LclsecRef:Toggle({Name = "Gun skin changer", Value = false, Flag = "gunskin_changer", Callback = function(Bool)
		end})
		GunChanger = LclsecRef:Dropdown({Name = "Gun list", Values = Constants["Guns"]["Keys"], Value = Constants["Guns"]["Keys"][1], Flag = "gun_changer_list", Multi = false, Callback = function(Str)
			local Skin = Constants["Skins"][Str];
			if GunSkinChanger ~= nil and Skin then

				LastGun = Str;

				local AppliedSkin = nil;
				GunSkinChanger.Refresh(Skin);
				if SkinListShit[Str] then
					GunSkinChanger.Set(SkinListShit[Str])
				else
					GunSkinChanger.Set(Skin[1])
				end
			elseif not Skin then
				GunSkinChanger.Refresh({ "Stock" });
				GunSkinChanger.Set("Stock")
			end
		end})
		GunSkinChanger = LclsecRef:Dropdown({Name = "Gun skin changer", Values = Constants["Skins"][Constants["Guns"]["Keys"][1]], Value = Constants["Skins"][Constants["Guns"]["Keys"][1]][1], Flag = "gunskinlist_changer", Multi = false, Callback = function(Str)
			if LastGun then

				SkinListShit[LastGun] = Str;
				Library.Flags.in_game_changer_data.Set(SkinListShit);
			end
		end})
		--[[LclsecRef:Slider({Name = "Knife skin float", Min = 0.001, Max = 1, Float = 0.001, Value = 0.5, Flag = "knifeskin_float", Callback = function(Int)
		end})
		LclsecRef:Slider({Name = "Knife skin pattern", Min = 0.01, Max = 1, Float = 0.01, Value = 0.5, Flag = "knifeskin_pattern", Callback = function(Int)
		end})
		LclsecRef:Toggle({Name = "Knife stattrack", Value = false, Flag = "knife_stattrack", Callback = function(Bool)
		end})
		LclsecRef:Slider({Name = "Knife stattrack kill(s)", Min = 1, Max = 10000, Float = 1, Value = 1337, Flag = "knife_stattrack_kill", Callback = function(Int)
		end})]]

		LclsecRef:Toggle({Name = "Viewmodel changer", Value = false, Flag = "viewmodel_changer", Callback = function(Bool)
		end})
		LclsecRef:Slider({Name = "X offset", Min = -5, Max = 5, Float = 0.1, Value = 0, Flag = "viewmodel_x", Callback = function(Int)
			Cache.Add("ViewmodelOffsetX", Int)
		end})
		LclsecRef:Slider({Name = "Y offset", Min = -5, Max = 5, Float = 0.1, Value = 0, Flag = "viewmodel_y", Callback = function(Int)
			Cache.Add("ViewmodelOffsetY", Int)
		end})
		LclsecRef:Slider({Name = "Z offset", Min = -5, Max = 5, Float = 0.1, Value = 0, Flag = "viewmodel_z", Callback = function(Int)
			Cache.Add("ViewmodelOffsetZ", Int)
		end})
	end
end

do
	local WorldboxRef = UI.Sections.WorldLighting
	local MiscboxRef  = UI.Sections.WorldMisc

	do
		local LightingChanger, LightingChanging = false, false
		local Lighting = game:GetService("Lighting")
		local OldLighting = {
			Ambient = Lighting.Ambient, OutdoorAmbient = Lighting.OutdoorAmbient,
			Brightness = Lighting.Brightness, ColorShift_Bottom = Lighting.ColorShift_Bottom,
			ColorShift_Top = Lighting.ColorShift_Top, GlobalShadows = Lighting.GlobalShadows,
			FogColor = Lighting.FogColor, FogEnd = Lighting.FogEnd, FogStart = Lighting.FogStart,
			ClockTime = Lighting.ClockTime
		}
		local LightingValues = {
			Ambient = Color3.fromRGB(70,70,70), OutdoorAmbient = Color3.fromRGB(70,70,70),
			Brightness = 3, ColorShift_Bottom = Color3.new(), ColorShift_Top = Color3.new(),
			GlobalShadows = true, FogColor = Color3.fromRGB(192,192,192),
			FogEnd = 10000, FogStart = 0, ClockTime = 14.5
		}
		local AppendLightingChanges = function()
			LightingChanging = true
			for K, V in (LightingChanger and LightingValues or OldLighting) do
				Lighting[K] = V
			end
			LightingChanging = false
		end

		WorldboxRef:Toggle({Name = "Lighting changer", Flag = "world_lighting_changer", Value = false, Callback = function(Bool)
			LightingChanger = Bool; AppendLightingChanges()
		end})
		WorldboxRef:Colorpicker({Name = "Ambient", Flag = "world_lighting_ambient", Value = Color3.fromRGB(70,70,70), Usealpha = false, Callback = function(Value)
			LightingValues.Ambient = Value.c; AppendLightingChanges()
		end})
		WorldboxRef:Colorpicker({Name = "OutdoorAmbient", Flag = "world_lighting_outdoorambient", Value = Color3.fromRGB(70,70,70), Usealpha = false, Callback = function(Value)
			LightingValues.OutdoorAmbient = Value.c; AppendLightingChanges()
		end})
		WorldboxRef:Slider({Name = "Brightness", Flag = "world_lighting_brightness", Value = 1, Min = -5, Max = 15, Float = 0.01, Callback = function(State)
			LightingValues.Brightness = State; AppendLightingChanges()
		end})
		WorldboxRef:Colorpicker({Name = "ColorShift Bottom", Flag = "world_lighting_colorshift_bottom", Value = Color3.new(), Usealpha = false, Callback = function(Value)
			LightingValues.ColorShift_Bottom = Value.c; AppendLightingChanges()
		end})
		WorldboxRef:Colorpicker({Name = "ColorShift Top", Flag = "world_lighting_colorshift_top", Value = Color3.new(), Usealpha = false, Callback = function(Value)
			LightingValues.ColorShift_Top = Value.c; AppendLightingChanges()
		end})
		WorldboxRef:Toggle({Name = "GlobalShadows", Flag = "world_lighting_globalshadows", Value = true, Callback = function(Bool)
			LightingValues.GlobalShadows = Bool; AppendLightingChanges()
		end})
		WorldboxRef:Colorpicker({Name = "FogColor", Flag = "world_lighting_fogcolor", Value = Color3.fromRGB(192,192,192), Usealpha = false, Callback = function(Value)
			LightingValues.FogColor = Value.c; AppendLightingChanges()
		end})
		WorldboxRef:Slider({Name = "FogEnd", Flag = "world_lighting_fogend", Value = 100, Min = 0, Max = 10000, Float = 100, Callback = function(State)
			LightingValues.FogEnd = State; AppendLightingChanges()
		end})
		WorldboxRef:Slider({Name = "FogStart", Flag = "world_lighting_fogstart", Value = 0, Min = 0, Max = 10000, Float = 100, Callback = function(State)
			LightingValues.FogStart = State; AppendLightingChanges()
		end})
		WorldboxRef:Slider({Name = "ClockTime", Flag = "world_lighting_clocktime", Value = 14.5, Min = 0, Max = 24, Float = 0.1, Callback = function(State)
			LightingValues.ClockTime = State; AppendLightingChanges()
		end})

		for _, Method in {"Ambient","OutdoorAmbient","Brightness","ColorShift_Bottom","ColorShift_Top","GlobalShadows","FogColor","FogEnd","FogStart","ClockTime"} do
			Lighting:GetPropertyChangedSignal(Method):Connect(function()
				if not LightingChanging then OldLighting[Method] = Lighting[Method] end
				if not LightingChanger then return end
				Lighting[Method] = LightingValues[Method]
			end)
		end
	end

	do
		MiscboxRef:Toggle({Name = "No grass", Flag = "no_grass", Value = false, Callback = function(Bool)
			sethiddenproperty(game:GetService("Workspace").Terrain, "Decoration", not Bool)
		end})

		do
			local Lighting = game:GetService("Lighting")
			local Atmosphere = Lighting:FindFirstChildOfClass("Atmosphere") or Instance.new("Atmosphere", Lighting)
			local AtmosphereChanger, AtmosphereChanging = false, false
			local OldAtmosphere = {Density=Atmosphere.Density, Offset=Atmosphere.Offset, Color=Atmosphere.Color, Decay=Atmosphere.Decay, Glare=Atmosphere.Glare, Haze=Atmosphere.Haze}
			local AtmosphereValues = {Density=0.28, Offset=1, Color=Color3.new(1,1,1), Decay=Color3.new(0.8,0.8,0.8), Glare=1, Haze=1}
			local AppendAtmosphere = function()
				AtmosphereChanging = true
				for K, V in (AtmosphereChanger and AtmosphereValues or OldAtmosphere) do
					Atmosphere[K] = V
				end
				AtmosphereChanging = false
			end
			MiscboxRef:Toggle({Name = "Atmosphere changer", Flag = "world_atmosphere_changer", Value = false, Callback = function(Bool)
				AtmosphereChanger = Bool; AppendAtmosphere()
			end})
			MiscboxRef:Slider({Name = "Density", Flag = "world_atmosphere_density", Value = 0.9, Min = 0, Max = 1, Float = 0.01, Callback = function(State)
				AtmosphereValues.Density = State; AppendAtmosphere()
			end})
			MiscboxRef:Slider({Name = "Offset", Flag = "world_atmosphere_offset", Value = 1, Min = 0, Max = 1, Float = 0.01, Callback = function(State)
				AtmosphereValues.Offset = State; AppendAtmosphere()
			end})
			MiscboxRef:Colorpicker({Name = "Color", Flag = "world_atmosphere_color", Value = Color3.new(1,1,1), Usealpha = false, Callback = function(Value)
				AtmosphereValues.Color = Value.c; AppendAtmosphere()
			end})
			MiscboxRef:Colorpicker({Name = "Decay", Flag = "world_atmosphere_decay", Value = Color3.new(0.8,0.8,0.8), Usealpha = false, Callback = function(Value)
				AtmosphereValues.Decay = Value.c; AppendAtmosphere()
			end})
			MiscboxRef:Slider({Name = "Glare", Flag = "world_atmosphere_glare", Value = 1, Min = 0, Max = 20, Float = 0.1, Callback = function(State)
				AtmosphereValues.Glare = State; AppendAtmosphere()
			end})
			MiscboxRef:Slider({Name = "Haze", Flag = "world_atmosphere_haze", Value = 1, Min = 0, Max = 20, Float = 0.1, Callback = function(State)
				AtmosphereValues.Haze = State; AppendAtmosphere()
			end})
		end

		do
			local Lighting = game:GetService("Lighting")
			local Bloom = Lighting:FindFirstChildOfClass("BloomEffect") or Instance.new("BloomEffect", Lighting)
			local BloomChanger, BloomChanging = false, false
			local OldBloom = {Enabled=Bloom.Enabled, Intensity=Bloom.Intensity, Size=Bloom.Size, Threshold=Bloom.Threshold}
			local BloomValues = {Enabled=true, Intensity=1, Size=56, Threshold=2}
			local AppendBloom = function()
				BloomChanging = true
				for K, V in (BloomChanger and BloomValues or OldBloom) do
					Bloom[K] = V
				end
				BloomChanging = false
			end
			MiscboxRef:Toggle({Name = "Bloom changer", Flag = "world_bloom_changer", Value = false, Callback = function(Bool)
				BloomChanger = Bool; AppendBloom()
			end})
			MiscboxRef:Toggle({Name = "Enabled", Flag = "world_bloom_enabled", Value = false, Callback = function(Bool)
				BloomValues.Enabled = Bool; AppendBloom()
			end})
			MiscboxRef:Slider({Name = "Intensity", Flag = "world_bloom_intensity", Value = 1, Min = 0, Max = 5, Float = 0.01, Callback = function(State)
				BloomValues.Intensity = State; AppendBloom()
			end})
			MiscboxRef:Slider({Name = "Size", Flag = "world_bloom_size", Value = 56, Min = 0, Max = 80, Float = 1, Callback = function(State)
				BloomValues.Size = State; AppendBloom()
			end})
			MiscboxRef:Slider({Name = "Threshold", Flag = "world_bloom_threshold", Value = 2, Min = 0, Max = 10, Float = 0.1, Callback = function(State)
				BloomValues.Threshold = State; AppendBloom()
			end})
		end
	end
end

do
	local MoveboxRef  = UI.Sections.Movement
	local MiscboxRef  = UI.Sections.Misc
	local AntiboxRef  = UI.Sections.AntiAim
	local AnimboxRef  = UI.Sections.AntiAimAnimations

	do
		MiscboxRef:Button({Name = "Rejoin", Confirm = true, Callback = function()
			if #game:GetService("Players"):GetPlayers() <= 1 then
				game:GetService("Players").LocalPlayer:Kick("\nRejoining...")
				task.wait()
				game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
			else
				game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game:GetService("Players").LocalPlayer)
			end
		end})
		MiscboxRef:Toggle({Name = "Hide server info", Value = false, Flag = "hide_server_info", Callback = function(Bool)
		end})
	end

	do
		AntiboxRef:Toggle({Name = "Enabled", Value = false, Flag = "antiaim_enabled", Callback = function(Bool)
		end})
		AntiboxRef:Toggle({Name = "Pitch modifier", Value = false, Flag = "antiaim_pitch", Callback = function(Bool)
		end})
		AntiboxRef:Slider({Name = "Pitch value", Min = -1, Max = 1, Float = 0.05, Value = 0, Flag = "antiaim_pitch_value", Callback = function(Int)
		end})

		AntiboxRef:Dropdown({Name = "Pitch animation", Values = {"None", "Bob", "Shaky", "Random", "Roll forward", "Roll backward"}, Value = "None", Flag = "antiaim_pitch_anim", Multi = false, Callback = function(Str)
		end})

		AntiboxRef:Toggle({Name = "Yaw modifier", Value = false, Flag = "antiaim_yaw", Callback = function(Bool)
		end})
		AntiboxRef:Slider({Name = "Yaw value", Min = -180, Max = 180, Float = 5, Value = 0, Flag = "antiaim_yaw_value", Callback = function(Int)
		end})
		
		AntiboxRef:Dropdown({Name = "Yaw animation", Values = {"None", "Bob", "Shaky", "Random", "Roll forward", "Roll backward"}, Value = "None", Flag = "antiaim_yaw_anim", Multi = false, Callback = function(Str)
		end})
		
		AntiboxRef:Toggle({Name = "Yaw jitter", Value = false, Flag = "antiaim_jitter", Callback = function(Bool)
		end})
		AntiboxRef:Slider({Name = "Jitter strength", Min = 0, Max = 90, Float = 1, Value = 45, Flag = "antiaim_jitter_value", Callback = function(Int)
		end})
		AntiboxRef:Toggle({Name = "Yaw spin", Value = false, Flag = "antiaim_spin", Callback = function(Bool)
		end})
		AntiboxRef:Slider({Name = "Spin speed", Min = -10, Max = 10, Float = 0.1, Value = 0, Flag = "antiaim_spin_value", Callback = function(Int)
		end})
	end

	do
		UI.Sections["Exploit"]:Toggle({Name = "Freeze, (break) camera", Value = false, Flag = "anti_spectate", Callback = function(Bool)
		end})
		UI.Sections["Exploit"]:Toggle({Name = "Spin spectator's camera", Value = false, Flag = "spin_spec_cam", Callback = function(Bool)
		end})
		UI.Sections["Exploit"]:Slider({Name = "Spin speed", Min = 2, Max = 500, Float = 0.1, Value = 5, Flag = "spin_spec_cam_speed", Callback = function(Int)
		end})
		UI.Sections["Exploit"]:Button({Name = "Crash Server", Confirm = true, Callback = function() -- i still have no clue if this actually wroks im just adding for the sake of it LMFAO
			Library.Notification("Crashing the server.. (I didn't make this, credit to neyrone (xosmane)", 5);
			local BigString = "rbxassetid://"..string.rep("XOSMANEMADETHIS_IDIDNT_MAKE_IT                                              ",99000);
			ReplicatedStorage.Events.UpdateSetting:FireServer("Graphics", "Ragdolls", BigString)
			task.spawn(function()
				while true do
					task.spawn(function()
						for i = 1, 99999999 do
							NetworkClient:SetOutgoingKBPSLimit(math.huge * math.huge)
							ReplicatedStorage.Events.GetSettings:InvokeServer()
						end
					end)
					task.wait();
				end
			end)
		end})
	end

	do
		MoveboxRef:Toggle({Name = "No fall damage", Value = false, Flag = "no_fall_damage", Callback = function(Bool)
		end})
		MoveboxRef:Toggle({Name = "Speedhack", Value = false, Flag = "speedhack", Callback = function(Bool)
		end})
		MoveboxRef:Slider({Name = "Speedhack speed", Min = 1, Max = 24, Float = 0.1, Value = 18.2, Flag = "speedhack_speed", Callback = function(Int)
		end})
		MoveboxRef:Toggle({Name = "Jumphack", Value = false, Flag = "jumphack", Callback = function(Bool)
		end})
		MoveboxRef:Slider({Name = "Jumphack height", Min = 1, Max = 10, Float = 0.1, Value = 5, Flag = "jumphack_height", Callback = function(Int)
		end})
		MoveboxRef:Toggle({Name = "Flyhack", Value = false, Flag = "flyhack", Callback = function(Bool)
		end}):Keybind({Name = "Flyhack", Mode = "Toggle", Key = Enum.KeyCode.X, Value = false, Flag = "flyhack_key", Callback = function(Bool)
		end})
		MoveboxRef:Slider({Name = "Flyhack speed", Min = 0, Max = 50, Float = 1, Value = 25, Flag = "flyhack_speed", Callback = function(Int)
		end})
		MoveboxRef:Slider({Name = "Flyhack speed Y", Min = 0, Max = 50, Float = 1, Value = 25, Flag = "flyhack_speed_y", Callback = function(Int)
		end})

		MoveboxRef:Toggle({Name = "Auto jump", Value = false, Flag = "autojump", Callback = function(Bool)
		end})
		
	end
end
do -- Settings
	do -- Config
		local _, Files = Utility.GetFiles(ConfigFolder, { ".cfg" })
		local LastFiles = Files
		local ConfigName

		local ConfigList = UI.Sections.SettingsConfig:List({
			Values = Files,
			Value = Files[1] or "",
			Size = 135,
			Name = "",
			Flag = "settings_config_list",
			Search = true,
			Callback = function(v)
				if ConfigName and v then
					ConfigName.Set(v)
				end
			end
		})

		ConfigName = UI.Sections.SettingsConfig:Textbox({
			Name = "Name",
			Value = "",
			Flag = "settings_config_name"
		})

		UI.Sections.SettingsConfig:Button({
			Name = "Save",
			Confirm = true,
			Callback = function()
				local Name = Library.Flags["settings_config_name"]
				if Name and Name ~= "" then
					local Path = string.format("%s%s.cfg", ConfigFolder, Name)
					writefile(Path, Library:GetConfig())
					Library.Notification(
						string.format("Successfully %s config (%s.cfg).",
							isfile(Path) and "saved" or "created",
							Utility.RichText(Name, Library.Theme.accent)
						), 5
					)
					local _, F = Utility.GetFiles(ConfigFolder, { ".cfg" })
					ConfigList.Refresh(F)
					ConfigList.Set(Name)
				else
					Library.Notification(
						string.format("Invalid config name (%s).", Utility.RichText(tostring(Name), Library.Theme.accent)), 5
					)
				end
			end,
		})

		UI.Sections.SettingsConfig:Button({
			Name = "Load",
			Confirm = true,
			Callback = function()
				local Name = Library.Flags["settings_config_list"]
				if Name and Name ~= "" then
					local Path = string.format("%s%s.cfg", ConfigFolder, Name)
					if isfile(Path) then
						Library.LoadConfig(readfile(Path))
						Library.Notification(
							string.format("Successfully loaded config (%s.cfg).", Utility.RichText(Name, Library.Theme.accent)), 5
						)
					else
						Library.Notification(
							string.format("Couldn't find config (%s.cfg).", Utility.RichText(Name, Library.Theme.accent)), 5
						)
					end
				end
			end,
		})

		UI.Sections.SettingsConfig:Button({
			Name = "Delete",
			Confirm = true,
			Callback = function()
				local Name = Library.Flags["settings_config_list"]
				if Name and Name ~= "" then
					local Path = string.format("%s%s.cfg", ConfigFolder, Name)
					if isfile(Path) then
						delfile(Path)
						Library.Notification(
							string.format("Successfully deleted config (%s.cfg).", Utility.RichText(Name, Library.Theme.accent)), 5
						)
						local _, F = Utility.GetFiles(ConfigFolder, { ".cfg" })
						ConfigList.Refresh(F)
						ConfigList.Set(F[1] or "")
					end
				end
			end,
		})

		task.spawn(function()
			while task.wait(5) do
				if UI.Window.Visible then
					local _, F = Utility.GetFiles(ConfigFolder, { ".cfg" })
					if #F ~= #LastFiles then
						LastFiles = F
						ConfigList.Refresh(F)
						ConfigList.Set(F[1] or "")
					end
				end
			end
		end)
	end

	do -- Personalization
		local TweenTypes = {}
		for _, v in Enum.EasingStyle:GetEnumItems() do
			table.insert(TweenTypes, v.Name)
		end

		UI.Sections.SettingsPersonal:Keybind({
			Name = "Window Key",
			Ignore = true,
			Key = Enum.KeyCode.Delete,
			Flag = "menu_key",
			Callback = function()
				UI.Window.Open()
			end
		})

		local Watermark = Library:Watermark({
			titlestart = "neko",
			titleend = "para"
		})

		local WatermarkText
		UI.Sections.SettingsPersonal:Toggle({
			Name = "Watermark",
			Flag = "menu_watermark",
			Value = true,
			Callback = function(v)
				Watermark.SetVisible(v)
				if WatermarkText then
					WatermarkText.State(v)
				end
			end
		})

		WatermarkText = UI.Sections.SettingsPersonal:Textbox({
			Name = "Watermark Text",
			Value = "ping: {ping}ms | fps: {fps} | user: {user} | {date}",
			Flag = "menu_watermark_text",
			Callback = function(v)
				Watermark.SetText(v)
			end
		})

		UI.Sections.SettingsPersonal:Toggle({
			Name = "Keybind List",
			Flag = "menu_keybind_list",
			Value = true,
			Callback = function(v)
				Library.KeybindsList.Status(v)
			end
		})

		UI.Sections.SettingsPersonal:Slider({
			Name = "Animations",
			Min = 0,
			Max = 100,
			Value = 40,
			Flag = "menu_animation_speed",
			Callback = function(v)
				Library.TweenSpeed = v / 100
			end
		})

		UI.Sections.SettingsPersonal:Dropdown({
			Name = "",
			Values = TweenTypes,
			Value = "Exponential",
			Flag = "menu_animation_type",
			Callback = function(v)
				Library.TweenStyle = Enum.EasingStyle[v]
			end
		})
	end

	do -- Theme Config
		local ThemeColorpickers = {}

		local _, Files = Utility.GetFiles(ThemeFolder, { ".cfg" })
		local LastFiles = Files
		local ThemeName

		local ThemeList = UI.Sections.ThemeConfig:List({
			Values = Files,
			Value = Files[1] or "",
			Size = 135,
			Name = "",
			Flag = "settings_theme_list",
			Search = true,
			Callback = function(v)
				if ThemeName and v then
					ThemeName.Set(v)
				end
			end
		})

		ThemeName = UI.Sections.ThemeConfig:Textbox({
			Name = "Name",
			Value = "",
			Flag = "settings_theme_name"
		})

		UI.Sections.ThemeConfig:Button({
			Name = "Save",
			Confirm = true,
			Callback = function()
				local Name = Library.Flags["settings_theme_name"]
				if Name and Name ~= "" then
					local Path = string.format("%s%s.cfg", ThemeFolder, Name)
					writefile(Path, Library.GetTheme())
					Library.Notification(
						string.format("Successfully %s theme (%s.theme).",
							isfile(Path) and "saved" or "created",
							Utility.RichText(Name, Library.Theme.accent)
						), 5
					)
					local _, F = Utility.GetFiles(ThemeFolder, { ".cfg" })
					ThemeList.Refresh(F)
					ThemeList.Set(Name)
				else
					Library.Notification(
						string.format("Invalid theme name (%s).", Utility.RichText(tostring(Name), Library.Theme.accent)), 5
					)
				end
			end,
		})

		UI.Sections.ThemeConfig:Button({
			Name = "Load",
			Confirm = true,
			Callback = function()
				local Name = Library.Flags["settings_theme_list"]
				if Name and Name ~= "" then
					local Path = string.format("%s%s.cfg", ThemeFolder, Name)
					if isfile(Path) then
						local Data = Library.GetThemeData(readfile(Path))
						for theme, v in Data do
							if ThemeColorpickers[theme] then
								ThemeColorpickers[theme].Set({ c = v, a = 0 })
							end
						end
						Library.Notification(
							string.format("Successfully loaded theme (%s.theme).", Utility.RichText(Name, Library.Theme.accent)), 5
						)
					else
						Library.Notification(
							string.format("Couldn't find theme (%s.theme).", Utility.RichText(Name, Library.Theme.accent)), 5
						)
					end
				end
			end,
		})

		UI.Sections.ThemeConfig:Button({
			Name = "Delete",
			Confirm = true,
			Callback = function()
				local Name = Library.Flags["settings_theme_list"]
				if Name and Name ~= "" then
					local Path = string.format("%s%s.cfg", ThemeFolder, Name)
					if isfile(Path) then
						delfile(Path)
						Library.Notification(
							string.format("Successfully deleted theme (%s.theme).", Utility.RichText(Name, Library.Theme.accent)), 5
						)
						local _, F = Utility.GetFiles(ThemeFolder, { ".cfg" })
						ThemeList.Refresh(F)
						ThemeList.Set(F[1] or "")
					end
				end
			end,
		})

		task.spawn(function()
			while task.wait(5) do
				if UI.Window.Visible then
					local _, F = Utility.GetFiles(ThemeFolder, { ".cfg" })
					if #F ~= #LastFiles then
						LastFiles = F
						ThemeList.Refresh(F)
						ThemeList.Set(F[1] or "")
					end
				end
			end
		end)

		-- Theme Colors
		for theme, color in Library.Theme do
			ThemeColorpickers[theme] = UI.Sections.ThemeColors:Colorpicker({
				Name = Utility.ToTitleCase(theme),
				Flag = "settings_" .. theme,
				Usealpha = true,
				Ignore = true,
				Value = color,
				Callback = function(v)
					Library.UpdateTheme(theme, v.c)
				end
			})
		end
	end
end

local Movement = LPH_JIT(function()
	local Movement = {};
	Movement.Step = function()
		local MoveDirectionPos = NewVector3();
		local MoveDirectionString = "None";

		local CurrentCameraCFrame = CurrentCamera.CFrame

		local Forward = NewVector3(CurrentCameraCFrame.LookVector.X, 0, CurrentCameraCFrame.LookVector.Z).Unit;
		local Right   = NewVector3(CurrentCameraCFrame.RightVector.X, 0, CurrentCameraCFrame.RightVector.Z).Unit;

		local IsWDown, IsSDown, IsADown, IsDDown  = InputService:IsKeyDown(Enum.KeyCode.W), InputService:IsKeyDown(Enum.KeyCode.S), InputService:IsKeyDown(Enum.KeyCode.A), InputService:IsKeyDown(Enum.KeyCode.D);

		local Character = LocalPlayer.Character;
		local HumanoidRootPart = Character.PrimaryPart;
		local Humanoid = FindFirstChildOfClass(Character, "Humanoid");

		if HumanoidRootPart and Library.Flags["speedhack"] then
			if IsWDown then MoveDirectionPos = MoveDirectionPos + Forward end
			if IsSDown then MoveDirectionPos = MoveDirectionPos - Forward end
			if IsADown then MoveDirectionPos = MoveDirectionPos - Right end
			if IsDDown then MoveDirectionPos = MoveDirectionPos + Right end
			
			local _OldVelocity = HumanoidRootPart.AssemblyLinearVelocity;
			if MoveDirectionPos.Magnitude > 0 then
				HumanoidRootPart.AssemblyLinearVelocity = NewVector3(MoveDirectionPos.Unit.X * Library.Flags["speedhack_speed"] * 2, _OldVelocity.Y, MoveDirectionPos.Unit.Z * Library.Flags["speedhack_speed"] * 2);
			else
				HumanoidRootPart.AssemblyLinearVelocity = NewVector3(_OldVelocity.X * 0.75, _OldVelocity.Y, _OldVelocity.Z * 0.75);
			end
		end
		if Humanoid then
			if Library.Flags["autojump"] and InputService:IsKeyDown("Space") then
				Humanoid.Jump = true; -- ok dude
			end
			if Library.Flags["jumphack"] then

			end
		end
	end
	return Movement
end)()

local AntiAim = LPH_JIT(function()
	local AntiAim = {};
-- AntiAim.Step
	AntiAim.Step = function()
		if Library.Flags.antiaim_enabled then
			if Library.Flags.antiaim_pitch then
				if Library.Flags.antiaim_pitch_anim and Library.Flags.antiaim_pitch_anim ~= "None" then
					local AnimFunction = Cheat["AntiAim"]["PitchAnimations"][Library.Flags.antiaim_pitch_anim]
					if AnimFunction then
						local Pitch = AnimFunction();
						Cheat["AntiAim"].UpdatePitch(Pitch);
						Cheat["AntiAim"]["PitchValue"] = Pitch;
					end
				end
			end
		end
	end
	return AntiAim
end)()

RunService:BindToRenderStep("_", Enum.RenderPriority.Camera.Value + 1, LPH_NO_VIRTUALIZE(function()
	do
		Movement.Step();
		AntiAim.Step();
	end
	-- Cheat["AntiAim"].UpdatePitch
end))

do

	local CheckIfMethodIsValid = LPH_NO_VIRTUALIZE(function(Self, Method)
		return Self[Method] ~= nil;
	end)

	local Old; Old = hookmetamethod(game, "__namecall", LPH_NO_VIRTUALIZE(function(self, ...)

		-- i recoded this so its more fairly optimized holy fucking shit

		local Method = getnamecallmethod();
		local Args = {...};

        local ValidMethod = CheckIfMethodIsValid(self, Method); -- pcall was memeory leaking
        if not ValidMethod then
            return ValidMethod, Method .. ' is not a valid member of ' .. Self.ClassName .. ' "' .. tostring(Self) .. '"';
        end

		if checkcaller() then
			return Old(self, ...);
		end

		if Method == "GetAttribute" then
			local Attribute = Args[1];
			
			if typeof(Attribute) ~= "string" then
				return Old(self, ...);
			end

			local Removals = Library.Flags["gunmods_removals"];
			local AttributeLower = string.lower(Attribute);

			if string.find(AttributeLower, "spread") then
				if Library.Flags.gunmods_force_ns then
					return 0;
				end
			elseif string.find(AttributeLower, "recoil") then
				if Removals and TableFind(Removals, "Recoil") then
					return 0;
				end
			elseif Attribute == "EquipTime" then
				if Library.Flags.gunmods_instant_equip then
					return 0;
				end
			elseif Attribute == "Auto" then
				if Library.Flags.gunmods_force_auto then
					return true;
				end
			elseif Attribute == "FireRate" or Attribute == "ScopedFireRate" then
				if Library.Flags.gunmods_rapid_fire then
					return 1 / Library.Flags.gunmods_rapid_fire_speed;
				end
			elseif Attribute == "KnifeSkin" then
				-- print(Old(self, ...)) -- debug
				if Library.Flags.knife_changer then
					local KnifeType = (Library.Flags.knifetype_changer or "Karambit");
					local KnifeSkin = (Library.Flags.knifeskin_changer or "Gold");
					return KnifeType .. "_" .. KnifeSkin;
				end
			elseif Attribute == "CurrentSkin" or Attribute == "WhatSkin" then
				-- print(Old(self, ...)) -- debug
				if Library.Flags.gunskin_changer then
					local Gun, _Skin = TableUnpack(Args[1]:split("_"));
					local Skin = SkinListShit[Gun];
					
					if Gun and Skin then
						print("niGun")
						return Gun .. "_" .. Skin;
					end
				end
			elseif Attribute == "CTGloves" or Attribute == "TGloves" then
				if Library.Flags.glove_changer then
					local GloveType = (Library.Flags.glovetype_changer or "Glove");
					local GloveSkin = (Library.Flags.gloveskin_changer or "Operator");
					return GloveType .. "_" .. GloveSkin;
				end
			end
		elseif Method == "GetMouseDelta" then
			local Removals = Library.Flags["gunmods_removals"];
			if Removals and TableFind(Removals, "Sway") then
				return EmptyVector2;
			end
		elseif Method == "Play" then
			local Removals = Library.Flags["gunmods_removals"];
			if Removals and TableFind(Removals, "Bobbing") then
				local AnimationTrack = self;
				if AnimationTrack.ClassName == "AnimationTrack" and AnimationTrack.Animation and AnimationTrack.Animation.Name == "walk" then
					return nil;
				end
			end
			if Removals and TableFind(Removals, "Jumping/Landing") then
				local AnimationTrack = self;
				if AnimationTrack.ClassName == "AnimationTrack" and AnimationTrack.Animation and AnimationTrack.Animation.Name == "jumpstart" or AnimationTrack.Animation.Name == "jumpland" or AnimationTrack.Animation.Name == "jumpfallidle" then
					return nil;
				end
			end
		elseif Method == "PivotTo" and self and self.Name == "Arms" then
			local CurrentCFrame = Args[1]
            if Library.Flags.viewmodel_changer then
                if CurrentCFrame then
					-- print("hello2")
                    Args[1] = CurrentCFrame * NewCFrame(Cache.Get("ViewmodelOffsetX"), Cache.Get("ViewmodelOffsetY"), Cache.Get("ViewmodelOffsetZ"))
                end
            end
		elseif Method == "FireServer" or Method == "UnreliableFireServer" then
			-- fun stuff;

			if self == Remotes["HandleShots"] then
				local Inventory = Args[1];
				local Action	= Args[2];

				if Library.Flags.gunmods_inf_ammo then
					return;
				end
			end

			if self and self.Name == "UpdateSpectate" then
				local Buffer = Args[1]

				if Buffer and typeof(Buffer) == "buffer" then
					local Flags = buffer.readu8(Buffer, 15)

					local ValueToSet = {
						Position  = nil,
						Scoped 	  = bit32.band(Flags, 1) ~= 0,
						Crosshair = bit32.band(Flags, 2) ~= 0,
						Jumping   = bit32.band(Flags, 4) ~= 0,
						Alive     = bit32.band(Flags, 8) ~= 0,
						Spread    = nil,
						FOV       = nil,
					}

					if Library.Flags.spin_spec_cam then
						local Spin = tick() * Library.Flags["spin_spec_cam_speed"]

						buffer.writeu8(Buffer, 12, (math.cos(Spin) + 1) * 0.5 * 255 // 1)
						buffer.writeu8(Buffer, 13, (0             + 1) * 0.5 * 255 // 1)
						buffer.writeu8(Buffer, 14, (math.sin(Spin) + 1) * 0.5 * 255 // 1)
					end

					if Library.Flags.anti_spectate then
						ValueToSet["Alive"] = false;
					end

					local pos = ValueToSet.Position
					if pos then
						buffer.writef32(Buffer, 0, pos.X)
						buffer.writef32(Buffer, 4, pos.Y)
						buffer.writef32(Buffer, 8, pos.Z)
					end

					buffer.writeu8(Buffer, 15, bit32.bor(
						ValueToSet.Scoped    and 1 or 0,
						ValueToSet.Crosshair and 2 or 0,
						ValueToSet.Jumping   and 4 or 0,
						ValueToSet.Alive     and 8 or 0
					))

					if ValueToSet.Spread ~= nil then buffer.writef32(Buffer, 16, ValueToSet.Spread) end
					if ValueToSet.FOV    ~= nil then buffer.writef32(Buffer, 20, ValueToSet.FOV)    end

					Args[1] = Buffer
				end
			end

			if self == Remotes["HitPart"] then
				local HitData = Args[1];
				if HitData then
					if Library.Flags.gunmods_force_hs then
						if HitData["PartName"] then
							HitData["PartName"] = "Head";
						end
					end

					if Library.Flags.bullet_tracers then
						if HitData["Normal"] then

							local Flash = Cheat.GetFlashPart();
							if Flash then
								RunOnFixedThread(8, 
									Cheat["Visuals"].CreateBeam, 
									Flash.Position, 
									HitData["Position"], 
									Library.Flags.bullet_tracers_color.c
								);
							end
							
						end
					end

				end
			end
		end

		return Old(self, TableUnpack(Args, 1, #Args));
	end))

	
	do -- Ambassador.Fire Hook;
		local Old; Old = hookfunction(Modules["ReplicatedFirst"].Ambassador.Fire, LPH_NO_VIRTUALIZE(function(RemoteName, ...)
			local Args = {...};
			if Library.Flags["gunmods_inf_ammo"] then
				if RemoteName == "UpdateAmmo" then
					Args[1]["Ammo"] = 9e9;
					Args[1]["StoredAmmo"] = 9e9;
				end
			end
			if RemoteName == "VPlay" then
				if Library.Flags["gunmods_force_rareins"] then
					local Viewmodel = Modules["ReplicatedFirst"]["Variables"].vm;
					if Viewmodel and FindFirstChild(Viewmodel, "rinspect") then
						if Args[1] == "inspect" then
							Args[1] = "rinspect";
						end
					end
				end
			end

			return Old(RemoteName, TableUnpack(Args, 1, #Args));
		end))
	end

	do -- Network.FireServer Hook;
		local Old; Old = hookfunction(Modules["ReplicatedFirst"].Network.FireServer, LPH_NO_VIRTUALIZE(function(RemoteName, ...)
			local Args = {...};
			if RemoteName == "KillMe" then
				return; -- 	FUCK YOU BITCH
			end

			if #Args == 2 then
				if typeof(Args[1]) == "number" and typeof(Args[2]) == "number" then
					if Library.Flags.antiaim_enabled then
						if Library.Flags.antiaim_pitch and not checkcaller() then
							if Library.Flags.antiaim_pitch_anim and Library.Flags.antiaim_pitch_anim ~= "None" then
								Args[1] = Cheat["AntiAim"]["PitchValue"]
							else
								Args[1] = Library.Flags.antiaim_pitch_value
							end
						end
					end
				end
			end

			return Old(RemoteName, TableUnpack(Args, 1, #Args));
		end))
	end

	do -- Shucky Hooks;
		local OldGetWep; OldGetWep = hookfunction(Modules["ReplicatedStorage"].Shucky.GetWep, LPH_NO_VIRTUALIZE(function(WeaponName, _Player, ...)
			if WeaponName == "Knife" and Library.Flags.knife_changer and (_Player == LocalPlayer or _Player == nil or _Player == LocalPlayer.Character) then
				WeaponName = (Library.Flags.knifetype_changer or "Karambit");
			end
			return OldGetWep(WeaponName, _Player, ...);
		end))
		local OldGetCurrentSkin; OldGetCurrentSkin = hookfunction(Modules["ReplicatedStorage"].Shucky.getcurrentskin, LPH_NO_VIRTUALIZE(function(Folder, ...)
			if Folder and Library.Flags.gunskin_changer and SkinListShit[Folder.Name] then
				local Skin = SkinListShit[Folder.Name];
				return Folder.Name .. "_" .. Skin;
			end
			return OldGetCurrentSkin(Folder);
		end))
	end

	do -- Appearance Hook;
		local OldMapGunSkin; OldMapGunSkin = hookfunction(Modules["ReplicatedStorage"].Appearance.MapGunSkin, LPH_NO_VIRTUALIZE(function(WeaponModel, SkinId, ShowStatClock, StatKills, UseWorldModel, _Player, SkinData, _, ...)
			local Gun, Skin = TableUnpack(SkinId:split("_"))

			if (_Player == LocalPlayer or _Player == nil or _Player == LocalPlayer.Character) then
				if Library.Flags.knife_changer and SkinId == "Knife_Stock" then
					local KnifeType = (Library.Flags.knifetype_changer or "Karambit");
					local KnifeSkin = (Library.Flags.knifeskin_changer or "Gold");
					SkinId = KnifeType .. "_" .. KnifeSkin;
				end
				if Gun and Library.Flags.gunskin_changer and SkinListShit[Gun] then
					local Skin = SkinListShit[Gun];
					print(Skin)
					SkinId = Gun .. "_" .. Skin;
				end
			end
			return OldMapGunSkin(WeaponModel, SkinId, ShowStatClock, StatKills, UseWorldModel, _Player, SkinData, _, ...);
		end))
	end
end

do -- Signals

	if not GetAttribute(LocalPlayer, "Kills") then
		SetAttribute(LocalPlayer, "Kills", 0)
	end

	LocalPlayer:GetAttributeChangedSignal("Kills"):Connect(function() --[[ Line: 144 ]]
                --[[
                Upvalues:
                    [1] = u4
                    [2] = u18
                --]]
        -- u4.Fire("UpdateBoard", u18)
		if Library.Flags.picture_on_kill then
			task.spawn(Cheat["PicturesOnKill"].Display)
		end
    end)

	CurrentCamera.ChildAdded:Connect(function(_Instance: any)
		if _Instance and _Instance.Name == "_TrailHolder" then
			if Library.Flags.bullet_tracers then
				_Instance.Parent = nil;
			end
		end
	end)

	if not GetAttribute(LocalPlayer, "Kills") then
		SetAttribute(LocalPlayer, "Kills", 5)
	end
end
