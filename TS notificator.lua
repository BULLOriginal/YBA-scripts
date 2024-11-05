local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
--- 
local plr =  Players.LocalPlayer.Character
local plrHumanoidRootPart = plr:WaitForChild("HumanoidRootPart")
local living = Workspace.Living
---------
local ClosestTsConnection
local TsGui

local IsAnimation = function (player, animationID)
    if not player or not player:FindFirstChild("StandMorph") then
        print("return false 1")
        return false
    end
    local standMorph = player:FindFirstChild("StandMorph")
    local humanoid = standMorph:FindFirstChild("AnimationController")
    if humanoid then
        local animator = humanoid:WaitForChild("Animator",3)
        for _, track in pairs(animator:GetPlayingAnimationTracks()) do
            if track.Animation.AnimationId  == animationID then
                print("return true")
                return true
            end
        end
    end
    print("return false")
    return false
end

local FindTsing = function(position)
	for _, plyr in ipairs(living:GetChildren()) do
        if plyr and plyr:FindFirstChild("HumanoidRootPart") then
            local playerPosition = plyr.HumanoidRootPart.Position
            local distance = (playerPosition - position).Magnitude
            if distance < 200 then
                local standMorph = plyr:FindFirstChild("StandMorph")
                if standMorph then
                    if standMorph:FindFirstChild("Stand Name").Value ~= "D4C Love Train" then
                        print(plyr.Name.." dist = "..distance.." TS = ", IsAnimation(plyr, "rbxassetid://4139325504")) -- Печать расстояния для каждого игрока
                        if IsAnimation(plyr, "rbxassetid://4139325504") then
                            return plyr
                        end
                    end
                end
            end
        end
    end
    return nil
end

local CreateFrame = function (foundName)
    if not TsGui then
    -- Получаем игрока и его экран (TsGui)
    local playerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
    -- Создаем ScreenTsGui
        TsGui = Instance.new("ScreenGui")
        TsGui.Parent = playerGui
    
        -- Создаем Frame
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0.3, 0, 0.1, 0) -- Размер 30% ширины и 10% высоты экрана
        frame.Position = UDim2.new(0.35, 0, 0, 0) -- Позиция сверху по центру
        frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50) -- Цвет фона
        frame.Parent = TsGui
        -- Создаем текстовое поле с предложением
        local textLabel = Instance.new("TextLabel")
        textLabel.Size = UDim2.new(1, 0, 1, 0) -- Полный размер внутри фрейма
        textLabel.Position = UDim2.new(0, 0, 0, 0)
        textLabel.Text = foundName
        textLabel.TextColor3 = Color3.fromRGB(255, 255, 255) -- Цвет текста
        textLabel.BackgroundTransparency = 1 -- Прозрачный фон для текста
        textLabel.Font = Enum.Font.SourceSans
        textLabel.TextScaled = true -- Масштаб текста по размеру фрейма
        textLabel.Parent = frame
        print("TsGUI создан")
        delay(4, function()
            if TsGui then
                TsGui:Destroy()
                TsGui = nil
            end
        end)
    end
end

print("ACTIVATED")
ClosestTsConnection = RunService.Stepped:Connect(function ()
    local found = FindTsing(plrHumanoidRootPart.Position)
    if found then
        CreateFrame(found.Name)
    end
end)
local ScriptConnection
ScriptConnection = UserInputService.InputBegan:Connect(function (input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.L then
        print("SCRIPT OFF")
        if ClosestTsConnection then
            ClosestTsConnection:Disconnect()
            ClosestTsConnection = nil
        end

        if ScriptConnection then
            ScriptConnection:Disconnect()
            ScriptConnection = nil
        end
    end
end)