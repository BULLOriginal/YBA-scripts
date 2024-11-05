local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

-- Имя игрока, к которому нужно переключить камеру
local targetName = "Megageniy56005" -- Укажи имя игрока

local player = Players.LocalPlayer
local camera = workspace.CurrentCamera
local originalCameraCFrame = nil -- Для хранения исходного состояния камеры

-- Глобальный флаг для управления скриптом
CameraDenFlag = true

-- Имена для шагов рендера
local renderStepName = "UpdateCamera"
local renderStepRotateName = "RotateCameraDown"

-- Функция, которая будет вызываться для использования навыка
function UseSkill(skill)
    local args = {
        [1] = "MobileSkillInputBegan",
        [2] = skill
    }
    game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(args))
end

-- Функция для управления камерой и выполнением шагов
local function manipulateCamera()

    -- Шаг 1: Привязать камеру к игроку и начать обновление через RenderStep
    local targetPlayer = Players:FindFirstChild(targetName)
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        camera.CameraSubject = targetPlayer.Character.Humanoid
        print("Камера привязана к игроку:", targetName)

        -- Привязываем функцию обновления камеры через RenderStep
        RunService:BindToRenderStep(renderStepName, Enum.RenderPriority.Camera.Value, function()
            if targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                -- Обновляем позицию камеры
                camera.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
            else
                -- Если цель исчезла, отвязываем камеру
                RunService:UnbindFromRenderStep(renderStepName)
                camera.CameraSubject = player.Character.Humanoid
                print("Игрок не найден, камера вернулась к персонажу игрока.")
            end
        end)
        wait(.1)
    else
        print("Целевой игрок не найден или отсутствует HumanoidRootPart.")
        return
    end

    -- Шаг 2: Привязка к RenderStep для плавного вращения камеры вниз
    local downwardRotation = CFrame.Angles(-math.pi / 2, 0, 0)
    RunService:enderStep(renderStepRotateName, Enum.RenderPriority.Camera.Value, function()
        -- Вращаем камеру вниз
        camera.CFrame = camera.CFrame * downwardRotation
    end)
    wait(.1)

    -- Шаг 4: Отвязать камеру от игрока и остановить обновление и вращение через RenderStep
    camera.CameraSubject = player.Character.Humanoid
    RunService:UnbindFromRenderStep(renderStepName)
    RunService:UnbindFromRenderStep(renderStepRotateName)
    print("Камера отвязана от игрока и обновления.")
    wait(.1)

    -- Шаг 5: Повернуть камеру на HumanoidRootPart целевого игрока
    if targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local targetHRP = targetPlayer.Character.HumanoidRootPart
        local lookAtTarget = CFrame.lookAt(camera.CFrame.Position, targetHRP.Position)
        camera.CFrame = lookAtTarget
    else
        print("HumanoidRootPart целевого игрока не найден.")
    end
end

-- Обработка нажатия клавиши L
UserInputService.InputBegan:Connect(function(input, isProcessed)
    if CameraDenFlag and input.KeyCode == Enum.KeyCode.H then
        manipulateCamera()
        print("Процесс камеры запущен.")
    end
end)
