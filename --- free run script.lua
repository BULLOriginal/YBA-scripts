--- free run script
---Добавить значение к СКОРОСТИ БЕГА (Меньше = меньше шанс кика)

-- FUNSOUNDS = true
-- PETUHVIEW = true
-- IMPALEGLITCHFLAG = true
-- MARKERTOGGLE = true
-- MARKERRENDERDISTANCE = 200
-- AIM = true
-- BBINDICATOR = true
-- TSNOTIFER = true
-- STANDSKILLSPRIORITY = false
-- FINDSTANDSANDSPECS = true
-- FINDALLPLAYERS = false
-- HPINDICATOR = true
-- ADDTORUNSPEED = 11

-- CUSTOMPOSE = false
-- PARTFORSCALE = "LowerTorso"
-- CHOOSECUSTOMPOSE = "T-Pose"
-- CHOOSESTANDPOSE = nil
-- SPECTATORKEY = "J"
-- FATPLAYERSSIZE = 3
-- THINFRIENDSSIZE = 0.3

-- FINDSTANDS = {
--     ["Star Platinum"] = true,
    -- ["Hermit Purple"] = true,
    -- ["Gold Experience"] = true,
    -- ["Crazy Diamond"] = true,
    -- ["Stone Free"] = true,
-- }
-- FINDSPECS = {
--     ["Boxing"] = true,
--     ["Hamon (Caesar Zeppeli)"] = true,
--     ["Hamon (Jonathan Joestar)"] = true,
--     ["Hamon (Joseph Joestar)"] = true,
--     ["Hamon (William Zeppeli)"] = true,
--     ["Spin"] = true,
--     ["SwordStyle"] = true,
--     ["Vampirism"] = true,
-- }


local DefaultSettings = {
    FUNSOUNDS = true,
    PETUHVIEW = true,
    IMPALEGLITCHFLAG = true,
    MARKERTOGGLE = true,
    MARKERRENDERDISTANCE = 200,
    AIM = true,
    BBINDICATOR = true,
    TSNOTIFER = true,
    STANDSKILLSPRIORITY = false,
    FINDSTANDSANDSPECS = true,
    FINDALLPLAYERS = false,
    HPINDICATOR = true,
    ADDTORUNSPEED = 11,

    CUSTOMPOSE = false,
    PARTFORSCALE = "LowerTorso",
    CHOOSECUSTOMPOSE = "T-Pose",
    CHOOSESTANDPOSE = nil,
    SPECTATORKEY = "J",
    FATPLAYERSSIZE = 3,
    THINFRIENDSSIZE = 0.3,

    FINDSTANDS = {
        ["Star Platinum"] = true,
        ["Hermit Purple"] = true,
        ["Gold Experience"] = true,
        ["Crazy Diamond"] = true,
        ["Stone Free"] = true,
    },
    FINDSPECS = {
        ["Boxing"] = false,
        ["Hamon (Caesar Zeppeli)"] = false,
        ["Hamon (Jonathan Joestar)"] = true,
        ["Hamon (Joseph Joestar)"] = true,
        ["Hamon (William Zeppeli)"] = false,
        ["Spin"] = false,
        ["SwordStyle"] = false,
        ["Vampirism"] = false,
    },
}
for setting, default in pairs(DefaultSettings) do
    local Gsetting = getfenv()[setting]
    if Gsetting == nil or type(Gsetting) ~= type(default) or Gsetting == 0 or Gsetting == {} then
        getfenv()[setting] = default
    end
end

-- end
-- if type(FUNSOUNDS) ~= "boolean" or FUNSOUNDS == nil then
--     FUNSOUNDS = true
-- end
-- if type(PETUHVIEW) ~= "boolean" or PETUHVIEW == nil then
--     PETUHVIEW = true
-- end
-- if type(IMPALEGLITCHFLAG) ~= "boolean" or IMPALEGLITCHFLAG == nil then
--     IMPALEGLITCHFLAG = true
-- end
-- if type(MARKERTOGGLE) ~= "boolean" or MARKERTOGGLE == nil then
--     MARKERTOGGLE = false
-- end
-- if type(AIM) ~= "boolean" or AIM == nil then
--     AIM = true
-- end
-- if type(BBINDICATOR) ~= "boolean" or BBINDICATOR == nil then
--     BBINDICATOR = true
-- end
-- if type(STANDSKILLSPRIORITY) ~= "boolean" or STANDSKILLSPRIORITY == nil then
--     STANDSKILLSPRIORITY = false
-- end
-- if type(CUSTOMPOSE) ~= "boolean" or CUSTOMPOSE == nil then
--     CUSTOMPOSE = false
-- end
-- if type(FINDSTANDSANDSPECS) ~= "boolean" or FINDSTANDSANDSPECS == nil then
--     FINDSTANDSANDSPECS = true
-- end
-- if type(HPINDICATOR) ~= "boolean" or HPINDICATOR == nil then
--     HPINDICATOR = true
-- end
-- if type(TSNOTIFER) ~= "boolean" or TSNOTIFER == nil then
--     TSNOTIFER = true
-- end
-- if type(FINDALLPLAYERS) ~= "boolean" or FINDALLPLAYERS == nil then
--     FINDALLPLAYERS = true
-- end


-- if type(ADDTORUNSPEED) ~= "number" or ADDTORUNSPEED == nil then
--     ADDTORUNSPEED = 11
-- end
-- if type(MARKERRENDERDISTANCE) ~= "number" or MARKERRENDERDISTANCE == nil then
--     MARKERRENDERDISTANCE = 200
-- end
-- if type(FATPLAYERSSIZE) ~= "number" or FATPLAYERSSIZE == 0 or FATPLAYERSSIZE == nil then
--     FATPLAYERSSIZE = 2
-- end
-- if type(THINFRIENDSSIZE) ~= "number" or THINFRIENDSSIZE == 0 or THINFRIENDSSIZE == nil then
--     THINFRIENDSSIZE = 0.3
-- end

-- if type(PARTFORSCALE) ~= "string" or PARTFORSCALE == nil then
--     PARTFORSCALE = "LowerTorso"
-- end
-- if type(CHOOSECUSTOMPOSE) ~= "string" or CHOOSECUSTOMPOSE == nil then
--     CHOOSECUSTOMPOSE = "T-Pose"
-- end
-- if type(CHOOSESTANDPOSE) ~= "string" or CHOOSESTANDPOSE == nil then
--     CHOOSESTANDPOSE = CHOOSECUSTOMPOSE
-- end
-- if type(SPECTATORKEY) ~= "string" or SPECTATORKEY == nil then
--     SPECTATORKEY = "J"
-- end
-- if type(FINDSTANDS) ~= "table" or FINDSTANDS == {} or FINDSTANDS == nil then
--     FINDSTANDS = {
--         ["Star Platinum"] = true,
--         ["Hermit Purple"] = true,
--         ["Gold Experience"] = true,
--         ["Crazy Diamond"] = true,
--         ["Stone Free"] = true,
--     }
-- end
-- if type(FINDSPECS) ~= "table" or FINDSPECS == {} or FINDSPECS == nil then
--     FINDSPECS = {
--         ["Boxing"] = false,
--         ["Hamon (Caesar Zeppeli)"] = false,
--         ["Hamon (Jonathan Joestar)"] = true,
--         ["Hamon (Joseph Joestar)"] = true,
--         ["Hamon (William Zeppeli)"] = false,
--         ["Spin"] = false,
--         ["SwordStyle"] = false,
--         ["Vampirism"] = false,}
-- end




if not getgenv().IsValeraScriptRunning then
getgenv().IsValeraScriptRunning = true

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ContextActionService = game:GetService("ContextActionService")
local Workspace = game:GetService("Workspace")
local Stats = game:GetService("Stats")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local living = Workspace:WaitForChild("Living",10)
local OneFrameWait = function() return RunService.Stepped:Wait() end
local plr = Players.LocalPlayer
local plrCharacter = plr.Character
local IYMouse = plr:GetMouse()
local camera = Workspace.CurrentCamera
local PlayerGui = plr:WaitForChild("PlayerGui")

local GetPing = function()
    return Stats.PerformanceStats.Ping:GetValue()
end

-- local BuffRunConnect
local AlwaysSprintingConnect
local ClosestTsConnection
local FightKickFlag = false


--- L - отключить скрипт
local IsRunning = function ()
    if plrCharacter:GetAttribute("Sprinting") then
        return true
    end
    return false
end

