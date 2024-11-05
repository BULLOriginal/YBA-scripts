----fps cap---
setfpscap(60)
if not game:IsLoaded() then game.Loaded:Wait() end

local uis = game:GetService("UserInputService")
local size = workspace.CurrentCamera.ViewportSize

local a = Drawing.new("Text")
a.Visible = true
a.Size = 16
a.Color = Color3.fromRGB(0, 255, 255)
a.Text = "Maximized"
a.Font = Drawing.Fonts.Plex
a.Outline = true
a.OutlineColor = Color3.new(.1,.1,.1)
a.Position = Vector2.new((size.X - a.TextBounds.X) - 10, (size.Y - a.TextBounds.Y) - 25)

local b = Drawing.new("Text")
b.Visible = true
b.Size = 16
b.Color = Color3.fromRGB(0, 255, 0)
b.Text = "Cap: 60"
b.Font = Drawing.Fonts.Plex
b.Outline = true
b.OutlineColor = Color3.new(.1,.1,.1)
b.Position = Vector2.new((size.X - b.TextBounds.X) - 10, (size.Y - b.TextBounds.Y) - 10)

uis.WindowFocused:Connect(function() 
    setfpscap(60)
    a.Text = "Maximized"
    b.Text = "Cap: 60"
end)

uis.WindowFocusReleased:Connect(function() 
    setfpscap(10)
    a.Text = "Minimized"
    b.Text = "Cap: 10"
end)
--fps cap END---


---main program START---
---funcs---
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()

local Window = Library.CreateLib("Name", "RJTheme3") 
local PlayerTab = Window:NewTab("Player")
local MainPlayerSection = PlayerTab:NewSection("Main")


local GlobScriptState

local plr = game:GetService("Players").LocalPlayer

local GlobBotsTarget = "Dio"

local GlobBotState = true
local GlobRunState

function GetPlayer(PName)
    local time_start = tick()
    while (not game:GetService("Workspace").Living:FindFirstChild(PName)) do
        wait(0.0001)
        if tick() - time_start > 100 then
            print("ERROR. NO PLAYER FOUND WITH NICKNAME:", PName)
            return game:GetService("Workspace").Living:FindFirstChild("Diavolo")
        end
    end
    return game:GetService("Workspace").Living:FindFirstChild(PName)
end

function TickMs()
	return math.floor(((tick() - 1674000000) * 1000)+ 0.5) /1000
end

function ToggleSprinting()
    local A_1 = "ToggleSprinting"
    local Event = GetPlayer(plr.Name).RemoteFunction
    Event:InvokeServer(A_1)
end

function ToggleStand()
    local A_1 = "ToggleStand"
    local A_2 = "Toggle"
    local Event = GetPlayer(plr.Name).RemoteFunction
    Event:InvokeServer(A_1, A_2)
    wait(0.01)
end


function Punch()
    local A_1 = "Attack"
    local A_2 = "m1"
    local Event = GetPlayer(plr.Name).RemoteEvent
    Event:FireServer(A_1, A_2)
end


function InRange(length, range)
    if length < range then
        return true
    else
        return false
    end
end

function CheckFriends()
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
---UI---
-- local GlobRunState = true
-- MainPlayerSection:NewToggle("Always Run", "", function(RunState)
--     GlobRunState = RunState
--     if GlobRunState then
--         print("GlobRunState is", GlobRunState)
--     end

--     if not GlobRunState then
--         print("GlobRunState is", GlobRunState) 
--     end
-- end)

-- GetPlayer(plr.Name)["Humanoid"]:GetPropertyChangedSignal('WalkSpeed'):Connect(function()
-- 	wait(0.1)
--     if GetPlayer(plr.Name)["Humanoid"].WalkSpeed == 16 and GlobRunState then
--         ToggleSprinting()
--     end
-- end)


MainPlayerSection:NewToggle("Always Run", "", function(RunState)
    GlobRunState = RunState
    if GlobRunState then
        print("GlobRunState is", GlobRunState)
    end

    while(wait(0.05) and GlobRunState) do
        if GetPlayer(plr.Name):WaitForChild("Humanoid").WalkSpeed == 16 then
            ToggleSprinting()
			wait(0.1)
		end
	end

    if not GlobRunState then
        print("GlobRunState is", GlobRunState) 
    end
end)


local GlobJumpState = true
MainPlayerSection:NewToggle("Always Jump", "", function(JumpState)
    GlobJumpState = JumpState
    if GlobJumpState then
        print("GlobJumpState is", GlobJumpState)
    end

    if not GlobJumpState then
        print("GlobJumpState is", GlobJumpState) 
    end

	while(GlobJumpState) do
		GetPlayer(plr.Name).Humanoid.JumpPower = 50
		GetPlayer(plr.Name).Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		wait(0.1)
		GetPlayer(plr.Name).Humanoid.JumpPower = 0
        wait(1)
        GetPlayer(plr.Name).Humanoid.JumpPower = 50
		GetPlayer(plr.Name).Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		wait(0.1)
		GetPlayer(plr.Name).Humanoid.JumpPower = 0
        wait(1)
        GetPlayer(plr.Name).Humanoid.JumpPower = 50
		GetPlayer(plr.Name).Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		wait(0.1)
		GetPlayer(plr.Name).Humanoid.JumpPower = 0
        wait(5)
	end
end)


local GlobKickState = true
MainPlayerSection:NewToggle("Kick Toggle", "", function(KickState)
    GlobKickState = KickState
    if GlobKickState then
        print("GlobKickState is", GlobKickState)
    end

    if not GlobJumpState then
        print("GlobKickState is", GlobKickState) 
    end

	while(GlobKickState) do
        wait(0.2)
        if InRange(Calculate_length(GetPlayer(GlobBotsTarget).HumanoidRootPart.Position,
        GetPlayer(plr.Name).HumanoidRootPart.Position), 5) then
            Punch()
            wait(0.2)
        end
	end
end)


MainPlayerSection:NewTextBox("Bots Target", "Diavolo as default", function(BotsTarget)
    GlobBotsTarget = BotsTarget
	print("New GlobBotsTarget is:", GlobBotsTarget)
end)


MainPlayerSection:NewToggle("Bot activated", "", function(BotState)
    GlobBotState = BotState
    if GlobBotState then
        print("GlobBotState is", GlobBotState)
    end

    if not GlobBotState then
        print("GlobBotState is", GlobBotState) 
    end
    
    
    
    while GlobBotState do
		local player = GetPlayer(plr.Name).HumanoidRootPart
		local TargetRoot = GetPlayer(GlobBotsTarget).HumanoidRootPart
		-- не работает
        local PathfindingService = game:GetService("PathfindingService")
        local humanoid = GetPlayer(plr.Name).Humanoid
		--path maker
		local path = PathfindingService:CreatePath({
            AgentRadius = 7,
            AgentHeight = 5,
            AgentCanJump = true
        })
		--copute path
		path:ComputeAsync(player.Position, TargetRoot.Position)
		-- get waypoints
		local waypoints = path:GetWaypoints()
		for k, waypoint in pairs(waypoints) do

            if InRange(Calculate_length(GetPlayer(GlobBotsTarget).HumanoidRootPart.Position,
            GetPlayer(plr.Name).HumanoidRootPart.Position), 50) then
                humanoid:MoveTo(GetPlayer(GlobBotsTarget).HumanoidRootPart.Position)
                wait(0.1)
            else
			    humanoid:MoveTo(waypoint.Position)
                wait(0.14)
            end
            
            if k == 100 or (not GlobBotState) then
				print(k, "k")
				break
			end
        end

        end
    end)
end


---main---