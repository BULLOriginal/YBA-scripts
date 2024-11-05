local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()

local Window = Library.CreateLib("Name", "RJTheme3") 
local Tab = Window:NewTab("TabName")
local Section = Tab:NewSection("Section Name")
local Players = game:GetService("Players")

local GlobMarkClosestPlayer
local GlobT
local GlobFixPilot

local Mark
local BlockMark

local isPerformingAction = false

local StandHumanoid = nil

local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local plr = Players.LocalPlayer
local camera = game:GetService("Workspace").CurrentCamera

local NearestPlayerConnection
local KeyConnection
local FixPilotConnection
local CharacterAddedConnection
local StandMorphAddedConnection
local IspilotingAddedConnection

local RightHandConnection
local ClockConnection
local ClockGui

local HOOKMINRADIUS = 14
local PILOTCORRECTION = 5


local function FacingCamera(direction)
    camera.CFrame = CFrame.lookAt(camera.CFrame.Position, direction)
end

-- Функция для создания и отображения циферблата
local function CreateClockGui()
    if not ClockGui then
        -- Создаем GUI-элемент
        ClockGui = Instance.new("ScreenGui")
        ClockGui.Parent = plr.PlayerGui

        local ClockFrame = Instance.new("Frame")
        ClockFrame.Size = UDim2.new(0, 200, 0, 200)
        ClockFrame.Position = UDim2.new(0.5, -100, 0.5, -100) -- Центр экрана
        ClockFrame.BackgroundTransparency = 1
        ClockFrame.Parent = ClockGui

        local ClockLabel = Instance.new("TextLabel")
        ClockLabel.Size = UDim2.new(1, 0, 1, 0)
        ClockLabel.TextScaled = true
        ClockLabel.BackgroundTransparency = 1
        ClockLabel.Text = "6.22"
        ClockLabel.Parent = ClockFrame

        return ClockLabel
    end
end


-- Функция для обновления циферблата и его удаления после 6.22 секунд
local function StartClock()
    local timeLeft = 6.22
    local clockLabel = CreateClockGui()

    ClockConnection = RunService.Heartbeat:Connect(function(deltaTime)
        timeLeft = timeLeft - deltaTime
        clockLabel.Text = string.format("%.2f", timeLeft)

        if timeLeft <= 0 and ClockGui then
            ClockGui:Destroy()
            ClockGui = nil
            if ClockConnection then
                ClockConnection:Disconnect()
                ClockConnection = nil
            end
        end
    end)
end


-- Функция для отслеживания появления класса "Marionette Control"
local function StartMonitoringMarionette(standMorph)
    RightHandConnection = standMorph:WaitForChild("RightHand",10).ChildAdded:Connect(function(handChild)
        if handChild.Name == "Marionette Control" then
            if handChild then
                print("Marionette Control появился, запускаем таймер на 6.22 секунды.")
                StartClock()
            end
        end
    end)
end


-- Функция для остановки мониторинга Marionette Control
local function StopMonitoringMarionette()
    if RightHandConnection then
        RightHandConnection:Disconnect()
        RightHandConnection = nil
    end

    if ClockConnection then
        ClockConnection:Disconnect()
        ClockConnection = nil
    end

    if ClockGui then
        ClockGui:Destroy()
        ClockGui = nil
    end
end


-- Функция для проверки и корректировки позиции PilotBodyPosition
local function FixPilotPosition()
    if plr.Character and plr.Character:FindFirstChild("StandMorph") then
        local standMorph = plr.Character.StandMorph
        local humanoidRootPart = standMorph:FindFirstChild("HumanoidRootPart")
        if humanoidRootPart and humanoidRootPart:FindFirstChild("PilotBodyPosition") then
            local pilotBodyPosition = humanoidRootPart.PilotBodyPosition

            -- Сравниваем позиции PilotBodyPosition и HumanoidRootPart
            local posDifference = (pilotBodyPosition.Position - humanoidRootPart.Position)

            -- Проверка разницы по любой из осей (более чем на 50)
            if math.abs(posDifference.X) > PILOTCORRECTION or math.abs(posDifference.Y) > PILOTCORRECTION or math.abs(posDifference.Z) > PILOTCORRECTION then
                -- Корректируем позицию PilotBodyPosition, чтобы она совпадала с HumanoidRootPart.Position
                pilotBodyPosition.Position = humanoidRootPart.Position
                -- print("Позиция PilotBodyPosition скорректирована")
            end
        end
    end