local GetClosestPlayerFromCursor = function()
	local closestplr
    local closestpos = 100000
    for _,v in pairs(Players:GetPlayers()) do
        if v.Character and v.Character:FindFirstChild("HumanoidRootPart") and v.Name ~= plr.Name then
            local mag = (IYMouse.Hit.p - v.Character.HumanoidRootPart.CFrame.Position).Magnitude
            if mag < closestpos then
                closestplr = v
                closestpos = mag
            end
        end
    end
    if closestplr then print(closestplr.Name); return closestplr;
    else print("No closest players found") return end
end

local TeleportCamera = function (targetCharacter)
    local targetHRP = targetCharacter:FindFirstChild("LowerTorso")
    local targetHumanoid = targetCharacter:FindFirstChild("Humanoid")
    if targetHumanoid then
        RunService:BindToRenderStep("TeleportCameraConnection", 1, function()
            if targetCharacter and targetCharacter:FindFirstChild("HumanoidRootPart") then
                camera.CameraSubject = targetHRP
            else
                RunService:UnbindFromRenderStep("TeleportCameraConnection")
                camera.CameraSubject = plrCharacter.Humanoid
            end
        end)
    end
end

local spectatorFlag = false
local SpectatorConnection
SpectatorConnection = UserInputService.InputBegan:Connect(function (input, gameProcessed)
    if input.KeyCode == Enum.KeyCode[SPECTATORKEY] and not gameProcessed then
        if not spectatorFlag then
            TeleportCamera (GetClosestPlayerFromCursor().Character)
        else
            RunService:UnbindFromRenderStep("TeleportCameraConnection")
        end
        spectatorFlag = not spectatorFlag
    end
end)

local StartSprinting = function()
    if plrCharacter and plrCharacter:FindFirstChild("RemoteFunction") then
        plrCharacter.RemoteFunction:InvokeServer("StartSprinting")
    end
end

local increment = 0.1
local function updatePosition()
    local animator
    if plrCharacter:FindFirstChild("Humanoid") then
        animator = plrCharacter.Humanoid:FindFirstChild("Animator")
    else
        return
    end
    local isClimbing = false
    
    -- Проверяем, проигрывается ли анимация лазания
    for _, track in pairs(animator:GetPlayingAnimationTracks()) do
        if track.Name == "climb" then
            isClimbing = true
            break
        end
    end
    
    -- Логика, если персонаж не лазает
    if FightKickFlag == true then
        local lookDirection = plrCharacter.HumanoidRootPart.CFrame.lookVector
        if plrCharacter.Humanoid.MoveDirection.Magnitude > 0 then
            plrCharacter.HumanoidRootPart.CFrame = plrCharacter.HumanoidRootPart.CFrame
            - plrCharacter.Humanoid.MoveDirection * (24 / 136) * (plrCharacter.Humanoid.WalkSpeed/10)
            + plrCharacter.Humanoid.MoveDirection * increment
        else
            plrCharacter.HumanoidRootPart.CFrame = plrCharacter.HumanoidRootPart.CFrame + lookDirection * increment
        end
        if increment < 0 then
            increment = increment - 0.003
        else
            increment = increment + 0.003
        end
        increment = -increment
    elseif IsRunning() and plrCharacter.Humanoid.MoveDirection.Magnitude > 0 and plrCharacter.Blocking_Capacity.Value == 0 and plrCharacter.Humanoid.WalkSpeed > 0 then
        if not isClimbing then
            plrCharacter.HumanoidRootPart.CFrame = plrCharacter.HumanoidRootPart.CFrame + plrCharacter.Humanoid.MoveDirection * (24 / 136) * ADDTORUNSPEED/10
        elseif UserInputService:IsKeyDown(Enum.KeyCode.W) then
            plrCharacter.HumanoidRootPart.CFrame = plrCharacter.HumanoidRootPart.CFrame + Vector3.new(0, (24 / 170) * ADDTORUNSPEED/10, 0)
        elseif UserInputService:IsKeyDown(Enum.KeyCode.S) then
            plrCharacter.HumanoidRootPart.CFrame = plrCharacter.HumanoidRootPart.CFrame - Vector3.new(0, (24 / 170) * ADDTORUNSPEED/10, 0)
        end
    end
end






local FightKick = function()
    plrCharacter:WaitForChild("HumanoidRootPart")
    FightKickFlag = true
    -- plr.DevEnableMouseLock = false
    -- UserInputService.MouseBehavior = Enum.MouseBehavior.Default
    -- local function blockInput(actionName, inputState, inputObject)
    --     return Enum.ContextActionResult.Sink -- Игнорируем весь ввод
    -- end
    -- ContextActionService:BindAction("BlockInput", blockInput, false, unpack(Enum.UserInputType:GetEnumItems()))
    while increment < 0.25 do
        OneFrameWait()
        -- print(increment)
    end
    FightKickFlag = false
    wait(0.5)
    -- plr.DevEnableMouseLock = true
    -- ContextActionService:UnbindAction("BlockInput")
    increment = 0.1
end

local DestroyAim = function ()
    local bodypart = plrCharacter.HumanoidRootPart
    if bodypart:FindFirstChild("AimAttachment0") then
        bodypart.AimAttachment0:Destroy()
    end
    if bodypart:FindFirstChild("AimAttachment1") then
        bodypart.AimAttachment1:Destroy()
    end
    if bodypart:FindFirstChild("Aim") then
        bodypart.Aim:Destroy()
    end
end

local CreateAim = function ()
    local bodypart = plrCharacter:WaitForChild("HumanoidRootPart")
    local beam = Instance.new("Beam")
    beam.Name = "Aim"
    local attachment0 = Instance.new("Attachment")
    attachment0.Name = "AimAttachment0"
    local attachment1 = Instance.new("Attachment")
    attachment1.Name = "AimAttachment1"
    attachment0.Parent = bodypart
    attachment1.Parent = bodypart
    local AimOffset = Vector3.new(0.5,0,0)
    local AimLen = 20
    attachment0.CFrame = CFrame.new(Vector3.new(0,0,0) + AimOffset)
    attachment1.CFrame = CFrame.new(Vector3.new(0,0,-AimLen) + AimOffset)
    beam.Color = ColorSequence.new(Color3.fromRGB(255, 0, 0))

    beam.Parent = bodypart
    beam.FaceCamera = true
    beam.Attachment0 = attachment0
    beam.Attachment1 = attachment1

    beam.Width0 = 0.5 -- Толщина в начале
    beam.Width1 = 0.5 -- Толщина в конце
    beam.Segments = 1
    beam.Transparency = NumberSequence.new(0.85)
end

local AdjustHumanoidHpDistance = function ()
    plr.HealthDisplayDistance = math.huge
    plr.NameDisplayDistance = math.huge
end
local ToNormalHumanoidHpDistance = function ()
    plr.HealthDisplayDistance = 45
    plr.NameDisplayDistance = 45
end


local OnCharacterAdded = function(character)
    plrCharacter = character
    if AIM then
        CreateAim()
    end

    RunService:UnbindFromRenderStep("BuffRunConnect")
    if AlwaysSprintingConnect then
        AlwaysSprintingConnect:Disconnect()
        AlwaysSprintingConnect = nil
    end

    RunService:BindToRenderStep("BuffRunConnect", 1, updatePosition)
    AlwaysSprintingConnect = RunService.Stepped:Connect(StartSprinting)
    
    FightKick()

    AdjustHumanoidHpDistance()
end
---toggle stand
local ToggleStand = function (toggle)
    if plrCharacter and plrCharacter.RemoteEvent then
        local remote = plrCharacter.RemoteEvent
        local args
        if toggle then
            if toggle == "On" then
                args = {
                    [1] = "ToggleStand",
                    [2] = "Uzu"
                }
            end
            if toggle == "Off" then
                if not plrCharacter.SummonedStand.Value then
                    return
                end
                args = {
                    [1] = "ToggleStand",
                    [2] = "Toggle"
                }
            end
        elseif toggle == nil then
            args = {
                [1] = "ToggleStand",
                [2] = "Toggle"
            }
        end
        remote:FireServer(unpack(args))
    end
