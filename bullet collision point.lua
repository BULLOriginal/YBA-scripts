--10.10.2023 17:44
getgenv().ScriptBot = false
--false
--true
wait(0.5)
getgenv().ScriptBot = true

local Bot = game.Players.LocalPlayer.Character
local direction = Vector3.new(0, 0, 0)
local angle = -1
local lookTarget
local shootMode = true


--------GUN MODULE-------------
function CalculateCollisionPoint(bulletStart, bulletSpeed, playerStart, playerSpeed, playerVector, ping)
    if (bulletStart - playerStart).magnitude < 10 then
        return playerStart
    end
    
    local offset = playerSpeed * ping/1000
    
    local a = (playerVector * playerSpeed):Dot(playerVector * playerSpeed) - bulletSpeed^2
    local b = 2 * (playerStart - bulletStart):Dot(playerVector * playerSpeed)
    local c = (playerStart - bulletStart):Dot(playerStart - bulletStart)

    local discriminant = b^2 - 4*a*c

    if discriminant < 0 then
        return nil
    end

    local t1 = (-b + math.sqrt(discriminant)) / (2*a)
    local t2 = (-b - math.sqrt(discriminant)) / (2*a)
    local t = (t1 > 0 and t2 > 0) and math.min(t1, t2) or math.max(t1, t2)

    local predictedPoint = playerStart + playerVector * playerSpeed * t
    local adjustedPoint = predictedPoint + playerVector * offset  -- учитываем смещение из-за пинга

    return adjustedPoint
end


-- Вы можете экспериментировать со значением смещения, чтобы найти оптимальное значение для вашей игры.



function UseSkill(skill)
	local cd = game:GetService("Players").LocalPlayer.PlayerGui.HUD.Cooldowns:FindFirstChild(skill)
	if cd == nil and shootMode == false then
		shootMode = true
		local args = {
			[1] = "MobileSkillInputBegan",
			[2] = skill
		}
		game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(args))
		wait(2)
		args = {
			[1] = "MobileSkillInputEnded",
			[2] = skill
		}
		game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(args))
		shootMode = false
	end
end
local function EventListenerBB()
    local val = lookTarget["Blocking_Capacity"].Value
	--if val ~= 0 then
    	UseSkill('Pocket Revolver')

		UseSkill('Throw Knife')
    --end
end
local EventSignalBB = game:GetService("RunService").Stepped:Connect(EventListenerBB)
----------------------


local camFace = function()
	local camera = game:GetService("Workspace").Camera
	local robHumanoidRootPart = Bot:WaitForChild('Head')
	--print('facing dir = '.. direction.x)
	camera.CFrame = CFrame.lookAt(robHumanoidRootPart.Position, robHumanoidRootPart.Position + direction * angle)

end

local directionWrapper = {}
local directionChangedEvent = Instance.new("BindableEvent")
directionWrapper.Set = function(newValue)
   --if (direction - newValue).magnitude > 0 then
        direction = newValue
        directionChangedEvent:Fire(direction)
   -- end
end

directionWrapper.Changed = directionChangedEvent.Event
local camFacingConnection = directionWrapper.Changed:Connect(camFace)


local distanceToCharacter = function(character)
    local toPlayer
    if not character or character == Bot then return math.huge end

	pcall(function ()
		toPlayer = character:WaitForChild('Head', 10).Position - Bot:WaitForChild('Head', 10).Position
	end)
	if toPlayer == nil then
		return math.huge
	end
	if toPlayer.magnitude < 5 then
		return toPlayer.magnitude
	end

	-- Замена FindPartOnRay на Raycast:
	local raycastParams = RaycastParams.new()
	raycastParams.FilterDescendantsInstances = {Bot} -- Игнорирование лучевого трассирования с самим Bot
	raycastParams.IgnoreWater = true
	local raycastResult = game.Workspace:Raycast(Bot:WaitForChild('HumanoidRootPart',10).Position, toPlayer*10, raycastParams)

	if raycastResult and raycastResult.Instance:IsDescendantOf(character) then
		return toPlayer.magnitude
	end

	return math.huge

end
local GetClosestVisibleCharacter = function()
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
	-- pcall(function()
	-- 	--print("Closest player: ", closestCharacter.Name)
	-- end)

	return closestCharacter
end

local function ChooseLookDirection(targetPosition)
	local robHumanoidRootPart = Bot:WaitForChild('Head',10)
	directionWrapper.Set(robHumanoidRootPart.Position - targetPosition)
end

local main = function()
	ClosestChar = GetClosestVisibleCharacter()
	if shootMode then
		local humanoid 			= ClosestChar:WaitForChild('Humanoid',10)
		local startPos1			= Bot:WaitForChild('HumanoidRootPart',10).Position
		local speed1 			= 400
		local startPos2 		= ClosestChar:WaitForChild('HumanoidRootPart',10).Position
		local speed2 			= 32
		local targetDirection 	= humanoid.MoveDirection
		local ping 				= game:GetService("Stats").PerformanceStats.Ping:GetValue() + 130

		local hitPoint = CalculateCollisionPoint(startPos1, speed1, startPos2, speed2, targetDirection, ping)
		print("Corr distance = ", (hitPoint - startPos2).magnitude, ' ping = '.. ping)
		ChooseLookDirection(hitPoint)
		return
	end
	if ClosestChar ~= nil then
		lookTarget = ClosestChar
		ChooseLookDirection(ClosestChar:WaitForChild('Head').Position,10)
		return
	end
end


local Event
local a = spawn(function()
	while(wait(0.1)) do
		if getgenv().ScriptBot == false then
			Event:Disconnect()
			camFacingConnection:Disconnect()
			EventSignalBB:Disconnect()
			Event = nil
			camFacingConnection = nil
			EventSignalBB = nil
			print("SCRIPT STOP")
			break
		end
	end
end)
Event = game:GetService("RunService").Stepped:Connect(main)
