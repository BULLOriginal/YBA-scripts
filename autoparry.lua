getgenv().Toggle = false

local Settings = {
    Autoparry = {
    Range = 25,
    },
}
    
local anims = {
--crits http://www.roblox.com/asset/?id=507766388
["rbxassetid://4095625816"] = { [1] = 0.3, [2] = 1 },
["rbxassetid://507766388"] = { [1] = 0.01, [2] = 1 },

}
local players = game:GetService("Players")
local vim = game:GetService("VirtualInputManager")
local plr = players.LocalPlayer
local range = 15
local closestplr, c, anim
    
local function instalog()
    game:GetService("ReplicatedStorage").Requests.ReturnToMenu:FireServer()
    task.wait(0.9)
    if player.PlayerGui.ChoicePrompt then
    player.PlayerGui.ChoicePrompt.Choice:FireServer(true)
    end
end
    
    function closest()
        closestplr = {}
        for i,v in next, players:GetChildren() do -- we want to use GetChildren instead of GetPlayers because we love children (written by mac)
            if v.Character and v ~= plr and v.Character:FindFirstChild("HumanoidRootPart") and (v.Character.HumanoidRootPart.Position-plr.Character.HumanoidRootPart.Position).Magnitude < range then 
                table.insert(closestplr,v)
            end 
        end
        return closestplr
    end
    
    
    function allowed(result)
        if player.Character:FindFirstChild("Weapon") then
            result = true
        else
            result = false
        end
        return result
    end
    
    
    local cd = false 
    function def()
        if cd then return end
        vim:SendKeyEvent(true, "F", false, game)
        task.wait(0.40)
        vim:SendKeyEvent(false, "F", false, game)
        cd = true
    end
    
    
function closest()
    closestplr = {}
    for i, v in next, players:GetChildren() do -- we want to use GetChildren instead of GetPlayers because we love children (written by mac)
        if
        v.Character and plr.Character:WaitForChild("HumanoidRootPart",1)
        and v ~= plr and v.Character ~= plr.Character
        and v.Character:FindFirstChild("HumanoidRootPart")
        and (v.Character.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).Magnitude
        < Settings.Autoparry.Range then
            table.insert(closestplr, v)
        end
    end
    return closestplr
end
    
function parry()
    for i, c in closest() do
        if  c and plr.Character:WaitForChild("HumanoidRootPart", 2) and c.Character and
            c.Character:FindFirstChild("Humanoid") and
            c.Character.Humanoid:FindFirstChild("Animator") then
            for i, v in next, c.Character.Humanoid.Animator:GetPlayingAnimationTracks() do
                anim = anims[v.Animation.AnimationId]
                cd = false
                if anim and v.TimePosition >= anim[1] and v.TimePosition <= anim[2] then
                    task.spawn(function()
                        def()
                    end
                )
                end
            end
        end
        if  c and plr.Character.StandMorph:WaitForChild("HumanoidRootPart", 2) and c.Character and
            c.Character:FindFirstChild("Humanoid") and
            c.Character.Humanoid:FindFirstChild("AnimationController") then
            for i, v in next, c.Character.Humanoid.AnimationController:GetPlayingAnimationTracks() do
                anim = anims[v.Animation.AnimationId]
                cd = false
                if anim and v.TimePosition >= anim[1] and v.TimePosition <= anim[2] then
                    task.spawn(function()
                        def()
                    end
                )
                end
            end
        end
    end
end
    
    
    
    
    --//Ui
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    --//Configs
    
spawn(function()
    local a = game:GetService("RunService").RenderStepped:Connect(function()
        if getgenv().Toggle == true then
            parry()
        else
            a:Disconnect()
            return
        end
    end)
end)