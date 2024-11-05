local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()

local Window = Library.CreateLib("Name", "RJTheme3") 
local PlayerTab = Window:NewTab("Player")
local NPCTab = Window:NewTab("NPC")
local PilotTab = Window:NewTab("Pilot")
local OtherTab = Window:NewTab("Other")

local MainPlayerSection = PlayerTab:NewSection("Main")
local MainNPCSection = NPCTab:NewSection("Main")
local MainPilotSection = PilotTab:NewSection("Main")
local MainOtherSection = OtherTab:NewSection("Main")


local GlobScriptState

local plr = game:GetService("Players").LocalPlayer

--Auto pose
local PClicked = false
local AutoPoseToggle = false
local corr = 0.3 --Pose duration
local OldHp = 0
local NewHp = 1
local LastRegenTick = tick()

--Always Run
local GlobRunState

--Off_pluck_then_pilot
local GlobPluckPilot

--Always Stand On
local GlobStandOnState

--NPC Controlling
local GlobNPCControlState
local GlobTargetNpcName = "Jotaro Kujo"
local GlobNPCControlState

--Camera Follow
local GlobCameraFollowState
local GlobCamTargetName = "Jotaro Kujo"

function GetPlayer(PName)
    local time_start = tick()
    while (not game:GetService("Workspace").Living:FindFirstChild(PName)) do
        wait(0.0001)
        if tick() - time_start > 100 then
            print("ERROR. NO PLAYER FOUND WITH NICKNAME:", PName)
            return nil
        end
    end
    return game:GetService("Workspace").Living:FindFirstChild(PName)
end


function TickMs()
	return math.floor(((tick() - 1674000000) * 1000)+ 0.5) /1000
end


function ToggleSprinting()
    local A_1 = "ToggleSprinting"
    local Event = GetPlayer(plr.Name).RemoteFunction
    Event:InvokeServer(A_1)
end


function FindItem(IName)
    for i, v in pairs(plr.Backpack:GetChildren()) do
        if v.Name == IName then
            return v
        end
    end

    for i, v in pairs(GetPlayer(plr.Name):GetChildren()) do
        if v.Name == IName then
            return v
        end
    end
    print("\n\n\nERROR. NO ITEM FOUND WITH NAME:", IName)
end


function ToggleStand()
    local A_1 = "ToggleStand"
    local A_2 = "Toggle"
    local Event = GetPlayer(plr.Name).RemoteFunction
    Event:InvokeServer(A_1, A_2)
    wait(0.01)
end


function PClick()
    if PClicked then
		print("\n\n","Posed START! - ",tick())
        local A_2 = 
        {
            ["Input"] = Enum.KeyCode.P
        }
        local Event = GetPlayer(plr.Name).RemoteEvent

        Event:FireServer("InputBegan", A_2)
        wait(0.001)
        Event:FireServer("InputEnded", A_2)

		wait(corr)

		Event:FireServer("InputBegan", A_2)
        wait(0.001)
        Event:FireServer("InputEnded", A_2)

		print("Posed END! - ",tick(),"\n\n")
 
		-- local A_1 = "ToggleRuning"
		-- Event = GetPlayer(plr.Name).RemoteFunction
		-- Event:InvokeServer(A_1)

		wait(1)
        PClicked = false
    end
end


function NPCJump(NPCName)
    while(game:GetService("RunService").RenderStepped:wait() and 
    GlobScriptState and GlobNPCControlState and GlobNPCJumpingState) do
		if GetPlayer(NPCName):WaitForChild("Humanoid") then
			GetPlayer(NPCName):FindFirstChild("Humanoid").JumpPower = 1000
			GetPlayer(NPCName):FindFirstChild("Humanoid").Jump = true
		end

    end
end


function HealthTickDetector()
	while(wait(0.001) and GlobScriptState) do
		if (NewHp > OldHp) and (OldHp ~= GetPlayer(plr.Name):WaitForChild("Health").MaxValue) then
			LastRegenTick = tick()
			if NewHp - OldHp > 2 then 
				print("HYPERHEALED!\n\n")
			end
			print("LastRegenTick =",LastRegenTick)
		end
		OldHp = NewHp
		NewHp = GetPlayer(plr.Name):WaitForChild("Health").Value
	end
end


MainPlayerSection:NewToggle("Toggle script", "", function(ScriptState)
    GlobScriptState = ScriptState
    if GlobScriptState then
        print("GlobScriptState is", GlobScriptState)
        HealthTickDetector()
    end


    if not GlobScriptState then
        print("GlobScriptState is", GlobScriptState)
    end
end)


MainPlayerSection:NewToggle("Always Run", "", function(RunState)
    GlobRunState = RunState
    if GlobRunState then
        print("GlobRunState is", GlobRunState)
    end

    while(wait(0.001) and GlobScriptState and GlobRunState) do
        if GetPlayer(plr.Name):WaitForChild("Humanoid").WalkSpeed == 16 then
            ToggleSprinting()
		end
	end

    if not GlobRunState then
        print("GlobRunState is", GlobRunState) 
    end
end)


