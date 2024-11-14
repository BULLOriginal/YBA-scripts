--- Stats module test

local StatsObject
StatsObject.charContainer =  {}
StatsObject.__index = StatsObject

StatsObject.new = function ()
    local self = setmetatable({}, StatsObject)
    self.speaker = plr
    self.speakerGui = self.speaker:WaitForChild("PlayerGui")

    self.CanTs = function (character)
        if not character then return end
        local standkills = character:WaitForChild("StandSkills" ,5)
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
            local animator = humanoid:WaitForChild("Animator",3)
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

    return self
end

function StatsObject:StartMonitoringCharacter(character)
    if self.charContainer[character] then warn(`Object {character.Name} already exists`); return end
    local PrimaryPart = character:WaitForChild("HumanoidRootPart", 120)
    self.charContainer[character] = {}

    self.charContainer.Holders = {}
    local Holders = self.charContainer.Holders
    
    if MARKERTOGGLE then
        if not self.charContainer[character].RealPosMarker then
            spawn(function ()
                self:CreateRealPosMarker(character)
            end)
        end
    end

    --- TS NOTIFER
    Holders["TsNotiferHolder"] = RunService.Heartbeat:Connect(function ()
        local summonedStand = character:FindFirstChild("SummonedStand")
        if not summonedStand or not summonedStand.Value then return end
        local canTs = self.CanTs(character)
        if not canTs then return end
        local okDistance = self.speaker:DistanceFromCharacter(PrimaryPart.Position) < 200
        if not okDistance then return end
        local animationController = character:WaitForChild("StandMorph"):WaitForChild("AnimationController",5)
        local isTsAnim = self.IsAnimation(animationController, "rbxassetid://4139325504")
        if self.charContainer[character] and not self.charContainer[character].TsNotifer and isTsAnim then
            self:CreateTsNotifer(character)
        end
    end)
    
    
    
    local BlockBreakListening = function (character)
        if not character then return end
        if not character or character.Blocking_Capacity.Value ~= 0 then return end
        if not self.charContainer[character] or self.charContainer[character].StunBar then return end
        local attach = character:FindFirstChild("UpperTorso"):WaitForChild("HitAttach",0.03) -- !!!!!!!
        local stunned = self.IsInStun(character)
        if not stunned then return end
        warn(character.Name,"stunned", stunned)
        if attach then
            local bb = self.IsBlockBreak(attach)
            if bb then
                self:CreateStunBar(character, "bb")
                return
            end
        else
            warn(character.Name,"bypassed block", stunned)
            self:CreateStunBar(character, "bypassb")
        end
    end
    local PerfectBlockListening = function (character)
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

    if BBINDICATOR then
        local bc = character:WaitForChild("Blocking_Capacity",60)
        if bc then
            Holders["StunBarBbHolder"] = bc:GetPropertyChangedSignal("Value"):Connect(function ()
                BlockBreakListening(character)
            end)
        end
        Holders["StunBarPbHolder"] = character:GetAttributeChangedSignal("StunnedEffect"):Connect(function ()
            PerfectBlockListening(character)
        end)
    end

    if self.charContainer[character] and not self.charContainer[character].HpIndicator then
        spawn(function ()
            self:CreateHpIndicator(character)
        end)
    end

    self.charContainer[character].Destroy = function ()
        for _, holder in pairs(Holders) do
            holder:Disconnect()
        end
        self[character] = nil
    end

    Holders["MainHolder"] = RunService.PreRender:Connect(function()
        if not character or not character.PrimaryPart then
            self.charContainer[character].Destroy()
        end
    end)
end

