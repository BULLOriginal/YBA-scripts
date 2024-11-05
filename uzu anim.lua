


local Parent_upvr = script.Parent
local Humanoid_upvr = Parent_upvr:WaitForChild("Humanoid")
local var11_upvw = "Standing"
local pcall_result1_3, pcall_result2_2 = pcall(function() -- Line 7
	return UserSettings():IsUserFeatureEnabled("UserNoUpdateOnLoop")
end)
local var15_upvr = pcall_result1_3 and pcall_result2_2
local pcall_result1_2, pcall_result2 = pcall(function() -- Line 10
	return UserSettings():IsUserFeatureEnabled("UserAnimateScaleRun")
end)
local var19_upvr = pcall_result1_2 and pcall_result2
local function getRigScale_upvr() -- Line 13, Named "getRigScale"
	--[[ Upvalues[2]:
		[1]: var19_upvr (readonly)
		[2]: Parent_upvr (readonly)
	]]
	if var19_upvr then
		return Parent_upvr:GetScale()
	end
	return 1
end
local var20_upvw = ""
local var21_upvw
local var22_upvw
local var23_upvw
local var24_upvw = 1
local var25_upvw
local var26_upvw
local tbl_upvr_3 = {}
local tbl_upvr = {
	idle = {{
		id = "http://www.roblox.com/asset/?id=507766666";
		weight = 1;
	}, {
		id = "http://www.roblox.com/asset/?id=507766951";
		weight = 1;
	}, {
		id = "http://www.roblox.com/asset/?id=507766388";
		weight = 9;
	}};
	walk = {{
		id = "http://www.roblox.com/asset/?id=507777826";
		weight = 10;
	}};
	run = {{
		id = "http://www.roblox.com/asset/?id=507767714";
		weight = 10;
	}};
	swim = {{
		id = "http://www.roblox.com/asset/?id=507784897";
		weight = 10;
	}};
	swimidle = {{
		id = "http://www.roblox.com/asset/?id=507785072";
		weight = 10;
	}};
	jump = {{
		id = "http://www.roblox.com/asset/?id=507765000";
		weight = 10;
	}};
	fall = {{
		id = "http://www.roblox.com/asset/?id=507767968";
		weight = 10;
	}};
	climb = {{
		id = "http://www.roblox.com/asset/?id=507765644";
		weight = 10;
	}};
	sit = {{
		id = "http://www.roblox.com/asset/?id=2506281703";
		weight = 10;
	}};
	toolnone = {{
		id = "http://www.roblox.com/asset/?id=507768375";
		weight = 10;
	}};
	toolslash = {{
		id = "http://www.roblox.com/asset/?id=522635514";
		weight = 10;
	}};
	toollunge = {{
		id = "http://www.roblox.com/asset/?id=522638767";
		weight = 10;
	}};
	wave = {{
		id = "http://www.roblox.com/asset/?id=507770239";
		weight = 10;
	}};
	point = {{
		id = "http://www.roblox.com/asset/?id=507770453";
		weight = 10;
	}};
	dance = {{
		id = "http://www.roblox.com/asset/?id=507771019";
		weight = 10;
	}, {
		id = "http://www.roblox.com/asset/?id=507771955";
		weight = 10;
	}, {
		id = "http://www.roblox.com/asset/?id=507772104";
		weight = 10;
	}};
	dance2 = {{
		id = "http://www.roblox.com/asset/?id=507776043";
		weight = 10;
	}, {
		id = "http://www.roblox.com/asset/?id=507776720";
		weight = 10;
	}, {
		id = "http://www.roblox.com/asset/?id=507776879";
		weight = 10;
	}};
	dance3 = {{
		id = "http://www.roblox.com/asset/?id=507777268";
		weight = 10;
	}, {
		id = "http://www.roblox.com/asset/?id=507777451";
		weight = 10;
	}, {
		id = "http://www.roblox.com/asset/?id=507777623";
		weight = 10;
	}};
	laugh = {{
		id = "http://www.roblox.com/asset/?id=507770818";
		weight = 10;
	}};
	cheer = {{
		id = "http://www.roblox.com/asset/?id=507770677";
		weight = 10;
	}};
}
local tbl_upvr_4 = {
	wave = false;
	point = false;
	dance = true;
	dance2 = true;
	dance3 = true;
	laugh = false;
	cheer = false;
}
math.randomseed(tick())
function findExistingAnimationInSet(arg1, arg2) -- Line 111
	if arg1 == nil or arg2 == nil then
		return 0
	end
	for i = 1, arg1.count do
		if arg1[i].anim.AnimationId == arg2.AnimationId then
			return i
		end
	end
	return 0
