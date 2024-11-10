--- free run script
---Добавить значение к СКОРОСТИ БЕГА (Меньше = меньше шанс кика)

-- PETUHVIEW = true
-- IMPALEGLITCHFLAG = true
-- FATPLAYERS = true
-- THINFRIENDS = true
-- MARKERTOGGLE = true
-- AIM = true
-- ADDTORUNSPEED = 11
-- MARKERRENDERDISTANCE = 200
-- FATPLAYERSSIZE = 3
-- THINFRIENDSSIZE = 0.3
-- CHOOSEPOSE = "T-Pose"
-- CHOOSESTANDPOSE = nil
-- SpectatorKey = "J"

if type(PETUHVIEW) ~= "boolean" or PETUHVIEW == nil then
    PETUHVIEW = true
end
if type(IMPALEGLITCHFLAG) ~= "boolean" or IMPALEGLITCHFLAG == nil then
    IMPALEGLITCHFLAG = true
end
if type(FATPLAYERS) ~= "boolean" or FATPLAYERS == nil then
    FATPLAYERS = true
end
if type(THINFRIENDS) ~= "boolean" or THINFRIENDS  == nil then
    THINFRIENDS = true
end
if type(MARKERTOGGLE) ~= "boolean" or MARKERTOGGLE == nil then
    MARKERTOGGLE = true
end
if type(AIM) ~= "boolean" or AIM == nil then
    AIM = true
end

if type(ADDTORUNSPEED) ~= "number" or ADDTORUNSPEED == nil then
    ADDTORUNSPEED = 11
end
if type(MARKERRENDERDISTANCE) ~= "number" or MARKERRENDERDISTANCE == nil then
    MARKERRENDERDISTANCE = 200
end
if type(FATPLAYERSSIZE) ~= "number" or FATPLAYERSSIZE == nil then
    FATPLAYERSSIZE = 3
end
if type(THINFRIENDSSIZE) ~= "number" or THINFRIENDSSIZE == nil then
    THINFRIENDSSIZE = 0.3
end

if type(CHOOSEPOSE) ~= "string" or CHOOSEPOSE == nil then
    CHOOSEPOSE = "T-Pose"
end
if type(CHOOSESTANDPOSE) ~= "string" or CHOOSESTANDPOSE == nil then
    CHOOSESTANDPOSE = CHOOSEPOSE
end
if type(SpectatorKey) ~= "string" or SpectatorKey == nil then
    SpectatorKey = "J"
end


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
local animDir = ReplicatedStorage:WaitForChild("Anims",10)
if not animDir then
    print("RESTART SCRIPT")
end
local plr = Players.LocalPlayer
local plrCharacter = plr.Character
local IYMouse = plr:GetMouse()
local camera = Workspace.CurrentCamera

local GetPingConnection
local Ping = 0
local GetPing = function()
    Ping = Stats.PerformanceStats.Ping:GetValue()
end
GetPingConnection = RunService.Stepped:Connect(GetPing)

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
    if input.KeyCode == Enum.KeyCode[SpectatorKey] and not gameProcessed then
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
    elseif IsRunning() and plrCharacter.Humanoid.MoveDirection.Magnitude > 0 and plrCharacter.Blocking_Capacity.Value == 0 then
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
    plr.DevEnableMouseLock = false
    UserInputService.MouseBehavior = Enum.MouseBehavior.Default
    -- local function blockInput(actionName, inputState, inputObject)
    --     return Enum.ContextActionResult.Sink -- Игнорируем весь ввод
    -- end
    -- ContextActionService:BindAction("BlockInput", blockInput, false, unpack(Enum.UserInputType:GetEnumItems()))
    while increment < 0.25 do
        RunService.Stepped:wait() 
        -- print(increment)
    end
    FightKickFlag = false
    wait(0.5)
    plr.DevEnableMouseLock = true
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
    AdjustHumanoidHpDistance()
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
StandOnConnection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.Q and not gameProcessed then
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
                while(plrCharacter.SummonedStand and IsStand.Value) do wait(0.1); print("waiting cd...") end
                while plrCharacter and not IsStand.Value do RunService.Stepped:Wait(); ToggleStand("On") end
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
local IsAnimation = function (player, animationID)
    if not player or not player:FindFirstChild("StandMorph") then
        return false
    end
    local standMorph = player:FindFirstChild("StandMorph")
    local humanoid = standMorph:FindFirstChild("AnimationController")
    if humanoid then
        local animator = humanoid:WaitForChild("Animator",3)
        for _, track in pairs(animator:GetPlayingAnimationTracks()) do
            if track.Animation.AnimationId  == animationID then
                return true
            end
        end
    end
    return false
