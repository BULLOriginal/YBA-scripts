--- impale dist
---  Params
--- начать вводить имя игрока
local TARGETNAME            = "Black"
local ScriptOffKey          = "L"
local SpectatorKey          = "J"
local skills                 = {
    ["B"]     = "Impale",
    ["C"] = "Plant Bomb",
}
local PingOffsetMultiplayer = 1
--- 
--- 
--- 
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Stats = game:GetService("Stats")


local function getPlayer(list,speaker)
    function splitString(str,delim)
        local broken = {}
        if delim == nil then delim = "," end
        for w in string.gmatch(str,"[^"..delim.."]+") do
            table.insert(broken,w)
        end
        return broken
    end
    function toTokens(str)
        local tokens = {}
        for op,name in string.gmatch(str,"([+-])([^+-]+)") do
            table.insert(tokens,{Operator = op,Name = name})
        end
        return tokens
    end

    function onlyIncludeInTable(tab,matches)
        local matchTable = {}
        local resultTable = {}
        for i,v in pairs(matches) do matchTable[v.Name] = true end
        for i,v in pairs(tab) do if matchTable[v.Name] then table.insert(resultTable,v) end end
        return resultTable
    end

    function removeTableMatches(tab,matches)
        local matchTable = {}
        local resultTable = {}
        for i,v in pairs(matches) do matchTable[v.Name] = true end
        for i,v in pairs(tab) do if not matchTable[v.Name] then table.insert(resultTable,v) end end
        return resultTable
    end

    function getPlayersByName(Name)
        local Name,Len,Found = string.lower(Name),#Name,{}
        for _,v in pairs(Players:GetPlayers()) do
            if Name:sub(0,1) == '@' then
                if string.sub(string.lower(v.Name),1,Len-1) == Name:sub(2) then
                    table.insert(Found,v)
                end
            else
                if string.sub(string.lower(v.Name),1,Len) == Name or string.sub(string.lower(v.DisplayName),1,Len) == Name then
                    table.insert(Found,v)
                end
            end
        end
        return Found
    end
	if list == nil then return {speaker.Name} end
	local nameList = splitString(list,",")

	local foundList = {}

	for _,name in pairs(nameList) do
		if string.sub(name,1,1) ~= "+" and string.sub(name,1,1) ~= "-" then name = "+"..name end
		local tokens = toTokens(name)
		local initialPlayers = Players:GetPlayers()

		for i,v in pairs(tokens) do
			if v.Operator == "+" then
				local tokenContent = v.Name
				local foundCase = false
				if not foundCase then
					initialPlayers = onlyIncludeInTable(initialPlayers,getPlayersByName(tokenContent))
				end
			else
				local tokenContent = v.Name
				local foundCase = false
				for regex,case in pairs(SpecialPlayerCases) do
					local matches = {string.match(tokenContent,"^"..regex.."$")}
					if #matches > 0 then
						foundCase = true
						initialPlayers = removeTableMatches(initialPlayers,case(speaker,matches,initialPlayers))
					end
				end
				if not foundCase then
					initialPlayers = removeTableMatches(initialPlayers,getPlayersByName(tokenContent))
				end
			end
		end

		for i,v in pairs(initialPlayers) do table.insert(foundList,v) end
	end

	local foundNames = {}
	for i,v in pairs(foundList) do table.insert(foundNames,v.Name) end

	return foundNames[1]
end
TARGETNAME = getPlayer(TARGETNAME)
print(TARGETNAME)
--------------------------
local plr = Players.LocalPlayer
local plrCharacter = plr.Character
local Targetplr = Players:FindFirstChild(TARGETNAME)
local TargetCharacter
local TargetTpConnection
local ImpaleStartConnection
local StandPositionConnection

local camera = Workspace.CurrentCamera

if not Targetplr then
print("Игрок не найден")
else
TargetCharacter = Targetplr.Character


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
            TeleportCamera (TargetCharacter)
        else
            RunService:UnbindFromRenderStep("TeleportCameraConnection")
        end
        spectatorFlag = not spectatorFlag
    end