end
local StandOnConnection
local StandOnKeyCode = plr.PlayerStats.StandKey.Value
StandOnConnection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode[StandOnKeyCode] and not gameProcessed then
        if plrCharacter then
            local standMorph = plrCharacter:FindFirstChild("StandMorph")
            local soundFound
            local IsStand = plrCharacter.SummonedStand
            if standMorph then
                for _, v in pairs(standMorph:GetDescendants()) do
                    if not plrCharacter:FindFirstChild("StandMorph") then break end
                    if v:isA("Sound") and v.SoundId == "rbxassetid://1438146024" then
                        soundFound = true
                        print("soundFound")
                        break
                    end
                end
            end
            if (not IsStand.Value or IsStand.Value and soundFound) then
                print("Enabling stand...")
                while(plrCharacter and plrCharacter.SummonedStand and IsStand.Value) do wait(0.1); print("waiting cd...") end
                while plrCharacter and not IsStand.Value do OneFrameWait(); ToggleStand("On") end
            end
        end
    end
end)

local BarrierConnection = game.Workspace.ChildAdded:Connect(function(descendant)
    if descendant.Name == "Emerald Barrier" then
        wait(0.1)
        for _, v in pairs(descendant:GetChildren()) do
            if v.Name == "Part" then
                v.Transparency = 0.475
            end
        end
    end
end)

------ TS notificator
-- local IsAnimation = function (player, animationID)
--     if not player or not player:FindFirstChild("StandMorph") then
--         return false
--     end
--     local standMorph = player:FindFirstChild("StandMorph")
--     local humanoid = standMorph:FindFirstChild("AnimationController")
--     if humanoid then
--         local animator = humanoid:WaitForChild("Animator",3)
--         for _, track in pairs(animator:GetPlayingAnimationTracks()) do
--             if track.Animation.AnimationId  == animationID then
--                 return true
--             end
--         end
--     end
--     return false
-- end
-- local bannedStands = {
--     ["Gold Experience Requiem"] = true,
--     ["D4C Love Train"] = true,
--     ["C-Moon"] = true,
--     ["Hierophant Green"] = true,
--     ["Chariot Requiem"] = true,
-- }
-- local FindTsing = function(position)
-- 	for _, plyr in ipairs(living:GetChildren()) do
--         if plyr and plyr:FindFirstChild("HumanoidRootPart") then
--             local playerPosition = plyr.HumanoidRootPart.Position
--             local distance = (playerPosition - position).Magnitude
--             if distance < 200 then
--                 local standMorph = plyr:FindFirstChild("StandMorph")
--                 if standMorph and standMorph:FindFirstChild("Stand Name") then
--                     if not bannedStands[standMorph:FindFirstChild("Stand Name").Value]  then
--                         -- print(plyr.Name.." dist = "..distance.." TS = ", IsAnimation(plyr, "rbxassetid://4139325504")) -- Печать расстояния для каждого игрока
--                         if IsAnimation(plyr, "rbxassetid://4139325504") then --ts id
--                             return plyr
--                         end
--                     end
--                 end
--             end
--         end
--     end
--     return nil
-- end

-- local TsGui
-- local CreateFrame = function (foundName)
--     if TsGui then
--         return
--     end
--     -- Получаем игрока и его экран (TsGui)
--     local playerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
--     -- Создаем ScreenTsGui
--     TsGui = Instance.new("ScreenGui")
--     TsGui.Parent = playerGui

--     -- Создаем Frame
--     local frame = Instance.new("Frame")
--     frame.Size = UDim2.new(0.3, 0, 0.1, 0) -- Размер 30% ширины и 10% высоты экрана
--     frame.Position = UDim2.new(0.35, 0, 0, 0) -- Позиция сверху по центру
--     frame.BackgroundColor3 = Color3.fromRGB(100, 0, 0) -- Цвет фона
--     frame.Parent = TsGui
--     -- Создаем текстовое поле с предложением
--     local textLabel = Instance.new("TextLabel")
--     textLabel.Size = UDim2.new(1, 0, 1, 0) -- Полный размер внутри фрейма
--     textLabel.Position = UDim2.new(0, 0, 0, 0)
--     textLabel.Text = foundName
--     textLabel.TextColor3 = Color3.fromRGB(200, 200, 200) -- Цвет текста
--     textLabel.BackgroundTransparency = 1 -- Прозрачный фон для текста
--     textLabel.Font = Enum.Font.SourceSans
--     textLabel.TextScaled = true -- Масштаб текста по размеру фрейма
--     textLabel.Parent = frame
--     print("TsGUI создан")
--     delay(4, function()
--         while TsGui and OneFrameWait() do
--             TsGui:Destroy()
--             TsGui = nil
--         end
--     end)
-- end

-- ClosestTsConnection = RunService.Stepped:Connect(function ()
--     if plrCharacter:FindFirstChild("HumanoidRootPart") then
--         local found = FindTsing(plrCharacter.HumanoidRootPart.Position)
--         if found then
--             CreateFrame(found.Name)
--         end
--     end
-- end)

--- Макросы на спек
local MacrosConnection
local TrueStandKeyBinds = {}
local TrueSpecKeyBinds = {}
local specItem
function FindKeyByValue(t, value)
    for key, val in pairs(t) do
        if val == value then
            return key
        end
    end
    return nil
end
local GetSkill = function (keycode)
    keycode = tostring(keycode)
    print(keycode)
    local skill
    local firstPrioritySkills, secondPrioritySkills =
    table.clone(TrueSpecKeyBinds), table.clone(TrueStandKeyBinds)
    local IsStand = plrCharacter:FindFirstChild("SummonedStand")
    if STANDSKILLSPRIORITY and IsStand and IsStand.Value then
        firstPrioritySkills, secondPrioritySkills =
        secondPrioritySkills, firstPrioritySkills
    end
    if UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) and secondPrioritySkills[keycode] then
        skill = secondPrioritySkills[keycode]
    elseif firstPrioritySkills[keycode] then
        skill = firstPrioritySkills[keycode]
    elseif secondPrioritySkills[keycode] then
        skill = secondPrioritySkills[keycode]
    elseif keycode == "Enum.KeyCode."..plr:WaitForChild("PlayerStats").DashKey.Value then
        print("D")
        skill = "Dash"
    elseif keycode == tostring(Enum.KeyCode.P) then
        print("P")
        skill = "StartPosing"
    end
    print(skill)
    return skill
end
local GetSpecItem = function ()
    local Specs = {
        ["Boxing"] = "Boxing Gloves",
        ["Hamon (Caesar Zeppeli)"] = "Pluck",
        ["Hamon (Jonathan Joestar)"] = "Pluck",
        ["Hamon (Joseph Joestar)"] = "Pluck",
        ["Hamon (William Zeppeli)"] = "Pluck",
        ["Spin"] = "Steel Ball",
        ["SwordStyle"] = "Pluck",
        ["Vampirism"] = "Umbrella",
    }
    if plr.PlayerStats:FindFirstChild("Spec") then
        return Specs[plr.PlayerStats.Spec.Value]
    end
end

local ForceStand = function ()
    local lookDirection
    if plrCharacter and plrCharacter:FindFirstChild("HumanoidRootPart") then
        lookDirection = plrCharacter.HumanoidRootPart.CFrame.lookVector
    end
    if plrCharacter and plrCharacter:FindFirstChild("StandMorph") then
        wait(0.34)   
        for i = 0, 2 do
            OneFrameWait()
        end
        local part = Instance.new("BodyAngularVelocity", plrCharacter.StandMorph.HumanoidRootPart)
        local b = 999999999
        part.MaxTorque = Vector3.new(b, b, b) * 1000
        plrCharacter.StandMorph.HumanoidRootPart.StandAttach.AlignOrientation.MaxTorque = b
        plrCharacter.StandMorph.HumanoidRootPart.StandAttach.AlignOrientation.Responsiveness = 200
        part.AngularVelocity = Vector3.new(plrCharacter.HumanoidRootPart.CFrame.lookVector.Z, 0, -plrCharacter.HumanoidRootPart.CFrame.lookVector.X) * -b
        for i = 0, 2 do
            OneFrameWait()
        end
        part.AngularVelocity = Vector3.new(0, 0, 0)
        part:Destroy()
        wait(0.5)
        plrCharacter.StandMorph.HumanoidRootPart.StandAttach.AlignOrientation.MaxTorque = "inf"
        plrCharacter.StandMorph.HumanoidRootPart.StandAttach.AlignOrientation.Responsiveness = 70
        OneFrameWait()
        plrCharacter.StandMorph.HumanoidRootPart.StandAttach.AlignOrientation.MaxTorque = 100000
    end
