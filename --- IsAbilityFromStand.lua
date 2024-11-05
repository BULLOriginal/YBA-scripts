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

print("\nL для отключения (для включения потребуется перезапуск кода)\n")
local ScriptConnection
ScriptConnection = UserInputService.InputBegan:Connect(function (input, gameProcessed)
    if input.KeyCode == Enum.KeyCode[ScriptOffKey] and not gameProcessed then
        print("Скрипт выключен")

        if StandPos then
            StandPos:Destroy()
            StandPos = nil
        end
        if ScriptConnection then
            ScriptConnection:Disconnect()
            ScriptConnection = nil
        end
    end
end)