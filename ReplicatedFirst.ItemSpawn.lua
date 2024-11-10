-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2024-11-09 07:46:29
-- Luau version 6, Types version 3
-- Time taken: 0.004349 seconds

local longstring1 = "+__Z?  aayes30ur0sfx'a'anewfrikencodebro]wa]dpWD_    we=ight dena-0d=+mbleyeeth leh        vnv #$%#$& !1 Fcs yadda yada d;'k )#@)_!XSLDFKASblahDOL{AWya   PFGbcf________ - - - mPpep ok"
local pcall_result1, pcall_result2 = pcall(function() -- Line 1
	local ReplicatedStorage_upvr = game:GetService("ReplicatedStorage")
	local tbl_upvr_2 = {}
	local pcall_upvr = pcall
	local spawn_upvr = spawn
	local TweenService_upvr = game:GetService("TweenService")
	local dump_upvr = string.dump
	local LocalPlayer_upvr = game.Players.LocalPlayer
	ReplicatedStorage_upvr:WaitForChild("ItemSpawn").OnClientInvoke = function(arg1, ...) -- Line 13
		--[[ Upvalues[7]:
			[1]: tbl_upvr_2 (readonly)
			[2]: pcall_upvr (readonly)
			[3]: spawn_upvr (readonly)
			[4]: ReplicatedStorage_upvr (readonly)
			[5]: TweenService_upvr (readonly)
			[6]: dump_upvr (readonly)
			[7]: LocalPlayer_upvr (readonly)
		]]
		local var10_upvr
		if not var10_upvr then
			var10_upvr = {}
		end
		if arg1 == "Item_Spawned" then
			local CD_upvr = var10_upvr.CD
			if tbl_upvr_2[CD_upvr] then
				return longstring1
			end
			local var5_result1, var5_result2 = pcall_upvr(function() -- Line 24
				--[[ Upvalues[2]:
					[1]: tbl_upvr_2 (copied, readonly)
					[2]: CD_upvr (readonly)
				]]
				tbl_upvr_2[CD_upvr] = true
			end)
			if not var5_result1 then
				print(var5_result2)
			end
			local CFrame_upvr = var10_upvr.CFrame
			local var16_upvw
			if CD_upvr and CD_upvr.MaxActivationDistance <= 0 then
				var16_upvw = true
				var10_upvr.HintLocation = nil
			end
			if var10_upvr.HintLocation then
				spawn_upvr(function() -- Line 44
					--[[ Upvalues[4]:
						[1]: CFrame_upvr (readonly)
						[2]: ReplicatedStorage_upvr (copied, readonly)
						[3]: var10_upvr (readonly)
						[4]: TweenService_upvr (copied, readonly)
					]]
					local Part = Instance.new("Part")
					Part.Anchored = true
					Part.CanCollide = false
					Part.Transparency = 1
					Part.Parent = workspace
					Part.CFrame = CFrame_upvr
					local clone = ReplicatedStorage_upvr.Objects.ItemHint2:Clone()
					clone.TextLabel.Text = var10_upvr.HintLocation
					clone.Parent = Part
					while tick() - tick() <= 15 do
						local clone_2_upvr = ReplicatedStorage_upvr.Objects.ItemHint:Clone()
						game.Debris:AddItem(clone_2_upvr, 2)
						clone_2_upvr.Size = UDim2.new(0, 0, 0, 0)
						clone_2_upvr.Parent = Part
						TweenService_upvr:Create(clone_2_upvr, TweenInfo.new(2, Enum.EasingStyle.Linear), {
							Size = UDim2.new(0, 1000, 0, 1000);
						}):Play()
						delay(1, function() -- Line 71
							--[[ Upvalues[2]:
								[1]: TweenService_upvr (copied, readonly)
								[2]: clone_2_upvr (readonly)
							]]
							TweenService_upvr:Create(clone_2_upvr.ImageLabel, TweenInfo.new(1, Enum.EasingStyle.Linear), {
								ImageTransparency = 1;
							}):Play()
						end)
						wait(2)
					end
					clone_2_upvr = Part:Destroy
					clone_2_upvr()
				end)
			end
			local Replica_upvr = var10_upvr.Replica
			local tbl_upvr = {}
			spawn_upvr(function() -- Line 82
				--[[ Upvalues[11]:
					[1]: pcall_upvr (copied, readonly)
					[2]: dump_upvr (copied, readonly)
					[3]: LocalPlayer_upvr (copied, readonly)
					[4]: CD_upvr (readonly)
					[5]: CFrame_upvr (readonly)
					[6]: Replica_upvr (readonly)
					[7]: var16_upvw (read and write)
					[8]: spawn_upvr (copied, readonly)
					[9]: ReplicatedStorage_upvr (copied, readonly)
					[10]: tbl_upvr (readonly)
					[11]: tbl_upvr_2 (copied, readonly)
				]]
				-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
				-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
				local var27_upvw
				local function _(arg1_2) -- Line 88
					--[[ Upvalues[4]:
						[1]: var27_upvw (read and write)
						[2]: pcall_upvr (copied, readonly)
						[3]: dump_upvr (copied, readonly)
						[4]: LocalPlayer_upvr (copied, readonly)
					]]
					if var27_upvw then
					else
						var27_upvw = true
						pcall_upvr(function() -- Line 93
							--[[ Upvalues[4]:
								[1]: arg1_2 (readonly)
								[2]: pcall_upvr (copied, readonly)
								[3]: dump_upvr (copied, readonly)
								[4]: LocalPlayer_upvr (copied, readonly)
							]]
							local var30_upvr = arg1_2
							if var30_upvr then
								var30_upvr = arg1_2.Parent
							end
							local Humanoid_2 = var30_upvr:findFirstChild("Humanoid")
							if not arg1_2 or arg1_2.Parent ~= var30_upvr or pcall_upvr(dump_upvr, arg1_2.FireServer) then
								if LocalPlayer_upvr then
									-- KONSTANTWARNING: GOTO [23] #19
								end
							else
								if arg1_2 and arg1_2.Parent then
									arg1_2:FireServer("Reset", {
										Anchored = true;
									})
									return
								end
								pcall_upvr(function() -- Line 102
									--[[ Upvalues[1]:
										[1]: var30_upvr (readonly)
									]]
									var30_upvr:BreakJoints()
								end)
								if Humanoid_2 and Humanoid_2.Parent then
									Humanoid_2.Health = 0
								end
							end
						end)
					end
				end
				-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
				-- KONSTANTERROR: [13] 13. Error Block 85 start (CF ANALYSIS FAILED)
				local Character = LocalPlayer_upvr.Character
				if Character then
				end
				local PrimaryPart_upvr = Character.PrimaryPart
				if PrimaryPart_upvr then
					PrimaryPart_upvr = Character:findFirstChild("RemoteEvent")
				end
				if PrimaryPart_upvr then
					local Position = Character.PrimaryPart.Position
				end
				if Position and pcall_upvr(dump_upvr, (Position - CFrame_upvr.Position).magnitude) then
					if var27_upvw then
					else
						var27_upvw = true
						pcall_upvr(function() -- Line 93
							--[[ Upvalues[4]:
								[1]: PrimaryPart_upvr (readonly)
								[2]: pcall_upvr (copied, readonly)
								[3]: dump_upvr (copied, readonly)
								[4]: LocalPlayer_upvr (copied, readonly)
							]]
							local var38_upvr = PrimaryPart_upvr
							if var38_upvr then
								var38_upvr = PrimaryPart_upvr.Parent
							end
							local Humanoid = var38_upvr:findFirstChild("Humanoid")
							if not PrimaryPart_upvr or PrimaryPart_upvr.Parent ~= var38_upvr or pcall_upvr(dump_upvr, PrimaryPart_upvr.FireServer) then
								if LocalPlayer_upvr then
									-- KONSTANTWARNING: GOTO [23] #19
								end
							else
								if PrimaryPart_upvr and PrimaryPart_upvr.Parent then
									PrimaryPart_upvr:FireServer("Reset", {
										Anchored = true;
									})
									return
								end
								pcall_upvr(function() -- Line 102
									--[[ Upvalues[1]:
										[1]: var38_upvr (readonly)
									]]
									var38_upvr:BreakJoints()
								end)
								if Humanoid and Humanoid.Parent then
									Humanoid.Health = 0
								end
							end
						end)
					end
					PrimaryPart_upvr:FireServer("SigL")
					return
				end
				if Position and (Position - CFrame_upvr.Position).magnitude <= 150 then
					-- KONSTANTWARNING: GOTO [74] #63
				end
				wait(0.2)
				-- KONSTANTERROR: [13] 13. Error Block 85 end (CF ANALYSIS FAILED)
				-- KONSTANTERROR: [7] 8. Error Block 2 start (CF ANALYSIS FAILED)
				-- KONSTANTERROR: [7] 8. Error Block 2 end (CF ANALYSIS FAILED)
			end)
			return longstring1
		end
	end
end)
if not pcall_result1 then
	print(pcall_result2)
else
	print("Client Item-Spawn: LOADED")
	_G.ItemSpawnHandlerEnabled = true
end