end
local DoubleActivationSkills = {
    "Crossfire Hurricane",
}
local IsOnCooldown = function (skill)
    if plr.PlayerGui.HUD.Cooldowns.Frame:FindFirstChild(skill) and not FindKeyByValue(DoubleActivationSkills, skill) then
        return true
    end
    return false
end

local StopSkill = function (skill, A_1)
    if plrCharacter and plrCharacter.RemoteEvent then
        local remote = plrCharacter.RemoteEvent
        local args = {
            [1] = "MobileSkillInputEnded",
            [2] = skill
        }
        if A_1 then
            args[1] = A_1
        end
        remote:FireServer(unpack(args))
    end
end

local AimHelpSkillsList = {
    "String Pilot",
    "Lightning Jabs",
    "Vine Trap 2",
    "Rod Pull",
    "Zipper Extension",
    "Skull Crusher",
    "Wormhole Nails",
    "Wormhole Uppercut",
    "Dimensional Victim Clone",
    "Infinite Speed",
    "Time Switch"
    }



local TeleportCamera = function (targetCharacter)
    local targetHRP = targetCharacter:FindFirstChild("LowerTorso")
    local targetHumanoid = targetCharacter:FindFirstChild("Humanoid")
    if targetHumanoid then
        RunService:BindToRenderStep("TeleportCameraConnection", 1, function()
            if targetCharacter and targetCharacter:FindFirstChild("HumanoidRootPart") then
                camera.CameraSubject = targetHRP
                camera.CameraType = Enum.CameraType.Scriptable
                local targetVelocityVector = targetHRP.AssemblyLinearVelocity
                if targetVelocityVector.Magnitude == 0 then targetVelocityVector = targetHRP.CFrame.lookVector end
                local targetHRPpos = targetHRP.Position
                camera.CFrame = CFrame.lookAt(targetHRPpos + targetVelocityVector.Unit * 2, targetHRPpos)
            else
                RunService:UnbindFromRenderStep("TeleportCameraConnection")
                camera.CameraSubject = plrCharacter.Humanoid
            end
        end)
    end
end



local SkillAimHelp = function ()
    local targetPlayer = GetClosestPlayerFromCursor()
    if targetPlayer then
        TeleportCamera(targetPlayer.Character)
    end
end

local IsSkillUsing = {}
local UseSkill = function (skill, A_1)
    if not skill then skill = "m" end
    if FindKeyByValue(TrueStandKeyBinds, skill) and not plrCharacter.SummonedStand.Value then ToggleStand("On"); return end
    if not IsSkillUsing[skill] then
        IsSkillUsing[skill] = true
    else
        return
    end
    local item
    local backpack = plr.Backpack
    local CurrentTool = plrCharacter:FindFirstChildOfClass("Tool")
    if FindKeyByValue(TrueSpecKeyBinds,skill) then
        item = backpack:FindFirstChild(specItem) or plrCharacter:FindFirstChild(specItem)
    end
    if CurrentTool then
        CurrentTool.Parent = backpack
    end
    if item and not IsOnCooldown(skill) then
        item.Parent = plrCharacter
    end
    
    local camtpflag
    local CameraSafe
    if FindKeyByValue(AimHelpSkillsList, skill) and not IsOnCooldown(skill) then
        SkillAimHelp()
        camtpflag = true
        CameraSafe = camera.CFrame
        -- wait(0.1)
    end

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
    
    
    if item then
        item.Parent = backpack
    end
    if CurrentTool then
        CurrentTool.Parent = plrCharacter
    end

    if camtpflag then
        for i = 0,10,1 do
            OneFrameWait()
        end
        RunService:UnbindFromRenderStep("TeleportCameraConnection")
        camera.CFrame = CameraSafe
    end

    if skill == "Impale" and IMPALEGLITCHFLAG then
        ForceStand()
    end
    if IsSkillUsing[skill] then
        IsSkillUsing[skill] = false
    end
end


local StopBlocking = function()
    if plrCharacter and plrCharacter.RemoteEvent then
        plrCharacter.RemoteEvent:FireServer("StopBlocking")
    end
end


wait(0.1)
specItem = GetSpecItem()
local ExceptSkills = {
    "Stand Barrage",
    "Stand Barrage Finisher",
    "Heavy Chop",
    "Dash",
    "StartPosing"
}

local GetCustomKeyCodes = function (MovesetType : string)
    if not MovesetType then return end
    local args = {
        [1] = "ReturnSkillInfoInTree",
        [2] = {
            ["Skills"] = {},
            ["Type"] = MovesetType
        }
    }
    for i, key in ipairs(plrCharacter[MovesetType.."Skills"]:GetChildren()) do
        args[2]["Skills"][i] = key.Value
    end
    local KeyCodesArray = game:GetService("Players").LocalPlayer.Character.RemoteFunction:InvokeServer(unpack(args))
    local ReturnArray = {}
    for i, v in pairs(KeyCodesArray) do
        print(i, v["AssignedKey"])
        if v["AssignedKey"] ~= "NONE" then
            ReturnArray["Enum.KeyCode."..v["AssignedKey"]] = i
        end
    end

    return ReturnArray
end


if plrCharacter:FindFirstChild("StandSkills") then
    for Ckey, Cval in pairs(GetCustomKeyCodes("Stand")) do
        local HasLearned = plr.StandSkillTree:FindFirstChild(Cval)
        if FindKeyByValue(ExceptSkills, Cval) or (HasLearned and HasLearned.Value == true) then
            print("Custom:",Cval, "bind to", Ckey)
            if not TrueStandKeyBinds[Ckey] or TrueStandKeyBinds[Ckey] and not FindKeyByValue(ExceptSkills, TrueSpecKeyBinds[Ckey]) then
                TrueStandKeyBinds[Ckey] = Cval
            end
        end
    end
    -- TrueStandKeyBinds[Ckey] = Cval
    for _, key in pairs(plrCharacter.StandSkills:GetChildren()) do
        local keyvalue = key.Value
        local HasLearned = plr.StandSkillTree:FindFirstChild(keyvalue)
        if (FindKeyByValue(ExceptSkills, keyvalue) or not FindKeyByValue(TrueStandKeyBinds, keyvalue) and HasLearned and HasLearned.Value == true) and
        not TrueStandKeyBinds[key.Name] then
            print("Default:",keyvalue, "bind to", key.Name)
            TrueStandKeyBinds[key.Name] = keyvalue
        end
    end
end

if plrCharacter:FindFirstChild("SpecSkills") then
    for Ckey, Cval in pairs(GetCustomKeyCodes("Spec")) do
        local HasLearned = plr.SpecSkillTree:FindFirstChild(Cval)
        if HasLearned and HasLearned.Value == true then
            print("Custom:",Cval, "bind to", Ckey)
            TrueSpecKeyBinds[Ckey] = Cval
        end
    end
    for _, key in pairs(plrCharacter.SpecSkills:GetChildren()) do
        local keyvalue = key.Value
        local HasLearned = plr.SpecSkillTree:FindFirstChild(keyvalue)
        if not FindKeyByValue(TrueSpecKeyBinds, keyvalue) and HasLearned and HasLearned.Value == true then
            print("Default:",keyvalue, "bind to", key.Name)
            TrueSpecKeyBinds[key.Name] = keyvalue
        end
    end
end

local FoundPoses = {}
local AddPoseToMemory = function (Pose)
    if not FoundPoses[Pose.Name] then
        FoundPoses[Pose.Name] = Pose
    end
end
local GetPoseByName = function (Name)
    local animDir = ReplicatedStorage:FindFirstChild("Anims")
    local foundAnim
    for _, v in pairs(animDir:GetDescendants()) do
        if v:IsA("Animation") and v.Name == Name then
            foundAnim = true
            AddPoseToMemory(v)
        end
    end
    if not foundAnim then
        warn(`No poses with provided name \"{CHOOSECUSTOMPOSE}\" found`)
        AddPoseToMemory(game:GetService("ReplicatedStorage").Anims.Poses["T-Pose"])
    end
end
local StartPosing = function ()
    if CUSTOMPOSE then
        UseSkill({  ["PlayerIdle"] = FoundPoses[CHOOSECUSTOMPOSE],
                    ["StandIdle"] = FoundPoses[CHOOSESTANDPOSE]}, 
        "StartPosing")
    else
        UseSkill(_,"StartPosing")
    end
end

local StopPosing = function ()
    if plrCharacter.HumanoidRootPart:FindFirstChild("Menacing") then
        print("StopPOSING")
        UseSkill(_,"StopPosing")
    end
