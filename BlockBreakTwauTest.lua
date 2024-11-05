local Bow = game:GetService("Workspace").Living.bowjvaleriy
local Me = game:GetService("Workspace").Living[game.Players.LocalPlayer.Name]
local EventSignal

getgenv().Script_Toggle = false
wait(0.5)
getgenv().Script_Toggle = true


function Gun_shot()
    keypress(0x54)
    wait(0.01)
    keyrelease(0x54) 
end

local function EventListenerBB()
    local val = Event["Blocking_Capacity"].Value
	if val ~= 0 then
    	print("Blocked")
    	print(val, "block value")
    	Gun_shot()
    else
    	print("Unblocked")
    	print(val, "block value")
    end
end

local EventSignalBB = Event["Blocking_Capacity"]:GetPropertyChangedSignal("Value"):Connect(EventListenerBB)

spawn(function()
	while(wait(0.5))
		if getgenv().Script_Toggle == true then
			EventSignalP:Disconnect()
			EventSignalBB:Disconnect()
			EventSignalVel:Disconnect()
			BulbSignal:Disconnect()
			print("------SCRIPT ENDED--------")
			return
		end
	end
end)