end

-- Функция для настройки свойств StandMorph
local function SetupStandMorph(standMorph)
    -- Проверка и настройка IsPiloting
    local isPiloting = standMorph:FindFirstChild("IsPiloting")
    if isPiloting then
        isPiloting.Value = isPiloting.Value + 50
        -- print("Значение IsPiloting увеличено на 50")
    end

    -- Проверка и настройка PilotSpeed
    local pilotSpeed = standMorph:FindFirstChild("PilotSpeed")
    if pilotSpeed then
        pilotSpeed.Value = 1
        -- print("Значение PilotSpeed установлено на 1")
    end

    -- Подключаемся к событию добавления новых детей в StandMorph
    IspilotingAddedConnection = standMorph.ChildAdded:Connect(function(child)
        if child.Name == "IsPiloting" then
            child.Value = child.Value + 50
            -- print("Значение IsPiloting увеличено на 50 (после добавления)")
        elseif child.Name == "PilotSpeed" then
            child.Value = 1
            -- print("Значение PilotSpeed установлено на 1 (после добавления)")
        end
    end)
end

-- Функция для отслеживания появления персонажа
local function OnCharacterAdded(character)
    -- Проверяем наличие StandMorph и подключаемся к его появлению
    local standMorph = character:FindFirstChild("StandMorph")
    if standMorph then
        SetupStandMorph(standMorph)
        -- Начинаем мониторинг появления Marionette Control
        StartMonitoringMarionette(standMorph)
    end

    -- Подключаемся к событию добавления StandMorph
    -- if not StandMorphAddedConnection then
        StandMorphAddedConnection = character.ChildAdded:Connect(function(child)
            if child.Name == "StandMorph" then
                SetupStandMorph(child)
                StartMonitoringMarionette(child)
            end

        end)
    -- end
end

-- Функция для включения фиксирования позиции и мониторинга классов
local function StartFixPilot()
    -- Подключаемся к циклу обновления позиции
    if not FixPilotConnection then
        FixPilotConnection = RunService.Heartbeat:Connect(function()
            FixPilotPosition()
        end)
    end

    -- Подключаем мониторинг свойств StandMorph
    if not CharacterAddedConnection then
        CharacterAddedConnection = plr.CharacterAdded:Connect(OnCharacterAdded)
        
        -- Если персонаж уже существует, проверяем сразу
        if plr.Character then
            OnCharacterAdded(plr.Character)
        end
    end
end

-- Функция для отключения фиксирования позиции и мониторинга классов
local function StopFixPilot()
    -- Отключаем фиксацию позиции
    if FixPilotConnection then
        FixPilotConnection:Disconnect()
        FixPilotConnection = nil
    end

    -- Отключаем мониторинг свойств StandMorph
    if CharacterAddedConnection then
        CharacterAddedConnection:Disconnect()
        CharacterAddedConnection = nil
    end

    if StandMorphAddedConnection then
        StandMorphAddedConnection:Disconnect()
        StandMorphAddedConnection = nil
    end

    if IspilotingAddedConnection then
        IspilotingAddedConnection:Disconnect()
        IspilotingAddedConnection = nil
    end
end



-- Функция для поиска ближайшего игрока
local FindNearestPlayer = function(position)
	local found
	local lastDistance = math.huge
	for _, plyr in ipairs(Players:GetPlayers()) do
        local character = plyr.Character
        if character and character:FindFirstChild("HumanoidRootPart") then
            local playerPosition = character.HumanoidRootPart.Position
            local distance = (playerPosition - position).Magnitude  -- Используем Magnitude для вычисления расстояния
            -- print("Проверка игрока ", plyr.Name, " с дистанцией ", distance)

            -- Проверяем, если расстояние меньше предыдущего и игрок не является локальным
            if distance < lastDistance and plyr.Name ~= plr.Name then
                -- print("Обновленный ближайший игрок - ", plyr.Name, " с дистанцией ", distance)
                found = plyr
                lastDistance = distance
            end
        end
    end

    if found then
        -- print("!!!!!!! Ближайший игрок - ", found.Name)
        return found.Character
    else
        print("Ближайший игрок не найден")
        return nil
    end
