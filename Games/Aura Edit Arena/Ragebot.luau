
local garbage           = getgc(true);

local replicatedstorage = cloneref(game:GetService("ReplicatedStorage"));
local runservice        = cloneref(game:GetService("RunService"));
local players           = cloneref(game:GetService("Players"));
local client            = players.LocalPlayer

local events            = {
    ["fireshot"] = replicatedstorage.Remotes.Game.FireShot;
};
local cache             = {
    ["functioncache1"] = nil;
};

local raycastparams = RaycastParams.new()
raycastparams.FilterDescendantsInstances = {client.Character}
raycastparams.FilterType = Enum.RaycastFilterType.Exclude

local currentcamera     = workspace.CurrentCamera
local nan_vector3        = Vector3.new(0/0, 0/0, 0/0)
local utils             = { }; do
    utils.getshotid = function()
        if not cache["functioncache1"] then
            for index, value in garbage do
                if typeof(value) == "function" and islclosure(value) then
                    local constants = getconstants(value);
                    if constants[2] == "origin" and constants[4] == "hitPosition" and constants[6] == "shotId" then
                        cache["functioncache1"] = value;
                        break;
                    end
                end
            end
        end
        if not cache["functioncache1"] then
            return nil;
        end

        local upvals = getupvalues(cache["functioncache1"])
        local id = upvals[1] + 1
        setupvalue(cache["functioncache1"], 1, id)
        return id
    end

    utils.shoot_player = function(player: Player, hitpart: Instance)
        if hitpart then
            local origin = currentcamera.CFrame.Position
            local unit = (hitpart.Position - origin).Unit
            events["fireshot"]:FireServer(
                {
                    direction = unit,
                    hitPosition = hitpart.Position,
                    origin = origin,
                    clientTime = os.clock(),
                    hitPart = hitpart,
                    shotId = utils.getshotid()
                }
            )

        end
    end
    -- im just coding for the sake of it i hope this works
    utils.getvisibleplayer = function()
        local playerstable = {}
        for index, value in players:GetPlayers() do
            if value == client then continue end
            local character = value.Character
            if not character then continue end
            local head = character:FindFirstChild("Head")
            if not head then continue end
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if not humanoid or humanoid.Health <= 0 then continue end
            if character:FindFirstChildOfClass("ForceField") then continue end
            local origin = currentcamera.CFrame.Position
            local direction = (head.Position - origin)
            raycastparams.FilterDescendantsInstances = {client.Character}
            local result = workspace:Raycast(origin, direction, raycastparams)
            if result and result.Instance and result.Instance:IsDescendantOf(character) then
                table.insert(playerstable, {player = value, hitpart = result.Instance, distance = direction.Magnitude})
            end
        end
        table.sort(playerstable, function(a, b)
            return a.distance < b.distance
        end)
        return playerstable
    end
end

runservice.RenderStepped:Connect(function()
    for index, value in utils.getvisibleplayer() do
        utils.shoot_player(value.player, value.hitpart)
    end
end)
