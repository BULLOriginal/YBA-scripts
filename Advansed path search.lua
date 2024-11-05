local PathfindingService = game:GetService("PathfindingService")
local Ladders = workspace.Map.City.Ladders

local function GetDistance(pointA, pointB)
    return (pointA - pointB).Magnitude
end

local function CreateMarker(position, color, lifetime)
	local Debris = game:GetService("Debris")
    local marker = Instance.new("Part")
    marker.Anchored = true
    marker.CanCollide = false
    marker.Size = Vector3.new(2.5, 2.5, 2.5)
    marker.Position = position
    marker.Color = color  -- Используем Color3 вместо BrickColor
    marker.Parent = workspace
    Debris:AddItem(marker, lifetime)
end

local function MoveBotAlongPath(path, bot)
	local a, b = pcall(function () return path:GetWaypoints() end)
	local waypoints = {}
	if a then
    	waypoints = table.clone(b)
	else
		waypoints = table.clone(path)
	end
    local humanoid = bot:FindFirstChildOfClass("Humanoid")
    print("Путь содержит " .. #waypoints .. " точек")
	for i, waypoint in ipairs(waypoints) do
		local position
		if type(path) == "table" then
			position = waypoint
		else
			position = waypoint.Position
		end

		CreateMarker(position, Color3.new(0, 1, 0), 10)
	end

    for i, waypoint in ipairs(waypoints) do
		local position
		if type(path) == "table" then
			position = waypoint
		else
			position = waypoint.Position
		end

		local firstMagnitude = (bot.HumanoidRootPart.Position - position).Magnitude
        humanoid:MoveTo(position + Vector3.new(0, 20, 0))
        print("Идем к точке ", i)
        local timer = 0
        local maxTime = 1  -- максимальное время ожидания
        local waitTime = 0.1  -- время каждого цикла ожидания
        while (bot.HumanoidRootPart.Position - position).Magnitude > 8 and position.Y - bot.HumanoidRootPart.Position.Y > -20 do
			print((bot.HumanoidRootPart.Position - position).Magnitude, ', ждем')
			if (bot.HumanoidRootPart.Position - position).Magnitude < firstMagnitude then
				timer = 0
				firstMagnitude = (bot.HumanoidRootPart.Position - position).Magnitude
			end
            wait(waitTime)
            timer = timer + waitTime
			if timer > maxTime then
				return
			end
        end
		CreateMarker(position, Color3.new(1, 0, 1), 10)
    end
end

local function PathExists(startPos, endPos, agentRadius, agentHeight)
    local path = PathfindingService:CreatePath({WaypointSpacing = 4,})

    path:ComputeAsync(startPos, endPos)
    return path.Status == Enum.PathStatus.Success
end


local function GetLadderTopAndBottom(ladderModel)
    local ladderCenter = ladderModel.Position
    local ladderSize = ladderModel.Size  -- Получаем размер модели лестницы
    local highestHitPosition = ladderCenter + Vector3.new(0, ladderSize.Y / 2, 0)  -- Новый метод определения верха

    local directions = {
        Vector3.new(1.1, 0, 0), 
        Vector3.new(-1.1, 0, 0), 
        Vector3.new(0, 0, 1.1), 
        Vector3.new(0, 0, -1.1)
    }
    local lowestHitPosition = nil
    
    local raycastParams = RaycastParams.new()
    raycastParams.FilterDescendantsInstances = {workspace.Map}
    raycastParams.FilterType = Enum.RaycastFilterType.Include

    for _, direction in ipairs(directions) do
        local rayOrigin = ladderCenter + direction + Vector3.new(0, 500, 0)
        local rayDirection = Vector3.new(0, -1000, 0)
        
        local raycastResult = workspace:Raycast(rayOrigin, rayDirection, raycastParams)
        if raycastResult then
            local hitPosition = raycastResult.Position
            if not lowestHitPosition or (hitPosition and hitPosition.Y < lowestHitPosition.Y) then
                lowestHitPosition = hitPosition
            end
        end
    end

    if highestHitPosition then
		CreateMarker(highestHitPosition, Color3.new(1, 0, 0), 10)  -- Создаем верхний маркер (Красный)
		CreateMarker(lowestHitPosition, Color3.new(0, 0, 1), 10)  -- Создаем нижний маркер (Синий)
	
        return highestHitPosition, lowestHitPosition
    else
        print("Could not determine ladder points")
        return nil, nil
    end
end

local function GetLadderPoints(top, bottom)
    local points = {}
    local segments = 5 -- количество сегментов, на которое вы хотите разделить лестницу
    for i = 0, segments do
        local fraction = i / segments
        local point = bottom + (top - bottom) * fraction
		if i == segments then
			point = point + Vector3.new(0, 11, 0)
		end
        table.insert(points, point)
    end
    return points
end

local function IsLadderBelowOrAtTarget(ladderPos, targetPosition)
    return ladderPos.y <= targetPosition.y
end


local FindPathToPoint = function(bot, target)
    local botPosition = bot.HumanoidRootPart.Position
    local targetPosition = target.HumanoidRootPart.Position

    -- 1. Проверяем наличие прямого пути
    if PathExists(botPosition, targetPosition) then
        print("Прямой путь найден")
        local directPath = PathfindingService:CreatePath({AgentCanClimb = true})
        directPath:ComputeAsync(botPosition, targetPosition)
        MoveBotAlongPath(directPath, bot)
        return
    end

    -- 2. Если прямого пути нет, ищем лестницы
    local ladders = {}
    for i, ladder in pairs(Ladders:GetDescendants()) do
        if ladder.Name == 'Truss' or ladder.Name == 'Truss_Ladders' then
            local ladderDistance = (ladder.Position - targetPosition).Magnitude
            if ladderDistance <= 500 and IsLadderBelowOrAtTarget(ladder.Position, targetPosition) then
                table.insert(ladders, ladder)
            end
        end
    end

    table.sort(ladders, function(a, b)
        return (a.Position - targetPosition).Magnitude < (b.Position - targetPosition).Magnitude
    end)


	for _, ladder in ipairs(ladders) do
		local ladderTop, ladderBottom = GetLadderTopAndBottom(ladder)
		if PathExists(ladderTop, targetPosition) then
			print("Путь через лестницу найден")
			local ladderBottomPath = PathfindingService:CreatePath({WaypointSpacing = 4, AgentRadius = 5, AgentCanJump = true, AgentJumpHeight = 50,})
			ladderBottomPath:ComputeAsync(botPosition, ladderBottom)

			local ladderPoints = GetLadderPoints(ladderTop, ladderBottom)

			local ladderTopPath = PathfindingService:CreatePath({WaypointSpacing = 4, AgentRadius = 5, AgentCanJump = true, AgentJumpHeight = 50,})
			ladderTopPath:ComputeAsync(ladderTop, targetPosition)

			print('ladderBottomPath')
			MoveBotAlongPath(ladderBottomPath, bot)

			-- Добавляем точки вдоль лестницы
			print('ladderPoints')
			MoveBotAlongPath(ladderPoints, bot)

			print('ladderTopPath')
			MoveBotAlongPath(ladderTopPath, bot)
			return
		end
	end


    print("Не удалось найти путь к цели")
end


local Targ = workspace.Living.bowjvaleriy
local Bot = game:GetService("Players").LocalPlayer.Character
FindPathToPoint(Bot, Targ)