function StatsObject:CreateRealPosMarker(character)
    if self.charContainer[character].RealPosMarker then warn(`RealPosMarker {character.Name} exisits`); return end
    -- if not !!!!!!!!!!!!!!!!!!!! SETTINGS return end
    if not character.PrimaryPart then warn(`No PrimaryPart of {character.Name}`); return end
    self.charContainer[character].RealPosMarker = {}
    local container = self.charContainer[character]
    local RealPosMarker = container.RealPosMarker

    RealPosMarker.Marker = Instance.new("Part", character.PrimaryPart)
    local Marker = RealPosMarker.Marker
    Marker.Name = "RealPosMarker"
    Marker.Shape = Enum.PartType.Cylinder
    Marker.Size = Vector3.new(7, 2, 2)
    Marker.Rotation = Vector3.new(0, 0, 90)
    Marker.Color = Color3.fromRGB(0, 200, 200)
    Marker.Transparency = 0.7
    Marker.Anchored = false
    Marker.Massless = true
    Marker.CanCollide = false

    RealPosMarker.MarkerWeld = Instance.new("Weld", Marker)
    local MarkerWeld = RealPosMarker.MarkerWeld
    MarkerWeld.Name = "MarkerWeld"
    MarkerWeld.Part0 = character.PrimaryPart
    MarkerWeld.Part1 = RealPosMarker.Marker

    function Update()
        if MarkerWeld and
        container and container.RealPosMarker then
            local offset = character.PrimaryPart.CFrame:VectorToObjectSpace(character.PrimaryPart.AssemblyLinearVelocity) * Ping/1000 * 1
            MarkerWeld.C0 = CFrame.new(offset) * CFrame.Angles(math.rad(90),math.rad(90),0)
        else
            Destroy()
        end
    end

    local Updater = RunService.Stepped:Connect(Update)

    function Destroy()
        Updater:Disconnect()
        Marker:Destroy()
        if self.charContainer[character] then
            self.charContainer[character].RealPosMarker = nil
        end
    end
end

function StatsObject:CreateTsNotifer(character)
    if self.charContainer[character].TsNotifer then warn(`TsNotifer {character.Name} exisits`); return end
    if not self.speaker.PrimaryPart then warn(`No PrimaryPart of {character.Name}`); return end
    self.charContainer[character].TsNotifer = {}
    local container = self.charContainer[character]
    local TsNotifer = container.TsNotifer

    TsNotifer.Gui = Instance.new("ScreenGui", self.speakerGui)
    local Gui = TsNotifer.Gui
    Gui.Name = "TsGui"

    -- if self.speaker.PrimaryPart then
    --     TsNotifer.TsSoundNotifer = Instance.new("Sound", self.speaker.PrimaryPart) ---!!!!!!!!!!!!!!!!!!! ДОДЕЛАТЬ
    --     local TsSoundNotifer = TsNotifer.TsSoundNotifer
    --     TsSoundNotifer.Name = "TsSoundNotifer"
    -- end

    TsNotifer.TsFrame = Instance.new("Frame", Gui)
    local TsFrame = TsNotifer.TsFrame
    TsFrame.Name = "TsFrame"
    TsFrame.Size = UDim2.new(0.3, 0, 0.1, 0)
    TsFrame.Position = UDim2.new(0.35, 0, 0, 0)
    TsFrame.BackgroundColor3 = Color3.fromRGB(100, 0, 0)

    TsNotifer.TsText = Instance.new("TextLabel", TsFrame)
    TsText = TsNotifer.TsText
    TsText.Name = "TsText"
    TsText.Size = UDim2.new(1, 0, 1, 0)
    TsText.Position = UDim2.new(0, 0, 0, 0)
    TsText.Text = character.Name
    TsText.TextColor3 = Color3.fromRGB(200, 200, 200)
    TsText.BackgroundTransparency = 1
    TsText.Font = Enum.Font.SourceSans
    TsText.TextScaled = true

    function Destroy()
        Gui:Destroy()
        if container then
            container.TsNotifer = nil
        end
    end

    delay(4, function()
        Destroy()
    end)
end

