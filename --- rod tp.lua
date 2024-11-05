--- rod tp

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local AverageFps = game:GetService("Stats"):WaitForChild("FrameRateManager"):WaitForChild("AverageFPS")
local UserInputService = game:GetService("UserInputService")
local ContextActionService = game:GetService("ContextActionService")
local Workspace = game:GetService("Workspace")
local Stats = game:GetService("Stats")

local living = Workspace.Living
local plr = Players.LocalPlayer
local plrCharacter = plr.Character
local IYMouse = plr:GetMouse()
local camera = Workspace.CurrentCamera


local Connection
local RodConnect
RunService:BindToRenderStep("SimulationRadiusConnection", 1, function ()
    sethiddenproperty(plr, "SimulationRadius", math.huge)
    print("Binded")
end)



Connection = workspace.ChildAdded:Connect(function(Child)
    if Child.Name == "StandMorph" then
        print("Rod throw")

        if (plrCharacter.HumanoidRootPart.Position - Child:WaitForChild("Handle",10).Position).Magnitude < 200 then
            local vel = Child.Handle:WaitForChild("BodyVelocity",10)
            local val = vel.Velocity * 5
            if not RodConnect then
                RodConnect = RunService.Stepped:Connect(function ()
                    if not Child then
                        RodConnect:Disconnect()
                        RodConnect = nil
                    end
                    vel.Velocity = val
                end)
            end
            -- local RodPos = Instance.new("BodyPosition")
            -- RodPos.Parent = Child.Handle
            -- RodPos.Position = plrCharacter.HumanoidRootPart.Position
        end
    end
end)

print("script ACTIV")
local ScriptConnection
ScriptConnection = UserInputService.InputBegan:Connect(function (input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.K and not gameProcessed then
        
        RunService:UnbindFromRenderStep("SimulationRadiusConnection")

        if RodConnect then
            RodConnect:Disconnect()
            RodConnect = nil
        end

        print("Скрипт выключен")
        if Connection then
            Connection:Disconnect()
            Connection = nil
        end

        if ScriptConnection then
            ScriptConnection:Disconnect()
            ScriptConnection = nil
        end
    end
end)