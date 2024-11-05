getgenv().TARGETSPEED = false
--false
--true
wait(0.5)
getgenv().TARGETSPEED = true

local Bot = game.Players.LocalPlayer.Character
local CLOSESTVISIBLECHAR = {}

local distanceToCharacter = function(character)
    local toPlayer
    if not character or character == Bot then return math.huge end
	pcall(function ()
		toPlayer = character:WaitForChild('UpperTorso', 10).Position - Bot:WaitForChild('Head', 10).Position
	end)
	if toPlayer == nil then
		return math.huge
	end
	if toPlayer.magnitude < 5 then
		return toPlayer.magnitude
	end
	local raycastParams = RaycastParams.new()
	raycastParams.FilterDescendantsInstances = {Bot}
	raycastParams.IgnoreWater = true
	local raycastResult = game.Workspace:Raycast(Bot:WaitForChild('HumanoidRootPart',10).Position, toPlayer*10, raycastParams)
	if raycastResult and raycastResult.Instance:IsDescendantOf(character) then
		return toPlayer.magnitude
	end
	return math.huge
end

local GetClosestVisibleCharacter = function() -- thread
	local distance
	local closestDistance = math.huge
	local closestCharacter = nil
	for _, player in game:GetService("Players"):GetChildren() do
		if player.Character ~= nil then
        	distance = distanceToCharacter(player.Character)
		else
			distance = math.huge
		end
		if distance < closestDistance then
			closestDistance = distance
			closestCharacter = player.Character
		end
	end
	CLOSESTCHAR.char = closestCharacter
end

local ToSetType = function (list)
    local set = {}
    local array = {}
    
    local excludedPriorities = {
        [Enum.AnimationPriority.Idle] = true  -- Исключаемые приоритеты
    }
    
    local excludedAnimationIds = {
        ["rbxassetid://4620998282"] = true,    -- предмет в руке
        ["rbxassetid://11545385776"] = true,    -- дэш USER NAME

    }
    
    for i, item in ipairs(list) do
        local priority = item.Priority
        local animationId = item.Animation.AnimationId

        if not excludedPriorities[priority] and not excludedAnimationIds[animationId] then
            if not set[animationId] then  -- Проверка, чтобы избежать добавления дубликатов
                set[animationId] = item
                table.insert(array, item)
            end
        end
    end
    
    return array
end

local GetTargetAnimations = function (Target)
    local animations = {}
    
    -- Получаем анимации из Humanoid
    if Target:FindFirstChild('Humanoid') then
        local humanoidAnimations = Target.Humanoid:GetPlayingAnimationTracks()
        for _, anim in ipairs(humanoidAnimations) do
            table.insert(animations, anim)
        end
    end
    
    -- Получаем анимации из StandMorph.AnimationController, если они существуют
    if Target:FindFirstChild('StandMorph') and Target.StandMorph:FindFirstChild('AnimationController') then
        local standAnimations = Target.StandMorph.AnimationController:GetPlayingAnimationTracks()
        for _, anim in ipairs(standAnimations) do
            table.insert(animations, anim)
        end
    end

    return ToSetType(animations)
end


local animationsDataBase = {}
animationsDataBase.markers = {
    ["m2"] = function(ParentName)
        local parent = game:GetService("Workspace").Living[ParentName]
        if not parent then return false end

        if parent:FindFirstChild("Heavy Marker") then
            return true
        end

        local standMorph = parent:FindFirstChild("StandMorph")
        if standMorph and standMorph:FindFirstChild("Heavy Marker") then
            return true
        end

        return false
    end,
    ["Stand Barraging"] = function(ParentName)
        local parent = game:GetService("Workspace").Living[ParentName]
        return parent and parent:FindFirstChild("Stand Barraging") ~= nil
    end,
    ["blocking"] = function(ParentName)
        local parent = game:GetService("Workspace").Living[ParentName]
        return parent and parent["Blocking_Capacity"] and parent["Blocking_Capacity"].Value ~= 0
    end,
    -- Тут можно добавить другие маркеры и функции проверки для них
}

animationsDataBase.actiontable = {
    ['rbxassetid://6216052429'] = {
		name = "Stand Barrage Finisher",
		walkSpeed = 6, -- зацикленные анимации запускаются и прерываются мгновенно
	},
    ["Stand Barraging"] = {
		name = "Stand Barraging",
		walkSpeed = 12,
        isLooped = true -- зацикленные анимации запускаются и прерываются мгновенно
	},
	["rbxassetid://4263928734"] = {
		name = "blocking",
		walkSpeed = 8,
        hitTimePercent = 0, -- срабатывает сразу после нажатия
        hitboxUpto = 1.333, -- сработает до этого
        isLooped = true -- зацикленные анимации запускаются и прерываются мгновенно
	},
    ["rbxassetid://6926086304"]  = {
		name = "dash",
		walkSpeed = 40,
        isLooped = true
	},
	["http://www.roblox.com/asset/?id=507767714"]  = {
		name = "walking",
		walkSpeed = 16
	},
	["rbxassetid://4109943333"]  = {
		name = "running",
		walkSpeed = 0
	},
    ["rbxassetid://4095589649"]  = {
		name = "m1 (1)",
		walkSpeed = 10,
        hitTimePercent = 0.4 -- percent of max up to 1
	},
    ["rbxassetid://4095590714"]  = {
		name = "m1 (2)",
		walkSpeed = 10,
        hitTimePercent = 0.4
	},
    ["rbxassetid://4095591763"]  = {
		name = "m1 (3)",
		walkSpeed = 10,
        hitTimePercent = 0.4
	},
    ["rbxassetid://4095592767"]  = {
		name = "m1 (4)",
		walkSpeed = 10,
        hitTimePercent = 0.4
	},
    ["rbxassetid://4095593647"]  = {
		name = "m1 (5)",
		walkSpeed = 10,
        hitTimePercent = 0.4
	},
    ["m2"]  = {
		name = "m2",
		walkSpeed = 6,
        hitTimePercent = 0.81
	},
}

