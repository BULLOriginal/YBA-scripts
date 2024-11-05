GlobValeraScriptState = false
--- модуль привязки камеры к объекту
--- модуль бега по заданным точкам
--- модуль использования способностей
--- Модуль выбора цели
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
local ping = game:GetService("Stats").PerformanceStats.Ping:GetValue()
--- 
local plr =  Players.LocalPlayer.Character
local plrHumanoid = plr:WaitForChild("Humanoid")
local plrHumanoidRootPart = plr:WaitForChild("HumanoidRootPart")
local camera = Workspace.CurrentCamera
---
GlobCameraLookPos = nil
GlobWalkingPos = nil
GlobTarget = nil
GlobBlockMark = nil
GlobSurfaceUnderPlayer = Vector3.new(0,0,0)


---------

local FindNearestPlayer = function(position)
	local found
	local lastDistance = math.huge
	for _, plyr in ipairs(Players:GetPlayers()) do
        local character = plyr.Character
        if character and character:FindFirstChild("HumanoidRootPart") then
            local playerPosition = character.HumanoidRootPart.Position
            local distance = (playerPosition - position).Magnitude
            if distance < lastDistance and plyr.Name ~= Players.LocalPlayer.Name then
                found = plyr
                lastDistance = distance
            end
        end
    end
    if found and lastDistance < 300 then
        return found.Character
    else
        return nil
    end
end

local Marking = function(player)
    if player and player:FindFirstChild("HumanoidRootPart") then
        if GlobBlockMark == nil then
            GlobBlockMark = Instance.new("SphereHandleAdornment")
            GlobBlockMark.Adornee = player.HumanoidRootPart
            GlobBlockMark.Radius = 10
            GlobBlockMark.Transparency = 0.90
            GlobBlockMark.Color3 = Color3.new(1, 0, 0)
            GlobBlockMark.ZIndex = 10
            GlobBlockMark.Parent = game.workspace
        end
        GlobBlockMark.Adornee = player.HumanoidRootPart
        GlobBlockMark.Parent = game.workspace
        if GlobBlockMark.Adornee.Parent.Blocking_Capacity.Value ~= 0 then
            GlobBlockMark.Transparency = 0.8
        else
            GlobBlockMark.Transparency = 0.95
        end
    end
end

local TargetController = function ()
    print("TargetController on")
    while RunService.Stepped:Wait() and not GlobValeraScriptState do
        local found
        if plr and plr.PrimaryPart then
            plrHumanoidRootPart = plr:FindFirstChild("HumanoidRootPart")
        else
            print("ВЕРНУТЬ")
            return nil
        end
        found = FindNearestPlayer(plrHumanoidRootPart.Position)
        if found then
            GlobTarget = found
            print("Пометить")
            Marking(GlobTarget)
        else
            GlobTarget = nil
        end
    end
    if GlobBlockMark then
        GlobBlockMark:Destroy()
        GlobBlockMark = nil
    end
    print("TargetController off")
end

---------
local getSurfaceBelowPlayer = function ()
    while RunService.Stepped:Wait() and GlobValeraScriptState do
        if not GlobTarget then return end
        local rootPart = GlobTarget:FindFirstChild("HumanoidRootPart")
        if not rootPart then return end
        local rayOrigin = rootPart.Position
        local rayDirection = Vector3.new(0, -500, 0)

        local raycastParams = RaycastParams.new()
        raycastParams.FilterDescendantsInstances = {GlobTarget}
        raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
        local result = Workspace:Raycast(rayOrigin, rayDirection, raycastParams)
        if result then
            GlobSurfaceUnderPlayer = result.Position
        end
    end
end


