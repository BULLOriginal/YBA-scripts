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


Section:NewToggle("Toggle teleport", "", function(PilotTpState)
    local_plr_living:WaitForChild("StandMorph")
    local_plr_living.StandMorph.LowerTorso.Root:Destroy()
    for i,v in pairs(local_plr_living:GetDescendants()) do
        if v.Name == "StandAura" then
            v:Destroy()
        end
    end
    local esp = Instance.new("BoxHandleAdornment", local_plr_living.StandMorph.HumanoidRootPart)
    esp.Adornee = local_plr_living.StandMorph.HumanoidRootPart
    esp.Size = Vector3.new(4, 5, 1)
    esp.Transparency = 0.65
    
    GlobPilotTpState = PilotTpState
    if GlobPilotTpState then
        print("GlobPilotTpState is On")
    end

    while GlobPilotTpState do
        local_plr_living.StandMorph:WaitForChild("IsPiloting")
        local_plr_living.StandMorph.IsPiloting.Value = 10000
		local_plr_living.StandMorph.PilotSpeed.Value = 3
        game:GetService("RunService").RenderStepped:wait()
        if not GlobPilotTpState then
            print("GlobPilotTpState is Off")
            break
        end
    end
end)



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


Section:NewKeybind("Tp bind", "T", Enum.KeyCode.X, function()
    teleport_pilot_to_me({["Input"] = Enum.KeyCode.T})

end)


Section:NewKeybind("Tp bind", "Y", Enum.KeyCode.C, function()
    teleport_pilot_to_me({["Input"] = Enum.KeyCode.Y})
end)

Section:NewKeybind("Tp bind", "Z", Enum.KeyCode.V, function()
    teleport_pilot_to_me({["Input"] = Enum.KeyCode.Z})
end)


Section:NewKeybind("Tp bind", "E", Enum.KeyCode.E, function()
    teleport_pilot_to_me({["Input"] = Enum.KeyCode.E})
end)
