local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()

local Window = Library.CreateLib("Name", "RJTheme3") 
local Tab = Window:NewTab("TabName")
local Section = Tab:NewSection("Section Name")
local plr = game:GetService("Players").LocalPlayer

local GlobTest
TestSection:NewToggle("Test", "", function(Test)
    GlobTest = Test
    if GlobTest then
        print("ScrPilot is On")
    end
	while GlobTest do
		wait(0.01)
		for i, v in pairs(game:GetService("Workspace").Living:WaitForChild(plr.Name):GetDescendants()) do
            if v.Name == "OriginalSize" then
                v:Destroy()
            end
        end
		if not GlobTest then
			print("ScrPilot is Off")
			break
		end
	end
end)