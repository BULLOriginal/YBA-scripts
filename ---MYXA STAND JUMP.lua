---MYXA STAND JUMP
local Players = game:GetService("Players")
local plr = Players.LocalPlayer
local plrCharacter = plr.Character
local BoostJumpCoonect
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
--- установить уровень прокачки stand jump
local LVL = 3
---


local VelocityAdded = function(child)
    if not child then
        return
    end
    if child.Name == "BodyVelocity" and child.Velocity.Magnitude > 77 and child.Velocity.Magnitude < 82 then
        child.Velocity = child.Velocity * (1 + LVL / 3)
    end
end


local OnCharacterAdded = function (character)
    plrCharacter = character
    if BoostJumpCoonect then
        BoostJumpCoonect:Disconnect()
        BoostJumpCoonect = nil
    end
    BoostJumpCoonect = plrCharacter:WaitForChild("HumanoidRootPart").ChildAdded:Connect(VelocityAdded)
end


print("\nL для отключения (для включения потребуется перезапуск кода)\n")
OnCharacterAdded(plrCharacter)
local CharacterAddedConnection = plr.CharacterAdded:Connect(OnCharacterAdded)
local ScriptConnection
ScriptConnection = UserInputService.InputBegan:Connect(function (input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.L and not gameProcessed then
        print("Скрипт выключен")
        if CharacterAddedConnection then
            CharacterAddedConnection:Disconnect()
            CharacterAddedConnection = nil
        end

        if ScriptConnection then
            ScriptConnection:Disconnect()
            ScriptConnection = nil
        end
    end
end)
workspace.Map:FindFirstChild("IMPORTANT"):FindFirstChild("Ocean").Size = Vector3.new(0.1,0.1,0.1)