local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()

local Window = Library.CreateLib("Name", "RJTheme3") 
local Tab = Window:NewTab("TabName")
local Section = Tab:NewSection("Section Name")
local plr = game:GetService("Players").LocalPlayer
local local_plr_living
local GlobScriptState


Section:NewKeybind("Pilot bind", "M", Enum.KeyCode.M, function()
	wait(0.1)
    if game:GetService("Workspace").Living:FindFirstChild(plr.Name)
		:FindFirstChild("StandMorph"):FindFirstChild("IsPiloting") and GlobScriptState then
        game:GetService("Workspace").Living[plr.Name].StandMorph.IsPiloting.Value = game:GetService("Workspace").Living[plr.Name].StandMorph.IsPiloting.Value + 50
        game:GetService("Workspace").Living[plr.Name].StandMorph.PilotSpeed.Value = 1.5
    end
end)