end
GetPoseByName(CHOOSECUSTOMPOSE)
GetPoseByName(CHOOSESTANDPOSE)

local NoSpamSkills = {
    "Shell Form",
    "Turtle Form",
}
local HandleHotkey = function (actionName, inputState, InputObject)
    if inputState == Enum.UserInputState.Begin then
        print("InputObject.KeyCode"..tostring(InputObject.KeyCode))
        local skill = GetSkill(InputObject.KeyCode)
        while UserInputService:IsKeyDown(InputObject.KeyCode) and OneFrameWait() do
            if plrCharacter and skill and not IsOnCooldown(skill) then
                if plrCharacter.Blocking_Capacity.Value ~= 0 then
                    StopBlocking()
                end
                if skill == "Dash" then
                    if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                        UseSkill({["HoldD"] = true}, skill)
                    elseif UserInputService:IsKeyDown(Enum.KeyCode.A) then
                        UseSkill({["Hold_daA"] = true}, skill)
                    elseif UserInputService:IsKeyDown(Enum.KeyCode.W) then
                        UseSkill({["HoldW"] = true}, skill)
                    else
                        UseSkill({["Hold_daS"] = true}, skill)
                    end
                end
                if skill == "StartPosing" then
                    StartPosing()
                    break
                end
                StopPosing()
                if UserInputService:IsKeyDown(Enum.KeyCode.M) and not IsOnCooldown("Epitaph")  then
                    UseSkill("Epitaph")
                    UseSkill(skill)
                else
                    UseSkill(skill)
                end
                if FindKeyByValue(NoSpamSkills, skill) then
                    break
                end
            end
            if skill == "Hamon Breathing" or skill == "Spin Charge" then --- добавить глайд ВА
                while UserInputService:IsKeyDown(InputObject.KeyCode) do
                    OneFrameWait()
                end
                break
            end
        end
        StopSkill(skill)
    end
end
local BindedHotkeys = {}
local function getTableSize(tbl)
    local count = 0
    for _ in pairs(tbl) do
        count = count + 1
    end
    return count
end
local UnbindHotkeys = function ()
    if next(BindedHotkeys) ~= nil then
        for actionName, _ in pairs(BindedHotkeys) do
            print("Action [" .. actionName .. "] deleted.")
            ContextActionService:UnbindAction(actionName)
            BindedHotkeys[actionName] = nil
        end
    else
        print("Нет горячих клавиш для удаления")
    end
end
local BindHotkey = function (key)
    local keyCode = Enum.KeyCode[key:match("KeyCode%.(%w+)")]
    local actionName = key
    
    if not BindedHotkeys[actionName] then
        -- Добавляем действие в таблицу биндов
        BindedHotkeys[actionName] = actionName
        print("ContextActionService:BindAction",
            actionName,
            HandleHotkey,
            true,
            keyCode
        )
        ContextActionService:BindAction(
            actionName,
            HandleHotkey,
            true,
            keyCode
        )
        if BindedHotkeys[actionName] then
            print("Hotkey добавлен в список с ключом ", typeof(actionName), actionName)
            -- После добавления, считаем количество горячих клавиш
            print("Количество горячих клавиш =", getTableSize(BindedHotkeys))
        end
    end
end

local BindKeys = function ()
    for key, value in pairs(TrueStandKeyBinds) do
        print("Обработана способность {", value, "}, ключ {", key, "}")
        BindHotkey(key)
    end
    for key, value in pairs(TrueSpecKeyBinds) do
        print("Обработана способность {", value, "}, ключ {", key, "}")
        BindHotkey(key)
    end
    BindHotkey("Enum.KeyCode."..plr:WaitForChild("PlayerStats").DashKey.Value)
    BindHotkey("Enum.KeyCode.P")
end
BindKeys()


local ignoreinstances = game.workspace.IgnoreInstances
local MarkAnkh = function(object)
    local direction
    local part
    local UpdateBeamConnection
    if object.Name == "Ankh" then
        object = object:WaitForChild("MeshPart",3)
        part = Instance.new("Part")
        part.Anchored = true
        part.CanCollide = false
        part.Transparency = 1
        part.Parent = object
        part.Position = object.Position
    end
    object:WaitForChild("BodyVelocity",3)
    if object:FindFirstChild("BodyVelocity") then
        if part then
            direction = object:FindFirstChild("BodyVelocity").Velocity.Unit * 175
        else
            direction = object:FindFirstChild("BodyVelocity").Velocity.Unit * 230
        end
        print("UNIT", direction)
    else
        return
    end


    local attachment0 = Instance.new("Attachment", part or object)
    
    local attachment1 = Instance.new("Attachment", part or object)
    
    
    UpdateBeamConnection = RunService.Stepped:Connect(function()
        attachment0.WorldPosition = (part or object).Position
        attachment1.WorldPosition = (part or object).Position + direction
    end)

    local beam = Instance.new("Beam")
    beam.FaceCamera = true
    beam.Attachment0 = attachment0
    beam.Attachment1 = attachment1
    beam.Parent = object

    beam.Width0 = 7 -- Толщина в начале
    beam.Width1 = 0.1 -- Толщина в конце
    beam.Segments = 1
    beam.Transparency = NumberSequence.new(0.9)
    if object.Name == "MeshPart" then
        beam.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255))
    else
        beam.Color = ColorSequence.new(Color3.fromRGB(0, 255, 0))
    end

    -- print("beamCreated")

    wait(3)
    if UpdateBeamConnection then
        UpdateBeamConnection:Disconnect()
        UpdateBeamConnection = nil
    end
    beam:Destroy()
    if part then
        part:Destroy()
    end
end
local ignInstConnect
local OnCrossfireAdded = function (child)
    if child.Name == "CrossFirePiece" or child.Name == "Ankh" then
        MarkAnkh(child)
    end
end
if PETUHVIEW then
    ignInstConnect = ignoreinstances.ChildAdded:Connect(OnCrossfireAdded)
end

function ScalePlayerBody(player, targetscale, partForScale)
    local character = player.Character
    if not character then return end
    local CurrentScale = function ()
        local torso = character:WaitForChild("LowerTorso",5)
        local torsoOriginalSize = torso:WaitForChild("OriginalSize", 5).Value
        return torso.Size / torsoOriginalSize
    end
    local currentScale = CurrentScale()
    local scalePart = function (part, scale)
        if part:IsA("MeshPart") then
            local origSize = part:FindFirstChild("OriginalSize")
            local startValue
            if origSize then startValue = origSize.Value else return end
            part.Size = Vector3.new(
                startValue.X * scale.X,
                startValue.Y * scale.Y,
                startValue.Z * scale.Z
            )
        end
    end
    for _, part in ipairs(partForScale or character:GetDescendants()) do
        scalePart(part, targetscale)
    end
    for _, weld in ipairs(partForScale or character:GetDescendants()) do
        if weld:IsA("Motor6D") or weld:IsA("Weld") then
            local part0 = weld.Part0
            local part1 = weld.Part1
            if part0 and part1 then
                weld.C0 = CFrame.new(
                    weld.C0.X / currentScale.X * targetscale.X,
                    weld.C0.Y / currentScale.Y * targetscale.Y,
                    weld.C0.Z / currentScale.Z * targetscale.Z
                ) * weld.C0.Rotation
                weld.C1 = CFrame.new(
                    weld.C1.X / currentScale.X * targetscale.X,
                    weld.C1.Y / currentScale.Y * targetscale.Y,
                    weld.C1.Z / currentScale.Z * targetscale.Z
                ) * weld.C1.Rotation
            end
        end
    end
end

local IsMyFriend = function (Player)
    return Player:IsFriendsWith(plr.UserId)
end

local ReverceAdjustBody = function (child)
    if not child then return end
    local player = Players:GetPlayerFromCharacter(child)
    if not player or player.Name == plr.Name then return end
    local isFriend = IsMyFriend(player)
    if isFriend then
        ScalePlayerBody(player, Vector3.one, _)
    else
        ScalePlayerBody(player, Vector3.one, child:FindFirstChild(PARTFORSCALE))
    end
end

local AdjustBody = function (child)
    if not child then return end
    local player = Players:GetPlayerFromCharacter(child)
    if not player or player.Name == plr.Name then return end
    local isFriend = IsMyFriend(player)
    if isFriend then
        ScalePlayerBody(player, Vector3.new(THINFRIENDSSIZE, 1, THINFRIENDSSIZE), _)
    else
        ScalePlayerBody(player, Vector3.new(FATPLAYERSSIZE, 1, FATPLAYERSSIZE), child:FindFirstChild(PARTFORSCALE))
    end
