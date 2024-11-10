-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2024-11-08 17:01:38
-- Luau version 6, Types version 3
-- Time taken: 0.012184 seconds

local module_upvr_2 = {}
local _ = coroutine
module_upvr_2["Blighted Quiver"] = {}
module_upvr_2["Blighted Quiver"].Variables = {
	Heal_Percent = 15;
}
module_upvr_2["Blighted Quiver"].Desc = `Your projectiles now heal you for {module_upvr_2["Blighted Quiver"].Variables.Heal_Percent}% of the damage you deal to opponents.`
module_upvr_2["Blighted Quiver"].Name = "Blighted Quiver"
module_upvr_2["Blighted Quiver"].Icon = "http://www.roblox.com/asset/?id=13893453406"
module_upvr_2["Blighted Quiver"].Requirement = function(...) -- Line 33
	do
		return true
	end
	return false
end
module_upvr_2["Blighted Quiver"].Activation = function(...) -- Line 45
	--[[ Upvalues[1]:
		[1]: module_upvr_2 (readonly)
	]]
	local var7 = ...
	if var7.Func == "Setup" then
		var7.self.Char:SetAttribute("Blighted_Quiver", module_upvr_2["Blighted Quiver"].Variables.Heal_Percent / 100)
		return true
	end
	return true
end
module_upvr_2["Jeweled Soul"] = {}
module_upvr_2["Jeweled Soul"].Variables = {
	Crit_Chance = 15;
}
module_upvr_2["Jeweled Soul"].Desc = `Stand abilities can now critical strike when damaging opponents. Increases critical chance by {module_upvr_2["Jeweled Soul"].Variables.Crit_Chance}%`
module_upvr_2["Jeweled Soul"].Name = "Jeweled Soul"
module_upvr_2["Jeweled Soul"].Icon = "http://www.roblox.com/asset/?id=13518130183"
module_upvr_2["Jeweled Soul"].Requirement = function(...) -- Line 85
	do
		return true
	end
	return false
end
module_upvr_2["Jeweled Soul"].Activation = function(...) -- Line 97
	--[[ Upvalues[1]:
		[1]: module_upvr_2 (readonly)
	]]
	local var12 = ...
	local self_6 = var12.self
	if var12.Func == "Setup" then
		self_6.Char:SetAttribute("Jeweled_Soul", true)
		self_6:AddCritChance({
			Name = "Jeweled Soul";
			Value = module_upvr_2["Jeweled Soul"].Variables.Crit_Chance;
		})
		return true
	end
	return true
end
module_upvr_2["Piercing Arrow"] = {}
module_upvr_2["Piercing Arrow"].Variables = {
	Damage_Percent = 120;
}
module_upvr_2["Piercing Arrow"].Desc = "Increase all projectile damage by "..math.abs(100 - module_upvr_2["Piercing Arrow"].Variables.Damage_Percent)..'%'
module_upvr_2["Piercing Arrow"].Name = "Piercing Arrow"
module_upvr_2["Piercing Arrow"].Icon = "http://www.roblox.com/asset/?id=129698158"
module_upvr_2["Piercing Arrow"].Requirement = function(...) -- Line 141
	do
		return true
	end
	return false
end
module_upvr_2["Piercing Arrow"].Activation = function(...) -- Line 153
	--[[ Upvalues[1]:
		[1]: module_upvr_2 (readonly)
	]]
	local var18 = ...
	if var18.Func == "Setup" then
		var18.self.Char:SetAttribute("Piercing_Arrow", module_upvr_2["Piercing Arrow"].Variables.Damage_Percent / 100)
		return true
	end
	return true
end
module_upvr_2["Spirit Visage"] = {}
module_upvr_2["Spirit Visage"].Variables = {
	Heal_Percent = 120;
}
module_upvr_2["Spirit Visage"].Desc = "Increase all healing received and given by "..math.abs(100 - module_upvr_2["Spirit Visage"].Variables.Heal_Percent)..'%'
module_upvr_2["Spirit Visage"].Name = "Spirit Visage"
module_upvr_2["Spirit Visage"].Icon = "http://www.roblox.com/asset/?id=14436167187"
module_upvr_2["Spirit Visage"].Requirement = function(...) -- Line 192
	do
		return true
	end
	return false
