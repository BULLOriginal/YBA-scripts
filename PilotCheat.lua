local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()

local Window = Library.CreateLib("Name", "RJTheme3") 
local Tab = Window:NewTab("TabName")
local Section = Tab:NewSection("Section Name")
local plr = game:GetService("Players").LocalPlayer
local local_plr_living
local GlobPilotTpState
local GlobKeyT = false
local GlobTpCd1 = 0.65
local GlobTpCd2 = 0
for i,v in pairs(game:GetService("Workspace").Living:GetChildren()) do
    if v.Name == plr.Name then
        local_plr_living = v --local name obtain
        break
    end
end


-- Текст Бокс
Section:NewTextBox("TestTpCd", "", function(TpCd)
    GlobTpCd1 = TpCd
end)

Section:NewTextBox("TestTpCd2", "", function(TpCd2)
    GlobTpCd2 = TpCd2
end)

Section:NewToggle("Toggle teleport", "", function(PilotTpState)
    GlobPilotTpState = PilotTpState
    if GlobPilotTpState then
        print("GlobPilotTpState is On")
    end
    local_plr_living:WaitForChild("StandMorph")
    local_plr_living.StandMorph:WaitForChild("IsPiloting")
	local_plr_living.StandMorph.IsPiloting.Value = 10000
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
		local_plr_living.StandMorph.IsPiloting.Value = 10000

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

-- Бинд на клавиши
Section:NewKeybind("Tp bind", "T", Enum.KeyCode.T, function()
	GlobKeyT = true
	wait(1)
	GlobKeyT = false
end)