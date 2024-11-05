-- Переменные UI
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()
local Window = Library.CreateLib("Name", "RJTheme3") 
local Tab = Window:NewTab("TabName")
local Section = Tab:NewSection("Тестовая зона")

-- Переменные игрового мира
-- Сервисы
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local PathfindingService = game:GetService("PathfindingService")

-- Игроки
local masterName = "MoshnoNasral"
local plr = Players.LocalPlayer.Character

Connections = {
    PushChildAddedConnection = function(self, key, obj, func, ...)
        local args = {...}
        if self[key..'ChildAddedConnection'] ~= nil then
            print("Такой коннект уже есть - "..key..'ChildAddedConnection')
        else
            self[key..'ChildAddedConnection'] = obj.Parent.ChildAdded:Connect(function(child)
                if child.Name == obj.Name then
                    func(table.unpack(args))
                end
            end)
        end
        if not self[key..'ChildAddedConnectionSupport'] then
            self[key..'ChildAddedConnectionSupport'] = RunService.Stepped:Connect(function()
                if not obj or not obj.Parent then
                    if self[key..'ChildAddedConnection'] then
                        self[key..'ChildAddedConnection']:Disconnect()
                        self[key..'ChildAddedConnection'] = nil
                        print("Разорвано соединение, "..key..'ChildAddedConnection')
                    end
                end
                if obj and not self[key..'ChildAddedConnection'] then
                    self.PushChildAddedConnection(self, key, obj, func, table.unpack(args))
                    print("Восстановлено соединение, "..key..'ChildAddedConnection')
                end
            end)
        end
    end,
    PushConnection = function(self, key, connection)
        self[key] = connection
        print("Добавлено соединение, "..key)
    end,
    PopConnection = function(self, key)
        if self[key] then
            self[key]:Disconnect()
            self[key] = nil
            print("Разорвано соединение, "..key)
        end
    end,
    PopAllConnections = function(self)
        for key, value in pairs(self) do
            if typeof(value) == "RBXScriptConnection" then
                value:Disconnect()
                self[key] = nil
                print("Разорвано соединение, "..key)
            end
        end
    end,
    DisplayActiveConnections = function(self)
        local i = 0
        for key, value in pairs(self) do
            if value.Disconnect then
                i = i+1
                print("Найдено соединение, по счёту "..i.." Key = "..key)
            end
        end
        print("Всего соединений найденo - "..i)
    end
}


Написать модуль Pathfinding.
Функции:
1. ComputePath
2. GoToPath
3. FindTarget

PositionController = {
    humanoid = plr.WaitForChild("humanoid"),
    bot = plr:WaitForChild("LowerTorso").Position,
    master = Players[masterName].Character:WaitForChild("humanoidRootPart"),

    ComputePath = function(start,destination)
        local path = PathfindingService:CreatePath()
        path:ComputeAsync(start, destination)
        local waypoints = path:GetWaypoints()
        return waypoints
    end,
}



-- Отвечает за обнаружение локального игрока и его потомков

-- Основная часть