end
module_upvr_2["Spirit Visage"].Activation = function(...) -- Line 204
	--[[ Upvalues[1]:
		[1]: module_upvr_2 (readonly)
	]]
	local var23 = ...
	if var23.Func == "Setup" then
		var23.self.Char:SetAttribute("Spirit_Visage", module_upvr_2["Spirit Visage"].Variables.Heal_Percent / 100)
		return true
	end
	return true
end
module_upvr_2["Avatar of Hermes"] = {}
module_upvr_2["Avatar of Hermes"].Variables = {
	Cooldown_Percent = 70;
}
module_upvr_2["Avatar of Hermes"].Desc = `Reduce the cooldown of dash and blink stand abilities by {100 - module_upvr_2["Avatar of Hermes"].Variables.Cooldown_Percent}%. Character dashes are only reduced by 15%.`
module_upvr_2["Avatar of Hermes"].Name = "Avatar of Hermes"
module_upvr_2["Avatar of Hermes"].Icon = "http://www.roblox.com/asset/?id=5951934169"
module_upvr_2["Avatar of Hermes"].Requirement = function(...) -- Line 244
	do
		return true
	end
	return false
end
module_upvr_2["Avatar of Hermes"].Activation = function(...) -- Line 256
	--[[ Upvalues[1]:
		[1]: module_upvr_2 (readonly)
	]]
	local var28 = ...
	if var28.Func == "Setup" then
		var28.self.Char:SetAttribute("Avatar_of_Hermes", module_upvr_2["Avatar of Hermes"].Variables.Cooldown_Percent / 100)
		return true
	end
	return true
end
module_upvr_2.Goliath = {}
module_upvr_2.Goliath.Variables = {
	MaxHP_Percent = 120;
}
module_upvr_2.Goliath.Desc = "Increase maximum health points by "..math.abs(100 - module_upvr_2.Goliath.Variables.MaxHP_Percent)..'%'
module_upvr_2.Goliath.Name = "Goliath"
module_upvr_2.Goliath.Icon = "http://www.roblox.com/asset/?id=401613236"
module_upvr_2.Goliath.Requirement = function(...) -- Line 295
	do
		return true
	end
	return false
end
local module_upvr = require(game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("FunctionLibrary"))
module_upvr_2.Goliath.Activation = function(...) -- Line 307
	--[[ Upvalues[2]:
		[1]: module_upvr_2 (readonly)
		[2]: module_upvr (readonly)
	]]
	local var34 = ...
	local self_2 = var34.self
	if var34.Func == "Setup" then
		local MaxValue = self_2.Health.MaxValue
		self_2.Char:SetAttribute("Goliath", module_upvr_2.Goliath.Variables.MaxHP_Percent / 100)
		local Amount = module_upvr.ReturnStat({
			Stat = "Max_Health";
			Player = self_2.Player;
		}).Amount
		self_2.Health.MaxValue = Amount
		if 0 < Amount - MaxValue then
			local Health = self_2.Health
			Health.Value += Amount - MaxValue
		end
		return true
	end
	return true
end
module_upvr_2["North God"] = {}
module_upvr_2["North God"].Variables = {
	PhysicalDefense = 2;
	MaxStacks = 5;
	Duration = 30;
}
module_upvr_2["North God"].Desc = "After using a dash or blink you gain "..module_upvr_2["North God"].Variables.PhysicalDefense.." Physical-Defense for "..module_upvr_2["North God"].Variables.Duration.."s. This stacks up to "..module_upvr_2["North God"].Variables.MaxStacks.." times"
module_upvr_2["North God"].Name = "North God"
module_upvr_2["North God"].Icon = "http://www.roblox.com/asset/?id=13288142767"
module_upvr_2["North God"].Requirement = function(...) -- Line 363
	do
		return true
	end
	return false
