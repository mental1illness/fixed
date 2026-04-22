local getservice: (string) -> any = clonefunction(game.GetService);
local emptyvec3  = Vector3.new();
local emptycf    = CFrame.new();

local runservice = cloneref(getservice(game, "RunService"));
local inputservice      = cloneref(getservice(game, "UserInputService"));
local players    = cloneref(getservice(game, "Players"));
local currentcamera = cloneref(workspace.CurrentCamera)

local client     = { -- this is us ;w; looks unnessesary but i dont wanna do a thousand checks..
    ["player"]       = players.LocalPlayer;
    ["character"]    = nil; -- metatable will be controlling this!
    ["root"]         = nil; -- same goes for the rootpart
    ["root_pos"]     = emptyvec3;
}

setmetatable(client, { 
    __index = function(self, index)
        local localplayer = self["player"]
        local character   = localplayer.Character -- bad idea self["character"]
        if index == "character" then
            -- print("hey! im interfering with this!")
            -- return "halo"

            -- works!

            return (character or "doesn't exist")
        elseif index == "root" then
            return (character and character["HumanoidRootPart"] or "doesn't exist")
        elseif index == "root_pos" then
            return (character and character["HumanoidRootPart"].CFrame.Position or emptyvec3)
        end
    end
})

-- print(client.character) debugging..
-- print(client.root) perfection! works as expected now.. the main part.. the desync.

-- indicator

local indicator = Drawing.new("Text");
indicator.Text = "desynced position";
indicator.Color = Color3.fromRGB(255, 0, 0);
indicator.Visible = false;
indicator.Font = Drawing.Fonts.Plex;
indicator.Outline = true;
indicator.Size = 13

local desync = {
    ["is_desyncing"] = false;
    ["fake"] = {
        ["cframe"] = emptycf;
        ["velocity"] = emptyvec3;
        ["rot_velocity"] = emptyvec3;
    };
    ["real"] = {
        ["cframe"] = emptycf;
        ["velocity"] = emptyvec3;
        ["rot_velocity"] = emptyvec3;
    };
    ["last_pos"]     = CFrame.new();
} do
    desync.__index = desync

    desync["activate"] = function() -- self explanatory
        desync.is_desyncing = true

        -- setting things..

        desync.fake.cframe  = client.root.CFrame
        desync.fake.velocity  = client.root.velocity
        desync.fake.rot_velocity = client.root.RotVelocity

        -- same goes for our real position!

        desync.real.cframe  = client.root.CFrame
        desync.real.velocity  = client.root.velocity
        desync.real.rot_velocity = client.root.RotVelocity

        desync.last_pos     = client.root.CFrame
    end

    desync["deactivate"] = function() -- self explanatory
        desync.is_desyncing = false
    end


    desync["change_position"] = function(pos: CFrame) -- self explanatory
        local root = client.root
        if root == "doesn't exist" then return end

        desync.fake.cframe = pos
        desync.fake.velocity = Vector3.zero
        desync.fake.rot_velocity = Vector3.zero

    end

    runservice:BindToRenderStep("im going to desync now", Enum.RenderPriority.First.Value, function()
        local root = client.root
        if root == "doesn't exist" then return end
        root.CFrame = desync.real.cframe or root.CFrame
        root.Velocity     = desync.real.velocity     or root.Velocity
        root.RotVelocity  = desync.real.rot_velocity or root.RotVelocity
        if desync.fake.cframe and desync["is_desyncing"] then
            local vector, on_screen = currentcamera:WorldToViewportPoint(desync.fake.cframe.Position)

            indicator.Position = Vector2.new(vector.X - 55, vector.Y)
            indicator.Visible = on_screen
        else
            indicator.Visible = false
        end
        
    end)
    runservice.Heartbeat:Connect(function()
        local root = client.root
        if root == "doesn't exist" then return end

        -- desync.real.cframe = root.CFrame -- updateee this
        desync.real.cframe  = root.CFrame
        desync.real.velocity  = root.velocity
        desync.real.rot_velocity = root.RotVelocity

        if desync["is_desyncing"] == true then
            sethiddenproperty(root, "NetworkIsSleeping", false)

            root.CFrame = desync.fake.cframe -- use our last position
            root.Velocity  = desync.fake.velocity 
            root.RotVelocity = desync.fake.rot_velocity 
            
            sethiddenproperty(root, "NetworkIsSleeping", true) 
        end
    end)
end

inputservice.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.T then
        if not desync["is_desyncing"] then
            desync.activate()
        else
            desync.deactivate()
        end
    end
end)

getgenv().desync = desync