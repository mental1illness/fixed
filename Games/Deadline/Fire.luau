local utility = {} do

	utility["cache"] = {
		["constant(s)_table"] = {},
	}

	--// functions

	function utility:does_constant_exist(func, constant)
		if not func then return end
		if not islclosure(func) then return end
		local constants = self["cache"]["constant(s)_table"][func] ~= nil and utility["cache"]["constant(s)_table"][func] or debug.getconstants(func)

		if constants and #constants == 0 then
			return
		end

		self["cache"]["constant(s)_table"][func] = constants
		
		for index, value in constants do
			if string.find(tostring(value), constant) then
				return true, index, value, constants
			else
				continue
			end
		end
		return false, 0, nil, {}
	end
end

local emptyfunc = function() end
hookfunction(getfenv, emptyfunc)

local rifle_method = require(game.ReplicatedStorage.framework.core.controller.item.weapon.rifle_methods)

local fp_controller = nil
for index, value in getgc(true) do
	if typeof(value) == "table" then
		if value and rawget(value, "inspect_y") then
			fp_controller = value
		end
	end

	if typeof(value) == "function" then
		local kys_exist = utility:does_constant_exist(value, "kill yourself")
		if kys_exist then
			hookfunction(value, emptyfunc)
		end
	end
end

rifle_method.client_framework_rifle_fire(fp_controller, fp_controller.weapon, true)