end
local delay_upvr = task.delay
module_upvr_2["North God"].Activation = function(...) -- Line 375
	--[[ Upvalues[2]:
		[1]: module_upvr_2 (readonly)
		[2]: delay_upvr (readonly)
	]]
	local var44 = ...
	local self_5_upvr = var44.self
	local Char_upvr = self_5_upvr.Char
	if var44.Func == "Setup" then
		Char_upvr:SetAttribute("North_God_Amount", module_upvr_2["North God"].Variables.PhysicalDefense / 100)
		Char_upvr:SetAttribute("North_God_Duration", module_upvr_2["North God"].Variables.Duration)
		Char_upvr:SetAttribute("North_God_MaxStacks", module_upvr_2["North God"].Variables.MaxStacks)
		function self_5_upvr.North_God_Activation() -- Line 404
			--[[ Upvalues[4]:
				[1]: self_5_upvr (readonly)
				[2]: Char_upvr (readonly)
				[3]: module_upvr_2 (copied, readonly)
				[4]: delay_upvr (copied, readonly)
			]]
			local tick_result1_upvr = tick()
			self_5_upvr.North_God_Tick = tick_result1_upvr
			local var49
			local function INLINED() -- Internal function, doesn't exist in bytecode
				var49 = Char_upvr:GetAttribute("North_God") + 1
				return var49
			end
			if not Char_upvr:GetAttribute("North_God") or not INLINED() then
				var49 = 1
			end
			Char_upvr:SetAttribute("North_God", math.clamp(var49, 1, module_upvr_2["North God"].Variables.MaxStacks))
			self_5_upvr:UpdatePhysicalDefense()
			var49 = module_upvr_2
			delay_upvr(var49["North God"].Variables.Duration, function() -- Line 420
				--[[ Upvalues[3]:
					[1]: self_5_upvr (copied, readonly)
					[2]: tick_result1_upvr (readonly)
					[3]: Char_upvr (copied, readonly)
				]]
				if self_5_upvr.North_God_Tick == tick_result1_upvr then
					Char_upvr:SetAttribute("North_God", nil)
					self_5_upvr:UpdatePhysicalDefense()
				end
			end)
		end
		return true
	end
	return true
end
module_upvr_2["Left Right Goodnight"] = {}
module_upvr_2["Left Right Goodnight"].Variables = {
	BasicAttack_Percent = 120;
}
module_upvr_2["Left Right Goodnight"].Desc = "Increase Basic-Attack (M1/M2) damage by "..(module_upvr_2["Left Right Goodnight"].Variables.BasicAttack_Percent - 100)..'%'
module_upvr_2["Left Right Goodnight"].Name = "Left Right Goodnight"
module_upvr_2["Left Right Goodnight"].Icon = "http://www.roblox.com/asset/?id=9833736613"
module_upvr_2["Left Right Goodnight"].Requirement = function(...) -- Line 452
	do
		return true
	end
	return false
end
module_upvr_2["Left Right Goodnight"].Activation = function(...) -- Line 464
	--[[ Upvalues[1]:
		[1]: module_upvr_2 (readonly)
	]]
	local var54 = ...
	if var54.Func == "Setup" then
		var54.self.Char:SetAttribute("Left_Right_Goodnight", module_upvr_2["Left Right Goodnight"].Variables.BasicAttack_Percent / 100)
		return true
	end
	return true
end
module_upvr_2.Deft = {}
module_upvr_2.Deft.Variables = {
	BasicAttack_Percent = 120;
}
module_upvr_2.Deft.Desc = "Increase Basic-Attack (M1/M2) speeds by "..(module_upvr_2.Deft.Variables.BasicAttack_Percent - 100)..'%'
module_upvr_2.Deft.Name = "Deft"
module_upvr_2.Deft.Icon = "http://www.roblox.com/asset/?id=16606914930"
module_upvr_2.Deft.Requirement = function(...) -- Line 503
	do
		return true
	end
	return false
end
module_upvr_2.Deft.Activation = function(...) -- Line 515
	--[[ Upvalues[1]:
		[1]: module_upvr_2 (readonly)
	]]
	local var59 = ...
	if var59.Func == "Setup" then
		var59.self.Char:SetAttribute("Deft", module_upvr_2.Deft.Variables.BasicAttack_Percent / 100)
		return true
	end
	return true
end
module_upvr_2["Last Stand"] = {}
module_upvr_2["Last Stand"].Variables = {
	Damage_Percent = 115;
	MaxHp_Percent = 50;
}
module_upvr_2["Last Stand"].Desc = "Deal "..(module_upvr_2["Last Stand"].Variables.Damage_Percent - 100).."% increased damage when below "..module_upvr_2["Last Stand"].Variables.MaxHp_Percent.."% of your maximum HP"
module_upvr_2["Last Stand"].Name = "Last Stand"
module_upvr_2["Last Stand"].Icon = "http://www.roblox.com/asset/?id=11379131842"
module_upvr_2["Last Stand"].Requirement = function(...) -- Line 555
	do
		return true
	end
	return false