end
local tbl_upvr_2 = {}
function configureAnimationSet(arg1, arg2) -- Line 125
	--[[ Upvalues[3]:
		[1]: tbl_upvr_3 (readonly)
		[2]: tbl_upvr_2 (readonly)
		[3]: Humanoid_upvr (readonly)
	]]
	local var96
	if var96 ~= nil then
		var96 = pairs(tbl_upvr_3[arg1].connections)
		local pairs_result1_4_upvw, pairs_result2, pairs_result3_3 = pairs(tbl_upvr_3[arg1].connections)
		for _, v in pairs_result1_4_upvw, pairs_result2, pairs_result3_3 do
			v:disconnect()
		end
	end
	pairs_result1_4_upvw = tbl_upvr_3
	pairs_result1_4_upvw[arg1] = {}
	pairs_result1_4_upvw = tbl_upvr_3[arg1]
	pairs_result1_4_upvw.count = 0
	pairs_result1_4_upvw = tbl_upvr_3[arg1]
	pairs_result1_4_upvw.totalWeight = 0
	pairs_result1_4_upvw = tbl_upvr_3[arg1]
	pairs_result1_4_upvw.connections = {}
	pairs_result1_4_upvw = true
	local pcall_result1, _ = pcall(function() -- Line 138
		--[[ Upvalues[1]:
			[1]: pairs_result1_4_upvw (read and write)
		]]
		pairs_result1_4_upvw = game:GetService("StarterPlayer").AllowCustomAnimations
	end)
	if not pcall_result1 then
		pairs_result1_4_upvw = true
	end
	local SOME = script:FindFirstChild(arg1)
	if pairs_result1_4_upvw and SOME ~= nil then
		table.insert(tbl_upvr_3[arg1].connections, SOME.ChildAdded:connect(function(arg1_2) -- Line 146
			--[[ Upvalues[2]:
				[1]: arg1 (readonly)
				[2]: arg2 (readonly)
			]]
			configureAnimationSet(arg1, arg2)
		end))
		table.insert(tbl_upvr_3[arg1].connections, SOME.ChildRemoved:connect(function(arg1_3) -- Line 147
			--[[ Upvalues[2]:
				[1]: arg1 (readonly)
				[2]: arg2 (readonly)
			]]
			configureAnimationSet(arg1, arg2)
		end))
		for _, v_2 in pairs(SOME:GetChildren()) do
			if v_2:IsA("Animation") then
				local var109 = 1
				local Weight_2 = v_2:FindFirstChild("Weight")
				if Weight_2 ~= nil then
					var109 = Weight_2.Value
				end
				tbl_upvr_3[arg1].count = tbl_upvr_3[arg1].count + 1
				local count = tbl_upvr_3[arg1].count
				tbl_upvr_3[arg1][count] = {}
				tbl_upvr_3[arg1][count].anim = v_2
				tbl_upvr_3[arg1][count].weight = var109
				tbl_upvr_3[arg1].totalWeight = tbl_upvr_3[arg1].totalWeight + tbl_upvr_3[arg1][count].weight
				table.insert(tbl_upvr_3[arg1].connections, v_2.Changed:connect(function(arg1_4) -- Line 163
					--[[ Upvalues[2]:
						[1]: arg1 (readonly)
						[2]: arg2 (readonly)
					]]
					configureAnimationSet(arg1, arg2)
				end))
				table.insert(tbl_upvr_3[arg1].connections, v_2.ChildAdded:connect(function(arg1_5) -- Line 164
					--[[ Upvalues[2]:
						[1]: arg1 (readonly)
						[2]: arg2 (readonly)
					]]
					configureAnimationSet(arg1, arg2)
				end))
				table.insert(tbl_upvr_3[arg1].connections, v_2.ChildRemoved:connect(function(arg1_6) -- Line 165
					--[[ Upvalues[2]:
						[1]: arg1 (readonly)
						[2]: arg2 (readonly)
					]]
					configureAnimationSet(arg1, arg2)
				end))
			end
		end
	end
	if tbl_upvr_3[arg1].count <= 0 then
		for i_4, v_3 in pairs(arg2) do
			v_2 = tbl_upvr_3[arg1]
			v_2[i_4] = {}
			v_2 = tbl_upvr_3[arg1][i_4]
			v_2.anim = Instance.new("Animation")
			v_2 = tbl_upvr_3[arg1][i_4].anim
			v_2.Name = arg1
			v_2 = tbl_upvr_3[arg1][i_4].anim
			v_2.AnimationId = v_3.id
			v_2 = tbl_upvr_3[arg1][i_4]
			v_2.weight = v_3.weight
			v_2 = tbl_upvr_3[arg1]
			v_2.count = tbl_upvr_3[arg1].count + 1
			v_2 = tbl_upvr_3[arg1]
			v_2.totalWeight = tbl_upvr_3[arg1].totalWeight + v_3.weight
		end
	end
	for _, v_4 in pairs(tbl_upvr_3) do
		for i_6 = 1, v_4.count do
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			if tbl_upvr_2[v_4[i_6].anim.AnimationId] == nil then
				-- KONSTANTERROR: Expression was reused, decompilation is incorrect
				Humanoid_upvr:LoadAnimation(v_4[i_6].anim)
				-- KONSTANTERROR: Expression was reused, decompilation is incorrect
				tbl_upvr_2[v_4[i_6].anim.AnimationId] = true
			end
		end
	end
