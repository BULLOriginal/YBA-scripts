--- descendant time counter

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local plr = Players.LocalPlayer
local plrCharacter = plr.Character
local AddedConnection
local RemovedConnection
local DESCENDANTNAME = "Your Own Shadow"
local StartTime
local EndTime
AddedConnection = plrCharacter.DescendantAdded:Connect(function(des)
    if des.Name == DESCENDANTNAME then
        StartTime = tick()
        print(`{DESCENDANTNAME} found`)
    end
end)
RemovedConnection = plrCharacter.DescendantRemoving:Connect(function(des)
    if des.Name == DESCENDANTNAME then
        if not StartTime then warn("NO START REGISTRED"); return end
        EndTime = tick()
        print(`{DESCENDANTNAME} removed`)
        print(EndTime - StartTime)
        StartTime, EndTime = nil, nil
        return
    end
end)
print("\nL для отключения (для включения потребуется перезапуск кода)\n")
local ScriptConnection
ScriptConnection = UserInputService.InputBegan:Connect(function (input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.L and not gameProcessed then
        print("Скрипт выключен")

        if AddedConnection then
            AddedConnection:Disconnect()
            AddedConnection = nil
        end

        if RemovedConnection then
            RemovedConnection:Disconnect()
            RemovedConnection = nil
        end

        if ScriptConnection then
            ScriptConnection:Disconnect()
            ScriptConnection = nil
        end
    end
end)