end
module_upvr_2["Last Stand"].Activation = function(...) -- Line 567
	--[[ Upvalues[1]:
		[1]: module_upvr_2 (readonly)
	]]
	local var64 = ...
	local Char_5 = var64.self.Char
	if var64.Func == "Setup" then
		Char_5:SetAttribute("Last_Stand", module_upvr_2["Last Stand"].Variables.Damage_Percent / 100)
		Char_5:SetAttribute("Last_Stand_MaxHp", module_upvr_2["Last Stand"].Variables.MaxHp_Percent / 100)
		return true
	end
	return true
end
module_upvr_2.Executioner = {}
module_upvr_2.Executioner.Variables = {
	Damage_Percent = 115;
	MaxHp_Percent = 50;
}
module_upvr_2.Executioner.Desc = "Deal "..(module_upvr_2.Executioner.Variables.Damage_Percent - 100).."% increased damage to enemies below "..module_upvr_2.Executioner.Variables.MaxHp_Percent.."% of their maximum HP"
module_upvr_2.Executioner.Name = "Executioner"
module_upvr_2.Executioner.Icon = "http://www.roblox.com/asset/?id=129697807"
module_upvr_2.Executioner.Requirement = function(...) -- Line 612
	do
		return true
	end
	return false
end
module_upvr_2.Executioner.Activation = function(...) -- Line 624
	--[[ Upvalues[1]:
		[1]: module_upvr_2 (readonly)
	]]
	local var70 = ...
	local Char_4 = var70.self.Char
	if var70.Func == "Setup" then
		Char_4:SetAttribute("Executioner", module_upvr_2.Executioner.Variables.Damage_Percent / 100)
		Char_4:SetAttribute("Executioner_MaxHp", module_upvr_2.Executioner.Variables.MaxHp_Percent / 100)
		return true
	end
	return true
end
module_upvr_2["Blessing of Sparks"] = {}
module_upvr_2["Blessing of Sparks"].Variables = {
	Duration = 2.5;
	Damage = 40;
	Cooldown = 15;
}
module_upvr_2["Blessing of Sparks"].Desc = "Upon successfully parrying, your next damaging ability or attack within "..module_upvr_2["Blessing of Sparks"].Variables.Duration.."s will create Sparks, dealing "..module_upvr_2["Blessing of Sparks"].Variables.Damage.." true damage ["..module_upvr_2["Blessing of Sparks"].Variables.Cooldown.."s CD]"
module_upvr_2["Blessing of Sparks"].Name = "Blessing of Sparks"
module_upvr_2["Blessing of Sparks"].Icon = "http://www.roblox.com/asset/?id=13321880274"
module_upvr_2["Blessing of Sparks"].Requirement = function(...) -- Line 670
	do
		return true
	end
	return false
end
module_upvr_2["Blessing of Sparks"].Activation = function(...) -- Line 682
	--[[ Upvalues[1]:
		[1]: module_upvr_2 (readonly)
	]]
	local var76 = ...
	local Char_7 = var76.self.Char
	if var76.Func == "Setup" then
		Char_7:SetAttribute("Blessing_of_Sparks_Damage", module_upvr_2["Blessing of Sparks"].Variables.Damage)
		Char_7:SetAttribute("Blessing_of_Sparks_Duration", module_upvr_2["Blessing of Sparks"].Variables.Duration)
		Char_7:SetAttribute("Blessing_of_Sparks_Cooldown", module_upvr_2["Blessing of Sparks"].Variables.Cooldown)
		return true
	end
	return true