end
function configureAnimationSetOld(arg1, arg2) -- Line 196
	--[[ Upvalues[2]:
		[1]: tbl_upvr_3 (readonly)
		[2]: Humanoid_upvr (readonly)
	]]
	local var139
	if var139 ~= nil then
		var139 = pairs(tbl_upvr_3[arg1].connections)
		local pairs_result1_upvw, pairs_result2_5, pairs_result3_7 = pairs(tbl_upvr_3[arg1].connections)
		for _, v_5 in pairs_result1_upvw, pairs_result2_5, pairs_result3_7 do
			v_5:disconnect()
		end
	end
	pairs_result1_upvw = tbl_upvr_3
	pairs_result1_upvw[arg1] = {}
	pairs_result1_upvw = tbl_upvr_3[arg1]
	pairs_result1_upvw.count = 0
	pairs_result1_upvw = tbl_upvr_3[arg1]
	pairs_result1_upvw.totalWeight = 0
	pairs_result1_upvw = tbl_upvr_3[arg1]
	pairs_result1_upvw.connections = {}
	pairs_result1_upvw = true
	local pcall_result1_4, _ = pcall(function() -- Line 209
		--[[ Upvalues[1]:
			[1]: pairs_result1_upvw (read and write)
		]]
		pairs_result1_upvw = game:GetService("StarterPlayer").AllowCustomAnimations
	end)
	if not pcall_result1_4 then
		pairs_result1_upvw = true
	end
	local SOME_2 = script:FindFirstChild(arg1)
	if pairs_result1_upvw and SOME_2 ~= nil then
		table.insert(tbl_upvr_3[arg1].connections, SOME_2.ChildAdded:connect(function(arg1_7) -- Line 217
			--[[ Upvalues[2]:
				[1]: arg1 (readonly)
				[2]: arg2 (readonly)
			]]
			configureAnimationSet(arg1, arg2)
		end))
		table.insert(tbl_upvr_3[arg1].connections, SOME_2.ChildRemoved:connect(function(arg1_8) -- Line 218
			--[[ Upvalues[2]:
				[1]: arg1 (readonly)
				[2]: arg2 (readonly)
			]]
			configureAnimationSet(arg1, arg2)
		end))
		local var149 = 1
		for _, v_6 in pairs(SOME_2:GetChildren()) do
			if v_6:IsA("Animation") then
				table.insert(tbl_upvr_3[arg1].connections, v_6.Changed:connect(function(arg1_9) -- Line 222
					--[[ Upvalues[2]:
						[1]: arg1 (readonly)
						[2]: arg2 (readonly)
					]]
					configureAnimationSet(arg1, arg2)
				end))
				tbl_upvr_3[arg1][var149] = {}
				tbl_upvr_3[arg1][var149].anim = v_6
				local Weight = v_6:FindFirstChild("Weight")
				if Weight == nil then
					tbl_upvr_3[arg1][var149].weight = 1
				else
					tbl_upvr_3[arg1][var149].weight = Weight.Value
				end
				tbl_upvr_3[arg1].count = tbl_upvr_3[arg1].count + 1
				tbl_upvr_3[arg1].totalWeight = tbl_upvr_3[arg1].totalWeight + tbl_upvr_3[arg1][var149].weight
			end
		end
	end
	if tbl_upvr_3[arg1].count <= 0 then
		for i_9, v_7 in pairs(arg2) do
			v_6 = tbl_upvr_3[arg1]
			v_6[i_9] = {}
			v_6 = tbl_upvr_3[arg1][i_9]
			v_6.anim = Instance.new("Animation")
			v_6 = tbl_upvr_3[arg1][i_9].anim
			v_6.Name = arg1
			v_6 = tbl_upvr_3[arg1][i_9].anim
			v_6.AnimationId = v_7.id
			v_6 = tbl_upvr_3[arg1][i_9]
			v_6.weight = v_7.weight
			v_6 = tbl_upvr_3[arg1]
			v_6.count = tbl_upvr_3[arg1].count + 1
			v_6 = tbl_upvr_3[arg1]
			v_6.totalWeight = tbl_upvr_3[arg1].totalWeight + v_7.weight
		end
	end
	for _, v_8 in pairs(tbl_upvr_3) do
		for i_11 = 1, v_8.count do
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			Humanoid_upvr:LoadAnimation(v_8[i_11].anim)
		end
	end
