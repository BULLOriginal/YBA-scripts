--- AFK use skills
--------------------------
local Skills = {
    --- delay before skill - skillName
    [0.5] = "Hook Pierce",
    [1] = "Rod Throw",
}
local SCRIPTOFFKEY = "J"
--------------------------
print("AFK Using skill is on...")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local plr = Players.LocalPlayer
local plrCharacter = plr.Character
local IsOnCooldown = function (skill)
    if plr.PlayerGui.HUD.Cooldowns.Frame:FindFirstChild(skill) then
        return true
    end
    return false
end
local UseSkill = function (skill, A_1)
    if not skill then skill = "m" end
    if plrCharacter and plrCharacter.RemoteEvent then
        local remote = plrCharacter.RemoteEvent
        local args = {
            [1] = "MobileSkillInputBegan",
            [2] = skill
        }
        if A_1 then
            args[1] = A_1
        end
        remote:FireServer(unpack(args))
    end
end
local AfkSkillUsingConnect = true
while AfkSkillUsingConnect and RunService.Stepped:Wait() do
    local tic = tick()
    if tic % 2000 < 100 then
        wait(0.5)
        UseSkill("Hamon Charge")
    end
    for i, v in pairs(Skills) do
        if not IsOnCooldown(v) then
            wait(i)
            UseSkill(v)
        end
    end
end
print("\nL для отключения (для включения потребуется перезапуск кода)\n")
local ScriptConnection
ScriptConnection = UserInputService.InputBegan:Connect(function (input, gameProcessed)
    if input.KeyCode == Enum.KeyCode[SCRIPTOFFKEY] and not gameProcessed then
        getgenv().IsValeraScriptRunning = false
        print("AFK Скрипт выключен")
        if AfkSkillUsingConnect then
            AfkSkillUsingConnect = false
        end
        if ScriptConnection then
            ScriptConnection:Disconnect()
            ScriptConnection = nil
        end
    end
end)