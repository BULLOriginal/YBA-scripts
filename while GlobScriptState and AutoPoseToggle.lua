while GlobScriptState and AutoPoseToggle do
    wait(0.001)
    if (not PClicked) and GetPlayer(plr.Name):WaitForChild("Health").Value <
    GetPlayer(plr.Name):WaitForChild("Health").MaxValue then
        PClicked = true
        -- print("IN Function", PClicked)
        if tick() - LastRegenTick < 1 - (corr/2) then
            print("waiting 1 = ",1 - (corr/2) - (tick() - LastRegenTick))
            wait(1 - (corr/2) - (tick() - LastRegenTick))
        else
            print("waiting 2 = ", 0.7)
            wait(0.7)
        end
        PClick()
    end
end