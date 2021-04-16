local PlayerName = game.Players.LocalPlayer.Name.." "
------------------------------------------------
local DeathMessages = {
------------------------------------------------
"{System} "..PlayerName.."Died",
"{System} "..PlayerName.."OOF'd",
"{System} "..PlayerName.."Got obliterated"
------------------------------------------------
}

local function SendMessage(chatProperties) 
game:GetService('StarterGui'):SetCore('ChatMakeSystemMessage',chatProperties)
end

local player = game:GetService("Players").LocalPlayer

player.Character.Humanoid.Died:Connect(function()

SendMessage({
Text = DeathMessages[math.random(#DeathMessages)],
Color = Color3.fromRGB(225,225,225)
})

end)

player.CharacterAdded:Connect(function(Character)
Character:WaitForChild("Humanoid").Died:Connect(function()

SendMessage({
Text = DeathMessages[math.random(#DeathMessages)],
Color = Color3.fromRGB(225,225,225)
})

end)
end)