MainPlayerSection:NewKeybind("AutoPose bind", "L", Enum.KeyCode.L, function()
	AutoPoseToggle = not AutoPoseToggle
    while GlobScriptState and AutoPoseToggle do
		wait(0.001)
        if (not PClicked) and GetPlayer(plr.Name):WaitForChild("Health").Value <
		GetPlayer(plr.Name):WaitForChild("Health").MaxValue then
            PClicked = true
			-- print("IN Function", PClicked)
            if tick() - LastRegenTick < 1 - (corr/2) then
				print("waiting 1 = ",1 - (corr/2) - (tick() - LastRegenTick))
                wait(1 - (corr/2) - (tick() - LastRegenTick))
			else
				print("waiting 2 = ", 0.7)
				wait(0.7)
            end
            PClick()
        end
    end
end)


MainPlayerSection:NewToggle("Always Stando On", "", function(StandOnState)
    GlobStandOnState = StandOnState
    if GlobRunState then
        print("GlobStandOnState is", GlobStandOnState)
    end

    while(wait(0.001) and GlobScriptState and GlobStandOnState) do
        if GetPlayer(plr.Name):FindFirstChild("StandMorph") == nil then
            ToggleStand()
		end
	end

    if not GlobStandOnState then
        print("GlobStandOnState is", GlobStandOnState) 
    end
end)


MainPlayerSection:NewTextBox("Camera Follow Target", "Jotaro Kujo as default", function(CamTargetName)
    GlobCamTargetName = CamTargetName
	print("New Target Npc Name is:", GlobCamTargetName)
end)


MainPlayerSection:NewToggle("Camera Follow On", "", function(CameraFollowState)
    GlobCameraFollowState = CameraFollowState
    if GlobCameraFollowState then
        print("GlobStandOnState is", GlobCameraFollowState)
    end

    while(game:GetService("RunService").RenderStepped:wait() and GlobScriptState and GlobCameraFollowState) do
        game:GetService("Workspace").Camera.CameraSubject = GetPlayer(GlobCamTargetName).Humanoid
	end

    if not GlobCameraFollowState or not GlobScriptState then
        game:GetService("Workspace").Camera.CameraSubject = GetPlayer(plr.Name).Humanoid
        print("GlobCameraFollowState is", GlobCameraFollowState) 
    end
end)


MainPilotSection:NewToggle("Off_pluck_then_pilot", "", function(PluckPilot)
    GlobPluckPilot = PluckPilot
    if GlobPluckPilot then
        print("PluckPilot is", GlobPluckPilot)
    end

    while(wait(0.001) and GlobScriptState and GlobPluckPilot) do
        
	end

    if not GlobPluckPilot then
        print("GlobPluckPilot is", GlobPluckPilot) 
    end
end)


MainPilotSection:NewKeybind("Pilot bind", "M", Enum.KeyCode.M, function() --HGhamon
	wait(0.1)
    if game:GetService("Workspace").Living:FindFirstChild(plr.Name)
		:FindFirstChild("StandMorph"):FindFirstChild("IsPiloting") and GlobScriptState then
        game:GetService("Workspace").Living[plr.Name].StandMorph.IsPiloting.Value = 120
        game:GetService("Workspace").Living[plr.Name].StandMorph.PilotSpeed.Value = 2.5
    end

    if GlobPluckPilot and GlobScriptState then
        if game:GetService("Workspace").Living:FindFirstChild(plr.Name)
		:FindFirstChild("StandMorph"):FindFirstChild("IsPiloting") then
            FindItem("Pluck").Parent = plr.Backpack
        else
            FindItem("Pluck").Parent = GetPlayer(plr.Name)
        end
    end
end)


MainNPCSection:NewToggle("Toggle NPC Control", "", function(NPCControlState)
    GlobNPCControlState = NPCControlState
    if GlobNPCControlState then
        print("GlobNPCControlState is On")
    end

    if not GlobNPCControlState then
        print("GlobNPCControlState is Off")
    end
end)


MainNPCSection:NewTextBox("Target Npc Name", "Jotaro Kujo as default", function(TargetNpcName)
    GlobTargetNpcName = TargetNpcName
	print("New Target Npc Name is:", NpcName)
end)


MainNPCSection:NewToggle("Toggle NPC Jumping", "", function(NPCJumpingState)
    GlobNPCJumpingState = NPCJumpingState
    if GlobNPCJumpingState then
        print("GlobNPCJumpingState is On")
        NPCJump(GlobTargetNpcName)
    end

    if not GlobNPCJumpingState then
        print("GlobNPCJumpingState is Off")
    end
end)


MainOtherSection:NewButton("Dark Dex Activate", "", function()
    print("Dark Dex Activated!")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/BypassedDarkDexV3.lua", true))()
end)


MainOtherSection:NewButton("Bitch Boy Activate", "", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/zakater5/LuaRepo/main/YBA/v3.lua"))()
end)
