-- Script dentro de um ServerScript
local Players = game:GetService("Players")

Players.PlayerAdded:Connect(function(player)
    player.Humanoid.TextColor = Color3.fromRGB(255, 0, 0) -- Muda a cor para vermelho
end)
