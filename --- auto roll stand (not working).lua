--- auto arrow
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local plr = Players.LocalPlayer
local plrCharacter = plr.Character
local CharacterAddedConnection
local IsLearned = function (skill, skilltreetype)
    if plr[skilltreetype.."SkillTree"]:FindFirstChild(skill) then
        return plr[skilltreetype.."SkillTree"]:FindFirstChild(skill).Value
    end
end
local LearnSkill = function (skill, skilltreetype)
    if plrCharacter and plrCharacter:FindFirstChild("RemoteFunction") then
        print("Learning",skill, skilltreetype)
        local remote = plrCharacter.RemoteFunction
        local A_1 = "LearnSkill"
        local A_2 = {
            ["Skill"] = skill,
            ["SkillTreeType"] = skilltreetype,
        }
        remote:InvokeServer(A_1, A_2)
    end
end
local OnCharacterAdded = function(character)
    plrCharacter = character
    wait(1)
    if not IsLearned("Worthiness I", "Character") then
        LearnSkill("Worthiness I", "Character")
    end
end
print("\nL для отключения (для включения потребуется перезапуск кода)\n")
OnCharacterAdded(plrCharacter)
CharacterAddedConnection = plr.CharacterAdded:Connect(OnCharacterAdded)
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