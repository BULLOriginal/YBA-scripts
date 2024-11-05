--- TP голову к себе
--- free run script
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
--------------------------
local TARGETNAME = "itzegor4ik"
local TPPART     = "Head"
--------------------------
local plr = Players.LocalPlayer
local plrCharacter = plr.Character
local Targetplr
local TargetCharacter
local TargetTpConnection
for _, v in pairs(Players:GetChildren()) do
    if v.Name ~= plr.Name then
        Targetplr = v
        break
    end
end

if not Targetplr then
    print("Игрок не найден")
else
    TargetCharacter = Targetplr.Character
    local CutBodyPart = function (target, partName)
        local head
        if target and target:FindFirstChild(partName) then
            head = target:FindFirstChild(partName)
            for _, v in pairs(head:GetChildren()) do
                if v:IsA("Attachment") or v:IsA("Motor6D") then
                    print("Уничтожено соединение",v.Name,"у игрока",target.Name)
                    v:Destroy()
                end
            end
        end
    end
    local TpTarget = function ()
        if TargetCharacter and plrCharacter and 
        plrCharacter:FindFirstChild("HumanoidRootPart") then
            TargetCharacter:FindFirstChild(TPPART).CFrame = plrCharacter.HumanoidRootPart.CFrame * CFrame.new(0,0,-15)
        end
    end
    local OnTargetAdded = function (character)
        TargetCharacter = character
        CutBodyPart(TargetCharacter, TPPART)
    end
    local OnCharacterAdded = function (character)
        plrCharacter = character
        if TargetTpConnection then
            TargetTpConnection:Disconnect()
            TargetTpConnection = nil
        end
        TargetTpConnection = RunService.Stepped:Connect(TpTarget)
    end
    OnTargetAdded(TargetCharacter)
    OnCharacterAdded(plrCharacter)
    print("\nL для отключения (для включения потребуется перезапуск кода)\n")
    OnCharacterAdded(plrCharacter)
    local CharacterAddedConnection = plr.CharacterAdded:Connect(OnCharacterAdded)
    local TargetAddedConnection = Targetplr.CharacterAdded:Connect(OnTargetAdded)
    local ScriptConnection
    ScriptConnection = UserInputService.InputBegan:Connect(function (input, gameProcessed)
        if input.KeyCode == Enum.KeyCode.L and not gameProcessed then
            print("Скрипт выключен")
            if TargetTpConnection then
                TargetTpConnection:Disconnect()
                TargetTpConnection = nil
            end
            if TargetAddedConnection then
                TargetAddedConnection:Disconnect()
                TargetAddedConnection = nil
            end
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
    if workspace.Map:FindFirstChild("IMPORTANT"):FindFirstChild("Ocean") then
        workspace.Map:FindFirstChild("IMPORTANT"):FindFirstChild("Ocean").Size = Vector3.new(0.1,0.1,0.1)
    end
end