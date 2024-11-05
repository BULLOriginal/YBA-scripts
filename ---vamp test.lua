---vamp test

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")

local plr = Players.LocalPlayer
local plrCharacter = plr.Character
local VampTestConnection
local LastHP = plrCharacter.Health.Value
local LastBLOOD = plrCharacter.Blood.Value

local GetBlood = function ()
    return plrCharacter.Blood.Value
end

local GetHealth = function ()
    return plrCharacter.Health.Value
end

VampTestConnection = RunService.Stepped:Connect(function()
    local HP = GetHealth()
    local BLOOD = GetBlood()
    if HP > LastHP and BLOOD < LastBLOOD then
        print("\nRegenerated on "..HP-LastHP)
        print("Hp per 1 blood = "..(HP-LastHP)/(LastBLOOD-BLOOD))
    end

    if BLOOD > LastBLOOD then
        print("BLOOD Regenerated on "..BLOOD - LastBLOOD)
    end
    LastHP = HP
    LastBLOOD = BLOOD
end)

print("\nL для отключения (для включения потребуется перезапуск кода)\n")
local ScriptConnection
ScriptConnection = UserInputService.InputBegan:Connect(function (input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.L and not gameProcessed then
        print("Скрипт выключен")

        if VampTestConnection then
            VampTestConnection:Disconnect()
            VampTestConnection = nil
        end

        if ScriptConnection then
            ScriptConnection:Disconnect()
            ScriptConnection = nil
        end
    end
end)