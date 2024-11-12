--- некоторые из remotes юбы
-- Функция Dash
function dash()
    local A_1 = "Dash"
    local Event = game:GetService("Workspace").Living[game.Players.LocalPlayer.Name].RemoteEvent
    Event:FireServer(A_1)
end

-- Функция Удар
function attack()
    local A_1 = "Attack"
    local A_2 = "m1"
    local Event = game:GetService("Workspace").Living[game.Players.LocalPlayer.Name].RemoteEvent
    Event:FireServer(A_1, A_2)
end

-- Функция Удар m2
function attack2()
    local A_1 = "Attack"
    local A_2 = "m2"
    local Event = game:GetService("Workspace").Living[game.Players.LocalPlayer.Name].RemoteEvent
    Event:FireServer(A_1, A_2)
end

-- Функция Ресет
function reset()
    local A_1 = "Reset"
    local A_2 = {
        ["Anchored"] = false
    }
    local Event = game:GetService("Workspace").Living[game.Players.LocalPlayer.Name].RemoteEvent
    Event:FireServer(A_1, A_2)
end

-- Функция Прыжок
function jump()
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
    game.Players.LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    wait(0.1)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = 0
end

-- Функция Блок Старт
function startBlocking()
    local A_1 = "StartBlocking"
    local Event = game:GetService("Workspace").Living[game.Players.LocalPlayer.Name].RemoteEvent
    Event:FireServer(A_1)
end

-- Функция Блок Стоп
function stopBlocking()
    local A_1 = "StopBlocking"
    local Event = game:GetService("Workspace").Living[game.Players.LocalPlayer.Name].RemoteEvent
    Event:FireServer(A_1)
end

-- Функция Переключить бег
function toggleSprinting()
    local A_1 = "ToggleSprinting"
    local Event = game:GetService("Workspace").Living[game.Players.LocalPlayer.Name].RemoteFunction
    Event:InvokeServer(A_1)
end

-- Функция Призвать стенд
function summonStand()
    local A_1 = "ToggleStand"
    local A_2 = "Toggle" --можно вставить любую строку - тогда стенд достанется
    local Event = game:GetService("Workspace").Living[game.Players.LocalPlayer.Name].RemoteFunction
    Event:InvokeServer(A_1, A_2)
end

-- Функция Телепортироваться по координатам (пофикшено, кикакает при использовании)
function teleport(a, b, c)
    local A_1 = "idklolbrah2de"
    local A_2 = Vector3.new(a, b, c)
    local A_3 = "a=a+1+1____ purp yerrrrrr"
    local A_4 = false
    local Event = game:GetService("ReplicatedStorage").Returner
    Event:InvokeServer(A_1, A_2, A_3, A_4)
end

local args = {
        [1] = "StartPosing"
    }



local args = {
    [1] = "AssignSkillKey",
    [2] = {
        ["Type"] = "Stand",
        ["Key"] = "Enum.KeyCode.Y",
        ["Skill"] = "Empty Room"
    }
}

game:GetService("Players").LocalPlayer.Character.RemoteFunction:InvokeServer(unpack(args))


local args = {
    [1] = "ToggleSkillTree",
    [2] = true
}

game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(args))

local args = {
    [1] = "SaveItemHotbarSlot",
    [2] = "9"
}

game:GetService("Players").LocalPlayer.Character.RemoteFunction:InvokeServer(unpack(args))


local args = {
    [1] = "ReturnItemHotbarSavesData"
}

game:GetService("Players").LocalPlayer.Character.RemoteFunction:InvokeServer(unpack(args))

local args = {
    [1] = "ReturnSkillInfoInTree",
    [2] = {
        ["Skills"] = {
            [1] = "Superhuman Barrage",
            [2] = "Hyper Regeneration I",
            [3] = "Ultraviolet Resist I",
            [4] = "Life Absorption",
            [5] = "Superhuman Strength I",
            [6] = "Superhuman Strength II",
            [7] = "Superhuman Strength III",
            [8] = "Superhuman Strength IV",
            [9] = "Superhuman Strength V",
            [10] = "Hyper Regeneration II",
            [11] = "Hyper Regeneration III",
            [12] = "Hyper Regeneration IV",
            [13] = "Hyper Regeneration V",
            [14] = "Vaporization Freezing",
            [15] = "Ultraviolet Resist II",
            [16] = "Space Ripper Stingy Eyes",
            [17] = "Ultraviolet Resist III",
            [18] = "Ultraviolet Resist IV",
            [19] = "Ultraviolet Resist V",
            [20] = "Blood Manipulation I",
            [21] = "Blood Manipulation II",
            [22] = "Blood Manipulation III",
            [23] = "Blood Manipulation IV",
            [24] = "Blood Manipulation V"
        },
        ["Type"] = "Spec"
    }
}

