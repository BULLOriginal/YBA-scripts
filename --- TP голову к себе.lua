--- TP голову к себе
--- free run script
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
--------------------------
local TARGETNAME = TARGETNAME or "Black"
local TPPART     = TPPART or "Head"
local SCRIPTOFFKEY = SCRIPTOFFKEY or "K"
-------------------------
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
local plr = Players.LocalPlayer
local plrCharacter = plr.Character
local Targetplr
if TARGETNAME then
    Targetplr = Players:FindFirstChild(TARGETNAME)
end
local TargetCharacter
local TargetTpConnection
if not Targetplr then
    for _, v in pairs(Players:GetChildren()) do
        if v.Name ~= plr.Name then
            Targetplr = v
            break
        end
    end
end

if not Targetplr then
    print("Игрок не найден")
else
    -- local JointsList = {}
    TargetCharacter = Targetplr.Character
    local RestoreBodyPart = function (target, partName)
        local part
        if target and target:FindFirstChild(partName) then
            part = target:FindFirstChild(partName)
            for _, v in pairs(part:GetChildren()) do
                if v:IsA("Motor6D") then
                    v.Enabled = true
                    print("Восстановлено соединение",v.Name,"у игрока",target.Name)
                end
            end
        end
    end
    local CutBodyPart = function (target, partName)
        local part
        if target and target:FindFirstChild(partName) then
            part = target:FindFirstChild(partName)
            for _, v in pairs(part:GetChildren()) do
                if v:IsA("Motor6D") then
                    v.Enabled = false
                    print("Уничтожено соединение",v.Name,"у игрока",target.Name)
                end
            end
        end
    end
    local TpTarget = function ()
        if TargetCharacter and plrCharacter and 
        plrCharacter:FindFirstChild("HumanoidRootPart") then
            TargetCharacter:FindFirstChild(TPPART).CFrame = plrCharacter.HumanoidRootPart.CFrame * CFrame.new(0,0,-15)
        end
    end
    local OnTargetAdded = function (character)
        TargetCharacter = character
        TargetCharacter:WaitForChild(TPPART,10) --- чтобы успела отрезаться
        CutBodyPart(TargetCharacter, TPPART)
    end
    local OnCharacterAdded = function (character)
        plrCharacter = character
        if TargetTpConnection then
            TargetTpConnection:Disconnect()
            TargetTpConnection = nil
        end
        TargetTpConnection = RunService.Stepped:Connect(TpTarget)
    end
    OnTargetAdded(TargetCharacter)
    OnCharacterAdded(plrCharacter)
    print("\nL для отключения (для включения потребуется перезапуск кода)\n")
    OnCharacterAdded(plrCharacter)
    local CharacterAddedConnection = plr.CharacterAdded:Connect(OnCharacterAdded)
    local TargetAddedConnection = Targetplr.CharacterAdded:Connect(OnTargetAdded)
    local ScriptConnection
    ScriptConnection = UserInputService.InputBegan:Connect(function (input, gameProcessed)
        if input.KeyCode == Enum.KeyCode[SCRIPTOFFKEY] and not gameProcessed then
            RestoreBodyPart(TargetCharacter, TPPART)
            print("Скрипт выключен")
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