function StatsObject:CreateStunBar(character, type)
    if self.charContainer[character].StunBar then warn(`StunBar {character.Name} exisits`); return end
    if not character.PrimaryPart then warn(`No PrimaryPart of {character.Name}`); return end
    self.charContainer[character].StunBar = {}
    local container = self.charContainer[character]
    local StunBar = container.StunBar

    StunBar.Gui = Instance.new("StunBarBillboard", character.PrimaryPart)
    local Gui = StunBar.Gui
    Gui.Name = "StunBarBillboard"
    Gui.Size = UDim2.new(4, 0, 1, 0)
    Gui.StudsOffset = Vector3.new(0, 3, 0)
    Gui.AlwaysOnTop = true

    local GreenBar
    if type ~= "pb" then
        StunBar.GreenBar = Instance.new("Frame", Gui)
        GreenBar = StunBar.GreenBar
        GreenBar.Name = "GreenBar"
        GreenBar.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        GreenBar.AnchorPoint = Vector2.new(0.5, 0.5)
        GreenBar.Position = UDim2.new(0.5, 0, 0.5, 0)
        GreenBar.BorderSizePixel = 0
    end

    local RedBar
    if type ~= "bypassb" then
        StunBar.RedBar = Instance.new("Frame", Gui)
        RedBar = StunBar.RedBar
        RedBar.Name = "RedBar"
        RedBar.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        RedBar.AnchorPoint = Vector2.new(0.5, 0.5)
        RedBar.Position = UDim2.new(0.5, 0, 0.5, 0)
        RedBar.BorderSizePixel = 0
    end

    local startTime = tick()
    function Update()
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
        if GreenBar and elapsedTime >= greenTime or RedBar and elapsedTime >= redTime or
            not container or not StunBar then
            Destroy()
        end
    end

    local Updater = RunService.Stepped:Connect(Update)

    function Destroy()
        Updater:Disconnect()
        Gui:Destroy()
        if self.charContainer[character] then
            self.charContainer[character].StunBar = nil
        end
    end
end

function StatsObject:CreateHpIndicator(character)
    if self.charContainer[character].HpIndicator then warn(`HpIndicator {character.Name} exisits`); return end
    -- if not !!!!!!!!!!!!!!!!!!!! SETTINGS return end
    if not character.PrimaryPart then warn(`No PrimaryPart of {character.Name}`); return end
    local container = self.charContainer[character]
    container.HpIndicator = {}
    local HpIndicator = container.HpIndicator


    HpIndicator.Gui = Instance.new("BillboardGui", character.PrimaryPart)
    local Gui = HpIndicator.Gui
    Gui.Name = "HpIndicatorBillboard"
    Gui.Size = UDim2.new(4, 0, 1, 0)
    Gui.StudsOffset = Vector3.new(0, 3, 0)
    Gui.AlwaysOnTop = true

    HpIndicator.HealthText = Instance.new("TextLabel", Gui)
    local HealthText = HealthBar.HealthText
    HealthText.Name = "HealthText"
    HealthText.Size = UDim2.new(1, 0, 1, 0)
    HealthText.BackgroundTransparency = 1
    HealthText.TextColor3 = Color3.fromRGB(255, 0, 0)
    HealthText.TextStrokeTransparency = 0.5
    HealthText.Font = Enum.Font.SourceSansBold
    HealthText.TextSize = 24

    function Update()
        if HealthText and container and HpIndicator then
            local currentHealth = character.Health.Value
            local maxHealth = character.Health.MaxValue
            HealthText.Text = string.format("HP: %d / %d", currentHealth, maxHealth)
        else
            Destroy()
        end
    end

    local Updater = character.Health:GetPropertyChangedSignal("Value"):Connect(Update)

    function Destroy()
        Updater:Disconnect()
        Gui:Destroy()
        if self.charContainer[character] then
            self.charContainer[character].HpIndicator = nil
        end
    end
end

function StatsObject:Destroy()
    for _, v in pairs(self.charContainer) do
        v.Destroy()
    end
end