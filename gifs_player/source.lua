local sfind: (string, string) -> (number?, number?) = clonefunction(string.find)

local instancenew: (string, Instance?) -> Instance = clonefunction(Instance.new
)
local fromoffset: (number, number) -> UDim2 = clonefunction(UDim2.fromOffset) -- from opsec :: OPSEC == FUNNY :: FUNNY = HUMOR :: HUMOR = GOOD :: GOOD = 1 + 1 :: 1 + 1 = 2 :: OPSEC = 2

local floor: (number) -> number = clonefunction(math.floor)
local rape: (Instance) = clonefunction(game.Destroy)

local runservice = cloneref(game:GetService("RunService"))
local contentprovider = cloneref(game:GetService("ContentProvider"))

local function create(class: string, properties: {}?, attributes: {}?): Instance | boolean
	local success, instance = pcall(instancenew, class)

	if not success then
		return false
	end

	if properties then
		for key, value in next, properties do
			local succ, err = pcall(function()
				(instance :: any)[key] = value
			end)

			if not succ then
				warn(err)
				return nil
			end
		end
	end

	if attributes then
		for key, value in attributes do
			instance:SetAttribute(key, value)
		end
	end

	return instance
end

local get_response = function(link: string)
    local response = request({
        Url = link,
        Method = "GET"
    })
    return response
end

local get_gifsframe = function(link: string, minimum_frame: number, maximum_frame: number, name: string)
    if not link then return end
    --// check if the string is raw github
    if not sfind(link, "raw.githubusercontent.com") then return end
    
    local gifs = {} --// table to store the images
    for i = minimum_frame, maximum_frame do -- min, max frame cus if i use the github shit method ill be fucked
        -- removed run on the thread because shit removes yielding and can ruin the code
        local image = nil

        if isfile(name .. i .. ".png") then gifs[i] = getcustomasset(name .. i .. ".png") continue end -- we wont change the thing anyways

        -- pcall just to be safe
        local yes, nvm = pcall(function()
            local response = get_response(link .. "/" .. i .. ".png")
            if not response or response.StatusCode ~= 200 then
                warn("failed at frame", i, "because i cant fucking fetcxh the image")
            end
            writefile(name .. i .. ".png", response.Body)
            image = getcustomasset(name .. i .. ".png")
            -- print(image)
        end)

        if not yes then
            warn("the shit fucked up at -->", i, "with", nvm)
            continue
        end
        -- ^^ error something stuff
        gifs[i] = image
    end

    return gifs
end

local preload_gif = function(gif: table, min_frame: number, max_frame: number) -- so it wont fucking be flickering that looks so retarded bruh
    min_frame = min_frame or 1
    max_frame = max_frame or #gif

    local imagelabels = {  }

    for index = min_frame, max_frame do
        local frame = gif[index]
        if frame then
            local image = create("ImageLabel", { Parent = gethui(), Size = fromoffset(0, 0), Image = frame })
            imagelabels[index] = image
        end
    end

    return imagelabels
end


local start_time = tick()

local gifs = {
    ["paimon"] = get_gifsframe("https://raw.githubusercontent.com/mental1illness/storage/refs/heads/main/gifs/paimon_frames", 1, 53, "paimon"),
    ["render"] = {
        ["screengui"]   = create("ScreenGui", { Parent = gethui(), IgnoreGuiInset = true, ResetOnSpawn = false }),
    },
    ["data"] =  {  }
}

gifs["render"]["image_label"] = create("ImageLabel", { Parent = gifs["render"]["screengui"], Size = fromoffset(397, 465) })

local playgif = function(label: Instance, gif: table, loop: boolean, delay: number, min_frame: number, max_frame: number)
    local min_frame, max_frame, loop = min_frame or 1, max_frame or #gif, loop or false
    local _gifconnection = nil
    
    local now = 0
    local index = min_frame -- so we can actually do a loop

    _gifconnection = runservice.RenderStepped:Connect(function(delta_time)
        now = now + delta_time

        if now >= delay then
            now = 0

            label.Image = gif[index]
            index += 1

            if index > max_frame then
                if loop then
                    index = min_frame
                else
                    _gifconnection:Disconnect()
                end
            end
        end
    end)

    gifs["data"]["current_playing"] = { ["connection"] = _gifconnection, ["gif"] = gif }
end
local stopgif = function()
    local current_playing = gifs["data"]["current_playing"]
    if current_playing and current_playing.connection then
        current_playing.connection:Disconnect()
        gifs["data"]["current_playing"] = nil
    end
end

local image_labels = preload_gif(gifs["paimon"], 1, 53)
playgif(gifs["render"]["image_label"], gifs["paimon"], true, 0.05)


print("took", floor(tick() - start_time) .. "s to load!")
