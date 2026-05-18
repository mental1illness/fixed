-- this is easily patchable btw frog pls patch the shit out of this

local ToNotTrust = nil;
local Old; Old = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
    local Method = getnamecallmethod()
    local ScriptCalling = getcallingscript()
        
    if Method == "FakeIndex" then
        if ScriptCalling then
            ToNotTrust = ScriptCalling
        end
        return false, 'FakeIndex is not a valid member of DataModel "Ugc"'
    end

    if ScriptCalling and ToNotTrust and ScriptCalling == ToNotTrust then
        -- warn("yo", ScriptCalling, "i ain't gon trust u")
        return Old(self, ...)
    end

    return Old(self, ...)
end))


--[[
OLD DO NOT USE.
local Constants = {
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
}
        local Old; Old = hookfunction(getrenv().xpcall, newcclosure(function(...)
            local CallingScript = getcallingscript()
                if CallingScript then
                    local Name = tostring(CallingScript)
                    if Name and Constants["IgnoredScript"][Name] then
                        return false, "frog im here lul"
                    end
                end
            return Old(...)
        end))

]]
