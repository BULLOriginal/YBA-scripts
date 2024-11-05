local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()

local Window = Library.CreateLib("Name", "RJTheme3") 
local Tab = Window:NewTab("TabName")
local Section = Tab:NewSection("Section Name")
local GlobScrPilot

local humanoid
local body
local destination
local PathfindingService
local path
local waypoints
local target
local GlobTarget = "Diavolo"
local local_plr_living 
local plr = game:GetService("Players").LocalPlayer
for i,v in pairs(game:GetService("Workspace").Living:GetChildren()) do
    if v.Name == plr.Name then
        local_plr_living = v --local name obtain
        break
    end
end

print("New SCR target is",GlobTarget)


function Calculate_length(a, b)
	local x1 = a.X
	local x2 = b.X
	local y1 = a.Y
	local y2 = b.Y
	local z1 = a.Z
	local z2 = b.Z
	local len = math.sqrt((x2-x1)^2 + (y2-y1)^2 + (z2-z1)^2)
	wait(0.01)
	return len
end


Section:NewTextBox("ScrTarget", "", function(TargTxt)
	GlobTarget = TargTxt
	print("New SCR target is",TargTxt)
	target = game:GetService("Workspace").Living:WaitForChild(GlobTarget)
end)


local GlobTest
Section:NewToggle("Test", "", function(Test)
    GlobTest = Test
    if GlobTest then
        print("ScrPilot is On")
    end
	while GlobTest do
		wait(0.1)
		-- print(coroutine.status(coroutine.running()))
		-- coroutine.suspend(coroutine.running())
		if game:GetService("Workspace").Living:WaitForChild(plr.Name):WaitForChild("StandMorph") then
			print("OK")
			wait(1)
		end
		if not GlobTest then
			print("ScrPilot is Off")
			break
		end
	end
end)


Section:NewToggle("ToggleScrBroProtection", "", function(ScrProt)
    GlobScrProt = ScrProt
    if GlobScrProt then
        print("GlobScrProt is On")
    end
	while GlobScrProt do
		if (not GlobScrProt) then
			print("GlobScrProt is Off")
			break
		end

		wait(0.05)
		if (game:GetService("Workspace").Living:WaitForChild(plr.Name):WaitForChild("StandMorph")) then
		else
			local A_1 = "ToggleStand"
			local A_2 = "Toggle"
			local Event = game:GetService("Workspace").Living:WaitForChild(plr.Name).RemoteFunction
			Event:InvokeServer(A_1, A_2)

			wait(0.5)
			local A_1 = "InputBegan"
			local A_2 = 
			{
				["Input"] = Enum.KeyCode.M
			}
			local Event = game:GetService("Workspace").Living.geniy2271.RemoteEvent
			Event:FireServer(A_1, A_2)

			-- wait(1)
			-- сoroutine.wrap(function(ScrPilot))
			
		end
	end
end)

local DebCount = 0
function Deb(a)
	if a == "br" then
		DebCount = 0
		print("break")
		return
	end
	DebCount = DebCount + 1
	print(DebCount, a)
end