end
module_upvr_2["Serpent's Fang"] = {}
module_upvr_2["Serpent's Fang"].Variables = {
	ChipDamage_Percent = 20;
	Physical_Defense_Percent = 50;
}
module_upvr_2["Serpent's Fang"].Desc = "Gain chip-damage; deal "..module_upvr_2["Serpent's Fang"].Variables.ChipDamage_Percent.."% bypassed damage when Block-Breaking or hitting an enemy's Block. And ignore "..module_upvr_2["Serpent's Fang"].Variables.Physical_Defense_Percent.."% of enemies' Physical-Defense"
module_upvr_2["Serpent's Fang"].Name = "Serpent's Fang"
module_upvr_2["Serpent's Fang"].Icon = "http://www.roblox.com/asset/?id=15889860574"
module_upvr_2["Serpent's Fang"].Requirement = function(...) -- Line 733
	do
		return true
	end
	return false
end
module_upvr_2["Serpent's Fang"].Activation = function(...) -- Line 745
	--[[ Upvalues[1]:
		[1]: module_upvr_2 (readonly)
	]]
	local var82 = ...
	local Char_2 = var82.self.Char
	if var82.Func == "Setup" then
		Char_2:SetAttribute("Serpents_Fang", module_upvr_2["Serpent's Fang"].Variables.ChipDamage_Percent / 100)
		Char_2:SetAttribute("Serpents_Fang_PD", module_upvr_2["Serpent's Fang"].Variables.Physical_Defense_Percent / 100)
		return true
	end
	return true
end
module_upvr_2["Death God"] = {}
module_upvr_2["Death God"].Variables = {
	Poison_Damage_Percent = 130;
	Poison_Resist_Percent = 130;
}
module_upvr_2["Death God"].Desc = "Gain "..(module_upvr_2["Death God"].Variables.Poison_Damage_Percent - 100).."% increased Poison damage and take "..(module_upvr_2["Death God"].Variables.Poison_Resist_Percent - 100).."% less Poison damage"
module_upvr_2["Death God"].Name = "Death God"
module_upvr_2["Death God"].Icon = "http://www.roblox.com/asset/?id=484395923"
module_upvr_2["Death God"].Requirement = function(...) -- Line 790
	do
		return true
	end
	return false
end
module_upvr_2["Death God"].Activation = function(...) -- Line 802
	--[[ Upvalues[1]:
		[1]: module_upvr_2 (readonly)
	]]
	local var88 = ...
	local Char_3 = var88.self.Char
	if var88.Func == "Setup" then
		Char_3:SetAttribute("Death_God", module_upvr_2["Death God"].Variables.Poison_Damage_Percent / 100)
		Char_3:SetAttribute("Death_God_Resist", module_upvr_2["Death God"].Variables.Poison_Resist_Percent / 100)
		return true
	end
	return true
end
module_upvr_2.Firebrand = {}
module_upvr_2.Firebrand.Variables = {
	Fire_Damage_Percent = 125;
}
module_upvr_2.Firebrand.Desc = "Increase all fire related damage that you deal by "..(module_upvr_2.Firebrand.Variables.Fire_Damage_Percent - 100)..'%'
module_upvr_2.Firebrand.Name = "Firebrand"
module_upvr_2.Firebrand.Icon = "http://www.roblox.com/asset/?id=14502433595"
module_upvr_2.Firebrand.Requirement = function(...) -- Line 846
	local self_7 = ....self
	if ({
		["Hamon (Jonathan Joestar)"] = true;
		["Dragon Sage"] = true;
		Shinobi = true;
		["The Incinerator"] = true;
	})[self_7.PlayerStats.Spec.Value] or ({
		Mera = true;
		["Hermit Purple"] = true;
		["Magician's Red"] = true;
	})[self_7.PlayerStats.Stand.Value] then
		return true
	end
	return false
end
module_upvr_2.Firebrand.Activation = function(...) -- Line 871
	--[[ Upvalues[1]:
		[1]: module_upvr_2 (readonly)
	]]
	local var97 = ...
	if var97.Func == "Setup" then
		var97.self.Char:SetAttribute("Firebrand", module_upvr_2.Firebrand.Variables.Fire_Damage_Percent / 100)
		return true
	end
	return true
end
module_upvr_2["Jeweled Vessel"] = {}
module_upvr_2["Jeweled Vessel"].Variables = {
	Crit_Chance = 25;
}
module_upvr_2["Jeweled Vessel"].Desc = "Gain "..module_upvr_2["Jeweled Vessel"].Variables.Crit_Chance.."% Crit-Chance. Damaging abilities from Fighting-Styles can now Critically-Strike"
module_upvr_2["Jeweled Vessel"].Name = "Jeweled Vessel"
module_upvr_2["Jeweled Vessel"].Icon = "rbxassetid://9563726020"
module_upvr_2["Jeweled Vessel"].Requirement = function(...) -- Line 910
	do
		return true
	end
	return false