end

-- for _, v in pairs(living:GetChildren()) do
--     v:WaitForChild("HumanoidRootPart",10):GetPropertyChangedSignal("Size"):Connect(function ()
--         AdjustBody(v)
--     end)
-- end
-- local AdjustBodyConnection
-- AdjustBodyConnection = living.ChildAdded:Connect(function (child)
--     child:WaitForChild("HumanoidRootPart",10):GetPropertyChangedSignal("Size"):Connect(function ()
--         AdjustBody(child)
--     end)
-- end)

-------

--- Stats module test

local StatsObject = {}
StatsObject.__index = StatsObject

StatsObject.new = function ()
    local self = setmetatable({}, StatsObject)
    self.charContainer = {}
    self.speaker = plr
    self.speakerGui = PlayerGui

    self.SoundStorage = {
        ["m2"] = {
            Id = "163619849",
        },
        ["Tornado Overdrive"] = {
            Id = "92226065106551"
        },
        ["Sendo Overdrive"] = {
            Id = "12074012329"
        },
        ["William Hamon Charge"] = {
            Id = "127153643941446",
        },
        ["Zoom Punch Voice"] = {
            Id = "118514641514532",
        },
        ["fart with reverb"] =
        {
            Id = "6857250477",
            PlaybackRegion = NumberRange.new(0,1),
            VolumeMultiplier = 2,
        },
        ["fart meme"] = {
            Id = "4809574295",
            Delay = 0,
            VolumeMultiplier = 2,
        },
        ["chinese victory"] = {
            Id = "7346078859",
            -- PlaybackRegion = NumberRange.new(0.1,5),
            VolumeMultiplier = 3,
        },
        ["Chinese punch"] = {
            Id = "8383718211",
            VolumeMultiplier = 3,
        },
    }

    self.SoundReplaceList = {
        -- ["Ora Kicks"] = "Fart1"
        ["m2"] = "fart with reverb",
        -- ["Tornado Overdrive"] = "fart meme",
        ["William Hamon Charge"] = "chinese victory",
        ["Zoom Punch Voice"] = "Chinese punch",
        ["Sendo Overdrive"] = "fart meme",
    }

    for _, v in pairs(self.SoundStorage) do
        v.Id = "rbxassetid://"..v.Id
    end

    self.SoundNameWithParam = function (param, value)
        for key, table in pairs(self.SoundStorage) do
            if table[param] and table[param] == value then
                return key
            end
        end
    end

    self.IsCharacterExists = function (character)
        for _, char in pairs(living:GetChildren()) do
            if char == character then
                return true
            end
        end
        return false
    end
    self.AddCharacter = function (character)
        self.charContainer[character] = {
            Holders = {},
        }
        self.charContainer[character].Holders["MainHolder"] = living.ChildRemoved:Connect(function(child)
            if child ~= character then return end
            -- warn(`trying to delete charContainer {child.Name}`)
            if self.charContainer[child] then
                self.DeleteCharacter(child)
                -- warn(`deleted charContainer {child.Name}`)
            end
        end)
        -- warn(`Character {character.Name} added to table`)
    end
    self.DeleteCharacter = function (character)
        if not self.charContainer[character] then
            -- warn(`Character {character.Name} can't be deleted (Not found)`)
            return
        end
        for i, holder in pairs(self.charContainer[character].Holders) do
            holder:Disconnect()
            self.charContainer[character].Holders[i]:Disconnect()
            -- warn(`holder {i} disconnected in {character.Name}`)
        end
        self.charContainer[character] = nil
        wait(30)
        if character and not self.IsCharacterExists(character) then
            warn(`{character.Name} destroyed`)
            character:Destroy()
        end
        -- warn(`Character {character.Name} removed from table`)
    end

    self.CanTs = function (character)
        if not character then return end
        local standkills = character:FindFirstChild("StandSkills")
        if not standkills then return false end
        for _, skill in pairs(standkills:GetChildren()) do
            if skill.Value == "The World" then
                return true
            end
        end
        return false
    end

    self.IsAnimation = function (humanoid, animationID)
        if not humanoid then return end
        if humanoid then
            local animator = humanoid:FindFirstChild("Animator")
            for _, track in pairs(animator:GetPlayingAnimationTracks()) do
                if track.Animation.AnimationId  == animationID then
                    return true
                end
            end
        end
        return false
    end

    self.IsInStun = function (character)
        if character:GetAttribute("StunnedEffect") then return true end
        return false
    end
    self.IsBlockBreak = function (attach)
        if attach and attach:FindFirstChild("10") then
            return true
        end
        return false
    end
    self.IsPerfectBlock = function (attach)
        if attach and attach:FindFirstChild("Spin") then
            return true
        end
        return false
    end

    self.Destroy = function ()
        for character, _ in pairs(self.charContainer) do
            self.DeleteCharacter(character)
        end
        return
    end
    return self
end

function StatsObject:StartMonitoringCharacter(character)
    if self.charContainer[character] then warn(`Object {character.Name} already exists`); return end
    self.AddCharacter(character)
    local PrimaryPart = character:WaitForChild("HumanoidRootPart", 60)
    if not self.IsCharacterExists(character) then warn(`Object {character.Name} doesn't exist`); return end
    if not PrimaryPart then warn(`Object {character.Name} exists, but have no PrimaryPart`); return end
    -- print(`primary part added to {character.Name}, {PrimaryPart.Name}`)

    local Holders = self.charContainer[character].Holders
    
    if FUNSOUNDS then
        spawn(function ()
            self:CreateSoundReplacer(character)
        end)
    end

    if FINDSTANDSANDSPECS then
        spawn(function ()
            self:CreateFindStandsAndSpec(character)
        end)
    end

    if MARKERTOGGLE then
        spawn(function ()
            self:CreateRealPosMarker(character)
        end)
    end
    if HPINDICATOR then
        spawn(function ()
            self:CreateHpIndicator(character)
        end)
    end
    --- TS NOTIFER
    if TSNOTIFER then
        Holders["TsNotiferHolder"] = RunService.Stepped:Connect(function ()
            local summonedStand = character:FindFirstChild("SummonedStand")
            if not summonedStand or not summonedStand.Value then return end
            local canTs = self.CanTs(character)
            if not canTs then return end
            local okDistance = self.speaker:DistanceFromCharacter(PrimaryPart.Position) < 200
            if not okDistance then return end
            local standMorph = character:FindFirstChild("StandMorph")
            if not standMorph then return end
            local animationController = standMorph:FindFirstChild("AnimationController")
            if not animationController then return end
            local isTsAnim = self.IsAnimation(animationController, "rbxassetid://4139325504")
            if isTsAnim then
                self:CreateTsNotifer(character)
            end
        end)
    end
    
    if BBINDICATOR then
        local BlockBreakListening = function()
            if character.Blocking_Capacity.Value ~= 0 then return end
            if not self.charContainer[character] or self.charContainer[character].StunBar then return end
            local attach = character:FindFirstChild("UpperTorso"):WaitForChild("HitAttach",0.03) -- !!!!!!!
            local stunned = self.IsInStun(character)
            if not stunned then return end
            -- warn(character.Name,"stunned", stunned)
            if attach then
                local bb = self.IsBlockBreak(attach)
                if bb then
                    self:CreateStunBar(character, "bb")
                    return
                end
            else
                -- warn(character.Name,"bypassed block", stunned)
                self:CreateStunBar(character, "bypassb")
            end
        end
        local PerfectBlockListening = function()
            if not self.charContainer[character] or self.charContainer[character].StunBar then return end
            local stunned = self.IsInStun(character)
            if not stunned then return end
            local attach = character:FindFirstChild("UpperTorso"):WaitForChild("HitAttach",0.03)
            local pb = self.IsPerfectBlock(attach)
            if stunned and pb then
                self:CreateStunBar(character, "pb")
                return
            end
        end
        local bc = character:WaitForChild("Blocking_Capacity",60)
        if bc then
            Holders["StunBarBbHolder"] = bc:GetPropertyChangedSignal("Value"):Connect(function ()
                BlockBreakListening()
            end)
        end
        Holders["StunBarPbHolder"] = character:GetAttributeChangedSignal("StunnedEffect"):Connect(function ()
            PerfectBlockListening()
        end)
    end
end

