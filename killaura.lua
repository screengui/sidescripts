spawn(function()
        while getgenv().KillAura do
            for i,v in pairs(game.Players:GetPlayers()) do
                if v ~= game.Players.LocalPlayer and v.Character and game.Players.LocalPlayer:DistanceFromCharacter(v.Character.HumanoidRootPart.Position) < 16 then
                    game.ReplicatedStorage.GameRemotes.Attack:InvokeServer(v.Character)
                end
            end
            for i,v in pairs(game:GetService("Workspace").Animals:GetChildren()) do
                if v:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer:DistanceFromCharacter(v.HumanoidRootPart.Position) < 16 then
                    game.ReplicatedStorage.GameRemotes.AttackMob:InvokeServer(v)
                end
            end
            wait()
        end
    end)