end

local Marking = function(player)
    if player and player:FindFirstChild("HumanoidRootPart") then
        if Mark == nil then
            -- Создаем новый объект SphereHandleAdornment
            Mark = Instance.new("SphereHandleAdornment")
            Mark.Adornee = player.HumanoidRootPart
            Mark.Radius = HOOKMINRADIUS  -- Устанавливаем радиус
            Mark.Transparency = 0.90  -- Полупрозрачность
            Mark.AlwaysOnTop = true  -- Круг всегда виден поверх всех объектов
            Mark.ZIndex = 9  -- Высокий приоритет отображения (можно настроить)
            Mark.Parent = game.workspace  -- Родитель должен быть в workspace
        end
        if BlockMark == nil then
            BlockMark = Instance.new("SphereHandleAdornment")
            BlockMark.Adornee = player.HumanoidRootPart
            BlockMark.Radius = HOOKMINRADIUS/3  -- Устанавливаем радиус
            BlockMark.Transparency = 0.90  -- Полупрозрачность
            BlockMark.Color3 = Color3.new(1, 0, 0)
            BlockMark.ZIndex = 10  -- Высокий приоритет отображения (можно настроить)
            BlockMark.Parent = game.workspace
            --Если чел блокает
        end
        BlockMark.Adornee = player.HumanoidRootPart
        BlockMark.Parent = game.workspace
        Mark.Adornee = player.HumanoidRootPart
        Mark.Parent = game.workspace
        if Mark.Adornee.Parent.Blocking_Capacity.Value ~= 0 then
            BlockMark.Transparency = 0.50  -- Полупрозрачность
        else
            BlockMark.Transparency = 0.95  -- Полупрозрачность
        end
    end
end



-- Функция для запуска поиска ближайшего игрока
local function StartMarkingClosestPlayer()
    NearestPlayerConnection = RunService.Heartbeat:Connect(function()
        if GlobMarkClosestPlayer then
            -- Проверяем, существует ли объект StandMorph и HumanoidRootPart
            if plr.Character and plr.Character:FindFirstChild("StandMorph") then
                StandHumanoid = plr.Character.StandMorph:FindFirstChild("HumanoidRootPart")
            else
                StandHumanoid = nil
            end

            if StandHumanoid then
                local ClosestPlayer = FindNearestPlayer(StandHumanoid.Position)
                if ClosestPlayer then
                    Marking(ClosestPlayer)
                else
                    print("Ошибка при поиске ближайшего игрока")
                end
            else
                -- print("StandMorph.HumanoidRootPart не найден.")
            end
        end
    end)
end

-- Функция для остановки поиска ближайшего игрока
local function StopMarkingClosestPlayer()
    if NearestPlayerConnection then
        NearestPlayerConnection:Disconnect()
        NearestPlayerConnection = nil
    end
end


-- Функция для проверки, воспроизводится ли анимация
local function IsAnimationPlaying(animationController, animationId)
    for _, track in pairs(animationController:GetPlayingAnimationTracks()) do
        if track.Animation.AnimationId == animationId then
            return true
        end
    end
    return false
end