game:GetService("Players").LocalPlayer.Character.RemoteFunction:InvokeServer(unpack(args))

local args = {
    [1] = "ReturnHasSpecLvl",
    [2] = "Vampirism"
}

game:GetService("Players").LocalPlayer.Character.RemoteFunction:InvokeServer(unpack(args))

local args = {
    [1] = "ReturnHealthRegen"
}

game:GetService("Players").LocalPlayer.Character.RemoteFunction:InvokeServer(unpack(args))

local args = {
    [1] = "StartPosing",
    [2] = {
        ["DesiredAnim"] = "Liza"
    }
}

game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(args))

local args = {
    [1] = "StartPosing",
    [2] = {
        ["PlayerIdle"] = game:GetService("ReplicatedStorage"):WaitForChild("Stands"):WaitForChild("D4C"):WaitForChild("PlayerIdle"),
        ["StandIdle"] = game:GetService("ReplicatedStorage"):WaitForChild("Stands"):WaitForChild("D4C"):WaitForChild("Idle")
    }
}

game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(args))

local args = {
    [1] = "StopPosing"
}

game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(args))


local args = {
    [1] = "InputBegan",
    [2] = {
        ["Input"] = Enum.KeyCode.X,
        ["Hold_daS"] = true --- Любому муву можно передать второй аргумент  ["Hold_daS"] = true
    }
}

game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(args))
local args = {
    [1] = "DoubleJump",
    [2] = {
        [1] = {},
        ["Input"] = Enum.KeyCode.Space
    }
}

game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(args))

local args = {
    [1] = "Voiceline",
    [2] = "'Go ahead! Mr. Joesturrrr.'"
}

game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(args))

local args = {
    [1] = "ReturnData" --- вернуть данные о квестах
}

game:GetService("Players").LocalPlayer:WaitForChild("QuestsRemoteFunction"):InvokeServer(unpack(args))

local args = {
    [1] = "ReturnStandSkin",
    [2] = "Slot1"
}

game:GetService("Players").LocalPlayer.Character.RemoteFunction:InvokeServer(unpack(args))

local args = {
    [1] = "HoldAttack",
    [2] = {
        ["Bool"] = false,
        ["Type"] = "m1"
    }
}

game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(args))

local args = {
    [1] = "MusicMuted",
    [2] = "true"
}

game:GetService("Players").LocalPlayer.Character.RemoteFunction:InvokeServer(unpack(args))

local args = {
    [1] = "ReturnItemHotbarSavesData"
}

game:GetService("Players").LocalPlayer.Character.RemoteFunction:InvokeServer(unpack(args))

local args = {
    [1] = "IsPrivateServerOwner"
}

game:GetService("Players").LocalPlayer.Character.RemoteFunction:InvokeServer(unpack(args))

local args = {
    [1] = "UpdateWeatherTemperature",
    [2] = {
        ["WeatherTemperatureType"] = "None",
        ["Location"] = workspace:WaitForChild("Locations"):WaitForChild("The Outskirts")
    }
}

game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(args))

local args = {
    [1] = "ReturnStandSkin",
    [2] = "Stand"
}

game:GetService("Players").LocalPlayer.Character.RemoteFunction:InvokeServer(unpack(args))


local args = {
    [1] = "InitiateCosmeticTrade",
    [2] = "vanya2019roblox12324"
}

game:GetService("Players").LocalPlayer.Character.RemoteFunction:InvokeServer(unpack(args))

Players.LocalPlayer.Character.RemoteEvent:FireServer("SBR_Servers") --- открыть выбор серверов

local Players = game:GetService("Players")
local plr = Players.LocalPlayer
plr.Character.RemoteEvent:FireServer("SBR_Back") --- быстрый перезаход на тот же сервер



-- FireServer("SigL") ---!!!! забанит акк, на котором запущено


local plr = game.Players.LocalPlayer
local Remote = plr.Character.RemoteEvent
plr.RemoteEvent:FireServer("ReturnToLobby")
