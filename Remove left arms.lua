
local Players = game:GetService("Players")

-- Переменная для включения/выключения удаления руки
local RemoveLeftArm = false

-- Функция для удаления левой руки у всех игроков
local function RemoveLeftArmsFromPlayers()
    while RemoveLeftArm do
        -- Перебираем всех игроков на карте
        for _, player in pairs(Players:GetPlayers()) do
            -- Проверяем, есть ли у игрока модель персонажа
            if player.Character then
                -- Поиск и удаление "LeftLowerArm", "LeftUpperArm" и "LeftHand"
                local leftLowerArm = player.Character:FindFirstChild("LeftLowerArm")
                local leftUpperArm = player.Character:FindFirstChild("LeftUpperArm")
                local leftHand = player.Character:FindFirstChild("LeftHand")

                if leftLowerArm then
                    leftLowerArm:Destroy()
                    print("Удален LeftLowerArm у игрока " .. player.Name)
                end

                if leftUpperArm then
                    leftUpperArm:Destroy()
                    print("Удален LeftUpperArm у игрока " .. player.Name)
                end

                if leftHand then
                    leftHand:Destroy()
                    print("Удален LeftHand у игрока " .. player.Name)
                end
            end
        end
        -- Ждем 1 секунду перед повтором цикла
        wait(1)
    end
end

-- Функция для начала удаления рук
local function StartRemovingLeftArms()
    RemoveLeftArm = true
    RemoveLeftArmsFromPlayers() -- Запуск в отдельном потоке
end

workspace.Map:FindFirstChild("IMPORTANT"):FindFirstChild("Ocean").Size = Vector3.new(0.1,0.1,0.1)
if RemoveLeftArm then
    print("Removing left arms is On")
    StartRemovingLeftArms()
else
    print("Removing left arms is Off")
end