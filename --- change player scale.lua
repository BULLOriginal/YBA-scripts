--- change player scale
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ContextActionService = game:GetService("ContextActionService")
local Workspace = game:GetService("Workspace")
local Stats = game:GetService("Stats")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local living = Workspace:WaitForChild("Living",10)
local plr = Players.LocalPlayer
local plrCharacter = plr.Character

local a = 0
local Hum = Players.BlackDen02
-- Функция для масштабирования частей тела игрока вручную
function scalePlayerBody(player, bodyscale)
    local character = player.Character
    if not character then
        warn("Персонаж не найден.")
        return
    end

    -- Функция для масштабирования части тела и её позиции
    local function scalePart(part, scale)
        if part:IsA("MeshPart") then
            -- Изменяем размер части тела в соответствии с масштабом
            part.Size = Vector3.new(
                part.Size.X * scale.X,
                part.Size.Y * scale.Y,
                part.Size.Z * scale.Z
            )
        end
    end

    -- Масштабирование каждой части тела
    for _, part in ipairs(character:GetDescendants()) do
        scalePart(part, bodyscale)
    end

    -- Масштабирование всех связей (Motor6D) для корректировки положений частей тела
    for _, motor in ipairs(character:GetDescendants()) do
        if motor:IsA("Motor6D") then
            local part0 = motor.Part0
            local part1 = motor.Part1

            if part0 and part1 then
                -- Изменяем положение связи в зависимости от масштаба
                motor.C0 = CFrame.new(
                    motor.C0.X * bodyscale.X,
                    motor.C0.Y * bodyscale.Y,
                    motor.C0.Z * bodyscale.Z
                ) * motor.C0.Rotation

                motor.C1 = CFrame.new(
                    motor.C1.X * bodyscale.X,
                    motor.C1.Y * bodyscale.Y,
                    motor.C1.Z * bodyscale.Z
                ) * motor.C1.Rotation
            end
        end
    end
end


-- local bodyscale = Vector3.new(0.5,1,0.5)  -- Примерный масштаб (X, Y, Z)
-- local bodyscale = Vector3.new(2,1,2)  -- Примерный масштаб (X, Y, Z)
local bodyscale = Vector3.new(1,2,1)  -- Примерный масштаб (X, Y, Z)
scalePlayerBody(Hum, bodyscale)
