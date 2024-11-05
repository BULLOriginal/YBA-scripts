local PathfindingService = game:GetService("PathfindingService")
local Debris = game:GetService("Debris")

local function CreateMarker(position, color, lifetime)
    local marker = Instance.new("Part")
    marker.Anchored = true
    marker.CanCollide = false
    marker.Size = Vector3.new(2.5, 2.5, 2.5)
    marker.Position = position
    marker.Color = color  -- Используем Color3 вместо BrickColor
    marker.Parent = workspace
    Debris:AddItem(marker, lifetime)
end

function jump()
    keypress(0x20)
    wait(0.1)
    keyrelease(0x20)
end

local function MoveBotAlongPath(path, bot)
    local waypoints = table.clone(path)
    local humanoid = bot:FindFirstChildOfClass("Humanoid")
	local fails = 0
    print("Путь содержит " .. #waypoints .. " точек")

    -- Создаем маркеры для всех точек в пути
    for _, position in ipairs(waypoints) do
        CreateMarker(position, Color3.new(0, 1, 0), 10)
    end

    for i, position in ipairs(waypoints) do
        local firstMagnitude = (bot.HumanoidRootPart.Position - position).Magnitude
        humanoid:MoveTo(position)
        wait(0.1)
        if i>= 2 and position.Y - bot.HumanoidRootPart.Position.Y > 1 and firstMagnitude - (bot.HumanoidRootPart.Position - position).Magnitude < 0.5 then
            jump()
        end
  

        CreateMarker(position, Color3.new(1, 0, 1), 10)
        print("Идем к точке ", i)

        local timer = 0
        local maxTime = 1  -- максимальное время ожидания
        local waitTime = 0.1  -- время каждого цикла ожидания

        while (bot.HumanoidRootPart.Position - position).Magnitude > 8 do
            print((bot.HumanoidRootPart.Position - position).Magnitude, ', ждем')
            if (bot.HumanoidRootPart.Position - position).Magnitude < firstMagnitude then
                timer = 0
                fails = 0
                firstMagnitude = (bot.HumanoidRootPart.Position - position).Magnitude
            end
            wait(waitTime)
            timer = timer + waitTime
            if timer > maxTime then
                fails = fails + 1
                print(fails, 'fail')
            end
            if fails == 10 then
            	print('fail = ',fails)
            	return
            end
        end
    end
end

local GetLadderTopAndBottom = function (ladderModel)
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

local function CalculatePath(startPos, endPos)
    local pathParams = {
        AgentCanJump = true,
        AgentCanClimb = true,
        AgentCanFly = true,
        AgentJumpHeight = 50,
        AgentHeight = 5,
        AgentRadius = 5
    }

    local path = PathfindingService:CreatePath(pathParams)
    path:ComputeAsync(startPos, endPos)
    local success = path.Status == Enum.PathStatus.Success

    local waypoints = path:GetWaypoints()
    local positions = {}

    for _, waypoint in ipairs(waypoints) do
        table.insert(positions, waypoint.Position)
    end
    
    return positions, success
end

local FindStairLeadingToDestination = function (destination)
    local LaddersList = workspace.Map.City.Ladders
    local ladders = {}
    
    for i, ladder in pairs(LaddersList:GetDescendants()) do
        if ladder.Name == 'Truss' or ladder.Name == 'Truss_Ladders' then
            local ladderDistance = (ladder.Position - destination).Magnitude
            if ladderDistance <= 500 and ladder.Position.Y <= destination.Y then
                table.insert(ladders, ladder)
            end
        end
    end
    
    table.sort(ladders, function(a, b)
        return (a.Position - destination).Magnitude < (b.Position - destination).Magnitude
    end)

    for _, ladder in ipairs(ladders) do
		local ladderTop, ladderBottom = GetLadderTopAndBottom(ladder)
        local path, success = CalculatePath(ladderTop, destination)
		if success then
            return ladderTop, ladderBottom, path
        end
    end
end

local JoinPaths = function (path1, path2)
    -- функция соединения двух путей в один
    for _, point in ipairs(path2) do
        table.insert(path1, point)
    end
    return path1
end

local function GetLadderPoints(top, bottom)
    local points = {}
    local segments = 5 -- количество сегментов, на которое вы хотите разделить лестницу
    for i = 0, segments do
        local fraction = i / segments
        local point = bottom + (top - bottom) * fraction
		if i == segments then
			point = point + Vector3.new(0, 7, 0)
		end
        table.insert(points, point)
    end
    return points
end

function FindPathToDestination(start, destination)
    print("Ищем путь от", start, "до", destination)

    local simplePath, success = CalculatePath(start, destination)
    if success then
        print("Найден простой путь к цели")
        return simplePath  -- пример того, как может выглядеть простой путь
    end
    print("Простой путь не найден. Ищем лестницу, ведущую к цели.")

    local stairTop, stairBottom, mainPath = FindStairLeadingToDestination(destination)
    if not stairTop then
        print("Лестницы, ведущие к цели, не найдены.")
        return nil  -- нет пути
    end

    print("Найдена лестница. Пытаемся найти путь к низу этой лестницы.")
    
    local pathPlus = FindPathToDestination(start, stairBottom)
    if not pathPlus then
        print("Путь к низу лестницы не найден.")
        return nil  -- нет пути даже через лестницу
    end

    print("Путь к низу лестницы найден. Объединяем пути.")
    local returnedPath =  JoinPaths(GetLadderPoints(stairTop, stairBottom), mainPath)
    return JoinPaths(pathPlus, returnedPath)
end

local Targ = workspace.Living.bowjvaleriy.HumanoidRootPart.Position
local Bot = game:GetService("Players").LocalPlayer.Character
local path = FindPathToDestination(Bot.HumanoidRootPart.Position, Targ)
MoveBotAlongPath(path, Bot)