animationsDataBase.defaultValues = {
    [Enum.AnimationPriority.Action3] = {
        name = "Получает по лицу, Action3",
        walkSpeed = 2,
        speedCanBoost = false,
    },
    -- Можете добавить другие приоритеты по аналогии
    default = {
        name = "Неизвестно",
        walkSpeed = 2,
        speedCanBoost = true,
        hitTimePercent = 0.5,
        hitboxUpTo = 1,
        isLooped = false,
        isBlockable = true,
        isBlockBreak = false,
        isPerfectBlockable = false
    }
}

animationsDataBase.ReturnParam = function(AnimTrack, Param, ParentName) -- добавлен аргумент ParentName
    -- Здесь используем defaultValues для определения значения по умолчанию вместо встроенного словаря
    local default = animationsDataBase.defaultValues[AnimTrack.Priority] or animationsDataBase.defaultValues.default

    for markerName, markerFunction in pairs(animationsDataBase.markers) do
        if markerFunction(ParentName) then
            local animationData = animationsDataBase.actiontable[markerName]
            if animationData then
                return animationData[Param] or default[Param]
            end
        end
    end

    -- Если маркер не найден, проверяем напрямую по ID анимации
    local animationData = animationsDataBase.actiontable[AnimTrack.Animation.AnimationId]
    if animationData then
        return animationData[Param] or default[Param]
    end

    -- Если ничего не найдено, вернуть default
    return default[Param]
end





local GetTargetSpeed = function (Target)
    local animations = GetTargetAnimations(Target)
    local runAnimTrackSpeed
    local runAnimationId = "http://www.roblox.com/asset/?id=507767714"

    for _, AnimTrack in pairs(animations) do
        if AnimTrack.Animation.AnimationId == runAnimationId then
            runAnimTrackSpeed = AnimTrack.Speed
            print("runAnimTrackSpeed = ", runAnimTrackSpeed)
            break
        end
    end

    if not runAnimTrackSpeed then
        -- Проверяем, существует ли запись для этого игрока
        if CLOSESTVISIBLECHAR[Target.Name] then
            --print("Ошибка: runAnimTrackSpeed не найден. Последняя скорость игрока ", Target.Name, " была: ", CLOSESTVISIBLECHAR[Target.Name])
            runAnimTrackSpeed = CLOSESTVISIBLECHAR[Target.Name]
        else
            --print("Ошибка: runAnimTrackSpeed и предыдущая скорость для игрока ", Target.Name, " не найдены. Используется скорость по умолчанию: 0")
            runAnimTrackSpeed = 0
        end
    end

    -- Сохраняем текущую скорость для этого игрока
    CLOSESTVISIBLECHAR[Target.Name] = runAnimTrackSpeed

    for i = #animations, 1, -1 do
        local AnimTrack = animations[i]

        local speed = animationsDataBase.ReturnParam(AnimTrack, 'walkSpeed', Target.Name)
        local animName = animationsDataBase.ReturnParam(AnimTrack, 'name', Target.Name)
        local priority = AnimTrack.Priority
        local canBoost = animationsDataBase.ReturnParam(AnimTrack, 'speedCanBoost', Target.Name)

        if runAnimTrackSpeed ~= 1 and canBoost then
            print("Имя анимации:", animName, "| Возвращаемая скорость:", math.floor(12.9 * runAnimTrackSpeed + 0.5), "| Приоритет анимации:", priority, "| Рассчет скорости:", "math.floor(12.9 *", runAnimTrackSpeed, "+ 0.5)")
            return math.floor(12.9 * runAnimTrackSpeed + 0.5)
        else
            print("Имя анимации:", animName, "| Возвращаемая скорость:", speed, "| Приоритет анимации:", priority, 'speed')
            return speed
        end
    end
end

local Main = function ()
    Target = CLOSESTVISIBLECHAR.char
    if Target ~= nil then
        GetTargetSpeed(Target)
    end
end

local Event
local closestCharacter
local thread = spawn(function()
	while(wait(0.1)) do
		if getgenv().TARGETSPEED == false then
			Event:Disconnect()
            closestCharacter:Disconnect()
			Event = nil
			print("SCRIPT STOP")
			break
		end
	end
end)
closestCharacter = game.RunService.Stepped:Connect(GetClosestVisibleCharacter)
local lastExecuted = tick()

Event = game.RunService.Stepped:Connect(function()
    local currentTime = tick()
    if currentTime - lastExecuted >= 0.5 then -- 1 second delay
        Main()
        lastExecuted = currentTime
    end
end)