end
function scriptChildModified(arg1) -- Line 261
	--[[ Upvalues[1]:
		[1]: tbl_upvr (readonly)
	]]
	local var161 = tbl_upvr[arg1.Name]
	if var161 ~= nil then
		configureAnimationSet(arg1.Name, var161)
	end
end
script.ChildAdded:connect(scriptChildModified)
script.ChildRemoved:connect(scriptChildModified)
local var162
if Humanoid_upvr then
	var162 = Humanoid_upvr:FindFirstChildOfClass("Animator")
else
	var162 = nil
end
if var162 then
	for _, v_9 in ipairs(var162:GetPlayingAnimationTracks()) do
		v_9:Stop(0)
		v_9:Destroy()
	end
end
for i_13, _ in pairs(tbl_upvr) do
	-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [441.27]
	configureAnimationSet(i_13, nil)
end
local var169_upvw = "None"
local var170_upvw = 0
local var171_upvw = false
function stopAllAnimations() -- Line 302
	--[[ Upvalues[8]:
		[1]: var20_upvw (read and write)
		[2]: tbl_upvr_4 (readonly)
		[3]: var171_upvw (read and write)
		[4]: var21_upvw (read and write)
		[5]: var23_upvw (read and write)
		[6]: var22_upvw (read and write)
		[7]: var26_upvw (read and write)
		[8]: var25_upvw (read and write)
	]]
	local var172
	if tbl_upvr_4[var20_upvw] ~= nil and tbl_upvr_4[var172] == false then
		var172 = "idle"
	end
	if var171_upvw then
		var172 = "idle"
		var171_upvw = false
	end
	var20_upvw = ""
	var21_upvw = nil
	if var23_upvw ~= nil then
		var23_upvw:disconnect()
	end
	if var22_upvw ~= nil then
		var22_upvw:Stop()
		var22_upvw:Destroy()
		var22_upvw = nil
	end
	if var26_upvw ~= nil then
		var26_upvw:disconnect()
	end
	if var25_upvw ~= nil then
		var25_upvw:Stop()
		var25_upvw:Destroy()
		var25_upvw = nil
	end
	return var172