end
local bannedStands = {
    ["Gold Experience Requiem"] = true,
    ["D4C Love Train"] = true,
    ["C-Moon"] = true,
    ["Hierophant Green"] = true,
    ["Chariot Requiem"] = true,
}
local FindTsing = function(position)
	for _, plyr in ipairs(living:GetChildren()) do
        if plyr and plyr:FindFirstChild("HumanoidRootPart") then
            local playerPosition = plyr.HumanoidRootPart.Position
            local distance = (playerPosition - position).Magnitude
            if distance < 200 then
                local standMorph = plyr:FindFirstChild("StandMorph")
                if standMorph and standMorph:FindFirstChild("Stand Name") then
                    if not bannedStands[standMorph:FindFirstChild("Stand Name").Value]  then
                        -- print(plyr.Name.." dist = "..distance.." TS = ", IsAnimation(plyr, "rbxassetid://4139325504")) -- Печать расстояния для каждого игрока
                        if IsAnimation(plyr, "rbxassetid://4139325504") then --ts id
                            return plyr
                        end
                    end
                end
            end
        end
    end
    return nil
end

local TsGui
local CreateFrame = function (foundName)
    if TsGui then
        return
    end
    -- Получаем игрока и его экран (TsGui)
    local playerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
    -- Создаем ScreenTsGui
    TsGui = Instance.new("ScreenGui")
    TsGui.Parent = playerGui

    -- Создаем Frame
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0.3, 0, 0.1, 0) -- Размер 30% ширины и 10% высоты экрана
    frame.Position = UDim2.new(0.35, 0, 0, 0) -- Позиция сверху по центру
    frame.BackgroundColor3 = Color3.fromRGB(100, 0, 0) -- Цвет фона
    frame.Parent = TsGui
    -- Создаем текстовое поле с предложением
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 1, 0) -- Полный размер внутри фрейма
    textLabel.Position = UDim2.new(0, 0, 0, 0)
    textLabel.Text = foundName
    textLabel.TextColor3 = Color3.fromRGB(200, 200, 200) -- Цвет текста
    textLabel.BackgroundTransparency = 1 -- Прозрачный фон для текста
    textLabel.Font = Enum.Font.SourceSans
    textLabel.TextScaled = true -- Масштаб текста по размеру фрейма
    textLabel.Parent = frame
    print("TsGUI создан")
    delay(4, function()
        while TsGui and RunService.Stepped:wait() do
            TsGui:Destroy()
            TsGui = nil
        end
    end)
end

ClosestTsConnection = RunService.Stepped:Connect(function ()
    if plrCharacter:FindFirstChild("HumanoidRootPart") then
        local found = FindTsing(plrCharacter.HumanoidRootPart.Position)
        if found then
            CreateFrame(found.Name)
        end
    end
end)

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
    if UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) and TrueStandKeyBinds[keycode] then
        skill = TrueStandKeyBinds[keycode]
    elseif TrueSpecKeyBinds[keycode] then
        skill = TrueSpecKeyBinds[keycode]
    elseif TrueStandKeyBinds[keycode] then
        skill = TrueStandKeyBinds[keycode]
    elseif keycode == "Enum.KeyCode."..plr:WaitForChild("PlayerStats").DashKey.Value then
        print("D")
        skill = "Dash"
    elseif keycode == tostring(Enum.KeyCode.P) then
        print("P")
        skill = "StartPosing"
    end
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
            RunService.Stepped:Wait()
        end
        local part = Instance.new("BodyAngularVelocity", plrCharacter.StandMorph.HumanoidRootPart)
        local b = 999999999
        part.MaxTorque = Vector3.new(b, b, b) * 1000
        plrCharacter.StandMorph.HumanoidRootPart.StandAttach.AlignOrientation.MaxTorque = b
        plrCharacter.StandMorph.HumanoidRootPart.StandAttach.AlignOrientation.Responsiveness = 200
        part.AngularVelocity = Vector3.new(plrCharacter.HumanoidRootPart.CFrame.lookVector.Z, 0, -plrCharacter.HumanoidRootPart.CFrame.lookVector.X) * -b
        for i = 0, 2 do
            RunService.Stepped:Wait()
        end
        part.AngularVelocity = Vector3.new(0, 0, 0)
        part:Destroy()
        wait(0.5)
        plrCharacter.StandMorph.HumanoidRootPart.StandAttach.AlignOrientation.MaxTorque = "inf"
        plrCharacter.StandMorph.HumanoidRootPart.StandAttach.AlignOrientation.Responsiveness = 70
        RunService.Stepped:Wait()
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
        for i = 0,6,1 do
            RunService.Stepped:wait()
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
            TrueStandKeyBinds[Ckey] = Cval
        end
    end
    -- TrueStandKeyBinds[Ckey] = Cval
    for _, key in pairs(plrCharacter.StandSkills:GetChildren()) do
        local keyvalue = key.Value
        local HasLearned = plr.StandSkillTree:FindFirstChild(keyvalue)
        if FindKeyByValue(ExceptSkills, keyvalue) or 
        (not FindKeyByValue(TrueStandKeyBinds, keyvalue) and HasLearned and HasLearned.Value == true)  then
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
local GetPoseByName = function (Name : string)
    if not Name then
        print("Pose name указан неверно")
        Name = "T-Pose"
    end
    for _, v in pairs(animDir:GetDescendants()) do
        if v:IsA("Animation") and v.Name == Name then
            AddPoseToMemory(v)
        end
    end
