-- descendant Grabber
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local plr =  Players.LocalPlayer
local c = 0
local lastTime  -- сохраняем начальное время


local StopBarraging = function ()
    args = {
        [1] = "MobileSkillInputEnded",
        [2] = "Stand Barrage"
    }
    game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(args))
end

function StartBlocking()
    local A_1 = "StartBlocking"
    local Event = game:GetService("Workspace").Living[game.Players.LocalPlayer.Name].RemoteEvent
    Event:FireServer(A_1)
end

local Connection = plr.Character.DescendantAdded:Connect(function(descendant)
    if descendant.Name == "BodyVelocity" then
        if descendant.Velocity.Magnitude > 4.99 and descendant.Velocity.Magnitude < 5.01 then
            if c == 0 then
                c = c + 1
                lastTime = tick()
            else
                c = c + 1
                local currentTime = tick()  -- текущее время
                local elapsedTime = (currentTime - lastTime) * 1000  -- разница в мс
                lastTime = currentTime  -- обновляем время
                print("Count: " .. c .. ", Time since last increment: " .. elapsedTime .. " ms " .. "Ping: "..game:GetService("Stats").PerformanceStats.Ping:GetValue())
            
            
                -- Если время между ударами меньше 300 мс, вызываем startBlocking
                if elapsedTime > 500 and workspace.Living.BlackDen02:FindFirstChild("Stand Barraging") then
                    StopBarraging()
                    StartBlocking()
                    print("Blocking started")
                end
            end
        end
    end
end)

wait(20)
print("---------------------------------")
Connection:Disconnect()
