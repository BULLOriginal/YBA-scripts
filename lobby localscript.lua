-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2024-11-10 20:08:33
-- Luau version 6, Types version 3
-- Time taken: 0.004402 seconds

print("Lobby Version: "..script:WaitForChild("Version").Value)
local ReplicatedFirst = game:GetService("ReplicatedFirst")
ReplicatedFirst:RemoveDefaultLoadingScreen()
local LocalPlayer_upvr = game:GetService("Players").LocalPlayer
local PlayerGui = LocalPlayer_upvr:WaitForChild("PlayerGui")
local GuiService = game:GetService("GuiService")
local Main = script:WaitForChild("Main")
local Begin_upvr = Main:WaitForChild("Begin")
local Frame_upvr = Main:WaitForChild("Frame")
local var15
for _, v in ipairs(ReplicatedFirst:GetChildren()) do
	if v:IsA("LocalScript") and v.Name == "Lobby" then
		var15 += 1
	end
end
print("Lobby count:", var15)
if var15 == 2 then
	print("Already setup!")
else
	Frame_upvr.Visible = false
	Begin_upvr.Visible = true
	repeat
		wait()
	until not LocalPlayer_upvr:GetAttribute("LOADED") or PlayerGui:FindFirstChild("LoadingScreen") or PlayerGui:FindFirstChild("HUD")
	Main.Parent = PlayerGui
	local ReplicatedStorage_upvr = game:GetService("ReplicatedStorage")
	local Playercount_upvr = Frame_upvr:WaitForChild("Playercount")
	local TimeElapsed_upvr = Frame_upvr:WaitForChild("TimeElapsed")
	local function var16_upvr() -- Line 37
		--[[ Upvalues[6]:
			[1]: Begin_upvr (readonly)
			[2]: Frame_upvr (readonly)
			[3]: ReplicatedStorage_upvr (readonly)
			[4]: LocalPlayer_upvr (readonly)
			[5]: Playercount_upvr (readonly)
			[6]: TimeElapsed_upvr (readonly)
		]]
		Begin_upvr.Visible = false
		Frame_upvr.Visible = true
		delay(10, function() -- Line 42
			game.ReplicatedStorage.SBMRemote:FireServer()
		end)
		local tick_result1_upvr = tick()
		spawn(function() -- Line 48
			--[[ Upvalues[5]:
				[1]: ReplicatedStorage_upvr (copied, readonly)
				[2]: LocalPlayer_upvr (copied, readonly)
				[3]: Playercount_upvr (copied, readonly)
				[4]: TimeElapsed_upvr (copied, readonly)
				[5]: tick_result1_upvr (readonly)
			]]
			while true do
				wait()
				for _, v_2 in pairs(game.Players:GetPlayers()) do
					if v_2:GetAttribute("InQueue") and v_2 ~= LocalPlayer_upvr then
						table.insert({}, v_2)
					end
				end
				-- KONSTANTERROR: Expression was reused, decompilation is incorrect
				Playercount_upvr.Text = "Players in Queue: "..(#{})
				TimeElapsed_upvr.Text = "Time Elapsed: "..require(ReplicatedStorage_upvr:WaitForChild("Modules"):WaitForChild("FunctionLibrary")).convertToHMS(tick() - tick_result1_upvr)
			end
		end)
	end
	var16_upvr()
	Begin_upvr.MouseButton1Down:Connect(function() -- Line 70
		--[[ Upvalues[1]:
			[1]: var16_upvr (readonly)
		]]
		var16_upvr()
	end)
	local Matchmaking_upvr = Frame_upvr:WaitForChild("Matchmaking")
	coroutine.resume(coroutine.create(function() -- Line 74
		--[[ Upvalues[1]:
			[1]: Matchmaking_upvr (readonly)
		]]
		while true do
			Matchmaking_upvr.Text = "Currently match-making"
			wait(1)
			Matchmaking_upvr.Text = "Currently match-making ."
			wait(1)
			Matchmaking_upvr.Text = "Currently match-making . ."
			wait(1)
			Matchmaking_upvr.Text = "Currently match-making . . ."
			wait(1)
		end
	end))
	local tbl_upvr = {}
	GuiService.MenuOpened:Connect(function() -- Line 96
		--[[ Upvalues[2]:
			[1]: LocalPlayer_upvr (readonly)
			[2]: tbl_upvr (readonly)
		]]
		for _, v_3 in pairs(game.Players:GetPlayers()) do
			if v_3.Name ~= LocalPlayer_upvr.Name then
				tbl_upvr[v_3] = v_3
				v_3.Parent = nil
			end
		end
	end)
	GuiService.MenuClosed:Connect(function() -- Line 106
		--[[ Upvalues[1]:
			[1]: tbl_upvr (readonly)
		]]
		for i_4, v_4_upvr in pairs(tbl_upvr) do
			tbl_upvr[i_4] = false
			local pcall_result1_2, pcall_result2_2 = pcall(function() -- Line 110
				--[[ Upvalues[1]:
					[1]: v_4_upvr (readonly)
				]]
				v_4_upvr.Parent = game.Players
			end)
			if not pcall_result1_2 then
				print(pcall_result2_2)
			end
		end
	end)
	coroutine.resume(coroutine.create(function() -- Line 118
		--[[ Upvalues[1]:
			[1]: LocalPlayer_upvr (readonly)
		]]
		while true do
			local pcall_result1, pcall_result2 = pcall(function() -- Line 120
				--[[ Upvalues[1]:
					[1]: LocalPlayer_upvr (copied, readonly)
				]]
				game:GetService("StarterGui"):SetCore("TopbarEnabled", false)
				game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
				game:GetService("StarterGui"):SetCore("ResetButtonCallback", false)
				LocalPlayer_upvr.Character.HumanoidRootPart.Anchored = true
			end)
			if not pcall_result1 then
				print(pcall_result2)
			end
			wait(0.2)
		end
	end))
	local var52_upvw = false
	Main:WaitForChild("Back").MouseButton1Click:connect(function() -- Line 135
		--[[ Upvalues[2]:
			[1]: var52_upvw (read and write)
			[2]: LocalPlayer_upvr (readonly)
		]]
		if var52_upvw then
		else
			var52_upvw = true
			LocalPlayer_upvr.Character.RemoteEvent:FireServer("ReturnToLobby")
		end
	end)
end