end
GetPoseByName(CHOOSEPOSE)
GetPoseByName(CHOOSESTANDPOSE)

local NoSpamSkills = {
    "Shell Form",
    "Turtle Form",
    -- "Hamon Breathing",
    -- "Spin Charge",
}
local HandleHotkey = function (actionName, inputState, InputObject)
    if inputState == Enum.UserInputState.Begin then
        print("InputObject.KeyCode"..tostring(InputObject.KeyCode))
        local skill = GetSkill(InputObject.KeyCode)
        while UserInputService:IsKeyDown(InputObject.KeyCode) and RunService.Stepped:Wait() do
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
                    print("Start Posing")
                    UseSkill({  ["PlayerIdle"] = FoundPoses[CHOOSEPOSE],
                                ["StandIdle"] = FoundPoses[CHOOSESTANDPOSE]}, 
                    skill)
                    break
                end
                if plrCharacter.HumanoidRootPart:FindFirstChild("Menacing") then
                    print("StopPOSING")
                    UseSkill(_,"StopPosing")
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.M) and not IsOnCooldown("Epitaph")  then
                    UseSkill("Epitaph")
                    UseSkill(skill)
                else
                    UseSkill(skill)
                end
                if FindKeyByValue(NoSpamSkills, skill) then
                    break
                end
                -- wait(0.6)
                -- if standMorph and standMorph:FindFirstChild("HumanoidRootPart") then
                --     plrCharacter.StandMorph.HumanoidRootPart.StandAttach.AlignPosition.Responsiveness = 70
                -- end
            end
            if skill == "Hamon Breathing" or skill == "Spin Charge" then
                while UserInputService:IsKeyDown(InputObject.KeyCode) do
                    RunService.Stepped:wait()
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

    print("beamCreated")

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
-----------mark direction
local Markers = {}
local DeleteMarker = function (Name)
    if Markers[Name] then
        Markers[Name]:Destroy()
        Markers[Name] = nil
        -- print("маркер игрока",Name,"удалён")
    end
end
local CreateMarker = function (character)
    local marker = Instance.new("Part")
    if Markers[character.Name] then
        -- print("маркер игрока",character.Name,"уже существует")
        return
    end
    Markers[character.Name] = marker
    -- print("маркер игрока",character.Name,"добавлен")
    local HumanoidRootPart = character.HumanoidRootPart

    marker.Shape = Enum.PartType.Cylinder
    marker.Size = Vector3.new(7, 2, 2)
    marker.Rotation = Vector3.new(0, 0, 90)
    marker.Color = Color3.fromRGB(0, 200, 200)
    marker.Transparency = 0.7
    marker.Anchored = false
    marker.Massless = true
    marker.CanCollide = false
    marker.Parent = HumanoidRootPart

    local weld = Instance.new("Weld")
    weld.Parent = HumanoidRootPart
    weld.Part0 = HumanoidRootPart
    weld.Part1 = marker

    local Connect
    Connect = RunService.Stepped:Connect(function ()
        if not character:FindFirstChild("HumanoidRootPart") or not plrCharacter or not plrCharacter:FindFirstChild("HumanoidRootPart") or
        not Markers[character.Name] or (plrCharacter.HumanoidRootPart.Position - marker.Position).Magnitude > MARKERRENDERDISTANCE then
            Connect:Disconnect()
            Connect = nil
            weld:Destroy()
            DeleteMarker(character.Name)
        else
            local offset = HumanoidRootPart.CFrame:VectorToObjectSpace(character.HumanoidRootPart.AssemblyLinearVelocity) * Ping/1000 * 1.3 --- * character.HumanoidRootPart.AssemblyLinearVelocity.Magnitude
            weld.C0 = CFrame.new(offset) * CFrame.Angles(math.rad(90),math.rad(90),0)
        end
    end)
