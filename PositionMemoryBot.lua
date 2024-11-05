local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()

local Window = Library.CreateLib("Name", "RJTheme3") 
local Tab = Window:NewTab("Main")
local Section = Tab:NewSection("Main Section")
local TestSection = Tab:NewSection("Test Section")
local GlobScrPilot
local humanoid
local body
local destination
local PathfindingService
local path
local waypoints
local target
local GlobTarget = "Diavolo"
local mass = {}

local local_plr_living 
local plr = game:GetService("Players").LocalPlayer
local_plr_living = game:GetService("Workspace").Living:FindFirstChild(plr.Name)


Section:NewToggle("ToggleScrBroProtection", "", function(ScrProt)
    GlobScrProt = ScrProt
    if GlobScrProt then
        print("GlobScrProt is On")
    end
    humanoid = game:GetService("Workspace").Living:WaitForChild(plr.Name):WaitForChild("StandMorph").AnimationController
    body = game:GetService("Workspace").Living:WaitForChild(plr.Name):WaitForChild("StandMorph").HumanoidRootPart
	while GlobScrProt do
		if (not GlobScrProt) then
			print("GlobScrProt is Off")
			break
		end
        while (#mass ~= 100) do
            mass[#mass+1] = game:GetService("Workspace").Living:WaitForChild(plr.Name).HumanoidRootPart.Position
            print(mass[#mass], #mass)
			wait(0.1)
        end
        humanoid:MoveTo(mass[1])
		table.remove(mass, 1)
        wait(0.2)
	end
end)