local HttpService = cloneref(game:GetService("HttpService"))
local FAKE_VALIDATED = {
    ["valid"] = true;
    ["error"] = "nothing bro i promise";
}
local FAKE_VALIDATED_JSON = HttpService:JSONEncode(FAKE_VALIDATED);

local OldRequest = getgenv().request
local OldIsFuncHooked = getgenv().isfunctionhooked;
getgenv().isfunctionhooked = newcclosure(function(Function, ...)
    if Function == request then
        return false
    end
    return OldIsFuncHooked(Function, ...)
end)

getgenv().request = newcclosure(function(Table, ...)
    print(Table.Url)
    if Table and Table.Url and string.find(Table.Url, "verifyOpen") then

        getgenv().request = OldRequest
        getgenv().isfunctionhooked = OldIsFuncHooked
        
        return {
            ["Success"] = true,
            ["StatusCode"] = 200,
            ["StatusMessage"] = "OK",
            ["Headers"] = {};
            ["Body"] = FAKE_VALIDATED_JSON
        }
    end

    return OldRequest(Table, ...)
end)

loadstring(game:HttpGet("find the link to this urself i'm not providing it not allowed to................ SORRY! SORRY SORRY ROLESIONAL!!"))()
