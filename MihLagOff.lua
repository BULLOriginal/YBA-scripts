local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()

local Window = Library.CreateLib("Name", "RJTheme3") 
local Tab = Window:NewTab("TabName")
local Section = Tab:NewSection("Section Name")
local plr = game:GetService("Players").LocalPlayer
local local_plr_living
local GlobLaggs
for i,v in pairs(game:GetService("Workspace").Living:GetChildren()) do
    if v.Name == plr.Name then
        local_plr_living = v --local name obtain
        print("your name is", local_plr_living.Name)
        break
    end
end


Section:NewToggle("Delete laggs on", "", function(Laggs)
    GlobLaggs = Laggs
    if GlobLaggs then
        print("GlobPilotTpState is On")
    end
     
    while GlobLaggs do
        wait(0.1)
        if local_plr_living.Name == "geniy2271" then
            if game:GetService("Workspace").Living.geniy2271:FindFirstChild("LeftUpperArm") then
                game:GetService("Workspace").Living.geniy2271.LeftUpperArm.Parent = 
                game:GetService("Workspace").Living.geniy2271.StandMorph
            end
            if game:GetService("Workspace").Living.geniy2271:FindFirstChild("LeftLowerArm") then
                game:GetService("Workspace").Living.geniy2271.LeftLowerArm.Parent = 
                game:GetService("Workspace").Living.geniy2271.StandMorph
            end
            if game:GetService("Workspace").Living.geniy2271:FindFirstChild("LeftHand") then
                game:GetService("Workspace").Living.geniy2271.LeftHand.Parent = 
                game:GetService("Workspace").Living.geniy2271.StandMorph
            end

        else
            if game:GetService("Workspace").Living.geniy2271:FindFirstChild("LeftUpperArm") then
                game:GetService("Workspace").Living.geniy2271.LeftUpperArm:Destroy()
            end
            if game:GetService("Workspace").Living.geniy2271:FindFirstChild("LeftLowerArm") then
                game:GetService("Workspace").Living.geniy2271.LeftLowerArm:Destroy()
            end
            if game:GetService("Workspace").Living.geniy2271:FindFirstChild("LeftHand") then
                game:GetService("Workspace").Living.geniy2271.LeftHand:Destroy()
            end
        end


        if not GlobLaggs then
            print("GlobPilotTpState is Off")
            break
        end
    end
end)