end
local ScaleDampeningPercent_upvw = script:FindFirstChild("ScaleDampeningPercent")
function getHeightScale() -- Line 341
	--[[ Upvalues[3]:
		[1]: Humanoid_upvr (readonly)
		[2]: getRigScale_upvr (readonly)
		[3]: ScaleDampeningPercent_upvw (read and write)
	]]
	local var174
	if var174 then
		var174 = Humanoid_upvr.AutomaticScalingEnabled
		if not var174 then
			var174 = getRigScale_upvr()
			return var174
		end
		var174 = Humanoid_upvr.HipHeight / 2
		if ScaleDampeningPercent_upvw == nil then
			ScaleDampeningPercent_upvw = script:FindFirstChild("ScaleDampeningPercent")
		end
		if ScaleDampeningPercent_upvw ~= nil then
			var174 = 1 + (Humanoid_upvr.HipHeight - 2) * ScaleDampeningPercent_upvw.Value / 2
		end
		return var174
	end
	return getRigScale_upvr()
end
local function _(arg1) -- Line 361, Named "rootMotionCompensation"
	return arg1 * 1.25 / getHeightScale()
end
local function setRunSpeed_upvr(arg1) -- Line 369, Named "setRunSpeed"
	--[[ Upvalues[2]:
		[1]: var22_upvw (read and write)
		[2]: var25_upvw (read and write)
	]]
	local var175 = arg1 * 1.25 / getHeightScale()
	local var176 = 0.0001
	local var177 = 0.0001
	local var178 = 1
	if var175 <= 0.5 then
		var176 = 1
		var178 = var175 / 0.5
	elseif var175 < 1 then
		local var179 = (var175 - 0.5) / 0.5
		var176 = 1 - var179
		var177 = var179
	else
		var178 = var175 / 1
		var177 = 1
	end
	var22_upvw:AdjustWeight(var176)
	var25_upvw:AdjustWeight(var177)
	var22_upvw:AdjustSpeed(var178)
	var25_upvw:AdjustSpeed(var178)
end
function setAnimationSpeed(arg1) -- Line 395
	--[[ Upvalues[4]:
		[1]: var20_upvw (read and write)
		[2]: setRunSpeed_upvr (readonly)
		[3]: var24_upvw (read and write)
		[4]: var22_upvw (read and write)
	]]
	if var20_upvw == "walk" then
		setRunSpeed_upvr(arg1)
	elseif arg1 ~= var24_upvw then
		var24_upvw = arg1
		var22_upvw:AdjustSpeed(var24_upvw)
	end