end)

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
                if not plrCharacter:FindFirstChild("StandMorph") then
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
local ForceStand = function ()
    local standMorph = plrCharacter:FindFirstChild("StandMorph")
    local StandPos
    if plrCharacter and standMorph then
        local TargetLookDirection = Vector3.new(0, -1, 0)
        local SHum = standMorph.HumanoidRootPart
        StandPos = Instance.new("BodyPosition", SHum)
        StandGyro = Instance.new("BodyGyro", SHum)
        StandPos.MaxForce = Vector3.new("inf","inf","inf")
        StandPos.D = 400000
        StandPos.P = 5000000000000
        StandGyro.D = 100
        StandGyro.P = 100000
        StandPos.Position = plrCharacter.HumanoidRootPart.Position
        -- RunService.Stepped:Wait()
        local bufOr = SHum.StandAttach.AlignOrientation.MaxTorque
        local bufForc = SHum.StandAttach.AlignPosition.MaxForce
        SHum.StandAttach.AlignOrientation.MaxTorque = 100
        SHum.StandAttach.AlignPosition.MaxForce = 100
        StandPos.Position = TargetCharacter.HumanoidRootPart.Position - TargetLookDirection * 200
        StandGyro.MaxTorque = Vector3.new("inf","inf","inf")
        StandGyro.CFrame = CFrame.lookAt(SHum.Position - TargetLookDirection, SHum.Position + TargetLookDirection)
        -- wait(0.2)
        if not StandPositionConnection then
            StandPositionConnection = RunService.Stepped:Connect(function()
                local ping = Stats.PerformanceStats.Ping:GetValue()
                local offset = TargetCharacter.HumanoidRootPart.Velocity.Magnitude * ping/1000 * PingOffsetMultiplayer
                local MoveDirection = TargetCharacter:FindFirstChild("Humanoid").MoveDirection
                SHum.Position = TargetCharacter.HumanoidRootPart.Position + MoveDirection  * offset * Vector3.new(1, 0, 1)
                standMorph.LowerTorso.Position = TargetCharacter.HumanoidRootPart.Position + MoveDirection  * offset * Vector3.new(1, 0, 1)
                StandPos.Position = TargetCharacter.HumanoidRootPart.Position + MoveDirection  * offset * Vector3.new(1, 0, 1)
            end)
        end
        
        if not ImpaleStartConnection then
            ImpaleStartConnection = plrCharacter.StandMorph.HumanoidRootPart.ChildAdded:Connect(function(child)
                if child.Name == "Weld" then
                    print("ПОПАДАНИЕ В",TARGETNAME)
                    StandPos.Position = TargetCharacter.HumanoidRootPart.Position - Vector3.new(0, 100, 0)
                    ImpaleStartConnection:Disconnect()
                    ImpaleStartConnection = nil
                    StandPositionConnection:Disconnect()
                    StandPositionConnection = nil
                end
            end)
        end
        wait(1)
        
        if ImpaleStartConnection then
            ImpaleStartConnection:Disconnect()
            ImpaleStartConnection = nil
        end
        if StandPositionConnection then
            StandPositionConnection:Disconnect()
            StandPositionConnection = nil
        end

        StandPos.Position = TargetCharacter.HumanoidRootPart.Position - Vector3.new(0, 100, 0)
        for i = 0, 3 do -- задержка чтобы стенд успел улететь под землю
            RunService.Stepped:Wait()
        end
        SHum.StandAttach.AlignOrientation.MaxTorque = bufOr
        SHum.StandAttach.AlignPosition.MaxForce = bufForc
        
        StandPos:Destroy()
        StandGyro:Destroy()
    end
    
end
local UseSkill = function (skill, A_1)
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
end
local IsOnCooldown = function (skill)
    if Players.LocalPlayer.PlayerGui.HUD.Cooldowns.Frame:FindFirstChild(skill) then
        return true
    end
    return false
end

local OnTargetAdded = function (character)
    TargetCharacter = character
end
local OnCharacterAdded = function (character)
    plrCharacter = character
    if TargetTpConnection then
        TargetTpConnection:Disconnect()
        TargetTpConnection = nil
    end
    TargetTpConnection = UserInputService.InputEnded:Connect(function(input, gameProcessed)
        local skill = skills[string.gsub(tostring(input.KeyCode), "Enum.KeyCode.", "")]
        if skill and not gameProcessed and not IsOnCooldown(skill) then
            print("Удар стоит на", input.KeyCode, ", целевой игрок -", TARGETNAME)
            if not plrCharacter:FindFirstChild("StandMorph") then
                ToggleStand("On")
                wait(0.5)
            end
            UseSkill(skill)
            ForceStand()
        end
    end)
end
OnTargetAdded(TargetCharacter)
OnCharacterAdded(plrCharacter)
print("\nL для отключения (для включения потребуется перезапуск кода)\n")
OnCharacterAdded(plrCharacter)
local CharacterAddedConnection = plr.CharacterAdded:Connect(OnCharacterAdded)
local TargetAddedConnection = Targetplr.CharacterAdded:Connect(OnTargetAdded)
local ScriptConnection
ScriptConnection = UserInputService.InputBegan:Connect(function (input, gameProcessed)
    if input.KeyCode == Enum.KeyCode[ScriptOffKey] and not gameProcessed then
        print("Скрипт выключен")
        RunService:UnbindFromRenderStep("TeleportCameraConnection")
        if SpectatorConnection then
            SpectatorConnection:Disconnect()
            SpectatorConnection = nil
        end
        if TargetTpConnection then
            TargetTpConnection:Disconnect()
            TargetTpConnection = nil
        end
        if TargetAddedConnection then
            TargetAddedConnection:Disconnect()
            TargetAddedConnection = nil
        end
        if CharacterAddedConnection then
            CharacterAddedConnection:Disconnect()
            CharacterAddedConnection = nil
        end
        if ScriptConnection then
            ScriptConnection:Disconnect()
            ScriptConnection = nil
        end
    end
end)
if workspace.Map:FindFirstChild("IMPORTANT"):FindFirstChild("Ocean") then
    workspace.Map:FindFirstChild("IMPORTANT"):FindFirstChild("Ocean").Size = Vector3.new(0.1,0.1,0.1)
end
end