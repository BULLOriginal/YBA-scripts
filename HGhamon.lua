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

Section:NewToggle("Toggle script", "", function(PilotTpState)
    GlobScriptState = PilotTpState
    if GlobScriptState then
        print("GlobScriptState is On")
        coroutine.resume(co)
        -- coroutine.resume(AlifeTest)
    end


    if not GlobScriptState then
        print("GlobScriptState is Off")
        coroutine.yield(co)
        -- coroutine.yield(AlifeTest)
    end
end)


-- AlifeTest = coroutine.create(function(player)
--     if local_plr_living.Health.Value == 0 then
--         coroutine.yield(co)
--         print("dead")
--         wait(10)
--         print("alife")
--         coroutine.resume(co)
--     end
-- end)


co = coroutine.create(function()
    while(wait(0.001)) do
        local ClosestPlayer = GlobClosestPlayer
        for i,v in pairs(game:GetService("Players"):GetChildren()) do
            if ClosestPlayer == nil then
                ClosestPlayer = v
                GlobClosestPlayer = v
            end
            if FindDistance(v) < FindDistance(ClosestPlayer) and FindDistance(v) < 10 then
                ClosestPlayer = v
            end
        end
        GlobClosestPlayer = ClosestPlayer
    end
end)





Section:NewKeybind("Tp bind", "T", Enum.KeyCode.T, function()
	-- GlobKeyT = true
	if GlobScriptState then
		wait(0.5)
		if FindDistance(GlobClosestPlayer) < 10 then
			TeleportStand(player)
			wait(1)
		end
		-- GlobKeyT = false
		end
end)


Section:NewKeybind("Pilot bind", "M", Enum.KeyCode.M, function()
	wait(0.1)
    if game:GetService("Workspace").Living:FindFirstChild(plr.Name)
		:FindFirstChild("StandMorph"):FindFirstChild("IsPiloting") and GlobScriptState then
        game:GetService("Workspace").Living[plr.Name].StandMorph.IsPiloting.Value = 120
        game:GetService("Workspace").Living[plr.Name].StandMorph.PilotSpeed.Value = 2.5
    end
end)


local successed, FindDistance = xpcall(function(player)
    while not game:GetService("Workspace").Living:FindFirstChild(plr.Name):FindFirstChild("StandMorph") do
        wait(0.01)
    end
    return (game:GetService("Workspace").Living:FindFirstChild(plr.Name):FindFirstChild("StandMorph"):FindFirstChild("HumanoidRootPart").Position
        - game:GetService("Workspace").Living:FindFirstChild(player.Name):FindFirstChild("UpperTorso").Position).magnitude
end, function()
    return FindDistance(player)
end)


local successed, TeleportStand = xpcall(function(player)
    temp = game:GetService("Workspace").Living:FindFirstChild(plr.Name).StandMorph.HumanoidRootPart.PilotBodyPosition.Position
    tempC = game:GetService("Workspace").Living:FindFirstChild(plr.Name).StandMorph.HumanoidRootPart.CFrame

    game:GetService("Workspace").Living:FindFirstChild(plr.Name).StandMorph.HumanoidRootPart.PilotBodyPosition.Position = 
    game:GetService("Workspace").Living:FindFirstChild(player.Name).UpperTorso.Position
    game:GetService("Workspace").Living:FindFirstChild(plr.Name).StandMorph.HumanoidRootPart.CFrame = 
    game:GetService("Workspace").Living:FindFirstChild(player.Name).UpperTorso.CFrame
    wait(0)
    game:GetService("RunService").RenderStepped:wait() 
    game:GetService("Workspace").Living:FindFirstChild(plr.Name).StandMorph.HumanoidRootPart.PilotBodyPosition.Position = temp
    game:GetService("Workspace").Living:FindFirstChild(plr.Name).StandMorph.HumanoidRootPart.CFrame = tempC
    GlobKeyT = false
end, function()
    return TeleportStand(player)
end)