end
function keyFrameReachedFunc(arg1) -- Line 406
	--[[ Upvalues[8]:
		[1]: var20_upvw (read and write)
		[2]: var15_upvr (readonly)
		[3]: var25_upvw (read and write)
		[4]: var22_upvw (read and write)
		[5]: tbl_upvr_4 (readonly)
		[6]: var171_upvw (read and write)
		[7]: var24_upvw (read and write)
		[8]: Humanoid_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [17] 12. Error Block 6 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [17] 12. Error Block 6 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [36] 26. Error Block 22 start (CF ANALYSIS FAILED)
	local var180
	if tbl_upvr_4[var20_upvw] ~= nil and tbl_upvr_4[var180] == false then
		var180 = "idle"
	end
	if var171_upvw then
		if var22_upvw.Looped then return end
		var180 = "idle"
		var171_upvw = false
	end
	playAnimation(var180, 0.15, Humanoid_upvr)
	setAnimationSpeed(var24_upvw)
	-- KONSTANTERROR: [36] 26. Error Block 22 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [67] 52. Error Block 17 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [67] 52. Error Block 17 end (CF ANALYSIS FAILED)
end
function rollAnimation(arg1) -- Line 444
	--[[ Upvalues[1]:
		[1]: tbl_upvr_3 (readonly)
	]]
	local var182
	while tbl_upvr_3[arg1][var182].weight < math.random(1, tbl_upvr_3[arg1].totalWeight) do
		var182 += 1
	end
	return var182
end
local function switchToAnim_upvr(arg1, arg2, arg3, arg4) -- Line 455, Named "switchToAnim"
	--[[ Upvalues[9]:
		[1]: var21_upvw (read and write)
		[2]: var22_upvw (read and write)
		[3]: var25_upvw (read and write)
		[4]: var15_upvr (readonly)
		[5]: var24_upvw (read and write)
		[6]: var20_upvw (read and write)
		[7]: var23_upvw (read and write)
		[8]: tbl_upvr_3 (readonly)
		[9]: var26_upvw (read and write)
	]]
	if arg1 ~= var21_upvw then
		if var22_upvw ~= nil then
			var22_upvw:Stop(arg3)
			var22_upvw:Destroy()
		end
		if var25_upvw ~= nil then
			var25_upvw:Stop(arg3)
			var25_upvw:Destroy()
			if var15_upvr == true then
				var25_upvw = nil
			end
		end
		var24_upvw = 1
		var22_upvw = arg4:LoadAnimation(arg1)
		var22_upvw.Priority = Enum.AnimationPriority.Core
		var22_upvw:Play(arg3)
		var20_upvw = arg2
		var21_upvw = arg1
		if var23_upvw ~= nil then
			var23_upvw:disconnect()
		end
		var23_upvw = var22_upvw.KeyframeReached:connect(keyFrameReachedFunc)
		if arg2 == "walk" then
			var25_upvw = arg4:LoadAnimation(tbl_upvr_3.run[rollAnimation("run")].anim)
			var25_upvw.Priority = Enum.AnimationPriority.Core
			var25_upvw:Play(arg3)
			if var26_upvw ~= nil then
				var26_upvw:disconnect()
			end
			var26_upvw = var25_upvw.KeyframeReached:connect(keyFrameReachedFunc)
		end
	end
end
function playAnimation(arg1, arg2, arg3) -- Line 506
	--[[ Upvalues[3]:
		[1]: tbl_upvr_3 (readonly)
		[2]: switchToAnim_upvr (readonly)
		[3]: var171_upvw (read and write)
	]]
	switchToAnim_upvr(tbl_upvr_3[arg1][rollAnimation(arg1)].anim, arg1, arg2, arg3)
	var171_upvw = false
end
function playEmote(arg1, arg2, arg3) -- Line 514
	--[[ Upvalues[2]:
		[1]: switchToAnim_upvr (readonly)
		[2]: var171_upvw (read and write)
	]]
	switchToAnim_upvr(arg1, arg1.Name, arg2, arg3)
	var171_upvw = true
end
local var183_upvw = ""
local var184_upvw
local var185_upvw
local var186_upvw
function toolKeyFrameReachedFunc(arg1) -- Line 527
	--[[ Upvalues[2]:
		[1]: var183_upvw (read and write)
		[2]: Humanoid_upvr (readonly)
	]]
	if arg1 == "End" then
		playToolAnimation(var183_upvw, 0, Humanoid_upvr)
	end
end
function playToolAnimation(arg1, arg2, arg3, arg4) -- Line 534
	--[[ Upvalues[5]:
		[1]: tbl_upvr_3 (readonly)
		[2]: var185_upvw (read and write)
		[3]: var184_upvw (read and write)
		[4]: var183_upvw (read and write)
		[5]: var186_upvw (read and write)
	]]
	local anim = tbl_upvr_3[arg1][rollAnimation(arg1)].anim
	local var188
	if var185_upvw ~= anim then
		if var184_upvw ~= nil then
			var184_upvw:Stop()
			var184_upvw:Destroy()
			var188 = 0
		end
		var184_upvw = arg3:LoadAnimation(anim)
		if arg4 then
			var184_upvw.Priority = arg4
		end
		var184_upvw:Play(var188)
		var183_upvw = arg1
		var185_upvw = anim
		var186_upvw = var184_upvw.KeyframeReached:connect(toolKeyFrameReachedFunc)
	end
end
function stopToolAnimations() -- Line 561
	--[[ Upvalues[4]:
		[1]: var183_upvw (read and write)
		[2]: var186_upvw (read and write)
		[3]: var185_upvw (read and write)
		[4]: var184_upvw (read and write)
	]]
	if var186_upvw ~= nil then
		var186_upvw:disconnect()
	end
	var183_upvw = ""
	var185_upvw = nil
	if var184_upvw ~= nil then
		var184_upvw:Stop()
		var184_upvw:Destroy()
		var184_upvw = nil
	end
	return var183_upvw
end
function onRunning(arg1) -- Line 583
	--[[ Upvalues[6]:
		[1]: var19_upvr (readonly)
		[2]: var171_upvw (read and write)
		[3]: Humanoid_upvr (readonly)
		[4]: var11_upvw (read and write)
		[5]: tbl_upvr_4 (readonly)
		[6]: var20_upvw (read and write)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var189
	if var189 then
		local _ = getHeightScale()
	else
	end
	var189 = var171_upvw
	if var189 then
		if Humanoid_upvr.MoveDirection ~= Vector3.new(0, 0, 0) then
			var189 = false
		else
			var189 = true
		end
	end
	if not var189 or not (Humanoid_upvr.WalkSpeed / 1) then
	end
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	if 0.75 * 1 < arg1 then
		playAnimation("walk", 0.2, Humanoid_upvr)
		setAnimationSpeed(arg1 / 16)
		var11_upvw = "Running"
	elseif tbl_upvr_4[var20_upvw] == nil and not var171_upvw then
		playAnimation("idle", 0.2, Humanoid_upvr)
		var11_upvw = "Standing"
	end
end
function onDied() -- Line 601
	--[[ Upvalues[1]:
		[1]: var11_upvw (read and write)
	]]
	var11_upvw = "Dead"
end
function onJumping() -- Line 605
	--[[ Upvalues[3]:
		[1]: Humanoid_upvr (readonly)
		[2]: var170_upvw (read and write)
		[3]: var11_upvw (read and write)
	]]
	playAnimation("jump", 0.1, Humanoid_upvr)
	var170_upvw = 0.31
	var11_upvw = "Jumping"
end
function onClimbing(arg1) -- Line 611
	--[[ Upvalues[3]:
		[1]: var19_upvr (readonly)
		[2]: Humanoid_upvr (readonly)
		[3]: var11_upvw (read and write)
	]]
	local var191
	if var19_upvr then
		var191 /= getHeightScale()
	end
	playAnimation("climb", 0.1, Humanoid_upvr)
	setAnimationSpeed(var191 / 5)
	var11_upvw = "Climbing"
end
function onGettingUp() -- Line 621
	--[[ Upvalues[1]:
		[1]: var11_upvw (read and write)
	]]
	var11_upvw = "GettingUp"
end
function onFreeFall() -- Line 625
	--[[ Upvalues[3]:
		[1]: var170_upvw (read and write)
		[2]: Humanoid_upvr (readonly)
		[3]: var11_upvw (read and write)
	]]
	if var170_upvw <= 0 then
		playAnimation("fall", 0.2, Humanoid_upvr)
	end
	var11_upvw = "FreeFall"
end
function onFallingDown() -- Line 632
	--[[ Upvalues[1]:
		[1]: var11_upvw (read and write)
	]]
	var11_upvw = "FallingDown"
end
function onSeated() -- Line 636
	--[[ Upvalues[1]:
		[1]: var11_upvw (read and write)
	]]
	var11_upvw = "Seated"
end
function onPlatformStanding() -- Line 640
	--[[ Upvalues[1]:
		[1]: var11_upvw (read and write)
	]]
	var11_upvw = "PlatformStanding"
end
function onSwimming(arg1) -- Line 647
	--[[ Upvalues[3]:
		[1]: var19_upvr (readonly)
		[2]: Humanoid_upvr (readonly)
		[3]: var11_upvw (read and write)
	]]
	local var192
	if var19_upvr then
		var192 /= getHeightScale()
	end
	if 1 < var192 then
		playAnimation("swim", 0.4, Humanoid_upvr)
		setAnimationSpeed(var192 / 10)
		var11_upvw = "Swimming"
	else
		playAnimation("swimidle", 0.4, Humanoid_upvr)
		var11_upvw = "Standing"
	end
end
function animateTool() -- Line 662
	--[[ Upvalues[2]:
		[1]: var169_upvw (read and write)
		[2]: Humanoid_upvr (readonly)
	]]
	if var169_upvw == "None" then
		playToolAnimation("toolnone", 0.1, Humanoid_upvr, Enum.AnimationPriority.Idle)
	else
		if var169_upvw == "Slash" then
			playToolAnimation("toolslash", 0, Humanoid_upvr, Enum.AnimationPriority.Action)
			return
		end
		if var169_upvw == "Lunge" then
			playToolAnimation("toollunge", 0, Humanoid_upvr, Enum.AnimationPriority.Action)
			return
		end
	end
end
function getToolAnim(arg1) -- Line 679
	for _, v_11 in ipairs(arg1:GetChildren()) do
		if v_11.Name == "toolanim" and v_11.className == "StringValue" then
			return v_11
		end
	end
	return nil
end
local var198_upvw = 0
local var199_upvw = 0
function stepAnimate(arg1) -- Line 690
	--[[ Upvalues[8]:
		[1]: var198_upvw (read and write)
		[2]: var170_upvw (read and write)
		[3]: var11_upvw (read and write)
		[4]: Humanoid_upvr (readonly)
		[5]: Parent_upvr (readonly)
		[6]: var169_upvw (read and write)
		[7]: var199_upvw (read and write)
		[8]: var185_upvw (read and write)
	]]
	var198_upvw = arg1
	if 0 < var170_upvw then
		var170_upvw -= arg1 - var198_upvw
	end
	if var11_upvw == "FreeFall" and var170_upvw <= 0 then
		playAnimation("fall", 0.2, Humanoid_upvr)
	else
		if var11_upvw == "Seated" then
			playAnimation("sit", 0.5, Humanoid_upvr)
			return
		end
		if var11_upvw == "Running" then
			playAnimation("walk", 0.2, Humanoid_upvr)
		elseif var11_upvw == "Dead" or var11_upvw == "GettingUp" or var11_upvw == "FallingDown" or var11_upvw == "Seated" or var11_upvw == "PlatformStanding" then
			stopAllAnimations()
		end
	end
	local class_Tool = Parent_upvr:FindFirstChildOfClass("Tool")
	if class_Tool and class_Tool:FindFirstChild("Handle") then
		local getToolAnim_result1 = getToolAnim(class_Tool)
		if getToolAnim_result1 then
			var169_upvw = getToolAnim_result1.Value
			getToolAnim_result1.Parent = nil
			var199_upvw = arg1 + 0.3
		end
		if var199_upvw < arg1 then
			var199_upvw = 0
			var169_upvw = "None"
		end
		animateTool()
	else
		stopToolAnimations()
		var169_upvw = "None"
		var185_upvw = nil
		var199_upvw = 0
	end
end
Humanoid_upvr.Died:connect(onDied)
Humanoid_upvr.Running:connect(onRunning)
Humanoid_upvr.Jumping:connect(onJumping)
Humanoid_upvr.Climbing:connect(onClimbing)
Humanoid_upvr.GettingUp:connect(onGettingUp)
Humanoid_upvr.FreeFalling:connect(onFreeFall)
Humanoid_upvr.FallingDown:connect(onFallingDown)
Humanoid_upvr.Seated:connect(onSeated)
Humanoid_upvr.PlatformStanding:connect(onPlatformStanding)
Humanoid_upvr.Swimming:connect(onSwimming)
game:GetService("Players").LocalPlayer.Chatted:connect(function(arg1) -- Line 756
	--[[ Upvalues[3]:
		[1]: var11_upvw (read and write)
		[2]: tbl_upvr_4 (readonly)
		[3]: Humanoid_upvr (readonly)
	]]
	local var203
	if string.sub(arg1, 1, 3) == "/e " then
		var203 = string.sub(arg1, 4)
	elseif string.sub(arg1, 1, 7) == "/emote " then
		var203 = string.sub(arg1, 8)
	end
	if var11_upvw == "Standing" and tbl_upvr_4[var203] ~= nil then
		playAnimation(var203, 0.1, Humanoid_upvr)
	end
end)
script:WaitForChild("PlayEmote").OnInvoke = function(arg1) -- Line 770
	--[[ Upvalues[4]:
		[1]: var11_upvw (read and write)
		[2]: tbl_upvr_4 (readonly)
		[3]: Humanoid_upvr (readonly)
		[4]: var22_upvw (read and write)
	]]
	if var11_upvw ~= "Standing" then return end
	if tbl_upvr_4[arg1] ~= nil then
		playAnimation(arg1, 0.1, Humanoid_upvr)
		return true, var22_upvw
	end
	if typeof(arg1) == "Instance" and arg1:IsA("Animation") then
		playEmote(arg1, 0.1, Humanoid_upvr)
		return true, var22_upvw
	end
	return false
end
if Parent_upvr.Parent ~= nil then
	playAnimation("idle", 0.1, Humanoid_upvr)
	var11_upvw = "Standing"
end
while Parent_upvr.Parent ~= nil do
	local _, wait_result2 = wait(0.1)
	stepAnimate(wait_result2)
end