function StatsObject:CreateFindStandsAndSpec(character)
    if not character.PrimaryPart then return end
    local charactersPlayer = Players:GetPlayerFromCharacter(character)
    if not charactersPlayer then return end
    local characterStats = charactersPlayer:WaitForChild("PlayerStats", 20)
    if not characterStats then return end
    local Stand = characterStats:WaitForChild("Stand",5).Value
    local Spec  = characterStats:WaitForChild("Spec",5).Value
    local IsStand, IsSpec = FINDSTANDS[Stand], FINDSPECS[Spec]
    if FINDALLPLAYERS == true then IsStand, IsSpec = true, true end
    if not (IsStand or IsSpec) then return end
    self.charContainer[character].FindStandsAndSpec = true

    local Gui = Instance.new("BillboardGui", character.HumanoidRootPart)
    Gui.Name = "FindStandsAndSpec"
    Gui.Size = UDim2.new(4, 0, 1, 0)
    Gui.StudsOffset = Vector3.new(0, 10, 0)
    Gui.AlwaysOnTop = true
    Gui.Adornee = character.HumanoidRootPart

    local CharName = Instance.new("TextLabel", Gui)
    CharName.Name = "CharName"
    CharName.Size = UDim2.new(1, 0, 1, 0)
    CharName.BackgroundTransparency = 1
    CharName.TextColor3 = Color3.fromRGB(255, 0, 0)
    CharName.TextStrokeTransparency = 0
    CharName.Font = Enum.Font.SourceSansBold
    CharName.TextSize = 15
    CharName.Text = string.format("Name: %q \n\n\n\n", character.Name)

    local FindStand
    if IsStand then
        FindStand = Instance.new("TextLabel", Gui)
        FindStand.Name = "FindStand"
        FindStand.Size = UDim2.new(1, 0, 1, 0)
        FindStand.BackgroundTransparency = 1
        FindStand.TextColor3 = Color3.fromRGB(245, 166, 35)
        FindStand.TextStrokeTransparency = 0
        FindStand.Font = Enum.Font.SourceSansBold
        FindStand.TextSize = 15
        FindStand.Text = string.format("Stand: %q \n\n", Stand)
    end

    local FindSpec
    if IsSpec then
        FindSpec = Instance.new("TextLabel", Gui)
        FindSpec.Name = "FindSpec"
        FindSpec.Size = UDim2.new(1, 0, 1, 0)
        FindSpec.BackgroundTransparency = 1
        FindSpec.TextColor3 = Color3.fromRGB(255, 255, 0)
        FindSpec.TextStrokeTransparency = 0
        FindSpec.Font = Enum.Font.SourceSansBold
        FindSpec.TextSize = 15
        FindSpec.Text = string.format("Spec: %q", Spec)
    end

    local Updater
    local Destroy = function ()
        if Updater then
            Updater:Disconnect()
            Updater = nil
        end
        if Gui then
            Gui:Destroy()
        end
        if self.charContainer[character] then
            self.charContainer[character].FindStandsAndSpec = false
        end
    end

    local Update = function ()
        if self.charContainer[character] and self.charContainer[character].FindStandsAndSpec then
        else
            Destroy()
        end
    end

    Updater = RunService.Stepped:Connect(Update)
end

function StatsObject:CreateSoundReplacer(character)
    if not character.PrimaryPart then return end
    self.charContainer[character].SoundReplacer = true

    local SoundStorage = self.SoundStorage
    local SoundNameWithParam = self.SoundNameWithParam
    local SoundReplaceList = self.SoundReplaceList
    -- ["original sound id"] = "custom sound id" -- "original sound" to "custom sound"

    local ReplaceSound = function (originalSoundObject)
        local nameOfOriginalSoundObject = SoundNameWithParam("Id", originalSoundObject.SoundId)
        local customSoundName = SoundReplaceList[nameOfOriginalSoundObject]
        if not customSoundName then warn(`no customSoundName`); return end
        local newSound = Instance.new("Sound", originalSoundObject)
        newSound.SoundId = SoundStorage[customSoundName]["Id"]
        newSound.Volume = originalSoundObject.Volume * (SoundStorage[customSoundName].VolumeMultiplier or 1)
        newSound.Looped = originalSoundObject.Looped
        newSound.PlaybackRegionsEnabled = SoundStorage[customSoundName].PlaybackRegion ~= nil
        newSound.PlaybackRegion = SoundStorage[customSoundName].PlaybackRegion or NumberRange.new(0, 200)

        originalSoundObject.Volume = 0
        wait(SoundStorage[customSoundName].Delay or 0)
        newSound.Playing = true
    end

    local Updater
    local Destroy = function ()
        if Updater then
            Updater:Disconnect()
            Updater = nil
        end
        if self.charContainer[character] then
            self.charContainer[character].SoundReplacer = false
        end
        SoundNameWithParam = nil -- for gc
        SoundStorage = nil
    end

    local Update = function (descendant)
        if self.charContainer[character] and self.charContainer[character].SoundReplacer then
            if not descendant:isA("Sound") then return end
            local nameOfOriginalSoundObject = SoundNameWithParam("Id", descendant.SoundId)
            if not nameOfOriginalSoundObject then return end
            warn(`{nameOfOriginalSoundObject}`)
            if nameOfOriginalSoundObject and SoundReplaceList[nameOfOriginalSoundObject] then
                local originalSoundObject = descendant
                ReplaceSound(originalSoundObject)
            end
        else
            Destroy()
        end
    end

    Updater = character.DescendantAdded:Connect(function (descendant)
        Update(descendant)
    end)
end

function StatsObject:CreateRealPosMarker(character)
    if not character.PrimaryPart then return end

    self.charContainer[character].RealPosMarker = true
    local Marker = Instance.new("Part", character.PrimaryPart)
    Marker.Name = "RealPosMarker"
    Marker.Shape = Enum.PartType.Cylinder
    Marker.Size = Vector3.new(7, 2, 2)
    Marker.Rotation = Vector3.new(0, 0, 90)
    Marker.Color = Color3.fromRGB(0, 200, 200)
    Marker.Transparency = 0.7
    Marker.Anchored = false
    Marker.Massless = true
    Marker.CanCollide = false

    local MarkerWeld = Instance.new("Weld", Marker)
    MarkerWeld.Name = "MarkerWeld"
    MarkerWeld.Part0 = character.HumanoidRootPart
    MarkerWeld.Part1 = Marker

    local Updater
    local Destroy = function ()
        if Updater then
            -- print(`Updater:Disconnect() in {character.Name}`)
            Updater:Disconnect()
            Updater = nil
        end
        if Marker then
            -- print(`Destroying marker in {character.Name}`)
            Marker:Destroy()
        end
        if self.charContainer[character] and self.charContainer[character].RealPosMarker then
            -- print(`RealPosMarker = false in {character.Name}`)
            self.charContainer[character].RealPosMarker = false
        end
    end
    local Update = function ()
        if MarkerWeld and self.charContainer[character] and self.charContainer[character].RealPosMarker and character:FindFirstChild("HumanoidRootPart") then
            local offset = character.HumanoidRootPart.CFrame:VectorToObjectSpace(character.HumanoidRootPart.AssemblyLinearVelocity) * GetPing()/1000 * 1
            MarkerWeld.C0 = CFrame.new(offset) * CFrame.Angles(math.rad(90),math.rad(90),0)
        else
            Destroy()
        end
    end

    Updater = RunService.Stepped:Connect(Update)
end

function StatsObject:CreateTsNotifer(character)
    if not character.HumanoidRootPart then return end
    self.charContainer[character].TsNotifer = true

    -- warn(`{character.Name} TSING`)
    local Gui = Instance.new("ScreenGui", self.speakerGui)
    Gui.Name = "TsGui"

    -- if self.speaker.PrimaryPart then
    --     TsNotifer.TsSoundNotifer = Instance.new("Sound", self.speaker.PrimaryPart) ---!!!!!!!!!!!!!!!!!!! ДОДЕЛАТЬ
    --     local TsSoundNotifer = TsNotifer.TsSoundNotifer
    --     TsSoundNotifer.Name = "TsSoundNotifer"
    -- end

    local TsFrame = Instance.new("Frame", Gui)
    TsFrame.Name = "TsFrame"
    TsFrame.Size = UDim2.new(0.3, 0, 0.1, 0)
    TsFrame.Position = UDim2.new(0.35, 0, 0, 0)
    TsFrame.BackgroundColor3 = Color3.fromRGB(100, 0, 0)

    local TsText = Instance.new("TextLabel", TsFrame)
    TsText.Name = "TsText"
    TsText.Size = UDim2.new(1, 0, 1, 0)
    TsText.Position = UDim2.new(0, 0, 0, 0)
    TsText.Text = character.Name
    TsText.TextColor3 = Color3.fromRGB(200, 200, 200)
    TsText.BackgroundTransparency = 1
    TsText.Font = Enum.Font.SourceSans
    TsText.TextScaled = true

    local Destroy = function ()
        if Gui then -- JJSploit иногда сразу не удаляет
            Gui:Destroy()
        end
        if self.charContainer[character] then
            self.charContainer[character].TsNotifer = false
        end
    end

    wait(4)
    Destroy()
