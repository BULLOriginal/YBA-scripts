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

local local_plr_living 
local plr = game:GetService("Players").LocalPlayer
local_plr_living = game:GetService("Workspace").Living:FindFirstChild(plr.Name)


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
TestSection:NewToggle("Test", "", function(Test)
    GlobTest = Test
    if GlobTest then
        print("ScrPilot is On")
    end
	while GlobTest do
		wait(0.1)
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
