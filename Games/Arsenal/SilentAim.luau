-- WEE! ASK! FOR! ATTENTION!
--      ^^ BEG
--		^^ SEEK 
-- EPAL..

local actorfunc = getactorthreads or getactors;
local run_actor = run_on_thread or run_on_actor;
local actors; do
	actors = actorfunc();
	if actors and typeof(actors) == "table" then
		run_actor(actors[1], [[
			
			local settings = {
				fov = 90;
				
				use_closest_hitbox = true;

				team_check = true;
				visible_check = true;
			}
			
			local raycast_params = RaycastParams.new();
			local players = cloneref(game:GetService("Players"));
			local local_player = players.LocalPlayer
			local current_camera = workspace.CurrentCamera
			local mouse = local_player:GetMouse()
			
			local cache = { hitboxes = {"Head", "UpperTorso", "LowerTorso", "LeftUpperArm", "RightUpperArm", "LeftLowerArm", "RightLowerArm", "LeftHand", "RightHand", "LeftUpperLeg", "RightUpperLeg", "LeftLowerLeg", "RightLowerLeg", "LeftFoot", "RightFoot"} }
					
			local getclosesthitbox = function()
				local closest_hitbox = nil;
				local shortest_distance = math.huge;

				for index, player in players:GetPlayers() do
					local character = player.Character;
					if player and character and player ~= local_player then
						if settings.team_check and player.Team == local_player.Team then
							continue;
						end

						local humanoid = character:FindFirstChildOfClass("Humanoid");

						if humanoid and humanoid.Health > 0 then
							local _parts = settings.use_closest_hitbox and cache.hitboxes or {"Head"};

							for index, value in _parts do
								local hitbox = character:FindFirstChild(value);

								if hitbox then
									local screen_position, on_screen = current_camera:WorldToScreenPoint(hitbox.Position);

									if on_screen then
										local mouse_position = Vector2.new(mouse.X, mouse.Y);
										local hitbox_position = Vector2.new(screen_position.X, screen_position.Y);
										local distance = (mouse_position - hitbox_position).Magnitude;

										if distance <= settings.fov and distance < shortest_distance then
											if settings.visible_check then
												local ray_origin = current_camera.CFrame.Position;
												local ray_direction = (hitbox.Position - ray_origin).Unit * 1000;

												raycast_params.FilterDescendantsInstances = {local_player.Character};
												raycast_params.FilterType = Enum.RaycastFilterType.Exclude;
												raycast_params.RespectCanCollide = true;

												local raycast_result = workspace:Raycast(ray_origin, ray_direction, raycast_params);

												while raycast_result and raycast_result.Instance do
													local hit_part = raycast_result.Instance;
													local is_character_part = false;

													for _, other_player in players:GetPlayers() do
														if other_player.Character and hit_part:IsDescendantOf(other_player.Character) then
															is_character_part = true;
															break;
														end
													end

													if not is_character_part and (hit_part.Transparency >= 0.5 or not hit_part.CanCollide) then
														table.insert(raycast_params.FilterDescendantsInstances, hit_part);
														ray_origin = raycast_result.Position + ray_direction.Unit * 0.01;
														raycast_result = workspace:Raycast(ray_origin, ray_direction, raycast_params);
													else
														break
													end
												end

												if raycast_result and raycast_result.Instance:IsDescendantOf(character) then
													shortest_distance = distance;
													closest_hitbox = hitbox;
												end
											else
												shortest_distance = distance;
												closest_hitbox = hitbox;
											end
										end
									end
								end
							end
						end
					end
				end

				return closest_hitbox;
			end

			local_player.Data:FindFirstChild("Melee").Value = "Karambit";
			local_player.Data:FindFirstChild("Skin").Value = "Ace Pilot";
			local_player.Data:FindFirstChild("Skin").Sleeve.Value = "Ace Pilot";
			for index, func in getgc() do
				if func and typeof(func) == "function" then
					local info = debug.getinfo(func)
					if info and info.name and string.lower(info.name) == "raycast" then
						local old; old = hookfunction(func, function(self, ...)
							local args = {...};
							local closest_hitbox = getclosesthitbox();
							
							if closest_hitbox then
								args[2] = (closest_hitbox.Position - args[1]).Unit * 1000;
							end

							return old(self, table.unpack(args, 1, #args));
						end)
					end

					if info and info.name and string.lower(info.name) == "createprojectile" then  -- idek about this sometimes im getting it actually working sometimes just nothing
						local old; old = hookfunction(func, function(...)
							local args = {...};
							local closest_hitbox = getclosesthitbox();

							if closest_hitbox and args[1] and args[1].Name == local_player.Name then
								local origin = args[4] or args[5];
								local direction_argument = args[5] or args[6];
								local speed_argument = args[6] or args[7];

								if origin and typeof(origin) == "Vector3" then
									local new_direction = (closest_hitbox.Position - origin).Unit;

									if speed_argument and type(speed_argument) == "number" then
										args[direction_argument == args[5] and 5 or 6] = new_direction;
									elseif direction_argument and typeof(direction_argument) == "Vector3" then
										local speed = direction_argument.Magnitude;
										args[direction_argument == args[5] and 5 or 6] = new_direction * speed_argument;
									end
								end
							end

							return old(table.unpack(args, 1, #args));
						end)
					end
					
					if info and info.name and string.lower(info.name) == "getnation" then
						local old; old = hookfunction(func, function()
							return "Murderous Child";
						end)
					end
				end
			end
		]])
	end
end