local CameraController = function ()
    print("CameraController on")
    spawn(getSurfaceBelowPlayer)
    while RunService.Stepped:Wait() and GlobValeraScriptState do
        if GlobTarget and GlobTarget:FindFirstChild("Humanoid") and plr and plr.PrimaryPart then
            local offset = GlobTarget.PrimaryPart.Velocity.Magnitude * ping/1000 * 10
            local targPos = GlobTarget.PrimaryPart.Position
            if targPos.Y - GlobSurfaceUnderPlayer.Y < 20 then
                targPos = Vector3.new(targPos.X, GlobSurfaceUnderPlayer.Y + 3.5, targPos.Z)
            end

            local playerCFrame = plr.PrimaryPart.CFrame
            local leftOffset = playerCFrame:PointToWorldSpace(Vector3.new(1.5, 0, 0))
            camera.CFrame = CFrame.lookAt(
        leftOffset + Vector3.new(0, 2, 0), -- Позиция камеры со смещением
        targPos + GlobTarget.Humanoid.MoveDirection * offset * Vector3.new(1, 0, 1))
        end
    end
    print("CameraController off")
end

---------

local Goto = function (pos)
    plrHumanoid:MoveTo(pos)
end

local PositionController = function ()
    print("PositionController on")
    while RunService.Stepped:Wait() and GlobValeraScriptState do
        while GlobTarget and GlobValeraScriptState and RunService.Stepped:Wait() do
            for i = 0, math.pi*2-0.01, math.pi/4 do
                if GlobTarget and GlobTarget.PrimaryPart and not GlobWalkingPos then
                    local offset = GlobTarget.PrimaryPart.Velocity.Magnitude * ping/1000 * 8
                    Goto(GlobTarget:FindFirstChild("HumanoidRootPart").Position + GlobTarget:FindFirstChild("Humanoid").MoveDirection * offset + Vector3.new(math.cos(i)*30,0,math.sin(i)*30))
                    wait(0.1)
                end
                if GlobWalkingPos then
                    for i = 0, 4, 1 do
                        Goto(GlobWalkingPos)
                        wait(0.1)
                    end
                    GlobWalkingPos = nil
                end
            end                    
        end
    end
    print("PositionController off")
end

---------
local Jump = function ()
    plrHumanoid.JumpPower = 50
    plrHumanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    wait(0.1)
    plrHumanoid.JumpPower = 0
end

local IsOnCooldown = function (skill)
    if Players.LocalPlayer.PlayerGui.HUD.Cooldowns.Frame:FindFirstChild(skill) then
        return true
    end
    return false
end

local Attack = function (skill, endlag)
    local remote = plr.RemoteEvent
    local args = {
        [1] = "Attack",
        [2] = skill
    }
    remote:FireServer(unpack(args))
    wait(0.1)
    Jump()
end

local UseSkill = function (skill, endlag)
    if plr and plr.RemoteEvent then
        if not IsOnCooldown(skill) then
            local remote = plr.RemoteEvent
            local args = {
                [1] = "MobileSkillInputBegan",
                [2] = skill
            }
            remote:FireServer(unpack(args))
            wait(0.1)
            Jump()
            wait(endlag)
            args = {
                [1] = "MobileSkillInputEnded",
                [2] = skill
            }
            remote:FireServer(unpack(args))
        end
    end
end

local function isPlayerVisible(observer, targetPlayer)
    local observerHead = observer and observer:FindFirstChild("Head")
    local targetHead = targetPlayer and targetPlayer:FindFirstChild("Head")
    if observerHead and targetHead then
        local rayDirection = (targetHead.Position - observerHead.Position).Unit * (targetHead.Position - observerHead.Position).Magnitude
        local raycastParams = RaycastParams.new()
        raycastParams.FilterDescendantsInstances = {observer}
        raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
        local result = Workspace:Raycast(observerHead.Position, rayDirection, raycastParams)
        if result and result.Instance and result.Instance:IsDescendantOf(targetPlayer) then
            return true
        end
    end
    return false
end

