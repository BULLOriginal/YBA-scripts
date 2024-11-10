-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2024-11-08 16:51:16
-- Luau version 6, Types version 3
-- Time taken: 0.094540 seconds

local ServerStorage_upvr = game:GetService("ServerStorage")
local ReplicatedStorage_upvr = game:GetService("ReplicatedStorage")
local StandLibrary_upvr = require(ServerStorage_upvr.Modules.StandLibrary)
local Sounds_upvr = ReplicatedStorage_upvr:WaitForChild("Sounds")
local Anims_upvr = ServerStorage_upvr:WaitForChild("Anims")
local module_46 = {
	SwordStyle = function(arg1, ...) -- Line 10
		local var8 = ...
		local var9
		if arg1 == "ReturnDamage_Info" then
			local module_41 = {}
			var9 = 7
			module_41.Damage = var9
			var9 = 50
			module_41.Knockback = var9
			local function INLINED() -- Internal function, doesn't exist in bytecode
				var9 = (var8.Hit.Position - var8.Origin.Position).unit
				return var9
			end
			if not var8.Hit or not INLINED() then
				var9 = var8.Origin.CFrame.lookVector
			end
			module_41.KnockbackDirection = var9
			var9 = 0
			module_41.Knockback2 = var9
			var9 = Vector3.new(0, 1, 0)
			module_41.KnockbackDirection2 = var9
			var9 = 0
			module_41.Knock = var9
			var9 = "Sword"
			module_41.Weapon = var9
			var9 = "Default Combat"
			module_41.Style = var9
			var9 = {}
			var9.Name = var8.Tag
			var9.Timer = var8.Timer
			module_41.Tag = var9
			var9 = {}
			var9.Name = var8.Tag
			var9.Timer = 1
			module_41.Stun = var9
			var9 = {}
			var9.Sound = "Blade_Hit1"
			var9.Origin = var8.Hit
			module_41.Sound = var9
			var9 = {}
			var9.Type = "Blade"
			var9.Origin = var8.Hit
			module_41.HitEffect = var9
			var9 = 50
			module_41.Knockback = var9
			var9 = true
			module_41.IsCharacterMelee = var9
			var9 = var8.Combo
			if var9 == "Pierce Strike" then
				var9 = module_41.Stun
				var9.Timer = 0.4
				var9 = nil
				module_41.PerfectBlockable = var9
				var9 = nil
				module_41.Knockback = var9
				var9 = nil
				module_41.Knockback2 = var9
				var9 = nil
				module_41.Knock = var9
				var9 = 8
				module_41.Damage = var9
				var9 = false
				module_41.IgnoreSturdiness = var9
				var9 = true
				module_41.DontStandCrash = var9
				return module_41
			end
			var9 = var8.Combo
			if var9 == "Soaring Tempest" then
				var9 = module_41.Stun
				var9.Timer = 0.5
				var9 = 35
				module_41.Knockback = var9
				var9 = 50
				module_41.Knockback2 = var9
				var9 = 18
				module_41.Damage = var9
				return module_41
			end
			var9 = var8.Combo
			if var9 == "Crescent Slice" then
				var9 = module_41.Stun
				var9.Timer = 0.75
				var9 = 0
				module_41.Knockback = var9
				return module_41
			end
			var9 = var8.Combo
			if var9 == "Unsealed Steel" then
				var9 = module_41.Stun
				var9.Timer = 1
				var9 = 0
				module_41.Knockback = var9
				var9 = 25
				module_41.Damage = var9
				var9 = module_41.HitEffect
				var9.Type = "SharpHeavy"
				var9 = module_41.Sound
				var9.Sound = "Blade_Hit4"
				return module_41
			end
			var9 = var8.Combo
			if var9 == "Mortal Slash" then
				var9 = module_41.Stun
				var9.Timer = 0.5
				var9 = 30
				module_41.Knockback = var9
				var9 = 60
				module_41.Knockback2 = var9
				var9 = 15
				module_41.Damage = var9
				var9 = 1
				module_41.Knock = var9
				var9 = module_41.Sound
				var9.Sound = "Blade_Hit4"
				return module_41
			end
			var9 = var8.Combo
			if var9 == "Blitz Strike" then
				var9 = module_41.Stun
				var9.Timer = 0.5
				var9 = 120
				module_41.Knockback = var9
				var9 = 25
				module_41.Knockback2 = var9
				var9 = 0.3
				module_41.Knock = var9
				var9 = true
				module_41.Beatdown = var9
				var9 = true
				module_41.IgnoreSturdiness = var9
				var9 = true
				module_41.BlockBreaker = var9
				return module_41
			end
			var9 = var8.Combo
			if var9 == "Cookie Beam" then
				var9 = 0
				module_41.Damage = var9
				var9 = module_41.Stun
				var9.Timer = 0.5
				var9 = 0
				module_41.Knockback = var9
				var9 = module_41.Sound
				var9.Sound = "Gore_Splatter2"
				var9 = true
				module_41.BlockBreaker = var9
			end
			return module_41
		end
		if arg1 == "ReturnHitbox" then
			return Vector3.new(5, 5, 6.5)
		end
	end;
	["Shadow The World"] = function(arg1, ...) -- Line 88
		--[[ Upvalues[1]:
			[1]: Anims_upvr (readonly)
		]]
		local var16 = ...
		local tbl_8 = {
			Animations = Anims_upvr.ShadowTheWorldCombat;
			MaxCombo = 5;
			Blocking_Capacity = 56;
			Speed = 0.33;
			Cooldown = 1.25;
			Style = "DefaultCombat";
		}
		if arg1 == "ReturnConfig" then
			do
				return tbl_8
			end
			local var18
		end
		if arg1 == "ReturnDamage_Info" then
			local module_43 = {}
			var18 = 8
			module_43.Damage = var18
			var18 = 45
			module_43.Knockback = var18
			local function INLINED_3() -- Internal function, doesn't exist in bytecode
				var18 = (var16.Hit.Position - var16.Origin.Position).unit
				return var18
			end
			if not var16.Hit or not INLINED_3() then
				var18 = var16.Origin.CFrame.lookVector
			end
			module_43.KnockbackDirection = var18
			var18 = 20
			module_43.Knockback2 = var18
			var18 = Vector3.new(0, 1, 0)
			module_43.KnockbackDirection2 = var18
			var18 = 0.75
			module_43.Knock = var18
			var18 = "Fists"
			module_43.Weapon = var18
			var18 = tbl_8.Style
			module_43.Style = var18
			var18 = {}
			var18.Name = var16.Tag
			var18.Timer = var16.Timer
			module_43.Tag = var18
			var18 = {}
			var18.Name = var16.Tag
			var18.Timer = tbl_8.Speed - tbl_8.Speed / 2.5
			module_43.Stun = var18
			var18 = {}
			var18.Sound = "Fist_Hit"..math.random(1, 2)
			var18.Origin = var16.Hit
			module_43.Sound = var18
			var18 = {}
			var18.Type = "Fists"
			var18.Origin = var16.Hit
			module_43.HitEffect = var18
			var18 = true
			module_43.IsCharacterMelee = var18
			var18 = var16.Combo
			if var18 == "Heavy" then
				var18 = module_43.HitEffect
				var18.Type = "Heavy"
				var18 = {}
				var18.Sound = "Fist_Hit3"
				var18.Origin = var16.Hit
				module_43.Sound = var18
				var18 = 1
				module_43.Knock = var18
				var18 = true
				module_43.BlockBreaker = var18
				var18 = true
				module_43.PerfectBlockable = var18
				var18 = module_43.Damage * 2
				module_43.Damage = var18
				return module_43
			end
			var18 = var16.Combo
			if var18 < tbl_8.MaxCombo then
				var18 = 20
				module_43.Knockback = var18
				var18 = 8
				module_43.Knockback2 = var18
				var18 = 0
				module_43.Knock = var18
				var18 = var16.Combo
				if var18 < tbl_8.MaxCombo - 1 then
					var18 = print
					var18("Default combat has stun of", tbl_8.Speed)
					var18 = module_43.Stun
					var18.Timer = tbl_8.Speed
				end
			end
			return module_43
		end
		if arg1 == "ReturnHitbox" then
			return Vector3.new(5, 6, 3.5)
		end
	end;
	DefaultCombat = function(arg1, ...) -- Line 145
		--[[ Upvalues[1]:
			[1]: Anims_upvr (readonly)
		]]
		local var26 = ...
		local tbl_41 = {
			Animations = Anims_upvr.DefaultCombat;
			MaxCombo = 5;
			Blocking_Capacity = 56;
			Speed = 0.35;
			Cooldown = 1.25;
			Style = "DefaultCombat";
		}
		if arg1 == "ReturnConfig" then
			do
				return tbl_41
			end
			local var28
		end
		if arg1 == "ReturnDamage_Info" then
			local module_37 = {}
			var28 = 4
			module_37.Damage = var28
			var28 = 45
			module_37.Knockback = var28
			local function INLINED_5() -- Internal function, doesn't exist in bytecode
				var28 = (var26.Hit.Position - var26.Origin.Position).unit
				return var28
			end
			if not var26.Hit or not INLINED_5() then
				var28 = var26.Origin.CFrame.lookVector
			end
			module_37.KnockbackDirection = var28
			var28 = 20
			module_37.Knockback2 = var28
			var28 = Vector3.new(0, 1, 0)
			module_37.KnockbackDirection2 = var28
			var28 = 0.75
			module_37.Knock = var28
			var28 = "Fists"
			module_37.Weapon = var28
			var28 = tbl_41.Style
			module_37.Style = var28
			var28 = {}
			var28.Name = var26.Tag
			var28.Timer = var26.Timer
			module_37.Tag = var28
			var28 = {}
			var28.Name = var26.Tag
			var28.Timer = tbl_41.Speed - tbl_41.Speed / 2.5
			module_37.Stun = var28
			var28 = {}
			var28.Sound = "Fist_Hit"..math.random(1, 2)
			var28.Origin = var26.Hit
			module_37.Sound = var28
			var28 = {}
			var28.Type = "Fists"
			var28.Origin = var26.Hit
			module_37.HitEffect = var28
			var28 = true
			module_37.IsCharacterMelee = var28
			var28 = var26.Combo
			if var28 == "Heavy" then
				var28 = module_37.HitEffect
				var28.Type = "Heavy"
				var28 = {}
				var28.Sound = "Fist_Hit3"
				var28.Origin = var26.Hit
				module_37.Sound = var28
				var28 = 1
				module_37.Knock = var28
				var28 = true
				module_37.BlockBreaker = var28
				var28 = true
				module_37.PerfectBlockable = var28
				var28 = module_37.Damage + 2
				module_37.Damage = var28
				return module_37
			end
			var28 = var26.Combo
			if var28 == "Serious Punch" then
				var28 = {}
				var28.Sound = {"OPFistHit", "HeavyPushHit", "Knockback1"}
				var28.Origin = var26.Hit
				module_37.Sound = var28
				var28 = 2
				module_37.Knock = var28
				var28 = true
				module_37.IgnoreBlock = var28
				var28 = nil
				module_37.PerfectBlockable = var28
				var28 = 199
				module_37.Damage = var28
				var28 = 200
				module_37.Knockback = var28
				var28 = 35
				module_37.Knockback2 = var28
				var28 = module_37.HitEffect
				var28.Type = "Jaw Breaker"
				var28 = true
				module_37.HyperArmor = var28
				var28 = true
				module_37.IgnoreInvincibility = var28
				var28 = true
				module_37.NoDamageCancel = var28
				var28 = true
				module_37.IgnoreSturdiness = var28
				var28 = true
				module_37.NoIFrames = var28
				return module_37
			end
			var28 = var26.Combo
			if var28 < tbl_41.MaxCombo then
				var28 = 10
				module_37.Knockback = var28
				var28 = 5
				module_37.Knockback2 = var28
				var28 = 0
				module_37.Knock = var28
				var28 = var26.Combo
				if var28 < tbl_41.MaxCombo - 1 then
					var28 = print
					var28("Default combat has stun of", tbl_41.Speed)
					var28 = module_37.Stun
					var28.Timer = tbl_41.Speed
				end
			end
			return module_37
		end
		if arg1 == "ReturnHitbox" then
			return Vector3.new(5, 6, 3.5)
		end
	end;
	["Six Pistols"] = function(arg1, ...) -- Line 214
		local var32 = ...
		if arg1 == "ReturnDamage_Info" then
			if var32.Combo ~= "Sample" then
			end
			return {
				Damage = 10;
				Knockback = 0;
				Knockback2 = 0;
				KnockbackDirection2 = Vector3.new(0, 1, 0);
				Knock = 0;
				Weapon = "Gun";
				IgnoreBlock = true;
				Style = "Stand";
				Tag = {
					Name = var32.Tag;
					Timer = var32.Timer;
				};
				Stun = {
					Name = var32.Tag;
					Timer = 0.3;
				};
				Sound = {
					Sound = "Blade_Hit"..math.random(1, 3);
					Origin = var32.Hit;
				};
				HitEffect = {
					Type = "Blade";
					Origin = var32.Hit;
				};
				IsProjectile = true;
				NoDamageCancel = true;
			}
		end
	end;
}
local CollectionService_upvr = game:GetService("CollectionService")
module_46["Humanoid Stand"] = function(arg1, ...) -- Line 244
	--[[ Upvalues[6]:
		[1]: StandLibrary_upvr (readonly)
		[2]: Anims_upvr (readonly)
		[3]: ReplicatedStorage_upvr (readonly)
		[4]: Sounds_upvr (readonly)
		[5]: ServerStorage_upvr (readonly)
		[6]: CollectionService_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	local var40 = ...
	local SOME = Anims_upvr:FindFirstChild(var40.Stand.." Combat")
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [38] 28. Error Block 2 start (CF ANALYSIS FAILED)
	;({
		Animations = Anims_upvr["Humanoid Stand Combat"];
		MaxCombo = 5;
		Blocking_Capacity = 76;
		Speed = 0.35;
		Cooldown = 1.25;
		Style = "DefaultCombat";
	}).Animations = SOME
	-- KONSTANTERROR: [38] 28. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [40] 29. Error Block 3 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [40] 29. Error Block 3 end (CF ANALYSIS FAILED)
end
function module_46.Kikoku(arg1, ...) -- Line 2266
	--[[ Upvalues[2]:
		[1]: StandLibrary_upvr (readonly)
		[2]: Anims_upvr (readonly)
	]]
	local var49 = ...
	local tbl_33 = {
		Animations = Anims_upvr["Kikoku Combat"];
		MaxCombo = 5;
		Blocking_Capacity = 100;
		Speed = 0.3;
		Cooldown = 1;
		Style = "DefaultCombat";
	}
	if arg1 == "ReturnConfig" then
		do
			return tbl_33
		end
		local var51
	end
	if arg1 == "ReturnDamage_Info" then
		local Parent_3 = var49.Origin.Parent
		var51 = Parent_3
		if not game.Players:GetPlayerFromCharacter(var51) then
			var51 = Parent_3.Parent
		end
		local module_5 = {}
		var51 = 7
		module_5.Damage = var51
		var51 = 45
		module_5.Knockback = var51
		local function INLINED_7() -- Internal function, doesn't exist in bytecode
			var51 = (var49.Hit.Position - var49.Origin.Position).unit
			return var51
		end
		if not var49.Hit or not INLINED_7() then
			var51 = var49.Origin.CFrame.lookVector
		end
		module_5.KnockbackDirection = var51
		var51 = 20
		module_5.Knockback2 = var51
		var51 = Vector3.new(0, 1, 0)
		module_5.KnockbackDirection2 = var51
		var51 = 0.7
		module_5.Knock = var51
		var51 = "Blade"
		module_5.Weapon = var51
		var51 = tbl_33.Style
		module_5.Style = var51
		var51 = true
		module_5.Stand = var51
		var51 = {}
		var51.Name = var49.Tag
		var51.Timer = var49.Timer
		module_5.Tag = var51
		var51 = {}
		var51.Name = var49.Tag
		var51.Timer = tbl_33.Speed
		module_5.Stun = var51
		var51 = {}
		var51.Sound = "Blade_Hit"..math.random(1, 3)
		var51.Origin = var49.Hit
		module_5.Sound = var51
		var51 = {}
		var51.Type = "Blade"
		var51.Origin = var49.Hit
		module_5.HitEffect = var51
		var51 = true
		module_5.IsCharacterMelee = var51
		var51 = var49.Combo
		if var51 == "Heavy" then
			var51 = module_5.HitEffect
			var51.Type = "SharpHeavy"
			var51 = {}
			var51.Sound = "Stab1"
			var51.Origin = var49.Hit
			module_5.Sound = var51
			var51 = 1
			module_5.Knock = var51
			var51 = true
			module_5.BlockBreaker = var51
			var51 = true
			module_5.PerfectBlockable = var51
			var51 = module_5.Damage + 2
			module_5.Damage = var51
			return module_5
		end
		var51 = var49.Combo
		if var51 < tbl_33.MaxCombo then
			var51 = 10
			module_5.Knockback = var51
			var51 = 5
			module_5.Knockback2 = var51
			var51 = 0
			module_5.Knock = var51
			var51 = var49.Combo
			if var51 < tbl_33.MaxCombo - 1 then
				var51 = module_5.Stun
				var51.Timer = tbl_33.Speed
			end
		end
		return module_5
	end
	if arg1 == "ReturnHitbox" then
		return Vector3.new(5, 5, 6)
	end
end
function module_46.Gaebolg(arg1, ...) -- Line 2327
	--[[ Upvalues[2]:
		[1]: StandLibrary_upvr (readonly)
		[2]: Anims_upvr (readonly)
	]]
	local var60 = ...
	local tbl_32 = {
		Animations = Anims_upvr["Gaebolg Combat"];
		MaxCombo = 5;
		Blocking_Capacity = 76;
		Speed = 0.3;
		Cooldown = 1.25;
		Style = "DefaultCombat";
	}
	if arg1 == "ReturnConfig" then
		do
			return tbl_32
		end
		local var62
	end
	if arg1 == "ReturnDamage_Info" then
		local Parent_2 = var60.Origin.Parent
		var62 = Parent_2
		if not game.Players:GetPlayerFromCharacter(var62) then
			var62 = Parent_2.Parent
		end
		local module_35 = {}
		var62 = 6.5
		module_35.Damage = var62
		var62 = 45
		module_35.Knockback = var62
		local function INLINED_9() -- Internal function, doesn't exist in bytecode
			var62 = (var60.Hit.Position - var60.Origin.Position).unit
			return var62
		end
		if not var60.Hit or not INLINED_9() then
			var62 = var60.Origin.CFrame.lookVector
		end
		module_35.KnockbackDirection = var62
		var62 = 20
		module_35.Knockback2 = var62
		var62 = Vector3.new(0, 1, 0)
		module_35.KnockbackDirection2 = var62
		var62 = 0.5
		module_35.Knock = var62
		var62 = "Fists"
		module_35.Weapon = var62
		var62 = tbl_32.Style
		module_35.Style = var62
		var62 = true
		module_35.Stand = var62
		var62 = {}
		var62.Name = var60.Tag
		var62.Timer = var60.Timer
		module_35.Tag = var62
		var62 = {}
		var62.Name = var60.Tag
		var62.Timer = tbl_32.Speed - tbl_32.Speed / 2.5
		module_35.Stun = var62
		var62 = {}
		var62.Sound = "Gaebolg_Hit"..math.random(1, 2)
		var62.Origin = var60.Hit
		module_35.Sound = var62
		var62 = {}
		var62.Type = "Blade"
		var62.Origin = var60.Hit
		module_35.HitEffect = var62
		var62 = true
		module_35.IsCharacterMelee = var62
		var62 = var60.Combo
		if var62 == "Heavy" then
			var62 = module_35.HitEffect
			var62.Type = "SharpHeavy"
			var62 = {}
			var62.Sound = "Gaebolg_Hit3"
			var62.Origin = var60.Hit
			module_35.Sound = var62
			var62 = 1
			module_35.Knock = var62
			var62 = true
			module_35.BlockBreaker = var62
			var62 = true
			module_35.PerfectBlockable = var62
			var62 = module_35.Damage + 2
			module_35.Damage = var62
			return module_35
		end
		var62 = var60.Combo
		if var62 < tbl_32.MaxCombo then
			var62 = 10
			module_35.Knockback = var62
			var62 = 5
			module_35.Knockback2 = var62
			var62 = 0
			module_35.Knock = var62
			var62 = var60.Combo
			if var62 < tbl_32.MaxCombo - 1 then
				var62 = module_35.Stun
				var62.Timer = tbl_32.Speed
			end
		end
		return module_35
	end
	if arg1 == "ReturnHitbox" then
		return Vector3.new(5, 6, 6)
	end
end
module_46["Gate of Babylon"] = function(arg1, ...) -- Line 2387
	--[[ Upvalues[1]:
		[1]: Anims_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var66 = ...
	local tbl_15 = {
		Animations = Anims_upvr.DefaultCombat;
		MaxCombo = 5;
		Blocking_Capacity = 30;
		Speed = 0.3;
		Cooldown = 1.25;
		Style = "DefaultCombat";
	}
	if arg1 == "ReturnConfig" then
		do
			return tbl_15
		end
		local var68
	end
	if arg1 == "ReturnDamage_Info" then
		local any_GetPlayerFromCharacter_result1 = game.Players:GetPlayerFromCharacter(var66.Origin.Parent)
		if any_GetPlayerFromCharacter_result1 then
			local PlayerStats = any_GetPlayerFromCharacter_result1:findFirstChild("PlayerStats")
		end
		local module_18 = {}
		var68 = 4
		module_18.Damage = var68
		var68 = 30
		module_18.Knockback = var68
		local function INLINED_10() -- Internal function, doesn't exist in bytecode
			var68 = (var66.Hit.Position - var66.Origin.Position).unit
			return var68
		end
		if not var66.Hit or not INLINED_10() then
			var68 = var66.Origin.CFrame.lookVector
		end
		module_18.KnockbackDirection = var68
		var68 = 10
		module_18.Knockback2 = var68
		var68 = Vector3.new(0, 1, 0)
		module_18.KnockbackDirection2 = var68
		var68 = 0.5
		module_18.Knock = var68
		var68 = "Fists"
		module_18.Weapon = var68
		var68 = tbl_15.Style
		module_18.Style = var68
		var68 = {}
		var68.Name = var66.Tag
		var68.Timer = var66.Timer
		module_18.Tag = var68
		var68 = {}
		var68.Name = var66.Tag
		var68.Timer = tbl_15.Speed - 0.15
		module_18.Stun = var68
		var68 = {}
		var68.Sound = "Fist_Hit"..math.random(1, 2)
		var68.Origin = var66.Hit
		module_18.Sound = var68
		var68 = {}
		var68.Type = "Fists"
		var68.Origin = var66.Hit
		module_18.HitEffect = var68
		var68 = true
		module_18.NoDamageCancel = var68
		var68 = var66.Combo
		if var68 == "Sword of Babylon" then
			var68 = module_18.Sound
			var68.Sound = "Blade_Hit"..math.random(1, 2)
			var68 = module_18.HitEffect
			var68.Type = "Blade"
			var68 = 0
			module_18.Knock = var68
			var68 = 0
			module_18.Knockback = var68
			var68 = 0
			module_18.Knockback2 = var68
			var68 = "Sword"
			module_18.Weapon = var68
			var68 = nil
			if PlayerStats then
				var68 = (5) * (PlayerStats.Level.Value * 0.1)
				if 18 < var68 then
					var68 = 18
				elseif var68 < 5 then
					var68 = 5
				end
			end
			module_18.Damage = var68
			module_18.Style = "Sword of Babylon"
			module_18.Stun.Timer = 0.35
			return module_18
		end
		if var66.Combo == "Weapons of Babylon" then
			module_18.Weapon = "Sword"
			module_18.Sound.Sound = "Blade_Hit"..math.random(1, 2)
			module_18.HitEffect.Type = "Blade"
			module_18.Knock = 0
			module_18.Knockback = 0
			module_18.Knockback2 = 0
			if PlayerStats then
				if 8.5 < (4) * (PlayerStats.Level.Value * 0.1) then
				elseif 8.5 < 4 then
				end
			end
			module_18.Damage = 4
			module_18.Style = "Sword of Babylon"
			module_18.Stun.Timer = 0.35
		end
		return module_18
	end
	if arg1 == "ReturnHitbox" then
		return Vector3.new(5, 6, 6)
	end
end
function module_46.Uzu(arg1, ...) -- Line 2484
	--[[ Upvalues[1]:
		[1]: Anims_upvr (readonly)
	]]
	local var73 = ...
	local tbl_12 = {
		Animations = Anims_upvr.DefaultCombat;
		MaxCombo = 5;
		Blocking_Capacity = 30;
		Speed = 0.3;
		Cooldown = 1.25;
		Style = "DefaultCombat";
	}
	if arg1 == "ReturnConfig" then
		do
			return tbl_12
		end
		local var75
	end
	if arg1 == "ReturnDamage_Info" then
		local module_44 = {}
		var75 = 4
		module_44.Damage = var75
		var75 = 30
		module_44.Knockback = var75
		local function INLINED_11() -- Internal function, doesn't exist in bytecode
			var75 = (var73.Hit.Position - var73.Origin.Position).unit
			return var75
		end
		if not var73.Hit or not INLINED_11() then
			var75 = var73.Origin.CFrame.lookVector
		end
		module_44.KnockbackDirection = var75
		var75 = 10
		module_44.Knockback2 = var75
		var75 = Vector3.new(0, 1, 0)
		module_44.KnockbackDirection2 = var75
		var75 = 0.5
		module_44.Knock = var75
		var75 = "Fists"
		module_44.Weapon = var75
		var75 = tbl_12.Style
		module_44.Style = var75
		var75 = {}
		var75.Name = var73.Tag
		var75.Timer = var73.Timer
		module_44.Tag = var75
		var75 = {}
		var75.Name = var73.Tag
		var75.Timer = tbl_12.Speed - 0.15
		module_44.Stun = var75
		var75 = {}
		var75.Sound = "Fist_Hit"..math.random(1, 2)
		var75.Origin = var73.Hit
		module_44.Sound = var75
		var75 = {}
		var75.Type = "Fists"
		var75.Origin = var73.Hit
		module_44.HitEffect = var75
		var75 = true
		module_44.IsCharacterMelee = var75
		var75 = true
		module_44.NoDamageCancel = var75
		var75 = var73.Combo
		if var75 == "UBW Sword" then
			var75 = "Sword"
			module_44.Weapon = var75
			var75 = module_44.Sound
			var75.Sound = "Blade_Hit"..math.random(1, 2)
			var75 = module_44.HitEffect
			var75.Type = "Blade"
			var75 = 0
			module_44.Knock = var75
			var75 = 6
			module_44.Damage = var75
			var75 = "Unlimited Blade Works"
			module_44.Style = var75
			var75 = module_44.Stun
			var75.Timer = 0.35
			return module_44
		end
		var75 = var73.Combo
		if var75 == "Quick Fire" then
			var75 = module_44.Sound
			var75.Sound = "Blade_Hit"..math.random(1, 2)
			var75 = module_44.HitEffect
			var75.Type = "Blade"
			var75 = 1
			module_44.Knock = var75
			var75 = 30
			module_44.Knockback2 = var75
			var75 = 50
			module_44.Knockback = var75
			var75 = 12
			module_44.Damage = var75
			var75 = "Unlimited Blade Works"
			module_44.Style = var75
			var75 = true
			module_44.BlockBreaker = var75
			return module_44
		end
		var75 = var73.Combo
		if var75 == "Charged Shot" then
			var75 = module_44.Sound
			var75.Sound = "Blade_Hit"..math.random(1, 2)
			var75 = module_44.HitEffect
			var75.Type = "Blade"
			var75 = 2
			module_44.Knock = var75
			var75 = 50
			module_44.Knockback2 = var75
			var75 = 75
			module_44.Knockback = var75
			var75 = 30
			module_44.Damage = var75
			var75 = "Unlimited Blade Works"
			module_44.Style = var75
			var75 = true
			module_44.BlockBreaker = var75
		end
		return module_44
	end
	if arg1 == "ReturnHitbox" then
		return Vector3.new(5, 6, 6)
	end
end
module_46["Hamon (Jonathan Joestar)"] = function(arg1, ...) -- Line 2551
	local var78 = ...
	local var79
	if arg1 == "ReturnDamage_Info" then
		local module_45 = {}
		var79 = 17.5
		module_45.Damage = var79
		var79 = 0
		module_45.Knockback = var79
		local function INLINED_12() -- Internal function, doesn't exist in bytecode
			var79 = (var78.Hit.Position - var78.Origin.Position).unit
			return var79
		end
		if not var78.Hit or not INLINED_12() then
			var79 = var78.Origin.CFrame.lookVector
		end
		module_45.KnockbackDirection = var79
		var79 = 0
		module_45.Knockback2 = var79
		var79 = Vector3.new(0, 1, 0)
		module_45.KnockbackDirection2 = var79
		var79 = 0
		module_45.Knock = var79
		var79 = "Fists"
		module_45.Weapon = var79
		var79 = "Default Combat"
		module_45.Style = var79
		var79 = {}
		var79.Name = var78.Tag
		var79.Timer = var78.Timer
		module_45.Tag = var79
		var79 = {}
		var79.Name = var78.Tag
		var79.Timer = 0.3
		module_45.Stun = var79
		var79 = {}
		var79.Sound = "Fist_Hit3"
		var79.Origin = var78.Hit
		module_45.Sound = var79
		var79 = {}
		var79.Type = "Fists"
		var79.Origin = var78.Hit
		module_45.HitEffect = var79
		var79 = true
		module_45.IsCharacterMelee = var79
		var79 = var78.Combo
		if var79 == "Zoom Punch" then
			var79 = module_45.Stun
			var79.Timer = 1.25
			var79 = 12.5
			module_45.Damage = var79
			var79 = module_45.Sound
			var79.Sound = "Fist_Hit3"
			var79 = nil
			module_45.Knockback = var79
			var79 = nil
			module_45.Knockback2 = var79
			var79 = "SmallHit"
			module_45.HitType = var79
			var79 = true
			module_45.IsCharacterMelee = var79
			return module_45
		end
		var79 = var78.Combo
		if var79 == "Scarlet Overdrive" then
			var79 = 20
			module_45.Damage = var79
			var79 = module_45.Sound
			var79.Sound = "Stand Heavy Punch"
			var79 = true
			module_45.BlockBreaker = var79
			var79 = 65
			module_45.Knockback = var79
			var79 = 20
			module_45.Knockback2 = var79
			var79 = 1
			module_45.Knock = var79
			var79 = "HeavyHit"
			module_45.HitType = var79
			var79 = true
			module_45.IsCharacterMelee = var79
			return module_45
		end
		var79 = var78.Combo
		if var79 == "Metal Silver Overdrive" then
			var79 = module_45.Stun
			var79.Timer = 1
			var79 = 15
			module_45.Damage = var79
			var79 = module_45.Sound
			var79.Sound = "Blade_Hit4"
			var79 = module_45.HitEffect
			var79.Type = "SharpHeavy"
			var79 = "SmallHit"
			module_45.HitType = var79
			var79 = true
			module_45.IsCharacterMelee = var79
			var79 = nil
			module_45.Knockback = var79
			var79 = nil
			module_45.Knockback2 = var79
			return module_45
		end
		var79 = var78.Combo
		if var79 == "Sendo Overdrive" then
			var79 = nil
			module_45.Knockback = var79
			var79 = nil
			module_45.Knockback2 = var79
			var79 = module_45.Stun
			var79.Timer = 0.5
			var79 = 0
			module_45.Damage = var79
			var79 = module_45.Sound
			var79.Sound = "Fist_Hit"..math.random(1, 2)
			var79 = true
			module_45.IsCharacterMelee = var79
			return module_45
		end
		var79 = var78.Combo
		if var79 == "Luck & Pluck" then
			var79 = module_45.Stun
			var79.Timer = 0
			var79 = 2
			module_45.Knock = var79
			var79 = 30
			module_45.Damage = var79
			var79 = module_45.Sound
			var79.Sound = "Blade_Hit4"
			var79 = module_45.HitEffect
			var79.Type = "SharpHeavy"
			var79 = true
			module_45.BlockBreaker = var79
			var79 = 35
			module_45.Knockback = var79
			var79 = 10
			module_45.Knockback2 = var79
			var79 = "HeavyHit"
			module_45.HitType = var79
			var79 = true
			module_45.IsCharacterMelee = var79
			return module_45
		end
		var79 = var78.Combo
		if var79 == "Sunlight Yellow Overdrive" then
			var79 = nil
			module_45.Knockback = var79
			var79 = nil
			module_45.Knockback2 = var79
			var79 = module_45.Stun
			var79.Timer = 0.5
			var79 = 0
			module_45.Damage = var79
			var79 = module_45.Sound
			var79.Sound = "Fist_Hit"..math.random(1, 2)
			var79 = true
			module_45.IsCharacterMelee = var79
			return module_45
		end
		var79 = var78.Combo
		if var79 == "Yata no Kagami" then
			var79 = {}
			var79.Sound = "Blade_Hit1"
			var79.Origin = var78.Hit
			module_45.Sound = var79
			var79 = 0
			module_45.Knock = var79
			var79 = true
			module_45.IgnoreBlock = var79
			var79 = 10
			module_45.Damage = var79
			var79 = module_45.Stun
			var79.Timer = 3
			var79 = nil
			module_45.Knockback = var79
			var79 = nil
			module_45.Knockback2 = var79
		end
		return module_45
	end
	if arg1 == "ReturnHitbox" then
		return Vector3.new(5, 5, 3)
	end
end
module_46["Hamon (William Zeppeli)"] = function(arg1, ...) -- Line 2640
	local var82 = ...
	local var83
	if arg1 == "ReturnDamage_Info" then
		local module_7 = {}
		var83 = 17.5
		module_7.Damage = var83
		var83 = 0
		module_7.Knockback = var83
		local function INLINED_13() -- Internal function, doesn't exist in bytecode
			var83 = (var82.Hit.Position - var82.Origin.Position).unit
			return var83
		end
		if not var82.Hit or not INLINED_13() then
			var83 = var82.Origin.CFrame.lookVector
		end
		module_7.KnockbackDirection = var83
		var83 = 0
		module_7.Knockback2 = var83
		var83 = Vector3.new(0, 1, 0)
		module_7.KnockbackDirection2 = var83
		var83 = 0
		module_7.Knock = var83
		var83 = "Fists"
		module_7.Weapon = var83
		var83 = "Default Combat"
		module_7.Style = var83
		var83 = {}
		var83.Name = var82.Tag
		var83.Timer = var82.Timer
		module_7.Tag = var83
		var83 = {}
		var83.Name = var82.Tag
		var83.Timer = 0.3
		module_7.Stun = var83
		var83 = {}
		var83.Sound = "Fist_Hit3"
		var83.Origin = var82.Hit
		module_7.Sound = var83
		var83 = {}
		var83.Type = "Fists"
		var83.Origin = var82.Hit
		module_7.HitEffect = var83
		var83 = true
		module_7.IsCharacterMelee = var83
		var83 = var82.Combo
		if var83 == "Sendo Wave Kick" then
			var83 = module_7.Stun
			var83.Timer = 0.45
			var83 = 17
			module_7.Damage = var83
			var83 = 50
			module_7.BlockDamage = var83
			var83 = module_7.Sound
			var83.Sound = "Fist_Hit3"
			var83 = 65
			module_7.Knockback = var83
			var83 = 25
			module_7.Knockback2 = var83
			var83 = "SmallHit"
			module_7.HitType = var83
			var83 = true
			module_7.HyperArmor = var83
			var83 = true
			module_7.NoDamageCancel = var83
			var83 = true
			module_7.IsCharacterMelee = var83
			return module_7
		end
		var83 = var82.Combo
		if var83 == "Tornado Overdrive" then
			var83 = module_7.Stun
			var83.Timer = 0
			var83 = 32.5
			module_7.Damage = var83
			var83 = module_7.Sound
			var83.Sound = "Fist_Hit3"
			var83 = 10
			module_7.Knockback = var83
			var83 = 10
			module_7.Knockback2 = var83
			var83 = 1
			module_7.Knock = var83
			var83 = "SmallHit"
			module_7.HitType = var83
			var83 = true
			module_7.IsCharacterMelee = var83
			var83 = true
			module_7.BlockBreaker = var83
			var83 = true
			module_7.HyperArmor = var83
			var83 = true
			module_7.NoDamageCancel = var83
			var83 = false
			module_7.DontStandCrash = var83
			return module_7
		end
		var83 = var82.Combo
		if var83 == "Zoom Punch" then
			var83 = module_7.Stun
			var83.Timer = 1
			var83 = 12.5
			module_7.Damage = var83
			var83 = module_7.Sound
			var83.Sound = "Fist_Hit3"
			var83 = nil
			module_7.Knockback = var83
			var83 = nil
			module_7.Knockback2 = var83
			var83 = "SmallHit"
			module_7.HitType = var83
			var83 = true
			module_7.IsCharacterMelee = var83
			return module_7
		end
		var83 = var82.Combo
		if var83 == "Sendo Overdrive" then
			var83 = module_7.Stun
			var83.Timer = 0.5
			var83 = true
			module_7.IgnoreBlock = var83
			var83 = 0
			module_7.Damage = var83
			var83 = module_7.Sound
			var83.Sound = "Fist_Hit"..math.random(1, 2)
			var83 = true
			module_7.IgnoreBlock = var83
			var83 = 15
			module_7.Knockback = var83
			var83 = 5
			module_7.Knockback2 = var83
			var83 = true
			module_7.IsCharacterMelee = var83
		end
		return module_7
	end
	if arg1 == "ReturnHitbox" then
		return Vector3.new(5, 5, 3)
	end
end
module_46["Hamon (Joseph Joestar)"] = function(arg1, ...) -- Line 2722
	--[[ Upvalues[1]:
		[1]: Sounds_upvr (readonly)
	]]
	local var86 = ...
	local var87
	if arg1 == "ReturnDamage_Info" then
		local module_14 = {}
		var87 = 17.5
		module_14.Damage = var87
		var87 = 0
		module_14.Knockback = var87
		local function INLINED_14() -- Internal function, doesn't exist in bytecode
			var87 = (var86.Hit.Position - var86.Origin.Position).unit
			return var87
		end
		if not var86.Hit or not INLINED_14() then
			var87 = var86.Origin.CFrame.lookVector
		end
		module_14.KnockbackDirection = var87
		var87 = 0
		module_14.Knockback2 = var87
		var87 = Vector3.new(0, 1, 0)
		module_14.KnockbackDirection2 = var87
		var87 = 0
		module_14.Knock = var87
		var87 = "Fists"
		module_14.Weapon = var87
		var87 = "Default Combat"
		module_14.Style = var87
		var87 = {}
		var87.Name = var86.Tag
		var87.Timer = var86.Timer
		module_14.Tag = var87
		var87 = {}
		var87.Name = var86.Tag
		var87.Timer = 0.3
		module_14.Stun = var87
		var87 = {}
		var87.Sound = "Fist_Hit3"
		var87.Origin = var86.Hit
		module_14.Sound = var87
		var87 = {}
		var87.Type = "Fists"
		var87.Origin = var86.Hit
		module_14.HitEffect = var87
		var87 = true
		module_14.IsCharacterMelee = var87
		var87 = var86.Combo
		if var87 == "Tommy Gun Barrage" then
			var87 = true
			module_14.IsProjectile = var87
			var87 = module_14.Stun
			var87.Timer = 0.75
			var87 = 1.1
			module_14.Damage = var87
			var87 = nil
			module_14.Knockback = var87
			var87 = nil
			module_14.Knockback2 = var87
			var87 = "SmallHit"
			module_14.HitType = var87
			var87 = {}
			var87.Sound = "Blade_Hit"..math.random(1, 3)
			var87.Origin = var86.Hit
			module_14.Sound = var87
			var87 = {}
			var87.Type = "Blade"
			var87.Origin = var86.Hit
			module_14.HitEffect = var87
			return module_14
		end
		var87 = var86.Combo
		if var87 == "Clacker Boomerang" then
			var87 = module_14.Stun
			var87.Timer = 0.95
			var87 = 8
			module_14.Damage = var87
			var87 = module_14.Sound
			var87.Sound = Sounds_upvr["Hamon (Joseph Joestar)"]["Clacker Boomerang"].ClackerBoomeragHit1
			var87 = module_14.HitEffect
			var87.Type = "Blade"
			var87 = nil
			module_14.Knockback = var87
			var87 = true
			module_14.IsProjectile = var87
			var87 = true
			module_14.IsCharacterMelee = var87
			return module_14
		end
		var87 = var86.Combo
		if var87 == "Clacker Volley" then
			var87 = module_14.Stun
			var87.Timer = 0.8
			var87 = 4
			module_14.Damage = var87
			var87 = module_14.Sound
			var87.Sound = "Fist_Hit3"
			var87 = nil
			module_14.Knockback = var87
			var87 = nil
			module_14.Knockback2 = var87
			var87 = "SmallHit"
			module_14.HitType = var87
			return module_14
		end
		var87 = var86.Combo
		if var87 == "Rebuff Overdrive" then
			var87 = module_14.Stun
			var87.Timer = 0.8
			var87 = 24
			module_14.Damage = var87
			var87 = module_14.Sound
			var87.Sound = "Fist_Hit3"
			var87 = 2
			module_14.Knock = var87
			var87 = 45
			module_14.Knockback = var87
			var87 = 20
			module_14.Knockback2 = var87
			var87 = "SmallHit"
			module_14.HitType = var87
			var87 = true
			module_14.BlockBreaker = var87
		end
		return module_14
	end
	if arg1 == "ReturnHitbox" then
		return Vector3.new(5, 5, 3)
	end
end
module_46["Hamon (Caesar Zeppeli)"] = function(arg1, ...) -- Line 2796
	local var90 = ...
	local var91
	if arg1 == "ReturnDamage_Info" then
		local module_47 = {}
		var91 = 17.5
		module_47.Damage = var91
		var91 = 0
		module_47.Knockback = var91
		local function INLINED_15() -- Internal function, doesn't exist in bytecode
			var91 = (var90.Hit.Position - var90.Origin.Position).unit
			return var91
		end
		if not var90.Hit or not INLINED_15() then
			var91 = var90.Origin.CFrame.lookVector
		end
		module_47.KnockbackDirection = var91
		var91 = 0
		module_47.Knockback2 = var91
		var91 = Vector3.new(0, 1, 0)
		module_47.KnockbackDirection2 = var91
		var91 = 0
		module_47.Knock = var91
		var91 = "Fists"
		module_47.Weapon = var91
		var91 = "Default Combat"
		module_47.Style = var91
		var91 = {}
		var91.Name = var90.Tag
		var91.Timer = var90.Timer
		module_47.Tag = var91
		var91 = {}
		var91.Name = var90.Tag
		var91.Timer = 0.3
		module_47.Stun = var91
		var91 = {}
		var91.Sound = "Fist_Hit3"
		var91.Origin = var90.Hit
		module_47.Sound = var91
		var91 = {}
		var91.Type = "Fists"
		var91.Origin = var90.Hit
		module_47.HitEffect = var91
		var91 = true
		module_47.IsCharacterMelee = var91
		var91 = "Caesar"
		module_47.HamonType = var91
		var91 = var90.Combo
		if var91 == "Bubble Launcher" then
			var91 = nil
			module_47.Sound = var91
			var91 = module_47.Stun
			var91.Timer = 0.5
			var91 = nil
			module_47.Knockback = var91
			var91 = nil
			module_47.Knockback2 = var91
			var91 = 0
			module_47.Knock = var91
			var91 = true
			module_47.IsProjectile = var91
			var91 = true
			module_47.NoDamageCancel = var91
			var91 = 2.5
			module_47.Damage = var91
			return module_47
		end
		var91 = var90.Combo
		if var91 == "Bubble Cutter" then
			var91 = nil
			module_47.Sound = var91
			var91 = module_47.Stun
			var91.Timer = 0.3
			var91 = 20
			module_47.Knockback = var91
			var91 = 20
			module_47.Knockback2 = var91
			var91 = 0
			module_47.Knock = var91
			var91 = true
			module_47.IsProjectile = var91
			var91 = true
			module_47.NoDamageCancel = var91
			var91 = true
			module_47.BlockBreaker = var91
			var91 = 7
			module_47.Damage = var91
			return module_47
		end
		var91 = var90.Combo
		if var91 == "Bubble Barrier" then
			var91 = nil
			module_47.Sound = var91
			var91 = 15
			module_47.Knockback = var91
			var91 = 5
			module_47.Knockback2 = var91
			var91 = 1
			module_47.Knock = var91
			var91 = true
			module_47.NoDamageCancel = var91
			var91 = true
			module_47.BlockBreaker = var91
			var91 = 5
			module_47.Damage = var91
			return module_47
		end
		var91 = var90.Combo
		if var91 == "Hamon Hypnosis" then
			var91 = module_47.Stun
			var91.Timer = 1
			var91 = 20
			module_47.Damage = var91
			var91 = module_47.Sound
			var91.Sound = "Fist_Hit3"
			var91 = nil
			module_47.Knockback = var91
			var91 = nil
			module_47.Knockback2 = var91
			var91 = "SmallHit"
			module_47.HitType = var91
			var91 = true
			module_47.IsCharacterMelee = var91
			return module_47
		end
		var91 = var90.Combo
		if var91 == "Bubble Lense" then
			var91 = 1
			module_47.Knock = var91
			var91 = true
			module_47.TrueDamage = var91
			var91 = true
			module_47.NoDamageCancel = var91
			var91 = true
			module_47.IgnoreBlock = var91
			var91 = true
			module_47.IgnoreRagdoll = var91
			var91 = 30
			module_47.Damage = var91
			var91 = true
			module_47.BypassCounters = var91
		end
		return module_47
	end
	if arg1 == "ReturnHitbox" then
		return Vector3.new(5, 5, 3)
	end
end
function module_46.Spin(arg1, ...) -- Line 2880
	local var94 = ...
	local var95
	if arg1 == "ReturnDamage_Info" then
		local module_49 = {}
		var95 = 17.5
		module_49.Damage = var95
		var95 = 50
		module_49.Knockback = var95
		local function INLINED_16() -- Internal function, doesn't exist in bytecode
			var95 = (var94.Hit.Position - var94.Origin.Position).unit
			return var95
		end
		if not var94.Hit or not INLINED_16() then
			var95 = var94.Origin.CFrame.lookVector
		end
		module_49.KnockbackDirection = var95
		var95 = 0
		module_49.Knockback2 = var95
		var95 = Vector3.new(0, 1, 0)
		module_49.KnockbackDirection2 = var95
		var95 = 0
		module_49.Knock = var95
		var95 = "Fists"
		module_49.Weapon = var95
		var95 = "Default Combat"
		module_49.Style = var95
		var95 = {}
		var95.Name = var94.Tag
		var95.Timer = var94.Timer
		module_49.Tag = var95
		var95 = {}
		var95.Name = var94.Tag
		var95.Timer = 1.7
		module_49.Stun = var95
		var95 = {}
		var95.Sound = "Fist_Hit3"
		var95.Origin = var94.Hit
		module_49.Sound = var95
		var95 = {}
		var95.Type = "Fists"
		var95.Origin = var94.Hit
		module_49.HitEffect = var95
		var95 = true
		module_49.Spin = var95
		var95 = true
		module_49.IsCharacterMelee = var95
		var95 = var94.Combo
		if var95 == "Double Steel Ball" then
			var95 = module_49.Stun
			var95.Timer = 0.75
			var95 = 4
			module_49.Damage = var95
			var95 = module_49.Sound
			var95.Sound = "Blade_Hit"..math.random(1, 3)
			var95 = module_49.HitEffect
			var95.Type = "Blade"
			var95 = nil
			module_49.Knockback = var95
			var95 = true
			module_49.NoDamageCancel = var95
			var95 = true
			module_49.IsProjectile = var95
			var95 = true
			module_49.IsCharacterMelee = var95
			var95 = true
			module_49.SpinAbility = var95
			return module_49
		end
		var95 = var94.Combo
		if var95 == "Twisting Spin Punch" then
			var95 = module_49.Stun
			var95.Timer = 0.5
			var95 = nil
			module_49.Knockback = var95
			var95 = nil
			module_49.Knockback2 = var95
			var95 = true
			module_49.Beatdown = var95
			var95 = true
			module_49.BlockBreaker = var95
			var95 = true
			module_49.IsCharacterMelee = var95
			var95 = true
			module_49.SpinAbility = var95
			return module_49
		end
		var95 = var94.Combo
		if var95 == "Steel Ball" then
			var95 = module_49.Stun
			var95.Timer = 0.75
			var95 = 6
			module_49.Damage = var95
			var95 = module_49.Sound
			var95.Sound = "Blade_Hit"..math.random(1, 3)
			var95 = module_49.HitEffect
			var95.Type = "Blade"
			var95 = nil
			module_49.Knockback = var95
			var95 = true
			module_49.NoDamageCancel = var95
			var95 = true
			module_49.IsProjectile = var95
			var95 = true
			module_49.IsCharacterMelee = var95
			var95 = true
			module_49.SpinAbility = var95
			return module_49
		end
		var95 = var94.Combo
		if var95 == "Whirling Steel Ball" then
			var95 = module_49.Stun
			var95.Timer = 0.5
			var95 = 1.5
			module_49.Knock = var95
			var95 = true
			module_49.BlockBreaker = var95
			var95 = 28
			module_49.Damage = var95
			var95 = module_49.Sound
			var95.Sound = "Blade_Hit"..math.random(1, 3)
			var95 = module_49.HitEffect
			var95.Type = "SharpHeavy"
			var95 = true
			module_49.NoDamageCancel = var95
			var95 = true
			module_49.IsProjectile = var95
			var95 = 5
			module_49.Knockback = var95
			var95 = 80
			module_49.Knockback2 = var95
			var95 = true
			module_49.IsCharacterMelee = var95
			var95 = true
			module_49.SpinAbility = var95
			return module_49
		end
		var95 = var94.Combo
		if var95 == "Spin Reflex" then
			var95 = module_49.Stun
			var95.Timer = 0.5
			var95 = true
			module_49.IgnoreBlock = var95
			var95 = 23
			module_49.Damage = var95
			var95 = module_49.Sound
			var95.Sound = "Stand Heavy Punch"
			var95 = module_49.HitEffect
			var95.Type = "Heavy"
			var95 = 0
			module_49.Knock = var95
			var95 = true
			module_49.NoDamageCancel = var95
			var95 = true
			module_49.NoHitAnim = var95
			var95 = true
			module_49.IsCharacterMelee = var95
			var95 = true
			module_49.SpinAbility = var95
		end
		return module_49
	end
	if arg1 == "ReturnHitbox" then
		return Vector3.new(5, 5, 3)
	end
end
module_46["Dragon Sage"] = function(arg1, ...) -- Line 2962
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [323] 203. Error Block 29 start (CF ANALYSIS FAILED)
	-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [323.2]
	do
		return nil
	end
	-- KONSTANTERROR: [323] 203. Error Block 29 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [324] 204. Error Block 38 start (CF ANALYSIS FAILED)
	if arg1 == "ReturnHitbox" then
		return Vector3.new(5, 5, 3)
	end
	-- KONSTANTERROR: [324] 204. Error Block 38 end (CF ANALYSIS FAILED)
end
module_46["Horse Head Bonk"] = function(arg1, ...) -- Line 3061
	local var99 = ...
	local var100
	if arg1 == "ReturnDamage_Info" then
		local module_25 = {}
		var100 = 5
		module_25.Damage = var100
		var100 = 35
		module_25.Knockback = var100
		local function INLINED_17() -- Internal function, doesn't exist in bytecode
			var100 = (var99.Hit.Position - var99.Origin.Position).unit
			return var100
		end
		if not var99.Hit or not INLINED_17() then
			var100 = var99.Origin.CFrame.lookVector
		end
		module_25.KnockbackDirection = var100
		var100 = 35
		module_25.Knockback2 = var100
		var100 = Vector3.new(0, 1, 0)
		module_25.KnockbackDirection2 = var100
		var100 = 2
		module_25.Knock = var100
		var100 = true
		module_25.BlockBreaker = var100
		var100 = "Fists"
		module_25.Weapon = var100
		var100 = "Jaw Breaker"
		module_25.Style = var100
		var100 = {}
		var100.Name = var99.Tag
		var100.Timer = var99.Timer
		module_25.Tag = var100
		var100 = {}
		var100.Sound = "Serious"
		var100.Origin = var99.Hit
		module_25.Sound = var100
		var100 = {}
		var100.Type = "Jaw Breaker"
		var100.Origin = var99.Hit
		module_25.HitEffect = var100
		return module_25
	end
	if arg1 == "ReturnHitbox" then
		return Vector3.new(5, 6, 3.5)
	end
end
module_46["Revolver Bullet"] = function(arg1, ...) -- Line 3087
	local var103 = ...
	local var104
	if arg1 == "ReturnDamage_Info" then
		local module_23 = {}
		var104 = 5
		module_23.Damage = var104
		var104 = 0
		module_23.Knockback = var104
		local function INLINED_18() -- Internal function, doesn't exist in bytecode
			var104 = (var103.Hit.Position - var103.Origin.Position).unit
			return var104
		end
		if not var103.Hit or not INLINED_18() then
			var104 = var103.Origin.CFrame.lookVector
		end
		module_23.KnockbackDirection = var104
		var104 = 0
		module_23.Knockback2 = var104
		var104 = Vector3.new(0, 1, 0)
		module_23.KnockbackDirection2 = var104
		var104 = 0
		module_23.Knock = var104
		var104 = true
		module_23.BlockBreaker = var104
		var104 = "Blade"
		module_23.Weapon = var104
		var104 = "Blade"
		module_23.Style = var104
		var104 = {}
		var104.Name = var103.Tag
		var104.Timer = var103.Timer
		module_23.Tag = var104
		var104 = {}
		var104.Sound = "Blade_Hit"..math.random(1, 3)
		var104.Origin = var103.Hit
		module_23.Sound = var104
		var104 = {}
		var104.Type = "Blade"
		var104.Origin = var103.Hit
		module_23.HitEffect = var104
		var104 = true
		module_23.NoDamageCancel = var104
		var104 = true
		module_23.IsProjectile = var104
		return module_23
	end
	if arg1 == "ReturnHitbox" then
		return Vector3.new(5, 6, 3.5)
	end
end
module_46["Jaw Breaker"] = function(arg1, ...) -- Line 3115
	local var107 = ...
	local var108
	if arg1 == "ReturnDamage_Info" then
		local module_13 = {}
		var108 = 26
		module_13.Damage = var108
		var108 = 25
		module_13.Knockback = var108
		local function INLINED_19() -- Internal function, doesn't exist in bytecode
			var108 = (var107.Hit.Position - var107.Origin.Position).unit
			return var108
		end
		if not var107.Hit or not INLINED_19() then
			var108 = var107.Origin.CFrame.lookVector
		end
		module_13.KnockbackDirection = var108
		var108 = 55
		module_13.Knockback2 = var108
		var108 = Vector3.new(0, 1, 0)
		module_13.KnockbackDirection2 = var108
		var108 = 2
		module_13.Knock = var108
		var108 = true
		module_13.BlockBreaker = var108
		var108 = "Fists"
		module_13.Weapon = var108
		var108 = "Jaw Breaker"
		module_13.Style = var108
		var108 = {}
		var108.Name = var107.Tag
		var108.Timer = var107.Timer
		module_13.Tag = var108
		var108 = {}
		var108.Sound = "Serious"
		var108.Origin = var107.Hit
		module_13.Sound = var108
		var108 = {}
		var108.Type = "Jaw Breaker"
		var108.Origin = var107.Hit
		module_13.HitEffect = var108
		var108 = true
		module_13.IsCharacterMelee = var108
		return module_13
	end
	if arg1 == "ReturnHitbox" then
		return Vector3.new(5, 6, 3.5)
	end
end
function module_46.Vampirism(arg1, ...) -- Line 3142
	--[[ Upvalues[1]:
		[1]: ServerStorage_upvr (readonly)
	]]
	local var111 = ...
	local var112
	if arg1 == "ReturnDamage_Info" then
		local module_29 = {}
		var112 = 18
		module_29.Damage = var112
		var112 = 25
		module_29.Knockback = var112
		local function INLINED_20() -- Internal function, doesn't exist in bytecode
			var112 = (var111.Hit.Position - var111.Origin.Position).unit
			return var112
		end
		if not var111.Hit or not INLINED_20() then
			var112 = var111.Origin.CFrame.lookVector
		end
		module_29.KnockbackDirection = var112
		var112 = 55
		module_29.Knockback2 = var112
		var112 = Vector3.new(0, 1, 0)
		module_29.KnockbackDirection2 = var112
		var112 = 2
		module_29.Knock = var112
		var112 = "Fists"
		module_29.Weapon = var112
		var112 = "Jaw Breaker"
		module_29.Style = var112
		var112 = {}
		var112.Name = var111.Tag
		var112.Timer = var111.Timer
		module_29.Tag = var112
		var112 = {}
		var112.Sound = "Serious"
		var112.Origin = var111.Hit
		module_29.Sound = var112
		var112 = {}
		var112.Type = "Jaw Breaker"
		var112.Origin = var111.Hit
		module_29.HitEffect = var112
		var112 = {}
		var112.Name = var111.Tag
		var112.Timer = 0
		module_29.Stun = var112
		var112 = var111.Combo
		module_29.Combo = var112
		var112 = var111.Combo
		if var112 == "Space Ripper Stingy Eyes" then
			var112 = 20
			module_29.Damage = var112
			var112 = nil
			module_29.Knockback = var112
			var112 = nil
			module_29.Knockback2 = var112
			var112 = 0
			module_29.Knock = var112
			var112 = module_29.Stun
			var112.Timer = 1.2
			var112 = true
			module_29.NoDamageCancel = var112
			var112 = nil
			module_29.IsCharacterMelee = var112
			var112 = module_29.Sound
			var112.Sound = "Gore_Splatter"
			var112 = module_29.HitEffect
			var112.Type = "SharpHeavy"
			var112 = true
			module_29.IgnoreBlock = var112
			var112 = false
			module_29.IgnoreSturdiness = var112
			var112 = true
			module_29.DontStandCrash = var112
			return module_29
		end
		var112 = var111.Combo
		if var112 == "Superhuman Barrage" then
			var112 = nil
			module_29.Knockback = var112
			var112 = nil
			module_29.Knockback2 = var112
			var112 = module_29.Stun
			var112.Timer = 0.5
			var112 = 0
			module_29.Damage = var112
			var112 = 0
			module_29.Knock = var112
			var112 = module_29.Sound
			var112.Sound = "Fist_Hit"..math.random(1, 2)
			var112 = true
			module_29.IsCharacterMelee = var112
			var112 = module_29.HitEffect
			var112.Type = "Fists"
			return module_29
		end
		var112 = var111.Combo
		if var112 == "Zombie Creation" then
			var112 = nil
			module_29.Knockback = var112
			var112 = nil
			module_29.Knockback2 = var112
			var112 = module_29.Stun
			var112.Timer = 1
			var112 = true
			module_29.BlockBreaker = var112
			var112 = 0
			module_29.Damage = var112
			var112 = 0
			module_29.Knock = var112
			var112 = module_29.Sound
			var112.Sound = "Blade_Hit4"
			var112 = true
			module_29.IsCharacterMelee = var112
			var112 = module_29.HitEffect
			var112.Type = "SharpHeavy"
			var112 = ServerStorage_upvr.Anims.SlamHurt1
			module_29.HitAnim = var112
			var112 = true
			module_29.NoDamageCancel = var112
			var112 = 23
			module_29.Damage = var112
			return module_29
		end
		var112 = var111.Combo
		if var112 == "Life Absorption" then
			var112 = nil
			module_29.Knockback = var112
			var112 = nil
			module_29.Knockback2 = var112
			var112 = 0
			module_29.Knock = var112
			var112 = 2
			module_29.Damage = var112
			var112 = module_29.Sound
			var112.Sound = "Grab"
			var112 = var111.Origin.CFrame.lookVector
			module_29.KnockbackDirection = var112
			var112 = nil
			module_29.HitEffect = var112
			var112 = true
			module_29.IsCharacterMelee = var112
			var112 = true
			module_29.NoHitAnim = var112
			return module_29
		end
		var112 = var111.Combo
		if var112 == "Oblivion of Death" then
			var112 = nil
			module_29.Knockback = var112
			var112 = nil
			module_29.Knockback2 = var112
			var112 = 0
			module_29.Knock = var112
			var112 = 2
			module_29.Damage = var112
			var112 = module_29.Sound
			var112.Sound = "Grab"
			var112 = var111.Origin.CFrame.lookVector
			module_29.KnockbackDirection = var112
			var112 = nil
			module_29.HitEffect = var112
			var112 = true
			module_29.IsCharacterMelee = var112
			var112 = true
			module_29.NoHitAnim = var112
			var112 = true
			module_29.PerfectBlockable = var112
			var112 = true
			module_29.IgnoreBlock = var112
			return module_29
		end
		var112 = var111.Combo
		if var112 == "Vaporization Freezing" then
			var112 = nil
			module_29.BlockBreaker = var112
			var112 = nil
			module_29.PerfectBlockable = var112
			var112 = true
			module_29.Beatdown = var112
			var112 = true
			module_29.NoHitAnim = var112
			var112 = nil
			module_29.Sound = var112
			var112 = nil
			module_29.HitEffect = var112
			var112 = nil
			module_29.Stun = var112
			var112 = nil
			module_29.Knockback = var112
			var112 = nil
			module_29.Knockback2 = var112
			var112 = 0
			module_29.Knock = var112
			var112 = nil
			module_29.HitEffect = var112
			var112 = true
			module_29.IsCharacterMelee = var112
		end
		return module_29
	end
	if arg1 == "ReturnHitbox" then
		return Vector3.new(5, 6, 3.5)
	end
end
module_46["Boxing Gloves"] = function(arg1, ...) -- Line 3243
	--[[ Upvalues[2]:
		[1]: Anims_upvr (readonly)
		[2]: ReplicatedStorage_upvr (readonly)
	]]
	local var115 = ...
	local tbl_16 = {
		Animations = Anims_upvr.Boxing;
		MaxCombo = 5;
		Blocking_Capacity = 56;
		Speed = 0.32;
		Cooldown = 1.25;
		Style = "Boxing Gloves";
	}
	if arg1 == "ReturnConfig" then
		do
			return tbl_16
		end
		local var117
	end
	if arg1 == "ReturnDamage_Info" then
		local module_8 = {}
		var117 = 5.5
		module_8.Damage = var117
		var117 = 50
		module_8.Knockback = var117
		local function INLINED_21() -- Internal function, doesn't exist in bytecode
			var117 = (var115.Hit.Position - var115.Origin.Position).unit
			return var117
		end
		if not var115.Hit or not INLINED_21() then
			var117 = var115.Origin.CFrame.lookVector
		end
		module_8.KnockbackDirection = var117
		var117 = 20
		module_8.Knockback2 = var117
		var117 = Vector3.new(0, 1, 0)
		module_8.KnockbackDirection2 = var117
		var117 = 0.5
		module_8.Knock = var117
		var117 = "Fists"
		module_8.Weapon = var117
		var117 = tbl_16.Style
		module_8.Style = var117
		var117 = {}
		var117.Name = var115.Tag
		var117.Timer = var115.Timer
		module_8.Tag = var117
		var117 = {}
		var117.Name = var115.Tag
		var117.Timer = tbl_16.Speed - tbl_16.Speed / 2.5
		module_8.Stun = var117
		var117 = {}
		var117.Sound = "Fist_Hit"..math.random(1, 2)
		var117.Origin = var115.Hit
		module_8.Sound = var117
		var117 = {}
		var117.Type = "Fists"
		var117.Origin = var115.Hit
		module_8.HitEffect = var117
		var117 = true
		module_8.IsCharacterMelee = var117
		var117 = var115.Combo
		if var117 == "Heavy" then
			var117 = module_8.HitEffect
			var117.Type = "Heavy"
			var117 = {}
			var117.Sound = "Fist_Hit3"
			var117.Origin = var115.Hit
			module_8.Sound = var117
			var117 = 1
			module_8.Knock = var117
			var117 = true
			module_8.BlockBreaker = var117
			var117 = true
			module_8.PerfectBlockable = var117
			var117 = 7.5
			module_8.Damage = var117
			return module_8
		end
		var117 = var115.Combo
		if var117 == "Jawbreaker" then
			var117 = 1.5
			module_8.Knock = var117
			var117 = true
			module_8.BlockBreaker = var117
			var117 = 25
			module_8.Damage = var117
			var117 = module_8.HitEffect
			var117.Type = "Heavy"
			var117 = 35
			module_8.Knockback = var117
			var117 = 70
			module_8.Knockback2 = var117
			var117 = module_8.Sound
			var117.Sound = "Serious"
			return module_8
		end
		var117 = var115.Combo
		if var117 == "Knuckle Sandwich" then
			var117 = module_8.Stun
			var117.Timer = 0.5
			var117 = 4
			module_8.Damage = var117
			var117 = 10
			module_8.Knockback = var117
			var117 = 5
			module_8.Knockback2 = var117
			var117 = 0
			module_8.Knock = var117
			return module_8
		end
		var117 = var115.Combo
		if var117 == "Liver Shot" then
			var117 = module_8.Stun
			var117.Timer = 1
			var117 = 12
			module_8.Damage = var117
			var117 = 5
			module_8.Knockback = var117
			var117 = 3
			module_8.Knockback2 = var117
			var117 = module_8.Sound
			var117.Sound = ReplicatedStorage_upvr.Sounds["Crazy Diamond"].HitSounds.StandHit2
			var117 = 0
			module_8.Knock = var117
			return module_8
		end
		var117 = var115.Combo
		if var117 == "Haymaker" then
			var117 = 2
			module_8.Knock = var117
			var117 = true
			module_8.BlockBreaker = var117
			var117 = 35
			module_8.Damage = var117
			var117 = 20
			module_8.Knockback2 = var117
			var117 = 70
			module_8.Knockback = var117
			var117 = module_8.Sound
			var117.Sound = "Serious"
			return module_8
		end
		var117 = var115.Combo
		if var117 < tbl_16.MaxCombo then
			var117 = 10
			module_8.Knockback = var117
			var117 = 5
			module_8.Knockback2 = var117
			var117 = 0
			module_8.Knock = var117
		end
		return module_8
	end
	if arg1 == "ReturnHitbox" then
		return Vector3.new(5, 6, 3.5)
	end
end
module_46["Boxing Claws"] = function(arg1, ...) -- Line 3321
	--[[ Upvalues[1]:
		[1]: Anims_upvr (readonly)
	]]
	local var120 = ...
	local tbl_40 = {
		Animations = Anims_upvr.Boxing;
		MaxCombo = 5;
		Blocking_Capacity = 56;
		Speed = 0.32;
		Cooldown = 1.25;
		Style = "Boxing Gloves";
	}
	if arg1 == "ReturnConfig" then
		do
			return tbl_40
		end
		local var122
	end
	if arg1 == "ReturnDamage_Info" then
		local module_28 = {}
		var122 = 5.5
		module_28.Damage = var122
		var122 = 50
		module_28.Knockback = var122
		local function INLINED_22() -- Internal function, doesn't exist in bytecode
			var122 = (var120.Hit.Position - var120.Origin.Position).unit
			return var122
		end
		if not var120.Hit or not INLINED_22() then
			var122 = var120.Origin.CFrame.lookVector
		end
		module_28.KnockbackDirection = var122
		var122 = 20
		module_28.Knockback2 = var122
		var122 = Vector3.new(0, 1, 0)
		module_28.KnockbackDirection2 = var122
		var122 = 0.5
		module_28.Knock = var122
		var122 = "Fists"
		module_28.Weapon = var122
		var122 = tbl_40.Style
		module_28.Style = var122
		var122 = {}
		var122.Name = var120.Tag
		var122.Timer = var120.Timer
		module_28.Tag = var122
		var122 = {}
		var122.Name = var120.Tag
		var122.Timer = tbl_40.Speed - tbl_40.Speed / 2.5
		module_28.Stun = var122
		var122 = {}
		var122.Sound = "Fist_Hit"..math.random(1, 2)
		var122.Origin = var120.Hit
		module_28.Sound = var122
		var122 = {}
		var122.Type = "Fists"
		var122.Origin = var120.Hit
		module_28.HitEffect = var122
		var122 = true
		module_28.IsCharacterMelee = var122
		var122 = var120.Combo
		if var122 == "Heavy" then
			var122 = module_28.HitEffect
			var122.Type = "Heavy"
			var122 = {}
			var122.Sound = "Fist_Hit3"
			var122.Origin = var120.Hit
			module_28.Sound = var122
			var122 = 1
			module_28.Knock = var122
			var122 = true
			module_28.BlockBreaker = var122
			var122 = true
			module_28.PerfectBlockable = var122
			var122 = 7.5
			module_28.Damage = var122
			return module_28
		end
		var122 = var120.Combo
		if var122 == "Barrage" then
			var122 = 20
			module_28.Knockback = var122
			var122 = 0
			module_28.Knockback2 = var122
			var122 = 0
			module_28.Knock = var122
			var122 = 2.8
			module_28.Damage = var122
			var122 = module_28.Stun
			var122.Timer = 0.4
			return module_28
		end
		var122 = var120.Combo
		if var122 < tbl_40.MaxCombo then
			var122 = 10
			module_28.Knockback = var122
			var122 = 5
			module_28.Knockback2 = var122
			var122 = 0
			module_28.Knock = var122
		end
		return module_28
	end
	if arg1 == "ReturnHitbox" then
		return Vector3.new(5, 6, 3.5)
	end
end
module_46["Bone Gloves"] = function(arg1, ...) -- Line 3377
	--[[ Upvalues[1]:
		[1]: Anims_upvr (readonly)
	]]
	local var125 = ...
	local tbl_9 = {
		Animations = Anims_upvr.Boxing;
		MaxCombo = 5;
		Blocking_Capacity = 56;
		Speed = 0.32;
		Cooldown = 1.25;
		Style = "Boxing Gloves";
	}
	if arg1 == "ReturnConfig" then
		do
			return tbl_9
		end
		local var127
	end
	if arg1 == "ReturnDamage_Info" then
		local module_26 = {}
		var127 = 5.5
		module_26.Damage = var127
		var127 = 50
		module_26.Knockback = var127
		local function INLINED_23() -- Internal function, doesn't exist in bytecode
			var127 = (var125.Hit.Position - var125.Origin.Position).unit
			return var127
		end
		if not var125.Hit or not INLINED_23() then
			var127 = var125.Origin.CFrame.lookVector
		end
		module_26.KnockbackDirection = var127
		var127 = 20
		module_26.Knockback2 = var127
		var127 = Vector3.new(0, 1, 0)
		module_26.KnockbackDirection2 = var127
		var127 = 0.5
		module_26.Knock = var127
		var127 = "Fists"
		module_26.Weapon = var127
		var127 = tbl_9.Style
		module_26.Style = var127
		var127 = {}
		var127.Name = var125.Tag
		var127.Timer = var125.Timer
		module_26.Tag = var127
		var127 = {}
		var127.Name = var125.Tag
		var127.Timer = tbl_9.Speed - tbl_9.Speed / 2.5
		module_26.Stun = var127
		var127 = {}
		var127.Sound = "Fist_Hit"..math.random(1, 2)
		var127.Origin = var125.Hit
		module_26.Sound = var127
		var127 = {}
		var127.Type = "Fists"
		var127.Origin = var125.Hit
		module_26.HitEffect = var127
		var127 = true
		module_26.IsCharacterMelee = var127
		var127 = var125.Combo
		if var127 == "Heavy" then
			var127 = module_26.HitEffect
			var127.Type = "Heavy"
			var127 = {}
			var127.Sound = "Fist_Hit3"
			var127.Origin = var125.Hit
			module_26.Sound = var127
			var127 = 1
			module_26.Knock = var127
			var127 = true
			module_26.BlockBreaker = var127
			var127 = true
			module_26.PerfectBlockable = var127
			var127 = 7.5
			module_26.Damage = var127
			return module_26
		end
		var127 = var125.Combo
		if var127 == "Barrage" then
			var127 = 20
			module_26.Knockback = var127
			var127 = 0
			module_26.Knockback2 = var127
			var127 = 0
			module_26.Knock = var127
			var127 = 2.8
			module_26.Damage = var127
			var127 = module_26.Stun
			var127.Timer = 0.4
			return module_26
		end
		var127 = var125.Combo
		if var127 < tbl_9.MaxCombo then
			var127 = 10
			module_26.Knockback = var127
			var127 = 5
			module_26.Knockback2 = var127
			var127 = 0
			module_26.Knock = var127
		end
		return module_26
	end
	if arg1 == "ReturnHitbox" then
		return Vector3.new(5, 6, 3.5)
	end
end
module_46["Festive Gloves"] = function(arg1, ...) -- Line 3433
	--[[ Upvalues[1]:
		[1]: Anims_upvr (readonly)
	]]
	local var130 = ...
	local tbl_39 = {
		Animations = Anims_upvr.Boxing;
		MaxCombo = 5;
		Blocking_Capacity = 56;
		Speed = 0.32;
		Cooldown = 1.25;
		Style = "Boxing Gloves";
	}
	if arg1 == "ReturnConfig" then
		do
			return tbl_39
		end
		local var132
	end
	if arg1 == "ReturnDamage_Info" then
		local module_36 = {}
		var132 = 5.5
		module_36.Damage = var132
		var132 = 50
		module_36.Knockback = var132
		local function INLINED_24() -- Internal function, doesn't exist in bytecode
			var132 = (var130.Hit.Position - var130.Origin.Position).unit
			return var132
		end
		if not var130.Hit or not INLINED_24() then
			var132 = var130.Origin.CFrame.lookVector
		end
		module_36.KnockbackDirection = var132
		var132 = 20
		module_36.Knockback2 = var132
		var132 = Vector3.new(0, 1, 0)
		module_36.KnockbackDirection2 = var132
		var132 = 0.5
		module_36.Knock = var132
		var132 = "Fists"
		module_36.Weapon = var132
		var132 = tbl_39.Style
		module_36.Style = var132
		var132 = {}
		var132.Name = var130.Tag
		var132.Timer = var130.Timer
		module_36.Tag = var132
		var132 = {}
		var132.Name = var130.Tag
		var132.Timer = tbl_39.Speed - tbl_39.Speed / 2.5
		module_36.Stun = var132
		var132 = {}
		var132.Sound = "Fist_Hit"..math.random(1, 2)
		var132.Origin = var130.Hit
		module_36.Sound = var132
		var132 = {}
		var132.Type = "Fists"
		var132.Origin = var130.Hit
		module_36.HitEffect = var132
		var132 = true
		module_36.IsCharacterMelee = var132
		var132 = var130.Combo
		if var132 == "Heavy" then
			var132 = module_36.HitEffect
			var132.Type = "Heavy"
			var132 = {}
			var132.Sound = "Fist_Hit3"
			var132.Origin = var130.Hit
			module_36.Sound = var132
			var132 = 1
			module_36.Knock = var132
			var132 = true
			module_36.BlockBreaker = var132
			var132 = true
			module_36.PerfectBlockable = var132
			var132 = 7.5
			module_36.Damage = var132
			return module_36
		end
		var132 = var130.Combo
		if var132 == "Barrage" then
			var132 = 20
			module_36.Knockback = var132
			var132 = 0
			module_36.Knockback2 = var132
			var132 = 0
			module_36.Knock = var132
			var132 = 2.8
			module_36.Damage = var132
			var132 = module_36.Stun
			var132.Timer = 0.4
			return module_36
		end
		var132 = var130.Combo
		if var132 < tbl_39.MaxCombo then
			var132 = 10
			module_36.Knockback = var132
			var132 = 5
			module_36.Knockback2 = var132
			var132 = 0
			module_36.Knock = var132
		end
		return module_36
	end
	if arg1 == "ReturnHitbox" then
		return Vector3.new(5, 6, 3.5)
	end
end
module_46["Akuma Gloves"] = function(arg1, ...) -- Line 3489
	--[[ Upvalues[1]:
		[1]: Anims_upvr (readonly)
	]]
	local var139 = ...
	local tbl_3 = {
		Animations = Anims_upvr.Boxing;
		MaxCombo = 5;
		Blocking_Capacity = 56;
		Speed = 0.3;
		Cooldown = 1.25;
		Style = "Akuma Gloves";
	}
	if arg1 == "ReturnConfig" then
		do
			return tbl_3
		end
		local var141
	end
	if arg1 == "ReturnDamage_Info" then
		local module_17 = {}
		var141 = 7
		module_17.Damage = var141
		var141 = 50
		module_17.Knockback = var141
		local function INLINED_26() -- Internal function, doesn't exist in bytecode
			var141 = (var139.Hit.Position - var139.Origin.Position).unit
			return var141
		end
		if not var139.Hit or not INLINED_26() then
			var141 = var139.Origin.CFrame.lookVector
		end
		module_17.KnockbackDirection = var141
		var141 = 20
		module_17.Knockback2 = var141
		var141 = Vector3.new(0, 1, 0)
		module_17.KnockbackDirection2 = var141
		var141 = 0.5
		module_17.Knock = var141
		var141 = "Fists"
		module_17.Weapon = var141
		var141 = tbl_3.Style
		module_17.Style = var141
		var141 = {}
		var141.Name = var139.Tag
		var141.Timer = var139.Timer
		module_17.Tag = var141
		var141 = {}
		var141.Name = var139.Tag
		var141.Timer = tbl_3.Speed - tbl_3.Speed / 2.5
		module_17.Stun = var141
		var141 = {}
		var141.Sound = "Fist_Hit"..math.random(1, 2)
		var141.Origin = var139.Hit
		module_17.Sound = var141
		var141 = {}
		var141.Type = "Fists"
		var141.Origin = var139.Hit
		module_17.HitEffect = var141
		var141 = true
		module_17.IsCharacterMelee = var141
		var141 = var139.Combo
		if var141 == "Heavy" then
			var141 = module_17.HitEffect
			var141.Type = "Heavy"
			var141 = {}
			var141.Sound = "Fist_Hit3"
			var141.Origin = var139.Hit
			module_17.Sound = var141
			var141 = 1
			module_17.Knock = var141
			var141 = true
			module_17.BlockBreaker = var141
			var141 = true
			module_17.PerfectBlockable = var141
			var141 = 12
			module_17.Damage = var141
			return module_17
		end
		var141 = var139.Combo
		if var141 < tbl_3.MaxCombo then
			var141 = 10
			module_17.Knockback = var141
			var141 = 5
			module_17.Knockback2 = var141
			var141 = 0
			module_17.Knock = var141
			var141 = var139.Combo
			if var141 < tbl_3.MaxCombo - 1 then
				var141 = module_17.Stun
				var141.Timer = tbl_3.Speed + tbl_3.Speed / 1
			end
		end
		return module_17
	end
	if arg1 == "ReturnHitbox" then
		return Vector3.new(5, 6, 3.75)
	end
end
function module_46.Shinobi(arg1, ...) -- Line 3543
	--[[ Upvalues[1]:
		[1]: Anims_upvr (readonly)
	]]
	local var144 = ...
	local tbl_38 = {
		Animations = Anims_upvr.Boxing;
		MaxCombo = 5;
		Blocking_Capacity = 56;
		Speed = 0.32;
		Cooldown = 1.25;
		Style = "Pluck";
	}
	if arg1 == "ReturnConfig" then
		do
			return tbl_38
		end
		local var146
	end
	if arg1 == "ReturnDamage_Info" then
		local module_32 = {}
		var146 = 5.5
		module_32.Damage = var146
		var146 = 32
		module_32.Knockback = var146
		local function INLINED_27() -- Internal function, doesn't exist in bytecode
			var146 = (var144.Hit.Position - var144.Origin.Position).unit
			return var146
		end
		if not var144.Hit or not INLINED_27() then
			var146 = var144.Origin.CFrame.lookVector
		end
		module_32.KnockbackDirection = var146
		var146 = 10
		module_32.Knockback2 = var146
		var146 = Vector3.new(0, 1, 0)
		module_32.KnockbackDirection2 = var146
		var146 = 0.5
		module_32.Knock = var146
		var146 = "Sword"
		module_32.Weapon = var146
		var146 = tbl_38.Style
		module_32.Style = var146
		var146 = {}
		var146.Name = var144.Tag
		var146.Timer = var144.Timer
		module_32.Tag = var146
		var146 = {}
		var146.Name = var144.Tag
		var146.Timer = tbl_38.Speed - 0.15
		module_32.Stun = var146
		var146 = {}
		var146.Sound = "Fist_Hit"..math.random(1, 2)
		var146.Origin = var144.Hit
		module_32.Sound = var146
		var146 = {}
		var146.Type = "Fists"
		var146.Origin = var144.Hit
		module_32.HitEffect = var146
		var146 = true
		module_32.IsCharacterMelee = var146
		var146 = var144.Combo
		if var146 == "Owl Slash" then
			var146 = true
			module_32.PerfectBlockable = var146
			var146 = true
			module_32.IgnoreBlock = var146
			var146 = 0
			module_32.Knockback = var146
			var146 = 0
			module_32.Knockback2 = var146
			var146 = nil
			module_32.KnockbackDirection = var146
			var146 = nil
			module_32.KnockbackDirection2 = var146
			var146 = 2
			module_32.Knock = var146
			var146 = 24
			module_32.Damage = var146
			var146 = module_32.Stun
			var146.Timer = 1
			var146 = module_32.Sound
			var146.Sound = "Gore_Splatter2"
			return module_32
		end
		var146 = var144.Combo
		if var146 == "Ressurection" then
			var146 = true
			module_32.IgnoreBlock = var146
			var146 = math.random(1, 4)
			if var146 == 1 then
				module_32.Knockback = -32
			elseif var146 == 2 then
				module_32.Knockback = 32
			elseif var146 == 3 then
				module_32.Knockback = 32
				module_32.KnockbackDirection = var144.Origin.CFrame.rightVector
			elseif var146 == 4 then
				module_32.Knockback = -32
				module_32.KnockbackDirection = var144.Origin.CFrame.rightVector
			end
			module_32.Knockback2 = 35
			module_32.Knock = 2
			module_32.Damage = 20
		end
		return module_32
	end
	if arg1 == "ReturnHitbox" then
		return Vector3.new(5, 6, 3.5)
	end
end
function module_46.Oni(arg1, ...) -- Line 3610
	--[[ Upvalues[1]:
		[1]: Anims_upvr (readonly)
	]]
	local var149 = ...
	local tbl_6 = {
		Animations = Anims_upvr.Boxing;
		MaxCombo = 5;
		Blocking_Capacity = 56;
		Speed = 0.32;
		Cooldown = 1.25;
		Style = "Boxing Gloves";
	}
	if arg1 == "ReturnConfig" then
		do
			return tbl_6
		end
		local var151
	end
	if arg1 == "ReturnDamage_Info" then
		local module_12 = {}
		var151 = 5.5
		module_12.Damage = var151
		var151 = 32
		module_12.Knockback = var151
		local function INLINED_28() -- Internal function, doesn't exist in bytecode
			var151 = (var149.Hit.Position - var149.Origin.Position).unit
			return var151
		end
		if not var149.Hit or not INLINED_28() then
			var151 = var149.Origin.CFrame.lookVector
		end
		module_12.KnockbackDirection = var151
		var151 = 10
		module_12.Knockback2 = var151
		var151 = Vector3.new(0, 1, 0)
		module_12.KnockbackDirection2 = var151
		var151 = 0.5
		module_12.Knock = var151
		var151 = "Fists"
		module_12.Weapon = var151
		var151 = tbl_6.Style
		module_12.Style = var151
		var151 = {}
		var151.Name = var149.Tag
		var151.Timer = var149.Timer
		module_12.Tag = var151
		var151 = {}
		var151.Name = var149.Tag
		var151.Timer = tbl_6.Speed - 0.15
		module_12.Stun = var151
		var151 = {}
		var151.Sound = "Fist_Hit"..math.random(1, 2)
		var151.Origin = var149.Hit
		module_12.Sound = var151
		var151 = {}
		var151.Type = "Fists"
		var151.Origin = var149.Hit
		module_12.HitEffect = var151
		var151 = true
		module_12.IsCharacterMelee = var151
		var151 = var149.Combo
		if var151 == "Misogi" then
			var151 = var149.Origin.CFrame.lookVector
			module_12.KnockbackDirection = var151
			var151 = 30
			module_12.Knockback = var151
			var151 = 0
			module_12.Knockback2 = var151
			var151 = 2
			module_12.Knock = var151
			var151 = 40
			module_12.Damage = var151
			var151 = true
			module_12.NoIFrames = var151
			return module_12
		end
		var151 = var149.Combo
		if var151 == "Axe Kick" then
			var151 = true
			module_12.BlockBreaker = var151
			var151 = 35
			module_12.Knockback2 = var151
			var151 = 3
			module_12.Knock = var151
			var151 = 50
			module_12.Damage = var151
			var151 = true
			module_12.NoDamageCancel = var151
			var151 = math.random(1, 8)
			if var151 == 1 then
				module_12.Knockback = -module_12.Knockback
				return module_12
			end
			if var151 == 2 then
				module_12.Knockback = module_12.Knockback
				return module_12
			end
			if var151 == 3 then
				module_12.Knockback = module_12.Knockback
				module_12.KnockbackDirection = Vector3.new(1, 0, 0)
				return module_12
			end
			if var151 == 4 then
				module_12.Knockback = -module_12.Knockback
				module_12.KnockbackDirection = Vector3.new(1, 0, 0)
				return module_12
			end
			if var151 == 5 then
				module_12.Knockback = module_12.Knockback
				module_12.KnockbackDirection = Vector3.new(0, 0, 1)
				return module_12
			end
			if var151 == 6 then
				module_12.Knockback = -module_12.Knockback
				module_12.KnockbackDirection = Vector3.new(0, 0, 1)
				return module_12
			end
			if var151 == 7 then
				module_12.Knockback = module_12.Knockback
				module_12.KnockbackDirection = Vector3.new(1, 0, 1)
				return module_12
			end
			if var151 == 8 then
				module_12.Knockback = -module_12.Knockback
				module_12.KnockbackDirection = Vector3.new(1, 0, 1)
			end
		end
		return module_12
	end
	if arg1 == "ReturnHitbox" then
		return Vector3.new(5, 6, 3.5)
	end
end
function module_46.Bat(arg1, ...) -- Line 3688
	--[[ Upvalues[1]:
		[1]: Anims_upvr (readonly)
	]]
	local var154 = ...
	local tbl_4 = {
		Animations = Anims_upvr.Pluck;
		MaxCombo = 5;
		Blocking_Capacity = 56;
		Speed = 0.4;
		Cooldown = 1.25;
		Style = "Bat";
	}
	if arg1 == "ReturnConfig" then
		do
			return tbl_4
		end
		local var156
	end
	if arg1 == "ReturnDamage_Info" then
		local module_48 = {}
		var156 = 5
		module_48.Damage = var156
		var156 = 50
		module_48.Knockback = var156
		local function INLINED_29() -- Internal function, doesn't exist in bytecode
			var156 = (var154.Hit.Position - var154.Origin.Position).unit
			return var156
		end
		if not var154.Hit or not INLINED_29() then
			var156 = var154.Origin.CFrame.lookVector
		end
		module_48.KnockbackDirection = var156
		var156 = 20
		module_48.Knockback2 = var156
		var156 = Vector3.new(0, 1, 0)
		module_48.KnockbackDirection2 = var156
		var156 = 0.5
		module_48.Knock = var156
		var156 = tbl_4.Style
		module_48.Style = var156
		var156 = {}
		var156.Name = var154.Tag
		var156.Timer = var154.Timer
		module_48.Tag = var156
		var156 = {}
		var156.Name = var154.Tag
		var156.Timer = tbl_4.Speed - tbl_4.Speed / 2.5
		module_48.Stun = var156
		var156 = {}
		var156.Sound = "Fist_Hit"..math.random(1, 2)
		var156.Origin = var154.Hit
		module_48.Sound = var156
		var156 = {}
		var156.Type = "Fists"
		var156.Origin = var154.Hit
		module_48.HitEffect = var156
		var156 = true
		module_48.IsCharacterMelee = var156
		var156 = var154.Combo
		if var156 == "Heavy" then
			var156 = module_48.HitEffect
			var156.Type = "Heavy"
			var156 = {}
			var156.Sound = "Fist_Hit3"
			var156.Origin = var154.Hit
			module_48.Sound = var156
			var156 = 1
			module_48.Knock = var156
			var156 = true
			module_48.BlockBreaker = var156
			var156 = true
			module_48.PerfectBlockable = var156
			var156 = 9
			module_48.Damage = var156
			return module_48
		end
		var156 = var154.Combo
		if var156 < tbl_4.MaxCombo then
			var156 = 10
			module_48.Knockback = var156
			var156 = 5
			module_48.Knockback2 = var156
			var156 = 0
			module_48.Knock = var156
		end
		return module_48
	end
	if arg1 == "ReturnHitbox" then
		return Vector3.new(5, 5, 3.5)
	end
end
module_46["Stop Sign"] = function(arg1, ...) -- Line 3737
	--[[ Upvalues[1]:
		[1]: Anims_upvr (readonly)
	]]
	local var159 = ...
	local tbl_37 = {
		Animations = Anims_upvr.Pluck;
		MaxCombo = 5;
		Blocking_Capacity = 56;
		Speed = 0.4;
		Cooldown = 1.25;
		Style = "Bat";
	}
	if arg1 == "ReturnConfig" then
		do
			return tbl_37
		end
		local var161
	end
	if arg1 == "ReturnDamage_Info" then
		local module_51 = {}
		var161 = 5
		module_51.Damage = var161
		var161 = 50
		module_51.Knockback = var161
		local function INLINED_30() -- Internal function, doesn't exist in bytecode
			var161 = (var159.Hit.Position - var159.Origin.Position).unit
			return var161
		end
		if not var159.Hit or not INLINED_30() then
			var161 = var159.Origin.CFrame.lookVector
		end
		module_51.KnockbackDirection = var161
		var161 = 20
		module_51.Knockback2 = var161
		var161 = Vector3.new(0, 1, 0)
		module_51.KnockbackDirection2 = var161
		var161 = 0.5
		module_51.Knock = var161
		var161 = tbl_37.Style
		module_51.Style = var161
		var161 = {}
		var161.Name = var159.Tag
		var161.Timer = var159.Timer
		module_51.Tag = var161
		var161 = {}
		var161.Name = var159.Tag
		var161.Timer = tbl_37.Speed - tbl_37.Speed / 2.5
		module_51.Stun = var161
		var161 = {}
		var161.Sound = "Fist_Hit"..math.random(1, 2)
		var161.Origin = var159.Hit
		module_51.Sound = var161
		var161 = {}
		var161.Type = "Fists"
		var161.Origin = var159.Hit
		module_51.HitEffect = var161
		var161 = true
		module_51.IsCharacterMelee = var161
		var161 = "Sword"
		module_51.Weapon = var161
		var161 = var159.Combo
		if var161 == "Heavy" then
			var161 = module_51.HitEffect
			var161.Type = "Heavy"
			var161 = {}
			var161.Sound = "Fist_Hit3"
			var161.Origin = var159.Hit
			module_51.Sound = var161
			var161 = 1
			module_51.Knock = var161
			var161 = true
			module_51.BlockBreaker = var161
			var161 = true
			module_51.PerfectBlockable = var161
			var161 = 9
			module_51.Damage = var161
			return module_51
		end
		var161 = var159.Combo
		if var161 < tbl_37.MaxCombo then
			var161 = 10
			module_51.Knockback = var161
			var161 = 5
			module_51.Knockback2 = var161
			var161 = 0
			module_51.Knock = var161
		end
		return module_51
	end
	if arg1 == "ReturnHitbox" then
		return Vector3.new(5, 5, 3.5)
	end
end
module_46["Candy cane"] = function(arg1, ...) -- Line 3786
	--[[ Upvalues[1]:
		[1]: Anims_upvr (readonly)
	]]
	local var164 = ...
	local tbl_19 = {
		Animations = Anims_upvr.Pluck;
		MaxCombo = 5;
		Blocking_Capacity = 56;
		Speed = 0.4;
		Cooldown = 1.25;
		Style = "Bat";
	}
	if arg1 == "ReturnConfig" then
		do
			return tbl_19
		end
		local var166
	end
	if arg1 == "ReturnDamage_Info" then
		local module_10 = {}
		var166 = 5
		module_10.Damage = var166
		var166 = 50
		module_10.Knockback = var166
		local function INLINED_31() -- Internal function, doesn't exist in bytecode
			var166 = (var164.Hit.Position - var164.Origin.Position).unit
			return var166
		end
		if not var164.Hit or not INLINED_31() then
			var166 = var164.Origin.CFrame.lookVector
		end
		module_10.KnockbackDirection = var166
		var166 = 20
		module_10.Knockback2 = var166
		var166 = Vector3.new(0, 1, 0)
		module_10.KnockbackDirection2 = var166
		var166 = 0.5
		module_10.Knock = var166
		var166 = tbl_19.Style
		module_10.Style = var166
		var166 = "Sword"
		module_10.Weapon = var166
		var166 = {}
		var166.Name = var164.Tag
		var166.Timer = var164.Timer
		module_10.Tag = var166
		var166 = {}
		var166.Name = var164.Tag
		var166.Timer = tbl_19.Speed - tbl_19.Speed / 2.5
		module_10.Stun = var166
		var166 = {}
		var166.Sound = "Fist_Hit"..math.random(1, 2)
		var166.Origin = var164.Hit
		module_10.Sound = var166
		var166 = {}
		var166.Type = "Fists"
		var166.Origin = var164.Hit
		module_10.HitEffect = var166
		var166 = true
		module_10.IsCharacterMelee = var166
		var166 = var164.Combo
		if var166 == "Heavy" then
			var166 = module_10.HitEffect
			var166.Type = "Heavy"
			var166 = {}
			var166.Sound = "Fist_Hit3"
			var166.Origin = var164.Hit
			module_10.Sound = var166
			var166 = 1
			module_10.Knock = var166
			var166 = true
			module_10.BlockBreaker = var166
			var166 = true
			module_10.PerfectBlockable = var166
			var166 = 9
			module_10.Damage = var166
			return module_10
		end
		var166 = var164.Combo
		if var166 < tbl_19.MaxCombo then
			var166 = 10
			module_10.Knockback = var166
			var166 = 5
			module_10.Knockback2 = var166
			var166 = 0
			module_10.Knock = var166
		end
		return module_10
	end
	if arg1 == "ReturnHitbox" then
		return Vector3.new(5, 5, 3.5)
	end
end
function module_46.Pluck(arg1, ...) -- Line 3835
	--[[ Upvalues[1]:
		[1]: Anims_upvr (readonly)
	]]
	local var169 = ...
	local tbl = {
		Animations = Anims_upvr.Pluck;
		MaxCombo = 5;
		Blocking_Capacity = 60;
		Speed = 0.4;
		Cooldown = 1.25;
		Style = "Pluck";
	}
	if arg1 == "ReturnConfig" then
		do
			return tbl
		end
		local var171
	end
	if arg1 == "ReturnDamage_Info" then
		local module_33 = {}
		var171 = 6
		module_33.Damage = var171
		var171 = 50
		module_33.Knockback = var171
		local function INLINED_32() -- Internal function, doesn't exist in bytecode
			var171 = (var169.Hit.Position - var169.Origin.Position).unit
			return var171
		end
		if not var169.Hit or not INLINED_32() then
			var171 = var169.Origin.CFrame.lookVector
		end
		module_33.KnockbackDirection = var171
		var171 = 20
		module_33.Knockback2 = var171
		var171 = Vector3.new(0, 1, 0)
		module_33.KnockbackDirection2 = var171
		var171 = 0.5
		module_33.Knock = var171
		var171 = "Sword"
		module_33.Weapon = var171
		var171 = tbl.Style
		module_33.Style = var171
		var171 = {}
		var171.Name = var169.Tag
		var171.Timer = var169.Timer
		module_33.Tag = var171
		var171 = {}
		var171.Name = var169.Tag
		var171.Timer = tbl.Speed - tbl.Speed / 2.5
		module_33.Stun = var171
		var171 = {}
		var171.Sound = "Blade_Hit"..math.random(1, 2)
		var171.Origin = var169.Hit
		module_33.Sound = var171
		var171 = {}
		var171.Type = "Blade"
		var171.Origin = var169.Hit
		module_33.HitEffect = var171
		var171 = true
		module_33.IsCharacterMelee = var171
		var171 = var169.Combo
		if var171 == "Heavy" then
			var171 = module_33.HitEffect
			var171.Type = "SharpHeavy"
			var171 = {}
			var171.Sound = "Blade_Hit4"
			var171.Origin = var169.Hit
			module_33.Sound = var171
			var171 = 1
			module_33.Knock = var171
			var171 = true
			module_33.BlockBreaker = var171
			var171 = true
			module_33.PerfectBlockable = var171
			var171 = 12
			module_33.Damage = var171
			return module_33
		end
		var171 = var169.Combo
		if var171 < tbl.MaxCombo then
			var171 = 10
			module_33.Knockback = var171
			var171 = 5
			module_33.Knockback2 = var171
			var171 = 0
			module_33.Knock = var171
		end
		return module_33
	end
	if arg1 == "ReturnHitbox" then
		return Vector3.new(5, 5, 6.5)
	end
end
function module_46.Scythe(arg1, ...) -- Line 3885
	--[[ Upvalues[1]:
		[1]: Anims_upvr (readonly)
	]]
	local var174 = ...
	local tbl_36 = {
		Animations = Anims_upvr.Scythe;
		MaxCombo = 5;
		Blocking_Capacity = 60;
		Speed = 0.4;
		Cooldown = 1.25;
		Style = "Pluck";
	}
	if arg1 == "ReturnConfig" then
		do
			return tbl_36
		end
		local var176
	end
	if arg1 == "ReturnDamage_Info" then
		local module_20 = {}
		var176 = 6
		module_20.Damage = var176
		var176 = 50
		module_20.Knockback = var176
		local function INLINED_33() -- Internal function, doesn't exist in bytecode
			var176 = (var174.Hit.Position - var174.Origin.Position).unit
			return var176
		end
		if not var174.Hit or not INLINED_33() then
			var176 = var174.Origin.CFrame.lookVector
		end
		module_20.KnockbackDirection = var176
		var176 = 20
		module_20.Knockback2 = var176
		var176 = Vector3.new(0, 1, 0)
		module_20.KnockbackDirection2 = var176
		var176 = 0.5
		module_20.Knock = var176
		var176 = "Sword"
		module_20.Weapon = var176
		var176 = tbl_36.Style
		module_20.Style = var176
		var176 = {}
		var176.Name = var174.Tag
		var176.Timer = var174.Timer
		module_20.Tag = var176
		var176 = {}
		var176.Name = var174.Tag
		var176.Timer = tbl_36.Speed - tbl_36.Speed / 2.5
		module_20.Stun = var176
		var176 = {}
		var176.Sound = "Blade_Hit"..math.random(1, 2)
		var176.Origin = var174.Hit
		module_20.Sound = var176
		var176 = {}
		var176.Type = "Blade"
		var176.Origin = var174.Hit
		module_20.HitEffect = var176
		var176 = true
		module_20.IsCharacterMelee = var176
		var176 = var174.Combo
		if var176 == "Heavy" then
			var176 = module_20.HitEffect
			var176.Type = "SharpHeavy"
			var176 = {}
			var176.Sound = "Blade_Hit4"
			var176.Origin = var174.Hit
			module_20.Sound = var176
			var176 = 1
			module_20.Knock = var176
			var176 = true
			module_20.BlockBreaker = var176
			var176 = true
			module_20.PerfectBlockable = var176
			var176 = 12
			module_20.Damage = var176
			return module_20
		end
		var176 = var174.Combo
		if var176 < tbl_36.MaxCombo then
			var176 = 10
			module_20.Knockback = var176
			var176 = 5
			module_20.Knockback2 = var176
			var176 = 0
			module_20.Knock = var176
		end
		return module_20
	end
	if arg1 == "ReturnHitbox" then
		return Vector3.new(5, 5, 6.5)
	end
end
module_46["Cursed Scythe"] = function(arg1, ...) -- Line 3935
	--[[ Upvalues[1]:
		[1]: Anims_upvr (readonly)
	]]
	local var179 = ...
	local tbl_26 = {
		Animations = Anims_upvr.Scythe;
		MaxCombo = 5;
		Blocking_Capacity = 60;
		Speed = 0.4;
		Cooldown = 1.25;
		Style = "Pluck";
	}
	if arg1 == "ReturnConfig" then
		do
			return tbl_26
		end
		local var181
	end
	if arg1 == "ReturnDamage_Info" then
		local module_50 = {}
		var181 = 6
		module_50.Damage = var181
		var181 = 50
		module_50.Knockback = var181
		local function INLINED_34() -- Internal function, doesn't exist in bytecode
			var181 = (var179.Hit.Position - var179.Origin.Position).unit
			return var181
		end
		if not var179.Hit or not INLINED_34() then
			var181 = var179.Origin.CFrame.lookVector
		end
		module_50.KnockbackDirection = var181
		var181 = 20
		module_50.Knockback2 = var181
		var181 = Vector3.new(0, 1, 0)
		module_50.KnockbackDirection2 = var181
		var181 = 0.5
		module_50.Knock = var181
		var181 = "Sword"
		module_50.Weapon = var181
		var181 = tbl_26.Style
		module_50.Style = var181
		var181 = {}
		var181.Name = var179.Tag
		var181.Timer = var179.Timer
		module_50.Tag = var181
		var181 = {}
		var181.Name = var179.Tag
		var181.Timer = tbl_26.Speed - tbl_26.Speed / 2.5
		module_50.Stun = var181
		var181 = {}
		var181.Sound = "Blade_Hit"..math.random(1, 2)
		var181.Origin = var179.Hit
		module_50.Sound = var181
		var181 = {}
		var181.Type = "Blade"
		var181.Origin = var179.Hit
		module_50.HitEffect = var181
		var181 = true
		module_50.IsCharacterMelee = var181
		var181 = var179.Combo
		if var181 == "Heavy" then
			var181 = module_50.HitEffect
			var181.Type = "SharpHeavy"
			var181 = {}
			var181.Sound = "Blade_Hit4"
			var181.Origin = var179.Hit
			module_50.Sound = var181
			var181 = 1
			module_50.Knock = var181
			var181 = true
			module_50.BlockBreaker = var181
			var181 = true
			module_50.PerfectBlockable = var181
			var181 = 12
			module_50.Damage = var181
			return module_50
		end
		var181 = var179.Combo
		if var181 < tbl_26.MaxCombo then
			var181 = 10
			module_50.Knockback = var181
			var181 = 5
			module_50.Knockback2 = var181
			var181 = 0
			module_50.Knock = var181
		end
		return module_50
	end
	if arg1 == "ReturnHitbox" then
		return Vector3.new(5, 5, 6.5)
	end
end
module_46["Festive Scythe"] = function(arg1, ...) -- Line 3985
	--[[ Upvalues[1]:
		[1]: Anims_upvr (readonly)
	]]
	local var184 = ...
	local tbl_35 = {
		Animations = Anims_upvr.Scythe;
		MaxCombo = 5;
		Blocking_Capacity = 60;
		Speed = 0.4;
		Cooldown = 1.25;
		Style = "Pluck";
	}
	if arg1 == "ReturnConfig" then
		do
			return tbl_35
		end
		local var186
	end
	if arg1 == "ReturnDamage_Info" then
		local module_4 = {}
		var186 = 6
		module_4.Damage = var186
		var186 = 50
		module_4.Knockback = var186
		local function INLINED_35() -- Internal function, doesn't exist in bytecode
			var186 = (var184.Hit.Position - var184.Origin.Position).unit
			return var186
		end
		if not var184.Hit or not INLINED_35() then
			var186 = var184.Origin.CFrame.lookVector
		end
		module_4.KnockbackDirection = var186
		var186 = 20
		module_4.Knockback2 = var186
		var186 = Vector3.new(0, 1, 0)
		module_4.KnockbackDirection2 = var186
		var186 = 0.5
		module_4.Knock = var186
		var186 = "Sword"
		module_4.Weapon = var186
		var186 = tbl_35.Style
		module_4.Style = var186
		var186 = {}
		var186.Name = var184.Tag
		var186.Timer = var184.Timer
		module_4.Tag = var186
		var186 = {}
		var186.Name = var184.Tag
		var186.Timer = tbl_35.Speed - tbl_35.Speed / 2.5
		module_4.Stun = var186
		var186 = {}
		var186.Sound = "Blade_Hit"..math.random(1, 2)
		var186.Origin = var184.Hit
		module_4.Sound = var186
		var186 = {}
		var186.Type = "Blade"
		var186.Origin = var184.Hit
		module_4.HitEffect = var186
		var186 = true
		module_4.IsCharacterMelee = var186
		var186 = var184.Combo
		if var186 == "Heavy" then
			var186 = module_4.HitEffect
			var186.Type = "SharpHeavy"
			var186 = {}
			var186.Sound = "Blade_Hit4"
			var186.Origin = var184.Hit
			module_4.Sound = var186
			var186 = 1
			module_4.Knock = var186
			var186 = true
			module_4.BlockBreaker = var186
			var186 = true
			module_4.PerfectBlockable = var186
			var186 = 12
			module_4.Damage = var186
			return module_4
		end
		var186 = var184.Combo
		if var186 < tbl_35.MaxCombo then
			var186 = 10
			module_4.Knockback = var186
			var186 = 5
			module_4.Knockback2 = var186
			var186 = 0
			module_4.Knock = var186
		end
		return module_4
	end
	if arg1 == "ReturnHitbox" then
		return Vector3.new(5, 5, 6.5)
	end
end
module_46["Cyber Scythe"] = function(arg1, ...) -- Line 4035
	--[[ Upvalues[1]:
		[1]: Anims_upvr (readonly)
	]]
	local var189 = ...
	local tbl_34 = {
		Animations = Anims_upvr.Scythe;
		MaxCombo = 5;
		Blocking_Capacity = 60;
		Speed = 0.4;
		Cooldown = 1.25;
		Style = "Pluck";
	}
	if arg1 == "ReturnConfig" then
		do
			return tbl_34
		end
		local var191
	end
	if arg1 == "ReturnDamage_Info" then
		local module_27 = {}
		var191 = 6
		module_27.Damage = var191
		var191 = 50
		module_27.Knockback = var191
		local function INLINED_36() -- Internal function, doesn't exist in bytecode
			var191 = (var189.Hit.Position - var189.Origin.Position).unit
			return var191
		end
		if not var189.Hit or not INLINED_36() then
			var191 = var189.Origin.CFrame.lookVector
		end
		module_27.KnockbackDirection = var191
		var191 = 20
		module_27.Knockback2 = var191
		var191 = Vector3.new(0, 1, 0)
		module_27.KnockbackDirection2 = var191
		var191 = 0.5
		module_27.Knock = var191
		var191 = "Sword"
		module_27.Weapon = var191
		var191 = tbl_34.Style
		module_27.Style = var191
		var191 = {}
		var191.Name = var189.Tag
		var191.Timer = var189.Timer
		module_27.Tag = var191
		var191 = {}
		var191.Name = var189.Tag
		var191.Timer = tbl_34.Speed - tbl_34.Speed / 2.5
		module_27.Stun = var191
		var191 = {}
		var191.Sound = "Blade_Hit"..math.random(1, 2)
		var191.Origin = var189.Hit
		module_27.Sound = var191
		var191 = {}
		var191.Type = "Blade"
		var191.Origin = var189.Hit
		module_27.HitEffect = var191
		var191 = true
		module_27.IsCharacterMelee = var191
		var191 = var189.Combo
		if var191 == "Heavy" then
			var191 = module_27.HitEffect
			var191.Type = "SharpHeavy"
			var191 = {}
			var191.Sound = "Blade_Hit4"
			var191.Origin = var189.Hit
			module_27.Sound = var191
			var191 = 1
			module_27.Knock = var191
			var191 = true
			module_27.BlockBreaker = var191
			var191 = true
			module_27.PerfectBlockable = var191
			var191 = 12
			module_27.Damage = var191
			return module_27
		end
		var191 = var189.Combo
		if var191 < tbl_34.MaxCombo then
			var191 = 10
			module_27.Knockback = var191
			var191 = 5
			module_27.Knockback2 = var191
			var191 = 0
			module_27.Knock = var191
		end
		return module_27
	end
	if arg1 == "ReturnHitbox" then
		return Vector3.new(5, 5, 6.5)
	end
end
module_46["Candy Cane Sword"] = function(arg1, ...) -- Line 4085
	--[[ Upvalues[1]:
		[1]: Anims_upvr (readonly)
	]]
	local var194 = ...
	local tbl_30 = {
		Animations = Anims_upvr.Pluck;
		MaxCombo = 5;
		Blocking_Capacity = 60;
		Speed = 0.4;
		Cooldown = 1.25;
		Style = "Pluck";
	}
	if arg1 == "ReturnConfig" then
		do
			return tbl_30
		end
		local var196
	end
	if arg1 == "ReturnDamage_Info" then
		local module_11 = {}
		var196 = 6
		module_11.Damage = var196
		var196 = 50
		module_11.Knockback = var196
		local function INLINED_37() -- Internal function, doesn't exist in bytecode
			var196 = (var194.Hit.Position - var194.Origin.Position).unit
			return var196
		end
		if not var194.Hit or not INLINED_37() then
			var196 = var194.Origin.CFrame.lookVector
		end
		module_11.KnockbackDirection = var196
		var196 = 20
		module_11.Knockback2 = var196
		var196 = Vector3.new(0, 1, 0)
		module_11.KnockbackDirection2 = var196
		var196 = 0.5
		module_11.Knock = var196
		var196 = "Sword"
		module_11.Weapon = var196
		var196 = tbl_30.Style
		module_11.Style = var196
		var196 = {}
		var196.Name = var194.Tag
		var196.Timer = var194.Timer
		module_11.Tag = var196
		var196 = {}
		var196.Name = var194.Tag
		var196.Timer = tbl_30.Speed - tbl_30.Speed / 2.5
		module_11.Stun = var196
		var196 = {}
		var196.Sound = "Blade_Hit"..math.random(1, 2)
		var196.Origin = var194.Hit
		module_11.Sound = var196
		var196 = {}
		var196.Type = "Blade"
		var196.Origin = var194.Hit
		module_11.HitEffect = var196
		var196 = true
		module_11.IsCharacterMelee = var196
		var196 = var194.Combo
		if var196 == "Heavy" then
			var196 = module_11.HitEffect
			var196.Type = "SharpHeavy"
			var196 = {}
			var196.Sound = "Blade_Hit4"
			var196.Origin = var194.Hit
			module_11.Sound = var196
			var196 = 1
			module_11.Knock = var196
			var196 = true
			module_11.BlockBreaker = var196
			var196 = true
			module_11.PerfectBlockable = var196
			var196 = 12
			module_11.Damage = var196
			return module_11
		end
		var196 = var194.Combo
		if var196 < tbl_30.MaxCombo then
			var196 = 10
			module_11.Knockback = var196
			var196 = 5
			module_11.Knockback2 = var196
			var196 = 0
			module_11.Knock = var196
		end
		return module_11
	end
	if arg1 == "ReturnHitbox" then
		return Vector3.new(5, 5, 6.5)
	end
end
module_46["Festive Blade"] = function(arg1, ...) -- Line 4135
	--[[ Upvalues[1]:
		[1]: Anims_upvr (readonly)
	]]
	local var199 = ...
	local tbl_24 = {
		Animations = Anims_upvr.Pluck;
		MaxCombo = 5;
		Blocking_Capacity = 60;
		Speed = 0.4;
		Cooldown = 1.25;
		Style = "Pluck";
	}
	if arg1 == "ReturnConfig" then
		do
			return tbl_24
		end
		local var201
	end
	if arg1 == "ReturnDamage_Info" then
		local module_9 = {}
		var201 = 6
		module_9.Damage = var201
		var201 = 50
		module_9.Knockback = var201
		local function INLINED_38() -- Internal function, doesn't exist in bytecode
			var201 = (var199.Hit.Position - var199.Origin.Position).unit
			return var201
		end
		if not var199.Hit or not INLINED_38() then
			var201 = var199.Origin.CFrame.lookVector
		end
		module_9.KnockbackDirection = var201
		var201 = 20
		module_9.Knockback2 = var201
		var201 = Vector3.new(0, 1, 0)
		module_9.KnockbackDirection2 = var201
		var201 = 0.5
		module_9.Knock = var201
		var201 = "Sword"
		module_9.Weapon = var201
		var201 = tbl_24.Style
		module_9.Style = var201
		var201 = {}
		var201.Name = var199.Tag
		var201.Timer = var199.Timer
		module_9.Tag = var201
		var201 = {}
		var201.Name = var199.Tag
		var201.Timer = tbl_24.Speed - tbl_24.Speed / 2.5
		module_9.Stun = var201
		var201 = {}
		var201.Sound = "Blade_Hit"..math.random(1, 2)
		var201.Origin = var199.Hit
		module_9.Sound = var201
		var201 = {}
		var201.Type = "Blade"
		var201.Origin = var199.Hit
		module_9.HitEffect = var201
		var201 = true
		module_9.IsCharacterMelee = var201
		var201 = var199.Combo
		if var201 == "Heavy" then
			var201 = module_9.HitEffect
			var201.Type = "SharpHeavy"
			var201 = {}
			var201.Sound = "Blade_Hit4"
			var201.Origin = var199.Hit
			module_9.Sound = var201
			var201 = 1
			module_9.Knock = var201
			var201 = true
			module_9.BlockBreaker = var201
			var201 = true
			module_9.PerfectBlockable = var201
			var201 = 12
			module_9.Damage = var201
			return module_9
		end
		var201 = var199.Combo
		if var201 < tbl_24.MaxCombo then
			var201 = 10
			module_9.Knockback = var201
			var201 = 5
			module_9.Knockback2 = var201
			var201 = 0
			module_9.Knock = var201
		end
		return module_9
	end
	if arg1 == "ReturnHitbox" then
		return Vector3.new(5, 5, 6.5)
	end
end
module_46["Candy Cane Blade"] = function(arg1, ...) -- Line 4185
	--[[ Upvalues[1]:
		[1]: Anims_upvr (readonly)
	]]
	local var204 = ...
	local tbl_27 = {
		Animations = Anims_upvr.Pluck;
		MaxCombo = 5;
		Blocking_Capacity = 60;
		Speed = 0.4;
		Cooldown = 1.25;
		Style = "Pluck";
	}
	if arg1 == "ReturnConfig" then
		do
			return tbl_27
		end
		local var206
	end
	if arg1 == "ReturnDamage_Info" then
		local module_22 = {}
		var206 = 6
		module_22.Damage = var206
		var206 = 50
		module_22.Knockback = var206
		local function INLINED_39() -- Internal function, doesn't exist in bytecode
			var206 = (var204.Hit.Position - var204.Origin.Position).unit
			return var206
		end
		if not var204.Hit or not INLINED_39() then
			var206 = var204.Origin.CFrame.lookVector
		end
		module_22.KnockbackDirection = var206
		var206 = 20
		module_22.Knockback2 = var206
		var206 = Vector3.new(0, 1, 0)
		module_22.KnockbackDirection2 = var206
		var206 = 0.5
		module_22.Knock = var206
		var206 = "Sword"
		module_22.Weapon = var206
		var206 = tbl_27.Style
		module_22.Style = var206
		var206 = {}
		var206.Name = var204.Tag
		var206.Timer = var204.Timer
		module_22.Tag = var206
		var206 = {}
		var206.Name = var204.Tag
		var206.Timer = tbl_27.Speed - tbl_27.Speed / 2.5
		module_22.Stun = var206
		var206 = {}
		var206.Sound = "Blade_Hit"..math.random(1, 2)
		var206.Origin = var204.Hit
		module_22.Sound = var206
		var206 = {}
		var206.Type = "Blade"
		var206.Origin = var204.Hit
		module_22.HitEffect = var206
		var206 = true
		module_22.IsCharacterMelee = var206
		var206 = var204.Combo
		if var206 == "Heavy" then
			var206 = module_22.HitEffect
			var206.Type = "SharpHeavy"
			var206 = {}
			var206.Sound = "Blade_Hit4"
			var206.Origin = var204.Hit
			module_22.Sound = var206
			var206 = 1
			module_22.Knock = var206
			var206 = true
			module_22.BlockBreaker = var206
			var206 = true
			module_22.PerfectBlockable = var206
			var206 = 12
			module_22.Damage = var206
			return module_22
		end
		var206 = var204.Combo
		if var206 < tbl_27.MaxCombo then
			var206 = 10
			module_22.Knockback = var206
			var206 = 5
			module_22.Knockback2 = var206
			var206 = 0
			module_22.Knock = var206
		end
		return module_22
	end
	if arg1 == "ReturnHitbox" then
		return Vector3.new(5, 5, 6.5)
	end
end
function module_46.Dagger(arg1, ...) -- Line 4235
	--[[ Upvalues[1]:
		[1]: Anims_upvr (readonly)
	]]
	local var209 = ...
	local tbl_25 = {
		Animations = Anims_upvr.Dagger;
		MaxCombo = 5;
		Blocking_Capacity = 60;
		Speed = 0.35;
		Cooldown = 1;
		Style = "Dagger";
	}
	if arg1 == "ReturnConfig" then
		do
			return tbl_25
		end
		local var211
	end
	if arg1 == "ReturnDamage_Info" then
		local module_40 = {}
		var211 = 8
		module_40.Damage = var211
		var211 = 50
		module_40.Knockback = var211
		local function INLINED_40() -- Internal function, doesn't exist in bytecode
			var211 = (var209.Hit.Position - var209.Origin.Position).unit
			return var211
		end
		if not var209.Hit or not INLINED_40() then
			var211 = var209.Origin.CFrame.lookVector
		end
		module_40.KnockbackDirection = var211
		var211 = 20
		module_40.Knockback2 = var211
		var211 = Vector3.new(0, 1, 0)
		module_40.KnockbackDirection2 = var211
		var211 = 0.5
		module_40.Knock = var211
		var211 = "Sword"
		module_40.Weapon = var211
		var211 = tbl_25.Style
		module_40.Style = var211
		var211 = {}
		var211.Name = var209.Tag
		var211.Timer = var209.Timer
		module_40.Tag = var211
		var211 = {}
		var211.Name = var209.Tag
		var211.Timer = tbl_25.Speed - tbl_25.Speed / 2.5
		module_40.Stun = var211
		var211 = {}
		var211.Sound = "Blade_Hit"..math.random(1, 2)
		var211.Origin = var209.Hit
		module_40.Sound = var211
		var211 = {}
		var211.Type = "Blade"
		var211.Origin = var209.Hit
		module_40.HitEffect = var211
		var211 = true
		module_40.IsCharacterMelee = var211
		var211 = var209.Combo
		if var211 == "Heavy" then
			var211 = module_40.HitEffect
			var211.Type = "SharpHeavy"
			var211 = {}
			var211.Sound = "Blade_Hit4"
			var211.Origin = var209.Hit
			module_40.Sound = var211
			var211 = 1
			module_40.Knock = var211
			var211 = true
			module_40.BlockBreaker = var211
			var211 = true
			module_40.PerfectBlockable = var211
			var211 = 12
			module_40.Damage = var211
			return module_40
		end
		var211 = var209.Combo
		if var211 < tbl_25.MaxCombo then
			var211 = 10
			module_40.Knockback = var211
			var211 = 5
			module_40.Knockback2 = var211
			var211 = 0
			module_40.Knock = var211
			var211 = var209.Combo
			if var211 < tbl_25.MaxCombo - 1 then
				var211 = module_40.Stun
				var211.Timer = tbl_25.Speed
			end
		end
		return module_40
	end
	if arg1 == "ReturnHitbox" then
		return Vector3.new(5, 5, 4)
	end
end
module_46["Godspeed Teleport"] = function(arg1, ...) -- Line 4289
	--[[ Upvalues[1]:
		[1]: Anims_upvr (readonly)
	]]
	local var214 = ...
	local tbl_14 = {
		Animations = Anims_upvr["Shift Sword Style"];
		MaxCombo = 5;
		Blocking_Capacity = 76;
		Speed = 0.4;
		Cooldown = 1;
		Style = "Shift Sword Style";
	}
	if arg1 == "ReturnConfig" then
		do
			return tbl_14
		end
		local var216
	end
	if arg1 == "ReturnDamage_Info" then
		local module_39 = {}
		var216 = 8
		module_39.Damage = var216
		var216 = 0
		module_39.Knockback = var216
		local function INLINED_41() -- Internal function, doesn't exist in bytecode
			var216 = (var214.Hit.Position - var214.Origin.Position).unit
			return var216
		end
		if not var214.Hit or not INLINED_41() then
			var216 = var214.Origin.CFrame.lookVector
		end
		module_39.KnockbackDirection = var216
		var216 = 0
		module_39.Knockback2 = var216
		var216 = Vector3.new(0, 1, 0)
		module_39.KnockbackDirection2 = var216
		var216 = 0
		module_39.Knock = var216
		var216 = {}
		var216.Name = var214.Tag
		var216.Timer = var214.Timer
		module_39.Tag = var216
		var216 = {}
		var216.Name = var214.Tag
		var216.Timer = 1
		module_39.Stun = var216
		var216 = {}
		var216.Sound = "ElectricExplosion"
		var216.Origin = var214.Hit
		module_39.Sound = var216
		var216 = {}
		var216.Type = "Godspeed"
		var216.Origin = var214.Hit
		module_39.HitEffect = var216
		var216 = true
		module_39.BlockBreaker = var216
		var216 = tbl_14.Style
		module_39.Style = var216
		return module_39
	end
	if arg1 == "ReturnHitbox" then
		return Vector3.new(5, 5, 4)
	end
end
module_46["Shift Katana"] = function(arg1, ...) -- Line 4325
	--[[ Upvalues[1]:
		[1]: Anims_upvr (readonly)
	]]
	local var223 = ...
	local tbl_5 = {
		Animations = Anims_upvr["Shift Sword Style"];
		MaxCombo = 5;
		Blocking_Capacity = 76;
		Speed = 0.4;
		Cooldown = 1;
		Style = "Shift Sword Style";
	}
	if arg1 == "ReturnConfig" then
		do
			return tbl_5
		end
		local var225
	end
	if arg1 == "ReturnDamage_Info" then
		local module_31 = {}
		var225 = 8.5
		module_31.Damage = var225
		var225 = 50
		module_31.Knockback = var225
		local function INLINED_43() -- Internal function, doesn't exist in bytecode
			var225 = (var223.Hit.Position - var223.Origin.Position).unit
			return var225
		end
		if not var223.Hit or not INLINED_43() then
			var225 = var223.Origin.CFrame.lookVector
		end
		module_31.KnockbackDirection = var225
		var225 = 20
		module_31.Knockback2 = var225
		var225 = Vector3.new(0, 1, 0)
		module_31.KnockbackDirection2 = var225
		var225 = 0.5
		module_31.Knock = var225
		var225 = "Sword"
		module_31.Weapon = var225
		var225 = tbl_5.Style
		module_31.Style = var225
		var225 = {}
		var225.Name = var223.Tag
		var225.Timer = var223.Timer
		module_31.Tag = var225
		var225 = {}
		var225.Name = var223.Tag
		var225.Timer = tbl_5.Speed - tbl_5.Speed / 2.5
		module_31.Stun = var225
		var225 = {}
		var225.Sound = "Blade_Hit"..math.random(1, 2)
		var225.Origin = var223.Hit
		module_31.Sound = var225
		var225 = {}
		var225.Type = "Blade"
		var225.Origin = var223.Hit
		module_31.HitEffect = var225
		var225 = true
		module_31.IsCharacterMelee = var225
		var225 = var223.Combo
		if var225 == "Heavy" then
			var225 = module_31.HitEffect
			var225.Type = "SharpHeavy"
			var225 = {}
			var225.Sound = "Blade_Hit4"
			var225.Origin = var223.Hit
			module_31.Sound = var225
			var225 = 1
			module_31.Knock = var225
			var225 = true
			module_31.BlockBreaker = var225
			var225 = true
			module_31.PerfectBlockable = var225
			var225 = 12
			module_31.Damage = var225
			return module_31
		end
		var225 = var223.Combo
		if var225 == "Thunder Clap" then
			var225 = {}
			var225.Sound = "Gore2"
			var225.Origin = var223.Hit
			module_31.Sound = var225
			var225 = 2
			module_31.Knock = var225
			var225 = true
			module_31.BlockBreaker = var225
			var225 = 28
			module_31.Damage = var225
			var225 = math.random(1, 4)
			module_31.Knockback = 0
			module_31.Knockback2 = 35
			module_31.NoDamageCancel = true
			return module_31
		end
		var225 = var223.Combo
		if var225 < tbl_5.MaxCombo then
			var225 = 10
			module_31.Knockback = var225
			var225 = 5
			module_31.Knockback2 = var225
			var225 = 0
			module_31.Knock = var225
			var225 = var223.Combo
			if var225 < tbl_5.MaxCombo - 1 then
				var225 = module_31.Stun
				var225.Timer = tbl_5.Speed
			end
		end
		return module_31
	end
	if arg1 == "ReturnHitbox" then
		return Vector3.new(5, 5, 4)
	end
end
module_46["Shift Katana"] = function(arg1, ...) -- Line 4390
	--[[ Upvalues[1]:
		[1]: Anims_upvr (readonly)
	]]
	local var228 = ...
	local tbl_31 = {
		Animations = Anims_upvr["Shift Sword Style"];
		MaxCombo = 5;
		Blocking_Capacity = 76;
		Speed = 0.4;
		Cooldown = 1;
		Style = "Shift Sword Style";
	}
	if arg1 == "ReturnConfig" then
		do
			return tbl_31
		end
		local var230
	end
	if arg1 == "ReturnDamage_Info" then
		local module_30 = {}
		var230 = 8.5
		module_30.Damage = var230
		var230 = 50
		module_30.Knockback = var230
		local function INLINED_44() -- Internal function, doesn't exist in bytecode
			var230 = (var228.Hit.Position - var228.Origin.Position).unit
			return var230
		end
		if not var228.Hit or not INLINED_44() then
			var230 = var228.Origin.CFrame.lookVector
		end
		module_30.KnockbackDirection = var230
		var230 = 20
		module_30.Knockback2 = var230
		var230 = Vector3.new(0, 1, 0)
		module_30.KnockbackDirection2 = var230
		var230 = 0.5
		module_30.Knock = var230
		var230 = "Sword"
		module_30.Weapon = var230
		var230 = tbl_31.Style
		module_30.Style = var230
		var230 = {}
		var230.Name = var228.Tag
		var230.Timer = var228.Timer
		module_30.Tag = var230
		var230 = {}
		var230.Name = var228.Tag
		var230.Timer = tbl_31.Speed - tbl_31.Speed / 2.5
		module_30.Stun = var230
		var230 = {}
		var230.Sound = "Blade_Hit"..math.random(1, 2)
		var230.Origin = var228.Hit
		module_30.Sound = var230
		var230 = {}
		var230.Type = "Blade"
		var230.Origin = var228.Hit
		module_30.HitEffect = var230
		var230 = true
		module_30.IsCharacterMelee = var230
		var230 = var228.Combo
		if var230 == "Heavy" then
			var230 = module_30.HitEffect
			var230.Type = "SharpHeavy"
			var230 = {}
			var230.Sound = "Blade_Hit4"
			var230.Origin = var228.Hit
			module_30.Sound = var230
			var230 = 1
			module_30.Knock = var230
			var230 = true
			module_30.BlockBreaker = var230
			var230 = true
			module_30.PerfectBlockable = var230
			var230 = 12
			module_30.Damage = var230
			return module_30
		end
		var230 = var228.Combo
		if var230 == "Thunder Clap" then
			var230 = {}
			var230.Sound = "Gore2"
			var230.Origin = var228.Hit
			module_30.Sound = var230
			var230 = 2
			module_30.Knock = var230
			var230 = true
			module_30.BlockBreaker = var230
			var230 = 28
			module_30.Damage = var230
			var230 = math.random(1, 4)
			module_30.Knockback = 0
			module_30.Knockback2 = 35
			module_30.NoDamageCancel = true
			return module_30
		end
		var230 = var228.Combo
		if var230 < tbl_31.MaxCombo then
			var230 = 10
			module_30.Knockback = var230
			var230 = 5
			module_30.Knockback2 = var230
			var230 = 0
			module_30.Knock = var230
			var230 = var228.Combo
			if var230 < tbl_31.MaxCombo - 1 then
				var230 = module_30.Stun
				var230.Timer = tbl_31.Speed + tbl_31.Speed / 1
			end
		end
		return module_30
	end
	if arg1 == "ReturnHitbox" then
		return Vector3.new(5, 5, 4)
	end
end
module_46["Sword of Honor"] = function(arg1, ...) -- Line 4453
	--[[ Upvalues[1]:
		[1]: Anims_upvr (readonly)
	]]
	local var233 = ...
	local tbl_23 = {
		Animations = Anims_upvr["Shift Sword Style"];
		MaxCombo = 5;
		Blocking_Capacity = 100;
		Speed = 0.4;
		Cooldown = 1;
		Style = "Shift Sword Style";
	}
	if arg1 == "ReturnConfig" then
		do
			return tbl_23
		end
		local var235
	end
	if arg1 == "ReturnDamage_Info" then
		local module_21 = {}
		var235 = 8.5
		module_21.Damage = var235
		var235 = 50
		module_21.Knockback = var235
		local function INLINED_45() -- Internal function, doesn't exist in bytecode
			var235 = (var233.Hit.Position - var233.Origin.Position).unit
			return var235
		end
		if not var233.Hit or not INLINED_45() then
			var235 = var233.Origin.CFrame.lookVector
		end
		module_21.KnockbackDirection = var235
		var235 = 20
		module_21.Knockback2 = var235
		var235 = Vector3.new(0, 1, 0)
		module_21.KnockbackDirection2 = var235
		var235 = 0.5
		module_21.Knock = var235
		var235 = "Sword"
		module_21.Weapon = var235
		var235 = tbl_23.Style
		module_21.Style = var235
		var235 = {}
		var235.Name = var233.Tag
		var235.Timer = var233.Timer
		module_21.Tag = var235
		var235 = {}
		var235.Name = var233.Tag
		var235.Timer = tbl_23.Speed - tbl_23.Speed / 2.5
		module_21.Stun = var235
		var235 = {}
		var235.Sound = "SwordHit"..math.random(1, 2)
		var235.Origin = var233.Hit
		module_21.Sound = var235
		var235 = {}
		var235.Type = "Blade"
		var235.Origin = var233.Hit
		module_21.HitEffect = var235
		var235 = true
		module_21.IsCharacterMelee = var235
		var235 = var233.Combo
		if var235 == "Heavy" then
			var235 = module_21.HitEffect
			var235.Type = "SharpHeavy"
			var235 = {}
			var235.Sound = "SwordHit3"
			var235.Origin = var233.Hit
			module_21.Sound = var235
			var235 = 1
			module_21.Knock = var235
			var235 = true
			module_21.BlockBreaker = var235
			var235 = true
			module_21.PerfectBlockable = var235
			var235 = 12
			module_21.Damage = var235
			return module_21
		end
		var235 = var233.Combo
		if var235 < tbl_23.MaxCombo then
			var235 = 10
			module_21.Knockback = var235
			var235 = 5
			module_21.Knockback2 = var235
			var235 = 0
			module_21.Knock = var235
			var235 = var233.Combo
			if var235 < tbl_23.MaxCombo - 1 then
				var235 = module_21.Stun
				var235.Timer = tbl_23.Speed + tbl_23.Speed / 1
			end
		end
		return module_21
	end
	if arg1 == "ReturnHitbox" then
		return Vector3.new(5, 5, 6.5)
	end
end
module_46["The Incinerator"] = function(arg1, ...) -- Line 4507
	--[[ Upvalues[1]:
		[1]: Anims_upvr (readonly)
	]]
	local var242 = ...
	local tbl_29 = {
		Animations = Anims_upvr["Shift Sword Style"];
		MaxCombo = 5;
		Blocking_Capacity = 60;
		Speed = 0.4;
		Cooldown = 1.25;
		Style = "Shift Sword Style";
	}
	if arg1 == "ReturnConfig" then
		do
			return tbl_29
		end
		local var244
	end
	if arg1 == "ReturnDamage_Info" then
		local module_6 = {}
		var244 = 6
		module_6.Damage = var244
		var244 = 50
		module_6.Knockback = var244
		local function INLINED_47() -- Internal function, doesn't exist in bytecode
			var244 = (var242.Hit.Position - var242.Origin.Position).unit
			return var244
		end
		if not var242.Hit or not INLINED_47() then
			var244 = var242.Origin.CFrame.lookVector
		end
		module_6.KnockbackDirection = var244
		var244 = 20
		module_6.Knockback2 = var244
		var244 = Vector3.new(0, 1, 0)
		module_6.KnockbackDirection2 = var244
		var244 = 0.5
		module_6.Knock = var244
		var244 = "Sword"
		module_6.Weapon = var244
		var244 = tbl_29.Style
		module_6.Style = var244
		var244 = {}
		var244.Name = var242.Tag
		var244.Timer = var242.Timer
		module_6.Tag = var244
		var244 = {}
		var244.Name = var242.Tag
		var244.Timer = tbl_29.Speed - tbl_29.Speed / 2.5
		module_6.Stun = var244
		var244 = {}
		var244.Sound = "Blade_Hit"..math.random(1, 2)
		var244.Origin = var242.Hit
		module_6.Sound = var244
		var244 = {}
		var244.Type = "Blade"
		var244.Origin = var242.Hit
		module_6.HitEffect = var244
		var244 = true
		module_6.IsCharacterMelee = var244
		var244 = var242.Combo
		if var244 == "Heavy" then
			var244 = module_6.HitEffect
			var244.Type = "SharpHeavy"
			var244 = {}
			var244.Sound = "Blade_Hit4"
			var244.Origin = var242.Hit
			module_6.Sound = var244
			var244 = 1
			module_6.Knock = var244
			var244 = true
			module_6.BlockBreaker = var244
			var244 = true
			module_6.PerfectBlockable = var244
			var244 = 12
			module_6.Damage = var244
			return module_6
		end
		var244 = var242.Combo
		if var244 == "Incinerate" then
			var244 = math.random(200, 250) / 100
			module_6.Damage = var244
			var244 = module_6.Stun
			var244.Timer = 0.5
			var244 = 0
			module_6.Knockback = var244
			var244 = 0
			module_6.Knockback2 = var244
			var244 = 0
			module_6.Knock = var244
			var244 = module_6.HitEffect
			var244.Type = "Burn"
			var244 = true
			module_6.IgnoreBlock = var244
			var244 = module_6.Sound
			var244.Sound = "Burn"..math.random(1, 2)
			var244 = var242.Combo
			module_6.Style = var244
			return module_6
		end
		var244 = var242.Combo
		if var244 < tbl_29.MaxCombo then
			var244 = 10
			module_6.Knockback = var244
			var244 = 5
			module_6.Knockback2 = var244
			var244 = 0
			module_6.Knock = var244
			var244 = var242.Combo
			if var244 < tbl_29.MaxCombo - 1 then
				var244 = module_6.Stun
				var244.Timer = tbl_29.Speed
			end
		end
		return module_6
	end
	if arg1 == "ReturnHitbox" then
		return Vector3.new(5, 6, 3.5)
	end
end
module_46["Beach Boy"] = function(arg1, ...) -- Line 4573
	--[[ Upvalues[1]:
		[1]: Anims_upvr (readonly)
	]]
	local var247 = ...
	local tbl_21 = {
		Animations = Anims_upvr["Shift Sword Style"];
		MaxCombo = 5;
		Blocking_Capacity = 60;
		Speed = 0.35;
		Cooldown = 1.25;
		Style = "Beach Boy";
	}
	if arg1 == "ReturnConfig" then
		do
			return tbl_21
		end
		local var249
	end
	if arg1 == "ReturnDamage_Info" then
		local module = {}
		var249 = 7.5
		module.Damage = var249
		var249 = 30
		module.Knockback = var249
		local function INLINED_48() -- Internal function, doesn't exist in bytecode
			var249 = (var247.Hit.Position - var247.Origin.Position).unit
			return var249
		end
		if not var247.Hit or not INLINED_48() then
			var249 = var247.Origin.CFrame.lookVector
		end
		module.KnockbackDirection = var249
		var249 = 10
		module.Knockback2 = var249
		var249 = Vector3.new(0, 1, 0)
		module.KnockbackDirection2 = var249
		var249 = 0.5
		module.Knock = var249
		var249 = ""
		module.Weapon = var249
		var249 = tbl_21.Style
		module.Style = var249
		var249 = {}
		var249.Name = var247.Tag
		var249.Timer = var247.Timer
		module.Tag = var249
		var249 = {}
		var249.Name = var247.Tag
		var249.Timer = tbl_21.Speed - tbl_21.Speed / 2.5
		module.Stun = var249
		var249 = {}
		var249.Sound = "Blade_Hit"..math.random(1, 2)
		var249.Origin = var247.Hit
		module.Sound = var249
		var249 = {}
		var249.Type = "Blade"
		var249.Origin = var247.Hit
		module.HitEffect = var249
		var249 = true
		module.IsCharacterMelee = var249
		var249 = var247.Combo
		if var249 == "Heavy" then
			var249 = module.HitEffect
			var249.Type = "SharpHeavy"
			var249 = {}
			var249.Sound = "Blade_Hit4"
			var249.Origin = var247.Hit
			module.Sound = var249
			var249 = 1
			module.Knock = var249
			var249 = true
			module.BlockBreaker = var249
			var249 = true
			module.PerfectBlockable = var249
			var249 = 15
			module.Damage = var249
			return module
		end
		var249 = var247.Combo
		if var249 < tbl_21.MaxCombo then
			var249 = 40
			module.Knockback = var249
			var249 = 15
			module.Knockback2 = var249
			var249 = 0
			module.Knock = var249
			var249 = var247.Combo
			if var249 < tbl_21.MaxCombo - 1 then
				var249 = module.Stun
				var249.Timer = tbl_21.Speed
			end
		end
		return module
	end
	if arg1 == "ReturnHitbox" then
		return Vector3.new(8.5, 5, 11)
	end
end
module_46["Blade Projections"] = function(arg1, ...) -- Line 4627
	--[[ Upvalues[1]:
		[1]: Anims_upvr (readonly)
	]]
	local var252 = ...
	local tbl_13 = {
		Animations = Anims_upvr.Blade_Projections;
		MaxCombo = 5;
		Blocking_Capacity = 76;
		Speed = 0.35;
		Cooldown = 1.25;
		Style = "Blade Projections";
	}
	if arg1 == "ReturnConfig" then
		do
			return tbl_13
		end
		local var254
	end
	if arg1 == "ReturnDamage_Info" then
		local module_16 = {}
		var254 = 8
		module_16.Damage = var254
		var254 = 50
		module_16.Knockback = var254
		local function INLINED_49() -- Internal function, doesn't exist in bytecode
			var254 = (var252.Hit.Position - var252.Origin.Position).unit
			return var254
		end
		if not var252.Hit or not INLINED_49() then
			var254 = var252.Origin.CFrame.lookVector
		end
		module_16.KnockbackDirection = var254
		var254 = 20
		module_16.Knockback2 = var254
		var254 = Vector3.new(0, 1, 0)
		module_16.KnockbackDirection2 = var254
		var254 = 0.5
		module_16.Knock = var254
		var254 = "Sword"
		module_16.Weapon = var254
		var254 = tbl_13.Style
		module_16.Style = var254
		var254 = {}
		var254.Name = var252.Tag
		var254.Timer = var252.Timer
		module_16.Tag = var254
		var254 = {}
		var254.Name = var252.Tag
		var254.Timer = tbl_13.Speed - tbl_13.Speed / 2.5
		module_16.Stun = var254
		var254 = {}
		var254.Sound = "Blade_Hit"..math.random(1, 2)
		var254.Origin = var252.Hit
		module_16.Sound = var254
		var254 = {}
		var254.Type = "Blade"
		var254.Origin = var252.Hit
		module_16.HitEffect = var254
		var254 = true
		module_16.IsCharacterMelee = var254
		var254 = var252.Combo
		if var254 == "Heavy" then
			var254 = module_16.HitEffect
			var254.Type = "SharpHeavy"
			var254 = {}
			var254.Sound = "Blade_Hit4"
			var254.Origin = var252.Hit
			module_16.Sound = var254
			var254 = 1
			module_16.Knock = var254
			var254 = true
			module_16.BlockBreaker = var254
			var254 = true
			module_16.PerfectBlockable = var254
			var254 = 12
			module_16.Damage = var254
			return module_16
		end
		var254 = var252.Combo
		if var254 < tbl_13.MaxCombo then
			var254 = 10
			module_16.Knockback = var254
			var254 = 5
			module_16.Knockback2 = var254
			var254 = 0
			module_16.Knock = var254
			var254 = var252.Combo
			if var254 < tbl_13.MaxCombo - 1 then
				var254 = module_16.Stun
				var254.Timer = tbl_13.Speed
			end
		end
		return module_16
	end
	if arg1 == "ReturnHitbox" then
		return Vector3.new(5, 6, 4.5)
	end
end
function module_46.Shovel(arg1, ...) -- Line 4681
	--[[ Upvalues[1]:
		[1]: Anims_upvr (readonly)
	]]
	local var257 = ...
	local tbl_20 = {
		Animations = Anims_upvr.Pluck;
		MaxCombo = 5;
		Blocking_Capacity = 56;
		Speed = 0.4;
		Cooldown = 1.25;
		Style = "Pluck";
	}
	if arg1 == "ReturnConfig" then
		do
			return tbl_20
		end
		local var259
	end
	if arg1 == "ReturnDamage_Info" then
		local module_34 = {}
		var259 = 6
		module_34.Damage = var259
		var259 = 50
		module_34.Knockback = var259
		local function INLINED_50() -- Internal function, doesn't exist in bytecode
			var259 = (var257.Hit.Position - var257.Origin.Position).unit
			return var259
		end
		if not var257.Hit or not INLINED_50() then
			var259 = var257.Origin.CFrame.lookVector
		end
		module_34.KnockbackDirection = var259
		var259 = 20
		module_34.Knockback2 = var259
		var259 = Vector3.new(0, 1, 0)
		module_34.KnockbackDirection2 = var259
		var259 = 0.5
		module_34.Knock = var259
		var259 = "Sword"
		module_34.Weapon = var259
		var259 = tbl_20.Style
		module_34.Style = var259
		var259 = {}
		var259.Name = var257.Tag
		var259.Timer = var257.Timer
		module_34.Tag = var259
		var259 = {}
		var259.Name = var257.Tag
		var259.Timer = tbl_20.Speed - tbl_20.Speed / 2.5
		module_34.Stun = var259
		var259 = {}
		var259.Sound = "Shovel_Hit"..math.random(1, 3)
		var259.Origin = var257.Hit
		module_34.Sound = var259
		var259 = {}
		var259.Type = "Blade"
		var259.Origin = var257.Hit
		module_34.HitEffect = var259
		var259 = true
		module_34.IsCharacterMelee = var259
		var259 = var257.Combo
		if var259 == "Heavy" then
			var259 = module_34.HitEffect
			var259.Type = "SharpHeavy"
			var259 = {}
			var259.Sound = "Blade_Hit4"
			var259.Origin = var257.Hit
			module_34.Sound = var259
			var259 = 1
			module_34.Knock = var259
			var259 = true
			module_34.BlockBreaker = var259
			var259 = true
			module_34.PerfectBlockable = var259
			var259 = 12
			module_34.Damage = var259
			return module_34
		end
		var259 = var257.Combo
		if var259 < tbl_20.MaxCombo then
			var259 = 10
			module_34.Knockback = var259
			var259 = 5
			module_34.Knockback2 = var259
			var259 = 0
			module_34.Knock = var259
			var259 = var257.Combo
			if var259 < tbl_20.MaxCombo - 1 then
				var259 = module_34.Stun
				var259.Timer = tbl_20.Speed
			end
		end
		return module_34
	end
	if arg1 == "ReturnHitbox" then
		return Vector3.new(5, 5, 6.5)
	end
end
return module_46