end

function StatsObject:CreateStunBar(character, type)
    if not character.HumanoidRootPart then return end
    self.charContainer[character].StunBar = true

    local Gui = Instance.new("BillboardGui", character.HumanoidRootPart)
    Gui.Name = "StunBarBillboard"
    Gui.Size = UDim2.new(4, 0, 1, 0)
    Gui.StudsOffset = Vector3.new(0, 3, 0)
    Gui.AlwaysOnTop = true

    local GreenBar
    if type ~= "pb" then
        GreenBar = Instance.new("Frame", Gui)
        GreenBar.Name = "GreenBar"
        GreenBar.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        GreenBar.AnchorPoint = Vector2.new(0.5, 0.5)
        GreenBar.Position = UDim2.new(0.5, 0, 0.5, 0)
        GreenBar.BorderSizePixel = 0
    end

    local RedBar
    if type ~= "bypassb" then
        RedBar = Instance.new("Frame", Gui)
        RedBar.Name = "RedBar"
        RedBar.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        RedBar.AnchorPoint = Vector2.new(0.5, 0.5)
        RedBar.Position = UDim2.new(0.5, 0, 0.5, 0)
        RedBar.BorderSizePixel = 0
    end

    local Updater
    local Destroy = function ()
        Updater:Disconnect()
        Updater = nil
        Gui:Destroy()
        if self.charContainer[character] and self.charContainer[character].StunBar then
            self.charContainer[character].StunBar = false
        end
    end
    local startTime = tick()
    local Update = function ()
        local elapsedTime = tick() - startTime
        local greenTime = 3
        local redTime = 2

        -- Обновляем размер зеленой полоски, уменьшая её с обоих концов
        if GreenBar then
            local greenProgress = math.clamp((greenTime - elapsedTime) / greenTime, 0, 1)
            GreenBar.Size = UDim2.new(greenProgress, 0, 0.3, 0)
            GreenBar.Position = UDim2.new(0.5, 0, 0.5, 0)
        end

        -- Обновляем размер красной полоски, уменьшая её с обоих концов
        if RedBar then
            local redProgress = math.clamp((redTime - elapsedTime) / redTime, 0, 1)
            RedBar.Size = UDim2.new(redProgress * 0.66, 0, 0.3, 0) -- Уменьшаем до 66% ширины
            RedBar.Position = UDim2.new(0.5, 0, 0.5, 0)
        end

        -- Удаление индикатора, когда время истекло
        if GreenBar and elapsedTime >= greenTime or not GreenBar and RedBar and elapsedTime >= redTime or
            not self.charContainer[character] or not self.charContainer[character].StunBar then
            Destroy()
        end
    end

    Updater = RunService.Stepped:Connect(Update)
end

function StatsObject:CreateHpIndicator(character)
    if not character.HumanoidRootPart then return end
    self.charContainer[character].HpIndicator = true


    local Gui = Instance.new("BillboardGui", character.HumanoidRootPart)
    Gui.Name = "HpIndicatorBillboard"
    Gui.Size = UDim2.new(4, 0, 1, 0)
    Gui.StudsOffset = Vector3.new(0, 4, 0)
    Gui.AlwaysOnTop = false
    Gui.Adornee = character.HumanoidRootPart

    local HealthText = Instance.new("TextLabel", Gui)
    HealthText.Name = "HealthText"
    HealthText.Size = UDim2.new(1, 0, 1, 0)
    HealthText.BackgroundTransparency = 1
    HealthText.TextColor3 = Color3.fromRGB(255, 0, 0)
    HealthText.TextStrokeTransparency = 0
    HealthText.Font = Enum.Font.SourceSansBold
    HealthText.TextSize = 24

    local Updater
    local Destroy = function ()
        if Updater then
            -- print(`Updater:Disconnect() in {character.Name}`)
            Updater:Disconnect()
            Updater = nil
        end
        if Gui then
            Gui:Destroy()
        end
        if self.charContainer[character] then
            self.charContainer[character].HpIndicator = false
        end
    end

    local Update = function ()
        if HealthText.Parent and self.charContainer[character] and self.charContainer[character].HpIndicator then
            Health = character:FindFirstChild("Health")
            if not Health then return end
            local currentHealth = Health.Value
            local maxHealth = Health.MaxValue
            HealthText.Text = string.format("HP: %d / %d", currentHealth, maxHealth)
        else
            Destroy()
        end
    end

    Updater = RunService.Stepped:Connect(Update)
end



local PlayersControlContainer = StatsObject.new()
local PlayersControlContainerConnection
PlayersControlContainerConnection = living.ChildAdded:Connect(function(child)
    PlayersControlContainer:StartMonitoringCharacter(child)
end)
for _, v in pairs(living:GetChildren()) do
    spawn(function ()
        PlayersControlContainer:StartMonitoringCharacter(v)
    end)
end
---


local RestoreOcean = function ()
    if workspace.Map:FindFirstChild("IMPORTANT") and workspace.Map.IMPORTANT:FindFirstChild("Ocean") then
        workspace.Map:FindFirstChild("IMPORTANT"):FindFirstChild("Ocean").Size = Vector3.new(1, 83.41999816894531, 1)
    end
end
print("\nL для отключения (для включения потребуется перезапуск кода)\n")
OnCharacterAdded(plrCharacter)
local CharacterAddedConnection = plr.CharacterAdded:Connect(OnCharacterAdded)
local ScriptConnection
ScriptConnection = UserInputService.InputBegan:Connect(function (input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.L and not gameProcessed then
        if PlayersControlContainerConnection then
            PlayersControlContainerConnection:Disconnect()
            spawn(function ()
                PlayersControlContainer:Destroy()
            end)
            PlayersControlContainerConnection = nil
        end

        if BlockBreakListeningConnection then
            BlockBreakListeningConnection:Disconnect()
            BlockBreakListeningConnection = nil
        end
        
        ToNormalHumanoidHpDistance()

        if SpectatorConnection then
            SpectatorConnection:Disconnect()
            SpectatorConnection = nil
        end

        DestroyAim()

        if MarkersConnetion then
            MarkersConnetion:Disconnect()
            MarkersConnetion = nil
        end

        -- DestroyMarkers()

        if GetPingConnection then
            GetPingConnection:Disconnect()
            GetPingConnection = nil
        end

        UnbindHotkeys()

        if ignInstConnect then
            ignInstConnect:Disconnect()
            ignInstConnect = nil
        end

        if StandOnConnection then
            StandOnConnection:Disconnect()
            StandOnConnection = nil
        end

        if ClosestTsConnection then
            ClosestTsConnection:Disconnect()
            ClosestTsConnection = nil
        end

        RunService:UnbindFromRenderStep("BuffRunConnect")

        if AlwaysSprintingConnect then
            AlwaysSprintingConnect:Disconnect()
            AlwaysSprintingConnect = nil
        end

        if CharacterAddedConnection then
            CharacterAddedConnection:Disconnect()
            CharacterAddedConnection = nil
        end

        if BarrierConnection then
            BarrierConnection:Disconnect()
            BarrierConnection = nil
        end

        if MacrosConnection then
            MacrosConnection:Disconnect()
            MacrosConnection = nil
        end
        
        if ScriptConnection then
            ScriptConnection:Disconnect()
            ScriptConnection = nil
        end
        RestoreOcean()
        getgenv().IsValeraScriptRunning = false
        print("Скрипт выключен")
    end
end)
local HideOcean = function ()
    if workspace.Map:FindFirstChild("IMPORTANT") and workspace.Map.IMPORTANT:FindFirstChild("Ocean") then
        workspace.Map.IMPORTANT:FindFirstChild("Ocean").Size = Vector3.new(0.1,0.1,0.1)
    end
end
HideOcean()

else
print("Скрипт \"VALERA HUB\" уже запущен")
end