Section:NewToggle("ToggleBro", "", function(ScrPilot)
    GlobScrPilot = ScrPilot
    if GlobScrPilot then
        print("ScrPilot is On")
    end
	Deb("a")
    while GlobScrPilot do
		-- game:GetService("Workspace").Living.geniy2271:WaitForChild("StandMorph"):WaitForChild("IsPiloting")
		if game:GetService("Workspace").Living:WaitForChild(plr.Name):WaitForChild("StandMorph") then
			game:GetService("Workspace").Living:WaitForChild(plr.Name):WaitForChild("StandMorph").PilotSpeed.Value = 65
			humanoid = game:GetService("Workspace").Living:WaitForChild(plr.Name):WaitForChild("StandMorph").AnimationController
			body = game:GetService("Workspace").Living:WaitForChild(plr.Name):WaitForChild("StandMorph").HumanoidRootPart
		end
		destination = game:GetService("Workspace").Living:WaitForChild(GlobTarget).HumanoidRootPart.Position
		Deb("b")
-- vanya2013roblox12324
-- 2storage1321
-- BlackMyxa02

		while Calculate_length(body.Position, destination) < 50 and GlobScrPilot do
			humanoid:MoveTo(game:GetService("Workspace").Living:WaitForChild(GlobTarget).HumanoidRootPart.Position)
			Deb("c")
			if destination.Y - body.Position.Y > 3 then
				Deb("d")
				if game:GetService("Workspace").Living:WaitForChild(plr.Name):WaitForChild("StandMorph") then
					game:GetService("Workspace").Living:WaitForChild(plr.Name):WaitForChild("StandMorph").AnimationController.JumpPower = 
					math.sqrt(2 * game.Workspace.Gravity * (destination.Y - body.Position.Y)) + 50
				end
				humanoid.Jump = true
				Deb("e")
			end
		end

	-- else
		PathfindingService = game:GetService("PathfindingService")
		--path maker
		path = PathfindingService:CreatePath()
		--copute path
		path:ComputeAsync(body.Position, destination)
		-- get waypoints
		waypoints = path:GetWaypoints()
		Deb("f")

		for k, waypoint in pairs(waypoints) do
			humanoid:MoveTo(waypoint.Position)
            
			Deb("g1")
			if waypoint.Position.Y - body.Position.Y > 3 then
				Deb("g2")
				if game:GetService("Workspace").Living:WaitForChild(plr.Name):WaitForChild("StandMorph") then
					Deb("g4")
					game:GetService("Workspace").Living:WaitForChild(plr.Name):FindFirstChild("StandMorph").AnimationController.JumpPower = 
					math.sqrt(2 * game.Workspace.Gravity * (waypoint.Position.Y - body.Position.Y)) + 50
					Deb("g5")
					humanoid.Jump = true
					Deb("g3")
				end
			end
        
			Deb("g")
            
			wait(0.03)
			if k == 100 or (not GlobScrPilot) then
				print(k, "k")
				Deb("h")
				if game:GetService("Workspace").Living:WaitForChild(plr.Name):WaitForChild("StandMorph") then
					game:GetService("Workspace").Living:WaitForChild(plr.Name):WaitForChild("StandMorph").AnimationController.JumpPower = 100
				end
				humanoid.Jump = true
				Deb("h1")
				break
			end
		end
		-- end


		if not GlobScrPilot then
			Deb("i")
			print("ScrPilot is Off")
			break
		end
		Deb("br")
    end
end)

local GlobBottle
Section:NewToggle("Toggle BottleBlood Buy", "", function(Bottle)
    GlobBottle = Bottle
    if GlobBottle then
        print("GlobBottle is On")
    end
    while GlobBottle do
		if (not GlobBottle) then
			print("GlobBottle is Off")
			break
		end
		wait(0.1)
		if BottleCount() < 1 then
			Buybottle()
		end
    end
end)


local GlobHand
Section:NewToggle("Toggle BottleBlood Buy", "", function(Hand)
    GlobHand = Hand
    if GlobHand then
        print("GlobBottle is On")
    end
	game:GetService("Workspace").Living:FindFirstChild(plr.Name):FindFirstChild("LeftUpperArm"):FindFirstChild("LeftShoulderRigAttachment"):Destroy()
	-- local_plr_living.LeftUpperArm:FindFirstChild("LeftElbowRigAttachment"):Destroy()
	game:GetService("Workspace").Living:FindFirstChild(plr.Name):FindFirstChild("LeftUpperArm"):FindFirstChild("LeftShoulderAttachment"):Destroy()
	game:GetService("Workspace").Living:FindFirstChild(plr.Name):FindFirstChild("LeftUpperArm"):FindFirstChild("LeftShoulder"):Destroy()
    while GlobHand do
		game:GetService("Workspace").Living:FindFirstChild(plr.Name):FindFirstChild("LeftUpperArm").Position = Vector3.new(568.227, 0.385881, -22.5314)
		wait(0.1)
		if (not GlobHand) then
			print("GlobHand is Off")
			break
		end
    end
end)


local GlobNight
Section:NewToggle("Toggle AlwaysNight", "", function(Night)
    GlobNight = Night
    if GlobNight then
        print("AlwaysNight is On")
    end
	game.Lighting.TimeOfDay = 0
    while GlobNight do
		game:GetService("Workspace").Living:FindFirstChild(plr.Name):FindFirstChild("LeftUpperArm").Position = Vector3.new(568.227, 0.385881, -22.5314)
		wait(0.1)
		if (not GlobNight) then
			print("AlwaysNight is Off")
			break
		end
    end
end)




function BottleCount()
	local count = 0
	for i,v in pairs(game.Players:WaitForChild(plr.Name):WaitForChild("Backpack"):GetChildren()) do
		if v.Name == "Bottle of Blood" then
			count = count + 1
		end
    end
	return count
end


function Buybottle()
	local A_1 = "EndDialogue"
	local A_2 = 
	{
		["NPC"] = "Alex", 
		["Option"] = "Option1", 
		["Dialogue"] = "Dialogue4"
	}
	local Event = game:GetService("Workspace").Living:WaitForChild(plr.Name).RemoteEvent
	Event:FireServer(A_1, A_2)
end
