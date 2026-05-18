-- theres still a handshake though im lazy to emulate that.

cloneref(game:GetService("ScriptContext")):SetTimeout(1)
local Threads, Functions = 0, 0

for Index, Thread in getreg() do
    if typeof(Thread) ~= "thread" then continue end
    local Source = debug.info(Thread, 1, "s")
    if Source and string.find(Source, "ReplicatedFirst") and string.find(Source, "Client") then
        -- task.cancel(Thread);
        pcall(coroutine.close, Thread);
        Threads += 1;
    end
end

for Index, Function in getgc(true) do
    if Function and typeof(Function) == "function" and islclosure(Function) then
        local Info = getinfo(Function)
        if Info and Info.source and string.find(Info.source, "ReplicatedFirst") and string.find(Info.source, "Client") then
            local Old; Old = hookfunction(Function, newcclosure(function(...)
                return nil;
            end))
            Functions += 1
        end
    end
end

print(`Killed {Threads} threads.`);
print(`Hooked {Functions} functions`);
