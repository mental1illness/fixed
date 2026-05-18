-- ok

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
