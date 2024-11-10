-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2024-11-08 15:43:45
-- Luau version 6, Types version 3
-- Time taken: 0.165049 seconds

local pcall_2_upvr = pcall
local coroutine_upvr = coroutine
local resume_upvr = coroutine_upvr.resume
local create_upvr = coroutine_upvr.create
local wait_upvr = task.wait
local ServerStorage_upvr = game:GetService("ServerStorage")
local ReplicatedStorage_upvr = game:GetService("ReplicatedStorage")
local TweenService_upvr = game:GetService("TweenService")
local CollectionService_upvr = game:GetService("CollectionService")
local module_11_upvr = require(ReplicatedStorage_upvr:WaitForChild("Modules"):WaitForChild("Debris2"))
local ClientFX_upvr = ReplicatedStorage_upvr:WaitForChild("ClientFX")
local var16_upvr
if #game.ServerStorage:GetChildren() ~= 0 then
	var16_upvr = false
else
	var16_upvr = true
end
local module_10_upvr = {
	ItemShop = {
		["1x Mysterious Arrow"] = {
			Item = "Mysterious Arrow";
			Amount = 1;
			Price = 500;
		};
		["5x Mysterious Arrow"] = {
			Item = "Mysterious Arrow";
			Amount = 5;
			Price = 2250;
		};
		["1x Lucky Arrow"] = {
			Item = "Lucky Arrow";
			Amount = 1;
			Price = 50000;
		};
		["1x Rokakaka"] = {
			Item = "Rokakaka";
			Amount = 1;
			Price = 1750;
		};
		["5x Rokakaka"] = {
			Item = "Rokakaka";
			Amount = 5;
			Price = 8000;
		};
		["1x Pure Rokakaka"] = {
			Item = "Pure Rokakaka";
			Amount = 1;
			Price = 2500;
		};
		["1x Rib Cage of the Saint's Corpse"] = {
			Item = "Rib Cage of The Saint's Corpse";
			Amount = 1;
			Price = 2250;
		};
		["5x Rib Cage of the Saint's Corpse"] = {
			Item = "Rib Cage of The Saint's Corpse";
			Amount = 5;
			Price = 10000;
		};
		["1x Left Arm of the Saint's Corpse"] = {
			Item = "Left Arm of The Saint's Corpse";
			Amount = 1;
			Price = 10000;
		};
		["1x Pelvis of The Saint's Corpse"] = {
			Item = "Pelvis of The Saint's Corpse";
			Amount = 1;
			Price = 30000;
		};
		["1x Heart of The Saint's Corpse"] = {
			Item = "Heart of The Saint's Corpse";
			Amount = 1;
			Price = 30000;
		};
		["1x DIO's Diary"] = {
			Item = "Dio's Diary";
			Amount = 1;
			Price = 5000;
		};
	};
	CurrencyShop = {-- : First try: runluau:11745: attempt to index nil with 't'
;
	Max_Finishers = 100;
	Random_Finisher = {
		Product_Id = 1891876901;
		Prices = {
			Robux = 49;
		};
		Rarities = {{
			Rarity = "Common";
			Percent = 79;
		}, {
			Rarity = "Rare";
			Percent = 16;
		}, {
			Rarity = "Epic";
			Percent = 3.7;
		}, {
			Rarity = "Legendary";
			Percent = 1;
		}, {
			Rarity = "Mythical";
			Percent = 0.3;
		}};
	};
	Rollable_Finishers = {};
}
for _, v in pairs(ReplicatedStorage_upvr.Modules:WaitForChild("VFX_Finishers"):GetChildren()) do
	if v:GetAttribute("Rarity") then
		table.insert(module_10_upvr.Rollable_Finishers, {
			Name = v.Name;
			Rarity = v:GetAttribute("Rarity");
		})
	end
end
function module_10_upvr.LoadAnimation(...) -- Line 118
	local var55 = ...
	local Priority = var55.Priority
	local any_LoadAnimation_result1 = var55.Animator:LoadAnimation(var55.Animation)
	if Priority then
		any_LoadAnimation_result1.Priority = Priority
	end
	local var58
	if var58 then
		local function INLINED() -- Internal function, doesn't exist in bytecode
			var58 = var55.Play
			return var58
		end
		if typeof(var55.Play) ~= "table" or not INLINED() then
			var58 = {}
		end
		any_LoadAnimation_result1:Play(var58.FadeIn)
		if var58.Speed then
			any_LoadAnimation_result1:AdjustSpeed(var58.Speed)
		end
		if var58.TimePosition then
			any_LoadAnimation_result1.TimePosition = var58.TimePosition
		end
	end
	return any_LoadAnimation_result1
end
module_10_upvr.Months = {{
	Month = "January";
}, {
	Month = "February";
}, {
	Month = "March";
}, {
	Month = "April";
}, {
	Month = "May";
}, {
	Month = "June";
}, {
	Month = "July";
}, {
	Month = "August";
}, {
	Month = "September";
}, {
	Month = "October";
}, {
	Month = "November";
}, {
	Month = "December";
}}
module_10_upvr.RankPlacementGames = 5
module_10_upvr.Rank_Monthly_Seasons = {1, 5, 9}
module_10_upvr.RankLoot_MaxProgress = 20
module_10_upvr.Max_RankLoot_Inventory = 500
local function var73_upvr(arg1, ...) -- Line 199
	--[[ Upvalues[3]:
		[1]: ClientFX_upvr (readonly)
		[2]: module_10_upvr (readonly)
		[3]: ServerStorage_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var90 = ...
	local Player_2 = arg1.Player
	ClientFX_upvr:FireAllClients("PlaySound", {
		Sound = "Common_Item_Pick";
		Origin = arg1.Root;
	})
	local Item = var90.Item
	if not Item then
		Item = module_10_upvr.ReturnRandomPercentile(var90.Percent).Name
	end
	if not module_10_upvr.DroppableItems[Item] or not module_10_upvr.DroppableItems[Item].Max then
		if not module_10_upvr.MaxItems[Item] or not module_10_upvr.MaxItems[Item].Max then
			local const_number_4 = 99
			local var95
		end
	end
	if const_number_4 and ServerStorage_upvr.PlayerData[Player_2.Name].InventoryGamepass.Value == "Has" then
		local var96 = const_number_4 * 2
	end
	for _, v_2 in pairs(Player_2.Backpack:GetChildren()) do
		if v_2.Name == Item then
			var95 += 1
		end
	end
	for i_3, v_3 in pairs(Player_2.Character:GetChildren()) do
		if v_3.Name == Item then
			var95 += 1
		end
	end
	if var95 < var96 then
		ServerStorage_upvr.Tools[Item]:Clone().Parent = Player_2.Backpack
	elseif var96 <= var95 and arg1.Char:FindFirstChild("RemoteEvent") then
		i_3 = Player_2
		v_3 = "Message"
		arg1.Char:FindFirstChild("RemoteEvent"):FireClient(i_3, v_3, {
			Text = "You can't have more than "..var96..' '..Item.."(s) in your inventory";
		})
	end
end
local tbl_17 = {}
local tbl_41 = {}
local tbl_11 = {
	Rarity = "Common";
	Iron_Percent = 70;
	Bronze_Percent = 68.4;
	Silver_Percent = 67;
	Gold_Percent = 65.2;
	Platinum_Percent = 62.9;
	Diamond_Percent = 60.1;
	Crusader_Percent = 53.2;
	Requiem_Percent = 49.1;
	Ascended_Percent = 46.5;
}
local function Loot(arg1, ...) -- Line 255
	--[[ Upvalues[2]:
		[1]: var73_upvr (readonly)
		[2]: module_10_upvr (readonly)
	]]
	for _ = 1, 3 do
		var73_upvr(arg1, {
			Percent = module_10_upvr.SpawnableItems;
		})
	end
end
tbl_11.Loot = Loot
local tbl_15 = {
	Rarity = "Rare";
	Iron_Percent = 28.65;
	Bronze_Percent = 30;
	Silver_Percent = 31;
	Gold_Percent = 32;
	Platinum_Percent = 33;
	Diamond_Percent = 35;
	Crusader_Percent = 40;
	Requiem_Percent = 40;
	Ascended_Percent = 40;
}
local function Loot(arg1, ...) -- Line 285
	--[[ Upvalues[2]:
		[1]: var73_upvr (readonly)
		[2]: module_10_upvr (readonly)
	]]
	var73_upvr(arg1, {
		Percent = module_10_upvr.SBRItems;
	})
	local any_ReturnCosmeticsInType_result1 = module_10_upvr.ReturnCosmeticsInType(module_10_upvr.ReturnRandomPercentile(module_10_upvr.SBRCosmeticChances).Name)
	_G.Playerlist[arg1.Player.Name].AddCosmetics(any_ReturnCosmeticsInType_result1[math.random(1, #any_ReturnCosmeticsInType_result1)])
end
tbl_15.Loot = Loot
local tbl_19 = {
	Rarity = "Epic";
	Iron_Percent = 1;
	Bronze_Percent = 1.2;
	Silver_Percent = 1.5;
	Gold_Percent = 2;
	Platinum_Percent = 3;
	Diamond_Percent = 3.5;
	Crusader_Percent = 5;
	Requiem_Percent = 8;
	Ascended_Percent = 10;
}
local function Loot(arg1, ...) -- Line 320
	--[[ Upvalues[1]:
		[1]: var73_upvr (readonly)
	]]
	arg1:RandomFinisher()
	var73_upvr(arg1, {
		Item = "Lucky Arrow";
	})
end
tbl_19.Loot = Loot
local tbl_35 = {
	Rarity = "Legendary";
	Iron_Percent = 0.3;
	Bronze_Percent = 0.4;
	Silver_Percent = 0.5;
	Gold_Percent = 0.7;
	Platinum_Percent = 1;
	Diamond_Percent = 1.2;
	Crusader_Percent = 1.5;
	Requiem_Percent = 2.5;
	Ascended_Percent = 3;
}
local function Loot(arg1, ...) -- Line 351
	--[[ Upvalues[1]:
		[1]: var73_upvr (readonly)
	]]
	for _ = 1, 3 do
		var73_upvr(arg1, {
			Item = "Lucky Arrow";
		})
	end
	var73_upvr(arg1, {
		Item = "Lucky Stone Mask";
	})
	arg1:RandomFinisher()
end
tbl_35.Loot = Loot
tbl_41[1] = tbl_11
tbl_41[2] = tbl_15
tbl_41[3] = tbl_19
tbl_41[4] = tbl_35
tbl_41[5] = {
	Rarity = "Jackpot";
	Iron_Percent = 0.05;
	Bronze_Percent = 0.07;
	Silver_Percent = 0.09;
	Gold_Percent = 0.12;
	Platinum_Percent = 0.16;
	Diamond_Percent = 0.2;
	Crusader_Percent = 0.3;
	Requiem_Percent = 0.4;
	Ascended_Percent = 0.5;
	Loot = function(arg1, ...) -- Line 392, Named "Loot"
		--[[ Upvalues[1]:
			[1]: var73_upvr (readonly)
		]]
		for _ = 1, 5 do
			var73_upvr(arg1, {
				Item = "Lucky Arrow";
			})
		end
		local tbl_50 = {"Stop Sign", "Eye of The Saint's Corpse", "Boxing Claws", "Bone Gloves", "Cursed Scythe", "Scythe", "Candy cane", "Festive Gloves", "Festive Blade", "Candy Cane Sword", "Candy Cane Blade", "Festive Scythe", "Cyber Scythe", "Jingle Bell", "Peppermint Ball", "Gold Umbrella", "Crystal Umbrella", "Ice Umbrella"}
		var73_upvr(arg1, {
			Item = tbl_50[math.random(#tbl_50)];
		})
		arg1:RandomFinisher()
	end;
}
tbl_17.Rarities = tbl_41
module_10_upvr.RankLoot_Rarities = tbl_17
module_10_upvr.Ranks = {{
	Rank = "Iron";
	Icon = "rbxassetid://14017065092";
}, {
	Rank = "Bronze";
	Icon = "rbxassetid://14017065816";
}, {
	Rank = "Silver";
	Icon = "rbxassetid://14017064597";
}, {
	Rank = "Gold";
	Icon = "rbxassetid://14017065276";
}, {
	Rank = "Platinum";
	Icon = "rbxassetid://14017064955";
}, {
	Rank = "Diamond";
	Icon = "rbxassetid://14017065452";
}, {
	Rank = "Crusader";
	Icon = "rbxassetid://14017065609";
}, {
	Rank = "Requiem";
	Icon = "rbxassetid://14017064773";
}, {
	Rank = "Ascended";
	Icon = "rbxassetid://14017066103";
}}
module_10_upvr.NameTypes = {
	Snow = {
		Name = "Snow";
	};
	Wood = {
		Name = "Wood";
	};
	Metal = {
		Name = "Metal";
	};
	Grass = {
		Name = "Grass";
	};
	Sand = {
		Name = "Sand";
	};
	Concrete = {
		Name = "Concrete";
	};
	Water = {
		Name = "Water";
	};
}
module_10_upvr.FloorMaterials = {
	[Enum.Material.Grass] = {
		Name = "Grass";
	};
	[Enum.Material.Fabric] = {
		Name = "Grass";
	};
	[Enum.Material.Snow] = {
		Name = "Snow";
	};
	[Enum.Material.Glass] = {
		Name = "Glass";
	};
	[Enum.Material.Rock] = {
		Name = "Concrete";
	};
	[Enum.Material.Concrete] = {
		Name = "Concrete";
	};
	[Enum.Material.Ice] = {
		Name = "Concrete";
	};
	[Enum.Material.Foil] = {
		Name = "Concrete";
	};
	[Enum.Material.ForceField] = {
		Name = "Concrete";
	};
	[Enum.Material.Brick] = {
		Name = "Concrete";
	};
	[Enum.Material.Cobblestone] = {
		Name = "Concrete";
	};
	[Enum.Material.Concrete] = {
		Name = "Concrete";
	};
	[Enum.Material.Granite] = {
		Name = "Concrete";
	};
	[Enum.Material.Ice] = {
		Name = "Concrete";
	};
	[Enum.Material.Marble] = {
		Name = "Concrete";
	};
	[Enum.Material.Neon] = {
		Name = "Concrete";
	};
	[Enum.Material.Pebble] = {
		Name = "Concrete";
	};
	[Enum.Material.Plastic] = {
		Name = "Concrete";
	};
	[Enum.Material.Slate] = {
		Name = "Concrete";
	};
	[Enum.Material.SmoothPlastic] = {
		Name = "Concrete";
	};
	[Enum.Material.Wood] = {
		Name = "Wood";
	};
	[Enum.Material.WoodPlanks] = {
		Name = "Wood";
	};
	[Enum.Material.CorrodedMetal] = {
		Name = "Metal";
	};
	[Enum.Material.DiamondPlate] = {
		Name = "Metal";
	};
	[Enum.Material.Metal] = {
		Name = "Metal";
	};
	[Enum.Material.Water] = {
		Name = "Metal";
	};
}
module_10_upvr.MBRAutoStart = 1200
module_10_upvr.Races = {
	Human = true;
	Vampire = true;
	Majin = {-- : First try: runluau:11745: attempt to index nil with 't'
;
}
module_10_upvr.PlaceIds = {-- : First try: runluau:11745: attempt to index nil with 't'

module_10_upvr.SkillKeys = {
	["Enum.KeyCode.E"] = 'E';
	["Enum.KeyCode.R"] = 'R';
	["Enum.KeyCode.T"] = 'T';
	["Enum.KeyCode.Y"] = 'Y';
	["Enum.KeyCode.U"] = 'U';
	["Enum.KeyCode.G"] = 'G';
	["Enum.KeyCode.H"] = 'H';
	["Enum.KeyCode.J"] = 'J';
	["Enum.KeyCode.K"] = 'K';
	["Enum.KeyCode.L"] = 'L';
	["Enum.KeyCode.Z"] = 'Z';
	["Enum.KeyCode.X"] = 'X';
	["Enum.KeyCode.C"] = 'C';
	["Enum.KeyCode.V"] = 'V';
	["Enum.KeyCode.B"] = 'B';
	["Enum.KeyCode.N"] = 'N';
	["Enum.KeyCode.M"] = 'M';
}
module_10_upvr.LevelMultiplier = 50
module_10_upvr.PointsPerLvl = 2
module_10_upvr.PrestigeLvls = 5
module_10_upvr.MaxPrestige = 3
module_10_upvr.Slot2GP = 9837261
module_10_upvr.Slot3GP = 9838197
module_10_upvr.Slot4GP = 16423469
module_10_upvr.Slot5GP = 16423475
module_10_upvr.StyleSlot2GP = 13258801
module_10_upvr.StyleSlot3GP = 13258808
module_10_upvr.JesusJoinReq = 240
module_10_upvr.RacialFightingStyles = {
	Vampirism = true;
}
module_10_upvr.StandWhitelists = {
	Template = {-- : First try: runluau:11745: attempt to index nil with 't'
;
	Kikoku = {-- : First try: runluau:11745: attempt to index nil with 't'
;
	["Ultra Instinct"] = {-- : First try: runluau:11745: attempt to index nil with 't'
;
	Mera = {-- : First try: runluau:11745: attempt to index nil with 't'
;
	["Paragon Platinum"] = {-- : First try: runluau:11745: attempt to index nil with 't'
;
	["「Star Platinum」"] = {-- : First try: runluau:11745: attempt to index nil with 't'
;
}
module_10_upvr.SBRCosmeticChances = {{
	Name = "Common";
	Percentage = 0.6;
}, {
	Name = "Uncommon";
	Percentage = 0.3;
}, {
	Name = "Epic";
	Percentage = 0.08;
}, {
	Name = "Legendary";
	Percentage = 0.02;
}}
module_10_upvr.StandSkinRarityChances = {{
	Name = "Common";
	Percentage = 0.6;
}, {
	Name = "Uncommon";
	Percentage = 0.3;
}, {
	Name = "Epic";
	Percentage = 0.08;
}, {
	Name = "Legendary";
	Percentage = 0.02;
}}
module_10_upvr.CosmeticRarities = {
	Common = {
		Color = BrickColor.new("Cool yellow").Color;
	};
	Uncommon = {
		Color = BrickColor.new("Mint").Color;
	};
	Epic = {
		Color = BrickColor.new("Royal purple").Color;
	};
	Legendary = {
		Color = BrickColor.new("Gold").Color;
	};
	Unique = {
		Color = BrickColor.new("Carnation pink").Color;
	};
}
module_10_upvr.RequiemStands = {
	["Gold Experience"] = "Gold Experience Requiem";
	["Silver Chariot"] = "Chariot Requiem";
	["King Crimson"] = "King Crimson Requiem";
	["Killer Queen"] = "Killer Queen: Bites the Dust";
	["Star Platinum"] = "Star Platinum: The World";
}
module_10_upvr.RequiemStandNames = {
	["Gold Experience Requiem"] = true;
	["Chariot Requiem"] = true;
	["King Crimson Requiem"] = true;
	["Killer Queen: Bites the Dust"] = true;
	["Star Platinum: The World"] = true;
	["D4C Love Train"] = true;
	["Tusk ACT 4"] = true;
	["The World Over Heaven"] = true;
	["Made in Heaven"] = true;
	["Soft & Wet: Go Beyond"] = true;
}
module_10_upvr.EvolvedStandNames = {
	["Gold Experience Requiem"] = "Gold Experience";
	["Chariot Requiem"] = "Silver Chariot";
	["King Crimson Requiem"] = "King Crimson";
	["Killer Queen: Bites the Dust"] = "Killer Queen";
	["Star Platinum: The World"] = "Star Platinum";
	["D4C Love Train"] = "D4C";
	["Tusk ACT 2"] = "Tusk ACT 1";
	["Tusk ACT 3"] = "Tusk ACT 2";
	["Tusk ACT 4"] = "Tusk ACT 3";
	["The World Over Heaven"] = "The World";
	["C-Moon"] = "Whitesnake";
	["Made in Heaven"] = "C-Moon";
	["Soft & Wet"] = "Soft & Wet: Go Beyond";
}
module_10_upvr.StandPilotSettings = {
	["Red Hot Chili Pepper"] = {
		Speed = 20;
		Type = "Manual Walk";
		Range = 150;
	};
	["C-Moon"] = {
		Speed = 22;
		Type = "Manual Walk";
		Range = 100;
	};
	Whitesnake = {
		Speed = 24;
		Type = "Manual Walk";
		Range = 100;
	};
	["Hierophant Green"] = {
		Speed = 0.5;
		Type = "Manual";
		Range = 70;
	};
	Aerosmith = {
		Speed = 1;
		Type = "Manual";
		Range = 100;
	};
	["Chariot Requiem"] = {
		Speed = 16;
		Type = "Manual Walk";
		Range = 3000;
	};
}
module_10_upvr.Vertices = {{1, 1, -1}, {1, -1, -1}, {-1, -1, -1}, {-1, 1, -1}, {1, 1, 1}, {1, -1, 1}, {-1, -1, 1}, {-1, 1, 1}}
module_10_upvr.AllCFrameAngles = {{{"LookVector", 1}}, {{"LookVector", -1}}, {{"RightVector", 1}}, {{"RightVector", -1}}, {{"UpVector", 1}}, {{"UpVector", -1}}, {{"LookVector", 1}, {"RightVector", 1}}, {{"LookVector", -1}, {"RightVector", 1}}, {{"LookVector", 1}, {"RightVector", -1}}, {{"LookVector", -1}, {"RightVector", -1}}, {{"LookVector", 1}, {"UpVector", 1}}, {{"LookVector", -1}, {"UpVector", 1}}, {{"LookVector", 1}, {"UpVector", -1}}, {{"LookVector", -1}, {"UpVector", -1}}, {{"LookVector", 1}, {"UpVector", 1}}, {{"LookVector", -1}, {"UpVector", 1}}, {{"LookVector", 1}, {"UpVector", -1}}, {{"LookVector", -1}, {"UpVector", -1}}, {{"RightVector", 1}, {"UpVector", 1}}, {{"RightVector", -1}, {"UpVector", 1}}, {{"RightVector", 1}, {"UpVector", -1}}, {{"RightVector", -1}, {"UpVector", -1}}}
module_10_upvr.UnsaveableTools = {
	Revolver = true;
	Tea = true;
	Pizza = true;
	BoomBox = true;
	Dagger = true;
}
module_10_upvr.ThanosSnap = {-- : First try: runluau:11745: attempt to index nil with 't'

module_10_upvr.RBD = {-- : First try: runluau:11745: attempt to index nil with 't'

module_10_upvr.GonPose = {-- : First try: runluau:11745: attempt to index nil with 't'

module_10_upvr.PlugWalk = {-- : First try: runluau:11745: attempt to index nil with 't'

module_10_upvr.TradeableItems = {
	["Eye of The Saint's Corpse"] = {
		Max = 30;
	};
	["Jingle Bell"] = {
		Max = 30;
	};
	["Peppermint Ball"] = {
		Max = 30;
	};
	["Cursed Scythe"] = {
		Max = 30;
	};
	Scythe = {
		Max = 30;
	};
	["Boxing Claws"] = {
		Max = 30;
	};
	["Bone Gloves"] = {
		Max = 30;
	};
	["Stop Sign"] = {
		Max = 30;
	};
	["Candy cane"] = {
		Max = 30;
	};
	["Festive Gloves"] = {
		Max = 30;
	};
	["Festive Scythe"] = {
		Max = 30;
	};
	["Cyber Scythe"] = {
		Max = 30;
	};
	["Candy Cane Sword"] = {
		Max = 30;
	};
	["Festive Blade"] = {
		Max = 30;
	};
	["Candy Cane Blade"] = {
		Max = 30;
	};
}
module_10_upvr.DroppableItems = {
	Diamond = {
		Max = 30;
	};
	["Gold Coin"] = {
		Max = 45;
	};
	["Mysterious Arrow"] = {
		Max = 25;
	};
	["Pure Rokakaka"] = {
		Max = 10;
	};
	Rokakaka = {
		Max = 25;
	};
	["Stone Mask"] = {
		Max = 10;
	};
	["Mysterious Bow"] = {
		Max = 10;
	};
	["Bottle of Blood"] = {
		Max = 2;
	};
	["Rib Cage of The Saint's Corpse"] = {
		Max = 20;
	};
	["Steel Ball"] = {
		Max = 10;
	};
	["Ancient Scroll"] = {
		Max = 10;
	};
	["Caesar's Headband"] = {
		Max = 10;
	};
	Clackers = {
		Max = 10;
	};
	["Zeppeli's Hat"] = {
		Max = 10;
	};
	["Dio's Diary"] = {
		Max = 10;
	};
	["Left Arm of The Saint's Corpse"] = {
		Max = 10;
	};
	["Pelvis of The Saint's Corpse"] = {
		Max = 10;
	};
	["Heart of The Saint's Corpse"] = {
		Max = 10;
	};
	["Quinton's Glove"] = {
		Max = 10;
	};
	["Lucky Arrow"] = {
		Max = 10;
	};
	["Lucky Stone Mask"] = {
		Max = 10;
	};
	["Red Candy"] = {
		Max = 45;
	};
	["Blue Candy"] = {
		Max = 45;
	};
	["Green Candy"] = {
		Max = 45;
	};
	["Yellow Candy"] = {
		Max = 45;
	};
	["Christmas Present"] = {
		Max = 45;
	};
}
module_10_upvr.MaxItems = {
	["Stand Arrow"] = {
		Max = 5;
	};
	Pluck = {
		Max = 30;
	};
	["Boxing Gloves"] = {
		Max = 30;
	};
	Bat = {
		Max = 30;
	};
	["Akuma Gloves"] = {
		Max = 30;
	};
	Shovel = {
		Max = 30;
	};
	Taser = {
		Max = 1;
	};
	Umbrella = {
		Max = 30;
	};
	Dagger = {
		Max = 1;
	};
	BoomBox = {
		Max = 1;
	};
	["Koichi's Suitcase"] = {
		Max = 1;
	};
	Lighter = {
		Max = 1;
	};
	["Requiem Arrow"] = {
		Max = 5;
	};
	Tea = {
		Max = 1;
	};
	Pizza = {
		Max = 1;
	};
	["Pelvis of The Saint's Corpse"] = {
		Max = 5;
	};
	["Heart of The Saint's Corpse"] = {
		Max = 5;
	};
	["Green Baby"] = {
		Max = 5;
	};
	["Dio's Bone"] = {
		Max = 5;
	};
	["Jotaro's Disc"] = {
		Max = 5;
	};
	["DIO's Headband"] = {
		Max = 5;
	};
	["Stand Virus Capsule"] = {
		Max = 1;
	};
	["Cookie Beam"] = {
		Max = 1;
	};
	["Majin Sacrifice"] = {
		Max = 1;
	};
	["Crystal Umbrella"] = {
		Max = 30;
	};
	["Ice Umbrella"] = {
		Max = 30;
	};
	["Gold Umbrella"] = {
		Max = 30;
	};
	["Stop Sign"] = {
		Max = 30;
	};
	Scythe = {
		Max = 30;
	};
	["Boxing Claws"] = {
		Max = 30;
	};
	["Bone Gloves"] = {
		Max = 30;
	};
	["Eye of The Saint's Corpse"] = {
		Max = 30;
	};
	["Cursed Scythe"] = {
		Max = 30;
	};
	["Candy cane"] = {
		Max = 30;
	};
	["Festive Gloves"] = {
		Max = 30;
	};
	["Festive Scythe"] = {
		Max = 30;
	};
	["Cyber Scythe"] = {
		Max = 30;
	};
	["Candy Cane Sword"] = {
		Max = 30;
	};
	["Festive Blade"] = {
		Max = 30;
	};
	["Candy Cane Blade"] = {
		Max = 30;
	};
	["Jingle Bell"] = {
		Max = 30;
	};
	["Peppermint Ball"] = {
		Max = 30;
	};
	["Casual MBR Money 1"] = {
		Max = 30;
	};
	["Casual MBR Money 2"] = {
		Max = 30;
	};
	["Casual MBR Money 3"] = {
		Max = 30;
	};
	["Comp MBR Money 1"] = {
		Max = 30;
	};
	["Comp MBR Money 2"] = {
		Max = 30;
	};
	["Comp MBR Money 3"] = {
		Max = 30;
	};
	["Redeemed Rib Cage of The Saint's Corpse"] = {
		Max = 30;
	};
	["Redeemed Heart of The Saint's Corpse"] = {
		Max = 30;
	};
	["Redeemed Left Arm of The Saint's Corpse"] = {
		Max = 30;
	};
	["Redeemed Pelvis of The Saint's Corpse"] = {
		Max = 30;
	};
	["Redeemed Mysterious Arrow"] = {
		Max = 30;
	};
	["Redeemed Requiem Arrow"] = {
		Max = 30;
	};
	["Redeemed Lucky Arrow"] = {
		Max = 30;
	};
	["Redeemed Pure Rokakaka"] = {
		Max = 30;
	};
	["Redeemed Rokakaka"] = {
		Max = 30;
	};
	["Redeemed Green Baby"] = {
		Max = 30;
	};
	["Redeemed Dio's Diary"] = {
		Max = 30;
	};
}
module_10_upvr.SellableItems = {
	Diamond = 500;
	["Gold Coin"] = 120;
	["Mysterious Arrow"] = 200;
	["Pure Rokakaka"] = 1500;
	Rokakaka = 600;
	["Stone Mask"] = 1000;
	["Rib Cage of The Saint's Corpse"] = 1200;
	["Heart of The Saint's Corpse"] = 2500;
	["Left Arm of The Saint's Corpse"] = 2500;
	["Pelvis of The Saint's Corpse"] = 2500;
	["Steel Ball"] = 1000;
	["Ancient Scroll"] = 1000;
	["Caesar's Headband"] = 1000;
	Clackers = 1000;
	["Zeppeli's Hat"] = 1000;
	["DIO's Headband"] = 2000;
	["Quinton's Glove"] = 1000;
	["Dio's Diary"] = 1000;
	["Green Baby"] = 2500;
	["Casual MBR Money 1"] = 5000;
	["Casual MBR Money 2"] = 4000;
	["Casual MBR Money 3"] = 2500;
	["Comp MBR Money 1"] = 5000;
	["Comp MBR Money 2"] = 5000;
	["Comp MBR Money 3"] = 5000;
	["Redeemed Rib Cage of The Saint's Corpse"] = 1200;
	["Redeemed Heart of The Saint's Corpse"] = 2500;
	["Redeemed Left Arm of The Saint's Corpse"] = 2500;
	["Redeemed Pelvis of The Saint's Corpse"] = 2500;
	["Redeemed Mysterious Arrow"] = 200;
	["Redeemed Pure Rokakaka"] = 1500;
	["Redeemed Rokakaka"] = 600;
}
module_10_upvr.GangRequirements = {
	Cost = 1000;
	Level = 10;
}
module_10_upvr.Swords = {
	Pluck = true;
}
local tbl_48 = {-- : First try: runluau:11745: attempt to index nil with 't'

module_10_upvr.CustomNames = tbl_48
module_10_upvr.CustomChat = {
	UzuKee = {
		Name = tbl_48[19919175].Name;
		NameColor = BrickColor.new("Pink").Color;
	};
	CookieJarian = {
		NameColor = BrickColor.new("Pink").Color;
	};
	Ancient_Fruits = {
		Name = tbl_48[393235591].Name;
	};
	Infernasu = {
		Name = tbl_48[44097012].Name;
	};
	Paragon_Penguin = {
		Name = tbl_48[427348404].Name;
		NameColor = BrickColor.new("Really red").Color;
	};
}
module_10_upvr.CPStandRarities = {{
	Name = "Soft & Wet";
	Percentage = 0.2;
}, {
	Name = "The World Alternate Universe";
	Percentage = 0.2;
}, {
	Name = "Scary Monsters";
	Percentage = 0.2;
}, {
	Name = "D4C";
	Percentage = 0.2;
}, {
	Name = "Tusk ACT 1";
	Percentage = 0.2;
}}
module_10_upvr.StandRarities = {{
	Name = "Stone Free";
	Percentage = 0.02;
}, {
	Name = "Whitesnake";
	Percentage = 0.02;
}, {
	Name = "Purple Haze";
	Percentage = 0.04;
}, {
	Name = "Six Pistols";
	Percentage = 0.08;
}, {
	Name = "Aerosmith";
	Percentage = 0.08;
}, {
	Name = "King Crimson";
	Percentage = 0.025;
}, {
	Name = "Gold Experience";
	Percentage = 0.025;
}, {
	Name = "Sticky Fingers";
	Percentage = 0.075;
}, {
	Name = "Mr. President";
	Percentage = 0.08;
}, {
	Name = "White Album";
	Percentage = 0.075;
}, {
	Name = "Beach Boy";
	Percentage = 0.08;
}, {
	Name = "The Hand";
	Percentage = 0.04;
}, {
	Name = "Crazy Diamond";
	Percentage = 0.025;
}, {
	Name = "Killer Queen";
	Percentage = 0.025;
}, {
	Name = "Red Hot Chili Pepper";
	Percentage = 0.04;
}, {
	Name = "Hermit Purple";
	Percentage = 0.04;
}, {
	Name = "Hierophant Green";
	Percentage = 0.04;
}, {
	Name = "Silver Chariot";
	Percentage = 0.03;
}, {
	Name = "Magician's Red";
	Percentage = 0.05;
}, {
	Name = "Cream";
	Percentage = 0.04;
}, {
	Name = "Star Platinum";
	Percentage = 0.02;
}, {
	Name = "The World";
	Percentage = 0.02;
}, {
	Name = "Anubis";
	Percentage = 0.03;
}}
module_10_upvr.PremiumEvolvedStandRarities = {"The World Over Heaven", "Star Platinum: The World", "Killer Queen: Bites the Dust", "C-Moon", "Made in Heaven", "Tusk ACT 4", "D4C Love Train", "Gold Experience Requiem", "Chariot Requiem", "King Crimson Requiem"}
module_10_upvr.PremiumStandRarities = {"Star Platinum", "Magician's Red", "Hermit Purple", "Hierophant Green", "Silver Chariot", "Anubis", "Cream", "The World", "Crazy Diamond", "The Hand", "Red Hot Chili Pepper", "Killer Queen", "Gold Experience", "Sticky Fingers", "Six Pistols", "Aerosmith", "Purple Haze", "Mr. President", "Beach Boy", "White Album", "King Crimson", "Stone Free", "Whitesnake", "Scary Monsters", "D4C", "The World Alternate Universe", "Soft & Wet"}
module_10_upvr.SpawnableItems = {{
	Name = "Diamond";
	Percentage = 0.03;
	Rarity = "Trinket";
}, {
	Name = "Gold Coin";
	Percentage = 0.1696;
	Rarity = "Trinket";
}, {
	Name = "Mysterious Arrow";
	Percentage = 0.3;
	Rarity = "Artifact";
}, {
	Name = "Rokakaka";
	Percentage = 0.2;
	Rarity = "Artifact";
}, {
	Name = "Pure Rokakaka";
	Percentage = 0.005;
	Rarity = "Artifact";
}, {
	Name = "Rib Cage of The Saint's Corpse";
	Percentage = 0.05;
	Rarity = "Artifact";
}, {
	Name = "Dio's Diary";
	Percentage = 0.01;
	Rarity = "Artifact";
}, {
	Name = "Stone Mask";
	Percentage = 0.015;
	Rarity = "Artifact";
}, {
	Name = "Steel Ball";
	Percentage = 0.01;
	Rarity = "Artifact";
}, {
	Name = "Quinton's Glove";
	Percentage = 0.015;
	Rarity = "Artifact";
}, {
	Name = "Ancient Scroll";
	Percentage = 0.03;
	Rarity = "Artifact";
}, {
	Name = "Caesar's Headband";
	Percentage = 0.015;
	Rarity = "Artifact";
}, {
	Name = "Clackers";
	Percentage = 0.015;
	Rarity = "Artifact";
}, {
	Name = "Zeppeli's Hat";
	Percentage = 0.015;
	Rarity = "Artifact";
}, {
	Name = "Lucky Arrow";
	Percentage = 0.0002;
	Rarity = "Artifact";
}, {
	Name = "Lucky Stone Mask";
	Percentage = 0.0002;
	Rarity = "Artifact";
}, {
	Name = "Green Candy";
	Percentage = 0.03;
	Rarity = "Trinket";
}, {
	Name = "Blue Candy";
	Percentage = 0.03;
	Rarity = "Trinket";
}, {
	Name = "Red Candy";
	Percentage = 0.03;
	Rarity = "Trinket";
}, {
	Name = "Yellow Candy";
	Percentage = 0.03;
	Rarity = "Trinket";
}}
module_10_upvr.ItemMachine = {{
	Name = "Diamond";
	Percentage = 0.05;
	Color = BrickColor.new("Medium blue").Color;
}, {
	Name = "Mysterious Arrow";
	Percentage = 0.3898;
	Color = BrickColor.new("Cool yellow").Color;
}, {
	Name = "Rokakaka";
	Percentage = 0.309;
	Color = BrickColor.new("Medium red").Color;
}, {
	Name = "Pure Rokakaka";
	Percentage = 0.004;
	Color = BrickColor.new("Persimmon").Color;
}, {
	Name = "Dio's Diary";
	Percentage = 0.01;
	Color = BrickColor.new("Fawn brown").Color;
}, {
	Name = "Rib Cage of The Saint's Corpse";
	Percentage = 0.0508;
	Color = BrickColor.new("Fossil").Color;
}, {
	Name = "Heart of The Saint's Corpse";
	Percentage = 0.002;
	Color = BrickColor.new("Really red").Color;
}, {
	Name = "Left Arm of The Saint's Corpse";
	Percentage = 0.02;
	Color = BrickColor.new("Institutional white").Color;
}, {
	Name = "Pelvis of The Saint's Corpse";
	Percentage = 0.002;
	Color = BrickColor.new("Pearl").Color;
}, {
	Name = "Requiem Arrow";
	Percentage = 0.002;
	Color = BrickColor.new("New Yeller").Color;
}, {
	Name = "Ancient Scroll";
	Percentage = 0.03;
	Color = BrickColor.new("Institutional white").Color;
}, {
	Name = "Caesar's Headband";
	Percentage = 0.015;
	Color = BrickColor.new("Institutional white").Color;
}, {
	Name = "Clackers";
	Percentage = 0.015;
	Color = BrickColor.new("Institutional white").Color;
}, {
	Name = "Zeppeli's Hat";
	Percentage = 0.015;
	Color = BrickColor.new("Institutional white").Color;
}, {
	Name = "Stone Mask";
	Percentage = 0.02;
	Color = BrickColor.new("Dark stone grey").Color;
}, {
	Name = "Quinton's Glove";
	Percentage = 0.05;
	Color = BrickColor.new("Brown").Color;
}, {
	Name = "Steel Ball";
	Percentage = 0.02;
	Color = BrickColor.new("Lime green").Color;
}, {
	Name = "Lucky Arrow";
	Percentage = 0.0002;
	Color = BrickColor.new("New Yeller").Color;
}, {
	Name = "Lucky Stone Mask";
	Percentage = 0.0002;
	Color = BrickColor.new("New Yeller").Color;
}}
module_10_upvr.SBRItems = {{
	Name = "Heart of The Saint's Corpse";
	Percentage = 0.3;
}, {
	Name = "Pelvis of The Saint's Corpse";
	Percentage = 0.3;
}, {
	Name = "Left Arm of The Saint's Corpse";
	Percentage = 0.3;
}, {
	Name = "Rib Cage of The Saint's Corpse";
	Percentage = 0.1;
}}
module_10_upvr.BodyParts = {
	StandAura = {
		RightUpperArm = true;
		RightLowerArm = true;
		LeftUpperArm = true;
		LeftLowerArm = true;
		LeftUpperLeg = true;
		LeftLowerLeg = true;
		RightUpperLeg = true;
		RightLowerLeg = true;
		Head = true;
		UpperTorso = true;
		LowerTorso = true;
	};
	HandsFeet = {
		RightHand = true;
		LeftHand = true;
		LeftFoot = true;
		RightFoot = true;
	};
	MainLimbs = {
		RightUpperArm = true;
		RightHand = true;
		LeftUpperArm = true;
		LeftHand = true;
		LeftUpperLeg = true;
		LeftFoot = true;
		RightUpperLeg = true;
		RightFoot = true;
	};
	Limbs = {
		RightUpperArm = true;
		RightLowerArm = true;
		RightHand = true;
		LeftUpperArm = true;
		LeftLowerArm = true;
		LeftHand = true;
		LeftUpperLeg = true;
		LeftLowerLeg = true;
		LeftFoot = true;
		RightUpperLeg = true;
		RightLowerLeg = true;
		RightFoot = true;
	};
	Others = {
		Head = true;
		UpperTorso = true;
		LowerTorso = true;
	};
	All = {
		RightUpperArm = true;
		RightLowerArm = true;
		RightHand = true;
		LeftUpperArm = true;
		LeftLowerArm = true;
		LeftHand = true;
		LeftUpperLeg = true;
		LeftLowerLeg = true;
		LeftFoot = true;
		RightUpperLeg = true;
		RightLowerLeg = true;
		RightFoot = true;
		Head = true;
		UpperTorso = true;
		LowerTorso = true;
	};
	Motors = {
		LeftAnkle = "LeftFoot";
		LeftWrist = "LeftHand";
		LeftElbow = "LeftLowerArm";
		LeftKnee = "LeftLowerLeg";
		LeftShoulder = "LeftUpperArm";
		LeftHip = "LeftUpperLeg";
		Root = "LowerTorso";
		RightAnkle = "RightFoot";
		RightWrist = "RightHand";
		RightElbow = "RightLowerArm";
		RightKnee = "RightLowerLeg";
		RightShoulder = "RightUpperArm";
		RightHip = "RightUpperLeg";
		Waist = "UpperTorso";
		Neck = "Head";
	};
}
module_10_upvr.NewLowestRanking = 300
module_10_upvr.LowestRanking = 100
function module_10_upvr.ReturnScalingIncrease(arg1, arg2, arg3, arg4) -- Line 1417
	return (arg1 * arg2) * ((arg3 - arg4) / arg3)
end
function module_10_upvr.Return1v1MMR(...) -- Line 1429
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var526 = ...
	local Player = var526.Player
	local var528
	if not var528 then
		var528 = Player
		if var528 then
			var528 = Player.Name
		end
	end
	if not var526._1v1Rank then
		if var528 then
			local _1v1_Rank = _G.Playerlist[var528].ReturnData()._1v1_Rank
		end
	end
	if _1v1_Rank.Rank <= 0 and var528 then
	end
	local var530 = _1v1_Rank.Wins + _1v1_Rank.Losses
	local var531 = var530 - (var530) / (_1v1_Rank.Wins / var530)
	local any_lower_result1_2 = tostring(var531):lower()
	if any_lower_result1_2 == "-nan" or any_lower_result1_2 == "nan" or any_lower_result1_2 == "+nan" then
		var531 = 0
	end
	return var531
end
function module_10_upvr.ReturnSprintSpeed(arg1) -- Line 1455
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local Character_3 = arg1.Character
	local var579
	if Character_3 then
		var579 = "Blood"
		local SOME_2 = Character_3:FindFirstChild(var579)
	end
	if Character_3 then
		local Health = Character_3:FindFirstChild("Health")
	end
	var579 = 6
	for _, v_4 in pairs(arg1.CharacterSkillTree:GetChildren()) do
		if v_4.Name:match("Agility") and v_4.Value then
			var579 += 2
		end
	end
	for i_8, v_5 in pairs(arg1.StandSkillTree:GetChildren()) do
		if v_5.Name:match("Agility") and v_5.Value then
			var579 += 2
		end
	end
	local SpecSkillTree_2 = arg1:FindFirstChild("SpecSkillTree")
	if SpecSkillTree_2 then
		i_8 = "Courageous Spirit"
		local SOME_8 = SpecSkillTree_2:FindFirstChild(i_8)
		if Health and SOME_8 and SOME_8.Value then
			i_8 = Health.Value
			v_5 = Health.MaxValue
			i_8 = 0.75
			if i_8 <= i_8 / v_5 then
				var579 += 4
			end
		end
	end
	if Character_3:GetAttribute("DeepPassBubbleBuff") then
		print("sprint buff")
		var579 += 6
	end
	if Character_3:FindFirstChild("Godspeed") then
		var579 *= 2
	end
	if Character_3:GetAttribute("SM_Full_Form") then
		var579 *= 1.25
	end
	if SOME_2 and 0 < SOME_2.Value then
		local const_number_6 = 4
		var579 += math.clamp((const_number_6) * ((SOME_2.Value) / (SOME_2.MaxValue * 0.75)), 0, const_number_6)
	end
	if Character_3:GetAttribute("SecretTechniqueBuff") then
		var579 += 10
	end
	return var579
end
function module_10_upvr.ReturnSlotRequirements(arg1, arg2) -- Line 1516
	-- KONSTANTERROR: [0] 1. Error Block 35 start (CF ANALYSIS FAILED)
	local PlayerStats = arg1.PlayerStats
	local tbl_46 = {}
	local var593
	if 1 > PlayerStats.Prestige.Value then
		var593 = false
	else
		var593 = true
	end
	tbl_46.Slot1 = var593
	if 2 > PlayerStats.Prestige.Value then
		var593 = false
		-- KONSTANTWARNING: GOTO [24] #16
	end
	-- KONSTANTERROR: [0] 1. Error Block 35 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [23] 15. Error Block 38 start (CF ANALYSIS FAILED)
	var593 = true
	tbl_46.Slot2 = var593
	if 3 > PlayerStats.Prestige.Value then
		var593 = false
		-- KONSTANTWARNING: GOTO [35] #23
	end
	-- KONSTANTERROR: [23] 15. Error Block 38 end (CF ANALYSIS FAILED)
end
local UserInputService_upvr = game:GetService("UserInputService")
function module_10_upvr.ReturnMobile() -- Line 1534
	--[[ Upvalues[1]:
		[1]: UserInputService_upvr (readonly)
	]]
	local TouchEnabled = UserInputService_upvr.TouchEnabled
	if not TouchEnabled then
		if UserInputService_upvr.KeyboardEnabled ~= false then
			TouchEnabled = false
		else
			TouchEnabled = true
		end
	end
	return TouchEnabled
end
module_10_upvr.MaxSlot = 40
module_10_upvr.MaxStyleSlot = 20
function module_10_upvr.ReturnSlots(...) -- Line 1541
	local var596 = ...
	local Slot_Type_upvr = var596.Slot_Type
	return (function(arg1) -- Line 1548
		--[[ Upvalues[1]:
			[1]: Slot_Type_upvr (readonly)
		]]
		-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
		local var607
		if typeof(arg1) ~= "table" then
			var607 = false
		else
			var607 = true
		end
		if not var607 or not arg1 then
		end
		local var611
		for i_9, v_6 in pairs(arg1:GetChildren()) do
			local function INLINED_2() -- Internal function, doesn't exist in bytecode
				var611 = Slot_Type_upvr
				var611 = v_6.Name
				return string.sub(var611, 1, #Slot_Type_upvr) == var611
			end
			local function INLINED_3() -- Internal function, doesn't exist in bytecode
				var611 = Slot_Type_upvr
				var611 = i_9
				return string.sub(var611, 1, #Slot_Type_upvr) == var611
			end
			if not var607 and INLINED_2() or INLINED_3() then
				local tbl_38 = {}
				local function INLINED_4() -- Internal function, doesn't exist in bytecode
					var611 = v_6.Name
					return var611
				end
				if var607 or not INLINED_4() then
					var611 = i_9
				end
				tbl_38.Name = var611
				local function INLINED_5() -- Internal function, doesn't exist in bytecode
					var611 = v_6.Value
					return var611
				end
				if var607 or not INLINED_5() then
					var611 = v_6
				end
				tbl_38.Value = var611
				var611 = table.insert
				var611({}, tbl_38)
			end
		end
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		return {}
	end)(var596.ProfileData or var596.PlayerStats)
end
function module_10_upvr.InvisibleTool(arg1, arg2, arg3) -- Line 1569
	--[[ Upvalues[1]:
		[1]: module_10_upvr (readonly)
	]]
	if arg1 and arg2 then
		_G[arg3] = arg2
		for _, v_7 in pairs(arg2:GetDescendants()) do
			if v_7:IsA("BasePart") then
				local OriginalTransparency = v_7:GetAttribute("OriginalTransparency")
				if not OriginalTransparency then
					OriginalTransparency = v_7.Transparency
				end
				v_7:SetAttribute("OriginalTransparency", OriginalTransparency)
				v_7.Transparency = 1
			elseif v_7:IsA("ParticleEmitter") or v_7:IsA("Beam") or v_7:IsA("Trail") then
				local OriginalEnabled = v_7:GetAttribute("OriginalEnabled")
				if not OriginalEnabled then
					OriginalEnabled = v_7.Enabled
				end
				v_7:SetAttribute("OriginalEnabled", OriginalEnabled)
				v_7.Enabled = false
			end
		end
	elseif _G[arg3] then
		module_10_upvr.pcall(function() -- Line 1585
			--[[ Upvalues[1]:
				[1]: arg3 (readonly)
			]]
			for _, v_59 in pairs(_G[arg3]:GetDescendants()) do
				if v_59:IsA("BasePart") then
					v_59.Transparency = v_59:GetAttribute("OriginalTransparency") or 1
				elseif v_59:IsA("ParticleEmitter") or v_59:IsA("Beam") or v_59:IsA("Trail") then
					v_59.Enabled = v_59:GetAttribute("OriginalEnabled")
				end
			end
		end)
		_G[arg3] = nil
	end
end
function module_10_upvr.ScaleModel(arg1, arg2, arg3, arg4, arg5) -- Line 1599
	local descendants = arg1:GetDescendants()
	table.insert(descendants, arg1)
	local p = arg3.p
	local tonumber_result1 = tonumber(arg2)
	local var641
	local function INLINED_6() -- Internal function, doesn't exist in bytecode
		var641 = arg2.X
		return var641
	end
	local function INLINED_7() -- Internal function, doesn't exist in bytecode
		var641 = arg2.Y
		return var641
	end
	if not var641 and (arg2.Y >= arg2.X or arg2.Z >= arg2.X or not INLINED_6()) or arg2.X >= arg2.Y or arg2.Z >= arg2.Y or not INLINED_7() then
		local function INLINED_8() -- Internal function, doesn't exist in bytecode
			var641 = arg2.Z
			return var641
		end
		if arg2.Y >= arg2.Z or arg2.X >= arg2.Z or not INLINED_8() then
			var641 = arg2.X
		end
	end
	for _, v_8 in pairs(descendants) do
		if v_8:IsA("Weld") or v_8:IsA("ManualWeld") or v_8:IsA("WeldConstraint") then
			v_8:Destroy()
		end
	end
	for _, v_9 in pairs(descendants) do
		if not v_9:GetAttribute("DontScale") then
			if v_9:IsA("BasePart") then
				if not v_9:GetAttribute("DontScaleSize") and (not v_9:GetAttribute("DontScaleSizeUnder") or v_9:GetAttribute("DontScaleSizeUnder") <= var641) then
					v_9.Size *= arg2
				end
				v_9.CFrame = CFrame.new(p + (v_9.Position - p) * arg2) * (v_9.CFrame - v_9.Position)
			elseif v_9:IsA("Attachment") and arg4 then
				v_9.WorldPosition = p + (v_9.WorldPosition - p) * arg2
			elseif v_9:IsA("Beam") and arg5 then
				local var648 = tonumber(arg5.AdjustCurveSize) or tonumber_result1
				if var648 then
					v_9.CurveSize0 *= var648
					v_9.CurveSize1 *= var648
				end
				local var649 = tonumber(arg5.AdjustWidth) or tonumber_result1
				if var649 then
					v_9.Width0 *= var649
					v_9.Width1 *= var649
				end
			end
		end
	end
end
function module_10_upvr.CalculateSkinPity(arg1) -- Line 1646
	local PityCount = arg1.PlayerStats:FindFirstChild("PityCount")
	if PityCount.Value <= 0 then
		return 1
	end
	return math.clamp(1 + PityCount.Value / 25, 0, 10)
end
function module_10_upvr.ReturnIsPrivateServerOwner(...) -- Line 1659
	--[[ Upvalues[1]:
		[1]: module_10_upvr (readonly)
	]]
	if game.PrivateServerId ~= "" and game.PrivateServerOwnerId ~= 0 and ....Player.UserId == game.PrivateServerOwnerId then
		return true
	end
	if module_10_upvr.PlaceIds[game.PlaceId].GameType == "Update Place" then
		return true
	end
	if _G.VipPlayers then
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		if _G.VipPlayers[....Player.Name] then
			return true
		end
	end
	return nil
end
function module_10_upvr.ReturnUseAdmin(...) -- Line 1674
	--[[ Upvalues[1]:
		[1]: module_10_upvr (readonly)
	]]
	if module_10_upvr.PlaceIds[game.PlaceId].GameType == "Update Place" then
		return true
	end
	return nil
end
function module_10_upvr.NewUpdatePlayerVisualRankings(...) -- Line 1685
	--[[ Upvalues[1]:
		[1]: module_10_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var671 = ...
	local PlayerDataTable_2 = var671.PlayerDataTable
	local var673 = var671.Type.."_Visual"
	local var675
	if not var675 then
		var675 = {}
	end
	if PlayerDataTable_2 then
		var675[PlayerDataTable_2.UserId] = PlayerDataTable_2
	end
	if var671.Remove then
		var675[var671.Remove] = nil
	end
	for _, v_10 in pairs(var675) do
		table.insert({}, {
			Name = v_10.Name;
			Points = v_10.Points;
			Gang = v_10.Gang;
			UserId = v_10.UserId;
		})
		local var681
	end
	table.sort(var681, function(arg1, arg2) -- Line 1707
		local var683
		if arg2.Points >= arg1.Points then
			var683 = false
		else
			var683 = true
		end
		return var683
	end)
	for i_14, v_11 in pairs(var681) do
		if v_11.UserId and v_11.Points and (module_10_upvr.NewLowestRanking < i_14 or v_11.Points <= 0) then
			var675[v_11.UserId] = nil
		end
	end
	_G[var673]:SetAsync(var673..workspace:GetAttribute("Current_Monthly_Season")..workspace:GetAttribute("Current_Year"), var675)
end
function module_10_upvr.UpdatePlayerVisualRankings(...) -- Line 1721
	--[[ Upvalues[1]:
		[1]: module_10_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var704 = ...
	local PlayerDataTable = var704.PlayerDataTable
	local var706 = var704.Type.."Visual"
	local var708
	if not var708 then
		var708 = {}
	end
	if PlayerDataTable then
		var708[PlayerDataTable.UserId] = PlayerDataTable
	end
	for _, v_12 in pairs(var708) do
		table.insert({}, {
			Name = v_12.Name;
			Points = v_12.Points;
			Gang = v_12.Gang;
			UserId = v_12.UserId;
		})
		local var714
	end
	table.sort(var714, function(arg1, arg2) -- Line 1739
		local var716
		if arg2.Points >= arg1.Points then
			var716 = false
		else
			var716 = true
		end
		return var716
	end)
	for i_16, v_13 in pairs(var714) do
		if v_13.UserId and v_13.Points and (module_10_upvr.LowestRanking < i_16 or v_13.Points <= 0) then
			var708[v_13.UserId] = nil
		end
	end
	_G[var706]:SetAsync(var706.._G.RankingsSeason, var708)
end
local HttpService_upvr = game:GetService("HttpService")
function module_10_upvr.getOutfits(arg1) -- Line 1753
	--[[ Upvalues[2]:
		[1]: pcall_2_upvr (readonly)
		[2]: HttpService_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var726_upvw
	local var728_upvr = "https://avatar.rprxy.xyz/v1/users/"..arg1.."/outfits?itemsPerPage=1000"
	local var5_result1_5, var5_result2_4 = pcall_2_upvr(function() -- Line 1756
		--[[ Upvalues[3]:
			[1]: var726_upvw (read and write)
			[2]: HttpService_upvr (copied, readonly)
			[3]: var728_upvr (readonly)
		]]
		var726_upvw = HttpService_upvr:JSONDecode(HttpService_upvr:GetAsync(var728_upvr, true))
	end)
	if not var5_result1_5 then
		print(var5_result2_4)
	end
	local data = var726_upvw.data
	local module_15 = {}
	for i_17 = 1, #data do
		table.insert(module_15, data[i_17].id)
		local _
	end
	return module_15
end
local MarketplaceService_upvr = game:GetService("MarketplaceService")
function module_10_upvr.ReturnMaxCosmetics(arg1) -- Line 1770
	--[[ Upvalues[1]:
		[1]: MarketplaceService_upvr (readonly)
	]]
	local var736 = 5 * (arg1.PlayerStats.Prestige.Value + 1)
	if MarketplaceService_upvr:UserOwnsGamePassAsync(arg1.UserId, 14597766) then
		var736 *= 2
	end
	return var736
end
function module_10_upvr.ReturnCustomChatStuff(...) -- Line 1783
	--[[ Upvalues[1]:
		[1]: module_10_upvr (readonly)
	]]
	local var738 = ...
	if not var738 then
		var738 = {}
	end
	local Name = var738.Name
	local useNameColor = var738.useNameColor
	local useChatColor = var738.useChatColor
	local var742 = module_10_upvr.CustomChat[Name]
	if var742 then
		local NameColor = var742.NameColor
		local ChatColor = var742.ChatColor
		local Name_2 = var742.Name
		if Name_2 then
			Name = Name_2
		end
		if NameColor then
			useNameColor = NameColor
		end
		if ChatColor then
			useChatColor = ChatColor
		end
	end
	return {
		Player = game:GetService("Players"):findFirstChild(var738.Name);
		Name = Name;
		useNameColor = useNameColor;
		useChatColor = useChatColor;
	}
end
function module_10_upvr.ReturnStandSkinsInRarity(arg1, arg2) -- Line 1813
	--[[ Upvalues[1]:
		[1]: ServerStorage_upvr (readonly)
	]]
	local Skins = ServerStorage_upvr.Stands[arg1]:FindFirstChild("Skins")
	if Skins then
		for _, v_14 in pairs(Skins:GetChildren()) do
			local var754 = ServerStorage_upvr.Skins[v_14.Name]
			if v_14.Value and var754:GetAttribute("Rarity") == arg2 and not var754:GetAttribute("Unrollable") then
				table.insert({}, v_14.Name)
			end
		end
	end
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	return {}
end
function module_10_upvr.ReturnUmbrellaSkinsInType(arg1) -- Line 1830
	--[[ Upvalues[1]:
		[1]: ServerStorage_upvr (readonly)
	]]
	for _, v_15 in pairs(ServerStorage_upvr.Tools:GetChildren()) do
		if v_15:GetAttribute("IsUmbrella") and v_15:GetAttribute("Rarity") == arg1 and not v_15:GetAttribute("Unique") and not v_15:GetAttribute("Unrollable") then
			table.insert({}, v_15)
		end
	end
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	return {}
end
function module_10_upvr.ReturnCosmeticsInType(arg1) -- Line 1842
	--[[ Upvalues[1]:
		[1]: ReplicatedStorage_upvr (readonly)
	]]
	for _, v_16 in pairs(ReplicatedStorage_upvr.Cosmetics:GetChildren()) do
		if v_16:GetAttribute("Rarity") == arg1 and not v_16:GetAttribute("Unique") and not v_16:GetAttribute("Unrollable") then
			table.insert({}, v_16.Name)
		end
	end
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	return {}
end
function module_10_upvr.TimeStop(arg1, arg2, arg3, arg4) -- Line 1854
	--[[ Upvalues[6]:
		[1]: CollectionService_upvr (readonly)
		[2]: module_10_upvr (readonly)
		[3]: ReplicatedStorage_upvr (readonly)
		[4]: module_11_upvr (readonly)
		[5]: ClientFX_upvr (readonly)
		[6]: wait_upvr (readonly)
	]]
	local Char_4_upvr = arg1.Char
	local var769_upvw
	if not arg1.Player then
		var769_upvw *= 3
	end
	if CollectionService_upvr:HasTag(Char_4_upvr, "Two Steps") then
		var769_upvw /= 2
	end
	if arg4 then
		var769_upvw = arg4
	end
	local var770 = arg3 + var769_upvw
	arg1:AddUsingMove({
		Name = arg2..'2';
	})
	local tbl_40 = {}
	tbl_40.Name = arg2
	tbl_40.Timer = var770
	arg1.AddCD(arg1, tbl_40)
	local tbl_23 = {}
	tbl_23.Name = arg2
	tbl_23.Value = -1000
	arg1.AddWalkSpeed(arg1, tbl_23)
	local tbl_51 = {}
	tbl_51.Name = arg2
	tbl_51.Value = -1000
	arg1.AddJumpPower(arg1, tbl_51)
	local tbl_6 = {}
	tbl_6.Name = arg2
	arg1.AddAutoRotate(arg1, tbl_6)
	arg1.RemoveUsingMove(arg1, "TimeStopping")
	if arg1.Player and (not _G.DisabledCooldowns or not _G.DisabledCooldowns[arg1.Player.UserId]) then
		local Folder_2_upvr = Instance.new("Folder")
		Folder_2_upvr.Name = "Time Stop"
		Folder_2_upvr.Parent = arg1.Player
		module_10_upvr.Delay(var770, function() -- Line 1886
			--[[ Upvalues[1]:
				[1]: Folder_2_upvr (readonly)
			]]
			Folder_2_upvr:Destroy()
		end)
	end
	Folder_2_upvr = require(ReplicatedStorage_upvr:WaitForChild("Modules"):WaitForChild("ChannelMod2"))
	local StandMorph_upvr = Char_4_upvr.StandMorph
	local any_new_result1_upvr = Folder_2_upvr.new(0.7462686567164178, function() -- Line 1893
		--[[ Upvalues[10]:
			[1]: Char_4_upvr (readonly)
			[2]: module_11_upvr (copied, readonly)
			[3]: var769_upvw (read and write)
			[4]: ClientFX_upvr (copied, readonly)
			[5]: arg1 (readonly)
			[6]: StandMorph_upvr (readonly)
			[7]: wait_upvr (copied, readonly)
			[8]: module_10_upvr (copied, readonly)
			[9]: CollectionService_upvr (copied, readonly)
			[10]: arg2 (readonly)
		]]
		local Folder = Instance.new("Folder", Char_4_upvr)
		module_11_upvr:AddItem(Folder, var769_upvw + 6)
		Folder.Name = "TimeStopping"
		ClientFX_upvr:FireAllClients("PlaySound", {
			Origin = arg1.Root;
			Sound = StandMorph_upvr["Stand Name"].Value.." Time Stop";
		})
		wait_upvr(0.5)
		local any_ReturnClientCFrame_result1_upvr = arg1:ReturnClientCFrame()
		arg1.TimeStopVictims = {}
		for _, v_17_upvr in pairs(workspace.Living:GetChildren()) do
			module_10_upvr.Spawn(function() -- Line 1907
				--[[ Upvalues[6]:
					[1]: v_17_upvr (readonly)
					[2]: CollectionService_upvr (copied, readonly)
					[3]: any_ReturnClientCFrame_result1_upvr (readonly)
					[4]: var769_upvw (copied, read and write)
					[5]: Char_4_upvr (copied, readonly)
					[6]: arg1 (copied, readonly)
				]]
				local HumanoidRootPart_2 = v_17_upvr:findFirstChild("HumanoidRootPart")
				if HumanoidRootPart_2 then
					if v_17_upvr:findFirstChild("BindableEvent") then
						if not CollectionService_upvr:HasTag(v_17_upvr, "InD4CDimension") and not CollectionService_upvr:HasTag(v_17_upvr, "Return to Zero") and not CollectionService_upvr:HasTag(v_17_upvr, "Universe Resetted") and v_17_upvr:findFirstChild("InTimeStop") == nil and (HumanoidRootPart_2.Position - any_ReturnClientCFrame_result1_upvr.Position).magnitude <= 200 then
							v_17_upvr.BindableEvent:Fire("InTimeStop", {
								Duration = var769_upvw;
								Attacker = Char_4_upvr;
							})
							table.insert(arg1.TimeStopVictims, v_17_upvr)
						end
					end
				end
			end)
		end
		arg1.RemoveWalkSpeed(arg1, arg2)
		arg1.RemoveJumpPower(arg1, arg2)
		arg1.RemoveAutoRotate(arg1, arg2)
		arg1:RemoveUsingMove(arg2..'2')
		module_10_upvr.Delay(var769_upvw, function() -- Line 1923
			--[[ Upvalues[1]:
				[1]: arg1 (copied, readonly)
			]]
			if arg1.TimeStopVictims then
				arg1.TimeStopVictims = nil
			end
		end)
	end)
	function any_new_result1_upvr.Duration() -- Line 1930
		--[[ Upvalues[5]:
			[1]: arg1 (readonly)
			[2]: CollectionService_upvr (copied, readonly)
			[3]: Char_4_upvr (readonly)
			[4]: arg2 (readonly)
			[5]: any_new_result1_upvr (readonly)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [13] 11. Error Block 9 start (CF ANALYSIS FAILED)
		if CollectionService_upvr:HasTag(arg1.Char, "Ragdolled") or CollectionService_upvr:HasTag(Char_4_upvr, "Return to Zero") then
			-- KONSTANTERROR: [29] 24. Error Block 8 start (CF ANALYSIS FAILED)
			arg1.RemoveWalkSpeed(arg1, arg2)
			arg1.RemoveJumpPower(arg1, arg2)
			arg1.RemoveAutoRotate(arg1, arg2)
			arg1:RemoveUsingMove(arg2..'2')
			any_new_result1_upvr:Cancel()
			-- KONSTANTERROR: [29] 24. Error Block 8 end (CF ANALYSIS FAILED)
		end
		-- KONSTANTERROR: [13] 11. Error Block 9 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [58] 48. Error Block 7 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [58] 48. Error Block 7 end (CF ANALYSIS FAILED)
	end
	any_new_result1_upvr:Start()
end
local tbl_22_upvr = {}
local Players_upvr = game:GetService("Players")
function module_10_upvr.getUserIdFromUsername(arg1) -- Line 1949
	--[[ Upvalues[3]:
		[1]: tbl_22_upvr (readonly)
		[2]: Players_upvr (readonly)
		[3]: pcall_2_upvr (readonly)
	]]
	if tbl_22_upvr[arg1] then
		return tbl_22_upvr[arg1]
	end
	local SOME = Players_upvr:FindFirstChild(arg1)
	if SOME then
		tbl_22_upvr[arg1] = SOME.UserId
		return SOME.UserId
	end
	local var800_upvw
	pcall_2_upvr(function() -- Line 1960
		--[[ Upvalues[3]:
			[1]: var800_upvw (read and write)
			[2]: Players_upvr (copied, readonly)
			[3]: arg1 (readonly)
		]]
		var800_upvw = Players_upvr:GetUserIdFromNameAsync(arg1)
	end)
	tbl_22_upvr[arg1] = var800_upvw
	return var800_upvw
end
function module_10_upvr.Raycast(...) -- Line 1967
	--[[ Upvalues[1]:
		[1]: module_10_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var811 = ...
	local tbl_44 = {workspace.CurrentCamera, workspace.IgnoreInstances, workspace:FindFirstChild("Mob_Spawns"), workspace:FindFirstChild("Mob_Spawns2")}
	local var813
	if var811.Ignore then
		local pairs_result1_44, pairs_result2_21, pairs_result3_6 = pairs(var811.Ignore)
		for _, v_18 in pairs_result1_44, pairs_result2_21, pairs_result3_6 do
			table.insert(tbl_44, v_18)
		end
	end
	if not var811.RaycastParams then
		local RaycastParams_new_result1 = RaycastParams.new()
	end
	pairs_result2_21 = var811.FilterType
	local var818 = pairs_result2_21
	if not var818 then
		var818 = Enum.RaycastFilterType.Blacklist
	end
	RaycastParams_new_result1.FilterType = var818
	RaycastParams_new_result1.FilterDescendantsInstances = tbl_44
	local workspace_Raycast_result1 = workspace:Raycast(var811.Origin, var811.Ray, RaycastParams_new_result1)
	pairs_result3_6 = workspace_Raycast_result1
	if pairs_result3_6 then
		pairs_result3_6 = workspace_Raycast_result1.Instance
	end
	if workspace_Raycast_result1 then
	end
	if workspace_Raycast_result1 then
	end
	if workspace_Raycast_result1 then
	end
	local function INLINED_9() -- Internal function, doesn't exist in bytecode
		local var820
		return var820
	end
	if var811.IgnoreNonCollisionMap and pairs_result3_6 and not pairs_result3_6.CanCollide and INLINED_9() and (not var811.RecursiveCount or var811.RecursiveCount < 10) then
		if not pairs_result3_6.Parent:FindFirstChild("Health") then
			local var821
		end
		if not pairs_result3_6.Parent.Parent:FindFirstChild("Health") then
			var821 = table.insert
			var821(tbl_44, pairs_result3_6)
			var811.Ignore = tbl_44
			local function INLINED_10() -- Internal function, doesn't exist in bytecode
				var821 = var811.RecursiveCount + 1
				return var821
			end
			if not var811.RecursiveCount or not INLINED_10() then
				var821 = 1
			end
			var811.RecursiveCount = var821
			var811.RaycastParams = RaycastParams_new_result1
			var821 = module_10_upvr.Raycast(var811)
			return var821
		end
	end
	return pairs_result3_6, workspace_Raycast_result1.Position, workspace_Raycast_result1.Normal, workspace_Raycast_result1.Distance
end
function module_10_upvr.CheckPartInfront(arg1, arg2, arg3, arg4, arg5, arg6) -- Line 2007
	--[[ Upvalues[1]:
		[1]: module_10_upvr (readonly)
	]]
	local var827
	if not var827 then
		var827 = {}
	end
	if arg5 then
		for _, v_19 in pairs(arg5:GetChildren()) do
			if v_19:IsA("BasePart") then
				table.insert(var827, v_19)
			elseif v_19:IsA("Accessory") then
				table.insert(var827, v_19:findFirstChildWhichIsA("BasePart"))
			end
		end
	end
	local workspace_FindPartOnRayWithIgnoreList_result1, workspace_FindPartOnRayWithIgnoreList_result2, workspace_FindPartOnRayWithIgnoreList_result3 = workspace:FindPartOnRayWithIgnoreList(Ray.new(arg1, (arg2.p - arg1).unit * arg3), var827, false, true)
	if workspace_FindPartOnRayWithIgnoreList_result1 then
		if workspace_FindPartOnRayWithIgnoreList_result1.CanCollide and workspace_FindPartOnRayWithIgnoreList_result2 and (not arg6 or not workspace_FindPartOnRayWithIgnoreList_result1:IsDescendantOf(workspace.Living)) then
			return workspace_FindPartOnRayWithIgnoreList_result2, workspace_FindPartOnRayWithIgnoreList_result1, {
				SurfaceNormal = workspace_FindPartOnRayWithIgnoreList_result3;
			}
		end
	end
	if workspace_FindPartOnRayWithIgnoreList_result1 then
		table.insert(var827, workspace_FindPartOnRayWithIgnoreList_result1)
		return module_10_upvr.CheckPartInfront(arg1, arg2, arg3, var827, arg5)
	end
	return arg2.p, false, {
		SurfaceNormal = workspace_FindPartOnRayWithIgnoreList_result3;
	}
end
function module_10_upvr.GetPoint(arg1, arg2) -- Line 2036
	local tbl_18 = {}
	tbl_18[1] = arg2
	local _, workspace_FindPartOnRayWithWhitelist_result2 = workspace:FindPartOnRayWithWhitelist(Ray.new(arg1.Position, (arg2.Position - arg1.Position).unit * 999), tbl_18)
	return workspace_FindPartOnRayWithWhitelist_result2
end
function module_10_upvr.GetPosAndSizeBetweenParts(arg1, arg2, arg3) -- Line 2042
	--[[ Upvalues[1]:
		[1]: module_10_upvr (readonly)
	]]
	local any_GetPoint_result1_2 = module_10_upvr.GetPoint(arg2, arg1)
	local any_GetPoint_result1 = module_10_upvr.GetPoint(arg1, arg2)
	return any_GetPoint_result1_2 + (any_GetPoint_result1 - any_GetPoint_result1_2) / (arg3 or 2), (any_GetPoint_result1 - any_GetPoint_result1_2).Magnitude
end
function module_10_upvr.UnpilotStand(arg1) -- Line 2052
	--[[ Upvalues[1]:
		[1]: module_10_upvr (readonly)
	]]
	if not arg1.IsPiloting then
	else
		arg1.IsPiloting = nil
		arg1.PilotCam:Destroy()
		local StandMorph_upvr_2 = arg1.Char:findFirstChild("StandMorph")
		module_10_upvr.pcall(function() -- Line 2060
			--[[ Upvalues[3]:
				[1]: StandMorph_upvr_2 (readonly)
				[2]: arg1 (readonly)
				[3]: module_10_upvr (copied, readonly)
			]]
			if StandMorph_upvr_2.Parent ~= nil then
				local StandAttach = StandMorph_upvr_2.HumanoidRootPart.StandAttach
				for _, v_55 in pairs(StandMorph_upvr_2:GetDescendants()) do
					if v_55:IsA("BasePart") or v_55:IsA("UnionOperation") then
						v_55.CollisionGroup = "Stands"
					end
				end
				arg1.IsPilotingFolder:Destroy()
				arg1.PilotSpeed:Destroy()
				if arg1.PilotBodyPosition then
					arg1.PilotBodyPosition:Destroy()
				end
				if arg1.PilotBodyGyro then
					arg1.PilotBodyGyro:Destroy()
				end
				for _, v_56 in pairs(StandMorph_upvr_2:GetChildren()) do
					if v_56:IsA("BasePart") and (module_10_upvr.BodyParts.All[v_56.Name] or v_56.Name == "HumanoidRootPart") then
						if not v_56:GetAttribute("MassOn") then
							v_56.Massless = true
						end
					end
				end
				StandMorph_upvr_2.HumanoidRootPart.CustomPhysicalProperties = nil
				StandMorph_upvr_2.HumanoidRootPart.CFrame = arg1.Root.CFrame
				if arg1.Player then
					StandMorph_upvr_2.PrimaryPart:SetNetworkOwner(arg1.Player)
				end
				StandAttach.AlignOrientation.Attachment0 = StandAttach
				StandAttach.AlignPosition.Attachment0 = StandAttach
				if arg1.PilotAnimIdle then
					arg1.PilotAnimIdle:Stop()
				end
				local Shadow_Atmosphere = StandMorph_upvr_2:FindFirstChild("Shadow Atmosphere")
				if Shadow_Atmosphere then
					Shadow_Atmosphere:Destroy()
				end
			end
		end)
		arg1.Player.CameraMinZoomDistance = 0.5
		arg1.RemoveWalkSpeed(arg1, "Pilot")
		arg1.RemoveJumpPower(arg1, "Pilot")
	end
end
function module_10_upvr.ReturnServerList(arg1) -- Line 2103
	if arg1 then
		for _, v_20 in pairs(arg1) do
			local function INLINED_11() -- Internal function, doesn't exist in bytecode
				table.insert({}, v_20.Code)
				return 25 <= 0 + 1
			end
			if not v_20.Code or v_20.Commenced or INLINED_11() then break end
		end
	end
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	return {}
end
module_10_upvr["New Game Mode Code"] = function(arg1, arg2, arg3) -- Line 2124
	--[[ Upvalues[2]:
		[1]: pcall_2_upvr (readonly)
		[2]: module_10_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	-- KONSTANTERROR: [0] 1. Error Block 49 start (CF ANALYSIS FAILED)
	local var873
	if not arg3 then
	end
	if not _G[arg2]:GetAsync(arg2) then
		print("Breh no data doe #1")
	end
	local any_ReserveServer_result1 = game:GetService("TeleportService"):ReserveServer(arg1)
	var873 = 1
	var873 = nil
	if arg2 == "Metal Ball Run" then
		local _ = {
			Players = 0;
			RequiredPlayers = 16;
			MaxPlayers = 30;
			Commenced = false;
			Code = any_ReserveServer_result1;
			ShortenedCode = string.sub(any_ReserveServer_result1, var873, 50);
			OsTime = os.time();
		}
		var873 = _G.CasualSBR
	elseif arg2 == "[COMPETITIVE] Metal Ball Run" then
		local tbl_20 = {
			Players = 0;
			RequiredPlayers = 16;
			MaxPlayers = 30;
			Commenced = false;
			Code = any_ReserveServer_result1;
		}
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		tbl_20.ShortenedCode = string.sub(any_ReserveServer_result1, var873, 50)
		tbl_20.OsTime = os.time()
		var873 = _G.CompetitiveSBR
	end
	local pairs_result1_32, pairs_result2_8, pairs_result3_24 = pairs({})
	-- KONSTANTERROR: [0] 1. Error Block 49 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [154] 111. Error Block 21 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [154] 111. Error Block 21 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [100] 69. Error Block 55 start (CF ANALYSIS FAILED)
	-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [154.14]
	if nil then
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		if not nil then
			-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [154.15]
			if nil then
				-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [154.17]
				local function INLINED_15() -- Internal function, doesn't exist in bytecode
					-- KONSTANTERROR: Expression was reused, decompilation is incorrect
					return nil
				end
				local function INLINED_16() -- Internal function, doesn't exist in bytecode
					-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [154.18]
					return nil <= nil
				end
				local function INLINED_17() -- Internal function, doesn't exist in bytecode
					-- KONSTANTERROR: Expression was reused, decompilation is incorrect
					return nil
				end
				if nil or not INLINED_15() or INLINED_16() or not INLINED_17() then
					-- KONSTANTWARNING: GOTO [154] #111
				end
			else
			end
		end
	end
	-- KONSTANTERROR: [100] 69. Error Block 55 end (CF ANALYSIS FAILED)
end
function module_10_upvr.Debris(arg1, arg2) -- Line 2254
	--[[ Upvalues[1]:
		[1]: module_10_upvr (readonly)
	]]
	module_10_upvr.Delay(arg2, function() -- Line 2255
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		if arg1 then
			arg1:Destroy()
		end
	end)
end
function module_10_upvr.ReturnRomanNumeral(arg1) -- Line 2260
	local var886 = arg1
	local tbl_12 = {}
	local tbl_27 = {1000, 'M'}
	tbl_12[1] = tbl_27
	tbl_12[2] = {900, "CM"}
	tbl_12[3] = {500, 'D'}
	tbl_12[4] = {400, "CD"}
	tbl_12[5] = {100, 'C'}
	tbl_12[6] = {90, "XC"}
	tbl_12[7] = {50, 'L'}
	tbl_12[8] = {40, "XL"}
	tbl_12[9] = {10, 'X'}
	tbl_12[10] = {9, "IX"}
	tbl_12[11] = {5, 'V'}
	tbl_12[12] = {4, "IV"}
	tbl_12[13] = {1, 'I'}
	tbl_27 = ""
	local var901
	while 0 < var886 do
		for _, v_21 in pairs(tbl_12) do
			while v_21[1] <= var886 do
				var901 = var901..v_21[2]
			end
		end
	end
	return var901
end
function module_10_upvr.ReturnIsEven(arg1) -- Line 2294
	local var906
	if arg1 % 2 ~= 0 then
		var906 = false
	else
		var906 = true
	end
	return var906
end
function module_10_upvr.OwnCocoJumbo(arg1) -- Line 2298
	local var912
	if not arg1 then
		var912 = false
		return var912
	end
	var912 = workspace.Coco_Jumbos:FindFirstChild(arg1.Name, true)
	if var912 then
		return var912
	end
	for _, v_22 in pairs(workspace.Coco_Jumbos:GetChildren()) do
		local Owner = v_22.Owner
		local children = Owner:GetChildren()
		if #children == 0 or not game.Players:FindFirstChild(children[1].Name) then
			local Folder_3 = Instance.new("Folder")
			Folder_3.Name = arg1.Name
			Folder_3.Parent = Owner
			var912 = v_22
			return var912
		end
	end
	return var912
end
function module_10_upvr.ReturnInGameMode() -- Line 2325
	--[[ Upvalues[1]:
		[1]: ReplicatedStorage_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	local var919
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [16] 11. Error Block 7 start (CF ANALYSIS FAILED)
	if ReplicatedStorage_upvr.Game_Modes["2v2s"].PlaceIds:FindFirstChild(game.PlaceId) or ReplicatedStorage_upvr.Game_Modes["Metal Ball Run"].PlaceIds:FindFirstChild(game.PlaceId) then
		-- KONSTANTERROR: [46] 29. Error Block 4 start (CF ANALYSIS FAILED)
		var919 = true
		-- KONSTANTERROR: [46] 29. Error Block 4 end (CF ANALYSIS FAILED)
	end
	do
		return var919
	end
	-- KONSTANTERROR: [16] 11. Error Block 7 end (CF ANALYSIS FAILED)
end
function module_10_upvr.EnterCocoJumbo(arg1, arg2, arg3, arg4) -- Line 2335
	--[[ Upvalues[4]:
		[1]: CollectionService_upvr (readonly)
		[2]: module_11_upvr (readonly)
		[3]: module_10_upvr (readonly)
		[4]: ServerStorage_upvr (readonly)
	]]
	if CollectionService_upvr:HasTag(arg1, "Ragdolled") or CollectionService_upvr:HasTag(arg1, "Bites the Dust") or arg1:FindFirstChild("ExitedCocoJumbo") then return end
	local var947 = arg3 or 5
	local any_GetPlayerFromCharacter_result1_upvr = game.Players:GetPlayerFromCharacter(arg1)
	local any_HasTag_result1_2 = CollectionService_upvr:HasTag(arg1, "Time Acceleration")
	if any_HasTag_result1_2 then
		local BindableEvent_3 = arg1:FindFirstChild("BindableEvent")
		if arg1:FindFirstChild("Humanoid") and any_HasTag_result1_2:FindFirstChild("Seat") and BindableEvent_3 then
			BindableEvent_3:Fire("Knock", 1)
			BindableEvent_3:Fire("AddWalkSpeed", {
				Name = "InCocoJumboSBR";
				Value = -100;
				Timer = var947;
			})
			local StringValue = Instance.new("StringValue")
			module_11_upvr:AddItem(StringValue, var947)
			StringValue.Name = "InCocoJumbo"
			StringValue.Value = arg2
			StringValue.Parent = arg1
			StringValue:SetAttribute("VictimOriginPosition", arg1.PrimaryPart.Position)
			return
		end
	end
	if arg1:FindFirstChild("InCocoJumbo") then return end
	local SOME_4 = workspace.Coco_Jumbos:FindFirstChild(arg2, true)
	if not SOME_4 then return end
	local Parent_upvw_2 = SOME_4.Parent.Parent
	local CFrame_upvr = arg1.HumanoidRootPart.CFrame
	local StringValue_3 = Instance.new("StringValue")
	StringValue_3.Parent = arg1
	StringValue_3.Name = "InCocoJumbo"
	StringValue_3.Value = arg2
	local ObjectValue_3 = Instance.new("ObjectValue")
	ObjectValue_3.Parent = StringValue_3
	ObjectValue_3.Name = "Captor"
	ObjectValue_3.Value = arg4
	local CFrameValue_2 = Instance.new("CFrameValue")
	CFrameValue_2.Parent = StringValue_3
	CFrameValue_2.Name = "CFrame"
	CFrameValue_2.Value = CFrame_upvr
	if any_GetPlayerFromCharacter_result1_upvr then
		local var959_upvw
		local var960 = arg4 or any_GetPlayerFromCharacter_result1_upvr
		if var960 then
			local any_ReturnStandsData_result1_4 = _G.Playerlist[var960.Name].ReturnStandsData()
			if any_ReturnStandsData_result1_4.Main and any_ReturnStandsData_result1_4.Main.Skin and any_ReturnStandsData_result1_4.Main.Skin ~= "None" then
				var959_upvw = any_ReturnStandsData_result1_4.Main.Skin
			end
		end
		module_10_upvr.pcall(function() -- Line 2405
			--[[ Upvalues[4]:
				[1]: arg1 (readonly)
				[2]: any_GetPlayerFromCharacter_result1_upvr (readonly)
				[3]: Parent_upvw_2 (read and write)
				[4]: var959_upvw (read and write)
			]]
			local _ = {
				Room = Parent_upvw_2.Name;
				Skin = var959_upvw;
			}
		end)
	end
	arg1.BindableEvent:Fire("AddTP", {
		CFrame = Parent_upvw_2.Teleport.CFrame;
	})
	local clone_5_upvr = ServerStorage_upvr.Objects.ExitCocoJumbo:Clone()
	clone_5_upvr.Parent = any_GetPlayerFromCharacter_result1_upvr.PlayerGui
	clone_5_upvr.TextButton.Visible = false
	module_10_upvr.Delay(var947, function() -- Line 2419
		--[[ Upvalues[6]:
			[1]: clone_5_upvr (readonly)
			[2]: any_GetPlayerFromCharacter_result1_upvr (readonly)
			[3]: CFrame_upvr (readonly)
			[4]: arg2 (readonly)
			[5]: module_10_upvr (copied, readonly)
			[6]: arg1 (readonly)
		]]
		if clone_5_upvr == nil or clone_5_upvr.Parent == nil then
		else
			clone_5_upvr.TextButton.Visible = true
			local var968_upvw
			local var969_upvw
			var969_upvw = clone_5_upvr.TextButton.MouseButton1Click:connect(function() -- Line 2427
				--[[ Upvalues[7]:
					[1]: var968_upvw (read and write)
					[2]: any_GetPlayerFromCharacter_result1_upvr (copied, readonly)
					[3]: CFrame_upvr (copied, readonly)
					[4]: arg2 (copied, readonly)
					[5]: module_10_upvr (copied, readonly)
					[6]: arg1 (copied, readonly)
					[7]: var969_upvw (read and write)
				]]
				local var970
				if var970 then
				else
					var970 = true
					var968_upvw = var970
					var970 = any_GetPlayerFromCharacter_result1_upvr.PlayerStats.Race.Value
					if var970 == "Majin" then
						var970 = "Human"
					end
					local _ = workspace.Spawns[var970]
					local SOME_5 = game.Players:FindFirstChild(arg2)
					local var973
					if SOME_5 and SOME_5.Character then
						if SOME_5.Character:findFirstChild("InCocoJumbo") == nil and SOME_5.Character:FindFirstChild("HumanoidRootPart") and not module_10_upvr.ReturnInGameMode() then
							var973 = SOME_5.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
						end
					end
					module_10_upvr.ExitCocoJumbo(arg1, arg2, var973)
					var969_upvw:Disconnect()
				end
			end)
		end
	end)
	return StringValue_3
end
function module_10_upvr.ExitCocoJumbo(arg1, arg2, arg3) -- Line 2455
	--[[ Upvalues[2]:
		[1]: module_10_upvr (readonly)
		[2]: module_11_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	local InCocoJumbo = arg1:FindFirstChild("InCocoJumbo")
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [15] 12. Error Block 2 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [15] 12. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [20] 16. Error Block 3 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [20] 16. Error Block 3 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [24] 18. Error Block 4 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [24] 18. Error Block 4 end (CF ANALYSIS FAILED)
end
function module_10_upvr.Round(arg1, arg2) -- Line 2554
	local var975 = 10 ^ (arg2 or 0)
	return math.floor(arg1 * var975 + 0.5) / var975
end
function module_10_upvr.Ban(...) -- Line 2559
	--[[ Upvalues[3]:
		[1]: ServerStorage_upvr (readonly)
		[2]: module_10_upvr (readonly)
		[3]: pcall_2_upvr (readonly)
	]]
	local var984 = ...
	local Id_upvr = var984.Id
	local Type_upvr = var984.Type
	local Reason_upvr = var984.Reason
	local Admin = var984.Admin
	local var989_upvr
	local function INLINED_18() -- Internal function, doesn't exist in bytecode
		var989_upvr = Admin.Name
		return var989_upvr
	end
	if not Admin or not INLINED_18() then
		var989_upvr = '?'
	end
	if Admin then
		local LastBanned = ServerStorage_upvr.PlayerData[Admin.Name].LastBanned
		if os.time() - LastBanned.Value < 10 then
			Admin.Character.RemoteEvent:FireClient(Admin, "Message", {
				Duration = 5;
				Text = "Admin is on cooldown: "..module_10_upvr.convertToHMS((10) - (os.time() - LastBanned.Value)).." remaining";
			})
			return
		end
		LastBanned.Value = os.time()
	end
	for _, v_23 in pairs(game:GetService("GroupService"):GetGroupsAsync(tonumber(Id_upvr))) do
		if v_23.Id == ServerStorage_upvr.Admins:FindFirstChild("Group").ID.Value then
			if Type_upvr and 6 <= v_23.Rank then
				_G.DiscordWebhook("Tag1", var989_upvr.." tried to ban User ID "..Id_upvr..", but it failed because the user is in the group, "..v_23.Name..", with the role, "..v_23.Role, "Admin CMD Usage", "BAN Attempt")
				return
			end
		end
	end
	local var995_upvw
	local module_5_upvr = {}
	local var5_result1, var5_result2 = pcall_2_upvr(function() -- Line 2597
		--[[ Upvalues[3]:
			[1]: var995_upvw (read and write)
			[2]: Id_upvr (readonly)
			[3]: module_5_upvr (readonly)
		]]
		var995_upvw = _G.BansDataStore:GetAsync(Id_upvr)
		if var995_upvw then
			for i_28, v_24 in pairs(var995_upvw) do
				module_5_upvr[i_28] = v_24
			end
		end
	end)
	if not var5_result1 then
		print(var5_result2)
		return
	end
	if var995_upvw and var995_upvw.Banned == Type_upvr then
		if not Type_upvr then
		else
		end
		if var989_upvr ~= '?' then
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect (x2)
			_G.DiscordWebhook("Tag1", var989_upvr.." tried to ".."Ban".." User ID "..Id_upvr..", but it failed because the user is already ".."Ban".."ned. (Tag - "..game.GameId.." | Reason - "..tostring(var995_upvw.Reason)..')', "Admin CMD Usage", string.upper("Ban").." Attempt")
		end
		return
	end
	if var5_result1 and Type_upvr and var989_upvr == '?' then
		_G.DiscordWebhook("Tag2", "The anti exploit banned User ID "..Id_upvr.." (Tag - "..game.GameId.." | Reason - "..tostring(Reason_upvr)..')', "GAME BAN", "ANTI EXPLOIT", "828598073143984182")
	end
	local var5_result1_3, var5_result2_5 = pcall_2_upvr(function() -- Line 2628
		--[[ Upvalues[4]:
			[1]: Id_upvr (readonly)
			[2]: Type_upvr (readonly)
			[3]: Reason_upvr (readonly)
			[4]: var989_upvr (readonly)
		]]
		local os_time_result1 = os.time()
		local os_date_result1 = os.date("*t", os_time_result1)
		_G.RankingsSeason = os_date_result1.year..os_date_result1.month
		local module_7 = {
			Banned = Type_upvr;
			Reason = Reason_upvr or "";
			OsTime = os_time_result1;
		}
		local var1009 = Type_upvr
		if var1009 then
			var1009 = os_date_result1.year
		end
		module_7.Year = var1009
		var1009 = Type_upvr
		local var1010 = var1009
		if var1010 then
			var1010 = os_date_result1.month
		end
		module_7.Month = var1010
		var1010 = Type_upvr
		local var1011 = var1010
		if var1011 then
			var1011 = os_date_result1.day
		end
		module_7.Day = var1011
		module_7.Admin = var989_upvr
		return _G.BansDataStore:SetAsync(Id_upvr, module_7)
	end)
	if not var5_result1_3 then
		print("UNABLE TO BAN! ERROR: "..var5_result2_5)
		return
	end
	if Type_upvr then
		for _, v_25 in pairs(game.Players:GetChildren()) do
			if v_25.UserId == Id_upvr then
				v_25:Kick(Reason_upvr or "")
			end
		end
	end
	return module_5_upvr
end
function module_10_upvr.convertToHMS(arg1) -- Line 2658
	local function _(arg1_2) -- Line 2659
		return string.format("%02i", arg1_2)
	end
	local var1018 = (arg1 - arg1 % 60) / 60
	local var1019 = (var1018 - var1018 % 60) / 60
	return string.format("%02i", var1019)..':'..string.format("%02i", var1018 - var1019 * 60)..':'..string.format("%02i", arg1 - var1018 * 60)
end
function module_10_upvr.ReturnRandomPercentile(arg1) -- Line 2671
	local module = {unpack(arg1)}
	local tbl_7 = {unpack(arg1)}
	for i_30 = 1, #module do
		module[i_30] = table.remove(tbl_7, math.random(#tbl_7))
	end
	for i_31 = 1, #module do
		if math.random() < module[i_31].Percentage + 0 then
			return module[i_31]
		end
	end
	print("Percent total was lower than 100.. returning random in table...")
	return module[math.random(1, #module)]
end
function module_10_upvr.FindIn(arg1, arg2) -- Line 2695
	local module_12 = {}
	for _, v_26 in pairs(arg1:GetChildren()) do
		if v_26.Name:lower() == arg2:lower() then
			return v_26
		end
		module_12[v_26.Name:sub(1, #arg2):lower()] = v_26
	end
	if module_12[arg2:lower()] then
		return module_12[arg2:lower()]
	end
	return nil
end
function module_10_upvr.FilterGangName(arg1, arg2) -- Line 2713
	--[[ Upvalues[1]:
		[1]: module_10_upvr (readonly)
	]]
	local tbl_34 = {
		rozenstruik = 64217106;
		passione = 427348404;
	}
	local var1048_upvw = true
	if arg2 ~= "" then
		if string.len(arg2) <= 15 then
			local any_FilterStringForBroadcast_result1 = game:GetService("Chat"):FilterStringForBroadcast(arg2, arg1)
			local var1050
			if var1050 ~= '#' then
				var1050 = true
				for i_33 = 1, #any_FilterStringForBroadcast_result1 do
					local any_sub_result1_2 = any_FilterStringForBroadcast_result1:sub(i_33, i_33)
					if not string.match(any_sub_result1_2, "%u") then
						if string.match(any_sub_result1_2, "%l") then
						else
							var1050 = false
						end
					end
				end
				if var1050 then
					var1048_upvw = false
				end
			end
			module_10_upvr.pcall(function() -- Line 2744
				--[[ Upvalues[3]:
					[1]: arg2 (readonly)
					[2]: arg1 (readonly)
					[3]: var1048_upvw (read and write)
				]]
				local any_GetChatForUserAsync_result1 = game:GetService("TextService"):FilterStringAsync(arg2, arg1.UserId):GetChatForUserAsync(arg1.UserId)
				for i_34 = 1, #any_GetChatForUserAsync_result1 do
					if string.sub(any_GetChatForUserAsync_result1, i_34, i_34) == '#' then
						var1048_upvw = true
						return
					end
				end
			end)
			module_10_upvr.pcall(function() -- Line 2758
				--[[ Upvalues[2]:
					[1]: arg2 (readonly)
					[2]: var1048_upvw (read and write)
				]]
				if _G.GangsBLDataStore:GetAsync(string.lower(arg2)) then
					var1048_upvw = true
				end
			end)
		end
	end
	if tbl_34[string.lower(arg2)] then
		if tbl_34[string.lower(arg2)] == arg1.UserId then
			print(arg2.." was whitelisted to "..arg1.Name..'!')
			var1048_upvw = false
		else
			print(arg2.." is reserved!")
			var1048_upvw = true
		end
	end
	local any_GetAsync_result1 = _G.GangsDataStore:GetAsync(arg2)
	if any_GetAsync_result1 and any_GetAsync_result1.Owner ~= 0 and any_GetAsync_result1.Owner ~= arg1.UserId then
		var1048_upvw = true
	end
	return var1048_upvw
end
function module_10_upvr.DiscordWebhook(arg1, arg2, arg3, arg4, arg5, arg6) -- Line 2787
	--[[ Upvalues[2]:
		[1]: pcall_2_upvr (readonly)
		[2]: ServerStorage_upvr (readonly)
	]]
	local var1058_upvw = arg3 or ""
	local var1059_upvw = arg4 or ""
	pcall_2_upvr(function() -- Line 2791
		--[[ Upvalues[6]:
			[1]: arg5 (readonly)
			[2]: var1058_upvw (read and write)
			[3]: var1059_upvw (read and write)
			[4]: arg2 (readonly)
			[5]: ServerStorage_upvr (copied, readonly)
			[6]: arg6 (readonly)
		]]
		if not arg5 then
		end
		local tbl_31 = {
			Embed = {
				title = var1058_upvw;
				description = var1059_upvw;
				timestamp = os.time;
				color = 2951298;
				footer = {
					text = arg2 or "";
				};
				thumbnail = {
					url = "http://www.robertspestcontrol.com/wp-content/uploads/2015/06/roaches-austin-tx-4.jpg";
					height = 200;
					width = 200;
				};
			};
		}
		tbl_31.ChannelId = arg6
		require(ServerStorage_upvr.Modules.YBABot):PostMessage(tbl_31)
	end)
end
function module_10_upvr.RemoveGravity(arg1) -- Line 2819
	for _, v_27 in pairs(arg1:GetChildren()) do
		if v_27.Name == "Gravity_Tag" then
			v_27:Destroy()
		end
	end
end
function module_10_upvr.AddGravity(arg1, ...) -- Line 2827
	--[[ Upvalues[2]:
		[1]: module_10_upvr (readonly)
		[2]: module_11_upvr (readonly)
	]]
	local var1069 = ...
	module_10_upvr.RemoveGravity(arg1)
	local NumberValue = Instance.new("NumberValue", arg1)
	NumberValue.Value = var1069.Gravity
	NumberValue.Name = "Gravity_Tag"
	if var1069.Duration then
		module_11_upvr:AddItem(NumberValue, var1069.Duration)
	end
	return NumberValue
end
function module_10_upvr.ReturnStandArms(...) -- Line 2841
	--[[ Upvalues[4]:
		[1]: module_11_upvr (readonly)
		[2]: ReplicatedStorage_upvr (readonly)
		[3]: ServerStorage_upvr (readonly)
		[4]: module_10_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var1085 = ...
	local UseChar_upvr = var1085.UseChar
	local var1088 = var1085.Despawn or 60
	local Model_upvr_4 = Instance.new("Model")
	module_11_upvr:AddItem(Model_upvr_4, var1088)
	Model_upvr_4.Parent = ReplicatedStorage_upvr
	local Model_upvr_3 = Instance.new("Model")
	module_11_upvr:AddItem(Model_upvr_3, var1088)
	Model_upvr_3.Parent = ReplicatedStorage_upvr
	local tbl_upvr = {
		HumanoidRootPart = true;
		Torso = true;
		UpperTorso = true;
		LowerTorso = true;
	}
	local var1092_upvr = var1085.LimbType or "Arm"
	local var1093
	if not var1093 then
		var1093 = game.Players:GetPlayerFromCharacter(var1085.Char.Parent)
	end
	if UseChar_upvr then
	elseif var1093 then
		local any_ReturnStandsData_result1_2 = _G.Playerlist[var1093.Name].ReturnStandsData()
		if any_ReturnStandsData_result1_2.Main and any_ReturnStandsData_result1_2.Main.Skin and any_ReturnStandsData_result1_2.Main.Skin ~= "None" then
		end
	end
	local var1096_upvw = "Lower"..var1092_upvr
	local StandMorph_upvw_2 = ServerStorage_upvr.Skins[any_ReturnStandsData_result1_2.Main.Skin].StandMorph
	module_10_upvr.pcall(function() -- Line 2878
		--[[ Upvalues[7]:
			[1]: Model_upvr_4 (readonly)
			[2]: Model_upvr_3 (readonly)
			[3]: var1096_upvw (read and write)
			[4]: var1092_upvr (readonly)
			[5]: StandMorph_upvw_2 (read and write)
			[6]: UseChar_upvr (readonly)
			[7]: tbl_upvr (readonly)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [400] 294. Error Block 103 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [400] 294. Error Block 103 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [4] 5. Error Block 111 start (CF ANALYSIS FAILED)
		if 1 == 2 then
		end
		-- KONSTANTERROR: [4] 5. Error Block 111 end (CF ANALYSIS FAILED)
	end)
	return Model_upvr_4, Model_upvr_3
end
function module_10_upvr.Random_SFX(arg1, arg2, arg3) -- Line 2997
	--[[ Upvalues[1]:
		[1]: module_10_upvr (readonly)
	]]
	local children_2 = arg1:GetChildren()
	local var1100 = children_2[math.random(1, #children_2)]
	if arg3 then
		local module_14 = {
			Sound = var1100;
		}
		module_14.Origin = arg2
		module_14.Return = true
		return module_10_upvr.PlaySound(module_14)
	end
	local tbl_14 = {
		Sound = var1100;
	}
	tbl_14.Origin = arg2
	module_10_upvr.PlaySound(tbl_14)
end
function module_10_upvr.PlaySound(...) -- Line 3017
	--[[ Upvalues[4]:
		[1]: module_10_upvr (readonly)
		[2]: ReplicatedStorage_upvr (readonly)
		[3]: var16_upvr (readonly)
		[4]: TweenService_upvr (readonly)
	]]
	local module_16_upvr = {}
	local var1104_upvr = ...
	if not var1104_upvr then
		var1104_upvr = {}
	end
	local LocalPlayer = game.Players.LocalPlayer
	if not var1104_upvr.ClientOnly then
		if game.Lighting:FindFirstChild("InAcidicSpew") or LocalPlayer and (LocalPlayer:FindFirstChild("LoadingScreen1") or LocalPlayer:FindFirstChild("LoadingScreen")) then return end
	end
	module_10_upvr.pcall(function() -- Line 3024
		--[[ Upvalues[6]:
			[1]: var1104_upvr (readonly)
			[2]: ReplicatedStorage_upvr (copied, readonly)
			[3]: var16_upvr (copied, readonly)
			[4]: module_10_upvr (copied, readonly)
			[5]: TweenService_upvr (copied, readonly)
			[6]: module_16_upvr (readonly)
		]]
		-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
		local tbl_42 = {}
		local tbl_43 = {}
		local Sound = var1104_upvr.Sound
		if typeof(Sound) ~= "table" then
			table.insert(tbl_42, Sound)
		else
			tbl_42 = Sound
		end
		for i_36, v_28 in pairs(tbl_42) do
			local var1129
			local function INLINED_19() -- Internal function, doesn't exist in bytecode
				var1129 = ReplicatedStorage_upvr.Sounds:findFirstChild(v_28)
				return var1129
			end
			if typeof(v_28) ~= "string" or not INLINED_19() then
				var1129 = v_28
			end
			if not v_28 or typeof(var1129) == "string" then
				print("Error while trying to play sound: "..tostring(var1129))
				return
			end
			local clone_7 = var1129:Clone()
			if var16_upvr and not var1104_upvr.Lifetime and not var1104_upvr.Return then
				clone_7.Name = "Sound"
			end
			tbl_43[clone_7] = {
				Original = var1129;
				Replica = clone_7;
			}
		end
		local function var1132_upvr(arg1) -- Line 3055
			--[[ Upvalues[3]:
				[1]: var1104_upvr (copied, readonly)
				[2]: module_10_upvr (copied, readonly)
				[3]: TweenService_upvr (copied, readonly)
			]]
			local Replica_2_upvr = arg1.Replica
			Replica_2_upvr:Play()
			local var1134
			if not var1134 then
				var1134 = arg1.Original.TimeLength / arg1.Pitch + 0.05
			end
			local FadeOut_upvr = var1104_upvr.FadeOut
			if FadeOut_upvr then
				module_10_upvr.Delay(var1134 - FadeOut_upvr, function() -- Line 3065
					--[[ Upvalues[3]:
						[1]: TweenService_upvr (copied, readonly)
						[2]: Replica_2_upvr (readonly)
						[3]: FadeOut_upvr (readonly)
					]]
					TweenService_upvr:Create(Replica_2_upvr, TweenInfo.new(FadeOut_upvr, Enum.EasingStyle.Linear), {
						Volume = 0;
					}):Play()
				end)
			end
			module_10_upvr.Delay(var1134, function() -- Line 3071
				--[[ Upvalues[1]:
					[1]: Replica_2_upvr (readonly)
				]]
				Replica_2_upvr:Destroy()
			end)
			if var1104_upvr.Position then
				module_10_upvr.Delay(var1134, function() -- Line 3076
					--[[ Upvalues[1]:
						[1]: Replica_2_upvr (readonly)
					]]
					Replica_2_upvr:Destroy()
				end)
			end
		end
		if var1104_upvr.ClientOnly == true then
			var1104_upvr.Origin = workspace
		elseif var1104_upvr.Position then
			i_36 = "Part"
			var1104_upvr.Origin = Instance.new(i_36)
			var1104_upvr.Origin.Anchored = true
			var1104_upvr.Origin.CanCollide = false
			i_36 = var1104_upvr
			var1104_upvr.Origin.Position = i_36.Position
			var1104_upvr.Origin.Transparency = 1
			v_28 = "IgnoreInstances"
			var1104_upvr.Origin.Parent = workspace:FindFirstChild(v_28)
		end
		for _, v_29_upvr in pairs(tbl_43) do
			module_10_upvr.Spawn(function() -- Line 3094
				--[[ Upvalues[4]:
					[1]: v_29_upvr (readonly)
					[2]: var1104_upvr (copied, readonly)
					[3]: module_16_upvr (copied, readonly)
					[4]: var1132_upvr (readonly)
				]]
				local Replica = v_29_upvr.Replica
				if var1104_upvr.TimePosition then
					Replica.TimePosition = var1104_upvr.TimePosition
				end
				local Pitch = var1104_upvr.Pitch
				v_29_upvr.Pitch = Replica.Pitch
				if Pitch then
					Replica.Pitch = Pitch
					v_29_upvr.Pitch = Pitch
				end
				if var1104_upvr.Volume then
					Replica.Volume = var1104_upvr.Volume
				end
				Replica.Parent = var1104_upvr.Origin
				if var1104_upvr.Return then
					table.insert(module_16_upvr, Replica)
				else
					var1132_upvr(v_29_upvr)
				end
			end)
			local _
		end
	end)
	return module_16_upvr
end
local IgnoreInstances_2_upvr = workspace:WaitForChild("IgnoreInstances")
local Anims_upvr = ReplicatedStorage_upvr:WaitForChild("Anims")
function module_10_upvr.StandFade(arg1, arg2, arg3) -- Line 3129
	--[[ Upvalues[4]:
		[1]: module_10_upvr (readonly)
		[2]: IgnoreInstances_2_upvr (readonly)
		[3]: wait_upvr (readonly)
		[4]: Anims_upvr (readonly)
	]]
	module_10_upvr.pcall(function() -- Line 3130
		--[[ Upvalues[7]:
			[1]: arg3 (readonly)
			[2]: arg2 (readonly)
			[3]: IgnoreInstances_2_upvr (copied, readonly)
			[4]: module_10_upvr (copied, readonly)
			[5]: arg1 (readonly)
			[6]: wait_upvr (copied, readonly)
			[7]: Anims_upvr (copied, readonly)
		]]
		-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
		local var1174 = arg3
		if not var1174 then
			var1174 = {}
		end
		if not var1174.TweenInfo then
			local EasingStyle = var1174.EasingStyle
			if not EasingStyle then
				EasingStyle = Enum.EasingStyle.Quint
			end
			local EasingDirection = var1174.EasingDirection
			if not EasingDirection then
				EasingDirection = Enum.EasingDirection.Out
			end
		end
		local Value_upvr = arg2.StandSkin.Value
		local Parent_upvr = arg2.Parent
		local CustomEquip = arg2:FindFirstChild("CustomEquip")
		local var1180 = Parent_upvr
		if var1180 then
			var1180 = IgnoreInstances_2_upvr.StandMorphs:FindFirstChild(Parent_upvr.Name)
		end
		if var1180 then
			for i_38, v_30 in pairs(var1180:GetDescendants()) do
				table.insert(arg2:GetDescendants(), v_30)
				local var1184
				local var1185_upvw
			end
		end
		if CustomEquip and CustomEquip.Value == "Anubis" then
			local var1186 = true
			i_38 = "SwordSheath"
			local SOME_3_upvr = Parent_upvr:FindFirstChild(i_38)
			local tbl_30_upvr = {}
			i_38 = true
			tbl_30_upvr["Kanshou & Bakuya"] = i_38
			i_38 = true
			tbl_30_upvr["Elucidator & Dark Repulser"] = i_38
			i_38 = true
			tbl_30_upvr.Sasageyo = i_38
			i_38 = true
			tbl_30_upvr["Linked Sword"] = i_38
			i_38 = true
			tbl_30_upvr.Bloodthirster = i_38
			i_38 = true
			tbl_30_upvr["Spirit Bomb Sword"] = i_38
			i_38 = true
			tbl_30_upvr["Blade of The Exile"] = i_38
			i_38 = tbl_30_upvr[Value_upvr]
			if i_38 then
				var1186 = nil
				i_38 = pairs
				v_30 = SOME_3_upvr:GetDescendants()
				i_38 = i_38(v_30)
				local i_38_result1, i_38_result2, i_38_result3 = i_38(v_30)
				for _, v_31 in i_38_result1, i_38_result2, i_38_result3 do
					if v_31:IsA("BasePart") then
						table.insert(var1184, v_31)
					end
				end
			end
			i_38_result2 = module_10_upvr
			i_38_result1 = i_38_result2.pcall
			function i_38_result2() -- Line 3176
				--[[ Upvalues[8]:
					[1]: arg1 (copied, readonly)
					[2]: tbl_30_upvr (readonly)
					[3]: Value_upvr (readonly)
					[4]: module_10_upvr (copied, readonly)
					[5]: SOME_3_upvr (readonly)
					[6]: Parent_upvr (readonly)
					[7]: wait_upvr (copied, readonly)
					[8]: Anims_upvr (copied, readonly)
				]]
				if arg1 then
					if tbl_30_upvr[Value_upvr] then
						module_10_upvr.PlaySound({
							Sound = SOME_3_upvr.Handle.UnsheatheSound;
							Origin = Parent_upvr.HumanoidRootPart;
						})
						wait_upvr(0.2)
					else
						Parent_upvr.Humanoid:LoadAnimation(Anims_upvr["Anubis Unsheathe"]):Play()
						wait_upvr(0.2)
						module_10_upvr.PlaySound({
							Sound = SOME_3_upvr.Handle.UnsheatheSound;
							Origin = Parent_upvr.HumanoidRootPart;
						})
					end
				end
				for _, v_32 in pairs(SOME_3_upvr.Sword:GetChildren()) do
					local var1202
					if arg1 then
						var1202 = 1
					else
						var1202 = 0
					end
					v_32.Transparency = var1202
				end
			end
			i_38_result1(i_38_result2)
			var1185_upvw = var1186
		end
		tbl_30_upvr = "TweenService"
		SOME_3_upvr = 0
		local var1203_upvw = SOME_3_upvr
		tbl_30_upvr = arg1
		if not tbl_30_upvr then
			var1203_upvw = 1
		end
		local service_upvr = game:GetService(tbl_30_upvr)
		local TweenInfo_new_result1_upvr = TweenInfo.new(var1174.FadeTime or 0.7, EasingStyle, EasingDirection)
		function tbl_30_upvr(arg1_3) -- Line 3215
			--[[ Upvalues[6]:
				[1]: var1203_upvw (read and write)
				[2]: arg1 (copied, readonly)
				[3]: var1185_upvw (read and write)
				[4]: service_upvr (readonly)
				[5]: TweenInfo_new_result1_upvr (readonly)
				[6]: module_10_upvr (copied, readonly)
			]]
			-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [5] 5. Error Block 2 start (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [5] 5. Error Block 2 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [10] 9. Error Block 3 start (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [10] 9. Error Block 3 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [15] 13. Error Block 4 start (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [15] 13. Error Block 4 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [20] 17. Error Block 5 start (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [20] 17. Error Block 5 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [25] 21. Error Block 6 start (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [25] 21. Error Block 6 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [30] 25. Error Block 7 start (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [30] 25. Error Block 7 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [35] 29. Error Block 70 start (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [35] 29. Error Block 70 end (CF ANALYSIS FAILED)
		end
		for _, v_33 in pairs(var1184) do
			if v_33:IsA("ObjectValue") and v_33:GetAttribute("StandObject") and v_33.Value then
				tbl_30_upvr(v_33.Value)
			else
				tbl_30_upvr(v_33)
			end
		end
	end)
end
function module_10_upvr.SummonSixPistolsBullet(arg1, ...) -- Line 3312
	--[[ Upvalues[6]:
		[1]: ReplicatedStorage_upvr (readonly)
		[2]: ClientFX_upvr (readonly)
		[3]: ServerStorage_upvr (readonly)
		[4]: module_11_upvr (readonly)
		[5]: module_10_upvr (readonly)
		[6]: wait_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var1226
	if not ... then
	end
	local Char_3_upvr = arg1.Char
	for _, v_34 in pairs(workspace.Living:GetChildren()) do
		local any_GetPlayerFromCharacter_result1 = game.Players:GetPlayerFromCharacter(v_34)
		local HumanoidRootPart = v_34:findFirstChild("HumanoidRootPart")
		if any_GetPlayerFromCharacter_result1 and HumanoidRootPart and (HumanoidRootPart.Position - arg1.Root.Position).magnitude <= 10 then
			v_34.RemoteEvent:FireClient(any_GetPlayerFromCharacter_result1, "CameraShake", {
				Origin = arg1.LowerTorso;
			})
		end
	end
	ClientFX_upvr:FireAllClients("PlaySound", {
		Sound = "Gun_Shot1";
		Origin = Char_3_upvr.HumanoidRootPart;
	})
	ClientFX_upvr:FireAllClients("Shoot Six Pistols", {
		Origin = arg1.Stand.FirePart;
	})
	if arg1.Player then
		for _, v_35 in pairs(arg1.StandSkillTree:GetChildren()) do
			if v_35.Name:match("Marksman ") and v_35.Value then
			end
		end
	end
	local clone_4_upvr = ServerStorage_upvr.Objects["Six Pistols Bullet"]:Clone()
	module_11_upvr:AddItem(clone_4_upvr, 20)
	clone_4_upvr.CFrame = arg1.Root.CFrame
	clone_4_upvr.Parent = workspace.IgnoreInstances
	clone_4_upvr.Name = arg1.Char.Name.." SP Bullet"
	arg1.LastSPBullet = clone_4_upvr
	local var1241_upvw
	local var1243_upvw = false
	local module_3_upvr = require(ReplicatedStorage_upvr:WaitForChild("Modules"):WaitForChild("CombatStyleLibrary"))
	local tbl_3_upvr = {}
	local any_new_result1_2_upvr = require(ReplicatedStorage_upvr:WaitForChild("Modules"):WaitForChild("ChannelMod2")).new(8, function() -- Line 3361
		--[[ Upvalues[11]:
			[1]: var1243_upvw (read and write)
			[2]: arg1 (readonly)
			[3]: clone_4_upvr (readonly)
			[4]: var1241_upvw (read and write)
			[5]: module_10_upvr (copied, readonly)
			[6]: Char_3_upvr (readonly)
			[7]: module_3_upvr (readonly)
			[8]: tbl_3_upvr (readonly)
			[9]: ReplicatedStorage_upvr (copied, readonly)
			[10]: ClientFX_upvr (copied, readonly)
			[11]: wait_upvr (copied, readonly)
		]]
		if var1243_upvw then
		else
			var1243_upvw = true
			if arg1.LastSPBullet == clone_4_upvr then
				arg1.LastSPBullet = false
			end
			clone_4_upvr.Anchored = true
			clone_4_upvr.Trail.Enabled = false
			if var1241_upvw then
				module_10_upvr.Spawn(function() -- Line 3373
					--[[ Upvalues[8]:
						[1]: Char_3_upvr (copied, readonly)
						[2]: var1241_upvw (copied, read and write)
						[3]: module_3_upvr (copied, readonly)
						[4]: tbl_3_upvr (copied, readonly)
						[5]: module_10_upvr (copied, readonly)
						[6]: ReplicatedStorage_upvr (copied, readonly)
						[7]: arg1 (copied, readonly)
						[8]: ClientFX_upvr (copied, readonly)
					]]
					local any_Six_Pistols_result1 = module_3_upvr["Six Pistols"]("ReturnDamage_Info", {
						Tag = Char_3_upvr.Name.."Shoot Six Pistols";
						Timer = 0.2;
						Hit = var1241_upvw.Hit;
						Origin = Char_3_upvr.HumanoidRootPart;
						Combo = "Shoot";
						Stand = "Six Pistols";
					})
					if tbl_3_upvr.MultiShot then
						any_Six_Pistols_result1.IgnoreBlock = false
					end
					if module_10_upvr.Damage(Char_3_upvr, var1241_upvw.Victim, any_Six_Pistols_result1) and tbl_3_upvr.MultiShot then
						local var1253_upvw = 1.25
						local var1254
						if var1254 then
							var1254 = 1
							for _, v_57 in pairs(arg1.StandSkillTree:GetChildren()) do
								if v_57.Name:match("Multi Shot Upgrade ") and v_57.Value then
									var1254 += 0.33
								end
							end
							var1253_upvw *= var1254
						end
						ClientFX_upvr:FireAllClients("Multi Shot", {
							Origin = var1241_upvw.Victim.HumanoidRootPart;
							Duration = var1253_upvw;
						})
						local any_new_result1 = require(ReplicatedStorage_upvr.Modules.ChannelMod2).new(var1253_upvw, function() -- Line 3414
						end)
						local var1262_upvw
						local var1263_upvr = arg1.Player.Name.."Multi Shot"
						function any_new_result1.Duration() -- Line 3421
							--[[ Upvalues[8]:
								[1]: var1262_upvw (read and write)
								[2]: var1263_upvr (readonly)
								[3]: var1241_upvw (copied, read and write)
								[4]: arg1 (copied, readonly)
								[5]: module_3_upvr (copied, readonly)
								[6]: var1253_upvw (read and write)
								[7]: module_10_upvr (copied, readonly)
								[8]: Char_3_upvr (copied, readonly)
							]]
							if not var1262_upvw or 0.1 <= tick() - var1262_upvw then
								local tick_result1 = tick()
								var1262_upvw = tick_result1
								local any_Humanoid_Stand_result1 = module_3_upvr["Humanoid Stand"]("ReturnDamage_Info", {
									Tag = var1263_upvr..tick_result1;
									Timer = 2;
									Hit = var1241_upvw.Victim.HumanoidRootPart;
									Origin = arg1.Root;
									Combo = "Multi Shot";
									Stand = "Six Pistols";
								})
								any_Humanoid_Stand_result1.Damage /= var1253_upvw / 0.1
								module_10_upvr.Damage(Char_3_upvr, var1241_upvw.Victim, any_Humanoid_Stand_result1)
							end
						end
						any_new_result1:Start()
					end
				end)
			end
			wait_upvr(clone_4_upvr.Trail.Lifetime)
			clone_4_upvr:Destroy()
		end
	end)
	local RaycastParams_new_result1_upvr = RaycastParams.new()
	RaycastParams_new_result1_upvr.FilterType = Enum.RaycastFilterType.Blacklist
	RaycastParams_new_result1_upvr.FilterDescendantsInstances = {Char_3_upvr, workspace.IgnoreInstances}
	local Position_upvw = arg1.Root.Position
	local var1272_upvw = -(arg1.Root.Position - arg1.RemoteFunction:InvokeClient(arg1.Player, "ReturnMouseHit", {
		RayCast = true;
	}).p).unit
	local var1273_upvw
	local var1274_upvw = 4 * (1 + 0.25)
	function any_new_result1_2_upvr.Duration() -- Line 3459
		--[[ Upvalues[9]:
			[1]: Position_upvw (read and write)
			[2]: var1272_upvw (read and write)
			[3]: var1273_upvw (read and write)
			[4]: var1274_upvw (read and write)
			[5]: RaycastParams_new_result1_upvr (readonly)
			[6]: clone_4_upvr (readonly)
			[7]: var1241_upvw (read and write)
			[8]: any_new_result1_2_upvr (readonly)
			[9]: ClientFX_upvr (copied, readonly)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [6] 6. Error Block 2 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [6] 6. Error Block 2 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [7] 7. Error Block 3 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [7] 7. Error Block 3 end (CF ANALYSIS FAILED)
	end
	any_new_result1_2_upvr:Start()
end
function module_10_upvr.FocusCamera(...) -- Line 3505
	local var1281 = ...
	local Object = var1281.Object
	local Tween = var1281.Tween
	local var1284
	if typeof(Object) == "Instance" then
		var1284 = Instance.new("ObjectValue")
	elseif typeof(Object) == "CFrame" then
		var1284 = Instance.new("CFrameValue")
	end
	var1284.Name = "FocusCam"
	var1284.Value = Object
	if Tween then
		local NumberValue_4 = Instance.new("NumberValue")
		NumberValue_4.Name = "Tween"
		NumberValue_4.Value = Tween
		NumberValue_4.Parent = var1284
		if var1281.Destroy then
			local NumberValue_3 = Instance.new("NumberValue")
			NumberValue_3.Name = "Destroy"
			NumberValue_3.Value = var1281.Destroy
			NumberValue_3.Parent = var1284
		end
	end
	return var1284
end
function module_10_upvr.ReturnIsAdmin(arg1) -- Line 3538
	--[[ Upvalues[2]:
		[1]: module_10_upvr (readonly)
		[2]: ServerStorage_upvr (readonly)
	]]
	local var1287_upvw
	module_10_upvr.pcall(function() -- Line 3541
		--[[ Upvalues[3]:
			[1]: ServerStorage_upvr (copied, readonly)
			[2]: arg1 (readonly)
			[3]: var1287_upvw (read and write)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [17] 13. Error Block 2 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [17] 13. Error Block 2 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [18] 14. Error Block 3 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [18] 14. Error Block 3 end (CF ANALYSIS FAILED)
	end)
	return var1287_upvw
end
function module_10_upvr.LevelUp(arg1) -- Line 3564
	--[[ Upvalues[1]:
		[1]: ClientFX_upvr (readonly)
	]]
	ClientFX_upvr:FireAllClients("LevelUp", {
		Origin = arg1.UpperTorso;
		NoDist = true;
	})
end
function module_10_upvr.Return_Part_Material(...) -- Line 3568
	--[[ Upvalues[1]:
		[1]: module_10_upvr (readonly)
	]]
	local module_13_upvw = {
		Name = "Concrete";
	}
	local FloorMaterials_upvr = module_10_upvr.FloorMaterials
	local NameTypes_upvr = module_10_upvr.NameTypes
	for _, v_36 in pairs(....Filters) do
		if (function(arg1) -- Line 3579
			--[[ Upvalues[3]:
				[1]: FloorMaterials_upvr (readonly)
				[2]: NameTypes_upvr (readonly)
				[3]: module_13_upvw (read and write)
			]]
			-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
			local const_number_3 = 1
			local var1298
			-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [48] 41. Error Block 22 start (CF ANALYSIS FAILED)
			if const_number_3 == 2 then
				-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [50.6]
				if nil then
					return module_13_upvw
				end
			end
			-- KONSTANTERROR: [48] 41. Error Block 22 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [12] 11. Error Block 24 start (CF ANALYSIS FAILED)
			if const_number_3 ~= 1 or not var1298 then
			end
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			if module_13_upvw then
				-- KONSTANTWARNING: GOTO [48] #41
			end
			-- KONSTANTERROR: [12] 11. Error Block 24 end (CF ANALYSIS FAILED)
		end)(v_36) == module_13_upvw then
			return module_13_upvw
		end
	end
	return module_13_upvw
end
local RaycastParams_new_result1_2_upvr = RaycastParams.new()
RaycastParams_new_result1_2_upvr.FilterType = Enum.RaycastFilterType.Include
function module_10_upvr.ParticleGroundRaycast(...) -- Line 3620
	--[[ Upvalues[1]:
		[1]: RaycastParams_new_result1_2_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	local var1303 = ...
	local Char_5 = var1303.Char
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [10] 8. Error Block 2 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [10] 8. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [15] 12. Error Block 3 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [15] 12. Error Block 3 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [19] 15. Error Block 4 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [19] 15. Error Block 4 end (CF ANALYSIS FAILED)
end
function module_10_upvr.EnableParticle(arg1, arg2, ...) -- Line 3657
	--[[ Upvalues[1]:
		[1]: module_10_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 30 start (CF ANALYSIS FAILED)
	local tbl_8_upvr = {}
	local function _(arg1_4) -- Line 3662
		--[[ Upvalues[1]:
			[1]: tbl_8_upvr (readonly)
		]]
		if arg1_4:IsA("ParticleEmitter") or arg1_4:IsA("Beam") or arg1_4:IsA("Trail") then
			table.insert(tbl_8_upvr, arg1_4)
		end
	end
	for _, v_37 in pairs(arg1:GetChildren()) do
		if v_37:IsA("ParticleEmitter") or v_37:IsA("Beam") or v_37:IsA("Trail") then
			table.insert(tbl_8_upvr, v_37)
		end
	end
	-- KONSTANTERROR: [0] 1. Error Block 30 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [42] 33. Error Block 27 start (CF ANALYSIS FAILED)
	if arg1:IsA("Beam") or arg1:IsA("Trail") then
		-- KONSTANTERROR: [52] 41. Error Block 20 start (CF ANALYSIS FAILED)
		table.insert(tbl_8_upvr, arg1)
		-- KONSTANTERROR: [52] 41. Error Block 20 end (CF ANALYSIS FAILED)
	end
	for _, v_38 in pairs(tbl_8_upvr) do
		local tbl_45 = {}
		tbl_45.Char = arg2
		tbl_45.Origin = arg1
		tbl_45.Particle = v_38
		tbl_45.Ground_Raycast_Range = 1
		if module_10_upvr.ParticleAttributeChecks(tbl_45) then
			v_38.Enabled = true
		end
	end
	-- KONSTANTERROR: [42] 33. Error Block 27 end (CF ANALYSIS FAILED)
end
function module_10_upvr.ParticleAttributeChecks(...) -- Line 3695
	--[[ Upvalues[1]:
		[1]: module_10_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var1357 = ...
	local Char = var1357.Char
	local var1359 = Char
	if var1359 then
		var1359 = Char:FindFirstChild("Humanoid")
		if not var1359 then
			var1359 = Char:FindFirstChild("AnimationController")
		end
	end
	local Particle = var1357.Particle
	local Ground_Raycast_Range_2 = Particle:GetAttribute("Ground_Raycast_Range")
	if not Ground_Raycast_Range_2 then
		Ground_Raycast_Range_2 = var1357.Ground_Raycast_Range
		if not Ground_Raycast_Range_2 then
			Ground_Raycast_Range_2 = 5
		end
	end
	local any_ParticleGroundRaycast_result1 = module_10_upvr.ParticleGroundRaycast({
		Parent = var1357.Parent;
		Range = Ground_Raycast_Range_2;
		Char = Char;
		Origin = var1357.Origin;
		ParentTo = var1357.ParentTo;
		CFrame = var1357.CFrame;
	})
	local tbl_28 = {}
	if not var1359 or var1359.FloorMaterial == Enum.Material.Air then
	end
	if Particle:GetAttribute("FloorMaterial") then
		table.insert(tbl_28, Particle:GetAttribute("FloorMaterial"))
		local var1365
	end
	if any_ParticleGroundRaycast_result1 and any_ParticleGroundRaycast_result1.Part then
		var1365 = any_ParticleGroundRaycast_result1.Part
		table.insert(tbl_28, var1365.Material)
		var1365 = any_ParticleGroundRaycast_result1.Part
		table.insert(tbl_28, var1365.Name)
	end
	local tbl_2 = {
		Filters = tbl_28;
	}
	local any_Return_Part_Material_result1_2 = module_10_upvr.Return_Part_Material(tbl_2)
	tbl_2 = any_Return_Part_Material_result1_2
	local var1368 = tbl_2
	if var1368 then
		var1368 = any_Return_Part_Material_result1_2.Name
	end
	local var1369 = var1368
	var1365 = Particle:GetAttribute("Color")
	if not var1365 then
		var1365 = var1357.Color
		local var1371
	end
	if var1365 then
		local function INLINED_37() -- Internal function, doesn't exist in bytecode
			var1371 = ColorSequence.new(var1365)
			return var1371
		end
		if typeof(var1365) ~= "Color3" or not INLINED_37() then
			var1371 = var1365
		end
	end
	for i_47, v_39 in pairs(Particle:GetAttributes()) do
		if string.gmatch(string.lower(i_47), "color")() then
			if i_47 == "Use_Ground_Color" and any_ParticleGroundRaycast_result1 and any_ParticleGroundRaycast_result1.Part and 1 <= 2 then
			end
			local string_sub_result1 = string.sub(i_47, 0, #i_47 - 6)
			local var1376
			local function INLINED_38() -- Internal function, doesn't exist in bytecode
				var1376 = module_10_upvr.FloorMaterials[var1369].Name
				return var1376 ~= string_sub_result1
			end
			local function INLINED_39() -- Internal function, doesn't exist in bytecode
				var1376 = module_10_upvr.NameTypes[var1369]
				return var1376
			end
			local function INLINED_40() -- Internal function, doesn't exist in bytecode
				var1376 = module_10_upvr.NameTypes[var1369].Name
				return var1376 == string_sub_result1
			end
			local function INLINED_41() -- Internal function, doesn't exist in bytecode
				var1376 = Particle:GetAttribute("FloorMaterial")
				return var1376 == string_sub_result1
			end
			if not var1376 or INLINED_38() or INLINED_39() and INLINED_40() or INLINED_41() then
				local function INLINED_42() -- Internal function, doesn't exist in bytecode
					var1376 = ColorSequence.new(v_39)
					return var1376
				end
				if typeof(v_39) ~= "Color3" or not INLINED_42() then
					var1376 = v_39
				end
			end
		end
		var1376 = string.lower(i_47)
		local var1377 = string.gmatch(var1376, "only")()
		local function INLINED_43() -- Internal function, doesn't exist in bytecode
			var1377 = string.sub(var1376, 0, #i_47 - 5)
			var1376 = i_47
			return var1377 ~= "Ground"
		end
		local function INLINED_44() -- Internal function, doesn't exist in bytecode
			var1376 = module_10_upvr.FloorMaterials[var1369]
			return var1376
		end
		local function INLINED_45() -- Internal function, doesn't exist in bytecode
			var1376 = module_10_upvr.FloorMaterials[var1369].Name
			return var1376 ~= var1377
		end
		local function INLINED_46() -- Internal function, doesn't exist in bytecode
			var1376 = module_10_upvr.NameTypes[var1369]
			return var1376
		end
		local function INLINED_47() -- Internal function, doesn't exist in bytecode
			var1376 = module_10_upvr.NameTypes[var1369].Name
			return var1376 ~= var1377
		end
		local function INLINED_48() -- Internal function, doesn't exist in bytecode
			var1376 = Particle:GetAttribute("FloorMaterial")
			return var1376 ~= var1377
		end
		if var1377 and INLINED_43() and (not INLINED_44() or INLINED_45()) or not INLINED_46() or INLINED_47() or INLINED_48() then
			var1376 = false
			return var1376
		end
		var1376 = string.lower(i_47)
		if string.gmatch(var1376, "ignore")() then
			var1376 = i_47
			local string_sub_result1_3 = string.sub(var1376, 0, #i_47 - 7)
			var1376 = module_10_upvr.FloorMaterials[var1369]
			local function INLINED_49() -- Internal function, doesn't exist in bytecode
				var1376 = module_10_upvr.FloorMaterials[var1369].Name
				return var1376 ~= string_sub_result1_3
			end
			local function INLINED_50() -- Internal function, doesn't exist in bytecode
				var1376 = module_10_upvr.NameTypes[var1369]
				return var1376
			end
			local function INLINED_51() -- Internal function, doesn't exist in bytecode
				var1376 = module_10_upvr.NameTypes[var1369].Name
				return var1376 == string_sub_result1_3
			end
			local function INLINED_52() -- Internal function, doesn't exist in bytecode
				var1376 = Particle:GetAttribute("FloorMaterial")
				return var1376 == string_sub_result1_3
			end
			if not var1376 or INLINED_49() or INLINED_50() and INLINED_51() or INLINED_52() then
				var1376 = false
				return var1376
			end
		end
	end
	if Particle:GetAttribute("Ground_Only") and (not var1369 or not any_ParticleGroundRaycast_result1.Part) then
		return false
	end
	return {
		Ground_Raycast = any_ParticleGroundRaycast_result1;
		Color = var1376;
		Original_Color = Particle.Color;
		FloorMaterial = var1369;
	}
end
function module_10_upvr.EmitParticle(arg1, arg2, arg3, arg4, arg5, arg6, arg7) -- Line 3798
	--[[ Upvalues[2]:
		[1]: module_10_upvr (readonly)
		[2]: wait_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var1487 = arg7
	if not var1487 then
		var1487 = {}
	end
	local Char_2_upvr = var1487.Char
	if Char_2_upvr then
		if not Char_2_upvr:FindFirstChild("Humanoid") then
		end
	end
	local var1489
	if typeof(arg1) == "Instance" then
		if arg1:IsDescendantOf(workspace) then
			var1489 = arg1
		else
		end
	else
		local _
		if typeof(arg1) == "table" then
			if not arg2 or not arg2:IsA("Attachment") or not arg2 then
			end
			for _, v_40 in pairs(arg1) do
				v_40.Parent = Instance.new("Attachment")
			end
		end
	end
	local tbl_25_upvr = {}
	local var1495
	if Instance.new("Attachment"):IsA("ParticleEmitter") then
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		table.insert(tbl_25_upvr, Instance.new("Attachment"))
	end
	for _, v_41 in pairs(Instance.new("Attachment"):GetDescendants()) do
		if v_41:IsA("ParticleEmitter") then
			table.insert(tbl_25_upvr, v_41)
		end
	end
	for _, v_42 in pairs(tbl_25_upvr) do
		v_42.Enabled = false
	end
	if Instance.new("Attachment"):IsA("Attachment") then
		if arg2 then
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			Instance.new("Attachment").Parent = arg2
		else
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			if not Instance.new("Attachment").Parent and not arg2 then
				warn("No existing Parent for the Particles!", "Set the Origin argument to an existing Parent.")
				-- KONSTANTWARNING: GOTO [146] #109
			end
		end
	else
		if not arg2 then
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			if not arg2 then
			end
		end
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		Instance.new("Attachment").Parent = workspace.IgnoreInstances
	end
	local var1502 = arg4 or 0
	for _, v_43 in pairs(tbl_25_upvr) do
		local var1506 = v_43:GetAttribute("Repeat_Rate") or 0
		local var1507
		local function INLINED_54() -- Internal function, doesn't exist in bytecode
			var1507 = v_43:GetAttribute("Repeat_Count")
			return var1507
		end
		if 0 >= var1506 or not INLINED_54() then
			var1507 = 0
		end
		local var1508 = v_43.Lifetime.Max / v_43.TimeScale + 1 + (v_43:GetAttribute("EmitDelay") or 0)
		local var1509 = var1508 + (var1508) * (var1507 * var1506)
		if var1502 < var1509 then
			var1502 = var1509
		end
	end
	if arg6 then
		var1502 += arg6
	end
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	game.Debris:AddItem(Instance.new("Attachment"), var1502)
	if arg5 then
		if Instance.new("Attachment"):IsA("BasePart") then
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			Instance.new("Attachment").CFrame = arg5
		else
			local Part_upvw = Instance.new("Part")
			game.Debris:AddItem(Part_upvw, var1502)
			Part_upvw.Transparency = 1
			Part_upvw.CanCollide = false
			Part_upvw.CanTouch = false
			Part_upvw.CanQuery = false
			Part_upvw.Anchored = true
			Part_upvw.Size = Vector3.new(0, 0, 0)
			Part_upvw.CFrame = arg5
			Part_upvw.Parent = workspace.IgnoreInstances
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			Instance.new("Attachment").Parent = Part_upvw
		end
	end
	local Color_upvr = var1487.Color
	local function var1511_upvr(arg1_6) -- Line 3909
		--[[ Upvalues[8]:
			[1]: module_10_upvr (copied, readonly)
			[2]: Char_2_upvr (readonly)
			[3]: arg2 (readonly)
			[4]: Part_upvw (read and write)
			[5]: arg5 (readonly)
			[6]: Color_upvr (readonly)
			[7]: arg3 (readonly)
			[8]: wait_upvr (copied, readonly)
		]]
		local tbl_33 = {
			Parent = arg1_6.Parent;
			Char = Char_2_upvr;
		}
		tbl_33.Origin = arg2
		tbl_33.ParentTo = Part_upvw
		tbl_33.CFrame = arg5
		tbl_33.Particle = arg1_6
		tbl_33.Color = Color_upvr
		local any_ParticleAttributeChecks_result1 = module_10_upvr.ParticleAttributeChecks(tbl_33)
		if any_ParticleAttributeChecks_result1 then
			arg1_6.Color = any_ParticleAttributeChecks_result1.Color
			local var1516_upvr = arg1_6:GetAttribute("Repeat_Count") or 1
			local Repeat_Rate_upvr = arg1_6:GetAttribute("Repeat_Rate")
			module_10_upvr.Spawn(function() -- Line 3928
				--[[ Upvalues[5]:
					[1]: var1516_upvr (readonly)
					[2]: arg1_6 (readonly)
					[3]: arg3 (copied, readonly)
					[4]: Repeat_Rate_upvr (readonly)
					[5]: wait_upvr (copied, readonly)
				]]
				for _ = 1, var1516_upvr do
					local var1520 = arg3
					if not var1520 then
						var1520 = arg1_6:GetAttribute("EmitCount")
						if not var1520 then
							var1520 = 1
						end
					end
					arg1_6:Emit(var1520)
					if Repeat_Rate_upvr then
						wait_upvr(Repeat_Rate_upvr)
					end
				end
			end)
		end
	end
	local function var1521_upvr() -- Line 3940
		--[[ Upvalues[3]:
			[1]: tbl_25_upvr (readonly)
			[2]: module_10_upvr (copied, readonly)
			[3]: var1511_upvr (readonly)
		]]
		for _, v_44_upvr in pairs(tbl_25_upvr) do
			if v_44_upvr:GetAttribute("EmitDelay") then
				module_10_upvr.Delay(v_44_upvr:GetAttribute("EmitDelay"), function() -- Line 3943
					--[[ Upvalues[2]:
						[1]: var1511_upvr (copied, readonly)
						[2]: v_44_upvr (readonly)
					]]
					var1511_upvr(v_44_upvr)
				end)
			else
				var1511_upvr(v_44_upvr)
			end
		end
	end
	if arg6 then
		module_10_upvr.Delay(arg6, function() -- Line 3953
			--[[ Upvalues[1]:
				[1]: var1521_upvr (readonly)
			]]
			var1521_upvr()
		end)
	else
		var1521_upvr()
	end
	local module_9 = {
		Particles = tbl_25_upvr;
	}
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	module_9.Origin = Instance.new("Attachment")
	return module_9
end
function module_10_upvr.EmitParticle2(arg1, arg2, arg3) -- Line 3966
	--[[ Upvalues[1]:
		[1]: module_11_upvr (readonly)
	]]
	local clone = arg1:Clone()
	local IgnoreInstances = workspace:FindFirstChild("IgnoreInstances")
	if not IgnoreInstances then
		IgnoreInstances = workspace
	end
	clone.Parent = IgnoreInstances
	module_11_upvr:AddItem(clone, arg3 or 5)
	if typeof(arg2) == "Vector3" then
		clone.Position = arg2
	elseif typeof(arg2) == "CFrame" then
		clone.CFrame = arg2
	end
	local var1536 = "Attachment"
	local instance = clone:FindFirstChildOfClass(var1536)
	if instance == nil then
		var1536 = false
	else
		var1536 = true
	end
	assert(var1536, arg1.Name.." must have an Attachment in it")
	for _, v_45 in pairs(instance:GetChildren()) do
		local var1541
		if v_45:IsA("ParticleEmitter") then
			if v_45:GetAttribute("EmitCount") == nil then
				var1541 = false
			else
				var1541 = true
			end
			assert(var1541, "No attribute named 'EmitCount' found in "..v_45.Name)
			v_45:Emit(v_45:GetAttribute("EmitCount"))
			var1541 = {}
			table.insert(var1541, v_45)
		end
	end
	return {}
end
function module_10_upvr.Weld(arg1, arg2, arg3, arg4) -- Line 3995
	local ManualWeld = Instance.new("ManualWeld")
	ManualWeld.Name = arg4 or "Weld"
	ManualWeld.Part0 = arg1
	ManualWeld.Part1 = arg2
	ManualWeld.Parent = arg1
	ManualWeld.C0 = arg3
	return ManualWeld
end
function module_10_upvr.AddVelocity(arg1, arg2, arg3, arg4, arg5, arg6) -- Line 4006
	--[[ Upvalues[2]:
		[1]: module_11_upvr (readonly)
		[2]: module_10_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local BodyVelocity_2 = Instance.new("BodyVelocity")
	BodyVelocity_2.Name = arg5 or "BodyVelocity"
	BodyVelocity_2.MaxForce = arg3
	BodyVelocity_2.Velocity = arg2
	local var1550
	if not arg1.Parent:FindFirstChild("Health") then
		var1550 = arg1.Parent
		local Health_2 = var1550.Parent:FindFirstChild("Health")
	end
	var1550 = game.Players:GetPlayerFromCharacter(arg1.Parent)
	if not var1550 then
		var1550 = game.Players:GetPlayerFromCharacter(arg1.Parent.Parent)
		if not var1550 then
			var1550 = game.Players:GetPlayerFromCharacter(arg1.Parent.Parent.Parent)
		end
	end
	local var1552_upvr
	local function INLINED_56() -- Internal function, doesn't exist in bytecode
		var1552_upvr = var1550.Character
		return var1552_upvr
	end
	if not var1552_upvr and (not var1550 or not INLINED_56()) then
		var1552_upvr = Health_2
		if var1552_upvr then
			var1552_upvr = Health_2.Parent
		end
	end
	if var1550 then
		local tbl_13 = {}
		tbl_13.Origin = arg1
		tbl_13.Force = BodyVelocity_2
		tbl_13.Timer = arg4
		var1552_upvr.BindableEvent:Fire("AddForce", tbl_13)
	else
		BodyVelocity_2.Parent = arg1
		module_11_upvr:AddItem(BodyVelocity_2, arg4)
		module_10_upvr.Delay(arg4, function() -- Line 4022
			--[[ Upvalues[1]:
				[1]: var1552_upvr (readonly)
			]]
			if var1552_upvr and var1552_upvr.PrimaryPart then
				if not var1552_upvr.PrimaryPart.Anchored then
					var1552_upvr.PrimaryPart:SetNetworkOwner(nil)
				end
			end
		end)
	end
end
function module_10_upvr.GetTouchingParts(arg1) -- Line 4030
	arg1.Touched:Connect(function() -- Line 4031
	end):Disconnect()
	return arg1:GetTouchingParts()
end
function module_10_upvr.RespawnMob(arg1) -- Line 4039
	--[[ Upvalues[3]:
		[1]: CollectionService_upvr (readonly)
		[2]: module_10_upvr (readonly)
		[3]: wait_upvr (readonly)
	]]
	if CollectionService_upvr:HasTag(arg1, "Respawned") then
	else
		CollectionService_upvr:AddTag(arg1, "Respawned")
		game:GetService("Debris"):AddItem(arg1, 5)
		module_10_upvr.pcall(function() -- Line 4048
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			if not arg1:GetAttribute("Unagroed") then
				arg1.BindableEvent:Fire("NilSelf")
			end
		end)
		wait_upvr(0.5)
		module_10_upvr.SpawnMob(arg1.Spawn.Value)
	end
end
function module_10_upvr.SpawnMob(arg1, ...) -- Line 4059
	--[[ Upvalues[2]:
		[1]: module_10_upvr (readonly)
		[2]: ServerStorage_upvr (readonly)
	]]
	local var1557_upvr = ...
	if not var1557_upvr then
		var1557_upvr = {}
	end
	local var1558_upvw
	module_10_upvr.pcall(function() -- Line 4063
		--[[ Upvalues[4]:
			[1]: arg1 (readonly)
			[2]: ServerStorage_upvr (copied, readonly)
			[3]: var1558_upvw (read and write)
			[4]: var1557_upvr (readonly)
		]]
		local var1560 = arg1
		var1558_upvw = ServerStorage_upvr.Mobs[var1560.Name]:Clone()
		if var1557_upvr.v2 then
			var1558_upvw.SpawnPoint.Value = var1560
			var1558_upvw:SetAttribute("Unagroed2", true)
		else
			var1558_upvw:SetAttribute("Unagroed", true)
		end
		local ObjectValue = Instance.new("ObjectValue")
		ObjectValue.Name = "Spawn"
		ObjectValue.Value = var1560
		ObjectValue.Parent = var1558_upvw
		var1558_upvw.Parent = workspace.Living
		var1558_upvw:SetPrimaryPartCFrame(var1560.CFrame * CFrame.Angles(0, math.pi, 0))
		var1558_upvw:SetPrimaryPartCFrame(var1560.CFrame * CFrame.Angles(math.pi, 0, (math.pi/2)) * CFrame.new(0, (-var1560.Size.X / 2) + (var1558_upvw.Humanoid.HipHeight + var1558_upvw.PrimaryPart.Size.Y / 2), 0))
		local BindableEvent = Instance.new("BindableEvent")
		BindableEvent.Name = "BindableEvent"
		BindableEvent.Parent = var1558_upvw
		local BindableFunction = Instance.new("BindableFunction")
		BindableFunction.Name = "BindableFunction"
		BindableFunction.Parent = var1558_upvw
		local DoubleConstrainedValue = Instance.new("DoubleConstrainedValue")
		DoubleConstrainedValue.Name = "Health"
		DoubleConstrainedValue.MaxValue = var1558_upvw.Humanoid.MaxHealth
		DoubleConstrainedValue.Value = DoubleConstrainedValue.MaxValue
		DoubleConstrainedValue.Parent = var1558_upvw
	end)
	return var1558_upvw
end
local delay_upvr = task.delay
local Weighted_upvr = require(ReplicatedStorage_upvr.Modules.Weighted)
function module_10_upvr.Damage(arg1, arg2, ...) -- Line 4106
	--[[ Upvalues[9]:
		[1]: ReplicatedStorage_upvr (readonly)
		[2]: ServerStorage_upvr (readonly)
		[3]: CollectionService_upvr (readonly)
		[4]: module_10_upvr (readonly)
		[5]: module_11_upvr (readonly)
		[6]: ClientFX_upvr (readonly)
		[7]: wait_upvr (readonly)
		[8]: delay_upvr (readonly)
		[9]: Weighted_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	local _ = ...
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [47] 31. Error Block 2 start (CF ANALYSIS FAILED)
	arg2:SetAttribute("Unagroed2", nil)
	arg2.AgroFunction:Invoke()
	-- KONSTANTERROR: [47] 31. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [57] 38. Error Block 3 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [57] 38. Error Block 3 end (CF ANALYSIS FAILED)
end
_G.VisualizeHitbox = false
local module_4_upvr = require(ReplicatedStorage_upvr:WaitForChild("Modules"):WaitForChild("RegionMod"))
function module_10_upvr.SpawnRegion3(arg1, ...) -- Line 6271
	--[[ Upvalues[2]:
		[1]: module_4_upvr (readonly)
		[2]: module_11_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [3] 4. Error Block 2 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [3] 4. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [5] 5. Error Block 3 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [5] 5. Error Block 3 end (CF ANALYSIS FAILED)
end
function module_10_upvr.Split(arg1, arg2) -- Line 6351
	--[[ Upvalues[1]:
		[1]: module_11_upvr (readonly)
	]]
	local module_8 = {}
	for _ = 1, arg2 do
		local clone_2 = arg1:Clone()
		module_11_upvr:AddItem(clone_2, 1)
		clone_2.Size = arg1.Size / 4
		clone_2.CFrame = arg1.CFrame
		clone_2.CanCollide = false
		clone_2.Anchored = false
		clone_2.Parent = workspace
		table.insert(module_8, clone_2)
	end
	return module_8
end
function module_10_upvr.Spawn(arg1) -- Line 6366
	--[[ Upvalues[4]:
		[1]: create_upvr (readonly)
		[2]: pcall_2_upvr (readonly)
		[3]: coroutine_upvr (readonly)
		[4]: resume_upvr (readonly)
	]]
	local var1574_upvw
	local func_source_upvw_2 = debug.info(2, 's')
	local line_defined_upvw_2 = debug.info(2, 'l')
	var1574_upvw = create_upvr(function() -- Line 6372
		--[[ Upvalues[6]:
			[1]: var1574_upvw (read and write)
			[2]: pcall_2_upvr (copied, readonly)
			[3]: arg1 (readonly)
			[4]: func_source_upvw_2 (read and write)
			[5]: line_defined_upvw_2 (read and write)
			[6]: coroutine_upvr (copied, readonly)
		]]
		var1574_upvw = nil
		local var5_result1_2, pcall_2_upvr_result2 = pcall_2_upvr(function() -- Line 6375
			--[[ Upvalues[1]:
				[1]: arg1 (copied, readonly)
			]]
			arg1()
		end)
		if not var5_result1_2 then
			print("Lib.Spawn Error:", pcall_2_upvr_result2, " | DEBUG INFO:", func_source_upvw_2, line_defined_upvw_2)
		end
		func_source_upvw_2 = nil
		line_defined_upvw_2 = nil
		if coroutine_upvr.running() then
			coroutine_upvr.yield()
		else
			coroutine_upvr.close()
		end
	end)
	resume_upvr(var1574_upvw)
end
function module_10_upvr.Delay(arg1, arg2) -- Line 6398
	--[[ Upvalues[5]:
		[1]: create_upvr (readonly)
		[2]: pcall_2_upvr (readonly)
		[3]: wait_upvr (readonly)
		[4]: coroutine_upvr (readonly)
		[5]: resume_upvr (readonly)
	]]
	local var1581_upvw
	local func_source_upvw = debug.info(2, 's')
	local line_defined_upvw = debug.info(2, 'l')
	var1581_upvw = create_upvr(function() -- Line 6404
		--[[ Upvalues[8]:
			[1]: var1581_upvw (read and write)
			[2]: pcall_2_upvr (copied, readonly)
			[3]: arg1 (readonly)
			[4]: wait_upvr (copied, readonly)
			[5]: arg2 (readonly)
			[6]: func_source_upvw (read and write)
			[7]: line_defined_upvw (read and write)
			[8]: coroutine_upvr (copied, readonly)
		]]
		var1581_upvw = nil
		local var5_result1_6, var5_result2_3 = pcall_2_upvr(function() -- Line 6407
			--[[ Upvalues[3]:
				[1]: arg1 (copied, readonly)
				[2]: wait_upvr (copied, readonly)
				[3]: arg2 (copied, readonly)
			]]
			if 1 <= arg1 then
				wait_upvr(arg1)
			else
				wait_upvr(arg1)
			end
			arg2()
		end)
		if not var5_result1_6 then
			print("Lib.Delay Error:", var5_result2_3, " | DEBUG INFO:", func_source_upvw, line_defined_upvw)
		end
		func_source_upvw = nil
		line_defined_upvw = nil
		if coroutine_upvr.running() then
			coroutine_upvr.yield()
		else
			coroutine_upvr.close()
		end
	end)
	resume_upvr(var1581_upvw)
end
function module_10_upvr.pcall(arg1) -- Line 6437
	--[[ Upvalues[1]:
		[1]: pcall_2_upvr (readonly)
	]]
	local var5_result1_4, var5_result2_2 = pcall_2_upvr(function() -- Line 6441
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		arg1()
	end)
	if not var5_result1_4 then
		print("Lib.pcall Error:", var5_result2_2, " | DEBUG INFO:", debug.info(2, 's'), debug.info(2, 'l'))
	end
	return var5_result1_4, var5_result2_2
end
function module_10_upvr.SplitPart(...) -- Line 6452
	--[[ Upvalues[1]:
		[1]: ClientFX_upvr (readonly)
	]]
	local var1590 = ...
	local Part = var1590.Part
	local Splitter = require(script.Splitter)
	local any_SplitPart_result1 = Splitter.SplitPart(Part, var1590.Player, var1590)
	if any_SplitPart_result1 then
		ClientFX_upvr:FireAllClients("SplitPart", {
			Part = Part;
			LongestAxis = Splitter.ReturnLongestAxis(Part);
			Axis = Splitter.ReturnLongestAxis(Part, true);
		})
	end
	return any_SplitPart_result1
end
module_10_upvr.Default_Crit_Chance = 10
module_10_upvr.Default_Crit_Damage = 150
function module_10_upvr.ReturnStat(...) -- Line 6474
	--[[ Upvalues[3]:
		[1]: module_10_upvr (readonly)
		[2]: ServerStorage_upvr (readonly)
		[3]: CollectionService_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var1595_upvr = ...
	if not var1595_upvr then
		var1595_upvr = {}
	end
	local Stat = var1595_upvr.Stat
	local Player_upvr = var1595_upvr.Player
	local self_upvr = var1595_upvr.self
	if not self_upvr or not self_upvr.Char then
		if Player_upvr then
			local Character_2_upvr = Player_upvr.Character
		end
	end
	local var1600_upvr = Character_2_upvr
	if var1600_upvr then
		var1600_upvr = Character_2_upvr:FindFirstChild("Health")
	end
	local var1601_upvr = Character_2_upvr
	if var1601_upvr then
		var1601_upvr = Character_2_upvr:FindFirstChild("InTimeStop")
	end
	local var1602_upvr = Character_2_upvr
	if var1602_upvr then
		var1602_upvr = Character_2_upvr:FindFirstChild("HumanoidRootPart")
	end
	local var1603_upvr = Character_2_upvr
	if var1603_upvr then
		var1603_upvr = Character_2_upvr:FindFirstChild("Blood")
	end
	local var1604_upvr = Character_2_upvr
	if var1604_upvr then
		var1604_upvr = Character_2_upvr:FindFirstChild("RemoteFunction")
	end
	local var1605_upvr = Character_2_upvr
	if var1605_upvr then
		var1605_upvr = Character_2_upvr:FindFirstChild("BindableFunction")
	end
	local var1606_upvr = Player_upvr
	if var1606_upvr then
		var1606_upvr = Player_upvr:FindFirstChild("CharacterSkillTree")
	end
	local var1607_upvr = Player_upvr
	if var1607_upvr then
		var1607_upvr = Player_upvr:FindFirstChild("StandSkillTree")
	end
	local var1608_upvr = Player_upvr
	if var1608_upvr then
		var1608_upvr = Player_upvr:FindFirstChild("SpecSkillTree")
	end
	local tbl_36 = {
		Max_Health = function() -- Line 6494
			--[[ Upvalues[2]:
				[1]: Character_2_upvr (readonly)
				[2]: Player_upvr (readonly)
			]]
			local MaxHealth = Character_2_upvr.Humanoid.MaxHealth
			if Player_upvr then
				if Player_upvr.CharacterSkillTree then
					for _, v_46 in pairs(Player_upvr.CharacterSkillTree:GetChildren()) do
						if v_46.Name:match("Vitality ") and v_46.Value then
							MaxHealth += 10.5
						end
						if v_46.Name:match("Meat Shield ") then
							if v_46.Value then
								MaxHealth += 17
							end
						end
					end
				end
				if Player_upvr.StandSkillTree then
					for _, v_47 in pairs(Player_upvr.StandSkillTree:GetChildren()) do
						if v_47.Name:match("Vitality ") and v_47.Value then
							MaxHealth += 10.5
						end
					end
				end
				if Player_upvr.SpecSkillTree then
					for _, v_48 in pairs(Player_upvr.SpecSkillTree:GetChildren()) do
						if v_48.Name:match("Vitality ") and v_48.Value then
							MaxHealth += 10.5
						end
						if v_48.Name:match("Meat Shield ") and v_48.Value then
							MaxHealth += 17
						end
						if v_48.Name == "Joestar Resolve V" and v_48.Value then
							MaxHealth += 10
						end
					end
				end
			end
			local Goliath = Character_2_upvr:GetAttribute("Goliath")
			if Goliath then
			end
			return {
				Amount = MaxHealth * Goliath;
			}
		end;
		Crit_Chance = function() -- Line 6548
			--[[ Upvalues[2]:
				[1]: module_10_upvr (copied, readonly)
				[2]: Player_upvr (readonly)
			]]
			local var1643
			for _, v_49 in pairs(_G.Playerlist[Player_upvr.Name].CharMod.CritChance) do
				if v_49.Value then
					var1643 += v_49.Value
				end
			end
			return {
				Amount = var1643;
			}
		end;
		Crit_Damage = function() -- Line 6562
			--[[ Upvalues[1]:
				[1]: module_10_upvr (copied, readonly)
			]]
			return {
				Amount = module_10_upvr.Default_Crit_Damage;
			}
		end;
		RagdollSturdiness = function() -- Line 6570
			--[[ Upvalues[1]:
				[1]: var1606_upvr (readonly)
			]]
			local var1655
			for _, v_50 in pairs(var1606_upvr:GetChildren()) do
				if v_50.Name:match("Sturdiness") and v_50.Value then
					var1655 -= 0.15
				end
			end
			return {
				Amount = var1655;
			}
		end;
		Block = function() -- Line 6584
			--[[ Upvalues[1]:
				[1]: Character_2_upvr (readonly)
			]]
			return {
				Blocking_Capacity = Character_2_upvr:FindFirstChild("Blocking_Capacity");
			}
		end;
		DashPower = function() -- Line 6592
			--[[ Upvalues[11]:
				[1]: var1595_upvr (readonly)
				[2]: Player_upvr (readonly)
				[3]: var1606_upvr (readonly)
				[4]: var1607_upvr (readonly)
				[5]: var1608_upvr (readonly)
				[6]: Character_2_upvr (readonly)
				[7]: var1603_upvr (readonly)
				[8]: self_upvr (readonly)
				[9]: ServerStorage_upvr (copied, readonly)
				[10]: module_10_upvr (copied, readonly)
				[11]: CollectionService_upvr (copied, readonly)
			]]
			-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
			local var1684
			if var1684 then
				var1684 = 1
				for _, v_51 in pairs(var1606_upvr:GetChildren()) do
					if v_51.Name:match("Agility ") and v_51.Value then
						var1684 += 0.05
					end
				end
				for _, v_52 in pairs(var1607_upvr:GetChildren()) do
					if v_52.Name:match("Dash Mastery ") and v_52.Value then
						var1684 += 0.07
					end
					if v_52.Name:match("Agility ") and v_52.Value then
						var1684 += 0.05
					end
				end
				for i_63, v_53 in pairs(var1608_upvr:GetChildren()) do
					if v_53.Name:match("Dash Mastery ") and v_53.Value then
						var1684 += 0.07
					end
				end
				if Character_2_upvr:GetAttribute("GoldenSkin") then
				end
				if var1603_upvr and 0 < var1603_upvr.Value then
					local const_number_5 = 1.35
					i_63 = var1603_upvr
					v_53 = (var1603_upvr.Value) / (i_63.MaxValue * 0.75)
					i_63 = const_number_5 * v_53
					v_53 = 1
				end
				if 80 < 50 * var1684 * 1.35 * math.clamp(i_63, v_53, const_number_5) then
				end
			end
			local MobileDashDirection = var1595_upvr.MobileDashDirection
			local var1696
			if var1595_upvr.Hold_daA or MobileDashDirection == "Left" then
				self_upvr.RolledLeft = true
				module_10_upvr.Delay(0.5, function() -- Line 6655
					--[[ Upvalues[1]:
						[1]: self_upvr (copied, readonly)
					]]
					self_upvr.RolledLeft = nil
				end)
			elseif var1595_upvr.HoldD or MobileDashDirection == "Right" then
				self_upvr.RolledRight = true
				module_10_upvr.Delay(0.5, function() -- Line 6664
					--[[ Upvalues[1]:
						[1]: self_upvr (copied, readonly)
					]]
					self_upvr.RolledRight = nil
				end)
			elseif var1595_upvr.HoldW or MobileDashDirection == "Forward" then
			elseif not var1595_upvr.Viewing then
				self_upvr.RolledBack = true
				module_10_upvr.Delay(0.5, function() -- Line 6679
					--[[ Upvalues[1]:
						[1]: self_upvr (copied, readonly)
					]]
					self_upvr.RolledBack = nil
				end)
			end
			local var1700
			if Character_2_upvr:FindFirstChild("Godspeed") or CollectionService_upvr:HasTag(Character_2_upvr, "Double Accel") or CollectionService_upvr:HasTag(Character_2_upvr, "Electrify") then
				var1700 = true
			end
			return {
				Amount = 20;
				Vector = var1696 + -self_upvr.Root.CFrame.rightVector + self_upvr.Root.CFrame.rightVector + self_upvr.Root.CFrame.lookVector + -self_upvr.Root.CFrame.lookVector;
				Anim = ServerStorage_upvr.Anims["Dash Backward"];
				Direction = 180;
				Blink = var1700;
			}
		end;
		HealthRegen = function() -- Line 6704
			--[[ Upvalues[9]:
				[1]: ServerStorage_upvr (copied, readonly)
				[2]: var1605_upvr (readonly)
				[3]: var1604_upvr (readonly)
				[4]: var1595_upvr (readonly)
				[5]: var1602_upvr (readonly)
				[6]: var1601_upvr (readonly)
				[7]: Character_2_upvr (readonly)
				[8]: CollectionService_upvr (copied, readonly)
				[9]: var1600_upvr (readonly)
			]]
			-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
			local var1703
			local function INLINED_57() -- Internal function, doesn't exist in bytecode
				var1703 = var1605_upvr:Invoke("ReturnHealthRegen")
				return var1703
			end
			if not ServerStorage_upvr or not INLINED_57() then
				var1703 = var1604_upvr:InvokeServer("ReturnHealthRegen")
			end
			if var1595_upvr.NoRegen then
				return {
					Rate = 4;
				}
			end
			local var1705
			if var1602_upvr:findFirstChild("Menacing") and not var1601_upvr then
				var1705 = true
			end
			local var1706
			if Character_2_upvr:GetAttribute("Bleeding") and not Character_2_upvr:FindFirstChild("Blood") then
				var1706 = math.clamp(var1706 - 0.7, 0, 999)
			elseif Character_2_upvr:GetAttribute("Burning") or CollectionService_upvr:HasTag(Character_2_upvr, "AntiHeal") then
				var1706 = math.clamp(var1706 - 0.6, 0, 999)
			end
			local Spirit_Visage = Character_2_upvr:GetAttribute("Spirit_Visage")
			if Spirit_Visage then
				var1706 += Spirit_Visage - 1
			end
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			local var1708 = not var1705 and Character_2_upvr:FindFirstChild("Blood")
			local var1709
			if var1708 and 0 < var1708.Value then
				if not var1595_upvr.Viewing then
					var1708.Value -= 1.7 / (1.1 + var1703.HyperRegeneration * 0.1)
				end
				var1709 = (var1709 + 0.5) * 4
			else
				var1709 += var1703.HealthRegenUpgrades
			end
			return {
				Rate = 4;
				RegenRate = 1 / 4;
				Regen = (0.4 + var1709) * var1706 / 100 * var1600_upvr.MaxValue;
			}
		end;
	}
	if not tbl_36[Stat] or not tbl_36[Stat]() then
	end
	return {}
end
local tbl_39_upvr = {}
function module_10_upvr.GuiHoverAnimate(...) -- Line 6785
	--[[ Upvalues[4]:
		[1]: ReplicatedStorage_upvr (readonly)
		[2]: pcall_2_upvr (readonly)
		[3]: tbl_39_upvr (readonly)
		[4]: module_10_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var1720 = ...
	local Gui_upvr = var1720.Gui
	local var1722_upvr = var1720.TweenTime or 0.5
	local Color1_upvr = var1720.Color1
	if not Color1_upvr then
		Color1_upvr = Color3.fromRGB(255, 200, 0)
	end
	local Color2_upvr = var1720.Color2
	if not Color2_upvr then
		Color2_upvr = Color3.fromRGB(255, 200, 0)
	end
	local function var1725_upvr(arg1) -- Line 6795
		--[[ Upvalues[6]:
			[1]: Gui_upvr (readonly)
			[2]: ReplicatedStorage_upvr (copied, readonly)
			[3]: var1722_upvr (readonly)
			[4]: pcall_2_upvr (copied, readonly)
			[5]: Color1_upvr (readonly)
			[6]: Color2_upvr (readonly)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [39] 27. Error Block 2 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [39] 27. Error Block 2 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [48] 33. Error Block 5 start (CF ANALYSIS FAILED)
		do
			return
		end
		-- KONSTANTERROR: [48] 33. Error Block 5 end (CF ANALYSIS FAILED)
	end
	if tbl_39_upvr[Gui_upvr] then
	else
		tbl_39_upvr[Gui_upvr] = true
		for _, v_58_upvr in pairs(Gui_upvr:GetDescendants()) do
			module_10_upvr.Spawn(function() -- Line 6876
				--[[ Upvalues[2]:
					[1]: v_58_upvr (readonly)
					[2]: var1725_upvr (readonly)
				]]
				if v_58_upvr:IsA("GuiObject") then
					var1725_upvr(v_58_upvr)
				end
			end)
			local var1730
		end
		var1730(Gui_upvr)
		module_10_upvr.Delay(var1722_upvr, function() -- Line 6885
			--[[ Upvalues[2]:
				[1]: tbl_39_upvr (copied, readonly)
				[2]: Gui_upvr (readonly)
			]]
			tbl_39_upvr[Gui_upvr] = nil
		end)
	end
end
function module_10_upvr.GuiHoverHint(...) -- Line 6890
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var1767 = ...
	if not var1767 then
		var1767 = {}
	end
	local Gui_2 = var1767.Gui
	local Mouse_upvr_2 = var1767.Mouse
	if not Mouse_upvr_2 then
		Mouse_upvr_2 = game.Players.LocalPlayer:GetMouse()
	end
	local Description = var1767.Description
	if not Description then
		Description = Gui_2:GetAttribute("HoverHint")
		if not Description then
			Description = "Description: ?"
		end
	end
	if #Description <= 0 then
	else
		local clamped = math.clamp((function(arg1) -- Line 6903
			local var1774
			for i_70 = 1, #arg1 do
				if string.sub(arg1, i_70, i_70) ~= ' ' then
					var1774 += 1
				end
			end
			return var1774
		end)(Description) / 35, 1, 2)
		for i_71 = 1, #Description do
			if string.sub(Description, i_71, i_71) ~= ' ' and 35 <= 0 + 1 then
				local var1776 = 1 + 1
			end
		end
		local Size_2 = var1767.Size
		if not Size_2 then
			Size_2 = UDim2.new
			i_71 = 0.2
			i_71 = 0
			Size_2 = Size_2(i_71 * clamped, i_71, 0.03 * var1776, 0)
		end
		local ScreenGui_upvr = Instance.new("ScreenGui")
		ScreenGui_upvr.DisplayOrder = Gui_2:FindFirstAncestorOfClass("ScreenGui").DisplayOrder
		ScreenGui_upvr.IgnoreGuiInset = true
		ScreenGui_upvr.Parent = game.Players.LocalPlayer.PlayerGui
		local ImageLabel_upvr_3 = Instance.new("ImageLabel")
		ImageLabel_upvr_3.BackgroundTransparency = 0.5
		ImageLabel_upvr_3.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		ImageLabel_upvr_3.Size = Size_2
		local UICorner_2 = Instance.new("UICorner")
		UICorner_2.CornerRadius = UDim.new(0.1, 0)
		UICorner_2.Parent = ImageLabel_upvr_3
		local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
		UIAspectRatioConstraint_2.AspectRatio = 12.2 * clamped / var1776
		UIAspectRatioConstraint_2.Parent = ImageLabel_upvr_3
		local TextLabel_upvr_2 = Instance.new("TextLabel")
		TextLabel_upvr_2.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel_upvr_2.TextStrokeTransparency = 0
		TextLabel_upvr_2.BackgroundTransparency = 1
		TextLabel_upvr_2.Text = Description
		TextLabel_upvr_2.AnchorPoint = Vector2.new(0.5, 0.5)
		TextLabel_upvr_2.Position = UDim2.new(0.5, 0, 0.5, 0)
		TextLabel_upvr_2.Size = UDim2.new(0.9, 0, 0.9, 0)
		TextLabel_upvr_2.TextScaled = true
		TextLabel_upvr_2.Parent = ImageLabel_upvr_3
		local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
		UITextSizeConstraint.MaxTextSize = 24
		UITextSizeConstraint.Parent = TextLabel_upvr_2
		local var1785_upvw
		var1785_upvw = game:GetService("RunService").Heartbeat:connect(function() -- Line 6974
			--[[ Upvalues[5]:
				[1]: ScreenGui_upvr (readonly)
				[2]: var1785_upvw (read and write)
				[3]: Mouse_upvr_2 (readonly)
				[4]: ImageLabel_upvr_3 (readonly)
				[5]: TextLabel_upvr_2 (readonly)
			]]
			if not ScreenGui_upvr or not ScreenGui_upvr.Parent then
				var1785_upvw:Disconnect()
				var1785_upvw = nil
			else
				local X = Mouse_upvr_2.X
				local Y_2 = Mouse_upvr_2.Y
				local var1788 = Vector2.new(X, Y_2) - workspace.CurrentCamera.ViewportSize / 2
				local var1789 = 10
				if 0 < var1788.x then
					ImageLabel_upvr_3.AnchorPoint = Vector2.new(1, ImageLabel_upvr_3.AnchorPoint.Y)
					var1789 = -10
					TextLabel_upvr_2.TextXAlignment = Enum.TextXAlignment.Right
				else
					ImageLabel_upvr_3.AnchorPoint = Vector2.new(0, ImageLabel_upvr_3.AnchorPoint.Y)
					TextLabel_upvr_2.TextXAlignment = Enum.TextXAlignment.Left
				end
				if 0 < var1788.y then
					ImageLabel_upvr_3.AnchorPoint = Vector2.new(ImageLabel_upvr_3.AnchorPoint.X, 1)
					TextLabel_upvr_2.TextYAlignment = Enum.TextYAlignment.Bottom
				else
					ImageLabel_upvr_3.AnchorPoint = Vector2.new(ImageLabel_upvr_3.AnchorPoint.X, 0)
					TextLabel_upvr_2.TextYAlignment = Enum.TextYAlignment.Top
				end
				ImageLabel_upvr_3.Position = UDim2.new((-ScreenGui_upvr.AbsolutePosition.X + X) / ScreenGui_upvr.AbsoluteSize.X, var1789, (-ScreenGui_upvr.AbsolutePosition.Y + Y_2) / ScreenGui_upvr.AbsoluteSize.Y, 0)
				ImageLabel_upvr_3.Parent = ScreenGui_upvr
			end
		end)
		local var1791_upvw
		var1791_upvw = Gui_2.MouseLeave:connect(function() -- Line 7020
			--[[ Upvalues[2]:
				[1]: var1791_upvw (read and write)
				[2]: ScreenGui_upvr (readonly)
			]]
			var1791_upvw:Disconnect()
			var1791_upvw = nil
			ScreenGui_upvr:Destroy()
		end)
	end
end
function module_10_upvr.GuiClickAnimation(...) -- Line 7028
	--[[ Upvalues[5]:
		[1]: ReplicatedStorage_upvr (readonly)
		[2]: TweenService_upvr (readonly)
		[3]: module_10_upvr (readonly)
		[4]: module_11_upvr (readonly)
		[5]: wait_upvr (readonly)
	]]
	local LocalPlayer_3_upvr = game.Players.LocalPlayer
	local var1793_upvr = ...
	if not var1793_upvr then
		var1793_upvr = {}
	end
	local class_ScreenGui_upvr = var1793_upvr.Gui:FindFirstAncestorOfClass("ScreenGui")
	local Mouse_upvr = var1793_upvr.Mouse
	if not Mouse_upvr then
		Mouse_upvr = LocalPlayer_3_upvr:GetMouse()
	end
	local function _(arg1) -- Line 7036
		--[[ Upvalues[1]:
			[1]: Mouse_upvr (readonly)
		]]
		return UDim2.new((-arg1.AbsolutePosition.X + Mouse_upvr.X) / arg1.AbsoluteSize.X, 0, (-arg1.AbsolutePosition.Y + Mouse_upvr.Y) / arg1.AbsoluteSize.Y, 0)
	end
	local tbl_10_upvr = {
		Default = function() -- Line 7046
			--[[ Upvalues[8]:
				[1]: var1793_upvr (readonly)
				[2]: ReplicatedStorage_upvr (copied, readonly)
				[3]: class_ScreenGui_upvr (readonly)
				[4]: LocalPlayer_3_upvr (readonly)
				[5]: Mouse_upvr (readonly)
				[6]: TweenService_upvr (copied, readonly)
				[7]: module_10_upvr (copied, readonly)
				[8]: module_11_upvr (copied, readonly)
			]]
			local Size_3 = var1793_upvr.Size
			if not Size_3 then
				Size_3 = UDim2.new(0.07, 0, 0.07, 0)
			end
			local clone_8 = ReplicatedStorage_upvr.Objects.CircleGuiClick:Clone()
			clone_8.DisplayOrder = class_ScreenGui_upvr.DisplayOrder
			clone_8.IgnoreGuiInset = true
			local ImageLabel_upvr_2 = clone_8.ImageLabel
			ImageLabel_upvr_2.Size = UDim2.new(0, 0, 0, 0)
			ImageLabel_upvr_2.AnchorPoint = Vector2.new(0.5, 0.5)
			ImageLabel_upvr_2.Position = UDim2.new(0, 0, 0, 0)
			ImageLabel_upvr_2.Parent = nil
			ImageLabel_upvr_2.Visible = true
			clone_8.Parent = LocalPlayer_3_upvr.PlayerGui
			ImageLabel_upvr_2.Position = UDim2.new((-clone_8.AbsolutePosition.X + Mouse_upvr.X) / clone_8.AbsoluteSize.X, 0, (-clone_8.AbsolutePosition.Y + Mouse_upvr.Y) / clone_8.AbsoluteSize.Y, 0)
			ImageLabel_upvr_2.Parent = clone_8
			local any_Create_result1_2_upvr = TweenService_upvr:Create(ImageLabel_upvr_2, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
				Size = UDim2.new(Size_3.X.Scale * 1, 0, Size_3.Y.Scale * 1, 0);
			})
			any_Create_result1_2_upvr:Play()
			module_10_upvr.Delay(any_Create_result1_2_upvr.TweenInfo.Time * 0.2, function() -- Line 7071
				--[[ Upvalues[4]:
					[1]: TweenService_upvr (copied, readonly)
					[2]: ImageLabel_upvr_2 (readonly)
					[3]: any_Create_result1_2_upvr (readonly)
					[4]: module_11_upvr (copied, readonly)
				]]
				local any_Create_result1 = TweenService_upvr:Create(ImageLabel_upvr_2, TweenInfo.new(any_Create_result1_2_upvr.TweenInfo.Time * 0.7, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {
					ImageTransparency = 1;
				})
				any_Create_result1:Play()
				module_11_upvr:AddItem(any_Create_result1, 1)
			end)
			module_11_upvr:AddItems({any_Create_result1_2_upvr, clone_8}, 1)
		end;
		SparkleCircle = function() -- Line 7083
			--[[ Upvalues[7]:
				[1]: var1793_upvr (readonly)
				[2]: ReplicatedStorage_upvr (copied, readonly)
				[3]: class_ScreenGui_upvr (readonly)
				[4]: LocalPlayer_3_upvr (readonly)
				[5]: Mouse_upvr (readonly)
				[6]: wait_upvr (copied, readonly)
				[7]: module_11_upvr (copied, readonly)
			]]
			-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
			local var1821
			if not var1821 then
				var1821 = UDim2.new(0.2, 0, 0.2, 0)
			end
			local clone_6 = ReplicatedStorage_upvr.Objects.SparkleCircleGuiClick:Clone()
			clone_6.DisplayOrder = class_ScreenGui_upvr.DisplayOrder
			clone_6.IgnoreGuiInset = true
			local len = #clone_6:GetChildren()
			for _, v_54 in pairs(clone_6:GetChildren()) do
				({})[tonumber(v_54.Name)] = v_54
				v_54.Size = var1821
				v_54.AnchorPoint = Vector2.new(0.5, 0.5)
				v_54.Position = UDim2.new(0, 0, 0, 0)
				v_54.Parent = nil
				v_54.Visible = true
				v_54.ImageTransparency = 0
				Instance.new("UIAspectRatioConstraint").Parent = v_54
				local var1828
			end
			clone_6.Parent = LocalPlayer_3_upvr.PlayerGui
			for i_65 = 1, len do
				local var1829 = var1828[i_65]
				local var1830
				local function INLINED_58() -- Internal function, doesn't exist in bytecode
					var1830 = var1829
					return var1830
				end
				if i_65 ~= 1 or not INLINED_58() then
					var1830 = var1828[i_65 - 1]
				end
				var1830.Visible = false
				var1829.Position = UDim2.new((-clone_6.AbsolutePosition.X + Mouse_upvr.X) / clone_6.AbsoluteSize.X, 0, (-clone_6.AbsolutePosition.Y + Mouse_upvr.Y) / clone_6.AbsoluteSize.Y, 0)
				var1829.Parent = clone_6
				wait_upvr(0)
			end
			var1828[len].Visible = false
			module_11_upvr:AddItem(clone_6, 1)
		end;
	}
	module_10_upvr.Spawn(function() -- Line 7130
		--[[ Upvalues[2]:
			[1]: tbl_10_upvr (readonly)
			[2]: var1793_upvr (readonly)
		]]
		tbl_10_upvr[var1793_upvr.Animation or "Default"]()
	end)
end
return module_10_upvr
