const DebugMode = true;

local GlobalENV = getgenv();
local RobloxENV = getrenv();

local Blacklisted = {
	["script"] = true; -- fuck you;
	["info"]   = true;
	["cache"]  = true;
}

local RealGlobal = {};
for Key, Function in GlobalENV do
	if Key and not RobloxENV[Key] then
		if Key ~= "script" or Key ~= "info" then
			RealGlobal[Key] = Function;
		end
	end
end

local SarFuckDisShiUp = {};
local FunctionInfo	  = {};
for Index, Value in getgc(true) do
	if Value and typeof(Value) == "function" and not isexecutorclosure(Value) and islclosure(Value) then
		local Constants = debug.getconstants(Value);
		local Info		= debug.getinfo(Value);
		if Constants then
			for _Index, Constant in Constants do
				if Constant and typeof(Constant) == "string" then
					if RealGlobal[Constant] and Blacklisted[Constant] ~= true then
						if DebugMode then
							local String = "\nSuspicious Constant: " .. Constant .. "\n Information:"
							for Key, InfoValue in Info do
								String = String .. "\n\t" .. tostring(Key) .. ": " .. tostring(InfoValue)
							end
							warn(String)
						end

						table.insert(SarFuckDisShiUp, { Value, _Index, "get fucked nigga" });
						continue;
					end
				end
			end
		end
	end
end

local Counts = 0;
for index, value in SarFuckDisShiUp do
	debug.setconstant(table.unpack(value));
	Counts += 1;
end

print("Patched", Counts, "functions.")