end
local DestroyMarkers = function ()
    for i, _ in pairs(Markers) do
        DeleteMarker(i)
    end
end
local CreateMarkers = function()
	for _, plyr in ipairs(living:GetChildren()) do
        local humanoidRootPart
        if plyr then humanoidRootPart = plyr:FindFirstChild("HumanoidRootPart") end
        if humanoidRootPart and plrCharacter and plrCharacter:FindFirstChild("HumanoidRootPart") then
            local playerPosition = humanoidRootPart.Position
            local distance = (playerPosition - plrCharacter.HumanoidRootPart.Position).Magnitude
            if plyr.Name ~= plr.Name and distance < MARKERRENDERDISTANCE and not Markers[plyr.Name] and MARKERTOGGLE then
                CreateMarker(plyr)
            end
        end
    end
end
local MarkersConnetion
MarkersConnetion = RunService.Stepped:Connect(CreateMarkers)
---

-- Класс Indicators
Indicators = {}
Indicators.__index = Indicators

-- Таблица для хранения всех индикаторов
Indicators.indicators = {}

-- Конструктор
function Indicators.new()
    local self = setmetatable({}, Indicators)
    return self
end

local indicators = Indicators.new()

-- Удаление индикатора для конкретного игрока
function Indicators:Delete(player)
    local indicator = self.indicators[player]
    if indicator then
        indicator.gui:Destroy()
        self.indicators[player] = nil
    else
        warn("Indicator for this player does not exist!")
    end
end

-- Обновление прогресса оставшегося времени
function Indicators:UpdateProgress(player)
    local indicator = self.indicators[player]
    if indicator then
        local elapsedTime = tick() - indicator.startTime
        local greenTime = 3  -- Время для зеленой полоски
        local redTime = 2    -- Время для красной полоски

        -- Обновляем размер зеленой полоски, уменьшая её с обоих концов
        local greenProgress = math.clamp((greenTime - elapsedTime) / greenTime, 0, 1)
        indicator.greenBar.Size = UDim2.new(greenProgress, 0, 0.3, 0)
        indicator.greenBar.Position = UDim2.new(0.5, 0, 0.5, 0)

        -- Обновляем размер красной полоски, уменьшая её с обоих концов
        local redProgress = math.clamp((redTime - elapsedTime) / redTime, 0, 1)
        indicator.redBar.Size = UDim2.new(redProgress * 0.66, 0, 0.3, 0) -- Уменьшаем до 66% ширины
        indicator.redBar.Position = UDim2.new(0.5, 0, 0.5, 0)

        -- Удаление индикатора, когда время истекло
        if elapsedTime >= greenTime or not player then
            self:Delete(player)
        end
    end
end


-- Создание индикатора для игрока
function Indicators:Create(player)
    if self.indicators[player] then
        warn("Indicator for this player already exists!")
        return
    end
    
    -- Создаем BillboardGui и настраиваем его
    local billboardGui = Instance.new("BillboardGui")
    billboardGui.Size = UDim2.new(10, 0, 5, 0)
    billboardGui.StudsOffset = Vector3.new(0, 3, 0)
    billboardGui.AlwaysOnTop = true
    
    -- Зеленая полоска для 3 секунд, укорачивается с обоих концов
    local greenBar = Instance.new("Frame", billboardGui)
    greenBar.BackgroundColor3 = Color3.fromRGB(0, 255, 0)  -- Зеленый цвет
    greenBar.AnchorPoint = Vector2.new(0.5, 0.5)
    greenBar.Position = UDim2.new(0.5, 0, 0.5, 0)         -- Центрируем полоску
    greenBar.BorderSizePixel = 0

    -- Красная полоска для 1 секунды, укорачивается с обоих концов быстрее
    local redBar = Instance.new("Frame", billboardGui)
    redBar.BackgroundColor3 = Color3.fromRGB(255, 0, 0)    -- Красный цвет
    redBar.AnchorPoint = Vector2.new(0.5, 0.5)
    redBar.Position = UDim2.new(0.5, 0, 0.5, 0)           -- Центрируем полоску
    redBar.BorderSizePixel = 0

    -- Устанавливаем BillboardGui на игрока
    billboardGui.Parent = player:FindFirstChild("Head")
    
    -- Сохраняем индикатор в таблицу
    self.indicators[player] = {gui = billboardGui, greenBar = greenBar, redBar = redBar, startTime = tick()}

    local Connection
    Connection = RunService.Stepped:Connect(function ()
        indicators:UpdateProgress(player)
    end)

