local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()

local Window = Library.CreateLib("Name", "RJTheme3") 
local Tab = Window:NewTab("TabName")
local Section = Tab:NewSection("Section Name")
local plr = game:GetService("Players").LocalPlayer
local local_plr_living
local GlobPilotTpState
local GlobKeyT = false
for i,v in pairs(game:GetService("Workspace").Living:GetChildren()) do
    if v.Name == plr.Name then
        local_plr_living = v --local name obtain
        break
    end
end
local GlobGuardOwner = "bowjvaleriy"
local GlobAgressiveMode = false


while true do ---Toggle agressive: pick Jotaro disc
    if GlobGuardOwner:WaitForChild("Jotaro's Disc") then
        GlobAgressiveMode = not GlobAgressiveMode
        wait(5)
    end
end


Section:NewToggle("Toggle teleport", "", function(PilotTpState)
    GlobPilotTpState = PilotTpState
    if GlobPilotTpState then
        print("GlobPilotTpState is On")
    end
    local_plr_living:WaitForChild("StandMorph")
    local_plr_living.StandMorph:WaitForChild("IsPiloting")
	local_plr_living.StandMorph.IsPiloting.Value = 50000
    while GlobPilotTpState do

        while not GlobKeyT and GlobPilotTpState do
            wait(0.001)
        end

        if not GlobPilotTpState then
            print("GlobPilotTpState is Off")
            break
        end


		local_plr_living:WaitForChild("StandMorph")
		local_plr_living.StandMorph:WaitForChild("IsPiloting")
		local_plr_living.StandMorph.IsPiloting.Value = 50000

        wait(GlobTpCd1)
        temp = local_plr_living.StandMorph.HumanoidRootPart.PilotBodyPosition.Position
		tempC = local_plr_living.StandMorph.HumanoidRootPart.CFrame

        local_plr_living.StandMorph.HumanoidRootPart.PilotBodyPosition.Position = 
        game:GetService("Workspace").Living.Thug.UpperTorso.Position
		local_plr_living.StandMorph.HumanoidRootPart.CFrame = 
        game:GetService("Workspace").Living.Thug.UpperTorso.CFrame
        wait(GlobTpCd2)
		game:GetService("RunService").RenderStepped:wait() 
        local_plr_living.StandMorph.HumanoidRootPart.PilotBodyPosition.Position = temp
		local_plr_living.StandMorph.HumanoidRootPart.CFrame = tempC
		GlobKeyT = false
    end
end)


function closest_player()

end


function teleport_pilot_to_me(spell)
    if GlobPilotTpState then

		local A_1 = "InputBegan"
        local A_2 = spell
        local Event = local_plr_living.RemoteEvent

        local temp = local_plr_living.StandMorph.HumanoidRootPart.PilotBodyPosition.Position
        local tempC = local_plr_living.StandMorph.HumanoidRootPart.CFrame

        local_plr_living.StandMorph.HumanoidRootPart.PilotBodyPosition.Position = 
        local_plr_living.UpperTorso.Position
        local_plr_living.StandMorph.HumanoidRootPart.CFrame = 
        local_plr_living.UpperTorso.CFrame
		Event:FireServer(A_1, A_2)
		wait(0.05)
		game:GetService("RunService").RenderStepped:wait()
		game:GetService("RunService").RenderStepped:wait()

        Event:FireServer(A_1, A_2)

        game:GetService("RunService").RenderStepped:wait()
		game:GetService("RunService").RenderStepped:wait()
		Event:FireServer(A_1, A_2)
        local_plr_living.StandMorph.HumanoidRootPart.PilotBodyPosition.Position = temp
        local_plr_living.StandMorph.HumanoidRootPart.CFrame = tempC
		game:GetService("RunService").RenderStepped:wait()
		wait(0.6)
		Event:FireServer("InputEnded", {["Input"] = Enum.KeyCode.Y})

    end
end

-- Текст Бокс
Section:NewTextBox("SelectOwner", "", function(GuardOwner)
    for i,v in pairs(game:GetService("Workspace").Living:GetChildren()) do
        if v.Name == GuardOwner then
            GlobGuardOwner = v
            break
        end
    end
    
end)