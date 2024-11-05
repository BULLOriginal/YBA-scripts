getgenv().FISTSBOT = false
wait(0.5)
getgenv().FISTSBOT = true
--false
local CLOSESTVISIBLECHAR = {}

local Bot = game.workspace.Living:WaitForChild(game.Players.LocalPlayer.Name)
local BotParams = {}

BotParams.paramlist = {
	battlemode = false,
	owner = 'bowjvaleriy',
	LookDirection = Vector3.new(0,0,0),
	LookPriority = 1,
	closestToBotPlayer = nil,
	abilityInProcess = nil
}
BotParams.whitelist = {
	bowjvaleriy = true,
	BlackDen02 = true,
	BlackDen02_v3 = true,
	LazyDen03 = true,
	LazyDen03_v2 = true,
	LazyDen03_v3 = true,
	LazyDen03_v4 = true,
	LazyDen03_v5 = true,
	LazyDen03_v6 = true,
	CJITbIU_TBuHK = true,
	xHooBx = true,
	Ybaponos228_v2 = true,
	Ybaponos228_v3 = true,
	Ybaponos228_v4 = true,
	CoHHa91Myxa = true,
	CJITA91_Myxa = true,
	BlackMyxa02 = true,
	["2storage132"] = true,
	["2storage1321"] = true,
	ybaponos1337 = true,
	ybaponos1337_v1 = true,
	ybaponos1337_v2 = true,
	ybaponos1337_v3 = true,
	ybaponos1337_v4 = true,
	ybaponos1337_v5 = true,
	GomoSisek = true,
	roflanek = true,
	MoshnoNasral = true,
	PetuhVoFriture = true,
	MegaBot13377331 = true,
	FartunasRebirth = true,
	Abobusnaya_Psina = true,
	Megageniy56005 = true,
	fartunatuna = true,
	TuskActor_4 = true,
	roflanec = true,
	TheWorldHave = true,
	samstrf = true,
	lolKTOR228 = true,
	margarin141000 = true}
BotParams.currentanimations = {
}
BotParams.abilities = {
	m1 = {
		A_1 = "Attack",
    	A_2 = "m1",
		anivariant = {},
	},

	m2 = {
		A_1 = "Attack",
    	A_2 = "m2",
		anivariant = {},
	},

}
BotParams.abilities.UseAbility = function(self, AbilityName)
	local Event = game:GetService("Workspace").Living[game.Players.LocalPlayer.Name].RemoteEvent
    Event:FireServer(self[AbilityName].A_1, self[AbilityName].A_2)
end



local function GetClosestCharacterToPlayer(playerClosestTo)
    local closestDistance = math.huge
    local closestCharacter = nil
    local playerChar = game.workspace.Living:WaitForChild(playerClosestTo.Name, 5)
    
    for _, player in game:GetService("Players"):GetChildren() do
        local character = player.Character
        if character and character ~= Bot and character ~= playerChar then
            local distance = (character:WaitForChild('UpperTorso', 10).Position - Bot:WaitForChild('Head', 10).Position).magnitude
            if distance < closestDistance then
                closestDistance = distance
                closestCharacter = character
            end
        end
    end
    
    return closestCharacter
end




function PingCorrection(playerSpeed)
	local ping	 = game:GetService("Stats").PerformanceStats.Ping:GetValue() + 130
    local offset = playerSpeed * ping/1000
    return offset
end

local CameraController = function() --thread
    
end

local FindClosestPlayer = function () --thread

end

local FindPathToPoint = function () --thread
	
end

local function Main()
    local currentTime = tick()  -- текущее время в секундах

	if BotParams.target and BotParams.battlemode then
		if TargetInfo(BotParams.target) then
			BotParams.lastSeenTime = currentTime
			if not BotParams.onFight then
				BotParams.onFight = true
			end
		else
			local timeNotSeen = currentTime - (BotParams.lastSeenTime or currentTime)

			if timeNotSeen >= 1 and timeNotSeen < 2 then
				BotParams.onFight = false
				FindPathToPoint(BotParams.target.PrimaryPart.Position)  -- ищем путь к target
			end

			if timeNotSeen >= 5 then
				BotParams.target = nil
				BotParams.onFight = false
			end
		end
	else
		-- Логика для поиска ближайшего игрока к owner, когда owner виден
		if TargetInfo(game.Players[BotParams.owner].Character) then
			local closestToOwner = GetClosestCharacterToPlayer(game.Players[BotParams.owner])
			if closestToOwner then
				BotParams.target = closestToOwner
			end
		else
			-- Путь к owner
			FindPathToPoint(game.workspace.Living:WaitForChild(BotParams.owner).Position)
		end
	end
end





local CameraEvent
local closestCharacter
local Event
local a = spawn(function()
	while(wait(0.1)) do
		if getgenv().FISTSBOT == false then
			CameraEvent:Disconnect()
			Event:Disconnect()
			print("SCRIPT STOP")
			break
		end
	end
end)
closestCharacter = game.RunService.Stepped:Connect(GetClosestVisibleCharacter)
CameraEvent = game.RunService.Stepped:Connect(CameraController)
Event 		= game.RunService.Stepped:Connect(Main)