end

-- Удаление всех индикаторов
function Indicators:DeleteAll()
    for player, indicator in pairs(self.indicators) do
        indicator.gui:Destroy()
        self.indicators[player] = nil
    end
end

local IsInStun = function (playerCharacter)
    if playerCharacter:GetAttribute("StunnedEffect") then return true end
    return false
end
local IsBlockBreak = function (playerCharacter)
    if playerCharacter:FindFirstChild("UpperTorso") and
    playerCharacter.UpperTorso:FindFirstChild("HitAttach") and
    playerCharacter.UpperTorso.HitAttach:FindFirstChild("10") then
        return true
    end
    return false
end

local BlockBreakListening = function ()
    for _, v in pairs(living:GetChildren()) do
        local stunned = IsInStun(v)
        if stunned and IsBlockBreak(v) then
            indicators:Create(v)
        end
    end
end
local BlockBreakListeningConnection
BlockBreakListeningConnection = RunService.Stepped:Connect(BlockBreakListening)

function ScalePlayerBody(player, bodyscale)
    local character = player.Character
    if not character then
        warn("Персонаж для разжирения не найден.")
        return
    end
    local scalePart = function (part, scale)
        if part:IsA("MeshPart") then
            part.Size = Vector3.new(
                part.Size.X * scale.X,
                part.Size.Y * scale.Y,
                part.Size.Z * scale.Z
            )
        end
    end
    for _, part in ipairs(character:GetDescendants()) do
        scalePart(part, bodyscale)
    end
    for _, motor in ipairs(character:GetDescendants()) do
        if motor:IsA("Motor6D") then
            local part0 = motor.Part0
            local part1 = motor.Part1

            if part0 and part1 then
                motor.C0 = CFrame.new(
                    motor.C0.X * bodyscale.X,
                    motor.C0.Y * bodyscale.Y,
                    motor.C0.Z * bodyscale.Z
                ) * motor.C0.Rotation

                motor.C1 = CFrame.new(
                    motor.C1.X * bodyscale.X,
                    motor.C1.Y * bodyscale.Y,
                    motor.C1.Z * bodyscale.Z
                ) * motor.C1.Rotation
            end
        end
    end
end

local IsMyFriend = function (Player)
    return Player:IsFriendsWith(plr.UserId)
end

local ReverceAdjustBody = function (child)
    local player = Players:GetPlayerFromCharacter(child)
    if not player or player.Name == plr.Name then return end
    wait(2)
    local isFriend = IsMyFriend(player)
    if isFriend then
        ScalePlayerBody(player, Vector3.new(1/THINFRIENDSSIZE, 1, 1/THINFRIENDSSIZE))
    else
        ScalePlayerBody(player, Vector3.new(1/FATPLAYERSSIZE, 1, 1/FATPLAYERSSIZE))
    end
end

local AdjustBody = function (child)
    local player = Players:GetPlayerFromCharacter(child)
    if not player or player.Name == plr.Name then return end
    wait(2)
    local isFriend = IsMyFriend(player)
    if isFriend then
        ScalePlayerBody(player, Vector3.new(THINFRIENDSSIZE, 1, THINFRIENDSSIZE))
    else
        ScalePlayerBody(player, Vector3.new(FATPLAYERSSIZE, 1, FATPLAYERSSIZE))
    end
end

for _, v in pairs(living:GetChildren()) do
    spawn(AdjustBody(v))
end
local AdjustBodyConnection
AdjustBodyConnection = living.ChildAdded:Connect(AdjustBody)

-------


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
        getgenv().IsValeraScriptRunning = false
        print("Скрипт выключен")
        indicators:DeleteAll()

        if AdjustBodyConnection then
            AdjustBodyConnection:Disconnect()
            AdjustBodyConnection = nil
        end

        for _, v in pairs(living:GetChildren()) do
            spawn(ReverceAdjustBody(v))
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

        DestroyMarkers()

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