local AbilitiesController = function ()
    print("AbilitiesController on")
    while RunService.Stepped:Wait() and GlobValeraScriptState do
        if isPlayerVisible(plr, GlobTarget) then
            UseSkill("Throw Knife", 0)
            if GlobTarget:FindFirstChild("Blocking_Capacity").Value ~= 0 then
                local offset = GlobTarget.PrimaryPart.Velocity.Magnitude * ping/1000 * 8
                GlobWalkingPos = GlobTarget.PrimaryPart.Position + GlobTarget:FindFirstChild("Humanoid").MoveDirection * offset
                local distanceToTarget = (GlobWalkingPos - plr.PrimaryPart.Position).Magnitude
                if distanceToTarget < 10 and not IsOnCooldown("Scarlet Overdrive") then
                    UseSkill("Scarlet Overdrive", 0.1)
                elseif distanceToTarget < 5 then
                    Attack("m2", 0.1)
                end
            end
        end
    end
    print("AbilitiesController off")
end
local speeds = {
    [16] = true,
    [36] = true,
    [136] = true
}
local RunController = function ()
    print("RunController on")
    while RunService.Stepped:Wait() and GlobValeraScriptState do
        if speeds[math.floor(plrHumanoid.WalkSpeed + 0.5)] then
            local args = {
                [1] = "StartSprinting"
            }
            plr.RemoteEvent:FireServer(unpack(args))
        end
    end
    print("RunController off")
end
---------

local CreateFrame = function ()
    -- Получаем игрока и его экран (ScreenGui)
    local playerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
    -- Создаем ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = playerGui
    -- Создаем Frame
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0.3, 0, 0.1, 0) -- Размер 30% ширины и 10% высоты экрана
    frame.Position = UDim2.new(0.35, 0, 0, 0) -- Позиция сверху по центру
    frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50) -- Цвет фона
    frame.Parent = screenGui
    -- Создаем текстовое поле с предложением
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 1, 0) -- Полный размер внутри фрейма
    textLabel.Position = UDim2.new(0, 0, 0, 0)
    textLabel.Text = "Нажмите T для запуска скрипта"
    textLabel.TextColor3 = Color3.fromRGB(255, 255, 255) -- Цвет текста
    textLabel.BackgroundTransparency = 1 -- Прозрачный фон для текста
    textLabel.Font = Enum.Font.SourceSans
    textLabel.TextScaled = true -- Масштаб текста по размеру фрейма
    textLabel.Parent = frame
    print("GUI создан")
    spawn(TargetController)
    print("TargetController создан")
    local InputConnection
    delay(15, function()
        InputConnection:Disconnect()
        if screenGui then
            screenGui:Destroy()
        end
        GlobTarget = nil
        GlobValeraScriptState = false
        print("GlobValeraScriptState is Off")
        print("Таймаут, GlobValeraScriptState отключён.")
    end)
    local keys = {
        [Enum.KeyCode.W] = true,
        [Enum.KeyCode.A] = true,
        [Enum.KeyCode.S] = true,
        [Enum.KeyCode.D] = true

    }
    local processedFlag = false
    InputConnection = UserInputService.InputBegan:Connect(function (input, gameProcessed)
        if GlobValeraScriptState and keys[input.KeyCode] and not gameProcessed then
            InputConnection:Disconnect()
            GlobValeraScriptState = false
            print("GlobValeraScriptState is Off")
            if screenGui then
                screenGui:Destroy()
            end
            GlobTarget = nil
            print("Cкрипт отключён по причине вмешательства.")
        end
        if input.KeyCode == Enum.KeyCode.T and not gameProcessed and GlobTarget and not processedFlag then
            processedFlag = true
            screenGui:Destroy()
            GlobValeraScriptState = true
            print("GlobValeraScriptState is On")
            spawn(PositionController)
            spawn(CameraController)
            spawn(AbilitiesController)
            spawn(RunController)
            print("Скрипт запущен.")
        end
    end)
end

print("\nK для запуска скрипта\nL для отключения (для включения потребуется перезапуск кода)\n")
ScriptConnection = UserInputService.InputBegan:Connect(function (input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.K and not gameProcessed then
        print("Скрипт включён")
        GlobValeraScriptState = false
        CreateFrame()
    end
    if input.KeyCode == Enum.KeyCode.L and not gameProcessed then
        print("Скрипт выключен")
        ScriptConnection:Disconnect()
    end
end)