-- Функция, которая будет выполняться при нажатии на T
local function PerformAction()
    if not plr.PlayerGui.HUD.Cooldowns.Frame:FindFirstChild("Marionette Control") and
    plr.Character and
    plr.Character:FindFirstChild("StandMorph") then
        local standMorph = plr.Character.StandMorph
        local standHumanoid = standMorph:FindFirstChild("HumanoidRootPart")
        local animationController = standMorph:FindFirstChild("AnimationController")
        if standHumanoid and standHumanoid:FindFirstChild("PilotBodyPosition") then
            local pilotBodyPosition = standHumanoid.PilotBodyPosition
            print("PilotBodyPosition найден, выполняется действие.")
            if isPerformingAction then
                print("Функция PerformAction уже выполняется")
                return
            else
                isPerformingAction = true
                print("Функция PerformAction выполняется впервые")
            end
            wait(0.45)
            if Mark and Mark.Adornee then
                local distance = (standHumanoid.Position - Mark.Adornee.Position).Magnitude
                if distance < HOOKMINRADIUS then
                    local animationId = "rbxassetid://4096014941"
                    if animationController and IsAnimationPlaying(animationController, animationId) then

                        print("Анимация воспроизводится, выполняем действие.")
                        local temp = standHumanoid.Position
                        local tempC = standHumanoid.CFrame
                        local tempCam = camera.CFrame
                        plr.Character.StandMorph:FindFirstChild("PilotSpeed").Value = 0
                        for i = 0, 5, 1 do
                            FacingCamera(Mark.Adornee.Position)
                            pilotBodyPosition.Position = Mark.Adornee.Position + Vector3.new(0,2,0) + Mark.Adornee.Parent.Humanoid.MoveDirection * 3
                            print("Позиция изменена на позицию Mark.Adornee")
                            game:GetService("RunService").RenderStepped:Wait()
                        end
                        pilotBodyPosition.Position = temp
                        standHumanoid.CFrame = tempC
                        camera.CFrame = tempCam
                        plr.Character.StandMorph:FindFirstChild("PilotSpeed").Value = 1
                        print("Позиция возвращена в исходное состояние")
                    else
                        print("Анимация не воспроизводится, действие не выполнено.")
                        isPerformingAction = false
                        return
                    end
                else
                    print("Расстояние больше установленного, действие не выполнено.")
                    isPerformingAction = false
                    return
                end
            else
                print("Mark или Mark.Parent не найдены.")
                isPerformingAction = false
                return
            end
        else
            print("PilotBodyPosition не найден.")
            isPerformingAction = false
            return
        end
    end
    wait(1)
    isPerformingAction = false
end




-- Функция для активации и деактивации отслеживания нажатия клавиши T
local function StartListeningForKeyPress()
    KeyConnection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end -- Игнорируем ввод, если он уже обработан другими элементами игры
        if input.KeyCode == Enum.KeyCode.T then
            PerformAction()
        end
    end)
end


local function StopListeningForKeyPress()
    if KeyConnection then
        KeyConnection:Disconnect()
        KeyConnection = nil
    end

    -- Останавливаем мониторинг и удаляем циферблат, если он есть
    StopMonitoringMarionette()
end

Section:NewToggle("MarkClosestPlayer", "", function(state)
    GlobMarkClosestPlayer = state
    if GlobMarkClosestPlayer then
        print("GlobMarkClosestPlayer is On")
        StartMarkingClosestPlayer()
    else
        print("GlobMarkClosestPlayer is Off")
        StopMarkingClosestPlayer()
        if BlockMark then
            BlockMark:Destroy()
            BlockMark = nil
        end
        if Mark then
            print("MARK DESTROYED")
            Mark:Destroy()
            Mark = nil
        end
    end
end)


Section:NewToggle("Activate T", "", function(state)
    GlobT = state
    if GlobT then
        print("T tp is active. Нажмите T для выполнения действия.")
        StartListeningForKeyPress()
    else
        print("T tp is inactive.")
        StopListeningForKeyPress()
    end
end)


-- Toggle для включения/выключения функции фиксации
Section:NewToggle("FixPilot", "Fix PilotBodyPosition and monitor properties", function(state)
    GlobFixPilot = state
    if GlobFixPilot then
        print("GlobFixPilot is On")
        StartFixPilot()
    else
        print("GlobFixPilot is Off")
        StopFixPilot()
    end
end)


workspace.Map:FindFirstChild("IMPORTANT"):FindFirstChild("Ocean").Size = Vector3.new(0.1,0.1,0.1)
-- Toggle для включения/выключения функции фиксации
Section:NewButton("Delete water", "", function()
    workspace.Map:FindFirstChild("IMPORTANT"):FindFirstChild("Ocean").Size = Vector3.new(0.1,0.1,0.1)
end)


--ко всем союзникам тянуть beam для легкого обнаружения