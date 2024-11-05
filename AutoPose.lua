local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()

local Window = Library.CreateLib("Name", "RJTheme3") 
local Tab = Window:NewTab("TabName")
local Section = Tab:NewSection("Section Name")
local GlobScriptState

local plr = game:GetService("Players").LocalPlayer

local HealthTick = false
local PClicked = false
local AutoPoseToggle = false
local corr = 0.3

local OldHp = 0
local NewHp = 1
local LastRegenTick = tick()
-- local TimeBetweenTicksSum = 1
-- local TicksCounter = 0
-- local AvgTimeBetweenTicks

Section:NewToggle("Toggle script", "", function(ScriptState)
    GlobScriptState = ScriptState
    if GlobScriptState then
        print("GlobScriptState is", GlobScriptState)
        coroutine.resume(HealthTickDetector)
    end


    if not GlobScriptState then
        print("GlobScriptState is", GlobScriptState)
        -- coroutine.yield(HealthTickDetector)
    end
end)


HealthTickDetector = coroutine.create(function()
	while(wait(0.001) and GlobScriptState) do
		if (NewHp > OldHp) and (OldHp ~= GetPlayer(plr.Name):WaitForChild("Health").MaxValue) then
			LastRegenTick = tick()
			if NewHp - OldHp > 2 then 
				print("HYPERHEALED!\n\n")
			end
			print("LastRegenTick =",LastRegenTick)
		end
		OldHp = NewHp
		NewHp = GetPlayer(plr.Name):WaitForChild("Health").Value
		
	end
end)


function GetPlayer(PName)
    while (not game:GetService("Workspace").Living:
    FindFirstChild(PName)) do
        wait(0.0001)
    end
    return game:GetService("Workspace").Living:
    FindFirstChild(PName)
end


Section:NewKeybind("Tp bind", "L", Enum.KeyCode.L, function()
	AutoPoseToggle = not AutoPoseToggle
    while GlobScriptState and GetPlayer(plr.Name):WaitForChild("Health").Value <
	GetPlayer(plr.Name):WaitForChild("Health").MaxValue and AutoPoseToggle do
		wait(0.001)
        if (not PClicked) then
            PClicked = true
			-- print("IN Function", PClicked)
            if tick() - LastRegenTick < 1 - (corr/2) then
				print("waiting 1 = ",1 - (corr/2) - (tick() - LastRegenTick))
                wait(1 - (corr/2) - (tick() - LastRegenTick))
			else
				print("waiting 2 = ", 0.7)
				wait(0.7)
            end
            PClick()
        end
    end
end)


function PClick()
    if PClicked then
		print("\n\n","Posed START! - ",tick())
        local A_2 = 
        {
            ["Input"] = Enum.KeyCode.P
        }
        local Event = GetPlayer(plr.Name).RemoteEvent

        Event:FireServer("InputBegan", A_2)
        wait(0.001)
        Event:FireServer("InputEnded", A_2)

		wait(corr)

		Event:FireServer("InputBegan", A_2)
        wait(0.001)
        Event:FireServer("InputEnded", A_2)

		print("Posed END! - ",tick(),"\n\n")
 
		local A_1 = "ToggleSprinting"
		Event = GetPlayer(plr.Name).RemoteFunction
		Event:InvokeServer(A_1)

		wait(1)
        PClicked = false
    end
end


function TickMs()
	return math.floor(((tick() - 1674000000) * 1000)+ 0.5) /1000
end