end
module_upvr_2["Jeweled Vessel"].Activation = function(...) -- Line 922
	--[[ Upvalues[1]:
		[1]: module_upvr_2 (readonly)
	]]
	local var102 = ...
	local self = var102.self
	if var102.Func == "Setup" then
		self.Char:SetAttribute("Jeweled_Vessel", true)
		self:AddCritChance({
			Name = "Jeweled Vessel";
			Value = module_upvr_2["Jeweled Vessel"].Variables.Crit_Chance;
		})
		return true
	end
	return true
end
module_upvr_2.Bloodthirster = {}
module_upvr_2.Bloodthirster.Variables = {
	Heal_Percent = 10;
}
module_upvr_2.Bloodthirster.Desc = "Dealing damage with a blade heals you for "..module_upvr_2.Bloodthirster.Variables.Heal_Percent.."% dealt"
module_upvr_2.Bloodthirster.Name = "Bloodthirster"
module_upvr_2.Bloodthirster.Icon = "http://www.roblox.com/asset/?id=129698054"
module_upvr_2.Bloodthirster.Requirement = function(...) -- Line 966
	local self_4 = ....self
	if ({
		SwordStyle = true;
		["Shift Sword Style"] = true;
		["Emiya Shirou"] = true;
		["Gate of Babylon"] = true;
		Shinobi = true;
	})[self_4.PlayerStats.Spec.Value] or ({
		Anubis = true;
		["Silver Chariot"] = true;
		["Chariot Requiem"] = true;
		["The World"] = true;
		["The World Alternate Universe"] = true;
		["The World Over Heaven"] = true;
		["Made in Heaven"] = true;
		["Crazy Diamond"] = true;
		["King Crimson Requiem"] = true;
		Aerosmith = true;
		["White Album"] = true;
		["Beach Boy"] = true;
	})[self_4.PlayerStats.Stand.Value] then
		return true
	end
	for _, v in pairs(self_4.Char:GetChildren()) do
		if v:IsA("Tool") and v:GetAttribute("Blade") then
			return true
		end
	end
	return false
end
module_upvr_2.Bloodthirster.Activation = function(...) -- Line 1007
	--[[ Upvalues[1]:
		[1]: module_upvr_2 (readonly)
	]]
	local var116 = ...
	if var116.Func == "Setup" then
		var116.self.Char:SetAttribute("Bloodthirster", module_upvr_2.Bloodthirster.Variables.Heal_Percent / 100)
		return true
	end
	return true
end
module_upvr_2.Immortalized = {}
module_upvr_2.Immortalized.Variables = {
	MaxHealth_Percent = 30;
	Shield_Health_Percent = 25;
	Duration = 5;
	Heal_Percent = 10;
	Cooldown = 90;
}
module_upvr_2.Immortalized.Desc = "Taking damage that would reduce you below "..module_upvr_2.Immortalized.Variables.MaxHealth_Percent.."% max health will first grant you a "..module_upvr_2.Immortalized.Variables.Shield_Health_Percent.."% max health Shield lasting "..module_upvr_2.Immortalized.Variables.Duration.."s. Dealing Basic-Attack (M1/M2) damage heals you for "..module_upvr_2.Immortalized.Variables.Heal_Percent.."% dealt ["..module_upvr_2.Immortalized.Variables.Cooldown.."s CD]"
module_upvr_2.Immortalized.Name = "Immortalized"
module_upvr_2.Immortalized.Icon = "http://www.roblox.com/asset/?id=11322093465"
module_upvr_2.Immortalized.Requirement = function(...) -- Line 1050
	do
		return true
	end
	return false
