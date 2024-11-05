--- IsAbilityFromStand
--- impale dist
local ScriptOffKey          = "L"
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
--------------------------
local plr = Players.LocalPlayer
local plrCharacter = plr.Character
local StandPos
local AnchoreStand = function ()
    local standMorph = plrCharacter:FindFirstChild("StandMorph")
    if plrCharacter and standMorph then
        local SHum = standMorph.HumanoidRootPart
        StandPos = Instance.new("BodyPosition", SHum)
        StandPos.MaxForce = Vector3.new("inf","inf","inf")
        StandPos.D = 40000
        StandPos.P = 50000000
        StandPos.Position = plrCharacter.HumanoidRootPart.Position
        RunService.Stepped:Wait()

        local savedPos = SHum.Position
        StandPositionConnection = RunService.Stepped:Connect(function() StandPos.Position = savedPos; end)
        StandPos:Destroy()
    end
end
AnchoreStand()

print("\nWait(40)\n")
wait(40)
if StandPos then
    StandPos:Destroy()
    StandPos = nil
end
if StandPositionConnection then
    StandPositionConnection:Disconnect()
    StandPositionConnection = nil
end

