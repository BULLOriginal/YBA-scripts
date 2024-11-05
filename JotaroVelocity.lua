local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()

local Window = Library.CreateLib("Name", "RJTheme3") 
local Tab = Window:NewTab("TabName")
local Section = Tab:NewSection("Section Name")
local plr = game:GetService("Players").LocalPlayer
local local_plr_living
local GlobScriptState
-- local GlobKeyT = false

local local_plr_living = game:GetService("Workspace").Living:FindFirstChild(plr.Name) --local name obtain
local GlobClosestPlayer = plr


local victim
local vectorTo

local part

Section:NewToggle("Toggle script", "", function(PilotTpState)
    GlobScriptState = PilotTpState
    if GlobScriptState then
        print("GlobScriptState is On")
        coroutine.resume(co)
    end


    if not GlobScriptState then
        print("GlobScriptState is Off")
        coroutine.yield(co)
    end
end)


co = coroutine.create(function()
    while(game:GetService("RunService").RenderStepped:wait() and GlobScriptState) do
		if game:GetService("Workspace").Living:WaitForChild("Jotaro Kujo"):WaitForChild("Humanoid") and 
        (not game:GetService("Workspace"):FindFirstChild("Living"):FindFirstChild("Jotaro Kujo"):FindFirstChild("HumanoidRootPart"):FindFirstChild("BodyForce")) then
			local humanoid = game:GetService("Workspace"):FindFirstChild("Living"):FindFirstChild("Jotaro Kujo"):FindFirstChild("HumanoidRootPart")
			humanoid:WaitForChild("RotateVictim"):Destroy()

            local victim = game:GetService("Workspace").Living:WaitForChild("Dummy"):WaitForChild("HumanoidRootPart")
            local vectorTo = victim.Position - humanoid.Position

			local part = Instance.new("BodyForce", humanoid)
			wait(0.1)
        else
			part.Force = vectorTo * 100
		end
		

    end
end)
-- :WaitForChild("StandMorph") PilotBodyPosition