end
module_upvr_2.Immortalized.Activation = function(...) -- Line 1062
	--[[ Upvalues[1]:
		[1]: module_upvr_2 (readonly)
	]]
	local var121 = ...
	local Char = var121.self.Char
	if var121.Func == "Setup" then
		Char:SetAttribute("Immortalized_Cooldown", module_upvr_2.Immortalized.Variables.Cooldown)
		Char:SetAttribute("Immortalized_Health_Percent", module_upvr_2.Immortalized.Variables.MaxHealth_Percent / 100)
		Char:SetAttribute("Immortalized_Shield_Percent", module_upvr_2.Immortalized.Variables.Shield_Health_Percent / 100)
		Char:SetAttribute("Immortalized_Duration", module_upvr_2.Immortalized.Variables.Duration)
		Char:SetAttribute("Immortalized_Heal", module_upvr_2.Immortalized.Variables.Heal_Percent / 100)
		return true
	end
	return true
end
module_upvr_2["Infinity Edge"] = {}
module_upvr_2["Infinity Edge"].Variables = {
	Damage_Percent = 120;
}
module_upvr_2["Infinity Edge"].Desc = "Increase all blade related damage by "..math.abs(100 - module_upvr_2["Infinity Edge"].Variables.Damage_Percent)..'%'
module_upvr_2["Infinity Edge"].Name = "Infinity Edge"
module_upvr_2["Infinity Edge"].Icon = "http://www.roblox.com/asset/?id=7485051715"
module_upvr_2["Infinity Edge"].Requirement = module_upvr_2.Bloodthirster.Requirement
module_upvr_2["Infinity Edge"].Activation = function(...) -- Line 1123
	--[[ Upvalues[1]:
		[1]: module_upvr_2 (readonly)
	]]
	local var126 = ...
	if var126.Func == "Setup" then
		var126.self.Char:SetAttribute("Infinity_Edge", module_upvr_2["Infinity Edge"].Variables.Damage_Percent / 100)
		return true
	end
	return true
end
module_upvr_2["Enchant: Thorns"] = {}
module_upvr_2["Enchant: Thorns"].Variables = {
	PhysicalDefense = 5;
	Damage_Percent = 25;
}
module_upvr_2["Enchant: Thorns"].Desc = "Gain "..module_upvr_2["Enchant: Thorns"].Variables.PhysicalDefense.." Physical-Defense. When struck by a Basic-Attack (M1/M2), deal "..module_upvr_2["Enchant: Thorns"].Variables.Damage_Percent.."% of the damage back to the attacker"
module_upvr_2["Enchant: Thorns"].Name = "Enchant: Thorns"
module_upvr_2["Enchant: Thorns"].Icon = "http://www.roblox.com/asset/?id=6961006805"
module_upvr_2["Enchant: Thorns"].Requirement = function(...) -- Line 1163
	do
		return true
	end
	return false
end
module_upvr_2["Enchant: Thorns"].Activation = function(...) -- Line 1175
	--[[ Upvalues[1]:
		[1]: module_upvr_2 (readonly)
	]]
	local var131 = ...
	local self_3 = var131.self
	local Char_6 = self_3.Char
	if var131.Func == "Setup" then
		Char_6:SetAttribute("Enchant_Thorns", module_upvr_2["Enchant: Thorns"].Variables.PhysicalDefense / 100)
		Char_6:SetAttribute("Enchant_Thorns_Damage", module_upvr_2["Enchant: Thorns"].Variables.Damage_Percent / 100)
		self_3:UpdatePhysicalDefense()
		return true
	end
	return true
end
module_upvr_2["Blessed Odds"] = {}
module_upvr_2["Blessed Odds"].Variables = {
	Crit_Chance = 40;
}
module_upvr_2["Blessed Odds"].Desc = "Gain "..module_upvr_2["Blessed Odds"].Variables.Crit_Chance.."% Crit-Chance"
module_upvr_2["Blessed Odds"].Name = "Blessed Odds"
module_upvr_2["Blessed Odds"].Icon = "http://www.roblox.com/asset/?id=554784715"
module_upvr_2["Blessed Odds"].Requirement = function(...) -- Line 1221
	do
		return true
	end
	return false
end
module_upvr_2["Blessed Odds"].Activation = function(...) -- Line 1233
	--[[ Upvalues[1]:
		[1]: module_upvr_2 (readonly)
	]]
	local var137 = ...
	if var137.Func == "Setup" then
		var137.self:AddCritChance({
			Name = "Blessed Odds";
			Value = module_upvr_2["Blessed Odds"].Variables.Crit_Chance;
		})
		return true
	end
	return true
end
return module_upvr_2
