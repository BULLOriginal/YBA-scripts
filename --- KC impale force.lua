--- KC impale force
DeshAttackerConnection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if AttackerSkills[tostring(input.KeyCode)] and plrCharacter
    and not gameProcessed then
        if not IsOnCooldown(AttackerSkills[tostring(input.KeyCode)]) then
            local lookDirection = plrCharacter.HumanoidRootPart.CFrame.lookVector
            local attach = workspace.Living.TuskActor_4.StandMorph.HumanoidRootPart.StandAttach.AlignPosition
            local part = Instance.new("BodyForce", plrCharacter.StandMorph.HumanoidRootPart)
            workspace.Living.TuskActor_4.StandMorph.HumanoidRootPart.StandAttach.AlignPosition.MaxForce = 1000
            part.Force = lookDirection * -1000000
            wait(0.25)
            workspace.Living.TuskActor_4.StandMorph.HumanoidRootPart.StandAttach.AlignPosition.MaxForce = "inf"
            workspace.Living.TuskActor_4.StandMorph.HumanoidRootPart.StandAttach.AlignPosition.Responsiveness = 200
            wait(0.5)
            workspace.Living.TuskActor_4.StandMorph.HumanoidRootPart.StandAttach.AlignPosition.MaxForce = 100000
            part:Destroy()
        end
    end
end)